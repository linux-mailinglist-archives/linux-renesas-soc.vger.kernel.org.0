Return-Path: <linux-renesas-soc+bounces-4139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D73488F84A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Mar 2024 07:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DE18B2229D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Mar 2024 06:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F8051C28;
	Thu, 28 Mar 2024 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hDEOC+qn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D175025E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Mar 2024 06:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711609066; cv=none; b=itc9IeC4jAVtM4Di3WpJR/s2HO0icYcf90k0J3QkfsqWPBz9sQsstZpfbmriE0blpQRP9aypEUT7P9NvQQEF1zL1+wZq6WG+xnnPQydHyQnJhniEIzhybWU9auNf0iP0Qy3CerjWJV1CCn8fY1l9b2Nk8fcvX6Q1MB7ZH/LPDrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711609066; c=relaxed/simple;
	bh=qR1m9hbmlW7+12ibGcrXPUb4ZqP08sqW5HjjwOxTypI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LaQjFhL4zvLm2T3i4viT91fga0EInt7gGzgi+at95j217bH9+YNCNtmr7ZUrbXGUBGhk/N3zYv3oCAPKasPaIB8z5FVkWpi/uf6ZlmZudUbEiymvrqmLv18S5QD+u1AjAtVqtrlGt58TYt+sDDttURcqhnu2o4AFMKtGYOAuJSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hDEOC+qn; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a472f8c6a55so71174666b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1711609061; x=1712213861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMvChhJcPSt4eZl6/6ggN3x/VQH5SjZDzlWs7QuXFgE=;
        b=hDEOC+qnnXmeK1tuDgvOyhpPpQc8HK1FMaICzmolFa0HYlvb7kUa49VOF2xqNDK3vc
         5KXljISkSpkkpxJh/Wa6L1XZgMmMe2v7+KfppQnYgahHWO5+k5Axq6iBvgn38FpmVSHw
         ElK5InW6SLfrmti3NKbyntvMeZbbRLGrUdigtJszxfR3lB50KlsMWrgq0Xlp3b6sFkxY
         50rrZTkMU70f6ALnkHdwu8sG4q5EKL41n98IPUJaB/9o8TLbino/DamBo2YV/nl54Fkw
         EFEskfUpxmSFNw67e5mh8LzcdAos+vh6pYJ4R9fTBRcF+QerGZdYD3Mr0n8DP0OvM+Q6
         26MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711609061; x=1712213861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMvChhJcPSt4eZl6/6ggN3x/VQH5SjZDzlWs7QuXFgE=;
        b=ixfLWMoSpj1jG7g2ROoYDTzkeTME2pbs2KlyZ2ENmpC5dvydHwCYcAVOK5bIeyij37
         1oi+BjFKzqbVXmUunF4M66qh5SSYSYzrjyxUideqoOup2UPSwcZFzLOpORrl2mlCa66i
         62xTkYv4P0/7sTLR84zK2o762D/WdWz3HRiKWoVMKufI+4g8c0v7LEueCYZZbjtSmVuU
         KJDQPf9C5g/fxIt+Kp6fX1s9R8UY/0YACNYzjFpvVeQScWJQlxWIqfvZ69UHiPRBVLWr
         1o6A2/Xa6yhv14ToZM//cMLUPzjVBEjLFzSiZBb9qZGLmVugYv16ZKqnP3qEdpv12JNW
         mv/A==
X-Gm-Message-State: AOJu0Yws+ypTq4Qy8RwopNpxhNlSJsi2/LcZS+Lamg9d+trEhRNQSJ8M
	zynJ93AUJo/9B9JCy2AL1IgXPy4o7U3HSbINFWcyL6ffRSV6TjbIQEW76Oxjfv4=
X-Google-Smtp-Source: AGHT+IFxrlOO24VAGCgN9I0511kf4TSr1Z4bbqe8hJjM89ZDd2fn4PPdyqrlZBfEweumZyCdAn2SnA==
X-Received: by 2002:a17:907:1b1e:b0:a46:6623:6938 with SMTP id mp30-20020a1709071b1e00b00a4666236938mr1341072ejc.50.1711609061415;
        Wed, 27 Mar 2024 23:57:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id re26-20020a170906d8da00b00a474ef94fddsm393751ejb.70.2024.03.27.23.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 23:57:41 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev
Subject: [PATCH] arm64: dts: renesas: rzg3s-smarc-som: Fix ethernet aliases
Date: Thu, 28 Mar 2024 08:57:38 +0200
Message-Id: <20240328065738.3049316-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Fix typo in ethernet aliases. U-Boot uses ethernetX (X={0, 1, ..., N})
aliases to update the DTB of Linux with MAC addresses. The ethernetX or
ethX aliases are not used in Linux by ravb_driver.

Fixes: 932ff0c802c6 ("arm64: dts: renesas: rzg3s-smarc-som: Enable the Ethernet interfaces")
Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index acac4666ae59..1f87150a2e0a 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -36,8 +36,8 @@ aliases {
 #if SW_CONFIG3 == SW_OFF
 		mmc2 = &sdhi2;
 #else
-		eth0 = &eth0;
-		eth1 = &eth1;
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 #endif
 	};
 
-- 
2.39.2


