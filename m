Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF64693E0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 07:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjBMGJc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 01:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjBMGJa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 01:09:30 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2093.outbound.protection.outlook.com [40.107.117.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD614490
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Feb 2023 22:09:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chThwhAhmLVKKSOwoDr43HJSG6WaWwBxbv9CoebWBLCl2yDpEXV+0lqT7gOfvBfd0lWG9Oa944qzGZ9xLdHSeFv8xFDnIX5g8pPf5N76HgUfhcArFQQFmPRDCBMLw14PfD8ccRZeqTvJpfMzamrlwNFEQ/KuW8Zcw6/10KS21DXB5B2JSM0VBk8qI3nALkzO14/6r5DDRlNzCgp0TEUgOAf+0q9eiXNzqbSEzrgkKgo7Hhmbe2kX+PsZhFuiZkTdazcWjLRNn2bYxeEEfQ4eFwXuNmlj1vBZSbsdgRCag9CSh/Trf8ocCyQ9ZXgkjqQiJPWVsBpMltnHBJgSZzcrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RXXp2acCrLKhY/lTsWMmAVi77YAlX0Xn6WgvwBDF8I=;
 b=M6PD3tjIymb8JkW1coAgD+zA9GTEJIXSIee5uGoLbubf3f1nbxxZP2otHpSfM6Chwb+9o+UsMz95vG3fpvovWFQUpJM0e4IN5+4OMf0VJ2xjV8ZiO7RiCojvaE92n0GdtLLLEQ8defcRL7oUjAYpkZje6MboZVte1BON6uf59bbfui6CnwA+olmJG3K8p6wDpsrSLRUkjNzcjnEyWByszSSqeTxerUVkY3rFGDBa/DV1ZNvHlokcR+dG2Rl7cRn3SJJHjiTEGse3SubL0Tudu6KL3EfwSXzXUWJtj6mMIaCyHCof6SAJ0xBr+TNek3z0s/W7KBOoJ/qLS6MTDBh66A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RXXp2acCrLKhY/lTsWMmAVi77YAlX0Xn6WgvwBDF8I=;
 b=LKdYJDpnT2F5aUuJvSfmEokuM9XMYjtj67ErUlzLTTz8ptL05xDLrQpNZf2kYn2xMNGqIQKPQb1RwFbyWoR//St+sgU9rh7nt7azllGYB0eVsO/3x7MRyNJor7cEnjsHj8qEMeWYlTDFvRZj4xABq64g/VCXbu43OwL8C5hAe1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10746.jpnprd01.prod.outlook.com (2603:1096:400:296::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 06:09:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%2]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 06:09:27 +0000
Message-ID: <87o7py85bd.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 7/9] arm64: dts: renesas: r8a779g0: whitehawk: Add R-Car Sound support
In-Reply-To: <CAMuHMdXF8Udi7vk1oCNJN4bXh8fSxGB7N6NYAmzUKuT02MWCEg@mail.gmail.com>
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
        <875yckands.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdXF8Udi7vk1oCNJN4bXh8fSxGB7N6NYAmzUKuT02MWCEg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 13 Feb 2023 06:09:26 +0000
