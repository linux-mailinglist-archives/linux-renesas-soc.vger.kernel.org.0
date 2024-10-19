Return-Path: <linux-renesas-soc+bounces-9902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 570AB9A4C41
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Oct 2024 10:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7813E1C20E72
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Oct 2024 08:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF7B1E04B6;
	Sat, 19 Oct 2024 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GxO/WZMs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25E1E009C
	for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Oct 2024 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327684; cv=none; b=aiEfnin4fdjEOXubBLpqzznGwJeSPJUf+7Ys/3cZkPFGYlBWfi6i07vqkYQIPgZ2XZKtITOelHMWv+RzmVUCr8OhC/MKXVCLShcK7R7Rw6sabp032WGSaXEMzkf0V5DfEEewvIuUz3C+5lR7/L99KFdnLulFmDtIFOihgC+0S4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327684; c=relaxed/simple;
	bh=0nyGTQ0S9tANce3jH3/GPn/BPO9i8PA8ogV7QfAeZgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aTKrLxxMGc+WOSawv0tPMXAMFg5+krZgsRCLpiU7vICcWC3vckhImvNFoGaVxDcNKq0tISeH7oIddhs/lp5PIKfc+dGibZh/7MXPJdC86PLpv1dR/9q5uuDn9+tzusAeh69C48ZTMZ8IOXZMsCPHk1yUHTl24r77pXmtkmV/QCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GxO/WZMs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43161c0068bso13762415e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Oct 2024 01:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327681; x=1729932481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxllZ9cfpYLn8XB0jhlEujoms+pf5ypaVvxphLqZAZU=;
        b=GxO/WZMsyGAiMZo8AbbqroIiPvBvaNMZF/ROgpYoqsfwGeKs2ZFryMtyqhW0Vo26KJ
         2mrNkoUd9Nmz24Awp1vWKxz65nmvQQvDuO+Tmln5/3r7fhBenDzcCH7yaHOrh3rX8xIM
         BPd53PoS80pW/w0RJ1PAYvYq9cbijGMKFRHavlyP/g6iYAONFeXalS4FIiiC0QvZM0Pm
         dWXD4WjzX9lCDyx74W+W+JA3umbpqO4qHbvnD4lqTy9HJXQZoAwibBQyy+OgegCAUvPe
         zgAnVU/SZwkSNsVdhKsNkJTt0CQMmsStOPmpxo4M/nD04jyNIEpVJt6g03ksRr7G+xjl
         bRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327681; x=1729932481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxllZ9cfpYLn8XB0jhlEujoms+pf5ypaVvxphLqZAZU=;
        b=ixZXWI564WSNBc1wY3KmMcRTbCfF/0rLbEAmwDtFF1hqMY8poPdVGqhqQ+7fXFhYjT
         Dxw4hkdjHEbnBaGxaPrhHpUMxyuGiCOkonimtRHO64j95hn1deeNfAXmKOuqlWLGHEar
         SDVVmvXt4v/NwozMrxlEAJ4DjnuzZDSPdpGyrl7yWxjfiUNkW8NtD4RcjT6NOEv/tcw9
         e73T414LpqaM+FxiLgv5Eoe3Rokl9GsUw1cVED23tEDDGu25ZQwI7jfHejSxM1wR+tFH
         RaGHMpTBoghWjO21snlSIZjhFBsfX+THPVrZrrICK9W9ccMZ3SNM9FsAHTjbPa0S3j8h
         g6Ew==
X-Gm-Message-State: AOJu0YwcrJ7WAL4YE0v7BbxCjdAdb0Q+QgLghvVFgxoYPhZbb5Kv9BZd
	9AJx7M1Ya9Dr+Dul59wtrp50fQLBF21/iw5EnKZmHqaODjnuyATjz8jEa78yo3w=
X-Google-Smtp-Source: AGHT+IHEEmDIsAUbKEywuBfYGHtLGgJje1LXuZaP56VpldMdG2ei0MMJIZx/tutRtcE/V7pfK9evVA==
X-Received: by 2002:a05:600c:4751:b0:430:563a:b20a with SMTP id 5b1f17b1804b1-431616494a9mr41362325e9.11.1729327680775;
        Sat, 19 Oct 2024 01:48:00 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:48:00 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 06/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
Date: Sat, 19 Oct 2024 11:47:32 +0300
Message-Id: <20241019084738.3370489-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
The RTC IP available on Renesas RZ/V2H is almost identical with the
one found on Renesas RZ/G3S (it misses the time capture functionality
which is not yet implemented on proposed driver). For this, added also a
generic compatible that will be used at the moment as fallback for both
RZ/G3S and RZ/V2H.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags
- dropped the assigned-clocks, assigned-clock-parents properties from the
  example, along with r9a08g045-vbattb.h inclusion; these were moved
  to the VBATTB example as it fits better in there since these are
  related to the VBATTB but not to the RTC;

  Rob, I haven't dropped your Rb tag for this; please let me know if you
  consider it otherwise.

Changes in v3:
- added RTC bus clock, reset and power-domain; it has been detected
  by reverse engineering that RTC and VBATTB clock, reset and power
  domain are shared; HW manual doesn't mention it
- updated example with these and with assigned-clock properties
  needed to configure the VBATTCLK MUX with proper parent
- updated example section with dt-bindings/clock/r9a08g045-cpg.h
  and dt-bindings/clock/r9a08g045-vbattb.h includes
- for all these, dropped Conor's Rb tag

Changes in v2:
- updated patch description and title
- included reference to rtc.yaml
- updated compatible list with a generic compatible as explained in
  patch description; with this the node in examples section has also been
  updated
- used items to describe interrupts, interrupt-names, clock, clock-names
- updated title section

 .../bindings/rtc/renesas,rz-rtca3.yaml        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
new file mode 100644
index 000000000000..f1e9d01633c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/renesas,rz-rtca3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RTCA-3 Real Time Clock
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a08g045-rtca3 # RZ/G3S
+      - const: renesas,rz-rtca3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Alarm interrupt
+      - description: Periodic interrupt
+      - description: Carry interrupt
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: period
+      - const: carry
+
+  clocks:
+    items:
+      - description: RTC bus clock
+      - description: RTC counter clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: counter
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: VBATTB module reset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@1004ec00 {
+        compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
+        reg = <0x1004ec00 0x400>;
+        interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "alarm", "period", "carry";
+        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattclk VBATTB_VBATTCLK>;
+        clock-names = "bus", "counter";
+        power-domains = <&cpg>;
+        resets = <&cpg R9A08G045_VBAT_BRESETN>;
+    };
-- 
2.39.2


