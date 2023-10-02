Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5253C7B4B34
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 07:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjJBFqO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 01:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjJBFqO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 01:46:14 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2092.outbound.protection.outlook.com [40.107.114.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46B8AC
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Oct 2023 22:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSzoFJSOSGlWemAgYtSg1NpGVakCYOzgtehfJUqZ8t14uL31JOP55Us72MK0o/jOtRB0+zekTczOKIhJhwhwHdPrBBGk3Qj5/nSgRymHXYYrJnEQ8tYCtaDbimw+bbav5v3sgSg2LxgkXHAOuzZs9OPQr9kbXWPVS8Fkvf1IwCgFwek32lXjj0w8vfj9Vfb8osdXcgvn7CaHd+/hZNWvjaxBltzzc0AYvWfYG89pkDheDIsmEHX5rpd3GqmdMEiTotsYfeepKy7kmnRY4sRuIU/5p3WASZw0aCNRKrRkD+AYpwddJuILh3/2ZQ8lBskMsYGBLRrFIo/A86D0J+R2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh0WigS4Q7q3G0bVDbZGLRKS7TodzQri0k35wZ2vTPw=;
 b=ZxjiNXiA52qitml97wPMv26EzBOjZpNvdUiac+YQaW1ZjYEhIrbdKJgykYjbMBMS54GENHZAU6QBIppi7698G36Rw+VlcEDzOuNC9zdLAe09x2EtS79Skq0w2QDfAwAUl7ZZjZyuRXQfIYs+bPOkUK/8iqAm1aR45q4Nw9GkokAeMjnH0z/IdRtvq94+SRCzEklJUfgT/+OxpehwolpVYP/Z0fOv+xZeSRkDmMpapEK5G1CL77VDINYNWeFivDjjFcGw8Jk8tVwVJg+pJx0bNoRnPQOfEhwJctIShx2YzD7VcIY6mtrJ6D9Flso1NRoKwWrRq4omjXhlTBUGtqioug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh0WigS4Q7q3G0bVDbZGLRKS7TodzQri0k35wZ2vTPw=;
 b=SGz5vGceZexsa7gM0Hu/241LIuZNviuoL8v5ohi069zBscsoSs/ym5HSuifgXW7HcbwkfWy5yNeIkgL3BYVgysydWhSihFCHRb1AP1/FcRLmGq85nsdpqd6BZ2/pLG8a2opZIOihyTQwIpW/vYhIl8jiUzMNJ3qGwwJgRkSMFYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11110.jpnprd01.prod.outlook.com (2603:1096:400:3f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 05:46:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 05:46:04 +0000
Message-ID: <87h6n9efvo.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: Add R-Car S4 Starter Kit support
In-Reply-To: <CAMuHMdUY94ypdTy7osywQESayxP_wP5M7B2QEceuy8HZPskEzw@mail.gmail.com>
References: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
        <87jzsdim7m.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdUY94ypdTy7osywQESayxP_wP5M7B2QEceuy8HZPskEzw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 2 Oct 2023 05:46:03 +0000
X-ClientProxiedBy: TYWP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11110:EE_
X-MS-Office365-Filtering-Correlation-Id: db5df107-ead6-457a-4bb2-08dbc30addc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y7Bie8o5itbJ1O9y7O0yrnxarrEpge3NMYYYZdQs4U7oqt3IgM0HiDZVotHAEu/vXnWHrGCpjPWe5QQoN28rCDxj/41AfzZ/K+EYBj63LdHdPs4fvUEYAAr1TFgDzp1Xca1p8JvbKkEKrPHQpQoa7TII73WRBco7oocesUm28rliVYGx698CNCYrxcdWQW7mqvzHU15oiMT0n1/o/oI6FGD22WoWvWxQlJAUpJ3p4yLB1dUrtjQE+3hL5HRGNkgWcQSa1+JL28kOXN+z8dt9EYxN5fGDLkvWiu/oJWPV7QSKuQl+6Yx+hcWJnrit4aCUps/v22UKGwns8OQxAoioEU4nZcXng8SgYFAFlO4B60Xrs14ValdP6kPQ3c68pfNEttNDZIE7TpyfmBVrHW3+iG+B/069w4W0nAzqyNxbZiK83vrfl8mcEmpgZPS0eouUDN5HBL+TCMfujeBfuTat0odPKNvwcOeFhwri6s1ZfsPXnGBvF0R5VhVrG3nsm8ruU7vZGWEbvkscMyvid/299Wyqly89gNDLSonnntqOtk8JpSuqf02KKUDSiMXoB47z4/788oJOz0S1lwqLj/Dr/29WeiaMBsLBZCncMfXiZTC3X5VXCU9DNMpVN1kVwy01
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(346002)(136003)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(478600001)(6486002)(36756003)(2616005)(107886003)(26005)(6512007)(38350700002)(38100700002)(83380400001)(86362001)(52116002)(6506007)(6916009)(54906003)(316002)(66556008)(66946007)(66476007)(5660300002)(41300700001)(8676002)(4326008)(8936002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wnKwsoz03jsiC2pnwrkSS1RmeaSE54i8Qk5UVRQmUTb282egnWl8L3yGlIdM?=
 =?us-ascii?Q?Mv9dTR7TEGWTwfDVXjXeUF1tI09R3erPlh4ebauQcWt35//EgcI+ckZo3EZu?=
 =?us-ascii?Q?hfUVUNnhvtqk8SyC6zXvxvnqIaxvmfgcwPHAujOTfDc/NaVrP5fMIx5/Pr1I?=
 =?us-ascii?Q?/tHYk4QTvBSgUj9sJ+q1lU6km0XR6hpw61yJrFvIExL0LHodWSD3ZMSh/wJF?=
 =?us-ascii?Q?Ney/ejJ78upFROQqHVb9QX3PCbA+kfLw1S+oATOYKYyMt3Qsc2BN9k7zVgOL?=
 =?us-ascii?Q?jxeQ7rJlVBJAB615Wa+542VG7ftyoQJ0Epk3J0iz5maL6744GfPcnOzuXmRF?=
 =?us-ascii?Q?boxfQvgHwrsDZUCucWnIydipD++OGGA0dufinxjaAz3FIFtJxazfNXFgony+?=
 =?us-ascii?Q?cuI+QR6PEgYoeGqGUoTMMh3HJPFzfMYxeCxWhxhvFQ6mv6/CjdcTXaMlu5ux?=
 =?us-ascii?Q?7Rn/31yTDqu1rvo6gEeif9ZXxpF2zlyrAPg79mZTmrXuXVuLfJJ3z1zWOtrh?=
 =?us-ascii?Q?75B8fTyWVc2odmJ2TPZS5+swh5gYxJjGWtmik41IfhpHtah8Xpf1fvuKUDYp?=
 =?us-ascii?Q?J0Jx+mI4j91nUCsTUMLgaLPd2wsTUbevBDL4X3lkTmXyn0VmkpQ1sY+tSQ8f?=
 =?us-ascii?Q?w4uxOhiB7B/ug8ra9aVhmcyDXZsgycBBvsTtmf7iXNcskEeMGkzfvA7ITb2p?=
 =?us-ascii?Q?gtdMLfgXKKaEZKg/mTTWnIiZVoJ9KiUXv7xGNEIjTBZA3ZznkArYGbu6KDE+?=
 =?us-ascii?Q?OdQ1NFWZ/vh5v7FCM0NZfCwoyuu147RYeZ4YBZmCVg/nxBm3H8SqIztgGe8E?=
 =?us-ascii?Q?xol74gvn794Pv/6Glu7ooi9mVH65Gl/GWnGTgP+wCALIznjN3m0K+XRMo4wi?=
 =?us-ascii?Q?knuTFfSQP9+L1pObWodSlXg7YqqfbRoI66EiVqvznnsBmx8it99iVfiAqF4y?=
 =?us-ascii?Q?neqdMTCie/FWWC5Z/KUuI2cCpgpK7+2cgsyWLEe/wzkLwtXBOzI4RvbKQY6W?=
 =?us-ascii?Q?KTx9xnQWSV8BQCG45SzCscQs4NwxqpbmrUyHZixQHSgQ2N7+fahanYmB0hO1?=
 =?us-ascii?Q?LKnedX4dBtac4cS66IE2mUqLl1cJH7mZCFqAMyMxp15IlF195IRP5bhDhbPN?=
 =?us-ascii?Q?OdHAScVQBx2L8iluz5LVhWMsEyoL2ZoBQvEGfqob7ILWkbksgIHt7lpiBbFO?=
 =?us-ascii?Q?cuN9rMAEnos0bz4X7dDDqzm84DpaXTcTtDjgDZmPFeW4msipwjIct8hEvrmU?=
 =?us-ascii?Q?04V0fXzkk5OX8dJqqcBjV53lzxxfbAh07I76NcZTn0u8/7yD6swrdFpkkHM4?=
 =?us-ascii?Q?SgdCQz1Iv1gopzOKc5h5b9nh0zMAKWADw/SWaYvckGS3WjKhuC8c8HaidAbQ?=
 =?us-ascii?Q?gG1eTpzGWinefgrDa7liprko17YTAGFwAnwMvk3/zfxCNHeAsGAfR2yOgyqq?=
 =?us-ascii?Q?QmoXv7t3oJtRZKXJpkeg/Rm+wVrWPdySJhfASWQ+r1ho73SlR0IninfE25z6?=
 =?us-ascii?Q?rTz3beRvk9Bat3sIzoUp3I4m5h4gbJOGp1RoHOXXQbSIWz5N2ybMfQ7Tu5yq?=
 =?us-ascii?Q?XtFwcEZ9YL9+9o7zhEVPorISGuCuAqftLVJX9H706Oc0SuNQXmuOGWxQALwF?=
 =?us-ascii?Q?E/Ka0d2knCoA9FZvQ+83uQg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5df107-ead6-457a-4bb2-08dbc30addc8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 05:46:04.2750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxllisJMy8FkTMCqBuiSzrL9A7S8n7BUjNHwoBRxZeZm8gQh406fpcR/LET2OuuzQd+KeLg08w29N1o6pY4V2Y++hwz/GVCGQPiSJ7CAfgVCMOgw/xQmVOgl/mv9Xwyk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11110
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> > Signed-off-by: Michael Dege <michael.dege@renesas.com>
> > Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> > Signed-off-by: Tam Nguyen <tam.nguyen.xa@renesas.com>
> > Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Just as with "[PATCH v2 2/4]", please consider the transfer chain,
> and add Co-developed-by when needed.

It is based on BSP, but not as-is.
It is following same style of your similar patch (Based on BSP).
Co-developed with Shimoda-san. Will add it.

> > +// SPDX-License-Identifier: (GPL-2.0 or MIT)
> 
> "OR", as per commit 05c618f39089d977 ("arm64: dts: use capital "OR"
> for multiple licenses in SPDX") in v6.6-rc2.

will fix in v3

> > +       model = "R-Car S4 Starter Kit board";
> 
> Renesas R-Car ...

Offical S4 SK doesn't have "Renesas".

> > +&i2c5 {
> > +       pinctrl-0 = <&i2c5_pins>;
> > +       pinctrl-names = "default";
> > +
> > +       status = "okay";
> > +       clock-frequency = <400000>;
> > +
> > +       eeprom@50 {
> > +               compatible = "atmel,24c16";
> 
> As the schematics say this is a genuine ST part:
> 
>     "st,24c16", "atmel,24c16";

I have removed "st,24c16", but will add again in v3

> > +&mmc0 {
> > +       pinctrl-0 = <&sd_pins>;
> > +       pinctrl-1 = <&sd_pins>;
> > +       pinctrl-names = "default", "state_uhs";
> 
> Do you need two states if there is a single voltage?
> AFAIK, UHS needs 1.8V.
> 
> > +
> > +       vmmc-supply = <&vcc_sdhi>;
> > +       vqmmc-supply = <&vcc_sdhi>;
> 
> Do you need vqmmc-supply if there is a single voltage?
> I'm not sure about this one...

Shimoda-san has double-checked.
It can use UHS, but this FPGA can't handle 1.8v.
v3 will remove UHS / vqmmc.

> > +&pfc {
(snip)
> Please sort alphabetically (everywhere).

will do

> This label seems to be copied from Spider?
> On S4SK, the PHY is IC99, so perhaps "ic99"?
> Although I'm open for a different name like "gbe_phy0"
> or "sgmii_phy0"?
(snip)
> Missing interrupt (GP3_10).

will fix in v3

Thank you for your help !!

Best regards
---
Kuninori Morimoto
