Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51E144E1B99
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Mar 2022 13:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245077AbiCTMcF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Mar 2022 08:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245065AbiCTMcD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Mar 2022 08:32:03 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BDEEF0AC
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Mar 2022 05:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=LyZEibhHtlO/qw4MHivepLmzXwI
        rfMLU/TYNPQ0JpjI=; b=Pkn8fr71SthIH6YYeeFUJQ57HQtvp04/5oOAoOmF0q3
        26N4z96AikWMFL6Dl9jUNETcl8YA0remg8Wtf/2sKCH2nMorj7WilRPmO9ifyhm6
        +hHy/xroplhdv0G89QrcMC3pAUZniodvw85dixUsUuFkg60cO1vGVgFGrQ5gB7JY
        =
Received: (qmail 461083 invoked from network); 20 Mar 2022 13:30:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2022 13:30:35 +0100
X-UD-Smtp-Session: l3s3148p1@Xyjii6XaerkgAQnoAFbkANnMMFqLOUjD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/6] mmc: renesas_sdhi: internal_dmac: updates after refactoring
Date:   Sun, 20 Mar 2022 13:30:10 +0100
Message-Id: <20220320123016.57991-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Shimoda-san's much appreciated refactoring of the quirk handling allows
for further cleanups which you can find in this series plus some other
improvements found on the way. Finally, 'soc_dma_quirks' can be removed
in favor of regular quirks.

The series is based on mmc/next as of today and was tested on Salvator-X
(H3 ES1.0), Salvator XS (H3 ES2.0 as well as M3-N).

Looking forward for tests and comments.

All the best,

   Wolfram

Wolfram Sang (6):
  mmc: renesas_sdhi: remove outdated headers
  mmc: renesas_sdhi: R-Car D3 also has no HS400
  mmc: renesas_sdhi: make setup selection more understandable
  mmc: renesas_sdhi: remove a stale comment
  mmc: renesas_sdhi: make 'fixed_addr_mode' a quirk
  mmc: renesas_sdhi: make 'dmac_only_one_rx' a quirk

 drivers/mmc/host/renesas_sdhi.h               |  2 +
 drivers/mmc/host/renesas_sdhi_core.c          |  2 -
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 70 ++++++++-----------
 3 files changed, 33 insertions(+), 41 deletions(-)

-- 
2.30.2

