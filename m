Return-Path: <linux-renesas-soc+bounces-31964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC1TLuUj+Wmz5wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 00:55:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F994C49C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 00:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 443283000B0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 22:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6400338B14E;
	Mon,  4 May 2026 22:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Tpv7d+h5";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="p5mcKY7T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA02377543;
	Mon,  4 May 2026 22:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935331; cv=none; b=C8+soj1rJuHoYjOGslOGMIKzLiEjb/SrT4YJxanhaWg+1sT7hviTZwheoOt2FsFPzQeOM2TpxH/yTfUktU5yfPvZhhym9D8ND7hAc6WbR2wXMOP0imu9Y9XOIlqehaK84SyAxTSXDNvVGxvpI9UjbAcShWWoYY0EU7flBOiY7Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935331; c=relaxed/simple;
	bh=slpc2J/3lNzKHQP/8qGYvGhCJsv4Wqjr5IXLib9PUc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gn5EWN+7qVDD7oAtm8EhV2ASx63xVZO/6U8KEYTHLCkqbWDpOSFGsTnuEEESVqHd0TIdwgi4+wI856KMLzGccMz/zyxRxfIVUp8r5ims/A5MNyhdtcxMxUNh3hEhlgaYTmwFwreAFN2wfnOIxQ3naVjvKSnVn7AbO+/Wn2Ed6ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Tpv7d+h5; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=p5mcKY7T; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g8cRz2W9zz9sss;
	Tue,  5 May 2026 00:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P6wqddPFyyag+0HqiKhjqX5gfmmABljWiCbj0h87e8Y=;
	b=Tpv7d+h5dL1knisdlh7UBjkinEoKoBsPW95Jq5jM5NdIZy/C1vMaInpTJ91KZOcfMGaujW
	Tw8if6Y0wzXkmmJdEjx6K8YxPyREdwzHRCMcBCl7Hr9sykPs8xaK5kaAAXdZBNpYjGmfaP
	inQbW7Ql8bF1ls2Gt+P6crcFD7cN2+9R2O7cAbEGTYc95AjRPYyKpjEDnrq9JwvxSoT10x
	Vnity6tE9ryB1i+hCwRNRrFRhNPj2rBgDBhz7H8lXEErvvVf9Gi+0ffkgn02sfQaO3EMT4
	oVGg08KonaGpu26RMipX0qT5UrX6acBhwFrLb2YwGbVOc5nEnpjoLT4g8XyKNw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=p5mcKY7T;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P6wqddPFyyag+0HqiKhjqX5gfmmABljWiCbj0h87e8Y=;
	b=p5mcKY7T8eA+iyL+Ft9GmRBAOVZK54B+jHNOXsCnPsXy16OLq3AgG49wOrnsduUJ9dgxal
	Z39GKelv6YRGGsRJFgFkQIU1z5iKwNdxoE2U8PnBMLwraJDMq74Xt5LcVfllsqLB4M5sG9
	SxaTN/E/i2kNbP8KgOItmqDg6qZqMdzQLCeWsH23ckGKzMoYtiuVd+hWFNECRJcy6+TA7Y
	8FznnD/Iv6DLMsiZOeBDO0p/eY+y1nNLvUiCCzNLn+nBW/gSDssswFOLmNA9ejlk4UjwVa
	LPdnkupK9mGkZFxN1PMfbTqkB3WGAtSnmkWk9Uw4hhuUHBd8tswlUotOMMcGRA==
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
Subject: [PATCH 1/2] arm64: dts: renesas: ebisu: Sort sound node
Date: Tue,  5 May 2026 00:54:42 +0200
Message-ID: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 51c91871026be051011
X-MBO-RS-META: fcqpm9xnkumw5gk6o8hkimkjef8fjrrm
X-Rspamd-Queue-Id: 44F994C49C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31964-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email]

Sort /sound {} node in the correct order alphabetically.
No functional change.

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
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 34 +++++++++++++-------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index aaedb1fb51aed..ba564aa098661 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -186,23 +186,6 @@ reg_12p0v: regulator-12p0v {
 		regulator-always-on;
 	};
 
-	rsnd_ak4613: sound {
-		compatible = "simple-audio-card";
-
-		simple-audio-card,name = "rsnd-ak4613";
-		simple-audio-card,format = "left_j";
-		simple-audio-card,bitclock-master = <&sndcpu>;
-		simple-audio-card,frame-master = <&sndcpu>;
-
-		sndcodec: simple-audio-card,codec {
-			sound-dai = <&ak4613>;
-		};
-
-		sndcpu: simple-audio-card,cpu {
-			sound-dai = <&rcar_sound>;
-		};
-	};
-
 	vbus0_usb2: regulator-vbus0-usb2 {
 		compatible = "regulator-fixed";
 
@@ -260,6 +243,23 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 		states = <3300000 1>, <1800000 0>;
 	};
 
+	rsnd_ak4613: sound {
+		compatible = "simple-audio-card";
+
+		simple-audio-card,name = "rsnd-ak4613";
+		simple-audio-card,format = "left_j";
+		simple-audio-card,bitclock-master = <&sndcpu>;
+		simple-audio-card,frame-master = <&sndcpu>;
+
+		sndcodec: simple-audio-card,codec {
+			sound-dai = <&ak4613>;
+		};
+
+		sndcpu: simple-audio-card,cpu {
+			sound-dai = <&rcar_sound>;
+		};
+	};
+
 	vga {
 		compatible = "vga-connector";
 
-- 
2.53.0


