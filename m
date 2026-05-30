Return-Path: <linux-renesas-soc+bounces-33380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPnyCzQNG2rM+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:15:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBB860E0B5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 116C6304C2D9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371D632BF24;
	Sat, 30 May 2026 16:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIR8x+aR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57C331DD96
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157405; cv=none; b=OxiAw3JxyFsldJYxwAVdh6NEpK21SkgLeg57NhY05Zjck++VZZgpSa7ruP2E2Q1nOQBoPJv7BpWCbT7S3rh/8pB7eDWUkuQ/qbFWUWIgxDJqHO4o7fRnoPrUiA5N84CF3NFc9C30TD8xdbrUGszNVi748BQyQm8reKroMVqF9H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157405; c=relaxed/simple;
	bh=zZOIvZOqT0aSTh6LveaAM9sD3r2T64N7TAlxwYpsk90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DWv50zp5jjc0hloeWMnRDMsRSMhTrrdt3Ja/bOmHdRzAcgD4PhqUrusSazTl5j04rP7Afws5R0ED8c1vgJTH4/8MuBVvQyNmd0fmPePtpollUqJsWByb17MMTXh9RGAR4oKzm3/Kidqyjw2Jfev4PgfTNjbmmiKD1OJzqZgatfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIR8x+aR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso91804315e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157402; x=1780762202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4N2ujUewBRl9mQ2XiZRwnXIT+vIqH9drHk1fYIYyxf8=;
        b=LIR8x+aRNrYxTQPOzFQCT+YcuuZFbL1FyH1QK5fBARgakoxvOCbB6zCLO942d9wbm9
         1xBB16WKinuVmQS+oaARo7TqZQxFDW5V7MuSZ+t/3LG5ji71LEfcA1aLxkHL5BhUhT+T
         bg42alCC6PZcaLSCwsgdh2YcDBsBP5HNxrqOh+2+99OgoJZRoa2R4bYCF1CCus1Xrzu6
         2MmVfkMQs6J7YDuf7F2ITHhDEE4vVOK6acUxgkhqP30T23H+7zJJzV/G3ScEPHjAgbme
         8NuVIsk6R/bP8FcUSNZvoHaAwRW/lPAGpt7/QCV2WxG3CKyy7BZ/KzM19B7e8NbwZptu
         dbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157402; x=1780762202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4N2ujUewBRl9mQ2XiZRwnXIT+vIqH9drHk1fYIYyxf8=;
        b=j7ysoP5fAgUsBspDydMvMf5QXI0kCqRWL6SuWtd6kPn7Y0JDl+0Cj/knx/Wz2zbJpS
         F1V1H+kqrMddUjLsv8c0/pet+ghYfDZ8QOaQ4FrSPnLhnenN2XmSbXqyfhrE1TLE98Af
         wfTBzXRe+xk5r3lF8UlMuvz78OrhHATQpg2o7HBH34N/JvKKLk3vHvYUNMnWFbZZ+k/q
         I0BcuhhUcTxKQ/zMJCZstIyadDzTKaCUIaVrsBsqsJWquqA5dCgmLM/oye2Pw7beON5I
         dYYEI7OmLhQdGSx8+ZrL5T3SP7E/kouRQsaas7wbTCuZMyXzv8DXhwBALJNlZWOsPHl3
         3zzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iKKbZnEKILAR+cDsAY4nb2HIHC9y5dKi99/2DPmQpiWfJw1KzhJlK1E34Lzd1kCqorAqO7h+Ac6bk5JHhrLfm8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh5t5sIRTkLrw1C3q4hVo6cfBKWpcEUYatuHRMi+vnoC97f6Jy
	tt4ylofGbbfwpAQM9FjgB3qqjxnUeHv06NKnOyCQpg+gN72xI7qicdQF
X-Gm-Gg: Acq92OFBnQCt8hSLW+XgnFj7hYDhXue02xZsMVwkNLjjzOsFrCD6znkK0aPCHWtz8Ln
	Y1gx6KpOq/9EhRy2Ic65HU8m79XmoFUJOgziPuZwW5sYLAr3brbjrSAtwfQMjwrvudnjpplsSF7
	CJfCOAPO07DEodZPUjqEiwUI/PHSuc8sHaT4L7t0KsdVQUCZBiEKYLF1G3ojgvfK/I5GT20WYMS
	MSWpWUV+mjTwbkLI8sYUQJwn8gz/EkLRK/zmGLuF0V3Qk3VZgUmf9nGTqKHWsbmMaFJuG+XfXm9
	86lJSwa6wiCMMeh0GSVK7FjXXQpjrWl6RhIx7hFQdcUhW7LSOwYByTlH70spHyszNuzGq2K02gN
	UpNR7ST5RxX3vm7NSvHHeIXOIOMVR3zEbDHVU3Q64Hbz/6aZHTDD9ELys3t+Fkgd2pMVfhvfUx7
	fXLp5s4gYuV91KsAfyc0TJnhI0Ph6zCl3VyGQ2oTtAw0IPZxAhjSOzyHJCI/Q=
