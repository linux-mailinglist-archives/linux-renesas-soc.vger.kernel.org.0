Return-Path: <linux-renesas-soc+bounces-10768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9030D9DE8EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 15:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 103D1B20B53
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 14:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A17B6EB7C;
	Fri, 29 Nov 2024 14:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rnOHLr6s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011009.outbound.protection.outlook.com [40.107.74.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B61F94A;
	Fri, 29 Nov 2024 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732891772; cv=fail; b=CKwM95UeZ9EcGTJFAbxzy56thKqmhUYsZJkhvHCTm/gShfVLM2RKc/0P4VZNfjq4JmLsRkF1dLd32IqOAM7oVf9h9RaiunY9Dm2U83k16496DDlvsCw/Dv4ABjZMCC5S1hWEj03IPDzPdbdtPu7gKmpnuUI4PORuOj9gHRgIwu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732891772; c=relaxed/simple;
	bh=ABl2lTDXQkqYouA19zEXUz2P7TBH74iRFFxHbLA9/Vo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oc/2FK5wVwZonK+83o+uqLm6jpdnpsYwPx2knx7Wfumb1QZD8+LksDqvxxy4lpZ2fyT1lbleTeM51usmB/VrVhYiWQvK82FS6NST8Vstz/6F9COJznq133+gRoudLE2+d2mubJGZOmquwyhVeDreRFpW8eiHcDs+IihTObxp0cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rnOHLr6s; arc=fail smtp.client-ip=40.107.74.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+gU4MoS8+EiVAsmmvr0clCG2q3p7NdH4XfQOKE/BplAi9u1iJTbqjIQ3mHqzEFS4FYeg4AlE/DcW3fJPpqru2rtFyFKoHkvSdXmKR3MtSpOnCPOgY9Xom7AYN84OLQ6jmthTCnnbDDUpFWc3Y5woMWQjVvPBw57dKfVcq5dXnSpt8HB4e7enX2legh2X7Oa1t2LwFwkpRiigtx88RPBqvys81rAoTLKsQUAj8vvIZr2Ec/YrOey+6UkvyvLAUw2cQB19qfcABbeDnQlHqIbGe4c/suyvUHzkKmSzGmOtKFvJLbnT+lIU3BXCR+KyT2QDIfkUlwmTVWNEFCpHVneTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsIjq86+dJl+wlN/56byhxKgi9Q7GwHBqmQcsKldx8o=;
 b=O/xXm9I5gsPM1qwpGl/MIWZsiOp4A+FCjZ1uK6JPSeCv83yQwypd0qOO577bqqRZJxJY8NjU0+J1We+e3K4G82fLnb3LmDWMv8XuyICbV57VIRfzHJ+Y6caj6Arz+JtWaADcwbC5YSf7clBdBuPS5nsIo78ew7Zmm7hD4qlUnbolMQ6lR283kotCrn9L/FC1ZdgrfpYwsWh8fpp1aOOoMjqQQyv7rjBa/0WSxSnktv+QU9BCHFGD4HqkRxi1djnxe4sZN3d9C/xd0e0GpXP4/esp6oiq+vtwI5HFSpyEHjfiVrtN8NUiwkCMtJP04huVoluQvPwuSk7XfxLPGamNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsIjq86+dJl+wlN/56byhxKgi9Q7GwHBqmQcsKldx8o=;
 b=rnOHLr6slI/MGsDDNDrVWsNTNOzXM3JjOBEZzZguTE62vIizYF2UxZoTq2mdyU1DUXEMAXq84Fy4cDE6sKmWY4QiLbi1ZanBuRO7EsnjANgrdOTkFqA94/6jSh9RdDBF1wabvc56t2I0X50eYi4UYRK7Xs5Z648e+UGu7Jn2Kpo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10257.jpnprd01.prod.outlook.com (2603:1096:400:1e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 29 Nov
 2024 14:49:23 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 14:49:23 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 07/12] clk: renesas: rzv2h-cpg: Add MSTOP support
Thread-Topic: [PATCH 07/12] clk: renesas: rzv2h-cpg: Add MSTOP support
Thread-Index: AQHbPNyXGuRHCZxBfk6ShhUomJTbBbLOYRTg
Date: Fri, 29 Nov 2024 14:49:23 +0000
Message-ID:
 <TY3PR01MB113465F653BC09AD4E3B3B20B862A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
 <20241122124558.149827-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241122124558.149827-8-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10257:EE_
x-ms-office365-filtering-correlation-id: 3654282a-e5e9-4855-8b86-08dd10850377
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xKdVgjLvpvxNr1QDgYjy9AopVwca+DUbxEdolzR+aGvDhCKqHzjDGN3NjWwE?=
 =?us-ascii?Q?1mP/Qb1pdEK51J/94oHfUJgd8J0Fr0a+JREVNFl6gzzt3Q5XHQYvUkoSjWwn?=
 =?us-ascii?Q?lXuIG1/QgfmvyhIMc10png4Gw7PGJIW+WPOOXTJwuMWVhkfHth0thzy4Q87h?=
 =?us-ascii?Q?weT8QGJngofS+umwAaJcKoVSPXVSkhhdixEbH8rTnnahSJOZVsHKEDZbPK1j?=
 =?us-ascii?Q?Q9q40/7ACHVU8BpVbzjudqeD6rUQbpLTqg26sxByLUObNqJDG76wiGFmVqIV?=
 =?us-ascii?Q?hQO4mbsxh30hebQDsJrvKbCe7SJngvnjOfMk2letgF4oHP48he7FHZH5wt0t?=
 =?us-ascii?Q?MHgWEFzUKfJ2gLlpqLtdxxWGfUCh6Miw5rDDHAO9MkuECdsSPQpAn71I0Mdf?=
 =?us-ascii?Q?f2dxNGM3kGeyoVkwFwp9QdyGxmlePFQsYGZ/h2ochdDOQRmN41relO5tceJB?=
 =?us-ascii?Q?rzO3vzLjosuTZjuNGHQX/NKPkuy5gghlx5wDgTm+10785CYrypyCV9AwVDxe?=
 =?us-ascii?Q?TopAVh21p2T0DNvcWtvYlVS5C2EGiv1/GwXtB4Y6rI83QwHo6gRo2sGNNCpY?=
 =?us-ascii?Q?7374wcgidP0eUnH1sFVVaNrk6JMWrfqeG+mjXUBbW+35+YfJpTt39/PYY0Vs?=
 =?us-ascii?Q?149ArpOolvIz1cve9YSjB17odYp7K2YweQD0J9bSX7/mkYx+0b6P5+KQ3OQe?=
 =?us-ascii?Q?JqeEN+Kw2UjfOm4WTV9olna49N838efKBCp9527CE1bzu6rnI58uvoi202Yp?=
 =?us-ascii?Q?Raa4u39gcPlkxVgHGutPQfNjaoPS4C68yCC++06kRmEb8KBtndZVpYYTIO32?=
 =?us-ascii?Q?pBm5nv/NRuNESpGeTR5yXkARsAM93Fmt+FYnT40J/IgVJOHJLaRVn4j5RI9Z?=
 =?us-ascii?Q?qNIOBOHBn1Lq9sZTEMYq+Sjie2oEN4OvutXygEnzrj9QlykfmHLmO3/h71xC?=
 =?us-ascii?Q?WP/SEf7IPeXAAjQuICvDCbDW315DcrgwXdYVCBJ/dmqhGwSqg6ei8wPTFGIZ?=
 =?us-ascii?Q?ycrwfQoV4YnA0xvjx3yyHj0s+0qR0Jv6FcAc8Iw3BT+JjKCo08RwkUuutzwy?=
 =?us-ascii?Q?/fG1C2FwlIMTThEt+s1A2uxQ3b/MAKJkHwIAVE5pQ5X5xWxs8C5V4LZwLzRB?=
 =?us-ascii?Q?ACuUVAM4NPI7kKd5I3T+UAgGZxlsCjX382CziA8mRabMG0GCp2yNjt3xtMTy?=
 =?us-ascii?Q?seQACxn8LRrWLa7UT6KQX9hVGqNPdalq7Pam4yaAHB6sdPpF67YKm/TIw2W+?=
 =?us-ascii?Q?xju791C52lr3BeebM2zTerAdv7dfDSYNcVG5umqO2VzUqxGflmPiByt5013F?=
 =?us-ascii?Q?Sg8klwPLAsOR30cBkf4/KPtBbygQZms11AlqzB9pX+oNxiW6h1neIsihwKuu?=
 =?us-ascii?Q?/vDnr3tgDHNUa4Kht43bdV81g2Cw0zc5qIoWNplOJMK5TwQRTw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uYG64lCsNJ+sIP+ddqSJPe7ya7wPGxDpc2P7vax2TauVIQ/CB5AegrqB5bHq?=
 =?us-ascii?Q?F/r1KRA6hg/hMp3q+7bWW3L6VQ2hYWd5a/2Cl+dVBzRZfScxQxIWX4NEwJdw?=
 =?us-ascii?Q?NdK8QMwXRejscCZgGm+m3Le5zA1soTG6QfY7+6xdNFll+uXmYYJuM2jOT9no?=
 =?us-ascii?Q?UkEFuDeILDkTUcSAiIoDzB0hBHk6haBjr20DIn77vR8WZ0Kycj2V2a5W0KNn?=
 =?us-ascii?Q?Yfm5rzUAq0HOvw0F3Pxs67ygSBE+KoqxVbdlndRT0hTJ2vujIV6hes4sFawc?=
 =?us-ascii?Q?PQPSYp+N9o11/jdzgcfgt2jRQUwjmVRIPrSLXWNDIIuJFji8aWd+Zvc5girD?=
 =?us-ascii?Q?+aoIC7alPkonkRUlBZQY1qKCUj0OKz/HoFCIy611WjgiDBrMUeaV1DkKUyNw?=
 =?us-ascii?Q?Q+SxEE01h6UOIP66TauhCtOfZEykX+jETBxNB0gWSvTHSrYipQ/YyP6YsmX/?=
 =?us-ascii?Q?6Xw2wwlkqbn7Cvjh0fH1QDkYmS9IC6+JNu2a1HTfNXDkBgameH/oivCi9w+c?=
 =?us-ascii?Q?HK+IXS2AV99QIbSc3CJZoGfo/9jkzTq7zR/Zfi/EgQo/RspkHDpbn8nbKv/O?=
 =?us-ascii?Q?5Yf36HNwixpQYFU2T4xym5v0lzGuBQaw9cYjL5W4gOZ7z5OXEADnzQ/kC9dk?=
 =?us-ascii?Q?sZx1JVC61OGPH/beNOukcJiIA1CuzUehgqYy/TZ1d0xOZKK8hRNFacffmnxk?=
 =?us-ascii?Q?oF6+T8YEODWW1hDU//ul8Bp+SpR+WBCxFYhcAGl7VWIKhEJkj6+px8GZK3ld?=
 =?us-ascii?Q?NZs5x9Vjwgq/h41oe/YFlwOkpmfpfKS36imGELVzkZAC6h/k72dqAt7Feslg?=
 =?us-ascii?Q?tcSlqxeNFsYo8f0c2I2x1tkBZDhHVAQGSfYkXCYV/rSRuAChaO2EPfi4XDNV?=
 =?us-ascii?Q?W6CT8/5dsViheUuEQ5/shkPgMmb9RapUYeRYEs6c6kPlj8RxKW00kXNxEeuI?=
 =?us-ascii?Q?ZJx/svxBOFufM92saScH4/ul46t0h+SRAYyIpBd9y2c6o2GcgvF/jgcLzuPq?=
 =?us-ascii?Q?7nS+C6YWMM8QbvB8WHK1okkuHidbNpyc2lsPLdx3sI6VU85n7w+U11QRljHN?=
 =?us-ascii?Q?nghEkwgaKqn7u4/tXgpfkXMNVE596Ndyn4MD0mYWhDalbrGIazk6PMC6vnti?=
 =?us-ascii?Q?5/HyfjusakPiMDO5VRL+jz7jvcxD6lcSg5d//PqDlU3RjkLJ9mMfWXhcAiL1?=
 =?us-ascii?Q?EOvWuQ7tIXVPvSzbyAX0fl+t7RAJwUs0tm5TZ/DWjefBCe/pqsBdLH5phwSp?=
 =?us-ascii?Q?JBOmvTImxauKOA3DzWJ1WQKNljX7U1gjSheda+dLvUJFlaR4DSZDLOpSh/YZ?=
 =?us-ascii?Q?0iagogLcwyK24MbDs9DIfnKnB2kLligWPSkCbFY8iQncg4mF1E7AKsfu7Vtv?=
 =?us-ascii?Q?eIWUC8SMPD3RMWXuaNC0cAARXIhj3kh4Bv1Z06zwe7KY2EDQJ6AiLatuQIPh?=
 =?us-ascii?Q?6tjkO4WDzYayJUkoDbpaGe4chLbWScqnxe77GH0IMMWfJsiSiVO7PF2oC61U?=
 =?us-ascii?Q?bwH9vm7sQBlcDErTAQBt2uYpQqAGAEXD589rHzWzjP7Gequo1zGQAYWtspTx?=
 =?us-ascii?Q?E7EQj3TsmqVN7OYsZ2nQ37KxSILLfURcdGoHhITAsARN472CslwV5UUyYn3y?=
 =?us-ascii?Q?IQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3654282a-e5e9-4855-8b86-08dd10850377
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 14:49:23.1104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQblwZvMy/cDWKIHnRU+zjj/I/vLnujQj7kTaBaiStbRHAiGguJNWNZa2eJHU8p6hfYFrzENNW1eudsUZAhmvptiPB42P4P66aObZNnGtyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10257

Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 22 November 2024 12:46
> Subject: [PATCH 07/12] clk: renesas: rzv2h-cpg: Add MSTOP support
>=20
> Add bus MSTOP support for RZ/{V2H, G3E}. For some module clocks, there ar=
e no MSTOP bits and the
> sequence ordering for mstop and clock on is different compared to the RZ/=
G2L family.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/clk/renesas/r9a09g047-cpg.c |   6 +-
>  drivers/clk/renesas/r9a09g057-cpg.c | 117 ++++++++++++++++++----------
>  drivers/clk/renesas/rzv2h-cpg.c     |  92 +++++++++++++++++++++-
>  drivers/clk/renesas/rzv2h-cpg.h     |  22 ++++--
>  4 files changed, 188 insertions(+), 49 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9=
a09g047-cpg.c
> index 5d7611cee9bc..ab63a7e7e480 100644
> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -69,8 +69,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[]=
 __initconst =3D {  };
>=20
>  static void __init
>  rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
>  			   struct rzv2h_cpg_priv *priv)
> @@ -552,6 +630,14 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_cl=
k *mod,
>=20
>  	priv->clks[id] =3D clock->hw.clk;
>=20
> +	if (mod->mstop_data !=3D BUS_MSTOP_NO_DATA) {
> +		clock->mstop =3D rzv2h_cpg_get_mstop(priv, mod->mstop_data);
> +		if (!clock->mstop) {
> +			clock =3D ERR_PTR(-ENOMEM);

Typo this has to be clk =3D ERR_PTR(-ENOMEM);
Will fix this in next version

Cheers,
Biju

