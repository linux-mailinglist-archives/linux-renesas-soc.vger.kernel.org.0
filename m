Return-Path: <linux-renesas-soc+bounces-12228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F615A15C77
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jan 2025 12:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CCB816765A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jan 2025 11:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85353185B6D;
	Sat, 18 Jan 2025 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="adIzxWPV";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AuuW46MP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9975F7FD;
	Sat, 18 Jan 2025 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737198862; cv=none; b=EkIR5p7YQbruKRadxLSWkhPTPldAZg4CLsrYMr2iXZ7aoy/Mu5JcgAvhBRm80WXrEzBDjo+6g2Z3f7EqQu3uZVKweNVZIWC8XQWVvq7hyCc+ZODtquFxrlf+FL4pt3SwaxOeMjjnhp9s3/6lhYr4XD0Uv/EvNc1Zz2B+h2QMnTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737198862; c=relaxed/simple;
	bh=psQDU8IbRLCzUr09K6warGXs1wnxnJOaGA3e4E0sJYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rzs0HI6Ib1IBjVqXM2WpuyEQCo/U9T9Zci1Dw3rPdTsHgxWZ4o1DmZuv3KnrmgE4nABfo9uk0Ho/TKsEvkIgq1ZhC1Fca+AXgrssMyj8kWNkMHX3XGW60xHtKqwnqYA+Gcq14qzOEeJsI+RdYHaF/063Jz0hSz+L9FXih9yyFv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=adIzxWPV; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AuuW46MP; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YZvBD4tK9z9t1n;
	Sat, 18 Jan 2025 12:14:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b8Motikz+/X+Nha5DRlA0aqs4LCHAeWCteypUl9PyKQ=;
	b=adIzxWPVl0hwY2ZTFkXacuqBfzFVHK0gnfaAVFkSKBr8DCfhV03GzJ8XJ5PBWelR67orw5
	Jqey7oqQPJ90fwQ2JOSg1rtR12Fq5FAwPcIaqwGOvsE774CYJG/V6dsjr1wQwTQHhywf1T
	+VSK7TTCtVNkBtu0AC9eVdO23j429Qki56t4X52VhToGLfHCG4YX9TF/oC+wXP7aGDOzf1
	2qSmGfBwa2585ZIDN4yyTvAybEd6s4hxvhM27nf2CrWy9kNKl7y1U9Wkks5d/8ONBMeSwn
	zpjfBqrQ1r6LUdCjRyHcmuQ0YFRwpvw6gA3JX77/GV8UR0+js8k1BIyrePUX0A==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b8Motikz+/X+Nha5DRlA0aqs4LCHAeWCteypUl9PyKQ=;
	b=AuuW46MPW5r5/aehtph4vVa5//QpSZqVHE6ISAVtbXfPP8osRxNprilD6QsjUoBYqEceSn
	MfVUjgupsUkIicWNu36XsJ4Krblzblpaa1yFcjcsop1JwN8XxtuRiy+OqCMxx6BDfUrp6Y
	i+PAEgg+ti9WsXW1JDgqTc2ks07Q3ouFnr7n0P4sIfO22Dg3ONybAhMc/Z8Sl/7fgKw/0H
	GMzyoUbKJpXZ5AEmA5kcGhim+MChLEBp9h7YR+TRDD1+D8qHnOXXxiAckfX+eCBlwNHJMU
	NyLLABRyqaazhHkWnQRXuPjq0IoAJ5bbe6KTzsjtfVSh70xtc3+dRGDENSPDwg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: renesas: r8a779f0: Add labels for rswitch ports
Date: Sat, 18 Jan 2025 12:13:08 +0100
Message-ID: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b55d575ec4bd2907d2c
X-MBO-RS-META: gip67yn96u3zt9bcyrwgscr7pk15mehr
X-Rspamd-Queue-Id: 4YZvBD4tK9z9t1n

Introduce labels for each rswitch port in the form 'rswitchportN'.
Those can be used to access rswitch port nodes directly, which is
going to be useful in reducing DT indentation slightly as well as
in DT /aliases node to reference the rswitch ports as ethernetN
interfaces. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 054498e54730b..8d296d0ebdfdc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -974,15 +974,15 @@ ethernet-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				rswitchport0: port@0 {
 					reg = <0>;
 					phys = <&eth_serdes 0>;
 				};
-				port@1 {
+				rswitchport1: port@1 {
 					reg = <1>;
 					phys = <&eth_serdes 1>;
 				};
-				port@2 {
+				rswitchport2: port@2 {
 					reg = <2>;
 					phys = <&eth_serdes 2>;
 				};
-- 
2.45.2


