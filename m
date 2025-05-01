Return-Path: <linux-renesas-soc+bounces-16584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B03EAA603F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 16:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B520D1B6517B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 14:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2894E202990;
	Thu,  1 May 2025 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yr89XoSv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF301FAC50
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746111151; cv=none; b=pnXdL8BTQwx7RU4E4dtdBnZCutNrTTzSkPX89cQ0Ca7W5e9tvPhZoKgvZq4o4DHAXZB0VUsMdT8vilNSaIxSNOOW8JHAdqHvpgX9cEDAvoxP/CWBcO4gip1R0oFK3SFNdrL0RiGUQXbJBvDwfwRsYrfNlE2EoSe9cIij6lnhCCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746111151; c=relaxed/simple;
	bh=CvivHx6zQiU/f0yNP1Tms0GszCMnrsxCp1QG0WP7CE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGZxPb2F1l5QgJmSubZcBhSwpAljIyJlG9T3P/38i7M5o3vl9JN9efJT1fIKNFQyDm2ouKz7qr0faybYCFm2FxwrSBEwZKrdHENqge/H/5uxitVCHj+qBZ0Wm1Vj1MTGVD2FY5IDoI5/edkfeCff1VkeUZYkB7U0jJM3nC+6ZcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yr89XoSv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso1343745e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 May 2025 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746111147; x=1746715947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5RWR+w96MQZ0SIwAQjO8u33FmX1k3q3GS9f3Q0hAXM=;
        b=Yr89XoSvO2wq4x4HcT2/risi2sAKowYP9y/Tg/JWcxwHnh07FbBWHVifOydU1wrKmC
         HSsVjSHuzogAeGTF7j2ZQDMVh9PL1y/5//sIH8xVvL5bh05kmwwkVWrapSwBUJO2b3km
         6u/lBxFJ4j5irj9wU6ssB2Q7PXrrfpjZqfpQKGKs1BnARoUpicnIi16EGNG5HL9uQ8Nh
         QxmRm43IeV6gtjC5BtPXVO7AeRAZjtD7zjhFchJFWjYaKbMUYu3Rp+DE+corhLYpCD8e
         8b42D6qyQnMDgiHUAXatqp7axEPzcbT7imXstIhlT8LaN/2rNwES7CFET4IpFcMbmFdp
         AByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746111147; x=1746715947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5RWR+w96MQZ0SIwAQjO8u33FmX1k3q3GS9f3Q0hAXM=;
        b=jn7/yhTPzi7vra3gz9N++qOEmSd0Q1X+9D3aKtZK+3tAn4MFW7b0BJ5HkgspeXGOSk
         YMh++zxMN9mrFsvRq0ivkYrztaJxseFvYL9mwWH3N7o3It2c7mYLeXyX5hyM14ioXCgc
         2U+Scjr3e7wnUBxOLBO0zeA+sWU8/7VZ0UG3b3q3qc7L8kEWKEBvH/E93inxeXvuM8rI
         xidzY7FxoQwqltS6KLsemY5tUNKkq7zAWtp4qs6Jdqd1/gp3zQl2azc2rB3/36ee6oz5
         b88DbXZo1u2AHnGS4G9PiMOL68popkDeaVzPa2tt4Bpo3XiUng3iObUaZaIBSo9pluJX
         fBUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3hteHLZ3E4MHvrYgDFf/dJt6gi/f23PV+AdhPJ6iUw8y1liG21StMqXhwHseX0ox/himDo+F/+L/Gmkm0ZNr+3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx/6EpSnXkwkBRbN0pfs/Zm4T6BcpLqrettPHjnKOGo3J6yhm/
	TgSbj/xPp7DBMdAv0XNopJV3E8mdLhRJCmnUMAWrVJ3O86TzOAKPLGyaj3IK50Y=
