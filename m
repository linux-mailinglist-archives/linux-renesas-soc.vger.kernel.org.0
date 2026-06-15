Return-Path: <linux-renesas-soc+bounces-33987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1t6cETecL2rbDAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 08:31:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8D683D60
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 08:31:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=WLyuF8aw;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7C1130254BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 06:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519523B530D;
	Mon, 15 Jun 2026 06:29:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024DA3B47E6;
	Mon, 15 Jun 2026 06:29:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504948; cv=none; b=C96fwCDdDqPbgSaFqCDpabp9655lMFLYfbZ2dqSntb9x5rcutmhisMAL9AUL6ToeLtJwTSx7/ogRyX0e1wehoE8dOIKn/Xzyl+XXrIf+leTUJf3Gq94i7COSjC3m4pU2at4drnAOraifsG+l7w4VvMDSmSOXHc5D94hZM4dYX6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504948; c=relaxed/simple;
	bh=E4l62o+sxS+bPEPN3Rlb+RatxgF6zDPhb0MAy+QFUv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9RWjvt07jjuclGHzkyIMPPIihj4ohnLEqat4moe1K3RIznEpDiCjTZsark6AgCjrmdNDy1i017+nOPzL+5NHX0irHJvcSDYjyRKMmlvXLhwZXZ6fykD6mhBOH+LltllCdzxjKXUdvq1qIgSdCt8Z9NHneFObWdHXGGDMKro7Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WLyuF8aw; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4BC31D98;
	Mon, 15 Jun 2026 08:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781504904;
	bh=E4l62o+sxS+bPEPN3Rlb+RatxgF6zDPhb0MAy+QFUv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WLyuF8awwFeoYvwZKLpYH9y0PJvErUl+91TigkV4jfTSLmJc9+OblHvvo0ry8nCCg
	 jcLp+n55UgJ8O230G5hVfmW4yfrfgyfYi1tV2DQMaAa56tnrrSPGsuhHy1AhfEnyeA
	 pRxC4N8nr1uMC7mo8k0PpLnOZ8Sa03DDsJY7Ca+E=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 15 Jun 2026 09:28:11 +0300
Subject: [PATCH v4 6/7] arm64: dts: renesas: sparrow-hawk: Enable
 DisplayPort by adding DSC
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-rcar-du-dsc-v4-6-93096a1b56a3@ideasonboard.com>
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqL5udr6kMkE9rW3zTY1IfRXRLULQ213D5gnyk/
 YPyuCaBP8iJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCai+bnQAKCRD6PaqMvJYe
 9fqKEACfUmSjtK5rDF096H1Fl8WIafdcfvsmEYL1HofTrHd4j+WmoJVBEKaqLxFJJEU8XYHUmgB
 X6YtbnRpozVWq80K7R2EqK+nMAX7VDk4karnA6ogZPRWTebYV/OjdxyA8u0oPPMjho87QmLRgO4
 RYN4aJe8LsiELk5VPsmQ8JlfvEJ8ix/lOJ6NounHSzVy/TWWgPw0uHyggcoQalLZZ6w83nd6xII
 EIvqnGpHnGV2/jRqmcG5DDqil16BBvBkW8LMtR31VtboH0MNneZNFK+bixO+43LIR3vBotNHDe5
 27+452HJLklUMrvl8LBqU/Rj9Lmmfqg3JVZsi2bJIE7JmOB/l3MLVSRBiORyxk1/uyTux6gKJVZ
 hy3cIuicBxU4vSPLEiZr2BAaPMzHhXBF0LB0R9kopFDS50vAqkFksViCtsRMQlQXI1uI7dwI/2m
 TJjzLVGYePJmEcKpmbX6QkPZOMTzlNbacal5ruq16Ygzgl9VtPVi3I2jZrXNTE+XucG5patIryi
 bu/q9BosGM97W7cctLSCo0gXqS9WGLQIWDpIP2jkcurDBGaGY74RDS01CXlrytlr7XjswIBZvDB
 BDo3AiRg16Qt0hpqt53NvsVP+ut1MhmG4yGE4Yio0fMo9g+4r+TbURvuMLpT9g2GPOcIcwclsmy
 i5iB8AMU7E2/jAQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33987-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,mailbox.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0F8D683D60

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


