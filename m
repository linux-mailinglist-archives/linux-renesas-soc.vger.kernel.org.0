Return-Path: <linux-renesas-soc+bounces-19610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C8B0E346
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 20:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EC257A287E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 18:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645B0280312;
	Tue, 22 Jul 2025 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PICMzMUD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012064.outbound.protection.outlook.com [52.101.71.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0520720B81D;
	Tue, 22 Jul 2025 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753208054; cv=fail; b=PKJYXsaaUxMkWfkXseQs9upZimOT0V5eq5IKemnZ8vIJHxD11oUDIeE/13JrcJmgcQc0/Lj2c/YNzFjSu1J86Ne/X0M4fRFEGd/d882cz6TiF7VGQEtR5/m0Li2L4xbMH2LlASCQwtE4AVS8JestqUJLtv6K8HuB/+IJcthiOKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753208054; c=relaxed/simple;
	bh=BNJgutWXByxrxgTSdKxYZl1MUfldDngmd769rmQO0mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kNmob1BiL2JCVDlXsM74lqx9H6qfzzwzn5093C+Fd4g6hZvvY3mgfEtNQ5iRJ1Lql/0MaL1+HmHS2o+YNQxoFSJNVTa578xxrM9wWhKN81PLL69u9bvxY+BL+7IYU0EPU5iNT2nkarQkuj4+b6rjPg2CnIYoI4PQJpxXQV4G3YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PICMzMUD; arc=fail smtp.client-ip=52.101.71.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYY/ekVKXdfPjTIzwYeyN7fo9gsFc+nAoM7OB6kdq6DEGumm+jhczureUe/34U94sSm/7FUQL00a+u5shB+wCdRoFfMPImZnJaOo3mk0fuyvzA9e6KtGFIsdU68eV8kUndxDIxeFzG1xIg1zsUCxVV2LKvat4dEN3697lwPhr7rRD+Wx7mn1l6Kp2RCtWnKo85MjIrBHA7iZ04FFEcRuBKwT60wYQdYjwmqwapJ0zucAFV+bg3Q0KpGdVNtx0We4DRbgK/NEz2YcEDOQm2Vi6egF1mLUnl5UQl5fLdjSuugUxppSBYnMuGfRLOFWqy7fCf+GRWVv8uEoF04oD7Dxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daHTpruDF94xtr+Ml3+HYSItQ9jqsuTcTzkuo4tilhI=;
 b=a/5MqYDVG7618imTdutLd9s+854DHFNqMOhBRj3v6zTdJvyyoUQPKVq9yHZLKITYmQSogIhg6WmE1iZTInJBohw8gYsKUqDamF+0TwIMNxu9q1W/vd5QffDSvtP8T4hd8oXqtMlG52TDIBeTVicnUSiPFyGupjmlhWNguxjeA/UsQ+OrQKqh/pWm/CFrlVJ23+nKsA5SyEfGfsphwZI7wiZM6tw5k/zV5QeoAa8Xe6OV9xe6KPve6j8sm0UIrZ5eGX8Bu3KpuOURL5HiOUrQr76YCxtr17hUKyoPAAQaPAL16efGX3xuPW6a9vIqBH8Dy0niss+ytr0I+7vZATqBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daHTpruDF94xtr+Ml3+HYSItQ9jqsuTcTzkuo4tilhI=;
 b=PICMzMUDJxXZj+73Gk4SxlyoUQZ3aHqnpNnCEoIjh8DMhI6DXOkZUdaow90QqA+4lUcAJxwukU79tieBHVVwQ0XN9sdUsul+1N0tCKMJTXIFqzlBkyRS3i5NBNkpLyCZ8Q+k8Jvfgp69777AZjPLQS2VtinhSYJJpkqs0xsY1TxXOiv6s8Cf6pi9WZwchyYtKSkJuIDwMK6q/eUQoI6uYUhZs+B4qDuHlxc20MgZz1FeeCIdJOszW/6d6S93FrATodxFNasauXJBFMXax9s87xBKZK9YpsJCBB5U8Z741iEPWizFWbbLhRSJvnlFY+c7EdO8+YbE0iyGdWsizqmlYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7675.eurprd04.prod.outlook.com (2603:10a6:10:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 18:14:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 18:14:04 +0000
Date: Tue, 22 Jul 2025 14:13:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: i3c: Add Renesas I3C controller
Message-ID: <aH/U5xmQDipagMXf@lizhi-Precision-Tower-5810>
References: <20250722153445.5003-1-wsa+renesas@sang-engineering.com>
 <20250722153445.5003-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722153445.5003-4-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AM0PR02CA0033.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::46) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: ca59a855-07fc-415e-807d-08ddc94b8ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rnln4MNa068mmORleouNZDTBZz8rFVnW7ca33lpL5l3s0NgqKAQDv9L/6rig?=
 =?us-ascii?Q?GKzanq5pcMLu08xKc4PsQoIWmh/erpYXU4LieumYhSNqulFe7BRjNF9lWLu9?=
 =?us-ascii?Q?akTGNTM6bVsN1Q6jISLkyNl8zNxb7L0SSDBB624WAdFOvQFC2IVuj/2kV/yw?=
 =?us-ascii?Q?YqMEMR+Q2kPfg2OMCFUfuUSuxI1xShB1yeNDNxaVDda4RKsDqSoBG3enFXvF?=
 =?us-ascii?Q?ppPenKOIHnM+nbeY9GexxW9QuJtDpmdzbYjx/e4b+23A1601WTOTYZMiBelZ?=
 =?us-ascii?Q?oRDjshKkKtOYGK7sFYLHkRwLSF6OsDyHg+1ZwzIwSfcAd9WL6lxTjqxHhk5V?=
 =?us-ascii?Q?4yrQqA/tizXzEA1xGh9/oOdw9wMOGYnqNepAmcY1skd37r6iY2PSWEjKw+uK?=
 =?us-ascii?Q?rpvFLf+iIIN5d6eoOGtsc8ly/ttHvaY5hJ373XX7i2GrIQ4sClXaI/ExAvOI?=
 =?us-ascii?Q?2v5DuTYXpV+wreYVpo+L6IDf0vDURrD/w5AghOx8+vccJf5BEECdF1jQAJiS?=
 =?us-ascii?Q?6lNrZeUZmHNeb0gdQeYtMQOdqrXbBEL2Eb2HgBNQ3T5gW2k/gb2q2jwZrXmF?=
 =?us-ascii?Q?4o/fesng4w4NGYRhSZxS5YjMR1KFJvTW3573Ssmg+0y/49S1a/ty717h947s?=
 =?us-ascii?Q?kkIQyadp59MMTLQb7HWqgXdO0zG2WPC9U5CJI4QWuXf7g4opjrb1y8qWrpxs?=
 =?us-ascii?Q?0jbrx5wYEVITYgdsi5MCmYG0oUyDI5ZN5+Qmh/t8x0ycAcayUc6qFYqYTIvj?=
 =?us-ascii?Q?thQU/tfroXN7sR9CjaJfmjDcGCFFi7z05WC9xP85r7vUGRADvVQ21944aEc2?=
 =?us-ascii?Q?HECqnwFkzhBlRKRD/xt2JnOYW/69DLfyfTFxk4vrufNvGzHtnPcREywRB5HA?=
 =?us-ascii?Q?MZODObB2BzG44dZCX8Mk1HMn7SS0b7MTiM40Yn/1q4I5YfAh2kjkMLkR+6gA?=
 =?us-ascii?Q?mf4xY4xhxeNza4p6RXEhAjyQVS3X45D1CuU2xPsjRxINJZSreQZ/V2xtgrFq?=
 =?us-ascii?Q?Uij2aVSY21Wg2KVewot4L50h38MGvZu4cQMYdkLR9ECu3Xs8BkzQijPIFiZI?=
 =?us-ascii?Q?YXOiGmOhRjQQ7O3XHodEPOGQ3IfjfVm302p5PTQQAX1XOiliJLNGBXoX7ji0?=
 =?us-ascii?Q?o/PkBGHuOsoaEjZEdflB6k0pL708PxlD6TiRmnV5rTYeoEgPKzFF0h0H3Kpd?=
 =?us-ascii?Q?fng5ppJ4jWhHcE6BSw+SEZIvcIirA4GIOS6h4TKlu2nTLyYyzzK0/Pnsmq0h?=
 =?us-ascii?Q?4oe+WXcQMevwOESBX3bw8dXfMZ41j6GYRJxDrIbLqIOdQQUTDvP0jwwc9EI9?=
 =?us-ascii?Q?UGYYl1SDLHODD2Kz4Ec2HyxA0QAO8po0kluyOUTfoAiM93m0hewD0OBu18Hv?=
 =?us-ascii?Q?Q+J3I3vTO8a2UMqCgGqzAMeIzgQ96DM5mwFR1e4gsTp/Bi0Zcr1lQYE3hZw7?=
 =?us-ascii?Q?NwWyCEWmPKc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BcWhv0j9DYMDzltLLDzK1OkYU5kmNTjy0iGxoD47IWvvvF/bru0AyCJ/5cYo?=
 =?us-ascii?Q?jICSC+ItBsYIauqwBgTR7b4dVHPSUkn3MHfUaXbDU2loO+yHhENUQOE70yjC?=
 =?us-ascii?Q?H+B8DI3UXPe64jDK/lTHjUoOHZS2S0bfJSTkWKJbbIeg8lgoNiC+C9zzqhya?=
 =?us-ascii?Q?nWkFH86e2B7Y9yUP3srC5tpzlxfYQ0xc4Jh2gS6vovf0xXxXk5tXx19am3yn?=
 =?us-ascii?Q?ZP71OWeVb1iXcmg4zFgqcyrrrhX3vetF3BWbGpB79+KKu44DbTTcKTE4ZeSL?=
 =?us-ascii?Q?SvDxo6SV1FLfp8ja7/X7IMSvkHhredXZ5rfIQtsK2VJMRrggmKHJuBXYv+Rg?=
 =?us-ascii?Q?9Z0yEsJE4uPtfniPyZjFyFbRoXK39KfgfO7NXF0CdChBrerQxThwHrDqG5gr?=
 =?us-ascii?Q?qhsAupvpV6zB8oCLLHdD03TRQwSgWS0uyTtfCq5C4EdROhEBHAM+MrczSjNh?=
 =?us-ascii?Q?FE+VtZMBR7j/LfHoFrL3fEml0PUA8n/mbHRnFvehXyaT7CCOHdUHlUuN19uG?=
 =?us-ascii?Q?ffyI9WLBNxTC23wR42LZs5ungNBIfvyzsx91W3thuweGW5yiqYxBHqFSIv0V?=
 =?us-ascii?Q?wUBsyHODXcDRfp5HYQoV3DANg4OZWQMvrUHMgGwL123Wul9YRISWprAliTQQ?=
 =?us-ascii?Q?+OLKEVtF73XAhJcI4x1Dh9EMSN6zEY3jyKF1heiuomEYo9LDNSMvt16EbeJt?=
 =?us-ascii?Q?z45jHf/sbnVMu69nJJKVo2mLJgYqbG0b6U9nMq2hvy6zZE0MCC0NTOddq0FW?=
 =?us-ascii?Q?cILqi3k6+iSwZoZH18YY4OkmWDuMsTYzSxNjEp8Df33sS89jTrxtww0wvcLs?=
 =?us-ascii?Q?Re/Pu2LFfUPOhQzfrOJdwrMLUDHiCq37eLkHMPjAMnGH7N75FIaMHsolVZGf?=
 =?us-ascii?Q?fiTZNejcmVz2BClud+Lqe8Z4LBSqLRUFQHSrxnkTvD2PkFiNC6w5SdCAcZ85?=
 =?us-ascii?Q?Z/2Z1sNJ4G06GjPX97oQA3+UoutJkSrUYbrVTCCCSQrOp76+8THalctEwdXl?=
 =?us-ascii?Q?EhqrRjtHVX8ZnzcK/pmA/t00VhvZ6+Y8Q9BrsHbUYvIhXvh3L8CpDbbvkPzc?=
 =?us-ascii?Q?labuz53QCe8QTo2jlxxjk4MLqBIkMBnvKJq1jlBZe4dnSoYsv+Vfrf8ADaR7?=
 =?us-ascii?Q?zaKCfFVpl0yls6jojPDZrPS2HbKjrD4pvg2/APqfz6Pw8y+4T8HFmfjB2S9h?=
 =?us-ascii?Q?TRkTgcVKPoen+Q7magoK86WW6p76OkVwuQzGftqkryczdlHAqHgSDaU33qbs?=
 =?us-ascii?Q?oCrI6FokCpmmCdyyHdtUcfFlWinhIA02c/kiiM0LMePuVxp+ThIeEcFSlPfC?=
 =?us-ascii?Q?CxhosNbv+kMprzOQYGNFaE0pYdq2gqsnPtj8ZS1zI59zUZ2nxYwzrGuyMdVR?=
 =?us-ascii?Q?ziSqoxxntz4MojdVKLfMdSBJOe2qblYJlxeNhQW0m+U6tmAUAGH1qb2HZcnP?=
 =?us-ascii?Q?fflvjYloe6j+AGhb8SCaa3c6gb3dEwqUutKNU9ZnnYfjFsxvMCl6yaUy1LM/?=
 =?us-ascii?Q?hmLOE/L0qeC6C58cbdTF+LOOY3Fi/mR8piMxc/4OCuLHS3IuUlBMCHPMqe8F?=
 =?us-ascii?Q?uHU050qCjQUVlL2u+nJhx3br51DK1l6qPDK6m152?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca59a855-07fc-415e-807d-08ddc94b8ac7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 18:14:04.6125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/vvKIBdRfZZm/HOnBISPMrx+C8zV4ziHzUVpLwqSj3WX69OH3Oq12BBXbGgrnJg0M4aFXh2pKpwxoQO0lEnPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7675

On Tue, Jul 22, 2025 at 05:34:41PM +0200, Wolfram Sang wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>
> Add Renesas I3C controller which is available in R9A08G045 (RZ/G3S) and
> R9A09G047 (RZ/G3E) SoCs.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Change since v2:
> * rev-tag added, thanks Rob!
>
>  .../devicetree/bindings/i3c/renesas,i3c.yaml  | 179 ++++++++++++++++++
>  1 file changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>
> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> new file mode 100644
> index 000000000000..fe2e9633c46f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> @@ -0,0 +1,179 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a08g045-i3c # RZ/G3S
> +          - renesas,r9a09g047-i3c # RZ/G3E
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Non-recoverable internal error interrupt
> +      - description: Normal transfer error interrupt
> +      - description: Normal transfer abort interrupt
> +      - description: Normal response status buffer full interrupt
> +      - description: Normal command buffer empty interrupt
> +      - description: Normal IBI status buffer full interrupt
> +      - description: Normal Rx data buffer full interrupt
> +      - description: Normal Tx data buffer empty interrupt
> +      - description: Normal receive status buffer full interrupt
> +      - description: START condition detection interrupt
> +      - description: STOP condition detection interrupt
> +      - description: Transmit end interrupt
> +      - description: NACK detection interrupt
> +      - description: Arbitration lost interrupt
> +      - description: Timeout detection interrupt
> +      - description: Wake-up condition detection interrupt
> +      - description: HDR Exit Pattern detection interrupt
> +    minItems: 16
> +
> +  interrupt-names:
> +    items:
> +      - const: ierr
> +      - const: terr
> +      - const: abort
> +      - const: resp
> +      - const: cmd
> +      - const: ibi
> +      - const: rx
> +      - const: tx
> +      - const: rcv
> +      - const: st
> +      - const: sp
> +      - const: tend
> +      - const: nack
> +      - const: al
> +      - const: tmo
> +      - const: wu
> +      - const: exit
> +    minItems: 16
> +
> +  clocks:
> +    items:
> +      - description: APB bus clock
> +      - description: transfer clock
> +      - description: SFRs clock
> +    minItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: tclk
> +      - const: pclkrw
> +    minItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: Reset signal
> +      - description: APB interface reset signal/SCAN reset signal
> +
> +  reset-names:
> +    items:
> +      - const: presetn
> +      - const: tresetn
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clock-names
> +  - clocks
> +  - power-domains
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-i3c
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +        interrupts:
> +          minItems: 17
> +        interrupt-names:
> +          minItems: 17
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g047-i3c
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +        interrupts:
> +          maxItems: 16
> +        interrupt-names:
> +          maxItems: 16
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i3c@1005b000 {
> +        compatible = "renesas,r9a08g045-i3c";
> +        reg = <0x1005b000 0x1000>;
> +        clocks = <&cpg CPG_MOD R9A08G045_I3C_PCLK>,
> +                 <&cpg CPG_MOD R9A08G045_I3C_TCLK>;
> +        clock-names = "pclk", "tclk";
> +        interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 294 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "ierr", "terr", "abort", "resp",
> +                          "cmd", "ibi", "rx", "tx", "rcv",
> +                          "st", "sp", "tend", "nack",
> +                          "al", "tmo", "wu", "exit";
> +        resets = <&cpg R9A08G045_I3C_PRESETN>,
> +                 <&cpg R9A08G045_I3C_TRESETN>;
> +        reset-names = "presetn", "tresetn";
> +        power-domains = <&cpg>;
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +    };
> +...
> --
> 2.47.2
>

