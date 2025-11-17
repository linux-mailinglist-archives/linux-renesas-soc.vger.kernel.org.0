Return-Path: <linux-renesas-soc+bounces-24693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CCEC639B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 11:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 006823B4787
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 10:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8B9273D9F;
	Mon, 17 Nov 2025 10:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RYiOp4PQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF532652A2;
	Mon, 17 Nov 2025 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763376391; cv=fail; b=T7fifc2ZgXSWTQhnHxD70i2fzsnM1xn1CzjXdBZrRXBSUwGi2QFrRfds3a4HO1XPtNcho8W9OHkT1uNl+3Q9n7lSk51/U3Ov1r2RH0oXnldG0FrCEXl/L9B9VTC3WYtxPcFPRNHExjJmSrKjMVfSVqj038eSFiDT8E/ZpT9Ig2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763376391; c=relaxed/simple;
	bh=yE+lZa9CimPFxmJ4RvIUDgrHVFM9Xv63EsiwudwKVWA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tMFhEbZQpMAgoNboXA9cgmXaQj4i425Th4tnh6ZY6JnMhvDe3vKYpHLGkLR/ZAl3NsdJPLJAE+Yz0JOBMhbKpX1ou70xweu+8bnFFBzymrEkH3TByHEdSwtxcMEa+nTE9xxPmXQgKKoY4Ns0bcPyTekk03YtewvbwDyHrbewJHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RYiOp4PQ; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWH38Vd7DDXv3VFXCeCBDLTFMiz8Xlt2B1zkd0fW6FeIp3tNQoQQmQtfjTxp5/QhRY5tjAMh6OyAUE+fzQzb98WziYHr4o7itepLx3MgPsDLbJ85PVLuVEhnLwHXcWobsE6zkIqyXOx5nn9LPqYGmvuTuD5/sIL0Kvx1r9XkgxxQtBwpByc9R8DrBxX3EhNeppNer1mf4rvS6ycb0ipd1FJe480Eax0eEySyhS/VrkestmMasWHAz73o3xOcQmjv8Uf2Jd/2E6W2bJINoXOAQDVsk6ZyBubBEgcCffQyc54mgss34keUyLzyZz0ftXhBrosKz/azEr7LTE23HSxLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaIfK/j5ehX2qfIuRKidsOs4+GOrFqyk0VjfWeZsQ1A=;
 b=RIuj93M3vHQjDiA4k3sXz/mZLN7gabYjD6sqLu9z8kVPaBrnRg5sSLi5usDgNtIjFZtmqYtJfL2XKjgkiETz13sLbvw2cEGgrj/kIGNcXqnhB+2xWvvyKjpWFw8c/uqlpXiO0N52m6H9rKvnCbhave7msE5g309BPCKGCCWjU89FUtHJuimtbgHTywGYnT1nq39FzQCNWE2kJVP5P4ILi5XIJOPwd9fILhlNy7Jwxhb9gs6xzG81H2Y16MEo4lZ8DFqKH5kw8ohbKrdNU6dPFyoV9z9WJ+cEJr2RMtqycOx8Yfs48hHLpwEv0OyL9wWYeHRFnt1yqKGot+am41H0TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaIfK/j5ehX2qfIuRKidsOs4+GOrFqyk0VjfWeZsQ1A=;
 b=RYiOp4PQ5fDYj2PjG1kyrWSkIRhM16wEeKPfj4gvVufh5cqtAAc59m2r8bq8sy7wmjkamdUyUU63KDeM/k+DFccsVX4PVeXFqcR6+Q1nJI31Ah44BKnvbDllrY+c5ovDyP8v9AkouURt6sWVhjpaUammXOHCgrLWWwancs8799g=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OSZPR01MB6829.jpnprd01.prod.outlook.com (2603:1096:604:137::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Mon, 17 Nov
 2025 10:46:25 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%6]) with mapi id 15.20.9343.008; Mon, 17 Nov 2025
 10:46:25 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard
 Cochran <richardcochran@gmail.com>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, Paul Barker <paul@pbarker.dev>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
Subject: RE: [PATCH net-next 09/10] net: renesas: rswitch: add simple l3
 routing
Thread-Topic: [PATCH net-next 09/10] net: renesas: rswitch: add simple l3
 routing
