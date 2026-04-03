Return-Path: <linux-renesas-soc+bounces-30861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPZsDgzNz2m50gYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 16:22:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A38EE39527E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 16:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82FEC309477B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 14:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C823C6A36;
	Fri,  3 Apr 2026 14:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ygte63pK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4A53C5DDB
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 14:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225635; cv=none; b=VUp0NOQ6+ai6AU68E2bRINvn7iLoDmbOMDDZ/liwcOHmuDZM7ijf5VY1q/R0k+ntqmyC5sw9gJr44ZbTESVcuo59IXllyM2K4nGeIbmvD4r4S/2464LuZmyBWIJP7a6c4/K37l82I1EDj48PJjCC/nr/1qwKdk/j8b61fVzCyQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225635; c=relaxed/simple;
	bh=EGUBddZqO8tB4emZ2/hzyvrY4WESsCKpl6lz5BvsEiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+iBJLDTsuPdcvEbDPA0ViLae6n04aKTvGFlIYVVUyBHNaYpSE3fZbNkJmqsutLZQOG7Ohb9P5WPwjbrkYb8bbesxQLFMMonynG7UHGEiuHs6LjYrReW2Cbwf+sQiD7rRaXaZsE08/zAXecf6YBG1Xzhkr1TEna/joytjwjVyuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ygte63pK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cf73bbfbdso1240284f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775225632; x=1775830432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsdc6LQXhP9eDvtTPKjCF7kGrSXydypiEJLjA5WygRI=;
        b=Ygte63pKs5WiM6xwxRqZMaaruHhrk8DO2HLV/bh1CrV7td1cmayWgAwntirx1iiyQJ
         HfXWSBwWl0dhSaC/9NZ/DI9pnsB90FKQjCh/eEduzFwRL5PMEERZJD03XE99cZEoHp4h
         dvyXhGjpxzaAWgfe01Z01G7NlPizahKYPjzuau1T+QlVALGMmn5qJB+dttXOzPBDxS1+
         ZDs4x7TGc9JQ+kB7IUZaeQCOqprOk3AN9jaBapSExwxOWQyrzjH6iKp0Hll7N7Q3KAwn
         S2faAaxj5bZyGjiTzE2TQVwTBhwm+BL/da4cQCbJv5e9K6DKqr1uGptwWHOvDg2+gDz4
         RBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225632; x=1775830432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jsdc6LQXhP9eDvtTPKjCF7kGrSXydypiEJLjA5WygRI=;
        b=gmuK/GC4iK1uwKbbGNcw5tbHSdcR4O5OrU4rOvipNngHDMlxeYhE475ojx41XWQYX2
         B6mADZQ3nyDXc9fApk5aI6yw1ocCJgMrekbBZA4N1IHPFZSP/ttHBr2WSoNPFyO4B9YI
         0vr5fuADkiZP8e8uPxnYPwlMn/zysgYk+NrSwqEVwYXMW4SqyodNOIeFoJtAyG8uTqxb
         DeQYf1THuKEMfjX3p/qGLj34jCzZ5zZC/g6q0VIbLV5hg84hwESOS2mbfbpvDr7G87Z1
         9PVMoOGCJLZaxogti7LgxcdDsulwcnQGw56d1DXr670O59pym4a/VFpkKfoNr38SdBIZ
         yM/A==
X-Forwarded-Encrypted: i=1; AJvYcCXaH5L/6upgvmrhisMZMn/kRqJDIY9IHDVlO8uVhn8h0dvdUl1XT6y48P3XO9zTsHi0p7Mk56Z/RfD9HXBopdlyIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzojHCKBff3mU8yekJLnhwRlUNB4dVbNUwswUoFypHYPLHqks8n
	Fn9XTOfLeMS1/tzhragCiZN+Vu22vWmNTuW6elssruG/n2sZtvYh4wfxME2Gdzrown4=
