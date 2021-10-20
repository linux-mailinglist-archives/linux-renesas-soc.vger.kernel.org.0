Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005B34350CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Oct 2021 18:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhJTQ7S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Oct 2021 12:59:18 -0400
Received: from mail-eopbgr1400093.outbound.protection.outlook.com ([40.107.140.93]:12318
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230134AbhJTQ7R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 12:59:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERS7O961cSe1c2VqF1cWKCpYVciAsqhyeI29YG0akiSj06xu8TYxmdgJj9cCEJlde45fvtZgWW6/6isFaGvBi6wzVYEk37wnmKIYLU7L41H08oHx2RhtK9eA+0tV4xcuogZw+WEB/g1sAJPt/ZmH9Fax4l8v90bf/D0LmgPfPK9DDsSuaT1bWJ10IsSjCLXUkVDguu5nMyH/FnINrbysBlvNfTnfw3kEox87cKAuISuCs1TO7MFQ1PzlHiG/uWI8Ry4WjrNito3yPCFzgzsUKFjsufV1NNAlpqfzw2YDIZh7lfIbgGH25alGAoq/VM1VrrrZlVXr+bXUOzMgY+uRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OkpkOlDVRGl0ejNG/qdUKSRO0VTgMsag7SFNbIvBlc=;
 b=daWq1KmJL3HYXFpxvsTZamKs5/bkqCzfQpKXNf6sAITCZH3/IHkFSkq0te5Ovzz9NBEEAi1RM1LffhehUWH1p/WycG0hONVTn907LagiqLgcALesqSE/6YMitra8il0pUxPafIQUNFLksqUaXt42yMsQn6t5bjQAShheWFWVKt15GzKOSu8HlXJonyvqJC1OVjmT7sLTZfolg4GFRKS8STeoBvcECUuF8SqwYislP6yAwKup7yWz7iwyUyeWBFhGuP/B0ftsBS3R5D7+EGk/mzZdKm5MayAk+pyLHwwzkI3pqYiM/xIUpDiugxvcvDsd+X6a+H1fCUppYjeG6UKC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OkpkOlDVRGl0ejNG/qdUKSRO0VTgMsag7SFNbIvBlc=;
 b=oHOsctGKSvPdSu0RM++brDJx0/b5kcrHhSfmkhlwfRQ0zJ2qIcPw5fYmxjHwU+RsHpzp1v+sINSNHgEynNltn8FUxObo2YgZxZoWY1WtNRl+vkGYTNzOAFJa5v+hMdiyGuRkBfkbcZpGbvySWA8vjf6drj8ZcjLheCCuGhsh25E=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OSBPR01MB4184.jpnprd01.prod.outlook.com (2603:1096:604:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 16:56:58 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e%6]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 16:56:58 +0000
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
 <4f2f81a8-9a79-3211-5ec3-fa679c3e7bb9@renesas.com>
 <CAMuHMdXHkeOK+Bg10BCLDvTztV6+y9+OomBUiTAoa1+GCHRnvw@mail.gmail.com>
In-Reply-To: <CAMuHMdXHkeOK+Bg10BCLDvTztV6+y9+OomBUiTAoa1+GCHRnvw@mail.gmail.com>
From:   Alex Helms <alexander.helms.jy@renesas.com>
Message-ID: <f77449f2-9299-44d6-b49c-b0be687ea20c@renesas.com>
Date:   Wed, 20 Oct 2021 09:56:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:a03:40::45) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
Received: from [132.158.153.76] (68.225.135.226) by BYAPR04CA0032.namprd04.prod.outlook.com (2603:10b6:a03:40::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend Transport; Wed, 20 Oct 2021 16:56:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f0e68ac-1deb-4fbc-f2cc-08d993eaa0f2
X-MS-TrafficTypeDiagnostic: OSBPR01MB4184:
X-Microsoft-Antispam-PRVS: <OSBPR01MB4184A5C070C295A63684766AC8BE9@OSBPR01MB4184.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L10D8aiCpHYnbkqP36wKadnQoOotXrQg4+NAxdjLj15iOnFozxVGzP8d95mH7T3tYuOob+x1g1x0mfHXZj/5bVvzukzM9IDGPr38IVRGHGmML6hCuDi5ehgI2ugmDiSjphswgI9m8fGYmpXY3BjSpGMwfKTWSQyOyFRMZs9bbgJmnnZQG9JEBcE7oLjMkEZwu7u7+Wn8HOPr6sRF+1MOBE94natRW/CoWjQDEeHXgz8QbRBxz18U9zaXGK7MTJnhHQe4wM8hcYiTBGPAbYaeZYIo6NdLMOr2bnDKuBflYsneqCkII7rjVfR+ct4WkCDi4hsrh90iaQsMFDu4e4kih5vqx3ttMQ0n8w9b+MDVsHwgl7+XJ142Me1nxSlckwoLooqK6d1tKppmFIdaYmvmMzZJms7cj8SbcorAyW7O5eIdI+jNE9z9NuHfJ4EztXlzAZt36tX7dygfQztyepc3rJBVr3SIfaBQHtBie//dsgEHpnq66HkSOdOX/HjhGiYos+a07Ge7aO+vpxJ8KDmjxWVFX1RPwb9Ec9m44RoIxaXm8HhqVPmLP7XeTtouziJxi+udMnKTlvpi927n4j5St890DZCwMy/jMPS4/EKm06BvbIAqBLAkceq0icQ18t8yMVDfZIzjzqCNDh6VTAEFpsXrDyczt/RT6lVLjylfToKtd815SWsLS0e2ie5nIJF+kqJBf9ehPvXxzdjbQVlx3yJpoqj8A0CUIBFHx0cjKnnTY947soos6iBYAao6tOWAf6aihqgprbt7q9IgCbWkgSwSXGNTv3ZwUYtqlU99Zls=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(31696002)(36756003)(31686004)(7416002)(316002)(6486002)(8936002)(66476007)(6666004)(38100700002)(66556008)(956004)(38350700002)(83380400001)(186003)(16576012)(6706004)(2616005)(26005)(66946007)(5660300002)(6916009)(2906002)(53546011)(4326008)(508600001)(8676002)(52116002)(86362001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emVoZ3dpY2pMZ21GUXhNM1ZxZEU4VHNqWE9VdHVlVDY3VEp3c1Z6ejJJNFlP?=
 =?utf-8?B?WVozMXJyMUROck5SOGRtcWhSQkhqVkQyNTBCWjd6SVAyVml3VDZpdUNkamNr?=
 =?utf-8?B?a2RtSDdHbTBsRzF4c0ZMWkVmbkcwM0dTYlZFZnhON01kQkZLZVpOWlk4MVFU?=
 =?utf-8?B?aHhaalZ5YkJIZmxLeVVlQURzTlhDNDlCRDJLZTZJNE5WbVROalVpeXJQYWFi?=
 =?utf-8?B?WGZhdlFzamZDWnNCSFBrSlNTQUZGMkhOZFJ1aVNlaHByZnFldzZFeEhiTHQ2?=
 =?utf-8?B?bW85bElNOElpbnpUNUVTSVVmODFHdDRqUnNEd3RRMUExdUtmV1BHNmY4ZkZW?=
 =?utf-8?B?OXo0WWpwdlEvd3lvSllJc0tTa0Z2ZGxNbkNjTjhwamZ5V3pjT2pIWWR6a2hC?=
 =?utf-8?B?RXBFd3NPUHVPM2J3VU01M1RhOHBWdlFWLys1WGhxN0s5bEI1c2I0bEVXR3po?=
 =?utf-8?B?TCsxTWhRYjJGT2NVdVJYblBBRHdRTWtIQlZOUDB3bmM3aGFYNU5odUl2VG42?=
 =?utf-8?B?c3ZJdW5Oa0dCczRkUlEvekVnNWNxV0V5b1djem5OcWhMVVU5LytFOFl1RjNB?=
 =?utf-8?B?TytqZkYrSzU5RnJuSXBFMDFzbDhjcXRJb3NwQ1ZlQldKOWx5QklzL1NlbGVT?=
 =?utf-8?B?dE9sOUhSL2pIeUx0N3ZNb2RxRDk2VW01blMyTnlXL2htTXFDYlcxWnowQjZJ?=
 =?utf-8?B?TU1IV2NZN2x5Rlh6dUJDY25XZWFvSGRIdU9nRTJKclJOQVR2Snp5T2g4elk4?=
 =?utf-8?B?a0tRQkR4WTZLQ1JnZE1NTGFlRXA4S3d0blR1eU1lcEwrVHNnZUJlcEUyNEU3?=
 =?utf-8?B?Vmw4VHlwQnI0eUFKTnB3Tk9sT3B2NThJQ2FlRWFwM1pFTFF4Z29VOUhwSVNB?=
 =?utf-8?B?WTdxZXhVY25PZllqa1FrVHhUZlB3NzZoQXdBaGtHNGVpRUhzczh0T3ZCOUR5?=
 =?utf-8?B?Szd0UmF5SC9FZGV2K2RQU1Y0MGFobW10NjlDSXBXdHdZcE9JaFRiRDlwU0dL?=
 =?utf-8?B?RjRXTzNyYzlUeXlUL1BWS085bUNpeEt4Lzg2R0dpY3plbWE1a2dwUXZ4bHBr?=
 =?utf-8?B?Znl5V2gwbjNweTQzL0JIVnZvcmR0a2owOEhNTnBIZlNxUFV6WXduTEh6NmdT?=
 =?utf-8?B?OVhSVFJPVHdaVjJ6Tk9kT3prbkc4Ui9NZEpvUDBHMit5WlAzd24zakJGRGcx?=
 =?utf-8?B?UW16STJUL09DNXB1cUNyNmR2dzVzU1pCek1DbzJuaS9ERHpoM1V5MzQ4NGxX?=
 =?utf-8?B?UkpnZkphdVUxektQNmxWNDJ3UGVIMENkYnpSUWZiaEpaK01tSUVIOTZETm54?=
 =?utf-8?B?cDdpcGN2aTBSNnZUdWF4R01GSTZDS1U1VW1MakJvcllScGxGZlJHUjNTU0pY?=
 =?utf-8?B?MkMzZlVpeEt0UCt1TlIyVG5hQk4rRGJwa0R5bE4veThza1dpTE9ydEVtL3dl?=
 =?utf-8?B?eXFPQy9YMlkwK2JvRGZFTzh4Z3dxelc2aUJzTUxpeXJkbDJYSHgvZmNpT1dE?=
 =?utf-8?B?enhSRVBYbjB1c2g1VURiTXJhUUdYUWlzcVhiTFBNQWJLYVVwZ3pEZW9WaTdM?=
 =?utf-8?B?WGJCZ2dLNkpjbmZoQ2YwaGJGa29PYkVEZ3ZEM2hrUmRFZCtCR1EzS20zNjNx?=
 =?utf-8?B?N1JUeWd6b3FOL25qRDU5eUpzcGhsRGpERlZ0RnNCaFpXdUZER2I4T2FJNHp3?=
 =?utf-8?B?TzFLa285RE93Qnp3R3JsWG84V2x1ZFIzNzZIUFZoVEMzd1dxZkM1TVJHZUk1?=
 =?utf-8?Q?LBIMvVtJH+Gl1Rg9ytc1Qn33VYC+olz1YENKgcs?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0e68ac-1deb-4fbc-f2cc-08d993eaa0f2
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 16:56:58.3541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhlYk+JiKQD6cUyLIKIjN9FwKKnyw/xogYctA51vhaSIrRDB4w1HRBcUH8u1O1kjDpWRPq3jkfD+rWP3+AkWxQiLjTLMQcvI/eSBf8OKBg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4184
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 10/20/2021 1:20 AM, Geert Uytterhoeven wrote:
> Hi Alex,
> 
> On Tue, Oct 19, 2021 at 11:53 PM Alex Helms
> <alexander.helms.jy@renesas.com> wrote:
>> On 10/14/2021 5:16 AM, Geert Uytterhoeven wrote:
>>> On Wed, Oct 13, 2021 at 8:02 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>> On Mon, Sep 13, 2021 at 7:05 PM Alex Helms
>>>> <alexander.helms.jy@renesas.com> wrote:
>>>>> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
>>>>> The 8T49N241 accepts up to two differential or single-ended input clocks
>>>>> and a fundamental-mode crystal input. The internal PLL can lock to either
>>>>> of the input reference clocks or to the crystal to behave as a frequency
>>>>> synthesizer.
>>>>>
>>>>> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>
>>>> Thanks for your patch!
>>>>
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
>>>
>>>> BTW, do you plan to add interrupt and/or GPIO support later?
>>>
>>> To clarify, and I really meant to add:
>>>
>>>   interrupts:
>>>     maxItems: 1
>>>
>>> to the bindings now, and GPIO-related properties and subnodes later.
>>
>> Any additional features such as interrupts and GPIO properties would only be added if there is customer demand for such features. Since there is no interrupt support, does the "interrupts" item still need to be added to the yaml?
> 
> DT describes hardware, not software policy (or limitations of the driver).
> 
> Arguably that applies to both interrupts and GPIOs, but the latter is
> more complex to describe, while the former is a simple "interrupts"
> property.  It's not uncommon for board components to have their
> interrupt line wired to an SoC, even if the driver doesn't use it.

I understand what you are describing but I don't understand how it is relevant for this device. The device is a clock generator on the i2c bus. It has a few GPIOs that can be configured as outputs for specific events like loss of lock or loss of signal, but I don't understand why that matters. 8t49n241 is similar to the existing dt and driver silabs,si5351 which does not define any interrupts. In fact it seems their dt describes both hardware and software policy because it uses custom dt keywords for changing driver behavior such as "silabs,pll-source" or "silabs,drive-strength". So looking at other examples of similar drivers, I don't understand why the 8t49n241 driver needs to define an interrupt.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

-Alex
