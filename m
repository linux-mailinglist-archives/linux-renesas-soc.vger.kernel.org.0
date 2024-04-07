Return-Path: <linux-renesas-soc+bounces-4363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D5089B059
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Apr 2024 12:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34E381F213B1
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Apr 2024 10:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D118E1799B;
	Sun,  7 Apr 2024 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QC2QaBn9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DA61DA4C
	for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Apr 2024 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712485210; cv=none; b=eb5hsiVesZN90l1QogQIp/ZAHlvP1qgsoQyAfJEIvhfMS2H9iG8iIrAXrKXvwLDORhzcz7UEU0ZwwmzDhAd1+pjt2mnoAx73Hp1wxzc3gCwx4x9JH7JBMtHHtyk7yANLeaZwxytdj8wqT6LKuy/YZDH21KDRe1G/kH3gDASf1Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712485210; c=relaxed/simple;
	bh=/TaGs6H1tkMFweGzNMhmjEITEPdM49ew19dZoyqN58U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DpxXjhuBgd0qhjL6SEOuq5XHsCdhi9ANfLxk9AGCJOt6pU5zAGwbxBDqcUJ9S6J447zqKza6GNF2e6iQYWrosBbWbWEK+srsMsyql2MU3cUKQSGQ3ZBQX7lJSFEA8p+vsfVdNyJCBszQ+aIWvB28dI+5NC6WorW5DQAD8hpZhtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QC2QaBn9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4165d03308fso2391645e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 07 Apr 2024 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712485207; x=1713090007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11Tiq4ypNUErXvEpc5K8WLl8hiInc4dHhElWuTzssUM=;
        b=QC2QaBn9BIRM0ahvOcqhV2+zDvhqd9Kk+g0KRhcIo/ux8RJYTmkzf84A99ZCFZzUwX
         wQ/ZGbgQqV6Cbp7Fo+Mu2I9Ujd7hOn1GQYn7vsRXOjg+7ETVM9F/HT0KOF9/Wo4n+wbz
         3tga6cjGRd+UipMKdi+waoHvcHe0F3t/HXeHHwF5LpYRVOYnqWJVlhdJzkFyWbGlkGv1
         Ls3OYMXXwetaYCarSUlofkdbdQPN0LnwDQKc0JcAzX+C1rTsxLaj49JCkiTWOC7Ucb/a
         L0/teMerkG+XCVHCDI15tXhBqMEeAArUANOB+qb2H8Ey7Cgs1bCcqSt2UzVvlzr8Ty03
         6a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712485207; x=1713090007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11Tiq4ypNUErXvEpc5K8WLl8hiInc4dHhElWuTzssUM=;
        b=cGHPXdad6XqxL5imrgtTsOXZjg6KGWQsl2kUGEKn5E9MiAIe9K3UFdSV6mC6j0GS7e
         rbZEL/n2LeBk0wa5c79Io2G2GToY3Cl+Wsw1V+mCJ8MVn93CtF1URyhpJtlt6J5M9ntL
         GgZ1+V0DRkphsmkhHtic1TV4smVYSUUm/JDnecdC3Zgmfq9asiEMHxqOz/c6Ds+MfeWV
         HDxxx7s23StwvnYxoA8+vXV31BgIOhwGD0B4ZUUW4Ph1Qc5n1/jIXdKhYQZl6rv5SyEC
         vQLvNdWusYPo9vb4cJAJlCf8PkKBFc/0saSs/nXeRV65PPoGkWIZ7oYf+8I2iEc4fY6X
         iisw==
X-Forwarded-Encrypted: i=1; AJvYcCVMK6/haHOUOmi96v07iZxf4k6NInnCcBeIySEGQWa93a5ZCgpuJO8w8YWUeWABqxc940v1dbKpP5ppEEAl9TPM91/yqeS+DjQLduOtJ/F+Cac=
X-Gm-Message-State: AOJu0YzAAUC5N4OAJeAnys29d/C4W6bZ4PJOGfVRPUR60M7L/IJKaUzu
	hZCphi2qJx+Z19ZGfj8M2bugmf6jfK/zBP9agZm0Ys1EEoig3Ys8rMgY5TarnLw=
X-Google-Smtp-Source: AGHT+IFIU1jOBpcjYd9g1ytjU4Sh0w9UXvYPRaXVoXA0dFkiv+NuQmTaiBxAo39r6aQx6O2BMQCGZw==
X-Received: by 2002:a05:600c:c0e:b0:416:5327:ced with SMTP id fm14-20020a05600c0c0e00b0041653270cedmr1409027wmb.33.1712485207320;
        Sun, 07 Apr 2024 03:20:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f5-20020a5d58e5000000b0033ec9ddc638sm6354395wrd.31.2024.04.07.03.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 03:20:06 -0700 (PDT)
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
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
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
Subject: [PATCH 1/3] dt-bindings: PCI: cdns,cdns-pcie-host: drop redundant msi-parent and pci-bus.yaml
Date: Sun,  7 Apr 2024 12:19:58 +0200
Message-Id: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding reference common cdns-pcie-host.yaml, which already defines
msi-parent and has a reference to pci-bus.yaml schema.  Drop redundant
pieces here to make it a bit smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
index bc3c48f60fff..a8190d9b100f 100644
--- a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
@@ -10,7 +10,6 @@ maintainers:
   - Tom Joseph <tjoseph@cadence.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
   - $ref: cdns-pcie-host.yaml#
 
 properties:
@@ -25,8 +24,6 @@ properties:
       - const: reg
       - const: cfg
 
-  msi-parent: true
-
 required:
   - reg
   - reg-names
-- 
2.34.1


