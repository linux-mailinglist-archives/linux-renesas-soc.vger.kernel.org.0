Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5E72DF00C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Dec 2020 15:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgLSOho (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Dec 2020 09:37:44 -0500
Received: from www.zeus03.de ([194.117.254.33]:43588 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726559AbgLSOho (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Dec 2020 09:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=At6kyUuuIMlLFa
        IiwmHC4gLjbNFYfaHkbGQtAT/zBpY=; b=v+HSwvVhIEB7EqsKXTKzmQzv16CANE
        cRU53G2Kb42m1ykUevDPajPr3v+imJgU2stKaI+lXO+RjHcdO0nCvXrsIU4U6Uro
        glZU6PrbrxNUcQmXqBuwwSrJ6hjjDN3kXlHeVGt1c/O9e+LMbQvov74Yyw1XN4YP
        jpuf6IB91spw8=
Received: (qmail 4149843 invoked from network); 19 Dec 2020 15:37:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2020 15:37:01 +0100
X-UD-Smtp-Session: l3s3148p1@SeVzKNK2erYgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: add grace period when rebooting
Date:   Sat, 19 Dec 2020 15:36:46 +0100
Message-Id: <20201219143648.56217-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201219143648.56217-1-wsa+renesas@sang-engineering.com>
References: <20201219143648.56217-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I work on a system where I currently need to reboot via watchdog.
Because the watchdog needs a bit of time to fire, add a grace period
like on arm32 to avoid the false positive warning message.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/kernel/process.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 6616486a58fe..3c770329364f 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -204,6 +204,9 @@ void machine_restart(char *cmd)
 	else
 		do_kernel_restart(cmd);
 
+	/* Give a grace period for failure to restart of 1s */
+	mdelay(1000);
+
 	/*
 	 * Whoops - the architecture was unable to reboot.
 	 */
-- 
2.29.2

