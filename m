Return-Path: <linux-renesas-soc+bounces-31783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PYxFVUj82nIxQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 11:39:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF0A49FF47
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 11:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44E5F3078E4C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 09:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BBB3A5451;
	Thu, 30 Apr 2026 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAxF5Xgg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED97A37C114
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541677; cv=none; b=I8Y+pHiuXYQv8VT3Jixmt2bGQkXCAWBaMFsMx2Mv42z+nEqwdWN9XEEeZn3aetDrldBVvd6EOPy/FknilW61ScxavDuBaBEyi62WrhE/xJVRqDETY7FlRTw/8YikPUuQx0oFThfhRKUxjP1cWs7Fa/iceFyFfEcncj/KqPf9EX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541677; c=relaxed/simple;
	bh=bRRCmu8C4F31eWNc7VQve9S7Gr5W0Etb7eUVvfobCAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pr93yUxe5V9jMllNKralpddrqw959rJ3O1KwActznU0FLHkAwRt6tSLUqVK1eVKefi3iBnHuv7ci9EvuN58fRcTdBQhI1TJwOLdNMsKluZzATrQZiZcN0k59+8sseoXdpYXDRNzIF2o4hhIXaaEFFRp+2gAurN3lpLEx63T5Acg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAxF5Xgg; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cf7683a28so460624f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777541671; x=1778146471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7F9bDQDxF2cSrrjwjwfUqhNrtR5ZsCqrwmYlmj4OmQ=;
        b=EAxF5Xgg/7bOQvRXPFWdAX29Nug6febB8B2AoX6HpCXAZzq9YnULkBGszbZ9NwCqcY
         yI4h/rpSh+Jk5CvkyPT6N77fLbtbng0AjqrENpfP0gtiEzlfinmjBmJjWAmY9K34ockr
         HcI4JpxScMOxIIK6F45Qlms1vQIWMHqLx8e/yOFGgNndbO1YzyFaqezvE6uwLvs5AEBk
         sMaeVSbFj4kSZI01eEuXz1FMIMKm21X2ThVnSjz43J5z59Y/r4hrMCusQSmiuCq9yfrs
         YoewgT5gSDIiS6nTUy67qqhWY1GvrKhFT79Ikb1LAM8wQjtGkSmMXxYo/M7oOS65zRFq
         UYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541671; x=1778146471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e7F9bDQDxF2cSrrjwjwfUqhNrtR5ZsCqrwmYlmj4OmQ=;
        b=M5OCE4u21G/O5rq2pAKHrxBBV4pVAwI+FNlaKpU1qq2QhftoCMjpvCQ1gTTApNQkA7
         uW26HLl5AJqHctUhgdD01jjrEZu9oNR6pjMviOQcsseEuXQo3DnQLcrbMFg7Z0UVWLDv
         StIVefW/8VryYI2H5ABoDZ33vAy7QrXfdlDmkPjsLPYEe22YhkeZA2bcgtcljXCo5Q0J
         P3kO2XpQlu+H32G8jSIhaZ+Fc7I6AdfZkK9BI5sxvxelUTaf/yhc8N7HRUmAwsrbzXVI
         n+YYxM0HeD6yUN7QkUPY8IKo7r8tjIRTau9S8z/0E8DRQdR8R5T3YLJBHPYiT+HAgKff
         W+Dg==
X-Forwarded-Encrypted: i=1; AFNElJ9aqkhJq6/zNaCthsRLkXo2+9mvrUf7FXB3TOL2F5QgdAOX0oiWzw2cUAe1BWdcGGVxH07wFgnaEd2z2wixgCUbsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIyh2wk6je9okqSwP/PIV1ywRPci/zg+M3MQnJYkePDZZZbmR3
	GfmSl8rN3si0GHXT3lcBwvWyvRGaloPvvXb1JAdWbRQWFtF+Q+ytxtpu
