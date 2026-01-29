Return-Path: <linux-renesas-soc+bounces-27592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJbJBHo0e2lJCQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:20:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBE8AE896
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92E9F3067A26
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4C833FE36;
	Thu, 29 Jan 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYQeChDY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B9933CEA1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681817; cv=none; b=tSv0NKBVUztq+tACSde1dCkcZ80z6UbOpyJe+GQ0BtyVBMHvbfnPcRZiNdltOfX+tOKfud9V2e1VS7PWxH2nlRB8AHQIqH8GXtHIHEjvjrDU7QQiCY952lUNALCOXYSgAcAN3GMOU+LgDfSyLzWT5uJzw9I1VJPtOdBDaFLdONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681817; c=relaxed/simple;
	bh=tiJxoBJKqiDxJyRh8KuDPOyTjxFZmwC+C2EPVKUwaD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZEkDClvN7i7ysVmy3arOn4SDoOw3F3hnFE0dv10JJhDuD7R/telMg/23iy+vFQP0J505V8LYvRDmT8vDw8j/f1mJ+Krwk5XWVn7KqJb5aSTogzjbpG9nD9+QWkRmBBuzzu6pxoSdhezdBh8a0cBw/ltaq5McxW+JA0zMaXr0Wgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYQeChDY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so7998145e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681813; x=1770286613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nayUkHKP6L91MLG9SEcHVEuSxFmIGO+/zRwcQEweek0=;
        b=VYQeChDYDveQvWyJARnWaHKoL4QekX02DOZeibrlahdaEF+WV/5Jo8Tw6HE+n8AQ8V
         06svZuA1P/p366nYidXWtqfoxLOlq0cIoPO0USQWjHKjbuANxNHvhQSyF18XKZtq832e
         FLZaHynB3Thb7cmN8RKNcv0t7ezOQWkfpiXMp0UaOK4CdMqW7tSVo/LuorIA6hpiS4hp
         y03efKas2uCIQyvfPH2s9bLATN9p1QNk1zJTQcj2geYuMDrm4nxOT6b+emGC5aX+K/Lh
         iKHf8ewxMmtsdM8B0LIXEOZ5IoRhGY0NEEcZwtx9Wih/+u7IUAqgjCIdy0euBnJTHdT1
         r2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681813; x=1770286613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nayUkHKP6L91MLG9SEcHVEuSxFmIGO+/zRwcQEweek0=;
        b=V+PK1Ba+MEC3CrWPTxQFE0GlJLXsb03JEy2rOLujrRnt2WqM9uNj6ikrw2Ug4oBQyc
         x7vj64+KMzFBLuhzj66Kp/s1CkGGSV+f9/B790I7E9HHUE3hpLsh18075DK4Gz5eLv3F
         ufLn2SH59M0jA/Qn5RpyH30IEVaMaJzMt5jKXy3Fxx0g5B7CssuI4DT3TVi7U8CCBO3S
         b6y+TilWridvUDA+fe0CfzLuykfLitz2Ea3LTexdsOU0BTaK2uYkorhgWHltexK7dd3K
         PgtjKBlgi7L6VQ3/5j2ATHmILa5AylVy99S9diF+uKV5i0oIY6xBSv5iXU2DmPbReAnN
         QUXQ==
X-Gm-Message-State: AOJu0YzfZokSuyCwRSjrpVKAiIcVzxdCCQpDBwwjBHlECURvM2SoX6rc
	pQ9t/v03d76Md0z3rSbujwSiLfKiL/AphHovdnbkUKlW8O0YUmVlOi/a
X-Gm-Gg: AZuq6aLE7vll/hrhlu4NZlZBpYa/P4w+PlxdCpD93WJ/xSJD6LYqymV67L+Rm0V27Sz
	bLePwvt+91hQGQPOPX2V/K+lg1W2LRPZFmCv4RyVCXe/4YoU6aRquLmB1LJVunSGV7mq0K4nfNP
	hj/p/FRRJUOmWy6G8PMK8mJqtTSu1K5qLTFxsgA2Hv0MRVONZ/jtgJd79sjApXGMDS5pFCpWoyF
	zuA+KrzGVGaMojti0PDpzkM70yB2LySsXhaigyEquJOkGqVLQBIoJUvvUFAwFPbidugWyiTDb+K
	ACVSMw9dyLeHJks16WcrqJaY28EKFkMxWPYiTQe8qCgg+UyiFl0OLICyJBuwonZBz6XIW5CkV3I
	Vafkku+X5q8FZxVAUBfOzlpYfIjUoMbX0LRNTGw0HcxW/RGWWUjOV3nYHQP6WroUJGzo643w3Aq
	a5IxBCU9pRzXxkUelr
