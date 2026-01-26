Return-Path: <linux-renesas-soc+bounces-27413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHfHCKdCd2mMdQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 11:32:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A39BB86FBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 11:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1814230041C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 10:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39E4330B06;
	Mon, 26 Jan 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OCnvDTZC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C718628D84F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423524; cv=none; b=SkOviJVZDfFEaUFnQcjD0oViguR0drlFSaVNkd022nItIXFRXk35QWLmt30jtsfs+esgBeNPy5db6Y2uQvjQMjXUQmccqc6b2mqvevJxwCGU7ux6kkjc/eEbFVrx7uXSqm96egjG0+hRROhXrf6EN127QhggDbCNuDV7b9avf2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423524; c=relaxed/simple;
	bh=U16rA/1jUGQZ9fG7f5p7d5exmM7/IuDWsKhivrvoaec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYA85Wsh6JLH2G5GfjE9GDLeKjAri/x8EqZybZ5dl3j5Ex9JLCoQREVBYi09sGwPtEn3M7sxxsFdfyGelkjwXpvV5kzs1YhR7m/m6W3fjn1BN6zcWmYMdsbUPG4LM0zjlpa3zw4TRv6w0bIa5e10iJaa2biut/g4dsL7Si7ub38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OCnvDTZC; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4327555464cso2891760f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 02:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769423520; x=1770028320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jfU49Y0gQlXueUVYkkOnL1L3MuBtn24WLoDFxEGHGr8=;
        b=OCnvDTZCCVRQuCICxf5TYdTMaCaPrPY41dMDiS8r1KJXW3Slq2weSPrXKyP6oZKx0G
         BTAWZ7P/ZpQ57LnzvKeg/OSoB9Kl98gWWpcxv6DrGwExaAvNzyHOSbQSnOOVx5RPwz7Q
         EZNrzynRekHSpFdptlHDrPUnJgbT/UfJ3xiKDSRxJItnbDqFJ49okecZLvOmxaOon/oz
         8XPWQJDW3RIGuHSQutUUO7rr9oSXZmR2mkVXfoO17SGVQGV4uHRifOfQFR8R5KRvW/uP
         cwJ28VW5Sb95VhvJkKlAa3u69ieLmd32K6IRDFHhBjbTljtm1v0EFiu5alSiXSFqlpNA
         mUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423520; x=1770028320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfU49Y0gQlXueUVYkkOnL1L3MuBtn24WLoDFxEGHGr8=;
        b=fS1JKBK6E1E/o0vHiv5mtz0QhD/gkwqO1WO/1KdSEmbTMtiq1A5fplsi4PF0Wu+M0L
         pMep6QJe2xFSsbz3T9w2fuXwHzRUSL+FNT8oCL0l4s/BlozuOoVAuSF9F0gq5RPP2O1E
         lMMtK32ymaYNiUOX4hqzo2N4oqFeYoIg4fZCxEfFXvicl/lExsSBGoerh7igUvxtcu7g
         lEpwB8lNuKe5any3oc5KEy6cZm8PNW8OAEsgcMhEVVkjMvF/4CB45AGRYRS4fZwRSGv+
         HWFN/wmjLWOmq4a+CL3DkjcbB2uyzMN5RuDCEOIjPdCkFuHG7GwSAvZEJn4LUw100Etn
         Qmrg==
X-Forwarded-Encrypted: i=1; AJvYcCXVyhGfOlB/Coddr8XFkvijPim6BZIpE1Euh/cqaeZn+qRtJgQptiuQB1PPzh4C77P+CE3XNMQMvcOooEEDXX+kcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkr8qZMhELzmx8DN27F+psfT3kqlSCuNurHCov0kPybBM5HIpI
	Rh6pRg6mNtZYvDHwCtUxhp5S6jVL8/myTxkXfrDrk8f53YtpB+JWBsNgQ+YrId5nuuk=
