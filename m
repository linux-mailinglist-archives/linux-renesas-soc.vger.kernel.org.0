Return-Path: <linux-renesas-soc+bounces-16583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACBCAA603D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 16:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1E7A17323D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 14:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4397200BBC;
	Thu,  1 May 2025 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ea9v+iHW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2CD1F76A5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746111149; cv=none; b=MJU7B/4h9bYOqm2UmVNFDNOe/qFMclses5QnZydB1AEtX+AF6F6GDf4xpCY7M7EpHPgUzCn1uxsdt9OMsQixuMb7OtamQk4fz6m43TClQwaButDYiWrWHU1O18pSCyWhcY9PrntIKJ4bTasZPAJ856CCR7nKXn0BrRWG3DQ2GSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746111149; c=relaxed/simple;
	bh=4vBN19AAg9T2It+spbWtSmKK8svHb3xb1Lx24a45eNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QNthdler5YuRoMq4BOI0TPHBL7+/BAGORrIanAZ4OhMwKUQclPCp/ktrX1p+uyXJQVVJt8eCoz0To7bfS7GSn8ojpAfB2NQ9ew2KzGe0J1BKYqm6VHvuqVtp7l5ytwnLNmoqBFMPsou1Nv0VvGq4bH22+y3nPrdlfOxWwDd2UC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ea9v+iHW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so1716425e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 May 2025 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746111145; x=1746715945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJYIuRkvXgvyjv2IxF0maY1wel8nlqpI4PAniXDkr/Q=;
        b=Ea9v+iHW6PbFFrFeC7r2je5IwDvTAzoUQVrWWiSNKFapGV2IDFvr5rLolc5VDezTiw
         MZTkYiHYfusKl9F+1JmZ5gK/yh6DGFYtD6Vf3M7Ap9itQQiaTHVfHtpNzfo/qHxEBCW0
         GuqOdoxGAYuIJSYXE11zCoOg7ayElwuiIJjqLInC3zyZbKlBEzA4VjUEzYvWDRMQ/DNN
         bGWRIJExmz8XiCcbTsXgdm/117RL6vKit/sNXAih6ZFtdyeTaAep9zS6WZLx8fFJJ0Ty
         EgPbB0PYBHzfXYMlczbJ3lG1l/3SzptGIm8A53c5rE9T6CAsZ1Fye2aZAVoFR4ryA+97
         fvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746111145; x=1746715945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJYIuRkvXgvyjv2IxF0maY1wel8nlqpI4PAniXDkr/Q=;
        b=qqLqPIi7DNO2zgSmrK7lNMy4pL9WE8EvDheH8AxE5H6mTMIdi+90aAXT/pARsO6BW+
         URqIC5s6wwdQcoW8n7XUptHJThJmNMWRA6ogcGMPPGOjTPXwkGttZoopdnv7hZeGf/FY
         0B2BomnhbGfEH9qV2LhQG6a0/ezoY5050GCnJqU4q67YWbW2YxIM3EX/U8TXjIizOua/
         GPPaUnpZjHgDY8V/nEonyPlTFLEEwS+Q5oE3w4qP0Y2EkWZOOOA7F2+Qkq5BApnf6l1c
         LXG4CydTHR4bbnTGSLhPA8ffXzPyJYZFQfKM0UhILxFyJIyULdfBCEzkf75sE69AeHR3
         YoBw==
X-Forwarded-Encrypted: i=1; AJvYcCWtxH6s3H2LWh7GIW5iZguR734MZgZXpIZQP8XiO9OHr5XLeJoik/ss8R4WV1lVayQDEr0xLzLXhh0SQ7cpeZhR4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2FhUG2Uz4OV3vmHN9oyEYfCEGusscYw9U3oD5F+4lYFfv47ug
	Le3DGTDKauyr+fE3sESfZR3hki3Aj9elcZyJza9bPA5BcEgWmDuhEHmZKcF0qWM=
X-Gm-Gg: ASbGncum97ZhAkBU8A/mO3HHZ9pmehgsQmceUmy9Cm6QuU85hCyK3nxUPs9ffyKJKUK
	sXzRF5Krl3goVYFiJv2Dp2F+6ZMOBr6TvFK0FvaJdTA3lT82+IOrwfPhNaA4guCJBtoTxX8lBTC
	b03hjjlJ1QK1f0I0M5ZR1LZekxstAJdS3B5cXbqWjrhC44r0yrd81nflK/fMEgPHUzAAbEXAoPl
	n6zNlW9gCawduGJnYrkHx4wWZdfAlXQEznGkiTNf8CLvouA0MtZqIfe5aCJzwOzHIiTuIe0cHEh
	ITyvrw6pEkT8FlLjqG9oYD1swmx6mkF65+Zd8o0fkzd8M3ztHg==
