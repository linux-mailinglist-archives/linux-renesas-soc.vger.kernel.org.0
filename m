Return-Path: <linux-renesas-soc+bounces-24962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2620C7A774
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05D093A22E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83BA34B69F;
	Fri, 21 Nov 2025 15:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fIoG+SB2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AFE3502BB;
	Fri, 21 Nov 2025 15:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738022; cv=fail; b=We0BzD2NrbEz1cgqqrT+DArR0Wwz0N/qKA7zEitFYERTs6Y2njIVpX/PBc1ya9o8mzHjc96yfszjrf9mBpN2VVFdA87C4XSgg/lw8upgT3Ls/pjvim/6MSp4qQf0P7Wq6v11HWuzB4MuYValTt8aqcsp3OGuJHbxnaxXRn80jq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738022; c=relaxed/simple;
	bh=5ux7YRIipmLRBe9VpukqDMQAG3HyucryO0sZFkI8cT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s6XH0QGKIIJziTtugl60KpVTJhyjn4QXGINPWcCEm3GktXxiFWKcRsSaC5B2XuNcijINzrZ2rODo8cZ+JjVmbIOupkLTGWCl/EJIibfBQpsH70EsNHWjvdfQ0melyfnI1f9r3woUuzEV5syJ95RQlewoIj9cOY1hzh1c129LVxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fIoG+SB2; arc=fail smtp.client-ip=52.101.125.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQLvqtuP3c0UB7U4DY2bz0ad3sRv+Dipba319OZv3ZECDCb4xq8l3OThP0Qey6JcFEUXobJ7H196EOe9PMAwJtYk3JHpC9bgJS4IL+4NgjBt8uqwjHlGU9hd5UKJqKfT8PBCyFnouf1pJROdy3VF8OYbACWobh7KgeRaA3KHSvYoJGTIRnASARb1tEp1JIYmZWmhni1ujK+ZEc2o81eXegD7D074B2IBph3bgftTsCBHpCI2W6MLb7m3nct8t37E8tquSV2P7RCCPmifYUsLsCdzFF9O2zA2JngjhmnROdoReQXOC+ol5ABhwTNgYUlA8Gv6knUa+LExTN0luLhJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPcM+XuGWDoYN/XNpOW3GS3zL3+ouY1TQaP9hhPz1YI=;
 b=NgIqa6tuvwlLMeHWk3o4lXmPBCIC6gfCJp/I1A8chEM3SDs0QRQCkBRBdb+PsdbaxEkrmTVo+ReEw2MUjufMdF0Y8rud/zKbB4QTMrIEHdngp8uXaNtx50XgYkfuaLxIDia3ZDU/aXfVIg8kvDsfoNr8RKS/Vlr1f0z1n7Mdtyk2t6xPizDZMCHHuS99O7d6mqRXNw5JAJ5f0NxRzTwt2toouZa1hW+dQbE8l1gDZpm9ta9kpbpCakP3b7CFOMIcEeI5Us9f9JIc95wvFHlqE1qGthtTuJbV8f8PlluupkBnYc5PwkH5Oa9JvAbreW2ZsAStEt/yqH9GwABU6yESwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPcM+XuGWDoYN/XNpOW3GS3zL3+ouY1TQaP9hhPz1YI=;
 b=fIoG+SB2YUR/j5y9iJnvMT0rfWIzP0HPoZjnhCE6GxKbokHYnvAU9geXQoBN6sDhz/DOUd1vN9ey6HBBMjXSqRkZH4SEC2u0C2qTma256SFnU5qCYh/FN4ThoH4p5OjGT75qYXyCGbj4Z7kBruB2YxzvUNDfSmwPD1y63X8QxUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:13:37 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:13:37 +0000
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
Subject: [PATCH v4 06/22] mux: Add driver for Renesas RZ/V2H USB VBUS_SEL mux
Date: Fri, 21 Nov 2025 16:11:55 +0100
Message-ID: <d4152c7008cadbb1fbfaab3d7946b036dcdbcca8.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 04ad8ca6-58cf-488c-83c2-08de29108b9f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1xqg872GCm9TmIjrZhHkrHi+7fRAS+Zc0tOOQOOYr0ucklyy2uIxC8+IQYEP?=
 =?us-ascii?Q?UA1ZIKoSjuzVyRXDGBjfd3y+MHj/c+vhamngzoZu2PJbquexXmjrFzoAdfeK?=
 =?us-ascii?Q?+U4EywsL+WLRt3vbHVe54JLGYMCT31VzI3eEgQYcXn4yKj//54itPNQTWc5o?=
 =?us-ascii?Q?BMTd+SgS7t9bzlmaXKoJuBC5WyaCt47XAcDZpbcbNaU9UyEBEqSuIgQdt4fu?=
 =?us-ascii?Q?GQO6q8heClOYWwyPG2bl30eGmK8MgIc37s2ZiETYbxsYQnAGWBBtCNC6NnjH?=
 =?us-ascii?Q?6zIFa8CjlFFDiTcmiRmSSd0Mc6qVHgSYPORuJqejyELxcR753zS/t1jVQ/ss?=
 =?us-ascii?Q?jHfczXSYvW8sy/r5JXTmg9FD4nlKPO8+HF6P15jLC0i0ALBbrTMAQDtIdyrN?=
 =?us-ascii?Q?DN44XsiP4LVgUURgzO3le2COlgQbUfG1PA8323TTlJJq1wjzkNJK+0FtLfCY?=
 =?us-ascii?Q?YyKSt0eR84wYFWjGysd73GBsfo1ySlEztQ0aZhAeEjupPb5G6HTldVrRhuVv?=
 =?us-ascii?Q?DJrVfuXtqf2KmX/ySZ9PbEqnZ5RFJ+XQpSOxfZZaaYbRr3q1ptTAX12DCiig?=
 =?us-ascii?Q?M1Qp3us6Ma0zEK46IeiPjOoNwis/vIGJ/Gj4iYLtTWl8jEmMhsK04egBqEAo?=
 =?us-ascii?Q?/dowCSyhQCyBEjS5rsDoPzhjMyvCzf32xf+apb/vPIZHkcWI0rZ1TsJcOgQO?=
 =?us-ascii?Q?6BXrGT/u0tXcIehJPVehwHpnbYBtWqN0HahjLDh7IHNCmV6BlDmpuixVByA4?=
 =?us-ascii?Q?RLxy/UyOrZfh172ruZDtZHouq3vkPm/oVmuN3sOCQloziZku1ki0CQuhhIpj?=
 =?us-ascii?Q?r7xdUXAIHd5W+DglKQMTsbBrBhZVaVOEq6amGyEqfCctUuo3KWcnsyCuVcsv?=
 =?us-ascii?Q?fgXC0aB0zPJiwxBLl10+ZD5FL580G4xo1EJav1Z37J1uU3qQrlGEY9hX/783?=
 =?us-ascii?Q?EaCWY7o8efC3xLi9EVtaGbOA5p/nY7Rpc7QSk/QiXqsU4MfzB8iW6/RxeiNG?=
 =?us-ascii?Q?DkhGt2n1kul8bEY8/vEXt4A68JbGyJw9ITMn11c3W7p1FOZd98WuWbO7ltKj?=
 =?us-ascii?Q?LUpOp/UwjcKEgS4PmBBeI+zy3wz9PC3ASfRgOzfUZm+nH3+AU3X6lp0+8Hb2?=
 =?us-ascii?Q?kA6f/nlHs9ijbjSrDw7fzr+u2+e8qr7JP3XS9SHhWb0zSiXLx+OOI/0N1zDq?=
 =?us-ascii?Q?NoVPzEagMPux/tW4EBbmjF/AQ0Ej67MWuDz8PPjo7zyND0TmQWPk/370iUxJ?=
 =?us-ascii?Q?y7b8ANcGCLpPEJ+m3JNCqHbVvacF6YAJwtIZuTbtkugm/TEBH5OSOcpRN4li?=
 =?us-ascii?Q?8mB48IRGdn1hzbx3yJTyP22RwEvYLG3HH2FMrooraHbLE4+SmuTwjOe2RUTw?=
 =?us-ascii?Q?IogDUsXz+tUEDD7KQAx6U5V0EoUCN5FhslXhpgyLQDtFoJAZXOs1DOUVJEjE?=
 =?us-ascii?Q?umZ6nu+p/NJwwYx8G5IOAkxwnb4qusidHetlbzgogSia4AuXl76/iSjoxyTw?=
 =?us-ascii?Q?wzQ5kJzZDaRZH25dfSSUsDCtEKpufsMb0fCx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OxN34/V8FLUn8KkH9wH2VEeZRyeXYXkABNqzYt5E6Yi0cwiUSkDttEWBmTkp?=
 =?us-ascii?Q?IjgLstpcba5fHj8gELAg1K0AKrekzEs58uMbYCz3xVAJux9OPeecUK7mw7Au?=
 =?us-ascii?Q?2pZqg6oDm8CfMYcRiboX1ShiMCc+y6LAXFOeflT/9mFlN4l16/YdURuMKTWl?=
 =?us-ascii?Q?Q/OQKXetB4xxoi/8Kc92GpYiwE0Kabbe2Il2tklD+K0QdkWIUSe38mJeBzbp?=
 =?us-ascii?Q?CRxqlV52oyty0SsvIxp82MB+Vss0rxWpFYorXrJ5YSO11ZQ/s/8pZ6UIDzGh?=
 =?us-ascii?Q?NHg+Guk1BDOpNF3qdjSfRnCNDhAgrHGxwxvQeBlPdaarq+YLXfPnYbd2+dxf?=
 =?us-ascii?Q?EA47LrVZOQNlpn0sN+jKX3GSuOCfNqYWm9Cx3zlqEHJ9CPCKvckUi28/rMqI?=
 =?us-ascii?Q?UYzcbZS2LrojVDziRkDu7NpM1w36ANQD8B/1aBiSlsNUHFvX0o3O7NzvrIso?=
 =?us-ascii?Q?rVLyF+EQvHQrsaacX7B5ieJ0SIsF4QS+EUlr78tRQoOJf/kd/7fm81qeF5sF?=
 =?us-ascii?Q?Yl+pyiZ5BR6v2duycdfM36aG4g8wBzIT4N8ldfUGUpE8E7Ps4eYwnyIfA+3G?=
 =?us-ascii?Q?29Vy0SjgPcB4CG3LpzAE1wuHSQyQD+HhOF2dkHW+PNMbO6A3XH1SnaGjVdE0?=
 =?us-ascii?Q?Goaao9zLD7ENkZhtmzPLGvrRu76jODfEJ95J5OYktJYbN0q3qm7QI3fhxQKQ?=
 =?us-ascii?Q?T/xMD0pw3yCYIeOTkmOxLCeeEnKrjUPxwCrLVjiD2vne9UzXd0lAWyX5vg5I?=
 =?us-ascii?Q?xG6QYP0w23tqRHFdrTP53w3OfIW4IJF6tmu08OiDRYrP3HvRBu3RiRfljjM0?=
 =?us-ascii?Q?ns0MRfYlzWtDSmqthUGOD9yZWAXN4rjkILmAv25Ji0DKbkd3zmSnvVhXfdcK?=
 =?us-ascii?Q?IZ50gbqPzilzAKhquDRKbcJa7bEHbEjPniywycF3O8k8xXHM351p+VI95E7E?=
 =?us-ascii?Q?+SKeUb8fmYO8d9/Wjp3MVGE5psL50YlkQS3z0UjxL/2zVwSxzoldi14XHdjc?=
 =?us-ascii?Q?4PTLUOZry/3Gp2ZAL2lyShRygdxqgS5rCApqiFfPAVorjyvXshAmWOy6Oe2k?=
 =?us-ascii?Q?XjLesAOLHTPVxXECQ1UNrFY6fkwiNjqcKq77tYZJzCsY3M9SLLpCQGLjcRqA?=
 =?us-ascii?Q?Vn0VNTmSbgYP+C7dz2/C6QWPf/3by6H9C3sRmbTHGHkZFRtabwXOeG5XhyYP?=
 =?us-ascii?Q?4Gh2/1oUQEPGfX6nIjXmty/ZbLTXaVF9dicf9ztFZlMsiqphlDuRatVBBxCV?=
 =?us-ascii?Q?v09/ed1k8dYSnmoQwsjnoU6RROeJSu1X3hUgy34+S2+fIKwBoXm4jHipX2FC?=
 =?us-ascii?Q?2JRBxGFeepaTj+O5lT+7h4mr06vD/0uzevuEm3w2oOw1j6iwkxvJ9sQuCt/A?=
 =?us-ascii?Q?4kziR1GFvQCRgEnOa/QMlGGi0BIfkREdVUHUZjqPpCD5ECWFor4aplXl5iM8?=
 =?us-ascii?Q?8n4uBxsM+E48dqLG+Lq69dlBrhkYiD1VAQrHcmajx6Gemyog+3fX6FA/6y/a?=
 =?us-ascii?Q?BR5GFN1Mk5kyR+n3S7pxiaS31tiOAG9nDAXG9sAnd/XqL8LPautjohdBHowj?=
 =?us-ascii?Q?f7Asm0c6Nm4P+G2nhsw5iX6i2XVvlMJcASHYuNNC+HnYLAVctCk8/nfT1GLG?=
 =?us-ascii?Q?UdC/xEEshujMs00SmDlwa/Y=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ad8ca6-58cf-488c-83c2-08de29108b9f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:13:37.5266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bPis9wjzfsLEks7b+pcrHYmANTpv+U+RK0DOrAsp7SajkLER3SgRcQnRDQu3jugdt2CEtQxnDG2GZdhvqMVJJLqo1IFmu3larQufUWO6nUGAsZN72t/qD10rt3U00pc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
