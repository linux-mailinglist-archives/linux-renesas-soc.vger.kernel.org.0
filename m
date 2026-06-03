Return-Path: <linux-renesas-soc+bounces-33487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s+chH8vQH2osqQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 08:59:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 59815634E7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 08:59:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KgjoQVEA;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B7D5305A358
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54393FFAD3;
	Wed,  3 Jun 2026 06:57:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC33FE376
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469873; cv=none; b=SZBoQSit5DYf9irXOpiqewHcnTeTmXZSrf0YOnKbaVlmYDGeG0kz7mhJXWq1pOwB/6Cp/zekz4tfOknBPWJa0/8NzwA6+Wff7OcyeLT1O1wu51Y5wrjWb5aGAGpjjFJKiYVzap9mnFCk9H8cJS0EXQphe7TCpxIj83+mXbDDvIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469873; c=relaxed/simple;
	bh=hfcvW48RTVOZQJUjKHOYeF67Im7HnwNrRO6plbK2CAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNkcOXQobVK17Ej9+Fr2RxJyVQq3SNMlXJEvodFqK1wiNDi6+zzGMk4q0diGKglNMlGDsYSIf+9zk+NmDjP40yJPXuaAZu62rmVBkRHRc1bMYtYfUVu+hA7ycHaktAadnlDSgSuz4+wIhakgnuSjprsB7KmQuunskytjfTwAoBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgjoQVEA; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b3637b90so12716535e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469868; x=1781074668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zv9IdkurX2GjnKPTD/4GcmG2i55GdzrhY07mRQklhMc=;
        b=KgjoQVEAXgMGlFneE7PWPuwGhUiRWbwQELuS/p5iyx9zhZMXOk7/QeZNQM1gTKRvdN
         qxek/SrkwlVCUtWVTM6yhWEBmf+ULQfFK6U6HO1nEMR7TyTF82W8+7yVa+qmhCJ1i8by
         1VzD+knt04Yl4MS0umVvPcme1BH8qZLlCUWooKgJWGPofZET+NILsmX4hGjRi8k4sPIf
         oqw5r4BuumrX4Ep1akdAtZ2CdL7TzrfJ9ZBCrJv6NJIxkNMUB9bm/nROICZPJzRflECb
         Twcqz0ILYAtBOXPpeozs4iM/DL4YtVPrOaWHBpxsrQNxSONl3qAhxuEzIFG5deumV8oH
         6gMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469868; x=1781074668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zv9IdkurX2GjnKPTD/4GcmG2i55GdzrhY07mRQklhMc=;
        b=iyUVZwZiJ1O9/QgBXMWrm2oG92f/X1qp5zGcuGz5f5ai8NSdF98OSq+CI0UyIe8OPC
         cWpcZsLJ+a2IgsY6WopLbjRYGHdCgTpzk5T+MFZ1q52EDQUPWnO2/Q0f07gpYLUO/RNX
         Y2vxAn7WIYvrgyjyqEJE3PsMNGpXDzsf5G+7znozDWsmEsucQc7MbhTvBr1JM31kPah4
         WCA+ltr9WaAdPbN1LzLdfk8BicytGfhAa4PjzUZmUV4bwbr99xs4V9JEV6UTsiea2RKZ
         INGa8/6bSXKC/QDRpr0w8zHXyS7ceUzWS7a6xT5sscYb8jAbbZMp2hMu5hnlaBQrhghv
         KM8w==
X-Forwarded-Encrypted: i=1; AFNElJ+o4SdnaKZgIttaW6awVaYsJx4/ResKTlYKRALxFs6Blh5GevbxYVbeE2wvuBnqKsgZ6t8rEMm/y4p30g500PAtXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJS5CDXPKPQ8ikqkCayDM2vecG6f0ua8fQp3O5YBKQtP0vl2g
	7FbedIPd2AwMTMTYc0krdOsTjwqyZagPMX9Ey3K9WH8uDWYtFqYlcxKXMqdI4A==
