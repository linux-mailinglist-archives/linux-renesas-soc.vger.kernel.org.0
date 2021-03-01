Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07929327D70
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 12:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbhCALks (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 06:40:48 -0500
Received: from www.zeus03.de ([194.117.254.33]:38328 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232045AbhCALkr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 06:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=rX0UaHg9cnz3ymwTiXjAK15dOk9
        mabMWMtE5ATVZ3Jk=; b=RYJ/LhtlcagTNS52/iAK93ljLy8WJjSNBj3xP9zfsSl
        JNSLAvYK3PbW7YVYKukPfaN1nok32WLzqT2bks6z3MYkX+E7+uPleZzAkfSvpxAa
        QR7zeT27ERZl5rUyfuxEvJxOszKvN3R3AVASItgVD93WSxsP9Ed0gdDkyjF86kmE
        =
Received: (qmail 593303 invoked from network); 1 Mar 2021 12:40:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Mar 2021 12:40:05 +0100
X-UD-Smtp-Session: l3s3148p1@i/U+FHi8MN0gARa4RQigAZ6WjUy4NkAK
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dts: remove c6x dts link
Date:   Mon,  1 Mar 2021 12:39:21 +0100
Message-Id: <20210301113920.3042-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The architecture has gone and indexing software like 'mkid' complains
about the broken link.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Arnd, will you pick it up?

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

