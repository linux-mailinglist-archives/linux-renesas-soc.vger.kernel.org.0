Return-Path: <linux-renesas-soc+bounces-35118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CTT7CITjVGogggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:09:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C274B53D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:09:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=ZsZlPld2;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F8FC3037EB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E43C41C2FE;
	Mon, 13 Jul 2026 13:06:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B407241C2E4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:06:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947966; cv=none; b=TvXEcewzgtMxVMppVpmCPYq30v1/R6pGMaY7IhrN4CHmlgklchUsTPhCS/TAYGB+Kit33m+of2oxJXg6aBRhCW3KOluhXgTt77mJFUd6z+WJqynmy6bNCvulxdBzWUosnBaOLNvz8vwL7/Wa6Fpbf0i8H0Wn5XduOYZP/yP77BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947966; c=relaxed/simple;
	bh=yIpwaIQ3XL+j837k7sGNNcyGvaBkKgpHdoGUX8DP3aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MV2byj+WoHNzIs/4Xfa+12HV1tjviDANe9kgUCkVFzOBFMhem/er1WtEKgfZVjFn4IwgueJU3iarkve7B6TrqYTnpn2A4n8/NZECEdbWTWCq6Z/al6KbCAQBClu2zROdef/PxL0FxmWNPhTslIFQFjTpOTQN5APfoccU2nIq5Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZsZlPld2; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ba701891so29365725e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947963; x=1784552763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uLPM+01Tsv/yEFxBZFkTxOO3Vsml2pOVlgqkzc7WeY=;
        b=ZsZlPld2fZQbL5X/Sj/cgypz+q8pDLxHFM4dd4BU93jBdtU41UuHTcHBcqt7LEcyst
         8k2B2snI1Knl6mtmNNM1I5dbPCYNIAIw4zt3VJpgQZ8Fztl1GB1XzU6VIVWmPYcUOe/w
         qD6V8jgyAAeRRHfN6+0VTrw7tP16L8PP/yDJC8dLyBDJMtpLG3oK4qePQMjB6fvTYl4g
         Az1s1k5XJ/Qlexjh9Pc3XTiyKMQpxBaJ66zYDYQeX7s1aFgoUjWLmD5TlAUEQIb4TkQH
         JCbOTK+P7iuD6eVEgrv1UJgdt2VqZyijoHzI3G64r+NJw9h6OHGW9C0egbtIbK6gls0j
         Px2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947963; x=1784552763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0uLPM+01Tsv/yEFxBZFkTxOO3Vsml2pOVlgqkzc7WeY=;
        b=YN4/gwlka+CT0hqv+E6UMAuMjFY5u2mERX+QvJne68W+0AF8UYLIRtp5V07Pyd5OwA
         B1BNiD5sTDR/nvI8w3M9dcZo/y148ng/yCCmdQr2QP14JPR9pty9TXkpJHdUSTSfTUpS
         lbyR7JAoJJ/LXraK7mnw/iUnYqiXNKwJSQ1ugfO/XXC1gMF733KLr4fP0XY3mGV5DgVz
         fvQkE+mpipVTITsRJPw86YI/tJT24a5GXoIg3txs1d6pDRK5h7WYf+JtWVi+WEpQPC1w
         Zmtd4N014XeC//9giwh+Ycze7rZ+H01guC0hxaMoSwiH8bY/ewwi0bC7dslRNHlEQzVU
         vwQg==
X-Forwarded-Encrypted: i=1; AHgh+RqHBxZ/WfVfBaWPkP/FC0PZ0H1KvI+dsC4ipZ5750F+s9w80LN5M2XaCwI2pP1AStGm0FCJFh+TxFQ++WMIlTOP6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzWlVU4nL2r9IcsqJKpybtBjIuTUYDYnwWctHeInkkxiaGwVD6
	l8qZs8CWzYPGy0r8iO+NzYWHaehV6QjgTPXr0xwkTZozrRovXCXKyKhbgElLabS6ynE=
X-Gm-Gg: AfdE7clcqMnghtg1Plq/8/6mhfx4/PykWgwLlOJ2uP1wqNj1FdYG0Z8dIK5aGDlTinC
	1Ak1GVriHdc+REWLrifAVNHfi5o3N+PlcgKZBTNHRjkPvUSbvuh0YIJilfEIxy03sUPMXufPHST
	EARaZDahVHSEJGjivMqL/HjTqGsCmrGeBlBWIvlfj4jOOA8Msi7xCJhp1+kT7rb7DhIPPUZuGdE
	Ka8WBG7lK7qNBzzrC6JbbU4WKdIvmiBD4rn2ycEgflD8PIjEaRFYJhNha7mSeE4p4gfBxK3TRYc
	wmPv0jIPR380F/U9Byohn6/YhHZyh8VIttvhFS+ZWkEU5/yoTsY5jl8Hiy5ivagT6912BbeiWfT
	a1Oap1K8KXt5Ibfjvzt6nAl4yZo9WwZuBdr6mg+X06X8ni2TUr1B09wV3flPyP61uGpdb7O/ufI
	Ai+RSCY/o0Qk6a5HUtKP937sDnfQbmQZG8BiY+0BtTnQExOBW31ggokdoYtXuhSEq/ypPzTvs=
X-Received: by 2002:a05:600c:a40c:b0:493:ee4d:5c5d with SMTP id 5b1f17b1804b1-493f882cb8cmr64144385e9.31.1783947963058;
        Mon, 13 Jul 2026 06:06:03 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:02 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 08/17] i3c: renesas: Fix out-of-bounds access for newdevs mask
Date: Mon, 13 Jul 2026 16:05:36 +0300
Message-ID: <20260713130545.568657-9-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35118-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA0C274B53D

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

When software initiates DAA (Dynamic Address Assignment), the controller
reports the result via the NRSPQP (Normal Response Queue Port Register).
The data length field of the response descriptor, which is accessible
through the NRSPQP register, indicates the number of devices remaining
after DAA. Consequently, when the bus is empty, this field contains the
maximum number of devices supported by the controller (8 for the Renesas
I3C controller).

Adjust the condition that computes the newly discovered devices bitmask
to prevent an out-of-bounds when the I3C bus is empty.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none; this patch is new

 drivers/i3c/master/renesas-i3c.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index b9784d238f61..c459e40fd5ff 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -703,7 +703,11 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 
 	renesas_i3c_wait_xfer(i3c, xfer);
 
-	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
+	if (cmd->rx_count >= i3c->maxdevs)
+		newdevs = 0;
+	else
+		newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
+
 	newdevs &= ~olddevs;
 
 	for (pos = 0; pos < i3c->maxdevs; pos++) {
-- 
2.43.0


