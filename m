Return-Path: <linux-renesas-soc+bounces-33756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xenOJCb9J2rR6gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:46:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E98EE65F9E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:46:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pEBnvUDk;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89DFA307E00B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9976F401A08;
	Tue,  9 Jun 2026 11:39:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D545403151
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:39:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005176; cv=none; b=siJ3zUNpWse+3meDONW8ShI4GSJL8veIyZRjFrjRNmpY0zJdUcvu+lNsPXICvPBOihwC1j7b5wD9HtLJe4qzzpp0bi8dbE3d8GmVh9XZQWbzl333y4LE7ELGGcbn+DDy9g25HZbQc/aTcDHOU8J7cytYci1wNfZkWTG66kTGCDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005176; c=relaxed/simple;
	bh=SsUMo+hqcHS6PAZWbeNXNV6E2THXUTZEf8/ZmCsujio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aE4+7RK+gAk8rm+CAAX9Slv1ZQ9CdiUAW1/RrBYBzDbJ40AAv46Y/ZRNT935L+ASGKRhQ62+PCZrDZ8TtcFSCL/p6GzHUWWPi3eXkBVBliKPMNR2sunKZSObXlPjAcEJU16sYh1U5UfdAMXDH+f0f2rCQs2J+2H+C9NoACKUYmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEBnvUDk; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c2a68d01so36847865ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005172; x=1781609972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btle9qlFdNHhg/yZTU5eyJZhUVYtJLKRE/IEtXriIZs=;
        b=pEBnvUDkmkrx6ZB/na9wJt+Bnjmf79cW7CU1DyRbbBv0v/Ha5Yt+ZNmp0AZHJiV/o2
         jlAJswIw33N+/rV+0LEotDJMG2nITK6ByFU2aJnA8LMoS0ZYjLGo1rg4KbRZwCVdzuHU
         RS8Oe4EpKb7lK/pxcTNH2F14+4QGtbMv0uu/T7pa62a8q2GTG3bTglCOUWJ93QLG2Rk9
         YAXxIHEIfpKTPJeLtl3ZrRXpc82uJsC/+uX4URZOkQ5U5xtaFqHcnIyfe4eI1RZ9s85e
         Ayjv8qZMshoPEoGmlyVFPdhQkOKLFcRVVCV/MLaZOkWVvq27A7cfnjDjg50lwtZwZzsy
         t+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005172; x=1781609972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=btle9qlFdNHhg/yZTU5eyJZhUVYtJLKRE/IEtXriIZs=;
        b=afVv+JjW67ftiCrFTDZZBRXg3RRwdzf0Emga1ZRlJSoFoV3oH++HsOIutiEkGhXBXm
         Ycn8FF6tyKhp7dyN3cmls1Qfc2tirFhu9e5Kgl1dMDDYlY77Xd+jtdbXUvT+G2gC2j3I
         cTJOzIKRRNlPY3ISrYZqRRCCanMJP8EwmAtEz34o5ohxzeuYoYvQyg4YlYwStnavTbsf
         l3v6fMx2ceOlOQV1wIeMSCrvTN1MHLVEVgMXc2kps8jSf/Ostxhk+nCR6P6Ir56/vc/B
         wGCcNQBSLaiNvJHKEPSFk+8bxoiCJGfC5O4Pjj6Xu8zzyKc6ylZG+zKFvkB68nC3G6F3
         +Czg==
X-Forwarded-Encrypted: i=1; AFNElJ9iom37zR3zH2q78VOLvxhnZZwXxMTBswxiNjwPv3/jf5IKV0CeGTospgapzwCydYm8taI3YZKe79qKVLD6eB3ISQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1I+Ef/AnptaZjL9wnNKYr6K0lXnc8dQ3/+5ABvFpdbiZWwFLc
	hqFcR8xLqe4tyOHOjMPC212IZccEn7PAqvzZGsIDiTIi4QDBaOCA4Ojd
X-Gm-Gg: Acq92OGo8MHj02NndFunE8QrgS4PVuoDjuz+hG0okDbT0NSsfDj+Np7188WBXJpOJkf
	Wla2fWoIVdCKqXgRE297OGkEqPNSh6UiSnjylab6GReB+LxgSpMUpXajDf/f2Y1BDvWMjNdCYYn
	pHK2ul1Phu0IYdi27kXORI7B/imyZminP/Hq9V4PmB7BvNKld27Mkd1lkjw4LGiKfeSYR3pufgr
	mv1UYVHlANv4YMa/YrL+wSXMzif7PBKymRevPb8zOfw/+bj3T1jeGSiwRtB+S+X5rCdxnTJ49Dk
	JBSw2hyVMgM15JjXAgL78IyIgMznd827fWxk5hxJfcfR2nH/8zXdX12Sjq0gcYWUYFy0yNSzX0Y
	g3YHC3033fR8Dnzmn5bUP1s/MVhh9QJHERk3weJrpv2xfoAEpL+cyALTZhCraS3IaGBiShiX9bD
	E8osrLIVfvzQUoQMvLoEzhTrxNxUMXsjemkgjo8k2Y6wPofPiiYOVIMLkz2bwuUHQjNyz2
X-Received: by 2002:a17:902:f64e:b0:2c1:4310:d80 with SMTP id d9443c01a7336-2c1e79e22bamr237302725ad.8.1781005171824;
        Tue, 09 Jun 2026 04:39:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:31 -0700 (PDT)
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
Subject: [PATCH v6 07/11] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
Date: Tue,  9 Jun 2026 18:38:32 +0700
Message-ID: <20260609113836.45079-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33756-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E98EE65F9E2

From: bui duc phuc <phucduc.bui@gmail.com>

The xck, ick, and div clocks are optional. Switch from devm_clk_get()
to devm_clk_get_optional() to correctly handle cases where these clocks
are missing.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.

 sound/soc/renesas/fsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 1df7dc014363..e29be2bcf952 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -994,7 +994,7 @@ static int fsi_clk_init(struct device *dev,
 
 	/* external clock */
 	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
+		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
 		if (IS_ERR(clock->xck)) {
 			dev_err(dev, "can't get xck clock\n");
 			return -EINVAL;
@@ -1007,7 +1007,7 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSIACLK/FSIBCLK */
 	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
+		clock->ick = devm_clk_get_optional(dev,  is_porta ? "icka" : "ickb");
 		if (IS_ERR(clock->ick)) {
 			dev_err(dev, "can't get ick clock\n");
 			return -EINVAL;
@@ -1020,7 +1020,7 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSI-DIV */
 	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
+		clock->div = devm_clk_get_optional(dev,  is_porta ? "diva" : "divb");
 		if (IS_ERR(clock->div)) {
 			dev_err(dev, "can't get div clock\n");
 			return -EINVAL;
-- 
2.43.0


