Return-Path: <linux-renesas-soc+bounces-35122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X4AYIK3kVGqTggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:14:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF59A74B66E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:14:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=UMSc8UMe;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CE1032F2D85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22FB421F05;
	Mon, 13 Jul 2026 13:06:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401C0417357
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:06:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947973; cv=none; b=LIquQPhtpsrf7JkypOeFJOhTnfNDCg0kwYbIHKEkPTAGKCisl9sdurTp+0vc28RQb/Dh3ORyl3F1LL4qqDET46K2LvMZnZHfRfKF46a4jU9PFmkJaSbaYsfT89EqrpiYz/i1LSB3wYUWCn20c6yh/U4dpq7qp2P6jsr+SR6wuu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947973; c=relaxed/simple;
	bh=CFen8NGwcQPf3BtJ6W07X2sfvkGDZSaIQ+za7kgPk6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JugNXEUvHL17/suQL5lKsJ2T3BwX6acVNvUSDq30Cnp1RCfxAkOESTzglLVhkeJQ9NKC/w53t4cYE1WOecv2RGIWtH1d7N7uqVXlNGJc+vlbsF3FaSe+u0HTiVeLMzGpN/S7oVBx5pQfWGvXl/P4qZiLlKRX3yQNRxQMiOiMxHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UMSc8UMe; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1697251f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947971; x=1784552771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HxhopbMjuxZXPMIhhCmmmglOvi7gG+5T75nAj7QCOxA=;
        b=UMSc8UMesATMkzy6+5FMa8eIGb/eMmHabSQ4reBtWNhtWQUJxPJuky+Eoy/WFMxBkZ
         THpmXfp+GhvwcuZOPdZ45Rx5SFuXks52dxney8D7f9+uZdQ/GMYoM+3ti0XvHABrb24M
         CQi2pankEVB8EUk6NdnXxPKAaH7fKkfiPQrHW8/qIXlEXGdIY/H+m62OTnehU0V6OnGG
         V75VN/Dmu4pWDIMWvAiqU6Z7EYxHRg2ubP7QGXRG4GtacbuLyZf5gai41cg+UqoTexpd
         eec1Ew7s998oVzePiotvtj81BP+REnGlmg2xVF5k9ZeS6upJDyW99Tnu26IsBOJ8fTFv
         ADzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947971; x=1784552771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HxhopbMjuxZXPMIhhCmmmglOvi7gG+5T75nAj7QCOxA=;
        b=ZlyfMFd/zJQSEMT7ciHo87p+6IphUXzATGfwz79ffWfq9YDmKqhhuynkIfVT+Zzmbv
         RsWJ5MooWdBYPFDVKwuEEBbvViIuoAdKtwQMF4H7Juwe3SDtz43/OJuwmY/Ca9C3fMvD
         +CopPGNP8d51xKGGwR+o/SPoUSsOFSmRIpPu3H2j6cHRk4mSzwMzl1ETvumatlmDbOUg
         Gfsml+dg9Gj4OwUdSGeeGTVfGMRZNnrzWdNYjvm+G7epvgfRzhEd+CreWf4NBQIP4ofl
         11QdK5vxDKOWaCtjxK5ctiiz/RqASqpWb23v0GCAeqXmHJFKOqNGXqOMUqkXmTMVqDB4
         dw6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqtRtIIDtAjcZNbWLLLBzIlwIC6F54Du19y2zkuev7bK1aiTMLnUpgQsw1Ca6rK57FnKT2GzRngLLDsRVp+vBaJeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymUX0x8N82KK6yilCU8K/3WYC2usCTIRxskllc1+DewoG1vHCY
	MKp6bDSvH2BSMzcGjXaMrEVFK2lgtimpObGjpbfC4CMz+6fOwpJOGT3VmJZFehrkNUg=
X-Gm-Gg: AfdE7clM/fZ4leDCMzia2vFsbpAwit/klZaqQrMyPVLwZzKguBPRj4TyERbsp3+fVo1
	E/Ejcz39a/xLpd7kbG1IkY6gVhGk5X80bMeAY6z6GibsbRU6RAkEpICmYCaJuIoBhkGZKTyaV3e
	GZD6ma6j9a3D6kbl2+Oyy4GGlmWZmmVPW0uHOazocPT40tGbYlxzzQQxiLonlPQOWsat61KisQA
	21n2G3EQD211OYagmWv45Squw7wFD36XubjEywB0jYkfkPp7TRBp5CR1uktuMhrwA21CPZaUZyU
	ubtOW8Nuc0qK7KGPHY4Sv9fDSkNTQGBjF0CmOandJx1hKZKRRCF1nv1wsX5T66EiKAWZtO4t0Uw
	lCcZppYgaE/rhmKuutLQauEeqgCJa023eAwuAfjerRXGqitFi1XPKOXfhK3PT8Ucu+/Fkm1ZQyG
	ZQfytUgOy2aWP1AJ1inVVNrbpfQwszBV0hCN3nQU3xo/qFO4BSp1SvOr5Tym12v4f5i4OQCHQ=
X-Received: by 2002:a05:6000:2207:b0:47f:25e4:5c34 with SMTP id ffacd0b85a97d-47f2dcd79f1mr10206098f8f.29.1783947970617;
        Mon, 13 Jul 2026 06:06:10 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:10 -0700 (PDT)
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
Subject: [PATCH v5 12/17] i3c: renesas: Drop the explicit memset() call
Date: Mon, 13 Jul 2026 16:05:40 +0300
Message-ID: <20260713130545.568657-13-claudiu.beznea+renesas@tuxon.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35122-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,renesas.com:email,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF59A74B66E

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Drop the explicit memset() call on struct i3c_device_info object, as it is
already initialized at declaration through compiler initialization.

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

 drivers/i3c/master/renesas-i3c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index c1396c49f45e..52f09d966651 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -639,7 +639,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	i3c->dyn_addr = ret;
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
 
-	memset(&info, 0, sizeof(info));
 	info.dyn_addr = ret;
 	return i3c_master_set_info(&i3c->base, &info);
 }
-- 
2.43.0


