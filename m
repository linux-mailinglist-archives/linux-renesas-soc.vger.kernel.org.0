Return-Path: <linux-renesas-soc+bounces-30521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKrVL1Eax2mXSwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 01:01:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCCC34C9C4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 01:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 406CF30474DB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 00:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E0429CE1;
	Sat, 28 Mar 2026 00:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ocu0kZwh";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BGMDzIXj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2252066F7;
	Sat, 28 Mar 2026 00:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774656052; cv=none; b=O4/FrwyFi2opNw4mOVf7IKGDQqRLm/u5P6QN9Zr8tQeYEHvu8QK0X/yoryKy0hrdFwpGEbGklaU20FFLMtVfTDmldslU2I3T8VxT3FYtv9ogvLUE4jxtkaEYhrLXNE52pamXaTLWGVHyYzQArBHkto80FXerWCULRhs8nc3+nHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774656052; c=relaxed/simple;
	bh=7sKHw34AUEgq/XqLcT5vMyasoi4uj3pnEWa2hfg6eLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tHwYXJH9LrkG/GZBEB/NzwTZxEeSApnWzMI50oIDK78uu34N3FpmwZZJk28fhn7dgphkeruVX0P8Xz1bfAcqeIl6MIUS0PmCItX+ceDSmQcbZoRDYQnt3v0hWFpHYUczDq94MxwqK2brnoo3oiDLhJa5Wv1hZh/hLkjos47WAmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ocu0kZwh; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BGMDzIXj; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fjHhw1BKYz9tcq;
	Sat, 28 Mar 2026 01:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ChVlZg4DQcM0BMMikYPaCk2lhDaVuYdhq7p8q4efM+k=;
	b=Ocu0kZwhTlksevo19PYFTZ69n6soqc9lCQa+xcrf6AhQMJQ3Nzc4edYqTAGUXX2dIHj8lT
	6DAYDyrI4KK1o3RAaemy4wP2IiZ0CcNiGKflVcF8Z25ynUCCsBgFgoPecW6b2Fxec/dEuf
	KHYvEa1Vw3h+kfdiJ2Zy7GyBFQhLAbz/rHNsKy1iisoPTnF9VE+SRSchiwyZrAjpp62mW5
	v1ypBGywsCb4FmNnelF6/wis5vcmZQaLZ5UUowMwlwqE0Rtmw/v6OJi53M4evEws/ZHqkF
	iP2HV/Q/JZGQWdDBKCiuV+4w0L4yqtzOqxYfju329HvwLzzyNThzIGAYdyQymQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ChVlZg4DQcM0BMMikYPaCk2lhDaVuYdhq7p8q4efM+k=;
	b=BGMDzIXjadXYInfpq9ZCy27CEQYTdyPskKxQFVK8T3azuJNK2de+FX+ZflQ9QPwQ5As3qd
	lODwad0eHZuxHuAd4XY4ZxPki/plEJz9n+HiYVRsQ92x5miAYmpPHbv4LQPZQTc+bxmSjM
	FSw2gP6+gg3/ynDFai494c7Mj7e9SX1+Y74tlcszNob+IDqQ6ALa+DLxHaG3FYS//Noh4U
	oL+FDHtnqUOrHlBaPF0wBwuvBFKgeqvgwL/rGherHdL1uv8PyEma1O3xH7G/Fmby2V4h+i
	hyfHmSut8UOvKF+5VJ528ThdDvXPtpzIoZcmfVaJ0sfq7t1NsWojhEPBOUtThQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [RFC][PATCH 1/4] dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile A1
Date: Sat, 28 Mar 2026 00:58:18 +0100
Message-ID: <20260328000031.94645-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a36fb0b4677beb61b53
X-MBO-RS-META: pwr3aftunkzg7rwc7fgbask7d5d3axb4
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30521-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2FCCC34C9C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document ZT trace bus and ZTR trace clock on the R-Mobile A1.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/clock/renesas,cpg-clocks.yaml     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
index a0e09b7002f07..e974dd077efbb 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
@@ -41,7 +41,7 @@ properties:
 
   clock-output-names:
     minItems: 3
-    maxItems: 17
+    maxItems: 19
 
   renesas,mode:
     description: Board-specific settings of the MD_CK* bits on R-Mobile A1
@@ -116,6 +116,8 @@ allOf:
             - const: zg
             - const: b
             - const: m1
+            - const: ztr
+            - const: zt
             - const: hp
             - const: hpp
             - const: usbp
@@ -239,7 +241,7 @@ examples:
             clocks = <&extal1_clk>, <&extal2_clk>, <&extalr_clk>;
             #clock-cells = <1>;
             clock-output-names = "system", "pllc0", "pllc1", "pllc2", "r",
-                                 "usb24s", "i", "zg", "b", "m1", "hp", "hpp",
-                                 "usbp", "s", "zb", "m3", "cp";
+                                 "usb24s", "i", "zg", "b", "m1", "ztr", "zt",
+                                 "hp", "hpp", "usbp", "s", "zb", "m3", "cp";
             renesas,mode = <0x05>;
     };
-- 
2.53.0


