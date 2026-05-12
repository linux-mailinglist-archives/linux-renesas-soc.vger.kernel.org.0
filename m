Return-Path: <linux-renesas-soc+bounces-32515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKolI6VyA2q55wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:34:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6447D527C87
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A274E314A34C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0833955C9;
	Tue, 12 May 2026 18:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aeoHQRlB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F102381B19;
	Tue, 12 May 2026 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610545; cv=fail; b=lamvx7/wOGUGswQcVR/ubISx0aI2DQ5YdJEMajbOUjBeXTOgTOtP+4qZ98DJAqS2bcoeyqzM+q/hO8Ki9WvklmSh6+FXgJtjSz5+uNpOeirT6Bfs3nm2RH1RjpatTBmVFf06mQ+L/M5qXdsPtKApvua/TpywvHtuVTB1rB4vPE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610545; c=relaxed/simple;
	bh=HeSLICyPrkLLKUm4oOjtOUsAiyZ3I1gJj9jtA7mz2mg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aE7MqrrxN+6c5VipuLe6/W5J6vkkU+jt+JpzRfPZVyjgvvH+gIaH+DwIeUUblRJcH6lIocGOsZ41inrXxFaWSO0rM7dV4iLZMDZ37NeTJaST7ptWNwvIQmrpLcLRGGfNa1X7O3RluwKcQG9uFfzNydMr2kNFBSISwYrWdP4CF9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aeoHQRlB; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHgfiHk3tlT51abHvJrxpCWDWc2QS7irOslmUko6IRlb88ZvBJiKUxDeNjIn4n9+Lcq9l0rQewUueMuu0y6wOF2AUgaO3fo7REqcHPecWtZ941rMzY2N8LVUjapZa3UyEVrm0KT28+zSUk2u2tJDbIqh/KPV6cBbxFlCCHfvo5eLMTUs2W3QCp83WDdkeMp+5kT1FmT9VA6FwUNUZC6n6QfSzjt8TrHy2C3SgL+5FoooBf9z1D3d9ZbjBac8/EMDBfEZzo+2RCGZMluKC2HHHErSWlvTrZ6vNlUz4F52FebgqHUndhqnwrviGSNEMMb2O3UFWhglpm6N+z5eqaoFSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbRf2tGH9t+ZgM/5il5qrwKJ7IywbSNbMFec7Rf4qxM=;
 b=WAy2FYW6++DLL9QCwY+cy8ALyoG3+Cs4TDSG+sk9ONFYCHSjmDK4jILCd/CZmo32USCxfzA2oz8pAuTPN8njjGMfZWcEf1BpGbSC4uw/lPXGLYsNuMxjGv9KULzUzniLN4c1HmIRgcdw240lqq0lp9rgx3S7/36w9Nx/p9hADUA+AQXMJBSHqqO0hfBa+S7dOUZz6tuvCXPqH9oX0Lyp9qlF5zurc/KyVdgZ5J3uUZuU6D3ekRUR7OJvEJDrqkZ6IEagBQRt1GL1BJPODvW7Z2mYayk3qnbF13drQHkilYx424laMOkX/ok9KyFBWqFhDp7i8g7j4gNE3GNiVOwFWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbRf2tGH9t+ZgM/5il5qrwKJ7IywbSNbMFec7Rf4qxM=;
 b=aeoHQRlB5ZO7vmwuR9bOocoPYyxO24bmiOx1oHLko17RmkYLI4KDbs7C3APMVgMiWbgiSzxpEK5bLsloMbrGUOaoQ5sXKkj3kUX6H1k0NP6FHqqPq+f4yCPrSJyWxOwK7zapEegb8XEYNtXpE41Y7R1n1q3LQJ7HuJwOguWFmvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB13037.jpnprd01.prod.outlook.com (2603:1096:405:1c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:29:01 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:29:01 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 12/16] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
