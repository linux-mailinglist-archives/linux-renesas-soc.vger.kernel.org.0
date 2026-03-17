Return-Path: <linux-renesas-soc+bounces-29610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBBREOBTuWnYAgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 14:15:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC272AAA66
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 14:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71F72304FA52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 13:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E9B3CAE94;
	Tue, 17 Mar 2026 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sRjPXvUG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCEC3A2558;
	Tue, 17 Mar 2026 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753306; cv=fail; b=t5lLeQguqtky10MdcdQRNN0U3i8rQEO+OMg8uTdRy5EIPTyWd8z8tM4eByx870zS4So2CuBgQUqJ0ZWyetbi9EzXVsiFtMiD2hpyteeEKA2dokAAvPN6vDnHhZ8ISmmQLWqZ+B+ihEDIEeNxd76c4QWHfWQrDqbXP0cYC2Ay+gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753306; c=relaxed/simple;
	bh=DOptUqnyE94cP8jyit2m8+D5K6/sE2e194XX7ENvvLk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ceX8Veep+2l4QfxL1VFR6r5DcD8+GZiq8eugs9cMI6vUS4SWI3DKcZDAjwiRq+8Wm0o6tSqgCW/QYyJIeY258kWquPgDvLxIH9be0g5ruRLHlkeZBM15fXiLmEqllAyELrTUYWsvD5K/cGcxIVKkdBcU5HO4WLZeoiV5Dx6awzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sRjPXvUG; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abOVKh1xzHMww5KZb9gCQJ2NUsfHtlgVYbNEHl4qO0W2iHFUd+Uv+Mn3WgoDbi5HrWJ/kYSXH6vjnh5ZrxvRfjMnk3XLDfscPHgyMY002KS3k1e22A6g1F/V8h3xz5cczacb0Y3jpNia8enr4fh+Z+5AF9XufNTI6KTFiGNbPlVpEghWLL8po4dY0y2AvjSa8FHwFE0BvPDxkPkKuTit1XOUt8HKIel7Usmuhzp+CnaR1vL5A5OmBZX9sg6QAi6HTPTR6fhUvb/Tebp5MKgWP8HtH4by2bhw1ryzBcoBh3N2YqN86YRWUEA9ur8/5Y/SUps0nUFyAEI0abGhad2WJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amEP2L3diy7YeLCw5QRxfNr8zqYKmOA03GWFDSH78ik=;
 b=AIWYl9/29gyu0Uktm4QwTbE3qV6WR1yjA3zCz5A0e2jY48cAXJ2Fd7wq3f28xeGrYpVktQAcsBooilmuALYd+BhOSDnRyknZCgr3Ew91jpDEcoB5ATG7Jga5yu75SEbYbnn/6hBO9YHG9B07U5O14zWtLJQryIloJudoClXZ1EehFg5R3C8vpQdOF3AFzKgeSjlz1YzOXjS1s5howSrx4HMokmGYrPU8GogQ2upIH5UBVVstVXTJhsTXU+ekXJyekU7KLjUyEB7nxkzWpo6P3bZ4EYuitsZsgIDuMzebAhniJHmLCQmIaTGOSmzGUGvS8om+GVQHQrQH340cA+Zo3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amEP2L3diy7YeLCw5QRxfNr8zqYKmOA03GWFDSH78ik=;
 b=sRjPXvUG6oOGwRA5MtjfVfjvBv6exvXUheXnp/JAps/vBsZArS9pJZZJHVsCznuUuP81IE9HcZg02spwcjxjOTx6jVjL6sKTChljuWX8D02f7kLne1JJGQx3/4HxMynbUTIJ31QcC+xBXioCD+bpB7yFhvoJgqqyjufrgnhAhsw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB16869.jpnprd01.prod.outlook.com (2603:1096:405:32e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 13:14:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 13:15:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v5 13/20] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/G3E
