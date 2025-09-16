Return-Path: <linux-renesas-soc+bounces-21936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CAEB59B78
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 17:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 645FC1C05690
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64745350832;
	Tue, 16 Sep 2025 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWK8ZVFQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442CD342CB1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034987; cv=none; b=PGYZGqnjRQc/1TJLAKlFza6uVt/BVQvXI1IeACwLxO+Ww44fp5rDdH7kImSORffa7OS/SkHgUSf2Kd4tHmhClg9oMHK/vyZ+JuZtQf5dway/db/zXKoCSL9hB6ivGdpYZQIoCt83VWn7JM04AVEwrQ9q7S+BlZ3y5P2i9pl56mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034987; c=relaxed/simple;
	bh=lYB0TYN8kpkCpqAGnSDRyFdheF0+LmevMv6a1v7O3cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mlpncTBmRhtMd6HwuUfYo2IMIz8X7dIsuGovyexxZGCmioFWkXPP5D+9CP2jSGgDIpitLDLyrFZSZQdn+X/Gm8fSsakIA+gk46kAXldFFwR2WdH6X4r7BdK8tzxKWTcb2kgaLW9SLQGLGZtJ1NdCZDroJWpdD5GF7Gs9PeA0zGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWK8ZVFQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso3820242f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034982; x=1758639782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsSrpDlSfySoJlfJZ9NvzOLQUx+V+xTXpRXIVKiJyrU=;
        b=SWK8ZVFQw0GdemNc+LbFmqVo1dnon3oVsXodiMWNYzM26tgGQvXYv4W9aKp/3a3bs/
         Hq5VT8Ddt7PvzQRrjVMfbjaxkrv9hqAmUg/3jJ/G/MJv0NaAClleDhsGqrc7/5xpHPgS
         JbVsbuz0M9iPtYmIQTyr2cBcMm12iVRjZS3v9SjGEVxbBnAUZjXT3eMrvmWbnNpx2MHS
         lNR1DkVUXfjgtQDpBgqyuwd1CBnY18k4UhwyviGoDUyVW+lZaTYG8/9/5cQlmCxs+TkF
         AO3wZCbqxf+rQSJipT4ZD4AWc2vqfyuE8fMJvZwZiPKkCGmtlYqDBnMV8q0izUpuurMm
         D3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034982; x=1758639782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsSrpDlSfySoJlfJZ9NvzOLQUx+V+xTXpRXIVKiJyrU=;
        b=oQqzX/LVP4QO9vva/Rx3vbTVb80TWhfjBYiJxHmW+Evsliw/hYioDusuUenoQPjjCE
         qPk8fBujGMtei/nPn0xkMbo1GluSB/pEIhkY/N/AYR+0k792jv0u+qNrYwNNWwunFsN0
         U33nF9a/fB8wn6RGGQylDsq917EaDO54OItWyycGHDGepa/hPd/69cwl8Xfy06g7x8Cw
         UgOG0UqUf99+Zube8bXJof420dC6KPpWx3wKcqZbnWD+gZuKCz/Cl1rUaeAtZqr3cAvr
         Jyi1nzUiaApRuFEeUpCeUhH/wfp8YpCz58V5nMNKRoEP9vi7gq6/5HR6davWF0/x/ekM
         k6yg==
X-Forwarded-Encrypted: i=1; AJvYcCUyneEAb6acKpvlZ286Nlf1h+PPfcLZy+BMwP6LR/SFt9/sgT+uhh/GV2Bh4RFN3xUh/D1LR9kiAAapbij5/0H9Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8YXSt5llqBTwr6sUF19MKWJ03hW7FD+/D8OKV32/LtuSsP1MW
	QRKrpEP7JobHJKNyW3siXQ8uRQjeFHY1EH7vyL0LSqxNGK/jSwtVX/XM
X-Gm-Gg: ASbGncuTrUi6SWmPEr3dGrWWwcgAebcoCnl2gF49y0sX6EWcsr3xhdBX99Pg80heAvz
	sD7EXlOefRDOsfJtb/TaEtmu0KoCr3P5F8k2nmWVdCZ+V59qcsaL+/e12k9syRim6TG9kvE0b/O
	XM9rM01wiipNRNrHzNU8Okz5JUvlR7PJMxrqzNPpF3TidWupgz/lSil7T1536cYGsY9DLUP0pOA
	gJXxWEH2vTtrIfMkOgqcR+ph3ZbnhonhOxhUki+rtAZhWQDFOm8SC3hcW8xynruhOiu9MOQbVd9
	0Ot3xWYG5M5iymkETtiq5ZxCcTtFtx8GVQdhwjiWika1dSlpaOtZ01YHikhUqwUMQDptKdj6lav
	cyJFAKITOj1LXkxzDIBLUWFn1zrMKteiC+LqBK/ex4iFHh+BwIXpaGKX4WOVAMT/IITxKiCI/2D
	5vYQ==
X-Google-Smtp-Source: AGHT+IH8CC3m0QujEfTkXRyK1fMwzLjT9oL79ncRq4gQROOR1pxLz0P+hxFh+EeulUv7ALgxD1UB8Q==
X-Received: by 2002:a05:6000:2409:b0:3cb:a937:a35f with SMTP id ffacd0b85a97d-3e7659c78a6mr16726226f8f.23.1758034980802;
        Tue, 16 Sep 2025 08:03:00 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm932154f8f.47.2025.09.16.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:03:00 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 3/9] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Date: Tue, 16 Sep 2025 16:02:39 +0100
Message-ID: <20250916150255.4231-4-biju.das.jz@bp.renesas.com>
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

Document the Renesas RZ/G3E USB3.2 Gen2 Host Controller (a.k.a USB3HOST).
The USB3HOST is compliant with the Universal Serial Bus 3.2 Specification
Revision 1.0.
 - Supports 1 downstream USB receptacles
     - Number of SSP Gen2 or SS ports: 1
     - Number of HS or FS or LS ports: 1
 - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
   High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps).
 - Supports all transfer-types: Control, Bulk, Interrupt, Isochronous, and
   these split-transactions.
 - Supports Power Control and Over Current Detection.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added Rb tag from Rob.
v1->v2:
 * Added ref to usb-xhci.yaml
 * Dropped Rb tag
---
 .../bindings/usb/renesas,rzg3e-xhci.yaml      | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
new file mode 100644
index 000000000000..98260f9fb442
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,rzg3e-xhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3E USB 3.2 Gen2 Host controller
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+properties:
+  compatible:
+    const: renesas,r9a09g047-xhci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Logical OR of all interrupt signals.
+      - description: System management interrupt
+      - description: Host system error interrupt
+      - description: Power management event interrupt
+      - description: xHC interrupt
+
+  interrupt-names:
+    items:
+      - const: all
+      - const: smi
+      - const: hse
+      - const: pme
+      - const: xhc
+
+  clocks:
+    maxItems: 1
+
+  phys:
+    maxItems: 2
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - power-domains
+  - resets
+  - phys
+  - phy-names
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@15850000 {
+      compatible = "renesas,r9a09g047-xhci";
+      reg = <0x15850000 0x10000>;
+      interrupts = <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 757 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 756 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 755 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "all", "smi", "hse", "pme", "xhc";
+      clocks = <&cpg CPG_MOD 0xaf>;
+      power-domains = <&cpg>;
+      resets = <&cpg 0xaa>;
+      phys = <&usb3_phy>, <&usb3_phy>;
+      phy-names = "usb2-phy", "usb3-phy";
+    };
-- 
2.43.0


