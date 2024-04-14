Return-Path: <linux-renesas-soc+bounces-4495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDFF89FF9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 20:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 858E5B28E1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 18:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4FE181332;
	Wed, 10 Apr 2024 18:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lrRW0a0F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3E181323
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 18:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712772943; cv=none; b=S171cQ5AQTn+E2uII3fQWpsVSqSeF2PyfxWOPv+orzqTlxoSSCptvxaIDTcXlT60sZ1k9e24XP51KtGqjr0rVpFJnQLQHqUr2xIVDDbinDeUHwD9a7Mx191rKHBkYsiSItpRgCWI+PNyCgcIcBjnrQ+bQWoe+4F+3WcVUmiypv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712772943; c=relaxed/simple;
	bh=Q2qHTZspSdWtX9XB3A8ImC1CW2zPPcnl5BCkVvkisr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dCnT7sTn675/gIBpUavQlBkrlyfG03EYd76rMpDRKuaQUx1NO69CdMHX4f32vh7OVElPT5kkRLKXuB1GOz1lbjTYoBpl0tVDscjkxrdAGjqT0VLJwzROag+O7JgqqnL3Pdtov5KqAZm/qoftksKFIovg+IS4PzhfcCnL3nnN7Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lrRW0a0F; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-416920b1a2aso19638255e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 11:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712772940; x=1713377740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTWafwAOSteWZK+IF8K+ySu+NLy3Zj+VooWrs6puuRE=;
        b=lrRW0a0F5OIK6cx/Uktin3Vb43i9YY53hzg4Hj3AC2A4mWCg1dFqX+/DhBBJUmx8al
         G4zrfREF/oyikrlsCoS5jrfToMDL1T2yMkMIEenzflJ1mGdOQrotzE0elG3g/7vI6Q2h
         BvuBu7Bx5VVePyFyGWOgOoGsjmtUrIudLOdLBrpX1XlQjr/LyrSxa7NE3PPzNflcfkV9
         30RARpS4maYm7FDUiCxoQrDLSgG0r0yYJGetYn39uLU+u+qR2DUXenVcFzvWtLeGHMW/
         4OeYgNubQlhNU/M4aIfMoY0SJo7C3CaUAlFpZ1rQU+6F6Aa4LW/SGkk5B8ngYZdIxVu5
         mKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712772940; x=1713377740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTWafwAOSteWZK+IF8K+ySu+NLy3Zj+VooWrs6puuRE=;
        b=NRfQZsfHYQ2/eBDDrmRtqs8rYrejLha4Y+47UvXZaJwA9JVZEKSwPdPy5jVIFLVoe4
         MUUuOZeGQiIIomsYdGypyaA8PLT6AZOZrJmOKCbS2/9QOFrlDDN0zWA6uCQDZFrzmG+I
         f/e/PgTFSjXsVNL9Gg2MIzJzQhVk+pq9KExydY3OxcnUYBWXc1fBtqGq4R9kKXQSMrIh
         JwDG8+r1MpzwNafa8I7N/HWGBmKxJBbgcMTbXGlIO3Xi8d9lKx+2hCTxoJIsYBWQ+a1d
         yJpxh0WT/5WIa7vLjrQbeycJC4GcbYtzTGVQal6QOb9FNIURx/C0jVj28CqD6EKX774P
         /sWA==
X-Forwarded-Encrypted: i=1; AJvYcCXPV+jRIBpaqWQbPeAj4E9N/xH2+F9i8LsRl6rXYPnOe3lCOGCgaEEIy8l3cNm0BY2+U/zR+t0orLDNAesEK1ihQqxe4oyws9PmP8g9uY+ILtg=
X-Gm-Message-State: AOJu0Yw6Bl1OAv/ZU4GIKKe2bQVemQzlFfc/CEtWZAmfpv6mHM49/hyP
	x0uJK1N4KQWQCz3H9Dnfznbl3Botalb5pUCFYtMkzNMi1i/6i2oybAexTsOHrpI=
X-Google-Smtp-Source: AGHT+IF48RGmHk8pl2ow/KjC14k8yrkxBwd5xymh3LOhP56MyaRgm1/Xm1jdP8c96wTN/A1i8OYwaw==
X-Received: by 2002:a05:600c:3b98:b0:416:2629:bbaf with SMTP id n24-20020a05600c3b9800b004162629bbafmr2751097wms.29.1712772940126;
        Wed, 10 Apr 2024 11:15:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id d13-20020a05600c3acd00b004161bffa48csm3026487wms.40.2024.04.10.11.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 11:15:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/4] dt-bindings: PCI: mediatek,mt7621-pcie: switch from deprecated pci-bus.yaml
Date: Wed, 10 Apr 2024 20:15:21 +0200
Message-Id: <20240410181521.269431-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410181521.269431-1-krzysztof.kozlowski@linaro.org>
References: <20240410181521.269431-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtschema package with core schemas deprecated pci-bus.yaml schema in
favor of individual schemas per host, device and pci-pci.

Switch Mediatek MT7621 PCIe host bridge binding to this new schema.

This requires dtschema package newer than v2024.02 to work fully.
v2024.02 will partially work: with a warning.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Important: v2024.03 (said dtschema newer than v2024.02) was not yet
released, therefore this patch probably should wait a bit. Previous
patches do not depend anyhow on future release, so they can be taken as
is.

Changes in v2:
1. New patch
2. Split mediatek,mt7621-pcie to separate patch as it uses
   pci-pci-bridge schema.
---
 .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
index 61d027239910..6fba42156db6 100644
--- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
@@ -14,7 +14,7 @@ description: |+
   with 3 Root Ports. Each Root Port supports a Gen1 1-lane Link
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
@@ -33,7 +33,7 @@ properties:
 patternProperties:
   '^pcie@[0-2],0$':
     type: object
-    $ref: /schemas/pci/pci-bus.yaml#
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
 
     properties:
       reg:
-- 
2.34.1


