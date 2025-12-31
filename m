Return-Path: <linux-renesas-soc+bounces-26223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD59CEBA25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 10:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB91E300C368
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 09:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01CB315D25;
	Wed, 31 Dec 2025 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="siGQZDE+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B95531578E;
	Wed, 31 Dec 2025 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767172141; cv=fail; b=ClSlRvl4vtWBZyFKqi16rqibwqtO6BRMzGsK+nxIkMdrgvPQkW+IxHYDG+FC9dTRfNdDfr44tcRli26/M1uWsq+VhnpMWDqc/w3Z2Q/mnCnX4S7rdT770UC9qL1FL9e0+tV6TvZF0ci1ZowkPYW93ETJQl68QgPZsmr7trpPfFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767172141; c=relaxed/simple;
	bh=TEiRnibZdLjMx2wi6BgQ8xJ1cZYv3cbbxrXkH+IfXEY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G3VM2W+hMqFTkk0cO4YFIs7Frv1yq91GCJ76OczlJpJ8SibmFDMKsgLFiWhDcVXBbIbFWwJUqXUB+7GGiVVbmgHEEXXjMT/UhoT47yCMjQVq03d9FwSmeT++z4GASLmqwbqrhDUnf9Ri4G8irRG8JP3xz29KUVlf5yMU+EJoHWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=siGQZDE+; arc=fail smtp.client-ip=52.101.229.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYlDz5+LyDiQsYevM0RgipPMav+DcWdJs5csFHICxh82zKjwMi773fZHQmDccHpuy/Hr1RlcLUxPdwP64Rup4gr6k2p/rFidjXsxKpgX9NMJLQetUYeCHHsSMPt9UDuFP3sz9Y2WHg6jX5WUoSu2xBSLwJFJ4X2hgvnqgnIZ01dJb8FIrgM/5ddnbHwI1bQTBgXOrWKGS3a2cJcdG6TVzSe5Dch+9qyFI6tQoBIdB+GkEV4HK2mJhmntFeM4+tk3Ppp9vR4ds3LmAN0QNKNXMFacsTaK+Y5qLLF9LwIG5rhrwV6oEIPMhc37EriZ/IaA0Eeq2K+zTQgyAz+bvijSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaVFCc4uaB24ns3BPkcjbnj6RcBVi22pOzKJjWUvLFk=;
 b=y9VzlYseE4XQC7cJMJVLWvmcS33EwG22e+fBSCgHspE7l/b+20mW0TsO6NkugMLLQEhtDr3YONfVnMwfKjHkXfK/QmUV0MFQSzWpsEiqi0GjOfbuBdl8FgdTmxeCw4/PYgq4jaROmbarzUMHUOzr343fyScTEzEzdgtuSUDxRgyZAc/zREAYDCZiDfxGKFcdurIJJnu+hW2F2wIEkrzFbRde5eKWTe+PsIXXilT8suVUWZiOCAu6ylDwz4gziRi6HBm6YfMq2yOIETPEcL8z+JynjJPCy6SJslgl5oWfZ3a3b6mppSXpbmn+3+LPSUQ7gExMcxqrP+fAgs1BavQMjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaVFCc4uaB24ns3BPkcjbnj6RcBVi22pOzKJjWUvLFk=;
 b=siGQZDE+tSIWPCeNWqromPa9LLSIZy0bcNHYPXZKqKHYb/uMVoxTHsKwGTUvEw2y+2fPKk98xrncEVw7+TAP5qGRBfVFtPKpHOCA/i02cfEXfGZeYth7uUNV/zaSVA3/kIRaa1IL+HA1NLoRTWO01x86q2crJcSAt2K+0iGE47A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10355.jpnprd01.prod.outlook.com (2603:1096:400:253::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 09:08:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 09:08:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Thread-Topic: [PATCH v3 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Thread-Index: AQHcei7B1N01Ink3mEOQFkmXK5jCLrU7dX1A
Date: Wed, 31 Dec 2025 09:08:54 +0000
Message-ID:
 <TY3PR01MB1134639E27E86605C6B6270E686BDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <c6678c398f89eba9ae7b349ec31bbd0a1cf7355c.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To:
 <c6678c398f89eba9ae7b349ec31bbd0a1cf7355c.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10355:EE_
x-ms-office365-filtering-correlation-id: b4bcb8c5-3c88-450a-2798-08de484c3929
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KMaQJaF6ix1vLJBAQWCkz5+zPugIPiKIv/WMF+SfF1NrYjF93g/DgFRAP7t9?=
 =?us-ascii?Q?ee8ElgBaXYci09ZDOROYHeo6YxH/QRexBdT5/zG7M94Il8nCcJkZcI04owke?=
 =?us-ascii?Q?2W0Mqsc2j+c1lTwa8vfYfo7gWXEkpcWuQEVdbquzL/FjNPkazRhEOY1TVdie?=
 =?us-ascii?Q?q8/98QLW/lEdibYIErIPRxLHS7bOQZKpfZpuE9e0EtINFA0Q87u7sDW1ySCr?=
 =?us-ascii?Q?Sc2Z+dej3oWCCx2c78rxP4VQBgyeO850pc5r3sIhO3DCHaVl/jb2OGl+QOki?=
 =?us-ascii?Q?2DuKxuVvuUEveS/QD1ngOnbKLIl0vKLQgHlrbb8MDjnbE8JNLyDhouX+6yfr?=
 =?us-ascii?Q?JU249ij8ScLq6WaEeFoVk3yn80C+65qPLZKw3BMVFHbjzBdZ12GiOacxczCr?=
 =?us-ascii?Q?lapXJolmK3N0jf6qO2oi56KcAnukTA7m+Gsq/6tkqTVBHZX6aULA/Bip+tjj?=
 =?us-ascii?Q?3UT8Fhszh5QBrDsLIxmSTa7EvmA7GtpJVDERTVIG/xM7GJ5TBqTsw2HkVSnp?=
 =?us-ascii?Q?HYESL6lnrtpCfrun0y81AAUiMcZVv0GV8H0hqcsg8rpq/xVcun5tmt7BhYvm?=
 =?us-ascii?Q?1/3pwK/ct7vfnZ+ARSvOJJvjMzVTgBAYqIfLuwOAC9A16kI2UWX1VfWk5lQV?=
 =?us-ascii?Q?ZG/7ABVMWwGzN0f3p8gbbQs7cE9BrjdU1/CN9MjywPz7oTuO65p9/uGMo2wS?=
 =?us-ascii?Q?pylPixMIvB09f7SYYzX6vLB0NMGXC0iiYQ8oYl8bxV4x/P8ip5qC0EUshW5e?=
 =?us-ascii?Q?ZlQPnRZy0w869pFNpQropSm+RCcJ/k3LmVLQpVlraLxlXNk63FaWSCy6kJyy?=
 =?us-ascii?Q?fRiwAQqtV8yGJBALbn/2kJMaWB2lyUun0PAtOmQQDYHYFjzsuTpikn2w7UXX?=
 =?us-ascii?Q?wXKeBY5Q+FIRoPI+gIp3/MkTgqzbFhJ+OFOAPOz29RkuRogel2YZlfvPj0Eu?=
 =?us-ascii?Q?7YXUuxOamklCcCJWn5QguGXRkUx5S8OYktMfASPcS8iIvJcEqVjSOu17fxIb?=
 =?us-ascii?Q?WZKAP/6UGYbsi0/0PBUAbmhAvj/sdR2rv56z+VTx1jFOv8AbUTF9BpDluLzE?=
 =?us-ascii?Q?vvu5b9anBwiQgn/wcPHtlP+rBeomNLzGjocnWhv5Ha/zw7J0AoWGmvID1YIv?=
 =?us-ascii?Q?X/uhGukJ2JCHo9MriB3gVp+bDpKgS8uPue+lDq8q8YtlRny3CHqD7XtL8r+i?=
 =?us-ascii?Q?wh/Q/fgpXb9mmsiY2FDM0fgbRMcpLtDcYHtUiS2yRn7rHWBuZgHq2sPb54Wt?=
 =?us-ascii?Q?3mZdyAkpvoWcRTTZEMExdPrx4VtwjbGz7CdTKPDyRexJzVuDotit88LTZGDv?=
 =?us-ascii?Q?OvCF3YYWuC7cUWIntIQny6JV7KtEAvlekDVWpo/KJ2/uV5N8xkQMFjUfThj/?=
 =?us-ascii?Q?IU9M7b3UOwD/HyE8U8ZdZZTHu6YwAiulyK+mhN3y/PE3rZIn0lmJRg0fii6c?=
 =?us-ascii?Q?hDcwPDOaHsnLXCJLMKbCrYPjpxl/c1i3cfsR0GYXQ9uvMzq6rkCNeg4bilsn?=
 =?us-ascii?Q?0WitRy3MWnmTr1ot7P90CztRka7zMeLgJbXy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kD3hcBPItjtV1pVpM1miMZAlMx26GMxCzhfeoxaqwR81EDDAfJd8RQWTR+tV?=
 =?us-ascii?Q?RJ9tRK2Up6B4TUdIIE6lH5D+f8CGgvpPnsyVFDT9JwsIq1eNQVEVX3wfbmTw?=
 =?us-ascii?Q?7nBLZHxOZu+NkHh2NCVejXhUXGtWsmav5AqLsCo3H+6EUhfO8gOH/Mi+j7np?=
 =?us-ascii?Q?DlarFjxB8oaJWMEBwMGpMgV03m/mu4oDiTxkIPRivTSMbTiOl6xX3Jf0iWOG?=
 =?us-ascii?Q?hP38VSxG1PtROw3ZQ7GqaFtUvph1qjB+nc0ui5YuDWJ/XqC50qDL7lzorMzJ?=
 =?us-ascii?Q?swQEhmzPtr/ZqzJv3Xof3fEVZOOGKacaY+ieof/Asp0Bd/qPujZ1YGCSbVUl?=
 =?us-ascii?Q?lWoiCk6Fl60GBp5AxQQ1rh+zsRk62TNMmkVHB6zlXGDBtqWTinevJ0bmnBGO?=
 =?us-ascii?Q?Fwek7l1ytg4VZBYG1W4ASi51PaP5TnTcCO2gbqzy7gO5hy6+Zo3NvJCn8d8v?=
 =?us-ascii?Q?GxO8rpdlS+A9/UML6s3Z1nQzx9EZ6fXBIJrWhcI0HJ99XACA+CXOIQjboGHB?=
 =?us-ascii?Q?TERu6GuUcC5YTH3Rt+OduZjhTN3AeFrWw7vIVwlUZdKUDn5gikwvqWMT0jOt?=
 =?us-ascii?Q?A4R89TPCiypOwQTIBYTtVyitw/jk+CogeMApqqhLAx9Nbushc0Y+YeukNF2v?=
 =?us-ascii?Q?sywbuGVn1/3rWzM5FjKxnADluUb0GAlksSPP9MLeEcOZ8iX9+fEKx6zlfSm4?=
 =?us-ascii?Q?uoJHwtz5xHOGOkL9xS9nJ59eTtVvlwItCFnoc+QiypLlnhnGe5h0nxzJ+5hE?=
 =?us-ascii?Q?5fR8VlAMpZQyUUtjwy2BoxkdLEWs1kxguQnAd9Gp3X1LJRCr47SaRPh6KIoB?=
 =?us-ascii?Q?isfAqk2EXEirGFUj5L9f1wc0u3EURqCW+e79L8pogWLZ8r0BWkBIAbh6/cT9?=
 =?us-ascii?Q?3vtWulfpZBLU+LLT023+dXearzC/VNuGkxw6TSYFIhqQZ9Gh9iyMcm7slywR?=
 =?us-ascii?Q?YQ2BklbkEr6ULU0wV3aNSEjZeT7klpA4jfrth8k3a3ENPaZTLGS+FBxB/0w/?=
 =?us-ascii?Q?mPkm9ihniRRp3cvWkxBzom1MJZyjMHtLBCMS73O3V2omKq4+V5Gt2NnS8Yoj?=
 =?us-ascii?Q?qRzj+49lJEufdjO/l00Z/JRzJMSGyR+x2yvlwh3juNk6Yi6QSjCIQqdhIml5?=
 =?us-ascii?Q?VozGOkJ9liUUaDOTyrg0SSA4OSYL1kV3s4ipbbqk6upovYsc16tpegyY5/PC?=
 =?us-ascii?Q?yfxqkEJ/VSZ9Anie2gHs4jZjkUAU/Eom+Y/2RrNgPbPhQ5ktVU82pZdJ3s6/?=
 =?us-ascii?Q?FT0qOH/pa6H2YlsdliiqQxZ5sR3D6DIlUME9YGS9S+2i4/GFNG0vExVqhWBG?=
 =?us-ascii?Q?bnCj6XzFdporcYa+tTUVFyLDjGgRL/cN1rIft+5Q6g5zoV8iEs3hdPQWbuPo?=
 =?us-ascii?Q?2t9gr6cjnv/K0lltNgpuwnEgi4ZteOlYjuGQfiIbfk6+fOJcOvCv8rTjRWK5?=
 =?us-ascii?Q?ZSKp4j89VXlU3/jwi52TrI7SN6yBJYELYY24xk2dpYRlUybpLfAu4PKVH91s?=
 =?us-ascii?Q?SnhA98S53FFZ3YrzDO96GKObJ5LeWtPPfuKc/LNGP8nsmx+KpFptF7UHmbfv?=
 =?us-ascii?Q?GeISkNk2OBIcfmNI7GsSyEPKeiDoLl81UXnTBv9PaGzRgeM33y+5EIvMFAaw?=
 =?us-ascii?Q?wWRcaZGGAp0dPgrvjyI1GGRjCgRhsbc1HEkcvRExT16lUE4J2UAiUDqQ/Oxr?=
 =?us-ascii?Q?xmUtF0O5fbDOJrUQbaGw9E39cVbDCYcCRTijbiXR6QjSh4o5DT3VvuUwFMK6?=
 =?us-ascii?Q?69c54XRVcw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bcb8c5-3c88-450a-2798-08de484c3929
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2025 09:08:54.6881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k3Hqhp+5Cn3ZbRnUrvPS5aTarCxwbWQsKedF87VFW3hcN+gtB05GCoeXrpF+F+chN8sY4xza2bVlWP2y/isD3HW/b29dqO0Muxdgj3fc7S4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10355



> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 31 December 2025 08:23
> To: Tommaso Merciai <tomm.merciai@gmail.com>
> Cc: linux-renesas-soc@vger.kernel.org; Biju Das <biju.das.jz@bp.renesas.c=
om>; Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com>; wsa+renesas <wsa+renesas@sang-engine=
ering.com>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; Frank Li <Frank.Li@nxp.com>; Philipp Zab=
el <p.zabel@pengutronix.de>;
> Geert Uytterhoeven <geert+renesas@glider.be>; magnus.damm <magnus.damm@gm=
ail.com>; linux-
> i3c@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v3 1/4] i3c: renesas: Switch to clk_bulk API and store cl=
ocks in private data
>=20
> Replace individual devm_clk_get_enabled() calls with the clk_bulk API and=
 store the clock handles in
> the driver's private data structure.
>=20
> All clocks required by the controller are now acquired and enabled using
> devm_clk_bulk_get_all_enabled(), removing the need for per-SoC clock hand=
ling and the
> renesas_i3c_config data.
> The TCLK is accessed via a fixed index in the bulk clock array.
>=20
> Simplify the code and prepare the driver for upcoming suspend/resume supp=
ort.
>=20
> No functional change intended.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v2->v3:
>  - Added define for TCLK index.
>  - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
>  - Improved commit body.
>  - Dropped unnecessary static const char * const renesas_i3c_clks[].
>  - Removed the need for per-SoC clock handling and the renesas_i3c_config=
 data.
>=20
> v1->v2:
>  - New patch.
>=20
>  drivers/i3c/master/renesas-i3c.c | 43 ++++++++------------------------
>  1 file changed, 11 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesa=
s-i3c.c
> index 426a418f29b6..1b8f4be9ad67 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -198,6 +198,8 @@
>  #define RENESAS_I3C_MAX_DEVS	8
>  #define I2C_INIT_MSG		-1
>=20
> +#define RENESAS_I3C_TCLK_IDX	1
> +
>  enum i3c_internal_state {
>  	I3C_INTERNAL_STATE_DISABLED,
>  	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
> @@ -259,7 +261,8 @@ struct renesas_i3c {
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	struct renesas_i3c_xferqueue xferqueue;
>  	void __iomem *regs;
> -	struct clk *tclk;
> +	struct clk_bulk_data *clks;
> +	u8 num_clks;
>  };
>=20
>  struct renesas_i3c_i2c_dev_data {
> @@ -272,10 +275,6 @@ struct renesas_i3c_irq_desc {
>  	const char *desc;
>  };
>=20
> -struct renesas_i3c_config {
> -	unsigned int has_pclkrw:1;
> -};
> -
>  static inline void renesas_i3c_reg_update(void __iomem *reg, u32 mask, u=
32 val)  {
>  	u32 data =3D readl(reg);
> @@ -489,7 +488,7 @@ static int renesas_i3c_bus_init(struct i3c_master_con=
troller *m)
>  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
>  	int ret;
>=20
> -	rate =3D clk_get_rate(i3c->tclk);
> +	rate =3D clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
>  	if (!rate)
>  		return -EINVAL;
>=20
> @@ -1302,13 +1301,8 @@ static int renesas_i3c_probe(struct platform_devic=
e *pdev)  {
>  	struct renesas_i3c *i3c;
>  	struct reset_control *reset;
> -	struct clk *clk;
> -	const struct renesas_i3c_config *config =3D of_device_get_match_data(&p=
dev->dev);
>  	int ret, i;
>=20
> -	if (!config)
> -		return -ENODATA;
> -
>  	i3c =3D devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
>  	if (!i3c)
>  		return -ENOMEM;
> @@ -1317,19 +1311,11 @@ static int renesas_i3c_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(i3c->regs))
>  		return PTR_ERR(i3c->regs);
>=20
> -	clk =3D devm_clk_get_enabled(&pdev->dev, "pclk");
> -	if (IS_ERR(clk))
> -		return PTR_ERR(clk);
> -
> -	if (config->has_pclkrw) {
> -		clk =3D devm_clk_get_enabled(&pdev->dev, "pclkrw");

This still an optional clock for RZ/G3S.

> -		if (IS_ERR(clk))
> -			return PTR_ERR(clk);
> -	}
> +	ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);


This will break RZ/G3S as it does not have "pclkrw"

Cheers,
Biju

> +	if (ret < 0)
> +		return ret;
>=20
> -	i3c->tclk =3D devm_clk_get_enabled(&pdev->dev, "tclk");
> -	if (IS_ERR(i3c->tclk))
> -		return PTR_ERR(i3c->tclk);
> +	i3c->num_clks =3D ret;
>=20
>  	reset =3D devm_reset_control_get_optional_exclusive_deasserted(&pdev->d=
ev, "tresetn");
>  	if (IS_ERR(reset))
> @@ -1374,16 +1360,9 @@ static void renesas_i3c_remove(struct platform_dev=
ice *pdev)
>  	i3c_master_unregister(&i3c->base);
>  }
>=20
> -static const struct renesas_i3c_config empty_i3c_config =3D { -};
> -
> -static const struct renesas_i3c_config r9a09g047_i3c_config =3D {
> -	.has_pclkrw =3D 1,
> -};
> -
>  static const struct of_device_id renesas_i3c_of_ids[] =3D {
> -	{ .compatible =3D "renesas,r9a08g045-i3c", .data =3D &empty_i3c_config =
},
> -	{ .compatible =3D "renesas,r9a09g047-i3c", .data =3D &r9a09g047_i3c_con=
fig },
> +	{ .compatible =3D "renesas,r9a08g045-i3c" },
> +	{ .compatible =3D "renesas,r9a09g047-i3c" },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
> --
> 2.43.0


