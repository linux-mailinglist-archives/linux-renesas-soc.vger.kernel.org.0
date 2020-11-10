Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561B02AD896
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 15:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgKJOVK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 09:21:10 -0500
Received: from www.zeus03.de ([194.117.254.33]:57700 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730059AbgKJOVK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 09:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=3iJUraYIkjvtGhbxANKV+0boVvw
        461uW0A891RGRSao=; b=MufCbo9RRlgXf3vF+FLuvfd/19Jk/XwhyMM8ayHeSc9
        U0TkFLtdpuzsFrzFuXj3MKoBs+c/vtfWD0ErILaONNnvVcfxeihkOdelirRKA9kj
        f8AG+io12W5UIkcP9MLjYvKGx7+xsuZEiitr/zF3xYTnzT9fVEeR8PmhKJ/tr5FI
        =
Received: (qmail 2195567 invoked from network); 10 Nov 2020 15:21:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2020 15:21:06 +0100
X-UD-Smtp-Session: l3s3148p1@xKqyY8GzWsogAwDPXxAvAEQD26z+TKuA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/4] mmc: renesas_sdhi: reset SCC only when available
Date:   Tue, 10 Nov 2020 15:20:54 +0100
Message-Id: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While working on another improvement for the reset routine, I noted an
issue with an old Gen2 SDHI instance which did not have a SCC. It turned
out that we never distinguished between the SCC and non-SCC versions on
Gen2 when it came to resetting. So far, it went OK but my upcoming
change broke. So, this series fixes the underlying issue by only
resetting the SCC when one is available.

I made very fine-grained patches because this driver is so fragile.
Nonetheless, my tests on a Renesas Lager board (R-Car H2) and
Salvator-XS (R-Car M3-N) were successful. Debug output showed that
proper code paths were taken and checksumming large files worked as well
as reinserting cards. The patches are based on mmc/next and 5.11 will
do because there seems to be no issue with current kernels.

I'd be very happy about further review and testing!

Thanks and all the best,

   Wolfram


Wolfram Sang (4):
  mmc: renesas_sdhi: only reset SCC when its pointer is populated
  mmc: renesas_sdhi: probe into TMIO after SCC parameters have been
    setup
  mmc: renesas_sdhi: populate SCC pointer at the proper place
  mmc: renesas_sdhi: simplify reset routine a little

 drivers/mmc/host/renesas_sdhi_core.c | 38 +++++++++++++---------------
 1 file changed, 18 insertions(+), 20 deletions(-)

-- 
2.28.0

