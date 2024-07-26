Return-Path: <linux-renesas-soc+bounces-7548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEB493D440
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05F161F21C98
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 13:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6106F17C7A4;
	Fri, 26 Jul 2024 13:38:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD5817C219
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jul 2024 13:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722001105; cv=none; b=jYlWtjXJWvrPqggGBTQscjNIqRsYb1cbEsT4Rl7N1I4uXFfLjwVgWPOJEfJqehD2irALbM+9pU00kAjc8Ha2S4crWEE62My7Hc0M89lSdN5HLsFep6aXYMN+tiGo/UGVRR51pPU+/Ja/NdAa3LicERUFdLSxCmIS76ZCvOOfSSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722001105; c=relaxed/simple;
	bh=+5yTt3e5KltgbPhBYwoQdQ1rvutxIVcLkfXXrd6lD9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ltdPH6KbE0wkMTEs2QidvWD/QtWcUDGrLQ+ZCEvFohzzYPdrqn4j0zZAkszFvwIKb9Gn/Tz++BQrAjkdQmC4bt+GoMRO941RItePbKJbGChjuI1vtr1t2vt0ZcMNiOH4p76YUgcwHQZSxPGHZ09APbB4Vd8XuXWHcsmXxs222FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3d94:87cf:603a:d7ae])
	by michel.telenet-ops.be with bizsmtp
	id sDeD2C00N1mGjv506DeDcU; Fri, 26 Jul 2024 15:38:15 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sXL8p-003cM4-Rh;
	Fri, 26 Jul 2024 15:38:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sXL9B-004G6O-Kt;
	Fri, 26 Jul 2024 15:38:13 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 3/7] arm64: dts: renesas: r8a779a0: Add E-FUSE node
Date: Fri, 26 Jul 2024 15:38:08 +0200
Message-Id: <d19472e1797da15421cbd15b9f944388ee7b5159.1721999833.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721999833.git.geert+renesas@glider.be>
References: <cover.1721999833.git.geert+renesas@glider.be>
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
index 69652d309fe6f01e..4d1f086629d1ecef 100644
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


