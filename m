Return-Path: <linux-renesas-soc+bounces-35218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QSFHIVxjVmpv4gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 18:27:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D8756EB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 18:27:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=qpLbBujV;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3FC23082CC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 16:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7BC4ADDAE;
	Tue, 14 Jul 2026 16:23:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D74D13AD1C;
	Tue, 14 Jul 2026 16:23:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046233; cv=fail; b=g30+T0dU0nlW4tVpg8K+nz9eUSlffeDy8jlCWqYlhGvrnar+LX3iyTpjzBCTbYatWnKWRTG5TBFryA1DX/b3ZmX2sS26jshDNtMTTYjvpeEd2b+RC9WhwoNWhHN5UQo6duZMSJ5LnL2Y8iT5KvX4Bw/wsx4jyfEQK3DR3z9mbag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046233; c=relaxed/simple;
	bh=obqY70XgfeoccP/Nrrcv712C4Qy8JaLfX6Pra1AtKL8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n7STkyIpfkNxjvK0fEYrtJI4MKt8QR8uyvQhnlScMh8tOYIrUGQ+JosqTncLBW5ErX2zOdpdbYwFWP7GZY8MfHnnmb2yFbZ5XyZOmGSBF5k+HErxYliDGMWdF72yWuckHaqhZsFPR5EksvTLm7ncYVBf8Rm78HCV9yg9ln03jM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qpLbBujV; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpH0Ln4RWpiJsBI2+1tUYie3GEVxiAXw2WeOA0v6/NVtMSE/GoAH4En6Nd7G1fSEruLMjU4T0aWMmUNGvwNUy6EDvlkILmz6wEULd4x2aj3v7SbxwctpNoaGYx//6lReTaZIivWB6JeJcan73a6ExHS/ZmXNvufgpL9y7NZs1vUXpAtMahcskNq2rHyU1jajasuJfX13NuwTTr/hgUEevoWgmrM1MAasDtn/Twc2J59hGkR6s/BKGdgoYrqj98nSFRs6gyJSZBz336/MdG6nxoJSvEZ3brnLPGJ8z92MkBBAEaTc825yRODue9c3laJplJC7GKT00LxVgQ422r8BFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRB3tgHaMOdu+Y9hfRJPpxlemCuq+8A1iXugjAx5wUo=;
 b=ig8ia9N+0yRwmLsdXQp4IsUXwW97M+2RIHRuwStFNRPZs7iKlZ50BInw3KP3QY8/RFQjzRIMyUBKR45ugSlejuwrkxu4Er38aavTxN0xfl9ufdPW+7bOCowVJsg++nrs61QznLFCqed8Q/CrXJvGwD4h8z1AC9cfiKLLTAJJI/h7qQcuP14SLgf6NptY/bb4NmgIxH8Dr+sSGibjl7sGIERHmResyKuiZgUMmXAKG6qUjDGC02TVE38CYN5Xfd7BQYGJQ7szTYGrLJax+xbeDHulbQ/djVQ8fkUxwK/gh3zmlnag2Tki7vC3buTJD5FGN0hELg66yhfSw9PNPCStWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRB3tgHaMOdu+Y9hfRJPpxlemCuq+8A1iXugjAx5wUo=;
 b=qpLbBujVPp2lmHEnKZlt2ziRkyD24sE3P+15rluJovfyQxL8DHz73pyjd0aHcHaZpVA97Ayu9OEb6/GwakqC8L+9kjOcVMAB7QZrUEBPYLVmYb1SUNQONqnwasNDrmvaJgQ74kdD2kjxxW8E7eBp374txNzXUs8bYYAcMT5+qgk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10054.jpnprd01.prod.outlook.com (2603:1096:400:1ea::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 16:23:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 16:23:47 +0000
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
Subject: RE: [PATCH v20 00/12] Add Renesas RZ/G3L SD/eMMC support
Thread-Topic: [PATCH v20 00/12] Add Renesas RZ/G3L SD/eMMC support
Thread-Index: AQHdEvBTpm2/T6tVwkGyyxXNgqGP6bZtKIiA
Date: Tue, 14 Jul 2026 16:23:47 +0000
Message-ID:
 <TY3PR01MB11346CC7C80D50549EB7C412C86F92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10054:EE_
x-ms-office365-filtering-correlation-id: 2c17b18e-8fe6-4678-1a3e-08dee1c4482f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|11063799006|6133799003|56012099006|4133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 m57NhtLDKL2NailpnRk9qJE7jHg2rG20FmFrSaNsCNUt1mndGuUranwkLpJqSvLAn1hMI1biEuRzTaxpcbLENuajAR13mMQUjPB0wWWzps9EgF5A0P5wynE3ZRtb3EUaSqiYQeZW1KXZmo2mPFitNBrzGgEcq7Tm9FqnApVbUoKndLlhsq/T1WeIhcVlHKeEUNTzRiZBpV9tIpkgFIJxDxnxBbtNMeXClnHZAi+ZsPZeSqiQwTelLN+0WN3rdYDkEzxT6z34IUscD1DjHo8YISqL40BobQYR6W0fZGDZqJQ+3Tpy0cnxAJImUteRtLFWCUjWn14kd9Pjh7olmmiKQUDhfxDxHz8LFOXnIcAundlivTdkq4No/ox4/U1SwmUn2d8ujOdTvxZdm4V63nKC1tiS50/EGzz77FbxU/DCpDVa5lrq8W0yKVOmpn/bAWo6aHDRuwLgAwKa3Yz5495rsMOkDNkAvAHgU9Y1+iaUW3Y+bR1I2JlOw4d+8g9lltMu0yhu78Ij3YRzqJFjfOBDmo/e2AXBSt76cYP7qWWdIbbOW5ClFMOxNHoPmoUPKCz2Bj/l7OjWhJfDWmm+7R/aUxhzXQ6tar8xa/q8+ox0q6uUBkImX0erJyDa48S6JJkympE4K6VpDN4o/6KiGxdBIPZ4mqWHoIzhVaws+zgPRbc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(11063799006)(6133799003)(56012099006)(4133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ssbBjKtgYSwZC/Bw09enmc+vEdXa6uCS9785oITeiUiDQBDfD4zUs+IjCDO+?=
 =?us-ascii?Q?4LmP2ngRlR7F1wUBa5243azQbflXTba1XX3Vw3KMvz18s6lQxCgxczbve5JV?=
 =?us-ascii?Q?4Pl1mzIYgZllWWH26TrcQz/Ka4Va4N2JKWbseIDTcwZjSUwwy+RX3kyan3PK?=
 =?us-ascii?Q?wkCnsYbR2OtuUM2Nkip3Ja0ToMml8pKVVXHDKtFaNs2zYQVd9vcSuLrK+PTE?=
 =?us-ascii?Q?2+A+4ij08i6sqYWfWDmbTfj6c899K8D0KRcDyjVc5qhVqhHCdtv7ntpgdh4w?=
 =?us-ascii?Q?MfC5Peu3USBBZ8L4QhfP17fpl2M6/E3JAdLf6xgAqUvHeYjCkb+nldlAp3XA?=
 =?us-ascii?Q?xZpFKSsjXwoB9APDsQO3sGa9eHIM8A+3Mod10+qXNDGpCviZNV+EO/tZngBa?=
 =?us-ascii?Q?ZsAycp+T0fxibpf51vHZu/t+D2pPepYk5TLtqDPJRo96syi93qJdj0Idlp4a?=
 =?us-ascii?Q?I1nAGOdJqZI6lC5qNkzMLXHkzDr2yt0RDRW2egz2rl2MNqkFfP5jFbMVgrFb?=
 =?us-ascii?Q?SbDWqlzKG4TyjQ+XoWo3GzDDjO9SPM2YiDnS9pU5cFPccreO32fsnM8HsDek?=
 =?us-ascii?Q?Tri0o0rU9JJW0jPwMJH2fbiSdD8aIjlgwchYB2F3ZTF3yn5kJlX3AF8IuDYs?=
 =?us-ascii?Q?dCkNJPfBaxHPvzk6X6UNkA8R1PpjINTJsudVIBTmg/+wkesUKx+igTt8h7Wv?=
 =?us-ascii?Q?QMKFayhhbh+wRnRpwM5L1wc4cjclzrUjtAzif3eNfyt4KYOQ0Vc1Em5yt/Ug?=
 =?us-ascii?Q?MDyvE9Ut1wQagK+vtQm4T40qdMGTC3V65CSGEs6coAtbvaz1CNlH2Fd+hEm2?=
 =?us-ascii?Q?8eEjd9cDXEIRLolJ35WKVJpbR0pFrrknwXCaxOhWXEl2qrARHqn/XF5dNARm?=
 =?us-ascii?Q?qg0Efwzzjj/2Thre6ZJiRpgj+JFB6ovnvo/HfVCgjmL80nCeP7Bqqp3Z1dnb?=
 =?us-ascii?Q?ypcS8aQ/9F4jsu+3K5Zp7m7B7dr8OaO77+JX6v5JFq90Fxx4UtTS3EiFtg8R?=
 =?us-ascii?Q?mDJ7gn4DZDZ13Nd08oT681QgFIrwM6HHlLKoX/E0vrTa4kxGm+hJhaAlhMgi?=
 =?us-ascii?Q?AdPq1dnXiL94RX6xYKy9Om+PJ0eSLyC3RujCY9rBEfNCdAbq/HAEsgeoTRle?=
 =?us-ascii?Q?Gu9m59qfW5Csn+133Z/jDiGKSQdZ+t4kB2GoYv0ANQ9ftxorBBD8cri4eelS?=
 =?us-ascii?Q?TvESCWg0ecvd/bknGVdLGqhw/cu4t3ugr6zZzLRloJW1Ud9KtCxfVxDI/FyU?=
 =?us-ascii?Q?vx6C/gNSbY6moDpdECmm02FtOJSelvG6qqr2o1ciCE3tGIhyWTQJUN+8m/K6?=
 =?us-ascii?Q?rRmT3pb1Fx9qeVYFUfUTp4AJ2RTVXDNTivYESZFKElDACTB+d0BIzlVgBAIs?=
 =?us-ascii?Q?eL7z2mhkwFfcB2Rzbvi37O8exhgAG9411FxEwpAmmKsQhSP1Uut0e4OMdqoW?=
 =?us-ascii?Q?FFC2osVSMPTERQcroCho2fQwecNSX3AeIbL2nHlI6BiaQUde0g8m8WIgOQWP?=
 =?us-ascii?Q?8KRsNdD04xy6L9n0RUzYZPqQcgG4XYJP+G2H1JXHHX36skqkDEPYdaMdmBRu?=
 =?us-ascii?Q?eTFOFC7tuoD6MA6pXXkC0KvGZ6p9q/gnPU1MI0EYneTvef0yvFk4dC3ozFN6?=
 =?us-ascii?Q?0REHnieW3FqzfE1V0tROmKEugNr0jA1Jgs2rDO916/uzur8bOjSmOgurzFFE?=
 =?us-ascii?Q?/gyBhjklM2pHYQcvVDh9CbVbpaHT+iYAWsc06USN1u8JZXVzosZSWwPoOlce?=
 =?us-ascii?Q?TSDgtM9Cug=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c17b18e-8fe6-4678-1a3e-08dee1c4482f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 16:23:47.3487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R/mQFxy46dKr7mvgkrqfDaoM4xwhs0zgmYtEwXEwCepFcU7qro1eWX0Idlery7W36Ivz27O0KBU4SlVQq72LJ2P0aZmwNwVzga7E2AzOYMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10054
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
	TAGGED_FROM(0.00)[bounces-35218-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:from_mime,bp.renesas.com:dkim,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C56D8756EB6

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 13 July 2026 18:52
> Subject: [PATCH v20 00/12] Add Renesas RZ/G3L SD/eMMC support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Hi All,
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

Most of the issues reported buy sashiko [1] are false positive
except the one pointed out by sashiko and Geert's testing results[2].

Please find the logs [3]

If there are no other comments, I planned to send the fix in v21 fixing the=
 issue
with divider mask in of_data for RZ/G3L and non RZ/G3L SoCs:

clk =3D clk & host->pdata->clk_ctl_div_mask;

where,
GENMASK(7,0) --> For Non-RZ/G3L and =20
GENMASK(9,0) --> For RZ/G3L

[1] https://sashiko.dev/#/patchset/20260713175159.138334-1-biju.das.jz%40bp=
.renesas.com

[2] https://lore.kernel.org/all/CAMuHMdXQDWJGxuU04PEo2bJgHJF5F+0=3DHXqKzthK=
hKSR6dg0Tg@mail.gmail.com/

[3]
root@smarc-rzg3l:~# mount -t auto /dev/mmcblk0p
mmcblk0p1  mmcblk0p2
root@smarc-rzg3l:~# mount -t auto /dev/mmcblk0p2 /mnt/
[  712.973996] EXT4-fs (mmcblk0p2): recovery complete
[  712.980081] EXT4-fs (mmcblk0p2): mounted filesystem 3a87d114-78ab-4be0-8=
fac-d055b25f4bd0 r/w with ordered data mode. Quota mode: none.
root@smarc-rzg3l:~# mount -t auto /dev/mmcblk1p1 /media/
[  725.035107] EXT4-fs (mmcblk1p1): recovery complete
[  725.041088] EXT4-fs (mmcblk1p1): mounted filesystem 2371cfa6-6402-4f3d-b=
bfc-84412835fa12 r/w with ordered data mode. Quota mode: none.
root@smarc-rzg3l:~# echo "MNT" > /mnt/1.txt
root@smarc-rzg3l:~# echo "MEDIA" > /media/1.txt
root@smarc-rzg3l:~# cat /sys/kernel/debug/mmc*/ios
clock:          150000000 Hz
actual clock:   8 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    10 (mmc HS400 enhanced strobe)
signal voltage: 1 (1.80 V)
driver type:    1 (driver type A)
clock:          150000000 Hz
actual clock:   150000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      2 (4 bits)
timing spec:    6 (sd uhs SDR104)
signal voltage: 1 (1.80 V)
driver type:    0 (driver type B)
root@smarc-rzg3l:~# echo mem > /sys/power/state
[  814.141037] PM: suspend entry (deep)
[  814.154238] Filesystems sync: 0.008 seconds
[  814.165291] Freezing user space processes
[  814.175088] Freezing user space processes completed (elapsed 0.003 secon=
ds)
[  814.182128] OOM killer disabled.
[  814.185452] Freezing remaining freezable tasks
[  815.162014] Freezing remaining freezable tasks completed (elapsed 0.972 =
seconds)
[  815.169895] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rzg3l_1.0.1_rc2
NOTICE:  BL2: Built : 09:19:29, Jun 16 2026
INFO:    BL2: Doing platform setup
INFO:    Configuring TrustZone Controller
INFO:    Total 3 regions set.
INFO:    Configuring TrustZone Controller
INFO:    Total 1 regions set.
INFO:    Configuring TrustZone Controller
INFO:    Total 1 regions set.
INFO:    Loading image id=3D39 at address 0x44428
INFO:    Image id=3D39 loaded: 0x44428 - 0x45428
INFO:    DDR: Retention Exit (Rev. 02.05)
NOTICE:  BL2: SYS_LSI_MODE: 0x12061
NOTICE:  BL2: SYS_LSI_DEVID: 0x87d9447
INFO:    BL2: Skip loading image id 3
INFO:    BL2: Skip loading image id 5
NOTICE:  BL2: Booting BL31
INFO:    Entry point address =3D 0x44000000
INFO:    SPSR =3D 0x3cd
[  815.219726] renesas-gbeth 11c30000.ethernet end0: Link is Down
[  815.223525] Disabling non-boot CPUs ...
[  815.225846] psci: CPU3 killed (polled 0 ms)
[  815.229727] psci: CPU2 killed (polled 0 ms)
[  815.233693] psci: CPU1 killed (polled 0 ms)
[  815.235466] Enabling non-boot CPUs ...
[  815.235737] Detected VIPT I-cache on CPU1
[  815.235797] GICv3: CPU1: found redistributor 100 region 0:0x000000001246=
0000
[  815.235846] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[  815.236888] CPU1 is up
[  815.237039] Detected VIPT I-cache on CPU2
[  815.237075] GICv3: CPU2: found redistributor 200 region 0:0x000000001248=
0000
[  815.237109] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[  815.237997] CPU2 is up
[  815.238151] Detected VIPT I-cache on CPU3
[  815.238188] GICv3: CPU3: found redistributor 300 region 0:0x00000000124a=
0000
[  815.238221] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[  815.240113] CPU3 is up
[  815.251088] dwmac4: Master AXI performs fixed burst length
[  815.251135] renesas-gbeth 11c30000.ethernet end0: No Safety Features sup=
port found
[  815.251179] renesas-gbeth 11c30000.ethernet end0: IEEE 1588-2008 Advance=
d Timestamp supported
[  815.253278] renesas-gbeth 11c30000.ethernet end0: configuring for phy/rg=
mii-id link mode
[  815.270272] dwmac4: Master AXI performs fixed burst length
[  815.270302] renesas-gbeth 11c40000.ethernet end1: No Safety Features sup=
port found
[  815.270335] renesas-gbeth 11c40000.ethernet end1: IEEE 1588-2008 Advance=
d Timestamp supported
[  815.272427] renesas-gbeth 11c40000.ethernet end1: configuring for phy/rg=
mii-id link mode
[  815.444098] OOM killer enabled.
[  815.447249] Restarting tasks: Starting
[  815.452666] Restarting tasks: Done
[  815.456345] random: crng reseeded on system resumption
[  815.461744] PM: suspend exit
[  817.842801] renesas-gbeth 11c30000.ethernet end0: Link is Up - 1Gbps/Ful=
l - flow control rx/tx
root@smarc-rzg3l:~# cat /mnt/1.txt
MNT
root@smarc-rzg3l:~# cat /media/1.txt
MEDIA
root@smarc-rzg3l:~# cat /sys/kernel/debug/mmc*/ios
clock:          150000000 Hz
actual clock:   8 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    10 (mmc HS400 enhanced strobe)
signal voltage: 1 (1.80 V)
driver type:    1 (driver type A)
clock:          150000000 Hz
actual clock:   150000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      2 (4 bits)
timing spec:    6 (sd uhs SDR104)
signal voltage: 1 (1.80 V)
driver type:    0 (driver type B)
root@smarc-rzg3l:~#

Cheers,
Biju
>=20
> v19->v20:
>  * Replaced the check mmd->clk_mask with mmc_data->clk_mask and moved
>    the code after assignment of variable mmd, this ensures assigning
>    the default values for non-DT platforms and DT platforms with no
>    device data.
>  * Replaced the check mmd->max_divider with mmc_data->max_divider and
>    moved the code after assignment of variable mmd, this ensures
>    assigning the default values for non-DT platforms and DT platforms wit=
h
>    no device data.
>  * Fixed the ordering of resets in suspend/resume paths.
>  * Added bitfield.h header file.
>  * Reworked on renesas_sdhi_set_clock() to handle the 11-bit divider
>    case and the 32-bit register write.
>  * Updated resume() with scoped PM runtime call.
>  * SD_CLK_CTRL clk enable turned off before updating SCC_CKSEL_DTSEL
>    register.

> v18->v19:
>  * Updated commit description for patch#1,#2,#6,#8,#11 and #12
>  * Updated clock and reset description with AXI master and AXI slave
>  * Added else condition for reset and reset-names.
>  * Renamed aclk->aclkm and reordered the axi clocks similar to resets.
>  * Retained the tag got binding patch as the changes are trivial.
>  * Fixed the clk_mask for non-DT platforms.
>  * Fixed max-divider setting for non-DT platforms.
>  * Replaced the magic number '9' with ilog2 function in
>    renesas_sdhi_clk_enable().
>  * Dropped divider variable from struct renesas_sdhi.
>  * Updated renesas_sdhi_clk_update() to return rate for HS400 mode
>    and non HS400 mode(uses 1/2 internal divider).
>  * Updated handling for clk divider.
>  * Renamed TMIO_MMC_HWADJ2->TMIO_MMC_HWADJ to make it generic for
>    hardware tuning delays
>  * Dropped duplicate SH_MOBILE_SDHI_SCC_TMPPORT2 macro
>  * Updated suspend/resume with scoped runtime calls in suspend.
>  * Fixed extra space in HS400MODE2 comment block.
>  * Updated the comment HS400mode2->HS400MODE2.
>  * Dropped the updation of clk handling as it is taken care in
>    previous patches.
>  * HS400ES support is enabled based on of_data.
>  * Fixed the space in HS400ES comment block.
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
>   mmc: renesas_sdhi: Clean up whitespace and add OF table sentinels
>   mmc: renesas_sdhi: Add clk_mask field to support flexible clock
>     divider widths
>   mmc: renesas_sdhi: Add max_divider field to support SoC-specific clock
>     ranges
>   mmc: renesas_sdhi: Add tuning delay support for RZ/G2L
>   mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
>   mmc: renesas_sdhi: Add optional axis/axim reset controls
>   mmc: renesas_sdhi: Add RZ/G3L SDHI support
>   mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
>   mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
>   mmc: renesas_sdhi: Add RZ/G3L HS400 support
>   mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L
>=20
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 108 +++++--
>  drivers/mmc/host/renesas_sdhi.h               |  11 +-
>  drivers/mmc/host/renesas_sdhi_core.c          | 274 ++++++++++++++----
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  73 ++++-
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  12 +-
>  include/linux/platform_data/tmio.h            |  18 ++
>  6 files changed, 408 insertions(+), 88 deletions(-)
>=20
> --
> 2.43.0


