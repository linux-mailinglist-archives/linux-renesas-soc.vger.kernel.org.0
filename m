Return-Path: <linux-renesas-soc+bounces-19609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4B5B0E342
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 20:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B90FAC0476
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 18:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B86F20B81D;
	Tue, 22 Jul 2025 18:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wm7mIMgx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137FE28031D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jul 2025 18:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753207994; cv=fail; b=Hpw6IRB3hc3q1amaPezO4ULwrL94fnzLO17BiW6nQjpUlSuBmEXwR4PZRfFkJCruQG9slAdYvcnwtuFqCPj69Cxi2x7OwZmYVIuHFWQkCMOaaFme0MxgiaO4OrpPnjhON9zvrttVfDM/TQG44n5tkAGiXR21KktK3j+chMa25Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753207994; c=relaxed/simple;
	bh=Wz6TlGpl4SSdOnOk1qklTaUZmJd/rxulCJJTaogO18I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oRG/1I9jOtYyZnpTK0hxjVYUVqZQlh6zB5cm/6CuUgfewcrH5o/Ulo8YV8a6Ap/TmwBX+ly1AyRhUG1gaMc5/fCL43b/zb0C7gZh6jcCBeZfFbZqzYe99Wr6/TETTdcPCWGuDm8Z3jd9FspcbEOdVUgpvHDJVeRMVfSLG8DhLG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wm7mIMgx; arc=fail smtp.client-ip=52.101.84.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QS/6bwxLsB5Md8siKVQGj75kIKFdPDYdnGfm2fSqUSLZzHsXxTrGmreSvSNcptx3ekDHmHLBEdYjiui8+fKWrEh+5GiffU0si5l/yV5/KRr6+L49Oe1EM8fKdmO+prKnno8lMz0XXrNgCVEzpTVIythmc8pfL/HLlSoxqnvLI5+5zi70VaruE8retXql6OMAfar1A4P9CijNyUU7GhvTBfDgKOr/nqrZFcedsoWX3abASaMFmasz5bL43t+VzQM5jGx4MnAld7wsqaSo3kU176JSgyRHgeIsFqQ+u2gJzNVOdkvAhl2hNJqUZuLJG7dys8lb7QWh3h5xCJvuEy2idw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQ3dbSwdM6+y/wfg/8vPNzQkwQWZ/Tx9geiwZbNZ74U=;
 b=TpmywuLnCRuVi87fflE6F+dH7cWzqlduMUK6nD4AZyrT1HXvFsev3lbNnXGeBuboH7sJwySOxPqWHWl5I7umjKaP+EZWuXLNlUMe1DgrpsB0u+BqcXbSMhQn+L9UMvSPyVAWrN8/CVbIrCXPI2GS/0r5ib+a9OJwCFgfjfjObKnMfDzlrAPCl0MRKjGwnatow6yOtY4CQRlk1+O6l/ZqyGVzkUXna2X76EDZkhvrdednv3Sogm9UM5d6TbQLUJyN0tpchFyfe/nDeGSitR/rnTvY9l0FPzAGZBWvvbYyGhG8tvDMVY8QlDi6uPXeHxrsTLjobBL725Q7SDxCxybHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQ3dbSwdM6+y/wfg/8vPNzQkwQWZ/Tx9geiwZbNZ74U=;
 b=Wm7mIMgxHTzOU6M2es7VQyCRT1a3HdXqt5RuFCCNPpcpMhaaeo6C2XKe9XVXE6awK75os7NUdtf04exxCOh1aWCiV1QvpYxq2Z12Z5pbR9/wM2vbXqYOq/9IfHwWOE5L4vYg9zn76dF1PrmaibFSCsw7IyCwIVdTNgOI1ZnEibbjFTppYhgrVvcSsgxmN57NvLGAUtFdGQIW7RSbxKOr1sEVaPPw04x8GJNpsW3WlynliE4f0owEL/7WWDdrDHlmlor01G8Egq5Anfi1rHTynY9iX/h9U73DzR9nr+3yDssA0nHNz35bJlDp3lnRTH2FyHf7YXJiNKNwP5A636lygg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7675.eurprd04.prod.outlook.com (2603:10a6:10:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 18:13:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 18:13:09 +0000
Date: Tue, 22 Jul 2025 14:13:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v3 2/4] i3c: Add more parameters for controllers to the
 header
