Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DB2445C35
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Nov 2021 23:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbhKDWnR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Nov 2021 18:43:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49118 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhKDWnR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Nov 2021 18:43:17 -0400
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C404D1A38;
        Thu,  4 Nov 2021 23:40:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636065637;
        bh=WvipT2cpgwMzjhFgj73FB3Z/tLRB/E5RHdkEO7P5xrE=;
        h=From:To:Cc:Subject:Date:From;
        b=Bl5TpH8arlOBtap1V09Zf1DyIuXJc2zFNi694EgLVouP0fdRT4t4TPXKH/jBaJ8yP
         inRFDCxh03JNdL54UYkkreG1HEQc5DaVpoQ2yYXxQDr9tOHKvRzmcW24Xvti+48Z4b
         Tgxk8SY4MAozvFhvBt1kpEUmbdy1Y2gPEckxmqo0=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/9] arm64: dts: renesas: Thermal binding validation
Date:   Thu,  4 Nov 2021 22:40:24 +0000
Message-Id: <20211104224033.3997504-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The thermal sensor bindings were not matched correctly against the
expected naming scheme.

r8a77980.dtsi also used a different naming scheme compared to the other
related platforms.

This series cleans up the dtsi files for the CPU target thermal sensors,
allowing the validation to run.

Enabling this validation shows up a new validation failure:

linux/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dt.yaml: thermal-zones: sensor3-thermal:cooling-maps:map0:contribution:0:0: 1024 is greater than the maximum of 100
	From schema: Documentation/devicetree/bindings/thermal/thermal-zones.yaml

This validation error appears to be pervasive across all of these
bindings, but changing that will be more invasive and require someone to
perform dedicated testing with the thermal drivers to ensure that the
updates to the ranges do not cause unexpected side effects.

Kieran Bingham (9):
  arm64: dts: renesas: r8a774a1: Fix thermal bindings
  arm64: dts: renesas: r8a774b1: Fix thermal bindings
  arm64: dts: renesas: r8a774e1: Fix thermal bindings
  arm64: dts: renesas: r8a77951: Fix thermal bindings
  arm64: dts: renesas: r8a77960: Fix thermal bindings
  arm64: dts: renesas: r8a77961: Fix thermal bindings
  arm64: dts: renesas: r8a77965: Fix thermal bindings
  arm64: dts: renesas: r8a77980: Fix thermal bindings
  arm64: dts: renesas: r8a779a0: Fix thermal bindings

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi |  6 +++---
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi |  6 +++---
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi |  6 +++---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi |  6 +++---
 arch/arm64/boot/dts/renesas/r8a77960.dtsi |  6 +++---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi |  6 +++---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi |  6 +++---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |  4 ++--
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 10 +++++-----
 9 files changed, 28 insertions(+), 28 deletions(-)

-- 
2.30.2

