Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57BE42465D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Aug 2020 13:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgHQL6u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Aug 2020 07:58:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:51844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726871AbgHQL6u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Aug 2020 07:58:50 -0400
Received: from localhost (p54b334f7.dip0.t-ipconnect.de [84.179.52.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61D36204EA;
        Mon, 17 Aug 2020 11:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597665530;
        bh=vDE6nEYxqVfNuVIUguyec/Ag/jloPYQtiTXFYHQ1MCI=;
        h=From:To:Cc:Subject:Date:From;
        b=MoE4Ln+1msazDo09jb4j7OGXaCmVhVg/Xi+uXptZvVUscGM3Wz1IoKqMLwFweg1Yy
         I069CEO8Sl9wHOVhxCxeYOs5kD16lwBOqMN7kTFwP6Qrk9ZrHsHNO+3Ao8uTL4m0s4
         HU+290HLqeoEboScuz+4u5b/36+BMakVvZroILbI=
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: test: remove ambiguity in test description
Date:   Mon, 17 Aug 2020 13:58:38 +0200
Message-Id: <20200817115838.2981-1-wsa@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

When reading the test description, I thought a correction of the
xfer_size was tested, which is not the case. It is tested that the
xfer_size is correct. Use 'proper xfer_size' to remove this ambiguity.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This may be bike-shedding and I am not offended if you think it is
minor. However, I ended up looking at the source wondering where is what
automatically corrected.

 drivers/mmc/core/mmc_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
index c21b3cb71775..152e7525ed33 100644
--- a/drivers/mmc/core/mmc_test.c
+++ b/drivers/mmc/core/mmc_test.c
@@ -2669,22 +2669,22 @@ static const struct mmc_test_case mmc_test_cases[] = {
 	},
 
 	{
-		.name = "Correct xfer_size at write (start failure)",
+		.name = "Proper xfer_size at write (start failure)",
 		.run = mmc_test_xfersize_write,
 	},
 
 	{
-		.name = "Correct xfer_size at read (start failure)",
+		.name = "Proper xfer_size at read (start failure)",
 		.run = mmc_test_xfersize_read,
 	},
 
 	{
-		.name = "Correct xfer_size at write (midway failure)",
+		.name = "Proper xfer_size at write (midway failure)",
 		.run = mmc_test_multi_xfersize_write,
 	},
 
 	{
-		.name = "Correct xfer_size at read (midway failure)",
+		.name = "Proper xfer_size at read (midway failure)",
 		.run = mmc_test_multi_xfersize_read,
 	},
 
-- 
2.20.1

