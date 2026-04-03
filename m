Return-Path: <linux-renesas-soc+bounces-30859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLFhI1zLz2lH0QYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 16:14:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 921CA3950F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 16:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9630C30379E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 14:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E09B3C5551;
	Fri,  3 Apr 2026 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Eg5soNSp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCA53C4559
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225633; cv=none; b=KiCf6eBQGm1R5r3CD5I6I6R7HZKGYYtAakmBxF+PwQ2GlZsPMk0DO9v/vJ3uN/bieFwrWF/mcQFNhvKu4YSqhgOMC9/nC0rP3cY/nDHsF4Hw8Md4VYB1ft33ZoduZJdC3oRBG2wBoRRYbkQKOFLnUR+QsjDPsUg2TV0XYZoKoFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225633; c=relaxed/simple;
	bh=AKA8TE2L32nQUEQOH5LixITmJN38HwxJ702FCNRhqr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hV2AzE3Fc/W9plTzuTrNwPS7PlU7QFw2bh23NQ8if8GAs4zCo+caMPosaRlwH58wv8JMpMibpeTHQ7yBQRF4ZIvE4nebaIOq5dGFTKIZX+agpv56xh1hRC235fw3iIsJX+ZMZE/M+dJzpZ4feZ587rmDInSabaFr0fWQ0NXgep8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Eg5soNSp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so15714785e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 07:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775225630; x=1775830430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qo/l0C10MG9G6BQXEY8BDU/wDHuRhubQonVSISBYfao=;
        b=Eg5soNSpIVns0Pb4MQmd/BSUohddwb5hVv93VkOejf0XaJM7v+HPn0mpn+x8Fka6vU
         C1unkxiypzoM90g/BwF8xFRvNLcYUCKcJZ8JWeQwA9zNLisdSrRf566HwnIathjxHQXu
         UD0H45etoPZGKKmraEfME+o3YnfsXcHGwRx1/K8XlhfT6qRy+gvkrWozBBlsjBAcf1xq
         oz8VRmzs1tSM0sx5vHwi66fv9EYJmLPLOKQAb8QEGQ8MAd7tmMCzY2VwHzebqwjt2Psz
         449GAs3tctIXRKq/zGBJ7OZtdQubckKS1TqEQscxVqK7H9hMbNs1TDEuGw//Z+QTfgL7
         /owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225630; x=1775830430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qo/l0C10MG9G6BQXEY8BDU/wDHuRhubQonVSISBYfao=;
        b=dlbOvMA6a7iLWI9tpdZWef7IrNCtIr/ZpwxBK3DAkDGXrNWP+dDoEfFDnfkWD63+9q
         FZ9TzpDC6iIDal11mcBY2u4n+osVncK6oAVrcTEcgHFFoEoatwF/AzL8kyRlS3nZs7DA
         c4GBkbKk2kf+y87U6zdgjP8jIWuF7Pa7coYCrgDVu1pOJT9xCQo4Azc0xEKQmei9ziIG
         8CCEOfr/B4/ZR4wDQ3CpGiSHgxRSMBBswBunZnz4lR6L33rLV6OQyc8gOUPejIFgcRHt
         6llnwVAPfxjd8R5Mp/iwuJEXQYjLbFUqMuoV6Bb0g73J6ynxmNCrO0kMQa2+P3368GOQ
         Qn+g==
X-Forwarded-Encrypted: i=1; AJvYcCXZEreyrlmrgrbapOCOte9A+8Y5cHCpOi4OldGnSNEPnl7SNnUoypd93RLa8Pjoij1VJWSTVdyS/0/z8xJ17LwVpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5oIhCNA24wHiVc02Pd4vdVxLmwHdabIqKkdEfYXDpU7ivmVjo
	eoH00+eD2cVVXK8JEl95N1cmw+7Fe/pkQkViFiAdsp4Bj/7xk0lPufDOIkjpFcAEb74=
