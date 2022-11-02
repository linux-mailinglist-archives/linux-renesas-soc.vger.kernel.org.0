Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7235961631E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Nov 2022 13:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbiKBMyk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Nov 2022 08:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiKBMyj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2022 08:54:39 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD432791B
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Nov 2022 05:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=rA2paXmIvV9O3mNk1k3+Ssb1RLD
        JZivgRqvjz1O6UBU=; b=oMv+6BubqvWMA/jECHf+kOyaJisKBJDKkA9XqF2bOga
        VMvkTCtWODGUehcghq6KWPX1ZmkHQJkmi4stSm1v63BOqeBzlEKKbzazut9zw3OW
        lrTJ30QtfoyJS7ppCGMd1ie5HSuKqvJR51uqDs2XrMqs64KAp6OMjAPJa6FR5p6s
        =
Received: (qmail 2206628 invoked from network); 2 Nov 2022 13:54:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Nov 2022 13:54:36 +0100
X-UD-Smtp-Session: l3s3148p1@VSW+V3zs5NkucrSg
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/2] mmc: tmio: further cleanups after kmap_atomic removal
Date:   Wed,  2 Nov 2022 13:54:28 +0100
Message-Id: <20221102125430.28466-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Thanks to Adrian's patches mentioned in patch 1 in this series, we can
now simplify the TMIO driver a tad further to ease future refactoring.
This is marked as RFC because testing the corner cases is not so easy so
extra eyes for review are more than welcome.

Thanks and happy hacking!

   Wolfram


Wolfram Sang (2):
  mmc: tmio: remove tmio_mmc_k(un)map_atomic helpers
  mmc: tmio: remove 'alignment_shift' from platform data

 drivers/mmc/host/renesas_sdhi_core.c     |  1 -
 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 10 +++++-----
 drivers/mmc/host/tmio_mmc.h              | 11 -----------
 drivers/mmc/host/tmio_mmc_core.c         | 13 +++++++------
 include/linux/mfd/tmio.h                 |  1 -
 5 files changed, 12 insertions(+), 24 deletions(-)

-- 
2.35.1

