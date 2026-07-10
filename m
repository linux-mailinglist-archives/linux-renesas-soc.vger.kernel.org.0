Return-Path: <linux-renesas-soc+bounces-35017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IJuNK3O4UGr73wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:16:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E77738EEF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:16:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=BKzTJk+h;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67271301B718
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 08:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C263C2BA4;
	Fri, 10 Jul 2026 08:55:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3165C3A8FEE;
	Fri, 10 Jul 2026 08:55:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673707; cv=fail; b=FHT2LL1Lxb7rV9BSSPtwgn1V0BC/ru49N7P/RoW6VuNYWJfdNgY3gf/RGda9TDa19Zavnxa0S7zT6+98lCx2DuS/OIfIaVZbEjv8UjQFgTRg7OcQOxARnXTUVIM0id3XD+ai5itdGEwe9lZkVgF140tGhU+XvuNV9kF4fWf5mlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673707; c=relaxed/simple;
	bh=gQHjGV6Xz2GcAZwtkRfeade0fWCAgN4y1ftm52iVsOA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VKAph9e24PCVoxzRxJ5ozDRSfOMBTXp/J1QF1iCZmdOj8+S6GE/RE8cUPZ5RljDT/KlLbiw2g3jV4Av0tRvj28cnlEPE+C+/IhVz9J+iBKgCwB7zQis0MEtK07agWu5CpG2Q36BtaQUOtm0wBncu+GivpOjUS0pRXF66CyADnTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BKzTJk+h; arc=fail smtp.client-ip=40.107.74.39
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OU0/hR0R8eti3sUBZBPDlHcuj+U11EJStMl9b/jLmoVCMlKh5bzpYobYdFjnvM5iY0ZauhpYzvb6sf4L4S5cdCzRHfTfO/Jz6WR2hRmjpDB7vA60HyZiAmLvliccTDCqv/e8kJX74eE5+36ArAiDRgntZ2qafcX6EdT4IE3NUTUi8D7lxTzawAdVqHLCdOgW3OTeb9umQBKdVQN9etZO6t4XTKkMK1FK4Gzw2qm8Kxiy/eQ0FFW8T6JT8KETCtCzv73lX9OLFmFjuqItlsJVxDAP2aH2pAjSnXExO53jT/rVYbNFJzniBPO2FZVF9GF3xtavMKaIYIZBPeHz3MK7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0GwUHPtDKE+rym5uyxIZxM0pRHRTt99cnNBtDoLLgA=;
 b=NHVzDqnNeGyHkIZ/VKHGzTnY3J1bwJcVJx6C0eo3oVEktStHE+pSgN1PLU5stW2eLS3D2LePE6R9kTwSE3pa//de8k6FsBw14jbqareTWtiIwKv2dGR1Jj0psQ+T0nsPN7M5ub3bqSG/X6UN8frpiLMQFq8nGp3O+aq4tR1nLxOGAiiqIcr36PjINu+EK46LT6DM4X6znCDdq17xZDaRF66eGm4wCpQoBdWlKHxFkAPib0auLDlMqqlET1nvEPp86i+yWvF7ZEgO2WTTpD9PYAG0+kMo/ivR3CQkrPAFmrAxW/RCh3qt0F77gL7uw9LzRQNRILQe9m90cx7qyj9HjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0GwUHPtDKE+rym5uyxIZxM0pRHRTt99cnNBtDoLLgA=;
 b=BKzTJk+hhmeLT6ixUortH83fZ3TVGGMt3yMrTJ7npOyNa/B1hFZjuJHr3x0COcqs4ivKQXKsurSVSwpfGHUlYuZ9Xyy9L7kJottAeM+ZPxMC2TMo5Qvz/fDzg0A0kqrUIwHYHYa30uevTQJTic8mPrXNiZySKdH+b788jIGw2bw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB16355.jpnprd01.prod.outlook.com (2603:1096:604:2bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 08:55:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Fri, 10 Jul 2026
 08:55:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v19 09/12] mmc: renesas_sdhi: Save and restore IOVS across
 suspend/resume
Thread-Topic: [PATCH v19 09/12] mmc: renesas_sdhi: Save and restore IOVS
 across suspend/resume
Thread-Index: AQHdD9lENaOIqYgnbUS4eGCnwH/OL7Zmc3+Q
Date: Fri, 10 Jul 2026 08:55:03 +0000
Message-ID:
 <TY3PR01MB113462EB460505037C4B7FCC786FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
 <20260709192916.630794-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260709192916.630794-10-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB16355:EE_
