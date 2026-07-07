Return-Path: <linux-renesas-soc+bounces-34803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F5qHEXDaTGq+qwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 12:52:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BAE71AA64
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 12:52:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=vIEEP7ZH;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92D7230160C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 10:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF3A3EFFBD;
	Tue,  7 Jul 2026 10:50:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C227732;
	Tue,  7 Jul 2026 10:50:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421403; cv=fail; b=LsiRfuPIeag8vdH7ThAy7YCeAcrXdsVSycVzW4dFQw4FNrxKMOkNmygtRo2gnCtD2CyaA3pnCje+aWlVFKHyA7uU0Vkta+2sRuO1G2Z0t62YBFMZxfKqcS92JAbEVSuWLXRCKRkqwGEBzvej+UqRe874RrXx2uygOD2zY7sHYXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421403; c=relaxed/simple;
	bh=L85kTdrS/JiWtGCdMCR9mWg+HURVl7m/52jRgnaDGKo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MVNMSE6t9i+I1eyN+qLjjPpdlW7IPbZO0GT8LK9O4I1Vt4FTIIa6pf4KJ9bb0pelZ/M2H8Cm6GpvEWFc0LvsBi977pudZy8bNibQOfeze/jZiBCKjRXDgvDyJMDf7gkBc4apVV1M26kO9FHHIjkYH70VO+3/j9wQMUUbr2BcDbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vIEEP7ZH; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGe063uFHQBRtjwh1wtORAVLbmjYRzsMxGriCaDDkAbqpOPjUxiN4KQH7J/xbLn1n8YVceZhGapCtUz5YyWYT31laSeivktH4VTn/08bjBMy7HqbocIbU11OOPJTADZ8DBAOTAsQenQfJz13hdzym87Dn9BaTUXkG9DOAVGEluDFBWa+C+ljmvHMOiXOiEpr1XGzE1R8R2Jg+54EsEKNeq1YmESDb6KJhdPAXf8eXxE8vvJTkHgZfibuw8GuqjCPyD6+lYGiOBkUVmKdryY4gm3U+W3NMfJPcayGFAT6CkoAqMMREBW8P3TkjYVqZrnAUPtzMxFUKuFBxu3jR39OCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4IdsgJvS5KNFhkOMaDFqLjo0+gxOvddftlCsbDg398=;
 b=nr2Taab6Z+GejIjHMt8MjPcuKN5oRXcpkHggzsN3mDQaTkW6r1JEA9vMc8pnpFMnweI0lHpV4/tvJrvgmDZV0Km2t/1flwaddbMc6TjwMyVv5mGt5zeZLoqCs/+rKDO+vvi82xgCJU4GlK8ZJ2Wrzsr7WeIQBnSENHoKClqzJtFau53/jyfMhGxeCxcIe8PtVbmLOTiVKG70GZjD20dW3tbIECF/Br7IzO6w8fqghlGbUTQy5Y74cP7Ne1+C6Z4PjGXwHwsOHASIGhp+JUsxLHJX9o3m8H8edfEdDTo5jHTJHcSti6F7psBiUkjuQMJnhuETar0p5yJRwG3/ghOVrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4IdsgJvS5KNFhkOMaDFqLjo0+gxOvddftlCsbDg398=;
 b=vIEEP7ZHw0fnCApJjq1VjGUcio8I5Bm+kT3hJGsNtpDA3fq5jCkveEpknpbqWuaxXtaML5DMrHH0PtzQUpjsYCKqhG+0M+zCsUliLzc5xvz7JMpzR8+3v37tzFMWDJuNGtNOYbQX2xdd6G2jYcMziUHQSITmHsBjDqVCdF3cA3A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14984.jpnprd01.prod.outlook.com (2603:1096:604:399::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 10:49:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 10:49:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v18 03/12] mmc: renesas_sdhi: Add clk_mask field to
 support SoC-specific clock divider widths
Thread-Topic: [PATCH v18 03/12] mmc: renesas_sdhi: Add clk_mask field to
 support SoC-specific clock divider widths
Thread-Index: AQHdAl+sMF1I+KknxE+Bs0Y2hiW6ELZh9xuA
Date: Tue, 7 Jul 2026 10:49:59 +0000
Message-ID:
 <TY3PR01MB113466B8CC9D1658C61DA5C7086F02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
 <20260622155610.184271-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260622155610.184271-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14984:EE_
