Return-Path: <linux-renesas-soc+bounces-31172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP5pBxw02mlqzAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:44:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C723DF8DB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 489DB3017F26
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 11:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE0C34C808;
	Sat, 11 Apr 2026 11:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="a7wzxxxa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6541A34A797
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907800; cv=none; b=tjio1jqPYT8gWJA7Uo5YftJlzmllEVCJ00d/HL/ceEO4zQD5WVsD6L99cZ0av8KXyNs05qczx+Hw25LnWtQjgBOeNmUP2mygsA+wfIiF2uFwMVEaNE8nMvISnSHYHBUeNX0WEh1+HLJDIf/D5YcJ+ayXPT6CF78CHMil/bzkkbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907800; c=relaxed/simple;
	bh=hCcTy5ooGYC8iDVpkjkx2X0iImn3Ks2K6Vfc4FCM9QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lo5eVC6Mk/pjOK6bgud+XVMJfiu+QEzCl9sLAvMRqNb1ypfF+1wuLnv2OmTr5vEN3G+WxZpVKRXZWP5WNE4kgLGtIrZHepNv2xpIZXVUJrfqwHOt0Dvd81XvKMjs5WmUhZ4ijibjhlmvdouv3fihjDcFWpk0xUCZQLBktYIFDyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=a7wzxxxa; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so1796787f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 04:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907798; x=1776512598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBAh3mtPfHrVsqP6yv8NM6dVTsui6/Je8uMjHCO4v28=;
        b=a7wzxxxaxIsoxYcmbeQZSVnkQjA4ADezdYt53TXIP1lFzE/qzyes2Ta6gq/RoPuEy9
         zu0gJ9NpVekVwKfj5CB6fGCaGrtz+OPFXQ7f6mNqcbxsfZEWx1Z7LQBlfLCHfv77dKxu
         ZwAUhXNsbo70OfLuRbvObfUSyXrS1PqJP30iMDJbiIp8r8PAjmqL84jJSyhkC/8NNOE9
         Wc0s4nl4kjSNaiSwCksWnxa+8pIF0A/i/TUQ/vZEpT5woEL/yErfZryZrMgetW61BjY2
         HNwPtIPN8dgc+bpdXgrE3kMxoCT/roCA0TD8b4oQvED+ZzYUKoK6AdHADiK5Xn9c4nEF
         HP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907798; x=1776512598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBAh3mtPfHrVsqP6yv8NM6dVTsui6/Je8uMjHCO4v28=;
        b=KxggwCu/GKrq7gb/aNRw7I/2omPw8fjr6lsKFtdqNFfwkq58pQiz6UTjHvfKYuU+uN
         TVMXoRfIlRgCTawltXspUkxu8l1lnWYv2pAxHgQYFFOkcyDSt2NXRsd7Re26DywHWYci
         eYmN9eL+1x8Kt3nGwND+tv3uRnUhMK3K6N7IOpG8K4lfp8IbHst8iqiHECZ33RM2Z3w3
         lnaTxOQQe1T4exen3aytpJA8BjmcPZrPJQX4Dx9T3co9o5UNTcFlqaEzp7RSbZDK435L
         80FVwxJ/9LdFRcIgYWsiVVUkq8SlAMBA+2o/kDTt39oTh3sBf8ktoldhZab2lx5kBtje
         LKpA==
X-Forwarded-Encrypted: i=1; AJvYcCV4QHTYqZfReQbnGQR5Q8eYDuzWcOy7m3gaV9tN6R+vkoyzkNvzrs/0EvahiCjynA5e08HcePQGtGXCXogk5oqUiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl7VWAgmggRCbyHynVkUUDtesUGnwcrrQvJESE6fmCR7dFL2E9
	p9vzjZuCvltNTamxAPB/5g1BWuD1rQpR+30TrwNZ17aW+W2rMD3kGHag73Scg3aCsrA=
X-Gm-Gg: AeBDievczSgH0ERoTJoOJlssQhaEgOF10FyaNx5SWRJK/KY/HE2zw5/WiJT6fFeqfhx
	i3Otky1o/TRw8K6JznkO/+lmWXHT5Hbg8nIFhZsZUgIUY8eJe6s2ysvzukq5JDEMoxO98Rr+bLo
	Qu6XmxKRBajaBRJiSySIEgjNorHd3v+/Be4qY3xKLXjQ2Lt2Ns+7aCBntWPbr6KETVeyjy1+fEP
	BhnlLF3pmbbBWLG1L/Uvlcgxjzrjz2JRU0srziyhWXaAg4kQcJpxICiDQCwaQl1RU68DNPR2aAu
	iq6aNzVJqEFvkW05urRDfQ8hsnfnlkZRUXgPn+naxmB98XhCVa76QCa6gMnDLoUgi/cl5RziVrs
	XdJ9inlKL1woVozaCku0iZmunmv7HICnOrVVdfIYZTEBAbrwDOcW/ZjSK7+f0fvYlF2Nw7vkooi
	InKZP4VWUy7Z5QBH6C94M9cCiv5iaHFGqwtx/GLfp5f7wxPk7UFcZJ
X-Received: by 2002:a05:6000:2804:b0:43b:9d69:43a with SMTP id ffacd0b85a97d-43d5957372dmr10511283f8f.8.1775907797979;
        Sat, 11 Apr 2026 04:43:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:17 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com,
	long.luu.ur@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 06/17] dmaengine: sh: rz-dmac: Add helper to compute the lmdesc address
Date: Sat, 11 Apr 2026 14:42:52 +0300
Message-ID: <20260411114303.2814115-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31172-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,tuxon.dev:dkim]
X-Rspamd-Queue-Id: 19C723DF8DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add a helper function to compute the lmdesc address. This makes the
code easier to understand, and the helper will be used in subsequent
patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 943c005f52bd..6bea7c8c7053 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -259,6 +259,12 @@ static void rz_lmdesc_setup(struct rz_dmac_chan *channel,
  * Descriptors preparation
  */
 
+static u32 rz_dmac_lmdesc_addr(struct rz_dmac_chan *channel, struct rz_lmdesc *lmdesc)
+{
+	return channel->lmdesc.base_dma +
+	       (sizeof(struct rz_lmdesc) * (lmdesc - channel->lmdesc.base));
+}
+
 static void rz_dmac_lmdesc_recycle(struct rz_dmac_chan *channel)
 {
 	struct rz_lmdesc *lmdesc = channel->lmdesc.head;
@@ -284,9 +290,7 @@ static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 
 	rz_dmac_lmdesc_recycle(channel);
 
-	nxla = channel->lmdesc.base_dma +
-		(sizeof(struct rz_lmdesc) * (channel->lmdesc.head -
-					     channel->lmdesc.base));
+	nxla = rz_dmac_lmdesc_addr(channel, channel->lmdesc.head);
 
 	chstat = rz_dmac_ch_readl(channel, CHSTAT, 1);
 	if (!(chstat & CHSTAT_EN)) {
-- 
2.43.0


