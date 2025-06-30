Return-Path: <linux-renesas-soc+bounces-18936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D981FAEE81A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 22:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 661BB1BC1C23
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 20:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C139E22FDF2;
	Mon, 30 Jun 2025 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7np1oE3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FC1221281;
	Mon, 30 Jun 2025 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751315010; cv=none; b=XHoGzsMx2gdqm4bHODAVIehXyk49skLVFlmWb8+54Vdc8H7qrMpvodobh3daIJACYHcLV+brCfb2DKuJcGjo9Ur66QNAmeST9w07Irj1y2aPGnaIEvdLzAnkmNlLmH4rHeKzVXKUhRdZPd2GRxNn8yPeitvljetshEuUzYIHD6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751315010; c=relaxed/simple;
	bh=/8DJjbLRpzn8h6yjM5nQT9QMImWnjpAlNmHtz/RluvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMIyTZSBmQ2RWufUBp9nz6wXIQdFTm5VXWwvbt2+rd4jnfN2ElRZGP7/POH1JX/E9X30t/AEmi7pxm1tOTMBqZyW6wVINGc9ttlNMvIiETqXKlBmi06ceN61sZXE0xGbYOCVLB3hdXOK4EVPKWIvU7XBkgHTJEXJL23QR4DY4RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7np1oE3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453749af004so26534075e9.1;
        Mon, 30 Jun 2025 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751315007; x=1751919807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSm5b2N+s6cLS/r0R+fGwy1pGElCb0YnFGyDH01M4j8=;
        b=e7np1oE3d16ZAElMX5F+yoOycqaj2juvqOCrPRKgvhVQklufKyhepP9RdapZdnKx4x
         yxEjc1XZhyvtuS5OzD1l/i1pxE59enVQ0rl00409aMWmAziOl3MGUgIqS7Wstyb6QHMK
         BWzHLcinQEcDCQdaDFEz99W85uecKFQNGjmMxARa1cDR5/G/wV9V7N56uEkMcyNXpwjD
         z4NbShW/N7tavA6+2BIWK75APehOxBoSsDKGt6weMV19s/CamXmux4ADmrV5wbQp9Nyr
         qASks5g296t7WZV63oVd3+/a2jiGcOlZXy+9Vw6waLbatl/OBHsGJYhspIZfY92C3Ww5
         jKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751315007; x=1751919807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSm5b2N+s6cLS/r0R+fGwy1pGElCb0YnFGyDH01M4j8=;
        b=ct0lPshta3gi8Q6afgpvkGR2cyOoDSnoaEMDvGWf9K3LI4SUqHnxjk11NXPv0cvC8u
         9b71u3Ai8lk67DWvjLb+/LUH8DD51gW6fxrqlPuke+rwLAq7TJ1gcpqxRGZX7CZUCO03
         FfTTGPL/TKtj5yR9TV6xl53+n6URBJ/Dmrw+AI3WEEDxoKGQvnL0KWDoN/y4fGueWw+7
         P/1iHC6iTlzSQTxnFM0c3AI8MYJM5Nl2xgFKNUDPLjyayvS05EHRH/aYDRVnNj/wpghE
         ho/l4Yt6Tf5P9Ceumtndr9aZ6guNhafz1K/ZEHDIidK6S4dUNFmKwYfUaItLDl6sM+Ul
         Fjog==
X-Forwarded-Encrypted: i=1; AJvYcCVVWUR+tkPDvyWZiHvLmibiImIgAFVzxUjmthvjk3dnYBrTPxYjGc4MjTzHATQPDNQlDddiSWV0iAAl2exZ@vger.kernel.org, AJvYcCVW8HRBF0a4OEV/FqOrPSecPK6Bg0quZFbpejPwC4PxUca2wV6ZDgVKaz1Iq9ZwSPuilwVmPzjb64Ei7uzEoIQQvXg=@vger.kernel.org, AJvYcCW55Mg7gyaa0BtK7RO6O/ZtVjfgg4UHeYSa6sw3DbzlIEX8hUEA228tg5EYWHLFtjLzM5Wclmw1Hys2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Ae8vmH42vvNyBgS30yIWkYMvJWxNjtZLzHqTIb9graOfZc77
	B7RjrWkwYsXBw7yLBKsctW1dh041xcqCl4L8HMvagT9jcs3wGsmIbUyj
