Return-Path: <linux-renesas-soc+bounces-33782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zZb7FNmFKGr2FgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 23:30:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B19664405
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 23:30:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=og6AXUNF;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48A173010BC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 21:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E86B3DCD98;
	Tue,  9 Jun 2026 21:29:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791F9368D69;
	Tue,  9 Jun 2026 21:29:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781040599; cv=fail; b=XzS/Von3AePP4LsAva2w/psJ/xX0yUlNzP0woV9Vfrr/MYDrlB9gjEdCKnH85XHuSSio/nnjKZ0XbGt9JCji2jYt+cCF11+sgWweNJZtL45Xu78eoia2YjztmTOFoV+rAlCidlPLHEuVPv2ymP+GO78jbwl6S9OHEuwoxUk8Epw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781040599; c=relaxed/simple;
	bh=eiL5dQ8/PiXv5jCR0y6vMljEduveLeSnyaobXFnyc5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jQ0fmDRJwTQN9TbGeUYQau3riL85t7mY5gLF6BBjmgQqkQ2LL9b2zFpXnn8Bfxi31PpyUzjbNrpqJqQ4RGsrCRNKC9LE9DrtauASKOIENeh1sqzqJRkgPWydfM886PCC9pCS5tMZiXRSOnr/cmQvhxDQEpZudwLxr4FRhJ+7dEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=og6AXUNF; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ys/3rB6UhnuQeQbiphBMijahWAlTejpvQXXSuS5bhwGDTI09DNFGjZXcOOfDeT/TtcRBYSqFTeMh7aauS9+juVKHtOCXU3XFQU9Rj1E5SBARlRLopqz1684sEZU5v099cjF9n3kFFaSP5SNpP69gSWt7QzdJJrpH5QEGSTqaVtKcVmZfzl7lu5R1ZzGb46wNEG9kB7t88nr83fkiHP7BBJfrs/5S3AR/ieygA1+R20ShqNxYBIg6eU/etp1DabUe/f1bJI9704ntyVWX7Hf90CCvw+2e763EECS+q8uIZgKzpO3ARK+4zgceQ+FO9TvXtYDAXipeOfjavpceGKROFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4aRbrGv118VCDvrLSTc0A9G8uiE/f7q4g7QwdUxUS4=;
 b=HX905IpL1qNuCldvsP3GpR2dgS9CMPc4jIe0GiPPWyEiobcKbvbGV8T6A5K9mWIvSH1MWh68C2p+73laNQQ0+GaNjOO5XtKQ0oqzPH0Nu4CXiZCCtQphrlz42v2bTAQGxML230IfDjasAthaxz7AjvFnZXC98RT5A07bwy24+3D1aqL+2+1TEITB/ITzH49nnFIdky/Jimf9bVQ+kZBZwtUS2baiI5Jbxkrmo2Nnld78BTQ4Pdz8voLjF2vTjD+HEJhULj0WHlVm4P+dmPYpLn6/7+zrbacyDdlUHwK7Ajzk2xiMTnUaHI1kMzQLQM8fOjSyN3GYtM5t8Gd8D9pWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4aRbrGv118VCDvrLSTc0A9G8uiE/f7q4g7QwdUxUS4=;
 b=og6AXUNFRitj3VICGhnkY76JChSASonCCnJWN2IXYBzkBMAYpTBPR+nDoBgs6CguzJbUdM9gwSq3SEobwKQllERvZ4kEK5/UNNWl6xCEJK6mvUhZSNb3EmjXF4UFXbYlXFxIjpYHojQh08x10IwmLABGFOWCbK3D1wDwA17XkkU=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSCPR01MB14807.jpnprd01.prod.outlook.com (2603:1096:604:3ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 21:29:55 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 21:29:54 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	john.madieu@gmail.com,
	biju.das.jz@bp.renesas.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v3] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix dma-names and ports schema
