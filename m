Return-Path: <linux-renesas-soc+bounces-15533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BD6A7F056
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 00:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEBE83AEB34
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 22:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32740224AF0;
	Mon,  7 Apr 2025 22:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FNW22lPG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E9822424C;
	Mon,  7 Apr 2025 22:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744065089; cv=fail; b=HwhY6POFb2FSq39zDLNmxS2QPVmqM4M3BWeJEqJuIsY/vk097LYmwk40hqIk4Jd0fRhrMfhP6Z5FG/OJRLUVFBU8xd4FJIiOu3NIa/a0Np97gqB24gc4fDyevs0W94YZDZ5ev+rqb/LnjdwWEGxX/UjpvhQrDHjKRlYVNCJhRqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744065089; c=relaxed/simple;
	bh=qV2gZc1Sq1g0y3tLPHHzFld5m0ROtWffKNhGehlUFvE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fBOyrzDIrzxwTs06deNN5z3O8CTDVY4ISks+aRcTkw4+QaLFOxL1m5piYfFI6V2EWA0jwsIJ160YZRDY1ajjrAUFKEMFwVTLFSRg8YbeFlU489esoSEiRs6tG4FKd7QH/k02BaQe67I77llR62Zd8o6IAVh2Flu/ujyyKQNU5uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FNW22lPG; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpQg9UYCLr5IKMTp1DNiLxvvyuZvDSUSHp3e5Dzk3BjbuRJGj/3KvDySRb35I9TkJshPGJMtdsNUVCUIP5T7nx/9hCMQ5XS7/CGaTL4zZOJK7B13Oho5t5zb4sAexdW+EjXCzvxPC3OlpU78h3CBS1gPW4maVZQL/h2NnQPqSqkOAMY0FNPNBL4170/aEV25xDsWewpdGNse5wLGfEs83SQNcPXhOJ4y/Cmr8jx76P+UIyRtb17jNblM0hG/K5SzQ58uczxcL2eCw3IINW1gJNWaFHsQnVcd0DfSHFH2CJl+uzKYN0VwIofP9ev/JrLFUavQjwwRG9+a6G76XwKOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjiPNnGVQ/Vpeems9LGMYUkjwKVlmOCH2TqXR+ShO/o=;
 b=QxC/OB5UjzKd9UxPINXp23VvxA5lOgwGqq7NBmbGZxx33z440WzLh49pEQf7xQe5ow+46K+oiu5+jhg2Ktx1+mLJOI3L80yHQRdxe5mbNJNkf8jTL3dHraD6SxJ9Pqmtok74+jXpT7jNUCPRefuWT8pdpWPBLyY+XnOa/z5iFyeY7GqPtcgJFf4doVXnu/mMvYzIt8V95tHjAl9XQ6DznUku58oG+ExwVqxUNDTaCZ1cmtgn+DoaDl6hNWvgWU6atPgsbUmgYrs1BQRlIx+ENC+3U8GvNvfkYc8cRZ4pRQKOkn3SboTE2qAe0shfgEN8Y6hHIjNmToHdBLf7lRgPTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjiPNnGVQ/Vpeems9LGMYUkjwKVlmOCH2TqXR+ShO/o=;
 b=FNW22lPGDGTnyAwBdM06TjPK7y90aLNnrdP9qxknH2rSc3Hb+70+YI+8aZhGhCqf2DjMnubib3J8gyZEdihRCLz0X88TI3ExNftLQeXMRK0woWGxg9MyXZtT9LTLGodvCzMYqElaXUxGmIlFZQKmgpCKmZPb40xhjum+NRnJF8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8553.jpnprd01.prod.outlook.com
 (2603:1096:604:198::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 22:31:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 22:31:20 +0000
Message-ID: <87bjt7ob7r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: hdmi-codec: dump ELD through procfs
In-Reply-To: <CAMuHMdWjc1rE54KZ39XmVbjvGa4rYeaSjAMgMQfs6gFKpRbhZg@mail.gmail.com>
References: <20250124-alsa-hdmi-codec-eld-v1-0-bad045cfaeac@linaro.org>
	<20250124-alsa-hdmi-codec-eld-v1-2-bad045cfaeac@linaro.org>
	<CAMuHMdWjc1rE54KZ39XmVbjvGa4rYeaSjAMgMQfs6gFKpRbhZg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 7 Apr 2025 22:31:20 +0000
X-ClientProxiedBy: TYCP286CA0368.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: afc90d14-9a01-4212-6915-08dd7623eb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M7LF1JcW1KK1YNTlLx+M7z0xEh0u5gp3Wmyyagoje1T2F3+nTDDBr/8sJGDz?=
 =?us-ascii?Q?+pqK1AQhMjAyPZfzNXCDKutHng6UUfqUSvXIr78Fn4ed+LTW/V+aZOaZKuiz?=
 =?us-ascii?Q?iBYE5dFrzP6bu6vco4jzAEgapdh2WmJOq77p2P2cjibRGiMZ7yw8e0AvmhHI?=
 =?us-ascii?Q?cz8fuOLw6rdWHcGM9ib8C50QQbNCUj9r0mB9tMSWlA4C89GsKevOaeoousrx?=
 =?us-ascii?Q?JVDI4HQs/hosvIKlQ75KCtEEppemZv16aG0m5YUsdoCawa9xV0KK5oG2Y9hT?=
 =?us-ascii?Q?jjDXwsdH5XvjcpudcVtHpeRHhQERuDoea2ptNsDQbfZ0G5zR/Nh6rnMqlGmw?=
 =?us-ascii?Q?KEA7XtoBBJK/RfR/1byccEFtyVYS2gRjstn1S0kQ4noCKeyY9fR7ODI6s4kX?=
 =?us-ascii?Q?fBuURjzZWTehq4hY0QgvK0JhgbJlOo6qXvWc5gsuboSSmZlX2W2wBCpJ7wAG?=
 =?us-ascii?Q?x+smbzM1bnTkw6K0faILS2NvxHL/wDerFqbVcBzPVVvPPOKXOHlXBIrSld1Q?=
 =?us-ascii?Q?7KkJ6L9z0CYfrsplo4kPlTrK1/OxEcThqORFto7mZitghcZ4hYUehYMGcL0c?=
 =?us-ascii?Q?bO6KZoftWK+5KhUJRdlWg6i/axuxlii3znUyXOdKJnb++7nL5+X4qCUItkW2?=
 =?us-ascii?Q?5SRwFXji2O2mSasUcx6eWCJegg1C8sIB/BwaWv0+MhddwlOL1bWEuPRGq/v6?=
 =?us-ascii?Q?sOmqId6DKENFjDAMbtwoIVKuNz6P4NGApGR6QLogwXt8TGHOQTQ6nprIdizi?=
 =?us-ascii?Q?zyjJPF2CRgxtiAnzG0eAO48dyYpllq8iV2LO/c3JGLVXDzSUeUnVNAlcuyxz?=
 =?us-ascii?Q?T6M/Imr33jV6xwsgo0P7BTO6aEehojd/YvORU9NeejLZfpUD4QVUc+ZTVX1V?=
 =?us-ascii?Q?/tXdU851R9sEArVOBU31XZOSWscDCcdMbhSN3R8DHPsg3uu36WDv3Hn8SDvI?=
 =?us-ascii?Q?0T7oZK0v2ymzi6UwbAO99ljryPK53gjRb4NWvwCLpxEFKiBZEwbvg6MH3Zx0?=
 =?us-ascii?Q?o0FXdQ/WSR+WSGyr5kmJr+th2POFiB/jg5QMdscCGMk2Phb2hMYDSHyS9X0s?=
 =?us-ascii?Q?wGvkhUz2xvvrfTuP9gypO6PEn8Tm0WFinusBqCUA/GmD8vMEUrl3e2Gh7aSC?=
 =?us-ascii?Q?00OKjIW9Bw8KbWi70+xDTXx5Z9bfUk5zNV3hK18SS1/ONWz2bPw2Ts9FOMZW?=
 =?us-ascii?Q?F8n5fPpKPyuT2ZHWpW3UGclqs08UNtq4nE3a0m5sLwl9tbDoZDC15P4RzZkX?=
 =?us-ascii?Q?Cs5oySS2cglcfmPIkbYJTKzhQeSY/cABCLcentDhUy504T6Rcd51EJMBQ9Pv?=
 =?us-ascii?Q?HOxj9eTWXJXxnxWzitK5So7YG1s1AO5E5Qh8yQRT844A+Z6c1rHkLHqUPBht?=
 =?us-ascii?Q?38MjEX5c6ZHcvzV8l+1EpabqbGf0cmksX6/5szoXW/wU8+2WdNuTJ9cW3CKv?=
 =?us-ascii?Q?T48jIOfipNdHCZH7d7sqhfWsI2atvapG77a4MMxPwH2QUxIUo/lpyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E6rWixSssslJfMWa7qEJ8LvLD7WaJAj2+pqvJ8GzCdcfQkBMxAKQOoVot4iz?=
 =?us-ascii?Q?sibZbNZ+FWF544KqWkxBhrgIeo4eESt5ZWf8UFxQLZiPqa9YuZAgSuaAmjnp?=
 =?us-ascii?Q?+E+6N/eZ3KKy6ZKgAmtWJVY5gtRuQsw7qUphmgbkwuIvT3FcWp5gnTiYekmh?=
 =?us-ascii?Q?HciTbYNFcdVs9KSiJQ6ffWHMe1y6gAbHrTiO/aTsvc8vWknPntuW0+tYWwcb?=
 =?us-ascii?Q?IpwsG3c39G4vkmL4pXo9zbts3AuRqlCxoXDe3OOik+m7dDGr66roAjqarRxg?=
 =?us-ascii?Q?Q9pghznLAtn3VJIDBrQ+rtYiiLHCO7BcSOynXakEitUhJhyUVc3bPp57Ne3o?=
 =?us-ascii?Q?3IPrF6k8BAvw1nBYW1rC/or+4DVgy7tcdmij54KwLC/8KoxghrdsFIV0YATy?=
 =?us-ascii?Q?FNJZWHjvpv5q6qLaXpTFQ02rTEmKORBzUv/aGtG/2WfnPILcuKpIKZi/0TNW?=
 =?us-ascii?Q?dikou5p1N1dEnxifJsrS/QNucDJiuON1EmP8IvEYCsVU8zBRep/W7rX3DNi2?=
 =?us-ascii?Q?SUpR6Ww4UKUj62NWYmeAQDexPG0+JwXS0qQYciZN41mwpZqT7kk54CK2lXlp?=
 =?us-ascii?Q?LTOhYgfB3QbvbW6wOwMwr4jiSXfo3GNiGFI3YfVtCYwnaGyI8NWS1BDdkEah?=
 =?us-ascii?Q?uZDWWRUo567lve+hT9Ua6vFXosnh19ecchD9m+cNzm9GFY/b5qoVGYq00BHD?=
 =?us-ascii?Q?lBV5hLHG/ZIi8JoRaYK7tqy+Uyga6CZRN88wrNFNhlzuFJNPYCI68wyrMmOY?=
 =?us-ascii?Q?Wz67maICgeSiqtjirLBqEuDc1ZxoUk64uIrHx5z4lqJSsQYNwPi103CAFXGU?=
 =?us-ascii?Q?qVe4x9nSPwUa/lUJcPHjokPJDpQP35dpfG6Uy7PY4w/dRjm7tASX6nthyAxZ?=
 =?us-ascii?Q?+U048SowhOjzmnq3Qs/1nE+evk4sOGFSufBeGjIUkAy2wNt/C01wXts44ewU?=
 =?us-ascii?Q?wqeYr3xluniCjSBAKHsfWIBzY4Hn+vPifLM4/wu1Uv/rSW0F0kTyHIIhW4Yk?=
 =?us-ascii?Q?C/mnRrOIqdP5b5KpYiGs7+kr9IBPfB+aXLkT5baWfWDOePG8SI9KrikZR4hN?=
 =?us-ascii?Q?BMWqkbQia0lKW6K/OndsTzsDJwzXTpdadvkS7fHos7i7JcyDXfWofx8BxNSl?=
 =?us-ascii?Q?8kpMESxry704K6814JJ2aaw5582a/5CBE4eEFB21941ch5uYGmejnN86btT/?=
 =?us-ascii?Q?siO97tefJx+kKwPG4JjfMgtyg4xxSZhcrkD6JjYqvh5FrTEo8qPTUpLxjDrZ?=
 =?us-ascii?Q?mfwBYPQGvClfvsKnOs+O/+umG8YjXqLi1pGfm3NHL6/p3QNgxAwFjcGDv4BE?=
 =?us-ascii?Q?U52Pdb1jL2W7nCh42ENfwvnQJvPnA7p8YJbwugt5cSdw0dssLN/JxPX+/b/j?=
 =?us-ascii?Q?deGKVqwfQ6QhqddicSNAgf/1nKuNMtHJPnsFaMi1WivXbZGHMDro/2tubtas?=
 =?us-ascii?Q?ApvWwmRU/PnGGS6+D/q2E67bhQoApPcvQqoK5vkD0W00xiO05Wpj7oWb3Kji?=
 =?us-ascii?Q?iP2juo0ls4fbISaIFrQN14zwfc+JqRK7KC1ai1XSG6b/H15HmSFxuKhLTfby?=
 =?us-ascii?Q?OyxuqiNMAcfq0XA8KinrnJzlzh/j0K8azXYf+JuJbXHX3jk2SOi5ONUFJRnK?=
 =?us-ascii?Q?XdCgS9WoWChnVMTVsmAWfcw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc90d14-9a01-4212-6915-08dd7623eb88
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 22:31:20.4938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRIIkoEDxr4kwBKpX64j7Jn8yyI60EiD16nnCr2NXj0QAFBawFTtyxEqr907UGePva54bZ6NxMS05Ve6i7Dw9RFwCxC+4yQpn0+xQcluOW2tgFdtMMuzo3UHDajkYi0z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8553


Hi Geert

Thank you for your report

> > Use freshly added API and add eld#n files to procfs for the ASoC cards
> > utilizing HDMI codec. This simplifies debugging of the possible ASoC /
> > HDMI / DisplayPort audio issues.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Thanks for your patch, which is now commit 0ecd24a6d8b251eb ("ASoC:
> hdmi-codec: dump ELD through procfs") in v6.15-rc1.

Our team have noticed this issue and posted the patch.
But it seems it is not yet applied.

I will post it again.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

