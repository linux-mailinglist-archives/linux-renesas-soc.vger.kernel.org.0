Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAF8380D9D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 May 2021 17:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234721AbhENPyl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 May 2021 11:54:41 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:24362 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbhENPyl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 May 2021 11:54:41 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1621007605; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=C4MrA3vome47a+ac6S5FU8cV3uHSTucUPG55PGiSEg+BfOCCS85nqBlqXHQSaZyZMp
    9nfC2vJFvBMJ0nDPXS/RkyBCyGKzV6GmyYWwKrfcACQzti684FlQcuLfIJYeQNc2nOn0
    WMfhM0Uln4g+kG9LrmLG5G2isdT9P8MZ9EPXPN7Y3ZsAPk1hpCam7Uns9CZEi97TtFbS
    7+thtUixNkyBiXPcpqrJsz/bTeqrjq4J6mcsAfm0ZUq43XCPkiXrmJXXe/n/ygozNrs6
    Z9R6RpYO9LFEurLn2jEkpXJ0YX3zzdgdHIUW74qeIrbK/6DlEogEwxOQOuT6HX4ds0w9
    r1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1621007605;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=tur7A0kVwKDrMD3sFXmJgneyeEJDMFyMOdHGfAiq8ws=;
    b=FEA/Hccheo8sP7nhqoeOb7HePeUo3ayXYT3c/+vqjRCQQWYQFmGP+pWd1Us+zhCo7H
    GoRpvNFr70Ax1hx/h1FOg0ANHCWC6QIh8s2aMF5exq+f6pHof/qgPPja7cWP+xkqrvtL
    6vrx2MaIWLKEhypXUnXAdtxl2QXCCKhWhXwpO4Jbi/pxnq3+LZVPFwNc1EARtfGoEU5w
    TPomgvI5vN1F5eYne3wTB2WSePhD5AoWXF/NO9Cy/Am7ojXbvvi/PbFQVcF6TM4UBb0J
    BIIR4P6okSc9qRYnwiigKxIFBexxNa23xGxv4la/bF7uAOfqSUZwkCmx3OjjPXL+rd/H
    wcaw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1621007605;
    s=strato-dkim-0002; d=fpond.eu;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=tur7A0kVwKDrMD3sFXmJgneyeEJDMFyMOdHGfAiq8ws=;
    b=d1ST0JRe+mfG9OyswOIog6RrKbIAnD0QbefBGMxF7OSb4AMdRbA0ifRAyT84Dyh4by
    XKUb/9XDgN1HkvqrBLQHEDtt/BmVvOW3gckOrm6Vbode+O/IK0uudkM6oS861QSQoCxc
    XTbfYMIbmdw1gqdNdZgHnaqUAnpHyN0BKzfxS1A0F/93oLglI5kDVvMoXsYu1uhFFJm3
    bavg9hZl4JmYf7+OYLvaF7AZZ5h8D8F1tkfa+13C96QfXXKwlr3QLahw0FGxHs8ItU2k
    FGrsO25jEHznJdi1DqaTZ0Ujfyb7ProBBnQ8Em+2PxYY3eM06DbIabdtBBIx86rjnFv9
    MZZg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82tZd8hHUZE="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
    by smtp.strato.de (RZmta 47.25.8 DYNA|AUTH)
    with ESMTPSA id 5052b9x4EFrP0Iy
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 14 May 2021 17:53:25 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
Cc:     wsa@kernel.org, ulf.hansson@linaro.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Date:   Fri, 14 May 2021 17:53:18 +0200
Message-Id: <20210514155318.16812-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The TMIO core sets a very low latency limit (100 us), but when using R-Car
SDHI hosts with SD cards, I have observed typical latencies of around 20-30
ms. This prevents runtime PM from working properly, and the devices remain
on continuously.

This patch sets the default latency limit to 100 ms to avoid that.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/mmc/host/renesas_sdhi_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 635bf31a6735..4f41616cc6bb 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -32,6 +32,7 @@
 #include <linux/pinctrl/pinctrl-state.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_qos.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/sh_dma.h>
@@ -1147,6 +1148,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		host->ops.hs400_complete = renesas_sdhi_hs400_complete;
 	}
 
+	/* keep tmio_mmc_host_probe() from setting latency limit too low */
+	dev_pm_qos_expose_latency_limit(&pdev->dev, 100000);
+
 	ret = tmio_mmc_host_probe(host);
 	if (ret < 0)
 		goto edisclk;
-- 
2.20.1

