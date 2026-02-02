Return-Path: <linux-renesas-soc+bounces-27774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFEiCeOSgGkj/gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 13:04:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DC3CC1BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 13:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 712CD3067B30
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Feb 2026 12:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E554364E9F;
	Mon,  2 Feb 2026 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ObfKuYOL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011063.outbound.protection.outlook.com [52.101.125.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF6A363C7A;
	Mon,  2 Feb 2026 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033633; cv=fail; b=kJR8BtjRQvbmtinCbUCuFx64UAMRhc3d9ARvqhmdnYhaVTGrzNq8t6HNOWZJFCErTB0IVphWjBJwGSLSzYXbpEhGYvKugfBG/rGXTYcuN4cQ7KGcp8em3sbZFe8irKs+QTNwdJUJv/w7vyZotHd23JYx5Y5HrYxpsFfjmU85hpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033633; c=relaxed/simple;
	bh=JaY+g/Wb0bgfHVaFahnRz8EcNF52bx1AGyQR6c6fjP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oJKULiRa3pGF3NHf+eBdFsH8Y/kE6nuxDDGU3h4SE03S9Xd7A6ZN+QsoJwbuz904V8Oo5s0EwYKwlRANOVzG3S2ZWsyt9xj338wUHXMXaNQ2j+Nt8j5HyxNbMnO0AJLF+H69D1YP4wOnZ31tbiCNPTzuRHDZKnH3rJxrZX53zgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ObfKuYOL; arc=fail smtp.client-ip=52.101.125.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjENnTvX+/4pc48REPXJj2p04penNeHtkHNV7du9ajOrixSyjyfr6boVOGQNBK6KkngrpotEmdoqurTl0D5Ym5G5t6T/fa3kJuNOnLX9kB4oN5wEfyBDf4+yGDzWcZ26ujO4nZlw9JEt3O9hJ5kOd3GLtv1268VEFpl3RRzizxTXFhXVH2TZcMWqgmaibHystkc48IcEOBOWZBpLhPou3ily1nqtJtJFWZz6Qvc6bX4fK9oBi+wg1St2gw1bjkCep/J9VWjZEovAkkMgDSXkmaH16/SLMTP82Smsvfyl7bOfeK/FGQPF0jjBp7uGjejHeHiXLUubSGz8gKJd6Pa3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vth2AlgAQbD1Hwe9OCwVoYzRzyUfAjdxnN7aUM9sxpM=;
 b=GVao0h1aeiJhtiBCpwTWNohLDgeyPylH3vLG6XRmKGl9KXsMBBEq35Ar/2R4JebjwSrfaMFsRZ9FKZ4zNlz+CTfHTeN/aKvCgPCe3MBD6dPctoP8q3Shs88TnqP0/ak/2AbQWpWAqf1mQUudZvqeLZBrqaFAfJvZLtWti6lL1NPYW8bwoNycUXDhO0c7iFYhAQ7stAKG9AUWvh7X284FADNsVc3f8LlkYafDyzTGXaC2gEB1ZJYXwX0/+TUmgKp3Mpy0iQ8IDsLVwDOncom59Wn/TIJG+e70TFEQeq98UL3Dc5en8d1ccymnRnHM8DnLaKJpnQDMIE6nB+NH2fsiYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vth2AlgAQbD1Hwe9OCwVoYzRzyUfAjdxnN7aUM9sxpM=;
 b=ObfKuYOLoKPmCCqICAei882az95jvdwW4+ZuMbZFtQX3kGqwQHotXXYRGECreKR5CzVANtNA/XCJMGTYxioWSTSiJadjv14O6/j46XzzmRIR3xLZSQQINhGkDwE5R267NNiDzDq5i/5tXDKUA1TLm8cCLJpsA9NG6eYZTm6ihFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 12:00:29 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:00:29 +0000
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
Subject: [PATCH v4 14/20] drm: renesas: rz-du: Add RZ/G3E support
Date: Mon,  2 Feb 2026 12:57:45 +0100
Message-ID: <dc9b5f379bcec34a7276d5d769828fde4231595e.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7022dd-5a87-4a73-8363-08de6252a89b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?HiEVYQ9iIs6jtUARLVNJdm2gxaUcXZ/gkebIvpOY+wG0FbBUqhUD4zhrsWGB?=
 =?us-ascii?Q?4ZAznwhalbfQIlt9pkXLWup6lnXmStiHIUWmKCpACZC0K3lRUhYKc5VKc1bF?=
 =?us-ascii?Q?q71PBrss/uPRqg/2PrYaUMN1JlFAWW7AaDR1p3ICaFT1iOBmW3cHRV2hdLTl?=
 =?us-ascii?Q?5+MCSuDRMh6xqAAgTgPh45KY/LDgq8GusggfjiB43HXvCHdhCbZ9Mn5zvY/i?=
 =?us-ascii?Q?5meNQ8Hd7xBLUjgnPkL9iSqqgYccQCoXVWMM+dRqscv4HpJsR/5PFDxu4K/g?=
 =?us-ascii?Q?zlxBb6EPSP4U7dh2g0YL3P484453yRgVvo807Hgp1CdA6m/a68DSnKZJifg/?=
 =?us-ascii?Q?Y/UO6RTaSc1JWp+PomlYevUgID2wp1CUTyDibGG/LMKNK9yG/7ZjgJSJN3u6?=
 =?us-ascii?Q?bbl9E6c+Wigd76zqHn9B+3C+aYLergacl/JTRRESSY2owtzMovyjpPPGgGb8?=
 =?us-ascii?Q?1XYG4tRy+af0xi8WqsJKLFtJtoZW517HN8UoYCh1LHK8JnBzFmTM1d/RSZRv?=
 =?us-ascii?Q?KNyPCRbgArr22aZIuxhDSl1uYQBs1yr26s0bGxHotXX7QV9Fen0usyixl2AA?=
 =?us-ascii?Q?B78r95FmVonQGQwwqaUVgcssRXEisoK6kosyGZg/tAr7sNaeHImtJyC/EpWh?=
 =?us-ascii?Q?wvXDvFfxNYf9grnMVLOlXCRwg3J+0CKtaC9JqJjWaxPbH6FOZfndZqTr0m6e?=
 =?us-ascii?Q?BmAmSsnx1/3xcteYf/9fFOuN/20M+LMlLSDNBG4FgIEPn0qgF5kTakSA+jNt?=
 =?us-ascii?Q?AQk1vZKBsEAVaQ0tBDhbnG1cQVLmFFc3mHznQRHYn+rQAxQPTJZn+6KLkvtM?=
 =?us-ascii?Q?UQuLwGfgwYnTzzdkI4JIbzbL29YbLa58T77jYfGOX2oqHu+ID28qvwWyA7hM?=
 =?us-ascii?Q?vYHm9sDMshI2TGDn3adjIqmynVFVHWk1m0vc0MDLpARkWWZTKwNvqgQxrh0t?=
 =?us-ascii?Q?ou5JzS2scZdN9YJhgt7xjzn/geaFrNW/zA8Ldt2EVr4TzlbcT2P3l6NmmaeN?=
 =?us-ascii?Q?tT5ECltXxzc4fwRpovspeCkq//CQ35l3n+ZFVSgQrXc3k3CA+arLxYSF1mDz?=
 =?us-ascii?Q?qdjfNvCxm48/5og+llxvCkia6PJ5o+Ax0fVRvqtg1Hph7m0dqKPdIQQ+nx1I?=
 =?us-ascii?Q?9Yt7TMVEQt9N2GuxvMSynCEjw4SXFguQITuBrsH+RmrxvAffuWdWxtWPh9vq?=
 =?us-ascii?Q?0fRvHdHO3GHiylsi5/WUWORPAs7cIjzJkr9IkQ3Q9eHzsb0/qZmigg7Rc3pO?=
 =?us-ascii?Q?imy/Rm2buVI1WRoRf6FuJJG5x+j5ZBvQ+UiRoTNxw53yU8ufTShn27Objs7K?=
 =?us-ascii?Q?gcELJL34veO0TCyN2FBVNKLL8Qvr5ZFpiwNvjJtCmfUBBGF7RbJ5ao6LgbBk?=
 =?us-ascii?Q?DN76Qy9dJUyvS6x3RYwYSFOJmjdFMu4zRJbgBI74VcJxEm1Op3AgCDchQFrH?=
 =?us-ascii?Q?mJ8ZMr59ESLRluVQjPH3U3LC+NoHKogLo3bCotqhFT5ZSSDmEXGL8e2ex8zS?=
 =?us-ascii?Q?nkKPF122j2HQWSluBa5+/x39LQH8s2TzcYQG8Qo+RpfxmIdyRikcr99NYybN?=
 =?us-ascii?Q?cwIB/8U6gCjx6kTdGZCFoPGkKH4MJWpFir2QqzWQYADPbWkArRTaD7QoFRmy?=
 =?us-ascii?Q?aGhvECRlS22OZJtjC9nBlZE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rKmTTetYFVxPl6hqoH9apFaeaujPtcpad8e9p/yl1j7F9r6ciovT+SZ00WbV?=
 =?us-ascii?Q?KdmYMzHb6Gq5Dx8mb8dAS7s4VB+apimcyfusxDfEUtPX/zpKoJ6W7kM1Y99K?=
 =?us-ascii?Q?Ak8g5+/XLFU+13snWKCljtSLmQRFNQapyq5TqGAbGGSf1eXSGWKy39C4W0Lx?=
 =?us-ascii?Q?UbgsknKv/dDHjIr1ojZsBkyL4i4IycpMQVcP5iuI6NWhcFdZq4MrOS9nhO06?=
 =?us-ascii?Q?R5I/O3twgtOyO5vATwRa9IKYAStLFabElvNSx2FJ7dkV7AsxGfLYVCzsjO+u?=
 =?us-ascii?Q?IMk5r50ebEztkIKLuXJYjnSOaZg+slhF6CiFbS69B5727zjzFVhEucB+8df1?=
 =?us-ascii?Q?f83CPa5WJcp/DU/At/EELFG1QePQy7czO/jguiIs3c3qqmsjPDsjdAJ+pjlV?=
 =?us-ascii?Q?C34a2Bwlk0+QL+kCX/x13/Xac6jVx3OReTDO2U686Uo6cyNrtBe75zOh/Jgt?=
 =?us-ascii?Q?e/r6EGr7clUQF1cebuh1eqgXmvItw1uwNjCJzew9BjVyHLSY4L5oELZw6WFw?=
 =?us-ascii?Q?DIRtDyI+gbpEOT0nI4eskfYKEChGlYFqgFmKdSIKVerX0MzRGyeerM6UU9hH?=
 =?us-ascii?Q?+5dera3aYMWDKdgsb2acfAWbddeXJpCy8Slrd1zisMwlCRQij9uwLD8dnlXp?=
 =?us-ascii?Q?CsFD+WbR+noJh6ywTJSzeGsMx6SIa4LuE7e3MFablGFIPmL7BWiKXd5cJTPu?=
 =?us-ascii?Q?dLoDYeuKyfk31H3D0X2Tcg7jwaIh+9jm8LW7uAQ2lllSFj/YsGMdzUYZ+Wv7?=
 =?us-ascii?Q?wwga1DAvMOgrlahma6h/lN57u0AKp382Thagxs3xBqiA9Kf4sa4QHrWh/sX2?=
 =?us-ascii?Q?FrtcxtTrawPYTW8wfeSIwv+o22nWfEqZRi5c4qf0784LFgdy4F/2sd9wzJEi?=
 =?us-ascii?Q?wjlEpTr9fGz6lqqu6GlaJDahGSgOtl4z5uyxhC7xSgpMAQUPJhTzpeo1FIsT?=
 =?us-ascii?Q?foliHtVqNZKrEatAUalvaZrlC7fR6JQqKJLLtX7+uACsRXU/vVIzGeMnXnQE?=
 =?us-ascii?Q?haXi0oIjCCCVPhDCayHakMMyVpNPXD0vQ013xODxXfrAUxMrqq5vUSUcrQpl?=
 =?us-ascii?Q?UH/hz7RTVbkwOkT/i79QALXqv3GFWzSqMYLrqd0DhXlL2jDro2i7LrOIn0gL?=
 =?us-ascii?Q?Uc10BXTSy971NanM7I2u7EsKZFlg7OoFvl6s0ZbTP3pMG/+pl32GWoqOxo4R?=
 =?us-ascii?Q?STO6a3LU40CKHDjj6JKNNlr9CDd/nIeZswbdMCTlaXufb1o1TlruRvDvaaE+?=
 =?us-ascii?Q?bRb8d2l7gMS5yLOrIVrsR+7vBcF6hFD5+p4F49FWD0QFGafxI8r7WYG5SWbc?=
 =?us-ascii?Q?h4hekvlL2I6Vj07FPzsS4QFmgb550s2m3Yy0+LQx58gQ1iu4WkDYoHTwXnEf?=
 =?us-ascii?Q?jPi+76/t1El2KK/y4xDhqVI723W7HSw/nZgDmnD3vLu1It/Nnl1yFA1kCwKX?=
 =?us-ascii?Q?IhfC3+Gxr7sPxc2xUm8qzVwzZ8VDkjtBnW5ur0iN3eCUyXe5KJfWkbx7281t?=
 =?us-ascii?Q?bBrPZ24aCRDAwSHiecZrnPuQKoEFsBEBzU4F4DGRj4KgkrshgvLXE3dIIAkf?=
 =?us-ascii?Q?iutZJBp1XJdvjPGl6L2XxUh1lN+NncLe24sLicZI7ZIUrCddpZrd5+FGZ0qO?=
 =?us-ascii?Q?XOEJi1l7/kaLyoSQNLc9HOuqC9JpnAaVx9xym3HJzIyevgxy3i01nDQDRIiI?=
 =?us-ascii?Q?rAWvwIQiFbbJDpWxHwYfAWKtVE4Fhw5BiioxQoB/6FqSlwXBNekVall/faUL?=
 =?us-ascii?Q?m4je5ap6Biu/WB852UIVpvnoXPv1S1sZ/lZB5sLI3fpyuL1BJgw1?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7022dd-5a87-4a73-8363-08de6252a89b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:00:29.2207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ll5no+EyGVsMwiomxFYoGDkWBNg2C0bTGh8LgEMvIhhmJjGNYJYEyfK7z3pEhRwx1+pqmYfGjsJoZfXMvtp9a5pYMdRZrdQVV8ui85QU+a0JXpjkvtzNSde66gbe+7DS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6552
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27774-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 93DC3CC1BC
X-Rspamd-Action: no action

The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
Processor (VSPD), and Display Unit (DU).

LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

Depending on the selected output, the correct SMUX2 clock parent must be
chosen based on the requested duty cycle:

 - Index 0 for LVDS -> CDIV7_DSIx_CLK (DUTY H/L=4/3, 4/7 duty cycle)
 - Index 1 for DSI/DPAD -> CSDIV_2to16_PLLDSIx (symmetric 50% duty cycle)

To support this behavior, introduce the `RG2L_DU_FEATURE_SMUX2_DSI_CLK`
feature flag and extend the `rzg2l_du_device_info` structure to include a
features field. Also, add a new helper function `rzg2l_du_has()` to check
for feature flags.

Add support for the RZ/G3E SoC by introducing:
 - `rzg2l_du_r9a09g047_du_info` structure
 - The `renesas,r9a09g047-du` compatible string

Additionally, introduce the missing output definitions
`RZG2L_DU_OUTPUT_LVDS{0,1}`.

Introduce `rzg2l_du_crtc_atomic_check()` helper to store the routes from
the CRTC output to the DU outputs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Instead of using clk-provider API to select the right parent clock,
   based on the outputs. Just set the correct duty cycle based on the
   output, this reflects at CPG lvl to select the right parent.
 - Updated commit message accordingly.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 48 +++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 26 ++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 11 +++++
 3 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 6e7aac6219be..c51ba4b8c383 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -64,11 +64,32 @@
 static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc)
 {
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
+	struct rzg2l_du_crtc_state *rstate =
+		to_rzg2l_crtc_state(rcrtc->crtc.state);
 	unsigned long mode_clock = mode->clock * 1000;
 	u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
 	struct rzg2l_du_device *rcdu = rcrtc->dev;
 
 	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
+
+	if (rzg2l_du_has(rcdu, RG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
+		struct clk *clk_parent;
+
+		clk_parent = clk_get_parent(rcrtc->rzg2l_clocks.dclk);
+
+		/*
+		 * Request appropriate duty cycle to let clock driver select
+		 * the correct parent:
+		 * - CDIV7_DSIx_CLK (LVDS path) has DUTY H/L=4/3, 4/7 duty cycle.
+		 * - CSDIV_2to16_PLLDSIx (DSI/RGB path) has symmetric 50% duty cycle.
+		 */
+		if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS0) ||
+		    rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS1))
+			clk_set_duty_cycle(clk_parent, 4, 7);
+		else
+			clk_set_duty_cycle(clk_parent, 1, 2);
+	}
+
 	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
 
 	ditr0 = (DU_DITR0_DEMD_HIGH
@@ -248,6 +269,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
  * CRTC Functions
  */
 
+static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
+				      struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
+	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(crtc_state);
+	struct drm_encoder *encoder;
+
+	/* Store the routes from the CRTC output to the DU outputs. */
+	rstate->outputs = 0;
+
+	drm_for_each_encoder_mask(encoder, crtc->dev,
+				  crtc_state->encoder_mask) {
+		struct rzg2l_du_encoder *renc;
+
+		/* Skip the writeback encoder. */
+		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
+			continue;
+
+		renc = to_rzg2l_encoder(encoder);
+		rstate->outputs |= BIT(renc->output);
+	}
+
+	return 0;
+}
+
 static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
