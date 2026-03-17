Return-Path: <linux-renesas-soc+bounces-29590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFxOGpkruWmVtQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:23:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F27BB2A7CC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E71AE30B2213
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DBB3A6F19;
	Tue, 17 Mar 2026 10:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fx8z1JAi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99403A6F1E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742603; cv=none; b=HDpC+rkcwYdKMSluYjjzQINpSX5wy0NM+onGNaetvTDzXFWAQSZ+ePtgIaGbqOPFOV2SjqEfbxdsEs1lmjIccUUxsUIvmao2N558RMLhX4ICml8a1NKs9b5UkVEmF8ZnBezC8amvGhxjBa3dpRhJJxmid/x85ncKG8g35PD0Sec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742603; c=relaxed/simple;
	bh=MToUqiQLSOCiKLLmLKpsTiluVNFD5qK7fzHRpHV2EL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mr38rwA0ZR6Vbg/wC1UYRoxvnjaOUV+/ALhMLetaI0BZL3d61xshveo9OqPKg4/nB2l44uRpwsBDBoiFWPIz8lg2ezmFQDQUIka+WVWRiwGNlGbEeDbCt5UpY3kok5hIj1TJT4kw9fDGRzfBRjEGgl9Wl61nKNp/CVLbUOd3Bbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fx8z1JAi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439fe4985efso4922694f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773742599; x=1774347399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V35Cp1YeMeEi1oS2JHcbUtKh1eWOizu2qXICGsho11k=;
        b=fx8z1JAiTwzubCllYwb3LiKyHEDhvUg7Wy9CBEL0BToTwvwtyJC1+yNbwDlnj1xjBe
         CM0GK1CDBJbMleh3mytw5gAuULdJWA1kGKJh+NhvfzV7pOlfMXCcGrbZatP5v4F7XohK
         wUUuGcYZuIqHPsWl4GzbLtHG8e+S9x72sj3neku3gEbagHv4VaNFYUH/wwtjvtZaR2gw
         JiOR5WhBClUgfIAMs41kTLqwddmYt3LKJUIg1JcG/2AOQF8DDQRDEHYe3vSf1OdnjydE
         bfp2dmfgq1cmdpZk0ySbcqnTQxkZzV/6aj7Z/iGPl8PJho1BJD741BjHfJ+QE+pzA6cY
         7UZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742599; x=1774347399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V35Cp1YeMeEi1oS2JHcbUtKh1eWOizu2qXICGsho11k=;
        b=pJxNGJ/IKuZE4A4QzQh+97JoVBh59CofLsVA/9hdvJHFJ+bl4HSgVwYPghH3qdMZ/O
         x4/FkB4l6omRsIceVulbowHb0FZKSRT6Za6K3tDxjRX/MgwIfRUrNd25sykZ4XYXjx+7
         J43N1J+aKPHTWvUR/4I9D+XDA+qem6lIKi06rFuTIcZWrlBnzRsIU6ayqvorFVQlPHbh
         B5OdH0Z+xoLjBFSSks6IjVeO8mY0MisnKF9d6wd1cefdClyY9PbkdXBg6vUGcevkN0Cs
         IwLoQ6aRGcXFDqq/FY9PN6FUZy+AcUnk6S6c6vZWm+daa6uAw1THHSxnbvW2DjVosNfh
         oT4w==
X-Forwarded-Encrypted: i=1; AJvYcCVeaDOeTHvplx4e85Y8nEe4wqnUy4H41uAkAxXUAj+vVd/JTcWgo9JtujAp4E7bNbC9wkAkQQ6T63inimaTyAF5qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5FSaIyjQBx5tGFZQufsriBB0UJ4pZpxut839HWSmiNgpSij9L
	0L9hZgKIfElil2Ao5ixKsKKNSZcrbjWE0cWhcvvqAv1paVgcOG5LcLoT
