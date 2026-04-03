Return-Path: <linux-renesas-soc+bounces-30860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GcZM3XLz2m50gYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 16:15:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCE0395104
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 16:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89B5E303CFA7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 14:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197683C343A;
	Fri,  3 Apr 2026 14:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="B9wrhlHR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F37534028B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 14:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225634; cv=none; b=ubum57Q2scCl7uBsWJwYRnFEWJa0fW2wI/hDVCgc55KumzaUZJhVh3RvWeF5GYAxUh1Tw/91w8/VGNOs1jtgA/JiyoN2S58RpdQUASfvBOXfYuPZtHqDNy4xq9qLLP51pDiGbbsXILbinRN4+zZaQtC1ADZnc9Qz+kZpC4C7+h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225634; c=relaxed/simple;
	bh=hlyJIavqEwWzQ5JpKI8Kq0C65i+j6Bp9RsAkLXjjm4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNEwNG4SRQ7oAI1bT1xcYq/uZ5wy44pYM2mK/Erucr266yZ552gQcRYrvt+N8cefZTm6glpzPLv5pO+Vo7LPy0zteB7ZiWYf9HT/z/hPq1CxbOdPNAKW6+PRW+P6jH+H9UnjWG6KDObiM36u4vcSyRpgNGqblGcjvRIFxhl5rY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=B9wrhlHR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so1176148f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 07:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775225631; x=1775830431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joY7wHV2BpXk6sjEVzpCePuNDBcrRPT/y3BWfnAUtlM=;
        b=B9wrhlHRkIZfmtoFAf7414j4z/ey+sCqc0aFajooNiTVWzrgOe7UeW+aZO5IpexunW
         9YM/DKrqmQTh9U8N6VrXAqc9Im7++oYHfH7BMXem1UZg2xXzD4ElwaNkSGIw7S6bjQ4b
         Ix8wKwdgrPliDzI3jLg5qPuYk32b9G66y+s9qjvdiXJN6uBUDfTVCNHuh89h95tWSeXL
         UyLal3J6+hC2BU4rDhrNg5rNsMBsGHJfdW45Sr09UTsTN0FPi6BtsZOinv8+YwpAoX2k
         i8+mgl7MYK2PVUb+A06UTqvQ+llB5yxLpsCGOIvDE2PUYNmwwue7FxtiNSZlMNc9Z3m4
         Xt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225631; x=1775830431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=joY7wHV2BpXk6sjEVzpCePuNDBcrRPT/y3BWfnAUtlM=;
        b=pyl6mADUJhmEhu0fBoSFkzgd6iJNz+pbOomrRuS+X4/VswDeoHEH8Y36Qb17fsZpi4
         qualDZEBL0/ZBZgvRvbqJhZWhHKdZZFBRfk/hEYBOFeWC+nlCsMTSaYGku273arq5XMv
         ct1Ri2liwM/pMZDVBl9au3+m4mJNlXiveuLrVTXe8WfkdI7jj0GAy//6kfbQg/2/zroT
         X3WcqybLVu6kBhOTCTY+0cjlU6bfA0UkDPLeVh75VW52fhjYxkIj6wK9x+38ituW7OkA
         0O46rJ6sdjk86FyKpVOZ7kY/LkbUJrFJz8LGpDhfESxoEPoXzWUHov5ozN5386qKCRFK
         GzeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu8x+bSV8lH0Pr6F1xvtuPQ/HseARS19fBlEEPf+HAhWeizdWn15ZrqHf5uFjVsH8kcn7YJhoB+59iB3jHTCjHBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2G16QdYrkjOGic+z0MfpvAAyXSKogZ2gSDuhDFJyT4daVUYCl
	ihFU1NEccrqtVvsJie38Zyu16+c0MwRjwy4fPUx3NXL7T9m3vljRQTBu2EU58LMKshU=
X-Gm-Gg: AeBDievuC42QaWQMJIFo+bECC74n9ArkFicAWwpYNl5o35Rgp8kegoiAKo+r4hgh1jc
	BVNUGUlSM8rvS63EPbOYR0d8X/n1scxNbExoYAVv2XoMB0eqK7gobnXyKx+2/M0CPm0CGZUTOCE
	pT3j5G7HYQwuPjCplLyRPN5/NG6G1IIuHPvNf4QbC0NpQ2xAw1kR9ADtCd2eRoDPXB/Sf5rhTSb
	zSrAedq6hEZXK5ZzlzofJI6yhtxV8l1pvdPPTBgC6II4DC+FwXYT81MQq0EpfgRvAjHjrz2Ennb
	gEZTaS7a/1CSqhX0hA5OlRlpVUXjTFc1lANqfHmy1/eYPhWvqCcGbg2rYQmS+TWwkyk/843SLnN
	qVsgxnrZv+IotXY9vyWB/KeK8BCmMG0cBmbKQuzStMcZplYFEAGYoIA5J4rgAmYpQOPHAK/ylve
	IAb/yLdryN1ecSc+saWYe+inw8slk8Yr9TH/2P7dyCHqSZImb1h7HlwQ==
