Return-Path: <linux-renesas-soc+bounces-33616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nyPEJoDBImoBdQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:30:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B81364828A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:30:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qXcVtmGv;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E921330F5369
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 12:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB49380FEB;
	Fri,  5 Jun 2026 12:20:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B7C4DC522
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 12:20:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662045; cv=none; b=boM92HWoID+X6k9nZP164CAHSVfzcjwC54WZ34PCYzUKDW2Ga1gVnFgCmv5d3udQ6jKdqgOjGH3+aL0I/n44vfajJTIkUYRGoBC4IJR5C3GHr0emDoamFYNCtiD3Cd/1JydyR5/HcCy2oydYe40APwwptmdzD2/iQwd+QBeJiaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662045; c=relaxed/simple;
	bh=6JrAI+jHNCVY9D9mXTcwbzLOirSfEaNGPwbU2EKa/Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMs7lkSbSXUTGx3A10GnZ3q6xjY7r8PYS8iwKKhqZnT1ULGhDCWz+7YTNfNMvUbE/KvDkskikoLflQZfOfOhKOWqm+YGzeCDE+sU8FyEJO7cpghQ3TqIHI54/9Hbi6GOBbxxOfBy1KlgVCYk8HEQC9PQgRGOjK8UOpdB6f3Uhng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qXcVtmGv; arc=none smtp.client-ip=209.85.210.175
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8423f869421so1344812b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662043; x=1781266843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFeJyXKmHA1Uec1iK3fvTQXNf+MjrFSlqdhOvHAIFVA=;
        b=qXcVtmGvGw7GKuID7xkrFjgKlu/h04nD69yfEpd1w7Z6ytp8hTm+xIDl5km7xBf7dP
         NnozEcjdInb3zb/1Nc6QYK6v/edalcGNlUgApJHfOvrd9oG32yjuKx5c64QRKywq/8tI
         bs0zEUARt8WyZZVogzR7IVqFHPlOJxJrl4iHXX8DDQZcrw7IRgjMsiCIvJWyOfQVi1FT
         la263xsAWD69pteJXQkojJVqXF8CxYLayHkKFdWUp6LEu6zfN4VXWN5rDcydUIzYVjiE
         VZ38zyzdNUunFhLLsZFXPGCmHneHY3K/gaBpbwVsP3JQvQfS+J3KgzFIA3AjMWcSTA1i
         PpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662043; x=1781266843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFeJyXKmHA1Uec1iK3fvTQXNf+MjrFSlqdhOvHAIFVA=;
        b=g++QA/d/sR45htWxlUAXz+ghWOvweRbXIbiF4hwOUTmJ3XS4JRPAqdCam8d3M9tllL
         yizu4zAU3GwN2DFBX+upujrf23o6XJYaL2m4kr2dsxjqw44RxtfEd7PZ3vSsTZj7ILHl
         BVy1a7ddeNWmLMO3XWGbdjzvQgiXJZaHSvWhsv2wkerzXkBdfcyTckAgD2cphLKmjARe
         OS8MbiH49qMrJ2mKqqfsw6dZ1v7j/x30QLu1XTnJ4140L+UHaDm7aluV3w5jlVKpGcqs
         o9QGKTDAAuIUj8Nn7mkyoqQ7Tt9W7M6LU9Keg0B6wEdCe/kXc3S+LkT55ZP1bohogl0b
         i3cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ascZxj5NDEuToa9UaJVYpDOOXHN4Hpai4gsZf+en1zbUvGfcNgM1u4+/hVdz8cXNvO8MK1BmOkP6T8gSTslcwgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCs4gF59YDXhv4rDGEddSDj28joMERdSY0DOiCXCnERkWR02gT
	LfRCVSCAEedaYcbW2E6r3bspI82AN84t7CXOOaMCzvMHrH3LDHs0CpF+
X-Gm-Gg: Acq92OEIHc+0citZYMwdDe8xxwz4Jewa7/JgMqDHWDejDAjnbdRkr6SpsF39hIZzJBs
	iPcItEKQQm6FbNbIjkFq3cRBtODIl88ci+YIHN2JHyjktkkrQwBbmp0n4m2LxBgGwERvO4a931K
	7xdWpMETA6GbBSj74bsgp5NMAdNAR+iat3K6DDZOA3uUSSwqVhLJ7cQXF5XHh4Y/wpViItVOKC5
	QAIQ1aaqmsiFeBhsudf8OK3Y3WAogohWgni0+YBB+ZxqHqQA3mCUol9pOuLmv8+C0b6VSeICOd1
	f99qlsVQUPX/KJCu6YgCeM9EtDu+x6kEFj5DGPBkPGDFDp5/rcZh5ow5Tbc7jQ/boO0yiC8SGqt
	RooIU/6fbnUfa65fDoW8diW4JLKuRFHio6DKepQYIhspGXkr7GWTSkNPnqeoUewtpkFs1JUa/5q
	o4EqU8kS4rOTwXvXXm6CMJeIrSUGCHzuDTvNqpGxGCclCNECN3qLccSeg4Ts/Kr/ipmo1+
