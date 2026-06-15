Return-Path: <linux-renesas-soc+bounces-33992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Uv51I5yrL2pmEQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 09:37:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD926843F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 09:36:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=s3rLI7Nt;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B36A3011C6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 07:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412B72F8EB1;
	Mon, 15 Jun 2026 07:36:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75C9145B3F;
	Mon, 15 Jun 2026 07:36:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509018; cv=fail; b=OlT3i5mNknHnj64jXmbvzzG7bmR15JNLU4IXN3CdgPggkzIahUJkD9KY7dncE92DO3Pb1a389jNhrfKbPiA4QJMIIuOynFaMu8UEVWbf3xwSWm5cd2JHhruV+u5i+b9Eb2ykeyZnMjPLUNEoCAJqhfoROJS6gN+xRPNCv8ACfac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509018; c=relaxed/simple;
	bh=OyBNaWJC1Ua4Y/XNqJjktKL3oqVnej96cyKRDdcu6d0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BCPLcANhVTu6RPhhabGQWyiuJXphDrB2Q05ny/2t0flLFezWiRWxPyYeuSlunN+jxn82+xJs2s3SG2eLlfQ2p2FtWTyrV4PLUWgG4dguW03xzrWDtaukYhcG0zhZH6P72GXzTWuI5aR/27t5TaNDf9XtL6tfCBjXhho7qVzN57c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=s3rLI7Nt; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZFezD58u4AMDYtqjw3AzgfM3OD3Xwd3nvDOnukxZY4Y3+J9vOXiwQqOrx35hOORSw3i+Xbvr+OxxTaHeiiFOP7ONd7waFl2bRA5bZfbpW6ZBxXAFwij4WgiTs/lGM5EIn02z1sGizUS/GBf0Cwhm7L1ZiTatz3fV+uElokHYXGITgdok7V46yyFCRPDQnBs/k/Fy3icR5lUJVfe0Z5qVqVmoxfocMpRzpqy4omER45Md/LcCxrGo9qyGfa0UkGmGZ1AxUb41hmU3xJQZTgwf3bZzlSLeCOkMfNvCvzEwpzEW8nnO+TtvMTPjK5qEYH5czyKwdeGOeAT5/7qOq4EcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjuYs9qJlY6h5EIP3Padvr1G0dH81cuixGDvGn3sTqw=;
 b=SORIsUbuabFN840cE2nmODcpkv4er9yRD1khBJ2CR2RoWQEg5NO3tua3CChqyaXty4O1gVbi0EyF6DKdL8A5UMq2zrEqYWTRRMOoFBVS6aErIF10wWQiofhafUtL6OsDxjc4R3syyYDnqOt+7pi3TxtRbUIDtBFdxEMHZma6sRhC3OmHnlmQxCbOvhL9xm56dWhloImpYoy/hAkJpG4T6Iu95YrpP517dz15MUgDXj3U/Gfz5RjecBx2r6GRUHBGYoAwOhiyProc2/3tTRCofCV2j99xRHwwnLrZ4ywDgeZrJ66XutqeroNlmdaykyQbP1Q9fR0Qn75W3B8OSLM/rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjuYs9qJlY6h5EIP3Padvr1G0dH81cuixGDvGn3sTqw=;
 b=s3rLI7NtyBJiqF8m5N7FyrFC0EBo2awmjAkK2weoC8vzInom5pTPwTVAw5OBUnwRp7ROGH7nabzAR5eBslK69VS6JWOsCaEdMwrwO9EljErOs09fxlhYTvnUxFDcm8dkL3PG4B4b12uZNimgCL2fymvqcjOAyx6PAvxZ3wgSCjk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB17965.jpnprd01.prod.outlook.com (2603:1096:604:477::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 07:36:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 07:36:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 04/11] reset: rzg2l-usbphy-ctrl: Introduce info struct for
 match data
Thread-Topic: [PATCH 04/11] reset: rzg2l-usbphy-ctrl: Introduce info struct
 for match data
