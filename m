Return-Path: <linux-renesas-soc+bounces-1594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B1082FDBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jan 2024 00:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDAE61F284EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jan 2024 23:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC075232;
	Tue, 16 Jan 2024 23:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DxCIBURT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2114.outbound.protection.outlook.com [40.107.113.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACCD67C49
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jan 2024 23:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705447658; cv=fail; b=hbeMebvMtGWumsYRL4lODP4Tq8XC/a2ZLvwEKm3YOL5Rbq7v9OTxFA/5J8zsKoqiNJoYicXyXSMYw7OOZmcoYDevkFm9x251PCduVy0BeO+1tEYq6vxlwzRG9RnY+KBGTlflsna2K6WG0OqYtJJuTqcKm2m982HzegYfIESjZvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705447658; c=relaxed/simple;
	bh=kkd+AB4Vf1M4BIv7yBKQMt6Tw7RrhwQKGc7MOyhdSeg=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:Message-ID:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Content-Type:Date:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=aD0AmGkv9N//0bbsfxelS0eAUg029fSGYlB6AnjHQvWOCl+/e+JLXP2UwHHH+HPB2QKnBGjH9nk6+y+Lf6E3BtaXoP8uSw/l07Aj21HMm5y2mebqBBfd4vUycWWmLqLw3aftj/SEvHRlywORDmJ4S74d4dqEzxDyAEF/4UXI4HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DxCIBURT; arc=fail smtp.client-ip=40.107.113.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5rvVyaWY0Uty5iRY9+ZYpQK13t48SkxTBldeoBnx0wRUom0D1Sew/zQ4dAsJbrpIXM1//c0PrOxkKmHtVv51AaRQc7D+EAGRCzmW747My6BlRclrbsNlDk2G8QNzLAeBXseL+IORnhh5yp4XYRclrzwBwBkvbDOJxFP6N+Ok6of/0m1zux/kYkyTO8dXwKTBukgSlRWfH4Qhlhcr+TEC1T00eKWJHIX470ETUF/l+jdJcgdMwaI4eNx2L+2kThkoybMdpofYTgTOUfi4ODHr+SLUOL6mEmgclgthRh518FQnkuPwfbbiQTAhjQnBKRO+56Xdf9WFEWAddLsYY6s4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KO1TpmECr7NibNHhr+al+67c+J6HgEWZbXG4u6gmGLo=;
 b=I/LhWo+vzV1nYvzVOthit19LTEai8pv1rUtjEJPp7Jv0oo9VAq2LUTIMwgxVly1+1JjfFuyQ/Bo4AKtlP1W2ynU/epxAunMg4wgQ9uUlyPByTssVhAsHFhrHM/LZwC1ynZ0MCltk702NqHQiNutrenkqEeLDV0G9uR4mlZSqtn7stJl7n9BMFIQdb2qHpofmOmqf7JNw/JpEuz6BzEbnksDqsehFsBKZPWJgFE8qxfol6cwI+Q5Cs92ryxVkSejaTXcSdi7tnmkKbelXmKufIjm5E1onq5GG5UGiDVvR0xQ9bn48jQ5WzW5C+Uz8JDknbnTfG/O8BRU2uhPEp3omcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KO1TpmECr7NibNHhr+al+67c+J6HgEWZbXG4u6gmGLo=;
 b=DxCIBURT5/Y1vIzrv/ADsxiEpZ/X8m7tbuhybL92kvc5gUK/cEWaCb7qB9nHtpi8N3U5C0qZNetwj6E00M50aV4Pd5tGr99Dd0RLFLPiBMOCscFtRkjb414MBMsW0bWhHy51y9Ppm5UHL+h1NNVipleAtRJpKsXG1Ts3PYhlwDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9782.jpnprd01.prod.outlook.com
 (2603:1096:400:20c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Tue, 16 Jan
 2024 23:27:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7202.020; Tue, 16 Jan 2024
 23:27:33 +0000
Message-ID: <874jfcvoyj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: add R-Car Gen4 PCIe
In-Reply-To: <CAMuHMdWOkL=AzLM0j8UqtNsvAMGPWQ-rU9vcA+NvG_9xDq3OGQ@mail.gmail.com>
References: <87sf2ztoq4.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWOkL=AzLM0j8UqtNsvAMGPWQ-rU9vcA+NvG_9xDq3OGQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Jan 2024 23:27:33 +0000
X-ClientProxiedBy: TYAPR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9782:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9f6e77-c268-4864-a89e-08dc16eab73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gCE4uSdMPORRMRra8Vs8MksEcIiOOOM41fO5KnLZlBNAOuCvlMPu+4bmAgF4Ho4ZbjMEPtH1kwcD+ffjxcPpRIpq3l/UeXXZRuQ+CwFC2g51r1OHr9yT2Ir7y/X1LBCe4JyWTYdw9HKRyS0g1K4jE3xDqshJ6GsPOgTkXIWdndan8OfwMq0f+JZVPvRtNpJ7OCrbwFDrhDxKQW+UxIC4KnsDH0o1geBM+coUG6PIYJag7B2TinNm1pYXqQfi1K6SnBoDZbTMbqpfEv/EDIMjJzG8h1I/mZ7yum0PGvW8gXGMiIVNQvKzEL/VX3gCVP+1g3Nt2LTW+BEJWvu1Dxoyoe5xHFVOB9RmIYm4AF9XFER9/8jezqW6n1w62QVKaN1zThwGNr6YgeQDXgUWDOWYRZwDqK5lZ74/JRTCigGcq18tNulJIUvQFYEhowcx1Rcq0av7C9l/4zNehVKhvk4MJP4nv3NUqf75DbufWcjb0JIQlaKZDXOuDiF6oEDjL+dFP5DSwiWLRn64TWV9VoNDKDoYPm+VDrhTbEmM9OcFcNNIZL2By+E3/G4h1uUNnZyzDS+dQT8TIledfeVbfkW8dQ7gGGDlIWd84p7A/4U1WakbTTuarWQf9GDCCEsksJan
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(86362001)(36756003)(4326008)(38100700002)(26005)(6486002)(66556008)(66946007)(2906002)(66476007)(316002)(6916009)(54906003)(4744005)(2616005)(107886003)(478600001)(8936002)(52116002)(8676002)(5660300002)(6506007)(6512007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gf4UNOpn0vSnmZ0SUoJvJz5AJc6Glr1iisyBwNspNwTgpGeMHNagsnsegemz?=
 =?us-ascii?Q?D5aj5NZHWM71byRihfcBZ6fH55vSbBRDQ50IZlSCmUj4ouBPT1bKyEv0yEhh?=
 =?us-ascii?Q?E5nz69/iYLWdCsyv6Ie7YK5IzVVn25QPykRzRAqsRvaOi0c8AYULyX+5QYqy?=
 =?us-ascii?Q?GM9lzFy5pOLavyqf4VrgTFvWJGPmfBdar0BNEmRDZaGhT6TuVf4YHMQ130E0?=
 =?us-ascii?Q?xam+3c/ckmTZVUDl7S/gDdBkedcsFRe4W8i+KkdyunTuE6a4OFLf/0cbxlJx?=
 =?us-ascii?Q?qb+cDlczt9v3S8Yqq4GKhHp0pXKnp0aFmG49o0tS1weKER4JEOTfnD4Pwmzf?=
 =?us-ascii?Q?ngJjN+3ePa0L8NdqrgyTsF1n1RuryLdZmp12aQzVkTGJYMWx3LlCH3aqq8qo?=
 =?us-ascii?Q?R1U08gJtFBAu459sOHcg/78bUJq5f7nqEodroA7aItimb+D+u4AXdzDlW8z7?=
 =?us-ascii?Q?bvsrkojULAmrcYbntOefbLIMSpwTUrWj7QFRXBWmNy094s+t/8iZO/3/KHIe?=
 =?us-ascii?Q?XibKWAFOHHx+d3dP8wLOBWgbEDR5b8EjArs1xm49o8j44db+tOaVok8vfnsn?=
 =?us-ascii?Q?e/pbdcEP80ujW0a0XRMdiMuCcaeoGTUzJg2B99JWjGOLW2zTQShOGl7c+36J?=
 =?us-ascii?Q?SzfyEv5IVTG3dZGgcX+FvWuSql3PRNCf3fPj4ZF4C9zxNWO+6ryUWf50z9Qs?=
 =?us-ascii?Q?MVV9PnE8kENRqD6WGr5LUFPlQXwt/V5jLIiSonqPTn26EN53+w6OcU6Pv5cS?=
 =?us-ascii?Q?osEV5por1eZ9Rx6mPf2SmQa5/IfP9h2Y5iXOuSYAB8NK8Enz1zg32wz+3smj?=
 =?us-ascii?Q?1p7g+xUqubUYs+t0NNlBNeXzmITsm4x4VTRSjof4QSFPyl4crcXcoMkPerJg?=
 =?us-ascii?Q?qlQK+NRc0JVIacM4Z7gCjiqvoD7/0S3vg2ofekD54QFzUKky1kLVPh0uVqJQ?=
 =?us-ascii?Q?oP2xPmbuFMXsMQV9G8lfsJy6udzMyapok0xLGj4wLYqpgapLJLJUfNn9PAo+?=
 =?us-ascii?Q?nJQWgN6cRnzc/ALeYGloGJbdAAcVF6T1XACc1apZEPLF0OGgoj2uJrLGuaba?=
 =?us-ascii?Q?RFeksBIH8CIN8mAGca9hmD88D9JlTJKv7UG70b0jh6XuifpLZaMpUrHXgBze?=
 =?us-ascii?Q?qOs3uVKNbmtI86zpco0aXabullk6TAlb2tKzEz0EUBzdut5N2ifYStjVIJqB?=
 =?us-ascii?Q?oMDHGxoIYr57jNhY9uQG+G7uc8N5/yAyUmwLm4crrRheIcj0h472OdwWR5iL?=
 =?us-ascii?Q?XUNzvk/UBp1CDOKtiVMJEa1AiSJjWk1NhWewjYnLcfki3kIdBqP+ySH/N1E0?=
 =?us-ascii?Q?ROm8I15PG6QMm5RsrA7kcA3crzPgYgudksfXeCL8kdv/kzFepJbN8fu9wOtB?=
 =?us-ascii?Q?LOXqSn682NfcOyU4Ikh+HMvNGj+OtWsBxDUVjzCF/AlOxJrCt/4ILImKPGoH?=
 =?us-ascii?Q?1k7kKm0VPgy/yzz48TlBjieJxpC3Vy4g72fX/qx3/r5gKjsRXV9gCYO8OQaq?=
 =?us-ascii?Q?I7Xt2GZPcj7ST41wP3hRVj9XkxBriabPT7bWC++GYGcNbcs426IGpfs/bgLK?=
 =?us-ascii?Q?n3fdXAOKoL/o4bMVAS06uumGj9g0S4Pj5bv67r9lT7mqy5FFEox+Lq4k7jXt?=
 =?us-ascii?Q?3XlWF8E9Qo9Q7S62oSiGzbg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9f6e77-c268-4864-a89e-08dc16eab73f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 23:27:33.3484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nszmroKQgyR9pwvPtdU+R3gNDtmi2Iki426wfs/fKQdeHRPdQnbeFUGsfK7q8bAg0ypd7y6S6nXZqjxKRmsDgYgc4JA4topoDfO/VXW331Q3Jhu8lRVuDb1POk17sr1B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9782


Hi Geert

> Thanks for your patch!
> 
> > --- a/arch/arm64/configs/renesas_defconfig
> > +++ b/arch/arm64/configs/renesas_defconfig
> > @@ -108,6 +108,8 @@ CONFIG_HOTPLUG_PCI=y
> >  CONFIG_PCI_HOST_GENERIC=y
> >  CONFIG_PCIE_RCAR_HOST=y
> >  CONFIG_PCIE_RCAR_EP=y
> > +CONFIG_PCIE_RCAR_GEN4_HOST=y
> > +CONFIG_PCIE_RCAR_GEN4_EP=y
> >  CONFIG_PCI_ENDPOINT=y
> >  CONFIG_PCI_ENDPOINT_CONFIGFS=y
> >  CONFIG_PCI_EPF_TEST=y
> 
> These two options are already enabled, cfr.

Wow ! Nice !
Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

