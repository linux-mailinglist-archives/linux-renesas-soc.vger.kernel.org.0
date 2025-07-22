Return-Path: <linux-renesas-soc+bounces-19608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82AB0E33C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 20:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71CE75466DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 18:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EBF20B81D;
	Tue, 22 Jul 2025 18:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h4cxxjnq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012029.outbound.protection.outlook.com [52.101.71.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E648F28002B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jul 2025 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753207754; cv=fail; b=u39nQs0B2GjAAGIhNVixpXAh4JTzgk5btPnaBJCMHUaxrIE/j0w0we74UWosSgWq1cUeqi52SdjFaILTwJqPCioBnXISdGH3ETo8dIA/Ftz21k7oln6/Kec0PTv728BVsl8gZInh5jBejabh8Zr4kPnzsV68e0kcQQmkF4ClySU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753207754; c=relaxed/simple;
	bh=hHe5N05oV2t7xhAm6h6yEdSHyGx5MzRVBXqYQUJ0bic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rRuQIinSb3UDRQH71A9IgVK7BM/i9+/26RJ/Qrl/wmXei2fCCH6NZp1BlqM2ZWUXnfi1of4fQDZ3CLfA/dkU6enQLVmuz+iJFaWDQ77uYllV0DL51395noaJujmVkuBJSnfpMBYprFxXYF8Jx/oo1gbl63Us/+RjJuwD8VWySgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h4cxxjnq; arc=fail smtp.client-ip=52.101.71.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PI512PUX72ll1LPOvjYMvoFXNyXPun89brw5yRG17XV8g47ZmneYR6FYjafGfP21F9vrbfUh8Y2jKULjDHNOd6Su4y3GsJ+SCxo6BM8W9Qj8XW1fSwNEy3Q+NAn2Xxk8oA+jZXdqszPS4S5hEoMcFKCH2vc31AGraHGWDGZ+Aaex7IxzyQX6Mx2Xj/glJCOHpe4p8a3TQ9oed9ir8daAqYadjra1T4xci+FhRQcWDF0eusdMRsjspXHirGdowhWWF30RvX0J0MX7wSB/3GxpxkcycYOwkrOQ2BC9VlI4Jwmn7hq7qPIoETWtSV8G3Q8qEpwZRmbrC3elqNuqJjUz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIHMmLrM4joIDkQ44SyG9217BdG2F7MIvls+7hqbVe8=;
 b=idxUOzlkPXeMU7xCH1J+nXJjpNxcFwuR0VnAqbnXchs//Hn/9eG3m7y1RB56gDC8VuzYLuFNYdQApmQars9pkTziOFUwhbRkJULCjmmyGuknrbEhUdvR+8LuAf+7as7Ls4R4qE+6W/XK8ssUaHgLB2vr4ZQoUyPOznS0uk0FZd+DnCyJkJ4KcMzNaS8LtGYTTav7AZPjVliEiTs1dtghOIChjckn7ijP056Y19L+sXDOj58pF+kJWfJxUYh59rxQCbuuzKGiroPJGziWINpA9GtNdOO7Df+hr8SukF1n7DpekbJ39KMYh81WedPIwQvJ539369inq9EVk7aC39tKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIHMmLrM4joIDkQ44SyG9217BdG2F7MIvls+7hqbVe8=;
 b=h4cxxjnqD71EBVHoLLVpZb3JF/YBJUp1oyu1vNrMTShniNXoe8NOwPwjr7wZhcYJBBrQuPuMb6YXepUphX7lJxT7BREsuRPyoK4kzQuqTM2/mCsIus+zX73B+BfwdVl+D7MCZvPK4rd2ywk2Pi8HlndK5bUkepzd1J9iTwKPucZjWApuDx3qnGtxay/vVNjpNUblA6DGwMNXNqtR1q1guo9UUYkmqZeJNMDpMzWchEBuSqpsMYrbaD46ej1YyInlhG6LMpTkPAJTEk/zbiFueyF6tL9f4j2dC8RnXTzqkKgrAuFnsNrFzXxeynVUHoblXCb0i8wNcs05obaFzuRj7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7675.eurprd04.prod.outlook.com (2603:10a6:10:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 18:09:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 18:09:07 +0000
Date: Tue, 22 Jul 2025 14:09:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v3 1/4] i3c: Harmonize defines representing specification
 parameters
Message-ID: <aH/TvfTuBC9namTL@lizhi-Precision-Tower-5810>
References: <20250722153445.5003-1-wsa+renesas@sang-engineering.com>
 <20250722153445.5003-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722153445.5003-2-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AM4PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:205::24)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e0bc07-2860-4278-5baa-08ddc94ad95e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7WcKU3AxsoovUaLGxdT9Nw1+WEsId7aOi9h2rqgiDBlKZflMfgluG0Ya3Uff?=
 =?us-ascii?Q?5fYdrUow/lPA5gib7O65mjR4XZ3iCUU8HvzEzA+SDHScq51gqZv1YCLyaCwl?=
 =?us-ascii?Q?yK0vHkyLrCTl+O00tb8gMg0xVv/U7YU2f/NvL1BYAkNb+z93xG995svbpnvF?=
 =?us-ascii?Q?D+jpd6rU4tJCkOlrShsBcgWyN4KDEB1SuucwTdeM4qOtw5W8Dqc+3QJo9iW/?=
 =?us-ascii?Q?k3eQ+kZrepEEUfIovTFPAV8Phjda0N8jkCMXnu4yh2qoy5M4p1oe3t/gd/R/?=
 =?us-ascii?Q?cT3tSEbSMzTMfhs4nAxOve3SXte6YZUyXE09MQfHZvwOI/knzyYhvEYDgW4M?=
 =?us-ascii?Q?bqIKlgKOoR/YwE+yGzdAfaHe5BiYYhZopx3vEEpWWX21sI6PDleq4lW20dU0?=
 =?us-ascii?Q?ec3cUg24iOJfrgPNVzymQWY+jZ7KedneF0sVAqe1zHCn8CkdwVMP7WavhwVA?=
 =?us-ascii?Q?rZ5FLMua6uC4YnqahJQ4tuzqsrtNf7P90z66DJkHFESrzb0brPI3JCco+HdP?=
 =?us-ascii?Q?gGwb7+HBPGAl8gVwxl8JDTaguRGoaYSLdcFAdhoerfE8lQOZ7lbSFMH0I2WS?=
 =?us-ascii?Q?jUm/TXUVIF6VlERWuhFUV26K2FqAN/VkrcntQxtQIDhRyUBCvrfZX9wF6NLD?=
 =?us-ascii?Q?ZvWynrm4RP8fAB21w8bsWH0wp85Z87JFwrA0BGqdWMUo7doKz1hLBTcFWBFr?=
 =?us-ascii?Q?LHl+XesoQlE5csIFiqOugs82agTCtDSyoagLOSl8flqfPQzv8xaLHP+79lo0?=
 =?us-ascii?Q?+4Q24NDxxkQvZrKn/VHszfYD33b7X+IQgDspAgstfPhzjCQRuDyfYR/QXWr4?=
 =?us-ascii?Q?gHRDLq2YRcxX3QnzvT+BWv3tmYn+sO7XHf+AWo3rzT7biHp34RWG3iKMtFRV?=
 =?us-ascii?Q?NlHbUuSWE2k7vwFKlRoFY6KxWjzt3fVWrw7Cba8F1F/mFTLw0PqMxCo+/e1x?=
 =?us-ascii?Q?UdGXqYOdmjeEMiR3sJq9ESdvsDL/7juOoND0Cg0bO2iEna+I/5GlQbUu7ohq?=
 =?us-ascii?Q?HmK+IfWFSlExnklQvs1ZnY85z33MBXRMavLZH5KXmSKiWbvNr7P6q7S0eRwS?=
 =?us-ascii?Q?YkvbTLMamY4YYHTOR6cuA0s5h0xIKJ+gbvCyroODOC+kr7mLZiVAtg/U3jhB?=
 =?us-ascii?Q?01cVvsyLlIxc1GGyd+CVu/34fNXIFbU+0xFXkn3ZObF3/+W+HH3zrLAC7OqS?=
 =?us-ascii?Q?SuhrQVuVdNhmZGCzFTlqOUWjycJqETyuUNCQYS8OIfwFV4hbnOYUgbM+daNm?=
 =?us-ascii?Q?awQMi24gmKbJt3ckQkCErdCnkZkc+ky9nFD+aBtCM3+hv9hmIPxef/rJ44DM?=
 =?us-ascii?Q?0s6O7bgUfSe3KAoEt+Ls5qiGXnVmppkGXVHvh7JvBPInUlmVbqsY6h1V7T4D?=
 =?us-ascii?Q?sY/Z8vgpVFbK/7EzGeItP8TmuooVzgZ7AJ3ZaZKcPK++BeAWmBpJxApfX/5C?=
 =?us-ascii?Q?nrz9LnBxwawSVyLWvZYfcWKpKNLXzumbyxZIVHI0O/xrIVaQBycMxQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bdfP+SCwnXbwaLupgqZFgOQsro3n6LEQDZASVOvAMHtvfAkVzfpssIMJONzh?=
 =?us-ascii?Q?gcqpmKC5lYmh9W+ryoRTWLbtFd0jTpAEMvq7HHWtdQn2HG1ZXf4r8YyP+0yg?=
 =?us-ascii?Q?98LDqt78UkwopDl7ceqdtsAE/gnzQHNGlMBSWAwWGlbjGMe52ljkShZWIzzi?=
 =?us-ascii?Q?xgDZf7WEUo5/mQi4ytxiavH75p+A7Oahu0JN/6jFdGCN6ByMxjsQMiHAYAh7?=
 =?us-ascii?Q?fSMycbOLKzKbS/m1KqACAQltkZke9/55mgmQIyVuWrA7nEqfsdQO6xWWx98f?=
 =?us-ascii?Q?JH+dajomPAV3h2yokxh6sqEHH4pkBU6PFb1iX1zQxJ4ai+DvBVJUpYki8/wA?=
 =?us-ascii?Q?kdY2D66pGIqkJQpQo2PhLhgfdNmyoUdWc8+CW/XII5LgVpcFpr4EQhTNO7wo?=
 =?us-ascii?Q?tFPW40e091fjMvbjirbrZLiDOgABYjxB2CfbnpzNji+4rdr0gDlW7VjXveww?=
 =?us-ascii?Q?YmGkkx+WORahVCyRB8TkyAYZZtQ8+f1qE4+mkFA/h4pkIWncysciI7iI+M6t?=
 =?us-ascii?Q?7oJG0yeJxc57rLM/VKcafrGp+MYfwREmJ6tGTAHWn+WQn4LYg2VSsiMvbWar?=
 =?us-ascii?Q?cQzukV1SoQkYB+A5XhWVJaiOhMNAclMob0+/foa2fKWfl6i0SBtZm0ZDY6nv?=
 =?us-ascii?Q?gwjpoMKGxbs0S3ZfR4ffFfoPPLnAT0Q1N9fW85rphmMMI+WUDpImr9IlJVvI?=
 =?us-ascii?Q?CGU+rwd7mf9E/9c9m+hCwkGIEHZabY3VOn8qYfPgDCRrO/PzlZEe52Bw+Ueo?=
 =?us-ascii?Q?t7NT2uf1mO8JTBUeH6CPl5gdrKk+koiNvlH1U1Wo1QK0o9JIRz0YugEpYPSw?=
 =?us-ascii?Q?kDDjFS8maW1yvOJGELmGQ1gwLuyy7PARZoEF00DcoEJcQnmE4dLYBkW9cI/O?=
 =?us-ascii?Q?A71U8e3p/4r4jiOgkfxYM5WvuoVejgFGIl6Uq717DZ3J3xGH1ZNmQ6carLot?=
 =?us-ascii?Q?JnV3PmGu7o5SBItCTY9PanfXtcmX/7IHEPcDeC1tebzBEajFzKj6JWj4WeSp?=
 =?us-ascii?Q?jgruz019PIrpJWKGnLudximzlP+eLyTAcNEOc5FhD3lq7RBzSL2unX34/Ux+?=
 =?us-ascii?Q?ZL4UIe5VI/A0CC4fJoj7h7RqRPCJ/KqIVDKGVDH4dyJVlbfqC0u5/W2T1lDT?=
 =?us-ascii?Q?SlirMETWeP/HL2Rmy/Ii0TOE0+uDjca1dsisYN6Aw2P9eBhaX/q1Xor93Zgt?=
 =?us-ascii?Q?WA5lalexbLn3uijocBHPs++2O+q5faUp8CYtsfaQy4/1eXkrrU5bDUzEwIhb?=
 =?us-ascii?Q?ERGelNuDiL7sG3NR9Is8jQ7obqZyXaWIgB6OI4T/cJrq9KXF7xvLRoQWO19C?=
 =?us-ascii?Q?B3VhkheDVv/WOpoduJJkWBbse6xAlIcvTcR5c2PopXAdZL33GgHEmbi7GUYi?=
 =?us-ascii?Q?njuf7se1UCiqtd+nJRqyfQn+VgIaAmvWcAX86VnYiCMMOaCJX3FQaeRvLoDS?=
 =?us-ascii?Q?5ePOFNDAUMaHt5sDGoY3jUs8c531vdiD4HdivyOKc8B+YY6N1b/Ya+Tc1dcn?=
 =?us-ascii?Q?WkOm+EucpUt18XJ6or28PV2dHErEArZ21jq0OrY29fPP1lmaotZdEvb6raGZ?=
 =?us-ascii?Q?amFytrJSk/hFmGd8aO5dy/DP+5sVl9wMyetv0Gz/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e0bc07-2860-4278-5baa-08ddc94ad95e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 18:09:07.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO04H5rD1hQ7h1STWsu/dIZtls5xT/++O0lPxgyl1Npn8+WQ7IGB15btK1tgXvWxJVeT+3SCocXbqsr3BUt/0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7675

