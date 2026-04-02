Return-Path: <linux-renesas-soc+bounces-30746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OADG3RrzmmpngYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:13:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE5C3897B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1DBB315723D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 13:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3887231AAB8;
	Thu,  2 Apr 2026 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="weybQxFS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010052.outbound.protection.outlook.com [52.101.228.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF7126980F;
	Thu,  2 Apr 2026 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134853; cv=fail; b=OPGSNStfmUj9goL9+wENyKQkliB2PyrzEri5WAkaGCJJqe5sKtS/96AOFedMRefNRUA8g9MHpw786qwFz8ppAT5b/es3B5oYpPgBxUkmLVVhlkYDpC2bTfqP0TcMkbrONzlCbADpjCxjC5eL/UtpFG15twRfhbUr9Mijzp89U1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134853; c=relaxed/simple;
	bh=w34IfNBlGpfelMbks3GTUDzpgYNPZ0fBolBIpNP/a5M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pljackTzEV8xpOFmPSe3W9ykdY+/zmcYYkZQ4C8RcEC+PYu/ukaoPJJApDDmvwikqAas/FEvmhbboQDAQqdtZha3sHr9dLF6bWtot9IZFidBvqeqJUQH+KMhs/+OfLHKehAowPCPFadHnkjyM6BS6rphYR/xMctEiiBuM6U89WQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=weybQxFS; arc=fail smtp.client-ip=52.101.228.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTi/cTDgSyYnV78lN6BfVuycNA4Nzj8+aUSX2F8LCUj7+V4qfe0bwq56bCJJISjzD+ra70J8IinncDZCiHi4sfrJe5EVPEGLHKQV2YpV1qJ9jEhrs47S2Ju5rDI79TS+Vrnm8Yy3gkeCES6nArxRBj8LZ0e95wFjhxzbqnSJtTyROjrEOWIgiA54UUtYF3nOUO+x8PUwKISG9VWY53bq5uSzTsmipd7z0f8YMnYBS+wYjyECKxRUi4vCRvbfMWy7cIOq+dAaW3eLsAcJ4uqdQYpGu+qNPaxzKRXmaAy3APs4IR0fsMynY3X8CrBaDLCkxJ26/kXawvBqsKJdX6Ma/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VICezT4voIe4UTxAHuVXqE//v+9gURfv/O+IOnOfhMw=;
 b=QNVFfamV8offdbPZ+xiNCsZ18CD01+26eadDpYPKrtkvddV4/MSHzzqL1dhZmnnB6qbBIQtExRaM+7tXoZWM/dRp5zfsuxkSiERXTKbPXnjY1DMqoi8KyULLu6kxQOld8ywLM+XLdH8aAwj2hQQOIo7BSRN/KBmAKMK7N+QySjS0wLEOrfpE7fDfKRppQRyY4n7H6TVL+PHrMXpymVoD0efwfwdhRXBuhUXFXMehud+PcaCGrKxfXBRH+bFIdsd07fCFVhx3juhlgZqYegBHEvihsLWu3bCoEke3FrtsgSbwHheVuzvEEa2XJdj5a58AYoWZAItOcP3x0FDnuCifAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VICezT4voIe4UTxAHuVXqE//v+9gURfv/O+IOnOfhMw=;
 b=weybQxFSMKyCvm9tf32vMIAFAgtOTLNTBS7/UeB+73gOTO3rMTvlxeHyNELvBClEhApdVn4ssk9HS/NlkTOEFpL5yycKZBgdeK3F8z4AEvQRw4SKzenlCX6I7z8dTfXgH+eJE5/TRHMTu9VqyOyCbvuL8rOq/NDt2WjfeL25hxQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13615.jpnprd01.prod.outlook.com (2603:1096:604:37d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 2 Apr
 2026 13:00:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 13:00:29 +0000
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
Thread-Index: AQHcq6tn0LK2JKDugkSgDHRkkiWo8rXL6eUQ
Date: Thu, 2 Apr 2026 13:00:28 +0000
Message-ID:
 <TY3PR01MB1134614237922A87C70AA685C8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13615:EE_
x-ms-office365-filtering-correlation-id: d1fca8ff-36d4-445e-8f31-08de90b7d0d5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 AnRr0zUpp+nTXRHMxAVPPbiOeAV2oCx3X5wOX4SnIPYsuYIjDYJhF7DgVorI18q+oPpUNhcgE7emDw/AmhFtYpm3dOzLFpmQakqYcNG/Gbp0WtI+oh2bvwOCrOrc0ByCXmPE9YPv0li3JRjjtlt7idepa2pChJf21bOhIqNcoJV5hhJbS8iMFWkjqNYBm+aPNn1V02/QmfAkdZndoSrUlTKuqmYkyffk9O43TwXvSbRGjM4AwUVZdCXbB6NrI3rLC3+DKLgRf6bFunKhE/8w93NgzKEo0TGmDc/rc7LKkfMugFeoVAX/2c5cQ6PxnkDkxhBdtjYe9sh7+hg1TsS4OyJ3+dD8gczMawbgpHhMbPyzVX17Wh/DANUdHu83J6iIT1KvlAUwmwhql7f6YlRFiTUYAZUruGmp8mQiOZ4QW6dGUIpc7XjNgzz9x1Nco85rEUvwXNBXsK2qo0JtNcDTnvK7bERQiw4zcNye3S7xsM0JZrgFK7P7pI0OChG1XlXI9YaS+ss0z5LQ5wIiXWXCBtH2pokbOAp3U4oBrLkmVC02im1UHnBGX4G2euF31i2B01GVPjBlIus7CBjfNlMgS8rkIgaH8Gkru8q1tw4o/XgbVfMnqccdfc8cEo4Ox30ll6/vgs5cB74HksO0ivQdWjXsM6/KSAHNaO11GOIbh2Uo4CAZMb0fFHHQkHFr0pVRuDwGTK61grrXvP/e8akV3z5rS28xMNE0SzKkTzz6Wte5FxjJzu306fHAHM9kFnbrEPWdyozmCl1cHEl94/F3WMe3EPyyHJX1HMOp08umTPA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dM7N1WKUSMl0RUjJa9TEumHmRQ5gaEmxUFG1edIF6leD1v4p9q3b7g7Gca2m?=
 =?us-ascii?Q?pUaRpLGNhs8GrMvNGvhd8SkDPDuVysRtPYA9rBFHJjozSbMMJ4NVo+JujwxP?=
 =?us-ascii?Q?FBoS/EwSYz+1Ijc994MFsCOvLq8sR15jDuhquh/Twn5xiZPoiFHR3fhrRHdB?=
 =?us-ascii?Q?QppaK/i5hUot8pAE6cXoIAaAP0EGVJwnpBDJ5S/h7sBsYIJ5MlnNerXWoWFN?=
 =?us-ascii?Q?54aMuMYpIG3ibacXhU7ETw515SMppelkJ3EM6vsUam/fr5QfzmF8mLdFCtmQ?=
 =?us-ascii?Q?Fu88p64G+k9mYVKF7IMYl5N/81r5dnWMpcekhXIPuNhiaOh1y6hJeYsGoD4q?=
 =?us-ascii?Q?SK6VCJDTR8OkG8TYzEr0Dr6g+LCppJ8kMpC5DKFRB6im/eRsXaz6MSpcs3+5?=
 =?us-ascii?Q?ay0Tr0BkVR6DLOSRGsO1SlKX3Voa/ZOAOoJbTAvCW2zXkVtuNAX/tbVrgG0U?=
 =?us-ascii?Q?ud0gAev+3Uc/MBxz1gnOfOFpT8Flzs+hdohaVmTu2WekRxNQ53qAFWZ0rd1Z?=
 =?us-ascii?Q?7nWduwdypvy8rFKGpNb+1tVUmWmq9w0a6soyr+rfgBqh6Yl9pSnW4eboG3Rm?=
 =?us-ascii?Q?5CWiAqWzbRmLgnVoWTIanJbZ70tZVpBLe3LUcZQJtQ5477kH2vAhXhFmy2xK?=
 =?us-ascii?Q?PzzMY64uttFTbKev76Zcnioe/rqT2Fr3VnJGXbiFJzZ1l6GKyVhNsr3JJOIh?=
 =?us-ascii?Q?Js4j98JoYoBGd0QPS2C2dYfRXH1/0WVVYAIIp5pQNA5dELU8Z1P7Yg+2FO69?=
 =?us-ascii?Q?cENjQxuspB1Totn7rujrLqRyPyY4LJKpXjyQLbuC66v7acYMkKzptyO1LBQe?=
 =?us-ascii?Q?PeVAxt0A5S0xk57GHWO63d/4o+kDA6EahcNLE0KmVixjS4KF5JQkHUmAqAQe?=
 =?us-ascii?Q?2jDFipQ4VaSNUz+D8PuRmlCNirpEna662+1oK3fbiKWi/2IP0r57w2n/bdU6?=
 =?us-ascii?Q?BqHUH/mreHHlad5L037HUraw0rWfr9OhZJ1NqOPw7h1oMPSDI6+GktYEaUdO?=
 =?us-ascii?Q?qtaJomFbhlM2R/58CTy/nRTuuEzmjPvzGf3MKR8vOQnRbCfrSeQsMEXnkaWR?=
 =?us-ascii?Q?mcbYgOT9iIbAUVhVYYPGJ584P2qAXqqwji7z4D5EY5ZXDr6zrNo02M8NYVjV?=
 =?us-ascii?Q?vhXhw7W/f4MeT1mn2hov3Ae9M/NxzGZS7k6Uey7zGi9gPpQ6hJPLmW7z7+4L?=
 =?us-ascii?Q?CWxF+4IXgaWGBVh74lU7NBZMCMvUCjZd3T8+ZjuiY6OQaORRpOucCCS61vvf?=
 =?us-ascii?Q?b2eC5UOe3ODJOIqjE5kTRiq09L2077Ec/z/Yegy4sfcmrVN6JrTmD8sdbNVq?=
 =?us-ascii?Q?yWdsb19OIPKVFVAfmR7TWgrMn/Zd1slbmODJsI4Dib4sR0CpclDMV73yOa/s?=
 =?us-ascii?Q?0jGr6ktmG/yrBu9N3aLAMtyxsSW5VGzYc8cGNKTlMPulIYHaJaODP4zF6X1q?=
 =?us-ascii?Q?z6ztxyIQqHHx7emdV/Zqk07horOw8pe8UJFAHtbCIEoRVrSIDZtVwqXRqaBx?=
 =?us-ascii?Q?rr0Xh4IMaxC8nCkiKIpuUTGhPh4mifah2JwgjMl9gDqTBWBV8ZY1fyHGAuI4?=
 =?us-ascii?Q?Vb11J41OoROnS+HdCRTMWctN3d1i6TA3dAsQZwWNb0GWcwLrq24e7/V1qncU?=
 =?us-ascii?Q?fk8KTI9x7TsvOe5beI8dUaJR2Ksvmvrw6FuFxUOfuh2xlpX7JW8/uGMQf/JR?=
 =?us-ascii?Q?Npn2fc4OyxWgvSlGnfbes45z+YKlluSjwG7jwR+pG/32flfKBdnHYK+AK+KC?=
 =?us-ascii?Q?0t+ukQYf0g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fca8ff-36d4-445e-8f31-08de90b7d0d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 13:00:28.9889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mmhqDCHBEZ4l4gqecmETajmKF0TdyKFL4MtN2KJjVF+zAqDxTcCnSrRExf3Gsug2dxDlx9/Ls8H+bwhIWRUE7gEdattihf3wvsWFRtfM1qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13615
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30746-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: BCE5C3897B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 04 March 2026 07:49
> Subject: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> This patch series adds binding and driver support for RSPI IP found on th=
e RZ/G3L SoC. The RSPI is
> compatible with RZ/V2H RSPI, but has 2 clocks compared to 3 on RZ/V2H.
>=20
> Biju Das (2):
>   dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L SoC
>   spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)
>=20
>  .../bindings/spi/renesas,rzv2h-rspi.yaml      | 26 +++++++++++++++++++
>  drivers/spi/spi-rzv2h-rspi.c                  |  8 ++++++
>  2 files changed, 34 insertions(+)
>=20
> --
> 2.43.0

Gentle ping.

Cheers,
Biju


