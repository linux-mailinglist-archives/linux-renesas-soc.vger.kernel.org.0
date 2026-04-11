Return-Path: <linux-renesas-soc+bounces-31171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBSJGQ402mlezAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:44:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1900C3DF8D4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD9F83030B2E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 11:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2FB340293;
	Sat, 11 Apr 2026 11:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ld2ZFpE4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E863D3446A3
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907800; cv=none; b=FGBr5KTRewNNzLIKIhO7ZnMX+sOZSFk/+1DoKsiwfuSCsreKtXdzW2pKkAf+ewtOo3GUqLAHlZA5XUtVDX5kVvH6Ky5rXQbDqjKuFR81yksCO/gS0sYKSPfADpplwLh5Cr4vd91ijFdhf0bNfOK5BYr2blb7Z1z2FqFaXLy2ScM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907800; c=relaxed/simple;
	bh=FswV1zMeTY8mzOC5mjgtkEA10SnivHgCzyn5u3OdJMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V1Uo3Fcqqf4Z5ekxV2RTCI2gegzE1emt4v1Jt829/2V5CPKv6N4ppFmQxy9tvyehmZkAktI0HjC54d2yz70DaISHctIHfD38ie+4sYWr+zCEsA72pysDlnHrIet3VPa7owaKntskUmEwAVf4VZiMqHomFCsdfn1anP1ctFd2844=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ld2ZFpE4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d02a71526so1785278f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 04:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907796; x=1776512596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCFzuE61zyUmhYiJf5OgZu1cO7csJ6djKP2u11HWSmA=;
        b=ld2ZFpE4uncheIVERSHKOhXIRdBq4yjwrpLJj2XQt8Ji5hZDw0Zr83nHwaGArpiIfy
         jFy4kRt+36wjatPI4mYL6u0NBWa9vCCw64BI7T3cpZxQp5mWbsB8U4wmdHT1PRgNCEfd
         b3Gg5Wgm0QzBRnoygAQeNJanEuByJO1EyywBC/o0vAuE0MDhGLxYL3KJUp+9TIKCNwcY
         mU0ycjpu9fwBgW2PCV/OhM5bU31usxQ3a1qYiYbnc//wEf3rl1Iz/vMiCqSow/8/D/8E
         9xQ2fWACX4lH59mSB/SjljTOs2/Aw5olXhbAkr7sz0U9kFF8kgtTwaqA9F4ippFfukcW
         cJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907796; x=1776512596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LCFzuE61zyUmhYiJf5OgZu1cO7csJ6djKP2u11HWSmA=;
        b=ZZ0UmRMOjR/KHXLVIFWXAqxqOfQ9COcDWVjMN6mWl7ZNe9XXUAINPPxJ+OWLeLI7C8
         rQ0NdtkyUxJmBUzADk+vqTpeEIDIi5VOBcRm1t1iAclhZMHQ9+TgFiPEjCtEGZJGhUgw
         G3xzZNuvZ5H90W7BEJdCJl2GKFPpGW1u0P8hLkdsgUv5GyQ9PS/35bqqZVinLKm0wk+u
         jX8AdRs0RqEtGBUzzM40gIlxZbdjtNTU7cJGiMVbC90f3hgy0ip2Av852QXjUdf1kfD2
         JSgcKDyUGc9Z7h2RdD2eE8gBoaLJnLwAWLIJG53I0PXRWEBMXpkf8GyunaMwzsNKv2WI
         nyPg==
X-Forwarded-Encrypted: i=1; AJvYcCV9Cfzq64xw0Eq6HrzC3Yy9xVB5QVjoR/0uRcrUIpDZVKDmTyYQat1/h+o0xzzd7Z4m/LNp9biiJGGKrP5A9FwufA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeeKUyOTZ8fjFLBaqO9UV0nHkdye7dXA8aCXMBq4kCv0jfbjeD
	LOEUA5F1YJW2H3xEJYOzd42RQxGKx/wQvcKAur5VyUjkmd3XJL8gyRb8pYf97knfLTs=
X-Gm-Gg: AeBDietAj+0NH/u/T8gzm/07MCuvOKKMoLlDPpsuXvrptLrCkPD7Phw/2e2U3GfZ/Qq
	itFGMpUxG2jUMDRqsRR6+LwuJwTuXqzozoJRtvJVxiIcJaWSBYi8F9PfOiqY1XpLoQHcHljFDD2
	yy1QOQ2vnMRn/gs/Wgzcdi91awd7TqJnMwHGug3XDZdnOG/uMOrWzkY+CWqim6F5uInwJEXl5Zs
	cgamNBxiFmtud4GLE4r+XZHrUdUQYyOup471ISnwQo3VllK05EBlUvoIU8LSO1jiITCIfilhZer
	3ydRtFM/3tmHrKW8/6wnTj98sulKQuNOxD8uXR/+WssBzdfUIA97kbwH8eKkTpKk7ei1p8zIWwr
	zeekwtFVR9dm/VV1mZApT2xJGRfuGo1Bm2MWamOLlsFoaYNAfBvi6ObNxKkAdW4fjTb2g+rbLLE
	na5AqrGBHlI2W9CrdJeJoaJ4U/ElXplfSkZUdUs0b0mDuVS2Bc3Tmw
X-Received: by 2002:a05:6000:26c4:b0:439:ac6b:dd38 with SMTP id ffacd0b85a97d-43d642ab99bmr9178051f8f.31.1775907796358;
        Sat, 11 Apr 2026 04:43:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:15 -0700 (PDT)
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
Subject: [PATCH v4 05/17] dmaengine: sh: rz-dmac: Do not disable the channel on error
Date: Sat, 11 Apr 2026 14:42:51 +0300
Message-ID: <20260411114303.2814115-6-claudiu.beznea.uj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-31171-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 1900C3DF8D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Disabling the channel on error is pointless, as if other transfers are
queued, the IRQ thread will be woken up and will execute them anyway by
calling rz_dmac_xfer_desc().

rz_dmac_xfer_desc() re-enables the transfer. Before doing so, it sets
CHCTRL.SWRST, which clears CHSTAT.DER and CHSTAT.END anyway.

Skip disabling the DMA channel and just log the error instead.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 40ddf534c094..943c005f52bd 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -871,10 +871,6 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
 	if (chstat & CHSTAT_ER) {
 		dev_err(dmac->dev, "DMAC err CHSTAT_%d = %08X\n",
 			channel->index, chstat);
-
-		scoped_guard(spinlock_irqsave, &channel->vc.lock)
-			rz_dmac_disable_hw(channel);
-		return;
 	}
 
 	/*
-- 
2.43.0


