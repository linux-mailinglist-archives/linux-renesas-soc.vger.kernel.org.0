Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054093321E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 10:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhCIJYV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 04:24:21 -0500
Received: from www.zeus03.de ([194.117.254.33]:40620 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229878AbhCIJYG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 04:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=4hWmqDORYnmyweeEodNvD8l/IEx
        2Ud4wi8k1ewHaD60=; b=DeX9B/7zbi2FcwjOMBbLqVDos6YmfEBpnXFZfq9yHWF
        emRTjm4Z1/ljnS50K4T+hnzRGn/TMnc8xzojD7mZELLqpkDcA8/GY9Ij8YnyYD8G
        dOB/rtoG2bIsvFuPJmEiCBAKkqdX3ahmLEHqbafScelwgs3iIlUg+rN8/SoRZUF4
        =
Received: (qmail 3419210 invoked from network); 9 Mar 2021 10:23:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Mar 2021 10:23:40 +0100
X-UD-Smtp-Session: l3s3148p1@ACbyGhe9noogAwDPXw8WAIb6kxwVO+fo
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] mmc: renesas_sdhi: reset via reset controller
Date:   Tue,  9 Mar 2021 10:23:30 +0100
Message-Id: <20210309092332.30705-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series enables SDHI to be reset via a reset controller.

Please let me know about your (and BSP team's) thoughts.

Changes since RFC v2 (thanks Geert for the review!):

* use devm_reset_control_get_optional_exclusive()
* select RESET_CONTROLLER
* given reason in commit message of patch 2

Tested on a Salvator-XS with a Renesas R-Car M3-N.

Shimoda-san: I think we need to get this series upstream first. On top
of this, I will work on the better irq_mask handling.


Wolfram Sang (2):
  mmc: tmio: abort DMA before reset
  mmc: renesas_sdhi: do hard reset if possible

 drivers/mmc/host/Kconfig             |  1 +
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 15 ++++++++++++++-
 drivers/mmc/host/tmio_mmc_core.c     |  4 ++--
 4 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.30.0

