Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8095A5767
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 01:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiH2XGR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 19:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiH2XGQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 19:06:16 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC0674BA3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 16:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ro0Zay6FRyzXpxAYpZGVr4BRp/46fzISncPXpDnqr3WV2NV/cO1WuuE0lnwtViAjoxqWIyYQfzUIUDLrV+sMLDhmawq/MQNRfz5exApMbBLwpnm1vN61aeRaYgHXrfMHpSo2gIuVc8pT7QjCmbq3i9xiwzhPDNam+NOcyEF0esnHh2bJ+27edXQE4WCjtELfn0fh2Am9sQ7vP/xW5CCOR3lBymjOiE3drtFeQSVu5aVgYmyBFiL735RGSugl9CSRVUlYOH8Px28s4aVejG5iCsvD7tjWxCifSYf9i9ZouRYYZm/8V7XXc/VS+P9AD1EuzLAnTFZdDNBgJvxFRz3Dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRJrPL3DwRDBZx1dM8EdCskps94VFxeS4Lj68j5XX4k=;
 b=KIkxuWb76feaNJVD0LkH6ePI2qcmpRjnb3UdyGjM6YRtFlp7Fwsl8rFf9KV2G12gBwR69QSgXuz8G3h3CTY1ftCP6ocJHhGeTm5I3jarxhWEHPLxYUX0M0sm0PQuqtdG+zZU6O/nLANyHLyjH/nidHMLbZU2YLPOiyNYmj+y0WaOlmwWJjKWQRkjYxShEbcfEfL7CNqxEvXzQVVI3rAY2+JEOwB2ygTH9gdv4h/UMSqQmp3GUFDjfF2E5bGeAkPlzG/JKjrXpAH6DQ2IAifTEJEjzs1z1vYcMiMLe9SugqOUp1+vx/NLnvmJRwpqf3/ZOqSEsIq2SARv3e6+OfP6UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRJrPL3DwRDBZx1dM8EdCskps94VFxeS4Lj68j5XX4k=;
 b=Uw5feGCjzf1AlwDrCLTdGo67eVzy4QX640n01c/snpCdHcTFrttES8rcdKCiJ/2/2rDP1NPgq8qbIu2uoPVzcZpt0VATgw3A7WFS4JVFRx6C/5ud+SoCufGjmaZxdriqZmDICyTYwAIlOE2WBFwDqPZ1yNPzO4VqQnV3ynuuZJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5930.jpnprd01.prod.outlook.com (2603:1096:404:8055::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 23:06:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 23:06:12 +0000
Message-ID: <878rn66468.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: add r8a77980a.dtsi
In-Reply-To: <CAMuHMdWEC3n_jzt78pvO48F5AOSYz77f5+zgetc2tG8PdcU-3g@mail.gmail.com>
References: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com>
        <87v8qj92cu.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdV39bTp793CataarD8mu3q9=N00m+vZQ_7J+doaKz+5+w@mail.gmail.com>
        <87czcjeqpm.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdWEC3n_jzt78pvO48F5AOSYz77f5+zgetc2tG8PdcU-3g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 29 Aug 2022 23:06:12 +0000
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c61e263-85c1-4cd3-cce3-08da8a13113b
X-MS-TrafficTypeDiagnostic: TYAPR01MB5930:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6f1ghUQ3fUVBWWGMbhqTD2zXG2v85fwSle5qIyRHJ31SfExVMpZ/ep97J/hwMKz9vshQQ2LZPp5I83sr2U6j0JKqAOmsCzOE5FGriJELeT7FEN6af2I+AorofY8TC9TQGXTx0joMt/M9aInNBTU8f3ZUSbzalVEKEpC2rjb1Hy0rb4osrtJR0pCaSiA8qrTn8ekCWjPNR517FLx7nrmezmSrwoW+nihXXkEWpHfftLvpu6C64Ewxj+8NrLbiSNWDGwCdiuDhPi+YYNycFeWEtHxHrIwxEy5aYBJ57Z2B1eXeEMcqqp72CnCcQbq3zD/cvyUgVHsYMJQp+zCZ2gG/p7suJZqJIA2ucVHuLCUas1sSk28yVmj3ABX04LGhw7V+RtwuS2rShwgAm8bWtNiH7zgFl/pIDwE6S//yacJGrQNQpEcDcShSoVXpaG//fDfvjrrIuKay9PGqjTrezEW0SVUlqSppQk7WhP345B1/1yhT62pW/SEm18pViFL6GjGJmXGNh/0ydzoyh2ck8mzu5pL8ke36byn+W1uV/x2J59/x2QSYxphTaAFA9/luELiwrz84M/WjyBYQG91JqFZPEENPI9lOqm5VU919dXqaYK0TuMy4ysagIwx7SIm3/m/w4ApBN3UdGjqRxzmZc9qXCIYyCzt3n9kIpubgf4NtXM8WyaKFwzLdFFT0COqhMCa2HLdGH5Qda3YciIB8JxUYnPISb6MOyuumeeVw5tKVBqGSW4+3ozpP309NSaJkcvpwvLo1yXfIACDHEVXVOKlsWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(4744005)(478600001)(6486002)(66946007)(66476007)(5660300002)(52116002)(8676002)(4326008)(41300700001)(66556008)(2906002)(6916009)(107886003)(26005)(6512007)(8936002)(6506007)(54906003)(316002)(86362001)(38100700002)(186003)(36756003)(38350700002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JVKgOX2Ly7zzQkDd2CjVd6fOxnSuET8oPXfp5oO0orcqQBqx2LHFTfzwoiBt?=
 =?us-ascii?Q?RBp78ghwrlc4IN9rt1wMA0wZ2hl+h4dsO+RV/5dPZaCq1tDJFD5odNUtQEsB?=
 =?us-ascii?Q?HhRGQ2v6roL+CukHpaV94HcjVaIOb8qFpYEQs4MfkYl/8/Bxqop0SjpV8HZ2?=
 =?us-ascii?Q?tRR25Sx6bJUAlRm5f91vv8QrLS2QH0mnJDyYN6mYBwnl+pw4tya8uPfijbCq?=
 =?us-ascii?Q?FQJIcfPxqtcLP6GEJ9aIghJrBwmziiZgCDP0STn4MT0IoI2ZPq/DC+ZRfXlj?=
 =?us-ascii?Q?D6ffVsOdQwY8xc8WuXG0PEvciwIIJVTwt03Dw3mhrhnppXYl2Zkwly72mUW5?=
 =?us-ascii?Q?nCO9RX1FWIKE93QNdtDXuUnTDzbtnlYqYYO4hJfnnQov34JUXh1kX9njAx1k?=
 =?us-ascii?Q?nVAUIz05XD2Pz/YyVoS2VgcJylpk/MwUKyaIM3RI78Esd4+YuaDqC9cZzv/z?=
 =?us-ascii?Q?rc01MdgY5EtUyLSaUQfe+/2b0NXljAtEXElxpPGOuCGJwDSRuruRxIW0WUxG?=
 =?us-ascii?Q?G/Im4Bt8EZ76YDcfnq+XyrJodjz2klr9P4m39UPgbrygBkTYZc1jKk+O2N/t?=
 =?us-ascii?Q?sp+8QNeiupwCZU7i6ZkXoRabo3z5bIfMj2FZ7VgUo44NZxZrtaQt50gg5zKo?=
 =?us-ascii?Q?W480s/7WhNKXZ33w/mSUFu3dBY4esfaxW1da3b1PDpMLE47ZHV+wJ2pz5MhB?=
 =?us-ascii?Q?a85C0kNY4hX0UqTFvTxDQdFY6RFHWUGivJYQNddcI01Ia2h6YtS0R2Ov2eL6?=
 =?us-ascii?Q?AAT8tVDk9G1LKIhMONzAWybqFKe1zFPAyUSjnabik2nhKAhx2WxgXTnORQcM?=
 =?us-ascii?Q?4b+EP92j7QUp59o46F6aNNj9hHm3y93LFA+tBcs6K6kdWN7ju2GybHt111S7?=
 =?us-ascii?Q?Lhb/zr8cAxz8JqWwtrl3VwpAKPDCD4by3+lgieexqtfks8AH/wXI0kxIffF1?=
 =?us-ascii?Q?kh4ox8HFGVcqaJ6E2mbjPOoLS2YYM9a7+GClOyt9u78AO7jP5AfGsTi94D0G?=
 =?us-ascii?Q?eTl5xg6gtfXOvZdvpKrtf/8UlRhZoMcS+H188Kh10F6fSrorsebWrc7Tpcg0?=
 =?us-ascii?Q?YbYzcrI+/i/ZuejjHrSVUREEGhzgRH6XZnQYF6WGoaAcTHewjgkukisMORqu?=
 =?us-ascii?Q?JxWuVm0MHFmkpho6cvJUfUR1lpzaOvhVBUQ08UTlzcppuZyp/cU9dJBAwMQ6?=
 =?us-ascii?Q?kD3TEPEmlKuYbqmOygaadOiKbRvIVgH95DgwjvIDA0aaVRvFpNKcSGr0sGpU?=
 =?us-ascii?Q?CXvnGy4FORzFTKDs8ZlTlTwuHk6u/BBm4ay4rCo/jhx28lqdO3DI2o2SceB4?=
 =?us-ascii?Q?gZAspiqeMLdcCemGgwgTWagNe+CwJeVMbJ2ZJOHOfLZNjpexq6EVZ9wge2KZ?=
 =?us-ascii?Q?flSdF6ML7LoA8LtrVgsX1Vv4sV8Z35C7cjj64uArPl8uC2o3ZDNYEck2cgbv?=
 =?us-ascii?Q?zBlbZjxxWruYJr8H/PuBNI2S1CaLISFf9zC3UDKQ7qDYv9CC3rLC71UjkpoH?=
 =?us-ascii?Q?29ZDpcCDNqxcy/wts9WoGcAunzqnUVVJ6POf3jzjbjUb4BAAOSHZtcqzMhhr?=
 =?us-ascii?Q?OZ56fIu614yAhItdmg9nYPGl5fCwxRB/geNZ9ovRnVIPQWufsWmCUhR7zGIZ?=
 =?us-ascii?Q?+cT3e6Nz86ThC/YbE6g2Imw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c61e263-85c1-4cd3-cce3-08da8a13113b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 23:06:12.5895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcvwNcRtJ2BzCJzaPCfVb6/NR7YJ4qi9WHRzmHl+HRgFZ+bRdCI703Q0cB8BqQCwCSuk3F9bBUKvVIEUJRwZZrwQejZusBd/AQa6ndRM4StO2IoDDANmBAlVRoqcXkTT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5930
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> > > Please override the root compatible value to
> > > "renesas,r8a77980a", "renesas,r8a77980", to match the bindings.
> >
> > Sorry I don't understand about this comment.
> > Is it for where/what or which patch ?
> 
> I mean to add the following to this patch:
> 
>     / {
>             compatible = "renesas,r8a77980a", "renesas,r8a77980";
>     };
> 
> (like we do in all other SoC-specific .dtsi files that include another
>  SoC-specific .dtsi file, e.g. arch/arm64/boot/dts/renesas/r8a779m0.dtsi).

Oh, I see !
Thank you for your help !!

Best regards
---
Kuninori Morimoto
