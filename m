Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B70A4552EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 03:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242249AbhKRC5N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 21:57:13 -0500
Received: from mail-tycjpn01on2116.outbound.protection.outlook.com ([40.107.114.116]:30628
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242256AbhKRC5L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 21:57:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOx6XC8Sita/BHPxEq0azOFMG+qi1dQ/jzvsd3Ug+dGISpiSo7s1IXLy3m9UiiIyz09hDcMlcfRKHiuzBd4yUb0TqrDcEg5N2ulEqCqTR4kFVp0LTQIaPBzd4+mWWtLmLIWd53zrX7do3Vj6nUtdNTfBJ63GtwbMH9Co/2UleutJMNfjBPbmwdcySiBFXUTdr9m4onghXjzneMz8bqW5NNRZf0Dd8VMEfm6/BeIs0ftdDGVopku44RLddylaN2M+4nVbpUu6mappUK7YAkLk62SJTD8LLz1z8xdtIBoldo5f+8q8ws49daimSAX02fzZJeN5xbGne5qse85Ht3JQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15EsML9gHn0UQXAaiRH8tRepmksdKCSBmHxdmtVJkfg=;
 b=doTJEK8UkkhiFZbTTirYeVWVpcs50jvZtWJ/Kcqzn4wjsOeAFpp6PCdAxsBZ8L/SYx6ubla7+/RhAdihKTfVa5sP6XcIuBR+ox9YGxABmT96BdlIihOu8ogbwyg0BAlNZgeWZgtiloPsmFxKXN80VJrueNXxlO4sBS2HzjNG8qYC8EY044NQkey44Dxw81j1FNIzVR0O4EkGKfwYMNQkOYFqDBe/VqnwCY69588zX00nWrz1JYaDIY2+8xbih4LL7dKLyjHwXCefap8als7n4aR6E1Q0hVNrTdMvm1KzfFzoFRZfQPxdS1TA7EhFFwbjieK48vp6H75Q964RRMx0+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15EsML9gHn0UQXAaiRH8tRepmksdKCSBmHxdmtVJkfg=;
 b=HNp3TTBBP+NGwKm75/wEgz3hE1S3nvAeGlsWcYlt4NZzH9eQf4DyrSjjGa6pUsTsedKqOYcp0WJMkUUOKrq8KJ5oWCmV1cerAulYNqiiZmwVbiL9iPEhaiYQXphDL5b8Xi3d177GNrYU+69JBc5eFxzgBbJqgr/d1O7wuK1vTZE=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSZPR01MB6768.jpnprd01.prod.outlook.com (2603:1096:604:135::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 02:54:09 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::1d3d:8c79:ad2c:62ae]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::1d3d:8c79:ad2c:62ae%9]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 02:54:09 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] memory: renesas-rpc-if: avoid use of undocumented bits
