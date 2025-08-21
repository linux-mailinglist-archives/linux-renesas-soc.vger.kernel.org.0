Return-Path: <linux-renesas-soc+bounces-20873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7206CB2FF7B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 18:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95B22B62071
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 15:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC63258EE1;
	Thu, 21 Aug 2025 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDSaR29v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0677E265606;
	Thu, 21 Aug 2025 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755792006; cv=none; b=YlNgdr+pKQ13C4dMEW3BbH7iVZ62u9GWiywZm3oXToAd5x2ILiGti1g50fdHdLXg251tqwVdyjnv5IjGyarNFynx89Y2GwUBnza+oMUcfR4/Z024FP1NXlOSpzRKIGDZFZPk+BTWtZ4j5u+lfIzaPbT7tNk0rdYmAWkJhwuyo48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755792006; c=relaxed/simple;
	bh=xqGoxNFBBMbyLbqhIVVRrWHuQlmJR1CkapbW+dwAqso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rmAlISRrnkG0dtplyr162S6hhxavw+j9CCW31AqE0zDBb3XU3sgPa6+B1uD97cDX+bzxJcLP4/vWFnSem40i2F9mmQ8wOhIg77fQeE8W6RQpH4l/rzmisK+5B9DERUy35FGU9Kw5wWblAzDaNePQc2esW7plRA6AZBethQf0u2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDSaR29v; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0c52f3so7255215e9.3;
        Thu, 21 Aug 2025 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755792003; x=1756396803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+uRhDEatB5agjNveDNa8WPfez/o3bp8wW0q2C4oGTl4=;
        b=WDSaR29vB7Ry38j//d/WQDB+MDBPkbxKux2Q/mjhQFEHuIojkytD7M9zJuUTOHAbwV
         fHcFGnWpZkTVtj+3X3bDgYGVFDWNgbV7Nrfeo//vbsl9rlzS5y63Qef7DFSr+XpeLhNQ
         mHtxP8uSAIpZ/Rbx8klkHIIcEmHcGmEYBsA9/JAzpyq2wm4zButPkVSQ/OfS/NSS8d9d
         Q93OkbMW4+H5OYqLXcZHR66aICFq72eSug9tdkckOt8d99ghdjCWIFGl9CRoYXFEQ70U
         VYIonYyC5LflZ85RVfV0wRhi1jrrltXo6/+zGzBpKoI3+HOc8U4PBTqDzUkT/ZBKmjAc
         oUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755792003; x=1756396803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uRhDEatB5agjNveDNa8WPfez/o3bp8wW0q2C4oGTl4=;
        b=M0pyv3IYAf55h3sGTfacnhiFH5rlcfczKDDUwMKkkb84GJL0QW5/OCHiK6oC6xtu+c
         QEgK6eFphUqB5IdFwbpfwlB6NKrTZO4zp1EAvANJqANQuBtegD7cy19lYp8YIPta508v
         LlankAU9SqIkgwqO4aqaE30JKLUbCocmDi1Ap/RchV6amAAnmyw0rlN0BMdEWKv/u10H
         CkypGmhw11/LWO9UiHMH8J2R7hHmVpbPOln8s2rLif+/AcnkuR84LSOJlZCu5eNpUr+p
         8Gon0im4nQdCHS0nhYMV5hXSPZ2WJjDi9Mlo4XtBwkqU+Q+AGY3WldHQ04qN8U6YL4ht
         FD9w==
X-Forwarded-Encrypted: i=1; AJvYcCXgi0cQ/rIjh8ObMmxr4wHDPz7eVEHb8ND+FOoYSPz8HyeixEOygD+473lOVZaWKLdL/sW8kpNr0qKzoWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsrVO8dcfJScxrU0Zic1MVgCepMpzRQG/noHg1pIprOoJyaXwT
	KgAAhFnqtC24v8qjFOLLGQBXtQQ+4A2Im3MCFEfXI2sMBIuJdT/ucIJF
X-Gm-Gg: ASbGncsWyq4dny2BLMRuZP1yBbOcRrUPW10W9HsDD+RQaBykc6WRYVT3GxGo0kqYk3n
	jNLpATS2+RzCt57F8o9DXzgSi9VFV5XtejkCONyGUL890ZtuGy/MQZGHujgYI+xnI8GdLOxttG8
	uf1Xd6zCjkKogqqMlQPjcGmBMdyt4fytN+N4hhuHWVBwky0ORGowJZ8RHk0hHZ5X9TvMsr1IoUM
	viZT0XaEZDO+EQ544EZuaQ0kdW2aA3mPmHwlhpzxGoTGnrX7ChLjun1UvbLJrw4c9sa4Sf1gA+c
	7/TpF/BvldFG38UdxvaOQgbak96+e1X4Q1BeHqZnP+zH4uamWWCT8Kg7t02pSvYldixduG/ujPy
	6TcwGxmzQPe9iEJ2EPVdZuDDEPBTaLrs31mdI813FkVrVjQ==
X-Google-Smtp-Source: AGHT+IEHMuOfqfbEAXyydz/6yEfDq/aFSpBZM+r3EDWx421l2nlrumbtomZYVdIHljUIvIOHLKf4PQ==
X-Received: by 2002:a05:600c:1f0e:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-45b4d84bbd4mr30919085e9.23.1755792002897;
        Thu, 21 Aug 2025 09:00:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9ed2:95cd:69a:8d10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50df262esm2121395e9.18.2025.08.21.09.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:00:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] phy: renesas: rcar-gen3-usb2: Fix ID check logic with VBUS valid
Date: Thu, 21 Aug 2025 16:59:57 +0100
Message-ID: <20250821155957.1088337-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The existing ID detection logic returned false when both IDDIG and
VBUSVALID were set, which caused incorrect role determination in some
cases. The condition:

    !(device && !vbus_valid)

did not properly reflect the intended relationship between IDDIG and
VBUSVALID signals.

Update the logic to:

    return vbus_valid ? device : !device;

This ensures that when VBUS is valid, the role follows the IDDIG value,
and when VBUS is not valid, the role is inverted, matching the expected
OTG behavior.

Fixes: b725741f1c21 ("phy: renesas: rcar-gen3-usb2: Add support for RZ/T2H SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 7b4a6e8b7508..70498145f0f3 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -302,7 +302,7 @@ static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 		device = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
 		vbus_valid = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_VBUSVALID);
 
-		return !(device && !vbus_valid);
+		return vbus_valid ? device : !device;
 	}
 
 	if (!ch->uses_otg_pins)
-- 
2.51.0


