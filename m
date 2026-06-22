Return-Path: <linux-renesas-soc+bounces-34335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ESMcJupnOWqHrwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 18:50:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 511326B1455
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 18:50:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DgzVwnJT;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1335E3034516
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424B833D6F7;
	Mon, 22 Jun 2026 16:48:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7499C313283
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 16:48:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146907; cv=none; b=DfP944TJ86qyVG6Wj1TqwH8J3AkZmzdqhOkyt8CRDeFtKQPjm5VHNh4Til9nFdBLgmYE5Vgxmc1YskJdAEOCfgTVOIaVPM77hHy3xQLhm5yUM8Q9ePsZRkxamWF8GqgDNHeGH7mWq4yLXXQvD9tcPnbkGTCNpQnRKJmXhgSh/jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146907; c=relaxed/simple;
	bh=xUNQIjnSZppBkS+lS4ZuH5bYQreeyckf9JRy/kIPlvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LA4oVZIOMDEWdqT0aCcEBMyaTuuD/OVzP4vPpMYs3tOkslYAlpd8VHWA6roQjA1nL8t/gZcXqvyUfqNClxJPJWbL7203lMNww9qhYQAQKEQeeJQvFBYY1MPeAjQFLUeRfLYtanM8b3Tfe38Bp5hro+7n+yFHAzSPNAZj4MfNm3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgzVwnJT; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef29c5561so2597125f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782146904; x=1782751704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THfROfJGs5QY5jEt58vDISmT0BK25AYjx+848LeMMAs=;
        b=DgzVwnJTpprg3Sls15Uziiy/yQa/AVhaLVpg5gG0e032gCu5QTkdjJZwBYvAUYdqUP
         2IUQ9jGAazCjNq9L6fgED/q/lv6kUg68jYv46HnGD+4YmwHlk8VhEAZneRe7+rWyQhAl
         9bnlDZD3BtOflQh1OLU42Wtdlb87XSjNeVu+8Sfr524upDBDhx4QNMuoRKGKXfIdCzkp
         /ZY7UkJMzMJlfpnVsAqPpK4JpuhMQpreDqWOAWVQYja4Bi4sg0iIKIZsExugxqADrXsW
         0X4TFAWSgEebRkz0D/5nd+viLgoqic+6dtN/ut2GcWt51vGQdyfl7OuL2DvBZToX0vyW
         zK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782146904; x=1782751704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=THfROfJGs5QY5jEt58vDISmT0BK25AYjx+848LeMMAs=;
        b=eEIw/aUvlnKlCD0fwoSHnUrpwZXor2cFDHjdBHgPTa7t0RUuSZ8ZhZvCb/fWG93rx2
         Ei/9pAgM/2Sq0mkvsdoGB6bGahc3ak8I9c/xdpqPH+EvR6qYYtvDDbyL8zocW0W5AEWi
         23AbgQV5xfGTml0Yy+UcR8JpmrB3LmMlp6HMJPdfxKanfY1N6P3utqbcYaVGscAbrH+z
         QmNRE3vYeNsPL/GDcQDFeaiMYQAAas8n5z342AFC08vootFOIKqaU0wtiXNPVITNMrA8
         n6RRymkygWROY1mp31VKLib5rsVqhvtLcaNuyHWO/0j1/uKI5i0ohCi8GpBiJJWaqedn
         SQ4w==
X-Forwarded-Encrypted: i=1; AHgh+Ro2FPAG5MA4gRNQOq6i4ANtIhjdFOilFuRt/RYPUefI7FOmdskmfQcWlRZl7FmnDBf9uibrIxqFQCwpOmAGKskzaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWko9ts8WdT3cpmgVhlPF2HjMA72JnnScIKDkG/qk6CxPmci9j
	b3Y870VnTMQib1kElqqOOAjaiCkRKaoysZ26YmBGfnb4iRkEJ6NN8ZL5
