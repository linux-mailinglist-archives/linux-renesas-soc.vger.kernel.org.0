Return-Path: <linux-renesas-soc+bounces-26324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3799CF90D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 16:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9779F3025A9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jan 2026 15:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D3E33984E;
	Tue,  6 Jan 2026 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=nxp.com header.i=@nxp.com header.b="i8xqHf/K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3AD338597;
	Tue,  6 Jan 2026 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767712648; cv=fail; b=LIzRFc/1Eb5H2I1ehHfkzds0KU0to4/yaJ+RFBDMjGFOMHr7yUk7cmw8rSKzXPqg6Uuq3KsueEVAODRxOFHECr4FD9jm/eJdIThtDUWrtKaZlZgQNk5uaMS1drEMtX6e+6SYlrxF60xbPe9xB0v6FoRVRM6t3Nd6mB6gqSd47dE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767712648; c=relaxed/simple;
	bh=gbXlQTu2w66T5cUlTvkfRqNx2UOBfAu3OpXwwky/3kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uktD4pfSnSJGTqpIwsHKSNJ4lYKzAA5TA06EWMzu8KkHvENzDhGvPnFJIBpMLb/Om1Rq9wE5xY1FLAXD9mYdYlUZJMC3WQQCG58wk9yzPLyY92+95hnMlqBqiyjQWS5luVtpjYVhmBdJucPl15YcKLAt5wLu87GWQinhMGw7n5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com; spf=fail smtp.mailfrom=nxp.com; dkim=fail (0-bit key) header.d=nxp.com header.i=@nxp.com header.b=i8xqHf/K reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.65.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2IMeY0vtwZE31VqeS9Wj2uqsnFX0uiQBS31Xfb0chDDdLIf194y7miXUIdZntYUzSVksd/KOXbTCwGhAfVWhknKGRwanyQbqln2ZMMfA3CzF0rvz8CNydhaz0BGL1RWiGjuAtVa3l6JWT0gY9k/vwAalgjyNcOLTjjJpQweyWbYHu9A8l9SVvA5UjPaq1TOnaRD5zDTgx/e7/iD43Qc9D3XA4TlSkkC5thu9QsEvSlS3vORZbES6bffYHZk4MtBfL8URtDHDVFaRZsCaB1YKREGKUbOYiIvi9Tpk+6uEXBNTxgwojrF91LDkvMCKwuUnBOYBC2q3GoZeTIWQbRMhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UomCE7bh+y6okZlExRxvE9UPfootmzKsczP36H91zZo=;
 b=yoSCe2OoyzBJfJL8NJVAp4gZOFCmmD2OQ2AvJA97OWlc5sTg6pfWnGBd4UFKjblEdseM3pvXT9U0pnbRBTnOmNDHipy/0VM5DDp6AlWx2zwRuj1miEjfz4RLabcfYkr+4wL8RtW/fq0v+8g2qS98gkCuQmIfQj27LqpH8NLMdLxjHsm0zBDxsa0GkTdZ8McF8ZS/vwmUfEzVLO0pqNDeeI5jxXAmIB/+i27YL7FbMdXM+nKeNRsuZ/r893HclEZEymFIbCGQRo6MWPhbnizQxVAiBQoO2GFqUV+4vM4ud4CYhWrlLHJ5eSttrwPxfbk6IRMGxDHeh9+u1iKfT5M/fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UomCE7bh+y6okZlExRxvE9UPfootmzKsczP36H91zZo=;
 b=i8xqHf/KJsBMWeWxco5B2vP94qq6nthrQ2QgyIbMej9neYMNVVmpjuCwDjakH8fVaxJFFK59PFvBtfMK/jcRds2iBUQnOVIQQErdZx8X1waZwcE+WZznasniolSoikUcPIDV5dbXA4YA/3VczjwiwoT20WPEb+IYRfQFrxCwhFketTM7tbjjK7QlDjcWynygatwwrQW3TTXyqkxTlJOUcpErRF77+To0+IOB60vdXrK6yqCaNKiRVtL/fYb1h3UnoNM5uOHWvu+AjF5oLmrie/0wfAYBnrC5L5VCmwKtW5lReTiqm78gEGT+r7lqrjIZ59Cgpenpd7hTPa37QQbyKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8295.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 15:17:23 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 15:17:23 +0000
