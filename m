Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C644552D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 03:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241944AbhKRCpP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 21:45:15 -0500
Received: from mail-os0jpn01on2102.outbound.protection.outlook.com ([40.107.113.102]:17318
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241933AbhKRCpO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 21:45:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ar877N+qEjXbLEXiCVBnUIRdof8hg1/1LJom1hSXVmMrwXdNRz+9ItnJB+aSe21i+UyL+2R1tEP6+8RW6awX3A+XlflGgL7/99j1gvkhmLZrox4+TwW+cIkS1I+9MsCjDm5/1IZk9ut4CDACnQorLTs/M/0GBcVD+OCg/utDL6T5Orpvgaj4LGWxhxqd1FQCrtTMHR0fr7GoOmHkr37cnlXzeor9r2kvwV1s82hQ/Wg60PM7d2z+ND1/W7GfzEaD9Xw7amEr6EF6d9lRRKhgB+ItVS0OvY6e4HGeBdIdsnArWCuAlubnDkmyk9RuUUld+YOcxnpojWqMpMHp1M0bww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYmc1izF/t/NXSTipFmaS+i+SzB8cmrzmFxxuW8NK84=;
 b=cGJ5dG/UkJEo0dF7VebWb6SCcnfLHVOz9yOD/eslWTcilfhaSbCTAj8PLxf0PvNYN/jTxbIscUI+I6r9KuxJQocdT5zC3ztrZETj7Roff1HuIMuAGQUxZzn4S0GomJhSg1PQ+KfJeZrnbcD5oXxQfFl9n8IfPKgvPI5Zcl2ZRWIxabRUTw8+OMjC8ysW9dMfBqwSL6gs9JW4pqvJ0rrQDK7egtZoHXMTNBxXXKeKiAc0iQb2XA6gdNEK4Y1GkTdDmj/jiUqfX8gmRhnSlzFqdDcYC6csWqUViGtKzduICJOTTCxvI4+HPZ5qT6Md5YeEzALUaIteaeZgTRiJOCMSfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYmc1izF/t/NXSTipFmaS+i+SzB8cmrzmFxxuW8NK84=;
 b=DGRF4q8rnujYPs2i7XgcB4jQuyFAWEKizcTZUlpDl2EuLOjKvNOWxHOz5Q6pi2cbN78iPKlTrwE8qJ0FaDO1vS+TiSB4aC9vdLbpcZJ/N/nFFFIZX5y1uIyzQCK/7OiyordE0X43dqHvWzJX3D13uaBlE7Le/jijAcaNTdR58dE=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSAPR01MB2243.jpnprd01.prod.outlook.com (2603:1096:603:1c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 02:42:11 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::1d3d:8c79:ad2c:62ae]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::1d3d:8c79:ad2c:62ae%9]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 02:42:11 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RFT] memory: renesas-rpc-if: simplify register update
