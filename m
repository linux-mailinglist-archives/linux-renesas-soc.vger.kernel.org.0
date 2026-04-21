Return-Path: <linux-renesas-soc+bounces-31457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGA2IjWk52nX+gEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 18:22:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8957243D449
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 18:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85F3A300371A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 16:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09232C030E;
	Tue, 21 Apr 2026 16:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kaLlPQi6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545FF257824;
	Tue, 21 Apr 2026 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788527; cv=fail; b=GMB2OTu1nOGarRPlLx9fhacolIPQhgx4M1H9outI6XFSqrPdUxjC2PkF3ZTSFwwAUgsOdeH3rEHRRCXNREWhXF4Bb3CZ7GSatPw1vk9MGVPdLRiwXU5T+1cl3DzwBQ4bA9q48H/N9I0+ckzRqfuo6u2u6G3iK3iiRITgX1+2Aeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788527; c=relaxed/simple;
	bh=dxMdx3lBdbC1v4waT1ooL3/CyBC3JdYc2SlwezVSiZQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PsaFa4UpJtGz478C4EF1NnWvlOHz6xPelKKYcdoI0S0TYSqnFXaYl9U6VPVct2uqaUqyT2omboI0rA0FsT3IXeEW1QF58P2MGiH51ym+QwsoTXlsSiqQ3jJRSY06iONPm7+7ea2hTqdeqKQIpyl/fm/yhtAlGk3OMlKhbRiiJAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kaLlPQi6; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfnXz1uM4/3z5uA3iwNeLGC1KgybEPqsp6YDGH3L0kPVQi9i64MbclUN+2fDWPUpEPJdVeacvoZ3arzxQEqwZg08jM4EzdS5OHSrvU2f0r90Y4WhuAXEROk1VwRHMA3naV2W8t8XOG/9P0lEvpycWFi+pxiwBiAiPfLftk/DgDdzKBChMrfJf5qyB3BYDXAqVJSkbMEs5KXvVSDf0VaKKfkr9JH0p4ymYz8xd/Vwr/+96VYdVBvAau8tlq1mfgDMymQ0GAf/Go/7f/QyjO31uJ4JPX7Ws0/z8YBjtd3AeiWDEkNP1k2y7RVGRFjj/AMIMtPYpCQT9qE4T9riA4WDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOi+di+DvsPjo6QQBqIkGP8bCK+14NtYrrCWyz1YyNk=;
 b=KH/jAImqcjYn9wcOwGgoBlroef5g2nKEkJHzwBzTTkK19nvsxMGOo54IgdXqWqkKmpDLhzKHi/jsi2gibP6a0goEen0ePdPkOOH7phEXTc75fnhKf0wzgHgEHHck7C3VXdjyJIzLBhdQoLCsEN37SjgBhjGOLbQOVP2ZGHTyPYs9YHyQ6dJbLubSwNHAnr6c/S55m5A/9/UwDGL6vsRRLWPUSKbSclEYbbj+Aqha5EuU2Kor79aWruPvOmqXyBzUVHAeiIBX7VLT2zEbENy0Vt5mYRR2/5MXgj2r2rNmjLX3bU+6cvPzT+hVcNaU0hCEEfZoAZDkdR0S1hoWwshaHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOi+di+DvsPjo6QQBqIkGP8bCK+14NtYrrCWyz1YyNk=;
 b=kaLlPQi6RmIp0YOe6jCpAOToKRBmyykHnFQdVGMP2FdWBhQafgK6yKY27CIY9Md4nR3mtCgPdgAEOdm4T1Z1JjoJPbrGFZ8iqosE9Eykw2QDbzPGfAdYBca5bHjketASDF5C9c0t+9gwhLZjU1Z7DXwNjWFEl1xkiJUfc7R0O4Q=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYYPR01MB13954.jpnprd01.prod.outlook.com (2603:1096:405:19f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 16:21:27 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 16:21:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH 3/3] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
