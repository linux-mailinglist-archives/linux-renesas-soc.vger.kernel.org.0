Return-Path: <linux-renesas-soc+bounces-13369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1320CA3C48B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 17:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC7393BBAAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 16:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96051FF7CF;
	Wed, 19 Feb 2025 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="K+pTgZIm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A21FF1C9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981287; cv=none; b=s3Vd2//27Nje2QYUJdBVvDbMqtMCcL9qIuELNQS7wucHj/+3L6ge7r90B9RuihwAIGZEqC1DJu7UB0G/oWi+ZA6YCs7aYpJ5xXkXxJl2GwSwv8BjiBQ9mjVrwP+gHiIj3wUV1b4f852ICfsGnigiATImD+MhRmMQdmKBwx40bg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981287; c=relaxed/simple;
	bh=LCck8XOmhlRfZGYdLsspO9mn2Js7FYYo/njobjx69Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/xBOPf3z2D/vnDKPqAzimXd8aEw10ZDdw2oxTozbdPEh11fZHjy88jAKPePJwyrA1KKjy8ZUjZD6lMJcKTeq3DmJibXXqh7gQVjf8278+qMTmlcXeG+RlGyFrPpkCeTfT7omZrIWn2NMm7TlZP4Bb1HAib+c8s3zvnFi7C6jVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=K+pTgZIm; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso1061609566b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 08:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981284; x=1740586084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQx5Obkxi7fOoCAjVu48dboJVNwAQ7ZZpMFYowfx0L4=;
        b=K+pTgZImwgpkYfDotOZYk/NkIuq2NByOssW7AWpDG2EkaLYN1nP8HvZ/jbNLAU78uj
         /nV8DCbswwktKNrxAX/aO/61oE3NimNyXM756BKG80MGQMLJfsBiql2tcvanqcqrHqSe
         n4kIgciNl2IsKt5DxUR054jI5prP3C4j3RWvO2SCh80KRG31Hq3unFSDDWkwJ9xOw2tl
         TIPkUlflWx8THpyo7yfuASl0jg21K2Nu1uHF+NMOowcSeUZ9WgomP0+exX07UxPuhEtU
         /gyoCroFh+6h9Fag71Er3Ev+g5nV79oULKEp2T3BoakK6RcAtzUyziNPcdldnRuO2rhC
         XpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981284; x=1740586084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQx5Obkxi7fOoCAjVu48dboJVNwAQ7ZZpMFYowfx0L4=;
        b=UxdAbVyeUcJlkOgwdtIf2dIG0wnLWRyxy8Z+2zR4Kd927g/D2Tz18/02XiIy9CJRzD
         B9W8peLNzfPj81mu4v1t2jo/liso/g75TBKDZENMGe+hNycDTmCC/32czxJFFZvMxO7Q
         MSORGbmBydMLSYQo+H6uGWYWQL643fITdF7L22y+nBlQsryXuPK54EjzOBIx34319Dgk
         bDR1gLMIIOGqryBkrF2QaJxNnAckemjc6UMxyrouXHtGoOQ9c36Uy/WCCDSmymGcbvGz
         1mEbjUY1GGiGdAUW7a4CdZdhRHfqE9VrpaVu4hofulHQjtOINDkjxYsWhfa8qbvd2gmG
         H7Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXzfkZIHTXJwZ9zul9cJQFzFBoQ/YDD+inOkFbOmGmU3f8eLDc1MYPuRrmzzD9je5YZoultyt9blH8qe+YnK0BXVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs1cuM3K2GJkMfCJf1I1OhWfcEB9UnAxvxlkzMOhmd5yER69QD
	ROVRR0GKHV4qcjhtLKSg6CQu3g6sKo/8nPTOKrNeM5F7rMFBC7lu/ooRtXAitbk=
X-Gm-Gg: ASbGncvisnCD6jNv2B0Ds4TVnouep/S1N63oxanXMTtjxhrPkaGtPt+sGZ+OOYtRrUA
	NDaJM6fBGHy7zTVn0wbLjrpbMwk1fBpxrcMCyYU2WdvWiqEZj8PaJ1rydB/2BqMdTAWcTYuMxn4
	+OxHLPV0l0qe95HtkL1gWQDdX4Cig5YhFxrCQ0zL8d/pYzRwwEJenbxYquVIAZ8W742HuWzSQ0J
	m5BPnwPoBqBZY9TWSnnP7inRMlgvjhHVJXl6biLyMwiQJ7Z1nIvJa0Phl7jCVas5t+F8oyn1eIi
	Y28Ch8dGmRIP0VDmCq8HjEhceSlIYvBrAfvPDOPFVsYx
X-Google-Smtp-Source: AGHT+IEyYVLE9+celNxGo86663B2wzUsZfpExbxct9DCQIl++bGSTCDjXotnzuNdpB6wYwo2U02c/A==
X-Received: by 2002:a17:907:34c7:b0:abb:cdca:1c08 with SMTP id a640c23a62f3a-abbcdca498fmr312301666b.16.1739981283761;
        Wed, 19 Feb 2025 08:08:03 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbc0d0b882sm327791066b.109.2025.02.19.08.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:08:03 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	horms+renesas@verge.net.au,
	fabrizio.castro@bp.renesas.com,
	robh@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH RFT 4/5] phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
Date: Wed, 19 Feb 2025 18:07:47 +0200
Message-ID: <20250219160749.1750797-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Assert PLL reset on PHY power off. This saves power.

Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 5c0ceba09b67..087937407b0b 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -537,9 +537,16 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 	struct rcar_gen3_chan *channel = rphy->ch;
 	int ret = 0;
 
-	scoped_guard(spinlock_irqsave, &channel->lock)
+	scoped_guard(spinlock_irqsave, &channel->lock) {
 		rphy->powered = false;
 
+		if (rcar_gen3_are_all_rphys_power_off(channel)) {
+			u32 val = readl(channel->base + USB2_USBCTR);
+			val |= USB2_USBCTR_PLL_RST;
+			writel(val, channel->base + USB2_USBCTR);
+		}
+	}
+
 	if (channel->vbus)
 		ret = regulator_disable(channel->vbus);
 
-- 
2.43.0


