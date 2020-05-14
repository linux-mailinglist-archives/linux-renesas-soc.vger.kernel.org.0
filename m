Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27D21D31FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 16:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgENOAZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 10:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726037AbgENOAY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 10:00:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7297C061A0C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2020 07:00:24 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F7CA259;
        Thu, 14 May 2020 16:00:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589464822;
        bh=Hv/gWBifTNpJyMmBPb5HIXo+kfcnQzj4qMPrFnR67KM=;
        h=From:To:Cc:Subject:Date:From;
        b=MVl4mjnaMNnUiewpiLREIc/IleUzfu56m2TG4/QtFkwbbZv0JGezSHq6dViAm/h/O
         /nT/rguQ5Sr1GHmSM/iggG4IBVWCvMNrX9/y0YqhWuy0nMsgtW7mTh6NO9rQMO05Da
         V/DGNay2KnV3jfoPMXbVJWMsn6w/kzXv4rxwyBqY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v9.1 0/3] MAX9286 fixups
Date:   Thu, 14 May 2020 15:00:13 +0100
Message-Id: <20200514140016.1445489-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Following the review comments on v9, max9286, here are the fixes I plan
to apply to generate v10.

Kieran Bingham (3):
  fixes! [max9286]: Use the same default mbus_fmt everywhere
  fixes! [max9286]: Don't provide GPIO names
  fixes! [max9286]: Fix dev->of_node refcnting

 drivers/media/i2c/max9286.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

-- 
2.25.1

