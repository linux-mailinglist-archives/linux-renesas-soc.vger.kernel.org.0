Return-Path: <linux-renesas-soc+bounces-4536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3133A8A2561
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 06:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D5B01F236EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 04:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F2AD2E5;
	Fri, 12 Apr 2024 04:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="jMsnXUfQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA75D528
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Apr 2024 04:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712897642; cv=fail; b=iGVZSIpWB/wnheo9gM3Yh6QfjFNdtzQ91e+z0E3hRMCSB8SIQpJcloIpvskF4uj0b645KyvwXMnj+ha15ZFTvZkfWIB+f3J06Dpw4St+HVKO4YKSVP15BifHd+LXjGsZcucEbGWhwM1xBaRXga/H/fWVldtr57gXl759pFUgNHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712897642; c=relaxed/simple;
	bh=Z4W2Hi8u9kAVdU/2MBs+SEK2j15O4/CZDwzaV053yzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nLV9JLxOi267iL03yKnbigN4X6Kbwc+ywBwq+j2N1Pa05yBG/8HmNdnAOxFxpVNgCKuseKBVzLSJmE6PjpaP8MYA3JNbtDoWhl4Z4Er3Jgp5fmcqxwVwyVZjTGZSvNw7a1AaF8As9VBGkiyx53FcUZ0xH3gaykYxASnQdZzes7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=jMsnXUfQ; arc=fail smtp.client-ip=40.107.21.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MI3itVGIRCTqF9h/loYR396ETkzDDYjz/kIJh6QaLXQDEU+SKDGNEpY1EVWTvV1Gz7IldGef6ZlL2a+XS7BcYNUXKj9BjuC76w+bJ12Y13tAE+I4Ec+A69VDLDqwaJuC1f60MmLDEVSD1dVlTlInD217swgIT/YoouDXowDDrvt4btMiWZld/gbuW7M1p/fxau4ZMyG7uzawBFU20PppUBtA30yUY5OeHaMubhB7uged7ckU5QZ2JyRkRLs6c3LxToymybEvBtjkRWsP2My6mwH/DR8sIg0ixTFv7aeM+IKVqa69thqU1s/AyLL87t+iqS0yjIAw3LLdSviKLG1/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3mf44yLPqVXhxRs+0soKA+iXfGo3hvCcrmaUMfAtvw=;
 b=bWWSYk67wWyFC+B+WsDavPisfoOQMBkYuYl2CsTQfy4DVp4A+MrQfArmmnt0Y+YxsUaBpViqNkNRnzpHfSLrB7fWhNcEbQezbBWJg89x0TDIHI7wiutSmW8z1mV57IRUL5Ye5T9s4ZnAQ77gaH/HchUJn7DebUJ1NrLgTkIhLYYmsF5F9YbLZ5/UIqQqkPepHP2YbhSkgLQpeS0bmfcBNMSwg8rl+2OZQZEvxMwKDVDZ2hTzw6on/vKpA8Sn24aUS+CpXMkzg6oTKK5dDJdF5wrL3HBRIjrARgVXJ2MKEGNHEZdmkLjPh/8z1JMlAoPSttdAMZzzaE/If0tOFqQCQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3mf44yLPqVXhxRs+0soKA+iXfGo3hvCcrmaUMfAtvw=;
 b=jMsnXUfQdaSmtwG3MMXIxS5M9yggq1B6zXMvOSnSMT07ZI/xpYDM8S6a0ZoVxrYdVGQJeC0LpH7ZYELeinrx9U2cvjXR+CnpKiC11SI/v+EDoAqPVZxZFW+yygCDTZC9OVtGn+DxEJZT+RMKCKDKNJxLf4oN1cigJdEwZrjNxC6M2SNQqqdOOLcfnLnjU0UQnRJZNsHhqYy1SGFKlkFIjlPQAod8on7ZZ46yjn4zBnNT2pqLlzL/Ge0Eo1jwhKxB8HgkCfX2e37JH/5VSwglhuKrEh8UCicVDwHrIlRsg2n+Sx+Ne3+5J0EFVOG74C4vDKoIHyCv8OVVz7jTVCztpg==