Date: Tue,  9 Jun 2026 21:29:21 +0000
Message-Id: <20260609212921.1706886-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::19) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OSCPR01MB14807:EE_
X-MS-Office365-Filtering-Correlation-Id: b531920a-5909-4b53-9152-08dec66e3f5a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|56012099006|3023799007|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	+TNsmvqJpbXDGG68wKgKW2Y9ljxuREnZwTAVax4xEYXMFrNxV+1RO20w7FKqiysGD4uCAKMZ1JAr3X7UKtPqeUnwONu+ZzD/vi52RKGLMaHRr2tRHVQpSHhxKvW8JFheAX2n3jsnnjh8Z/9munSLEIzhBZpsCY4hGDFYc+zPsIsITdATBBpXqfzrfYpwAcQcaqbi9BqBhzfY0w/L7ODnG8Ep4vkNmWTSzTdGUUSdOAmo8wdaT3P4qkM2qadM401S9IU+1ofMSF8Vlilps5nJOG3lidfm3Ot+tuqmDCVpCsA1s1lijzOK1pwj50dj0GOwn6UqWsyGSmREbH5o1aj8vZZuo4BXWaPbyCFyFoZtsnCtiyBECkI20yrhpsTIEpsbrBihpHxyehr4CH2Wswb9+XZ8aK6kuDQzpjIy6U/wRzMGAZIgQBfWqpAY6InB0QL7d0ZYO/hxR4ZAu9aFo7yf+o7SrLIgZQlB+oWxmv9I1x7q3iivU61foZfYmdGVk7/SD2xOQaBugQu+2JPEkqKP7FkvCcvcb5TM/I7PrXnYoFM0Bs1m/KQxcLNco/gMF8HKm52efNIBkQ+RUWIvE2E0I9lfMZZJ4vjnFVdbyR5Cdo9y9pFvKtd9UXCSHiWnP8aKbQUo1NeZQ3+yk4NXjRoMk9cUV8fScPlZ5g9x189WEAXFdnFx90kHBsDmddp7K/E9p/OEV5w4j4vnPz/KQrbAj9THlhsDnA5AQiecAJKR53/B/nkAfPPpxk3Fo+5vZ5b2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(56012099006)(3023799007)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?itEecmRlRMvZT4IVxNdYRNTYqAR+Hnke2pNRDXbGSZGIUXLa+i6f0+n5RIq8?=
 =?us-ascii?Q?WcjjIYV3xiKO2msZMNqhrL16wapR/OzMOcp3CCmrr9Fr6+3HPhuFUKUvTROs?=
 =?us-ascii?Q?ddMNkgekSDmHoU+vJRaTzO16Ua5Z7dHn6ElsqzfPho2S1H8RbHENb9X6W37l?=
 =?us-ascii?Q?wUWD2iKtV/K9mmfDfzerJGIkqdBHtW9a3bP7NbSOeQz5g5/SlHtU3jRql6y+?=
 =?us-ascii?Q?Eh3xQ5eY6+EY9RpSMrHTOa7ZvD3kuunBbi8lnO6QEaGDa2unWkp4Pixz6pV5?=
 =?us-ascii?Q?Om9pLCw90LP9yPnSMYVJWNqCfoqhjLcbqng0i0x7mVWD0EwyDLAeVaVupW0B?=
 =?us-ascii?Q?RggO8Rk2E4TQKc3gDnFF92fRoGdCiL//6lWzo7FqSa0Z1Kn23aUztTghKX6W?=
 =?us-ascii?Q?H7+5n6em3v2VYrAjGwV0rSYWeQruQIGg+BqJLeGYw6B/TtU5nbzOYMr8dwrU?=
 =?us-ascii?Q?04iamQUMRi9dSHBWaSPDsWnB0mxxjYfn83B4PU2+cXWBYFQcERjlWW3t9V4L?=
 =?us-ascii?Q?1DSXsr2zH0ynFHmTyMxF0Tm1yUk3tVodQ+tC5C+lRr9e0pTgLFvXy+xto2/e?=
 =?us-ascii?Q?ih3ezaG9urL9cqyapMai5gR/wIhXpWPjmsxnXKFJx11nhtWxs1zsH6T1aF22?=
 =?us-ascii?Q?3ZH7TyLU5wXoasHcOF2b78gn+gMP7lHc+Kk+q2shPRicZEri0yCdlzXqPS5Z?=
 =?us-ascii?Q?s3tXJn3K5iMg+YpsMcnCWdiB79EZMdFXT9Tv0/Pglk9mAtXKAZgY1mLW2wNK?=
 =?us-ascii?Q?aFnMr4mSAtUBKfngWUysL9APngpYoJ/LDdn1A+1kAotzfBpk0/sPhuWAtWXg?=
 =?us-ascii?Q?j+l1E6JfMp+XcJCNkK/laz+t38SLrNYAMh8wxaSzIjqw0O9I5CUcFqshWQrf?=
 =?us-ascii?Q?UO9nYeULtVOkECCJR030cp5D5a8Co1uv8yGLRvF70xjl219xJrJuvUId+SKX?=
 =?us-ascii?Q?bsPGDhiXwAmseoP5vvvfXW6DD31wOvwindx4Sbz8QY/eSSZsC2zvtBdLXCzy?=
 =?us-ascii?Q?OqZL7ysls+RDaEGtsUQ0GmME3fmGX8QBSKqdiW3jPKMyHPT9dCUzxuiW3dU+?=
 =?us-ascii?Q?gnUEnwJYhaeESzfO9OVJ+DFBnwIZl0cyiNG+4VXT2RqDFySloApKfuWI6mn3?=
 =?us-ascii?Q?GepM5yQOrHPqZdtu+rcaGn0GCiNFthml/66itz/xmjHvKcLkdeXHSQAaMzkl?=
 =?us-ascii?Q?hcgg8w6ElqAc7sIIa83nYg4Dbm5MC6IybGaCFljgf5Wg2Q8VtDhoxP2Zrg5D?=
 =?us-ascii?Q?+PD2OMY3mExj2R5B/XlUnHeR5KYWV0yuwv4U1Vz7X0fthVMlB6iI/HFgZTUG?=
 =?us-ascii?Q?MX6e4dcd39wW7WKQLcux33HMkyLCZAQ/WW/Sob+l/OSkJzCcDOJxkLRVsWdW?=
 =?us-ascii?Q?IlJ/kig28voDkR+h5+K8E5ZEprGqQ+C4syBcKdXzZjhnHxNRMagPuOiJ2rBo?=
 =?us-ascii?Q?d0U4cQfpdYImSVAj5uA5dv8Vd2mZFukUmcSA66Ypz7yhe3d0Qqp6WhCJXEJw?=
 =?us-ascii?Q?K80qaTXD0nBU9U0FlT9lOSb/1uC5UW/WujeY4/IiBrnFmUUXBZbapXj8Z/16?=
 =?us-ascii?Q?Yr4R+EFhrfUQfDIMRoVXhKkveUulfNsggsfi3ISqC/0NpcvgtSezxm0cGbLV?=
 =?us-ascii?Q?EJcvyuNsSuDrta3BTO+8/Y/eaHS/tQ/yKt/qErjMcC/yqn34q32A9gVEs+t4?=
 =?us-ascii?Q?G94j/kyGM0e29jDeOOr5s8yv1sF7ZVWbUF7St4RMuBVEWmlirfClJgws/yVN?=
 =?us-ascii?Q?ebO/Az4LY7IUNI2xq4rGFgHuR1QrFm8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b531920a-5909-4b53-9152-08dec66e3f5a
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 21:29:54.6365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbtKtcvNu/sNnzAdBUAhnUo0jgCqmMH8XUfmKNvb1fpoMGrSLP4Xn2+c5LiqCbayjau3NNnVVE68/TIDOStGQgEJEsKXvpaCar0tGOeK/sY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14807
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33782-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kuninori.morimoto.gx@renesas.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:john.madieu.xa@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,glider.be];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[renesas.com,vger.kernel.org,gmail.com,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0B19664405

Replace the allOf-wrapped enum in the dvc/src/ssiu dma-names with a plain
scalar items schema bounded by minItems/maxItems and point the ports
container at graph.yaml's ports definition instead of port-base (a ports
container is not itself a port).

