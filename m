Return-Path: <linux-renesas-soc+bounces-21853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 148EBB57439
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 11:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7159189ECBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 09:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E132ED174;
	Mon, 15 Sep 2025 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dREfCPjV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2051.outbound.protection.outlook.com [40.107.113.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9DC1F0E29;
	Mon, 15 Sep 2025 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757927595; cv=fail; b=orsOXw2AnFPJ/ExJ/KlkMIWeja8gES7EPhx5ZRKyj6ZqdpDfrCXDKqOYOGdfjHnfB9uYlTwCvhluvFFEEsrGFM8xxuGLMPLHvwu21GJLO2xTosIKQOo/wU8ld9XtvoDnBdHvBDKdO9cXp3ITZKKsoC7nXSgN59GhQr/x/SuEpBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757927595; c=relaxed/simple;
	bh=aHkIxfJJmWx7LYLQ8VywEK86YkJ1eTiJcA9oSJ94Js4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=la7ac5lZDzBLE/l0M3xkjO0eWZ8IIEoCBpPb+HNLnysSN3Cwsr49BfPlxSp6FGMBIUAklgqbTLo5s1a7ip4vRxQhdVASFf2taMRk7HxVlG8IdD3Sj7RgZfNRawJv8xVSNtpeCAw71ISZ22zOOpx95CfykVBratZZ/lcJfUCzCCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dREfCPjV; arc=fail smtp.client-ip=40.107.113.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrJC5ZMNUEng6yRlaNK2v7tH7rWckKnmjo135YXbL0TZZ6hgINgOB5QZ9JWho8SsPTsIKU2JSksRs7MrZ5pUhWvS1L01RSdfzLf3db8qcv3xnEI84kesWq/lMTXSAZlLTw7sGsG2qnbT0vBnL/uqjC4sNelyoL2oj2/PCnktsIPG1UI6LVt/8TWBi+x60J81XqBRq2KCajbmQaSonYrKuU7/gxfnC3MIO7dPosDCkylRsEeM2Sc8yqNnAxlv03zMureSftLl/HGx6B2yQmYZdVnvR0pGPN+JkwWM9X8/Czb1levjNXDw8naiB31AxN9v8fp/MBwUtNpZuA3Tx+5lwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+lFZ892ojGQnqijE7my3/g2bq+sYxXbsdhZsEsgVe4=;
 b=hXdYrppZhRI01jwkVTqIk2qq0TQ1tj4CJH3FJsk0RElEC3nkdTTlXDYlEjukc1catCHhi8LCXm8oVCTpAgqtx1YYkbv79Hzie9Fq4Z6Mou5pi2bkH4aslp9w4Q+a7phnhdSLOnMAT+D3ZuhuIUyizH3Bgof1piXcBr9GkAcuBMuW5rSMqDhFr5rW4j3FIwWafzABWB+bQYIWn7j88S7Z6Ca+T+kPGcOMWy6kURXgNNUjsFlfCN46/2W8IGVWlDAzRaSHgDCGLBEm54IVFC6d0kW6WZJa7Wgsl/nmtRkVPdIfICTnH3ocHMHW/H0a+jDuLyxvkAZ5sH+uPyCX4beM+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+lFZ892ojGQnqijE7my3/g2bq+sYxXbsdhZsEsgVe4=;
 b=dREfCPjVHRHIsLvfdLlFYo5J2PE8iYvXw7vLjhQ88YB3+/MluLFHDBIJXSkfZEFiAc77L4kGNkm4QBfEH3qtsGzrwsMu0RzigB3+1mmR0+plv5FNnf9yKgjUZfLACn6QzZYMDhtAz4CI6ftb68BEgqDFnyFBp0MyT4omDUggCd0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11447.jpnprd01.prod.outlook.com (2603:1096:400:3dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 09:13:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 09:13:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Chris Brandt <Chris.Brandt@renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
	Nghia Vo <nghia.vo.zn@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Chris
 Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 0/2] Remove hard coded values for MIPI-DSI
Thread-Topic: [PATCH v2 0/2] Remove hard coded values for MIPI-DSI
Thread-Index: AQHcI/CW6/fTIH8RkkGv5c8bEFxosrST+VcQ
Date: Mon, 15 Sep 2025 09:13:07 +0000
Message-ID:
 <TY3PR01MB11346448023901697982FF12D8615A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
In-Reply-To: <20250912142056.2123725-1-chris.brandt@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11447:EE_
x-ms-office365-filtering-correlation-id: b409dc84-59d3-46d3-2260-08ddf43815f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5O1PsbJjiqtle5Pce8fNVlUWTxS4KjyNt3MOoQcE/4MmXEVj6zv+1vTlTD7l?=
 =?us-ascii?Q?/+XiSZ02XU4iGdKvBt/fhKnB1kn+FNzebMF7qCPtqlzpy73ON9N9ZH+V++37?=
 =?us-ascii?Q?VJzh8MN+eZrSGsi/3vQKiJR24MC1xag/PdeaLprRx6Xw0r1b8tOrLpCigITE?=
 =?us-ascii?Q?Tllq8hLx+j0ZDDpMyYamhG4r0+263+mQtKoLyci03QK6W0as8jPVGbOtvd4x?=
 =?us-ascii?Q?tcZHXc61YCfVrRfmzZvlidqiBfBroTKkrYy+r7fn5yv4PmNENN/IuUDJFBQ2?=
 =?us-ascii?Q?dugoUuNFThNWkLT7r+jqc7s5cHJhpgKBROYvXeMHjxzU6sc8qi1wSZ1wYTuG?=
 =?us-ascii?Q?fikW6a0NDRtCc9vqV3G6TINnEjojHupOl72tVGccq0IDbBxSpyVjaioeunCD?=
 =?us-ascii?Q?HHEjUxKBuzZKGL1CIvOc+8HRMII1k9Omi/mL1b/eefNLJ3qMXSiJSwoZBbpF?=
 =?us-ascii?Q?S5Q6UTmBijdEloaQ7YHM+d2olEWwaNc9xj1fnaWI6JTtn+Stevp1ezMqNdmv?=
 =?us-ascii?Q?MDdCv88nDYOkRIkcROYIqk6Hk9F85/KgEIPlh+wvC7n4lBplTSNVbNNBwJ8E?=
 =?us-ascii?Q?CEdFez7ImRkqLvmemv0rAmqsdyl2IoVubc2w2ktCDm1byZhIlDwKeK9N1LaQ?=
 =?us-ascii?Q?QMdVxMjpD0r91NgoouhI2k89UAjPvDnLnMt9H32yaT6RnVFqbUh03PgdRmVr?=
 =?us-ascii?Q?Ah2G2bm7ND3kTVr3XuxK4PKJ/64sxv2TpAIaXku/ySMYahCcF7M+NreeuiWy?=
 =?us-ascii?Q?6HA+pNUGDklIb5QpDWHwGzyaWoIMhcwB0lu77Gw6qAhmoc0Noxs8zAV0AgcM?=
 =?us-ascii?Q?RsrWZFQVSxfYomlwa5hLCRTTcCy7x67DrEri2A9oIi+jWDXywxzn1bhBBfbh?=
 =?us-ascii?Q?4F/UjwvJcXjRvkprI6VdqMaE9NllejTU78l4Aij7j18klUeH11WSEg2mD8dt?=
 =?us-ascii?Q?75r5zGlPNN7e7n7jr60fWlENFphWbXI7CKvaW5JrhKK4y65koPnYEFyRc9wu?=
 =?us-ascii?Q?r7GbzNkcehUi6FJliVhyVmwgQuzESiJRLpi0rEYd4f/DClfaHzNSD5UKp9m5?=
 =?us-ascii?Q?YhwszRV1HDY01eQvyuoVdDrQXk+f9kVufqZYLxxoHqwVDO/X2XaTxguq/+7Y?=
 =?us-ascii?Q?jPVtWAkks+D2LcSOo/YsHH0KS2FHk10IJ2HX5RtmwcKsdDGTv4YgK492bMRH?=
 =?us-ascii?Q?R0uAFe70GLrxi0XWhKezxr59YFx8b1990rUg640CASg9JOnCDaruw9t8HFqY?=
 =?us-ascii?Q?/YedyZabxAWuX2ZXE28JZUYSkFPpQUe1tJ64ijEtD6YjF4Dva/z8XvxcBmEO?=
 =?us-ascii?Q?m2d0Fiyd2tOK8+MHiM9w/TUqiU7tNM/cLE2AHrxzUhNquYdDKyL28c4a1i1/?=
 =?us-ascii?Q?nvx54GI8GiRzKwkF4cQzHHyJSbHtQVO7vBrXRLZe5jcsMVGKshsEnelhl98R?=
 =?us-ascii?Q?+QUWApwRiL2L/kjiVFmLK0qWPkU6pRx75+n6mYZoQnvdgzMxXMJjdqR7WvTj?=
 =?us-ascii?Q?ibpeNihFU+6okow=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rVjCmQuG7NaYU3pgyVvZPkuGv4CyRO1NETvz4xpzxyNCgi+ktrgZhambsKjv?=
 =?us-ascii?Q?IhABW6MkANYLE52VWjcReewWX46l3iFjOrjC4xzQLXqKXM35J0almL0bcoO+?=
 =?us-ascii?Q?CfL1V/th6WNrBZxZts8Z024LvhMu1r9av2RN2mDT81OI3oF2PNXBE1ogPOuA?=
 =?us-ascii?Q?+ZMnA0twzAf2dhl+DLwWpzi2qXEKJpGIWMd2WfSMVpYl8A7X1Xj8jIAYzy41?=
 =?us-ascii?Q?+kUEQHAGPfTRin4qmX6JQ1XbCy9ESdbNuuyohLhzj3az3jj5gik1/f91njm+?=
 =?us-ascii?Q?xUnk7LFjDFWiGUnj9HWN2bTvKxY6RYk42+m5y5Su0Mhh5aH4B6LaBO6h4aVd?=
 =?us-ascii?Q?8psE6TEBrx4VzTU/Gl3/BzHMW2Xwbpez6xMzv+P3zSTQeFoME1XfaR3/KN7p?=
 =?us-ascii?Q?vNPnKCOgmD8iN8/OsVcN5+8WVP+XH9Zuq5XtHeoFNbsGX9n2UaQiHIp2lgaT?=
 =?us-ascii?Q?BUP8lyWQjInHKpXmd72F+GbW4zqD8YM/fGr6K90N80UnSpi4+NsSSz3OwXpa?=
 =?us-ascii?Q?095XMN5TamjyLv8aK2QXpFtdPc49RqpAizeyF5DIOv17aKPwrf8viViTMUPD?=
 =?us-ascii?Q?fJZisyHoCdnXJFqVbHoWdfiuBUg7QpiJC2S3Gh44fFAuUOkyI+Vnjgrz4nmp?=
 =?us-ascii?Q?zFhyoJZVxGdBHgZu79YnXbKzIzGa9SCizflHMUFHm6dBzgOM3M7CpTjHc4yy?=
 =?us-ascii?Q?EdmIjLFduuwIP6QWDsZZfMrIbvBVz9kpNG/gfrHZB7FJPh8F+3urjEJZswbw?=
 =?us-ascii?Q?DzQlpai36ChA2AuN34861VHKoHAanZeTeq+FB6gkk2pLLvHxAuBvTLNrpU06?=
 =?us-ascii?Q?zF24Ptf+vXq9fUPPjLRkTm1uC9tysxV1eU8nCYTMCToyoV/boRf8/R/HnSTv?=
 =?us-ascii?Q?cmoVbwsR0tuYR2yZHickhLH425Hwq+VZoV8kbUy9i8fCPa8oL51L58+yqCKP?=
 =?us-ascii?Q?7eOVM2ed5gIbmMEssJVU7h9y/P/Zcq1L/YYKtxvBdW+b9Fepj0k8znDNqHFq?=
 =?us-ascii?Q?Sw7nestl69gDxHud0buQ1evN/17iHCrSKSk/EsVOIIIti7c+fPO3krJvLbTc?=
 =?us-ascii?Q?T83VHzNvl2Wk+B3T5tkcLbaf1n1FA7Fc1Bm78TJ8HxxUAwswxCTQ7I6VOTey?=
 =?us-ascii?Q?aZc73G6HTnp/h4BX+qErlLpP6Dc0GWFLjGw10/m7V0sqkbd5+0fAZ2I7Nyzm?=
 =?us-ascii?Q?S7V5jS45dDHSOQw2vNTL0Y2+lUrdEb3IxkIAjEpmbx2AFT++aNYOqg6B/1dF?=
 =?us-ascii?Q?ySGciorGiMs+VbZjlWhLbbByxNR/BwnkF53QVv9PEFmCRgWFrQM5cn0K6Pjq?=
 =?us-ascii?Q?N5aYjBvJ1uCFG56RqY9pejgORs6cYXeETPDJoq12aGfXN0mkn28YV6EH/tM4?=
 =?us-ascii?Q?D6QZJUmc7nEtj23SgobNaIb7c2wgLn+3p3Z0HGkSZV8IXZBvecc/afXCe74n?=
 =?us-ascii?Q?kemHf146u/25uuebXEj4TOOnk3OMna4sJmS/+Hz7I2Kbaw67JQ9sR1CYAu/w?=
 =?us-ascii?Q?dWdKSNK9fEIYAG+Eeg6R2sP2a2kgzBgIZIYk/0ku8cVll3hgONXLmn1xAWKb?=
 =?us-ascii?Q?ia/OykWNS7tWecf1GT/KDoXXtM7Qln7zEOLJClkdeoD08ckJwDZ0gD7BcJqK?=
 =?us-ascii?Q?kw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b409dc84-59d3-46d3-2260-08ddf43815f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2025 09:13:07.9230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nvZ8aIFSZDKQcYo+bU9AjQtrWjuhl39CmQEdfer3w7UIbtYNrE3khDM4TnoAqvcyr7YrC+fjrf8zWh36KvjeuFiUnghNjIaQgXkanwSiADo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11447

Hi Chris Brandt,

Thanks for the patch.

> -----Original Message-----
> From: Chris Brandt <chris.brandt@renesas.com>
> Sent: 12 September 2025 15:21
> Subject: [PATCH v2 0/2] Remove hard coded values for MIPI-DSI
>=20
> When the initial drivers were submitted, some of the timing was hard code=
d and did not allow for any
> MIPI-DSI panel to be attached.
> In general, panels or bridges can only be supported if MIPI-DSI lanes wer=
e 4.
> If the number of lanes were 3,2,1, the math no longer works out.
>=20
> A new API was created for the clock driver because the behaivior of the c=
lock driver depends on DPI vs
> MIPI, the screen resolution, and the number of MIPI lanes.
>=20
>=20
> Testing:
> * RZ/G2L SMARC  (MIPI-DSI to HDMI bridge, lanes =3D 4)
> * RZ/G2L-SBC    (MIPI-DSI to LCD panel, lanes =3D 2)
> * RZ/G2UL SMARC (DPI to HDMI bridge)
>=20
>=20
> Regression Testing:
> There are 2 patches in this series.
> If you just apply the first patch that only modifies the clock driver, th=
e operation of the RZ/G2L
> SMARC and RZ/G2UL SMARC remains the same.
>=20
> However of course, the second patch is needed in the mipi-dsi driver in o=
rder to make sure of the new
> API so that lanes 3,2,1 can be supported.


Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>


Cheers,
Biju

>=20
>=20
>=20
> Chris Brandt (2):
>   clk: renesas: rzg2l: Remove DSI clock rate restrictions
>   drm: renesas: rz-du: Set DSI divider based on target MIPI device
>=20
>  drivers/clk/renesas/rzg2l-cpg.c               | 129 ++++++++++++++++--
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |  18 +++
>  include/linux/clk/renesas.h                   |   4 +
>  3 files changed, 141 insertions(+), 10 deletions(-)
>=20
> --
> 2.50.1


