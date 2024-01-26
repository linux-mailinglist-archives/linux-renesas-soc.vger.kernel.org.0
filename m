Return-Path: <linux-renesas-soc+bounces-1856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 171CA83D88A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 11:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F5F2288E6D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 10:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814901427A;
	Fri, 26 Jan 2024 10:56:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4D512B87
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jan 2024 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266610; cv=none; b=rtpsB01nIUw0JQN5ZnUbNgkRZ54EF1YV6cn3HF0pINuMbfMd1twCxF85ARS+SltA+65zDy3u9EPhdydUozBbjtjBmbbOewYgMQ/zU/EOekLJfPhYjmqe/X3m41vk2NGfAM4MnQKBSe2s5w5yfxngKOVkQxEdYj674Cqm1IGK5JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266610; c=relaxed/simple;
	bh=yZOiRRTPVipN07cXIuQE2itjTVny72CP+GnB2illhVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FbarDVKEYU0YlU22XoLVqmoZDG5RmrhVDDWejUU32PUt1EhEDQpHVrxvpQPmJAWtKw5xB3gWkTHB32rMHN/TjYK8DqvymRzy08UWdnNFE0ydihuvJmN8sl0xdCL1u5K9k/TgiCA/QsQgFQi2uAUnMWmxCwLr8cD6smPOEoVTmLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by michel.telenet-ops.be with bizsmtp
	id fNwm2B0011AdMdB06NwmHa; Fri, 26 Jan 2024 11:56:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsJ-00GWgB-L4;
	Fri, 26 Jan 2024 11:56:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJrQ-00G5bw-Fh;
	Fri, 26 Jan 2024 11:55:00 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hai Pham <hai.pham.ud@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add pinctrl device node
Date: Fri, 26 Jan 2024 11:54:57 +0100
Message-Id: <0ab32290014b64ddbee5c9ec2808c8294d0b6192.1706266286.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706266286.git.geert+renesas@glider.be>
References: <cover.1706266286.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hai Pham <hai.pham.ud@renesas.com>

Add a device node for the Pin Function Controller on the Renesas R-Car
V4M (R8A779H0) SoC.

Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index a082e2d06b696019..f59d0dd25ca93822 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -59,6 +59,14 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		pfc: pinctrl@e6050000 {
+			compatible = "renesas,pfc-r8a779h0";
+			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
+			      <0 0xe6058000 0 0x16c>, <0 0xe6058800 0 0x16c>,
+			      <0 0xe6060000 0 0x16c>, <0 0xe6060800 0 0x16c>,
+			      <0 0xe6061000 0 0x16c>, <0 0xe6061800 0 0x16c>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779h0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.34.1


