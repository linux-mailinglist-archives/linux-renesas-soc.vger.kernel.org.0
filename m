Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36ABB23F528
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 01:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgHGXVi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 19:21:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48946 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbgHGXVh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 19:21:37 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 177F597E;
        Sat,  8 Aug 2020 01:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596842496;
        bh=RKgywU/4eEvHKi6AQnzRc0CeqC7WjrzFIeK/lwmz6QU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B9XAycpCOCpqGU3CPfSLQ34cvugQDU7jYP19OW5SNcEPdQV54NRkGdavY9w2sEKR+
         XxDYaBXBlUpTX6ITflUZ7EQKsReguyjfRqgbeGI+wSDsghvu/6yldl7XhHIbVUWNAc
         3a5hJd7OxPRWZFXgva14wg+Wkt7OPlXcRrQTXNSU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [kms-tests] [PATCH 1/6] kmstest: Extend Rect class
Date:   Sat,  8 Aug 2020 02:21:14 +0300
Message-Id: <20200807232119.28854-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
References: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a helper isEmpty() method to the Rect class, as well as a __repr__()
method to pretty-print the rectangle.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index f13e3fb7aa32..0281c6727271 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -212,6 +212,13 @@ class Rect(object):
         self.width = width
         self.height = height
 
+    def __repr__(self):
+        return "(%d,%d)/%ux%u" % (self.left, self.top, self.width, self.height)
+
+    def isEmpty(self):
+        """Check if the rectangle has a zero width or height"""
+        return self.width == 0 or self.height == 0
+
 
 class AtomicRequest(pykms.AtomicReq):
     """pymkms.AtomicReq wrapper to track state changes"""
-- 
Regards,

Laurent Pinchart

