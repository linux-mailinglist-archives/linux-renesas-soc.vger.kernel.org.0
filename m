Return-Path: <linux-renesas-soc+bounces-19454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEC3AFF172
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 21:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E012F1C84C74
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 19:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008EF23C4FA;
	Wed,  9 Jul 2025 19:07:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9556233158;
	Wed,  9 Jul 2025 19:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088038; cv=none; b=oAfl7tmlzKlcs9/GSGjFKlLkT2G3JVtKpZdIA3c5AmK22xJNKVfNmch2HF5DiDlq90Zryv5IDC3OB8tPNVcywvcTcr/0/adDqcEpMUK+HDnwKS0wwbvnTfwhns3wv+7oONPMDxcBQcIiPtfKcYyqL9okc+ANfIwqmYca25Lrj0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088038; c=relaxed/simple;
	bh=xqkVLHRdxE9lNVpmAKGwBrjctmuxSuIOxgVeit0QvzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AHvyvblEOQ9bK5QRfjNIEYMAFBeXcXJ0kEInA9Ia9943XP0MxsIkdhqOHJVkJKSuJ6HsvQ3cOk+mLkfxO/C0nI0+VFgzwoB8COyIDTYSfwejrq/bEc9bSWiT93bqQrXL+6dI7W6sXoIhR4Y/Lng8DQeAocMSot9hrmKCxmiXIUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B93C4CEEF;
	Wed,  9 Jul 2025 19:07:14 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] usb: gadget: udc: renesas_usb3: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  9 Jul 2025 21:07:08 +0200
Message-ID: <424d6c7843c5bfd47c0e1d8d02aa030581530bb1.1752087999.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas USB3.0 Peripheral controller driver from
SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
This lets us drop the check for CONFIG_PM_SLEEP, and reduces kernel size
in case CONFIG_PM or CONFIG_PM_SLEEP is disabled, while increasing build
coverage.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 3e4d5645759791e4..d1b72c15799f65f4 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2973,7 +2973,6 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	return ret;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int renesas_usb3_suspend(struct device *dev)
 {
 	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
@@ -3004,17 +3003,16 @@ static int renesas_usb3_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(renesas_usb3_pm_ops, renesas_usb3_suspend,
-			renesas_usb3_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(renesas_usb3_pm_ops, renesas_usb3_suspend,
+				renesas_usb3_resume);
 
 static struct platform_driver renesas_usb3_driver = {
 	.probe		= renesas_usb3_probe,
 	.remove		= renesas_usb3_remove,
 	.driver		= {
 		.name =	udc_name,
-		.pm		= &renesas_usb3_pm_ops,
+		.pm		= pm_sleep_ptr(&renesas_usb3_pm_ops),
 		.of_match_table = usb3_of_match,
 	},
 };
-- 
2.43.0


