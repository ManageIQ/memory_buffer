# encoding: US-ASCII

require 'spec_helper'

describe MemoryBuffer do
  it 'has a version number' do
    expect(MemoryBuffer::VERSION).not_to be nil
  end

  it '.create_aligned_string' do
    alignment = 512
    length = 5
    buf = MemoryBuffer.create_aligned_string(alignment, length)
    expect(buf).to be_kind_of(String)
    expect(buf.length).to eq(0)
    expect(buf.bytesize).to eq(0)
  end

  MEMORY_SIZES = [
    1,
    MemoryBuffer::PACK_MIN - 1,
    MemoryBuffer::PACK_MIN,
    1024,
    1048576,
    MemoryBuffer::PACK_MAX,
    MemoryBuffer::PACK_MAX + 1,
    1073741824,
  ]

  MEMORY_SIZES.each do |bytes|
    it ".create_zero_buffer(#{bytes})" do
      buf = MemoryBuffer.create_zero_buffer(bytes)
      expect(buf.length).to eq(bytes)
      expect(buf[0, 1]).to  eq("\0")
      expect(buf[-1, 1]).to eq("\0")
      
      # GC call required, otherwise the * operator in
      # MemoryBuffer automatically fails on higher sizes
      buf = nil
      GC.start
    end
  end

  it('.create_quad_buffer')  { expect(MemoryBuffer.create_quad_buffer).to  eq([0].pack("Q")) }
  it('.create_long_buffer')  { expect(MemoryBuffer.create_long_buffer).to  eq([0].pack("L")) }
  it('.create_short_buffer') { expect(MemoryBuffer.create_short_buffer).to eq([0].pack("S")) }
end
