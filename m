Return-Path: <linux-renesas-soc+bounces-18016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17234AD2F1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 09:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1288188A2BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 07:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3915D1DDC3F;
	Tue, 10 Jun 2025 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Dlp4z0Oi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B30EC4;
	Tue, 10 Jun 2025 07:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541597; cv=fail; b=WHVNnmR8AT+0qva+UXddsZzcs2BvHWw1BrLkQFJtc0OAoQ0nnfTLvo05bPxu6Z25UPdPU3pko4eqXU1Xyjq4320wEJyoLxV09Mj+zq4uNALypCliAaPO45QToiz0xY526lBJvR4rk7WS7kPlb7K1fbSCyJtO6P1SD+c1+gNe1gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541597; c=relaxed/simple;
	bh=DDhQrrF90E3dxjN+1Cd8Y5oZrWAh/e0fSR6BMmke6SA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MuwIV4a9jGKj9Fhisykaclvix9Yo6lc/vqNGPLVwPBJsh1X/wXHZuqFYzSoUP9xg1Hn9Px4ZdGS7eNVjFJMCTCjjj8KDcEavsXDb2j4h8pdLe61dh8wdjefwa+PRj6sRT3JK/I8KkT/gM2fV6MR+Xb0GXhtrlgitGRNaNs6VX24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Dlp4z0Oi; arc=fail smtp.client-ip=52.101.229.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mhz2KzmKeNaliNUYMPGwr4fkuGbtSDx7BrE6rfKBVNBgh0HnjxJrhX6TKZhCNhAwwdkY4hGYPvWkNSw6MBWqDV9vTx8eAtS5x+PUrpBnScoiU3QlshjzqyqlhWtQGknqPaAuHA/9x5fhBCN1HkJZYTCKewzu6OO/ClVzw+DqqVN4DFIfr08REztO3B6S4G8EN9bdZUvYW+bbcSNwp1JEThE569OF2iD0UhMEVGQtjx+yodeljsHYRHj5kgtVCUaN5HkLOh+6bevhDi+mNCGkuu6Yk2LnpRt9SHos0PIHB3vYMSbFWoYQuaRR3aTu6/MNWxoUaYT/GKOfBlBkg5XS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmOYmH5RQHLL+jjqgOZU45/J1PAzzpNxbtDksaV2UXk=;
 b=DGwaruIObQAaHvIBL9FTUdD5WjexRaKkO3LOHSfNv0p6Mft9mkllsS8wbIGnAl4kg2TZAXrSHjR35rLikKX366V0EKzn5oktdPfJMk7IMHuz1nGBW0a9RsCSDm4xZVx57mjOPJ7cNlDcVMBVQeITvhu6B7reaes343L6oOVWOI9qrUpsDGUCrXbz14MiCZkz8sifEYBh5qfW56xtpKnzOdTtrCjqryTQPKFjakqsQ2Wo/S35f2/znBWwzPnTSVNNyuev9/hb5FPaVD5zJL2Kz4lcf97aMGIiB2AuPPS2XfPvuSsxZCEbUMnIGLTpUXAI4hrWSVQGhGcTg/ZZl8Lhlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmOYmH5RQHLL+jjqgOZU45/J1PAzzpNxbtDksaV2UXk=;
 b=Dlp4z0Oia0IvCbPST5HdFsebWPRJc5dwxwjTaZSskAoYEF9cectMS6kbhG0d5nJR5nLrIjOClNnJnNY3BepeP8h1NJv7bNVtbt0Vo9CaEpaEN8yapML1UrmFR0eTJczxayIoMF+AV/Xb2wzgnJRKrhKRJW7DystNpCsldKHYTNM=
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com (2603:1096:604:3a0::6)
 by TYCPR01MB10808.jpnprd01.prod.outlook.com (2603:1096:400:295::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 07:46:29 +0000
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82]) by OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82%4]) with mapi id 15.20.8813.022; Tue, 10 Jun 2025
 07:46:23 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/4] dt-bindings: net: renesas-gbeth: Add support for
 RZ/G3E (R9A09G047) SoC