X-Received: by 2002:a05:6000:1789:b0:43d:1c3b:2dae with SMTP id ffacd0b85a97d-43d292764fdmr5112385f8f.9.1775225631009;
        Fri, 03 Apr 2026 07:13:51 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm16958970f8f.3.2026.04.03.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:13:50 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.reneasas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 4/5] soc: renesas: r9a09g056-sys: Move common code to a helper
Date: Fri,  3 Apr 2026 17:13:40 +0300
Message-ID: <20260403141341.2851926-5-claudiu.beznea.uj@bp.reneasas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403141341.2851926-1-claudiu.beznea.uj@bp.reneasas.com>
References: <20260403141341.2851926-1-claudiu.beznea.uj@bp.reneasas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	TAGGED_FROM(0.00)[bounces-30860-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1BCE0395104
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move common code from rzv2n_regmap_{readable,writeable}_reg() to a
helper and use it to avoid code duplication.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/soc/renesas/r9a09g056-sys.c | 33 ++++++++++++-----------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/renesas/r9a09g056-sys.c b/drivers/soc/renesas/r9a09g056-sys.c
index 2a8ebc209961..e6a66688423f 100644
--- a/drivers/soc/renesas/r9a09g056-sys.c
+++ b/drivers/soc/renesas/r9a09g056-sys.c
@@ -88,13 +88,9 @@ static const struct rz_sysc_soc_id_init_data rzv2n_sys_soc_id_init_data __initco
 	.print_id = rzv2n_sys_print_id,
 };
 
-static bool rzv2n_regmap_readable_reg(struct device *dev, unsigned int reg)
+static bool rzv2n_regmap_readable_writeable_reg(unsigned int reg)
 {
 	switch (reg) {
-	case SYS_LSI_OTPTSU0TRMVAL0:
-	case SYS_LSI_OTPTSU0TRMVAL1:
-	case SYS_LSI_OTPTSU1TRMVAL0:
-	case SYS_LSI_OTPTSU1TRMVAL1:
 	case SYS_GBETH0_CFG:
 	case SYS_GBETH1_CFG:
 	case SYS_PCIE_INTX_CH0:
@@ -114,28 +110,27 @@ static bool rzv2n_regmap_readable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static bool rzv2n_regmap_writeable_reg(struct device *dev, unsigned int reg)
+static bool rzv2n_regmap_readable_reg(struct device *dev, unsigned int reg)
 {
+	if (rzv2n_regmap_readable_writeable_reg(reg))
+		return true;
+
 	switch (reg) {
-	case SYS_GBETH0_CFG:
-	case SYS_GBETH1_CFG:
-	case SYS_PCIE_INTX_CH0:
-	case SYS_PCIE_MSI1_CH0:
-	case SYS_PCIE_MSI2_CH0:
-	case SYS_PCIE_MSI3_CH0:
-	case SYS_PCIE_MSI4_CH0:
-	case SYS_PCIE_MSI5_CH0:
-	case SYS_PCIE_PME_CH0:
-	case SYS_PCIE_ACK_CH0:
-	case SYS_PCIE_MISC_CH0:
-	case SYS_PCIE_MODE_CH0:
-	case SYS_ADC_CFG:
+	case SYS_LSI_OTPTSU0TRMVAL0:
+	case SYS_LSI_OTPTSU0TRMVAL1:
+	case SYS_LSI_OTPTSU1TRMVAL0:
+	case SYS_LSI_OTPTSU1TRMVAL1:
 		return true;
 	default:
 		return false;
 	}
 }
 
+static bool rzv2n_regmap_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return rzv2n_regmap_readable_writeable_reg(reg);
+}
+
 const struct rz_sysc_init_data rzv2n_sys_init_data __initconst = {
 	.soc_id_init_data = &rzv2n_sys_soc_id_init_data,
 	.readable_reg = rzv2n_regmap_readable_reg,
-- 
2.43.0


