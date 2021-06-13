Locales['en'] = {
    ['document_deleted'] = "HAPUS DOKUMEN",
    ['document_delete_failed'] = "GAGAL MENGHAPUS DOKUMEN.",
    ['copy_from_player'] = "Kamu Menerima Dokumen Salinan.",
    ['from_copied_player'] = "Kamu Memberikan Dokumen Salinan",
    ['could_not_copy_form_player'] = "Could ~r~not~w~ copy form to player.",
    ['document_options'] = "MENU DOKUMEN",
    ['public_documents'] = "DOKUMEN PUBLIK",
    ['job_documents'] = "DOKUMEN PEKERJAAN",
    ['saved_documents'] = "DOKUMEN TERSIMPAN",
    ['close_bt'] = "TUTUP",
    ['no_player_found'] = "Tidak Ada Orang",
    ['go_back'] = "Kembali",
    ['view_bt'] = "Lihat",
    ['show_bt'] = "Menunjukan",
    ['give_copy'] = "Memberikan Salinan",
    ['delete_bt'] = "Hapus",
    ['yes_delete'] = "Ya Hapus",
}

Config.Documents['en'] = {
      ["public"] = {
        {
          headerTitle = "SURAT UMUM",
          headerSubtitle = "Yang Bertanda Tanggan Dibawah Ini",
          elements = {
            { label = "MENYATAKAN :", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "SURAT PERNYATAAN",
          headerSubtitle = "Yang Bertanda Tangan Dibawah Ini.",
          elements = {
            { label = "TANGGAL PERNYATAAN", type = "input", value = "", can_be_emtpy = false },
            { label = "MENYATAKAN :", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "SURAT PENJUALAN KENDARAAN",
          headerSubtitle = "Akta Jual Beli",
          elements = {
            { label = "NAMA PENERIMA", type = "input", value = "", can_be_emtpy = false },
            { label = "TANGGAL", type = "input", value = "", can_be_emtpy = false },
            { label = "HARGA JUAL", type = "input", value = "", can_be_empty = false },
            { label = "INFORMASI PENJUALAN", type = "textarea", value = "", can_be_emtpy = true },
          }
        },
        {
          headerTitle = "SURAT KUASA",
          headerSubtitle = "Yang Bertanda Tangan Dibawah Ini",
          elements = {
            { label = "NAMA KTP", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA STEAM", type = "input", value = "", can_be_emtpy = false },
            { label = "KUASA ATAS", type = "input", value = "", can_be_empty = false },
            { label = "MASA BERLAKU", type = "input", value = "", can_be_empty = false },
            { label = "KETERANGAN KUASA", type = "textarea", value = "", can_be_emtpy = true },
          }
        }
      },
      ["police"] = {
        {
          headerTitle = "SURAT IZIN KERAMAIAN",
          headerSubtitle = "Yang Bertanda Tanggan Dibawah Ini",
          elements = {
            { label = "NAMA KTP", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA STEAM", type = "input", value = "", can_be_emtpy = false },
            { label = "MASA BERLAKU", type = "input", value = "", can_be_empty = false },
            { label = "INFORMASI", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
		{
          headerTitle = "SURAT TANDA NOMOR KENDARAAN - STNK",
          headerSubtitle = "Yang Bertanda Tanggan Dibawah Ini",
          elements = {
             { label = "NAMA KTP", type = "input", value = "", can_be_emtpy = false },
            { label = "NOMOR KENDARAAN", type = "input", value = "", can_be_emtpy = false },
            { label = "MASA BERLAKU", type = "input", value = "", can_be_empty = false },
            { label = "INFORMASI", type = "textarea", value = "", can_be_emtpy = false},
          }
        },
        {
          headerTitle = "SKCK",
          headerSubtitle = "Yang Bertanda Tanggan Dibawah Ini",
          elements = {
            { label = "NAMA KTP", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA STEAM", type = "input", value = "", can_be_emtpy = false },
            { label = "MASA BERLAKU", type = "input", value = "", can_be_empty = false },
            { label = "CATATAN KEJAHATAN", type = "textarea", value = "", can_be_emtpy = false},
          }         }
      },
      ["ambulance"] = {
        {
          headerTitle = "CATATAN REKAM MEDIS",
          headerSubtitle = "Yang Bertanda Tanggan Dibawah Ini",
          elements = {
            { label = "NAMA KTP", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA STEAM", type = "input", value = "", can_be_emtpy = false },
            { label = "MASA BERLAKU", type = "input", value = "", can_be_empty = false },
            { label = "INFORMASI", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "BPJS",
          headerSubtitle = "Yang Bertanda Tangan dibawah Ini",
          elements = {
            { label = "NAMA KTP", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA STEAM", type = "input", value = "", can_be_emtpy = false },
            { label = "MASA BERLAKU", type = "input", value = "", can_be_empty = false },
            { label = "INFORMASI", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "ASURANSI KEMATIAN",
          headerSubtitle = "Yang Bertanda Tangan dibawah Ini",
          elements = {
            { label = "NAMA KTP", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA STEAM", type = "input", value = "", can_be_emtpy = false },
            { label = "MASA BERLAKU", type = "input", value = "", can_be_empty = false },
            { label = "INFORMASI", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "SURAT IZIN PENGGUNAAN BARANG TERLARANG",
          headerSubtitle = "Yang Bertanda Tangan dibawah Ini",
          elements = {
            { label = "NAMA KTP", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA STEAM", type = "input", value = "", can_be_emtpy = false },
            { label = "MASA BERLAKU", type = "input", value = "", can_be_empty = false },
            { label = "INFORMASI", type = "textarea", value = "", can_be_emtpy = false, can_be_edited = false },
          }
        },

      ["avocat"] = {
        {
          headerTitle = "LEGAL SERVICES CONTRACT",
          headerSubtitle = "Legal services contract provided by a lawyer.",
          elements = {
            { label = "CITIZEN FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "CITIZEN LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "MASA BERLAKU", type = "input", value = "", can_be_empty = false },
            { label = "INFORMATION", type = "textarea", value = "", can_be_emtpy = false },
          }
        }
      }
    }
  }
