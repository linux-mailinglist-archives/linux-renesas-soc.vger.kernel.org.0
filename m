Return-Path: <linux-renesas-soc+bounces-6546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C82910671
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 15:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACB141C21831
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 13:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7F540875;
	Thu, 20 Jun 2024 13:39:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F291AAE20
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718890740; cv=none; b=gF/+t/VC/b6+dB10cPuaJunaeiIPjukIJHYiWrdM9cRwDIgM9IsZDkQBQsTNuPvupgDoPHRgGDksqAcvJh6f7tZ6DSkVVMhkREaKeccxJIn3/PB3ICbwauGI4kTnZeIfWvsJFNjSMXkBRtEhz7EFjfF8GnSY3BRtFgM2Q8f8s7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718890740; c=relaxed/simple;
	bh=J1xLRjB+2LDobLZdH9OO94pzYkxMRQDxiI/Cel2ARss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DAAK+PrPPgmxkscVqmeGX7JiptyMSWYF/py8yIYTD66tRmSmotz0P5SCZb0xVNipvf57aG7OloMhZk2/X+vL1kKQl0uaq4xr7qZZcWOyPqo2Pb5EVwLuOEDvwJOWdSU5hG+ThYgc5ft15hi4kMf5ZWen4dGJIOr3NblDnjhjDUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:260f:cd5c:91b1:523c])
	by xavier.telenet-ops.be with bizsmtp
	id dpen2C00K0Y0hZi01pensV; Thu, 20 Jun 2024 15:38:49 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sKHzz-00056t-Rt;
	Thu, 20 Jun 2024 15:38:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sKHzz-000Cdr-OM;
	Thu, 20 Jun 2024 15:38:47 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779h0: Drop "opp-shared" from opp-table-0
Date: Thu, 20 Jun 2024 15:38:45 +0200
Message-Id: <4e0227ff4388485cdb1ca2855ee6df92754e756e.1718890585.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The four Cortex-A76 CPU cores on R-Car V4M share their Operating
Performance Points (OPP) table, but they have independent clocks.
All cores in the cluster can switch DVFS states independently, hence
the cluster's OPP table should not have an "opp-shared" property.

Fixes: 6bd8b0bc444eae56 ("arm64: dts: renesas: r8a779h0: Add CA76 operating points")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Before, only a single CPU frequency policy is created:

    cpufreq: cpufreq_online: CPU0: Running at unlisted initial frequency: 999999 KHz, changing to: 1000000 KHz

    /sys/devices/system/cpu/cpu0/cpufreq -> ../cpufreq/policy0
    /sys/devices/system/cpu/cpu1/cpufreq -> ../cpufreq/policy0
    /sys/devices/system/cpu/cpu2/cpufreq -> ../cpufreq/policy0
    /sys/devices/system/cpu/cpu3/cpufreq -> ../cpufreq/policy0

After, four independent CPU frequency policies are created:

    cpufreq: cpufreq_online: CPU0: Running at unlisted initial frequency: 999999 KHz, changing to: 1000000 KHz
    cpufreq: cpufreq_online: CPU1: Running at unlisted initial frequency: 999999 KHz, changing to: 1000000 KHz
    cpufreq: cpufreq_online: CPU2: Running at unlisted initial frequency: 999999 KHz, changing to: 1000000 KHz
    cpufreq: cpufreq_online: CPU3: Running at unlisted initial frequency: 999999 KHz, changing to: 1000000 KHz

    /sys/devices/system/cpu/cpu0/cpufreq -> ../cpufreq/policy0
    /sys/devices/system/cpu/cpu1/cpufreq -> ../cpufreq/policy1
    /sys/devices/system/cpu/cpu2/cpufreq -> ../cpufreq/policy2
    /sys/devices/system/cpu/cpu3/cpufreq -> ../cpufreq/policy3

To be queued in renesas-devel for v6.11.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 00ac730c26cb7202..163bbcbccc9fcde4 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -23,7 +23,6 @@ can_clk: can-clk {
 
 	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
-		opp-shared;
 
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
-- 
2.34.1


