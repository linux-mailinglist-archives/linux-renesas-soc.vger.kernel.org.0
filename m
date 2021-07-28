Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CECA13D9786
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 23:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbhG1V1R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 17:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhG1V1Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 17:27:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC64AC061757
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jul 2021 14:27:13 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73C023F;
        Wed, 28 Jul 2021 23:27:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627507631;
        bh=5WaJvSqiP2FPzf1bXvMzDpYWJdnKAFs8xJ4/KrOT+h8=;
        h=From:To:Cc:Subject:Date:From;
        b=YU7vduZJwKDR8Yn5CzKpGnV7Nlu665GeTWeQp12juqXBJI+vZ2rdsV92twY4VQ0BO
         XiemTOYZrZp1l8cxr9p0mNrQGOEptnrOgqySPycsBjYC0bUzHUFhDcp8lYJfVy7dEz
         1fMF6FsP2UiiSsgXvC7R+KmuJtrEn7jXQiV7Ykb4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marek.vasut+renesas@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [abloader] [PATCH] Allow overridding CROSS_COMPILE
Date:   Thu, 29 Jul 2021 00:27:01 +0300
Message-Id: <20210728212701.30592-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The cross-compiler name prefix may not be aarch64-linux-gnu-. Allow
specifying it by setting the CROSS_COMPILE environment variable as
documented in README.md.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c5512e5e6f0d..e6192bd9b6d8 100644
--- a/Makefile
+++ b/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0+
 #
-CROSS_COMPILE=aarch64-linux-gnu-
+CROSS_COMPILE?=aarch64-linux-gnu-
 
 TGT = jump
 ASRC += start.S
-- 
Regards,

Laurent Pinchart

