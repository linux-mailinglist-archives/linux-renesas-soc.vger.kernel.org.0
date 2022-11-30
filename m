Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 149FF63CC31
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Nov 2022 01:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiK3AH1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Nov 2022 19:07:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiK3AHX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2022 19:07:23 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2091.outbound.protection.outlook.com [40.107.114.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681427044E;
        Tue, 29 Nov 2022 16:07:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W16R1wtBsSX+Eg5R/Scsu9uPc4eXpaNKqWns5dPFz0ssmsA3PZYsp2dosWs9QT4wVUOmaS7H7+PZWsc2uHGuENkKYk2W0wfCrgkPcq9StTM5d92GoQPLZsWxciBQwoM4o12eeT7dYjfvSHgRwtoUe3YDMPVoiM2syWPxF4GONHbJIuKKLZ9zYkitEJ53qzGYjPCo/DURqECHw19h3Gf/GqC+DzD+i1iA27joUP446/KJx20K5+ajVq7I3BlsgqWbnDWG6otL7EtBK/cO6lC5mBkihVdhHy+v9/WyE0sSAEFGRzoEfQh50FAiO6SKZivalBs3O0/8gb2IGiWluh9H3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlg1FaLHoMGkw6+fU61uSvEV+YTro34tCUKS6WzgcS8=;
 b=eFUJCkwCS09cfee0xaR3S2XFSdSH7GTYi9ByxjlTk+Eue3p+mJTVN4/TbCUvzzZ7NeqYDoCcZ/tpq02gL/Tw5nRKHWoUAPi0xollpZ63C6EJ22oqhFpsb9+67tfjjplaYRpjXMsNR+F71wBPnFKMyTkUJt2429DCgyterX4bVyySKmF+OEHyqXDxb72KGzf6npBnStFGR93X89OMnZcYDxJ7nz/uV2UPKwXbFgVTy57dAET09+AiQSZiwcxg9tIyrsQGBQysewWSKQ3po9qgHD4jfFFOaQvJc50tutOql4Jd9DbcZnB13PBjK6PIyTVGfzTUBkvp2oFLZnMKD9JS+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlg1FaLHoMGkw6+fU61uSvEV+YTro34tCUKS6WzgcS8=;
 b=CBaTVqzINfqCD08+V5a6R8mAlvgfmzgLMcT5PZaFwThklcKtAXgifF088Q68O+MXq6EeXPJ4iLtPGv1DnwCtkmCqyIfut3iXKZx55+2SiCImtzUG5JZ3Qgq7rsL81CU4mrKgcYMaQ2VymcooLE3n89nfNA4HRPziNIWNjX4ZZWA=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB10135.jpnprd01.prod.outlook.com
 (2603:1096:400:1ef::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 00:07:19 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%8]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 00:07:19 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: r8a779g0: Fix OSC predividers
Thread-Topic: [PATCH] clk: renesas: r8a779g0: Fix OSC predividers
Thread-Index: AQHZBBMf51qNif4Ce0+wp088vwZa6a5WlpnQ
Date:   Wed, 30 Nov 2022 00:07:19 +0000
Message-ID: <TYBPR01MB5341DE55220BD3B702F3044CD8159@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <dcd572acc584c237f70d2309e038f25040236a87.1669740722.git.geert+renesas@glider.be>
In-Reply-To: <dcd572acc584c237f70d2309e038f25040236a87.1669740722.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB10135:EE_
x-ms-office365-filtering-correlation-id: 7a1cc393-15c6-486d-f236-08dad266d8cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xI46JYhSeg3BwbFrbSxNa7+NRuS5lBGmwYtOBwoSeO3dLUCQmlmV/geH0r83Pt40hATEYPLzru/yerFVmDqoJs2d8LVjPjNtsmE/pPOJ5DK6Gog1OLI1Su2ti5l2kj7cnrBYNYNf7OSi7k4m9by7AA/Uft3BgLLwRZeGPwgV3qhhj6FjmrRkHz8i3jeOMf+kN/DAbOcKLYP5ZHLLkHZu2gbWbXRc93yFPG9Zw3knrdHCQwmvBDX+opcPzJa0lK5TU88nLvMJgVvHqrKfOIKpb4B1E0xUnyss1ty7XglVrlSVxI9iUK4YBp1qHnL03B+NMmqpe8Z3Ix0BrxCwwE0g/EhCVXchcnKj4nRBepcc4hdWVmT+j99hOIOcTTvhF281y5T0lIohzXFlc32msAhIPrW5ahf3IANXJtkLbiXxa/CeGznu9/e03t9FEae8WtrPJy0iFAFZdfI+wZWviNZT5+urPhEjfHlulMb+TMbDo1youbZ0iA+bNR5RS/8ST1E8a5h3N6pqchFhvgFi49wC6zHPdqyykVNZl5AdvqEYbcItVMUjM9sp/hJPbWxgdkymcsZoTyPAbJIDgEa/wAzhaUbYuvAOdqgFZVj1aQafPdTvN72SBDQxOf6O3dJrvIlq6GO/iluc+2XqriU/c7ksBQKYdQsy6KN1etYRPXvUGTWmpz0os6E78MndhSfgZZ6duDrlxiDQdESO1ereo8f3jg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199015)(33656002)(66476007)(38100700002)(122000001)(38070700005)(41300700001)(2906002)(66556008)(83380400001)(86362001)(66946007)(64756008)(8676002)(54906003)(316002)(71200400001)(66446008)(478600001)(76116006)(110136005)(55016003)(5660300002)(8936002)(6506007)(4326008)(52536014)(186003)(9686003)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YEtyZBGznNZdcAYZbgyiT02yhAhySS+ShLxSJx2zIrxFNf4swL4dbkJX383y?=
 =?us-ascii?Q?WFkKPlTz4kEKZMMor6fNDDa6D7Pu9N8Wss13L5CIOg7epZtoLYmEcJpfoQ73?=
 =?us-ascii?Q?SLFoZNvgwDdVALlEyISIgczO7scQJnP9in8UkR7hPwq8XoSudSMdLy/crZVP?=
 =?us-ascii?Q?T30utB7blyQz/J65Fu6mDrrLLiFm1U890pENSStpNUAQjKNgi2VDQBYiFzh0?=
 =?us-ascii?Q?Va9pmZ7xKwrijKismUUvvVFU/lT7Ginn0VeqfMIUndxvxmpZW+nguoOfnJ5w?=
 =?us-ascii?Q?nxVDoy2Pn9EvycMFUtyWi3nLQC6xv49pJu9EI2JJ69PH/m2ZEDtyG2ZfHdPs?=
 =?us-ascii?Q?UyDsiUaBAYo+EqpmZgQ3daYgScgZUDjsqEEvqR57oeMvlPle9gwfhwrKYsi3?=
 =?us-ascii?Q?TEcOx8pTfxsLkHxc6zH0y4NvUd1RaqK1+w5AdlpPAVRuMEH8uocvmPWtiOdE?=
 =?us-ascii?Q?QaVFdGo7HVIXHkt5GfzZzkqOUiWF2nYCNPH9f2GIRStRJfbJG8+qPeF93N0O?=
 =?us-ascii?Q?EhhEUR3uU97K1bogBkbvLpd3iGAGXZnkHP6AR4WTjqdyvHLPUj2eUSmmU4eO?=
 =?us-ascii?Q?YEqeDYGDdm/DYPAP6QZYghGB0WyaF8IMCuFYTsJ/aXUaaj/Ka95h/amHSAxN?=
 =?us-ascii?Q?qZo0TZpSoJNSO0wpVcwWjOXaotJ+5Vv8SpGHS3YJg7hBnF6CSxn8fPD6b1nF?=
 =?us-ascii?Q?oYlDzJWIiKlNoBqI/lyo7UaPAeMq04qzwypfuQtouNAFKjymvlMBRYAS5Dzm?=
 =?us-ascii?Q?3n3ZeC3hJxfLwvA2VFCijUWUG4eDCQVoHlkUT+LLklgQLR3QPdApxXty8nPg?=
 =?us-ascii?Q?P0x8rYXwSiT5AeCDV5d89XrqGoHnoZpQIpO1DKZDni99UlLeDyYZ7oI44eEL?=
 =?us-ascii?Q?k1veyZG3WKl2IPjbG8ntv2FGTyJL9SjJm9gsPLFO5iBTkzsHu5UYwCwMmLdT?=
 =?us-ascii?Q?5SmwekEPE+Cz6l+PiLkB9NVUq3g2D2k3fX1Z6vsD8krLMg+luyHPRSSKS3yq?=
 =?us-ascii?Q?DG456leyqzmUKQVd9rfmda1ZDY3aoz9V//IOe5ad5hpQ1bgfU/c8NJWyZdKl?=
 =?us-ascii?Q?BGytBCYiVlP1nXtq4lETkxd6UbJzW4WTgTyM1gJqv5IvuTlXv/G+XkD0BjMa?=
 =?us-ascii?Q?CaqO8kdr6XlmyDWR+FiWBMyECfaYMG2Z6pArgynQN07gwqyVWQ5DAg6EWqAr?=
 =?us-ascii?Q?nLk8WNv7j/d1J2esZkbmMOFfDjuoq8Hexa0p7fr9TflRnz2SrKdZqeZfYT1Z?=
 =?us-ascii?Q?yHX863xp7ZeawN0wCvXeMB3A7ZNZyBHsxvDl52Kw9DraV40yEZEAVfCvvs43?=
 =?us-ascii?Q?83B25/gefZ3qz9Z2jniVChg9i8at7LVJKZtWedzFT0lz3xEW3SJ9Ko1L8w12?=
 =?us-ascii?Q?SYJlovIuC9Bcyuz9BsucUKaiWvhSz6TG3fai8i4pVQqXcpkI+VoLK2BirJhP?=
 =?us-ascii?Q?gwi8dgV1BOYn/WV9aBCmMt1k1o+VaOEjk5Qd0fpU281AUSudKEVLknSMMZsi?=
 =?us-ascii?Q?V/Ac1RY9/jNxnZRfl2MBpo/Lb+iLsCAIvx8d2+JIoxtV+1o0Z2n+m4hC8h7U?=
 =?us-ascii?Q?FcbWwUetyB2Swh1qGl9EIlNowKYz5k6Y8uTeWhdqSzyO/cfeHDnVpJt1QRFQ?=
 =?us-ascii?Q?n+CvaRIV9pN69uqNkixXPIs1HgnorWLUjsNQ4W8XCKLY+aYbmrh7y6bcCQMe?=
 =?us-ascii?Q?kk9sqA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1cc393-15c6-486d-f236-08dad266d8cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 00:07:19.1684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sm0FhvP24SLmPPs/aIT/BwtkiyeNhiy9r2Tc05Q84QqmC6ncksN+jp47CJNceVuaqzOiEcTwDQAXvCv0p2j6YQ8KAhJpj+LtZLkBB8HxZcP1J01OaCtLdOiL8CekOwPs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10135
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, November 30, 2022 1:53 AM
>=20
> According to the table in Note 5 for the OSC clock in Table 8.1.4e
> ("Lists of CPG clocks generated from PLL5") of the R-Car V4H Series
> Hardware User's Manual Rev. 0.54, the predividers for the OSC clock are
> 16 resp. 32 when using a 16.66 resp. 33.33 MHz external crystal.
>=20
> Fixes: 0ab55cf1834177a2 ("clk: renesas: cpg-mssr: Add support for R-Car V=
4H")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> ---
> To be queued in renesas-clk-for-v6.3.
>=20
> Presumably this was copied from r8a779f0-cpg-mssr.c, as R-Car S4-8 does
> support dividers of 15 and 19 with a 16.00 resp. 40.00 MHz external
> crystal.

I think so.

Best regards,
Yoshihiro Shimoda

> ---
>  drivers/clk/renesas/r8a779g0-cpg-mssr.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesa=
s/r8a779g0-cpg-mssr.c
> index 9863f1a51f4b36e2..2feb97fc37759267 100644
> --- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> @@ -212,20 +212,20 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[=
] __initconst =3D {
>   *   MD	 EXTAL		PLL1	PLL2	PLL3	PLL4	PLL5	PLL6	OSC
>   * 14 13 (MHz)
>   * ---------------------------------------------------------------------=
---
> - * 0  0	 16.66 / 1	x192	x204	x192	x144	x192	x168	/15
> + * 0  0	 16.66 / 1	x192	x204	x192	x144	x192	x168	/16
>   * 0  1	 20    / 1	x160	x170	x160	x120	x160	x140	/19
>   * 1  0	 Prohibited setting
> - * 1  1	 33.33 / 2	x192	x204	x192	x144	x192	x168	/38
> + * 1  1	 33.33 / 2	x192	x204	x192	x144	x192	x168	/32
>   */
>  #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
>  					 (((md) & BIT(13)) >> 13))
>=20
>  static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] =3D {
>  	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL4 mult/div	PL=
L5 mult/div	PLL6 mult/div
> 	OSC prediv */
> -	{ 1,		192,	1,	204,	1,	192,	1,	144,	1,	192,	1,	168,	1,
> 	15,	},
> +	{ 1,		192,	1,	204,	1,	192,	1,	144,	1,	192,	1,	168,	1,
> 	16,	},
>  	{ 1,		160,	1,	170,	1,	160,	1,	120,	1,	160,	1,	140,	1,
> 	19,	},
>  	{ 0,		0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,
> 	0,	},
> -	{ 2,		192,	1,	204,	1,	192,	1,	144,	1,	192,	1,	168,	1,
> 	38,	},
> +	{ 2,		192,	1,	204,	1,	192,	1,	144,	1,	192,	1,	168,	1,
> 	32,	},
>  };
>=20
>  static int __init r8a779g0_cpg_mssr_init(struct device *dev)
> --
> 2.25.1

