Return-Path: <linux-renesas-soc+bounces-24625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A66C5BE0F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 09:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A289735D7A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 07:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F712FB998;
	Fri, 14 Nov 2025 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SF2G4tEs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C8B2F6924
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107145; cv=none; b=QyiUwyxfCd9FE7mmY/jC8RzdX1yJvbl+d90ASHNXL2rNdCwukNpRuqI73RENNajhejagklpQozb2JslFpbMdDH2ryh9GNUDBhGuoorRS4ViL7m0GwfHmLk+msgRLgQa3WeNbcnX1sorqW0rBRfO7pXJYswKv0DBVle17Wy+1Unw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107145; c=relaxed/simple;
	bh=9qhHAfmSmgZdMYGPPdj9m4G0frUb8TVsMzQFMztnhwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzplZzswrzeY3G54J3o+1EAMcLxXr2UZ/iJOSjZDuXgBHCmUdWfDCbT+jonU5Te1t9zqn30yT62bUG74ntaWR30STEV9emd4l9Z0DpvsCN2amFahyat5TRF1R2liqeFyHS38CbcSz0QD80Pm3+NxuPBkiy778jdpETKjR9QQDYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SF2G4tEs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso12081935e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 23:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763107142; x=1763711942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dno4fYyihe/RYznSluqpdOt6mZrIDZ0jrnHu7E3GcE0=;
        b=SF2G4tEsUoa56R8GeVecXqZEZuKlRHAQl6fCTN1RmAVNk5hsuRsEIJ5EQNHxFB/SDQ
         CTa/arSW/r54UFvF1sK3HKyUPRO+DjSZT20oRNSAixPCVKsQFdqtbrQPUOY6upk+JKqd
         HOX1wt2oNiFjEV2f3UgxcTITxubXL/xhqAkucIQTsaoiOPtlW/B4blat4BoYbdqEd8tY
         oPfmdTJYNpYpDfc525VUFi8Fl1dw78R0aRgAOd7NJoNQrJqMCPlj2UapI+oBfq5go09u
         cdMFAIzgSHlDb1oXgLbqKKhkZJzMFegLpuzUb4FUvGMiWd+EVBMp3yxE8h0/c4tJpVk9
         e25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763107142; x=1763711942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dno4fYyihe/RYznSluqpdOt6mZrIDZ0jrnHu7E3GcE0=;
        b=I7gw3J2U0sp0BXGa0wd9FtDhsXtUC8JNMN3d9RvWUb0s6aAZy/Wr6kO9pEANL2D2ND
         q8+UtqR3S6Nw5JCLJ1gOOkJA/KnkGCMKM8yUHVs4nUYJWwIu4MXNfCeRnBuRw0fUTW00
         5deElv5cfM8zp+Yxm7JiODHME5Ue7hXSjiFczsvNqoCk0huN2buPrZyD8DrprTtOXpdN
         nuCoABS12VQTY/1DnfHhionqhBgLPi87SMahsWM5wh1C8uqlJlHnvNCPfkuxvTT3ziJ3
         rmcdmD15JDiokPDAa2Vm5CHaVFi5+9J+HEwsExIq31ympdfGzH0lnubg0qs2EWW6UcS7
         LUIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNPHItJi6IwO29u1oEIybZtW4ZVA//jG7nL9WkDSTndChWXqgJM0HKrqqLK1e2DgGkL3xiz39wd4TOQE2hCEZZew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEKowuOgNLEIIHNRjAlRiGX/+J0LemLOEXn99NHOWK02+v8kZ3
	MUpuSekZpIiJkEidkm9CGkVH1i7LrLDVhRgxnJfBStJqiH7YdxK6cGyw
X-Gm-Gg: ASbGncsdT/7JJNbBdibHXLdAAG8YnIeZHoEMXVpaa4dDD6PrezkJv4NsLEy0gTh3Ltj
	0whWa1PZGmdmN4vZAHBWTQi1C5ig3bvCSlcTGVzBtK3hQHadECSe3L1ank7+HKkcqPmcf0YNieW
	rO7v7pIu4/zahfjuSGOOPBW4YAi5cBVKI8siOik76L2nr+Rj+ub1p8IpHtz1KLAxbVAdKE/ZCiP
	FQF/GrZkQSSiwrvpj+fW60+Vei56E26L3DCCzsSrcdv6NJeKSRj7kSDp2sKb8d6d23x8gKEGUWA
	fEmNDywW5tC+EgAtqXP5Q4FUD85Kfp64MMcZyDB5FTbFkG/0qhdaeDxO3DhSpNRuGf7d+3kVhqv
	E58Es3LXPS9FukT/tJaXx/yjSyBocDwq6CcvgA0GH0JmYlHnyRmBgfBmCs98lruT7AePIm6dLva
	id8pPsIDxxf7P7cDqZ0f91tqjzT8Fj7FR/odZCVogn1BkEtaKQlfFnCx4YrbU9L+/EvltBnWId6
	td8VrSUALqU2Yt9
X-Google-Smtp-Source: AGHT+IHSwU4mhyT8rLvuHxiA7sp7Ubk0n2kRWcbYTp78Fbo4XVCzyG5XlKzDo2VIzKhdrSQgxELv0w==
X-Received: by 2002:a05:600c:350d:b0:46e:32a5:bd8d with SMTP id 5b1f17b1804b1-4778fe553famr21894475e9.3.1763107141541;
        Thu, 13 Nov 2025 23:59:01 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c847bbasm76347895e9.1.2025.11.13.23.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:59:01 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 5/5] ASoC: renesas: rz-ssi: Add support for 32 bits sample width
Date: Fri, 14 Nov 2025 07:58:52 +0000
Message-ID: <20251114075856.4751-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
References: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for 32 bits sample format width for RZ/G2L SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped checking 32-bit sample width in rz_ssi_dma_slave_config() as it
   is taken care by restructuring the test.
---
 sound/soc/renesas/rz-ssi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 3ec7c9875b43..5909778a6a70 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -75,7 +75,8 @@
 #define PREALLOC_BUFFER_MAX	(SZ_32K)
 
 #define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-48kHz */
-#define SSI_FMTS		(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
+#define SSI_FMTS		(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+				 SNDRV_PCM_FMTBIT_S32_LE)
 #define SSI_CHAN_MIN		2
 #define SSI_CHAN_MAX		2
 #define SSI_FIFO_DEPTH		32
@@ -295,7 +296,7 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 	}
 
 	/*
-	 * DWL: Data Word Length = {16, 24} bits
+	 * DWL: Data Word Length = {16, 24, 32} bits
 	 * SWL: System Word Length = 32 bits
 	 */
 	ssicr |= SSICR_CKDV(clk_ckdv);
@@ -306,6 +307,9 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 	case 24:
 		ssicr |= SSICR_DWL(5) | SSICR_PDTA;
 		break;
+	case 32:
+		ssicr |= SSICR_DWL(6);
+		break;
 	default:
 		dev_err(ssi->dev, "Not support %u data width",
 			ssi->hw_params_cache.sample_width);
@@ -1016,7 +1020,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	int ret;
 
-	if (!(sample_bits == 16 || sample_bits == 24)) {
+	if (!(sample_bits == 16 || sample_bits == 24 || sample_bits == 32)) {
 		dev_err(ssi->dev, "Unsupported sample width: %d\n",
 			sample_bits);
 		return -EINVAL;
-- 
2.43.0