Message-ID: <aH/UsQNboogBlp+m@lizhi-Precision-Tower-5810>
References: <20250722153445.5003-1-wsa+renesas@sang-engineering.com>
 <20250722153445.5003-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722153445.5003-3-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AM9P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: fd79cb7a-d57b-432f-ec42-08ddc94b69f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dx1KWoWW0v3vlEuPnpq3Sk7LqVQblRRds3t+jrcJwniNOJzUQZCfGgiXF32z?=
 =?us-ascii?Q?gYd7qi1SUpjU98SmJupNHIviUp8Rn0WaKZ5VsAbb4juZvlUINlndPI+GYs+o?=
 =?us-ascii?Q?NzVttH5cvU4FPdY6HyAdOZA7uhktoWiHJheTu+kCaw9md6ip2gFW5YQmcQdV?=
 =?us-ascii?Q?Jnkt/4ZPvJOfqvDTmiFi7UXQsL8x754+yjHutxEIgINQJptzcNatoDVH3VDc?=
 =?us-ascii?Q?xzsYrFSOtUYVMgG2h4+Q0am1UBmbVKk3ePgiO0bSu2+aleL3lGSfqGOMXhe1?=
 =?us-ascii?Q?lJLiSLkh9XG/4j9VrGRyqoek0CfVMo+kffhrxsf0ZWwYXAcsKth5j6+NzhPR?=
 =?us-ascii?Q?hvgHd7o/HgoIZ+0nPCCndxDc1075L+v+T/H1pGp/yQGy1I9xr/hcvk89cE0R?=
 =?us-ascii?Q?3Kr/KTuuWJuWheFsKwa4xeT5cBHZWpNgsbeqhsqVe9T0YOfkcwL6s5VNejgx?=
 =?us-ascii?Q?19qujXjjeGApjTL/E5UlDkKZsLneOtC6Lb3pEgivBV0zaHnF2UVdejV9gffY?=
 =?us-ascii?Q?DKDWjSTSTMK+6IxAb3vYUjuR+IMadrdBlASawWCLarlk9vq5RowCKjwWokSd?=
 =?us-ascii?Q?X8kRDrc2qz1MANsP/7SSzWgfGL4h1UHUqFg6VuINKVqQCsr7qrbtR0+Ugtbp?=
 =?us-ascii?Q?KJ1XMk0g3+jU3z//dtdigqA3bEFmhTuI9pnhpGISbtRO7waJ3igG/B3iNMif?=
 =?us-ascii?Q?wf2dsB8CvDfQ9MjkLk6FnM+OLE/0O10hpMXHLNhm/+wtGZXXM7JHA7dE2QXG?=
 =?us-ascii?Q?kTjyR/6XiL0G+S0AlXpdb3hfHSdE3P5ewJ9jl/WsViGcoG3jftQjGtv1N+vl?=
 =?us-ascii?Q?d/oq+wPWZV0HoKJeOphVhq66a7qDhjP2BAhDvpit6ypgVO1uPnKoOqumy5ln?=
 =?us-ascii?Q?PI/sCiDpVtLZt4L5W4+m5iOUl8m1FjvWFkqJ0iqIUHZqZBnAwdY4yZQE9FJw?=
 =?us-ascii?Q?dF7eKQWQnI73bq1zKMbjML/SrNRE0AdbGZiAMePt6HBW6xLuvuc9jnSIEwEu?=
 =?us-ascii?Q?qTxRlg9/DpO/+nItH39tfY6CFIE/40INKDD9eLc0+VdxH9dh4k5dNrz/fQum?=
 =?us-ascii?Q?bgd6ViTPEbJDn3bjSMhyVg49BuGqPHNc/TZdYEaVXSiz3xh5Fpv5aDye1HV4?=
 =?us-ascii?Q?KMTHYvtLxxi4RfpHoN+gViT5Bht72Xjjzw7Wkj70lSnS2gb62dKpRTiAaDgv?=
 =?us-ascii?Q?yhB4V2q3aoLgrwiaDjRC71SVXV+q7A4Rua4F1JKxMaUipXEpqJx2B7HJ+oC/?=
 =?us-ascii?Q?rx47IigtKFaQNB5iuFi5853CaSxUnBH56/5za62ntGl2mSDfGf6oSsQhwqOq?=
 =?us-ascii?Q?JyNlsbr6O927hoKch47ethkvd+qtD/L+8fKgG80fM/oMz5a/4XOdB6OR2D0F?=
 =?us-ascii?Q?CuiEqV9lD6gGKSQLpub+jMCFg/2/W41TMzG0lXl08LV3Ov2LamGglNqv5qfo?=
 =?us-ascii?Q?JJwMEEOM3i1eA3zsAh1pGyiheWE7+J0XuI/f+Pf1X1isk/APLvrpuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d+AamEInTxT67xXBUTzAG69BXZnUVjmqJ9Bmzhi2JUUn7fLRqGVazbYfk9DF?=
 =?us-ascii?Q?Fnkp96jLHPylQ3JFuRtv/BglKmIkpLgIKiksCQbfVLM0/tchcMcajYjMNENz?=
 =?us-ascii?Q?oytuSaE9nst33hRJfOx0OMUcn6kI7iGWnmx7ZCRYowlwYltiCz+asKdcx7/g?=
 =?us-ascii?Q?ZJK7Sfh4I+NOicws2kxHLy1cWRzQ9jBczGLt8G3aHrmZ4eLjoJqXWOEXUKdU?=
 =?us-ascii?Q?9m/gNwQjc6EcH7QIvzCaSvN2gTcfbUnnvp6JXr+0zLBza1fOup8xENcJ++tu?=
 =?us-ascii?Q?510bAI8VcGfEQuS+YwDh4rGpiYpau3bAjEQ9B1RpJc16+nL9Kfk/6GsPOSD/?=
 =?us-ascii?Q?hfoDDMTCBo7Gty39tDV8cWzTm+XgLLNbNlw2jgNgjirNiINTk8+g0qzH72ln?=
 =?us-ascii?Q?0gnBBM90BE6OtyuPDFECO+qRpqu5C9fmavwYHVaxWuR2z7wth2wqprBW6mDz?=
 =?us-ascii?Q?UOfTiikaYy+wGCkby/OAe7h3MX9yf53xZ+bTPgQFCdepFHsbK2dfNEek8oaw?=
 =?us-ascii?Q?jKyDDdF89upBS7a9i14l3sv5THHhm3IXJfoTRMhTczPK8A4f40io+pUNj8Eh?=
 =?us-ascii?Q?cWwfWskL2OXlOgHSs+l6Q+YFxgg8WnNdlXKZbli4RGKnbnPh93pVyoKyZHTC?=
 =?us-ascii?Q?pBeUDNCC080IXhOfFv6OzS4qvTN2XHIBlOd3mFtbPpirtvle4weHMP3uMxon?=
 =?us-ascii?Q?M6K7Y91UBo0qQ21ESnT0nz+GQjwLSD2pDa8DCdpZeVpGQR06k3P4L2+Oy3ll?=
 =?us-ascii?Q?G7rDuYiIHejtUHyIZdndJh1grSIPIN7yOyTTIQDLTJGssMF7UfOp2BWIYfJu?=
 =?us-ascii?Q?/r3k1BM+QtSKNbf9ZxTy04hF/cqXgTnDkYfxkbA+ERK+ULU41t4nehvq8jYJ?=
 =?us-ascii?Q?5UBnHdZGcfrda5y5M8Goi7W4NX22SgXoV/xFanyw60LvRMzcgNXPhE+SosuU?=
 =?us-ascii?Q?p3hNHnFZIq8fuhKH+NR2lzwP8Mv6KRftt+WAuYpiZyoPuxh7kxFt1EjERvyv?=
 =?us-ascii?Q?YvgkOPXvCgFm8Ut+yBu+5qwEj5+VS6ey/6Z4UYp2XaNI2XyDMum8fLFsMbw9?=
 =?us-ascii?Q?EPFxpdKMMhGKuck+Ay5sKme7KSlADYY1AFidv/tp7JGMqoNpWRrccROxO1Y+?=
 =?us-ascii?Q?aUa1BSkU5M8hwY3+8TCvngdtpjLU0NuvC+hA8qYCeNQnoi2tFXKi/u6j81gv?=
 =?us-ascii?Q?yY8QPbtxVLidGWFZGowyTU0l3aHV/rpPR1yV0R6KTntC1f2qqQa6fQgdEnXw?=
 =?us-ascii?Q?MU9DS1RAmEjE3aAuGnpe85wK2k/yXgw50GRZA2W0/u75dpXUWUOAdXO86j4F?=
 =?us-ascii?Q?1eDKFXH8kUf8qCwRGcVRzg5XIENf2CyjjCnYn6s3FzhprAIL5CuKRLRckHDr?=
 =?us-ascii?Q?qzBKCMuNVIeRn1unEUlKEeceNWlZLCJ+0RglW2XhrHSW0ExJ1gYml12QHV5z?=
 =?us-ascii?Q?E/viQxUHfNbhZ6XduOJJtPG3FYSpWMMv4UFHFOOanNITupVEYQ8G3PL0TT2v?=
 =?us-ascii?Q?YTupYfeU2BcAdlYZWM20TozeB+6EuaoBBbb2RCeL/AbpeEWabELLXK6aV7rk?=
 =?us-ascii?Q?JkNXxMqKVF5LVtEZro8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd79cb7a-d57b-432f-ec42-08ddc94b69f6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 18:13:09.5331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvYqXbCvabbE50kwbVKsvwS2sELWeru+GRXav/VG5zQQf3fPn97MNXe16Q520fRFrSceNioNFrwJI8JgEWy6uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7675

