Return-Path: <linux-renesas-soc+bounces-34805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xwOJJ/ToTGrIrwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 13:54:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6371B207
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 13:54:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=VJ3DCVBu;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEA9F30BC75B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 11:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3AB3FB042;
	Tue,  7 Jul 2026 11:49:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E502FB969;
	Tue,  7 Jul 2026 11:49:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424989; cv=fail; b=Wxdn0l6ho1eGRvW8tzjjoHu82sOi42XenRao1/ho3sTFa5fNWGR6anmhlEB6pABJBHBVklkVX8NLOX405K2HaRnWymgYgGQDLi41pdh3jxDbB9GfJW5/YgOQ8bx6e3Cp+t56e9/Ag4y2tsFP10iI3Ixc6h1O2oZGNqyJ2+r2FkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424989; c=relaxed/simple;
	bh=6PK2dvga3naiAmi5VAfjnqiiHHO/KW/j119JoMGO5kc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=arRsShiJ9DCztJy4v7FeRv8Oxu+cSlaoOQzgd5HSg05WAID3SHuJaStAM45SzUJwaDvEpvPU9fHDMipq+gwoQyNRxBcZTRr92iYsew59/Q1YgByS/TbX2CNRsYJJt4ymUooci/tRr4P1+qXjyO1R1s8oc1b9C9zcawg7sWKSjlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VJ3DCVBu; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvbyu8rWMvreZdITEs4O/MTIQ925dYS+LySUX5F+ghxz8UbP/QWjB6mF/TPsD9yDZ00R+dB5Q6mWG/tZBUcDFZ86ZWx8x+wMC1MtU+r2xqLCl+gSUt7QLrVt0LH34ZkexbUVe5hI6xMya19i26M4YAOXD2PPv5yeG59KmGEiA3pExnjN4jgKoAXor4CfQ5LLCp5vbgJgOFvdAt+WNTDU1y3Xi5NTEut71HtSuAFbomyOoa8Wnczfeen0yS6G9B3KKrnVPLZ0wxfTmCBknVWtQHwBVfNFLvJvNv2xnXoB/iIyvcbU4H6ynji/hdIhBZTIFojSd7jsfvdHXmPl/Mbs+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXvo3gr1Skp6oGjxDrvn/SjGA3BZmaMTj2F6MBHpJsg=;
 b=xpxfEzhS8LZ/PPZrT03nQe2vmZDcU2aZK1vXgElPJ17buSljGbEjKE6adOp/7byMKt3LLwcjniz3/lDa7vZToyA5XFANtr5FzBe62lGfI1LVTdWKcTPIiqbV2Vb3ROCejCahiHlEKxv50aFy+zwhACDlrtF01CoxcO8ovckSJ5jtkmEbKqYsl0pDYKA/UbiP4xVCJztpNP+fdUp2Rybk60WtHTfxM0b1MLd89toEr5nbzTcoolQFbjI4nscchgFrtl1DHQ6/Ht/nabVXB6aIqXOBV06gADttRV2RttrN0sB5hO9ED12bP0q3gi8Dd/Q58vmoYRzmfVwbBAzOf7we0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXvo3gr1Skp6oGjxDrvn/SjGA3BZmaMTj2F6MBHpJsg=;
 b=VJ3DCVBuPklRJQFBYKEAq2LFlwkvxe7bAg4fl31wEvcC8Au6tdzHACWYXU9GAj0npNFjQwXwjYcxXZVlCALpkWm8+BJtQltoWVv03Y0LNfzNVEZ81JnOYLY5tbE/xxrCir0A48fv7PkIeFe17LXyaMzaCa0Rn63jaMKofrvLfH4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB12372.jpnprd01.prod.outlook.com (2603:1096:604:2e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 11:49:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 11:49:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v18 06/12] mmc: renesas_sdhi: Add
 TMIO_MMC_INTERNAL_DIVIDER flag