X-Received: by 2002:a05:6a00:929e:b0:83f:250d:59c with SMTP id d2e1a72fcca58-842b0fa5602mr3482846b3a.39.1780662043121;
        Fri, 05 Jun 2026 05:20:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:42 -0700 (PDT)
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
Subject: [PATCH v4 06/10] ASoC: renesas: fsi: Move fsi_clk_init()
Date: Fri,  5 Jun 2026 19:19:50 +0700
Message-ID: <20260605121955.105661-7-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33616-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B81364828A

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() after set_rate() functions to prepare for subsequent
refactoring.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 128 ++++++++++++++++++++--------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 0f350bddeb1d..43e6772c06d5 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -717,70 +717,6 @@ static void fsi_spdif_clk_ctrl(struct fsi_priv *fsi, int enable)
 /*
  *		clock function
  */
-static int fsi_clk_init(struct device *dev,
-			struct fsi_priv *fsi,
-			int xck,
-			int ick,
-			int div,
-			int (*set_rate)(struct device *dev,
-					struct fsi_priv *fsi))
-{
-	struct fsi_clk *clock = &fsi->clock;
-	int is_porta = fsi_is_port_a(fsi);
-
-	clock->xck	= NULL;
-	clock->ick	= NULL;
-	clock->div	= NULL;
-	clock->rate	= 0;
-	clock->count	= 0;
-	clock->set_rate	= set_rate;
-
-	clock->own = devm_clk_get(dev, NULL);
-	if (IS_ERR(clock->own))
-		return -EINVAL;
-
-	/* external clock */
-	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
-		if (clock->xck == clock->own) {
-			dev_err(dev, "cpu doesn't support xck clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSIACLK/FSIBCLK */
-	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
-		if (clock->ick == clock->own) {
-			dev_err(dev, "cpu doesn't support ick clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSI-DIV */
-	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
-		if (clock->div == clock->own) {
-			dev_err(dev, "cpu doesn't support div clock\n");
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
 #define fsi_clk_invalid(fsi) fsi_clk_valid(fsi, 0)
 static void fsi_clk_valid(struct fsi_priv *fsi, unsigned long rate)
 {
@@ -1034,6 +970,70 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	return ret;
 }
 
+static int fsi_clk_init(struct device *dev,
+			struct fsi_priv *fsi,
+			int xck,
+			int ick,
+			int div,
+			int (*set_rate)(struct device *dev,
+					struct fsi_priv *fsi))
+{
+	struct fsi_clk *clock = &fsi->clock;
+	int is_porta = fsi_is_port_a(fsi);
+
+	clock->xck	= NULL;
+	clock->ick	= NULL;
+	clock->div	= NULL;
+	clock->rate	= 0;
+	clock->count	= 0;
+	clock->set_rate	= set_rate;
+
+	clock->own = devm_clk_get(dev, NULL);
+	if (IS_ERR(clock->own))
+		return -EINVAL;
+
+	/* external clock */
+	if (xck) {
+		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
+		if (IS_ERR(clock->xck)) {
+			dev_err(dev, "can't get xck clock\n");
+			return -EINVAL;
+		}
+		if (clock->xck == clock->own) {
+			dev_err(dev, "cpu doesn't support xck clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSIACLK/FSIBCLK */
+	if (ick) {
+		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
+		if (IS_ERR(clock->ick)) {
+			dev_err(dev, "can't get ick clock\n");
+			return -EINVAL;
+		}
+		if (clock->ick == clock->own) {
+			dev_err(dev, "cpu doesn't support ick clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSI-DIV */
+	if (div) {
+		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
+		if (IS_ERR(clock->div)) {
+			dev_err(dev, "can't get div clock\n");
+			return -EINVAL;
+		}
+		if (clock->div == clock->own) {
+			dev_err(dev, "cpu doesn't support div clock\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static void fsi_pointer_update(struct fsi_stream *io, int size)
 {
 	io->buff_sample_pos += size;
-- 
2.43.0


