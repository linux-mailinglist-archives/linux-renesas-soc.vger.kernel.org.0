Return-Path: <linux-renesas-soc+bounces-24529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A213C55D7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 06:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 75E7D4E308D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 05:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A082F60CF;
	Thu, 13 Nov 2025 05:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ioLIf7db"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906CB2BE650;
	Thu, 13 Nov 2025 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763012956; cv=fail; b=SRchr0/JIa4CL8vUq5wSNqQauUxXd2MrE0qZOgyJiJ9ECHvUUrpqg7LecXREOMBD8EQYjLUzs8zB8ASlnZTrg4hLC+7zvlY7mn5e61ZJ31SJSNNdRoIjU3NXfO4OKYgabhnCA8LSqyysG6YGDErkct/ZdI9vaMRYtEr2jDM/tig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763012956; c=relaxed/simple;
	bh=Ad9ELzGcdaoB9eOTdcMPRHNDd5eknqCPi7j7QqjWByQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BT6Gou0JR9DV8HkKK0MWKgVWrdIInM6BPwNfL+/rhzKeCqFoTLK8oBBkIfyVHh/ghSPT7QuW4BLn+qC39cT1/+g+9KT9MZr6ewF2BPrPizLupPMZn7llC+GSNt2IA4JVcVr2T8UA0QQrlgQGRnzlP1l7GzLt5SZwk4a9bH6N1RY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ioLIf7db; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6Jew+GILedorKKPalaRPgaKB0LZMursWheFAHr7IPHODYe9i0dombJwIBrUwPouoWvijFek0Y1lKC21T6i7q3UgjbnpW17T3At2cTeoNzu+06zhIcD8vvQTsXK1QdQnLh1laI5XkF5EfjgS3oC/AxYGHBbDzuFQj0K6jv1iPx+2JJ5jhgtjuE6W0QY5nSFB9xoZeTflJCk0Cr8y02uOl9MyX3+DhtoJvY+U110+HCDhkCezlADs56MzWheicu83CBFC8qArXvhBgpIJhQh+DspBOdzB6eBYZbxGG/e5DDpfdeYGnU9P4yiwjGPlI5WZoPJJPdA4aXFqAgX5e6IQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ad9ELzGcdaoB9eOTdcMPRHNDd5eknqCPi7j7QqjWByQ=;
 b=jpX1vXfLvkeIV/+X6xnCoCYysMVg94OurosCHUugrETeJ778TdfO8yciezCM5u/Ojz/rTeXIflRA2tHN2D7ygKKDpt/nhEQHCgHe+Vjp1edmNx1wM5oFlXwCLLXqFNrcsNnalI3CRSs3lhu6bQwzYOBsMCohd5WxfvoX3HSVjrP0Ezcq15Gfi1zfOOZSjlrUAo58+DodUVF5takAZGxzdafsN16EJm0Nc+q+tEc6aZsltPSnYy1heSmOLdGhK0bX6P+UjSixSV73fXl4tEs5hw6s6G5m/B2+0g+HIsKmk7G6o9CQ0e0pwuj6telpOJGgTZh6a2yGNJdZ2ny1jR6xPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ad9ELzGcdaoB9eOTdcMPRHNDd5eknqCPi7j7QqjWByQ=;
 b=ioLIf7dbX7Q7cbVt2VAD5PNJ6gahplJiewRy+cMFFKxg3pGqaPlY5Wdo326+4y7WHZf1oPCrgrDHNLDO3tR8Mh6xPTeZQAR7Winxsw2QO6GqJzMKHhDzBy4YBnz7hzsZNgMHkcim4LM6pPqallvAUWEw/4nwrFP6qFl4AT3IR0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7030.jpnprd01.prod.outlook.com
 (2603:1096:604:12b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 05:49:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:49:09 +0000
Message-ID: <87ecq2wkh7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 0/7] RZ/G2L SSI Improvements
In-Reply-To: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 13 Nov 2025 05:49:09 +0000
X-ClientProxiedBy: TYCP286CA0131.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: da758c9a-ae65-48ef-fe3d-08de22785d6c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uWTjGIEn3ufHhPg46cJFQDKnwJVgw37C0R0RWcTNEyscIKU+SU6Q4SuIxaCU?=
 =?us-ascii?Q?hQISQGIKOJWtg/54TFS+/PiITAV4RV3jFujaTj8eNoKowzDqTOCg19fonWW9?=
 =?us-ascii?Q?nP1agbLabRRJrIUF287BeOqsD89KzeHV5m7SfHZxnGfbZs3JpNIVSqYr00Rb?=
 =?us-ascii?Q?a1RvT84CffqXvuhMKqtk4xF07YdYSJuDpMlFTZ4ObAiYX869my3QjD7k9zBG?=
 =?us-ascii?Q?4Jc9U1t52nipqmkZVevwEBNGhyajl2Btv2eZh9K9dJggt7tkT0SY0uc2ddWd?=
 =?us-ascii?Q?5WuwQnEElwMxcVBN3vRxU8YjBjm2ZOYEzoNitTZpGP4HbTc0TxQO7smCq0F2?=
 =?us-ascii?Q?J0F7DYBKu0ljnz4X6gzypbBBRmdm+LwS6OcVUN4LcAeOW5fLYWBPHdanvgoK?=
 =?us-ascii?Q?t6hqJXZly/Hc6pzEyqQIU+WAOZmINmj3l3RF4A5M6O4F9GSKL7QUnKdsoBEl?=
 =?us-ascii?Q?uBQkbGZDKQleE5zsltphSH/+zxjX+jx8KIwFGSZEZDl/BJ06krxY1RNeBpWn?=
 =?us-ascii?Q?7Tlayz1EJAMpl1EN/c9tDfnAJD+Ua+iGiA26H9YWzE+DKOwfKDl03wmFw120?=
 =?us-ascii?Q?kg3CUX+OUI76xtFxxn68mJMiBpanQUVqSgo5WDMUnHfsekoTFLqByBxCnYWy?=
 =?us-ascii?Q?gNF2UWld5k8gAIMKmyAJw2SI5Y3eabiYmQw/cLJrBL50llnBG+ebHVMit4Xo?=
 =?us-ascii?Q?pHh5fjwyJVGcfBdhVdvkdTSp4tVKSQaXueb0xXDKjp4qmGSK0RMD6uY/qyqv?=
 =?us-ascii?Q?Ku6Dl6OLGepuofaEI7/YuY7f3F0ZmXnI9XjtVsUlijRJxwaYepvLe36JPv3e?=
 =?us-ascii?Q?77g5Al1ohc2ZgAqsNk5AoqqD+A2bR9hTCnvsnwhXI62tbMhpruvJLm2/OHhg?=
 =?us-ascii?Q?Vf5NAACfcRs/q0OS01bfx73zskmZU0xUQqT/jSBJe1sLPkK4jf6PkTOxx+lE?=
 =?us-ascii?Q?ePzd2F4Ni/mr2qIB3EilOPN5PUyhxc80q/5GE2eHWH7PCi6TfHopJeh5mj5S?=
 =?us-ascii?Q?Rm09t9nuYyJhVbbM/ohXIxT65JuE62WFmCAKTm/hBaBwKm8y6XGvAsy2GjDb?=
 =?us-ascii?Q?PGPGCI9TvtPtXTX9oogte2k+Edc+WT+c4WK7Ej1p0NARjYeyn53t1A8YvZnN?=
 =?us-ascii?Q?C5d1TSGVCk21xr16ZKo/lYCltVLyYzWY3o9dC2+Ymu+qIOh2IRHS/MSA2Mxa?=
 =?us-ascii?Q?/X15ZY9kz4QgegNUsERRI8td0MYfZEMJz7fI7J8S/iELb9y8TLBOYzVSfxDb?=
 =?us-ascii?Q?gxOoPFDCbWP7ok6V6bYmBBLEjofYd3mhaViVAFCY4ZQ823fqGvKtYgyzcDgq?=
 =?us-ascii?Q?SpZHMZBx5BIaooa/1WoRdzfEiMqWjA+bc5eUoGKhSIxzAGC7I/am1mpAz+wC?=
 =?us-ascii?Q?etjPE14NdPCCy4rmXkhiRHAWbwBexpXdL4LnePOy+Fc0yGKgQvszzWq+oxB3?=
 =?us-ascii?Q?wnTOvHrHdPa8kgmp7JgGYEBvMXEtuwIWgjp5yAsBHerWBM8R1z8cDwyiFksF?=
 =?us-ascii?Q?KxelRehIUBv/Syc6jBwCXyPwo8F5qAhGwA+0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TEyOrYzLQmpnCOoF8u8UvfIHNoJGlxu6pTnQNKhXT16L2EQcOJc8OoTuFUpC?=
 =?us-ascii?Q?f16dEnwBWw6QhHa+XPh5dL6gTkkn+RXZlwuE9Zc2T4/AIvbefFGrjDqoYU+v?=
 =?us-ascii?Q?TCy6at/pEvRws+vhzYLiJvEOPiydPVWTK2VgcMzGiGQDNYcgtrH9EqeX7LAQ?=
 =?us-ascii?Q?gwPCGLpImevou+9nvT2XlO4RIURu8BDrqE4m2cJQuVh4XWDOnR5e6vRs5qzy?=
 =?us-ascii?Q?/6sf7Sp11VhI05jLHzQ5aNEUO7WJqF0yR1Y8LMSS2ECz+cJoyUBHWsTGLwep?=
 =?us-ascii?Q?14vhxR1QsVn8q5cTevSNvwl8G4aL6r3TGuGa8MsNM2wopKhF1kZV7KLpDJ3g?=
 =?us-ascii?Q?BSXVTbejDR8iRhpq5NMU9tD8IwAuwCsqOENMHd+a7TIj0/TDL6ZJOVxofeCr?=
 =?us-ascii?Q?dQrgDe3TYUx/bMoCj+fuu0ze/YGNd0LOemlTfIHWET9ifeCuCvdQnQLdISCJ?=
 =?us-ascii?Q?rgAA59S/IURHS1pDgPjEyslBBVhgAPCFg7540PEeu3rkMgRTD3tTxeUplh3t?=
 =?us-ascii?Q?95nRUW8qLC4J9L8a55PMbi4wbbCYU+N40YhqMft11D3EpigcS6r3DHxY/W5Y?=
 =?us-ascii?Q?CExSpQTjlOwlDR67No6pSVbTfNe490T4IvMwIOL9wiP4ytGBFqwAOO9XRyGa?=
 =?us-ascii?Q?kBywgq6dHtQcXanUVGlQBx/DBn/+jR39Kt4NAhObU/TL9/spPmgvnxR5syxv?=
 =?us-ascii?Q?9Bz+DzTQRS685jfzg3Ig6o/KHSjAifC9yrylMtLnli+hN4Um0/XcthEU9tAD?=
 =?us-ascii?Q?YNLgAmW+pa6jmNMbrF7q+0Tpm/6r9aoU7EtDX9i5xBGrq0Nk+vTxB9YDF3D1?=
 =?us-ascii?Q?QAZ06hfOB1es64glZRQR6QX6gZAba96wj3HGKAF3yNDhIVomwL8X6dh3JhZl?=
 =?us-ascii?Q?gVsPRYxUF1ml9/mO1LiAXohMmWjITO2tlCq77wy0gbuPBefdtBlz3dZXhXLl?=
 =?us-ascii?Q?o1RbAqSdwnxSn77MqprtFWz4KULdEL45vV9HDQb67a9b/en3z/97FGcZ3LIj?=
 =?us-ascii?Q?swdyv/Gzaz/3n0YhJm5sKaHEXmfB+avzOEpayansukKFuLoUdGZjd1EyHk+U?=
 =?us-ascii?Q?OKxS4QQSsd4l8uqf3WWJz0JQSA+xd5YTBrvpklAjwK47W+RYyaweH1RYEYdM?=
 =?us-ascii?Q?BYllYQPjKxDjH9nsXlB0NihtkNbDVTg9br4ejLSG7mEucjdRUCc8kTEq0rHm?=
 =?us-ascii?Q?xvJJSJI6dSiGuFW0UsxzNhaQbfFCD0VlyQAhXKFZOuaS24Pi7l20zq3L+gPI?=
 =?us-ascii?Q?cn4fTQJvDEtxOd2lERH6WaX+LL7wX9Ee6XNvPfAUioSENUAOb9LyFaT4aTIN?=
 =?us-ascii?Q?dlZI97VEqZJxpCt6SMLsUfFUVvPUDyE1g6YrJrRIGEcLM42Ii2BzY/4thzdx?=
 =?us-ascii?Q?onyyevwGfxPyq4QonUQmLufpWMcuScZEdAITDTGMKKJuosK1pqNXRkmjDQ7h?=
 =?us-ascii?Q?SGzbCcI+8TgZcXU8hx6AnoP8CsxMK01Q6wS+5/wd9/BTZhx6Sfww+xJ2YGaF?=
 =?us-ascii?Q?ic4LcG3zKQ32i/GAuC92C6oIw89rimM0krCzqmtIsEwD4QPfHA16Kq4rgdAn?=
 =?us-ascii?Q?39nTBZoUW5fNJjiV59g7LI2SwO+6YJjMYR6Qp/DIBNzV7hJrcaOiaxap4/5K?=
 =?us-ascii?Q?CTWdkdfBkpNxijOXV6K4sd8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da758c9a-ae65-48ef-fe3d-08de22785d6c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 05:49:09.3890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hf+TOH9gBUpoalAXu70F+MNdZbmf9Or+Q8cBCq1WHZPl5YFlbXc/vpOHRlIQh/VVsrovL43I9re+60szVasZ33zkYfmOygVl3/sxb6mUnZc6hGxkHi5w76VvWnepaS4L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7030


Hi Biju

> The first patch in this series fixes audio channel swap issue because of
> half duplex to full duplex switching during the streaming that involves
> FIFO reset which drops the word leading to audio channel swap issue. The
> second patch fixes sample width value in the hw_params_cache::sample_width
> Apart from this, support 24 and 32 bit sample format width.

I think splitting patch (for fixes patch-set, for new feature patch-set)
is easy to handle for Mark ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

