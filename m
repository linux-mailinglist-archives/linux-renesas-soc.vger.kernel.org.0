Return-Path: <linux-renesas-soc+bounces-15265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC70BA7813C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 19:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE0BF3AB203
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 17:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13D620E704;
	Tue,  1 Apr 2025 17:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeI1u9Ng"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF24D203710;
	Tue,  1 Apr 2025 17:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527727; cv=none; b=oqitE/QBq7ebS5QPwGKbhB8kW5200Vq7FYZLhriwgn3srkPtBMYIDPALmc6cOfM6POrxR8hDYyoE3oGt5dvpj8hcB3PN3SNODB/5I7ilGsID/z4BfCqZMrJgRZBu4+KY/U8Ak+xlbB8i3NYowM62hLW7iO6GYD87zI7g7fXZYVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527727; c=relaxed/simple;
	bh=sSTod8Q0IZeUVCmhxMoMISPtm8X+zOnIVSFa5ac4IwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZiwoD288xw8D6dczNqxbGoavt1MVOLKQNM3EdNGn1o+pRaVjMN+x/4uSJtZZhkSvy8+njiDA4IiFg5+nDyIYxSNq6MJUhWzki73DWwb7XVCnjmDZzdJBTpgA6coK6WEr1wkavkgn3Z4gOqTTSoYDSKlYA/69T2jat8JitrRaaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeI1u9Ng; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso43926065e9.2;
        Tue, 01 Apr 2025 10:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743527724; x=1744132524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R39K+NOK9nRU3xU/6tDyl5FSqNvJihxLE5DBP2+eT5M=;
        b=MeI1u9NgCLwW7bBVtq3tmV+P9+Eq1LtOPnxE6520ltvQp6vql3PjTfzBXCAUQ990Bm
         PBBgiWIHcpkLT1mnhZuzhK2qf5PMGK+EyTjuHXkn8ycuY6GZW8sYfZVMtSpli/MQ7yh6
         y/kWKWujI5IN/ZdO3eA4qiv1s+fRJhs3xpR3hfL4R3U47O9u+YbsGViUrrAwZsTCEM8f
         dHXyUDCeR+1TJP5IBFUktv5IQzNnicQ8Nebeglth4j10XXmI4Y6utZgd+U4SmLwaNdrW
         019a91xzWxTK7iCfxiqSCW8jPA80pniJ18FXS3pbsL7FQtC9OgBDD3ij+i+yvt6VtsX1
         81ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743527724; x=1744132524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R39K+NOK9nRU3xU/6tDyl5FSqNvJihxLE5DBP2+eT5M=;
        b=Y52De50GxEPnQ1tbU5LwkEPTjL27qijQfqOWfWsdnT579+Eai5dDPOb5GWswA/lPB9
         S25t8oxFetbxY+NANLn52tmu9QbsZ9mkjdnX8HHppLY6rQoryq4TQm11wmbwyq8cuel+
         wfj93/mF6lag2O5Hjejgu5tuEYl01aQ4f9bKjmhGKMuMgJ3pe9rIB+INA6D6t/vA3N1O
         cdc2tkcWsWimnehZtQ+rchJdETm+y9cfTw+pyRIaBNvYHeyqZUnOZUcCWQtmjrNLFGxr
         RfQaVLsIXWEpmAvKJ7dcURVqEablhWMqJ3EVFQyfRFxAfCf9J4cOBz7C/E0l7lbElkmo
         Lf7w==
X-Forwarded-Encrypted: i=1; AJvYcCUjE+C4yt9QPelO1bG2JfbWzjdAra9n4YRWDFVYuI9pghLflN7i5tz35Q3v3IK2qy+7Vam2RXg0satN@vger.kernel.org, AJvYcCWdQOc7rPlwBos3KyeI2zjiSdiO/ayrXPs1hmD4dfVqnhOz3bGVVmYTTOcFf8GxuH2nEti9ZZxLzUfX8SMX@vger.kernel.org
X-Gm-Message-State: AOJu0YxQuSuuyG1SRoP0pNYCKM9f/P0znG39QxJ4pqJGq1DlG/VnJc+m
	nRhYZnpUcFDliHqXHZThhcjfANkVguPTasrx7b7+BgXMO5snJcnHHP6a2g==
X-Gm-Gg: ASbGnctQR/EeqHyvMCLAcKjaFQbjb2Kmt6tp0ueT4giH+OIWkeySBfbxjA6WKy4Atck
	F4/aybYMWVPvWPF57n4qiVFFdbMF4S1965Aj1w7P/E6Cz1miz78JicAkT47ccoxbkZuEjH4e37o
	OvkICG4/4kk+D8/Hh3TfK8vLd3uD7+VKIYNPsB//2c5cXcD0QjLZkxI84Qj/yc0/19GjcXFn94W
	RBfLljPLoutnHATMGtOmgKOeTNGOlItzayBiMcWenNcmB/FtVfn8ojqpRDse3tbvxji7gYC1VEb
	8IwNdZ0S16AFQMlQ8D3OEv9f/YY4caBoga3uwtvviooZ0ZFxjU66+vFqHgGkFvTMPNeIXw==
X-Google-Smtp-Source: AGHT+IH5JMdfEMTZqOK9LW63AA1MRa6Q9PiIQ0MftYIpISHNbwAyl3rjPEMa8QFvsttpAeW7oX3Ghg==
X-Received: by 2002:a05:600c:4e52:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-43ead8c33d6mr22707725e9.16.1743527724128;
        Tue, 01 Apr 2025 10:15:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f6ce:ff76:f4b6:b6c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfd9bsm162583555e9.20.2025.04.01.10.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:15:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/3] dt-bindings: reset: Document RZ/V2H(P) USB2PHY reset driver
Date: Tue,  1 Apr 2025 18:14:30 +0100
Message-ID: <20250401171432.101504-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a device tree binding document for the Renesas RZ/V2H(P) USB2PHY reset
driver. This driver controls the reset and power-down of the USB2.0 PHY,
which is used for both host and function modes.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../reset/renesas,rzv2h-usb2phy-reset.yaml    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
new file mode 100644
index 000000000000..c79f61c2373b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2H(P) USB2PHY Port reset Control
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description:
+  The RZ/V2H(P) USB2PHY Control mainly controls Port reset and power down of the
+  USB2.0 PHY.
+
+properties:
+  compatible:
+    const: renesas,r9a09g057-usb2phy-reset     # RZ/V2H(P)
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
+    reset-controller@15830000 {
+        compatible = "renesas,r9a09g057-usb2phy-reset";
+        reg = <0x15830000 0x10000>;
+        clocks = <&cpg CPG_MOD 0xb6>;
+        resets = <&cpg 0xaf>;
+        power-domains = <&cpg>;
+        #reset-cells = <0>;
+    };
-- 
2.49.0


