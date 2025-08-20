Return-Path: <linux-renesas-soc+bounces-20769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9B7B2E3B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B8D91C861A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BF434DCD6;
	Wed, 20 Aug 2025 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JO6tz7WP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4D523D2AB;
	Wed, 20 Aug 2025 17:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710301; cv=none; b=Zax4UvLvM5d1duXEW/DUIvAI5ch2eaoG5+bs50Mlh32ZgA/qZrn9IKgx4jIANeo6q745jlOkNLY6sI+ajg9VGJ/AafIgIwId3dKsDDOntRrpEqz7ggg391rxkiB0ED77HZZd5WmX5GTQS24eVHaFTu5eiExz0d9CLHTjiW8IzYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710301; c=relaxed/simple;
	bh=zpqqs5hhzu6/biWFPMMTm8BIGmpDLZ4rMO85N7Y8+bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZDgxCW4Bc2duDrpBUeVb+VazrfDG/QyyI/ceCGWTJO7RXTNfoUtG4txh1HcEoQv5TBnNkYNJrghmSn2GricYyj2LDsaKoIblmIyXw25DgqhebKeaFGoXZ/NZektNaTVKE4LTLxuBLyuvgIlTYomZoe6+NfZ/mcGXsPYSe/lDmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JO6tz7WP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso842905e9.3;
        Wed, 20 Aug 2025 10:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710297; x=1756315097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd0cJlVtD4YuBE4veqF0I1l636Raj/8hz5v+Q0cDwzM=;
        b=JO6tz7WP9zgF5vE4S63v9fbYY9xP/N6fr0nupg9uFSdBOH1EAjd/l2j0NTpxmWsEEg
         i0L/Sj0rRUafmrQzHJe6hlmHIql90d6+K4tAG4Pvaz3fS2j72cYsafrF5nGLv1Zup9+k
         +2FuBiYjS2G4twQMC1ktZ7eEWjUzY8xFGvsnvK1u57Yatfzd3/LTJ0/cOgGdtPlnd+/W
         wWNPWXRsM+yye0niPUCSN5iupWfSjsHrTbDospRr5u1XYwoYmWAKB1zzePNPjd9xfQci
         4lapQn1mGffWbpVA5PVLbCpN8VXShFqX8yCk1znAwGi+9y7gGoGeDb1t7Kl3VDSKOGo/
         p8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710297; x=1756315097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jd0cJlVtD4YuBE4veqF0I1l636Raj/8hz5v+Q0cDwzM=;
        b=FpUWihGsCXDaOS0X0e4n1Q/LmVhEkbxHOPE/4kcZyOTumFdZonMQbDAb3oFkxty4D6
         5DZPw4jr/RXpxQpKeLRitknZWnfA9EtB1DAy0cuzgtnAFZd2FC+7BWhZ6PwRFIuZU1ZQ
         S8OmfysXJ4mR87RYick34ukBErpB6+MUKK+tMIDu/VXq3bap708imeU7nA7OjlQRMTdo
         l4ae/VMK99YP9DGbdWlZxW7HKU1/eccjjdCEGPofKJywdYILs0FoX5v+A45irU1SNW1/
         ee3Ob/QB+ADhKuNXe4NjTE4M60cJZuosXOBBJais7k3JKGyiHxdHePJbeIwVqG5+rGBX
         RICQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfasFq8ZHSBvHyVnFd05SAjTyuHbkz9GFE2tsSilsAUdhgDO8TZWgW+3UVYXFprlbHKaIIO1M3KurCFrrv@vger.kernel.org, AJvYcCXTHMsTB1H7Fjnix0CdVoKjBqVjcIfXeuvYYdKtsUXmtKX9h48F19dNFiqwjyJqAy/f4uUWdV6V4Xvq4DVkvx6om7k=@vger.kernel.org, AJvYcCXUSMjK06MGcUgVRu05dBEmn78j7zJsh9KSsi9V2LxhhfCgFRj4BvmeAX+N/UfyYlQzMHcNjYChbKRR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zJeZBLamVO6MJEHY49Nu7KvSUGUfxr31qBY5ZkIbD/V7tPvr
	Q8cNWzjoJnZ5PV5mA6DijiOKO4oSwiwaS+ihO4UaAhawhXAfAaWCeUHh
X-Gm-Gg: ASbGncvSaEQ7JQFrk3qQ+an/f3PJHsgaj62rhjD97vRtflTNMjzNUGZ36uu9I4b5WyC
	iRxBAoKbKAwNY/GayNaSBIL8onvvAcgnE+pGOp+94OHqmSrpjSF/X/Av+eOoFEXF9f1ZXMCmAM4
	QzsK9nb89a621xUB4BF62Mf88V7U2mv3I23bbZZe0zhguEwIMmOTzVlFlOLcbTh+C0nXJ9xb380
	nRfAR/hkGMSjdNiFmvYNI4q+jDQmNKv4Q1VhlMoUDNcnCYOfy+nbJeOhfnlAq/Xnrzx7DSncKMy
	CvXYVa7LchpxxZVGk+iUNFRFiZWFaUKbSssv8Ue/0OtagiWnTYTAA9Q23I36a4aMAvGJ1WaLQTZ
	/9iOojkzUK3kFMnLCGf7jAxXs4j7ViKT5NWyIUU8VI7+xiFYCuqkcz9KXBAh7lhMGvWhjeG/PLg
	==
X-Google-Smtp-Source: AGHT+IGzdd8mJQ6iri2cNB7MnOGxpU/zG8lZAY25Eq5vECsbTOYpF1BVraL10rdUESg6mBOiy+mU4A==
X-Received: by 2002:a05:600c:35c3:b0:456:1dd9:943 with SMTP id 5b1f17b1804b1-45b4b1c14edmr19064945e9.3.1755710296775;
        Wed, 20 Aug 2025 10:18:16 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c2865dsm40319815e9.2.2025.08.20.10.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:16 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 03/11] dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
Date: Wed, 20 Aug 2025 18:17:50 +0100
Message-ID: <20250820171812.402519-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


