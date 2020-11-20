Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7C32BABCD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Nov 2020 15:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbgKTO0j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Nov 2020 09:26:39 -0500
Received: from www.zeus03.de ([194.117.254.33]:60790 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726172AbgKTO0j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 09:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=LpB58KixmHKMz4OZYPX+oItXegz
        7CS3wH9n9p6Z++S0=; b=NPK7tvsTxXWkYdVo8JiyK8dV37KDRkcH+nCB/cmj93S
        tJYcOFIgPt240RpXTeflhyE6i1zszkrkZLM3YjxbvMiCxVUmo5LWzUt+FJ3zX7bl
        6iPdvYWB2mmPqgbGtlX8fY+Q8qUeM0OEVkLs+vWykhsDM8vs4YSj+a5/9EtDbHAg
        =
Received: (qmail 1510234 invoked from network); 20 Nov 2020 15:26:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2020 15:26:36 +0100
X-UD-Smtp-Session: l3s3148p1@X2TBoYq0tNwgAwDPXwi7AEBAgYxIRHZX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 0/3] mmc: tmio: honor busy timeouts properly
Date:   Fri, 20 Nov 2020 15:26:26 +0100
Message-Id: <20201120142629.98222-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

TMIO has a HW busy timeout detection which was always running but the
driver did not handle it yet in a proper way. This series fixes that.

Patch 1 sets max_busy_timeout, so the MMC core will not use R1B when it
is beyond the maximum HW timeout. Patch 2 adds proper handling of the
timeout interrupt. After ensuring both, we can finally enable the
WAIT_WHILE_BUSY capability to save the polling.

This was tested using my Renesas Salvator-XS (R-Car M3-N) and Lager
(R-Car H2). However, more advanced testing from the BSP team and/or
Shimoda-san would be much appreciated.

The branch is based on mmc/next plus one patch "[PATCH] mmc: tmio: Fix
command error processing". A branch is available here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/busy_timeout

Yamada-san: I enabled setting max_busy_timeout for Uniphier as well
because I am quite sure this HW supports it and it will fix timeout
issues with long erase timeouts. I did not enable WAIT_WHILE_BUSY
because this is "only" an improvement and not a fix. I think opt-in
after some testing is good for that case.

I think all patches are 5.11 material to get enough testing. Patch 1
is IMHO stable material, nonetheless. I am open for discussions, of
course.

Looking forward to comments, reviews, tags...

Thanks and happy hacking,

   Wolfram


Masaharu Hayakawa (1):
  mmc: tmio: Add data timeout error detection

Wolfram Sang (2):
  mmc: tmio: set max_busy_timeout
  mmc: renesas_sdhi: enable WAIT_WHILE_BUSY

 drivers/mmc/host/renesas_sdhi_core.c          |  3 ++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  4 +--
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  7 ++--
 drivers/mmc/host/tmio_mmc.h                   |  8 +++--
 drivers/mmc/host/tmio_mmc_core.c              | 32 +++++++++++++++----
 drivers/mmc/host/uniphier-sd.c                |  1 +
 include/linux/mfd/tmio.h                      |  7 +++-
 7 files changed, 48 insertions(+), 14 deletions(-)

-- 
2.28.0

