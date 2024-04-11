Return-Path: <linux-renesas-soc+bounces-4520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A188A14D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Apr 2024 14:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 626121C211AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Apr 2024 12:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690F81EA7D;
	Thu, 11 Apr 2024 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="CPngvZEo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54BA1E516
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Apr 2024 12:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712839305; cv=fail; b=YNhIPUm+v3PT6tyc8BFtwioCt33ieeZ6eimqQVAAKonJ9MUPr59QW6sqnwO1v52IWqvrIrv+3DrZdfxv3TcRDwdZMq2Vvxs23wKC5yI4QpsmFfy8ATvESdC34fNxHRwfz4X6tUgdds1d8Vkf3RdYklYCnAdCYyWBw8isXQ2YZkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712839305; c=relaxed/simple;
	bh=m10PjY2WS/IFFpZukmyHhNzpcEU81HiSTZz1DSxM5Q8=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=btvueJ+2jNYhNDMeafuaduMNi0W3nVUXQmdQm4FH00IBdRJeNl/rU+pMjLKE5jAWhUvDxapHLQVtHU8BGD/6alV9GpSr03KTwJ94XCmSOdwGr/jzfU5pLXtQqfxy1Q5XdOFo9YGY7JBlNJnKgJ8mj371e7sl+30p0fejexzhX0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=CPngvZEo; arc=fail smtp.client-ip=40.107.21.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wfrs8H3e4G0kAH3T/j4e528OuwiDbh0Z27w2twgCcqNGy4jl4hq3pq3+gCur731AcmPvefG910UkNT/YbidwKDcfh1m6KcwERbIuHOjHuA64iX5Pv5GnNgBS0XVB2781JXhJ+RTcsX0Buuk4m/3GFDl+RP6miZ3xoCpa/s5Ouowd7D5iGkRvth1CNtyH/kV+BIMsUpTeL8q1PdWNJyodtryJGnNcoSS6QDQaojqoyavrxLt1y0qzy7Nd34TcxHKHSrp6nsQydbp7aEGRSVrjs1lItGrAMfRIoTBniqVABhJkp2cSTvOswaRc6WQ8Z2+8rPJ9oVmBecN7ac9EXaCkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7muaRLqmjqD3D3f/aa8SRHF+l5G/Y6ed/3k5uK8Bng=;
 b=DVkaGC1zsNPFobpTNSoc0GJHwh8Dljh/fSpBf2BWHhrwk2h1i7/7jACf9We3Am0zuwWWP6ut2UcEMJ8Ysa/7/VsNUxThr+/fsYYMFl2Zbojn5bbv0B3TpH52UVC0oicVL4rG7QbB+D1HYa23BQzuEpwMXel2uIQgZWGvZ6LF2a3rX3k3piwP8Uqo6ZmAj1Z/9Z4ifWegCV+ckRkdtIt/jZ/jgLQgmRtogbgTWDht6hYWFT0sZl7QqP+4TZ5Fu3Wahgcd2XBIcTiMZTbCKISj5JDg6w2zFXLpfN5JcO5T9cwiSR/c/3joeQqtqhOeK6goLa+PmMlcMykiF6FBJHJyRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7muaRLqmjqD3D3f/aa8SRHF+l5G/Y6ed/3k5uK8Bng=;
 b=CPngvZEoi5JzAGcQhFb0Y5kYDc32ChAOYRph6V9Q0pVf+h+jqTdJRtO/ZJTasYIGUcK7TaUNfZaV2HgKEYMxP50HYqrcTjrRlqSbinIbDEoDBYfLmE4ubnsdoWa7Vgq1kfa2LTEKiXf+9wFj3sEu/i2zPZSic2XkXQnnLS8NyTxs5vPhr8Ioq2vXiE8yl846rO3+GjzfnpK122tuJ5iyU+t6mX4E5V2/uovXpU+32OJivcc9xyxTXq/OYn2fRs46nIg2prox0E2ObnjoGHNuLQ59UXrAo66GUkTCPoCePrsZedzdVDv+6hlsZ3AaroyD097K3cKor205s/HNpVukfg==
