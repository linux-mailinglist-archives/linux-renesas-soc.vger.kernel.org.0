Return-Path: <linux-renesas-soc+bounces-28283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKe3DsWWlGn4FgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 17:26:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F914E2B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 17:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EE7A30518FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 16:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E1436EA9A;
	Tue, 17 Feb 2026 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="We60UXVD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E0136EA8A;
	Tue, 17 Feb 2026 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345496; cv=fail; b=W2rIpiePmsZ53VZZGOiQhAmlePf+PHZPs7OhSu1kqCJNmR6bRqNevZH2K9FSiKIyuHYmq7kUsfJ59N7cV9Wwcunq8/gycq3dBdkMa6MC7T3szvQHJI6aIqjpKjIPqekAZENrEFzLzcVfOddezQD0k1H2t+3llYMwx1gVwuEqmGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345496; c=relaxed/simple;
	bh=uuBSCZD3XQxuLUUPOfesajE6NOfglGxuZ8Dxvd/Xjhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uhIhkM5GrDpE5eP/j2pi/F2deSCO6NmhF5cljSv/+Hofp3llME4kFairDSJzTiIMcM2UYYn6+Z04L/OtBA5cEe3LjWDdcYbXVl+06wOHn2u1c8TsqtHW4VhpMN4s2wywSz0Lxj2slnjHgQqBe+Ed8cWq6aazkSpps1+6X89QBCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=We60UXVD; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xy6Mapr2Hr5lQWKhyQ5v/7Xfgc27Fc68AyAZgCyhrpJh8WEcCh3Qp4rbAhGk+WZed/rVF28Ejdu0EXpXs+U1djBpBhdkQ4Trh8f7n0bTd7KeSZcZ9102pufUlg9CzqZ2Pb6saPm4Lc7mnxkKtTifHp2/YBxir3GF5NqCncjRV14xq6PzLERlR73v8EBFle2J9qQELNgSf+6yuz/EStxG6lrvAjVVEkCX5xsGMCVJeIaSJExIiO+UHDu1miuq6QsqL7afrrbybJwvztVhMJGX5tlEjkZDXFuxF5MzxUQTPTx9ASuRpWqa2OQODqHb/dH5AzXn/bhs9mxyAldgboUVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rz8P99Ixnh2o4dsvxHR56HaGq7DQ7PrWgqR0FKICVUI=;
 b=Ek2zSJdKw2noTwAHQbv2nnfGp8o7Acy7LhppfGQTX9XDQ2onMwa0v3ZcB0U1bgds20xpHh8qu/NPewyv5lZ3QiBjRtyCXvRg5mVkKxvz3/swM7sA/PHLRS17V8OHvNnAf65kD20wJCGvt54oHzo+NYqR8PZ4FhAQTyU56DzaIUM68/Egeq18r8i8eoHbGay/BEWVw3ufnZ9PoTKusuDSdbw59T2/m6W2oQKj+PAv5a/0k1FKJkz6XSAX01fveqWxMcP9/oIAShFEG5V5Y5PyafYonjOptXkafIxjVBxbKmdBCF76yUhQtCzzPC8qlwX7DsreBtI7LxSEbFs+WvtbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rz8P99Ixnh2o4dsvxHR56HaGq7DQ7PrWgqR0FKICVUI=;
 b=We60UXVDkbR1dmDurTJNwFSt3/CCntLcbQIAomdo+IOmi5e5X8ob0tmdvHo8wFAhlIUNoG5lkLBYOyWwAlcq88FAQXGC0dShvaaYKFWDplQqZ6Wx7jODNog8lAdER0sOlpl4Nh04KBZ5pIHqdYvHZ54M65AEgEU7KBJVigvPgJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB8581.jpnprd01.prod.outlook.com (2603:1096:400:154::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:24:53 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 16:24:53 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/5] spi: dt-bindings: renesas,rzv2h-rspi: Document RZ/G3E SoC support
