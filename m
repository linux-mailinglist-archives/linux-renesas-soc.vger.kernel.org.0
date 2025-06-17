Return-Path: <linux-renesas-soc+bounces-18445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C05ADCE0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 15:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE5583AB74E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 13:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB42F13D8A3;
	Tue, 17 Jun 2025 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzPt9P+5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF172E3AE3;
	Tue, 17 Jun 2025 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167910; cv=none; b=eghzDLUv6H8RfC0bDFChgBsHdJLNDd4eZj/Gi7OlQ7Xxv/ygVYgUTVYHSsO54OWnwz52lO4ZkvHoj8Da2ThamQBSIR9GaOS7XcLay2F9iH9+p6sTAd6OMnj5aXLEQCO9ztMcYxLWClj3M0wcWe2d2l//aRIZdenikQ2CfwpJqgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167910; c=relaxed/simple;
	bh=tjdMx7JP9WA7qfJP6WQILzoRgg1qDowYbkmxAwje2UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hKy1t5EPUzh1ejJP0ut/UggAwqsNxMBvv0bT7NxcXeOTtPm+0+G43TPMTD8tsWd0691W+wYomHp4Vu2xKu7RiH26xGapNmUmwsxaFI+ZdcknszX8H9vDiK1cxqrq1cyF+wqWQfrzm+jivnMkXM1vKVarlQXNhWtAxv1HYcNrjdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzPt9P+5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso18984455e9.3;
        Tue, 17 Jun 2025 06:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167907; x=1750772707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49FSPtlcKL0gc4JMv+U7rRPko4PCd0GRAj32NmJNos4=;
        b=CzPt9P+55ApZkEBhKeNamRzt1M9M8jEPjXhkPOgN/Pk3snk6b+xPTVh6BV9twnZyd+
         XmILS1+YsTEr+0y42WdKsMtqCzGv7oNfskOajCEhbo9br+8lNA52mSygiNXgipYhs9/x
         iXyujjotS772BcqVDX3YhxDIFmdF+IChl4oysBy9IqR0yskO9Cq6AOeN9E+n9WOHerq5
         mCADYGv9FfEuo7OX9x/DCKvnAyPvewkBcok4EZxefIadqFYmpgJJE+ZWcLSH556wOW5T
         jRUbxFwb6S5/CPlG6l398oKGljsRBplmHNI2mdcJ/gAiqokHa8DfW2z6kZdGWX/OWY0C
         uXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167907; x=1750772707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49FSPtlcKL0gc4JMv+U7rRPko4PCd0GRAj32NmJNos4=;
        b=vkThwDRK1hyk1w11zqK5Mvqg7A2bcVzrakerD6UxQT+SMicPl7x39GIXU47OhpRpt9
         wYwEyu3UmXYUBCsG7sdgySfGUYgR8/V5u8MzyNS2Ilt4Ipio7L8bEl5rA1+5eJNnZlCd
         ENDpo1Pqh7eSoLWWZ2JJApDROzQv7nf9WhBBMcVfXXA7xqMTNgV6WT7GEIbkMGjqkuoO
         7nwhfDiVYQ0poWLKSO47qn8VcrFgQYYLNK2W1IfJj4ree5r4o4mxcnroQ/Dne/HisgEh
         2/LlzrMOqnFJn+7lOmSe+9efFq9unbnKbFM0lScYgtFuDoPy+hFzESpdBmEXV8a2zU0X
         hazA==
X-Forwarded-Encrypted: i=1; AJvYcCUn4FfIkdqOhq3qzU3k8bciZaYiLCD2iVIEi5k2pyf8rgM4RqusGdWQCHyLaeNc0/G2iCHBbKLPbh4xKKg7GELK2zM=@vger.kernel.org, AJvYcCVPIJVBtjIuEiYOrsfUw9NTqmUdiIynCwpQH29XwynEoXNsePlUNfmE/U9IyZ7o8gqCGXQ9FXuzTSa+tZ4m@vger.kernel.org, AJvYcCWpkLMoS/VKiE/W24gNZWPoUgnbxm3Z5n0YwXTyLf7HpljQ/HIm9+vHi8M33cVcZueFLnLR+ZeJmz4m@vger.kernel.org, AJvYcCXzbMZvoQJC5knjQ6wGQnbT8fCz6MDWGnjnSUgBUmzugfZMnA82Rvc+vGaGv9SAjQoVsb6Wag5LwcTl6kma@vger.kernel.org
X-Gm-Message-State: AOJu0YzxKSPX++OowiFLIE4Jan/Pu9DG4WL1NvzWyN5ix0WajI045/+k
	Bv7yvIA742NEDwEX/cTkugMcOoFgy0JFNPxnahV2ECkKHyzPkd0Nbrpx
X-Gm-Gg: ASbGncsu9j/DqKrzItR0mG8ktPLqz4nT7+RF/8xwv1YaFdKhqWFTSzCPBfwlQCdBUbq
	fGoK5dtV1jNVA0SZJ6Rnebcej4X0VNB7Y1hWS8BbMINZtmEUhALLGQy2PIkLlb7Q5F2g1DtwhMx
	3efCpW+Il0RYqY1S68aLC+sH8wsJBE1El/LE+ujojp2rGTzI3NscFxgic2+1aQkOcYIWwCaSCPK
	QC8/+iXf5f1gqjK4icdbJ9CtcDK+TD2jKpL1ZRZjUasrJD+WUPKzcCEEeS12bxQmJ1LG8mUmlEQ
	GDG43S/XzYlaU6pdNA6W0Bp5GQC1RnlLQW6SaEx9XTsSQwZOh3gDONk56RQng6xd5AugzQm6JKI
	5E5khNN2ld+o=
X-Google-Smtp-Source: AGHT+IGse8XFsoUh6fMQBcNMM9Sf+3vi5JtHZdT76YAwamnppyqyoyYz15avA1Klfl6ft5GN31V4DQ==
X-Received: by 2002:a05:600c:620b:b0:450:d4a6:79ad with SMTP id 5b1f17b1804b1-4533cb4bea8mr118623195e9.23.1750167906835;
        Tue, 17 Jun 2025 06:45:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 1/7] dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
Date: Tue, 17 Jun 2025 14:44:58 +0100
Message-ID: <20250617134504.126313-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
As mentioned in the thread [1] below there are no users of the RSCI binding
hence this change doesn not break any ABI.

[1] https://lore.kernel.org/all/CAMuHMdUThuWxxznhjvcn5cOFCWOkb5u-fRYwTOoenDRY=4H6FA@mail.gmail.com/

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


