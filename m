Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C4A201C4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2020 22:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391018AbgFSUWi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Jun 2020 16:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389372AbgFSUWh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jun 2020 16:22:37 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD85C06174E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2020 13:22:36 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id i3so12949499ljg.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2020 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b6c7Bimc+oKUhwNH+CrmCVQQ64zzB2HfVNf/0wT1Tn0=;
        b=1fb9oPUV0O4xiqM9M7QOWLm3rvNSJw3oavO88KbJWTc50MsP8blQQ3Mv6ZYvoDYhus
         iz7uxa8KIKxWPFUwH/2rLjrP7a0glYYL4dxKRswz7INSyubQ9kwHytxfnMgtBeEuPW63
         EeoFMcCWTqcEDlFK2NcagDCPQDB7tPrU55jeg0CVTPlfCkHfjA4T1wgal6Td5ekWLlay
         4/kSsI/1O2j/J+UAWod6HEOyFD1GmHX1GV4bJhcmCnEcwWlf5viDlEUf1u5a7w7XCvDP
         pAjeRsptMkjS01L+CYM3miqaKRjqP5nbBqqpmSKUlPhfPtommWoajD3uH32EebpNpPPS
         1IZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=b6c7Bimc+oKUhwNH+CrmCVQQ64zzB2HfVNf/0wT1Tn0=;
        b=GR7LZLdnjj0E3dv+wsl05HRMnB9dBV4lLhB/ZuTEBUn1WtQI7JpWexTkgp6NrjIHCn
         9Bga+3a9aXfQttYReumjJa35uIhjRcYRw/Jiojbbi9+7wd35ksjlI8yyDOPkIZQ7aM4C
         z3sU1QB1K8eqWMLAeRucXMtl2j2GYKMq1+3grAv8NNSDXtcApIb3U5ptk10Sqw9cjPPo
         s6u+9QYIlSIAIfZ2zr15/DjDt/vs15riziuzypUUjYvlfCPxcsoXrGvQW59Wbtm6JHTD
         vW7t6JvKNY12fxIeh23q1ZkVxdEuLSM9zmkSiFH4Vb5ANBxMb5Og7SgR+xzlN5tLn5gc
         97vw==
X-Gm-Message-State: AOAM530LfFOfFeRq39Pe8pGxP3xv11q1m2KrEkixZXuTk4/CUkha9dG4
        2B+gNhR+PjMmdVm1YBUs+adF2w==
X-Google-Smtp-Source: ABdhPJwGlPuVbi9IvBDG9em/doS0iE52twC7r4mAbwaPZmvsRIvUinD5vaj+b8q+j+XvZtO0faZPmQ==
X-Received: by 2002:a2e:9d8c:: with SMTP id c12mr2532451ljj.230.1592598154548;
        Fri, 19 Jun 2020 13:22:34 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:441c:ac8f:7564:6e7d:9e36:7ded])
        by smtp.gmail.com with ESMTPSA id m11sm1588319lfl.70.2020.06.19.13.22.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 13:22:34 -0700 (PDT)
Subject: [PATCH v2 2/2] arm64: dts: renesas: r8a77980: eagle/v3msk: add QSPI
 flash support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
References: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <fca1d012-29bf-eead-1c0d-4dd837c0bc68@cogentembedded.com>
Date:   Fri, 19 Jun 2020 23:22:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Define the Eagle/V3MSK board dependent parts of the RPC-IF device node.
Add device nodes for Spansion S25FS512S SPI flash and MTD partitions on it.

Based on the original patches by Dmitry Shifrin.

Signed-off-by: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   67 +++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts |   67 +++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

Index: renesas-devel/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
===================================================================
--- renesas-devel.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ renesas-devel/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -187,12 +187,79 @@
 		function = "i2c0";
 	};
 
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
 	};
 };
 
+&rpc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootparam@0 {
+				reg = <0x00000000 0x040000>;
+				read-only;
+			};
+			cr7@40000 {
+				reg = <0x00040000 0x080000>;
+				read-only;
+			};
+			cert_header_sa3@c0000 {
+				reg = <0x000c0000 0x080000>;
+				read-only;
+			};
+			bl2@140000 {
+				reg = <0x00140000 0x040000>;
+				read-only;
+			};
+			cert_header_sa6@180000 {
+				reg = <0x00180000 0x040000>;
+				read-only;
+			};
+			bl31@1c0000 {
+				reg = <0x001c0000 0x460000>;
+				read-only;
+			};
+			uboot@640000 {
+				reg = <0x00640000 0x0c0000>;
+				read-only;
+			};
+			uboot-env@700000 {
+				reg = <0x00700000 0x040000>;
+				read-only;
+			};
+			dtb@740000 {
+				reg = <0x00740000 0x080000>;
+			};
+			kernel@7c0000 {
+				reg = <0x007c0000 0x1400000>;
+			};
+			user@1bc0000 {
+				reg = <0x01bc0000 0x2440000>;
+			};
+		};
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
Index: renesas-devel/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
===================================================================
--- renesas-devel.orig/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ renesas-devel/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -212,12 +212,79 @@
 		power-source = <3300>;
 	};
 
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
 	};
 };
 
+&rpc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootparam@0 {
+				reg = <0x00000000 0x040000>;
+				read-only;
+			};
+			cr7@40000 {
+				reg = <0x00040000 0x080000>;
+				read-only;
+			};
+			cert_header_sa3@c0000 {
+				reg = <0x000c0000 0x080000>;
+				read-only;
+			};
+			bl2@140000 {
+				reg = <0x00140000 0x040000>;
+				read-only;
+			};
+			cert_header_sa6@180000 {
+				reg = <0x00180000 0x040000>;
+				read-only;
+			};
+			bl31@1c0000 {
+				reg = <0x001c0000 0x460000>;
+				read-only;
+			};
+			uboot@640000 {
+				reg = <0x00640000 0x0c0000>;
+				read-only;
+			};
+			uboot-env@700000 {
+				reg = <0x00700000 0x040000>;
+				read-only;
+			};
+			dtb@740000 {
+				reg = <0x00740000 0x080000>;
+			};
+			kernel@7c0000 {
+				reg = <0x007c0000 0x1400000>;
+			};
+			user@1bc0000 {
+				reg = <0x01bc0000 0x2440000>;
+			};
+		};
+	};
+};
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