Date: Tue, 6 Jan 2026 10:17:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Message-ID: <aV0neUGcqiGkE/Sv@lizhi-Precision-Tower-5810>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <94d378e99ded450ba118813b35239f9a10a73daa.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <aVvw3pjhphnVv7g2@lizhi-Precision-Tower-5810>
 <TY3PR01MB113466E129D0970F0E2541F7B8686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aV0g5j01beuz5CO+@lizhi-Precision-Tower-5810>
 <TY3PR01MB113466AB09CC77C375492A0E28687A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113466AB09CC77C375492A0E28687A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::18) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: f360756f-e477-41fb-08a7-08de4d36b044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pGjomszmvhpDON8cZA3AlfZ2w65WWBY/5Ss/Dvt51z+aNXTIPyDs2uvp5u1y?=
 =?us-ascii?Q?VugpLd8rdoKZZ4yH65sbxnJTScHcrAp56FgwMmh5U5zrD+cVHxn4Clk6KtRs?=
 =?us-ascii?Q?O4eOeC6JtqeyLQl2XLKOPdROrgcGUW8M9CTRopzeHwQHAfKgifk6LaAUlLHH?=
 =?us-ascii?Q?azcmpzLjUpVa6ECvU8il98xvTNOxzhDqsVRk8BkFfHJf4PwiOY1kTmDjRpiX?=
 =?us-ascii?Q?M7B3C98wlCXx0ToJ71TW6lFTjlvxxn/0ZaPfZRcyyQdmj46mbmiegvJCPm9R?=
 =?us-ascii?Q?oE4wq1W0CNdA/7V3jTbICMn1gfkd+QNZfkv/ZnVfBs//3iImO4JOuL2Fqt9w?=
 =?us-ascii?Q?raJg7wyDD3zdy8OJt36ri8xSumHX7jcZcej+zeeFyjfjyTMq79twnLQjMi9D?=
 =?us-ascii?Q?ip23Hla/nnCyP48c/1JozeaW1dXVDvv/aeIkiFBiMHqLW7/Pq/CndOYQAzn5?=
 =?us-ascii?Q?LhIC/cKVYblT34rpCoQLLhedcarcd84LJCxjODYaNw3GlcEANA6xdcwaGTmF?=
 =?us-ascii?Q?gzIbUSEO9E2+oUMYtl3McN0xGoAbZnhadx8hnuhajFIULjiIb9CHCEPRptng?=
 =?us-ascii?Q?XpvRT5oTUMu5oy16P+WbJKvZApTZowugrWsuCuDfrjM1sXti9KqT46DVmrAo?=
 =?us-ascii?Q?CLshW8dd4AZ5BUHmY3jGH3RrIkmtZakVvxIGRKSjCVSX/5Hec5LgdLztrSe7?=
 =?us-ascii?Q?DqVtQw1SKW4cxRfk60hNSOpJEWF7dL9lozEdFZ/KiPUvBhoHfqrFExhoJSVD?=
 =?us-ascii?Q?YBlgl+TYCbpMtNJsZtFl6J4dfJzBlKi00GKzqzGHgHT2kUgFL7T53rlVxXaZ?=
 =?us-ascii?Q?l0CFpLFX+eUcOpHuP1GDG1PrSNhH/WlVf8TiLETBUh+xFqCUX3x5Ihc4L0GG?=
 =?us-ascii?Q?+5rYg2loUf5pflY0nHmVRT0PxbpuceepWPOWIHKB1Baw4ZccWQjFOmu1/+se?=
 =?us-ascii?Q?Yxfb2DVlqCPLzB88gjX4Ta9FOZoAkxpNphAC67ZA9o9VU5NGqq1OAXlPZ6NU?=
 =?us-ascii?Q?/u12Iuvya04r0OMKzIyKqFydepRVBeeSDhImJ/aU3uxNOGkFQEs80yFU2wrW?=
 =?us-ascii?Q?PlKYODpOe3F5SUmrt2DOlLY4u3hEgSz8LzZ4wsUgec5bRQMrkhz3mpTOn78c?=
 =?us-ascii?Q?0M1WFWY9VVYYaH3rJmA5qENSgXI7nw4t+ZRnICtUIN0tyWOHdfgB4Iz4QLgX?=
 =?us-ascii?Q?qv3iurz3PaR2O/ZJ/Z9xyTfeYZKmb0LHAwYUGc7wsaTztWXNNPSxI7/p/Bps?=
 =?us-ascii?Q?ZCWhTnazpamfX1vKIQATr+Vay+Ifn5Gcd79QkalrVxmkkN3T3VEU9h/9cjuX?=
 =?us-ascii?Q?0kJQok4EJ1IZprfdJ1wc/n95OV7ARugd7AP45RIMewlg79BHUANe21Nwx3ZA?=
 =?us-ascii?Q?USLVY4sDnycIMMONHcLcCOLymbPpwormtohkyO3gyHfjlQLx2vqtiG4BUlbn?=
 =?us-ascii?Q?t3qUVQPD1bJ+DtGfqEkklhCxzFK9v0AMlzpXQOGAb+S8icHxf7eD0Jjia3r1?=
 =?us-ascii?Q?FYw/MFgxcpOT/W02DGBuMmTbJSfE2bm8CX6V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a9eMyW6nLlepCMvLhCLyLb4bcau76D+bjl+7lv8bjtUVu1wm9uirVIEXfMqQ?=
 =?us-ascii?Q?OMfU8Neg1If0NeN7qAbd/SB7rJbGMZQTNHQE4IyepIDTp125Jv9kOpf9qiIJ?=
 =?us-ascii?Q?6UGAt3fiZz3lJwnwF1KziWzTvqL9UBxjv77SBW21VCm+n71S8if29O97BTLd?=
 =?us-ascii?Q?jiAlimENvEiPOIuo1tVu2iV/C11arA1TEw1rjBmuK+RqCNH3qiqFgmXmazwV?=
 =?us-ascii?Q?6RoTAtrPUoC7mdtFMCsWuAFxoYhIpJPeQsONyJxLGEX+Br2xJpOnj0WOP81g?=
 =?us-ascii?Q?US6IaSmdzgOlrS9yb2gpfVai4/phXvTEFxGpXQTpngn13GyP4nEU0UlxLd2W?=
 =?us-ascii?Q?/bByHO6jTMDUqgO245WthlNyQeRisAuURtf7NBpo379wVUSi2amoML8XPmds?=
 =?us-ascii?Q?gJeuM6wWW9ovyI8RoyJP1qG+kzTqVFF5JwEB7Ax3jmWmU65bMrNMc9/ArPKG?=
 =?us-ascii?Q?QZCkYrXcc4AX0JliQdR66PtiflZIp/biypDp/4ld8M7p9+xQsbKZ8snS49ya?=
 =?us-ascii?Q?nnPZGV1KKKZsU/3Yol0QqdcJDnEtSTZk9ao3nzaIiXwQCDmzFLaL5tRWajcY?=
 =?us-ascii?Q?zwReVT9HV6JrYeznO517FO/Jaz0pSCKVp6hWcv3gSIc19xvyR9Z4NYuAQ4j8?=
 =?us-ascii?Q?0Whv7EHvD2xfqdXaUUad72BYWAZ3tsRN+lnJaNRGZ4j0K3YQdOFEPs/JnRjL?=
 =?us-ascii?Q?r02qWmQqn4WTABONKMHWbKiZpM+ZqjNKMiyAE9wGU4qy2uyx7/S7NuJ+sgAX?=
 =?us-ascii?Q?mMP8QRvoO9aQAHsJM5V6/wafKoWavwcWPhwjRzar2nSJD4DtoR04LRQSeqMH?=
 =?us-ascii?Q?EpiMiDXp2FZQAUB5wzb+pkLlTshhQ48gIkHOGVa89B2YA0mSM8cpKITnkmY1?=
 =?us-ascii?Q?Bu0gLclpDRoEQoxaNGYaUJVDO12GXSw7tZYxnbdvRQY1Na6pQT+ELScg/vUd?=
 =?us-ascii?Q?fk8YKa5ehwjWmckInIdBF7ph4SEbeSjWgo0JhBD96EVTCQo/N78l8RO4ez9Q?=
 =?us-ascii?Q?cGlB2AwnJIncU4U3cS+tk3baavb9bkrIdibwRSw19RjHzBe7ElCiPtr5yQre?=
 =?us-ascii?Q?7wqjXFrbG6j56kmK+CGgjkmwEenS29db7XQwLafXw08PkhYdYloMtXs4eKsv?=
 =?us-ascii?Q?fQr7QvvwJgBX1A8l6ltyxf7UEBJ+C4DMouvFpVRGK5iENluWbK2FiFt0ytu/?=
 =?us-ascii?Q?0dCkQGLKHe4tzT5Dd/AoTVsUzv2e7EsAAX8XLbTlaYUQvlPKDMh1xCDbBLDf?=
 =?us-ascii?Q?mLoqJEkjO4nr25YSwkqcNvyQ+Gnfo7GzGhc74nQv9HbkvPFKvhzSZEsRKXwE?=
 =?us-ascii?Q?q8bRQ33zmeQxjCp4gGhsFtuYGo55RECjQ/3Hmd9XMRr9RAnoyJFSm3vAne54?=
 =?us-ascii?Q?yyv59VmR8M6tmQspQ8rhN0yrpH18Uqzruw/QqxYz0xw5TGGWlP2iCMC0spbp?=
 =?us-ascii?Q?sAK3Nne0O6JkDc85hdJJx8LjqEN4bjmv/nytI4tQN8Z8NUTzELruJeBjYvOO?=
 =?us-ascii?Q?9YOgIQnve0QPfcjMZqk4UxaG6/zuNKpwgMRUEoHrcJ2bC1IvbYVSwxFJZWJZ?=
 =?us-ascii?Q?F88drO3dLUeW9q6+4IK8C2+t4Hr6lET7qx9YWTkmbwS787NWB/XXCW28Fj6e?=
 =?us-ascii?Q?IsyhwqWXxpnDsyC4rkgUdrURIrwRVOQhaPVlvX3ipt3fyaZUrZU4BqN1bkCg?=
 =?us-ascii?Q?dO+Qmc/j7sA8hZnXO2krOwQHuZDjaXH9LY6hD/p8wpMkeGpy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f360756f-e477-41fb-08a7-08de4d36b044
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 15:17:23.3837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpN56BltTpZsx9w9wbPUeG895yEFzdBwDfKqPhL+JJAzKG+yeSrdJWOKbeECJ7zvWtZfYh1N2wvvO1LIXvRxIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8295

