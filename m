Return-Path: <linux-renesas-soc+bounces-28417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D2dJUURnWkGMwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 03:47:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC32B1811B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 03:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7700F30BBE97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 02:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59018265606;
	Tue, 24 Feb 2026 02:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EwEanQ9N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011015.outbound.protection.outlook.com [40.107.130.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234BB26B756;
	Tue, 24 Feb 2026 02:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771901219; cv=fail; b=DqJPqtyVTXCZuyByeJepd6XH58fu/FkZkwhNlK5+GB9wjcvPJMW3NIzwMWvmYqysilSijB5vxWdCp3wV0+IAksC+UHUF4BRnzpXy30w/KDBupE15oA3368/ezLptNecFTqxQcAPDXWUI7CDPnQHdBGEJ4SRzrYoRz6X+IWuKKmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771901219; c=relaxed/simple;
	bh=XXRdXTGbotSV94vD7k820RSMbZbodI3vYKGxdBCiQv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=chigZl1Wxy65vbfz8wFR/MRbxDjRQsp7B517jz9CkDkPsMrI/5xfWa/2r4twylfbcBlWU4tB0U1qJshVnePFkAbR8SNHSYWQMpJl/4R7qxrflos17KKJtsAI+0obLLlxruYwKtgeLtmyLcP7z4JYWA8TivWZFWtNaUJFK610WRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EwEanQ9N; arc=fail smtp.client-ip=40.107.130.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udXjsgHwnBacXpB0+L0mdAxsJdn2HBUuFHtyYGgPowKyT2Q4GfuLjMND7Lp4WIkSkV6V/KOIzY0BJ/PF1skVQLTtyUzgtIrMZeb+LtVTxkXkncCc/u546kQs9oRb58v8SPUaBOuV8sJZUBuKd0pktKZbcI1bAxdcF1Fl6FowElADVedJR+M6oc/5Q/NUXULV5wtSjvSKjo6tZFZQUvzR/5rycZ8mHQIMJmtRF0agARcKu6AVcY+0/q+4H/5wUGg8eKASaEdsY8SA6hBUoIp5cXjdXAxHpTAUVlW+McfrYVgFWwq3H3kIE7EncSM/3BHLO2QJNjtZ9Bth9tLW5LRsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjOvdnEUi1F6ahMsGa0XhLC+LRXhiTqEmMq4DxatjS8=;
 b=A+NWvURAA0Qzn7odprJakbmO/5v7n6QbF5GZAi0VbZ8nwDtCbOPkMxpn45N49ZZwAAKUxqtFdUi7NxcoxCW+ji1mFhb6OL4Dqp7rveBEPcpcqo01M9HPL569AWmQQw524nlzm5m77RFCJY4hPWGgB4clFCfXlsIfLEcE40IdpyZOylm+Es6uGSBJyQ8Uy86XzqoqNlUsiYs5XKy7ZTRaduYULsUPc0FZqrKqwIEMB6i/1iGYRR+UzM11GoBxZ9KD6vr2SYIeKm2TcD8ds7BwTZaMkK6K8aoNijz0Dld9LPLYKOvQ6FnWUJdenY1lbBA7LbZBynQRDodd+0vVNgdyEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjOvdnEUi1F6ahMsGa0XhLC+LRXhiTqEmMq4DxatjS8=;
 b=EwEanQ9N8CFM1sUEG0wS7IlGHoZBMIFgiDzdTphYiUgW2eOx7qOJU6PP5x0NcYFA5hnzsqfH/2hC0fIVSPdIbqv+cZp6Ne6+sG/AqRCE+tMKF5CVxZPalGYsKGCb7d1sekKNUwVnwQAY7U8vvMXUYTofbr8xZpNxpbDO68803GQykQegW57da0+gZR8ZomnGB8lLDO6oEVjGj9nPT+Y3wU9BSmMLY5qCTWv4GzSv65/vkL9eqdvC9QpC7mi4RrrRjZ4UGFQAS2Zx0EYdYxkv3bqLZecs9Tr0BEuQjq7/Y1JEzUVnQJYZy1JOfUwRLxwKpVvgSmn1lWu7TSrRkgqmZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV2PR04MB11374.eurprd04.prod.outlook.com (2603:10a6:150:2a0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 02:46:51 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 02:46:51 +0000
Date: Tue, 24 Feb 2026 10:39:11 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
	Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 1/5] dt-bindings: usb: cdns,usb3: support USB devices
 in DT
Message-ID: <rrbylo36mmysqek4tsof3lvrnkwpddwkfbpzdiaphwp7uwlid5@6dkztn25k5sg>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
 <20260211123436.1077513-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211123436.1077513-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: AS4P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::6) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV2PR04MB11374:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b16d3f-3efd-4a34-3a1a-08de734ef5e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|7416014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+q0pHKKUzNQImzdFJ4ByTK/uLyLd/ndROcnJ2P37ydIom6TzFMC+9YiLWI/6?=
 =?us-ascii?Q?UhEBzDwLEDXuTmT8c/xO/7/mGH8+CWUW2QnB7Ar03RASoLZ967orK1g6Pbpg?=
 =?us-ascii?Q?sZ+mFl1TMZsx+ULObW3qKE74RwOPf7pWbrGxtFWW8R0KXwOJFkFtP8nQvLZE?=
 =?us-ascii?Q?Ixemr4Jp/rvM4mDfP8o2bFG6OrI3AmhZxmQ8ttWln+4RrGwRNaPFySSHVX7L?=
 =?us-ascii?Q?kjCUWWt7xoB5EiH4A7Y4LFhjb60tqFN30RJCKVUjUOebwxRmn4olephk6aX+?=
 =?us-ascii?Q?5Z+1PU8P19h9aiKpt0jX9RKXOfv/tvgi9jBW5lmaJKiZ8gDq8SA8j3vHoK9H?=
 =?us-ascii?Q?h35ceDBTRcNoOwu9tKyYadDyy+yEB1y2gX0KFtfYm3bhy9dtaaeWVdFFG3eI?=
 =?us-ascii?Q?CzAzvcdNZvFteJAUUsAWo54c/M0XBKxHMnDu9an3D4woetvb4+tJAR5T+T7x?=
 =?us-ascii?Q?6luXlz5l4zKdve1EqgXVqFVaHMMj7gws6Dj+pjwSG6JmX5zoDjR+rh8i7fyx?=
 =?us-ascii?Q?tY9drz8TS9SilwmFDvk9XcpVENvO0BUBZIPlsZ6xR8EUzY3G+0w0HymT6TRJ?=
 =?us-ascii?Q?nu1nVNoGnx+XmXZ9R+W8mnIYjo9NKCw5jHvURTwQphTclMkURvvn779mKn2l?=
 =?us-ascii?Q?AXSMXQjH2BIkR46rSbC0PwlpQYzKS9kR8sqL8S7wzpgVAF9EcMBKBxGAGWoW?=
 =?us-ascii?Q?+LFibW+IRvO/HqHcza5YTxG7e22pDev01JAznJ4VCU1chFENrfyrLi2z7TVW?=
 =?us-ascii?Q?p3rubJ1RjORoXEkCX7syj6R+TNkql2rYTjthlDqH/noQDtKpSRPCdtc/3huo?=
 =?us-ascii?Q?6ZN4XkzKqFxphLImB1XedkirWhbO5a3uYhv8vCyh5f2ikSFc9J3CsFTMbyaf?=
 =?us-ascii?Q?9MVo+qlYBWrps3GgCZTEMHO4N4DzWyYrlwc/LATm/MEZUHExPhFYndxkFgj2?=
 =?us-ascii?Q?rJc0c+2m5wCQudZqfOemK20xOy9r83jqcMVzaQBgX104G7sD6GMxEaWVac5O?=
 =?us-ascii?Q?4Rm1uXWwbkBg9yMqfXnOR1ItjNSdDCLoupInmFZxJHMc3XMXO3uxi+C1i7tw?=
 =?us-ascii?Q?nXpakIZp6I1cCj5s5VQe8yTx5YPWDaITx64YabVoP+T2zzqBeC3ksxMAEbri?=
 =?us-ascii?Q?s44rHYz7j3VYkO32iT7dvJtfPMXb6F+o+9Hh5taTdBA3NdbblXurCaNvYvMr?=
 =?us-ascii?Q?5nGPx7kTxUIZbtKexHiWkHTp+YcLIYIbWBluAvXCHFcbh9E8aZ7IopRPCDYo?=
 =?us-ascii?Q?KqsmtP3h0Y3PaxmcsNRE95LTKoaR9qGI4zZW4r8j3yFRNLNJX2P72o9bFH94?=
 =?us-ascii?Q?lJ9BrO20I/RHVeU6WwXUdITf+bwouAfWeNx4aWuhGAttMqXk5/bIhisCGjUX?=
 =?us-ascii?Q?ngp9RzEukrCZ+YA2ijwgCYf4VPgb038pLvBkiLNBkLYglp7YaeFAmF+YJ5g5?=
 =?us-ascii?Q?rg/9W/xrGqCpRwj6miRG6rO7+RHl9X77CPTPBodLkbgiQFgHmDprkug5Vbbm?=
 =?us-ascii?Q?i3339kyJjk6o137zYEivmvRdrmSokK/Rtz8/26thABz2725dVheqBxp33rD4?=
 =?us-ascii?Q?rTtpiAWlfAy4RvWvmpncE+Jtk16l8sDizySH72waCQHyLnoDDcYEz7sL4OqW?=
 =?us-ascii?Q?fJumrKYg2zJpEbedvs0+YYc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(7416014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1J9dAIo50syRZdJetTE6b+Woc2WB/ncl//g5t8kKqkc40jFzXaYWGnamrTPY?=
 =?us-ascii?Q?cNApO9kJYL8O4BM7FzYMwNKNxP2xVniDncR58coIYvKjUaomTC4muSLloguX?=
 =?us-ascii?Q?qzm1N0Uii1Oi2sg6zmhXkz8djsllUmVg1GuouAhcgsIu58O4m8CUW7vTFP44?=
 =?us-ascii?Q?FBOHZ3oDhvWswzpPELS0gGLpiuCje9b/Ldy0P9Zsdf7FuUM5pKu6OJiqGrPd?=
 =?us-ascii?Q?PgKTsWsvYxb5TGnp2tt6Yh0RSkA0RgwqYE0t4kU8+y3RM+B4CVtqMwh0BtHa?=
 =?us-ascii?Q?h2/pJkkkjXUi9+UiB5irDeBbUJe4DGr63g40H1QerJWEBRlFQS6Kvr68t0N0?=
 =?us-ascii?Q?7Hmp5mTvY46UY4YMyaahyehcEWg9lUmvdrVd8mvqcACVlUfR3ivlzFegMvoh?=
 =?us-ascii?Q?5hfyrgDca2fi2hJkX+UPLNmKy6Iq87MjRM6sH247Q3h7zjTKEyp0VHjeI+mO?=
 =?us-ascii?Q?ij27IU3fhBiyX0Vlg12hscT2QyEVZphFxYqmZvROp4jq8xA3filcW1xX6uB8?=
 =?us-ascii?Q?T1+aWLrq/AIFEnYVEYmesTuKJCGdTyVT+KKnbZ/6Jz96wRSu3V8PyWGtybYo?=
 =?us-ascii?Q?vtzT8uJUSk92jgaaVZf1vx6wfG5kwP0S1rMp48WxPCfLLulQSrIVK4eMJCvv?=
 =?us-ascii?Q?98dQq7zMexECwn5RBrkmCJ07iH0lcIycGRBOc+U+0LUyPSgcz4c2QaJ4q8g7?=
 =?us-ascii?Q?NwSN9h0VlOPNgx6wnhrZylA4YXZZw4VzYudXgFoIfMCrbBOyzXMiqC2C2yaR?=
 =?us-ascii?Q?LpnzAmNeNRmLiNpk/5bRI8FNyLgcM7El5lXYZU3UViALtd/HoMxtNCux5Oci?=
 =?us-ascii?Q?NH1IhNAgMgQiB7hPQ1pbEEEWosr0dVREDh7qwirw+odJFMrtmUueGPgL7mPD?=
 =?us-ascii?Q?LTM6E+ynq7BwZrvYJVoQReHYSPtLj3ga3rmfULIHgaC2JjLOw45If1mfc7gp?=
 =?us-ascii?Q?FR9ZnZTMjJIBm9zhTAiUnYp3RUcaU2zb7Jflg1o0JhNM+A58JiyRAgffOO8C?=
 =?us-ascii?Q?tnb0ppoNcr01HFQ1EfNZ5CE4EocxiRUqFGS3/souYmskvEdrovZE+uMgLr6g?=
 =?us-ascii?Q?elR+GHEkSLSPGb4vq/bu0K3P8HTjNVUAW1FyOX/GlNherMbmZjJLrXmFevvL?=
 =?us-ascii?Q?FhIMb3Te7CSuFnwKyZZzyYp3ZBSBlmxxRp9tzGfwAH1I2V4jAOeM0Log3BqT?=
 =?us-ascii?Q?p4LftDBddkZn1KY0u1Oj8VOg2T7rM6tNyRYeJ3NgfkGSBhlw/VXFbHGSUUmb?=
 =?us-ascii?Q?M86J7U8BsZv9FLrxyFEDrQQ58Oma8Vv71tF1ANaYAMz2kJs1LIxZ9wYDpG65?=
 =?us-ascii?Q?qKv+ruCk4AkF4+kDYQdnouCEXZhNttIb34heVDqPL6eVfTx9zLAu8fiXWWHm?=
 =?us-ascii?Q?VJolxzi9yV0GARp7/Xoq4BFPaFMZpLPg5JcasMKg7hlU+IC7NhEBYuB7lonc?=
 =?us-ascii?Q?Qj0yOF+A16o12Hdn55RQenekBBKLPYN6y9KU89Uuck7JyGQfuzj02Y5b+kub?=
 =?us-ascii?Q?jTIdcDSmTWx3l1I8ItD/OA1kUJChsmI7VEo06XRVgm3okJABQDQ+HeKIInsV?=
 =?us-ascii?Q?+S+19unlP28L9d4tZEFGDE57KrpldKSKm/otBUv9ojNd1v6K74aQJ1DA2v6h?=
 =?us-ascii?Q?y2CjEDIUL/3S9OMBYSfdCM3T6G59IhVOqSIUJ7HEldlJV8tZ9P/1o+HvQ/vY?=
 =?us-ascii?Q?wvWa0UlsXCGo/6LUwf8S5EFxhQlHZ0blznrlXRcIdokMIoh/Z5yHEjq74x9T?=
 =?us-ascii?Q?V8DNX2IZPQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b16d3f-3efd-4a34-3a1a-08de734ef5e0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 02:46:51.6657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QoZXby2CKeQzg6zvbFnwugGH5jH7fZxgLbuL9yeEub+QxXWujwL4AH7w4AVQoPMQ2MtwtNosE6FItCQra+Wyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11374
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28417-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,ew.tq-group.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tq-group.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: EC32B1811B2
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 01:34:28PM +0100, Alexander Stein wrote:
> Reference usb-hxci.yaml in host mode in order to support on-board USB

s/usb-hxci/usb-xhci

> hubs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * reference usb-xhci.yaml# directly (suggested by Rob)
> 
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> index f454ddd9bbaa6..a199e5ba64161 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -85,6 +85,7 @@ required:
>  
>  allOf:
>    - $ref: usb-drd.yaml#
> +  - $ref: usb-xhci.yaml#
>  
>  unevaluatedProperties: false
>  
> -- 
> 2.43.0
> 

