Return-Path: <linux-renesas-soc+bounces-25058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCFEC7FE21
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 11:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 030D53A776C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 10:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81802FAC16;
	Mon, 24 Nov 2025 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EC+gxzE7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FA9270ED7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980126; cv=none; b=Q53pQF1TsE9eLY3dknDamNk3suRXp9iCRrvqMP3bEFkBdcW6ptTJ3oRldogV/HWdmO4EpoqAaC2hMhFYulh5dNt3vpuBwO9hAy2aiWqheDIUZct0Mv7X6Ew1apdHvTQsvCuVQfPf/JwfZ5/IFSm4ModvbomWXUevBWsgE/bCxRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980126; c=relaxed/simple;
	bh=3+nnF588T378GBA+9QQgUACjWK+jYS7zewBllPyBRO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDRvOcyvHwc9xoSLcxJw/II3OUIMpmpiCdNBClmLiMHssijPUswgP0yU9pfyZphoatjSkWiE//1eISXTWDqn+CIVXA4L/6fiqPSL/BG+OkK6BvsOds+YHW+B5WS3jxI0GgPuaNBByrHvLfyRUkQda2YI7e1X6qVSV2qlOmTHPAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EC+gxzE7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so42573105e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 02:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763980122; x=1764584922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5oBZG16/wN6GG9AM2JpUrMbboYKvUgGXIP4x48mO+I=;
        b=EC+gxzE7haF0S9RkQtrNX6HqYjPMR1G02Ts1FT7iyQ+S/mwxsk+ZCAYouuoWDmCgzA
         csP2hDwyZ0G5ri1+9MRJYnNYC56SSGbZObvP6iSO2KZrY2sP+6GcyIT0uwd1omY1RvHw
         y2C4aHx+AK+k8hKR6oyDO4lPVmCqqfTQfreWndATg3gbzmZjOlzvf9RxyTkJ7QHVUtgS
         CaRjDUqesHlIKWC4EHPUlLrsDavSpw9uPUkhnC/kHO0T4sknFQR9mGRjAQGdNnnzF6VM
         gR53s3PWM7R4fnScWOkKDZKN+n3t2BDLMEkpdz9C5s5n8PfSA+a5C+rrjyDVWPCp70aK
         nOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980122; x=1764584922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E5oBZG16/wN6GG9AM2JpUrMbboYKvUgGXIP4x48mO+I=;
        b=dF91v/xUlTDyNxW+v9bEjX7l4Nm7zxagEtjrp3HTmjJAO7DAEEtNqEEB71N2AX2aI2
         zi3ARetM5EUrDu8YXqTDCo2QHi1DZ/Io2mB7mvVhm+JSGmU/oAi6iqHuDPOlANeZZ/Lh
         OAl9Z0scpvOrgd5WRQOPNvcJSSqKTG8lwkOYtELXs1j5hgznsNXZDlkPgqzKafxy++DI
         o3tTHaWhmL04ZFZ5Ph/k8AFHDmIOlUtFH/zOnwZhgckj5EwOzMUJEwVoToXsk5mH8DvC
         +F4FsL8m7qeGYO3O2IzsE3F28R96qDXYEVghDBll4O0P9BkxmdvK/+uyxEoO4tao/kP/
         /7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCX1Q7MRa0lVnU5QghoG8bljrkFUZB9FT9Cy8mSoxIRiG7rDiC7ZsNSbRaW+ERjcc2kX41NXwdAdCm6NUMbb8E1Tog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxntFJnKjLQKr1DiRGUa19NUtd8+83qVvT36orWMj50gJyJuqDY
	zFXlNS0FL3dOp7aw5ZOB3nW5PsbePnvl+BJZy9USxURARNlFWmaqRQn3
X-Gm-Gg: ASbGncssDc4gB0dFNlrz0mvhBS44c+mm5nHSQvWwVy8d9cho0/1UVGwt2qY1g4uBj7L
	uOiWC9BxZCLCWGEJw+UGzWKajUniWUspW3qYGWl+ayp4qAQuSaCWWuaWi9MClryZ75c8OaHLzb5
	36Ndtc2zT3eyqZEL5eS7pnV4leNvpKVLrRrp4TKzga8wAoV9mkxVRA5lC4jI5Yi8U6XBSHWaSwd
	kC6zAkJMj3TEuAda1wYv5ZeDjy9CSKTxiTqbyPgOd12tIiK1zVYEopZBOXZ0Bt5Wl8lP1WPcWoj
	nCd98ciDWg5Z1O2EM8u3vTs4sqdzVVlsAphhSRCIrvii/F2nVkr4RrdIoBYr29Mv8TjFJbqGRIg
	RVFJpOw5l+5p30x50W5nXuO6Rj9uzH/3qQSmVd6Ng/0UGnWjdqm82B3LcC+VKjou3mhZUQ39xj4
	Q6wu6Y45+CsD+jbjd8CCxfR8k8rU58oCOEfobP0fjgREi+sdZ+Phgn+PkjIDuUKsY2xil7Jhym8
	1oPN2ss+11YbXWR
X-Google-Smtp-Source: AGHT+IGo1CVZwZ/FAWJme7Zy+9NRmnO4ycz8303KaODH2VEd772twsOxKeh/e9ysRmPRF1JNLoWrmg==
X-Received: by 2002:a05:600c:1381:b0:477:7a95:b971 with SMTP id 5b1f17b1804b1-477c01f55damr116622105e9.31.1763980121578;
        Mon, 24 Nov 2025 02:28:41 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1df334sm186753945e9.3.2025.11.24.02.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 02:28:41 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 2/7] can: rcar_canfd: Invert global vs. channel teardown
Date: Mon, 24 Nov 2025 10:28:27 +0000
Message-ID: <20251124102837.106973-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251124102837.106973-1-biju.das.jz@bp.renesas.com>
References: <20251124102837.106973-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geert Uytterhoeven <geert+renesas@glider.be>

Global state is initialized and torn down before per-channel state.
Invert the order to restore symmetry.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Vincent Mailhol <mailhol@kernel.org>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No Change.
v1->v2:
 * Collected tags.
---
 drivers/net/can/rcar/rcar_canfd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 6098a3eebc43..c03e8dff6a20 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -2224,14 +2224,14 @@ static void rcar_canfd_remove(struct platform_device *pdev)
 	struct rcar_canfd_global *gpriv = platform_get_drvdata(pdev);
 	u32 ch;
 
-	rcar_canfd_reset_controller(gpriv);
-	rcar_canfd_disable_global_interrupts(gpriv);
-
 	for_each_set_bit(ch, &gpriv->channels_mask, gpriv->info->max_channels) {
 		rcar_canfd_disable_channel_interrupts(gpriv->ch[ch]);
 		rcar_canfd_channel_remove(gpriv, ch);
 	}
 
+	rcar_canfd_disable_global_interrupts(gpriv);
+	rcar_canfd_reset_controller(gpriv);
+
 	/* Enter global sleep mode */
 	rcar_canfd_set_bit(gpriv->base, RCANFD_GCTR, RCANFD_GCTR_GSLPR);
 	clk_disable_unprepare(gpriv->clkp);
-- 
2.43.0


