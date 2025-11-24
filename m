Return-Path: <linux-renesas-soc+bounces-25047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8768BC7ED10
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 03:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 30A50342709
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 02:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4C227FD5B;
	Mon, 24 Nov 2025 02:24:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1B923BD1B;
	Mon, 24 Nov 2025 02:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763951084; cv=none; b=uK2qi2sjJJVIILBHgAMeyQ5IzM39qCY/88ZB7HtaujrP+ekYOM/7kZuGu2FKCzLORYwcRljmvK4vpxf3F/N5pmodjFr4L2YG3XrvaR7R9iwBmKVR7hCfxDqL2agsEeVMgzlOhlONd2KdshhZhh1YTt0Wmwe3eIeLBybD9kqLcds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763951084; c=relaxed/simple;
	bh=9rkGtgQQzaCuqGZb2BOXJAEhO0UUKDkvn+6qsQpTYs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gtkw9+DRE70pRR1ZGg1qFrmTERM7NzsqKOpB7VxrDj5IPtd8TvzTpkOJNjRhkfeiAKU0DrRNLr6FO8RMaJi3WPjPO0uHaSuNGIEgcPenAv9j8W8dRIF4dlYvTbbaqqIQG20MxmqDQoMstHdKqk/Pop0JqCJpZ6R3c2lB87VRYoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAAX4HDgwSNpxE3SAQ--.13602S2;
	Mon, 24 Nov 2025 10:24:33 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: herve.codina@bootlin.com,
	gregkh@linuxfoundation.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] usb: gadget: renesas_usbf: Handle devm_pm_runtime_enable() errors
Date: Mon, 24 Nov 2025 10:22:15 +0800
Message-ID: <20251124022215.1619-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAX4HDgwSNpxE3SAQ--.13602S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF45Cr4fKw4kAFy8JF43Jrb_yoWkWFbEkr
	45urWxXry0qr4DK3W7Ja4avryI9F1kXr47ZFnagw4fAFWUKrsrZryjyF98Awsru347Crn0
	krnFkF47CF93ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUbT5l5UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsQA2kjuw0bvwAAsG

devm_pm_runtime_enable() can fail due to memory allocation.
The current code ignores its return value, potentially causing
pm_runtime_resume_and_get() to operate on uninitialized runtime
PM state.

Check the return value of devm_pm_runtime_enable() and return on failure.

Fixes: 3e6e14ffdea4 ("usb: gadget: udc: add Renesas RZ/N1 USBF controller support")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/usb/gadget/udc/renesas_usbf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
index 14f4b2cf05a4..4c201574a0af 100644
--- a/drivers/usb/gadget/udc/renesas_usbf.c
+++ b/drivers/usb/gadget/udc/renesas_usbf.c
@@ -3262,7 +3262,9 @@ static int usbf_probe(struct platform_device *pdev)
 	if (IS_ERR(udc->regs))
 		return PTR_ERR(udc->regs);
 
-	devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0)
 		return ret;
-- 
2.50.1.windows.1


