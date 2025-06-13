Return-Path: <linux-renesas-soc+bounces-18296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA816AD8FD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 16:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EF3E17DCFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 14:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9C3195811;
	Fri, 13 Jun 2025 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K2i8K6Xc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010059.outbound.protection.outlook.com [52.101.84.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB5D19995E;
	Fri, 13 Jun 2025 14:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825725; cv=fail; b=FXF5FnxTKd2STqE+6KSDqWoBd35uNvqf+XMGjZ6iTKbe9aQPWdOYMyLPneD/fTT0Q25ZJUYHAjNTgPlJ9mtFIdRRTf7X+p5bohaXAZzObWzhCUQxIWdyB70wRbLdD/eyaPAHLjY8qq+5S3tT9Y45mkZ56TVSM0m/i8JTssR6b0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825725; c=relaxed/simple;
	bh=22+jfOK1anPNKsMXq/xz2RZcHPHwSJqr384yBtpMOOY=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pzu1VrpjdCsMrapa3S/mD3gTbW71iF8GgeDAERtgC27jm9UFYpoSRWsnyddwTtp+97GGU8cqNSErrDCa2X8T0bUkxgLcSKIFiCozXal6ryVQSHU87fSJ6y+lrWVf0QKsnqLc9pJIAIqum1XMCkWH5NcjY7s2LeuhqO9aSOnfK58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K2i8K6Xc; arc=fail smtp.client-ip=52.101.84.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkBX4GfcjhA/4sinxQVeMU7a/xboIsUUFyg6ilC3RWmiJv5285Xk5nulWsHj3+HUxzHdONEdTSoemzutTiMIV8v0XTQ4WtfJxFGGHedLyQNfg4acwepGxQBRhSWNTi3Msa+JWEOs2LEy32XHRB++6X8nFjwq+VRuZRRbZwQd1XlmNJkIvdPx5ywWYY177wDEFdDmubH4mizneNbcUR6lNj2UNf51Fg7wi7n8RtyTsCZg4uSOqmKhnN5h5QVfPwHNxpjQuz797dQhKc7Kis906mtIToXvNAcB9EzZ3uvWs/0wD1NrHPibrwDhwWtDnJmshvRvoK++x9Nv0lkZxt+rAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjZ31ySs6kR/Nbv7P1nFAjy4w6rK7Ra+40YPJ15pCiE=;
 b=hibiLdGYSHY6fpWEY0RJ434b75yFCTraSPfcNsdyCNpZCHYnVsgrpqv92ZZdXQwzP8o21Vt/gqz+vI0AdTFB4BjIn5pHM3R2iu9t9yowdvzt/B4yiqWrrNw5DSqcmZFVjxMuU/J+ywXJt5cebDvd5Kgmu02B75u6DC452NluY1SKt77wYUgTZ3xjkL+FQmEt75fLWZQe7xM5sy/cupafc5H4adGPTycytGR1ywNTPlw+6D1FftDdPGa4dcnr6sxvnS2nFqHf7+LwT2iDeOeh/5+tj2uhaSpTBNn0OAUbNik+N05ii07KR8VB7caFJ9GpSpSan2ZX52LKoH+aL/lOzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjZ31ySs6kR/Nbv7P1nFAjy4w6rK7Ra+40YPJ15pCiE=;
 b=K2i8K6XcBUNY3E34KIwYhRy9ak/v9v3ogaKv2gxx0Myv1Um7yrBXEIUH9YqdRi62AVfctQHy6UQUQcgkdVp06J0myu+dbck/zNmSKbiNQd2MpLLAZxS4dZ5NkH+vWxNHEZzu4clk2dAMUaFo58C8hCnuYyK1j6CMdFZImGcHorzCrPO2RMPEyXUwiIu7jbc10ITwrOp8wce2mTPS+y1wigYsk7v1FCjdAon/kMq7noOoKCwH0FqlbD2djamzuSiLGfYae+rZ8gkML7lcJ+hkVMKOaiWz9yyIT5lb3p6nxk3TRiUMbpkyowxaIyWFCp9LTAvhUSH4dPT0VhWr26Ks2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10627.eurprd04.prod.outlook.com (2603:10a6:102:48b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 14:41:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:41:59 +0000
Date: Fri, 13 Jun 2025 10:41:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aEw4rTDn14mn5KLh@lizhi-Precision-Tower-5810>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aErqY0QWMRdC7Pvg@shikoro>
X-ClientProxiedBy: PH5P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10627:EE_
X-MS-Office365-Filtering-Correlation-Id: 52463c56-a959-4e36-8bb4-08ddaa8873c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?maDSAdpEjVG9mIiCMtn7Uv5tONhGw8Riz0Ysgerm9WXWd9fBoQzSrGyiaai1?=
 =?us-ascii?Q?/bOZnwLAeiks4BeK+DlU/NfRJrwcQIt8joqPg8LM526AzB4wB69W4+BUua88?=
 =?us-ascii?Q?F+vLyy4K8LDrM7UHu+hObuf7p0tOnhghW2r8Kz3kIJ4VXA/Tsm9Udme25pyt?=
 =?us-ascii?Q?0oJMX0yEx33E/d6OMNfcohONRD72PxOYlacbS5jRjL5PNa3iJYGym/6rsmQu?=
 =?us-ascii?Q?2zxMvdB0nxiCEm/Xn/IQhrO13iuPYQ4hE8zoK7eDQ/HV7r/lhqEtVAD7DEOR?=
 =?us-ascii?Q?shSDBUIzmacid3JizviiOpzwg6UrCZBe3UsG0yZf/SHfIMpf9XfWRRrVz0I6?=
 =?us-ascii?Q?eThyTMGcmTj/kfz3k96bhoirZRXFZw8nNKPNn0guN662hN/D7+Me8DYPWmNT?=
 =?us-ascii?Q?2wxKaGdX3DYjMiKjAulssNkqqS7g8m7WL615n2caWx5CmvUJ35hPIme3wlOG?=
 =?us-ascii?Q?1yBLnfLUYZcBKiqvu4xu4oDOfn2HYF8wakmYQcc2MzpX4LLj5yscDmJVy+66?=
 =?us-ascii?Q?5FCd4DjlNpvKyhtfhcPODQWyw4fIlFQO2vu/LVkDOgcxO/35So5WPByPwC/v?=
 =?us-ascii?Q?WgWaP3mC7wsI6HfO7ZIrJz5Cfdv9C26Ov8uRP/jFSE7l9VkshFE85D7Zb/Ln?=
 =?us-ascii?Q?UCvw8aDqbWrgIafqsZF61e6Jsze/ZO38F2B1QC37s8nKIJtv3GTfWCpY7mC0?=
 =?us-ascii?Q?rQyp8VQcc1Go55HzWPg3SXs3wjLvkw6m/s1aJDsCHfH/b8ctJp3XNeotp3aT?=
 =?us-ascii?Q?uQAqxKMD4fLLE9EQ1CRjjBBUaKO+GnYG5gGKdI2+5Fe4dcZmQaIkjxXDBaP8?=
 =?us-ascii?Q?1BCKqRcWhvEqVjgLrPWp0ezTlnqgNUHrCbB66b94ugkDzsMPVDpiLPeLLK66?=
 =?us-ascii?Q?Cx1pdrMNKv/Q2HA0lFNkfk/7qKSkfYPLXsxFOgmJkTbzmKV1xqCOLp2s0wKg?=
 =?us-ascii?Q?xEQf+QNiXwAE9V9S1XKqwcraLjV7+nYpnzI4JAWEna/fNHp85dAp4TFiUorm?=
 =?us-ascii?Q?iar9rSZSfYUcG1grC27fYz1bZxpAAxz81+njmj7ijlGWoOcP8+ZhUdOIsKDZ?=
 =?us-ascii?Q?QHLETADf85Zt5iuz7hG6GUAelbCfT/9kO+6dGC47EGbBoGCsp4LhDEiggosl?=
 =?us-ascii?Q?yLBv7B5ovZmT/BWDVM0c4B9nfrK0mQNH4qC2dD84UZrqug4+3UMc8RNxntdl?=
 =?us-ascii?Q?vVlmkAnb7PNLGADUH4Ar0N3M84DI3gPPew7xzRLrm/NVXFvb01VU8EldFiKR?=
 =?us-ascii?Q?OxvIzzTc5mZvVgxNnkZUa/zuR4ffOoGNNkyW5DLswo/PI8UdoOuDQR+kfj5q?=
 =?us-ascii?Q?mCVBgIGN5aQF4+U4LvKPrH8Fc75+qzZu63RDK3DZRlNpiHl7EGCrgk/9Pdci?=
 =?us-ascii?Q?mAKaGnjDqNXDWLjpkF0aWZXXBvzIxlM3dVTG4KVpPkynxY3y4K1RXZ5XzqBF?=
 =?us-ascii?Q?+VvvsvdugP0Q04JrPpo5odLIaHiNYS9Hw+kCci/GBBPFK7W80VXxzjuzS9dU?=
 =?us-ascii?Q?xJVlEAyd8p1wNEU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0WDaFIqFpfKNqkbpa5Lgzh8WxZEFof+Kr7+o8f8baIAOAqgmE5F0E9vlRBjU?=
 =?us-ascii?Q?IxA6oUJiqHEAkr6XMnrN1+CG9wR2vBYrwdL/8yJXEZ/S2YgDqHy3CVLKmNcX?=
 =?us-ascii?Q?VHnebBJ74jgQiVbM5ays0jQ8Nf6hEnafr32cjJQH2gQj+R6D+JmXyhX8RGsQ?=
 =?us-ascii?Q?OtJPkEajzsY5T50Tl1Atq+2Z5lz9sVJTTeVL+6iPvIjM/Inx+TNl0peOKWsc?=
 =?us-ascii?Q?CdI7vdbH1MGI5+LIDPu14tIIiMPZt7wkP9cmvEaUF5D48phwjH0JD2MAli2g?=
 =?us-ascii?Q?LfQpJToUrQFoclF4w03VeRIx1EOZGAszEe3Gt+tlr91W8jie+QWmhA/02VRg?=
 =?us-ascii?Q?fPZ580hc/VIaeNb7lcL46LWQu7ahuZIbprrZsK9GYJ1PPO0lIpdNSsWiA6oB?=
 =?us-ascii?Q?LVEIRtvMn73VmGbcyzIwf+xlW7xKsvwKc01TBuJvzB7D3Oe/ApM7koC1x7T+?=
 =?us-ascii?Q?v2gUlGB+zmmJxBykXFOc/Dmee9KKPKof2IbIPL+3NV9AqIl/RoE2Ui4FMd3m?=
 =?us-ascii?Q?rSBlt0IBngjUs78SjY9o6r1ta7sPY04ZIQ3cVm1wTFzPjnEyBerJqvgDxCe0?=
 =?us-ascii?Q?JWNJRgwD1EdnEgZ2V6X/Aq42NtbBZRjMw8isaJgvtPnv7weP16A3c0YcQoZ7?=
 =?us-ascii?Q?VPs8LxdeNVpj0cYXDPSpwmmMqhZ/A7/ceM57FVJj6LwO49o6uk1wLJHDA/Ja?=
 =?us-ascii?Q?SpfGjm4JPGseV2MHCQsY6CpbM232RBkHJBFQRYFTwdki8D/0Em4KkKQqnva4?=
 =?us-ascii?Q?Rem56+MjOg1TOdUUJ9oh55WuwsyrQ3UL/ZEu6i3rfljUprtVrMnPJO8p9OwV?=
 =?us-ascii?Q?2Rj76i3WpGgY+lxLlGx/roqT1hqw6ziw9jxbl/Llwthxl24m/QCInfIFz+6Z?=
 =?us-ascii?Q?2OsyZV2X/RRyU8+/oxNtLrAPpsgvQ527uj3lRPx1liUnvkCD3jZjBl3NY7zd?=
 =?us-ascii?Q?SpxJhSKfZ7SBXMA8+GYU37zlHEUu50fkRVpxzoPWpM74IISYRh/LD7iCwxvC?=
 =?us-ascii?Q?8b2grX8X/LtYM7//+V4/w+K8rAiYbgXwALEPiFfHRViXuII09Y0yvq9OymNf?=
 =?us-ascii?Q?HKaZ8SLx+/KtzEHmvwXKOr7a+FYfZ7cf5n6xQ9oUyXKSB0hJW9JpejZLYrZV?=
 =?us-ascii?Q?p4W2SG/Y1VtkVy+NVL7X8HUvHiDfGeRksQmk0UXENxISplSDR/GuzQOAPJpF?=
 =?us-ascii?Q?l1FItbUFGQ/VnPG3fKy+fBOmL/S11Khn9t8Dg16JRlOEVt/IA3QY6WNc9gyX?=
 =?us-ascii?Q?+fTlHvHo85r83WuWLIOb1XQ275Ekrp8QwnxfyUj27AK09aaPz4FHtfaf+Gfc?=
 =?us-ascii?Q?MArG5XeO8eRZrRwhUauDjHlidLjgZxIW41nImFWvVyZGGKicDrRgsq+Z00QX?=
 =?us-ascii?Q?cuGpHWDmWnbMgUCJT5FhKUf6tzmz2Eeig45mntvlb6IqX9hQIazA2bAMqwta?=
 =?us-ascii?Q?9eT16oe/tM1W/UjhRv51QC5/uuU6fhAiEVnN1mI/Ss1mRrtFSIxCAZzC7m+O?=
 =?us-ascii?Q?IZT1rpHlKL1sdnQ4mq4LRxLwOkTPtkx+9M1EfH90XW+PK+BwNFROVzylWbZt?=
 =?us-ascii?Q?+izlVqdZbgzMczyY6FMuKsWTjL/HVi4xGC7kbsiy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52463c56-a959-4e36-8bb4-08ddaa8873c1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:41:59.2641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCnvvJeFqjSbdAuoNwrDE9gzKHyaEQC9pDjyD8pVccy55PL0An4J/ncNqf5P5EeBsu5sv3z4PUon438Jt8HI3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10627

On Thu, Jun 12, 2025 at 04:55:31PM +0200, Wolfram Sang wrote:
> Hi Frank,
>
> thanks again for the super-fast review.
>
> > > - RENESAS_I3C_MAX_DEVS is a constant currently. So, we could get rid of
> > >   the 'maxdevs' variable. I tend to keep it this way in case future
> > >   controllers may use a different value, then we can change it easily.
> >
> > It is similar ADI version. Can you simple descript hardware behavor to show
> > why need RENESAS_I3C_MAX_DEVS,
>
> Yes, for example this register has basic status info per target:
>
> > > +#define DATBAS(x)		(0x224 + 0x8 * (x))
>
> And there are only 8 of these registers. So, there is a maximum of 8 for
> this controller. We could hardcode 8. But we could leave the handling as
> is, just in case a future controller has more or less of these
> registers.
>
> > > - For accessing the FIFOs, this driver uses the same code as existing
> > >   upstream drivers or the recenlty submitted "ADI" driver. There, the
> > >   question came up, if this could be a helper function?
> >
> > Add common header in drivers/i3c/master/core.h implement inline helper
> > function
>
> Sure thing. I think I didn't get feedback on my original suggestion so
> far. If I now know you are positive about it, I will give it a try.
>
> > #define PRTS                 0x00
> > #define  PRTS_PRTMD          BIT(0)
> >
> > Add extra space help distinguish register and field define.
>
> Okay.
>
> >
> > > +
> > > +#define BCTL			0x14
> > > +#define BCTL_HJACKCTL		BIT(8)
> > > +#define BCTL_ABT		BIT(29)
> > > +#define BCTL_BUSE		BIT(31)
> > > +
> > > +#define MSDVAD			0x18
> > > +#define MSDVAD_MDYAD(x)		(((x) & 0x3f) << 16)
> >
> > Use GEN_MASK
>
> Sigh, if you think this is more readable, then OK.
>
> > > +#define STDBR			0x74
> > > +#define STDBR_SBRLO(cond, x)	((((x) >> (cond)) & 0xff) << 0)
> > > +#define STDBR_SBRHO(cond, x)	((((x) >> (cond)) & 0xff) << 8)
> >
> > FIELD_GET FIELD_PREP
>
> Ditto.
>
> > > +static inline void i3c_reg_update(u32 mask, u32 val, void __iomem *reg)
> > > +{
> > > +	u32 data = readl(reg);
> > > +
> > > +	data &= ~mask;
> > > +	data |= (val & mask);
> > > +	writel(data, reg);
> > > +}
> >
> > can you move reg to first argument to align below help function?
>
> Yup, coccinelle should make that easy.
>
> > > +out:
> > > +	kfree(xfer);
> >
> > you can __free(kfree) xfer = NULL at declear to avoid this goto branch.
>
> I'll give it a try...
>
> > > +		if (!i3c_xfers[i].rnw && i3c_xfers[i].len > 4) {
> >
> > Only pre fill fifo when len >4? what happen if only write 1 byte?
>
> Ehrm, good catch. I will check this in more detail.
>
> > > +			renesas_i3c_write_to_tx_fifo(i3c, cmd->tx_buf, cmd->len);
> > > +			if (cmd->len > NTDTBP0_DEPTH * sizeof(u32))
> > > +				i3c_reg_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> > > +		}
> > > +
> > > +		renesas_i3c_enqueue_xfer(i3c, xfer);
> > > +		if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
> > > +			renesas_i3c_dequeue_xfer(i3c, xfer);
> >
> > This may common problem, I3C spec have 100us timeout, target side may
> > timeout when driver wait for irq. So target side treat "repeat start" as
> > "start" and issue address arbitration.
>
> There is a specified timeout? I couldn't find one in the specs, can you
> kindly point me to it? So, the solution is to use 100us as timeout?
>
> > > +	i3c->addrs[pos] = dev->info.dyn_addr ? : dev->info.static_addr;
> >
> > Are there extension of "?" operator in C ? I remember
> >
> > dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
>
> Dunno if it made it into the standard these days, but as a GCC extension
> it is used in the kernel for ages. I encourage its use in I2C, other
> maintainers don't like it much. Mileages vary.

Okay, that's fine if it was already existed in kernel. I am just curious.

Frank

>
> > > +		if (ret) {
> > > +			dev_err(&pdev->dev, "failed to request irq %s\n",
> > > +				renesas_i3c_irqs[i].desc);
> > > +			return ret;
> >
> > return dev_err_probe()
>
> OK.
>
> Thanks and happy hacking,
>
>    Wolfram
>



