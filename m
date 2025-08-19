Return-Path: <linux-renesas-soc+bounces-20722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10255B2C97C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 18:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C1DD7B8DA5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 16:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C803256C91;
	Tue, 19 Aug 2025 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oqqGZCIn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896B7256C88;
	Tue, 19 Aug 2025 16:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755620669; cv=fail; b=O8SWwJRA4pxJ2wNEsNV0f97QXSX9v4PgCPO4A9ELKclJ+vrzws3w5YNK+JfkVwwPYjImIPrcy6BGfpr+j8BriOX0q5awYn+4yBzEWxxSTkefqrEADEjGvk0ZPXM0FV7HEpHLvxElevvV85KaD8sEmi7BUY36fWLKgsP8UQ8tWvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755620669; c=relaxed/simple;
	bh=AHmMtxaeTCkozZ4VRDHmfOYWuJNakcPehbSSQFyKVVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RTQ5gek/gKKhzN4WQq4hQsK2KcQQXMTA76XFsuB/zuLLikRYGLGsWTkuCjsLQM5DMiz4yrF+xXl66Syekd3lsJLQFvAqYB02d5lCqk4W2bAe0QvbIjTsEMqeWeKwp6nVoven3ZtOLAXM7IxLc43RWP/TjBeDIszN2ivXQQg6j38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oqqGZCIn; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBQ4JK+reGs44ChuC2iItjUpnLu6UHhxJiWJG1fk1BlUulCXnlu49F5a0nSHIvOkwfSaYsGjWKmmbzUw2T/Ic3zCRGBOVI8KSR+mUJ6VwE9bPU7IdVx3yBFcV63gqNVMNYyb6cIJQ/75k1BgeYUKznYsWrIPaVMCLoUYQikn/TpnHw/4jYA7srTrW7APIkrXvmqtFzf+rODPmzEIBy8PsE6neHNejDS8dPzGXFb8lJoPnN6LSnwospCNBwurMBYgRqtsO37tTE73LrvLdfYChDIvGl4z9+/SDPgSQ13DZzpRDcqKDXztIsf8Fx0ZsexJYZNt0CKxk/Cb37/XhUgOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNgssdABvpmLoJC3NLpd3fS8du7Lb8EJmmLISzOKOKM=;
 b=DwScnI0Fg4XKeT9BDpYfLzNX8I8K6IWVHk551/vQwdP/0RXDdo0jciB8ib7NOzHA0jxRvX5sB5Otf5ZSwik8o9ttuFM8wIztMqfKcW1zAIdfNmi14v4JuFvXjpTXjnJqEOI8I1V46ubT+NOR63/y+OpgwxMAHM/yuwkSoXjfPiY5E60P4HquqNV0KjFENutbZ9PNAX+8mDopwL1vjZyzHEaCEUPMS2yERAbG8OUEmR9iBCpv4lYrBnRLrSdGD7qF/4OPD4opppzYMe7kCS+dot27VD7PnELc8Ihxf7o5THtQ+Wg9Y0kNyBYfUgT9HgbI4hpOL7gomdiyOvVRPPP1cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNgssdABvpmLoJC3NLpd3fS8du7Lb8EJmmLISzOKOKM=;
 b=oqqGZCInDcmrAsiL0wKKA8uaRFkytkDC+vbyHvFErIM8QYlynkNSsh/IGg8kRtYrjDjQ8BLN0CAPaWwJM8xcAxbNxh6i5IjKuMG5MEGBW9h90grldk9oR6pXPy6kiE6IS6DHK4AOje1hRTJeQ1o6zcj6sEBzp8Kea0j99g6juag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB7049.jpnprd01.prod.outlook.com (2603:1096:604:13c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Tue, 19 Aug
 2025 16:24:23 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 16:24:23 +0000
Date: Tue, 19 Aug 2025 18:24:13 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r9a09g047: Add GPT nodes
Message-ID: <aKSlLddX4DJpkWSh@tom-desktop>
References: <20250814184115.192930-1-biju.das.jz@bp.renesas.com>
 <20250814184115.192930-7-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814184115.192930-7-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR2P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::11) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b112a2f-0600-4c91-0092-08dddf3cdbd4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aHxhTLxDQ876MB+uUnAvTMEWiaM1twUyJrIe+WTR8b7xaX22OQz0yL8psSOH?=
 =?us-ascii?Q?zTyHtz8gcEx/PbEgHyj/becLikp0HSS5Dkxfo61Fl9H0m7E16PJ0vnyZGRvM?=
 =?us-ascii?Q?qq057iBZ5VAS1hw5RjD4x82bzorKaUiTI3wzN6SeOSS+VhFn2D8fsJPBqXho?=
 =?us-ascii?Q?o4Rhltv05sozhB7wtU8xEuR4I6YXG56ZW6xvUIQjijsUnOSv6dYNBjbuopaJ?=
 =?us-ascii?Q?56G71lK70/dcTPBo6v8ntmktX5YFfTvT+5UMHWvc2fRoONBHyEp/a5w99ILx?=
 =?us-ascii?Q?0pYZ9iz8B+soLWq9uwISohS/wScQNi2xG4jpawXOVMX8rELnAPnBlz96L8Py?=
 =?us-ascii?Q?ADZNjXw/xAJ3jZCNZE9THMEBPfaFKj38XyZlwsTgrp7OsGlFAM3eczy36Pd/?=
 =?us-ascii?Q?f60tzd7yJB1qzReYHfyAxjHOfYNiuWCx6LZoI+f0pWQALEFAg8sKmARRRGXT?=
 =?us-ascii?Q?xl7YMveMgq3oyzl2Sn4lLYeYFQ0uAR5OaGqitB5Djbut1cp/U8YEcvHfwWn7?=
 =?us-ascii?Q?5TlltOIZWNOKWJGiNV7s5D7KUeQ1TWcnWfS4UkjFo8pUx50N+vTDABYczRPf?=
 =?us-ascii?Q?jKZRxYjZhC01C60JaBMUgeWk++yOYysXFG6VRkwbwtrUHUozVteg5oVYXMJw?=
 =?us-ascii?Q?pf2JVhfpf+nykDTzdjJvmq9BdLe2bPhdy2XcsDZT42r81lhheiZVU3Y0vezg?=
 =?us-ascii?Q?VnR5L5nke7F2TnfBQoEUDn48Kv1r87v57yERK6E86ARDtTC8HxjqrexSUQmI?=
 =?us-ascii?Q?f4D/AOG4Hcq7jjJ2XhcEro9MHpVMvzvvIdMBVqzDoBzcMnpKilc7CqI654vr?=
 =?us-ascii?Q?NWzecKXti0/pgfBXTd84kkV7kJ7xRQWDNVWTIRDY1EEZRic5RK15jU06ZVBX?=
 =?us-ascii?Q?ObqaMuCNL903zPn3Xm6C+ieTVGFkq3/axe3vuWjNlGNwB6gG6L22gtQM02bF?=
 =?us-ascii?Q?jJ8B3V7YHlXl0HV6LhqcABwTpQyYXhYlG45VAmnAQ2dDlFGGF75l5bn6eIo/?=
 =?us-ascii?Q?niI7rCaF84sueab2pVg0aGJOwb8XvObBQh1N8MsbedXoYgB6szTGmg2yy3Tb?=
 =?us-ascii?Q?d/caVD5oig1hkOJirbQgZRKtCo3xezXc6bJicMky8spmjXxFs20yPfIU/X+a?=
 =?us-ascii?Q?aIPWmyoyW88zrFI0L1FbPXjeQ06gkNcc8ud1WE0HR5RuZyEwE6c/WJa5+SA8?=
 =?us-ascii?Q?NxdWsJFuVQ0do54AtaRGCvJllW+r+jxkazEmuSQbCJLSy5G+0Az5ylGmzhta?=
 =?us-ascii?Q?CY1iTLtJu5TvdqrbSlT8/21WHVvR1RHAu8y/bff2yAznKsVtFMY3bwHYvBJ8?=
 =?us-ascii?Q?X2cCDI1e1FA+aTzocKaaJRVgiz7cBPWuxNKX6Z6Q5OGWBhisvnfpm6c0UNEO?=
 =?us-ascii?Q?NaJbjafnD4bfr5sLdGr/AxAbP4Y1FPWX1jsYEu0vUZrE1semqElh4ayUXJYU?=
 =?us-ascii?Q?pfsnQySvSMyFGin5JUtjUKbPHRCLOH2BqsSgruSbXAvRHJ4qtkqTfQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tnyy5cp24Np5VD3b+GnICDGb3WxyMeWhvgo66AdBuD8+uTtY8zV+PEyj/Yai?=
 =?us-ascii?Q?YZAfFFrPXLbL/X6OBh691bT2bmJny+hA+6OasQfdih38KqQPU6LyBqVuvyks?=
 =?us-ascii?Q?SwACcrisHu5aTc9NMUGlMt7FxD2FksI5z+SlGMGYzazMde01w1VDrQC6v8H3?=
 =?us-ascii?Q?schloJ3QfYYRjYkLNIZZay8zeJojoV99tITKnLrV+87tb8JqgR/vgh7gVHAD?=
 =?us-ascii?Q?z8hDFJIM1rpXm/nzTLBABf8ikcH0IXXvqP+Zq4LtSUWiTpn4y164bggsPm2j?=
 =?us-ascii?Q?zUQX7VFrXJSp3a7bsTM6iaK7pJWX69qSZPAXAJkte+87qOBJFXzsyMJWZ2Wt?=
 =?us-ascii?Q?kzU/+QpxCZE6krdSm5TIqWVV1sJUITGheF026nIrxDK1biW/Lbj3RXenkcmu?=
 =?us-ascii?Q?DSrBFX/qR1zY271bKzWCLv4mBm91Vy6P4GhvUEb8fOGQyRNoas/DgmeHZDO0?=
 =?us-ascii?Q?POmN5WCNaMc6gLs3Xbea+3grES+QTVxOPPhC2oF4qeyTbTSR1pNNRgrAFTvU?=
 =?us-ascii?Q?zd5QEhH3zvh8PuVnVzRDsgk+Nr7QyzN1jB4RzU1cYs6uCwK5fveTGZjNXCSb?=
 =?us-ascii?Q?yDvLoHLZQrjoeeI5QXWTeJ1tOPbpucl5Si03Xo3QeyB3Oow8lwp5k6wX5h3h?=
 =?us-ascii?Q?JL6EvnFSfWkP0N8zh9bkYJIaTvgwihHJ+gMLJ0wH0QUlFyx6zReWaT9WKZjd?=
 =?us-ascii?Q?AK9G5Lqgh/43F3sZE3x4uNVY8uUQ4X5CmtNXvaVN4OZq7DAwuK1UTkAHIu13?=
 =?us-ascii?Q?eCnb+cqBGrrINdVjmZNHtaYfmlTnwGU2JNUNFvIXQL6CpsOCcc46GSbiFQUj?=
 =?us-ascii?Q?aROs/srtbN0Nwb7TPB4B9AN/Mzuc6aPLGbsv/+sD8yXHP+l/pEQKh+0CpqNd?=
 =?us-ascii?Q?AKc9j5iYVBIu7bq22TvYe7PkivhVsyTAQfZJAAuN2Lpmct9Nl8SgIv30WStR?=
 =?us-ascii?Q?nhD4DKl/Ef8mUc88Hxl6QQ/chiTAC93sWnmFU5PS1L14vpGiXl86CsgVW4r2?=
 =?us-ascii?Q?U8Fa5IjaP/qm8k8lY2K3n9WhFmrLd7JtdG4UJp+tSsSbIz7sDVcIAwgeQGtJ?=
 =?us-ascii?Q?GaLigVztSJ10VNAvZCwAyfVH++fMxmMRkWxYpe3TfdFLL98zEF4EXKgQxGVB?=
 =?us-ascii?Q?HprzcRvnPIzxfquRXzpEoQZJS7BX94ueNi1CVkij17k53+RuU9UwkUbi4POu?=
 =?us-ascii?Q?b45AEOqdHJZ0AEKeR4NcOXXqQdTFdk9bAal0bmYeIyXY3n8q2Sky357HR9nN?=
 =?us-ascii?Q?DedSmINkxTBA+z6k+I1mD30xLS5l4nnyaq3XTCKM2y5Hz5fliS6KsDS0I89M?=
 =?us-ascii?Q?9Qrr/mO7ABZnKc9EzITNXA7AWCFNXao8CylpLvcBbPqGVfpK1EIWBXnu3sT6?=
 =?us-ascii?Q?BqCIpXEfAbt3AE4NH4ZexCXXTRel2sGfbvOFRrCfhWJKo7w4zJlvNLDiUPNl?=
 =?us-ascii?Q?ZsGZB/71jJg1WRGx3OeE4PNqYJPyjcw+edPBVXk5ayZdPYyaO5id7qDW8xfW?=
 =?us-ascii?Q?KriEuPEd6d3/Ec1W50ft2D2rNUC0hZBp2zHN7vCVyy+Fs0xH28MC7iDrV3jo?=
 =?us-ascii?Q?LPYOMomvOvpelAOXwkdPOQ1Kw70FD0jOCf6p1EjqLRyiPT9J9TrlHReAIU/9?=
 =?us-ascii?Q?DYfpbOurz0iriWhWUodOxX0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b112a2f-0600-4c91-0092-08dddf3cdbd4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 16:24:23.8788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94rxn1nmlP3rqeGw1yzUFkiNO3nEDgXxiZL+Lkby6TbS/R2FK0z5OJ4hHteMfyc4aV4KbbGTswpH15DGOsMDfT9LcX7m7TEMoGaqiqfk8Jq2DsvjeMv/qGU1BO6xoqor
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7049

