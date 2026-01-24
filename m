Return-Path: <linux-renesas-soc+bounces-27373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOH0B1O/dGlk9QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 13:47:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB517DA46
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 13:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BEA423002B69
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 12:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0909A3176E7;
	Sat, 24 Jan 2026 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bNWK/g1J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697D22E0413;
	Sat, 24 Jan 2026 12:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769258829; cv=fail; b=OqagMhTE1lIvJ0zwdQrsUp/TJysfLNaDhRy3hwEp94ESx9qU6mM6JzjR2bQMufPZVgxLKc8GYo45vZQ2NVt2Ek/alMegQb5h3kDi03jhGd874TR8LQR9AOqipeNgZaRV+85Is+4+Zh0JdD7ChJ4UQjanr0GMe59c00IC8GKXt5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769258829; c=relaxed/simple;
	bh=K6EVjkt7d/Ob1C/vpgmyi+UI58ItNLAk8x8YxwzNHiA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M3UjhP2hBTIetEtkaIEM3bnZJqp+jHaLtwBmcDpPYf8jUiqki1Y6O1pvI2qBja0/SxfV5sixJAWzCEspddT7aMTNamKZDOBBT8cuSeJbkRjhFk95RbGn6yYDVawTg/d92pRx9c5Dxrtv3re8WgwoAsdMRYj1xgn19/oyRQW046g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bNWK/g1J; arc=fail smtp.client-ip=52.101.125.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guZwGJSdoDpD8A0+nGFECR/hhQ3ZxrWTcIt2xl2g4SmypTrp62kKTHwQdhJhzLAH43X5/yFoFb70G3PVDOkfDjGXdlanf4qDF7WiQV2VmQvYs6aRk/utXFky9Y74c76S6Ch3m3Ix+le5qd8UTrvaUdFp9nkin/wLA/QEp8o1nh7qKW/yoIPYQXBgEDAtq1XD6mAzZs8krTMAyvx4vsILZ1tORy3dyMY0zwSOTSmM0asL0QAe5p2gpCawCNqzZEdFGKZUZ4JtEXdH2vqRUj1OQLl+eJOgpe1asCg8wh6uF6MEhgnQkTXJCaYFY0uPQioIQuCDgZID6xh2WyD8p5Qw3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndlSoPfhGkAjaqSSY5JJGdIFSwfDYBLLDmYk9d86lVc=;
 b=aIO8fqdLJGL6GFmfDv3Opk0niV6RhDDqx19DmwFOp8pYGDLX8chDvL08LntD8Ry2fkHPMbGaDtBLzLURO67ILGbt1aGKoyTbxxkSb9c0zewDMYLlOexI66pHuXN6moQDytmt8BVCPftC5Ne7WfGIb/8Vi4Br7j+Kj3p4Bssv1rqUBVk8LAZgeCxZegOqHeiSkHfdY4u91VFz+DY29iRr75eZy+d7NAZZSv2KNkck7Msu2FP3Iutv7rIRdL+j0vrGh08OAF50dB9/vYsgM6REQJn14CkmNhXiMqTAfcqbVz5+oyRA5svgqciHij/0KM8NicwofvC3T3xbkCYx3Bd9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndlSoPfhGkAjaqSSY5JJGdIFSwfDYBLLDmYk9d86lVc=;
 b=bNWK/g1JiHqmsf+FjR1yG0v3AsWSE/UNv1pYDzhMUs4eVhUGZBBY7U4fU8A8VjpqY5dARujM5FNmfdbmZHjX1BxO6NJbW8Bq2P7wqblRDMc8W5nGta5ePsWtKBK4Bqi8TVCiE9ivt5JFpA+OkbjZrGhHT6Y/8rTDn97F+4xDAws=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11855.jpnprd01.prod.outlook.com (2603:1096:604:244::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 12:47:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 12:46:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 0/4] arm64: dts: renesas: Fix SD0 failures on RZ/{T2H,
 N2H} and RZ/V2H
Thread-Topic: [PATCH 0/4] arm64: dts: renesas: Fix SD0 failures on RZ/{T2H,
 N2H} and RZ/V2H
Thread-Index: AQHcjLwS/deFAUB7I0CQG3+DQwoLmrVhRRKg
Date: Sat, 24 Jan 2026 12:46:58 +0000
Message-ID:
 <TY3PR01MB11346F03BEBD966394DEF1D2A8695A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To:
 <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11855:EE_
