Return-Path: <linux-renesas-soc+bounces-9034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4220F985143
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 05:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7CD81F24EAD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 03:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248C314A62F;
	Wed, 25 Sep 2024 03:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+bTPrbA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824A01494BB;
	Wed, 25 Sep 2024 03:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727233910; cv=none; b=NOlT9pYUIyz++G5xH6Bki5GovAEtHPMlPa9BFt41EU7hVoUypTAvyCbUKh6M0MDmeXV2ygD+1Myntk9TUd8l5dnBPD8OMxH0TaR0gfA9c7XF5l0TeGy7NbJfhPt/D548/Onypn6LPTJIU9IdVN7NUhvuLksn1KNljGA+N+yZ18Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727233910; c=relaxed/simple;
	bh=06WLxp/uYMC/dMx2MZbS1RxwEZ5nWiVz50IzVH8SIwE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LCOdq2v+708c68IPE/WC4kS35ooMp/BEid3n9ToOFyBQts0Njt/UFoFO5jRhAK+BQl9cWbCZg4m6aLDmrsYlWQVb+HAKSf8YsN3NLSWujj8wKBil6Ew2AhPbl4sX+QNdPlOsrE4+EnZYalVHTFpq71UVjaN6qGu8NWtfcsZH43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+bTPrbA; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2053616fa36so75400685ad.0;
        Tue, 24 Sep 2024 20:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727233908; x=1727838708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRz77lmMWFQWMgE9Y/swBulcL3sGo/DTE33Xsz50cGU=;
        b=O+bTPrbAUlhVEkcKJVzchgU9qy1WbGAYiVbXQE4H7tll/LLx2yg0bSxdbnL+Zt1rF7
         id2EaT7T2vgQnD6obsbRoa8XlYHuJVATKi8W6xlZBenrmD+CZeX9M3FoI+kUmCkTTYnq
         DQqH7sEn3NwuITIMT0gXV6nonZsu0v/DWqYkUDM1ixyFLLa3aAX+AOpFck14kXtlt4Fw
         70bklygkj3C2seVER9LMZKsPJCIeMK1s/DfSmBxinIydTbD+sVLA6bHXaBedwe4dO43A
         EUdjBc722FHy1kPK6506vZA/QCaQXm8q6IGmAc4B1uLFwTVnR+u+YhDC1jfZotzsMCst
         aW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727233908; x=1727838708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRz77lmMWFQWMgE9Y/swBulcL3sGo/DTE33Xsz50cGU=;
        b=G+3HE9ENOezLTE3cgXcYCSyMu0LbArXKYDaoXaoFqGRLJnUIiwuhEqfmXLf4pQTCh7
         d3fdkjFdEdnNY2FCET19DoMzpb+puXZL7QlANQjn7m2BIyadojkciLDmIijEkE/3DSdd
         qrq1wpvkcyEe5UscD7I32omXfCVrtsAUC439yxeO+gjPITifLGf0Yq17hkudqdZ2Rwx0
         s6vSxSv/kxuxTY3wdAIcqqwD0dPlg9eqAjj8A3GPbBG2mPULr71F4ea3fo8d1U1OmNBo
         QeJGu6okmxVCGkqYmpA1CxBg0C9c+TOCCbJFha+F0FfhxsdV2Gqolglt3LhDQg5UL7Fp
         fFkg==
X-Forwarded-Encrypted: i=1; AJvYcCU6E3gJfwj0NS3ZSj6MGkgczjBtxzbsRvGgOdOK1zU7kOqC3VXJFFyCUTcXFwhcihCDyYGO8cAjV9dE@vger.kernel.org, AJvYcCUfB2I3SvzGSbmohG0rbbh2MoYJyUWUu4spi+sGUIZcqi7SMhqCY2MCPgExLLg5+L4oSNzoohYTSvghwEnL@vger.kernel.org, AJvYcCVV+G3zHpeKAEKp5u9SzQ4Kkt0NBMPTfuR8qkJLNIfttuNDp0RAjj6KGoiAbTguGodwoCs8Mf4nfut3TZU=@vger.kernel.org, AJvYcCXIj3/ifKP/bUiyKgkBzuMDPIe8YvIp46Im/wkCmg/JQyq06sM6OhgXbIuPhoBPgljqsbMdfryCJLHm@vger.kernel.org, AJvYcCXnyhJngZEO1P6Oyay3L/rlZ3CdQEu8sG2D1t2+A8CgXs4khgM2XwMlEVVsk05NfAjYfXVxCU4y4DoJNPW07/1IU6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YymvUcgp/yYcS8fZZ/p7ibF6mwaFr0NeKqatkXAtdXZ0VvdwCNH
	oddU8dHrTd1Jr/OVgTeAE0iFZpFk+YAgjxc26Z2zr7NtV8lagll1
X-Google-Smtp-Source: AGHT+IF1bDOTCS3C6Om8fAwISVQPCmlmrfAr0FpZT3I8h7pXVEraOvn6DKGnPwsgv5ck1kHYRe8lCg==
X-Received: by 2002:a17:903:32c8:b0:206:ac72:d74a with SMTP id d9443c01a7336-20afc4356bamr18554315ad.19.1727233907770;
        Tue, 24 Sep 2024 20:11:47 -0700 (PDT)
Received: from localhost.localdomain (27-51-112-33.adsl.fetnet.net. [27.51.112.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af185be0csm16054755ad.294.2024.09.24.20.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 20:11:47 -0700 (PDT)
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
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 1/2] dt-bindings: hwmon: add renesas,isl28022
Date: Wed, 25 Sep 2024 11:11:27 +0800
Message-Id: <20240925031131.14645-2-yikai.tsai.wiwynn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240925031131.14645-1-yikai.tsai.wiwynn@gmail.com>
References: <20240925031131.14645-1-yikai.tsai.wiwynn@gmail.com>
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
index 7bfef98226d9..9407481c03a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12075,6 +12075,12 @@ F:	drivers/isdn/Makefile
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
2.25.1


