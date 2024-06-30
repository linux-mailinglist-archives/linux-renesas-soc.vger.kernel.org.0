Return-Path: <linux-renesas-soc+bounces-6920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B569491CFFD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2024 05:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3894D281F63
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2024 03:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B9329CEC;
	Sun, 30 Jun 2024 03:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="aAkOOFOF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8E54A15;
	Sun, 30 Jun 2024 03:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719719231; cv=none; b=dI3mP/FcT1YffA3iqXUtn7Ht9jxbzUwhLxOINA+trMYAO7hb5ms+GhNBuFC4NwUVAYhRhtljpcqMZfbDQb6V89ZnykD7s3GGkgUnD3ISaIgEWUkWafML+xhpl1a0Qt64tUaNjrnZ/rhE4P5OE+twjZoZkbbjTptDBikN7QWcKUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719719231; c=relaxed/simple;
	bh=2SE+uc+8nDoiXh2M59H6b8PNLqLpO5Qxe5o9u90c3vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ao11FITiZe0h+qGcyO0SVxHndvk0v6CHtYhgzogIUUhNx3fMfgF3yfX4tkdeFGvq8OTJtT0REHx2fwXjb90IRpLe2n10hXeHvdEqqgpdarFW0feFf8iz/43i5+rjdh8eCkMgpNIeTvuT2iYc0VqxVHb2H6f4wJxJPQ/DlDgfSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=aAkOOFOF; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3D85288600;
	Sun, 30 Jun 2024 05:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719719227;
	bh=DBW4ckrVc31q4q4vl6kiKwc2TPz3MCTXSH0HxUgZI3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aAkOOFOFT5fhQPhKnhOMe8xj2ZrPw2nYvuWbKrqF27XUCXWSx3KPw0w8Dvmt4EN/9
	 fY1SSwyFrS1AO4IzyWmdxo1mg5ZZu0t7h16uJ+MT/qigg2GCzaNWjGpDYvtmuDxBsX
	 87TwTMadV9/QyIW/fo3n3CQZre5Rx0Xtzg+FrY8tKsSVV4nVyycP+KgL0lkuXJ7yi4
	 d4tkT3kSz4fk9lw8DEjlcV/NT9wQZ/VF5J5VTECrvt0KSJ5sezyZ8G2A1oT/0BcYCm
	 gg3JZBimcJdcfu0c/joRMO34EgdMoEv2iMqLHVgSHFcgBROrAVgXezip2IOKz/bi8I
	 AEmqRI/n+Q/Xw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: andrew@lunn.ch,
	kernel@dh-electronics.com,
	Marek Vasut <marex@denx.de>,
	kernel test robot <lkp@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on all RZ boards
Date: Sun, 30 Jun 2024 05:46:18 +0200
Message-ID: <20240630034649.173229-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240630034649.173229-1-marex@denx.de>
References: <20240630034649.173229-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The rtl82xx DT bindings do not require ethernet-phy-ieee802.3-c22
as the fallback compatible string. There are fewer users of the
Realtek PHY compatible string with fallback compatible string than
there are users without fallback compatible string, so drop the
fallback compatible string from the few remaining users:

$ git grep -ho ethernet-phy-id001c....... | sort | uniq -c
      1 ethernet-phy-id001c.c816",
      2 ethernet-phy-id001c.c915",
      2 ethernet-phy-id001c.c915";
      5 ethernet-phy-id001c.c916",
     13 ethernet-phy-id001c.c916";

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406290316.YvZdvLxu-lkp@intel.com/
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Khuong Dinh <khuong@os.amperecomputing.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
Note: this closes only part of the report
---
 arch/arm64/boot/dts/renesas/cat875.dtsi           | 3 +--
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi   | 3 +--
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
index 8c9da8b4bd60b..502764aef210b 100644
--- a/arch/arm64/boot/dts/renesas/cat875.dtsi
+++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
@@ -22,8 +22,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c915",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index ad898c6db4e62..d7a8de2619263 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -24,8 +24,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c915",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
index 39fe3f94991e3..07147743de93f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
@@ -100,8 +100,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0>;
 	};
 };
-- 
2.43.0


