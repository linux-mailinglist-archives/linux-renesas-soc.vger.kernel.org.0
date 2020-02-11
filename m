Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A877159810
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730201AbgBKSTp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:45 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:34422 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731097AbgBKSTg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:36 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id 1WKV2200Y5USYZQ01WKWUK; Tue, 11 Feb 2020 19:19:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002op-7F; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003zE-56; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 24/34] crypto: ccree - improve kerneldoc in cc_hw_queue_defs.h
Date:   Tue, 11 Feb 2020 19:19:18 +0100
Message-Id: <20200211181928.15178-25-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Miscellaneous improvements:
  - Start comment blocks with "/**" to enable kerneldoc,
  - Fix descriptor type of set_dout_mlli(),
  - Fix copied config parameter of set_cipher_config1(),
  - Fix copied config parameter of set_bytes_swap(),
  - Add missing function names to kerneldoc headers,
  - Add missing parameter descriptions,
  - Remove descriptions for nonexistent parameters,
  - Add missing colons,
  - Remove references to obsolete camelcase parameter names,
  - Sort according to actual parameter order,
  - Fix grammar and spelling.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_hw_queue_defs.h | 237 ++++++++++++------------
 1 file changed, 119 insertions(+), 118 deletions(-)

diff --git a/drivers/crypto/ccree/cc_hw_queue_defs.h b/drivers/crypto/ccree/cc_hw_queue_defs.h
index 36786344c57a92cf..25ef286699892df5 100644
--- a/drivers/crypto/ccree/cc_hw_queue_defs.h
+++ b/drivers/crypto/ccree/cc_hw_queue_defs.h
@@ -207,31 +207,32 @@ enum cc_hash_cipher_pad {
 /* Descriptor packing macros */
 /*****************************/
 
-/*
- * Init a HW descriptor struct
- * @pdesc: pointer HW descriptor struct
+/**
+ * hw_desc_init() - Init a HW descriptor struct
+ * @pdesc: pointer to HW descriptor struct
  */
 static inline void hw_desc_init(struct cc_hw_desc *pdesc)
 {
 	memset(pdesc, 0, sizeof(struct cc_hw_desc));
 }
 
-/*
- * Indicates the end of current HW descriptors flow and release the HW engines.
+/**
+ * set_queue_last_ind_bit() - Indicate the end of current HW descriptors flow
+ * and release the HW engines.
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  */
 static inline void set_queue_last_ind_bit(struct cc_hw_desc *pdesc)
 {
 	pdesc->word[3] |= FIELD_PREP(WORD3_QUEUE_LAST_IND, 1);
 }
 
-/*
- * Set the DIN field of a HW descriptors
+/**
+ * set_din_type() - Set the DIN field of a HW descriptor
  *
- * @pdesc: pointer HW descriptor struct
- * @dma_mode: dmaMode The DMA mode: NO_DMA, SRAM, DLLI, MLLI, CONSTANT
- * @addr: dinAdr DIN address
+ * @pdesc: Pointer to HW descriptor struct
+ * @dma_mode: The DMA mode: NO_DMA, SRAM, DLLI, MLLI, CONSTANT
+ * @addr: DIN address
  * @size: Data size in bytes
  * @axi_sec: AXI secure bit
  */
@@ -248,11 +249,11 @@ static inline void set_din_type(struct cc_hw_desc *pdesc,
 				FIELD_PREP(WORD1_NS_BIT, axi_sec);
 }
 
-/*
- * Set the DIN field of a HW descriptors to NO DMA mode.
+/**
+ * set_din_no_dma() - Set the DIN field of a HW descriptor to NO DMA mode.
  * Used for NOP descriptor, register patches and other special modes.
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  * @addr: DIN address
  * @size: Data size in bytes
  */
@@ -262,14 +263,11 @@ static inline void set_din_no_dma(struct cc_hw_desc *pdesc, u32 addr, u32 size)
 	pdesc->word[1] |= FIELD_PREP(WORD1_DIN_SIZE, size);
 }
 