X-Gm-Gg: AZuq6aJbcLy9pQOi6ayfe41mMWm5JWCLUxY/gRST3esaqzBwHZbN5b+J2x66J08a7HB
	iTl2YUrToDEAp2V7n//uClkoQkWEXZU86ShRJ20L35lGRLPbDBwC5FjWY8Mc6Fgkz1nXOqGgFj5
	ynw04gk3R8mU0ydbx88p05Qmeril3FKjAtiLqZPXgpRyHTYlsJhCjSkxSYpsRttRA6vf28i+4qd
	w8vOlzZY3ajNb+ogk8IruylwpZMoft331LOEeMwnTBC/Zwu0zH9ZDEXHdJO3xO9FyXWoW/tP6Gi
	4MNKU5a0ATXFk5Bj0CYmsZy2xPDfDQ8SPP52YAp/zkY9+QT8DaR4uTYfa3tTLu//tyw0HPZifH4
	NwUV4XD31LRao7W47i9vcem8Fja0guK+hmC1NPk1MXRkodJcJwWVVNel4ZSsBFBarpxxMGkZMmg
	DHcegx/XQ2GEZemKneNCk9JbTAckRsLo1pqUd8Eds=
X-Received: by 2002:a05:6000:2304:b0:435:97f6:4f43 with SMTP id ffacd0b85a97d-435ca124882mr5928172f8f.8.1769423520092;
        Mon, 26 Jan 2026 02:32:00 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm29715049f8f.10.2026.01.26.02.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:31:59 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/7] Renesas: dmaengine and ASoC fixes
Date: Mon, 26 Jan 2026 12:31:48 +0200
Message-ID: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-27413-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bp.renesas.com,gmail.com,perex.cz,suse.com,pengutronix.de,glider.be,renesas.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tuxon.dev:dkim]
X-Rspamd-Queue-Id: A39BB86FBB
X-Rspamd-Action: no action

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series addresses issues identified in the DMA engine and RZ SSI
drivers.

As described in the patch "dmaengine: sh: rz-dmac: Set the Link End (LE)
bit on the last descriptor", stress testing on the Renesas RZ/G2L SoC
showed that starting all available DMA channels could cause the system
to stall after several hours of operation. This issue was resolved by
setting the Link End bit on the last descriptor of a DMA transfer.

However, after applying that fix, the SSI audio driver began to suffer
from frequent overruns and underruns. This was caused by the way the SSI
driver emulated cyclic DMA transfers: at the start of playback/capture
it initially enqueued 4 DMA descriptors as single SG transfers, and upon
completion of each descriptor, a new one was enqueued. Since there was
no indication to the DMA hardware where the descriptor list ended
(though the LE bit), the DMA engine continued transferring until the
audio stream was stopped. From time to time, audio signal spikes were
observed in the recorded file with this approach.

To address these issue, cyclic DMA support was added to the DMA engine
driver, and the SSI audio driver was reworked to use this support via
the generic PCM dmaengine APIs.

Due to the behavior described above, no Fixes tags were added to the
patches in this series, and all patches should be merged through the
same tree.

Please note that the dmaengine patches were based on top of the
following series:
- Add DMA support for RZ/T2H and RZ/N2H (https://lore.kernel.org/all/20260105114445.878262-1-cosmin-gabriel.tanislav.xa@renesas.com/)
- Add tx_status and pause/resume support (https://lore.kernel.org/all/20260120133330.3738850-1-claudiu.beznea.uj@bp.renesas.com/)

Please note that the ASoC patch is based on series:
- ASoC: renesas: rz-ssi: Cleanups (https://lore.kernel.org/all/20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com/)

Thank you,
Claudiu

Claudiu Beznea (7):
  dmaengine: sh: rz-dmac: Add enable status bit
  dmaengine: sh: rz-dmac: Add pause status bit
  dmaengine: sh: rz-dmac: Drop the update of CHCTRL_SETEN in
    channel->chctrl APIs
  dmaengine: sh: rz-dmac: Add cyclic DMA support
  dmaengine: sh: rz-dmac: Add suspend to RAM support
  ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs
  dmaengine: sh: rz-dmac: Set the Link End (LE) bit on the last
    descriptor

 drivers/dma/sh/rz-dmac.c   | 401 ++++++++++++++++++++++++++++++++++---
 sound/soc/renesas/rz-ssi.c | 355 +++++++-------------------------
 2 files changed, 452 insertions(+), 304 deletions(-)

-- 
2.43.0