Received: from DB7PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:10:36::31)
 by PAVPR10MB7090.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:318::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Fri, 12 Apr
 2024 04:53:55 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::b5) by DB7PR05CA0018.outlook.office365.com
 (2603:10a6:10:36::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26 via Frontend
 Transport; Fri, 12 Apr 2024 04:53:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Fri, 12 Apr 2024 04:53:53 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Apr
 2024 06:53:45 +0200
Received: from [10.34.222.178] (10.139.217.196) by FE-EXCAS2000.de.bosch.com
 (10.139.217.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.37; Fri, 12 Apr
 2024 06:53:45 +0200
Message-ID: <837e1dcb-aa85-4640-beee-a6759996c002@de.bosch.com>
Date: Fri, 12 Apr 2024 06:53:38 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RE: tty: serial: sh-sci: hrtimer not properly canceled on chan_rx
 invalidation?
To: Biju Das <biju.das.jz@bp.renesas.com>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
References: <ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com>
 <OSAPR01MB1587281F08492D493A55AD2786052@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <OSAPR01MB1587281F08492D493A55AD2786052@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D01:EE_|PAVPR10MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c7c046-e1b1-4b0f-40d1-08dc5aac8dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rckMSI8w1qvquI8aXfzcmjeY0D8UCMX3ApO38Sh9jCdCpHNkDAdu5AjgyydGobHmjlfQUCviFkG+nJfPseoxfcCO9b3PgzGv8ajqYT+jxXorEsqs+q627J1BTkTdcmBrnSlgGQXqIGCcFpW5gjwGskg+PJh/OHSos1M/V0YLGao16jPlxCJWYRhoDlboPuyfLy+DbSv7ugXzt2aNv89vGNVFFtw+0AAzzfAyDRNUO59iwDcav7xht2q3cT1UAMrM8mLC4gLhOZs0znlb2sVPSCIrDX6iFCMqNa9IbZTm0TMpjkk9kxbZXOnd/AhlKiVReij4Uss6oqSnkNwOeJon6T4N1o5MaKB9xEp0iF2dJ1LsQYdxeNrA/Y2gVfwpwg7TwS8SYpjFqh2p2R1HQ31uTuJWbsQi7k/9DS4QGwY/mr0N6oG/ymowFyR515Hs4qyCyezOFZOcEcj3lDyV6KTMIrrdCwuGyJpI8grEm5ffqd2KCT7QiCXtTL07sHFq+DeavJWD0eiWCeXizHRw86v65HjOs/xJfv0JJPD+vaUDPjkLMoin5krfD7YIUERRF4gCijbWIPW5oaL2CM0/axA609ppltZgD/uAtoZzBrB3COK3peuKlS1w+pqeyOcJVXnlmbtgeNkG7x8lLvvENowjbZudyrtj9adhE9TN10MypgHD5nNBBEALqCsm4BLrB4s6nGBCjL77BmCcLrbgXPu+yCIvt4rxwQe1zJ9yxP6IhiqMLptAFrbc+sLaoPL4NRLB
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 04:53:53.8875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c7c046-e1b1-4b0f-40d1-08dc5aac8dcf
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7090

Hi Biju,

On 11.04.2024 14:54, Biju Das wrote:
> Hi Dirk,
> 
> Thanks for the report.
> 
> Q1) How can we trigger this condition?

I don't think we can at the moment :( We have seen this only once, so 
far. Therefore I assume a subtle race.

> Q2) Do you see any messages "Failed submitting Rx DMA descriptor\n" in logs?

That message is written on dev_warn level:

./sh-sci.c:1342:        dev_warn(port->dev, "Failed submitting Rx DMA 
descriptor\n");

Unfortunately, the exception log given below [2] is extracted from a 
persistent error logging system on the device which doesn't record 
messages on dev_warn() level. So we don't have the complete console log.

Many thanks for answering that fast! :)

Best regards

Dirk


