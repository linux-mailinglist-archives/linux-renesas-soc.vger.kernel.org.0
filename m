Return-Path: <linux-renesas-soc+bounces-31946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qISFFp+v+GkPzAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:39:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B278B4BFD2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4EAF3032CE5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 14:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833463D6CA4;
	Mon,  4 May 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="v1OAtEQ/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="V2KO/UXm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953E529E116;
	Mon,  4 May 2026 14:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905489; cv=none; b=EAei33c23s0RvgnJqs5t3I9NRMlGc7PrzWl2uT/IOpLU+JwkoOt7FIDjUxzUX0tHJ0jSdL3u+O9ATjrwWClBEd1DM5lKZ3XxEDsk1um2tr/mKnzGxzBfnXQgwRhWE3K/qmpn2OARg1wfewuJweorB+gpKXZHiT0xSk1sLJG1Ceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905489; c=relaxed/simple;
	bh=TNTaMNn9Qx6juhS0o5aGXz+wACJyj+lXsh9rSoIO/eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mfvLsDpOhNQa32v6wQupciiyxBJReax2s0kEIOkuEta41q3dXenuIdebsa8d8qxTs3P9YEDiTDYzSDrnxZK2km0MykJQvbPQlHH45OcsWbw8q4QSPeoGcH2S49ze1/98NkYqAre8gc3W3N7lXSmlhCOM9S73wkvSaW/3i7iGbUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=v1OAtEQ/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=V2KO/UXm; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8PPz2KwFz9v0b;
	Mon,  4 May 2026 16:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wBBgH/SwekkvEUj5hUEj4xBQU7ZFg8QEvCj3rWtRhYY=;
	b=v1OAtEQ/iIuJbMejFNzyBoxHginAmhPCOi7gulFDDj4GOMs5ylY4snBvuOLhUT2IgvBLzd
	iLelwOZucftPCXtvPEFUu2kYEIelPmprnM6FKSozLzROJ+RjJR5ZvayQKFPYwVonsDV8Q5
	J4zXgPByuLAWwz9zGIz9GXfnEj5kQfYAJMevXvhCrOFY5QOoGbHH0uSqXfK0HJ8ENEjZwa
	RAcxEulictj1kqtqSICD3NFvSm/b1iVN4hR1G+cedt3jnujmNLVcMqszV5Yb/gxjdQK8gb
	Vpb4NKKnTHIR7okjrNgmhTD6OGSJQjrr9x0xS6ZrXiFt4ZD+KeJHt6Pj8lTwMA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="V2KO/UXm";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wBBgH/SwekkvEUj5hUEj4xBQU7ZFg8QEvCj3rWtRhYY=;
	b=V2KO/UXmenPspVl241dUMK//P4ADnYPSie9K4/xxflqBjBKGkU/ixNsP75QKC2faSQdFvR
	QqF0kWmx0H4ldrB95bVZx0s+3SMc/wFSJv3cw5Ex6aHYN+zp35SrNsYkiaQfleK26AlY4+
	opZo5ze60f7EfaJ5drzy+ZRf6GZXaLGdiDTJvH4f3otGnEYIZvHb1+F8RuFLaHu3kG0Pbx
	eVZlLgAyY2LTG9tn4rzfp0LivH8wxc8sE+G4M0Zz4vjXHPi2nYOp0Nt04ZHFf+cQER3Par
	Y2T45IG8AZF1gvWJa7ZtNfGToACSVYWYFfgQr3evEEUb8O5cziRLcLopsyLEiQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: Simplify AA1024XD12 display DTO
Date: Mon,  4 May 2026 16:37:15 +0200
Message-ID: <20260504143751.42753-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qtdtonkhjf5zyfsokwgws7cdwn8ejha3
X-MBO-RS-ID: db7a51eb740a63470bb
X-Rspamd-Queue-Id: B278B4BFD2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31946-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,0.0.0.1:email]

Simplify the AA1024XD12 display DTO, move all the differences into the
panel-aa104xd12.dtsi , rename OF_GRAPH links to generic lvds_panel_out
and lvds_panel_in names, and parametrize the LVDS output in use using
RENESAS_LVDS_OUTPUT macro. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../renesas/draak-ebisu-panel-aa104xd12.dtso  | 33 +---------
 .../boot/dts/renesas/panel-aa104xd12.dtsi     | 64 +++++++++++++------
 .../dts/renesas/salvator-panel-aa104xd12.dtso | 33 +---------
 3 files changed, 47 insertions(+), 83 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
index 90767d74e21b2..2ab7e947a05b9 100644
--- a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
+++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
@@ -6,36 +6,5 @@
  * Copyright 2021 Ideas on Board Oy
  */
 
-/dts-v1/;
-/plugin/;
-
-&{/} {
+#define RENESAS_LVDS_OUTPUT	lvds1
 #include "panel-aa104xd12.dtsi"
-};
-
-&{/panel} {
-	backlight = <&backlight>;
-
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&lvds1_out>;
-		};
-	};
-};
-
-&lvds1 {
-	status = "okay";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@1 {
-			reg = <1>;
-
-			lvds1_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
index 4b1f0982b9e4a..11113a13a337d 100644
--- a/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
+++ b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
@@ -5,26 +5,52 @@
  * Copyright (C) 2014 Renesas Electronics Corp.
  */
 
-panel {
-	compatible = "mitsubishi,aa104xd12", "panel-lvds";
-
-	width-mm = <210>;
-	height-mm = <158>;
-	data-mapping = "jeida-18";
-
-	panel-timing {
-		/* 1024x768 @65Hz */
-		clock-frequency = <65000000>;
-		hactive = <1024>;
-		vactive = <768>;
-		hsync-len = <136>;
-		hfront-porch = <20>;
-		hback-porch = <160>;
-		vfront-porch = <3>;
-		vback-porch = <29>;
-		vsync-len = <6>;
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	panel {
+		compatible = "mitsubishi,aa104xd12", "panel-lvds";
+		backlight = <&backlight>;
+
+		width-mm = <210>;
+		height-mm = <158>;
+		data-mapping = "jeida-18";
+
+		panel-timing {
+			/* 1024x768 @65Hz */
+			clock-frequency = <65000000>;
+			hactive = <1024>;
+			vactive = <768>;
+			hsync-len = <136>;
+			hfront-porch = <20>;
+			hback-porch = <160>;
+			vfront-porch = <3>;
+			vback-porch = <29>;
+			vsync-len = <6>;
+		};
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds_panel_out>;
+			};
+		};
 	};
+};
+
+&RENESAS_LVDS_OUTPUT {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
 
-	port {
+			lvds_panel_out: endpoint {
+				remote-endpoint = <&lvds_panel_in>;
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
index 7807c3f80409a..4eb3e06ce52bb 100644
--- a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
+++ b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
@@ -6,36 +6,5 @@
  * Copyright 2021 Ideas on Board Oy
  */
 
-/dts-v1/;
-/plugin/;
-
-&{/} {
+#define RENESAS_LVDS_OUTPUT	lvds0
 #include "panel-aa104xd12.dtsi"
-};
-
-&{/panel} {
-	backlight = <&backlight>;
-
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&lvds0_out>;
-		};
-	};
-};
-
-&lvds0 {
-	status = "okay";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@1 {
-			reg = <1>;
-
-			lvds0_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
-};
-- 
2.53.0


