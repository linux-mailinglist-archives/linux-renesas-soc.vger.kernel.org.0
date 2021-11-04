Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C147445C4A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Nov 2021 23:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbhKDWn2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Nov 2021 18:43:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49162 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232468AbhKDWn0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Nov 2021 18:43:26 -0400
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C20A72D3F;
        Thu,  4 Nov 2021 23:40:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636065640;
        bh=nUtt83jI2VLNoUGz/3EPiNUXCgU/0Tnr7guLw7hryTs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oUflOgw84HWaQUDnZoKCsS6xXG2R2uJvsr/jAZ2KumuOfkPSjmDcb16Gw5uwr8OjI
         pvBp2teun7Hxs8Px0bOMO/oeijsEgLN65TzlPv12KyC+0zKDk06BtL/OhY7wJt4eRq
         BNTdF/Htb4kYvwpOb63Xv82ni9nKnfwpod843hOs=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 8/9] arm64: dts: renesas: r8a77980: Fix thermal bindings
Date:   Thu,  4 Nov 2021 22:40:32 +0000
Message-Id: <20211104224033.3997504-9-kieran.bingham+renesas@ideasonboard.com>
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

Fix the validation by changing from thermal-sensor-N to sensorN-thermal
and providing node labels of the form sensorN_thermal to ensure
consistency with the other platform implementations.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 6347d15e66b6..21fe602bd25a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1580,7 +1580,7 @@ prr: chipid@fff00044 {
 	};
 
 	thermal-zones {
-		thermal-sensor-1 {
+		sensor1_thermal: sensor1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 0>;
@@ -1599,7 +1599,7 @@ sensor1-critical {
 			};
 		};
 
-		thermal-sensor-2 {
+		sensor2_thermal: sensor2-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 1>;
-- 
2.30.2

