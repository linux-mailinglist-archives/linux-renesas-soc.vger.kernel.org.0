Return-Path: <linux-renesas-soc+bounces-24961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A8FC7A828
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D0B64F453D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D5634BA56;
	Fri, 21 Nov 2025 15:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GnN5Keqj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9773F34B69F;
	Fri, 21 Nov 2025 15:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738012; cv=fail; b=lH+qKNYUyQzh0zhWhnCryVZtqbsXp8L0xUJYfsWHPWGcse8qFWvfhUaWqKQTj0NkpKlLl9NqnP5CQ4uyS9V6TbZXUHvEBD8H++YTbqtjuIuJKjzKAA5DDGBORNS4+evyvbVA8j1b2xut7QCD7svsZWGi8nR3lsH+UCa342RXclc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738012; c=relaxed/simple;
	bh=UwQ2s1nHAY7r19fP9FwFiZMWJ9eSzYKp6uvBdqa5a1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JgzRfarZH2QJTc36+7+bD4bwwufVcTxBJBWLabyqthvYF1CqUuC64Y5aqOAWQZMxpSPzNjZvVSamuILxdxyJVMqBVo7f0+qHquU70k10xGya8uyUDNFWSdAxRkX7nQb+6Lh4VaPIQo/dOBuGmMYydMF8d3yqmiH/twFelJ6awYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GnN5Keqj; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8Yeynw59UiutSzc1hPoDV8IVwsmU8a/DMwIY0pLMjl2SU1hI5S60JSRGXu7wqEDdeMzaESecvRxypMkdTdlwN0kKKp0hLTUNvrTYuYLrUMhOc6Pkzu6+lWMKJOk1oB2XKeRcv441IQHKACIdoVW0ZmIAKGTEZE6XnSv5GgRCC4BrXlxuYeSKp4sfx+8Ayx6WQCM469BBZIrw5T3cuSSzfHpPzQ3NY76HZeiHhH0FvxCYUwUPPkRtzca8x51yYW2FZTKlMMrITdLGyajmLUVTBqygXjgNbwLz9ipK75Dkwbw5UbzoJJjzlYlq6jinHq+Kqs/ev47iHX9DUeJyGLeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7vPSXpgraMhSqibQhPluygR+QNJ92ib9gSgQSFa3GU=;
 b=sV4ajEpWl2odjqB8DCIMOZwycljja9myKMaTVlHM5KdkbLrQxrfaE6KYayRp9E502mhsTMPFH3s2zVHdYHbQ7lM+h5HzU3B+ZpBJ4cbF1VhQeCloeBZH+G7qKrxbYwSK/haV0YLyht1W72e8k7fWi5Rj2A4SKhIH/L/akoQwM9j7e5tEZO0UU7iBXD0UxiWVYphV1XdsN5gxovyMlT8k/xNJXA2XjnwsxjjeDLy883rQ0F7MPijoRIx9GGDdpCFYhn6TBQkaO5lG5aAp3FjXzUk74QA+FIGSBle4aw0dNixgeTQEwvug3hSPA2YD1Tmidhfg35w4rm0Y8obcVkSLow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7vPSXpgraMhSqibQhPluygR+QNJ92ib9gSgQSFa3GU=;
 b=GnN5KeqjAQTIcGeFkZ/HwBKBjHJxwAIQ0jT3pFuGOqTOO7ONJy3SYKG3GL6RKxtZCtqAqnNQcfhu4Gl2fqJNk2Sa01j1ttKQJcdQa365Ten+Mf3SJkrTmfdXugqJ2A/KuhrMEP5jkGJAEEMAzcO9UVjPe4Zfg2msr1EPDFhkM+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:13:28 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:13:28 +0000
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 05/22] dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property
Date: Fri, 21 Nov 2025 16:11:54 +0100
Message-ID: <15344aacb65516789ab946ac843117da00781604.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: c884d7e7-15a5-4951-2735-08de2910863d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rb9kzxDtoVrG1fFZGF/p7/N51mx3JxFY7+mtt1fN5tgpdjA5ARf0vvY1GIn3?=
 =?us-ascii?Q?G5Wtn8VjWy3HV5UlwXoZrqWoKTngv40tuUXGoeOGzpVg2pYHJuhuzoOfYbzN?=
 =?us-ascii?Q?0aK9ThD/keGdgr6X7giJVRT+QT/RbZQpDZgDRp1Nn+XkG1TvAtVVkyOuO+kl?=
 =?us-ascii?Q?c9wiazgtkwRITQyjZJxatRAxc2ZTwNtWjDCElQsqaGub85xERkBIPLUiWqRf?=
 =?us-ascii?Q?w6cXxAMFWD4O0AIp7uGjMcjzrcvIP6m5tWrtzNOQ0E2ElPIVZ0NoLopPpk9E?=
 =?us-ascii?Q?ktaoiRthkgbOTGBFE1fWKSqPpFy+uxF98a+I8w/lolMIE5RTYcB+RrJnxkTj?=
 =?us-ascii?Q?O7jN9qJumNj0BUzi84Voy/3/Mc5isJglWDRmTJVTYbZDVTt4J0+BvMRoCOzG?=
 =?us-ascii?Q?QcURPk/bNER1qa4gur6fh9UGKqiLQHudTqcLB3i5VuKgcdKdhcOz5xOw3ovt?=
 =?us-ascii?Q?yuJ64R3PMuhqiNe9935vR+4PzsmwJkfYY3g9+UHJa24gWAWn3MM57dxfeLKK?=
 =?us-ascii?Q?mtFBVHbmPCYzliL4dgufy2RWquO0jIJ3W2ukXHZzYs4yDc8WjrtMfRvRDnXy?=
 =?us-ascii?Q?EfZsHuZkvhb0XB+jwLgtoJbClA8wELGW6GVBcD+0LJxufu4Gewz7//g84xTL?=
 =?us-ascii?Q?B9Jw33mk78UgXtWvDnI0/7a4TCf28mqSNEasTgX7KNLNUCmNSdFinxImXiSj?=
 =?us-ascii?Q?o57qsxyZ4lJX7tY7HL/1uWfToqfmeGA/5NBXxC+5J1V42P2TrM7aqaEmOPCS?=
 =?us-ascii?Q?d9y4OXqIXjKXf1KiS/Ch6WRx3uW1zgrg4OYj1uSlKU003sQlb3wxarw1fLyk?=
 =?us-ascii?Q?Qa7JdBXv7QUkWcOISJzifvqu99146nT+seBUDr7FK2+QXASZ9KR0AbubfBNH?=
 =?us-ascii?Q?pTdIK9al5nDvyJQ6sNZ07lAmGuWBdG21dp8tZmYuGBqIaYxwjIalpggl6NO8?=
 =?us-ascii?Q?bVocQmlRuf3zZQXESf43iXYhGMtoXRYUpGNpltPHswNhuMKVhBBwExC3u0Ao?=
 =?us-ascii?Q?RGkqIyAQJZ7VznfiDfopp+D3fWC+w7m/qVU8doG9baONpH6YCAG8c6dUJNNb?=
 =?us-ascii?Q?aZVJzbtJ4klbKT7fjhhFliCSz86y4wCDmkjFHlHR5ngfDjXP1N+Y1jCozWVg?=
 =?us-ascii?Q?2/pM0NIv6uHig8uJO4DURhBsAC6btdHMwJ6vSVT9PRQxzbiItJcbSsYZ5hHN?=
 =?us-ascii?Q?+QFRKYODAFw3ZepFmvgGUEzbEBMfzlsL1xkF33PzwlG36Dgj6GErCZfcvGPQ?=
 =?us-ascii?Q?ipR7q/dBvHyeec91GzhF1Xp8TchktQFBLBITcK6qaIASzD9aUqd2Oh24zMOO?=
 =?us-ascii?Q?OTJR7EbRyOkH7chOa4nAR5xKDNuzaKJRwmUYSfZWiRFec1YD9Hmj22U2HKmy?=
 =?us-ascii?Q?lP2AfBAh4GzIlSDBdIj7AOxpeEsiUriG5inqdXInTmL3hEYvFq42O08ClR1H?=
 =?us-ascii?Q?CPlvwlKY17edxkeljqfjC/NCRlHNsPk0TAm9nacWb82+00U+vYgBudgCR8d4?=
 =?us-ascii?Q?4wpnJGxcPeqOmhE0aGXwRHGagDtdiQvkwSyk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xWSXgfClG7mF8IxcIox93lN5tilYT/4eoCxdz002y5jY2RP4GcsCRMVZxIbm?=
 =?us-ascii?Q?qRwih6k1V2MkcycyeBPaNLSbASKUvlph4AjRX/mwknPTU/Dn50CYW1BfnQuF?=
 =?us-ascii?Q?xfKCMWIHFh2Apu2OqaHtJS9uKJflM9RjaIiq9t+bhk79EpTF9G8cArHO1CKa?=
 =?us-ascii?Q?TOdlbZyvAt3ntFge2NfCrHiN6+V/XXzrCqRVhZohR3LqoI8L1IFh8847iH4x?=
 =?us-ascii?Q?OQkHW0D7sCjXD0CoVPO/yh8KL0KKE/9+QYxSw6ZIEF3pq9uvMXpCNWrdEDdJ?=
 =?us-ascii?Q?iq5F7LwQ9TZoOyVCvmd9NOlEgv9p5EnxhTuh6BqdpICfD/OXwt0YPw65djBJ?=
 =?us-ascii?Q?Lat51RmpRR4HGcBh77GATxzWSb2RKItAI1l1iW06+pu38p8BoXWgs0/ZDKFW?=
 =?us-ascii?Q?RtTU2G7KZYEY2pp/GCz4PveuwtgpSeiz6NUxuYGSx3cClpK+kRf98/trz6Ou?=
 =?us-ascii?Q?UUsX+cwu1GdOtFqx560zaaQcVvJS9ZcY3eLaz7fEcgj0gvZ6n0RrAaXEbRiK?=
 =?us-ascii?Q?2IyWdwsubpEotv5VGC2Y8bTOPfKG0hzNeyIAReGWiyKVlfwcm1Sco+ZfhnlV?=
 =?us-ascii?Q?nTMYf+E8ZRArwqI8PVwlz+fxzvfbuT4Zq3A7BpnFsvDShK0pUi00UWsHf9ma?=
 =?us-ascii?Q?zc4QD45qagSblns7eARbwese6WlEQgb4rCF0oS9K83a6TDwVvJlpGdNzpiXG?=
 =?us-ascii?Q?bUAn0UrJrQMcWT3PzOUK7pcOEnHfB7WAhYdypQx6YW1kwgLWF8af17rnVxzL?=
 =?us-ascii?Q?OBQzVDLCg7XBCnmY3oz2OgVzmwS8dMzQYgh+SUfcuNB4t9OnOML8l3jZ8JNf?=
 =?us-ascii?Q?tvmjSwmrVKMnY5xiWI4pypT9WyEr57RnX086l2ly6nvoON7rdDo630Vk6Cmm?=
 =?us-ascii?Q?2AaEQ2CQs7zkShGNNNsbFQppMEJQIsyLD0KyarL78+M9rmL1L7XaxWtljiPv?=
 =?us-ascii?Q?aRpS0iyo8R8dFzHjcBH8RcVRk79ME5BqkWC6a9DOCJidLKielEjms3dYhRDj?=
 =?us-ascii?Q?vZ56HBqamu8fR0fA1AwU91QqTuqV/CSTCo6J8fCAiFhPY6cIOm14rbO7oC6J?=
 =?us-ascii?Q?VcNkNP9xwCljrRLg8RXkopVXgk3U4jGEkUR7w3S8kaLEtQudsZI550t4GKmL?=
 =?us-ascii?Q?29V8cCW/NVQtMWxcpX356Pe5d90w+GIWYtVLIjyadtyUFw0gSGL/ww8Qk3ZW?=
 =?us-ascii?Q?rpxSL165GUw6PCoRqTvsjMo3wXUqpliRdHhQ+sI9WdfGhTQeGRBQoJuwOmqn?=
 =?us-ascii?Q?2IqbpYHY+gvSRjiI6hWr+wOwtKpvo4PaUEkksq1yxA70TQTNSHpwgQRh3Cy6?=
 =?us-ascii?Q?iyS0UvuFkXfaJV/l1dckkkXjHml3Co+eLkeHWiwvI8M1V4bMhw2MPcml1J33?=
 =?us-ascii?Q?K/c3Ez3PYKQRWWskJyCKxDH2IYeb9gTBWcyLSOj/jJXUCjIDGM0amXMimFkC?=
 =?us-ascii?Q?GjyJiWTlpMhGFPVxPdNoSI7dRN+TXp1J/T41NWdEZVcFzY8EligYfMRnk46l?=
 =?us-ascii?Q?/BwwXnwFixuVAm8sGshaPPDIs6IHpUOo0G5TBUUywVysW5fvR+FbyAt9VD7l?=
 =?us-ascii?Q?2CgVTs+FLfvGtGpFNzUn9BeaxeGFjXBql20aM6bAWMIjHM1Yi++wjMiJKPfO?=
 =?us-ascii?Q?6CD3HG9zXlgOVYRINYkFZU8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c884d7e7-15a5-4951-2735-08de2910863d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:13:28.2714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtHtHMcV0Z+8QDWJRaEnVVR/C9ftsRLgMbZ1rKoanWiWp6ZDzVEn0dcYprZayKtdT4jKMHX/18vXElhIzqezufy1iin/UZoPfENX5M9ccKcJOSAa3xMImvcXix/YNky4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

Add the '#mux-state-cells' property to support describing the USB VBUS_SEL
multiplexer as a mux-controller in the Renesas RZ/V2H(P) USB2PHY binding.

The mux-controller cannot be integrated into the parent USB2PHY node
because the VBUS source selector is part of a separate hardware block,
not the USB2PHY block itself.

This is required to properly configure USB PHY power selection on
RZ/V2H(P) and RZ/G3E SoCs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Switch back to v2 implementation.
 - Improve commit body.

v2->v3:
 - Manipulate mux-controller as an internal node.
 - Improved commit body.

v1->v2:
 - New patch

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index c1b800a10b53..7ed0980b9ee1 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -37,6 +37,9 @@ properties:
   '#reset-cells':
     const: 0
 
+  '#mux-state-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -44,6 +47,7 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
+  - '#mux-state-cells'
 
 additionalProperties: false
 
@@ -58,4 +62,5 @@ examples:
         resets = <&cpg 0xaf>;
         power-domains = <&cpg>;
         #reset-cells = <0>;
+        #mux-state-cells = <1>;
     };
-- 
2.43.0