Thread-Topic: [PATCH 3/3] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
Thread-Index: AQHczpL/Ukn6EchJEUKwiqN+6dKGQLXmjZUAgAMiHIA=
Date: Tue, 21 Apr 2026 16:21:27 +0000
Message-ID:
 <TYCPR01MB113323F70F57F8EEE3E12B200862C2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
 <20260417175235.224809-4-biju.das.jz@bp.renesas.com>
 <td55nrjrchomtatyx5phbojvjipwh64gnlnydqame5xakviafp@ixzaju2lnkpm>
In-Reply-To: <td55nrjrchomtatyx5phbojvjipwh64gnlnydqame5xakviafp@ixzaju2lnkpm>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYYPR01MB13954:EE_
x-ms-office365-filtering-correlation-id: 4b444281-ad86-4588-569d-08de9fc209f5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 8JvLynp743HODv8t3EYG6ZwX2nq7veRvWeqVTakycgKdTSbYOzq6iwKE69aeG3d5bbgKPJtygSVuWA/Q2bWVquj4hSJflJfAEapxbd04cc3wwGK2IW26ylbzw/4stdRiMPyW83XDorj88P7n5iBCapkMw/YrwNjwdPDal/+3kmT/XbZ8wiOT99qX2PKFXZOz2aJijRcXm7eUU9a8OiwKHmvp9Vv1frfjfeX05JxJNIo3eFGphVy8D//tFeCkomSnG6nmXjgXMciP4zWgN0smefRVhHLZcwtlAyymddS/O+RhJ9L5/4gCFocazr6gj/gpoN1hK32W+Y7MTIv+3gVzYM+odVfiQi+s4ZFkYFORb2BJyciKodAWG2Y3wlgOxRJISoIKa32sSaO+qHFc9BUU3ScYVSJ2GVzFbs1dVAiQ3DW8uFhesb5KqJScuf6n64fBAeNniq1/yg2vIXY2PS9Us1AsK+0g8HkPa+VfI35/27Hprmjl9RZbaoKilY17Tsm7I31bqaBD3oLWXWOlrLSeoNpNYnzTSXRIKBzocOMgZNj3d81SFlO+LyH+yj7JWE5ffcqcrYxA5xPoJWgK3RYK6n+yNQTzJtsA8gRUZkb4jo6souJEdniUwwYRKMN+Ux2D2VZyGZpIgso1oX0iquyKp4tvneoR5s6McgDcTfFI/gfI/Sg59EjQWOg5PtEHTUpHj20U7soP5IaJcdBCelYiKpIr8jn/hWXZGMlvyjaejh+isIWqOdz1ZdqfYBJMM3CII+9NzOBMQ/vskgwENNkJo1sv7gD1/Vxy7P0h2xSTzf0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7llJbGUJ454RGlbO4FzrF76mn8M+SdiWj++L3lG7S48caiRRajOKMHmvFX9o?=
 =?us-ascii?Q?9/r5Mba/tyJ0C0iubyzqdETjv4ze90aUTbCKZ629SrmVd70vtVFfD9irIC/3?=
 =?us-ascii?Q?S1cPXmnzh1yzE8x1lM0mvB8pcs8cw8GZFkT6Ey0w3Uqpeb4AgMbr0bKDQ2xZ?=
 =?us-ascii?Q?yNq7rh25gUKwtxvYvfj/2DjQZwEr0vB8I1/Oe1amJwyp3VvfxyJGBpGZOWRf?=
 =?us-ascii?Q?90K2rzZESqLsw/lXioEcWLI96zs7MLiMfFrJhtAE5QOAHEa+1eZe40Ph0XT/?=
 =?us-ascii?Q?aeJPLHds8C+5CNNRYVIWCzqBFv0TIvnnEM/RT0JLHyIK1GCtWZ36VG2D6igj?=
 =?us-ascii?Q?pHyOQuPkVjlbZgU+fL1YZSPRRaexjSMwbLv+oKQsOSVtJdb/TV6va275P41w?=
 =?us-ascii?Q?NAioTbAume2dOjhupyTSnGcigjEafjyHcgpVHwHA/ClJRJF8y3X2e6wwLppg?=
 =?us-ascii?Q?wHdjyw2pAMqduadIplAQFMfhdcYj60zNqYzbqqnDOxdHRkQ4JrTfa0b+r02Q?=
 =?us-ascii?Q?oakGptl0ebVZcUlT7y5mgnLkwX69odQTKOMu2gvvwhSwJLNEtwilq0xZ0/tG?=
 =?us-ascii?Q?bl/YDDyPSF/DUcqOELOIBHTAm5ud2TUo1qoclt+djX+pxlS//Aghd2Pkg3ye?=
 =?us-ascii?Q?8R9eSCe73s+vGtM5m0PXHTsTir4E9Bg7mXS3B4EJmzvOQxkwnbc35akLtbei?=
 =?us-ascii?Q?9s8M+VQzioNlyL8HDk9nZMyJQ6MOWLbs5J4gu1ttPxNVy3KVV7Sqyfxlvmr3?=
 =?us-ascii?Q?0t/nxubX7lXd6n9LwJtelgS93rnvGeUE1TFSTwZmr8XBNz0d62jERDf2kG4H?=
 =?us-ascii?Q?etAJdRbw1Xh95oHNgFFz9NeLFWFvm18paoMBhV+DsTFujavO1fV49hft1Pqa?=
 =?us-ascii?Q?iMO2wQVNP1dSQGfOfKp7iWlZViSQhBl1y+TU0n6c4AEgAEgu6VA9UCTjGcoO?=
 =?us-ascii?Q?xgvY+LOd79pTNh5a7bBn4pBtymTnFxyO7or7dGh0cVhEBaB8SpI3huJFA8dA?=
 =?us-ascii?Q?yS4pB68NmnC4JofdtyovN7eNtxNToJ17sJjgVGedXLj/j9IRc3tGAAKEyzi+?=
 =?us-ascii?Q?NkRv949PlpKb8WKRoRKI+Fz4j+xAoHUz6YUBfggrjHT79u92ym7Ft4hRTzhE?=
 =?us-ascii?Q?DDGmdgLyFeN6cxcW2J+Anz4827ZKUxLMJW/dETOCwq6zbWYUsJoaEqxZ5qJR?=
 =?us-ascii?Q?Iwk4QfgtKlUug0SNUOTdrmF6baRVg4X9qObGng1MGADueeyCHmc8LnlFIRFW?=
 =?us-ascii?Q?vQhKo7RDCc2SFMszWmIZ1nXVBtk9GXi+o/61voNtcdqWzb0PUZh8ZZBDR6tI?=
 =?us-ascii?Q?LLGNS8a/loQXpyAjb6nOSr+KImSQn0deuxOih4+0ajX5V+R9QiO/l4OPRteY?=
 =?us-ascii?Q?hvH36MPy6DvdPxAZbCfcuoNrKtOrYol3Kk8gWTDdM3r3KLOBnH07uh/aO7Hl?=
 =?us-ascii?Q?faXb9QfjkGNhCUW/ABpRy3niB6s5lTBBlykjp4QpMzI9S3HGNsapGAU1qZVc?=
 =?us-ascii?Q?iT3sFJj09/NebVPJ0yVO8p233cxyGB+075nT6AEnjWe6irtWWpcWyfsHtS7g?=
 =?us-ascii?Q?9RNdI5BQPCege3wXu6kEUBSD/tL3Uw0jUBz/Q3Ky8fweOgB9XP9xOKMqE3pL?=
 =?us-ascii?Q?+uZWccKCvDKXVMhQCUs00Krb0uPbdB0wlW18WdPwYLJX/YZUkcA5Kc/0l28L?=
 =?us-ascii?Q?rGTppUEIp5KFcJ/lNPNgA/xZ8wL6ZZr51RgLKNnfDnK23LJxtFvAer2K3KUA?=
 =?us-ascii?Q?WkjZmVCsOg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b444281-ad86-4588-569d-08de9fc209f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 16:21:27.2498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qNKVXcedbfEE4Sh7g1l9IbSnxWlW7dLkLA3ogIOxaEpCsuXEMfTSDVR2KNP4Pmat/e1BplPsjpaCArUNfJmtw0aLU/TFVWZRAGg0E9lAz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13954
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31457-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,vger.kernel.org,lists.freedesktop.org,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 8957243D449
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry Baryshkov,

