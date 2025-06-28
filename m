Return-Path: <linux-renesas-soc+bounces-18874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2BAEC6D9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 13:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E95170CAE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 11:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B262472B8;
	Sat, 28 Jun 2025 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNJ7fM9e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E7223BD13;
	Sat, 28 Jun 2025 11:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751111841; cv=none; b=pmwjL7UG0zWXIoUtG10Vbd+n7bQ/nuqtyN0gpp/CQd9lxIUElyOJ4bmVLnEQEVlSXkSTVk8ShQ9JK+1i2iyeB7mGcMCMOganXicjpG5ZaygqrPCXBYGq2wfs/9dwwH0gQEv4L55aJlH5ohqT/C16bbv+t5A4bd3PYhauPihpSl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751111841; c=relaxed/simple;
	bh=mr4OZ+xU5d9kdFOZJ2oHja9vhVwAoQdVD97OEXBhRKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mqm+WTyR9ooaf7jk1aR/ptRZAVAKA1GCm3k428lNkfSE5EBNV450+P7pU0Cff8l0WNB2Lif+Sp5YFAiuMbLsZVIoLorZBGhUtGZn+hBf4zQPd0wh+knmu9GPeyGo59vkUYFyJWKklyn+uC6/xlzJwKW0IFIhFWCvuxnaUbh/RdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNJ7fM9e; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1731526f8f.2;
        Sat, 28 Jun 2025 04:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751111838; x=1751716638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmH4/UammIJwWR8r8pdsi1PSjJlkibdp/FaYgime4pw=;
        b=GNJ7fM9eOPs+2foljV+beePzn7QwyhDtnTXNVcwVwPrRoL4AnApXrePApIIB0LbT9e
         mERoi1SoyCP0Nq6YKy5Q91x3BdeZfnDG0mrpLuiQbYDY/j6ez5ml4OgB/wYMP26WmsuM
         f2uTJNnsuAKugCR/mf8rwChlcJMcaERRayz/r2Uq/Y4/VxjLKwoYBZZrE5F76bvIsMmy
         iMtFPPMmmcSijERGUepN5B0GXKLSdKplZYMi1edJ20xkMptlBN3h0VHv23VYtfP63GEx
         PyimzKnpfzhjkNWi4VqoPEuReeHlnWE9ccsOXqFex84L3VXVApl5e+Oribx36DyIdyy0
         /yEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751111838; x=1751716638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmH4/UammIJwWR8r8pdsi1PSjJlkibdp/FaYgime4pw=;
        b=VlnscsXYB2jGwrvQKY4YP44JZyP2vFfXoDBwXkPN1l3muDe7lAceiSOBQvl1V/ET4T
         NrxM5RTgJwuY1m0XlU1vTM84hDFJq5gfjXh1uyX9+zALXtUVFdZM/m5AATXL9UU1Auqm
         77mC23cgfc4/D83tVbsQ2pfvY/njXk0SpVJC0ozccOy6lc8BjMlXTCD0J14JNpc4+vNd
         FygqjcO/iyR3twEgPUHWzdXwnh+wjRtsXfKNR8nv/c3VmSoClFNtQMSTGNw2u9WVqNB2
         R+43vcbwf/1PSlkPTGTENQhdqk+0cOt1ZF1xUC60sUZnhdWy42eD0KfekrOYMSoJLiVc
         sXiA==
X-Forwarded-Encrypted: i=1; AJvYcCWZD2IVQGnNuElZ0LYkPgifgi4IGrTd7930MkXDOEsMhWWgFUfGe8m55fIni/pig/HNUojYmdUeKTDJqTDrT57T4PY=@vger.kernel.org, AJvYcCXBbz9qWJawlQ/HH/DdNOL5zVP/y+v4Fmc36QHrztH7Hp7e+uGOtxMKVBrcaNCpxfFcQvlyAtEnsbje@vger.kernel.org, AJvYcCXtOXL6E8Q8i5Kbl5bsgzE2a8mZwgvckEN9zFyQtTwHtednwoGESHtWG9Hr78MynRMwGB72xJtgyuT03kbv@vger.kernel.org
X-Gm-Message-State: AOJu0YxyTWasSyPgCtllKD9RNR2TrKUIsRNNUFRfWdGdqBj9SdEbBwh7
	ZizdzS+5Sebt4LilGDCWLiyjRx+qVCe+D+az8n9DoSce6nIch8CsPkl3
X-Gm-Gg: ASbGncuIOqlHTvNEO9RRWJ3qkPYjWdh7tB2wNU9O4sGzI28QZ3zvvk6HTu0/bqP/56h
	eshXt7cfUDMcn7dFxDgXBEwB5f8+e/k7gh2Lq+Ziqh7bEwxd3p8z4U90daku5kT2YsA1ewQWcUi
	oJpIRFANjas5iEjMzvvmh3zYk3pIlcZVE5Xjn95CDK6GXv3r6fmaAYu9xBg/k2h8JRa0D/ldXsh
	PnoeWbinzdYcEsrV7awCmb39dkhLNOf83jjZVD6uq7rKMFXWN/qG2usO+LEfyY9/p1nv00GwFaG
	paHoXwmEyg19Et02OQG7ruuuqozbnTbTtImOZw1e+O4tlohgOHuRhw0wU358lsFjA2DDzsUGWMn
	ZEdL71RaiDXlWCqt3sGi6
X-Google-Smtp-Source: AGHT+IF3sfWUCW4uqB+IjR0BYBQRGHTp8Q3p1J/nSX00xlB2jVhL561hZeU310JKES5NxjyDH6cpeg==
X-Received: by 2002:adf:b60b:0:b0:3a4:f939:b53 with SMTP id ffacd0b85a97d-3a8ffcc9d53mr5337407f8f.38.1751111837820;
        Sat, 28 Jun 2025 04:57:17 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:dca0:b0f1:f055:ea37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7310sm5247818f8f.18.2025.06.28.04.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 04:57:17 -0700 (PDT)
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
Subject: [PATCH v13 1/5] dt-bindings: serial: renesas,rsci: Add optional secondary clock input
Date: Sat, 28 Jun 2025 12:57:11 +0100
Message-ID: <20250628115715.102338-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v12->v13:
- Rebased on latest linux-next.
- Updated commit message to clarify the ABI change.
- Used `R9A09G077_CLK_PCLKM` macro for core clock
---
 .../bindings/serial/renesas,rsci.yaml         | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index 4aacc44bb509..f80cb60ae099 100644
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
@@ -63,12 +68,8 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-    aliases {
-        serial0 = &sci0;
-    };
 
     sci0: serial@80005000 {
         compatible = "renesas,r9a09g077-rsci";
@@ -78,7 +79,7 @@ examples:
                      <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
                      <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "eri", "rxi", "txi", "tei";
-        clocks = <&cpg CPG_MOD 108>;
-        clock-names = "fck";
+        clocks = <&cpg CPG_MOD 8>, <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+        clock-names = "operation", "bus";
         power-domains = <&cpg>;
     };
-- 
2.49.0


