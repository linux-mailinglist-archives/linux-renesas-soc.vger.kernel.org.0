Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 116167AAA51
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Sep 2023 09:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbjIVHdh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Sep 2023 03:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbjIVHdg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Sep 2023 03:33:36 -0400
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2087.outbound.protection.outlook.com [40.92.103.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59D619A;
        Fri, 22 Sep 2023 00:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVgLguEGPSxSapNOjSeW0qK+xe0yoy42tP6RFlOuvym/CyVpuYlogMeUBRj3qIQGaYw5KKPL6lNkYRSoZOe7TTdj7cODmI2SH3GDXFvCY0OqKNypQEt6PYRhWYpusRN7ZJdpZM0On1wchBVJUR7+WI5bZwNEIxhvummDwzHJsNw6dTlDtGmZzh6gRQJLLAMsR4RA8uOm6I5OtkdncSQOcymOvb6dFEABQk/bHbiZh1lZYpsVj/3HtSM0vyf+qhY727LUvvwxZh8/u+NZ88S+x6NZZBuWOZpy4SXNBjsmX82y6McPm/9EDDTCs6Ui7UaSUegvSrzUWRLSA4sn1Qrtkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwrXXixeqa8TiVYbZNnZHkxKS6HE6Vomyn0sTkyDB6o=;
 b=P3ali8IWuxLWJRO5wPjgPf/C0y1VR4dRrJ65lU099Aihw69g0bc68XUyLuQcNaJpbPrw/mTEcIMwjYWh1V+xnY9Mq62x9h0ECD2/c08+1lT5hYSHm7hbIJK9JDeUnNyVNj5KTJhS9pHtl+ftmEYeo8Qoh80/EthiqMGqmT6aG1+u8KUzX59SksCBYtdSYNM3igyVLr4CzHOyAqr8w5RKiOKRId14++nfCfhZOADG2OEV9Sq9pmw256bUg7TKNTZ4kirOjhMFLFOLhro4Hl3treD0JjB9cl1e5N4sSgqGVoAQwmd27LpQSqqGAe/s4+sqbwb1lufbAM8uJ8u+s0Axww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwrXXixeqa8TiVYbZNnZHkxKS6HE6Vomyn0sTkyDB6o=;
 b=QU0WiYMZwrGFGLixzZ7/una0+UHmwtSqKoQ2jupX94QaR4UAMhh8qZhgy37qIpgkwXBBTWeijTz34/IsO95si4T4hKkXi6mVlriDiK3+C5nwTAYcZKUsOOnAl50ydbqOynniCOs322b6n2BjefTP9HHQlZiwSxQFNmT0g/nV7enZAtyTLwpcdVRT5Ly7MmI7kbRI0SYVgdYHzpQ3QdCcZ7p/lGARs77OD7sO4hTrL7COUnSo2N1EfeWZwoMU3P8tP/ctqbnCSaMFFscfCfIrrX/tRD5r8mUiz1uTH1fCFLg3fyYklvzBa6E6cFvAt62mbdHiC1/SJTuV50W/YRwg5Q==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN0P287MB0847.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:144::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.23; Fri, 22 Sep 2023 07:33:21 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 07:33:21 +0000
Message-ID: <MA0P287MB033245E15897C496789A0979FEFFA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date:   Fri, 22 Sep 2023 15:33:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 1/6] riscv: dts: microchip: convert isa detection to new
 properties
To:     Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
References: <20230921095723.26456-1-conor@kernel.org>
 <20230921095723.26456-2-conor@kernel.org>
From:   Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20230921095723.26456-2-conor@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN:  [M7kct4xhIzbUyDF+xIAVGP57xHxULrM5]
X-ClientProxiedBy: SG2PR03CA0103.apcprd03.prod.outlook.com
 (2603:1096:4:7c::31) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <37741f59-7c22-4474-8fcc-6c53ca3fc971@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN0P287MB0847:EE_
