Return-Path: <linux-renesas-soc+bounces-2881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2657F8579B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 11:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B0BA1C20C5F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 10:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7261BF3A;
	Fri, 16 Feb 2024 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="sy1h8xZR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2048.outbound.protection.outlook.com [40.107.14.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B349F1CD0B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2024 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708077598; cv=fail; b=sNVT+YEH/qWosHQVFjHLUL0Edda+8pNr9g8G1tGUshukeNToNJPUmbeWIF/k44XG6Q8YTc0Vk1lOxb9DozIOxySlr7TtE/nHQdexwkCS2B9IeTJ2GmWi6lZfpeat7rwmkFVNeVv+z0penRYmg9aqZ5+OTCZkX4g+enlVQpCR2Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708077598; c=relaxed/simple;
	bh=ONhtcayhlnaLxUkesLY3ujuoPMc3tiHls3UIFyEG/mg=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=b1FYYFQcvKsKdxUZuFBGTPm/I+unlriVF5GYPojhRfJz04yx8/Tb59q9EVzIz1cDVgGGAAS6bXD+3zh//xXaOwoTAZZT+DboxXb4OaIm1gXE9XthWrQxIekSS0FCYyK+Nvt5CREn9GvApGa3LXK6jQv2wBrq503wasubJK4jauw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=sy1h8xZR; arc=fail smtp.client-ip=40.107.14.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z590icN2irEbZJBpY+qAvGLjnSZcJZWhfYsw+cjLawAa5dNOJsQJTvhSPH5DDw4aNBVZLiXtM2wNvwIE3j9I52g2ybU9yZFZcvm6sFicVETBsyIyDpEvVemSO0BMbctsCRqUFhBf3JT3QXaxOKJKQaJzQtNuILb8vZz6q6qkRbAugxUVqokSNTFU6mnV88RkC8eAq4Zo4dzjky6asTe3JM/kLISIVttwjs5faLmIrTu1seLqo5iUUWIDqFJ4nOIQT3wU1EKha/jbFGq33ROw21wG5DLe6R8bssDmdo3xs1I+nOiLJDWNAQtngEcpMiQ1WpkABZuyOhiy+UExo40nbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/jVinjjBYnVDNH+MThr/fzQH+zs9zWiheyBvzDC6y8=;
 b=ZzGYvUuwAF14Dd+RnbZ9FlZSSVXoXk99raH4lgFzVOHl6e6B4MUFzvFt9eILxxheYzcpL35cxrCXpZpS7WBBCeZvKV5MerRqZni99UQypak5tp0j3IEtvb4eqraxgGXCp74G7BlKslkGwxJuggN6oFvYv0lj2avqOY15LcmV50Kvk9YAOx/QN2B5LyQ7ZmQGNnq55ZmJ5y6VqvfAguiuL8xy3gR2bUHdVCruCCRFcSzDHp0gx53b447a38bkFzpH0ZWW2zqQ4ObByUx2yillSy3FjMR1S8KCEm5mSpBibCsVEOnudYC4KBIcHzJo1fOElIgCaiNhopczp5v+Yn/3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/jVinjjBYnVDNH+MThr/fzQH+zs9zWiheyBvzDC6y8=;
 b=sy1h8xZRZeODEZ9s6Mzn2k+507EYuMw7yvcvLK2Yy8pPF6rL5cScMZA2XN+eOSYvRf4COwqRjyJSlEmhfGUZtnCmCqNilUPK9htUu0LSryCXkxCvdSACxEKUDxnX8qzNlzm9UWC/oSKWDHxD4WyLo+WFIF8iMzJA/Jl6TkWURMn6ahsOEwnCnyEh2Hc/RNMXmT3c/e4p8+GeCYpwSvBOYOWJXMoNG1XgHfq+/ZlQnh2I/aEIuyri/8+Hl9ciFW0lxZIj50GLqhBmoAWNWJL7nHQBhAIJFZhjjUPGQZZbxKqC7vtnBx50sF2SXcDXFeip0pTt2ufvqLYIinJwvA6DrQ==
