Return-Path: <linux-renesas-soc+bounces-11275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B414A9EFBDD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 19:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 382F116D6A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 18:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E106B189B8D;
	Thu, 12 Dec 2024 18:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="an4yADUF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A5B17E016;
	Thu, 12 Dec 2024 18:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029672; cv=fail; b=nd8zqa7BE5gdU+x/x0FkpB2waO8ZZ59WsnVXDuq0xpiKn7dQfGN3yKmVo1fio9pkSgnCrsMwNjC4llEGaV45H6EBV+ejnLHVXVucBmPHI/bPt1yS4et6P5vZCBr1iifaZIu1ACbbUYdaan3+tfTEPZeZwe2SfDyu4M6SJullzCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029672; c=relaxed/simple;
	bh=LReAC4toWzisH/Hmb3jgfIS/CiwAqy7lUE3ZVorBGsY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nSSIfDFszuNfh2UeLJL0F1vmfx9xp1jWFa/EJXwTPOyx283Pl+7/tpqLYauY5xZhCfEt59Bcdm0xAVStOpMuUEqH+c7Ncne+S5TjltD72zrXX81QQumtrKeixj1O5jVWrnt17sRAc5hF1SoU+2owV/ceQ6EtAuTpLuvzrf2iGWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=an4yADUF; arc=fail smtp.client-ip=52.101.125.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glet7axQK1a7QPAOHLaJjdYiGglNj5H96bhi5rdS/z+KUc3+Gqv/wBVfXVv49NLsbhQPDyXOqGWD/CiwkA/VgIWiy2HyFoBuDf+4e07DVls+mgGs4JgVBVHyMRDIaJ5O/Te/SdoQuJsRMdb0uaFbsXR0dSJSiSiuKnA/rr6NKQfmOWVLrR5slIr6bG6P3p7Kq+XPyPqQzb3famW5EmRfoisWNsrGnklI8na/l8g7vIrjHcnL+DISS2ZOqOW5vyVwElEaQgNCEey+db166+y1wDGYrn7ax0kneEquEVxNISv0huPCSmShYVWc5RigNaWG3sHDDVrSJvA0PbsgbIBKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9aLaX2sMzCHioaSFZ6s5tPUBH09lETaL5Nc9kKZ7v8=;
 b=B1asyZO0GoJBq5cYyvHG/MvR0lMYkPNcnBtnZlTfpesXz6JAn8YPXq6YhNyWEP5x7pbJpirJy0hKRqSlUFmlTwBxJAKw5evVCJ14vNIJnJsXz4ow8flwpTBc6UwvWhUS2imG/FtSqUW2T6BTMclkztdHviT4fdJ34FtLEx+nyo5sehtXzEM+agRM9rvikN0OZKohrVNaE9KYIjpScYr1NKQPmZxfnimbAsVO4PN/9EzbUjh1hCXeUriLf4VyX3a2wi9SIuJ7q0EhZH4eoUqva49yM92qLQwGDHf8zPoxkv5//yVNQsnxntiSK7Z+u37kDQHAz27OGKJoc89+TPYBiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9aLaX2sMzCHioaSFZ6s5tPUBH09lETaL5Nc9kKZ7v8=;
 b=an4yADUF/ferz8zZKRjYLxEqF3oeMK92mvsJ4+iV826KZn25UL+rWKyMpM9F9KQBW3f8t5joqr1JnqjoDZ+nHffg+DE3wYEAvRLegA97TwxjxWBnpJUiCsqPC1lfy5TQ13/Kf3VEWvv/GnZFIcovBm46fL27eUgkGtpKuR5rj/4=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by TYCPR01MB7267.jpnprd01.prod.outlook.com (2603:1096:400:f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 18:54:24 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 18:54:15 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/5] dt-bindings: soc: renesas: Document Renesas RZ/G3E
 SoC variants
Thread-Topic: [PATCH 2/5] dt-bindings: soc: renesas: Document Renesas RZ/G3E
 SoC variants
Thread-Index: AQHbSCWEOEdiAqsI0EOBGWNNcUzYerLgDC4AgALuWxA=
Date: Thu, 12 Dec 2024 18:54:15 +0000
Message-ID:
 <OSBPR01MB2775281B15603C3722A91244FF3F2@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20241206212559.192705-3-john.madieu.xa@bp.renesas.com>
 <20241210215534.GA531298-robh@kernel.org>
