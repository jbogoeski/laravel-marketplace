<template>
    <div>
        <form>
            <div class="form-group">
                <input
                    v-model="term"
                    type="text"
                    class="form-control"
                    :class="{ 'is-invalid': error }"
                    id="searchProjects"
                    @keydown="handleKeyDown"
                    @keyup="handleKeyUp"
                    placeholder="Search projects by name or description"
                />
                <p v-if="error" class="invalid-feedback">{{ error }}</p>
            </div>
        </form>

        <open-projects />
    </div>
</template>

<script>
import Bus from '../bus';

export default {
    data() {
        return {
            term: '',
            searchTimer: null,
            error: '',
        };
    },
    methods: {
        handleKeyDown() {
            this.error = '';
            if (this.searchTimer !== null) {
                clearTimeout(this.searchTimer);
            }
        },
        handleKeyUp() {
            this.searchTimer = setTimeout(this._submitSearch, 3000);
        },
        _submitSearch() {
            if (this.term === '') {
                Bus.$emit('empty-search-term');
                return;
            }

            axios.post('/projects/search-open', { term: this.term })
                .then(response => {
                    Bus.$emit('search-response', response.data);
                })
                .catch(error => {
                    if (error.response.status === 422) {
                        this.error = error.response.data.errors.term[0];
                    } else {
                        this.error = 'Something went wrong!';
                    }
                });
        },
    },
}
</script>
