Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8B21A55D9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2020 01:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729729AbgDKXMg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Apr 2020 19:12:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730200AbgDKXMg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Apr 2020 19:12:36 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51F3020757;
        Sat, 11 Apr 2020 23:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586646756;
        bh=iKwlITql0bHVR1UsefBSbwLC2B0Q0vMnkEtGaAcNIjs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p5QEDk6Q0wjiLWG1K7cOC0JrLlGDFdwBvdXYwgomB2hnnkULM7SsF1JUnSFd1jW7b
         /PPQquiMqMpm8sLoCwqP8F3wLW6eYXSh7uhOGotI/vE7qOeeiO4uWD/5JtoKzxaSIT
         hqgeKwbBGD+OmoABiK9yQQ66T9cJyWo7pq94wKec=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 27/66] sh_eth: check sh_eth_cpu_data::no_tx_cntrs when dumping registers
Date:   Sat, 11 Apr 2020 19:11:24 -0400
Message-Id: <20200411231203.25933-27-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411231203.25933-1-sashal@kernel.org>
References: <20200411231203.25933-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[ Upstream commit 6eaeedc1aa27a423bd89043705eca39215015bb3 ]

When adding the sh_eth_cpu_data::no_tx_cntrs flag I forgot to add the
flag check to  __sh_eth_get_regs(), causing the non-existing TX counter
registers to be considered for dumping on the R7S72100 SoC (the register
offset sanity check has the final say here)...

Fixes: ce9134dff6d9 ("sh_eth: add sh_eth_cpu_data::no_tx_cntrs flag")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Tested-by: Chris Brandt <chris.brandt@renesas.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/renesas/sh_eth.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 441643670ac0e..9e735b52b85fb 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -2164,10 +2164,12 @@ static size_t __sh_eth_get_regs(struct net_device *ndev, u32 *buf)
 		add_reg(BCULR);
 	add_reg(MAHR);
 	add_reg(MALR);
-	add_reg(TROCR);
-	add_reg(CDCR);
-	add_reg(LCCR);
-	add_reg(CNDCR);
+	if (!cd->no_tx_cntrs) {
+		add_reg(TROCR);
+		add_reg(CDCR);
+		add_reg(LCCR);
+		add_reg(CNDCR);
+	}
 	add_reg(CEFCR);
 	add_reg(FRECR);
 	add_reg(TSFRCR);
-- 
2.20.1