X-Google-Smtp-Source: AGHT+IEscX5IahyoV/eRtQh77jTXcANYfmic7ETf5PGiDochYM6dDXqHCgY2w9TfMWBhu1Fc9dpY5A==
X-Received: by 2002:a05:600c:4f8e:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-441b740c97fmr6862565e9.0.1746111144682;
        Thu, 01 May 2025 07:52:24 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89d15dasm14558175e9.16.2025.05.01.07.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 07:52:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Colin Foster <colin.foster@in-advantage.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jeff LaBundy <jeff@labundy.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: mfd: Drop unrelated nodes from DTS example
Date: Thu,  1 May 2025 16:51:26 +0200
Message-ID: <20250501145125.59952-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2572; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=4vBN19AAg9T2It+spbWtSmKK8svHb3xb1Lx24a45eNI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4ptulClJmxd6R/zFbeEq5+2oIrFLOFC/OsgF
 Eg7qxfabImJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOKbQAKCRDBN2bmhouD
 13VyD/9mmygI3FArCUXOD4f6QaOXP7dD5Fsgyiy2iRtSSwwySLD3Eesa1LzWAQ/TGmj/aJyw9fG
 DaYo9NoeywhAaeLW0WiLRFO2k1kjtddAc68IqPFohTHpgx4VcDi4fMcvvFyYbkpwit5SJp48sgi
 +LCuw7oS9K5Ohmyqf1NAIan/guJfvKY21AgAD1nm0qU27Vdh/mHKeejNP/PXv3y2dInBCMAiUMw
 yNewJrcoNeS0RRVFu35bjLUoo28vLof3ZrTBp/xZMXMFRNhVvpny7sIAdBRhQ6YiVP4fhOff9R0
 mH8FUbY1NUr5d7vM3GoSyhSTbJkJoWzt8druiwrzJMrIueQdsb2PnTXnlygcXFfXuQHFtoGAnda
 9bSmOVsxc22KuzIl7SrhX4Q/ZpqlmKsyLEH47JLIwSW+jWYpEezBZToVUlG1e3Jz/NBZErXq55r
 H8AclkEQLS2reCTfmSXi/ENGdXy9AVDxw5sN3JycBuqfADNGl52aYtT7oYMnt84aclDBLlHMcfd
 quFI1oTHupbzyamJlnPwfAtMVnoPBB/haC3VR4w97JOsD85+eH4rj85Gm2zmhHol0aaXIiBy/Mf
 lRAAMgvFGwwYovncTDj/UYqejjABZ1wt7jfh5x249XFIPS+7vDd1lBofEJzBCOI2TcEXJto2CO6 w18oNZQkiq7aUYQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Binding example should not contain other nodes, e.g. consumers of
resource providers, because this is completely redundant and adds
unnecessary bloat.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Move pwm-leds removal hunk in iqs62x.yaml from next patch to here
   (Geert)
---
 Documentation/devicetree/bindings/mfd/iqs62x.yaml     |  9 ---------
 .../devicetree/bindings/mfd/mscc,ocelot.yaml          |  6 ------
 .../devicetree/bindings/mfd/netronix,ntxec.yaml       | 11 -----------
 3 files changed, 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/iqs62x.yaml b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
index e79ce447a800..3fc758664614 100644
--- a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
+++ b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
@@ -90,15 +90,6 @@ examples:
             };
     };
 
-    pwmleds {
-            compatible = "pwm-leds";
-
-            led-1 {
-                    pwms = <&iqs620a_pwm 0 1000000>;
-                    max-brightness = <255>;
-            };
-    };
-
   - |
     /* Single inductive button with bipolar dock/tablet-mode switch. */
     #include <dt-bindings/input/input.h>
diff --git a/Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml b/Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml
index 8bd1abfc44d9..b613da83dca4 100644
--- a/Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml
+++ b/Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml
@@ -76,12 +76,6 @@ additionalProperties: false
 
 examples:
   - |
-    ocelot_clock: ocelot-clock {
-          compatible = "fixed-clock";
-          #clock-cells = <0>;
-          clock-frequency = <125000000>;
-      };
-
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
index 59a630025f52..06bada577acb 100644
--- a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
+++ b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
@@ -63,14 +63,3 @@ examples:
                     #pwm-cells = <2>;
             };
     };
-
-    backlight {
-            compatible = "pwm-backlight";
-            pwms = <&ec 0 50000>;
-            power-supply = <&backlight_regulator>;
-    };
-
-    backlight_regulator: regulator-dummy {
-            compatible = "regulator-fixed";
-            regulator-name = "backlight";
-    };
-- 
2.45.2


