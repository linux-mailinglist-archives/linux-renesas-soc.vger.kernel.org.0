Return-Path: <linux-renesas-soc+bounces-24372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E8C44AC5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 01:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5532B3AC2FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 00:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D579C19D081;
	Mon, 10 Nov 2025 00:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q0ig2E35"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0394523A;
	Mon, 10 Nov 2025 00:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762735349; cv=fail; b=g9KITQBH2DjubwvSM4DSzg4gCs57PAFwbRzuaz4k6vOPgFiuY0UEujZGPfMRfxF5vjJwI+AOvOSQKRsjnzJCaoNbm7PNbKO07WUl4BuRtL2F+thZhLVIvKgKClVBqfnyQopBgLb0CqRz2pgHtSSfev3G4WzGMJkrpauoSA8cZQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762735349; c=relaxed/simple;
	bh=TUUV1x7C4JfGSnZe35EW24matCwfNflDvstqe5VdGPQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=O31a1MXgEPWuglh8exDaEdA6I2V66Gtc/UNAlhHesMaQFrRaWLNk5q8mfAQpArpTWNJh5mpzuEbOEVYg2hloAwMb6qoWUq028+nLj64fEWMHSYJcJ9/M9FhVyTcrVuk1ygdzg+q8eH9YbboMjCcSA9F3SEZJ4/U2mDrfuxq0ulw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q0ig2E35; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4F0fbrV/40SOGqjusv0OaDDp0PPqJ2N1Oy6hPl/8BDkC2g+nU2hLe/3DMIIFTvzxcxCYq3Oy/R27DTjIs3sz9WaUQt7fwm9shbvUMQxu63mWxeqBgDpQ9JeeSQmaTot3wxQXnDJe9hsADwqAH6XTjodRPT/Zr9oPR0/HZdR5tEg7ghtOlNFEGzkrdaQyYwj6yoWnYEPVi62yyY0IbNxYqJ69JFYhttvjupQu4S6fk9tw+xuOsgu+Qb3dZO/88YfUOyBwcsz/j8KiWFNwftScnBnEuveaIl0dCIp/vaA2DKU6NramfAkdT4UY0ab3pdoWxP9D4+CzOMaAs0j94nDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUUV1x7C4JfGSnZe35EW24matCwfNflDvstqe5VdGPQ=;
 b=szTQ7RuTceTbc6f4Cfw8zxYSe6Hj4zt1oBcmbfGcfFe1cy37QaLDpI7kF9i5Bowy45B1YYEO1ACHtWume1RfXTfi3rT2DvIEE+LhgvdHiJjBz/fO49TbV28utPkKdKRIfZ33+7+gzxVxhIdQq5MnXmlYOWl7KuMUYNe1dUwFW36gdu8TcViNt0ojEGdAneorQpQyCRg1/skG16iD09gHpF3Qlxug9Vh+6wkLrkpx4zh0zkLi8Z6Jtuyd6BzL3m7crXn+3nDHYTBsThApOh6gF/UCKYrBZOQHQuY5Ebw2qtu1Whu7jFOyY/ZTHJAjcVHkc3J5E/DHT7LuCl4HyejuHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUUV1x7C4JfGSnZe35EW24matCwfNflDvstqe5VdGPQ=;
 b=Q0ig2E35VpphuRfDVEHU3cYtHD+GmIE7dC4ZqyEztVkncEOuV50WPIvV37gHH8dhhklB1OeE0IlkveWIsTjKmujoaftpyGkJyIGbHnAlmuWQmvFde/wXq7eLZHLOgXUC67GBoMDeHnAe4KFcWTB8NwkFj1bQ+aXbpWFD0Dtdckk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12870.jpnprd01.prod.outlook.com
 (2603:1096:405:15c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 00:42:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 00:42:24 +0000
Message-ID: <87v7jizpjm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mailbox: renesas: Support MFIS mailbox driver
In-Reply-To: <CABb+yY2C32cTwh=8pFGGZijwd1KbpAA5=FfFzp_u1OOo8XPn1w@mail.gmail.com>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
	<87ldkvsl1k.wl-kuninori.morimoto.gx@renesas.com>
	<CABb+yY2C32cTwh=8pFGGZijwd1KbpAA5=FfFzp_u1OOo8XPn1w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 10 Nov 2025 00:42:23 +0000
X-ClientProxiedBy: TY4PR01CA0068.jpnprd01.prod.outlook.com
 (2603:1096:405:370::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12870:EE_
X-MS-Office365-Filtering-Correlation-Id: 2573e843-9281-426a-ceb1-08de1ff203c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1p1bbMezTPa54ZmEgbLOrqpzQxlioHxYbk2GW/eEk0DNnBvD65yWZwXym7Es?=
 =?us-ascii?Q?mwqeDukMwmn+2cPrJMn8FcKvJ9pswyyZ62pTc8KiZ/MOZbjwi9j3dYMoiyWh?=
 =?us-ascii?Q?zrevnc2CDkXY0kzCrw/xTVJuDeR7t4WKuZ6/oscEKEANF80HUj3c2pd8awd4?=
 =?us-ascii?Q?91O8LDYT3eqkl+m2i4CYUkbxrlUjgoASgOXToO6I1lf+5kSv5vgU9PtiPYqS?=
 =?us-ascii?Q?o37d87m3SszzlLz6zrgtUfRR3wyGrRxS5pxYxHpj7Lb3d5PlCDBFfL9hrs8v?=
 =?us-ascii?Q?fLXkEyIQ35/qzbFt4tV/zSCXizBV7qZaVtN36M7eONC/BJE5uP5MiVB1zIJS?=
 =?us-ascii?Q?8xscPldP10seAEEWw82zmT68xw9uQZCZkduH7tSqVpjVQIuykFDQNICHJkrh?=
 =?us-ascii?Q?vh3/3UFwa2sI2LnjDLi2vlNAjMl6bP3bKeGZSTHt6t8kQinnoyNovqv94UDn?=
 =?us-ascii?Q?oBS26JQ5OmPHfsNKRCUn+YdSGxx7RVYSQxllB0fgZkUtrWXn+Hu8b7KXBCnE?=
 =?us-ascii?Q?BbYbyc7h8EBOADEwMdu72qy3ZZOtDcmjODqsA23kDx0fbO2s9uCxVATNmdQX?=
 =?us-ascii?Q?276Xn3MKNEBQ9TiqVo+uOq/GFBZaaFTegio5ABNNHplDcVCxwd+MEnmyB00D?=
 =?us-ascii?Q?hKwIy4GXzRVl7UpOvrq7On80HmJ9nzjImGaFwuuU2/a/1s16FFMTyVFH9UTF?=
 =?us-ascii?Q?HjjYSp9LxrBqOJ9Y28/r1mlF2c+wAqcQepL7ArdtRgsTdtS/TzIcDBimm/Ys?=
 =?us-ascii?Q?62T6k9bU22pAgp+NiXx1EgDyN4pkfq5Vbe2fu6NJ1uBg+bbObLyxTXb+IYPH?=
 =?us-ascii?Q?jfuSaGTfH2Js1H3Rzif+IdjnUvwURzU7G7rWpVGvZMw3tvkDJS67UJrgyA2c?=
 =?us-ascii?Q?oRkDI3tgut7oSmhSNBNjkyswGquukTAs4D+jDFg105E6xjDP4a9q9hlajFyk?=
 =?us-ascii?Q?o12vMftaWmnl/xMHk3aEmHBgUEPNx4v1kUVT70KgWEllg0+0UAO6reYhbk4k?=
 =?us-ascii?Q?WRHR6hinGZdDzmiV2JKF2UPMTOyYN7EPXH1IM1y+dY59hszLgJwDUFcP20W6?=
 =?us-ascii?Q?EX9Os9kPG8CLx4bfJqMMMTz5jLNwHOfX02fy9UT799OKZTAgfHt9GOgWipmD?=
 =?us-ascii?Q?qFQFwYh2FBAAhb1i9CqelUa+sxUlYn3dAfxZw+9066CnWynxsAFM/2DjIHzw?=
 =?us-ascii?Q?NxoYt5BHLmK41BkAQjc0KCTkBT3RCOwEAv5QxQO0JR86sGFSWELBeUkGOfMX?=
 =?us-ascii?Q?S8dhm5i99Z0PMy7flS87S3JTXAcRBiyAyZCYFM3+G++6b7slcg7opTs7LqqB?=
 =?us-ascii?Q?9WzaSJp8B6a4aLH23bpGigAcyA2VKN6NLM7C1yr4ZCJJRPVgzOjYUSSTgIy1?=
 =?us-ascii?Q?9feevuqYohdjiPnHpRg8rc/4AKSZzpRIu/iYdQXeFR6e+Vrf1FChZ8eRCqoM?=
 =?us-ascii?Q?d0tj6rXRrzz+zvahOxibVJ4g4ZJcqHv/uWaFhq7IKwkzHOfYZRxIh6SQu/9N?=
 =?us-ascii?Q?9tBzdXfVYCLz9xMKWxQShMrvELFMHqx0a04L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1qz9NsYSdgjULT2zcDdFr2Frd6OtUb1eSsGJfOSEyPJHaUc7wpbpk21jP6ez?=
 =?us-ascii?Q?rS9HXyQbqidnpENC1olLsnZnqcoszQ2B+IsGFbRPUxHeA4LuciuC6E3aeUo7?=
 =?us-ascii?Q?E5XWyWVDZYPwIjxqxptNMa0qVzhcK4gYQkRupwgXBHUHSBLgNmgSmKuBeig+?=
 =?us-ascii?Q?7/aIp3+axUakyyhlV09ES4eUWzT7zI56wsxYM4UqMJfpJmkY5+dsWa9Bi6km?=
 =?us-ascii?Q?MyPKbSdyMV6dnQ7zOILh6Qe2NsXe44xTctiHEF0O/V8qdS49w4F2WBgUuSPE?=
 =?us-ascii?Q?OIx3v+T7PukbAp82X6WRetCJNwnBGLZ4IwsJGRvemOYLNVXOBrgy1uXwMbM0?=
 =?us-ascii?Q?Ctghe6uEaQa8Dj3HOyC7lQR5+dveUw9jP348PH0nPPupBHa5q6q7HIDLIoZ+?=
 =?us-ascii?Q?kncWw2O4ZA6L5i0VE72sHY2GFvMyirG3EOawp9J9Cax1mvMvhxa75DRCI7uJ?=
 =?us-ascii?Q?3IidJw6tPqdrpjaES5FYuqF/H2N0XDIYFzNVFvfsOkk2e5JcejQ2Am+tdzIn?=
 =?us-ascii?Q?qjdd5wiyOjyhgK2HaSxmPhHm8sTZt+zExeZE9vwvakcln/OCZuNSd7hX8X6X?=
 =?us-ascii?Q?L2qCXScRv4aRyOiIURsZ2nRfl6FxnkDE9Jspieim0RtGY57ewkFK9+/ct3pP?=
 =?us-ascii?Q?1mk5acwTuJbGKePXED6zhsi65+xxwtmvEwuTBDgP4NUY3Gzt/RbRlYmIK6KO?=
 =?us-ascii?Q?1E8esRM6e97L2eYkNIRkjFEYhjesr2WfTHxJCPeZexGidDkZh8oGStSwUieS?=
 =?us-ascii?Q?N5VTsEkRi9cVTRX15vBL3b2xq1VfRVqrlTtPR3Iyr2WG6WAdoqJCniDbTGM/?=
 =?us-ascii?Q?HWUAXigEihAM6CeI7MkOVWiSM2XAj85+oAKpB2iu1/5YehqJ1ngBBvtV5wtO?=
 =?us-ascii?Q?aHeYE5djHn0kp3Lbullb7An5/TXCHC0gGS0XGOUXfI/9vsjNQ8b1181UmbWP?=
 =?us-ascii?Q?TdmBwauWMs5oDRvWmNfBBVOxfZztj0f/Cr4WByCefo8uDYYmLxXLklivwoU7?=
 =?us-ascii?Q?ZtdHFd1ZdUu+4p3qbJEWYYXS1taeqVkQsUYueJXfiOK4h1/jbzYkYMUkdq0s?=
 =?us-ascii?Q?sIeUbOYbnpPCr+ozXCc34L0/jdZomA/9lWrxkaejQDOqCNp8XX6fYIdX/Rep?=
 =?us-ascii?Q?7bVUXSBUKdOQ4/ifIn1f55ald+7vtO2/hLX9qqnz9PBKwKXhHW/AtF3jwwcb?=
 =?us-ascii?Q?Ki9wI85ODAlVzeAgBVy/6QLCDOgCuWPtaaSxT3OfL4Gf9cyZ0ytEsVAtSCxl?=
 =?us-ascii?Q?U8o1eCKpmXr1qNQspw/cFrMqQl6cdj0qYGgf9nPNA3THs6uf0qXh11/bKmVJ?=
 =?us-ascii?Q?HgyjlRmNT0I6XY5/am/HDkHhUKUNzBy+dWuhtLqWQWSNFaT/fNSoMRpbOlNB?=
 =?us-ascii?Q?OePtync+Xci/3ofsZbOhDqQZbwo5rpr8srLOd3s8n/wqKzCorLTXWHJEI0lK?=
 =?us-ascii?Q?1ENikCxDSXXvAkqxutTgVRVgRV2a0qw4c537ttjtS4C3Yc+JGbD7Eh/c7nHi?=
 =?us-ascii?Q?mshPmiCOweOIObYIXP2GTJLg93Mh7fgjCQW94CiW0zkrvbpyE/LCtJUgjzZ6?=
 =?us-ascii?Q?PJYA4cb7jZR2R/bIjMjFH5IZDX4bg4bKMuwRpcyXxzBP0qfVXwpDyTrD6SC9?=
 =?us-ascii?Q?IbJOFClIWIq2CyyrzCRt89s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2573e843-9281-426a-ceb1-08de1ff203c5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 00:42:24.1019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPMPj2Rx5ysJwR7ofWpcBLyRPHnzGGZGRoSS993S2AgRIGVE68mDKwbiV/bIszUiR/ShqPs9S0vpdyeBB6ldmZQBkp5Ir0vbGMuaKU4h4rqiQJU0OXVd2u/u/M8KP9Jf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12870


Hi Jassi

Thank you for your review

> > +#define mfis_chan_to_priv(ch) chan->con_priv
> >
> this should be called 'mbox_chan_to_priv' instead, but why at all?

Basically, I uses driver name for prefix if it was "local" define/function.
I think "mbox" prefix soulds for global define/function

Thank you for your help !!

Best regards
---
Kuninori Morimoto

