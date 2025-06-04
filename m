Return-Path: <linux-renesas-soc+bounces-17841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ED5ACE0B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 16:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27ED4188ED92
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 14:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2188C290D82;
	Wed,  4 Jun 2025 14:47:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C8628ECF0
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Jun 2025 14:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749048459; cv=none; b=ZL3Gyq3dQaZDAE9dDqYYXoSD1Ix4RAggSZ2jJ6BZnMxlXH/CZmpcS0YjwIYAo448r70mXaGUTTfW7yzNcP7ABbUXo3/5mJmO2v/HrImeYCkHMRGoF0jQfaDlwPjbok1CE4R0mU4/0I+UQqUNCg3UjVXEjqki1Etzk2PsliLhqdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749048459; c=relaxed/simple;
	bh=KRmbU1TPs2vjIOM5dP/3vR+K+M26/PFSDEjPQinhUeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+XfnhQnYeMyYLtQXVWV2/CWpwIvV+/onztg5H+IrXY7OI59r/uC8LefxPyJzAqL+O9pLCyZmUPbpx2wp5VslFkijfYSjN1UVlAU9EfrjTdaoT8e8d4CBBmYvnSSYh72ayQ3JE5kfPYobxmfkTVBGSRRWKDHffTxyfmI9FfyvKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FD7C4CEEF;
	Wed,  4 Jun 2025 14:47:37 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: ebisu: Add CAN0 support
Date: Wed,  4 Jun 2025 16:47:32 +0200
Message-ID: <612b999870dd64789041e4b0e9c568389b3fb95e.1749048320.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On R-Car E3, Classical CAN0/1 and CAN-FD share the same sets of pins, so
only one of them can be used at the same time.

Add support for using CAN0 instead of CAN-FD channel 0 on Ebisu.
By default, only CAN-FD channel 0 is enabled, as before.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Both CAN0 and CAN-FD channel 0 were tested on Ebisu-4D.

To be queued in renesas-devel for v6.17.
---
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 4f38b01ae18de4f7..c518638b58db129e 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -327,9 +327,18 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&can0 {
+	pinctrl-0 = <&can0_pins>;
+	pinctrl-names = "default";
+
+	/* Please only enable canfd or can0 */
+	/* status = "okay"; */
+};
+
 &canfd {
 	pinctrl-0 = <&canfd0_pins>;
 	pinctrl-names = "default";
+	/* Please only enable canfd or can0 */
 	status = "okay";
 
 	channel0 {
@@ -579,6 +588,11 @@ avb_pins: avb {
 		function = "avb";
 	};
 
+	can0_pins: can0 {
+		groups = "can0_data";
+		function = "can0";
+	};
+
 	canfd0_pins: canfd0 {
 		groups = "canfd0_data";
 		function = "canfd0";
-- 
2.43.0