While at it, drop the unused top-level #address-cells/#size-cells since no
child node uses a unit address and the ports node provides its own, require
interrupts/dmas/dma-names on the src sub-nodes to match the ssi/ssiu
sub-nodes and the driver, and pin clocks and resets to their fixed counts
(47 and 14) to match the clock-names/reset-names lists. In the example, put
compatible and reg first, include renesas,r9a09g047-cpg.h, and restore the
CPG_MOD cell on the clock specifiers.

Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3:
 - playback/capture: drop the per-entry 'items: maxItems: 1' and keep a
   bare phandle-array. The phandles point at the ssi-N/src-N/dvc-N
   sub-nodes, which have no #*-cells and so are not split per entry, so the
   constraint tripped dt_binding_check ("playback:0: [3, 4, 5] is too long",
   "capture:0: [6, 7, 8] is too long"). renesas,rsnd.yaml carries no such
   constraint either; the shared rsnd/r9a09g047 sub-node schema that defines
   it once for both bindings will follow as a separate series

v2:
 - dma-names: drop the per-position items list in favour of a scalar items
   schema with minItems/maxItems. The list form forced exactly N entries,
   and a scalar items schema needs both bounds to satisfy string-array.yaml
   (Rob Herring, sashiko-bot).
 - Example: restore the CPG_MOD cell on the clock specifiers and add the
   renesas,r9a09g047-cpg.h include (Geert Uytterhoeven).

