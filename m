Return-Path: <linux-renesas-soc+bounces-33055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPRgNxALE2rb6gYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 16:28:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 742BF5C2AD9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 16:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1C5930022DD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 14:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B40392C47;
	Sun, 24 May 2026 14:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="m2icJyUA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B5A21D00A;
	Sun, 24 May 2026 14:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779632910; cv=fail; b=defnwEQgg74f52onO/9zh0vSdn8YEJhYnewZBFUnBS81DhyT+sw7rjoriJzOEMC++6MEJMX1fbMjRpaLe2v/0jQ2j/BbcCKOBE2ohx8SA3V/wM99J+h8wx8Cbwp1oXIuFjQgzbj3NgeFhcbiL7O0EHheE70Pkg4nDuUeKtgc2XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779632910; c=relaxed/simple;
	bh=+mnRtdd6+5ZiL6qZPPE3DtoNW59vwFChHzs8MtVGXyg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oAa2MWgYbCqWbuHqhRD2Gdlnxi9n8CLrUKPJrEBWrpFIhD7/pqZeyj+0PJNglOLw5FzJLmvEt9QDqhxObtqLgT1PGm0/IBMd1E9Hj0Xi2YXyBNpc23CZfTJPr6l+EznGHQb0xD39q7XF44A1fEEh7anLGGqSNmLcjGQWAuH5a3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=m2icJyUA; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeTunkjfIKTrYnQo6addvRmjI+bWKl5AuRac9MQZp5U40dGkBNbkPXI17yuTVJMq6LrqcdIaX26u8t58bwCG7dJ8lRDL1+8AXqniuZyqgCHG8e+6afPe4P474E7FHeruHXSMrfedGWEuyRPedKTspxrzaKVW8Z4J22RpP6vkFjS/Y2QkI7YNCrfqV7zdMJQqiIUx8hyT10d8Y+QcZ76HuoYEEb3MGt6kDFOwdmddP7dDMAAVjLZ6trF8RqtuBSWUVzvlAq8hZX3srsP/xfewYCIhADpwKi7I4/tsb7GTWYGs9X++4ktxP7zPSxpG6JVhkTRE72kD5RIcYXqKuKq+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yZZY+elbJWbghNVRc9lV0/l/QqfLpAgD/+lZ8ZlfHU=;
 b=ZiHcwGUS8Mz+uTiREOhCrN6Oajz8U2NUF5VMJ7x7dgDv2/piUc/k8a7Fv/+F292NGmnQHsxB23w0BRwb4Gwd5K57EyutgSIeR9RB4+3VapKRVc8ko2J15sjjHu4EC0uPCaH2xK8Qbm9kAKPhSNDxFQbcniO3SiBQXbQP8km7eeeTajXMhwbCr4Y0HiNKcFIeR24uGKJg2Gr1N9jH71VwQn2TeXVN44SEUdn28eUN9/1cinAt+XQwA5fUigGjRCUFMPjGwSuRpqhuCAcYhoYtDIQ9r05aObvzAEgRc76nAO9jkGwTQPSDAK1udVKCgKb7Uk3hcmpEEnbtFG02eAe2BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yZZY+elbJWbghNVRc9lV0/l/QqfLpAgD/+lZ8ZlfHU=;
 b=m2icJyUA9Ez7XVpr32wmGka1GHP553s9PB2hXMYEX3GaIrbVOO3CwG3s6vtz80Cpik7UErM/Jgf1p/gug07FBgX8b0QOLLZjdVDwU+qtfo/KFhnop7bJOryiSD2gc7DFgjh5/gSmap8A8Sb+M5PhRHpThlO87cgp1SXKsjKrP+c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12697.jpnprd01.prod.outlook.com (2603:1096:405:1b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:28:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 14:28:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
Thread-Index: AQHc54F0N31V6fbiPkmyIxeaQ1X46LYdQ9nA
Date: Sun, 24 May 2026 14:28:20 +0000
Message-ID:
 <TY3PR01MB11346184DFE4986B5728406FD860D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
 <20260519111958.233194-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519111958.233194-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12697:EE_
x-ms-office365-filtering-correlation-id: 35535d85-0a47-4f17-40a8-08deb9a0b493
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003|11063799006|4143699003;
x-microsoft-antispam-message-info:
 CFPYFtKdrlm7bkhgXEtBLXmmmKRFM3DvrHuBkVPquzDSYgQ4uU2o7qH2Uok09SEx/xhNC2tB9eBjyMKW9IZ+GlkFOn77uTzYncUSz1shAGsVNyN/m5AclC2ZGIAT0BDVALMA6Q545hxkb5SqeB2B1ioYjO3eJJQJZUGoqFzfiRt4SbPigmNuNjYFknyfFqATVFvV/P4D5CZpRb9cpUovFq5qqyL4El8RJuzW37nv5svf1HniT0Fl/rIj4rYdjJ29RyFU2QmEvrwle6BRSrpBhSPBwkniPEKmxMpF6bNhp0wFu+HtRjg/WX+joqrBe0jIRLtN35P0Y7HSKfDnkETNr6eaFEzWjc+mgkNg5IofTHnGN9IkVaeCiSm5vpP/Jxzo2cghq1QCYp/UskRciEIosD4c7ifjQxH+m+qC21A34ZAGrqDnuzita1MQmlOsPERNG9hyaAYJYLdmL/eU28E2e2jNBwBAPv7MIqjeLfFpkpu4LZT1tfM7UOh7ccEbrvxLuea7oFRqlm4Q8wUwlu9L4Yhb336E8yisSt1PQMViVGNWP2+PacgOlavTimEh9M1NHkSvtK7pEITd3l/MslyNrdyum7oq3TzaISMNgE59ZV/rNajErYEgEOP92wTA3z7nsjRhHIRwId+PFz+pJGidV40JTgzQIJfwC3mlO2w/FirDqQ6Mvf7sX2tyDRl/PDMb7qBIZkiI15Ih45zUBviMfRDC1+NaYC4s2ay5f0LvIMNCkU+bQSwSUmJgpvTC3FtI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bOgb3QfWE1Sg1johbHBlAGSM1Dr1T49Owhn3CIxPX0H8HVCAAfsIhN+wWepS?=
 =?us-ascii?Q?jg4TcPedjvYr5tx9FNl7BCBPHalnSfVkI3VjTg9A2teAbamjILkDk4LEeIBr?=
 =?us-ascii?Q?yc20+41vveBvugrXUpxdhbVZcuqrT7LLlCp8Ae+auhVsvsenhWZQ950B/MJ+?=
 =?us-ascii?Q?EXMULpu0vO6WQi+vVIYyxWa7aAn3fJnGATRKqPr+LFcQiQ41a0qrRhmgwSEe?=
 =?us-ascii?Q?9jG9qRWDjR1NBfvJnNourscP/4DV4sTKrlYqx15IlYb9y1mreBynIlErYenJ?=
 =?us-ascii?Q?0Lc0/5kQcJgGuyaTGKomea8Pk8TTwbafKZTqlXO5DnvOU8dO1PhtQqYk9xCn?=
 =?us-ascii?Q?ky0D4lIz/9WSlc+hP38gu4tiKKfY8QqJFCnicbDiXsWGNFO4VrmRCf1DfO6S?=
 =?us-ascii?Q?XFckdKaqS494OqrvnUZdN03I+xxUGncwEH2H01DPZJvrl4S+hrIPDVRyf/Dj?=
 =?us-ascii?Q?WLKs91am4yq67VvV/VXWwKBYJNqDT09jePgKt1fUXLjZMDV0hzlkdN+Fi5cU?=
 =?us-ascii?Q?2eBunjlBAZe4ukobFdndmfcUmcnagMuc2g9Jj5NLvtuPQdysgi00+voI2rZj?=
 =?us-ascii?Q?QQwHaFAS616lZyyOZPrk/lHtXSyHc2bSmcz76/el3T1XO6x+3VapXKJFNf0p?=
 =?us-ascii?Q?AOQaCKU8gBiYGugiMLzSxUz2rY3p2r9TlV8+yswsLhH4GZhLMIC1M1ibE0uT?=
 =?us-ascii?Q?tAwjlo53alv1zfD6wwC0k+tofc2v81+RSQHB/DGVkxS4ypdQBdbnWgkzLGji?=
 =?us-ascii?Q?Yrkx4cKH3DcVodWwyWfcZbG45hu1qfJ8nrB5gOA1VFEVsNjG3Fcvi9yCP5x9?=
 =?us-ascii?Q?Ktm+2TaDKegbWSq4mVKzlhSDs+BAYZDzZhU1VuDWiIGBdhWjbF1KODKRx39t?=
 =?us-ascii?Q?HKCzpUdH92V8EosYbv+ZUGbrEbBfuYQlYvtFjvm88puAjud725ohdFmRAvXZ?=
 =?us-ascii?Q?/hIni6pMfSFzqR0Rb/IFNcZQc3WR1gNUBX5adFOXC6EQ4H+ZLkUPqf6GyGmG?=
 =?us-ascii?Q?GlZBKJsVFDZbM7yu9nMG6iyQBb2LI9BQFnGNycGyMIWySVgF4juVS8OH8ozG?=
 =?us-ascii?Q?WqQYyRzCHo8zqMPRMQn8UKOUjN8HbNBZZ5oI9ZslTAqXQVmty13tnHsCHdda?=
 =?us-ascii?Q?CLEsRbi3UbRVWQ1WLXwG6D1gp3QIalMetfm5qP7NSMot0PYBBu/65t4o6iWD?=
 =?us-ascii?Q?6sjQl3Q6By9+euC/rih8lbORKx74Ta2n/Jb5D+Dtbx3uKjAXlDfZ0B9gDZTN?=
 =?us-ascii?Q?hvCWJW/lgb2SIs1SiHuEwuGjptFdv+WkkXnBnmJAATJzAFShGfA4r1Lm4xzo?=
 =?us-ascii?Q?umtxAx4io5D0xRGlE2uD7GbZ+4veUdAhB1J3CYk8xyJ5GZywwDkUew9NpePU?=
 =?us-ascii?Q?NtSllFKM7h5eTN0ndwb36Twr8ZpI9xmJv/Cl6o9z4nqQreiLJT/6sMVvOz0B?=
 =?us-ascii?Q?UU3gHUMPdav33mhO20082PSCT1x+ikTBLitvOOTHwLt+2u4vYYLIGyvRzgoX?=
 =?us-ascii?Q?PezShr9SUVBrWuJ7ose7bYdHRRuhZY3h0+02fKtBQ0e7fpTsDCAvmoDTGpCj?=
 =?us-ascii?Q?sVUUjRmbVrLL4HkTYvW0iX+iCjDCtZSJMvXOayVXobpNF0mAqyBZ9CgTmMn6?=
 =?us-ascii?Q?u7W4wvc1k0VwF2nSHF6qlSKJvJtsjyFDthiascpqV1YNgnIpZ5BDmJAMlU67?=
 =?us-ascii?Q?emn1xcV783wHn0zaa2rmILek93S56S6xOwu3f9JkP+itmTF6CISgRLyxQQTU?=
 =?us-ascii?Q?LIs1URojnA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 35535d85-0a47-4f17-40a8-08deb9a0b493
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2026 14:28:20.8163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FqmxfJNaHZ4a10CMJzY1u0/cAWBaG6cKusXCjJJy3RwLt1cbFwOjil+Q6sUMO2ddSjcyicaExZDL7pg8MK8TIoUyPPQuAjYa88m6nJUbO6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12697
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33055-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,100e9000:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 742BF5C2AD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 19 May 2026 12:20
> Subject: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add device tree nodes for the three RSPI channels on the RZ/G3L
> (R9A08G046) SoC.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 72 ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index a53d579eaad2..1fc409ebdd44 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -442,6 +442,78 @@ rsci3: serial@100f3000 {
>  			status =3D "disabled";
>  		};
>=20
> +		rspi0: spi@100b0000 {
> +			compatible =3D "renesas,r9a08g046-rspi";
> +			reg =3D <0 0x100b0000 0 0x400>;

The size is 4K, so it should be 0x1000, same for othe nodes.

Cheers,
Biju

> +			interrupts =3D <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 442 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 443 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 444 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "idle", "error", "end", "rx", "tx";
> +			clocks =3D <&cpg CPG_MOD R9A08G046_RSPI0_PCLK>,
> +				 <&cpg CPG_MOD R9A08G046_RSPI0_TCLK>;
> +			clock-names =3D "pclk", "tclk";
> +			resets =3D <&cpg R9A08G046_RSPI0_PRESETN>,
> +				 <&cpg R9A08G046_RSPI0_TRESETN>;
> +			reset-names =3D "presetn", "tresetn";
> +			dmas =3D <&dmac 0x26f2>, <&dmac 0x26f1>;
> +			dma-names =3D "rx", "tx";
> +			power-domains =3D <&cpg>;
> +			num-cs =3D <1>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		rspi1: spi@100e9000 {
> +			compatible =3D "renesas,r9a08g046-rspi";
> +			reg =3D <0 0x100e9000 0 0x400>;
> +			interrupts =3D <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 447 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "idle", "error", "end", "rx", "tx";
> +			clocks =3D <&cpg CPG_MOD R9A08G046_RSPI1_PCLK>,
> +				 <&cpg CPG_MOD R9A08G046_RSPI1_TCLK>;
> +			clock-names =3D "pclk", "tclk";
> +			resets =3D <&cpg R9A08G046_RSPI1_PRESETN>,
> +				 <&cpg R9A08G046_RSPI1_TRESETN>;
> +			reset-names =3D "presetn", "tresetn";
> +			dmas =3D <&dmac 0x26f6>, <&dmac 0x26f5>;
> +			dma-names =3D "rx", "tx";
> +			power-domains =3D <&cpg>;
> +			num-cs =3D <1>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		rspi2: spi@100ea000 {
> +			compatible =3D "renesas,r9a08g046-rspi";
> +			reg =3D <0 0x100ea000 0 0x400>;
> +			interrupts =3D <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 453 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 454 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "idle", "error", "end", "rx", "tx";
> +			clocks =3D <&cpg CPG_MOD R9A08G046_RSPI2_PCLK>,
> +				 <&cpg CPG_MOD R9A08G046_RSPI2_TCLK>;
> +			clock-names =3D "pclk", "tclk";
> +			resets =3D <&cpg R9A08G046_RSPI2_PRESETN>,
> +				 <&cpg R9A08G046_RSPI2_TRESETN>;
> +			reset-names =3D "presetn", "tresetn";
> +			dmas =3D <&dmac 0x26fa>, <&dmac 0x26f9>;
> +			dma-names =3D "rx", "tx";
> +			power-domains =3D <&cpg>;
> +			num-cs =3D <1>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
>  		canfd: can@100c0000 {
>  			reg =3D <0 0x100c0000 0 0x20000>;
>  			/* placeholder */
> --
> 2.43.0


