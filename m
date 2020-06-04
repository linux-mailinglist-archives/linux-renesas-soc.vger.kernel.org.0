Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DED11EE34A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2020 13:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgFDLUx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Jun 2020 07:20:53 -0400
Received: from www.zeus03.de ([194.117.254.33]:58152 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726990AbgFDLUx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jun 2020 07:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=qPyIgXO6fYmlepctzZg1Xnpmxe9
        T2ol8nuKpMrVgVbo=; b=Nt4CqCc8VVJ0AbwyzOVw+FYs63/I6smkpFLJbFIqCp3
        p22PtrNl09FHDbQ3kXwsipxFKdSoQCFRrcWm2DWmtmtx/QWYjwIp8mg4VGmQJivh
        HdgGzKGh783ljXiArbVQ4TOLE0BnbzJJ4QjTBe2krhq4QeB2FpJkVQJPzSqpaoas
        =
Received: (qmail 1656118 invoked from network); 4 Jun 2020 13:20:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2020 13:20:50 +0200
X-UD-Smtp-Session: l3s3148p1@mRxIVkCnbuUgAwDPXw1XANux7yWtmp4Z
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] renesas_sdhi: fix hang when SCC loses its clock
Date:   Thu,  4 Jun 2020 13:20:38 +0200
Message-Id: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This was a nasty one because it wasn't reproducible for a long time.
Recent work on the manual calibration mechanism made it show up again
for me, so I could finally tackle it. The reason is that there is more
SCC handling now, so we are more likely to stumble again over the
problem that it may have no clock at that time.

There is a patch in the BSP handling this issue, too, but it didn't work
for me on at least v5.6+ kernels. Also, I thought it is way simpler to
keep the last working external frequency instead of defining a default
one per SoC generation.

Patches are based on mmc/next as of yesterday or so. You need the
'manual calibration' patches for the issue to show up. They are not
fully tested yet, so I will send them as RFC in a minute. Or just fetch
this branch:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib

With that branch, reading a file from eMMC works for me(tm). If you
prevent 'keep_scc_freq' from being 'true', then reading a file should
stall the machine. Happened here on a R-Car M3-N to me.

Looking forward to comments and more tests.

Thanks,

   Wolfram

Wolfram Sang (2):
  mmc: core: when downgrading HS400, callback into drivers earlier
  mmc: renesas_sdhi: keep SCC clock active when tuning

 drivers/mmc/core/mmc.c               | 14 +++++++-------
 drivers/mmc/host/renesas_sdhi.h      |  1 +
 drivers/mmc/host/renesas_sdhi_core.c | 25 ++++++++++++++++++++++---
 3 files changed, 30 insertions(+), 10 deletions(-)

-- 
2.20.1

