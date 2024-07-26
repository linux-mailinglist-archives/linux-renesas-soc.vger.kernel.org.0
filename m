Return-Path: <linux-renesas-soc+bounces-7547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A1493D441
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1200CB212B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 13:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332BE17BB3B;
	Fri, 26 Jul 2024 13:38:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB54217C211
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jul 2024 13:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722001105; cv=none; b=mDVyjSaKuUrxL38TeDidrnYY3BVWQef1qmMJUF+1iYsGy/XTKPD0yK/6pRzoIK85Q/C6rq3VofKBthZyJgXCSfYIkrWTgKm2V2cVP8/L8koOCZjgquFJCtQ8UaN0bEAgN2zPmv6Hm5oSOInNQZyzKm36yY/Uo3snccAEmZt1nOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722001105; c=relaxed/simple;
	bh=cnqWTpDQyDMAetZAw6MLJ8dI8Id06dyIeRu+kxRfc4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=blQl2GXozLGv5Hd+XFzcuL5DZ4uIkIHCe7ot6B119x61XrbRDK5f9NFmtcdhuUBJ68Oq6kj2iVwsfujsYIzEe+Ah1d0vtXl5owBLmxErSlurd+SY7hIq5qlk90ytfs6UmIxF4EenXj7T+3aKQSRufV02ZYVFYbBkfCfESCwS06Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3d94:87cf:603a:d7ae])
	by michel.telenet-ops.be with bizsmtp
	id sDeD2C00P1mGjv506DeDcV; Fri, 26 Jul 2024 15:38:15 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sXL8p-003cM8-SP;
	Fri, 26 Jul 2024 15:38:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sXL9B-004G6S-LY;
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
Subject: [PATCH v3 4/7] arm64: dts: renesas: r8a779f0: Add E-FUSE node
Date: Fri, 26 Jul 2024 15:38:09 +0200
Message-Id: <3f3a3d3649c4fd723b18f5cfd2b0d07f484bbd56.1721999833.git.geert+renesas@glider.be>
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
the Pin Function Controller (PFC) on the R-Car S4-8 (R8A779F0) SoC,
which provides E-FUSE services.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v3:
  - Fix reg size,

v2:
  - s/r8a779g0/r8a779f0/ in one-line summary,
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 9629adb47d99f142..054498e54730b49c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -377,6 +377,14 @@ gpio3: gpio@e6051980 {
 			#interrupt-cells = <2>;
 		};
 
+		fuse: fuse@e6078800 {
+			compatible = "renesas,r8a779f0-efuse";
+			reg = <0 0xe6078800 0 0x200>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+		};
+
 		cmt0: timer@e60f0000 {
 			compatible = "renesas,r8a779f0-cmt0",
 				     "renesas,rcar-gen4-cmt0";
-- 
2.34.1


