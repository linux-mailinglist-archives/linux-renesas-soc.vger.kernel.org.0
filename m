Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7675E39B751
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 12:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhFDKqu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 06:46:50 -0400
Received: from www.zeus03.de ([194.117.254.33]:36012 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230101AbhFDKqt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 06:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=/t8lzesOfNC9WH9GAfWXfXBSK1N
        2sn3QqFvvPeG9zG8=; b=mKd4e4QpkflY/N9AWaYzQ//SVYFvYDVmKcYY8hEBRiR
        nBf0s3JS8azx08yKWCmnoyt76xArI4adtLbVbCZapmKBaVg+eLwqUD/i6rfluXEw
        iC/xh5r1KQPF16pcYnK5uqRRTWEIcB/0rkerEovpgRkwqDAkMTD+4LIImdin5Dn4
        =
Received: (qmail 1325804 invoked from network); 4 Jun 2021 12:45:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2021 12:45:01 +0200
X-UD-Smtp-Session: l3s3148p1@D+E9Yu7DCJYgARa4RaKlAZ+fS3TshXtP
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: debugfs: add description for module parameter
Date:   Fri,  4 Jun 2021 12:44:59 +0200
Message-Id: <20210604104459.7574-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make it obvious what this is for.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/core/debugfs.c b/drivers/mmc/core/debugfs.c
index 9ec84c86c46a..3fdbc801e64a 100644
--- a/drivers/mmc/core/debugfs.c
+++ b/drivers/mmc/core/debugfs.c
@@ -26,6 +26,7 @@
 static DECLARE_FAULT_ATTR(fail_default_attr);
 static char *fail_request;
 module_param(fail_request, charp, 0);
+MODULE_PARM_DESC(fail_request, "default fault injection attributes");
 
 #endif /* CONFIG_FAIL_MMC_REQUEST */
 
-- 
2.30.2

