Return-Path: <linux-renesas-soc+bounces-2220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EE38459F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD136286DB1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9191B86635;
	Thu,  1 Feb 2024 14:19:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3F85D484
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706797166; cv=none; b=koOeOpLD2Lv8260j1ZAoLYd4Lt0981ESJnhUux20P4hMDlZWkqknj5oXC/yFu8Tup9JQRwQLeWEZx05lYt3HDcsv3NSGx+jjL8jbvtIEb749xL35pr6YVMiN3PxSwedOlVsApz07+QwisjNTVAuy3W/eQyeYbtnMpuQcfikUBOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706797166; c=relaxed/simple;
	bh=BQ5XINEvdzRZUIf76yiuqfyI/qE+NO/uTHHAN4hv/eQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XkZ3UIRlRcOJB3wUQERSA7MX+f7IaT+SX5hebzVflnWeqTkU32TVD6euxyGLLiBySgNiyUQWy9mMu87L7T1yE8hL86rPM4Om+6EeBfweysVqgXxVaseVE0UdX5DIIQJnX7jgLexBkKRuOD53APTpIrvVQ5DUHUqYGyWZ2rRC2nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by xavier.telenet-ops.be with bizsmtp
	id hqKM2B0084efzLr01qKMiE; Thu, 01 Feb 2024 15:19:21 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXtc-00Gv4l-5P;
	Thu, 01 Feb 2024 15:19:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXuT-00AXdV-4V;
	Thu, 01 Feb 2024 15:19:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] arm64: dts: renesas: r8a779h0: Add CPU core clocks
Date: Thu,  1 Feb 2024 15:19:19 +0100
Message-Id: <c64cf6ca1590fa1a36b90a18fd70c831d5b8318e.1706796979.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706796979.git.geert+renesas@glider.be>
References: <cover.1706796979.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Describe the clocks for the four Cortex-A76 CPU cores.
CA76 CPU cores 0,1,2,3 are clocked by ZC0,ZC1,ZC2,ZC3.

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index b3255bba69e3e6da..622775f6160f55bd 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -43,6 +43,7 @@ a76_0: cpu@0 {
 			next-level-cache = <&L3_CA76>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC0>;
 		};
 
 		a76_1: cpu@100 {
@@ -53,6 +54,7 @@ a76_1: cpu@100 {
 			next-level-cache = <&L3_CA76>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC1>;
 		};
 
 		a76_2: cpu@200 {
@@ -63,6 +65,7 @@ a76_2: cpu@200 {
 			next-level-cache = <&L3_CA76>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC2>;
 		};
 
 		a76_3: cpu@300 {
@@ -73,6 +76,7 @@ a76_3: cpu@300 {
 			next-level-cache = <&L3_CA76>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC3>;
 		};
 
 		idle-states {
-- 
2.34.1


