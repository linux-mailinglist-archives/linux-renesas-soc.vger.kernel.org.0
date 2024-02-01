Return-Path: <linux-renesas-soc+bounces-2218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D65FF8459EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CEB51F24045
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931BB5D498;
	Thu,  1 Feb 2024 14:19:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B025D48B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706797165; cv=none; b=i8Omz/UawBCvcTUR9+ADFzicVhmVNaCFaAI4FS+8/CQRsIsflaXug7qC7syW7oQpF5RSvJGXbjAFUyKVgbWzjLUs9XcL+3/BMT21f0tfjdiuzrzLO4LXILQDzaJfQKWEzn3fzuQeBlfcBJ59F2m8+PxNZZ5TlvGU6hT7t6/nds0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706797165; c=relaxed/simple;
	bh=YJTGKYCbGRMvOO9KGyCz1lRYndgqRMLWq4L32TB2e84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ITfkLPmkMpJsyIh9tKF0I9x52pqH0PJzHCVSbreWgMNedZYKzVQqO73b38cLa1VbgrB06mLPlcixCOa5CmRLFyQPh81XL66NGfRyH1kTeCM3scU+V2c15t55Q8YDeTRgwGs08a3x2UKnFYwNfxrSBMtlZukAfp/RsgK+fAI2+U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by laurent.telenet-ops.be with bizsmtp
	id hqKM2B0074efzLr01qKM6R; Thu, 01 Feb 2024 15:19:21 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXtc-00Gv4Z-2m;
	Thu, 01 Feb 2024 15:19:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXuT-00AXdJ-2M;
	Thu, 01 Feb 2024 15:19:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] arm64: dts: renesas: r8a779h0: Add L3 cache controller
Date: Thu,  1 Feb 2024 15:19:16 +0100
Message-Id: <9d56a46892c5e0957d244370e6809013cf815905.1706796979.git.geert+renesas@glider.be>
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

Describe the cache configuration for the first Cortex-A76 CPU core on
the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Rename L3_CA76_0 label to L3_CA76,
  - Rename cache-controller-0 node to cache-controller.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index eb555cbf51a41001..f47695158d991288 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -23,6 +23,14 @@ a76_0: cpu@0 {
 			reg = <0>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A779H0_PD_A1E0D0C0>;
+			next-level-cache = <&L3_CA76>;
+		};
+
+		L3_CA76: cache-controller {
+			compatible = "cache";
+			power-domains = <&sysc R8A779H0_PD_A2E0D0>;
+			cache-unified;
+			cache-level = <3>;
 		};
 	};
 
-- 
2.34.1