X-Received: by 2002:a05:600c:348f:b0:48f:e230:c3fb with SMTP id 5b1f17b1804b1-490a2988e6dmr78684635e9.33.1780157402141;
        Sat, 30 May 2026 09:10:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cab7b00sm124757685e9.14.2026.05.30.09.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:10:01 -0700 (PDT)
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
Subject: [PATCH 14/17] mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L
Date: Sat, 30 May 2026 17:09:41 +0100
Message-ID: <20260530160958.130977-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33380-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8CBB860E0B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add an hs400_es bitfield to renesas_sdhi_hw_info and implement
renesas_sdhi_hs400_enhanced_strobe(), registered as
host->ops.hs400_enhanced_strobe for all SCC-capable controllers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi.h               |  1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 53 ++++++++++++++++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  1 +
 3 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 92b66116f044..1a837d0c9479 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -48,6 +48,7 @@ struct renesas_sdhi_hw_info {
 	unsigned tuning_delay:1;	/* Has tuning delay */
 	unsigned internal_divider:1;	/* Has internal divider */
 	unsigned scc_hs400_mode2:1;	/* Has scc hs400 mode2 */
+	unsigned hs400_es:1;		/* Has hs400 enhanced strobe */
 };
 
 struct renesas_sdhi_of_data_with_info {
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 282107d06114..2a70a2e64b9c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -274,7 +274,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_SMPCMP       0x00C
 #define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E /* G3L: SDm_SCC_HS400MODE1 */
 #define RZG3L_SDHI_SCC_HWADJ2		0x010
-#define SH_MOBILE_SDHI_SCC_TMPPORT3	0x014
+#define SH_MOBILE_SDHI_SCC_TMPPORT3	0x014 /* G3L: SDm_SCC_HWADJ3 */
 #define SH_MOBILE_SDHI_SCC_TMPPORT4	0x016 /* R-Car */
 #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018 /* R-Car */
 #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A /* R-Car */
@@ -298,8 +298,9 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(8) | BIT(24))
 
-#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
-#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
+#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL		BIT(4)
+#define SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE	BIT(30)
+#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN		BIT(31)
 
 /* Definitions for values the SH_MOBILE_SDHI_SCC_TMPPORT4 register */
 #define SH_MOBILE_SDHI_SCC_TMPPORT4_DLL_ACC_START	BIT(0)
@@ -574,6 +575,8 @@ static void renesas_sdhi_adjust_hs400_mode_disable(struct tmio_mmc_host *host)
 static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 					  struct renesas_sdhi *priv)
 {
+	unsigned long val;
+
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
@@ -583,10 +586,12 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
 
+	val = ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN | SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL);
+	if (priv->info->hs400_es)
+		val &= ~SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE;
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
-		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
-			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
+		       val & sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	if (priv->info->scc_hs400_mode2)
 		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0);
@@ -783,6 +788,41 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	return ret;
 }
 
+static void renesas_sdhi_hs400_enhanced_strobe(struct mmc_host *mmc,
+					       struct mmc_ios *ios)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct renesas_sdhi *priv = host_to_priv(host);
+	u32 val = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2);
+
+	if (!priv->info->hs400_es)
+		return;
+
+	if (ios->enhanced_strobe) {
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
+			       ~SH_MOBILE_SDHI_SCC_CKSEL_DTSEL &
+			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL));
+
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
+			       ~SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN &
+			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL));
+
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT3, BIT(8) | BIT(9));
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ2, 0xFF);
+		sd_ctrl_write16(host, CTL_SDIF_MODE, SDIF_MODE_HS400 |
+				sd_ctrl_read16(host, CTL_SDIF_MODE));
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
+			       RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);
+
+		val |= SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
+		       SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE;
+	} else {
+		val &= ~SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE;
+	}
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, val);
+}
+
 static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_4tap)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
@@ -1333,6 +1373,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		host->ops.prepare_hs400_tuning = renesas_sdhi_prepare_hs400_tuning;
 		host->ops.hs400_downgrade = renesas_sdhi_disable_scc;
 		host->ops.hs400_complete = renesas_sdhi_hs400_complete;
+		host->ops.hs400_enhanced_strobe = renesas_sdhi_hs400_enhanced_strobe;
 	}
 
 	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask_all);
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 83d348fb5eeb..a021ebb46070 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -277,6 +277,7 @@ static const struct renesas_sdhi_hw_info sdhi_hw_info_rzg3l = {
 	.tuning_delay = 1,
 	.internal_divider = 1,
 	.scc_hs400_mode2 = 1,
+	.hs400_es = 1,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
-- 
2.43.0


