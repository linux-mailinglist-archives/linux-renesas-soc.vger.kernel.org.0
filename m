Return-Path: <linux-renesas-soc+bounces-33480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I0OKBZzQH2oWqQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 08:58:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E3424634E2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 08:58:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aNFp4Gqs;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D103C304E2B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89F83FD14E;
	Wed,  3 Jun 2026 06:57:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11303FBEDF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469868; cv=none; b=qynIXVE/VlRGx2Ym4s7Js4jWCrLEWQNn/wpSB4fun8RTwvPaVG7EmLdzYmbcRlmpbkSlft3rqnUX29nXSeSorkWeqR3HRTZ6C1dO25LGU1O1U5HKFpOnc1P3DlmLGRvxcaI/wIZr7jxrTsJ357ZDRloMzB7Z1Zu99DWM6Jg1s7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469868; c=relaxed/simple;
	bh=0xf+hP5rWVHXOKLQ6AuUcMvnJdEpIeucNgsnnDWzESc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VH6Jcfcu11K6RebdiqypPjNtCYPiX9fslm9LmuthQ6U38iAzwUE90Pm+dyjpc9DC1zRpGNwVcNYJTmTEWuiah62LN62aGe1PjbIqBgyQ9sx4PLTqbZlcnPjaU+mX8cr9B4yyzajqja4afSt8tv3wt0pfxvT7Stsd2YOUbEruTFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNFp4Gqs; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b3e03939so2578075e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469863; x=1781074663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwqViYMj+duoG+HGmmKtoADFYA5MQk3J3/I4ySPOkzY=;
        b=aNFp4GqsnSGTkDO1c+xra1FqvIQkLJGYPz60TD9pebQFRr3KzGR3j+QoWJ5UKoiSkH
         gOMlvEdG91mImeBFPszRZ1SKkX8CS1tjiGT1BCDVs2uJytNKxqQBHu8HG9tkgWjxsOLx
         /4+YMe3H79OedA6Q2s4Ynzv1PsVE0+8zvmZYSEHy6P/mct4qVq49EXuDFu/xNHPo09YI
         oAJ6RMfGkgv06OwqeZjDaZWXf0KvgtJB5CbyOY56PZbRGJRdfxaKwSQhO0S/DuoYPOpK
         i8Iv5qRzzWEpm2YwxIb3Ap9iMn80T7LE8Y7qL3+qOFrJLCS8SLJY+K6gelN23+ZofP+7
         Qiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469863; x=1781074663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HwqViYMj+duoG+HGmmKtoADFYA5MQk3J3/I4ySPOkzY=;
        b=KkiOxVafK6YT8vN9NiUTcxOmsW7u8ag6/cpKJM7oyAgohz6pblSMK3r6R/8JKsRMAp
         H3Wil+oNy528hmTS5+fygVfyctZ6EiYocrbVJjGnz/hl+uPXsB0lYST29jJflf7Ddh7N
         eDXwSJxS5y3Yciblr2rGfpUHvzscEE4IBfobhsRgNUho4y5Dgb3E1HOk/DuqF3cZ8iTb
         dF3GwfMQ/EvDx+0fSIb6dX2Hzkde727wOzRoadwOswHzdc3rIoDtBxsGKbs0F5GszWti
         1bFiXZpJqeIYQ0/bT9mgsaOP2IVhzr63674qAIAUKh1Iek1P9LER0YdFvkGKEBbOWVsC
         j3iA==
X-Forwarded-Encrypted: i=1; AFNElJ+kuYMELfi3LELKyOEdOHPSzgL6xarK0VXoQOW64+nc5D3NyJeDkhOxoYQT81cpDsy2XtQ2fNsautLRKU7Ypee48w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+k9/u+OcSQeUzAL/9+++2dRfrk+a+PQkRuSHYxOgaqLVgaYMQ
	NaSLDYEwIKYlyYXWlBlDpVlBBuwHe1u/3ho7/HjNd6zsUX1PsXBvFikRyZUJQg==
X-Gm-Gg: Acq92OFVYoUtS/6eiJaPtIvEwNem9p4MXQdWReVL7bXUzWr1XsvkJaJl2Z6+dte065s
	jfBsCfH9tBD+Ov4aiE/1py2guWt/eekuzAhbRgQjmypj6yi0ZagmB6s83MnCujMnCfBxwAvvz2h
	//aCAu36oOSbmmR5lL06zCEqMkycPPhnfl70narPppLdRd9INOs7gUBzow24SgAg1jKWFbn8Sc2
	+/4fMtImvLi1nXWEg0PmjPQOIURJV/JCxtqNKBImT+PajebwEqWUDapJs2y/gk+pMG5VUpFS23p
	/XveQr+rxfMq4KZkcxoDD0RswqQoutnJ2zoJjQqtfevBDgNh4G4xmZwHzogXAJqlmDWjxWIr8jX
	N9swMRaeBde+xtrT8KD+qT2SFEOZ26HvcQjn/KuI5SR9Shb40iMksVXKQoNk2VPCnBzvFsWtRk/
	NMNKvonmNIWv8Pux65ZsOzgshzMYy7Y32tTX254iGjv46LUJhCkVobjNgg4S0=
X-Received: by 2002:a05:600c:3586:b0:490:b080:4835 with SMTP id 5b1f17b1804b1-490b5ed385fmr26303835e9.0.1780469863125;
        Tue, 02 Jun 2026 23:57:43 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:42 -0700 (PDT)
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
Subject: [PATCH v17 07/17] mmc: renesas_sdhi: Add max_divider to renesas_sdhi_hw_info
Date: Wed,  3 Jun 2026 07:57:07 +0100
Message-ID: <20260603065731.93243-8-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-33480-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3424634E2D

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
v1->v2:
 * No change
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