X-Gm-Gg: AfdE7cnhaWTCKNwasrL5xHRFAcvvMyEJJRe89GM/CjmIGRcfcGg/XflA/4MZZ1JmX4A
	yOODkUGAkwoueBvFEFpVYXYqV+78yD0J6Hlv4ceNRQ576CcDx86uHcBYc4AKlgWyUHaAoBGEk2q
	K5VYW1JugXFrvjLMT3Z6zAuFwceizaMsXQBttdMAPs1qKJhbh8P6hynLRb+B2B1eX0QBGoWKSGM
	pjYkCU5TCWs37WkmxRRcUjXxe+qdB73SMqjOplED4nlxMIKZXS199bXv8zpgo3ea3UPkF7bWD1+
	uvNPgBOW5O233W/mlnlC+B5JFNzz6itb2JuUlnceMtd/jAo+f76IcM7HR2OPzySuO/daTBGE5Nn
	UNL4rmWz6P8sCLxmCcEvVW5Zc1X/50shBVpZ1IbjUPDlaMOr0RtzzF+dPCAZEHhJI5gnZ4xjKbY
	Hdfk46fmyDGNyrIy4pQCEU
X-Received: by 2002:a5d:64e7:0:b0:460:edd:ca89 with SMTP id ffacd0b85a97d-46502baf740mr24475241f8f.26.1782146903828;
        Mon, 22 Jun 2026 09:48:23 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f56aasm27433872f8f.6.2026.06.22.09.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 09:48:23 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v18 1/4] pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L
Date: Mon, 22 Jun 2026 17:48:11 +0100
Message-ID: <20260622164819.184674-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622164819.184674-1-biju.das.jz@bp.renesas.com>
References: <20260622164819.184674-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34335-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linusw@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 511326B1455

From: Biju Das <biju.das.jz@bp.renesas.com>

Add power-on control (POC) support for SD channels 1 and 2 on the RZ/G3L
SoC (r9a08g046).

Introduce PIN_CFG_IO_VMC_SD2 capability flag (bit 22) and SD_CH2_POC
register offset (0x3024). Extend rzg2l_caps_to_pwr_reg() to return
SD_CH2_POC when PIN_CFG_IO_VMC_SD2 is set.

Replace RZG3L_MPXED_PIN_FUNCS() with RZG2L_MPXED_COMMON_PIN_FUNCS() for
port PG and PH pins, dropping PIN_CFG_SOFT_PS which is inappropriate for
SD pins, and annotate them with PIN_CFG_IO_VMC_SD1 and PIN_CFG_IO_VMC_SD2
respectively.