Thread-Topic: [PATCH 2/4] dt-bindings: net: renesas-gbeth: Add support for
 RZ/G3E (R9A09G047) SoC
Thread-Index: AQHb1R1BfHFcHLJi6UmVzaLkmUeX27P6/IgAgAEQTPA=
Date: Tue, 10 Jun 2025 07:46:23 +0000
Message-ID:
 <OSCPR01MB146478CA8317CDBC8BFE5077DFF6AA@OSCPR01MB14647.jpnprd01.prod.outlook.com>
References: <20250604065200.163778-1-john.madieu.xa@bp.renesas.com>
	<20250604065200.163778-3-john.madieu.xa@bp.renesas.com>
 <20250609083008.0157fe47@kernel.org>
In-Reply-To: <20250609083008.0157fe47@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14647:EE_|TYCPR01MB10808:EE_
x-ms-office365-filtering-correlation-id: 90b5a89b-1b77-4050-e655-08dda7f2e5db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?kTRlhKNdtzea5/7uVesBTjSuLQLqoEO+0qMdgsgkXCdN5I9cTdn2gNGEzu/Q?=
 =?us-ascii?Q?mpu4scJVvZGfC92TdQlnyeHEBo6nmd6djZwyQbu7ht676+YB0BKlCxa9BI2x?=
 =?us-ascii?Q?XSZfE19x6FclTYQB5mGvVBpZ/fhHpSP5Fw1hRMR230zA7RL/HVeTYagLnYcA?=
 =?us-ascii?Q?meyQ0A+9z11DULj6/G5LFLFtSMB2LSpMd21h2yfWFM0n41cVga3ZWuUmZnSv?=
 =?us-ascii?Q?op/Lxgr3C2JXMJJijMdoa4MfmWNbiXxB20xOSHkLH6O72rjsOLd1Esnsynro?=
 =?us-ascii?Q?o4K06jHnwAUbn1c4Dq+9PKKGiYiD+mQR2qX3SzodpuljdkfdaBsWmbSzRo9F?=
 =?us-ascii?Q?aUNBywVJbI5B5pdGo995ObiiMSxXm3Jf7JtSgpHHpO9x5t5KGvEvBLzyt0a7?=
 =?us-ascii?Q?VSklIESuCjCPXgB6k8CLcBmTziNk2PtS+iy2IDYkmbAsTi0nyAfRqjUfziuo?=
 =?us-ascii?Q?3gFf0CbyH9ugXBunHcacYt7LQYni8Ehcc9/QoStywzXl7vUBdfa74lwWxogZ?=
 =?us-ascii?Q?GHH7K7wXbexjRPSYMWXkQeRaKjsjVsJF3Em9e6A7tIbjEteCofoXYSkZH2SZ?=
 =?us-ascii?Q?88yJlAR76j4m7OXc3QdfPy7DIJl7I2Ss2IA46o6XmXK4dQDJo+adDNwFjLi+?=
 =?us-ascii?Q?72vgO3nk882bGRqJYB+PJjaGx+uiYJVffA/S1o3EfZZDjCj4UFr8S2MS8ByS?=
 =?us-ascii?Q?weB9rzqSEGxNdCD6AJQHPCXbnoewQa/0SYK36M+LLxu7lA/+Bj0GwahQTzKG?=
 =?us-ascii?Q?JsKPn5516TzOH+B7+TQgp+Rh+38JOL57pKvoi/95D8gXG+8VUvV1EokkXsT+?=
 =?us-ascii?Q?cf1qfvbGLyF8gXs2QuNXoDi2xyufMPacZZb7woY+2WLpAK3CHq1N7/T2c4T3?=
 =?us-ascii?Q?YRJfm+BpIiAmSp5sM9G8druz1pDSNaYr+UHlU4rHqTCGum8qolsFJ7HGpHkC?=
 =?us-ascii?Q?pcyJrEnF3KsoElNv9UvKBudfJr2FnodCmprN2jsa9u/yqGcBS+OJ5TSMafnQ?=
 =?us-ascii?Q?gBaeTzscTMkgCTLSV7cz1dkPIuUy3HgOzqXA6U2XqC8QnamubqktsDTFvu3q?=
 =?us-ascii?Q?9BiO6qrIMIL1QUzqdXpsZvEW8TgsCqpx+qVW2v5FDcTPs8BrMdVNYByQ28tJ?=
 =?us-ascii?Q?HA49tGWy2GOqiX1JBV/6foOyLzS2rviU4xrWnQr1tyMaVl6ABLhUC6hjAjpU?=
 =?us-ascii?Q?5p8PJPBTdHVCloq+qROFrrT2iOKZuFjLww4JooTxnrWQljWcDlkt9IgO0Z2Q?=
 =?us-ascii?Q?//cg1uXbE/aJYDy39cgyYreuNV5kaH3NIkCWoY5qGJIRUg0u0Hoc6Ckq8I1l?=
 =?us-ascii?Q?GHIPQFunP9blDnSWrHi/V8NS1GbKZ7/pM1wMf2BUIfrvgIgCjSEJbqcYmzY1?=
 =?us-ascii?Q?3vhhuEWBATmHPXj/Bqzv90uW6HR5tz/IDENfzZLsK9OAkQ2rMXcFQfAo++uV?=
 =?us-ascii?Q?gdHrCgXCzz0wkrhEkL4vmkQdZxsrLNTVMwTVJd3rTEOTNWgaM40k8YZCV0kt?=
 =?us-ascii?Q?RO1nkTQGgWpyVdw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14647.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RGQYa+UymkIGEi5MqrIssGwi23UGPp3coYxyMs8LdSm1WSAggRN9DKvLXiIz?=
 =?us-ascii?Q?zKCSTUwIePtO73xUmDs58Y+G5dHxZWdBGg4AIxzKPhA3j2R4nF/pGNkwkeZq?=
 =?us-ascii?Q?k0fG4E60Ln4fQeCKKQrJxF2uoSrKwJW6z0jdZ8/MlTKXtF569BrSNRPsFRNj?=
 =?us-ascii?Q?XyIl+NYbGDKcRExhVZjkPLnToFdGK05hwnrtlaIm/ArzsbKpgpg6txXX7GaA?=
 =?us-ascii?Q?l/A5vvxhYMFqMspShz07A3HxDZxmEXoQXgQJJb4Sp4CTh4Uf536vPgqTh8l2?=
 =?us-ascii?Q?ybX/M137DedWzzvpEEeqzdV+32XHZkKhFkLhcB4Yg/0ZnqNi3nOga2OjJAP9?=
 =?us-ascii?Q?BNRLr6k/euXQZv0Tbnu+qTCmESB5oJLvwZ+vPx7AQGii70B7Ayu0bK0kAMMU?=
 =?us-ascii?Q?IZKu/heP82VtYJFaGNJiS+e2uLK7+UpqLsGZF3GaoUpJ9Iyud4MoY/bAeVeM?=
 =?us-ascii?Q?fXStNdCTJ/WR+HwM61HAD2j2GZ3gNLH6twFFqUXSNty4FWQ1r5OhbSGiNiAq?=
 =?us-ascii?Q?lescCEI8ENCnzByyKZwYLa8iQlJsPNKQUXh2wY+/VSV87X5rU+GH5jjGiq9M?=
 =?us-ascii?Q?VOzoah4IM6cri4HvRMWGCGITcc6rV5n0wD2TRbZAnE5uJku2ssXthbWcl+HN?=
 =?us-ascii?Q?wt5UMBde0PZKc+T+AuT2Qmi8o2h4jEe78biIrqqtwowRBOPKyoMa8RlFwU22?=
 =?us-ascii?Q?zSgYFQ3/b3TJPHyXSCSEpWiduaRIrVsLzdABPLhZfOQt5uWjRe61V3QcYCDa?=
 =?us-ascii?Q?l9R7m3INVyU2od8rSzn/XPG61l8wkMEbeagZblqh+TvMX3IHGsThf8e3wDiU?=
 =?us-ascii?Q?cNDOtiW8XsJvS+azG3QoB0ZO+X3cCCRQypL/XmCdNO3uNF2kEJxDVHtceT/8?=
 =?us-ascii?Q?DI3rIJPw7cUx1x8JI/PhXRo79TtrjZmtTY8Zrwg0Ohim1I9GD9+GPe00UmDY?=
 =?us-ascii?Q?/S8aTrujh1jBA4kZdN+9by1MJICguzCHUkXetAvggb0eOxW5T7Bke1r6gaff?=
 =?us-ascii?Q?/Gat4RNUYUuj4dSoJaGg3Dcz+erSoqUi+nL11c29H+FB3pInGfu+4aqasK59?=
 =?us-ascii?Q?GLhgkgbj5Xkx1VF7JZQ7RYrF1Omqph2H5TO8sJ6aWXzMOmf8EhrJhmiiiyar?=
 =?us-ascii?Q?Za/3eJ62fNMN1WmiXayyg4ZYs4b4byUi/17xtZDLDYRYuqWxZVkGp+M5YbLb?=
 =?us-ascii?Q?0Zsviu/WAzTlH2A7Ilz0qQpfG4dmTf8GykhpqDFfjzv0AcVn7rs2Iz7e5EaL?=
 =?us-ascii?Q?GpsngjOAmWrZxQeMiudhCICEgEYrKtZSSeFpJIcSgKiNmf/pYsXWH9NjJn71?=
 =?us-ascii?Q?MXnUc0VZ+tSQUsm/gO+K3st8v8qkALzfaHqIS9UiixtkCNr6Eao0O7fFNqgR?=
 =?us-ascii?Q?uN1mdHFOtRm/7sbE4PFJ4oEs1g6ddnyrn4D1n9f2eJy8ICNw/+XnaiYaOJ2+?=
 =?us-ascii?Q?yVAz8YPLCCC5402hSC43x97/Lcks9lUqmlDIBCiWcfstWKyyqONkQ8zl/7rb?=
 =?us-ascii?Q?nRtzfNuzi2B6+3O/uTXnq3Fa4YRlN3Rjhfcng+fo/pqSEyTScri7JRuPXVAw?=
 =?us-ascii?Q?YceLN3Gr8n7aIMsnQjyQW8NciClN9wu627EUiTQaUMtQS2P/3CUyBsgMP3bl?=
 =?us-ascii?Q?xA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14647.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b5a89b-1b77-4050-e655-08dda7f2e5db
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 07:46:23.6666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lmOXRS2FRQ17Vus5ebaHGdqZ0EHM6ilxdQttRRQ60qUhnBcEOPoDxvNeLhqEZE2ed+1OUNv8EwMEqtUS0mcs1tmrQ/haJpm4NCQ915XxFd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10808

Hi Jakub,

Thanks for the feedback.

> -----Original Message-----
> From: Jakub Kicinski <kuba@kernel.org>
> Sent: Monday, June 9, 2025 5:30 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH 2/4] dt-bindings: net: renesas-gbeth: Add support for
> RZ/G3E (R9A09G047) SoC
>=20
> On Wed,  4 Jun 2025 08:51:58 +0200 John Madieu wrote:
> > Document support for the GBETH IP found on the Renesas RZ/G3E
> (R9A09G047) SoC.
> > The GBETH block on RZ/G3E is equivalent in functionality to the GBETH
> > found on
> > RZ/V2H(P) (R9A09G057).
>=20
> Could you repost this as a stand-alone patch with [PATCH net-next] in the
> subject? I believe the patches in this series need to go to 3 different
> trees, /Documentation/devicetree/bindings/net
> to networking.

Got it. I'll send a v2 with a standalone patch for the binding.

Regards,
John

