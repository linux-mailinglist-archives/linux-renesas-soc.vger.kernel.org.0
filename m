Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACD11A33D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 14:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgDIMMN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:12:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48746 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDIMMN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:13 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7E9672C;
        Thu,  9 Apr 2020 14:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434331;
        bh=b66VwlnmIFe5JaA5ITggGp9v0tMapqp6S3Azm7bn0kc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QJOHR4mWvu4/2vMoaLWI8VlsOxxGX9+2YmPKVGiyMNZXQZ2ZG6rBfmFxZy7NtTiJh
         S6Vemo6se8EsSw7O1JpHQTr8AfnBhuNbEr8AE0jIEGH6m4n+HlqoldOwIArFfqzV5J
         eAHAVHGOxXzOiIqTDF67ZnKp9dPrD6pAqtgV6als=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 06/13] squash! max9286: Fit max9286_parse_dt print on one line
Date:   Thu,  9 Apr 2020 13:11:55 +0100
Message-Id: <20200409121202.11130-7-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

 - Fit max9286_parse_dt print on one line
---
 drivers/media/i2c/max9286.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index c374078c7001..4656a1027d81 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1061,8 +1061,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 			continue;
 
 		if (!of_device_is_available(node)) {
-			dev_dbg(dev, "Skipping disabled I2C bus port %u\n",
-				id);
+			dev_dbg(dev, "Skipping disabled I2C bus port %u\n", id);
 			continue;
 		}
 
-- 
2.20.1

