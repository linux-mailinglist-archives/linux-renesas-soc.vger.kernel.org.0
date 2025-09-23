Return-Path: <linux-renesas-soc+bounces-22220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11714B9669F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 16:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1CF33AB458
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 14:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3E725949A;
	Tue, 23 Sep 2025 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB85I1+j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB75242D83
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 14:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638733; cv=none; b=KnHrcfDB6aLkKzJ2AD82FzxNl6nba/CH2qKj9Fmql9GXlCfQt5PuDpnF0IdwdZVcb28m4PXUKFq4V/Eh2nYpVZGMwtYiF8s0Pz282kCsePbusSa9Zla5AnGRHRhM31Q/hVEq3q90s7s//FpqE7lyZfgI9nYqn3fH3q21dhFVHhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638733; c=relaxed/simple;
	bh=v/6yP43Xas8IL2SDwh5MqBaXKzliC0aaemzEd5pY6i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OaUq5SNo0yyGSkYg8tGKV1ZZLcnYjGA/KsS4E334KP8VpXFNdwLpeM5mjV9iZOmTIjRZQQgt7UTlS2dDzvbBhqPYJGhzaC3YHu2VBJdA7AXsRYNdpBdXNvhSXHuhyjtcPHM5U4l/j4VtE7dSr/Kw9xUxiiU2R6rh4Ra+D0GD14g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB85I1+j; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46cb53c5900so28858705e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758638728; x=1759243528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hWknpiUnT9ncdcJYksHsytZcbFmlaZdO2Pms9xtMZQ=;
        b=OB85I1+ji4vjyb+s8CmATtkF+FseZjwU1pri18ws6xcn4Ppcu5gLemhXK0VwISNU5R
         ujbQPQFHRLMN0f4pIAtWpu8fclGhlW+o+Oqfr7vRo9WLDNnRjpQdvnucdBON8VhV0pvq
         Saz7Na/6gORltaeBsQuYLt2QImlV11us4MuWQD7FNzDbX5H7OTXWf/McQMJKHZ8hFkyT
         VZmvoXr0Jv1dS+hKVXHPN4LjQUorCxfmeJIj5R4cVenurmJSkAi3poo8bQ9wqBnNCBvr
         0p78RXUhJJIqKHYk4mlZELF7GXULpFgAdS6vrYduEwxO26TDRKRN4vL2Hu3ylBsn+eKk
         1lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638728; x=1759243528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hWknpiUnT9ncdcJYksHsytZcbFmlaZdO2Pms9xtMZQ=;
        b=we105NEauKJdUU26/l52XY474810ZQYp0Hl+80isPJNyRYa4L++v8ZUF26Ew7yoC7U
         48LXyJ4ks84GfysvVpd+9TLQVFgQFdhWTy0c5Tw0T+NnCxIyIhrht35fZSQVv7h1WKPG
         dpAcD2NJ4Ta/If76GTW3Z1iWlIosMK27Jlgk0J5ICbI4ZVb1pLX19IWfZFHQ8/DS2dV4
         TsjofPZmlMGBqRne7e5u+80IOZAqB1QTXaPQ4pYYtH0ICBimEpMD3576eAGckNUT/Nmt
         C2I6xrnpChHIdA12xjsSZP5vPin0+7LHEkPuUOPhcLRHkPYg+vgUnnCdmj6ohHfhR66b
         HRrg==
X-Forwarded-Encrypted: i=1; AJvYcCWNzOjlUbccz7GMlY4kctfdHOAx7aTlIpC52uSbQ/HFVk5jRYQq9RsqzuVcmySw+LA6ExEiPPsTvr/A7DpF/8qJtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyziAPrCzftseiEHm0yPwP+d5N93K8x22UUOa39vWCK0diewwkd
	ABy8KihXAH6q7oLnua8e4tYnNuA4R1tJMD59iaE8aFkYZS+A80K13pca
X-Gm-Gg: ASbGncu8bWXXB4ahyG6Z3edaBo13CKxtUHEyaEJXE4zhtztZFLPDPHb1S6yvGp4mzCV
	rRx+UOlQinxDcJyXPDMq+kpAao0ck2PaG/8MUD5rhh24chIr0Wv6gA4p8JCUG1RhZZNGkhcj+zx
	jwOVh2qi4x9sAcuF9vSylzDZ0JE/NZ9xwrThbWieqMdAJTet81UV1MoQBJ019Io951Qwhbw+f80
	KQ9jb2m4kUVi4iKIekaemosAwaX/W0C4r1YaeHsasOAf9ZpisfxhhcK8hYvLj7sNfc8dchmHcC3
	18Ok5FlicQwROZL0eb4QxQEtGM3Avy1kS9VDdGBIceG9jZwYo0UyRQXHPb3rNTEe0vUPXjbQqp4
	eZYltq4Na50WRIvZa+HKI7Ix4X2ZCiRbV60Ry9fXmsQUi4wH1tbl3fwo4Ucp4/I0Ua5ve8289WC
	9xrA==
