Return-Path: <linux-renesas-soc+bounces-22691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E1745BBD599
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 10:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8DF38349C1F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 08:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5B62609E3;
	Mon,  6 Oct 2025 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KIWdsA+d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3D725F784
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739356; cv=none; b=d4svPPxARxDabS70lwJiIoQRfNqEEK57g0SdRcLpAypMcrJWuPokQ54hmLwmho3YEgHcjw32YvnxXGfI25PwEFZ2h7XJR/lteNzDCAkxR5Sh2zgDFQr7wQ4ecQ7QcO4gpX26twNIBpwHhORl8xbxe2cHgVO5IXu5X4qS3zh9x9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739356; c=relaxed/simple;
	bh=HtVFN5jWSOjpG1Dm3Ygf8sg0HHKi9h2mKN65lodqn6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UraaurKknxMSXerl8Ry3161oqnCBI9NnsSaVQGBx8d9IuIiAAL3+DVCHNTxd2FJvfEFo/eUw2fjt8VlMo1GtNnl279wtsc9b+VYYJxem3in/C15Rn4xtf7om6ddwWjM84D1Ga16/B7ruc4vDvTFoWN1Gv7q9QeuYjdwOk4Z3Jtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KIWdsA+d; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=+ea8H0gpKc9Iebrb0FTp6IgF3QQhDv7NRu8S0R3Qv+Y=; b=KIWdsA
	+doPoEWriYaGxdFDQndG7f8Xz5eQVKg4dC6Jnxi0hjCB050B69UX13PSdrOK1s1k
	tNl04KljMpbdAf64Tz2DLM5vDQsLOlHF5HhXqxi/OGhzONxRDp4Ow5xiUFgXBR+4
	W0x4rF1nWNii+3KZ3wTkq8VyUlHElrwBvGO5A2qOYX6sVtxgoEqH4bHQrvwS+mAc
	I+oSu5815qwilLfZEoCf6wbI9KD8TOacEmLlXvf/rPX6RUIVX653WxCYVZ5WrePX
	c3U5bVbgTNgZRMnscxL4tDksaHBR7Dzl137fjuv7zyi40+tLBq5T+k7FYron9HuE
	M2ffsovpp6hJfI3A==
Received: (qmail 1690059 invoked from network); 6 Oct 2025 10:29:09 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2025 10:29:09 +0200
X-UD-Smtp-Session: l3s3148p1@hIvVPnlAWqIgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: renesas: gray-hawk: mark SWDT as reserved
Date: Mon,  6 Oct 2025 10:25:27 +0200
Message-ID: <20251006082520.10570-20-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This watchdog can't be used with Linux because the firmware needs it on
V4M Gray-Hawk boards. Sadly, it doesn't mark the node as reserved, so
this is added manually here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
index 2edb5cb3407b..f5b3d8844dc4 100644
--- a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
+++ b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
@@ -801,6 +801,11 @@ &scif_clk2 {
 	clock-frequency = <24000000>;
 };
 
+/* Firmware should reserve it but sadly doesn't */
+&swdt {
+	status = "reserved";
+};
+
 &vin00 {
 	status = "okay";
 };
-- 
2.47.2


