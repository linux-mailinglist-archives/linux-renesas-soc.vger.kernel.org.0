Return-Path: <linux-renesas-soc+bounces-7552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FA993D44F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 182631F21743
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 13:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3E517CA0B;
	Fri, 26 Jul 2024 13:38:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DC417C22B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jul 2024 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722001107; cv=none; b=bJJA6G2B2G3BBD/QukTDBSvfQCd1ipPW8w7C+7GT+Wa0c9LucbkJLnOGqJ0kAahJ5Nb7J0gOvGsBQ3odEq4xXiyf5BNWrLeeg/G8UXy1VJYZAEs1Jst0q/1kSanho9nXUPQIfkuZCTC0aSDjobzySF7Uvb9ZqqkvSFNRct7AiZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722001107; c=relaxed/simple;
	bh=Ng4wEO/SlAXdAnuf293XE/ZFStcFFPvsjblx6kRm6Oc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hfqj/x9c95IrvukhfX9/1GgaXD4vpy3aBCl+FQkxoMs+Uqerz/kCr/uKSEchO64w5/0um69pGEBAHBUkgfCfIixHPQKI0Xu7XZjt5yH7bI/HmVtp3wzqKx54fgoV71n5BDKj2Lt2rLk7N4DqC4sALmQXnTvCnnTNo+uJc7PUdA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3d94:87cf:603a:d7ae])
	by andre.telenet-ops.be with bizsmtp
	id sDeE2C0021mGjv501DeEKs; Fri, 26 Jul 2024 15:38:15 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sXL8p-003cMO-W2;
	Fri, 26 Jul 2024 15:38:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sXL9B-004G6h-Op;
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
Subject: [PATCH v3 7/7] arm64: dts: renesas: r8a779h0: Add OTP_MEM node
Date: Fri, 26 Jul 2024 15:38:12 +0200
Message-Id: <35889ce7e244d0d3513ab886ddcf2e4124c1d41a.1721999833.git.geert+renesas@glider.be>
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

Add a device node for the OTP non-volatile memory on the R-Car V4M
(R8A779H0) SoC, which provides E-FUSE services.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v3:
  - No changes,

v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 0124e682b248188c..4cf67ef2690f6af5 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -417,6 +417,11 @@ tsc: thermal@e6198000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		otp: otp@e61be000 {
+			compatible = "renesas,r8a779h0-otp";
+			reg = <0 0xe61be000 0 0x1000>, <0 0xe61bf000 0 0x1000>;
+		};
+
 		intc_ex: interrupt-controller@e61c0000 {
 			compatible = "renesas,intc-ex-r8a779h0", "renesas,irqc";
 			#interrupt-cells = <2>;
-- 
2.34.1


