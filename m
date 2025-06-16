Return-Path: <linux-renesas-soc+bounces-18395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCB4ADBC03
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 23:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57F261891968
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 21:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4108A21A454;
	Mon, 16 Jun 2025 21:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxvBDnwb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7DC7262B;
	Mon, 16 Jun 2025 21:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109974; cv=none; b=kk+SCEpvGxyARCkXNiqhQhJChrkKPqF6tAz5c4MhFa/zpxqQdG9CdXvwHaUHOPQL0g9xWFCfUsPPJQhVskrefAQQIU3pgo38n8d3fXWKlSsXHKR+z4csBT3pIxNI6IulvKLSDvNj3nGriiQDaXs2X7/iFxEe7zv4el4XzIhQnIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109974; c=relaxed/simple;
	bh=o9H4160VJI/DwUZyHQiffNxcp2o4Zyft2Q6uEzv4aBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoMoYY+w1Ty6ltjMfIXVgbZQCmVUcMQNh+8ZhqSraVBsNDjY1mF/8B/wHoenOjZGidA7RKW8ng5gMTUAo1OkjtINhVkwI/NmTp+nEBzhmJqwU/9sUtG07C83YytQJYhEM/79r+L4z6hXJUjp+jCJPvlImpSIAkjXSqS473+I8EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxvBDnwb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d6ade159so41421355e9.1;
        Mon, 16 Jun 2025 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750109971; x=1750714771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77RTsZmwWTNQXKM/ZZkcpsHsW4j7xzAByXn51mzD2TU=;
        b=TxvBDnwbXN09czE6TaTse+oQgPYIqS5zQT1jZ7rH/eM1D7aYL2EkW71Uj7rT77L1QM
         M1RVovP/Z2zgWFDBaaBe4p5BIyR3SAxDSTIWt08HWJkL4YtWa5a7wIDCxa1rFM+oEbnT
         MpFsJC7+JqM4LHYlJgxfMMCbiRHc6cvjfVVKkrtBvC2HZO7S+VOI6fAwX7IupLhYkVXL
         C3yxpdt6swyxWk7UYkVihvh6P70aeziseZGVJ7Ap6Oe6qIM5BBLwfrHCg98l3HKPEUqa
         4xYh2iyTU88XE+qG0VprCrz3nZebZ5SkNQaE3AOtXwagdLZM7TFe31vMULNOjHWxMGmz
         y9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109971; x=1750714771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77RTsZmwWTNQXKM/ZZkcpsHsW4j7xzAByXn51mzD2TU=;
        b=lx4idVovkX1rxC2FlUdcZ7Vs/XhNhQ6tmGLTJ5Cx2psW4KUGScjlfg7ZBG+XpB5nO5
         zpZEfd3rtnfNn+PV0OlRDlygJmh19SXHH+tFb/tApQ+caxU1z/GtYqzD0rVtUZUy6P3T
         9CEnmsf2kQP70hEBLaRVxWCsBtceYGx/lWleJOVARarQkDgXlOYo+dY5TdDtd4BqAj2d
         7unG4+/W7GW9M687794TjX8HxKXamnWRHJOSTWfSSIXyg9STnPp4ovplJQOFYqKEbn/I
         L+EE5eYgJ3Geow6Z0CWdtNbqfedaTeQ4bu4jTzlmFEzFQ91CZIe7DkXvzEWOZuoR+SHX
         9Xcg==
X-Forwarded-Encrypted: i=1; AJvYcCUWY7z6GmbKAkNmClGHWCJLpq9Xfzqw8k5T3JLpj+Gy7eWFetdRTDYQESmcrCplwnvajp63sXTPJDxJ@vger.kernel.org, AJvYcCV7lkvK9U3A37GjTVfxIoenLqe8cmF73xRn+CV7u4oXA+nvXRyldeL9vNL0btvUVP30FLvwlG5I10HBFUJdH65Y7ME=@vger.kernel.org, AJvYcCVXDpkf6o8DtfIWKI3EQPPb52IWSC8lvtpFS+uT5ff6ZbjZXw3fG7bIdZiBrWL9gTJV9kh2f6Vsq5W1tU7C@vger.kernel.org
X-Gm-Message-State: AOJu0YzBjMTwMEqW+4rNknqYUc/Wpl98JDmgAkk2cWaOHPD1eenjO2xQ
	9VNTRqqTySsKcY51mgiFxfFtPqKXCwQfqpPdc3c0KydV1jHyQ9Fh9V/HpBBTHTKf
X-Gm-Gg: ASbGncs7P6cPmy2tTfHYaQi4rnZ3+JaYLKScwKvAGyRsFGmSuc5Vw5r+q/rVeKrX9H2
	asrOs4Y8yrneDwYYICe2ugS1oLojs1SnOv5OYSHFrmNC5AifNHlcBvsQvb+c3y2NipcPXERip9P
	u5eyWwRFX/B8pbdaraXqEW9plNDZ31Bk6hTZ7d5ZHArjwXX4KU65jTcd4WjakH2Kn4LZIhxkA+h
	V3A3BLrfUZT6x5lkhudEyu9B4JJVug/LecvC7W5pxi/khzBFUJj7g/IDKDMH0X2L1e0YPvLr+h4
	8VjfkXGOjASrrYffyayiAU/H3NOT0vID9OkL8JJAUzNZpBgwfU6ffErSysFWUrSfKB+h4xKwVJ7
	R7Oq7r9lUedgSRyGqu8zs
X-Google-Smtp-Source: AGHT+IG2UK91aWVBhxvs343m6GSd5IbfIwj5vXbxLP/mkBfu6xdCf4cSyv0IxBAXiaXWrN3VdnD4oA==
X-Received: by 2002:a05:600c:5309:b0:43e:bdf7:7975 with SMTP id 5b1f17b1804b1-45344e65f1cmr65509125e9.32.1750109970444;
        Mon, 16 Jun 2025 14:39:30 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:4135:3769:337c:8a0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2354fbsm153211625e9.15.2025.06.16.14.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:39:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 1/5] dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
Date: Mon, 16 Jun 2025 22:39:23 +0100
Message-ID: <20250616213927.475921-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616213927.475921-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250616213927.475921-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

At boot, the default clock is the PCLKM core clock (synchronous
clock, which is enabled by the bootloader).
For different baudrates, the asynchronous clock input must be used.
Clock selection is made by an internal register of RCSI.

Add the optional "sck", external clock input.

Also remove the unneeded serial0 alias from the dts example.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi Rob,
As mentioned in the thread below there are no users of the RSCI binding
hence this change doesn not break any ABI.

https://lore.kernel.org/all/CAMuHMdUThuWxxznhjvcn5cOFCWOkb5u-fRYwTOoenDRY=4H6FA@mail.gmail.com/

Cheers, Prabhakar
---
 .../bindings/serial/renesas,rsci.yaml           | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index ea879db5f485..1bf255407df0 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -35,10 +35,15 @@ properties:
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
@@ -60,10 +65,6 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/renesas-cpg-mssr.h>
 
-    aliases {
-        serial0 = &sci0;
-    };
-
     sci0: serial@80005000 {
         compatible = "renesas,r9a09g077-rsci";
         reg = <0x80005000 0x400>;
@@ -72,7 +73,7 @@ examples:
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


