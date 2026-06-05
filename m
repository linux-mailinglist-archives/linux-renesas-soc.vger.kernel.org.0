Return-Path: <linux-renesas-soc+bounces-33619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9zH2OfXBImotdQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:32:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C31356482F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:32:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iXMcPuMo;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6803130B166E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 12:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4234DD6F5;
	Fri,  5 Jun 2026 12:20:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0E04DD6F4
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 12:20:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662059; cv=none; b=h8c1NZRZTaAhHC2twtSkYqcixr94O7haQbxscRIJ8UHgN3FqUi1ErbWO0dl1sd4uOef/kM4J9u9yUvKne7YcpXtXOal/gWO95+5wmRuiAFakz9Gj4dx7koBttJTq/alwW1fFAwgxbk8sgv35++AFt4Hia/DVj+hwgj2hFfzo2kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662059; c=relaxed/simple;
	bh=ceY3n9dzbLrF6UzskKUXhtBxJklxdTRM4gCgSQyi9G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYWnhNrjunH8TnJ9vvlTo7+GiDPMVzVEY7mH/a5rqtCoG3KQlbtXbUTXFz1LjzoVrBWjOnQVjoePtjOFS3CWpJTVz/qgDU1W90u9yYxRFBRDgLdO6N+LLSL8t7AnkLfQo2ZyRArKJ44mRbAlpI4Ra0fRLn0++gCubjQmO6yVPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXMcPuMo; arc=none smtp.client-ip=209.85.210.176
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8423610ec93so1445836b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 05:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662058; x=1781266858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRIkhCmMLekSBDwmbxb2dx0SojXZ81/d3iroLxefd9A=;
        b=iXMcPuMoXYl5EXmyoVRDxdb1Ar7YmqbkVx7ARA4mwLoLiDoF/DZSoMlNn/Maww8iZK
         J4JSlZzX8fo7GafYlV2SNshAFOZ435f22S8Iv61cLLyENFweXITtCAJF7Zc/hjQR+yvk
         M/IBGxAiiQnxdDPWkjDMSKxPtyl2SwjAT5TuUHvsmN+BEZqoFwHmaLb4X5j5BdfzOKj7
         E1OhX6Fno+aRz5Udix5HRL5aV8kk9zENN1f6xBV1lKCj5mJf3OhWin3AGwleYxi1xSdy
         khF/aGVvCSEO/bu7+u7Yhquz7Nt7tDJfls7BQulHiI7XioRCMJ9LpUWrxZI7I8YfT/Pt
         BHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662058; x=1781266858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRIkhCmMLekSBDwmbxb2dx0SojXZ81/d3iroLxefd9A=;
        b=M7T3a0MsuQAXAJCUev0K06hAM5VnQK9YWCUCJIi9fEy6A6FFdWnt99eztHpLZ/qIwl
         8tRDy5anzmgGDB2W8lALh+Exp5esK037fXAr4JjShqohxyJb82JIL9usastOe//fiHjd
         9pKk5FT2V3YRoaFafCsCY/cjLdfCINfAs0lcB+EvthUXxXeQnqzujDR6+/9or/g+dd43
         +zAtCYmHFRF8R7BvElnIQsSItJvQSDwr5arDfT6nQVtKnPImSt1fGL/K9Ax0+5ud1p4y
         LjgvNCkUiuNn+yJK7aP+O9FreQ7AJtIBc6pO3pJ7PPFDe8iFwzWCYHfloq4Y3JeUZ7OK
         0W6A==
X-Forwarded-Encrypted: i=1; AFNElJ+xepnB7t7X3fI4Da1jLmroiT0vRXlUpfTSYKIi6Plh53eUXp5pUZ4viRqWdcCZjMZFbqKRcKBh+r9saRQC8B/I7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDaQCcK95mhl8dWdPZaRCxX9d+l+D0dqI0EQF24FfgyF7IaJHK
	NteumTRc0/r1USiZzaGyZjs3QD9q/o/lM6n5ROUA092Ue/HWNsHRpz1I
X-Gm-Gg: Acq92OEjQEp0X0MdSHq4ZfKKArTDjcg+4htWlHPXKMrwJ58F8yJsocbbIgyuUkMprUT
	7UYPRADhII7YooD3aSG8AsVqOeTqW8IgMcyTethxjt6XKhJ4wygePfsuV8OgbpBZVA6N21+sSDy
	RLO46rYRO1NQwn8SCjk9WWDobqOAPHybIct22l6HQKvEPIT5DKmnu6IhuiNvOZ04eiOJPpnqOiK
	WxPdBC2G00/yo4CtfaopthXYumHSITJfMYTMWtyHXrZUsX+y7MBocfO1jd0+o0CDZo/cW++K2nH
	ULM7PfQaRxTBN+jysFGM27PSyczJoGj8WbXdwcr0g89BMMO0uGerCb/ilIQxHh8n4QRU9OZj+q2
	wsZESNcA1hpEI/p3SV1RjYOJZkiG3syhcyUNnAABsQpv/KEVfax4ZeHNrwZ460t/NjFXA+Aiji9
	fxsZhQORxK3+9lNFcKYnEMp+JUm7jFm3wgDprDU1DaCyJfVws9hVXLec9P1ipLf0s+oE6b
