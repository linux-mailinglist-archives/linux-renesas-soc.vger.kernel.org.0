Return-Path: <linux-renesas-soc+bounces-26268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BFCF23DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 08:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E862300997B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 07:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70762D77EA;
	Mon,  5 Jan 2026 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cjNY3nB9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CBA254B18;
	Mon,  5 Jan 2026 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767598969; cv=fail; b=BFE1dUMfT0pOBnFYYZ77RfJrxSmMvSvRrklj77KOSC5nMJkZHS+VO0C/kOyaBxrjF4DDqfVmqkE0yxvX4WIDLbWR9KFkZzQA1AIuytbnhKisNlgYze30Et1h59Co+QGvkMww8OXejhCNNLzLxHLiyL6KzNwV5AV+7Js9cs7mbkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767598969; c=relaxed/simple;
	bh=HUuOPAv+EzhdSz5zVSCzQzz3GEJgss2XzqNtlQJz76U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ImnNZRoh41cbLsADcaJbx8/qqL31+0S0gsQn4Y2Cidtir3YtLtrBUnhZ08aAwF6zgtdQfogjiADFFuu771Z+H4Ifxe7c9z1wuZfZ0oo10ePJJpaLEypuC1gtd162Be8T5P/clXrICEauym7599Z7H9LwV1CScse0bz7vueIz66U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cjNY3nB9; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncwnKqpwpjJWy9TfxFBxucJ4AGsyd6ebGmH+SH8Nvloeq2jygwfSFGTHX8jwf7IlIAl5SmKQNFc1NKSOJb00y1YLSkR4ATZ8dO+IpJcuXcr5D3v4FZeClriQUPMuzmU4KU8gyGDk9kph/6jsiw23rDWe3YR/kN5Eqb6y7NfkF1tupn8921P+NZJo6PwzEHTSg4hMY21cZZclTkFU3AoJ+E03/YY93WBpl2KsxkCuv/ub5foHrrC5TsI1TjTEW87gkn4SEoM5zrGKGm31pIn8JGfkAa5kLVSxPlRs+Lg08Y3PrihnJHhNFnwqgNxkHt6flyispvqEkugmMOjaWjATjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOEGD1V6HjRwp49z069qRNgiNAIytPdJSBWHFvT4LuM=;
 b=qko59pEbFewRf/ZnRXt6/Y79W3YZC6GOu3wdldRxUEKTKkK/6qCEQbV1hpkERYLHlACCkEOrPSyA6QappsavfixyMvN2vOmJtPdCWdG3xyePnMhvWAb6Lmag7N5aTCH3Z3u6PYEncyAvcUARJP9GNbPwvptFGuyde9o3uClOjBryhdYGw8eNT7Gb1iwa1zKmOBeOns2Qd2F6cgWsA0p6Q7LBLFPgal0IouFeCFoIOhPtK57ROcBAJitGqTcGdWk+fpyZUJuy50conQWzf1UCXCSszLbYdWlW6LZXfPRpuDTreVMpOGowqGTRCY6H3/hLM8pxcdZWI4h4jDPzAtwCOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOEGD1V6HjRwp49z069qRNgiNAIytPdJSBWHFvT4LuM=;
 b=cjNY3nB9vtAbeGLH0AGww2/jXWXlT6TbpSTR4sBUJmv3+MtUMIfN34Ql1YEpBX3Pb1izmG9NE0zDw0wny55xr3TiI94IBYRUEZElXWi/Zj0AUKs8uprO4XitjYMmV9+DHVxqJ8ouAcE9dkxVz+r/6SNy8dxWxbCajp+amLue5a4=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by OS9PR01MB12552.jpnprd01.prod.outlook.com
 (2603:1096:604:2fd::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 07:42:43 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6%4]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 07:42:42 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Bultel
	<thierry.bultel.yh@bp.renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/2] Fix CPG suspend/resume on RZ/T2H and RZ/N2H
