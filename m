Return-Path: <linux-renesas-soc+bounces-24880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB71C73D3D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 12:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F408C34C76A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 11:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F77E32FA3B;
	Thu, 20 Nov 2025 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cPC8uZL0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9409D314B7A;
	Thu, 20 Nov 2025 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763639542; cv=fail; b=Xhrowo2O6vvitjnZU2C0lSFgcd1FYwPXmgn0XSy3W1mbZeOXgnbXv5zRL5PGWbw1UGwk4Bamt80nTwmTqOq8IzU9/lCC7ZBnYPNLGhPcxPzoKUzDh9v0OQhwL0PGsgR8RVtuspDtMc9ICqiozFdj4RKkIQd11ht/1QycJ4BeCXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763639542; c=relaxed/simple;
	bh=iMh2WhUXyQPbMyoSQpaftIcbod5T5XqkXuBV71xXkkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aIF5YmwoqKfZqYCW1Pn+5im6zDOjwhzbZtAJ5q75U66TVsGFeaaqSYiMOgTO37hhRCFh16o7EA1G4Hcbp5Ko3TdCQp2YuM5Tx8pBk19WeKElVgKMj9z1uu4IC+I7PEBUqnCMZrJw9BhNN0B2sOPwL9+DUL1ecnzd9B3iDniaIsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cPC8uZL0; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4wAMefLmZhshemcTEMUE/m6odifV4G/iGpVICKLg6eg5MaPVHiONC4u16FJFXTadkcexyOi7VwmIGOYqtzaNoCbbnC0HMUxwxV/KFo4NoQMVyyJ1Do8cz4fyalOX0LikYCYiwo2yszvJ9YlUsLVQd9sEvtPbyKfhxDYKZ6RcB0ghJWLHsJ1hJbetbVeMZamiEtovM696WAmhpoEUH4KhAYaEvTZHrLE2IO649sqc2Hm3hwecPZZMh5XmJxzoFd4lNkjOzWfUixThT8YuYD2CrzgTDTCwliZtxVEQbhQntINSZQX4fcojFaZ73xvj/aQHQ4abB64RfwPWt/wHpervw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4m2rl6KVt1/k5dnskh8mWA0Ot3lpr0prd94f69LydlQ=;
 b=B+ZgjiEKGGlAKwYAqwn71T7y3s5lhUpfewoD+QwdwPjMSDnT5LwizP9C+vGSpCgc9v2wyMrLHBMk1zLdRhn6/dJ/tveHr3I3t+Xdn+vJ1hpTw2sfvD3OgwT0eXBeJQKOrM5SSdTnJ21RiNXcPtIsro6XvfVW3O0qP1Px6p5/XUHj83X1aNoL92eDBKy1bhWgcie8fGUk1qJDt6HxAdHqB4kNfQsL58ybJeWn3sw7nwQyxKDutoDpkJKPQPuyLfTHmhbPY0lrs4p8Q01uPyDT+rQksMyKMRDomnNy496DE2Arv2s6WMxvE7yl6ES/1bt9BaaFI6bTR4TqBNeDJz93uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m2rl6KVt1/k5dnskh8mWA0Ot3lpr0prd94f69LydlQ=;
 b=cPC8uZL0WGz1WaBVLFX499VpDGK83aDyqR6a4OCmlg3cNo4dqAd/U/CdPQPlYOtIySR109dXBVDXeDx87N05bAdPgIiN2BCHa3XBQvRW94J3tqabbwk6KWWZGEOX1MJHQJfw7T/9ypVlMm4Q0Ft7ESjyCxdQseuZ+e5KjNlhb9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11636.jpnprd01.prod.outlook.com (2603:1096:400:37a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.9; Thu, 20 Nov
 2025 11:52:14 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 11:52:14 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	wsa+renesas@sang-engineering.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C support
Date: Thu, 20 Nov 2025 12:51:39 +0100
Message-ID: <9d1cf2cdb1c11f24378404142e4c8aff680c6961.1763638659.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763638659.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763638659.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11636:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7e19ed-617f-4321-37f4-08de282b3ef1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yuadHETvCloHe/xYgUv+2TmQzDyYuishrD3uKvX4yuHKHy7vSx/BvM5/AO9o?=
 =?us-ascii?Q?eQHbPIbo0J8gS9KFM8zyLN+1mxWejOSXRo2hXd9GKTpWoHO+YOH+0QTG8kwz?=
 =?us-ascii?Q?QyXW7X+Kjoj9Tf2FQZ2JVq6DTUoZfiVXlpfKqLMk5FkC4VctPPqVs3MFeFU+?=
 =?us-ascii?Q?XLrMt75EMuWNOTYDcDFQZwRDrG1SbIqnxXaPocL0OnjkmQk8tpKo4FpgI2l2?=
 =?us-ascii?Q?XKrppdXWFwD/s7GHYMrQxB6BPAhJuZ6BGN90uBBqmmLzcEKFW3kI7a8xloRF?=
 =?us-ascii?Q?OKFBNiZKiqp+rmOUZPcIVyj2XscikIUOC2qpyNWSueuHmthArq+snYrx9kGi?=
 =?us-ascii?Q?EA7+MPgtTmewZag9wW5cLnHf8WyL/+ABhQZObdhGDhUJW3OJCHGl0knBnyxQ?=
 =?us-ascii?Q?hCcbWPkKFhatkt/iDTPG2Fba/gf4mbCR3ptFyHEJl2hGv+syZhFUHV0NUxa8?=
 =?us-ascii?Q?av/xYWsPw3r890s3+VWWUMQgY14YgeOkA287+TjUskLPcA8hi8dcsJ7W8v//?=
 =?us-ascii?Q?FYfUta+B9RFvAX5ykMfxiIlRprAvXy3FNQBmS93Sr+qWIoXO4sMQzx1eR1iA?=
 =?us-ascii?Q?dNC+DJDwKfGYhMqt9vf1ubqTOiPti1bxNPVP69guD9FYTEVcR3Llro+7178n?=
 =?us-ascii?Q?Pv0mSV4x3yZ9Mgv42vEyPfZDdQp2EneMklZPGF+z4JMkSyM83MGdQ5byKYQ5?=
 =?us-ascii?Q?a0OZB1KbH7jlftVjaAC1bP+8y9ELkGvf1v982JHtpJai2MuY0wbYDZkGQy4P?=
 =?us-ascii?Q?Hk/OFm+C3MKDoup2Kf0EinTG4BDNj0GdVpGvyA1FJOl+7zWKocHm9Yiy4F2K?=
 =?us-ascii?Q?dlJ9ai9x0BfyV7GjkUR4YMFMKxmlNjfCh46qpz54XSsRZvTfY7uJvaMIsRtZ?=
 =?us-ascii?Q?Zheqyu0BfEfIEF1S5kD8kvo641W0eSt2i9A3pvcLrIlSApqZNEhugHEF0Mco?=
 =?us-ascii?Q?seRSE+kJTpspmPdhp33vMnQjnLWV6dKLGWVnPngVmcgFrlIA73vqYBqoWjwc?=
 =?us-ascii?Q?IL6bX0NS0fmRRz8hjMe4JDNxfYXg8CNdge3Vh/x7Sa1bOnTzpu1sN6wOb1z0?=
 =?us-ascii?Q?n7EHTEzZIjNEjzQee+JHMgfF2zOjE0XJyXY31BHZn8WXvbpAEmQF3v+8QVa4?=
 =?us-ascii?Q?fUBA/kFlK3XsGdM3H9bnn3iZF6r7P6+7gRafkzSyrBvpf8wiYunycLxw/XPJ?=
 =?us-ascii?Q?ZU7Y/PYiFOaSrKIq5reN8xzHMuW1eHPZoLqhHn3tJRv+M74qvw61RHfqY/2w?=
 =?us-ascii?Q?0zoQM+qh3LY+vThDsdQVL0Opn7YK9wAzzsR4VfpPF7UdRIGT7rKvv9s94Bfs?=
 =?us-ascii?Q?T8olmuav1u471vP3DejYmnJLKaoqLJHQte478OB4ubUlLbOJYCUmKCE6hObR?=
 =?us-ascii?Q?LZr0SW4PnvS7XqBNS1W1sNdN4F8xNhMNEG7NdIdT8vhveVV5pscz23x1sNBP?=
 =?us-ascii?Q?1IJ85kM0ukU1REzj7mAps8cDFTybAOWB6MuGWtoYSV/x13sd+hOjNfuvfeG7?=
 =?us-ascii?Q?6j9KgukkZkFDR1/vcmiJvF8aqT4EvLgbU5bf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tRlO8J/KG7KUCrgVL+I9eautv1zyZ8jql6pUXuCPqpQ7Eq/ZzH2eZmVKdnej?=
 =?us-ascii?Q?fJ56p6TrD/0Ty0EAsFjyyWMtUJscWAZftcot327CVzE+YJLgMjysBnRqfOGg?=
 =?us-ascii?Q?c2mclJHadvyKMJvzPullawvduMDEI1srREXedq22STfSSQJevHkDIcORq0Wi?=
 =?us-ascii?Q?LsTR0OfNJVNDXXCWiVsz4mflxgk5FHdKsZtwKROnq5aNbytx2iRdrIgzWhGX?=
 =?us-ascii?Q?pbmIVzaViq41WZm6ALo3uxkxfNpb1uSVknRU6FONsSDLXj5vs4F73oF8m1bB?=
 =?us-ascii?Q?OL4liSPzdl3AXP++zxbpLjXa36XZLTk3n7FuCFgyuZuKKsBICFbJxXJTZOKn?=
 =?us-ascii?Q?d5rChxNAScugUN7M5pMYStKOSWpg5b8isirSB9X0PRRjuwGTC8DwJjwfpOeZ?=
 =?us-ascii?Q?dAjPNo9nDAoKgqMoW2+H8CPaBLSvoL/EzF6HAKz2HER/B2PzNWQHPI9cTfrw?=
 =?us-ascii?Q?aw5MX0ZxxzYjFSTfbPJLtWcNgEeRWBkSIQLOUAPWWZDHLX6HtKSTbYlAlF1u?=
 =?us-ascii?Q?mZFdY1CZAFz/kWu1tx47THSyPzE+xiSi04lBOUd1nAhb7y3TGi9Y95Q+q2E8?=
 =?us-ascii?Q?G/R9qYjsRirIcMmKKJ9ghK71oTDWv0wnFK1HH3y0JmUqVjLuw9oPilYiCFU4?=
 =?us-ascii?Q?ZV1GjPv0u+tIKz1mg56cEd7bLx2EM4s6oaToPsvOSTKzcoaAs/UB0X/1cg0b?=
 =?us-ascii?Q?xu1aLHYmqezgY0m54G0kW4jxP+2k11iE6ZkgEDYzoUfCTLXxHXTA1mQvEaQx?=
 =?us-ascii?Q?06FFHPs6gcYvHjRvifDg5jCJ2PUSF3sc8nMtJddKTZJuZ3I6+pYTmXFtF1O3?=
 =?us-ascii?Q?g41Pmp0C5Mahkl+UKr9tJAVKlTUmloFjODuxc3+pnjGnT1n+qfBKaG4Vbd30?=
 =?us-ascii?Q?6mM10ZDnUrqdHUg85YIcz9s6dAvPwdyFyXuy71M5xZAlYNGa7ZM/JmjfNQVY?=
 =?us-ascii?Q?WPivY5voO0ZDgEdf5x6cFQhYdN7Xc9lkKMleR8fCaJsuzP9r+MRZRxf4LPpk?=
 =?us-ascii?Q?gaFep9im7+FyvqL5MN4u0KjmlWfJpp+6J2wjdIHn0sWCQ+fvREg4rVt1nOGI?=
 =?us-ascii?Q?uosNgxeF5hN+UuUIADAPKruUVKYDFGUBintXD/aM0jH0Qcg6FrVQhCaPbz8S?=
 =?us-ascii?Q?5CfifST593mi9q+ZlzO5Br1tlkWUwqdaL+8ZRPWhsZSf/jzPt/S/jYGr2u8+?=
 =?us-ascii?Q?P9R0iCLQBsjKjbQjYTWHOkMCmCYzsaHo1WpNHOayoKscMzcr9Y6kKzGBNacu?=
 =?us-ascii?Q?o0/TnZaQGhkbyR55Wv0pCDW13z5Hnid7x8+liH0mXuNGR690NS/gOxFoJ+Iw?=
 =?us-ascii?Q?xv7LwBMNl2q+EYvTz2E4baQwtldCnIM7aAPhmvG0IAG+11K87P2FY94s5DdL?=
 =?us-ascii?Q?kBdvhkrdgSPcWzqAR5bzOZhYbOAbRR0NT7T4lgKVcPAE7nDf+QrxpWZycOEX?=
 =?us-ascii?Q?qU2Raw4rPv7ioKAFeHqkKOP278utwxp408/mnOc3LpYjBgSRqDS+jVmX//+L?=
 =?us-ascii?Q?TVDGg0weWpcrquPzv12X2UD5KHcfPgnFxCXU4X9edpqYXvwtb7aq4pqwEu7t?=
 =?us-ascii?Q?2MJ8oqK6T92SNN4kcOrPlZyo3J58XBkobmDxCnWD9WNqnveYzD3hlqLUiwKI?=
 =?us-ascii?Q?olZCaat7RfUpAHds8+Hdxqs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7e19ed-617f-4321-37f4-08de282b3ef1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 11:52:14.1626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Njn/34eZ0DaVDqN9+XOG3jdGBX+WZfh2zSOux2U6zF/m8gQHwJb6XsFwKjxn+MoFB75dZVETFChUtyQDTyVBlrxuZewi/bVdXeNnrUpMJRhWUgjSxPDDTe+nG3B7dGEB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11636

Enable I3C on RZ/G3E SMARC SoM.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Dropped overlay and moved I3C support (pure bus mode) directly to the
   rzg3e-smarc-som.dtsi as suggested by Wolfram Sang.
 - Removed alias as suggested by Wolfram Sang.

 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 7faa44510d98..f05b9fec05f0 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -122,6 +122,14 @@ raa215300: pmic@12 {
 	};
 };
 
+&i3c {
+	pinctrl-0 = <&i3c_pins>;
+	pinctrl-names = "default";
+	i2c-scl-hz = <400000>;
+	i3c-scl-hz = <12500000>;
+	status = "okay";
+};
+
 &mdio0 {
 	phy0: ethernet-phy@7 {
 		compatible = "ethernet-phy-id0022.1640",
@@ -219,6 +227,12 @@ i2c2_pins: i2c {
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
 	};
 
+	i3c_pins: i3c {
+		pinmux = <RZG3E_PORT_PINMUX(2, 0, 2)>, /* I3C0_SCL */
+			 <RZG3E_PORT_PINMUX(2, 1, 2)>; /* I3C0_SDA */
+		drive-push-pull;
+	};
+
 	rtc_irq_pin: rtc-irq {
 		pins = "PS1";
 		bias-pull-up;
-- 
2.43.0


