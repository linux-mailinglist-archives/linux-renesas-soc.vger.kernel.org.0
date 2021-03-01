Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C42D327777
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 07:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbhCAGUe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 01:20:34 -0500
Received: from www.zeus03.de ([194.117.254.33]:37306 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231741AbhCAGUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 01:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=ZIRmcC0q2JqUE7rjJIBbaLe/g2b
        rlJMLVonof0TRhU4=; b=Y7F8lUqGuprerzJqDPrjX+UtqTtNKHuweK0HEAaxeV5
        cZ2mWmIgmmd2eoUjSyg+aFi1ApPpmWHUUxQjVjWJ3L+sNgK15v9nNDJkkeAc4lQo
        TVXE+gQR6SX8f2PCeeDnpyFyNTQhGvbUOt5jieDXAGpZNg2zNQFKo8vBfNPwYmO0
        =
Received: (qmail 486591 invoked from network); 1 Mar 2021 07:19:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Mar 2021 07:19:36 +0100
X-UD-Smtp-Session: l3s3148p1@mFPfmXO8POAgAwDPXwcTAEg0VdM7CcID
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] dts: remove c6x dts hard link file
Date:   Mon,  1 Mar 2021 07:19:24 +0100
Message-Id: <20210301061924.103145-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The architecture has gone and indexing software like 'mkid' complains
about the broken link.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 scripts/dtc/include-prefixes/c6x | 1 -
 1 file changed, 1 deletion(-)
 delete mode 120000 scripts/dtc/include-prefixes/c6x

diff --git a/scripts/dtc/include-prefixes/c6x b/scripts/dtc/include-prefixes/c6x
deleted file mode 120000
index 49ded4cae2be..000000000000
--- a/scripts/dtc/include-prefixes/c6x
+++ /dev/null
@@ -1 +0,0 @@
-../../../arch/c6x/boot/dts
\ No newline at end of file
-- 
2.30.0

