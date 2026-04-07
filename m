Return-Path: <linux-renesas-soc+bounces-30932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBOXOFwK1WnMzgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:45:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 532E53AF652
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CDA630C722F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 13:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4430D3BED44;
	Tue,  7 Apr 2026 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Y7tsGpto"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F253A3BE154
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568958; cv=none; b=czqzn7d27yHvacJE2y9vWNBr2VQwalY/OhAbCYwDovUlvc49eqf0zX/J06mJDXvvFcxLAJQr6e0mWioTRgUj02hbf6GTH3xfy3gefvN2NdZ2JqDzkhalrfmqzNfvu8/ZEdzTOGmzITFU7GV/2A+Z/sr3QP0K46vi29YVgcERbCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568958; c=relaxed/simple;
	bh=rBbNuLetMHuecYYiQdVKCfgcTJZ2MFfS+stiyk79XS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6PpdDBcrMdOENO8MKThba53pTN5GDLMjfUEtWYJhdBIyWJcVKLrzmUEnRjvra9lZP4T78L+Rdp1nL2zLGYiwrExqtlaMM3BPiIVZT34zaQYFJS/TeqlrpSleKBwKdXLbsAtr2LLePc7cspjxsfX5rFKszLxkY1aSR7+NQ/GILQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Y7tsGpto; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so12132725e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 06:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568950; x=1776173750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tR9Osv3U5Kocq80qg3AQf1FnSrs0NQ0fc/wysBCHSXo=;
        b=Y7tsGptozEVoAmu0qgh+eXPwv99E9E41+7bEAA+4av8gexervSBx9zOOKJfJysdmwQ
         7yIiIG18n7BVaV4S7FAIFj4C6AFmyuEKaRdO6eBbYtL7oWRVsszH/d5QOmp79ue3aKoA
         LT1S7jkSV+GSxyDddKXxZwUrig2HnbfVCMT279g+mmxPriJuydAQrqcYYF6M7SKr2frN
         WBhJp9a5TVivAuzQoqC3wz/fWoq7yFHM+gpoE9U4sL8nFKLokTsWnGX7EEF+ECVrOZCN
         EyoCqbygs1VPVpaJ+Ir8T9f4Nm+EprJgZoUc4LxWK9e70p7e9xG5aqMKy1YBTL1CUjYi
         QY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568950; x=1776173750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tR9Osv3U5Kocq80qg3AQf1FnSrs0NQ0fc/wysBCHSXo=;
        b=TI/IHwvhcznC8sKEfxt4pcxhmb34JbbOQ3mW7kKFFd/df9FPx5/0ZElfF5Cwd4R9ae
         SgvwTUSkfXulrlhtGBL7vMfyEji2I38fZpXT2Rr2r91Pk0xTSa7HL3mOCvSaFFT6xB6+
         1oz7QZh8AERMjeqCJ/uwXDYmny7oxWUMEtoRKah6Cq3Gtpb3kjO3gRDR4C6JvrxuJBND
         WeRrKJO7AW7RsI83ruFg3SDi7fHYMParrEdjfNpfpi7sfljMaXhMvHlFOa2U0EsUHT/n
         fQXcp2CQGj+2wSJvCxJOwi6WqZbY68M2WJ+ms+seMqfKKrDkMGMk4nfqvOP6JHF5n4uf
         R1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCULe57eYdBWYk2eoJ5054FP3Fp3jXX0Ne7sRJpsfeOV7UVMcLbotpxqGdYOzjzIa4m2jlW3l5XcLISk/0EpjRK1Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSlqOV847Gsbro7zU0xATtCBOZe/QFow8303N79jQ5OEgwpwZ4
	oir7139IW/f8rsI4/pTSKLaWnelhMAJDwZhzwBOLmDI3MTuzELWBHqRva0TMF5KyIGc=
X-Gm-Gg: AeBDievA++kAhPITGvAzWqc+GWpjzCnVc57ywc8gu3gXoWrboHNCaiI9x7olOYuKtlg
	caDKSdQRgiwz00RhqxBuJB/gKh0xlMrbU89LfTY5Eb896pr1SM1maz4NRKInKh3kbybGS/Ff6UG
	DAlJKE3HuJLWjrwRf4VAHnUJVmYn/n1+GSH18szxRBuYWeCXeir2/RoRIvoDnKd4niH27La2AWk
	TDY/S8yLzkFJSJWI4K0GTKKKC3xg3GRNaLgmgppYOctfBMFWdOJyav9lq//w6q1MpkxanXo/R4b
	FT+ho0mrXZaQ5NSQhHY1nlHuNZZ832IvEykXtKzTIHUyokeAIxuOIHt5KOE1Rzj8GKI7IgHS3Uf
	7b0yBy3yfqeRvcg600hdNdNAYZo1gy0tlD3nVZ25MnfGU4WK90kBfuRDkIgrUyY1sWWGs4QFYII
	NYlgf39vlQTTycVMk9RHgv7eO+4GhaOprEuQVV9jvG7HV8BALQnvZJ
X-Received: by 2002:a05:600c:638e:b0:487:575:5e1 with SMTP id 5b1f17b1804b1-488997adbbcmr239785785e9.24.1775568950101;
        Tue, 07 Apr 2026 06:35:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:49 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 13/15] ASoC: renesas: rz-ssi: Add pause support
Date: Tue,  7 Apr 2026 16:35:05 +0300
Message-ID: <20260407133507.887404-14-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30932-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tuxon.dev:dkim,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 532E53AF652
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add pause support as a preparatory step to switch to PCM dmaengine APIs.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 sound/soc/renesas/rz-ssi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 71e434cfe07b..d4e1dded3a9c 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -847,6 +847,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		ret = rz_ssi_trigger_resume(ssi, strm);
 		if (ret)
 			return ret;
@@ -888,6 +889,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		break;
 
 	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		rz_ssi_stop(ssi, strm);
 		break;
 
@@ -1054,7 +1056,8 @@ static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_INTERLEAVED	|
 				  SNDRV_PCM_INFO_MMAP		|
 				  SNDRV_PCM_INFO_MMAP_VALID	|
-				  SNDRV_PCM_INFO_RESUME,
+				  SNDRV_PCM_INFO_RESUME		|
+				  SNDRV_PCM_INFO_PAUSE,
 	.buffer_bytes_max	= PREALLOC_BUFFER,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
-- 
2.43.0