Thread-Topic: [PATCH v18 06/12] mmc: renesas_sdhi: Add
 TMIO_MMC_INTERNAL_DIVIDER flag
Thread-Index: AQHdAl+ukFlVjUjX+EiPQo3upCHJZbZiCCPA
Date: Tue, 7 Jul 2026 11:49:44 +0000
Message-ID:
 <TY3PR01MB11346F5057FB697FA68024A8F86F02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
 <20260622155610.184271-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260622155610.184271-7-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB12372:EE_
x-ms-office365-filtering-correlation-id: 4d6e0f22-57c1-4cfd-95cf-08dedc1dd684
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|38070700021|18002099003|22082099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 zQB/it8Ev37C+DGZ+JhGY5oCeSVz0nQP8LcjwQkWu174glJKux1raqRsfgyATdM0UXuWUiIsN/D5h/Hlz1gtXsaLhHPS8cOtWOkNcxigQ3cyNqnFU7vqwASVwuEL7C2cqI37nWG+1YomAdib0hCHoo78JW/c79tglO2Dn0MKSmQoJ6i0SP9Mx/ssmlSUTTAPmsVEboTb9EXs8UdXUUSroKK7oY3kPzxkKtqb7cxiWt7peS/GPnzHPU0RqhqKDa3HYo3gDDepwfsHBGnqTF/O4COCoXriO85IPzxEP++vdnOjRsDHJJQhCjVjEnjAt7uKzx3QUa2cSOFKI/I83g/G3iJZi6TaP2sz9UXxEdT9V2/vED44CM9I64JQukM4qBtXNdKvaL+wkbMkHvdNbBA9egcSIvyHsuGWUtoJUtInNqZO1cwYcfBff3NOS+sY45VAGNq/68zkYjPGAQmKISGM0RmjChzMnhZ9ctRzStqcNYXi/khdlGQRHg8VmGYjCrr4g1EUQGD21mKcWGcuAH/W/l9lR/pVGLrMvr8nIAGcXz3WfNOiWqLDh04WgSRS2oJwzmnZl5CY8P4SUY1dWFlTAxGPWwXsjd7SQyov/h5/ZGFj0pcIE/ZXx0/CYNL7lJzdu0hSUgCulB864S7IWmitmIk9Wuypyp7z7CGMmq35MtE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KNS+ppZm+WLDR5Nz3oIY9Ashi8VkeFxVRcw52zgDXIsW75wyBByITk/zdCd3?=
 =?us-ascii?Q?ma1yWD9F755+L4Z2kwPJQW07tktJa6FHkEgSxrD72x4tXdi5XnwDmRLwgMf4?=
 =?us-ascii?Q?J/rET9ckqc1+m92N1Z0mvB7B0/cGBAxztx/b3/LlPzPiGC0aa9ZUv3l/xdM1?=
 =?us-ascii?Q?FJpsxEj7JNGtiKdYqE7Z5UJSsE2iMA0vZ7neaZtjUhZGa4AJCq8xbj46x0Qd?=
 =?us-ascii?Q?mCn3sNQy/PFc9Am1ln5MfCutDYnCx5m9qvaQtX1wJYrmson9pG2BCHLdHxI6?=
 =?us-ascii?Q?MMuxZv6lv4AzZAcnUKNZk/rQV766TfJunTvTCUVsAuJfeeHc4KMmMs+cefxY?=
 =?us-ascii?Q?Hm/L7dQGGb2cOiPpwFdwT30imNjTKxmj8GCpH5Q0q07fuqKOt6a+h9fVFv6e?=
 =?us-ascii?Q?Cf8s12ESqMezVHheybQLbxoVbxywIJdh8qTgMB7dGHb0BmxBoqpmdhaBiG4I?=
 =?us-ascii?Q?YfIM2x0wwoT396Y93gD2NL7IcIMWQLJTYkFesfOI6j/Y5dVAKp5/KawvPF2d?=
 =?us-ascii?Q?TPGL5bdWS+Hom1Spjlfe13xngaxLx6dEyLbbd4QJOd08TTcVTm3Y0NlcdOG6?=
 =?us-ascii?Q?pOpg0m+beHtCu9GLikAqjmIuDo1MhJ9Fabmbj98W8FyBEjQ9EkmAxWKwBx21?=
 =?us-ascii?Q?6IUKzdbA+pzgIe8Zu9Jp8AnSNSh+UQzmD/1zZmAtZjvRa7OMrRpO+570jzY3?=
 =?us-ascii?Q?bTByvC1c6sZ3s12Bl+fCoIGqC/MhLPQSTNcHqvBLIv7qXTBnbmxL5pL/CAEH?=
 =?us-ascii?Q?kTyZHqb9qHlXR+0n1VYtZFWegCNXnVs1PSmiHOEJtecaPjGoKheF4a6aQgAd?=
 =?us-ascii?Q?RcZx5uKkiMwYw0TZ/ois5QGjdRCNyaGfEwpwRU94TD6V6TZKQyaP+yP6gq+M?=
 =?us-ascii?Q?oLUw6qCm2R1o5kyvgB8ToYygIIeBBXQrBTIq1EEK145zVXN8u0IgVON5uJBs?=
 =?us-ascii?Q?N8ybTx3wHgygcqy0jyQGhp6h1AGEnDJYTuVS+fag1/0D7PpqfPPdFvcIa+Ty?=
 =?us-ascii?Q?ArLsSH76hhFEYx8vypps/APeJpw5p6KxK1Xg0OsajF0BpjDM5N66OXY1eZWz?=
 =?us-ascii?Q?l9ddgNpw/DFt/gfpph0wkX0Ehvoe2UriRyaYWcdyoYSZ0v5ixI46AHqFgUtB?=
 =?us-ascii?Q?btCnxsytvMTFXEusTUBfQzFb4TFWJnGt1cQKsNpieTL9GLhZnP8uPfbHhrUm?=
 =?us-ascii?Q?fR3NWZE1AlOpFvXF/q95REJsKy5vf0R9eOlZIBrQjcTZcKNE3soE8ner7Oak?=
 =?us-ascii?Q?o7ce+FgnQkcuTAZ/VDb0cLYazVyt4HxxioHEHpvoUG92315HZses0oIGrt4B?=
 =?us-ascii?Q?CWgUqbfmdWYJ4YRbpZf5UPgmnhrecfA3u1dW2qes13iWSLTNDClDcAAex0oN?=
 =?us-ascii?Q?dVye9vsxznhLez2nALHtCnkUkCgYWNXqNbLF0TsrLHZjxFUOql1Hwxj0RBdZ?=
 =?us-ascii?Q?MbFziD30FKymh9G/L5rGUj5wn6LDI3vnCjpj4xuSZ/tuSrb/z9s9sfPES7ZV?=
 =?us-ascii?Q?jbz2DXZiKuOmwRxTu4EuOz/KuYlMJ1iOYTDyEsKQkTEhspWLtfEjun2wQ4Ws?=
 =?us-ascii?Q?67VInrT7i+H9aAAkfsvzP9bwApfhQHfUvJbUlFx/9fCaJHm9NKeRxwjKz0WI?=
 =?us-ascii?Q?dmHmr40aLACjdcUlSiddN8ErlzR2p9Ai5RsJVr+g4fgoXMX8Sn4a145YI2La?=
 =?us-ascii?Q?91anSQrr1cYca89JGNctrIY4Bftgb1iLRODnQ+k99kKw4ba+Tx3/xJKbdY5e?=
 =?us-ascii?Q?mQtoLwDzlw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6e0f22-57c1-4cfd-95cf-08dedc1dd684
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 11:49:44.3921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NTtTmQIkAcJcVKNiuasq6jk11nWacXxp2WKfaIgXRjJPsa8rfxMJ6kv6c9VTKdi8Yn3j82e7EJIbIHckPL2NVCUvMKd7yIOE6IiX0USkmSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12372
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34805-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4F6371B207

