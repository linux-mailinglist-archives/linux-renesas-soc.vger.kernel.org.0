Return-Path: <linux-renesas-soc+bounces-11184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 434D19EB7B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC5371659ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D193622687B;
	Tue, 10 Dec 2024 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Fo1i+w3T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533A32046B0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850636; cv=none; b=krQi/2XZ6kRgBmCBsnLV1W+FcK2aigb7l/IKTW5yhsCUsmQqHjTa6T1mnvepl5NokoGJkYPJDXQ8An4BQV0I0WEMO2c6RdAXbZV40w5mRTmLGqf7AfqAKenlV/vg1dtu077fYZwXL1GiR63PTRpkdMf1hXFyDZ7JjNcbCvv/tSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850636; c=relaxed/simple;
	bh=nYG4Bh/KOUygEwsE3gKVUjg9VDgkI5hhLIDAicMnjio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=suRznR1wrqWVLkrC3PGgsvJZo3WCUYy6wuZ50Qt1vy0isYoJs773BFhcrqzRltjotZ7VwfwC522RjVAwu2hVt6gzXKM3cLkWvbpK1WtbfmptEYuCXJMnOh2hbKQWyREYLMe1FPPJIvycZp+HKx5chlBNg2BVkLYHCLUNBAvDRHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Fo1i+w3T; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cf6f367f97so8533552a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850633; x=1734455433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+Q7Wyi2VpUxYoA4m3KALmoe6y3o5M1OmNQXa4v/tj4=;
        b=Fo1i+w3TJi+119cQoeOTad7/37hS8TCOsKVxQ5/NPLbmUw7h0HJt9tPJdTQTMgMwqC
         9bOctIBCN4I/yOX51anVUxQBNwSYrOAp2lHKXA52MzkPGScd+bT06LA3c3Q9/kJqmWG0
         0LTIG1fpZzhfZryQGu290Cd/XIFbr5VHjzkS8roXYYCJ7I+yvg8hqJ2dFshuNWql2Qrt
         nhtVcvtkIMrX9DAxFsbiTbDOb+TtbYW+Pj9oPYtksfxu2px7ltzB8Li54IJ5ij0lYEF2
         gkJJtQNG8OkUSSYPyxsChtGMK6HSrNCiYluQmDmrXmrlNi9RaDi++XA7cFA2g/HD5m6P
         gcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850633; x=1734455433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+Q7Wyi2VpUxYoA4m3KALmoe6y3o5M1OmNQXa4v/tj4=;
        b=TjF9LiKt4+coNU9WfET8WY5JsAFysAw3xbCZE0Fs47uA8byCGxtTV2LP0I4ZwSTYmu
         kcrL3iMDpL354b1iHsNJksPed5xXuLiQTGPKismigK9Z+5Ko2iWaZWWRmVg6HBBQTI01
         zCX8aKm+1W19ZMeE/ltCVtg1LNKU2pXWA5riuAdxyABMcBLSpK3Nh8tV3XwKjPlpgxvO
         y20LPJHTIZgEzMscAkIaAGHMGUapelmp6S1AjlnnG+6LUE3iUFKTukiSkRU3IugdgCII
         QF8ARfALx7B9ME92KpTluQhsLTidqDGgy7IEVx/D/hSPBnS8yxuluNSmPj5Jwn2FdU1Y
         CcNw==
X-Forwarded-Encrypted: i=1; AJvYcCXxgkS0D/H1HqYY8Ri5bmINb6TGU6qnjhZn1jo3xvxg4tw2wLHspNkM5sgj3CcJrJe9DEbquWEKOR6hQyKOAIf91Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGq/UjoduPgMRweIJNz9BHXybLCk4ICG99EYfjQqBaLg0oNjIt
	iYvr8+ObJy4JgLvOxNbZE2SbIsjXeoXV4zajBcKNtVFdcehLQnOT4GEKFL9L9yQ=
X-Gm-Gg: ASbGncsGDkqlftixEQdesQb4Dyt+SGXP4AZp701puCvxnCjWmRd4tZtDRLponMP0NVU
	oTr1hN4eTr9B1N7qwOp3Ri+UV8Zvf4lv4vQq8nN3jZfWiJjnAVFYlzAyY9xN85f4agEHgRYb4r1
	XFru9bVSoYx8OTxqcu2TBLDEcFJIbt1SN+2JZ1tOQ8UTRMNvR9+RNpSiwh639PIf9+zzLiZKA8l
	3Eh+6QOMBv+3yY3QQFUbSjKlk+xeDQ2JNGdGyWJbSkGYQUe/VzZYbvagaINHkuhuBqt2y4XoEdO
	zruWs6+R
X-Google-Smtp-Source: AGHT+IEBCVJ5ksFpp4FwClVaCrJfMHHPabOYnva4BY/zYpG72K/0Fg/nCKLr56XOe4brB+WYlaK2nA==
X-Received: by 2002:a05:6402:2688:b0:5d2:7199:ae6 with SMTP id 4fb4d7f45d1cf-5d41852f3dcmr6281078a12.9.1733850632877;
        Tue, 10 Dec 2024 09:10:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:32 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 12/24] ASoC: renesas: rz-ssi: Use goto label names that specify their actions
Date: Tue, 10 Dec 2024 19:09:41 +0200
Message-Id: <20241210170953.2936724-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use goto label names that specify their action. In this way we can have
a better understanding of what is the action associated with the label
by just reading the label name.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 74632e2482f8..209b5b8827e5 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1084,15 +1084,15 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	/* Error Interrupt */
 	ssi->irq_int = platform_get_irq_byname(pdev, "int_req");
 	if (ssi->irq_int < 0) {
-		rz_ssi_release_dma_channels(ssi);
-		return ssi->irq_int;
+		ret = ssi->irq_int;
+		goto err_release_dma_chs;
 	}
 
 	ret = devm_request_irq(dev, ssi->irq_int, &rz_ssi_interrupt,
 			       0, dev_name(dev), ssi);
 	if (ret < 0) {
-		rz_ssi_release_dma_channels(ssi);
-		return dev_err_probe(dev, ret, "irq request error (int_req)\n");
+		dev_err_probe(dev, ret, "irq request error (int_req)\n");
+		goto err_release_dma_chs;
 	}
 
 	if (!rz_ssi_is_dma_enabled(ssi)) {
@@ -1136,7 +1136,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	ssi->rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(ssi->rstc)) {
 		ret = PTR_ERR(ssi->rstc);
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	reset_control_deassert(ssi->rstc);
@@ -1152,17 +1152,17 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_snd_soc;
+		goto err_pm_put;
 	}
 
 	return 0;
 
-err_snd_soc:
+err_pm_put:
 	pm_runtime_put(dev);
 err_pm:
 	pm_runtime_disable(dev);
 	reset_control_assert(ssi->rstc);
-err_reset:
+err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
 
 	return ret;
-- 
2.39.2


