Return-Path: <linux-renesas-soc+bounces-19562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC4AB07B74
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 18:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 257B7A405B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 16:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAAAA2F5485;
	Wed, 16 Jul 2025 16:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f7xZwQPi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16522F5493;
	Wed, 16 Jul 2025 16:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752684366; cv=fail; b=SYnqN6xk6aRlA+sVISOc634SsVeXuMPCQorpcnF3Y9gLCes/WynCUeZgc3vjrAzbAgyRFPDRDCI6cGOakgRV4Us2JUQesUaF/DJ3sJrkBjhP3VwmLcyofrhvZA9kHKp9SGKYHtKELlKmTk/aNGnmlB/rpdgUcrtnf2SkoO/jl70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752684366; c=relaxed/simple;
	bh=KFpUsI77zFMcrZ6am06WagWEYa4drOM27ApiPDl6Hes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SQAMu5XGxk+x9xNUipAbByI5NFOMd7o5YNm/RhHHZIZf1GWQrRc0lZS5W+9YbCwBTMxbROeQHyZrXQyEW+hU94Dxub9qHzGtpEmr4FNuHvFKKwP03Tiv1OOotzSobY+ZLaxRZY7mS/TGpCnqde+pZbXFf2yDD3dQ3WuCfBB8oBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f7xZwQPi; arc=fail smtp.client-ip=52.101.84.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyg3FqxvIWWlrYvZkgRJSJIsr9++8VNOqe1VT8TZBSe/GWtj2g+dP66jPbL4AyR7NZweprjffrQf6dbUX0jcDTwM38OdpDsKJulXUmG8Erq0UBADvWa2nJ5Zo4wHU06CzHF5mYw+bwqho1QV3ya1CPq3CQB4saub21rg7suyifw3jNEGo3zlun7XJVqD9u2q/gj1QOW2ED67o9en7gs2Bm9MTCHK+Cl/hY+K3VV7G5Y+S80u/6g2EveoFrojum20Bei8C9j97r3qNAiRoPCe9HWXWKIcB+YSmmYq4rmLZxfDOHWdmZ/A+9sMkjtNnH7NS8IFZ9ANlv0E62FnKPLBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VC6DfTB9viT3OwqPevZIwJGk3H+IkoO2TJK3dyxJtI=;
 b=jD9JfMEfnezNR/VQSVUo43xh8b+DOFDiJvTMC/l/5CyNQVYgzb2u2BNJDVE+31F8qSIDvRAj+UcmO62yUZTTmmKNgrcbu5mAd4Uo6wYYaAS/FAW0NmxKGp32c2nbHsU4YeEs7igNNpCF2S1gh1m0qQjocGLqbCRy43y/04Eiz7/siWisqA/+MdAymRCg/lbyv4+3X+3mcUN+cBBt6JLzH36na1tuWCzwRj7n8Yhjo/UhOu5xvMPczTLnxsQTebXvG+y0SEPqzzokWnwSC86xgjHdejc3IgB5jGMoU5tn523z8GXuuFviWvD57isMrZfQYFmC/vma2fyBRDW28Rg7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VC6DfTB9viT3OwqPevZIwJGk3H+IkoO2TJK3dyxJtI=;
 b=f7xZwQPiMhxK2HfSaOkkIdiOx9PD0IZjYrkBKBb82dL3DQl6WMZRqCOHQTEsWKG0JiHznylhUySWElP5rX+3us1JmVrV1KpAlIuoZZKvgsuthxO1VtFOm7NTpC3uPw6pIEnuoieEfqR7aFbhp0H4jWBiu/8JGzYPPWdoXRnYOrdaOqLWbztfioVc/AaNE/0CQTki2RBkbVFcEAecVHO8UAEKJQWvTc+5jw4m50lFzZbvk18LiT9FFqfWCHVJ2UH8yjHRE/buBBrjrGscDTqJoOl5jwOpMWxKNqEQoVvzDf33o0Gz6xKjW0nR4+AAeofdaU3dvsKrT2rUW+vnk0JDXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9636.eurprd04.prod.outlook.com (2603:10a6:10:320::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 16:45:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 16:45:57 +0000
Date: Wed, 16 Jul 2025 12:45:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: add driver for Renesas I3C controller
Message-ID: <aHfXPkvEZutgWyZ+@lizhi-Precision-Tower-5810>
References: <20250714091211.20497-1-wsa+renesas@sang-engineering.com>
 <20250714091211.20497-3-wsa+renesas@sang-engineering.com>
 <aHZuAIP5IBoulm+9@lizhi-Precision-Tower-5810>
 <aHeStuQ4ymIlyNE4@shikoro>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHeStuQ4ymIlyNE4@shikoro>
X-ClientProxiedBy: AM0PR02CA0109.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: 7594694a-da8c-4fa6-027a-08ddc4883c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v0XfWV9k9jWRkIjVK4oP1GP1TY7fcbm+blUJPXJI4+ivwKwAIeIhbvlfbHz/?=
 =?us-ascii?Q?lzHlPeMM9vxQK8Q2z+PZnG/yeS7ZsAORsdxzG8DAl8sCutoLZtjxjv4Dd18x?=
 =?us-ascii?Q?lvc1YkmUn5p0ZiRh4B1qWYDflq1fjc10nQnWHNCK/x4CCXet2asGBSHsxPdX?=
 =?us-ascii?Q?qKttUyk+lNSN1fru+mnRcZ0gZ+m8CvovXO9heYZEmcbEUrFOq+6s+/Q6KHtW?=
 =?us-ascii?Q?24Pk30rtqMO40O3/s06zRnxaA+of6vtwQdySOsYZA3nlbgSU4bpa2iaycx3D?=
 =?us-ascii?Q?HgIxW9a/apMeA1+cWBksrQFfIWvv1mSp4r4ytvy1xANShPKw8WxWGlLjcKa3?=
 =?us-ascii?Q?TZdMr7NkXN67Sgb5kaQppbDfX7aonH5OEMFm31TtGcj4B8Wqe7OTAlx8Lh2z?=
 =?us-ascii?Q?lBEzYdbHHtVzesypjFZZOtPYoBRQmlkpaSwV5hvCG/39WzgPhPktiO99cdIA?=
 =?us-ascii?Q?fo4fYkCdOp8GQfTFYKxVq1rLyu1EjOaepSarWHOWfpHsuc7fYGxu31Tg1VK3?=
 =?us-ascii?Q?pOZKsB1muusXYjiZW0+FpriQsc3QbaWR4umaUP6m2Z1xxe4mCuT7aTjC3zQ1?=
 =?us-ascii?Q?xVmtomI31vRDDgX3CGEV4Ewttrw97GUHiC3RH2ykFPKcweTMLl/q3SYbNbEG?=
 =?us-ascii?Q?44Nfq1ypWK71bJ97TuvOJbv7DDaLow4QzcIjULFnlU26Bilq6RlMDkGdrNrk?=
 =?us-ascii?Q?3STOyavHcKSgcslPvjJe+Jgack2aMZQqJirjdbjmyhMOqLAS0txuuokiPTZL?=
 =?us-ascii?Q?5MKe85ZlvKT2B5MXfhG4MRbLshA9k9JV7jp3XdMxeURBy4Aufxz2mHCzDkqR?=
 =?us-ascii?Q?af9cb7I1LjFoq4zuYonttfETsnQmnidr5jdgaoi52UCRCtx0u6lkQAmtZEsJ?=
 =?us-ascii?Q?+IrG995MwM2HVC3fE6PtxXdhGmNDRSD9324UGp+6BxwTGO86c4kJGHnn4cpO?=
 =?us-ascii?Q?h3ofynE7M/Dr4mnc3wOF/op5EL3LCVBrfFB40y16BztdXvUMV6AhRUFtTGd+?=
 =?us-ascii?Q?rCW/OqiXy5yLt9qNF/chTCPdmed4GaE7+KWaRRsTC/ZSGp4oxBmuJ7ZLpF+G?=
 =?us-ascii?Q?Qd+1xCTj8J0jBAn7ENyc2rQR9GKnpf5YbJ2bzHZrRVbyJpfjg7n71uwCLeLg?=
 =?us-ascii?Q?JpbvcUWkImJLYQKeOCQJ1WV3pX1lycDP9X0d3Ujh0TuFX/Ih1kawP4uULlhK?=
 =?us-ascii?Q?C8cc82XexgZfjZU7NcuZ0odbl/rDxIxf2NihrDrHlmsQH8ppbxED2m3o2KH8?=
 =?us-ascii?Q?yUqhJLhLeL3M7dWspLDLIRAutc19tweq5SMFxmB0K8EdiD3ru5eGsZWhfRxJ?=
 =?us-ascii?Q?TxnG6P4U+FAG76HC4QlysjX8s1kcBnZVApJXtUNLf/eqX2adj4smgxczL0ej?=
 =?us-ascii?Q?YMLSaDDa1A98UYEUdQUegTDQHNA/P66j7nN74FhegiTJHLomxhwdvmWwASGq?=
 =?us-ascii?Q?HMzZqxLO+pcm4Z49TA7gZhW1oCA6V0Z3tfr5gbf4e40nH0oXCyRApQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z3Xwqr84Qn7GDOzVZSuCFbkKgUYic+gtxR5sgffxcg7gCW9SR7heJJAl7oQc?=
 =?us-ascii?Q?ll3hEZG0Z44+8DVzvEFS21We/6G7aXFJgsLp8OJ5LKEcDWQnoiE82I6ytBwc?=
 =?us-ascii?Q?EPvlcmfz5LxdVMi7guG20qCTXo9fIJbv5Q7bytzmDfOoK+ZceHrzwwVRAOcr?=
 =?us-ascii?Q?3fA6yYJOBov3lMrimIJyXRG9leFcoIqCPrFoAssknsiQ1fRD2pugLBR7ZKdF?=
 =?us-ascii?Q?msK/Qir+6ie0ZzRXqCoxv0CMwKYEIcTy/uiIpdK2yp0ddyoXizttT0VuuTdN?=
 =?us-ascii?Q?4XUOpreYh57wjm1X6Ye1XMqBVvumWwBO/nLhJ7lDUwG1G9q4s3Syq6JcEP6/?=
 =?us-ascii?Q?Qhb8AX/aaJEpnmL+uoO0dJxJAyiPpOhLjeAIrjUg8ttjuOUE1b7OpLMOg5mO?=
 =?us-ascii?Q?MAPdOM3ahWaaUWPJWv252/Q1wH3SaCBosURNZHmQAjYerB8+y3rTR/Jfo5Xj?=
 =?us-ascii?Q?4hhlzAl4y6BTpQkmrW+5r2jzoxdaTZDP37xOwr044pGuAMybSOCma/pA2CUI?=
 =?us-ascii?Q?wrDLWGsluYWq6va3mjI2OiHfIhygQx/hG8bafBtpnZkRW4a8Pod28fcE7F4Y?=
 =?us-ascii?Q?nUekm7QesU0601zWmGxvwivRgqIgftsLShBxg31rfdx+5AoQmAvBfXopOIl/?=
 =?us-ascii?Q?Dux/rIx0vFOFL27y7UVJCz0A6zk9tiWbXq+snLU6uSQEgmMBNsZXZ9MKGHXT?=
 =?us-ascii?Q?B27xl/Qp0pvimpYpDBQXu7B4XYPxUX3JWElJ15sy7ZiU4mvFbn28m0yKB94r?=
 =?us-ascii?Q?AEee/SrIsKHol/qJaQauXlTO+0QqMxh0w9K/fyGkbnuhCELBNu0kq8qKqd37?=
 =?us-ascii?Q?TnnrzUXx5Spfpgn02eQu/zRQqkVUQ+s0bBe5bIeEhEBFM+WCRENgRSLUhgEw?=
 =?us-ascii?Q?t6E/rk94KN43ItT1VhdAmokLI2vESlAEIUrHAx4cH8wCq858gUO1s/NZI6kC?=
 =?us-ascii?Q?Th9Zl0vEErDf5mGzc0f3vvS7MAWD0i0iL/Tu+0AMfSuOn+UD+YUvyTkth4DS?=
 =?us-ascii?Q?c/QMUu9uwp6yjk7K6fKsCWzHeuxanY6osNSj4Zxm59ayO+6BKg6qC842YUHz?=
 =?us-ascii?Q?u+E9N3enx4iZ9Qf3utHaisVW2hGdPKBT+siBOdkVu72ZfF7ihFX+yu6TG71z?=
 =?us-ascii?Q?WErboMM0y9vGdEx9Tc6GAQPPrrFvkm3RheRUGgKLZXHbKuDvSgCCZXXC+fFc?=
 =?us-ascii?Q?bOXJ3zzfitPi0Bms33XTqc1M4kaeAeuzwTrjjBrTnuZM9WklU3hZwSfQ3pi3?=
 =?us-ascii?Q?+7/cgL870VuFZgwykM6kFPA5GIL/6wZK8F/f7DcOtJxZsrsT2RV8TmFJ3IYE?=
 =?us-ascii?Q?oKh6eowULJ28BjpPDu0QDP0aJheeEumvqlNSedlwgcXU8tvEWKQItDWw5xEO?=
 =?us-ascii?Q?/IchhNogvX+rwPDWZebFucqQCWfZ2BpVodKShT3ckBfP0f06DQkCBsAY8TiC?=
 =?us-ascii?Q?afGh+JMgvrqB1GdE52kSzo6C/cnhWTIEq2Eji1xx+GxT4n56zAgRkl6jIkH9?=
 =?us-ascii?Q?AGFahck73b1L1gdAhDIfdNmb2Lj5DUYNmKbrHea+gSeZ5ujC+2gjd66g0XA5?=
 =?us-ascii?Q?2tqacEat544QXPtDkH4ywqP7e1zftYY2eerENQiF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7594694a-da8c-4fa6-027a-08ddc4883c92
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 16:45:57.0134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TVdwUra8tt4+E+OXJVozebEso9iw7oFjSzUQjpBpQC5Q2AIwmCYxMU9mlIuUF4vZMYTijWUqh5pxmR3uRyiZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9636

On Wed, Jul 16, 2025 at 01:53:26PM +0200, Wolfram Sang wrote:
> Hi Frank,
>
> thank you for the review!
>
> > Suggest commit message:
> >
> > i3c: master: Add basic driver for Renesas RZ/G3S and G3E SoCs
> >
> > Add a basic I3C master driver for the I3C controller found in Renesas
> > RZ/G3S and G3E SoCs. Support I3C pure busses (tested with two targets) and
> > mixed busses (two I3C devices plus various I2C targets). DAA and
> > communication with temperature sensors worked reliably at various speeds
> >
> > Missing features such as IBI, HotJoin, and target mode will be added
> > incrementally.
>
> Ok, I wil use this message. Thanks for providing it.
>
> > > +F:	drivers/i3c/master/renesas-i3c.c
> >
> > Add i3c mail list?
>
> It is inherited from the I3C subsystem entry.
>
> > > +#define STDBR			0x74
> > > +#define  STDBR_SBRLO(cond, x)	FIELD_PREP(GENMASK(7, 0), (x) >> (cond))
> > > +#define  STDBR_SBRHO(cond, x)	FIELD_PREP(GENMASK(15, 8), (x) >> (cond))
> >
> > I think pass down od_low_ticks instead of cond will be easy to understand.
> >
> > STDBR_SBRLO(l, x) FIELD_PREP(GENMASK(7, 0), (x) >> ((l) > 0xFF > 1: 0)
>
> Well, I think the fact that you got it wrong is indicating that it is
> not so easy to understand :) It should be:
>
> STDBR_SBRLO(l, x) FIELD_PREP(GENMASK(7, 0), (x) >> ((l) > 0xFF ? 1: 0)
>
> I also think it won't gain us much. We still need the 'double_SBR'
> variable to set a specific bit at the same time we use the macro.
> Unless you want a dedicated macro for STDBR_DSBRPO as well.
>
> > But still strange,  l > 0xFF, you just shift right just 1 bits.
>
> Yes.
>
> > what's happen if l is 0x3ff.
>
> The driver bails out:
>
> +	if ((od_low_ticks / 2) > 0xFF || pp_low_ticks > 0x3F) {
> +		dev_err(&m->dev, "invalid speed (i2c-scl = %lu Hz, i3c-scl = %lu Hz). Too slow.\n",
> +			(unsigned long)bus->scl_rate.i2c, (unsigned long)bus->scl_rate.i3c);
> +		ret = -EINVAL;
> +		return ret;
> +	}
>
> Oh, the last two lines can be merged into one...

Okay, it is not big detail.

>
> >
> > > +#define  STDBR_SBRLP(x)		FIELD_PREP(GENMASK(21, 16), x)
> > > +#define  STDBR_SBRHP(x)		FIELD_PREP(GENMASK(29, 24), x)
> > > +#define  STDBR_DSBRPO		BIT(31)
> > > +
> > > +#define EXTBR			0x78
> > > +#define  EXTBR_EBRLO(x)		FIELD_PREP(GENMASK(7, 0), x)
> > > +#define  EXTBR_EBRHO(x)		FIELD_PREP(GENMASK(15, 8), x)
> > > +#define  EXTBR_EBRLP(x)		FIELD_PREP(GENMASK(21, 16), x)
> > > +#define  EXTBR_EBRHP(x)		FIELD_PREP(GENMASK(29, 24), x)
> >
> > did this pass check_patch.sh? I remember need (x)
>
> Yes, it passed.
>
> > maybe run check_patch.sh --strict
>
> I used --strict. Does it complain on your side?
>
> > > +static void i3c_reg_update_bit(void __iomem *base, u32 reg,
> > > +			       u32 mask, u32 val)
> > > +{
> > > +	i3c_reg_update(base + reg, mask, val);
> > > +}
> >
> > It is similor to regmap. If you use mmios' regmap, needn't above help
> > functions.
>
> Is this a suggestion or a requirement? I'd like to keep it this way.
>

Mark brown provide similar feedback at the other code review because only
4 line at probe function needed to avoid duplicate simular function every
where.

for example:

static const struct regmap_config regmap_config = {
			.reg_bits = 32,
			.val_bits = 32,
			.reg_stride = 4,
		};

imx_pcie->iomuxc_gpr = devm_regmap_init_mmio(dev, off, &regmap_config);

If alex think that is okay, I am fine. I just think not neccesary to
duplicate such codes in your driver.

Frank
> ...
>
> > > +static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
> > > +					struct i2c_msg *i2c_xfers,
> > > +					int i2c_nxfers)
> > > +{
> > > +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> > > +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> > > +	struct renesas_i3c_xfer *xfer;
> > > +	struct renesas_i3c_cmd *cmd;
> > > +	u8 start_bit = CNDCTL_STCND;
> > > +	int ret, i;
> > > +
> > > +	if (!i2c_nxfers)
> > > +		return 0;
> > > +
> > > +	renesas_i3c_bus_enable(m, false);
> > > +
> > > +	xfer = renesas_i3c_alloc_xfer(i3c, 1);
> > > +	if (!xfer)
> > > +		return -ENOMEM;
> > > +
> > > +	init_completion(&xfer->comp);
> > > +	xfer->is_i2c_xfer = true;
> > > +	cmd = xfer->cmds;
> > > +
> > > +	if (!(i3c_reg_read(i3c->regs, BCST) & BCST_BFREF)) {
> > > +		cmd->err = -EBUSY;
> > > +		goto out;
> > > +	}
> > > +
> > > +	i3c_reg_write(i3c->regs, BST, 0);
> > > +
> > > +	renesas_i3c_enqueue_xfer(i3c, xfer);
> >
> > You can use refer mutex GUARD define to pair renesas_i3c_enqueue_xfer()
> > and renesas_i3c_dequeue_xfer().
>
> Well, looking again, I won't need this. There is no 'goto out' after
> enqueueing. So, the label is wrongly placed. Might be an argument to
> remove it...
>
> >
> > > +
> > > +	for (i = 0; i < i2c_nxfers; i++) {
> > > +		cmd->i2c_bytes_left = I2C_INIT_MSG;
> > > +		cmd->i2c_buf = i2c_xfers[i].buf;
> > > +		cmd->msg = &i2c_xfers[i];
> > > +		cmd->i2c_is_last = (i == i2c_nxfers - 1);
> > > +
> > > +		i3c_reg_set_bit(i3c->regs, BIE, BIE_NACKDIE);
> > > +		i3c_reg_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> > > +		i3c_reg_set_bit(i3c->regs, BIE, BIE_STCNDDIE);
> > > +
> > > +		/* Issue Start condition */
> > > +		i3c_reg_set_bit(i3c->regs, CNDCTL, start_bit);
> > > +
> > > +		i3c_reg_set_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
> > > +
> > > +		wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
> > > +
> > > +		if (cmd->err)
> > > +			break;
> > > +
> > > +		start_bit = CNDCTL_SRCND;
> > > +	}
> > > +out:
> > > +	renesas_i3c_dequeue_xfer(i3c, xfer);
> > > +	ret = cmd->err;
> > > +	kfree(xfer);
> >
> > struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
>
> ... by doing this.
>
> > > +		/* Clear the Transmit Buffer Empty status flag. */
> > > +		i3c_reg_clear_bit(i3c->regs, BST, BST_TENDF);
> >
> > Are you sure you can clear FIFO empty status? Generally it is read only.
>
> Yes. The datasheet says so. If you want to double check, page 1715 of
> the document which link I provided last time.
>
> Thanks for the input, I will work on this now...
>
>    Wolfram
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