Received: from DB8PR03CA0020.eurprd03.prod.outlook.com (2603:10a6:10:be::33)
 by AS2PR10MB7762.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 12:41:37 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::a7) by DB8PR03CA0020.outlook.office365.com
 (2603:10a6:10:be::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Thu, 11 Apr 2024 12:41:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Thu, 11 Apr 2024 12:41:37 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 14:41:35 +0200
Received: from [10.34.222.178] (10.139.217.196) by FE-EXCAS2000.de.bosch.com
 (10.139.217.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.37; Thu, 11 Apr
 2024 14:41:35 +0200
Message-ID: <ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com>
Date: Thu, 11 Apr 2024 14:41:24 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>
From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: tty: serial: sh-sci: hrtimer not properly canceled on chan_rx
 invalidation?
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|AS2PR10MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 09afb0b1-81cb-4b2f-8e48-08dc5a24bab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fPwphMLNN8ETcRD0fte1qSXUI68WNZtqsuLiPlKo2BL7YtHfPFhNH6TV+mdky0lyM3W6KbtxmhzmRdTpIrtrhV6EW2aqKcH3ixA617Y7H1cD9j2e32xDh/j1BVubV6TMzMdbpH4HExFZERmbQFIaZgci+9EI3HUyoJr4dx1MOHCmOcINqJdrmlh5wgrXhjZGWvW8HhCkYaagrdNSfEfSuYh94o/mW4gLCFFiNciWEf0EnmMaxAh0/4ibghAiFoDPUl7TBxNNoAQdenEnh+Wd+Zra/mvvZeaBG45ErfIaQ1rv56IOteRzwbzLE8XamaImY1GgWeImCKpBqnJG4PK9HN5BhSW8eXw/1JNKkUJihhVPmoVgoPMnYq49pXVTeQCIb25QI753VjzWjMqU7a4HfIi569Ucmeynp3KPjQgt6yozp3FXeEpUCUt8MeBTPrGEaTerGAUMl/rDjGaLLMbmgvxs9DsGY+RjNAe8GwxewPxIx3AM1atDV8I38IyW9CDycy8oUR0K0M8p5X/ptXT7bhou9pdaB/E0QSXqVmXqib+4stLmfLQ2I3835EI0Y9BJ4kfovaGNqGZUeZccMEHayTbcKhFSgkyaewCXb32QbaVtqdAT0E0KsC7MZtyzJBXv0WpknQwlybqHlf6ukH7dDyrGob+7gBftPeJpkapWuaZbT3QJb/Wgvlxhv7NNC/13G2dbFcHa2m7toWT7+ngXL+FKJPpuG6lP3X2QBShM6OZNNxPjpTEwi3PZ1LDYXA7I
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 12:41:37.6351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09afb0b1-81cb-4b2f-8e48-08dc5a24bab1
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7762

Hi,

using drivers/tty/serial/sh-sci.c (on 4.14.x Renesas BSP) what is quite 
similar to [1] we got [2].

Analyzing this we found that in sci_dma_rx_timer_fn() s->chan_rx is NULL.

Is there any chance that there is a race condition where the timer 
function sci_dma_rx_timer_fn() is called while s->chan_rx is 
invalidated, already. E.g. via 
sci_dma_rx_chan_invalidate()/sci_dma_rx_release()? Or anything else?

Any idea?

Best regards

Dirk

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/sh-sci.c

[2]

Unable to handle kernel NULL pointer dereference at virtual address 00000000
Mem abort info:
   Exception class = DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
Data abort info:
   ISV = 0, ISS = 0x00000006
   CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgd = ffff80061f6ba000
[0000000000000000] *pgd=000000065f6c0003, *pud=000000065f6bf003, 
*pmd=0000000000000000
Internal error: Oops: 96000006 [#1] PREEMPT SMP
Process (pid: 3983, stack limit = 0xffff000009540000)
CPU: 2 PID: 3983 Tainted: G         C      4.14.327-ltsi #1
Hardware name: Bosch custom board based on r8a7796 (DT)
pc : sci_dma_rx_timer_fn+0x64/0x194
lr : sci_dma_rx_timer_fn+0x3c/0x194
sp : ffff000008013df0 pstate : 600001c5
x29: ffff000008013df0 x28: ffff0000084055e8
x27: 00000060cce93e4e x26: 0000000000000003
x25: ffff000008c48b38 x24: 0000000000000000
x23: 00000000000001c0 x22: ffff000008d98708
x21: ffff000008999000 x20: 0000000000000000
x19: ffff000008d98810 x18: 00004000362715f6
x17: 00000039f1fc5610 x16: 00000039f22bd748
x15: 000007b1e26dc9d4 x14: 000112a7eb4cd8a2
x13: 00000000631508c6 x12: 0000000000000028
x11: 0101010101010101 x10: 0000000000000000
x9 : 00000000000000cc x8 : ffff800696c04500
x7 : 0000000000000064 x6 : ffff000008d98b08
x5 : ffff00000a923e31 x4 : ffff80069ff09580
x3 : ffff00000a923e30 x2 : 0000000000000000
x1 : 00000000ffffffea x0 : 0000000000000000
Call trace:
  sci_dma_rx_timer_fn+0x64/0x194
  __hrtimer_run_queues+0x19c/0x2f8
  hrtimer_interrupt+0xa0/0x1b0
  arch_timer_handler_phys+0x28/0x3c
  handle_percpu_devid_irq+0xbc/0x268
  generic_handle_irq+0x18/0x2c
  __handle_domain_irq+0xa8/0xac
  gic_handle_irq+0x68/0xa8
  el0_irq_naked+0x50/0x5c
Code: 6b00003f 54000101 52800034 f941aac0 (f9400002)
---[ end trace 07c3c96aa9b5135e ]---
Kernel panic - not syncing: Fatal exception in interrupt
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x61002004
Memory Limit: 6016 MB
Rebooting in 3 seconds..

