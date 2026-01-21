Return-Path: <linux-renesas-soc+bounces-27216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHcVGIsIcWmPcQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 18:10:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC65A54C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 18:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0D1C978A108
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 16:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C655480341;
	Wed, 21 Jan 2026 16:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Z3HVGlcD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962026056A;
	Wed, 21 Jan 2026 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012635; cv=fail; b=bzfuF67ODfc0MVe0aadPNp4Uq+LYpvCkQR4vAlSJ2H2LLqa4QxBDYPiqKMDTrAPvFYINM23Xo983w07Dr0gnt4rcy2cI5nlh1RJBGqjsrgQF7+QalD9BmcFBM0axh8MilVKzYT7rWdUCqQfHGy1XId8LvKxQRQ84Sot/yEdkcco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012635; c=relaxed/simple;
	bh=lcZgsVJ9x+T7WZUvBIjWxSr8HXDY7V7tW6jrvY1nVC8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j9SnNU4TBZSMN7/onjWq2GTA7nAXNdDWSoT72eHdpy21gOUp6gmc0j2/cmLEsHjXwBPoxtMVnSK1YirilS3a6GJpafzGSiyjMYUvcBz3qBYizExxF6rRJHKbU3gXmbbpwA7Q/tT1d+L05al+PYetSICVen7l7M1CShtR7Ot9DRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Z3HVGlcD; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhQ58qtXi523svxd8YdeLvF02LG+M16gun2XXiScK57ELhdSOoFdTb97GVMT+9mNFVZ5rfmRnh+C5rVNEDGI1Fi0+NVrLOTIf8opQR/yl6+1kxg14VdVhpmx7/KB5T8oVO/tThLQxlyRD2kK0V5xH65pqrxl+fEMIZSORN4oiSbCxzjiLtFTNvcE3wY3DBF97DyJ53+CvM/56n6z2QSuBp5t05ZQHgpe1GDigjN4zKJiUF6af0i1dTSTgY25DBifIPL/yjDefUrABjIAbfoWtOJ+hVp6qmkoXLNxqtXNfF8z8JUrSIxKyFvOLPoUl61fcDbhzvJwHr74QvMJEB5EFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdO81bFSL2D+3PUM960+RahjhQpHI8y9e99le4wNvlo=;
 b=rOt0m5HoX/t0nZlu5z4L8VMWdnRINntQ1W41kKjW1TCgHFODRDDjgT7+iulPydHJR1OXH3n9WkhAtuJB5JTbRyNLn7oVhPRPkMzoDcBBqMcnNy20Xm4LzJALp49iKnSVpdJNKuwIvhF4E8AKU1gYCGZBPRJ9tPDe9hn91gvYV6jXpdkNqqjlNiIrEJ347Hi2gkPbU6GazBvvn/SFiFgXMxYanTbfBTvTDcDclqow/bNQ+kX69Bx109NGsRUDF5LSWEfi1CrRVDCqKKU59rfwyZK0bbW0uirSvsm5V8QoGkvI7AnAvq3UKgKoSD3XwX9Xqx63OhcjlZ9OHh7XBMN0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdO81bFSL2D+3PUM960+RahjhQpHI8y9e99le4wNvlo=;
 b=Z3HVGlcDgfyPRcEfO0sH0WNsrYZW/cGfS0g6kAcegukc77oQnLsPnAmRl/PGEsztPZKoTlKLJhHLy5EHWqSOVmjNC1wpBPyaK2MLA2DgeSdFNHgvlU/2NRUVwaydQUK+6KlUef/qHn/w2CCk7333TQarpt7D6lcisGtUmLLpPMU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB17366.jpnprd01.prod.outlook.com (2603:1096:604:450::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 16:23:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 16:23:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ/G3L
 SoC variants
Thread-Topic: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ/G3L
 SoC variants
Thread-Index: AQHciguqrqFm2g/SxEybVyNueHs6Q7VbeACAgAFYM/A=
Date: Wed, 21 Jan 2026 16:23:48 +0000
Message-ID:
 <TY3PR01MB11346DD96307F6CA75B2214898696A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-4-biju.das.jz@bp.renesas.com>
 <20260120-disabled-underdone-c86197af27f2@spud>
In-Reply-To: <20260120-disabled-underdone-c86197af27f2@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB17366:EE_
x-ms-office365-filtering-correlation-id: a72c6a58-cce4-4f38-97e4-08de59097507
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HhlCykXED/ZzuK0t0tVQQA856lXQ9MLS+CDRSexwnPlriUzBL4QhpPXbl8Tp?=
 =?us-ascii?Q?VeTmu4to4SpMGGHZQ6QpRR3hSia/8gP4/J9Sgwtt8f7U9Am9VoCAkN3sSUkX?=
 =?us-ascii?Q?p17Jk6GBO1cXlxmo48Kfzf8XM7LtH9pGhqBhboPkpUhHj+3Z35l/q7cCGipY?=
 =?us-ascii?Q?ZJWh4i1QLuJIWz38HMqX4QVL3cVwRDSspBxMpQlji/4gTxfAjqt6H4/NZB3F?=
 =?us-ascii?Q?FEpZ7FvrysGfz1B8v0TiYvZ9SaqHh9Sdu5ZRYJ7tf+W0ayQ0rNWTDYvn47xF?=
 =?us-ascii?Q?po7UaDr/6YA6/wq3ElOkhDiLgoSz2uDssBk1/YI0z/dCHTptVcKHE6BeTY7J?=
 =?us-ascii?Q?ca2LxqW/YjKrQbVfBGrktm7cSdBThvQmuyM4TObLNpADrg26IVswT2HuKQjN?=
 =?us-ascii?Q?Y+U5J2waZy65ZoIvkEZFiUux98bdp40Lkzh8WMmtCgN20UAqeBnNougfdHQJ?=
 =?us-ascii?Q?f5W6XxrmkJhybBaaQH6YT1WoW8AgijIGwcvPEm3woSqBup+i0+zIg3JwJ6jc?=
 =?us-ascii?Q?NPqeZl2B1iLrYUx/NKgUAw/QdruM8L7RnhNI5cGoKLxJyCvsj3QnMYphtoi0?=
 =?us-ascii?Q?Io2ZfPxERaWBUOiBOOV/z1TAiF6cmqiWb/wsm25sjG9pGPnvTT60LVZREh6a?=
 =?us-ascii?Q?b1SA1BfZz1XxqOc9cRHPJ8Tc6mxS1d4lD+uuLcC+yF3NUCW0sSZXgFgNgSeK?=
 =?us-ascii?Q?mk1XTdnigIh8WK+RJo276Mn4jpr+sWFkEwk/QSyIAsvaldg9O6kHg6LuTYr0?=
 =?us-ascii?Q?gqWyExXnx1acY+LxYeP1HhfTZ9hCOJg+kqepk0efyNr87JJcDhZJZX4JGTGx?=
 =?us-ascii?Q?nRXPl7WTqjSYoUp1fPkuPcxnjGq9o/RJQAqcKNv7b++bSuxjGgICaltQiEPN?=
 =?us-ascii?Q?j+z+z1eYNSXdX1RXxu5Qkt9B6GZ07eEQdsWYFPQNc3nJo++7uaR6YJBMbwxH?=
 =?us-ascii?Q?ft37BIMVRNFc/kv8gndthcjXgkG1z5e2PDXn1G3PWhsKKiKQNPgmpXGZMzmS?=
 =?us-ascii?Q?GWaxR8z5t+TUXuW3+29LCsOoJOxPVfOKVERivz+DjTMhAlxKoEtyWlZj+wVV?=
 =?us-ascii?Q?Xly+zc6OL65hIrurIXFA2JfQCcUAOXbQNhEQb7N1E/LCuzxJGVlj2Zd7GPAK?=
 =?us-ascii?Q?usrpVMNIF05rPvgRYyMLsB1WN/YoVCSODurkHSfnu/+P/NlO1xdKB4sPo/fL?=
 =?us-ascii?Q?s47v1kwVzvGQd8V1XHJegNwt0SaLKitesdo+0WdnfE0AQBXZp/Xa03rMzwFk?=
 =?us-ascii?Q?GefRF7lHYX0r3tQ9qyTjpQs6+Lwl/hLmUoshIUZO5xMm9oqgqaficHBfF81O?=
 =?us-ascii?Q?+BHc4WtaZcWpYPFn1BRmSCyQh8w8RJ8sbPi8Moluj9p1ydOmVoKaGD9SygOW?=
 =?us-ascii?Q?t8ZQaoHiXsdoGv/fvDv4Zn9zeUXqT6tBYcBaN8c59ZBuLF/jEL4FGw6jZTMl?=
 =?us-ascii?Q?MCcm2zElUjNP7edf2WZLAMnu7K3BZqUk/s1PBW8KTNxSCMdZV6bZbwOYFgu/?=
 =?us-ascii?Q?BlViRp5lRsWp5uUHzVb+3lH2lUrK/odNEgBNpiD3TXqPvXfesJzDX4U0ElNi?=
 =?us-ascii?Q?nF91dcuHQE1vZ1YedhsuHN/Y2m7qTeRz2pyixJt0rExSMl5GhOw9cbaGPvnl?=
 =?us-ascii?Q?16NKY+lnCrwbK2xaYZ7NM2c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?33lQ6q3SVP7wa+VAXvL/9C/EGVcjF2q4aQIrButo1mgLgfK0mkKKeYyV9fJB?=
 =?us-ascii?Q?tmzb+fNBNgdudCEM95HlDA6NFxBQni42OakHPc9mnz/Q6T9mOhHs1luLS3nm?=
 =?us-ascii?Q?E3kj/IfamNNpXxS10JiKD5+FH3G9eM3UwNCeSBereebpZZBalYIDxIaQac2q?=
 =?us-ascii?Q?vz3Z9uw7VMdNNB5KkjiNVtZEeYJIyUp282gyrwDxvj0cfINmemGf5HhcyBVz?=
 =?us-ascii?Q?Yl2U1SZgTb8z8Me6U/Ne8gjyFA2veH5j8VDqDf9sLx4Vn1OIddTpb27VWYp7?=
 =?us-ascii?Q?vCViHHULgegtlrV+N3vA57pZkskb6NTWOw67mjNjfB7y3sbMfdd0JATYKCYM?=
 =?us-ascii?Q?jMRU7wKgBhDf5wqCxMQdbtqkOQYiwnKVEpRymZbMjn3kwvxmMx/q4z+70tUp?=
 =?us-ascii?Q?j8Tt1rR80RZrcg7CJL3MERzlwRDIcervNQiDkfeEKKR81lpEYNeEN4L5tOjD?=
 =?us-ascii?Q?qQhG7Oxgjv7NsQOkLRq9vC105Xp0OAFsfhtTaf947w9L+0odA+T0tLm/4hXV?=
 =?us-ascii?Q?K0enazdlFzxCMgbwnb45vhtgQqTwa2I/XAFM9HxcAx3Drjcom6O0vW3Sz91e?=
 =?us-ascii?Q?wKtxGQqVvX6xa9M/9f4hs6jyXDniakSMMQkQMO94r0lC59NhcDffymO0zuT7?=
 =?us-ascii?Q?+lqD1qdbN3cdqBuTMTcnMsIsk4pzewN6jbInmzGY+4Xe0r4itx6RiLGu0Bwb?=
 =?us-ascii?Q?4dnswCz3/koO3DtIzu3msUSnUXRLw9VV1Zf95VN2GxrMW/qQDhnc8v6Kw/x/?=
 =?us-ascii?Q?FoumwLdB1YMPjR/tpCH5ix8DEExUzm5q0uMaeizNjVSF75davJ62Zug4wl71?=
 =?us-ascii?Q?fX1UmwcfoAzCkOqjVRJdg4QcTUvBQYfaZgOCaezgGgcsvA5gOc4dJ3Zn0Mb3?=
 =?us-ascii?Q?gSX1i0p3DsDjJIijlZLeO9j1Ws81Tfv8YijQJ5n4JltQDHL6NC2TpkQvJCrS?=
 =?us-ascii?Q?vZIsnsLKAVTPG8BRiU02ZQrTrHwF2gp4xU5yWufrEy0ogHqJMXlCVIVwZqkv?=
 =?us-ascii?Q?QhRH/icBFqwTA57phLMHJu2EP3jga26MmIUSub7lMEStPvzEL7TrZl5lp+Cs?=
 =?us-ascii?Q?ub2PWKKInlfYzyyA96+e+0nonM5Ik4lMD/C/iAseOdNCaM4r8q85hxvRzedF?=
 =?us-ascii?Q?PZmyplFVwDeaWK1glUiXLk/ZqXTh6MVbml7seSmF/hXZi7yB2gDvK1WaacDQ?=
 =?us-ascii?Q?puSIXiryBaFJ1OIWWXhMITsJ2Wum4yPLLhmtJwyYG8zBV7Lj7uy2NsyYreJy?=
 =?us-ascii?Q?jlVo+8O1Rul7ltgjnzcD4+lcPXYTxWwGYqV7KjCVnxQkTtZr/+wGsiWYLQaV?=
 =?us-ascii?Q?1yALidxSHiw6VDpQYCfXPFxKwl8ZmG2rimfp2K8btSwRKjUQ2TjA1j5REsZJ?=
 =?us-ascii?Q?TsEnJawDNGVLS+NdcobL8efNS5rW/np68SKHaAHgyvP9K4dZFB9Q/FvHS1W5?=
 =?us-ascii?Q?vPAf+yrKuwxqYf/aKdxeAKKDZie130xWuHoEDYdSCJv10F7WPh+YMN6brN5C?=
 =?us-ascii?Q?MGQON/EQFlrnwJLHOIEpWn2j+yjL7TNxeUjiREumDBi+wYuAbM8nbMeXVmhs?=
 =?us-ascii?Q?V4UmEjWOYRfWx5pm4n+U5M3WVq7lnFLNzpmR6RG7BCoubks/pBazTYR1nO7k?=
 =?us-ascii?Q?cJ161QjBTO1NM1zjEQDIAKEAq5RJcfu8IIG7CV2YctErzooH3ffFGbWM5zPg?=
 =?us-ascii?Q?rO0Yd14KgBiyd0yVDS4B0SwFzUjqHhs9mo+gxJKyMLGIMdRjJafV6e8WR0/z?=
 =?us-ascii?Q?I0auKM2byw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a72c6a58-cce4-4f38-97e4-08de59097507
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 16:23:48.5590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aBtm/MC53YgGsFHAdCqvSCtFT/zr8+VS4HFLVIRkY0chvufEKIJm5v6ne8WViESgSBOaGJw4RDfN6vHp9iLiuMCoUSG8yh4zZZRe0uG7LyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17366
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27216-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 42EC65A54C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Conor,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 20 January 2026 19:51
> Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ=
/G3L SoC variants
>=20
> On Tue, Jan 20, 2026 at 12:52:14PM +0000, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Document Renesas RZ/G3L (R9A08G046) SoC variants.
>=20
> I don't get why this is a standalone commit, when you come along in the n=
ext patch and add required
> items to the list. Think that should be a single patch.

OK will squash both the patches.

Cheers,
Biju

>=20
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/soc/renesas/renesas.yaml         | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > index f4947ac65460..be61a71c7305 100644
> > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > @@ -548,6 +548,15 @@ properties:
> >            - const: renesas,r9a08g045s33 # PCIe support
> >            - const: renesas,r9a08g045
> >
> > +      - description: RZ/G3L (R9A08G046)
> > +        items:
> > +          - enum:
> > +              - renesas,r9a08g046l26 # Dual Cortex-A55 + Cortex-M33 (1=
4mm LFBGA)
> > +              - renesas,r9a08g046l28 # Dual Cortex-A55 + Cortex-M33 (1=
7mm LFBGA)
> > +              - renesas,r9a08g046l46 # Quad Cortex-A55 + Cortex-M33 (1=
4mm LFBGA)
> > +              - renesas,r9a08g046l48 # Quad Cortex-A55 + Cortex-M33 + =
GE3D/VCP (17mm LFBGA)
> > +          - const: renesas,r9a08g046
> > +
> >        - description: RZ/V2M (R9A09G011)
> >          items:
> >            - enum:
> > --
> > 2.43.0
> >

