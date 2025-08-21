Return-Path: <linux-renesas-soc+bounces-20818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4419B2EF41
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 09:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673791CC20ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 07:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079442E62B4;
	Thu, 21 Aug 2025 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="myZG2OzL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF722D7806;
	Thu, 21 Aug 2025 07:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760565; cv=fail; b=Inl0mMFp4fCLL6cbuxW4lBbC91eJIDxdiVLkNbrno5P9+H/Hgxbg/184r1forI8YQfhE91Y9Bmn7MTT+94D1yDHX5zhxqyhX8ygk2EAnT/QqpcuCI3N3jntfpdrm4uVs4ZY3t/PUImDJGKR3V03OJRItKatMNBC6MP3HnCAukPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760565; c=relaxed/simple;
	bh=x+gd9GRTeplStdk00MSVAPyfhOhQIKEdvK/CTviCY3I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YQWS6f6ayvrnxAdI1YZA+oNNe/Gf9rTDZxRj1sr70qAeWTAjuRtpv/NP/Zp6ty2HbJxCMCreh5xepr+pavDCDG/pqq0c3kseguigtV0nh3VbCd7Zs1wM/ZnDrlbG1ez1P18hBydToMl9Z/j6ZMk0/WBlcT6TM8jcADFacT1oaDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=myZG2OzL; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBlXuMq1nGvK7rTbFKD0we2cycwAilzmwoaXwGwF/2oEQmysQWlsA/iwFM+hZGQOPGdsx+y+5aCxnwKlihHqGv2HXOJ/VeMlmmbWA1iVkrkwZ+HvmAYGUhTJcLqQR37gneYSr+xZYNlhoTEz3EAxDAjrtcoFyYLFwdidb116h40Egyfnq2K+jXCixXyAqDCxbOpwTyjrH4kr09gqIRdMdRlXQCU9OyOOJGoOHMLpilv4T3kE8qStqmOHh1wwhbksMeddROi7qEaW8OiixBQQUJt80zoadq++X/Fc+9V64hRKC2qDiAozTryzp93XY34ICZVAJNVnwNAyQOoJ1j+HJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEiaeoL6eVq+WGt0MQLT0ZymU5HdKs96XoQXOxr8ra8=;
 b=uVtXpqydFjEFGKv7h1iRdLPkyQvMFF8CKTjRT9gdvbjWSlZxS5flqcqB7lWrSbMXbRhHxiEqy4/Zm4UMY6NUd+elBbEAaJG+0r6eOgeaqI9PZoID/fk0r3euoh2Qv4mxnyzSptY68H7odpluFelLgX4hBfwq/Rv8c4m6iqS7vKpVKf/cIaiKRIMiMnAYXc9D31CF7C0aJBywPsXQjQmZivM8Fsob5Uo940riHLzomIYj4CcDA6KHrCzm2MpEvblsaocZpFnCAzkNOY+e+ZyBDrfeOVldk1+fLMwPCC/wbn1hhdkBaUOCGu6bDGxiUsSaZCCvV62RUNtWXMUQf3I+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEiaeoL6eVq+WGt0MQLT0ZymU5HdKs96XoQXOxr8ra8=;
 b=myZG2OzLEcwJTxuhl0a11cuKkCT5WwKqrP8nIVyXZGVD0jKDYXgZLvJohofCfWL2XG1rGDqWvJp2W00gYxbZS80hRQCda2ldjtbUmgLXmtKjw6KqVUJDiN6/FZeGlo0nfipRm0V+2LEcoLVrG63dPLcC8AowvObyar/Q6ATEjf0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8902.jpnprd01.prod.outlook.com (2603:1096:400:169::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 07:15:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 07:15:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Thread-Topic: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Thread-Index: AQHcEfZvZDRnta0l60q2xS4yxsPDG7Rr+UIAgAC25fA=
Date: Thu, 21 Aug 2025 07:15:59 +0000
Message-ID:
 <TY3PR01MB113464F2ED8BFBB823B038C038632A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-7-biju.das.jz@bp.renesas.com>
 <20250820-onyx-salad-c5c96f6bd480@spud>
In-Reply-To: <20250820-onyx-salad-c5c96f6bd480@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8902:EE_
x-ms-office365-filtering-correlation-id: 809a2f64-a80a-48e2-5190-08dde0829464
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fxPv2LRuDH7SXmbzRNZPyled7BiGgavJ9VyuJb5thYJiV+b6dUB1GHv9RqL/?=
 =?us-ascii?Q?aq8SMx4TmJJzx4IMDcG6E4L1pcEPdMwhDTdEkyiLIEfOzwlthoiQMOxmH5n6?=
 =?us-ascii?Q?iSRm+FNVQO/8tp0sLscgeGti0wAAMA0/rT7Mz8R158WOpk8K26R3+BaK950J?=
 =?us-ascii?Q?s0nIJ0BymN+P2xMl7Uni9yAsQDIU91Z5oGZlnt1uJx4HbLfIJ12JOl2Ep0/9?=
 =?us-ascii?Q?Rm4rSi6JoubD3DuDqGBZqaQPYl2mmTas07/zrWPV40FOWsO3QCF/vhr652Ri?=
 =?us-ascii?Q?aaXMyf3fDzD2jQJSMsJ7b3jWNoIMwqQe3kDfHaBLX1CBr2tTDEiRfh3dT3y5?=
 =?us-ascii?Q?cyeTgTB3Wo0R4NVpu5LsGjQ8sOKbQz6u9FPAckYocbp4TsXo3CPeURsLpqN4?=
 =?us-ascii?Q?0XQQrmsf3HEt+zl/II1s5dvRFoedUNHTYTdt51UCAVhL+GBx6RVC/NlgB6zM?=
 =?us-ascii?Q?Mc722tM1QlDBM5ES77vUYDOUDMuKZvDbBUXqejv1gND/ObvR1iNU9dmA+t8c?=
 =?us-ascii?Q?4M7nIADdzjXybAbu3iUoDAtv0ApQYCAzEbW0+RkA6cF/RhGSc1OxOgVzQrg2?=
 =?us-ascii?Q?PfS/zmLtru5Ef6I8ixMF01UHhKBIMf27Q+AbSJuE9Z87MDwlaAzsLNXuV6Vc?=
 =?us-ascii?Q?XLc6N3gVGVfPPGqFJNswzZxDNKKMZy5edFi1Y/mgMRAU5yC1Zu5k6zFCtS1W?=
 =?us-ascii?Q?ci2CwdDkjwoBwnsKnVwSb32N6tgMRh9mnTg1DLQ+wwwJznwiKUTt+VW+WDqV?=
 =?us-ascii?Q?D1DZIGhc1tjmcLbKGxG17X1XBgzFYusNHNReAke58Cte7Pf5FSS2YSLrb7CU?=
 =?us-ascii?Q?uYXw0B+x9mOfPSOThx99P3KCMBXJ6t8/VeKULdaURSgkBut22UYzGygN9iYz?=
 =?us-ascii?Q?P470Gb8kJG9r1P282kq03yRQh8fOOgS+UykD+Zl1ED9vtxXSAzn1j/qaQ/AM?=
 =?us-ascii?Q?0Yn5kOkfamKZzgbOD/DoDrPiOcFpK4UZdOUVU0n6vG4J/9WvMBooBMHz4Gxi?=
 =?us-ascii?Q?DB+t1bDKxMwGa6g7Cz5cGItCVoBJnqGuieLY9SkkT7sxc3HjxJb3qXnvhmdv?=
 =?us-ascii?Q?1pwFyNlWiVa3XeTMNEZx2D1+PCKf4o/JKdxH2X4j0Wp4Ms5dCt7XNUdQ+u3S?=
 =?us-ascii?Q?dILdDcU9f7+il3grfTcDYLzphAxaThI8/yxfwA6q2DlkHHaQayzAG2kehgNW?=
 =?us-ascii?Q?35UY45pQDnDhG97uau+aWWEn4fc/fNNOZuJ6RdR3nIFxuj/Gxbx7/gyk9F7X?=
 =?us-ascii?Q?CVHn96A5wwI0bj0mZKolHIxj0iRhMpPp04T1c9qfB1U2ZwAZs2pDzJtNlw+O?=
 =?us-ascii?Q?r8Oa7eBRitxpk39xf9kd0lcEpAvoOBSt/PVQounh9bQlH10MIdvhJ1s1GGwl?=
 =?us-ascii?Q?+l2A5sWT77oWl+HwcC+38PI/Jh2lWNlXBkfTfVrW6oop5GCHvQlaD0MNe8N+?=
 =?us-ascii?Q?Zv107gAYW78=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xqxTTHasTBHoJWd+a6v28aLxmp0jnJZQm/HsbFu3G/iQ/l5OWCNV1pxKZ2DY?=
 =?us-ascii?Q?IU0TviX6I5vKQltulIJIdZD57RGGL3O9aB+6OLs+ZBAmOEUpLCRZYHFObK4E?=
 =?us-ascii?Q?mQmrYVkkNrs3cIk6+DxB0iziRpxlH56u4DtIbyg/lgBAe6nBPXvsbrETvh2i?=
 =?us-ascii?Q?LNtzMxaKZYwj3tD8UpV1BMCt4XM5gzmP0tUvleem6tciQ6HpJmNDvdHAGGuE?=
 =?us-ascii?Q?t0tYvDeRPujIhcY/zXAFWiO2yhJJubzNZZVA0//J44GcZd/M36ChAOGpRj98?=
 =?us-ascii?Q?ufp/qIHno3Swvg7bb333PofIPMCVKYIr5dj0gJ8Y3dNuQi5xAenUm9W/uhah?=
 =?us-ascii?Q?+D2fO8nVz07obAQOPEe01B7mhiMlC/O2W2lk5WFqvrCY6+bJdCug834VeALd?=
 =?us-ascii?Q?jfTeo589eEF8vNSPFwQfpGRPboCl0c2nSpm/X44w4csrykcOjE1WW72YZso8?=
 =?us-ascii?Q?0NnoLu2Gi3nMgsRgHn8kK6SBLTjNIbluNK3YPv/9Q7Bhj3ijsLodskLEKnhR?=
 =?us-ascii?Q?lq0MTq8I3dv2vaLRoEqPmszJDO8Gv/T97Qiqfup17r8K2ijkX0W6beaRew4I?=
 =?us-ascii?Q?TjBASU0Ci2m6HI4Bq/bKeNlRAgxlPXTKGXOAUDEdrr7AmhTaNZ/V/qr5k/YJ?=
 =?us-ascii?Q?a8f4jdrTS1UPTKPD2TmnaM2zAPecxEgmRMiSIr+xM7r4QFVQ0z2QRkL1DTSO?=
 =?us-ascii?Q?0HCdAq32LAxkrRbZggP6eud4y6uifyf6BwCl0wijUsMk+yp1YqcKH8WQBTFK?=
 =?us-ascii?Q?sauBZclTelxzVaHRoSuXE0S5vlipeRslEnL4qdKQpCQLeG3iauTduq+4swHe?=
 =?us-ascii?Q?7g5AARGYy9ZrAmumwcG1BU/RAhjy1uPe8VH3QOZ0SeMM6oLNW3weTArHWPQ9?=
 =?us-ascii?Q?dR0ezFxnR4n0d5zK/NtBSGWm0sA/1B3pXoCblHArPN3hxCSOSmyaTvpkZSIc?=
 =?us-ascii?Q?eYY227NR/Va86TKrGyDz4JP7XS0Pz2bo2rKVozzICOaraEm90spxb1S4kswy?=
 =?us-ascii?Q?WxTVvf+NXpSQLqa1fQkA1abDMchtwXtI8tk2a7iHMErXcAHlnfy1VUe5b+lM?=
 =?us-ascii?Q?R4eh1YFYl+P65yJCh+Egbw3Amlx5j2x8Lwy8te0O3Czk99/t2tSt0ceWtF3L?=
 =?us-ascii?Q?guNLKfoOk/l1MzMuULFJBXewSLPN/M/rPi9MrFjOlLc0MUY/xw3sRp6pH0NW?=
 =?us-ascii?Q?9aZje6rmzipU4MVZszVwLH/UY38JRRQrj0LiQRNUtkY4octtYzUyYxLwca/s?=
 =?us-ascii?Q?HJN4adH5Vh/sA+WUdpJZ1nleCWZucv82yCW5U9xIc/bYafcXiSoCK8cIKfdW?=
 =?us-ascii?Q?wZD9hfbWmkepqYLzq43DLEmgnc0byVLfu1uwEab/030tTcblRdOuNfyAjEnl?=
 =?us-ascii?Q?Cy4pF40bcAhtLJQjmudgOC273m0YYtyaZkE6td3zMZwEb/fZe/5A/puGZ1Q4?=
 =?us-ascii?Q?e+PXlxb6oC78fznTNaILHAGZJfSVnslj0zJiHc94i17sYLf07TBW/daIqA94?=
 =?us-ascii?Q?/TV4hi/drdyzxe5jEXqA8w4inaw1+jLSk7nWZEqgRAUb33QyJ0L16xK2h7aA?=
 =?us-ascii?Q?gT3EfFs5FFcjtThngLAL1FgzV/iMvm8ZV7oZtDqS4akbFWT7/bql4gZiS1pn?=
 =?us-ascii?Q?FA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 809a2f64-a80a-48e2-5190-08dde0829464
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 07:15:59.5931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AkOgkIVECNXUKj93t+x7mzAvyvtBx+ZYwK6n2iR6C112CPXk/vi88WN4QFnmE2b+T/f5MAlqfwuzlAY7BcOU0UV5Y6NVGIdPv22RMXkRvcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8902

Hi Conor,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 20 August 2025 21:11
> Subject: Re: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3=
HOST
>=20
> On Wed, Aug 20, 2025 at 06:17:53PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Document the Renesas RZ/G3E USB3.2 Gen2 Host Controller (a.k.a USB3HOST=
).
> > The USB3HOST is compliant with the Universal Serial Bus 3.2
> > Specification Revision 1.0.
> >  - Supports 1 downstream USB receptacles
> >      - Number of SSP Gen2 or SS ports: 1
> >      - Number of HS or FS or LS ports: 1
> >  - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
> >    High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps)=
.
> >  - Supports all transfer-types: Control, Bulk, Interrupt, Isochronous, =
and
> >    these split-transactions.
> >  - Supports Power Control and Over Current Detection.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> > +---
> > +$id: http://devicetree.org/schemas/usb/renesas,rzg3e-xhci.yaml#
>=20
> > +    const: renesas,r9a09g047-xhci
>=20
> How come these don't match? I don't understand your naming scheme at all,=
 so idk which is even correct!

r9a09g047 is SoC part number which also known as RZ/G3E SoC.

I just followed the convention used in [1] and [2].
Please let me know I should change rzg3e-xhci.yaml->r9a09g047-xhci.yaml ?

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
Documentation/devicetree/bindings?h=3Dnext-20250820&id=3D44b91d61c505863b8a=
e90b7094aee5ca0dce808f

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
Documentation/devicetree/bindings?h=3Dnext-20250820&id=3Db2d25905366b4e6791=
f60e6bc76a636d1b88e6f8

Cheers,
Biju

