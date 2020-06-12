Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3141F7816
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2020 14:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgFLMtG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jun 2020 08:49:06 -0400
Received: from www.zeus03.de ([194.117.254.33]:35498 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726085AbgFLMtG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jun 2020 08:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=LHqHHlSRkMeun3OMl7GCaw/Jhst
        3kMW958QRIBoAimc=; b=E6VGAcVjCTZfHOYZdDcB2jZtt66FmKKy1D0Tu0uJBFw
        wgleUmX1Q8b02fh8arFowu7umeCaWSNAmtyxewMLwGNiY+0iC9IBxk8M96rVes6P
        fElxd8Wx+mSFIs66+0bgNb1rUBxQEonMTM+bw6ORRChG80ccIZV2BJn+CD+qwO6A
        =
Received: (qmail 230824 invoked from network); 12 Jun 2020 14:49:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2020 14:49:03 +0200
X-UD-Smtp-Session: l3s3148p1@IEB/gOKnIOEgAwDPXwbpAGeWwLnioHPK
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] lib: update DEBUG_SHIRQ docs to match reality
Date:   Fri, 12 Jun 2020 14:48:44 +0200
Message-Id: <20200612124844.19422-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no extra interrupt when registering a shared interrupt handler
since 2011. Update the Kconfig text to make it clear and to avoid wrong
assumptions when debugging issues found by it.

Fixes: 6d83f94db95c ("genirq: Disable the SHIRQ_DEBUG call in request_threaded_irq for now")
Link: https://lore.kernel.org/linux-i2c/859e8211-2c56-8dd5-d6fb-33e4358e4128@pengutronix.de/T/#mf24d7070d7e0c8f17b6be6ceb51df94b7d7613b3
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I'd think this could go in via one of tglx' trees?

 lib/Kconfig.debug | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ef675beccab1..50522d3a7770 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -845,10 +845,10 @@ config DEBUG_SHIRQ
 	bool "Debug shared IRQ handlers"
 	depends on DEBUG_KERNEL
 	help
-	  Enable this to generate a spurious interrupt as soon as a shared
-	  interrupt handler is registered, and just before one is deregistered.
-	  Drivers ought to be able to handle interrupts coming in at those
-	  points; some don't and need to be caught.
+	  Enable this to generate a spurious interrupt just before a shared
+	  interrupt handler is deregistered (generating one when registering
+	  is currently disabled). Drivers need to handle this correctly. Some
+	  don't and need to be caught.
 
 menu "Debug Oops, Lockups and Hangs"
 
-- 
2.20.1