X-Received: by 2002:a05:6a00:1d8e:b0:842:6099:c55c with SMTP id d2e1a72fcca58-842b0d82a44mr3266499b3a.3.1780662057726;
        Fri, 05 Jun 2026 05:20:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 09/10] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
Date: Fri,  5 Jun 2026 19:19:53 +0700
Message-ID: <20260605121955.105661-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33619-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C31356482F8

From: bui duc phuc <phucduc.bui@gmail.com>

Add fsi_clk_prepare() and fsi_clk_unprepare() helpers and call them
from fsi_dai_startup() and fsi_dai_shutdown().
This ensures clk_prepare() and clk_unprepare() are executed from
sleepable contexts and keeps clocks prepared only while audio streams
are active.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - Move clock->count early return check to the beginning of 
   fsi_clk_[un]prepare() to simplify the code.

 sound/soc/renesas/fsi.c | 77 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 3f303e15e835..6537321242c0 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -294,6 +294,7 @@ struct fsi_master {
 	struct fsi_priv fsib;
 	struct clk *clk_spu;
 	const struct fsi_core *core;
+	int spu_count;
 	spinlock_t lock;
 };
 
@@ -730,6 +731,78 @@ static int fsi_clk_is_valid(struct fsi_priv *fsi)
 		fsi->clock.rate;
 }
 
+static int fsi_clk_prepare(struct fsi_priv *fsi)
+{
+	struct fsi_clk *clock = &fsi->clock;
+	struct clk *spu = fsi->master->clk_spu;
+	struct clk *xck = clock->xck;
+	struct clk *ick = clock->ick;
+	struct clk *div = clock->div;
+	int ret;
+
+	if (clock->count != 0)
+		return 0;
+
+	if (!IS_ERR_OR_NULL(spu) && fsi->master->spu_count == 0) {
+		ret = clk_prepare(spu);
+		if (ret)
+			return ret;
+	}
+
+	if (!IS_ERR_OR_NULL(xck)) {
+		ret = clk_prepare(xck);
+		if (ret)
+			goto err_spu;
+	}
+
+	if (!IS_ERR_OR_NULL(ick)) {
+		ret = clk_prepare(ick);
+		if (ret)
+			goto err_xck;
+	}
+
+	if (!IS_ERR_OR_NULL(div)) {
+		ret = clk_prepare(div);
+		if (ret)
+			goto err_ick;
+	}
+
+	return 0;
+
+err_ick:
+	clk_unprepare(ick);
+err_xck:
+	clk_unprepare(xck);
+err_spu:
+	clk_unprepare(spu);
+
+	return ret;
+}
+
+static void fsi_clk_unprepare(struct fsi_priv *fsi)
+{
+	struct fsi_clk *clock = &fsi->clock;
+	struct clk *spu = fsi->master->clk_spu;
+	struct clk *xck = clock->xck;
+	struct clk *ick = clock->ick;
+	struct clk *div = clock->div;
+
+	if (clock->count != 0)
+		return;
+
+	if (!IS_ERR_OR_NULL(div))
+		clk_unprepare(div);
+
+	if (!IS_ERR_OR_NULL(ick))
+		clk_unprepare(ick);
+
+	if (!IS_ERR_OR_NULL(xck))
+		clk_unprepare(xck);
+
+	if (!IS_ERR_OR_NULL(spu) && fsi->master->spu_count == 0)
+		clk_unprepare(spu);
+}
+
 static int fsi_clk_enable(struct device *dev,
 			  struct fsi_priv *fsi)
 {
@@ -1580,7 +1653,7 @@ static int fsi_dai_startup(struct snd_pcm_substream *substream,
 
 	fsi_clk_invalid(fsi);
 
-	return 0;
+	return fsi_clk_prepare(fsi);
 }
 
 static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
@@ -1588,6 +1661,7 @@ static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
 
+	fsi_clk_unprepare(fsi);
 	fsi_clk_invalid(fsi);
 }
 
@@ -1975,6 +2049,7 @@ static int fsi_probe(struct platform_device *pdev)
 
 	/* master setting */
 	master->core		= core;
+	master->spu_count	= 0;
 	spin_lock_init(&master->lock);
 
 	/* FSI A setting */
-- 
2.43.0


