Return-Path: <linux-renesas-soc+bounces-23830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4A3C19343
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 09:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B9F8C5A16FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 08:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028F931D742;
	Wed, 29 Oct 2025 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rm10YfvX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97B1314D36
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727243; cv=none; b=dzmIUbbWwJyheR/DmJIVVX4PkvQyBWkOBokSrkxknHKWHx5E3hVqJ7CCCOWwfSIJ94jhsR3J8kx+e51xrq6+Kt4WHh7zhb/gkDhMqRoDiQQqr0DG8z+g+XmC3aTdR1YPXL9563ej/Nacsq+xPnoIhbpaHEz5BEPCsp7kjZXXdG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727243; c=relaxed/simple;
	bh=3dfxHvLEODjIsoBymhUDZZGiO3PfPaDxRfipDf2Q+eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaiH6UkHU1jpr7wiv3RGUw2ATlBKgWB4ox/7K6eHmMg0LHwZDHCBSW6tYRbB1S6JT0TB1L6j0LW0E8GBXpiCfVcGVosVW8XLgxgbqb+e5FAvvJ3IFqcXUcIugiG2SujwnuIkx3d/xcBu+yZzyfhn0VXY9QyjY+XviWpiVfRlAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rm10YfvX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4710665e7deso36624625e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 01:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761727240; x=1762332040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zDKBowBIfgO2OmsFcxAdae/8qYwuZcAE+WV1T/cljM=;
        b=Rm10YfvX39NGehU72t5+bv4SznCrV20Ajt+EeSvYl+Mm6LRpHQt3O5zIq8n7Cik6pc
         4lR2UxNyF+uqb/tnh5Uc2lGCTAnfZB127b6XN75hV13gTzyjJnaasoYoLPTnypw60iMF
         fWA5wUpFtzIWQyKI5rySOd3j4iSYDPVnj4BvMNbixh1t7h9SDo3I5b2y0YiUtlguxthd
         wLlaR2ICjNP+n2UM5gDX6799S++NHaVLng1R/TfAVb46FmYdTy4mfiYYdILPwyp87FE4
         IvJky5X+6ERZYpOC9udc1HZ38JDYLqEVAGGI+nP8IXOrqWpN5uOSwCXQ9FY3pSdxkfOk
         fTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761727240; x=1762332040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zDKBowBIfgO2OmsFcxAdae/8qYwuZcAE+WV1T/cljM=;
        b=N7b0N84esXFwsxm/kaRjyErxgWdDniIriuaRyFYkAO9xub3hM8dRqP4L3LLjh/Kr9C
         RKENYZiR+Wb7TMgkRp7EQOatQIZKC6YW802QZt1SLVAFwlw/+b0op2P5pgEDl8Ef8Bct
         g/6P5wq+Lr1CAjnhzDJFKf3BeY49wr+26S1fGeGOvHmFMDoyVcErd/Unb+NVN8Ogkm7V
         A4hbSm8kYx47G4JmpgkKVXDaavOq7E8NoElIZdf5zLzNLlZ4BoroPGB50Pvu0FLh4p6L
         e/JpkkrD+XuOad0HEB4cO+K41DN0AjA87Zo8yK4HR6kEjw6cGVLV8GOoayF3q3jHvsw5
         g2tw==
X-Forwarded-Encrypted: i=1; AJvYcCVRARhlgjVedvGjAr8V82TSLLKQPfa+ECe6wt9gXYr6MBbyFUx79rtuNJ5MGi5WwcRRGiRdIBkxZCwbTlk11/XQSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR0SuyX9mqLyPm5cRUZmqSrb+LryVf5PMPubGupNdczAZZyMI7
	BRMyvSByXychn9E+0zL2UroMAKMdeeuO6xs7xjLYiaaCou6vvgLI4az2
X-Gm-Gg: ASbGncsmoFfVbIuaEG6zvEseimxQL8WIOydBfdEBs9mt4Spu8Vk7qHwZeBurLFu/1Ki
	2TzjfcvBwXoCDbVKTnm8XfFpY76ekZhYcsMAVjLyDVvgwwAc+cfwaNJQ/6z72caJjA4DxHQSbf7
	WjzCm8XZwwqAALf2tO8FiuIDsynDln0aM2aRgywc7c/DH0iLJXgN1Le+VM5HFIAAYQqFqAmYNMi
	9dbxKDJf8HmmWCpHf92z7nLuZIKXlfzCiKFbkRNnp8zmCkDXfuT89d6TmGofOyBhIzUkrMqSM02
	SvsGbqhf1x3q1/+OFgLbBktenKG1bgt14b6NVUAJ46Fg/HBXKvj2kABfbMd/cHKxMpBtwXqnbxv
	wrApdHwyoC+7OQNqhOIsmQaB4NhJFvjG9qD7VqdA5sB0BYtdIzfwBHpAc4dAmzeVHprNLsCGLJx
	o1PZWUKZ/Ch5QIycByRRAXw36d2F8COUAThmua6luZ4uzAYMBvtlMyE13vc4uI
X-Google-Smtp-Source: AGHT+IF3LoH+MVR8GJt0HNUZBmCSpCGxlcDgvQw6PVT+Io7cZd3fZ9aRwEFQRwsDZ93XErw9fNatZA==
X-Received: by 2002:a05:600c:4e91:b0:46e:39e1:fc27 with SMTP id 5b1f17b1804b1-4771e16596fmr20457285e9.5.1761727239965;
        Wed, 29 Oct 2025 01:40:39 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3a88fdsm39485785e9.10.2025.10.29.01.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:40:39 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
Date: Wed, 29 Oct 2025 08:40:33 +0000
Message-ID: <20251029084037.108610-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029084037.108610-1-biju.das.jz@bp.renesas.com>
References: <20251029084037.108610-1-biju.das.jz@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * Collected tag from Geert.
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


