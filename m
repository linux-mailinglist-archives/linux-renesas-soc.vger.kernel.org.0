Return-Path: <linux-renesas-soc+bounces-27711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP36BYHrfGmdPQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:33:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79119BD44C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25BD23203BEC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE7D36166B;
	Fri, 30 Jan 2026 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bj6u+qhp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634D535EDC9;
	Fri, 30 Jan 2026 17:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794125; cv=fail; b=fkVG/VhcuCArfHyEtpQv12rxOtIW9QXTlHipy38U/ixCEOhRqAdsL4Yawn19OE4xP4auW/qYNU13bIcnHHzkqtzzY+MgjLQ/KGCXeRzYOEumMxz5SBY3TNp+aSXVpd1T+rLnBLPCPbCURfVPHOQsAaw8wTOA5ux6qoCcWs/wTX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794125; c=relaxed/simple;
	bh=ijfyU3wMlBVkcxxxeqcgHWR3WpaR4iLXYOGzRQMV7u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HLWktPBh6N+G/zB+CoLJHbmJYY2xyLO8HJQ7nCZw/hGcMjWuePh227QQCBH+/DkU2bM2zuMXFWiBagPT17lf73fsjcyNfZlCnFU5+im1x0ExZpDqdoP46ChNylZadGgRBCZV8VrspJ4qJyfqGiVOCbVQObLklaAlwZiBQYwYY7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bj6u+qhp; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pR6CiPZP6aymePFw+9cQ83ttOHJfoA2UqPMlOz0H+mo95Z+fgAJNhHzj3YSm01jZIxj7p8zkMg/xXQ7kw0DEcbYs7DLcQ0YJO1lqbFMxyHXBrcw7ex+o3wAnKmlbaVH70IwvWwiRs0ALaJeA6fln3lWOdtqtpxASrSmtJsbZVf63VXQwVH/GUGqmCppFrZOUlFdqJ6XFxWGucf/07T44BQ+PW/FDNDdEUK8910/9Nldrc7E3bEAFB9h9hjCPq5BmDxsomcW805WlcpwZf4pFcNRTg6j6APWbR2aCz5BtpAe6Rvjgd6OkFDIMG7MmxlM4Y82get5H3AKc+gsOBJFLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ghzP5XQnj15aMCcnLVO5b4D4QLKsp0qmjjK52r8WtA=;
 b=y2GoUmWJCa5HrG6Y/PbUS/JrK+E8SAZNY0pPZWOcifX6Wp6y6mYjlJzLjGMSRN7hisPwKesSu3einZms1Rma5yNTD4eH4RkOjW0TB6eqmU0xbel+2eBOMM8CPPO+U/OJEyTFtq5LUnxv4nRbzGUFJrkfTiaf2yCowG1s7M1PXQc2WgciJMbsaK9F6SMVxULMkscSEIfuXfJEx2Iw+8fLPoPrTov+IAsv3PWsBmdGT5RVgLdesAAQt/Ta5sGw2+FqoEPqXeAAyWTYlLC9YWAx7XYNAi2vSyzObPejNDshKs1NsQGjPhgDoPh04tdaJ/PP2EIn73APWsLSc0jNsPwMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ghzP5XQnj15aMCcnLVO5b4D4QLKsp0qmjjK52r8WtA=;
 b=bj6u+qhpvKHpCSdL4uANB5eRMQphnl6ktwtbxpjGKXTMA6OyTBq+qiNqjksVDOq6PNu4rswQYVvUmI1RBpTNiSXQnPwTblPA0ixTeGFKQ2DcpMs1OZfiHTzrX4rle16BoDH20JKvis30eVAUAUD1EwZK28pFCuKxkd5YYYFxNVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13818.jpnprd01.prod.outlook.com (2603:1096:405:215::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 17:28:42 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:28:42 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 20/20] arm64: dts: renesas: r9a09g047e57-smarc: Enable DU1 and DSI support