X-Gm-Gg: ATEYQzyzM4y6nF8EaJWXnGnKZ+SkyQHDQu3YL4Najh2kkTYHbXhpa81cv82Ko5Lkaq+
	4A3D50rMI6t2xMC+dpKckpD5orbI3ADhD1BGlam3xoPRS1piC8rdnnzsmy6RIuwqxFwxtwMFchz
	+vx4pFQ7vyatk4jF7qZ0SJLaWCFvF9OrUgD7ZxfCZeG4bxDpS+iehGFp2R1wIQmRmJIWH/csx3+
	rhRs2wLoQQLuT0jOZ8eeiL4Un3pn22XqVCDrHNeE8aAQoeo6YnK/kau6vtM0xUFIGLdteNnvb7A
	4nsSpLAZzPDT1ItHXHdmLdS6AUaLheab4DGXxCfJ1zBoCaaueUVBQBXZXaedKRKy8YF655I6cj4
	RaFNeapqK+7JrGNRwSJaqa5XHqk+EXqoLCZ49WRlwG6h/w8TW4QOcD/MFERqDQuI8sW2Xuq0dzv
	vhQdLsHFushCVMwpbcfqnW6hGG4FDKTt4F55R7H2ulBeBrJaL0
X-Received: by 2002:a05:600c:8a09:10b0:483:badb:618e with SMTP id 5b1f17b1804b1-485566d6e33mr193059745e9.8.1773742598976;
        Tue, 17 Mar 2026 03:16:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaee510sm53903275e9.14.2026.03.17.03.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:16:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 8/8] pinctrl: renesas: rzg2l: Add support for clone channel control
Date: Tue, 17 Mar 2026 10:16:21 +0000
Message-ID: <20260317101627.174491-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29590-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: F27BB2A7CC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has some IP such as I2C ch{2,3},SCIF ch{3,4,5},
RSPI ch{1,2} and RSCI ch{1,2,3} need to control the clone channel for
proper operation. As per the RZ/G3L hardware manual, the clone channel
setting is to be done before the mux setting.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 218 ++++++++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 3cef8a8d3712..b8ce110f95d8 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -11,12 +11,14 @@
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 
@@ -152,6 +154,26 @@
 	 FIELD_PREP_CONST(VARIABLE_PIN_CFG_PORT_MASK, (port)) | \
 	 FIELD_PREP_CONST(PIN_CFG_MASK, (cfg)))
 
+#define RZG3L_CLONE_CHANNEL_CFG_PIN_START_MASK	GENMASK(31, 29)
+#define RZG3L_CLONE_CHANNEL_CFG_PIN_END_MASK	GENMASK(28, 26)
+#define RZG3L_CLONE_CHANNEL_CFG_PORT_MASK	GENMASK(25, 21)
+#define RZG3L_CLONE_CHANNEL_CFG_DATA_MASK	GENMASK(9, 0)
+#define RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(port, start_pin, end_pin, cfg) \
+	(FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_CFG_PIN_START_MASK, (start_pin)) | \
+	 FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_CFG_PIN_END_MASK, (end_pin)) | \
+	 FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_CFG_PORT_MASK, (port)) | \
+	 FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_CFG_DATA_MASK, (cfg)))
+
+#define RZG3L_CLONE_CHANNEL_BIT_MASK		GENMASK(9, 6)
+#define RZG3L_CLONE_CHANNEL_VAL_MASK		BIT(5)
+#define RZG3L_CLONE_CHANNEL_SHARED_PIN_MASK	BIT(4)
+#define RZG3L_CLONE_CHANNEL_PFC_MASK		GENMASK(3, 0)
+#define RZG3L_CLONE_CHANNEL_PACK(bit, val, shared_pin, pfc) \
+	(FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_BIT_MASK, (bit)) | \
+	 FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_VAL_MASK, (val)) | \
+	 FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_SHARED_PIN_MASK, (shared_pin)) | \
+	 FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_PFC_MASK, (pfc)))
+
 #define P(off)			(0x0000 + (off))
 #define PM(off)			(0x0100 + (off) * 2)
 #define PMC(off)		(0x0200 + (off))