Date: Tue, 12 May 2026 18:26:27 +0000
Message-Id: <20260512182631.3842065-13-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0192.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::17) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TYYPR01MB13037:EE_
X-MS-Office365-Filtering-Correlation-Id: e09b0dcc-a598-46dc-8be3-08deb05456a9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	MHbR0tFizBVf+1xRD0sRjuYLc5xV9EqqqkZiGQ220PXr646c02JtkOyURpzGJgGrI/7mXwOpkN929dywxWiQTAD5bbii971sD9rTeQnZyf+j9zRSNTH5Xeb3jxwtrVXeU0SkWcNtRQQN/ty4J01woHQNIevJgd10XdZjmJVhrePEGT2nv8l1AOl4SSbJwatHT0+jLadCVAU4DxMhf72TDIWl2I55nork2riT5/A8FcP59XqEozGwedB/dzmIlMM/RCBq4ZutQ9MyrFuyAXH9HkDZcq3QPtx/9cCPclsEKRXHCIKbeB044rHWdte77okNHR5fGgBr/yt/XYqCpLJ5Xf6t9ZASIeIEl2rm6MCoSY9FA8m5L71yGyAKKVMZHxeZvv7ki7EzIzJe4ocz849FVZYYOpOfpVxH46m4znFA5clK/k7gTZB8S/2E6OrmqzQOAKOAyXaT5tAwmEbkmqhAb4x+OX1yhK4xTOxJH68euyYhb013ecVdYpHvJoVgSQu3NtzjEWZPfyrb/9fVbi6VO8pIM6vbtnwc4p2su5oLcKgJF7uyAemcKN6Ncmy2Z1hg8tgAtFT6yHYtRwj3YP0BkRO3HJsaCEFdEUFU1IALMHpIia3e7JdsT1K1qDBEXs4igvURdAEc101jlRlE8Dy4YEHRmEYWfgREIrXeQxjzK4fSrxFLaJXsWU8CNx7JAKI3d8IkxD4cDqOvEleR0cXok2AyA2rpNcRVA23/WNyGQeY8NV2YopZeb48JR1J4r1Q+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gqFcLG1NYXD0bhb6yQqqoUoFqwPkH9CIIV6nm+q9Kp5VUkEG5vEL5ixEE0oo?=
 =?us-ascii?Q?u6hcaT5gFhyKlnZs0pbpgQiQFOrCDWlaT/Uqj6DEYzTWpRl217nEFXh4VtOr?=
 =?us-ascii?Q?Hf2h7AXXmB0yQPR4CBX6LIyN/3GSkjx9cxuCtBRKh6nDxbEZA2W78fYIJpkQ?=
 =?us-ascii?Q?NkY9zMzeLTDrb7gHurYoctMuJDpKKHHAAWxCxMxPNyWDv7Sr8ZogmGB25jDD?=
 =?us-ascii?Q?XZ0iDDtzckzthhG9yhei9gpvvT10RC5NvRdUnsNXuRy/ZKGxQ4Ratp1PvR0o?=
 =?us-ascii?Q?+DQZlGnCfzc9Lza0IdY7XTyXTMR7SpeJu9LuwtW7oBHGFHyh1bwhpu63ExLg?=
 =?us-ascii?Q?oAQNDuKeQ5w/WQTNhuPoxb6lP86G8RU8VfyW0d+Tj0ACrt30Kspf+5JQ6DdX?=
 =?us-ascii?Q?IVijjwRyi/HjYhXYsBWwOVPInquIUYzLTZFWw7RBtt23/1Drj7Nhp4fW+3hl?=
 =?us-ascii?Q?r6jLxYh8Y2Y3k7Iq2yoC82ix/CyyOQBijGRkGxGJEsOUo5phLx5vSMblSgHx?=
 =?us-ascii?Q?9JZdY7foutnPUczT+I8fyrZ0H59CjVdzzvds/ecEDd4aWpxy0t4QjErjUCTr?=
 =?us-ascii?Q?p1GUcmeg9Z5N1inQ9FGdIHvROKQhb0gGKC7agRwXESF8i+VV9g6NFLpe13K8?=
 =?us-ascii?Q?vS/pL5DNjbr6Nq0UHsQYJ6zXBrHep+bXH6REChZTeVnyWVcaRLlbu6MUE9Pk?=
 =?us-ascii?Q?iKbG5Ct457xl0fdVQQHll8BFzV1Re5ToSxXaEoINyLbz/B1/WFpSmHYNn9ng?=
 =?us-ascii?Q?5kedBBClfbvY4viUuWWcloU2erIbLwDEcaW4vc10RlungnAdiZepNJalfuL9?=
 =?us-ascii?Q?wNkUZQ16GthleFvaHPqTBeR3grvqMhwBDqgALVsZKuyfFdccpkyDF7CUo1Ex?=
 =?us-ascii?Q?/ZMK8ULyJBmIWObM7MaknOMyYSPH00sMkdW3oZ8eTS7LUVOObh3pgiiZVUzH?=
 =?us-ascii?Q?VL0nKDNlZmvtGmEhGwuJrilfEjLkeLgo3/Youg9w0c4bDPkozkd1vJhzgZfq?=
 =?us-ascii?Q?qWN5JuWr/N7wYYnUsPA2cJX6JgGF3v6UfyG2Cl39EPid6KzBkUuWmlomn2lR?=
 =?us-ascii?Q?uC6ah8bHbC4HNjRKBdMpsdlNomu4CxuX5+2WzEYv37tNOmSqvnaLzhJxP1eO?=
 =?us-ascii?Q?X/v0npZbxHWrOMeulaNKtS+oTaha0pPR/+jk0sLUqb1iUDrRrlMqamCz+OnA?=
 =?us-ascii?Q?GBqpYdvTth8bUSlbdbBV1dv6IbElsAOP3C2GPlgUlpioElMBWXt8BS/uUlsF?=
 =?us-ascii?Q?+K2778XX+F6pxqqzfZsi5Us1vVXU52OvRlJC7sUlyjPxqOuBkslNlEpWLzQw?=
 =?us-ascii?Q?V8b7jiT8NE+pR13ML6lbDEtRMjuj2P8RViHhKCLdd0IiCZwPVJpElTLLPesO?=
 =?us-ascii?Q?TYwo9zTbFQ3ITFIr+CD/yWvzKQHvyQK8vxv6SbpQBHkNT+WkBuMF84SZ6Or9?=
 =?us-ascii?Q?0mYBaIJyUawIgpkFBtj51h4XC3GUIKuZ2CnV7txJo24eDi6gJ7rcybDORrWG?=
 =?us-ascii?Q?vxaNeFgdttqe+Wsw2lZE6mFXGT5AFs/Z7c9bJ8Urltg7XR31U516TJ5aiF4g?=
 =?us-ascii?Q?jrAF4R93ldhWWHF+Zocpj+EBUp10jBuj+YMPhb6ND9AO/vE9WKNBSHoyxBHV?=
 =?us-ascii?Q?Nww5GmHzYHJ4E1sdP3Uhpij5+wbvpIjwDMToM4JgBwcA8xuimRMcxDroLWco?=
 =?us-ascii?Q?Jt8etrHkyt8wQEsQ1XNlFlDY9dhvTjdhPRBUP3T1Xgi9sUp4PZGRrH44M/+T?=
 =?us-ascii?Q?Ns/F0DvdA0Lu7v3DhBbcn6kC3nYjsLw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09b0dcc-a598-46dc-8be3-08deb05456a9
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:29:01.3739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xJeT9Y6e/8cvPsQtb0Xs5WQQOfGikxqilQNmFdM4fknVAQwdmqOnBxXqyMBa/USn+H4cxdWKXpV3Lzu0jVn7yTY6dxHdjDtLdkIbL+9iN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13037
X-Rspamd-Queue-Id: 6447D527C87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32515-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,glider.be,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Action: no action

