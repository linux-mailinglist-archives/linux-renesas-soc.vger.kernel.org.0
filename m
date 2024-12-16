Return-Path: <linux-renesas-soc+bounces-11374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A98679F2F19
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 12:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A0FD1880706
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 11:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780642040BF;
	Mon, 16 Dec 2024 11:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="L+PUnWvW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011058.outbound.protection.outlook.com [52.101.125.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8139A2040BC;
	Mon, 16 Dec 2024 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734348359; cv=fail; b=fMX/bAXT6bQpBEe94UjQzyLBd5u1vJRd7MoOVTvmuDpa3+GLqRxxfZ5gJZXVofhNG10BauvdEsYUQvjxzA4znA3vSEXebfuB9NrhAttNFHQzLC+VYm8vBM7B1S4zKRvn4jJljW4Nzpdb5vUxiL+AqreOk02z2iq9UHiZwwLU7E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734348359; c=relaxed/simple;
	bh=KMi/odtzn8kYwc0fxmW8cV8Ik9wR/pfHPyK3NYkbviU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YhkmPUp3dawmpXEpI4e9qZdQZlbT63fg1uqTk9mQDBCltL8JYx/OnUydA9UGW6/TPoJGtBWi8k/vy0v1i/7dEPLK/6pKjRJtlzzjttcDqxFuqK7Efw7Fa9PoPX6VJco8OynLjFi+TKeUbAAgOftMTtgHTpZlx2Gry0DQDoluDHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=L+PUnWvW; arc=fail smtp.client-ip=52.101.125.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8AiQ+X6ChC2tsZmplyRQG6ccXpY8t+3MFE/hzFxEV/YdQo91Qksfzd6jWIoraeA5YpzhjJ2CjPlDTU7d90QdH1QIgaSFWLwJwCN4YCDFN/b54uqsks1f7E+dZBpDqBc/U3ESYBKo4OCtfnr3EfT3uT55tNCmrjIpkN86P17kKLzIb42hxu6TSAnkAaCpS2hvYpP65UHfV2pL3FSZdCgjWTkri0cwd+Ds1R5AxY/tKVv6DqPqIWSYcMH0/VJCiDs71CKn1ErAvgOtbF0NJagrl8MxvA0Qi+YN7RF5kAm2hwBa9UPXn4XnQVmP3w7Jlb9Cf29ryCG4zsWtgMdcUhViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyltlzuYlcBdnsQCeFura6wBqUPxX8qEMASumTax7EE=;
 b=Z8KNzhGCJpYRzdTs9bQ56SSUKIK+U3XLklFum2mig4xEohQ0cyNwO6E1LYBnv3ct7P2D010Til5rqEz4dAQB3GG5ciKi5bzS6Fn+a4NgNRXOmUUVBSMXWFfa0irBia58ZTrY/n8xptVLwHsYvqJ3MU+0R9B3XRUWw3sq+hPW9UiYXufRguS/rZ0txemOfsZ2aygAT2kygaznmWNRvMTeSlAr1otwbW1Pzp4yvmntzPdqwWpDTOsoJGSFV3/+lb2a5MMRTqeC4F0k+yAAarWmeYSiqAdAommnk2infN+GDJgMb2/0LeLuhTp3li0c8Kjk/n/Vm9v07BqmPoWAapYRNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyltlzuYlcBdnsQCeFura6wBqUPxX8qEMASumTax7EE=;
 b=L+PUnWvWX66fwb59bFGZaTnKaatppWetFNco9beUyfelsjepkWapB2wJunQ59wdbWVRF4kQfWVcmlPZQc9XMPEZvDR4JHuT0b3sTuoJGZ4ZQo6QZPYV3tfH8+UKaT5dyJ9hzyirBj7UyCDIChgtCpI4YyB3gW4Ul2Yr7dlYVWGI=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYCPR01MB9732.jpnprd01.prod.outlook.com (2603:1096:400:20a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Mon, 16 Dec
 2024 11:25:52 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 11:25:52 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: nikita.yoush <nikita.yoush@cogentembedded.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Dege
	<michael.dege@renesas.com>, Christian Mardmoeller
	<christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH net] net: renesas: rswitch: rework ts tags management
