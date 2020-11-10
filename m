Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966792ADB85
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 17:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729555AbgKJQWA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 11:22:00 -0500
Received: from www.zeus03.de ([194.117.254.33]:35226 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726900AbgKJQWA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 11:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=pgpxEU0eY2aM+p8/OApxv09Xryq
        dzYsbF4pGvMg7oOU=; b=Sb21II1eZ0h+C2ebLS5ZVKBXZ/9fQs/3QcYsh9guC7C
        8CR6ogKW3qrG0Zv6wOZ4de6xqlzqEtLD6Qvk53qhdetzBLM2wdpZtxCWuwvI4CcB
        z0QHPcW0dG8/oB/3zkXYRxanWGYywor+kORpZw0ycuPPhRX6vy8YHu7Ccfmv0QC4
        =
Received: (qmail 2226005 invoked from network); 10 Nov 2020 17:21:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2020 17:21:57 +0100
X-UD-Smtp-Session: l3s3148p1@gTLtE8OzSMsgAwDPXxAvAEQD26z+TKuA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] mmc: renesas_sdhi: refactor SCC reset
Date:   Tue, 10 Nov 2020 17:21:48 +0100
Message-Id: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

So, after some preparations, we can take the next step and improve
resetting the SCC. Patch #1 is a fix requested by the BSP team to be
more robust in case the firmware did something unexpected before.
Patches #2 and #3 are cleanups made possible after patch #1.

Patches have been tested on a Renesas Salvator-XS (R-Car M3-N) and a
Renesas Lager (R-Car H2) board.

A note to Shimoda-san: I did not forget that the BSP team also suggested
to use the SRCR3 register for a reset in probe(). However, it appears
there is more to discuss there. This is why I decided to send out this
series first because we want to have it anyhow. I'll send the SRCR3
RFC-patch later this week.

This series depends on the just sent out series "[RFC PATCH 0/4] mmc:
renesas_sdhi: reset SCC only when available". A branch (with some more
extras) can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/tap_en_v2

All the best,

   Wolfram


Wolfram Sang (3):
  mmc: renesas_sdhi: clear TAPEN when resetting, too
  mmc: renesas_sdhi: merge the SCC reset functions
  mmc: renesas_sdhi: remove superfluous SCLKEN

 drivers/mmc/host/renesas_sdhi_core.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

-- 
2.28.0

