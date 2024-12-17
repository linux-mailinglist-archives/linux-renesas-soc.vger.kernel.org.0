Return-Path: <linux-renesas-soc+bounces-11483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C809F5577
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 19:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B962C1718E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 17:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B777B1F9EB3;
	Tue, 17 Dec 2024 17:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nhS+v+/U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B481F9A8B;
	Tue, 17 Dec 2024 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734458038; cv=none; b=I+0synpmeNoBfBAQ5cextweCeIyt69vXcyIY6QCRmt0B+hebzcncS06QfyaCX30lTAeB2ILpHovCE0eVzLqh0b8p4HzO0igLP6C1bZZKRnO/DWpcSNgCRHU2Z0e86IjeNpXYxqvwS7lqhZyshtsT32XboQdc0nseUb9oqhc/DkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734458038; c=relaxed/simple;
	bh=GMzWBHeGcD9J5izmTRoDvhnE+R9kX0u3q2A9Z/gATgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcuyoEMRdEYiRog6488xPFOt61PxsNgWCRLLRu3QpzuAc3cQZdV/DPyD2gkll26vkRXaXLZNdJ2ZCyneRJX57XwiQu5GHOrH5wKmMInwBcuSn/1bvbcv7DQaQZ/M3sJ6hWQindnj15xHAbETq8xqLTKDnBO4V2C/0RvKBbmkHOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nhS+v+/U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2090F778;
	Tue, 17 Dec 2024 18:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734457995;
	bh=GMzWBHeGcD9J5izmTRoDvhnE+R9kX0u3q2A9Z/gATgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nhS+v+/UKgUXCMg4VIrcIgTORvzzLudzkXsUhd1wHrZKFgONt2I5mPrJG1SiMuwgT
	 6fkztYsyyhyY3wuF7tkerK9LPMWBjExHVjGOWa3wvNCmds1Utn7KeUFFFQEw8UyFoX
	 z3IvmRX7r0MPzD82eQ0iLhlZr1mGi1Fw3N1E5VjQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 17 Dec 2024 18:53:15 +0100
Subject: [PATCH 2/4] arm64: dts: renesas: r8a779g0: Add FCPVX instances
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-rcar-v4h-vspx-v1-2-de04ea044ed4@ideasonboard.com>
References: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
In-Reply-To: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=GMzWBHeGcD9J5izmTRoDvhnE+R9kX0u3q2A9Z/gATgM=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnYbqu6EJVRpQzKjeFYNSsX7Ot+jt7ZZtEWQIh7
 nzphaH1Z2yJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2G6rgAKCRByNAaPFqFW
 PForEACbTnV2gDTtbM+oTx+jRSNVj/BEUjGxBOLm9wblkBQwl9uqLsPCQbi4vjrN2k4IBMRRAdl
 dzFMax+Mp8WYw0ayyEgq3r0yeL+YT5lG0/2jqZzemJQ5Mk81kndvJzkhN4Z2u+jYI5qrRfKxnsF
 dG98T73E6ig7+EW5GCRr88qIJaGrrJUI6yZdR8/DhK7PuhETos6XuFyqsXf1DBoAVJQm1dw9p9n
 w/qE1FoPLYsnbK1/HZdYfSMbfYHNBtuhbPPESh4rwMBS8kJBRYLra7VblA0z4tXwuKam1E0swOV
 6DUPuFPLQmF3Tc9NvHx16GGicxbN+SHrMW+z4xS2Up00AQsAkyqiWTQlewpWS+ecVtcOljJ8zKu
 TfqjTjaPHT21RRrVklwwTsOe2oR2KCRMpriWKdULtkactbc37vg8pXua01BYMb415mHUpY8BPe6
 wmxilo6/n6udLgdVAsfLjP5bkpSnR/SjfacniOpqJqqYC6XCpymIHIqt9Hk5yVSH81UWSd89/Nn
 5rTtaiHjV+SNK1U2hkPYirHzkVhwTPblIeZnkBIEcBWpENrOPRg5mEymEF3u79lfFdXu0emJ2JU
 GvzyL1HE7WjsGgjQTBSnxhDVcmbWxqjox1ptnSay7cqb9FuzF5Wi6mqEtjKMcXkbdRzsOD6IBPm
 u2oAyunfobiBNqQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add device nodes for the FCPVX instances on R-Car V4H (R8A779G0) SoC.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 61c6b8022ffdc3b22444fb13e748b4aaebe454a4..e49748563e2f5706ed982d6c9cc1df59f27bd0dc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2171,6 +2171,24 @@ fcpvd1: fcp@fea11000 {
 			iommus = <&ipmmu_vi1 7>;
 		};
 
+		fcpvx0: fcp@fedb0000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb0000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1100>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 1100>;
+			iommus = <&ipmmu_vi1 24>;
+		};
+
+		fcpvx1: fcp@fedb8000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb8000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1101>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 1101>;
+			iommus = <&ipmmu_vi1 25>;
+		};
+
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfea20000 0 0x7000>;

-- 
2.47.1


