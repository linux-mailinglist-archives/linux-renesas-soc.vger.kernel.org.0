Return-Path: <linux-renesas-soc+bounces-1965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EB6841C57
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 08:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0B361F25F7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 07:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA3D41A8A;
	Tue, 30 Jan 2024 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="J04Bmp/h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2081.outbound.protection.outlook.com [40.107.13.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247C33F9FF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jan 2024 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706598502; cv=fail; b=ZdExOthmn7OzME7z+bhOHhw8AAwV5Od2Z3SkATQY+hRFwpCxRItFWjXntudya1xsUwm1ITjS6a6r5e+Ocm1apSh0up/qinOsXITZqSfX7fbfjUFIpKCZBHjgQumPxX/l7oAAVQzRXjWlnZEfIbYB5PF70aC4/O81V/DtIzbOdMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706598502; c=relaxed/simple;
	bh=BG0l09BqWhLoMa3PtyVOK6s83YduZwAptbI6bPV1R8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AV6m/Ih2U+heQyWP7g33OqA+OkUD82R/WCJQ/WVyWBx27dIicA/dqzY3kItn3k/7DRhQZxzzBPTQz+4yTJ5oVdsyWNnpdpOJEnCHb2JGbmCxgkjR+jTkNXP4+Tmb7sh0kZWEU8R0RWzRW88GCkkEmuESFKB9uIY7mzdvg0PipZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=J04Bmp/h; arc=fail smtp.client-ip=40.107.13.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYPQNYDAdNDoV1Iwzo3iix54xMzGjkejhP9EIpVo7Slcun+hWvSI62NrVniDDpSJsLk5zq0GYccL6S5MKS4+G0oy8nfzIUSCz5HabxTm7uz5wRLJBOYCSEM5x3mEbL7vAusZ6B6++J2/Of/5LSlNi9EZ1fBKxVmgJemBR5rl2BnFx50Sa0Wi9n7ER/ygB1S91wfheRr2gtlwWpQnbD9ouvQwbXjdTlM2HI8RBMILsOMA4isjxD5ZHXSR6L2G8Qiqm83vd/Bgb/4Y0Qf0oMtvzJeNRzVB9TzXoaDofMyM3Enug+VKPYT4JENvBSlY7vvUtBhSlanlp7I7L2BZFraHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWwT0+E8MzZwqxKrgOcsZkTWKFM9YZMYphiGD6L1RBo=;
 b=REU8b9+IzV475dGE/cDLzn3+SRMNhnEOUfqkKso1qSkoJP1hSmxntUzXWHBJxT40YAD7mA22/iZukKjsWerh6GBzbsmi2U7ZyrXa6PeuWw5L+o28oSbs94tn8ohmXoKjyeDOrrOUq2+WdtJ5a6coPL/Z/bCUcARia+UTgRmodPXk1RZrlZ15fLpnJm1Z+GU7dqcQxeJYuHfxfJSELirTtE4KgoOK2ppXQzWaqLIcdfX0InN1riRkPLsxWpsZgRk1DJoB9YsmJryVxPhwqEHmQ2hp3ds2FWOm4GyQ1L4a/L1jNMIwIJavE5vuln6g9YMytpaGj9P9X+NdpyQTOstBCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=linux-m68k.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWwT0+E8MzZwqxKrgOcsZkTWKFM9YZMYphiGD6L1RBo=;
 b=J04Bmp/hW3pZ/nyTyJGIOckNpAGuHVIE6/6miWmb72CPINt5A7il73fXb2WKTOIm+QDKYkduZDU0Ff96QnSV3ofMnxzeXMk756rLuzKkOf3kIcPJaY+0fEvPzx3i1lMxqLRwthXmn1UudBERY57w9rhWJJHAul1pbBsSSTvPLyFi58KWiTCE/Vs6Gg0opYLywE6vuDbePJl7xLVdpbEZi0Ky2bggY84wRUh+ZPLuR73xODvIBeo+naGAvstNt6Sizg2hMoI7qCzLFZM4BTAcOB1OeKJYE7XvGb2UW/0P+vRbpkk6oo7K4euUezUfhMskeQt1z7Ws226zRlEgwtc6tg==
