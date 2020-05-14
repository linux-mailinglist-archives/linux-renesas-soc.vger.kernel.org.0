Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2065C1D3200
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 16:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgENOAZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 10:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgENOAZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 10:00:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB7EC061A0E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2020 07:00:24 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FEA225A;
        Thu, 14 May 2020 16:00:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589464823;
        bh=12vttkGx0tu0fGmqwSfew32UcitF35hLFALzkHTJp4M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IFvdrA87OAg8O8UXd7HQlke7L/t6j5RtFaOWDlx4ijm3z1vfMrbB+coQ0XPDtq3A0
         I93PPlGX8eIx5d42eIl2q9igwa2o61v/fw15cHHm1ehSVnwnARK85b0h4xnwFL4kQ1
         b0vdcv8Oh7Oly/NpLwGbdB0GwXEGRhKXJ4YyZEvY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v9.1 1/3] fixes! [max9286]: Use the same default mbus_fmt everywhere
Date:   Thu, 14 May 2020 15:00:14 +0100
Message-Id: <20200514140016.1445489-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200514140016.1445489-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200514140016.1445489-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The default code used in max9286_set_fmt() differs from other defaults.
Correct it.

Reported-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 481d65f2b51d..c8ca1245df4b 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -722,7 +722,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	case MEDIA_BUS_FMT_YVYU8_2X8:
 		break;
 	default:
-		format->format.code = MEDIA_BUS_FMT_YUYV8_2X8;
+		format->format.code = MEDIA_BUS_FMT_UYVY8_2X8;
 		break;
 	}
 
-- 
2.25.1

