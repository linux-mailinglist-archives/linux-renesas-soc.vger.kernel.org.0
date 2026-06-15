Return-Path: <linux-renesas-soc+bounces-34026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RNVwHBr7L2qKLAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 15:16:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E66869C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 15:16:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=V404aCNr;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4F443012C7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96B33F39C7;
	Mon, 15 Jun 2026 13:12:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E173F39E7;
	Mon, 15 Jun 2026 13:12:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529156; cv=none; b=vDQS0HM1Axs8+Ib6f0oHH3DdsRUyaJbEqvWKqHMisL/TdA0Q8ieXbqp6PzG+bLDjwJgfqyRQvOwPP93WFchYOAcbSIXSCK6/po9U1g9P1ktVPhkY6H3+zEaM05pMpGEhGE1kqBeLyt4i3yvxwrf4mj4U85cwiJmxLtKGd9qT0bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529156; c=relaxed/simple;
	bh=/uF0APLHA6aMnb0M1XzW8idRNbCMlTaZWelbnpWF4Io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kjoo5FJA1bZqVH2+V3URBdMeVqkXhoWtylgkX70AgiZtHX3NWqSC4Px2+cxDitsNcHQs4trSRznBIxIGp9jMlxOBs6De/VDjuGbv3DWSmqOypMLfeAsOKUwSpIjyiSY5m0r3rBDm372LeRZyKXWcoR67hG0U9qdhVB3ePMbZS68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V404aCNr; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 937E1AB4;
	Mon, 15 Jun 2026 15:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781529115;
	bh=/uF0APLHA6aMnb0M1XzW8idRNbCMlTaZWelbnpWF4Io=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V404aCNrafmxbmoKXDHzz9QCQY1DY1n57+OwDoOLtq+6qg65wGA6bppg/ncr1ADHJ
	 bp/dDGqis/rLrg8pjzXMHYHe8XpWZYGn5OzT7aS6m/XIfZTXUgMcusICAL3H9e1Z+t
	 nOLAtHM+uUkmGqRJYm5QWGEqxd22e5TQD03Sy4SU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 15 Jun 2026 16:11:54 +0300
Subject: [PATCH v5 1/7] clk: renesas: r8a779g0: Add DSC clock
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-rcar-du-dsc-v5-1-aed1a28610e4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1063;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=dZH6uQVQWsB7Gxixy1guTeTNEQ4KvrhKnhcrz86t38Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqL/o2tkLgrBcRSet/lFbuq6JFOVcsM5msqcC0k
 rOxLAsXIoyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCai/6NgAKCRD6PaqMvJYe
 9QjZEACAfKeb7on6/HA7zbxpy0/z2IPbPJG5CT3MQLV/NUdhWESbE6bJ3CRHqxzwYb69u+10H2k
 uXhwbbTNdHZQWMXYvxJGHvjvgQ5jA/RcTIuMPnYKMB5Hc2ZwEdE2Cn+440xi1izEYbRc3bs52hN
 VMXuCVSQr22N2+90Y9+sm5DdADJszJ0H2V08xMeyvx4nHZb7DwHCkf8EzNlzjnUsmzWFBW4KXxX
 n2negvNnaXjHRciR0SCHx/W243uZ5/ZnLKXEC75mmir6/pHvkuN0QtLQmVhbUmG61SI2NW9Pqut
 MkoCSSXm3nJAO9zkY+vHIolZcWHh4mvJprCBuvXfBMCzZPwN7IwVr5xDIdl7ioorFtteEy0v2jF
 eY3b440T3A1F1xZ/pcjpbeG8/I916wXwFNn+Rhe0a2ziIsw7joLjtlJY9Rx6L9FHPMbfiWcUkN4
 pnCC5wgAyXpalyoduU0sokpRdwYKfufFVJpVOdX64c7pfNR2zSaRThhHtzRxZojmkJiP9p7A1Ln
 0eXVPtv9T/Prdrm9+rnYv5Mz4c3eq2nW+zWIAPrfmSZ78HHMewgMOhzgQBf0gtg8c7wZ/l8FBJ3
 2uU2dN53B82NOBLdrjcFw/dv/YNDQA48SZWW/6UoMe0M48KWPpw6Z9ti/PkLo51+vGhnHtgR+YH
 MWgLdXIoObtavLQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34026-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,glider.be:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mailbox.org:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 755E66869C5

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

Add the DSC module clock for Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 015b9773cc55..54ba76ff5ab0 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -245,6 +245,7 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("fcpvx0",	1100,	R8A779G0_CLK_S0D1_VIO),
 	DEF_MOD("fcpvx1",	1101,	R8A779G0_CLK_S0D1_VIO),
 	DEF_MOD("tsn",		2723,	R8A779G0_CLK_S0D4_HSC),
+	DEF_MOD("dsc",		2819,	R8A779G0_CLK_VIOBUSD2),
 	DEF_MOD("ssiu",		2926,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("ssi",		2927,	R8A779G0_CLK_S0D6_PER),
 };

-- 
2.43.0


