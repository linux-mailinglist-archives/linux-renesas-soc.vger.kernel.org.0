Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348C54856D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jan 2022 17:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242016AbiAEQuC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jan 2022 11:50:02 -0500
Received: from mail-bn1nam07on2083.outbound.protection.outlook.com ([40.107.212.83]:15232
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242014AbiAEQt7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jan 2022 11:49:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d79DrDqg/arJBjGMzOqTvVDPSJ2ECc6hok3i+fW1Acptu3DPhYi21cTJBpbi4TfHXCyb7MN4+n711j/BTLwuHsyMcXvshSZyiJypnHDCqudBxAsOG3OEfSD5bpLwVgKglcVi83gh98yOphqsKvBCedqJ+rb8UArh1myWfbMdBbj54tdNfk0qRPkQOb7OOMTGK+9eZSWLs+96luamF1GbM6yS4qRbsRw49RMQneKL6Ft5Q61B5K14YgAImTYkVG3dRFPhq1UEK6a3UB2uRRyl6UvwvNVjbrMV1bVUfEWk4IlDZ8O/hJK5/ZXUqR4ZVsPWQsVg/4euXrBBGm4zhWYf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hp12OvDjrj5xSnQMAcAWwS4Q8q34Ka9UtAgyODFRLnA=;
 b=BgRl64TLGZuBEDaoL4z6UFxq514d4kNEIet95Ux4kryCvrM68ZvCcjroI9QEEwOD0pYGgmFtZ6HRupbkdjfWmIwDRRIwwH8JVQ5VS7VKVBL9uKLnyYf8ec//qUsLNZKv0Vx1n3x1jrKjzhsmxMwzhuji9zwpS6xD1b2HHIeTXETHqc0u9ZOWU5Y/XI1OIDv2JEznAKXY3VHyEdxCQffuZvuTm6P0e4BefQJEw72tziuLQVeLfwXORLiUfR0AoT88kr3byRGCDf5InG0M6clYJxlMoi0WEIyRBzoThdDg2/I1BdS0Q83YWTut+m030CtzHWcsWgmRZ8HMx1XWlYjOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hp12OvDjrj5xSnQMAcAWwS4Q8q34Ka9UtAgyODFRLnA=;
 b=VuXJD++8M1L5PZuuE51HFP5of09ynmQpdL4AvCYTIcyFVGJgPWuln2w1aK1O9XqjlOGYsR24nD7+BYPy2icYyWMGRSDRHmqnwKr/ni6bGpzeVYzIn9jvJ2n/nVUPbXoYY0KrjYENOwCyEov1B4X6+G+JnobJj41TsxVxmxi0MrNoKjcheP8cswe5EZxCDAAcJegYJbThrhLx23+Dln/foKPFAroofKd+3sp2kX1DAPvq619r10FakajbRZpxAtqY3AqkCEHYbIOQYahjQAuzn2lejg6W+XWe3vFeX4EHPgvcCnr3jGR+MvRlOoneT970Y8uG6l602VPnKdVaBx74ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5395.namprd12.prod.outlook.com (2603:10b6:303:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 5 Jan
 2022 16:49:57 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b120:5877:dc4b:1a7e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b120:5877:dc4b:1a7e%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 16:49:57 +0000
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20211122092816.2865873-1-ardb@kernel.org>
 <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
 <20211122092816.2865873-8-ardb@kernel.org>
 <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
 <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com>
 <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com>
 <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
 <b22077f6-0925-ee00-41ea-3e52241926e2@samsung.com>
 <CAMj1kXHQrqZSE1kHaQyQyK6R58EV3cUyvJFmM1JYifaMemyUhQ@mail.gmail.com>
 <f469726d-86fb-cf54-2775-d4658d2f3a5d@samsung.com>
 <CAMj1kXGyL7yTV4+pOs9iBWYuVvVmPTZrV5r=nzqttqpZ6-vYJA@mail.gmail.com>
 <CAMuHMdWNuCVeFiDrhnFmX0F1jxz8Fs4eFx55ojJF3d2ro-udrA@mail.gmail.com>
 <bbb0c788-bd83-833c-9445-87cff525f728@nvidia.com>
 <CAMj1kXEYjUspxOnvK=3O4pkVtXT+iBPz6mkskn=K6TTUZc+W2g@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c0d71f87-1329-205c-c4fb-d82d0f118a7b@nvidia.com>
Date:   Wed, 5 Jan 2022 16:49:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAMj1kXEYjUspxOnvK=3O4pkVtXT+iBPz6mkskn=K6TTUZc+W2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0322.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::21) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41814fd9-452b-4e2e-f18d-08d9d06b67da
X-MS-TrafficTypeDiagnostic: CO6PR12MB5395:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB53956907BAB226C8C69CE0E3D94B9@CO6PR12MB5395.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C+8OXk57E3nMIKdTwVnfCKVCzjKNE69oHaaBD5j7jVSbiX3lSuTQ5ziI7T/bD6N5PltwzQbi2wbKRpQlyx4MB9ZB8Uod2wA68bNVHRYFT/puE/6fbAvOBOlNnkdMXLcspVUPxMaNjmUDbQqE7b3iByZVHy5Enfj49yhmLKM1dZskCfjMJ6sFbA1VmYtKDD789cs44neAzOG2JFFLhQna5Wxxt57OJWMprwtz/xtNDrDOKbUJ7fvHx0NokN+0hXuCKNUMtT/O9TFiDDjZ9Lkiwyk1XyqWnw6cpcDjZj98MYfQvHwry/jcndYM6uDLbd4aqpRvWofaPDNWvUtKqsQvY2kGtDnU0n2ti8mqhHVDYC2yRBOonNgWvKDx5FKykIsq95E25NtnQij49BXynCp2CCg1bZJQE78TCwmxYT862sVBUkjOSutTBChGG9AAusms8uSIcOvjdUfLZt7DURO0EjBkZ4/dVoyTRFD034hOpak0a55+8p6F/VMQfXUW+PpUR5VzAYugegDdU4UyHKYhJJT+oYmPxsHnNIKxZHGPAS/71S4ovnj9PUTlblH/0FRHPhOmN9ZSOVbsU8UNCEvj1cFEl1SPWZE+s9DGGCXfV7hGTX2vpDzWIHCD4IT8hnI6XVdJ1V1On37HDrHiRXHpwKbceKqUlfSGpyzW/e2tMniRy3BVwXuJWRh/JQiDyT3mj8EJvt6mhLg/KIP8EVM91TvAGKKgF+CtAUhyd7qpZ77R2OG5Isaj8pvharzsotno
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(186003)(2616005)(5660300002)(66556008)(38100700002)(36756003)(6916009)(6506007)(316002)(508600001)(31686004)(8936002)(83380400001)(7416002)(6666004)(8676002)(53546011)(66946007)(6486002)(4326008)(2906002)(54906003)(6512007)(86362001)(31696002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUpIQ1M5VmFlWDROWWdQVkVYeUh2cE9kdThkamcwYUFyNVZTZlhpTFpQc1ly?=
 =?utf-8?B?cEROYTV5dDJOSytVVmc1MURkRGpmOWlJM3hrTVpMSUhxeTJybXJ2b0VTWDR5?=
 =?utf-8?B?bGhJOHl0NFBCMThBNlIyK1FDUjNhZ1VMelFRKzllbXVya1RQYUprMmRORUx3?=
 =?utf-8?B?Y0YvMk5tL1RsbzFQTVN2ZVFER2RlTDRTb2t0STRWamZkblN0bjF6bXp3QllC?=
 =?utf-8?B?Yjd6S2JCOTVLZEVBRm5yTE1jZjlQSVFKQ1d0RFNYbzJNbGJUTDg5dXM3Wjlw?=
 =?utf-8?B?YXBMVHNLOE85dXJ0aGZ1cnRHekw5Z0NTanpCZGNKTXdLQyt4U0ovbDBjWkUx?=
 =?utf-8?B?R3RVTU9TT2VHYjhaM2VXOE85SHJTV0xDelVKdDBxWm00Y2hIeWNUSmcydTdi?=
 =?utf-8?B?UHNWTk9nZFAwQnd6RFoxNkFQNEdMVlRMcGNsUXRkVWJNakd5cnpVYmJxRmVh?=
 =?utf-8?B?bXZJYXNXMHZQUjFvb2hxdng0Q01kMWdWUDExbmdZODRaMlIwRldWcGYyWGFQ?=
 =?utf-8?B?SFVscTRMbCt1UStHYnkyTGNUaStrSll3czhmVGw1UGQ1eU1yY2dON2lRQlN2?=
 =?utf-8?B?STZqRnlUMlRPcnZqZExlV3VtK0RFV1hwWGY3elc5Vy8vZk9Ga2lSeE50RFRR?=
 =?utf-8?B?RVloTUZtNTJDMjZqeXZGN2ZEam96Zkd1N1UzS3NpQkRKRnNGUzhML1k0V09M?=
 =?utf-8?B?S2hxV2JyYjlYR0M4Qnpzb3BscmpLc2VESG1mckFQdHZPc3NSUE15ZG5hYlVD?=
 =?utf-8?B?WkhtbnhMSHNNbWdyZ3pkU0RxUVdGcnJTNWtLTXEvUmxxdUI1V3NNQUV0MnFB?=
 =?utf-8?B?bHFwQkczbmhSVklBaU0yYURZR3dyZW9yM2ZWZ3lDMXc2RnJkU0srbVRnZWgr?=
 =?utf-8?B?bDlVNDVDU1Q1WUtZdnlqTlBrcWVLWWYwOERFVkVTdHMzaXZKUm9OK3NhT2pL?=
 =?utf-8?B?ZUxhbjk1VjRlVlRyQXNZSEhHRDdaVkFMUFpHRS9hdm5Ea3pzeFRYaUJJa0Vx?=
 =?utf-8?B?dUlDVWdsM01rcnlMdU56QnJVU3NzbVkxTGJCazd2THg5ajBwWnRnbFI3Q1hD?=
 =?utf-8?B?ODhTdldUOXFZc2hFTDVKTGNJclM5b2Ywa2c4cVZsNzFGQ0wwRkx2S0ljTnlq?=
 =?utf-8?B?b0NzUGZoVVdMUmVFcmRLME5VZnFhZ21tSVExS2lPdE9RZXd3U3cxcnVpQWxY?=
 =?utf-8?B?VDJsdWw3YWd3WXJWeG1HRXdNbzFxTlM5Vi9HN1JnU08xQmxKc2VDR1cvR1lF?=
 =?utf-8?B?Nlpjd3hVaS96SDNIL1pWY3dPRjk0R0xsakdBREcxVmVtbW9HbVVBMjJWWWlX?=
 =?utf-8?B?SUVOYXdQZU1nQzVvYVRPeVVSNWVneWJNQ1dMYUcrTUNsMVVyWEx4L0gyMUhV?=
 =?utf-8?B?NU1rb1RTb1Fsby8rdHpXdDJFZEZOSURwaXprMmdVK2cxYXF6ZFdnNDFseXQz?=
 =?utf-8?B?bU1JRWU1WHpxS2VFQnpWblREYTdQN1p0ek54Zm9PRWY0L0UxQTVxeER6amNT?=
 =?utf-8?B?bzBqZENjT3hNS0RxWnJ6YmRGZUNVOU1kMnBUdlBMemlEZ0NiMm9aNDlTOEZK?=
 =?utf-8?B?U0JBYmRpZWNYOTVhdTF4ZUQ3YTRocWJBaTFvdWtIelVSY01hUHNMSVZienh4?=
 =?utf-8?B?ejgxUTlqTkZRUVh4dDRUNllyTk5PcVl1cm56d25GZFZuQnozK3RYR3ZkdWQ2?=
 =?utf-8?B?QnFtbmNxVVIrYXdkRzdGcDBPaDRnWDREWm43YjdiRWhXTUxhZXdDZ3lyczBn?=
 =?utf-8?B?cU1RUlZlQk8xQnlITmNKb1Z6d0tISUdKa0xOWDg3SGg2MEZPcjBwM0FrN2Vy?=
 =?utf-8?B?NVZGazAydzNqR1IrOURRN0hIYi9URUsvTXNVWS9HaVJ6MGp6NlhWWnl5QmNF?=
 =?utf-8?B?dDlsU1Y1M0tqeW5BeWk5dlVnbm1qcEprNDd4RjNSNm1WYzZ2VHMwTC9VeEN3?=
 =?utf-8?B?UHp2NE9yV1NvQ1MrbEMwbXliMmRtWkl4MHVTZUUyLzFYU2IwQVlDeUNJVVNs?=
 =?utf-8?B?RXpkMmhINkUvVDAyQk9Wa1lvOEcrbDJIbFVQSTJody94cmxNeW1ROHo3U2pR?=
 =?utf-8?B?bFNrTllWQ1UxTHRjNGsvS0dtWmE1eWNxa1dTcnYrTEt1cmFFQVJtcEFuVkk1?=
 =?utf-8?B?L2l3NFYvY3lPcW40amFwOXdOQjkzRVlONThWdHozUlc1bHE5RHBWZnl3d0xS?=
 =?utf-8?B?UXJpby9MRTNKOUs0b0tocnNjNXZkR3ZyVGxFNE55N1dDRHR3MWJPeUFDNytC?=
 =?utf-8?Q?7IoRPiVzcE1nqLc9GTz5tlMBtuzz+JUY+K+ANTXk8Q=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41814fd9-452b-4e2e-f18d-08d9d06b67da
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 16:49:57.5552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihSPUe0dnrLq5wf4CaG5IZ63nvtqEUsuV45tRmt27Gp7KhX8Di0QOxqnTET6ezHaltxTfPhKOfvRxbmYqOCeCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5395
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 05/01/2022 11:12, Ard Biesheuvel wrote:

...

> Thanks for the report.
> 
> It would be helpful if you could provide some more context:
> - does it happen on a LPAE build too?

Enabling CONFIG_ARM_LPAE does work.

> - does it only happen on SMP capable systems?
> - does it reproduce on such systems when using only a single CPU?
> (i.e., pass 'nosmp' on the kernel command line)

Adding 'nosmp' does not help.

> - when passing 'no_console_suspend' on the kernel command line, are
> any useful diagnostics produced?

Adding 'no_console_suspend' does not produce any interesting logs.

> - is there any way you could tell whether the crash/hang (assuming
> that is what you are observing) occurs on the suspend path or on
> resume?

That is not clear. I see it entering suspend, but not clear if it is 
failing on entering suspend or resuming.

Cheers
Jon

-- 
nvpublic
