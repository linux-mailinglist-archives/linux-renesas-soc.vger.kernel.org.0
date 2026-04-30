Return-Path: <linux-renesas-soc+bounces-31855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BOQLR9782nH4QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 17:54:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC484A52E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 17:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12053300A4E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 15:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A58F44D035;
	Thu, 30 Apr 2026 15:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XBkD9Ynn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAAE44CF5E;
	Thu, 30 Apr 2026 15:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564445; cv=fail; b=TVJLfFQc0m2OzqPxt0m7CnxqhBpONwm6BxnFBqYex1jc+bhYwWtXapnp9YVf5pxAvBLiAoFeqe7uArSOu9fiQcMdaEjfV32pmn6J0X8Bc9EKhWghUh6ISn7EPGAx8DS/qPaBExxupskxxMgUatijakVtK4Gjlwt0TdOrxIFFQtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564445; c=relaxed/simple;
	bh=xvhcwGL5MBuhbROa47pGTVeqKcqSgXImx3aMF9c/RTw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WjfEbc3i/Fc0LCL8tlxf8p0pDD/1k7RfOLY2Z6wYalQ21Fbtz4cS55gGFT6yJIswePurYQ7W757EalmIQlpH49gVNjwMfU06G+kvj81ymcM+ENzuRAUN/6IBCsWMf0/LeRcKI+L5jkYZYw2k7abYCZfQr5Xkalt0zoRK7yvu7V4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XBkD9Ynn; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdQVLWXCRQO+wtcgHh5zfvUL8eHVYu84MZJqCLURRm21deooQoZSEDnv3eBNwEDzqVO/FPkremhOkZTtLiPZ1uTPAPMjxjkpUL4iGGW1nkoqkB5bSOv4j9Pvg0ycfBb/NMXOinMewh20oZyw5ppN7mqz70VKJm7NDQMAyDxdpcnBh6Ir1iAI+y3hz3giqEH24LwPTPjw49eFMYPt9cJ87SAxluOvig35vHTFVEtKrf4Cl2d5j8aoiB7Gih5i7OogI5OoAfyT7H9L36aBvfBc2RPhKp4K2c6czqJVsiVbYSIYrehto+BLycYQ6kd/IvJWMfzIvDb0uAQI7j8WZ4xKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luTvAiMAUEHJS2JsxKyTvD5okvTmU5Fa12EWdVXHgqw=;
 b=rGuxJxaZFMW8Us9vwMIGiVgNFQ95Y5btJGB915F0Wt1g4o/zS8QcemrWGRCX6WoTht4F70NoqfYOeSErJIV4Zqg/gH79VTdvdTwJVJ0WMYDCyQDR8RdTorGwPJyhsZHJr6bZlTDBwRPutdJ5wtKCePkcHnVTlVKpm0m8rMM/CBgqsybZ9JCAynI2WtYeXgVD2CVP0eYk3mEbpZDlpmyzXAa6N6D0qR5+YyX8nsZOg/mdiF05W/LnJLwKcqiUUanyiRUG8zNW4nGyAC+enIeS1Eiz9fGjDefuHBLckJEy4Yg2cVGxJOcB7gqe1tYcmA0827WrvBSSFEOKnx2MsGR95A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luTvAiMAUEHJS2JsxKyTvD5okvTmU5Fa12EWdVXHgqw=;
 b=XBkD9Ynn+hiPqeYsUTSI+0j9L47EnQL0kFnAeaUgi4js+CVrZhOw3SFIX8XI0BM2Cpt3082K67NzEgotW2egVlvTIQcCm/vTuQIrk4jWVBwo9mYCay+R6lQzRXHeHQ4ljyBkYInRrGz/WhlOj2b3pjt9an0okOOi562ttcoUFxo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7076.jpnprd01.prod.outlook.com (2603:1096:400:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 15:54:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 15:54:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 1/3] clk: renesas: rzg2l: Consolidate DEF_MUX() and
 DEF_MUX_FLAGS()
Thread-Topic: [PATCH 1/3] clk: renesas: rzg2l: Consolidate DEF_MUX() and
 DEF_MUX_FLAGS()
Thread-Index: AQHc2LTi6HNNC/R/0UCjpAVOQaoPKrX3wX0Q
Date: Thu, 30 Apr 2026 15:54:01 +0000
Message-ID:
 <TY3PR01MB1134606ED74F3B5D0D261905F86352@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1777562043.git.geert+renesas@glider.be>
 <46e2713f39cc5efc4b05a65723e0781a9dd8291c.1777562043.git.geert+renesas@glider.be>
In-Reply-To:
 <46e2713f39cc5efc4b05a65723e0781a9dd8291c.1777562043.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7076:EE_
