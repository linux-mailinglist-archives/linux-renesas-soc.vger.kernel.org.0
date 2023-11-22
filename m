Return-Path: <linux-renesas-soc+bounces-91-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5617F3E86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 08:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAD191C20AFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 07:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55B9171D8;
	Wed, 22 Nov 2023 07:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="hsbS0Irh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2056.outbound.protection.outlook.com [40.107.21.56])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3ED512A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 23:02:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXk4Lv5p6JIdRl3QjZACycieYT2U7zAd67Juk/AaSyEM2VAemrzEChvUTERchlL295ccZ62fXHJhRcrs1SsRGL54YuAhGMCwr4uYAW2KDyps+iXSR0HNWy7UK8BzDVj32Un6w1pfPuG338FhL1ZR3e+AtJZ7J8Lf+eZ6RR4hJq+aJJjdt6vOSjsjEmeE4393VnQN5pKJ8EAGSiqorRsiDwo/ccAZpgdtGtStdzc4bT9WruIqLVksufAA++x1smSWG3RX8Lt7LUOpb0ow1hWWesbyBzZ+RHHrpjOyi5LY1P1apsQ0LMcyg1CV3SH13MYz2OiXahpSGtOAFlhsMZtR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQgtnxm2uGiTGOgjm38JWRjToMXrWZuVM+i7CNFN36E=;
 b=Hdeex7t/yQGkbsWeQFTcK/3pVALKMmIxxCFXkDVd1Glv0SFSh08XkOStxyaVI2Ad+Dh9nswKocRVMGD7XzMjzKIOoZJaE9PLmF4fcligke5V02A5GifQzKSpvGoZSKQ98+e7BaR8sQNRlKqaMFEhTcjYSEu/lwm3ew1D5PP+NUPD480ToCVufWmU7xRIQ4uAJmZl4XFTDu7rZbYIWi2WhOUivB5GISroCfQgLfPcFhmKFzJvYkI2LCDZsQky43qwVjl0QsK/hq84MovPtux4hhcSUlQnJIwE9gym4HyaM1AzE9GNSLQJHAJqeATO3SWn4pKUFq6ftncR8pZO+yTh4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=bestguesspass action=none header.from=de.bosch.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQgtnxm2uGiTGOgjm38JWRjToMXrWZuVM+i7CNFN36E=;
 b=hsbS0IrhciaG14t1aSBzzNKqf7yjawXEaSC/xs127Xcos86FrmI23o2LIQKfvedvxn+m4qjx3iaQuDoTxEYy8zmLaub65nYbK+eCO4CclGfDjK+oZrnjvqkJV9rSDWxXO+hEuht3syxb7PWjUuyawjgMLfS9YJHtN0wdfD4J3L20sWgitueFZML1ryof/mCu8YIkR6uU7pofgTnlgnIinuWWB7fsx08GdOJYDfvw1IAnE0qB4YJ2oFfGSbx6Zy/U0g58HzD4ZdJ1cuu5c9g1i72DiysX/sXLb2R8BlrjZD5It3Qt/xJ9L3bURReBhSkG+8NnQclzImk62gTbeP3QJA==