Annotate all RZ/G3L SD0 dedicated pins (CLK, CMD, RST#, DS, DAT0–DAT7)
with PIN_CFG_IO_VMC_SD0 so that power-source register lookups work
correctly for those pins.

Add sd_ch2 field to rzg2l_register_offsets and rzg2l_pinctrl_reg_cache to
save and restore the SD_CH2_POC register across suspend/resume cycles.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v17->v18:
 * Moved sd_ch2 variable near to sd_ch[].
v1->v17:
 * No change.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 74 +++++++++++++++++--------
 1 file changed, 50 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index be52d47d77ae..e3e24ce917c9 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -69,6 +69,7 @@
 #define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
 #define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
 #define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
+#define PIN_CFG_IO_VMC_SD2		BIT(22) /* known on RZ/G3L only */
 
 #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
 #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
@@ -254,6 +255,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
  * struct rzg2l_register_offsets - specific register offsets
  * @pwpr: PWPR register offset
  * @sd_ch: SD_CH register offset
+ * @sd_ch2: SD_CH2_POC register offset
  * @eth_poc: ETH_POC register offset
  * @oen: OEN register offset
  * @qspi: QSPI register offset
@@ -262,6 +264,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
 struct rzg2l_register_offsets {
 	u16 pwpr;
 	u16 sd_ch;
+	u16 sd_ch2;
 	u16 eth_poc;
 	u16 oen;
 	u16 qspi;
@@ -368,6 +371,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @nod: NOD registers cache
  * @clone: Clone register cache
  * @sd_ch: SD_CH registers cache
+ * @sd_ch2: SD_CH2_POC registers cache
  * @eth_poc: ET_POC registers cache
  * @oen: Output Enable register cache
  * @other_poc: OTHER_POC register cache
@@ -386,6 +390,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*nod[2];
 	u32	clone;
 	u8	sd_ch[2];
+	u8	sd_ch2;
 	u8	eth_poc[2];
 	u8	oen;
 	u8	other_poc;
@@ -474,20 +479,32 @@ static const u64 r9a08g046_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG3L_MPXED_PIN_FUNCS(B)),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3, RZG2L_MPXED_COMMON_PIN_FUNCS(B) | PIN_CFG_IEN |
+				    PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 6, RZG3L_MPXED_PIN_FUNCS_POC(B, ISO)),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 7, RZG3L_MPXED_PIN_FUNCS_POC(B, ISO)),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG3L_MPXED_PIN_FUNCS(B)),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 0, RZG3L_MPXED_PIN_FUNCS(A) | PIN_CFG_IEN),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 1, RZG3L_MPXED_PIN_FUNCS(A)),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 2, RZG3L_MPXED_PIN_FUNCS(A)),
@@ -1053,6 +1070,8 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
 		return SD_CH(regs->sd_ch, 0);
 	if (caps & PIN_CFG_IO_VMC_SD1)
 		return SD_CH(regs->sd_ch, 1);
+	if (caps & PIN_CFG_IO_VMC_SD2)
+		return regs->sd_ch2;
 	if (caps & PIN_CFG_IO_VMC_ETH0)
 		return ETH_POC(regs->eth_poc, 0);
 	if (caps & PIN_CFG_IO_VMC_ETH1)
@@ -2677,28 +2696,28 @@ static const struct rzg2l_dedicated_configs rzg3l_dedicated_pins[] = {
 	  (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },
 	{ "SCIF0_TXD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
 	  (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },
-	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B) },
+	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0) },
 	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
+	{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0) },
 	{ "SD0_DS", RZG2L_SINGLE_PIN_PACK(0x9, 5,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT0", RZG2L_SINGLE_PIN_PACK(0x0a, 0,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT1", RZG2L_SINGLE_PIN_PACK(0x0a, 1,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT2", RZG2L_SINGLE_PIN_PACK(0x0a, 2,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT3", RZG2L_SINGLE_PIN_PACK(0x0a, 3,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT4", RZG2L_SINGLE_PIN_PACK(0x0a, 4,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT5", RZG2L_SINGLE_PIN_PACK(0x0a, 5,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT6", RZG2L_SINGLE_PIN_PACK(0x0a, 6,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT7", RZG2L_SINGLE_PIN_PACK(0x0a, 7,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 };
 
 static const u32 r9a08g046_clone_channel_data[] = {
@@ -3672,6 +3691,9 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 			cache->eth_poc[i] = readb(pctrl->base + ETH_POC(regs->eth_poc, i));
 	}
 
+	if (regs->sd_ch2)
+		cache->sd_ch2 = readb(pctrl->base + regs->sd_ch2);
+
 	if (regs->qspi)
 		cache->qspi = readb(pctrl->base + regs->qspi);
 	cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
@@ -3724,6 +3746,9 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	rzg2l_oen_write_with_pwpr(pctrl, cache->oen);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
+	if (regs->sd_ch2)
+		writeb(cache->sd_ch2, pctrl->base + regs->sd_ch2);
+
 	for (u8 i = 0; i < 2; i++) {
 		if (regs->sd_ch)
 			writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
@@ -3791,6 +3816,7 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 	.regs = {
 		.pwpr = 0x3000,
 		.sd_ch = 0x3004,
+		.sd_ch2 = 0x3024,
 		.eth_poc = 0x3010,
 		.oen = 0x3018,
 		.other_poc = OTHER_POC,
-- 
2.43.0


