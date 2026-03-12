Return-Path: <linux-renesas-soc+bounces-29285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHudAe3SsmnrPwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:51:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C345273A2F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFEEC3008C83
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5339F3750D3;
	Thu, 12 Mar 2026 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZItsYmS6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3552D377EA7;
	Thu, 12 Mar 2026 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327078; cv=fail; b=ULE9KclGieKyzdXbm2BQgzk7TbYqBtD4xuLJtOYFQOMWodrpF2r0GpIaeBr+7GJEYhNQ4zraDThgzgC9UhqmEC94sbVNOlqvpqFJfu6zj+22AMEDKuTwcxY5XfJj09obwaBTzZKUW72G8YDR3+iL9AQSixFytipGmlHqzcBmAZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327078; c=relaxed/simple;
	bh=8h7zO7Jxta05/W5RZ0n9K61JASY5UYbMafA2Q0GgTtk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AI9qG5CcIjl7k2v/UFtlImESiQ5DUsJzyhzOjwIXeHfYj2IDxVnKtTs8k9kZwqRzB3avMx+jkhV4sA8Cx2qY4KPRYkYC0FnoXvAg+HXvGtQDMD3qsRSFwMmd/czegSXLmmBd1avgDsPFWuSut1WEh03z7r2F6PEBl+KV+1OZCEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZItsYmS6; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTkeHbd4zbMDeDYSiusHnhGprZsEPvxqxVmO0EQUAf8WRIpdovO9sowphFoF0kpm+2FSUdHHIaM3xn3p819dUv4sFiyWLA3rtlLu+BoBG3Ud6RC6xqPX6qxCWO09YmpWBpEYGuYzMKIjHczp62lCHm7gmfJTyXzfw0Jy2DGXXwr5Bh3WWF0CK3I0OD3eqCs6zp2DZ3hRoY3EaYec5nUFk3Zdd7kmAhuG37m0pmSq/prr6M7Tf/ScRQyTVQFWYgf5F50mAgINM6jscfiNor9R9zQUPbVcNBJ2NAO3OAlBAYWhM8XZ+VimME8tktPiEltDa9TCG8gPzWUBl2wxGagf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XI0xNe5MGnym0R/tLroW8aQ+SKvD9/NQ60ppZP7zdg=;
 b=kikfQy4cHKaIhZNKjNUtQgp25/7OufrfHypxOdkWNu0OSX3MziY4/g/pAr9Zjv6LcXAXPIq9Sj8pPfl97odHvNzYo+HOkbVK+jOXkuR57UFZqNgU6zuo3lTbCR5ifPQDTimXgKAfuUVhPJz3JQC+sMymibUqpXh9XbpPaMWzKFnikk88koiuGcnzJQchLZYjjlNNtBruxAujse2zxaO4AE/JFxOIfp9GIUxoXSgewjw/Op6VDfjWNG4SCg3wY5jq2pketXX2+wSNzzyfMB5paUDbdjy61NQXBBLtYBXDVEJtDCO+WxahvX+PFYYaXUFpLesvl+CHidd+Ec897idjYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XI0xNe5MGnym0R/tLroW8aQ+SKvD9/NQ60ppZP7zdg=;
 b=ZItsYmS6aBR0LwUQaLSl5udIZ9TxxKuS36BKmyj2+/EOMGEogL+Y9w6ev0gQ3CO2ULpRIh/fMMYAdgYqkZLUUgcsUck2lHVQp0tMUach3jJvTaT1piOtzESvlfOOdqRcFPkNgcQCQlZst3eRc3B80Q6JriIg3WVZw9GFfM2v7zo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13770.jpnprd01.prod.outlook.com (2603:1096:405:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 14:51:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 14:51:05 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josua Mayer <josua@solid-run.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/5] Add USB2.0 VBUS mux driver and extend rzv2h-usb2phy reset for RZ/G3E support
