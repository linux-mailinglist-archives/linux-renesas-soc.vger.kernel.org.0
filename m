Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9F3270702
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 22:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgIRU0Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 16:26:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41308 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgIRU0X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 16:26:23 -0400
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88106E42;
        Fri, 18 Sep 2020 22:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600460781;
        bh=fP782SS8WOYxrS3s9vLC3XzWLsx7ohpBTh4QH5npSEA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rVf1s9HNPvNf9BfVhzGHbO18Ab5fmxriBdZhVc9rmFZyH8HL9j9zurXMM53r+YKbK
         HikMEzCBChaWHtBZVc2jIFOOVQA5kcADUfIF9ExcxxH6dTaz7kf1Q0GpWNLDkB2SGg
         vS9qnL2+VTmxRISHPG4Gvy/R9hkXLy19ck9IFMLg=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 3/3] tests: unbind/bind: Only test non display VSPs
Date:   Fri, 18 Sep 2020 21:26:16 +0100
Message-Id: <20200918202616.55977-4-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918202616.55977-1-kieran.bingham@ideasonboard.com>
References: <20200918202616.55977-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Only perform bind/unbind testing on VSPs which expose a media-device.
Unbinding a VSP which is connected to a DU causes the display pipeline
to fail, and is not currently supported.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 tests/vsp-unit-test-0026.sh | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
index 88038f3fdebf..4185bb23d05b 100755
--- a/tests/vsp-unit-test-0026.sh
+++ b/tests/vsp-unit-test-0026.sh
@@ -10,7 +10,14 @@
 features="rpf.0 wpf.0"
 
 vsp1_driver=/sys/bus/platform/drivers/vsp1
-vsps=$(cd /sys/bus/platform/devices/; ls | grep vsp)
+
+# List all VSPs with a media device.
+# This exludes VSP devices used by the DU.
+list_vsps() {
+	for mdev in /dev/media* ; do
+		echo -n $(vsp1_device $mdev) | grep vsp
+	done
+}
 
 unbind_vsp() {
 	echo $1 > $vsp1_driver/unbind
@@ -48,7 +55,7 @@ test_main() {
 	fi
 
 	# Unbind and rebind VSPs individually
-	for v in $vsps; do
+	for v in $(list_vsps); do
 		unbind_vsp $v
 		bind_vsp $v
 	done
-- 
2.25.1

