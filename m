Return-Path: <linux-renesas-soc+bounces-35117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eVn2BrvkVGqYggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:14:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EA674B681
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:14:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=CIWD6zmV;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0365316B41B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B571641C2E8;
	Mon, 13 Jul 2026 13:06:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EC8419303
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:06:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947964; cv=none; b=W7Cr04/WQHjkHos41MxHhBprTUbb/Lz+UML0oIS+y8Loql/1Ap0MAJznYybfXhXFXqqQwohMmsrBUxLUO1z+Xw67bxy8/AVmc/bae9d4ggasp2WC0C4CDLfeR6485A+ifAg63YMHmwipevIzztCj3izMd58sTtWstZtZZP+nvN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947964; c=relaxed/simple;
	bh=XVXaVxL+lneg9duu/TbnwymCvCWqh29aY5BS/FFAisE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQ41umnD/r2njXPwFaKGggLyA2dinNKCyzqzjw9gUi+UE3vu/Gxp/zY3lpJLU1NwKg+Cm/9ULATECuYbe2yZldC2D++HgSGvxeoCeQCcOSLZtwbLNDtbRwn5C06Exj18aK6jbLNEl/rHvwxwnWHDycA4qBTkAYlNEnokd18wloQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CIWD6zmV; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f36a122fdso1138051f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947961; x=1784552761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/juGqGDG2fLncz3tYXEPSwjfCpIrvLGtrL87h0T1kX4=;
        b=CIWD6zmVa0Abt3Fdzj1f8mK8xPKZMMKJRQc41pzVrxAKy/2xzmPq4/WJN1721yPSj9
         DyJqW9Wo/mgzQBLVGztQjmFpseUTXOk6HC4SnWGfJ8YIk5Jh6eSKufF1CaCTsdChvaXm
         tO0SvuWoIAbOsxDAkPMsw5U0AX1aAAWg5WX1VdHkKtjGTuiUkaIhVdWsE/7CW56G7gn4
         FrV40LU9QqITXqgRH8xr13ulyIHd8CR5kOAG6pSp0WqjgT78hAWvCFd14GvI5SN70aYx
         qjw1Odtk0Xw8jYHMnbXyqaV6ejTh/8qgg9uUQNVVweztwIgGtgf2z74kiYesnw5iqZqz
         MFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947961; x=1784552761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/juGqGDG2fLncz3tYXEPSwjfCpIrvLGtrL87h0T1kX4=;
        b=GBaV8Xqna4acgatSkIAN23sUINssLpehFzrntcswZRSytwJGpyEVmFLmED3PCMYO8v
         KzUySo7l9arVELP2gi1+zSvZD8wwb7D+VUuqsvB+u0FzsjwsTtIv7J66WdpksMEJlp1l
         1Kj0Nh4/rG0pGbUgynjnToczCCkzWPa/cWbBYHSAFcakT2zABIZ7cvX+5iuuNwIbdjfw
         xoAYGpkT6lzGAB3HmSji4rmLSAfVcGlGIoPjylTl5hj1PwO4mEHI9s7w+0IJXxtZmQYt
         5lDKjlAN00+KNraYHhsjHG8I9p3xiUPkw6pRzVzfle++3mceGYgm56bih2jugwyMKLTk
         gxWw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6RSXP9YI59F02tPzEXaJ+jsuN0Mp02MwGtzxxMtyKNM37NdT5gpzo0xLDdHvLbt/WVEmEIz9QggAyj4ta3F1V7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIPE0v7U1AEk8eLZqrAlSJiejBye6DDOceKeh5Lcm0DhqxDGAw
	U9B26gW3xvOY17mrq+f5xUxwyesZIUJvUZfNfn1+cKsj35obfmFC2LFvtVuaFt2X87E=
X-Gm-Gg: AfdE7cmuy/6j6trAP4WVDQkrBT5XSOVF+fiXH8mdH/ppNa/H+c2X/Ek94o3DXLNnPOx
	Ffy9pEZXLvnP5tGUqPE9ov1/+en2Q7uIjkyREz2AVxn3d3CYEGfHYC6nu1/P+V63NkJiRo1QUrp
	5wOIJOsjjwGnq6xKIaf/SHTooULhcED2wU2/Qh1jmQAu1+/B3lf9qntJ5ya38rLWvpJzGm294sP
	1rBcYeJP11ELWX4tlS68pUfxKmJbBYYc7l9PX6y7VtE+pcpxphya4G/o6laInLOhgrOxEalcgeX
	0L9XipUp/R3G1LuP9A/9QQO8Msp7kGhFVlO2BA7m6yuWmjYpvna1AZPPvn37W/qmzbpMwfrTZzp
	W7x8b+vuv9hAYLZAloC0uAXc9AX9CKleYHTOweYgVbEzbqj41/RuCFd2f5ktarE1rq8EM+4Czxl
	uY18O6xElprzLlUYDXlifeZ3SIag9obDdHPUzeiobOSVXQiOh+je9Tew/eOZigpw6E1lhSreA=
X-Received: by 2002:a05:6000:4b01:b0:475:f100:35fa with SMTP id ffacd0b85a97d-47f2dd439ebmr9925829f8f.55.1783947961456;
        Mon, 13 Jul 2026 06:06:01 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:00 -0700 (PDT)
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
Subject: [PATCH v5 07/17] i3c: renesas: Clean DATBAS register on detach
Date: Mon, 13 Jul 2026 16:05:35 +0300
Message-ID: <20260713130545.568657-8-claudiu.beznea+renesas@tuxon.dev>
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
	TAGGED_FROM(0.00)[bounces-35117-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,nxp.com:email,vger.kernel.org:from_smtp,tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73EA674B681

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The controller uses DATBAS registers on TX/RX logic. Clean the DATBAS
register for the detached I3C device to avoid issues.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
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

 drivers/i3c/master/renesas-i3c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index acc30ed615ab..b9784d238f61 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -935,6 +935,8 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 
+	renesas_writel(i3c->regs, DATBAS(data->index), 0);
+
 	i3c_dev_set_master_data(dev, NULL);
 	i3c->addrs[data->index] = 0;
 	i3c->free_pos |= BIT(data->index);
-- 
2.43.0