Thread-Topic: [PATCH net] net: renesas: rswitch: rework ts tags management
Thread-Index: AQHbTF7CoLYav3peXEakU6IUp8R937LowLDQ
Date: Mon, 16 Dec 2024 11:25:52 +0000
Message-ID:
 <TYCPR01MB110406A8F4B635DEC7D5ACB71D83B2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20241212062558.436455-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241212062558.436455-1-nikita.yoush@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYCPR01MB9732:EE_
x-ms-office365-filtering-correlation-id: fdb13ec1-3b05-4b9d-e5f9-08dd1dc4662a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wqDCcXkCS6XDC9NN+k6cguL/4aooaWHStFG4Bp5A8ivtU9WOIbabxrcNzrW7?=
 =?us-ascii?Q?214p49hnIEqaaVN5nSRTL9a8CVQgJk8poi0YGJv5M2rB+LMPaDss3kw6VCNB?=
 =?us-ascii?Q?h2MmQ4BeCjsYakxb/7LERkpdru0wKfzJfSkfDqw3zmLmsFWzzk5MAieD28GC?=
 =?us-ascii?Q?73Jktm8G2iwzQo0+DJ5ExRLP7Bcse2SGR6EeGf5qoqHTZjhvIS5VKWAPkGtI?=
 =?us-ascii?Q?gF13PHoF/b19M2S6Z4QIPUlG1zWZ6SXa0tdJXB2piizLyfkVl5//+Ims3S0q?=
 =?us-ascii?Q?8miZByENEN92neZaMGezkDk+h/baQ9aRPQTcWETyLbGufXq7H2YRok+UqOeo?=
 =?us-ascii?Q?hxXE9hyuGWBI+GYF5C/kerhTxyanXYF4SBIAiRseAzv395MvH2g18XwpLEYl?=
 =?us-ascii?Q?azBNg1FMarQykB3KW4B5X3xkzYxEOnzU/XYRSMO67ZXPqdTotmlAAuhcFr8X?=
 =?us-ascii?Q?Vig7CTrHPuDg9mDA3H9WQ5MDHSOrefwiEeAz+NVF+xq4/AOXUBfEVwASz0wL?=
 =?us-ascii?Q?TJ74O37TcD66+B270OwZEbiFpjKEYkLNCkJSSTQYQxXT8HMkzHUZN5jfWlH5?=
 =?us-ascii?Q?f2FyixQ9M9dW7b3ZRGiCOHPxZ91xsUtAs+9i3Mfel2ynaKOCuQbyXN3nqwIl?=
 =?us-ascii?Q?Am3OPD5xvEcgu4jZmatT8+gArmUNMeYQtu5cd5S6enXT3MU/Qi9gjVSCdRxO?=
 =?us-ascii?Q?v1yM2RBWjke/n4+jlO1mNNqAoQuZd0ls969Jjj32SIBerMPz8rJqlfbpjNIE?=
 =?us-ascii?Q?txV/r9GWbdeg8qNxIbZlguKeMeZr2x7GZJikc3hpnV61nugWkT/VWlJNVK/3?=
 =?us-ascii?Q?r5hcRUueqDlZH2NIjhaUU/z11tsfYt2qjZSD9A0985uvG2UrMttRZ0zGRO6j?=
 =?us-ascii?Q?s01DAAlpduh/6qMB+LAoRYkpne8SklsUe7H6eDLKP2BKyDXSdlkYiwSlffqt?=
 =?us-ascii?Q?wmDFcg98W1gX82UtkFVe3IK+CdNNC/g2X3XWshp0FAmdKQIr3u4Yn3oTxv67?=
 =?us-ascii?Q?pA/r4svE/XDVVqIaNg2JY4gGHGjhBCoM/RAejClla6xlNVEM4jwJWr0g8XV7?=
 =?us-ascii?Q?gZ8h7XvssYOGBPzIdPwOnILebAoeqt8RkqXYHaLfd8GL8BkrPGlnEKbMrcqw?=
 =?us-ascii?Q?6ucgzgbmWNK2ldI/6YVml2jYITAeW3Zckl0TW+mBLoV184DIh+h+sAEJ6e6f?=
 =?us-ascii?Q?8GagrsYPlqxU4BpNpA5bkmRybGvkQF/2xxePtWfOgj/9VSMnGVuMujjmln7q?=
 =?us-ascii?Q?5c2FBFpy46aOIwYEbuvtu0EJihY/zK8jIXA5szUt/yESCHzoNQEjYqoe/91S?=
 =?us-ascii?Q?KDerZqyO1Tw3cm5NSYOpacN4uu4/+fuLW9blHv1pLh7mcK0nRtB8f7gfLTpG?=
 =?us-ascii?Q?tMRlj80BlK3YtD9tsu4RyH7uE044tQhz9iZSuetMApufWspxqEaCWj/tvov+?=
 =?us-ascii?Q?ciG/Egp+nE7xwhH2/x4Uc3FnyGpj8qIT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?s5mobFuIwCoaipLfK5F6Qjtyq9ez2I8vvuFBBQmzeeZpvnDGvtWgPKkNbOTn?=
 =?us-ascii?Q?itremePZKpRSFB7/7TQ5zVgLuQ9ZEe1LyBV5FflY8vT57I/B7kYA+OCEpYZQ?=
 =?us-ascii?Q?VphycJN+u5oZoREAM70/OqV9bqwxb/y7xchW/RMQL4fZIQRHcgzmtHkc96yi?=
 =?us-ascii?Q?94Xg7h688W7QjsiM5BjYhcKWCQBXg6KPM79DFtmvRo7nIGMU+TWwy98N2IKc?=
 =?us-ascii?Q?n368zOPsCxzrO5scLefYf0e1wrkXXk6nP3ysHv3GsT5clPVWpqIornWGEhOh?=
 =?us-ascii?Q?GzrMWwLAKto6uTUJVkQ0WXNBRRu8Ku6OdWQoo0vUdkJZ3B1eQiOSRGDOMp1h?=
 =?us-ascii?Q?o4PuO5cRSyO3pyWwaGX8bK1lV2310RQ/MyhoL/0NJ94Rxcbnu52gf7Sl2QwC?=
 =?us-ascii?Q?X8jRS/2F5P5vwQXN7aE656wM7DGM4f+h28cIUj89SXJBBokFEhvpQ8PoMXeX?=
 =?us-ascii?Q?MZu/LeqDCkxLDgZ4p+kwaDJPFJfiyxkwZX38jp71683cB0db9wmKQ2iBK1Ne?=
 =?us-ascii?Q?emQzaT14aBgXxZUL9niIKUJJMFDLyTBi8fsErtpLT05rsN+TB4CnCfJ9InGk?=
 =?us-ascii?Q?6zLD0vBxlk05cP5M3ltEXqkGaER7S9u1uvK8YE/x3pDMEziSKcMq1/1tQq63?=
 =?us-ascii?Q?902ByJ7oNwggTuHpYQCxXohVDDT8HzZqpIqtiFhe6d86g/WiXPYJm5BMMF1G?=
 =?us-ascii?Q?c6yIj5JG/j9BCISyIYs4DhfRFYcKbSMRGdYBxFPNV+ch/ter6HMj0LzOLsXF?=
 =?us-ascii?Q?NI0Jt3rZeMy2S7D0a7YnpPIW3sQeuxPdCIYqfeMEM9jsPGJ1IN7N3mJluDUM?=
 =?us-ascii?Q?6Z3801SWUZmkMuEyJdpn3G9zlMdHHB/rNp0aIzEdfWNi9P2InSpHnq6kIsoE?=
 =?us-ascii?Q?fj8hpRvMQmW3aOpApF8EXQK3j6+Lz8Yytyg0V+Q33QlL5D/QKW66Sfhlvo03?=
 =?us-ascii?Q?esvEmrNDmrOs2fh9uay2xvgfDF64bhXsCAI/8IpvmVddbgT8UIp3WNUWkf8h?=
 =?us-ascii?Q?is8qwA3B66Y4Qe37OJ7LywO7zg+MqjLXHergUg0bp5f4yUBTAPzNq9vXN2hg?=
 =?us-ascii?Q?IQCtaUxmyBti/ttEJEr/hrHVmmKS3sUZ4BkfQUgfS4G3n45JTy3PfD2XiIk/?=
 =?us-ascii?Q?1MACsyapGr/4s3vDHJMVeVMK+wTJSY2t2MQ5niLGQIJQ8Kr9FLR58pFbCM/C?=
 =?us-ascii?Q?1Dwn2r6GEvdqSDDI1D+dRheGdrE9XMA5RyljD3XhSsy8bfUa1Xg0u8/b2LQP?=
 =?us-ascii?Q?OpdnXi1a0xDPupuVp94nrFX8qxSvSWpC4LoAMk7Xo/BqinbNOSHz1srstTuv?=
 =?us-ascii?Q?iBsyNVQYrcDWBZPNF8+ALiGVESH7zmOWDcTlERf6xwHJrU4UO5Yd1r8DRXaf?=
 =?us-ascii?Q?EITybi08FiPITj9ZqfkfQhoaRwjUcfgc5oBinKEsPCjAWguyjaYxX9Cd8IvH?=
 =?us-ascii?Q?hi0PGSs+TVIIvJjB5/bmF/BxYnAaTOLv0G2HuRcHSXEtnwkhXSYyEB4d/ni5?=
 =?us-ascii?Q?DgMIUAvYkM51bJOR6LO3r50+P9tB+0dxj1Oj+jxDfbvynwnLZK+5nT1X970o?=
 =?us-ascii?Q?1eggJvCePAdUWC8yjL+CVZV9xMaJytznacezISZ9p1cgnQbvrSYEA0/5uyHk?=
 =?us-ascii?Q?JU9fAWBOb9FHNM3nYV/mhiZJnQo+5HOlMuhICMayECoiomPUNtPqq/EdPrky?=
 =?us-ascii?Q?lG2vyQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb13ec1-3b05-4b9d-e5f9-08dd1dc4662a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 11:25:52.1314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lh3QS4Jt1xkdMnrKXFimvpVwkCFvKBZWdHz8qeV5GVbTufzdnpvwTqrJKZ/ctBo4ZsgepyFZluvcP4ZmcCx7cq+yPHBgkjRx3kXHFktdqkt8cKF2/C1AMpkkJlbF9Buh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9732

