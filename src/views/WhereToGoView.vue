<template>
    <div class="wherePage">
        <h2>Куда сходить?</h2>
        <meta tagname="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">

        <div class="search-wrapper">
            <div class="background-gradient">
                <div class="search-field">
                    <svg class="search-icon" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M7.42857 0C9.39875 0 11.2882 0.782651 12.6814 2.17578C14.0745 3.56891 14.8571 5.45839 14.8571 7.42857C14.8571 9.26857 14.1829 10.96 13.0743 12.2629L13.3829 12.5714H14.2857L20 18.2857L18.2857 20L12.5714 14.2857V13.3829L12.2629 13.0743C10.96 14.1829 9.26857 14.8571 7.42857 14.8571C5.45839 14.8571 3.56891 14.0745 2.17578 12.6814C0.782651 11.2882 0 9.39875 0 7.42857C0 5.45839 0.782651 3.56891 2.17578 2.17578C3.56891 0.782651 5.45839 0 7.42857 0ZM7.42857 2.28571C4.57143 2.28571 2.28571 4.57143 2.28571 7.42857C2.28571 10.2857 4.57143 12.5714 7.42857 12.5714C10.2857 12.5714 12.5714 10.2857 12.5714 7.42857C12.5714 4.57143 10.2857 2.28571 7.42857 2.28571Z" fill="white"/>
                    </svg>

                    <input v-model="searchText" type="text" placeholder="Найти..." class="search-input">
                    <div class="delete-text" @click="searchText = ''">
                        <svg v-if="searchText.length > 0" width="10" height="10" viewBox="0 0 10 10" fill="white" xmlns="http://www.w3.org/2000/svg">
                            <path d="M5.97331 5L9.66665 8.69333V9.66667H8.69331L4.99998 5.97333L1.30665 9.66667H0.333313V8.69333L4.02665 5L0.333313 1.30667V0.333332H1.30665L4.99998 4.02667L8.69331 0.333332H9.66665V1.30667L5.97331 5Z" fill="#ffffff"/>
                        </svg>
                    </div>
                </div>
            </div>
        </div>

        <div class="tags">
            <div @click="appendTag('1')" :class="{'tag-active' : isTagInUse('1'), 'tag' : !(isTagInUse('1'))}">
                <img src="../assets/images/icons/Smiling Face With Hearts.png" class="tag-pic" alt="">
                <h6>физика</h6>
            </div>
            <div @click="appendTag('2')" :class="{'tag-active' : isTagInUse('2'), 'tag' : !(isTagInUse('2'))}">
                <img src="../assets/images/icons/Smiling Face With Hearts.png" class="tag-pic" alt="">
                <h6>диффуры и ряды</h6>
            </div>
            <div @click="appendTag('3')" :class="{'tag-active' : isTagInUse('3'), 'tag' : !(isTagInUse('3'))}">
                <img src="../assets/images/icons/Smiling Face With Hearts.png" class="tag-pic" alt="">
                <h6>физра</h6>
            </div>
            <div @click="appendTag('4')" :class="{'tag-active' : isTagInUse('4'), 'tag' : !(isTagInUse('4'))}">
                <img src="../assets/images/icons/Smiling Face With Hearts.png" class="tag-pic" alt="">
                <h6>линал</h6>
            </div>
            <div @click="appendTag('5')" :class="{'tag-active' : isTagInUse('5'), 'tag' : !(isTagInUse('5'))}">
                <img src="../assets/images/icons/Smiling Face With Hearts.png" class="tag-pic" alt="">
                <h6>овп</h6>
            </div>
        </div>
        <p>{{ tags }}</p>
    </div>
</template>

<script>
export default {
    data () {
        return {
            searchText: '',

            tags: [],
        }
    },
    methods:{
        appendTag(entity) {
            const index = this.tags.indexOf(entity);
            if (index === -1) {
                this.tags.push(entity);
            } else {
                this.tags.splice(index, 1);
            }
        },
        isTagInUse(entity){
            return this.tags.indexOf(entity) == -1 ? 0 : 1
        }
    }
}
</script>

<style scoped>
.tag-active{
    border: 1px solid #433E45;
    background: linear-gradient(197deg, rgba(67,65,69,1) 0%, rgba(66,64,68,1) 22%, rgba(53,48,65,1) 45%, rgba(51,44,58,1) 69%, rgba(28,27,28,1) 100%);
    height: 48px;
    display: flex;
    align-items: center;
    gap: 10px;
    width: fit-content;
    padding: 0 16px;
    border-radius: 15px;
}
.tags{
    display: flex;
    width: 100%;
    overflow: scroll;
    margin-top: 20px;
    gap: 10px;
}
.tag-pic{
    height: 26px;
    width: 26px;
}
.tag{
    background-color: #121212;
    border: 1px solid #433E45;
    border-radius: 15px;
    height: 48px;
    display: flex;
    align-items: center;
    gap: 10px;
    width: fit-content;
    padding: 0 16px;
}

h6{
    font-weight: 500;
    white-space: nowrap;
}
.delete-text{
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
    width: 40px;
    position: absolute;
    right: 5px;
}
.search-icon{
    margin-left: 16px;
}
.search-input{
    border: none;
    width: 100%;
    background-color: transparent;
    color: white;
    font-size: 14px;
    font-family: 'Montserrat';
    height: 100%;
}
.search-input:focus{
    outline: none;
    border: 1px solid var(--main-accent);
}
.search-field{
    position: relative;
    background-color: #121212;
    width: 100%;
    height: 100%;
    border-radius: 15px;
    display: flex;
    gap: 15px;
    align-items: center;
}
.background-gradient{
    background: linear-gradient(90deg, rgba(130,252,245,1) 0%, rgba(196,167,251,1) 34%, rgba(221,167,189,1) 65%, rgba(245,173,115,1) 100%);
    height: 48px;
    padding: 1px;
    border-radius: 15px;
}
.search-wrapper{
    margin-top: 26px;
}
.wherePage{
    padding: 12px;
}
</style>