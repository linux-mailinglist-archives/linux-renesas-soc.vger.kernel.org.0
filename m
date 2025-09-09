Return-Path: <linux-renesas-soc+bounces-21668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5EBB504E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 20:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E842B1712FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 18:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D8C35E4F4;
	Tue,  9 Sep 2025 18:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrsFWz0T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE20B35AACC;
	Tue,  9 Sep 2025 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441291; cv=none; b=EgD64FoKZg5mwJ1xSwfcYVSq2cyK0n0cviXAZcO1MEnzJzCU3PqxM+1DBTXtYwUQMX5aq4Gksg9d399bhoQx+d+aAaZuOqeCq8FKL3wpF/YOAuwaMy7lGLq40P86KR6Q/aGNSgHLIB3QrXxbJu3VlxWaGvrnThOqh/uJB9aGROg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441291; c=relaxed/simple;
	bh=3Xclcgm/dXuXgIj1hrG4TPm1ET1Eq/wbpTtKsYfJ/D4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJClx/cxsDlDxeWMhTv0FL/N8K1R9bzyhBKnLJk08gBYRMWBoGDs+UBD+UAUdofuFenQfjIW80r9i2glVGOb1vG70tQ9JXP8x7jLq5lMiz2NQ/cYY1DOSTOXgyvN452rQC5/rtRc1BLK3+7Cvh6+FuqQ+8UPiFXE9aIbYXAJf0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrsFWz0T; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso52291235e9.2;
        Tue, 09 Sep 2025 11:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441288; x=1758046088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lN4DToaDlANZB4p+KEsGqlMY3d+oUTSup5pBeEXRT2o=;
        b=DrsFWz0T37aD3cAq0IbzbdzWxURzEHThm4KpiHKrK5J2NaEKlX3j4sVgY8TjTaKcml
         S82QukOoTRlLjYTAsDGN0rGJpo1iUb5BGN/9lJvm79vbTgdlzJnl5xlZPIv+hOCOyqoN
         I9Cl3BTqt+Ru8XOmvpCYr1AWm5WVdeQLaIIbQsQknLxf6HLnmp3X6igep5JMhM/VTQ4x
         ufI94eACCgMNx/TPw9jxoosD1LaTAsaQmzFVZX6C/x8JYuvZXTWIcinSYBWX6/Z96s4z
         ENFqYtWI2+x8ak/HmpuSBX9AVL+GaQb2Vr8EkTzAxvwTs9Mvv4gS7TuZNTndeMg4MRM/
         yB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441288; x=1758046088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lN4DToaDlANZB4p+KEsGqlMY3d+oUTSup5pBeEXRT2o=;
        b=UyIPxEdqiRKJnRO6OCEMIUf1PqiyG8cVWxSOakjQqdHuZ3j7qdjjZOSuGZn1y4JxO4
         M3vSn6zkUAP7zqSqS4WxKu/XfYgq9fX2ZFo7zVovc7znf1PLctMCKc7ZjVe4nGT3UDOB
         qjH6/0mb5U+3t+8B6b0CO2n6RrZ0r2zO6g2W0CLBlukCqb1XBqZ9I8apksmlkfrl7UQk
         ggtGRrRlTTm2QSqF6dzdkIMsqhAlBZG4Rk/hqTUi2DW5gwcSeU4QyQ2K4ju9MzRzbYId
         C/XQzmoNK0wZpfkttl79qI3Eh4f9YN3vnx0/9sNDuR08+O17FBka9Z47iUkSHRCGklfP
         8ZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHTxMrlqoQLpURX7h9g08d2OnQcm3tBX75hd2+xGONV08Z7VLKDdpdCBaBbvmI+q21SZj8D51CySvKEcYK@vger.kernel.org, AJvYcCWJ9eFl305Rb9S7V3bjJd1CkxrMPoXyGcHNDvl0WGhN/wSF0B7t+4IAYr0hnV3oepDVfHB/uVJHM2Ob@vger.kernel.org, AJvYcCXpIEZe0jMDkHE7oicCc2XOjU/e90CHsy1TMWc8nwBF6HHvD8TYkGUctxLdLhVZQTm9O4ICjQ51PwSQFm21ABk0XoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrNCJiPWpro7qZGoC6EcUiti/wjMWyS4KEFPa3BpOkBv/tHDf3
	qfwfqqoyOYnnXqyqcd6pMURF642Ln+K+raRaw7NMX7ut7XLT2AH7q87p
X-Gm-Gg: ASbGncsYPvFHpavXZZCEY8otQOi/3Ia3lrtQFTG8JtwriMWzm3JRJfaRFzIpdj811J+
	W/8NkV5S/bN7XZMqKGprHG/Kf3N7dmKXGleUutZInmQPpDsKATgf3pjkG2rgwaxuXI/oxHgdJ6f
	1OJIg+bVRu3kJwauzMuN55dy06h9idCLOYtBSCGj6HGNzkPfHWp9HjjuNZArETOD88bBDknKmML
	SImXbimnBvqc0r163yrz6hzB6YD4DCxn8vNf1I58P5MGWDp7Z4f5nb4TaHZYojSs32OGuDJ5KXa
	DFu3/dy2jMk4aJuSjIcnmhaV2KJ1YOReCd/Rh1GnDp7GnW1hDe2RZsRFbbEo9YfXWSABfGRRr2l
	52RsmG8+9Wh1AI0/OPxpRcSVZbA5aMo6RpRJdNSPAxE9QNsOFcvMEKJGbefdPwpjb1z8eINq1Cd
	osmKZwWgfsglU7
X-Google-Smtp-Source: AGHT+IFOJ3S7z7BVPcwRlYAxLfjX01xLWVuU5j/vQzOH9gPBw/v5mV18PZ2b/6VxeAAxnmPJdSxIgQ==
X-Received: by 2002:a05:600c:3583:b0:459:d3d0:650e with SMTP id 5b1f17b1804b1-45df6558689mr9373205e9.13.1757441287991;
        Tue, 09 Sep 2025 11:08:07 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df679a4c9sm4174015e9.3.2025.09.09.11.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:08:07 -0700 (PDT)
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
Subject: [PATCH v2 03/11] dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
Date: Tue,  9 Sep 2025 19:07:48 +0100
Message-ID: <20250909180803.140939-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
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