x-ms-office365-filtering-correlation-id: fc5a4b72-d6fd-4952-571b-08dede60eea0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 PrzETq5JyxnayE2ClryE/d8MfaDelVU7170DTUrismjVIg4wBVlpKerI3LHZddTh4Pnu6/j0zNEooDVwbGE1/BTOlbrFDjYeMVnOa2164tXpJgsqfST0l4D9nluR1rDKxx9mACawFbl0zRk9aq19nhffY3s/eILkckaY5aYLiVBOBFO5cjygfXO9oiU9mClsiEErr7hIYt6zgxLi2tPVD+o0dNLHC4PAs0knqlMTZewcDw5XM0IO/5gjxub548qJkTC+ED7T1hZouyBOP+Dqfw5Cr4XTsYbOZArfYTDCln0+Hzc9PIwjW1EC8gaNFhhodpD8VaucXiYE19trQ9dRfjuDmfn/27rNDIQLcSzwlzyXrAYkmVPTot7WLkCCgZqwgTAMbPwmEG8E3uULTq7mS2LUuW10uqTymtnMg9rmdRVqO+qSY3t3yL6cVWHWsZn8um/CN6MQ8iyK5qDi1Ae63WkoDZpn/ccnSlHN9HXbA5cGaJU4Nql/dSFzc+codpifau9tBirGQq1ym9fVvo5w3sXosOweqoTiXEIm097Aw+kzuR1Olnhm8g8SWZ7XNlvOPzMuDqwmj5u9qEfdX5/0XaK+lBSugTLEMlX+RZ1kzwkT9e1K56mVsxq33Ssgba/8YsMsJBzfDMKJr7aYwGW8BE3wvdgY69d8rJtfwSX+WBw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xh39pifZ81meBSO3KOzpNdF2+D+sGFxKyE21SeAIgjRPz1C3koSB01FCZ1Jt?=
 =?us-ascii?Q?a5iSqiF6bfyw8WtTYrZwxdRyfFokCYAPq4I15FXCAdxHWKfYrWkZuiNLTCrS?=
 =?us-ascii?Q?k2QOLWglkk1LcBayR6jyLOPhf62ePRmOTPht6D5tleVYHvmuNT+P+rVONJ5r?=
 =?us-ascii?Q?vcMUQvKQ4N6ba8IbB9Vh2A6U6ZxAoQtjzsCBpLnbNBusIbHL+m4tmvDlwKaW?=
 =?us-ascii?Q?KIXJ3gbhMXZjZeAJGm0MkjOxBuRIW+32PJRaapudpB+49MtssveGXLuTDfYG?=
 =?us-ascii?Q?2sR1vdKGOl4vO2PpBTBgifVAihJCgAAwViuvKBCiEP/hk3byhiK3yHuFxiON?=
 =?us-ascii?Q?2TOWfxo9Hnjk9cNzuEuVQh76xV+urHCVIb3WEu6DERLuPfej9Hdmm+mC79x8?=
 =?us-ascii?Q?2NfGGy6qb5r4u4gHJIgyRJbE2n0z+fgEBbYMGoU9BmNjo4QeExtl4wwJ9i8e?=
 =?us-ascii?Q?pbnRpdPLtoZ+Te5jHz21gS2MUSirdKvCBtxXquVtR6RjWYUXpPvXPCNb74N6?=
 =?us-ascii?Q?aN2ln3EL9EMxz3nsANwM9sQnuhGuATwV6/MOI/vx9D9IMEA/fle3BdC3l1+h?=
 =?us-ascii?Q?fFNX0QoRGZPtGKcBFERoNXY6vw0WUejW8ej4gfDm9vNHLtnl+2R+fCnrk/d/?=
 =?us-ascii?Q?jeSWZNr15IrCSzOFDisr8g1jYfTyPCzfqo67O8uKMtGzvcCEBvyfjPNMIR+2?=
 =?us-ascii?Q?OPZuFxViIdIVhnLGH7h/lzPZmcA2p1e0ODPw7uZyPXmsFR8/7r7aMDuEVtw0?=
 =?us-ascii?Q?gwv3EK6WMityNErQDL44c2jylqj/sKk+wVEKvlWcN4sOqZjt76pG0sDM83C+?=
 =?us-ascii?Q?GqgJ6A8/NmnBWq3HEqBF6BRwWxP3bnH+1sKBUG5M+VIM0gCtNpRsio/Qa2oe?=
 =?us-ascii?Q?/irjr4rojq/+6uu4AK1KEBPJ+NAhybb53XsyPPYd1qZbfw1gaRKN5hNGMgkY?=
 =?us-ascii?Q?8jfXek9p8wT3/SEppRc2drh9oA0NQyfGTND9GpLDIXAgI/EE4owprYoWddzp?=
 =?us-ascii?Q?jCJ/iUrhcu0Bhui1Z1LJx6cKVPsSUkEMYQ7KuzttY1PY9cKtUpBU+YSEIiIw?=
 =?us-ascii?Q?oVLDw3gEJHZuUv9T8WeJFm053cIuyQtREuJviDpicx9U5HNB1YYIiGBzIw/m?=
 =?us-ascii?Q?saUL3yCPsNOBaKW7rpd0uBnlXrQ23ACAgM2cJdFF3t2FWCJ1HSNQkNQnzMkU?=
 =?us-ascii?Q?mdveMq5BfarzJEI3pyPRxpIHYziVEpXObNzLCP3UHBh4u7Yk2gYQH53oNSI/?=
 =?us-ascii?Q?h5Lgb6+XNYF8s2QMUlORXXfS1UDlMun7XAKoWJNnRFiLaySgxRch9KnDfXln?=
 =?us-ascii?Q?npwins1UJA3Gtz2hAbhImNl3IFHAv57lGAatnEptRwHDxAAJYo6Dg4lvPJNL?=
 =?us-ascii?Q?6HTAHtmU3V+zVE94C0D27PijMMGgQ74qUMBAiaIMEsnaRvTlXEdYgCUvQg6k?=
 =?us-ascii?Q?icg6N/lWac3aGIf+Z3TM8FQ4eyrsYAp8pQzHaf4mXKqkIbpzv56DhEvMjfEV?=
 =?us-ascii?Q?rSJ1VjJ15P2vFeA4PWFMGdrhN3bGMzM7GOiRkibZsi90s0/bjCm10ivKLBe8?=
 =?us-ascii?Q?vsgd6Q+PzRp/1cAShSThVKvC7J35PaIWASgOyMnP8e4kjGTDj0Ch1LIon4mN?=
 =?us-ascii?Q?FLDJEkUrwJFZwKzqf/LB2R/sF5Au3h0x6ibfZL1bomirFYpLQ8jxppKHIWGF?=
 =?us-ascii?Q?fhQDTAk7gMJg3buKsCOqCz/xNzlRvlwFYEOagRjCfZ/xhX6I/M2XLb+lefrH?=
 =?us-ascii?Q?ZYRJllrg/w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5a4b72-d6fd-4952-571b-08dede60eea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 08:55:03.4573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C4XvStYj2oxvMmacez5T+/b3dRyJCoOSYrJRIpSej5Nw8yVNwtfUvgbcn496KUgIgyLrntYc0Wpqs8jegfo5CY68MM8nT6SWZWSPd0Hh8pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16355
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
	TAGGED_FROM(0.00)[bounces-35017-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,sang-engineering.com,kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim,vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2E77738EEF

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 09 July 2026 20:29
> Subject: [PATCH v19 09/12] mmc: renesas_sdhi: Save and restore IOVS acros=
s suspend/resume
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, i=
s not automatically restored
> after a suspend/resume cycle, causing the regulator to report an incorrec=
t voltage on resume.
>=20
> Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi =
private struct at suspend time
> and writing it back during resume. The save/restore is only performed whe=
n a regulator device (rdev) is
> present, as the IOVS bit is only relevant in that context.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18->v19:
>  * Updated suspend/resume with scoped runtime calls in suspend.
> v17->v18:
>  * No change.
> v1->v17:
>  * No change.
> ---
>  drivers/mmc/host/renesas_sdhi.h      |  2 ++
>  drivers/mmc/host/renesas_sdhi_core.c | 11 +++++++++++
>  2 files changed, 13 insertions(+)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h index
> d46598190004..39d915da6f38 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -104,6 +104,8 @@ struct renesas_sdhi {
>  	struct reset_control *rstc_axim;
>  	struct tmio_mmc_host *host;
>  	struct regulator_dev *rdev;
> +
> +	u32 cache_sd_status;
>  };
>=20
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index c4908c09d89d..cec703122b22 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1400,6 +1400,15 @@ int renesas_sdhi_suspend(struct device *dev)
>  	};
>  	int ret;
>=20
> +	if (priv->rdev) {
> +		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
> +		ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +		if (ret < 0)
> +			return ret;
> +
> +		priv->cache_sd_status =3D sd_ctrl_read32(host, CTL_SD_STATUS);
> +	}
> +
>  	ret =3D pm_runtime_force_suspend(dev);
>  	if (ret)
>  		return ret;
> @@ -1430,6 +1439,8 @@ int renesas_sdhi_resume(struct device *dev)
>  	ret =3D pm_runtime_force_resume(dev);
>  	if (ret)
>  		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
> +	else if (priv->rdev)
> +		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);

Will add scoped PM to handle the issue mentioned by sashiko [1]

https://sashiko.dev/#/patchset/20260709192916.630794-1-biju.das.jz%40bp.ren=
esas.com

Cheers,
Biju

>=20
>  	return ret;
>  }
> --
> 2.43.0


