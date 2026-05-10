Return-Path: <linux-renesas-soc+bounces-32319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ah4GW5FAGqgFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:44:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBE5503270
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B5973005321
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 08:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33A336C0CD;
	Sun, 10 May 2026 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZyifJGD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31A335E953
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402653; cv=none; b=BQFbpHSrZwr9i/nE/mhdyrfgBldelXU2+fFGjcj//a742IETUcIoB7+Eb4Od33yOUAGC6aT7gbvo7vH5LkMiELI1M5OMNBRPZ98ZKPKsRtOfEoDMEnaD/WTsEcESekvi67+ovT+rYC2zZK3n+DYgWlVmi8dv0nmtFxgL/cIctEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402653; c=relaxed/simple;
	bh=WeUvgemHKksYGxuMitCOutRZJO5PJ2Fdf4PAHkwxyB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YI5kAkfav6vskfLtQIE7g9RSAy9gO9DPVfX1aRk9xbby5D7qnCLWatLaeebYCMFxIq0ndgYdxLdx0keVUhmEhhwXrKaGnk68eAdJ4iDBXzNltjNmxK3VF9KAlFe1xDz31hGGrZeZ2usJp3fwwcSuTkbh1w/Ym4trJrLasTt3LNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZyifJGD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2baca78cfaaso22586255ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402652; x=1779007452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0p1tPnU7aXFXjhJ/ud9Kouh0tfwhorNg//3KttLCIYI=;
        b=HZyifJGD9IOKnXSX4fE+LNsAdDTtrnuqXz6JnZkRem8eFk8mbjerQ5GKsi09JZQWdZ
         UaMdqGWfvGmRgum9ZSk4qtC3SH5uV5cdjy430K6euFdGdVgLQPdDE1rHMCoU9NLIzo/L
         FtzcQbvEncdyTnMEPRlPwlUCo+3H+GU4yKylvQXxFM8iL/IyYaAXN71aOjyfU6+OkK57
         mFuXnCpdVQPOsIYD5REEma4a5Wn8CH1kYr80zPvLwnINVrfQA2oapUR59H6S1dOllUIo
         cZfHBMD16qt+Anc9chwzwr1dxcrnb9FMByoEZDTszSeDqNae/vEd5ZXNaANJ5p79gLzg
         2Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402652; x=1779007452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0p1tPnU7aXFXjhJ/ud9Kouh0tfwhorNg//3KttLCIYI=;
        b=cq0RW/YRGp4Vf1LSRA95Q3Z25snKclgLhEkr+5pb2Raj2zNfeax3z6OrXdn1RrFxAy
         /+Q9SBxfQfyAYSv+L28QJXntURA3E3Btcxr/oIajv4XWwjEa7btc907tmL7p7zzJ6836
         +Qth3Ml/3wOF1LyWPXcg7XGrz2ReTfntVMacqjbDELSdlw/zbPO+W65T9QHtBukjPO6Q
         u4aUgzMHXqmPh1mTn7R1XxnlMWcPE0iMSvU0alM8YnlSY01bXPe4SorgD9XjZR8a4Iae
         wlus9PfHK2VNO7jug6V6xMLI3OijMkXAJX6hj7/Fsq4xn8nM4xA1qzHG+5mRS3Q54psL
         I7FA==
X-Forwarded-Encrypted: i=1; AFNElJ/HZkOBYBDAGkoMPtIqG8UOZbfi62tyvexRzeDS6gDRjx4fF98rsAVMGkia9bJnZsYHsseHILuzVgp6mZGgx1m3GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWbqYUZltUzfVvMWRMasmmzBs2/f2U3U7gtSriC/7wXlHJUuW7
	4T1rNWKuhEJkaOwUigeeAaUh+P53u7aUsooX2cxRagmZ6fekJBg+qErI
X-Gm-Gg: Acq92OFavbxTSceRLnjoeg0uJIWSrhEZXFDM6O99VqCjLIO3mhwIUupmUhebKo/M9xJ
	IZeQsmLOTe52YfSS4cKvl6UMUlKPkdMeCIQoZDm3XdDGa4h2T7aj+j2SmGw27dwO1PR1pm0c1dT
	2iiFONmPp6Hx0pTvyh+Pyi8dMBnKba81TtiL8/shzuwlEbC765pALkliRq4oGFubP1tuL0Yn5pt
	eaV2kgwZeS2jVe8FR740HieIhZeTBBpK/TBt1RJymDifCptL03zydmwS7FDyhRCS4xzpXG0MpEg
	N5PRuX/N43qdt5+/oScTxYYhN8AaZoRDhPojxVwh/6NBI7+HgY9yGB0ZXHsAnKKu+JnHd0Kdvtm
	aIV3NuUTNG3iumubf9rFWJOF1RNkGuhEwZemGVsWuNMihzTz16Y435UuJW8iq3WEhbx5ZB+GJDM
	KENWdFlNYo5jDq0aYwuMZeYh76Xm1JmGgRhcHrKeKITw4aLOJF2EpOyJqP+l7Ll4eSMf6+
X-Received: by 2002:a17:903:2904:b0:2ba:85:5827 with SMTP id d9443c01a7336-2ba798d3e99mr143113545ad.26.1778402652107;
        Sun, 10 May 2026 01:44:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 06/10] ASoC: renesas: fsi: Add shared SPU clock support
Date: Sun, 10 May 2026 15:42:59 +0700
Message-ID: <20260510084303.122426-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6DBE5503270
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-32319-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Add SPU clock pointer and reference count for shared FSIA/FSIB usage,
and initialize it in fsi_probe().

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 06ec5709216b..55a11f1fe8aa 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -295,7 +295,9 @@ struct fsi_master {
 	void __iomem *base;
 	struct fsi_priv fsia;
 	struct fsi_priv fsib;
+	struct clk *clk_spu;
 	const struct fsi_core *core;
+	int spu_count;
 	spinlock_t lock;
 };
 
@@ -1984,6 +1986,7 @@ static int fsi_probe(struct platform_device *pdev)
 
 	/* master setting */
 	master->core		= core;
+	master->spu_count	= 0;
 	spin_lock_init(&master->lock);
 
 	/* FSI A setting */
-- 
2.43.0


