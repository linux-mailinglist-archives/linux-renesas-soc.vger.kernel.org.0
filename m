Return-Path: <linux-renesas-soc+bounces-26578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD7D1123F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 09:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54FF13079046
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 08:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E7F314B77;
	Mon, 12 Jan 2026 08:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OKcEtfRh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF0630BF79;
	Mon, 12 Jan 2026 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205768; cv=fail; b=L7wuFhA0LbCBJA7+EDXrcgGiu085KZwV8Suk6q1CmlWfXmCRMh3bBp8gug+9YRnPwRz4yc5/sQo3nIAjan3nnZMfDsaB2SFrP/KN2yx+/osw2W7dR6er8VNPABke0eiiz8jzHX35T5GCjC0+GvMFxJpHyqCKNzP/FxgtdkRE2HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205768; c=relaxed/simple;
	bh=HcnlOeLzJPScEyerRoAi9td/jz0N58jhBieNPyWjm3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=co+J+cGr0CyNabzbpS5odK8QL1hur7QWFldkGzTxHP+bi6ya4286Lj1ljIRaCtYUAnLuTW1Sq31H52RjO5E2sffUDP4dBIajCClwVAFdKXBBP7Bd0esTBMb0KRygyEbi015KcUNkZg9Wz4ELqEAxzvzcDseRXj1/fZraLfQAEBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OKcEtfRh; arc=fail smtp.client-ip=40.107.74.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlbE2gnxDXgisBBQHYuwSBKL5vb76uMQbss1o5iR9i9X8BkHdrYa6SkKIZpRFQV/QxhLrynaOvEldtBrhi6FlOrN4/66Akn/jCNdHCDi1XctKTQE3RtcZeI8f3OJf1BI3HaKwm2Nzsf9SpkNbuRGVcLQ56glnBW/xdhidTV3fChlkI/JhbON30P2Airrr2dHCiTBT4g5WYYSQPKk+pqeZME5VazboAPtJxptr/z9cgkc+BxDFxTq2pkTPDsV7/S4D5zHziLlP7OrSyEKaNEg8LdHiVwgKyN0QvkYZUv1QAeHF+Lj6vPHlBvf/1DV1qSgAygXGS0tReijE/BDfwfUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xV6nvvlxW/fj+E0tjUNXkv7T9GZxGR/j26ARbiqxdeU=;
 b=jamX1Xx9ROLa6ypY8nDSRrWngpuipPYiLJ57EVjt4sEk4YryHGASy9we51BzymUvewrlWQ+B4WqtpfMYP8ipmrYGk87+r3LfBgR9VSbOZ+Pze1sUiiawFd+exCFQciAS5YREo18DVguJdF6T946rV/RrQml+nWUIgohNjp3PJXbTSdXRBscvh446qFusuSSQ++gCSi2PCFr5b5MiAXNJiAJvCk2Sw5krz5KL7XcbYL48kpO7O7AH4dzMLDfQnkVd6iSJdYfPzTG0pwbEwq/sRnCMgZ3RpM8yokaM7hoNyL4w6Q9E4w4K9Fj7eRC+NGeu+mI+oXIbMN0jfV4YMX6vFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV6nvvlxW/fj+E0tjUNXkv7T9GZxGR/j26ARbiqxdeU=;
 b=OKcEtfRhJI4nly1f83l7hvX0gT7BYsHgnNBTsGV8lH9yK+xlVvfH59hznFiYy3P+XIAKNH8fogISMliXhW+rNP90J5rcS7HAauyC909rKiQLhuE/V0N0bPFfGN6iudoBe6YXjp6LtS170kXHv8q99FGCNn9AL19age1fSemDgUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB12550.jpnprd01.prod.outlook.com (2603:1096:604:326::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Mon, 12 Jan
 2026 08:16:03 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9520.003; Mon, 12 Jan 2026
 08:16:03 +0000
Date: Mon, 12 Jan 2026 09:15:45 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Douglas Anderson <dianders@chromium.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jesse Van Gavere <jesseevg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on
 device during resume()
Message-ID: <aWStnNK4dubLsMZl@tom-desktop>
References: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB12550:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d23ef35-d348-4505-d8d0-08de51b2d38f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?MXwOmKtTdSqpLE8xEW6bz4vyu2J7s4n42AQroaSCDkUFMdxNk5ACNNbQi/nx?=
 =?us-ascii?Q?GqOrkuKnk+KLWPdWp6kOxLtuWGwlCGRWZ2hROw4LP9HUCd6T5xSkJ76doyCH?=
 =?us-ascii?Q?195uQwYF8p1kkVlvvdcMc2mfCUGuSHvFQEg2/sVEJYvUBLOLjb453V23DKLc?=
 =?us-ascii?Q?o44n2NunMg22ccgo2dnCzLl+uots4n8OaFFK/0MlnbVVM/gUT04NjnaZBZ4e?=
 =?us-ascii?Q?v7ThmBkaJ0LhgWqg6glbr3RVJQNNmaG94VppY4uVmsir3ulCPdD4IS6KKtwq?=
 =?us-ascii?Q?KwedjDrS2WBktKNOHhpiDjYS74zo+VW4r16/LjneUHLXTsUNfpUOz4LP8EHs?=
 =?us-ascii?Q?bU0ilM0nFcvLre5AB6wXdipqby9u9fS/qCAc7VaJchmSwMke/aLEb4AjFxtj?=
 =?us-ascii?Q?+NOPV4uuVhnjiTrqhtXVNPw3u0fSTrMX43BCrSTCz1smJaT99uUMDzgWZlxV?=
 =?us-ascii?Q?efLmEdyUMV5jYucwjyyiGA5LLWcWrDENgK1AzjgXb+qu9zUUbW+GBvfal1FR?=
 =?us-ascii?Q?Zsz8FLztmFDPSPP5P07buEPksLWXdef/5Rewstmpah86sI2SUIGMfwxg4WJh?=
 =?us-ascii?Q?rh5MjDfXyf4a2rSvQBHWov7FLhoep1wImtpZkT4EFMWbc8aGVu73b+weW7u9?=
 =?us-ascii?Q?9KOQmj9z/j1HrrzUurKdQpktN85GzbQqWA7PYwfCdJYhJcs5Bs5LTZlQgoH5?=
 =?us-ascii?Q?r1Vo0f/YYa023GwWcddtVjjsqY1Kdfi8evM7gHr91UR/xPQSfhIKia/yyf5L?=
 =?us-ascii?Q?XgPaAPYM/EXKTTyBAgtToDZBq6h/CUcmNbqGqUB9w4tPLKEAABq53vdu/gUs?=
 =?us-ascii?Q?LipWhp3De5Z6IRBgE3ATFX5TjEvymHkZHng498oAxDwOX6z2S64ON+CF8qEb?=
 =?us-ascii?Q?YgBcb/sA+SYFCytGc35A71iqDXSDcpuLXkUFF3m9DMdTDl4Pq1Tx8QljB6rn?=
 =?us-ascii?Q?aDje6KX5tN/KcMwRaBzwpeWdRZPSiFyPC4IjFzVmGObXbHKW0RBWz+9Zy0LB?=
 =?us-ascii?Q?3GNdE4gzRHsakUy3qzGLH21WnlL8Ebmn/OlxYpja0ql9mFf5qKlzkjYO2svw?=
 =?us-ascii?Q?RoAmknIEUegSUsqoRO2j/qeR/m6piBPjHF5CDZWSNZd8hM4bupE0YI1FcCFO?=
 =?us-ascii?Q?GxwMo/4OqsYNde/Ofgj58FL2GB6ErCvZkUVgLdfHPPCGChC70pssCohqK86y?=
 =?us-ascii?Q?rgyZO2celCfBqnDWjWtvZ8eeJUnCKKdWM5oYJYP86WkrO4U+zYYApPdL/7b7?=
 =?us-ascii?Q?RAV7mSAg2nKr9z7oclbi1oAPtlW4a3ONsAAznbppAY/dOyYjhWyqEuPoW3aL?=
 =?us-ascii?Q?7zAguYvGAIwzgVcJH3oeanv7wGfsjbSCnU52jRJZl9a7mrj4FcO6gq5uKeKN?=
 =?us-ascii?Q?ajf1v/bJbGj0UIQHDOAYU7gg1h91oCXU8Gcxa/BDvZiyA1e0S0+Cjr+ChwZ9?=
 =?us-ascii?Q?+WqYo60WDHvvRoDLM0yq9CeE2Y2YiHWkQlski35XMD0cdd/+CdI59f4qJsRs?=
 =?us-ascii?Q?/53Hq/OJMGwAfvSf7bRrVFpSKrw+x+/80dhe?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FcICH4o6PvciMeeqEb8DIFSpD93sX48EUSQFrOZdoKJ/Y4chJlt8B7qE3wKV?=
 =?us-ascii?Q?QUgvS2/f788Xvuw+FCWgFC79BVUi2AiS8ynrSJSiuQG2alGZWWvZf3uQXuk0?=
 =?us-ascii?Q?vK7wdsALxS015rT4J+rgGk+CJxIU/eRWyxB5C05RsM/P7bNZZgJDHTkde8x0?=
 =?us-ascii?Q?okycc3CDa++tkC5V1ik/+Xf4sG3Gsiaj3Yacxnbr5HKAmSgvWaxka2IcmIdM?=
 =?us-ascii?Q?u8xOLt/TzpoVQwcVjgeSY+IC5qaPDf9Eekz/YPXY147gBNqDlT0pUAKrEBAY?=
 =?us-ascii?Q?2PwDgnaZ1l7kZ7X9IRjpoYFajjpclk1hi1nZ9v4YipDImQFODP3E86pPSiLZ?=
 =?us-ascii?Q?y+PSAl2HZ7XZsNulQ6bqwC9kte+/kEgj5hR70DcWtnAuyZVXyumzEyGzyjsm?=
 =?us-ascii?Q?jMKeQEPh7uXyh0Z+tAjRqj2lB/KEUq6tXOEk5c7olEVhJlqeQPPTHf4tq0U8?=
 =?us-ascii?Q?CvhU4dQ4LW/UwNK9XTy6B17q56U9OlZ3PMazQu7TeL+/9z4lrwQ4Ckj7gdKT?=
 =?us-ascii?Q?enUE6EXbhcmIjcMIOQ0ARLx3I6N5jbcBdcJOrp8TCUwIFX+VFwRURGQ3mcQy?=
 =?us-ascii?Q?2ZAA0EoOzRpLosOG1sobU+USXL/8GvetoLfqsGRmVIbEPrs2VNvRZpbdzHeh?=
 =?us-ascii?Q?KtiK+a6wYzYG4k+mq2akNz0QZPqK/c2Ct1m3AyRCG34haGepCemOBu6BaVsm?=
 =?us-ascii?Q?fjUqwhwX84t8YeFagxryBpcvCez4i7F4zSxAfQYbPGFm7mvcIHtqA4gIdIW5?=
 =?us-ascii?Q?wiIhC+lHV6vH2vroB6FgktaPC0jqCLqH4VLLt5xIm7thntn3uRHc73FvoqsP?=
 =?us-ascii?Q?SLjxELkUS39gjl/YCfiEJiqoOAuaiO4UkhNjTaPSUsBvt+56nwE0syvMfV3f?=
 =?us-ascii?Q?uETnGJ1BbttTYxMO+H2ygjA2/55VL36EoR3O1DdAMfdTQpuAnax5qIKwBNqv?=
 =?us-ascii?Q?pxOtyys8v/xh6rqIP4Aq52Z+A5G3feQZ+iTTsaAWP4REalB+oGdoClaq2xYU?=
 =?us-ascii?Q?zWp8g7pbk08UvsWUrbf85/frXC9CqmRJ3OQzjIl8aIcQQ2PcASPY+FyKsuZ4?=
 =?us-ascii?Q?BuNQk6SqDIQekLP1Jp1AMT0IlcOQMeeLdONrsdX9pigDzEMIEuc5YtnYhALg?=
 =?us-ascii?Q?kANhHNuA85XX7Ox3BDyiVL63e+IxUhsmOD8tLuFYhzi05BjcUQ8TgES+zHMG?=
 =?us-ascii?Q?U4BGWc4DyglQAfqN6Wg9Qrr2hQPkWc87friNSrVrDawDhBl8PnXcRe61fTlL?=
 =?us-ascii?Q?gTwHHDzu93D3rEzwuq36GgW4386prMBovqHFP/V3QPXExLO81MU6J/17w5ei?=
 =?us-ascii?Q?c5yCxubpRKLwpr8NQdFsGg7W0ZcUIonUC1bkIyJRARdxlSUIEx9lBAG4Kp1c?=
 =?us-ascii?Q?NEpgVe+so9P7wzJSFRk7UZtzR/B0TCpEo2Sc7rNLrVhqoXh8dvOJwiGTkvNy?=
 =?us-ascii?Q?KwpuhPq7P93FJV5jOKJGzzctMruhLEOzBzhLv4+yHF9ao6khJu3JxrVsJ6sQ?=
 =?us-ascii?Q?19Sx8X+xj61BI3eyd9SMzGGFEDBulIJ3FA4tngqKLxgM5YmmSwFK2qDbefr8?=
 =?us-ascii?Q?SCXjQqS1xgjxTAiDDGxVNpC2NbLH5A9gg+BowCS56liU+wXEIRl+l3TTa2kt?=
 =?us-ascii?Q?S3YfsDvwPvLnS13okhyen6PuUFMGMe89nI8rmnArSwvzR6KDdfSSnJZK4ZMI?=
 =?us-ascii?Q?YdlwjhRFncItG1atQVB+7ASW4VuGyIXOkripIF32vcPrQ6qN+AiqYySzRb0V?=
 =?us-ascii?Q?ZIY0nDroXHlaW7imV37rZ3NDZVLoJd2UDAalNI1hEOsPg9Ej5QFQ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d23ef35-d348-4505-d8d0-08de51b2d38f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:16:02.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7t8DVo0R+gEiTBoKj1btBGhLQvakPYtGnK6NN4gCZt0sqxNNy2quOxDD2AZI3wGQgbYKCcOPFFwVJe9tYKeZ2RdeGwNDGda6WIUOv2/NpvAKcGstAfEFBB/7xH5PShyx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12550

Hi Biju,
Thanks for your patch!

On Fri, Dec 19, 2025 at 10:46:53AM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> On RZ/G3E SMARC EVK using PSCI, s2ram powers down the SoC. Testing ADV7535
> IRQ configured as edge-triggered interrupt on RZ/G3E SMARC EVK shows that
> it is missing HPD IRQ during system resume, as the status change occurs
> before the IRQ/pincontrol resume. Once the status bit is set, there won't
> be any further IRQ unless the status bit is cleared.
> 
> Clear any pending HPD IRQs before powering on the ADV7535 device to
> deliver HPD interrupts after resume().
> 

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 32 ++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 8be7266fd4f4..03aa23836ca4 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -393,6 +393,7 @@ struct adv7511 {
>  	bool cec_enabled_adap;
>  	struct clk *cec_clk;
>  	u32 cec_clk_freq;
> +	bool suspended;
>  };
>  
>  static inline struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index b9be86541307..8d9467187d7c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -790,6 +790,25 @@ static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
>  	struct drm_connector_state *conn_state;
>  	struct drm_crtc_state *crtc_state;
>  
> +	if (adv->i2c_main->irq && adv->suspended) {
> +		unsigned int irq;
> +
> +		/*
> +		 * If ADV7511 IRQ is configured as edge triggered interrupt, it
> +		 * will miss the IRQ during system resume as the status change
> +		 * occurs before IRQ/pincontrol resume. Once the status bit is
> +		 * set there won't be any further IRQ unless the status bit is
> +		 * cleared. So, clear the IRQ status bit for further delivery
> +		 * of HPD IRQ.
> +		 */
> +		regmap_read(adv->regmap, ADV7511_REG_INT(0), &irq);
> +		if (irq & ADV7511_INT0_HPD)
> +			regmap_write(adv->regmap, ADV7511_REG_INT(0),
> +				     ADV7511_INT0_HPD);
> +
> +		adv->suspended = false;
> +	}
> +
>  	adv7511_power_on(adv);
>  
>  	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> @@ -1407,6 +1426,16 @@ static void adv7511_remove(struct i2c_client *i2c)
>  	i2c_unregister_device(adv7511->i2c_edid);
>  }
>  
> +static int adv7511_suspend(struct device *dev)
> +{
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
> +
> +	adv7511->suspended = true;
> +
> +	return 0;
> +}
> +
>  static const struct adv7511_chip_info adv7511_chip_info = {
>  	.type = ADV7511,
>  	.name = "ADV7511",
> @@ -1439,6 +1468,8 @@ static const struct adv7511_chip_info adv7535_chip_info = {
>  	.hpd_override_enable = true,
>  };
>  
> +static DEFINE_SIMPLE_DEV_PM_OPS(adv7511_pm_ops, adv7511_suspend, NULL);
> +
>  static const struct i2c_device_id adv7511_i2c_ids[] = {
>  	{ "adv7511", (kernel_ulong_t)&adv7511_chip_info },
>  	{ "adv7511w", (kernel_ulong_t)&adv7511_chip_info },
> @@ -1467,6 +1498,7 @@ static struct i2c_driver adv7511_driver = {
>  	.driver = {
>  		.name = "adv7511",
>  		.of_match_table = adv7511_of_ids,
> +		.pm = pm_sleep_ptr(&adv7511_pm_ops),
>  	},
>  	.id_table = adv7511_i2c_ids,
>  	.probe = adv7511_probe,
> -- 
> 2.43.0
>

Kind Regards,
Tommaso

