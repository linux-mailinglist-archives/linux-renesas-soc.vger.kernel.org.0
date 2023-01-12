Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD246687BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 00:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbjALXH3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 18:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbjALXH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 18:07:28 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9696AD91;
        Thu, 12 Jan 2023 15:07:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNtysPpQK7J5nF9teVxsKwC7ld6TITlFUEx9NoCrhwns8HwljG1y0h0Va9iqVsayBmzunWWX6SzRe4QgnR26AEuGTTcuhJ20Rvakx3ZDIpkrOlRYEnD1CyySDkBqhn2Ow2gdomad7K/tzt+H9o9CPlsA4rIIR9eOJZ7tkR4rrbAs4uF8QH1f+0rHK8NKdN4I2mC1TWX8oFJul78Vj84yJvkf6Sn35WwmG2mDIY9JVuVeFhEML0CH2wLsKetGnDa8KIRgQuP3OkgKEwCnzhbMpeuU0fjoSoj/rLFdtb9/LQQ3vC0bikFx8zfLalwiRiu4XDtGIze4ThsEycbb8Dp5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awF32QOCfSkp3dvKY5876KRtte954rMLE6jS2MZOn9A=;
 b=lhLksAYUcAq0NN5+b4QYvuWXEJSqPjDcWpbEaz8hFv94y4LKKTSn2y0itbftsXmgEJviaj9HFQuCbbh0hSO1AeK42Y/z95vSmdBVX3DTZ9JGa0MApvJdNrl31NDiyo1ImDySk0tb1U9ueTI5i/sa63rPq39itGb3m3aT0hftOiw3YDWNsJ2nx2Sy+hZexJequA8Pu7K5apWT5jTOQpUvYV1zCsw1RR2OeUNX1f+jWC4hiD9hFePqNaSNFk1GYi5epoYQ9pOFDcwETqI7k1KNCaE+S8uWpLmiGOGx2VIDbYrNrOolGDm/dvIuHJL4K3JNH3Df7+tcbPTSHh9mNHit3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awF32QOCfSkp3dvKY5876KRtte954rMLE6jS2MZOn9A=;
 b=ZZqYlYMzfIP2bBT2c8v/gHiZnzRVfe1IzhqYkQSmjA203y0/vdhSnxb2+WYJ7rcglyE9XgzziS9feSwYq2Zpgcu26sKvCUgEJM74l2eCAQlHZn8wNLs2nCr1wzR21M6epehiEvyiCwWpdhSWP1R0fRYF41Wtsrn7+Bcb+yRZ9Mo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10050.jpnprd01.prod.outlook.com (2603:1096:400:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 23:07:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 23:07:24 +0000
Message-ID: <87a62nbbdg.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 0/8] arm64: dts: renesas: Simple-Card / Audio-Graph-Card/Card2 dts for ULCB/KF
In-Reply-To: <CAMuHMdXPS5zToCU-C=gQB3n6=OXzmhMdtVGbCn1Vk1GtKSZGwA@mail.gmail.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdUH-CSmaKuM2HA-5j5cP_c2pygp9DqyQiOC9XkCUuzCKw@mail.gmail.com>
        <87bkn44ne0.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdXPS5zToCU-C=gQB3n6=OXzmhMdtVGbCn1Vk1GtKSZGwA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 12 Jan 2023 23:07:24 +0000
