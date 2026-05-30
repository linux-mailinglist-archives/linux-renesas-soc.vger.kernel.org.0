Return-Path: <linux-renesas-soc+bounces-33372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNUPOZcLG2qH+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:08:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C9960DE92
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC091301E828
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C125A34040C;
	Sat, 30 May 2026 16:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5ENE/Qg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616D3403EA
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157321; cv=none; b=FbCUa0F4aRHBSsarZljQMm0X7j2+tCBK0R45D7qFuQ569i+/amQpduk6E0ADqrTjBkr+IDQ00XhVQ/TzZ3F0Mg6VrdeK/JSC0G0WEuL0VVhxF3LOHrj7XMdGkBIrp9xoPu2g+o8vkRJ3fxMICMGHa01M0yGp2cYZ269vOKR1osI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157321; c=relaxed/simple;
	bh=wJdWUv2MNInaY/Ix9JpLMlbTDopw1lODDQtF795isII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j0fheH5gnHIMt+DqV0JNx8G82wag5UdlJ/1+MwNQVWX7GiHe/lLRsiq/9CJUNzOV0L2WPJLT5Op92oBzoVMoiFZ5QhI/WIV+J1s/Au4L/MQbOxoh1gPbYJxap1v/fqtgaw/ujofniaUkTHG/WsaNSPQy2zBFp10Ttq/GhRzQPB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5ENE/Qg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45efa80e0afso271871f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157315; x=1780762115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EFmxX3xfuUFsSfWDI4lD89MI6Ae0v7p/AERGxrwy3k=;
        b=K5ENE/Qgyd2/7i1BC/qmRY9CAgyzEpVCFLINcHSoFBGWkFEnQsrpXBmVsAS2cJnPZ8
         2cS+fzBe1CfD59dGXGzehNn0bhXGpsm9FhYSRvyZChUDP5djh9vKuZWo7gfQiCC2cKTr
         9NkHG3zS3mTWV4oAXLR3XGzGS6Em4hTHxAehvWUcKzBm/r5+vA87UK3ks8D37bzQQ06c
         s0qsNN2eJDi2CU858NvGL5CeFWlunzf3tGWhKrCnYtujEw3knBvD6v3KLsA7gmoE52jc
         D2RCrqsripLFAksT/JLbOX5NvlibZg5thIv8moJEm0h66XVFj4NVqGQYmgoEJOw+Y3XZ
         fELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157315; x=1780762115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3EFmxX3xfuUFsSfWDI4lD89MI6Ae0v7p/AERGxrwy3k=;
        b=CCKkgtucQnFUnYGMoDJk524VGJ/2NFFxlU5jCET61BV5n5hmPRSqkekoi97GI4noSR
         0C88eWUUwpFrPXMd7GWPzK28VODLucFqkKNjnm+m28lsp74VOozn40smIPc2u+EAPjOp
         2EJwl80w9CKDEZrdvm4wGK7C+Oh0yuyn1NgYAgc2O+fns8XR7lASA22kIKYz6cjNu/Ol
         3R1+F4btKjk+JKLb146UxW7RgIaqCThnKKv/AsCl8ciXecJhvW9uVCoD6IF8iz+o9vQV
         mJPNCru0w8TJzBopljXIZXaJMtCcV61fVsSEa0w5Cmo+DOc/GXh+iLbCIawNVTP+9qZW
         XyfA==
X-Forwarded-Encrypted: i=1; AFNElJ+59Ja7N1TX6sOUWolTSCYVvtwpKivcmcyCwn76ziNCFvCHDe8wX6wrjeAbL3c7hTYFK6LlQHQ76RjlbAaAcVARHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqtUXctaHgytAH67DslKw2ej1NFRwzHFIiBdjbKm26QaCF0C7F
	BphAPddOWKl2NB/o8FG9d60VgFq1AuZcLwhfeLGz7bZFOu+2tPRDKF6E