Thread-Index: AQHcTxzKoVdV1cP1k0WlN+3+CViRarTmfzwAgAB9rQCAADmHQIAABT4AgA+ECfA=
Date: Mon, 17 Nov 2025 10:46:25 +0000
Message-ID:
 <TY4PR01MB14282A958BD280F500143A32882C9A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
 <20251106-add_l3_routing-v1-9-dcbb8368ca54@renesas.com>
 <06213fb1-12dc-4045-803e-d2a65c7e9fc6@lunn.ch>
 <03012c3b-ae9d-4591-8ac5-8cf302b794a5@cogentembedded.com>
 <TY4PR01MB142826AEB522E9717D6B1E59B82C3A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <4c93ea95-a601-4cf5-ba92-a5a0e672ab62@lunn.ch>
In-Reply-To: <4c93ea95-a601-4cf5-ba92-a5a0e672ab62@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OSZPR01MB6829:EE_
x-ms-office365-filtering-correlation-id: ba9b0c48-e4e4-483e-7c34-08de25c68e67
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wnUNIS0PPG1XT5MAlkk3EPkY1gjMZN5MSvjO4ALn9ar4AQNK7IeY+Vsh4xsw?=
 =?us-ascii?Q?1waJBnp8D/R+S+tu3o9rw8R22pE0hHgQGkkqGLXK0FjK71Zo7BucMMJEpWkT?=
 =?us-ascii?Q?nNrnGeJdNe+mUlMwup5uHszJ0f7vyNRyfpwVO+9oMnOSucYj8rCAieMAWkDh?=
 =?us-ascii?Q?5+nurmXVAJfKvef2uw91Czo5Kyi18RHoAUZDdD4PBxdGImFGrPa8Rj27Vlxf?=
 =?us-ascii?Q?J9Kj7Pwit9R3SrkueQOo/CizLemO+GynzLIne3Z2o6/jqybXpiWDfU/pXzij?=
 =?us-ascii?Q?lTHSHxjfiFdNkBjixulUUqAaVmQ3mVDxvcbYCbHnxCeacMfZnVY051K9vEEi?=
 =?us-ascii?Q?odwhM1ga/U44zKfPSaxfiXR7C5NTm/xYRP1mBAFrUCZKZuh87ehd2Bidy4EG?=
 =?us-ascii?Q?52gD4tph3KZgCQKhFaFwHRGD9E5En3NMzH7C+H9S0UzoV1knUUA1Rcn9zqYt?=
 =?us-ascii?Q?bXrqPz0eUm2zjiLrc1qg3S+k19RbuhmOi09jso8BKYhQXItXATTeA1wGgAS6?=
 =?us-ascii?Q?CmIPVfSU9oNX2gZsWN7UyZnaPG60p3Hcty5uFjnjX1kLAnaDSR/BKfxtGmop?=
 =?us-ascii?Q?e9jcSipZV+NYeyvimU5C83tL0UvZsb1ZRIk/ZBNRKORX5MrMVJgD9Hklw92A?=
 =?us-ascii?Q?nnTQ1s7cnHXA+TikAcUHJRYYutb1las3lAG6sCyZsXgSBo8gXX8ZaP9gbLDb?=
 =?us-ascii?Q?AI701hrxxq7j+HI+kF3rFib67kZJHnI1s/ibLm4BW0RVZzO5KDOaSs0Ojn26?=
 =?us-ascii?Q?1iHfiQWkjf5Pw05ItihUkBmn757i5U5ILv+yvwrP/tvlnyAX7JaNwJNMWgWf?=
 =?us-ascii?Q?Qj7LSPUQW3G8T5MZ47dqnT7oOxWRT6CAtuvWFjuN4FRqbCjQ7cJ1VCGoq4K9?=
 =?us-ascii?Q?xX6q9s4Av52vhlXFpKbV/K7tblHEuJ6OVlgMCm5KGFNuMQJ3U0NJ4RqJX7bx?=
 =?us-ascii?Q?HQknAomqB9Jvg42m8MxDcEM053WxeO40xBVqMExAktKFHmpTmkl6Q7/o7A30?=
 =?us-ascii?Q?TUCdcjrsed+Cfq4kgnWZEK3uHloW2bUbyVwz3659LNuKeTZpV/GR/jiIRFnn?=
 =?us-ascii?Q?7ZSP2PoZAtHbTKp8IZ6Hz8h1VcY+0ETBYV+P/VJ0gIm9NrRcK0+n2Ssg58DN?=
 =?us-ascii?Q?snNBTSoj2vdKPoH26FvSkfcv4YvydDCZldVLwWrlsTTLyd4a3mSOJ/uXZdh4?=
 =?us-ascii?Q?RQgvsISSNfViLmibgkAyQNdMG4ly3M/gPOAPYhG8CUoNdJEMeAu3dHf/qDQK?=
 =?us-ascii?Q?LukbFPLjcbRdCYgpb5JGWr7g75arB1KaLxMfCG3zo6KaoVJ3k3QbrK3IKP/r?=
 =?us-ascii?Q?Cq8rctHdGy5fzFCrDvqrlQNmF+8qE5iCkbrx4PXOWM5qkut6Y8jFAYBhkRWe?=
 =?us-ascii?Q?Sy0mbwxKitq57+4Znvmx8lGLdWdQ3dXjFW2H6BJ1aZ3DKnjkRn3Oasi/kKjP?=
 =?us-ascii?Q?JCH146uZawEJwT70x7VxAQg/Q8uS3NU4sd7QCEkRSyBRtGC8tallx8oDR0k5?=
 =?us-ascii?Q?VYa9g5t5qrKPgpEVyEDvFQdc1ohEnr/HPnFn?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?P7dcjo+x1nQJoxUZ4IX6ZrzM/NljKX0BF6g2Vm71e/8lbCFeBH4SqYeVmJpe?=
 =?us-ascii?Q?rU+E432RvNQ80k/vhmDJHjQ5kLknhVohbAMTO74Q6WKRCyD4+BCniMzQNPSk?=
 =?us-ascii?Q?c5p7EuFUU0gOHUGfxUjnz8D5hI4h+9aJd0E9XeHLDr+xlYEWrSIJxNJs4Fod?=
 =?us-ascii?Q?CCzmdF5FyOot1fbk5HL9sIZNsDTW1ha0Pcd0ZI8M4dbWo3jNGXBbySU9LLzP?=
 =?us-ascii?Q?4Br8c30QatR124Fto9Ap9cTzrOwN+ioqASK34HToEQaq+G7wngp53DHHUAYZ?=
 =?us-ascii?Q?BODizmwhWDmxIeI4IhecltMJzVbYrdjfvtT8nWLX6ABaxq1FbtcWYWNNsFvD?=
 =?us-ascii?Q?jGhTkWYfboeH35e5N3rr+82KfsT0Laarw8w+liKv/KIMojKURy+czfm0JDQU?=
 =?us-ascii?Q?YH9pe6mLRztbJqMHLtOn3mPzMFfBgE2ntXV0W9j0cTl6/QZCmF7JEwacDc50?=
 =?us-ascii?Q?vdhyI0qLHv3NdvVdPK/0XzM2nsZ/WCBVIHOqqz8YfMKJqOqYnWhqODIOKKQE?=
 =?us-ascii?Q?ei9ez35wCCsa8jCBCSQ82VjXxhNEf4aATw73wpJrLb5hSHb8cKK111/RD1dW?=
 =?us-ascii?Q?97/Z9p6NhPmOAxlSIzzLcegM60X9jF42VRP+NbkKeh6CMgCIRUX1v1aVzDG3?=
 =?us-ascii?Q?f7N9suPb1aM1DqxDVR9WVXKseODf6btyfybyxbkif3zlzSslfjdfHOYwIcfw?=
 =?us-ascii?Q?88fnG1izWm8e6rhj3ukeEjVmJh/c2RjfD60fdwW8E32XABZ90M6p0ElFMTZf?=
 =?us-ascii?Q?C+4oGSoYtD10Xcz2LwAVm+GMMIcjEivq9tif9Cb2GcWtutgcwEiMDatbj8Z+?=
 =?us-ascii?Q?xDu8S9lhE7zYk4RrM1Nx7NA2kb7ne37d135Rt1OfblKEZFnZHwBRAEMQ6bEe?=
 =?us-ascii?Q?HawjUytji0wFcBnTeB0bdiHdmpApVtFuAdBICkgnFEAGvCQyRq3YdZgEKGaP?=
 =?us-ascii?Q?SF9o/vToUBZ8DFLBO0OApu/AJO+hjgY/BuFnvLUREwiPysq2L1SjbF/WTB6D?=
 =?us-ascii?Q?WCycpFAXiDgDczobuLGd+0Mkefp5xl9LjNJMyuq/8tz3FjCYlzNMNnxEz92l?=
 =?us-ascii?Q?p4q9l6wVTka12cVKF0/RXzGClKK0Sel6EuAb8W+0JxFxAVvoE1M+idUYVHft?=
 =?us-ascii?Q?cfxYYENSCCYw3OoENCQIyKSXy1FjGN3p9Vm0zywrNHkGW+nbnJbPFCNgt3t/?=
 =?us-ascii?Q?VVvAEj/tAfemIlZfWhjGbQoc5A4KGenS8x/ZWT8VKn/7pmtC87QoTe3W1z4F?=
 =?us-ascii?Q?mY3xruMMd5bX0wHCNeXJmQUAuJ/d56Rx+YCsWTLK/bcHHOIaXiECF4Q5ppYt?=
 =?us-ascii?Q?QhUExfrAv5fO8p9Iv55iuMuc1/UhwQhsqbcmejK0HS2oI8RAaiuaXYzQ9ub0?=
 =?us-ascii?Q?6jOT8x3WHlZAy8/fPFJn4w8Zt9tl7qDGM1puxLqKgtdRwb1I/KC9zW4C0Jgw?=
 =?us-ascii?Q?qnMSgYgrZQhgbTZSXX2h7KZM/DLi1eiUWjyKhHO2siw+C8nGA0JNDumxhDvf?=
 =?us-ascii?Q?xCIxdEmg2XQ0HU1CQ3bXlLhAKuXnGKl6RKaxhVBSwlUP1uJ2TYUL0y1g4LxY?=
 =?us-ascii?Q?8HyImJNusr0ndV7JpfKGkwkz/mU0v+mG05skt5nl?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9b0c48-e4e4-483e-7c34-08de25c68e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 10:46:25.5675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZk9R+MnP9mejI9f1GxFRVHjfPGnOkcOJMbLrgjXrgSO9yET85IFuPdkgFG9v2Gbz1iNQDD5WkHRzom43za6/02DBjINuF7Ei7fDhSwfUMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6829

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Friday, November 7, 2025 2:47 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>; Yoshihiro Shimod=
a
> <yoshihiro.shimoda.uh@renesas.com>; Andrew Lunn <andrew+netdev@lunn.ch>; =
David S. Miller
> <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski=
 <kuba@kernel.org>; Paolo