v1:
 - https://lore.kernel.org/r/20260603202805.3530046-1-john.madieu.xa@bp.renesas.com

 .../sound/renesas,r9a09g047-sound.yaml        | 94 +++++++++----------
 1 file changed, 44 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
index d7fa16554698..b539e84ead8d 100644
--- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
@@ -42,12 +42,6 @@ properties:
   "#clock-cells":
     const: 0
 
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 0
-
   clocks:
     maxItems: 47
 
@@ -143,11 +137,10 @@ properties:
               through the list to find a free channel.
 
           dma-names:
+            minItems: 1
             maxItems: 5
-            allOf:
-              - items:
-                  enum:
-                    - tx
+            items:
+              const: tx
 
         required:
           - dmas
@@ -203,12 +196,15 @@ properties:
               falls through the list to find a free channel.
 
           dma-names:
+            minItems: 1
             maxItems: 10
-            allOf:
-              - items:
-                  enum:
-                    - tx
-                    - rx
+            items:
+              enum: [ tx, rx ]
+
+        required:
+          - interrupts
+          - dmas
+          - dma-names
 
   ssiu:
     type: object
@@ -229,12 +225,10 @@ properties:
               falls through the list to find a free channel.
 
           dma-names:
+            minItems: 1
             maxItems: 10
-            allOf:
-              - items:
-                  enum:
-                    - tx
-                    - rx
+            items:
+              enum: [ tx, rx ]
 
         required:
           - dmas
@@ -261,10 +255,9 @@ properties:
           - interrupts
 
   ports:
-    $ref: audio-graph-port.yaml#/definitions/port-base
-    unevaluatedProperties: false
+    $ref: /schemas/graph.yaml#/properties/ports
     patternProperties:
-      '^port@[0-9a-f]+$':
+      '^port(@[0-9a-f]+)?$':
         $ref: audio-graph-port.yaml#/definitions/port-base
         unevaluatedProperties: false
         properties:
