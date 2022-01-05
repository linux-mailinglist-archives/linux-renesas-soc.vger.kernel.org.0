Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E9F48519E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jan 2022 12:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235299AbiAELIw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jan 2022 06:08:52 -0500
Received: from mail-sn1anam02on2080.outbound.protection.outlook.com ([40.107.96.80]:28263
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231725AbiAELIv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jan 2022 06:08:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkMcsWbmSkfUvjs5lBLt4Zgvy7CTQFm7ERO0ivIVoQbtw26gmxDxdR165FKIBjHONPhX6ouUA+hbJgJKEn5s6KJbRevT/ugvI/zOIth+LH+wL7ZrpzujpTo2OKzAD6zvdxDEhpEQJvLTSotdUb+p40581erLBfk2KAdT0XRUD8EfR3ybnYE/STJM9znqC9MXValtnBl6AxM2kL96S13arvahICfCfNl/Fdlr1EoUoTREQTcUl+jYsAEkzAlGst0Uk4DuGvyPEbVdCNmDbUoOUQA0QS7xljs4S+AJJgBrZY5gnZ19fucA7l7jecx0UsE9aAktBMklBFQSRYlt+CRwDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPACv55G5apAGZ8nbSn9DFB1jqDMC+O+xLXJ7jBE4d8=;
 b=GzcZVYB3vILJ70Tp4D90W7FzwZqAVCG0rtNDDhKvkp1TDQD0oMNNocDZk8jrvXUGHVyw8GRQvj4bgCvnCHJZUqedGQH5Nhi7/Jc1UwDErlrT56FGuJWk0vbST/BzKWUlaC7SYKZ/nO4/0ePABGAhe5YuPXp7pzDDheDOfnfQeBk53wqC7vZT53U2JWIWZsDXmwaN8yhMT2e4Ni6gdoCDP1/riziEOlSOd++IH1FotXD9ym2p3g9tIm3sBhrnvYvMPHvaQQJCbKMawFVk4NAcrKuN27YwGodSOC6sij3lVZJD8zbFGDaF4YqQKFpgJY0IDN/nmQ6G75pL14bmLFJ3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPACv55G5apAGZ8nbSn9DFB1jqDMC+O+xLXJ7jBE4d8=;
 b=cLsmPvrvVpMwMA2FDN34dBtsN682cSekhlJNRrc2Yzas1wGNSK3N3tI/T/o9zaDruINQ0WkPz3PWf+e/dJuLdGxY7tR/dhV07Zjtp5sGUWNuN6N/lVPQnymxNV7oKvLVVXZrtCSZQiMDq4Wspszb+IiE5wpaBAXf++x3pxZBpoWQ3qYiuKBEHV6QARgb/9w8dD4f2RKPW5FExHtiyDc6McUhqNWIu5UcWjOJGPCHXZRMZZu7o76Gk9B5eh0F0QkIqoq1PfFa4C1zXyDrDOYCPAIUIY/v8Wu8QvdSmrFbi7ZslQbKz4wrVgjoeVEneePYKQM7xMvd8CUzwuccxaZzQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5395.namprd12.prod.outlook.com (2603:10b6:303:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 5 Jan
 2022 11:08:48 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b120:5877:dc4b:1a7e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b120:5877:dc4b:1a7e%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 11:08:47 +0000
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
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
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <bbb0c788-bd83-833c-9445-87cff525f728@nvidia.com>
Date:   Wed, 5 Jan 2022 11:08:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAMuHMdWNuCVeFiDrhnFmX0F1jxz8Fs4eFx55ojJF3d2ro-udrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 739a6cbb-2d15-45d7-0be5-08d9d03bbebb
X-MS-TrafficTypeDiagnostic: CO6PR12MB5395:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB5395179848EF695561F3C4A0D94B9@CO6PR12MB5395.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KNrqEFDS/zLvMgDmapel+ve2gFLkTxmdFpJDe4OL094Qmq5y4cp0lNs6t//h3FpF0oAusd8JECTsFAa97jDq72FvfXiJpLeNWHDngJEeAfrrbUhoguLKULhWcgmh1MMZgDVzUsPT/+0E6UIGptd0ERMlxSuiGSQPevp/xESwdVVYdY7JT/P6cpIW6h9AZM3TEvLF9ACLhNgvqPTPmGOnTUwIadBCBYU0b2ZSCj2tgtvf1PnoEarEeo6XX29qTPnt7yTdXmkpHO8D56ZPHnMUmptWlT1+EccX5FJS4RT45YnCTL40hCbr8UnOLuW5vwEn2et+CQKVefKyU+8fvGdwxexM3QNRbjTdz8UAPDfCqaNHOvltsYl0Z2+mP7bXOoYqt33KYKpzBSMhcOZhE0vCIFsqFUwg13Psi/v9RQAXZ07rtbSrjw/dgEZLC6evRFEm2h/13NV+RCAb5bkZU6v+1HjNIkZQrErmffWqSMYZ08lRF0jaSEEzEAyWg0RINlMU/7/fezFYSBKbg5/+zeoCz2Yc7TcviMuCjT8DSEZxwbbkRYURmWjOEmlFFsTfKNYvCWS/W6um+k3v4e73aLay2I7zIX4Bma7beU9qmgDpUqYP6/OZ8cfOMwFI8pwHdemfSRUvEiiVa9bCEjwWAmL9y/evhy1+1GgVWz7oXgVEbKHbhcnHlL99gJOfUXwCtMudIjVFz33Kj51/9kYdONsUnXjoG5NqztMEmGA8w3ca77o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(186003)(2616005)(66556008)(5660300002)(38100700002)(36756003)(6506007)(508600001)(31686004)(8936002)(316002)(83380400001)(7416002)(6666004)(66946007)(8676002)(53546011)(110136005)(4326008)(6486002)(2906002)(31696002)(6512007)(86362001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFJHY0NmQjZScHI0K1hqdU52YU5scHhBYkRjQktNQ2p5QVRsWGg0SG05Slll?=
 =?utf-8?B?RWhOM1p2elpHTUVUZXJ5ekdYNTczTkpvY2RjRStYNkdnM3piQXQ0YXc2MUJm?=
 =?utf-8?B?L2RDVi9mOEU3bmdVQThkRW01OVJ0QzAraXBaRU5JMTE2VnA3S0tLKzhteGM5?=
 =?utf-8?B?ZDlyMVBkR2pPdlZqRFJXbnREM1BUWjdnbTVYaUhSanJTZUtxRkEzaDhzRGhG?=
 =?utf-8?B?MkJQd0NFVU4wL3BxNlhNOHFQYk9jUXFPc3VWdFI5NTV3aW1XcGFDWUVTM0hM?=
 =?utf-8?B?WHBoS3ZUNmJrVTdPVXlLbHI4anpyQVpxRFM2b2RFOWNEenlvMExZMVZUSGFM?=
 =?utf-8?B?ZWVDK0RtSUZwWXdNME1IeFNjNDVocWliZ3NJcS9zcDRTVTJVUEY3RFZTYWVB?=
 =?utf-8?B?Y3IrWFl2Tk9YSkxLN3BVL2Z2Tk96b0s0REJqbzlaZWRGWjJzR3ZObDEya3Fa?=
 =?utf-8?B?cWFHQWFWdWw3NFdCNVI2ekFPYVN5cnJIcjFIY3lBaW5QMlZlUnJYVmZxREhI?=
 =?utf-8?B?N1B3Q05FcWZPbTYwR2tCSUJRVG1RYlU5YjNCcDhlYzZhb3BKTGtOSVRQbUNM?=
 =?utf-8?B?YlJsQ2xiOXUrRjVDVEZ5a0tBdVJBNEpxclNIRzZYeExqLzJuUzM4UmM1REM5?=
 =?utf-8?B?Ukd5Y3U3YzNKZEdWUHRkMDEySnpXQlp1S0hkelcycEVUaHdYQy9oTWhUOTMy?=
 =?utf-8?B?TkMrMmpBa3dOTzJsMG4ya1RWd1hoOVNnZDdEM3p4L2podHMwVjdSRVhDblU0?=
 =?utf-8?B?WEtLUE1WZW9TMzdqSG1IM2pGb2R5OXF0VzJ3cSs1TTBtdjBhSWVGZkpqaWZw?=
 =?utf-8?B?Njc2T0UwNkxjUDdNZFIwY0g0bzlKSWZPbFRadGJOU0NOMXJRSENRK1VOWGt5?=
 =?utf-8?B?YlN6azM1VzNZc2Y3U3JoUFExYVZjNXZUN2pVWGRJY2F3K2xiNS9GWVZaWjF6?=
 =?utf-8?B?cmJYbUQ1ZVU3QVNKQS94czVjNE5Lb1VWTW5Gd0I3T0Ftank4SlMxMXQxaHRZ?=
 =?utf-8?B?ZTlsNGp4cnJRUXFFN1ZXN1pzOVJMZWh4Y2o4NjlhY2ZRcHNXNmIrem5NS0tk?=
 =?utf-8?B?akxtWUJVejZldnhRYkdtVytDZS9EeUI5SlZ2NDZObW9FTnBSWEkxRGtWWDND?=
 =?utf-8?B?Z2xvdzVxSjhtYXV2aVo4bjVvWExKWVBTL0o4KzY5dy96eW5IWWZDL3hYWTFi?=
 =?utf-8?B?ZHM3d1NwaG5zTmFEM0RDNjRvRFdvL0lndngrbk02dUNMZW9zaGdzUmI0TVpH?=
 =?utf-8?B?VjJ1N0lUaXEvZU5jWXhKeE1SdjJLV2hmZjc2dnNYYU12Y3dIZ3NZREY4TjNa?=
 =?utf-8?B?WkljNW8zaERLZWIzQmZZL2lrL3YwNkYrZXY2U252L25jRjVNdEVWQVU2alR0?=
 =?utf-8?B?OHMyN3o1aFJzbHZEZDhHejNLVCtnQ3ZhOVBoUWorY25iZlVBcW43WUxSMmor?=
 =?utf-8?B?aThmMHpoRnArNWVnbENKY09DVTZ4TktzNU1zZXpRWFRsNU5xbkVvbjFENFli?=
 =?utf-8?B?dnBqdStidmJ2Y016OUF6UVZraldpOXFBTkxOQW92QWVFMlZMeThSVGhGczZK?=
 =?utf-8?B?UnpsUlJXTElXbDRoak16YktDQ2NLbDY0YXA1UThFUVJFNHpTc1JpTjRrZWtR?=
 =?utf-8?B?YWwxdzh5MXVvN1VlQUkvWExpWHB1TDVuRHhaZjJuME92ZmM0QnlNVDVPK1Zq?=
 =?utf-8?B?WEVvenJxNmVVOHcrS0xGRE5sYy92NlplS1U1ZmR6aUxqM0d1SHdvSkZ3b2Z4?=
 =?utf-8?B?aDI0ZExzVXU5Nk1haDFabUlQdmJlUEFwRmFlQVVzOTJHWmc0U0NiZVh5L0lI?=
 =?utf-8?B?Y01acmc2dVhydjhZemlrTWdDSGFkN2Q5eXFSczhBeS9zSzJoSzV2aG40N3FZ?=
 =?utf-8?B?MjRoM2JnOUV1cGtBWWVuZTlXRzJLallVM3BxY20rbFpzd1ZnU3VPd3RjZ25U?=
 =?utf-8?B?c29oQTZkdXZpSzQwVDN3V3M4QS9QZDQrb1hobXhOYlBEWUZQM2Y4YUI3OGE4?=
 =?utf-8?B?U3VaZUVFbkJYc2xnOHF0MmFLLzhFZVFnZVJSYjBidjNxWThWMVdDa1VrYk9M?=
 =?utf-8?B?aVZHMU0wQ2VHQUw3WTZrdG1IU1NiU2QyM2pDUy9rb2hqVXd3Qm5IOHRTaFBH?=
 =?utf-8?B?V1dRRmFwZVpCL3Z1RjVzUjYydDNzM3E4NEZFZ0ZJOEpIeGlOZDVyaGpzSkNj?=
 =?utf-8?B?RmJWbDhrMGl3bEQ0NXpScHEzZWhTdThiaUxHb3ozc3hjTHRGQ0pjc3dYc2Y0?=
 =?utf-8?Q?wW+EHUwq9pQRV+f5qIe5ax2KVDawW1oPzWrLepWC30=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 739a6cbb-2d15-45d7-0be5-08d9d03bbebb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 11:08:47.8077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmsRhZvK0I1v1XyQiCjWanbXbIlVMgxpwBf6DZ5jmxX5rQgsVzQSEH+N/DyGkPj7q28I9RH0XBN96TpJ4esXfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5395
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ard,

On 28/12/2021 14:39, Geert Uytterhoeven wrote:

...

>> As i don't have access to this hardware, I am going to have to rely on
>> someone who does to debug this further. The only alternative is
>> marking CONFIG_VMAP_STACK broken on MACH_EXYNOS but that would be
>> unfortunate.
> 
> Wish I had seen this thread before...
> 
> I've just bisected a resume after s2ram failure on R-Car Gen2 to the same
> commit a1c510d0adc604bb ("ARM: implement support for vmap'ed stacks")
> in arm/for-next.
> 
> Expected output:
> 
>      PM: suspend entry (deep)
>      Filesystems sync: 0.000 seconds
>      Freezing user space processes ... (elapsed 0.010 seconds) done.
>      OOM killer disabled.
>      Freezing remaining freezable tasks ... (elapsed 0.009 seconds) done.
>      Disabling non-boot CPUs ...
> 
> [system suspended, this is also where it hangs on failure]
> 
>      Enabling non-boot CPUs ...
>      CPU1 is up
>      sh-eth ee700000.ethernet eth0: Link is Down
>      Micrel KSZ8041RNLI ee700000.ethernet-ffffffff:01: attached PHY
> driver (mii_bus:phy_addr=ee700000.ethernet-ffffffff:01, irq=193)
>      OOM killer enabled.
>      Restarting tasks ... done.
>      PM: suspend exit
> 
> Both wake-on-LAN and wake-up by gpio-keys fail.
> Nothing interesting in the kernel log, cfr. above.
> 
> Disabling CONFIG_VMAP_STACK fixes the issue for me.
> 
> Just like arch/arm/mach-exynos/ (and others), arch/arm/mach-shmobile/
> has several *.S files related to secondary CPU bringup.


This is also breaking suspend on our 32-bit Tegra platforms. Reverting 
this change on top of -next fixes the problem.

Cheers
Jon

-- 
nvpublic
