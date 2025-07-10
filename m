Return-Path: <linux-renesas-soc+bounces-19487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE21EB0022A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 14:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA605645AC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 12:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16E024EF6B;
	Thu, 10 Jul 2025 12:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HLpOt0uu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D8C18A6AD;
	Thu, 10 Jul 2025 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150976; cv=fail; b=qZlJTvjPqTAyhSPxKcxUYvmtc8HowZg3H2fHQMJAZEN5LpOInVEocDMFhLGFf7s9QEblRZYwI1RIZVxPz+x/GQI6/vr9k82b4yrKgSFIwjQsOJx8ccE8v3bWl3efo1Lq/rB+USS/U1FPb29y666RovAlUGqYcbOHG7r0os/xzFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150976; c=relaxed/simple;
	bh=Hbev8NqanX7lo+SWmFr22l77fA+hIKV+ofYEb38/1iI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t8xB8V3bheFmHEZwq5cre4WWTthWQSPMSkoS67fBdoPHvqiDDvhjQrIjtNVMAUnnPzlUb7DNmN701lrqD9cwL8Mc1cshS8gjUk1LZAJlx9lqHxkWODjy2S/Zo1BUQLWstaRDg1TZWwqeAZZABTDoq2Y/lfT6IfPePqe6IEVgXiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HLpOt0uu; arc=fail smtp.client-ip=52.101.125.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LN82m16KGZvHBsTm+yDRA2cRNAXeJQp60RMm5tcW07A9N0KTRj7nO1qhpwYyOEGb550Piagovd1rOs17vwcpxaDMQD+7uz7krzfBH1aogN+KhvWDC+iKibGs5UbfIF7xXeN/rs+wrD3UOD/FYKRWxjW5788feVtR/AihlqUk83X6LHIpx48gwOGNNJvlJTVXqnBjEz6ACE1udzFgdYjg2gMS/pH57PxNXTZf2EhHB41bNEquwpBb39YwG6uyDbq05o0XvVSiMY4XzaBYgro9rY0oktzCtcXhUqbSZezQgyjmLQvpOu4TZO4lfTRja5I8oN2+745zSDCZl/0f6EkBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyD3tJihc5QDwme15Rr2vgbagDwTGURhJu+7zA4CPAM=;
 b=S9Wnyf6vykYyRgW3vy6cMhw8dvyFpTeDrkGZGPsY4lcXNNxAQVg9EIGfLM2CvKVIi4t773j5vPVyNxtRlfrYjXl1q+j/JNJmPXblyiDFIaJUWz/u+LVuePT9khT5GCltWbc2GtXQ2cXPGqW/YqUNvHfBJVtuNQZTj7sKzvwrLGPstoO5mn+bBA1sQgbzwYeJAz+JvF3lVuGl6AAlrDuFwr3jn5gb5m+iXKZhFt4qgGrxpaCaEiTL571DVQ0wPwRCIR7C+i9C+Bw6TRfXIvTxj9Tl1dO7GUvzxv8zt75OW73gssNh2aeCmM1bDX46Ik1e3dKFRshL7uWjBZoKQBFaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyD3tJihc5QDwme15Rr2vgbagDwTGURhJu+7zA4CPAM=;
 b=HLpOt0uuVsdd6zgkQ4NfT0L4PVkYVfAoJjhhilfMO6aNh8ptfvCi7MwDFj+diLbWtfBLMA/Jm6wbqCz+UqnaSsy0x+IXQijJCFNJZBd+iR5Ywt0xhCpqZxZMVXeEOAfTD96EgQ4svvIysH2NPnxAuRiUFPMzK7yovzu5abprRSE=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS3PR01MB9545.jpnprd01.prod.outlook.com (2603:1096:604:1ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 12:36:11 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%7]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 12:36:10 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Simon Horman <horms@kernel.org>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Paul
 Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2
 switching
Thread-Topic: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2
 switching
Thread-Index: AQHb7+qaUvmWH8hF00iTJeuZYkkm3rQoC54AgANCQnA=
Date: Thu, 10 Jul 2025 12:36:10 +0000
Message-ID:
 <TY4PR01MB142826BE20FB23122B72A96348248A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
 <20250708-add_l2_switching-v2-3-f91f5556617a@renesas.com>
 <20250708104740.GF452973@horms.kernel.org>