Thread-Topic: [PATCH v5 13/20] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/G3E
Thread-Index: AQHcnQYDtTYUj4TTWU6S6a6y0yNfpLWy42lQ
Date: Tue, 17 Mar 2026 13:15:00 +0000
Message-ID:
 <TY3PR01MB11346EF4EB15DF35FAB5F57CF8641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <6f626ada15c58d15daac33a7d111bf06f5ee034e.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To:
 <6f626ada15c58d15daac33a7d111bf06f5ee034e.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB16869:EE_
x-ms-office365-filtering-correlation-id: 1cfa9759-afc8-4026-c8b3-08de842731eb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 X/onYbFxX+G24FUqy1KlN5ypSqA56ZmY5bpPh9WASqnCDBpWgMpDuF6J3vsePX6jaQpkx8UpwZAe8M/nSsiEE5YM33mkeNEdKtzWorQ1jZFXti74cfdDgbAskLX6DAksG3WjyCcJ66AU9u3egsZd6JIzq+gdePrAtUH3EP3KuVe/OrITp8s5Zbt/bhHbX0N5+4f/umr7Ph+YOuxGw5OiBuGxVd+l4KZfavIa86k4HOn8VvskhkAl6nPbNM2Aw6SMYzEAFsgJWRBBLMEks+5eVIeQaCSNbqrLuXrGMN97+5QQ/iTH94a94CP1TAHdYv2W80RVzTV7LRVbxfYsCJx6ys+B2v7WOBoZOZeEN1LR+9bXFBlqJgLIDxTSfKHn3m+9uUWnQhtxZj4WJ61Ste5Uaf452blh9i1kvjnVog1mwxq+6GR8NoomSnfNZRHDnkJjrOmTx+GC9SdtNQD7mT/M6b195x8h3YsQPFeXmFjNXSZHH8Cd+Jh2TN/N5Y5UxF6ZrjIJX1k0Hl9fMUstwphrMmQIAjDcg9uENHY8ASdh+JTyCyRjd6TPG415+R7m8ygFWw5C3BGkx4zhSjTq8agmvbtDc9Rzj77/vpptkTuVki69uwqsZDR6dG7mE8v/DTW4yYX9SbPVJ9oPfGRDsaujBSgTPwAPSuP4J7lsQ0CUAP+1E1/pwhyJxjyKE8Q1pALb48ublL33np55qlRnedPEaGH2qUZ1MBoHjeyOxU3dvznKBM36OebtXsGv7xMujmmxNuxRBiUAfXzSePOKJGOTA8v9T/kzsxC1EB0m51Ib7uU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BkZHTYKoK6s5ov6rNn6ZstZfSXccmW7knAD9kxz4uBOM/cbToJynnBMoS1UE?=
 =?us-ascii?Q?WHeO7DiE8i1aR8AfjY5KCuOdvDQgpevE7WNN91AHTOEL2QBsM1h1nbW9Ecw5?=
 =?us-ascii?Q?pKhqJus7tN3y+op0NnUTqNAn3+UjC9I/erfl/d7llxkiNF1qVVo5DVcamMCz?=
 =?us-ascii?Q?rc0ykECegDDIdQ8xZc4Z1Ykdfnek02sxqm/GnktuizjD17U7oymnenLzwwHa?=
 =?us-ascii?Q?hs2pqm4iQwggxaCiHk8qYw4p3Zby2isptc9oY04Ibn9nqwyD07iHaSqPWoRx?=
 =?us-ascii?Q?41GO0ooYjrGhzOsbAymTBY9K71Zt5UTLXfBO6nGCFc1tOYgdgFCEeg8dEQHB?=
 =?us-ascii?Q?K8aWOfyt1n7K7HHY60PiKGKd4bKUkDiRCKF/hPnkrQpfapZJl22WH9hdn+9o?=
 =?us-ascii?Q?+l5mm8Hr6EbnIrA5yqPi9frc6V4Ngbr3ZZKIuqiqDb6Fs2VNfY2gexmu+jjT?=
 =?us-ascii?Q?Hnsg7z3RKebFVCeG/nVfVMdxIJ2wzI198E7P3wloJnPPNiykUp9cOggIuVIs?=
 =?us-ascii?Q?GkdncjQkvZnVyAXia5/ORa0PKS8PCPqrasHZwbEUmI835MazswOUeEeEeEVF?=
 =?us-ascii?Q?WMo0tPN6cf6IHJDuNeNZVgmjjspXllxsLPLrA2gzaOBBqAfMQPIeMR/qrhWE?=
 =?us-ascii?Q?AREvJU3676RJfo1zqf1oesS7mu6EfRJw7KlzwHh1gtFx+1dLTQdktJc8zLIL?=
 =?us-ascii?Q?84cdUIg9oOQrNmeJWDNqB1KeEcSweohUdPQNVu0fXOugs2s+butF/ZlHJCqY?=
 =?us-ascii?Q?Jad+P/lFEUBAVw+h5tPSxErPqfgolKPPHq2h2cFFvfJo2GlVL13+uTv3DSLR?=
 =?us-ascii?Q?cUDRqkCcpuXOIjYWL9f84X+wJGtZXWxkVmomxLCf3ej6AmtNI0yhWkLlKQIr?=
 =?us-ascii?Q?kTpeb0y3/rNjhfzsl1440qbxo5xDupT1ib/B9us9Fmxvhgl7thOchDhyeG7H?=
 =?us-ascii?Q?iP0WfCrD/A02JSrl/T3cerKtIEswS3gVlO3pZODzR7WlZIdvHDuBq/rjtSkN?=
 =?us-ascii?Q?O7f0JbzDmmcvSFSxlllYWqfgKDlG7fvmkmSqnnqQ9JF40yEbraVu1UQQlv3W?=
 =?us-ascii?Q?V3s5jvdgC6rxmcHNba5pfqY7dLgx9Vrrx39S97h+uPnZwzJHkvvZZZMoDDht?=
 =?us-ascii?Q?vHdnGfluzJYwG91zOonGuM7Xu/k+BAm67vuYdnWycNEW7VoUQE2xbBHn9pYY?=
 =?us-ascii?Q?xWhwzF4hvzJTuWb6I5gJn3rZpg1c9VOD3FSCZROONmhIZnbO8vk+mRhaRoe/?=
 =?us-ascii?Q?qsair+XzzUKTNnZ6xl8ffk8PGYbcAavpdFYtBE1ZrXWNcwzW4silCraFynMt?=
 =?us-ascii?Q?a3rw/cUnyda2ammgyD7IGI5UddQg1LqUnu8ffzdY0xNN4sXNraWcQFVi3i7B?=
 =?us-ascii?Q?Hb2JpusXvyJ2TOoSdGUUwN9Bwh8OJVtDsS9isGID2BbsT300OiLLbwl1PGEI?=
 =?us-ascii?Q?rk3zl3TqksIlvtBvpazxIHNkZLUfl23hFNeF5PkiONWBVf8NWktpFbCN0LAj?=
 =?us-ascii?Q?jz0HDjm8xiv6buCiIaR3bANcfPn0+S0mobI5S36zkXyeV+UNVn6EDqyoa8cX?=
 =?us-ascii?Q?947oKgEAZz9w/X+0z+TMvbiMrU5vO8K3Nti/EkyciCExcbflsL0OFeziRyXP?=
 =?us-ascii?Q?pO4FIbcZ9o/7APpBH45aA11xN7lUjaY6V76S9/UgjHhxyXRDthRbRddx48Z9?=
 =?us-ascii?Q?JiDO5//dZ3T6YPACYgE0yY4MnAwuZ5exzGvkBFnOxDLoR01i6EvPKpOADq7R?=
 =?us-ascii?Q?eIMmSh0jOw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfa9759-afc8-4026-c8b3-08de842731eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 13:15:00.8895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SZcWFBui0GEU53d1tlphBxT6+BTvcpJEKBQ7c/tMjpQm80PsK05KXWXTXiYuH9FCGoZvWpK2YUFmuJjTxQm7X3rCZvN6JOImG7/fj223A/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16869
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29610-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: AAC272AAA66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tommaso,

