Return-Path: <linux-renesas-soc+bounces-35016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7hn4DHq0UGrg3gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:59:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B77738BED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:59:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=gQCNg0S4;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B48E93077D92
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 08:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78723BBFD3;
	Fri, 10 Jul 2026 08:53:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D813B9D9A;
	Fri, 10 Jul 2026 08:53:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673614; cv=fail; b=UuBxPH9RSoTB03+ZJwSTiH92zGqPYnxBvSGVAeBGFSz08sQ1QBloB3PiDZQw4+tIPNo8vQ8LMobxqoYEYsfGnEPki/NGlwtWjwP8lHoh3eIRRk9DjEmADBuIUSMurP1TiUV+R4WQ1t4ayOuJBrd1Pgwh0kDpM0stxj/FySf2wWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673614; c=relaxed/simple;
	bh=yL2Q1kbPOnja2USmFoG0OOBvqeEcHy3N0YdTXaCFS9I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SBAa3Y3LY5/Am4YOpfkY99oOADxaxKdD1LROKN2Z78LcNzNLndU3y58aZpyMwx/crqBhnnZMOlqWd6wAHPNc6cgupzNiS3ap+YJUojggjOVfJi9mmvStrYq1Wz0LIhsR7OA1fxY/Iupp9IzojQn8oC4/oaoALoSDdfbXzUZa9kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gQCNg0S4; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIGRFSgOA/8VjeDQIt2Y0uOK/706Gpwk2VQsKBABmvQPRLh9MdeAhSlCgHWvwOVkXEDkU1Md+ybko7J3v1uSiniN1sizWU2gWb0PdBxN+DUoLMfBnVZny6c6dL879dceLhXj+p6y4nfPDkW9/Pqvz5w5eFA3k6oG0n34ucx2ukVkSjAmbVo1tFKnujx/6MYdRtVnMgnomh+o84jA8ZPdiPGLzQQ6c3cQP1DR4cYPvZaJzjG9p4ePRwWLsFViD3Al+vVztv4jqfdMxDzbFCCXt1vZ1Twa3lyypPcJ4GOf9MBrMUMBTBQw/OPLkLd2repl2gHYaPnKwp/hUOmni1IpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUaFWNo5xIJUwdkFpYRTMRM8oB5/mykC92INNtr7PxQ=;
 b=QQZdluRu1R0tqBqFi/MPApgZm7qjL3TSVgvbCiGWKub+oW86gXM8KUeJ1KBnqaE2EiCXtJF4q6Mm+O8V6vPx2BNQpjml2YfAiqSFqcsCm6p86qC1TA/TLZVk97I4huiRtAZFRPg5NuOKGmqBTlbCqy2DrRXQTTdLGyiGdKDeRg2DypycECYQsodkL6WQoqUtJLtDOEU8xDJnaYuH+ED5alXrbnF0nM5q1JuDiz0t60tByD7o/bf4TwbtsTgFHUMNab2vAbJry59nGQNQVMW6s0uns1vIcsmYkfKtfGyTV8igsZscsaP0b8AW7znnK4yX+pGGHZsVypK4Va5FooxrZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUaFWNo5xIJUwdkFpYRTMRM8oB5/mykC92INNtr7PxQ=;
 b=gQCNg0S4Cn87KbCpGMSKeF2Kn4SEyeG3hKClJ4rLvbhqzbyWt6pYdr2eZh9SeYRWY8I96RWwBGVXkFJTcVaSz/F8LeKi8xM4+hiGqcrO1sQ0c1CYs4bB+HH1LRkWSVNSWzUOA6xuxvEIrD4CwDJoauHTNSfUpfRhxHUJs/qVMok=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB16355.jpnprd01.prod.outlook.com (2603:1096:604:2bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 08:53:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Fri, 10 Jul 2026
 08:53:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v19 08/12] mmc: renesas_sdhi: Add RZ/G3L SDHI support
Thread-Topic: [PATCH v19 08/12] mmc: renesas_sdhi: Add RZ/G3L SDHI support
Thread-Index: AQHdD9lE2kvJOhJAN0Wml5dpidvnprZmcwYw
Date: Fri, 10 Jul 2026 08:53:29 +0000
Message-ID:
 <TY3PR01MB113461CAEBBBE8B42E417D28E86FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
 <20260709192916.630794-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260709192916.630794-9-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB16355:EE_
