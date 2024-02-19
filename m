Return-Path: <linux-renesas-soc+bounces-2938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E77859CBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 08:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA1DD1C210D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 07:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7B320DF6;
	Mon, 19 Feb 2024 07:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="K/Rory++"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2044.outbound.protection.outlook.com [40.107.13.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B7E20DC8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 07:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708327343; cv=fail; b=MnMfKmzvoyVTev+sZttfMgZ2IGXDOXIRYnZz7a6DNAdaqNZimjZGblrXHeTsxTyJzWKdzK1m9bpU2tE3A7m8vi9pxSGb65rLawFrjWp4UV/kh7bjlQxr34tcS6l0FmtUWaa3rJeOCAnIH5dP1e12DfjcKR5z4aWZwpQP9vCjaZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708327343; c=relaxed/simple;
	bh=aKH98F2PzQApv4XPE57zS/ojS2TWeGioruTOhPkuczQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=HMQGMqt4JCEv8utM+YJN6O6IHJkooU+QgexPFc9R40ITKrrLwoiyqcCGDlxl4kD41qmUVZZHtTgJ0Bv49p8dN+Uy5WI/JD/rg+ylrI3mIo8f+h8absnFMsjIjBXwP6YBQtEPak4opktHk4yeszfYw5qMK+V3j3WQbQBjpPy9YpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=K/Rory++; arc=fail smtp.client-ip=40.107.13.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSYloG2VluOybJcd+u7/dNxm0ckkLjPJLtkuGZuWJ2w79M4W1rmR+AGyfDHnH1ycox4EqPx+mUfA9bhWm2ToIWIOXg7JHoQZL7xtGCqDS6/8t3cTAPZeS74sKHHzzmQByOpB88J6N00NPseBpjgWPiAKdFcWp2piAQVU+AYNANDGHq73DtSPDiGwj5wM3bM+jcXuL3LCo/lbQlvz1e6QfsskJSVp874njmFcglPXwboxPknyY6dWyHv8JNyEFvqfbgrIWk86xbGWUrf2Cb2l0El0k8pzx6q/0pbLBpfw6NttZuSwwU+02Hh5oW8xBJd0aIQksuxUFPYdwX0wlbPGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfhgGIF8ReHkudPGxUO4kU+F4HJyHQHl97hCBWGCB7Q=;
 b=ci4xSO80deyx0wScjUBk98s2eLrUbT8pKjeiDeDWxkxdgihaSiG2CCv2GbMHM9Ru4mIf8B0Wkt3IFE4KqJUGRdW03Bnvq/YrgVGPwndS72d6CbeyMcPcnChsV23ph6ZQ6D3Cpfw0QlNdmnHO7j0N9YQWOv1YjBfNd9LIAc/B6XZvEDHVn8z21SQn7WwYt0lRzS9HU67TFY5019Btzg/oP9BtS9EGXNkipTeVNoaEc/hG902JTj8FIkfhHSalymfd44l75uT4zO091IDsUgPvNwMnTw5JP5cLIu3FKhHzO3Eiz3EiKLacqJ/5pG5L6m5994lk2xrkqyY6+Mgr2GAQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfhgGIF8ReHkudPGxUO4kU+F4HJyHQHl97hCBWGCB7Q=;
 b=K/Rory++jiupWtJ8FLLWasPqZ638f6NNpmi4OZRR60AXCV0jVig3WT+tNcnrsq1SQEP4NszTJVMMv9urL0a8Q0ausAv+MQI8zGkcil7NDEzUi/rWQ9Y5/7wqW8eIRDvRL9yUJoyAIrP3TFkWrYFGWO4dQPtxgbmf/HVALKrC/fGsRC5eRXiQxd0PQgzhE02zwi9u3lzcOnbxQSpW+E099tUGRIIMydhVw249XnIesT9cRU1TK3UI9OeC1RYVX7saSPqOHTNGahU1VCxH+7SyFXiKCw8dSfZ+BUty6jrXzsLE0HcgeF1uRrksQtbH4QsnjWLKZM+ppny4cN6c7oaMXw==
Received: from DUZPR01CA0251.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::23) by AM7PR10MB3764.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:14d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 07:22:17 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::85) by DUZPR01CA0251.outlook.office365.com
 (2603:10a6:10:4b5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38 via Frontend
 Transport; Mon, 19 Feb 2024 07:22:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 19 Feb 2024 07:22:16 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 19 Feb
 2024 08:22:15 +0100
Received: from [10.34.222.178] (10.139.217.196) by FE-EXCAS2000.de.bosch.com
 (10.139.217.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 19 Feb
 2024 08:22:15 +0100
Message-ID: <507b8b91-eeed-4b0a-b45c-27a30c9f4208@de.bosch.com>
Date: Mon, 19 Feb 2024 08:22:07 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mmc: tmio_mmc_core: Locking questions
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
To: <wsa@kernel.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <ZdJyYWIN4X9NbXe9 () shikoro>
 <1d54243a-b0bb-4d5e-bb5a-ace8462d3046@de.bosch.com>
Content-Language: en-US
In-Reply-To: <1d54243a-b0bb-4d5e-bb5a-ace8462d3046@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|AM7PR10MB3764:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b868317-434e-4604-bb69-08dc311b8097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zGCt0wGoGhV9/z0qJLiGply7IVke1cWl9otv0RysBYE734mNkHOXzl0DTBmhK8ngjcHpvFQzc+MeChZAw6CnkqBHvJj5m9zBqZhP1j33dn6PJBMC5lkIwF2pNDzsCE3gSDcrliLPehLNZ1+KjDHQidxEE0wn/UWhdn5Qce8RIRObFxEA4Ts4VngrLD7PZQq8VyN9wKQLGGdHz7T/oXQxiJASBSX+6Lf+dx/gvZuezlH2iv1MmWbz0T0EEX0E+rehCk08GAhTu0um/lsDveGB9+danPNUAD8q+fP+niZG5cYrdbCo0RUhPOsbdTplOyL9As/uHxc/R6rIcMw4TChChhqvuQ5EOTWa31ZvLg94eVOCrcSWg6lwtaIXgnnswKLjz1j7wLzuLH8cWT+O5eCp3/SS8CS9fpI6g9bSAnhGJORNnj+0aknyboeZKrocPecBC144q/D2DpQYnlTIZhvDfbzeUaCRPQu266Aei6Rb5PSITLvOBrNvP2T1U/ZNnLJT52YArEdryldjJIGAcVaa4mJrz6xOagqN79XGZ6XNA/+WjEPUdrGIukLod954NPIsuSyap/IEV6HGOdJzG2ybysQUXkMpzB8LPxueHjPvVSGpG+Dtl/4QtJ0m83YP+ermQk8YMJMKstzV+sMUzTRWvHvtjaSJupGrBf5oWYhFQHqMXsSmey+CCO81y8X0xw2idwUumQlDfoKaiGxJec0l5A==
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(186009)(82310400011)(1800799012)(36860700004)(64100799003)(451199024)(40470700004)(46966006)(82740400003)(81166007)(356005)(82960400001)(26005)(31686004)(31696002)(86362001)(83380400001)(478600001)(2906002)(5660300002)(336012)(426003)(53546011)(16526019)(8676002)(4326008)(6916009)(8936002)(70206006)(70586007)(2616005)(41300700001)(6666004)(16576012)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 07:22:16.9823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b868317-434e-4604-bb69-08dc311b8097
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3764

On 19.02.2024 07:27, Behme Dirk (CM/ESO2) wrote:
> Hi Wolfram,
> 
> On 18.02.2024 22:10, Wolfram Sang wrote:
>> Hi Dirk,
>>
>> hope you are doing well!
>>
>> Thanks for doing this analysis and summary! Much appreciated.
> 
> Many thanks for answering so fast! :)
> 
>>> Comparing this, the questions are:
>>> =20
>>> * tmio uses irqsave spin locks, while the bcm2835 uses mutex for 
>>> locking.
>>> Why is irqsave spin lock used here?
>>
>> The spinlock was introduced with 6ff56e0d8e02 ("mmc: tmio_mmc: handle
>> missing HW interrupts"). This was before my time with Renesas, but the
>> rule of thumb for chosing spinlocks over mutexes: they are lightweight.
>> If the critical sections are short and no sleeping is needed within
>> them, they can save context switching. 
> 
> Yes, I agree, the question regarding spin lock vs. mutex was non-sense 
> ;)  For synchronizing with the interrupt handler we need to use spin 
> lock, as (potentially sleeping) mutex in interrupt handler are not allowed.
> 
> So I'm totally fine for using spin locks for synchronization :)
> 
> Remains the question if we are locking "enough".
> 
>> Of course, this is not needed for
>> a timeout handler, but in other code paths this is more interesting.
>>
>>> * In tmio the mmc_request_done() is *outside* the lock, while for 
>>> bcm2835
>>> its *inside* the lock protected section. Why does tmio doesn't lock the
>>> access to mmc_request_done()?
>>
>> The spinlock is to protect the private data structure, 'host' in our
>> case. mmc_request_done() doesn't operate on it, only with MMC core
>> structures 'mmc_host' and 'mmc_request'. AFAICS that doesn't need
>> protection. The mtk-sd driver has it also outside the critical section.
>> But: clearing host->mrq looks like it should be *in* the critical 
>> section.
>> There is another case in tmio_mmc_set_ios() which also looks suspicious
>> at least. I'll double check all this tomorrow.
>>
>>> * How does tmio_mmc_reset_work() ensures that the content mrq points 
>>> to a=
>> nd
>>> passed to mmc_request_done() is still the correct content and hasn't 
>>> chan=
>> ged
>>> asynchronously in the background (due to being outside the lock)?
>>
>> Because it copies 'host->mrq' to a local variable 'mrq' within a
>> critical section:
>>
>>   236         spin_lock_irqsave(&host->lock, flags);
>>   237         mrq =3D host->mrq;
>>
>> and then passes this to mmc_request_done(). It even clears host->mrq
>> before that to enable asynchronous processing of the next mrq:
>>
>>   270         host->mrq =3D NULL;
>>   271         mmc_request_done(host->mmc, mrq);
>>
> 
> Of course I'm not an expert on this driver ;)
> 
> So I'm not sure where this mrq comes from. In the end we just copy the 
> pointer to the mrq to our local variable. What I don't know if anybody 
> else holds a reference to it and might change/discard this mrq in 
> parallel/in the background? Or create a new mrq making the one we are 
> currently processing invalid? Just some thoughts, though.

What I think I wanted to say ;)

Would it be a problem that both work queues, tmio_mmc_reset_work() and 
tmio_mmc_done_work() might operate on mrq the same time without 
synchronization?

Simplified:

INIT_DELAYED_WORK(&_host->delayed_reset_work, tmio_mmc_reset_work);
static void tmio_mmc_reset_work(struct work_struct *work)
{
	struct mmc_request *mrq;

	spin_lock_irqsave(&host->lock, flags);
	mrq = host->mrq;
	spin_unlock_irqrestore(&host->lock, flags);

	mmc_request_done(host->mmc, mrq);
}

INIT_WORK(&_host->done, tmio_mmc_done_work);
static void tmio_mmc_done_work(struct work_struct *work)
{
	struct mmc_request *mrq;

	spin_lock_irqsave(&host->lock, flags);
	mrq = host->mrq;
	spin_unlock_irqrestore(&host->lock, flags);

	if (host->mrq && !mrq->cmd->error) {
		tmio_process_mrq(host, mrq);
		return;
	}

	if (host->fixup_request)
		host->fixup_request(host, mrq);

	mmc_request_done(host->mmc, mrq);
}

Best regards

Dirk