RZ/G3E's ADG module requires explicit clock management for SSI audio
interfaces that differs from R-Car Gen2/Gen3/Gen4:

 - Per-SSI ADG clocks (adg-ssi-N, or adg.ssi.N in legacy bindings)
   for each SSI module
 - A shared SSIF supply clock for the SSI subsystem

These clocks are acquired using optional APIs, making them transparent
to platforms that do not require them.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6:
 - Rename the per-SSI clock lookup string in code from
   "adg.ssi.%d" to "adg-ssi-%d", matching the new DT binding. The
   clock is RZ/G3E-only and has no legacy dotted form, so the
   indexed helper from patch 04/16 is not needed here.
 - Simplify rsnd_adg_clk_control(): collapse the per-SSI ADG and
   SSIF supply prepare/unprepare path into the accumulating
   "ret |= clk_prepare(...)" style already used for the regular
   clkin loop above, restructured as a single if (enable) / else
   block.
 - Update the in-driver comment to refer to the hyphenated name.

v5: No changes

v4:
 - Move clk_prepare/unprepare for per-SSI ADG and SSIF supply
   clocks into rsnd_adg_clk_control() instead of separate
   prepare/unprepare functions, centralising clock lifecycle
   management.
 - Return proper errors on clk_enable() failure instead of
   dev_warn().
 - Eliminates hw_params prepare leak concern since prepare now
   happens once at probe/resume.

v3: No changes
v2:
 - Split clock handling into prepare/enable phases for atomic
   context safety.

 sound/soc/renesas/rcar/adg.c | 86 +++++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 813ad5eabba6..a6d34252dfea 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -19,6 +19,9 @@
 #define CLKOUT3	3
 #define CLKOUTMAX 4
 
+/* Maximum SSI count for per-SSI clocks */
+#define ADG_SSI_MAX	10
+
 #define BRGCKR_31	(1 << 31)
 #define BRRx_MASK(x) (0x3FF & x)
 
