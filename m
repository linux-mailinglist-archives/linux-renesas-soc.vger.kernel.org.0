Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10CE4C6A76
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Feb 2022 12:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiB1L36 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Feb 2022 06:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbiB1L35 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Feb 2022 06:29:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A0C4889E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 03:29:19 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47F1C478;
        Mon, 28 Feb 2022 12:29:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646047756;
        bh=A12Awla9mAwZyn65Ew655XVtPW6OJJRb9obRl53wovs=;
        h=From:To:Cc:Subject:Date:From;
        b=mqKaUD1yW+Dz8vRRD5XzytL4z9IgTF3oLwGv+ZSpKND2hp9SegzIBkMSfYLpsyrrO
         6/vlAAVk5AbGg0lgbP+Wj2Fe9zycigaG9GaGH4JFxxVUTP4Ibs0No/67okSSFFIPPg
         FHrbNiZcmt/Ib7GR2u/kHX3v0uXS7aKEELHLP44c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/3] tests: Add SPDX headers to vsp-unit-test-0026.sh
Date:   Mon, 28 Feb 2022 13:28:59 +0200
Message-Id: <20220228112901.21289-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

vsp-unit-test-0026.sh is missing SPDX headers. Add them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/vsp-unit-test-0026.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
index 0e013cec881b..36ed0b03469b 100755
--- a/tests/vsp-unit-test-0026.sh
+++ b/tests/vsp-unit-test-0026.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2020 Renesas Electronics Corporation
 
 #
 # Test unbinding and binding all VSP1 devices, performing a simple

base-commit: 2e98a1bf774bc8516aa8027411a2fd511e52561c
-- 
Regards,

Laurent Pinchart

