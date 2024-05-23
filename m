Return-Path: <linux-renesas-soc+bounces-5456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6D68CDB95
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2024 22:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE5671C20D07
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2024 20:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFA68562E;
	Thu, 23 May 2024 20:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XOecSENI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C285283
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 May 2024 20:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716497459; cv=none; b=KF28Hs8/8BMrVSlAb4RfEzMjrcfAwaQT342jiYEx/Tt+TxkAs2SCXsuGCd+OUEeZzGvfFAB6fNus15xoS9GP9Uwvm2abkqvBk0sJDJlw2hOPrtxEDYIeTmsP/tr2ufRBSnsZcisZnQCEPrcKDbbFdd7elzLa3XtTVKoRK5gtZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716497459; c=relaxed/simple;
	bh=8XNbsiseAq2Ey6X5NlrtbBLi96KiuvmE41EIaiY2RwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uFQwdNn/4v46GIxGDKX/c/VIeQyCrzs+vsk9cz/iNR5m2vC5L6wAqC/IkBlF5RepVhbu/bebJJZ6OEDLelFtQei5w4sg/AOE/Fhp0XbzH9AuG/CVwiFg4PPoCNGvy5HPBlXC2Rr27a+uLpZYcFZMoCbhYXnnR7p1qasEdetPQ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XOecSENI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=x35pRWMCou4JbwHmxrDT7B62OgjC4BUcy5nrKC0Pyuo=; b=XOecSE
	NIpuYZP1Vm5imQnvgtJWPkL78TMuIxRJ/JUICNlM16b9BQuSbTtOAMMRqfMOinHK
	FuJJ2/p8ELSI/CQKMlSY0qVxYqnIIE7qDKA9bV6pXelF3Bx4JP2QhlVFa3iyzd/Y
	VOq+ivdCpLFEOHwRSfACExhvosha2F2TWsHIGuwJULMwaH8Ype6KdL6wJSsz0Z/L
	d/PZqdcM4UHfqqeL+ZvKM9WnZnFsl0v80ykczPvHvnYY5cO9J8S3PgnmBKEVuFvo
	glZOePDLv2lVno1GKGIILfJVaTxW5oWLQ1rdEdOKRJpnPK0PHQiMkljs/VmCN1BB
	Z7S+4vBPoyf2vFNA==
Received: (qmail 1241557 invoked from network); 23 May 2024 22:50:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2024 22:50:55 +0200
X-UD-Smtp-Session: l3s3148p1@hUAQNSUZOLQujntm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: renesas: spider-cpu: add aliases for I2C busses
Date: Thu, 23 May 2024 22:50:39 +0200
Message-Id: <20240523205041.7356-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240523205041.7356-1-wsa+renesas@sang-engineering.com>
References: <20240523205041.7356-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are numbered like this in the schematics, so keep the names in
Linux the same.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index 477f3114d2fd..4ed8d4c37906 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -15,6 +15,12 @@ / {
 	compatible = "renesas,spider-cpu", "renesas,r8a779f0";
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
 		serial0 = &hscif0;
 		serial1 = &scif0;
 	};
-- 
2.39.2