@@ -34,6 +37,9 @@ struct rsnd_adg {
 	struct clk *adg;
 	struct clk *clkin[CLKINMAX];
 	struct clk *clkout[CLKOUTMAX];
+	/* RZ/G3E: per-SSI ADG clocks (adg-ssi-0 through adg-ssi-9) */
+	struct clk *clk_adg_ssi[ADG_SSI_MAX];
+	struct clk *clk_ssif_supply;
 	struct clk *null_clk;
 	struct clk_onecell_data onecell;
 	struct rsnd_mod mod;
@@ -343,8 +349,16 @@ int rsnd_adg_clk_query(struct rsnd_priv *priv, unsigned int rate)
 
 int rsnd_adg_ssi_clk_stop(struct rsnd_mod *ssi_mod)
 {
+	struct rsnd_priv *priv = rsnd_mod_to_priv(ssi_mod);
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+	int id = rsnd_mod_id(ssi_mod);
+
 	rsnd_adg_set_ssi_clk(ssi_mod, 0);
 
+	/* RZ/G3E: only disable here, unprepare is done in hw_free */
+	clk_disable(adg->clk_adg_ssi[id]);
+	clk_disable(adg->clk_ssif_supply);
+
 	return 0;
 }
 
@@ -354,7 +368,8 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_mod *adg_mod = rsnd_mod_get(adg);
-	int data;
+	int id = rsnd_mod_id(ssi_mod);
+	int ret, data;
 	u32 ckr = 0;
 
 	data = rsnd_adg_clk_query(priv, rate);
@@ -376,6 +391,22 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 		(ckr) ?	adg->brg_rate[ADG_HZ_48] :
 			adg->brg_rate[ADG_HZ_441]);
 
+	/*
+	 * RZ/G3E: enable per-SSI and supply clocks
+	 */
+	ret = clk_enable(adg->clk_adg_ssi[id]);
+	if (ret) {
+		dev_err(dev, "Cannot enable adg-ssi-%d ADG clock\n", id);
+		return ret;
+	}
+
+	ret = clk_enable(adg->clk_ssif_supply);
+	if (ret) {
+		dev_err(dev, "Cannot enable SSIF supply clock\n");
+		clk_disable(adg->clk_adg_ssi[id]);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -417,6 +448,29 @@ int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 		}
 	}
 
+	/*
+	 * rsnd_adg_clk_enable() might return error (_disable() will not).
+	 * We need to rollback in such case
+	 */
+	/*
+	 * RZ/G3E per-SSI ADG and SSIF supply clocks.
+	 *
+	 * Follow the same style as for_each_rsnd_clkin() above: on enable,
+	 * try to prepare every clock and accumulate the error. On disable
+	 * (which is also used as the rollback path below), unprepare every
+	 * clock. Absent optional clocks are NULL, for which clk_prepare()
+	 * and clk_unprepare() are no-ops.
+	 */
+	if (enable) {
+		for (i = 0; i < ADG_SSI_MAX; i++)
+			ret |= clk_prepare(adg->clk_adg_ssi[i]);
+		ret |= clk_prepare(adg->clk_ssif_supply);
+	} else {
+		clk_unprepare(adg->clk_ssif_supply);
+		for (i = 0; i < ADG_SSI_MAX; i++)
+			clk_unprepare(adg->clk_adg_ssi[i]);
+	}
+
 	/*
 	 * rsnd_adg_clk_enable() might return error (_disable() will not).
 	 * We need to rollback in such case
@@ -769,6 +823,31 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 #define rsnd_adg_clk_dbg_info(priv, m)
 #endif
 
+static int rsnd_adg_get_ssi_clks(struct rsnd_priv *priv)
+{
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+	struct device *dev = rsnd_priv_to_dev(priv);
+	char name[16];
+	int i;
+
+	/* SSIF supply clock */
+	adg->clk_ssif_supply = devm_clk_get_optional(dev, "ssif_supply");
+	if (IS_ERR(adg->clk_ssif_supply))
+		return dev_err_probe(dev, PTR_ERR(adg->clk_ssif_supply),
+				     "failed to get ssif_supply clock\n");
+
+	/* Per-SSI ADG clocks (RZ/G3E-only; no legacy dotted form exists) */
+	for (i = 0; i < ADG_SSI_MAX; i++) {
+		snprintf(name, sizeof(name), "adg-ssi-%d", i);
+		adg->clk_adg_ssi[i] = devm_clk_get_optional(dev, name);
+		if (IS_ERR(adg->clk_adg_ssi[i]))
+			return dev_err_probe(dev, PTR_ERR(adg->clk_adg_ssi[i]),
+					     "failed to get %s clock\n", name);
+	}
+
+	return 0;
+}
+
 int rsnd_adg_probe(struct rsnd_priv *priv)
 {
 	struct reset_control *rstc;
@@ -798,6 +877,11 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	if (ret)
 		return ret;
 
+	/* RZ/G3E-specific: per-SSI ADG and SSIF supply clocks */
+	ret = rsnd_adg_get_ssi_clks(priv);
+	if (ret)
+		return ret;
+
 	ret = rsnd_adg_clk_enable(priv);
 	if (ret)
 		return ret;
-- 
2.25.1