Date: Tue, 17 Feb 2026 17:23:47 +0100
Message-ID: <f6b43f0dc64e13b1c9942c164dea30002d4c4466.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0320.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: bd3f79c2-68b5-4637-cc94-08de6e41145a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D0y5Y+uBM786VivPC1bRnuNpz7Tui4TzYKa+Nx/YhTFqMQ/HywKcXtNs+U+x?=
 =?us-ascii?Q?1crXLQQ9+0K1c/hT99YvofXqHXGs7tx2I5WUz8P/K/EMhjGVkPQ6MuvWYePy?=
 =?us-ascii?Q?URqoK35n7boIb+hG4kb17kxdv/1BobWrOjvV7TQY28YB40bIZptQoSvKJAT9?=
 =?us-ascii?Q?l6zj6eLhhC4DfI3433eQh6Rjf35lhvb7eBRNEp8r+O8wgP5oUmth6TpmbUkD?=
 =?us-ascii?Q?ROBwWtTBGbaoSBmCzAGDGdL7n3G9Rc//GdvbZht/T/kx9pf4OOIGKG11D4dO?=
 =?us-ascii?Q?jXeSmZJZ+fIJpGBq1IVPQK7k6GefDPsNH61s+2MAkAijd77fiynpnJ9WpR0I?=
 =?us-ascii?Q?/AOAuEQwEO82d6D8TMCZNZqk6iwjzVwzZYg93LoXFsj4t7y0SvvaHyvMFKHu?=
 =?us-ascii?Q?poQ0GCZzPz5lun7wlFnek5XesbXfWdi42Qc7pkNVAkgT0m/fG3i4Ng15qCPe?=
 =?us-ascii?Q?1K5mPkjNVkhvzEAtn01ov6zQO5FBUeCFyqX1ircNoRoNUpd1TOP5d2v/LNuf?=
 =?us-ascii?Q?Pc4Bh1B/XJSZzILGHJUsU5raGOxU9rpltTezA56LFI1akfuBvCmCX4AdG7tY?=
 =?us-ascii?Q?drwOQURYTK0uw0x56dP68qPAUKvUoZCgOJfhlrowWFvMXTt+Ork2ICBFcvbg?=
 =?us-ascii?Q?gTOXMDg/e6GiBOB4FhaIfdGCuLVxiDhwcX4sXup72AQs6wol4eETS5wDniiR?=
 =?us-ascii?Q?Z6EoTcd9n2y8GSSHE1AxbrbFN3sAo8G9eyLTKKNS8shad5+fetKA3exriPFJ?=
 =?us-ascii?Q?E3ENIedg5XoTgoMkoWGOwWLubjQDpN/t2JD+BE3lpsf+c0nydJc/6IdthUQN?=
 =?us-ascii?Q?Mmrpubtefo+3qHQfBLgrsfTbtIEkiT8jmyxfKoGAUkWStRGpwMJaYuGjt3FM?=
 =?us-ascii?Q?Qt3D0IWse2IN5j5rJf/ez4lOZ/sGAf7VF794WRLSxRz/J5azkbWne/jgML6R?=
 =?us-ascii?Q?yaKdhJCvRDXkDIiDFW2Lw/EWNrsLfmSNXuh66xcTk5+6OXLKyItM1WI2KYaw?=
 =?us-ascii?Q?8mXPvILloX2aG7stS2zBDZaW/fKaJfVKoMNGkaT80EWa99pPvOGQtOD9lInY?=
 =?us-ascii?Q?GVftlPdQMhBKobRd7TfL81bryOfhkh0EEtHVf0I3q6tHyQ6b75m2hme6qszZ?=
 =?us-ascii?Q?XhGfqCn0LOQe4Qdnohrsjb1SvUhXQhAmO8tvq1omHjFo7IdPbNtUwt67dwEX?=
 =?us-ascii?Q?sG3ItRIa3p9KllAb4ML/KRTOwxKUE/8UoDQSwUS+OxqsPRa6M7VnY/x1QCy9?=
 =?us-ascii?Q?IBQS9I2g1T8pvrk/arREgXGwrwsVJuRaS3G73mieNhPGW+FdSzGptFPonbJa?=
 =?us-ascii?Q?IjpagVS5AkXT68njdxgnUJ/pxFWCoMEA1jFYdgHvenl6pZWFerJrGp+vjaNe?=
 =?us-ascii?Q?yliWfNpKkplznqxF4NTG62VLRLBrJE92Om/UjgdBnSZb/XMyOelsjWEfCA+V?=
 =?us-ascii?Q?CpNAqYL27hIyqnnMIkf6wE0wB7TzPLqRufEF/gD5e5ZGNnFhan/2clofhm8P?=
 =?us-ascii?Q?D6QyoQ0zmUYNW/urRNm9+7VBvoq3F9U5HOYOghCCpu+5aMIjWTPPobDpox2A?=
 =?us-ascii?Q?ifzm+pClK+ywEoXMlzii+d5DFvIuji0rj4ZlHKNVgN2jE1foy09++NkStUSG?=
 =?us-ascii?Q?Ehu8Ghti04IuOUT3Gxhyb6w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pzLsL6q+4DcK0oDWbv2CWv7EMPHj3FcDh1FUbXJloyG7+ghYulUEZrh3LVNQ?=
 =?us-ascii?Q?PGg+4TnliAQGg4lH4gknfgKF4eqP9tujATY/LelwpoiBF2sxFrdwMb02VKsk?=
 =?us-ascii?Q?ovE5P2TakAh5ri8EHTiTnF2X7mm0VuonEu1IZJMxuSJ3UhLZFC4wNZTXMPWj?=
 =?us-ascii?Q?JfIGPeBkUlXIYq3Y++DRWIDpWVb7IZMfbp+xErAJw/uuE5h4nbJ1PYy2GlOH?=
 =?us-ascii?Q?lKnY8Z4J1OgLy69uqyGl++lDAWcTtcXX+d8o3GwhE7LZ6wqWgyiHZx0RhTgb?=
 =?us-ascii?Q?wBvpUk39MrLBhTjXV8B0be88CULJLYqmXfbdgtH6sJygPaR5DdVB1bSg4+aZ?=
 =?us-ascii?Q?v/Ov1tm61o5lziHeYFRR0gFQD813aw2VB+fB4luNF+TCVZykThi4mrBg9NFD?=
 =?us-ascii?Q?r3Tpbo0XUpC+zOOLOcjU9r3XN2RO5Au2vI76f2uYi+suP9N/vPSFLNnlCavE?=
 =?us-ascii?Q?OIRKBSeUo2ydlSDAkGzkJzQRqASLgQU8lmmpvi9WoBCqzLuXjWq9HLK7eoTL?=
 =?us-ascii?Q?Q2QbXlgWeQASklCJRuIjnY747o2OWyzus/OKtwrl8sRlr/qRHdTKdMiprnMC?=
 =?us-ascii?Q?znGKDnNm5oxvUy0OqWoHEegXTzImcAxNK9MG/Oy/BwPnvfpS37GBuX55RVSN?=
 =?us-ascii?Q?RHm+nOstOWtwPwoudAHru8F9G6JD6ZvqfFCyOh7lbiIMrjBGNITYqUiOsTfi?=
 =?us-ascii?Q?dkcBfU05viz++HiGiqMFEFdSdByc9PDsNlNk2lyifeOlKVLSaEyIc5CqAuqc?=
 =?us-ascii?Q?mZ7XQCreU03v4Y5xzilQYZPdM4homwrH1vBtYRXUB03bTMHT43Ufy/1ok7TY?=
 =?us-ascii?Q?XpQZy8j16tpJJdZT0Wk9B9algekauohtAJaD/0PVlFoPKCh4pl9BL4ied5LC?=
 =?us-ascii?Q?8tc0uoeRq83F1cxGUuP3pgGKneDIpEphuR532hNYctpNyo4YqhaxHPf0qBRU?=
 =?us-ascii?Q?/mqVW9wVWM2YShHZu3qT3sqcvLeL4N69vAxnG28y1or3riMGTeF8VPyry5Sy?=
 =?us-ascii?Q?U/t+Y0GKeq8rYuPyuRgsnCcu0ZHTth1QDMI6iql12RcQCvns8cC69MZOrSEp?=
 =?us-ascii?Q?FZqK9WEgnmoZfoZAwDrJTlV3cGx/wpFzl74sVQE1AZuSYivvosiNtVRT5rEc?=
 =?us-ascii?Q?j67lh63Yzpkea7PqdGCXcAFRuD5xOyi5Y6lUb3m6OoS9szSqpcXbkWDTaANs?=
 =?us-ascii?Q?78VPhZuXON5t0QXa1T0l1uj+XcKVNhfL2rRHgDMeUWQ6N/P9+AGMJULZi5J2?=
 =?us-ascii?Q?q2QtOnxrM+uIP38QpMhpraVWSWt3pISgWZR0NNcayQQTMuO9ObkmsUtj3Bqd?=
 =?us-ascii?Q?fZSZGjIv94+zg0kUZzjwSqi4Kh5uoGJkrKHJEizSo+R2WAVFfiv8J9+RI4EX?=
 =?us-ascii?Q?OyU3hDR2pfNAFsK7w5XFTFHYrdqeGpdtBefqZOkdLXKP0gqroMSZt0Bg1d00?=
 =?us-ascii?Q?R+E/J2G8Dw13EayM8W+G+T501Wbi1eg9tgS54H4IInQQdGx0P2vKFZ1B+1Ze?=
 =?us-ascii?Q?Z+ExzvYzbfmDHs9nmc425Tz4AzDmvoZjsgPDPamP7ExjYggNZ8d3aGYhnLlT?=
 =?us-ascii?Q?jByB+YSshulOBRUPm23UDn2rqI6oJF6FmmKP4YdBzq0klXDFh+TshIka6y+y?=
 =?us-ascii?Q?D7y07jTO9CHQOZcOOQGRXjDHtMvgYiSdHxNBgPMGIWqH3LKyje8t13/lTDXl?=
 =?us-ascii?Q?6pTEhuoQ06DZRJ3W93RCNHgZ0QXpVfYwCztjGA21bd0UPKzpS7+R5PpqTnZt?=
 =?us-ascii?Q?djfzt0vhNzLj5k0KvyaRMiAQuekYbLmu5Dh5QoJJERw8NCG/+mjD?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3f79c2-68b5-4637-cc94-08de6e41145a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:24:53.0169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YeUx/A0QG0uh//4DLt/go8ZkfwaUnBQBjZwKFYRSQZSdpkBdsk8+clrLrcU/8qvnQlnd/Rl9JpVahxiL681pGQNih73O2vmr9ko/MRSV7Mn5sa7pquuiLD9+Hl2WM9+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8581
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28283-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,baylibre.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A62F914E2B8
X-Rspamd-Action: no action

Document the RSPI controller on the Renesas RZ/G3E SoC. The block is
compatible with the RSPI implementation found on the RZ/V2H(P) family.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 - This patch depend up on [0]
 - [0] https://lore.kernel.org/all/20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com/

 Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
index d6a5338d6521..2c9045fd51de 100644
--- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
@@ -16,7 +16,9 @@ properties:
           - renesas,r9a09g057-rspi # RZ/V2H(P)
           - renesas,r9a09g077-rspi # RZ/T2H
       - items:
-          - const: renesas,r9a09g056-rspi # RZ/V2N
+          - enum:
+              - renesas,r9a09g047-rspi # RZ/G3E
+              - renesas,r9a09g056-rspi # RZ/V2N
           - const: renesas,r9a09g057-rspi
       - items:
           - const: renesas,r9a09g087-rspi # RZ/N2H
-- 
2.43.0


