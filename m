Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE2945EAD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 10:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376442AbhKZKAH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 05:00:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49528 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376588AbhKZJ6F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 04:58:05 -0500
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB43CE2C;
        Fri, 26 Nov 2021 10:54:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637920491;
        bh=gDWf41GJ9wF0lnHEXzdtH0ScCqfwcfOYTY8fNdxgyTQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gNrU0LTY85tles7val6sqq7JGvSGccgZJakYIh1nxxKnd400qHZnU+z4uKRi+dTQ6
         jDA2EWoIxOMB36aXqS2kqL5gNT+mpI5+BCm0cTN91lCwdlLRC5vXVQ0mOZH6V5BgS9
         qJFDVx7NuOrXei9ChESds4pO9L129lceAogaowgQ=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 4/4] arm64: dts: renesas: r8a779a0: Provide default DSI data-lanes
Date:   Fri, 26 Nov 2021 09:54:45 +0000
Message-Id: <20211126095445.932930-5-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211126095445.932930-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211126095445.932930-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The data-lanes is a mandatory property for the endpoints.
Provide a default when not connected that represents the maximum
lanes supported by the device.

A connected device should override the data-lanes if it uses a lower
number of lanes.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---

This patch is split from 2/4 to keep it's change for distinct review.
The data-lanes is marked as a mandatory property in the DSI bindings
(which are out of tree, most recent posting at [0])

[0] https://lore.kernel.org/all/YQGFP%2FcFoSksPyn+@pendragon.ideasonboard.com/

The data-lanes property is marked as mandatory, which means it needs to
be provided even when supplying the port templates which get overridden
later. Is this expected behaviour?

Does this have sufficient meaning? Or will it always have to be
specified by any node overriding anyway...?


 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index fdad8bc4a069..7322c4628e2b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -2661,6 +2661,7 @@ dsi0_in: endpoint {
 				port@1 {
 					reg = <1>;
 					dsi0_out: endpoint {
+						data-lanes = <1 2 3 4>;
 					};
 				};
 			};
@@ -2691,7 +2692,9 @@ dsi1_in: endpoint {
 
 				port@1 {
 					reg = <1>;
+
 					dsi1_out: endpoint {
+						data-lanes = <1 2 3 4>;
 					};
 				};
 			};
-- 
2.30.2

