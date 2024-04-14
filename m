Return-Path: <linux-renesas-soc+bounces-4365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA5989B063
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Apr 2024 12:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D06E1F218DA
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Apr 2024 10:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C072375F;
	Sun,  7 Apr 2024 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtKHOW/b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0380622325
	for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Apr 2024 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712485218; cv=none; b=UhX5uEq09MQYV/tHqZqmOXODwz7A/h75hV9rRE3igCAFhbY4J2AImFy/KZjuG+3Bo9jxRjoql35edq1VE9dQRjFRKCELMrpYiJ3lmBFp3XkjnnpwDc39zl+G/SSSrBKbZICgMmhTBoQNP3+ih8MwgeTjKETF/t3IcQUQ5J8SET0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712485218; c=relaxed/simple;
	bh=IyigiUXqfkyxr9LwRAcxDUtvNu6/TM1v/83gsb1KeKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SIJY3nX2EGzDrsXqTHXdv64p5C5HQhkCHkdpD2FuPRihCdFg11UFz/YyHywGE22y414NbRi8dAScFNd0gxavo1qjiEJSB5WPBQo83wQXy3s/46vyWBAifi2PrQBGZXgAIYozPmOOFezykDXKuKTLkbsMAA40b1hNDgHJ0DsSavk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FtKHOW/b; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-34005b5927eso2281728f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 07 Apr 2024 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712485214; x=1713090014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnClIcxeNTCAJvOGIqqRS1p1KDt6khfthGozCH9PY8c=;
        b=FtKHOW/bkS+Gbo5gq/IQNkE6uzo1sPTWGkndOw2ggbvGWOyx6C/To+Q+3sPDXCpzUF
         +jDrF9Hmkeod3zyuEf3whLWr7oU5PiHMBLqK1vKwUJHf+MAfQzpUL5Qbaoa2PfkxM0fx
         bmEnt9dZwVIDy118m/Yn7iG56pAO21XSAYKdLIPOcXwaQLi+2qty+Dd90H4y1NDWfg0H
         lGv24VMKqMuCS40CgIhg0yQYire2E9Bin+n38XbkFn5mMt1PDh9rytVWEYynJ+KGHRNb
         6nOkIKk3BJqr7/2HHss1JRdM4DCzeC5qxqsNIeoL7M6j5pBFIlCqIIMv6vY+KXGaG62O
         ldcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712485214; x=1713090014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnClIcxeNTCAJvOGIqqRS1p1KDt6khfthGozCH9PY8c=;
        b=atBt1R7QRK+lCM7NBd2POCPu33vLUaiGaK787IjyJZo3C9eLqT5sIVVghJLywTDrfT
         i1PhS0wQeZH8uzHWM3uG4B1caPAFsEPnwZu/Yp7CCUsEGBoAA8HsuOk7WaSez147zsWs
         ZuqZuCQZSbtzdYqS1sNvGl65AX3/vfRDysobspupTe60NKPJDf4+9zDQukOy3OBjXgr/
         6Z6JY96LoWS4qmQUE2xjvtSy/vcevEN9siY7Y59MkItu9NSA42EuxdFmQET2tcZJrstO
         zzNxRru8npcJGuImXdSGQChY+oQoW2tJ8HMiZHzTxIfiS2ZjTnuX47YUvoJTYSZ2zBtu
         mtnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6fDrNbOXu69Xil3CFoseIQf/Ya2SagRnSFjZvba2h5tGyw1qIhGz4O2rx7VAYVFCILv1WTPPhEYeTQmURdjD02r+Fe35y0Pw3HTurEM3cQlA=
X-Gm-Message-State: AOJu0Ywp57zW4XI6tnJp0zoYNhvFPtrPaw8lvirqlOS5SPuwMv6Yb04t
	lHiMUxcMJa3uAVanU2KtrfwMQV0sWrCJNRoW4xjvJO6M57Hicfc4dOGHzjX85LM=
X-Google-Smtp-Source: AGHT+IEvFcYweyd3hb0NKU1F37wgjCKo+SqG2hMlMxwV0wmdg5iPdEiYe7OagVX4SKZAxlH3JsRyAg==
X-Received: by 2002:adf:f48e:0:b0:341:bdd4:aedf with SMTP id l14-20020adff48e000000b00341bdd4aedfmr3574221wro.25.1712485214391;
        Sun, 07 Apr 2024 03:20:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f5-20020a5d58e5000000b0033ec9ddc638sm6354395wrd.31.2024.04.07.03.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 03:20:13 -0700 (PDT)
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
Subject: [PATCH 3/3] dt-bindings: PCI: host-bridges: switch from deprecated pci-bus.yaml
Date: Sun,  7 Apr 2024 12:20:00 +0200
Message-Id: <20240407102000.37213-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
References: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtschema package with core schemas deprecated pci-bus.yaml schema in
favor of pci-host-bridge.yaml.  Update all bindings to use the latter
one.

The difference between pci-bus.yaml and pci-host-bridge.yaml is only in
lack of "reg" property defined by the latter, which should not have any
effect here, because all these bindings define the "reg".

