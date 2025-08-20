Return-Path: <linux-renesas-soc+bounces-20776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BE8B2E3CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92F865E586B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C18D3570A4;
	Wed, 20 Aug 2025 17:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX/G8C6+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BC334F475;
	Wed, 20 Aug 2025 17:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710305; cv=none; b=FB062jbEYmJ6uSW/ZGUZ9dy3CQCPlj3m2KzXfPvVosnJm1LmWk+wPDg8vigB5AcN5HE7Q3riACbOxZXFMe8KBRSaGrM6gyLh4rkdJ3EuPDWbegMXE1KZi77CemJLSDaDFG3drpDjXcatQqOU6ZvCMEa7gUPDVN7g19sfgSYc30w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710305; c=relaxed/simple;
	bh=I1ofPsIkGvXqbL4BLZhEO9v+7eqz5Xootqr+cHXiHxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwPlQv2y0p+XhLF04Tbf1wUJqyrCpSbUi+6+gkv3TtGNFI1p/86j4TQspUkiHyS0kLjNmgjFSI5jPCnu9AdfE2lveQ2lYJR9OSL0isvVB9qEH9WQ3456XVYPa4e5zL+7+8/y5q6ayRcZD4c/WJQfoO/22EKoJ227A1JNS7cbMMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX/G8C6+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a28ff47a0so793885e9.0;
        Wed, 20 Aug 2025 10:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710299; x=1756315099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+k9NXtsiM1hDvtm6L9b3a34R7qCc4nBnvLks5rpzP4E=;
        b=EX/G8C6+B3d4MsPVfY3YmXds5pNk6W1CuH7WSoKSMjn0uiDphFBSd7VbfAV4Yxlwnn
         5WyBPluYhlsIgDyCJnCHhsLoOT4lae5wIyDe3+pDZsF1auZe4JGWXxPjlYhKNmoPBEoy
         DRlcOwnkNiHo4i8pI+PpQ9Jm6pvg2+Pwc+HMzmjDwY4WIju2TpD0suUOohTk8SxLa8US
         lg/e06Pe5JxiRJyUFRFmlqyS0eFI4mQbovJbx+pING7+FRV7v9xnmfwbXCJo2otAkVJI
         Qk461IGxlb2nSCWJmQxTgvU2tNV9bc/tgd/xpzHTdE1BomF+OV7tHfZJxc9ujDu60N+G
         kh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710299; x=1756315099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+k9NXtsiM1hDvtm6L9b3a34R7qCc4nBnvLks5rpzP4E=;
        b=SjGzhWdWydqOn3YRhU2nNMmDwBlDm3GdWa4eeGQDPuYZbdXsKapxaJ3aDsLklac7PK
         JXoZCLm104rNgOcJX32BCTgnaoqHgHHVaZ39RbV6ePDPHvOo4ISAMRFu/g69l/UhBAlH
         5VFiXkHwtqnOtyQdaz/onL0qP07INnejIC0fJRyOZs7FcEl1ayo1bNf1qwqdWafNCT62
         TLE4mUk2xDm+Iz3sZvaEBl4F+xjbmvdiZ6VEn9+HwSXW4osWNHL6vb/X/5HiJvA45XpL
         hNfLZdkxg2j5bVGWZ0RT0Feyz5+3uDXOFrMuwLjgCfLILOmHvfht/1rhaw3R9ptJe3ws
         g0PA==
X-Forwarded-Encrypted: i=1; AJvYcCUANlQGXGfmL8FQImktfEsAqs+63CWo9bb6c9gSUOqP7k2AdV/VIExLM/ICHpBsEhx6WOQD9N9zg+Ws@vger.kernel.org, AJvYcCVdJ87aSGDq9JhUDUi5ANzHvBc4lhxc5uv8q8O4qUWcYTV89+vc9YSZ/bNQ74eM9A920c+HGXy4I2qUHpbB@vger.kernel.org, AJvYcCWKwDtOseZKFxUQWPKR84LzpLwncs8yjoFfjgPGkWXV2fhZCz6Z1psEMHtPh0TzJr/BqGmm6nLBM1dO2tdMezic/+Y=@vger.kernel.org, AJvYcCWxEpScj4E+w/cEpn//W6SiKSSezJlgB6wUWfdbZ49nckY+k8nR6p8geefNjMVw2K8ltbAsWwRJ9m8h@vger.kernel.org
X-Gm-Message-State: AOJu0YyB3dIw4sh+PDGIm/INHIWmApQMfd7Xl66/1SUUUbMSYZQ/mC7D
	VAjSyjXXhUGSPM+T/m0GkVaEaX+Ut05M9RAhE7hr+jCEBN7velfULaYX
X-Gm-Gg: ASbGncsWz/U5dYD2m9odpPTmBDZkGiMJm72JG9q6kb5C/CwLV4JfzSIcRJfXMB1Ywr4
	x8rqezH5+9RmHk6uxegryvkU+kwaCQItNzSYVhgqQnBDCL0yk4PsyzionflRkxNFvOOW9TbM+06
	ik0PNImLThXwelzcBYdo4h1ZtAI2poo5moRK9VeM9g/cyhfblqv6s11WnLHARixOwKrZ0zlpWTP
	78MEDzc9za8qNBBUErRZnW4Lr/kL9ZtucT7zaBEa8q2N364nBWWwIZshVi6RFmoLsaDVMLbIUZo
	6tMXjAgKpyv2rF8M12M/YeQHtIAtBwd4ZoRHRNVPPjoAXICIS6PJ8uV/lMFIIZBGUoo9UXfVFQj
	qzlOHmXISpuILoLOvpI/3T7vnw989j7vmq61VrJZbe0f2Lp7vi0oGC+YAfIKf+z0/NB2+INxDIp
	Q8r2ZcpKPD
X-Google-Smtp-Source: AGHT+IEQNkChJhHT/APmBj8n7fvBoadcxhNtH4N0Wq3oDHyg2Ypn1+knbE2BOCRSQ8OxvMQDS1dbKQ==
X-Received: by 2002:a05:600c:46d4:b0:456:8eb:a35c with SMTP id 5b1f17b1804b1-45b47a00b59mr35277315e9.31.1755710298542;
        Wed, 20 Aug 2025 10:18:18 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c2865dsm40319815e9.2.2025.08.20.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:18 -0700 (PDT)
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
Subject: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Date: Wed, 20 Aug 2025 18:17:53 +0100
Message-ID: <20250820171812.402519-7-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/usb/renesas,rzg3e-xhci.yaml      | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
new file mode 100644
index 000000000000..2f73ea2e1e78
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
@@ -0,0 +1,84 @@
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