x-ms-office365-filtering-correlation-id: 0496a512-7494-4f5b-5185-08dede60b6b6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|3023799007|18002099003|22082099003|56012099006|5023799004|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 AckKTCz5ODJLb3JNMlDeneZw96Sr52WCqeq5pTuZMwyR+DMBHuCPEw3k2QeMDjLm9Z17zXf+pIgpsotNuxT2LCJ47Qpb78QkwBrOsb6tPM+pwvZEvehjRVqNlIv6p9NXXed+LxE9gAzcyNHcu1wr7+smQkrJl3UTNh6YfsF0EpX9Attnzvvg1Ad9RAswXwclXzVisQ48oZmCVmQauYPBwiB5PcSbJMGZqyqMfE0IBgYjJd+11WAgMT97qgXooLc2vIszTlfV8RD/NsRASpbqof4PkHZPzx92z40c4WUTg88h666QsTM35Lg7U+L/3TkBB41uC+yGxPQMArLw7uv/7ZL5Fu0f5liOlG3YL3Vk3qjRs/Il7g8rzLBjv1wJtZ1UKhpvf8wn3PNMwJUDg5d1ZkCtNbAuQuxaM22My1C7YJT98DG9v7yvfZxeEb3T4XzmtyL++vdAsL9V/BVhCR0dEtBqcHLYk+HsrmJEf+f43+iBsPgodtmkezZDd9gOcKt8j8Izr5rhvw2kTHmMjZk+khkoPtDs3gzGpAahCxlIANxWjy5T3vjpyhaYoz7p7rufhqgHg4EQ8rf+bqkrwZ4SDAPb1q4VZ2N9fZ9O7XXhZdaShcGQ66Wc7Ux4DXf1MRFryHd1ZlWK+oyNvdFTxEilAiP1j4gayKMT8JJob84Eq50=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/RdbfSqqTJloiWC+TR5RfiIDjlHYlhUGErRuwsirh9XacQtNLxtzFJsYqgDs?=
 =?us-ascii?Q?2C04bN1t4PSRqhZzs42P5iMWry/QR4Fp2GKoyfE+g5oKXWDRKd5KriY+FsSc?=
 =?us-ascii?Q?/so0t6NJdGm8SSAXNMmaQ9cDxMVx2e076tLdJjyXnT7LwU64raCpBgYXv8Iv?=
 =?us-ascii?Q?CRUNtALS+z47k7nYIvSPh9EtOesnutTIch38w2LXnn6syWEBBDmU5sSwWFjW?=
 =?us-ascii?Q?daOfSCTIE51saE74wzCeY2btoq3JfJuxEmMEXTTQ7hd4OsoLKEFB3udDkanj?=
 =?us-ascii?Q?yMyukxrI2huTmywLU/PIEzA3qhMm36WWi4lX+g6DCVj7wY7mo8SRjKKfnlUM?=
 =?us-ascii?Q?UhMRbw9V6puyjBkJtWk7uSytVG7Lh+Jrt3vLADCv3JQeT4VDIRWaz5GUHTXv?=
 =?us-ascii?Q?blkT+Ldh+imq0n7qTvW0oyclQngw47kpSEB6IW6m1B5Ct1M9RyZOi7lbNrZa?=
 =?us-ascii?Q?cajp7LkthutmmSFl6j8QHCjsb1xRtEHE04sy4klHrpYUw9kDF+Wd8TF+9jVC?=
 =?us-ascii?Q?GBIyfEHBtcsyH6gH0u/a4TYpPDT8m9dEsSIumfFEiDBLvFnGZMD6RyZfZKeQ?=
 =?us-ascii?Q?ZkEnhGkPywsYFbw6KOJWkIcb6fJgQqDzysgmwSHG3xT/4IzWXYZXLMkbxdiT?=
 =?us-ascii?Q?lEu+6FCrtZ4Cff7st0N/nzy8lqh/8m1yeBI0ZaHr1PX+QD66xwfS8tN7a4dP?=
 =?us-ascii?Q?axkEP/JM1eVTsZIy2IUntZXgFiEOo37Z5dl7LoJfTmVQabi+GNqDsIFx1a3q?=
 =?us-ascii?Q?pZSyq2rN7X4jsmm2jgQ9s2lyc3oMU7oOv37glYKaM+o7zabWvDbbe5wHUWUR?=
 =?us-ascii?Q?2XgEHvSCyxdYQxh3DXyJJ0XgIHH41wxJJ5OlcUqejoOLxe02qOLxSLfy3cmg?=
 =?us-ascii?Q?cvJjjBvXloZXRKwpKB3VlkPxF/1qPn30fpNmGP60S/JOAty/IXhZd0OOs+D4?=
 =?us-ascii?Q?9EnEdEdKL2W4wogFFwkw6SVqz7gZw0tGi/5CKXJZPsApv0858jslOOa44qaZ?=
 =?us-ascii?Q?AZPS2Wi1NlbNLLSQ/24Fe+WTTZNHBJbwgF7KEvMJX9VnTratcITCU3cMTrPP?=
 =?us-ascii?Q?gEqBS/wYd9i1wwo0VpBdD9nnpo1DVk+pNf0sqEsFuv6CWVo32TXqTprA3qnB?=
 =?us-ascii?Q?NoTeeI4sQ77wzuDPgJQpdaHY+sCdZan55pmLsslA3lH3OMYJaTUPhc51dYUv?=
 =?us-ascii?Q?0ha8ym6kPEKObCVPG33umeoj9XGmj+MWJqN7vAA4KXgozzWzt1SOxJlT0040?=
 =?us-ascii?Q?1IzKBRispEmtNMmvsIpF2BK8YcWFVxzGRVb0fyNI3D8Bb3kDm6u2YDtisMq1?=
 =?us-ascii?Q?MBvg7BRonc+H0bZ3SUpznLzig1oaKjZnn+VgPQHCqzotirUWhl0i5ufKgapf?=
 =?us-ascii?Q?oR3VrTkYAcj1jVIhF5xUPfqqCAdmRjpcHnkgWz5wloK7VttQvjeVdZI+aZdK?=
 =?us-ascii?Q?8q5f0L0/kHMfT2MJdIR57knL06P1NFZEGvrLS1xSl1ICw62Ch/d77p6Sze6X?=
 =?us-ascii?Q?thhrCWD6LfW3K52nyi2Nuj88WzqGNmOPkMakqZ5p/UfaCtmEXpWr7lka6EkM?=
 =?us-ascii?Q?ow/lAZEYKNADzAZZzNoxqT6AcAR1cIavgodz6Qw2Qc1AaTLHI/XtEHUtwzwV?=
 =?us-ascii?Q?OnWZPoTZIpsjP+h3PYozs7RjtryikBDMU23NTbhkibwTnJSMcOTDUUQ2JrIW?=
 =?us-ascii?Q?NuTtoZ10q1kVvMJPjaAJ/npv5c89etZFgjfaxSssgAR5+ywGZ/ekmx7Xithd?=
 =?us-ascii?Q?QqY1OuGIdA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0496a512-7494-4f5b-5185-08dede60b6b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 08:53:29.6441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /pX62zmijOQ19RJHVB9ZqzAldpbkWscvX9uym7I+ztOpYadV3/zkppxehtC5WFyfLReocT7TLcic7YvfCKgyNfvO4hbjmWzojxGRhS349U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16355
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35016-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sashiko.dev:url,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85B77738BED

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 09 July 2026 20:29
> Subject: [PATCH v19 08/12] mmc: renesas_sdhi: Add RZ/G3L SDHI support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The RZ/G3L SoC (r9a08g046) has an SDHI controller with several difference=
s from existing platforms,
> requiring dedicated handling.
>=20
> Utilise the TMIO_MMC_HWADJ flag to identify controllers that carry a seco=
nd hardware adjustment register
> (SDm_SCC_HWADJ2 at offset 0x010).
> When both TMIO_MMC_TUNING_DELAY and TMIO_MMC_HWADJ are set,
> renesas_sdhi_set_hw_adjustment_delay() additionally programs HWADJ2 with =
0x3FFF at 3.3 V and 0xFF at 1.8
> V. A new RZG3L_SDHI_SCC_HWADJ4 register (offset 0x022) is also cleared at=
 the start of tuning when