X-Gm-Gg: ASbGncuVtLG072xyR90VKMNweA9prWj3D4fLnQ+Be/xR8nyrUcqtBH9Nd1pyhDL0w4p
	smSEbLhGVWJGk02Ac/INyjmMp/picIpEVcSTc+68wWvJoFDd9qtgYpS8+XhRASI/V9R9eOJcd32
	qh6U6YL5uzQD5RHNTNiUe1KuMO9kpv4Zxp8D5zPp0WciUls7aLxy+EcJx5+RIoXuUnF0dvz3S2V
	mN4n8epmFoV2THyKliHpdBN18BEbBTWiHG0mtcfdxT3lrQZM1dfbQmrVnPlwCKb96ZxSQCktEkH
	Zoz6utlUwJTcLjAXHqqGLMjFhZtTx63QpoJF+hXYM671gDWngQ==
X-Google-Smtp-Source: AGHT+IH+qjQ/G0ak0zl/JDFas3RnWC+IwIm1U8t87qvn11SYwasIEkT/2f/8fcQZGsBg1l1PbhNqIA==
X-Received: by 2002:a05:600c:8210:b0:439:a1c7:7b3a with SMTP id 5b1f17b1804b1-441b74725femr8056115e9.1.1746111147110;
        Thu, 01 May 2025 07:52:27 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89d15dasm14558175e9.16.2025.05.01.07.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 07:52:25 -0700 (PDT)
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
Subject: [PATCH v2 2/2] dt-bindings: mfd: Correct indentation and style in DTS example
Date: Thu,  1 May 2025 16:51:27 +0200
Message-ID: <20250501145125.59952-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250501145125.59952-3-krzysztof.kozlowski@linaro.org>
References: <20250501145125.59952-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18318; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=CvivHx6zQiU/f0yNP1Tms0GszCMnrsxCp1QG0WP7CE4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4puRm6pFqFpDxcw1qLibU+gAdGbERdlJBZe6
 gAiJG9Z5ZqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOKbgAKCRDBN2bmhouD
 10dWEACS2cKh1UmTFPcSzRCLxBdz3ibb7SilZKF7EuHV6ITxMAH3DUOUEWjPV+zEm8GU3U7zyQE
 wZMRzZJrImuUc7/Rmp/V7MReBDmIi/ej7DquRyCdsSUzWLhKGZB8I67FSLKaRrgtnt2NnzqVfX9
 uzLdlFxUBg0tSQmxu+hBTjG+Y//1VTlltj/34Lacg876zqfzc3WGdKT7Oo9HFMxvHksW2Y6BR3u
 n7BJ6buPql30IW4GTaEOkFzyQFGPOpsS5+Zp3VE3XwWGZmIQis2QKRe8hWaY1/LPA9hwMxtYZ4U
 CipyNzSLLaLdHIxZ+TNZwYcwazjbzMh9iWEtn235dCMJUfNXq6wV776JFZxRXmWabrT3fJNa31A
 MwAWkOZioTSPbrScS6SWzg7eNt9aXXH32x3XDR9JLmsWDjpb+sDMCe1i7ENAfcxQb3ZCH9/jDwb
 9vKcK+AOJPGwAMARvTS+qo/isirHtyD2MUXAb9GdReKEPkfo6CK+KOGovLVbSxZbVKluwg8Jru/
 4atjHdMkA/A6QSC81diUNER8s+zD70sS561PRTAmsnPOf9469jwzFk1UP+jauBd97erE6X8P05g
 ZymsUguZrEaMD1rUNxp/5Dikj8kbf5EjWtl8jhhGNWQos8+3sUVPSAoYFI5IMyRBQzzZb/CARFk sHuXMYtDcmlwEFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
unused labels.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Move pwm-leds removal hunk in iqs62x.yaml to prev patch (Geert)
---
 .../devicetree/bindings/mfd/iqs62x.yaml       | 146 +++++++--------
 .../bindings/mfd/netronix,ntxec.yaml          |  24 +--
 .../bindings/mfd/rohm,bd9571mwv.yaml          |  46 ++---
 .../bindings/mfd/x-powers,axp152.yaml         | 168 +++++++++---------
 4 files changed, 192 insertions(+), 192 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/iqs62x.yaml b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
