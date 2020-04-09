Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 367E81A33D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 14:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgDIMMJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:12:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48718 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDIMMJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:09 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BDE4B76;
        Thu,  9 Apr 2020 14:12:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434328;
        bh=jkiEp6p3sUNMg2d8OX+XTJENo0FR4MrtmhfT7MeUK9A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kVJ7jDjGpNdIrS/W71G64WAsnSkypm02zc+nUGiY29YMHwfdb6/BUKdHGJMbmeG6t
         6tCrtzQ8F2iAx6S0RL8qFEbaLl0kTJdMMOvXHHQuCxd1ehNwcIs6bHhJbya4e6PtAV
         D+lB4r4m7Usx6Z4BU7hCsijU6/dxH00fqXVdELN8=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 01/13] squash! max9286: Update the bound_sources mask on unbind
Date:   Thu,  9 Apr 2020 13:11:50 +0100
Message-Id: <20200409121202.11130-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The bound_sources bit mask tracks sources which have been successfully
bound through the v4l2 async notifier system.

Ensure that the mask is updated accordingly when unbinding.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index cb58782e5143..b84d2daa6561 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -493,9 +493,12 @@ static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *subdev,
 				  struct v4l2_async_subdev *asd)
 {
+	struct max9286_priv *priv = sd_to_max9286(notifier->sd);
 	struct max9286_source *source = asd_to_max9286_source(asd);
+	unsigned int index = to_index(priv, source);
 
 	source->sd = NULL;
+	priv->bound_sources &= ~BIT(index);
 }
 
 static const struct v4l2_async_notifier_operations max9286_notify_ops = {
-- 
2.20.1