Date: Thu, 12 Mar 2026 15:50:34 +0100
Message-ID: <cover.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13770:EE_
X-MS-Office365-Filtering-Correlation-Id: a94b1290-0664-45d4-b38e-08de8046c9be
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KTXa7fgxYzw+3+UIplmZVRckB9164ZrY9sLaWZ0kzrCT2Zu6puDQg0gjZirkZ0AwBTBIkQFy4p+i4IXvPMuWLs6tj6eAbGr3YXRSwk/kBjS8miWjTwXiMKk8x6u+rCuz3yIUnY2UsZe9/UqfdCZAnK+AurERgEzk/CCAvlCsdKEliNaeqp0TQKR3hLGfmvEFpFW8PcRY0zE2hamzFTxilrsaLpEi0yYZf8qz7b/0Kdq0PcEhgtD/Fyr0Ii+q1xe4129s5imnCk1c0gzgknq19/KUI5F2DwmqLJE9kLMAIVdYmcve9ub9f7vhtjMeNCN8zWtNruLtrfq8x+N1omw0gCrMCYgG7WdQhlRqT2yZDfecf9l4HsGz4e5c3buB6DEy9RIoPoKIo43OHUJEQikeDFZz4XUZ+K1RdNIWV7hwKGzmYVx9FYnv9J8wgjAitC6IO4F7uz3OrpHxZFSdDMN2xQKY/YsCYtju1oKr+MhyvVJ2x6S9ro4CgYObjyML+ZWVvRtEXavdsIp/PADY5ColxxoPCPAGenaZMWy5tgJ1jkUzAdprw2muMZqsOrSSxq+lflhMXIuH2Qz/RkZn1zVt3HHZozBV30iOV3bJRzDl/SweyDv6ihEwf2IHpU9Li6SX12BsBxTUI43tLO5l+J1kS/eH4x9APnhW2I/ubhbV8jBtK1Nd2nXKb/efIf4BcPHUgo5odsswmnTJpkofVxWwFf2U0nJRnDb7c2UL9dPzV0wl/Kc3YGYSdqkAKwZLqEEo68B3H++1si5j5PU04wbrFUAW6l80pRM7RYqgJZg7Jyc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8VUhf4/Xif33EFNOGMdbZxN7dvKDSuPIF5FuctjOxtuvMglUpvH62x2+2Y20?=
 =?us-ascii?Q?sRNiD3FhCTIiAexnIjli5fG2thN2m2LsLMa1uy92seTCLAd6DfHzSpXhe0ot?=
 =?us-ascii?Q?st7J+UbnhDNdJzJSspDsGfQ2R2kpiYQ1F6iNJ1CNavuq6DHb18C0+tqKwzA+?=
 =?us-ascii?Q?d6H7ADkmUeadETGJMLsLzH7v89yEzYNvHP/HW5FOTsByc5S3BGNujG3visaz?=
 =?us-ascii?Q?rQchqayISCq8z8H5Ez4LKqffwoET9xP5db5MX6Khgy3yjKGmlb//Q8ZBlEDq?=
 =?us-ascii?Q?1kpQt/rkw1uFSWn+VZWTIlTwWapDJaUr062QcHVWAYQlm5Jo2CdSBqHBvw+S?=
 =?us-ascii?Q?SGWACbxMnynmyjgsRCwm4Fvkuwr+KXGLNp6HV4Vgh+U9fDMnRjLC3vZWKeT8?=
 =?us-ascii?Q?7WXedoyZy8reCrky/DkkzMn46uAdrGn26za14H8Nit0DUcxeHWGxFT+R+Q7M?=
 =?us-ascii?Q?mNdomGx5o+G0XBnNpV4CSqRdLqDZ5smys1JJ+3pumCRB8EYp+BZ++QviuqCS?=
 =?us-ascii?Q?XaYVogjYTD3RG7wqtbiQEL9pqDiq6Fju1P9hHxMZaXYit6b9fwP1ajpJvvek?=
 =?us-ascii?Q?6e6seJB1yilmgTzfSB3laHsX6NQtfauWpdk0LK7A9v+zj67hZbBYPNJEn9y+?=
 =?us-ascii?Q?uTDIaV7hfW0D09p8TLaKXZG1Blk4nOJxtgbUEo8/04UdpRv+MDEAfd+FSVO+?=
 =?us-ascii?Q?Tv55DK77fBT6Fvm0NMODhoXovA9fwyI6SGRsHbML7a9+YGoD79lOVjIe10lB?=
 =?us-ascii?Q?ffN2uVeajv0tH0X9XrJmdK3HTjR94wMu29tdVV2F1MrmhgKvIWHAhRQzdKSo?=
 =?us-ascii?Q?hOaI1LnAVRWsY3HW5wxJQcARlxGgytSngFc9kov1WxhM686Fv6d8KLsz1SDQ?=
 =?us-ascii?Q?ggFxAsU563jiTly5EGEK8SRAAR0/iNk0/V2aV9QDb5mW4gB3XccdV1OIIC76?=
 =?us-ascii?Q?yjHTe+b9QZkgw/wXh7aXSl5l8RufYlJ44njyYjhI39QvF1GA8ikmXmkcmD3y?=
 =?us-ascii?Q?cJRV4iOEgrpnu5RijIKlsQ5ElrvXkPLB3XVUOw2k6C7MZq49yUU6QGbQcaed?=
 =?us-ascii?Q?tiDVxjD+wWBia/qReGLMOOJLcvAKvHZeZskPPNM0JnrzB9NEe01C/CfU7ar3?=
 =?us-ascii?Q?yCEwRdQaDaLIgntAoaFMdUNWKlq0DavkdVswj8lB2n8NZWGtkV2jBm5Zrc+e?=
 =?us-ascii?Q?UXLXJtbpkXl+hr77k2sTb1Tb9GBgvVHvHwTgc9y7F2CMZ4UGHzkSdo2BWQMm?=
 =?us-ascii?Q?R+cTXKKaaJsOONyPOQ++tIiKZTqDVxCjsG9EjIPJVMSH1FCKM9jXz++CIZdr?=
 =?us-ascii?Q?320Bf1FsipyAJNjeCtfjj3Uz1SQQxtK7mdHd1n62Ut2LAgu3GOxNqmLmfmuD?=
 =?us-ascii?Q?MSTtKyK93LbLaM3xHor20YAKzOpy0FYPAiK81PjEuCfdf3h6lSDSRbKpSEEI?=
 =?us-ascii?Q?WU1SdvlteQn3EdY1Z2I/Uj1tKAnr4TskprRgpF8g09/C2YPJLeXMZa/JsG7s?=
 =?us-ascii?Q?c2AEnradvvcWV8muM1dFv/AZWo1ByDie0FgEJ9JUxhm4mof1Y2a24Pi9nfXn?=
 =?us-ascii?Q?BnapSqOHFi6T6qFQlLU8+vHGSi0b7bcxt6UZweXoVzgkqmbLtMcCeqiEiGKB?=
 =?us-ascii?Q?ikFRy0eeaHvP/AZDcqLiG4lsM4Ua1TFNv4gWIW0FNPelEc1jygXKysCrb4JW?=
 =?us-ascii?Q?oJoZs1we4e/wdysNQ+Uf4FiPw3I6ufG7JoNJtSlZaApOZnzRr7DU/853OfpN?=
 =?us-ascii?Q?SldKMJsHxqPelVMBHM5a2CjZGrJRhw2+lJMKUQQ9te6og9k4oTRG?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a94b1290-0664-45d4-b38e-08de8046c9be
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:51:05.7739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1y4KaZ3WJw5k7jEkoBNnXd3+VIjjsFtUB4mohnuTvCPAcVLr7FSCIRVRqeW9bqTSoYBtsjDXAkYjLrVySY8QM43zEIr0MSR+JZ1Rwvqh0we4gMK2SlaWzO9PvhRXVWNf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13770
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29285-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,linaro.org,linuxfoundation.org,solid-run.com,arndb.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 2C345273A2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear All,

