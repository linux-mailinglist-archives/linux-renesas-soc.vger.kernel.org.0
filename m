Return-Path: <linux-renesas-soc+bounces-35126-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IqQlLN/lVGrmggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35126-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:19:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2CA74B762
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:19:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=IrZoUDQg;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35126-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35126-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2600330A3B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0CA4189B3;
	Mon, 13 Jul 2026 13:06:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EE64229BB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:06:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947980; cv=none; b=ApovUZYbP5F4Jw9IMMw1Y9fzAf+ZixD7LLGCj4fC4JaUPHMKbvP4S1p46ebnhQdj446ul96uEZ1Exoga4dPLfqZsq1lZr8CYtqGcLJ6HegPY4K/wAdy/TxYVyU4WvSXEuOKRmI+hJw0BhBVDYKR/Jw5fpHOuOCj9wzDaL9y7qtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947980; c=relaxed/simple;
	bh=eA21fLaHFMO1phWAPXeRnUlodTFiwuZz9X7hmYiA+zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qKm47GnL0SgNYotRZiZLOiseYwp7gzVrwMQEQf5fd88VX1mv19ZJtmr9QLicm8Yzp0fraesRXVpfY6HHtlkhlaY0v2gjLlU8o+lKg/72VwY2uj2v/v6a8Ef7vR7vUa5gV189WjZ9vJ8W7hqHfkDghYrgjJ90yEwWdwAssYSbXZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IrZoUDQg; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so19567185e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947977; x=1784552777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZ4HI810hrTy7wdk8GAVxIAfJZWowAHqKrnu4cWL3zY=;
        b=IrZoUDQgIAwd24s6jt5oSUjDQg832lwXVslSjCjabZfMcFas9XkuUw6WEX0gw1Xqog
         XweBl2qQY6G/R/nXW4I9BBd/iiNB53GhNXBH8eWUMhmRcdCCxVwVksrkLGYbcT0waZn7
         meqZzf4m5jA+3Si4mt5zN4p91qAkudorYJREybi5IPqh+L7s+jGikhZ2A/QpY5FF/bTs
         bbTs8McILdQ/BSNsQsdzcZSXwtnnq3jV85onNf9QsYbwS+9oC2MWSMwp4p+qttJxqFMb
         f5D4vonRqUx4Fwb5KoocUq/YcoU2Y5nuUV4f/UiLVSc+OjIGUNzXtasZVFwTdHaRkiY/
         UrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947977; x=1784552777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZ4HI810hrTy7wdk8GAVxIAfJZWowAHqKrnu4cWL3zY=;
        b=GVuzfIjAqy71W18lmdh4ijAq0n6FcKF/SS9qXQVKI2VK1fIuIqx/gKqA9NwQW1jbdE
         GOi5xS9zE6bRTO1toGarGP3LSqowFzkKkPTxlZx5YRc6Em6ZyiFvkv2aoMRc27HUNl2a
         HTX2BkAOimb1IwSFy242BoWgkw1mbI+84JSjjpujK4kYHOqA3nvxqm9lk3wC2eTRboBR
         nxDGQ3TicjWtcnEXhVIRcbxv+ARC7wSBtA+OBYCA7OAenxd/gKUttEg9hxwPm2lTfQl1
         rPCw9z1QbrDWasdrjBKFndwqzggYC5szknhf4aX/YO85SN7DGkyNuvLl6zVeuYqh2wmP
         WKHA==
X-Forwarded-Encrypted: i=1; AHgh+Ro47kCkXNyCYfTvj1c1N68uPjRkikNGK0D6MxQQz8G+Wu1lyez3TfjB3BJdszfbigt//Hb1DNHpGMVMHq3GiSufIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zaSqaaVG9TVA+rgOhDHVFn353wxEj9PPjgdbyG+UZ5ezTIZJ
	ajcURl+z3sIgWQ5CSpCl2TbZn0bYDB1zzUOG1j76Y20wE5zVoFKIUuxpbLXMZZVi0kQ=
X-Gm-Gg: AfdE7cm5XAnV90oKk8Ggbao8zFiOX7LP7/jiH4In/tuHlb+F4hK2adjcS6+6oaBnsHt
	pNeIctILhJIuAdr6szRgu+QbzJ4j9NCerQGp8+VLpJQ+8S8JToIH6bq99tYBNHJNhLGz5nxpnfV
	D3enwMluccf3K5ZxfzX8ujCU78ZiEClNr4TGkrBxytWWgds141KIZjtvdojXsu9aYXakMlCspSd
	nXPb/MJIbQMTMz+E3zVsaDQH+asbMaJnGJ4GpVkPuput4R55m8TZhXZ+5RSGnT+qkL9A4PubfNl
	n7oLcUfqFKxzCvnzrhiQQ+2vCeLX/gIF/5fJrH3PExqYuFTrh1N8XAffHlfOy6r/IhzxrNP0h9w
	TOgeHturvZhy6VKWfmNB6ipzVbSAI1xKIGMKcADxkKUgzREUvsUsceDciOvybVFJAkFzp+qF10h
	dPP8wz8YNQXua6lyztJBvX5tq69fqzKj2YOIbgh2d+AtzHafuyrwUWrnAUvbxF9MmdIhHUmto=
X-Received: by 2002:a05:600c:5487:b0:493:f534:3e73 with SMTP id 5b1f17b1804b1-493f87e6c80mr95247815e9.9.1783947977232;
        Mon, 13 Jul 2026 06:06:17 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:16 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 16/17] i3c: renesas: Drop unnecessary tab
Date: Mon, 13 Jul 2026 16:05:44 +0300
Message-ID: <20260713130545.568657-17-claudiu.beznea+renesas@tuxon.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35126-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A2CA74B762

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove an unnecessary tab to make the code cleaner.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index f28e260dd166..378baac71aef 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -109,7 +109,7 @@
 #define  NCMDQP_DATA_LENGTH(x)	FIELD_PREP(GENMASK(31, 16), x)
 
 #define NRSPQP			0x154 /* Normal Respone Queue */
-#define  NRSPQP_NO_ERROR			0
+#define  NRSPQP_NO_ERROR		0
 #define  NRSPQP_ERROR_CRC		1
 #define  NRSPQP_ERROR_PARITY		2
 #define  NRSPQP_ERROR_FRAME		3
-- 
2.43.0