Thread-Index: AQHc+ngXQhFO4Jfhtk6nfo+v3PAghLY/Pj4g
Date: Mon, 15 Jun 2026 07:36:54 +0000
Message-ID:
 <TY3PR01MB113466958A6B9FF2D8592688B86E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260612143048.317907-5-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB17965:EE_
x-ms-office365-filtering-correlation-id: 8893256a-a95d-4c18-79ea-08decab0df59
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|4143699003|6133799003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 PwkcUGMVUKbUjGNDozFWOqQP8Ad5GBOGAirW3tPtgyneR38cQ40vSQK4suEVem83BHMsY8ucqZMMJbHL+3vwlPkruBmFs2syMxGgvsLaEj/xXl812DGasm+6ccBTR1KEc04dk4AadBkAu/J39U3DfATZ7QnoWJSKKZINfVqSWv4Mjewqw2nyzZ91618qnXGIBs6T92DyuwjZLrhmem+WBpp0ax7oHXNrK0+fQ02AtjCIuBvjgTM+8DLkoOHVCup2oxMCFGrd4p81m/nSO2YEJrDRxU8HCGx7hfmD7eo4ltK7iVWSl9VbDfLsZZi2Qw0f3XhoERXKDsILD9HkOA1i9k17hxFz5OvLpEVyxlaBFaQWsCd3PM/BrIN/LlAEu27XInQZ1GU9GwfzohjRwZkqZQ30J3U1t2moe7dCRPQu+odKdrmzJvTNVofu9lv3u3E9glk8nr5Po0xsYtsE1AYHBxZJCr+0McfHLbFXr8+R5Jh6QeiihwWQKGX+ZgphoLVyTpx57qZbCbBT3F1KvJxRZAHoYOILNum1D3Y71NQsrN2TEOZtDUM2/8bzQiewfUaOa/lcJnslXVYxpTXOdQWoCBM3uvl4/NHdlOONg9V7RYJepO0e81yPUrpEjarHJBuE7yTt6ckA+4Z5kPvtuqajsF7gCMkYxOrxmF+XsswPz7AUOJq06gtujXfnD61LHwtFAJ8KqPlodUMxu4r5eBYsDNtH0nqYqfSPSKZUo6AAyyd6oLQ22P+oxDvBLYfO4+lq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(6133799003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rhzw2T3DETs6z6ue6pREtaKT4RIrzVBGjq6ixxErAfBo3El+ABM6wNap4r31?=
 =?us-ascii?Q?PidGX2e8JRftb9iMpkZ3gMtkBdqMnEYAvRNfZoSZonUHcuH8HW0z9AErngws?=
 =?us-ascii?Q?p7RzlQPfZdwbVWWT3/mKyDgaufGMJyZQcX5H647LRIVv6QuMUPfl0QIohtkQ?=
 =?us-ascii?Q?9knwmZs3h+nEOuXv4szCLPkMQJHmdQYFdRtbRfML6FbeXKIWvB7g6V24kLYU?=
 =?us-ascii?Q?u57OymAdJaGfgn9ls8ZZftP9ittdoAqRUxJ8gMIrlDGHzhBQJnHFreoGQ3zC?=
 =?us-ascii?Q?1ccp3LOzd5QnMNJJDzj3Rg9d68E0AODQIHnVYiE1Rscw7zL7eJ/qNLkoXKRu?=
 =?us-ascii?Q?sj91iOrfwiD0XqbTVkWUytKSb6wYdzWqtOJYU10MIEUBWEcTKYeQj83RmgtT?=
 =?us-ascii?Q?R8oR7by5gZ54MiZ8aWk/pzCd+ZP9dneI6d7KjvFO7szLWCDWEwEVIwOZMVbw?=
 =?us-ascii?Q?ZCdhrNQuzWRSxRlkLKPDsIdXqh6MLqxvsQO3SL7RXzFQkHov1eZvT55BHDJY?=
 =?us-ascii?Q?M6ldPWGQscCRrNOn5TuaHmnCzGY/4nwHLl9C4IqPeSuQJcNAW3jZHwHEMqYI?=
 =?us-ascii?Q?YpEoFhrZrROTDevzytF7+/VCL64skhhVj1iM1TYBfD+aLKHWurCBxs8Abyd3?=
 =?us-ascii?Q?DxfpjORH4qhkQxTIgoU0IvN+oTqt9qiLY4AsVBwEhHmzwLPljDJAfhkC+EZp?=
 =?us-ascii?Q?t9GSPPZKJczpPr4OEW9CFNTSY7C6Kd6KE+68cVjd2d2oPrHo2ScyzupVHAED?=
 =?us-ascii?Q?rA6Haf0adUGUmWVkhiZo3SZEQhkeSZS6B3C0m8MB8gCk6B7Cg0fOqvBq/+yz?=
 =?us-ascii?Q?fJTc8UwQY8etuMdGtf4CxT5R3Z0PcyNXZBN69dYiLzkLoAjnAAA/FwfH8ZZQ?=
 =?us-ascii?Q?k5DyDZePNcWpCTdgq7RgbHqW9ICXzhzlkbtD2WhCfAosqG8jfU9swTfYtW/7?=
 =?us-ascii?Q?pVT+Vkg+WwQ1iwSgMhn89Dak/RdhGYOmKtx9zCaTJ0ClgolSmSZv7QTxp6tD?=
 =?us-ascii?Q?/llooQ8pa8PfM0stZ3RG9FZmk2JmndXujafBdHWlrKILj/3uNpvUoOOFWVGh?=
 =?us-ascii?Q?koa6KGIrpfgNs0DwBZU/CeSjJzOBk5xwVDvRKy+JbZ6H4yZoS7t9ugIZi4g2?=
 =?us-ascii?Q?VFY28KQkoDo1F3Tacsf/i9iz5mvABujhouwfq1XLWtp3DlJXLEB2eGEBT+dU?=
 =?us-ascii?Q?OAGS9SFVCIs1wqdNWsL9NE+yKpQioH2G1Ck2Wi1iNyyPnTAguj9bBXsKxiM3?=
 =?us-ascii?Q?daj4EK1qJuXhdEijrFqLzzRxfenVaPzdax0R2Q09N154zscHwWy33mZdn0Qy?=
 =?us-ascii?Q?mv69abfVfORRpgQqtdMG8UFM7ZUfaOu6Ke5VeeESWTE+JVddmRy2AgQUUrBt?=
 =?us-ascii?Q?DcNfYZT7xWch3BMsCf4jQqSQ7ipZ+oODHcR+Ldu90qm+cBLDg/w2mCnbHYgA?=
 =?us-ascii?Q?UY3WmhhZ5ffUMVMWsyiFLFxKom2WqmdsLr1z0RoR4t9aS18seCder1iVYLw6?=
 =?us-ascii?Q?qSjgEOWVe2e82aTmn/NW3iAgPSlQZBFCj8nwdRW830ljlyUWNRwatlqhB5Qa?=
 =?us-ascii?Q?v8kHujmvyAoJe2GJtYxpIPFN8GIOHCLfb9JSo3qJQl2KFmILEhvp+LeXyN9U?=
 =?us-ascii?Q?tAa2uduKH0AX/+SUTOlEM5GxOGsuhYIFCI9aWnDWi7c4oWOdkSgPHdYqQYKy?=
 =?us-ascii?Q?T6qZA1ONmad3jCkUUK/i+xIz9zSeoZVUMoEwyaQqG8hTfxh+fEr4J2SL/BlR?=
 =?us-ascii?Q?OUiWWc8Wmg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8893256a-a95d-4c18-79ea-08decab0df59
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 07:36:54.2793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CLl0ZgzzuRUpEd1IiUioPsah1sedysOE0mfqQaFol7w0RTm3SOlknIRrvZP5O4kwY+kuiSj2djK/PlEshAre+kXFl9bsPX5Mav3KFEhg1o8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17965
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33992-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,glider.be];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:dkim,bp.renesas.com:from_mime,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBD926843F0

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 12 June 2026 15:31
> Subject: [PATCH 04/11] reset: rzg2l-usbphy-ctrl: Introduce info struct fo=
r match data
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Replace the integer flag RZG2L_USBPHY_CTRL_PWRRDY with a structured rzg2l=
_usbphy_ctrl_info type to hold
> per-compatible configuration data.
>=20
> The new struct carries the regulator driver name and a pwr_rdy flag, allo=
wing the probe function to