-/*
- * Setup the special CPP descriptor
+/**
+ * set_cpp_crypto_key() - Setup the special CPP descriptor
  *
- * @pdesc: pointer HW descriptor struct
- * @alg: cipher used (AES / SM4)
- * @mode: mode used (CTR or CBC)
- * @slot: slot number
- * @ksize: key size
+ * @pdesc: Pointer to HW descriptor struct
+ * @slot: Slot number
  */
 static inline void set_cpp_crypto_key(struct cc_hw_desc *pdesc, u8 slot)
 {
@@ -281,14 +279,14 @@ static inline void set_cpp_crypto_key(struct cc_hw_desc *pdesc, u8 slot)
 	pdesc->word[4] |= FIELD_PREP(WORD4_SETUP_OPERATION, slot);
 }
 
-/*
- * Set the DIN field of a HW descriptors to SRAM mode.
+/**
+ * set_din_sram() - Set the DIN field of a HW descriptor to SRAM mode.
  * Note: No need to check SRAM alignment since host requests do not use SRAM and
- * adaptor will enforce alignment check.
+ * the adaptor will enforce alignment checks.
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  * @addr: DIN address
- * @size Data size in bytes
+ * @size: Data size in bytes
  */
 static inline void set_din_sram(struct cc_hw_desc *pdesc, u32 addr, u32 size)
 {
@@ -297,10 +295,10 @@ static inline void set_din_sram(struct cc_hw_desc *pdesc, u32 addr, u32 size)
 				FIELD_PREP(WORD1_DIN_DMA_MODE, DMA_SRAM);
 }
 
-/*
- * Set the DIN field of a HW descriptors to CONST mode
+/**
+ * set_din_const() - Set the DIN field of a HW descriptor to CONST mode
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  * @val: DIN const value
  * @size: Data size in bytes
  */
@@ -312,20 +310,20 @@ static inline void set_din_const(struct cc_hw_desc *pdesc, u32 val, u32 size)
 			FIELD_PREP(WORD1_DIN_SIZE, size);
 }
 
-/*
- * Set the DIN not last input data indicator
+/**
+ * set_din_not_last_indication() - Set the DIN not last input data indicator
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  */
 static inline void set_din_not_last_indication(struct cc_hw_desc *pdesc)
 {
 	pdesc->word[1] |= FIELD_PREP(WORD1_NOT_LAST, 1);
 }
 