Thanks for the patch.

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 13 February 2026 16:28
> Subject: [PATCH v5 13/20] drm: renesas: rz-du: mipi_dsi: Add support for =
RZ/G3E
>=20
> Add MIPI DSI support for the Renesas RZ/G3E SoC.
>=20
> RZ/V2H(P) and RZ/G3E share identical PLLDSI divider constraints from the =
DSI PHY perspective, so both
> can reuse the existing rzv2h_plldsi_div_limits structure. However, at the=
 CPG level the limits
> differ:
>=20
>  - PLLDSI0 limits apply when vclk1 is used.
>  - PLLDSI1 limits apply when vclk2 is used.
>=20
> To support this introduce rzg3e_plldsis_limits for RZ/G3E SoC.
>=20
> During rzv2h_dphy_mode_clk_check(), the appropriate limits are selected d=
ynamically based on vclk_idx,
> which reflects the currently selected vclk.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> v4->v5:
>  - No changes.
>=20
> v3->v4:
>  - No changes.
>=20
> v2->v3:
>  - No changes.
>=20
> v1->v2:
>  - No changes.
>=20
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 33 ++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 35de1a964dc0..27901dafab9a 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -590,7 +590,7 @@ static unsigned int rzv2h_dphy_mode_clk_check(struct =
rzg2l_mipi_dsi *dsi,
>  	mode_freq_hz =3D mul_u32_u32(mode_freq, KILO);
>  	mode_freq_millihz =3D mode_freq_hz * MILLI;
>  	parameters_found =3D
> -		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[0],
> +		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[dsi->vclk_idx],
>  					&cpg_dsi_parameters,
>  					dsi->info->cpg_plldsi.table,
>  					dsi->info->cpg_plldsi.table_size,
> @@ -1539,6 +1539,36 @@ static void rzg2l_mipi_dsi_remove(struct platform_=
device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>=20
> +RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
> +RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
> +
> +static const struct rzv2h_pll_limits *rzg3e_plldsis_limits[] =3D {
> +	&rzg3e_cpg_pll_dsi0_limits,
> +	&rzg3e_cpg_pll_dsi1_limits,
> +};
> +
> +static const u8 rzg3e_cpg_div_table[] =3D {
> +	2, 4, 6, 8, 10, 12, 14, 16,
> +};
> +
> +static struct rzg2l_mipi_dsi_hw_info rzg3e_mipi_dsi_info =3D {
> +	.dphy_init =3D rzv2h_mipi_dsi_dphy_init,
> +	.dphy_startup_late_init =3D rzv2h_mipi_dsi_dphy_startup_late_init,
> +	.dphy_exit =3D rzv2h_mipi_dsi_dphy_exit,
> +	.dphy_mode_clk_check =3D rzv2h_dphy_mode_clk_check,
> +	.dphy_conf_clks =3D rzv2h_dphy_conf_clks,
> +	.cpg_plldsi.limits =3D rzg3e_plldsis_limits,
> +	.cpg_plldsi.table =3D rzg3e_cpg_div_table,
> +	.cpg_plldsi.table_size =3D ARRAY_SIZE(rzg3e_cpg_div_table),
> +	.phy_reg_offset =3D 0x10000,
> +	.link_reg_offset =3D 0,
> +	.min_dclk =3D 5440,
> +	.max_dclk =3D 187500,
> +	.out_port =3D 2,
> +	.features =3D RZ_MIPI_DSI_FEATURE_16BPP |
> +		    RZ_MIPI_DSI_FEATURE_GPO0R,
> +};
> +
>  RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
>=20
>  static const struct rzv2h_pll_limits *rzv2h_plldsi_limits[] =3D { @@ -15=
77,6 +1607,7 @@ static const
> struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {  };
>=20
>  static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> +	{ .compatible =3D "renesas,r9a09g047-mipi-dsi", .data =3D
> +&rzg3e_mipi_dsi_info, },
>  	{ .compatible =3D "renesas,r9a09g057-mipi-dsi", .data =3D &rzv2h_mipi_d=
si_info, },
>  	{ .compatible =3D "renesas,rzg2l-mipi-dsi", .data =3D &rzg2l_mipi_dsi_i=
nfo, },
>  	{ /* sentinel */ }
> --
> 2.43.0