X-Gm-Gg: AeBDietnDUjMwlYo3CATUwkX/tJRrR4ybvshUHf0O4Ha1FSHeCrlpZYQQqnr5hxTFtv
	XVVQURICo8zPKspwG5JNRpwbOKA5rGXJuC5wjKeMYifpUlNyUEd/jQr3hCeYVCeTYziXutpP1rs
	QhfYge+6mC3R62jX/1CgZSKCJxWiAalwcjr6hcq0/W2x4J8x09QLHRH2JpQx1SK4ukrd4A/ode1
	s6AyCEzSB1cxaHkm/z0H8QG9awu1JBagAk18rhSlNf5XTybC9X62tprsLmFJl2SQrZkLmZ4HLG1
	w1RSB40tJ7QpU4IcnwNdsCYZt5h/5CQ+LHzYayGWrWa2/pBYSvAxpxvC7fobaFgnmxyNUV/5HDu
	52b1n5U3I80SXEMmEWOcmea+UR1Yku3Dx/TGWC/Nd7FVoo2UhKDnU6Hio4QOPj9UjO997MzxhT/
	gdxG7oV3o/PQa0WN0rPZMwqBqxPhnzNeN/u6HGkR8C4nVVf9vv+JgEzI+y
X-Received: by 2002:a05:6000:3105:b0:43d:7783:c684 with SMTP id ffacd0b85a97d-4493f71983dmr3383105f8f.43.1777541670880;
        Thu, 30 Apr 2026 02:34:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm11953913f8f.28.2026.04.30.02.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:30 -0700 (PDT)
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
Subject: [PATCH v4 5/7] pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
Date: Thu, 30 Apr 2026 10:34:10 +0100
Message-ID: <20260430093422.74812-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4EF0A49FF47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-31783-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add pinctrl driver support for RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Dropped extra white spaces in SD0_CLK and SD0_DATA0 entries.
 * Renamed SD0_DATA* → SD0_DAT* to match the pin function spreadsheet.
 * Renamed SCIF_{RXD,TXD} → SCIF0_{RXD,TXD} to match the pin function
   spreadsheet.
 * .pin_to_oen_bit = rzg2l_pin_to_oen_bit() and dropped oen_max_port from
   rzg3l_hwcfg.
v2->v3:
 * Updated r9a08g046_gpio_configs[] by replacing the typo AWO->ISO.
 * Added PIN_CFG_PUPD to RZG3L_MPXED_ETH_PIN_FUNCS macro
 * Replaced RZG2L_MPXED_COMMON_PIN_FUNCS->RZG3L_MPXED_PIN_FUNCS in 
   RZG3L_MPXED_PIN_FUNCS_POC macro for setting power source for pins.
v1->v2:
 * No change
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 228 ++++++++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 2a46ba7b3709..004096d5d1d1 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -26,6 +26,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
+#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
@@ -93,6 +94,18 @@
 
 #define RZG2L_MPXED_ETH_PIN_FUNCS(x)	((x) | PIN_CFG_NF)
 
+#define RZG3L_MPXED_ETH_PIN_FUNCS(ether) \
+					(PIN_CFG_IO_VMC_##ether | \
+					 PIN_CFG_IOLH_C | \
+					 PIN_CFG_PUPD | \
+					 PIN_CFG_NF)
+
+#define RZG3L_MPXED_PIN_FUNCS(group)	(RZG2L_MPXED_COMMON_PIN_FUNCS(group) | \
+					 PIN_CFG_SOFT_PS)
+
+#define RZG3L_MPXED_PIN_FUNCS_POC(grp, poc) (RZG2L_MPXED_COMMON_PIN_FUNCS(grp) | \
+					 PIN_CFG_PVDD1833_OTH_##poc##_POC)
+
 #define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(61, 54)
 #define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(53, 46)
 #define PIN_CFG_MASK			GENMASK_ULL(31, 0)
@@ -230,6 +243,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
  * @eth_poc: ETH_POC register offset
  * @oen: OEN register offset
  * @qspi: QSPI register offset
+ * @other_poc: OTHER_POC register offset
  */
 struct rzg2l_register_offsets {
 	u16 pwpr;
@@ -237,6 +251,7 @@ struct rzg2l_register_offsets {
 	u16 eth_poc;
 	u16 oen;
 	u16 qspi;
+	u16 other_poc;
 };
 
 /**
@@ -337,6 +352,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @nod: NOD registers cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
+ * @other_poc: OTHER_POC register cache
  * @oen: Output Enable register cache
  * @qspi: QSPI registers cache
  */
@@ -354,6 +370,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	oen;
+	u8      other_poc;
 	u8	qspi;
 };
 
