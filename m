Return-Path: <linux-renesas-soc+bounces-33721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vOI6JVdtJ2oYwgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:33:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D34065BA50
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:33:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="UtzDV/aL";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D1853024FB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 01:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71BF3403F2;
	Tue,  9 Jun 2026 01:31:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C202133D6D6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 01:31:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968708; cv=none; b=hLpTSS/FHMVTWT/WE6gFkrUfmNWLvEuPZcq6U5jpEn7bAYHvlAzmTAx0HE8z+PmNyxY/CBkM2IHZg01vdHqyRb0D7CJd4K0/WSWRsudppI6Rj5CD1DUX+FYyx7Kd5wYO9JGBa7EMd2Pp1czJGxI43M+AjkMNQEjRLZs6yy6WaE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968708; c=relaxed/simple;
	bh=oC1QnOKW0S6EDRIYnPdhZj48Z/Xdn4sI0vTlEt02IuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KF4yStnktiKWBuqIbY2BB3IgZjTqLZqeKtleVL+SxX4OngP2S5X8sjcFsFNxegNSpdLNlisLe9iNKOEvr5VK/7QgrvAOwqExKXSNARdKnGprENBwzSQSn1ijSkJHnbdOdZO1dF42N/vpEnTbLOwHuGsm9FQikXjN7TaDr3KAUiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtzDV/aL; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf114b0cf9so43521025ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 18:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968705; x=1781573505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UciuXuF9SkzGOJuh2s5ETTsCy+oZl/O5D36E7r4WTE=;
        b=UtzDV/aL38plP6UGt/h5evMelh4zlTBLdErl9NxT+E/4BqmRP8IjGldQ2fiwWnsc+X
         FRIa4OXEdUhTB8VmYCpW4WIw4VzoHoCLX3SwXQ0O7lbgymFCnKeNVxQdbvrQeAl+0vpM
         0p+EhYctSNBkNprY5vjWJPMWZhujKpnEanI6Vi8H5Sn4HZ1xU3sa2u85corWrVFau7xL
         +lwUChiE3r30At/mAFK37NOxL/slXWX3wor4fKkJqhsJFOMDzY5kQ5ztLX7z+zDcIuEQ
         1SN+toqaqB+9QUzF4S8KAWekcF7IfumZAKP6O5lcystgdQFVl/XqJ+3awWTsyC9qF9Il
         6RiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968705; x=1781573505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+UciuXuF9SkzGOJuh2s5ETTsCy+oZl/O5D36E7r4WTE=;
        b=T4Unb24qjojhMQPUCJshWtl33TeDbuFje8YSfg9y0FdJZA6zgCmGA59kWKpPOt6/k6
         e4P9ybCwlEqA1heM6XhjqyEvLsRdFGzQjRVSjJbE51/eTGYThLC+CevfDsKqrKxpstrx
         vxgdYiqX7tJCa5VXYi0AaNyGN8k2RacPWVHVnqLh63xiO6uKi2leFHWW7O07/W3rCcni
         /SQssZIQm77xatZkJPUl/7765+zmuSsBhnqJ0dLcQXROIghOsYOyoivt653Omz65OhVH
         ocIxQDeYlsEfuUi2G/Xa6R9hDNTQpfUClPTMG2ZG4vUCvKd/Pl2YHMr/08/UhDxdBlIc
         r6fA==
X-Forwarded-Encrypted: i=1; AFNElJ9rcgVQhci9CrOi39MYNCQebYjgjZc48Iy0l8MLg0O0Sq8ppf609DCtrFS5S9CqVGVLgkMSUI9SaFyeNqb3tvwt/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR2A2zKI+NtcucYnxcoF8cyy5VA+ksFNvnq8gBvLXIoa+6fBMo
	vcylxNNNoNO0j5geFrpe0UputcHqCpTVqNHJW0Q0Y6O3nvqZ9iAWKQa7
X-Gm-Gg: Acq92OFQOwxc/VjSQ2yXUoaFFbvBGdO4+alIZ5mrIYt8Qd9UV15bw73TbQr//TJaG2V
	rVG7Gx4dnq9t6T/UDGjanvbkqmn+xnUYYkAYkISu7z1V42yum5J7RQ/52z3Cnt+r9YAdI4FzCk5
	MYr13HMpFExY5twsVnEmp4m3Oeoy6OTmQ7DwW9ew8uDJqYvN7m+UgeiWAbPWJkCsM1hbYkkv9RU
	wa+pnLo6DpiB7elXbpy8Icy99On9GRY8PpEs53xUeRkfppmeUFsr/mQMAbFDWsXLZE0Sxv2TAzE
	92AQtXLELQ7/9re/cWlldBNhbN1ha3yhFXRjkvEuhXH1v6S7sG0aLukBCZrlPM6FZoN52h7eiVk
	BvB5D0cTAdW7+RjIZhOUlit/8NUkh6lHLWWAMYBtyz4+pD3mF6zzReiNO8gVIVFYwZzby+QqJW4
	VX3xDngJCByhKeMzyaQjWBvNN681mYKRVJmgR8e5o6XkKgkIPFq17gB0PL/qAUVBPhZFMla4CkN
	+xBnMU=
X-Received: by 2002:a17:903:2ac3:b0:2c0:b932:866e with SMTP id d9443c01a7336-2c1e8934f70mr199651325ad.27.1780968704926;
        Mon, 08 Jun 2026 18:31:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:44 -0700 (PDT)
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
Subject: [PATCH v5 04/11] ASoC: renesas: fsi: Move fsi_stream_is_working()
Date: Tue,  9 Jun 2026 08:31:00 +0700
Message-ID: <20260609013107.5995-5-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33721-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 3D34065BA50

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_stream_is_working() before fsi_count_fifo_err().
This prepares for a subsequent patch that needs to check stream status
when handling in-flight IRQ handlers. No functional changwqes intended.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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


