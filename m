Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 067CE15BCA6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2020 11:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729511AbgBMKVm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Feb 2020 05:21:42 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729428AbgBMKVm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Feb 2020 05:21:42 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46FEC504;
        Thu, 13 Feb 2020 11:21:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581589300;
        bh=/2NyjQMNCX4Aku/eG6tw1UnVEFjN4hP5w1X8ALM0aso=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tMByd2Kt9DA8RupKk8pDUlj7HDMpsB0JqBpy21HrhGoOR1YfwCKA9OrmuuoABVzLM
         aNkHx5unZquwqeAlfZQY7yF6s8fbWE5kR+hTVZkWc2F9iFEYEQe9VSrZwpxd0GXt7n
         JF/rfMvKYbfVPWkXZu7dq+H33erk/bt+7rZMITfs=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] max9286: balance v4l2_async refcnting
Date:   Thu, 13 Feb 2020 10:21:35 +0000
Message-Id: <20200213102135.2179-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212173727.19476-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200212173727.19476-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When we add fwnodes to V4L2 notifiers through
v4l2_async_notifier_add_subdev they are stored internally in V4L2 core,
and have a reference count released upon any call to
v4l2_async_notifier_cleanup().

Ensure that any source successfully added to a notifier gets its fwnode
reference count increased accordingly.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index f3311210a666..62615e6ab710 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -665,6 +665,11 @@ static int max9286_v4l2_async_register(struct max9286_priv *priv)
 			v4l2_async_notifier_cleanup(&priv->notifier);
 			return ret;
 		}
+
+		/* Balance the refernce counting handled through
+		 * v4l2_async_notifier_cleanup()
+		 */
+		fwnode_handle_get(source->fwnode);
 	}
 
 	priv->notifier.ops = &max9286_notify_ops;
-- 
2.20.1

