Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 973D13C626B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 20:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234933AbhGLSNh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 14:13:37 -0400
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:27424
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230477AbhGLSNh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 14:13:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juu3xBorubXl/6cr/0k+vMd8cDDB2sREijlBBxCk98LQF5ZC54fo0P+/8FyJILC7B4slOJxTvBr2jvesvDTQyY2QUzAI3P4nTrTFJMkM+++yZQ91irRWo6fwgxiFuOGeC+yxMo0zwGUDFpC4mI74kyEBW5sAmC1Ju0CvpuRpBUWhv8HL6NvcndDs/Aa0qk8BnTfNh7/8trKi2PTyNZQD9VVFKSpuCq3K+Fb+NaBC5JW8PVjdULs5Clcx/2GIhzRxOydPxJf+OaYSySUiqVvgOv/odQXEKWyakxjb4Wx4wGCHZ6Uatlmrh/CYe2XbBHewp4imqXnvRs2m3rt4jfdf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9dcgJ1zIMFpaVnqxq7Dc5o2BTfs+pbwHay6Q0wj1B0=;
 b=guwhmecA0x2OsLKGMujECsefhtQCKjXJqOwP6fKZhx5VWukvOfYV8kVNgYh5DpTaj6j4RSk1flVGHsuzDZNWjpqG0X1+nyOX3T7uqamplGuaIZ1qaSOzGNArWFAiT5JKvAt54SbJyZzfjDhwDmYo8duKMpJrj0eRYq4kyU+eklR5X7umYs1NCz0+CWb3J21MfJRxpFLGkeVnamxaTkrGro/eVPlJTMq5unhFHpu3ULub2N5S2wwG1tx0MA5pHu8rJLipfcIzIgLRy/N/JXoCoOlSGHTpUIWwMB+xWoVPQCquSwesWfA2LhYIIuBQ4EMPZSPlbLqx1Xzy+BQ2nc5R8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9dcgJ1zIMFpaVnqxq7Dc5o2BTfs+pbwHay6Q0wj1B0=;
 b=QPgoS2L4TH+kesJQ9YW2pFxkuzPoamIf+Xsv35PAt64CZ86I5fllu21BeXmo5gqn2Y1XTgE9ZGdKpplpUyyfQyzxAmiGM2JCXZMwgP8S4PlWLafysfpoljxWEdKnGijWMhsPppl4m3HRUufHCyUbWGlKERxQQ7FCQLGfPX61laI=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OS0PR01MB5441.jpnprd01.prod.outlook.com (2603:1096:604:a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Mon, 12 Jul
 2021 18:10:45 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4%7]) with mapi id 15.20.4308.027; Mon, 12 Jul 2021
 18:10:44 +0000
Subject: Re: [PATCH v3 1/2] dt-bindings: Add binding for Renesas 8T49N241
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, geert+renesas@glider.be,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
References: <20210707182659.20548-1-alexander.helms.jy@renesas.com>
 <20210707182659.20548-2-alexander.helms.jy@renesas.com>
 <20210712162816.GA2050345@robh.at.kernel.org>