Thread-Topic: [PATCH 0/2] Fix CPG suspend/resume on RZ/T2H and RZ/N2H
Thread-Index: AQHcX64+of7LTyqgnEGvHG9luWnVc7VDbiWA
Date: Mon, 5 Jan 2026 07:42:42 +0000
Message-ID:
 <TYRPR01MB1561941846EC8C92EEB39E1278586A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|OS9PR01MB12552:EE_
x-ms-office365-filtering-correlation-id: 9a4f161b-65b4-4691-7e59-08de4c2e028e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DclmBgSZFGnwMv4Y4NlUOsQMcXMyS3HGW3RvHjdTSqbj71FJCpA7Yzcgoktd?=
 =?us-ascii?Q?lea0l9sOiIx/63iP+qTzEbK6VYmWcP2S+kiG1Z5lwrTEMyShdayexZY1UPP5?=
 =?us-ascii?Q?oJuqUgfwFrHr5IlCOHoDCKAj6npivJjB3j8zBVE3xJtNfh0J8r2izmcP34us?=
 =?us-ascii?Q?9q+8Xf575opMIr4ZSUEs0PIdrbo9HGjH3t5fzu7xhfGf+cFmRCD83QLwSSV6?=
 =?us-ascii?Q?/hTgncRnqBR96BJUJHuDazPz7DjTdsOHi0vYEU8VLG/7MFTudu1uBWMpJ0bU?=
 =?us-ascii?Q?9oxaGw6V4q7yHISBqRtE1qsoI80hhtDg5qzExUSO14jtYuprnfXD6U/XQKeV?=
 =?us-ascii?Q?4SFLR7DZRzeHt0hWAh8jFMwTG6yK9lmmE7MEov4WodfPX54+fg6nHc09p6Lj?=
 =?us-ascii?Q?rqKz07WNuFHxSGVv9KfkFHH4HCs/2AbeERDE8JK+EP10UR/1i/uts+l4Zl/D?=
 =?us-ascii?Q?N0Diu1CFlLmwZ98YoFg3O+kh4tLMNtz63fLoWQiUPQWpPR6OZlIxHW7QuWWp?=
 =?us-ascii?Q?qQDf3FzE7iwVFwCGnRLjb3hhTwFy+e+78N2Rx//lDBBDgXp8xo2Wg4RVsxuV?=
 =?us-ascii?Q?liQuLcRhvaLWWoKtLkFlx7RtziPGq4EdGYASQEzlSoj04klDXWTUCOoQLRwr?=
 =?us-ascii?Q?8pyBOJx3S6Gr9IKk3hpXITcGx4CrwiEdVcd8EOxDTm9O7bmHmoKqWDagpGKb?=
 =?us-ascii?Q?JDiOixdVuPTrV+W+xm8zzFRlPIcHweyZv0ochQNQJulu+FXdRqa1JBQ79KPg?=
 =?us-ascii?Q?a7u4bcMWCU47iH/RhhYVFyGIVvXnXeruSU9/9KHggsxjN25nbZsSpW7eq8mT?=
 =?us-ascii?Q?OqDbjRPeJmpbWBASVQfYdW7MdG0xlkyYtE6NVrLFKIOsYbdGhFdoWK99+0SB?=
 =?us-ascii?Q?iIXL1xteeOTMqB6P6G4aHUVlHaOP1uFP9NA1RxvX2bNz0Dn50RZ3vdsey3YC?=
 =?us-ascii?Q?lzRq347e4xCq8e9aOVH7ZGdUK7ZzpWDaQKP3CQvhYNLzq1kPEIFkporDSc0s?=
 =?us-ascii?Q?PvZ4Mr/80tu2TNdAbVrX0UjpD5n0Hc/N3hVChDHzBOKOHAp65SMPZHROR9OJ?=
 =?us-ascii?Q?ans8uRgM470KvPfa5PwEkIKpCva8u/R+oPT9NrQxp2YfWhsukapFpZuYo9Cl?=
 =?us-ascii?Q?nP5RVib5brq3uIl3w7jq/1T+ULAEfXSyW2yflgWVr7pZM5y37op7NUAomVIo?=
 =?us-ascii?Q?dDo9pfTGAOWhZYCOuYP8H3Y3nnwBxlDJ4xPXPBx388maz29o9iWckhE0AeIB?=
 =?us-ascii?Q?Y+trnCYGA2E3CK/HthX13lVtLQat6xj+r05p4kLEuxZmEbKBWw7IAJdDvtSh?=
 =?us-ascii?Q?pT91Bsj3P5nkC0o/azMuiFrs+7HdTCNTXnteDe7g32EpXa+in43W1LsZs4q5?=
 =?us-ascii?Q?EkNGH/UX5E9ayYTiSGJfsLfcOZvEKwQsdlA/6csmj29xP86SM7/RhV8qSl+N?=
 =?us-ascii?Q?eo6q6GEB7keN7xaNXoX9gw3pkDZzi/qgfbRajRm90QDnzsr5AYAZ5qjOaepe?=
 =?us-ascii?Q?dtnVntimRLRAiuV2Zifcbto8ZoWd4G/rbKcX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1OppHbPSeB5IGQ6r1nn1+pBtO2OPnT6yxkhYTTmXIF9RaCJb1iV5aszJpYxZ?=
 =?us-ascii?Q?nDKVrj1Voz1FcyH7dgxwN8VTBQ8wEF5FJ7rOJIgIOKe79ky+6be1wu/KKcK+?=
 =?us-ascii?Q?36IZaY6T7S6FEHpp6C1IrPOewRcQq+PvjFFOMNafPUZ3fRXq6z1ohjpui367?=
 =?us-ascii?Q?6OPmTUKeOZLBCLe+5JO/hBOAY791vfRd22GI2eMKeChBzVnubv2lrYT1aDNU?=
 =?us-ascii?Q?3jmbFvNuvDWvYnD7Q2Y3XgEZ+4jyUtLS1c1phkT3yQ4hDsc2wR5jVNzYTXd7?=
 =?us-ascii?Q?TV0akm8zVHQ5op+QRTRMTPsmAxrejdrNQFVARoh7mSebe0LOyiU2aqtUl4Ry?=
 =?us-ascii?Q?vVDEQ1JKnt1O2vjR57zCgwqTxSr/bqa1bzLzwO/aaZd71wlUYRup9sRczbdo?=
 =?us-ascii?Q?6Fdd28ZfOC8m7L1y8k6M9KD0Y54EWXDq3JHN1R5MVKLEh2sy0BGkIpty8c+R?=
 =?us-ascii?Q?lF+BUlJ8Ems/WyCTYQEHHh0rrj5LldJ4XWaKso7W+TNVKmmtRoGtbXJ8Vf0T?=
 =?us-ascii?Q?vM531Km1FmFDz5CSRQxBPQ3zaP1vh0JOSB+Fi/g/f4+EfIv30jaDlixXzcNl?=
 =?us-ascii?Q?iD1gJcKcnx21isJJOYRxpyJxM1yA66/PsjnryYqVqjiTNuT4lvuzHBQjZca2?=
 =?us-ascii?Q?vyXjxEz3gY0HeiQR9ZwXEp2/F30axr9jPHTPf9QOCkumGYMbokxpTcr2fLuH?=
 =?us-ascii?Q?zQxsct083/Ir3HU1LiEZkTSVAD2iQIo89zU1M5uH6mF4vNoQ7gtdh0sSGrqD?=
 =?us-ascii?Q?pdJQ6ok7LLEX3ujoiQeFrGPugq9VhVu67iTis6MoruPwZVQdZl9LkH5R8vKJ?=
 =?us-ascii?Q?5PleTUt083x1MyucC8YKRud8geLVxEowd3I+PqVPPBg/ySsyz72xHWEhdhxE?=
 =?us-ascii?Q?RPQxCtxOIbk6MBQFbJsaPD4W2SjchppqlSj8DsLG8VOeeM5e0kITsML7SrYd?=
 =?us-ascii?Q?rLHCz1+Z7xKdzYOa5VtOI/T1+DxHd6NKE4BNITYIEL5kNBvpwjT79h65Ud6Q?=
 =?us-ascii?Q?CgZ6qYMdeTZTVTQQr2yuevX0ZPLXync76+dfJa+eo15cl3t2PYjpr1IQ2p/V?=
 =?us-ascii?Q?/dBPbDeBAl6fLV4pudBbWJ1Ks1ih2exjrOEB69ifR90e2VYaKDcNj5b5iXQa?=
 =?us-ascii?Q?G51gh6bUoHcnGrCPOpKhzGmhEH7za2be8FDfbUkP3AJQGi00RmJud3cnjfky?=
 =?us-ascii?Q?3O6PSvIEr5NISBCk8NNCULkNjjZl1/qkmRZbKcWT+6N29c1XSFhskYqK2u9D?=
 =?us-ascii?Q?BgMMBGhQFbR8jme5sd22mVNUd2B7/6DRg8SFdWlfi4tUn/x/y+UpXK6EB5f1?=
 =?us-ascii?Q?PxL0Wcr1NUegh1c4VeHNf7BPNVDobZRWu9NF5Wq3/qXZs/7a/eXk9xdWFxZf?=
 =?us-ascii?Q?oOSz6302QtQthAHX1EUvNW/aemc0+y+zXB3QkCfG6jvawlFDVukmLMYjVclC?=
 =?us-ascii?Q?9GiYAY5ILyCVDScSL+/CG4fzookBPx92alVGqP1zbmDaHJ4mnAjW4lCRjTJ5?=
 =?us-ascii?Q?jS/+EzNYfHnkR7flMQR3cQ/wzM+23mj10RtCHkPkk3WZKe/lrmhofR0DjlJh?=
 =?us-ascii?Q?/JtcZ/DL0f+qAWgw2EiN6SpMuKMdhn2ggeE6IRS6kMqhVO8LMQxCh1kObkEg?=
 =?us-ascii?Q?AuTM5dEQ4ho7PDYBllhl8WtdwiU11eLY1pqrZb3nvAHqpUelXmqgpPODJ+06?=
 =?us-ascii?Q?D1DS33GTcUAgleA5dgtgEMB6v+itLSUD9wuhLOIOR/zpeBpCkt7OjCYEjE8J?=
 =?us-ascii?Q?yC++jXiPog6/BSNAfVaLGeQ3SDjaPoDHxccjsRghYe5KA6PvRWRd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4f161b-65b4-4691-7e59-08de4c2e028e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 07:42:42.7912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gbKImd79qTDfkbGf+IHsuQIAQDHH7b8LmjoNPtD0zlCzdoyQEOXr3EC3oYcqIJpvlvvq05z8ddX1vs55IhHp+rNLkpJv5ew9pOuFHR895oKmfD65JnSOeGxRIhnlPsqV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12552

Hi Geert! Was this skipped intentionally?

> -----Original Message-----
> From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Sent: Thursday, November 27, 2025 4:57 PM
> To: Geert Uytterhoeven <geert+renesas@glider.be>; Michael Turquette <mtur=
quette@baylibre.com>; Stephen
> Boyd <sboyd@kernel.org>; Thierry Bultel <thierry.bultel.yh@bp.renesas.com=
>
> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-k=
ernel@vger.kernel.org;
> Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Subject: [PATCH 0/2] Fix CPG suspend/resume on RZ/T2H and RZ/N2H
>=20
> This series fixes an issue when entering s2idle on RZ/T2H and RZ/N2H, as
> the register layout in use by them was not accounted for, causing
> aborts.
>=20
> See patch 2 for stack trace.
>=20
> Cosmin Tanislav (2):
>   clk: renesas: cpg-mssr: simplify pointer math in cpg_rzt2h_mstp_read()
>   clk: renesas: cpg-mssr: handle RZ/T2H register layout in PM callbacks
>=20
>  drivers/clk/renesas/renesas-cpg-mssr.c | 46 +++++++++++++++-----------
>  1 file changed, 27 insertions(+), 19 deletions(-)
>=20
> --
> 2.52.0


