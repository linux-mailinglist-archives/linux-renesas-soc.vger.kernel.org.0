Return-Path: <linux-renesas-soc+bounces-9794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8716A99FE16
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 03:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3254C2824A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 01:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248237C0BE;
	Wed, 16 Oct 2024 01:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kUeeZU+A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011048.outbound.protection.outlook.com [52.101.125.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235731EF01;
	Wed, 16 Oct 2024 01:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729041308; cv=fail; b=aWyBuepGmiLxdafVVhFXgn6O+z1rzgrBPeI0O56RTmpXpqdUu++MoZjuXCBC/ySmttAK0Eq1GhAVeFfl6obLVuDoFUpD+Xi+ft+A1OyUdIlJ26XMJN9LJSXS3jHtnHjwu6ajVf0cxHTvvNM4lsUwxnK+QF2Dj2zObX4Gl30b27o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729041308; c=relaxed/simple;
	bh=L68hQX19XxdQm8B+ShhW6xymnLVp/4DNF55XlT94cfE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CmVn2i82or7tLf9tWDhzd0TwtnHbzPW5YoN8ytyYKiXfBpLg9AbyprXVWMwXubbNu3uKYmxo5ZXkYEfGQUQcytZ7L9FAukGAMGb+PAsmqZgJw5rWSBMtZduyfNzxGdnnFNNygtThYMyO3szkSeDwhdFafkkiwb3iR8kjIy+esJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kUeeZU+A; arc=fail smtp.client-ip=52.101.125.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbnDG1VCLIiCWUsZfoYKyH2m2M1TihxPl/y9EKvWuiLtM1eAAkV2O++HyJ4oI4liAdGPPBsj+VfWbMZ5SFHnT6PiVIuhm3EMTMm81M0KRicOY0C0nKUq3d9XH6matD24lsuA7ICNtHFC/uOviE7C92d39R7ecZ6LM4tMRDlQuDyaVMLuOxpQF7x8avPf9Rw9OSklOoXE3895qUX+aJT1XRXpuUOFWYad1cUVAIBOhKtw8+L6GQ14S2BvI79LD55CGuGwjtURT1ffsqORoxJ1Vol9IxVPvprkWOfIOOOtR9GBzrRm2RmOL/JievtM8EyMmkaAlqf9ZZO/Lu7BzUrJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSmYGJN8p8ZIOBehbIZ9MZsTVKsnHk9Q0rJR+rsaJfs=;
 b=g225opN+tccLPd1wWuwt/rFPWRHVPGL+Zx9DzdGx9urbhyuaVFJZLb7/ZzVOT3rOWdRsEVOdpMT85EQuUEFxjrQenwyrVsybVYZEnlnx6yoAEWEYe3D1umcQochNbC9cojR9PtMO41RkjKh6ikRPSN7bVEPqWt/DZw/b4zt9+2xob4P9EfEE+tPHgtlRRjPx2hSXByU6ly8ml7oYlFAkeBX+nXDNETC4ug4G7XXpqwFS0623WF+tqp6tNFZAHJ83fmRZybX9DQeEw2YmdUB8ufUaWWr2BrlJa9lKV9Ou24tefkqbf7ykRTkxch1yxilAYDdJypAk/WmxIl1YBW4cdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSmYGJN8p8ZIOBehbIZ9MZsTVKsnHk9Q0rJR+rsaJfs=;
 b=kUeeZU+A5kcyYb77Za1JG0OaDap16l07RqIkP67Nbgx1S0Mv5dAmVa+mObTIC/NIqriQfK7hILBJcQ68Eb1aebl9PmJg5yrkww6izM6BwTRr1zFvrLCqPKLb/kGyNVA08sNnV50dv7Lx0uY4T0ZaVwOxEAdXyVOel8GOYMpX298=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6210.jpnprd01.prod.outlook.com
 (2603:1096:604:f5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 01:15:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 01:15:02 +0000
Message-ID: <87ed4getm2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/3] ASoC: Rename "sh" to "renesas"
In-Reply-To: <20241016010145.GA72114@workstation.local>
References: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<CA+V-a8u8bkCjL-YSyMOiKOtfZC8upBwGzhrJ0o+EmZ9S3z5hGA@mail.gmail.com>
	<87h69cevrt.wl-kuninori.morimoto.gx@renesas.com>
	<20241016010145.GA72114@workstation.local>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Oct 2024 01:15:02 +0000
X-ClientProxiedBy: TYCPR01CA0175.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: e741cdd4-3ee9-4706-b42c-08dced7ff5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k2miLNhem8B70JUbDIhXZph+oyffdXGerZt+DGvmhNce8PfwKRDiRCuvo3oN?=
 =?us-ascii?Q?D9bK9hIKScYOf9prBnUSsgUv0ygcAyoCbr6f+ODuluNpE0GFN2jjjanSsseA?=
 =?us-ascii?Q?8+8rnK/Uq53m5Fd6mqfugSFHZjV4xVqyreQkPsNmYzAjfxhIrBAAs82IGiwg?=
 =?us-ascii?Q?k3eIO7gLyqwn/9GDc3jTuv7yDtTiZitLAQlzldwXFurwaCEQztPhEhwRlyKn?=
 =?us-ascii?Q?L6D+5dwcMr1jW/9d6h2p8TWAeJdcyZl5a/vu9m4njw37WxdsEY9+JLixhGhf?=
 =?us-ascii?Q?ozvfBf+IIZIMUvQOIWJ7e5tDuub5vB8BKOu71XOfZOkdX/poJBj4cy+jKW84?=
 =?us-ascii?Q?/pYMlg20jpwTlk3Y+hPmxnOtdiHu6jwx7tHMPojXArjEJr15ouQfLK+hoc1M?=
 =?us-ascii?Q?gTCRvBLMigMAReQpV77jd5gEOPVQUk1oTI17qnzks4wxClhhdugUXSnMYX+W?=
 =?us-ascii?Q?KllId1sKE2vz17I/CoBGffjEHz8WkJgUpxL0fIP+Cs4kTJb0P2H0jjR3E51q?=
 =?us-ascii?Q?F7iaoiZqf2+qX7zM6kdX38GID3lBOWC2SQtYMVAyVF/H3XHCS9945AyjFwml?=
 =?us-ascii?Q?1kBCBLNycRFkn4kAMs39UNPg9aWHpa+bZePFXjxV+53Kfa2s4aGuT1kWYtgJ?=
 =?us-ascii?Q?D0/N+pafYzjnV3L/VTj7MSAvbQIkmF/QQnRwPeGUdI1TsVnhqpCvQBcmCzGu?=
 =?us-ascii?Q?ipB0RAYeeATqbdHNWOSmTujR+5bnqAQafQycDjeTZsfdyWuQY0aBaqJcT2U6?=
 =?us-ascii?Q?it3irl3SVzBiCTg9fUZKEVxkeD3yyb4zHlJkwDe3KeUuqZ8WqV+oymKibuLU?=
 =?us-ascii?Q?FdeAyf+GIJr6rKLnsDHkL79H5l3zKofyNQJhXsY4xLFZtjB9jvavHLdqWgHO?=
 =?us-ascii?Q?a9JyxZBMJ4bOevGqZwCfj7y0EZDVcZrCaoJqZsGeFh1RZ3Cm9YhU/0aEoTU1?=
 =?us-ascii?Q?mqzhz+ORxef9eDrPT9Phlxha8jkqC5SPze37WDC2xwK2fd+Gc/FY5F7sT6HS?=
 =?us-ascii?Q?GedyqSrUGUepIIIJ71Okvp9fAyaCiir4L9u8CufT4DPK05dxtE433qQKBJaW?=
 =?us-ascii?Q?JrKeKxK8k+8SnTUCZAO2Q++iFEQVPScuNjrbYTmtJYwNb+5wvINlDBybKtch?=
 =?us-ascii?Q?sM6jMbXWzRI0/JNLHbo9w8l12cpb2WZyX3XRBqs6km6XCxOxdQp4z1qAEio8?=
 =?us-ascii?Q?3ruMODdCVG7MAkMg7MCHvUJnTtgIoQG5H5c446SGIzIHvCB6Ff6cbNbis2ot?=
 =?us-ascii?Q?p/pBttsJQk3bZbKdeOtxHQxUgeoJ0S2fdlWqJEmCFswKKZV/fmB3i9KblffH?=
 =?us-ascii?Q?tEbi8UTtCsh9ERtIzkbnTlKXxWeD01Va8oQwk/21JLYRBw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fc7/PUrvECiVemUhosBoizu2GuUPjs72k4e3cF7uRvKhFWOlTD1zZJ3ASvp7?=
 =?us-ascii?Q?LX1poUr8qcqJ6TmSfDh66Eichjo6i7Qcv/Fv8i4rXxmrZAmsmDb4e3mk+vO5?=
 =?us-ascii?Q?IfQH6cFv+rHBKVT1WoQbV4ZZ/ZyRTMpKpeGjXyNyaR3+1nHh8XJFJyAPWGug?=
 =?us-ascii?Q?FfSfAfxvlLnl/yyhnmpCjqwxJCfJY2UZyMSW0Lv4g9/RV9pGHpc2ChjsrIK8?=
 =?us-ascii?Q?wAkZYIY7AwBl7lGMpsE/7UFZYHmKt9reACTK+q7ANEgF7gGaiypsKWqZhTE1?=
 =?us-ascii?Q?LviVYnFx+WE2fCPtxX81LbX3GQP1d5d1x5rMg1BlA4hFM56xhDUgRLRBZCD3?=
 =?us-ascii?Q?EtVP8Eicle7If/N3jTOqyqUPib+sMy6KaDI7KQcfOwDdbtXvbSsvSC6s+Gfn?=
 =?us-ascii?Q?H1dulGbO1YP7htJ48GDu+aPDZcsasndjdbi29iCdBn3PqNPklFVXRPK9XpJ9?=
 =?us-ascii?Q?lO5byK5j6fqEnRXJkVBPyWJdihC1IbmbelrUIaxnWZCwF+N0WX6BfTKqOot5?=
 =?us-ascii?Q?RZoQGiUenABtGPj5f7NGbti9gypr/dNlJ7wqHqvNoVrp/+gOUPYRYxm8/yeB?=
 =?us-ascii?Q?fYpRGBQtHrhzeFa8upu7eFHlL9KwZRcU6ctlTDXjCIq4EiJ91pH/TztdLETa?=
 =?us-ascii?Q?JXxX8l4TOLPwBFkTtEAi0tww1/OY3jm4Qm8oiUUQzSME7fxAiKTHOH5+1EHJ?=
 =?us-ascii?Q?0hh8emQHPGVMva+auxZWsEe4K3Z022u8T9tINC9jwadpjzRpTue2CsXo48aj?=
 =?us-ascii?Q?1A8KgnuXAF0/FFnzS3TPGurVd1XVcOnXQpZJqwjMNguug81NemOQKQCG42+G?=
 =?us-ascii?Q?M/Si/5p/SWG7LGgk0g/4Am7cxVLeJUchEIuy4dbx0kwvJWiaM4jX5ZP8ZEXd?=
 =?us-ascii?Q?0FsP/RG680H0y8za4h9JoH7uwSEH7582ByZ9aSiIod9/c3G3kBzvMAvWT76l?=
 =?us-ascii?Q?UwvqYZM0Fikiq73snL+uDEFe37keEJ1hfNVH3LyqKCu5666C6Cc9qkrnEjIH?=
 =?us-ascii?Q?GvrI04bdLBBJ9Wp9Oi+cxBwH6AFyWHZu4hogwsYA6sRkGhQS1I7va6hYdH3J?=
 =?us-ascii?Q?3Q2+Ufcohi0EafnUmfaoMEDLRzkhy5ajrOM3w+VDjA4nEXcwFFYJxDh+Ro3a?=
 =?us-ascii?Q?x2rxkaKL5Ocf9X4Y6gctbbc2N0gXk7vlCta84Uc/NiZyESj5bh/if5zX9H7g?=
 =?us-ascii?Q?g1aoo69+d7tC32gmuqhOajfzVoKGU0Ldy9eGsxi3fNDhj6Kd7xHLLt7jqmX4?=
 =?us-ascii?Q?JVGu1rZNcGPPYuMii8yQE6VbvIK4USLw/MC5c0FDfNgOsmegSZhfpJt/Bnhk?=
 =?us-ascii?Q?VP/3/pvAVNp1jwzSyWK6P9eKP3dSZid+RzLBJWqHyvSmwL74NGqvcRu71KtQ?=
 =?us-ascii?Q?YbebDQL9v74spXXJLeNTyo1jMvjC8kkn9xdMCG9mku/Up9luZkz5j9zcbB3s?=
 =?us-ascii?Q?SoaFU+aUCEd8vI7Smcs1Nnnh1ZR1I/GDhQw1YuZJogMSVhOpHXJkmk3VOGFJ?=
 =?us-ascii?Q?fKI//nmsA6u4t8JQdszHkAz0fMiNITDKCFDZpfb9lukJ2LvSS3JrkdmoWaS7?=
 =?us-ascii?Q?8naQ7y6fcoTyssDN5tPumscZwdq/bY0cQVHTt+gfgxRAA+FpEwryyP5Gs5mg?=
 =?us-ascii?Q?dQTc838k/seIXU78OONIJzo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e741cdd4-3ee9-4706-b42c-08dced7ff5d8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 01:15:02.1903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwN5eNMlYsqzEEWdHhxSENn1CTJU8HoweQakC97VLtQH/M5GF2FgmqC5xuH6hMp72kpJtSEBSu9saQ06EDSeH3k0BvDbHHzUEPSRm+edMWgVZaEk1G1OT4nqd8RghRCg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6210


Hi Sakamoto-san

> > + L: alsa-devel@alsa-project.org
> 
> Just a small nitpicking, but I think it better to take care of a merged
> commit in which the list address for sound subsystem is changed to
> linux-sound@vger.kernel.org. See:

Ah...
I have somehow noticed about this, but I didn't know this mail/patch.
I now understand many things, Thanks


Thank you for your help !!

Best regards
---
Kuninori Morimoto

