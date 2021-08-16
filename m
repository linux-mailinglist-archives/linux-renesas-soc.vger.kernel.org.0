Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B25D3ED0F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Aug 2021 11:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbhHPJXf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Aug 2021 05:23:35 -0400
Received: from mail-eopbgr1410120.outbound.protection.outlook.com ([40.107.141.120]:36960
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234878AbhHPJXf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Aug 2021 05:23:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=du2BI1bu/g8QRaXiJ7XLiipCu3C4hRNVAfkZxwUkjOLOEiTrGCZqBTs+OGZ0wst9j85gfiT6NkVpLYEadZmRyzuskdUfFnDNWry56rtGRFhOQlpJleh598Z1RZ3fEHydrQHyywf6gSr94++sGegKJuuY5owyeC6sw04IAuh82UKGxVgaSx43Sn1Ae9jBD2ofBacUTuDDvYnjP6xFN/1jbGIx5uQl4jkuvPmWUfokmPNO3kmDnwSDHv/60UDYceyFVMLx59UkqSVEn11/cPPfaeiAsVcKav1EXtHVx7hVk224LcfwssJLKOUxbwiQtxwsi4vYMEAJHAPSJg6ZAAabFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCYe6q8EDKCOw6sYOCIZyR/DAcR9fFEKRTQi4TAwRO4=;
 b=V07U8jgiCJkEEvJBfJCZwTj5wYZl9pmd/kgEpvnXhs3TZ7+KZm39QaCsHM9kuzsTOgT77GAquTcnfOTOMcLg40RN5xokChgme1k+cAuixrJu96u1ntXhVbV/UdCZ1my1hgeX8+yDmXbHKCP993H6i60x+/RV0a6gs+vXdIoAMxOhS8aibYIlOMECHmOhdfJakZVaFtkVzPI3qBCXzbeCD9ebocF3Y03127E6/KtJRJEaRwUhAxGhOmg1Xh01SkT974+cwQLvtFX07VfOd4Xjp25d3syGzXuQclPv+eU0D7od2uSScAy6ZhBqLtSrgkUF2QHI+H1gcuUnwqdgjwswqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCYe6q8EDKCOw6sYOCIZyR/DAcR9fFEKRTQi4TAwRO4=;
 b=aU+oFzB85R+aNfyDaj3HDhI6OPrew4i9VnVc91OTQNLs0JsJ0fTaNZa+7kXQhjWn28iU1mNI6NFobFzsBm0E5EAzhpnahj2Pcz0RLVl3YV5LZ85FIYpW6WrGnsCA86fbsVRk+wNHVFCs+RXr273KnfQ2/uC2mOOrTxDKl/KLJV4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB1942.jpnprd01.prod.outlook.com (2603:1096:603:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Mon, 16 Aug
 2021 09:23:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 09:23:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 3/4] clk: renesas: rzg2l: Add support to handle coupled
 clocks
Thread-Topic: [PATCH v3 3/4] clk: renesas: rzg2l: Add support to handle
 coupled clocks
Thread-Index: AQHXkcCRmNECTeakTEKTkpDF65Tyd6t12IKQ
Date:   Mon, 16 Aug 2021 09:23:00 +0000
Message-ID: <OS0PR01MB5922B42107A6FB3191DECD1D86FD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210815103014.21208-1-biju.das.jz@bp.renesas.com>
 <20210815103014.21208-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210815103014.21208-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6dc3666-22b9-4348-cef7-08d960977133
x-ms-traffictypediagnostic: OSBPR01MB1942:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB19428FE89518637E866801A786FD9@OSBPR01MB1942.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NfFeOHW5Qf4GZiN8U5xBlAYkUjqtthRIqX2edc23MV+4vqCjl6x0Kqe471P784LYXMn9xWgaDkoY2ojdWwb4VEiRIConKGQ38axqmkNNt2SsKrABDfFiLZoScfFlouWiB/XWgB2mMd3pGmLXV7BlZbquhppAawIW+c2Ux932BE5qtfI4Ma6CvSZebpOgEPbkaM1yMG5yxEG5mA5VjfzojXfg2QXeIS8JJ8QBq/gmQVqqJp28D8z9kjIH4xksQpW9rUNjvfJ3CHzTuNDM2ySoxX2KZLldS5Ze3RCC3rL+e4ltx/tEAA7UWNjxyvwBJpgm3EQG9uli0Sl/hlunTGGyNaEExCXduGRKWapdjGQLzXXq6QeWLlURn1Jnc/cB8q60rdk2BNqO6MyrZjTZVpnjXxICaquGLtBNGcM6PaXFobLq1S5sk0j+ZSJlVaStiD0vkVAYGC29HEZ8vtP4OQRZSBq3llr0iSdZFj5fuBbW4enh5VV2N/MBL3E5lHhVMkDRQaKm+dpRA871yPk8ykx/gbVwSz35oId19qaPtzsnyhcz7BJDLxb4xFVsam4768uHakvfUdxIqt1U6/2PwoY1ZTsaQgmHoBjHSrmp4ZTW/4yQaqD368fzEDvv/B8BcfYP6iIJgp+uFmNGxprcnYamceDSb2UGhtndHIrRgsorsP93VmVpyPah9eJ38dw/g8lx/rMqUq+un1u2M16mgcefGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(136003)(376002)(478600001)(2906002)(110136005)(64756008)(66446008)(66556008)(5660300002)(66476007)(7696005)(66946007)(4326008)(9686003)(33656002)(8676002)(54906003)(76116006)(71200400001)(38070700005)(26005)(6506007)(316002)(107886003)(55016002)(8936002)(186003)(86362001)(122000001)(83380400001)(52536014)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sKbRLqFy7IKX673PD78ovLJFUzSgyQj/seuI+jpySVCGyuMXc7kbMd10viQ5?=
 =?us-ascii?Q?LObI2KrMa7vK2isKAXeBFKyMfu+R7nvmaVBNecVCP5z2UTkDmIhwhU4TW6FC?=
 =?us-ascii?Q?WaVXNIvtjo2+c8rlVG4ss5/b7wpjloP53/TYmwViJAXNNNSA8fFaU2+NhzYx?=
 =?us-ascii?Q?543y09JTyrLqGat34tSU4d3+Z5Fv/OpGIC//SjJ4hDjvw2/HzrwwcvNgu3Dk?=
 =?us-ascii?Q?W1kzUshfZU+fLXy+R9f+nwRBFDpyEf0RP3H5KS8FYf18A012U66BfLKwfu4u?=
 =?us-ascii?Q?FcyEUhUpWBzg0en2up1Cf26yIhQ/pNburrzXyRvKs/JXUUAV6OpHyam6m9WQ?=
 =?us-ascii?Q?J6Y4R9LhEwjQ5uWxZGkhJYG0mdNCHrL3Tg0rJh9fctPIsFzJkVtpjeP4CU0O?=
 =?us-ascii?Q?Z7446NAnbGYzEux4Bx2hpW+eb/gH/eS0CMLaVRhAX/sP5gyM08HuJAn5q9sR?=
 =?us-ascii?Q?wIP5CzlrWVG6XGCQPtg8iOyE5fyOCh78m3bbON0Lh1fGB8n3JpXK4foJZLEI?=
 =?us-ascii?Q?R5GUDzDx3x9IoDFY5Wvk1qaE2ibrTD5D9k9kPPGGSyjWaiUMrOkQssLNNG0D?=
 =?us-ascii?Q?tOxMhwdWf6TP3V6SI6XKe0khgGSbfkcmau5X1J8Oukvvqf6+xOwU/SF7Xg7j?=
 =?us-ascii?Q?HN9DcDZKwRBFghmt8QCKK3lu1eZSGeiLGg52DwkK1zkYrutU3yhJnfD8ubnp?=
 =?us-ascii?Q?SjDNH5+60GrfmGzt1H/1c52U6yvXX/v3vGBqf5HBzTx2g5JdeQXBquzvzLp1?=
 =?us-ascii?Q?K857+eqRysQuvk7P1+0Ey3GYsFtDg8o6dRhZHDQQX0EX5HekxIv92zoiLkJZ?=
 =?us-ascii?Q?GVISLjhzKETCPc8LkWjTWxoOQLxzCHcKrjzox0HP2p+ICJQ/vPfdT6TacJhJ?=
 =?us-ascii?Q?+WzHIAMbuZIr7jQVoAD0uMeA7N8PQfGcZQf/2GPmsDoS26Zfpsr1Yd30PCV/?=
 =?us-ascii?Q?v3dNUXKCtN27WVdPjPMXx0CtG75mhFco6LXTneeVN8pZkP7kfoHK4cxU7lN/?=
 =?us-ascii?Q?Dk1qCM/n8eiWXa/jq0exbh/1vpDwFfg3CKCOkIHI2EmNWCcf8R9+g9EqcOzW?=
 =?us-ascii?Q?bv+GtZtcvmHPM//UsCHHKb+QL6g76BErXjOUIwFQyhofwMoreSPOoHA2DdSC?=
 =?us-ascii?Q?tAl5oTUh1nJeftTiVCBYqSTiCApFUiBbH/G50KnKCchFiZW74h2JeqP0EjMA?=
 =?us-ascii?Q?KvvhFCr4kE0j9rYeNW2OGGXn6jJISsU2uOoI633pFrcEcNIXMaOi3jN4qGPZ?=
 =?us-ascii?Q?lqvVyyVTF7sx/XMbo4v/WWHYmiO65JP4s3Xa7wuhDw2sr3ZzLVox99E/PWxC?=
 =?us-ascii?Q?2CzwTTZ3HHZ+Q0fmdL5hURQW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6dc3666-22b9-4348-cef7-08d960977133
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 09:23:00.2924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQDjRSyPi3JLaG04njtudAKLnCKcw7YXi/E0//PA4WUk426DxHiRTiuOIrVA2xkEFOp9GjzdUwmSY9T2A9Dr0CC2rxiFqDNw3nBCp926fTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1942
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,


> Subject: [PATCH v3 3/4] clk: renesas: rzg2l: Add support to handle couple=
d
> clocks
>=20
> The AXI and CHI clocks use the same register bit for controlling clock
> output. Add a new clock type for coupled clocks, which sets the
> CPG_CLKON_ETH.CLK[01]_ON bit when at least one clock is enabled, and
> clears the bit only when both clocks are disabled.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Reworked as per Geert's suggestion
>  * Added enabled flag to track the status of clock, if it is coupled
>    with another clock
>  * Introduced siblings pointer which points to the other coupled
>    clock
>  * coupled clock linking is done during module clk register.
>  * rzg2l_mod_clock_is_enabled function returns soft state of the
>    module clocks, if it is coupled with another clock
>  * Updated the commit header
> v2:-
>  * New patch
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 62 +++++++++++++++++++++++++++++++++
> drivers/clk/renesas/rzg2l-cpg.h | 11 +++++-
>  2 files changed, 72 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-
> cpg.c index 597efc2504eb..ebcb57287bf6 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -333,13 +333,17 @@ rzg2l_cpg_register_core_clk(const struct
> cpg_core_clk *core,
>   * @hw: handle between common and hardware-specific interfaces
>   * @off: register offset
>   * @bit: ON/MON bit
> + * @enabled: soft state of the clock, if it is coupled with another
> + clock
>   * @priv: CPG/MSTP private data
> + * @siblings: pointer to the other coupled clock
>   */
>  struct mstp_clock {
>  	struct clk_hw hw;
>  	u16 off;
>  	u8 bit;
> +	bool enabled;
>  	struct rzg2l_cpg_priv *priv;
> +	struct mstp_clock *siblings;
>  };
>=20
>  #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw) @@ -
> 392,11 +396,35 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw,
> bool enable)
>=20
>  static int rzg2l_mod_clock_enable(struct clk_hw *hw)  {
> +	struct mstp_clock *clock =3D to_mod_clock(hw);
> +	struct mstp_clock *siblings =3D clock->siblings;
> +
> +	if (siblings) {
> +		if (siblings->enabled) {
> +			clock->enabled =3D true;
> +			return 0;
> +		}
> +
> +		clock->enabled =3D true;
> +	}
> +
>  	return rzg2l_mod_clock_endisable(hw, true);  }
>=20
>  static void rzg2l_mod_clock_disable(struct clk_hw *hw)  {
> +	struct mstp_clock *clock =3D to_mod_clock(hw);
> +	struct mstp_clock *siblings =3D clock->siblings;
> +
> +	if (siblings) {
> +		if (siblings->enabled) {
> +			clock->enabled =3D false;
> +			return;
> +		}
> +
> +		clock->enabled =3D false;
> +	}
> +
>  	rzg2l_mod_clock_endisable(hw, false);
>  }
>=20
> @@ -412,6 +440,9 @@ static int rzg2l_mod_clock_is_enabled(struct clk_hw
> *hw)
>  		return 1;
>  	}
>=20
> +	if (clock->siblings)
> +		return clock->enabled;
> +
>  	value =3D readl(priv->base + CLK_MON_R(clock->off));
>=20
>  	return !(value & bitmask);
> @@ -423,11 +454,33 @@ static const struct clk_ops rzg2l_mod_clock_ops =3D=
 {
>  	.is_enabled =3D rzg2l_mod_clock_is_enabled,  };
>=20
> +static struct mstp_clock
> +*rzg2l_cpg_get_sibling_clk(struct mstp_clock *clock,
> +			   struct rzg2l_cpg_priv *priv)
> +{
> +	struct mstp_clock *sibl_clk =3D NULL;
> +	struct clk_hw *hw;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < priv->num_mod_clks; i++) {
> +		if (priv->clks[priv->num_core_clks + i] =3D=3D ERR_PTR(-ENOENT))
> +			continue;
> +
> +		hw =3D __clk_get_hw(priv->clks[priv->num_core_clks + i]);
> +		sibl_clk =3D to_mod_clock(hw);
> +		if (clock->off =3D=3D sibl_clk->off && clock->bit =3D=3D sibl_clk-
> >bit)
> +			break;

Just found during testing, instead of "break" we should return sibl_clk;=20
Otherwise for the first clock, it gets a wrong siblings,
Which will be overridden with correct siblings during
registration of other coupled clock.

Currently it gets into the loop 4 *97 =3D 388 times during registration and=
 the extra memory is 97*sizeof(mstp*) bytes.
This solution simpler and neater.=20

But not sure we should optimize this by adding all the coupled clocks
into priv structure (4 * sizeof(mstp*) bytes + 4* enabled flags + 4* link p=
ointer) ? and=20
at run time enable/disable will go through this list, find the clock and co=
upled clk and based
on coupled clk's enable status it will set clk's enabled status and set har=
dware clock

In that case rzg2l_mod_clock_is_enabled will also need to find the clock fr=
om that list and
return soft enabled status from priv structure.

But this solution has runtime overhead of finding clk and coupled clk from =
the priv structure


Cheers,
Biju

> +	}
> +
> +	return sibl_clk;
> +}
> +
>  static void __init
>  rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
>  			   const struct rzg2l_cpg_info *info,
>  			   struct rzg2l_cpg_priv *priv)
>  {
> +	struct mstp_clock *sibling_clock =3D NULL;
>  	struct mstp_clock *clock =3D NULL;
>  	struct device *dev =3D priv->dev;
>  	unsigned int id =3D mod->id;
> @@ -484,6 +537,15 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_cl=
k
> *mod,
>=20
>  	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk,
> clk_get_rate(clk));
>  	priv->clks[id] =3D clk;
> +
> +	if (mod->is_coupled) {
> +		sibling_clock =3D rzg2l_cpg_get_sibling_clk(clock, priv);
> +		if (sibling_clock) {
> +			clock->siblings =3D sibling_clock;
> +			sibling_clock->siblings =3D clock;
> +		}
> +	}
> +
>  	return;
>=20
>  fail:
> diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-
> cpg.h index 5202c0512483..191c403aa52f 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -93,6 +93,7 @@ enum clk_types {
>   * @parent: id of parent clock
>   * @off: register offset
>   * @bit: ON/MON bit
> + * @is_coupled: flag to indicate coupled clock
>   */
>  struct rzg2l_mod_clk {
>  	const char *name;
> @@ -100,17 +101,25 @@ struct rzg2l_mod_clk {
>  	unsigned int parent;
>  	u16 off;
>  	u8 bit;
> +	bool is_coupled;
>  };
>=20
> -#define DEF_MOD(_name, _id, _parent, _off, _bit)	\
> +#define DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _is_coupled)	\
>  	{ \
>  		.name =3D _name, \
>  		.id =3D MOD_CLK_BASE + (_id), \
>  		.parent =3D (_parent), \
>  		.off =3D (_off), \
>  		.bit =3D (_bit), \
> +		.is_coupled =3D (_is_coupled), \
>  	}
>=20
> +#define DEF_MOD(_name, _id, _parent, _off, _bit)	\
> +	DEF_MOD_BASE(_name, _id, _parent, _off, _bit, false)
> +
> +#define DEF_COUPLED(_name, _id, _parent, _off, _bit)	\
> +	DEF_MOD_BASE(_name, _id, _parent, _off, _bit, true)
> +
>  /**
>   * struct rzg2l_reset - Reset definitions
>   *
> --
> 2.17.1