Date: Fri, 30 Jan 2026 18:25:17 +0100
Message-ID: <8b6a17044843b0f635f73cc0d67a605c7c0f06c5.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13818:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aed54b7-4c68-4e53-ff08-08de60250323
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?zul/+PSDVhB/OeOXLy0oSlHGZSSYE4pvErJ8OyXzPQyGD5YxlgBNU4vKApJh?=
 =?us-ascii?Q?x34+c2mShmpEjG5pnNVZ9C6vqCKtmJVfqkceR22sXxZoKuahMAmhRSplN+sg?=
 =?us-ascii?Q?1Y75lbzgIX+9664QiDWZZaTgbuOFLIIolsZVZwJPS4c2dkBp8rYPR2ySNzcc?=
 =?us-ascii?Q?QEe0DIO+TjXgcLzjqfCJyu4+uNtdCAk4qDL/prVeehJWACTqXeirvlnGl0Nr?=
 =?us-ascii?Q?BmMo+NA4QjNcoxb3EwiVjJZN32v9IqLXqzs4sNe1ZTRK7Y7fiYWuTBXDJAjl?=
 =?us-ascii?Q?4Dkwgci5+CcCOvfftFf+EWsWNmLr/72X5ck3DRMhYswaO+KspUWVcVln8LYu?=
 =?us-ascii?Q?ESg7VV02euodPOWzqVfBqTY3sVEjDj8XjgO7SWh3aZPcy6FiK0LaXvIWlIAI?=
 =?us-ascii?Q?fyRmOJ86+WbDxF0Tmh7q6G6m35DB8Wig4/O27e8t9bR9LvtEO+5dPp4EMIbQ?=
 =?us-ascii?Q?hxlIE8BbIe2iIN5xRVuwFmYSNkvkIU4CQUfa2/IhXP+3Tn050ap/DcFcAdm5?=
 =?us-ascii?Q?6zU3oZ22s3Ou218GZNLQt4BbKVzeKtqY5LISO5Mcmf3cds74128vMvBR4vuz?=
 =?us-ascii?Q?NTIctAuN+etN/5t14tCBPCl9VVmCjQX26iTtcLvdBRL1CgcN1qy/elOwncVV?=
 =?us-ascii?Q?nCW7sMK4DPlYWzcZFHgcU0TKN/ce3/Lv83JXAltdKdoggJeg++3Hv50FqXa5?=
 =?us-ascii?Q?BQ4EN8zYjEi4ZtoFXClOH6RbHPaS+zUw81IdNu9yCNT/xRwv5jnmpflLwMo/?=
 =?us-ascii?Q?1i1lItR1CTfaJjXKmWk04hWlh4m1qfQkv3CEWP+ClfhbzsZef6x6ACx1/kly?=
 =?us-ascii?Q?xQyudLaamQiBRRJvtKn7uFgi1Z6mm7xd8uowMBDWziFmsghkuNkIQUhFqL5f?=
 =?us-ascii?Q?IyA4kTZL6ffYj9hHJkMr/YkWeoCclrJwFoOydDtN+2mohkRGvJqMa8yuI1ft?=
 =?us-ascii?Q?H/lqYnG6nUgZonBVJda5hOxn2E/Z80DSsY13GSRq/zlsiriz2slCud9znv7T?=
 =?us-ascii?Q?x4lxYBKEiONbq6ufPGppBw5Hu8dogfDJJaGEwDDqv5ccD29OGumm91FQm1pU?=
 =?us-ascii?Q?1+lQQoVzU8tWi5WKgmPmzBDUX7kJV6e6SMNjKxeqbpQXUxhpOMka6ztMagrK?=
 =?us-ascii?Q?bo9+Cj5/mMOgx+pKSyt04mB8vIZABTOJbezdgnBrIoxXVMfFYfqEwX+JO0X9?=
 =?us-ascii?Q?05jIwkTfUUgVgkSSMbbKAKv6mBepct9p/UQKLz3nfpAsXb2AyD/aotMokEVL?=
 =?us-ascii?Q?xU/d1tYtz75hRP13wBoaAzCSaCYGTFz4KVGgMkEbaLWm9zYGH4DaV1+Bh8wS?=
 =?us-ascii?Q?8e5qiXnE+1bX/m1al/43uSDI2DH/WqNqSnszyWSFQlR7teqOamBbL2LYFZ3z?=
 =?us-ascii?Q?uT7C/9ppl6+H6B4oBHOHtkLFjBLRVvTUxonG58zfzxhm9iuAATkiG77+M/ks?=
 =?us-ascii?Q?gpbHAof8bxPro7+hdwBdX5nZ7VNV4bxsKYPoYFxjuYXfD70eZ0AI+qulq4bF?=
 =?us-ascii?Q?s86FctcqpEkFMR3aoJt3WlVyhFUOtlWfJy2CTZGuqOVmaD3ve3SfsPIqv7uw?=
 =?us-ascii?Q?kk/kEh3j1kzkFib2RAm+alqAu1e6uzZZGL6nYpS1rMpIrQd5C262wB57i4A8?=
 =?us-ascii?Q?sndNimIORVuaFo3uXiu0MtQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rIm3nirt2sJ1daResMK2alFt0TTMA3klxuNOKWsiy+gdBDiIIl0vrlwwtyPV?=
 =?us-ascii?Q?/lZHyL/t6YhUXXiJQQvZDrmTkXGWQJPk+6mg8VxGx5quDrHvRSYSdQt5E8lF?=
 =?us-ascii?Q?ENIPd09p6q4usaIuEpaCZzWQoa+T/eN4ysAmGAKd/hX7wPrkclY5UMGp82Yq?=
 =?us-ascii?Q?+PzZIdedgUP6r0rNc/pvtJZCIQ63ZZTqkBHmmcvf/ryJ4BwvZ87QdI4UPI69?=
 =?us-ascii?Q?BG7oDoEmxb+mh5omrWvtBEDAjzRUf1YFmoaJMQi53B7yzHbUsI77kFOuQ9q2?=
 =?us-ascii?Q?HRaUHoOa/Fyn8gcmlWqLlnpvFDiwoqIDOBXAxf97bMRmeIp1Hh4yVtzBCE07?=
 =?us-ascii?Q?Qj4K2iv0ZhDJ31Cq/F9QJP1ODnvW2186hOUVqe1Q7UPktnMW2EAYg9jXxebe?=
 =?us-ascii?Q?V5F0ublYbc6CeaFuKrYkjrVMZY31RKWiTErSkunBqBRAT0H1F700XeBZla0J?=
 =?us-ascii?Q?ZEXYStWZ16VBMttlmw6I2GNFzsBS5/lqzoqE1AaMgKN84yZgwC4mQmVZJbaD?=
 =?us-ascii?Q?jmuaJxnkK5i6yq39SppWIiKr6tDL6sGQr5deo5+tfcsQCIyCayQb17tzy0sU?=
 =?us-ascii?Q?309jKc4mLGEUh8v10jI8cKIFYfPTXKCaD+5hiNcsmsWKlLmG0oIl8bpk5o6S?=
 =?us-ascii?Q?I3x9rA8+WyZFh86HxLn/X4qbe4C7kNFIkl3+XJpjYuQCwUfIfeYAMs7qTxQx?=
 =?us-ascii?Q?p4VLmSGLFD/9Fcl4+g4oElmC3ydKEFhwpoRdu/TSpydrIri0ieYChanTU+/M?=
 =?us-ascii?Q?fulkrijNWB3Nwmwyrq9V8stQtA8FtL+Bi5Jms8zZiN16eDiDyq+afpojfBxM?=
 =?us-ascii?Q?7lb2DhAiZD9m/h38nGCbBhnzqFxuaybs6FkbNMh6aMn4xKvkfdx+fvMLrZhr?=
 =?us-ascii?Q?YDo+EV5WxNsqVMnDHyZn6d1kUhNcxDXEDLRTzeqiWyp5QEFhpwJtGwefja55?=
 =?us-ascii?Q?AfmvSqAFS2Lb3vkYvt0D8aiErKeyDQgLBuI/h1aKMj83B1qK54Bq2aWSRgkA?=
 =?us-ascii?Q?XcU9RMmUckUDBmjcoSqHqIFRBOMR8LgswM6q3TdZtNJ5qrl5Btall9NLGdaD?=
 =?us-ascii?Q?HZ5KiZk9z7Xt2PBSfuhPu6N0PjTeHKv0pFWWMGA59L6uW2amtAJg27bqI0g6?=
 =?us-ascii?Q?aESw583qiF0uANWVneZYT9bX2ZSiFC9JTp5OcriSGt04O6iRybkxNHWFNLEp?=
 =?us-ascii?Q?Ow9bTT+z35tZhc/QsjhCS2mUo1GPDAO1dbuo+697/QsLfil3VNC1asMJQ7hB?=
 =?us-ascii?Q?4O8PeiJh1LwP63EFskKN9PnKUGCGWy3gD4ocAHM4WVyqHvEeIT3wrSmKIZ18?=
 =?us-ascii?Q?wKQa5vMbUOYhvez1IKQbjHNNn7/cvvOvm+36qoql9B5TolDe9TTODwCCvTwr?=
 =?us-ascii?Q?b4+OQ/9SrAMWCtUWn95XTwousJK8pX6a0hKV0q88tAY8sEHpaNqC6/2DukVX?=
 =?us-ascii?Q?4trXkgaq7R0kWQsnOGJYLXqB8PDlgirNfODQppx22q4LC0SF7H3azWrVp4mr?=
 =?us-ascii?Q?FUjFCUucb+ZhBISPXxBonGGsN6+er39MDMm702g6XtCRFZ6yUobUbyBShDDs?=
 =?us-ascii?Q?2TguLg2g7n6AiKSLwEgPsKB3Er5nAyEEE8YIfqN6LuJiQvJLzoXZJ7agb7Xd?=
 =?us-ascii?Q?pfhYBmm1nFdVbZ9/lfBrfCap4peWyZ48R93oViCDLQv1O4f8kKWB44rvR2Gc?=
 =?us-ascii?Q?5CFJ5wPsHd/UFB0eMixvNQxVE0mUOWGKCFh21tXxCbbgqlg+J0P76CImlqgd?=
 =?us-ascii?Q?Ikz4GNgbBS47UkPvziGl5S6kvHGesnlGpPEp5CsyKogwoTsnIsuA?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aed54b7-4c68-4e53-ff08-08de60250323
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:28:41.9331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOUhPQ/QQHCclywN1YDXvHMHV0LnZm4flLMLZ72Vj3ZBbncAlAADLQEGhuMcpuZN6xKf+jV6Or0GkDdE71UKQH7Q/2vWEXU6UPF+cLwXd7rpgeKynYA2QOx7RS8qxukG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13818
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-27711-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.12:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,0.0.0.0:email,renesas.com:email,0.0.0.2:email]
X-Rspamd-Queue-Id: 79119BD44C
X-Rspamd-Action: no action

