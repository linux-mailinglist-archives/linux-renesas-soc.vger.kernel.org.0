Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0489E48CD4A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 21:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357815AbiALUwe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 15:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357809AbiALUw0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 15:52:26 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65748C061751
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jan 2022 12:52:25 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id g11so12493013lfu.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jan 2022 12:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sP7Atry2N3guYLGotYX50XIh/vsdLbrGgoNtgVQKKzE=;
        b=FV0ivb7w+5wU4Lc5BQTTDOSgTta37bALlNIrGC9qVLCJopdTXWny5fe49zBOdIx5PQ
         p9jxL3STfUYwuVKvpcsHWOhQieO0N/eR7jpLcFRa+lY61feQkaTTeTSvXIkHUWI/lcIh
         9rdPF5FfBR6jDJT89wyJU/JFd4uDa3KPEk+YBTWtmo+7R09OrcEgvOCBQfKMK6QsCiBc
         zkWNcJbveBcOK2b4gwExy/2iQUQEkldF7njtitajQLoarRkPLfUruU0hxrWYvZ65d8nm
         OzKTJOcvcNwXO+BwdRe6ore55L9VCe7I8wtnBvzxQ2lkELwBgU8dXEqUPZomInqEIE4s
         jcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sP7Atry2N3guYLGotYX50XIh/vsdLbrGgoNtgVQKKzE=;
        b=BcpR/rJWg0c9oWNB57KD+Rww5E7M2alb4DWMHK8VH4tDBeyEg0I+RPjlhuO5fVnptG
         E5jqJXLT08aY5xsQYrUisR1LpgUsj1zP0OBuviAlXnPPivUChF84BNmZHovuYZmlF311
         TveFUWULTvSMG0OP7uKXMd/lYTSOOjpREPzv2+a0O/fM4l2RfMshowK+87NeVcOUsEFo
         k/wnpNYhjCqv3Vs9h8fF9k7VqosyYRSsbDVKWSqNYiWHNdW4qz2q1aJij4J0esaLvtjH
         iBg0WI+K8I+kTxuRypZPFbl51pGg/K33KeUlwX9LvOZykL6dg8KVtNFxeacZwtNl7Ruj
         1tpw==
X-Gm-Message-State: AOAM531otDR266vOBbVgwFgwR3LU3UF459pq6EzKkRhISr73WQeCyPwD
        aN1ZcToFxlcxTOCl3v7uQEDACQ==
X-Google-Smtp-Source: ABdhPJwlFZVUZFUtJD8z1SzKaf4SvPDlqM8UKq1To33EQU6HEM5Fbg0Gyuh+wRBEKozxZY/cfzT/kg==
X-Received: by 2002:ac2:58c2:: with SMTP id u2mr1127878lfo.66.1642020743802;
        Wed, 12 Jan 2022 12:52:23 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id r11sm64195ljp.18.2022.01.12.12.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 12:52:23 -0800 (PST)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: ulcb-kf: add 9-asix sensor device
Date:   Wed, 12 Jan 2022 23:52:05 +0300
Message-Id: <20220112205205.4082026-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This adds nodes for lsm9ds0 sensor installed on the KF board.

With this patch, the sensor data becomes available over iio sysfs
interface.

Interrupt definition is not added yet, because the interrupt lines of
lsm9ds0 are pulled to VCC on the board, which implies need for
active-low configuration. But st_sensors drivers currently can't work
with active-low interrupts on this chip.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index a66301a4081d..d122e645a892 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -66,6 +66,13 @@ hdmi_3v3: regulator-hdmi-3v3 {
 		regulator-max-microvolt = <3300000>;
 	};
 
+	accel_3v3: regulator-acc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "accel-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	hdmi1-out {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -208,6 +215,22 @@ pcm3168a_endpoint_c: endpoint {
 					};
 				};
 			};
+
+			lsm9ds0_acc_mag@1d {
+				compatible = "st,lsm9ds0-imu";
+				reg = <0x1d>;
+
+				vdd-supply = <&accel_3v3>;
+				vddio-supply = <&accel_3v3>;
+			};
+
+			lsm9ds0_gyro@6b {
+				compatible = "st,lsm9ds0-gyro";
+				reg = <0x6b>;
+
+				vdd-supply = <&accel_3v3>;
+				vddio-supply = <&accel_3v3>;
+			};
 		};
 	};
 
-- 
2.30.2

