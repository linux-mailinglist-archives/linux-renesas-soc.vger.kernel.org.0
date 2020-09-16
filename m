Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A0E26CABC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 22:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbgIPUM7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 16:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbgIPRdO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 13:33:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5F2C00217E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2020 07:45:22 -0700 (PDT)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B21E8276;
        Wed, 16 Sep 2020 16:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600267453;
        bh=ClfTBU2oKtwuGypifBfbjNA/ULvcIj2ZbeAYGXeUp9M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WubxhDC6QnK9LfyNcWkuC349DR61c7NJIbqlLWhuKL0UUM5MGd/ubUEgaL05K9OIJ
         27aIecZwhsFMGwwX+qxypg+oE/z12PpN9CaimihWtGbXI49hyViZqx8izqMyg7zKlB
         wknKo1MrI/TvGG/OLBmKxEtiBq8BQi1Xn76w7bEY=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH 3/3] scripts/logger: Use new monotonic-ts tool
Date:   Wed, 16 Sep 2020 15:43:02 +0100
Message-Id: <20200916144302.1483470-4-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916144302.1483470-1-kieran.bingham@ideasonboard.com>
References: <20200916144302.1483470-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Utilise the new monotonic timestamping tool to remove the manual parsing of
timestamps via /proc/timer_list which can only be read by root.

This also simplifies the processing required and contains all timestamping
actions within a single process space.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/logger.sh | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/scripts/logger.sh b/scripts/logger.sh
index 97e1f582da2b..452ebc8c82ba 100755
--- a/scripts/logger.sh
+++ b/scripts/logger.sh
@@ -2,23 +2,11 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
 
-now() {
-	awk '/^now/ {time=$3; printf("[%u.%06u]", time / 1000000000, (time % 1000000000) / 1000) ; exit}' /proc/timer_list
-}
-
 label=${1:+ [$1]}
 
 TRACE_MARKER=/sys/kernel/debug/tracing/trace_marker
-if [ -e $TRACE_MARKER ]; then
-	extra_log_files=$TRACE_MARKER
+if [ -e $TRACE_MARKER ] && [ $(id -u) == 0 ]; then
+	./monotonic-ts $label | tee -a $TRACE_MARKER
+else
+	./monotonic-ts $label
 fi
-
-while read line ; do
-	newline="$(now)$label $line"
-
-	echo "$newline"
-
-	for f in $extra_log_files; do
-		echo "$newline" >> $f;
-	done;
-done
-- 
2.25.1

