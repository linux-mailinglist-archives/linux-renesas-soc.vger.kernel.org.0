Return-Path: <linux-renesas-soc+bounces-31175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPiPNjE02mlezAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:44:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE723DF8F0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DD8D301223A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 11:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B0A3537DD;
	Sat, 11 Apr 2026 11:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="d3kytsCz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C16344057
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 11:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907806; cv=none; b=Qrk3mZbMVrPrEhnMTMYQcMQB7/GIvP1lxJYPs05xJi3qBBqYjUec9EjxvEqIVj3bayrTK3m6D11IOYqxJ8wCO3/InN4dKkiO/O/9QGZVXuolmtQ+CwzW+s7Po03mUiHxUvKQ7aBkfG69izdgCTehiKJtEnUCoO7iKvZyNA8yhTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907806; c=relaxed/simple;
	bh=kYxxf7UrOo/ylG412SxsscyOsq5s+9b6o32cDo3KE50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5Pghitvkd//anKeV/SwnhRmt9ErslLa8Vd/QEfYm/NAC/V/J4r8eFEJ7OPGH4b5RdauP7hQOavvI2+TO2tbFBfFA5aECLAFtUFbiZZUo2l+Sp1qGlg/uWDuUV0UOc4i9OfLJ094ppQfI1zzWXwm0KrPsNyxf+d/blzq/3TK0y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=d3kytsCz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cf906b007so1739784f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907803; x=1776512603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6HUr1gtJuXFA7idjOAe9L67Llkodm8s1OURzQhPdNQ=;
        b=d3kytsCzByQoV1C+S3h7V6B7XxGwePoepa3dKpEVrSoRCA3vWhJ1IcCcWaVBOP1gcL
         jlD0Oe9LoaCBkBx+HOuFGmRNq1aRs7hJSE3cfYH5do0R7xXpqpbf2zzquHkT3ruFJFMn
         onxfw0WXIMrmyXgVTK93gmKAUlUC+JUzjNIEa3Mkfkt+I1brd+adcSD1UHaBaH7rCChi
         toseYi5Vvex7AcqtXCGXEr/a/UbFf1gTytobSXHOFkb1GDs9jRI/UsfnPB1YSt5zE7Eq
         92sdt9OCcgmqovZXfFTFZ7+heN6CbS7HAS59vKtnHeCgQfwoqCY7JrudVUSyH8tDQuLx
         Q/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907803; x=1776512603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y6HUr1gtJuXFA7idjOAe9L67Llkodm8s1OURzQhPdNQ=;
        b=YVQM48+0iH8JfxA+rQqezR6gR50SwVNwkZ56rZnWGWkqObo9jEm8zo5hqqvOsjIeAF
         WRMiDI9guSlXjrAvJowBn741E3wI/QVYe3CteGFcJLxpNhmTwg03fUY4lzOH8p1kBVER
         unrG2tBl2BlwqTyEnjLvi2w4d0YuzBwrHcS2xC3aNoExzqxINf9yydqqskqUvk+awvk7
         wmZt7u055edn9vj+ZVw+7iIRskrry5WrPMJd97/e5hxNkhg6yvPTQXjf4BYykZucpTJb
         9USJjhBPww3gLSDLFJGNXzkcDte1GgfEvPDlUp/rvTLo/te0Oh3O78uL4H8XUU2P3Q4l
         yevA==
X-Forwarded-Encrypted: i=1; AJvYcCWaNC62CWoaxvFtb1seaxPpZfRNmgzP5QI3UUnS0CYhZFDeERRlNxuEQvgwitPPDbfbJ+i+0ZNnZraBfVMnoqFsOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5e+QPKgg+Co4448FYjdZUqIwJLq1HiaajGqevubdH3i3Frlbz
	OB/VLLjVLw3dyymv1hdQNopXlXO2osBo01dvMVNNLpfePoR9ftbYAtwNPFGGEsqMZeg=
X-Gm-Gg: AeBDiesmeIrrFNm2aUZkaJO2iFsD11kjhd3Qimw2e1k7W8eIyPqziCIR4pWi5bj3Tpa
	bch+XK/onSbPK6A4SvOlr1ABj6yULd4y4Lz0F9D0SR2AT0usjSwVOXednmZRIiHfcC1UM4F/SrQ
	jaTf0gydN8rGiTef/zc5uK8yGqo8T87i6FySPWfhNZS83zqg/9B/A5bwi3vLA14dQ20U4m9kx3M
	gasfqjblO1dGp8ofShyxH2dnYcfAULbvK3oxKAIywRwICiUXPQvzmD/EQhdivBkDLw42XJpBOyZ
	W9pSJV1aGpLsoGQMBGAtkWP47s1IxZQcDL9cu+ij7wahRfMi6H1mwqKuKjUlhFHhjRnvfJS3N0Q
	6pO4iYbOVg5eG8qHxiVwqcH0VQ1asl0cdZADxAK0vWuH9rK3JHQINfBkspaHzZuMqm2cVCt+acB
	baff6XooZvU2RRueKzGPHK12XWPQPts8gfCnYI+co6g3H4kWo+gLfo
X-Received: by 2002:a05:6000:3108:b0:43d:1c7a:8b5e with SMTP id ffacd0b85a97d-43d642c13e0mr9680005f8f.35.1775907803295;
        Sat, 11 Apr 2026 04:43:23 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:22 -0700 (PDT)
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
Subject: [PATCH v4 09/17] dmaengine: sh: rz-dmac: Add helper to check if the channel is paused
Date: Sat, 11 Apr 2026 14:42:55 +0300
Message-ID: <20260411114303.2814115-10-claudiu.beznea.uj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31175-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,tuxon.dev:dkim]
X-Rspamd-Queue-Id: 7FE723DF8F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add a helper to check if the channel is paused. This will be reused in
subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 1a3c33d28c6c..f35ff5739718 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -286,6 +286,13 @@ static bool rz_dmac_chan_is_enabled(struct rz_dmac_chan *chan)
 	return !!(val & CHSTAT_EN);
 }
 
+static bool rz_dmac_chan_is_paused(struct rz_dmac_chan *chan)
+{
+	u32 val = rz_dmac_ch_readl(chan, CHSTAT, 1);
+
+	return !!(val & CHSTAT_SUS);
+}
+
 static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 {
 	struct dma_chan *chan = &channel->vc.chan;
@@ -822,12 +829,9 @@ static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
 		return status;
 
 	scoped_guard(spinlock_irqsave, &channel->vc.lock) {
-		u32 val;
-
 		residue = rz_dmac_chan_get_residue(channel, cookie);
 
-		val = rz_dmac_ch_readl(channel, CHSTAT, 1);
-		if (val & CHSTAT_SUS)
+		if (rz_dmac_chan_is_paused(channel))
 			status = DMA_PAUSED;
 	}
 
-- 
2.43.0


