Return-Path: <linux-renesas-soc+bounces-35114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xLg6NXHkVGqFggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:13:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 331D574B63F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:13:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=PoAMaJiA;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9051E314E0E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A39416CEF;
	Mon, 13 Jul 2026 13:06:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAC1417360
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:05:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947960; cv=none; b=gZFwzJ9P4eGuUQIvBiG6MW+0+/F3BQoGSSR2LYUPW68Gn91ieWkw9pCtO3bjF8YgtMAI7815aawxA6J/UTTuZhAATpB4wAKNQ3po40hhbxVvxr80Hp86pWUe+V/IzBK6hwAK6MYlQus5U5QySmFmCZRynLAUZm6E5AhSx7noQl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947960; c=relaxed/simple;
	bh=FJSjIhSdTIDlboDC85YK/17wAGiKxAM9/NtAhKhzYOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cinsuk8psxnIedzxHnKliBfIpRh58YIFsHCEOpzs69iCaFgtmJdC/yUnZKIyAqPnmT886PcuboL3AP8tgjxAAknQsdOPIeeOcZAn6AZeIYjuEbUS8SA2vWLc+LEJ6aM8yGUGZQ+FA5IxRH0s8yMfZFBW+zFSU3y22Je85daY2Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PoAMaJiA; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso24852705e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947956; x=1784552756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSMCQsQ7LVIlHm1OHZIZQGorFPeOXnJuXX7KCA2GxmU=;
        b=PoAMaJiAaMEVZ5sGtDrDBGdTzXFOfQjetj+8ZKYc024V1joDJeiWyKI3Rk6jcm867m
         YYchtMJQnk4UJ94YlmvhC3GeVyJNzBl2tyxsxmpYIbuk+f6gVjlex+PO+DUKTGdJSDKk
         CS1Vs36rVSMqsLzlmWIf6rQEmOY1ozL4w7OCQj3DStXN0uo+4KLqdMt1SsdYsMwl8DIS
         20zjKXBTXRrRCDN4X9LrNzL6/jbvGKYzfTuNHPC28v5Jp6FnihvJToXSkY+iZDlQowlY
         y62ssLDBwjF7Ojew1HazrfN0oXDpjQKyJcYM8w2ld6NrmUaKZcD8Gad9ObotqJpV0zye
         ragw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947956; x=1784552756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSMCQsQ7LVIlHm1OHZIZQGorFPeOXnJuXX7KCA2GxmU=;
        b=iY4+3l2cgSZnDv2JIMvMe02r/SvobCKsE/L3BbdORZ3UCP6Fnhw12UILWT2V/wgSRG
         qn4kapwzsnGwt7te9iXXSk6/wZq0tRoPg/PpDf+rWZtSrJN15kgDSmADfys8bYXWnEmP
         LgrvitCT45afVsPXuZvwQx9Fawf0V0Zlv8cqwh8hH4tRKzirdGaamlJqbCOx1c6W6x3z
         /F6eeKdurYyaaHQXeIAja6BQW7uh0styyVC7rZr3TtCDOjn0/rCblEPJuJYe6cs/YV5w
         M3Q5UgMcQvnfU/c0vCJ5sqeVDNZ0vkFGZw1QvX5xstUCMn8/EOE6hiPV7b794OKolmSS
         n4Dw==
X-Forwarded-Encrypted: i=1; AHgh+RrcxUBLXet0ipzVUahh2aH2M5rha60znrmRlHi2Boxm4o0tDqsMJ59266xFqhAAPQmLlpeIBLaCfFk+hd4fDQju9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrLinX8fy9M6/Pk2T6d7ypeztSzbE6XsNmqS+Kv4NhDfg6XFIu
	tCkPtC/TXH9mSbbUveLivHj6ehd9UHWGtYqN+Eg3z3gH3+a5rs9B7+YlDj6odNDzDYc=
X-Gm-Gg: AfdE7ckHDJnjNDoINrWWqunbgJ3n7FbTQoDPpEIWnysH8bIJQ0NNUKfLj7V9SthkwcO
	rPaIrJnD8IqzwYnqup2zmTprbaTL2KG3SA+Jb3MhGZr3w/VMpwTtzFET95RV/w30KGFmuPyEUNg
	K7q8SBalGQBVGS/L7Zj5kynev5buaUDXcpDi4fo8t2heM/MZkj6G9/VloS+8X0370MJMDzWZ7d7
	heqcyNletnZzOQTmmo76e+HMKiJPZZRctKias/Z/fNTsqBqTgkM87ukjgZCqxy9TAWN3XihK5ac
	j+vzVInsBwU8C1CAKpBRclNnITc7el3fXBL2jOrBFNRrL5iZamTjC8RpHtxyy4+dZVfv9xNwxOO
	KepA4wYNt10S1lceyfM1HzGmJPukInFazTrr9HS/Mp2lZVj03nsG+9I7eA+p/FEbS6rYx5Bm6wC
	pkHFVw+sJFA1/QEGsa5lAdP96b5OewTEkD1mCcf5ASlu7Fhl9QTgQfP3n38DiNM9q1LyZ7mWo=
X-Received: by 2002:a05:600c:1d06:b0:494:6baa:ccef with SMTP id 5b1f17b1804b1-4946baacd33mr10753825e9.11.1783947956381;
        Mon, 13 Jul 2026 06:05:56 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:55 -0700 (PDT)
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
Subject: [PATCH v5 04/17] i3c: renesas: Reconfigure the DATBAS register on re-attach
Date: Mon, 13 Jul 2026 16:05:32 +0300
Message-ID: <20260713130545.568657-5-claudiu.beznea+renesas@tuxon.dev>
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
	TAGGED_FROM(0.00)[bounces-35114-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,nxp.com:email,renesas.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 331D574B63F

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

During re-attach, the device may change its position in the i3c->addrs[]
array. As a result, it may use a different Device Address Table Basic
Register (DATBAS), which needs to be reconfigured.

Reconfigure the DATBAS register on re-attach. Along with it update
software caches.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- use "data->index > pos" condition

Changes in v3:
- collected tags

Changes in v2:
- dropped the "if (pos < 0)" check in renesas_i3c_reattach_i3c_dev() to allow
  re-attaching in case of a full bus; along with it the condition to update
  the DATBAS register and software caches was updated to
  if (data->index != pos && pos >= 0)
- adjusted the patch title

 drivers/i3c/master/renesas-i3c.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index ccf55afcdedc..517ac2df9bd4 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -907,10 +907,26 @@ static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	int pos;
+
+	pos = renesas_i3c_get_free_pos(i3c);
+
+	if (data->index > pos && pos >= 0) {
+		renesas_writel(i3c->regs, DATBAS(data->index), 0);
+		i3c->addrs[data->index] = 0;
+		i3c->free_pos |= BIT(data->index);
+
+		data->index = pos;
+		i3c->free_pos &= ~BIT(data->index);
+	}
 
 	i3c->addrs[data->index] = dev->info.dyn_addr ? dev->info.dyn_addr :
 							dev->info.static_addr;
 
+	renesas_writel(i3c->regs, DATBAS(data->index),
+		       DATBAS_DVSTAD(dev->info.static_addr) |
+		       datbas_dvdyad_with_parity(i3c->addrs[data->index]));
+
 	return 0;
 }
 
-- 
2.43.0


