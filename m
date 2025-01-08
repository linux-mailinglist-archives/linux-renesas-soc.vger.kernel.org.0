Return-Path: <linux-renesas-soc+bounces-11948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C897A056DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 10:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 598941636E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 09:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E055A1F37B1;
	Wed,  8 Jan 2025 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vrv62d0K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341E51EE7B7
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jan 2025 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328533; cv=none; b=PVWKxXqTTGx9sKhI/ak5M093Nim9wrHCeo5ouMspLKVBlfkVhyKOIhtdBMZwMvFveMqOnk7Rjfojt3KIKcsTaGiyYp7M2//vG6k4NTZPEbD/8DQb0FHienERSg2PUh3G6wEireSpqwh44snzuZE9ZJyYZKcfkTaZF1HhS3uMroY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328533; c=relaxed/simple;
	bh=yA7y97nb85po90Zmk69+gL//XzthbasJe+UKvQBCBIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fDxlEugAazrwe3AXLHJwjQH1iT0iE9i2GUfCz66jQJqdJTlp3EtsMc6NIQ49Qee7amPCdNJgo5FYQF0B2JE/g6xj2l8F9cXH/XhmOakkowuN4lKH+BBwxAwf7aJvckwQzK0QI7JSDXv1uNpbdzSCJ7/nDRB4njwP5+qA0EmjZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vrv62d0K; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso113660255e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jan 2025 01:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736328529; x=1736933329; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ksX/kLob51zQcWxh1cMQc5uB7HVLI56lSlw1NK1rQYU=;
        b=Vrv62d0KBPN9aT7G2fo5sRAsLw8PLpQzbuSWTiOTOcNzO14J8fnCloQgcZWp+vQQ6Z
         ioGAewjcotWKLQjXrH3+PZO/W5zPNyN04BTvD3Gw7P9U4B30GOLOKiUqo+soA7GkXfk+
         7ShBx+KLuCUyIH02GGBh2aJOHp2s++6fprb7RquxyktEpPwf53Oq6siW1Lo4vaZFpn+U
         jpgq0zTz9aI3uiJS1rltkK/WTWIEcYqQh2BYHmts8eQ7KwbTZY01uPXhGhw6Mrk3LYZT
         Jgi+gjpL9DlSfXjsltToLgTa7XrGPaDz7B+v4pB+vnOikr+RRoQAYx1pYt47kwnu8umD
         k7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736328529; x=1736933329;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksX/kLob51zQcWxh1cMQc5uB7HVLI56lSlw1NK1rQYU=;
        b=QbgwedMuLBT9+1mjta+tqqlL6tI3oR+HvlC4zCiVrh98AAekz1/jeNryiAUxfrKz1s
         ujxk/AuPgmJt1qI4qHgOeBImgaQgZWGz4vUtmjCdJyCRoJ2BWvYEGlXGGo8q+1xjARSs
         iBqbp7T7yMGUe+qsZlajFX0R9B28U617FVh3p6jSB1HDDft7mcUXg5kMPN3+oP0+Lm95
         t4YnG4Ey1vChGluleC0vcbEQP3j9hbxH3J+Ks7U7LL69p2wH+yN81B6RDVg9Z7CFEsv3
         M0zHojh99S0i/HYu08LFdcSR7u2Nk1NzKnFHkc++5qMOeQZevpMOL95m5fd0/HdBq6Rt
         Q1fw==
X-Forwarded-Encrypted: i=1; AJvYcCW5b9kD0K0wBJxw2JEB4qqK7WLmjnQfjJULCbQD6aviSSD1oDZqtTq93e/H64YVYcR2kq2GRg+KEItNfHHeScObRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhD0eX0z5QpLh/eJuOqDFsYbO0TmHdHbgwG10e6RGNUXrXABWC
	Rk8NSVkj9lRshox6sbA82GGgKssq1M1XMqwXrX5+AkltTrRGt0wZoK2iI+UkdaE=
X-Gm-Gg: ASbGncvmT5FOpY5PeTulb7h/PMDtZvLX5co+5GFa1GYfqZ4u6rnJ+BXXtqgn7aQftQ/
	etn12KjCcp8ayCqyhtMAhb2ADOIfvcd0mmUxP3q3DxIuT61rYoIGwZ6BLdpsFS8lMTOLT4MT/Me
	oEOwQI2qGOiIrnASyiTPPcWliKqfmv09kGJsT2crzL46Dp0vHlvsKxTJ4xfolly1SKpBbb3xvSJ
	fn8jar1ZfF+5V8RTtGeLi9LDyei/H0/qJoXY8AQeUL5kbCOxpV9c+awYhknhw==
X-Google-Smtp-Source: AGHT+IEbOKQpbXnV0Vk4QEqZakle2mY4HuBVWDf4SPOXo+NOnQPd/LEFfiqdZj1V2NZzu8Gu4CgtXQ==
X-Received: by 2002:a05:600c:1d82:b0:434:f953:efb with SMTP id 5b1f17b1804b1-436e26f984amr12953225e9.32.1736328529560;
        Wed, 08 Jan 2025 01:28:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92f60sm13995695e9.40.2025.01.08.01.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:28:49 -0800 (PST)
Date: Wed, 8 Jan 2025 12:28:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: renesas: rz-ssi: Add a check for negative sample_space
Message-ID: <e07c3dc5-d885-4b04-a742-71f42243f4fd@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

My static checker rule complains about this code.  The concern is that
if "sample_space" is negative then the "sample_space >= runtime->channels"
condition will not work as intended because it will be type promoted to a
high unsigned int value.

strm->fifo_sample_size is SSI_FIFO_DEPTH (32).  The SSIFSR_TDC_MASK is
0x3f.  Without any further context it does seem like a reasonable warning
and it can't hurt to add a check for negatives.

Cc: stable@vger.kernel.org
Fixes: 03e786bd4341 ("ASoC: sh: Add RZ/G2L SSIF-2 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/renesas/rz-ssi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index d48e2e7356b6..3a0af4ca7ab6 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -521,6 +521,8 @@ static int rz_ssi_pio_send(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	sample_space = strm->fifo_sample_size;
 	ssifsr = rz_ssi_reg_readl(ssi, SSIFSR);
 	sample_space -= (ssifsr >> SSIFSR_TDC_SHIFT) & SSIFSR_TDC_MASK;
+	if (sample_space < 0)
+		return -EINVAL;
 
 	/* Only add full frames at a time */
 	while (frames_left && (sample_space >= runtime->channels)) {
-- 
2.45.2


