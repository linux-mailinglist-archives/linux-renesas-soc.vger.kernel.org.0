Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD804340D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Oct 2021 23:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhJSVzj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Oct 2021 17:55:39 -0400
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:51392
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229483AbhJSVzh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 17:55:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtFUvdpKjJFePJi0MdIokgqxEfZMV8m+7PU7DcjmAbjahuaDYKrAYdFhNon5u3I8FGMqKj3PjAY7dBleminOsNeiYKTmVdX43Yn8oq80gK38fqN/oTVRm9Z0GS4ycDLPAQVDQR9C+V9hsuLadn4HhMS7j/XAhe9rghfqPIMEREhpob8Z6z/wxV0m5rmK1Vc+fJkbakPHLWTnVPj/r7oX+ivCZx1LHxFo/SaYTYalz9uADp0KqrNduGcvHHTIOPXgfFeQStGsjjsMINOLcrnVQyWdXIK9oZ7vqOPdDVKLf0KQSH8nDQDDny69eaI4SNVIjzrA5QIe2I9yFoOMXsXDRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzFXG1T6orTp+pjxL1Yp8FVOkJRPEOYi7oVlDZzbL4A=;
 b=jksdefLxK5oNVWX/mWXctbSGrfMi80kengCl5S73XsCdl7GFKqIIK9XBJ4RoWHV9b8ZM09jXzemoWFSzYffOzqZYHAhpJeufVewBlb8XSboz8Op6nDeJvrsC0npJs+D9nDelKTvi0LDcw9MJK86mmdACNxOP0rQEBCBx39jhgvGJ//37Q32ui1CXsF+eUOSLdC8m4k35pvnf1dr9LuGk4/CkMpqanfaJhULZvjd7pGO8vZrwzrkkW4Z6Z6UAKPaRk00IZNBUhI1ZE3nQ8v6B0j8zTGcJfalFg/gMxOjHUlHMPl2ytyZqJGh9mhF3bIE8PFux/W1acZ1UtlyLWqf0DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzFXG1T6orTp+pjxL1Yp8FVOkJRPEOYi7oVlDZzbL4A=;
 b=hguXBbchwz7E9idF7FFdjJ8XNhNiOV1WE7i2bocxR3CSOROz4fyU9386zPfo0ywswkYqY0A2a7yFhaWnotuJkkWlz7niNsY5sdF2w03EjBYMIYSdqh+YFXhGT2wiKJ4q+x6netSmL0AFlL6oLYaB6wHWdQbiOpHHvGCTBWzQcxY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (20.178.102.215) by
 OSAPR01MB4450.jpnprd01.prod.outlook.com (20.179.176.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 21:53:21 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e%6]) with mapi id 15.20.4628.016; Tue, 19 Oct 2021
 21:53:18 +0000
Subject: Re: [PATCH v6 1/2] dt-bindings: Add binding for Renesas 8T49N241
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        david.cater.jc@renesas.com, Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>
References: <20210913170436.243-1-alexander.helms.jy@renesas.com>
 <20210913170436.243-2-alexander.helms.jy@renesas.com>
 <CAMuHMdWZp=7sR+dTL0F8o61weLqqC3k1kkemm_PktvyK8+ONmw@mail.gmail.com>
 <CAMuHMdXq2NyBf539raFJSoWSGXnwxOAMWcVB_WV-=uf+kOs7rw@mail.gmail.com>
