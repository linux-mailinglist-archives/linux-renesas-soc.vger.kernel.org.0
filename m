Return-Path: <linux-renesas-soc+bounces-30858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJj8EvfMz2m50gYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 16:21:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C443C39526F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 16:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B61393119A3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 14:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DB03C5529;
	Fri,  3 Apr 2026 14:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ECo9Nd6t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540DE3ACA65
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225632; cv=none; b=RSsTQN/S4yFg6pPhux8SvIQjSaiS8q4QcSVk/85olu5S9eW7zn7wuSyp0QJ/5BbknnHH3ThwOBuHjxQI1AvOJeKFFRsPLRcMdFFFczhjMC/2Z6IHBL+yWtFlpBOYWGgTz+0VY9O7mvfhX88F6O/yaxAKiWrw30oTxloH2wYEfzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225632; c=relaxed/simple;
	bh=b6jmhNHzn19vlRCRwY/wYN+glhtGNbSKOnNFIT1txmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWNDDK8tSsM58KwBCmHD9a4HxUFIt8MpTpEv8BJ8+QhntAC/5eHhQd2T3zTKbIwyIvWcju+ikhhF1TFseBy7A7UqDghndTM6/E4f1D5On8QbNifSu/fUqjNGlTaU+oALbxMixy16jhJ9hwe4IA10pAgiqYsbt/ysbH/E2ohLd5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ECo9Nd6t; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfb723793so1259621f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775225628; x=1775830428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbREQeS01FHISSyQrCjCoXkBdx+jKPJckfrRsua4Zao=;
        b=ECo9Nd6tR38sd7AdMmSoO8cFeKfDjMh/Jn7++0mtbXvP9OYmQjOzJppUsFmgJfEE40
         y7S9SbRUtnDgFBvIHe1dDRpRGPzncL+MIMKByuEvYAs9EpeP9SOU3XYb0bJNqC+Rtfhv
         qwyueEi/UreJacwbFC5yR+IvE71M5czSshHa17lR52Dx/NX1g56FECLG8DZQTcy/RpVR
         bIaj/rFKLIZgl4YrPQOkLS44rlvSBw3uK6ZD2BRnSfYTUg8JvRqKtcF7HVSi1fZwcR6S
         JSQZAvOTGwPrY2OKmOj4EkHDdAieBCpmPnmsW4tmKG4c7FrTvX72YOUZu9NW0U83vrcU
         qh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225628; x=1775830428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lbREQeS01FHISSyQrCjCoXkBdx+jKPJckfrRsua4Zao=;
        b=ER0WYsnV5E2A5ddEh2Zba+2ZPrW1h7s8G3ZK2V1DlyYsqQvftvCdfFZg1FNXBIb6cr
         ufSSMtfbMGskLaHloBW48PAwX0x184QaP1vqnbntQdAslZH+SO17yqI4SqdGx9sn+wU4
         H9vJqa/N/Uw/eYQeO/ecPZqRTx0yrk0aHxpgxnNBhUe3fjZyzfAQMNU+g9yW91JOkQZM
         3TtBkvtqBw/wO5CK6+PsP55Tv/u4PUHxIRUO8it4FrT/W/U7dauUD0yJ40F+pOcvmfWz
         WlBATLvPzv4gGQvjNDvFLwavuqRoFCUhSHUeVXjltiuvE4xM7hjoOOPsc6hZAmLrCYr4
         9NRg==
X-Forwarded-Encrypted: i=1; AJvYcCWbGtEbvBsdNoBRSvQCsCwQo1sn6hNJlarQCEnd3Zmo1x8+0ivVvyLyLK5375Q4gxzuBQbYwBDXRD48uSv91BEnxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE1WKTcDtf2qzQHL4P+EAyJsOX7druu9gaKOYnYBE0zpR5dHUn
	RI4OcWFS4f6XzQ4aWw1LiLvjBuJSMY37xoIvveBllZS3x9N4cWgGr4LPtE8R9Ni7BrY=
