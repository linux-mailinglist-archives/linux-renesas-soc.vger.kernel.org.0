Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E8134A5D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Mar 2021 11:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhCZKuu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Mar 2021 06:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhCZKuo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Mar 2021 06:50:44 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDAF3C0613B5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Mar 2021 03:50:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5cae:bca6:def7:9f08])
        by baptiste.telenet-ops.be with bizsmtp
        id kyqD2400K53vE1T01yqDyF; Fri, 26 Mar 2021 11:50:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPk2f-00AWWa-4M; Fri, 26 Mar 2021 11:50:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPk2e-006ban-I5; Fri, 26 Mar 2021 11:50:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Dien Pham <dien.pham.ry@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: salvator-common: Add cpu-supply property to a57_0 node
Date:   Fri, 26 Mar 2021 11:50:08 +0100
Message-Id: <20210326105009.1574424-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326105009.1574424-1-geert+renesas@glider.be>
References: <20210326105009.1574424-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Dien Pham <dien.pham.ry@renesas.com>

Add the cpu-supply property to the a57_0 node, so Dynamic Voltage and
Frequency Scaling (DVFS) can change the CPU core voltage.

Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 581667c9fa748191..20243ffde649876d 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -326,6 +326,10 @@ x23_clk: x23-clock {
 	};
 };
 
+&a57_0 {
+	cpu-supply = <&dvfs>;
+};
+
 &audio_clk_a {
 	clock-frequency = <22579200>;
 };
-- 
2.25.1

