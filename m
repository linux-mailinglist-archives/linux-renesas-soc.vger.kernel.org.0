Return-Path: <linux-renesas-soc+bounces-30508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJrXD0/lxmnrPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:15:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A56AF34ABAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 809FB30F8F75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7E439D6C8;
	Fri, 27 Mar 2026 20:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QgK2XBGL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61947391833;
	Fri, 27 Mar 2026 20:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642278; cv=none; b=FloyPJ2JCSVBDKOYZ8vR+ZL3nSrp8imbj3smtzkPHc6U3ISwKYMIbVjW6iprgFZZ5pCVqullX0ElAWAvPqVebzHEMevICOw22h0cdNen9UJoL5/Qb6dq6SpogtSPdNSDUDH3gmM96WM6qO5Wg0RWo+C8cdHYSX1wMk+nRGAmM28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642278; c=relaxed/simple;
	bh=EtDny1RizlYWrZNnb+l3/9u2qEWeKJCx7BGahvblGEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKFFj0cWL4qPQEmm/wEzAEqzE+oKEnGPvDG6jCNBuKKREveLm49dWIHDdr77b1njr8a4dVPw0RjWnG9H2xA2kOCuSTg8Vfbf9zv/vvyTUBsK4MUgP19bKnWlNxgbwWK3c7K5rj34TAUMZMIlBfVU1efvbawurg8Hw+nT1p3dh7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QgK2XBGL; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2C4DD1A3035;
	Fri, 27 Mar 2026 20:11:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0130360268;
	Fri, 27 Mar 2026 20:11:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0126510451AD3;
	Fri, 27 Mar 2026 21:11:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642273; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vdeNq9zOLzWizS0THb0tkYWW2nU3t4sEPMdfzGroRwk=;
	b=QgK2XBGLPH7q2R9Xxu56NcpXXpsOj3QsftgFai/8W7Gz9A2MJ2/JIBiRT2VU9fHFEiN3BJ
	6X3CGAnWHKTGZ1o+EhLw1nj4xJ+4dT8CBrUkIS4WXV3vfZst5l0V65JqltgpVtsBATUAvN
	KnZn5rE9tHYOAeW2jcEoHpfjmdfpH9jsK7DdKsyEagpL+upTFoEgpdovBPh97nWtVZsSH9
	PNsY2r/zBE4OciNm6xC4+stw/v0mUO/ZIX5d285cFszCTTJa11KafA3RwNIQDB17Efj9zP
	AHNFsF292HISk2Snxq4HtBHysFUR0UwA2SpAu6coxGmXTSNspIOZa/okeUkalw==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:37 +0100
Subject: [PATCH 15/16] crypto: eip28: Add support for SafeXcel EIP-28
 Public Key Accelerator
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-15-5e6ff7853994@bootlin.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Jayesh Choudhary <j-choudhary@ti.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Antoine Tenart <atenart@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30508-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[se.com:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A56AF34ABAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This engine provides offload for:
- RSA (RSA-PKCS1, FIPS 186-3)
- ECDSA (FIPS 186-3)
- ECDH (SP 800-56B)

The driver is stable and working, but currently only implements the RSA
algorithm. It successfully passes RSA selftests.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
We are working on ECDSA and ECDH support, they will be added later.

We are also clarifying the terms and conditions to publish the firmware
in a repository like linux-firmwares, if ever possible.
---
 drivers/crypto/Kconfig                |  10 +
 drivers/crypto/inside-secure/Makefile |   1 +
 drivers/crypto/inside-secure/eip28.c  | 760 ++++++++++++++++++++++++++++++++++
 3 files changed, 771 insertions(+)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index b3a6bbf0aacf..734649a223f7 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -877,6 +877,16 @@ config CRYPTO_DEV_SAFEXCEL
 	  SHA384 and SHA512 hash algorithms for both basic hash and HMAC.
 	  Additionally, it accelerates combined AES-CBC/HMAC-SHA AEAD operations.
 
+config CRYPTO_DEV_EIP28
+	tristate "Support Inside Secure's SafeXcel EIP28 PKA"
+	depends on SAFEXCEL_EIP201_AIC
+	select CRYPTO_AKCIPHER
+	help
+	  EIP28 is a public key accelerator. It provides offload for:
+	  - RSA (RSA-PKCS1, FIPS 186-3)
+	  - ECDSA (FIPS 186-3)
+	  - ECDH (SP 800-56B)
+
 source "drivers/crypto/inside-secure/eip93/Kconfig"
 source "drivers/crypto/ti/Kconfig"
 
diff --git a/drivers/crypto/inside-secure/Makefile b/drivers/crypto/inside-secure/Makefile
index 30d13fd5d58e..8a6f51dcec58 100644
--- a/drivers/crypto/inside-secure/Makefile
+++ b/drivers/crypto/inside-secure/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CRYPTO_DEV_SAFEXCEL) += crypto_safexcel.o
 crypto_safexcel-objs := safexcel.o safexcel_ring.o safexcel_cipher.o safexcel_hash.o