In-Reply-To: <20250708104740.GF452973@horms.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS3PR01MB9545:EE_
x-ms-office365-filtering-correlation-id: 369d2ad1-c59f-4781-b56f-08ddbfae59c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+Pd+KD4j6H+d694BMpWAgJxOOc7LrKNTtD9MZwa6jXBXUpeWCDZdB1NDD4?=
 =?iso-8859-1?Q?so+K/QDu4lhCEZEjbknqaaJp1XWdaAtuxb0i9MqG/7PO0zW8ffzvsad0Gr?=
 =?iso-8859-1?Q?07ZTffSFYbTpoLNE38SCv3Y27R5WOnzMbz5SJd0/0c+Kdx+FK94gw/JFMb?=
 =?iso-8859-1?Q?FbZSJs6xHVAcVedgZEgGWpSOrCPbV4ALp/28MnHi33+WysaZiqZdA4GaL+?=
 =?iso-8859-1?Q?cBbxROQTM/0EXA/PpBusYPPdQPqpW7Rskt3aTYRFXkI5IR2C6Iy2SnMY49?=
 =?iso-8859-1?Q?tX48VgKrqU3oO8LHuqTLwuMKockl621wRpsEIEeOKIi+Zdsi5M2dF++Wrf?=
 =?iso-8859-1?Q?upOn4Zn8SyAmD6fOjstsEPVoo0dVmF8JLAma0XpHiQqWK7u8oZ2f/RZ6Jb?=
 =?iso-8859-1?Q?dNOOtpepMYNueANLW/rOc132IlZEqSmjdb2nn7P+7xVR5g2D3qYcuMxkwp?=
 =?iso-8859-1?Q?Um5W17to4+uqnvvfuhmEiAkzDZRo+BYNYDNkNeNdVwAYxa+qLjlumWUhht?=
 =?iso-8859-1?Q?Q6jg8SFsUiFEWD1vLePyqr/jLdxWiHifVz8dpWPqGosbGfZzF/VTnQvcM0?=
 =?iso-8859-1?Q?sO8lVn0ViWe5uj2CrMk039R5/MXzWbQUpNrADWZBGHYGMUCbFnq81eDkpq?=
 =?iso-8859-1?Q?KICJRTRMUjWH2gMsPNVKww8t8m998xw7jsOwfdkrT47X+noe/rLL4yrl2K?=
 =?iso-8859-1?Q?QpJzL7RSd10Pq8Grfk1B/v7AHIoCJMQCN45D+TFj4S/QutdYr6nqxllYMb?=
 =?iso-8859-1?Q?9WNbTRZDq4xonI9tKHGsC6NMYSmcpI3E5yE1b7slcgkscey/yPyeWEGc2D?=
 =?iso-8859-1?Q?dW4+1//Cf4szRN61eHATFCAaS7gsMbab2o4OA4SjkmK1V8AJPv8KMmXJ49?=
 =?iso-8859-1?Q?epHTFjEK5pjQcLAEvWbwSUY2Cg7w6xykqhp7EnpsSkNWUZNw0jC+kLaQ0U?=
 =?iso-8859-1?Q?cIy2G5/Mki5eJbz70wkW2UDDUU8UdaXnVZy/JMValBiZvT3bMOaQCOJeyE?=
 =?iso-8859-1?Q?TB4A0atZxk8AnuwnYh7n1LhRjisDQ//SExEqZqjyPbuShGkdRXuJoINyx3?=
 =?iso-8859-1?Q?uor/+Qtrs1mDJX8xoW4mBlax3j93w6euxyYRmjA8ik2ueO7JEAXSFf/MQe?=
 =?iso-8859-1?Q?4yLvdnp1+e3AEdnyCgpDkSYoFku7rU9jh2y94fXLHo/imTHIYzD0lNXGj3?=
 =?iso-8859-1?Q?w1uLlAXPHldRgIQRVhzNeIfKVB1Y0M0QQQI3TA/Bu4FAUU8IKCkafIEky2?=
 =?iso-8859-1?Q?X1P6y+/9tH2Ki/clHEySTDbg21m3znZhfYktpb1yu8rbZ1trFT9sIYTSSm?=
 =?iso-8859-1?Q?I2VzrPCImfWq3/kB+7YkmY5dO3aDJLEIUW+cG4dIw7RRVblryvo6S7swdE?=
 =?iso-8859-1?Q?4nzQSYCLR2+u6Ihq4rMcbWKpE/0fqCc+oFGQ6YFq7GP+feNymiqyzdhBsk?=
 =?iso-8859-1?Q?sY77Bow4a5G0HnTus3FEFWk70NJ49Fkh7D7uY5H+H5UgNOjNBVKlGNvLTH?=
 =?iso-8859-1?Q?JZ/qEoRM1vsd025OhJmsMRLH0Spuu5Yz8cOm4mxQBFVQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?90A819my725WYq06gZssqgrflj7uQ+EUCdukf6gAziWTmcIBnPfnF0eTpG?=
 =?iso-8859-1?Q?UAfFLWmeJ5VlGfKizBlhkyfEdtQBYVDNiUTxs1i33BmSffh4FkZ41A1Fpr?=
 =?iso-8859-1?Q?GhXBSq4cLshTzabPv7k+G+BWW7kH6GEoky9F2xKWecDDebHGAt6elb3sEh?=
 =?iso-8859-1?Q?ruOQv4qEzSAQBFzI3/SropwsqeU11AHd6iRJsz5vgldt1vmKoSHnIk+idM?=
 =?iso-8859-1?Q?Nfkdt+I7Aovoc7pA+dcXhGWwl1sOXp568h4/lTsV6Uy7CS4iN6B29IaTJK?=
 =?iso-8859-1?Q?AW3lqBOFCM61xyBIvgII6yCXB0h86Sb7RFA7N+tRGHfKW7Qg7diN7d5z8l?=
 =?iso-8859-1?Q?8RaEVhWpD/twg7RNwOJ2eLOGd+MBuNkceXmoyEx1D6eH7vXJAnEbLk7Ezs?=
 =?iso-8859-1?Q?eUM+ep9NWwOgPkGdKn63IoSchhyDQzE7L1Uc5EIrFZF1JfZbkWjZ9NN2vJ?=
 =?iso-8859-1?Q?dupXFoe5/eChmt4spAxBbN45X1/TmDJtdmJKNn38GOPq0MefrUIFHE4tLu?=
 =?iso-8859-1?Q?k+qa0RGd8gqOYkdAqMQ7txUqZUwk2kQfgHXUtZKj82vDnoEgA8FEO/D/M1?=
 =?iso-8859-1?Q?rzsL8R5iQrVCE0kyUenNcxyi/Fgbr8uxqy0W9bErcgyU+B4oE/LAeg01DY?=
 =?iso-8859-1?Q?KO3un33DX73393zn+mH1/LCqKFgsSRZsRYxzYMNuxSt+F6giWfHNeqHxgT?=
 =?iso-8859-1?Q?FntATQ0cr/ycrZyksZUjbE8c100b7rLT2q3xqXVR45rAok1L+OL5H5t5x5?=
 =?iso-8859-1?Q?yQyfmY7DPdqOy6hbyjzjjomihPd1MBv6CqWBWzDpJpIp2zuPf4IdcrxM5a?=
 =?iso-8859-1?Q?2WKiFEpbX4szcWyPEEdCTHDmRxDn/+I0N8/84XHIjOWtcmE732zfpsiviX?=
 =?iso-8859-1?Q?bEj/VTzy2y3FoHPFooNhTiNiHSVdFdW4+ew8Wq6DHAmrf815mh1hr9Hw+O?=
 =?iso-8859-1?Q?g49H6mzqssN3C25S0+8uqtgdneCmI/9zQsJjEupmg87AQvqiqemVx5Ict6?=
 =?iso-8859-1?Q?+uK4zyHFNz91FD1ZX3ryCJr9uLMXMWRIdi/076SQe5zMd1GcVd1CEwYar1?=
 =?iso-8859-1?Q?36eVK0uSUUwSQQXeUzCmdik9Aphzztpe+RC46uXorbZRgFsjniCQPUjLOW?=
 =?iso-8859-1?Q?WSZQ20x0zNG3uQ6tVP7YutOgWFk5ApSWjzaQi//i3djMmLRB2YbCyybiSP?=
 =?iso-8859-1?Q?wQq0PTcE67Ktu3JjjFB20l6P3Rhuedn3XD4oeF7Pp1IciGF7xj1crtpbis?=
 =?iso-8859-1?Q?tjIw4yD59mXfWEIvVrRYkX/k/9HqqudsZwR50CqeeFyrhaA3l7a3nI2PoJ?=
 =?iso-8859-1?Q?QWgCTWWDBhmXZZw+2Iq0zxV5c6Xc+8crc2Wpeph0IvS2E9Lp8ma4s0LfBV?=
 =?iso-8859-1?Q?fuygvPzWq/9coWKu9fbFEHBWmM1dm3Fn+vs9x/xPAuHXWuE9Tw0/r44d7x?=
 =?iso-8859-1?Q?MAXVdTRyZJCw3dJbArComIBzZnhoz2DsNpjfd4pj420wnUPP5KTAw04t5t?=
 =?iso-8859-1?Q?vOlQ3THjRbzdgV6CQrAeLubozkO0TB+wZuLttVuW0J9NvUSaYzZEAS3e/D?=
 =?iso-8859-1?Q?zMZW8Bb9EC9gpTzzqSb4q3U4a76ycUfCeQW+tsNr17Y9yzOvWTVNGHOrLI?=
 =?iso-8859-1?Q?pG5qy5lP2fgQOHm7IX9VFEMujhH7OwNmm8?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 369d2ad1-c59f-4781-b56f-08ddbfae59c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 12:36:10.7448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aXyUSYypBCTZccfJU0DyqyFocPwHhJkpstUXHhU/PiMXCpatlhShZhW2eIo7zJ+VrXLDO8zvZ5oLpI9HxKl31Lwar1UagEgv3CvV34k82mY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9545

