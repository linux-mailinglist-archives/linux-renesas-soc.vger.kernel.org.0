Return-Path: <linux-renesas-soc+bounces-29290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9dOaLBDTsmktQAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:52:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8B4273A74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5E933029A81
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E03B378D73;
	Thu, 12 Mar 2026 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fIT7/yDV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E651378811;
	Thu, 12 Mar 2026 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327111; cv=fail; b=f9E+Phtdw9xirv+Qihi8EOOtCXUD4Dt0N65u/AKzsAw5wFIFMBeGq1lljDv+v+8BH3qzxUplYlRG0gYOz8ViTlFHkmG9uVn3/9eC2pS4kIR2JZzhisadeEY6mjmmy7AKvTYnyN0C3UP2YQoNsJ9UX/ZbkbY7UgPBjqztmSQbwZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327111; c=relaxed/simple;
	bh=AwH5khPOW9hbUyOxOPUnU1A4TiVYDx6BP45+mtZQz/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B3/ey2jgzNvU0Eji4Rlcb68rQIBJcrKGwVWajaiKBH+kigQ8Df93XWgsh1W6aJC1oNLPXl8aNa/t56o6dTEJGGktMek7zZJAO8BUw4ZVNS+L95FoXKGEWTQBhh2QbTLD0HW54MKXS8aSitOnBeQWUVDXPd4vtGOCRH02ssurQ78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fIT7/yDV; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEtfbqhsCKptwBw+wJ757Mr/srwPIwY76TURvoxZcpGgicPJKt7z9IGbTF6cB/r+jrk3oJQSqGDBzB0uXH70Comi/FuZGmgbXKCX9lWwI9kKn1x10yw9uvkqv9NwNwogqU8pZZjomqDiawgLKZl56cMDERKIa4GSH/J4naZk7Jzdue5bj6NzXM7xDy1Vcd/AZZzI3r9Q02WBcE9I2kz9hj4VqJBZUY2uLDWE2Aa36MMV2YC5uvMfADbL7U8QN19Q7xr4l9icz1tNBTw2PMWtgg9b7gpdv8LoNM8yxC4U+4canglNgU4fdyegyE6n7f4WyC1hUxsR91wkQP2PCanwow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/8nnuTeh427udIvI2xZq93JhXE0LWgX0IcI2FkU/y0=;
 b=eGOhyOSigqhgdCtpSnmtDqqnJ1OQyky6gFQ4pFabbjR5L4AgCyXK2yDath/nlQlo/dsjEdcf36XD+n9uem3kYgemXHxcVulpIUZGFpDn/m1eejwcL39K/7f/7gTb0l+wtN4MrCPGH/Jxx5VVWrWkrv69f6iKw+06P+L7n7qK15fphbBQTNtepNrPPB3vw1mIlhXX6nLqQHONMcGz1IwmqoI6FNSiQ3q3r9AXd21JuY/hEqm57RIqEgc29Sa9fip8aQ/tWQgQXVswBhLGOmhxwnalzUXvBryHpO22a92CdDtGHECwC4PSpg5eqBetGMIw6xilyPEfzSn5I+Pe+XZfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/8nnuTeh427udIvI2xZq93JhXE0LWgX0IcI2FkU/y0=;
 b=fIT7/yDV+skhBr0A6PF+4/2T3sYfvR9t8t8+kW/1O8+1lATwA2F7+KU2+YYflkSgvJ7uuXcoBRBYIPjqAhEFzRns2A5NmO/Wh8KpI3OBctpHX/BFxM4V0du5dyEMqvuGcR1A+BaCTu5RaZNetSTOkiW7O9EH97F0Wv/a6+Vg04s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13770.jpnprd01.prod.outlook.com (2603:1096:405:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 14:51:41 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 14:51:41 +0000
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
Subject: [PATCH v8 5/5] reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
Date: Thu, 12 Mar 2026 15:50:39 +0100
Message-ID: <de4a569286a72a0319e4661643809cbed9172fe7.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: e5fad940-d1c8-4bae-387e-08de8046deca
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	stlY3ty8aHAoSOkDZ1F5tuM85dld62kfyQNM89UoY3hxidaHixuz2EkT+1KNXyN+n+Coe9CZgiW6wBmodd4tfF0DU33+iGuGxs2AJAmi8EKrkKMgLBzTHJDRrSSFgLlT4a+3UITcQVSiCpbab8ZeM6Lb9holEP2+62cV4REPfgwXg2MNGZgkn1mc40QThjFkV5y0RYlrBuoyefm6VmUwZP6I0XWH1x5Rmu4FUn4fm8rWOMUxlPOksCENEDKtnHUHRntMRfOmqhRtaiHSarErPmXru9AIcojtNVmtnjXJd+WoSjeTWtKKkqNZtOnAtO5ZSLGSMbEXH6mTF5wAIr51rEdZLkPwSxYe4fnbumQ2lZUodeoAfmenIzScRsI/hkiNjMquEoq/1FU/nWoVCCg16lCZXmw3kDqMZUE0fTKhA8DKSNwv+IsD6EGF4MmfAIvmpvNx6sGeY8UVpOPFWCi01WT0rq1gW1Xf4oJH2/PDdvMC9DFtNbsB+UH0p2Nl9eJGvTVwinXaKD+gEra5kgmrMbPOWUFpWQ1hmFHlheDkYnIpN/rkNhhNiEM4+zJCOqQmCtWPFE6DqxMYONDzaYyNrfFAVTLEW3aY8hb/SJgL2bvPHHnqybW73nveWSTNK9sWiHr6cfQN73Ia1dsdco0pPeBO6gYnvEyMrVQel0k9Gve8DBQR613KWjAEu3kkw6CmeeUtwSckqnQGkU0uq9Mz2ICUkOHv+ojDE0pZBLNzokbjnSCp3zj0ClYV2BBXiSJdmb5fcSif0m+h3GcpVM3rEMdIgbSFGQ2QaGNio1Xdys4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t1vMJvzD/DSebmA8RMM26q0KEJVydOmSNjLmnXFSmtvE7BIYn29uKAgf3lWI?=
 =?us-ascii?Q?v4bBc7EKcI/lNZ13YviAuyWO7YYWUwwiuzlxuaHME7gPu/hJ8DUIRnKEvbk1?=
 =?us-ascii?Q?iUmwWUEaR91xbvQv0H70SVgDK38EKaWemf1wJQMuapZOL5PpOR9Ji3Z8ok0O?=
 =?us-ascii?Q?pqWYAkZUjuiscKfBNphg65ZCpDpo5limoJk126SdYB+IpltPp/I8M34xmAFw?=
 =?us-ascii?Q?BCoQbqlk8jZryxBmWzsVxpcMcGVSSM+tEoSYzepsSiZ7PzQA4AY1FyYDRbBt?=
 =?us-ascii?Q?Y3zAnjDcJTbS3z64F8mWi3v6g7Fm0qLrz3A+UxUKsaHBCaoAQf1wtTcwILXd?=
 =?us-ascii?Q?Ya5R8dnlcWWAeUH33d2QTPumHorpGOqPlTcPB7n8bVJYZSN8c6S1vc385pqh?=
 =?us-ascii?Q?tt5wEIs8AsjcM0B0TzvalAKYfkQxrfk/wfHfkc3//fHmIOYiFu5kbdEME+Ut?=
 =?us-ascii?Q?wcD+kxePSuKOnxkNe0d6kJtV82bXG9L/FR7qYETlpGlZv+Qy9UpIgxzLrPwh?=
 =?us-ascii?Q?owbT4TS1nQa++aEDepZV8zAPP0zu1U4KJkiJv2xAwySkjsnqOyAscHLXqqJ3?=
 =?us-ascii?Q?LtPHUQxEaZ5wezCxag09sZYPKHhEwzf2eZB2ILvq5l1OoDMYhwAin+0ST+Ir?=
 =?us-ascii?Q?PWBZGCL6Z0uPU4JXdoyqZLFyP2PoDP/FdQWyzquYc5rCXBpEGIiX9FaiajPi?=
 =?us-ascii?Q?GhlapgoMty5zY4ztrs/xw+yO9NQXgvOBpUsiySlgevf5c+fFGemAiSNCbsMU?=
 =?us-ascii?Q?fNJ0MEiRChA6BVwS34QaBxw9bsQjAjROEh1KB55HzjG7/WuO/1clFvg5IBeb?=
 =?us-ascii?Q?v9Sy1TX9HoFwgpUl2djw8UYrRRTpBwQnpQFrcbrG2fiUKpXTA3e6TviI7JHA?=
 =?us-ascii?Q?Ez7ppGhQmPzS/bEL2aEYVKIhkRFwz5LxG7MgcPpCIndF/Vmg7Af0Pyp+fktJ?=
 =?us-ascii?Q?nohg1jyB8aGvuqVoj+aS+yN4InmgKjuDHzhwBdQS1Ner6qzEPybaC0DTzi/p?=
 =?us-ascii?Q?s/6IW7nMQ33uhHCIkfmqeqHOOfxtn7UjVc7g5lbIBslgPtobxlOcrApIZeEv?=
 =?us-ascii?Q?aQQ60egmYbMh2C9iMvLlewMv0ccQwmCaqgWPONxiB9pdqtd2fVRQkm5lxj15?=
 =?us-ascii?Q?guaWflY03HGF0ug2fPPAAfi0iqdHz6HT3BGRkGsP6MUP032RgJGrMe6feADi?=
 =?us-ascii?Q?ZNTcJV36zUhV7k/LPLSATIRukJRsp5v/9gnlkb5H4bFUEYSMtMgDcWBohNLp?=
 =?us-ascii?Q?SqEGcPsZdx9ETA7sN/FeeAXJq/px3jgMf/psr2EQwuUjZl8amKfgdDHKP1/w?=
 =?us-ascii?Q?BrCNHEb3Dv4AsxMY/j2gULrTFBsh+CLavVc26FvlPARFxcL6rEF/pkTnD1GS?=
 =?us-ascii?Q?yF/RqVh0hzl0+1+NzbE4zY54PUjIXV3DXp0RxE1sSXPVplYczXHfPAYmpN8u?=
 =?us-ascii?Q?EAl5/4YiABKEmRC5B9ALXfb1Zl7yLDm25FOCJhF/+6ZUOvu62uMhZCCLhMLz?=
 =?us-ascii?Q?ql3rUfyi8Tu+md6Gmj602AHqA2Ut2S5ATlsAj6PUKNX5my06TgJA2hbQ7CpB?=
 =?us-ascii?Q?TymSllypBqCiEh+k95xkAez/TalwBpJP7KBsMZBTDsn2l5Y7OuDECDV86Gnm?=
 =?us-ascii?Q?nE4WhpaHZmmVnk7kBrQ7UIAES0qCtl9o2a9AKANzlVB8pbJnN43E8+5hFWQj?=
 =?us-ascii?Q?pbS6ohBzFQaetCaLh2xOSYDvIbmki3Ba8Fi8SD7jccsPjiporU8Ei115VYL/?=
 =?us-ascii?Q?p/8dgX6RRgVjUb6aktBXznjeaxgYN9E2tez8TkBOzkAjhqwZucko?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fad940-d1c8-4bae-387e-08de8046deca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:51:41.0302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/GNz41wrlkGn/ZZcWC56ykV7/1/kw7QCaVVMdH+4kOlKzobLnlxdrytcy1Fwu/zsyT5xstparxtxuGzjRPC5y80D5g2HjF02s7sqWC2ZwKqcUhWIIyC5pTJtN/EKplv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13770
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29290-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 5F8B4273A74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/V2H USB2 PHY requires control of the VBUS selection line
(VBENCTL) through a mux controller described in the device tree as
"mux-controller". This change adds support for registering the
rzv2h-usb-vbenctl auxiliary driver during probe.

This enables proper management of USB2.0 VBUS source selection on
platforms using the RZ/V2H SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v7->v8:
 - No changes

v6->v7:
 - No changes

v5->v6:
 - No changes

v4->v5:
 - Update mux_name to "vbenctl" to match the driver name.
 - Updated commit message.

v3->v4:
 - No changes.

v2->v3:
 - Use __devm_auxiliary_device_create() to create the auxiliary device.

v1->v2:
 - New patch

 drivers/reset/Kconfig               |  1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 44 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5165006be693..ea696a63a304 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -257,6 +257,7 @@ config RESET_RZG2L_USBPHY_CTRL
 config RESET_RZV2H_USB2PHY
 	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select AUXILIARY_BUS
 	help
 	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
 	  (and similar SoCs).
diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index 5bdd39274612..15447a4f091f 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2025 Renesas Electronics Corporation
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -14,6 +16,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+static DEFINE_IDA(auxiliary_ids);
 
 struct rzv2h_usb2phy_regval {
 	u16 reg;
@@ -104,6 +109,41 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_ida_free(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	ida_free(&auxiliary_ids, adev->id);
+}
+
+static int rzv2h_usb2phy_reset_mux_register(struct device *dev,
+					    void __iomem *base,
+					    const char *mux_name)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev;
+	struct auxiliary_device *adev;
+	int id;
+
+	rdev = devm_kzalloc(dev, sizeof(*rdev), GFP_KERNEL);
+	if (!rdev)
+		return -ENOMEM;
+
+	rdev->base = base;
+
+	id = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	adev = __devm_auxiliary_device_create(dev, dev->driver->name,
+					      mux_name, rdev, id);
+	if (!adev) {
+		ida_free(&auxiliary_ids, id);
+		return -ENOMEM;
+	}
+
+	return devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_ida_free, adev);
+}
+
 static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
 {
 	pm_runtime_put(data);
@@ -162,6 +202,10 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "could not register reset controller\n");
 
+	error = rzv2h_usb2phy_reset_mux_register(dev, priv->base, "vbenctl");
+	if (error)
+		return dev_err_probe(dev, error, "could not register aux mux\n");
+
 	return 0;
 }
 
-- 
2.43.0