X-Gm-Gg: AeBDietVDBic8tAL6vs7msmUFyY/YDBWT37Vvskel+/w7yB0oYqpMiXvoAH1vj8Ko9y
	rgzIkkN78x2z0XWXnN5b1e6H+fpZnXyEntI69GcHi5gJAiJgCYLYc/xCLZTosHF+EdPacstfAAV
	uw2venb/tconK2ofIUGSaI3D/m7iRrLvYz3yUAKU4skKS/v32RqqZR3lbwbFLqE9HTUYD6BdHvD
	5QXhM7a0XGo5TIWfAHuye0vFlwCTqXFlx+5sVffekVqFFuY38OXfCu4HNM3ulZI3e5gPYoc/UsK
	SjTSCfaJKwmylyDVstjy2yF0lzn1QQ6MD0Ic8xsSq/h1BBxJt/1dBx8TRH2wKsUX52qjhlk/GwO
	9QyuCFosg8ZN2NL1O6rwznxS6rVHVfKrppcuzb0IBb6PKslITDijvwmyHIs1RpLMzq2XzpH4RHi
	SHqBQE1jYkGZKWKHNBcT3tNjxyapiAc94gVmRSnz7oHU+ysDlznfYwTg==
X-Received: by 2002:a05:6000:26c2:b0:43b:3cdc:9429 with SMTP id ffacd0b85a97d-43d2928559bmr5548685f8f.1.1775225627686;
        Fri, 03 Apr 2026 07:13:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm16958970f8f.3.2026.04.03.07.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:13:47 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.reneasas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/5] soc: renesas: r9a08g045-sysc: Move common code to a helper
Date: Fri,  3 Apr 2026 17:13:37 +0300
Message-ID: <20260403141341.2851926-2-claudiu.beznea.uj@bp.reneasas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30858-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.reneasas.com:mid]
X-Rspamd-Queue-Id: C443C39526F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move common code from rzg3s_regmap_{readable,writeable}_reg() to a
helper and use it to avoid code duplication.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/soc/renesas/r9a08g045-sysc.c | 33 ++++++++++++----------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index 03d653d5cde5..63e4aa6a7cd0 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -37,18 +37,14 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
 	.specific_id_mask = GENMASK(27, 0),
 };
 
-static bool rzg3s_regmap_readable_reg(struct device *dev, unsigned int reg)
+static bool rzg3s_regmap_readable_writeable_reg(unsigned int reg)
 {
 	switch (reg) {
 	case SYS_XSPI_MAP_STAADD_CS0:
 	case SYS_XSPI_MAP_ENDADD_CS0:
 	case SYS_XSPI_MAP_STAADD_CS1:
 	case SYS_XSPI_MAP_ENDADD_CS1:
-	case SYS_GETH0_CFG:
-	case SYS_GETH1_CFG:
 	case SYS_PCIE_CFG:
-	case SYS_PCIE_MON:
-	case SYS_PCIE_ERR_MON:
 	case SYS_PCIE_PHY:
 	case SYS_I2C0_CFG:
 	case SYS_I2C1_CFG:
@@ -63,28 +59,27 @@ static bool rzg3s_regmap_readable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static bool rzg3s_regmap_writeable_reg(struct device *dev, unsigned int reg)
+static bool rzg3s_regmap_readable_reg(struct device *dev, unsigned int reg)
 {
+	if (rzg3s_regmap_readable_writeable_reg(reg))
+		return true;
+
 	switch (reg) {
-	case SYS_XSPI_MAP_STAADD_CS0:
-	case SYS_XSPI_MAP_ENDADD_CS0:
-	case SYS_XSPI_MAP_STAADD_CS1:
-	case SYS_XSPI_MAP_ENDADD_CS1:
-	case SYS_PCIE_CFG:
-	case SYS_PCIE_PHY:
-	case SYS_I2C0_CFG:
-	case SYS_I2C1_CFG:
-	case SYS_I2C2_CFG:
-	case SYS_I2C3_CFG:
-	case SYS_I3C_CFG:
-	case SYS_USB_PWRRDY:
-	case SYS_PCIE_RST_RSM_B:
+	case SYS_GETH0_CFG:
+	case SYS_GETH1_CFG:
+	case SYS_PCIE_MON:
+	case SYS_PCIE_ERR_MON:
 		return true;
 	default:
 		return false;
 	}
 }
 
+static bool rzg3s_regmap_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return rzg3s_regmap_readable_writeable_reg(reg);
+}
+
 const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
 	.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
 	.readable_reg = rzg3s_regmap_readable_reg,
-- 
2.43.0


