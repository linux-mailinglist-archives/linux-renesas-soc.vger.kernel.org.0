Return-Path: <linux-renesas-soc+bounces-24329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303EEC40262
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 14:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6840E3A999E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 13:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EDF2EBBB7;
	Fri,  7 Nov 2025 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gaEKcgN9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6363C2E975E;
	Fri,  7 Nov 2025 13:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762522637; cv=fail; b=pG3h8RQ8DPg++FG2QOtdIzX6Msak4KcjLOLGDl0UcURkFTtEGh3TmMBNRtAElSbdyg/HlsFlLD+3sJ48OG7oX9QEqtxUufYvTGVvDeZCOqfXD1yCIlioT5XMImwaTOI1YfctYKLlyeweNsxgtA/s3YVhnK/ZYEqEP9umjpq1Ipc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762522637; c=relaxed/simple;
	bh=ZvSJ0sRnhfQvUUPJyD7GRVSl0MFC1JB6WKCtFKwQn3A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KUvqBZwWn28ZIiXTnze/O3dwtOoBpFlX0qFq9qrLdNyuXTTLk6rDaMRKgs94R1ExmqvtG3moOVR38HwkdOl9d6nwhcAhqfTqzt2KHi34X0s8q57eFv6TdV4od+jMsTxERiTa+vYSepZwRyAHcNGacyOhDzSF0jsdsH4xVDnMHDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gaEKcgN9; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPF7hU1+lYwBto0tuOtymynub0yfSuSSth3eytjWMVPs/SUkBq3pespuzwsnYHbcKeyU7A04nARtI+Nrx1Fp8Vf7X3Ors3VPEBAJzjVZfYKbLK6agt7Cq0j9i68U7m3jOlu5R59K+phJeuEtgvO5gid2alT7tymhGPtguwZTIamytF+qoET0BvpTVaobBBAVUZYXRH3OkPh1/R/YNOLsRRlLYKBW70P2GAkEhnVoGbOpWBf/sGWglHykyoaJWvhR6kv7snfHivleAsdc2D9oZGPf3RT407ccQqb//KnxpDg7S/vziOjUVhuKoroeURb5UdKq0vycHysjwMadDfWUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zf2JlL9cWhrbZNDykihDqwTk7v7m20q0JsLVucnt3CE=;
 b=WMMV5y7SIrwW3vJSfmSExU1UN0xSLSw5I9oJ3hD9WSvZmXm1614tZSOzNG4lf10lB/WJRg0zQhsJQoZVJgFFcBtGoj74ZVtwaf1v4yBmTmbsdMFTmEEH8PYIKxNzoCeMik9nGm3Mlue46Cya2kzbaCniXZmZL7icDCkLsUbo07vZuMCXincC1qtrbbdggf2l++jtHi7md8vXdkY83sfDwO6oZ9ZJ25CFeJwNKMFgqRZi3ZBLF2Adu7pL0h4cWRT8jexDkkMNU8sFmYIn90FtwPnI5tL+MLJSUDfteKd04Q0bhiyWG7ItXjE7IzNl6ejXhsteaqaXbrPwKic/Ci9lvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zf2JlL9cWhrbZNDykihDqwTk7v7m20q0JsLVucnt3CE=;
 b=gaEKcgN9bdBJpdSE1lVBspful5tzdh/vIc6UPUOz3RFt6GSdBEXNn63PsSCFY1K7EtbY09ljF+53V6NkgBxKjc3Q96cfIx0pzBO9m8AQb5iMkabw5d5eEnUb7qg87x4G2MYNEA/e7bKQq4PzweScsn9jQngmx6aUl2IeltBD29Q=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OSZPR01MB9548.jpnprd01.prod.outlook.com (2603:1096:604:1d5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 13:37:09 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 13:37:09 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
	niklas.soderlund <niklas.soderlund@ragnatech.se>, Paul Barker
	<paul@pbarker.dev>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Nikita Yushchenko
	<nikita.yoush@cogentembedded.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
Subject: RE: [PATCH net-next 02/10] net: renesas: rswitch: enable Phy link
 status pin
Thread-Topic: [PATCH net-next 02/10] net: renesas: rswitch: enable Phy link
 status pin
Thread-Index: AQHcTxyxrfXSRPKSRUepba0KAxc+aLTmagKAgADO1DA=
Date: Fri, 7 Nov 2025 13:37:09 +0000
Message-ID:
 <TY4PR01MB142828212650327073195FE4382C3A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
 <20251106-add_l3_routing-v1-2-dcbb8368ca54@renesas.com>
 <eda96e9b-2a35-42e8-b1dd-ffde39644fbf@lunn.ch>
In-Reply-To: <eda96e9b-2a35-42e8-b1dd-ffde39644fbf@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OSZPR01MB9548:EE_
x-ms-office365-filtering-correlation-id: 9cad7b65-283d-4a3c-1460-08de1e02c045
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KODNQQmnm9EDGHEjoYk2tN0NlezpLRg0HaadSj7wV2QkwD+YxFhpCNCQAHEc?=
 =?us-ascii?Q?ZYaUQKi1KVUtGJ2WweQ+40pszgZn7gg3SBWQEGATE8cn1HGACWScfOOSTGva?=
 =?us-ascii?Q?cmLzuEJ8iufX23InVVMEIqRpujdRt4jEBYp6XFmETu6JBvCeqPWLp6Fdm+r6?=
 =?us-ascii?Q?UzGaRX31W9U/YYD/jlklBB68/iZzDlnUzTPCVQp4RRzqw+xcI3dY8ceaBzkC?=
 =?us-ascii?Q?29lMVjyFCiEbl0dhwTkpWaR7LkeBnWUNDLpNJZ0mpS/XyCa6LJpdASunMdy/?=
 =?us-ascii?Q?/1J0HEu67tLrxpWKf0/B5k7taDpFkU0ea+RjYhH5BkOVjteujaTCQ8mGz0KE?=
 =?us-ascii?Q?XCjnXY8eRfY8Ij6e2Jubz+o3e+nDzs0vheZVuVUEamfyKWolBqFOBvGOdeoJ?=
 =?us-ascii?Q?GhWfn3/p+7oNjR+VUzGoanJhfGBlQexuEexrpscEhlXSmIQCBjg1utOtbiz8?=
 =?us-ascii?Q?sjNFOSvDBjbcddGUN7szf76C13ibyYsqj5LAhrhwYnA7457IsnDpDtTiAluE?=
 =?us-ascii?Q?1iv/RKvmdMtrKKu6mC9jjfo80RLk8SCi1vdUzZMzg0jX/Ba+5LZxtbX1h699?=
 =?us-ascii?Q?LzfiOglXkTlGssLaZoKJFyv4wj4rwlcIr2QvJLOOh1kyCmRTBvIYiJFPVuda?=
 =?us-ascii?Q?CXzuu8d76Snk9sFLNltyRJtnLR6wcjYw+PyFwBCRxPrLeAmCusDwg0++4JvC?=
 =?us-ascii?Q?tJ/RrVWVU9TxoBwgsvSpJZHMawGp1a0HB1gAoMHfSGf8SXQ58EpjsoaTUY0K?=
 =?us-ascii?Q?zbP/8PNmbF2cndtehlSW2Pu+R7ZdgjHxbOl0ZpWQfG/3wknrCMzdWGCalRa1?=
 =?us-ascii?Q?z1r8MlOkR9Tj25ORSyCKYrAYjaqrLungqzBmVXjPc8wt2La8iwuQQF944wus?=
 =?us-ascii?Q?afJlYiZho5IyKy0t2h4/Ov1kENGfnHOc4WQoJ41WfFJDVTVeAyfIk9ldmiCv?=
 =?us-ascii?Q?VrSLwoknyVMpnR7S/Ke9KvLypd44mj8DCQyHH7sxr5+ulQmRDpyjq8a71uFa?=
 =?us-ascii?Q?eFlDhriv1ZpJWBM+Hdy26KSknYLJKWISVhFWUO/8xQpkWApxg6pz46L/CFYH?=
 =?us-ascii?Q?P2lO1AFRDPe6PNSvzZ8j8fSRKfQndO9E7zfFTtRBykiljak3jOuv184RCyQs?=
 =?us-ascii?Q?XqrVtPvF+K+18MPaYIeNfslEhLFtchrFmkmSOVJX4yChY/icQp6Zf9K7Wd+I?=
 =?us-ascii?Q?VjafwZSXt1BesQVig7IY+pEHs1cxQaxy/wkWGpvjaWxd0rzUei23SUIXXtYU?=
 =?us-ascii?Q?DSggFRbtghfw68zRn+bnZXQ3kSKanUuzZApPbsW9zDBpJGo8PCM6g+EG3VVv?=
 =?us-ascii?Q?TwEVK12t9DNrfVA0A0SwaMRUYGIxwCwP6SadiSAxZj6QETe6qP9qvRh9VppP?=
 =?us-ascii?Q?uHqks2uDzol1c49fLyJ4m4XrxO0KqtNOCsTsMnHJ0VseozVKSfGDkQmt/iey?=
 =?us-ascii?Q?17se3kZsA7McdW9cgC+XecSXODd1pq1ebp2WzqdgC8jHBz08M0c+1bv4+zUm?=
 =?us-ascii?Q?YVNEpSVzBNu23yCrQ1E4Fr7aOaZjurhxtESm?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/w+Gd5Pf4DztsrD7DFm7taJEGN+k3T86hm2dKHAqVcUqb/foha66hydxOktS?=
 =?us-ascii?Q?eUV5S8LDwdojfDUb5A3CbkhkJynQcOn6MxboObdCvkb/+5jK255iPby3efBw?=
 =?us-ascii?Q?mod/QlyoQlIQ4O0gAL/bIvgOh/10hKBMg6Lz9qMJNtb6PWU+HLLq0UHgx9mB?=
 =?us-ascii?Q?/Ndi/zgatziT9QRtARhm2P4Ykx5/aAxgbmxFzuDjgfEfLClbyJpnZroFOV48?=
 =?us-ascii?Q?dR2CWiASrtRUBbTtvj9ogUyeFBWXNLFEfroffab79ROcilCuu1GjlE58GIMb?=
 =?us-ascii?Q?uArVLUUpUEBYIlb4tyAZEbpzuLVcjZL60+kHwKJz37PE4tjSQkSfrdNWP9oY?=
 =?us-ascii?Q?Xazr1ys0ZWgbmFr16Hh4H3kevi3SRc4fv0QNKVoYhhkTimP2ARQtOOrU2eU9?=
 =?us-ascii?Q?GitnIej0mkpzqsmc1YNxVHegdmPhoPTXB/Na0O+mSB2QxFeRwZWh6/geNGAx?=
 =?us-ascii?Q?kkoJDRd8cBwqlXY3J8MZL7/C/yPZmGql+DduRocDoxKRPleWSmktfwODNRpV?=
 =?us-ascii?Q?cw71iyZ8SR/sGhFvhXStHlOJxW1cXIwpIz/R9TGz5FjN9xKeK0X3OtZEDlRY?=
 =?us-ascii?Q?h8epLfXGYxCqHe/wHoJwxO1OiL2NrLzN/OGW2yElLyRBFfHF90czsV1dy04B?=
 =?us-ascii?Q?fUx5NJnnDLLWl+F5b6defjny8RqgtIctngOIpAK12Q7JzEMpBRWeKPEuS7iD?=
 =?us-ascii?Q?fg8l13QQ5Lswz0imk09XD2u2DPM/dSxiSdkMYQDBnePkS3kcRPwdFR1mQg8j?=
 =?us-ascii?Q?A0gNovj43C6wb7BC6Ly+xJblIOER7r69598hkYJX2bNAGidomYih19KVPkju?=
 =?us-ascii?Q?exm5LwoUff+dsD/YGA8ZN+fy2xNT5FwY8n80dTaxYqsCFFmLJXjMw/cPBwbE?=
 =?us-ascii?Q?nt9QFSoHl8zYOyhkOzryuODCyHjHpAC+uf6H7zyEq9rYoj6B3WbHethbHMof?=
 =?us-ascii?Q?sWmb8twieSrSnIVC+ZPVGWPOUTsPwumjB+uhYH+MxgOPrbi5DaPvkNgEa6LG?=
 =?us-ascii?Q?fGYyLgXG2EnlOlAJCFETwDA/z0UUulePix9HjHPsI9O3S5+J1ssOb2xjl3pz?=
 =?us-ascii?Q?DdZqVHglmBCgYNa4QPusiNdHPUArvsUmQBAgx6/QtbdVVzF6cEULxzwEo15j?=
 =?us-ascii?Q?L33rqZ8vLYO+wTT95t9u34NyQLm7xmKL90Ryt5y3UF8Mlf5eNqQwOh39u8Sd?=
 =?us-ascii?Q?4rWSBFu1dObjYzE5fYcrVCNDY5zz6Pe33/t70VgCratAj3r9+GuNq7IZTVCE?=
 =?us-ascii?Q?0EWKU3IwHZl9YBUiXWVZStc2L6v6fEv9lId18SE+hvAD7lN9M91VpCWcr1yB?=
 =?us-ascii?Q?G2HfltKGvbE2FeozRUzJomwerGu4kcxTYX/5Ld4is57QptSAf2DZM4dxnULF?=
 =?us-ascii?Q?kyWl30OVmF5yiDlAEPYhi86N3LG9zprOITpdzFbSWrhm5pzh/wRN+2UyEDVF?=
 =?us-ascii?Q?u4nlZIXfRLzdVwNjgommAqyuoY0mHLhJvGzHidLmdDP25C/u+y2UiKOg2OcF?=
 =?us-ascii?Q?U5Zkz4TB2Oug1R1Uy6SObt8EG8s20j4jnr64VEJVUN6n2sabQ0LiW5FpfmNA?=
 =?us-ascii?Q?fkbRq0G9Cl99cbX0A+d0NdDGHnAHV70jvXxijUUl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cad7b65-283d-4a3c-1460-08de1e02c045
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 13:37:09.7419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xaKQdVwgNSqdAjIw93wAcflupA5EHPcAv6AA7lWtb6prk/tr+zkzfRhD5aSv4MhLldQHSezfL9XzRHcvX4gyNkmteSTwqZu/vEJcpC0OZaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9548



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Friday, November 7, 2025 2:16 AM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Andrew Lunn <an=
drew+netdev@lunn.ch>; David
> S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jaku=
b Kicinski <kuba@kernel.org>;
> Paolo Abeni <pabeni@redhat.com>; Richard Cochran <richardcochran@gmail.co=
m>; niklas.soderlund
> <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbarker.dev>; Rob Herr=
ing <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.o=
rg>; Geert Uytterhoeven
> <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>; netdev@vg=
er.kernel.org; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org; devicetree@vger.kernel=
.org; Nikita Yushchenko
> <nikita.yoush@cogentembedded.com>; Christophe JAILLET <christophe.jaillet=
@wanadoo.fr>
> Subject: Re: [PATCH net-next 02/10] net: renesas: rswitch: enable Phy lin=
k status pin
>
> On Thu, Nov 06, 2025 at 01:55:26PM +0100, Michael Dege wrote:
> > Enable Phy link status pin for boards which support this feature.
>
> Probably repeating what others have said. Please zoom out and give us an =
idea what a link-status pin
> is? I don't remember seeing this term used before.
>
>       Andrew

Thank you for your comment I will add an explanation.

Michael
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

