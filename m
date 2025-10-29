Return-Path: <linux-renesas-soc+bounces-23823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65834C17996
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 01:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69FF01C6031D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 00:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DAC2D238F;
	Wed, 29 Oct 2025 00:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="l9gGrBiZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6BA2D238C;
	Wed, 29 Oct 2025 00:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761698616; cv=fail; b=lORi1J6plIz4rUd4GNmnl6SgZF7kC3Pqd43fGtLTbRPzm0Vxa1rQYnhrHMdilPEO79Xrotqqcry1g5mwWxtIGVV9lsZIpsi1rJBlWV4COX/+GCqN5B/6TF8VE44qXtDbLzFcwIBnryGtHmeFCXS/z5RkdkI+YPL1LrnPyPTu9CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761698616; c=relaxed/simple;
	bh=wXRj2ILSOM89xk+LlFufqtDnOgdUP7RyfRZTnFj4xCs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Y0HAYv22UcPUCfKPu14g8UnRGjJt4sXO9Cqq5QRjThY8ocYfc3Fka0QDbaLK/2Tts0uz7R5wlINLhRbRra4iq35hfXdWmtPYd1qZ5rVi4DWFbLlenFtiHHwUZvSx6lV5YntVzAnWg+aiUPUUEWdUtAaIacTQKoQGtVYW6Qt4D9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=l9gGrBiZ; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDnP/0eO/c0F5aafAPNL/E/gLcJOr7sQ54AOSKHcVW2+zgL3lZ5QssxJTJw8RIRNP12t1yDdNyESn36sH3OZWOuKs/IxG4KviTBQFoNEgnVGQw+rAb5/InWt4/Va7+iSi9pukz1/sk2o6pF5L1R6WQAs+3DZ66SYbfHNBuh2rVPRE5vs2jEIq19cH6nubp61HNBkgZ0p8LcXnotnGRfqxq+JMHeD0Xx/dm6s/k7p8m0wKwWIVUQIGCIj58dPhxrAZGAl7Pg8fyyv9LR7Bb4/6l1xpJ/45pi8vk3f82ceD2KYzqkgX87KAoc3/37aMujnv77zXYbuX9cQ1dRbjmfeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1DOh4t+M373lR3z+2agCWEBzNydD1Dpxhhr00id864=;
 b=eFny0+fPsJOm+kY+fYWahXT/kuoTzPnU0MvJ1nBOkz2DyvqhZ0C3wkB1c3o/JDkaj937JgmkRRllMsU2C5KXpX5+lrg2PpfKQRDoIUVhLHfvnMsPs+oVIb0HTu/jort+QndvBnKkkbCIGZmtNntzX6oDsozYbmrxi9I9x0pHcdxAMuzq5107j5Ui6yYCYHSd0BvZtqLzSfoRQF+sfWHtwUxjRUXTWiITUCMZo8X8tVtLe7aPhNmD/ZB5TCT/s4O6H+RN4cpntFsGvjBdH84ToafAe/Zj7DRncjZEdkn9WiLuppdfZl8JNVPcNbnNTra9Xwwz4qTnkPhSxkP9VuVv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1DOh4t+M373lR3z+2agCWEBzNydD1Dpxhhr00id864=;
 b=l9gGrBiZP3FEgzBjMxNKIfMUUGNFy1GgUb19ZBIC3nk/oPskyYq43CWop8Nh8s3RQLxsqwD5CiECV7hhQMPcTrw0dtCJhLpvMOj/NBzOEP9BaQTt3kS4Hw0a5SsM2FYm7SKaZRtN34MzufOpbpHL3RwXC8WOwxF5XYnAnD1KuHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11416.jpnprd01.prod.outlook.com
 (2603:1096:400:379::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 00:43:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 00:43:27 +0000
Message-ID: <87a51av8pd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mailbox: remove unneeded double quotation
In-Reply-To: <aQCjxdl0PkTtEsmZ@shikoro>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
	<87ms5bsl2a.wl-kuninori.morimoto.gx@renesas.com>
	<aQCjxdl0PkTtEsmZ@shikoro>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 29 Oct 2025 00:43:26 +0000
X-ClientProxiedBy: TYCP286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11416:EE_
X-MS-Office365-Filtering-Correlation-Id: afc04005-7f97-483b-88a4-08de16842ccb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RNlHJfdsUBpNR0jutpwShZydlWdNvaz2RcT9Rvme0rJZFngo2JCOTrBiJjFm?=
 =?us-ascii?Q?ygxtlCCf42SteVKMEPkQhaKorDVTDJwulHyeCnUR0YwwnDMD0LR0Se8h0v3m?=
 =?us-ascii?Q?l4wGkc1AN5mTOMKRqUXdlP7n9gfE/RAUpUbt3wobtjMtVqS6a0MQUCaNQ5f7?=
 =?us-ascii?Q?54+2aAIArb/HVXCYJDPDRlK4j6Ucg0emzQbvqdQgxOmgu/j9JmPqR7qW+q+X?=
 =?us-ascii?Q?J3dG2J1pTN5En0vwG9VF1AilOpbIpSp88p+ScM/eH0kBDv9TyEVatEzi1v3m?=
 =?us-ascii?Q?/hRfmq2b5RsJzt6BgCcVyfkaL40xd56z8eLSc54iodQNnhnUN3/U14iaCFIV?=
 =?us-ascii?Q?OVpSu1ABGNB3wSKfrfy/vQyGNws0qIlDUgOVVi/HM7mEdOK5J6JcGxrYfwfP?=
 =?us-ascii?Q?2MdlzeXPKlEKCR8nukoQVlGdvez22PcOGmktJaDH6cr5U0BgNULyMVmaEmkX?=
 =?us-ascii?Q?2eIDmL1LVDysRlDiLb69hnXKoEVOOArOyBo+t5zFbYuOTVgdHrhI3Q29z4RA?=
 =?us-ascii?Q?99sdf2No9lS0MXJZtJosGOHSHsFNZlyVq7P0f/7lx/J8vjC8PMFcs0s955I1?=
 =?us-ascii?Q?LRFX5lDxS2fjg3hkUQFh1HEzCRRqgSgTUGTKAcz0Fdd+e5UFty96PjLuQ8RL?=
 =?us-ascii?Q?4cJ9sE6m2DXNYsEjn0r3WvT5yYmIPh3IUtzlnz3/AZlujvOp5DTppZkfQVqF?=
 =?us-ascii?Q?QnS4Q9kuOB72sNim962OcAMcUGJWdFnNwowE0rAM0ErOoDolK96zOnJGPWK9?=
 =?us-ascii?Q?iezKFBOYMYrY+hrv9MyTISruImvIwPrxjFZm4S/Ga+6pTi3PA2jXckzNwk8/?=
 =?us-ascii?Q?4Ur3O2OoadpD17LZReTMhBNzS2myCv/6CmByVQJuR8rxs2s4m9RnDTsF4JPm?=
 =?us-ascii?Q?DnfBPp4hpEmUHLelS6SlWZYZURWU9Eu9a6N+vQU0KTOam139whevYBw4C+mA?=
 =?us-ascii?Q?a8mXSdA8KkO6UraFXTa9wjTCKcF+N2G4jdYX8HlWQdgrsN94wpYTiIDpZiOZ?=
 =?us-ascii?Q?uOSjV1UNwTZDymZLz9TjOBEFzwMNE88tixe/haTj/Pm5aRWT/YkGe90YLhPs?=
 =?us-ascii?Q?pUPMt1xexYhFe7zZcsYCj5gXEVmti3bGA7hiOQ2loDTCybRDTHBRRxZRDW5m?=
 =?us-ascii?Q?1ZYO5Osdq/h001ydZ0SKHB3/EbELrntAKHNDxo5Mothol6j2GOPt+xNho065?=
 =?us-ascii?Q?fO/YK/LyF3fTDih/d2SsMJTmIEbzz0f7FM+I1LSu+wu+cUXZ7pFsRqqxBCX7?=
 =?us-ascii?Q?2bj9yMAEtXhx+EBCXQNU4YpCIGKQLHwG3KKo048ISc2GNrkqDt0aKTk4u/j7?=
 =?us-ascii?Q?e4raWoR95+xIuV/Z6CJ0pV6iOwX6p/Vj3X5EPnmtJAFwYk/zH9ziXaOe5X70?=
 =?us-ascii?Q?VAKz6yO0JHDJyn80V4Ky7DCW5ED01kWWiUaamUIld5NHo2VYXQqCdfEEdLAW?=
 =?us-ascii?Q?kcLxzGkiD3hFSYMnuvYV09xDs+VQxuP/1qjIkI72bCXMrMtpjpqgpdVHKfsm?=
 =?us-ascii?Q?eL82ficifrTiVSnMFSPPxv9mA7SMFzMtJnEV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HsepVpvTcla2A4xVcC2BLkPhP7UhGw8l6nrO6t7nS7n3LnaE0F+dLeA3CnRm?=
 =?us-ascii?Q?B96yTgVAtfsXD+rkndepKuLzbMrSRO5DaZUBRD8XIN4fs4izrdSjkydBCSNE?=
 =?us-ascii?Q?q2UjH6nWgJPkxTEB025Seeerrjharuuhr/sjIFeU375tea7Jbvoj+bNnXm+K?=
 =?us-ascii?Q?F4lbal7MBRXGKstg772xHYa6VXtAhiOLTzbnzeXWsPNxezMQdk5B62KOLKQ6?=
 =?us-ascii?Q?mzSzpEgOUB/f4LV02Aual/6eXrO75PwYXZ6ckzXq+UybS4nvEUYuWj7wB2y9?=
 =?us-ascii?Q?FLAETolJaTLMqKjbc5n/3ghgKwdjGHTVyMyyjr4TkWgIgjPZHmPVfTeYyUzR?=
 =?us-ascii?Q?WCbXHBfT8avtsN7TH3WQC9MN2lr1S9GsH/jStDSwAyVC+orEpEle2Zlr0mUI?=
 =?us-ascii?Q?H46qyKKyv9DBFAf0qk2KBWRr1G7H6u+aMXBVbsGsarTBQ/tMDXfOpcHnSCq5?=
 =?us-ascii?Q?kj14S0wy0hIUTVF1x/mettyCif6By3KCloe4EiIcqufOXGEZT97ypc2546GY?=
 =?us-ascii?Q?PAUtBKrNUSpvLgDyiZJTi8oBP8doJGsqa42FPfi8fhJdEs5Ro3B/nLJHFH+i?=
 =?us-ascii?Q?y6+1BLDJuUkjVgOkWld99wVcodIYY7OY8g2Cwg86SMJpA4rM9k0OZoZPZgkP?=
 =?us-ascii?Q?/7ceihpIW102mkF9eozsVyQLNdXiowRxZNxk8X/+o16ZQ2CpFoNuntcuUXpl?=
 =?us-ascii?Q?oUfMgvBqa/MNsOgbi/0EM1pFlFXvEdXeRoBAg+6LiGWOVD4+/2U8WoZGLDNS?=
 =?us-ascii?Q?vyzi7wph19SaXK+XjLqMy9EgaEbZiHrkIeKi+v+WToT9Y953ENq0Mt6VvDOT?=
 =?us-ascii?Q?oKGBLyPL15HKrwyRy7c1PKccoeEzn/CM9wv8njG4yo+m4T44FOkRbdY0b9Ry?=
 =?us-ascii?Q?fXi+Ub1Ixlln2UtkX8eeb/s4xigRoaI6FKaS0oqyvkKJcpCISmLt5Mf6HVNh?=
 =?us-ascii?Q?1pEjQ2GX7dAk19/Ou03Pzg2lTqhr7c+sCo0536Lj3begQtr2pkfgpgYXemVb?=
 =?us-ascii?Q?0F3t8BHQdJeYlU3Z/2uHMP1wpPZDXKJmiPs/29J4fxj6iC84OYEHKyW6njO/?=
 =?us-ascii?Q?QMrcXqsvi5iWDeaO1M7oJzCZbjdQf7ab6lhdVmBuZG5B0x3+3oiWCi7EdlNl?=
 =?us-ascii?Q?Nq3DNe8unt8Bdr5iudJcdAqK1NXQhKuwG/nC/0xUMKPlDTT3vy0O6bwG/S1A?=
 =?us-ascii?Q?i5pM7NNQrPfd8iJAQuIIqDncTsNvAzd61DEyoq2jVL7T9ZOVAfQvwpynnf0V?=
 =?us-ascii?Q?SjIMU45ceU+dbqut1NBpquRI822zzPkpqVkX/oP9PFofLKdq4ch8CCLOVn/0?=
 =?us-ascii?Q?NRJysRna3JQsSfn6QbF6S2DHRKFMF69SN+FopbruXFA8yR6VJs+zbDBXT/tK?=
 =?us-ascii?Q?vBdetORcq5rzJxQZz8MHicoDOoBi7Fbp33KCIjV0tWuDxJNrjZJgzW+hk6tl?=
 =?us-ascii?Q?VO8AGjmpTN2HvW7MQCr9SGqFFhD0AwHF0q9vYxb9hxdHNjarffTB//ZA26pr?=
 =?us-ascii?Q?FXVzPbYcEySncFy7G2pl6EpEw458h2eO7Y/k59REDEvlLT/6vHGmIYhs128w?=
 =?us-ascii?Q?hLXElHrhU1nK2jBF/JB9/0gOXvvqkdgGd1wSJHHvf35mceRcKbumqox7+nTA?=
 =?us-ascii?Q?kMfEaNmLJL5CWRBdnpLBx/g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc04005-7f97-483b-88a4-08de16842ccb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 00:43:27.8162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GURdG9PQAL/htcBs7YKBh4r2my9Agwmpoqcj0zISPdE6lXDohx0NhO5mv6k9AsuIZnorxtops9UWZzpElgIsmLrmxfSOrOxJOLiuqm/13L8Z61DhpS0YfcqofYjlJY/D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11416


Hi Wolfram

> > It makes Kconfig strange. fix it.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> But should be a seperate patch IMHO. It can be handled independently of
> the MFIS driver.

Yes.
I will separate, and post this patch only.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

