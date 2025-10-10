Return-Path: <linux-renesas-soc+bounces-22883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6034ABCC9B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 12:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D1A88354B3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 10:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570D22C21C4;
	Fri, 10 Oct 2025 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tibqgk0q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68A12853EF;
	Fri, 10 Oct 2025 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760093519; cv=none; b=reSPBbS+3/em8eBU4sjehNAVa+xY+5uUwD4WFWTSUuADLNtMC22CT09mwJqgoppIXWg0gLTOEbJSnu7K0SScoUIvDWJMnG+NHG75SP/FGM5sNkE9t4QYZpqkCYoowIcfsyU5nZ48QwtbnqDvni+bYI7/ZJBrv0dV5kRtZx9qSEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760093519; c=relaxed/simple;
	bh=0AZQ6Ay1EwEJR6L442w4nvYRjFh2IEeN/ox83caRyas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/+VT4HBNUW7zLNk6XIEw/VhJxy8jWKnKn+RE8v9Lt1aDKoyr1R1/fH3YajzuDmefL3nrRbkRKwJLDBGoIkBfv77Ro2Ktr508kpHTEvMftjCnz4mQfJQPaF4Ox7GOBECIpZ06FScnS95Pcq/WCtz3kcg4g+EeVJKLbEkRKTHCTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tibqgk0q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FA1015D2;
	Fri, 10 Oct 2025 12:50:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760093418;
	bh=0AZQ6Ay1EwEJR6L442w4nvYRjFh2IEeN/ox83caRyas=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tibqgk0qJc5iQjnxf1MI++lm1FfaNw1YQYVAbmrAvAljCB/AzSJ66gLi6JQ2lrHMp
	 /kKzZZR6mZh0ohEnZonWfH2NfSlNRxXr67cEMCwN5GmqSAATo3B/AshxB079KE8bSk
	 lpYvUaATDsc7yP2Ru1xowevxzU61kxrVPREKbUFk=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Fri, 10 Oct 2025 11:51:32 +0100
Subject: [PATCH 3/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP
 and IVC nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-kakip_dts-v1-3-64f798ad43c9@ideasonboard.com>
References: <20251010-kakip_dts-v1-0-64f798ad43c9@ideasonboard.com>
In-Reply-To: <20251010-kakip_dts-v1-0-64f798ad43c9@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=866;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=0AZQ6Ay1EwEJR6L442w4nvYRjFh2IEeN/ox83caRyas=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo6OVH8IvNW8KPv5CeWuKfHxuwuw+Eu2Tbe/rCk
 WIGpbr+DgCJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaOjlRwAKCRDISVd6bEV1
 MnWKEACvPaDoz/dBE3Ve14l8aHImv819vVC7CFQMfCM87tvt6ZsseG1gC5wRkSM1vBa5RRk1cne
 fAZrjuISaLvx/Sph97FSs/0XIPq52K6kzVIzi/gfjQesuLhaJHOPSl4vl5jsTkR7LcUarlGcsUk
 a9PDNOaz/tleBTI2epqe89uRzUOKB44cYA6lptZZyMrn2NI65TtlFoJsGENQJC5cTVmwINyjLpV
 AgSmFdmYIo9vfF8/uPczwF+gjnV3xMyRJGGy2imHQQynG8iYqhdrNM2d8N9kqRU+RmV4LHYni14
 qPfU53+IZtnAw94fo0aio3np6skIQAecbU/5r1AQZua1Y1vF8vCToEWWTwrpGVwK1/whEJj7LpM
 7NaDWjMzobx1y8Ar9L7afIGU/HjuQaUV75TrmX6BmUAsLvzGoyMCJ3lTUy+zq1xikGGabxBXVc0
 3dpq2ecoj+lpq0Of4bbpdZvVWDDKk2f3MzsWYUGEMWXtl4eNtSlwkGosveaV2rkKqOSku4ZeP8H
 RU5JXo0pTGnuiqA2Q2Yxd9T+kNjnQaw7cllpgA77N2H5v87AGIHywppm2Tc0fjvv/IgqLpL1J6C
 eLesvHb7NcUzi1/V9wxfGanLVODm/7EVkFvD/ngjY0q6087t7TvdSpz4l+GYS30XEPOKwL2v484
 RXdo7DfLVWy+CQQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add nodes to devicetree enabling the ISP and IVC that are found on
the RZ/V2H(P) SoC.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 5c06bce3d5b4f006a97256c31a263a561e452169..5486f845282d5464fb648bc2eb5f2a67ca91bb0a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -195,6 +195,14 @@ raa215300: pmic@12 {
 	};
 };
 
+&ivc {
+	status = "okay";
+};
+
+&isp {
+	status = "okay";
+};
+
 &mdio0 {
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";

-- 
2.43.0


