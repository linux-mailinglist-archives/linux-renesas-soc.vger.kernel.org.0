Return-Path: <linux-renesas-soc+bounces-33044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIGdLU+0EGrRcgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:53:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9C95B9B28
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 397EE30157C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D00537D11D;
	Fri, 22 May 2026 19:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WhHEuJkl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6B436A02E;
	Fri, 22 May 2026 19:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479556; cv=fail; b=Z1VNM4fnjenqhFN+WYEjhbdO7E1WtnB3+EZv+lRI46S8BQGuyojmEPkmdk2ZJoPwU33I4VvMfTS/cRYWrcCS19gW/9bc9IifT619WBxvhI1GissbwozU9Og6xQOvuuqXaKzDlyToWeWtHq6qB78skLO6DmMzHVN5d/flmyRemmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479556; c=relaxed/simple;
	bh=WKBwK/zOxO5XpNhy9Z+39hBPcuDQQUpEa5oo3KMxnZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BnnfPx4lJbP6705R9Ho80aG9HwQdB7AQ1oNaYanCjyPEWCrr3yHINIiehILFQNEk5ZBZ3D0dqxXGl4u7MKrj2aJAIOv2gWNHe0D72oczBbjSETkU99UcrASQxfGvZHNrcWUxORcnzut9iLthGR9yDiFK2RhcZ4TdzHr5YICbC1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WhHEuJkl; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjQkWoh2WmKPu1Njpl4d42De2VP/XzYHBpon9D8AolDmzqfzMSsnu/yGAx9xPJ9bk/FZyZayMY9TA65lvcz2uM1Hhv4JH4qB+Z99zeSK6MCPqR9nrzEz1sFCsO+7z9ZkpAtgMENTlq46TuG9s592kALW7nTW3tuASdNRB/o10qtDrLW3rfwp1mRh92JXEVekKsbnejIHvtE6MFs6zsubtzoX2/nvtAyVQkKcLh56bSYEmsip5oEfV52PQ+gHmW7kDwquFHfap3Brtxt1V6NTcwjW7tm90Gx6X7ylMxiFc8OR+j36ooSkksLvjnpEgAO4HN5LXU4c3eJ4b5pX0KdVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFgfuS3KAuqxYvw1T1vAZGXKfrVWmzjlvu8jXITZpbA=;
 b=DGcn+HF5yNyyeIe/JXAuB5tqNQ9pDKz2/72qtJs1NDMLyMPLY9Nl+xVnccCglxaEaCVLbRzU8PXGxeHEBQB4J37nM/LwS5iis4xZ0C9hR88eW2c/DwFJIfDBbgN1Pvp0MQT9gIHtskkjtZnyZnFV+IutRWtTiyBrQaxEa1CPUj7wlzFGzGcp6rmJtOrgnUhiObecFNOw84V9Q5db4jUujo5PDtSjvfD6veh9e/6herRGdzqKK/t3pUq+Kawpg3N4csPsLlIeDKwIJ+sa+PmRz5yCDSMbQ9al3pXda9BbpAauhHs1Bxre2+B1zj5ygP5EGwJSq1s09cb9p0jtfO360A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFgfuS3KAuqxYvw1T1vAZGXKfrVWmzjlvu8jXITZpbA=;
 b=WhHEuJkl8SY4tmcN9xXqGv3tuXFA9c9pHZ3voO74JJhaBcCGE9k9pi4gfBbT0GOnWAALFt95UgZlKeQ1yu1zuwyPQkqiWQa9k42rgW/NOu/fiyRJ73zXsowbSYBfqNImIu+vRyH1fsc6mFsImYxZQ1h3CIsruTjSdwvsILUUtMQERcU99MJSMjqGSuEyfSheaxHFvTTARqDX7RhF6w+KRoxYonumdDGCRdlX7vnH6TLhxUu1nR+kZjkIzXM49PJ5EHfdaRsQJ1q0sx3ekm9GuNooYa//dbpsOnuHnagyAyQhYiwcdvacBsRlcFmGkHx/W8csjrRJ5OK2V7WeKMpnkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB9906.eurprd04.prod.outlook.com (2603:10a6:800:1e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:52:31 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:52:31 +0000