Thread-Topic: [PATCH RFT] memory: renesas-rpc-if: simplify register update
Thread-Index: AQHX2533V/dyGMBJnkK37qU00HGJ1KwIk/cA
Date:   Thu, 18 Nov 2021 02:42:11 +0000
Message-ID: <OSZPR01MB70197D0092E43A929A3FDE74AA9B9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20211117102902.20062-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211117102902.20062-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: facb32d8-621c-4679-3642-08d9aa3d05ea
x-ms-traffictypediagnostic: OSAPR01MB2243:
x-microsoft-antispam-prvs: <OSAPR01MB22438FA88905AF58D5BB50F8AA9B9@OSAPR01MB2243.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: slP1KvdK20mY5FQGGArhEh2lMqMZnezahmWKTUgYl5Bl4YF8WaZFmfe2OEvW+066SY/Ov5TspbjQmR0YrHv73RQftJdzYBmZg5FLpoCCbj787b4ICFOKQMofCcQCHEnvvqSak5pB2m0Z/lm8z3EwR0b+gqeb7u3uWZC2kzBL+YLqDUIRDV7Rh6HaYq57jyHfC043K0kS40m+fWzT6qUjlMcp3iuZOXLeGdThJE3VF16f6Yr2K/8s1Uz73U7KCKkXmhQ67Rng2oW7fTQNYQK5QcsSazgfvfUKBCNmPwFDYl+6Wu283F6blIAhiW91K2v8WAIb2H44A8klVcRyegDZNqextXokAnUA44WcKip+YMBCf50/uMOdZ+Xfn4JbL+nN2Bs4u5sE+Zq0x0Mul6TorFTzItG/Xjva9j97Xci/lOOsaoNbMt1haHxd1debk7amhpaP05dVwbKd+0aQg/0NbA2rF8YIqfaMO21DVTsJ/8/f/Wi5rh9awMAB+Zhf5vMGpHgjrDRue4yFL5vL+sHbWpZADVFZGAcr0G0vflL9rFdnyeFqVEzqe0L/chHWmHbhVuJhXCXixT/csalsJY5d/ptIUYp322/q4AsGJU+l4G8xPjks0aUhxiXiGoTsCeySP+Qum9jZagvU4Myn10pYIkRWScqAqiid6MSIBiA2UjkNU7yGegpAiCpICmZ7NXXuZ2I2sYx3DP4kxW3eBXlxWw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(4326008)(38070700005)(38100700002)(2906002)(122000001)(76116006)(26005)(8676002)(6506007)(5660300002)(9686003)(71200400001)(8936002)(53546011)(55016002)(66946007)(86362001)(54906003)(66446008)(83380400001)(33656002)(110136005)(66556008)(52536014)(64756008)(66476007)(316002)(15650500001)(7696005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TGgnykU3tL2tZd/5pXsbXJt7KtAA/utCdEzTWRTqvAC1B7MuE5GDRCFKY8Me?=
 =?us-ascii?Q?neCOJxWJCzyPfZjrPvy26P+Uqkzv7Pg25S1ngiQSpxWxGqfB4I8OR2H5L8W0?=
 =?us-ascii?Q?dUGLEXk5ONpgkZl3lTDbfssoC8KiCo62lO5djUc9ad9Ax7XE6N87wN6qT7JN?=
 =?us-ascii?Q?wPzHFqBOIAoc9DOphmgP0yfbMn/ipDbyiWK1ZYry50y5MaFo2hLwD5oveB/A?=
 =?us-ascii?Q?5NyrnZSMWbM7NqYEXs0VUpQ1xZt17cC2uDkzrXsnMZtCFkeI/c1VnvXZIcij?=
 =?us-ascii?Q?YkcsWgKLg69rw83CZzVbEpVH6xT3Z0sRv5RJ5StpoaeJi7CBnAGmZvrNYhQY?=
 =?us-ascii?Q?7Wb90e1X+ZXKZdL5n0stjFG6Mq7ZqABJvX961csEtEWoe0UwafKcY6vzHn+I?=
 =?us-ascii?Q?ZOzkXVLVUJnXVWwuWg0xHEN0xednv1I+b3dO8m4PHIFZbXUF95tPFDgEHBjd?=
 =?us-ascii?Q?6t8aQJOTsI9wGEMMHCoi0bN542uM9tvyG4f+i+FZDdLk7FBKs6F7tC3mz8Wm?=
 =?us-ascii?Q?9gzSFaDpA1x9eLduVo2CdZK8GxCCg7Me69J85TEz96W1yDbTv3pVtiAG6XTJ?=
 =?us-ascii?Q?FY5SDhiUophnySi58LlwvGL+xtPo6zpKNo+9D8F3uaPCCAqfKrGCnWXbmgWS?=
 =?us-ascii?Q?qfWWLechuhNAGTDEjBmjU7Q3+bXICbnhGphySzqg+dbuG+aUCW+YzwYnyUwg?=
 =?us-ascii?Q?JGgs0x2EGjtjksOhmFJdep3DM9Sc0YENDOHXAHELSp9Fwo6Z655VopciKR88?=
 =?us-ascii?Q?kyHaCgp+Mt1VbYbUnfnB5HnaerCJQyQUFlCXHkX8FhAM8F8TIJCcAZYe8hWE?=
 =?us-ascii?Q?Ga+aANOcx1nQzX2jx4HD6oYenuvhG9MKnqc6BYp0G6sKCRYIMzW/vZksTZuA?=
 =?us-ascii?Q?oyNnKl6UPXtHlucfv++Ykg2Giya+5CaaYNqdFeWz5RidLnIjCDyIUFm8/0NI?=
 =?us-ascii?Q?EBOFW0C9dLWjukQ12XxphYUq80YLISCF87D0JPqFET8e8RkaVJAjiQAwj9G1?=
 =?us-ascii?Q?HukfwULkPRXScGdauK4XAAPRZXxSvpU0TKB4HF7r+EupvM8++tijTpqnkrRc?=
 =?us-ascii?Q?s6zJD7dyre10zz7JZHtCxbVLjcRGQf9Ofk1YcWu8o7gJz0Krnj43vjkvLr1M?=
 =?us-ascii?Q?AZriKF5pUQLWyJmfu46Tvfk92fBtkVzeb2Pn6Z3M0cKgxq05N7iN7HSgL6Hw?=
 =?us-ascii?Q?lBRxXVWgHwuOco/6prysYtpzT5D9cFtEN6rCF4pTgmQ9HnuHiHLzxkCv4M2m?=
 =?us-ascii?Q?ZPx4MBic1Eqt10ml10MHN1UtNPYHqYkbZEnUveFfk07y3yFis9h/ClinxDyC?=
 =?us-ascii?Q?A5uLCOK1ghfboZb1Foe42BXKnFqXhh3oPtJ798sjnLQGR5lPb0+avqqG6Dq8?=
 =?us-ascii?Q?IlZMDOWAi/PxUAdPXYGqHSP5rlNDWCev3Em11L0cdRjQV8vVFnu5y0zlC5r8?=
 =?us-ascii?Q?2G8s8y3CF2I5/GQ100KlOoZSyXLSlpp3tN4D51jOixRAW6IGBf61J4tTmhyQ?=
 =?us-ascii?Q?t0rcmW+GKlhC1w2QWaPZFM4jAw4Obk+OmXzwMy0tCDMXdtNOCl8YelFOPzDq?=
 =?us-ascii?Q?bFs6f+lKN3yaJRqzkvmokQnCXSQhC5MJtTFx7YUPFoUu0dg1wLMZNonSPT81?=
 =?us-ascii?Q?mx0mPE3GSUePnmXKaxP+/sCcu6cy4eSgzpHb5yhuD62Mkcj8nteGRb5lzJGO?=
 =?us-ascii?Q?Mf8j2jNoQCYkdeEK/jETaDe8yEY8dO78RLCovOa7buCoBYzcQWH3asc5Bw2A?=
 =?us-ascii?Q?+n8NvAHHoA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facb32d8-621c-4679-3642-08d9aa3d05ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 02:42:11.5999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ol54plIKG64oDtWt/PICOv4Z0LaYdRjMPMQoHZokkB+V1FAXq0vdXCAnINSQy8cd+JPhQ5nGF2vRttV5wq7q8vqh3b6YPZuLS4c0GB2KKS7gthHvAQrXl39/UH2GOxyp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2243
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thank you for the patch.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 17 November 2021 10:29
> To: linux-renesas-soc@vger.kernel.org
> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Wolf=
ram Sang <wsa+renesas@sang-
> engineering.com>; Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>=
; linux-
> kernel@vger.kernel.org
> Subject: [PATCH RFT] memory: renesas-rpc-if: simplify register update
>=20
> No need to open code regmap_update_bits().
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Only build tested as I don't have the G2L hardware.
> @Prabhakar: would you also kindly test this patch?
>=20
Dumped the register setting with and without this patch. And also tested it=
 on RZ/G2L.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>  drivers/memory/renesas-rpc-if.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc=
-if.c index
> a9f3e7bdddf8..0c8f00323a91 100644
> --- a/drivers/memory/renesas-rpc-if.c
> +++ b/drivers/memory/renesas-rpc-if.c
> @@ -258,17 +258,14 @@ EXPORT_SYMBOL(rpcif_sw_init);
>=20
>  static void rpcif_rzg2l_timing_adjust_sdr(struct rpcif *rpc)  {
> -	u32 data;
> -
>  	regmap_write(rpc->regmap, RPCIF_PHYWR, 0xa5390000);
>  	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000000);
>  	regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00008080);
>  	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000022);
>  	regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00008080);
>  	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000024);
> -
> -	regmap_read(rpc->regmap, RPCIF_PHYCNT, &data);
> -	regmap_write(rpc->regmap, RPCIF_PHYCNT, data | RPCIF_PHYCNT_CKSEL(3));
> +	regmap_update_bits(rpc->regmap, RPCIF_PHYCNT, RPCIF_PHYCNT_CKSEL(3),
> +			   RPCIF_PHYCNT_CKSEL(3));
>  	regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00000030);
>  	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000032);  }
> --
> 2.30.2

