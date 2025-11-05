Return-Path: <linux-renesas-soc+bounces-24168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB1BC368D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 17:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF71D663A87
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EBB3358A8;
	Wed,  5 Nov 2025 15:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dQcTBrW6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7E2337BB2;
	Wed,  5 Nov 2025 15:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357315; cv=fail; b=KN9vNEmM8I87/eQIgzACjNG0KVp742xem0xH/lfo4sfc2QWE4ZRZeb399Gpfc5WhaDRAbw801CdUzB+p8EYsw4FtVaiHYd9CAGpyrTQqGzI19j1jQowbRab8FSSXiM+Cy6peSoHGxdGq2116jG4q+aGozzBXkKy27PYm4sX2KQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357315; c=relaxed/simple;
	bh=XVbw+KI6MqI2t8rG7Q105SCYfkA/xOKgMFKgbFt9TRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IOyAr0EYXgyS0jsQdGoWYTo5B9Yl7wmjfkzVOH+x/afabbZQp6vR/fvGE4FPhLB7yPDQEAkvQlS+SXD6N59t+FGDqEEFbitmodo8lW6SbcfDM0U5NmJJ9DCDTXnwFAiNTxUc2W7o3vI6/SYMum3XVpt18dDHUZfSgJZpSUiYbto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dQcTBrW6; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mokh4OMCs1OuR7ZbZFkRr5xZw1ycwlP4r1i1MSMCSbaIM/h8z8ZF0tH/0CApb3GwU1TEGOJ3ZYACYtn/ES+EVYOTWM1NZQOSAwyyRENQDd5hHg5C4S2BIBBCzB3uZnOT7OwtIeK+vyUdqFfpP40u801n6++e/PCUWHGJH1JnWCUsIk2dzN5EIFdxUxCfwYs/TUziKmqmCJ9Rk/wzqmXMexP3dnNv/1XRLkiDBYjudPbseQESSgxCTn900XA95s8PIv5O3sLwl0EIrCoc+flfa3IM20KH/1fLfNwne9wzn+8Ir4elvOs6iGS2eF3bITBEaNGUaxPPWmr8Q2VmGp/98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PCdbCDgsuuF4SkqvyH6pL0itN6JfEcmQOhd0EZNkbs=;
 b=P4mhoct1pKyuzge+IAwsObQMLWWBZ66NnaZjANq9Pktfkry6Sc8yIA8BkAG76HdLmih+SYsgodn+gMFzJQswnfAT81n3m2Uw7oTWcIi2x29H+yMyDoItVpT+LpciewVY1pERgHrs+yWAKxbPMV4zmxnrGEKMOShT5fd8um+0XlGhqOrDBQaIe1jS6VdNrtXPN0xCP2Y3gxwiLpZc3zQ95jxwAwO7aKoQCNA3gs73CGB3vvAr4dMIAvE86C4bpa3gaI7e2oYZACOMxcTp+SADFPX1r4Wbv/CC6/raKU53hxxxNrDfIdvn0ZuM29F+skdHTrPZD1dLwURnJoVgpEzTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PCdbCDgsuuF4SkqvyH6pL0itN6JfEcmQOhd0EZNkbs=;
 b=dQcTBrW6t90tWQTgjc5SA1fi7cmt24HHaxYstI1qVv3xTg4VQBFP0FAqcs2vWuFdbW1a50lkl9DGLUpFHSPNxcgiYzxSDEnHyWc5KhdvprLrS1PKNMItV03WEwI1C1TmslEiDyNOkYu5tfBt+8M7YiqvjGcN114qg8xMtrPigM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:41:51 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:41:51 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/21] arm64: dts: renesas: r9a09g056: Add USB2.0 VBUS_SEL mux-controller support
