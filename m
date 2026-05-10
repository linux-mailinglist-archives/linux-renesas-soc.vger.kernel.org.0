Return-Path: <linux-renesas-soc+bounces-32317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G0kDFZFAGqgFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:44:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D3275503244
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 483AB300233D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 08:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4366535E953;
	Sun, 10 May 2026 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGUQhczD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10CD36A02C
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402644; cv=none; b=YJ52MakxEfCylwME1entO7rvvpRzsciNO0yBGI/yVwuXA9rV6E4O5TAkVxDliJfwaJtFVkBkxTR5sw45tfqM/i3/kqAxk7EAZY2XRp4gTG6oeDOL3ld5lWJsKLi2hIkXtpLw5uDWqpesDqqxuoK1A2XJlbgNBmhmSWcxHE/LntU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402644; c=relaxed/simple;
	bh=EzZNAd1+G2Bcw6lQD7STgANBRJQkZJfEQMfEQAU1dt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZzpFioqbHUUaOh5Ul9Fr5hKy4HjkGD+0aUA+4lTjnZmpF0AZe8GiKzcZS3+ydIL+iqYH7fbmO2xg1SRdLzfns5Xs5YbScljjt7uNMiSc49bv+zp5JPh845J/kUNXzZumRzs9JKNYHYcmmiqRLEtBvhfrHR67hn92tas7z+Q+Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGUQhczD; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ba1e9d3687so21141205ad.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402642; x=1779007442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoAF9ct07fH3np99W6VPHFamBb7fo7xQbBMbY6jH4Mc=;
        b=hGUQhczDNdB7euInoK9CgBYWVVASDyUEHx/ALF4J1Sr2NcFxx6Y5tiZpLX5VLCBY3u
         QeCDZ6J69s5dF//WP48k/9ykj1TtdoGzo2iEYqckRP6XhVYoiYhWaGdxo2T98kp0Q0qn
         o1l077q5C2EGgVDWoitt10UxEsW+NOeo1wwLvI69wO8Su/jS2BnnPHpTzOHopvYI4Dt2
         9eWhDzR+EKsgGX8Y3CPQEu9bcnMoO4APUyTGsUvTc3J7NNa2823DoeNpq4oR0fq08i/c
         R/9R/uo1E8DToDWkCXrdmkisPlh95f0YweVuwCj+PGJGwvorQ2l+65Dh4uxz15fCWtEd
         cdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402642; x=1779007442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YoAF9ct07fH3np99W6VPHFamBb7fo7xQbBMbY6jH4Mc=;
        b=TmycbE0fDEXLr1dj8N2bEbTyWhEMU5+W1HV50/KMeF4mmkaOk6nrSSKy56UPxeRgKC
         +HVUHTrkmXqIGSNpYYVy1leDBiGNAGsW+2PITH+624lPC4nuU+OxKWVExonETLZMOoNI
         X/YJyJB3vUZxWdzOC3H0r31PEUPv+Y9geDJ/ScMBQp4HqB7UQphvgg17f4k+txpa2MY3
         OLcGFovSz3RqNpXgnYJFoksop4saa3KVMYyaIbQVOdiCINBOv1RqpRIXOP/NWB/d02hS
         hWYOGoZw17tj54vwurS8PVaAdeyzF+tunWilNBe2996pCIgcTg8exp9wzPto/yKK2rAf
         gkLA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ed1GUuAQItycj7QFUnDcXu7YnryPqBE8LRgblc4UdP42RRnTYlFyLWVid/cq6yH8SiHMIRx/Vh/VdMm4vhS6Cyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEt8iQtQPLhsNvMA1ss50LaOhLlKQnf/tn0nqpYMvatFxDksox
	uYpGaW0wUDo9lTnZ8kKmNwp91odSyqmSaKs7ndGP7jiSPzgLJoQP8uLP
X-Gm-Gg: Acq92OHqGXVfR0oLzOWSYTQ2xQN/Nb1gk+RGlG9mMzk1H5jrEgcHOVJQvxvIF0xjEFt
	NwovJ+fR0/23NBPcxfzZhM+H9xXsnz/9laetmGZDZ3HX+3a6aZcc6mhDEn9iced8YkvB/kcTU9T
	M63ECHWJfRH6p2dhGxl07ASOeO7NCd+sWL+3acikEEliS/unAkoba+H2haLkfkJV9Bjk3A/dSNJ
	0ubnN85vEuS/aTg+HTceCvql6dqNKdcAFnBG47WWqdNaw6BxAIBhSvU8eq5fzX4kvCiZ02FLtSj
	fUAcqUHCtSzzDNb5PtKs3DF4IZ0sJqddrXjHSH5b+3xnl96Mc6GPPyMTSW0p+jcklKGqE0/8lU2
	X4oRbjv0HTsmJTc5qZ/gvoGGNSCzevDkXHL5ExHdJBMc0SWxahmCogJotw9c9v0P2O7+gq9e6pM
	hcNATLfa06GxVAxrl8AX42U0ruM6SM9wbhuhI0jzqcaADYVd4HQP9tUhR8TA==