x-ms-office365-filtering-correlation-id: 61237341-548f-4235-32ca-08dea6d0b2df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 Zjm9qMWxvetjIG2bDVfjCPmkyTasZVLU4bUx2gLmMSKORhN4FjveY+Jf8nHml/fkyCZlWO64XMi7YuHK2WJpZcHy0JiS5t7UH7GmFEsOoH0CuISkfDAInK2vEvhjx6wASf+dEaJ8f5N+zIbAR7eQ85ltjgKCYyYZCceqHMsPN4kflMwXDHAI1TPZQ+AnnCKaM/Oz9IeDk3b/sNpf7m9MhscylzNtGQAxWXV8FT4qGHHd27Y2gQjAh+VKFGwTB6HhMHmU0SiX6sZIcoQrH1zctWSaOcsXFAytGxkIhwVzkWuXjdk9m0J9SZuYfj0hC8P31oLyqLGFFK/JcNqEnD/5v1ErH7doMM8OYAeL2evI5nBYqKoPXonML4jx0SV79ycQ8Yc2Mwro3MCBkhh08wf8YWOjnGBai3BPgKMJq8zOpgxa7iFa5mIHw8CONcOnQMwE1vRP7JGsa8om4zqFSgDM02RZ80RND+lGFAm55u4Q3G5XDP2hvw+J7c/LqKlXoiYIT6Ykl/5TaBYUhSvIKYHgZzuix4eziF9VLibMI09/nZDe9zSMzfBSmwS6hxkq6RyE/FEXrm6HVmMvcFpYN6f73IOshihgfHpiE0OS674xBPNsgDR/1jc/4d0Jw9ruQmU59vvweMvf20bX8La3D7FHQfwRwR7DLy6PMzCI3PhbyU7g/AUfr1hd7MJ23ezrs4FIcdVXbrhukGSELLLiNpcbumndfeen83+9iMSwxbwwP5JJ+f3zRa22JCgfNSy24XI9vTjw4OaQdH1/xl2h6sbj5OBzhF8aRBj01qYZNQ1py6k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Izp04S7/5wuo6IIt3DtdtwxvgTJVEybjfx4QKkiGeh60bgtQrISCT1cc9vKd?=
 =?us-ascii?Q?JARLB8BMNP0ZT/O6RDAxbnTwuBttHykfwx9aWfQoCS21XYPsD/RucSZlDwE0?=
 =?us-ascii?Q?Ctr8TqPIotF/2X0JWvyG+bv1NxOc6gbc5AiKIcXbEpb5iy1scJzwo1R7E3dG?=
 =?us-ascii?Q?Sh5Dl+JDaIJvgtfV4ueuayt2FKpMnsVZKsKyCA6zVIbcOIDove2DSt8+Q9ch?=
 =?us-ascii?Q?8YU9G+xLbdfiBmEwBvCGyLx/CqWZHGEj42jI88n11eQKOryWsCDuZFfZPOVO?=
 =?us-ascii?Q?9xmm86v1IGGI7z8XmsMKNcYN6LeQsTtIMRaZ/TN99UACoqIxJil7gZ1tF+lW?=
 =?us-ascii?Q?vdwQTuiFiiDx6V1V7o2gNwE0hpXB8YaYwovEp6tPZCJM2Ytc2LPCBfAz1Ley?=
 =?us-ascii?Q?/gwVrgsASOnM+TCXFA+w0Hezk7ZFV9VYiqlml51m2+u3fE3manodHvs1Ruhq?=
 =?us-ascii?Q?7s60AcPNtIyb/9XA1Yb6x7X5tGZOi1GoOjJ+r82ZV8VWG5lHM7Libp1pAdGc?=
 =?us-ascii?Q?3pm72aR8kHY1Gwx2D5xNLOqIYqoHBqf327lo7O+p54JqenPV3pwFvpHDyjkn?=
 =?us-ascii?Q?CZUm8NJQtAISU7EakU0CmyF/V85l52PU8U2ELq4bXBXPmNpOLF1Tu7yR4WCt?=
 =?us-ascii?Q?TbjiH0y3uuVRiVzz95iTAPKPSxieom8Zud0xRENs+H3WYdsd11Fkjc47p/I1?=
 =?us-ascii?Q?MbtPWufw85baI7OOcD+DakUEqIv9EAftu77DZTvS+mfv0JZpk8vRNJCnMK20?=
 =?us-ascii?Q?qevSDt58IKHRerkZEFCgGbOz1wVbQkMDRIEfrbwquih50vnBdEN11TKLVFcK?=
 =?us-ascii?Q?QgLItZ1Jd5Q1S5oyuWRLtXDDvxpeh+aizqbj5kcumbruOm2aMgie9dBzfeNI?=
 =?us-ascii?Q?lWW8Qa3HhlTVw7bw3vfxQUYXr5RdOaFPBbg0QGOehmRCeGq6ypClt4LfYFDc?=
 =?us-ascii?Q?jmVNG9hgeWigWD5D2IjSD3X5/E0Fy0OV/xvDgCkNIg1u7zQNcSfVO0JqjQjb?=
 =?us-ascii?Q?TIIQM2lVsJF6eGvfblGwYwTv5+X6waXofC1N2R+INZwOacd/5qlB5QJ5FgoT?=
 =?us-ascii?Q?8DJDL5VJF3EuhPsr+SE9uCM++UjFuF9pAxefrFEOeqTHHtvOY7DLkeyMsxM6?=
 =?us-ascii?Q?1E9n9qS+ocrFgcHxoorK5P8HMC8vWBXIBawASTRJy7XkAb4jy7Lku956q7Xn?=
 =?us-ascii?Q?BWtxIx7bviqTHoXtvy0/gnTfVmvLq5nETEZdPG0w+xP2uBZ6Y1nqOp89rtHv?=
 =?us-ascii?Q?7fR2j+uUF3MIraVoKVYAD+t+EdvTeRVx/uNTtDrj9A8vM5B3ZTjwc17f/Vv5?=
 =?us-ascii?Q?l/VaUek1lUCEzxCbov0o/Iut8PiS5r5XlM4Lo0qX3ZrK+XL7zgTRnzYxi0WY?=
 =?us-ascii?Q?MkKkvuSeIi6kt73jRtQxtyfFtm4pX3UEyjrwWl6ZVbC+7a3TUpAygdUAlfDX?=
 =?us-ascii?Q?WqtFOH42nK0gMTXYTKtzAKGlVyAHNTGP3vXjT95dj5q9enmqy0E8/rfjvIr3?=
 =?us-ascii?Q?wQh3i8wx22TEk6Iewzod/zLh5LRdCYeBgVbQ+ctZhO1tGoDkON/sTdWXJ7fC?=
 =?us-ascii?Q?SdT/RVNQT4Fp2k/cTl1He1puTax0EYw52Ns7x8Hiy9eAHypK/ZAbsXmg2Irv?=
 =?us-ascii?Q?K7c/2ZCSWF5S/cZMY7OYTAm3FS3ldCNRkzL7ecxbNM0zyUIWLWN/Sio8A1Dj?=
 =?us-ascii?Q?lPcsTb2l1UvfdJr2YFpb8TzI2a8y1/wvPlD7TBHdCyresprWBhsHYjM2xk6L?=
 =?us-ascii?Q?27CUz7HmnA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 61237341-548f-4235-32ca-08dea6d0b2df
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 15:54:01.7488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9qbAkgNzg5KpQUF11thJS11BOrO2dnovF+zZxZ/k/3zlkj2E1cxyQvlSzTgScYiNyJs2VTuiGvPboDIOCFheU+hfcyc2SbvqEOdF0PQLu2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7076
X-Rspamd-Queue-Id: 2EC484A52E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31855-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Geert,