> Abeni <pabeni@redhat.com>; Richard Cochran <richardcochran@gmail.com>; ni=
klas.soderlund
> <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbarker.dev>; Rob Herr=
ing <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.o=
rg>; Geert Uytterhoeven
> <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>; netdev@vg=
er.kernel.org; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org; devicetree@vger.kernel=
.org; Christophe JAILLET
> <christophe.jaillet@wanadoo.fr>
> Subject: Re: [PATCH net-next 09/10] net: renesas: rswitch: add simple l3 =
routing
>
> > > But, there is a more interesting question about this patchset (that
> > > actually stopped me from submitting it when it was originally
> > > developed).
> > >
> > > What do people thing about the entire approach used to detect streams=
 to offload?
> > >
> > > The situation is:
> > > - hardware is capable of doing L3 routing, with some (limited)
> > > packet update capabilities - rewrite DST MAC, decrease TTL,
> > > - there is interest to use that, because software L3 routing even at
> > > 1Gbps consumes significant CPU load, and for 5Gbps will likely not
> > > keep the speed at all (we did not have hw to try),
> > > - but - given the capabilities of hw are incomparably weaker than
> > > capabilities of linux networking, which approach to take to detect st=
reams for offloading?
> > >
> > > Second question - how exactly to get the routing decision from the
> > > kernel stack, to apply it in hardware? I was not able to find any exi=
sting implementations of
> something similar...
>
> You should probably look at how the mellanox switch does this. It is kind=
 of the reference
> implementation. The sparx5 and prestera might have something, i don't rem=
ember their capabilities.
>
> Some of the mediatek devices also do interesting things with flows, but t=
hat is more for NAT, not
> necessarily L3 routing.

Thank you for your valuable input. I will take a closer look at the mention=
ed drivers and reimplement
that part of the driver. I am currently busy with a different feature. Ther=
efore, I will start over
once I am done.

Michael

>
>       Andrew
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

