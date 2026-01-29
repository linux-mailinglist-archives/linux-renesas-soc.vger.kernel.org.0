Return-Path: <linux-renesas-soc+bounces-27582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLxlDFkke2kaBwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:11:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB40EADFBB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC99C30300E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 09:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB8437F728;
	Thu, 29 Jan 2026 09:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfsEJiS6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039F37C0E3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677876; cv=none; b=pZ9EIls5+bhk6b82i8UGfZxw34Pjv3+zSF0w/XAuxJdvHbZlbJBc3mbM1qTOlclWKIw7SWxx2ByD/LsKDnKptVYQhZC6CglUlM+n1vLCzvpVyZdGm+VBtcEJyfk0wxb8UQuT37Z17cUBFqiVMz+cqsoLgJMOEnxbruts6dyjnRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677876; c=relaxed/simple;
	bh=tiJxoBJKqiDxJyRh8KuDPOyTjxFZmwC+C2EPVKUwaD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qREkfP1tnbS578TE4D2zUz38Q2v5cfd4SoNXudOlxn+3IYkHCKIe2VpmQUeRS2X+cWYcXnaEOLF9sJioQJTh7WyUjRINJRtYLCV5MihrilJqcTqR81RnY8szlvsEIpAZz9BspAQeB4ePugu5T9rfivG6sTcTCc/7GB6DN1IKxss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfsEJiS6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so5210675e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 01:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769677873; x=1770282673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nayUkHKP6L91MLG9SEcHVEuSxFmIGO+/zRwcQEweek0=;
        b=jfsEJiS6p7/Wt/X4OfCbvnNSsGuocLN013Q5sJNRrAKlM6YpZaQ3rz6pixM55mfXtX
         cxvvMKhwfr2M/VByOuHVyTYCq9LPwcPHlEGl6G6gJTKlgNf2a+K20Qi9ZdfC1jh5EgfB
         LYIOTkz8L6FOZ4zABooq9xLbEWRmuxSxAN/L3IWMhtLsrhrPAwaWpTs8nWQcINQXjzIW
         Th3Ox3SxRn2NB1O5O1i7dvSzjReW0lT0e0NXCBJyAY7uZv5CBEQPFfytOwyLFT6+GbdD
         0Muyl0wFGDXOBF3J84+4+fR6KIh+LwFij6iFcIuNTysynef6AVE2ZHVy+7hryftNYOQN
         eXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769677873; x=1770282673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nayUkHKP6L91MLG9SEcHVEuSxFmIGO+/zRwcQEweek0=;
        b=xCZcdyuS7rQZtf3yPbbBHi88GGevzrLlfIYnCA+WfvDtWnxwGpcpOiHPwJzFOLnuZl
         xNUZcJ++aEXDSwLCUP6d9wQcQBC+HIHvjDb20FzbLbm7q7ZfauTzAfGat7J6SJj+p1JZ
         YHoiwaq2TjA9Rih9M9UTw4NjMV6Vo4lf0WW1fVlVloXW+p+T05AChbgwJVHfDNDMUy2e
         ZlRPAWmZifNn0PpgLF3BCBaivKGQ0vPLr7LvKm8zqGq5Us0W7KrI0bSOf4ixNAzS6gVW
         kNtAj/YW74AlSer4XQ4yq4/esMDJSg9b2VdH7b7nKbtsZg3UqHX++x59xW0d8b9xRiie
         oLaA==
X-Forwarded-Encrypted: i=1; AJvYcCU4FN3Dey8tNy2ZpHJ3ihHy+CcraQ9JN/MAMtB51WNQHKLDUghmgKJDWkjmwwOPnr0DfxGsQK43wd7p/so9FKYmXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8JtIp4fGeDHd/Dy/4bPMxjapzcmF6aW+0F7ffFxv0gxapNrf8
	+dNINkj5phu0aLBO/4tIsIoP0ze+iDOA++xa4iKd6Q0XycoXMrMnmN+j
X-Gm-Gg: AZuq6aI+HhZhSIPV4bkUOPHeS6IfIdeSXpb5JkNaNEMiRoPzvh0C/LtBTvB0dV0Nd0W
	yTW1YDjNeqSfhZtqRGW3h+zObxUhzDOtyGXomKtUg5x8odEAyECgqIHgVyna7ayCKZkKzng41LB
	lhcrqCk/ET5PVdHjWFdvbR/JOB+1YgoFIi2W84GTW3fm+FDUQwHexWJIFP72xiCdvbsDNxdkwrf
	UPelsTNzXW9CKSZjEVzR6ckYRUnIZ+Z/lTHf8GRrLM9Vd0y1KC857PetroAWkVsnPMPMXHESIgF
	rQfoXbOuh263QRkSNvC4o9TY9POXzhsfHcVfKfZEWnUkMF+Gekie4BG/cDk0b7H8tVZ/D4jm40h
	PIVMrbXgqqYeiYuUjSZ2fyJhORzEm5rfCLR0/wKdJG0XFYiyrm/yoGbFTUFUktLhDQbPrpHH8Wb
	QMzcuaeBzsRjuHiAMN
X-Received: by 2002:a05:600c:6812:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-48069c47cb8mr94006635e9.21.1769677872922;
        Thu, 29 Jan 2026 01:11:12 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:12 -0800 (PST)
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
Subject: [PATCH 4/9] pinctrl: renesas: rzg2l: Add support for selecting power source for {WDT,AWO,ISO}
Date: Thu, 29 Jan 2026 09:10:55 +0000
Message-ID: <20260129091108.95277-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
References: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27582-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DB40EADFBB
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


