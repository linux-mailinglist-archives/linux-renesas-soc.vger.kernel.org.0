Return-Path: <linux-renesas-soc+bounces-27621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P8MHCSRe2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:56:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C78B2845
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEA9D300A138
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 16:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9257F342CB1;
	Thu, 29 Jan 2026 16:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Rg9WloUu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071F0345745;
	Thu, 29 Jan 2026 16:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705620; cv=fail; b=VsHa5e3gmneE0C+yXYHvOd3FyVUBqKSEPkGu8YwkEVeptRAvYMGwE2l8JbbYoR0CZxz+RhOnksshqRt+8RXObeWCkFue3n/v/Ik3nMmaztw4J6BkOZ6fikBLgrrwUYqy3jzOZ6isPQnSwd/YU34MEM6a1OJFVH7Mh+H31ea1LYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705620; c=relaxed/simple;
	bh=zLo4wTvemEjQSB0JeBHBvoPWX8e+GpyBTiPc1UZnALs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fsHh7+gwdd0K7U6rcnf6ZphbirEn8wCJGJo1dZe8OOTvx+YM0U84VtgFFi/AolYnRMWTysO7TLjHO4l15yVGQabnwCy56sGKdpzDQwFKcMHumNneqiZa22bBjxgZkeyHHitcnsTLh7U2XjBeHD71rfFpJwlf9NfGvzVIzBx83tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Rg9WloUu; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4fLGtv93oUEmx6JppH+758/j8Cw5kMde0Dz8NsSVV2g+4W8LM7h9cyvZ+ZmX+xoEY7pu4brb/S1eH8OweEcNgt2T7JhonOOIAzmzm2FpJ3rdcn/SgL+S+Thx0nUDQug3lrw6/ZWCwOjRi/nBBj82X7mQfAKsBWX1Mrtnc6wcqp5PE4YgkfI4ea9jqGHwsL3NAEUUCDyLd6LpOh2KasR87DcPk++qOgW2yrwVdjW4p+DtMQ9cQ1F1Nwa25Hndd6ScrkzhVlcsObN79dxoAMt6G1X4ckY9jdjbnlAIcJaOLkrby1I7wc9pXBGvbRQYxfhh9aoC9Fmhu2FWHb0TX5z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0y/lOE2BzBctm7HWisjMFgvmMAHNB2KtNODPtPwgLk=;
 b=bLYwXQkJh26AwSZ5xunyHsEVyNHiMKeWchMlwOoE5eMAkcTOoCKGOqwQXLY+eHs8KvZnmtYBSc6B9xiYMs+isWwnb3/u5RLdTUwUoM4QJp/MMIq3FXOqBY4g4PajBVzZqPBxEK4DUoFzUHk/lPvcJUG7QG61ppoa2jAyMNxttD8ikIru++X/mY9bGkSMtvdn99yHTsR8maRvtdRM1ITIetHxY23Yzz9eoMvVF2OwyY7pVMPn3BkOP/iRuxt4DTlKi4gI1LQJKEe5tgYycmItAodhLrdnZAT9nPWYLRpslQm9Jkp4VfWYoyxEZWOFDC+bBpgrCWLHrhbRkPvaQTiDZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0y/lOE2BzBctm7HWisjMFgvmMAHNB2KtNODPtPwgLk=;
 b=Rg9WloUuUXHMwyfRF6vM/d6ycAviEBc0tGS3e6jPU9v4nxwdtYF41DWC9fP7Fl1c8Ad8sfFCUFLkzmna5WiIqp4r4hhTzrO4jL++S3aBWnKdIjnGdC7/OFogUko2qYtEtCjbvI/G8VV44OlvPYR7Rf9GXm9Ai3IWVlejbPWZkyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13517.jpnprd01.prod.outlook.com (2603:1096:604:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:53:35 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 16:53:35 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 2/4] dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY reset
