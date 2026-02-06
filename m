Return-Path: <linux-renesas-soc+bounces-27999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJM4NFPVhWl7HAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:49:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8E2FD5C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D783300EAA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9027D33D6E7;
	Fri,  6 Feb 2026 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="X6CIQGLt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0077529992A;
	Fri,  6 Feb 2026 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770378575; cv=fail; b=W4MZ3zXdKV8b+oUkDMbx/04OuuENDqKoH5lcnyeCvaFHDQ4/yXrM9Ck1EcXy2l82ErL+iMlh1qIFLSKZiukapmDjGhUt0vklR8EZKlAzj5ByIpzsbxln1zmu4UKJGidAcem4ityNz9bAl7ovPYJN01NuIbUilv2pFb8DZ2VM3sA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770378575; c=relaxed/simple;
	bh=MpmmWvSVeF2FkUFdI9Yf/nBukVH8kcsq35n3TbmG1HM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gjupwP5YgBdyXXjVapvVbSFIEwMrHpVWyzlFTIPPZhqhDZyBNuKlMh1G9GNWc4ASpXd/UDffcucaIXFt6NYEoLI+4ipbPmX7UWpatObLWVXWEISlBgVnU1+2n9/yHl2IAYPmEmfFS4Fr/kQkOBZd2n0J6AM+yD6pVbV7OXm/aCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=X6CIQGLt; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmvUSDMtUswubFHTboFGrmm7SguLzYrGZoD4dU52bJuPDC3Hj5gNNp9BLcy0S/4kTk/wStc3mu9BKe98Ib3tF6g1SCa9VIZ2iuaFRsL8RawqIp20YskAZSAKYOWw1gdmqkyppe7oyZ1x/VNb5hU//PeQ0pdeXJqe75ftnWIK9doBe3UwcmEJIGhuzDnuZBlnzWi60ifPonj/Xiuy2AxiPp13kSOB78aKoJmXA06U+Xs6k3fBdJ18CQNk+6ZOFgY+untnfe//N5xFqNW88+7tl6MU/38lEBVzopFNS3AOAJFxElQ9sqk9Ohc0N5QwqrqwhLtJjgeWIrMp+/ILbP9RYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpmmWvSVeF2FkUFdI9Yf/nBukVH8kcsq35n3TbmG1HM=;
 b=bwiPVSoStMzkMwW1zAjCt/O4NvtDnBlMtALW1Ts27sPrNCi0pk8h401pJ6rDeuDQ6D9NjLsfIkNCKKiLszztcCNXLSvM964FyT+jQYoRxid0842ZL0LXBMIGnZqIDN5RIsZJGtQgnAsVnIxbg4/Pn9+fJaApYmhATL6mRrbtS0/Y16OHCSJElwlRa2PxwvphrElMZRCtfimnyogn3DdHdpa3Bv98gyEy4tOL1ecY84faHswkYlX8Bu33luKV0S8xx/TxfibDbzcE+w9HkrlFk+JjyrKEyxqO0EJFY1+y77W/rLM3AtkmDxjSoXdOsrIKOWUvTUaYOi8RH3vNt8zuqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpmmWvSVeF2FkUFdI9Yf/nBukVH8kcsq35n3TbmG1HM=;
 b=X6CIQGLte5Trrx4dA4WU75ppVT/mM67AbX/WOIu+xPWkOLFgFW16VunNdU6Vvn2NKFiUtXiiQSkQddOZ3PDsQ62OrlAlFOW0zA2teSsGBP73GkIS4GPRMXIQkrt+Xsrg3W23Rs2kUzlftCQ80RDOTOJ4yB0rWn29jxs/26NQCbw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11251.jpnprd01.prod.outlook.com (2603:1096:400:3f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 11:49:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 11:49:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>, biju.das.au <biju.das.au@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH v3 0/9] Add RZ/G3L IRQC support