x-ms-office365-filtering-correlation-id: c5091459-ea86-468a-bf04-08dedc157d92
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|11063799006|18002099003|22082099003|6133799003|38070700021;
x-microsoft-antispam-message-info:
 Xae1RxcEx1y8fX7xqPS5wqq0jMeZJQrfZFm6mEz6beOFnyxRYVcmNXwB4Q36Y+SCsf6pyUl5ESbokt/MhQXWctAttSdiCVuVPlVTxQzrVaMBjgFcfqi2yi8WtejErJkOdbmD+wcnCzLf6BQ+R/kGZiGNxdDVBfAHValqG5IQlWAoYqLc+spMly6K82yvG7IDeneu4MGoFXNT7WoNj7OSEopSpaVI+cbgX4wKLWS5QsqdX5z/ITTH4o6ZLKHeLwpwcngISk4kRoMpe1njW3X2Zyn/XHDNY6JC5nhfEF227Ak6aAlgKe0MzfP0HDijUD4sSU3/iIMmg/ljDgEyVZWV3tQG4EPbvMd3Hv5yCxX9VwdhMelmsrBiO8em24mrroUddJqXGVWEkz9y6gUEnBrcTjLvWNzaLlXasYa5e76n4NYKa1AnznyOtNLk2uxDUpxvhBga4TCOmbOV8+7TdMmToemn+U9QuKMsWNJtNJSmw+jZQm83dcm6NAR+E1zXkOHizZXjCQZKTkdpgVE8Lu3lGqDGThjCnRCqsKwtN9+ZsRL9GADexQzp0seFVR0cCDPSwfj6Grt1MYmNotGTiBQScwI1OgUj2kg76Nymo82wfNw2MVui0k6GOdH3WQEWjEYkUzv4bMGP0ENRDjwHVyhMDQPoE4Oq55leTR3wKuiG4yGK3CcjPGPGIU55v17i16Rf/GAAbCrrx1TDWGohHqki2e7u3U0Iuwyk39pESxH6fc8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oixbNIUQRZMGnRZWKmjol9peyn4gtPgwzmMsFa6BaQG4CvvWqugrzzx3xp0a?=
 =?us-ascii?Q?dmLbe64UaV/5Egtgk84EESOXUfWdlKCvFuspPrNbLwp3JVrpROyeNwnDebak?=
 =?us-ascii?Q?Hjb1acdTOENQ696+2rMbA5Xh726k9ZvL9fdI+oV4nUYF/jv93jRNMQfw6FL7?=
 =?us-ascii?Q?UMtHW1UDv3P7NBXNIrA2GFaCswxkBtvdkqGd9cvSsXjuRJCOepBM84RlRMk8?=
 =?us-ascii?Q?J2/XrnuOdPcXZRMW1a8M4SAqUnkr1SQFi4IimYQA5cpWUBGx7gS6ulYBNNCy?=
 =?us-ascii?Q?E4YlSDD/bo5GSVJg4Bu06OWlPjN0si2d1KpqJlpTKbozOGad01l98awo8Z/V?=
 =?us-ascii?Q?s5YN5aAdojVlkLhrwd5fpCNUjRaaoRrALBRLKFAwK3ODyzB8H+R4mlzXyBRl?=
 =?us-ascii?Q?pjgLORqakcyGq/H+h0F4fuaPkTLGNwg7llOOqL4A5xMXQ1zCd4syexMY99p4?=
 =?us-ascii?Q?puKS48ymiYBPxtHBRAWrtWTCQbXQBVkqU35Jq5PzzJ5NwT/KlnIiEKL5dZe/?=
 =?us-ascii?Q?N1kjgFbGy7DpjWeTknxwHDQr3bCXxcyz1JcqILx+hPBA5QxJ89F7iUGwiaQm?=
 =?us-ascii?Q?mn8TBQ/v4/oI6Ag2a5Tabvd+bNsXGyewc3DTouxqfD2SfscH4x5Qf5Zgeu7R?=
 =?us-ascii?Q?rDYK5Wkd8fHZXSNDR/nZez5Oj0ZXjdo7URCSsOz8DTS3YclcBSeD/hS52vMr?=
 =?us-ascii?Q?mpE/B/Cv/zL0qKkqjD2DNr7wVrAyUqa6bI8yVQbstTgc+E8lXCiw7dhIuYuY?=
 =?us-ascii?Q?nV37KGfTFwT+6buuMtyaxk8cStVOsdmjdZ0L145egr7q6Ga5hskliKn33ct+?=
 =?us-ascii?Q?yKpiRPDe8Hm1nBUeCGnc7lBhq2j57iciWx/NylcGJ6fIetPlBIvDgaig9nRM?=
 =?us-ascii?Q?AickmaG9YbypKrbiLuUTaslC8cSsWQbHWEtXOv+rDygH6fmRXLaJPAlaQwjp?=
 =?us-ascii?Q?dtd6ZvrzfK/Q6vVrs+jceL313CU13rNVrhfV8sklyAKZyqFUPZkNMXTZs4b2?=
 =?us-ascii?Q?5XHyNnT+LtTmzIdF6ICLzITk64oZaKUK45LAbRwUc+ZuRsZ8g6SoVM1XT01V?=
 =?us-ascii?Q?57T7vTRmDuSCeTeM0itk2S55uZk0j6z7N4h2/RE1uoZtVTO6ekdEPl9oDpIR?=
 =?us-ascii?Q?sqCH10tvC1hHEPMkYKLju6sID9dSSzvd42Ssd8P/CyWqfSfI2154facwEHIl?=
 =?us-ascii?Q?2GsoToAJLOf852qCKYYIHL5xPZapaQ59e64dCvj2VmSp+dAAptNx9Q40xNmj?=
 =?us-ascii?Q?GCGtQsCcSYUDLwKd7SbXvt+Tl542ZH6OPEr5nkFPn1vfMLx2eKWdwtlYC8XP?=
 =?us-ascii?Q?fYjCN/ERkEmbfnKC349gjX3Rmdhb4EihPgg9wXCiLPtZgp+T0+/7TFQ8oGoZ?=
 =?us-ascii?Q?88o6c73WWhrR81FGzdF11duwpA/0omM0GzU4nZvNuGUVWQDmNc/bcY+vK4tm?=
 =?us-ascii?Q?3i2qoy6Pk/wqmM6/ZvxjFxsPdWyuSV+sFM7wEhYrAUMp6viRlYoCVMtSUi79?=
 =?us-ascii?Q?Ly6zy6btFFp68O8dTUE5PHURzKPmeccM0MKopiOKAKak/tLyqO6aA0yBDZUR?=
 =?us-ascii?Q?BM+l14qxU1h5o10/lVzOja5JDXb5Uwi7hgJSJsWlgfYwpCOEi/cLHlR+krFI?=
 =?us-ascii?Q?Z4wjYA6V6bb+kErA3hLElzGAjpyLC4q/H/Fh1DN6fAuYJ/mj55EGzgPsLwk1?=
 =?us-ascii?Q?BoDEp7I0YXXpxh43zbjxvKOlCFiOodLZh7OU0Z8oepQ7OljFS6wQdN1i2am+?=
 =?us-ascii?Q?ivWn1V75eg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c5091459-ea86-468a-bf04-08dedc157d92
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 10:49:59.1922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wVqpIAQ02ead1ZINszzEqNs9Z61obN1XSgGICrxR4JOLIaPi1hEnDmRRTlvyRBBBwRTkRRgg9jp2z94tml4/oI8eqax2LGh5RmW9IaC0eBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14984
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
	TAGGED_FROM(0.00)[bounces-34803-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,vger.kernel.org:from_smtp,bp.renesas.com:from_mime,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91BAE71AA64

Hi Wolfram,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 22 June 2026 16:56
> Subject: [PATCH v18 03/12] mmc: renesas_sdhi: Add clk_mask field to suppo=
rt SoC-specific clock divider
> widths
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The RZ/G3L SoC uses an 11-bit clock divider, which requires a wider clock=
 mask of 0x200000200 in
> renesas_sdhi_set_clock() compared to the existing hardcoded 0x80000080. T=
his exceeds 32 bits, so clk_mask
> and the related clk/clock locals are widened to u64.
>=20
> Add a clk_mask field to renesas_sdhi_of_data and tmio_mmc_data so each So=
C can supply its own clock mask.
> renesas_sdhi_set_clock() now reads
> host->pdata->clk_mask instead of using a hardcoded constant, and
> renesas_sdhi_probe() falls back to SDHI_CLK_MASK_DEFAULT (0x80000080) whe=
n no mask is provided,
> preserving existing behaviour.
>=20
> All current of_data entries in both the internal and system DMAC drivers =
are updated to set clk_mask =3D
> SDHI_CLK_MASK_DEFAULT explicitly, in preparation for RZ/G3L support suppl=
ying its own clk_mask value in a
> later patch.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18:
>  * New patch dropping struct renesas_sdhi_hw_info instead using
>    renesas_sdhi_of_data and tmio_mmc_data.
> ---
>  drivers/mmc/host/renesas_sdhi.h               | 2 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 8 ++++++--
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 +++
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 4 ++++
>  include/linux/platform_data/tmio.h            | 1 +
>  5 files changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h index
> 09bf9b24a8c3..f926a36f213c 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -22,6 +22,7 @@ struct renesas_sdhi_scc {  };
>=20
>  #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
> +#define SDHI_CLK_MASK_DEFAULT		0x80000080
>=20
>  struct renesas_sdhi_of_data {
>  	unsigned long tmio_flags;
> @@ -37,6 +38,7 @@ struct renesas_sdhi_of_data {
>  	unsigned int max_blk_count;
>  	unsigned short max_segs;
>  	unsigned long sdhi_flags;
> +	u64 clk_mask;
>  };
>=20
>  #define SDHI_CALIB_TABLE_MAX 32
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index f9ec78d699f4..cccc8fc235d2 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -194,7 +194,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_ho=
st *host,
>  				   unsigned int new_clock)
>  {
>  	unsigned int clk_margin;
> -	u32 clk =3D 0, clock;
> +	u64 clk =3D 0, clock;
>=20
>  	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
>  		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL)); @@ -213,7 +213,7 @@ static=
 void