X-Gm-Gg: ASbGnculOqZTzlN4WlduUKqTtVm13E1CaYDkhC5cVoqUz7d3Cvz5C9ZRf0nG8DX4fjZ
	sDylTeB49YbOfGWw2b1G+iZq8L5XFrdX/4Wbp6vaIwuzsxmx2qX7syW2VBnSJ5IpZ01iac1lRk2
	Yk79pWm6ivreka1D8pTgR+aMccdHFFrgH/7vmmUY7UYFXrOKtIhtowaIiIq3XDaAH1nb1aqh1g1
	mkRf3x4oIVb8R6LnoQ/INYYG6DTrHP/YLjl1SEEq1TXiVo8wUlV/Ma/ncfytRJRLOjxaVY2QkDp
	Sn0Zrah4LZmkPjDOKejGznEl1L1G7FngQNdrvwdg6xGGLgs8taRETzN5Xc3UcTEgR1m32WpMNPF
	ncSgvrH51Bb8=
X-Google-Smtp-Source: AGHT+IG3vceWMeuYOYPskzAnafa+nAvj4f0vu5vUS+G4zt8jMdSBtdirJNXDwZmLFDEUukeVlPK2Hg==
X-Received: by 2002:a05:600c:1c08:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-4539ab9c02bmr93279575e9.0.1751315006873;
        Mon, 30 Jun 2025 13:23:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a065:f77f:7ac4:1c25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5b7fsm148523195e9.10.2025.06.30.13.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 13:23:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v14 1/5] dt-bindings: serial: renesas,rsci: Add optional secondary clock input
Date: Mon, 30 Jun 2025 21:23:19 +0100
Message-ID: <20250630202323.279809-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630202323.279809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250630202323.279809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Update the RSCI binding to support an optional secondary clock input on
the RZ/T2H SoC. At boot, the RSCI operates using the default synchronous
clock (PCLKM core clock), which is enabled by the bootloader. However, to
support a wider range of baud rates, the hardware also requires an
asynchronous external clock input. Clock selection is controlled
internally by the CCR3 register in the RSCI block.

Due to an incomplete understanding of the hardware, the original binding
defined only a single clock ("fck"), which is insufficient to describe the
full capabilities of the RSCI on RZ/T2H. This update corrects the binding
by allowing up to three clocks and defining the `clock-names` as
"operation", "bus", and optionally "sck" for the asynchronous clock input.

This is an ABI change, as it modifies the expected number and names of
clocks. However, since there are no in-kernel consumers of this binding
yet, the change is considered safe and non-disruptive.

Also remove the unneeded `serial0` alias from the DTS example and use
the R9A09G077_CLK_PCLKM macro for core clock.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v13->v14:
- Dropped using `R9A09G077_CLK_PCLKM` macro in binding.

v12->v13:
- Rebased on latest linux-next.
- Updated commit message to clarify the ABI change.
- Used `R9A09G077_CLK_PCLKM` macro for core clock
---
 .../bindings/serial/renesas,rsci.yaml           | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index 4aacc44bb509..f20de85d5304 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -41,10 +41,15 @@ properties:
       - const: tei
 
   clocks:
-    maxItems: 1
+    minItems: 2
+    maxItems: 3
 
   clock-names:
-    const: fck # UART functional clock
+    minItems: 2
+    items:
+      - const: operation
+      - const: bus
+      - const: sck # optional external clock input
 
   power-domains:
     maxItems: 1
@@ -66,10 +71,6 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/renesas-cpg-mssr.h>
 
-    aliases {
-        serial0 = &sci0;
-    };
-
     sci0: serial@80005000 {
         compatible = "renesas,r9a09g077-rsci";
         reg = <0x80005000 0x400>;
@@ -78,7 +79,7 @@ examples:
                      <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
                      <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "eri", "rxi", "txi", "tei";
-        clocks = <&cpg CPG_MOD 108>;
-        clock-names = "fck";
+        clocks = <&cpg CPG_MOD 8>, <&cpg CPG_CORE 13>;
+        clock-names = "operation", "bus";
         power-domains = <&cpg>;
     };
-- 
2.49.0