Date: Wed,  5 Nov 2025 16:39:11 +0100
Message-ID: <0f9404b2092675a92bae902f5ffa7e817adc9d58.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: 630eec9d-9660-497f-af79-08de1c81d696
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dy/l5Law+cF1mQSI0pUFEGHw6bOmQbRISeSztltKrgBKPIcQhNprZbUkJT9F?=
 =?us-ascii?Q?Xe/NLTqSjg20U0b2MIBHCqNpQG9/6epPYoH/2mUH6Ldye67wr7aV8TNTIIFx?=
 =?us-ascii?Q?6a9kaCVqUYLOu/9XxXISVPPVeQzL0PmVWmmS8wYoeSFbjsf81D1hYTOjEbsO?=
 =?us-ascii?Q?rxjU/NEbbtwZr6G+uJQXYbUQik7sKbPkdPJ7km2lNdjJKSiJrdK5DJJqPRB1?=
 =?us-ascii?Q?sH4GDRlFRXJQL8+ZqEVcXJqp0RhrrOzkUq/SDAClTzZg3dLTvd3iUJLmdZVM?=
 =?us-ascii?Q?M5NtLteyXnaBcl9VhS6z9N4WboP4KYe7gukRNqevWqDIkq8lx7lapJFxH2av?=
 =?us-ascii?Q?n8tJZNv5/clf8ufBTEwJCG+AmTCNBxzcKm5+47jkvAc9zME56O6tUAUGPh9t?=
 =?us-ascii?Q?yZ++ANIDhCkVagHt7PdcQDKmvDoDhbpY57BdcG9pBcchAo3taCa32BZPvMpa?=
 =?us-ascii?Q?oenYPvxkn7u1kuLiou8GTOZU9EX3srjKLGFFKka0Peh8MnXaqW8eLuBrIuNt?=
 =?us-ascii?Q?BfTLAKmFlERLs7+BYAgxB1RXDAHhjD7cqk9kMhBUFFtR64QdWxY8guyhwOgo?=
 =?us-ascii?Q?+/cLs6cSBg4VpdCQqpKJcvQJXvV7d1mvfxL7B4OVZ9APWM9Hroxs7vtNeky0?=
 =?us-ascii?Q?+ylDWWWrcRlIxZQklmTPLLy2b2/YSUCYdy6AS/ge8cBGhe6Jdq5sq5ZKVApk?=
 =?us-ascii?Q?Ssp23qe11qa8liWuH0MQE4TECu6C93ZeSVO39tFDSZf6g28VMlAsPWkZJbNA?=
 =?us-ascii?Q?poYn16mUefCYy81qthtGIok3+igYEL2dFz4i6yvrDZ5tnet4h2eJAXfJmuwn?=
 =?us-ascii?Q?gcmZILmeU93mA0mGIDZRrNq79UJHzaR9ANBIo2IxVacylm08DDC8k2bpExKv?=
 =?us-ascii?Q?w1wKqPvxY5PJaZKw0SC8FtuOz4Mqt2ZtULp/XLcWjI7BbbLRm71wz/pFhDlm?=
 =?us-ascii?Q?Y8yONw0jDCm79ursPEfao6r0D8TNw/X8clKrGIssUbR6DzRiPfWL1M1k3bu8?=
 =?us-ascii?Q?wuCk4mxPddJ1Cz2YRamwlO/Sa4CCBQoF6zoYKtyv6lLXSY9MJdLkr9PxfChJ?=
 =?us-ascii?Q?bYzWUA0d7SP6VimamQOJEdpk7bq4fIz+ycqn9UypWesMctvBpWhXU5MY9W7T?=
 =?us-ascii?Q?pRih16m7+X0lzC0kMAIsTui2D43VxtwVLGwPakjbUGSx5LSF0arbU3ZM9oTg?=
 =?us-ascii?Q?5v+g2vn3RgwNuLBT0H5efPwrdmnzel43fV6GcFXo2iZyFdt7YqZWlmv2TdW+?=
 =?us-ascii?Q?nnQXzJ10LHGXEms/eWUN/EYgjbBizHHtwvj/zcwleuFppQj3ErMr/spCijDO?=
 =?us-ascii?Q?sGS1XM8MJnGCUOePEECkyt6iJw8M8IbfkkhaOxPoraUbqYfB/s1RXQ1DPnXX?=
 =?us-ascii?Q?538uGfORmS66CRRZqx+53mlrvlI2M2LAftPZ6l8VO5Zv85PZi/eLUEP/TZCE?=
 =?us-ascii?Q?mZWzxFhbHIfJ+3PA7I2LsOTFbhxKzs+qUF5qgxhpz+2F/XWT4mX+Ui2zN61S?=
 =?us-ascii?Q?e2txhE2e2QJtABVYOG6VB/HBfRgTc/jawikw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LvgUTnFMG9Yaq9kJEasdCU0lG4dKiU28gpregrV5tSOW2/Ae5BGcA1xeS+7m?=
 =?us-ascii?Q?pzZkaNOA7FXX8SiZfAEEAQgWSE/lY7jNfB10TASijNLt3qpxykk666jOs+g3?=
 =?us-ascii?Q?u2V1XEHlXuTxnrJLhmB7LiOBdrSDvVsJQzZMKM0vlQ7K4HFqhUTbfoBpYW6m?=
 =?us-ascii?Q?+8jJqdsdqUVV4oEtBpy7eoQO4MIWqjeJFe3B2L1uZWXakXljhuX1ZoF487WI?=
 =?us-ascii?Q?KHP80J9XjRz4tqe7BTbQzib6gPXs+8mjx29fSKT9g5xjZQA38G1LVQfB1oFt?=
 =?us-ascii?Q?2sVk9YTd/WW1coA50RdMz9nTPtTM9HjBPX/4DEB3R3c0cpBzB/cFIGZsg0NF?=
 =?us-ascii?Q?nLdquK68iUgK6gU8mDEq4WQmaVEgIBd375144h7AumV9Y6lLw/jXnwenM4tJ?=
 =?us-ascii?Q?5e+dqRssG2wlUgYlCoiID9A23u0UM1JgfTKiMBqHbl74MN7cdSKxUOOgLLaW?=
 =?us-ascii?Q?j0rKcqOiiqaD7D+g5lmzJzVwUV8wTFe8/9B585onnz6vU6xLQ64G2oP7/ZsJ?=
 =?us-ascii?Q?yqbGNbIOQTJQ846Y/mNO5KGacUFA7VOs5ybFVkA45V6Qp9otYNlndknCx8al?=
 =?us-ascii?Q?7ZJcheiMqs1sZiEQIvnrOX5TyPuQ8P2C59Zujhbjr7XpzCOHvPAalBvLSLdp?=
 =?us-ascii?Q?4rNxsKCNi490EdzBRNso+mSQZFvBuBmpLt3gEPIMO4nL3zHXlKTX9SSU+kct?=
 =?us-ascii?Q?e79tA0K88gOh1WSfTNSm1FD9h2hWZDWmdS5M8qdv/aUrFyVOAXZtFKNCaL1h?=
 =?us-ascii?Q?1SNkBtD1qyW/KfM9TOiZx46mELVESpAtw8MvkkUg/VXfCc45ZiKn9FCttiK5?=
 =?us-ascii?Q?2Me+txHXd1doK0v7c/aefKyNOZPoObPSqygGVNCyLsc0UyCl9Mq8OiN7SoB9?=
 =?us-ascii?Q?prKqFLxJtd3lJ2iyEVZG0xSgYc7bQ7/3r2EYweZjm/vI0qLdX21DTysOfDlv?=
 =?us-ascii?Q?xC5TbZ+eOtODbovINJbL07QqnyDQsG4v8ADf6Pfl2rC7eniJ+GettebgM0vv?=
 =?us-ascii?Q?7B3GsEj41AZ5u3ZPMRvnfwxO4PWxUhxXEkL2ylWdxE38YDTv1G9AzXf7kH6W?=
 =?us-ascii?Q?JT5lNcMHl3A+vfm6IFWi+jqB88HhZRUo3rrVkXuJkhjU/xf69pQb6xAk2ONj?=
 =?us-ascii?Q?416iPfmEwDwdzUP/IxX9w3Z9Y1f/pUHF2IAcZhO4rgMYPV6hQfswQDDgNvmg?=
 =?us-ascii?Q?bGGf/gqIHlGdpYlN9pdFdfW0EtHg+1agbEzsGtpCoBTNCkPocyJ2b/foBtPN?=
 =?us-ascii?Q?G8IAu1XZLv/d8oarGm6J4hMCwAKpsAZMMX0boSLMYi4UTZwaKhC7JdpGGU9r?=
 =?us-ascii?Q?vNnOebTNoMRTPJDvT6DQ+gha1Kx+iQ3sOeXSYAUVciwOm7dyih4NFX/8uuS3?=
 =?us-ascii?Q?vEgpfZmLKh4ZNQFggQRv8/ZdoaUXvO/9XiZrANSLdcL4+lUx9rFbrtM7614R?=
 =?us-ascii?Q?Z622OYW5r4yCUbGFZh8zATKlSMHMQpH6wzu5E0VzAc5lPsLQldbFQzfUwmfu?=
 =?us-ascii?Q?f3WxcHwYwk6uC0P95KyqQZlsXtDXrqXFM/FOjBqfsQLMolanAAh6Fs7FIWYB?=
 =?us-ascii?Q?8F70hhv+5G6hWC/8b1CAJaKNSsB+t3JfjZ2WuYVsSrdWXPOiX7IdVhY9dT0J?=
 =?us-ascii?Q?L71c5iVDhsAWWAjytdi7P5c=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 630eec9d-9660-497f-af79-08de1c81d696
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:41:51.3270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sEpO8DEU+amDwkf+NvWNJd+XjZo7CWrtp3BDOcnEc8ujt3bmHXV9Y1gU6xs4wLBBhdW4S1ZFeIueVVKV9Np7Ewb5UCh3Ac5oR+LDTEz3jvFLfMoEB4kV+wsBJvex4YSt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Enable control of USB2.0 VBUSEN via the VBUS_SEL bit in the VBENCTL
register. According to the RZ/V2N SoC hardware manual, OTG channel
require VBUS_SEL set.

Add #mux-state-cells = <1>; to the usb20phyrst reset node to expose
them as mux controllers.

Set the required mux-states in usb2_phy0 (OTG: state 1) node.

This enables proper VBUSEN management for OTG channel.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 8781c2fa7313..fd2b72caeceb 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -663,6 +663,7 @@ usb2_phy0: usb-phy@15800200 {
 			resets = <&usb20phyrst>;
 			#phy-cells = <1>;
 			power-domains = <&cpg>;
+			mux-states = <&usb20phyrst 1>;
 			status = "disabled";
 		};
 
@@ -691,6 +692,7 @@ usb20phyrst: usb20phy-reset@15830000 {
 			resets = <&cpg 0xaf>;
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
+			#mux-state-cells = <1>;
 			status = "disabled";
 		};
 
-- 
2.43.0