Thanks for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 30 April 2026 16:20
> Subject: [PATCH 1/3] clk: renesas: rzg2l: Consolidate DEF_MUX() and DEF_M=
UX_FLAGS()
>=20
> Define DEF_MUX() using DEF_MUX_FLAGS(), to reduce duplication.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> No change in generated code.
> ---
>  drivers/clk/renesas/rzg2l-cpg.h | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-=
cpg.h index
> 0e63b62e84350358..33f54ba0e64ee628 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -178,22 +178,19 @@ enum clk_types {
>  		 .invalid_rate =3D _invalid_rate, \
>  		 .max_rate =3D _max_rate, .flag =3D (_clk_flags), \
>  		 .notifier =3D _notif)
> -#define DEF_MUX(_name, _id, _conf, _parent_names) \
> +#define DEF_MUX_FLAGS(_name, _id, _conf, _parent_names, _flag) \
>  	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf =3D _conf, \
>  		 .parent_names =3D _parent_names, \
>  		 .num_parents =3D ARRAY_SIZE(_parent_names), \
> -		 .mux_flags =3D CLK_MUX_HIWORD_MASK)
> +		 .mux_flags =3D CLK_MUX_HIWORD_MASK, \
> +		 .flag =3D _flag)
> +#define DEF_MUX(_name, _id, _conf, _parent_names) \
> +	DEF_MUX_FLAGS(_name, _id, _conf, _parent_names, 0)
>  #define DEF_MUX_RO(_name, _id, _conf, _parent_names) \
>  	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf =3D _conf, \
>  		 .parent_names =3D _parent_names, \
>  		 .num_parents =3D ARRAY_SIZE(_parent_names), \
>  		 .mux_flags =3D CLK_MUX_READ_ONLY)
> -#define DEF_MUX_FLAGS(_name, _id, _conf, _parent_names, _flag) \
> -	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf =3D _conf, \
> -		 .parent_names =3D _parent_names, \
> -		 .num_parents =3D ARRAY_SIZE(_parent_names), \
> -		 .mux_flags =3D CLK_MUX_HIWORD_MASK, \
> -		 .flag =3D _flag)
>  #define DEF_SD_MUX(_name, _id, _conf, _sconf, _parent_names, _mtable, _c=
lk_flags, _notifier) \
>  	DEF_TYPE(_name, _id, CLK_TYPE_SD_MUX, .conf =3D _conf, .sconf =3D _scon=
f, \
>  		 .parent_names =3D _parent_names, \
> --
> 2.43.0