Thanks for the feedback.

> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Sent: 19 April 2026 16:59
> Subject: Re: [PATCH 3/3] drm: renesas: rz-du: Add support for RZ/G3L LVDS=
 encoder
>=20
> On Fri, Apr 17, 2026 at 06:52:30PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add support for the RZ/G3L LVDS encoder driver. It operates in
> > single-link mode with 4 lanes (Data) + 1 lane (Clock) and supports
> > pixel clock rates from 25 to 87 MHz. The LVDS module cannot be used at
> > the same time as MIPI-DSI. However, LVDS and the DSI interface share a
> > peripheral clock and the MIPI_DSI_PRESET_N reset signal. Also, the
> > MIPI_DSI_CMN_RSTB and MIPI_DSI_ARESET_N reset signals must be asserted
> > before using the LVDS module.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
> >  drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
> >  drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 333 ++++++++++++++++++
> >  drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h    |  22 ++
> >  .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
> >  5 files changed, 395 insertions(+)
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig
> > b/drivers/gpu/drm/renesas/rz-du/Kconfig
> > index 7f2ef7137ae5..cbfc7b6bccb8 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> > +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> > @@ -26,3 +26,16 @@ config DRM_RZG2L_MIPI_DSI
> >  	def_tristate DRM_RZG2L_DU
> >  	depends on DRM_RZG2L_USE_MIPI_DSI
> >  	select DRM_MIPI_DSI
> > +
> > +config DRM_RZG3L_USE_LVDS
> > +	bool "RZ/G3L DU LVDS Encoder Support"
> > +	depends on DRM_BRIDGE && OF
> > +	default DRM_RZG2L_DU
> > +	help
> > +	  Enable support for the RZ/G3L Display Unit embedded LVDS encoders.
> > +
> > +config DRM_RZG3L_LVDS
> > +	def_tristate DRM_RZG2L_DU
> > +	depends on DRM_RZG3L_USE_LVDS
> > +	select DRM_KMS_HELPER
> > +	select DRM_PANEL
> > diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile
> > b/drivers/gpu/drm/renesas/rz-du/Makefile
> > index 2987900ea6b6..46decb7ac4f1 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/Makefile
> > +++ b/drivers/gpu/drm/renesas/rz-du/Makefile
> > @@ -8,3 +8,4 @@ rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+=3D rzg2l_du=
_vsp.o
> >  obj-$(CONFIG_DRM_RZG2L_DU)		+=3D rzg2l-du-drm.o
> >
> >  obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+=3D rzg2l_mipi_dsi.o
> > +obj-$(CONFIG_DRM_RZG3L_LVDS)		+=3D rzg3l_lvds.o
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> > b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> > new file mode 100644
> > index 000000000000..bedeedbdfada
> > --- /dev/null
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> > @@ -0,0 +1,333 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * RZ/G3L LVDS Encoder Driver
> > + *
> > + * Copyright (C) 2026 Renesas Electronics Corporation  */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/media-bus-format.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "rzg3l_lvds.h"
> > +#include "rzg3l_lvds_regs.h"
> > +
> > +enum rzg3l_lvds_mode {
> > +	RZG3L_LVDS_MODE_JEIDA =3D 0,
> > +	RZG3L_LVDS_MODE_JEIDA_MIRROR =3D 1,
> > +	RZG3L_LVDS_MODE_MODE2 =3D 2,
> > +	RZG3L_LVDS_MODE_MODE2_MIRROR =3D 3,
> > +	RZG3L_LVDS_MODE_VESA =3D 4,
> > +	RZG3L_LVDS_MODE_VESA_MIRROR =3D 5,
> > +	RZG3L_LVDS_MODE_MODE6 =3D 6,
> > +	RZG3L_LVDS_MODE_MODE6_MIRROR =3D 7,
> > +};
> > +
> > +struct rzg3l_lvds {
> > +	struct device *dev;
> > +	struct reset_control *prstc;
> > +	struct reset_control *lvd_rstc;
> > +	struct regmap *regmap;
> > +
> > +	struct drm_bridge bridge;
> > +	struct drm_bridge *next_bridge;
>=20
> Please use next_bridge from the drm_bridge struct.

OK.

>=20
> > +};
> > +
> > +#define bridge_to_rzg3l_lvds(b) \
> > +	container_of(b, struct rzg3l_lvds, bridge)
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Bridge
> > + */
> > +static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
> > +				     struct drm_atomic_state *state) {
> > +	struct rzg3l_lvds *lvds =3D bridge_to_rzg3l_lvds(bridge);
> > +	const struct drm_bridge_state *bridge_state;
> > +	int ret;
> > +	u32 fmt;
> > +
> > +	/* Get the LVDS format from the bridge state. */
> > +	bridge_state =3D drm_atomic_get_new_bridge_state(state, bridge);
> > +	if (!bridge_state) {
> > +		dev_err(lvds->dev, "failed to get bridge state\n");
> > +		return;
> > +	}
> > +
> > +	switch (bridge_state->output_bus_cfg.format) {
> > +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > +		fmt =3D RZG3L_LVDS_MODE_JEIDA;
> > +		break;
> > +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> > +		fmt =3D RZG3L_LVDS_MODE_VESA;
> > +		break;
> > +	default:
> > +		fmt =3D RZG3L_LVDS_MODE_VESA;
> > +		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
> > +			 bridge_state->output_bus_cfg.format);
> > +		break;
> > +	}
> > +
> > +	ret =3D pm_runtime_resume_and_get(lvds->dev);
>=20
> If this  fails for any reason, the atomic_disable() would still be called=
 and it will decrement the