> TMIO_MMC_INTERNAL_DIVIDER is set.
>=20
> Add a new version constant SDHI_VER_RZ_G3L_SDMMC (0xce10) and extend
> renesas_sdhi_sdbuf_width() to handle it alongside the existing Gen3 varia=
nts.
>=20
> Introduce of_data_rzg3l with RZ/G3L-specific parameters: a wider clk_mask=
 of 0x200000200, a max_divider
> of 2048 (reflecting the 11-bit divider), a dedicated rzg3l_scc_taps table=
, and all relevant tmio_flags,
> including TMIO_MMC_INTERNAL_DIVIDER and TMIO_MMC_HWADJ. Wire it to a new =
of_rzg3l_compatible entry using
> sdhi_quirks_rzg3l (which sets fixed_addr_mode), and register the "renesas=
,sdhi-r9a08g046" compatible
> string in the OF match table.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18->v19:
>  * Update commit description.
>  * Updated handling for clk divider.
>  * Renamed TMIO_MMC_HWADJ2->TMIO_MMC_HWADJ to make it generic for
>    hardware tuning delays
>  * Dropped duplicate SH_MOBILE_SDHI_SCC_TMPPORT2 macro
> v18:
>  * New patch.
> ---
>  drivers/mmc/host/renesas_sdhi_core.c          | 28 ++++++++++++--
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 37 +++++++++++++++++++
>  include/linux/platform_data/tmio.h            |  3 ++
>  3 files changed, 64 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 6ec8dc96b581..c4908c09d89d 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -59,6 +59,7 @@
>  #define SDHI_VER_GEN2_SDR104	0xcb0d
>  #define SDHI_VER_GEN3_SD	0xcc10
>  #define SDHI_VER_GEN3_SDMMC	0xcd10
> +#define SDHI_VER_RZ_G3L_SDMMC	0xce10
>=20
>  #define SDHI_GEN3_MMC0_ADDR	0xee140000
>=20
> @@ -79,6 +80,7 @@ static void renesas_sdhi_sdbuf_width(struct tmio_mmc_ho=
st *host, int width)
>  		break;
>  	case SDHI_VER_GEN3_SD:
>  	case SDHI_VER_GEN3_SDMMC:
> +	case SDHI_VER_RZ_G3L_SDMMC:
>  		if (width =3D=3D 64)
>  			val =3D HOST_MODE_GEN3_64BIT;
>  		else if (width =3D=3D 32)
> @@ -234,7 +236,14 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_h=
ost *host,
>  	}
>=20
>  	clock =3D clk & CLK_CTL_DIV_MASK;
> -	if (clock !=3D CLK_CTL_DIV_MASK)
> +	if (host->pdata->max_divider !=3D SDHI_MAX_DIVIDER_DEFAULT) {
> +		u64 tmp;
> +
> +		tmp =3D FIELD_GET(GENMASK(9, 8), clk);
> +		clock |=3D FIELD_PREP(GENMASK(17, 16), tmp);
> +	}
> +

