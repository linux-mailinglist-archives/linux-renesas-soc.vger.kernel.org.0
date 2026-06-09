Return-Path: <linux-renesas-soc+bounces-33759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4dxLOGz9J2ro6gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:47:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79065FA0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:47:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ADf8QRM9;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 436F8318E58B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE9A402435;
	Tue,  9 Jun 2026 11:39:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C31404BE4
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:39:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005186; cv=none; b=Y9sqlp8h0lKB2iVWwykRH0ZdzKOSvaTYUrvlIsDFJCJUM/e1VpLn+PRcx7dTcIfv8Uvvhz+OLFcytlNNUlAvYQIgyxhoqMyQpkoLuOUInDbImEKVLci0u8MYIMkT8mwNjaKLGxGeX7GDYY/ZzmCr/lIq22CZBl4DSwe9NfjAYTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005186; c=relaxed/simple;
	bh=kTAg9q9u6VoW+qN869GenvQcA+UPoEV0Jn/gySZyMr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMPAHbfKWKcTtmi+/ORboqImL0q5igOTpDs8ifYYOhgoNC0jBPyERd8TgrwupB1hGHyug6kwvQA+oVeQq3pF5RF1eu9rCMROn2tvQeUvF+zu01F3MXoJvQPJugEbp5F+lryVzWxpnrYqnQt6075FiMMG7tFKXcttW6eB5cuHmbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADf8QRM9; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so36859775ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005185; x=1781609985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3igX93L19Hd9A1VIL7yayX5x/YnSKR6u0HXaQm3XtM=;
        b=ADf8QRM9I/Dn+EnWodaEHM/QAmnovXtJWlFfFdUGOtHAknGN0WSw92OitysZMdi5/o
         aGv4z9YW7Sz2S4ayyszXbNij30TaHuBi1iwNUyJ01TAllbHFW5k7zR4DgmBsBBLqpEDD
         QhPhYnC4nqQkmtSGgsflU8hjFt4l9lR/UXIEvaVxQirNQLKtTyX/yVl866DoXm9Ko2Jq
         eJX7Op8fHZLC94ESl8IetHgSEU/C5Up4b9tCvksWp2XlHe/bqBjQzUsMi1XQqV6bZZMz
         GzjgP+0Ju2i+qsIE8j0joUQX1bbo+ES1ClNkwsj25y/RR8mJKE8SaWBtx5vsESqAUiUH
         tv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005185; x=1781609985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O3igX93L19Hd9A1VIL7yayX5x/YnSKR6u0HXaQm3XtM=;
        b=Jd1KysZa6BgsdwRdsV6rmkrzcwmQTlZ7peb/Y+SktjpsUAF7IS1qk/izuVmtw+Rr/F
         ZN5RJ1J2WEdu/MX5NdEOg9uCwCbAtjoeT12y3329I1nBaXr9qkeLt55fBquX3enj5H1Q
         tU2aZmg0ouvRoaFdM5Dnj9ZuMpLlcHmAGJzhFEbAMYZlu5//NR9trLO79bomQ5VQWmpq
         pjY3mzy9B5S7t44qrvxsW6dmLzNRSlK4gG7ZiHa5+aMk5/fpj3pWI8TafuLrdrDcKYSc
         Hk134y0XFZ+cReuJWdpayRd2tRkz72ja0Wkwqbc1nXUjkJBz9KeBcwFv7oYcDMTitwMa
         8lRA==
X-Forwarded-Encrypted: i=1; AFNElJ9jVxC7kOmCWZrgggz+mSs9skR2O2ekgayoUb94OX55VeJYuFBiL9Gve9cKFi91hWUdIEi2+Z6tofOLK0z9yhsEXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzekL2V9QmGwHB93QcP8LpzrEczeAk893TqkEAtb2MsUZzlBh33
	uIji0fV9alI5+S7xzphUGbEERUoBSulI8kM0rUiCwiecayZHNC3cWEjE
X-Gm-Gg: Acq92OEOIOz9FHfKUuQV5MiMbSw+U60AL9mWazDiDbM4eMv1sWLTjhPvKQCfBDUpa2A
	3UoMTCdtrbISnG1/ReDmOjRMxLycHtokdtWPzyh8MAjgnMNvIT7K79bPsCusNoUQEKHKktqgvNO
	wGoRhVlLQUHs+LCjX9p0R3w5jOhWAbVC7qan/nm9KMeDtYc2FiDcSqzSldLjbZXiJYPsDyXA1BE
	CT/dS7sSUxyKAtUe6jrvL7GHJLa3Ge3fnwZU/+2kb45qokfQCnGn9cyQ43hcZGIyz1MjiZVzHrp
	NQ+8r0w80cTT1yoV9T058omKXs2BeckCgjekh+Z6naahYa+wz4VvOQJ4mbXrJcRJJVOcmbWVtTN
	Hw02MMxTjM76NM7BR+IEsxC+IPbows/jwW1fl75diy8Ssz0LZROvFxJNyuNED05trUe7CGlFvpr
	lIVQvTIqSN3N6mlsCFVu+USNIGhCNab9O1UXQwXfPf5cI0zI0ZkRyzALcGSYa+R1snKPUA
X-Received: by 2002:a17:903:908:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2c2a1bc8420mr37204835ad.9.1781005185183;
        Tue, 09 Jun 2026 04:39:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:44 -0700 (PDT)
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
Subject: [PATCH v6 10/11] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
Date: Tue,  9 Jun 2026 18:38:35 +0700
Message-ID: <20260609113836.45079-11-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33759-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D79065FA0E

From: bui duc phuc <phucduc.bui@gmail.com>

Add fsi_clk_prepare() and fsi_clk_unprepare() helpers and call them
from fsi_dai_startup() and fsi_dai_shutdown().
This ensures clk_prepare() and clk_unprepare() are executed from
sleepable contexts and keeps clocks prepared only while audio streams
are active.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
Changes in v5:
 - Drop count & spu_count and rely on the clk core for clock reference
   counting.
Changes in v4:
 - Move clock->count early return check to the beginning of 
   fsi_clk_[un]prepare() to simplify the code.

 sound/soc/renesas/fsi.c | 51 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 716ecf0401fe..e26f39dfe059 100644
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


