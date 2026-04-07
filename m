Return-Path: <linux-renesas-soc+bounces-30920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLlfEecJ1WnMzgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:43:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 945773AF5C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C70230963A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 13:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9F63B7753;
	Tue,  7 Apr 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HWOcSSbu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577613A168D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568931; cv=none; b=Adhl7ACKRRJgshf+LkImMZ+9RdXeKYzPiqZJFZ8LXM5EGbG94En/CiNGR0Ga1ELMSk1kdxiKeJ7qgjiKaaQYDd/3/CvrM2T9lKiLMbN9vkqmqjQmrSPH+rqf5YtnmWTDkftXxZxdzfhLTA0S3qcuN0Doe3aSiXrtRucEZN2XZxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568931; c=relaxed/simple;
	bh=o2x27ie2cRLK3/IPEfnk02K85UTWqTL0Mqeurw5+xuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ff63XGQuwhMf65CfDXpUvo4AFdQpdsZ60+AI19J8PK+MeN+T99vpZer+mhycb8HhgH8DHUgDFoF7QVD7SWeyhT36rkS1pWj7lqoqq26EXCjNQpUNv9dIOQlARoifDtedp5s4bz+oPp82OFAo3JdxeHNOLdqGToTNU1+UTT8zebg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HWOcSSbu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso38740865e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 06:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568927; x=1776173727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3LJdsgaB5y8vkydWsyskwB8EOPuNOYx+V9eGhmYtIWE=;
        b=HWOcSSbuHU50E8X5N0fRdRYw2ke82F9562zLH/FqwSKBDBmiOoOUfS1CqypkIxZpWT
         9ObXM7ptdG+ioAb7GqDek/zNK0aBP8pH533qOkW49HrRebxGARMjeVya7msSuwP+d0kZ
         TNLK0q6N/8ART6WB40GxogAneM9Ts80JVFakMyCM0+4H5+t5yN3PNHgzKtxYtRYLnFLb
         ZcSN1//kL8f6yZVeSLJIoBNHq58BhpSJYQNk8IuiSGRIGIUjYlopUBWSwwmypOOZAYpU
         SJ7pTQw+PKveEkn8xDvz/gRHj0c1AzdiWGga1nI+ie/Vr6PjRcMP+cJYxs5Hc/Aiublx
         MPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568927; x=1776173727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LJdsgaB5y8vkydWsyskwB8EOPuNOYx+V9eGhmYtIWE=;
        b=OZJ2mFxRG8ZOE5ZLP71FGFdo9rjx0dstL4SV5huvM2WHzY63+DfT/xQMOkSCdR5FaZ
         +1Sd0HtBUEBED1w9gfi//EEi3dOZaisv0yeZZ0BLAoaU1kQ14eOB5GoOWDZtnO1OdWQs
         5kqqr0l5vYs7/MtnLAn36JPYu+ozOBTAylMtpwuRg0TnjrmFjHLeHow2IW7n0nYzINuQ
         Iyi6kbPD10zJUGo5DMZGL0LxkgZ09bNc/nxJQP/T0ORh+oPx+wSpic6Wqaz5R8+KOXmP
         TfvSTa62KL8yGFa+WCppQNo5CNiTOzdsPaD8gVjrGF/IR9uOACM9nqjsCTtzt8D7UzDe
         DjDA==
X-Forwarded-Encrypted: i=1; AJvYcCWHYGZcDEPT3QG63I0UXYOLTnej3v/6ILskNjJIi3zh42NaqiPsAtjv5yfixksqffqXGkTJDUaaoK48yEOi4FljPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjLh6q7fsGkjoR9PGt4kfkGSlNOD0vDB3VGbdig5FVZXHr4frV
	9ApDVvPhztkxEC1jA3E1n4r2sOJAWJT7+G9Jk6TIF3a8K32CELRos5+cYNh0rBa/1mE=
X-Gm-Gg: AeBDievy7ax5YjSAbb6J6Aq/Ofug0lBwoqk9is6A0BTsIMOBH6zIeAgQExDh4GhZicF
	Iu9vBOLdz350RmBaK/n8QlJfpAqWGFM6WE9n9q0ba8d05GRdltU2ryZL56Clikbtj/JDhLGsW95
	wIVWZQ/7ElDd+xefenMfWQ6TEljOYhl6vc1At+441wSG1y/y4bQyrfhvJIrlbBm2zH05pvCIaiH
	gGIBT9ZgCpH1xfo8IamA0MDj5nXlAaCjZvDWlBa3uElEjtUKwxwASO2N+i5Xeq4/5bB6ZnwNNpl
	N7ekotkBJixk+GMGgv4JrMYVvibU2rh9c+ZvF2Rwk0Egd6Im5sDbMslIwNcPJkeEsmgKYSY+VK2
	9YTc9kLLQq/OJVfVkSsENbZ8wNZ53iqfToiV+cIc7wDV0EtE8zhb9dyhqw0wE5fZGGY24c11Ce1
	txboOMP1tk0h7lTwLDY6AUxFFlaKwQY6cJd873EPCUvU7PkE21Luus
X-Received: by 2002:a05:600c:1e24:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488c078f73fmr30084395e9.26.1775568926571;
        Tue, 07 Apr 2026 06:35:26 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:26 -0700 (PDT)
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
Subject: [PATCH v3 00/15] Renesas: dmaengine and ASoC fixes
Date: Tue,  7 Apr 2026 16:34:52 +0300
Message-ID: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30920-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:dkim,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 945773AF5C3
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


Claudiu Beznea (15):
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

 drivers/dma/sh/rz-dmac.c   | 673 ++++++++++++++++++++++++++-----------
 sound/soc/renesas/Kconfig  |   1 +
 sound/soc/renesas/rz-ssi.c | 375 +++++++--------------
 3 files changed, 599 insertions(+), 450 deletions(-)

-- 
2.43.0


