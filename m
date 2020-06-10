Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417261F5750
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 17:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730013AbgFJPJR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 11:09:17 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:39703 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbgFJPJR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 11:09:17 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3B75B4000F;
        Wed, 10 Jun 2020 15:09:14 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] gmsl-yavta: Use UYVY8_1X16 format
Date:   Wed, 10 Jun 2020 17:12:28 +0200
Message-Id: <20200610151228.23845-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update the gmsl capture script to use the format required by the latest
max9286 driver version.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 gmsl-yavta.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gmsl-yavta.sh b/gmsl-yavta.sh
index 0ec0560..6e15555 100755
--- a/gmsl-yavta.sh
+++ b/gmsl-yavta.sh
@@ -16,7 +16,7 @@ function conf() {
     IDX="$2"
     VIN="$3"

-    media-ctl -d $mdev -V "'$CSI':$IDX [fmt:UYVY8_2X8/1280x800 field:none]"
+    media-ctl -d $mdev -V "'$CSI':$IDX [fmt:UYVY8_1X16/1280x800 field:none]"
     mc_set_link "$CSI" $IDX "$VIN" 1
 }

--
2.27.0