X-Google-Smtp-Source: AGHT+IEfEIkKW4I9tGlw8bA5Jwg+sH3rB4c1YHW3qG0pAgSBH5W2hvRjK+Ule13vT0cVygKWhd9FoQ==
X-Received: by 2002:a05:600c:4595:b0:45f:2bc1:22d0 with SMTP id 5b1f17b1804b1-46e1dac9c58mr29386395e9.33.1758638727687;
        Tue, 23 Sep 2025 07:45:27 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac3fdsm238940435e9.1.2025.09.23.07.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:45:27 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 1/8] dt-bindings: pwm: Document RZ/G3E GPT support
Date: Tue, 23 Sep 2025 15:45:05 +0100
Message-ID: <20250923144524.191892-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923144524.191892-1-biju.das.jz@bp.renesas.com>
References: <20250923144524.191892-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document support for the GPT found on the Renesas RZ/G3E (R9A09G047)
SoC.

The GPT is a 32-bit timer with 16 hardware channels (GPT0: 8 channel
and GPT1: 8channels). The hardware supports simultaneous control of
all channels. PWM waveforms can be generated by controlling the
up-counter, downcounter, or up- and down-counter.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v2->v3:
 * Added Rb tag from Rob.
v1->v2:
 * Created separate document for RZ/G3E GPT.
 * Updated commit header and description.
---
 .../bindings/pwm/renesas,rzg3e-gpt.yaml       | 323 ++++++++++++++++++
 1 file changed, 323 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml

diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml
new file mode 100644
index 000000000000..cb4ffab5f47f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml
@@ -0,0 +1,323 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/renesas,rzg3e-gpt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3E General PWM Timer (GPT)
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  RZ/G3E General PWM Timer (GPT) composed of 16 channels with 32-bit
+  timer. It supports the following functions
+  * 32 bits x 16 channels.
+  * Up-counting or down-counting (saw waves) or up/down-counting
+    (triangle waves) for each counter.
+  * Clock sources independently selectable for each channel.
+  * Four I/O pins per channel.
+  * Two output compare/input capture registers per channel.
+  * For the two output compare/input capture registers of each channel,
+    four registers are provided as buffer registers and are capable of
+    operating as comparison registers when buffering is not in use.
+  * In output compare operation, buffer switching can be at crests or
+    troughs, enabling the generation of laterally asymmetric PWM waveforms.
+  * Registers for setting up frame cycles in each channel (with capability
+    for generating interrupts at overflow or underflow)
+  * Generation of dead times in PWM operation.
+  * Synchronous starting, stopping and clearing counters for arbitrary
+    channels.
+  * Count start, count stop, count clear, up-count, down-count, or input
+    capture operation in response to a maximum of 8 ELC events.
+  * Count start, count stop, count clear, up-count, down-count, or input
+    capture operation in response to the status of two input pins.
+  * Starting, clearing, stopping and up/down counters in response to a
+    maximum of four external triggers.
+  * Output pin disable function by detected short-circuits between output
+    pins.
+  * A/D converter start triggers can be generated.
+  * Compare match A to F event and overflow/underflow event can be output
+    to the ELC.
+  * Enables the noise filter for input capture.
+  * Logical operation between the channel output.
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r9a09g047-gpt  # RZ/G3E
+
+  reg:
+    maxItems: 1
+
+  '#pwm-cells':
+    const: 3
+
+  interrupts:
+    items:
+      - description: Input capture/compare match of the GTCCRA for channel GPT{0,1}.0
+      - description: Input capture/compare match of the GTCCRB for channel GPT{0,1}.0
+      - description: Compare match with the GTCCRC for channel GPT{0,1}.0
+      - description: Compare match with the GTCCRD for channel GPT{0,1}.0
+      - description: Compare match with the GTCCRE for channel GPT{0,1}.0
+      - description: Compare match with the GTCCRF for channel GPT{0,1}.0
+      - description: A and B both high interrupt for channel GPT{0,1}.0
+      - description: A and B both low interrupt for channel GPT{0,1}.0
+      - description: Input capture/compare match of the GTCCRA for channel GPT{0,1}.1
+      - description: Input capture/compare match of the GTCCRB for channel GPT{0,1}.1
+      - description: Compare match with the GTCCRC for channel GPT{0,1}.1
+      - description: Compare match with the GTCCRD for channel GPT{0,1}.1
+      - description: Compare match with the GTCCRE for channel GPT{0,1}.1
+      - description: Compare match with the GTCCRF for channel GPT{0,1}.1
+      - description: A and B both high interrupt for channel GPT{0,1}.1
+      - description: A and B both low interrupt for channel GPT{0,1}.1
+      - description: Input capture/compare match of the GTCCRA for channel GPT{0,1}.2
+      - description: Input capture/compare match of the GTCCRB for channel GPT{0,1}.2
+      - description: Compare match with the GTCCRC for channel GPT{0,1}.2
+      - description: Compare match with the GTCCRD for channel GPT{0,1}.2
+      - description: Compare match with the GTCCRE for channel GPT{0,1}.2
+      - description: Compare match with the GTCCRF for channel GPT{0,1}.2
+      - description: A and B both high interrupt for channel GPT{0,1}.2
+      - description: A and B both low interrupt for channel GPT{0,1}.2
+      - description: Input capture/compare match of the GTCCRA for channel GPT{0,1}.3
+      - description: Input capture/compare match of the GTCCRB for channel GPT{0,1}.3
+      - description: Compare match with the GTCCRC for channel GPT{0,1}.3
+      - description: Compare match with the GTCCRD for channel GPT{0,1}.3
+      - description: Compare match with the GTCCRE for channel GPT{0,1}.3
+      - description: Compare match with the GTCCRF for channel GPT{0,1}.3
+      - description: A and B both high interrupt for channel GPT{0,1}.3
+      - description: A and B both low interrupt for channel GPT{0,1}.3
+      - description: Input capture/compare match of the GTCCRA for channel GPT{0,1}.4
+      - description: Input capture/compare match of the GTCCRB for channel GPT{0,1}.4
+      - description: Compare match with the GTCCRC for channel GPT{0,1}.4
+      - description: Compare match with the GTCCRD for channel GPT{0,1}.4
+      - description: Compare match with the GTCCRE for channel GPT{0,1}.4
+      - description: Compare match with the GTCCRF for channel GPT{0,1}.4
+      - description: A and B both high interrupt for channel GPT{0,1}.4
+      - description: A and B both low interrupt for channel GPT{0,1}.4
+      - description: Input capture/compare match of the GTCCRA for channel GPT{0,1}.5
+      - description: Input capture/compare match of the GTCCRB for channel GPT{0,1}.5
+      - description: Compare match with the GTCCRC for channel GPT{0,1}.5
+      - description: Compare match with the GTCCRD for channel GPT{0,1}.5
+      - description: Compare match with the GTCCRE for channel GPT{0,1}.5
+      - description: Compare match with the GTCCRF for channel GPT{0,1}.5
+      - description: A and B both high interrupt for channel GPT{0,1}.5
+      - description: A and B both low interrupt for channel GPT{0,1}.5
+      - description: Input capture/compare match of the GTCCRA for channel GPT{0,1}.6
+      - description: Input capture/compare match of the GTCCRB for channel GPT{0,1}.6
+      - description: Compare match with the GTCCRC for channel GPT{0,1}.6
+      - description: Compare match with the GTCCRD for channel GPT{0,1}.6
+      - description: Compare match with the GTCCRE for channel GPT{0,1}.6
+      - description: Compare match with the GTCCRF for channel GPT{0,1}.6
+      - description: A and B both high interrupt for channel GPT{0,1}.6
+      - description: A and B both low interrupt for channel GPT{0,1}.6
+      - description: Input capture/compare match of the GTCCRA for channel GPT{0,1}.7
+      - description: Input capture/compare match of the GTCCRB for channel GPT{0,1}.7
+      - description: Compare match with the GTCCRC for channel GPT{0,1}.7
+      - description: Compare match with the GTCCRD for channel GPT{0,1}.7
+      - description: Compare match with the GTCCRE for channel GPT{0,1}.7
+      - description: Compare match with the GTCCRF for channel GPT{0,1}.7
+      - description: A and B both high interrupt for channel GPT{0,1}.7
+      - description: A and B both low interrupt for channel GPT{0,1}.7
+
+  interrupt-names:
+    items:
+      - const: gtcia0
+      - const: gtcib0
+      - const: gtcic0
+      - const: gtcid0
+      - const: gtcie0
+      - const: gtcif0
+      - const: gtcih0
+      - const: gtcil0
+      - const: gtcia1
+      - const: gtcib1
+      - const: gtcic1
+      - const: gtcid1
+      - const: gtcie1
+      - const: gtcif1
+      - const: gtcih1
+      - const: gtcil1
+      - const: gtcia2
+      - const: gtcib2
+      - const: gtcic2
+      - const: gtcid2
+      - const: gtcie2
+      - const: gtcif2
+      - const: gtcih2
+      - const: gtcil2
+      - const: gtcia3
+      - const: gtcib3
+      - const: gtcic3
+      - const: gtcid3
+      - const: gtcie3
+      - const: gtcif3
+      - const: gtcih3
+      - const: gtcil3
+      - const: gtcia4
+      - const: gtcib4
+      - const: gtcic4
+      - const: gtcid4
+      - const: gtcie4
+      - const: gtcif4
+      - const: gtcih4
+      - const: gtcil4
+      - const: gtcia5
+      - const: gtcib5
+      - const: gtcic5
+      - const: gtcid5
+      - const: gtcie5
+      - const: gtcif5
+      - const: gtcih5
+      - const: gtcil5
+      - const: gtcia6
+      - const: gtcib6
+      - const: gtcic6
+      - const: gtcid6
+      - const: gtcie6
+      - const: gtcif6
+      - const: gtcih6
+      - const: gtcil6
+      - const: gtcia7
+      - const: gtcib7
+      - const: gtcic7
+      - const: gtcid7
+      - const: gtcie7
+      - const: gtcif7
+      - const: gtcih7
+      - const: gtcil7
+
+  clocks:
+    items:
+      - description: Core clock (PCLKD)
+      - description: Bus clock (PCLKA)
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: Reset for bus clock (PCLKA/PCLKD)
+      - description: Reset for core clock (PCLKD)
+
+  reset-names:
+    items:
+      - const: rst_p
+      - const: rst_s
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
+  - reset-names
+
+allOf:
+  - $ref: pwm.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pwm@13010000 {
+        compatible = "renesas,r9a09g047-gpt";
+        reg = <0x13010000 0x10000>;
+        interrupts = <GIC_SPI 538 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 554 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 562 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 570 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 586 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 594 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 539 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 555 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 563 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 571 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 579 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 595 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 540 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 548 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 556 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 572 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 580 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 588 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 596 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 541 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 549 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 557 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 573 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 581 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 589 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 597 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 542 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 550 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 558 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 566 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 574 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 582 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 590 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 598 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 543 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 551 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 559 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 567 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 575 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 583 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 591 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 599 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 544 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 552 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 560 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 568 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 584 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 600 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 553 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 561 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 569 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 577 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 585 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 593 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "gtcia0", "gtcib0", "gtcic0", "gtcid0",
+                          "gtcie0", "gtcif0", "gtcih0", "gtcil0",
+                          "gtcia1", "gtcib1", "gtcic1", "gtcid1",
+                          "gtcie1", "gtcif1", "gtcih1", "gtcil1",
+                          "gtcia2", "gtcib2", "gtcic2", "gtcid2",
+                          "gtcie2", "gtcif2", "gtcih2", "gtcil2",
+                          "gtcia3", "gtcib3", "gtcic3", "gtcid3",
+                          "gtcie3", "gtcif3", "gtcih3", "gtcil3",
+                          "gtcia4", "gtcib4", "gtcic4", "gtcid4",
+                          "gtcie4", "gtcif4", "gtcih4", "gtcil4",
+                          "gtcia5", "gtcib5", "gtcic5", "gtcid5",
+                          "gtcie5", "gtcif5", "gtcih5", "gtcil5",
+                          "gtcia6", "gtcib6", "gtcic6", "gtcid6",
+                          "gtcie6", "gtcif6", "gtcih6", "gtcil6",
+                          "gtcia7", "gtcib7", "gtcic7", "gtcid7",
+                          "gtcie7", "gtcif7", "gtcih7", "gtcil7";
+        clocks = <&cpg CPG_MOD 0x31>, <&cpg CPG_MOD 0x31>;
+        clock-names = "core", "bus";
+        power-domains = <&cpg>;
+        resets = <&cpg 0x59>, <&cpg 0x5a>;
+        reset-names = "rst_p", "rst_s";
+        #pwm-cells = <3>;
+    };
-- 
2.43.0