Hi Wolfram,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 22 June 2026 16:56
> Subject: [PATCH v18 06/12] mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVID=
ER flag
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The RZ/G3L SoC has an internal clock divider active for all modes except =
HS400. To compensate, the rate
> requested from clk_set_rate() for clk relative to clkh must be doubled in=
 those cases so that the SoC's
> internal /2 divider brings the actual card clock back to the intended rat=
e.
>=20
> Introduce a TMIO_MMC_INTERNAL_DIVIDER flag (bit 14) in tmio.h and a divid=
er field in struct renesas_sdhi.
> During probe, when the flag is set and the device tree does not include t=
he mmc-hs400-1_8v property,
> priv->divider is set to 2; otherwise it defaults to 1. The divider is
> applied in renesas_sdhi_clk_update() when computing the rate for
> priv->clk, replacing the previously implicit multiply-by-1.
>=20
> No existing platform sets TMIO_MMC_INTERNAL_DIVIDER; this patch introduce=
s the infrastructure only, with
> no functional change for current platforms.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18:
>  * New patch using flag.
> ---
>  drivers/mmc/host/renesas_sdhi.h      | 2 ++
>  drivers/mmc/host/renesas_sdhi_core.c | 8 +++++++-
>  include/linux/platform_data/tmio.h   | 3 +++
>  3 files changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h index
> 438b2a7afe76..6f6b41fbe91e 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -102,6 +102,8 @@ struct renesas_sdhi {
>  	struct reset_control *rstc;
>  	struct tmio_mmc_host *host;
>  	struct regulator_dev *rdev;
> +
> +	unsigned int divider;
>  };
>=20
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index e9767aa83b00..8890859d0777 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -185,7 +185,7 @@ static unsigned int renesas_sdhi_clk_update(struct tm=
io_mmc_host *host,
>  	clk_set_rate(ref_clk, best_freq);
>=20
>  	if (priv->clkh)
> -		clk_set_rate(priv->clk, best_freq >> clkh_shift);
> +		clk_set_rate(priv->clk, (best_freq >> clkh_shift) * priv->divider);

As sashiko pointer out [1]

priv->divider is not required, if we calculate clkh_shift for the HS400 cas=
e(internal 1/2 Divider) and
non-HS400 case

[1] https://sashiko.dev/#/patchset/20260622155610.184271-1-biju.das.jz%40bp=
.renesas.com

Cheers,
Biju

>=20
>  	return clk_get_rate(priv->clk);
>  }
> @@ -1231,6 +1231,12 @@ int renesas_sdhi_probe(struct platform_device *pde=
v,
>=20
>  	dev_pm_domain_start(&pdev->dev);
>=20
> +	if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) &&
> +	    !device_property_read_bool(dev, "mmc-hs400-1_8v"))
> +		priv->divider =3D 2;
> +	else
> +		priv->divider =3D 1;
> +
>  	ret =3D renesas_sdhi_clk_enable(host);
>  	if (ret)
>  		return ret;
> diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_=
data/tmio.h
> index 868a21842fa5..6c512e96e192 100644
> --- a/include/linux/platform_data/tmio.h
> +++ b/include/linux/platform_data/tmio.h
> @@ -53,6 +53,9 @@
>  /* Some controllers have tuning delay */
>  #define TMIO_MMC_TUNING_DELAY		BIT(13)
>=20
> +/* Some controllers have internal divider */
> +#define TMIO_MMC_INTERNAL_DIVIDER	BIT(14)
> +
>  struct tmio_mmc_data {
>  	void				*chan_priv_tx;
>  	void				*chan_priv_rx;
> --
> 2.43.0


