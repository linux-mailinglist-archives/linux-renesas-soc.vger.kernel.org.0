Return-Path: <linux-renesas-soc+bounces-22743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCBEBC10BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 12:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA08A3BAB8E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 10:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D1E2D77F7;
	Tue,  7 Oct 2025 10:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SPEc3D+Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55505264609
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759833999; cv=none; b=bf3yWNk6jNiFinh8s9J7mXvyld7YGGjc5f9wfuFogptYWgW0oeUBzyiciBTbeFAk02nZbaCn1K2llTH8VAUw3yWrBAz/nuA9a+8gYyn6j2qPMYUwH4TXYrkntb/rph5mkKftyHuJ79R8zD17eX7tHzYcF8Q9BJRSjKq3k8W27HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759833999; c=relaxed/simple;
	bh=S/hdALFXXM8Q68HDVAIFPJvHvB6AfNYtFmwz70rY14w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sU4ET/iKKw4Yl2R4Q7VXl3/Uir2F5Upjh8ATldkQmhD49mHmfgsk4GK5WGALtqAASfhqjEsf73UjOWXWCxGQilbvedq4y3DP8YBzvSYFqI3QVVGkluU4HDKIj07SV94IUgjuIN/+uWcrqo8wV6rLes4q4wS66/biQlNZ7zEkKo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SPEc3D+Y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=snABSnD6TGGXT+
	ln2/3elYNogT9w7o0Hp7v9JEk7mL0=; b=SPEc3D+YwAYfRGylDbtu4Qijg13Hjz
	KzFgBEQtP9DpCJt5zM6UfEbdS1IT8DQP80Dq1+DFZpH5NQfu8fd28rb4iE4oXN0E
	atlBiTln89kA2D6zAcu6MbX0TFRyI5rDEQzimc991mrhL8QO9mp3cyLXkRI/MyRU
	OFPymJgO3gqn7h9WkjmxiNQtisuHJaAsux0PmHnLlEPEXDzCRlRqHJm6k4jznX/L
	Du4dTFfbnD8oWai9ZCYNq/S3Fx0xfs69DqiRBdjoiSLlVztlINPhWUbGQWe4z4Pd
	3kYjGlShGpeARuIKfVtoL5PPtxXs6sQmOkiGO8lm4vmUjffEfqlakReQ==
Received: (qmail 228698 invoked from network); 7 Oct 2025 12:46:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Oct 2025 12:46:34 +0200
X-UD-Smtp-Session: l3s3148p1@7r4QSI9AFoEujntU
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: drop invalid #cells properties
Date: Tue,  7 Oct 2025 12:46:25 +0200
Message-ID: <20251007104624.19786-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'ethernet-ports' node in the SoC DTSI handles them already. Fixes:

arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: switch@44050000 (renesas,r9a06g032-a5psw): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index d81e92f787a6..c2bb92417af1 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -357,8 +357,6 @@ &rtc0 {
 
 &switch {
 	status = "okay";
-	#address-cells = <1>;
-	#size-cells = <0>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_eth3>, <&pins_eth4>, <&pins_mdio1>;
-- 
2.47.2