X-ClientProxiedBy: TY2PR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:404:f6::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10746:EE_
X-MS-Office365-Filtering-Correlation-Id: 8400ec7c-b116-4ffe-5d04-08db0d88dc7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VC/4KuBo2iLfBcfVkFqabLgxSRaXEIjVafAWenwrXpb0jo0z0Vm6UfsqaKRo2ZVFYOPYMyS9Zqp0cGY6vwxhzqjKFUciXPb+v2bTreq2tC0+W+Ta7Mcx0YPlCcWX44iZBrnp8No+0vYpp6v6Ue7BegFqFY0GJtKfVktBJXc5iMooZKBfiaTXIRhqiJmNo3unvO61toAvMDSCwosGXqDpLEzUza1Xlbd93/Ohz+XrfJxsj0hh7fYWELAjEfhTD3PLI0BuxLwQ9Rpsa0NfVKbEMXqlc9JqMvtJcU1xvzyz+33g9l1DuyGWAy/wlWqy5GOqgWxEvRtgeiKjGn11IEZS0MwSbX5Yjla0lyHB9Sg4FTKaf8N0q6pY2juR1a5jquLQv+633RChVU0sMp8RCpFkY0jO/vBRH8GB936EAR75ird95YZ299C4n8qecV2sZXoUyYs4mU5XzI40PodSBEOeaZM72BckrvvEtN5gygPJZuKhgtgF6ht+ivqdrFrwcdNJRlTXOcqbscN0uGI/7q1rM1bg7uzrdcY84Hgp6foLmKVKJg66TB1tVaqGWZdVv+OADezopkVNco1lCYky0Ofom1Qdm0RkTh0vmS7iGgoHx9mBoqyK4p+lWpOsUx4GK02JpIGEW0iOcL6y3jEom5Zs0M6GC06N0qjUwdBcCd7TnAWk6yPnizQLQ7SEduxkadJUNI4yN8xPMDQt1iVOJipYCWUUbMlq8gIye5egqO8BKW8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199018)(36756003)(86362001)(38350700002)(38100700002)(8676002)(41300700001)(5660300002)(8936002)(6916009)(4326008)(316002)(66946007)(66476007)(66556008)(2906002)(2616005)(6486002)(83380400001)(52116002)(966005)(6506007)(45080400002)(478600001)(6512007)(186003)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0tdfT7kR9xZQgo2/4vx6XMevI/HhIjG30fSiARfgz1NYXVbdlb33Vo3aWTpz?=
 =?us-ascii?Q?fI97b1YYBq9lNuBSxaLBYLsfAakhqi6FIpGFtsEHoMK3ZjKSCZamTLIhuES9?=
 =?us-ascii?Q?6F0wRf5Tkf7h1uqwKZAYG9cXxMfJjefG2PBCu059nTwp4z7+CH9xG0vl+N6P?=
 =?us-ascii?Q?r+R3nmqnyvIgDAjoQHSoVPMwgLgJ7Acjs9ULPLqeSNXrFPyi/eR8kFAmhVvZ?=
 =?us-ascii?Q?svJ4LJu5vRARAZuxh1hbdNUAuBtNAA3yg7eu82HXPu7FEjVhXi1f1gTKnuq0?=
 =?us-ascii?Q?OHaYBeXC7yH+B12ZMHScOf4DZMqHJFiQqldXQGbPHf+cB9nD8hVLn2SpO0dr?=
 =?us-ascii?Q?vWS0PGsDNZLZ40JSbNtA7M3ykYA72zuMaqovBQdPug+cB1d9vMcjgFU2vdQo?=
 =?us-ascii?Q?eyuZNJwOlIwRBs6o1eZsmZDIbSbhqogrnxFLb86NNtyNeUNvFnaNK9zTzlTT?=
 =?us-ascii?Q?cqkwCj+JcL/Vol6DMJzP1B7rOQsc1b1wY/9/h/wLH8O1wZkQL645nFFuH1yz?=
 =?us-ascii?Q?5gAz1S/DlSepHZQC0ID3/6EYwCyhZnqXyOZvk/pbXJiVHCUpcKpkR5HG26xv?=
 =?us-ascii?Q?XkaVZsCVRtSY0mR12LL0jh52Wl79EWcxqf+CKIYnOQcBN1vyZsovoHl+KuZ1?=
 =?us-ascii?Q?mLfyBrAHa6SfL2aQiHvd2w0aBMtnWcxR3mWYl5BH0hEc3YWpmh6GFdyg5IpR?=
 =?us-ascii?Q?j2exaIkN/4z5YiGvHgkmsHupPzjutA20jPVIlnvDcSv3+7BjXSthh7oqKEsl?=
 =?us-ascii?Q?0xrIVbebpIlcNA/UvV+oTH71JBxD6X1fFDN4wdbtELKEn9N0NX9rYn6n0GDv?=
 =?us-ascii?Q?fEkGlcnz98yspRs44Fh8HRIl4Yw5gGbFnUuXlZ/ZwUhLWwITmPg+evjBQY1Y?=
 =?us-ascii?Q?Q4zYwbuOyzy3lw5Dbym+M9su6adSO6kQFMGvrMZw9JkDhruG0AAt9uSdQmho?=
 =?us-ascii?Q?FcpTvTa1NLzV1gV8VWsofxlMEO6Mkz+Xi1ZXg2fe9WovP2evz5uRIpxHj+n/?=
 =?us-ascii?Q?16LohJYH/AAd01/7ZvypqYpZvSPMLoGqYF1nGF7+ALbvGupxn9NNv4/mvZIb?=
 =?us-ascii?Q?JVZFrfeWI9p8+0AuFSQipatA13i9Z2VxU6ZVCJeSPv6FUikGLT6p93kzqOzC?=
 =?us-ascii?Q?YS1ZLLRGgUlP5DlNCOn3dJYqYAxE7QESofJATWAuJDS0X0igJSVyTZTF1MsF?=
 =?us-ascii?Q?MUX5rQj2+himZQre7GvgoSHE4/m3x80IrIY0CaPIH/mb88x4X2R9bIAwCGVh?=
 =?us-ascii?Q?RiOuq/GNpkkh637uV0WAiTLy/EkTHTtsVjyoUVq/W54yjJKPTVvbxEkzRB0O?=
 =?us-ascii?Q?OmfyE41lPdqXkRJw9AhJqU8/v41OikwMABEsC5wFlvY+zLVNj86o6LgXvPbg?=
 =?us-ascii?Q?OvPWqs851wpzoljuYOIFQjU2nR8dHWsjHMN+fRGeHgq0WPvwm58ZYkBZ78A4?=
 =?us-ascii?Q?Emyk8riVrYaE5Uwfc2Hc9mUmYh85v01H4b5lMk5YTa21lEayew6TyfX/sR9E?=
 =?us-ascii?Q?vkYZd8qJC+gsU3o9Fwix5XF0xiTvSU5C1H9zkvBb9vgDFCd3WlKo7en+MJdW?=
 =?us-ascii?Q?Gab4C1A04JM34z5vHyy/BcFHNcJ9ZISSvZKecxJCLElXZrMa7ex0T/eLXqVi?=
 =?us-ascii?Q?xdQNlgTIxAzS9tsApv/mGBQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8400ec7c-b116-4ffe-5d04-08db0d88dc7b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 06:09:26.9995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orgrpDbrKjK0d6ictG4FxMPTHB2AOr90iAZTQw/z3QWXZPf74rgVd6e5kWBDRZ9hwY9riVKbhBO3X2rCI1poYO6mfps2NM6MI61mnz3OY+ap3NBQuy2uJoZj1aDtFF8U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10746
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

