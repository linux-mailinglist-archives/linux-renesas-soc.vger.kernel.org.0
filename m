Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE2164C046
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 00:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236923AbiLMXK6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 18:10:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236531AbiLMXK4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 18:10:56 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7757E1AA1A;
        Tue, 13 Dec 2022 15:10:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcBOQ2qV7h5yRHXWUXMRQLn5BjC8LjDJBzkqUNHVRwvu8Ll426Ip3aYpM8D8UhfwizeQqT8Qe+fV58ZHm9tyJhL8gO2tn99CANmt8BUAAuRh5m4EszOiCpgH/tW5+xQf5wibjhhGmdEn6iDta5UBrzLhJNbOPjIdsUq7luiNNRTTiVEmOqGYDZepa9rBf8k6+U1NirRfOLRW0zOw2lbcrp24NWNso8aaJSfKxAdvJn5dQUcDxoa8o1RATaVbLAAQEGDYl4Qv0RnXPcZ1NHqA1g3Jzi4maBeaFNEN70z1AUR8CyySblgUU1c9D4bjzNnqs9/GmYEmnfnW+p+qM/XYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YuT68XiWOUqGXW3L3vBVRF3hzg45vw6ZqiFimP92l0=;
 b=ZDOG+3cIOJvmT1EB4Bjy883sfFzqe2xVq2ticeKP8ruvQGYcqLNnpi0GeQdyjQ3KEfEAtHK89m/LwuItcm3HNspeI8DBwt6BvxGOJaoFfMtww947R46H+3k89w/w4zdPRFq04xyjGJq12FE1vuluDJWJfZS3nu1r6aHGwPeF8U7oJ07hAkB7+UVnPQuCi/QCm4XoQLmmr33ceTdayI+PgNRoP9Vy/659ThRxR9W2tOsglKt681qtL5SqwgtKeQcWUNvv53b9PJf92seNQ3lnNglILv74uXSfW9N7ZFVsA9VF/nKHYevNf9WBLHodlu5ScRieelC2x84h0DzcTNxRNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YuT68XiWOUqGXW3L3vBVRF3hzg45vw6ZqiFimP92l0=;
 b=qBYTADrzbfENONp2n98+WZuqhMgTaiVjNFQ5+cR8i8isehRAwFDZSA8375h3GoSGeBghXwsJHGP1UZbZnbikq/Z4E1WZxejixIUFo8/xDSxhFhsdw+AO9Ag+ODlnhsbBkt25fOcu8d0FSGhEvoIiq4nlJ6klq/KhoILtZubioXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB10268.jpnprd01.prod.outlook.com (2603:1096:400:1dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 23:10:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Tue, 13 Dec 2022
 23:10:53 +0000
Message-ID: <871qp2rjb7.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Damien Horsley <Damien.Horsley@imgtec.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 2/2] arm64: dts: renesas: ulcb-kf: Fix pcm3168a audio codec node
In-Reply-To: <CAMuHMdVgDF=wF3Q0_QMecpmmWe1NxyK4BGTNhEvcdS5698cNmg@mail.gmail.com>
References: <cover.1669980383.git.geert+renesas@glider.be>
        <3c0f5b935da4468fe04e2d85becafda0040e4d31.1669980383.git.geert+renesas@glider.be>
        <871qpcm4mu.wl-kuninori.morimoto.gx@renesas.com>
        <87mt7skwsk.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVgDF=wF3Q0_QMecpmmWe1NxyK4BGTNhEvcdS5698cNmg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 13 Dec 2022 23:10:53 +0000
