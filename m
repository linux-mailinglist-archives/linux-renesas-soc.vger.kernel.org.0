Return-Path: <linux-renesas-soc+bounces-9300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F98E98CE7C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 10:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2E6A1F23C06
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 08:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD1E194A6C;
	Wed,  2 Oct 2024 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBcrzmKg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8EC19414E;
	Wed,  2 Oct 2024 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727856730; cv=none; b=FIgR5qsRNoidEOuKj4NO/3kfsJXbCTOvhtcRzMnBroMuev7PMD7H41zqpgHbzbQQExeyXyXvf9NjWCRh2/SahRhPgmxH97t+IX/8KF0sWIA2LeFA28/6Gymf/0EgW9GTdwLQfQCjShlfPe/9jQkXpqjD8QoDwUbBlK8ZlmtX5g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727856730; c=relaxed/simple;
	bh=qv5RrY1sAg9A4avEJJ7H4rY1rIYT16zVPu06l4R4Fpc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hb/OMRWRoUsdfQkh0PcUEqU9T5BuRrOIdAQUle9oeo43evO6RBqlX6hmUBVi7MDqYGdQ/YQ3A/vE+gFL4f84hZ4U+cik25SAhsLFx7qpj0FccTsHY/hxfBFj8wNdXALm+Zo0aoLdWs/P1NInMDQyLE/tbqkv+0AYT8U4/z2bEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBcrzmKg; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-719ba0654f9so5422948b3a.3;
        Wed, 02 Oct 2024 01:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727856728; x=1728461528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTawi8vlABzn4eU3Jwuqn4V6YP8Yw8I/ChTBGFVJseE=;
        b=aBcrzmKgvfPPg3Ww7Xua1CrsYNvrOz7M6ZX0ZCSKZaFnpObdzIXyYwHGP14eD7Z2ri
         5uwqvDS+W9vuZjmGv2AQo+WFCvRo+y6GBx5zmwDUzKgJPeDkDP+ZkJ98hfwe2dTvJpMo
         2z7SV4SbtCXvW3KK5VUYfKqt3VjY47X75lf8UHqJ/CbfGO0X6a6R9zO+p2a4RpMTtK6t
         pbeTLKsNK7ng2ZGfP8TspKWOc8xN5lNOEIzCGa9oBFGQSYx6ek/zMDiLRC42ALpYwCWZ
         QoGkcWxfegWAyMCQeMBWcf1xAdg4uUD0UnDXAwKmfB1h2b1cu8bclBTzLP1aH5BWbcZS
         avpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727856728; x=1728461528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTawi8vlABzn4eU3Jwuqn4V6YP8Yw8I/ChTBGFVJseE=;
        b=sL8nSo+igPu2oTSysce3B7gVTe3rN9Gtimnx3hXJwoim6iBl9peqFG0MTFur1y1C+1
         Le92n/R757jLBiYGxBW+5ujITAl6jLOMPEyZycEBiVzkbmQ4YfUJtKKcmvnUHlGDmISF
         ZBUnWfit6qZN9kQGvQQPw1VomCUvpYZhKsrNTZCtIR3bv3fi2KXl0qu0Db9Np2OM7X3E
         PJI6dLAwgqWzaIUTBgreUw3xWEnA0BxNvgRmUmtk/CVzx7QEgjQ7V9vVFG16Nzg8+18K
         REv5uLRsI8wy3xEVxkNCPw+b9++Q8nHiIR70ztDnouurxIxcOGioFV4gU3c84RXtCmow
         zsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIt2mKCShKS2X1d3MWdxxMbH2YYueJElhP4V7pgQqs5pvMjTvLHptcyYtzNJ7JtclLERm0mcZV4Ju8pRSwTU8v0VA=@vger.kernel.org, AJvYcCVTcr4mOF21JU3JAt+Z+CvSppUa4ovoIV+SbD5k0fJu7lZcLkefKVZDLv+/Dx7k41ZIA8lAuqWZdi34VCZm@vger.kernel.org, AJvYcCVr+bnxuW99cVEtzozo7bltGw3djaEni+qQ8qKjhRqSRE6F9wuoj872HQnt0zs1lXnPOjk8MD3ihSZZ@vger.kernel.org, AJvYcCW1lxgdAQLWxaKcQEBYFxrjL49VIXpzldSC1sOSgS9gYCy3f7+7wIMIJbX3jCO/mvxLEQINLtZzXPet@vger.kernel.org, AJvYcCXMsnoA1IMbdtFLSRP3gJMWRTkzTEDts7KpSAvP08MM7IMIKk1esadBUfXD6rwHKcBTclz3BGLoVV1OE6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz42F9iy7BbMrxk4Cdz/1VwzqLcogk2R0jedEqzoIjF4ffuCiRx
	0DmIdwGnp8fAoh7F+0WnM03HPlx5YBUXf+m2wocQPyiaAGPbN7J6
