Return-Path: <linux-renesas-soc+bounces-35011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dWiCDFmvUGrB3QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:37:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B14EE7388FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:37:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=Eol2Dryb;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5831B3023D96
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 08:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7902D3F0AA8;
	Fri, 10 Jul 2026 08:36:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE783F12E3;
	Fri, 10 Jul 2026 08:36:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672618; cv=fail; b=ADa1gm5GwFnWmewMv8NPSBeCLKsxnTevrrzyYBKLERwayiCCyFSej0SOJaJAItEsCCm/nKCkDmgZcc5FmLvt3ZsyBhNAi73RuxDiR3obyj1uJmrrJ9prxYKHUhhcBMJFUH/TdLP5guq6xebXacTF9A1BxD7j+ycn4sGL3zxnbPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672618; c=relaxed/simple;
	bh=2P3fzmK84SwhjFemoWvhWqj1fT6FDXGNxuTzbhXzHGA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fJfQXk75n6AwXENpAUjDqJsc0k2SmUwIZTWPhYcZtPF5s9ck6j9PPJRtagw/w/cLCwnGzzU/eQdyCxog8y9TmMS0Lws5f1wNQhU7y18qS5zGYTKu432dstiknWm6Xi9h03e+yzclRbVnMtIqU7iMFBAiiojbTb3tXc/EPuANMOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Eol2Dryb; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n71phNUT5ft51suJmCE566DtomwPHP26Qcmns1ScI1nJyKkU1l9t2DiowpByCCxvoQXlYCGH53mAd2IYPrFW+THLPqeLyKDYLtV3AvQworZxFdCINBjDI47bgONH9rsF7oZe3cP6865pjHVjUqaHN7128sloJXGwP20V2xqzzGCIPNNIL7OHsLrelzNcGHYK5gY0E/ToEXeTtocOBhq3Xf70ur6jdBTLRHib2NyE1hrgdeaJAgZtkGJYd7zgjIQ7hxwrDFK/iFuSsTx6UmecHjc46pQfOVDlcBIneA7V7jmjsCarNQq/RLGVQG6I9+W24QPccQ+Xpwc2uMPDq3R10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/9vO9bWaIS2/KHeCn0nD9+wW/qdrjbKMgxqe6jTtaU=;
 b=HGl7Y0RMN3OkYq8WC+ZBqxgfN0pQp/O4b90+wlsnPPum8sZ2+jEN/lbyODzyNTpcSoxzXmqepHczceJvKrGuaQkoAZlEpRbpeZ8g+Vwnv8K9vtxyNNYtnEadGWgCCsGhROAhvTBy4PJz89l1GVR4FRxaCltYxIqg6ZfPYbRWLecpYWaHml1/GHxrlhjHvXPFmu9ODe4BI37hNuJ5iQdRjAoLeecP/W5/oF8ID4P3+Dpyl6vGxflXiCuHkzrm72ad0cuPW8XloDxjERpziP0G0HhET2Q1pc4QA8NTgFN6uV/8R6Nq4NE7IDKBwHCQkXMZjoIB/DuuSyTL8JLSgsxfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/9vO9bWaIS2/KHeCn0nD9+wW/qdrjbKMgxqe6jTtaU=;
 b=Eol2DrybFyFp/m55kiA5q0klQQngyjveGkkvVoPPwum74MUoK+s15bfIbliPd25c299WQptjPhvbOLfJ9ciE84KfVIRSYAYoFr7eJkqroupTw1B9pzcybPoZfu1G2Xt1MvkKuUArz6UMR58seJxhjXBB9oFJs59VtYkKOmnmcvc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7732.jpnprd01.prod.outlook.com (2603:1096:604:179::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 08:36:52 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Fri, 10 Jul 2026
 08:36:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v19 04/12] mmc: renesas_sdhi: Add max_divider field to
 support SoC-specific clock ranges
Thread-Topic: [PATCH v19 04/12] mmc: renesas_sdhi: Add max_divider field to
 support SoC-specific clock ranges
