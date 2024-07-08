Return-Path: <linux-renesas-soc+bounces-7157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E10EA929E5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 10:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 674E9B20C7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 08:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFC129CE8;
	Mon,  8 Jul 2024 08:36:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EBF1C287;
	Mon,  8 Jul 2024 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720427762; cv=none; b=bFllujIsvk0foE2XQOByx+ko9f2sg5qEqwYUKfgF9uu74jvfwQ/6RYgvpL2U44mUeME5UIQIYdyhcdpvlYstR75gKrqOpmvhVunXMI8+44kSoG5nW+wuUwOnE68NQpXYbK5HwnVwmo19SY0VAijY8sF0NQIcQqg8EOfMhWJQ1yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720427762; c=relaxed/simple;
	bh=GSp5TbBpszB+9pg3881ujCUrVWQgn99yRaEHSrBokmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nANJhtqznM6wk0RdJNd3/+2aXMolU7bOGeJngDjBFaIrcNJM01v8jyKvXHHN3xCV8fwZujmWh+epdPaKZhSm2nMzaXQPtx7UWE8Z2afj5p8eAymfIgPzxAu7cSjrk8DiU3be+uchckqG2KN+GEEXgc0/FfPdsj8+qdgOZ6dqvlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,191,1716217200"; 
   d="scan'208";a="214606289"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jul 2024 17:35:58 +0900
Received: from localhost.localdomain (unknown [10.226.92.86])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1EA6143E660E;
	Mon,  8 Jul 2024 17:35:55 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-remoteproc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] remoteproc: rcar: Fix PM imbalance if RPM_ACTIVE
Date: Mon,  8 Jul 2024 09:35:51 +0100
Message-ID: <20240708083553.30799-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pm_runtime_resume_and_get() returns 1 if RPM is active, in this
case it won't call a put. This will result in PM imbalance as it
treat this as an error and propagate this to caller and the caller
never calls corresponding put(). Fix this issue by checking error
condition only.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/remoteproc/rcar_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index cc17e8421f65..3373a74d8b3a 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -174,7 +174,7 @@ static int rcar_rproc_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(dev, "failed to power up\n");
 		return ret;
 	}
-- 
2.43.0


