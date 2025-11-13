Return-Path: <linux-renesas-soc+bounces-24535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B283C56224
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 08:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1164F343495
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 07:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4842632862B;
	Thu, 13 Nov 2025 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="g4HZE5zb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B142F7AAC;
	Thu, 13 Nov 2025 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763020734; cv=fail; b=VHvk6QCz607JJZkAHyBySplXyoGuB/UUgzqJO7HIiveMTVFfv485AdK/ZjNk4wYQsHtY7fbGZyE60wn5TFUdkPca+TP5oOZTg46CeL346M5/DFkxGlztmELudi2P5YUCh41fh3oHLeeXx1yNLXrzjZZ0MsnZjgAfNfXpmeeWfDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763020734; c=relaxed/simple;
	bh=6ANBE3Vh6GPiXK0MwBCCU/eZdzTrdwdkLF7B5mbI+Qs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X1FahdOLq2F20L/L2n/1jgKkQeycj9hOSAkiR677CtGlVUAfQRYkzitoedv8gerPjSiQAgN5y/V2CTaP9/BWjeTGbyTkacn4qTs5PVdJ/ZWBR+VQXTOt5DOhBi4sVh4Ahs0ahVX7qqu3TCN/oEJFp+tl4GMLRmO++Jbz4GHE2gU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=g4HZE5zb; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGfPbI/x2tVyp/cky3S1vaTc1hIFqWq+UmBoBmqKURlXAtMGjN4iumxDrXflVn9QKBZXYpuJW/l9iZVZiiJYlA4ogl+2QEFqaH0oKRHPPnzRvitptw2xS3vWDf6QsT9SB6oOKXmwqs0EtkurnY/P7H4U1p4SLSrsL7GPKuPblAxSpneW7havP06X7d10/k7AKNVU83KoRI5BeCSs2egnheDrFf0YKVCvH6j29FWC/BURgMEh4a01lbjb2/bSoRhIOvVlAEawYLUoN3RVlwTReimtyhJO5hjjXlxU9yP8wMPnIdHrDfIwPwAc1R+MoxH4coaUNzucOSmPCPr/wKHKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ANBE3Vh6GPiXK0MwBCCU/eZdzTrdwdkLF7B5mbI+Qs=;
 b=dh7kEX6pCIbJTE9c/K8SwYdkFe7KYRsAFDua47TL2xez2exkaYQR5Gwe2100kIXCUp5btIY7OLodjdR5ieemEg2JuztopgxslZrKhE2CgRMXsB0es/OlxDKyjrSY21rK8bxTF44feQ0NTMk8FpU+P8TR4MwV8u+6fkny7Zyy9Sz5SNH3ckf5gIxPr+IHoePLk8NrhPGQx6BLdzdT7TBTxiuXMemTa++P824af5dAKBDcs3ksG2QIgSmnOqDyubWXKdlwCa8Z93AWovf1xVJqrK0UZP4aFYMIVS9y6d6vH12QkYwib0TUJEhaDsAffPJyZ9MiiwRL9n5sBmxtzmRMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ANBE3Vh6GPiXK0MwBCCU/eZdzTrdwdkLF7B5mbI+Qs=;
 b=g4HZE5zbdreEc0ww8IAXJUi2pVziwuvm3k9kacbjnFvK3axu46fGwbtB5DsB4pfasYLHEy0De2vcGtWJ1mFR3jcqJEqhbsw4iui6TQbcX2RnN0NyjM2FkI3C73us0c6HyvCMZUowp8D9PEmw08UKbC/p/MBRKE/aqH7RXZPUiJ8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14592.jpnprd01.prod.outlook.com (2603:1096:405:23f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 07:58:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 07:58:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH 0/7] RZ/G2L SSI Improvements
Thread-Topic: [PATCH 0/7] RZ/G2L SSI Improvements
Thread-Index: AQHcU+rQfTV3Y+eiOUSvXVR2JqsNz7TwGqCAgAAjZeA=
Date: Thu, 13 Nov 2025 07:58:46 +0000
Message-ID:
 <TY3PR01MB11346128ABB6F938E76B54A8186CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
 <87ecq2wkh7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ecq2wkh7.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14592:EE_
