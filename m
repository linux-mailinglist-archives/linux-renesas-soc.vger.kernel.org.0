Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9542B7A56DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Sep 2023 03:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjISBOA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Sep 2023 21:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbjISBOA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2023 21:14:00 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D0058E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 18:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTPbtpcNuSucnXVQbhRUeF9KD6LIccKdlX+fRnHiNXEHOd94obWhZ/nIKSMWFsl26nKInnGi2jKXCvx9jGoPPHB/wB6TLzxPfWSgR3ZGwWvxtkZTEg7OOCF/KC16KFbyJvi6Db9yWHqQTtEfjFM3vaGH6rNMx19a+JRJEnlGOGHd8sLXQF1bdsH9AxL0/5E5a/0O6/YVhzBgpZNghbifPCoSWYxP99dHDXraQGWrvQ3lwX/tnsPRCfCm3byFplrrs3uRmGzVR1DT+F7mqtIE7vwupQ1HRNkYJ0snQAoPrrzhqOwipMUeEkMp2KEVkl0BKqub7xFFWomhYQQUKxrhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQ6PwR3+d3LtApqBtW86gYy796xSrwPlJdijOWOGzBE=;
 b=HjbQuF8jZz2Tu6da5QNRijFyGySDFQEZXAMAhgDTNDwRbN+ye5UugkHhxYnthFNxOSoW/RQ1JFQ8NV1bBm6FzSCdSYNRznar43CcGGlYoYHA4zqkLVe2exy3imd1VoN5eg6alBC40oH6XxCPkfA4VitIr+/w//GlHC748R1teUwTtetGm6vlk6+ntwJ9vdIE0y6K1Y+rnwzhdgTrYomOBOVT8ni6T236cqt2Dk/NDk6kysn7KhYyRDajehSt0S8vm74f1W0QgkgQi/NBH+4Hb5+vY6f3WqpS74Br/TyDTvBsAskrS9EaILnto6I9qdrHI4jBsTBAkv0mvv4olnZQig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ6PwR3+d3LtApqBtW86gYy796xSrwPlJdijOWOGzBE=;
 b=dCZADDG39sQ03Wd8szai9TLNVfeIp5zIPS89YAuw6NXweROdbR/px4jBiuUDxefQnckq7OUFh9hJRkAq8iPSK/9FeSspFicbyQZUzuXdk6IpF05dFD9JC/hFPHpU0pfLnwgXmAJVEdEzJLKzDUSEkOXt4Nf7L2Kbl8ExlpYIdu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5745.jpnprd01.prod.outlook.com (2603:1096:604:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 01:13:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 01:13:51 +0000
Message-ID: <87y1h36k35.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: use multi Component for ULCB/KF
In-Reply-To: <CAMuHMdW_d_juuo01gbD81aHJ=bs8k3jXeiP7kkOzQDVxHcbzoQ@mail.gmail.com>
References: <CAMuHMdW_d_juuo01gbD81aHJ=bs8k3jXeiP7kkOzQDVxHcbzoQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 19 Sep 2023 01:13:50 +0000
X-ClientProxiedBy: TYCPR01CA0166.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d9a2fa-86fe-4515-e511-08dbb8adaf24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MtnEBQ1ynM6AwTx+/Ffh6ecv8VE3JwzZS/5S6s+TLHnO9rcgKOgneSp7iHA6W8arMIjdEGS6Oz0DQHO6Ctzx00JG82sth8MyNKtmu+eiftJtusI8zKqMUePADWaQKWeHCzu248VQOvvR8OX2dklQ+CWFLyG3rIWyKxfs2OwS0c0kf9obFhRzCr0EkItVQC899j0aRNoE/W/HsFhB888ry7whaDHxYUOpk3S81C/d3zL7O2vexUzwnaKpLEOC/v6uvmI5qXplcDVLVG+xQ5B70KuoHu4MRVTR/3zvUfM39z2zq93UTRp4tcb03j0Q0WX6Ex+o4esMUUkBRr+MjrFlE+43ioj4co0xEwJV0+ebtGgtz5LjQ50DdLVQ2yzQNWY3mlXswo/AvYLoeOJ7Xb+yyLGYK2D+PyolZsB0QoYdWDSMyM4IZls9kdDu8rGfPhYTurwEGOQmxsFOzS+0EWnImVaTFMiZ0DJsUpIG6Ec2sBa0tkNeWt3bxT3wQBzfNFFDMBdB5aoBjOIwkyd6Z9aXyIHtYmBrAHGcTO0QJXW0V/ARXNJMKsiSC0dnSV1cgFRn9rp9pwz7EX56xxBxtNB7d5GB7E1iIoA2u8x07KLkrjyWCw+3pqWQjmei3mLyVEFc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199024)(186009)(1800799009)(6486002)(36756003)(6506007)(478600001)(83380400001)(26005)(316002)(86362001)(2906002)(5660300002)(2616005)(66946007)(6512007)(41300700001)(52116002)(66556008)(66476007)(6916009)(8936002)(38350700002)(8676002)(4326008)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SkB1QIo4vNaO1zv1ioeUKsBfA0QgfQGPIbiypLnByy8blA3jJ1TS3vW+MHT4?=
 =?us-ascii?Q?TH9FVKy2FVhNn0bXGyla19tHiZD17wv8YosEwWsz+V9gFjXRRouZn2xgf+5R?=
 =?us-ascii?Q?g1W6blcYRGZanBxHZfxmIPXS+1irv59lBus94+COSahmGn9U1o8MGn+aDm5g?=
 =?us-ascii?Q?cBcWZyFa5gNvqb+Zac4W/vfvir9dF5VaeT4YUmQYQsAZO78mYG5dER7q7NBZ?=
 =?us-ascii?Q?MkVUTEDQ9L9ugaQAZGZ1rdtZtwQBqsiPGi58K5yb4I44/v8V3uSvS/i/9Td8?=
 =?us-ascii?Q?Q8f5KHaAbjsst9pXIOTCsRKuhNlBqWfbKU/X8yjHM9P7sVEdokK36xqSxQfs?=
 =?us-ascii?Q?GUtI9JxNPON4AEtdwbopBuPhZsLf113FVE5urDcV7nBw1dLyQuCmsDpDDGIS?=
 =?us-ascii?Q?+x51SFxnhGXyX5GWiN6IXF9I6u7NxruIVG4BlGxZVRgb09LN0DJ20kDB1sMl?=
 =?us-ascii?Q?uwRrP+Ok/1AuMU83wuC3+Y0m08AlK5YLYaUIkFoGlwgcEhbzFhZV6l5aXivo?=
 =?us-ascii?Q?HnwI/pJSB3bZEr0pO4lswV+dJdA3ECiNl4kRZ6Ena+X+Dh1JbXfT9nmGFdpZ?=
 =?us-ascii?Q?hPRQyNy3ZYDQrFKBeJJjs9a5a5gHoqIAHPZ+a7AI8Zgvn3GQa8tT1zF7rP60?=
 =?us-ascii?Q?3/T03ylFY9ZYUtjGgRf4gLWM5VrqJEDFqumbZ2NUaEhxSFQuCUbCET7Q7eJL?=
 =?us-ascii?Q?jMvNTCWzlisJcvF77BrjDDQklMd5MMNUVtoIW/+Om+vvfzgVeCiKKteFxVso?=
 =?us-ascii?Q?GtFvlizGMEsFu/elmTdWg+g4InA8dmfov6DzrSSCmxixDnoP4VlVskU1Xj3M?=
 =?us-ascii?Q?Z/D3+4JyIUEiP67SAMXNMKdH2rz91i00Oqaq61Ao76TT72f++BBfkjy3VwkG?=
 =?us-ascii?Q?voPPVzmN+ZtbEatC4D+9LbNMEg51+PzFxoFPls/tciecp9YomPuuX0CR3lv+?=
 =?us-ascii?Q?NuT5M5J7cYbGUlsxrE3xpjqDQr2IQBYBReNT2tjZ6DDQ9H85e7BGT4sCS2OP?=
 =?us-ascii?Q?2xVxad1Ux7vtXVhQf9fzUU3A0Pex2F1U68XrvlwSc8r/nykQ9YZCkkdBiSVo?=
 =?us-ascii?Q?U1+0RtyLCcgs2I6i2I8sDqN60c7W3763TcjXs6zEXJR0QVYCvMQwCjor6fHx?=
 =?us-ascii?Q?JH5GxzmwEFNfS7yyqQOcFk4LC+Sw7ZBbbaepnSk3XXPVwUetdcKy6zKwKO8R?=
 =?us-ascii?Q?G/m671gYKFMg60R5vn6Rj2XYCLLsYunecbIVDsSkYQD9sb6Gc/qi/6AgLC7e?=
 =?us-ascii?Q?ruHAdATUzN+ex6Y7OxCua4hWTjXfY3j1bCFwgnmbAWaK3tdiUIp+hn0/u3Wr?=
 =?us-ascii?Q?aRDfhatpV53r+KTSNYgv00goYgiP0uLbX4+S5Jc6biH5f3UoA7aYIZ2oxBrt?=
 =?us-ascii?Q?ZMs4e76X/CbB28D5Hk7m7GTVn+0IhMLvDixVrVc2NcNNJnccxWw+eDJ3GHwF?=
 =?us-ascii?Q?6YdnqTTyuqvTv0OL/lrY/M0VDZuH2IumwZ1MlX7tNTR+5YDwwGDqCnhgLv7y?=
 =?us-ascii?Q?Lerkk2Ai9ntL9nx6xOws+0BImWjp4VrjGrZm0oNfBp+rNltznFs4uMpYctPv?=
 =?us-ascii?Q?YHwA9bBoyn43mxDyM0HaWVhw14AVOJUgmFI6XUBhRl3fr5TZUUJgct0NwZ0R?=
 =?us-ascii?Q?Vay/Cp8fP96H9XMQZA5iZO8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d9a2fa-86fe-4515-e511-08dbb8adaf24
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 01:13:51.2236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wYEKtZUQv68XVgjVbcMUYMoTErcUldKRSXpptbUQCUwdVGkNepEZAMeA2Cjt/7wthcnuIyv7BgUcGFAia19n7iLo2QpFBUTFeHLPmYRS7YcjEGTvJND+ZV8w5EEx1QD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5745
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

