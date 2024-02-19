Return-Path: <linux-renesas-soc+bounces-2936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 759A8859C2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 07:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99D161C20D64
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 06:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4592063C;
	Mon, 19 Feb 2024 06:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="VaKHdYm0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2077.outbound.protection.outlook.com [40.107.14.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270371F941
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 06:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708324118; cv=fail; b=XpDRaIu+XFBAjSfrKmk0JZnni8PWutJ7fMt35q8aoPo2kOVrPSha1k/N0R6L8fGmo8GpcEVdMK6f/p2OiZszmTC5CehIn64TjOQH6KIThoqOqcFluRQ8C04cJgdfSEciDj0ZqIs2tfpbBbM4klH4uEFpHzer3byePs1vzbqR2Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708324118; c=relaxed/simple;
	bh=F0KwpTZ3EqVCOF1027J7Lq1qMsTHpooSjwre9rskAiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:CC:From:
	 In-Reply-To:Content-Type; b=J9tRIelNAHAy+JAlXLxijaFEJx4FyRHy0Kfz1NJXQAspUZXhR7l5Plxfm5y1Ar3LoBV215T+SXiYNZ6OqGmZex15GgOj96RDcgEVFoi4Jm5tFJb+7g+AqBqSlbZWMkA5w2UpW4AjP5/+w66Fjn3/Da1qty6a8pWI+YvelRrjiFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=VaKHdYm0; arc=fail smtp.client-ip=40.107.14.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmFiHnVNPOEx2FBlK3Nhp3Ueh+KwnbsmOtgzq3VmN4922cnVc4Vr0ap5pNiOIbdIhwaEIWnK5SWMUCvQhht0sjj+aYe2eKXBAFPhfmkif0d/n8WA+Rjee3vU9x7gyLDkMQvyz75miFlkEKkw7jfmLHuK4TpBMPprLqFf2cZnSM7iUrMySVAEhOd2JQJww2cx8xeLk0UiNaAvHCUvRHVztQwBZWKfFl5fM+WlbUZyu+36g6grMwgVQBNTh1x6EDRHyxoty8WW1tXADwTWwmKORNrcJ6cmq1NJO/JlrVTB1xm+cFc3dOv//Zg8SsxdWJL75ivs5EicUfy76B3sI062Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dDs2icLGa88k4w/rQyCfM/PGTZ/kML8+W2FHnLXudU=;
 b=aMSXZ9lmoQOS40Cl+gIE8FzgSB6I/Miz6cO991QJ6OMCBlOSyA+ZEtrrjNWGBvdYEVSbdeur/vveC6T7nfuvrnyzvFq2QZICZTPG8H4Ptfy6ysySk2j0dgaJIR0Vi8jdTIxlnEVyZtg7NnpWIrs011Xh7Ljk73lwETLTOqWzJ1zJ7RK/BGuSbgHu1dV/HPzKIJOuqQSXv2VYkAshCfymAAcAc4L6LaaCdWbEpuv9tMsrXkBd+48GksY7y19L+YHHzV9kavRRcNqiC9LEOyreVHXGLznaKGjAfTMqSqcjWLqJQLobRo4t/dtZQCwM2tLTahCodXy6pZ2vm1L4H5ey/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dDs2icLGa88k4w/rQyCfM/PGTZ/kML8+W2FHnLXudU=;
 b=VaKHdYm00B+GRAkB9IAZOxM6tYJPnrFB7WTb/lQFo7qXtTkeULKgkfomomAG+T0jAZO2J1mQ5UMQ+8265nJtlBQbUCArqJioTB/8VxCKkqqE0Ba5apRiPJ7riwCfxkCytNck93qbkApMzwQtIoSE5jSZUO+O8dOMNdLEpg2iHxhAVhxTEz+u6xN6zmwhdRGqvItM1lvtbsrPZgozS8wz7XP+SpiWEV2S6bO+F+VMtMq7Ti4Vr3q5bT36kBNdxc7t4mk8zshbom0QRswPV272P1zSAv6FZaBP+okQxhhC2NZlWl9PKy5q0zPqXbn6Fk3zqIAdPNzSc+QsIUg9Q7Zdzg==