X-Received: by 2002:a05:600c:3e16:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-48069c0fde8mr114181015e9.7.1769681813003;
        Thu, 29 Jan 2026 02:16:53 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:52 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 4/9] pinctrl: renesas: rzg2l: Add support for selecting power source for {WDT,AWO,ISO}
Date: Thu, 29 Jan 2026 10:16:39 +0000
Message-ID: <ae0df2a3a8e5ee44a5c19e97b93b52906e6d7488.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27592-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ACBE8AE896
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has support for setting power source that are not
controlled by the following voltage control registers:
  - SD_CH{0,1,2}_POC, XSPI_POC, ETH{0,1}_POC, I3C_SET.POC

Add support for selecting voltages using OTHER_POC register for
setting I/O domain voltage for WDT, ISO and AWO.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 40 +++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 863e779dda02..cf7f9c2e37f8 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -63,10 +63,18 @@
 #define PIN_CFG_SMT			BIT(16)	/* Schmitt-trigger input control */
 #define PIN_CFG_ELC			BIT(17)
 #define PIN_CFG_IOLH_RZV2H		BIT(18)
+#define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
+#define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
+#define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
 
 #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
 #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
 
+#define PIN_CFG_OTHER_POC_MASK	\
+					(PIN_CFG_PVDD1833_OTH_AWO_POC | \
+					 PIN_CFG_PVDD1833_OTH_ISO_POC | \
+					 PIN_CFG_WDTOVF_N_POC)
+
 #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
 					(PIN_CFG_IOLH_##group | \
 					 PIN_CFG_PUPD | \
@@ -146,6 +154,7 @@
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
+#define OTHER_POC		(0x3028) /* known on RZ/G3L only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -906,6 +915,12 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs, u32
 		return ETH_POC(regs->eth_poc, 1);
 	if (caps & PIN_CFG_IO_VMC_QSPI)
 		return QSPI;
+	if (caps & PIN_CFG_PVDD1833_OTH_AWO_POC)
+		return OTHER_POC;
+	if (caps & PIN_CFG_PVDD1833_OTH_ISO_POC)
+		return OTHER_POC;
+	if (caps & PIN_CFG_WDTOVF_N_POC)
+		return OTHER_POC;
 
 	return -EINVAL;
 }
@@ -925,6 +940,13 @@ static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 		return pwr_reg;
 
 	val = readb(pctrl->base + pwr_reg);
+	if (pwr_reg == OTHER_POC) {
+		u32 poc = FIELD_GET(PIN_CFG_OTHER_POC_MASK, caps);
+		u8 offs = ffs(poc) - 1;
+
+		val = (val >> offs) & 0x1;
+	}
+
 	switch (val) {
 	case PVDD_1800:
 		return 1800;
@@ -943,6 +965,7 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
 	int pwr_reg;
+	u8 poc_val;
 	u8 val;
 
 	if (caps & PIN_CFG_SOFT_PS) {
@@ -952,15 +975,15 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 
 	switch (ps) {
 	case 1800:
-		val = PVDD_1800;
+		poc_val = PVDD_1800;
 		break;
 	case 2500:
 		if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
 			return -EINVAL;
-		val = PVDD_2500;
+		poc_val = PVDD_2500;
 		break;
 	case 3300:
-		val = PVDD_3300;
+		poc_val = PVDD_3300;
 		break;
 	default:
 		return -EINVAL;
@@ -970,6 +993,17 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	if (pwr_reg < 0)
 		return pwr_reg;
 
+	if (pwr_reg == OTHER_POC) {
+		u32 poc = FIELD_GET(PIN_CFG_OTHER_POC_MASK, caps);
+		u8 offs = ffs(poc) - 1;
+
+		val = readb(pctrl->base + pwr_reg);
+		val &= ~BIT(offs);
+		val |= (poc_val << offs);
+	} else {
+		val = poc_val;
+	}
+
 	writeb(val, pctrl->base + pwr_reg);
 	pctrl->settings[pin].power_source = ps;
 
-- 
2.43.0