On Tue, Jan 06, 2026 at 03:01:49PM +0000, Biju Das wrote:
> Hi Frank Li,
>
> Thanks for the feedback.
>
> > -----Original Message-----
> > From: Frank Li <Frank.li@nxp.com>
> > Sent: 06 January 2026 14:49
> > Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store clocks in private data
> >
> > On Mon, Jan 05, 2026 at 06:06:19PM +0000, Biju Das wrote:
> > > Hi Frank Li,
> > >
> > > > -----Original Message-----
> > > > From: Frank Li <Frank.li@nxp.com>
> > > > Sent: 05 January 2026 17:12
> > > > Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and
> > > > store clocks in private data
> > > >
> > > > On Mon, Jan 05, 2026 at 11:49:59AM +0100, Tommaso Merciai wrote:
> > > > > Replace individual devm_clk_get_enabled() calls with the clk_bulk
> > > > > API and store the clock handles in the driver's private data structure.
> > > > >
> > > > > All clocks required by the controller are now acquired and enabled
> > > > > using devm_clk_bulk_get_all_enabled(), removing the need for
> > > > > per-SoC clock handling and the renesas_i3c_config data.
> > > > > The TCLK is accessed via a fixed index in the bulk clock array.
> > > > >
> > > > > Simplify the code and prepare the driver for upcoming
> > > > > suspend/resume support.
> > > > >
> > > > > No functional change intended.
> > > > >
> > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > ---
> > > > > v3->v4:
> > > > >  - Collected Biju Das tag.
> > > > >
> > > > > v2->v3:
> > > > >  - Added define for TCLK index.
> > > > >  - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
> > > > >  - Improved commit body.
> > > > >  - Dropped unnecessary static const char * const renesas_i3c_clks[].
> > > > >  - Removed the need for per-SoC clock handling and the renesas_i3c_config data.
> > > > >
> > > > > v1->v2:
> > > > >  - New patch.
> > > > >
> > > > >  drivers/i3c/master/renesas-i3c.c | 43
> > > > > ++++++++------------------------
> > > > >  1 file changed, 11 insertions(+), 32 deletions(-)
> > > > >
> > > > > diff --git a/drivers/i3c/master/renesas-i3c.c
> > > > > b/drivers/i3c/master/renesas-i3c.c
> > > > > index 426a418f29b6..1b8f4be9ad67 100644
> > > > > --- a/drivers/i3c/master/renesas-i3c.c
> > > > > +++ b/drivers/i3c/master/renesas-i3c.c
> > > > > @@ -198,6 +198,8 @@
> > > > >  #define RENESAS_I3C_MAX_DEVS	8
> > > > >  #define I2C_INIT_MSG		-1
> > > > >
> > > > > +#define RENESAS_I3C_TCLK_IDX	1
> > > > > +
> > > > >  enum i3c_internal_state {
> > > > >  	I3C_INTERNAL_STATE_DISABLED,
> > > > >  	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
> > > > > @@ -259,7 +261,8 @@ struct renesas_i3c {
> > > > >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> > > > >  	struct renesas_i3c_xferqueue xferqueue;
> > > > >  	void __iomem *regs;
> > > > > -	struct clk *tclk;
> > > > > +	struct clk_bulk_data *clks;
> > > > > +	u8 num_clks;
> > > > >  };
> > > > >
> > > > >  struct renesas_i3c_i2c_dev_data { @@ -272,10 +275,6 @@ struct
> > > > > renesas_i3c_irq_desc {
> > > > >  	const char *desc;
> > > > >  };
> > > > >
> > > > > -struct renesas_i3c_config {
> > > > > -	unsigned int has_pclkrw:1;
> > > > > -};
> > > > > -
> > > > >  static inline void renesas_i3c_reg_update(void __iomem *reg, u32
> > > > > mask, u32 val)  {
> > > > >  	u32 data = readl(reg);
> > > > > @@ -489,7 +488,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> > > > >  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> > > > >  	int ret;
> > > > >
> > > > > -	rate = clk_get_rate(i3c->tclk);
> > > > > +	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
> > > > >  	if (!rate)
> > > > >  		return -EINVAL;
> > > > >
> > > > > @@ -1302,13 +1301,8 @@ static int renesas_i3c_probe(struct
> > > > > platform_device *pdev)  {
> > > > >  	struct renesas_i3c *i3c;
> > > > >  	struct reset_control *reset;
> > > > > -	struct clk *clk;
> > > > > -	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
> > > > >  	int ret, i;
> > > > >
> > > > > -	if (!config)
> > > > > -		return -ENODATA;
> > > > > -
> > > > >  	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
> > > > >  	if (!i3c)
> > > > >  		return -ENOMEM;
> > > > > @@ -1317,19 +1311,11 @@ static int renesas_i3c_probe(struct platform_device *pdev)
> > > > >  	if (IS_ERR(i3c->regs))
> > > > >  		return PTR_ERR(i3c->regs);
> > > > >
> > > > > -	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
> > > > > -	if (IS_ERR(clk))
> > > > > -		return PTR_ERR(clk);
> > > > > -
> > > > > -	if (config->has_pclkrw) {
> > > > > -		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> > > > > -		if (IS_ERR(clk))
> > > > > -			return PTR_ERR(clk);
> > > > > -	}
> > > > > +	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
> > > > > +	if (ret < 0)
> > > > > +		return ret;
> > > > >
> > > > > -	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
> > > > > -	if (IS_ERR(i3c->tclk))
> > > > > -		return PTR_ERR(i3c->tclk);
> > > > > +	i3c->num_clks = ret;
> > > >
> > > > Need check num_clks > RENESAS_I3C_TCLK_IDX to avoid outbound access
> > > > at
> > > > i3c->clks[RENESAS_I3C_TCLK_IDX].clk
> > >
> > > I guess dt binding check validate this as well. Eg: a single clk
> > > defined in the DT instead of minimum 2, will give DT warnings.
> > >
> > > Do you expect additional check in C code as well?
> >
> > Yes, worry about a wrong dtb cause kernel crash. Direct access
> > i3c->clks[RENESAS_I3C_TCLK_IDX] without check is risk.  if clock wrong
> > i3c->in
> > dtb,generally, it just impact function. but this may cause crash. So I suggest add addtional check
> > here.
>
> OK, to avoid a crash num_clks > RENESAS_I3C_TCLK_IDX check is sufficient

Yes,

> But it does not check whether tclk in 0th entry or first entry.
>
> >
> > Or search 'tclk' in array i3c->clks.
> > for (i = 0; i < i3c->num_clks; i++)
> > 	if (!strcmp("tclk", i3c->clks[i]->id))
> > 		break;
>
> But this returns correct index of the "tclk"

This is just more flexiable for clk schema. If your schema is simple enough
check num_clks > RENESAS_I3C_TCLK_IDX should be enough.

Frank

>
> Cheers,
> Biju