bit of the VBENCTL Control Register. This register is mapped in the
reset framework. The reset driver expose this register as mux-controller
and instantiates this driver. The consumer will use the mux API to
control the VBUS_SEL bit.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Removed mux_chip->dev.of_node not needed.

v2->v3:
 - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
   is an internal node.
 - Fixed auxiliary_device_id name.
 - Get rdev using from platform_data.
 - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
   as it is needed.
 - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.

v1->v2:
 - New patch

 drivers/mux/Kconfig                       | 10 +++
 drivers/mux/Makefile                      |  2 +
 drivers/mux/rzv2h-usb-vbus.c              | 97 +++++++++++++++++++++++
 include/linux/reset/reset_rzv2h_usb2phy.h | 11 +++
 4 files changed, 120 insertions(+)
 create mode 100644 drivers/mux/rzv2h-usb-vbus.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index c68132e38138..604f625544ed 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -59,4 +59,14 @@ config MUX_MMIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-mmio.
 
+config MUX_RZV2H_VBENCTL
+	tristate "Renesas RZ/V2H USB VBUS mux driver"
+	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
+	depends on OF
+	select REGMAP_MMIO
+	select AUXILIARY_BUS
+	default RESET_RZV2H_USB2PHY
+	help
+	  Support for VBUS mux implemented on Renesas RZ/V2H SoCs.
+
 endmenu
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 6e9fa47daf56..9421660399af 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
 mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
