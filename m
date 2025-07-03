Return-Path: <linux-renesas-soc+bounces-19077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B25AF6F93
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 12:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5689A1C40EF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 10:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290912E1752;
	Thu,  3 Jul 2025 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="U/RVzsMt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AA613C82E;
	Thu,  3 Jul 2025 10:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536912; cv=none; b=Vok3TnUMXnAc/SN6oYLychq9JxeNm5cWorh9v7ecQQS07v1OH3vEEMXn1sKk80Lkyx6B2zVdL56g+vMWSa0TIWgFEpbi+sALIug2s+xesNjMCoBUmYVGYWw9jxUjRvbkm+zCTLVhlVDGZrNqh6PRf4/a9bwW8Zw7PqzQoC1+8CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536912; c=relaxed/simple;
	bh=SIP1cv/nfFPPcYAt8bSxvGN9cHpfhJDhYuQ9yDbsm5o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dnlrhkIDrouZpJPa3uDh18iVio4tE/RjTRSS154v39XIELCOZZ894wvgY4gtb7HayK0zS8mfU1VVuxRHww3ZtvGk+GY3WPiwx9gP6EG6wGQs0c40HwvlY3oTLNYYp5DMmvzR8t0TCoojpSuwN1y+3MA4PP+pfwHHQmcGkAE6TzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=U/RVzsMt; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=KO
	0SdRrfWM51e/MZYsiLBwiZIMApjZVXhDZgKnfi9JQ=; b=U/RVzsMtX6PHAUMIvs
	fBiCvOt6AK1MlEhfJg7O8rJU3k0zTCVLbXKe7ShzY5O0pAogwR/kAaX5BYeIKsfJ
	1JRlyncww+b+A2NtSMmTkvb634w0Eq4DXr5NCa+uCIjpA7LsstlKtE/ppm6/E0B9
	kj5MDrlizF9Z6AnzOAUNaNbnI=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD374rnVGZoZdkDCQ--.58228S4;
	Thu, 03 Jul 2025 18:01:12 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: niklas.soderlund@ragnatech.se,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] net: ethernet: rtsn: Fix a null pointer dereference in rtsn_probe()
Date: Thu,  3 Jul 2025 18:01:09 +0800
Message-Id: <20250703100109.2541018-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD374rnVGZoZdkDCQ--.58228S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryxZF18GF4fuF4xCw43trb_yoWDKrX_Kw
	12vFs5Xw4DAr1jkw1UKw43u34ayr4kXr9YvFsrtrZxtay7Zr15XFZ5ZF93Gr1Uuwn5CF9r
	ZrnxJa1xA342qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRG0PfUUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBkBh-bmhmTADskwABsl

Add check for the return value of rcar_gen4_ptp_alloc()
to prevent potential null pointer dereference.

Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
Changes in v2:
- Add a blank line to make the grouping similar to the
style of other error checks in probe. Thanks, Niklas!
---
 drivers/net/ethernet/renesas/rtsn.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index 6b3f7fca8d15..05c4b6c8c9c3 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -1259,7 +1259,12 @@ static int rtsn_probe(struct platform_device *pdev)
 	priv = netdev_priv(ndev);
 	priv->pdev = pdev;
 	priv->ndev = ndev;
+
 	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev);
+	if (!priv->ptp_priv) {
+		ret = -ENOMEM;
+		goto error_free;
+	}
 
 	spin_lock_init(&priv->lock);
 	platform_set_drvdata(pdev, priv);
-- 
2.25.1


