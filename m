Return-Path: <linux-renesas-soc+bounces-2090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 006068436D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 07:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 251981C220C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 06:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3763F8F5;
	Wed, 31 Jan 2024 06:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="jkepWCtU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4D04F8B9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 06:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706682685; cv=fail; b=BA7CGeUx9A/zbCd+p3M/htZqyWrXySp/RIzaKxZJ1rrp2GvbcKvu3zh6XOZLCrau9QwBOiaELSwsaQcGJOqs52mKvOiQK9u7PFGJ94yDl3BWpRae/rypx7iIA66ahF1TDXl77FCRTDjtluOm99A0Dmj8OdXUKpE+pcsdB7ZwwGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706682685; c=relaxed/simple;
	bh=k5XWu6Skpa7gV4qH8X9o5qVnkJNgGGilde3QQPYK19o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oCtB1M9aiFsBgosxMGmKUMW91/swhsQj1piKUBbewJnF6InIy1jmFbaY1HsifdhRePAvtDWt0DZBdXqkuIIxr0L7++yvcyyHd9edCYBdEnmhT2L3BYdStLSY4Fs146fuPxEsy+HEDV2bOB2ubLMJ0bD47NPRldxPetDZ2dXrBUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=jkepWCtU; arc=fail smtp.client-ip=40.107.22.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJSMmHtvZBaHM0/P8tDS2M6BY2Ooty7CqXkNxnFvG8jY1ufRtRUuiYVFvJA5G63h7ZZcKdsHYmyIjnTmWN4nblk4k+iq1RHptn04At8SCeMKKfMwP7MilJ8Hjp/73wE2jATtoSZZtl94n0bg/yYPVSC0FXSZhLdtbWmOOI342sNmrALbgzmucE9XdMEqa588WPazIwzBUfU84MVWr17+S24VcJMCFbU9PeN1OwcqgMpzCzLYLNozP70QdyCdQLvKpZ0UtEdIUmGmF/rWTn0X0PaRyrzrKW1smi25C5i96ZNH7pTSvHV4QRUP51GLGQCiU5nGmCsd6YblpvcsTCWscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVoaocUl9L6gJZ+5I4JGAOF3vxF4zgDy1gp8H6E4P4k=;
 b=b3ADDz//3BKrRJJG1033cBwMnUzBMBg2nShe+d0uRygycBhrUmGndGLRtAPXdAq2QpWRm+gKQG7VuRSI4c4zDwvaghk1q1nyL4+PRX1/49Mh9rg93wGWWuEfnKjjPgIqVF8r3O8mqOzcg0hnzlpdkBWqZIES+BMVNDvZc3k6jQopTp9+Yc8oceUkYchmq8ndobK8qa0H0rsuGY/nwEe4qRmdiLGTZLXimyX01O4kssEEQeMfHA3a1pEsnJtU3GjWomoIQG+z1xIsGsTaIRzgRwo2r0p+t9lPLxR4IV0pmA8ihJR3ugW1Zi6tzpEFzxIKRUYqLd/CsJgVmWpQ00+A7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=linux-m68k.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVoaocUl9L6gJZ+5I4JGAOF3vxF4zgDy1gp8H6E4P4k=;
 b=jkepWCtUrplooLW72cj1ItIRILkDQm32h5B+OvUANjljklyU9ouWv+aEj0mhniN93VU9S4XE+eZ/koSS0TVCLKHyse57r2+jzFVYpr3vtyBRXPX+Xo3C3Q8wwmRuvqi2r9NX1iWf2FpWXgz14QOkW++Hsp64eUObYr74u5NyiGRpeG61jbSDx6y8s2xgmBeoX85T982oaLNT/M5ZmhAOnLleTTJ0bOQn6fGEGdYUR4wFUZ4gXQXhdycVVQT1WkZRGKGnYpKuAj071yJPLxEw0WEpWuek2Ws6Y014F1J8vUErS+Bv9CvLBjLDXgKMzJAR6i9XhQmxqfIuuXDUnp8Jhw==