Received: from AM0PR10CA0033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::13)
 by PAWPR10MB8240.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:388::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Mon, 19 Feb
 2024 06:28:32 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::62) by AM0PR10CA0033.outlook.office365.com
 (2603:10a6:20b:150::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39 via Frontend
 Transport; Mon, 19 Feb 2024 06:28:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 19 Feb 2024 06:28:32 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 19 Feb
 2024 07:28:28 +0100
Received: from [10.34.222.178] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 19 Feb
 2024 07:28:19 +0100
Message-ID: <1d54243a-b0bb-4d5e-bb5a-ace8462d3046@de.bosch.com>
Date: Mon, 19 Feb 2024 07:27:51 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mmc: tmio_mmc_core: Locking questions
To: <wsa@kernel.org>
References: <ZdJyYWIN4X9NbXe9 () shikoro>
Content-Language: en-US
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
In-Reply-To: <ZdJyYWIN4X9NbXe9 () shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019A:EE_|PAWPR10MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f83b6d5-0f00-42cf-94dc-08dc3113fe55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rQFB0EYHumIBQP1K9HctOJKeMo24ifkNzWKDA2/vDHy+1KaHYoMRBVGq6W1Z3fuztZdyLEpkDVBcVzzXO1tEjjY5eK+DupnGPNoMktc5GcBi4Bs2d1JQ/fGEefJDkWhz9BLR4xc/+UOcOW9Rw1E2IY0ssTtAg2jvu+46KNqTfSZYWHQ1eNlkMpFauhp42RfEWLjXZcMxDxene999IDdU+O/j7AiGOs4so522x/DbkxD6x86zDqr2Ld/sS7RLt+R1Is0crQCiBnh6WBSH8Lg2kX5QrbUs4ZZIbXJkmAeOJvYtrn+JzbhWUFi4HLq2lCSg51J0vFsjNOyHZsUOlw32+3j7tXmOCrFdAvzjc9KzZaPOL+yn+NnFwwhhzbTYRz2VnzJewVHtciPa/PnNEaLZtHWOdrIc0EWnuN1XigiNBxE6X44QPs2yhp5crpkfJ6TumTAfOdZgECbBSaeOqljxNfSM4+ICkeMBExHRK4U0Kzp86JVfUTtS0BOpLEoojGwZ9fdb2GvyDPx7NFL7VFGNb552nyAMQndOtQbZc+d9VrH4alPLmkWMEzg0zx8XmscTvc1NqxDieKnHvkTlA9pO6oNmFlDEfbaziWB7ytHQ4TNP36D0ZKHtJugo13D5iXlpLfD35x0QsJCMVUVBaYSDqOlX87aAbXHKZFBYepRn5uXEevH4sl8EV6B8qxQ1kg4L/rBTdC/t8Y9nDLbuBHhHiw==
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(1800799012)(64100799003)(82310400011)(451199024)(186009)(36860700004)(40470700004)(46966006)(2906002)(5660300002)(16526019)(53546011)(41300700001)(8936002)(478600001)(2616005)(336012)(6666004)(26005)(426003)(70206006)(6916009)(4326008)(8676002)(16576012)(316002)(70586007)(83380400001)(81166007)(86362001)(356005)(31686004)(82960400001)(82740400003)(31696002);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 06:28:32.0147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f83b6d5-0f00-42cf-94dc-08dc3113fe55
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8240

Hi Wolfram,

On 18.02.2024 22:10, Wolfram Sang wrote:
> Hi Dirk,
> 
> hope you are doing well!
> 
> Thanks for doing this analysis and summary! Much appreciated.

Many thanks for answering so fast! :)

>> Comparing this, the questions are:
>> =20
>> * tmio uses irqsave spin locks, while the bcm2835 uses mutex for locking.
>> Why is irqsave spin lock used here?
> 
> The spinlock was introduced with 6ff56e0d8e02 ("mmc: tmio_mmc: handle
> missing HW interrupts"). This was before my time with Renesas, but the
> rule of thumb for chosing spinlocks over mutexes: they are lightweight.
> If the critical sections are short and no sleeping is needed within
> them, they can save context switching. 

Yes, I agree, the question regarding spin lock vs. mutex was non-sense 
;)  For synchronizing with the interrupt handler we need to use spin 
lock, as (potentially sleeping) mutex in interrupt handler are not allowed.

