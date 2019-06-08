Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B49CE3A035
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2019 16:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbfFHONC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 8 Jun 2019 10:13:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39406 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfFHONB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Jun 2019 10:13:01 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81F0D2DF;
        Sat,  8 Jun 2019 16:13:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560003180;
        bh=q3AoJtKW6mKKwOs5V2KUrfDna5Ms9L6OvZfRKU9cFLc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pe74f6HjgZpSd4EgbH3m77D73Ao3LMktH4EbvP301fanSeC7ZfFuonM+kl2HVIyIG
         8au1nHJLnKVB2eSiZxpyyHoXkqe0YKUtvoiwQzrMrw3KFFUCyAizWhjGUeaFvHcG5u
         Ipu0dTm0XjMr7SDpxBUzPi+UxUVvpWxXjMWwKPjw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] devicetree/bindings: display: Merge panel.txt with panel-common.txt
Date:   Sat,  8 Jun 2019 17:12:42 +0300
Message-Id: <20190608141242.17461-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608141242.17461-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190608141242.17461-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The two files were added concurrently and both store common panel
properties. Merge them together.

Suggested-by: Emil Velikov <emil.l.velikov@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/display/panel/panel-common.txt      | 6 ++++++
 Documentation/devicetree/bindings/display/panel/panel.txt   | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel.txt

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.txt b/Documentation/devicetree/bindings/display/panel/panel-common.txt
index 5d2519af4bb5..cd9d94189d43 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.txt
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
@@ -18,6 +18,12 @@ Descriptive Properties
   physical area where images are displayed. These properties are expressed in
   millimeters and rounded to the closest unit.
 
+- rotation: Panels are commonly mounted rotated, with their native orientation
+  not aligned with the device's orientation. The rotation property specifies
+  the angle in degrees between the panel's orientation and the device's
+  orientation (corresponding to a counter-clockwise rotation of the panel).
+  Valid values are  0, 90, 180 and 270.
+
 - label: The label property specifies a symbolic name for the panel as a
   string suitable for use by humans. It typically contains a name inscribed on
   the system (e.g. as an affixed label) or specified in the system's
diff --git a/Documentation/devicetree/bindings/display/panel/panel.txt b/Documentation/devicetree/bindings/display/panel/panel.txt
deleted file mode 100644
index e2e6867852b8..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panel.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-Common display properties
--------------------------
-
-- rotation:	Display rotation in degrees counter clockwise (0,90,180,270)
-- 
Regards,

Laurent Pinchart

