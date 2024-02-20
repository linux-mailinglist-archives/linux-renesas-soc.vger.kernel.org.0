Return-Path: <linux-renesas-soc+bounces-2978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FA885B2C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 07:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 864271C20A62
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 06:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1134158104;
	Tue, 20 Feb 2024 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="gk1GsFD2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2089.outbound.protection.outlook.com [40.107.7.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A8258208
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 06:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708409661; cv=fail; b=TjQqVMkmLpiFkmDr7xvbDTmZdC3CI4ALUZFzCV3PRCDLmB3gMYuW2qWMttb0i0myYqhItlhF+x92BcY3jKyZbDkEUD2nfTu64UkPU8e8dd7MQSw8I+qLvvPbvi+Gpjlte1HTMceJDDpE1d60id5PcnemIF+ZviJjpXvg6toKvCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708409661; c=relaxed/simple;
	bh=tQzQbdCmvOGihIylEwiS2ISwzE8JvGHDqgoXq2cmc5E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YFPDYLna7M5j64KsGUIUcspv9cx56WxYKiCLYKN/1yK2plVGC9ComjEuZcd5LXbfrF5tKoSbOzZ0Cg+FaVAC8YVO1lNRBl+3uY+SdY8wCEL6Z9sCpM4P53fbvHZiKDxoEN9kbosk5PU474wRZHoeYqaEIgi4Uc00a3kAFtWE/DU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=gk1GsFD2; arc=fail smtp.client-ip=40.107.7.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBt4F1hzyTyXYPnbLYrulk22wXopJF2hruj2Xe0Us/mzuJ6QbGjPntVjhvokG54NH/AiShfOL91a7lXE1GDUutH53O0AhVRooqmjDyQUiFjGl68yf+wh61li5u7wCGyCWSp6tBzOKWWoeYaXEilyVwMkO/ejWglNT2ainPSySuwp/dkuxJ2ZTdtmC/6yfiM7b23iuYJkwhD+Px9p8yk8Xy1OGsxZZiA1smuTbcxI2CuQMa+PYTzlpWiot1u2iZi1+1NuoUYjRO0UTbNdgmn/dn0m5EMa4p74IPKFf9DZW+orj9b6FdoewyCAjPIaNLpqZ9cfB02YJUYBxzPpVAEnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fd03Jo1pbO1rjH5WVChf69lG6loYjMQUvDAzGINvfhI=;
 b=Kt1uc0vO/TRd0S9R7B8GxhSCTj+0jVJYTmjdny+4LBP3431DwoUtWNIv1DBXAjHdjRuHzP27u0vxLzzDx66mgYtsaLO8+kVfdk11VkZtAnzDApUZKNaFXD0u+/n6N5eEhRAIUalkON4ZOKaPF+OsS6TqrRzqrfKqxTtuYkR0rOAHAmJwpG6JtcK8N7HIDX4DXI+e4hi0Xux/fPKmb6fNmqlc9lte5iM98Glnl9h6OwvhXdx4HavPEwoHbZVxzrWR+SobYDb6OQNAosGVAiBDDtLn4tVZGfLb7bSl2qVFIqbs2Og15fyg2bU7sRjIoA5VIa9xObEWn/pK2Cu0SAXo3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fd03Jo1pbO1rjH5WVChf69lG6loYjMQUvDAzGINvfhI=;
 b=gk1GsFD2Za+ViSSK9jG2Bm+vh4nv/Lwy+DK8bUxF8mkJNA2UHy8IeBvToPHX0XMhma8jyTIMlA/+lLIADzQpGg7gk+xe/OZzu9KRsmQHyzGHjKlBw9FSxOJlqGOBRacUJKyTDOH0p5IFGKCqJ2ZlNqrdT6eVCWYa3nH5xJ7j8q8xu+Txt0+wRQZCWddGx2V4Bol6B4gKeO3xePfzli2fMM2uBnNl7l+EMrQ6PiXpBdafVS6Tyu42nK37AoQdnQgeddiZrhHdpAnb4ZTDrpAux8j4HAfNhjcT8OU2RFhidXsfJUZdCvtKyp6UvBVLl2vubGM+6bJdaQU1M4jmu4i+3Q==
Received: from DU2P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::35)
 by PAWPR10MB7272.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Tue, 20 Feb
 2024 06:14:13 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::ef) by DU2P251CA0023.outlook.office365.com
 (2603:10a6:10:230::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39 via Frontend
 Transport; Tue, 20 Feb 2024 06:14:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 20 Feb 2024 06:14:12 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 07:14:10 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 07:14:10 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] [RFC] mmc: tmio: Protect the asynchronous usage of mrq by a lock