Received: from AS4P189CA0051.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::16)
 by AS2PR10MB7275.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:605::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 06:31:19 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::7e) by AS4P189CA0051.outlook.office365.com
 (2603:10a6:20b:659::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Wed, 31 Jan 2024 06:31:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 06:31:18 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 31 Jan
 2024 07:31:17 +0100
Received: from [10.34.222.178] (10.139.217.196) by SI-EXCAS2000.de.bosch.com
 (10.139.217.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 31 Jan
 2024 07:31:17 +0100
Message-ID: <cd82ba01-4b2d-42f5-a1ea-0c599dbb51bd@de.bosch.com>
Date: Wed, 31 Jan 2024 07:31:11 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rcar-dmac.c: race condition regarding cookie handling?
To: Geert Uytterhoeven <geert@linux-m68k.org>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>
References: <CAMuHMdX2RvXj5ZFwg2WxNpPGw59=b9quqryO-iZONx_yqgsp7w () mail !
 gmail ! com>
Content-Language: en-US
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
In-Reply-To: <CAMuHMdX2RvXj5ZFwg2WxNpPGw59=b9quqryO-iZONx_yqgsp7w () mail !
 gmail ! com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5D:EE_|AS2PR10MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b26e834-d4f6-4119-7193-08dc22263bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h+Q/2ccYrGyy+Q8OZFdVdsPsq67vO4PjvIE/gyQ2Cj9nQ8Fm234rkb9WX+EwlMNiKid+QI2i3ZrZzTJ8FPtHXhmdGlq8CoKKXlkmLVUcpHKunHAvxOf3juUaAlQuv74WBPB/JI524qt8ERLx1KN5m6/AVxUkc/w2eDno5K4E+9LHDY3g3rEHh60RBfObirTHE6VdW2VinQHK2yjZc14HdS953mXRlsfY6DwfnMexuVFwoYibN3B2uKGJxKZFr/ypP7gguL6d0WG6xnMBztB7jbbQ+Xh2BZXd4iuctahPwbqgRqZNPCkIdbHOOZEWv1B/ijFWv+7wYCcN4dwb4KgelEkjv5Yy4YP9SmQbnkNkNP0G7bZKSqCGZ4Z0wreWcWmV161LjFPM3jhMjjJ7blXb6uppQlTYprRZ9FsbStFrx/N1zzgqjJUEFoHKS+s+bthNFAYMgSK0k3vXpkG/5cZxIRDY4MjLgSA0PLkh3PZ6R8Z1rOiGvKyBV3+EZ++8q4l3LbjgnUeIccrMtrcVRsWSVToyzLOO0KqP7tkAYjWzUW3KQoT4uF6Di87/yWdSLRIU8nFwVHgxQU43nJDlyZpRTSFZ1PpblC/mHxjc9nKgkPY3PL17uLf7wjeBtC8NooddQ8vrBRZ6ZCNg2XPWxvP0fI0WZ0ci92Vd+69WcP4IcpKPrRsXHBaAAeAKx9QxmJ8JMJZy21Y4n9bmK2g/rnH24chTXb320+7l17x7IEsRm/DychveAfsLNv/5x3NntR2yeKUjLHN4ET876IPSBjZtwUNWsXtAjxXFm2EBj7QawnjXrXFFCanqgvG76VNdaJrZ
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(1800799012)(82310400011)(186009)(451199024)(64100799003)(40470700004)(36840700001)(46966006)(8676002)(8936002)(5660300002)(86362001)(70586007)(31696002)(2906002)(110136005)(70206006)(47076005)(316002)(36860700001)(16576012)(81166007)(82740400003)(82960400001)(356005)(83380400001)(53546011)(478600001)(6666004)(16526019)(2616005)(26005)(426003)(41300700001)(31686004)(336012)(40460700003)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 06:31:18.9422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b26e834-d4f6-4119-7193-08dc22263bfb
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7275

Hi Geert,

On 30.01.2024 08:58, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Tue, Jan 30, 2024 at 8:08=E2=80=AFAM Behme Dirk (CM/ESO2)
> <dirk.behme@de.bosch.com> wrote:
>> On 29.01.2024 10:57, Geert Uytterhoeven wrote:
>>> On Wed, Nov 22, 2023 at 8:02=E2=80=AFAM Behme Dirk (CM/ESO2)
>>> <dirk.behme@de.bosch.com> wrote:
>>>> using a rcar-dmac.c on RCar3 being quite similar to the recent mainlin=
> e
>>>> one [1] we got a BUG_ON() being hit [2].
> 
>>> Was the system running for a very long time?
>>
>> Hmm, the trace I have contains boot time stamps (dropped initially) like
>>
>> [  153.394731] kernel BUG at drivers/dma/sh/../dmaengine.h:54!
>>
>> I think this "153" implies 153s after boot,  i.e. ~2.5s after system
>> start. In case there is no wrap around here too.
> 
> Yes, that is still quite early in the boot process.
> Do you have log info from just before the crash, that might give a clue
> which device was trying to use DMA?

No, unfortunately not :(

We just have pure error logging, no complete console logging.

Best regards

Dirk

