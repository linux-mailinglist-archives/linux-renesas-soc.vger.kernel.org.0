Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDC74851E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jan 2022 12:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239742AbiAELeG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jan 2022 06:34:06 -0500
Received: from mail-bn7nam10on2064.outbound.protection.outlook.com ([40.107.92.64]:56032
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239746AbiAELd6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jan 2022 06:33:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XajBwculXldc4ay6hWs1LuC53FxCDXgtvAq0wytMQ7uPvFZXT35s86HO9KitW7DkkfxRX6vw+JTn26uNFjaImY7jcRbdUIak0ORUo3D3GpQBrNnUS0jVbTLrmR8/4qZXyUlRxguA/hvq2Z5j6lfJoVYM6aF3ATAx+8XQc1t74wgj/gCkyJOpHOSv4Bs7AJCobhRMjJ5E4ICtQCJXKmirK1JIOX3PaiZ/GMKNTLkLcAZ+BsSrN6HGEFj1taDzc92Z60OPWWyMnR0I5d6TrqO8hPCpUzXY+QvxR5qNUM6w6e43F/SC7HQvmuedxacCPEoxm3h8JZM57bUJD6LW2w6CsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aC4nFnMeVUcTahh5HJDS3yn0y8PmidNRbPUHNRho8jk=;
 b=OByOuOAP+UeDPLjR0KfciCEQRYBZsbPsPmDXfmgo27lsdwJ/wCApFJzcc9tVznKFeA4+aum1anokLFm3TJ01SrDtkWoYP0oJq5jhmLkicO2Ds0/fQUvvUVFY83jYyBj48FaducelOhp3NNYb7aWBK0CFv0Un2DKVyRc+46yaVj39lBs7yGP0UVlhozSmBtT8h096Z+9Cztq4Qn3NVag/cBdsXe72P5L8jmmN4cSV/nsC8nSmkaON0dy++1NW77j5yXTvawlhCdfReSAB0gqde6X5skinOKF5B3B6jMTQOJ6zpO76Qy8s2/DM03Q7ovcKwcsVPPhLyE/Ts80WfhnNtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aC4nFnMeVUcTahh5HJDS3yn0y8PmidNRbPUHNRho8jk=;
 b=bxDCgYGHsFotyH/3EyGgKbOBsb9qYgf/+VREOaFv7myMV63WEhjyB8fTkWoDW0rMtQkP3iNO3p9KiWH04Hrvdn57AkNH42ou7rnq45a3SIkn85r5syUz1eiTLQXg7zi8rIcQo1ztxnoQEZm5frVbUWO1qyvB0FkBJ7sLvRjLQlj/lej58Q+1khRrOcCT2d1A2ehZvK3OG6OVK3H4R7BWJUBdcAUpgvPnNU15LxeXeDePqnrF3UN6PARJSnW3jHEBP3wgByZvWkYR9qyGmtpCiSEqtDuXYRqXOLxQR8GfKGJJ4Fd9mGES3afkre19ptoh9srmQCmfwHXvkFz8upDPeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5411.namprd12.prod.outlook.com (2603:10b6:5:356::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.9; Wed, 5 Jan 2022 11:33:57 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b120:5877:dc4b:1a7e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b120:5877:dc4b:1a7e%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 11:33:56 +0000
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
Message-ID: <4ae3e371-68d0-64d7-713e-88af45875b3f@nvidia.com>
Date:   Wed, 5 Jan 2022 11:33:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAMj1kXEYjUspxOnvK=3O4pkVtXT+iBPz6mkskn=K6TTUZc+W2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0424.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::28) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e17470e4-bd2a-45ff-cb9f-08d9d03f4295
X-MS-TrafficTypeDiagnostic: CO6PR12MB5411:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB54116C1A8ECAB5403C2CAF47D94B9@CO6PR12MB5411.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cF8QJm2EDyxmYhx6UM0D8uoL0x9Z686yftexSn1rSS/KcYE1KQdsJfMbHlfPbn4BSlMVCGkYbo/Lek0BtFfO8/jl2WWTfsR/oN4Y4m+7mNKPUkUhNAwgb6Akp2IZZJYOAeCUuz8GWji/Hyw2a4B+exFO4Sbhtt7aAlY4zzwDSvaC+GHrhMJfBfG8TTMQ9wLX4AF7T21ldJ+O4MUgbdYON90ILfleremSClMLxJygA1FU6vo64HowpXCmak2pu2QSO5bVzBteqd1yUX3h4Fr6ZH9iozlwn4wyJLXwbN3giXsTkjdMynBmy9XusZWFW35ROjuQyyvL4sCBm6yyvx35CAtTYFIPrOOo1Kc/30VxJRSg/PWA6ieGrCiQMSKvBguolZwEbVvCxa/mje4jT/W9FaHmIsDqM6gM7vPTj1xCIyxOqNM9t4Io56rmzXw5pafMT3k8FQLS7nL3i6/zMNDwBnog0jF0lT/N1mTzkDfIZp6717LSui1kCJJeULH7TrcDWULdiV1AN+NuwRdJEg1w58MVpvE5sV1GJBaNSmImE1h7b2F1iwfrnd+S4+Run5vUYR0Q7t3OuqRgEJ23WX3uFhQ/3th/6OKEziOI1FCb70LTVFAtY/XvtTbqqK1dXTCGFnl6Wi9R7AkMlqn8gYC8CfefmZMfS2H9A7DFGjEdLhwVIRbFIekIOQaUCJ1btCpn/PaefYmx9TtO75L63KlliW/vp+RWQoWCLiQjuxfukoXLkcJQP3yo2h/nUGm+GvC3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(53546011)(316002)(38100700002)(6506007)(6512007)(66946007)(2616005)(66476007)(6486002)(86362001)(66556008)(186003)(4326008)(5660300002)(54906003)(508600001)(2906002)(7416002)(36756003)(31696002)(31686004)(83380400001)(4744005)(6666004)(6916009)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWdkdzcxUmJrTitlL3ZDaHpnQ21ENGoxSzBhbm9zZ2lwaXI0VWZSczcvR2sr?=
 =?utf-8?B?L21hQjh5Z2RUZ1VvaWhiY1RHcTBKVUhYd3Z1dFRSZzhoRnpzVG4vMnQ3YjZi?=
 =?utf-8?B?d0M3Y0c5S29rd0lkTi9nS1Y0bW9SQ21jQzh1RU1qNEExd0RqUmJmdjRsTkxX?=
 =?utf-8?B?MU5kS0diYXRBS2tOYzRnZzUyVjdPYkpEc0dpNUx4OEhBdmt2U1Jyd242QzNn?=
 =?utf-8?B?RlpXN2JXRG1iMU40M1FKaHAvNTRsMkdscVBiY29LTUh4SFV6MU1vcFV2cGg1?=
 =?utf-8?B?Z0dFS3lGbFhRNlpZTG5MZGJQZWE1OGtnQzBsekwzdG51a3VkUkZPL3kwamg5?=
 =?utf-8?B?ZWt2WnRBbThJY3BPWmQvZzBpeWtNUW9kUEsveU1TNWllNVg3WVZOVWkxQkF2?=
 =?utf-8?B?Vm1oKy9iaE02TWNBUFJsRTNVdzBYU2lLNWFYeUxmMnE5R3JDNWJlOHREamNx?=
 =?utf-8?B?UzZzb1lUc1lSTkQxb3pnZEdTS2ExODNiRWIrS05XRjRBd1hqWjJJeDNwNGd3?=
 =?utf-8?B?c0hEMkVjci85Q3ZrWkRLT1JmNmVERlRRV2VQWForMHFGUjA4WXRUREVBQWdy?=
 =?utf-8?B?Q0puL1phdC8zeGNTYTlRRjM2aUhWZXNnbDJqOUFMcVRLZkhoVHNSeEh0QWl2?=
 =?utf-8?B?cVRua2pSSEgvWEZieVNQdFhuay8waHM0K0owSDRHWlRMY3hlWEhPMGZUaThI?=
 =?utf-8?B?QzRwSmZyRTl6b29GbFZOTkZXbElrbVc0S2lUZVlqTDdzdlduZUhDeFllVHRq?=
 =?utf-8?B?S1E2T0tqcmthZlR1SnorYW91eFAxQ0l4bXRGaUFBdU9McXRJRHFlR2F0OWlh?=
 =?utf-8?B?dUY0eGdZUjd4eW9KVWxWOTVwbWduQVZNc09CWmhwODZtbUhpeWpOeWN3YzMw?=
 =?utf-8?B?ZTNZYjBrdXBXWkJOOWNST1JqWDNNODNubCtLYkdTTzVPL3EyM0pHZTBxcjRk?=
 =?utf-8?B?cG9GeUFUcEZ1UFN3V1lML1pyWFhrTVUwNFJvZWx2NSsvRlBtTXUwbVNldWV3?=
 =?utf-8?B?SFdGaFJLNUpNVW9ud1lTNkRYMkNtc0Jwai8zTUNzVXVHZFNnaFhPelFyczBU?=
 =?utf-8?B?Q0RoRE1vanc2dFkwRmp1TkxnZ0NkL3l2SkVxaTZpOG02bm8rcEFxS2d2NGJ6?=
 =?utf-8?B?U0xvd2dXQVF5c3hWU09mdTN0aVo4bmFyTjVhMHN4RjhxaU9UaFFSTmdMNkFJ?=
 =?utf-8?B?L0ZtYi9PMWVRSWdDREk0KzZScW1LcDBNYWJTS2QyRHI1Q0haVnZwOFJtQUda?=
 =?utf-8?B?bUNzdlYxVFlqRnp6YVNTMDZ3THhuTnplQ25TNHUvQjdPYWxCR1pMdElrZGR2?=
 =?utf-8?B?dlhxT3FDMXd1VTAzcUNvREtHU2NwV2ZrSHg3N3ZvbENOay9kamhpWStVdlZa?=
 =?utf-8?B?VVpUQU40NlNLbm1HZ2xsYWc0djQ1eGs0WlZBUEpLc2hxR1c5QWIyTFFzMDlK?=
 =?utf-8?B?WEdCTjRrYk9CazM4UU85dmdiRXZkdktXamFhQkYzM0NjRWdIN3E0SW9qdHRp?=
 =?utf-8?B?K0ZrTlVrbGloTXV3ajA0NWQ2MS9mYzlMY0oyRE9TYVl3V3czRDRGM2lFL2hI?=
 =?utf-8?B?ZW5qUlhjdFVyaWo0aFlXNWVkMmhTeS9LWnEyaDF1TG1QYUhxYmpCQlk3ZkFL?=
 =?utf-8?B?QkVPVXRGRXhCVkxJZVliNlhxSE5GSis3ZU9OWHJURTU3VkhpYjNzeFNUZVlN?=
 =?utf-8?B?OXdjbTFLbWl3Q2Y3blczVnV5YzdqUjZBWnZ2eTNwUzdlV0ZjTW5qOU1ybkpH?=
 =?utf-8?B?Nk9lelJHWW5vK1ZaMExQUUptUWd4Z3VIdG9qTlRPaE9KTng1MjZiVFFTZzF0?=
 =?utf-8?B?RTNqOXhNZVFoaVJSRkRTazQvTWtTbWhSZ2dFb3Z3QUZ4TGdQK1hXSTcyV00r?=
 =?utf-8?B?dkZIdm8zYlh0U2hObi9sRktqaGwzTE9FTXIwaTF6cFJxWk03akFjRmhydWY1?=
 =?utf-8?B?Nktpb2RabEtTQWtLYmN5ZXEybUJDblJYNEtURXd0UnVITDhRN25OWXhkeEFS?=
 =?utf-8?B?Y2Znd1U5OUVXejZnYm5nekFBQmNqMEQ5QmZvcy9EdFc4cW03WVlrNFFLcDZm?=
 =?utf-8?B?S1dRcXF4UHF4QnQ1OGdCYXFEVVFnenp0Nk9Cd1FTWE0rUVZlSW1vYTBPWk0r?=
 =?utf-8?B?R1RodUsxK1FXbk1wMFJnTnpLeVdGY3R4anNZUzJmSnZzNHBneUNFekFGZm50?=
 =?utf-8?B?THd2d3pYdUhFUG9TaFQrYlAxUFlNYk8wSHpoei95bUNEaHRBODE2VzRLUDIy?=
 =?utf-8?Q?T3UYprb95iYg2LY1u4GTp1vWkIDsnsits1C1oGqUbk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e17470e4-bd2a-45ff-cb9f-08d9d03f4295
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 11:33:56.9047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4U/4aRtn8LDHwqv+UscSDqYdC4dWp4pvGuKBYbMeDyadRA6Wj6lhAWpLFLdlJTc4si5nRNC1EJeZo4W0simItw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5411
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 05/01/2022 11:12, Ard Biesheuvel wrote:

...

> Thanks for the report.
> 
> It would be helpful if you could provide some more context:
> - does it happen on a LPAE build too?
> - does it only happen on SMP capable systems?

These are all SMP systems.

> - does it reproduce on such systems when using only a single CPU?
> (i.e., pass 'nosmp' on the kernel command line)

I would need to try this.

> - when passing 'no_console_suspend' on the kernel command line, are
> any useful diagnostics produced?
> - is there any way you could tell whether the crash/hang (assuming
> that is what you are observing) occurs on the suspend path or on
> resume?
> - any other observations that could narrow this down?

I can run the above and let you know what I find.

Cheers
Jon

-- 
nvpublic
