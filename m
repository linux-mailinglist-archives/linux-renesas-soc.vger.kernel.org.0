Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7447C866
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 18:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbfGaQRx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 12:17:53 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:26904 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbfGaQRx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 12:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1564589869;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=LUAukr8Fa+7cR98+MjnDbcRvcMBn81Uabyl9ncZFn9U=;
        b=oSbqMlXZin+FUn8Uem5mhSE0aMD6ZNcuSqIyqYTZNMURaKnpXWwh68wr0jubk3ygIr
        nNFCJX9I0vdGxj/tBIRYriPnW4LhDuwb2GeVts1BlyQ2T9cGboYGaqmP/vxwcf9uQADV
        XpFdTwSatW6xDB8QTmw4vYoRQbqUmCF3rG9SPVRfUEkdEiNeowQW2JNhjWanTxnjR3FD
        NHXd3SAJz7a74d8OVBan9+kIklhP5UfNuLCmDaESt8CA7uBzXYfPPO2KD7NHnvKN4FDu
        V9OP//qowkp0F3Hbh3OMItDjm1bGOhG0YORiI2/a89rnELpIxsrdGQ+oEg2pzej+TtKr
        UY0Q==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82dZd6zDDg=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id h0a328v6VGHhaNa
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 31 Jul 2019 18:17:43 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
Cc:     niklas.soderlund@ragnatech.se, wsa@the-dreams.de,
        yamada.masahiro@socionext.com, geert@linux-m68k.org,
        ulf.hansson@linaro.org, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 2/2] mmc: tmio: remove obsolete PM workaround
Date:   Wed, 31 Jul 2019 18:17:37 +0200
Message-Id: <1564589857-17720-3-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564589857-17720-1-git-send-email-uli+renesas@fpond.eu>
References: <1564589857-17720-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Obsoleted by commit 7ff213193310ef8d ("mmc: tmio: move runtime PM
enablement to the driver implementations").

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/mmc/host/tmio_mmc_core.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 733ff96..72877c6 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1221,15 +1221,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 		_host->reset = tmio_mmc_reset;
 
 	/*
-	 * On Gen2+, eMMC with NONREMOVABLE currently fails because native
-	 * hotplug gets disabled. It seems RuntimePM related yet we need further
-	 * research. Since we are planning a PM overhaul anyway, let's enforce
-	 * for now the device being active by enabling native hotplug always.
-	 */
-	if (pdata->flags & TMIO_MMC_MIN_RCAR2)
-		_host->native_hotplug = true;
-
-	/*
 	 * While using internal tmio hardware logic for card detection, we need
 	 * to ensure it stays powered for it to work.
 	 */
-- 
2.7.4

