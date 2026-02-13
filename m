Return-Path: <linux-renesas-soc+bounces-28191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oByfNd9Sj2kMQQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 17:35:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3AC138312
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 17:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCDBE31BD157
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 16:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5948E36213F;
	Fri, 13 Feb 2026 16:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PfxB4VO2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A79258EE0;
	Fri, 13 Feb 2026 16:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771000178; cv=fail; b=VUdOXICD+3EfjEwT0Le/ahxG4M2PlE7bLpS2xC+rSjN+UjueBrGxpDozbk4rYgWSxclfNBnVaoLLnKS/aEU2l95EFYGEhCHssVBuCwyQ882bxufrXTdtbSe6uX8PxrROgloPA5ZF/sqxpwM1XSSc/MmWVm0Oz4BZqGaxF7PdN/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771000178; c=relaxed/simple;
	bh=yLr5vv/nyeU4YpHhD+9lWF4+r6M3xWkRaKxzCS9Qp/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BPdrI1chsp/ZyV8bdkqg7H35Coq049YwcD5lEBgBn1tNitA7rhf3TR1t28B3ktWM1QW6o6Qzodc+NR65HUjl8HNnUR2Grn0/YbPbv3Fx1BTr7Sf2hTxGaWeMH1Uy2w7RH5PBiTpMHmOybY4scn+tDTOWC3/Y1gP4V1zjqsQmSaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PfxB4VO2; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYQ/YptnMhI1hVtRp94p58qVmxltqPw5OtsCE10zQ3to3ApsD1W8rFAS6RrmtOdSMdvCVz9G0pPwxT7VHvtHvsEdpvGiS0tI1I9rmtMMFGmaobPLNccL833wcGDfuoWoLxYy0voVSEFJVeuFn62tttTmrGVGtiv1hVUee6YO9AppSvc4ypPtqORIQrMEyphaDr0JIHzuBLyfemPuNlmduJSbqWlUa2gPzDI3oiy6IKLKInREjwsUfWZFjbqsGtmOS/sglFdniEka7Yxlvz1nGkP+HCLcRTz/CaWlf6fmygLg7q/Iwz4DHigTc3DhkriPPRdfR2QAmgjjPKWyx75ChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YR4PoEQxK5yk4qls9cXYCEt66GB0ZhqclMVSGLVc4o=;
 b=COjjd7k1tksa3OtqJcKv1uXfBuM3uHgv+nwuUALRXVxCekrAXik/yXXurhOz2tN+hxJPd1fpSZrvPbaFnZ+HrR2v08LucvgJtnoNhBlSWKWUPiDwk+eGJHxymr+hmHx1DSuQcPvhRkNZjeCVS2trJ6W2YJz+Rz7lCaRE4HJiCEdBwWwZGDpf7uewa+cUVZqB0MPoE/SSybSEfxlTUuLG00yYoKXwrq0MLLljuM3TMjpobi17l/3wOa4HlAP5cNY97Z1vSeHOSUum6u+faq926Z3WUO7OYycs2vjTSy6ZuQWUV7Pw5fF9KtJWJsuAxf8MJA8W40h3TQBOnq4mLdAPqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YR4PoEQxK5yk4qls9cXYCEt66GB0ZhqclMVSGLVc4o=;
 b=PfxB4VO25IraNHdSfAxnwz8+QugoSOu+0pHNKvDQrpAtAYBUiIVA7W+qanSxkCUZ7Ntyg/AXfyPDu7eIo8ZQd3qpm3+VscQNlFixkEoCM9Yj9HpfyxvG2yrxGPb2Psv3fTIrlLZIF+rjRIIwIkViJ1iJOd/f8yswzkM2jToGQ6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:29:34 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:29:34 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v5 09/20] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