In-Reply-To: <CAMuHMdXq2NyBf539raFJSoWSGXnwxOAMWcVB_WV-=uf+kOs7rw@mail.gmail.com>
From:   Alex Helms <alexander.helms.jy@renesas.com>
Message-ID: <4f2f81a8-9a79-3211-5ec3-fa679c3e7bb9@renesas.com>
Date:   Tue, 19 Oct 2021 14:52:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:a03:255::19) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
Received: from [132.158.153.83] (68.225.135.226) by BY3PR10CA0014.namprd10.prod.outlook.com (2603:10b6:a03:255::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 21:53:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e903e2ae-33a0-4fd2-67aa-08d9934adc39
X-MS-TrafficTypeDiagnostic: OSAPR01MB4450:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OSAPR01MB445004645FD4D1DEE91BA74AC8BD9@OSAPR01MB4450.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RvK0ZYp0yCoTmBRZIuQtyaO8Gld7YJn3/FIwOwD1YJCVxosXMMpEK6Om8Gjn86esCJef/X1s8IaRCr+JYQWP1aesJcN4fF4UeH/4H8Tzkre4jHgkelgz0w5vx9wXUJ2ZIct2BUn/aaL2+xCbUEiC9gAxbHKMK0rbKrX/tyvoTk4i5xopRN/eVEZT6Gp9EsxNGTunxxgHvt5aVLxKuqdKtluXmFTAXpaovYuwchZ8yoq9BdKiwYA4FvK2y+QfHYmWdBR7TVZhNZy5pGIfdLftbMe6NzIFQc9LguWBQXX72tdLYnRsTosDThVnKSFEpyAAkG7AomYw87ZAplFEMkTQFNC/Zr3SBxs2VVEMuKu8duCEnX7QeBcF62+Qrbkr3G9aWmYEiPPwkdsC67yx/rogO36LxyAQ12+u/8zVjrejcG4Gy8AJyRXnKREpw+aCQNp3CZqBiKqSwtFVNfbbsafXYKM/Gbm0x7plZXMj668ghFphM7voMhvd/Ppk/o4llb/y6T2JbKNf6rNMxsVyL5GadQ0EorWFmvokNDpk8WYSnuT4QmIhv7d4LwfWsScRML2dbAzs3YFM5k8t5gvt//4AXOS1QbO/kS6Nz7SHC1Kft5jhp5RP0Y2t5a8qS7ujlKj9pkvxrlIwyHxA2OnZrWumiBNaB3MTF/AjDjyopVz6EKY2QZ1fjkIrfpCTj8RNSqt2yZA0lXke3vwWyTNCWY42IKSqJV6bM8lLOKD71K5Tqltm7WhpEzZtvPWWuU9hFDvJscS7//OX9jKW4i6Vp1Kdfz4OSX2q1ztFCmLswiLVDeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(83380400001)(16576012)(66476007)(8676002)(6706004)(66556008)(38350700002)(6666004)(38100700002)(36756003)(86362001)(316002)(52116002)(956004)(508600001)(31696002)(8936002)(6486002)(31686004)(186003)(6916009)(26005)(2906002)(2616005)(7416002)(53546011)(54906003)(4326008)(66946007)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V01UdVVJdVI4VjRVbUdFMGYvV2liTFl3N1pYMmNwRTNjSkNjREVnZE9UdWtU?=
 =?utf-8?B?dkRLckVkSE81a2tGZExvK1lmRmJ5MUJOemg0RlVaM1NLV1BoSndvTUdIOXJQ?=
 =?utf-8?B?Z2ZUc3MrYW1SaytaNFhVTmdwRk9qYS9TQ2hmQjhPSWpnQ0Zhd3ZmMnd1M1VQ?=
 =?utf-8?B?RStGdTRETnJyZ2NWTEVDcHluSkVZbmtFS0NzNEl1WW1haEpra2Vxc1hGZ0dZ?=
 =?utf-8?B?aldKTzR3b052QTU3eTR3UFVma2R0WWVlcS9CVWhOc1NCSGJzbWQxS2Z4WW1O?=
 =?utf-8?B?SzUvNTI0WFdoSUF2Q1hFZnp0VlRhY2k2d1BaekJBcWpiMDNlOVJBR3NOMmNS?=
 =?utf-8?B?cG9YSDVZNWNPa0RTZFpUN3NqbEtlQ1FsbnQ4Wit2M2ZTdUQxekxVc3YwMVVS?=
 =?utf-8?B?b25UUnJ6SDRlL3lTbzQ4VEs4cVVUODlPenhvaGdabUpEVjhOWHhUTkE4MWZD?=
 =?utf-8?B?a0FEcXZuS2Q4em0vQWF2Nkd0MHZENEh5ajhJU3M1NFZJNUdESUhiZzM2K3Jk?=
 =?utf-8?B?ZzJhNjhpanBUUkNRNXRMU0NBUHBUUCtHTG9KQmdSOElIdTlxTTE4Uk9FYU52?=
 =?utf-8?B?Qll2SUdGRnFmazY3YVZYVXp0SEJyWW5JdlhMWDNLMVVjM2JYR2N2RXV3TjFU?=
 =?utf-8?B?M21HUUNKa3paSysrb1NTNEN0cmsxSG1hTDg3RlNHRFFDbDh5UERxVlRaMkxy?=
 =?utf-8?B?bFBFRnV6bGhXMWlHWlg1K3NCbXB4bU9TbEF2VVJiOUxvZnMzazlaY1RFNW5G?=
 =?utf-8?B?ZkI3ZlJwY3EyUG44bXVBalVhZENsS29LL3hra2l2UThsME12MEd1ZCtMY2xn?=
 =?utf-8?B?ZWlGdm51RlNkVytJbHNuUy9CVGNPNUhvZjFMb25kbkZFSjJRaVNiVlhEcGxG?=
 =?utf-8?B?dXZQZjNuT1RVN0tzeDVCRVBxSWgvQ29jYitoZzcyRks1NU1PbWVJSFpjNmpG?=
 =?utf-8?B?UGpEd3FyTnV1ajY1NGhoL3VNdjFTcjF6Uld3N3lHRmFJdi9YL2RDbm81OWJZ?=
 =?utf-8?B?OFZrVVlNK0hoekZseE5Uc3NQZVZtN3ZzdTdOeHh3cXhkMzA1R01LcFVuU2tp?=
 =?utf-8?B?VG43am1xSTZrZE00b0ttZG5BSzdGSHVEVmNBZWlaT0cybFRobTZzd0FRdWVZ?=
 =?utf-8?B?Z1lXLzJ3YXo3QW5uU1hUSGt1M2ZOWTZZUndlRmQrVTYxRWtuV3E2dVFqWFBS?=
 =?utf-8?B?bm9INUt1SG94akc3TGVzRjREQS85RVIwZ2tRSk1wbjZrV3ZpQmVMSEo4Zjk2?=
 =?utf-8?B?V0l0ZXJ3cEZ3NUpZRnlpS1dwN2pjRDN4QnJOT3ppWDY0bkFiKzFWN0d6dVJS?=
 =?utf-8?B?TG1rQWpjZlZZcnNkZlJzY2hoUzBGcjZsbVNXM0RsaldBQWF6WEJVN3Nram1k?=
 =?utf-8?B?MjB1dmczaEhqbXQ3WW94QktZdmVnOEVJMk00bmZCcjFyK1dxb0U0NHB0Mmc0?=
 =?utf-8?B?aFYweWdnL0R4V1gya1N1QnhabUxJTEtJSWhySTd3OHZabDV0byswc1BnazhP?=
 =?utf-8?B?bi9JNFN3b0xuTG9uV2ZpVXA1a2pYNWZ4U0Z6TUljVXB2TmcvN0ZKWXZRQTRQ?=
 =?utf-8?B?Zk5UU3BkZnZCT0tGbWI3cDJCdWJIemlQam5kYXFleDFSOVA5RURKUVdCOWZY?=
 =?utf-8?B?RlF5SkFsSngveFVaYndGK2hzZVFxU3BMSlJWUytJNnZEZ0E3cEliVk5tcWts?=
 =?utf-8?B?ZDcrUU5Ia0JsVGRjb0lxZEtYclpaSGZhWXRnckhadTNVcm8reVB4QlhBVlJh?=
 =?utf-8?Q?LgMxl1Opo5vXT9LMF9m8EeXMAgBKgb8YAz4wroz?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e903e2ae-33a0-4fd2-67aa-08d9934adc39
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 21:53:18.3816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2C5EIhxzNzyHhJ79zpw+qDBWkBO99oIOC6h9V4KYIyzz20ym67rlSbrxEgTU624zIzI23XxwEi0K9J8eh8XlWjjuTJHg3YrvPN+CAjYurpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4450
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/14/2021 5:16 AM, Geert Uytterhoeven wrote:
> Hi Alex,
> 
> On Wed, Oct 13, 2021 at 8:02 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Mon, Sep 13, 2021 at 7:05 PM Alex Helms
>> <alexander.helms.jy@renesas.com> wrote:
>>> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
>>> The 8T49N241 accepts up to two differential or single-ended input clocks
>>> and a fundamental-mode crystal input. The internal PLL can lock to either
>>> of the input reference clocks or to the crystal to behave as a frequency
>>> synthesizer.
>>>
>>> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> Thanks for your patch!
>>
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> 
>> BTW, do you plan to add interrupt and/or GPIO support later?
> 
> To clarify, and I really meant to add:
> 
>   interrupts:
>     maxItems: 1
> 
> to the bindings now, and GPIO-related properties and subnodes later.

Any additional features such as interrupts and GPIO properties would only be added if there is customer demand for such features. Since there is no interrupt support, does the "interrupts" item still need to be added to the yaml?

-Alex

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

