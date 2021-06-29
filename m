Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67E643B75DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jun 2021 17:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbhF2Pwf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Jun 2021 11:52:35 -0400
Received: from mail-eopbgr60061.outbound.protection.outlook.com ([40.107.6.61]:48982
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233801AbhF2Pwe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jun 2021 11:52:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mB0okwzZq3XLSHhp6vxUCffGET+LRS9yzIK31u14W5uM+7VD2ck60dy0Js4CwuyUbrp69gTO8FpRG8mwyv4m5zo3mCS4URZETKZkEM7dXqzhYIeD/VpdqHGwF7XA5OPECr20CDo8YTBpAjnVkDggo/HsJkmPV9yopwGLo5itACcNndOt7T+iM8ks1x7KOuDHTfS8cxteD4LCY4PC4/ohKKjLuAqUADOVwj9oPgl3vvpOs7Gqx6eNifDMjcc9L300V9j31KrahqGQY8Ame+qF1d+UhkQVUWJNw+7a9dBREDrNdIYnO3Yglvf7nDY6woNTlmWHe7j5P6J18IJjbWCBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRvKvyOCUHcOukSG18+64yijqT9bLUSKyy3p70voa+I=;
 b=KUjHgyc5L7H/UaJZ0LAQD9fJ9MihDdC6AKW/PRPT8Ub069R9XMEK6qFdmbc2bk8gH1hAnaj6sPHjFVHQFGxtrfB7rEeoB5mC3veIM+93otpfeQEf7PnyS9IS51GXixv8OiywnxVmrLUN2e9tnOVJJaFc+m4KwAdJ1YoSg0AFGizuNNNQRurqMGvt2w+6dqpha4eq2sXFJwVJ//pzpENYoBXwvqtE6wkQGpyR167orFs3/psrPha5WC6Vx0ZcqOj1RIRU9Zn7ycplThxwnMKbCbGEiD3n37CX+/8unW9SpeLDD2d/JTkxhAxNwtN7WKusx2165k8r+0q0/pNcEwTQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRvKvyOCUHcOukSG18+64yijqT9bLUSKyy3p70voa+I=;
 b=AgcU3Gp6barn+yzm5aJly7m4xVm4Hk5Uabd2FKwCntTofbaEEG2VkmmRlmzvs1uMMegx4GwQTVyv/l3DC4gw7oXnLpu7i9ntMiUvb3giZ5humc+MMG2o5usUhtfMPUKyiRZvGqL7j7C8rXD3z5nkWPKt2dN8PHBB/WlKaHmb/WU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBBPR03MB7146.eurprd03.prod.outlook.com (2603:10a6:10:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 15:49:40 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 15:49:40 +0000
Subject: Re: [PATCH v2 2/2] clk: vc5: Add properties for configuring SD/OE
 behavior
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kieran Bingham <kbingham@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20210614155437.3979771-1-sean.anderson@seco.com>
 <20210614155437.3979771-2-sean.anderson@seco.com>
 <47b37414-6587-0792-201b-e255feeee9c9@lucaceresoli.net>
 <3174eed5-1078-68c4-4d98-95c448cd0940@seco.com>
 <CAMuHMdW9LMuQLuPEF-Fcs1E6Q7dDzY17VZqu4awKDj5WSTRt=A@mail.gmail.com>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <cd53ef91-f282-81b2-fc2d-f6a254a904e1@seco.com>
Date:   Tue, 29 Jun 2021 11:49:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMuHMdW9LMuQLuPEF-Fcs1E6Q7dDzY17VZqu4awKDj5WSTRt=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: MN2PR01CA0052.prod.exchangelabs.com (2603:10b6:208:23f::21)
 To DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by MN2PR01CA0052.prod.exchangelabs.com (2603:10b6:208:23f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 15:49:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a222f015-a556-4f9a-3472-08d93b15817f
X-MS-TrafficTypeDiagnostic: DBBPR03MB7146:
X-Microsoft-Antispam-PRVS: <DBBPR03MB714624FA216E1B2DCF4A043796029@DBBPR03MB7146.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o/VM6Yp8PVIPoR/6UZBCLsgUpjhmjNMvcRDC+rhSiJsWyjWew1xJFRLW8xpRjtTg+yf0r1vx8MGSDIcD4QlRoMt/U/q8SU7t4yGxj4CyCMPKN5ITuvKR7J24oW2FfHFTM9PSijuuljkiwgm5KhPx+VsHGv22Ur22T6E91VcMZU0AM80NcLw4epf+vg8+VarUlVvCtIMhH2TQtklhHEInXPXAhgt7VO200WIyguDxew7jBYwxrr3Xxqda9mPK26AkzfH3sCDGKluQCfdSggpKE1/BvCplx5hkvosnYmOz2AbgB+eHZbiVoVXcIqUspiivXDDdspLnKt3BX+8S1QI7mgSJn7VPJS/KRrx3bShQcOPuhF1/02a/ZJKTS0hdHF9J4qoMeurdFZ5ROZxRjco581ltbcucm88b1laXtV/PFnTEJBRt4g4YVtSNl6Wvs9XstnWx170lExQ7QyHJ81ALjz5lEkn5XYASEuG46katjLoCeYvcIKTSlgdziee/Z37kKmcWjknBNofIB24hA7XUPKyWjR6kkCuJGkO9gP00u9xUGLRO6aUniFwX1JgbBCTLlvhJA0yq/KWWa3GT9n91EgBRqIEO4A4PsYdBhBOgzPCOuWGcuIK25LigKTwVayjEsAbYhk/S8PztcOoKXAd5kai9H5CPid4s1XJOSgC/vIKoR5rNJ1MaZ5fujyLxKPqQGG15DOJjERGYPtWLyRmsAW27Ycei6dDMpInO1YC41BILR9/4nXNMxJ3aHeZztQMB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(346002)(39830400003)(366004)(136003)(186003)(38350700002)(38100700002)(4326008)(16576012)(316002)(31696002)(86362001)(83380400001)(36756003)(2906002)(53546011)(31686004)(16526019)(52116002)(6486002)(54906003)(26005)(66476007)(66946007)(5660300002)(956004)(478600001)(6916009)(44832011)(8936002)(7416002)(66556008)(6666004)(2616005)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDZPbVZid0JZWjFlcGxCTkt2TVFlZUVYbzJNc0J6Wm5IRGp6cUQrK1I5L2h4?=
 =?utf-8?B?N3I4U3VkSkxMWjNscFJJUkJBUWx5dHVndklxQU9CYmVLMnF1anErUFZSNkls?=
 =?utf-8?B?K3J1VGdTalljNkcrcEoyc2loa0VScE1tUzVmN2NEYlBKS21UQnRKTUtxVTM3?=
 =?utf-8?B?cUFFOG5NK0dhdk5Ub0ZoUDNDTmdwZDRKS3RFblRDRStTbDVxWGVtM1N0b214?=
 =?utf-8?B?VDFmaXR1V2lJcGpMZFE3Y0RLZ0tUcDFjZWM4YUpuVTQ1dlNXc0NQSGkwbldP?=
 =?utf-8?B?ZEJwL0tsN0F5Q05lK0o4MjhycHhEZ1N2UHFQbUV5cnU0RXhJZUpCWHJEUEhZ?=
 =?utf-8?B?MmU2TGlXSkRjNUpiR0k4VU8rNVpGVkZDdlo4Qlp6T2w2UStrdlkxeTlTWjhP?=
 =?utf-8?B?RkI1b0g5dG1kV0E0NTZUNHJtZHNNeGNMa21hZzA0cmRjR1JzYjZYa3oyeE82?=
 =?utf-8?B?T0hiSFZDQURidjFYd2psUGJrYnN3dmZURmVrZmdVaGtQY1crRGMxV1RtTU82?=
 =?utf-8?B?ZXd4ZFl0SUs0WVdvVldoVWJWVVFtb0tyQjkxWFZuVVp5RlEwUGVGa2RhVVha?=
 =?utf-8?B?Tjc2dEtmdyt2MCtHMmdzUVFreWlhU0c1bjl3Zk05TjZvTUs3Wm9NeGExaThB?=
 =?utf-8?B?Q1dVT1p4cmQ5dDJzTWpOTjlidnBFWUFoRTlJbFlSbjNiWHUyN1BKSy9Pci9s?=
 =?utf-8?B?U1JacHNxaTMzUmUvSGQ3MzFxZXUwa0ZleEJMV3dnSUpZU1ZIaVBWZll4aVZj?=
 =?utf-8?B?dy9icjBGbzdLSkVnWW94dU1CdVY3UUVWbHdQSFpJZE8xQ0FTLzhPWVhxMm1M?=
 =?utf-8?B?NzA0MG14VFNRWS9UeWlQN1lwNGxvbElYVVRWbG5SSEZaREtxL01oL0p3djZu?=
 =?utf-8?B?N1JjeGczSkJuUFJzWUNmbVNmcTVKVUEwZGNUbTdONVQzcjlIYW9leXZkNSs3?=
 =?utf-8?B?VXRPeldmR3UwekR6ZmRUS0Job3FJMWdlU0p4eEdSa0tCcnFrRjVpUjNiZXBU?=
 =?utf-8?B?cDJnSnJpdWs1aFJaNGROR0RaazluSzU0aWtZaWlIV2hldWR0R1VlMGk4SS9r?=
 =?utf-8?B?cW9qM2FKL3hOUy9QQmkxdkJDOTBGY2RvVnZyL2JERWNuNmZVSXdYSkhSZ3F1?=
 =?utf-8?B?M2dDVkRZK3h1M0lvbnBadk9wQmRLa3RHeHd2TlN4dEt0Lzdpa2l5Z25WOU9x?=
 =?utf-8?B?Q2EycWkrSzNKWkxBMXdIQ2diOXBzL2ZJMnpkVys4QXZ4cGRUNGc0aFVsTk9w?=
 =?utf-8?B?TWtMUmEzanVaV2NabGRHY0NPVXlFdTQ5WGxqYzBlSFNzNDJtSGRoY0REK2dU?=
 =?utf-8?B?ZVkrMnUyd0ZicmNPR1U4QzVlY0E0T1p6L2pCSVlVc2g3Wk5vNmtsM0IyNDA5?=
 =?utf-8?B?Ly8wT1kvVHRHZHJzbThtNHp2THM5alpmL29GdXE5dzgxMFpYTlR4Qmw5MnlU?=
 =?utf-8?B?QWlXZjJBUFdjVDROeklXblk3REtqN1ZGcXJmSnFZbCtJT21MZElnMmJmK1RD?=
 =?utf-8?B?SU9BZUlOV0VIaWJzZ3o3Qlg5NjhwV2tvOTUyVWlscVFHNFpvelFrakIxTC8v?=
 =?utf-8?B?VFFaYzkrZ2srUGRuTXlZdjJUS1lyamxEVEVDRTYxRDhuWVFrdEdRdXdqRnh0?=
 =?utf-8?B?WGxFR2N6NWcrK2ttd3puK2hHVzZtMDMvNmhCdUIrTktZLzNodkdLSm0yZE9P?=
 =?utf-8?B?YUJFcHZxdmNtRG5iUG1PbXJldzlCaUk1LzE2a0h1c0k0YXN6NVRZaHg2bklH?=
 =?utf-8?Q?IBxipJNl9fY+s6qC/8Tuxs30fOOO3DxKiPsyErI?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a222f015-a556-4f9a-3472-08d93b15817f
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 15:49:40.3664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQiLIBd7lvPJ0eVRAxodZslmITY25zufL8fBKuAq33mebJMQLbvS0kuRjwGkZbc4AAojmxa5ETIrPvOsRnHZnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7146
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 6/29/21 8:42 AM, Geert Uytterhoeven wrote:
> Hi Sean,
> 
> On Thu, Jun 17, 2021 at 4:53 PM Sean Anderson <sean.anderson@seco.com> wrote:
>> On 6/16/21 11:41 AM, Luca Ceresoli wrote:
>>  > On 14/06/21 17:54, Sean Anderson wrote:
>>  >> The SD/OE pin may be configured to enable output when high or low, and
>>  >> to shutdown the device when high. This behavior is controller by the SH
>>  >> and SP bits of the Primary Source and Shutdown Register (and to a lesser
>>  >> extent the OS and OE bits). By default, both bits are 0, but they may
>>  >> need to be configured differently, depending on the external circuitry
>>  >> controlling the SD/OE pin.
>>  >>
>>  >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>  >
>>  > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
>>  >
>>  >> @@ -914,6 +915,15 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>>  >>             return PTR_ERR(vc5->regmap);
>>  >>     }
>>  >>
>>  >> +   oe_polarity = of_property_read_bool(client->dev.of_node,
>>  >> +                                       "idt,output-enable-active-high");
>>  >> +   sd_enable = of_property_read_bool(client->dev.of_node,
>>  >> +                                     "idt,enable-shutdown");
>>  >> +   regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN,
>>  >> +                      VC5_PRIM_SRC_SHDN_SP | VC5_PRIM_SRC_SHDN_EN_GBL_SHDN,
>>  >> +                      (oe_polarity ? VC5_PRIM_SRC_SHDN_SP : 0)
>>  >> +                      | (sd_enable ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0));
>>  >> +
>>  >
>>  > Did you test all combinations?
>>
>> No. I only tested "idt,output-enable-active-high". Though I also in
>> effect tested the default case (both zero) as well.
>>
>> One potential impact of this patch could be that systems which enabled
>> the SP and SH bits via OTP could end up inadvertently disabling them
>> because they need to add the appropriate property. Maintaining full
>> backwards compatibility would require a tri-state property of some kind.
> 
> And that seems to be exactly what's happening for me...
> 
> I've just discovered a failure on Renesas Salvator-XS caused by this
> patch, which is now commit e26b493f3495e8a2 ("clk: vc5: Add properties
> for configuring SD/OE behavior") in clk-next:
> 
>      [dm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:76:crtc-3]
> flip_done timed out
>      [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
>      [...]
> 
> Printing the value of VC5_PRIM_SRC_SHDN before/after the update:
> 
>      vc5 4-006a: vc5_probe:945: 0x8a
>      vc5 4-006a: vc5_probe:951: 0x88
> 
> My initial bisection failed, as the register contents are retained
> across a reset.  Hence booting a "good" kernel after a "bad" kernel
> still fails, unless the VC5 is power-cycled in between.
> 
> So I think we do need separate "idt,output-enable-active-low" and
> "idt,disable-shutdown" properties, and not touch the bits if none of
> the corresponding properties is present.

Ok, I've submitted a v3 with these properties added.

--Sean

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 