Received: from AM5PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:206:1::25)
 by AM7PR10MB3734.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:108::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 07:02:32 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:206:1:cafe::e8) by AM5PR04CA0012.outlook.office365.com
 (2603:10a6:206:1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Wed, 22 Nov 2023 07:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 07:02:32 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 Nov
 2023 08:02:26 +0100
Received: from [10.34.222.178] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 22 Nov
 2023 08:02:26 +0100
Message-ID: <12ff20eb-d4b5-41f4-a494-cfb6b7abe617@de.bosch.com>
Date: Wed, 22 Nov 2023 08:02:11 +0100
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
Subject: rcar-dmac.c: race condition regarding cookie handling?
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|AM7PR10MB3734:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df7d624-954c-4df3-8485-08dbeb28ffc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wikn4kYRZc9pu49Bdblg5ygJf1WOn3sPCpNTiQAOp6/29qB5EHC7weZTdnUg6OCJe9C8BmaVhRwXaSOY56iMSA3Lr5/vBCiH1H+1ygMulYA0MQZzSAM5WKv2OjD1041LZ74U3qcXEV8wBJtPNewS4Qys4Gm1BvWjo+U493M/ZWE1UdDTX1v0LWEbVf3ip1XCiBU+p0Y9ZkMeikhhSjqLeuR8HNET9V+kEOLmUepaFvb6ryCKd6rTorvYo49bQxFenP+L4PsqHFJv4fI3Wq7LZ3EpetTAvQX8unMpxMJOb1poVxRgsAXgfSWRU1A6WjRigbuSCaSU0Hjvs+e42ryYUXDElHck412otu634oenIXGcCfG4Rdsexw5HetLOWgwidZW4PmmPRtoEYGpokp9i0yxNZ2HZ3jmXdn5tw9lL8qrVbXny0bRIExKwv2ZbIuvIJwGTU84iLEj9PWrWbr7BUYVqonCwDMiLEbJMRGTaCDtuUc7DorEZrtl+ESg9rxoEoikeFFQZ5YhSBMk6Wi1wNraFzTIISZe9k1ew0Chha0Ue9IVUUkD8KyPQF5i0RVU9TBWeFr35W2I7QSSkL/ugP6PK9fYKymqZSEUc4Dfe8dQ5L5mHxXwtLwn/mAkNV1AgZk/VxvPGKW4ISM50ZkpRftiSlwE77bdZMtP+k7/8ehEPgmDflVGEToOhU76KnlmA0gqzPpqRs++u6hxL2EmJAPpaiWNAjnVuNeKNPZjPV5TvxcN9L1RDo/mrwxJHGCy04ULlkK8UDIjMS+tp0x0NzW5ffrFFB1eprjmfiw2Z2N0=
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(82310400011)(46966006)(36840700001)(40470700004)(40480700001)(31686004)(966005)(2616005)(107886003)(478600001)(36860700001)(336012)(70586007)(70206006)(356005)(47076005)(81166007)(16576012)(6666004)(82960400001)(426003)(16526019)(82740400003)(26005)(83380400001)(8676002)(4326008)(8936002)(5660300002)(316002)(6916009)(2906002)(41300700001)(40460700003)(31696002)(86362001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 07:02:32.4301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df7d624-954c-4df3-8485-08dbeb28ffc0
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3734

Hi,

using a rcar-dmac.c on RCar3 being quite similar to the recent mainline 
one [1] we got a BUG_ON() being hit [2].

This is

static inline void dma_cookie_complete(struct dma_async_tx_descriptor *tx)
{
	BUG_ON(tx->cookie < DMA_MIN_COOKIE);
         ...

from dmaengine.h. I think DMA_MIN_COOKIE is 1, so it seems that cookie 
becomes < 1.

Looking at rcar-dmac.c, there is one place where cookie is set to a 
negative value [3]

desc->async_tx.cookie = -EBUSY;

And it looks like this is not protected by a spin_lock (?).

Could it be that we hit a race condition here?

What do you think?

Best regards

Dirk

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma/sh/rcar-dmac.c

[2]

kernel BUG at drivers/dma/dmaengine.h:54!
Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
Hardware name: Custom board board based on r8a77990 (DT)
pc : rcar_dmac_isr_channel_thread+0xc0/0x190
lr : rcar_dmac_isr_channel_thread+0x84/0x190
sp : ffff000008b8bd30 pstate : a00001c5
x29: ffff000008b8bd30 x28: ffffe026daed4298
x27: dead000000000200 x26: dead000000000100
x25: ffff158988c28000 x24: ffffe026fb558cc8
x23: 0000000000000000 x22: ffffe026daed4254
x21: ffff1589821bd000 x20: ffffe026daed41a8
x19: ffffe026daed4288 x18: 0000fffff59a0c6a
x17: 0000ffff94c70f88 x16: ffff158981f3a17c
x15: 0000000000000000 x14: 0000000000000400
x13: 0000000000000400 x12: 0000000000000001
x11: ffffe026fab47000 x10: 0000000000000a10
x9 : ffff000008b8bd10 x8 : ffffe026fe0f1870
x7 : 0000000000010000 x6 : 00000000588b0000
x5 : ffffe026fe5d1410 x4 : 0000000000000000
x3 : 0000000000000002 x2 : 0000000000000000
x1 : 0000000000000000 x0 : 00000000e6f90060
Call trace:
  rcar_dmac_isr_channel_thread+0xc0/0x190
  irq_thread_fn+0x28/0x6c
  irq_thread+0x134/0x198
  kthread+0x120/0x130
  ret_from_fork+0x10/0x18
Code: f9407293 b85a8260 7100001f 5400004c (d4210000)
---[ end trace 03ab56fc988cadbc ]---
Kernel panic - not syncing: Fatal exception

[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma/sh/rcar-dmac.c#n951