> counter, potentially undeflowing it.
> Consider switching to pm_runtime_get_sync(), which suits better here.

Agreed.

>=20
>=20
> > +	if (ret < 0) {
> > +		dev_err(lvds->dev, "pm_runtime_resume_and_get error\n");
> > +		return;
> > +	}
> > +
> > +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> > +			   LVDS_0_PHY_CH_EN_BGR, LVDS_0_PHY_CH_EN_BGR);
> > +	usleep_range(20, 25);
> > +
> > +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> > +			   LVDS_0_PHY_CH_EN_LDO, LVDS_0_PHY_CH_EN_LDO);
> > +	usleep_range(10, 15);
> > +
> > +	regmap_write(lvds->regmap, LVDS_CMN, LVDS_CMN_RST_PHY0_SEL);
> > +	regmap_update_bits(lvds->regmap, LVDS_0_CTL_OFFSET,
> > +			   LVDS_0_CTL_FMT_SEL_MSK,
> > +			   FIELD_PREP(LVDS_0_CTL_FMT_SEL_MSK, fmt));
> > +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> > +			   LVDS_0_PHY_CH_IO_EN_MSK, LVDS_0_PHY_CH_IO_EN);
> > +	regmap_write(lvds->regmap, LVDS_CMN,
> > +		     LVDS_CMN_RST_PHY0_SEL | LVDS_CMN_PHY_RESET);
> > +	usleep_range(100, 150);
> > +}
> > +
> > +static void rzg3l_lvds_atomic_disable(struct drm_bridge *bridge,
> > +				      struct drm_atomic_state *state) {
> > +	struct rzg3l_lvds *lvds =3D bridge_to_rzg3l_lvds(bridge);
> > +
> > +	regmap_update_bits(lvds->regmap, LVDS_CMN, LVDS_CMN_PHY_RESET, 0);
> > +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> > +			   LVDS_0_PHY_CH_IO_EN_MSK, 0);
> > +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> > +			   LVDS_0_PHY_CH_EN_LDO, 0);
> > +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> > +			   LVDS_0_PHY_CH_EN_BGR, 0);
> > +
> > +	pm_runtime_put(lvds->dev);
> > +}
> > +
> > +static int rzg3l_lvds_attach(struct drm_bridge *bridge,
> > +			     struct drm_encoder *encoder,
> > +			     enum drm_bridge_attach_flags flags) {
> > +	struct rzg3l_lvds *lvds =3D bridge_to_rzg3l_lvds(bridge);
> > +
> > +	if (!lvds->next_bridge)
> > +		return 0;
> > +
> > +	return drm_bridge_attach(encoder, lvds->next_bridge, bridge, flags);
> > +}
> > +
> > +static enum drm_mode_status
> > +rzg3l_lvds_bridge_mode_valid(struct drm_bridge *bridge,
> > +			     const struct drm_display_info *info,
> > +			     const struct drm_display_mode *mode) {
> > +	if (mode->clock > 87000)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	if (mode->clock < 25000)
> > +		return MODE_CLOCK_LOW;
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +bool rzg3l_lvds_is_connected(struct drm_bridge *bridge) {
> > +	struct rzg3l_lvds *lvds =3D bridge_to_rzg3l_lvds(bridge);
> > +
> > +	return !!lvds->next_bridge;
> > +}
> > +EXPORT_SYMBOL_GPL(rzg3l_lvds_is_connected);
>=20
> How is this going to be used? I don't see the user in the patch. Please d=
rop the unused API.

OK, will drop this patch as it is not required for this platform.


>=20
> > +
> > +static const struct drm_bridge_funcs rzg3l_lvds_bridge_ops =3D {
> > +	.attach =3D rzg3l_lvds_attach,
> > +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +	.atomic_enable =3D rzg3l_lvds_atomic_enable,
> > +	.atomic_disable =3D rzg3l_lvds_atomic_disable,
> > +	.mode_valid =3D rzg3l_lvds_bridge_mode_valid, };
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Power Management
> > + */
> > +
> > +static int rzg3l_lvds_pm_runtime_suspend(struct device *dev) {
> > +	struct rzg3l_lvds *lvds =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret =3D reset_control_assert(lvds->lvd_rstc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D reset_control_assert(lvds->prstc);
> > +	if (ret)
> > +		goto err_deassert_lvd_rstc;
> > +
> > +	return 0;
> > +
> > +err_deassert_lvd_rstc:
> > +	reset_control_deassert(lvds->lvd_rstc);
> > +	return ret;
> > +}
> > +
> > +static int rzg3l_lvds_pm_runtime_resume(struct device *dev) {
> > +	struct rzg3l_lvds *lvds =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret =3D reset_control_deassert(lvds->prstc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return reset_control_deassert(lvds->lvd_rstc);
> > +	if (ret)
> > +		goto err_assert_prstc;
> > +
> > +	return 0;
> > +
> > +err_assert_prstc:
> > +	reset_control_assert(lvds->prstc);
> > +	return ret;
> > +}
> > +
> > +static const struct dev_pm_ops rzg3l_lvds_pm_ops =3D {
> > +	RUNTIME_PM_OPS(rzg3l_lvds_pm_runtime_suspend,
> > +		       rzg3l_lvds_pm_runtime_resume, NULL)
> > +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +pm_runtime_force_resume) };
>=20
> DEFINE_RUNTIME_DEV_PM_OPS()

OK. Will send v2 with the above changes.

Cheers,
Biju