+mux-rzv2h-usb-vbus-objs		:= rzv2h-usb-vbus.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
+obj-$(CONFIG_MUX_RZV2H_VBENCTL)	+= mux-rzv2h-usb-vbus.o
diff --git a/drivers/mux/rzv2h-usb-vbus.c b/drivers/mux/rzv2h-usb-vbus.c
new file mode 100644
index 000000000000..9513bc8f35ff
--- /dev/null
+++ b/drivers/mux/rzv2h-usb-vbus.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) USB2 VBUS_SEL mux driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+#define RZV2H_VBENCTL		0xf0c
+
+struct mux_rzv2h_usb_vbus_priv {
+	struct regmap_field *field;
+};
+
+static int mux_rzv2h_usb_vbus_set(struct mux_control *mux, int state)
+{
+	struct mux_rzv2h_usb_vbus_priv *priv = mux_chip_priv(mux->chip);
+
+	return regmap_field_write(priv->field, state);
+}
+
+static const struct mux_control_ops mux_rzv2h_usb_vbus_ops = {
+	.set = mux_rzv2h_usb_vbus_set,
+};
+
+static const struct regmap_config rzv2h_usb_vbus_regconf = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = RZV2H_VBENCTL,
+};
+
+static int mux_rzv2h_usb_vbus_probe(struct auxiliary_device *adev,
+				    const struct auxiliary_device_id *id)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev = adev->dev.platform_data;
+	struct mux_rzv2h_usb_vbus_priv *priv;
+	struct device *dev = &adev->dev;
+	struct mux_chip *mux_chip;
+	struct regmap *regmap;
+	struct reg_field reg_field = {
+		.reg = RZV2H_VBENCTL,
+		.lsb = 0,
+		.msb = 0,
+	};
+	int ret;
+
+	regmap = devm_regmap_init_mmio(dev, rdev->base, &rzv2h_usb_vbus_regconf);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	priv = mux_chip_priv(mux_chip);
+
+	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
+	if (IS_ERR(priv->field))
+		return PTR_ERR(priv->field);
+
+	mux_chip->ops = &mux_rzv2h_usb_vbus_ops;
+	mux_chip->mux[0].states = 2;
+	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id mux_rzv2h_usb_vbus_ids[] = {
+	{ .name = "rzv2h_usb2phy_reset.vbus-sel-mux" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbus_ids);
+
+static struct auxiliary_driver mux_rzv2h_usb_vbus_driver = {
+	.name		= "vbus-sel-mux",
+	.probe		= mux_rzv2h_usb_vbus_probe,
+	.id_table	= mux_rzv2h_usb_vbus_ids,
+};
+module_auxiliary_driver(mux_rzv2h_usb_vbus_driver);
+
+MODULE_DESCRIPTION("RZ/V2H USB VBUS_SEL mux driver");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/reset/reset_rzv2h_usb2phy.h b/include/linux/reset/reset_rzv2h_usb2phy.h
new file mode 100644
index 000000000000..06247080a66c
--- /dev/null
+++ b/include/linux/reset/reset_rzv2h_usb2phy.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _RESET_RZV2H_USB2PHY_H
+#define _RESET_RZV2H_USB2PHY_H
+
+#include <linux/auxiliary_bus.h>
+
+struct reset_rzv2h_usb2phy_adev {
+	void __iomem *base;
+};
+
+#endif
-- 
2.43.0