In-Reply-To: <20210712162816.GA2050345@robh.at.kernel.org>
From:   Alex Helms <alexander.helms.jy@renesas.com>
Message-ID: <7f519cb8-68ca-bee7-2c21-06d6ec5e5b68@renesas.com>
Date:   Mon, 12 Jul 2021 11:10:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::12) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [132.158.153.85] (68.225.135.226) by SJ0PR03CA0127.namprd03.prod.outlook.com (2603:10b6:a03:33c::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend Transport; Mon, 12 Jul 2021 18:10:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 967e4d0f-af82-46da-0bb3-08d945605dac
X-MS-TrafficTypeDiagnostic: OS0PR01MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OS0PR01MB54416933EA6CDDAA242E7D9FC8159@OS0PR01MB5441.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rRzEhxie3l6yIdEhmxsQW1zqViTKfiBT886UAauuDufJHwkWMeyjyxUSPC2ycj8qXXmjEfbsK7AFuEcs8jiJPoc3321xFQ+tTCDyySqUyHJJ8ixv1DgkALBiS4qiyg789Cx5Ufx0+AwZC7EjTN68p91pfx29ks6A5DI1otMAz67UbV1PKnOk6UTpo6GbkhFjHNjfd8iJZy2rGuLF8kUOJtOW3vniCeSlpCpsi2fiYifxKlUDKmE5EnjiNa2VV1Ot21StXHIoE97x0WBsWEUhu8zjCEdDyOpXgxyzW8wZwuHB1n1086wQvGC1ekUNr3U/fmEMz7q8FNPjbOfmONvPoUpX4kXBPNF574pHB8+V9p6VS1Ztani1AWydPWtoRDCra/6vglXO8CHz4k9FMHaLl256i1RKiJATuy3JDUpNM3NLchV6efJE37RXrc4rhI+ju+BGKVWnECBg0m8OQXXKm5xnR5owYg+nN8rZTIAcfAwWs0I8YhHkG6LYnsqD7TDPwD7LP/H1skX66C/tNosulzjarfCf0yDY3QRp2dXHJTv9M7jn9TnMiRLzeYqawneRhuFSkLjS5kTnZX+5acq8L88DeE9RGjeIAXGQkFW5WsnCDixMQ0U8dl1McLIsTaZ6CKQlyOmDOM7J/TzE5rxI+U83Aq9IuDd/iR3LdVcuDr49W+1+JlmzKEL1TgHP1fZprwu+Lm/6S1OKlJBlHz9u48+gjFEtY5g3VdeOU07Ared4LiLw+fVf0TdAOaxvj08R7M5hB1C9lIfQ5i9I5P+tXqmLXgxTEETWzPcwSlyvvfje1irApF4cncMaMdQK4CTNSg0gTnereBalpWuIdAvUQNW/vAy33sTt97nYx+Ie605ddZaagntvr2LmrykeGzFoXWYB9rluf6FOFIalGnuIcd1OjNmhRQky7x4sSpAboSl8rYNKXFrvZ875ClA3fzkk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(366004)(376002)(396003)(8676002)(83380400001)(2616005)(956004)(66476007)(2906002)(4326008)(66556008)(86362001)(45080400002)(478600001)(38100700002)(966005)(26005)(16576012)(53546011)(31696002)(6706004)(6486002)(316002)(6916009)(31686004)(8936002)(38350700002)(66946007)(186003)(52116002)(36756003)(5660300002)(6666004)(78286007)(45980500001)(43740500002)(505234006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1dwaHhGb2pWd0MxRTgxdUxRUHp6SGtSSWZuRXlDWC8rMVBydTBIZ05vRVE5?=
 =?utf-8?B?R29lRWlYeHdXWVk3SWRYanZqUHNaK3ExZkVrcWRjMGtkSzFOaFpwWnpBa1N2?=
 =?utf-8?B?R1dLMHAxSzNIZHpHMEdEdUZhOU1RUTM0ckI0TkdEdlJxNTg5OEZLaFBvMi85?=
 =?utf-8?B?UFN0NlA4b1I0d2dpSE9xWWtVdUNoM3hHS04wdjBjdnFMdXR6Y2pINjJ4amhM?=
 =?utf-8?B?bGszWkRFRXVqTkIrWk9jVlFvRmNxMU0wMndtcS9vQUVWajZMY3NuVi9uRWUv?=
 =?utf-8?B?bFZPNFVwWEFMZjl0WGEwaEUyV3U2aGdyNndJUjZHWFQ5ZWZWeUZKS3BaMFVp?=
 =?utf-8?B?R3R6cWNJYWhpeC9SbkpXMkozOUJWc04wQW9lNENZb3EwSUo5UjVVZ0piVHND?=
 =?utf-8?B?eVF5S01NVGdRZjRNa0FaUTg0VjZZVnR3SzNnQkFycG9CU1V3emc4VVBta21E?=
 =?utf-8?B?UEs1SStUVnlpbGV1ZmczL2dvaFRvRUpwb3l5SVV0M1h3K1F5R1hqZjVUOWNl?=
 =?utf-8?B?dnI1SVhBMVpHOU4wVUdtT01yLzFuTUM1SjRoUFRjTGtUR2EyY0I0cDVFZnJu?=
 =?utf-8?B?bWprb0I2WE11Nm9nSzdUSU9aN0ZDdlhPbHFVWnFaMjBZODEydXphOWdVTS9n?=
 =?utf-8?B?dk5ZcENHOUJEbVdoTDJFSG5jRktGQlhhbUE4ajVLaTdYc3BJNDFhNDBaUDNL?=
 =?utf-8?B?T1Z6Vmc2UmlwemVQb2xyZ0hTSmxQL3BzT055RSt5b0VscWhXTTZ5TTdLcE9a?=
 =?utf-8?B?bmNCQnJoY01sYjk1Zk1hVmY0RXdqYUNLY25GTkovanJZWnF0RnlhTnJwTEo1?=
 =?utf-8?B?NklsMXpCVUlBaXFHMmdSTU5uK0RtRnNycUlTUE9VMGJpY0VuSi9pSjNHTUVT?=
 =?utf-8?B?ZmxTakNVSnZMSklra3VSaGkzbFlGSXRJU0U2ZS9WMGN3aFpXU3pHRVo1dmFQ?=
 =?utf-8?B?ZGZMR0hvdzJ5QzZ5eCsyRW9CS05QZisxRk9oWFh1K29YMVViVlZ3WEY4STRC?=
 =?utf-8?B?QjJmZkVmMjZRb0ZncTZxcE5FOXkxN2tEVUNhN2ZPSGM2NlRWK2ZVUnU1MEFR?=
 =?utf-8?B?R1IvY3YxSmVuc2RHZ2x4UGtGbTdXUEhwL0lYSUNIKzBGYmRLZGxvTXM2UnVx?=
 =?utf-8?B?eTVsL0RzM2R6T1dhYnV3ZGRJamw1enRJamM5WmxnWVJvWDk2RmR0L3NZYzRz?=
 =?utf-8?B?UHBkYjBxWjRYQ2I2TFBKVjkvR09IV0ViRWE3MWZETlFEY3BwbzlUT1ovV3JH?=
 =?utf-8?B?NjZndnZVbUY5VkZXVnNZZ2hnYTFaU21oemtrUnNRWDllUE1ENjJWcS9LekR0?=
 =?utf-8?B?d21XYjlsZUtpd01keUgxejZ1S3JmLzBHZjk2MDYxdW5hYUFOOURIWUFyZzFr?=
 =?utf-8?B?TmNLM0YyakN1alNzL1QybU04TFE0SWRVQU4yb1d5cUw1RGlHNWhxamc0d3Bh?=
 =?utf-8?B?N0d0eGEzSm5uVFVTT2lFa1pLUWZVOTdkWHljWUpqbjU5QUVnV3hHR1FYdkZU?=
 =?utf-8?B?UTVETEh0SjROS0Z6MjRPYTlHOEhlb0wvVEkwRVc0MjRYcUlwOElPSzlYeGVP?=
 =?utf-8?B?Q0tXclBWT3Rzd1ZZQ0M0Q3lKdjBRbmxKc1VoVUVyS0F3RW9wQ3c4dk9UMlYv?=
 =?utf-8?B?eFN5c2NCQ21YUzJmdEpOTGlDcDR2czBMamRVUWh4SC9mK1ZYaGduQlluYlpC?=
 =?utf-8?B?cXZ3TGtodkVuSFd2YzdaaEhVT3YzTE5DQVA3bmh3L1BHempUQ01WbWo4OFNw?=
 =?utf-8?Q?4Pw3/nkUTgaQnS9PEyHh3b29E+cvG78M8Q9s2Q0?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967e4d0f-af82-46da-0bb3-08d945605dac
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 18:10:44.2108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2V2bjzBdj9YVG3Ib0tFvBKiM6lquZZsT96gm0ZrFAvMHH7G7ruGHmAtiirdCydkvc2lril+nQLWIQ6d3/kCFvDBpht/aRWzaidvJv5ydyr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5441
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 7/12/2021 9:28 AM, Rob Herring wrote:
> On Wed, Jul 07, 2021 at 11:26:58AM -0700, Alex Helms wrote:
>> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
>> The 8T49N241 accepts up to two differential or single-ended input clocks
>> and a fundamental-mode crystal input. The internal PLL can lock to either
>> of the input reference clocks or to the crystal to behave as a frequency
>> synthesizer.
>>
>> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
>> ---
>>  .../bindings/clock/renesas,8t49n241.yaml      | 188 ++++++++++++++++++
>>  MAINTAINERS                                   |   6 +
>>  2 files changed, 194 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
>> new file mode 100644
>> index 000000000..4e26b3f11
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
>> @@ -0,0 +1,188 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fclock%2Frenesas%2C8t49n241.yaml%23&amp;data=04%7C01%7Calexander.helms.jy%40renesas.com%7Cb047bd6bed2448f744e708d945521084%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C1%7C637617041032675498%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=RYKX4RbZlT0YS3ka1oZ79%2BFTvUKtLUoEFkqMG6hLjYE%3D&amp;reserved=0
>> +$schema: https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Calexander.helms.jy%40renesas.com%7Cb047bd6bed2448f744e708d945521084%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C1%7C637617041032675498%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=qG%2F%2Bc%2BiaSBDT0pIP%2Bvk7jjplus1UZJrehllaRtsDGKI%3D&amp;reserved=0
>> +
>> +title: Binding for Renesas 8T49N241 Universal Frequency Translator
>> +
>> +description: |
>> +  The 8T49N241 has one fractional-feedback PLL that can be used as a
>> +  jitter attenuator and frequency translator. It is equipped with one
>> +  integer and three fractional output dividers, allowing the generation
>> +  of up to four different output frequencies, ranging from 8kHz to 1GHz.
>> +  These frequencies are completely independent of each other, the input
>> +  reference frequencies and the crystal reference frequency. The device
>> +  places virtually no constraints on input to output frequency conversion,
>> +  supporting all FEC rates, including the new revision of ITU-T
>> +  Recommendation G.709 (2009), most with 0ppm conversion error.
>> +  The outputs may select among LVPECL, LVDS, HCSL or LVCMOS output levels.
>> +
>> +  The driver can read a full register map from the DT, and will use that
>> +  register map to initialize the attached part (via I2C) when the system
>> +  boots. Any configuration not supported by the common clock framework
>> +  must be done via the full register map, including optimized settings.
>> +
>> +  The 8T49N241 accepts up to two differential or single-ended input clocks
>> +  and a fundamental-mode crystal input. The internal PLL can lock to either
>> +  of the input reference clocks or just to the crystal to behave as a
>> +  frequency synthesizer. The PLL can use the second input for redundant
>> +  backup of the primary input reference, but in this case, both input clock
>> +  references must be related in frequency.
>> +
>> +  All outputs are currently assumed to be LVDS, unless overridden in the
>> +  full register map in the DT.
>> +
>> +maintainers:
>> +  - Alex Helms <alexander.helms.jy@renesas.com>
>> +  - David Cater <david.cater.jc@renesas.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - 8t49n241
> 
> Needs a vendor prefix.
> 

Will fix in next patch version.

>> +
>> +  reg:
>> +    description: I2C device address
>> +    enum: [ 0x7c, 0x6c, 0x7d, 0x6d, 0x7e, 0x6e, 0x7f, 0x6f ]
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  clock-names:
>> +    description: Name of the input clock
> 
> Drop. That's every 'clock-names'.
> 

Will remove in next patch version.

>> +    minItems: 1
>> +    maxItems: 3
>> +    items:
>> +      enum: [ input-xtal, input-clk0, input-clk1 ]
> 
> 'input-' is redundant.
> 

Will remove in next patch version.

>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  settings:
>> +    description: Optional, list of space separated ASCII numbers in hex.
> 
> Huh?
> 
>> +      This list is the entire register map of the product and must contain
>> +      791 items.
> 
> What is this for?
> 
> Seems suspect, but would need a vendor prefix and type at a minimum.
> 

The description could be better, I'll improve it in the next patch version.
More info about it is in the main description for the device tree at the
top of the schema. The user can provide the entire register map to be
written to the device during initialization. This provides the user a way
to fully customize the device without limitations. This is typically used
by users who have spent time optimizing the device for performance and
want to use those exact settings.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    /* 25MHz reference clock */
>> +    input_clk0: input_clk0 {
>> +      compatible = "fixed-clock";
>> +      #clock-cells = <0>;
>> +      clock-frequency = <25000000>;
>> +    };
>> +
>> +    i2c@0 {
>> +        reg = <0x0 0x100>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        renesas8t49n241_1: clock-generator@6c {
>> +            compatible = "renesas,8t49n241";
>> +            reg = <0x6c>;
>> +            #clock-cells = <1>;
>> +
>> +            clocks = <&input_clk0>;
>> +            clock-names = "input-clk0";
>> +        };
>> +    };
>> +
>> +    /* Consumer referencing the 8T49N241 Q1 */
>> +    consumer {
>> +        /* ... */
>> +        clocks = <&renesas8t49n241_1 1>;
>> +        /* ... */
>> +    };
>> +  - |
>> +    /* 40MHz crystal */
>> +    input_xtal: input_xtal {
>> +      compatible = "fixed-clock";
>> +      #clock-cells = <0>;
>> +      clock-frequency = <40000000>;
>> +    };
>> +
>> +    i2c@0 {
>> +        reg = <0x0 0x100>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        renesas8t49n241_2: clock-generator@6c {
>> +            compatible = "renesas,8t49n241";
>> +            reg = <0x6c>;
>> +            #clock-cells = <1>;
>> +
>> +            clocks = <&input_xtal>;
>> +            clock-names = "input-xtal";
>> +
>> +            settings=[
>> +                09 50 00 60 67 C5 6C FF 03 00 30 00 00 01 00 00
>> +                01 07 00 00 07 00 00 77 6D 06 00 00 00 00 00 FF
>> +                FF FF FF 00 3F 00 2A 00 16 33 33 00 01 00 00 D0
>> +                00 00 00 00 00 00 00 00 00 04 00 00 00 02 00 00
>> +                00 00 00 00 00 00 00 17 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 D7 0A 2B 20 00 00 00 0B
>> +                00 00 00 00 00 00 00 00 00 00 27 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                C3 00 08 01 00 00 00 00 00 00 00 00 00 30 00 00
>> +                00 0A 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +                00 00 00 00 85 00 00 9C 01 D4 02 71 07 00 00 00
>> +                00 83 00 10 02 08 8C
>> +            ];
>> +        };
>> +    };
>> +
>> +    /* Consumer referencing the 8T49N241 Q1 */
>> +    consumer {
>> +        /* ... */
>> +        clocks = <&renesas8t49n241_2 1>;
>> +        /* ... */
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0cce91cd5..882d79ead 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15575,6 +15575,12 @@ F:	include/linux/rpmsg/
>>  F:	include/uapi/linux/rpmsg.h
>>  F:	samples/rpmsg/
>>  
>> +RENESAS 8T49N24X DRIVER
>> +M:	Alex Helms <alexander.helms.jy@renesas.com>
>> +M:	David Cater <david.cater.jc@renesas.com>
>> +S:	Odd Fixes
>> +F:	Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
>> +
>>  RENESAS CLOCK DRIVERS
>>  M:	Geert Uytterhoeven <geert+renesas@glider.be>
>>  L:	linux-renesas-soc@vger.kernel.org
>> -- 
>> 2.30.2
>>
>>
