Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D0E27078E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 22:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgIRUw7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 16:52:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41550 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbgIRUwy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 16:52:54 -0400
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93C902D7;
        Fri, 18 Sep 2020 22:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600462371;
        bh=CI9AJY16fRmU9LZRwiwP/JL+npz938O8BLQiJsWZarQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ofKXb2YC5tjJUANWbPUBTPpBDz93D6lmM64SJWJ36vSiSdoBUJ71m0UGslQ2UBNEh
         D5KZt60ZlvLnrqKg7KN/rlkhCfuBkziY73sfmV9uvjXlp94YNRIeMQTVBPiuKlMt7+
         TroCJPIcsoapRaS66diJr8FoQImqvCbrh4pLx0NE=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2] tests: Skip unbind/bind tests when not root
Date:   Fri, 18 Sep 2020 21:52:45 +0100
Message-Id: <20200918205245.58020-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918202616.55977-3-kieran.bingham@ideasonboard.com>
References: <20200918202616.55977-3-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The user must be root to be able to perform the unbind/bind cycle.
Skip this test when the user does not have root privilidges.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
v2:
 - Provide a test_start to match the test_complete operations.


 tests/vsp-unit-test-0026.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
index 0e013cec881b..391986e77336 100755
--- a/tests/vsp-unit-test-0026.sh
+++ b/tests/vsp-unit-test-0026.sh
@@ -41,12 +41,23 @@ test_copy() {
 test_main() {
 	local format
 
+	test_start "rebinding VSPs"
+
+	if [ ! "$(id -u)" = 0 ] ; then
+		# Root is required to run unbind tests
+		test_complete skip
+		return
+	fi
+
 	# Unbind and rebind VSPs individually
 	for v in $vsps; do
 		unbind_vsp $v
 		bind_vsp $v
 	done
 
+	# The test passes if the kernel doesn't crash
+	test_complete pass
+
 	# Perform a simple copy test to validate HW is alive
 	test_copy RGB24 128x128
 }
-- 
2.25.1

