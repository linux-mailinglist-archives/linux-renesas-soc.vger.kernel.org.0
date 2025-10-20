Return-Path: <linux-renesas-soc+bounces-23297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1EBEFBDB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 09:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B8284E68A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 07:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E632D9ED9;
	Mon, 20 Oct 2025 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aBPTLW5Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2696220E334
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760946828; cv=none; b=dwn84+ej7owxXVttUkySDQ32yB/ThYOPKVLouW1il8rdpVrXTuc6JUjxJRu7tAJ8NWuMqMxJXtTMn19vhyGIPmKc2319JE9pKlJrgz1I53pBoSfXNxfbdvb9uTqIxzuGSDLawfOpGXkzLPEugaWGO3AqCKvGlxEWIXfy2fim8i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760946828; c=relaxed/simple;
	bh=JwLO30rRjM9bQPjtjPEvj/O3H+X2OBrB2JLgzBxJfS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DkYJd97B9SHn3dQy1nL1cGWTmRYOpz5vw/D8k29EUeGNPRUEfDonG+u49GYjc8rHJnxlZNAhdcvHk/gQTKYxvqdgeZxdbHMUbAtQWCU94OnrPR+wdn+p5CvhZxz5vJtOm1ySGVY3yE+KK5ODQ/up0nLmG76/I3RqpA5Mr074gdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aBPTLW5Z; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso4670912e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 00:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760946824; x=1761551624; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EdH/aHJWX8AtmUkNQDRfe8AmPloc8JdVisE1GgEb4wk=;
        b=aBPTLW5ZpYvZ8vph1TDpEcmjZb2SpBoayOQtW4NyWelawnP0W5Oe4DLS7Nv8sLWLh1
         TRlcNohZgZCqdloHks76dI6AxC7XhUhVrz1SvHpV7jAbbyupnpGcusJQCSEXJspe1De3
         ayxIkx+DgwWgXl2RGSjHO6O1HG4VGNJVvvBe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760946824; x=1761551624;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdH/aHJWX8AtmUkNQDRfe8AmPloc8JdVisE1GgEb4wk=;
        b=L6gCXOoZCN+jGsUk5XJ26GuNGp5y5zriX5VjHRCVLSZkE2N6pA2dEot3+pvcZfNK7e
         F+CNOecbcO3X2CmavZH9+kZQ3d7nsMcB1HxLcgEDZOJ4aFq/MUhLa79O9PcBeVX8PAp9
         uH22cvXzC11mNPg7aXKTCbvYJfpzsAUi2OF4rr+9hIIht2UF2CT585q2UFMuAPewVruN
         73JhnT+XpUlpXy/2H/Z2j9fz16O13rLBTSmO1WUKmC9LrmK1/rKhOlgrYyvItnOkphCo
         LXG1u25Z+3EhxoRRz3iaADL0W/ehwNBPri1Xwp+neJUu64vf7zF+9Y8T2ETOwh0o8Q9U
         fYpA==
X-Forwarded-Encrypted: i=1; AJvYcCV71YdPZzGQlH56oJHrOw6Q3cKgBGHgImWfouUQPotjWRaQ631jbE6CWc6a4ScVKjR9V7JC0FRMyAvcRILCuM8/Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeaZ0W2lUEB8CVHR+7jVKA2M9N8iOKpQKK7n3oaUma6aj/KW5M
	BLvfnZqJO2yaKT8l6yd0+BXkBUIpYwDsVNb/s65hXnSr9tTciqSM9dsco8B4j3dPVw==
X-Gm-Gg: ASbGncvsekG9id2Hjx8aPlnbaPQyqll+dvyrJKLaiFiwvjF6IMLY9oreX6PF6BbSkYg
	RYqyFzURzbCRzOt61roHVEokZsftsupajWphWxJuPw5cBN3zAZWq5fZRO9dKiAJJvYLGc0sTwhs
	i5LDv8Gfr7451vZqjWh4/aYPi2adLeAADzaHjfVIYOu3fRURtFpRR7sWeliZ47lVpvCWhjsdXmG
	+xQnvjCw8bsUWlmnOa6I1nd5NtjdQwW5gJ9F4mWLrwPTwlxb5cvuygDdzHY8JEZrlixk0w0tRWR
	UqirbQEkso3mrmd2/8vL2OJQLwJNuWIJL9iEg/JiwjGRnpzr19etuzAs7qazYzXAe9U3/Ox/DFU
	KTx8QxfPNxY3H54SKixMxC0WR5jNB3aqEBYOU/vhcby9EbeEwQrWAshNF1anjtv0/eWTKraDf/S
	DVMQokNNIUaHzc8LktRVtziIH7hK1atSmyI0tel6mBGBBNBVH4q72utB2U61p1Onn4mg==
X-Google-Smtp-Source: AGHT+IELRftEatZGxbBt4UC4lC7RsQ14Oku0Jj8SWrZA72t9gBWlXbAP1Qxkh5MKzJIEp9Ob6+Dr8w==
X-Received: by 2002:a05:6512:31d3:b0:579:eda8:6086 with SMTP id 2adb3069b0e04-591d84eb765mr4937323e87.8.1760946824117;
        Mon, 20 Oct 2025 00:53:44 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def167e8sm2284492e87.65.2025.10.20.00.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:53:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 20 Oct 2025 07:53:41 +0000
Subject: [PATCH] media: renesas: fdp1: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-ptr_err-leftover-v1-1-150b0f8b46b9@chromium.org>
X-B4-Tracking: v=1; b=H4sIAITq9WgC/x3MWwqAIBBG4a3EPCeoUVFbiYgufzUQKaNEEO096
 fF7OOehAGEEarOHBBcHdmeCyTOa9/HcoHhJJqttabTVykcZIKIOrNFdEGWapp6KsYKuQCnzgpX
 vf9n17/sBuIJyhGIAAAA=
X-Change-ID: 20251020-ptr_err-leftover-1997b3a6e06e
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR()

This patch fixes this cocci report:
./platform/renesas/rcar_fdp1.c:2303:4-11: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
It seems that we missed this file from the original patchset.
https://lore.kernel.org/linux-media/20251013-ptr_err-v1-0-2c5efbd82952@chromium.org/
---
 drivers/media/platform/renesas/rcar_fdp1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index 3515601030eccefe3d979303893c93c85ab0a9b2..672869815f636de25ce08261bf327f156b617a37 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -2299,8 +2299,7 @@ static int fdp1_probe(struct platform_device *pdev)
 		fdp1->fcp = rcar_fcp_get(fcp_node);
 		of_node_put(fcp_node);
 		if (IS_ERR(fdp1->fcp)) {
-			dev_dbg(&pdev->dev, "FCP not found (%ld)\n",
-				PTR_ERR(fdp1->fcp));
+			dev_dbg(&pdev->dev, "FCP not found (%pe)\n", fdp1->fcp);
 			return PTR_ERR(fdp1->fcp);
 		}
 	}

---
base-commit: 8652359fc004cbadbf0e95692c1472caac6260c2
change-id: 20251020-ptr_err-leftover-1997b3a6e06e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


