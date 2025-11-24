Return-Path: <linux-renesas-soc+bounces-25060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDDBC7FE2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 11:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9C915345202
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 10:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23D72F83A7;
	Mon, 24 Nov 2025 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYAPVDiS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488662D0607
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980129; cv=none; b=ilJeaRk3aKQN92ltV4DTA7GUEJbAsT2l3XOOSUkNNaloHnDbKu6YeQNq6RSMzt5YlQOxRGcKsnMDskdGfeiT9W/LLR0NPO0FBZVnBeIoL06tzPCBkgStvZRtqoAaZcBHY6mpF1XOAO+wHEPNAIFpThzmZhVzDKw+wI59D4WV4jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980129; c=relaxed/simple;
	bh=25AN4XiGc6CZ1SMIZ0IBj9ec9hPtrhDC/hZ+f8Nm1lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LX7oAHfhrqU2FeRcv95RiOwxVmot7+9jr/jLxzsik92D82exSX8hthSizkI8njVLMFvQB6ZCO9cxZGpAn/Z4YBcgeQ3K1LK8SRtXN5vBTYxLC9bpZjH4imZ0qOtEil7DNnm19uL72hXlPrEi5P5y1ZNEJFoYGqqlMsyDnaeUKnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYAPVDiS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so42573375e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 02:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763980123; x=1764584923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VPGo5U/iXGFhSlRJsPXDRX32fruUCYMsM5nvll/4Kw=;
        b=nYAPVDiSTAIK+quKuIvU/mHI4U3/TKAogrZ3Upc+SzJSgIrHZNg5s1Q42FA/tovaDQ
         bQvpzZeszYW/Qrky3+43PaMtBaW/TfTAezz5DtsuYTTP/s4ajrnhbVr4EAFcgCc4OTFN
         lanpazHKpRh+8+5zj1Vl4it2GnsAj0OARnyFBdDpteWMLkXIKkWvegZTpd68wbg/A6vI
         DAg8DDjzJXaoafwxPbRBxUD5ttBNN0s9xIcl+V+dzQjX4LiEcE6RTyOGmIduytqXF1/S
         zhNaNrGSYifFAyGKDceCR1HvtVRNDc94g9KCelyeAvNcd0MybM8UhTl86ylYHbvPOZrB
         Aoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980123; x=1764584923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5VPGo5U/iXGFhSlRJsPXDRX32fruUCYMsM5nvll/4Kw=;
        b=syc/KEzPeIC0ljH2jeLgpHF11gLlUsKTOpnHhc/jFb/JAF6XLIVrNXcCDX4HD0MAir
         Ys6o/NY/XnNw6dJbN0Z6ZwgLWLZRLax5tlnbb7whXMPnbxKCgiJ3K7rIYpe2KqgowSpn
         Z57ktluEjhCak5t8cB3UlXa5iLuem+G/ibWBUG/+OdI4T/n5EuOuQ21iw0tbjaEzzL+b
         CvHUs8r7F7xkgEBBwNz40gNRpa9PfwZGW1i1ANUI/Xl0BzJU9Uc+w7aA61n13lbugq7d
         2AuCU/EyELHHxQLJmaa43wX43FJC3oU32ponQwbwyNOFB3rWat61iAYe2vpBvvjGnQet
         fdvA==
X-Forwarded-Encrypted: i=1; AJvYcCU/VbdSKLHxn7ThvtO6sMet55EnYZY9sHTFUg0P4gb/1Bk64cysRaYGs27LYhQXvwAqGClYRTUwvUmn8tIAXUkMNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Oug+OlRdWPUQWf2G0Lg1aqABgm4kGBRItCHOvAgHhiVinmgl
	CG5pl3Y7PLssJ5hHEJWbM877SicLsYysXLOuCb7nWIO9jh5wSqf+HeXQ
X-Gm-Gg: ASbGnctCr9j7/ME08QT6WYIJ/5JHE9FCua8d2DZGW1AV8p/L0b4tsDZc9CIrmDN5J3y
	ELYO+5HK9sQ8zmNzk5cDiI7hqbdP1kQvB3YG17oVHYzQXYmFXsG8EtS91W4fgALOPPevJmSmQdD
	JmkG8QcjUbWUT5VZzK/JJx1pw1jl17VMnjyW85BxN317JU4dW8vv7WBmBQLJlIOQh8UDGRbprkE
	+YYpfbhT/oySmglGZoHg5yhO6kis1GmjEdmi4izBTf2FulQVnYefUigf7TBLJJ4KbOy2nG/KtFT
	kSTc8zivi8yM/Mckrxesejy2sA8ZtohJ81nfg04zqOd+a6W2mX34UeZ7RgQ2bzm+bYt7iLUYXC+
	uOS2x9htoT/4lUvMbzBNb7fgXMomd6rdvsaActML7Fgdk8dvv46uNE8dzbl+pCr/hNYTt8N80A6
	FUIqpRwEtTZbZaCFQ9K8HHONna5VRA1YVo2XX7mVmTjo98iNctj0svvGalgTWHUWmm8qS9GpoSc
	o8tLNyNGTvs0V9X
X-Google-Smtp-Source: AGHT+IGPyNSAkUnNNLh90REio7RQidDo1QlxOrR1JlpAc2ox428h/ljqAzuZmEq2S0sQiaTFD1UHMA==
X-Received: by 2002:a05:600c:1c24:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-477c01be2b2mr148615015e9.16.1763980123429;
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
Subject: [PATCH v3 5/7] can: rcar_canfd: Invert CAN clock and close_candev() order
Date: Mon, 24 Nov 2025 10:28:30 +0000
Message-ID: <20251124102837.106973-6-biju.das.jz@bp.renesas.com>
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

The CAN clock is enabled before calling open_candev(), and disabled
before calling close_candev().  Invert the order of the latter, to
restore symmetry.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tag
---
 drivers/net/can/rcar/rcar_canfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index d77d28d0ca6b..2f9fc0da2d1b 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -1588,8 +1588,8 @@ static int rcar_canfd_close(struct net_device *ndev)
 	netif_stop_queue(ndev);
 	rcar_canfd_stop(ndev);
 	napi_disable(&priv->napi);
-	clk_disable_unprepare(gpriv->can_clk);
 	close_candev(ndev);
+	clk_disable_unprepare(gpriv->can_clk);
 	phy_power_off(priv->transceiver);
 	return 0;
 }
-- 
2.43.0


