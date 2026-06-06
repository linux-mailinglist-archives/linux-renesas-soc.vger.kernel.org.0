Return-Path: <linux-renesas-soc+bounces-33639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1pcDN66WI2oOvwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 06 Jun 2026 05:40:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC6664C4B3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 06 Jun 2026 05:40:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=bxf8kweD;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BC7E30128C7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Jun 2026 03:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D1327EC7C;
	Sat,  6 Jun 2026 03:40:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9752777FC;
	Sat,  6 Jun 2026 03:40:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780717227; cv=fail; b=SWuUWchROlLmbG7zTZC35HsyPVwK+YV1falMGWwUdA6DKAvlMfSqnXSpiho9Cc8KWOAMTmAjD0ZLLqfERyrU8Ec/UsECjgQwdqfdV0BYYNMysZzXUCYCbJwEjS3oQswgmD38RLHhGwPpGd4CAAKHHt7xec9DkUDJXnMlnzSewFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780717227; c=relaxed/simple;
	bh=D4VsYt5MtZfhdW6lPzcTmNxioQlObT9XX2o5Or/4M6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SiSzp1+WFsT0U1cGlqs4vDjwtkUJ38mThyaCWIzfbRFHjnaj4z4TL7+IEPO6xeFsrFZUoh+MrBSgp0rBkmr6c/1OI2IwVcxJuW9FO3oax83GJxOsbyxdykej50WMRMYNXSrDx+LYsxASLko0Nq6vudmg/aoW3Jiw+JBcuOtpo5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bxf8kweD; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tM86KqPeaOfto53srJ/HpjGhqq+tV0xJTPXx7U0/LwtvUI+uzaMg+bP5XDsLC/nGw6UXd2k8KdBxP+mjP2C78Fe9tGQCC1QbJrD6+GUhJ4TbPkZ/ji3+bVGGI0cOlQEB9LPPqFhEUqoMOk/QgPmkGzJf87nxLsSW4piFjrVuK/y7Q7M/sknLKD1W+sssgTEgpRv/eRvgQzB4LS35DwNr/T/VYKnnYimKSaUunsL0Q+xaa3ygiuHeqE09b/li5hYTFRXfFsJwwZlxH1+3vs0I2UFVEXRwP7ODPx4hNgztQLo0Gf+b+hNqTmJLBBHa3W60izDtQ8RlVBdrkv/AJbkxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+ZF4/cjv9brM77l1xkezRH02pa+QC+OuiIb76gRAeM=;
 b=srv8R8Ui7iJyYdm7qYHxrORa9pYfmTlmxz76cKJkzMSFFAuZpw86xebx6ik2FEitXBxbTZCJlG5b8cHifCamGHW09dnhZrs5rG+u93XR1PF7fvRu22deOcqpdctDNgjOD0hNEzHnuC2v92sP9whp0l2NoODAxoxVzs9KOh81GFXcwDZHZVrZ5hVHeSAEDKFoWhBKL302nxAQu4Mc/RvMVMBihaB3x3O2ZwlG6nv9qkvC1QkGXXwX4MdUIBkvJJeAysiRAsr42nKADu+Yv25QB/fHyAEdJ/QPD/C+csyajFTUthkcvwK6l97mO2VvSEB8FzRD7bE9FVF6NZI5DfbAVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+ZF4/cjv9brM77l1xkezRH02pa+QC+OuiIb76gRAeM=;
 b=bxf8kweDyt6S08/RSBoE3bY6fPcRYngT1weObGakcPxASMhOKzS/ZkUkMkmH3ktc5hIbli1Ch+yd3i9xB1bNNGTVPv5VEuQgxV8Jd+MVzIDCE3q4Np4YAU5P0i8kZDXV8/YwYFRV0tWL1i0yJH4eSNuQBX/KjOMPXUKRpd+8B73lGcFP5MBpoBqo5TQ+XgOxDPPdqab3VZAP/r8s9kM4j1ttpcgeWV34oGB1hsZnDETEvPRnjK9ZM8UvpIZjB1bTh/XNqqFWHh6qDbuTmE04vWcdnKK+dYUvbY27o4pfw7Rd2HVWv7+MF6+vC9gTf8NW6XrRjVTcpHihzuuNHsh/UQ==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AM0PR04MB6979.eurprd04.prod.outlook.com (2603:10a6:208:18b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Sat, 6 Jun 2026
 03:40:22 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 03:40:21 +0000
Date: Sat, 6 Jun 2026 11:43:19 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ben Levinsky <ben.levinsky@amd.com>, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Tanmay Shah <tanmay.shah@amd.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/5] remoteproc: cleanup shared carveout and
 resource-table helpers