index 3fc758664614..f242dd0e18fd 100644
--- a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
+++ b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
@@ -60,34 +60,34 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     i2c {
-            #address-cells = <1>;
-            #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-            iqs620a@44 {
-                    compatible = "azoteq,iqs620a";
-                    reg = <0x44>;
-                    interrupt-parent = <&gpio>;
-                    interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+        iqs620a@44 {
+            compatible = "azoteq,iqs620a";
+            reg = <0x44>;
+            interrupt-parent = <&gpio>;
+            interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 
-                    keys {
-                            compatible = "azoteq,iqs620a-keys";
+            keys {
+                compatible = "azoteq,iqs620a-keys";
 
-                            linux,keycodes = <KEY_SELECT>,
-                                             <KEY_MENU>,
-                                             <KEY_OK>,
-                                             <KEY_MENU>;
+                linux,keycodes = <KEY_SELECT>,
+                                 <KEY_MENU>,
+                                 <KEY_OK>,
+                                 <KEY_MENU>;
 
-                            hall-switch-south {
-                                    linux,code = <SW_LID>;
-                                    azoteq,use-prox;
-                            };
-                    };
-
-                    iqs620a_pwm: pwm {
-                            compatible = "azoteq,iqs620a-pwm";
-                            #pwm-cells = <2>;
-                    };
+                hall-switch-south {
+                    linux,code = <SW_LID>;
+                    azoteq,use-prox;
+                };
             };
+
+            iqs620a_pwm: pwm {
+                compatible = "azoteq,iqs620a-pwm";
+                #pwm-cells = <2>;
+            };
+        };
     };
 
   - |
@@ -96,37 +96,37 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     i2c {
-            #address-cells = <1>;
-            #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-            iqs620a@44 {
-                    compatible = "azoteq,iqs620a";
-                    reg = <0x44>;
-                    interrupt-parent = <&gpio>;
-                    interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+        iqs620a@44 {
+            compatible = "azoteq,iqs620a";
+            reg = <0x44>;
+            interrupt-parent = <&gpio>;
+            interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 
-                    firmware-name = "iqs620a_coil.bin";
+            firmware-name = "iqs620a_coil.bin";
 
-                    keys {
-                            compatible = "azoteq,iqs620a-keys";
+            keys {
+                compatible = "azoteq,iqs620a-keys";
 
-                            linux,keycodes = <0>,
-                                             <0>,
-                                             <0>,
-                                             <0>,
-                                             <0>,
-                                             <0>,
-                                             <KEY_MUTE>;
+                linux,keycodes = <0>,
+                                 <0>,
+                                 <0>,
+                                 <0>,
+                                 <0>,
+                                 <0>,
+                                 <KEY_MUTE>;
 
-                            hall-switch-north {
-                                    linux,code = <SW_DOCK>;
-                            };
+                hall-switch-north {
+                    linux,code = <SW_DOCK>;
+                };
 
-                            hall-switch-south {
-                                    linux,code = <SW_TABLET_MODE>;
-                            };
-                    };
+                hall-switch-south {
+                    linux,code = <SW_TABLET_MODE>;
+                };
             };
+        };
     };
 
   - |
