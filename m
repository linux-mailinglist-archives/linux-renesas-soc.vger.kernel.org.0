Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 516F17EB09D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 14:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbjKNNMM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 08:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbjKNNML (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 08:12:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2738FD40
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Nov 2023 05:12:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F8FD830;
        Tue, 14 Nov 2023 14:11:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699967500;
        bh=SNCoRpNy8tGzvRGvURxYUk+/adwMc8KCa32or/Strjw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fVLt7txFcx9uvxP7RUVkpdBWomRB+k1+tuFJnDbZJ9O7hVpTKCilLoYgWFLBLBkCf
         K2VEthq1YN40b+4JPu9LQq4cyKJAMF34OFWmOna8HqrsZ0IKdP89l3kQuu4S2SgHu/
         hjy8AkQtoA/X/PEJcGiLwF/IbS3vzN7S/vC/rZFc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [vsp-tests] [PATCH v2 2/2] scripts: Take all skipped tests into account
Date:   Tue, 14 Nov 2023 15:12:11 +0200
Message-ID: <20231114131211.24462-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114131211.24462-1-laurent.pinchart@ideasonboard.com>
References: <20231114131211.24462-1-laurent.pinchart@ideasonboard.com>
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

Some skipped tests print a "skip" message, while other print "skipped".
This leads to some of them not being counted. Standardize on "skip".

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/vsp-lib.sh   | 2 +-
 scripts/vsp-tests.sh | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index a8898e80a879..114bc7200e6e 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -1076,7 +1076,7 @@ test_init() {
 
 	if [ -z $best_mdev ] ; then
 		echo "No device found with feature set \`$features'" | ./logger.sh config >> $logfile
-		echo "Test requires unavailable feature set \`$features': skipped" >&2
+		echo "Test requires unavailable feature set \`$features': skip" >&2
 		exit 1
 	fi
 
diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests.sh
index 7805f1b7de1c..13e7ba4410b5 100755
--- a/scripts/vsp-tests.sh
+++ b/scripts/vsp-tests.sh
@@ -31,16 +31,16 @@ run_test() {
 	for line in $output ; do
 		local pass=0
 		local fail=0
-		local skipped=0
+		local skip=0
 
 		(echo "$line" | grep -q ': fail$') && fail=1
 		(echo "$line" | grep -q ': pass$') && pass=1
-		(echo "$line" | grep -q ': skipped$') && skipped=1
+		(echo "$line" | grep -q ': skip$') && skip=1
 
 		num_fail=$((num_fail+fail))
 		num_pass=$((num_pass+pass))
-		num_skipped=$((num_skipped+skipped))
-		num_test=$((num_test+pass+fail+skipped))
+		num_skip=$((num_skip+skip))
+		num_test=$((num_test+pass+fail+skip))
 	done
 
 	if [ $(ls *.bin 2>/dev/null | wc -l) != 0 ] ; then
-- 
Regards,

Laurent Pinchart