X-Gm-Gg: ATEYQzwlRXzl68PFXf/xJ6kS53Zu4VPmXYZtI5l/adRzvWhL3nhuI4zotFuhctTXUv1
	s2LhDDtLjGmcOpd5hTlj1bXZZwKpCG5K+GUIvHhwQE/Ed7I5b/dJBaH3+mKaKmGLn6cmKY/FNA3
	JbWZX3kZHTtcoJoTeTyYTl9/Rx1ZhiDtRo49utVlX7RtmT6U6sgG9F1e4EnK49uP4eod+C7GWcC
	M3xhSJSufBuUZwGp9hmyDxsSmih2ujexw140PSN3BE6l5i+KDp9YIaBxVRT4865kTIPPw0K6F5F
	r60miWxffuZ6gMX1xVycXkV4PtPcqVHSCRBwN28tsjvkpgvPEerZZqIFZKQAoNfFee+rE8qgjd9
	Q2l5wnwd8NWcEhKiTuIdDgZjHE7gH/cH7iRdU6ErgFEuhzxWdJveBBNv4xpZNLPpxXkVvpcY4NA
	RYD8Oa4mV4pmX18brvhcKKy8eSdHcb8VY5aEGonUd21yazAlKsMmoqJA==
X-Received: by 2002:a05:600c:818d:b0:485:9a50:3369 with SMTP id 5b1f17b1804b1-488997e74fbmr48816455e9.29.1775225629922;
        Fri, 03 Apr 2026 07:13:49 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm16958970f8f.3.2026.04.03.07.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:13:49 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.reneasas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/5] soc: renesas: r9a09g047-sys: Move common code to a helper
Date: Fri,  3 Apr 2026 17:13:39 +0300
Message-ID: <20260403141341.2851926-4-claudiu.beznea.uj@bp.reneasas.com>
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
	TAGGED_FROM(0.00)[bounces-30859-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 921CA3950F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move common code from rzg3e_regmap_{readable,writeable}_reg() to a
helper and use it to avoid code duplication.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/soc/renesas/r9a09g047-sys.c | 34 ++++++++++-------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
index ea3ca10fcc33..b617fb0bde7b 100644
--- a/drivers/soc/renesas/r9a09g047-sys.c
+++ b/drivers/soc/renesas/r9a09g047-sys.c
@@ -83,11 +83,9 @@ static const struct rz_sysc_soc_id_init_data rzg3e_sys_soc_id_init_data __initco
 	.print_id = rzg3e_sys_print_id,
 };
 
-static bool rzg3e_regmap_readable_reg(struct device *dev, unsigned int reg)
+static bool rzg3e_regmap_readable_writeable_reg(unsigned int reg)
 {
 	switch (reg) {
-	case SYS_LSI_OTPTSU1TRMVAL0:
-	case SYS_LSI_OTPTSU1TRMVAL1:
 	case SYS_SPI_STAADDCS0:
 	case SYS_SPI_ENDADDCS0:
 	case SYS_SPI_STAADDCS1:
@@ -112,33 +110,25 @@ static bool rzg3e_regmap_readable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static bool rzg3e_regmap_writeable_reg(struct device *dev, unsigned int reg)
+static bool rzg3e_regmap_readable_reg(struct device *dev, unsigned int reg)
 {
+	if (rzg3e_regmap_readable_writeable_reg(reg))
+		return true;
+
 	switch (reg) {
-	case SYS_SPI_STAADDCS0:
-	case SYS_SPI_ENDADDCS0:
-	case SYS_SPI_STAADDCS1:
-	case SYS_SPI_ENDADDCS1:
-	case SYS_VSP_CLK:
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
+	case SYS_LSI_OTPTSU1TRMVAL0:
+	case SYS_LSI_OTPTSU1TRMVAL1:
 		return true;
 	default:
 		return false;
 	}
 }
 
+static bool rzg3e_regmap_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return rzg3e_regmap_readable_writeable_reg(reg);
+}
+
 const struct rz_sysc_init_data rzg3e_sys_init_data __initconst = {
 	.soc_id_init_data = &rzg3e_sys_soc_id_init_data,
 	.readable_reg = rzg3e_regmap_readable_reg,
-- 
2.43.0


