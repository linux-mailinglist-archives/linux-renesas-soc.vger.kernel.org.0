Return-Path: <linux-renesas-soc+bounces-21671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E86AB504EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 20:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D017C5E5FEB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 18:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622473629BC;
	Tue,  9 Sep 2025 18:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4MMJC/M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4231235FC33;
	Tue,  9 Sep 2025 18:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441294; cv=none; b=stcPDMG5jwVh/VtIZGmrfkcCnug1Vo9QvmCKVs2T81pUCpllYTUhP0QBK3dHYouwxBrTOzChojF1P/f4xXMXdf2KRt1SMPEdo1XFc6YVgFDYvqB76Yr/+IOyfc8D1AhuyIR4ODoRzxFxngGyl4uMl1Y0N94925W4MyzLUkqIh2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441294; c=relaxed/simple;
	bh=OdtKJQmlyErziXsAftC7HkVwrq+X+a5XdpUCXwyoOb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/QswkZc7mBrFvCMxnuUMpDU9r4OR+b+bPmwgnzYZAudCEOIZ0bzxn0Oc45PScn9J1s8oUbHar3Cbs0X4mI6Bc8JSA1Zgm8JHiDlBCTa4OcV31Vj7tbTSIxvqET681hTi3Yn17NNVlI6Aexp3fPeJItXYj42ba9XUq2NSyhwitI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4MMJC/M; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso36955055e9.3;
        Tue, 09 Sep 2025 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441290; x=1758046090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZIKL+rUO0r79NPZf7sSA/UVTlRM0lguVa2E/cX794s=;
        b=h4MMJC/MdsxaNRJ7nuEnXQREfvwxS91ToPjAVi8+pJQI0FaQl0nJFRKeLaYIB0XdSe
         y5ZOR5FEniUEWUcfTyhIjUkzG0jpALazKy7zMY56HrjSiNjvVovr015VMWt/Wf5V24s/
         A22y4INDEwxQD8j4/sMQm/r/uY/264kL/YWOkGTRg4dCJAEjCTys4vzUtG3kOei44T9R
         wdsxLl0a6jFyqGWo1fEPE4uGsZu6+rYeILTDfQ1AbB+eiINegBmSWaRXLt4K6xTaPCJ2
         Od0VHV2clcIN7/A6YDw5JEwvkArcOnoHLEtiPBlg7WaftCJ5JXiyKDVUYK2dWextSxnW
         +mGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441290; x=1758046090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZIKL+rUO0r79NPZf7sSA/UVTlRM0lguVa2E/cX794s=;
        b=LdNjbEQRMLLKbWEFNWji+scdb/FlvfrtljanaM8Y0B1Cf3iRak27p6weCzIu2vUpZF
         e9JEQclc14FXoER6wYl2gR7E1rQHb04ExgayBZycCwjqSK6pbAlZDTu9FRi33XciJYt9
         VkzwlLBkBJKvl9WWsW6topmKb3LDGbG/V3zS4KNvGR67ZK2PoHgoB7C6HOhoTcoSvKa7
         D2rgIGqujOc39X5fsPhoeBqCuikPF+75Q6yuKspS6hF7rD1d5y9yNkeh3bn9nN0viAzV
         0TqQOxH9VaTZ5IY/7/aeKN6ImfRaiNti3qx/2sTeBomC+z4tqMVe+uR4+b6Wbw1jeq94
         rVsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXns2cfXZJlG0YxqKFBVGd8Uhhc0ZgSuYry/fX4UZHwSA8dgrEh36w2AyFvlZQjlK/AZB4NjIFLRR95qMQ@vger.kernel.org, AJvYcCVQjVGrtUVjwwyk3AUv+hoJBXPGJvJ24iN3jOwvA24vp9OculC9CfJiWilqCdccR/YtBoDStMoTTR9L@vger.kernel.org, AJvYcCVTjr6ezYEryehTbYGaWPZPGzO1LH7nM11B5jvRtLg/OW0Xkwkas4R2vu/33oaauTrGuLTx6VP1oZtV@vger.kernel.org, AJvYcCVhSepm1WA1gpsA5hvK6v5tYoaKtPstdjXglGwHgkpFc/PgwgNhlZdMXUnPJhQVMqZAXxYYEJMRkj/4vZXGnX5PUWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YziwwFenriuMTXVUYNlAsXvjxPULCqZK8mDbPhvywyXz6lS72kV
	59ccDth8bBf0XsFDSs2pTmx4L1oxWt6wU7rgpQtFVhZEyxeTwgRRXtqk
X-Gm-Gg: ASbGnctKszzvOa5db0g0vp3SFeXOQpuMhvotn/F6q1tMlfuYtA/Rg8iFmnBA3pJtxkl
	DGUxpMjUKazXmu4bM5c7gRLeXl+nUNcmWJ5VJP6oEPHGEAylaZYwAKJOugGfRAZqqslctjqMC16
	nTLBoG1qD2SZBtuKPtaWOFrkbS6O63Rp44V5UreoCZQkoUPOZACXyL+M1lnE0rG9YAWOFtBwrHT
	VGFYFYDBYGBmD+vY0k1VNXhpqtZm6/32hg2w5kbTs78lTRz/+c5NMyY2HFQdlD0PVwUyXJriDC4
	FOYnCqipWFEfJnYcXbdwK1j9tJFs2x5mBaZAs+lQWPVvxQYz+YX9izM/0bBZMm/aVHFCBT0ZVnS
	dG1KQa5pxOnIUEoUC7TwKXybl613IbtMyBPBmI4L7DLd4QH7Be0fGoUODqpaEr4WDxgiRz6wtal
	Ey1zMahxXlZc4Q
X-Google-Smtp-Source: AGHT+IHTJitgP/IYfTFqVm4o/vmvGMtIVfsFgqcx6kGCxKzg94646Rpr/e/kxg4G4edGYiUWdQuzQw==
X-Received: by 2002:a05:600c:6298:b0:459:d451:3364 with SMTP id 5b1f17b1804b1-45dddecdaa7mr122803595e9.24.1757441290399;
        Tue, 09 Sep 2025 11:08:10 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df679a4c9sm4174015e9.3.2025.09.09.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:08:10 -0700 (PDT)
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
Subject: [PATCH v2 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Date: Tue,  9 Sep 2025 19:07:51 +0100
Message-ID: <20250909180803.140939-7-biju.das.jz@bp.renesas.com>
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
---
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


