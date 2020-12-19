Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2CF2DF00A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Dec 2020 15:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgLSOhr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Dec 2020 09:37:47 -0500
Received: from www.zeus03.de ([194.117.254.33]:43602 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726624AbgLSOho (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Dec 2020 09:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=dCM+zFfix8PFto
        Sl76aTetpgNSznWtT79zg/CaTf1sQ=; b=S0looXZYWihUnpLtKddOm2v18vLRQF
        RMgHGeXZKGwexRk+i76xR6kSET/uraUGOHprPNZ+pEp12YnBP3KfTzsA3S4A+GH5
        z6vowOaCfRDualCJVDaywtcJqAjgUlebSOL3KpE6ljUne2mDPpauSf2WyAOpFb50
        4fpOg72UCVIXo=
Received: (qmail 4149879 invoked from network); 19 Dec 2020 15:37:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2020 15:37:02 +0100
X-UD-Smtp-Session: l3s3148p1@0el9KNK2fLYgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: proper comment formatting in reboot handler
Date:   Sat, 19 Dec 2020 15:36:47 +0100
Message-Id: <20201219143648.56217-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201219143648.56217-1-wsa+renesas@sang-engineering.com>
References: <20201219143648.56217-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This comment was probably copied from arm32 and then shortened. It fits
to single line now.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/kernel/process.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 3c770329364f..e68dacbc6204 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -207,9 +207,7 @@ void machine_restart(char *cmd)
 	/* Give a grace period for failure to restart of 1s */
 	mdelay(1000);
 
-	/*
-	 * Whoops - the architecture was unable to reboot.
-	 */
+	/* Whoops - the architecture was unable to reboot */
 	printk("Reboot failed -- System halted\n");
 	while (1);
 }
-- 
2.29.2

