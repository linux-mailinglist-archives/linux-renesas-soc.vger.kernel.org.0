Return-Path: <linux-renesas-soc+bounces-10198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A578D9B5617
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 23:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01C27B213AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 22:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A72A20A5F7;
	Tue, 29 Oct 2024 22:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oWJ/nfdd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010042.outbound.protection.outlook.com [52.101.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884AF1EE021;
	Tue, 29 Oct 2024 22:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730242464; cv=fail; b=MLMWlLjV9YcjzIj8dKN3qKWj4LwctGj+dVtSLbLUb+j9fA30o2VgqjQRUYMcZO2hzUhbluUjBaSK2NQnmJ74UnkQPRfR5NodIcuEZLP1qeL0sWLcXejn4ViGmMgToB/S3rLwf0THrCHHAgSlOM83FnDw5Hsc3vrEpqLADnJZkbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730242464; c=relaxed/simple;
	bh=m7ItrfgwnQ8J2E34A1C5/XZ+CvdXUmqPOixEXxV46Rk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IUvmpjWGPCT+OMfJoBUCEAHB/j567g8GRUO/kjVjLzfH8D0CajdLptOA2ImsVxVf1dFDPRlbmg/UOkka0eBqqkJGLB1Izah4ed11aU4gVm7iR48GoaYKbsYyxzwN9oRfjzLf+0vVAoNVsWgo6j40txDuQee6NKHRIowWA9FkabA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oWJ/nfdd; arc=fail smtp.client-ip=52.101.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OavPcElQy+j0JT5MVlf3vOlPPFa1D2FqxSJwha6tmOvamoHg/acE0gDTOfw77BnaXOrNI/I/FH6wy1YP7C+jpDfsJgREHbM+INOuT+lhVUfUm6Nek4CvLezazZKHDGab/SIwrXY0BXg6QMVqtApluWmS6sKTpkyw4Q0hfa1291bPAWfORwB9SEpCsDrrgM2fzcDzPUJI+V454DnogcLzYtZHbFk/CR75rYr6UEt+tKWeGJcrLkFHR/1yyLbOOeHNWFzqh5ILmB1WNG/SkJpKwKlPjoYSakhoPUeaxKfHEeUz6wVwuekBamVhABmg9LrUC33Dg3dmD77o2hElSart5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCozKpqY4T1YTPPzM4uXX/KOUcHmEfBI6Dva+54sRTI=;
 b=fvUc8QG7XA2gIFykq12fM+4gG76gXxwMXWBr0ZUMux2qha3Sz04gUxosEBt3WczO3c9R5JGqmlvb7UT5GIFgXtNe+ERIc8YD1TvQF3cYQLaia+ArRRdapIWE2+oYcRSTIyP8Rxp7oC21N079delrPe3Ovw30pJmjGyGZPJcPcwowvmz5XAfWrrz+U+U78OeCBHeX7k+NDmLfWfBTlB/2kf5/eMPXTEp8hXrkj0RXCGmXv19rTDYlM2aS9Utzehp17fgs7NnRqh5FUUn/tvwk9HHbN/tD1OZUoVpZbeUQUNMbM9+nBHAQ+p8ShIVWpM82av/EbHWxEhyjmtpjnrVv/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCozKpqY4T1YTPPzM4uXX/KOUcHmEfBI6Dva+54sRTI=;
 b=oWJ/nfddnJ2pdW5mfpbvtLTw/1cnhBzAt8WGJQeCdp/j3fh2P7+VOrAg9I9uR/INB4UKhc2gYuK7mUecqraq0VwyZ39a6Pxr6Pzz9SahyVuLM7PatHnXCkxGbglvt1iJ5xYLGViddUN7mKMpC1uXuotYZBEGqpyyd6Sr2p06mW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS7PR01MB11837.jpnprd01.prod.outlook.com
 (2603:1096:604:23a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 22:54:19 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 22:54:19 +0000
Message-ID: <87ikta4j1h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 4/5] MAINTAINERS: Add entry for Renesas R-Car and FSI ASoC drivers
In-Reply-To: <e2d8c84c-aef7-4864-a98c-01dc1041915e@sirena.org.uk>
References: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20241025150511.722040-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<e2d8c84c-aef7-4864-a98c-01dc1041915e@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Oct 2024 22:54:18 +0000
X-ClientProxiedBy: TYCP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::16) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS7PR01MB11837:EE_
X-MS-Office365-Filtering-Correlation-Id: de3d6566-fc38-42a1-3b33-08dcf86c9f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xQ5hE3bb0GIYCvBPYBLuReV35+7vCC658Z/1PHfjxK7TjOs1H3pcN+Fx/ETC?=
 =?us-ascii?Q?SuOPRoU5rO6gjMltsW2BdSrcgSdYWB0T/69C7Fx3HuAEn6RjT3Ov+zuJdboR?=
 =?us-ascii?Q?OT0icjo3iSag/GVdrTn1K+z1vg2fGA9+jH8M9aEE5zDmPbAkOpXt1uZ90oqL?=
 =?us-ascii?Q?8Ma2lFxkJftRTvf7PA3GnnXgTbCfEPOd+oBBcTWJBYh5fzSyS9AjiUi6gyGZ?=
 =?us-ascii?Q?jLK4GNgR1sLfLApTjur3jsQKm/odeZ56t3INJ9BHXpi53YzES8C2zsKLgeOP?=
 =?us-ascii?Q?hU5jWWJlTROCzEpmYlnYlQh5klZXzrxOWHtD/cSSP+9Z3AS44cBISvyYKDia?=
 =?us-ascii?Q?gUW7SEOp32kVegpjvujNrz0vifRw1/W9S7LMRZY/c8HzwhOQHgw0Z/Oa6KOM?=
 =?us-ascii?Q?bHSStjYWQOK2K97wMBuT+g3GQUIYTB5ydm0qFK1h/EQQqcTehm8ObZAQs+ma?=
 =?us-ascii?Q?DOr8n8S4hvK4ww5ivEZ+cRj9Pk8KSZOd5XfNcBnTDZA79VM8wd5IcFv4uKce?=
 =?us-ascii?Q?FBPbZ/mSlOce+g+Vt7w6QpFHRYRnTbtHnoPgxTMYmeAxFqni2OMGLsCtj6RP?=
 =?us-ascii?Q?0BVXlPO6xu2f8JEtF9o2AHPm7AIdeK3nhkhPgVQFcJXisYzSZTtgRnJJ+8i7?=
 =?us-ascii?Q?EKaRLXu5CVYMDmOiQIM2dETRZAXv99o0rZKMwCB7XhBv8yj/six672kb4zHT?=
 =?us-ascii?Q?N8as4dgKSYMoEArgpggMf0THR7vKKot+d6SksZzK2u5HF7aqDj1UWHB8pBTJ?=
 =?us-ascii?Q?fPirjZtpXEfF1tMtGoa4tfn+RR6VoJTyR/ts3HGBDypcUdMCuWAY/HzBA0dC?=
 =?us-ascii?Q?uZdKlxA7bOpAoI7kUcksdeSDcTgY3zJ+Z2dNzyLpRb2wbkBsNgiQdYoXIKFE?=
 =?us-ascii?Q?ODOL2PBaXj9TecVeSQyvXsxL8ucHOP/HCaGrLZkFDONe/Jxxxu9NV2E3A0dx?=
 =?us-ascii?Q?zD1KCkIa/y/zU7yLslPP9HXG7LW/uLaP4pCQvmLTkF9Jy84hzGDxew2kYo3V?=
 =?us-ascii?Q?A51ZlnoN2cb+qii5U5gSYCG7ZcoyWPnQj5nPSNaC4HLOje6mBUo4kRWF3fYY?=
 =?us-ascii?Q?PLTnIxCJT4L4qOhUo+UF6qndT4AOcPEoK0yXu7Khi0AwDMT3lCPpMMVhxR8H?=
 =?us-ascii?Q?EyqF4iPTixbkY548b5ZthoIlt6Wdw2zfxv/8Px/GYUD0VQ7+ZxJLWZq8pdiz?=
 =?us-ascii?Q?oZgBXKxfRi2YMkyhG/b+K3PiVOXOL826QtZjg/WrUbmRkveRnPwHdK6eQ4Fd?=
 =?us-ascii?Q?TXJjlMJ7IRPGyUHk+OMDpAGrnlP/C8i38AzOS8wElSlT9YZkODC2R2AspZaj?=
 =?us-ascii?Q?U6zhE3THkfef5kQjVi3aUaqTsSKiDruFBvlDgQqZsQCk5Cd7YDJ0A/XRhms3?=
 =?us-ascii?Q?Y1mqEVs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Svi8Nm7Zzu+K2tTkiVBWPOW1YZ8wUjDyxQXEbhHCsS5zhNJR8RUMTv2OLBQu?=
 =?us-ascii?Q?86/bGJwMrEOwGpBaxfMNKHXjy+Ly5Xhylb+EA+hsLxZxD5mrBw+IbtE2OcV8?=
 =?us-ascii?Q?mvzEjZz9kFtYRUj3e3dYfwunqTkcjy9M55uPjH6ZxUKk47oWFVPR+dBd9P8u?=
 =?us-ascii?Q?GgyVRdlD9lng7RroNoCD34Ojv7LxaeWvxSjmVd+J2mpcwBubWaPeR5c8XOr0?=
 =?us-ascii?Q?MHiMtoB/qomVdM1g/i20+KRnVZq3HeVr6ZTC5r08Wniyj/vxqx7E8zfFdb7U?=
 =?us-ascii?Q?/BNjrgAaEqOV/OYaejrYezBs9z952ET0Px2033CNnLymIc6s0fTH7rkymXVm?=
 =?us-ascii?Q?z7GSpkUO3qALMlMDCOqu/dKGa9z8ARzM55vownwvPteoZJwVaKssm7suDXmp?=
 =?us-ascii?Q?9+7220xcsA+svJblhjQT9sbS5QtEKleh+lHidahqP6YQ036AILImr0Y0NXn2?=
 =?us-ascii?Q?dWYuFwhvn7zC7r3/cKjyCcV9dVIT0vPcnzbPX70GAC1JiHADhBLsd2EY1iYJ?=
 =?us-ascii?Q?DR4csE8tdv7LsVcGWQCERFikX68diogyLcD/PB1x6RsMtF3jXHyIvd/i8OrU?=
 =?us-ascii?Q?0bwLxs8S65kc9GZJPkTwbsZRwhVagDy6GD61jZ/bPm+80JeEPlkKIO3T/TNF?=
 =?us-ascii?Q?a9TzftwtGYRuMm0B54jQBl9dRswZtYW7EtGpP3AZ1CbaVjrS67hWGoIlFJCR?=
 =?us-ascii?Q?64Wtz6S4wvtkhPyFiVKTnOFh8ZB8/9q5TsCb1Wzd8ImaDc+EIWeIHpHx05lN?=
 =?us-ascii?Q?8+I20/YDjn+yD+FpT5KEmWL50b4KjuApbdOWP8FOJ6Ywbt/ymEtzGw1gQ9Tr?=
 =?us-ascii?Q?UQy18E8v8sTLE9T/yMeIsOqGmZEo4bvqrgr5IFT7rJ9uLpcgSKLVWsKOY9xE?=
 =?us-ascii?Q?MCLoUSU0A4jKDtk31Qj5+gWCcqomN11GszMA0OBBQZwF43u3yta7VDDade0s?=
 =?us-ascii?Q?3/k+4pM/mvJQceW/mAV6WDsXijFiVYZ/gkllGrz9L8F/rdsUpOwGQVZAnjlu?=
 =?us-ascii?Q?PHFNF55v7fSYuw+nFftfCNh1SgyLBFI6QEScz5Va1C3gk6jY0EK7fmDtsLmj?=
 =?us-ascii?Q?Mk3CfaXG/VgEZTSXeCKXM0UhbPoLVoZyKs5z+tPNnVfw/l2Jc2FzWuhIa5dL?=
 =?us-ascii?Q?SOLRZK8kTKLixGzdlJ2ohbbItEaYEJkVQArkcrLSH+uzogPfzsbF7WdufKNK?=
 =?us-ascii?Q?hUxUHoUHKwrwmJKD3+uQEQB9j2moDGubwU2P+rGxcqnrpj2inVGKNJArEq4g?=
 =?us-ascii?Q?5wfQi8zIsAKpPNfp7lN6sEX5DMp7sLqtqqdK5imEtswTmsWvH4nXFVeXHIgB?=
 =?us-ascii?Q?KlO4w5dAcTYeBwWxs1ttG4ubRwDuaAPXUP8jp2AhlGDg6iwMgwavZMXre5QL?=
 =?us-ascii?Q?UOT2Ui96MxU/5GuqTIKbrl3nOkLDqjrLLpXXXS/JuEQ6FFvn1B3eJ8iqfX8n?=
 =?us-ascii?Q?WweHQR+uQc25FyJyQrkncSp9QMHMVp+r3HA80naIEN6cSSZo3xHn2sBivkmh?=
 =?us-ascii?Q?46zTAl/3QnFww7K9E/fOe0SwufF8ERz8sxZXRGN2P7pGirjwkt0CitZBcTtl?=
 =?us-ascii?Q?R1PlNybfWaRU5ga4thZ+sNBkdMCvtDSD3zMoLsIjgLUE5D6Ewu05NH6MlMEZ?=
 =?us-ascii?Q?oVdTzmR7gwPCol6kE89SnCI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de3d6566-fc38-42a1-3b33-08dcf86c9f2e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 22:54:19.1413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cpf18kjsFpnVJAuV4hGnxaSqoMK0+lAvNcHz2JCFdj+hIcc/aYSKvqqV3rziUG3MmdmJ0T1oN3+UiaOvA8RGVDJPMmeJ8vgAaAs6zax6/JpZcqYoHw/XYMReGrrf3ew
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11837


Hi Mark

Sorry for my delay, I have attended to OSS-Japan.

> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > Add a new entry to the MAINTAINERS file for Renesas R-CAR and FSI ASoC
> > drivers.
> 
> > +RENESAS R-CAR & FSI AUDIO (ASoC) DRIVERS
> > +M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > +L:	linux-sound@vger.kernel.org
> > +L:	linux-renesas-soc@vger.kernel.org
> 
> Morimoto-san, I guess this is OK for you?

Yes, Thanks.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Best regards
---
Kuninori Morimoto

