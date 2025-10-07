Return-Path: <linux-renesas-soc+bounces-22753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FC8BC185C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 15:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB19C19A3343
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 13:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963C52E228C;
	Tue,  7 Oct 2025 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Nvi3bpaq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0062E1C7B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759844245; cv=none; b=i5rNKWCAsbAU6whLKqJqgyD+KS6028JyFI8RKlt3NupSWEKAaXbC05zPXgqATtdGYeMm1OKmbvTZW1y0xTbqOqE+8aLL2CBOQ5xSmBgw6Vsuf86qMyIWuwu5b6haizUWfW27jvyJ3u+sQgGYIe6wA4OsyC+/LOV0ANgebSWxPHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759844245; c=relaxed/simple;
	bh=yaCx/QXvNC+g5usMHZ3TsHW2T6LwSJ/D6SVOOxCGqwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFMlMn666yJf7EXk83rKnXfse+DdflWH1jXP1tn4CDu9NDkrvfSFwPtRMTtmFL9Mtt1NuXWvFi0GK7sKgAwGWwE49U6JbRGFcqWbqz1vzaDU9y7YigNG2FP5RFC6F8WOwRAQWuykalKs4nydzxuFYlFmJ1nWdTMwCBZCUQf1M/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Nvi3bpaq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e4473d7f6so38251625e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 06:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1759844242; x=1760449042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1z8hWvOzadOavRT6eY0ADJYVQmzPY5Un07yvaG3S8o=;
        b=Nvi3bpaqAeNOr99iDZCXPGZUh/cBiCtvjUs9HYDnQsWXWQod7HuHRsHpQa5xg79Iy4
         6tAVoFt1VO2SKwgfE1oIj/kVl9gbu8w/d7ikwsCkkBp95Ydew2Yo6J818tA/TsqMCgHK
         H7j3ZWYK+py6DtxUeFa5L82eWNU3S2JCIWlmFBClaTJdOola0x9q5oolVoH72cthR0KB
         /88AnyjeItBSGe0/uP6ZHGgZJqAqzEg1tTlpTIXrmRR8ibydKUTk9cmEPE2P1SeKgDLh
         /SBmgbbT7twGNf7dWAw8LkFiC9uVEXs0FxoafghV/ppsenWun3HE3EGRbw4Yp7rSp+f2
         C77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759844242; x=1760449042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1z8hWvOzadOavRT6eY0ADJYVQmzPY5Un07yvaG3S8o=;
        b=Yr170NJ72OtIfBbRQaI6FBGhHQX594fItCxqcBx0b4Yk5Jo8b6shTNgMmxxBhSG0pU
         ZAPlu0BYbrPbWCtOKXB+gw+TcO25qX1aYhnJQJZkRRV/eJbFLcgkHckKgxC9MSUpZNUR
         R+sfKMz5381yq/ZYitSsAEOowvJGKT2ES2GcPSbaIYwSCt+rGQTPG8ide30V1azRCoN5
         CRBeBo0dpUOdTpw6th2K7xhiiWpUE7Jg1g+3VnNbFULkK3HSnKALkEOcARriIp5jpf7H
         UuuMvWUXaolDym+fZOnnUuxwCBAWQy4rA8YlgvCXDJbLYZ2C0wiyjDrVZmcQlMb9ke3d
         Uudg==
X-Forwarded-Encrypted: i=1; AJvYcCUyCoLVGx1Gg09GFxG8jfxspObQxyW+B2l2xZO9d52DbLydpJEdDcedvQk/yQC3y6Bm5jYryzHDAgNZ9vsHe3iMow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFSagXuk4Mtb1ISM56mFZ+QzHanZO+GhK4DZ6y+x408Th5QT2N
	QjL5xqXJGTCAEzxeK9tb2bGI9gg8R0AKJ6TqPylIIPEy3jhsUmuAc68SKWhgWnasLGI=
X-Gm-Gg: ASbGncvO6fIval1Yg5Ruq0Vgbfhir3h7F4wutgJ9LFc6ruEBviORGCIahzCCjdrcyO9
	TLFf7Gt80c8Z7M8FP2jHt8e/9DcQo2HL+iFRLUpMAG7Dzx8LCtZSFnVU7xHdri3xuqDD7Rzl24r
	bAX1H6l3ZFPxyYZKQaNkvfxKkFvv9TclRu6jyOEj5IJP7PMEVJsM/MjaD1pvBMR8jwc4vB3oueD
	GG2QdNtTpCUDBKwZBEMsi7kBopJoclLGiA3HqQ82DRiBUv3UGWqfsMc7N3MaW7G7DinbSjxnVHW
	O4HQm1G2wIjeTqLOJXinCnkD/uhX9T85S6KHj9qb4ZFh88j9owF30nh+v8QqIK3r19lmIOHr/w4
	s9AsOL8BMWhtC0RtAEPSv/tLIMf2NiYWF
X-Google-Smtp-Source: AGHT+IHfz9zJI0lmSyerN85rG4LviPI/1bLy+sw6oZnepm7Ovg0zyDxv3/LrYkgGVaFxC0dz9CvL7A==
X-Received: by 2002:a05:600c:5488:b0:45b:88d6:8ddb with SMTP id 5b1f17b1804b1-46e7115afa8mr119636995e9.37.1759844241581;
        Tue, 07 Oct 2025 06:37:21 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e674b6591sm272189625e9.4.2025.10.07.06.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 06:37:21 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
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
Subject: [PATCH v5 4/6] arm64: dts: renesas: rzg3s-smarc-som: Add PCIe reference clock
Date: Tue,  7 Oct 2025 16:36:55 +0300
Message-ID: <20251007133657.390523-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007133657.390523-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251007133657.390523-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


