Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD674776EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 17:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238902AbhLPQHk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 11:07:40 -0500
Received: from mail.iot.bzh ([51.75.236.24]:48012 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238912AbhLPQHg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 11:07:36 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 4B5D510299;
        Thu, 16 Dec 2021 17:07:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:message-id
        :mime-version:reply-to:subject:subject:to:to; s=iot.bzh; bh=fYWw
        n03jiiuLczTKdRmbPfCPUYmu7Pgk7nhBh9DjseI=; b=An28merbAJfinfFO/fkC
        oBl5p13bUMIiwZ3BOG5+eiRGLRgXr1k9+iaEBhHHfx/ZZLw1V3GJEE51Dv9tNa2w
        /aYUmugcXWZGFjbUjmqSfhgHgLAcwmuBGI+gN7Kt/AtIahF5S8zAf/Sl03BtSgkt
        kdz35gzyNxX/JQTmXpH3WesHbPaWdLHUI4Gu0Q5iNtRUE+AMUENUweGYui3UxuEl
        zO6/qpKPzl2AUED9mh80jgk4arTBFTlbkOBytYNY7UHaOCYgSwCKWjhegw6xXAni
        83ft1NtL2+LIknRir8NMGryxQhzGpRs1UBvmIq2fe3C0nYrnxiNcR9x8v92WAhwx
        5A==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH 2/2] remoteproc: rcar_rproc: remove trailing semicolon
Date:   Thu, 16 Dec 2021 17:07:21 +0100
Message-Id: <20211216160721.203794-1-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Remove trailing semicolon.

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
---
 drivers/remoteproc/rcar_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index 3408c6e51a7c..aa86154109c7 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -163,7 +163,7 @@ static int rcar_rproc_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->rst)) {
 		ret = PTR_ERR(priv->rst);
 		dev_err_probe(dev, ret, "fail to acquire rproc reset\n");
-		return ret;;
+		return ret;
 	}
 
 	pm_runtime_enable(dev);
-- 
2.33.1