Received: from AM5PR0601CA0063.eurprd06.prod.outlook.com (2603:10a6:206::28)
 by AS4PR10MB5524.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Fri, 16 Feb
 2024 09:59:50 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:206:0:cafe::92) by AM5PR0601CA0063.outlook.office365.com
 (2603:10a6:206::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 09:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7316.0 via Frontend Transport; Fri, 16 Feb 2024 09:59:50 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 10:59:48 +0100
Received: from [10.34.222.178] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 16 Feb
 2024 10:59:48 +0100
Message-ID: <8005c246-0555-45d0-ac36-b7a23002e1dc@de.bosch.com>
Date: Fri, 16 Feb 2024 10:59:35 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Subject: mmc: tmio_mmc_core: Locking questions
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9C:EE_|AS4PR10MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: ee87b1a7-f025-4b17-5cdb-08dc2ed603f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w9rePxjJDlOizab/Nv0NRKotORh+BPXSqISh7VzpEQTkyHebKYwdN9iOOuJiv5WykQtC++C1elhqrQBjoxpmkkCNm3UW9Qzgm5MA4Boi032jbPVNxuJl37d9psvkQtl7dNVMb+euxNer2Gos8SaIR40yRNLTPO25thH1xfXTc+h9VUM7T198YFPK1Z67mCOnd1D85bUShP+NTMgx1JHJJ24TZDAcu/Inv9+d/bYNH3qzX98wt/RDvNz7UGZDG3KRLAezvXsfgKVZs7WvKRDUgPIScHudx7CA/wj11n6ICsR8ISRp4wsPGtKM/g/DhAWj/6QznGBGXgI8FormMvLQKKWEjxn2S/de44PJKUmSeyLpUJNtiYaCK4nIcd06nefVp7tAxaOCugE+7AmbhLT7ztWQjnaWkI4hXHSmXmZbjSldrFl4qNQ3u7vTiqKqg5C8Uis2ZQjQCtvqzHoLt6y4xVtiyV5BSa0QsbenfOU+V9EsmuJIC8flRGobbKU38V5OMisw1YWjuzNSrpiCZ7nxAleoJNl5edpavqgiuylT1x/Y8IEx/B9wWQsZmwp+Z4Aew/v5zD2W0A9jAiMjg9TtPgmSniFIo9htGc/e/ox68RTr4utdQmheDhmv+qBvuycXVQlnbLeZprNY+HX8s+pHu8SArAj443hWhZ+WbKJrIdxjfX7nvioQSeUcTYG3NUpG
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(451199024)(36860700004)(82310400011)(186009)(1800799012)(64100799003)(46966006)(40470700004)(31696002)(2906002)(86362001)(5660300002)(316002)(70206006)(6666004)(336012)(966005)(426003)(16576012)(41300700001)(16526019)(107886003)(2616005)(26005)(478600001)(8936002)(6916009)(8676002)(4326008)(70586007)(83380400001)(31686004)(356005)(81166007)(82960400001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 09:59:50.3408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee87b1a7-f025-4b17-5cdb-08dc2ed603f7
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5524

Hi,

using drivers/mmc/host/tmio_mmc_core.c (on 4.14.x Renesas BSP) what is 
quite similar to [1] we are trying to analyze a KASAN out of bounds 
report [2] in

...
mmc_request_done+0xcc/0x30c
tmio_mmc_reset_work+0x1fc/0x248
...

Trying to resolve mmc_request_done+0xcc we think this is the access to

mrq->cap_cmd_during_tfr

in mmc_command_done() called inline from mmc_request_done() with mrq 
becoming invalid. See [3].

Guessing about options why a wrong mrq might be used here, we have some 
questions regarding tmio_mmc_reset_work() [1] what is a delayed work 
handler (running asynchronously). Comparing that with similar delayed 
work handlers like bcm2835_timeout()/bcm2835_finish_request() [4] the 
(simplified) functions are

static void tmio_mmc_reset_work(struct work_struct *work)
{
	struct mmc_request *mrq;

	spin_lock_irqsave(&host->lock, flags);
	mrq = host->mrq;

	spin_unlock_irqrestore(&host->lock, flags);

	/* Ready for new calls */
	host->mrq = NULL;

	mmc_request_done(host->mmc, mrq);
}

static void bcm2835_timeout(struct work_struct *work)
{
	struct mmc_request *mrq;
		
	mutex_lock(&host->mutex);

	if (host->mrq) {
		cancel_delayed_work(&host->timeout_work);
		
		mrq = host->mrq;

		host->mrq = NULL;
	
		mmc_request_done(mmc_from_priv(host), mrq);		
	}

	mutex_unlock(&host->mutex);
}

Comparing this, the questions are:

* tmio uses irqsave spin locks, while the bcm2835 uses mutex for 
locking. Why is irqsave spin lock used here?

* In tmio the mmc_request_done() is *outside* the lock, while for 
bcm2835 its *inside* the lock protected section. Why does tmio doesn't 
lock the access to mmc_request_done()?

* How does tmio_mmc_reset_work() ensures that the content mrq points to 
and passed to mmc_request_done() is still the correct content and hasn't 
changed asynchronously in the background (due to being outside the lock)?

* Why does tmio doesn't use cancel_delayed_work()? Maybe because its 
ensured by the interrupt locking no further work is scheduled?

In sum looking at the KASAN report and the locking in 
tmio_mmc_reset_work() we have an uncomfortable feeling. 
bcm2835_timeout() looks much safer regarding the locking. Of course that 
is just a feeling and can't be proven. Therefore we want to ask here :)

Best regards

Dirk


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/host/tmio_mmc_core.c#n229

[2]

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

[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/core/core.c#n113

[4] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/host/bcm2835.c#n821