Thread-Topic: [PATCH v3 0/9] Add RZ/G3L IRQC support
Thread-Index: AQHcl1ogyEJNfQW3XEa6uxGspssrpLV1i1aAgAACqyA=
Date: Fri, 6 Feb 2026 11:49:30 +0000
Message-ID:
 <TY3PR01MB1134677AAAADBE00CE3328D4C8666A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
 <87ecmy14s2.ffs@tglx>
In-Reply-To: <87ecmy14s2.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11251:EE_
x-ms-office365-filtering-correlation-id: 606ba7a4-9514-4262-5653-08de6575ca05
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?D3EF+NHdzgkL82hGx+sqWg/tofWJwgqDT5gPRn/AI+sy4+DQzFr+vGmTL8rt?=
 =?us-ascii?Q?kgsWOwzrC8DxnzQTaXb+/5c/5J0JWzl58QWVhl7pL7juFv/T+xejTTi2Ch6x?=
 =?us-ascii?Q?cUlsr3DPAIZaJn3J/NV98kpWR7Hsuextywd1mHnvvt6I/47ITspFLIRMedJA?=
 =?us-ascii?Q?EDDsLvCU5Fz+/7Hwnw1yEa9guX5tndYaA9q+PTszDfZIFQ+aQ/bU/vwqzJSN?=
 =?us-ascii?Q?662OEbXyLcjikW/ff6y/BVZ83ekIHHn1VfW6CTQSX7tcZ0P96OMDVGifiIw9?=
 =?us-ascii?Q?ZFc0JksZwVd9V3F1+ll/DC5M9mc423iKZdswITcoh/o17j6cG6oJlurQa6Fi?=
 =?us-ascii?Q?c2VIWWAOsNkTXbe4h7LSHz7vdcHEOocy+jqMRUiD/8Zm5844cVl7YXfBJ9zE?=
 =?us-ascii?Q?91hJBpQ9+5vQeWU9ELD2/4WEAHxKpxeYTtSwL6ie7FM9AlqD0w9IWvLMCxsL?=
 =?us-ascii?Q?tFXnJZvzQLT+oQqvzs+xipuwMAMh8PZ1SxhGAkv9z6OLLlRPNpyawygkmEYm?=
 =?us-ascii?Q?MtXR3YTrVKOx4njpHzu/LpyYlMQx1lmoiS1XwC9N2ortIYsoqryI/PCz8H2z?=
 =?us-ascii?Q?3nQYGFo192CUdT693XXcvHQ2bjZMXZ+K0v433MxrpCfaVDJcsCF+xOkglD3A?=
 =?us-ascii?Q?AUAHOb7mxvnDZ1Ot7HXxW8HDuP2uC2g0H0KeiqQKCuxBkDl0pnvekOzQF/2W?=
 =?us-ascii?Q?7UXOECVM+we6fpKBoGnBx0Gz3x6UdJR2D7i3mGED7/SMco+Ws3Dk0o69Ov5O?=
 =?us-ascii?Q?qGcZZrURcBn9cXe5lMWHnppbYkfipMfFSBVH92zcXz0kiI6iGyriwnnGXen9?=
 =?us-ascii?Q?1epuC34w3ky9yOlkEv+IfhQvylT+pRYc8MQ3ZlX/kGJs5DWEghoTYql1W932?=
 =?us-ascii?Q?+uSDuKIX71KASxSsEp4Ey1Ck/Bx7o5TZ76P8SO7QGRhPqerF1YZs/LMun8b4?=
 =?us-ascii?Q?r4ivdfB2DwDM3Bu4/CuuJJuUJquqo6HzqMWavTOGjeDOW9Ysx2cd1RY6VR0s?=
 =?us-ascii?Q?MO0rIrcpxNAeQp7UP38Oz+RIsqHcOB9lgBnO54FBU8ubn5veegMvmUublLt8?=
 =?us-ascii?Q?cj0A7u8jpKs838/1ss3u3ZMOEosS6Xd6JwWY3/RKmnLDLsdIpjD3n1aaKE8O?=
 =?us-ascii?Q?HDDLJdZ1nsbM0VRR30Pcx1auxM59uaNycjRNyUNK+a9PJabFD0hUtfFiG801?=
 =?us-ascii?Q?Ff0jKv21jfxRBZttZ2jVWjBj0bAx1rDW/CYKRQ0dnBzYjEDfmU+0lpHsK2gW?=
 =?us-ascii?Q?KygNJtps8b74aH0wpW8Mza0IReJ31nZrMOO4YMHEjq/rmjtOZTeqRw01uLEZ?=
 =?us-ascii?Q?C70cPxm/M6+G1VABO6nQvOrkUuA/UhX8dCV33XScfdo17tPq7QzniLcA8SXw?=
 =?us-ascii?Q?xLIlwY3eg7Bt5xV6T3lGxypdBA6CRmNRe4RO7bZin0I6wiByjRBUGABWVPkp?=
 =?us-ascii?Q?G5VQmI89wAL7jtTcu1qgRHkWyAuipxZl61pTB1thI6n/3Yy2i0ndazfc4X6G?=
 =?us-ascii?Q?DsYaerrWBY9Hxu2ln2INzqEDXcI3jxHhUqByReNpGA6bBkS8Td4UWE3LZfhN?=
 =?us-ascii?Q?Hh0UJkgrsjktRXyrEsb6Xshxged6WtSfvYATk+gXz2qKoZohw5Jay7yRHIAV?=
 =?us-ascii?Q?uhMjxoxSuRk+joa+KVmWBj0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NPiMo4p1bxTYAtLZSi7vFy5wQlWe8PgQg4oQMAbzojKm60OdQVHqrhIG0HvQ?=
 =?us-ascii?Q?qMYYMekgixQWZrSOGNYJcbFU7dfD4vGKaDVhx+hkHcXCvhmwoo+VIJHKj+TE?=
 =?us-ascii?Q?im7ePmX3xWfZW71soPi+97iDQ3Kwkyox0VAMBbEUueoKTosN3XcT24ie3HBF?=
 =?us-ascii?Q?gV+ihha43YMgPWXCX8ryfaC6VHfswGg7mwxWVh9+gqVOgWfq2jB/s29ACv4X?=
 =?us-ascii?Q?vnXOQM+x3744aefTtnFf6yG7hrFZnZg2wiue4sNqEcSEcehL1EK3bDUbWeDI?=
 =?us-ascii?Q?tQP3IR6dckJtmC2vL9pehMTtT3v4J1Ro/Ts6APqVTchvbxstx+EVXtgdwcmJ?=
 =?us-ascii?Q?DnngVch0Cqqk8cs5r03kNJfezKyQr2KTvdTM0eTuXFE+U5hZ60WDJPf4GOzz?=
 =?us-ascii?Q?jv1RuDNxXCwW/8PdwhKlY5ogvCIh88TNFb5zEl11cea3i0ZdCAE83I87KXjU?=
 =?us-ascii?Q?G4orVPwuybxINLy/U9m38od8K31Kga1IXwMIarra527gQDAkJo8/uXtJBWXR?=
 =?us-ascii?Q?9KfPQxORY8zu3NI/gwgYoGmSmAUH1ts9mcZVnyFlY2q2foY6O4P6nZ1CDr8/?=
 =?us-ascii?Q?rym33iQvWxC3XgShcHfIhHhS3qDPpkBcBT5t4ZMAEPEFX/6gdt/oR9lv48FH?=
 =?us-ascii?Q?g7EEmvB9oX8+pAoAutvx737BQRJcCwGEZwTxlN6bH/QnRDkL0/M9h6tv6Hko?=
 =?us-ascii?Q?ksZlrARWdCfhzBfBag5oELbOAaCs7l9eIPIN6h0dKMTVev+6WjW5xWRhI+US?=
 =?us-ascii?Q?LIKJl3a6nhtopo9w/xbH7Nj9GvxLKpwM5dJpNjdp+ppxgp1gvMQDb9uYsH9s?=
 =?us-ascii?Q?K3UwjJ9hinzKmkbzk8zBme+DJuqdL+LOIqQRCmeZg91aOYuhx2KvqZHPGPQ8?=
 =?us-ascii?Q?kz+5+bTZitUck6VJsHi7cSTjSuYwI6wtIFnbUlaMVMk7C3WBn/O65+HUnI/+?=
 =?us-ascii?Q?3O7EbmDrARQmAIbOGeo0UJYPhlQUAm1OHtaJw9A6uK45TH8kuxtxouSlhONW?=
 =?us-ascii?Q?CdAR99bvr8XloNwE6b1IbwqkNkUB+fPIMeO8MTaXP6SGwW5SEFLVqeq4Wbxs?=
 =?us-ascii?Q?qkO1WhVgLQqUcUO4Qax3UOCbxwurErUmDqMFRgyAmAKMKJUIlgtoizErnSit?=
 =?us-ascii?Q?IdJMOIaUz7KK5PtsBbYZn/tYEixvaNvUyUyRD+c+W+R1MqexNzfHMNl4DDVf?=
 =?us-ascii?Q?6aAP/vRx3a0gtJsxVq/6ieMOPqDKATYKfk4mqtzHEsNErYG4hjwJIm4CYh2o?=
 =?us-ascii?Q?nqigDtyOEapsHqgxE+l/DQSM7lqZfJeLsWJfBjKMZOesg1r6cvus3P4BPRj+?=
 =?us-ascii?Q?PR5w29fHtyUVdIi/dvuHOMxulrGwNVVaCWZ+8tegWNncNaAJeORDvV8m06H3?=
 =?us-ascii?Q?cRLK7WFTiYlxqAFtV0DZKRyxrpvjY5wnVQNnHc130KxC0lUN9ETDM8pfdWvE?=
 =?us-ascii?Q?xp2Nmov2UiuQV6VLbO4XRtL8Au9Sq9MMh0XjxZq8ucB1WadPUmWD/kIdcWik?=
 =?us-ascii?Q?2MOAgq5fmI7TbsoIPGnOsXffLGCttfXh9E6ZGcG5IJEAyVys0pHNVv5KZL8i?=
 =?us-ascii?Q?9IVctl48owRRjhS8vCZVU1CyE7xB4XUFgil69ql8z63UxIrwn/2tyStCnJXV?=
 =?us-ascii?Q?pCjEatYaXaQifc0dRtRJcXTCsEZE6O8pPQVR/g9eo67iIrrDjxVWqXj+3qir?=
 =?us-ascii?Q?mu3ifTqOaIcNAx7A3sZBZ8yJMecFKBJQAmnMbiTZFneTG5sV8gihfBX3gK7z?=
 =?us-ascii?Q?vwpIHzIOPA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 606ba7a4-9514-4262-5653-08de6575ca05
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 11:49:30.7562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dl0o27L84mLgcKy0IfPUburAhaExjEy18vAXET83XDVpSY+71n/FBlh79N+3QTC3j1QZwkPdzijG6NwG+se1Uhg6KKakPu5msskO5lxl2q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11251
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27999-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,glider.be];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: CA8E2FD5C4
X-Rspamd-Action: no action

Hi Thomas Gleixner,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@kernel.org>
> Sent: 06 February 2026 11:38
> Subject: Re: [PATCH v3 0/9] Add RZ/G3L IRQC support
>=20
> On Fri, Feb 06 2026 at 11:16, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > The IRQC block on RZ/G3L SoC is almost identical to one found on the
> > RZ/G3S SoC with the difference like it support more External IRQs, GPT
> > Error Interrupts and also has additional registers for GPT/MTU IRQ
> > selection, shared IRQ selection between external IRQ and TINT.
> >
> > It has 16 external interrupts of which 8 interrupts are shared with
> > TINT[24:31] and are mutually exclusive. The external IRQ/TINT IRQ
> > selection is based on a register in the ICU block.
>=20
> Can you please give people the time to actually look at your patches befo=
re you repost the full series
> every other day?

Sorry for that. Will take care next time.

Thanks,
Biju


