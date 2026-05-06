Return-Path: <linux-renesas-soc+bounces-32107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QATjDyXX+mkRTQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 07:52:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C04D65E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 07:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 152BA300D4DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 05:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47F9305E3B;
	Wed,  6 May 2026 05:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mR2nrMyc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010013.outbound.protection.outlook.com [52.101.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A74126ED45;
	Wed,  6 May 2026 05:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778046701; cv=fail; b=HrOFoFSV2dQ28q+cDnTUTeNNtahcgG1bbjYSsG7dymEhB1Z6QzHfPZHWw00spXOhyvFjkxFSIijYyEAmGSzuGGyj/u4CT5KgVzdWq6lzEqXmA9oZ2J1f9yNxmnYZIqTUR0vVm7revdt+5fVNT/JPaENTzNC2U/iOFQ5CUKTgQy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778046701; c=relaxed/simple;
	bh=vI6jQlSSYmhg+49mpthXJetQ7/QbzIJzUTkBx8/fcgo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YHAbCtML1Jamhg0gKeGGzwcV4n2uqismt73EK0h7icjAPgQ/Y1B1hUeJclqTNHQ5EGE0JzPjW8RRXuwdI5WuEyglSfXsq9dlrKw5bcseWcJzWLtGVqS5SFKoCh3PnWt0Yyymao5XZ7/wyGlWv2pazt5AP+20HBjA81bPAvWkAfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mR2nrMyc; arc=fail smtp.client-ip=52.101.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0PclYGdeIlNI2AP5GZnAckJwqicWhTzsS4DAcEaZEofQcjXEkKNEU5zLPBa3c1p67RP+mLcJAg7NlpIsTeSkAER/ZTaVWXEydYXe/PtfiBbVI6xBsm3RVhHwgxWmLKnv/8PQNtuHFEIcgeVEXiLlSus7sYyhpogkRqLxNvj+b8w5ScqxCqF0iKU1bHmLXmy4+WbUsASHPqiYBPU8l5h9XdKeKiyMreYB2+stFdc6TznKrxetZ9Qo76jldYyjE9lHZ+CO3eMdkfRenKxulB1z7ZMEg1ANSTeZwkLBys3LBMATq8oP3fZZJQFMH6YPfIlSrOZqCV1u5LOdOZFdao1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RT5BlWnO9T4hQH9BBtXWy670sRUAWHqyNbyR6rdlbgA=;
 b=oSOH/nUHl7rbjebiwSQaKvKTJSUZ1oh2GAJm5Jq4RXYrkJaEP42J0JS3toF3DpItB+VIvIeJ6gnuKSAB7PwaNXW2UgrIxKRl7ueTw+uAuRAmWyqEzFU2BirLqfsF8HLrDF4e/t2sZJGpGKF9NIX/JVvgsk6mErdsNj+aGM1zgHqBUwF9EWkb8tIWPIInSGXm8lW6V4B651glGj0AhrJHjzlIeale+YgvEgVYDQUbdClOVVvLfNPgNNgpiiZCBLNMyJ4P6UsSyfbakCBfymG5F1PMe48DaavCiFn8ptVm+PtnY7fElk+Zq82kyWOO3gxKZ8cu1/Sgsjj44Q6YWiAsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RT5BlWnO9T4hQH9BBtXWy670sRUAWHqyNbyR6rdlbgA=;
 b=mR2nrMyc6AD1+16iJ4pZRo5TwP5mORyOEdRShjJ9Z4lLSyM6udilVlwbBGwisFz7UaIYrKOVgYQxIpYdbQrzAJeXcFXa7oKGPlch70Oh6g7FFoR+CYL7rxga6wQu4KFZUQEuIn6xrxMZ40FTLDrLcJDMCLvvKL6W/9dExJB0BTw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB17969.jpnprd01.prod.outlook.com (2603:1096:604:475::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 05:51:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 05:51:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Frank Li <Frank.li@nxp.com>, Francesco Dolcini <francesco@dolcini.it>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>, Daniel Baluta
	<daniel.baluta@oss.nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Markus Niebel
	<Markus.Niebel@ew.tq-group.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux@ew.tq-group.com" <linux@ew.tq-group.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
Thread-Topic: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
Thread-Index: AQHc0Z2Ooj6959kMaEejp/GLYFdXNbXqlsSAgBUmV/WAANggoA==
Date: Wed, 6 May 2026 05:51:29 +0000
Message-ID:
 <TY3PR01MB11346889F5882CF6B047FEFDC863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260326111803.1248934-1-alexander.stein@ew.tq-group.com>
 <20260326111803.1248934-2-alexander.stein@ew.tq-group.com>
 <4f436a21-ecfa-44ef-9002-c64ebd5e30ee@oss.nxp.com>
 <5988897.DvuYhMxLoT@steina-w> <20260422114213.GA68897@francesco-nb>
 <afohObxES9nIQla2@lizhi-Precision-Tower-5810>
In-Reply-To: <afohObxES9nIQla2@lizhi-Precision-Tower-5810>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB17969:EE_
x-ms-office365-filtering-correlation-id: 31ad9f24-c029-470b-27e3-08deab33853c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 eQLvImLtbT6NHzp7JJbWGZTccF9WH158AbV+kn0jTO5KN1FipGuCiE/Ifsrkp0sW9Cr05sN87ZEP9dTXLlYl97lva6O+KzfNLqnhLnL4GVvLYh1Z56yRY5ZYGPGQVEvUL28UgRd2XW1PZoZPxkGxofw5Vp3T6KiXBuwr2J4hOas1zvZOIerYVVQmXIBDKIDhn0Q4scmLcMSWdGDTVIqVV5MND2Fxz7P3qg1HqP4jtAiR1bkvXX1HMXZQErAxRvT0I8e5uI/B2/DeoAaqQ9h50abPDXNJWGWxJeRq+dGRFqXOAJlOW71N9YcGUWrh1yawuD6XVASYNv3R61kWJa1EJt6dPjy0ATRAFLy5n6OdHZipQV5uymx3pGXDoWGqzAy1LxQLFKk93Guaia85qL38TeWSAV6uu4hgwXK4iOPYEltRcL3r4ElOYBZUqKMnDR+/msAtB5qqosYm6OciFeEcN2Fi4hHIt6/mMFVSRcWA96zlE2FHhatageXoSuK0RsrSgNdACLzyLQVvh+xB3NNVdF/B54Cj6MvNSpJZ+lz5uk5INv7yF5H/L4R3x7XZMs0ZNEmO2y+HbnPkHEGipHQHN9kdTSuPkon6JXN+32CYAYUTHK/c/Zw8KXpiVyOeEe90GObzC/V6DV/wzc0QaZXM/41SwAhcXro1gGkVElCldc8ix1P1au8v7aOYKrDD8OYz/6cGm23Sy6zrf/DIudhS/SeFAfu5isrO7CBRhZ3wM/qMTQFvsD7k/faTTQwNDSz9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UzI4Hey/oqPxq+UmcLdznnNQsE01aKtI0K7zyObr3iXX5TQ+L7khUSbZINQb?=
 =?us-ascii?Q?IuTgn6+niuls18D6APwJZi8X2j9iG1oLCxf5+DaoYa9zw4V1J+Y/tZeh4NNv?=
 =?us-ascii?Q?wyDvf64lqBTx+alxIKI6SlQ3GX9Ol/Bf1WPdsvJRyEGOMfUgGG/GLv4vHasf?=
 =?us-ascii?Q?HiZs55xL0lE0P/YowUvLxpfM0ABjtc5y/OvTam7N3Zj4A2y3lVzw3/kgcgwV?=
 =?us-ascii?Q?NMPz4Lm9Wsls1Al2OR/N2bePyWUuW6ZsCkKb7uqGxaBA765oZb3+m8Dd5t3g?=
 =?us-ascii?Q?0h3GRxbOtTD5mWOSJ6c+hPyaNJOYAowODyOscP7Q9f8Yrk31g/o5wgMSqvil?=
 =?us-ascii?Q?EfYNlwUJ4W1lzGjy0r1Xpit29rPSZG/Yw6XToiUhbrFI+SwrHs7SGKGrtO8Q?=
 =?us-ascii?Q?oMXB2gtMo2RoMSMqVS+8DBP5mi79lqDDcF5NAFvCCqmqyGNUe3dQz2ZwnHP+?=
 =?us-ascii?Q?7TPmFjdU3zJOerZ/Mm3hvGDeIPSxWv0PjM0+pMUOOjdHeruO7sxr2ptaP5CG?=
 =?us-ascii?Q?7xsPZGBh9fp0nCcvEWh1o4yDTyakJj8pV9ztPp5f57AesHN9HBxn8PhAIxni?=
 =?us-ascii?Q?VHvltJ4zJGWiYheD4kyXvlNJgsPXjxPkhpy2uGLUHAXsBTxQ3S9F0nvJDX8N?=
 =?us-ascii?Q?g66I+NSMdhy0ug8kYbTqAVP9OU5VDimIHN+CkCQi4CpPMojQsOuhgJ7Fqdvb?=
 =?us-ascii?Q?KkhSfYl0XJCeToIny9tImTftXshVVb9R6kSL1ZSqZPi0Gmx/cFjVzVMiT5q6?=
 =?us-ascii?Q?Bd49F5vozHqwT8v+nEdvhqgFmRC0MY0hmydGBvDR71RxBIz7QrCO8zEwaS7W?=
 =?us-ascii?Q?8t32PiKRyOlhqfq/bOnfXwEIB2VZ9CTEQjMyh/fZcnES66amCA4AjlBNAeQT?=
 =?us-ascii?Q?Ptv34aDOopE10pGOGitIxmD1+InYXUE2l2wFLBuZ/TUE0MgQr9zERV3yUm2W?=
 =?us-ascii?Q?DR3aPoinZO2yqay2w8AFaPesnWDPL2QT2xabTXLNMnZYwxeVA9+RAXv90NGd?=
 =?us-ascii?Q?kyvicJurIpHIpaTDQDmkqYE2UO7gWzfmvitQqxIDoD70L7cclCE3RrgaYM7q?=
 =?us-ascii?Q?82ncFGHJERj7ZY6JWF5DvhMgBdR/5jnyWIm2EAmIDIsTlA3fQukSCmHy4+tA?=
 =?us-ascii?Q?ECILbCyD6ridUo57MbLYxmcSH5Ys9PWnNMluYnNL85jjUVmvByEB7slI07Ib?=
 =?us-ascii?Q?v7ZWpSgf1mf/JZko8v1aCQpwgcBwTRnlcYmdWylyNlmiFVw69CNsTcBAK0i1?=
 =?us-ascii?Q?39azud29NpKrf4HjkVUzHtGz1jNF5J/B8s32L4ZnKODH1QeueooVn8IBZ9tc?=
 =?us-ascii?Q?qdl00AkFHoPN94iSoryEMplt4iB0bSPmfh+h6LtGJU8mZWcxaAvDsNNwdF0u?=
 =?us-ascii?Q?7LDQuP1/ay9OHb5WbNSP8Tud2Dr3Q8gv1iAv7odAwyOqh8ns/ptII4hUAYef?=
 =?us-ascii?Q?COCr/ojUwcxTjyd5G1xRcZpO8wM8hrx5sf+gYEN+SjV3XtKHYhHYMWyN6JLn?=
 =?us-ascii?Q?kvW3hBpznKWFg5E8UcPMngjOrs7ClKdZsl6tgPLDfHmYG/IJGYFkVlOugX29?=
 =?us-ascii?Q?ycCatZJ4LKON1cK0HccXecisutgywIA6Y3r2uIJMGL6Xzswvh2C8w3Do+u26?=
 =?us-ascii?Q?F0yqbWfo/dzLIt26xLk5iqAP5wDMZcAVn+MxmL6ydrWfvGITZwnzmcYs/5ek?=
 =?us-ascii?Q?REMmS7f3alJ5S+0vnROs8XGJfIKKPh/Z0qqOJbjpxrqrY1zp1wsU8fuloMqi?=
 =?us-ascii?Q?4fMQe0HYZw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ad9f24-c029-470b-27e3-08deab33853c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 05:51:30.0002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QpD1aMjnqiruE2KNNTwUlqd7Awg2BIEiFGhgGzB1pbmQlTTy4tpTwGjfa4sljYBBRDqYn/4iCtYPu3nggKChp1GbvCer6iJiR+SgqbiliJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17969
X-Rspamd-Queue-Id: 416C04D65E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32107-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[ew.tq-group.com,oss.nxp.com,kernel.org,pengutronix.de,gmail.com,glider.be,lists.infradead.org,vger.kernel.org,lists.linux.dev];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,dolcini.it:email,nxp.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,a0000000:email]

Hi Francesco Dolcini,

> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: 05 May 2026 17:56
> To: Francesco Dolcini <francesco@dolcini.it>
> Subject: Re: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
>=20
> On Wed, Apr 22, 2026 at 01:42:13PM +0200, Francesco Dolcini wrote:
> > On Wed, Apr 22, 2026 at 07:58:11AM +0200, Alexander Stein wrote:
> > > Am Dienstag, 21. April 2026, 16:48:25 CEST schrieb Daniel Baluta:
> > > > [..]
> > > >
> > > > > +
> > > > > +	reserved-memory {
> > > > > +		#address-cells =3D <2>;
> > > > > +		#size-cells =3D <2>;
> > > > > +		ranges;
> > > > > +
> > > > > +		linux_cma: linux,cma {
> > > > > +			compatible =3D "shared-dma-pool";
> > > > > +			reusable;
> > > > > +			size =3D <0 0x28000000>;
> > > > > +			alloc-ranges =3D <0 0x80000000 0 0x80000000>;
> > > > > +			linux,cma-default;
> > > > > +		};
> > > > > +
> > > > > +		vpu_boot: vpu_boot@a0000000 {

No underscore please for node names?

Cheers,
Biju