@@ -311,6 +333,8 @@ struct rzg2l_pinctrl_data {
 	const struct rzg2l_dedicated_configs *dedicated_pins;
 	unsigned int n_port_pins;
 	unsigned int n_dedicated_pins;
+	const u32 *clone_pin_configs;
+	unsigned int n_clone_pins;
 	const struct rzg2l_hwcfg *hwcfg;
 	const u64 *variable_pin_cfg;
 	unsigned int n_variable_pin_cfg;
@@ -346,6 +370,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @pupd: PUPD registers cache
  * @ien: IEN registers cache
  * @smt: SMT registers cache
+ * @clone: Clone registers cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
  * @other_poc: OTHER_POC register cache
@@ -361,6 +386,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*ien[2];
 	u32	*pupd[2];
 	u32	*smt;
+	u32	*clone;
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	oen;
@@ -379,6 +405,8 @@ struct rzg2l_pinctrl {
 
 	struct clk			*clk;
 
+	struct regmap			*syscon;
+
 	struct gpio_chip		gpio_chip;
 	struct pinctrl_gpio_range	gpio_range;
 	DECLARE_BITMAP(tint_slot, RZG2L_TINT_MAX_INTERRUPT);
@@ -392,6 +420,7 @@ struct rzg2l_pinctrl {
 	struct rzg2l_pinctrl_reg_cache	*cache;
 	struct rzg2l_pinctrl_reg_cache	*dedicated_cache;
 	atomic_t			wakeup_path;
+	u32				clone_offset;
 };
 
 static const u16 available_ps[] = { 1800, 2500, 3300 };
@@ -617,6 +646,54 @@ static int rzg2l_validate_pin(struct rzg2l_pinctrl *pctrl,
 	return 0;
 }
 
+static int rzg2l_pinctrl_set_clone_mode(struct rzg2l_pinctrl *pctrl,
+					u8 port, u8 pin, u8 func)
+{
+	static const u8 pfc_table_lut[] = { 2, 4, 5, 6, 7 };
+	u8 start_pin, end_pin;
+	unsigned int i;
+
+	if (!pctrl->data->clone_pin_configs)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(pfc_table_lut); i++)
+		if (pfc_table_lut[i] == func)
+			break;
+
+	if (i == ARRAY_SIZE(pfc_table_lut))
+		return 0;
+
+	for (i = 0; i < pctrl->data->n_clone_pins; i++) {
+		u32 pin_data = pctrl->data->clone_pin_configs[i];
+		bool is_shared_pin = FIELD_GET(RZG3L_CLONE_CHANNEL_SHARED_PIN_MASK, pin_data);
+		u8 pin_func = FIELD_GET(RZG3L_CLONE_CHANNEL_PFC_MASK, pin_data);
+		unsigned int j, num_pins;
+
+		if ((pin_func != func && !(is_shared_pin && (pin_func + 1) == func)) ||
+		    FIELD_GET(RZG3L_CLONE_CHANNEL_CFG_PORT_MASK, pin_data) != port)
+			continue;
+
+		start_pin = FIELD_GET(RZG3L_CLONE_CHANNEL_CFG_PIN_START_MASK, pin_data);
+		end_pin = FIELD_GET(RZG3L_CLONE_CHANNEL_CFG_PIN_END_MASK, pin_data);
+		num_pins = end_pin - start_pin + 1;
+
+		for (j = 0; j < num_pins; j++) {
+			u32 bit, val;
+
+			if ((start_pin + j) != pin)
+				continue;
+
+			bit = FIELD_GET(RZG3L_CLONE_CHANNEL_BIT_MASK, pin_data);
+			val = FIELD_GET(RZG3L_CLONE_CHANNEL_VAL_MASK, pin_data);
+
+			return regmap_update_bits(pctrl->syscon, pctrl->clone_offset,
+						  BIT(bit), field_prep(BIT(bit), val));
+		}
+	}
+
+	return 0;
+}
+
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
@@ -692,6 +769,10 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 		func = psel_val[i] - hwcfg->func_base;
 		dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n", port, pin, off, func);
 
+		ret = rzg2l_pinctrl_set_clone_mode(pctrl, port, pin, func);
+		if (ret)
+			return ret;
+
 		rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, func);
 	}
 