Hello Nikita-san,

> From: Nikita Yushchenko, Sent: Thursday, December 12, 2024 3:26 PM
>=20
> The existing linked list based implementation of how ts tags are
> assigned and managed is unsafe against concurrency and corner cases:
> - element addition in tx processing can race against element removal
>   in ts queue completion,
> - element removal in ts queue completion can race against element
>   removal in device close,
> - if a large number of frames gets added to tx queue without ts queue
>   completions in between, elements with duplicate tag values can get
>   added.
>=20
> Use a different implementation, based on per-port used tags bitmaps and
> saved skb arrays.
>=20
> Safety for addition in tx processing vs removal in ts completion is
> provided by:
>=20
>     tag =3D find_first_zero_bit(...);
>     smp_mb();
>     <write rdev->ts_skb[tag]>
>     set_bit(...);
>=20
>   vs
>=20
>     <read rdev->ts_skb[tag]>
>     smp_mb();
>     clear_bit(...);
>=20
> Safety for removal in ts completion vs removal in device close is
> provided by using atomic read-and-clear for rdev->ts_skb[tag]:
>=20
>     ts_skb =3D xchg(&rdev->ts_skb[tag], NULL);
>     if (ts_skb)
>         <handle it>
>=20
> Fixes: 33f5d733b589 ("net: renesas: rswitch: Improve TX timestamp accurac=
y")
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Also, I tested on my environment with modified cmsg_sender.c which enabled
HW TX timestamping. The following command [1] didn't work on the previous c=
ode.
However, after I applied this patch, it could work correctly. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

[1]
cmsg_sender -p u -t -4 -n 128 -S 1000 <ipaddr> <port>

Best regards,
Yoshihiro Shimoda

> ---
>  drivers/net/ethernet/renesas/rswitch.c | 74 ++++++++++++++------------
>  drivers/net/ethernet/renesas/rswitch.h | 13 ++---
>  2 files changed, 42 insertions(+), 45 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/etherne=
t/renesas/rswitch.c
> index dbbbf024e7ab..9ac6e2aad18f 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -547,7 +547,6 @@ static int rswitch_gwca_ts_queue_alloc(struct rswitch=
_private *priv)
>  	desc =3D &gq->ts_ring[gq->ring_size];
>  	desc->desc.die_dt =3D DT_LINKFIX;
>  	rswitch_desc_set_dptr(&desc->desc, gq->ring_dma);
> -	INIT_LIST_HEAD(&priv->gwca.ts_info_list);
>=20
>  	return 0;
>  }
> @@ -1003,9 +1002,10 @@ static int rswitch_gwca_request_irqs(struct rswitc=
h_private *priv)
>  static void rswitch_ts(struct rswitch_private *priv)
>  {
>  	struct rswitch_gwca_queue *gq =3D &priv->gwca.ts_queue;
> -	struct rswitch_gwca_ts_info *ts_info, *ts_info2;
>  	struct skb_shared_hwtstamps shhwtstamps;
>  	struct rswitch_ts_desc *desc;
> +	struct rswitch_device *rdev;
> +	struct sk_buff *ts_skb;
>  	struct timespec64 ts;
>  	unsigned int num;
>  	u32 tag, port;
> @@ -1015,23 +1015,28 @@ static void rswitch_ts(struct rswitch_private *pr=
iv)
>  		dma_rmb();
>=20
>  		port =3D TS_DESC_DPN(__le32_to_cpu(desc->desc.dptrl));
> -		tag =3D TS_DESC_TSUN(__le32_to_cpu(desc->desc.dptrl));
> -
> -		list_for_each_entry_safe(ts_info, ts_info2, &priv->gwca.ts_info_list, =
list) {
> -			if (!(ts_info->port =3D=3D port && ts_info->tag =3D=3D tag))
> -				continue;
> -
> -			memset(&shhwtstamps, 0, sizeof(shhwtstamps));
> -			ts.tv_sec =3D __le32_to_cpu(desc->ts_sec);
> -			ts.tv_nsec =3D __le32_to_cpu(desc->ts_nsec & cpu_to_le32(0x3fffffff))=
;
> -			shhwtstamps.hwtstamp =3D timespec64_to_ktime(ts);
> -			skb_tstamp_tx(ts_info->skb, &shhwtstamps);
> -			dev_consume_skb_irq(ts_info->skb);
> -			list_del(&ts_info->list);
> -			kfree(ts_info);
> -			break;
> -		}
> +		if (unlikely(port >=3D RSWITCH_NUM_PORTS))
> +			goto next;
> +		rdev =3D priv->rdev[port];
>=20
> +		tag =3D TS_DESC_TSUN(__le32_to_cpu(desc->desc.dptrl));
> +		if (unlikely(tag >=3D TS_TAGS_PER_PORT))
> +			goto next;
> +		ts_skb =3D xchg(&rdev->ts_skb[tag], NULL);
> +		smp_mb(); /* order rdev->ts_skb[] read before bitmap update */
> +		clear_bit(tag, rdev->ts_skb_used);
> +
> +		if (unlikely(!ts_skb))
> +			goto next;
> +
> +		memset(&shhwtstamps, 0, sizeof(shhwtstamps));
> +		ts.tv_sec =3D __le32_to_cpu(desc->ts_sec);
> +		ts.tv_nsec =3D __le32_to_cpu(desc->ts_nsec & cpu_to_le32(0x3fffffff));
> +		shhwtstamps.hwtstamp =3D timespec64_to_ktime(ts);
> +		skb_tstamp_tx(ts_skb, &shhwtstamps);
> +		dev_consume_skb_irq(ts_skb);
> +
> +next:
>  		gq->cur =3D rswitch_next_queue_index(gq, true, 1);
>  		desc =3D &gq->ts_ring[gq->cur];
>  	}
> @@ -1576,8 +1581,9 @@ static int rswitch_open(struct net_device *ndev)
>  static int rswitch_stop(struct net_device *ndev)
>  {
>  	struct rswitch_device *rdev =3D netdev_priv(ndev);
> -	struct rswitch_gwca_ts_info *ts_info, *ts_info2;
> +	struct sk_buff *ts_skb;
>  	unsigned long flags;
> +	unsigned int tag;
>=20
>  	netif_tx_stop_all_queues(ndev);
>=20
> @@ -1594,12 +1600,13 @@ static int rswitch_stop(struct net_device *ndev)
>  	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
>  		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
>=20
> -	list_for_each_entry_safe(ts_info, ts_info2, &rdev->priv->gwca.ts_info_l=
ist, list) {
> -		if (ts_info->port !=3D rdev->port)
> -			continue;
> -		dev_kfree_skb_irq(ts_info->skb);
> -		list_del(&ts_info->list);
> -		kfree(ts_info);
> +	for (tag =3D find_first_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT);
> +	     tag < TS_TAGS_PER_PORT;
> +	     tag =3D find_next_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT, tag + 1=
)) {
> +		ts_skb =3D xchg(&rdev->ts_skb[tag], NULL);
> +		clear_bit(tag, rdev->ts_skb_used);
> +		if (ts_skb)
> +			dev_kfree_skb(ts_skb);
>  	}
>=20
>  	return 0;
> @@ -1612,20 +1619,17 @@ static bool rswitch_ext_desc_set_info1(struct rsw=
itch_device *rdev,
>  	desc->info1 =3D cpu_to_le64(INFO1_DV(BIT(rdev->etha->index)) |
>  				  INFO1_IPV(GWCA_IPV_NUM) | INFO1_FMT);
>  	if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
> -		struct rswitch_gwca_ts_info *ts_info;
> +		unsigned int tag;
>=20
> -		ts_info =3D kzalloc(sizeof(*ts_info), GFP_ATOMIC);
> -		if (!ts_info)
> +		tag =3D find_first_zero_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT);
> +		if (tag =3D=3D TS_TAGS_PER_PORT)
>  			return false;
> +		smp_mb(); /* order bitmap read before rdev->ts_skb[] write */
> +		rdev->ts_skb[tag] =3D skb_get(skb);
> +		set_bit(tag, rdev->ts_skb_used);
>=20
>  		skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
> -		rdev->ts_tag++;
> -		desc->info1 |=3D cpu_to_le64(INFO1_TSUN(rdev->ts_tag) | INFO1_TXC);
> -
> -		ts_info->skb =3D skb_get(skb);
> -		ts_info->port =3D rdev->port;
> -		ts_info->tag =3D rdev->ts_tag;
> -		list_add_tail(&ts_info->list, &rdev->priv->gwca.ts_info_list);
> +		desc->info1 |=3D cpu_to_le64(INFO1_TSUN(tag) | INFO1_TXC);
>=20
>  		skb_tx_timestamp(skb);
>  	}
> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/etherne=
t/renesas/rswitch.h
> index e020800dcc57..d8d4ed7d7f8b 100644
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
> @@ -972,14 +972,6 @@ struct rswitch_gwca_queue {
>  	};
>  };
>=20
> -struct rswitch_gwca_ts_info {
> -	struct sk_buff *skb;
> -	struct list_head list;
> -
> -	int port;
> -	u8 tag;
> -};
> -
>  #define RSWITCH_NUM_IRQ_REGS	(RSWITCH_MAX_NUM_QUEUES / BITS_PER_TYPE(u32=
))
>  struct rswitch_gwca {
>  	unsigned int index;
> @@ -989,7 +981,6 @@ struct rswitch_gwca {
>  	struct rswitch_gwca_queue *queues;
>  	int num_queues;
>  	struct rswitch_gwca_queue ts_queue;
> -	struct list_head ts_info_list;
>  	DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
>  	u32 tx_irq_bits[RSWITCH_NUM_IRQ_REGS];
>  	u32 rx_irq_bits[RSWITCH_NUM_IRQ_REGS];
> @@ -997,6 +988,7 @@ struct rswitch_gwca {
>  };
>=20
>  #define NUM_QUEUES_PER_NDEV	2
> +#define TS_TAGS_PER_PORT	256
>  struct rswitch_device {
>  	struct rswitch_private *priv;
>  	struct net_device *ndev;
> @@ -1004,7 +996,8 @@ struct rswitch_device {
>  	void __iomem *addr;
>  	struct rswitch_gwca_queue *tx_queue;
>  	struct rswitch_gwca_queue *rx_queue;
> -	u8 ts_tag;
> +	struct sk_buff *ts_skb[TS_TAGS_PER_PORT];
> +	DECLARE_BITMAP(ts_skb_used, TS_TAGS_PER_PORT);
>  	bool disabled;
>=20
>  	int port;
> --
> 2.39.5


