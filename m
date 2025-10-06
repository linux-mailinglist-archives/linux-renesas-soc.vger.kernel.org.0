Return-Path: <linux-renesas-soc+bounces-22682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE085BBD566
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 10:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D51D2189497B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 08:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4386826057A;
	Mon,  6 Oct 2025 08:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZwnHyMDC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C1225DB12
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 08:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739348; cv=none; b=cvbL03yd5HRMylUUXBhXca8EZouq5btcYHMB4BiZqxKB0zZVFBjKQ6Fv0Si/uZ2lclCCVA8pxkCE3BgTeJMp4F86qs0ntYFSK9HAIsiF4f5sFVhhsoCvKSVvqyfPqwwdmo5A34pvHRjxeL6vyqNZQXhi4Lhz7cTqjvfwmlMawf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739348; c=relaxed/simple;
	bh=COAK+KtfkJJvvDyXzYFebMzOhwCBG/r53XYP0VZvanI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ru3evutDRf0pXFfIHoBxR78D5ywuUQWX9JNf3HBrfHZVA9rpW41GrcKUgghr40LNPoHNbdrjcmrRXQ43K3c0HKHNEri1kUG1pUiABDa4MB7JtKqX5/UCvZ2KlGY8P9VQeFKsZP33DoT61T2pQSV/SOVe9PQBlwRJtAH/PHNejWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZwnHyMDC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=DkSCtK/73OmDOi+X/57Re2cWQdYOZWtT/hRUP8S4YRw=; b=ZwnHyM
	DCbZ710o/CpcBMdoTOdByfdUdOT00aD9NnrXdR9InLD2oSbD2sCFeUGgdUlZFk1Q
	IcyoXvsV2zVi2O3h+nb4JHkX8y+I/V7UWrOs299K/0hKP4Osymr/TUQLNOL+a7pa
	dAzx0UVNKW/QsfTxQy5J963z5Jo3jeHPctqLy+zp3Zu2bvx8CgQryFM4iLtfT7J6
	S5Mv9RNQ8O4/iKUWfXmCAsmpKbVZu6vrn7TN3H5Sghhrfbb8H4SHEdttCBauurph
	WLke0ORbIoK6scTBv8kJ3LvZHbMy9qopgAbmy8b8lOy/4CBHaNyVDl2Nyzra2VHN
	R29luYGUDTbIt+4A==
Received: (qmail 1689804 invoked from network); 6 Oct 2025 10:29:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2025 10:29:03 +0200
X-UD-Smtp-Session: l3s3148p1@AQ13PnlAbuwgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/9] arm64: dts: renesas: falcon: mark SWDT as reserved
Date: Mon,  6 Oct 2025 10:25:20 +0200
Message-ID: <20251006082520.10570-13-wsa+renesas@sang-engineering.com>
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
V3U Falcon boards. Sadly, it doesn't mark the node as reserved, so this
is added manually here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 0916fd57d1f1..5432c7d6919d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -357,3 +357,8 @@ &scif0 {
 &scif_clk {
 	clock-frequency = <24000000>;
 };
+
+/* Firmware should reserve it but sadly doesn't */
+&swdt {
+	status = "reserved";
+};
-- 
2.47.2


