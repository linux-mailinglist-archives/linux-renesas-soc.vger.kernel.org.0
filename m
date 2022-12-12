Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8C464ABC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Dec 2022 00:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbiLLXty (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 18:49:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233855AbiLLXtd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 18:49:33 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2097.outbound.protection.outlook.com [40.107.114.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9187FBF7F;
        Mon, 12 Dec 2022 15:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=II2JnKc31iZxbf09qYTHluLpuIAthQ3su0BPvZHT+K+9EbTSlu7LzD8/sYg9LkRIpj2E7/+acuglBcRPcVsH+GcnhbLYN7Z39kCHAcW4riwhlsFxgzbzlqulule34R4lM9xlXEqBnxxHzI14puy/eQK5Ui0IB/suZQQWT3BzP/hjQpGbKuWQgzIU12kZfIBkAxNbnhetKq6PUfYOHuQJ1ZrEUJA8N2hriZamUSWziXwDT43uz6bzrkhH+VEE835C+jC9zJF4VieM+4kQKtvx6n7CcUaVbBo/eBsQW7pa/c7KXI3bbgirM6hHfKlOZnI3Iz7wienxC0FmD22XhTUERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wr8Xh6TBT9w/lfLc9rtVMTFkGbXOWJjQKm4WWAFEgCM=;
 b=O2J7C8uJ0sST/j68No7t1r9av5mg9Qw7hqE5xIQKNo/kHXmMbrxwxGsdWRkC0wDpN4GE1Mm5HQOXOqrtZMl2MqkA7nDZ8rejcz+QKnj0/xJWbK+cpLiImY3AJYMEUnuVecmmsFEHCXKeSCXO5DMg+TAby/h2xrhjFgACz6FUZSQDxGxkGbSoUh3k3m56JvePdUnq4/CjmDGHzq3xlMtqgJnDADSejHYOeT0MOT8HyIGpX2rrxYab/y486HkVRe2hSw4DEu3bIeJHURZO/uNaveOwafFkap5eCBPxks3n1tXPk7YbDkOE82E3ht906swhIyrj2Csq2GDGdps9Gsre/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wr8Xh6TBT9w/lfLc9rtVMTFkGbXOWJjQKm4WWAFEgCM=;
 b=DOozi6T78Dg99gTYOtGJzNp1/eaAB2tWZ3LMLwoyfQfHS4+LT7xWTeJ91eHjfrQvM2JUQbGQ4Hl3pd7zTiajpxgGf4rLH40ZwjI43/RSe7UH3eI/5sxYDEFWkNrhZLrze2sXEVKxWtAVTjkWpAREPmA9E9WWg7n0R5J2ss+BYy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10726.jpnprd01.prod.outlook.com (2603:1096:400:2a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 23:49:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 23:49:24 +0000
Message-ID: <87mt7skwsk.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Damien Horsley <Damien.Horsley@imgtec.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 2/2] arm64: dts: renesas: ulcb-kf: Fix pcm3168a audio codec node
In-Reply-To: <871qpcm4mu.wl-kuninori.morimoto.gx@renesas.com>
References: <cover.1669980383.git.geert+renesas@glider.be>
        <3c0f5b935da4468fe04e2d85becafda0040e4d31.1669980383.git.geert+renesas@glider.be>
        <871qpcm4mu.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 12 Dec 2022 23:49:21 +0000
X-ClientProxiedBy: TYAPR01CA0208.jpnprd01.prod.outlook.com
 (2603:1096:404:29::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10726:EE_
X-MS-Office365-Filtering-Correlation-Id: f1780080-7c99-49d1-720a-08dadc9b7e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B0ULK3ikRD4k8uMKpGjf5celW7uCdZzNySVyCGmwQGFvViLgVsxLvsfAWvloeJvYv8S5YG3a05fncLE0O+44rnFBZj4451iIoH3pFrRBxaaR2ZpRJPuBfOS/8MyCoBly6kmPz/Ba93bMB46CcM6ISljjfIgELYdsW4nbKOtLx7rhxUpR78ekTVAkdLRdOJ2cjpbkdnB/dd33wPmm2e2h0qTH+9TzrDgtPsWZbsydGGrp9UBob55U0N3XVcTpXC5slmUwEwtAU0f6DoutDJPVQEg0nZizhMX5NHZc7US9X+IfDR/abftapWzaCcCKK9aDE3H4JBUTINq01HqPvO1rVno646iqIH6mUjJRVkDp+sz/z2CMH/TuzPEtHv/gKjG4/vmlfik3kIOjVf0Kh0hnFzgEbZzQcM0qURi4Ifiy1Mmjn7ZZqca8sqJCFNbkjT+qEs3MjGuUmQracYOuj0qlTd88x8x0g+rs4jqY/OnJzpY15QIs6SGzbQcWBo/imV/vLyjQwJXlNKpoGvXUz2Q0aBFEL9ck65QsbXCOaF6upzs5b9no3pkAvgtZkocE4VF7F8eAls0TQgeAnl0+CNZZFu3p2JepOo74qGy6YMuZZtBqaJtYuD0kEP9+qoqXfRZZE2ILjf3OFrItrUtlo6OoBz/eO5bwXttqzg40t8xTHQONXQt1raCR7BHUM3WG/oi4mQe4I67Llor8+3ra0t5pSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199015)(36756003)(86362001)(2906002)(2616005)(83380400001)(54906003)(186003)(26005)(6512007)(52116002)(478600001)(6666004)(38100700002)(38350700002)(41300700001)(6506007)(6486002)(316002)(5660300002)(66556008)(66476007)(8936002)(66946007)(4326008)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/cnSg8PephbQuwllRuB1whUlJy75W1o7HqjvIyPltmaVD0zoRky7wuXWLe2e?=
 =?us-ascii?Q?gbX1KTr/Z87shCI0lUSXSyW2aSpKxizVuXUDv5/iLOvrTi2uAmTTF9EV3hmJ?=
 =?us-ascii?Q?FNau/LG2AIo4QXAh4YKcMo7XsSFWQlg03kou4QPkER8nPihVMOzoCCgptTb9?=
 =?us-ascii?Q?+OHLG+YKLSFnOOy3KlMVPV/nKnVwWH4Rpz4BCig/Sss7NelRtZDszOShKC2x?=
 =?us-ascii?Q?Swm8GPxJ8Om/8TCXZ3+WVm/31Z2EvSR69BE+Dn0fntg27sdsu7Ze9sFKurEs?=
 =?us-ascii?Q?Vmx8+3hYV/f8h0eROkBYOIm7g4Mwi2nQ6WsLWNgejGJ0xO3L30TKlQQmNwOe?=
 =?us-ascii?Q?EQZkAhkxwDkszKt9GbZFGlZaS+1+InNFonyFs08CwocuhiRXlvHG1/yd7Ot2?=
 =?us-ascii?Q?yL/P5a+rriCTJRWx8ydataUnDy7mv0i3JjGHOnea600T8zJ/srepDJeRxkRf?=
 =?us-ascii?Q?hRhHEsMN3Q8juiArg8ZvPqNLKyTuP5jW1DnFKpQuEZmmAsUCYR6oHFY79WIK?=
 =?us-ascii?Q?sX1uFp9MdQhlxGJ1Rt3eMak0vDaVxnKp2PUngY76GtbQiK3ZgGgF/rSY5nfa?=
 =?us-ascii?Q?Jm8c8EoMjupn+noYYmYo4Ylnvj+eiit3cgSGK7kcGPtTzHfFcm1dKcwFwXJC?=
 =?us-ascii?Q?CDmLtt3vlu9QnxrflZ8A2CPPMj9n59AoWiSNuChLGbuSb8oYP6rGhioDyC7p?=
 =?us-ascii?Q?ka4D6bi02kLGhm89dy1UdhnCZ07B82hUesOgaQZWgvW0mmemo5tM01YwxqsI?=
 =?us-ascii?Q?pzOXGE70hjOHJmcXJeFCG2Pf4U2rya/x4QRRGhJogqCi+UNf7HA3kmQqm4SL?=
 =?us-ascii?Q?EL2RqBKJPVjPWAkMB9RNJi3ict/JED6EbfefpzOoh8V7sQ/oPOTucoM1zLEp?=
 =?us-ascii?Q?KYbE8s3BkDUiHY06CbhZoP1DO/0uyJHfXByshvD3Xgch9ExO98wSe8biqsrk?=
 =?us-ascii?Q?NzqynV3VD8WeWc+62w933D5PGtNqBa3yPInTYlWbId1PgIbfJL+dA5QaISKL?=
 =?us-ascii?Q?PFSmd1Vq9IP48xMc2djraqacFZM8wa2MNLg5DDHzDkJfGyIduFMsyfAFjyZT?=
 =?us-ascii?Q?/FoLueCZdl3K/IJFrdKohNn9RkyT35JpHHn5gYY333WiNldtUMRdmwtAtPCp?=
 =?us-ascii?Q?Po7GkvRFcpXqsA2bPlnQxHwbK/7tXPFgptbJX2xXwLiiybv/rnvdqapZTbaw?=
 =?us-ascii?Q?GyNicpdX7/+A3wI9M5dU+ai8u19KYgGb/6wUlrOEaDZ+R5toc+gmpVHC/N17?=
 =?us-ascii?Q?r7feDc2+YQ2zeMgCFKPBPN4v+0KacMpQITCMZ/SNei2GuZX+Vby0OFQPYtbf?=
 =?us-ascii?Q?9c2RHMkeHhdDHZN7JfYilitCFpedvkgJc6RWuwvK0rmapwHTK19I4z5tIe2t?=
 =?us-ascii?Q?kd0Rl8nGc7JcVnRaQBf9K1FqK0o+3YPxTiFIHYPvlkwQpVG/Vk41TG75A6UE?=
 =?us-ascii?Q?gwQvHVu3Z4pQbfj/8x7Jc4d+2yDldoK3pe7KXbYNH4xOuwPxH5Qx+WEnIp/+?=
 =?us-ascii?Q?6K9ocXHARh56KCspvj4EaiwZ3zDBWItsCmxFEW8zlxbf3csaD3qu2Gbn9VEt?=
 =?us-ascii?Q?ccJdzih6R/rDXwKaLKfEXlTlg04i86f1PSwl9+6ZXiIhb+Dbil5X3pUaYB59?=
 =?us-ascii?Q?9j2on260FLH4Pp5unjmu0gw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1780080-7c99-49d1-720a-08dadc9b7e16
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 23:49:24.0734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0OL1NZU0JtYw0PIUm7b0yAmqHNUi/Y47XGKV/6SJnct31Wag4SCOqYOtuRG1pk2OVRzSayyh7Zzg0GZ++Qo/Op7MeR0tZgU6qbnqlUCdx/QvWsbM1mJcs3J/l61VrRE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10726
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

>    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: ports: 'mclk-fs' does not match any of the regexes: '^port@[0-9a-f]+$', 'pinctrl-[0-9]+'
>	    From schema: Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
>    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: ports:port@0:endpoint: Unevaluated properties are not allowed ('clocks' was unexpected)
>	    From schema: Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
>    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: ports:port@1:endpoint: Unevaluated properties are not allowed ('clocks' was unexpected)
>	    From schema: Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
(snip)
> I'm not tested, but in my quick check,
> we can use "mclk-fs" under "ports", and we need "clocks" under "endpoint".
> So the issue is not dtsi side, but yaml side.
> 
> I will check and fix it, but it will be next week or later.

I have investigated about this patch, and it needs extra patch
which I will post if -rc1 was released.
I can merge this patch (with small fixup) into my patch-set.
Of course I will keep your name. But is it OK for you ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
