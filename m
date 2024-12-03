Return-Path: <linux-renesas-soc+bounces-10844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113BB9E1A9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 12:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D064167195
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DA71EB9FE;
	Tue,  3 Dec 2024 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GXlE5gyc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E8B1E8852
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224433; cv=none; b=u4U5+LIr8d73uBIGei41LVs/Pbp9CjPd0dbx13Vk67s2RpFvmHxNFXSouE0vRkDmdFR7Mg1WVE87M3leNPuozjcuzmc8/qQTiSySLDr9uAkpbwS3zm3eqMaLw2XYOtQ9xOryvKc2yI1mNrqEHjtTJHP3Dzo8W2+6GGXfFH6FiAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224433; c=relaxed/simple;
	bh=tw3WVTxLm/IaiyRycyheKSRkKa+pSfnjlBXSAe1N70I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jSqglHiTE0LB/9TBqpBfMbm7t3hIYnpS0C1hmIwVchXQ9AeYA0CL8YsTjWpDHTn/tl0F4IyXENzu2siMVuOcdktuQIF1egSKGiV6qocTL3tkVUfy4sRgwMlg54izsXONYV5DsflYFwlSEkWyd+43+hAgfsTXrg24UDP6nbz4HqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GXlE5gyc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a752140eso45070455e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2024 03:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733224430; x=1733829230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2IzVzZln0ESPpBxngSq6J1V5nvj/Jt8Q+wvf62LlJo=;
        b=GXlE5gycPdtYE82wP5LU4jlOfX6LjvURfvfDN8HwixSX76umjej3dCQjNWrAfBlX+e
         +TT8a4WQ0VAa5wlNfgZz8hJZw1/RY6SNhgQRutn614/Ts6fuloI1/Mcad5gBriwX89g0
         WuAaUgfqah86QroZ1Qo94EgjmZryV2RYOkCS2lPjcU8OOsRT71bNOO66Y1CR/sS5qxiv
         JWgnEQP72feIdGmLcv8V/R0KksGkyA0+4E8nTM7kNmZVQocaM3lWaPl+zQ8l+6XFH6M5
         jVk22LX6Csg2HYan+eIewrdLRNrj7bng+nqRWfPzku7l0YLFdm++IpQcfHzURH71jRa/
         prEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733224430; x=1733829230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2IzVzZln0ESPpBxngSq6J1V5nvj/Jt8Q+wvf62LlJo=;
        b=dQROVoaVgkcUmJfdkh+jq5fOTtCcj39HdROeNQjl8G4fTcDOeLV5/ga8GsoKaJRxfb
         jx/8df/YYRi/gMFMX75/Dexixkg7r1V7GG/SOmQ9EnikOcU2r1XIgf4jSxEEUGu5MWqQ
         5a8pax6pntJfRGXK4wDXxhIZsj7Unhr7exNE5rt/2SX0ij71BsYZqO+WaSMvbb6q2dXS
         Si7YsZm67WH2Ar5XFwNvp6WS5aGroY+0e557RSGYmxpfk4jTVB2qU5EywZyAkmLquJDX
         ygPpEq4SWSMJAePcn04bKahFYMkLtk9K5KN/8jyhMhcY9iAdUYrkkGL4WUMyvhS/tlYy
         umMA==
X-Forwarded-Encrypted: i=1; AJvYcCXDfTAUNjhC+EIOQ2V+V/Jfa7nvUUCOv6+CAlOZr4uUFtHdIhOwNOST1pvO/MyzWiUGzmRImwnbusE8+b3J89oALg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2oQRTKPdxS03G+x0ukqmFNfGPrT8HuhhocAR+qGqZDsRJDcNy
	EZudAZCE8Wpk8u/vRVoNcDzuZXHWY3Ejc4SWW7laGfO5UddnRIY7ObyY4DmxsA0=