@@ -403,6 +420,60 @@ static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
 	return 0;
 }
 
+static const u64 r9a08g046_variable_pin_cfg[] = {
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 0, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 1, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 2, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 3, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 4, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 0, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 1, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0) | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 2, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 3, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 4, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 0, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 1, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 2, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 3, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 4, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 0, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 1, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1) | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 2, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 3, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 4, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG3L_MPXED_PIN_FUNCS(B)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 6, RZG3L_MPXED_PIN_FUNCS_POC(B, ISO)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 7, RZG3L_MPXED_PIN_FUNCS_POC(B, ISO)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG3L_MPXED_PIN_FUNCS(B)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 0, RZG3L_MPXED_PIN_FUNCS(A) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 1, RZG3L_MPXED_PIN_FUNCS(A)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 2, RZG3L_MPXED_PIN_FUNCS(A)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 3, RZG3L_MPXED_PIN_FUNCS(A)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 4, RZG3L_MPXED_PIN_FUNCS(A)),
+};
+
 static const u64 r9a09g047_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PA, 0, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PA, 1, RZV2H_MPXED_PIN_FUNCS),
@@ -2130,6 +2201,70 @@ static const u64 r9a09g047_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(4, 0x3c, RZV2H_MPXED_PIN_FUNCS),	/* PS */
 };
 
