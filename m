Return-Path: <linux-renesas-soc+bounces-7418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDD8938E84
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB9C6B207C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E0816D308;
	Mon, 22 Jul 2024 11:55:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61F31EB56
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649353; cv=none; b=q+UIuVFlAojiHAGsm40dZNifzwFNDCx5OJOWwTaNsGlxg2uwbZLPJSvloCMegw5FwcYSqXwDqp77+XpHfYwBFchLDDYaTAivxzHr3gW6y7TLMEmQ+D6WDF6DQYHM3s2g/2wwxzwW/U8zFh0QtinueHuqP3hj18rd2/bSf4IVsgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649353; c=relaxed/simple;
	bh=/IeHSBzFcGMxyiygcHPEPOkzqIlj6VCby8rWXMlWJ6A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hLxuHewsOBsVixhUheLa6nd/uAZwAKuiZVP7BmHbGIP6uoMK3vzpZb6SgBeK0ksS4X3WrZQwxLBPjOQelppku5tdgwR5EEOnUjvkzAH9JT7wZnyhoH5wHBU9/DsBhGHYHFkf7efcDDG42+A/+Y2TVVT+Ax82Oki+cX9ijQwFN9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by michel.telenet-ops.be with bizsmtp
	id qbvo2C0081wvoRx06bvoCX; Mon, 22 Jul 2024 13:55:49 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrdZ-002zCa-H3;
	Mon, 22 Jul 2024 13:55:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrds-0020l4-0e;
	Mon, 22 Jul 2024 13:55:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: gray-hawk-single: Add push switches
Date: Mon, 22 Jul 2024 13:55:40 +0200
Message-Id: <41b8277d4b630e0c296375888d9b958448d02cde.1721649057.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721649057.git.geert+renesas@glider.be>
References: <cover.1721649057.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the three Push Switches on the Gray Hawk Single board, so they
can be used for user input.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index ae2ad93228110905..b4fcf6c0cea26840 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -9,6 +9,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 #include "r8a779h0.dtsi"
 
@@ -38,6 +39,37 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
+	keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&keys_pins>;
+		pinctrl-names = "default";
+
+		key-1 {
+			gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_1>;
+			label = "SW47";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-2 {
+			gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_2>;
+			label = "SW48";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-3 {
+			gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "SW49";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
@@ -234,6 +266,11 @@ i2c0_pins: i2c0 {
 		function = "i2c0";
 	};
 
+	keys_pins: keys {
+		pins = "GP_5_0", "GP_5_1", "GP_5_2";
+		bias-pull-up;
+	};
+
 	mmc_pins: mmc {
 		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
 		function = "mmc";
-- 
2.34.1


