Return-Path: <linux-renesas-soc+bounces-32617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL8GMnm/BWrXawIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:26:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3568E541989
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8938306B39B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 12:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65183DD846;
	Thu, 14 May 2026 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zax/BXpm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187613DB96B;
	Thu, 14 May 2026 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761528; cv=none; b=ptSkeQovQe+IvmHlstUrU5r7mU05w2EyDdLWuNjWLXqC+steQddY0vAXCKUiKTpb00+uSFEeYm8pOJ2cOe+TFFDUHNtqIR6vS5H51pcilfBEsoqOVR0teE7r4m86Aa/l9cxXuvs9IiOOW7tmzqQNBYDsZi28QYSmJcjsic7KxoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761528; c=relaxed/simple;
	bh=5x7Ln4iaXdF3MSB6XJc9r1qugg8DjCeCJV/XznDnxs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SRuJhoCe/3Zv9FSU5AOkMI9tE5v6DQbhW45ag8odkIHGqDldz7p9VLyUwKNuba74MxanXgenSxnL5ibrUECwkOYlnLiRMutAjL2AcpEWFEen6rF0A3vy0B5OFhPnYNdmgIAjyIcuK/73kljO2yrR0QANdYBOSb4d4P3nWSxML1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zax/BXpm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D39386A2;
	Thu, 14 May 2026 14:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778761515;
	bh=5x7Ln4iaXdF3MSB6XJc9r1qugg8DjCeCJV/XznDnxs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zax/BXpmaLeXEiUikrOdHMh4VY9N47K0Mz8d/oLHZ0vWjB9cmiylC9Ys1QAfsKojw
	 ou7GrBSM8FtACmGdTQfNgcoUFbxeDjDBKbbNifo4pj4b1yfh2KxM60a4hEhPW0ZRDL
	 MC8zOfHIri9l+9wCXhVE6jv5WEBV0lxxZ+MyY1tM=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 14 May 2026 15:24:53 +0300
Subject: [PATCH 1/5] clk: renesas: r8a779g0: Add DSC clock
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-rcar-du-dsc-v1-1-d65f7a9e9841@ideasonboard.com>
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
In-Reply-To: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=929;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Sa58pHpMpn9uJbYQtT/HcZDpP5JrbrhbJQzUT3AA1cQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBb8vmW+evGtl/kYSB6xA5BxW57p9X1ifdi7J8
 O0BMb6HcrGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagW/LwAKCRD6PaqMvJYe
 9cmcD/oCtz0RLJ2pDpVJ6X0zgWOqTV+8SRw1GISeOS86qVcwdwN73IUFH/GEqWbQ99JXutF38DP
 q5qXYFQbg3SagqincEas3fMJgU9rujB+DJb67qPSDvR7t/jFhLzWZ60CfyRZe7aBvoT8Z6grXts
 eOSKjz+mMBndWeJt9mm5s95JVnXYGRownvrvD8AzbQpzCH3/HCkuJmOS3ZlycpbDZjqx3Zzoca0
 AmnQkxGJp/ZtghJ40BhapVLCG/pRxm4AJgF52sLrg7Hah+c03V8sWwuFAMiSCzBaWU5m7gkLYxT
 fFzoVaAbZ1DZ9n4mlQVbhGJiv6fh5mJnGozqmxkFn/hBMoPHJgraARCrbJHc//dyb08r+awbsuc
 9oOxlwv1Lp+o7czlAkpMUop6Mg20MmO0oY6A1JfEEyCkOorhhhcW74KVs7YHMEruUTWi/94ULBa
 rtmtjsa1Jjm9+IfBor6SuRfqkaE9CaB91gdayVweko017eoToUXpZ66cgi8ETknNnh7nEVlXMhz
 g+2aXNSwGPC7IQXbejN1klvhRpHerMgfdZC5fOc11sGW6tnMX8/IqN9moOdIlnW7VvYtr/i60OV
 mmTjs0yT404sR/kiOe9E7J+7DFetd6xFagpyBE7/9NnmzQzTSx0dcbyYjraR2FR74XFE0rQezrR
 Em8ixNqXuuA+smQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 3568E541989
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32617-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,mailbox.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

Add the DSC module clock for Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
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


