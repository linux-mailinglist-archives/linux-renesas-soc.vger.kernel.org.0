Return-Path: <linux-renesas-soc+bounces-31166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJNqGdcz2mlezAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:43:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C37A13DF86C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8E353029A57
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 11:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97097340DA6;
	Sat, 11 Apr 2026 11:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JWWGFkez"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156643358DA
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907792; cv=none; b=qmS/QaJq4Y6nepr2zK0OuG22EbtvteHNzSW+QNUBep2RRYmbKUr513xuTem8fg+Yn/dgqcSJi1cBdqScjkDKuC6tnG2xlgoQkh2nRl244nvBIZSJDNcvgWVhopGCHxqwWYS44ASM0iJbKBqkX+EhyyUbRwbOvZ3pxnNXJ72CPns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907792; c=relaxed/simple;
	bh=cKFhAtkhgAfTA+QAOjsxsnhy2l5B7v8pbAd2rbghqwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjHcdNseQOVt91lyTu6IqbdnVXkUplM+4LspLrbi73NgxWXXPrgzFeJkrluOOwVMj1PgfOWuuDbuRBxzD56hBI9lZhNfgPlyJLxfPgJSho30qkGePaStmi16QnupI25Hpe5iIxgkfiEJplCaAH1lAgxy0KjumDzte1Y6AedO4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JWWGFkez; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b983bb07eso1851589f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 04:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907788; x=1776512588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q1eTBRD7MumKinxlgMqLdQk94b4xlHoIm/BiwJmzTkc=;
        b=JWWGFkezFo1yDEDecIrZLJjGK42Vf6H9fJniOzTftW34XHdA/KSdoKkGZvuElKv+MK
         Z19IEKV0IhAz2eXIQgf6cGCKVsS0oOiXeiP6g0N4f0cFTvzm9Hkjv4ZPhV+fRLwJJRKR
         zB4ZQKF0KB3npU+CZIH4inalpg6wwo2QjR9N1ooDJQAGhbOnqBIt/VTKPQhxfuszUrK5
         rhnXJrhiXOfxtQ6bo1DJ+BRJPid72SP49oiZJYa2T+bHKmkx7sVULLPjCYrIOD7W1/GO
         /oG1IhGQ6c2yX5bW3YUCJ6XvhVFkUkMjO9yuWxAo/ic37ZB/++rRM0J7kTwlejMxpJxn
         hPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907788; x=1776512588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1eTBRD7MumKinxlgMqLdQk94b4xlHoIm/BiwJmzTkc=;
        b=I2kGftcVyiSAu8htIv00zlATQftCLgebioUf3pAkO6Qv7ACiQy9Cqo8gnqFldKWM0M
         sXTHx4KNHbQX74seRN4E68N+d4rWRz4mkehW+9dZ1CRHNnUkCOlLaZ17lVubwOr1ZOno
         I6R99nnf/BIJKmQTXVveKAjT4gKonoFbrryzFWSCZbzVAsdb+dsmdqNxT+bsqTlLuKjE
         LHLvao+pD3t65LFGSRYMwFG3xumvaj3EwdILlTn/nFhqgZ5GQpcvpMCYkBfMHVO4aLWM
         +opfigmQbVjQDCFNf2Vn+xw0XCtWMFMKkeRNnwMdYsb7252ROAOJlT6AECAcAySbTecB
         JItw==
X-Forwarded-Encrypted: i=1; AJvYcCVYUGYbhnNaTyRpnCapLhMQwZ7oRymVP/UdZ4QVP9bmGVjGnjMAk/2pH8nrThDT/BQ/rjuPXpQoqAVnsbdpQnY39g==@vger.kernel.org
X-Gm-Message-State: AOJu0YycEUIYQDZ5/vnETMo8JytgdQiiOxJZIHn4XBIlm3vSaIpJ0K01
	7n9F5ngCuub6ZdGHiTAQKqPWwcwe6Si2b78fLECH2XDCO59jNtTo1fa+ktqq8dpPMqM=