Date: Thu, 29 Jan 2026 17:52:56 +0100
Message-ID: <423e49866348d7ea30c04a70d1906af0a8b92e71.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13517:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6af084-d766-4999-0005-08de5f56f17b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZwZ/EcpPHC6rvd2wUcUKLTTDTwEdDVrwWZLq8ahauE3KOVD5/r1p0PVecSS1?=
 =?us-ascii?Q?j/qcZJmr0hNSv9ZwQ2ZVp+j5oNlnSQorMDqY0lnEJ69YUtXySy1vgQgYKwcq?=
 =?us-ascii?Q?IHch2p4KAXuFgOrrKLrASaUgJC3xOLJ+lZTh0J52unEwHJiRrjS/BSXDrbd+?=
 =?us-ascii?Q?4X1OnN500NX2EfavOPGbl3oaEhC5Deu3Q6+Byn1GIA/rV1ANM8LD+054tvMe?=
 =?us-ascii?Q?u3Gfi3k9hjVbgx9ydBEpY3UZBJigiY4rKDwKHLGlDF8EEgJPfd15lKR+k77m?=
 =?us-ascii?Q?R+Wo+PCxXhJvHsZIVizesIlHLxMtTuVr7YvQ1TGuAVJilmnlwFrptP9OT0Wy?=
 =?us-ascii?Q?tMugEVUJYokaRm3cRKv72ZRoegEyF1qTZvDcrruA4rLknKc5HOaWiPZt/Sw1?=
 =?us-ascii?Q?JEqwqeGXp2hWQNTYbOlPnQfJvjI6Fw9FSiC4qv+AHR9NTlBf5an7D2BQ5OF/?=
 =?us-ascii?Q?PvS8g83LumuBZq/XKgbfz0kDOk016kdhKhwsYyECB8B+hvGcoFk7w2T9ZFJ1?=
 =?us-ascii?Q?+geX6q83ImTVyCySn6YNXF5zxaxzBdRQINKBFEbIJocvVvRKu2P/9eQPAWSP?=
 =?us-ascii?Q?WNxs/ZDsPEarshNOb8gQGH11KcwdljuM32qqZz922WCrERDwBqJj7sUwb/v0?=
 =?us-ascii?Q?4rb9ZVvUFVn+F3r/MpIE28/baQ4JAmG6q7kUjt7ilJ+YlWWu4LjeXdMhVEku?=
 =?us-ascii?Q?EZ8WDzGoqUiiJ9tvYbLmaBokf9BSiVzG/GMZBZR/DPRZxSotac97Tpls+xNK?=
 =?us-ascii?Q?WrTCRVOJSaw8oF6fxsgJmAFNdkW+2R86sgYD9xLMZ4CMInDjytsrHR0vbs4Z?=
 =?us-ascii?Q?MRG+p4P2rLKoseHz3ctl5xtyh/ukW2laJfot59wqxGqrJIfutPfIQHrUhYRY?=
 =?us-ascii?Q?TnCa1fHSjNj60fxkvlf+WObjbt0EmtyD7GiIVcdk5kz6hCvbZ8gKS/YZb71j?=
 =?us-ascii?Q?gepL+mMGGMrAQCmD60O4Nwqll1FTN93PxEHGm8hBTYl1YvaanxSBAsRhIiuS?=
 =?us-ascii?Q?OjfXuy+wuZfddZVX/ir8FBpt/gAOGXPohRRPNY6ssVcwaqqL2v1ZvnJkMzis?=
 =?us-ascii?Q?Q/KEhyP3lEMUtz2+iuuwB58+rkclny2Dx13hVvlSVUd+btrZZNpgG4rCS8ru?=
 =?us-ascii?Q?V1GYAFPPmOA5TAaAAYsj5l293UwdE8Up2ECWz2JHO70in57qPYEcMirfmE+M?=
 =?us-ascii?Q?6DK51ALhxoFNSGm9BTdPv2uFRz+neEKyRtxvAfrkVbtIGuyHUV5YSezUxzHx?=
 =?us-ascii?Q?I7y2XPbBg61llePMoSTPF4BeXVPborz4W9BAot18i3mLml8BnOS5oGjqQBIb?=
 =?us-ascii?Q?Zkg5wQaeYsTHBtqlvKsvJqyEpz8nkOXnGDpJBYd5nQR811riULLqZ8Uy94Nm?=
 =?us-ascii?Q?m2iyUNOXEbbuWOBmFiUwwTrFkftfMVtHPklyncFLWUe3bj4HJc1EIXnkkf3h?=
 =?us-ascii?Q?ttj/g3kPttjtKL1imzohfVdpvGp7HxXCqTzNPTzbpCQ/uq/gcdfufSJZMfH0?=
 =?us-ascii?Q?/obk8jG4nM7GofmCcVUbHt0zJ/QFHatL/WE2Lrers7Sh2abkiiKQhN8F7QEc?=
 =?us-ascii?Q?jp1/P2xdrKKjLgxzdEXYJ7X5rUGM6S/DDIQoAePPnuW7cRswT4zTuyonTjvc?=
 =?us-ascii?Q?q+16+oyYT6I7UnPZfGyQefA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YehosOZME7N7CA5/vPgKq4we94nIWl3nwvGUWf8xWWPpTdwT494bp7qaXL49?=
 =?us-ascii?Q?gBwFpMlr+N848lqkHebplPC9ZNH8P2rAcHtlc9/Ry5q8NO+B2aW2MjKFtaet?=
 =?us-ascii?Q?6Z8awWmBvkINxbXs6/Bvu1LopsDcyWDgs8eXxcEx6/04tEu5f28P2jCo6gue?=
 =?us-ascii?Q?Kz3PzgP68UA6ztyYlIc/8N7OvvoK0IWcGW2TQY2miDBPqYG0mS04t1qOxdX7?=
 =?us-ascii?Q?gkKxTVFSm2XurJO7ynjKGnJiyAHRmS69P28BOVaBfrrjbB3wjy+WwdeGCVdy?=
 =?us-ascii?Q?JQMo9MK7p/Bi8X3dJKA6QhF940tgF8YdMiUyjbFgJI6rAYhoTTq6P+qxB1k5?=
 =?us-ascii?Q?DO7g1y+k+a5v7yzWKxLoGl8iCNzMJmmUnqfiIPTRhSk2vl7Y6u0qCG447Pck?=
 =?us-ascii?Q?eVHjXNLQqyf4CM4z+y1MKEkxlGXCLP/GDwcyxNQ5FAaQH96ho+VmlCTgPqTv?=
 =?us-ascii?Q?IOijGu/gRvJ4hWJ8l9s/y3r8APVkVnkrRKFn8m2P+LRZBaw63ccfwutSJ/Z1?=
 =?us-ascii?Q?4J+GZXcoU1ms48IOhlgdnwe6LtT36nEVuFdJGryKPGjMdVVqKRiYAibp+y/o?=
 =?us-ascii?Q?IMsr6Ci4HBLWrFkx4INjCTJ77uhFS8GV1fd3oxHAH/uRDaSJXpdP2/DJwRMv?=
 =?us-ascii?Q?IJpHe1izC3H2L4HXzR754u/mfA21oe/Lg8QmguNUXAZgo7dgOpvQSAALdp1r?=
 =?us-ascii?Q?nGHTLimtfHilfU2HNgqCAwL8jq5VWMhmFLN94cTf6XsG3erNxTYYskw+dkFc?=
 =?us-ascii?Q?EnXejVAeC/WWeHHodzUDuHRFJJmup+NjqCsXpMr0RVoOCZ3A51dsD+wsG+VR?=
 =?us-ascii?Q?/JJSXQI6JbTMER1uItn7LpfBGW1Kmv6PfwDXhuLpwLNXcG8rZYBRukdxPNfV?=
 =?us-ascii?Q?bMS0EBM8uy9pP8uxLQ2pIJqYGqK1S2hjtpj0fW0p2nIVYTnafLZ0NLoNlGbL?=
 =?us-ascii?Q?RXbXxVlncJl2gggkOU29XBXwYgpbqRumHZgf5StphuqwWWvq4V9VQhi5Ocm8?=
 =?us-ascii?Q?gA8/xgCNOX4XEb8Syqv/yz5MwQLDAaAuROIJmPUp/Ru/55vyvFTFAPl7cDQO?=
 =?us-ascii?Q?oktICc2obhNL/nbsyc5LQZ8uSATHg7pcR/vfFgDGzDEPqmaTU2y+knVWM0Cm?=
 =?us-ascii?Q?1hifKhn83y6pJcEXGw7ZIptBLWrCwZUMiIREF9u4+xwd4dqujr9W6iJFCJwA?=
 =?us-ascii?Q?5QRY4vgrempidfA8D6Lz++6btFKnRungqBo7Kv4yskbJbEGWBiMj9NdLqzqw?=
 =?us-ascii?Q?LNVIZwIoPB2eQMoLu6kSFa+AcJb8mDXg5Ky34yEhMOsnbzp9kyIokgZKtZou?=
 =?us-ascii?Q?qnWd3zUXPy7T1f54bdsuwiJDXT7uwRHlmOgiVeczxAG5T1OFQu8zD0w5fNB8?=
 =?us-ascii?Q?auBE9O09YI95K6thGC5b3omZO0gziLpsxo0wj1GV/Ffd/qBt9yl4lnhwyW4w?=
 =?us-ascii?Q?FAhQXjhDdvbR/nL7LdndZRp4poxPBQ89d5a45OXpQtU5ObwzylRfSg+2Z9eG?=
 =?us-ascii?Q?S6Gd/T7DifKq43/dtHhcNnxrlg7n71xWsG7Ctnceex4IOfw0Nz8HWPqADcle?=
 =?us-ascii?Q?Trs+HLTInajwJ9Nnnp/zLGe4fURmJI8Vkltn+lIBSGUBVBGYyq6UT//pSLI5?=
 =?us-ascii?Q?ae4rBulujPLfw/T+d/oy3rCA2ee9YNeHVAJodicKE9rhIKhl3buPfPEFvRcq?=
 =?us-ascii?Q?0uMxh0SNWKvLQ3+BJTOSaz0Duy3O5t2/yjbNuF3BXE1pLBkFQadwS8UrL9l9?=
 =?us-ascii?Q?RGFN4cqGR/T7wuWIDj0JBbIgowb2ti+jm5KYS07yOItO/3rwbEEe?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6af084-d766-4999-0005-08de5f56f17b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:53:35.7048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cfa5Ws00YuD4TQjPOoRkNkBeASC0p7Vc9g+drSLQVgj6TcyRcXeIWwkaxYbnsoWi0gG7PIaPc+SFdMyzmMIIzD8ELWTLOSSd/yFb0FLLEj3DR3cTo5RasnJng7LuYuPp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27621-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,pengutronix.de,kernel.org,glider.be,gmail.com,microchip.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C6C78B2845
X-Rspamd-Action: no action

Document USB2PHY reset controller bindings for RZ/G3E ("R9A09G047") SoC.

The RZ/G3E USB2PHY reset controller is functionally identical to the one
found on the RZ/V2H(P), so no driver changes are needed. The existing
"renesas,r9a09g057-usb2phy-reset" will be used as a fallback compatible
for this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - No changes

v5->v6:
 - Fixed commit msg

v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index 7ed0980b9ee1..66650ef8f772 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -17,7 +17,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: renesas,r9a09g056-usb2phy-reset # RZ/V2N
+          - enum:
+              - renesas,r9a09g047-usb2phy-reset # RZ/G3E
+              - renesas,r9a09g056-usb2phy-reset # RZ/V2N
           - const: renesas,r9a09g057-usb2phy-reset
 
       - const: renesas,r9a09g057-usb2phy-reset # RZ/V2H(P)
-- 
2.43.0