In-Reply-To: <20241210215534.GA531298-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|TYCPR01MB7267:EE_
x-ms-office365-filtering-correlation-id: 68b5dcaa-e84b-4a90-e618-08dd1ade604a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?csosz0BCpih7u+QcjqJKrZXYUEqeCHnHIrfiA8TaAilpRLPbbb2HZIWRrfh8?=
 =?us-ascii?Q?k1jfi5RNRLZfsPooANKZPRjrMiZ2Rx7PI0/8hkGDDUluBD7zRXV1VoHIhWbz?=
 =?us-ascii?Q?946rm6NrrGIQgrhaHnvxzk6wKqeoURDcXfCyuUA7gfAmwDSl2oLGylVCwEvk?=
 =?us-ascii?Q?/ipFxqrJ3LFipBZ5Fx0g19VlrFhpT1JQKpSPfndlC4r+hCcn0u2saBilqqLF?=
 =?us-ascii?Q?u0p5R5d1XmV/+qqwkEKIdXHUduRgkrA0AZoIuzIwxzWfHBUy9W2gSfyBLQ6j?=
 =?us-ascii?Q?EL4eBVE1Egt/ZwhBo3fJevt/kzyzk4gauAf3VwHT4YV+hV473+3iHE5KiQkM?=
 =?us-ascii?Q?BOqCMyc1PjmsjMc2bXZt1FmEdd9rZbOqohBNzyWiATaJuckK/ixazMkBl3vI?=
 =?us-ascii?Q?gd9Merw1LjOXkp/+e/i/xSjdAaWV0jIA2U8uxNDXq9bgGu9HZMNQvrH0CPTs?=
 =?us-ascii?Q?ol53gUOURuzYkxUm5rQDnEs2FB0u/snqqHGgIVE8f+4Jjy+mNOHFDIPW3JgI?=
 =?us-ascii?Q?h7h9iZk1hs+cxEyRwMYpofILdGOnEeVK4FNOXm43y/Rw9v9pKBCCPffvElKU?=
 =?us-ascii?Q?TYbxCRwlcF2UW2ijGZMcLt0jGSJe3g2m5I7lRASKzO/y+doTLZVszVJixT65?=
 =?us-ascii?Q?CashvetDqsZq79f/gAZcCRZkzCVAAYZ1nmOhSCqO3pyNQ/wOGyNgEmcrsgUS?=
 =?us-ascii?Q?gJ159Rg9tDaB6AklKPtC6SFZ8cXese8js3S9viyKL7DTUgCzICCrYTEXCSz9?=
 =?us-ascii?Q?eDtjvgGCFpT1GonUuspAAIvQ33dkgzCjr31wBkB/pZcEYdotHxwYFzPqmo1v?=
 =?us-ascii?Q?87u8sOcIrNEmoegO0nmXioLozbaaE8M5hW3frIOdj5v7KANydy1nvvrPSnID?=
 =?us-ascii?Q?vAivYelTRDYU4I5qLJFKoiAzBzISzjexBfi1y/ZAThLql06lU3uwrLjeZLjd?=
 =?us-ascii?Q?kcn400oDryRXhIkxcFgtqoXmNStGRuFrs8nxlnfbMaekY0CwWWlWVH2K2GU7?=
 =?us-ascii?Q?qQQclyX6QdACGdIxKKzAhuLacSpE0j3epZXUyAGe76uAVMbeY+egZZk+WoW+?=
 =?us-ascii?Q?qDEFvvMAH/JlaMzDQAs6Vins1VF7zXFChlqCJxlv/xGhnmTgN1CLUpd4c4Gr?=
 =?us-ascii?Q?Jbj1TqrKueLEJ1vJ+n4nnhZRE2IsIZlAGSUtU7B+zLlqUyAbeFiXJFRNg+Nd?=
 =?us-ascii?Q?HSzj9f3vjbTJgmXiNhmiK/rS5aU0hkZswuLT4XzMmGyBtbtuTDYPoIA1rs4A?=
 =?us-ascii?Q?ulhLYfBISzlt/k0kjW1e1NVZm2/FIEdt3v5sNU9gAlZLvifsId3SOt7aDTb/?=
 =?us-ascii?Q?zSHccU5uEL0ONB0XJrXbZfhR9lEngSYsSafu0mh8zgexH7gt+hPED/LKyuCM?=
 =?us-ascii?Q?TcZJlLgV5pG2TdiXV9Purm7UJahDkZ4Eyb8wDHhB7gj6W61Yvg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Gq/BsPpXmMB33TBAYDLPy56R/JZGieOh1KXAk1L8/1Vhqr/qN3m6ci8XvUdq?=
 =?us-ascii?Q?kj2WWFLW8rzgGYO+Hna0zpHWvrXEOfb64KJlRWRM6ku7oS9oUm2ny+ui1nD3?=
 =?us-ascii?Q?BnCcxaRcDlrImkgXB/lsPs/QA32LQkvfIea96+tdgc4leV9nney4wLaXvW29?=
 =?us-ascii?Q?+ZRWPf8uBzCJ3SGJr2bUTI7Go8nM1hCwfyhMhZ+dysXZ4+XOE5H2cP7gLFG2?=
 =?us-ascii?Q?nN0Au3lImFgNHyrWrfIcJLvItrAVq5+aZSCP5/lb2p0qtPAz96ppJjofRb+I?=
 =?us-ascii?Q?H4NH0fBFhuG7jPplUGYY7oYB7FslIUKHKeiJYy+I+HXlR2CrDfw06SgkVjqX?=
 =?us-ascii?Q?ee5fO0Ao9z5SJCiOPVnaHvUYifZVqmzgt8dLT/zoFQRAozDT00ZZfVXvIVYl?=
 =?us-ascii?Q?allWYxczXKbD6VOGl633ZfAtDAZadzQgn9xALcDiYaoU5ERPXeESW6CB9G++?=
 =?us-ascii?Q?TTbAoqp9MPgz+QJ52qJdNrbQx4GoUc66DuFv3iqVIXvvyUPBYohUxT35woV8?=
 =?us-ascii?Q?7lLjLPv3Q1EmGOvI0kVHyEVAZGjPOPDhoGO4ULHCGmhrwr5icBn6Oe0LcLIv?=
 =?us-ascii?Q?81i7X4yRlOHsAjtgEORB923ur6J/oST9Z6SDYLGeLu1XgwIUrb0DmZnnxwnS?=
 =?us-ascii?Q?SpOWyH3n3HyxTY8M82lp+MItzwX6ygj1p6eeQ/gzMSRCL7X9IX/E5diay41O?=
 =?us-ascii?Q?ugUZAo07w91METlKgGsw4pzuvB5soXcFLCsVB/3l+loQBy+Dg4WnXa0ve6k+?=
 =?us-ascii?Q?F6CWen4JIeViP6bFHqmCgdEArMyqFS6J2ijVydu/T4wBDWBp5uzHCOP1YGLG?=
 =?us-ascii?Q?IpKybdZj95xYma1oFjEbogW1Sv0JP/iu5EjFaEahc6EHY09kfiMj678mZ9+1?=
 =?us-ascii?Q?gNSy4iNvrVh57mRXbFHF3oGHrU4HQ1n3BhNi5k0voj4O4588jrBdveBcQ53q?=
 =?us-ascii?Q?n8kpGHed58x8IiPHueamF5Udq7r+t/EgN1Cvd4gqzdFaOIpmAB37DhAiv0XY?=
 =?us-ascii?Q?C0H8hmruveUhMoAvtmICzBebB0Bz3o3Bru18vSTpQWJTp482mox8S6oJa8s/?=
 =?us-ascii?Q?4Gjk3mc4txa9hlsCH7KpdMiSKyPvA+H2t/xZDFV+7AK2sJu6hY6MlSHVJo7d?=
 =?us-ascii?Q?O2KyvAhM8RYPUyZFg26iEl+K9X7EgU54Wm4fsHRiRSSVn8SQ7oWjGi5UXUA0?=
 =?us-ascii?Q?mcJ63WraQITqHuI6Mp7MFuukmftP3WBpwx4X47nySxan9KsWGPGsJ1ORlGkh?=
 =?us-ascii?Q?mzAGrx41sIGUVhtlRBE0waCjrqTpVkYsc8g18JrnHcWThacs3rc2F6Yr19Wy?=
 =?us-ascii?Q?dXgug6GDVBQ704xBHDzyLnPY9FRfi7cxjrK8lOx6b07NLAo4ASsrUq6DDUHQ?=
 =?us-ascii?Q?TWgdvOl2sPO1zg85RLXmxK+y7QQXI4P4lmVFlCD2ya2U8nrDdviJE48ezW1H?=
 =?us-ascii?Q?UVEOYxOCUXrBTUvGXqJp8NKeLzm4Kt7FmQiBX6xYgp9VPhvP1NBcmCsSJXT3?=
 =?us-ascii?Q?oXfH0Vpei3+KfhzM1PIA2wM3iyFRRnmA5rPIYGWHBO7nNFKnXCrk9TVwPxrk?=
 =?us-ascii?Q?bQUZ1w9Es8+v0IwRv76HoehDkWB3jIARd4cUBv55gRgee/+DkX0WcH4icxZL?=
 =?us-ascii?Q?lw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b5dcaa-e84b-4a90-e618-08dd1ade604a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 18:54:15.7027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: No+norYYHBmmbA9yuX74ipYdW7lM5n4EnmLZY84pPJDuSOtYy5hAh3XK4dqf836YpezUBxsv0z8rsUXLzIxYklkX7q9xaFi3dOAbVFvL1yU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7267

Hi Rob,

Thanks for the review.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, December 10, 2024 10:56 PM
> Subject: Re: [PATCH 2/5] dt-bindings: soc: renesas: Document Renesas
> RZ/G3E SoC variants
>=20
> On Fri, Dec 06, 2024 at 10:25:56PM +0100, John Madieu wrote:
> > Document RZ/G3E (R9A09G047) SoC variants.
>=20
> Your subject could be improved so that it doesn't match this one:


Sorry for that, will fix it in the next version.
Thanks,

John=20
>=20
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml   | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

