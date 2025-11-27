Return-Path: <linux-renesas-soc+bounces-25255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 16547C8E251
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DF634344F2F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653E232ED2A;
	Thu, 27 Nov 2025 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eQKn0i6V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD7832F748;
	Thu, 27 Nov 2025 11:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244302; cv=fail; b=NOlT32F5xcDV7npsXUaVbnm60mP097nkbmy/cIR2auXt4FxStc8gSd/3+3MXoMZZcE+r7uMJGCok5OWQECN7NUALwBnGpxw/l48FsEyDS81VDCI+TFGEpXQvFT8YNdbi80WodRrs8W1c9UDbB8UujddEkmaCcVdZiiE67WeoI5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244302; c=relaxed/simple;
	bh=l5fz29OO9C/osY0/KDMVRK5+QWzMYl85aL4tg5E0ZUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YkckWn0s5pmV/T0Y6h6Ai6VDfaNm6LHRSy74jufq6SW6gZyRh5oBduL6Hq6E7qqHAKQDxtjpbeWPJZcfetf6pckPSTnDZ1raRYxpviMdWi2I68TIiQ5CJM0ZDOwh6sVLit4sLdEsQN20StyIbrrJx9PKPfRK6V+/5cXTCNvKscU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eQKn0i6V; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/tzf0J423CdpAg3wUsojVWScxithjjDydZNaEjuE8mHfoe0qR396m6ZZIKZKp1Uz6NQnyg5QtKjK6CFZRQSzpowOfIQBiSR+rAmw9Hvk52XobmTnRVPmQh0zH8gZCkllAkaYBxLkJbVkYbvGICqs9/X89LlExUKYvz7zNhq705HLiBMv0A8flPo8Lqe78i6/zifSt7UJoMcG4KRdg/MNAZ82FI7uK0PKiCsvz7DHLBs+cqVzbku4GOaf2eToG3T959iAJkrJI52W9qqzz8YjYWj9HdB7+npg5ZZkCeS9k9sUeMJjPU6dg0ddd3uuojKneR9o03EjKfxLZLKHejTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELvu1lunL8Y9ZrFKAxbIIanfYfnW7aC0aPpmIWGbuZ8=;
 b=wUf3dHoG4KKNijuCmdMBEaNeZxdDZzNHwaAsnQQXnpyqTVTV/Z1+0NwOuJPQQ//+ut3F44YfHSMAEVapcaN9ysxI8rw1AkbbfkRbq2cmcJRrhCtYwisJDCG8CnZTqzS2+2YashdI8p4cdyvcwDyOkzoJL5Dh4Mk8HCjRXEoEWyTb+pWL8IEw1byeNKc5z86YeAoAuZwiogmhC8c7wFsEeycnq1wSzo0s7Vx9dN29wRk3m9MlwRPy5PyFay0H1+yqkTTdoZMeVHxVy/HpIko1d7ryn3mQobgWaqZ2HvHoQkBjKJQpb7VBbqfVoZbtsSdkV81eGNunkCye/AGrREjEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELvu1lunL8Y9ZrFKAxbIIanfYfnW7aC0aPpmIWGbuZ8=;
 b=eQKn0i6VFYa4VVqJGwn0WfpVqTNu1jH0HEim6+R08NwOPy/SmblyGYQ160dF2j0Yq0IN0o1k2Kn+kQykYco6K6XthuA5Ka4f7Va61jox3CcGnoYwD6olUU8TlUHeeoNs4hIuSIFeYSk06y064PnrysOmY8LslVY/YxKvH/TBN5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 11:51:38 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:51:37 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 15/22] arm64: dts: renesas: r9a09g057: Add USB2.0 VBUS_SEL mux-controller support