@@ -296,6 +343,7 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
+	.atomic_check = rzg2l_du_crtc_atomic_check,
 	.atomic_flush = rzg2l_du_crtc_atomic_flush,
 	.atomic_enable = rzg2l_du_crtc_atomic_enable,
 	.atomic_disable = rzg2l_du_crtc_atomic_disable,
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 0fef33a5a089..84e6bf186f5d 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -51,6 +51,29 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du_info = {
+	.features = RG2L_DU_FEATURE_SMUX2_DSI_CLK,
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+		[RZG2L_DU_OUTPUT_LVDS0] = {
+			.possible_outputs = BIT(0),
+			.port = 1,
+		},
+		[RZG2L_DU_OUTPUT_LVDS1] = {
+			.possible_outputs = BIT(0),
+			.port = 2,
+		},
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 3,
+		},
+	},
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -64,6 +87,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g047-du", .data = &rzg2l_du_r9a09g047_du_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
@@ -74,6 +98,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
 {
 	static const char * const names[] = {
 		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
+		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0",
+		[RZG2L_DU_OUTPUT_LVDS1] = "LVDS1",
 		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
 	};
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 58806c2a8f2b..c6f9dc46ab31 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -20,8 +20,12 @@
 struct device;
 struct drm_property;
 
+#define RG2L_DU_FEATURE_SMUX2_DSI_CLK	BIT(0)	/* Per output mux */
+
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
+	RZG2L_DU_OUTPUT_LVDS0,
+	RZG2L_DU_OUTPUT_LVDS1,
 	RZG2L_DU_OUTPUT_DPAD0,
 	RZG2L_DU_OUTPUT_MAX,
 };
@@ -46,6 +50,7 @@ struct rzg2l_du_output_routing {
  * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
  */
 struct rzg2l_du_device_info {
+	unsigned int features;
 	unsigned int channels_mask;
 	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
 };
@@ -73,6 +78,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
 	return container_of(dev, struct rzg2l_du_device, ddev);
 }
 
+static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
+				unsigned int feature)
+{
+	return rcdu->info->features & feature;
+}
+
 const char *rzg2l_du_output_name(enum rzg2l_du_output output);
 
 #endif /* __RZG2L_DU_DRV_H__ */
-- 
2.43.0