> +	if ((clock & CLK_CTL_DIV_MASK) !=3D CLK_CTL_DIV_MASK)
>  		host->mmc->actual_clock /=3D (1 << (ffs(clock) + 1));

There is some issue with the logic here as pointed out by sashiko[1].
Will fix it in next version.

[1]
https://sashiko.dev/#/patchset/20260709192916.630794-1-biju.das.jz%40bp.ren=
esas.com

Cheers,
Biju

>=20
>  	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock); @@ -273,12 +282,14 @=
@ static int
> renesas_sdhi_card_busy(struct mmc_host *mmc)
>  #define SH_MOBILE_SDHI_SCC_RVSCNTL	0x008
>  #define SH_MOBILE_SDHI_SCC_RVSREQ	0x00A
>  #define SH_MOBILE_SDHI_SCC_SMPCMP       0x00C
> -#define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E
> +#define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E /* G3L: SDm_SCC_HS400MODE1 */
> +#define RZG3L_SDHI_SCC_HWADJ2		0x010
>  #define SH_MOBILE_SDHI_SCC_TMPPORT3	0x014
>  #define SH_MOBILE_SDHI_SCC_TMPPORT4	0x016
>  #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018
>  #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A
>  #define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C
> +#define RZG3L_SDHI_SCC_HWADJ4		0x022
>=20
>  #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
>  #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT	16
> @@ -328,14 +339,20 @@ static inline void sd_scc_write32(struct tmio_mmc_h=
ost *host,  static void
> renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *host)  {
>  	struct renesas_sdhi *priv =3D host_to_priv(host);
> +	bool hwadj2 =3D host->pdata->flags & TMIO_MMC_HWADJ;
>=20
>  	if (!(host->pdata->flags & TMIO_MMC_TUNING_DELAY))
>  		return;
>=20
> -	if (host->mmc->ios.signal_voltage =3D=3D MMC_SIGNAL_VOLTAGE_330)
> +	if (host->mmc->ios.signal_voltage =3D=3D MMC_SIGNAL_VOLTAGE_330) {
>  		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x0);
> -	else
> +		if (hwadj2)
> +			sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ2, 0x3FFF);
> +	} else {
>  		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x1);
> +		if (hwadj2)
> +			sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ2, 0xFF);
> +	}
>  }
>=20
>  static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc=
, @@ -401,6 +418,9 @@ static
> unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
>=20
>  	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
>=20
> +	if (host->pdata->flags & TMIO_MMC_HWADJ)
> +		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ4, 0x0);
> +
>  	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
>  			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 8476678d47a6..e78dbcb6c887 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -88,6 +88,13 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] =
=3D {
>  	},
>  };
>=20
> +static struct renesas_sdhi_scc rzg3l_scc_taps[] =3D {
> +	{
> +		.clk_rate =3D 0,
> +		.tap =3D 0x00000300,
> +	},
> +};
> +
>  static const struct renesas_sdhi_of_data of_data_rza2 =3D {
>  	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
>  			  TMIO_MMC_HAVE_CBSY,
> @@ -161,6 +168,26 @@ static const struct renesas_sdhi_of_data of_data_rz_=
g2l =3D {
>  	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
> +static const struct renesas_sdhi_of_data of_data_rzg3l =3D {
> +	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> +			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
> +			  TMIO_MMC_64BIT_DATA_PORT | TMIO_MMC_TUNING_DELAY |
> +			  TMIO_MMC_INTERNAL_DIVIDER | TMIO_MMC_HWADJ,
> +	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> +			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
> +	.capabilities2	=3D MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
> +	.bus_shift	=3D 2,
> +	.scc_offset	=3D 0x1000,
> +	.taps		=3D rzg3l_scc_taps,
> +	.taps_num	=3D ARRAY_SIZE(rzg3l_scc_taps),
> +	/* DMAC can handle 32bit blk count but only 1 segment */
> +	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
> +	.max_segs	=3D 1,
> +	.sdhi_flags	=3D SDHI_FLAG_NEED_CLKH_FALLBACK,
> +	.clk_mask	=3D 0x200000200,
> +	.max_divider	=3D 2048,
> +};
> +
>  static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] =3D {
>  	{ 3,  3,  3,  3,  3,  3,  3,  4,  4,  5,  6,  7,  8,  9, 10, 15,
>  	 16, 16, 16, 16, 16, 16, 17, 18, 18, 19, 20, 21, 22, 23, 24, 25 }, @@ -=
241,6 +268,10 @@ static
> const struct renesas_sdhi_quirks sdhi_quirks_rzg2l =3D {
>  	.hs400_disabled =3D true,
>  };
>=20
> +static const struct renesas_sdhi_quirks sdhi_quirks_rzg3l =3D {
> +	.fixed_addr_mode =3D true,
> +};
> +
>  /*
>   * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of=
 now.
>   * So, we want to treat them equally and only have a match for ES1.2 to =
enforce @@ -300,6 +331,11 @@
> static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible =
=3D {
>  	.quirks =3D &sdhi_quirks_fixed_addr,
>  };
>=20
> +static const struct renesas_sdhi_of_data_with_quirks of_rzg3l_compatible=
 =3D {
> +	.of_data =3D &of_data_rzg3l,
> +	.quirks =3D &sdhi_quirks_rzg3l,
> +};
> +
>  static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] =
=3D {
>  	{ .compatible =3D "renesas,sdhi-r7s9210", .data =3D &of_rza2_compatible=
, },
>  	{ .compatible =3D "renesas,sdhi-mmc-r8a77470", .data =3D &of_rcar_gen3_=
compatible, }, @@ -313,6 +349,7
> @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[]=
 =3D {
>  	{ .compatible =3D "renesas,sdhi-r8a77990", .data =3D &of_r8a77990_compa=
tible, },
>  	{ .compatible =3D "renesas,sdhi-r8a77995", .data =3D &of_rcar_gen3_nohs=
400_compatible, },
>  	{ .compatible =3D "renesas,sdhi-r8a779md", .data =3D &of_rcar_gen3_nohs=
400_compatible, },
> +	{ .compatible =3D "renesas,sdhi-r9a08g046", .data =3D
> +&of_rzg3l_compatible, },
>  	{ .compatible =3D "renesas,sdhi-r9a09g011", .data =3D &of_rzg2l_compati=
ble, },
>  	{ .compatible =3D "renesas,sdhi-r9a09g057", .data =3D &of_rzg2l_compati=
ble, },
>  	{ .compatible =3D "renesas,rzg2l-sdhi", .data =3D &of_rzg2l_compatible,=
 }, diff --git
> a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
> index 6c512e96e192..e6663cc736be 100644
> --- a/include/linux/platform_data/tmio.h
> +++ b/include/linux/platform_data/tmio.h
> @@ -56,6 +56,9 @@
>  /* Some controllers have internal divider */
>  #define TMIO_MMC_INTERNAL_DIVIDER	BIT(14)
>=20
> +/* Some controllers have hw adjustment delay */
> +#define TMIO_MMC_HWADJ			BIT(15)
> +
>  struct tmio_mmc_data {
>  	void				*chan_priv_tx;
>  	void				*chan_priv_rx;
> --
> 2.43.0


