Return-Path: <linux-renesas-soc+bounces-24215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A27C3B16B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 14:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 857721AA681B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047E73358CA;
	Thu,  6 Nov 2025 12:56:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBB8335065;
	Thu,  6 Nov 2025 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433773; cv=none; b=QecqmR/cOaFGb45R5WsnT/FtdsqkIrRJaOuzJRwzIE8KzgThF2Z6cZeOCe4fcps9AxZbTKPGGXBdP7ZcCVE0YE7otzViDyUSjCNTMh+mAnilBzHW1Sg0Vke86+Aj+HlCEvofb89Lhn5jCptxM2SNmfQHAVrrYYpX76bqrorpmzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433773; c=relaxed/simple;
	bh=TA25IlB0nLeySiM/D3NFhY91bwQF2J7gKxpWB/YmozQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oavwj8+WfT+kLZQuPcd+ALKozNogJ8VhDE8T+v2/ELdUP2GlxoZ8cZOXQp13QAKZYgv6KbzpZER9cOTWy/IFdCVXkvdBogeF+MV+6dWiwRQ2HqFCYK/VuN1oajUPEQK8G6WCKQtwwTXJA9Iq4J2kCq8XFtplQJ8Si74e03TFLkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: gGeiTQBaTFygkEl0ORb0HA==
X-CSE-MsgGUID: BGS5nBwNRl6QaRodthoCWA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Nov 2025 21:56:10 +0900
Received: from [127.0.1.1] (unknown [10.226.78.121])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 524E14006DE3;
	Thu,  6 Nov 2025 21:56:05 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 06 Nov 2025 13:55:29 +0100
Subject: [PATCH net-next 05/10] arm64: dts: renesas:
 r8a779f0-spider-ethernet.dtsi add link-pin property
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-add_l3_routing-v1-5-dcbb8368ca54@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762433735; l=1009;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=TA25IlB0nLeySiM/D3NFhY91bwQF2J7gKxpWB/YmozQ=;
 b=GWhZ20LlRV+m0UnOMCMaQ5RC8HREcH3xBiS6qjFdsfH5mg7nGwE7uL3HvvELY2TcoQ1Bg2kFB
 mCea5PFwR4iDyWelJQn0xSiTMIv5ymiqYYM7o9UGw4z64/0HHgUfSWo
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=

Enable link-pin for S4 Spider board.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
index ad2b0398d354..862a60705f53 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
@@ -54,6 +54,7 @@ &rswitch {
 
 &rswitch_port0 {
 	reg = <0>;
+	link-pin;
 	phy-handle = <&u101>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 0>;
@@ -73,6 +74,7 @@ u101: ethernet-phy@1 {
 
 &rswitch_port1 {
 	reg = <1>;
+	link-pin;
 	phy-handle = <&u201>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 1>;
@@ -92,6 +94,7 @@ u201: ethernet-phy@2 {
 
 &rswitch_port2 {
 	reg = <2>;
+	link-pin;
 	phy-handle = <&u301>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 2>;

-- 
2.43.0


