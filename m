Return-Path: <linux-renesas-soc+bounces-12526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E42E2A1CDEB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 20:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A533A3A7A00
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 19:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934C61714D0;
	Sun, 26 Jan 2025 18:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XnamGOXX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97EF15747D;
	Sun, 26 Jan 2025 18:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737917962; cv=fail; b=mgOrRduPwlF7HYIkvDjbZgLkRWr1NNCIhLqEsQXc8RqZcZd/8eaPaUPmBjTsWmfLi/cfzmOYh+lecPiistAwfMtk78J4hBur4CQeaLsfOKjU0E/IKyZ3ix3+lsk98JdZ3lKwxEcVG6/scXhNjPjx+6SdGaryNEql7MFSUCsuXqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737917962; c=relaxed/simple;
	bh=NEIOIlX/OuefyXRxhBFA4hrUUhVhiJFhsGtFV4/uaKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qPdbjjXJFs9cx4+df8Bz7I0IVOM9KmSJ9YzHrUO4Aa+PPRcCBgwbPzcXQUan5yBoumGae2p9xxhXkfG9aZOLA1gGvMKAHptlTbTcN55Pbi1hJzHpAiE8LDGBdEqPnY/pDI0Q7n/+p0vvg0KpEErOSaF9nCg+wvzHsVgXd153UBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XnamGOXX; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orrEBpKbAl597E6lcdZSmC1xgvQAibzdA7OldvLXlRNvwiGt4gzwxmKkH/1vN5QYQ3NvqQeXob7PBd5/SETJecC3oUOW5FuV15+Di6vp3ZdMVRh1Y/PAkOGzwFaY/32DPQcg/pe/eolrFiqRhOT8ajw1sKcU8tJdqX+aPGhw6oE4VMUghobBZiqXgoPpOcMSfMIj4+FjrgFjNAkErztheR7LDFnN+wKwX2rP7mlTGm7Km9+G4w7nmcQmOtDyO79einpo1vV1KWbPXHgAuA2L4NrNgYK3UuUZPws3IRO0gSBxfGA0risZVzmxHM0J2thhTLJ3CER/a4x9TwDo2N0v8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vObn2IP63NWvaYoKwLzXtlc4QrhseRYWuaXdwPUFShs=;
 b=Xmd0d/RZHXGVkt9evxVQ3drkyaeUfDPY3XSL7SVzhU+hJDWBwdz0IHEvJdoxO4+DPBjoyf3Sk5WToQyp4mBvjrVbnd7mtoCfpzr0TYZ2lGSTytW+VXagZiR75Y23whzKIa7D6chHfJZYSVjF7k4Xpf41OKqw/ycvHcTdBmerNYXCeLczDksIEhBxhgnlGDpDai8CbByXuB18feIfuUikaD3M7NqR4GC3gPBZ9Nt/Anr8aUMSee+L9K03Ks6CLpHxgiCtm3MKNWdEkG3kGVQf/J2LQmxtqxV4RW6kchcqnILZbkbHx6D9M27jAS5ZkThgDp3/q/0VXlRdgkkhBPzXpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vObn2IP63NWvaYoKwLzXtlc4QrhseRYWuaXdwPUFShs=;
 b=XnamGOXXcQyJJhEwQ9M7xMuiSL+E1jpaYiXPTqTKqMPKhH3+iAIIxBxGuRZTauOdl8EDLbTKBWPk82E9XFxb/BpWHkbeMcu9mUmWkN/fqphl4QAiqYNuxNKEpRLv775g3zRTxvBjYbYLzGJLZerD45tQUn3jVPDbKT0rhBD9w/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS9PR01MB12308.jpnprd01.prod.outlook.com (2603:1096:604:2e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Sun, 26 Jan
 2025 18:59:16 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 18:59:16 +0000
Date: Sun, 26 Jan 2025 19:59:07 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 2/7] clk: renesas: r9a09g047: Add SDHI clocks/resets
Message-ID: <Z5aF+xnQNU5s/eC1@tom-desktop>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126134616.37334-3-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::16) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS9PR01MB12308:EE_
X-MS-Office365-Filtering-Correlation-Id: 0edab46b-e20a-4d26-d68e-08dd3e3b87e6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1ypcGoiays3i42QJGTHJQNajfsKSSUGVFYsD9SOZTzn7Z5D6bYSrSn5wGPtx?=
 =?us-ascii?Q?pdtmR6/BhVKTHTHC+FcfZotNNapUdLTyD95r8RjfrUcAfjDZgliyEJRt4tgW?=
 =?us-ascii?Q?iEaGOGg9Mb6BxHcMQoLdw3lxa6v7l4ALAeZFU8phxXk25gxjUGcPdUD8Rzgf?=
 =?us-ascii?Q?mu8Ul71gwFD37NEbYctw1pFByOUboYJI9svhcnYPSUp9SH9lwWDf9v0qqDxk?=
 =?us-ascii?Q?HV8hRm3oh7TXHofJlHGbkGSL9RdGZHw0o5ZoSlIG8gsitFbiCqpTr85ozclo?=
 =?us-ascii?Q?VIXPv1eFfJdZQQTgsE8hcLA4RH4hNIElyDBWdJUoHuXu6e3107IutCX/YZpo?=
 =?us-ascii?Q?xCp8gJRiJzvakbQlSDeD7diFZlJYNCew97+H0M3kDNFCmFY+z3R5KE3Qmm1c?=
 =?us-ascii?Q?7KkhIOD1TXv7+RxLtxvbjQiJ1fr8sq/GQUIXK5X99rvJldmy48ANy6iDNxOP?=
 =?us-ascii?Q?wX70lQfPQ2kD7/y2njtqDZ8Ms+WNCU2hwDhyjIy7qekX/voXuZ0uVf/YvRjv?=
 =?us-ascii?Q?+FY3MUIgJc+dLNKT6EOfEfwiAnM+maNYxoSqaKuXVSyaHEo/SfRznroxg7g3?=
 =?us-ascii?Q?m/smB7hFJxQMubbvRHw/STLb6f1334JVb1HMdnZqiJniLoOubPXssIuoanY5?=
 =?us-ascii?Q?Tp4v90sUhDrbMW+edNUPUfU5qbKVv8xBbPHwNXXxgEg2COU8oNOtYYlk2vjd?=
 =?us-ascii?Q?24K9lhlre+pE4E83gr89ZZwF2ObvQYBtc0wsFsy+VB1WVvC6Fpuj0Cq+a688?=
 =?us-ascii?Q?QI7m1P73YtEpIsszzO9V27d0UJ2KBKXGe0dLBSl+yNEgPD0shIyhcZ5M9OYd?=
 =?us-ascii?Q?YHTjDFK2TiFW2VSlI2DSFe1Jb1GBhFfRoEN1hhTReXktcw0BwmJtkfnb+Y17?=
 =?us-ascii?Q?9JKY0FX6xXfZcNOYwx8vUNhwEyh/wiMZ3N/Tmkdol6xkAmVTbsfWHaCiw8Fu?=
 =?us-ascii?Q?GlpUbC+86vCBykAiVX79/ApcuvXC3SC549sq7n3Owda9vHlaF6U/saR5BVyv?=
 =?us-ascii?Q?Uqt5ybbzhBZEgw0PrR/AIfK7l2RsLWg79wC8DDRhAHYwuiNk4ZpU8oRJkaQa?=
 =?us-ascii?Q?UN371+rfqVF8ADL35vE39PATxLm2uyX2dokYPjFjxHWwwx2uWmalTEIjzrJ9?=
 =?us-ascii?Q?0W770nrguxH2PMdBKAjmrzSuFNRl7wWztfCVUuivc4TQrYMxDnB+ulldmNTx?=
 =?us-ascii?Q?ipxoCOoPifCF7wn6zXqDtAgla7xPl0MTsB7MQsQGMfT4a8ExIl20r51jFV6h?=
 =?us-ascii?Q?RonAuFgSUiXCp68X4fgVaZ/73kiKdQfgTODUVCUiSEFxkOyj2fna2evH+lek?=
 =?us-ascii?Q?74NM75vVzmNnXAyrSQdDvaR7yAIKqBqwXevTc2VQfEBwljEol7ej1eYCoUEu?=
 =?us-ascii?Q?wBldcaYZ1YC095KlqZLNEVI2RsL+mHqYbBEF4+mOB+3yoESYqg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+i2Nlu1QAxD6K+k7R3qutVqEAQKaOeJiEBX714B0K6AJoXoDmK/7cccSlSF7?=
 =?us-ascii?Q?/i7oorMa/fE3XjrU6WcHiB+sbIhVs/6cpbrhkPs0k96OxjJjH5/c1HN2vYNo?=
 =?us-ascii?Q?1R6JVnRJnA2dQXlt4+F+MzfV9FpxgHWETqi/wlEkSaik/dg7VBZXtZuxotub?=
 =?us-ascii?Q?8tyt84vGVBUw17ZNV4/L2Gb8MLRWJGFxIWRJ0+/se9OCG0joxPeJD6Cp9acG?=
 =?us-ascii?Q?j5Bw4NDLFQ8odNTfAhCVlsgAijapvwe9p1aNz9x4Mvm/wh9NE3wxJPVcR05D?=
 =?us-ascii?Q?zJjvwxILH6yT0tClROcHokewGE6lYaSNRavu1v8LaAMDSK9IpcaZyH3qwavO?=
 =?us-ascii?Q?yuxGyHkjxX7VDvInVoCIk2AwpckSYLL/54yh66bvUu2PrrNLHxLA/3dvcSHw?=
 =?us-ascii?Q?Du6OEtaPoY9nP+0B6og+e1aLTHS/wzcoqh7hoR0ZAU916ezBH+27/XlWGkeS?=
 =?us-ascii?Q?U8L16lSk3GSiehGw6uiIKf2YJuZ/ZH7ssDjTDAwTlXxQa4TMOfyV9ACoKByS?=
 =?us-ascii?Q?PJ3fP4xlzaHSJQQAZapYI/LxpO676wwgpHCvTUZD6VldCnbxhu0whvnLsrDr?=
 =?us-ascii?Q?rHZBzyRbzna22e8v3xjiO+Y/BxM1lGTuoldtVy0hTKDzLmoJVni49xqa2mgA?=
 =?us-ascii?Q?xuYgAg5IROcgHAPKnujdEFEQeVC5a3I+9BUk6zjcOl25tTt881+zdu0OqB6d?=
 =?us-ascii?Q?2zVWMryMtp0JHeb4pcjwHF9bfQ8PA/dTLWIgw1Vd+ZoxCU2Pa3TZr3p35Ct/?=
 =?us-ascii?Q?GCtuDeZJNERnkQ4RjMMtLOQPGbXOhWTOu1vhg1LOqKXySZe1VSDfJPdBW3pD?=
 =?us-ascii?Q?6GuBT/x2ITnPY/SsxZXLvrplZHYrEavJyZFB7TDXxT5U+q+BsBvpwZMJgII7?=
 =?us-ascii?Q?o+6Efunay43lJBo8/bwSA6o9FVXv0p4Dc7Q1jpkJpimp7rRtn/upR/y8Fxah?=
 =?us-ascii?Q?F/dryFBVIWjEcjpjBpHW2bbjO9nqvPrsiARd239EUHhhN2c5kctoqglXswoU?=
 =?us-ascii?Q?yyHk/sXSJY2y2TBU526Zg3LIjTtqXbwE3fP+h+MuxORIwD+2qUOGsxLMwUaf?=
 =?us-ascii?Q?eY8tP6kZeUiSiyRAmVAX2o30xnwQ0JsK3FaaMBd95gZH0/Spl6VTZYW10zPf?=
 =?us-ascii?Q?btGP56K44TS+dMUNVmL/OAgp9NkzpXwVYWwfNa/wmR3YR26z8j7U/x0sRmdV?=
 =?us-ascii?Q?xMcdRtoEej5g1DYZDCgUitkJhwHpsGWYbRLlaiO9N4gATjYtWacCZcrsOVZS?=
 =?us-ascii?Q?1gf2034m7xy7Gdxa83OPzJDWp3kazjCV4TzLoKxzur2Wfn4PiRY8h8w1H5X/?=
 =?us-ascii?Q?B+siIIOm9tYUHPYgDyDZ8dc8gRdx1imQwg0oMed1UxzLvoH6zuNkRUfi50MX?=
 =?us-ascii?Q?TVCr7krXgbFj5VjRiGB8idSUFNHllMP3l646gl1FkqiHIZ1/db06QI34YitG?=
 =?us-ascii?Q?q7IEwHka4MW97mURDuW7vzO3VSb15SP1IEAZ3Nzg2OwbYRabFD8CJ4vhdVPO?=
 =?us-ascii?Q?iVbrE1XKjJoDnXB9EMz2XIfQIc/+Ubz0El0aGS6Y9qzqvT5hKxHoZTV5Dsfp?=
 =?us-ascii?Q?Z0PoJHD8ff7Mb9DZoyPhaE71IHkRiSo//up675eCIUo/hscS7uo/BIcTJJZ5?=
 =?us-ascii?Q?Rzao4R3CzkkHuFsoOuOia4s=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edab46b-e20a-4d26-d68e-08dd3e3b87e6
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 18:59:16.3507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVvAwTJ1HnxJLJaSMHrT9puqVmfHqKW42Rzhj8eBt9HldmvOxlbC1ddl7QnxEIEVF10mltwfoOgRpKgv2phfm3tNucDVf+rsztuVZo/shocYxn1rNl8Vl36xPrB/gfoP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12308

