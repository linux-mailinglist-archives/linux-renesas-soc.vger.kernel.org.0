Return-Path: <linux-renesas-soc+bounces-34976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mh6uNIzMT2oYogIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 18:30:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C787733787
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 18:30:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=lTpk1ht5;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF9F6304E319
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 16:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA31414A23;
	Thu,  9 Jul 2026 16:24:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010023.outbound.protection.outlook.com [52.101.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1947416D15;
	Thu,  9 Jul 2026 16:24:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614276; cv=fail; b=f0OY4Cf/YLti3M27RSqyVOPvgdVotcwOs1h+1/Apt8VGG8DRo6DR4AV1j68UcKVGp6Z7ClBkAoMzX//45ThSqjjTu7Euj69Pg++dh+5n8esFQbgROj/355A+ZO/22ONuNuptkya0RJG/5d2CamqYHU3sa4Oi61mE6wPQLOTwvcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614276; c=relaxed/simple;
	bh=7V4j690yZK6J7H7C3jBsgT+jhQqmRsUtQjjMxD8AuHQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nHGMMCyfmX2j69rbo2hlAQpQaaMxYwWB0630W3e/dtYEewK+YR6TUcO1IssDPjetN5OprDq2ef+idePnGzFmi1V5s8wuiuKrEOhjRq20BlkuCGIa03r0OrlAOKYq70N0LUEK1wVbvvF+z9zxcQ0pCooOtOSv6kwDSIOGVnQErEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lTpk1ht5; arc=fail smtp.client-ip=52.101.229.23
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgzxZswpDHZJk4gBSDOSYaDTc5/j++8wrL0VCOQ2+QVb84F+ABn+cCAhfLCm/u4vNYTaXVcVNKSdrGoGWNRKxVL3cO5YP6FjU9Smo4EtOEptCcio9bsslYOsmGdGhyrRqa6W76vsuuTdqVtoK3uOgSlJGaFVDdQow/AefI1e+bqphXDVNmLlr9GQQiykUKysSr+oH9ocz1oTASGpU9XMIzEdjbeMxUZLM0koRcE1NWfNL6FbCmLut9yhvmoW7A3H36keNFwsKDWxLbQ9272GcEKj/oChgo38vF8KJvZORmZUleK25tEyeJQTki3FI1j1TjC1aVoaBModNv3iih/UmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOijpU89bEcpSffQaS+jSTUIxgf3ZnHjumKfA2F1ZlQ=;
 b=iGA8tjmTgNRDGl14sylfrvD+qfsXjvKeqfPnkCb91brSgB3utgLILlxV8oKDeOBW0IymB5wof0hlaoLXaAbzl4BhYb+Wu+5JoAvRQH6Sl9j9PHg4nQ7pwkzRIrxYjcdfzGlg9OSYjq+k3g7LsGsRIHrPQJhpuP9chRxU5956ZfSGqPvyN7GcW7FiZ8YQTrRsy/RzjqEfQMiqDULS6CzftiDwKTkOynFxCwKtD4XoL+FpFSbnBXjdTNh1VckmtoqdKQMftf7EyZTmR9Ygi+FTsz7Xl85H70p34aCnu96R6kU494ZV+Ny8eNxi7iOfnFiAtoieyie86jFoKUY3OSAkYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOijpU89bEcpSffQaS+jSTUIxgf3ZnHjumKfA2F1ZlQ=;
 b=lTpk1ht5yUj7fk+iKtZXUQsLUXUyVrnWaNaD+lnf63r7lCWq1dNSkTK+mT+i4R9HwFqBKTIGBnia3Yi1UJdrlVpK9Buv44vZ0jEhZdCr7Rz4Pg9Q8Kx6rgqaLeIDTGizE8JKa7i9FkRWTHjEKTzAIeQCX2uB7F12gbZjlINshsQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB6944.jpnprd01.prod.outlook.com (2603:1096:400:d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 16:24:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 16:24:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>, magnus.damm <magnus.damm@gmail.com>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v18 00/12] Add Renesas RZ/G3L SD/eMMC support
Thread-Topic: [PATCH v18 00/12] Add Renesas RZ/G3L SD/eMMC support
Thread-Index: AQHdAl+r4yj1HERfHk6QPePkoaHOOLZleakw
Date: Thu, 9 Jul 2026 16:24:26 +0000
Message-ID:
 <TY3PR01MB113462BB275A7939C5A82CCB586FE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB6944:EE_
x-ms-office365-filtering-correlation-id: 83958412-0721-469d-d10e-08deddd68b92
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|11063799006|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 rV+4lFYzaO0dbRsxTZThmHS9+IomQQQfaotvgsQEc1RWKJPNzjfvY47hoRKY4EhfpABdNIhubjG52diYH0iqJtxcGoUa7dHqWoevB8CBRBaTpXJL8/E8iqKRi2jlv7K4VFkiDKPjB8jfv68Zeqk2bjfRiY3cbiKmaqjQ74TxhCyfuARxJEqOIhth4VNOBawH4Wyc9GtiJ/oP+ZKdG2OEG1vblSYyMU89vUJaL5NJDbA67VlMCXkggj8pElYm9GcHcf612QFiVscFtetNgZUGiK43S/w6lwwCguuQWaEUzxFhjrWAZUefpsiN4MeT/eZJRRaMEuZ0TjJg+24hBla66rnBwzB2f2b2NgeFwHLg3M0Pi1ObMGy/OV5VyaD5ROhyBP7Vp+4KJq2ulfeWdlhvgm46JbDgI5s8LY+9IYodX5mavDgccFMDwej93Svv8y7DugLdm4I0ZSNW8WJsZrHSGie6a2Hi9O+78vsTCAQSU2P1yRqi5H12zkd4Le8OMWOk2qMjhMqO2e4EWrXF9S9tYm+RLy1sLWB+9Vzh3SWb6RzlO6tCD5Mxr/i3utR7Vj6ufEw7H8b6gnbPK3fsqCFrEiPuLMLSd5TiyUnWPRHEJngwf43rcaMvaEE/rzxgZzFmeOKz0OtK0LSdCZxBLrIf6VMWnVOyHjOOAJg0Gx49cjZXsLR+aQNih2h6g02dNjbrL35VsQzVjI6fIGqkJQaxz63sRD2QaMxkgLV/9CaQbXw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dG0OP5u59kKtw6NGdN66hMWOPxCiDvTcPWnNIvImIUadjc4mFK+jzDKgXzFo?=
 =?us-ascii?Q?jfm2sETIcp7gvkWrtZRR2gGrhHpBh02OEW8CRNx3ZHWSKJB68Y3PR96Ii3Jx?=
 =?us-ascii?Q?klXejYBpq9AQe4Am2FAqdkAD1ejkHmJ+uD5//M3CLlxO1kVtvIxXHswrUYcS?=
 =?us-ascii?Q?8wtkUexLG1ObjgAaMO8JCNBj9tGcQ+CMFeVIoXQwl0VA8IGjA+mHTSlzzd+G?=
 =?us-ascii?Q?OAcpqx4Q9OUmyI6+4hfyal5NfguukJFI/PI35fk5fpFE+3U4diiv9L6ZAmpL?=
 =?us-ascii?Q?jgoIhNhoNdEW/aRKi9m7bYZBt9KcaLxsP8CfYvYPSUNkIsSYS/85mXv6FbCv?=
 =?us-ascii?Q?IU6jEEkmy44UY/EBCUIHT/WW4cBVvvG/srnNKVSKTzo0Sm0YHum9sznmK+lC?=
 =?us-ascii?Q?OZl37RkCsPUkBOz/DN/RkI07v+X2oOW+EMRbFwm1fNzDb8Tn5CNuUKfy+GRI?=
 =?us-ascii?Q?qVDjz80qWfQxShRdbHOwx8SdtjHTcsU0MmVhonCCcEK7HaHMgwdcAaYJILd3?=
 =?us-ascii?Q?05D8bL68hIqo5wAnhDfTNiP1KJv5/tKseWi4CCYV0H21fT3a1CKmTBysgib6?=
 =?us-ascii?Q?8+h3JqKEobReeAzAijCQrDKNsF0l9kLf2P3mz6T8bPsio2OnTvU0pE1SzA6K?=
 =?us-ascii?Q?+Y5izU4R8jA9eWXT9rsGhRMvCabuB7OVXIFZ8ly98ciF35j2jmlRf4Vwvti+?=
 =?us-ascii?Q?DkDUkB67T1ygHbalveBX5gXZNcFhhUBdcKtKPZAcRIvJW70STgDksRXHNSQe?=
 =?us-ascii?Q?+xEPIWMQrHEO4WTpGCnD+U4sv+7R5rzxtDsbgxaPHueG/uJOE4+ICIBSq0Bx?=
 =?us-ascii?Q?iSOVZtuCMJzQbirEl61GMyyFjyLNit+cPaCzqmZPlSr0Ezq7ATvOPTArPpMY?=
 =?us-ascii?Q?ZT8SH9f7Y7rc4Gk1tgBv2H9P/ZRB00B4OvFB5xA4I4e/uCxB/A2Kt13XRjPP?=
 =?us-ascii?Q?+J6RpJDmw7exmLmnLV7UIWQLDUqrmLbdB8eJk6V8glapnSSVUx748TaKNuFP?=
 =?us-ascii?Q?MuJxbe8cRJX/BScmFy7PJVKcm/GvfwQIwgIiiAgWBPfYW9mDCOqaMqNNg9Eg?=
 =?us-ascii?Q?KEE87/QY94AG93AF8Vo1g1QnegNSa6a7uji5QGEP9iVzx7VyUBJppsoRYM7t?=
 =?us-ascii?Q?MNXVjxIxLy4iGXhG8H3DGy1ZxtDz4nWLP0f79tyg7fAIBdYgElNqdCCwGeSE?=
 =?us-ascii?Q?LY18+4w9oBRiUz6nUbHfblg6u+MbdRubwSuugwqlVJDjNfCoQkreWn4yANgN?=
 =?us-ascii?Q?ha0E4mcJ3aVRryda4AiFrL+OWOinp+W5nt3j2Mljea3n7feWQ66rssVtL5aR?=
 =?us-ascii?Q?9aD24N1Urs1gVIEyMsY2h8hQmJE0YtBw5PG4xKNoPPYHax8Iw18QL9El9Jo3?=
 =?us-ascii?Q?rMyO5Se1GNeHK1bMuITmyRNqC8EEOe1GvAmoDWQ9Z0ravuy0D84RHfjSTqHK?=
 =?us-ascii?Q?obPsNQszu1k+Na+dq29KtDfvM3ufKdtMEI1XW4PcqDoZhwENEqy6bkzyLPW9?=
 =?us-ascii?Q?bD4TZm0elylstoY6Qrt0dfGSu0Bf1yoDqae4g5nKn0t7qTiUjtQZIyNCkT4q?=
 =?us-ascii?Q?JU1eh3EPisLILHmUiAF/4ab8ZOjMg81h2iTP6jr15TWpSzGkNZezjq+ym9nZ?=
 =?us-ascii?Q?QndtaQ9VlJIAoUZHoLHLYxwioO5yxuGdaFhs5haHdguZX095Utled3G29ayb?=
 =?us-ascii?Q?pLUH/25/jVqVG6MY6WLKtYIOt5dFIqPxttnJ5eTaunfQGT2H/DUgnbWNiROT?=
 =?us-ascii?Q?9knN9FTMsw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 83958412-0721-469d-d10e-08deddd68b92
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 16:24:26.6953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X0or/Qwl4CwgXYDIzyuva41Y/Pcm4N6wsLFTbNPGCI4ewLadsk6p4OxlInc7pcogZdYEU5gLPz42YhQfKF6/cdRH39MtHbt3pu1ePaV23iU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6944
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34976-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:p.zabel@pengutronix.de,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,glider.be,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[sang-engineering.com,vger.kernel.org,bp.renesas.com,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C787733787

Hi Wolfram,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 22 June 2026 16:56
> Subject: [PATCH v18 00/12] Add Renesas RZ/G3L SD/eMMC support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> RZ/G3L SoC has:
>=20
> Channel 0 supports SD and eMMC (including HS400/HS400ES).
> Channel 1 supports SD and eMMC (except for HS400).
> Channel 2 supports SD.
>=20
> The SoC supports a maximum frequency of 150 MHz. The SD0 interface does n=
ot support IOVS and PWEN in the
> SDHI register (no internal regulator), unlike SD1 and SD2. It has an inte=
rnal divider for all modes
> except HS400.
> It also has a 2048-bit divider compared to 512 on others. Moreover RZ/G3L=
 supports HS400 enhanced strobe
> mode.

I will be sending an improved version of the patch series that
Handles clock divider correctly.

Cheers,
Biju

>=20
> v17->v18:
>  * Collected tag
>  * Merged patch #4 and #5 and updated commit description
>  * Annotated the empty sentinel entries in the OF match tables with a
>    "Sentinel." comment for clarity.
>  * Retained the tag as it is a trivial cleanup.
>  * New patches drop struct renesas_sdhi_hw_info, instead using
>    renesas_sdhi_of_data and tmio_mmc_data.
>  * Dropped clk, pinctrl, SoC, and board dtsi from this patch series;
>    will send later.
> v1->v17:
>  * Collected tag for binding patch.
>  * Resending the series as there is an issue with patch threading from
>    patch #14.
>=20
> Biju Das (12):
>   dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
>   mmc: renesas_sdhi: Fix whitespace alignment in struct
>     renesas_sdhi_of_data
>   mmc: renesas_sdhi: Add clk_mask field to support SoC-specific clock
>     divider widths
>   mmc: renesas_sdhi: Add max_divider field to support SoC-specific clock
>     divider ranges
>   mmc: renesas_sdhi: Add tuning delay support for RZ/G2L
>   mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
>   mmc: renesas_sdhi: Add optional axis/axim reset controls
>   mmc: renesas_sdhi: Add RZ/G3L SDHI support
>   mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
>   mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
>   mmc: renesas_sdhi: Add RZ/G3L HS400 support
>   mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L
>=20
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 101 ++++++--
>  drivers/mmc/host/renesas_sdhi.h               |  12 +-
>  drivers/mmc/host/renesas_sdhi_core.c          | 239 ++++++++++++++----
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  73 +++++-
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  12 +-
>  include/linux/platform_data/tmio.h            |  18 ++
>  6 files changed, 370 insertions(+), 85 deletions(-)
>=20
> --
> 2.43.0


