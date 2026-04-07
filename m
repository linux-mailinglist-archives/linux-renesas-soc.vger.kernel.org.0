Return-Path: <linux-renesas-soc+bounces-30923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH8VGGUJ1WnMzgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:40:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C34693AF51B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 701A830812FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 13:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A2A3B9619;
	Tue,  7 Apr 2026 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gcNCLCsv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9973B8BCC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568936; cv=none; b=ql9hxo4V1Iit6Lgt6c3T/aukFkfcWQBVCt5ygvkfwAemzJ62O3I2ExN+KoCw2AUij4Qy/K/bW9qDVvIbj4q0lr14Yyb9F2NttiV6NyPaZ2FqTXedIQZJBZE1lyTUVfOA3thgewB6bvAeHp1lkHyzalBKFUsFYuq+t6L1GPkNhf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568936; c=relaxed/simple;
	bh=oXhP19nSq9V9gIPK7p49JTqQS9Nh248cIFDTun6vI78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RuvNI7AzG4+PX0/ldf0u729a2fMJzxwfxvTTwmuBQblpgu2F3o7e6FgL0b1JeaZcmBVzPpyXLCCy0jnHCp/UQmF9BC4B0+BgYBmyzF3CX036Jo8lMutUodZwd+d/HUS2k0H9KEtNuK2NN8cmAdf/9ysq4cGahTTax5SC7lu+v6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gcNCLCsv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so13869705e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 06:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568933; x=1776173733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPqjlgjOWitVthnX/i/FGgn586vKfxcqfC7axGBVgqQ=;
        b=gcNCLCsvstMJhU7Yd6LjAalshRtcbicMDcUMv5j7b9rMrtwjR/zwOWq81lYMq/EoNt
         07wsyRSRbnFH7e7cFi5GvpWG7/QVbzmdG+UQUFx8vwrnquuc5UZW28InAE7ZMJjeYiXW
         OdfICJj17gCNg9MZHJZhKc54KFUlr6G1yoQv8C+fppA3mpjTKeOaHYziluwfScCZnsAN
         zL3E0IJLjyHy1/dnzO+P3Ega8vOOug5Sd2ABqm1vi8Hyt+eGXU9ch3KgGXhpG2TUmV8T
         kVw5vGRC+yLmsK0PBquGlE2X3wF+aEZnfp4eagHig9NgUZQklgdifxYdMFCGJSIoHe43
         tH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568933; x=1776173733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lPqjlgjOWitVthnX/i/FGgn586vKfxcqfC7axGBVgqQ=;
        b=J8ZTyNIVVLAenGQWDiXaSdzX1iG8PC+0xa6RWuKsdfLAIs/M6ZoLVnopOsSy8ZSp5z
         pxL/P+560d4xQT3GIG6X+1TfwMejppk113MhhZ7N5bWQ4P71P86QKq643zbqIandcFGb
         byt0KbspJX7ji2uEZ52WZPoGqZHorKUI8rmz1+zYFWdJVeywTJubwcAOtq4uzxvwvB8Z
         3/ym9W4rDm/epfSxgQc+BUtHvaRtXYBjxEPJbha2GivnIoRU/kqg8sMJxBAhgQCEHfYT
         OxL/g2lQzp47GiEEK9BQqANOb693svgBPpIVkg3uMikIVhcTk55byJmfkLMS903u3VXz
         9Ihw==
X-Forwarded-Encrypted: i=1; AJvYcCWJsPv8wEO1CGP01jzeQlNxC/z98mkr8RKCBY3A6WyCC/0Ev8hMbab+p3/7W2N/t4iMH9l2gI7lY+J+oVbf5PNWGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytEm/xD0UrCTbBScnJAVauYiwa5hFfZsPshBvttu/q6CsG/nnR
	oAVcZQF/Rum9qvtz61jO9wPAXE+dqdISpBmKjgNxStiVlXqf7Jzsa0lgWCX0T9a1AIw=
X-Gm-Gg: AeBDies5HTPGiNIfNr3tFkrF7VDxjrjVRuVzKFvWHeAdT65y3u8nriDowTWOcZXaA2t
	Ecig8vASaMin6NtuUx5MU079q8uiRXhqqe8Vb175J/ROFn4bGMfm2QE+QhtMGejY09/ghxILRzf
	fv3VI1EUQ4o7xxK3OQkucaZ2FeurU41yjFnD479gykD+pEaCpgUB4rX1Ug1imvokdGn7S5tZqvC
	7KD3sK/sRVR9eAPkgjiDzDYRROhv/ivmcZRopw3eSKM0hHSKg+ln6jnvorl+4EE9Xi775D7UK01
	HTD6+pLMly2Bev0ILdFKc0re9zmp3Uc3NdERUGSk2g+FZLdhejYOUjy78Vw2/lUNAyeRg9l/l+y
	5EE4WCUl6XuqwpQGCoUvbmOj70aAOmJ4Hu+Cn54tX+wJAT7+7XP8Mp9C2im7+3hobOAXvoDdwI8
	SVyk1BBwMvB1UbItZdjxhpJdHfa9GOXhqsW514yKyxjXZaRRcXoVZE
X-Received: by 2002:a05:600c:a306:b0:488:c014:34da with SMTP id 5b1f17b1804b1-488c01436b4mr22396015e9.26.1775568933020;
        Tue, 07 Apr 2026 06:35:33 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:32 -0700 (PDT)
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
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 04/15] dmaengine: sh: rz-dmac: Add helper to compute the lmdesc address
Date: Tue,  7 Apr 2026 16:34:56 +0300
Message-ID: <20260407133507.887404-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30923-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tuxon.dev:dkim,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: C34693AF51B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add a helper function to compute the lmdesc address. This makes the
code easier to understand, and the helper will be used in subsequent
patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 34c00f3ffd4c..ef775ffa1099 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -272,6 +272,12 @@ static void rz_dmac_lmdesc_recycle(struct rz_dmac_chan *channel)
 	channel->lmdesc.head = lmdesc;
 }
 
+static u32 rz_dmac_lmdesc_addr(struct rz_dmac_chan *channel, struct rz_lmdesc *lmdesc)
+{
+	return channel->lmdesc.base_dma +
+	       (sizeof(struct rz_lmdesc) * (lmdesc - channel->lmdesc.base));
+}
+
 static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 {
 	struct dma_chan *chan = &channel->vc.chan;
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