x-ms-office365-filtering-correlation-id: 15b211d2-0773-4d19-eb90-08de5b46a9d3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5Lk5XNH51kw2pDXAuoF6AD/xTvmBqP4t20yMQA7VURFg0+/h+bW+1npiTbXY?=
 =?us-ascii?Q?ZIaOjeqBxGQqGOzNrwGFO7cQQ1fLDIW8fh2zi/XG5hup8T/q7vByhcJYnaA0?=
 =?us-ascii?Q?rhEp+z6hZBTiNREPWYxByunk5peVQucc3D6fE3KQ8tUBVo0+23ao4Z9nxZEs?=
 =?us-ascii?Q?8dwb6S48EBjV4MOK8wWHVp8HeRyXJxRDOPT947hlfpI7QvvcyVK6+Rv8ngVV?=
 =?us-ascii?Q?fhjNjIrHoievzsnDweZOn78VOF3ftVLWdgVUpyUhC91Nl01RBLnNde2j7WsT?=
 =?us-ascii?Q?UGr6qURwaJ/RjGFCvgj7d0jzEtyEIEmqHcZvRxt0RDgr0x4+eocPLvowxCwG?=
 =?us-ascii?Q?dSpt9sKCH3IaAR167DKizcoLyzM9jJeze8HXqP9eE89DMwMFhmPxvWBuJRD+?=
 =?us-ascii?Q?oymAeygmrx7AwECPaXKalGWhdi7saLNGD8LyATy2nvgWyT0+iS6GDogisN+b?=
 =?us-ascii?Q?Pu+ISk/Z/e6d3B53gncJkGgbznDC2Pi5ImHHXKwZ7jcc1oiJahrYNwhi2rO6?=
 =?us-ascii?Q?QZ8qGQpOzzbpOLpFdY4u8EtPGFdmwLu+7WieJEq3HdQeU7RIXebIs46LCUI8?=
 =?us-ascii?Q?tjvrhR58fUQhDOb8uRIeBuoJZeGIv9mvjUEcuk1j4Vhyg1tQ1HjzEwVKjFEm?=
 =?us-ascii?Q?+DRtuMn2OAmT8zXdFyB6hW8KdqLjvK07stZvQKWSwBXCQ3Uxl/toEu9XaBIV?=
 =?us-ascii?Q?dSlQEKRsk0PEH2e0+XUcMtg+YpoOK8+b7giBxsdi2mfjRnOEPtynSeeIfeja?=
 =?us-ascii?Q?oBIuU1pFEAWZfwmhInEYIpLxOb5+0nANSfmYmHjuOiT4V3tfGkpD/7cgcCQn?=
 =?us-ascii?Q?Nc+hMZm+6SmF8nCiyJX6X/vXaFpHGuLUfGxlaBDTjOn1ama2IFFvzkw2VZxE?=
 =?us-ascii?Q?ntdIJJ8QFBu615m1W//PbqEAikjnpnmeUJhWcOYX9Pb0pxdub4iuYAhkDVza?=
 =?us-ascii?Q?XfsrXrVIP0BuW1gLvcFmXBZWhpHhy9alX/9O4LXpKxK5Q24zHh6akdz4oVCF?=
 =?us-ascii?Q?E+E4NAawHWVcJrJ2agELm7icZvd+WmM148nDqxLvVhErBMkOxdlt4UPfSyBW?=
 =?us-ascii?Q?4sdmhtak2aVf5cMqG5yNX6Je4SeTjNpyObg14ydaLg08Avoj2ePcyxq2m4cN?=
 =?us-ascii?Q?CO24cqefFQRF4tSjfM9+Mb4/75zo/PFiHmhkb0A+dL26xSf7hl1mW/WD++EZ?=
 =?us-ascii?Q?hr0h8N4h8B+2BTmQG/PirP5w5uIYlZdYDUNs5PHTQKHaRgVnRkrjHTrrd50L?=
 =?us-ascii?Q?xT5T5cLzEsfFTjnx+E3FX/B91GOySSmW0VEQ8H9Lbj0HWS67eJX26fqUgtgh?=
 =?us-ascii?Q?OAonCHXVaoR89pF4bVwZ3K5MoC1tNMtaJwd01I84UDTrRWFDjeN216YqB7ZW?=
 =?us-ascii?Q?vt6NSGnSaqArBAdodg8OGJWGj6itEYxoiDEgQe/OEOjXXgV9ix6EqsMdagAi?=
 =?us-ascii?Q?OGiuoroYxKAisPDdR9Yl+qCpfHQ5kTaBqY9Cfxqx2PErSSnjE+DK1d4VjlDS?=
 =?us-ascii?Q?mly3WEHNjjji8wEvk0R3bpE2kZyltSYeKDSUlAWn3Myer/Ub4fQD6xEqe3aR?=
 =?us-ascii?Q?pphfnWcmgpTuKXGvWMig6tq8omIe5W5Ws/mc8nglmvBQup5Axqo5HKqqScvR?=
 =?us-ascii?Q?A+q9dwr/1waYx9kmyWpSZn0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RlpHhs3ZU2wPXtMiOukQE1pI2GLvxR3fgNJZAgZ5TeldQou+6LgyEpH4yc1Q?=
 =?us-ascii?Q?qx6wScIIKOTggcvnBD/LQKhEsAShwrslrbyZF5OVmO32cCjIhCP86JuCw/28?=
 =?us-ascii?Q?wr/IgZEYTG/PeJqW+52VmiQNHsIzjZ1V14VDrSmL154PHjXo0vIbXlaWetas?=
 =?us-ascii?Q?NrPLN+06me/YuWXjsUKUj6gTvlSJol3LJZul7oL4ZciQ/x17vddZ0HeM+rtX?=
 =?us-ascii?Q?PSlNzRmE68fPHNGzPfH9MC5ikRiOHZsFpX8EF46D4R8AABknGNvpvv9RBC32?=
 =?us-ascii?Q?5SjPy+Qxk9ARYb5JTxOJfAwQV+rog7KkKskV0SH6gUvDGGs8q9zG4rWNFFei?=
 =?us-ascii?Q?G/zkHYDhrreS44bXCYluf2G3VpUw4TNduwKyHqrxz8k7AH7+8C7m+qOvzyUV?=
 =?us-ascii?Q?OzmFr2m0KUBt6spNY8ulRdP4AInVtnhHDXdxFaCBswilDTROev4ITlT8VosS?=
 =?us-ascii?Q?oFNH5N64uU53tDp2bd0k04ZbFfIVdORFyBvNGDW/BS/HEJ74o2nBSwspVLwn?=
 =?us-ascii?Q?7dmNI6A5++76YMzZcsNWxL0p3OiX3ECWlwmjecN9u7UTuAT1BAbAAvS7HuAy?=
 =?us-ascii?Q?Ondj0lAbcVPFdABUHrEKh3zeJIKOK4aDEkzPWJb7kvD14mwNk5RDxC3AsnIh?=
 =?us-ascii?Q?zxdYcFk9UlDKcmY/sqd48nm7DKcTV5nY7NLxchTCPdXAI+Wpr5l4nU4NLf9L?=
 =?us-ascii?Q?lsYmmez53Bd9w0lvS8tUeuuDVbt7Ag7VSS6O9aDC2BRn+CfcDsZ/4qgoF8Nv?=
 =?us-ascii?Q?H7zvee6Ra42ps7hLjqCNB3RuCGz1XJI+EMmqRSlogSuVJnWv2s+qlJDGzyol?=
 =?us-ascii?Q?2ahuQ+ZLz1ezHCjz7gQnCavqXpYhDkaL+PtT42Lc1qG/H0X5Wy8mycXFSikV?=
 =?us-ascii?Q?LZEUl0xrUEdLcwKAgqjal2VeFnRXfbixplZKHsg7LqcLfhLFYWW2V48FcowI?=
 =?us-ascii?Q?eEew1dcFV3bzH0Vgikgt8RtAcxuo+H7wC3qLJLsKJIprIIMAtiwbPM57PYeh?=
 =?us-ascii?Q?JkQ93/6aVdjx5ro8bJH+WN5hioJQ3QKcmlP0ozOOcmsQkpogDgHakUk761Vo?=
 =?us-ascii?Q?4iJEpGkbIIYOGQoXwJNziLzwLUoolP0ArDddBe7XxzpQZWjRgo5YC0x/gsYr?=
 =?us-ascii?Q?42cGBM1E1O8SeZJ+ZbY1wqmSY3B+s0OCUjhlGN24xiul0bblkR9/wGARvTeL?=
 =?us-ascii?Q?St8AQaWIqMQOj7zGhUYa91IYhpt864wSU8oIAdQPBTQgW4XOXqRtZl2kW+ME?=
 =?us-ascii?Q?q9wquS2e1YOttn5S+4nZwGN17r/kgjPKg1DROlx3WXLU57OL1inNBAFhRApz?=
 =?us-ascii?Q?6Q1r5NoNOjVF43dLwZmcy8O+nWtVIF1/afH+CAOfW2xtqCB2pO+iFrG4+nB1?=
 =?us-ascii?Q?4hRBBUmGOIqCmEm3DTxc1Y89+8IZ85iPE4MJa+aUmgQ/xWROj1CKMP73fT2S?=
 =?us-ascii?Q?NVMO6CtqJ/rz8VMdkejpWeKnlNIYryaPtWmoHto9pd7fFlEvY58tl44RnCLn?=
 =?us-ascii?Q?cfRG/SLjvlEB12pRxme9BQVyrRO3e0Ifzw3oHnbHnHl7571y8DXZ7cKunPMv?=
 =?us-ascii?Q?KquRoFVP3oC6xzqTr2PzIU2qzBm/KrZY2kJYcv4PLtXCV+gdcwMm8TfCwnem?=
 =?us-ascii?Q?p8+MAnzS7P4S7/D3Jm6J3+ENUzPPJyMXa7gsmFOG1T+mZCTVr/lr/IPXaFNU?=
 =?us-ascii?Q?NG2AgTGGnM8mvl29c6WSoA/nnYVgikU+PSME2YEgsiUigr3EM/ye1zsXhrbx?=
 =?us-ascii?Q?0OzdFLchDg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b211d2-0773-4d19-eb90-08de5b46a9d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2026 12:46:58.7924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6cC0m2NmGa4KsNZIa5G2sVI31sCgXSl4TOpfSorKuRHz7E/bFthDoNcCndBgdWTYr8pj5Hxn5mpntPowSeGPIiJkQdg6OjzcyjVCJCjgHso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11855
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27373-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:dkim,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 3FB517DA46
X-Rspamd-Action: no action

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 23 January 2026 23:00
> Subject: [PATCH 0/4] arm64: dts: renesas: Fix SD0 failures on RZ/{T2H, N2=
H} and RZ/V2H
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Hi all,
>=20
> During testing of SD card functionality on RZ/{T2H, N2H} and RZ/V2H evk b=
oards, it was observed that
> the SD card initialization was failing for UHS-I cards. While investigati=
ng the issue on RZ/G3L smarc
> board it was found that 12ms ramp delay is required for SD0 power regulat=
or to ensure proper