Message-ID: <aiOXV2k6/4zMh4ST@shlinux89>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
 <ah2aVdlsLqy9aeHP@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah2aVdlsLqy9aeHP@p14s>
X-ClientProxiedBy: SI2P153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::17) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|AM0PR04MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 9194b4b4-c06a-40af-e3a4-08dec37d55a9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|38350700014|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LXemJ3yeKxg0SCG60y7Ca/bAzF84IIGSwepkYTsV9DrlWptzLRzqJtwWxZSrVO16eNCphn7I+opfYEeCqfBJBYn8g2KCJf90QfoLBZcrOI1PP/TZ3q8kkbHcTyjrZYGzaluTxay+kDpKSZptbK0zwGkP0Ub79HquZOGI76DEg13N+ITUuqfWmwOvnLqneUJxGD/AjJfFvWNfBFOqq6fsXe6S9RiRBYHhrhnnErKWuuWBhBkCGNb9epCs9tktotZds2Z0Tc0AZKqKSQd9qRSjtI5jULVA1yR0CN45TzJBeYNjxpi47Vggs1hPrRNamVP1WWoMHg8a5wu/Ftv/PumwrddEZpMbGWgKw9UKfKCWv6NC3HC/RWRgzRFNYVT4aL3/FvhpJfc9NDlWCjVrWTU9+UCMLbMIOgzrJ1r8jFT6fDjtV+NvT6RHyOk8ylOjbPNXB+KXFctu85riTwjc8oR/6bQYJb2plarHilmrJx7nW7POXrUj7vZTigo+DR1KCH3YEyBxTI3G/wFLdZtUmm4teMN2tMKjj32bHaEiYT2fo2jaRTyksDMRaAZUnT7kWCif9JImJF6nH/Ji1SF1W8OQM6l5Ln8ZJQgKE+2ljroItewmJDwIQ7PyTJP7+nleQB6GqNxY8QQTn0QRYec+mwdb8l/TefY1+x83el74jZ3+mMvGRxPZH1J0p4qGAA1GOxUeXezYog3ziJoXmAVDBhk8MRUEFT44pdeR+T5hwj40pbxrZU9O+YCeuDLwaFugxEuk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(38350700014)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dDJkCH7qdM1Ld+llCCiZ7+LM5RIkffFB+PlRQ1vUrUdH/85Wz46YIJX6wB5k?=
 =?us-ascii?Q?c5wwzKoAjq4D3gn3D+OO8z/YrnWxb38AItoyXtQUR+N1PIZTsI87lf3gCXWm?=
 =?us-ascii?Q?CyLApfMZaAdII+BgW9d26UJSkgQVR6eyCnORwynfzRkDwmoAr7LdYQMbyzJS?=
 =?us-ascii?Q?IO1Q8e1/sqBp7GletPqo9aiMVhbspJNx2ZmV/GS7Fm8pH47KhlYknS+Fdwee?=
 =?us-ascii?Q?DhHTJIlDK/CryvIE+hRTHVFA1oqU3tRnAAjDm0L6E3noE1LOwBOdOY79AkoZ?=
 =?us-ascii?Q?aaaAhHedgXeJ67eV7N0+MV1Xd3tHQuNC9Xze+feGm5Fzf1Gd5+zeXZyyxtl/?=
 =?us-ascii?Q?l2qpSD+RlU1VgtK+xPxpc4IwLmT3YEl2o5ieiLscZ4FPdGn8vI2OfQG+DR/F?=
 =?us-ascii?Q?0TXjyMf0/WsVG3QZBEYYRi2Rs3xGWP5ruXC98vEJPl9gSNCuBujY8DouPadg?=
 =?us-ascii?Q?+iPvnkMV1t2jz8gKnE6Jul3FJj9/EV1Mu8lFUsD8YqLNrijRbSqY01CUnPIl?=
 =?us-ascii?Q?LvqFoUR3qeCwV/Da8rtsRYHTzOpdrSeRmLkQi/F3nUIoRJSEn+8aefo/KpAM?=
 =?us-ascii?Q?aZ6tMgdzrabwimQNQNj/uJhugO2y3xP2N1/VhhjUftL03QUJhyRxv28Uo47q?=
 =?us-ascii?Q?2InQMaIyB4a9JBI9ikR1duFt7q5+zuy1mr0EPx/3DngxlhlJsm7inbJrI2GT?=
 =?us-ascii?Q?4BCdp/syt9l4xoK6V36/oMcQE9S3AUHY5wthgOBDF7mmtEow10Sla+q9EECg?=
 =?us-ascii?Q?h3d5cwd2b9F34/ZPsjlnjNPI3LUzHnd4H7mB7gdT/Z4bEDZ8sOAsLIyVIets?=
 =?us-ascii?Q?vu9S9Cl1iF20IhXYSOBNStTkusIcNoKeSJPaQ4ZGvnvofAka0SbyRq3VakSX?=
 =?us-ascii?Q?Rsb24u8aPWJNCFc7Ine0sqLiHcxFWhe/BVdzlolmsX5upDiRYjSD+ZLjPr7p?=
 =?us-ascii?Q?7LtYe3fhFqcP4oZx63Szj1TSr2ap8GgJ7T+SF2yvKmF3VK9intpjFWKHx0mB?=
 =?us-ascii?Q?8yCN6olw/edAx9k+qe1R8fz2Sk/uoWr5AHSK8tuYfzhJgxQg68gPRUzUp0tE?=
 =?us-ascii?Q?RIDTkGsZd0/U5R7UHUBZhNcmw5gEn/H0Nf0qJnywHsB+5Sbr1zrWFlCKdD4x?=
 =?us-ascii?Q?SPIKarIA96w8iCuqLRpjiS5vxIoh/MR8oQgpj9ur+XvKTXLa2t+wVeo6xECk?=
 =?us-ascii?Q?kiI6KnwIc0ngDkc6wiubPfkPSGFe6wyHHZsOs1yftD9R03HdXRdlaqfHofqS?=
 =?us-ascii?Q?srQT+TU/pPQJBqcZBf/bnPWd512J9mbDmeL+CBeNIRiI82eA0zJ3GQlPpwJC?=
 =?us-ascii?Q?6C2KrIVvV4e4OP/bRAyxEBXpc5dmAyLgAPbRan0obYjuYEVF8WxPJ+wHSWR/?=
 =?us-ascii?Q?xHQxMQThNMfoBXW45beB/V/uJG6n2RJXSo0F6xEBnDq+Ggyrhi7gzrTSYoTO?=
 =?us-ascii?Q?Gz7TmFxDrGfa4WQYeD65kWHD+O+QNaNoPFGIw4ep33ietaCygGCy09qv+lku?=
 =?us-ascii?Q?X612Z3gOTIXwqk0PHhvSrRbEpbbYUXVW7AXvlRMsTpO/tpKXmgYFuFU71Kdf?=
 =?us-ascii?Q?AVrR3wMZaDjD3aRv40MpcJHE1rEjMD7LgTn/rYuyDnF8f5FAreQwrLA75+0G?=
 =?us-ascii?Q?u+5cc05+Zl/9dwGn4iiUSYVZQMdXROCs2a1r2ydNNqLr7cyEKAxnIN/2vcT3?=
 =?us-ascii?Q?iujcQjUe/EQxy/V8UchJm84hlNuTWEjl4frDBPQLEO9zRJk0LiDXchP9SIj8?=
 =?us-ascii?Q?Xjxsuwe9jg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9194b4b4-c06a-40af-e3a4-08dec37d55a9
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 03:40:21.5583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrDm2PqwjjOQPX1QbOtMyKYGVGeeUrV56pEjztKUdV3mJEuC/h+IGP38LqqZ4qJqZ2iMSBu9zpP3p0tEeyU6mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6979
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33639-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:ben.levinsky@amd.com,m:arnaud.pouliquen@foss.st.com,m:daniel.baluta@nxp.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:tanmay.shah@amd.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[amd.com,foss.st.com,nxp.com,kernel.org,vger.kernel.org,pengutronix.de,gmail.com,glider.be,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FC6664C4B3

On Mon, Jun 01, 2026 at 08:42:29AM -0600, Mathieu Poirier wrote:
>Good morning,
>
>On Thu, May 28, 2026 at 07:16:32PM -0700, Ben Levinsky wrote:
>> This series is a preparatory remoteproc cleanup split out from review of
>> the AMD BRAM-based remoteproc series.
>> 
>> During review, there was a request to move the duplicated plain
>> ioremap_wc()/iounmap() carveout callbacks into common code and to
>> factor the "missing resource table is OK" ELF parsing path into a
>> common helper as well. There was also a request to send that cleanup as
>> its own patchset first, with the AMD BRAM series respun afterwards on
>> top once this cleanup is merged.
>> 
>> This version keeps the same overall cleanup goals as v2, but reworks
>> the optional resource-table pieces based on follow-up review:
>> 
>>   - reshape the optional resource-table helper in patch 4 into the thin
>>     parse_fw() wrapper form suggested on the thread
>>   - switch the patch 5 clients over to that helper shape directly,
>>     without post-helper rproc->table_ptr checks
>>   - keep the driver-local parse_fw() wrappers and their existing log
>>     messages and severity choices
>>   - retain as much of the existing per-driver parse_fw() logic and code
>>     placement as possible while moving the missing-table handling
>>     through the shared helper
>> 
>> This series now does that in five patches:
>> 
>>   1. add common subsystem-private callbacks for the exact-match
>>      wc-ioremap carveout case
>>   2. switch the in-tree exact-match users over to those callbacks
>>   3. mark carveouts mapped through the shared wc-ioremap helper as
>>      iomem so the framework uses the proper I/O accessors
>>   4. add a common helper for drivers that treat a missing ELF resource
>>      table as optional while keeping per-driver logging decisions local
>>   5. switch the matching in-tree drivers over to that helper while
>>      keeping thin local parse_fw() wrappers
>> 
>> For the carveout map/unmap cleanup, this series covers the exact-match
>> users called out in review: xlnx_r5_remoteproc, rcar_rproc,
>> st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc. The zynqmp R5
>> TCM mapping path is left alone because it also clears the mapped memory
>> and is not an exact match.
>> 
>> For the optional resource-table handling, this series converts
>> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
>> imx_dsp_rproc. st_remoteproc is intentionally left unchanged because its
>> parse_fw() callback also builds carveouts and is therefore not a direct
>> match for the helper introduced here.
>> 
>> Changes in v3:
>>   - rework patch 4 so the optional resource-table helper matches the
>>     thin-wrapper form suggested in review
>>   - note that patch 4 still triggers a checkpatch --strict warning for
>>     the flow-control macro form, but that implementation follows the
>>     maintainer's review suggestion for the thin parse_fw() wrapper shape
>>   - update patch 5 to use that helper shape directly in the client
>>     parse_fw() callbacks
>>   - drop the post-helper rproc->table_ptr checks from the converted
>>     drivers
>>   - keep the converted parse_fw() wrappers otherwise close to their
>>     existing structure and placement
>>   - test xlnx_r5_remoteproc on the latest tree with firmware images
>>     both with and without an ELF resource table
>> 
>> Changes in v2:
>>   - split the mem->is_iomem change out into a separate patch
>>   - add a common error message on ioremap_wc() failure
>>   - drop logging from the optional resource-table helper
>>   - keep driver-local parse_fw() wrappers to preserve per-platform
>>     missing-resource-table logging policy
>> 
>> Ben Levinsky (5):
>>   remoteproc: add common wc-ioremap carveout callbacks
>>   remoteproc: switch exact-match drivers to wc-ioremap callbacks
>>   remoteproc: mark wc-ioremap carveouts as iomem
>>   remoteproc: add helper for optional ELF resource tables
>>   remoteproc: switch drivers to optional resource-table helper
>> 
>>  drivers/remoteproc/imx_dsp_rproc.c       | 41 +++-----------
>>  drivers/remoteproc/imx_rproc.c           | 40 ++------------
>>  drivers/remoteproc/rcar_rproc.c          | 41 ++------------
>>  drivers/remoteproc/remoteproc_internal.h | 38 +++++++++++++
>>  drivers/remoteproc/st_remoteproc.c       | 31 +----------
>>  drivers/remoteproc/stm32_rproc.c         | 39 ++-----------
>>  drivers/remoteproc/xlnx_r5_remoteproc.c  | 70 +++++-------------------
>
>This set looks good to me.  I am fine with the checkpatch warning on the macro -
>given the redundancy it avoids, I think it can be tolerated.
>
>Wolfram has already indicated he wanted to test these changes - Arnaud, Daniel
>and Peng, please do the same for your platforms.

Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX8MP-EVK

>
>Thanks,
>Mathieu
>
>>  7 files changed, 73 insertions(+), 227 deletions(-)
>> 
>> -- 
>> 2.34.1

