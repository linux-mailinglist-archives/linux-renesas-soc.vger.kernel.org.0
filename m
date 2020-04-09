Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 561D91A33DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 14:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDIMMR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:12:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48746 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDIMMR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:17 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6D1E1A40;
        Thu,  9 Apr 2020 14:12:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434334;
        bh=koKgkFI4J6/xNpng+dPXWyaaFOTxX5vZys0IqcN1p88=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LjwpGwAgc+5mPxNqm06HtNrQCunuW+aIvgsiMw/Dr5ekkp3Zy+naedgQAW459YNRh
         6qw1KvyQ2K43DqZT3UqoBIButIkbfFkPOdhmY9z+JV/FrWGt5UpVgImRpgEMsdONeq
         zh1/zGPBZ1gKPwgoQ8fKcNBujvMiWKjz7V3E+Mec=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 12/13] sqaush! max9286: Describe pad index usage
Date:   Thu,  9 Apr 2020 13:12:01 +0100
Message-Id: <20200409121202.11130-13-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sakari commented that the sink/source pad indexes are not the same as
the OF port numbers. We define them such that they match, so that they
can be used interchangably - but of course they are not the 'same
thing'. Document this in a comment at the definition of the pad sizings.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 61178ae363d6..6f114756a1e2 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -128,6 +128,10 @@
 #define MAX9286_AUTOMASKEN		BIT(4)
 #define MAX9286_MASKLINK(n)		((n) << 0)
 
+/*
+ * The sink and source pads are created to match the OF graph port numbers so
+ * that their indexes can be used interchangeably.
+ */
 #define MAX9286_NUM_GMSL		4
 #define MAX9286_N_SINKS			4
 #define MAX9286_N_PADS			5
-- 
2.20.1

