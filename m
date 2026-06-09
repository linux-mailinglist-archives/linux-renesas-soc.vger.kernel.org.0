Return-Path: <linux-renesas-soc+bounces-33722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KbJwD4NtJ2ocwgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:33:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D732C65BA61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:33:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Esy6C02X;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B529304BF19
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 01:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA5E32A3C8;
	Tue,  9 Jun 2026 01:31:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB6233F8BC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 01:31:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968713; cv=none; b=pGqMPo2ngV/sbl56Sft7ucD1jxVMC3AqFhuY1MZgO8DJRmRP55KWbEk2eA1BlidqlcBLLzCs9eTw+j5EnkyNMILwvWw4lRatU8vos0FTNyyN4ae4a3+8tsiYP/27QJgqLWZy5pRdPhCZuB7e5oLV/v6nGioIK41LI8Gozx7Sn7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968713; c=relaxed/simple;
	bh=hoCOcrMSjaAWKeNIF/wdCoUBsEe6mU/OTO9zKbkRgdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dc7ZY3f9A7nEy8G5AAMNEl3rZ3isjkl3DxubY+icmUYhsTrAjB5ydxB1jgXw2jNa1k0OpCH9dR8UOUOT3aRZa0sZyC5Er/W09bDBWPyNl4KaN0jgsFvrViRmM/Fey0KbXfOKrKONtsChva/XXXTR/DBPguc7pMIYhea5+XlbxRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Esy6C02X; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0aa420401so38201185ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 18:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968710; x=1781573510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++sjJT39ps4CzpziCYW8Pzk1hFHYus8aC6jLUnr2CbM=;
        b=Esy6C02XDUQLLJRx8HU8tSLCGxfpuBZJywUQZsiNuoVVO1bbUU3+TjVJ4TqALXaMGz
         gCcSkzYoTLrir4aB17p9VwwwY3FgBn/7FRNeY9celMTKFVyxXyoXRfrkq97jx6cTcog7
         BzVbf1ukq5XlJMfZ+h+IcINY75Sjg3E4Mk4Kby/ChRaViySIIrKR+8E9fIKvTYsRa02X
         SQW/tQH+FGAbvqMmVBJKNNeqjC9CTBk/28jkDvTp1aQ79POIgsOFMCeSARmHzHVUn3iK
         WL7SrfJRMEXiaa/j98D+3PRK/p/DyKaDRgiRg0BpxMIml6TB1DwkDVQuuatj+iBxOE3t
         ECnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968710; x=1781573510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++sjJT39ps4CzpziCYW8Pzk1hFHYus8aC6jLUnr2CbM=;
        b=LcuJMGFnCzThX2vWpw31n0zpVwiEk1Vuw9XHS6kvgsagkqYii6MOrYRuCunwQBuP5/
         GW1yN/1afFW7n2lbOLuv4TuBX07E+S61+2SHbyMtLQIFBoKRo9hH8OFw4qsfeBQ4hXy8
         Dghn4bGGLxbDd7oYqlgOzwEsh9PIZBVGoYqiuPoXx6RlxzNDc15njDfzfH5fBW3Jf8Xj
         IWqKvWcRFZsbTLqsnSoMagM1dOeI3u/GL89wPOxJoUT1qWvOmg18uU9RcyKDF8chzs0B
         to40Ukk4LCZYivbSvFaC5UYhmOX9mYvOHAnL36b2tj+i7pDeTiwjEsls66IEnzzhjfOt
         9noQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cZdt9H178pxSfkPLzstnyaL8oe209HTfO50oSaLV9r6B0WqPmB7npHtxzoKygzC2ntV+kY/6Y2jXUqJPiEFm/5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCq+dkleotfByGbc546aDlMp5ojqeMdp6RPbd3Q06DP6oEfI1+
	HRtikcNr1rQXINR6/K6HEC3V8ijex3TljJznEVLuAkYJ1GpZ+K2FKX5z
X-Gm-Gg: Acq92OFA/fnwoaNzsu3JfQb6wVei+13CCTtIU/ykleahPkLimSOV5v3GIllMjxAfwnX
	d+qrETN2PbtxyZexPrzA1x6wPzBvj9ZGDPH+MiqpuD/EhGwTdy2SqRUZr9vzoiwxC9drbD8P2t3
	50DOo9krBhwUEYvYZPBML0n6PB/s5jo9neHHeIo+z4KB3Do1etMam+kfjuJ1cLQcvd63M5jYKy2
	dBrc5p4nmoSQz707G10ginK+WHvcywwGZpyLPadpIxE+CnevAAEWbTpnrwuksOCbXANCkYk64FH
	8N0+jSfAMRn5qYqpiTltC/lixUhH0N3hxM7cahcS2ndBZYGFFY4lPU/rhhBGFhB+YcRyXK1I+NJ
	vZJWBDLAnecTb8jhkVEkB6jb5VlIBnE0SpdAndqdsPzJHTFV6Lks1TdBBxdQvrR9L8GGty1SVi4
	VOXq2r/AJdaRvxfNkR6MnHgKh5/Lb6nH37q4UV00hkFEw5PK7hod7s8+Esh9bxs0X5qxiK
X-Received: by 2002:a17:903:1aed:b0:2c1:69cb:4423 with SMTP id d9443c01a7336-2c1e7e527bdmr204388505ad.14.1780968709665;
        Mon, 08 Jun 2026 18:31:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:49 -0700 (PDT)
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
Subject: [PATCH v5 05/11] ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
Date: Tue,  9 Jun 2026 08:31:01 +0700
Message-ID: <20260609013107.5995-6-phucduc.bui@gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33722-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D732C65BA61

From: bui duc phuc <phucduc.bui@gmail.com>

In-flight IRQs may still be running when the SPU clock is disabled,
leading to register access after shutdown and causing system hangs.

Fix this to use fsi_stream_is_working() when handling in-flight IRQ
handlers. If no streams are active, the handler now returns immediately
to prevent hardware access.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - use fsi_stream_is_working instead of running_streams.

 sound/soc/renesas/fsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 0bd0e0c8c5a3..3e3c6fd7c56b 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -470,6 +470,10 @@ static int fsi_get_current_fifo_samples(struct fsi_priv *fsi,
 
 static void fsi_count_fifo_err(struct fsi_priv *fsi)
 {
+	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
+	    !fsi_stream_is_working(fsi, &fsi->capture))
+		return;
+
 	u32 ostatus = fsi_reg_read(fsi, DOFF_ST);
 	u32 istatus = fsi_reg_read(fsi, DIFF_ST);
 
@@ -681,6 +685,10 @@ static void fsi_irq_clear_status(struct fsi_priv *fsi)
 	u32 data = 0;
 	struct fsi_master *master = fsi_get_master(fsi);
 
+	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
+	    !fsi_stream_is_working(fsi, &fsi->capture))
+		return;
+
 	data |= AB_IO(1, fsi_get_port_shift(fsi, &fsi->playback));
 	data |= AB_IO(1, fsi_get_port_shift(fsi, &fsi->capture));
 
-- 
2.43.0


