Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F18D66D315
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jan 2023 00:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235509AbjAPXWH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 18:22:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235921AbjAPXUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 18:20:17 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2109.outbound.protection.outlook.com [40.107.114.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C02834C2E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 15:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDNrdPpNxsOqFSp6TfwFSuwzIzo16WcgnzzqHz6SX6bc3FLs5FpyiR08ZPVyaUhv8jlHOeqw7NohnnsqFIN7mdg6KBcJ99lOHPgophHZ1ts3mwZwYKzTGZ8EzvHtKVeMxabGTGCak+RIDOzXOQWqDe98Yy6MA96KUYUIC19lvWDQ3WxlPYYE1wYm3dOu3Y7neZ8laDrZIQYjWdU9UXACL6MxoouVa6O6iHF0FkHHFUXtzloeTdArncvOIXL+kKghLIIU62RicbhGdI20VyTJ5NwWYtKcNmYkyWS5Bl1BYtFt7MeRNja6l188u6EQumGKO8b1ndHfYXiaKicn6Wu1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zI9lY79Zc1x+Gk4D3V2ETa36Yv0JUanIRQ7TbvtVAgQ=;
 b=ZXcNe+9OYhI8niA+GWCoBTtwagLT1VqjANlcujtwU6OVUFO5xI9H7ina2UL0Oe1gGs0N+fsprX3QwVn8nvL6AiJNZ93SGGxv8Xf7MwGrP/mMU+dVH799FIgpSTL4hdztpNc9gDWqubeHKkBKROQ5KCdQTyfDwK7ocm9kBVRyxNGfqh8/5VLhVrCemfiiKaWUt5cLO1V7JFz134nO9/3FAFK/XLbW0ee5kiL9kPVaYemCfxTejvgnU4HOFQOC6TsxfGl0Sk1eepE6ZBb9+Wuyc5pr8U2JqtCqcjbKkERLJpH8BA3PAj8SIZu5NjDAKzssc5iBpnOJn3yTuqWZbooGXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zI9lY79Zc1x+Gk4D3V2ETa36Yv0JUanIRQ7TbvtVAgQ=;
 b=DcY4J4cjQmkZfCJXOK/XFm3g4AVJs4TzFsJC0qIlbkVlZUF4N/duiBdJjkjg+QhVaLeUovzFV7qK04PcJRHrrM86nDVcwkoAlu8o1S9m33qRt4cFvBqMtH/rLr60BKQF7U5mux3JKB5yWwZb8+qnDG/8NEsZKOZADVAQTJ6Rhxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9973.jpnprd01.prod.outlook.com (2603:1096:400:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Mon, 16 Jan
 2023 23:12:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 23:12:26 +0000
Message-ID: <878ri22hwm.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi MIX + TDM Split dtsi
In-Reply-To: <CAMuHMdVr-c=ht9GKkvSxdokqEoZTuOk41hRzXL7tpREy4+Pb9Q@mail.gmail.com>
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
        <875ydbi40l.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVr-c=ht9GKkvSxdokqEoZTuOk41hRzXL7tpREy4+Pb9Q@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 16 Jan 2023 23:12:25 +0000
X-ClientProxiedBy: TYAPR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: 80be5632-7032-4e81-5db7-08daf81721c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C+KqUR97nEFTfgKPzHwCUbA5aygCYaPPtV6efs6mAPanzDAN5BnroNwL07puz03vx+/U0X/fYBxptkQ6TvBZ4Cgd46+8M8djzLdeHqcQ28FXjQNDGYWj4ohjjnMIxb3r6YX8DWcHZLP/SOB90Rvk+S4Xap1F4VjyvGorkM5wkVJdie+E+Pz7FI4nGGWPZO45MI27GWQho1aGLwmt2Re0cUPZa/qGiCkeAj98mScEC3WFYZ0QMj2uzFRiV4p9byeM5XwPdxcHPfn5Fc52OTZnZ8ZdRzlfQtZ3OTmn3aETlAUqVcFd431jfyS7d3dyRrBhnndvQ/xfq9p06lUnjOx/FlkR4HJ9CPtXpuxYBS7bD5uuNCbTLtF5kc4vGJwAKcTO2j0QQnHPCrZloZQOLF1/WTvaIc05w8hnGcKRgJ084tOY2I/KHw+OMdbKkYnmBUKVixlQkq7ORBm2XmxXBMxS5ms0KpqG1TE1Spty/Agry1m6TUT1TXBjRH3L+ChE2EGedp8ya1HvoCXCZhPRjQxAfgcDfu+Z8MoD5e/lh2GZO1Jbks3AvU1GyRrmN7Ln89mf1wJwhDeEGE8HiBxqP+mO7YRo05rgfLV534GIKR1iMFblL/VYOvADGa5XbH1quPrfboNzddy7tSvwNrjY5sIOCwG0cqCziEYgz0lHhWiemSgZMU2xqDBg7AN0lBYR+Vlfaoa1qZ0oMVhK8EyX9RHGTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199015)(2906002)(6506007)(86362001)(4744005)(66946007)(186003)(5660300002)(6486002)(26005)(8936002)(36756003)(66556008)(66476007)(41300700001)(52116002)(478600001)(6512007)(38350700002)(8676002)(6916009)(2616005)(316002)(38100700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R3xuOlgQBHNSjwBCxVZA/7QU77YNoSNKu8koa2r7RIbJppXL1jbvBEtwjC8R?=
 =?us-ascii?Q?DdTe3tkUkJp65okB5z/oK79gls9RcbOE/rc66f9L0fjgLDsuDviCuEepbYOe?=
 =?us-ascii?Q?+Nm11lv7L+2RDISfU0LBpTzB/CtzjNGTySyJhtPzxl68xw26c4LB/2EDuQLL?=
 =?us-ascii?Q?1HNyQZoUU5of1kfsQeclvUpSIF56SX4SgGy8wS1Gu/l8pXgx7aju65msZ/6G?=
 =?us-ascii?Q?TDVkcViQz/QfSUv63Mkv2UBArSEb0XLs+y1cqPaA8TI1uuOfrETR5/DK/g9k?=
 =?us-ascii?Q?LuAWDGiXgKtPvN8bwz9+v4FI9UZy6vHhy++360GRbTeRJvorT1av71HxON9R?=
 =?us-ascii?Q?jItJo4ZWsdc+gKTRyvnA1jTCRXW+VAUX0Wab2blnMS7yYSHRY7r6AmOcWUhz?=
 =?us-ascii?Q?W6P4xLCSl//ZRZREJqTe2ERE23wViTLmt4XxEUoXFAqiSytDE2s38BFGmYEx?=
 =?us-ascii?Q?7DyzkVIvTcfair3x3nI/Z+To0Rn9gN/ajnrKo1wMpUroolOI5VPIBC3HbmZY?=
 =?us-ascii?Q?bEXYSfxr2G4X2Lti8sFXPpLAmPhrWwOOocXlrKHkPobpXHlwnNFqDLPZvjVZ?=
 =?us-ascii?Q?AxkRyQYyA+CTkDiYdlHQMfYXRH/Snk8ngN0B4kq5eRdNPx5px+TmGWf6OGS9?=
 =?us-ascii?Q?q4AhL2jpVw9ZH2UwzFrULbUGWrOu4/5VwG8bnYlJWC9R877Cvmv2FuxXEHro?=
 =?us-ascii?Q?WxG5djWyGDOMC+1B1TPW8l80PR1IMurYy/56SF9PyU7zbS7AgNfpap3CuHFm?=
 =?us-ascii?Q?B3pizOTyQvnz5G97qBaQDIaI45fHS0dHUCMq8lwnybQYQTyE+FJyIDB77QuV?=
 =?us-ascii?Q?yVMKJmFq//31HPhCJImK+cl0AJeCq9VAYSBa7xb7cS1CUKBaVPYPUS/6Wblm?=
 =?us-ascii?Q?rG5sAW+FMHrfcg0nEe+985RJl5WA3JVyTFCR9w7y4MpcsVYrKv7KHdD7C5UK?=
 =?us-ascii?Q?RBchx0xGIaqvbInJQkhhQUcwSPkZW+WIE4dSHd24gzdyKcyuqoCo+LEgOWcJ?=
 =?us-ascii?Q?HGKiMzZG0GKZtep1bAlUfcMHSc1706YNHYbsXjSqgUMvKzosjtexb/PX2z7S?=
 =?us-ascii?Q?H4DrvtKZFnp4ut5cfzLKcAzhHJzaBf/OVOvIw2XGKq8KdDoXb94Ku+ewkzia?=
 =?us-ascii?Q?enXrsXP3BkjHXdumKYrFFgTy33T5F5rj6JC8SsBdGKWMP7fY1oK56/U9k98K?=
 =?us-ascii?Q?hHyjib1WUT0o/Ph3M54YLNGeOeYmuAbgpz2S4N6GJFh9V0yc7IM7ofE2FL2x?=
 =?us-ascii?Q?NDjnf81saes6X1pZeEfogYMo5OyFPNHsjATQDMguoBKZqzM3hs9ykl94saEK?=
 =?us-ascii?Q?LOC9aysGVXo7SJstRsdz4Gcc4Sq6piMl2mTi9AefIErVxVgpINQXYhCdFfp1?=
 =?us-ascii?Q?H41z90sDMi9pnvTW15kZGVBsOb4lxpHR4ci+/5WOUkhPXJHgut1aoUNL1afv?=
 =?us-ascii?Q?f76NLC1jc6b/cqs9/wZUL8U3zL/cjQxV0JXf0TAUTnmmFpj/ahTYKPCzmg0U?=
 =?us-ascii?Q?gZiqiL/uuYvJi8Yirvikme2npn3EPfMbc5twW3pVRngY7hZBv9q2Xfw9SxJI?=
 =?us-ascii?Q?523mXRJE2ofPAMyMY7bcHgDC3R4RWkw2/ebcfAmZJGYhjdDmMTpu7uTL8Xfr?=
 =?us-ascii?Q?xoJCjXr2v7HnK0Frua6L7jk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80be5632-7032-4e81-5db7-08daf81721c0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 23:12:26.1787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3Z3zr1hQDAI9tjoY113pcCVIjPcXt+b2QErpbPsphmzVN9Lah4XRkH4qKvct6zkxciUqebILUWmRin+GiogtW69BM2D6gHQkVn60Hw33vlMNB1CjBcQeH6CwChAdNJX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9973
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

> > +/*
> > + * Note:
> > + * Because there is subdevice maximum, it will ignore HDMI output
> > + *
> > + *     (A) CPU0 (2ch) <-----> (2ch) (X) ak4613 (MIX-0)
> > + *     (B) CPU1 (2ch)  --/                     (MIX-1)
> 
> Shouldn't that be "<--/" (also in the other mix+split patches)?
> No worries, I can fix all of these while applying.

(A) can handle both playback/capture, but
(B) can handle only playback.
So, above allow is correct.

> > +                       reg = <1>;
> > +                       /* (G) CPU6 <-> PCM3168A-c */
> 
> "<-".

Oops, indeed.
Thank you for pointing it, and thank you for fixing


Thank you for your help !!

Best regards
---
Kuninori Morimoto
