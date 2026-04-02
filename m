Return-Path: <linux-renesas-soc+bounces-30749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7GMwFnpszmnsngYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:17:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5186389870
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2622C3153794
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 13:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EB03E0C7E;
	Thu,  2 Apr 2026 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AEhKIvLf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1B83D5226;
	Thu,  2 Apr 2026 13:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135361; cv=fail; b=dKlJ0LvK64XS9tcpXdn11ZPj+8CWSyq9WdsaldNEVsql1tj6qX6d44evbM6nnS/huwXN1NLFDguF/UHaphf94tasajp4OG1f50IfHq3esqlFfcXeB9n4uYVETIriBYhwxJsZdJAfMDL39ocn4V43sWXxlmStFAnY5OzHGIut2+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135361; c=relaxed/simple;
	bh=CxFbPvDh1jJsfNIcNZP4hhJ0Dms1bJHMeijPPcFkJHU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HYUo420ao1S8df/7ZyDvfy5YP4v3rleXpZHfrp5dXK46d1K4Asi7/ln0WqtWtgbeEqYju6cj+iPYCtd7DdJMwnnCA8wmFMiMs2eH1PhDpaAaZ9tPzqf5CBrSPF8tkbH/zlNayvJVo4eeJJqFvTxA3ioFUvLsqqzAy6BFsRn+IeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AEhKIvLf; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6ZnO3H7V21Jlq7BxAi8OcUfPa6UoVFN35biTWncKl6GHu+nEDss7UfnmMWInNdilXCYX9f1E9+WSs/IqjAdTg7FgLgmGBkwRJy88JMWk6S/PlFJuEtSORvpHe06WAINek7Xq/+uk8O/Hbs7CkvxB0m4mODknYxYfNzHCyoMpRY5ab0mNaYrIeh4NAOistYsR7pZrT7Dqrt3qPIZolKLxKs7v7zQLk2ngWH8L3Ml0KHDDv5/xqddIP+UVS8CzSsg5IGQQZYDggmTMpt9YRorpdB2nQnemOh6xZVyQUNlXlFL9ElI6a1E+c6zjg9lLkQ5729SOBLuD5ERuJ6qrz0xFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCUpdpnQCv/1C2hBiNTE5FfqJ/yKaAbPhQjY+DXOI1Y=;
 b=ND4RO7s9dsbQZguZkwQR1MamUvpgX0ozh+zsVpdHMVf3NUtODXYiyPJvmvXUjP7AdI/0ZdYUZDJ6ZxK3xRf7O7QQwxFLErFVqsY/h6Rl3c4FMKwSxYtjKe67QIL0kmPrg446eFtBctTd9YEtBFmTU/zg8Zc/UKkuNukdycJiJnhIxwDfToQBUIioTfOBkoPTuM/Oss3MsqyEoG9TzQashA+A2y4CNBbPmVC2/qCcTJTHkAhQ/ZgaEB2QdyO7UdV4NtKYO+HBwTqOsmZDGvCMMEih/GL7vsPGxuvWsi2F8huJhweyTbo9zggmfC/TMOtYcr6XCUcSv/+aUgNmFI3PCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCUpdpnQCv/1C2hBiNTE5FfqJ/yKaAbPhQjY+DXOI1Y=;
 b=AEhKIvLfyZis+7zF7HmA6Fb3gz+5Q64uh36sxaQlNbvqWFCShQtjyTdMEE6SVAy2hLXcVcuC2/tG2LOjEUytt4Frbdh/WmzT5auPspUtcHZfihfwevo3GDRUHPU8+IRlPRnBt40TCRedU7fpyD1OebAlgabQqPlcBLFVMOZT9A8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB8046.jpnprd01.prod.outlook.com (2603:1096:400:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 13:09:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 13:09:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
Thread-Topic: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
Thread-Index: AQHcq6tn0LK2JKDugkSgDHRkkiWo8rXL6eUQgAACUQA=
Date: Thu, 2 Apr 2026 13:09:14 +0000
Message-ID:
 <TY3PR01MB1134661E2391CD46899B516848651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB1134614237922A87C70AA685C8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134614237922A87C70AA685C8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB8046:EE_
x-ms-office365-filtering-correlation-id: 1ba195ce-a2e2-4d50-62e9-08de90b90a0c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 yjTk/+raOwg3SmvNivQACjmfQAAS4t5h6Y/0l92ED6l97ADSGpBqeX9hVmwg8qWYZ9vaiRsa1rKzh/a5A5SjbyfEihx7YkbZjaU5WNZOzWwAp+39yFUDs0lwNdUTs9+sZ0dIiO+ZDtVb1+/pEzgWKE7ciyH8s41g2QhWFCkMKXK3r72ni/uF3j3EX3NLmH3uCKbos+BDpjxuDpCpVcnBmi+jN8joz+JrDme5vW+OVUueizAuUTPmXybZZL6wjk0fT1OwSW2U0UQSERo+9AR0E2Z3wMtmUsBlpquxwySmIt5vH3JoS7NWYIZge4r5OSlvr46vYp9hQGVOTLQSd3e9LUemp/6IeWhDMewmem5dwle+SGcM/tU1Sa8Plqr3lJigTZta+z0kCyElzWIfwTgcXE/ZHHtvE2W05yefnnkVNWHTaMcU81APVD+AccwjCKXBxlj94gW20HBoj1axt3S5fIDKJvOTKDehLifEjAVAG6SIpz+hEhg56IP3l1afoCF3MDeTlMIIQ30VO5/UZHk1bihU1ZCv2oDKZi9ksoW4OBhnSUiSiGuTRIEZYXRyKrM/3rpvN15N3IVRpGi8O25ghOavJa8clenW9I2lBUc1evqvF40Uz43KdYYA70Zs07wMhsMUczS0BsqkCUQIN2OTFv5Ue1n5hlD8ww7ItPJ7nQ3lwTxw7H4Ixki3qnRv83dGr8yTFdq2rFh+7QI2ABiKPAk/0LsCZuVSnawt3tZzXPpM4AKghLoF0aelM0p+KBN+EHXOgHZFCJoijTt3EU3cWe3j8aRJPgriDlIgU8yFlYo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GL8Zj400vbDNSaIe8ox6GT6jbj1SaRFIFvdfz5PV2+mN9+e8fakfIHPB9faa?=
 =?us-ascii?Q?YI2wPOZlZGiL6XzZHxNlEbcRbHRl3fyiuKxeRTB/H8G/lm6x/CoF7RekoXXC?=
 =?us-ascii?Q?PDBqrL33igkeQe5UbO0tnqy+4ElkEbZ7lqWvPtpkrpAvgPu3UT21qHFaSLgD?=
 =?us-ascii?Q?x+N53ThFYldoMcZE154U+tf6rLsQOKiPqsXsPic00Kq8eQeAD3xKpYm31z87?=
 =?us-ascii?Q?RokzETf+gWTRdm56F1FCn7sIkoyytdrm4h6zRy/VOq1Gf5mIKAzz7ZAbFzAJ?=
 =?us-ascii?Q?jFi4ydfTp4zaPtaGFJDmzjdlBXlHbPtfpq3aPKk1cVcur/8r2ThlJdgSXR/V?=
 =?us-ascii?Q?J3lN3XvH/A1bzCb8FtIqYtYEl3zjyv6tmkftM1eJ7DHd+p/8KLLZVegn4pQc?=
 =?us-ascii?Q?yWEsjYhG2TOD5dz+fNm1tSb747DH5B2L10LEW8tBTqAppepUTE+vqxPi1uUI?=
 =?us-ascii?Q?AhcmhCEUlo37iCmAZmv/OT0ch9QetqWytj/iIUP/Hh2xbLK3oebC9E1hKyFT?=
 =?us-ascii?Q?b4OPqq0OB8QoojdEwQh/pawfM/TjQwbmJtLte1H9shUM2HdTfoHfuHTcrbd/?=
 =?us-ascii?Q?LlL7Ggrc6omgwCyl5zWDtgFw0+WrxVrc09Vo2Ey97kWbHuKKH3qzqwkvFSmx?=
 =?us-ascii?Q?ApGcD9KSJxCqWBfy1kNuu64n5IOAj3NKmFudk+/ybyXRkaH9KLm9v6luKmNn?=
 =?us-ascii?Q?G0OGdgLA+fSJJy+tf+f5lzP7Ns4mECJXwgeNW5sFls2/bnlP7ZkRJYSb7bKR?=
 =?us-ascii?Q?ne22mlwo0JRDdXxOUegnVI1nAryaglL44DH5rqYqPILqgPChqOvFNnF7PbKn?=
 =?us-ascii?Q?No5rt8EmAQMl7+Yf8OAyUgezJH/UDGCpynEHGJU6UcUFO8nizJ/KznfZ0yfw?=
 =?us-ascii?Q?r7IK8kiPh2Yvjh232ERgUz6XtYG5z7WP4m/UIDYU2639iohs06Idpsrw2q0f?=
 =?us-ascii?Q?wY5BQ19a2NrR8PxDKt7dr4IfC1zlQIbh2I4DJizORjBpGjOZvCSrY9Yo3y4J?=
 =?us-ascii?Q?awWWZkihyMUGzX39bK0LN3VfiFTrXJEZHuSGVDySdG6PV3biZlocp3omJvH5?=
 =?us-ascii?Q?CzmUYCTE9sWjuNOzgp6aXqiq55M2WJUfyV2wrGNlw8R0zQZuLJN1YKANA2Ha?=
 =?us-ascii?Q?RH8c3FVmRKCQdZaoC8BUx6QF4at6LrxMyX0AjT431tBkwmTDyvayCbfFUEsF?=
 =?us-ascii?Q?0LHKH/F3HuqEmV3lxVSuBM/POyjiRYECSilcPoB71gIpDExPNF6N0v5fr9Eu?=
 =?us-ascii?Q?fT3GbqbnjZqk7fcH98+X7cuxFt2L2vCJpRnKpmgroJ7j9meCOqRlRT/n38RH?=
 =?us-ascii?Q?w1LyELVTy7M5jPqBaBSmoecuBl0yKAxFbZ/q2kl1rm2hB4iUIhPtjF70cN0c?=
 =?us-ascii?Q?h5uXYa0ZLzgV9IHJZ/6qaKwdMEW+PtcXlRc1Kh1zdGNQ9+Z1puvkoaPRUZYQ?=
 =?us-ascii?Q?8eZmHeYK0sHiF/bg1+ox9FMU89PItAv31w6Z73rbvkYu8EyO+KVPI80Il761?=
 =?us-ascii?Q?Ied6GwF4zM2dIbBbVqske14uJ9Gdi8xJbTR8dQJLRUi8ZfGHiCje7zp5GEOK?=
 =?us-ascii?Q?7wkMWeotHaw7zMvdFHYz/8a0BhRM36XKo7CFh9zW3EETjYy6WGY2n+9Ml1CT?=
 =?us-ascii?Q?+oomLTutGpC33OEtvGM55p46dnILl9JcIZd/p0xwueggpWQAa3VzxI7cHIwH?=
 =?us-ascii?Q?nIDKtLyxsljsoJEZHndqTKGcQbMZDGgk4CmjnZL1ygta4IpaphjN1gLniIEg?=
 =?us-ascii?Q?CZepRvREaw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba195ce-a2e2-4d50-62e9-08de90b90a0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 13:09:14.5046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJPQjsC5I8ta14sG3HmzxON15rTz0UDSGXRon7EP2LdCvDElRia/S9eqTx78D4aALoaPYViwJucbhpcwj8s+Uf8th7879AyrTiR6UPsrSqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8046
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30749-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,renesas.com,kernel.org,glider.be];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: B5186389870
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> -----Original Message-----
> From: Biju Das
> Sent: 02 April 2026 14:00
> Subject: RE: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
>=20
> Hi All,
>=20
> > -----Original Message-----
> > From: Biju <biju.das.au@gmail.com>
> > Sent: 04 March 2026 07:49
> > Subject: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
> >
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > This patch series adds binding and driver support for RSPI IP found on
> > the RZ/G3L SoC. The RSPI is compatible with RZ/V2H RSPI, but has 2 cloc=
ks compared to 3 on RZ/V2H.
> >
> > Biju Das (2):
> >   dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L SoC
> >   spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)
> >
> >  .../bindings/spi/renesas,rzv2h-rspi.yaml      | 26 +++++++++++++++++++
> >  drivers/spi/spi-rzv2h-rspi.c                  |  8 ++++++
> >  2 files changed, 34 insertions(+)
> >
> > --
> > 2.43.0
>=20
> Gentle ping.

Better I will rebase and send new series with tags collected.

Cheers,
Biju

