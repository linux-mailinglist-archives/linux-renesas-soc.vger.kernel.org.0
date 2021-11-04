Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD33445C40
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Nov 2021 23:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbhKDWnW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Nov 2021 18:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbhKDWnV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Nov 2021 18:43:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8319C061714;
        Thu,  4 Nov 2021 15:40:42 -0700 (PDT)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 474971C58;
        Thu,  4 Nov 2021 23:40:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636065638;
        bh=pwQ8PywbEWezS3pkicK5TiE9zztkpYMXsSdJcYo5Wlk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IcH/oM1GA6iBfLrzCm8KHqt6yk+EEnWB3I6+Navx9KVrZGUPExLtb0ue0N+VpVNZA
         uxFFD1JV0WJRFyqcGWWilhK4dAA8U9YuD644iWLdkaN4NNi6y+buUTVPJu8+tKoQ2R
         aFOcYUWj6hd4UrQVg+X27GmVj0uKOSQqEkJQKCyo=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 4/9] arm64: dts: renesas: r8a77951: Fix thermal bindings
Date:   Thu,  4 Nov 2021 22:40:28 +0000
Message-Id: <20211104224033.3997504-5-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211104224033.3997504-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211104224033.3997504-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The binding node names for the thermal zones are not successfully
validated by the dt-schemas.

Fix the validation by changing from sensor-thermalN to sensorN-thermal
and sensor_thermalN to sensorN_thermal.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 1768a3e6bb8d..193d81be40fc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -3375,7 +3375,7 @@ prr: chipid@fff00044 {
 	};
 
 	thermal-zones {
-		sensor_thermal1: sensor-thermal1 {
+		sensor1_thermal: sensor1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 0>;
@@ -3390,7 +3390,7 @@ sensor1_crit: sensor1-crit {
 			};
 		};
 
-		sensor_thermal2: sensor-thermal2 {
+		sensor2_thermal: sensor2-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 1>;
@@ -3405,7 +3405,7 @@ sensor2_crit: sensor2-crit {
 			};
 		};
 
-		sensor_thermal3: sensor-thermal3 {
+		sensor3_thermal: sensor3-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 2>;
-- 
2.30.2