Thread-Index: AQHdD9lB/xw0GReSpUi4mNxVpXAnbbZmbjVQ
Date: Fri, 10 Jul 2026 08:36:52 +0000
Message-ID:
 <TY3PR01MB113463ED102C262BEA039BEF086FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
 <20260709192916.630794-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260709192916.630794-5-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7732:EE_
x-ms-office365-filtering-correlation-id: ed2abe9a-c835-4136-9a10-08dede5e645d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|11063799006|4143699003|38070700021|6133799003|56012099006;
x-microsoft-antispam-message-info:
 Mymti+0745wlY6zkTnJxiVoagyE10t1Bt/NvtFugF2mle65I97wj/FcbkN8KFoiLBSLAOdSHq7zyj5z6ZgjpVe946JUoTYGnUcd5DcxzJjFd6rE72BXcluMy96pkuMiQ0QKLRAPaTC3cQQjxrgwzx6kKGCZvy41kc/+tCBkAOb2Kld4qXIdXrxz7xHhbiVYO+tEM/uYE2wXMqV3HD7C7h7roBKpLlaEIuM0FCKdrPIB9MB8PUjiwKQKq9SRFXBENti2BB9BDH6UdI0PYMrxUwNlHf/oGz33TeDw4NP6//yWAgwqAA88rqO23mnqGdwzByQ07eq+4q1e/xRhMN5m2mzJV29dydwNfGWfAMMOAtlEOz4AqrtkiBIxG6bCR+CeohGiFbh2L2mhzlRcVedSvFylyBKMwX2bFsJW5jZ2c+GeQK9arxG5Pkp6auxJB9+PgjrOlcbx3vM4x/LZ3AF692/G/odl/0FagYZoxpnL7F/bABtwqhikx6UFjseaHYxjtmkxivj5iITcd34Gn3kopaiLVO1jRePt9KkOc0CqY8E+zW8enV6th8IJHeSI7E/ArBC+1FrWD+Ki3H93xP4vlupDzzFg2kMwewUP72yPFrMfZ9ivcY4yX8Ba8QgB7QlQcHWBqh00692jF9JfVoGsn8bgaWOhTlS4Z/8cOhpf7DC8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(38070700021)(6133799003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QVgFPZ/0xctBK9LmZtSM0/SP3y/tk/cCPezeUHE8KlZGAkhVMm6/Vx9BiF09?=
 =?us-ascii?Q?AbJlYTOl3MixHvkvnAbz1yK+thQ4aStg/YNJ+rX/BL2r6r7U9lPywntC5Cp3?=
 =?us-ascii?Q?GD0UD1ZPrN//2lfN7BkeznzSR6F5nllvQY5fP+47SaUo8WWvZyde8joj6UoO?=
 =?us-ascii?Q?ZxRJAbfWNrhVNTwi3fMm9Ohycm7X3HeLyXIADBRz0V1J/dMOin/BYKpbNwcA?=
 =?us-ascii?Q?2OZx5j7zLIiRmhgz3MiL1YUsoBXXDDXCLnEYk085o+gV3nZhbI9J3yQz+kCw?=
 =?us-ascii?Q?Wytuj5avPmfmPR7ULVS58lN7IxVheJLVzDRMqIuvLscAtK3bqeyj9bIJCLJz?=
 =?us-ascii?Q?Qo6S0u4QJah+bZNeBzG27dEZT4h+yAbp0g4guXrDNekKadeCDe1wVegfugNi?=
 =?us-ascii?Q?CxSQMf7xhIb9sAHe+FIk44TxnKmDFG785iNFxO/D1YBuac0+8r4kuKQd2ij4?=
 =?us-ascii?Q?NCCrR9EKSJi8LVdzZWuchBB5Fko4PnyRWoWeSMc5y3Ep10vBrf3Zm2MlIzIc?=
 =?us-ascii?Q?P5v5jybkCXk19wagCc8RcOom+MD+QtrmolvcAGENTHc9Btep2gRpjPRYYPyD?=
 =?us-ascii?Q?e2eooqhlOdit1wjrGseU2DLfmJ65aUhq36wK7KQR9csa8RB6oB+0P9vHunYr?=
 =?us-ascii?Q?j4HN6hpkxNYHsmLv11rAfTVenulXBs0dIyahaYq+7q6r/ojxQz0gGCUKJ1o2?=
 =?us-ascii?Q?OR5iSz2UOW7vANFQxTsAa1QkXteuCFJGAMQdkMXG1uK5vS6zCPwkra53EI5L?=
 =?us-ascii?Q?C9nf9pgnAULCWaBkUZxYdmfEIxFaNW+3g/bNQfTnkHWZkSVDPRlWdM6GUF8V?=
 =?us-ascii?Q?nTi1b94I71wzEX2UWbCRnA2M02pbeA/mQV6X7tEW5mdUyRx/pD5737B2LBJ1?=
 =?us-ascii?Q?+9WIqmc85BTfsGrXanIj+W8U6Wg2wuURCsWUrtSjAMu4rqELNiWP/MdT1gI1?=
 =?us-ascii?Q?6JRYfLJjeTt+JlQfWYo2HwXsF3VcvzB7UwCpn6mEI8uHY0eYp7WcNEzBG67s?=
 =?us-ascii?Q?e9LYvVQ8wLp5nWmXEsHLIc8YR/qZf0SPtE8yoPmpijRDe/S7aSVtBUohZAS5?=
 =?us-ascii?Q?vDJD/0HQoRfT+bUa4DBUHdaMKCST41AdRxIMzrPZ+7XsXysTiSNyZuxrOsbK?=
 =?us-ascii?Q?9uf7lddmhUGoxkANn8FWeuFoxS2aO475F17RLvzIledoaqMH34ThrXE6l1Gj?=
 =?us-ascii?Q?+8R6G+ioKrHO9lR5qQV6UeBdOY5GAkqO2ufMc14W1BaKYnavTK82MUiXii1v?=
 =?us-ascii?Q?mEcxvyYg4FqzjlrJWFiEBVc+bJBHTvpw5jXtwok/MZrPjr8FjAzXJ9p3SMAO?=
 =?us-ascii?Q?P9Ttj+Vmq3Gr7s0jlVWN2LtXVX8i2nhxqhKgQJvuISFFPJCRsngiNnmk6s1K?=
 =?us-ascii?Q?dv5jeWoW4qbvH/DbSMWA0XYWPWe648UF1W2PfcNCGKvubciK30VZf+rVpcAR?=
 =?us-ascii?Q?C3msZZEHYsSPsF3tgjF+N1FWKEGoDRy22ZhRdVGkwDhVQ37JEDhFZoM/HSm8?=
 =?us-ascii?Q?NITOpQji0KaFzwFYNkiRzH3W7ONn0DMupq0GyQnj5DFoTFaz6b0ck2Vjoaq2?=
 =?us-ascii?Q?6LwRoS5fBxr7zxtiwb+AwDiV9MWnD9FUoD6EVYURNYNbaHHp773JK3c1AWdN?=
 =?us-ascii?Q?qfS+6XaSv8tLn9ygU7lV20ehzYxE/f5nckrOT8JKQJseHO5e1J0Ine6hBx0P?=
 =?us-ascii?Q?OTVOvGLfaSSNuUeHZG3sMSx0a2de5ebLzAC7M96r87vmcBwAidkiRDababW2?=
 =?us-ascii?Q?K/8sRRuNCQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2abe9a-c835-4136-9a10-08dede5e645d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 08:36:52.4262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wV2po1Mcsd1/CAtJwNnM2ChXl8W58xmn49CLnTEAYY4mOJRtoWyPo/uBGlLTWAm6ufR9K+BmSOp8Yo3SD6JQFdIiQRIbcwPPlRiqAZhlCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7732
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35011-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B14EE7388FA

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 09 July 2026 20:29
> Subject: [PATCH v19 04/12] mmc: renesas_sdhi: Add max_divider field to su=
pport SoC-specific clock ranges
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The clock hardware on the RZ/G3L SoC supports a broader clock divider ran=
ge extending beyond the
> historically hardcoded value of 512.
> This requires a flexible mechanism to pass SoC-specific divider boundarie=
s down to the core clock
> management logic.
>=20
> Introduce a max_divider field to both struct renesas_sdhi_of_data and str=
uct tmio_mmc_data. Replace the
> static 512 constants inside the core functions renesas_sdhi_clk_enable(),=
 renesas_sdhi_clk_update(), and