x-ms-office365-filtering-correlation-id: bd2c2479-30bf-4d01-1589-08de228a7963
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dfNtd2AOX4J0fNe8mK3qfkrN9a1eTKxZhXLtRmedjjKgp+/RI/zC/FDdSGJY?=
 =?us-ascii?Q?JIZy/K5jxpQp9hnCli2RUmTgTYUfDRR85guDnz5ZPHwhaDq2AoZRjzqrllVJ?=
 =?us-ascii?Q?1tcl1XVhLZhXVu33wnM5z0UM/CkSpevAZmzq7uglQV8VTlbPnhQcn2K7365N?=
 =?us-ascii?Q?4OJX/NlbjNVWW58nCmy1gqUDWAdjRZ6kZbespETRBlkcdmJrB7mLI5sfVvD/?=
 =?us-ascii?Q?rjWFQ4xvcgQTNeU4xO5OEB/xoj7aJ8Z/YUqkTTuFf3rckalgJaZ201G6bE+B?=
 =?us-ascii?Q?dG47vxd8B8vcHGykz8/esTK+pXKIWPyrdeG/rbXIAEtVY0I1sYSKU8fHBGEd?=
 =?us-ascii?Q?dOMo3A/FnHOTyi5czPMmMzzVcu074Zd4AvI2r3AE8wD2t1aIpsjJMg5IfwFA?=
 =?us-ascii?Q?XINQtc4f2ZDw1P+yxfgi6RJBk59RHzbaWhd2m7jCQTCj+mJNQbmwAEMLorX2?=
 =?us-ascii?Q?BoDVBB9gWPakt7i060gtZx2uAQ+l+gXS+pMQSylywG3RauOU4+2enkG3B1kU?=
 =?us-ascii?Q?yuURUqEKCNSL2ScRsmMnWuE7pdnWNrwiheBfg6cWsys8lNzZ4BQ1w3EM5KmG?=
 =?us-ascii?Q?O2ro2ES2xQ2QGSwfImawWMWYfN/rtSRPUVKiVcMDbvKlcUZE4iOAFV0xykpa?=
 =?us-ascii?Q?Xn0FaOVye8thpEPdn9AWeE5UhutrpuwPDu6RuTgrkm3eTmGn330mjHiB0YA8?=
 =?us-ascii?Q?9c0BaDEUo0O6jtcmSe758fyk7wf69MprQ+HA/lIHGo9ozBRgxlYDrbalw6e7?=
 =?us-ascii?Q?vRAJ5yD1qcOk2+0kLGKRbgfjOvwHu7+mpj//H0fbN4I9ALuC0+6t1s9AekMY?=
 =?us-ascii?Q?iCXz8Gdk3s9XxZa+WDKM7/tnqekzlXnJeV6L6Ee4hXFxN02kgQYZ4ufVpHWc?=
 =?us-ascii?Q?AZ+ziDufsalHvozWEBsv9DdnQg5ziUf3cke0ekM2jdeNFu+o3kVA2ZCh6AWh?=
 =?us-ascii?Q?742t2GpMHN4mDK7rTeTK7wF2n2GUouNrVYugZgTgek5Jv1gfb7YgweBpOe/w?=
 =?us-ascii?Q?oh43eOuQfZR06+U7WWczYntYMRVAUpoSMYHIpeXpUVi72ZfcdZixv7J9leoQ?=
 =?us-ascii?Q?Zt/pswTPFEG2z/GDRT9OF6wBB3yp+Y1hJF+bjOq4OpPeG0w3B8f0Qo5g8GbP?=
 =?us-ascii?Q?Gn3djiZMDekrCmkOkMvoWY/nQe8ByeWqjc7k8Rca7GD8KRfv9y/YVylap48a?=
 =?us-ascii?Q?RqtQ7Xeo29dtWyAi4LOwyye3c6mlhe0fjP6pm0KH8qctJKVcfBHsKTDn4uL1?=
 =?us-ascii?Q?T545qcR8oCwgyZdlABs5DNpVgtM1YCC3xJCw7ie8rg5T8I0LHAuihrGEnIXV?=
 =?us-ascii?Q?Vku6u0X4DAREyoD0CKRGj1nZAsoeUukdBF5YKqWvBtEIm5ayxTLsPAaUX8ei?=
 =?us-ascii?Q?Eeto8l1Zob2HcL5ADW5DFuE4qKvEC/GTqVzdNyj7v8Fhf8HTPYILwibKlnGy?=
 =?us-ascii?Q?pTSGspmR2G97Xbry/dYUZ6bk8yZDiqEf75rVGQYpV8wW88T74RqtlHSt/ina?=
 =?us-ascii?Q?89TSyHuv3bY0EQpdR2MOTYS9FQuu2zx4x2h0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0zCBlHC74Bh76Xyf2J17J5NBr6+c1VkcZMlRfqlAVcTtoxUBjTzhnnSOnQsd?=
 =?us-ascii?Q?MvO86V4PF2Zo/TZQFqy2oUA0DiGPJWJlWqlbIbxkMKa2hEWrWd++e272rV0r?=
 =?us-ascii?Q?Hr7clN8yHCEI/TA8Lolz4Tcv+9dxRe2PlpNfw9NH8MgNxpVvqwuK2HnXrFET?=
 =?us-ascii?Q?MXyhKKyEoEZdumcVZ3kc79Q17pCdRih8olnBZXdh54dwKRFoCLk28TZWRq3N?=
 =?us-ascii?Q?rjrHc/rNUu2csh1O2B3kL49yYhlKYxRQK1Vn4rA1JdLppv7jEfNLuBlD8lYd?=
 =?us-ascii?Q?IxW+8u5x3+EmcpJddIFuOTfd97Hjw+tEoRRuqGBT7B0yU5Q8FOOB11dIZzCy?=
 =?us-ascii?Q?0VWlOEvGmi5NcxGZpMIkZ3vuYK32BmZaVHSfjpRGl3LoZJY4kO4TB2IF0vpM?=
 =?us-ascii?Q?wKB9UJcZaMUx9iT5y62lJxaas8ZTDQ/6KIhlhDQ0S2ELF9MipnvBYOlRBPsU?=
 =?us-ascii?Q?tWJfOKSRopkOV3ol+rMcWWJTYIoZ7lHWGe07KRgYWzq4VPta3kwk7dmmNfO3?=
 =?us-ascii?Q?LaDrRCQP65Ks8tp3QtG+WwoAqm1oLYp4D62ro7YKuPIzguF/2vIHKmEhN5Ay?=
 =?us-ascii?Q?CYngYY5cVllT4VgnJme2TeHU1u3/HPh8P101D9NHRCSg1vgtp0tyzwnLNdtk?=
 =?us-ascii?Q?AOTfLI7M4bzdEprq1k3FEcMBIUFZe6oZwxMqF6qNPpZKTRImHT7ci/xX+zVZ?=
 =?us-ascii?Q?Yr8pIqKHdNt5OxZ/u2aHu+dotKHirXv6y3I7C08oCLwturAC8Vd1EJk+QEt7?=
 =?us-ascii?Q?9i6ha1sjmFFvc2AIc+FMSU2TEzqrvvRnOtnp4t3aS4mL9mNrFzAJorSECsta?=
 =?us-ascii?Q?2dSKcXVyfsk7Bdu7IQ78K5UhvIkNVXvUv9yjokOddGwofHTj0K1VYo6cQMsK?=
 =?us-ascii?Q?usOFO4J9G7jYPyfzujym3DWKvkfl5StCuQBIJAUfP4NAr0vljCzIud2sKH9I?=
 =?us-ascii?Q?lpdwvQpfp+BUNzLFjqj6BcT8uIgwd0kKK07idmE9gby80NNH9eAsroelFcZy?=
 =?us-ascii?Q?c7bf97yUQe+8z5SoK5k0HUC2kyjeiqKeCFhtauTlXh0bzB8REOihNB4j+ip8?=
 =?us-ascii?Q?blOa3G3SXeV15jL0FmHHLA2djqo9niZgiYam1hNO/aAOoGBAJ/b+m7kjISHr?=
 =?us-ascii?Q?6ZjEps37Zcm+CiRJiwWsdRcsgTqfqPq2+if0A833iayi2ylXtqnBuuSFrFLC?=
 =?us-ascii?Q?WeMjRFPtvi5+EQFkIyN/KejgOWkqM0nyt9+/CUwcTS4MzbjWTHBWmD5Aml2S?=
 =?us-ascii?Q?bm/M9zE6ZdpbAswgujlvihBE15ZUF06/FkKwjWwQNyO48I8+tAJtaisHRFst?=
 =?us-ascii?Q?cMkzDCKp7MhsofbwHXV0me/N5FGy6SteVJNyQwhh7ply5Dd7IzbmlAwOAToP?=
 =?us-ascii?Q?RMKTxrUsJbDPO9tzVxWI1W0/atT9FBnfI8etBrcWhS/yMXV+UU/BHVBrjiez?=
 =?us-ascii?Q?tjA4ig4ZWtt31cUJe1Cc3zeBedE9h7HGcuYUXBAArhv7DQd5iAFj5hLg3JNj?=
 =?us-ascii?Q?AYJ6aoGHLWhAv6+E6PwpQpYSXaV8BFgBkNqXnhXuCxAyNhw8ZoFKavHFJPK1?=
 =?us-ascii?Q?jXiCo9THd9MQtEG1Iv1h4w8cdA3B2NHD4taiLIytI7BVGaAYtwT5hqFa0nKZ?=
 =?us-ascii?Q?ZQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2c2479-30bf-4d01-1589-08de228a7963
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 07:58:46.9993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: suk9C6qsRPzd4X5lz87NM9ekc0+e5GqdAVo67Z69QNiBAqPGBpb8PSVsUzyqjb2gp7ou9CsfhpxWDDekP2TizOlx4Ju0dZhhdvFQHzMNdrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14592

Hi Morimoto-san,

Thanks for the feedback.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: 13 November 2025 05:49
> Subject: Re: [PATCH 0/7] RZ/G2L SSI Improvements
>=20
>=20
> Hi Biju
>=20
> > The first patch in this series fixes audio channel swap issue because
> > of half duplex to full duplex switching during the streaming that
> > involves FIFO reset which drops the word leading to audio channel swap
> > issue. The second patch fixes sample width value in the
> > hw_params_cache::sample_width Apart from this, support 24 and 32 bit sa=
mple format width.
>=20
> I think splitting patch (for fixes patch-set, for new feature patch-set) =
is easy to handle for Mark ?

OK, will split the series into two.

Cheers,
Biju

