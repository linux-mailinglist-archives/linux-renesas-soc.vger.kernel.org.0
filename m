Return-Path: <linux-renesas-soc+bounces-9351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9294D98F101
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 16:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 457DB2821EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 14:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9168919EECD;
	Thu,  3 Oct 2024 14:04:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414BD19D081
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 14:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727964284; cv=none; b=qQnNqjN3+Mvusj2v3xhNv60Z6y+GzwJXndfb7jpDwAyP02BYKPn4JpOluwxfS6ts+3EfTjSUoHwxpHpqm3HdIC72eknfPNJ5M+CxtTlat1hh8RzXhnZ3b/jbHEqIF/dp1EibceVMFJq3RXls6RUgSvE3qG248LFP+Xk2uqOF7dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727964284; c=relaxed/simple;
	bh=S79zNgT+2/mn+IoKPouUDYDiOXIIDGAPy4k5qbtL3l8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TrKKRhtmViXPerokD+HFuYqCGmU3NxEBVWd3xygFgfyy3AkSGV4pD8KdIN2IhDb9cZQWGSYeVZj7wZeRI0V4g1qBuT9H8fzPkzKbehUBXt2gjdg4+zJ5V8M/BvgztFJyIgKJQgAAb95zkcBmKA3xdhoyYg70DkMBdRFx7spnYJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d4db:7463:4f08:3c82])
	by xavier.telenet-ops.be with cmsmtp
	id Kq4d2D00A5K8SYz01q4dMy; Thu, 03 Oct 2024 16:04:39 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swMRR-001CGb-4l;
	Thu, 03 Oct 2024 16:04:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swMRZ-006e9n-DR;
	Thu, 03 Oct 2024 16:04:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 resend 3/7] arm64: dts: renesas: r8a779a0: Add E-FUSE node
Date: Thu,  3 Oct 2024 16:04:27 +0200
Message-Id: <3b1d9939d2bcff9c5112d419b98b70377cf31db4.1727963347.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727963347.git.geert+renesas@glider.be>
References: <cover.1727963347.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device node for the System Group Fuse Control and Monitor block of
the Pin Function Controller (PFC) on the R-Car V3U (R8A779A0) SoC, which
provides E-FUSE services.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v3:
  - No changes,

v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 1f4ab27acc339895..7156b1a542e8a38a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -245,6 +245,14 @@ gpio9: gpio@e6069980 {
 			#interrupt-cells = <2>;
 		};
 
+		fuse: fuse@e6078800 {
+			compatible = "renesas,r8a779a0-efuse";
+			reg = <0 0xe6078800 0 0x100>;
+			clocks = <&cpg CPG_MOD 916>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 916>;
+		};
+
 		cmt0: timer@e60f0000 {
 			compatible = "renesas,r8a779a0-cmt0",
 				     "renesas,rcar-gen4-cmt0";
-- 
2.34.1