>> -----Original Message-----
>> From: Dirk Behme <dirk.behme@de.bosch.com>
>> Sent: Thursday, April 11, 2024 1:41 PM
>> To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
>> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven <geert+renesas@glider.be>
>> Subject: tty: serial: sh-sci: hrtimer not properly canceled on chan_rx invalidation?
>>
>> Hi,
>>
>> using drivers/tty/serial/sh-sci.c (on 4.14.x Renesas BSP) what is quite similar to [1] we got [2].
>>
>> Analyzing this we found that in sci_dma_rx_timer_fn() s->chan_rx is NULL.
>>
>> Is there any chance that there is a race condition where the timer function sci_dma_rx_timer_fn()
>> is called while s->chan_rx is invalidated, already. E.g. via
>> sci_dma_rx_chan_invalidate()/sci_dma_rx_release()? Or anything else?
>>
>> Any idea?
>>
>> Best regards
>>
>> Dirk
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/sh-sci.c
>>
>> [2]
>>
>> Unable to handle kernel NULL pointer dereference at virtual address 00000000 Mem abort info:
>>     Exception class = DABT (current EL), IL = 32 bits
>>     SET = 0, FnV = 0
>>     EA = 0, S1PTW = 0
>> Data abort info:
>>     ISV = 0, ISS = 0x00000006
>>     CM = 0, WnR = 0
>> user pgtable: 4k pages, 48-bit VAs, pgd = ffff80061f6ba000 [0000000000000000]
>> *pgd=000000065f6c0003, *pud=000000065f6bf003,
>> *pmd=0000000000000000
>> Internal error: Oops: 96000006 [#1] PREEMPT SMP Process (pid: 3983, stack limit =
>> 0xffff000009540000)
>> CPU: 2 PID: 3983 Tainted: G         C      4.14.327-ltsi #1
>> Hardware name: Bosch custom board based on r8a7796 (DT) pc : sci_dma_rx_timer_fn+0x64/0x194 lr :
>> sci_dma_rx_timer_fn+0x3c/0x194 sp : ffff000008013df0 pstate : 600001c5
>> x29: ffff000008013df0 x28: ffff0000084055e8
>> x27: 00000060cce93e4e x26: 0000000000000003
>> x25: ffff000008c48b38 x24: 0000000000000000
>> x23: 00000000000001c0 x22: ffff000008d98708
>> x21: ffff000008999000 x20: 0000000000000000
>> x19: ffff000008d98810 x18: 00004000362715f6
>> x17: 00000039f1fc5610 x16: 00000039f22bd748
>> x15: 000007b1e26dc9d4 x14: 000112a7eb4cd8a2
>> x13: 00000000631508c6 x12: 0000000000000028
>> x11: 0101010101010101 x10: 0000000000000000
>> x9 : 00000000000000cc x8 : ffff800696c04500
>> x7 : 0000000000000064 x6 : ffff000008d98b08
>> x5 : ffff00000a923e31 x4 : ffff80069ff09580
>> x3 : ffff00000a923e30 x2 : 0000000000000000
>> x1 : 00000000ffffffea x0 : 0000000000000000 Call trace:
>>    sci_dma_rx_timer_fn+0x64/0x194
>>    __hrtimer_run_queues+0x19c/0x2f8
>>    hrtimer_interrupt+0xa0/0x1b0
>>    arch_timer_handler_phys+0x28/0x3c
>>    handle_percpu_devid_irq+0xbc/0x268
>>    generic_handle_irq+0x18/0x2c
>>    __handle_domain_irq+0xa8/0xac
>>    gic_handle_irq+0x68/0xa8
>>    el0_irq_naked+0x50/0x5c
>> Code: 6b00003f 54000101 52800034 f941aac0 (f9400002) ---[ end trace 07c3c96aa9b5135e ]--- Kernel
>> panic - not syncing: Fatal exception in interrupt
>> SMP: stopping secondary CPUs
>> Kernel Offset: disabled
>> CPU features: 0x61002004
>> Memory Limit: 6016 MB
>> Rebooting in 3 seconds..