The change is therefore quite trivial, except mediatek,mt7621-pcie.yaml
binding which have children nodes being also host bridges, apparently.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml   | 2 +-
 Documentation/devicetree/bindings/pci/apple,pcie.yaml         | 2 +-
 Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml    | 2 +-
 Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml      | 2 +-
 Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml     | 2 +-
 Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml   | 2 +-
 Documentation/devicetree/bindings/pci/host-generic-pci.yaml   | 2 +-
 Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml   | 2 +-
 Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml | 2 +-
 Documentation/devicetree/bindings/pci/loongson.yaml           | 2 +-
 .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 4 ++--
 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 2 +-
 .../devicetree/bindings/pci/microchip,pcie-host.yaml          | 2 +-
 Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml   | 2 +-
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml          | 2 +-
 Documentation/devicetree/bindings/pci/rcar-pci-host.yaml      | 2 +-
 .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-
 .../devicetree/bindings/pci/rockchip,rk3399-pcie.yaml         | 2 +-
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml       | 2 +-
 Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml   | 2 +-
 Documentation/devicetree/bindings/pci/versatile.yaml          | 2 +-
 Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml  | 2 +-
 Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml | 2 +-
 Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml      | 2 +-
 Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml     | 2 +-
 25 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
index a5bd90bc0712..79a21ba0f9fd 100644
--- a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
@@ -13,7 +13,7 @@ description:
   Amlogic Meson PCIe host controller is based on the Synopsys DesignWare PCI core.
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
 
 # We need a select here so we don't match all nodes with 'snps,dw-pcie'
diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
index 215ff9a9c835..c8775f9cb071 100644
--- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
@@ -85,7 +85,7 @@ required:
 unevaluatedProperties: false
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/interrupt-controller/msi-controller.yaml#
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml
index 0e07ab61a48d..5434c144d2ec 100644
--- a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Scott Branden <scott.branden@broadcom.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index 22491f7f8852..11f8ea33240c 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -108,7 +108,7 @@ required:
   - msi-controller
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/interrupt-controller/msi-controller.yaml#
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml b/Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml
index a6b494401ebb..f4eb82e684bd 100644
--- a/Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Tom Joseph <tjoseph@cadence.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: cdns-pcie.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml b/Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml
index 92efbf0f1297..378dd1c8e2ee 100644
--- a/Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml
+++ b/Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml
@@ -51,7 +51,7 @@ description: |
         <0x6000 0 0 4 &pci_intc 2>;
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/host-generic-pci.yaml b/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
index d25423aa7167..3484e0b4b412 100644
--- a/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
+++ b/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
@@ -116,7 +116,7 @@ required:
   - ranges
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml b/Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml
index debfb54a8042..3cae2e0f7f5e 100644
--- a/Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml
+++ b/Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml
@@ -12,7 +12,7 @@ maintainers:
 description: PCI host controller found in the Intel IXP4xx SoC series.
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml b/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
index 505acc4f3efc..1fd557504b10 100644
--- a/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Srikanth Thokala <srikanth.thokala@intel.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/loongson.yaml b/Documentation/devicetree/bindings/pci/loongson.yaml
index a8324a9bd002..1988465e73a1 100644
--- a/Documentation/devicetree/bindings/pci/loongson.yaml
+++ b/Documentation/devicetree/bindings/pci/loongson.yaml
@@ -13,7 +13,7 @@ description: |+
   PCI host controller found on Loongson PCHs and SoCs.
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
index 61d027239910..5bbb4a3f3dbd 100644
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
+    $ref: /schemas/pci/pci-host-bridge.yaml#
 
     properties:
       reg:
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 7e8c7a2a5f9b..76d742051f73 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -140,7 +140,7 @@ required:
   - interrupt-controller
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index f7a3c2636355..a3c4ddc094aa 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Daire McNamara <daire.mcnamara@microchip.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/interrupt-controller/msi-controller.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
index 0d1b23523f62..0a39bbfcb28b 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
@@ -95,6 +95,6 @@ anyOf:
       - msi-map
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index cf9a6910b542..f867746b1ae5 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -130,7 +130,7 @@ anyOf:
       - msi-map
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml b/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
index b6a7cb32f61e..210c3f2bf94c 100644
--- a/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
@@ -12,7 +12,7 @@ maintainers:
   - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 
 allOf:
-  - $ref: pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
index 5a0d64d3ae6b..b288cdb1ec70 100644
--- a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
@@ -110,7 +110,7 @@ required:
   - "#interrupt-cells"
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
index 002b728cbc71..720a5f945a4e 100644
--- a/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Shawn Lin <shawn.lin@rock-chips.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: rockchip,rk3399-pcie-common.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index 022055edbf9e..548f59d76ef2 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -23,7 +23,7 @@ select:
     - compatible
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
diff --git a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
index a20dccbafd94..695e491b7b3b 100644
--- a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Kishon Vijay Abraham I <kishon@ti.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/versatile.yaml b/Documentation/devicetree/bindings/pci/versatile.yaml
index 09748ef6b94f..294c7cd84b37 100644
--- a/Documentation/devicetree/bindings/pci/versatile.yaml
+++ b/Documentation/devicetree/bindings/pci/versatile.yaml
@@ -13,7 +13,7 @@ description: |+
   PCI host controller found on the ARM Versatile PB board's FPGA.
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
index 4734be456bde..b75ceefa6f93 100644
--- a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
+++ b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml b/Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml
index 69b7decabd45..fb87b960a250 100644
--- a/Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Thippeswamy Havalige <thippeswamy.havalige@amd.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml b/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
index 426f90a47f35..b0d07c71c1c0 100644
--- a/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Thippeswamy Havalige <thippeswamy.havalige@amd.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/interrupt-controller/msi-controller.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml b/Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml
index 0aa00b8e49b3..2f59b3a73dd2 100644
--- a/Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml
+++ b/Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Thippeswamy Havalige <thippeswamy.havalige@amd.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
-- 
2.34.1