> renesas_sdhi_set_clock(struct tmio_mmc_host *host,
>  	 * provided for actual_clock in renesas_sdhi_clk_update().
>  	 */
>  	clk_margin =3D new_clock >> 10;
> -	for (clk =3D 0x80000080; new_clock + clk_margin >=3D (clock << 1); clk =
>>=3D 1)
> +	for (clk =3D host->pdata->clk_mask; new_clock + clk_margin >=3D (clock =
<<
> +1); clk >>=3D 1)
>  		clock <<=3D 1;
>=20
>  	/* 1/1 clock is option */
> @@ -1136,6 +1136,7 @@ int renesas_sdhi_probe(struct platform_device *pdev=
,
>  		mmc_data->dma_rx_offset =3D of_data->dma_rx_offset;
>  		mmc_data->max_blk_count =3D of_data->max_blk_count;
>  		mmc_data->max_segs =3D of_data->max_segs;
> +		mmc_data->clk_mask =3D of_data->clk_mask;
>  		dma_priv->dma_buswidth =3D of_data->dma_buswidth;
>  		host->bus_shift =3D of_data->bus_shift;
>  		/* Fallback for old DTs */
> @@ -1144,6 +1145,9 @@ int renesas_sdhi_probe(struct platform_device *pdev=
,
>=20
>  	}
>=20
> +	if (!mmc_data->clk_mask)
> +		mmc_data->clk_mask =3D SDHI_CLK_MASK_DEFAULT;


As shashiko pointed out [1], for non-DT platforms this should be

[1] +	if (mmd && !mmd->clk_mask)
+		mmd->clk_mask =3D SDHI_CLK_MASK_DEFAULT;


Cheers,
Biju

> +
>  	host->write16_hook =3D renesas_sdhi_write16_hook;
>  	host->clk_enable =3D renesas_sdhi_clk_enable;
>  	host->clk_disable =3D renesas_sdhi_clk_disable; diff --git
> a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesa=
s_sdhi_internal_dmac.c
> index 990e3d18d560..2865ec30be66 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -102,6 +102,7 @@ static const struct renesas_sdhi_of_data of_data_rza2=
 =3D {
>  	/* DMAC can handle 32bit blk count but only 1 segment */
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  	.max_segs	=3D 1,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_data_rcar_gen3 =3D { @@ -119=
,6 +120,7 @@ static const struct
> renesas_sdhi_of_data of_data_rcar_gen3 =3D {
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  	.max_segs	=3D 1,
>  	.sdhi_flags	=3D SDHI_FLAG_NEED_CLKH_FALLBACK,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallba=
ck =3D { @@ -135,6 +137,7 @@
> static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallbac=
k =3D {
>  	/* DMAC can handle 32bit blk count but only 1 segment */
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  	.max_segs	=3D 1,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] =3D { =
diff --git
> a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdh=
i_sys_dmac.c
> index 13f9a25f4722..d1a4f65ddd91 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -29,6 +29,7 @@
>=20
>  static const struct renesas_sdhi_of_data of_default_cfg =3D {
>  	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_rz_compatible =3D { @@ -37,6=
 +38,7 @@ static const struct
> renesas_sdhi_of_data of_rz_compatible =3D {
>  	.tmio_ocr_mask	=3D MMC_VDD_32_33,
>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>  			  MMC_CAP_WAIT_WHILE_BUSY,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_rcar_gen1_compatible =3D { @=
@ -44,6 +46,7 @@ static const
> struct renesas_sdhi_of_data of_rcar_gen1_compatible =3D {
>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>  			  MMC_CAP_WAIT_WHILE_BUSY,
>  	.capabilities2	=3D MMC_CAP2_NO_WRITE_PROTECT,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  /* Definitions for sampling clocks */
> @@ -71,6 +74,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_c=
ompatible =3D {
>  	.taps		=3D rcar_gen2_scc_taps,
>  	.taps_num	=3D ARRAY_SIZE(rcar_gen2_scc_taps),
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
>  };
>=20
>  static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] =3D { =
diff --git
> a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
> index 426291713b83..76056d49f5e0 100644
> --- a/include/linux/platform_data/tmio.h
> +++ b/include/linux/platform_data/tmio.h
> @@ -61,5 +61,6 @@ struct tmio_mmc_data {
>  	dma_addr_t			dma_rx_offset;
>  	unsigned int			max_blk_count;
>  	unsigned short			max_segs;
> +	u64				clk_mask;
>  };
>  #endif
> --
> 2.43.0