Thread-Topic: [PATCH] memory: renesas-rpc-if: avoid use of undocumented bits
Thread-Index: AQHX25a7kL4U89R0U0anS26k7t2jR6wIlKxA
Date:   Thu, 18 Nov 2021 02:54:09 +0000
Message-ID: <OSZPR01MB7019741B3AC0B31EEBF8058CAA9B9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20211117093710.14430-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211117093710.14430-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c01dac1-9d23-4287-3c94-08d9aa3eb183
x-ms-traffictypediagnostic: OSZPR01MB6768:
x-microsoft-antispam-prvs: <OSZPR01MB6768589E3A88FFBC5BD2F113AA9B9@OSZPR01MB6768.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hc92WExC5gwZ3CBZeJFx11fvjcEgnQJgAjEiEqqnzoynUQaPFxfLHNVOj+2AWBBFNhbydid4uzQgVUUgrWwF0ZkypbUyIvUU0RzjLa6VEESvvxbYhWSexXTErZG/3+BoAEfz/Kq+BJWcaIU6SJNxrR5a3UhLwjpAOlxdRtA0SL8SJokBmsBzvo3pTKirUyxHSjaKrSHdU7e3ZBb9fxxyBrm8OK942D3vDnlSkxoQgPGT++gQbMgsdDwbF+2nOfJuCQE+SJJa1NMVZG+g/GLu6tG0rzSsuCtRrm6KhZA4WsjqWsRWovfAj+irbvWCi3ja/UUGyF15e+raY7rqBFjby6RQhhxWlBaJFsdbiJvjrkD2BjXbbD/dVqVDCpfGZBFk1qzLz/XHi5IsbIK889QckIcYdHl+527moXJ3D8Lf9MqRyhckvbdfxwOA8qw9AKRoAJvgnRk38rzysyZ7ABlBiwu5N0rCLXzK3yDi96X7HKKZad9vqpLE+E+7yMCTvpDgC4WqeTG8VyMWx/FUWfQF2iBm3yA7RFTByyfsh3owVPz5OE0Z/QVVo7TriRNhhC6z1Snzh229tjxHP3fn3EkYdhwMQngAvHmVyofDYYM8PSMlYSqa083plJefA0fAwxgHhznodkcGD9z+5/5IUMklda9hYeI+8rm/u1nl+RDkahSJv0p1aBJ0eEfPubW80fRpuRCPsEk1TBpjoFgh8MbZkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(55016002)(7696005)(8676002)(122000001)(9686003)(38100700002)(508600001)(186003)(38070700005)(71200400001)(5660300002)(8936002)(66446008)(66556008)(76116006)(316002)(64756008)(66476007)(83380400001)(110136005)(2906002)(54906003)(53546011)(6506007)(4326008)(26005)(86362001)(66946007)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1IEE24czS9rRIJcFcCSx9+Tg4xpA+L+Fk3/ZrR4FdZ80f7uYyoAbaIN3BeJv?=
 =?us-ascii?Q?t94o+750oNPRPNCLKMehxhJQo3GhDeVg9VnjT9WZkIzdbSL2K+lYvy6K0f/t?=
 =?us-ascii?Q?/UaEr38lBqEfOZXIp2fA6BDzWRLFnMeAC0x7dKMsFKtZ9qENrLuh0z56ZE0H?=
 =?us-ascii?Q?BxjRHbtgp1a///C4jS8xhq1EkoKIf4W5bx/5d/fdFT4htYFh9klSKKaEpmY6?=
 =?us-ascii?Q?8qVrkBNd3pMm4r+Cv8Vsm95sC1OYFHM4RSimRF7LzAnmA1z2lnVKyVKuAxA5?=
 =?us-ascii?Q?MuRgTrUTxbaNEusvI9uc7/GJPJqYA2j/PSXtYiSsPBKlQ47D0gWLnNGI/pk1?=
 =?us-ascii?Q?ZYJl+OT0QZkasQAWxyr72WUptbdg/kwJCWPtYmYmT5lDdhUP1WXWH/Z5f1kF?=
 =?us-ascii?Q?dHFxS3dl/pC9JiTnm0CZ21vcCGaSVPsEx/cKsM6KAw3lAPAxaSVLN3pRDAw4?=
 =?us-ascii?Q?xjKmIGXSxuCupPDGWcB70CEKijNrwHawIhXPKfPHXtJKjVAoQKNQjHeJ32Ic?=
 =?us-ascii?Q?fO88gaMNiw1OEA4CtmquG9q/kt60zl3TmSNDKkyre8Z46Zg6LctT4Dwk/3RL?=
 =?us-ascii?Q?goR2X73O+EI/u+KPW1HnKU8TOM9jy3BRqKIqg1uDn83aJIQ/h0VgKm6+luZM?=
 =?us-ascii?Q?jjqmWCi5bjnyv5wmNIIKBoWoXvlDhp67PEco4w85xzUyzZpYbzMNGAiatm8Y?=
 =?us-ascii?Q?SD6j8Dp4vn0Dz8TveXtBjxb/Do+azUrLiaEIDjqSHaaUAiVrVtaLfpvl28Ow?=
 =?us-ascii?Q?hdvXFynkZ2s+pXW7xTJonElh48evEOk7OQNsliyx+qf2rN2hWn4jUM9nHy2y?=
 =?us-ascii?Q?80kbpeMAGpQX/XZInQ+I3DEqNdGZQldLG0w20+aCEB25spjKAlKjiZyRBzfj?=
 =?us-ascii?Q?Z2PyvKc7t4khPMUuFfGiYM1GfizItj3mIqKmjFnX/z5Dwn/X5U4pCRah1UAW?=
 =?us-ascii?Q?ZTZ0nDY9IXip8D1EiBe0M7Sg2UGQFvQfgFPupNkiH+9hCx45lIpRfTEUxem+?=
 =?us-ascii?Q?d7y2/rUbk0LbcPsJsdZ4TxKtzb8idrM5FKfV7ip95u/VAO3P7l0ptObG/UAc?=
 =?us-ascii?Q?DEaY8x51mIX7L7SD+2bjHCThpILJZkU2B+eBMkEcoXXR7WEfkiuYvFG58o7h?=
 =?us-ascii?Q?x8WcJ/LAfXqv7Y5HSeAq5lJb1TI+8ON/N+hcaW2L3oqChwcKwOqbTJEtHUPK?=
 =?us-ascii?Q?mctvpt4esn/Lo14O5eIESUyXlnvwrVSxmFBwn64VH12Xq3dOdSRpXaIiDgz5?=
 =?us-ascii?Q?Xu8zQpIqTCpHoZj9R6i02EScriqaq92KvllzgD8JMw+/ofZ4tUK9I7SwBpsM?=
 =?us-ascii?Q?lLPkhr0NXMbg8kjPK8FtfueoSnU/CeHfbprkyZFZpCQLsQgOZjKRDuCNvaBq?=
 =?us-ascii?Q?Gpay+l7onwOh+bdASpNhkDJ/pSlC/4PDYCqN7IKtkKvfrhFMJwxpJZF6oBU4?=
 =?us-ascii?Q?RdXBJE3E36tHWjxcwYMdY1sxCuQJDzfzxKq2q0yZz0eCuNPLkLkZODvkVDwy?=
 =?us-ascii?Q?xQzcq/BaFlPslZiMaigpEwcVJzoDHouoODe98YeULiH8dy57uHbmt9ro55oX?=
 =?us-ascii?Q?TbJOzj9igR5z9+li5kBcbzcPub0EzNa1P8vy5Ts/KeldCBALWD935IRsxBRt?=
 =?us-ascii?Q?ATcECukOSR2AQXGGhP3XDYDQvZTmXeqXhRdwmRR4V8/KToh/wbSTy8aDizfd?=
 =?us-ascii?Q?jTRGRx3KrrSjf//VkitBjOFHp6KVtkAEzzhaTxv5YPubU4KY/0f09QEal5eC?=
 =?us-ascii?Q?faZIt5y3WQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c01dac1-9d23-4287-3c94-08d9aa3eb183
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 02:54:09.1253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qLraj3j6ONCi9ycI7TioHqyW9HtW0dwTqG+k/rq6Ss/2Bd+ENrWMackshHNlmtU4w7RzepWddx7knIVUbtYW2q1VZmhsRq0qKTORw2p0sqSbbm8csCD/k7YfCn6Ps3VB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6768
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thank you for the patch.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 17 November 2021 09:37
> To: linux-renesas-soc@vger.kernel.org
> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Wolf=
ram Sang <wsa+renesas@sang-
> engineering.com>; Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>=
; linux-
> kernel@vger.kernel.org
> Subject: [PATCH] memory: renesas-rpc-if: avoid use of undocumented bits
>=20
> Instead of writing fixed values with undocumented bits which happen to be=
 set on some SoCs, better