X-ClientProxiedBy: TYAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:404:15::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10050:EE_
X-MS-Office365-Filtering-Correlation-Id: f33fb480-a536-4f27-663c-08daf4f1c42f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f4ekqeTW6jC+BdcfSN53cVp5E9MCnSHpTPQNduCyEuDX0qVPXcZZyiSui96si+XdhFN16Wn+WIdth91mAree3bIDd5j2wHgf9kHh4PdiF65TlMGozMQGp2y27PYbiMa4K7DwzX4nVIKnpvUR/qSm6ki2OAUUF1+g+Akx3jKNv2Dw8IMKMAX5T+WcnoQ9hH4yMGuYyAklFMn2YxjlRsWqUO3jrd4TQZQHLid+E4It8QgSb1E4hRuou3hoKwenuHK8y9A6t2YA/wYCBS+GJfJm5w7hHHXBs48G50pYZuG1BqXYU1a+q5w7sVHejm9/cp86kALKmUC6eatkx8qRjojmxwXipytXjL89pWHgC7WOih9y1kLNJhfhnKJ9/wdRUtVRTFObsWeBkYO+2U9H5fawZUIFgeOKcvpYfvxrOzed5FrrpyrCRXtY5RcT3t4bUQRyu221323V6fgeb7DfIWEcA0HmWXFDIZmBCEzKBJkmuQowv55G/9XRxU7jK3Jos8qI+g6qtjp9oqMKyIhPFoUjpG8PtQhZogvp3QcMjZXRgq6sCz0dSzOLDfl7k9FCi6RmuU2to+w+PYzymFphh98RGDIXgW7Qnw7T8SzBixNeDbsJOfvqdhBFOZMMCQGCybmOw2nDCZNwKXiLgD4OJ212NLQHktAkX4ypvulk7nzxTTVOPTibUHgXK3mqW+9ujJqQvr+gG0jwqXvDFGQNqlqCrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(36756003)(86362001)(66476007)(5660300002)(52116002)(316002)(8936002)(4744005)(8676002)(6506007)(26005)(6486002)(478600001)(2616005)(6512007)(186003)(38100700002)(38350700002)(66946007)(41300700001)(4326008)(6916009)(66556008)(2906002)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y9sItGagba1dhxAimOquud+Xx0+6THsTvvvbAWPBt/TuLGZE/rub7Bpm3lgi?=
 =?us-ascii?Q?waY1UhC7ewAbTaZTox+wplQGO/mR+bbgEsCG/nBAH79fKk6mpJ3zdEmzo2tf?=
 =?us-ascii?Q?LBlrLMF4cSFEQlvGMym+jeu0Jv/zfcT8Rh2s0/WGy2OAoG+6Qu8aKND0Ty0L?=
 =?us-ascii?Q?45w5LzpMjfyprqDMhIAlFfZ33KkKYyx66GV6RVSjswFsT8NTa3MjIyuVyRkh?=
 =?us-ascii?Q?18wH0uFjGRZva8JBq9npwu33umOS/a8Y2vc3SQPamRuxZT0m2/pvxFVgvn2V?=
 =?us-ascii?Q?xCO9xEqaECdqkscps5DNCxFUDzy0uta1j3Q10ECUul46vwfSg5Gy1BDsbqEh?=
 =?us-ascii?Q?JtZYPS5bAm/mk0uVUC0Is/oaVJxRkKYmQujxFdpYPPOGMbK5rVDY86SbQkjX?=
 =?us-ascii?Q?moV2bpavEVvlcSwLlyW1PSSyUmT2YkvOV8istQrCSMcYqNZ4rLoBaQUSiGic?=
 =?us-ascii?Q?+uL5NQVzv8WkzSe7wUuLQRFh4Ly/8zBiTVrEcuwDIgqoildQoYg7B1R3ysFd?=
 =?us-ascii?Q?GUcQhLu6X2pazY58fiKG4Th6FMCBloLJS55dPXK9yd9C83arwpDrvpH4Kdtp?=
 =?us-ascii?Q?DhtRVkOSMuQEhCKjKLbTUChVwkPfzNFwESCZojWgWAnENLk3RyDoYyoSLdR/?=
 =?us-ascii?Q?PwEUKV0iH6E8JTlvcDJu204fhH8HF7ZGpDtfzojVkDLa11jGcpNjBlDTPP87?=
 =?us-ascii?Q?ozUDnJCbUSEqOkzs+hEmGEgP60b/yKBy705X6idowdoKvV6eO1v4JhCjrxWd?=
 =?us-ascii?Q?MfAleuajyY0CO34dJ5vXx3DlaO+iIVXry21VhWoIDaI9rr3jCJDsemQLMO8T?=
 =?us-ascii?Q?KDKcWqyvKhh6duybTh8Sk0J+/iWiNfxmd4fdwICV3jLG/eqgHMxBFk8QQQ0e?=
 =?us-ascii?Q?W/YwK42lICt98insIK3ems7KX9/Y+Dl5KDNyQW64s/7oCjIy+/465DnqGrdw?=
 =?us-ascii?Q?+57vw4LnuySACCOoD10yAc/Al4Uhrfu21mHMlacb4xePHr4SnP5d7pEWukjL?=
 =?us-ascii?Q?JaQCAeJQ/4XV40STBy5TW0SKdxX32Xi0nxQLKhRCZAugNeyPj6rZXOd6xwUQ?=
 =?us-ascii?Q?BBIdPvKhu7Vi1HxlKCk8+xU1nIwPiGYak8jS+HImkm7GU78ZfDEFyz5INrtd?=
 =?us-ascii?Q?G7ZUIWgkg0PVyykyNk/t92tJNPIbdhH1Q26ErAQFDyWDH5BnQAEDkxAqPx/B?=
 =?us-ascii?Q?fO6JhsIBj3+Lrwj98wh5pKb4dz9kXXmcDUZ0kqPnIqWCyrm8vDePb3sQCHcz?=
 =?us-ascii?Q?QIh48Nwegd5sIljuZISBCSVX8EMPLRkQWyPw72nNVc+HzWaJU2k+RNrY5rdp?=
 =?us-ascii?Q?AuUXr41Gp5gFF4K5VIy4OKID06bNdeUluFLT6sXPjvSWxdeBwKwJwdbB6PoB?=
 =?us-ascii?Q?UfY1UNXnR4WcAtk34ByOX4xGDu0vPkIa78rzyh7PJTmjl/4yQj0y614AJZ7U?=
 =?us-ascii?Q?8lOGS7Uk10ni/ENFfNNwB4i1tysOJjwVKC+rBauaBWbBA6ooPDhTFYte8+s4?=
 =?us-ascii?Q?OiOUOIkyyqSCQsbuIYr6s7bEcuc11IlYRXGSzL9EK+fiYU2EYLEI3vNY9msu?=
 =?us-ascii?Q?JGPw+pU7mcY6x5uJWdMVPlroKmHgyEP209wiGCHmHtdrxWxDy+KGysG44b3q?=
 =?us-ascii?Q?hZbI9UHVrBwcanTRVYY4VyU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f33fb480-a536-4f27-663c-08daf4f1c42f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 23:07:24.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ylt5umJO4lrF8JHItRlSlmPY1bv5vMUy0/5wCsO/gc+kZv2AZxYRmZTskOSwOakJugvsADKzLUU8+95ypZZudw0iaszlQNxWU5MmYit4BJwyE5MzuB5kRt9A9HKo1WC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10050
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

> > It is used on "Simple Audio Card".
> > We  need <0> if the board is using SSI x 1,
> > and need <1> if the board is using SSI x N.
> > It is not mandatory if the board is using "Audio Graph Card/Card2".
> 
> So #sound-dai-cells should be in the board DTS, and never in the
> SoC .dtsi? Hence it should be moved out of
> arch/arm/boot/dts/{r8a7740,sh73a0}.dtsi and
> arch/arm64/boot/dts/renesas/r9a07g0{43,44,54}.dtsi?

Hmm, it is difficult to explain via text...

On rsnd case, how many DAIs exist is based on the board,
and its connection (= R-Car SoC).
But FSI has fixed DAIs (= SH), thus having #sound-dai-cells
on SoC is not strange (= r8a7740/sh73a0).

And I'm not sure how it works on r9a07g0xx,
it is not my drivers.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
