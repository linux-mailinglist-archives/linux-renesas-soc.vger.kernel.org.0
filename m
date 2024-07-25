Return-Path: <linux-renesas-soc+bounces-7542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D1593C91F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 21:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DBF91C22241
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 19:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D55E1CD32;
	Thu, 25 Jul 2024 19:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LZAxx8TJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4413C558BC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jul 2024 19:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936974; cv=none; b=ImYcNPMGWNf+iYJv8Y7QA4yshhqdIR+fG7LM5Jt1LbUJKKJnT3a5UI4OUNXSawArCyWh22OBWz16F+PJRTLHpkm5qKGEQrLLT7W1sTZ08MW5YLNbZlh8Gu3QpL/t11KazJyxTCjBCc4bHmgBs5b7WAOhctNJBs5Es+lGSX6EJFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936974; c=relaxed/simple;
	bh=qUe8Q9uzTUssR5+/Vri6Gn/b05GCaP/zSvz6po8dzzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2TFAq6Tg+xsYugiqx2bNkhulL9F6s+Rev2dYm17LkbvZEB3WHV+eHlDGa6/0+Z86MDBxfaRrJbotnenocYkXZbImQQ5L1WnGwKZW0yuO1Bz6KHDWD4c/p5xk71gTQtN/jujKnLMIQe63LFAfGYhmClU1M4m3pv4GaznlSyk0UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LZAxx8TJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=/qFAdYMfABu5NIW3z1miq7nx3nFg2quz9kfo1ogUfLk=; b=LZAxx8
	TJvyvXOFqpXmqvZFEVOrTdKAt7eN7QM/1g2cTa8if0WLbydIbBkHDSfW7eovxhhQ
	ZqusBm7eTWhvp28raoPVoguWtDKl7z0wn25/ss2tgb1h5se9Knz1d/w7Z3k74pWX
	jqDhyL1KrB+qMADmNbXo+5yHucGzEMpdukIoRsiZ3pZZw6DuixTfAT86G61ptt6e
	qtAwO3YNFYFcgkcSkQJcpuH8v70T9Slm7cmr+xKpjCiHcKCMUfnUlzIJNCJcIQ7W
	beaKWTqMswEIwDo9/Z2bdGFCksbVQ0XlcuS7C3UJfUDW96997PhLWSFdS5Cc/6ex
	ZO+wCUvVRMaNFnDw==
Received: (qmail 3088410 invoked from network); 25 Jul 2024 21:49:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2024 21:49:30 +0200
X-UD-Smtp-Session: l3s3148p1@XBNtsRceXLwujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 6/6] arm64: dts: r8a779h0-gray-hawk-single: Add TPU support
Date: Thu, 25 Jul 2024 21:49:13 +0200
Message-ID: <20240725194906.14644-14-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch enables TPU channel 1 for the GrayHawk board. Only for
testing, not for upstream.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 62878120673d..86d17950c017 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -223,6 +223,11 @@ scif_clk2_pins: scif-clk2 {
 		groups = "scif_clk2";
 		function = "scif_clk2";
 	};
+
+	tpu_pin: tpu {
+		groups = "tpu_to1";
+		function = "tpu";
+	};
 };
 
 &pwm1 {
@@ -279,3 +284,10 @@ &scif_clk {
 &scif_clk2 {
 	clock-frequency = <24000000>;
 };
+
+&tpu {
+	pinctrl-0 = <&tpu_pin>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.43.0


