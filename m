Return-Path: <linux-renesas-soc+bounces-17465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97100AC2E33
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 May 2025 09:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 550DB4A24E3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 May 2025 07:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFDE1DF98F;
	Sat, 24 May 2025 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OTFsLv76"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE261DACB8;
	Sat, 24 May 2025 07:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748073551; cv=none; b=uVcUJfzUT3xx0WJd2BQSDk2VMblNTiD4z8MwhE9iZKl1QPuiVLIX0NeU9UqMoIOTAppGCln89HdBbrL1em0OTGsA8duFkwfxRT2F8JZ5XgEHtSGJalzDJVGmUkw7QdMf/M1E6ed85E4nZNQcNOCqL437hX4Hj+hpf2aBUQDgbkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748073551; c=relaxed/simple;
	bh=9jUiIHXZ/mYOiN0HsPPoU1jm3Nz1asDBthDRQBZE+DA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MR5HIshYd9EnJfKlCon77MYQzv3qIqoxMXYlkHSt6jokY2aqe6XKoFBIxmL+FOSRkIDmWnGRyrW+RPlKddY4JdWKvh3QEprQmzYAWRVczfL3Re7DEaUcgCWl6nhpLfAJdJl7OVXchm7daUFZhaC9dd4Wgsr8KEQOmPzFT+g/N60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OTFsLv76; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=6i
	/ZtaCjfDaeiMffEFfk5xTWqg3WcPt0s/962umeTPA=; b=OTFsLv76iaWjUqnIgi
	HnlfXQxD4sx6t1vsw5J14YLrYfWEgoEvHXMM3UtDkuCsLnfqWmRnTx7Cf620dgyy
	sxEvKQA7zvwyOIVy/MUpA9RUOTzDQCqgfYCWnDPzcDjxuqzbbwrBRxx5Zhh+Fqg9
	MBU4E5JIlKN8dEMZGu5ZH4Gbw=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDn7x4ifDFoCLuUDg--.5328S4;
	Sat, 24 May 2025 15:58:28 +0800 (CST)
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
Subject: [PATCH] net: ethernet: rtsn: Fix a null pointer dereference in rtsn_probe()
Date: Sat, 24 May 2025 15:58:25 +0800
Message-Id: <20250524075825.3589001-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn7x4ifDFoCLuUDg--.5328S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryxZF18GF4fuF4xCw43trb_yoWfZFc_KF
	12vF4fXr4qyr1qkw18Kw43u34ayr1kXr9YvFsrtrZIqay7ur1rXFZ8ZF9xJr1UWrn5CF9r
	ZrnIya1xA34avjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNvtCUUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbB0g1XbmgxdoGcTQAAsZ

Add check for the return value of rcar_gen4_ptp_alloc()
to prevent potential null pointer dereference.

Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/net/ethernet/renesas/rtsn.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index 6b3f7fca8d15..f5df3374d279 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -1260,6 +1260,10 @@ static int rtsn_probe(struct platform_device *pdev)
 	priv->pdev = pdev;
 	priv->ndev = ndev;
 	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev);
+	if (!priv->ptp_priv) {
+		ret = -ENOMEM;
+		goto error_free;
+	}
 
 	spin_lock_init(&priv->lock);
 	platform_set_drvdata(pdev, priv);
-- 
2.25.1