Hi Biju,
Thank you for your patch.

On Thu, Aug 14, 2025 at 07:41:10PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The RZ/G3E SoC has 2 GPT's.  Add GPT nodes to RZ/G3E ("R9A09G047") SoC
> DTSI.
> 

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 184 +++++++++++++++++++++
>  1 file changed, 184 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> index eeccd1345f71..0e6867ad112a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -552,6 +552,190 @@ channel5 {
>  			};
>  		};
>  
> +		gpt0: pwm@13010000 {
> +			compatible = "renesas,r9a09g047-gpt";
> +			reg = <0 0x13010000 0 0x10000>;
> +			#pwm-cells = <3>;
> +			interrupts = <GIC_SPI 538 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 554 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 562 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 570 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 586 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 594 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 539 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 555 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 563 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 571 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 579 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 595 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 540 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 548 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 556 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 572 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 580 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 588 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 596 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 541 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 549 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 557 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 573 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 581 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 589 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 597 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 542 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 550 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 558 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 566 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 574 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 582 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 590 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 598 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 543 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 551 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 559 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 567 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 575 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 583 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 591 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 599 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 544 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 552 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 560 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 568 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 584 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 600 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 553 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 561 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 569 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 577 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 585 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 593 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "gtcia0", "gtcib0", "gtcic0", "gtcid0",
> +					  "gtcie0", "gtcif0", "gtcih0", "gtcil0",
> +					  "gtcia1", "gtcib1", "gtcic1", "gtcid1",
> +					  "gtcie1", "gtcif1", "gtcih1", "gtcil1",
> +					  "gtcia2", "gtcib2", "gtcic2", "gtcid2",
> +					  "gtcie2", "gtcif2", "gtcih2", "gtcil2",
> +					  "gtcia3", "gtcib3", "gtcic3", "gtcid3",
> +					  "gtcie3", "gtcif3", "gtcih3", "gtcil3",
> +					  "gtcia4", "gtcib4", "gtcic4", "gtcid4",
> +					  "gtcie4", "gtcif4", "gtcih4", "gtcil4",
> +					  "gtcia5", "gtcib5", "gtcic5", "gtcid5",
> +					  "gtcie5", "gtcif5", "gtcih5", "gtcil5",
> +					  "gtcia6", "gtcib6", "gtcic6", "gtcid6",
> +					  "gtcie6", "gtcif6", "gtcih6", "gtcil6",
> +					  "gtcia7", "gtcib7", "gtcic7", "gtcid7",
> +					  "gtcie7", "gtcif7", "gtcih7", "gtcil7";
> +			clocks = <&cpg CPG_CORE R9A09G047_GPT_0_CLKS_GPT>, <&cpg CPG_MOD 0x31>;
> +			clock-names = "core", "bus";
> +			resets = <&cpg 0x59>, <&cpg 0x5a>;
> +			reset-names = "rst_p", "rst_s";
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +		};
> +
> +		gpt1: pwm@13020000 {
> +			compatible = "renesas,r9a09g047-gpt";
> +			reg = <0 0x13020000 0 0x10000>;
> +			#pwm-cells = <3>;
> +			interrupts = <GIC_SPI 602 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 610 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 618 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 626 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 634 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 642 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 650 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 658 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 611 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 619 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 627 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 635 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 643 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 651 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 659 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 612 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 620 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 628 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 636 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 644 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 652 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 660 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 613 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 621 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 629 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 637 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 645 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 653 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 661 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 614 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 622 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 630 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 638 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 646 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 662 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 607 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 615 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 623 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 631 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 639 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 647 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 655 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 663 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 608 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 616 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 624 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 632 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 648 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 656 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 664 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 609 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 617 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 625 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 633 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 649 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 657 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 665 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "gtcia0", "gtcib0", "gtcic0", "gtcid0",
> +					  "gtcie0", "gtcif0", "gtcih0", "gtcil0",
> +					  "gtcia1", "gtcib1", "gtcic1", "gtcid1",
> +					  "gtcie1", "gtcif1", "gtcih1", "gtcil1",
> +					  "gtcia2", "gtcib2", "gtcic2", "gtcid2",
> +					  "gtcie2", "gtcif2", "gtcih2", "gtcil2",
> +					  "gtcia3", "gtcib3", "gtcic3", "gtcid3",
> +					  "gtcie3", "gtcif3", "gtcih3", "gtcil3",
> +					  "gtcia4", "gtcib4", "gtcic4", "gtcid4",
> +					  "gtcie4", "gtcif4", "gtcih4", "gtcil4",
> +					  "gtcia5", "gtcib5", "gtcic5", "gtcid5",
> +					  "gtcie5", "gtcif5", "gtcih5", "gtcil5",
> +					  "gtcia6", "gtcib6", "gtcic6", "gtcid6",
> +					  "gtcie6", "gtcif6", "gtcih6", "gtcil6",
> +					  "gtcia7", "gtcib7", "gtcic7", "gtcid7",
> +					  "gtcie7", "gtcif7", "gtcih7", "gtcil7";
> +			clocks = <&cpg CPG_CORE R9A09G047_GPT_1_CLKS_GPT>, <&cpg CPG_MOD 0x32>;
> +			clock-names = "core", "bus";
> +			resets = <&cpg 0x5b>, <&cpg 0x5c>;
> +			reset-names = "rst_p", "rst_s";
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +		};
> +
>  		wdt1: watchdog@14400000 {
>  			compatible = "renesas,r9a09g047-wdt", "renesas,r9a09g057-wdt";
>  			reg = <0 0x14400000 0 0x400>;
> -- 
> 2.43.0
>

Thanks & Regards,
Tommaso