Date: Thu, 27 Nov 2025 12:48:42 +0100
Message-ID: <63e8022438eb0d485505c262cac383d76c804403.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: b600cc8e-d0f5-42ed-1497-08de2dab5231
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hyCGsoH1HgT1P59Vwg+CSVK6skLArGllC/3iwyTI3QVkfgyh1t+Kg3LhnBRZ?=
 =?us-ascii?Q?AazP4aGSm4FLsk5Zb042lKeRov+AObmmjlonYiYVPfTE5hJ+TOIZcyaV7PuI?=
 =?us-ascii?Q?GJLV1768pRHXGGs0ON0us3EAxAKxEF/hYUWtAgFivePbRZnE8rKPRt/Vr4ql?=
 =?us-ascii?Q?t1k+tUyEl0qWRt8F8o0ijntyWkIR5yJXsJlMugiRFm3mzu77yJT3FGGODQ7h?=
 =?us-ascii?Q?s/3ThEy4sYvUZUYt7tAq/YRBdhIASpuR9A/q83NMy8PZlqh8gTcl2/4eJKTH?=
 =?us-ascii?Q?i7FbJls1B9QjEipBa4PBm5WbtoFliFVz+jYgpZj7HjwosPQmo7vc53YBGVUF?=
 =?us-ascii?Q?SONw31m+pjRfkdDNAIUT1+2Q2XTvKYRYVca71ex9nRkVSubldfgOMo/pSsQq?=
 =?us-ascii?Q?7v2h0mQ+8lfY12QThehXSghjpUqcth0kiScaquuUh8Y+y9pNj52lzkHYljK0?=
 =?us-ascii?Q?vCvLn/M2tAWomH9uLffy/6/mawX1qdkMg5TuXx/vnZ6ra4pURwg2m9ZF9QGi?=
 =?us-ascii?Q?OKjYta4Mz+YRHHIcu8lMXcek6hlkvk7HAj4rGaZXjNipabaI/IMZ8qNfQbVe?=
 =?us-ascii?Q?1TCafapA9XUjgo6oqNxqYgnBQpjrRFwoM7s+MkY8jrlFAi64O/oV4nhaQmiY?=
 =?us-ascii?Q?Dgl9AY/BfMH8rYB/CUH56F8guueNzPRypeGmNelxmc9ZakL0GsvAIR85+ktY?=
 =?us-ascii?Q?0yE21C5cnv+rjiTGlbiddYUfw/6cDFaXnMMBkfJm8tIvBlzP1qdwauuWuMMp?=
 =?us-ascii?Q?5HHbhnSP2qc98Bvs1JSd9VRK2QetNCF8vjdOEDCWwlDSygOZjPCHNAEu9tLv?=
 =?us-ascii?Q?BTsP6mWfljCD7Y64QonHFHWwyDRPJ9iCWTlGMVJqVlyeqEQXBs1OdxrO5Bjk?=
 =?us-ascii?Q?y2xOHkOUp44034oOXZg2JCy3k89VT/vBdI8iOPj6NKZ37oH9Md7PHQFrDEtm?=
 =?us-ascii?Q?pAQpxMkCeCGlXIDBy7tN1aLMb54yj2/Zac6oXM4N7kiEyiyYmcUoxzj+sEOb?=
 =?us-ascii?Q?uI3cPyMWgCFoFLEZdNhyVdP7GFRAbRJcfnv4S9bOc2m8R1+zgoJm7pac3t2j?=
 =?us-ascii?Q?GAbDOAEwIvwkDmNxhaOxJztUniTmwCAM6BKeiS6CTjv44Ik9kvCW4cD30IVR?=
 =?us-ascii?Q?xVpOcTx/P1qflvdCjM30WJwWL8NCu9LsWGKSl9NofAIgkDmmlA9xawiVTaMs?=
 =?us-ascii?Q?QJNdMrnaTmdcJOTfePdxBtXeUQujhAh74bRpCERKQl35ZVhCvsdkft5vBzwe?=
 =?us-ascii?Q?OSELCeDSoL543Col1LvbRzjHfSAyYon3BSZryEJM7oZch4QWcozmyTLHJ6FQ?=
 =?us-ascii?Q?3C0FRrrG+kaOuwI90hA6LYlPAecfS2sZfmkkZu6QWY/9SJ4Hp+lKxMLr7Knk?=
 =?us-ascii?Q?ayt8xXzd04oI1PzFW6zt428yTSOhSpb+HDFX2iLjeMYgAKBHL93XscH5fcK1?=
 =?us-ascii?Q?yfjjS2e8P0TkK94iiDwdH89oTRDrFuhnT+kn+nNU2HXdsmWKZYYlmZv95lm/?=
 =?us-ascii?Q?5NvqNwp9MUDrH2OrRwbTHAeA+GAIWd9zQDgL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xkeFVcSQBjkjI2CpCBYfLKgPyrmldqKShAe3dpOGrumXUelT9mYIYWl1+7p/?=
 =?us-ascii?Q?xSvU6YXA0nx8smD9CpA6+BDigm5aqzdzIrsdE+A87rH9irW4whjpVbnOrLm2?=
 =?us-ascii?Q?38/InmS/Skjl4NRpvjlFVsL8M1jfn3bln+WPc0IJbIo0oMYbxaBxIVoIscLs?=
 =?us-ascii?Q?MX1gMBxvF1ZDj59yRDPSHUrY/7LUNnux/79vVy7thf+K5UziCBamcNQnGd4J?=
 =?us-ascii?Q?kycfpueHP/yCSbO30l1g+WlLUeVLas1CJTRLuQUBhDjWpqMtZGHvXz+12YQi?=
 =?us-ascii?Q?vfYy8kx1wCIWqNwCgE0Osay/qFz+ipt0ZYaiIoS9tO0zKK+KS2AqLgH78UiJ?=
 =?us-ascii?Q?4HQWj7hsdpgNP0XIv4p/zzUB2HuICJtr5aKrss0K3F4PqDzx1esu+iaCQ5+w?=
 =?us-ascii?Q?gBoZo02IVTUPBKNoT02ra9hTWwltEiPIxhbPTS28tqIIGsrOW3rleqfcVb/e?=
 =?us-ascii?Q?6UcEIFjFudj/gBGm6QUXABh1/vUwDOJ71MvQ4xbbPrVUZnYS8B/RPq/l9qmO?=
 =?us-ascii?Q?F2wLzks0c3VAfQMCapFkGxtSZ/QTUKyiVIx+rllXo2WR/PcpwirYP5VQk0OX?=
 =?us-ascii?Q?xtyZVgcVatWPjgMG5SRx1R5sL0XvQso7BcTMF0b7v5BIZ3f8/OPBALDnl0OS?=
 =?us-ascii?Q?Ou0/xuWYq7w05T7VW8jmQqWhJzuWI2mXzsd1xbwGz0WfzXkrc7B2p/yv5yyG?=
 =?us-ascii?Q?Sexdf/zGR/aYRlZBlt37PV9OxdqZy4M9qYhBEAL11OelcGJ/KzReWj7h81SI?=
 =?us-ascii?Q?zfa4bXZbzT7bEIpvCTAFi8iGsMNiIQHe04ZlgS64HVE3BlgXxk27Mmk5hjel?=
 =?us-ascii?Q?Eoz0xK2b2NY+wwO0sacdZgMzJNPTOgt9nR5LV0x3Wbj3/nh70ChFlEqkAO4b?=
 =?us-ascii?Q?NAp5ydIbFDoy+lzM+yGBb4PcwFKhBBJ9oMh5uoJxlDBMUm2SCMqngNKhkDdM?=
 =?us-ascii?Q?JMiciFEUxX7ieCPJF8RLKEQTOOGZFwuaa8tYhnY6rc+FoNfoxChuGvtSe4d2?=
 =?us-ascii?Q?/Gh9Po5c7C5H8a+5jClyhra0hLi0e/m8cbnjVvEYQXTfPdDHzxzCVyheO7vE?=
 =?us-ascii?Q?moOT4G6BLNt9qfEQgn9CUK/bMmT4arccfmvZQEAeO6ssDZVr2Z/TFt8WlX9I?=
 =?us-ascii?Q?pnFj+hpwL0snHvhDup0r7bHj1Q0WqWhCTlFnns7hbdqgs2sdbIzdrePBihvE?=
 =?us-ascii?Q?zkA0/DZBmMHL7QdhFA31x5N9bJYoSlEQECPmTv3Wua8OVIGyyPQCFO+z8irm?=
 =?us-ascii?Q?SinlrPejt88fSihbacqJ24+jd4ePENuVrINnlIYfSGTRlLWcvDbqNWLH5kRF?=
 =?us-ascii?Q?nJ36vlkAVULz65gCBvABNvFTlKT43+b6UKSQryzADaU3VZaaU+qy6kPewbuC?=
 =?us-ascii?Q?mkRPg3mO3JXcl+oIzyus8vxJfa3HKIKRvlkL7CuG/4icJ/MZpaDb0XgiDSSY?=
 =?us-ascii?Q?yC5EGmO7nS/2SSF44s0FuIRRs5hbAKmrAZwa7CPpwC5Yplf2BZU3PBXu209P?=
 =?us-ascii?Q?TVTPKta33DBoiLxZkl3IEbTW2wz6t1nTfOCb2k6TaOnE9r3/FM/6LOfTAILi?=
 =?us-ascii?Q?vWYKXN6EDRFyN1TwfGs4b1du7ijIpFwYrPDmSoW7Wdq/LLGCs/Zire2fDcdu?=
 =?us-ascii?Q?hlldJBT3lTnAc+j8FEKZ9h8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b600cc8e-d0f5-42ed-1497-08de2dab5231
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:51:37.8424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDbNyQi1SYfgthRQtTxshcdvYhZfyDPGW5lZpT7u/2II2Z21Agv59O4buYe8koMMW8AjVtN7Z0/pUhUNPoqVGrFaCn8se9zdnDuGPMbzue4F2MNcs+2fkIaOUULlOtpU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