X-ClientProxiedBy: TYCPR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB10268:EE_
X-MS-Office365-Filtering-Correlation-Id: 63098658-def5-41ed-af76-08dadd5f4873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N350rCR+6laO+MhXUqzu6N/xnxiVQwIyjPFvZNNFs5tbQV0JCbfQOXXwBKl/rNlozT80O5kQ/Zpyo9IM/GcecFe2OoUdJJphf3ktpbttH4ndlRqy3gPUBZIFPyY1GIm8b/OnmZiRRFEdRZx0cyYXeDBMbbqCf/J2BDPdVOfcRF8EIpf6sAr75xGnkmtK5dCin5zFBGz64QN02jMddJ3bxV4E9auecX+8K0o8OGxMa/sG604FeViDb17JspB25cZGqnyeXZZrfIW5aI450vzoXjQ9BJZN8fBC8f+RlMyCc6ZuaW0Y+Fn0t/NnNXtDOM/j66Uiz5wq7Ms4nwTn+IW3mfLuM3sXPQS5EWif+Gt0SC2GpR8WfKfwmRiWdng1WwL3Zyeu0W/GRgzO9wiPIcB8Ja/R36dAlce03NdovQG0/LAYDM7dYPOlUSGmwI4649HlWWiYCD2IT9jctOK4zUo2vfRiqUns79jXt4uSjEU+Cxeq7E0L8kXIWKF5D4czVoR7+0Eu7V6L8mreDFf+cAlE+KGK+Cnk0eHPLtZYa64ntJ15ZTrakRxagGnY83/CB0nkMZ6rjtMwNvUj9zrqkramyJXudv4dlo6vAPPH63NtqBjmt1eEORUNd6gL/ssUjs6MhcSuZEsE5UDgHHZtfD6cOBdNN3lRBgzAHiZ45jabXwoZxkFrvTxT82rhRkONQ6+rkYrjrL45tNbVaSZFvUjGbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199015)(478600001)(41300700001)(5660300002)(8676002)(4326008)(6486002)(6916009)(316002)(2906002)(54906003)(36756003)(2616005)(66476007)(4744005)(8936002)(66556008)(66946007)(52116002)(86362001)(6512007)(38100700002)(6506007)(38350700002)(26005)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVczbVlMcVRLbWVreFBVVGNLcmJTb3FpU0tRQldHNmVFY3JsZ0w5TEJLeGpV?=
 =?utf-8?B?aFVKT1Nqa2htaVhwSUJ5ck5YTzNBMHpGcHNtS1NUUzVzQTlTVGxhNy8rQ3RO?=
 =?utf-8?B?UFFHWjAyS0Q0WmppZ2VHS0psVDI1bXdCZlJ4TGtlSytJbm9pQkhqYWZuRlc0?=
 =?utf-8?B?NWNWaC9mZG9vSkRRQjN3d0l5YTNSVVg2dUJGb3pOSTVmaTVDQkd6UGtMclhG?=
 =?utf-8?B?SHlwc2FJcE9XM2syd0lIcG42alB3TXRLUWVFYnV1S1B1WTR6LzcvcHJOaDF4?=
 =?utf-8?B?ZXFtekdlajU0c2N3WEJxa1FidFRhZGUwV3Fzd1N6YTJUVkEvMDFLZ3MwVXR6?=
 =?utf-8?B?ZjhKZHkrb2xQaml3ZCtScTBzUFZ3eWs2T3lBZE5RSDF0NnlyOEdxWlNuS1Nz?=
 =?utf-8?B?VE0zK1hQaCtzcGRleG5hc2hvMC9oVmxtZ3UybWFjK0VWUExIZTZZM3Z1SVhF?=
 =?utf-8?B?UytaNzY4bUV1NGRsU2hhWXhMenU0TE5JT254ZXhtWERYcEVNaDQ0UEQ1Um5D?=
 =?utf-8?B?bVFjVkQrZ1JRa2dpYmFqN2RmVEZhcHFLSjFrZzY5VTRWR3Z2YUNKSDBOcTBM?=
 =?utf-8?B?RytJRGRSa1k2YUZsQmZRdzVKbDhjNnJXWkd6aHRiNG9SdkRaOG1sWXEvN21R?=
 =?utf-8?B?eEs1ZmUycVVCZlBneUFyRFBoVXRxd0ltb2hNWGFFNHA5UUMzdG1lRkM4NjRy?=
 =?utf-8?B?ZmZzYXMvc2hzWmxGdzlUMnRMZTdKRFcxL0t2ak4ybGJCSXNLMHVMN2Q4K1NU?=
 =?utf-8?B?cUk2ckVhZWJ1Zm1UTWt0Q2ZJZWRFNU5yZDVNOXZ4YVpua1RqY2FoYmh3SVV3?=
 =?utf-8?B?NjduR1FmZENMQzZoV2d4d1BXN2RiZ2JkdUdxWEVtQy8wckp3OE1LcUY2aFI0?=
 =?utf-8?B?eFE0YmQ4TEJSTlhUSldBeUR1WEp6UGUxQUZsYnN0UThGUC9xMTZDRDdOQUJF?=
 =?utf-8?B?d1lLWmJOMkgyQ3Mydy9DSEVDeDdVQTJNMlh1ckpIaVh6R0RsMllEMXhFZEQz?=
 =?utf-8?B?Ri9UQmdZS2FjNTRIVjg5OCtYc3VHNzBqY1l2Snc3Nllnbm10OGg1MGY3NURj?=
 =?utf-8?B?WUdxVjRabmthS1pNd0FmbGhyUHNkWVM5eDk4aXBob2FjWnQyTkFyd1hUeVh6?=
 =?utf-8?B?bmppZURSRmgzT3BRVE4zOW1paXkvWHhHYXVJK1RzbUcvSE03Z2JGVE03Q0tq?=
 =?utf-8?B?Zmg2ZlhhbDRwdDc4eXpLNE40cXBoOGdCdENKTVdIeWxHdngvWHlPVzQ3dkZz?=
 =?utf-8?B?Vm1NSE9hb0x3MzZmWHM3ZERNRGZhd1IrTDZsRm94b2hDN3dTNmsrTWdlaGRV?=
 =?utf-8?B?dFNKcDJtWHVJTG1uUGh6aHpqYXNIaWRYRnp1U3VuNDNPZ20xYUw1RXhzUjdG?=
 =?utf-8?B?eU5iMEQrbFkxbHZMMm5XMzNwQTJVc1pTTUpEdEd4TmE0M1o1dnpIY0NSM1dt?=
 =?utf-8?B?Mmk4SWNTYmY4MTkvNE42TVp5UlVkaW9sWVptcUpZVlV0eTFTSVNrSzV1VkNP?=
 =?utf-8?B?cHJGUU0zTHYyNmpMcVpmZ2VmVlBpT1hMaVdBK1NlSHdxYmpzV0pDWk05eTB0?=
 =?utf-8?B?OHdwdjJYL0c0aGMwMWJHNVBuOHNNQjVwVlJVYmlTWWtLcXdoUzZnMUp6VzA5?=
 =?utf-8?B?Y1laK1ExeTc0TlBqaTJOUkhIUzhOWDFkR1Y1WG44ak4zeWcrWUpUbUhBc1dY?=
 =?utf-8?B?aDFBcmhVMmpubW8wbFhRci9FUHpPZ0tXZDdtbW5jUWpNeFhrV2xjQ0luUnli?=
 =?utf-8?B?aWhmL1ozbm8rbENEcEhkVllvTDdTM2E2Z002QTczM3hvMVIrcFpDeERFSjhS?=
 =?utf-8?B?NWh4V2E0V1A2a0IrYUJUYTh4eWtieHFJMDZBYzJjbjZrRkJNbWZBWmZYMDFK?=
 =?utf-8?B?NkNnNU1pQkdvSWlYR2U1blhWR3VKcU94ZjVaaEE3QVhLNzU0YWdYY2NCeTdZ?=
 =?utf-8?B?RFkxUDB3TEdVVm1BL1ljdWI0UW9QZkxhY2NLdDU1Rmd2Z21kMk8wT0JEVVFI?=
 =?utf-8?B?MW0rUjhVbkRPejdOajE0MjNOSnJNNzU4THpwWDFBSnNYTjlKVlUwZWoydEwy?=
 =?utf-8?B?TUp5YlQ1WEE4ZUFJYitNNVk4V0dNbElTNkpFSUpkbG9aRkFObzFjbG81b0Fu?=
 =?utf-8?B?N0tSYjJvZjhWVEVRb21ZbUljc0tMOE5Xa3VDOCs1cFlVNXFyT2tEcXQyOEhO?=
 =?utf-8?Q?2Xo1/aENy36ByYNxYm2xv2c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63098658-def5-41ed-af76-08dadd5f4873
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 23:10:53.4300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zyU0SxQq0H02jqlyq0XAUIfslMgPBPJFFTglqvXIapJzoAVL3EpyVAl4N9wMUoYZxSor6m7CUxdVzOFxN8I3mkEGCG/U4P8pIMDY0pJrLRTmyxd36UNjL0z3aaMyep8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10268
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> > I have investigated about this patch, and it needs extra patch
> > which I will post if -rc1 was released.
> > I can merge this patch (with small fixup) into my patch-set.
> > Of course I will keep your name. But is it OK for you ?
>=20
> Thanks, fine for me!
>=20
> =E2=99=AB All I want for Christmas is =E2=99=AB... an error-free "make dt=
bs_check" ;-)

I will do my best ;)

	Merry Christmas

Thank you for your help !!

Best regards
---
Kuninori Morimoto
