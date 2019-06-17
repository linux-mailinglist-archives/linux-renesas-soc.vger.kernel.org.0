Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDBB048866
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 18:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfFQQMl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 12:12:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35456 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfFQQMk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 12:12:40 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07FA29CB;
        Mon, 17 Jun 2019 18:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560787959;
        bh=uRw0AUv3DwRiFwDDbiKEWiG2c1fqOrfcwxZPBG354xg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gelovNS3/NZxgK/NhkRTcbT0gPjsCr0JcrNgjeWjOiBid/Av95F8iktsirjjuLeDq
         E1Se/AGvCaKxHZAZpUT5fHnlMcO2eysjkRfrV5x8wVEpI2RuAbOqwHPXYTWiyi/nSc
         l95+/OeTQ4oCvTPScBKapFuB667/tDaupQ4XSKXs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-tests] [PATCH 2/2] kmstest.py: Capture the last kernel messages before closing the log
Date:   Mon, 17 Jun 2019 19:12:17 +0300
Message-Id: <20190617161217.22463-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190617161217.22463-1-laurent.pinchart@ideasonboard.com>
References: <20190617161217.22463-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When stopping a test, kernel messages can be logged after the event loop
is stopped. Capture them before closing the log.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index adb67c82c368..217d39221c90 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -119,6 +119,8 @@ class Logger(object):
 
     def close(self):
         if self.logfile:
+            # Capture the last kernel messages.
+            self.event()
             self.logfile.close()
             self.logfile = None
 
-- 
Regards,

Laurent Pinchart