X-Gm-Gg: AeBDieueeTZqoC115xU2bBOIZnnDf6P11AUjNS1+QuH8RgLPWBo0RI331ZdKJpEfuXb
	gD6isaZP83mXkjkHyLANpe7BPlDg2A8/MuZnxS7MnF/FFjm5BUhKcKxHU7N98B3E/bpAFKENuzd
	o14EURuorS4y+52Z++O32nBeR+gSrZK1IjdeGtAQ86C4G8KnLgQwh6O5+8I8g8R9TyPbV8X4G9c
	/dWB1fYUg3w+730uc6lUufPVLHvtVkd3j/cLyFU83VHDPcXncvyW1mlRle4IG4ELERW0e1ZydYc
	9kYkmRJ0XOfOBz6z420mo6sAsf7olvFqnMCBCw0pObfs6+eNOUbGFGhQ7DO+/ducjovkP4kohIh
	0hKZLMEzlcuJKS3JDHA0hz+8ko8vEcmVoE3/5RF8zblPbAuns1KGzS9bw94Bho4ESS+i/rFhr7h
	Wvlh82shnAv+vCwbG5ie8S7/VPVTHP/KzwqwvB7UlnzfBiA3d2f/VBQA==
X-Received: by 2002:a05:6000:25c6:b0:43c:f719:a7f0 with SMTP id ffacd0b85a97d-43d2929467bmr5271762f8f.12.1775225632572;
        Fri, 03 Apr 2026 07:13:52 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm16958970f8f.3.2026.04.03.07.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:13:52 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.reneasas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 5/5] soc: renesas: r9a09g057-sys: Move common code to a helper
Date: Fri,  3 Apr 2026 17:13:41 +0300
Message-ID: <20260403141341.2851926-6-claudiu.beznea.uj@bp.reneasas.com>
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
	TAGGED_FROM(0.00)[bounces-30861-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.reneasas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: A38EE39527E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move common code from rzv2h_regmap_{readable,writeable}_reg() to a
helper and use it to avoid code duplication.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/soc/renesas/r9a09g057-sys.c | 44 +++++++++--------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index f3e054206acb..308492c31acb 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -91,13 +91,9 @@ static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initco
 	.print_id = rzv2h_sys_print_id,
 };
 
-static bool rzv2h_regmap_readable_reg(struct device *dev, unsigned int reg)
+static bool rzv2h_regmap_readable_writeable_reg(unsigned int reg)
 {
 	switch (reg) {
-	case SYS_LSI_OTPTSU0TRMVAL0:
-	case SYS_LSI_OTPTSU0TRMVAL1:
-	case SYS_LSI_OTPTSU1TRMVAL0:
-	case SYS_LSI_OTPTSU1TRMVAL1:
 	case SYS_GBETH0_CFG:
 	case SYS_GBETH1_CFG:
 	case SYS_PCIE_INTX_CH0:
@@ -128,39 +124,27 @@ static bool rzv2h_regmap_readable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static bool rzv2h_regmap_writeable_reg(struct device *dev, unsigned int reg)
+static bool rzv2h_regmap_readable_reg(struct device *dev, unsigned int reg)
 {
+	if (rzv2h_regmap_readable_writeable_reg(reg))
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
-	case SYS_PCIE_INTX_CH1:
-	case SYS_PCIE_MSI1_CH1:
-	case SYS_PCIE_MSI2_CH1:
-	case SYS_PCIE_MSI3_CH1:
-	case SYS_PCIE_MSI4_CH1:
-	case SYS_PCIE_MSI5_CH1:
-	case SYS_PCIE_PME_CH1:
-	case SYS_PCIE_ACK_CH1:
-	case SYS_PCIE_MISC_CH1:
-	case SYS_PCIE_MODE_CH1:
-	case SYS_PCIE_MODE:
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
 
+static bool rzv2h_regmap_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return rzv2h_regmap_readable_writeable_reg(reg);
+}
+
 const struct rz_sysc_init_data rzv2h_sys_init_data __initconst = {
 	.soc_id_init_data = &rzv2h_sys_soc_id_init_data,
 	.readable_reg = rzv2h_regmap_readable_reg,
-- 
2.43.0


