Return-Path: <linux-renesas-soc+bounces-13997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A639A4FED2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 13:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F2BC3A72E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 12:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19242459D5;
	Wed,  5 Mar 2025 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeVaxr1k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B209245014;
	Wed,  5 Mar 2025 12:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741178371; cv=none; b=OQBicLR4wiYSameJY5kyhSM8bwYUeMPzOfUdzucEaO4TMCVtaAdnOU5tshlW1kc+Zk+UD8g1SkOAqlF0cebkfRYzobQlzscqE1MK3DtLGuLMKoXFm3EeptrYAh8dyKEsj/4vSFX3fb1mpZ/uDfSa8K7QGcWsBOXk5fRAnDL1P9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741178371; c=relaxed/simple;
	bh=dWuDucdAeV/mFM1ndqJ+oLirURB02bcafgwTsUQP6b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=By3rwAh/eSVgl7ggLskJnw1AByPgnqfBr8uRq7RGR5SuN/ud/kvMl4hjUP13laQfd1hcUOPi2u0apZbcOn/cs03ZWQ24Iokxs/p+hJ8+yMu71+WPepGe+fYEqd0KJAEeRwD/JjM4xBtijFZO3RHVAGRaqUYEPWkxokvi4IsRm7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeVaxr1k; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so31736865e9.1;
        Wed, 05 Mar 2025 04:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741178368; x=1741783168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTrTXdeQJ8Vh0YWOZVmijJZ9QCN7itcgg4Zz4eKg6Dc=;
        b=ZeVaxr1ktc86sBVIJvbf3yiVeGs13+c8kIDEHkVVNs+Mz+nz5HV/TSvFzOqBM2lMWq
         VphsLjnTlf8EeAcz6aB/NyYmaNp3KUOzTH+SiCJvZRxv3+Ki5o3WSFyfto4/IIxOasIg
         ja2YkMBs2B4WTiw8NeH8gWJs8b1pjz3viRQ4g1LLh1j1K3uGZpUDC5iS3TmEXz/pF6ty
         ywhZytj+hLc0CkxQdMAGM0wxx6F7fgOwYrRPVZWhxYAsw8Wb99FZfhTcy4xIifFp/XRe
         gzVeHe4vJHDssHLhLTFeBnEZWZYci6Lo2T/FyD0A7GIx/DIyjKF5XvcepCcbtYD7x5Bv
         UyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741178368; x=1741783168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTrTXdeQJ8Vh0YWOZVmijJZ9QCN7itcgg4Zz4eKg6Dc=;
        b=ruFhXP+/phi7HnmoA0z1Eo+vCgWHQlNa5+aTX3q09sYrysLXOnG5rLvjr3i8gYtpJq
         CKFP7kFq3YpdHO/QmNBI2Jvq720Zh3yOIY/5u6hHP40FA4THjLwSkX+zlLRHKgUM5IyV
         pQhIltSgeuVsWvIB1/faY/PXDYwshZd6wBH80MEsDG4d05zgucqmrihR1L1jBOGGbDzs
         WOwYqnWRgqf9bImFy2FOgUQlmzr0tRUiHmesxBE7sjK7Rl6GIUb/ZNxeV1vKIY9PdT0w
         PbuHSK/Yf8mj0phV/ECLpdeZzdm9Fv4Cu+dgQ+SDtZ7TSFBtrr0k6b2IlpBRJdgUw8ek
         De1w==
X-Forwarded-Encrypted: i=1; AJvYcCWi9sWWusXv4g03giWoaTENhEgI5mWQFLe2epY3TF3qEPlDPYgWo1hSBHHyJ+cOhz3XG4mT+BF5Dy6FCfNkvfHcC1E=@vger.kernel.org, AJvYcCXQnty+2vL7LCGutQk8/TYK5Y+goXy+bkXZE+KtctXXJxtAEy4fRr0HL61Hi3gVDPKj47BfiqOGt3zMfYU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5zYOYMUT1VwdrG2Pjfa4KMolpFDc6t0o+Q74PLceq7FrozfbG
	Qtyxwhi186Q0o70s+TQdrRyypcUGp9uBaVD1shlqhcYLV/IYa1899gNutIf4
X-Gm-Gg: ASbGncsZqsnbz8A73DXBpDospqsI0mx0wJWyEGdtGMx3YODz41+tbEwVwAIhnfCTZbI
	p2Tdi4Nc6XHlQeIiIEOGQi0w/r/VpsVtsCoAaCHBAbSIz2adbvKfKiINlePCdgo2plgGRV1R08f
	FIUcXoEOfD/eMFd0yyS0cSeU/JwaknuEhKKp/wPP3hPG443fxCohgxftlafUxmZ6ytQnyGo0noq
	60D1c7t+snHjSj9pI3ueaElKFRMcrcLpHe5LDVBJxURYsjLwXp5YQCdtRvv5ZY4TCD7GTRP4b0Y
	KrzXOlr9c1olo60e5uEpCIsVOWNhnHEwt/Sx0OtLj5lo1rZK6QTYSZqL1hUKWpnM/tBnW6c=
X-Google-Smtp-Source: AGHT+IHuOg0SzdtsvCtT2zzhfgIIKokL4moQtWW0NzQdp5svlIVitAjbIewt6hslgEfv+/witkKiCw==
X-Received: by 2002:a05:600c:474b:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-43bd2948911mr21002355e9.2.1741178367857;
        Wed, 05 Mar 2025 04:39:27 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:8fc2:ef5:605a:34d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd426d32dsm16851495e9.7.2025.03.05.04.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 04:39:26 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY Control
Date: Wed,  5 Mar 2025 12:39:13 +0000
Message-ID: <20250305123915.341589-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding document for the Renesas RZ/V2H(P) USB2PHY Control
Device. It mainly controls reset and power down of the USB2.0 PHY (for
both host and function).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../reset/renesas,rzv2h-usb2phy-ctrl.yaml     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.yaml
new file mode 100644
index 000000000000..ed156a1d3eb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2H(P) USB2PHY Control
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description:
+  The RZ/V2H(P) USB2PHY Control mainly controls reset and power down of the
+  USB2.0 PHY.
+
+properties:
+  compatible:
+    const: renesas,r9a09g057-usb2phy-ctrl  # RZ/V2H(P)
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - power-domains
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
+
+    usbphy-ctrl@15830000 {
+        compatible = "renesas,r9a09g057-usb2phy-ctrl";
+        reg = <0x15830000 0x10000>;
+        clocks = <&cpg CPG_MOD 0xb6>;
+        resets = <&cpg 0xaf>;
+        power-domains = <&cpg>;
+        #reset-cells = <0>;
+    };
-- 
2.43.0


