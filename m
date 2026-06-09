Return-Path: <linux-renesas-soc+bounces-33724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t4jfAp5tJ2onwgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:34:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B67D65BA7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:34:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VdI45W77;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2B2D3055F34
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 01:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FF6344D8D;
	Tue,  9 Jun 2026 01:32:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6064834404B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 01:32:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968723; cv=none; b=Z6+/Tx8BLk7D4e1ykrm7uSPZK+TVOET/NGuNuRwOrDWG2iUJb+kQALmZvkqR3DqkmA+q82HIvChkywN8yGZluAsb3pT8bHNnDbW4+zVE+8/+13uVyV0pbbzObu2nra739juCFHxXAjiukLbRwKg0txug9y89QaCCbDNV9c+22WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968723; c=relaxed/simple;
	bh=YpcDZMX363iIvbH5/NBtR85ZcvXyI4n+RHVGoibhH0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBRYEevfNL0q5jmHe1VdcpI5h9CIGOQ/sMoRshxznuYoa6Fyd39fB22gEXDV5rC91xRY82KXEf6B+nhX8POG8wCMIq9nCvmhdPwAFjtlwyElMdO+as+h+eD7Gb1d52+3K/3PHmjn0tco5rFcWq3vU+rVJkuNjEYce4G8Bpg6uZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdI45W77; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0b944f6edso51265625ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 18:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968719; x=1781573519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+bbQbftJjjFu55E1JFO4f7u5X8QUCbi+q5hkfYSnqE=;
        b=VdI45W77g1mNYc2sa/WMOZFI/Ut7kw1XmCDaITyuhyIYmTzlDJr1VDxpwYO414cpaY
         3cHXrY1ktqBrkoa+tBj/u1yjCrc++cCkpYqxUQ+/HMnZu7V57Ebfs2tCFTfo/9twN9ar
         e4p7H4Z5LkJJtS54YV9Cg/axxbXbgHlfdhUmAi/eXknBC4iNUXEImSddeApUR6SpMKum
         O/KpxZKWrygZhMUgXed4cVsrtH0QhB3W1slwYSk0mAVT2s3qwFLtNJR28UdaMr9f8X7H
         Nj4c4r+mY7V93/ZozKl9o/1m01xE1vNrylu8SJ68VRgUAFNJ7ZIMamCCTQYDhgPCIglr
         CA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968719; x=1781573519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+bbQbftJjjFu55E1JFO4f7u5X8QUCbi+q5hkfYSnqE=;
        b=S5sA8RYFhf3XjmgcgyUnAUNagQqZ+LG/ZZCi40svoqIdegsGdWFaF4ofZMey+yRlIb
         n/9CxLY2TAo/BwTe/btTBm7wFBS7TZz06ZQiLhyr6xRqe8RBZ7V5z6fMLyVGOlmWScHW
         nJlItvB1CYFX8jyz9QIPdrU5ZSKRCWzriXxuDf4e6OBC2UuLeZh4ETQclDdf5o1q/kmE
         tYpAIVREhJ8CirFYKzmH89BfFjeAGjg0G3hLpySgAwCK6LsVCKzZEVc02m941EqcaA0d
         cf+wGZANr8CwCpu38LLtBeUzyt+vPgZXOp/myBo8+rAVFZtvDQ8liGw7UgQ/9Bjo531J
         aIGA==
X-Forwarded-Encrypted: i=1; AFNElJ+q5ffKL3RC68N7sCqWhcWznD9O2RYKGaOOM0D7RIRpRSwY2vg4VuxbwqZM++tCdSiDqbvLIYmc6EeKtFaUtYOS4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWRH5ewExTJm7kAhZcZ4DHtwiyfjqQc7L8/dwTcW08N8AR6aBn
	+rKiF9KRoERxlL/2yhSIniEn0+5T90kGsgFK8xcurUTq6chx6lK5miYI
X-Gm-Gg: Acq92OGAEh7dSrL/f6UVBtIj5ZmTiVnPSSz6jneuXr573sqQ/DSIfXkxZE8Ltq2k++P
	C65lPx0h4U8bQ/qzJvnywknkdgXSmKBelvLMW8/phMkW5F57ChFz09QTEnwGqv02L0+Mfze5XT+
	HAUe4uZXgapMYLjI5W8n1vM3yuJxp6X0xgl7E7DsgkH+YAiPXTxjBqdmEg3ixtDtOBX6qob9gEN
	NcKQgt1FL/tOlKwv+ZwQoCtBLMwu+efRaK9O9CBpGPnk55+vD1lEHjzcX4s/1auaos+B0jyGz9N
	tbzO2+n95jIGpQ90pSrXh/yYfiqdhyW2V3G37M2EVNiv9KvONdp9iholGK6wqiQaA43l9oPxVsT
	EP+97qerSqLmGewQwegnBtNIUdz1IZqnuhO01fXMKXPgfim4rKLtF3AKviAIsY9bhb0gOmiXCmL
	FoPLIUeB7jHG3ZlVjjMwPm/kWDl99FT1NWW6iS26GbCDSNSS+2xrFNT9oQQTZ9oseQBisTgTd5C
	jvngm8=
X-Received: by 2002:a17:902:e5ce:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c1e77d145fmr200993215ad.0.1780968719494;
        Mon, 08 Jun 2026 18:31:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:59 -0700 (PDT)
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
Subject: [PATCH v5 07/11] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
Date: Tue,  9 Jun 2026 08:31:03 +0700
Message-ID: <20260609013107.5995-8-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33724-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B67D65BA7E

From: bui duc phuc <phucduc.bui@gmail.com>

The xck, ick, and div clocks are optional. Switch from devm_clk_get()
to devm_clk_get_optional() to correctly handle cases where these clocks
are missing.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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