@@ -308,11 +301,10 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     sound@13c00000 {
-      #sound-dai-cells = <1>;
-      #clock-cells = <0>;
       compatible = "renesas,r9a09g047-sound";
       reg = <0x13c00000 0x10000>,
             <0x13c20000 0x10000>,
@@ -320,31 +312,33 @@ examples:
             <0x13c31000 0x1f000>,
             <0x13c50000 0x10000>;
       reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
-      clocks = <&cpg 245>,
-               <&cpg 385>, <&cpg 386>,
-               <&cpg 387>, <&cpg 388>,
-               <&cpg 389>, <&cpg 390>,
-               <&cpg 391>, <&cpg 392>,
-               <&cpg 393>, <&cpg 394>,
-               <&cpg 372>, <&cpg 373>,
-               <&cpg 374>, <&cpg 375>,
-               <&cpg 376>, <&cpg 377>,
-               <&cpg 378>, <&cpg 379>,
-               <&cpg 380>, <&cpg 381>,
-               <&cpg 370>, <&cpg 371>,
-               <&cpg 370>, <&cpg 371>,
-               <&cpg 368>, <&cpg 369>,
-               <&cpg 251>, <&cpg 252>,
-               <&cpg 253>, <&cpg 250>,
-               <&cpg 384>,
-               <&cpg 246>, <&cpg 247>,
-               <&cpg 382>,
-               <&cpg 352>, <&cpg 353>,
-               <&cpg 354>, <&cpg 355>,
-               <&cpg 356>, <&cpg 357>,
-               <&cpg 358>, <&cpg 359>,
-               <&cpg 360>, <&cpg 361>,
-               <&cpg 248>, <&cpg 249>;
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
+      clocks = <&cpg CPG_MOD 245>,
+               <&cpg CPG_MOD 385>, <&cpg CPG_MOD 386>,
+               <&cpg CPG_MOD 387>, <&cpg CPG_MOD 388>,
+               <&cpg CPG_MOD 389>, <&cpg CPG_MOD 390>,
+               <&cpg CPG_MOD 391>, <&cpg CPG_MOD 392>,
+               <&cpg CPG_MOD 393>, <&cpg CPG_MOD 394>,
+               <&cpg CPG_MOD 372>, <&cpg CPG_MOD 373>,
+               <&cpg CPG_MOD 374>, <&cpg CPG_MOD 375>,
+               <&cpg CPG_MOD 376>, <&cpg CPG_MOD 377>,
+               <&cpg CPG_MOD 378>, <&cpg CPG_MOD 379>,
+               <&cpg CPG_MOD 380>, <&cpg CPG_MOD 381>,
+               <&cpg CPG_MOD 370>, <&cpg CPG_MOD 371>,
+               <&cpg CPG_MOD 370>, <&cpg CPG_MOD 371>,
+               <&cpg CPG_MOD 368>, <&cpg CPG_MOD 369>,
+               <&cpg CPG_MOD 251>, <&cpg CPG_MOD 252>,
+               <&cpg CPG_MOD 253>, <&cpg CPG_MOD 250>,
+               <&cpg CPG_MOD 384>,
+               <&cpg CPG_MOD 246>, <&cpg CPG_MOD 247>,
+               <&cpg CPG_MOD 382>,
+               <&cpg CPG_MOD 352>, <&cpg CPG_MOD 353>,
+               <&cpg CPG_MOD 354>, <&cpg CPG_MOD 355>,
+               <&cpg CPG_MOD 356>, <&cpg CPG_MOD 357>,
+               <&cpg CPG_MOD 358>, <&cpg CPG_MOD 359>,
+               <&cpg CPG_MOD 360>, <&cpg CPG_MOD 361>,
+               <&cpg CPG_MOD 248>, <&cpg CPG_MOD 249>;
       clock-names = "ssi-all",
                     "ssi-0", "ssi-1",
                     "ssi-2", "ssi-3",
-- 
2.25.1


