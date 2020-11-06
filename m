Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF992A903A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Nov 2020 08:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgKFHZ4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Nov 2020 02:25:56 -0500
Received: from www.zeus03.de ([194.117.254.33]:41440 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbgKFHZ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 02:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=XRqsFI+TBaZSXSNzWIKJ47OE5oH
        rQ/g1yLqtLXVF0H4=; b=01IxOaY0E7xvJy09mayENkqMtxWEm/8K/PJ5MJ3awyK
        LJP7NwU9RhAtwaa3iK0wgwoH94y0e+YPWoRudOeM1fp13+3swkHrO9KnChbPVkeE
        Q5Xd0Tp6iHdUjvTw79xyzYAdX0p7Wu1C5+nr5xxMb3SA44gVMuXqPFbZJkuxTNzc
        =
Received: (qmail 858554 invoked from network); 6 Nov 2020 08:25:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Nov 2020 08:25:54 +0100
X-UD-Smtp-Session: l3s3148p1@fhd1H2uzUoggAwDPXwt7AGjsMIC0/1f/
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] tmio/sdhi: fix workaround for a regression
Date:   Fri,  6 Nov 2020 08:25:46 +0100
Message-Id: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After some refactoring, I had to insert a workaround because a
regression was discovered when re-inserting SD cards. Now, this series
implements the proper fixes and finally reverts the workaround.

This has been tested on Salvator-XS (M3N and H3 ES2.0). These patches
were already discussed with Shimoda-san and the BSP team internally.
However, I'd appreciate Shimoda-san's tags be given here to make sure
the patches are exactly that what we discussed.

Thanks and happy hacking!


Wolfram Sang (3):
  mmc: tmio: when resetting, reset DMA controller, too
  mmc: tmio: bring tuning HW to a sane state with MMC_POWER_OFF
  Revert "mmc: renesas_sdhi: workaround a regression when reinserting SD
    cards"

 drivers/mmc/host/renesas_sdhi_core.c | 13 -------------
 drivers/mmc/host/tmio_mmc_core.c     |  7 +++++--
 2 files changed, 5 insertions(+), 15 deletions(-)

-- 
2.28.0

