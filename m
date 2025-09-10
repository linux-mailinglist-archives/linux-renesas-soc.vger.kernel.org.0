Return-Path: <linux-renesas-soc+bounces-21741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDEAB5226E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 22:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DAE21C85A45
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 20:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719412FB620;
	Wed, 10 Sep 2025 20:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+ZOs0Pl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955302F616D;
	Wed, 10 Sep 2025 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757536903; cv=none; b=i9ATAXW24LWcgy+AyZOmETdJ51I+SKNjccJXO5zi0MSdV+uwI1o/KKMm/fJ5MInoPSxlP8na7dXlSw6gpVGbpRYpAmBuYQnGvxaq3iVnBkOX2B6So1z3TeIAZtd+t+DpmH4bM5VlKu2+1xHR+2mjP5pOG5tW0HBOS2a3RNo2Dh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757536903; c=relaxed/simple;
	bh=IgdI3zQF7t5vCK0OLmrTJTuIY/g/Bv3x1rgNVSzTYsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSAWJfydK/5NwzUBrZzisyxkdoj9GDdL4uD0bB0SNTmxosBAK5qW2A8qp+Q4+Xjgr0+ws+GGFAbHh4MS6+ZUlv6CfdnFgjZAASOCG/NRn6JHEirbGMvQ0R/e0kFxQxINJ6KnwtwplmldFiFLlDY8L/4qr3wacSynzz7/JFYeqHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+ZOs0Pl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so178985e9.3;
        Wed, 10 Sep 2025 13:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757536900; x=1758141700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7O8PaYUEzAUlneMoS9hFh3YoIvoxuL8cMSmhF+LUVs=;
        b=m+ZOs0PlIbQNvdmMICe6vMCRz4EdLyZgaJf/V76IsokYwDbDGJa6WNEy7451fxBEE+
         ziW73yVTmLs/+E1lvlOdeOlyCX9UVrK/BHTbeUsKRHdNcD9xOJhjC6LlFu3gA9AAn1ez
         9W+JlBobMjNPQcHmu8Du1uYUvWwOMvAOVA++upHbt1AffSe6iI2VjqujgSCLYp594wgy
         N11MXWdsYGUIAycnqG63jD1n/DiE7XAturD0mXLiRYZGVH0IsdQPuxObw4V61xufV3jY
         STI+Mi5qoGxTRhxSVkjQzvpZRx1jpWYBd7IEHuATaeZpZwbkWLcJvyFo5e1ZnFcgd+4u
         RdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757536900; x=1758141700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7O8PaYUEzAUlneMoS9hFh3YoIvoxuL8cMSmhF+LUVs=;
        b=VOpJw+L3ntz9mkecaLd/16b2e/P0iQkPd6iHdmoAMDJGJY/hvvvwPvZdqpF9zk8qcL
         EL/QNGw7u+O/HboJRcbI3PnM92OYipH42tN1Q7S0MHSTgeYTJPkZakBiTBrft8XvJ+A6
         oRS+zSG1cKEJeAv+45Eu4MkydcVAh+jaA9AeMT9y5FSjXv96ZZ1nYQLTehQIyZTuqSDi
         O+lU5LFqCqyQfpLGJrQthJO6M59mLFlS56qlAmto2tqBZiK0lJurU2lHQLnTc/x4/ldx
         6Xw2zK6T58NZndBHxXbeY3svpKqpRhgU5A+c+U7hM9jJBCVaveRpHVsjTAqd1QqweS/f
         mCvA==
X-Forwarded-Encrypted: i=1; AJvYcCV0IqK4hMmFsoTe92HKIXX1X7jmEYLHOVgxRAQ3eTnGyX2q/M7nkE5TwVWThcz1P2es6VoUBpFA@vger.kernel.org, AJvYcCWvZQkGftaDlsjpxgpN2LNF2hymtOWIERoe48gShMecZ/pB6lvsaFWqL9THI+FmLA8TCrtCDWE4aL/G@vger.kernel.org, AJvYcCXt5kOSIS5SulpGC3zQTGs5XyPNFVkboBQh/wBYMz5ooW90eBYf4D9IsXXvMfvJbp0MwkiwBxyvZOLg73C7@vger.kernel.org
X-Gm-Message-State: AOJu0YzzvZpyCOLSKw88+tLWob7B6UleMVOq+tVek0uTR0LOQJeQNiJF
	aApHZ6i2WEn4NNVU1gS+nWJHgnN6GQaO2IKr16wUcKTY1i4pkre8sZPY
X-Gm-Gg: ASbGnctxzEso784F8LUmK6k8u/C9xSODD9dBwOaJLHjH+YSQvdG+mRQDb7E+ioIs4az
	WCLdIJpbMbRbjjj/6h+iZmviC/TsTIXg/+5TBvmAg6jookauq71bUNinmTsTH41GaZ4YtnjJSic
	PvxV3qJPYTtqFPryf3UG4tq3ejAqto+Og4L9txZDpMlA3/6UHV5BBJmF/ifT7qtHpxKL1KwMguR
	W0KRmLj87NMsUf18v1Um/Wac9hmTFTttMl3dc352+BOrhb4RRtSyZzJKlN6eG1Ey+58yzp4a/cA
	9IRi8EtxFUlr4M0ncOeDGPAEJJe7okT0qBvbC0jozahu1DCoX6+17+RlvgvmAB9ImxzLLE8Hu5Y
	VJtOSvSTSvL7/MVnnHEsKkWHDCLcbSzF7AOqnADJxaQu1k1hpIyotyizffw==
X-Google-Smtp-Source: AGHT+IENERjWnyqe4TVEEvb1jJkXyYh1zzuxJsmDV+s3Aq298G7VhfdR53CBa1N3J5/SHN7t6HpWnQ==
X-Received: by 2002:a05:600c:1c17:b0:458:a992:6f1e with SMTP id 5b1f17b1804b1-45dfc84f16bmr12145135e9.5.1757536898972;
        Wed, 10 Sep 2025 13:41:38 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ee64:b92b:f8fd:6cd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157d68esm320085e9.6.2025.09.10.13.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 13:41:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v3 2/9] net: pcs: rzn1-miic: Drop trailing comma from of_device_id table
Date: Wed, 10 Sep 2025 21:41:23 +0100
Message-ID: <20250910204132.319975-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the trailing comma after the sentinel entry in the
of_device_id match table.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- Added Reviewed-by and Tested-by tags.

v1->v2:
- No change.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index ce73d9474d5b..c1bd7cd58478 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -529,7 +529,7 @@ static void miic_remove(struct platform_device *pdev)
 
 static const struct of_device_id miic_of_mtable[] = {
 	{ .compatible = "renesas,rzn1-miic" },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, miic_of_mtable);
 
-- 
2.51.0