-/*
- * Set the DOUT field of a HW descriptors
+/**
+ * set_dout_type() - Set the DOUT field of a HW descriptor
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  * @dma_mode: The DMA mode: NO_DMA, SRAM, DLLI, MLLI, CONSTANT
  * @addr: DOUT address
  * @size: Data size in bytes
@@ -344,15 +342,15 @@ static inline void set_dout_type(struct cc_hw_desc *pdesc,
 				FIELD_PREP(WORD3_NS_BIT, axi_sec);
 }
 
-/*
- * Set the DOUT field of a HW descriptors to DLLI type
+/**
+ * set_dout_dlli() - Set the DOUT field of a HW descriptor to DLLI type
  * The LAST INDICATION is provided by the user
  *
- * @pdesc pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  * @addr: DOUT address
  * @size: Data size in bytes
- * @last_ind: The last indication bit
  * @axi_sec: AXI secure bit
+ * @last_ind: The last indication bit
  */
 static inline void set_dout_dlli(struct cc_hw_desc *pdesc, dma_addr_t addr,
 				 u32 size, enum cc_axi_sec axi_sec,
@@ -362,15 +360,15 @@ static inline void set_dout_dlli(struct cc_hw_desc *pdesc, dma_addr_t addr,
 	pdesc->word[3] |= FIELD_PREP(WORD3_DOUT_LAST_IND, last_ind);
 }
 
-/*
- * Set the DOUT field of a HW descriptors to DLLI type
+/**
+ * set_dout_mlli() - Set the DOUT field of a HW descriptor to MLLI type
  * The LAST INDICATION is provided by the user
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  * @addr: DOUT address
  * @size: Data size in bytes
- * @last_ind: The last indication bit
  * @axi_sec: AXI secure bit
+ * @last_ind: The last indication bit
  */
 static inline void set_dout_mlli(struct cc_hw_desc *pdesc, u32 addr, u32 size,
 				 enum cc_axi_sec axi_sec, bool last_ind)
@@ -379,11 +377,11 @@ static inline void set_dout_mlli(struct cc_hw_desc *pdesc, u32 addr, u32 size,
 	pdesc->word[3] |= FIELD_PREP(WORD3_DOUT_LAST_IND, last_ind);
 }
 
-/*
- * Set the DOUT field of a HW descriptors to NO DMA mode.
+/**
+ * set_dout_no_dma() - Set the DOUT field of a HW descriptor to NO DMA mode.
  * Used for NOP descriptor, register patches and other special modes.
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: pointer to HW descriptor struct
  * @addr: DOUT address
  * @size: Data size in bytes
  * @write_enable: Enables a write operation to a register
@@ -396,54 +394,55 @@ static inline void set_dout_no_dma(struct cc_hw_desc *pdesc, u32 addr,
 			FIELD_PREP(WORD3_DOUT_LAST_IND, write_enable);
 }
 
-/*
- * Set the word for the XOR operation.
+/**
+ * set_xor_val() - Set the word for the XOR operation.
  *
- * @pdesc: pointer HW descriptor struct
- * @val: xor data value
+ * @pdesc: Pointer to HW descriptor struct
+ * @val: XOR data value
  */
 static inline void set_xor_val(struct cc_hw_desc *pdesc, u32 val)
 {
 	pdesc->word[2] = val;
 }
 
-/*
- * Sets the XOR indicator bit in the descriptor
+/**
+ * set_xor_active() - Set the XOR indicator bit in the descriptor
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  */
 static inline void set_xor_active(struct cc_hw_desc *pdesc)
 {
 	pdesc->word[3] |= FIELD_PREP(WORD3_HASH_XOR_BIT, 1);
 }
 
-/*
- * Select the AES engine instead of HASH engine when setting up combined mode
- * with AES XCBC MAC
+/**
+ * set_aes_not_hash_mode() - Select the AES engine instead of HASH engine when
+ * setting up combined mode with AES XCBC MAC
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  */
 static inline void set_aes_not_hash_mode(struct cc_hw_desc *pdesc)
 {
 	pdesc->word[4] |= FIELD_PREP(WORD4_AES_SEL_N_HASH, 1);
 }
 
-/*
- * Set aes xor crypto key, this in some secenrios select SM3 engine
+/**
+ * set_aes_xor_crypto_key() - Set aes xor crypto key, which in some scenarios
+ * selects the SM3 engine
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  */
 static inline void set_aes_xor_crypto_key(struct cc_hw_desc *pdesc)
 {
 	pdesc->word[4] |= FIELD_PREP(WORD4_AES_XOR_CRYPTO_KEY, 1);
 }
 
-/*
- * Set the DOUT field of a HW descriptors to SRAM mode
+/**
+ * set_dout_sram() - Set the DOUT field of a HW descriptor to SRAM mode
  * Note: No need to check SRAM alignment since host requests do not use SRAM and
- * adaptor will enforce alignment check.
+ * the adaptor will enforce alignment checks.
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  * @addr: DOUT address
  * @size: Data size in bytes
  */
@@ -454,32 +453,34 @@ static inline void set_dout_sram(struct cc_hw_desc *pdesc, u32 addr, u32 size)
 			FIELD_PREP(WORD3_DOUT_SIZE, size);
 }
 