X-MS-Office365-Filtering-Correlation-Id: 373cceee-48b3-41ed-687b-08dbbb3e318f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lwz9+l016jKcfqK/HWSjf4r8oQ0m417VMAKR4vimRO2NbBR+7Mct4XutK5ZGjWSCUg3qdg8zzHJOwMOJAoxt7a9geGzivSs5n4gA+6Jx4TW+ok7LKQE2wU+8G+oiHlyPmoo1yRIZ8Ot2EgCJT1/m2sLWqcm1v4PxgpKhw2PFWr3muYPoI+LUXkZ/8gMwh7Idgqe9LKoVYVoESmm7ghc+xxfiCtgvcmkID0P/UysM9SG3yj92L/2YT7NUo4cIlmqsXvTklk4ubeCtKOL8q0MvjZfN4uSNG3mHhJeqbO0iBdy+X9ocQsH8519RJ/3kM64FkDl7ln/4Etgph3nupv+fHp56Q1dsCVZWRFOAiV/CLATngHc24ZIxnnFouQEcdztNcDSGL/3mu2MOWLCNb98aEJl8VThLgbOF1HnjAqybccNyFInOsZVdUhrOfnkUJDpHCw3UF5xxbR2KgS9jo6GQVFDyZT+2MhkSmMi1KfZagynNpJDNwoiPsijgCK9iwdDeqFQ03/S0p9p8JvKfpNEPVXliQhx2gcmFIMobdLB4+yadlPWCBUHjOerbhMj4dEmu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2xzaFh1UTNBWHV0YzFQbHdrMklJSVJrMzk3d293SFJqSEs0dGpLRFA3VXVB?=
 =?utf-8?B?R09QbTJ0cVZONFV2aHBBV3hxZDl5TGFPbERNTjQ4QTlCV0svRzVqQmpSTTFD?=
 =?utf-8?B?NjlvbDRpUlI1R2VlK081c3lJcFBCWHNycXgyemRiUnRsaUxTL0JiZEVnZC9R?=
 =?utf-8?B?bE5jQnEvd1h3Ulc5bU5IQW9XVGhIeDRBa2ZnQkp5TXBQZFJJRUlyeWo2elZW?=
 =?utf-8?B?dmJSK3JKQUZBa3NsdGo1RkRlZWZOYjFlRG43b3RTNm5WTVhSRnVSWkVGSC9P?=
 =?utf-8?B?QklUR09lVUFEa3RQK2k2ZDltMXQrdXZpc3kvdWFUd05NaFlhc0k5U24vWkl1?=
 =?utf-8?B?ZnV5Q1JRS014R0JFbmFEOXRsOUZ3bHlyU2tidXA5K3BVQzZWVlJHSU1mVVNq?=
 =?utf-8?B?K2VoOEg4WFRGKzFpQnpDTWlydGVWOTE1bWxEdTlabGVLazRXSEUvSTVDazNn?=
 =?utf-8?B?OWt6Q1JIakVOME5XOVJ5a210Y00zUjc1RGRqZ3ZDWGZPWmdMV21xK3prZVdM?=
 =?utf-8?B?dXpudmZ6alhHa3BtUTkvdXZ4NGlOSmMxTWowanJxSk5kaG03ZEFzVXkzdXJN?=
 =?utf-8?B?Mm93b3NKWlczUENRR2x4c0hVa2FLaGxNdStMaWZucU9NMFI1Y1BHejhCUU9R?=
 =?utf-8?B?TURNbkF0a0gyODZWZTJSZEZ5djNRTDdGTGFsOHl6dlFocFgxTkFXMnVkbzhM?=
 =?utf-8?B?dk56dnVsejBOcm9Kc1Z2U083QnNEUkhBeTEwamoyTmk1NUY3ZTY1VldaRGdL?=
 =?utf-8?B?RDRwT1ZkTmtXYjVnK3hYOHIycnF4b1l0WHY3L01YdStTNS9hdVRucEZGVEE2?=
 =?utf-8?B?Rm91dGpyc3N2M3ZCam51bWcva09oQnZOdG1md0JDSk0wRmhOcUgxekFvN28z?=
 =?utf-8?B?c2RKS2NTMzV6d3lxVGdURWZRc1FCK0NSZE13T2IwMjdGbSs2M01NRXFIczhv?=
 =?utf-8?B?Y0NQQUIwMkphdzVYZ0NER2I1dUhGZ2p2bmRBR1duRHhBaS9jLytvU1kwR2lx?=
 =?utf-8?B?S0JlbkRYRHhzblI0QkQwMnkxVEhFSkhqeTBVSEkrNmRDNlBkM2xjZmVkNjVX?=
 =?utf-8?B?WE5uSlhJVWZ6ZnJTWXVQQTlOdG1keVZXNU90NDR3d08yeUNQd082U2tsMmZC?=
 =?utf-8?B?Nzd6V3l2OEtVaHRUU3hhRnI0QjJQRjFWaGZ6RVA3QnhSWWsyVXkvekpGOGFY?=
 =?utf-8?B?UjY2bjN0RktrWlpLc0JXVTJHcHYzdWdIczNMekw4ZGFHVjZ3MUF3T0htYWxx?=
 =?utf-8?B?U2hEVm0vTkQ3RTJmZFZiRmg2UE0vNlRuWkFPUlJjVk1abzJieEkvZVNxWjlR?=
 =?utf-8?B?eklXdlcxWU1NWjR0RU96cElXVHhFR0RSZzR3blMyVDZlSjlIVjlQWGVSekFl?=
 =?utf-8?B?a2RvaWRhallQbWJjdHEwbUUwbUdhMEdDT3NaVEZ0L1gvTmJ4alFEb1EwdVdj?=
 =?utf-8?B?UDdkbWpwN1NGcUZTNy9nSzBvL3I5VjlTWlZUaHR5WEFFampKZjZRVEliT0hp?=
 =?utf-8?B?ZkxDaFREWWZ5Umk3MmoweWhpdUl3R2V4RUZxNmY4NnhXRmVlOCs2ZE4vSHBt?=
 =?utf-8?B?Skg5OHZsV0FHekhyR3FidlY5QmxCVXhvYmhNckFGRDQwRmVGd1NINDJicHlC?=
 =?utf-8?Q?tcDwmlZIAspTgX8iqmjQ605Yvt+tAd4AJoTSxaGu43K4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373cceee-48b3-41ed-687b-08dbbb3e318f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 07:33:21.5185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0847
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
        FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


