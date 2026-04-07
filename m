Return-Path: <linux-renesas-soc+bounces-30925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEuYNJwK1WlQzwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:46:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC333AF694
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 907B330BE5B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 13:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8043B8920;
	Tue,  7 Apr 2026 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KTGwgILD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B743BA23B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568943; cv=none; b=C/MmUqpFFsWU3l6o+C+hEH+J394QPC/4bke8p7AkLslm5V1xz+scOHM0QCcGx6vyNp0HsvanKl/cigxaOQYC7+PtQtREL9S+EKVcI/Hf2PnI5OF8TaiDO90EmQJbwz3az7ePMMDc4if/Z4XSUXTcwU7B6AGslrdvhohYCJaA9Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568943; c=relaxed/simple;
	bh=846/G+q0odb/qHiylGwqi7IWwj+WluQVAmidDATN+IA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sM4oFHfRD0K6C7838BZIexISCE/qw0ttQh6fDtfTFUvBWw3yEC8lRNa6F/EbqL/Xmz6E1rsT9ebBX7eDb612SFZ11zXgIVHDRAnVlfztiV9kJP0X0koiWTVgnyQlAoBdV6upNxMTogCIf7h3DaB2kVfoM3NpbYjC+CW2rjNO8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KTGwgILD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488971db0fdso38989735e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 06:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568937; x=1776173737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvTNlf06Jd01xZueOACSzZsQnBl2OBrbZ+zRfuhxAX0=;
        b=KTGwgILDEsFR4Qy01Kxs67nY8O6bkQ2jt5y0r9/YJ/AVZWXA9+wNi1L5BPXeulFNxg
         qmyrnsn2lZCgmOT5Ro/RrrtkAB230kiTMrXVFi44ZvC00TM2xX0jms37xol/KzJbNiaJ
         Sn0kDq5AP1DPs/8KF4+9TqqLrRJU7b1EEEwyj+nhbsUSxoN4Za2bEOfcKDsDNsKnb+E7
         bB6GdUluY09OuMnG9g4w4xt3GFmmmKJ2X4/Sr5LaPu0tT8FzDNBMMT+4ReAIs7ZQlM5x
         gjRg5Zfxc4CflvdCoMn9JutoAaj34gNpinpzTTWsPxWxbg8UECh/jv81NtI+finlm4rh
         K5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568937; x=1776173737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CvTNlf06Jd01xZueOACSzZsQnBl2OBrbZ+zRfuhxAX0=;
        b=euX7hK5lJP0Aj3qjJ63rpJqmY06tWUoe04Yoft10lzBP4hGdHU7Mclcr0McoW+djgj
         KUNb1iWNaWBfUapSKh6dKH2wrlS2nYEaud9GpnwtFcxkovqE8X6nnXYuU+e+D1Rlo9YZ
         xTXMWty/bgfQmqwjcON+yRFAz2dMsBsu25ajqqljDfDYZxtfqyqetKxyYbtqX7tg2RRt
         ldAXQRvqJ0Mtr06QSZUU0qZgQ0PEztBNbjGW8JnknMrdZjBfNLzYqKk3gUU5QHOnh4kC
         bgqNLmv5MzXf1OMmOYoRQgbMTpmkLQ2tkcZM+9TQWq4peu37DwwGSUPsZY1s2P/sCRua
         oKxg==
X-Forwarded-Encrypted: i=1; AJvYcCUdVyA4vbFXws9ssYe2qMicpTBc+TSvr6g00IxpZ7Tciu2vbn5FkIJTscxhlCwCyxWKA/OyRLSWVw3gMok5jTnsSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKFPgf+aiPgohnVEUspigsY04Xb/g8WG7HekzAwyK4C9DS/AKf
	Xq9/TobmLU7LyseAys1HL41kW6/U5d+PiyDxCjR5Tdp1SZnlNtZuJAUdOn5NSvcG0go=
X-Gm-Gg: AeBDieuylEidn8lU9OudmiJeG5f1KWEGedqnqusfFYWyfXn6UeD2uALXQOo0Ew3isef
	PygL+SbsS5kR7Kvm/WGOodYG7TPOXbKKloyIFEskIyiKllXRw7aSfO+fuM0dyFyYXSXOLBk8Rv7
	RuoQHqCAfJD+uOHY2xXCsVra4SIUQr7BaKAQzqTe4ScSTfDSPY6BvcjzpHJBOjUPV9669j9FuKo
	Ho86vP2NdiBoPrGDZQYIvli0zo1QSfjFnQV+IEkYMObEF2Ugx3G+803DXp8mUJ2ZH//1GcbfEJH
	O0i18ESTis5liu01G73Hh0sq1ex4QdVgFPFyX15XWqN/6sfP3MK1sLDLFekhHsoDo+7QSE8UIMZ
	a3xI2I69BBavJV8brvwACH9ZV2+pjB0/WeA4y7aHR+DhIKWJTf81wHUaXaM5p5j+EAATLIfbSMg
	WFa7xN294FscWe/pH6ULLCkqvtOq0fsgXZj9dor2CpV2+Zv515iMxj
X-Received: by 2002:a05:600c:638e:b0:485:1878:7b8c with SMTP id 5b1f17b1804b1-488997b21e9mr238767795e9.18.1775568936903;
        Tue, 07 Apr 2026 06:35:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:35 -0700 (PDT)
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
Subject: [PATCH v3 06/15] dmaengine: sh: rz-dmac: Add helper to check if the channel is enabled
Date: Tue,  7 Apr 2026 16:34:58 +0300
Message-ID: <20260407133507.887404-7-claudiu.beznea.uj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30925-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tuxon.dev:dkim,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2FC333AF694
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add a helper to check if the channel is enabled. This will be reused in
subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 10 ++++++++--

 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index cd639aa9186a..083e81c07aff 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -279,6 +279,13 @@ static u32 rz_dmac_lmdesc_addr(struct rz_dmac_chan *channel, struct rz_lmdesc *l
 	       (sizeof(struct rz_lmdesc) * (lmdesc - channel->lmdesc.base));
 }
 
+static bool rz_dmac_chan_is_enabled(struct rz_dmac_chan *chan)
+{
+	u32 val = rz_dmac_ch_readl(chan, CHSTAT, 1);
+
+	return !!(val & CHSTAT_EN);
+}
+
 static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 {
 	struct dma_chan *chan = &channel->vc.chan;
@@ -840,8 +847,7 @@ static int rz_dmac_device_pause(struct dma_chan *chan)
 
 	guard(spinlock_irqsave)(&channel->vc.lock);
 
-	val = rz_dmac_ch_readl(channel, CHSTAT, 1);
-	if (!(val & CHSTAT_EN))
+	if (!rz_dmac_chan_is_enabled(channel))
 		return 0;
 
 	rz_dmac_ch_writel(channel, CHCTRL_SETSUS, CHCTRL, 1);
-- 
2.43.0


