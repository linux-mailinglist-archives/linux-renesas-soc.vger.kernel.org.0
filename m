Return-Path: <linux-renesas-soc+bounces-7540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D760293C91D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 21:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 156E41C221A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 19:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D62D4D8CB;
	Thu, 25 Jul 2024 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="im8ZLeVa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2652446D2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jul 2024 19:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936973; cv=none; b=X+Vt90/Jt8nWSFfHWtYccM/gqucXP1DhGMHjKekM272P9DiuLGUL9HoGS31qg1u6LRLhS10x5eJXfox6Ij8IbCVWGvS5ppZa22k3b8tzB1csJgURxFPZaoLugRqO+sDvJ61wW6Ugp5fTQnUmQHNZACe7o1GdMhGSKe3u5i16F3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936973; c=relaxed/simple;
	bh=Mh80z6Au2093wRvnVn4P7n22QplJp3pdTRLFF8EV8Ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vt3LiUBiJXQpdyzlFN59smZ5LfjS518FlQIXGrwauD9yEaRifrMgTMXRtqg3y5P7ruKGaPkZrcB97D0xmWtp7eV+aS6UidaJwGvD/kL6vHgxbiWJm4vyz8R9H8H6dxNjc6z7gkAIsuH1mOGll6i+eIGB3WBwDsQ9yNNNFdAOmVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=im8ZLeVa; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=5zY16sVeUW2lOtEEgqEdeM2qT3w/I2PARW5SMMpSz/4=; b=im8ZLe
	Va5tNT+ihF5WXjy1NFFtV+8hRdIeNQ66/gZo0H+XCkxedVEzZ2LPokBVXpBwMJlA
	2kd7QeMdfSFI0QXVhafpfik7yp9x728UQBt0umuxP44ipa08XClYhTldcQSJG/IZ
	DJfxolh+AOfPxhEym+oEM6MOgH+8CmEr7ddAJErECCvvVGCqahtRcr9J57DmIVpm
	IYuVjqKau5c7owqW3aI+tTWkf9TrnJ3yzQ9qTQ/qE2J7agqBrBvcBIvd8olEqG4k
	Xz7XRapEsfXzbyUF7mZtU00f5Cs6Ov+YaUkafdnQJ+Ub0yJ3heBPsTSvo90fNNnL
	I6YYYTfkhqQ9v6fg==
Received: (qmail 3088388 invoked from network); 25 Jul 2024 21:49:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2024 21:49:29 +0200
X-UD-Smtp-Session: l3s3148p1@1IxlsRceVLwujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 5/6] arm64: dts: r8a779h0-gray-hawk-single: Add PWM support
Date: Thu, 25 Jul 2024 21:49:12 +0200
Message-ID: <20240725194906.14644-13-wsa+renesas@sang-engineering.com>
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

This patch enables PWM channels 1+2 on the GrayHawk board. Only for
testing, not for upstream.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 2b9a19bb1c5d..62878120673d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -199,6 +199,16 @@ mmc_pins: mmc {
 		power-source = <1800>;
 	};
 
+	pwm1_pins: pwm1 {
+		groups = "pwm1_a";
+		function = "pwm1";
+	};
+
+	pwm2_pins: pwm2 {
+		groups = "pwm2_a";
+		function = "pwm2";
+	};
+
 	qspi0_pins: qspi0 {
 		groups = "qspi0_ctrl", "qspi0_data4";
 		function = "qspi0";
@@ -215,6 +225,20 @@ scif_clk2_pins: scif-clk2 {
 	};
 };
 
+&pwm1 {
+	pinctrl-0 = <&pwm1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-0 = <&pwm2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &rpc {
 	pinctrl-0 = <&qspi0_pins>;
 	pinctrl-names = "default";
-- 
2.43.0


