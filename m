Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9014776DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 17:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238877AbhLPQHP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 11:07:15 -0500
Received: from mail.iot.bzh ([51.75.236.24]:64067 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238898AbhLPQHM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 11:07:12 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id D633310308;
        Thu, 16 Dec 2021 17:07:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:message-id
        :mime-version:reply-to:subject:subject:to:to; s=iot.bzh; bh=DV8D
        SOsgN21ssw6Dl4edg2TiykDN2Fiu/h2qfb7vOWw=; b=jOm92vhN6veL9BXgoN8H
        Z+hdpxEqyGlGfYDmaX7G/GIhbRPJc0w4cx59fe02rDYtXdqkQPkPkzVmeAALMrHN
        HP5wV7gWE1B+/wC+lhISfEshrdNbtTW7Qoj299L7TbCctdcEuUIyEyebgEyQlKdT
        W+tjql6NXORQpurdpUoN00suy/Asq3NX+TjVEpH9tJvaC6+a6yIWnOuJ44CHRDk8
        7YQEumbl6MRpawpybpSk3kgLeh1bcgbs/+WNe04f348UKQzOiCIk+R79NDlGQ4wr
        Z61r0TiiGVupBglf9iH2C+X8uUi1+hdqUEf2+lTcaA8A1+JbXqbRmQnt/cL9TUHF
        JA==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        geert+renesas@glider.be, dan.carpenter@oracle.com
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH 1/2] remoteproc: rcar_rproc: fix pm_runtime_get_sync error check
Date:   Thu, 16 Dec 2021 17:06:53 +0100
Message-Id: <20211216160653.203768-1-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

pm_runtime_get_sync can also return 1 on success, change
to use pm_runtime_resume_and_get which return 0 only on
success.

This bug has been discovered by Dan Carpenter by using Smatch
static checker.

Fixes: 285892a74f13 ("remoteproc: Add Renesas rcar driver")

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
---
 drivers/remoteproc/rcar_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index 34fd867f9f8c..3408c6e51a7c 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -167,7 +167,7 @@ static int rcar_rproc_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_enable(dev);
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
 		dev_err(dev, "failed to power up\n");
 		return ret;
-- 
2.33.1


