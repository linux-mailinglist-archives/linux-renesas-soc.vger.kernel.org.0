Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BC3270701
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 22:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgIRU0W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 16:26:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41302 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgIRU0W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 16:26:22 -0400
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1012DA1D;
        Fri, 18 Sep 2020 22:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600460780;
        bh=w5KudxK37avfe1btWv5TNhq2/dwZVGEJodKtdg5AAlE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iec4uTaSnAelzIOmnHHcIbuAd3fY0AK+1I/GlFCXCDIajybdIn67FE8mAJQdYfRDx
         Pyzqj9k2zyHx0ehHtCljC5tv5hm+mc2LYIMTBGC/33eGbQhu72wBK1yObVn2woZl2v
         eKyE/h3e13BsJMDSUGuEzgeqCot34FEMbsIZ9IRw=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/3] scripts: vsp-lib.sh: Remove unused variable
Date:   Fri, 18 Sep 2020 21:26:14 +0100
Message-Id: <20200918202616.55977-2-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918202616.55977-1-kieran.bingham@ideasonboard.com>
References: <20200918202616.55977-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The dev identifier is not used until after a media device has been
selected, at which point the vsp1_device function is re-called.

Remove the redundant assignment.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/vsp-lib.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index a8898e80a879..04a8127f6073 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -1040,8 +1040,6 @@ test_init() {
 	local best_mdev=
 
 	for mdev in /dev/media* ; do
-		dev=$(vsp1_device $mdev)
-
 		local match='true'
 		for feature in $features ; do
 			$(vsp1_has_feature "$feature") || {
-- 
2.25.1

