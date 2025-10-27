Return-Path: <linux-renesas-soc+bounces-23698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F65FC1038F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 19:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 809EC1A242DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 18:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72BE3314D2;
	Mon, 27 Oct 2025 18:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Mxon/2Nq";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vsVHmfg8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3BA328634;
	Mon, 27 Oct 2025 18:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761590779; cv=none; b=u+JiY0zN8nlLzzzLxGdLnrb8uWrC9z18TVBmCjNNVZEmyo4mS8N9Rimss8WKqlDwwrN5YVRkkK83Z32aEphaMfzW2KSV0NcxkJkQGIhEzd6FLh54sQP53V1szX90UE/i6htUWklvi36Q8OOiN5TOu7dVuoMbaoxXNqLt+tldH2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761590779; c=relaxed/simple;
	bh=vznUNVKhDqJTLoyUatzrE3BXzXq4iimkK72KfDB4488=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uSztMgFg4da6T3UbSE9fwcaH6k5KrNX41dQm7QwE6ehQMnsbojrKz+Jo1CRFl3RbhxS7qEqUEd1GHmaXrpdkUwXYgwVfOMy7hEovJrGImoebWrip0/+MsTa1m0p05s29PrmtN6VtZqWCs92S6JG9rj5wZU347Y0jJcRsxduFBu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Mxon/2Nq; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vsVHmfg8; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cwMsg0bsvz9sQJ;
	Mon, 27 Oct 2025 19:46:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761590775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SSdcMt8QLFSkKLYqTrSr4WGRCehiRklAAWxzKvWYKCM=;
	b=Mxon/2Nq1YWy+zSVRs/eVW89dD2gFeQWBy+dHfi5G9jYwymoxm5vDKnJJWQsy1VCoMYcEv
	P7t1sCf+Nt56yD1/CeBznN6hwhGBEKFsmltIeMsnSMOSn2H1LuUFmncXjarrZbq8ysj+6W
	/wgLqVv0HERXmOcqbbPnLQIEwmxRDlytYdUin2dzPGDHxsvPrX1s/sGMhj7tFHHMJvUO0J
	qkTX2Gmuly0U2Jd89pO0IerdQ+PD/Uw/SRrhWS0E9mirkInw0GAQ/3aXeHqFS73qyhL4MH
	k4y9hWcSJi3AWB/AF5pZgXlnsBTSGsS2pCJAgbxaDU7btV89VSIiQvyK6AsECg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761590773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SSdcMt8QLFSkKLYqTrSr4WGRCehiRklAAWxzKvWYKCM=;
	b=vsVHmfg8KX/1tyPf86mHAubkNuBhaA6ePfVT6amTgHEKTBXNPXhY+CnspJ1x2J959Eos1P
	YFC/ITDmHCQsRkLoFYSCY8X2RdqDSKo87i4tNbW+RNmyukE4UE9ME8yl5kLiMn/tIN0uMP
	7pzzOIKca5Akhc2VJIOKl6I1h24n/6Otxi1NUr9hEKNyY8z/OuQBM7HKotw0KKoj0KhR+6
	8A09tkfdfXUxslKSO9itiRIcRc2nIQAFDkxmLi1uF43w9+Eqt72M2uDGhkPJ+1EK0PWfE8
	vIQ0g40e5WN0ylw7tWwqPQ5XA31WNYe1SdQ7eh3HZJtAQjQ9rnfZhLhWanTV+A==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Fix full-size DP connector node name and labels
Date: Mon, 27 Oct 2025 19:45:53 +0100
Message-ID: <20251027184604.34550-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: x4q7fii5z44mhgk4fkog53ugrzf6ugap
X-MBO-RS-ID: a54833429e75fd65622

The DisplayPort connector on Retronix R-Car V4H Sparrow Hawk board
is a full-size DisplayPort connector. Fix the copy-paste error and
update the DT node name and labels accordingly. No functional change.

Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 0e36a1b96b83a..f4181f6020203 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -119,13 +119,13 @@ memory@600000000 {
 	};
 
 	/* Page 27 / DSI to Display */
-	mini-dp-con {
+	dp-con {
 		compatible = "dp-connector";
 		label = "CN6";
 		type = "full-size";
 
 		port {
-			mini_dp_con_in: endpoint {
+			dp_con_in: endpoint {
 				remote-endpoint = <&sn65dsi86_out>;
 			};
 		};
@@ -412,7 +412,7 @@ sn65dsi86_in: endpoint {
 					port@1 {
 						reg = <1>;
 						sn65dsi86_out: endpoint {
-							remote-endpoint = <&mini_dp_con_in>;
+							remote-endpoint = <&dp_con_in>;
 						};
 					};
 				};
-- 
2.51.0