Enable DU1, DSI and ADV7535 on RZ/G3E SMARC EVK.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Fixed: dsi, du and adv7535 are part of the the R9A09G047E57
   SMARC SoM board then add entries in the rzg3e-smarc-som.dtsi instead
   of using the r9a09g047e57-smarc-du1-adv7535.dtsi.

 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 3b571c096752..fa45e001f706 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -33,6 +33,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		i2c2 = &i2c2;
+		i2c7 = &i2c7;
 		mmc0 = &sdhi0;
 		mmc2 = &sdhi2;
 	};
@@ -71,12 +72,47 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
 		regulator-always-on;
 	};
 
+	reg_1p8v_adv: regulator-1p8v-adv {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v_adv: regulator-3p3v-adv {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	osc1: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
 	/* 32.768kHz crystal */
 	x3: x3-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 	};
+
+	dsi-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			dsi_to_hdmi_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
 };
 
 &audio_extal_clk {
@@ -101,6 +137,37 @@ &eth1 {
 	status = "okay";
 };
 
+&dsi {
+	status = "okay";
+
+	ports {
+		port@1 {
+			dsi_in1: endpoint {
+				remote-endpoint = <&du1_out_dsi0>;
+			};
+		};
+
+		port@2 {
+			dsi_out: endpoint {
+				remote-endpoint = <&adv7535_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&du1 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			du1_out_dsi0: endpoint {
+				remote-endpoint = <&dsi_in1>;
+			};
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_vdd0p8v_others>;
@@ -126,6 +193,48 @@ raa215300: pmic@12 {
 	};
 };
 
+&i2c7 {
+	pinctrl-0 = <&i2c7_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	clock-frequency = <400000>;
+
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
+		reg-names = "main", "edid", "cec", "packet";
+		clocks = <&osc1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v_adv>;
+		dvdd-supply = <&reg_1p8v_adv>;
+		pvdd-supply = <&reg_1p8v_adv>;
+		a2vdd-supply = <&reg_1p8v_adv>;
+		v3p3-supply = <&reg_3p3v_adv>;
+		v1p2-supply = <&reg_1p8v_adv>;
+		adi,dsi-lanes = <4>;
+		interrupts-extended = <&pinctrl RZG3E_GPIO(L, 4) IRQ_TYPE_EDGE_FALLING>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&dsi_to_hdmi_out>;
+				};
+			};
+		};
+	};
+};
+
 &i3c {
 	pinctrl-0 = <&i3c_pins>;
 	pinctrl-names = "default";
@@ -231,6 +340,11 @@ i2c2_pins: i2c {
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
 	};
 
+	i2c7_pins: i2c7 {
+		pinmux = <RZG3E_PORT_PINMUX(A, 4, 4)>, /* SCL7 */
+			 <RZG3E_PORT_PINMUX(A, 5, 4)>; /* SDA7 */
+	};
+
 	i3c_pins: i3c {
 		pinmux = <RZG3E_PORT_PINMUX(2, 0, 2)>, /* I3C0_SCL */
 			 <RZG3E_PORT_PINMUX(2, 1, 2)>; /* I3C0_SDA */
-- 
2.43.0