Date: Fri, 22 May 2026 15:52:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 16/17] i3c: renesas: Drop unnecessary tab
Message-ID: <ahCz-TeibvzeKUzv@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-17-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-17-claudiu.beznea@kernel.org>
X-ClientProxiedBy: SN6PR2101CA0009.namprd21.prod.outlook.com
 (2603:10b6:805:106::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB9906:EE_
X-MS-Office365-Filtering-Correlation-Id: 4673551b-c17a-4766-c93a-08deb83ba91b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|19092799006|38350700014|18002099003|22082099003|56012099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	jGa+Q6jwtn1QIHEwp0RQuxQySCWbozp7E6P26E+t7FJrGBkIQk622WPiR8/1yzCW0FrT9+riyV/m8jRBzOzZzYKLUeOfTSweqAeMhzXuyFBGAlcfoiqaSaVZWRnWhwQUh94InB0Fjldhbl806DNNS1dqGBqIwftuc5ZqOMSHx7LZG5uti2VVSQ6QPhBRVTzoyiKLUyeZt/z2pSlF0hJxhCSvV138Wuf/RtReOPJ9zBcMfJq4pp0wqIP7o1cJyziHcYDahpPqNYfd4qYakf/DXj7wkRCRcAMW283dvpRA/eh07Yaxh1ZkYaed/TcSDRLWj0tyWcRNcqhIku7+9fq2I9PT8CbbzQ84rkh3ZF6cOnWTtI7Ppu8p2tcuyZ7jGCKpZdaMAVLkKkqCNUjSd1lzdJ0mWp+fwxaWx0SskpAN1tgJnS8M4madhbdpOO6Kh3td75H0LMzUjRqbq+AuRBxfJVY4mgglHlEau5gs+TspbTLAg3Y7k0Hsv0OPeE2mkI6xv4EqNS+R3liZkrb/XtjVyOKSqGQlCt5wsbUHnNZZKVpAiBv0Eck0jf3r/UueymFpBbxdijccU1fw4bjmvuixBJbPB1JsLIA8XorYpKmP/8jKS5pUQly9zMKOEq+eNxKsuXOuqg46Z2D6qL4jkrhZ83uLqC4AsCXmQV9K6dEWTkwfvPHrOI84YnQliu7vnGUZk6F2TotsBpef2O1lAUA6yDlEl8BUkvIjUvDnCawmFJwT96SdO6tiZ8sjA+Wnn6Vx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ahv8vzMGUYEzoWNTuZW5JFapH7x/POSzE5Enptczb0zz1cGEuVe8R5sYnmBW?=
 =?us-ascii?Q?/ulSi6q8qQYaT9vxPD6FXYm+1ElVOVxfHChT3i2kbuHHLQN3Gjk5OdDoHa/j?=
 =?us-ascii?Q?dOJwZ05NvdT8nSzA6J9GEPCMhJh5kfAEUiQ/ke+9Xn0PZ/EyYJyXgYe0m5Lv?=
 =?us-ascii?Q?DrNdFsHIWMDs5wTtPdDNcBLaS0nUtus7Sm3YFDOJEq6rWEONbxrRl3uP4q53?=
 =?us-ascii?Q?UWU1Rt7SVazsIhqG8PJIRrwWC0Hj68NwM55ap4H3af9DtqziPc4/KHs1XnCk?=
 =?us-ascii?Q?Zp86pSLTieeQgE8fJNdipEpPoJSxNIj3f6ATCBbicBUIBkR1rCtBJwSQKrO6?=
 =?us-ascii?Q?mdZVNIeOzEFo90NfIS2oq9cewcbRUPzY2B0VLjGyYbDhL6RLrlmuCoZB093B?=
 =?us-ascii?Q?K3UEkWe6Fwx1JXqROPRiiNDVpsSD0ebunpSUPY1rRiYfxUCD/0vEKr7N4Rzs?=
 =?us-ascii?Q?L6EEBL5g/4htHidR0PlqhiiRotOpyMcmB+CIUo4Ycg5D3wc1wtMYySyd6GCY?=
 =?us-ascii?Q?b5RgfB+pUCbKiZ1vUVKCJN6xW0qsvA6ZCQ0kaubAb/lOnOQQn8K8Z4N+YW/B?=
 =?us-ascii?Q?RMk6waxdlfS0yfCL2vEo4WDpLckJzEJzwy3mZQNynUdat3WnHI6Yg8E8p/Eq?=
 =?us-ascii?Q?ukpcjiTu44z+hGMF61mVZjXR7bEb0dAOiN2w+gz6F2+A8PTFDZo5tql6zMbs?=
 =?us-ascii?Q?Y6vOfzDcMDzkbdrGcdZtqDg1ZZ7ppovWZCKyp+Q1tYkxtwh0i9QwScd6gQzE?=
 =?us-ascii?Q?XMv3V2Rw5w7uzHyAPXAkWnL9+4nlJDCdYwe8775aLDd1r+vOllH5qztCOpEO?=
 =?us-ascii?Q?90E6JhxYos5BbWp7Z0mbh52mV/1NUINNyJrYBD+ymIwZ7FFpbaQnz7sUUFhh?=
 =?us-ascii?Q?hSXevh071oVgxnVHKM95UQZcPXeWbeWJ3G9MaTU2N30bsnGzbaiG0nnmfgwO?=
 =?us-ascii?Q?QBS09HZFJXmTYgT11cGJyqE4tpTJxi45VXEVw9ITn0Or+zhzgBqs2Hg0HNi/?=
 =?us-ascii?Q?MD8UCa22LdvwloT05ZFDahwQfJgZ6/fxlkFrJtwv7U4OZDtM/rWd+vY/q8W6?=
 =?us-ascii?Q?//wzgyWUlbee9AZuratC2zR41noH5IMDqPPeFBfC2qNlhtXGoyxIq3YGKLTR?=
 =?us-ascii?Q?Tecke4kdlEcL4rETIOhm5uYR5r31QOnkkPHTbMj0x1yKa2B7LbRnaVklz12F?=
 =?us-ascii?Q?A9IEMegL2xicRJ+3mQj5FTrybtvbkLaT16uQma1XST/fF2LoRAdQqfs9Wtlj?=
 =?us-ascii?Q?FBpG9vDCBc6RFAln//+6R8pfYi9kOKWo/16olaykX2zY9FGxXlZNaA1m8gf+?=
 =?us-ascii?Q?mW71iJu7qsjIq39MxMdGXacrXhL+EP1lzhAiC3YazbnlsRozvqlHuji/UhCW?=
 =?us-ascii?Q?ICuaFcWPRlmNP43TWH7jQd/h8lWbfDHCH2s1B/Uqdx00h5KoO0j7vwjmkHj9?=
 =?us-ascii?Q?jC2pp0dM++qZySU/C5Vrc8q1kRuod9xWoaqfGTDNjmvdR34dxbZZF4HSIbQc?=
 =?us-ascii?Q?ccVOK5ySB5ws6VnCG2pt7nrvjHiBEC+nlZeDF1zIlaQyPQGeAFIt6jNEYY9q?=
 =?us-ascii?Q?dHZPp5ZsEuaqCKIdpYIh3ITWRsjanBt8xozEUWDMGY7duybMsMEfIFXBYU6x?=
 =?us-ascii?Q?Q5c4k/+yC5owHGAzBvhOKFPTP/ipkGOX33kMVH6ZXhESueBDdn0TZFytP2Ib?=
 =?us-ascii?Q?MjF7PAUcF5/7XnPFtJKyAfx2t3fRxHX/5TpXhfpMlVTMIxMA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4673551b-c17a-4766-c93a-08deb83ba91b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:52:31.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTZykVyduSOhJX0NvTEqAJY5wYLqkb9xEkix4opitveSjWu2Cdoa9YKVKBo2zJj1LtTTdzRWduMlISMc81A4cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9906
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33044-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,nxp.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 2D9C95B9B28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:14PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Remove an unnecessary tab to make the code cleaner.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index e6e05ac03082..a070db4d2440 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -109,7 +109,7 @@
>  #define  NCMDQP_DATA_LENGTH(x)	FIELD_PREP(GENMASK(31, 16), x)
>
>  #define NRSPQP			0x154 /* Normal Respone Queue */
> -#define  NRSPQP_NO_ERROR			0
> +#define  NRSPQP_NO_ERROR		0
>  #define  NRSPQP_ERROR_CRC		1
>  #define  NRSPQP_ERROR_PARITY		2
>  #define  NRSPQP_ERROR_FRAME		3
> --
> 2.43.0
>