> switch to read-modify-write operations changing only bits which are docum=
ented. This is way more
> future-proof as we don't know yet how these bits may be on upcoming SoCs.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> This patch is based on the Krzysztof's for-next branch as it depends on P=
rabhakar's G2L additions.
>=20
> Tested on a V3U with some debug code verifying that the same values are w=
ritten before and after the
> patch.
>=20
> @Prabhakar: would you be so kind and test this patch on G2L?
>=20
Dumped the registers before and after patch, register values do match. Also=
 tested read/write operation on RZ/G2L.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>  drivers/memory/renesas-rpc-if.c | 58 +++++++++++++--------------------
>  1 file changed, 22 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc=
-if.c index
> 8c51145c0f5c..a9f3e7bdddf8 100644
> --- a/drivers/memory/renesas-rpc-if.c
> +++ b/drivers/memory/renesas-rpc-if.c
> @@ -20,7 +20,6 @@
>=20
>  #define RPCIF_CMNCR		0x0000	/* R/W */
>  #define RPCIF_CMNCR_MD		BIT(31)
> -#define RPCIF_CMNCR_SFDE	BIT(24) /* undocumented but must be set */
>  #define RPCIF_CMNCR_MOIIO3(val)	(((val) & 0x3) << 22)
>  #define RPCIF_CMNCR_MOIIO2(val)	(((val) & 0x3) << 20)
>  #define RPCIF_CMNCR_MOIIO1(val)	(((val) & 0x3) << 18)
> @@ -290,49 +289,36 @@ int rpcif_hw_init(struct rpcif *rpc, bool hyperflas=
h)
>  		rpcif_rzg2l_timing_adjust_sdr(rpc);
>  	}
>=20
> -	/*
> -	 * NOTE: The 0x260 are undocumented bits, but they must be set.
> -	 *	 RPCIF_PHYCNT_STRTIM is strobe timing adjustment bits,
> -	 *	 0x0 : the delay is biggest,
> -	 *	 0x1 : the delay is 2nd biggest,
> -	 *	 On H3 ES1.x, the value should be 0, while on others,
> -	 *	 the value should be 7.
> -	 */
> -	if (rpc->type =3D=3D RPCIF_RCAR_GEN3) {
> -		regmap_write(rpc->regmap, RPCIF_PHYCNT, RPCIF_PHYCNT_STRTIM(7) |
> -			     RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260);
> -	} else {
> -		regmap_read(rpc->regmap, RPCIF_PHYCNT, &dummy);
> -		dummy &=3D ~RPCIF_PHYCNT_PHYMEM_MASK;
> -		dummy |=3D RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260;
> -		regmap_write(rpc->regmap, RPCIF_PHYCNT, dummy);
> -	}
> +	regmap_update_bits(rpc->regmap, RPCIF_PHYCNT, RPCIF_PHYCNT_PHYMEM_MASK,
> +			   RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0));
> +
> +	if (rpc->type =3D=3D RPCIF_RCAR_GEN3)
> +		regmap_update_bits(rpc->regmap, RPCIF_PHYCNT,
> +				   RPCIF_PHYCNT_STRTIM(7), RPCIF_PHYCNT_STRTIM(7));
>=20
> -	/*
> -	 * NOTE: The 0x1511144 are undocumented bits, but they must be set
> -	 *       for RPCIF_PHYOFFSET1.
> -	 *	 The 0x31 are undocumented bits, but they must be set
> -	 *	 for RPCIF_PHYOFFSET2.
> -	 */
> -	regmap_write(rpc->regmap, RPCIF_PHYOFFSET1, 0x1511144 |
> -		     RPCIF_PHYOFFSET1_DDRTMG(3));
> -	regmap_write(rpc->regmap, RPCIF_PHYOFFSET2, 0x31 |
> -		     RPCIF_PHYOFFSET2_OCTTMG(4));
> +	regmap_update_bits(rpc->regmap, RPCIF_PHYOFFSET1, RPCIF_PHYOFFSET1_DDRT=
MG(3),
> +			   RPCIF_PHYOFFSET1_DDRTMG(3));
> +	regmap_update_bits(rpc->regmap, RPCIF_PHYOFFSET2, RPCIF_PHYOFFSET2_OCTT=
MG(7),
> +			   RPCIF_PHYOFFSET2_OCTTMG(4));
>=20
>  	if (hyperflash)
>  		regmap_update_bits(rpc->regmap, RPCIF_PHYINT,
>  				   RPCIF_PHYINT_WPVAL, 0);
>=20
>  	if (rpc->type =3D=3D RPCIF_RCAR_GEN3)
> -		regmap_write(rpc->regmap, RPCIF_CMNCR, RPCIF_CMNCR_SFDE |
> -			     RPCIF_CMNCR_MOIIO_HIZ | RPCIF_CMNCR_IOFV_HIZ |
> -			     RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
> +		regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
> +				   RPCIF_CMNCR_MOIIO_HIZ | RPCIF_CMNCR_BSZ(3),
> +				   RPCIF_CMNCR_MOIIO_HIZ |
> +				   RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
>  	else
> -		regmap_write(rpc->regmap, RPCIF_CMNCR, RPCIF_CMNCR_SFDE |
> -			     RPCIF_CMNCR_MOIIO3(1) | RPCIF_CMNCR_MOIIO2(1) |
> -			     RPCIF_CMNCR_MOIIO1(1) | RPCIF_CMNCR_MOIIO0(1) |
> -			     RPCIF_CMNCR_IO3FV(2) | RPCIF_CMNCR_IO2FV(2) |
> -			     RPCIF_CMNCR_IO0FV(2) | RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
> +		regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
> +				   RPCIF_CMNCR_MOIIO_HIZ | RPCIF_CMNCR_IOFV_HIZ |
> +				   RPCIF_CMNCR_BSZ(3),
> +				   RPCIF_CMNCR_MOIIO3(1) | RPCIF_CMNCR_MOIIO2(1) |
> +				   RPCIF_CMNCR_MOIIO1(1) | RPCIF_CMNCR_MOIIO0(1) |
> +				   RPCIF_CMNCR_IO3FV(2) | RPCIF_CMNCR_IO2FV(2) |
> +				   RPCIF_CMNCR_IO0FV(2) |
> +				   RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
>=20
>  	/* Set RCF after BSZ update */
>  	regmap_write(rpc->regmap, RPCIF_DRCR, RPCIF_DRCR_RCF);
> --
> 2.30.2