Hello Simon,

> -----Original Message-----
> From: Simon Horman <horms@kernel.org>
> Sent: Tuesday, July 8, 2025 12:48 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Niklas S=F6derl=
und
> <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbarker.dev>; Andrew L=
unn <andrew+netdev@lunn.ch>;
> David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>=
; Jakub Kicinski
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; netdev@vger.kernel.or=
g; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org; Nikita Yushchenko <nik=
ita.yoush@cogentembedded.com>
> Subject: Re: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2 =
switching
>
> On Tue, Jul 08, 2025 at 11:27:39AM +0200, Michael Dege wrote:
> > This commit adds hardware offloading for L2 switching on R-Car S4.
> >
> > On S4 brdev is limited to one per-device (not per port). Reasoning is
> > that hw L2 forwarding support lacks any sort of source port based
> > filtering, which makes it unusable to offload more than one bridge
> > device. Either you allow hardware to forward destination MAC to a
> > port, or you have to send it to CPU. You can't make it forward only if
> > src and dst ports are in the same brdev.
> >
> > Signed-off-by: Michael Dege <michael.dege@renesas.com>
> > Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
>
> ...
>
> > diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c
> > b/drivers/net/ethernet/renesas/rswitch_l2.c
>
> ...
>
> > +static void rswitch_update_offload_brdev(struct rswitch_private *priv,
> > +                                    bool force_update_l2_offload)
> > +{
> > +   struct net_device *offload_brdev =3D NULL;
> > +   struct rswitch_device *rdev, *rdev2;
> > +
> > +   rswitch_for_all_ports(priv, rdev) {
> > +           if (!rdev->brdev)
> > +                   continue;
> > +           rswitch_for_all_ports(priv, rdev2) {
> > +                   if (rdev2 =3D=3D rdev)
> > +                           break;
> > +                   if (rdev2->brdev =3D=3D rdev->brdev) {
> > +                           offload_brdev =3D rdev->brdev;
> > +                           break;
> > +                   }
> > +           }
> > +           if (offload_brdev)
> > +                   break;
> > +   }
> > +
> > +   if (offload_brdev =3D=3D priv->offload_brdev) {
> > +           if (offload_brdev && force_update_l2_offload)
> > +                   rswitch_update_l2_offload(priv);
> > +           return;
> > +   }
> > +
> > +   if (offload_brdev && !priv->offload_brdev)
> > +           dev_dbg(&priv->pdev->dev, "starting l2 offload for %s\n",
> > +                   netdev_name(offload_brdev));
> > +   else if (!offload_brdev && priv->offload_brdev)
> > +           dev_dbg(&priv->pdev->dev, "stopping l2 offload for %s\n",
> > +                   netdev_name(priv->offload_brdev));
> > +   else
> > +           dev_dbg(&priv->pdev->dev,
> > +                   "changing l2 offload from %s to %s\n",
> > +                   netdev_name(priv->offload_brdev),
> > +                   netdev_name(offload_brdev));
>
> Smatch flags a false-positive about possible NULL references by the
> netdev_name() calls on the line above.
>
> Due to the previous if statement it seems to me that cannot occur.
> But it did take me a few moments to convince myself of that.
>
> So while I don't think we should write our code to static analysis toolin=
g.
> I did play around a bit to see if I could come up with something that is =
both easier on the eyes and
> keeps Smatch happy.
>
> Perhaps it isn't easier on the eyes, but rather I'm just more familiar wi=
th the code now. But in any
> case, I'm sharing what I came up with in case it is useful. (Compile test=
ed only!).
>
>
>         if (!offload_brdev && !priv->offload_brdev)
>                 return;
>
>         if (!priv->offload_brdev)
>                 dev_dbg(&priv->pdev->dev, "starting l2 offload for %s\n",
>                         netdev_name(offload_brdev));
>         else if (!offload_brdev)
>                 dev_dbg(&priv->pdev->dev, "stopping l2 offload for %s\n",
>                         netdev_name(priv->offload_brdev));
>         else if (offload_brdev !=3D priv->offload_brdev)
>                 dev_dbg(&priv->pdev->dev,
>                         "changing l2 offload from %s to %s\n",
>                         netdev_name(priv->offload_brdev),
>                         netdev_name(offload_brdev));
>         else if (!force_update_l2_offload)
>                 return;
>

I updated the code, I hope it is OK, because I had to do it differently fro=
m your suggestion, because
not all cases worked as expected.

The reworked code is tested.

Best regards,

Michael

> > +
> > +   priv->offload_brdev =3D offload_brdev;
> > +
> > +   rswitch_update_l2_offload(priv);
> > +}
>
> ...
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

