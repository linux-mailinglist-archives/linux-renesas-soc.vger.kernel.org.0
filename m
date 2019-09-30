Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 998C0C2031
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2019 13:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbfI3Lwc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Sep 2019 07:52:32 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39712 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfI3Lwb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Sep 2019 07:52:31 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0D9BA25B81B;
        Mon, 30 Sep 2019 21:52:23 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F3927944448; Mon, 30 Sep 2019 13:52:20 +0200 (CEST)
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
Subject: [PATCH v4 3/3] arm64: dts: qcom: msm8996: Update simple-pm-bus node name to 'bus'
Date:   Mon, 30 Sep 2019 13:52:05 +0200
Message-Id: <20190930115205.25204-4-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190930115205.25204-1-horms+renesas@verge.net.au>
References: <20190930115205.25204-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update simple-pm-bus node name from 'agnoc' to 'bus' reflecting the
proposed binding description in json-schema which in turn reflects the
Devicetree specification [1] v0.3-rc2.

  "The name of a node should be somewhat generic, reflecting the function
   of the device and not its precise programming model. If appropriate,
   the name should be one of the following choices:
     ...
     * bus
     ..."

Also drop the unit address as there is neither a reg property nor
non-empty ranges.

[1] https://www.devicetree.org/specifications/

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
*** Compile tested only ***

v4
* Update changelog
* Update reference in apq8096-db820c.dtsi

v3
* v2 was miss-posted as v3

v2
* New patch
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 04ad2fb22b9a..5a2297777592 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -439,7 +439,7 @@
 			enable-active-high;
 		};
 
-		agnoc@0 {
+		bus {
 			pcie@600000 {
 				status = "okay";
 				perst-gpio = <&msmgpio 35 GPIO_ACTIVE_LOW>;
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

