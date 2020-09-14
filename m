Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFECA2690BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Sep 2020 17:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgINP4i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 11:56:38 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:56993 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbgINPyP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 11:54:15 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 066EDC0007;
        Mon, 14 Sep 2020 15:54:06 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: max9286: Fix async subdev size
Date:   Mon, 14 Sep 2020 17:57:49 +0200
Message-Id: <20200914155749.183030-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since commit:
86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
the async subdevice registered to the max9286 notifier is dynamically
allocated by the v4l2 framework by using
the v4l2_async_notifier_add_fwnode_subdev function. In order to allocate
enough space for max9286_asd structure that encloses the async subdevice
paired with a pointer to the corresponding source, pass to the framework
the size of the whole structure in place of the one of the enclosed async
subdev.

Fixes: 86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index c82c1493e099..746c411b79a0 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -579,8 +579,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 		struct v4l2_async_subdev *asd;

 		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
-							    source->fwnode,
-							    sizeof(*asd));
+			source->fwnode, sizeof(struct max9286_asd));
 		if (IS_ERR(asd)) {
 			dev_err(dev, "Failed to add subdev for source %u: %ld",
 				i, PTR_ERR(asd));
--
2.28.0

