Return-Path: <linux-renesas-soc+bounces-27710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPvLKdPrfGmdPQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:35:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C0BD4B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFADB30A679E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234B8369232;
	Fri, 30 Jan 2026 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="K8rBM3cI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D81436657D;
	Fri, 30 Jan 2026 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794118; cv=fail; b=tRhz4Q9C5skh2yC5q8DCPCfII3wr58nCO57bdpApee2rryYrKBTJRF8VUCEusplnlaAJDA4mi0fZGovgsa0FIkeemxyxGUrd5fGeHz4sQcWtGa7tWjxw5OkzoWtX3Omod9di6FWxPIfJbpPxd5GHtW9QakQ70y57DiDLvw24Rd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794118; c=relaxed/simple;
	bh=evpwi9DuesK6SPnH40ckZAP0q6RNCT8quHOJbwF2i/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NOXkLAEviQwkCg5jSBkIxzHjvnBcfHaBpMle+RQ/2xKkTfXRhvT8LYSir3x6bBOdWapmoQsokyN6KlQzGU00EGDht0qd0LBEa77uF64jrLcR1piGzfI4dXCp/oXdZMmiGNlOFznP7D6gQ+jqY2Bj9hZuXr06H3825DKAmCVM+SY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=K8rBM3cI; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eweSShid7KAKO0W0bG0+S4nrUrfJXc7GGJz5ycPiDJbvzeTCqxqRFQkMHYAjRteCZvnn6VDXpPvbguZWEeYh/GLRIFQ+mna7XCr5jb15MWio4p/WZcoOwF1LZcRle13DR5HJe+QfxUSrxM1Q93i0W//e2zpp32MM4UaX+jzvmyt+oaD1Q/HXcSAc+TESxcdGgTgwUQ7ZvHaYl0++/WB62BluAJnej/P2JgwTlApH/ayQvuTsZmaN/jjlx1AUDzF6qf2n5BPyBtolpjirBXBrpMCfbHMH3TiLS9KHlHmw0Da4bxcXyiD0wjOfMtVEDww4HT3CzytQHmpeWP6Jfz244Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ddzas2kohkDfc6AsVOMTpmBNehOAHJmtv4SW9l0WGA8=;
 b=eAtfhkPrRmtKZD3CrHsCf9LuBvj96VWy+FmRgjSjPPw7kcFdrUcJuN8Qas1RS/hVQHte8JHGQPioRLhwQr82NiQ6bKURtMCLiGHIUDtdzwIKpyFN8bsGWHPWwn6BNaOOoAVtW5LK/dXDYi1mw2Ea/YTc2ecMZEJGSXhVengZgraCAhwVorvIdiYtwrKEvgiNOCVTMDlAQOfsnKs16D2tP0a3Ww9WUm/C/Rry4icFLul30PuUav79DoSBP/x3Mn7JjKGiR42U0zAw2ThWgGgDBuS/qPl0cs61CaxfsLLxr6Q5SzoruuX9VTM/rrpOmL7Jz9tnxT6qgjVpFvdLaHLbqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ddzas2kohkDfc6AsVOMTpmBNehOAHJmtv4SW9l0WGA8=;
 b=K8rBM3cIuVIfRrkbRoxpuSd+PAFR5T4qB5M4eXpUdGPHEXud+cvW8uXKtPDGyR5hqOKIbjc6voW4rSTmJwL1KioRL218WFfI7i65P5olgb3qOClwcgrva1NTqogp5LP87/CVXsJMHZ9xXYD2VY39Fn6gLW4iQUjVUXwrpzgccFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13818.jpnprd01.prod.outlook.com (2603:1096:405:215::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 17:28:33 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:28:33 +0000
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
Subject: [PATCH v2 19/20] arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
Date: Fri, 30 Jan 2026 18:25:16 +0100
Message-ID: <4eb3faa2c627a5a0f51a066a7810595ef856c74d.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: eb439920-aa83-4527-f560-08de6024fe54
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ai5wmWGc0RJg58MsUfZuQ7IWkHuUDNQDbij6cITeomEyknRte9Q9RYLGK0DJ?=
 =?us-ascii?Q?dJ1lE1Xqnr5of17E+MLqS1ivW8Umbe4wMkiZK3U3Dy4dxIScUGyxZ6vgZNnb?=
 =?us-ascii?Q?ToY5gCOP+oebTJQK3iupbwZZweEzKM2VLFloNVzzKQDo9mI2t+z+KnFTwT+H?=
 =?us-ascii?Q?Ssg33ESG8x1ELV9iurhaXBJJmE9NfnonmRgIrtfgE8kej75AKa3cg4rXpWWg?=
 =?us-ascii?Q?PHcUxhnNhS+6iNHmn9CPZZSZ6r2Qg27IrOYO22t4Il8gmye84Ubux5eB7p4y?=
 =?us-ascii?Q?pPGAcYeR8LsNLuACMBzP3GIjUmtVh7K7Y+bovg6N2UAhB9nphnC8kx2CjW6t?=
 =?us-ascii?Q?ewIhj8TTVxjIRwATwBrDiO2qmLQveRVV9oJhrC6nllYojbrPC7NcALKnsfOx?=
 =?us-ascii?Q?y8j7K65QwMxoUjDxRnzZ4RLUoOrFHag1NiHB5LT8jwLLgtJ2RkZyOsTCE4me?=
 =?us-ascii?Q?in4ObXOxV4DVOgxtEkry676eKeT+xjWwKqi4jGmiLnDIbVv9CnrFxx8HncdU?=
 =?us-ascii?Q?E1sDqwBWFx6B+ReG+NHHf2caWO6b4izVk5fI2xzIJUvr3GHrOglfglqnOJKW?=
 =?us-ascii?Q?lEhZvzmzZT7LQVQqifUXVLApJwQiyKToVadiA4Xsh5m/L/tHQHK3+NUkiqsc?=
 =?us-ascii?Q?xN66b88N178pbrV8wS6ZvuVBBzq/sECtc8tlr/GgAXCWN8h7+26P/ypeOMJj?=
 =?us-ascii?Q?StpaBjeECrnxLy6I54CSkXDpk49xs7NtGI+oiPI+xflB6NaZ3rsJwld5K6R+?=
 =?us-ascii?Q?MEIHsTpu0ArME548ha69voJ8+yczpway3ZMe1f0adH6tkZsryFKJefX1AC2b?=
 =?us-ascii?Q?x8QnL7QZVTXaG54mMquwlZ+/hTfw7UjRp10z8y2UIET+o5K+X4ZfAmA35f2S?=
 =?us-ascii?Q?eN5bttHylnks6AmbmYdpMFnm9AaPnJUiBdU3UpYgGGXlvvbw/iNUo3Z1qmhS?=
 =?us-ascii?Q?2olgL91mL5P301vbFi2opXRICDNGw1HIMM6MnXqC9xIP85QScTWo1lK8DrEI?=
 =?us-ascii?Q?6Wa7B4tHBM183Zr2PKQCrH12J41jNeyglHByRwzhxwM421r2vtUwTwf41GiG?=
 =?us-ascii?Q?FE/xKxw92rpSd2O2WVviLtJ+hh8F+CmuGNvalz1jjRrGBzHv90cMl2IZWjm6?=
 =?us-ascii?Q?OQV2LWitVjx1tKVSstZ5NtQLQao4L9YKiATGRY0UaR9OR9pY9KIVaHPYHlBc?=
 =?us-ascii?Q?rMZxpRzLANRuyWualV6SJ1i5LIEOUvN0XMBErrGq5en80LxdDx1teJc03Efj?=
 =?us-ascii?Q?zdX9ceVKktgxPPR0J7Z1b9SP5/Qs949YBWYPSy0oXLd1WE28uMM8EgkXQIhB?=
 =?us-ascii?Q?50cLFrMp7JiayWqjc7UnKGlKIA5J8IW2TmB85YZchRSOA7NBLqLIeFasGLcy?=
 =?us-ascii?Q?yN837+6lR+qAfH3HGeNqYv0u3SqnEGVEktt+PPem2O7GSAXGpbM0F462S3tJ?=
 =?us-ascii?Q?Oof+8x81Ed48MuKZ0ApsLW/2VFQPvpz3+hnqTK8sHxoWgvTCqZlCUTuHqcTr?=
 =?us-ascii?Q?4rymS3pZgqepmD4WEfGaeuE0enFJKWqqmu5AtdKbTvcrQfEqNjkK3jLLew5o?=
 =?us-ascii?Q?+k0OWFifKnBpc9fM4mt6wvbYR2HVPkelYFxBXijos7HNUWLjzJNdy5HMHC4q?=
 =?us-ascii?Q?KFiNvzZSwgzz1hOOzrxRhKM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1YMl1QPiPfC7QTWsXl6ia6Vt/fMiOrzZMtFIktmIIhulGDCwn3Gay6mzOfm9?=
 =?us-ascii?Q?ggF0lHIA+55YIUJdzMsAKdNAv+9cobgpL6vy1LKU02PtooSkzzP/nhBMJX+0?=
 =?us-ascii?Q?Y6jF2AWRR1XAXl/dMJq7C2g3oEcFJiklMSYe0RyQtrW9gxwi+3vpNZiDN+Zo?=
 =?us-ascii?Q?boLKzl/UZzh/2Jey2Fvv7HFD7ACZ0cgy4b93Y1+vK1N71uNdd9B/qG1PN9sf?=
 =?us-ascii?Q?4ir7cUd6XUmYB0bsqroUUBAJ94CRI+Sz9dGt6eVPhSAsoqKCYMeJc8mggsBf?=
 =?us-ascii?Q?/PgyXLWW7eNWbR1oOOj1H04LO32Y6+QfeXUu3P6EizCJ89lAGAAxHFWD7YV/?=
 =?us-ascii?Q?D/lnkhg+/Uqij5+acjO0oSauzM8x4/B0IE9l8ZLGUKUH/Ck0TLwppw8YO/Ew?=
 =?us-ascii?Q?gS4ts2GvXS0cvWgHw0SzNq0H1lWedLnARoMC+dy/V8y3GNKICtxVbgAQ+5yN?=
 =?us-ascii?Q?szGVpBFpx8KP9rLaQDHtJva15KXaPg5mRH0geDESd7nIdPTiSL6RhChW3zc9?=
 =?us-ascii?Q?nGKFBsToSwJvhCH9Tn5NyZEcEMzdfSpaRj9UZA21BFTdKvyxozLwfCKgAJht?=
 =?us-ascii?Q?fwFs3axKgelKoVZPI6qxrp6LZcuW6Zgj6IfPMNacVpE+P2YV5kK35EKpaA3h?=
 =?us-ascii?Q?mREslxMtjv7N9g2NCd6t5OQHyQWKgA22PFq/heM5YZ6tXhPGnJkDOzNRHmrb?=
 =?us-ascii?Q?3gTq4Wy3I/A6AJQHKN7Nfq6JNnomu+Ze+YtLIJ46rur01JSxrfhZlQVdJ1fC?=
 =?us-ascii?Q?NOAcU53f1ZhhvN70Nc9iUtQvMYg2EP07moMDZBvbDgRCStuEmqbRGJZIdk3A?=
 =?us-ascii?Q?eJpW1vs2u/+DQdxSMywNVEj54Cyj7lado4WLLlNr415eyCnATWchgaUy0vw6?=
 =?us-ascii?Q?oIiP2xUeurb9foeMo9J+WYHuyLMB/pGVGxQIkZYmk3qQgwRAHNH4ukGYud8d?=
 =?us-ascii?Q?ljBzq6ToEseCmuF70rZjS8Dkv+W4L7yj5++2k1/4y9gTdZ8xJkl3D8IAiU7Q?=
 =?us-ascii?Q?SmNRVPWBsUMrAVH1JqIjGZlPk50A8GkbNvauXtlgteyeuozFTRkekmTNwZVl?=
 =?us-ascii?Q?06Ioxu+bFTQKTGwLaVldnL+ChYbtFcqsFsa6Zqm7MMmfCLYV2TIf3K7RakPU?=
 =?us-ascii?Q?ALIQgz+3PgVElmmhjGmuhewYWTxY7O5nIxTtD2MW7SA8WqlAHqyjVNiE9ax1?=
 =?us-ascii?Q?sTIPXZ36C9QzajHFPH80VguLncVALw0iyn81wJIs80kIri24E1KfCJf5jvvT?=
 =?us-ascii?Q?NY1KM2wboAVNxZpKTitB1zI5EhpnwELjygxBol/Gv6GQ79NHqi4xE61DuN8C?=
 =?us-ascii?Q?YRJdasakJtcswGph8eCNgmmXXP4QTEs3OCcElYhi3q+sKdllw9Q4nbgjSFHy?=
 =?us-ascii?Q?6GRQWD6x01cQde2CJvc80hh3vrGaOdwjM6VLCYdDZa9Hrpt9osMfWXO96cCR?=
 =?us-ascii?Q?/ODVh2wq/GKiXLotFnO6hUJaGOTRU1nfpYQQd1Q2kQ50FnE4g5sWu+MgMsGr?=
 =?us-ascii?Q?hJWnfZscvf0eNAQLUtLTnS3k1lwsWCC+yvqcsEu0HP8kZCBIdvBYTZI5XqtP?=
 =?us-ascii?Q?lbvlEXbUETIHjl+630pXNUPFFub5Hrvlf3gib0vsWbi9KVpZh3Q2bz5D8pc7?=
 =?us-ascii?Q?jSNPjd4SPYHfbg+T63/jBLoCww0CYWpxiVnLIKrNkFkx1vOavW+v+/QJ6pd/?=
 =?us-ascii?Q?cyi1EyKG5GWBfv6R35V9qjcI8EHkThIuR9hHhX+z0XpGct2VM8AkXrHEPB+x?=
 =?us-ascii?Q?J9bncUN9eVgVRDanyMHk4TzJClw8vij/8pxl+w8NikxWebEZzYWy?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb439920-aa83-4527-f560-08de6024fe54
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:28:33.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BlcvRhOi8dX83f49kf5r2z8huUnUKiUBweR7iOLcQcgWDYRNoIKcqler2pZJqt3apPpo4Z39b96hSZpzrNaquZwuCFwxJnHbqWHOr7E4VOUKykPKHoGCF2qtg2MnzLlj
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27710-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email,0.250.179.176:email,renesas.com:email,0.251.79.240:email,0.0.0.1:email,0.0.0.0:email,bp.renesas.com:mid,bp.renesas.com:dkim,0.251.40.224:email,0.251.158.16:email]
X-Rspamd-Queue-Id: 100C0BD4B2
X-Rspamd-Action: no action

