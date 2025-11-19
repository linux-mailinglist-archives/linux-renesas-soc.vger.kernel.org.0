Return-Path: <linux-renesas-soc+bounces-24827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC83C6F794
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E3D2A3A8682
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF9736655D;
	Wed, 19 Nov 2025 14:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UELPLbVE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65854364E97
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562954; cv=none; b=I8LYLRQKv0MbYR02PkqGNgb58zFTp0GYU/2dECQPURQtRXdpn2+Q5wEn7AstdXo9nevi+a7PhpkuJP4f1jn7Y1j9rQDmKGnPlKO2PVpkFqa4gm+ebPGyoV483bC0lYSsqsWxM8B0ViebFxmQ5SThqLaJmtU4/WyxSi5jLrAVlWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562954; c=relaxed/simple;
	bh=11llYBJlsNGu46qBbvgUePXbm5WDYTu1X+hgJv0rNa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlbVqaPHk1iLLftqMw2N/DEiQR9WMqSnzkOpHZNmjigSkJtJ4d4uoWqSwtuQ+HselgOxlIzfFTa2kigSHESz16sVAO97Wh8LJB3/7dajD6YqRlL9lfEp9LdCO9Pv96SDbtcDdwi/qCmsrdylSicKyyrAEv/tQMapMJUHhOHyrzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UELPLbVE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso4410713f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 06:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763562951; x=1764167751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNQs+jMGb0vll66kRY8SuunRCpU0Vo1BfiANzBw4F1c=;
        b=UELPLbVE1WnSMn/cS4lA838slWRaGWPaZgsLYDymmrkD9LBuFTDgHzM23VXe8WxxwR
         EoXAw6icDtrX49NMgpFZ68iDHNtzvQMcmh2tkOY78eYq+a3i7pmEo44Z8ZuZd0FndX1m
         RifGHZgN/DFOoRXyQHwYL/9D2vy12FZYxCQ55zQWA8GKGsmzIGNBIrtlSc67npjPr5f6
         4pzz2PVwicpeMTWIXktz2kJSfCWjTwskHCuKQVTkLyXBoCbIVPI5wFtyUG+LUHT1ZB71
         FXR5XDq1Qmscc7H3ZrPmvxn7umgjahqA0Y5pihUFoonsIrOwZQUzlgpUWG03OdsjzZ5G
         Frdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562951; x=1764167751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YNQs+jMGb0vll66kRY8SuunRCpU0Vo1BfiANzBw4F1c=;
        b=Sfklv38WvXTG09XmTX/OQtfucNQRlQfPyDUYcMzBFVhJPWotwUsPkenl0vpB99XcQL
         cXF3On3kpCqxLuzZesqJfAhgfnb/PcD7VXxgPu1vpMqR7yzaej1OXZFUd+Xboe0LgUR1
         NUion2HNGGA6EE6pNat1BLA9bxdRifgloNHvdO1kYcm60rodLOqgPZPRkwWpEKXEqjrl
         Kzc+iSmUTvHwE2RCNCvjowbVcte2In53K+/nBurg5NasGtP2CsGVODRHcteCK8M6Bn0F
         lHKTs6OhiE9q8bstC6x0fHt3X/XQTYeWus/QAAM0RruLv32l99c12VGCh/n5xYxOR2uT
         Xjxg==
X-Forwarded-Encrypted: i=1; AJvYcCV63latpeo5gOdiJ3/+9Dm+gTOTiPCmb+wztZhAj6+hpmEe7gvGZ/QQHqhhH4dwCZV7IocmwEoJX0xM+FuYgaRGsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGcUhQ9ryD+WvPg82IbO9oaFu8tAsWH7PCSD9jugJfPtXwjDXf
	3zfpPAoSCtP74B8GTe109myrl9iLKozQskqJYrm9/f6tOSWYTJxdRx6mmSnR232LDKw=
X-Gm-Gg: ASbGncu0S0Qfb+lKFvuaUtYl59iWGHzjP0LW5CV5aw1yQuP+L2ks7WhDcT3ToOaNP34
	ezg78q33+ju0m5Q8qiWksO34cBLHlbqmH2CwyaurVk8TkMkuLjRIUnG+r+k+dIwHoFtGFM+mM0D
	DHWYVz5vNhOHgVbhZDoq4Mj9vtGA+mgN5NHGxE73BO5H1NfF9mgVj21skoZSwNBAL+FwBCWfotX
	Ty7Xek4H8h6NT9g8WFG6zgJHKl+yVuHEW2JBaU2u9f9HLY2Be21HfSdimo9zApdzxO6nmJ0T3/l
	oc4EKfbOaJPJLdt1qdwBT+QxT5PoobVEVuJ1gP5+L/NqOamJ15z+eSdVKLVfDL0dCxbN4GpqmfF
	aU8Ng6KxAHRO2qAOEVhXcf+LLMN5LBUhJ9c3U92POKV68DGjWVr84UTkGwFFMClIEbqs875DPpa
	JS9+v+DXMG8T0AoIZj37qXjqZnBabYav25rIyt6cJ2uaijXbeZwJM=
X-Google-Smtp-Source: AGHT+IETrxRzLL90ssPWWldKaErlCBtXruYKnH8kKJ9M+zXXzSsOk2J5nfNKsRlo8J6q3wsX3XzrlA==
X-Received: by 2002:a05:6000:1a8e:b0:42b:3bc4:16dc with SMTP id ffacd0b85a97d-42b59350576mr19482167f8f.21.1763562950591;
        Wed, 19 Nov 2025 06:35:50 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm39973399f8f.26.2025.11.19.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:35:49 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v8 4/6] arm64: dts: renesas: rzg3s-smarc-som: Add PCIe reference clock
Date: Wed, 19 Nov 2025 16:35:21 +0200
Message-ID: <20251119143523.977085-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Versa3 clock generator available on RZ/G3S SMARC Module provides the
reference clock for SoC PCIe interface. Update the device tree to reflect
this connection.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- collected tags

Changes in v5:
- this patch is the result of dropping the updates to dma-ranges for
  secure area and keeping only the remaining bits

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 39845faec894..b196f57fd551 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -172,6 +172,11 @@ a0 80 30 30 9c
 	};
 };
 
+&pcie_port0 {
+	clocks = <&versa3 5>;
+	clock-names = "ref";
+};
+
 #if SW_CONFIG2 == SW_ON
 /* SD0 slot */
 &sdhi0 {
-- 
2.43.0


