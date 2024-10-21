Return-Path: <linux-renesas-soc+bounces-9953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1369A90BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 22:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63E6D1C22C80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 20:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020BF1FDFA1;
	Mon, 21 Oct 2024 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqqQmW1z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FAF1FCF57;
	Mon, 21 Oct 2024 20:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729541644; cv=none; b=te4wr8qxkbJALLGTXZbA65toPU68T1ZerlMzPauT2u352AxN/a+Epq9VDmztd5Mu4w6SNz6pirU74doR8fJTw0enC940IXKACQ87xSJgr83h1A3haCFCE5XafT903WTFMrTu06rcfYj5RzlTdJz397BlVZfZGZKYt9c60rkmv0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729541644; c=relaxed/simple;
	bh=2w737HFDrptjnomXQPVJGpgUFu0Q9dDSGjgCocNgdck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVg8YPmQr+fOY6muX4auOsET+CTG/P+/7JHVXYsijQ+YTijx4PE7iFyELFAsy5BWObECY7QJh5eENwk4It+JbKqCZsykhqapMbZ+qnAYfnffw88idEb9N8uJVg54ZcoVgCLWEp/0zyDBP8t/wME5aJSt6llOP9LQSOgTAURlH/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqqQmW1z; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so56719995e9.2;
        Mon, 21 Oct 2024 13:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729541641; x=1730146441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBo3nLih0VUcjnDi5J2L1lthB9g3ABH7kzWG4kDF9ZM=;
        b=NqqQmW1zmXfoANkSN8zq6xmEVmYM9JAjZMWWbPYim4WQ17C3fCmOkF8Wms8TyOin75
         IwDZng7hxnl+Frbleq78Crm4nrFT2kCXJpYWcYFpPKl6vA9AJhhUNDb/8J75KaKOu4Z/
         b63Aj70lHDTltfj64AWTixaSnO6A05LrXojqp1/GsUVGQstCS4v2Ckm6xp/XAV1fgtW/
         pAomOzzqXP2rFZRtH9zT1QXcpoaVG35t/s8MwNDyTT9ucR2t/PkpKxn6xqxrLpJfLIvy
         65dd/+t5j4lqSUyfj8OWIbSTDGFi8wxoAOJX/NK7BOskd/tyWF5TAwMnZlttEjs34Til
         zU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729541641; x=1730146441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBo3nLih0VUcjnDi5J2L1lthB9g3ABH7kzWG4kDF9ZM=;
        b=FGmxw7AvJ+9447kKqhQqbJxxUHejRSF95Wgei4u0fHKrQ2UA+ydTNOF8jK4LlI1cvh
         AOIE0IDLVu9x4hfR54Me0cghzJFiIzTIimklV99eTaGy+Aulwr/eUMPzWMF73NmSCkA9
         oridsQjnPYeFxymXFbSGCdjtnyE/BzCaaFBj2KXk0uoqoWPHXzpD1gDUnKUnNMf7YB52
         C2ZkmsRwlvAGFcKDAucwM4T/3vLAcqW36twcru8Sp7IlHPQiPulbWCMdpzySEyDsBKov
         XarR5wvTOTaN+bpC3XjY1RVsUfor4t1D0I3CgNYWipiH1Ywf+HQTMtPPOdL3zaMoMz6W
         M7kQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/LegtjeHq1+p1GLwoQ0ilYaEo99p45XQRxQy29dtxGxA8MVqL8SjIbfIN6bnCUINECQLReePd+6+S4pk=@vger.kernel.org, AJvYcCXFGj/zqiZ9zQphyr2J4MbfSDr7iiD8zLHKqkEZnVv58vfxWfThKCyGLgH8Ya7SbYgrXJeTNzWj8Mh+Cg7+VODGNCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoWxuNvLIMGYUFii6PuxVfBBbotSASkJ/0d3nkf7XKWGZie7SA
	WT98QjWoR6Ztzh3zvqf/3T7NIqwjpVpxmfhDVtalJ/dWpipRRr6T
X-Google-Smtp-Source: AGHT+IGQSi/g+C4RCABjhf1W/CayO9pPmlt+185dEIZOajjQGhu+uES5M0EEWx1reU+mM/P9Fsyb4w==
X-Received: by 2002:a05:6000:1564:b0:37c:c51b:8d9c with SMTP id ffacd0b85a97d-37eab755441mr13799641f8f.38.1729541641317;
        Mon, 21 Oct 2024 13:14:01 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:8a20:67a1:e60f:941e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a584f7sm5042935f8f.53.2024.10.21.13.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:14:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/4] ASoC: audio-graph-card2: Update comment with renamed file path
Date: Mon, 21 Oct 2024 21:13:48 +0100
Message-ID: <20241021201349.395022-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The "sound/soc/sh" directory has been renamed to "sound/soc/renesas".
Update the comment in audio-graph-card2.c to reflect the new file path
for better accuracy.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 4ad3d1b0714f..747afe7d6f34 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -50,7 +50,7 @@
 	snd_soc_runtime_get_dai_fmt()
 
 	sample driver
-		linux/sound/soc/sh/rcar/core.c
+		linux/sound/soc/renesas/rcar/core.c
 		linux/sound/soc/codecs/ak4613.c
 		linux/sound/soc/codecs/pcm3168a.c
 		linux/sound/soc/soc-utils.c
-- 
2.43.0


