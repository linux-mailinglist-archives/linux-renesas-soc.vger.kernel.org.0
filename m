Return-Path: <linux-renesas-soc+bounces-25061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 515ACC7FE3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 11:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 753B04E4618
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 10:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B979E2FB98D;
	Mon, 24 Nov 2025 10:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwwBmrvi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A222F9DBB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980130; cv=none; b=Fm/AsHdwC96l1H5L5Ou2JlQQ2XOYNbeMqWmilUMsvMxAYVaow9xdVciVS73YhDpCI9ZEYhkzleaS38zTzBzhj5BzQG3N7/GsQuPabrC0nkMeAeVPqF/kghE1++m20LpRAl8SADZi3f2JUOVBRX9+mlLHPnfYsgJ5MATAN6iHinY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980130; c=relaxed/simple;
	bh=MJ5gYOX4/WcZI3eabrqFVQV/8C6AUWEV0t0d36GwW5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gN0fknfBVHW1eat+jIhdpA9BhLllF2StTD4PyHjj1x8++QnAlSJDYHrUvY/XQfLvs1Hy4BYPt3UjQiG8bLiep6o+Kphxv9AtXHF98YN0yOGgAOz3+g3VO1nuLDjTsp4jgHxKDex/GJUcn7yRHlPXUbLzNBFRixPnCmH6daTo6aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwwBmrvi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47790b080e4so21463495e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 02:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763980124; x=1764584924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaxoPDHavjWhtTvtGHvHHl1fcP0q24V4vL23BhFFsug=;
        b=UwwBmrviub7Pwx5Mkb7gT07KdZu0676JdODSK3bl6g0L8xq99VJ6hoj7iJCYFQYGA/
         c9cHeXIkIkf5XhFHCifw+4ec+mbH74DSE6Bfk4fSlYaSBSn611aXPBb11QozM8qkrCqY
         CzIOUk1MaRzex2yM5bAaVXWXYeAfMg5friS+mqOfV2VquWCUmpu94CsSQn2mxhkQNaw+
         kXBjlzfDEwscyoaMsTeGSoKLVQNfFdEg6RopX2aWNR6V0zyhi2AgA91AKtNMgYEESzmy
         Y8gD2b448q6eCW6o40iWnUhwBaFwrlJ0ixv8/WPusQmNWHsdJzaRMQ5wA6YXrPI0cSg5
         KRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980124; x=1764584924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KaxoPDHavjWhtTvtGHvHHl1fcP0q24V4vL23BhFFsug=;
        b=U/0I8NeQ0oG/C3ipVE9VpFtI4e5zFMXFhxVfWtTM5/vhbDt0hsirsHuuR8bEfATFa/
         dGjalhbpZ+RGJCDlJxdZZV6UjGipuTsWmKwD6c2Y2uF+bzrd18254+3WsbnXa7mpEVmY
         xYlRdMEg+x786wc4FLPBeMUZ8OgS/mkSYyqbgNf91rtOPCmPjjD5zVOLO1nLxzYB2owY
         hxVD8Ps7dG0pNECjBQSAMh16NlR+0GPBBtAqDalw9zDG+O82Ty2BfXl9D4WgU1+T8G92
         jTGzsKKbUEJEmzm82eVj0VR4bKqxPt25h/L4cYjrtd3d+mpWNRRrUpHScy5WFSmHXURh
         /voA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Fb8HDlhPUA1OFVHYT4JtMwtf+R6HdRjL9Q7Itv3/HncGx1nGnkmTiB+yum5YeC51OpDYGYtSr+pqvnDs1ARq+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAqdcZRzmHG7bt+Jcw3YVYN5mc2nWPnQG7TXz/G/qevDo8JQ2F
	W8GhaNX+xbj8RO4a7A5+kchEGBYOwjIRCtcLD/iNDT1Nssufrxi9DbQ1
X-Gm-Gg: ASbGnctLHkHf11s408pLu2G90SG0iLsjyd3oLgidZHxhK+4In2mNtdDYfz5h3kQp1ER
	7ZPRxwMh+MD8IIaUidjxDQSiPBKTLzpx9H2RGZyshNwcVeG7lvCGWeFRJRzl0U42u7UR1vuOonh
	pvcjuwceyTbv/BIakzy3M7HyMb28xrpNFe8mYKNue8n/PFsFawShSyuTzRaiiMs+A4tvn9waBRi
	XxFg+StoLA7knGQpi9Bd9ceqVPV/ZnYspCJ3TbS3IZ/zhqmo4n06+i7K0A0qlKS0xM2LUiRNpi5
	AVk4JBtRGDMErIdfUjRrGocuJoJX3xSJF1IKCqsCuIgvAvOxq01eYibK7YzsefqhpjJomLhgUtC
	3+4FNhU7nMVpBfKYMrjKR0H07EFnFtTt16NW9iCq7NrM9sHbvDWNARxflJwRN48duiS8UxJCI44
	6B55H41Jf6NO/XBH4eCdMMXPx7CNMRu2OwIgAJqIIIN5twtAS4zyhOZPzEcwdW4pgd2OrZrWjvf
	9LS4F4Af8EGfNHP
X-Google-Smtp-Source: AGHT+IFGYmmA5I+q48xhFRnBZgtFL8YUq7RRbEwg6+SSHoGjRa2xnWW7REXItQXxBXjBwZlC1Valyg==
X-Received: by 2002:a05:600c:354d:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-477c10d7003mr105934785e9.11.1763980123997;
        Mon, 24 Nov 2025 02:28:43 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1df334sm186753945e9.3.2025.11.24.02.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 02:28:43 -0800 (PST)
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
Subject: [PATCH v3 6/7] can: rcar_canfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Mon, 24 Nov 2025 10:28:31 +0000
Message-ID: <20251124102837.106973-7-biju.das.jz@bp.renesas.com>
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

Convert the Renesas R-Car CAN-FD driver from SIMPLE_DEV_PM_OPS() to
DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
__maybe_unused annotations from its suspend and resume callbacks, and
reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/net/can/rcar/rcar_canfd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 2f9fc0da2d1b..5a555b01ffbb 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -2276,18 +2276,18 @@ static void rcar_canfd_remove(struct platform_device *pdev)
 	rcar_canfd_global_deinit(gpriv, true);
 }
 
-static int __maybe_unused rcar_canfd_suspend(struct device *dev)
+static int rcar_canfd_suspend(struct device *dev)
 {
 	return 0;
 }
 
-static int __maybe_unused rcar_canfd_resume(struct device *dev)
+static int rcar_canfd_resume(struct device *dev)
 {
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(rcar_canfd_pm_ops, rcar_canfd_suspend,
-			 rcar_canfd_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rcar_canfd_pm_ops, rcar_canfd_suspend,
+				rcar_canfd_resume);
 
 static const __maybe_unused struct of_device_id rcar_canfd_of_table[] = {
 	{ .compatible = "renesas,r8a779a0-canfd", .data = &rcar_gen4_hw_info },
@@ -2304,7 +2304,7 @@ static struct platform_driver rcar_canfd_driver = {
 	.driver = {
 		.name = RCANFD_DRV_NAME,
 		.of_match_table = of_match_ptr(rcar_canfd_of_table),
-		.pm = &rcar_canfd_pm_ops,
+		.pm = pm_sleep_ptr(&rcar_canfd_pm_ops),
 	},
 	.probe = rcar_canfd_probe,
 	.remove = rcar_canfd_remove,
-- 
2.43.0


