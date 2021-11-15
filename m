Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE55C450602
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 14:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233656AbhKONyL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 08:54:11 -0500
Received: from mail.iot.bzh ([51.75.236.24]:18910 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231956AbhKONyF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:54:05 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id CE0FB1B8A7;
        Mon, 15 Nov 2021 14:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:in-reply-to:message-id
        :mime-version:references:reply-to:subject:subject:to:to; s=
        iot.bzh; bh=EWVFdseFq6sEbPV1Xda1BgTS3GPVp9M+VQwQqPIMp2A=; b=hJzC
        SovTQxarz2n8r8h0llFScdh+HCKWfgz/1atIxgu5x1EelZOSkc6iRHl/j++pujD3
        G6lSlDoEqOMVAls6X7vKuorQ0hlB2tqWgVyQ5YizZQNU0noyGh6KkGZS01phY7sm
        K0lF62rtuvmH2a3VC+85iJH7wAONWMaUEvef3PGG0Zhxs+Bapcif74ul/RKfWp7T
        HqLxkhLEQUlj1cJ02awVHEk4DmdZPmVoCg7bfQ/10tq9FbgWKlaagDAE0RchlYJN
        r9J2km3H5JYjL7QZLs4ipnKof34+dRIoVUiH39nycJh4dmy1089BoH8qvzQmncwW
        XuqCMXWlCeCdxZr7lg==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH v1 2/3] arm64: dts: renesas: r8a77951: Add CR7 realtime processor
Date:   Mon, 15 Nov 2021 14:50:31 +0100
Message-Id: <20211115135032.129227-3-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115135032.129227-1-julien.massot@iot.bzh>
References: <20211115135032.129227-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

r8a77951 as some other members of rcar gen3 soc series
has a Cortex R7 processor.
This processor shares the same mapped devices and memory mapping.

Choose 0x40040000 area to store the Cortex-R7 firmware.

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
---

No change since RFC, Geert most likely it sounds better
to drop this patch in v2 ?

---
 arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
index 06d4e948eb0f..703d0d33efe6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
@@ -34,6 +34,16 @@ memory@700000000 {
 		device_type = "memory";
 		reg = <0x7 0x00000000 0x0 0x40000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		cr7_ram: cr7_ram@40040000 {
+			no-map;
+			reg = <0x0 0x40040000 0x0 0x1fc0000>;
+		};
+	};
 };
 
 &du {
@@ -48,3 +58,8 @@ &du {
 	clock-names = "du.0", "du.1", "du.2", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
 };
+
+&cr7_rproc {
+	memory-region = <&cr7_ram>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 1768a3e6bb8d..3ee247fc5aec 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -366,6 +366,13 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		cr7_rproc: cr7 {
+			compatible = "renesas,rcar-cr7";
+			power-domains = <&sysc R8A7795_PD_CR7>;
+			resets = <&cpg 222>;
+			status = "disabled";
+		};
+
 		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
-- 
2.31.1