@@ -135,36 +135,36 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     i2c {
-            #address-cells = <1>;
-            #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-            iqs624@44 {
-                    compatible = "azoteq,iqs624";
-                    reg = <0x44>;
-                    interrupt-parent = <&gpio>;
-                    interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+        iqs624@44 {
+            compatible = "azoteq,iqs624";
+            reg = <0x44>;
+            interrupt-parent = <&gpio>;
+            interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 
-                    keys {
-                            compatible = "azoteq,iqs624-keys";
+            keys {
+                compatible = "azoteq,iqs624-keys";
 
-                            linux,keycodes = <BTN_0>,
-                                             <0>,
-                                             <BTN_1>,
-                                             <0>,
-                                             <0>,
-                                             <0>,
-                                             <0>,
-                                             <0>,
-                                             <0>,
-                                             <0>,
-                                             <0>,
-                                             <0>,
-                                             <0>,
-                                             <0>,
-                                             <KEY_VOLUMEUP>,
-                                             <KEY_VOLUMEDOWN>;
-                    };
+                linux,keycodes = <BTN_0>,
+                                 <0>,
+                                 <BTN_1>,
+                                 <0>,
+                                 <0>,
+                                 <0>,
+                                 <0>,
+                                 <0>,
+                                 <0>,
+                                 <0>,
+                                 <0>,
+                                 <0>,
+                                 <0>,
+                                 <0>,
+                                 <KEY_VOLUMEUP>,
+                                 <KEY_VOLUMEDOWN>;
             };
+        };
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
index 06bada577acb..37fbb953ea12 100644
--- a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
+++ b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
@@ -48,18 +48,18 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
-            #address-cells = <1>;
-            #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-            ec: embedded-controller@43 {
-                    pinctrl-names = "default";
-                    pinctrl-0 = <&pinctrl_ntxec>;
+        ec: embedded-controller@43 {
+                pinctrl-names = "default";
+                pinctrl-0 = <&pinctrl_ntxec>;
 
-                    compatible = "netronix,ntxec";
-                    reg = <0x43>;
-                    system-power-controller;
-                    interrupt-parent = <&gpio4>;
-                    interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
-                    #pwm-cells = <2>;
-            };
+                compatible = "netronix,ntxec";
+                reg = <0x43>;
+                system-power-controller;
+                interrupt-parent = <&gpio4>;
+                interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+                #pwm-cells = <2>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd9571mwv.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd9571mwv.yaml
index 534cf03f36bb..47611c2a982c 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd9571mwv.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd9571mwv.yaml
@@ -99,29 +99,29 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     i2c {
-          #address-cells = <1>;
-          #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-          pmic: pmic@30 {
-                  compatible = "rohm,bd9571mwv";
-                  reg = <0x30>;
-                  interrupt-parent = <&gpio2>;
-                  interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-                  interrupt-controller;
-                  #interrupt-cells = <2>;
-                  gpio-controller;
-                  #gpio-cells = <2>;
-                  rohm,ddr-backup-power = <0xf>;
-                  rohm,rstbmode-pulse;
+        pmic: pmic@30 {
+            compatible = "rohm,bd9571mwv";
+            reg = <0x30>;
+            interrupt-parent = <&gpio2>;
+            interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            rohm,ddr-backup-power = <0xf>;
+            rohm,rstbmode-pulse;
 
-                  regulators {
-                          dvfs: dvfs {
-                                  regulator-name = "dvfs";
-                                  regulator-min-microvolt = <750000>;
-                                  regulator-max-microvolt = <1030000>;
-                                  regulator-boot-on;
-                                  regulator-always-on;
-                          };
-                  };
-          };
+            regulators {
+                dvfs: dvfs {
+                    regulator-name = "dvfs";
+                    regulator-min-microvolt = <750000>;
+                    regulator-max-microvolt = <1030000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+            };
+        };
     };
diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 3f7661bdd202..45f015d63df1 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -316,106 +316,106 @@ additionalProperties: false
 
 examples:
   - |
-      i2c {
-          #address-cells = <1>;
-          #size-cells = <0>;
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-          pmic@30 {
-              compatible = "x-powers,axp152";
-              reg = <0x30>;
-              interrupts = <0>;
-              interrupt-controller;
-              #interrupt-cells = <1>;
-          };
-      };
+        pmic@30 {
+            compatible = "x-powers,axp152";
+            reg = <0x30>;
+            interrupts = <0>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+        };
+    };
 
   - |
-      #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
 