+obj-$(CONFIG_CRYPTO_DEV_EIP28) += eip28.o
 obj-y += eip93/
diff --git a/drivers/crypto/inside-secure/eip28.c b/drivers/crypto/inside-secure/eip28.c
new file mode 100644
index 000000000000..495a8cf6dfc0
--- /dev/null
+++ b/drivers/crypto/inside-secure/eip28.c
@@ -0,0 +1,760 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019-2026 Schneider Electric
+ */
+
+#include <linux/platform_device.h>
+#include <linux/kernel.h>
+#include <linux/clk.h>
+#include <linux/scatterlist.h>
+#include <linux/of.h>
+#include <linux/interrupt.h>
+#include <linux/completion.h>
+#include <linux/firmware.h>
+#include <crypto/internal/akcipher.h>
+#include <crypto/internal/rsa.h>
+
+#define EIP28_PKA_APTR 0x0
+#define EIP28_PKA_BPTR 0x04
+#define EIP28_PKA_CPTR 0x08
+#define EIP28_PKA_DPTR 0x0c
+#define EIP28_PKA_ALENGTH 0x10
+#define EIP28_PKA_BLENGTH 0x14
+#define   EIP28_PKA_VECTOR_MAXLEN 512
+#define EIP28_PKA_BITSHIFT 0x18
+#define EIP28_PKA_FUNCTION 0x1c
+#define   EIP28_FUNCTION_MULTIPLY 0
+#define   EIP28_FUNCTION_SEQ_MOD_EXP_CRT (1 << 12)
+#define   EIP28_FUNCTION_SEQ_MOD_EXP_ACT4 (2 << 12)
+#define   EIP28_FUNCTION_SEQ_ECC_ADD_AFFINE (3 << 12)
+#define   EIP28_FUNCTION_SEQ_MOD_EXP_ACT2 (4 << 12)
+#define   EIP28_FUNCTION_SEQ_ECC_MUL_AFFINE (5 << 12)
+#define   EIP28_FUNCTION_SEQ_MOD_EXP_VAR (6 << 12)
+#define   EIP28_FUNCTION_SEQ_MOD_INV (7 << 12)
+#define   EIP28_FUNCTION_RUN BIT(15)
+#define   EIP28_FUNCTION_SEQ_ECC_ADD_PROJECTIVE (16 << 12)
+#define   EIP28_FUNCTION_SEQ_ECC_MUL_PROJECTIVE (17 << 12)
+
+#define EIP28_PKA_SEQ_CTRL 0xc8
+#define   EIP28_CTRL_RESET BIT(31)
+#define   EIP28_CTRL_STATUS(reg) FIELD_GET(GENMASK(15, 8), (reg))
+#define   EIP28_CTRL_SEQ_IDLE 1
+
+#define EIP28_PKA_SW_REV 0xf8
+#define EIP28_PKA_REVISION 0xfc
+#define   EIP28_REV_MAJOR(reg) FIELD_GET(GENMASK(27, 24), (reg))
+#define   EIP28_REV_MINOR(reg) FIELD_GET(GENMASK(23, 20), (reg))
+#define   EIP28_REV_PATCH_LVL(reg) FIELD_GET(GENMASK(16, 16), (reg))
+#define   EIP28_REV_CAPABILITIES(reg) FIELD_GET(GENMASK(31, 28), (reg))
+
+#define EIP28_PKA_PROGRAM_RAM 0x2000
+#define EIP28_PKA_PROGRAM_RAM_SZ SZ_8K
+
+#define EIP28_PKA_NR_ODD_POW 2 /* 0 < bit_shift <= 16 */
+#define EIP28_FW_NAME "ram_code_eip28.bin"
+
+enum eip28_operation {
+	MOD_EXP_VAR,
+	MOD_EXP_ACT2,
+	MOD_EXP_ACT4,
+	MOD_EXP_CRT,
+	ECC_ADD_AFFINE,
+	ECC_ADD_PROJECTIVE,
+	ECC_MUL_AFFINE,
+	ECC_MUL_PROJECTIVE,
+	MULTIPLY,
+	MOD_INV
+};
+
+static struct eip28 *main_dev;
+
+struct eip28 {
+	void __iomem *regs;
+	struct device *dev;
+	struct clk *clk;
+	struct completion completion;
+	/* Serialize algorithms */
+	struct mutex lock;
+};
+
+struct eip28_rsa_ctx {
+	struct eip28 *priv;
+	u8 *n;
+	u8 *e;
+	u8 *d;
+	size_t n_sz;
+	size_t e_sz;
+	size_t d_sz;
+	unsigned char *message;
+};
+
+static void eip28_pkaram_write_word(struct eip28 *priv, u32 value, u32 word_off)
+{
+	writel(value, priv->regs + EIP28_PKA_PROGRAM_RAM + (word_off * 4));
+}
+
+static u32 eip28_pkaram_read_word(struct eip28 *priv, u32 word_off)
+{
+	return readl(priv->regs + EIP28_PKA_PROGRAM_RAM + (word_off * 4));
+}
+
+static void eip28_pkaram_write_vector(struct eip28 *priv, u32 *word_off,
+				      const u8 *buf, u32 bytes_count)
+{
+	u32 off;
+	int i;
+
+	off = *word_off + (bytes_count / 4) - 1;
+	for (i = 0; i < bytes_count; i += 4, off -= 1)
+		eip28_pkaram_write_word(priv, cpu_to_be32(*(u32 *)(buf + i)), off);
+
+	*word_off = round_up(*word_off * 4 + bytes_count + 1, 8) / 4;
+}
+
+static void eip28_pkaram_read_vector(struct eip28 *priv, u32 start_word,
+				     u8 *buf, u32 bytes_count)
+{
+	u32 off, *ptr;
+	int i;
+
+	memset(buf, 0, bytes_count);
+
+	off = start_word + (bytes_count / 4) - 1;
+	for (i = 0; i < bytes_count; i += 4, off -= 1) {
+		ptr = (u32 *)&buf[i];
+		*ptr = be32_to_cpu(eip28_pkaram_read_word(priv, off));
+	}
+}
+
+static size_t eip28_scratchpad_size(enum eip28_operation op)
+{
+	switch (op) {
+	case MOD_EXP_ACT2:
+	case MOD_EXP_ACT4:
+	case MOD_EXP_VAR:
+		return 9;
+	case MOD_EXP_CRT:
+		return 11;
+	case ECC_ADD_AFFINE:
+	case ECC_ADD_PROJECTIVE:
+	case ECC_MUL_AFFINE:
+	case ECC_MUL_PROJECTIVE:
+		return 19;
+	case MULTIPLY:
+		return 6;
+	case MOD_INV:
+		return 12;
+	default:
+		return 0;
+	}
+}
+
+static size_t eip28_work_area_size(enum eip28_operation op, u32 mod_len)
+{
+	u32 L = 0;
+
+	switch (op) {
+	case MOD_EXP_ACT2:
+	case MOD_EXP_ACT4:
+	case MOD_EXP_VAR:
+		/* (#odd powers + 3) x (B_len + 2) */
+		return (EIP28_PKA_NR_ODD_POW + 3) * (mod_len + 2);
+	case MOD_EXP_CRT:
+		/* (#odd powers + 3) x (B_len + 2) + (B_len + 2 - (B_len mod 2)) */
+		L = mod_len + 2 - (mod_len & 1);
+		return (EIP28_PKA_NR_ODD_POW + 3) * (mod_len + 2) + L;
+	case ECC_ADD_PROJECTIVE:
+	case ECC_ADD_AFFINE:
+	case ECC_MUL_PROJECTIVE:
+	case ECC_MUL_AFFINE:
+		/* 20 x (B_len + 2 + (B_len mod 2)) */
+		L = mod_len + 2 + (mod_len & 1);
+		return 20 * L;
+	case MULTIPLY:
+	case MOD_INV:
+	default:
+		return 0;
+	}
+}
+
+static size_t eip28_op_to_func(enum eip28_operation op)
+{
+	switch (op) {
+	case MOD_EXP_ACT2:
+		return EIP28_FUNCTION_SEQ_MOD_EXP_ACT2;
+	case MOD_EXP_ACT4:
+		return EIP28_FUNCTION_SEQ_MOD_EXP_ACT4;
+	case MOD_EXP_VAR:
+		return EIP28_FUNCTION_SEQ_MOD_EXP_VAR;
+	case MOD_EXP_CRT:
+		return EIP28_FUNCTION_SEQ_MOD_EXP_CRT;
+	case ECC_ADD_PROJECTIVE:
+		return EIP28_FUNCTION_SEQ_ECC_ADD_PROJECTIVE;
+	case ECC_ADD_AFFINE:
+		return EIP28_FUNCTION_SEQ_ECC_ADD_AFFINE;
+	case ECC_MUL_PROJECTIVE:
+		return EIP28_FUNCTION_SEQ_ECC_MUL_PROJECTIVE;
+	case ECC_MUL_AFFINE:
+		return EIP28_FUNCTION_SEQ_ECC_MUL_AFFINE;
+	case MULTIPLY:
+		return EIP28_FUNCTION_MULTIPLY;
+	case MOD_INV:
+		return EIP28_FUNCTION_SEQ_MOD_INV;
+	default:
+		WARN_ON_ONCE("EIP28 unsupported operation\n");
+		return 0;
+	}
+}
+
+static int eip28_vectors_overlap(u16 start_addr1, size_t len1, u16 start_addr2,	size_t len2)
+{
+	u32 end_addr1 = start_addr1 + len1 - 1;
+	u32 end_addr2 = start_addr2 + len2 - 1;
+
+	return !(end_addr1 < start_addr2 || end_addr2 < start_addr1);
+}
+
+static void eip28_trigger_operation(struct eip28 *priv, enum eip28_operation op)
+{
+	writel(eip28_op_to_func(op) | EIP28_FUNCTION_RUN,
+	       priv->regs + EIP28_PKA_FUNCTION);
+}
+
+static int eip28_run_mod_exp(struct eip28 *priv, u16 vector_a, u16 vector_b,
+			     u16 vector_c, u16 vector_d, size_t a_wlen, size_t bc_wlen)
+{
+	size_t scratchpad_off, result_wlen;
+	u32 val;
+
+	/* 0 < a_wlen <= MAX */
+	if (!a_wlen || a_wlen > EIP28_PKA_VECTOR_MAXLEN)
+		return -EINVAL;
+
+	/* 1 < b_wlen <= MAX */
+	if (bc_wlen < 2 ||  bc_wlen > EIP28_PKA_VECTOR_MAXLEN)
+		return -EINVAL;
+
+	scratchpad_off = (EIP28_PKA_PROGRAM_RAM_SZ / 4) - eip28_scratchpad_size(MOD_EXP_VAR);
+	result_wlen = eip28_work_area_size(MOD_EXP_VAR, bc_wlen);
+
+	/*
+	 * Make sure the area taken by each vector does not overlap with the
+	 * scratchpad, the other input vectors not the result vector.
+	 */
+	if ((vector_a + a_wlen > scratchpad_off) ||
+	    (vector_b + bc_wlen > scratchpad_off) ||
+	    (vector_c + bc_wlen > scratchpad_off) ||
+	    (vector_d + result_wlen > scratchpad_off))
+		return -EINVAL;
+
+	/* Ensure 64-bit alignment (offsets are words) */
+	if (!IS_ALIGNED(vector_a, 2) || !IS_ALIGNED(vector_b, 2) ||
+	    !IS_ALIGNED(vector_c, 2) || !IS_ALIGNED(vector_d, 2))
+		return -EINVAL;
+
+	/* Modulus must be odd */
+	val = eip28_pkaram_read_word(priv, vector_b);
+	if (!(val & 1))
+		return -EINVAL;
+
+	/*
+	 * Make sure there is no overlap between any of the input vectors and
+	 * the result vector. Only vector_c == vector_d is allowed.
+	 */
+	if (eip28_vectors_overlap(vector_a, a_wlen, vector_d, result_wlen) ||
+	    eip28_vectors_overlap(vector_b, bc_wlen, vector_d, result_wlen) ||
+	    (vector_c != vector_d &&
+	     eip28_vectors_overlap(vector_c, bc_wlen, vector_d, result_wlen)))
+		return -ERANGE;
+
+	writel(vector_a, priv->regs + EIP28_PKA_APTR);
+	writel(vector_b, priv->regs + EIP28_PKA_BPTR);
+	writel(vector_c, priv->regs + EIP28_PKA_CPTR);
+	writel(vector_d, priv->regs + EIP28_PKA_DPTR);
+	writel(a_wlen, priv->regs + EIP28_PKA_ALENGTH);
+	writel(bc_wlen, priv->regs + EIP28_PKA_BLENGTH);
+	writel(EIP28_PKA_NR_ODD_POW, priv->regs + EIP28_PKA_BITSHIFT);
+
+	eip28_trigger_operation(priv, MOD_EXP_VAR);
+
+	return 0;
+}
+
+/*
+ * EIP28 operates using vectors precisely located in PKARAM. A vector
+ * corresponds to a pointer of an element. In the RSA case:
+ *     vector A = exponent (e or d)
+ *     vector B = modulo (n)
+ *     vector C = message
+ *     vector D = result of the operations
+ *
+ *    PKARAM    Offset (pinternal_ram)
+ * +----------+ 0
+ * | vector A |
+ * +----------+ length(vector A)
+ * | vector B |
+ * +----------+ length(vector A) + length(vector B)
+ * | vector C |
+ * +----------+ length(vector A) + length(vector B) + length(vector C)
+ * | vector D |
+ * +----------+
+ */
+static int eip28_rsa_operation(struct akcipher_request *req, bool encrypt)
+{
+	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
+	struct eip28_rsa_ctx *ctx = akcipher_tfm_ctx(tfm);
+	u16 vector_a, vector_b, vector_c, vector_d;
+	struct eip28 *priv = ctx->priv;
+	unsigned int pkaram_off = 0;
+	size_t a_wlen, bc_wlen;
+	u32 reg;
+	int ret;
+
+	/* Sanity check */
+	if (req->src_len > ctx->n_sz)
+		return -EMSGSIZE;
+
+	/* Check if no computation is running */
+	reg = readl(priv->regs + EIP28_PKA_FUNCTION);
+	if (reg & EIP28_FUNCTION_RUN)
+		return -EBUSY;
+
+	/* Check if PKARAM is accessible */
+	reg = readl(priv->regs + EIP28_PKA_SEQ_CTRL);
+	if (reg & EIP28_CTRL_RESET) {
+		dev_err(priv->dev, "PKARAM not accessible\n");
+		return -EBUSY;
+	}
+
+	/* Initializes vector A with either 'e' or 'd' and move the internal pointer */
+	vector_a = 0;
+	if (encrypt) {
+		eip28_pkaram_write_vector(priv, &pkaram_off, ctx->e, ctx->e_sz);
+		a_wlen = ctx->e_sz / 4;
+	} else {
+		eip28_pkaram_write_vector(priv, &pkaram_off, ctx->d, ctx->d_sz);
+		a_wlen = ctx->d_sz / 4;
+	}
+
+	/* Initializes Vector B with the modulo 'n' */
+	vector_b = pkaram_off;
+	eip28_pkaram_write_vector(priv, &pkaram_off, ctx->n, ctx->n_sz);
+	bc_wlen = ctx->n_sz / 4;
+
+	/* Initializes Vector C with the message */
+	vector_c = pkaram_off;
+	memset(ctx->message, 0, ctx->n_sz - req->src_len);
+	sg_copy_to_buffer(req->src, 1, &ctx->message[ctx->n_sz - req->src_len], req->src_len);
+	eip28_pkaram_write_vector(priv, &pkaram_off, ctx->message, ctx->n_sz);
+
+	/* Initialize vector D, output will overwrite the message */
+	vector_d = vector_c;
+
+	/* Trigger operation */
+	ret = eip28_run_mod_exp(priv, vector_a, vector_b, vector_c, vector_d,
+				a_wlen, bc_wlen);
+	if (ret) {
+		dev_err(priv->dev, "Modular exponentiation error : %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&priv->completion, msecs_to_jiffies(2000));
+	if (!ret) {
+		reinit_completion(&priv->completion);
+		return -ETIMEDOUT;
+	}
+
+	/* Retrieve result */
+	reg = readl(priv->regs + EIP28_PKA_SEQ_CTRL);
+	if (EIP28_CTRL_STATUS(reg) != EIP28_CTRL_SEQ_IDLE)
+		return -EIO;
+
+	memset(ctx->message, 0, ctx->n_sz);
+	eip28_pkaram_read_vector(priv, vector_d, ctx->message, ctx->n_sz);
+	sg_copy_from_buffer(req->dst, 1, ctx->message, ctx->n_sz);
+
+	return 0;
+}
+
+static int eip28_rsa_save_modulo(struct eip28_rsa_ctx *ctx, struct rsa_key *key)
+{
+	unsigned int nskip;
+
+	/* Skip the first empty bytes in the buffer */
+	for (nskip = 0; nskip < key->n_sz; nskip++)
+		if (key->n[nskip])
+			break;
+
+	ctx->n_sz = key->n_sz - nskip;
+
+	ctx->n = kzalloc(round_up(ctx->n_sz, 4), GFP_KERNEL);
+	if (!ctx->n)
+		return -ENOMEM;
+
+	memcpy(ctx->n, key->n + nskip, ctx->n_sz);
+	if (!ctx->n)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int eip28_rsa_save_keypart(u8 **dst, size_t *dest_sz, const u8 *src, size_t src_sz,
+				  size_t modulo_size)
+{
+	unsigned int nskip, real_size_buf;
+
+	/* Skip the first empty bytes in the buffer */
+	for (nskip = 0; nskip < src_sz; nskip++)
+		if (src[nskip])
+			break;
+
+	real_size_buf = src_sz - nskip;
+	if (real_size_buf > modulo_size)
+		return -EINVAL;
+
+	/* Write data at the end of the buffer */
+	*dst = kzalloc(round_up(modulo_size, 4), GFP_KERNEL);
+	if (!*dst)
+		return -ENOMEM;
+
+	memcpy(*dst + (modulo_size - real_size_buf), src + nskip, real_size_buf);
+	*dest_sz = modulo_size;
+
+	return 0;
+}
+
+static void eip28_rsa_clean_ctx(struct eip28_rsa_ctx *ctx)
+{
+	struct eip28 *priv;
+
+	kfree(ctx->e);
+	kfree(ctx->n);
+	kfree(ctx->d);
+	kfree(ctx->message);
+
+	priv = ctx->priv;
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->priv = priv;
+}
+
+static unsigned int eip28_rsa_max_size(struct crypto_akcipher *tfm)
+{
+	struct eip28_rsa_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	return ctx->n_sz;
+}
+
+static int eip28_rsa_encrypt(struct akcipher_request *req)
+{
+	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
+	struct eip28_rsa_ctx *ctx = akcipher_tfm_ctx(tfm);
+	int ret;
+
+	mutex_lock(&ctx->priv->lock);
+	ret = eip28_rsa_operation(req, true);
+	mutex_unlock(&ctx->priv->lock);
+
+	return ret;
+}
+
+static int eip28_rsa_decrypt(struct akcipher_request *req)
+{
+	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
+	struct eip28_rsa_ctx *ctx = akcipher_tfm_ctx(tfm);
+	int ret;
+
+	mutex_lock(&ctx->priv->lock);
+	ret = eip28_rsa_operation(req, false);
+	mutex_unlock(&ctx->priv->lock);
+
+	return ret;
+}
+
+static int eip28_rsa_check_key_length(unsigned int len)
+{
+	switch (len) {
+	case 256:
+	case 512:
+	case 1024:
+	case 2048:
+	case 4096:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int eip28_rsa_setkey(struct eip28_rsa_ctx *ctx, const void *key,
+			    unsigned int key_len, bool private)
+{
+	struct rsa_key raw_key = {0};
+	int ret;
+
+	/* Parse the key elements: (n, e) for the public key, (n, d) for the private key */
+	if (private)
+		ret = rsa_parse_priv_key(&raw_key, key, key_len);
+	else
+		ret = rsa_parse_pub_key(&raw_key, key, key_len);
+	if (ret)
+		return ret;
+
+	/* Clean the buffers before copying the key elements */
+	eip28_rsa_clean_ctx(ctx);
+
+	/* Save the modulo 'n' */
+	ret = eip28_rsa_save_modulo(ctx, &raw_key);
+	if (ret)
+		goto clean_ctx;
+
+	ret = eip28_rsa_check_key_length(ctx->n_sz * 8);
+	if (ret)
+		goto clean_ctx;
+
+	/* Save the public exponent 'e' */
+	ret = eip28_rsa_save_keypart(&ctx->e, &ctx->e_sz,
+				     raw_key.e, raw_key.e_sz, ctx->n_sz);
+	if (ret)
+		goto clean_ctx;
+
+	/* Save the private exponent 'd', if known */
+	if (private) {
+		ret = eip28_rsa_save_keypart(&ctx->d, &ctx->d_sz,
+					     raw_key.d, raw_key.d_sz, ctx->n_sz);
+		if (ret)
+			goto clean_ctx;
+	}
+
+	/* Set the message buffer */
+	ctx->message = kzalloc(ctx->n_sz, GFP_KERNEL);
+	if (!ctx->message) {
+		ret = -ENOMEM;
+		goto clean_ctx;
+	}
+
+	return 0;
+
+clean_ctx:
+	eip28_rsa_clean_ctx(ctx);
+	return ret;
+}
+
+static int eip28_rsa_set_priv_key(struct crypto_akcipher *tfm, const void *key,
+				  unsigned int key_len)
+{
+	struct eip28_rsa_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	return eip28_rsa_setkey(ctx, key, key_len, true);
+}
+
+static int eip28_rsa_set_pub_key(struct crypto_akcipher *tfm, const void *key,
+				 unsigned int key_len)
+{
+	struct eip28_rsa_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	return eip28_rsa_setkey(ctx, key, key_len, false);
+}
+
+static int eip28_rsa_init(struct crypto_akcipher *tfm)
+{
+	struct eip28_rsa_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	ctx->priv = main_dev;
+
+	return 0;
+}
+
+static void eip28_rsa_exit(struct crypto_akcipher *tfm)
+{
+	struct eip28_rsa_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	eip28_rsa_clean_ctx(ctx);
+}
+
+struct akcipher_alg eip28_rsa = {
+	.encrypt = eip28_rsa_encrypt,
+	.decrypt = eip28_rsa_decrypt,
+	.set_pub_key = eip28_rsa_set_pub_key,
+	.set_priv_key = eip28_rsa_set_priv_key,
+	.max_size = eip28_rsa_max_size,
+	.init = eip28_rsa_init,
+	.exit = eip28_rsa_exit,
+	.base = {
+		.cra_name = "rsa",
+		.cra_driver_name = "eip28-rsa",
+		.cra_flags = CRYPTO_ALG_TYPE_AKCIPHER,
+		.cra_priority = 300,
+		.cra_module = THIS_MODULE,
+		.cra_ctxsize = sizeof(struct eip28_rsa_ctx),
+	},
+};
+
+static int eip28_check_firmware(struct eip28 *priv)
+{
+	u32 reg;
+
+	reg = readl(priv->regs + EIP28_PKA_REVISION);
+	if (EIP28_REV_MAJOR(reg) != 2) {
+		dev_err(priv->dev, "Unsupported hardware revision: %lu.%lu.%lu\n",
+			EIP28_REV_MAJOR(reg), EIP28_REV_MINOR(reg), EIP28_REV_PATCH_LVL(reg));
+		return -EINVAL;
+	}
+
+	reg = readl(priv->regs + EIP28_PKA_SW_REV);
+	if ((EIP28_REV_MAJOR(reg) != 2) ||
+	    (EIP28_REV_MINOR(reg) != 1) ||
+	    (EIP28_REV_PATCH_LVL(reg) != 1) ||
+	    (EIP28_REV_CAPABILITIES(reg) != 2)) {
+		dev_err(priv->dev, "Unsupported firmware revision: %lu.%lu.%lu.%lu\n",
+			EIP28_REV_MAJOR(reg), EIP28_REV_MINOR(reg),
+			EIP28_REV_PATCH_LVL(reg), EIP28_REV_CAPABILITIES(reg));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int eip28_write_firmware(struct eip28 *priv, const struct firmware *eip28_fw)
+{
+	const u32 *data = (const u32 *)eip28_fw->data;
+	u32 reg;
+	int i;
+
+	if (eip28_fw->size > EIP28_PKA_PROGRAM_RAM_SZ)
+		return -EOPNOTSUPP;
+
+	/* Enter reset mode, which allows writing of PKA_PROGRAM_RAM registers */
+	writel(EIP28_CTRL_RESET, priv->regs + EIP28_PKA_SEQ_CTRL);
+	reg = readl(priv->regs + EIP28_PKA_SEQ_CTRL);
+	if (reg != EIP28_CTRL_RESET)
+		return -EIO;
+
+	for (i = 0; i < (eip28_fw->size / sizeof(u32)); i++)
+		writel(data[i], priv->regs + EIP28_PKA_PROGRAM_RAM + (i * 4));
+
+	/* Release reset mode, start the EIP28 */
+	writel(0, priv->regs + EIP28_PKA_SEQ_CTRL);
+	reg = readl(priv->regs + EIP28_PKA_SEQ_CTRL);
+	if (reg & EIP28_CTRL_RESET)
+		return -EIO;
+
+	return 0;
+}
+
+static int eip28_load_firmware(struct eip28 *priv)
+{
+	const struct firmware *eip28_fw;
+	int ret = 0;
+
+	ret = request_firmware(&eip28_fw, EIP28_FW_NAME, priv->dev);
+	if (ret)
+		return ret;
+
+	/* Write the EIP28 firmware in RAM CODE registers */
+	ret = eip28_write_firmware(priv, eip28_fw);
+	release_firmware(eip28_fw);
+	if (ret) {
+		dev_err(priv->dev, "Unable to write firmware (%d)\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Once firmware is loaded, after releasing the reset bit the firmware
+	 * starts executing and after a few clock cycles it clears the RUN bit,
+	 * indicating initialization is done.
+	 */
+	ret = wait_for_completion_timeout(&priv->completion, msecs_to_jiffies(1000));
+	if (!ret) {
+		dev_err(priv->dev, "Firmware loading failed\n");
+		return -ETIMEDOUT;
+	}
+
+	/* Verify the firmware: can be read, is valid, has the correct version */
+	return eip28_check_firmware(priv);
+}
+
+static irqreturn_t eip28_irq_handler(int irq, void *dev_id)
+{
+	struct eip28 *priv = dev_id;
+
+	complete(&priv->completion);
+
+	return IRQ_HANDLED;
+}
+
+static int eip28_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct eip28 *priv;
+	int irq, ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	priv->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->regs);
+
+	irq = platform_get_irq(pdev, 2);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, eip28_irq_handler, 0, "eip28", priv);
+	if (ret)
+		return ret;
+
+	main_dev = priv;
+	priv->dev = dev;
+	init_completion(&priv->completion);
+	mutex_init(&priv->lock);
+
+	/* Initialize the code section of the internal RAM with the firmware */
+	ret = eip28_load_firmware(priv);
+	if (ret) {
+		dev_err(dev, "Unable to initialize EIP28 firmware (%d)\n", ret);
+		return ret;
+	}
+
+	/* Initializing crypto API for RSA keys */
+	ret = crypto_register_akcipher(&eip28_rsa);
+	if (ret) {
+		dev_err(dev, "Unable to initialize RSA\n");
+		return ret;
+	}
+
+	dev_info(dev, "EIP28 probed successfully\n");
+
+	return ret;
+}
+
+static void eip28_remove(struct platform_device *pdev)
+{
+	crypto_unregister_akcipher(&eip28_rsa);
+}
+
+static const struct of_device_id eip28_of_match_table[] = {
+	{ .compatible = "inside-secure,safexcel-eip28", },
+	{}
+};
+
+static struct platform_driver eip28_driver = {
+	.probe = eip28_probe,
+	.remove = eip28_remove,
+	.driver = {
+		.name = "Safexcel EIP28 PKA",
+		.of_match_table = eip28_of_match_table,
+	},
+};
+module_platform_driver(eip28_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Pierre Castellan <pierre.castellan@non.se.com>");
+MODULE_AUTHOR("Thomas Ghesquiere <thomas.ghesquierre@non.se.com>");
+MODULE_AUTHOR("Mathieu Hadjimegrian <mathieu.hadjimegrian@non.se.com>");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
+MODULE_DESCRIPTION("SafeXcel EIP28 Public Key Accelerator driver");
+MODULE_FIRMWARE(EIP28_FW_NAME);

-- 
2.51.1


