Return-Path: <linux-renesas-soc+bounces-6103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB62F905140
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 13:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 713F32876D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 11:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B20616F0CB;
	Wed, 12 Jun 2024 11:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IFbcunlT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2063.outbound.protection.outlook.com [40.107.113.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E3716F0C3;
	Wed, 12 Jun 2024 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718191360; cv=fail; b=Xme7UevBJUy5hMkE0bjXhsNao7nufVTtRhiaST0OTKoBOAkPC5MUZk2cG84MNJTlFBLOCmlk9uebHzufxp3SAZb2itL2fQOfruItB+EKGF/TklyBhmLuTo9KkBqcvvb0wmIrFbD337i95BBp5+y1x4BCzoT+ETYcfwDD0rwihUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718191360; c=relaxed/simple;
	bh=gNWWNKM/N1dBesgeJu8bSlZJr7kfW60ZPHEX2dZwDfc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r+lmDj4uUSoyznOzpsUm3r//9VMLkihFr8BmSDxZyjEu94mGqzJSU4x0I7URGRFQYl/rB9D4cZnL7eIe6YvxEzDaelUr/Ccolf4CpzvkuCsiEmDn34blqLzL5qRP+NnZnq3qViggm/nolROvEaxnUtlwMmT31oT21q2t1f01nRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IFbcunlT; arc=fail smtp.client-ip=40.107.113.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2sCHekrWMRWusozWcY7JxaBl6uyiCRn/iAP3Qp0ykPnilxaEay8nTT6LwnTQAdPTMTa4BlZEoAVzngqZQNN6UJmTHKWP0Y87nYa44Tq98y5D8AFEs0UY4sOnVE/m2M0wWMvFy54vn+YKr1Vw0NLjRje7/dLUqMuEbKCzFY+Ep7UBwRiX2h8rmA2aLVlSJ/pbpdgcrkjv85EUfUFCC6C3qk+8B2Qu6CzhivoaG4pXgQWG2WFfXp0LU+Npyx7PfqqJclrsmrgEoW4RAqk9RaNidDxcIyLC2JQK15jX0Hpa9M+0MsHHF9w7wfkh/lrj/ppDi/8q2SiFuqqdIUAkGltsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZc2aEbD23EI3LvOqADqKvVX2NAbo3tLTOdF4ToWcso=;
 b=Ur22agKnUCqZGqiu8sqINijqtBd4IxjBOBOLOTkcW1F9P+PjHUtWhwZSXEqqqKA4Qnq/J6aPo7G9zq2clml3kPsFhrhw+rmylQ5kRhmdWZhv5RPuojfugmp6gLuh0qBXZkIYWC9VaPgB9T4Ha6mBDdQJoEY0Jbaklag2qHyhrx3LRJ2Dp54GxThEKtpuENr98tf0gWteFlD71WsHB62+tOz8rBqFzV+yBa2fSCbKmfK5kDUwYiF3dUHFrinRL516uYiznV5kwC2g1eBtp1TxlniOu186XFz9PPd6WmusILd4ULJlwdDiI9jPKa/V2gVMcuwbYdhKc/dyGvZmiwI/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZc2aEbD23EI3LvOqADqKvVX2NAbo3tLTOdF4ToWcso=;
 b=IFbcunlTjTDkXPz19uk8X+c3M9rzTCj908AKy/jEMot1akUqbhM9YsOEacjK96IfPnH1fXnbqwiGfmdDvgCx2p7dFrH4d9ykc1aUSagUtuOJT7eP3AlxM0exNV7CE7HrwArfmjitNkH07Gmo8SgLShH0SOwhlpkBBF2J2JcW4h0=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OS0PR01MB5778.jpnprd01.prod.outlook.com (2603:1096:604:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Wed, 12 Jun
 2024 11:22:34 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 11:22:34 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: =?iso-8859-1?Q?Niklas_S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>, Cong Dang
	<cong.dang.xn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: r8a779h0: Fix PLL2/PLL4 multipliers in
 comments
Thread-Topic: [PATCH] clk: renesas: r8a779h0: Fix PLL2/PLL4 multipliers in
 comments
Thread-Index: AQHavJmw7Mw9/BDEKUSbMl0jgeeM77HD/E1Q
Date: Wed, 12 Jun 2024 11:22:34 +0000
Message-ID:
 <TYCPR01MB110401C07AF3BE2C91E940C36D8C02@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References:
 <07126b55807c1596422c9547e72f0a032487da1e.1718177076.git.geert+renesas@glider.be>
In-Reply-To:
 <07126b55807c1596422c9547e72f0a032487da1e.1718177076.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OS0PR01MB5778:EE_
x-ms-office365-filtering-correlation-id: fbb7306e-0708-4d4c-7ecf-08dc8ad1f4e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|1800799016|366008|38070700010;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?m0UYvUbtmkJCA/tiQq7Z6X/t32uss2EUJ/F57lO82hWD3I1fhk6GfnJfji?=
 =?iso-8859-1?Q?klREb0x2kpKKupKDKbzie+9i4dBohLQQuo7YL+NtKXAaTAm0LcszY/cHyE?=
 =?iso-8859-1?Q?XcbcIeISGjQsnOKQv6Blj/1WHjWgj5ZnwXvG9CUgDH0B83RDSeMJgkj8A4?=
 =?iso-8859-1?Q?eYzpfgX0djuWtLEP6eXVRreThU2Kv1IFrsfoFLgU4qndmFknr35GkbMGY7?=
 =?iso-8859-1?Q?S8h5tIl0k0tOumNc7fkyHRGGK9XzxecMjtuQNt6avY5NIGFXc9/Rz5T8Bg?=
 =?iso-8859-1?Q?NNJL+26fV/xWlkUVZcd7mZlvqoiFe/Rq3joEiY8kP2eTk+Nl6ta/A71uC8?=
 =?iso-8859-1?Q?llPFvjAA5KUUJndC04CbYk+7Zaozb6maqEMQpN1kv+dWrLTvF6bKfMsnFL?=
 =?iso-8859-1?Q?NXySn/axkntdicCM4GK6gEoJDL6HaGtF1aXIB7+BdciN3CnUMpF/VQtxEX?=
 =?iso-8859-1?Q?klXylKzESfqsxEJvn+2zY4zEM2DEWwTT687/fw6XYQ4qhZcQnCKXAsvkDO?=
 =?iso-8859-1?Q?2Bk6TV7c+Y0gJWBg33CoTVj2c5qgwNS/ka7W+4BUJe/pmuGAGk7+2AE31n?=
 =?iso-8859-1?Q?R0S0U0DlloA88AHi7o73rMeC5IcRWqVC030uxctIuJ+iUfOCT9A4mJrWoi?=
 =?iso-8859-1?Q?nhC+AFG2j1zUpNi4Y7m8lXECezyxk+KPPfMAbfM/Fm5tlydHKoiZame435?=
 =?iso-8859-1?Q?DJE7TY/LbkVonlxQMxPe5ce3VPhhI4BRPQQ58TZipV3wLUDZhb+W3eoiow?=
 =?iso-8859-1?Q?7I06QAwJ1FaHgjq0pmJsJpRBep6xUZqpuljO4dMidwJMb6GiyVMdFSnas4?=
 =?iso-8859-1?Q?wsxvEtFtVKHiMiMAkVdMFCcUJp/DF7mbssnECy7kpmNCi3tvRCxFUpoF5H?=
 =?iso-8859-1?Q?+f4E+ptiIaMyeH6BYzoonlFGMQC1FkoT/jt6/lfupDehnc6HB7+/a1xEGt?=
 =?iso-8859-1?Q?ZLI0/gt72e9oLShDI1MQeIA/CgD/YQtAK0mmdstnB/8yceE0jbsUEGTVFZ?=
 =?iso-8859-1?Q?jF+BzYEg8Qj5do0uy6Y/xp+uywVeIER97mr26NAzlS+PcgXMBMCtqxJAOZ?=
 =?iso-8859-1?Q?c1p/lUq/aTv9z00S/+/Y2EArjLdA5abQlrRn+GiP7o49koIdw4zIcJxm8W?=
 =?iso-8859-1?Q?7kwCEx6gPVDMY3V41MF3YPf5N+2j2SywDjE3IunFODpp5WpObDkmC9quYu?=
 =?iso-8859-1?Q?ypizHHgP/QiU+uulwIX6BwyO5S9PlQmfe5vf9hYCYXBHI1fT7acx8ZWhlg?=
 =?iso-8859-1?Q?x+CF+YCU9ssH1RSuDLs9pJihr5ABY20v9+P9X64TPhODM6sn4rYut/e2tc?=
 =?iso-8859-1?Q?Rex/TBSsZ1c7/Sx9KY4X8Kc9NqFm3bd8QYnH1pcBfBNkdDprL7tTSCeEJZ?=
 =?iso-8859-1?Q?5EIhzG0LcWFuV2a2I+lt9p5cYzTsafxDRkquddYn0KFXRbmJTgTZQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(1800799016)(366008)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?u7Y2bUyc/2iSMW5s7+44WDkarX8QE/1aJ1oV++COWb2C9YjhISHns39aaz?=
 =?iso-8859-1?Q?TGaH1YK6Rqo4KSDvmu2R8F/R2RJeMRDtpnBRs5AXMSOppk9pvbI+0NaFBl?=
 =?iso-8859-1?Q?9gIfpPzGzXjccDNoIv8MPJgH1szF7e3VH/X4Q64abcaidDw/xDjQ821brQ?=
 =?iso-8859-1?Q?6ilbU1FX4/V71JsZaQiEZBGH6eMywLURNKEIGNBvjn0H5OE4aR1fpZalcQ?=
 =?iso-8859-1?Q?By1lIaPlqO+zq9hwYQmXBp18DFv5Mkp5ViYE7immhvsBHwYVz6fCincJsI?=
 =?iso-8859-1?Q?wKWMJDkqtpSijY1haa4+scsZ9Sta3yBH1VvV8iGuu1KRO1CsH2ZPwvGOYi?=
 =?iso-8859-1?Q?EZagDNPBCyGOKEHrJm7WQT72ELewxmQwiO20amp4r1cRRYtEaEtXrIn2WG?=
 =?iso-8859-1?Q?uJ224sLb5gXeDqHqxpV2kZ8sfIYU9mPHOT5m3Ble9oeR/GdJM/iU+gmWjP?=
 =?iso-8859-1?Q?ULKDJb8GJW/1fnWs0Pzzfss6YXKtT78m9oTcQcEtHUrgaAVgZjwl9RJT6q?=
 =?iso-8859-1?Q?ludAfVQ0iQ6hatWoOlaYcoOmXWrcnl1k1SDVskjJJJ6A2Qg6yP3LOzxtS1?=
 =?iso-8859-1?Q?/LQOdKqDk4vSVoUiNKHG4wNtKcEQrbj6+tIGM8yxoV4YU5V/CIYfzDUboL?=
 =?iso-8859-1?Q?WFBPXTA2C+IaLo9uY2+wsxNl08X06WUN8I7+K/OyHSAVaibx+zq3Ghy426?=
 =?iso-8859-1?Q?7lqma2YCC/2A3c4Dc1UeG9Cv+pIPS5ziUyVGQe0tdqw6FKVFeWj994BY/B?=
 =?iso-8859-1?Q?ceOUEl0WgSh+jud7HdmeXt9KrM6loMLFq9iR24JST2AXi+TL/08danCTM7?=
 =?iso-8859-1?Q?NqpRrxJq3JpRvDtjG7pOUIkw1aEhhzmzwDykHbWGBGSj6Bgr6ZWMIdw4dm?=
 =?iso-8859-1?Q?5UzqPe4dUxo6EXKGXGE2YdjmM8JJYreM64EbbDpBr281dYu3ptvslri8Na?=
 =?iso-8859-1?Q?soO6xT6ro1QkgQZPshKdP8QOorP4UfWmY5SEP/NhBh/aPcbnn1zQ31tQm8?=
 =?iso-8859-1?Q?XGIxYkJ8D7Un3VuLPkvvvgIDbftnOnbkR1Wd5zb/Rl5B/YwSo7JyZ0FoNk?=
 =?iso-8859-1?Q?+qNrbO+I5sS94hRycsEErYsugoMgIEX5PqVZPt+4dB6Ir5q3HIxSloGDKE?=
 =?iso-8859-1?Q?v4ezdHl58dZGi0erAcOPBPKIlnTZm0Hk2TL9ee/x5HxR7SBkEYMJdGeoFI?=
 =?iso-8859-1?Q?/EJx2rPlFFMsCNzEz2Ctbm9PflUH6oMNGahUc/4sa6qqPeoe+jGWCX+o7J?=
 =?iso-8859-1?Q?OumqPD4mBoWlgXRaANEoM13QcnGwWH3yWs9zD9ezTV4kq7PBR6T10MqYsj?=
 =?iso-8859-1?Q?7EKlhCoazvLmJEoXEEN7eNCFtjrpAHLcNUoX9WKo1TbUBbIDvBoxBxYkOR?=
 =?iso-8859-1?Q?/E9xPhod3xkHOoHF66ylacVZhW3SH1AE0+JGHiPL4CgWAM2gL+WuAxjUtT?=
 =?iso-8859-1?Q?o4BN/ELBAZnUR0hDXXiKHhWyybxoOTJ8NdphluvoIlOa2wneuHPWOvH27T?=
 =?iso-8859-1?Q?tcYyG/KVe8h8fWll8BFL6VxLW/oiwOdsbD0vSydinruEEsVcx8Zrphrlks?=
 =?iso-8859-1?Q?jyjKQyrPrFgInZYvg6NHZQQWkIJ1spnygu+ZRS2KaB2haKMnw0UV/DsjnI?=
 =?iso-8859-1?Q?PuOhEkXfVuD73HCp+ipFyD9nTKmwUugT2O38KHcERYFZl6QOkiNfMh3PN+?=
 =?iso-8859-1?Q?NovmxNkKLMcK+x8/zOk+Ow1tqed5auq0qffKLG6EmSv+RS3G8OTDmYiZdd?=
 =?iso-8859-1?Q?lkZw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb7306e-0708-4d4c-7ecf-08dc8ad1f4e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:22:34.0468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5AglCyZgBhG1UjOoaqpWSuIEceqHAoNeXr+H6nYe9urx+qsFdPM/uj9wQiPKOc+LdihQhqyjltIm3EpNf+7weBK/p+yjXrpQTaGtCtpJqbi//ggiToLcMe/1hWGVKWlJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5778

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, June 12, 2024 4:25 PM
>=20
> The multipliers for PLL2 and PLL4 as listed in the comments for
> the cpg_pll_configs[] array are incorrect.  Fix them.
>=20
> Note that the actual values in the tables were correct.
>=20
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Fixes: f077cab34df3010d ("clk: renesas: cpg-mssr: Add support for R-Car V=
4M")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
> To be queued in renesas-clk for v6.11.
> ---
>  drivers/clk/renesas/r8a779h0-cpg-mssr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesa=
s/r8a779h0-cpg-mssr.c
> index 0a553d5170d5fdde..1057a2b6a72769dd 100644
> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -243,10 +243,10 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[=
] =3D {
>   *   MD	 EXTAL		PLL1	PLL2	PLL3	PLL4	PLL5	PLL6	OSC
>   * 14 13 (MHz)
>   * ---------------------------------------------------------------------=
---
> - * 0  0	 16.66 / 1	x192	x204	x192	x144	x192	x168	/16
> - * 0  1	 20    / 1	x160	x170	x160	x120	x160	x140	/19
> + * 0  0	 16.66 / 1	x192	x240	x192	x240	x192	x168	/16
> + * 0  1	 20    / 1	x160	x200	x160	x200	x160	x140	/19
>   * 1  0	 Prohibited setting
> - * 1  1	 33.33 / 2	x192	x204	x192	x144	x192	x168	/32
> + * 1  1	 33.33 / 2	x192	x240	x192	x240	x192	x168	/32
>   */
>  #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
>  					 (((md) & BIT(13)) >> 13))
> --
> 2.34.1


