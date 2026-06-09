Return-Path: <linux-renesas-soc+bounces-33727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dG9KHMdtJ2o8wgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:35:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 079ED65BA9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:35:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HQJu+c9F;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E4011305EB2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 01:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F5234388D;
	Tue,  9 Jun 2026 01:32:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A234F345CA3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 01:32:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968737; cv=none; b=Jp65rQLZqmzw3XPuVpS65Uzss+rNsnRaJkXUxDw7RaG0os5i8VtOTXsJAxihMs2/3YGwrIKuu/8vXOwC+OnRcJkDhYveDvBw8j3OMfYuhM47QMzjvLZItX2kliJ16FCdBpHApywOAuK89oaQJhslLlgdzhhK0es/eWIndjbBEWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968737; c=relaxed/simple;
	bh=FRuIe996eKvxY8l0bKGRUk8hVAskBRiNmK3+CXj26cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKMqJFm3hmOG6Xc1G4sN2gS1jwHWe0Z7EGa5b8HH9GAdY6vI0JjpRSn7LJPh1X9fdltn0aym+DLV+cIAOoFxEedtzf1T1Q/nGG0VwJVe7HRRn6Kh9LwerUlrimo6DLDf6QjcA0ucGIhHi11+7fjVwtiHNB7KaqjNaXIZn7AbMG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQJu+c9F; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf2247e38eso51281715ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 18:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968734; x=1781573534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRUk5lBBY750n5StT+TrvtjJM6eotrKNm2nySlVxLJg=;
        b=HQJu+c9F0jqhnbaje+hTuaxEICL+AUItZB22sMHGOCjCyfJS/qDqnQIGmcczVB12lp
         AJxpnjvh6Tbp5q3X/lcph/oaP3Winn0sQAzbU8KwIzCJdRkcROd5GBFmmHBrN80xIZdl
         hi6OOljz9UYHSS8sixCtV4gnbbw04YYe2uGms2IxOsaUzXnRzy4D8VcpnrPE+g2OY0VD
         bf9mt40AOzzAOu47a7QYvMa5nA8GdVhQMBkhvLfAZM8BmUwOmRXNIcb23d6VMcnYPkr2
         YMIgXglbh3R3k8idyRkcYsje3WggxRMIZvZ7RsAXwolfgw1WqETMCGFlkmEegBaD3j+p
         djlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968734; x=1781573534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JRUk5lBBY750n5StT+TrvtjJM6eotrKNm2nySlVxLJg=;
        b=l97nZW4S/fBCBD42Kjc3Xdz4RaRvq4oR4BfVfZbfcCiNZi6xgvyCUMXbb8L2EadKUY
         fQ0oBOhSAvgU6jb/fZgptU1Ci/hhYaL4nqYxwl1eTiBs15P7jMUqYz6eBe+tq42igSWI
         doMUtIIjFF9m/5RzTMWV6p2G4WSE461gm22vGRugZVao62me5v0cl542UyjeXjFvVe+i
         D0tfusueBS5px7mTOTo4evXdgwivJTRCU/Jly2kuT181tmPTemxbGRWJiShSvROPUPHA
         cGFIUow3/j5td3KPL3F3yQ0gPR3AXR0xQ3+AQBNQUsKxFzDBFqk9CsZdM8rpWnTTYiUr
         KVgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ukrRuuGvkkXaA+/CFUHaUMpD3+51qGgupLbTLEA7XSgFoM4IJ+zQPtCgIrVDqlA6Wx3H1DdL3MqFju+9xBq25Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOqChhYPLMJ/dsAK9L3AkpDy6IbqwTzFTIQvwwM1ROcI2MVZQ0
	fn9WAhn9c0eCzo461ybtmV0lHz/gFBsN7gTiI/4ETRtQuXaSjvbpdUgw
X-Gm-Gg: Acq92OEJxZMFD4sdhTld3PPcHMkY5k0YZbsO2ZZqil/dI2GMYWTvWCwLihwbIpwp+hQ
	6/iHUIVRmTzXfGwXq8maV2/0PEG97htjZiZug+WK1zceWrieGG7oZpak/ZYUaMRy/TVVN/JNagi
	0/SYFMvfuolKpxXNLEeR1OvkCL+hUsTBW8N7AmuRWEzQ5uXxh1J00cBCi6YXQdawv6u7GB1EOoh
	bJusHZKc9lUykm3rD48FJ7bZ9YGe03BFKlRU+9Zsr/5vkqKTnSh3/44OwPA9VS/aIhKjGt0JDdR
	Rwc/aEL11XPPaXawbbPflkfUKk5LJ4cbj1xxPhWual8E6RKJ3r3NcsuSIc4gEYAjC1Ux7KwaL+r
	AfegWU6tsyxVUQ7DhJ+I9R902TmGc1wvU7gng0LzYUxs97mA/Vx0usCAXq82f0Q4qkx7etbk4yO
	cWOr4c/hhiETXKKBF+fg00btS3L4Wt6M0+FiRr+DsYRQ2MCFuHQMsThs+lUwGBglYMk6V2
X-Received: by 2002:a17:903:41d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c1e85c0cbamr211904955ad.30.1780968733886;
        Mon, 08 Jun 2026 18:32:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:32:13 -0700 (PDT)
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
Subject: [PATCH v5 10/11] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
Date: Tue,  9 Jun 2026 08:31:06 +0700
Message-ID: <20260609013107.5995-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33727-lists,linux-renesas-soc=lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 079ED65BA9B

From: bui duc phuc <phucduc.bui@gmail.com>

Add fsi_clk_prepare() and fsi_clk_unprepare() helpers and call them
from fsi_dai_startup() and fsi_dai_shutdown().
This ensures clk_prepare() and clk_unprepare() are executed from
sleepable contexts and keeps clocks prepared only while audio streams
are active.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v5:
 - Drop count & spu_count and rely on the clk core for clock reference
   counting.

Changes in v4:
 - Move clock->count early return check to the beginning of 
   fsi_clk_[un]prepare() to simplify the code.

 sound/soc/renesas/fsi.c | 51 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 6c432c7235a4..80e87b815c1b 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -730,6 +730,54 @@ static int fsi_clk_is_valid(struct fsi_priv *fsi)
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
+	ret = clk_prepare(spu);
+	if (ret)
+		return ret;
+	ret = clk_prepare(xck);
+	if (ret)
+		goto err_spu;
+	ret = clk_prepare(ick);
+	if (ret)
+		goto err_xck;
+	ret = clk_prepare(div);
+	if (ret)
+		goto err_ick;
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
+	clk_unprepare(div);
+	clk_unprepare(ick);
+	clk_unprepare(xck);
+	clk_unprepare(spu);
+}
+
 static int fsi_clk_enable(struct device *dev,
 			  struct fsi_priv *fsi)
 {
@@ -1580,7 +1628,7 @@ static int fsi_dai_startup(struct snd_pcm_substream *substream,
 
 	fsi_clk_invalid(fsi);
 
-	return 0;
+	return fsi_clk_prepare(fsi);
 }
 
 static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
@@ -1588,6 +1636,7 @@ static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
 
+	fsi_clk_unprepare(fsi);
 	fsi_clk_invalid(fsi);
 }
 
-- 
2.43.0


