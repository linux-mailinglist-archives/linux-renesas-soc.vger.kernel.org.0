Return-Path: <linux-renesas-soc+bounces-21935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 909C9B59B73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 17:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01A5D1C05472
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F78734AAF5;
	Tue, 16 Sep 2025 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxpJSwia"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE01B342C81
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034985; cv=none; b=BAJh+1b1b61odBFMDFXcsMWjaBQyMaTeT7zEhUDPJHwRTABNLW4Q4jgscWpbc0hzYWDAXD72Zq21Do/uDGRU5c2iqZzbMwZxvB0GfdgokCuO3e6oBljN1oe1xu8czgxNsFyTVgId61IMM/VH5r7MIZks9tgsYZio3VSDTAxFTQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034985; c=relaxed/simple;
	bh=ZToCMOBOhJsU3tIcnWwK4HejkiM+RUBWbY3Ds0NxNKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G56lyVBMRIkrI4XxH88qQF3RJZGsX26ZD/KUWK/Vxj1UZoj9Ns2YBmR9kTdBhtJLwrcsp2TLtIKu/ZIJ68TxsZ6KDw2r+d12g/WN41W2imaUjX+LkAZJz/h8R94wnYOj0Og0egqNvMojh0IiyYbwyx/QPjbfKYZTxK1+GduDSBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxpJSwia; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ec4d6ba0c7so987857f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 08:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034981; x=1758639781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0POxPhipsvlSGEEjXqnf+oNP1ubhTQm01K/BJGNzx0=;
        b=ZxpJSwia+xAJEbt4dpZ2aYx6r51vjJZ0mbY6xgB6Baj5O1QGOWVNejTdO/2TfqsOR6
         IHgshJI2DUFYub4nYqwmuEfJVtVNnkDyNwapMu+ap0b8IifUOdFR+BZuc0fz7poH0nVd
         GX3TeL7zzQ7S/uBe8S47TSTXhyjXay35DTFCJ3Sm08TDNF7GJYFYNblhI2lF0bPbsNsx
         eoxAwgVPE8dCNre6aQH5yDsT8XprZSUzMPjTNN/DzatkNtwCPYaWvbx+l4hsy5zcSJdo
         Rp7CYlq6XkULXYSIQwxYulk7QD3cNq+jvJU1UsQqkfVE/7Lsg4X2LlV1hxoLKUzNRKo/
         h+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034981; x=1758639781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0POxPhipsvlSGEEjXqnf+oNP1ubhTQm01K/BJGNzx0=;
        b=iK/3joAX8woTB7ol2xv/O/++p2hGtrJTyRBSFaop0JlQFyxHJSPQJekHQxOb2p1bjk
         cVf8BkwxaNhaTA7Hf1Thon/Qe+G2ZEpSiwv+F0nWRADkHyA9FZ3IQqNC/TNdsD5WX8TW
         5Sio2DpmnzqkJ6yf3mjHg2z/MqJo8AP/Y+JFCPa/df1DG/FHd5cx9WiB/cd6M6mG/gRN
         BC3J/KCcWOgtDvN4C+MLIlev/K6+EHdCCDVslyulGVl7E3GdMGMdXFV3EMwutPhhFuJ+
         yqz/KD9hxBnSQNX/N2xaJrSoZ42YmFqnlg6axyE8CM65/+YaBc0+0SeHcXpv/stegeJ9
         aaVg==
X-Forwarded-Encrypted: i=1; AJvYcCXHNTT1+V55YVx+L1IgCv5gxqq6iAsgj6+MRoEACAw7opZhYUBl7x20A216O3gMgmBZfjtJaeFrjsQcu7VAFfAdFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe53z60xFw6PH8mySXa4Rp9XGmhUTzMR6KpDkWCK/x9EjLBUCG
	+9eyr62AeRjCqr2Y89IVIvnckytJ4XDT3NUICr5xdFnVLhD7EaiVoA95
X-Gm-Gg: ASbGncsfu1EizM1zEoH+ijORwde0ZH2f9thB73gyl/UY9LwE+CNRqyv5rlaXNyKl595
	G6lzdYP0FMC3wXGDIFVUZQIpLHZuyqftaOhcXJwO7wBfiBj3WFbVeYkCfRYmAAWL0nkZFe+GslT
	mGpUzcWbX33Bqm16vWTk+tt6pYfKH/BWYtH+H3c+7RLV02bZ6DFyR5y90RY+R2dvbySg1+niRxr
	ugjfIdwTmA9T5F7axiSA7Z24OFJ93HHBaF5sGAHNuDqbt7/curLRJlykEvV5cQFQ+/jY+7G2JNm
	Ksy1Ytx7RhLgAVYKFSx6ZYxXEMj29Go2hklrh5CaOlEW9+7VZJmSOcSWCZ5UoNwtVx/+nGwGDLq
	gG0m7bfvemHOc9BEcaXbeNsqEHR8paD3AM6tj+euUdtI0cnB3DRMyTLBw902g5X56P9bbv9Jcgm
	jerQ==
X-Google-Smtp-Source: AGHT+IGmHQXV8zQi20PQ52rZ3kLQAtv5qtMfgvNSWWyv309LLe9kOE/hMbr49hkrS3kibkVDg/cw+w==
X-Received: by 2002:a05:6000:605:b0:3ea:e0fd:290b with SMTP id ffacd0b85a97d-3eae0fd2d75mr7793579f8f.40.1758034979184;
        Tue, 16 Sep 2025 08:02:59 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm932154f8f.47.2025.09.16.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:02:58 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/9] dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
Date: Tue, 16 Sep 2025 16:02:37 +0100
Message-ID: <20250916150255.4231-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document Renesas RZ/G3E USB3.0 PHY. This IP is connected between
USB3HOST and PHY module. The main functions of the module are
as follows:
 - Reset control
 - Control of PHY input pins
 - Monitoring of PHY output pins

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 .../bindings/phy/renesas,rzg3e-usb3-phy.yaml  | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml
new file mode 100644
index 000000000000..b86dc7a291a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3E USB 3.0 PHY
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+properties:
+  compatible:
+    const: renesas,r9a09g047-usb3-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB bus clock
+      - description: USB 2.0 PHY reference clock
+      - description: USB 3.0 PHY reference clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: core
+      - const: ref_alt_clk_p
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
+
+    usb-phy@15870000 {
+        compatible = "renesas,r9a09g047-usb3-phy";
+        reg = <0x15870000 0x10000>;
+        clocks = <&cpg CPG_MOD 0xb0>, <&cpg CPG_CORE 13>, <&cpg CPG_CORE 12>;
+        clock-names = "pclk", "core", "ref_alt_clk_p";
+        power-domains = <&cpg>;
+        resets = <&cpg 0xaa>;
+        #phy-cells = <0>;
+    };
-- 
2.43.0


