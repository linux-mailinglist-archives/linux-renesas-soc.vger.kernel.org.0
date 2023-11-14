Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBFB07EB09C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 14:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbjKNNMK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 08:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232741AbjKNNMI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 08:12:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24BC19F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Nov 2023 05:12:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9682223;
        Tue, 14 Nov 2023 14:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699967499;
        bh=lj8nOwYlQSlMq5c6rLUKkzW3Dapm1GwPCUPZaJ4HbDc=;
        h=From:To:Cc:Subject:Date:From;
        b=NRR5I7l3bDRIG2TJ6QoSX9wnDZ5PKjq6OCOFpa0EB/PIeazujN7XhXCWbQJhxQAbe
         0EFA3o3pbX5J1YfVLSH0vB11uBWckqfcQz4kqAqD4ZEPPmM3Y/Zf5ALnmKEgWptJTC
         pVv13dH7UQUrWSZDaHcBaCqMDW4s2HXRu4tsqCA4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [vsp-tests] [PATCH v2 1/2] scripts: Fix computation of the total number of tests
Date:   Tue, 14 Nov 2023 15:12:10 +0200
Message-ID: <20231114131211.24462-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If a test scripts outputs a line that doesn't match the
pass/fail/skipped criteria, the line is counted in the total number of
tests run, but not attributed to any individual category. This results
in a summary message such as

	189 tests: 170 passed, 0 failed, 3 skipped

Fix it by ignoring those lines.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Don't drop skipped tests handling
---
 scripts/vsp-tests.sh | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests.sh
index e6cae04ebf0b..7805f1b7de1c 100755
--- a/scripts/vsp-tests.sh
+++ b/scripts/vsp-tests.sh
@@ -29,10 +29,18 @@ run_test() {
 
 	local output=$(./$script 2>&1 | tee /proc/self/fd/2)
 	for line in $output ; do
-		(echo "$line" | grep -q 'fail$') && num_fail=$((num_fail+1))
-		(echo "$line" | grep -q 'pass$') && num_pass=$((num_pass+1))
-		(echo "$line" | grep -q 'skipped$') && num_skip=$((num_skip+1))
-		num_test=$((num_test+1))
+		local pass=0
+		local fail=0
+		local skipped=0
+
+		(echo "$line" | grep -q ': fail$') && fail=1
+		(echo "$line" | grep -q ': pass$') && pass=1
+		(echo "$line" | grep -q ': skipped$') && skipped=1
+
+		num_fail=$((num_fail+fail))
+		num_pass=$((num_pass+pass))
+		num_skipped=$((num_skipped+skipped))
+		num_test=$((num_test+pass+fail+skipped))
 	done
 
 	if [ $(ls *.bin 2>/dev/null | wc -l) != 0 ] ; then

base-commit: 9a37e24c2456103d146e0251765ae43df6f72f7e
-- 
Regards,

Laurent Pinchart