Date: Tue, 20 Feb 2024 07:13:56 +0100
Message-ID: <20240220061356.3001761-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.28.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E6:EE_|PAWPR10MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: d937c042-5b08-4e16-ceb1-08dc31db28a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ETCx8uoDsn04FrHY5816SBPIBjCtVgNngPpJ8rH94XEj9m08bGyZ3Ot0mJJILzgL10Y7oenTStxRWmV5RlRM0JixMCIoUHn+AUwBmvMMGHRxEmSFmFOqX4vOd6aGuOFSdu4j4cZFgAw8ctWG+2hhhZDv1r+RSRnC12T6O7eCcTca+16UpJ0LNqb4CVtwUx/lMc1lYaR8nOzrFtXkGV8tDZKEyFgOU1cvdIqRscLufqOaytcYwpbsymf7qHxA5F6irw7WLzMNHMIT4wH4xRmIyz2LvQuIQNu9ywZLRK/+SQ1K/Jw1RNIfh4HV5n2rlZ0QA9QT5PkoV3hL/vGp7MOUxBhlxDcqYljvq+xPn5lFUhoQsOpU7x3Pq85oEMyOA9335JhbsmJcbppP3R1Z5rojJxfQ9YdMKEiuqvNsPcXYhzoUglB7MDuKVkoV9RxtcU24BqoeiieXUL7ytn9C1Vz/EQv7j+PY5C5e6ey7aML0V/x5N19n5YmFbE+ENqk84bTl2GUtGEbY70ljyZ7/C8Guiz+xMk1KacKDQWe+4BbOkiySqIZWJLhHu/KVZTHHDygf/EcUo/Ofz2mVwt+CSgKXMAUY2MHtH3icrEp28XVhIHr/V2368A67nUhVMLCuswcgwnWHKrNa9P+fQvTdu6psztSsequLmQ1o/B/1PP/JDStcRV8VXDiBN2iai1y1sLNFzJBQCuJORYrp8jftLEseYA==
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 06:14:12.8358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d937c042-5b08-4e16-ceb1-08dc31db28a7
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7272

Analyzing the KASAN report [1] tells us that in

mmc_request_done+0xcc/0x30c

what can be resolved to an access to

mrq->cap_cmd_during_tfr

in mmc_command_done() called inline from mmc_request_done() "mrq"
becomes invalid.

In the driver we have two work queues, tmio_mmc_reset_work() and
tmio_mmc_done_work(). Both operate on mrq.

Synchronize this by extending the spin lock protected sections.

[1]

BUG: KASAN: stack-out-of-bounds in mmc_request_done+0xcc/0x30c
Read of size 1 at addr ffff8005df517738 by task kworker/4:1/2308

CPU: 4 PID: 2308 Comm: kworker/4:1 Tainted: G         C      4.14.327-ltsi
Hardware name: custom board based on r8a7796 (DT)
Workqueue: events tmio_mmc_reset_work
Call trace:
  dump_backtrace+0x0/0x1fc
  show_stack+0x14/0x1c
  dump_stack+0xcc/0x114
  print_address_description+0x54/0x238
  kasan_report+0x274/0x29c
  __asan_load1+0x24/0x50
  mmc_request_done+0xcc/0x30c
  tmio_mmc_reset_work+0x1fc/0x248
  process_one_work+0x324/0x6c0
  worker_thread+0x358/0x4d4
  kthread+0x1a4/0x1bc
  ret_from_fork+0x10/0x18

The buggy address belongs to the page:
page:ffff7e00177d45c0 pfn:61f517 refcount:0 mapcount:0 mapping:
(null) index:0x0
flags: 0x4000000000000000()
raw: 4000000000000000 0000000000000000 0000000000000000 00000000ffffffff
raw: 0000000000000000 ffff7e00177d45e0 0000000000000000 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8005df517600: 00 00 00 00 f1 f1 f1 f1 00 00 00 00 00 00 00 00
  ffff8005df517680: f3 f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
 >ffff8005df517700: 00 00 f1 f1 f1 f1 04 f2 f2 f2 00 00 00 00 00 00
                                         ^
  ffff8005df517780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff8005df517800: 00 00 f1 f1 f1 f1 04 f2 f2 f2 f2 f2 f2 f2 00 00
==================================================================
Disabling lock debugging due to kernel taint
------------[ cut here ]------------

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---

Notes: Instead of extending the irqsave spin lock sections and with
       this blocking the interrupts even longer we could discuss if
       a new "mrq synchronization" spin lock should be added. But of
       course the 'host->mrq = NULL;' needs to go into the host->lock
       protected section.

 drivers/mmc/host/tmio_mmc_core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index be7f18fd4836..d876af57db48 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -261,14 +261,15 @@ static void tmio_mmc_reset_work(struct work_struct *work)
 
 	host->cmd = NULL;
 	host->data = NULL;
-
+	/* Ready for new calls */
+	host->mrq = NULL;
 	spin_unlock_irqrestore(&host->lock, flags);
 
 	tmio_mmc_reset(host, true);
 
-	/* Ready for new calls */
-	host->mrq = NULL;
+	spin_lock_irqsave(&host->lock, flags);
 	mmc_request_done(host->mmc, mrq);
+	spin_unlock_irqrestore(&host->lock, flags);
 }
 
 /* These are the bitmasks the tmio chip requires to implement the MMC response
@@ -812,9 +813,9 @@ static void tmio_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	wmb();
 	host->mrq = mrq;
 
-	spin_unlock_irqrestore(&host->lock, flags);
-
 	tmio_process_mrq(host, mrq);
+
+	spin_unlock_irqrestore(&host->lock, flags);
 }
 
 static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
@@ -841,8 +842,6 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
 
 	cancel_delayed_work(&host->delayed_reset_work);
 
-	spin_unlock_irqrestore(&host->lock, flags);
-
 	if (mrq->cmd->error || (mrq->data && mrq->data->error)) {
 		tmio_mmc_ack_mmc_irqs(host, TMIO_MASK_IRQ); /* Clear all */
 		tmio_mmc_abort_dma(host);
@@ -855,6 +854,7 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
 	/* If SET_BLOCK_COUNT, continue with main command */
 	if (host->mrq && !mrq->cmd->error) {
 		tmio_process_mrq(host, mrq);
+		spin_unlock_irqrestore(&host->lock, flags);
 		return;
 	}
 
@@ -862,6 +862,7 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
 		host->fixup_request(host, mrq);
 
 	mmc_request_done(host->mmc, mrq);
+	spin_unlock_irqrestore(&host->lock, flags);
 }
 
 static void tmio_mmc_done_work(struct work_struct *work)
-- 
2.28.0


