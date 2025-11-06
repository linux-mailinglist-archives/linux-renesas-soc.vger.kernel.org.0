Return-Path: <linux-renesas-soc+bounces-24214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A454AC3B301
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 14:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41CED46818E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2133933506B;
	Thu,  6 Nov 2025 12:56:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21427335065;
	Thu,  6 Nov 2025 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433766; cv=none; b=HaSbO66CoJqHzhTDF2bXPudusI+N3vlnfngxPN0488jJg6qLdD4bg4IFY0LNRULHPMQ3F+3maUqbt8hGfKPYcNTF7fme8l4PvJjqCuZ0GNMtwDih5RlVTXgLfRL5XeiVTSWnR4qwIozOBGghrpDIhe8tEj6Zm+DyWFj3zF1lLCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433766; c=relaxed/simple;
	bh=2XvTGLQzmwNunCv5N3U/Z1taEtNBC8WGqVzWWN4iYZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bek0cjH/5S8yzvTROF5CquVLxlaElT4xv+gsZ142sZaX9rInsm0GM+2PeoT/S46KkcUNXCuyMmXrcYxAPKaN5MSgh87b/aIQbZGEDPsX0Db+AHHGh54NkUPsw1L4vj4luxofyltRuTtppdD/v1UE2SRKIBuYI2skqbFWVeweIOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Ybdzqzf+RkuBgzEQ3qfR0g==
X-CSE-MsgGUID: 91B3e9vmS2e82TAxz//b2w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2025 21:56:04 +0900
Received: from [127.0.1.1] (unknown [10.226.78.121])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7040C4006DE3;
	Thu,  6 Nov 2025 21:55:59 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 06 Nov 2025 13:55:28 +0100
Subject: [PATCH net-next 04/10] arm64: dts: renesas: r8a779f4-s4sk.dts add
 link-pin property
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-add_l3_routing-v1-4-dcbb8368ca54@renesas.com>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
In-Reply-To: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762433735; l=782;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=2XvTGLQzmwNunCv5N3U/Z1taEtNBC8WGqVzWWN4iYZo=;
 b=rhKsR8O91AhPcbIU6EoFvkMEpRSRBQukVbT0CRaWNVC94r76IqCOao7ki2RXqH8Qj9texcg91
 NKrrzvEyXrHD58kAJLFGuzAAHlESRNrtR8KriThn/c4BY+f4vHvR/yB
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=

Enable link-pin for S4SK board.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
index 67b18f2bffbd..a4855c215d2f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -185,6 +185,7 @@ &rswitch {
 
 &rswitch_port0 {
 	reg = <0>;
+	link-pin;
 	phy-handle = <&ic99>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 0>;
@@ -204,6 +205,7 @@ ic99: ethernet-phy@1 {
 
 &rswitch_port1 {
 	reg = <1>;
+	link-pin;
 	phy-handle = <&ic102>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 1>;

-- 
2.43.0