-      i2c {
-          #address-cells = <1>;
-          #size-cells = <0>;
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-          pmic@34 {
-              compatible = "x-powers,axp209";
-              reg = <0x34>;
-              interrupt-parent = <&nmi_intc>;
-              interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-              interrupt-controller;
-              #interrupt-cells = <1>;
+        pmic@34 {
+            compatible = "x-powers,axp209";
+            reg = <0x34>;
+            interrupt-parent = <&nmi_intc>;
+            interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
 
-              ac_power_supply: ac-power {
-                  compatible = "x-powers,axp202-ac-power-supply";
-              };
+            ac_power_supply: ac-power {
+                compatible = "x-powers,axp202-ac-power-supply";
+            };
 
-              axp_adc: adc {
-                  compatible = "x-powers,axp209-adc";
-                  #io-channel-cells = <1>;
-              };
+            axp_adc: adc {
+                compatible = "x-powers,axp209-adc";
+                #io-channel-cells = <1>;
+            };
 
-              axp_gpio: gpio {
-                  compatible = "x-powers,axp209-gpio";
-                  gpio-controller;
-                  #gpio-cells = <2>;
+            axp_gpio: gpio {
+                compatible = "x-powers,axp209-gpio";
+                gpio-controller;
+                #gpio-cells = <2>;
 
-                  gpio0-adc-pin {
-                      pins = "GPIO0";
-                      function = "adc";
-                  };
-              };
+                gpio0-adc-pin {
+                    pins = "GPIO0";
+                    function = "adc";
+                };
+            };
 
-              battery_power_supply: battery-power {
-                  compatible = "x-powers,axp209-battery-power-supply";
-              };
+            battery_power_supply: battery-power {
+                compatible = "x-powers,axp209-battery-power-supply";
+            };
 
-              regulators {
-                  /* Default work frequency for buck regulators */
-                  x-powers,dcdc-freq = <1500>;
+            regulators {
+                /* Default work frequency for buck regulators */
+                x-powers,dcdc-freq = <1500>;
 
-                  reg_dcdc2: dcdc2 {
-                      regulator-always-on;
-                      regulator-min-microvolt = <1000000>;
-                      regulator-max-microvolt = <1450000>;
-                      regulator-name = "vdd-cpu";
-                  };
+                reg_dcdc2: dcdc2 {
+                    regulator-always-on;
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1450000>;
+                    regulator-name = "vdd-cpu";
+                };
 
-                  reg_dcdc3: dcdc3 {
-                      regulator-always-on;
-                      regulator-min-microvolt = <1000000>;
-                      regulator-max-microvolt = <1400000>;
-                      regulator-name = "vdd-int-dll";
-                  };
+                reg_dcdc3: dcdc3 {
+                    regulator-always-on;
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1400000>;
+                    regulator-name = "vdd-int-dll";
+                };
 
-                  reg_ldo1: ldo1 {
-                      /* LDO1 is a fixed output regulator */
-                      regulator-always-on;
-                      regulator-min-microvolt = <1300000>;
-                      regulator-max-microvolt = <1300000>;
-                      regulator-name = "vdd-rtc";
-                  };
+                reg_ldo1: ldo1 {
+                    /* LDO1 is a fixed output regulator */
+                    regulator-always-on;
+                    regulator-min-microvolt = <1300000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-name = "vdd-rtc";
+                };
 
-                  reg_ldo2: ldo2 {
-                      regulator-always-on;
-                      regulator-min-microvolt = <3000000>;
-                      regulator-max-microvolt = <3000000>;
-                      regulator-name = "avcc";
-                  };
+                reg_ldo2: ldo2 {
+                    regulator-always-on;
+                    regulator-min-microvolt = <3000000>;
+                    regulator-max-microvolt = <3000000>;
+                    regulator-name = "avcc";
+                };
 
-                  reg_ldo3: ldo3 {
-                      regulator-name = "ldo3";
-                  };
+                reg_ldo3: ldo3 {
+                    regulator-name = "ldo3";
+                };
 
-                  reg_ldo4: ldo4 {
-                      regulator-name = "ldo4";
-                  };
+                reg_ldo4: ldo4 {
+                    regulator-name = "ldo4";
+                };
 
-                  reg_ldo5: ldo5 {
-                      regulator-name = "ldo5";
-                  };
-              };
+                reg_ldo5: ldo5 {
+                    regulator-name = "ldo5";
+                };
+            };
 
-              usb_power_supply: usb-power {
-                  compatible = "x-powers,axp202-usb-power-supply";
-              };
-          };
-      };
+            usb_power_supply: usb-power {
+                compatible = "x-powers,axp202-usb-power-supply";
+            };
+        };
+    };
-- 
2.45.2