On Tue, Jul 22, 2025 at 05:34:39PM +0200, Wolfram Sang wrote:
> Before adding new parameters, the old ones need to be fixed to follow a
> consistent pattern: I3C_BUS_<PARAM>_<MAX|MIN|TYP>_<UNIT>
>
> Also the entries are sorted to avoid duplications in the future. All
> changes were scripted to avoid human errors.

i3c: Standardize defines for specification parameters

Align existing defines to follow the consistent pattern:
I3C_BUS_<PARAM>_<MAX|MIN|TYP>_<UNIT>. Prepare the codebase for adding new
parameters and helps avoid duplication.

No functional change.


>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Change since v2:
> * new patch
>
>  drivers/i3c/master.c               | 12 ++++++------
>  drivers/i3c/master/dw-i3c-master.c |  4 ++--
>  include/linux/i3c/master.h         |  9 +++++----
>  3 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ffb734d378e2..6a2594dc29e6 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -728,12 +728,12 @@ static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
>  	switch (i3cbus->mode) {
>  	case I3C_BUS_MODE_PURE:
>  		if (!i3cbus->scl_rate.i3c)
> -			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> +			i3cbus->scl_rate.i3c = I3C_BUS_I3C_SCL_TYP_RATE;
>  		break;
>  	case I3C_BUS_MODE_MIXED_FAST:
>  	case I3C_BUS_MODE_MIXED_LIMITED:
>  		if (!i3cbus->scl_rate.i3c)
> -			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> +			i3cbus->scl_rate.i3c = I3C_BUS_I3C_SCL_TYP_RATE;
>  		if (!i3cbus->scl_rate.i2c)
>  			i3cbus->scl_rate.i2c = max_i2c_scl_rate;
>  		break;
> @@ -755,8 +755,8 @@ static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
>  	 * I3C/I2C frequency may have been overridden, check that user-provided
>  	 * values are not exceeding max possible frequency.
>  	 */
> -	if (i3cbus->scl_rate.i3c > I3C_BUS_MAX_I3C_SCL_RATE ||
> -	    i3cbus->scl_rate.i2c > I3C_BUS_I2C_FM_PLUS_SCL_RATE)
> +	if (i3cbus->scl_rate.i3c > I3C_BUS_I3C_SCL_MAX_RATE ||
> +	    i3cbus->scl_rate.i2c > I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE)
>  		return -EINVAL;
>
>  	return 0;
> @@ -2786,7 +2786,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>  			const struct i3c_master_controller_ops *ops,
>  			bool secondary)
>  {
> -	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> +	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE;
>  	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
>  	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
>  	struct i2c_dev_boardinfo *i2cbi;
> @@ -2845,7 +2845,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>  		}
>
>  		if (i2cbi->lvr & I3C_LVR_I2C_FM_MODE)
> -			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_RATE;
> +			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_MAX_RATE;
>  	}
>
>  	ret = i3c_bus_set_mode(i3cbus, mode, i2c_scl_rate);
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 91429d94a866..dc234efa046d 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -622,14 +622,14 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
>  	core_period = DIV_ROUND_UP(1000000000, core_rate);
>
>  	lcnt = DIV_ROUND_UP(I3C_BUS_I2C_FMP_TLOW_MIN_NS, core_period);
> -	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_PLUS_SCL_RATE) - lcnt;
> +	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE) - lcnt;
>  	scl_timing = SCL_I2C_FMP_TIMING_HCNT(hcnt) |
>  		     SCL_I2C_FMP_TIMING_LCNT(lcnt);
>  	writel(scl_timing, master->regs + SCL_I2C_FMP_TIMING);
>  	master->i2c_fmp_timing = scl_timing;
>
>  	lcnt = DIV_ROUND_UP(I3C_BUS_I2C_FM_TLOW_MIN_NS, core_period);
> -	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_SCL_RATE) - lcnt;
> +	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_SCL_MAX_RATE) - lcnt;
>  	scl_timing = SCL_I2C_FM_TIMING_HCNT(hcnt) |
>  		     SCL_I2C_FM_TIMING_LCNT(lcnt);
>  	writel(scl_timing, master->regs + SCL_I2C_FM_TIMING);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index c67922ece617..7b8e7f22f013 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -249,10 +249,11 @@ struct i3c_device {
>   */
>  #define I3C_BUS_MAX_DEVS		11
>
> -#define I3C_BUS_MAX_I3C_SCL_RATE	12900000
> -#define I3C_BUS_TYP_I3C_SCL_RATE	12500000
> -#define I3C_BUS_I2C_FM_PLUS_SCL_RATE	1000000
> -#define I3C_BUS_I2C_FM_SCL_RATE		400000
> +/* These values are from the public spec, chapter "Timing specification" */
> +#define I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE	1000000
> +#define I3C_BUS_I2C_FM_SCL_MAX_RATE		400000
> +#define I3C_BUS_I3C_SCL_MAX_RATE	12900000
> +#define I3C_BUS_I3C_SCL_TYP_RATE	12500000
>  #define I3C_BUS_TLOW_OD_MIN_NS		200
>
>  /**
> --
> 2.47.2
>