Date: Fri, 13 Feb 2026 17:27:35 +0100
Message-ID: <ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB16005:EE_
X-MS-Office365-Filtering-Correlation-Id: 056d836c-e0ed-41d4-5be5-08de6b1d1290
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Hx0zUFvA4BQjZA50IMGojlUSoun0i0AwLr3J5MfISTQqHSHHEd1UeQ5XMM+z?=
 =?us-ascii?Q?qgk4Y5l8A/T3XVXMTnaDbGuvypS9yIXfiATJXiH+PSI9rq0wJ7rFRr7/EP32?=
 =?us-ascii?Q?3rifwstojOFF5WI+DQjPaIiDS4SnShZkpV3slCl5B04+IBHn80zsSLg2+o4l?=
 =?us-ascii?Q?dCEJyMHxGBZL9eJysGT0mq0d0Il2EgyAcYfDvvtM4/+IPWiwl4lV+8cClvgo?=
 =?us-ascii?Q?hMDVN4dR/bufbjivRuXaUNzFzcel9Blw7hJRjKszxcn0nnviVwWSbTRz5sCd?=
 =?us-ascii?Q?J1J2wZ3K7A0vGRS6L16SdPk7o9Xb7eWsm8AUdHmVvxPA70bG3LR3q/0SZ2ne?=
 =?us-ascii?Q?b9/LhLoJSwLLMsfxI0WcNjAwakc72jeTDcag7HcNWMAQZNwDcroia9o7ApcA?=
 =?us-ascii?Q?9AlWT76hEyiQS6uZrUzz1PRY2GMqLqb0UfY7cIPthLEZ3+iGCqke2E07dDyE?=
 =?us-ascii?Q?nM+wiXfV12w75KvJLUGorxaca/3fvaGwUatfj5hpmjEjOjQ44oCLiAGDMPRQ?=
 =?us-ascii?Q?xKYn8D5dtQ+yc100hEaQnjMD9nwRoQC4Io3eOXOYe5Leor9tOEsl5+T4PZkC?=
 =?us-ascii?Q?57kNgrMLTcG3mG9+ZUcBLjBCRi/77rJyHQOw5fv5uUPruiIjGExrDhxfpSr6?=
 =?us-ascii?Q?kJ7wPXObmLDKw4g8bs8iiVllMY3QgfxXiXr0djOSXQzGz+VeoXVTGKudjnMV?=
 =?us-ascii?Q?igqwmwEsJ6IG4v/6JGn17KBDVYenqC/qjqjYYkHTxAfDROMCrC/wziqnty8s?=
 =?us-ascii?Q?ZUdQx2K91gnCctdp0aCngFb5emDM0y3ELKGVXbH+A2uOWumc5VCbSFzSmuXo?=
 =?us-ascii?Q?cyGW68ZdFTeec9rt3oIPGjxoBoT8I32YQhP0VNdMgAf6Xz/HOFFwwSAifO4O?=
 =?us-ascii?Q?P5wZ7I+HKFRZDtMpGp3sd/pvtQ3NW1j0JdILHqSHdBNWrxtp0KS9vgSkpluT?=
 =?us-ascii?Q?UQlbDP4DGH7dc+n6UwRn6skBPw6RFNcO9YWPUCeTceMdNx9Wi0lcsg0U+F1I?=
 =?us-ascii?Q?XS+rV9Be5vTh1wF3z3SqRb5iJKshOoQUUDkP/Kz+XBVZQPBYjwmLnWCpc+mo?=
 =?us-ascii?Q?hS+9PN+GxkVnLF6gbw0dc/06Ce//OdfyrEsiG2itlyoYLS/lWiOdT18LRPhm?=
 =?us-ascii?Q?8pYAm1BleMVhp//3v6HnnGkcLVIfRsA7Ks0JMIMcMhVazFaKKS0pZwfTbuOf?=
 =?us-ascii?Q?qRLHF5dXYOlRD1Cic6p7N02LDEwcIx+z6Pdv/yH/ZJg/UgakjlzFshhlpXtG?=
 =?us-ascii?Q?ihPU/Y6+iCjbvixHb2YMHMEWnWpfoJ8ImbUxwhqEM9sgSjElNG+kfBEzuaot?=
 =?us-ascii?Q?7JxTBBLuSWyNvExej91p+nLTYxSHziTcJ6AiT1VIKGioqsKKC+bp872q3VnR?=
 =?us-ascii?Q?dgbFtD+/8Z468qaEvlKUdoZAEUI5z3XmS/E4Z8WiNOCQTVxkFp7Msb6JXaX5?=
 =?us-ascii?Q?9MpIHXdyST340NJKGXZVs3abt7oIYwwTouPkeLdNrQb/Z95gdZzNBpJ+BSrS?=
 =?us-ascii?Q?7fgR+t0ZjjlrrMv2W1n5tXgjkTB8B7W4NcgUp2o8x8slW7hP6cMoVUYWfPPz?=
 =?us-ascii?Q?xypPYpnayGASm6IKUKpNOBy40bPIQBFOCHkul/s0kiTg5+BoiwbcyTaa1xh3?=
 =?us-ascii?Q?caSlGnLtD70nD4ltl8f+hGY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Ag4/rNV7IVYplYAnVmeGBlGgaZJZ8wcTcqmQ+GbEBuLIpd/XHSFJ6bPS5Xt/?=
 =?us-ascii?Q?Fo026DhZS7ZFrvVIEIqRbr9xl1bk7KDS1jvw999CP3f9dGL4irEBCTnjbETs?=
 =?us-ascii?Q?4axiR+V0+6RiDYCQ+mJNhgRpc30r9ADVNvfzo8pknhQSYzDsDUIWeiDczC2Y?=
 =?us-ascii?Q?Z41vvQrbzS/BdVGsvKX+BTbJ4tjNFJOqZYNwT7jz30vemqu4LE0iQ1X9smVB?=
 =?us-ascii?Q?m4NzdSDwJxWQFWAJBHzwXpbvdGNhlwi9W9eCyen4ILceciNZnqnZaiOtMGnz?=
 =?us-ascii?Q?JqYvf8rnogQ6K1iNQqsWBJb/MOKNBHgW7Jy/xNI2qmxlF+A8D1a5pJnaq/IT?=
 =?us-ascii?Q?C64IrgVgZtlTqv+u5yNFvRw+AOt5xE1KHjgO4mITjJZGeSAuVZe3SUYx2Tgv?=
 =?us-ascii?Q?/jAaW6eCbNuBL7NmrM+2YzV1EkgG7nWqzgJoqlQBZmhhdWc8qb38X7f+6Xwq?=
 =?us-ascii?Q?3em+qY/Ngu/aL6B3O+swDvogmW68uBpEuWYUXFQJEVxfpO1sYdkvMIgnB2/e?=
 =?us-ascii?Q?3q/ZrBFR8U6eZl3gr6vEYcQoeW5DkL4Y8iQqp3UAHwDzl3u/w/2pSuRGPF9p?=
 =?us-ascii?Q?0ZXr7BZZDw6vEdj2Vchb78Ks/rydtwtloh6PyMy8em0Q7GXwWg4xeSWbLRRY?=
 =?us-ascii?Q?cc+qXXfhi/UR2GvrrAeIwWq4XUCyfvb9eHSny5dJkzhsecPIGr93Z3XXJzFP?=
 =?us-ascii?Q?WClHTF1EUXKxyH3aCC4U1gshJeTCj13As3MjxS2Uc/JRc2Wi1m0AWWUaC4w2?=
 =?us-ascii?Q?6vGWQ8lcV4k/4rNAYVoA7eFVMSUpEmdoVNjqmobiwf+osS6V63Uh6IxJRaWM?=
 =?us-ascii?Q?G9IkWWSIQFi08oatV3g9HPlMx/bEP7+R++muOFr1BUnvL5SZ4lw9To09r9Hb?=
 =?us-ascii?Q?9deMDeT6DieuMowguwVQRHaIMB51QEYQrXi5La898oWiki0c24MLrWMQniBj?=
 =?us-ascii?Q?WhpVTjA7edX2p/7oalMXj6hmDii443rK53pOGu+lpnxqa/GdwUABTpxa3Xh1?=
 =?us-ascii?Q?pSagTLxbwieCS5u5xI2lgmajkDKShG50z21yFYaUZX2U2pR/WkU6qeUlYAZi?=
 =?us-ascii?Q?+2XHeGPhl7hxAmAOvyBqFyTDr5kaIKZtlAuE+vsJnq6NZXgsiwR1jD3i3Sbr?=
 =?us-ascii?Q?Vp5UCbjPU8lCCDyGqf1fNvMWtYRmBkUlLc9m2xwrx8bavxH276zqVQfAWXhh?=
 =?us-ascii?Q?23CtObhYKY0ds25sV6p8OUv7w/ZJmkzTFbwmzLWVhlkBCQfAzPotdfHjlITt?=
 =?us-ascii?Q?g/EDud3ILIFYWNuBoYMX1Oy/O+wBBLbQH2EgbmFXJ/rRCblKLv48wyQtYbXF?=
 =?us-ascii?Q?/9TWXDqVeBnsaETEVMkBLSR/js2blsGPU+ue+evWzli04TR5Jxkf3lvLEVTF?=
 =?us-ascii?Q?OFOxNL4g4jLBZNXOGtM1f8GmZm4Zc+9HAZ3DxmExWEgx1SQmYjou2kTG/wkD?=
 =?us-ascii?Q?HLssUEBsNlwMqz6lNQM+3AsiI5whQeqV1Z+eJ7WuphgO8V/zTw36vE38lnYD?=
 =?us-ascii?Q?trbUpqq2Rp+fL3++lpGd/B+fENm0gOXh9prqlTh43IVzqz6uLnfHEWS7Xifb?=
 =?us-ascii?Q?K9wnO19Nm+0Ef6MsLfDoCMdAi5go1+BNo0JSTEFCxRqeUPY3DNZrhBsCOSU0?=
 =?us-ascii?Q?qykychycM8NJzLy8PahELS7gVlDNCTkOHqf6L1lf5QqiHL94C60K0MNampv1?=
 =?us-ascii?Q?n0EzQrx7PUw8v3w5CeY9RPyUVbmVWSqFAZ/a3jRnY8cXwFhiVxef9P+FkYh0?=
 =?us-ascii?Q?5nYsTaZ+TrKOrBen0IcqPuvewRyA3OrrRBZFkVtRg2CwVbrIw5w+?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 056d836c-e0ed-41d4-5be5-08de6b1d1290
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:29:34.5766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mKe51pAhBMjZpnkXhVEiwdUZFdhceR3WUgulDSs2uMtAdhP8B/4IqEoeCmIwtS4JVZRvZZQlKKhWl8z0trvpAOwVyXsnM3uC6pm2oNIp3gQtkzU5buXbTVSn0ZjhQP6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16005
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28191-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email,renesas.com:email,0.0.0.3:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 7A3AC138312
X-Rspamd-Action: no action

The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
Processor (VSPD), and Display Unit (DU).

 - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
 - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

Add new SoC-specific compatible string 'renesas,r9a09g047-du'.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - Dropped renesas,id property and updated bindings
   accordingly.

v2->v3:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Use single compatible string instead of multiple compatible strings
   for the two DU instances, leveraging a 'renesas,id' property to
   differentiate between DU0 and DU1.
 - Updated commit message accordingly.

 .../bindings/display/renesas,rzg2l-du.yaml    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..be50b153d651 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a09g047-du # RZ/G3E
           - renesas,r9a09g057-du # RZ/V2H(P)
       - items:
           - enum:
@@ -137,6 +138,27 @@ allOf:
 
           required:
             - port@0
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-du
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI
+            port@1:
+              description: LVDS Channel 0
+            port@2:
+              description: LVDS Channel 1
+            port@3:
+              description: DPAD
+
+          required:
+            - port@0
+            - port@1
 
 examples:
   # RZ/G2L DU
-- 
2.43.0


