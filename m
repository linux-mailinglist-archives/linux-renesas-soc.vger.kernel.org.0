Return-Path: <linux-renesas-soc+bounces-23608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B49C0B15A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Oct 2025 20:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF4344E46E3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Oct 2025 19:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D18221FB4;
	Sun, 26 Oct 2025 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="jwf37y9p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-78.smtpout.orange.fr [80.12.242.78])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E93D1E1E00;
	Sun, 26 Oct 2025 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761507953; cv=none; b=Ed6JXOXYUV/eGi1QD6qllcwWvqn/lgGW1vpWL7nccex1X/MU9kf2Ywb8F5pPlWei+copfciScY9gwD+sKC8uQ6PxFmGRLFzjQC+0GeHf8eh7hnU+/A3ioh69C7A4Oy5loWoSlfyc8i2Em+zn7IjTE21iWFLDQo5PH1r87EnzPx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761507953; c=relaxed/simple;
	bh=cVd3sbdy7pg7X7h9vyHc02qG9eC+V5V0ssFO2+tD4VE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DGeIV04AHk6UEBgtWk6zA8TYJ5zCpRGEjZwoa+hbxqCC9ZIkyzaORQD/mqUCJ6XAXkYjy5dXSHhdoOsUpExLz2bdeHDWyOzv/T1Aovsdrk2Y9bXPYWKmyeMmec1tkmNZGYumrOBr/UpCKDYXzV9qRnydn9vO3LOVIDvH6ez/4nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=jwf37y9p; arc=none smtp.client-ip=80.12.242.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id D6gPvBiBbZqBKD6gPvMqUG; Sun, 26 Oct 2025 20:45:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1761507943;
	bh=sgyZZOwRfz3Iv3c9vpvnbeivUD/2VWnHJScxHYskNDE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jwf37y9pdq4WysFrgAIq5wrDIrcnzPt48g3/ZMtB56BSCFqvvUavrtwau14yKqrxB
	 TD0HyMzTMM9AcVj3CWH+qPOBysmCMzGltfItu4Y2CRx9nC15XUoQ65aPy67HHqT/2j
	 QYZlhBIQ5YnAWEvjmQaf+LSfVc7rGeq4WwW/H64frHQXnS73Hynh39RLlCEwxKxZlD
	 UyViu8Ppbjfx930xc2FX81nZx9MWZ203LY5Gcq2RjSyEYApLunXpYvnzbGNs8XUVud
	 DoQVoYzxthTrzT5aTPoDv9ARqM9kBO4PSoEem8NJ7WDl7lKk1H2dthO24M7HgwfTiF
	 pnkDPXYZP++AQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Oct 2025 20:45:43 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: renesas: fsi: Constify struct fsi_stream_handler
Date: Sun, 26 Oct 2025 20:43:36 +0100
Message-ID: <88ca34df9006b74a7596b91714e700bcff666c4b.1761507792.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct fsi_stream_handler' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  51837	  12312	     64	  64213	   fad5	sound/soc/renesas/fsi.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  52125	  12024	     64	  64213	   fad5	sound/soc/renesas/fsi.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/renesas/fsi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 630c2f52e1cf..1491c2f2cc96 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -220,7 +220,7 @@ struct fsi_stream {
 	/*
 	 * these are initialized by fsi_handler_init()
 	 */
-	struct fsi_stream_handler *handler;
+	const struct fsi_stream_handler *handler;
 	struct fsi_priv		*priv;
 
 	/*
@@ -1215,13 +1215,13 @@ static int fsi_pio_pop_init(struct fsi_priv *fsi, struct fsi_stream *io)
 	return 0;
 }
 
-static struct fsi_stream_handler fsi_pio_push_handler = {
+static const struct fsi_stream_handler fsi_pio_push_handler = {
 	.init		= fsi_pio_push_init,
 	.transfer	= fsi_pio_push,
 	.start_stop	= fsi_pio_start_stop,
 };
 
-static struct fsi_stream_handler fsi_pio_pop_handler = {
+static const struct fsi_stream_handler fsi_pio_pop_handler = {
 	.init		= fsi_pio_pop_init,
 	.transfer	= fsi_pio_pop,
 	.start_stop	= fsi_pio_start_stop,
@@ -1418,7 +1418,7 @@ static int fsi_dma_remove(struct fsi_priv *fsi, struct fsi_stream *io)
 	return 0;
 }
 
-static struct fsi_stream_handler fsi_dma_push_handler = {
+static const struct fsi_stream_handler fsi_dma_push_handler = {
 	.init		= fsi_dma_init,
 	.probe		= fsi_dma_probe,
 	.transfer	= fsi_dma_transfer,
-- 
2.51.0