> renesas_sdhi_set_clock() with the dynamically supplied field.
>=20
> To preserve backward compatibility with existing hardware variants, imple=
ment a probe-time fallback
> mechanism that defaults to SDHI_MAX_DIVIDER_DEFAULT (512) if no explicit =
constraint value is assigned by
> platform data.
>=20
> Finally, explicitly populate max_divider with the legacy default across a=
ll current internal and system
> DMAC configuration profiles, in preparation for the upcoming RZ/G3L exten=
ded divider support.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18->v19:
>  * Fixed max-divider setting for non-DT platforms.
>  * Replaced the magic number '9' with ilog2 function in
>    renesas_sdhi_clk_enable().
> v18:
>  * New patch.
> ---
>  drivers/mmc/host/renesas_sdhi.h               |  2 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 12 ++++++++----
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 +++
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  4 ++++
>  include/linux/platform_data/tmio.h            |  1 +
>  5 files changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h index
> f926a36f213c..438b2a7afe76 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -23,6 +23,7 @@ struct renesas_sdhi_scc {
>=20
>  #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
>  #define SDHI_CLK_MASK_DEFAULT		0x80000080
> +#define SDHI_MAX_DIVIDER_DEFAULT	512
>=20
>  struct renesas_sdhi_of_data {
>  	unsigned long tmio_flags;
> @@ -39,6 +40,7 @@ struct renesas_sdhi_of_data {
>  	unsigned short max_segs;
>  	unsigned long sdhi_flags;
>  	u64 clk_mask;
> +	unsigned int max_divider;
>  };
>=20
>  #define SDHI_CALIB_TABLE_MAX 32
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 1787f91d1ff2..5c478995d660 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -117,7 +117,7 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_ho=
st *host)
>  	 * Minimum frequency is the minimum input clock frequency
>  	 * divided by our maximum divider.
>  	 */
> -	mmc->f_min =3D max(clk_round_rate(priv->clk, 1) / 512, 1L);
> +	mmc->f_min =3D max(clk_round_rate(priv->clk, 1) /
> +host->pdata->max_divider, 1L);
>=20
>  	/* enable 16bit data access on SDBUF as default */
>  	renesas_sdhi_sdbuf_width(host, 16);
> @@ -156,7 +156,7 @@ static unsigned int renesas_sdhi_clk_update(struct tm=
io_mmc_host *host,
>  	/*
>  	 * We want the bus clock to be as close as possible to, but no
>  	 * greater than, new_clock.  As we can divide by 1 << i for
> -	 * any i in [0, 9] we want the input clock to be as close as
> +	 * any i in [0, {9,11}] we want the input clock to be as close as
>  	 * possible, but no greater than, new_clock << i.
>  	 *
>  	 * Add an upper limit of 1/1024 rate higher to the clock rate to fix @@=
 -165,7 +165,7 @@ static
> unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>  	 * for 533.333333 MHz will selects a slower 400 MHz due to rounding
>  	 * error (533333333 Hz / 4 * 4 =3D 533333332 Hz < 533333333 Hz)).
>  	 */
> -	for (i =3D min(9, ilog2(UINT_MAX / new_clock)); i >=3D 0; i--) {
> +	for (i =3D min(ilog2(host->pdata->max_divider), ilog2(UINT_MAX /
> +new_clock)); i >=3D 0; i--) {
>  		freq =3D clk_round_rate(ref_clk, new_clock << i);
>  		new_upper_limit =3D (new_clock << i) + ((new_clock << i) >> 10);
>  		if (freq > new_upper_limit) {
> @@ -205,7 +205,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_ho=
st *host,
>  	}
>=20
>  	host->mmc->actual_clock =3D renesas_sdhi_clk_update(host, new_clock);
> -	clock =3D host->mmc->actual_clock / 512;
> +	clock =3D host->mmc->actual_clock / host->pdata->max_divider;
>=20
>  	/*
>  	 * Add a margin of 1/1024 rate higher to the clock rate in order @@ -11=
37,6 +1137,7 @@ int
> renesas_sdhi_probe(struct platform_device *pdev,
>  		mmc_data->max_blk_count =3D of_data->max_blk_count;
>  		mmc_data->max_segs =3D of_data->max_segs;
>  		mmc_data->clk_mask =3D of_data->clk_mask;
> +		mmc_data->max_divider =3D of_data->max_divider;
>  		dma_priv->dma_buswidth =3D of_data->dma_buswidth;
>  		host->bus_shift =3D of_data->bus_shift;
>  		/* Fallback for old DTs */
> @@ -1148,6 +1149,9 @@ int renesas_sdhi_probe(struct platform_device *pdev=
,
>  	if (mmd && !mmd->clk_mask)
>  		mmd->clk_mask =3D SDHI_CLK_MASK_DEFAULT;
>=20
> +	if (mmd && !mmd->max_divider)
> +		mmd->max_divider =3D SDHI_MAX_DIVIDER_DEFAULT;
> +

As sashiko [1], pointed out "renesas,sdhi-shmobile" lacks device data,
Ao will add similar fix like previous patch.

[1]
https://sashiko.dev/#/patchset/20260709192916.630794-1-biju.das.jz%40bp.ren=
esas.com

Cheers,
Biju

>  	host->write16_hook =3D renesas_sdhi_write16_hook;
>  	host->clk_enable =3D renesas_sdhi_clk_enable;
>  	host->clk_disable =3D renesas_sdhi_clk_disable; diff --git
> a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesa=
s_sdhi_internal_dmac.c
> index c6db0418de15..2bf354331b2d 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -102,6 +102,7 @@ static const struct renesas_sdhi_of_data of_data_rza2=
 =3D {
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  	.max_segs	=3D 1,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_data_rcar_gen3 =3D { @@ -120=
,6 +121,7 @@ static const struct
> renesas_sdhi_of_data of_data_rcar_gen3 =3D {
>  	.max_segs	=3D 1,
>  	.sdhi_flags	=3D SDHI_FLAG_NEED_CLKH_FALLBACK,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallba=
ck =3D { @@ -137,6 +139,7 @@
> static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallbac=
k =3D {
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  	.max_segs	=3D 1,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] =3D { =
diff --git
> a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdh=
i_sys_dmac.c
> index fcd2edfa69db..bb66ff7de065 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -29,6 +29,7 @@
>  static const struct renesas_sdhi_of_data of_default_cfg =3D {
>  	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_rz_compatible =3D { @@ -38,6=
 +39,7 @@ static const struct
> renesas_sdhi_of_data of_rz_compatible =3D {
>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>  			  MMC_CAP_WAIT_WHILE_BUSY,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_rcar_gen1_compatible =3D { @=
@ -46,6 +48,7 @@ static const
> struct renesas_sdhi_of_data of_rcar_gen1_compatible =3D {
>  			  MMC_CAP_WAIT_WHILE_BUSY,
>  	.capabilities2	=3D MMC_CAP2_NO_WRITE_PROTECT,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  /* Definitions for sampling clocks */
> @@ -74,6 +77,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_c=
ompatible =3D {
>  	.taps_num	=3D ARRAY_SIZE(rcar_gen2_scc_taps),
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] =3D { =
diff --git
> a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
> index 76056d49f5e0..27ea21c00419 100644
> --- a/include/linux/platform_data/tmio.h
> +++ b/include/linux/platform_data/tmio.h
> @@ -62,5 +62,6 @@ struct tmio_mmc_data {
>  	unsigned int			max_blk_count;
>  	unsigned short			max_segs;
>  	u64				clk_mask;
> +	unsigned int			max_divider;
>  };
>  #endif
> --
> 2.43.0