X-Received: by 2002:a17:902:8641:b0:2ba:6ffa:bde0 with SMTP id d9443c01a7336-2ba79c20bb9mr157009065ad.19.1778402642292;
        Sun, 10 May 2026 01:44:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:02 -0700 (PDT)
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
Subject: [PATCH v3 04/10] ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
Date: Sun, 10 May 2026 15:42:57 +0700
Message-ID: <20260510084303.122426-5-phucduc.bui@gmail.com>
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
X-Rspamd-Queue-Id: D3275503244
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-32317-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Ensure that in-flight IRQ handlers do not access hardware registers
after SNDRV_PCM_TRIGGER_STOP and fsi_hw_shutdown().

An IRQ handler may still be running when the SPU clock is disabled,
leading to register access after clock shutdown and causing system
hangs.

Prevent register access in the IRQ path once the hardware has been
shut down.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 94ab2e490810..fc8428cb1ba7 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -211,6 +211,7 @@ struct fsi_stream {
 	int sample_width;	/* sample width */
 	int uerr_num;
 	int oerr_num;
+	bool running;
 
 	/*
 	 * bus options
@@ -255,6 +256,8 @@ struct fsi_priv {
 
 	u32 fmt;
 
+	int running_streams;
+
 	int chan_num:16;
 	unsigned int clk_master:1;
 	unsigned int clk_cpg:1;
@@ -460,6 +463,9 @@ static int fsi_get_current_fifo_samples(struct fsi_priv *fsi,
 
 static void fsi_count_fifo_err(struct fsi_priv *fsi)
 {
+	if (fsi->running_streams == 0)
+		return;
+
 	u32 ostatus = fsi_reg_read(fsi, DOFF_ST);
 	u32 istatus = fsi_reg_read(fsi, DIFF_ST);
 
@@ -681,6 +687,9 @@ static void fsi_irq_clear_status(struct fsi_priv *fsi)
 	u32 data = 0;
 	struct fsi_master *master = fsi_get_master(fsi);
 
+	if (fsi->running_streams == 0)
+		return;
+
 	data |= AB_IO(1, fsi_get_port_shift(fsi, &fsi->playback));
 	data |= AB_IO(1, fsi_get_port_shift(fsi, &fsi->capture));
 
@@ -1573,10 +1582,17 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
 	struct fsi_stream *io = fsi_stream_get(fsi, substream);
+	bool need_shutdown = false;
 	int ret = 0;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
+		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
+			if (!io->running) {
+				io->running = true;
+				fsi->running_streams++;
+			}
+		}
 		fsi_stream_init(fsi, io, substream);
 		if (!ret)
 			ret = fsi_hw_startup(fsi, io, dai->dev);
@@ -1586,8 +1602,15 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			ret = fsi_stream_transfer(io);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
+		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
+			if (io->running) {
+				io->running = false;
+				if (--fsi->running_streams == 0)
+					need_shutdown = true;
+			}
+		}
 		fsi_stream_stop(fsi, io);
-		if (!ret)
+		if (!ret && need_shutdown)
 			ret = fsi_hw_shutdown(fsi, dai->dev);
 		fsi_stream_quit(fsi, io);
 		break;
@@ -1968,6 +1991,7 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->base	= master->base;
 	fsi->phys	= res->start;
 	fsi->master	= master;
+	fsi->running_streams = 0;
 	fsi_port_info_init(fsi, &info.port_a);
 	fsi_handler_init(fsi, &info.port_a);
 	ret = fsi_stream_probe(fsi, &pdev->dev);
@@ -1981,6 +2005,7 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->base	= master->base + 0x40;
 	fsi->phys	= res->start + 0x40;
 	fsi->master	= master;
+	fsi->running_streams = 0;
 	fsi_port_info_init(fsi, &info.port_b);
 	fsi_handler_init(fsi, &info.port_b);
 	ret = fsi_stream_probe(fsi, &pdev->dev);
-- 
2.43.0