So I'm totally fine for using spin locks for synchronization :)

Remains the question if we are locking "enough".

> Of course, this is not needed for
> a timeout handler, but in other code paths this is more interesting.
> 
>> * In tmio the mmc_request_done() is *outside* the lock, while for bcm2835
>> its *inside* the lock protected section. Why does tmio doesn't lock the
>> access to mmc_request_done()?
> 
> The spinlock is to protect the private data structure, 'host' in our
> case. mmc_request_done() doesn't operate on it, only with MMC core
> structures 'mmc_host' and 'mmc_request'. AFAICS that doesn't need
> protection. The mtk-sd driver has it also outside the critical section.
> But: clearing host->mrq looks like it should be *in* the critical section.
> There is another case in tmio_mmc_set_ios() which also looks suspicious
> at least. I'll double check all this tomorrow.
> 
>> * How does tmio_mmc_reset_work() ensures that the content mrq points to a=
> nd
>> passed to mmc_request_done() is still the correct content and hasn't chan=
> ged
>> asynchronously in the background (due to being outside the lock)?
> 
> Because it copies 'host->mrq' to a local variable 'mrq' within a
> critical section:
> 
>   236         spin_lock_irqsave(&host->lock, flags);
>   237         mrq =3D host->mrq;
> 
> and then passes this to mmc_request_done(). It even clears host->mrq
> before that to enable asynchronous processing of the next mrq:
> 
>   270         host->mrq =3D NULL;
>   271         mmc_request_done(host->mmc, mrq);
> 

Of course I'm not an expert on this driver ;)

So I'm not sure where this mrq comes from. In the end we just copy the 
pointer to the mrq to our local variable. What I don't know if anybody 
else holds a reference to it and might change/discard this mrq in 
parallel/in the background? Or create a new mrq making the one we are 
currently processing invalid? Just some thoughts, though.


>> * Why does tmio doesn't use cancel_delayed_work()? Maybe because its ensu=
> red
>> by the interrupt locking no further work is scheduled?
> 
> If you want to cancel it, I think you should rather use
> cancel_delayed_work_sync() to really know that there is nothing pending
> anymore. But that function sleeps. TMIO approach is to simply bail out
> on later calls:
> 
>   239         /*
>   240          * is request already finished? Since we use a non-blocking
>   241          * cancel_delayed_work(), it can happen, that a .set_ios() cal=
> l preempts
>   242          * us, so, have to check for IS_ERR(host->mrq)
>   243          */
>   244         if (IS_ERR_OR_NULL(mrq) ||
>   245             time_is_after_jiffies(host->last_req_ts +
>   246                                   msecs_to_jiffies(CMDREQ_TIMEOUT))) {
>   247                 spin_unlock_irqrestore(&host->lock, flags);
>   248                 return;
>   249         }
> 
> Other drivers do this as well, like alcor:
> 
>   318 =20
>   319         /*=20
>   320          * If this work gets rescheduled while running, it will=20
>   321          * be run again afterwards but without any active request.=20
>   322          */=20
>   323         if (!host->mrq)=20
>   324                 return;=20
>   325 =20
> 
> I'd think this part is OK but I will double check as well.^


I will do some testing with moving the locks, too.


>> In sum looking at the KASAN report and the locking in tmio_mmc_reset_work=
> ()
>> we have an uncomfortable feeling. bcm2835_timeout() looks much safer
>> regarding the locking. Of course that is just a feeling and can't be prov=
> en.
> 
> Yes, with a mutex and putting everything inside it, it uses a big hammer
> and no questions asked. I am not complaining here, that is a sensible
> approach at times. We have, however, historically been introduced with
> spinlocks and a more finegrained approach. I prefer to (and will do) double
> check the critical sections first before considering more intrusive
> approaches which would need a lot of testing, of course.
Yes, any change on the locking would need a lot of testing :(

Best regards

Dirk