Hi Biju,

Thanks for the patch.

On Sun, Jan 26, 2025 at 01:46:04PM +0000, Biju Das wrote:
> Add SDHI{0..2} clock and reset entries.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch depend upon [1]
> [1] https://lore.kernel.org/all/20250120094715.25802-3-biju.das.jz@bp.renesas.com/
> ---
>  drivers/clk/renesas/r9a09g047-cpg.c | 31 +++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
> index 1181e7b605e8..51fd24c20ed5 100644
> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -31,6 +31,8 @@ enum clk_ids {
>  
>  	/* Internal Core Clocks */
>  	CLK_PLLCM33_DIV16,
> +	CLK_PLLCLN_DIV2,
> +	CLK_PLLCLN_DIV8,
>  	CLK_PLLCLN_DIV16,
>  	CLK_PLLDTY_ACPU,
>  	CLK_PLLDTY_ACPU_DIV4,
> @@ -71,6 +73,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>  	/* Internal Core Clocks */
>  	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
>  
> +	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
> +	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
>  	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
>  
>  	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
> @@ -126,6 +130,30 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>  						BUS_MSTOP(1, BIT(7))),
>  	DEF_MOD("riic_7_ckm",			CLK_PLLCLN_DIV16, 9, 11, 4, 27,
>  						BUS_MSTOP(1, BIT(8))),
> +	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3,
> +						BUS_MSTOP(8, BIT(2))),
> +	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4,
> +						BUS_MSTOP(8, BIT(2))),
> +	DEF_MOD("sdhi_0_clk_hs",		CLK_PLLCLN_DIV2, 10, 5, 5, 5,
> +						BUS_MSTOP(8, BIT(2))),
> +	DEF_MOD("sdhi_0_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 6, 5, 6,
> +						BUS_MSTOP(8, BIT(2))),
> +	DEF_MOD("sdhi_1_imclk",			CLK_PLLCLN_DIV8, 10, 7, 5, 7,
> +						BUS_MSTOP(8, BIT(3))),
> +	DEF_MOD("sdhi_1_imclk2",		CLK_PLLCLN_DIV8, 10, 8, 5, 8,
> +						BUS_MSTOP(8, BIT(3))),
> +	DEF_MOD("sdhi_1_clk_hs",		CLK_PLLCLN_DIV2, 10, 9, 5, 9,
> +						BUS_MSTOP(8, BIT(3))),
> +	DEF_MOD("sdhi_1_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 10, 5, 10,
> +						BUS_MSTOP(8, BIT(3))),
> +	DEF_MOD("sdhi_2_imclk",			CLK_PLLCLN_DIV8, 10, 11, 5, 11,
> +						BUS_MSTOP(8, BIT(4))),
> +	DEF_MOD("sdhi_2_imclk2",		CLK_PLLCLN_DIV8, 10, 12, 5, 12,
> +						BUS_MSTOP(8, BIT(4))),
> +	DEF_MOD("sdhi_2_clk_hs",		CLK_PLLCLN_DIV2, 10, 13, 5, 13,
> +						BUS_MSTOP(8, BIT(4))),
> +	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
> +						BUS_MSTOP(8, BIT(4))),
>  };
>  
>  static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
> @@ -146,6 +174,9 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
>  	DEF_RST(9, 14, 4, 15),		/* RIIC_6_MRST */
>  	DEF_RST(9, 15, 4, 16),		/* RIIC_7_MRST */
>  	DEF_RST(10, 0, 4, 17),		/* RIIC_8_MRST */
> +	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
> +	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
> +	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
>  };
>  
>  const struct rzv2h_cpg_info r9a09g047_cpg_info __initconst = {
> -- 
> 2.43.0
>

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

