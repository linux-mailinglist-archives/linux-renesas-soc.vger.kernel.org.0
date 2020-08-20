Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44B2E24BE76
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Aug 2020 15:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbgHTN0r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Aug 2020 09:26:47 -0400
Received: from www.zeus03.de ([194.117.254.33]:47834 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730698AbgHTNZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Aug 2020 09:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=IEr/z9eWHiLHfeGLCjGp4ds/63m
        IbjoQOjaSLyB+RLw=; b=S0zykcTdJkCLsCBq46hPnvpLGYLymca0HnbpfelZJhJ
        bVMpQbejZdHK7OPhWYgzgPvhGxmvhfkKgXCg8CXIDuYOnwt7Gw5v2JwKkb9POwdT
        ild2v4lIyD91e2SY1rdOZB5Jg6I7Yo6NOY3yKquQMgL3xWHxbkmF+xOrgE6T1iv0
        =
Received: (qmail 560003 invoked from network); 20 Aug 2020 15:25:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Aug 2020 15:25:47 +0200
X-UD-Smtp-Session: l3s3148p1@jmLdDk+tKJggAwDPXwuPAFbD76CDVWXO
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFT 0/6] mmc: refactor reset callbacks
Date:   Thu, 20 Aug 2020 15:25:32 +0200
Message-Id: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While debugging something else, I noticed that the SDHI driver
doesn't use the 'hw_reset' callback as intended. It was used to reset
the tuning block but not the remote card via RSTn.

So, this patch series fixes it by moving stuff to the reset callback. In
addition, calls within the TMIO core are converted to 'reset' and the
'hw_reset' callback is only used by the MMC core now.

This allow for further cleanups which make the code a tad smaller and
much more readable.

I did some testing here, and tuning etc... still works, no regressions,
both with eMMC and SDXC. I send this out as RFT because I want to give
our BSP team also a chance to test more advanced cases. Also, I will be
thinking of more ways to verify this all is correct. A branch for
testing can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/refactor_hw_reset

The branch is based on top of v5.9-rc1.

Looking forward to comments!

Happy hacking,

   Wolfram


Wolfram Sang (6):
  mmc: renesas_sdhi: move wrong 'hw_reset' to 'reset'
  Revert "mmc: tmio: fix reset operation"
  mmc: tmio: remove indirection of 'hw_reset' callback
  mmc: tmio: factor out common parts of the reset routine
  mmc: tmio: don't reset whole IP core when tuning fails
  mmc: tmio: remove indirection of 'execute_tuning' callback

 drivers/mmc/host/renesas_sdhi_core.c | 58 ++++++++++++++--------------
 drivers/mmc/host/tmio_mmc.c          |  8 ----
 drivers/mmc/host/tmio_mmc.h          |  7 ----
 drivers/mmc/host/tmio_mmc_core.c     | 45 ++++-----------------
 drivers/mmc/host/uniphier-sd.c       |  5 ++-
 5 files changed, 39 insertions(+), 84 deletions(-)

-- 
2.20.1

