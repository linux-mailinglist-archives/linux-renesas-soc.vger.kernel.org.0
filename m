Return-Path: <linux-renesas-soc+bounces-33753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +R46Ftr8J2q86gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:45:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA8865F9A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:45:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Kqh4BB8H;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57C11305E185
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F241B3FE663;
	Tue,  9 Jun 2026 11:39:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FC43FFAA1
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:39:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005159; cv=none; b=sLr5vJfi4BrSspCefoul+D/1rQ9Zkn+Zufw1yCUktNNoyfjz2/oB6ou2l1KDVqu14xOU8P3/ZGMFNGluI5dMd3FsQQlFpFSzNZBoX8YQGOtabi31Tn7eqg+FsWKIGOmVZ/m3AQ/jXLaMnZOB4LwrdHZYVpkEf9l+jXqV/0VE/Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005159; c=relaxed/simple;
	bh=ZU2QqApVqvEo5X6AM4WeF7JDMWioZDbuBtbtX/QxkFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cEVlGf0jrQbPJhFGXMO8BDKX0tdtKXWA5hxnHxfxjeaGlBl52dyPPwm0cXxJ8JuTDmcnKm/CF298Wg0Kc7DmJsL0N+59ufRVf6jSKfexTdUh4d52l0oE1KW+4S9B3MY52JH5O1853EWakWFDOzbKxzIeMVcm3CxhYA4lXwyNPZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kqh4BB8H; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf237e1433so60492795ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005158; x=1781609958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yW9dUme6TNQwUT8ub5SHPZ5CpB9qrccUxB5qRYGWeaw=;
        b=Kqh4BB8HURyADWPMv71MwCW2L+foiM7MV8zPXw+ilQOI8z9i3LeKb4UVTTQx8XiG4X
         +zDoX1RgO8XpJMg5lDUzZAPyXSJHuO/WI9cKq/DijkCB9Z2SkM4YK3kC+KV4sId8+DTT
         onTyoLk8y8ZS0JqL7rxNx+5ElyasacDfZUkdDrfiZNG+KLYCAlBcgLWq7fF+3JsXd/1W
         MRjLIMw3OH9juWnXLG5UyOBYjF4VNDXDbgn5MdgC1Tx/8NtH2CMfedJQXkaMbX0mtYol
         LI7cclAZYgcBoijLU/uTxC/Q5K/Kr64x8e86KlP0raGZl+61Ih6LwBs3epBi+16uGzXb
         +3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005158; x=1781609958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yW9dUme6TNQwUT8ub5SHPZ5CpB9qrccUxB5qRYGWeaw=;
        b=AsLv7JDNmKUH3cxAEiwyTXR9iqEh4UdWsCXyIOqzTuaVDYFip7pA8E9nnC4iVpYNsi
         k9xHZ+JQ9//SZc5oA+oW0QcWHB4vjK1nEA5i0+E62i1W4bmtdfjqSy9n/48M8O/4Y0Zw
         u2IVt478i3Mdygyo7iGCvLvLuqIIKdCYBwsSBalDKAkHaf4euTDtfPg/pp/pKXztvbtM
         Ult/RCH51uchoCJE4j6fOA4TacfjPy9urdEpGBxg5cELExM0mYfrulAnhcrsb24mzmPY
         So9mndY/X7w5aOtN3xYPC0IrxPohcx32TapfDgmVLjj27ftFWBFZfgzqHJi8goIJqhl6
         e5QA==
X-Forwarded-Encrypted: i=1; AFNElJ/mVyp0ImTG5ITSqUpi/qR1DP4y/EzKtYkmFa+BxLlJFPY0Kl/Ip8upE9FCVK92em3FUC4QHAZ1x6Cfxg7QWmFBVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0VRJNAuPz4uBifjW3P9OtuarqqDBpKI+ik32Gv4CMNH4bcBe8
	glXUS7tTrwXDbCRLMel+/eXGv36rtXcjBm/EzpMpAVSi3ztFHPYRL28X
X-Gm-Gg: Acq92OHWW7K4oretEWdk0gavHm5suqdemSx356Ukc/2cPgSp9vKmMX9LTfGREhAzpjy
	l+0kbPH2VJyXK3aOHQcdMO43nqnvC30tn9VoL2VJhQ09D7kIG0PK9wHt2LxsqvMvc4tMX4ZgSNr
	JINMqRqCOqf8ly8xH6AWZPFTzrmU6pubRs6Kg4AdYhePAm81smURkuzDKjxUCZwdtyPf1DyY0h9
	8CtamHCeRiExo8HjOIgTuV+uwIcZQktvOgYUEUddXCUKQRGac63JKMsnGLwr0vhW0L4cLrRvDRY
	cEvI6EqL9b8BDgYJ+RIIDhT4MXzRDtHDQz12D01kK9jHaEhTIW+pAgXIarzyCY8q+Kf+NnZJDQS
	M4r5nwtJkga0Qv0hS9Jf1Pgqz1IDAFyqbdsuk3D/Vul9zF7Woz9IF86sPvDqz3xOWNRgoSzf4Y0
	Qxac7Opji3psYWJTGnPggbGFqQ3ZfuRv0TSbAZEr5/7Jz75F1K8YiEf4jsMpKW397I9pIS
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr249158845ad.1.1781005158114;
        Tue, 09 Jun 2026 04:39:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:17 -0700 (PDT)
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
Subject: [PATCH v6 04/11] ASoC: renesas: fsi: Move fsi_stream_is_working()
Date: Tue,  9 Jun 2026 18:38:29 +0700
Message-ID: <20260609113836.45079-5-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33753-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADA8865F9A9

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_stream_is_working() before fsi_count_fifo_err().
This prepares for a subsequent patch that needs to check stream status
when handling in-flight IRQ handlers. No functional changwqes intended.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.

 sound/soc/renesas/fsi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 800ac40f9680..0bd0e0c8c5a3 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -442,6 +442,16 @@ static int fsi_sample2frame(struct fsi_priv *fsi, int samples)
 	return samples / fsi->chan_num;
 }
 
+static int fsi_stream_is_working(struct fsi_priv *fsi,
+				 struct fsi_stream *io)
+{
+	struct fsi_master *master = fsi_get_master(fsi);
+
+	guard(spinlock_irqsave)(&master->lock);
+
+	return !!(io->substream && io->substream->runtime);
+}
+
 static int fsi_get_current_fifo_samples(struct fsi_priv *fsi,
 					struct fsi_stream *io)
 {
@@ -488,16 +498,6 @@ static inline struct fsi_stream *fsi_stream_get(struct fsi_priv *fsi,
 	return fsi_is_play(substream) ? &fsi->playback : &fsi->capture;
 }
 
-static int fsi_stream_is_working(struct fsi_priv *fsi,
-				 struct fsi_stream *io)
-{
-	struct fsi_master *master = fsi_get_master(fsi);
-
-	guard(spinlock_irqsave)(&master->lock);
-
-	return !!(io->substream && io->substream->runtime);
-}
-
 static struct fsi_priv *fsi_stream_to_priv(struct fsi_stream *io)
 {
 	return io->priv;
-- 
2.43.0