X-Gm-Gg: AeBDieu3+p5yshXu1lMkaffaBHnPSwhoJ4E4ecR1E/jDhqs/pXkJOZE/S0g9WWRwpbf
	lIzS7/zRvB8RbnN1AhrFF5tg4uYAgAB9PKn/1b+KfxIz640l41ew5ZtVn3GUWymUFNe6gb6p/YI
	FqI4rvUiarFXeigpTc5vt5sKjWOnqBLwFx56jGEmgbHXi78CywwFe5LFg99b8m/sqsh5bGiOJ96
	zVrJXr7Sk8n9BzKzxk8FA5YR1eKqaIsrrUv8STvyw9DVDbW91l4afufIQVzBnnJycNYg/eLMVWV
	6vOO7Au+S+EDQ4qWwEy1cWP6RVkgPqE2XLTT5M5lKJOBqAN6ZayV6kx4XQFB6CRTInQBUTvIL8r
	TqDFsH9cafBuRnfwVl81JHL8f9L9/prFhu0ig4phHe7K6Sm9ABPVpysVmRUZ6nFj68UStgBIs3Z
	IjP/Ika08YcO4YV8Aqt0/ulYVimUnDXlQhOIA1dv3itMzYY9PxmowN
X-Received: by 2002:a05:6000:3107:b0:43b:3e34:7fe with SMTP id ffacd0b85a97d-43d64289402mr9860136f8f.21.1775907788294;
        Sat, 11 Apr 2026 04:43:08 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:07 -0700 (PDT)
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
Subject: [PATCH v4 00/17] Renesas: dmaengine and ASoC fixes
Date: Sat, 11 Apr 2026 14:42:46 +0300
Message-ID: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	TAGGED_FROM(0.00)[bounces-31166-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url,bp.renesas.com:mid]
X-Rspamd-Queue-Id: C37A13DF86C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

In case this series will be merged this release cycle, best would
be to go though the DMA tree as the DMA changes are based on the series
at [1] which was merged on March 17th. Otherwise, any of the ASoC or DMA
tree should be good.

Thank you,
Claudiu

Changes in v4:
- collected tags
- addressed review comments got from sashiko.dev. For this:
- added patches:
-- dmaengine: sh: rz-dmac: Move interrupt request after everything is set up
-- dmaengine: sh: rz-dmac: Fix incorrect NULL check on list_first_entry()

Changes in v3:
- addressed review comments got from sashiko.dev. For this:
- added patches 1-9
- added patch "ASoC: renesas: rz-ssi: Add pause support"
- dropped patches:
-- dmaengine: sh: rz-dmac: Add enable status bit
-- dmaengine: sh: rz-dmac: Add pause status bit

Changes in v2:
- fixed typos in patch descriptions and patch titles
- updated "ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs"
  to fix the PIO mode
- in patch "dmaengine: sh: rz-dmac: Add suspend to RAM support"
  clear the RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED status bit for
  channel w/o RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL
- per-patch updates can be found in individual patches changelog 
- rebased on top of next-20260319
- updated the cover letter

[1] https://lore.kernel.org/all/20260316133252.240348-1-claudiu.beznea.uj@bp.renesas.com/


Claudiu Beznea (17):
  dmaengine: sh: rz-dmac: Move interrupt request after everything is set
    up
  dmaengine: sh: rz-dmac: Fix incorrect NULL check on list_first_entry()
  dmaengine: sh: rz-dmac: Use list_first_entry_or_null()
  dmaengine: sh: rz-dmac: Use rz_dmac_disable_hw()
  dmaengine: sh: rz-dmac: Do not disable the channel on error
  dmaengine: sh: rz-dmac: Add helper to compute the lmdesc address
  dmaengine: sh: rz-dmac: Save the start LM descriptor
  dmaengine: sh: rz-dmac: Add helper to check if the channel is enabled
  dmaengine: sh: rz-dmac: Add helper to check if the channel is paused
  dmaengine: sh: rz-dmac: Use virt-dma APIs for channel descriptor
    processing
  dmaengine: sh: rz-dmac: Refactor pause/resume code
  dmaengine: sh: rz-dmac: Drop the update of channel->chctrl with
    CHCTRL_SETEN
  dmaengine: sh: rz-dmac: Add cyclic DMA support
  dmaengine: sh: rz-dmac: Add suspend to RAM support
  ASoC: renesas: rz-ssi: Add pause support
  ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs
  dmaengine: sh: rz-dmac: Set the Link End (LE) bit on the last
    descriptor

 drivers/dma/sh/rz-dmac.c   | 762 +++++++++++++++++++++++++------------
 sound/soc/renesas/Kconfig  |   1 +
 sound/soc/renesas/rz-ssi.c | 388 +++++++------------
 3 files changed, 652 insertions(+), 499 deletions(-)

-- 
2.43.0


