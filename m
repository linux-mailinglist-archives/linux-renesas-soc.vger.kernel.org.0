Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5703BC4FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2019 11:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504278AbfIXJhA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Sep 2019 05:37:00 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42618 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504273AbfIXJhA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 05:37:00 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 53A2925BDE1;
        Tue, 24 Sep 2019 19:36:51 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3D647944438; Tue, 24 Sep 2019 11:36:49 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 3/3] arm64: dts: qcom: msm8996: Update simple-pm-bus node name to 'bus'
Date:   Tue, 24 Sep 2019 11:36:09 +0200
Message-Id: <20190924093609.22895-4-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190924093609.22895-1-horms+renesas@verge.net.au>
References: <20190924093609.22895-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update simple-pm-bus node name from 'agnoc' to 'bus' reflecting the
proposed binding description in json-schema which in turn reflects the ePAR
standard - "the name of a node should be somewhat generic, reflecting the
function of the device and not its precise programming model."

Also drop the unit address as there is neither a reg property nor
non-empty ranges.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v2
* New patch
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 96c0a481f454..99f376ebd27e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1373,7 +1373,7 @@
 			clock-names = "iface", "bus";
 		};
 
-		agnoc@0 {
+		bus {
 			power-domains = <&gcc AGGRE0_NOC_GDSC>;
 			compatible = "simple-pm-bus";
 			#address-cells = <1>;
-- 
2.11.0