+static const char * const rzg3l_gpio_names[] = {
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "",
+	"P20", "P21", "P22", "P23", "P24", "P25", "P26", "P27",
+	"P30", "P31", "P32", "P33", "P34", "P35", "P36", "P37",
+	"", "", "", "", "", "", "", "",
+	"P50", "P51", "P52", "P53", "P54", "P55", "P56", "P57",
+	"P60", "P61", "P62", "P63", "P64", "P65", "P66", "P67",
+	"P70", "P71", "P72", "P73", "P74", "P75", "P76", "P77",
+	"P80", "P81", "P82", "P83", "P84", "P85", "P86", "P87",
+	"", "", "", "", "", "", "", "",
+	"PA0", "PA1", "PA2", "PA3", "PA4", "PA5", "PA6", "PA7",
+	"PB0", "PB1", "PB2", "PB3", "PB4", "PB5", "PB6", "PB7",
+	"PC0", "PC1", "PC2", "PC3", "PC4", "PC5", "PC6", "PC7",
+	"PD0", "PD1", "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
+	"PE0", "PE1", "PE2", "PE3", "PE4", "PE5", "PE6", "PE7",
+	"PF0", "PF1", "PF2", "PF3", "PF4", "PF5", "PF6", "PF7",
+	"PG0", "PG1", "PG2", "PG3", "PG4", "PG5", "PG6", "PG7",
+	"PH0", "PH1", "PH2", "PH3", "PH4", "PH5", "PH6", "PH7",
+	"", "", "", "", "", "", "", "",
+	"PJ0", "PJ1", "PJ2", "PJ3", "PJ4", "PJ5", "PJ6", "PJ7",
+	"PK0", "PK1", "PK2", "PK3", "PK4", "PK5", "PK6", "PK7",
+	"PL0", "PL1", "PL2", "PL3", "PL4", "PL5", "PL6", "PL7",
+	"PM0", "PM1", "PM2", "PM3", "PM4", "PM5", "PM6", "PM7",
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "",
+	"PS0", "PS1", "PS2", "PS3", "PS4", "PS5", "PS6", "PS7",
+};
+
+static const u64 r9a08g046_gpio_configs[] = {
+	0x0,
+	0x0,
+	RZG2L_GPIO_PORT_PACK(2, 0x22, PIN_CFG_NF | PIN_CFG_IEN),	/* P2 */
+	RZG2L_GPIO_PORT_PACK(7, 0x23, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P3 */
+	0x0,
+	RZG2L_GPIO_PORT_PACK(7, 0x25, RZG3L_MPXED_PIN_FUNCS_POC(A, ISO)), /* P5 */
+	RZG2L_GPIO_PORT_PACK(7, 0x26, RZG3L_MPXED_PIN_FUNCS_POC(A, ISO)), /* P6 */
+	RZG2L_GPIO_PORT_PACK(8, 0x27, RZG3L_MPXED_PIN_FUNCS_POC(A, ISO)), /* P7 */
+	RZG2L_GPIO_PORT_PACK(6, 0x28, RZG3L_MPXED_PIN_FUNCS_POC(A, ISO)), /* P8 */
+	0x0,
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2a),				/* PA */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2b),				/* PB */
+	RZG2L_GPIO_PORT_PACK(3, 0x2c, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),	/* PC */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2d),				/* PD */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2e),				/* PE */
+	RZG2L_GPIO_PORT_PACK(3, 0x2f, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),	/* PF */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x30),				/* PG */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(6, 0x31),				/* PH */
+	0x0,
+	RZG2L_GPIO_PORT_PACK_VARIABLE(5, 0x33),				/* PJ */
+	RZG2L_GPIO_PORT_PACK(4, 0x34, RZG3L_MPXED_PIN_FUNCS_POC(B, ISO)), /* PK */
+	RZG2L_GPIO_PORT_PACK(5, 0x35, RZG3L_MPXED_PIN_FUNCS(C)),	/* PL */
+	RZG2L_GPIO_PORT_PACK(8, 0x36, RZG3L_MPXED_PIN_FUNCS(C)),	/* PM */
+	0x0,
+	0x0,
+	0x0,
+	0x0,
+	0x0,
+	RZG2L_GPIO_PORT_PACK(2, 0x3c, RZG3L_MPXED_PIN_FUNCS(A)),	/* PS */
+};
+
 static const char * const rzv2h_gpio_names[] = {
 	"P00", "P01", "P02", "P03", "P04", "P05", "P06", "P07",
 	"P10", "P11", "P12", "P13", "P14", "P15", "P16", "P17",
@@ -2468,6 +2603,37 @@ static struct rzg2l_dedicated_configs rzg3e_dedicated_pins[] = {
 	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
 };
 
+static const struct rzg2l_dedicated_configs rzg3l_dedicated_pins[] = {
+	{ "WDTOVF_N", RZG2L_SINGLE_PIN_PACK(0x5, 0,
+	  (PIN_CFG_IOLH_A | PIN_CFG_WDTOVF_N_POC)) },
+	{ "SCIF0_RXD", RZG2L_SINGLE_PIN_PACK(0x6, 0,
+	  (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },
+	{ "SCIF0_TXD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
+	  (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },
+	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B) },
+	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B) },
+	{ "SD0_DS", RZG2L_SINGLE_PIN_PACK(0x9, 5,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DAT0", RZG2L_SINGLE_PIN_PACK(0x0a, 0,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DAT1", RZG2L_SINGLE_PIN_PACK(0x0a, 1,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DAT2", RZG2L_SINGLE_PIN_PACK(0x0a, 2,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DAT3", RZG2L_SINGLE_PIN_PACK(0x0a, 3,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DAT4", RZG2L_SINGLE_PIN_PACK(0x0a, 4,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DAT5", RZG2L_SINGLE_PIN_PACK(0x0a, 5,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DAT6", RZG2L_SINGLE_PIN_PACK(0x0a, 6,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DAT7", RZG2L_SINGLE_PIN_PACK(0x0a, 7,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+};
+
 static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl)
 {
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[virq];
@@ -3025,6 +3191,9 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 	BUILD_BUG_ON(ARRAY_SIZE(r9a08g045_gpio_configs) * RZG2L_PINS_PER_PORT >
 		     ARRAY_SIZE(rzg2l_gpio_names));
 
+	BUILD_BUG_ON(ARRAY_SIZE(r9a08g046_gpio_configs) * RZG2L_PINS_PER_PORT >
+		     ARRAY_SIZE(rzg3l_gpio_names));
+
 	BUILD_BUG_ON(ARRAY_SIZE(r9a09g047_gpio_configs) * RZG2L_PINS_PER_PORT >
 		     ARRAY_SIZE(rzg3e_gpio_names));
 
@@ -3337,6 +3506,8 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 	if (regs->qspi)
 		cache->qspi = readb(pctrl->base + regs->qspi);
 	cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
+	if (regs->other_poc)
+		cache->other_poc = readb(pctrl->base + regs->other_poc);
 
 	if (!atomic_read(&pctrl->wakeup_path))
 		clk_disable_unprepare(pctrl->clk);
@@ -3363,6 +3534,8 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 
 	if (regs->qspi)
 		writeb(cache->qspi, pctrl->base + regs->qspi);
+	if (regs->other_poc)
+		writeb(cache->other_poc, pctrl->base + regs->other_poc);
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	rzg2l_oen_write_with_pwpr(pctrl, cache->oen);
@@ -3431,6 +3604,40 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 	.oen_max_pin = 0,
 };
 
+static const struct rzg2l_hwcfg rzg3l_hwcfg = {
+	.regs = {
+		.pwpr = 0x3000,
+		.sd_ch = 0x3004,
+		.eth_poc = 0x3010,
+		.oen = 0x3018,
+		.other_poc = OTHER_POC,
+	},
+	.iolh_groupa_ua = {
+		/* 1v8 power source */
+		[RZG2L_IOLH_IDX_1V8] = 2200, 4400, 9000, 10000,
+		/* 3v3 power source */
+		[RZG2L_IOLH_IDX_3V3] = 1900, 4000, 8000, 9000,
+	},
+	.iolh_groupb_ua = {
+		/* 1v8 power source */
+		[RZG2L_IOLH_IDX_1V8] = 7000, 8000, 9000, 10000,
+		/* 3v3 power source */
+		[RZG2L_IOLH_IDX_3V3] = 4000, 6000, 8000, 9000,
+	},
+	.iolh_groupc_ua = {
+		/* 1v8 power source */
+		[RZG2L_IOLH_IDX_1V8] = 5200, 6000, 6550, 6800,
+		/* 2v5 source */
+		[RZG2L_IOLH_IDX_2V5] = 4700, 5300, 5800, 6100,
+		/* 3v3 power source */
+		[RZG2L_IOLH_IDX_3V3] = 4500, 5200, 5700, 6050,
+	},
+	.tint_start_index = 17,
+	.drive_strength_ua = true,
+	.func_base = 0,
+	.oen_max_pin = 1, /* Pin 1 of P{B,E}1_ISO is the maximum OEN pin. */
+};
+
 static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 	.regs = {
 		.pwpr = 0x3000,
@@ -3524,6 +3731,23 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
 
+static struct rzg2l_pinctrl_data r9a08g046_data = {
+	.port_pins = rzg3l_gpio_names,
+	.port_pin_configs = r9a08g046_gpio_configs,
+	.n_ports = ARRAY_SIZE(r9a08g046_gpio_configs),
+	.variable_pin_cfg = r9a08g046_variable_pin_cfg,
+	.n_variable_pin_cfg = ARRAY_SIZE(r9a08g046_variable_pin_cfg),
+	.dedicated_pins = rzg3l_dedicated_pins,
+	.n_port_pins = ARRAY_SIZE(r9a08g046_gpio_configs) * RZG2L_PINS_PER_PORT,
+	.n_dedicated_pins = ARRAY_SIZE(rzg3l_dedicated_pins),
+	.hwcfg = &rzg3l_hwcfg,
+	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
+	.pmc_writeb = &rzg2l_pmc_writeb,
+	.pin_to_oen_bit = &rzg2l_pin_to_oen_bit,
+	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
+	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
+};
+
 static struct rzg2l_pinctrl_data r9a09g047_data = {
 	.port_pins = rzg3e_gpio_names,
 	.port_pin_configs = r9a09g047_gpio_configs,
@@ -3604,6 +3828,10 @@ static const struct of_device_id rzg2l_pinctrl_of_table[] = {
 		.compatible = "renesas,r9a08g045-pinctrl",
 		.data = &r9a08g045_data,
 	},
+	{
+		.compatible = "renesas,r9a08g046-pinctrl",
+		.data = &r9a08g046_data,
+	},
 	{
 		.compatible = "renesas,r9a09g047-pinctrl",
 		.data = &r9a09g047_data,
-- 
2.43.0


