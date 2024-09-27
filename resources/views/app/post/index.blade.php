<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('NexmedisSocMed') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            {{-- <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    {{ __("You're logged in!") }}
                </div>
            </div> --}}



        </div>
    </div>


    <div class="absolute right-4">
        <!-- Modal toggle -->
        <button data-modal-target="static-modal" data-modal-toggle="static-modal"
            class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
            type="button">
            Tambah Posting
        </button>
    </div>

    <!-- Main modal -->
    <div id="static-modal" data-modal-backdrop="static" tabindex="-1" aria-hidden="true"
        class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
        <div class="relative p-4 w-full max-w-2xl max-h-full">
            <!-- Modal content -->
            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                <!-- Modal header -->
                <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                        Buat Postingan
                    </h3>
                    <button type="button"
                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                        data-modal-hide="static-modal">
                        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                            viewBox="0 0 14 14">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                        </svg>
                        <span class="sr-only">Close modal</span>
                    </button>
                </div>
                <!-- Modal body -->
                <div class="p-4">
                    <form action="{{ url('/buat-postingan') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="flex w-full flex-row space-x-4">
                            {{-- Right --}}
                            <div class="w-1/2">
                                <x-input-label for="judulPost" :value="__('Judul Postingan')" />
                                <x-text-input class="my-2 block w-full" id="judulPost" name="judulPost" type="text"
                                    required autofocus />
                                @error('judulPost')
                                    <small class="text-red-400">
                                        {{ $message }}
                                    </small>
                                @enderror
                            </div>
                        </div>
                        <div class="flex w-full flex-row space-x-4">
                            <div class="flex w-1/2 flex-col">
                                <x-input-label for="postingan" :value="__('Konten Sub Materi')" />
                                <textarea id="postingan" name="postingan"
                                    class="my-2 min-h-36 w-full resize-none overflow-auto rounded border-2 border-gray-200 font-body text-primary-800 focus:border-secondary-400 focus:bg-gray-100 focus:shadow focus:ring-transparent"></textarea>
                                @error('postingan')
                                    <small class="font-head text-red-400">
                                        {{ $message }}
                                    </small>
                                @enderror
                            </div>

                            <div class="w-1/3">
                                <div class="form-group flex w-full flex-col gap-2">
                                    <x-input-label for="fileImage" :value="__('Tambah Foto?')" />
                                    <input type="file"
                                        class="form-control rounded border-2 border-gray-200 uppercase outline-none file:rounded-md file:uppercase focus:outline-none"
                                        id="fileImage" name="fileImage">
                                </div>
                            </div>
                        </div>
                        <div class="flex justify-end pt-2">
                            <button type="submit"
                                class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Posting</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <div>
        <div class="container mx-auto">
            <div class="flex flex-wrap -mx-4">
                @forelse ($posts as $post)
                    <div class="w-full md:w-1/3 px-4 mb-6">
                        <div class="bg-white shadow-md rounded-lg overflow-hidden">
                            <div class="product-card-img">
                                <img src="{{ $post->fileImage ? asset('posts/images/' . $post->fileImage) : asset('posts/images/default-image.jpg') }}"
                                    alt="{{ $post->fileImage ?? 'Default Image' }}" loading="lazy"
                                    class="w-full h-64 object-cover">

                            </div>
                            <div class="p-4">
                                <h5 class="text-lg font-semibold">
                                    {{ $post->pembuatPost->name }}
                                </h5>
                                <h5 class="text-lg font-semibold">
                                    {{ $post->judulPost }}
                                </h5>
                                <div class="mt-2">
                                    {{ Str::limit($post->postingan, 100) }}
                                </div>

                                <!-- Modal toggle -->
                                <button data-modal-target="static-modal-update-{{ $post->id }}"
                                    data-modal-toggle="static-modal-update-{{ $post->id }}"
                                    class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                    type="button">
                                    Edit
                                </button>

                                <!-- Main modal -->
                                <div id="static-modal-update-{{ $post->id }}" data-modal-backdrop="static"
                                    tabindex="-1" aria-hidden="true"
                                    class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                                    <div class="relative p-4 w-full max-w-2xl max-h-full">
                                        <!-- Modal content -->
                                        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                            <!-- Modal header -->
                                            <div
                                                class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                                                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                    Edit Postingan
                                                </h3>
                                                <button type="button"
                                                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                                    data-modal-hide="static-modal-update-{{ $post->id }}">
                                                    <svg class="w-3 h-3" aria-hidden="true"
                                                        xmlns="http://www.w3.org/2000/svg" fill="none"
                                                        viewBox="0 0 14 14">
                                                        <path stroke="currentColor" stroke-linecap="round"
                                                            stroke-linejoin="round" stroke-width="2"
                                                            d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                                                    </svg>
                                                    <span class="sr-only">Close modal</span>
                                                </button>
                                            </div>
                                            <!-- Modal body -->
                                            <div class="p-4">
                                                <form action="{{ url('edit-postingan/' . $post->id) }}"
                                                    method="POST" enctype="multipart/form-data">
                                                    @csrf
                                                    @method('PUT')
                                                    <div class="flex w-full flex-row space-x-4">
                                                        {{-- Right --}}
                                                        <div class="w-1/2">
                                                            <x-input-label for="judulPost" :value="__('Judul Postingan')" />
                                                            <x-text-input class="my-2 block w-full" id="judulPost"
                                                                name="judulPost" type="text"
                                                                value="{{ $post->judulPost }}" required autofocus />
                                                            @error('judulPost')
                                                                <small class="text-red-400">
                                                                    {{ $message }}
                                                                </small>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="flex w-full flex-row space-x-4">
                                                        <div class="flex w-1/2 flex-col">
                                                            <x-input-label for="postingan" :value="__('Konten Sub Materi')" />
                                                            <textarea id="postingan" name="postingan"
                                                                class="my-2 min-h-36 w-full resize-none overflow-auto rounded border-2 border-gray-200 font-body text-primary-800 focus:border-secondary-400 focus:bg-gray-100 focus:shadow focus:ring-transparent">{{ $post->postingan }}</textarea>
                                                            @error('postingan')
                                                                <small class="font-head text-red-400">
                                                                    {{ $message }}
                                                                </small>
                                                            @enderror
                                                        </div>

                                                        <div class="w-1/3">
                                                            <div class="form-group flex w-full flex-col gap-2">
                                                                <x-input-label for="fileImage" :value="__('Tambah Foto?')" />
                                                                {{-- <input type="file"
                                                                    class="form-control rounded border-2 border-gray-200 uppercase outline-none file:rounded-md file:uppercase focus:outline-none"
                                                                    id="fileImage" name="fileImage"> --}}
                                                                <span
                                                                    class="font-bold">{{ basename($post->fileImage) }}</span>
                                                                <input type="file" name="fileImage" id="fileImage"
                                                                    class="form-control rounded border-2 border-gray-200 uppercase outline-none file:rounded-md file:uppercase focus:outline-none">
                                                                <input type="number" name="id"
                                                                    value="{{ $post->id }}" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="flex justify-end pt-2">
                                                        <button type="submit"
                                                            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Update
                                                            Posting</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal toggle -->
                                <button data-modal-target="static-modal-delete-{{ $post->id }}"
                                    data-modal-toggle="static-modal-delete-{{ $post->id }}"
                                    class="block text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800"
                                    type="button">
                                    Hapus
                                </button>

                                <div class="fixed left-0 top-0 z-50 hidden h-full w-screen items-center justify-center overflow-y-auto overflow-x-hidden bg-gray-800/50"
                                    id="static-modal-delete-{{ $post->id }}" aria-hidden="true" tabindex="-1">
                                    <div class="relative max-h-full w-full max-w-4xl p-4">
                                        <!-- Modal Content -->
                                        <div class="relative rounded-md border border-gray-200 bg-white shadow">
                                            <!-- Modal Header -->
                                            <div
                                                class="flex items-center justify-between rounded-t bg-primary-100/25 p-4">
                                                <h3
                                                    class="font-head text-lg font-semibold text-primary-400 md:text-xl">
                                                    Hapus Postingan
                                                </h3>
                                                <button
                                                    class="flex w-max flex-row items-center justify-between rounded bg-red-400 p-2 font-head text-sm font-semibold text-white transition duration-200 hover:bg-red-600 md:text-base"
                                                    data-modal-hide="static-modal-delete-{{ $post->id }}"
                                                    type="button">
                                                    {{-- <x-heroicon-o-x-mark class="w-5" /> --}}
                                                    <span class="sr-only">Close Modal</span>
                                                </button>
                                            </div>
                                            <!-- Modal Body -->
                                            <div class="p-4">
                                                <form action="{{ url('hapus-postingan/' . $post->id) }}" method="POST">
                                                    @csrf
                                                    @method('delete')
                                                    <div class="text-center font-head text-lg font-semibold">
                                                        <p>
                                                            Anda Akan Menghapus Postingan
                                                            <span class="text-red-600">
                                                                {{ $post->judulPost }}
                                                            </span>
                                                            ?
                                                        </p>
                                                    </div>
                                                    <div class="flex justify-end pt-2">
                                                        <button class="dangers-button" type="submit">Hapus</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
            </div>
        @empty
            <div class="col-md-12">
                <div class="p-2">
                    <h4>No Posts Available</h4>
                </div>
            </div>
            @endforelse
        </div>
    </div>

    </div>
</x-app-layout>
