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
end