X-Gm-Gg: Acq92OHBlZwNlWqSagd0R0Ma2il4CG09/IJ53/WQYxrRiOwRbGy1QIZuGciTTriaOlz
	Y+EtxMxBr5tJk072fQo1Tj6NxALuqCbvLYEumL777VlAQRXFzkVY/g8usq9I33FvfPTr6k9QqQe
	Vs98x99Rm6sQa6AX6wCftKzVp73uxmaK198QjW8cA6fzzTi9Efduf7r0Eh6BWmaumUPnh87BoRK
	lTka8+RhrqB4Fm0L7jrkFA5KVxwz+KK9iLOUWPIEgKbTqpvoJABRDdNERd0NReZvbhl8lhpRUE6
	R6znlnJfpv/KM+RqiNQm/FrVsPOVRO1LJlF4Rd3YFZ7qcLnp3I8XAG6K9QgPWfFDIXx9FZMIrAU
	l3aQxUm1mgXq7bovncPNHXIXDignMfGEobsbfAdDYY/aJPFemUFXs2BOpBWfSQnucVlh2hMkqV5
	+S2kA9FCi8oaaVyuEnyzP5Ep9kfGaJOu1jmY+rl7UYgkXhLsZ0oEXLZkj7rK8=
X-Received: by 2002:adf:e744:0:b0:45e:ea71:c6e1 with SMTP id ffacd0b85a97d-45ef6b6b8ddmr5116898f8f.21.1780157315055;
        Sat, 30 May 2026 09:08:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:34 -0700 (PDT)
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
Subject: [PATCH 07/17] mmc: renesas_sdhi: Add max_divider to renesas_sdhi_hw_info
Date: Sat, 30 May 2026 17:08:01 +0100
Message-ID: <20260530160823.130907-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
References: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33372-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: D2C9960DE92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has a maximum divider value of 2048 compared to 512 on the
rest of the SoCs.

Add a max_divider field to renesas_sdhi_hw_info and replace the hardcoded
value in renesas_sdhi_clk_enable() and renesas_sdhi_set_clock() with
max_divider.

All existing users are assigned max_divider = 512 via sdhi_hw_info_generic
in both the internal and sys DMAC paths, preserving current behaviour.
No functional change.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi.h               | 1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 4 ++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 1 +
 4 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index a7fc525b7218..a42934e6d49d 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -43,6 +43,7 @@ struct renesas_sdhi_of_data {
 
 struct renesas_sdhi_hw_info {
 	u64 clk_mask;
+	unsigned int max_divider;
 };
 
 struct renesas_sdhi_of_data_with_info {
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 2ff40950f209..16ed6fd8470d 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -117,7 +117,7 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
 	 * Minimum frequency is the minimum input clock frequency
 	 * divided by our maximum divider.
 	 */
-	mmc->f_min = max(clk_round_rate(priv->clk, 1) / 512, 1L);
+	mmc->f_min = max(clk_round_rate(priv->clk, 1) / priv->info->max_divider, 1L);
 
 	/* enable 16bit data access on SDBUF as default */
 	renesas_sdhi_sdbuf_width(host, 16);
@@ -206,7 +206,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	}
 
 	host->mmc->actual_clock = renesas_sdhi_clk_update(host, new_clock);
-	clock = host->mmc->actual_clock / 512;
+	clock = host->mmc->actual_clock / priv->info->max_divider;
 
 	/*
 	 * Add a margin of 1/1024 rate higher to the clock rate in order
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 512ed70b3779..84b1b38ca465 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -234,6 +234,7 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
 
 static const struct renesas_sdhi_hw_info sdhi_hw_info_generic = {
 	.clk_mask = 0x80000080,
+	.max_divider = 512,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 1291970c2810..9d34551c6836 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -75,6 +75,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
 
 static const struct renesas_sdhi_hw_info sdhi_hw_info_generic = {
 	.clk_mask = 0x80000080,
+	.max_divider = 512,
 };
 
 static const struct renesas_sdhi_of_data_with_info of_default_cfg_info = {
-- 
2.43.0


