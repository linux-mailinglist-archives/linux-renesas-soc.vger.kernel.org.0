Return-Path: <linux-renesas-soc+bounces-6919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4770291CFFC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2024 05:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D4471C20AF5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2024 03:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE682837D;
	Sun, 30 Jun 2024 03:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="rm7vjorE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221B2A21;
	Sun, 30 Jun 2024 03:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719719230; cv=none; b=Vbq54zk6BMuds+Crir0Cehh8jj7uFfbrLrW6C+81uBlZgb9ZDKh1OOkW9Tqp+O2tZW2NPR/6ahqikEoqZI1g4vQINq2VtRtUMylEfaQvwFXnqenNoGEys7Sufo5h2WqmU3He5SSSB+E83p7EPA9Vp3ZBaXvOFgsrR0KZf+5yvn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719719230; c=relaxed/simple;
	bh=gQeHHCqKuPo2VT0EveLTDL7DzuZY35w5BleyDF+S0Ww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JGt5ib8GaiKDD/g2kifb72ckf4jJA5yuQgnSVj5Kvffr9LxOR1iomTf0UJCKvAfO2fFRL2mzE9mgAEiYHjlYb4Vvl4VWbzWAaSqV8hTughyuD9hJC2yNHg16NYEdk+/CeSeskstgAVK+ErGGVs6+G50BZxI8hlkKP1DrN9bJjVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=rm7vjorE; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9413387E13;
	Sun, 30 Jun 2024 05:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719719227;
	bh=f0KWjDNGFbZg+LVMtUylCMXvgZ0Nv5vh34VntCMiGHw=;
	h=From:To:Cc:Subject:Date:From;
	b=rm7vjorE2IyBbZzPGYGowpNSKPTlpjrjRvrztRZtRFy6/b5ZxcAQ0EQ5mCNdkqZ5f
	 n2zoRooX95UOjn0OOypjg2iP2uLCQafWsysmbRCD6/CM3B+C1RJBi4RBKMUYSXybCu
	 rL0Mb/p8lUMgroy02ySyPOWfVd4G33aTRscsF4J4PCDbBQlw3/lp+/AlPxX036z4M6
	 Vmry/Bc9xHVqM8dGTc0SgNzPn7LlScZjbqMSFQqv40lApBO1vOLVnUcevlTYwssn5U
	 JdiLzzOV/NaOnZW4w5wv1zZO/ZSQNMPplTSvQ7HCrf6GsNYprH5EYwy5eV6fBGupKZ
	 h1645mTj1X47Q==
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
Subject: [PATCH 1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on all RZ boards
Date: Sun, 30 Jun 2024 05:46:17 +0200
Message-ID: <20240630034649.173229-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
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
 arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
index cd2324b8e8ffb..41b1dbcfba100 100644
--- a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
@@ -95,8 +95,7 @@ &ether1 {
 	renesas,no-ether-link;
 	phy-handle = <&phy1>;
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id001c.c816",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c816";
 		reg = <0>;
 	};
 };
-- 
2.43.0