-/*
- * Sets the data unit size for XEX mode in data_out_addr[15:0]
+/**
+ * set_xex_data_unit_size() - Set the data unit size for XEX mode in
+ * data_out_addr[15:0]
  *
- * @pdesc: pDesc pointer HW descriptor struct
- * @size: data unit size for XEX mode
+ * @pdesc: Pointer to HW descriptor struct
+ * @size: Data unit size for XEX mode
  */
 static inline void set_xex_data_unit_size(struct cc_hw_desc *pdesc, u32 size)
 {
 	pdesc->word[2] = size;
 }
 
-/*
- * Set the number of rounds for Multi2 in data_out_addr[15:0]
+/**
+ * set_multi2_num_rounds() - Set the number of rounds for Multi2 in
+ * data_out_addr[15:0]
  *
- * @pdesc: pointer HW descriptor struct
- * @num: number of rounds for Multi2
+ * @pdesc: Pointer to HW descriptor struct
+ * @num: Number of rounds for Multi2
  */
 static inline void set_multi2_num_rounds(struct cc_hw_desc *pdesc, u32 num)
 {
 	pdesc->word[2] = num;
 }
 
-/*
- * Set the flow mode.
+/**
+ * set_flow_mode() - Set the flow mode.
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  * @mode: Any one of the modes defined in [CC7x-DESC]
  */
 static inline void set_flow_mode(struct cc_hw_desc *pdesc,
@@ -488,22 +489,22 @@ static inline void set_flow_mode(struct cc_hw_desc *pdesc,
 	pdesc->word[4] |= FIELD_PREP(WORD4_DATA_FLOW_MODE, mode);
 }
 
-/*
- * Set the cipher mode.
+/**
+ * set_cipher_mode() - Set the cipher mode.
  *
- * @pdesc: pointer HW descriptor struct
- * @mode:  Any one of the modes defined in [CC7x-DESC]
+ * @pdesc: Pointer to HW descriptor struct
+ * @mode: Any one of the modes defined in [CC7x-DESC]
  */
 static inline void set_cipher_mode(struct cc_hw_desc *pdesc, int mode)
 {
 	pdesc->word[4] |= FIELD_PREP(WORD4_CIPHER_MODE, mode);
 }
 
-/*
- * Set the cipher mode for hash algorithms.
+/**
+ * set_hash_cipher_mode() - Set the cipher mode for hash algorithms.
  *
- * @pdesc: pointer HW descriptor struct
- * @cipher_mode:  Any one of the modes defined in [CC7x-DESC]
+ * @pdesc: Pointer to HW descriptor struct
+ * @cipher_mode: Any one of the modes defined in [CC7x-DESC]
  * @hash_mode: specifies which hash is being handled
  */
 static inline void set_hash_cipher_mode(struct cc_hw_desc *pdesc,
@@ -515,10 +516,10 @@ static inline void set_hash_cipher_mode(struct cc_hw_desc *pdesc,
 		set_aes_xor_crypto_key(pdesc);
 }
 
-/*
- * Set the cipher configuration fields.
+/**
+ * set_cipher_config0() - Set the cipher configuration fields.
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  * @mode: Any one of the modes defined in [CC7x-DESC]
  */
 static inline void set_cipher_config0(struct cc_hw_desc *pdesc, int mode)
@@ -526,11 +527,11 @@ static inline void set_cipher_config0(struct cc_hw_desc *pdesc, int mode)
 	pdesc->word[4] |= FIELD_PREP(WORD4_CIPHER_CONF0, mode);
 }
 
-/*
- * Set the cipher configuration fields.
+/**
+ * set_cipher_config1() - Set the cipher configuration fields.
  *
- * @pdesc: pointer HW descriptor struct
- * @config: Any one of the modes defined in [CC7x-DESC]
+ * @pdesc: Pointer to HW descriptor struct
+ * @config: Padding mode
  */
 static inline void set_cipher_config1(struct cc_hw_desc *pdesc,
 				      enum cc_hash_conf_pad config)
@@ -538,10 +539,10 @@ static inline void set_cipher_config1(struct cc_hw_desc *pdesc,
 	pdesc->word[4] |= FIELD_PREP(WORD4_CIPHER_CONF1, config);
 }
 
-/*
- * Set HW key configuration fields.
+/**
+ * set_hw_crypto_key() - Set HW key configuration fields.
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  * @hw_key: The HW key slot asdefined in enum cc_hw_crypto_key
  */
 static inline void set_hw_crypto_key(struct cc_hw_desc *pdesc,
@@ -553,64 +554,64 @@ static inline void set_hw_crypto_key(struct cc_hw_desc *pdesc,
 				   (hw_key >> HW_KEY_SHIFT_CIPHER_CFG2));
 }
 
-/*
- * Set byte order of all setup-finalize descriptors.
+/**
+ * set_bytes_swap() - Set byte order of all setup-finalize descriptors.
  *
- * @pdesc: pointer HW descriptor struct
- * @config: Any one of the modes defined in [CC7x-DESC]
+ * @pdesc: Pointer to HW descriptor struct
+ * @config: True to enable byte swapping
  */
 static inline void set_bytes_swap(struct cc_hw_desc *pdesc, bool config)
 {
 	pdesc->word[4] |= FIELD_PREP(WORD4_BYTES_SWAP, config);
 }
 
-/*
- * Set CMAC_SIZE0 mode.
+/**
+ * set_cmac_size0_mode() - Set CMAC_SIZE0 mode.
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  */
 static inline void set_cmac_size0_mode(struct cc_hw_desc *pdesc)
 {
 	pdesc->word[4] |= FIELD_PREP(WORD4_CMAC_SIZE0, 1);
 }
 
-/*
- * Set key size descriptor field.
+/**
+ * set_key_size() - Set key size descriptor field.
  *
- * @pdesc: pointer HW descriptor struct
- * @size: key size in bytes (NOT size code)
+ * @pdesc: Pointer to HW descriptor struct
+ * @size: Key size in bytes (NOT size code)
  */
 static inline void set_key_size(struct cc_hw_desc *pdesc, u32 size)
 {
 	pdesc->word[4] |= FIELD_PREP(WORD4_KEY_SIZE, size);
 }
 
-/*
- * Set AES key size.
+/**
+ * set_key_size_aes() - Set AES key size.
  *
- * @pdesc: pointer HW descriptor struct
- * @size: key size in bytes (NOT size code)
+ * @pdesc: Pointer to HW descriptor struct
+ * @size: Key size in bytes (NOT size code)
  */
 static inline void set_key_size_aes(struct cc_hw_desc *pdesc, u32 size)
 {
 	set_key_size(pdesc, ((size >> 3) - 2));
 }
 
-/*
- * Set DES key size.
+/**
+ * set_key_size_des() - Set DES key size.
  *
- * @pdesc: pointer HW descriptor struct
- * @size: key size in bytes (NOT size code)
+ * @pdesc: Pointer to HW descriptor struct
+ * @size: Key size in bytes (NOT size code)
  */
 static inline void set_key_size_des(struct cc_hw_desc *pdesc, u32 size)
 {
 	set_key_size(pdesc, ((size >> 3) - 1));
 }
 
-/*
- * Set the descriptor setup mode
+/**
+ * set_setup_mode() - Set the descriptor setup mode
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  * @mode: Any one of the setup modes defined in [CC7x-DESC]
  */
 static inline void set_setup_mode(struct cc_hw_desc *pdesc,
@@ -619,10 +620,10 @@ static inline void set_setup_mode(struct cc_hw_desc *pdesc,
 	pdesc->word[4] |= FIELD_PREP(WORD4_SETUP_OPERATION, mode);
 }
 
-/*
- * Set the descriptor cipher DO
+/**
+ * set_cipher_do() - Set the descriptor cipher DO
  *
- * @pdesc: pointer HW descriptor struct
+ * @pdesc: Pointer to HW descriptor struct
  * @config: Any one of the cipher do defined in [CC7x-DESC]
  */
 static inline void set_cipher_do(struct cc_hw_desc *pdesc,
-- 
2.17.1