> > + * You can find and buy "ARD-AUDIO-DA7212" at Digi-Key
> > + *
> > + *     https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.digikey.jp%2Fen%2Fproducts%2Fdetail%2FARD-AUDIO-DA7212%2F1564-1021-ND%2F5456357%3Fcurr%3Dusd%26utm_campaign%3Dbuynow%26utm_medium%3Daggregator%26utm_source%3Doctopart&data=05%7C01%7Ckuninori.morimoto.gx%40renesas.com%7C809b5824f9e74675c42708db0b6b633c%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638116328075928235%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=LuhLL%2BL0O5NaBHeocnJ%2FHDVEZ1PC8FYyY1gNErCrDEA%3D&reserved=0
> 
> Please drop the question mark and everything after it from the URL.

Thank you pointing it !
Will do in v2

> > + * +----------------------------+  |
> > + * |Switch Board               |  |
> > + * |                           |  |    +---------------+
> > + * |CN5                            GND |<-+    |J7             |
> 
> Probably it would be more logical to wire GND to pin 14 of J7 (which
> is the power connector) instead?
> Doesn't matter much though, as all GND signals are connected to
> each other.
> 
> > + * |                       3v3 |<----->| pin8  (+3.3v) |
> 
> Do you need the Switch Board?
> GND and SPI_D1.8V/3.3V and I2C_D1.8V/3.3V  (which are 3.3V by default)
> are available on CN40 and CN34 above, too.

I double checked around here, and noticed some miss on it.
Thank you for pointing it. I will fixup in v2.
About power, indeed we can find many 3v3 / GND pins on WhiteHawk.
But to keep simple Image I will use similar style,
but will add small explanation for it on v2.

> > +/dts-v1/;
> > +#include "r8a779g0-white-hawk.dts"
> 
> Please do not include "r8a779g0-white-hawk.dts", but make this file
> a .dtso (DTS overlay) instead, cfr. salvator-panel-aa104xd12.dtso.

OK, I see.
Will do in v2

> > +               VDDA-supply   = <&reg_1p8v>;
> > +               VDDSP-supply  = <&reg_5p0v>;
> 
> As the wiring above does not provide VDD_SP (which is fine if the
> speaker is not connected), you can drop VDDSP-supply, and [PATCH 6/9]
> providing reg_5p0v.
> 
> FTR, "VDDSP-supply" is not documented in the DA7212 DT bindings.

Thank you for pointing it.
I didn't noticed about it, will fix in v2.
And as you mentioned, we can remove [6/9] patch.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