X-Gm-Gg: Acq92OFlzpVZXO/8z3hXBwTRysG0lD3N3zZzjHfoCkV4Zd9Omdb2Xgdio18416O1JiP
	1/sx7BZR2r+GVICuX9cHkdfKWFjnIEhIb1fkPVbykbAJ0ZwQ6GgDHMJgT/j+G+IAbweYC41vuDe
	xYmPomQW1zwZOA+kiu6CU7HMGpx24nc8mhOCanH9LV/l7Osl7Zg8fiBCu/8nKtiwSrhd7eTy3zO
	hVqjmkIUfG+0nZC9/MA0/1SrlX++1WwJ5at+phRxMw/FtoW32jmk8zr7+cgR5a9LbcmHJztP0hv
	JdsbpDf+V4TFHeHGSxtLBFESEHZ2k+iJWheFTIUuUffSbCLTp9ul9v4yxna7TDhnYGyZLECV17/
	ne0zNNKX8/Xmo3mAp3SMeIJZ54iGKU4dL71uejcOhi46LYBE2sXxC6+xLad/BV2Yj0qmyAcz6jK
	kkinJWVlnTUXHBJiz2tLicXNZ98VRGwGtfPaptdU84JeX6YgyCQh2ogXlZ39c=
X-Received: by 2002:a05:600c:1387:b0:490:601f:d766 with SMTP id 5b1f17b1804b1-490b5e8359cmr30877065e9.1.1780469868442;
        Tue, 02 Jun 2026 23:57:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:48 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v17 13/17] mmc: renesas_sdhi: Add RZ/G3L HS400 support
Date: Wed,  3 Jun 2026 07:57:13 +0100
Message-ID: <20260603065731.93243-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33487-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59815634E7D

From: Biju Das <biju.das.jz@bp.renesas.com>

Add HS400 support for RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h               |  1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 17 +++++++++++++++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 10f634349da9..92b66116f044 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -47,6 +47,7 @@ struct renesas_sdhi_hw_info {
 	/* hardware features */
 	unsigned tuning_delay:1;	/* Has tuning delay */
 	unsigned internal_divider:1;	/* Has internal divider */
+	unsigned scc_hs400_mode2:1;	/* Has scc hs400 mode2 */
 };
 
 struct renesas_sdhi_of_data_with_info {
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 974acdf110d3..282107d06114 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -186,8 +186,12 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 
 	clk_set_rate(ref_clk, best_freq);
 
-	if (priv->clkh)
+	if (priv->clkh) {
+		if (priv->info->internal_divider && host->mmc->ios.timing == MMC_TIMING_MMC_HS400)
+			clkh_shift = 1;
+
 		clk_set_rate(priv->clk, (best_freq >> clkh_shift) * priv->divider);
+	}
 
 	return clk_get_rate(priv->clk);
 }
@@ -229,7 +233,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	}
 
 	clock = clk & CLK_CTL_DIV_MASK;
-	if (clock != CLK_CTL_DIV_MASK)
+	if (clock != CLK_CTL_DIV_MASK && clock != 0)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);
@@ -275,6 +279,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018 /* R-Car */
 #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A /* R-Car */
 #define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C /* R-Car */
+#define RZG3L_SDHI_SCC_HS400MODE2	0x020
 #define RZG3L_SDHI_SCC_HWADJ4		0x022
 
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
@@ -308,6 +313,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT_DISABLE_WP_CODE	0xa5000000
 #define SH_MOBILE_SDHI_SCC_TMPPORT_CALIB_CODE_MASK	0x1f
 #define SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE		BIT(7)
+#define RZG3L_SDHI_SCC_HS400MODE2_HS400EN2		BIT(0)
 
 static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
 				struct renesas_sdhi *priv, int addr)
@@ -437,6 +443,10 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (priv->info->scc_hs400_mode2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
+			       RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
 		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
 		       sd_scc_read32(host, priv,
@@ -578,6 +588,9 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (priv->info->scc_hs400_mode2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0);
+
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
 		renesas_sdhi_adjust_hs400_mode_disable(host);
 
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index fb8a70d28eed..83d348fb5eeb 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -276,6 +276,7 @@ static const struct renesas_sdhi_hw_info sdhi_hw_info_rzg3l = {
 	.max_divider = 2048,
 	.tuning_delay = 1,
 	.internal_divider = 1,
+	.scc_hs400_mode2 = 1,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
-- 
2.43.0