X-Google-Smtp-Source: AGHT+IGwR48M259nJHAFUBw6qCKkXd4ejrHKz1v+kWfrIGS1FwJsFKjfIkioL5Z42ZdnZmWhxZh6hg==
X-Received: by 2002:a05:6a00:3916:b0:717:9154:b5b6 with SMTP id d2e1a72fcca58-71dc5c6622dmr4008381b3a.7.1727856727560;
        Wed, 02 Oct 2024 01:12:07 -0700 (PDT)
Received: from Ubuntu22.. ([219.91.95.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652b4f6sm9618115b3a.174.2024.10.02.01.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:12:07 -0700 (PDT)
From: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
To: patrick@stwcx.xyz,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8 1/2] dt-bindings: hwmon: add renesas,isl28022
Date: Wed,  2 Oct 2024 16:11:29 +0800
Message-Id: <20241002081133.13123-2-yikai.tsai.wiwynn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241002081133.13123-1-yikai.tsai.wiwynn@gmail.com>
References: <20241002081133.13123-1-yikai.tsai.wiwynn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add dt-bindings for Renesas ISL28022 power monitor.

Signed-off-by: Carsten Spieß <mail@carsten-spiess.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
---
 .../bindings/hwmon/renesas,isl28022.yaml      | 64 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml b/Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
new file mode 100644
index 000000000000..dd82a80e4115
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/renesas,isl28022.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas ISL28022 power monitor
+
+maintainers:
+  - Carsten Spieß <mail@carsten-spiess.de>
+
+description: |
+  The ISL28022 is a power monitor with I2C interface. The device monitors
+  voltage, current via shunt resistor and calculated power.
+
+  Datasheets:
+    https://www.renesas.com/us/en/www/doc/datasheet/isl28022.pdf
+
+properties:
+  compatible:
+    const: renesas,isl28022
+
+  reg:
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description:
+      Shunt resistor value in micro-Ohm
+    minimum: 800
+    default: 10000
+
+  renesas,shunt-range-microvolt:
+    description:
+      Maximal shunt voltage range of +/- 40 mV, 80 mV, 160 mV or 320 mV
+    default: 320000
+    enum: [40000, 80000, 160000, 320000]
+
+  renesas,average-samples:
+    description:
+      Number of samples to be used to report voltage, current and power values.
+    default: 1
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 16, 32, 64, 128]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-monitor@40 {
+            compatible = "renesas,isl28022";
+            reg = <0x40>;
+            shunt-resistor-micro-ohms = <8000>;
+            renesas,shunt-range-microvolt = <40000>;
+            renesas,average-samples = <128>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f..950456f4d393 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12118,6 +12118,12 @@ F:	drivers/isdn/Makefile
 F:	drivers/isdn/hardware/
 F:	drivers/isdn/mISDN/
 
+ISL28022 HARDWARE MONITORING DRIVER
+M:	Carsten Spieß <mail@carsten-spiess.de>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
+
 ISOFS FILESYSTEM
 M:	Jan Kara <jack@suse.cz>
 L:	linux-fsdevel@vger.kernel.org
-- 
2.34.1