The series adds:
 - A new mux driver for RZ/V2H USB VBENCTL VBUS_SEL
 - Updates to the rzv2h-usb2phy reset driver/bindings to support RZ/G3E..

Merge strategy, if any:

- patches 1/5 can go through the MUX tree
- patches 2-5/5 can go through the Reset tree

Note:
 - Reset driver (reset-rzv2h-usb2phy.c)
   has build dependency on Mux header file
   (reset_rzv2h_usb2phy.h).

Thanks & Regards,
Tommaso

v7->v8:
 - Rebased on top of next-20260311
 - Updated series cover letter as part of the series was already merged.

v6->v7:
  - Rebased on top of next-20260128
  - Split series into per subsystem series, no changes.

v5->v6:
 - Rebased on top of next-20251219
 - Re-arranged series order per subsystem patches.
 - Patch: 3/14: Collected tag.
 - Patch: 4/14: Fixed commit message.
 - Split from dts patches will send separate series.
 - Added merge strategy in cover letter.

v4->v5:
 - Rebased on top of next-20251127
 - Patch 01/22: Added Reviewed-by tag from Conor Dooley.
 - Patch 06/22: Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
   Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
   Updated commit msg.
 - Patch 07/22: Update mux_name to "vbenctl" to match the driver name.
   Updated commit message.
 - Patch 11/22: Fixed if statement for mux_state error check.

v3->v4:
 - Rebased on top of next-20251121
 - Added patch 01/22 to remove nodename pattern from mux-controller schema.
 - Switch back to v2 implementation for mux controller in patches
   5/22, 15/22, 16/22, 21/22.
 - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
 - Removed mux_chip->dev.of_node not needed in patch 06/22.
 - Collected CDooley tag in patch 09/22.
 - Added missing select MULTIPLEXER into Kconfig in patch 11/22.

v2->v3:
 - Rebased on top of next-20251110 + [1] + [2]
 - Add missing Cc: stable@vger.kernel.org in patch 03/21
 - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
   Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().
 - Patch 04/21: Manipulate mux-controller as an internal node.
   Improved commit body.
 - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
   then update the aux driver accordingly.
 - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
 - Patch 08/21: Improved commit body and mux-states description.
 - Patch 14/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 15/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 20/21: Manipulate the mux controller as an internal node.

v1->v2:
 - Rebased on top of next-20251103 + [1] + [2]
 - Reworked series to use mux-state for controlling VBUS_SEL
   as suggested by PZabel added also mux bindings documentation
   on phy and rst side.
 - Collected Conor Dooley tags
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
   rzv2h_usb2phy_reset_probe()

Tommaso Merciai (5):
  mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
  dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells'
    property
  dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY
    reset
  reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device
    lifetime
  reset: rzv2h-usb2phy: Add support for VBUS mux controller registration

 .../reset/renesas,rzv2h-usb2phy-reset.yaml    |   9 +-
 drivers/mux/Kconfig                           |  11 ++
 drivers/mux/Makefile                          |   2 +
 drivers/mux/rzv2h-usb-vbenctl.c               |  97 ++++++++++++++++
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-rzv2h-usb2phy.c           | 108 ++++++++++--------
 include/linux/reset/reset_rzv2h_usb2phy.h     |  11 ++
 7 files changed, 192 insertions(+), 47 deletions(-)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

-- 
2.43.0