Received: from DU2P251CA0021.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::24)
 by GV1PR10MB6707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 07:08:15 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::50) by DU2P251CA0021.outlook.office365.com
 (2603:10a6:10:230::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Tue, 30 Jan 2024 07:08:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 07:08:15 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 30 Jan
 2024 08:08:08 +0100
Received: from [10.34.222.178] (10.139.217.196) by FE-EXCAS2000.de.bosch.com
 (10.139.217.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 30 Jan
 2024 08:08:07 +0100
Message-ID: <8a0e405d-cdee-4888-ba92-47352766688e@de.bosch.com>
Date: Tue, 30 Jan 2024 08:07:55 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rcar-dmac.c: race condition regarding cookie handling?
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Kees Cook <keescook@chromium.org>
References: <12ff20eb-d4b5-41f4-a494-cfb6b7abe617@de.bosch.com>
 <CAMuHMdW=igXesjxvNk=+in62neW=kipnFW2BUH3P7sfDnqXzEQ@mail.gmail.com>
Content-Language: en-US
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
In-Reply-To: <CAMuHMdW=igXesjxvNk=+in62neW=kipnFW2BUH3P7sfDnqXzEQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F6:EE_|GV1PR10MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 5297b1a0-512a-44d7-7ea5-08dc21623ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UXDvKf78PRMzHg69d6oq0gAuP+Tt6f/k/UGT5Nk1LY/UTwpQxN1PxlZyYxHFQPjlMRO2u8tpqkPLyrCduMGBKKix8SwVkhECJjNgMgKI6dE+1xXCtdrcDO/vqzU4EpDRxQnAnn+5/dMyRXN8FW1cqfCWNFQm0huukswYT3xRgLGbC2b87FppqsRMcLClrsasKKEMuXJaHcL/UeJzMyInyHCEfkjeW6x7TJtvxVJPbQtsmHUfXb3ccykCg1pqPnZvB5gXvJKaVWtLyFOAEPz/ph5n/dJj+xRJGNxf0c5w4QOas8M3M2V5g+9Y51f42FndP0OZXIkhX6s2oQOp7x88jPpij76uSDLrs0b5LJ5UZVFWKCuYRb9kpEVvfUXET8tvGdZ7bxFTiWPCbJwyAlw9MlBvqTScBumEQ0Wz6giTEnVA6Q8IeqZFrLdDhhi/XseAyr2XZq1zi+hoGH42It1eav4INnSetZseNuOzocG4Cn4nJPh8DBwdozkHUGFZXD3IH481Xkn/aLYFmIAyQdfbrkYa6CBgRqpXgTB6dxdMA0lAgnGsAvm7eR2BW23IxCw93y5Jv54GIMkHmvgMhJ1YG6w9wYBKRCv4IjDKqZI2RlNiuk2NUfD73ssh/nHH0O/GpEh1OdaG/ii4l6nf+s57vXsO/oG8mfaS1ZnAW4l2iqgL/td5WTAKxuGxgoCLZbWCflHHYslaaPAQTmM8SRcAjxw1CzAvHc0X9/h/AQuc39+NxHEonaErd0qpZw/vgzphuWbfz9wQVD/d2zucwz0oz0H7XRUisH+K4EV6g3NvEtI=
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(64100799003)(186009)(451199024)(82310400011)(1800799012)(46966006)(36840700001)(40470700004)(41300700001)(82960400001)(82740400003)(81166007)(356005)(31686004)(40460700003)(40480700001)(316002)(36860700001)(47076005)(86362001)(70206006)(54906003)(70586007)(53546011)(6916009)(8676002)(966005)(8936002)(336012)(426003)(16576012)(5660300002)(2616005)(478600001)(26005)(4326008)(6666004)(16526019)(2906002)(31696002)(83380400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 07:08:15.6583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5297b1a0-512a-44d7-7ea5-08dc21623ada
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6707

Hi Geert,

On 29.01.2024 10:57, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> CC Kees (for the wrap-around in dma_cookie_assign() not handled in [A])
> 
> On Wed, Nov 22, 2023 at 8:02 AM Behme Dirk (CM/ESO2)
> <dirk.behme@de.bosch.com> wrote:
>> using a rcar-dmac.c on RCar3 being quite similar to the recent mainline
>> one [1] we got a BUG_ON() being hit [2].
> 
> Thanks for your report!

Many thanks for looking into this :)

> The side channel info told me this is rcar-3.9.11 based on v4.14.75?

Yes correct.

>> This is
>>
>> static inline void dma_cookie_complete(struct dma_async_tx_descriptor *tx)
>> {
>>          BUG_ON(tx->cookie < DMA_MIN_COOKIE);
>>           ...
> 
> Note that dma_cookie_complete() also resets tx->cookie = 0 at the end
> of the function, which is also < 1.
> 
>> from dmaengine.h. I think DMA_MIN_COOKIE is 1, so it seems that cookie
>> becomes < 1.
>>
>> Looking at rcar-dmac.c, there is one place where cookie is set to a
>> negative value [3]
>>
>> desc->async_tx.cookie = -EBUSY;
>>
>> And it looks like this is not protected by a spin_lock (?).
>>
>> Could it be that we hit a race condition here?
> 
> rcar_dmac_chan_prep_sg() indeed does:
> 
>      desc = rcar_dmac_desc_get(chan);
>      if (!desc)
>              return NULL;
> 
>      desc->async_tx.flags = dma_flags;
>      desc->async_tx.cookie = -EBUSY;
> 
> However, rcar_dmac_desc_get() does hold the spinlock while removing the
> descriptor from the free list (chan->desc.free).  So at the time its
> cookie is set to -EBUSY, the descriptor is no longer part of any list.
> In case of an error, the descriptor is returned to the free list.
> In case of success, it is returned to the caller.
> 
> When the crash happens, rcar_dmac_isr_channel_thread() is processing
> descriptors on the completed list (chan->desc.done).
> 
> How do descriptors end up on the completed list?
>    - rcar_dmac_tx_submit() fills in a proper cookie (from
>      dma_cookie_assign()), and adds the descriptor to the pending list
>      (chan->desc.pending), while holding the spinlock,
>    - rcar_dmac_issue_pending() moves descriptors on the pending list
>      to the active list (chan->desc.active), and, if idle, starts
>      the first one, all while holding the spinlock.
>    - rcar_dmac_isr_transfer_end() moves the current descriptor (which
>      is on the active list) to the completed list, while holding the spinlock
>      (by its caller, rcar_dmac_isr_channel()).
> 
> None of this looks suspicious to me...
> 
> Do you know if any calls to dmaengine_terminate_all() were done before?
> 
> Was the system running for a very long time?


Hmm, the trace I have contains boot time stamps (dropped initially) like

[  153.394731] kernel BUG at drivers/dma/sh/../dmaengine.h:54!

I think this "153" implies 153s after boot,  i.e. ~2.5s after system 
start. In case there is no wrap around here too.

Best regards

Dirk


> dma_cookie_assign() relies on 2-complement signed wrap-around:
> 
>          cookie = chan->cookie + 1;
>          if (cookie < DMA_MIN_COOKIE)
>                  cookie = DMA_MIN_COOKIE;
> 
> but given the kernel is compiled with -fno-strict-overflow (which
> implies -fwrapv) that should work.
> 
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma/sh/rcar-dmac.c
>>
>> [2]
>>
>> kernel BUG at drivers/dma/dmaengine.h:54!
>> Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
>> Hardware name: Custom board board based on r8a77990 (DT)
>> pc : rcar_dmac_isr_channel_thread+0xc0/0x190
>> lr : rcar_dmac_isr_channel_thread+0x84/0x190
>> sp : ffff000008b8bd30 pstate : a00001c5
>> x29: ffff000008b8bd30 x28: ffffe026daed4298
>> x27: dead000000000200 x26: dead000000000100
>> x25: ffff158988c28000 x24: ffffe026fb558cc8
>> x23: 0000000000000000 x22: ffffe026daed4254
>> x21: ffff1589821bd000 x20: ffffe026daed41a8
>> x19: ffffe026daed4288 x18: 0000fffff59a0c6a
>> x17: 0000ffff94c70f88 x16: ffff158981f3a17c
>> x15: 0000000000000000 x14: 0000000000000400
>> x13: 0000000000000400 x12: 0000000000000001
>> x11: ffffe026fab47000 x10: 0000000000000a10
>> x9 : ffff000008b8bd10 x8 : ffffe026fe0f1870
>> x7 : 0000000000010000 x6 : 00000000588b0000
>> x5 : ffffe026fe5d1410 x4 : 0000000000000000
>> x3 : 0000000000000002 x2 : 0000000000000000
>> x1 : 0000000000000000 x0 : 00000000e6f90060
> 
> Unfortunately this does not show the actual cookie value found.
> 
>> Call trace:
>>    rcar_dmac_isr_channel_thread+0xc0/0x190
>>    irq_thread_fn+0x28/0x6c
>>    irq_thread+0x134/0x198
>>    kthread+0x120/0x130
>>    ret_from_fork+0x10/0x18
>> Code: f9407293 b85a8260 7100001f 5400004c (d4210000)
>> ---[ end trace 03ab56fc988cadbc ]---
>> Kernel panic - not syncing: Fatal exception
>>
>> [3]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma/sh/rcar-dmac.c#n951
> 
> [A] https://lore.kernel.org/all/20240122235208.work.748-kees@kernel.org/
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 


