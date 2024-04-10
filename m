Return-Path: <linux-renesas-soc+bounces-4493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D589FF8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 20:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A91A1F22869
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 18:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC9C17F397;
	Wed, 10 Apr 2024 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vY3A+gbP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53381802C4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 18:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712772937; cv=none; b=ufQ9NDOaCAXNJAOWTjPS6pvxr6d2if3Si0n68AL91QRt06W7VJlugAXz1FOEtsIhWbDPFuZoyvgMo8k/WGseORjXy8LjLEoDLSqfXkQt9reiT1cZzhJY6Utq/kc4UDFFhYlUaUW4OqE/IJ9X/xS+ReRWUli4khLLFEZa9s43L/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712772937; c=relaxed/simple;
	bh=GUA2gQVyzUq4mqgqFOz7Ggun/F/2pZtr6iY/78kj6eE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DU4O2PL7B5PSQreyiepe0CPNX1YAms99EbTBp5TLfd4Vt0ChP6YdDHlN+V9BOMfP4UxjFCThvfezHAW6FIIsfDMSBsjCdIk1LGzIBNG/gwrW8U/SuPLYrkXBkHU2cBH4sTCyoN6tvtBdzGMC5mzuFzOU6QYe23YSbc50HyK71r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vY3A+gbP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-415515178ceso45967385e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 11:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712772933; x=1713377733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXX8VKX+rv9zqtz4L9Nra2C1jH70KvWHrUbepIAmkrw=;
        b=vY3A+gbPWJ3Q+qcXK7tv4rL4zkXRfzjxoLjPchy+nDwIYYWbmFiLYyyv85jeUJWbCP
         9ar9eZ3is3FXO0lal+8Gf7mdFB4ZsSXamzzFgIaN1YMKQfqU72LIJi/PX/l8pC0G5stN
         yuFvRQXjstbG91mYpMV0m72dMZu26xNY+faimRfBN2TXyfcRjiIsKk9/mKzwGnYA2XF4
         EsasEivyAjvK6/BCuLwFoWyTnQgC2r3zZeXUQj+U9yfsZ3HfqmmFCvzymgmCADWbXOcT
         lAjSJzEu4IAVgFNuJNLPp4RdCFpVMwt/fp613qVnyGW4e9IfeWQFRRTK80Wjlxoa1+NX
         Hy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712772933; x=1713377733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXX8VKX+rv9zqtz4L9Nra2C1jH70KvWHrUbepIAmkrw=;
        b=CIyMNcMs8jyqRAp3feZsA8yqkxyA1sfBL1hIcV+0AxqxpE7d+aHzi/qYosIGYtQal2
         43Hj3+8sGI2o8wCRd1rCGYFz3vffTlDwC9tXwgOC4K1A1L8halAvB7B131qo6oG4hyFh
         eGNO82LcAmGoVEhwU5RYZ2LgHQpO4hMAa5OLKHRrNMMRNJCCEhcC8zPXDnoS+4I47eBE
         eM0R+H6mDlXYDzPX9cpZMhgBlzARPwwuo+E7YD5ll7AjNB1pfiCNjTwzGdBQUcUJfQIf
         TKcM2hL7cjPdu/7C0tvMaMN0qICZbGuOweXcuuroaEUmG5dpnwCJVlOVquo0A/IKE81e
         NNBA==
X-Forwarded-Encrypted: i=1; AJvYcCUBvd2fx29Q+02moqDZFNxwB1h0HOSIz5Y4XbYcKktZfo82UAkqwiKWJQRxY/CX2qgqAL0CF83JEpPOFI/aiI8Rx2ZdHija8xhte6Fm+WYeTiA=
X-Gm-Message-State: AOJu0YzOja3yx4VUqYOkJ2+wdTavsW853VDJzJrQxINZPPGnbUh6bHdh
	fVUBJQni7NBaCaz965eDe9pdkpsb7Axo13F+RWTUVvgNv/iP63klgV6Zn6Zwjj0=
X-Google-Smtp-Source: AGHT+IGazA6MZys4bTNDrbcrinuoI8bDaxyaA6yDxg8sZ5OMVeOpTl1JLqQsJ93ZXnFnHSgh7rOPfw==
X-Received: by 2002:a05:600c:4f0c:b0:416:a71e:f2c6 with SMTP id l12-20020a05600c4f0c00b00416a71ef2c6mr2275871wmq.4.1712772933184;
        Wed, 10 Apr 2024 11:15:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id d13-20020a05600c3acd00b004161bffa48csm3026487wms.40.2024.04.10.11.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 11:15:32 -0700 (PDT)
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
Subject: [PATCH v2 2/4] dt-bindings: PCI: mediatek,mt7621: add missing child node reg
Date: Wed, 10 Apr 2024 20:15:19 +0200
Message-Id: <20240410181521.269431-2-krzysztof.kozlowski@linaro.org>
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

MT7621 PCI host bridge has children which apparently are also PCI host
bridges, at least that's what the binding suggest.  The children have
"reg" property, but do not explicitly define it.  Instead they rely on
pci-bus.yaml schema, but that one has "reg" without any constraints.

Define the "reg" for the children, so the binding will be more specific
and later will allow dropping reference to deprecated pci-bus.yaml
schema.

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add tags.
---
 .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
index e63e6458cea8..61d027239910 100644
--- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
@@ -36,6 +36,9 @@ patternProperties:
     $ref: /schemas/pci/pci-bus.yaml#
 
     properties:
+      reg:
+        maxItems: 1
+
       resets:
         maxItems: 1
 
-- 
2.34.1


