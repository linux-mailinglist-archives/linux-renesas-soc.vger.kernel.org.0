Return-Path: <linux-renesas-soc+bounces-34031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ieVoNpX7L2q4LAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 15:18:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A96686A18
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 15:18:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=pPgiOaFJ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95F323028BA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5753F7886;
	Mon, 15 Jun 2026 13:12:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED6D3F5BF4;
	Mon, 15 Jun 2026 13:12:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529163; cv=none; b=uQ9Dm7BjLsKUEknjnt1COD0r4PRl1l5ywmMLBMTVRkEHgYBXXZrVCqsG1mEIFAPUNRmeVB3mzLUfPmt2S5sdfb9wSNtpbTuWLWzqEQd02TWdK4CiLYc8yBR5fxSx27OSBV0lIVATNiJeCl1PdKDp1eR/hqGGzvMafopC3XrHxGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529163; c=relaxed/simple;
	bh=E4l62o+sxS+bPEPN3Rlb+RatxgF6zDPhb0MAy+QFUv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JHZNpfPHDRSPgzSMHWNyKW2MMZXMlWU3HQjWekjqBu+HAWG1VVaO8CTXqfi74tj7MTDps38tNgw75BQxzBLEMlz/uPTkJRZD6btxiXk9JKHnGZgJIjp8NzztKEhJZDkNORihuf6kt5HVq5VaB5R81mKY9WYyTOvEO9OlDYFBK54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pPgiOaFJ; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B442B2053;
	Mon, 15 Jun 2026 15:12:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781529124;
	bh=E4l62o+sxS+bPEPN3Rlb+RatxgF6zDPhb0MAy+QFUv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pPgiOaFJztmqm4q3kJwhqDBdKRxrcP9GKL+swZM+XalQtauv+3bG25rkPOH0uMo+3
	 luh0/SDIufzXWdffFcVyVJbOiZO0X309dp8YgvLUdfMiFnn6YP0jzUFOHqdTVl05q+
	 vllMgin5uU9gVSRkMUcn9355FDLfdAwNo9/oM4xg=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 15 Jun 2026 16:11:59 +0300
Subject: [PATCH v5 6/7] arm64: dts: renesas: sparrow-hawk: Enable
 DisplayPort by adding DSC
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-rcar-du-dsc-v5-6-aed1a28610e4@ideasonboard.com>
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=spwA6S6xpukisy7pkedqiZJctKlACrqVu7cRL2eEc4Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqL/o49aYWCGx4tmAn4AR+SDjJjh8MPJEXr+n/K
 eeuhc0zYhiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCai/6OAAKCRD6PaqMvJYe
 9aJpD/4prsoLmTko1AsZGsTsDAMN0HKrblj+zq4V/kEHeecFC8bPESCC3V6jdRasFjHDohkLpF1
 Y8EiqYzr8vicWhCfQoeN9FjRYP0IwD/3dYLkw0tcs7ZtiYwQ3dNPswtMnQ4XDLUbOLDMWxc9Fda
 6ovBdoRucFE8mj85RqLN5HoynGw02RAliGMuXpKU/OGSTRpasl9a32sXTGNKoB0XJSUfQ4GLhnE
 x4YlAXUi95En6gpa2Qukmr60Swk6MFlYw2sFQcebCJkA3RNnnr0hBO+B3OexpEuUDlJRcPv16D5
 xmy/w0Azlo1WsCGVZtHscmCyYZajnWr8eYcpdBdG0itMablOOI7e2e0doI0tLpeuv/0rhWD8Cl+
 HWrKCRXN3yF6apbK69dNnoH4z8mE2+BAHEF1H7ce0QYtF9jdNRLvEh33t4x0cML1j12tX/FM30R
 8WLyeD3Oti9ZMZrI1AORv1ebokAKwQDgyHCr8lfh0fa88jaD2mBl+qtMEehi4FOFN7FYXDk2eJW
 d6PZ9b+I1hBd3kZ9AsSHRx+Xus3MJMEfc1Z451FO0201Tv3nOEa/3UlKW2xpHzWu+EkJjjNwNNs
 EzJfkBzHfQkAv918lUWBwhtjD912wGJnwj12UyF/HGGZWjsF/+MtA3CrD1uJlrsYiOcpqyoRD8L
 Ja2x9Q+fFx72SmA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34031-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:tomi.valkeinen+renesas@ideasonboard.com,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m
 :tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03A96686A18

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

DisplayPort on the Sparrow Hawk board uses sn65dsi86 bridge, which in
turn gets the video stream from the SoC's DSI1 port. DSI1 pipeline has a
DSC block in between the DU and the DSI1. However, there was no DSC
driver in Linux and also the DSC was not defined in the dts files, and
thus the DisplayPort output did not work.

Now that we have DSC defined in the SoC dts file (r8a779g0.dtsi), we can
enable DSC for sparrowhawk.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
[tomi.valkeinen: separated the sparrow hawk changes from the soc changes]
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index af680290ce81..0a5ebe0460ca 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -288,6 +288,11 @@ channel4 {
 	};
 };
 
+/* Page 27 / DSI to Display */
+&dsc {
+	status = "okay";
+};
+
 /* Page 27 / DSI to Display */
 &dsi1 {
 	status = "okay";

-- 
2.43.0