It is 1.2 msec voltage ramp for switching from 3.3v to 1.8v on RZ/G3L SMARC

Cheers,
Biju

> initialization of UHS-I cards. Similarly, while investigating the
> SD0 initialization issue on RZ/{T2H, N2H} and RZ/V2H evk boards, it was f=
ound that a ramp delay of
> 21ms is required for SD0 power regulator to ensure proper initialization =
of UHS-I cards.
>=20
> This patch series adds the required ramp delay for SD0 power regulator on=
 RZ/{T2H, N2H} and RZ/V2H evk
> boards. Additionally, it clarifies the SD0 power jumper settings in the r=
espective dts files for
> RZ/{T2H, N2H} evk boards.
>=20
> Cheers,
> Prabhakar
>=20
> Lad Prabhakar (4):
>   arm64: dts: renesas: rzt2h-n2h-evk: Add ramp delay for SD0 card
>     regulator
>   arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Clarify SD0 power jumpers
>   arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Clarify SD0 power jumper
>     setup
>   arm64: dts: renesas: rzv2-evk-cn15-sd: Add ramp delay for SD0
>     regulator
>=20
>  arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts | 9 ++++++---
> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts | 6 ++++--  arch/a=
rm64/boot/dts/renesas/rzt2h-
> n2h-evk-common.dtsi  | 1 +
>  arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso      | 1 +
>  4 files changed, 12 insertions(+), 5 deletions(-)
>=20
> --
> 2.52.0