X-Gm-Gg: ASbGncshhi1AMmq9rj2EacJNQt+YUoCKiB6YVzpZ981iyLvX1micY+oLt4Gxq1dD7xl
	52E1yxPhtYthd9dSvMb0cvdiYm/ALzxJF60aemj0rK5Usi9URWYeN7fMJdPKDI6vFJCjj/14kJH
	u7epl2jsOsjoTiV0sBkze3WTCqCwIwHkY7+DTWa8j9pUyK/3VDe3jIrnET+kMlMhkv3bZHnitz7
	QQeIzpsJT+BKGwnCMP2BP9lHC0rEJgMFSbAHPHDuIPfPzke/ubowYHSzxJeWx8gj2zN02HXlZSw
	AOi1
X-Google-Smtp-Source: AGHT+IEsCSfRfxwAWoN3TfFBzHFiRjaoLIVOtdbEsMJ9UzJYdE0tDS/Ao3+yFsalurDJzmRr4gtqgA==
X-Received: by 2002:a05:6000:156c:b0:382:450c:2607 with SMTP id ffacd0b85a97d-385fd3ccd5dmr1577944f8f.4.1733224430086;
        Tue, 03 Dec 2024 03:13:50 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e0117069sm11794315f8f.60.2024.12.03.03.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:13:49 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 11/14] dt-bindings: iio: adc: renesas,rzg2l-adc: Document RZ/G3S SoC
Date: Tue,  3 Dec 2024 13:13:11 +0200
Message-Id: <20241203111314.2420473-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the ADC IP available on the RZ/G3S SoC. The ADC IP on the RZ/G3S
differs slightly from the one found on the RZ/G2L. The identified
differences are as follows:
- different number of channels (one being used for temperature conversion);
  consequently, various registers differ; the temperature channel
  support was not available for the RZ/G2L variant; the #io-channel-cells
  property was added to be able to request the temperature channel from
  the thermal driver
- different default sampling periods
- the RZ/G3S variant lacks the ADVIC register.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../bindings/iio/adc/renesas,rzg2l-adc.yaml   | 37 +++++++++++++------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml b/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
index ba86c7b7d622..40341d541726 100644
--- a/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
@@ -17,12 +17,15 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-adc   # RZ/G2UL and RZ/Five
-          - renesas,r9a07g044-adc   # RZ/G2L
-          - renesas,r9a07g054-adc   # RZ/V2L
-      - const: renesas,rzg2l-adc
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-adc   # RZ/G2UL and RZ/Five
+              - renesas,r9a07g044-adc   # RZ/G2L
+              - renesas,r9a07g054-adc   # RZ/V2L
+          - const: renesas,rzg2l-adc
+      - items:
+          - const: renesas,r9a08g045-adc  # RZ/G3S
 
   reg:
     maxItems: 1
@@ -57,6 +60,9 @@ properties:
   '#size-cells':
     const: 0
 
+  "#io-channel-cells":
+    const: 1
+
 required:
   - compatible
   - reg
@@ -68,7 +74,7 @@ required:
   - reset-names
 
 patternProperties:
-  "^channel@[0-7]$":
+  "^channel@[0-8]$":
     $ref: adc.yaml
     type: object
     description: |
@@ -78,6 +84,8 @@ patternProperties:
       reg:
         description: |
           The channel number.
+        minimum: 0
+        maximum: 8
 
     required:
       - reg
@@ -92,18 +100,25 @@ allOf:
             const: renesas,r9a07g043-adc
     then:
       patternProperties:
-        "^channel@[2-7]$": false
+        "^channel@[2-8]$": false
         "^channel@[0-1]$":
           properties:
             reg:
-              minimum: 0
               maximum: 1
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a07g044-adc
+              - renesas,r9a07g054-adc
+    then:
       patternProperties:
+        "^channel@[8]$": false
         "^channel@[0-7]$":
           properties:
             reg:
-              minimum: 0
               maximum: 7
 
 additionalProperties: false
-- 
2.39.2


