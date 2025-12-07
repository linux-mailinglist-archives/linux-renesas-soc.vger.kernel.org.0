Return-Path: <linux-renesas-soc+bounces-25633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 369ABCAB4E0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 07 Dec 2025 13:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6C4C30572D8
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Dec 2025 12:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF76B2EA72A;
	Sun,  7 Dec 2025 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwZRHrBA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2496028726D
	for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Dec 2025 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765111759; cv=none; b=Znwne9dfh4Rgkl2uQdoRxacGI26kLaXpuI6QVd68iHn7KHalwTdSMXRrwTSD2JnLpeRyLpwPvX/3CdvciC5A/mFtBOcgFrwaWdcwWna+rZBdIi/iHbKd+la9RE9ZbBde8l5hkcJ0BJpfq99Dm+RQozSokOM8SIid9Iw0DhKBiIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765111759; c=relaxed/simple;
	bh=Lot9yyrysMIoFKrFBRyHq7ofMZNCgMG6b0MvoWmbSp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7mMOIDvgWMURDFi2diTTgzvBSeCHlz7LxwwhYDjjZn2EXBsXQ0xtvcUrhnmLz1T27woAH8NbR86xp3qDmMUSWbRCWHg+gQfwBhKcW/YgRY6krHGIdry4JwLLuypMWOQsbu4X6IbDVgFQ1xkK5ZddLLH7JZjCcIWt/rKIUcwSZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwZRHrBA; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b735e278fa1so608462366b.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 07 Dec 2025 04:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765111756; x=1765716556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iuw7MrNQpJ+liSkmkNaHY/c1VIRpuVgXZGRp2BUwU38=;
        b=BwZRHrBAZQ83JDV7Kqz5xfSF9eetL784lWA6BWjV+BhGR9ijthN2YNU+VOBR6/XL3T
         txMdI9AM3bTPBM5hrCSZS+RFNKNHqtFQ6JfDFZpRmP/irR5Wffv26/0xR8sk8Mr4o3Jg
         +4kMkXrIkB7uGWInp2H4w8zh7UzH6HzDzy/oKmKN/q2gPJofVxcglZecHXaiUdfNmvhp
         evPT00Kk2wFSdngrd45etEWYhGOYIPOHn1O7WCA6J/GXmaMs/ccjT3KKh35zOqpn9LMI
         5BYdjn32FsZsDQq/TBSCs0Vm7Ofgyq1+thQ5YLotxUWF8aVT82tbTOj6J8PVK/gmAgun
         yvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765111756; x=1765716556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iuw7MrNQpJ+liSkmkNaHY/c1VIRpuVgXZGRp2BUwU38=;
        b=UB+3IKOhmxAb0PbCD2QUDZyU9Hp7G8hK6i8y20QwzOTJNy0Nsr67Q/0x5t7c4cG/wU
         2TKCKt0SPIrXyh9Mj+Tmh12sov0rGdzHxrO/CSTeR01J1gBmqaWAzaF5P0gBEtpW0yoA
         LRsqW1tgTnxj3vZwDNB/HLPQRzdDluWt+wqSXFd+LkQMMLn5K0mEXs/ziHf09wVEVvWA
         Q/1E6UmsG2c+QE8B/hwhtr1ouBL84ABx5cTaiZb/DRo/E9nJqEeV0nDOcVcyvjpS9kgH
         g1R38Gx2NnykgGRSC/l5SOozN6iRaAldLvi7PAIToftVN+6SZH/kpD1Dw9QRjhNJp4Pp
         ciyw==
X-Forwarded-Encrypted: i=1; AJvYcCXfW5v8TL5FaImT9a0Xiy7wo3x2Y99v/4r2QhCz6guzdLEstJzITgKpNnNAKRZ1vbydpRLq5hsvH0Cm/nR7Bj3RAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBCezoG2iBKrhGhKU9PVtS0kDM9EfCf/b5qBB64p1UfAoxhmCe
	yPbmWFxZ/e6YkNLKQdyGnBoy76ebPJsGlXw7ULuxtEmnaFaxHwFDVKyH
X-Gm-Gg: ASbGncuCbEGikXZ+jyvopp32JLwJviV1bcKjoWQZr5uPLiwiDX120oVb8VUdUqG6qmR
	FV0UTlGFJa8Se+uBqO4KaRIwr/vOGQh8eYssnHuiYZOgS/rWNPihxwxzukVn4mQEbmLAxU49jDN
	T0DWlOugNHyA7dcZSwI1IJk/dKSpHqBJoFpq72tgNzAqskJ9EUs1aBtBDjAKR8zfyx0aHk70Uuz
	oRp3g7aSyIlVESSXnT2qVA3yiPbR2cHVK8yuxmnkLRsTsgyyfziYw1lBZQ2l6QjrRtZDmdwROEa
	J7g/UGiUAeS6BQXh4TXK7Z/g8t5le/QDKejwazXktHkp00rfe9hYeOC9VaSJxSZXdBhozbqMAum
	X1eeVwWAqRi7iIoDIaRtxTArNPuVv85XqCA9IknXFG69i8TyoT7Q03e+qYNXW/OuNlDg9mtZ/Y5
	ky5dPmqaLAgWRAsARFTVAnWqKvhsVqsA5oWp97296qgb10c0IERukXS51Ip3CV2w0bjuLI1/kRJ
	zOiVKpZdsfbyywa
X-Google-Smtp-Source: AGHT+IHLzMKabsop3+vKMOfNa/2/F5jDp+SeGjf8fqwP0dHCFJSa+7kOwDVwH52EYDKJMBc3IQm3QQ==
X-Received: by 2002:a17:907:d8b:b0:b76:23df:c993 with SMTP id a640c23a62f3a-b7a2481dccdmr511981766b.56.1765111756345;
        Sun, 07 Dec 2025 04:49:16 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445967fsm848078366b.10.2025.12.07.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 04:49:16 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] usb: host: ehci-platform: Drop ehci_resume from ehci_platform_suspend()
Date: Sun,  7 Dec 2025 12:47:26 +0000
Message-ID: <20251207124742.96526-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
References: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

As per the suspend_devices_and_enter(), if .suspend() fails, it invoke the
.resume() callback. Currently ehci_resume() is called in 2 times if the
reset_control_assert fails in ehci_platform_suspend(). Drop the duplicate
ehci_resume() from ehci_platform_suspend() callback, as it is called
later from ehci_platform_resume() callback.

Also, drop the other duplicate callbacks pdata->power_on() and
quirk_poll_init().

Fixes: c31a401fe7ab ("usb: host: ehci-platform: Call reset assert/deassert on suspend/resume")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/host/ehci-platform.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index f61f095cedab..253405efe50e 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -454,18 +454,7 @@ static int __maybe_unused ehci_platform_suspend(struct device *dev)
 	if (pdata->power_suspend)
 		pdata->power_suspend(pdev);
 
-	ret = reset_control_assert(priv->rsts);
-	if (ret) {
-		if (pdata->power_on)
-			pdata->power_on(pdev);
-
-		ehci_resume(hcd, false);
-
-		if (priv->quirk_poll)
-			quirk_poll_init(priv);
-	}
-
-	return ret;
+	return reset_control_assert(priv->rsts);
 }
 
 static int __maybe_unused ehci_platform_resume(struct device *dev)
-- 
2.43.0


