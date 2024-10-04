Return-Path: <linux-renesas-soc+bounces-9397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F27990411
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE960B23594
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786012141DC;
	Fri,  4 Oct 2024 13:22:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC48D2141D0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048160; cv=none; b=mS3LAGUQhRgHY0xS6dlcLpmzirAtLejr7AtKpGX+/CUmC27rAUkMNxtFOmv3D0gyPVZPU5c7Dk3rmmp6CPICzzrBfHPRABXTLzy6Rdjkukm8xbx4KPu7Gfd8XYYtUTwVmPPRKpF9W19X5QaxCakstrLqDfY33kpF+8lq485HojY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048160; c=relaxed/simple;
	bh=G5JhsuRdfWFb2iCKLAHBaduLkI5W+IwzaNu2TBWsMFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GnxdVngnflTkeQWD/CE/r0POJNZ9bQNcX8D8OFcELyXDiBGo76l41mgsP+av8yAWeV/hSnHD2WjTpzlBKgCLqPsW33sJT9+H0NBv4xJc84qW7wyLYOF/N950eBBEg7wquEqRmCopZ1t2CViTXFiMH/j/m21QamB3lOr5fd2pv/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by baptiste.telenet-ops.be with cmsmtp
	id LDNc2D00K4NXpdT01DNdjd; Fri, 04 Oct 2024 15:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGK-001Elp-KD;
	Fri, 04 Oct 2024 15:22:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yUG-E4;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/20] ARM: dts: renesas: r8a7742-iwg21m: Use interrupts-extended for RTC
Date: Fri,  4 Oct 2024 14:52:50 +0200
Message-Id: <f3838c730a8af5a904939929e30a4d892fef8b39.1728045620.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728045620.git.geert+renesas@glider.be>
References: <cover.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the more concise interrupts-extended property to fully describe the
interrupt.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi b/arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi
index b281a4d164b0aae8..661cc5357b572165 100644
--- a/arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi
@@ -55,8 +55,7 @@ &i2c0 {
 	rtc@68 {
 		compatible = "ti,bq32000";
 		reg = <0x68>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&gpio1 1 IRQ_TYPE_EDGE_FALLING>;
 	};
 };
 
-- 
2.34.1


