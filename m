Return-Path: <linux-renesas-soc+bounces-9139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD119885CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 14:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB1371C20295
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 12:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB0618C92C;
	Fri, 27 Sep 2024 12:57:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D11918C923
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2024 12:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441863; cv=none; b=IQBi/TCenfwpbFSMvfrz/X9JHvX/9R1GSD0RX1colu55juq3afVIBH1zZK00/mIfoWRM7R7bwTptYePFFX6nTXCHwdsrR/Bz6ERTElfzrIhcZxxBTXUbZfpb8xg0bt1g5GfnW2QvuVk8BvhSSCRMk0dXyOMbWjVC/JEvZ6Oo6AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441863; c=relaxed/simple;
	bh=OY9+X7FYu0c96e1V7l031VT3NUa0ey03hQQwp1X25hE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jgcXmAm3iVBvW2jb733BIDHOCX1y6TcYLJElEAZFpTBCtdtYFpbjkm1SlhFtxmhAghw+nwG5GgCvNiCcsVaa9p8lhJ4Cf0/T+0a+9WY1jX2HexDPYDP3WcmcQRlfXLJh7NPyPvqX4oeY7/O0awwEbJFCBy2ex/GtDT22PpwNgYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by albert.telenet-ops.be with cmsmtp
	id HQxf2D00R3BfLyr06QxfQ0; Fri, 27 Sep 2024 14:57:39 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAXN-000fTj-Qh;
	Fri, 27 Sep 2024 14:57:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAXT-008KYr-B9;
	Fri, 27 Sep 2024 14:57:39 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: rskrza1: Enable watchdog timer
Date: Fri, 27 Sep 2024 14:57:37 +0200
Message-Id: <fe72fb72acde4f5d9f8bd1a012435519592bd2bc.1727441772.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the Watchdog Timer (WDT) on the Renesas RSK+RZA1 development
board equipped with an RZ/A1H SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.13.

 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
index 43990911b144dde9..6f7fa3eeeb79893f 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
@@ -285,3 +285,8 @@ &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	status = "okay";
 };
+
+&wdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
-- 
2.34.1


