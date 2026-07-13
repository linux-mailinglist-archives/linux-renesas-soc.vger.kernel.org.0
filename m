Return-Path: <linux-renesas-soc+bounces-35115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uSQDMU7jVGoSggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:08:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A0B74B505
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:08:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=EM5whsZz;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C2D43029CE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C8541734F;
	Mon, 13 Jul 2026 13:06:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A967E4189AA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:05:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947961; cv=none; b=Bsxb6nAMkcISLlz/3+90FYnDhSAXV+oYnipkKiAkIZnLXJzGMBBTXcrHdI/WGT4uffPHLiEuU4OLjow4LIR+xURhBlaY6IwH/MaCzJpgd2cluyZ9FyF0MrMvAJOgKRrOdYbwXoenluCzBEpNSg2ZhRX2XxLTU/oSjps+Awypxfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947961; c=relaxed/simple;
	bh=P6aF/BzzUSeDLiv0rHRqB287uvz592GL/Gcl7iDIHpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFx8/J/OsltAK5SKZKH3tW4gdpoueGeLqjocpL4IBKFbJTkrEan8NBHl8rXE9YBGfoRxJWLTFi0MbfwA7ZLvw2Xp6K6muuY85jzlDf44XmQpEYDxAsJMFXFHBVCKISOKAJPpFqTHpgYw3iYtEcJ08qTneV3TLbtiBwpnOEAIeeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EM5whsZz; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-474560436c3so2393849f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947958; x=1784552758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAq3iUlWeKBxi9BzVp2LKHNg5+ivMc/cKZSPqbSeCas=;
        b=EM5whsZz3dG6kBBlgx903lUYLl7DcMbcZFFI39sBBEfqx+ZfK3WxpRhDaxcxF50CfZ
         aOTDATVfViHvCMQOv50h2B3f7hIJjFqlpm5jtl1XJMgYtAN1RH+dPALmsCStkTvdGnAq
         g1GnIXahKJNQwx4h9iukgzcJB9DLpKqs76UKg5PNr9ssQl+1PZwwy6Mo2Hc7414r+jtN
         UFiPZzku2zIJX1A35ka51OUPVNN0uY/yCdpg6ybdk6Nk1PvxlMPY86X4doK8PbGb9z5r
         IgoOSgxt1GAYw8pyJ6aLUbBoI/dZgkx0Gu/2HtvCsfNEGE6HSc/6b7Kahri5CurKs0tK
         AOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947958; x=1784552758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAq3iUlWeKBxi9BzVp2LKHNg5+ivMc/cKZSPqbSeCas=;
        b=ngEjNtvhc/fp75zZhevuHg+FEQQDfuPCQS+dGvosqcrne5xj8EV/3C7inQ8eEak/mx
         s8cDobd7WghZQEQy+87yRffWk3rxluymXrk7XPHdZ6zwkPfoF5QREDXX5weJ/GCpC9gG
         3BKbkZp3mM81iDusmR/Oe654zNlK4FVEIePTEf+ax6WL2jQHKvMoWrv7fLTA015iU//6
         44rzaenNrInAdS/2Ok77/LYFlrRbej8nMxc4i0RHObQj+193wASaRSxYVMuzzAFlQFSU
         dGm9KAEDeYAEqIWnLiuMxU8S2QLTfEPO3zEM9SnjJCb4NzAuBo6/YGc0XsWWxOAtKIIZ
         K7vw==
X-Forwarded-Encrypted: i=1; AHgh+Rpgr+Ugk58Rm4I/unUddRYvuSwlDgi6KjKEgi4vob22rKMbqp4P5dv7jNWa94QBrScI67kwh0vodighXc89vOfTfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV1vCtG5U8QEL20rOJ4qY1u524ISOku6WWNQ5EvsdXVsn0WrlW
	6SiPx1vBzCH7TMG/65Wf9fVlzIHIAI4AVBrtbQykCcX9SchoBdfgDa2oPdWpb+1gk3E=
X-Gm-Gg: AfdE7cmiXuZ1WDd9MbSEzhvXu61jYt9tYtCm+734PPYKgfcJ83amfh3i6QvWT0VnF8p
	sv7a6vtMRwOcvnirChgeBYRKnUu2VYP6mUfgy8zzvr12woU6/PvUocgW3GAsrVuhuJtYJdpw/Zp
	neRFJTLEEHDhdI4b20rLijceVlDRhTWXJ1BfcrmOMX9vPXhIOtPspIf6W8dzfVf+UiET5OsPMmQ
	jb1EIYc3l8QDOfh8Puao5qqQWxD8cf6MY+9tfwTURqVVydjMBeVzJB8x+GpF3W7Y+V8IbLwY6jH
	rK2PdKs2RHIozczyYLpXMYSVknGvh6pu8AsYo6XxdbAVfY3O7aIW7YrCRRj6Vf6dRH0qYa20oDM
	U8fkSi9jt4pGC8twY6Z2Vo/NrF2SjTt5a0DQe6soiA15zpbYMAqcPwcJ02ixkhijNQTp2zS36dc
	4lX3S9cJLWp0qf/JwRtyEWglSB3W+wvTul2EA5KdXeOVuR3FjN3Lu32vO+/FSqJiuIJoypsDNgz
	UYo0R7I0A==
X-Received: by 2002:a05:6000:2510:b0:473:1ccc:15c9 with SMTP id ffacd0b85a97d-47f2dd04861mr10170497f8f.40.1783947958166;
        Mon, 13 Jul 2026 06:05:58 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:57 -0700 (PDT)
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
Subject: [PATCH v5 05/17] i3c: renesas: Reset the controller on resume
Date: Mon, 13 Jul 2026 16:05:33 +0300
Message-ID: <20260713130545.568657-6-claudiu.beznea+renesas@tuxon.dev>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35115-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59A0B74B505

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reset the controller on resume after enabling the clocks to follow the
same sequence as in probe and avoid potential ordering related failures.

With it, renesas_i3c_reset() was updated to use read_poll_timeout_atomic(),
as the driver's resume callback is executed during the noirq phase of
resume, where interrupts are disabled.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- replaced the read_poll_timeout() in renesas_i3c_reset() with
  read_poll_timeout_atomic() as the renesas_i3c_reset() is called
  in noirq phase of the suspend/resume; updated the patch description
  to reflect that
- collected Frank's tag. Frank, please let me know if this should be
  dropped. Thanks!

 drivers/i3c/master/renesas-i3c.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 517ac2df9bd4..6590da962592 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -495,8 +495,8 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
 	renesas_writel(i3c->regs, BCTL, 0);
 	renesas_set_bit(i3c->regs, RSTCTL, RSTCTL_RI3CRST);
 
-	return read_poll_timeout(renesas_readl, val, !(val & RSTCTL_RI3CRST),
-				 0, 1000, false, i3c->regs, RSTCTL);
+	return read_poll_timeout_atomic(renesas_readl, val, !(val & RSTCTL_RI3CRST),
+					0, 1000, false, i3c->regs, RSTCTL);
 }
 
 static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
@@ -1483,6 +1483,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 	if (ret)
 		goto err_presetn;
 
+	ret = renesas_i3c_reset(i3c);
+	if (ret)
+		goto err_clks_disable;
+
 	/* Re-store I3C registers value. */
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
 	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
@@ -1502,6 +1506,8 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 
 	return 0;
 
+err_clks_disable:
+	clk_bulk_disable(i3c->num_clks, i3c->clks);
 err_presetn:
 	reset_control_assert(i3c->presetn);
 err_tresetn:
-- 
2.43.0


