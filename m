Return-Path: <linux-renesas-soc+bounces-18999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC5AAF0701
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 01:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFAED48164C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 23:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186E425BF14;
	Tue,  1 Jul 2025 23:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A4q+VMjl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010054.outbound.protection.outlook.com [52.101.229.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90884226D14
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Jul 2025 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751413365; cv=fail; b=j8sXVLFlcs3lipGtHnuLGwiG3YDylYOKsN/LWs7J1zINqwAOBtojSNbVOJIge35nB0PSohg6iVWfXO1FI0474WF9S+XFiln6FTOV9t+78EQupMzBq4cE2GoYuDTcqsG7GQuS0I9qxNxrLOCreFddSMhjZUJq3nxEStdrkPED6eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751413365; c=relaxed/simple;
	bh=3s97bUNFWoHjvMLPzX+hsLS64dHQmZ0Mjx5H7UaitzQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V0rE8bA+SNVG7K4hsOZVPAEt4lwcvbHEJUxuIDj0uL8QpxofCNNzmgtQEflI8cbl6hdmvxNtAInic9ksc+RzBeYje56hK0NTP4EOnULK/NqQ38WrTr05ImhIs2RANV8dUyC149cD5ro7/jGSpIXbkh+UAbdgWz7yHMPbJ2fD4Ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A4q+VMjl; arc=fail smtp.client-ip=52.101.229.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLaxWa3gGXch7wfp0+pVOC34MV2mTmEKHYO3737mCja6QsB1e5MdrJNFffWHbauYlUhWL8tihQL1Z7HSsm3BoBzI5O5Ll4hau6vd30S+j4eGVvEHmSV1CSPmpHICd2jk9F//jXJQ267dY7vjM+6mvebF9zWAZkMZOKjuVF5vclYa/70WR07bkH+T1QP71hezISQHgzJh8zqPpitcTdu6cFok9aUGVXJL59+ipISj3f7ymowUR4TQr7JbjO0C8Eynd+oykX9uZJS/ai7FWTNlI9J7d+aDeuUIhBLIbrYtk4SMTfRG1owOLxMRYloFt9bgSafkTmbsPXx06Bha1zUAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUPD4vD5yWgaD2Qd8AVG3/AG0I/2LQMQcTnFp6nSXy4=;
 b=MdbyDDS/E7N9tzvzqnN4Gt3ZRd25JIzAg99u7ypuE1KJnTHguk580Y7LttSiU1Wt9i+bu2lhg9WXtJL02p4DxSWoHpqR0ARdTM3mW8Wo4GsnNGymnPX4cL7EfWROtXd0g8zUwDvCOH4hyKNEbTOFV7veYbCfvfm7cDMIqEluuNtIqrr+x25hwLl3gMbjJ87ob39w/PADhPMy//cdZqA+0B/p51kOd2wFeeJsfEp+ekL8nOpy1eh3SQyz5sxjg5nstZeA1y5bFwyWvEqLELmrTDEM5ZIVuHFvQUxuf7B0mFsqoQygugy8/mLY0EEjV7I1Mj74NRDaDJyeNo8cBNxD7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUPD4vD5yWgaD2Qd8AVG3/AG0I/2LQMQcTnFp6nSXy4=;
 b=A4q+VMjlKTNz0FmDY4vApi8/91ksdD7zeHDsn084Wwdt+FVfSd67ZDMblKb/K3HgUNN0X2ElcyNeEv68A0BPO33LADKA1QSfU/KTPKZlX+7Dvns3uWnAPo7Hias5zSJRMUhoek0dg9FKpuE6upv+3KTwrarmdSDbV/VJ4KqqPoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6547.jpnprd01.prod.outlook.com
 (2603:1096:604:109::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 23:42:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 23:42:39 +0000
Message-ID: <87bjq3zde8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: sort Renesas Kconfig configs
In-Reply-To: <CAMuHMdVEaW-SZTxyTP8xM81JAycQh2qdWg+pLeJyEVgtAOO88Q@mail.gmail.com>
References: <877c0xhk3z.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdV6UzMRXHOEEVMe6suybLAy79+fxLTSYW_DRP8k7sfMEg@mail.gmail.com>
	<CAMuHMdVEaW-SZTxyTP8xM81JAycQh2qdWg+pLeJyEVgtAOO88Q@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 23:42:39 +0000
X-ClientProxiedBy: TYCP286CA0180.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: e3082ccf-52f1-4fef-dd67-08ddb8f8f73c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GUKyNNFityVlRL5olwElU49pwQNrDO4u8sJCTFYmYsuCnsnOVeeBITOiymP1?=
 =?us-ascii?Q?DCM3vv8ie0RSWX8PEIAXPhS70OXXZz9XT34fsUr11cR06kcSLLH5KZF5uSmQ?=
 =?us-ascii?Q?X3Kx5K0jA5jsYUtU5hQzcNCAyRURCPXwjhXWtieF0OmyechMTvixfy/Z4riI?=
 =?us-ascii?Q?uRmN5o59buRrZtoSGK4kF8l5YkJkid4JApJlTcZW3r+7/5gOVylBZKAyv8gq?=
 =?us-ascii?Q?KrNzJBoNTkCyj/4vhoeeye+5JnTqELwSoJOvx4lmjEOFINAlRtxcxOUyhjXr?=
 =?us-ascii?Q?Yn3mZ7lKkQpQ95Vn7fjeTjMULopzu2gYBa7IgNp2xDzj5W2iPd6I+CAtILVE?=
 =?us-ascii?Q?ZCaeDveVQ5S2GpqLT+LUKN9oFh43kaGgsosGblHM4DbhSXI3NHq3dc++cpYI?=
 =?us-ascii?Q?l6RslIwpxXzcqrhbl5ubTvA+Iy02ArCbZJx1FLSDOXD4j6pFnfrEnKgD1lP5?=
 =?us-ascii?Q?H4JqBM22+Vkdg73vX38+QDqEas8hzq+QfObDa5fHL6NXg9/v6MHHbiAstCno?=
 =?us-ascii?Q?vWxRjK8dhIol4WH8w9mMydLGJjcVBqm+6t03x35+PHWTuYiBtFnii6OdLFrq?=
 =?us-ascii?Q?7q/r4gnC+3eDk6BgVW4hy2naiyFT1oxznpeU9Halwe9ogsYaHTsWR/EjPLkr?=
 =?us-ascii?Q?GwEFO/xwIUUo/c1/qaUouxQf4aoq96bh3JWDALbOc6EC3pCugvHKskE1D7Xc?=
 =?us-ascii?Q?8h2K2sUq6S+vokcDBT91L0N+iHMuYLfXSRW2VNf5S+HEK4hitwIS18kiFW/w?=
 =?us-ascii?Q?u2Q82wxxlrZd9EaAiqpYonU3lsIMAJb897jQqBfsvqw8qOmPn42qH2Ysgwdu?=
 =?us-ascii?Q?LR4ZbQWOYIZnZnyZZmudOxfuMXqotDKnhK1iTmmYPe/uhbPIdeZr1C7WcHvb?=
 =?us-ascii?Q?LPzs7xIDPVKWxNDUMF/Hyh7nuynJLihP7uAjnBMKOpXiuAgrmbLV0zkQ7fT+?=
 =?us-ascii?Q?Vh9K4pCfaZbbtocxnmXMj4BzbW8gJNFNBmdwFNDPMAS9AoT0VQpgk0IIMoR/?=
 =?us-ascii?Q?E9oDY7MZuLxt48ANZaMYBn16hNEZiMy5dmJeQGd3tpcC3YzAB1OR8gDm+5Fh?=
 =?us-ascii?Q?a6eRt9IH8FM8jgG6L4ckzvxwHK5uOw438t70g1ri0ZnoDcbuqMp0W1HhKcs6?=
 =?us-ascii?Q?zFr65z5sUDcS33CXf71pkX2nFyeSWOlQ7XCQQHV2AJkba8jA8WzDzMem1dOI?=
 =?us-ascii?Q?Cv7WFGp3n1yANZJp+Y+fc+diJZdxk4gUgzov5qcCjMOCdGQPn/JVxcg0j6OC?=
 =?us-ascii?Q?pQ89Zsx8YRwvpCQLd6IpJUOuFrbF1SQDFdDEhbkhAbn0g8pvhmYCf7fL8K9s?=
 =?us-ascii?Q?HnGsTzy3jGsj4uLSMP5dkg+8rawlGjr1E48MQT0D+HzTyXB83pcz23+mqwIa?=
 =?us-ascii?Q?F4qjmcR7979PQBmWgl73IlsDW3tv9/IwVV2GDGl5v6uZ3IP6h1t4b4vjS6/V?=
 =?us-ascii?Q?hog4EwPcC3uUVmy7b6Q87tjkWl8yjlaAhIka0PJ55oUPyc8s/VOuF5oVqJFO?=
 =?us-ascii?Q?b0daIiv/qhWW+t4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s49wUHF70jy5o3JoQ3RT9C/TD6/i0ENtFVop+/FFlRhjkT9qXHArNUAx5voH?=
 =?us-ascii?Q?bbWwrW7K0ac5Ttw3OBRh0hwsiGXZDh6DQIb0/+NOc0eoInMwj2qBhTNKzdN8?=
 =?us-ascii?Q?/1e7Tb04ax2WcfTZqtPHt0o9J8uNSy67L+Fi1EuQSE0H4slKrpLT4NO2f710?=
 =?us-ascii?Q?Zid4SzRNjV3nWNgqQNwUrQ7XLg29uTgwc9c06cI3qj3GwVilTXYjv3iG3ZvU?=
 =?us-ascii?Q?WOjAlRX4FsteXtm6znjwaTC9aUrukC6xwRED8Q9SnZlVxcJrcJOp47z9zsVF?=
 =?us-ascii?Q?kN3JMAz+jBxH4TpOMWhztoIrNKRVKRyWrdVbydOIep9lSkueQ6YcjcFKJrp7?=
 =?us-ascii?Q?mi5g+lRPZDaMNmxlhmmEbRXnWw3RyopzywLZCF8V51XgB12Pjv5mqIZ10xbi?=
 =?us-ascii?Q?JjLid0qXvotvLrpFHQwvf+a52omEDP5l6vGnlm9cpKXEo1B15A6yUhdaO+gz?=
 =?us-ascii?Q?vtQutf2x17iYDODE2MvGk+HYybWoxw1bjNnKJy2zCq26vzo3ufdh8xwZ82u5?=
 =?us-ascii?Q?Z3XTntbDOisTzI/AaJyV1evrWwM40QopVvlu6huVYMiourhz6XyXT+2u/nVN?=
 =?us-ascii?Q?+2VfWk/PuuxN7+WngyVvpARaVPX4OObEJGeYqcm+MGQiEoQg+k8Hj+psc+FU?=
 =?us-ascii?Q?Hb6rM4tpPM022RF0EpNrnmYS6lS1fo1DOdI5HNhsgFf0iaAM0xhCm5LdkICv?=
 =?us-ascii?Q?afNlPpkesNxB37hfs32AVOElnhR2IvUdTQ83NVcinMJdE8T2mB8SXcoWwroZ?=
 =?us-ascii?Q?CLlhv5V0f7fFTMxOiN+MY4R72svE9HodpY+APttigBO1x1Oze8Ar5e6HaKim?=
 =?us-ascii?Q?HHBD+stmhISk0lSZZ6xYECWnrwg+fpZVHgHOAIqdPE2VshE1Ls3E75jBOlsO?=
 =?us-ascii?Q?RlF0ki5TyC08E7QmwXX2/eswOz6xBTvQmB2YOTUR3hR+vHzhIBUI3HPv6bo/?=
 =?us-ascii?Q?ucPTDLgwOSttaS4Y+tVV6SolVYCnEiYmtRSY2VOJ2B3Gs4LKsJSWAy1iw8f9?=
 =?us-ascii?Q?YLngZh6V6NIscchUXfZRU+h+OBK0INWsn3Lcfl9BQMBETfFx3e/dyTSsip+q?=
 =?us-ascii?Q?0qDnFaM3s6UXvj1myF1g98hmawCq1tnITdfKHjSO6pCPiNQeltuO98MR6mTO?=
 =?us-ascii?Q?JwtPdQvE7A9zsXFWlXkp++y4fmU39fwfzZFvFTFPZnj3jLk/jhypdUfOq42W?=
 =?us-ascii?Q?e/0C4lYKSSFqNf2oyx+goPT/PQsRhLCubjlHrNtsKDDNbKXlXNO7I+e4GJqG?=
 =?us-ascii?Q?rlz44XfH6enkrNfAK/noPfune4AlUdwx2IdTS0WZXai6dqQxzl/DBfE+cdSI?=
 =?us-ascii?Q?cFo8kU+TIH9yg3jBsgeJ0JgMKTh5jK24ixd73cFOuWprcR/8SvSKL/KofFvV?=
 =?us-ascii?Q?C+2BGM8LI0QANxdwzftNLTlxXT+IErDWVZlJFZJG58EF1S7YmFbSHHtaUqQ/?=
 =?us-ascii?Q?dmoSIfZ+uKfgPq8vZvOcigT8dDRI3lkJwz+kN07OxzxfoD74whCj+7/UVghV?=
 =?us-ascii?Q?CDfiYCrAS3gzOtOnTcpMchDURzulIJUlpdIf9zjkoOHQ8E1z20ZbsIpKuyXq?=
 =?us-ascii?Q?6Cu3uTvwQY2fQP6o3JZ5MtC/mKliDEBJe4METwlYMJ230pYVfRBNLbOV9RdD?=
 =?us-ascii?Q?gApioBKouaOmLnQVyTUHtk8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3082ccf-52f1-4fef-dd67-08ddb8f8f73c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 23:42:39.7010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omlikorwoc0IGrYj7txgaki/FUVlFKy61bem3i+x5YK0ChYPNl/JoOvjO5CG+pFCebWHXPVuq6XYZYLydDyZCfTxO24m3Zjf9df+4mVLoCKkvlK1gaI+b66i0T3a9xMf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6547


Hi Geert

> > >  config ARCH_R9A07G043
> > > -       bool "ARM64 Platform support for RZ/G2UL"
> > > +       bool "ARM64 Platform support for R9A07G043 (RZ/G2UL)"
> >
> > R9A07G043U
(snip)
> > >  config ARCH_R9A07G043
> > > -       bool "RISC-V Platform support for RZ/Five"
> > > +       bool "RISC-V Platform support for R9A07G043 (RZ/Five)"
> >
> > R9A07G043F
(snip)
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v6.17, with the above fixed.

Thanks a lot !

> ... and with the recently-added SoCs updated, too:
> 
>  config ARCH_R9A09G077
> -       bool "ARM64 Platform support for RZ/T2H"
> +       bool "ARM64 Platform support for R9A09G077 (RZ/T2H)"
>         default y if ARCH_RENESAS
>         help
>           This enables support for the Renesas RZ/T2H SoC variants.
> 
>  config ARCH_R9A09G087
> -       bool "ARM64 Platform support for RZ/N2H"
> +       bool "ARM64 Platform support for R9A09G087 (RZ/N2H)"
>         default y if ARCH_RENESAS
>         help
>           This enables support for the Renesas RZ/N2H SoC variants.

Thanks a lot, again

Best regards
---
Kuninori Morimoto