Enable control of USB2.0 VBUSEN via the VBUS_SEL bit in the VBENCTL
register. According to the RZ/V2H(P) SoC hardware manual, OTG channels
require VBUS_SEL set, while HOST-only channels require it cleared.

Add `#mux-state-cell` to the usb20phyrst and usb21phyrst reset
nodes to expose them as mux controllers.

Set the required mux-states in usb2_phy0 (OTG: state 1) and usb2_phy1
(HOST: state 0) nodes.

This enables proper VBUSEN management for OTG and HOST-only USB2.0
channels.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - Switch back to v2 implementation.
 - Improve commit body.

v2->v3:
 - Manipulate the mux controller as an internal node, and update
   commit body accordingly.

v1->v2:
 - New patch

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 4df32d7e9998..b4bbcde33099 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1034,6 +1034,7 @@ usb2_phy0: usb-phy@15800200 {
 			resets = <&usb20phyrst>;
 			#phy-cells = <1>;
 			power-domains = <&cpg>;
+			mux-states = <&usb20phyrst 1>;
 			status = "disabled";
 		};
 
@@ -1047,6 +1048,7 @@ usb2_phy1: usb-phy@15810200 {
 			resets = <&usb21phyrst>;
 			#phy-cells = <1>;
 			power-domains = <&cpg>;
+			mux-states = <&usb21phyrst 0>;
 			status = "disabled";
 		};
 
@@ -1074,6 +1076,7 @@ usb20phyrst: usb20phy-reset@15830000 {
 			resets = <&cpg 0xaf>;
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
+			#mux-state-cells = <1>;
 			status = "disabled";
 		};
 
@@ -1084,6 +1087,7 @@ usb21phyrst: usb21phy-reset@15840000 {
 			resets = <&cpg 0xaf>;
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
+			#mux-state-cells = <1>;
 			status = "disabled";
 		};
 
-- 
2.43.0


