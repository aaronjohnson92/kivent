from cpython cimport bool

cdef class Buffer:
    cdef unsigned int size
    cdef void* data
    cdef unsigned int used_count
    cdef list free_blocks
    cdef unsigned int free_block_count
    cdef unsigned int type_size
    cdef unsigned int data_in_free
    cdef unsigned int real_size
    cdef unsigned int size_in_blocks

    cdef unsigned int add_data(self, unsigned int block_count) except -1
    cdef void remove_data(self, unsigned int block_index,
        unsigned int block_count)
    cdef unsigned int get_largest_free_block(self)
    cdef unsigned int get_first_free_block_that_fits(self,
        unsigned int block_count)
    cdef unsigned int get_blocks_on_tail(self)
    cdef bool can_fit_data(self, unsigned int block_count)
    cdef void clear(self)
    cdef void* get_pointer(self, unsigned int block_index) except NULL
    cdef void deallocate_memory(self)
    cdef void* allocate_memory(self) except NULL
    cdef bool check_empty(self)
    cdef unsigned int get_offset(self, unsigned int block_index)

cdef class NoFreeBuffer:
    cdef size_t size
    cdef void* data
    cdef size_t used_count
    cdef size_t type_size
    cdef size_t size_in_blocks
    cdef size_t real_size

    cdef size_t add_data(self, size_t block_count) except -1
    cdef size_t get_blocks_on_tail(self)
    cdef bool can_fit_data(self, size_t block_count)
    cdef void deallocate_memory(self)
    cdef void* allocate_memory(self) except NULL
    cdef void* get_pointer(self, size_t block_index) except NULL
    cdef bool check_empty(self)
    cdef size_t get_offset(self, size_t block_index)
    cdef void clear(self)