在 2023/9/21 17:57, Conor Dooley 写道:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Convert the PolarFire SoC devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   arch/riscv/boot/dts/microchip/mpfs.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> index 104504352e99..b1f873d9246c 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -22,6 +22,9 @@ cpu0: cpu@0 {
>   			i-cache-size = <16384>;
>   			reg = <0>;
>   			riscv,isa = "rv64imac";
> +			riscv,base-isa = "rv64i";
should be "isa-base". This applies everywhere.
> +			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
> +					       "zihpm";
>   			clocks = <&clkcfg CLK_CPU>;
>   			status = "disabled";
>   
> @@ -48,6 +51,9 @@ cpu1: cpu@1 {
>   			mmu-type = "riscv,sv39";
>   			reg = <1>;
>   			riscv,isa = "rv64imafdc";
> +			riscv,base-isa = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>   			clocks = <&clkcfg CLK_CPU>;
>   			tlb-split;
>   			next-level-cache = <&cctrllr>;
> @@ -76,6 +82,9 @@ cpu2: cpu@2 {
>   			mmu-type = "riscv,sv39";
>   			reg = <2>;
>   			riscv,isa = "rv64imafdc";
> +			riscv,base-isa = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>   			clocks = <&clkcfg CLK_CPU>;
>   			tlb-split;
>   			next-level-cache = <&cctrllr>;
> @@ -104,6 +113,9 @@ cpu3: cpu@3 {
>   			mmu-type = "riscv,sv39";
>   			reg = <3>;
>   			riscv,isa = "rv64imafdc";
> +			riscv,base-isa = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>   			clocks = <&clkcfg CLK_CPU>;
>   			tlb-split;
>   			next-level-cache = <&cctrllr>;
> @@ -132,6 +144,9 @@ cpu4: cpu@4 {
>   			mmu-type = "riscv,sv39";
>   			reg = <4>;
>   			riscv,isa = "rv64imafdc";
> +			riscv,base-isa = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>   			clocks = <&clkcfg CLK_CPU>;
>   			tlb-split;
>   			next-level-cache = <&cctrllr>;