@@ -2647,6 +2728,110 @@ static const struct rzg2l_dedicated_configs rzg3l_dedicated_pins[] = {
 	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
 };
 
+static const u32 r9a08g046_clone_channel_pin_cfg[] = {
+	/* I2C ch2 Bit:0 Value:0 PFC:4 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PG, 6, 7, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PH, 2, 3, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PK, 0, 1, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PA, 0, 1, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PA, 4, 5, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PB, 0, 1, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PB, 4, 5, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PC, 0, 1, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PD, 2, 3, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PD, 6, 7, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PE, 2, 3, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PE, 6, 7, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
+	/* I2C ch2 Bit:0 Value:1 PFC:4 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P5, 0, 1, RZG3L_CLONE_CHANNEL_PACK(0, 1, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P5, 4, 5, RZG3L_CLONE_CHANNEL_PACK(0, 1, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 1, 2, RZG3L_CLONE_CHANNEL_PACK(0, 1, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 5, 6, RZG3L_CLONE_CHANNEL_PACK(0, 1, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P8, 0, 1, RZG3L_CLONE_CHANNEL_PACK(0, 1, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P8, 4, 5, RZG3L_CLONE_CHANNEL_PACK(0, 1, 0, 4)),
+	/* I2C ch3 Bit:1 Value:0 PFC:4 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PF, 0, 1, RZG3L_CLONE_CHANNEL_PACK(1, 0, 0, 4)),
+	/* I2C ch3 Bit:1 Value:1 PFC:4 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P2, 0, 1, RZG3L_CLONE_CHANNEL_PACK(1, 1, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P5, 2, 3, RZG3L_CLONE_CHANNEL_PACK(1, 1, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P5, 6, 6, RZG3L_CLONE_CHANNEL_PACK(1, 1, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 0, 0, RZG3L_CLONE_CHANNEL_PACK(1, 1, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 3, 4, RZG3L_CLONE_CHANNEL_PACK(1, 1, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P7, 6, 7, RZG3L_CLONE_CHANNEL_PACK(1, 1, 0, 4)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P8, 2, 3, RZG3L_CLONE_CHANNEL_PACK(1, 1, 0, 4)),
+	/* SCIF ch3 Bit:4 Value:0 PFC:{6,7} */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PG, 4, 6, RZG3L_CLONE_CHANNEL_PACK(4, 0, 0, 6)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PH, 3, 5, RZG3L_CLONE_CHANNEL_PACK(4, 0, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PA, 2, 4, RZG3L_CLONE_CHANNEL_PACK(4, 0, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PB, 3, 5, RZG3L_CLONE_CHANNEL_PACK(4, 0, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PD, 0, 2, RZG3L_CLONE_CHANNEL_PACK(4, 0, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PE, 1, 3, RZG3L_CLONE_CHANNEL_PACK(4, 0, 0, 7)),
+	/* SCIF ch3 Bit:4 Value:1 PFC:7 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P5, 0, 2, RZG3L_CLONE_CHANNEL_PACK(4, 1, 0, 7)),
+	/* SCIF ch4 Bit:5 Value:0 PFC:7 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PK, 0, 2, RZG3L_CLONE_CHANNEL_PACK(5, 0, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PA, 5, 7, RZG3L_CLONE_CHANNEL_PACK(5, 0, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PB, 6, 7, RZG3L_CLONE_CHANNEL_PACK(5, 0, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PC, 0, 0, RZG3L_CLONE_CHANNEL_PACK(5, 0, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PD, 3, 5, RZG3L_CLONE_CHANNEL_PACK(5, 0, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PE, 4, 6, RZG3L_CLONE_CHANNEL_PACK(5, 0, 0, 7)),
+	/* SCIF ch4 Bit:5 Value:1 PFC:7 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P5, 3, 5, RZG3L_CLONE_CHANNEL_PACK(5, 1, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 2, 4, RZG3L_CLONE_CHANNEL_PACK(5, 1, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P7, 5, 7, RZG3L_CLONE_CHANNEL_PACK(5, 1, 0, 7)),
+	/* SCIF ch5 Bit:6 Value:0 PFC:7 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PE, 7, 7, RZG3L_CLONE_CHANNEL_PACK(6, 0, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PF, 0, 1, RZG3L_CLONE_CHANNEL_PACK(6, 0, 0, 7)),
+	/* SCIF ch5 Bit:6 Value:1 PFC:7 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P5, 6, 6, RZG3L_CLONE_CHANNEL_PACK(6, 1, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 0, 1, RZG3L_CLONE_CHANNEL_PACK(6, 1, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 5, 6, RZG3L_CLONE_CHANNEL_PACK(6, 1, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P7, 0, 0, RZG3L_CLONE_CHANNEL_PACK(6, 1, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P7, 2, 4, RZG3L_CLONE_CHANNEL_PACK(6, 1, 0, 7)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P8, 0, 2, RZG3L_CLONE_CHANNEL_PACK(6, 1, 0, 7)),
+	/* RSPI ch1 Bit:8 Value:0 PFC:2 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PH, 0, 5, RZG3L_CLONE_CHANNEL_PACK(8, 0, 0, 2)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PD, 5, 7, RZG3L_CLONE_CHANNEL_PACK(8, 0, 0, 2)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PE, 0, 3, RZG3L_CLONE_CHANNEL_PACK(8, 0, 0, 2)),
+	/* RSPI ch1 Bit:8 Value:1 PFC:2 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P5, 0, 6, RZG3L_CLONE_CHANNEL_PACK(8, 1, 0, 2)),
+	/* RSPI ch2 Bit:9 Value:0 PFC:2 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PE, 4, 7, RZG3L_CLONE_CHANNEL_PACK(9, 0, 0, 2)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PF, 0, 2, RZG3L_CLONE_CHANNEL_PACK(9, 0, 0, 2)),
+	/* RSPI ch2 Bit:9 Value:1 PFC:2 */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 0, 6, RZG3L_CLONE_CHANNEL_PACK(9, 1, 0, 2)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P7, 7, 7, RZG3L_CLONE_CHANNEL_PACK(9, 1, 0, 2)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P8, 0, 5, RZG3L_CLONE_CHANNEL_PACK(9, 1, 0, 2)),
+	/* RSCI ch1 Bit:12 Value:0 PFC:{5,6} shared pins based on RSCI mode */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PG, 0, 3, RZG3L_CLONE_CHANNEL_PACK(12, 0, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PA, 0, 3, RZG3L_CLONE_CHANNEL_PACK(12, 0, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PB, 6, 7, RZG3L_CLONE_CHANNEL_PACK(12, 0, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PC, 0, 1, RZG3L_CLONE_CHANNEL_PACK(12, 0, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PD, 4, 7, RZG3L_CLONE_CHANNEL_PACK(12, 0, 1, 5)),
+	/* RSCI ch1 Bit:12 Value:1 PFC:{5,6} shared pins based on RSCI mode */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P5, 0, 3, RZG3L_CLONE_CHANNEL_PACK(12, 1, 1, 5)),
+	/* RSCI ch2 Bit:13 Value:0 PFC:{5,6} shared pins based on RSCI mode */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PH, 0, 3, RZG3L_CLONE_CHANNEL_PACK(13, 0, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PK, 0, 3, RZG3L_CLONE_CHANNEL_PACK(13, 0, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PA, 4, 7, RZG3L_CLONE_CHANNEL_PACK(13, 0, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PD, 0, 3, RZG3L_CLONE_CHANNEL_PACK(13, 0, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PE, 0, 3, RZG3L_CLONE_CHANNEL_PACK(13, 0, 1, 5)),
+	/* RSCI ch2 Bit:13 Value:1 PFC:{5,6} shared pins based on RSCI mode */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P5, 4, 6, RZG3L_CLONE_CHANNEL_PACK(13, 1, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 0, 0, RZG3L_CLONE_CHANNEL_PACK(13, 1, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 5, 6, RZG3L_CLONE_CHANNEL_PACK(13, 1, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P7, 0, 1, RZG3L_CLONE_CHANNEL_PACK(13, 1, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P7, 6, 7, RZG3L_CLONE_CHANNEL_PACK(13, 1, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P8, 0, 1, RZG3L_CLONE_CHANNEL_PACK(13, 1, 1, 5)),
+	/* RSCI ch3 Bit:14 Value:0 PFC:{5,6} shared pins based on RSCI mode */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PE, 6, 7, RZG3L_CLONE_CHANNEL_PACK(14, 0, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PF, 0, 1, RZG3L_CLONE_CHANNEL_PACK(14, 0, 1, 5)),
+	/* RSCI ch3 Bit:14 Value:1 PFC:{5,6} shared pins based on RSCI mode */
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 1, 4, RZG3L_CLONE_CHANNEL_PACK(14, 1, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P7, 2, 5, RZG3L_CLONE_CHANNEL_PACK(14, 1, 1, 5)),
+	RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P8, 2, 5, RZG3L_CLONE_CHANNEL_PACK(14, 1, 1, 5)),
+};
+
 static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl)
 {
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[virq];
@@ -2961,6 +3146,10 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 	if (!cache->smt)
 		return -ENOMEM;
 
+	cache->clone = devm_kzalloc(pctrl->dev, sizeof(*cache->clone), GFP_KERNEL);
+	if (!cache->clone)
+		return -ENOMEM;
+
 	for (u8 i = 0; i < 2; i++) {
 		u32 n_dedicated_pins = pctrl->data->n_dedicated_pins;
 
@@ -3204,6 +3393,19 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 				     "failed to enable GPIO clk\n");
 	}
 
+	if (pctrl->data->clone_pin_configs) {
+		struct device_node *np = pctrl->dev->of_node;
+		u32 offset;
+
+		pctrl->syscon = syscon_regmap_lookup_by_phandle_args(np, "renesas,clonech",
+								     1, &offset);
+		if (IS_ERR(pctrl->syscon))
+			return dev_err_probe(pctrl->dev, PTR_ERR(pctrl->syscon),
+					     "Failed to parse renesas,clonech\n");
+
+		pctrl->clone_offset = offset;
+	}
+
 	raw_spin_lock_init(&pctrl->lock);
 	spin_lock_init(&pctrl->bitmap_lock);
 	mutex_init(&pctrl->mutex);
@@ -3437,6 +3639,14 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 	if (regs->other_poc)
 		cache->other_poc = readb(pctrl->base + regs->other_poc);
 
+	if (pctrl->syscon) {
+		int ret;
+
+		ret = regmap_read(pctrl->syscon, pctrl->clone_offset, cache->clone);
+		if (ret)
+			return ret;
+	}
+
 	if (!atomic_read(&pctrl->wakeup_path))
 		clk_disable_unprepare(pctrl->clk);
 	else
@@ -3454,6 +3664,12 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	unsigned long flags;
 	int ret;
 
+	if (pctrl->syscon) {
+		ret = regmap_write(pctrl->syscon, pctrl->clone_offset, *cache->clone);
+		if (ret)
+			return ret;
+	}
+
 	if (!atomic_read(&pctrl->wakeup_path)) {
 		ret = clk_prepare_enable(pctrl->clk);
 		if (ret)
@@ -3667,6 +3883,8 @@ static struct rzg2l_pinctrl_data r9a08g046_data = {
 	.dedicated_pins = rzg3l_dedicated_pins,
 	.n_port_pins = ARRAY_SIZE(r9a08g046_gpio_configs) * RZG2L_PINS_PER_PORT,
 	.n_dedicated_pins = ARRAY_SIZE(rzg3l_dedicated_pins),
+	.clone_pin_configs = r9a08g046_clone_channel_pin_cfg,
+	.n_clone_pins = ARRAY_SIZE(r9a08g046_clone_channel_pin_cfg),
 	.hwcfg = &rzg3l_hwcfg,
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
-- 
2.43.0


