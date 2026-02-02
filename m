Return-Path: <linux-renesas-soc+bounces-27776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHqtN9yTgGmk/gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 13:09:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE6CC320
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 13:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5DA9303F07B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Feb 2026 12:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F690364E9D;
	Mon,  2 Feb 2026 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wCc/ga2R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011063.outbound.protection.outlook.com [52.101.125.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C76D364E92;
	Mon,  2 Feb 2026 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033649; cv=fail; b=LzXB9y8e4QeaUDVg6SC6vvKyR6q+CMBpaYth8H+/00Pk+Vzh1ZzUi9rwSKdkHvYerxpuBcvvRGfiOamfxUxjz/PjmLtjcex5RZvb6OwqDvebO4jI1L0mSyirhVpVPczoeTv4R9/u/o2ONbjYF1D//v9/uUalOQbZ9vpCmUGGtOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033649; c=relaxed/simple;
	bh=6o6UmDeg25ORzTyuysj+DgYq+nu4UcMUr3sD2Jh9beQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qok28X4luKyJ2AluFgjay8s1TQFO9ulRTCsHCBesMAuA6IjfUgNYRkekULDyauTEMoL8RMt42YEelpy22uAq25xWJI5zoqi+ZWFgz8Rs40HBR7cu4ZTKR/byGkY8WPNgdfgbeLPeekb9b0sDO0WoiXVltsbmuxUFJyCxcpBuxAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wCc/ga2R; arc=fail smtp.client-ip=52.101.125.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j91P/Z2MGOvu47VRwIfBEV8CVCllkPC1D+TEB9jELvUOHq6V6yBmM4/ljrGmWCY3jBAB7Xdr3zo1c8f7fF56EZFSxtZni4saCUgGR9JAFJE5Cb1tK7Mj9mx5gYAlutDJ7mzP+mvtxWQGkjB9dG5TyLti31LzpUo/Aiz4uNURjm0NeZwyvZDpx8g2rcyOHm9DUIWhXu714wdVwN9dfOMnT3yoC8NGvdOxrfYDZbx9nggKwSITZCbrmMzEQX+AzbLmrwzWdE1rs+1Mo6WrH8RIW4xzKqNjYpsiVowLoM0Yeeck4lI3OeTzvVOpdwgApQzPt22crGw3qGV5XTiA7DyYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOAC4mtO+jn+qs196cfHvOvSLw4wo+AsiVxtMTWICdU=;
 b=XEKFXLuzbnJaZuc1xQi78JhuaCeH/TdECiVQ7986yKR0NZiOSEChb0IKEnZWViVqBvnDwO59yyZfZAAe5cg5nYtB3Id3js65K5Zs7LYa27HjP2i/kMs7VojJzaXkGC3n1orfFRtgrUFIi9qa8nn/USuQc9Mduk6bDs+kHyO+uzgqd4VxlZYTCv06Ns0r8sFmbnkq1ZvIsvjNG3U7Vn9Ad92R5tEnhfAT6xt7pDBoJgRENx7CQXFlfQIoLmKk+kJ2Y051cRw1v+Mov9PtfvchKStU5rH9AIcxUJyxoXkE6yG2vaXZ0Q0fWf/Qoy4g1KG59upDtK3HC6ZG/a1p92Y8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOAC4mtO+jn+qs196cfHvOvSLw4wo+AsiVxtMTWICdU=;
 b=wCc/ga2Rzd7ccei+0DUEVWIpBEb1RsNHUB4CNb9ODlau8jcGZNpv2dQxXYjAP1Urbu/4vOuGmOBJqiEwIVOvZge/fsAy2nVkTKzD1nD+heoMx7Auadjot03gbIx11Gnf2h/Q4S1StzCEuG4sxUwB7Lrum1vWgbjctnMAT1FKAgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8632.jpnprd01.prod.outlook.com (2603:1096:604:16c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 12:00:45 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:00:45 +0000
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
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 16/20] media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
Date: Mon,  2 Feb 2026 12:57:47 +0100
Message-ID: <9f535fde6130947c67507e96960fd33ae3379599.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: 780b4047-8c4b-4928-bfe5-08de6252b2a9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?gfAsCmUiobrVt+aBtKHgCiUMgsSvnradToVy6+sSPei+2Md6t9S35N6Qp2Se?=
 =?us-ascii?Q?q7foldSmtFqyVnHajptJ79oYTPdrOHkUPv9c383V35tpSpXGAT/O04G6rhhY?=
 =?us-ascii?Q?jceetIsObkRwZLE4he+9lKBs2MhJhU0NPItpVHM5s8bFeSphJlKNJgfPJX8i?=
 =?us-ascii?Q?sfjtYHYuJSJyWjUf9uQkdU9lt9ZtBz27dmTRfJUj9i/kAduL0ik6GK8An+Hc?=
 =?us-ascii?Q?PHXGUMKsFlnMcxlhp8wQtaZ7BxIemU5T19VZ0yQ6GhdNSWufsbQwFsz6DlmA?=
 =?us-ascii?Q?EMmAPYovPmYm+vXmf4XdkQ1lB180LjI8cI2DVwDILGeGbPJU51a584Y9udQ3?=
 =?us-ascii?Q?BUR+cGOcgEER1C/pWnz71cumibzfaKYPsaxRQfNR+oR8mOLNQnAhcvsIMgcP?=
 =?us-ascii?Q?H6NPLTeeDFYaDxrChPeJsanRK3wUewHz9R4HWy4G6dQ+dt7PKayHHRqVOGdF?=
 =?us-ascii?Q?hIkbC3xhrohMamTCDK73TGiAfFd+gHYsXnPYs4nU7LXSoOcW9h0/19I5ujbe?=
 =?us-ascii?Q?MRSWuQdKyA3IvtX7DLkeiciFQtxUII5c0123NLN4dV8lW8Oe0Jygm4Qfgr6D?=
 =?us-ascii?Q?ep6TE199b+NUnOumUWrcij1dFQRAJsXhsMNN5kB5Q3OIcQ29XyAE0vrfBFRK?=
 =?us-ascii?Q?mVPyHg3vPk1VGLvNaR5h5yncGCUwUSabUmBtd3kWK7JTc2NUXsrlZQ/5HlR0?=
 =?us-ascii?Q?kRioLD3itbg2GFI4fQm0PeGMslBA0ed4leGwjyOjqddZn+4OGUpyh8VFt8vD?=
 =?us-ascii?Q?tUyn8N7jGcYAsHq8/by/0bTcgVpy4piKm8QgQ+vGUS1tYsPA+QPMarCseIEO?=
 =?us-ascii?Q?9y1ZCMQO0k/ynLULR5rDjLreYlApQ3iv+4sve7FGwIGgKJR6KNCOzv5IS7ih?=
 =?us-ascii?Q?m3fQNJKhE3CZVxRSEXCmodApIz/d4b8oi4BEWSCGwAN1t00h3u0bSBjqubFq?=
 =?us-ascii?Q?PJNJYbaiJh4db8alHxZCABPWDnor/9KhnkbdhkfUhgJE4UQGgTRAYnM9UrxU?=
 =?us-ascii?Q?B7F28dPFRb1GS5/m9W3Kymf0ufK7+YNgk+w0FFtfp2X0j6McjJ9IroYuCT+n?=
 =?us-ascii?Q?SPxGcUkX6KbiJWXG0En6wXMozpn7N5kjpaiYNOqJJfBgCTgFeJzrx900efw+?=
 =?us-ascii?Q?Tns0t7mBVBZz71uEmn2l2F5z4gpLN19KG0chydY2AKfPBMNNQF+dcHHLPv+I?=
 =?us-ascii?Q?RicLEgf0aGdl3uaXDU8FEkV0qgaJ/qqJa5N4UjALN/ubqDG9f+/regwQdoJt?=
 =?us-ascii?Q?ZU6YtMCFv2Q89oNJutMvAfUIyc2adjSd7nOMpNx13fqBmI2Ch1/PMw9uu/re?=
 =?us-ascii?Q?4SBaq9B0SPdxQT0cXIvKGotbzw5FuzuWX1Et3diSpjq6GvAA+MwQ+iMqu3AP?=
 =?us-ascii?Q?oxyX8Y65J8P0hnHW3jt7/3fJZTA4CEOAoBSnnHo9ZHfTNXRWRv0Nvxz8DcBD?=
 =?us-ascii?Q?RGi6Jl/GKMnVeRyEb0N7VYkvVidq/tc6chCqFp+8Mz+P5zGSW/Ro9iUkoxBQ?=
 =?us-ascii?Q?y3Qq4FkzvyLmtacBL3aSB70bCaALhbIe0Tha3FcrhA7Gj1ap7ggPVO/97AmY?=
 =?us-ascii?Q?54dDrL5j9HiuNgmSvrGon8kU8QA1aqR6oOX2aOZ2MrphQXXL7s//rHiGtmRl?=
 =?us-ascii?Q?I1j0NGioUNZs7fc12RRVG0U=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?z5YdS1K1qlyHEVM+l/5LUjgHQ4g5iiX+n7Fi0q9D12bny0WKAJpMM2eXynzN?=
 =?us-ascii?Q?RD1LWcXe3hgrlilQBQW5irffqL2T9Z6BsRtcBAiDXe77UVgLSp8iKI4o9qKI?=
 =?us-ascii?Q?0HdaDVvH4FaqewimBkYTylhGC1zCw3quPYN72AlO0nzp9MvS6w67em4WJpLq?=
 =?us-ascii?Q?cnCgJle21lNncLqLEe1plikipiuwFc5R+JKNJcKg36fz0qNHfYs0HO3ah+s1?=
 =?us-ascii?Q?NSx+uppyVkfcQAualEj8YDEOQeZDk6mdHDkCWYh3e6WAW29G6soHqRcHwzBo?=
 =?us-ascii?Q?7VmwgPcLqT0xCAv0/MUZsyHf9sI5MYGhDpGVbN5AcBMD0zrO841lyz0hKNF9?=
 =?us-ascii?Q?nbOPdS/uLVm2XafqQCw2UJW+8xVtBL8XHqLEFRcbchFkU88g5DH4XL7cbBXu?=
 =?us-ascii?Q?+ZNn21jYFHy17Irlr4mjeuGjSeaVdboQVzDkCHLZqXle7lcwy8xxQTF51wxY?=
 =?us-ascii?Q?1kZM6mUHQiiGxryGOh8fsycuw/T4+pQG/fjNRUcx4rQR9E3/GCTs1gJJ18D7?=
 =?us-ascii?Q?t84y4EZ5MCCmen4j7tgji/5XywGPYGH4pVECTcwnCKJ6fWOc2GPIolwTfWXK?=
 =?us-ascii?Q?o0D+ZvWE4YNHE03dShE4pqhUx36+Di8uUNN96edX7jIdChsvbW5qWwRpX+mf?=
 =?us-ascii?Q?gEbalxnEP+8hIl/TiKUxZ9RNjkOfj2Wypp3WcxAi5y8UKm1Fe/lIgWRYpfkR?=
 =?us-ascii?Q?amF9TBdqNgzDRVr5jd8O4AxjLcOyOZSoYz84Y56Vmx4LzeQQqiXmkbl6fgST?=
 =?us-ascii?Q?NKB7NIbkM5nl7UiDH4Jgh+t+k/Gr/x6BC65wRYwkWeCTNX+g+LJdWyUKk0Fl?=
 =?us-ascii?Q?ZvMMdBV1mIl/fCgZhVvDFHWOhaFJi9s4l3iOK9HzbP95Du5wVUH6Ufm6mvT+?=
 =?us-ascii?Q?f6eucKVxUsC8Rq7TIeaAXmYu7V3HV9skAvnYwvSv6Z9EdV6KOXy0A3CQEOM4?=
 =?us-ascii?Q?qnepNRBWtZnzRoDMgb18+XV5z/wloF3yaNZE4bHB40b1Lu0K24+4DneLyoDp?=
 =?us-ascii?Q?SvlOdi0MDKQtISgOYO9/HE8zkOlRTNO5L/8FheCq3gEP9mzRBdRRD3V4jaVY?=
 =?us-ascii?Q?wxu09R5sabNrd/AFTzXBHK1qi1jpGjhmDovcBL63sqGqeJD6Cup8fKqwoG3E?=
 =?us-ascii?Q?mLFxgbuokxk6sCAGhC8qkEpdU12WhgZcCkSK2zKsguZGD7lWsEShILP6wFmM?=
 =?us-ascii?Q?ND6vp6yUnvhYZaG0v276T1g0bfuB0DdG4fSFAoNSuiucGwzO57rutUALczBh?=
 =?us-ascii?Q?lPcwAfbRXgkm6IblT5WyAj8IO73e27x7IzlkUxwZRR/nUczVDnAYhMrkfjwV?=
 =?us-ascii?Q?0QOzGxG0jygri9z43BkIeSBJke+KZQzXUhpse0iDvU9Lw1ktKrsN0FQs9Lbg?=
 =?us-ascii?Q?w5Y7t3TV1w+GaIEtJ4RoYDymVo0PxoWyjlpfHxCAkQicFKHD4pKsb9pbYlLR?=
 =?us-ascii?Q?yUW7FySp8yAoO0iARUDUQAKtdpgujkoDuEK3mcCO+CR7MDVVY9Rbc6LuYxtD?=
 =?us-ascii?Q?mK7rYfU2HtPJx8kluExOpKnZFjKquZD2M31Ad0x/pOSzHIW2ltIiUj6l5WUU?=
 =?us-ascii?Q?v/t6dCkbFKQjIvtm+KGAsAocJIdgGlULWar/l3XIM6o9iB5P3/dNNSYLjPGq?=
 =?us-ascii?Q?W9HO4wS8kvmvsRj1gIFPYog2GKNx6PqGZrgRP93brdZeeVN0jpYTDmf9Y4AZ?=
 =?us-ascii?Q?e2c5HitPpSjGGw7maGvQc5OEdBUUxjP6Shla0kw1xJN20cA4XkLp61L5WKbt?=
 =?us-ascii?Q?A7GEZCP9C6NaMJh4SK2Rl67ypdALiBvSzNKzzYzOBnKmH8Y8XGbe?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780b4047-8c4b-4928-bfe5-08de6252b2a9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:00:45.8642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMFSlWvDnpDmo+RyDwnHbUgCccMXDm66Qu1aXXBLR0AwL18iGQzPn49kF+hK37rdCq/J8K59eUk0SJJPsT1ZGC126FBQzdv923huwH4k5RB3COWA6vtphVhkeVfZQt25
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8632
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27776-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org,oss.qualcomm.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,bp.renesas.com:mid,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 43AE6CC320
X-Rspamd-Action: no action

The FCPVD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,fcpv` will be used as a
fallback compatible string on the RZ/G3E SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected tags.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index b5eff6fec8a9..f7e486e90e43 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
+              - renesas,r9a09g047-fcpvd # RZ/G3E
               - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
           - const: renesas,fcpv         # Generic FCP for VSP fallback
@@ -77,6 +78,7 @@ allOf:
               - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
+              - renesas,r9a09g047-fcpvd
               - renesas,r9a09g056-fcpvd
               - renesas,r9a09g057-fcpvd
     then:
-- 
2.43.0