On Tue, Jul 22, 2025 at 05:34:40PM +0200, Wolfram Sang wrote:

i3c: Add timing parameters for controllers

> Timing values from the specification and a subsystem wide default value
> are added to be consumed by controller drivers.

Add standard timing value defination from specification.

>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Change since v2:
> * new patch
>
>  include/linux/i3c/master.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 7b8e7f22f013..da6754bc254c 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -254,8 +254,15 @@ struct i3c_device {
>  #define I3C_BUS_I2C_FM_SCL_MAX_RATE		400000
>  #define I3C_BUS_I3C_SCL_MAX_RATE	12900000
>  #define I3C_BUS_I3C_SCL_TYP_RATE	12500000
> +#define I3C_BUS_TAVAL_MIN_NS		1000

Can you add commments like
/* ref i3c spec v1.1.1, section x.y.z */

Frank
> +#define I3C_BUS_TBUF_MIXED_FM_MIN_NS	1300
> +#define I3C_BUS_THIGH_MIXED_MAX_NS	41
> +#define I3C_BUS_TIDLE_MIN_NS		200000
>  #define I3C_BUS_TLOW_OD_MIN_NS		200
>
> +/* TODO: Document a reason for this value */
> +#define I3C_BUS_XFER_TIMEOUT_TYP_JIF	(msecs_to_jiffies(1000))
> +
>  /**
>   * enum i3c_bus_mode - I3C bus mode
>   * @I3C_BUS_MODE_PURE: only I3C devices are connected to the bus. No limitation
> --
> 2.47.2
>

