Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74D20291D74
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Oct 2020 21:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730571AbgJRTpw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Oct 2020 15:45:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:35956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728716AbgJRTW5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Oct 2020 15:22:57 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41E22222EB;
        Sun, 18 Oct 2020 19:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603048977;
        bh=VwfiyVImG4KNBSklL8nDqKwntMq1xxLWJNG+hRC/SFw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b/WNWdOVMbEnJB4goX1Jvm4H+EqZ5/ait1XrE/avt23q8+0PO8BxZKNNyb6033zgb
         CfmIjdb3QjJ2hXB8utT2ZgH3/El3ngJSjrNbeBAip8HfV2xdALsk6BSLzX6xEIU+Xm
         N2V0zXgP93EHt3QXd40iz4AeceXc8fB/AydmTwIk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 19/80] media: rcar_drif: Fix fwnode reference leak when parsing DT
Date:   Sun, 18 Oct 2020 15:21:30 -0400
Message-Id: <20201018192231.4054535-19-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018192231.4054535-1-sashal@kernel.org>
References: <20201018192231.4054535-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

[ Upstream commit cdd4f7824994c9254acc6e415750529ea2d2cfe0 ]

The fwnode reference corresponding to the endpoint is leaked in an error
path of the rcar_drif_parse_subdevs() function. Fix it, and reorganize
fwnode reference handling in the function to release references early,
simplifying error paths.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/rcar_drif.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
index 0f267a237b424..208ff260b0c10 100644
--- a/drivers/media/platform/rcar_drif.c
+++ b/drivers/media/platform/rcar_drif.c
@@ -1223,28 +1223,22 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
 	if (!ep)
 		return 0;
 
+	/* Get the endpoint properties */
+	rcar_drif_get_ep_properties(sdr, ep);
+
 	fwnode = fwnode_graph_get_remote_port_parent(ep);
+	fwnode_handle_put(ep);
 	if (!fwnode) {
 		dev_warn(sdr->dev, "bad remote port parent\n");
-		fwnode_handle_put(ep);
 		return -EINVAL;
 	}
 
 	sdr->ep.asd.match.fwnode = fwnode;
 	sdr->ep.asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
 	ret = v4l2_async_notifier_add_subdev(notifier, &sdr->ep.asd);
-	if (ret) {
-		fwnode_handle_put(fwnode);
-		return ret;
-	}
-
-	/* Get the endpoint properties */
-	rcar_drif_get_ep_properties(sdr, ep);
-
 	fwnode_handle_put(fwnode);
-	fwnode_handle_put(ep);
 
-	return 0;
+	return ret;
 }
 
 /* Check if the given device is the primary bond */
-- 
2.25.1