Typo. pwrrdy is the flag. Will fix it in next version.

Cheers,
Biju

> conditionally call
> rzg2l_usbphy_ctrl_pwrrdy_init() based on the matched device data rather t=
han casting match data to an
> integer.
>=20
> This restructuring makes it easier to extend per-variant configuration in=
 a follow-up patch to support
> the RZ/G3L SoC, which has 2 VBUS regulators.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 38 +++++++++++++++----------
>  1 file changed, 23 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/rese=
t-rzg2l-usbphy-ctrl.c
> index fd75d9601a3b..1c4c8aae0e80 100644
> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> @@ -41,6 +41,11 @@ struct rzg2l_usbphy_ctrl_priv {
>  	spinlock_t lock;
>  };
>=20
> +struct rzg2l_usbphy_ctrl_info {
> +	const char *regulator_driver_name;
> +	bool pwrrdy;
> +};
> +
>  #define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, =
rcdev)
>=20
>  static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev, =
@@ -106,14 +111,18 @@ static
> void rzg2l_usbphy_ctrl_init(struct rzg2l_usbphy_ctrl_priv *priv)
>  	spin_unlock_irqrestore(&priv->lock, flags);  }
>=20
> -#define RZG2L_USBPHY_CTRL_PWRRDY	1
> +static const struct rzg2l_usbphy_ctrl_info rzg2l_info =3D {
> +	.regulator_driver_name =3D "rzg2l-usb-vbus-regulator", };
> +
> +static const struct rzg2l_usbphy_ctrl_info rzg3s_info =3D {
> +	.regulator_driver_name =3D "rzg2l-usb-vbus-regulator",
> +	.pwrrdy =3D true,
> +};
>=20
>  static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] =3D {
> -	{ .compatible =3D "renesas,rzg2l-usbphy-ctrl" },
> -	{
> -		.compatible =3D "renesas,r9a08g045-usbphy-ctrl",
> -		.data =3D (void *)RZG2L_USBPHY_CTRL_PWRRDY
> -	},
> +	{ .compatible =3D "renesas,rzg2l-usbphy-ctrl", .data =3D &rzg2l_info },
> +	{ .compatible =3D "renesas,r9a08g045-usbphy-ctrl", .data =3D &rzg3s_inf=
o
> +},
>  	{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table); @@ -153,14 +162,=
9 @@ static int
> rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,  {
>  	struct reg_field field;
>  	struct regmap *regmap;
> -	const int *data;
>  	u32 args[2];
>  	int ret;
>=20
> -	data =3D device_get_match_data(dev);
> -	if ((uintptr_t)data !=3D RZG2L_USBPHY_CTRL_PWRRDY)
> -		return 0;
> -
>  	regmap =3D syscon_regmap_lookup_by_phandle_args(dev->of_node,
>  						      "renesas,sysc-pwrrdy",
>  						      ARRAY_SIZE(args), args);
> @@ -188,6 +192,7 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct devic=
e *dev,
>=20
>  static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)  {
> +	const struct rzg2l_usbphy_ctrl_info *info;
>  	struct device *dev =3D &pdev->dev;
>  	struct rzg2l_usbphy_ctrl_priv *priv;
>  	struct platform_device *vdev;
> @@ -206,9 +211,12 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_d=
evice *pdev)
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>=20
> -	error =3D rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
> -	if (error)
> -		return error;
> +	info =3D device_get_match_data(dev);
> +	if (info->pwrrdy) {
> +		error =3D rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
> +		if (error)
> +			return error;
> +	}
>=20
>  	priv->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
>  	if (IS_ERR(priv->rstc))
> @@ -241,7 +249,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_de=
vice *pdev)
>  	if (error)
>  		goto err_pm_runtime_put;
>=20
> -	vdev =3D platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
> +	vdev =3D platform_device_alloc(info->regulator_driver_name, pdev->id);
>  	if (!vdev) {
>  		error =3D -ENOMEM;
>  		goto err_pm_runtime_put;
> --
> 2.43.0