Add DU0, DU1, DSI nodes to RZ/RZG3E SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Use single compatible string instead of multiple compatible strings
   for the two DU instances, leveraging a 'renesas,id' property to
   differentiate between DU0 and DU1.
 - Use vclk instead of vclk1 for DSI Node and set to the right position.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index d4db44b6ccf7..46240a6ff992 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1432,6 +1432,129 @@ csi2cru: endpoint@0 {
 			};
 		};
 
+		dsi: dsi@16430000 {
+			compatible = "renesas,r9a09g047-mipi-dsi";
+			reg = <0 0x16430000 0 0x20000>;
+			interrupts = <GIC_SPI 874 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 876 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 877 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 878 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 879 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 880 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "seq0", "seq1", "vin1", "rcv",
+					  "ferr", "ppi", "debug";
+			clocks = <&cpg CPG_MOD 0xec>, <&cpg CPG_MOD 0xe9>,
+				 <&cpg CPG_MOD 0xe8>, <&cpg CPG_MOD 0xea>,
+				 <&cpg CPG_MOD 0x190>, <&cpg CPG_MOD 0xeb>;
+			clock-names = "pllrefclk", "aclk", "pclk", "vclk",
+				      "lpclk", "vclk2";
+			resets = <&cpg 0xd8>, <&cpg 0xd7>;
+			reset-names = "arst", "prst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in0: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_in1: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					dsi_out: endpoint {
+					};
+				};
+			};
+		};
+
+		du0: display@16460000 {
+			compatible = "renesas,r9a09g047-du";
+			reg = <0 0x16460000 0 0x10000>;
+			interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xdc>;
+			renesas,vsps = <&vspd0 0>;
+			renesas,id = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du0_out_dsi0: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					du0_out_lvds0: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					du0_out_lvds1: endpoint {
+					};
+				};
+			};
+		};
+
+		du1: display@16490000 {
+			compatible = "renesas,r9a09g047-du";
+			reg = <0 0x16490000 0 0x10000>;
+			interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x11e>;
+			renesas,vsps = <&vspd1 0>;
+			renesas,id = <1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du1_out_dsi0: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					du1_out_lvds0: endpoint {
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					du1_out_rgb0: endpoint {
+					};
+				};
+
+			};
+		};
+
 		fcpvd0: fcp@16470000 {
 			compatible = "renesas,r9a09g047-fcpvd",
 				     "renesas,fcpv";
-- 
2.43.0


