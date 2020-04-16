Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542D51ABE1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505352AbgDPKjw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:39:52 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:45773 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505147AbgDPKjA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:39:00 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4C0B46001F;
        Thu, 16 Apr 2020 10:38:31 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 16/20] sqaush! max9286: Describe pad index usage
Date:   Thu, 16 Apr 2020 12:40:48 +0200
Message-Id: <20200416104052.2643098-17-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Sakari commented that the sink/source pad indexes are not the same as
the OF port numbers. We define them such that they match, so that they
can be used interchangably - but of course they are not the 'same
thing'. Document this in a comment at the definition of the pad sizings.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index e0c637d4a7de..6d63b4ca0a42 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -125,6 +125,10 @@
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
2.26.0

