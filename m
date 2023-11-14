Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 642DF7EB05B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 13:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbjKNMzV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 07:55:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232283AbjKNMzU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 07:55:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5BC10B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Nov 2023 04:55:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6863830;
        Tue, 14 Nov 2023 13:54:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699966487;
        bh=wmOleOY10TGBlHRxXvaG0rL570SVft31gcwOrSLSqvk=;
        h=From:To:Cc:Subject:Date:From;
        b=OAb8BsLDJwmvE9EFMbGXA9i/9l8Gf/uBFIVlk5CAh0O+t3YhAlT8t1Qs56WqNi4tc
         ADqZpqD8VWEWrIBULrd/F/PF8a0zGCgzRs3eZLOsRdq8BtX3uvWWWXOOyCmYDPJEL3
         oa85vpob2x1PbT3NIEkDpdoxVb7kGlk+Xlr/++L8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [vsp-tests] [PATCH] scripts: Fix computation of the total number of tests
Date:   Tue, 14 Nov 2023 14:55:19 +0200
Message-ID: <20231114125519.23666-1-laurent.pinchart@ideasonboard.com>
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
 scripts/vsp-tests.sh | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests.sh
index e6cae04ebf0b..3d01b89d54de 100755
--- a/scripts/vsp-tests.sh
+++ b/scripts/vsp-tests.sh
@@ -29,10 +29,17 @@ run_test() {
 
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
+		num_test=$((num_test+pass+fail+skipped))
 	done
 
 	if [ $(ls *.bin 2>/dev/null | wc -l) != 0 ] ; then

base-commit: e4c152de7a4ee1822dfa7abfaa5789ef2032e415
-- 
Regards,

Laurent Pinchart