Thank you for the review

> > +       sound_card_kf: expand_sound {
> 
> Please no underscores in (new) node names (everywhere)
> 
> expand-sound?

OK, will fix in v2 patch

> >  &rcar_sound {
> > -       ports {
> > -               /* rsnd_port0-1 are defined in ulcb.dtsi */
> 
> Don't you need to add
> 
>     #address-cells = <1>;
>     #size-cells = <0>;
> 
> like in the other files?

It is a little bit difficult to understand, but Audio Graph Card dtsi
relationship is "for ULCB" + "for ULCB-KF".

"for ULCB" side has "#address-cells" and "#size-cells",
"for ULCB-KF" side adds extra part on it.

> > +       ports@1 {
> 
> So now you end up with a "ports" node without a unit address, and a
> "ports@1" node with a unit address, which looks very strange to me...

It is another part of a little bit difficult part...
"for ULCB-KF" part needs "for ULCB" part,
this means "for ULCB" part is used for both "ULCB only dts" and "ULCB-KF dts".

If we uses "ports@1" on "for ULCB" part, dts check will indicates
extra warning, because it is not needed for "ULCB only dts".

	"ULCB    dts" needs "ports"
	"ULCB-KF dts" needs "ports@1"

To avoid extra warning, it is using "ports".

> Same here: "rcar_sound,dai" node without a unit address, and
> "rcar_sound,dai@1" node with a unit address.

Same above

If it is OK for you, I will post v2 patch

Thank you for your help !!

Best regards
---
Kuninori Morimoto
