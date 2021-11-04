Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCE05445C3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Nov 2021 23:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbhKDWnU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Nov 2021 18:43:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49130 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232397AbhKDWnT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Nov 2021 18:43:19 -0400
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E536A1C4C;
        Thu,  4 Nov 2021 23:40:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636065638;
        bh=EuzVQhdEtwXTXwkbx/vYV40HSj57XPi3AHWA8OoE/H8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E4wMUlJ5Xh9pLJQOSI9H03xwodq1/d1gXSkI8oAPitZ/S3oG2+TaHfkn/RGm9puCP
         qPqcJKRk23dub/nymEQ85xnvGcD2nrNdgALOFeb2jFOubDJ3jhFmDqlj039YyT/HqT
         +PUalnMeUKVdQZPDtzLUE8ix8bQSNF5d1MYxl/Ho=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 3/9] arm64: dts: renesas: r8a774e1: Fix thermal bindings
Date:   Thu,  4 Nov 2021 22:40:27 +0000
Message-Id: <20211104224033.3997504-4-kieran.bingham+renesas@ideasonboard.com>
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
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 379a1300272b..62209ab6deb9 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -2904,7 +2904,7 @@ prr: chipid@fff00044 {
 	};
 
 	thermal-zones {
-		sensor_thermal1: sensor-thermal1 {
+		sensor1_thermal: sensor1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 0>;
@@ -2919,7 +2919,7 @@ sensor1_crit: sensor1-crit {
 			};
 		};
 
-		sensor_thermal2: sensor-thermal2 {
+		sensor2_thermal: sensor2-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 1>;
@@ -2934,7 +2934,7 @@ sensor2_crit: sensor2-crit {
 			};
 		};
 
-		sensor_thermal3: sensor-thermal3 {
+		sensor3_thermal: sensor3-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 2>;
-- 
2.30.2

