Return-Path: <linux-renesas-soc+bounces-22358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8FCB9E70F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 859371898196
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FE72D7DD1;
	Thu, 25 Sep 2025 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IzC8sQUU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350DD219E8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793228; cv=none; b=mFksb4yxYbyTBLnOidAA3yjY69s+j9EVTjW4Paxs4ydi9lTZnvaAbaL+K9DgYmt6fPx3Hk2kiY+z5N9CtU5tH18upRMMi1rl+koXezb2BEkXpa+CPnRSmalp4Ys4JUnKWUkRsxrHSpRNtah3UggreJ7H1+4lqpSQ5Ff5SWyO2E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793228; c=relaxed/simple;
	bh=2HtWnFe/hnuIwSJ9zIEL7aJj77kqqVpiEMPUnqqzWZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FR1hQltK1YeOa61+b5pjkWZpquku5M/IS6ZaxnJVzxCQ2qoHfS3jxtGXGkOvz8cpu9fabQ699KzYlGQ+USckD86Wqsq6RghBSHrA52fK3KYr31F+Ennbk0ETCyipKWz5ZJ3aDDjEXE0+zooP4emMSFcO3XOPFdlogvkwH70PvaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IzC8sQUU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=bowJhqsSTk2Nlx4kyprHvlK9kZLzKae9EUW/TMd/5L4=; b=IzC8sQ
	UUFlpP399hy62aMP8WprIrVIv591dB9ToFXviRlR0aMDuploJfqhCIZw1w1Xmj0H
	T6/z5h6CNdgtHZGc0hDH1uvTI7nEmyRRMUepdtH99SlAFZyTnjySJ7gWA3nFM73l
	TiqQ/tVbz0yFi30pzNYhltPVrDYycP5yy7ngrW4WOzHpDKm/CwryIk86BfpsBp5u
	Ea4A8AnqEp7RodTw04TEeiEzSvk7g316T2TbbW+asTa+lGDX03cHrW516hiJIN4T
	MVpT5YK/jA5ZY3WwHchGxxzHvfgGkNCHQSCuU1aU+eAJhl1hX4sMvlmKRgyf77a+
	pcpOJPGFckcuvpWQ==
Received: (qmail 1813324 invoked from network); 25 Sep 2025 11:40:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 11:40:20 +0200
X-UD-Smtp-Session: l3s3148p1@TWAh9Zw/zsQgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 08/12] arm64: dts: renesas: salvator-common: mark SWDT as reserved
Date: Thu, 25 Sep 2025 11:39:47 +0200
Message-ID: <20250925093941.8800-22-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250925093941.8800-14-wsa+renesas@sang-engineering.com>
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This watchdog can't be used with Linux because the firmware needs it on
Salvator boards. Sadly, it doesn't mark the node as reserved, so this is
added manually here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index bbb3583372d0..fa8bfee07b3c 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -1004,6 +1004,11 @@ &ssi1 {
 	shared-pin;
 };
 
+/* Firmware should reserve it but sadly doesn't */
+&swdt {
+	status = "reserved";
+};
+
 &usb_extal_clk {
 	clock-frequency = <50000000>;
 };
-- 
2.47.2


