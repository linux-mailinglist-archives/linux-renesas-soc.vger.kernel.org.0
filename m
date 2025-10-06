Return-Path: <linux-renesas-soc+bounces-22688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF14EBBD587
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 10:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8B53B349B7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 08:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C46261586;
	Mon,  6 Oct 2025 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HGu3zIT8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3B02609D6
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 08:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739352; cv=none; b=ZDGlzbMnhsGtRV8rhhKIa+NSWh4+B53Suh5y8d0MafCYC3pgzTvwWoOB/+EBH/y/goOieF/Mv6/xY0cVjnu23hzLMXAAofsGxinlsy+eiv63wQAXsTmtgvrAvZEmlm94u/yKPTML/E4Wy72VHOJLDP9eBiE2cKoQRIZN8susO9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739352; c=relaxed/simple;
	bh=THvm0Vm5kBQ5SUUeq8HFOvno/HZyTi7SIWfBfb40AnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DmQ0sPONRlIuB7ogEtb9ARNUdc626qeTmszo2aVGKfOTRlfD5+MM9zfwuG3LzrrOcPL32KeCenATF3JyPNUj2DENtVkySBhIs6RhaDTFVnpkWhTsMbYgFk3XqCgrFYkAEvEdDPTDXE1qUe3HW1PdyTZ+MdUN7DsptHiQoX4Sihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HGu3zIT8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=wZxJBTveHdGEeGL/DRPvSnrxQLANG8VijSMD6N8xeKQ=; b=HGu3zI
	T8cHcV+8m8paH7KUGmqEJdu5tTBAfx736q7KMY4hvnORukCx3kf+AnX0GHMyfz8w
	tCPVCzI9eS5scaztdMEBVlG35Kz4w+pyYVR9FABXCpw6+0GeTzvYFWnk27HiF7JZ
	mmHRE4SGrIKuq3PDpPqkYgAhdrB461vvzZ7uJ/NEdRDSdbsXd5mV2hV46rEIgxOc
	lsCfJt6UPSkyjg1jflFc89QU6Rgbnx13xrRO1iJ96vD9WG5/3kKTpaxEU61iyq6A
	k89FuU1qNKhlIy+kM7F5UWnW4ZDeIktSciLw2kkDP0Xa2U+kghXWwmLCtQw690i7
	dSX+IA2CA5ZjfpQQ==
Received: (qmail 1689920 invoked from network); 6 Oct 2025 10:29:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2025 10:29:07 +0200
X-UD-Smtp-Session: l3s3148p1@IGKvPnlAiOwgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 6/9] arm64: dts: renesas: white-hawk: Enable RWDT watchdog timer
Date: Mon,  6 Oct 2025 10:25:24 +0200
Message-ID: <20251006082520.10570-17-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
index b1fe1aedc27d..15554aa64c5d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
@@ -12,3 +12,8 @@ / {
 	model = "Renesas White Hawk CPU board";
 	compatible = "renesas,white-hawk-cpu", "renesas,r8a779g0";
 };
+
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
-- 
2.47.2


