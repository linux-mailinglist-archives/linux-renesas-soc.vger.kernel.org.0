Return-Path: <linux-renesas-soc+bounces-33634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8WOTGhj/ImoDgQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 18:53:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B899E649F55
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 18:53:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=lTxb8Xat;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CE783006952
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 16:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58E43B42F0;
	Fri,  5 Jun 2026 16:47:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBBA3B42E2;
	Fri,  5 Jun 2026 16:47:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780678042; cv=fail; b=S1QtxROA2M9us8coOKLTS0bYmfk3Q4SQWsPu8m40zxLHX3j4bWiff+PUqN5aDDQM+tYcEJiDADtjCqDVQsldJUfpQRoXvfxWfGthGmt5H3m6jeLXEpXcF6ppA2fLvHSMG4wrna46DJY+ZDOsus9G8qGaencWtrxHZuYQJucRJr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780678042; c=relaxed/simple;
	bh=/3MJhvPEQqKfw8ma1TJysm55g76T14e3K0d6fGCUnDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VyUbxNDmseECPjoTTSmoJRkODnPoZKIAMXv82oIwiFgOZS3iMe3B8P9YtqNUq2ipPAS9AKFkBL+8yqOXo0O0eepgP97ic0PKmbwDuqe63XOZU/yV256pLcSo1PJoWwj4mRE8nWMflERIteA7w9gipPXRvoF4Ga79ulibywgNTlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lTxb8Xat; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rL6dHFEqhPOswW0YDWxd+gtvCob1VdN+Be2GkjWl1lsYC1OULWvLrhMKuXILqhxKUqP4vWiDs2HMm3i3rnOys9ysuH/5yKiVFB8JaEv79NrcEYN/24oE029jknppyeqLuIzE0xGjLWffrypyO7055UHa7/DW3fQAkUNPPLDGUk7MIZUUyuZBEZmfAP1Ek1zbLCcXndfg7Y/nGFMTViFx7jW2s23TWgn6NmzvKYnERDe5+UB03X5o5ToA2WotkZqpCYwR7jKdl6I/lyG6N1JYyLz/kXqBS4h8Xdp9miqQopzofthNygVp9ghCizkqRXczwmjMYVbkiv6TB9EsyAy+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sR2uaJ+diIrTTJFILZZtQfv270uC4azt8j0KvB3kuDQ=;
 b=CLyRGHdCDcAHruzBsuUEHQnxXh46rvRLC8FDmYE1pHBXES5V1NfcDFZ2tLC9NuKmR4ifhrsDA1GNZJo17Iao9qF7Lad9cAsr0JFxptbaSRtuZAzrdu3A9K36rmAk66OMeMHxiOOVUgWlqbQX34b+peo1Bthq9PFgJt61ap4yamVBKrO8K/OWwT0RE4IkI6UHhq2L8TXl4Yc86ZREul5D+Nxb+PJqtzcizKBhF0B+jBMb1lFGoNrvYXlfNBEcy+BtSwKivsYZaM+vNeZs7Mv1IdcOiI+PeO2w1vSkqml+cpUg+cTnYK0iPkZNgVRkRvTLCNXr0UM32hJXan+urcsGYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sR2uaJ+diIrTTJFILZZtQfv270uC4azt8j0KvB3kuDQ=;
 b=lTxb8Xat6K0wgAYipiRS6Tuyj73vzvjWxGDk1tyH1KYCd57E6y3nJA5GDHpUlv6EIkuA0+nWEafMHVz3vlbVIdyVqsrGC6/sWfhKz2vn03xCHDCGUe0Q+HsnLALeYfmtpp09QQVU2/4IJP2QiBPyELGP69aYc4iXVrmR81/xdyMD09TuQz0MDiqSx1iu5Uw1kjaNbR4pBgFnoaIzTtiNWKIFh84Mzz80iwDiJPqztOHwgxk/raeDwEgQChvivuTSyvAVgCE+OgkdYK8ur5YUgmqCz1QpinuCuTeMfveNF8/Qf4tPa9uLdNiVWAPHJsfVWZu5u07Wbqaz1lk7QQ1Bcg==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7747.eurprd04.prod.outlook.com (2603:10a6:20b:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 16:47:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 16:47:15 +0000
Date: Fri, 5 Jun 2026 12:47:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: freescale: Add dual-channel LVDS
 overlay for TQMa8MPxS
Message-ID: <aiL9i6IQzK3EHGpm@lizhi-Precision-Tower-5810>
References: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
 <20260603093621.2504490-4-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603093621.2504490-4-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH3PEPF000040AA.namprd05.prod.outlook.com
 (2603:10b6:518:1::4c) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: df14d9f9-fd56-4194-e596-08dec322195b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|11063799006|4143699003|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	RhV8KbzioXulAXfcFb4KDeDnaBd7gm4I6apRUkXXjv0d2ohV+fU0EO5m/THS//dqYqfyy1gWOBWQobXtvnWgTIzoxXvpd7OeYZO85Cxu52mdC5becY1KGgq2xySyLspZf9M+LSX8gwKbjxd/FsUhJo+z0sKsEtzOrQ/fRNt+btCa5JppcRyxXJZN0+2pPJqupcTZSKvJesy1uKUBLz/xN24TzYXoyUvJvEhYgqic3DhzrdgFhfiX2gfzyBA+NW8/D0dY9VvSLi92J58kgi34GC7CDlq072bpAYKf2KuMMsD/Q8V2hcA6G0cFVqegmk6i1OkGdXQn5uxBOaIuTzHDPJ8n9+vrUiFhvTrnjcKFOys8WqvIQDq0IoTtHtaDWIuwWXcla9IPk0rQ0+2DaxlVgmphy0PrU8Ee5/YdHlKf8bk4tk/PvxWL2fkP8sY5o8niy7i0Ju+xiVMzcZNvdyklq465wkNX/a+fc+dFwH43uD2u+vUsVlbgUeps+v9j3NtyGvqOYDUjCt1R86EgQvzG0egTro5h8MnIFoaeXImq7yy05bicBtuCl5lek9bmu+MvDl2w5dI+v8j+8jII8mpkCNUEdlHcXYLn1gJx4gdvBwAs0JolLpxIFwdut0+EOHhMxfV7KNAWWrcMvOTRNmIF0bJZsLhDbJLvzZPcfET9ZgKWFF1lC+2F48g/FOorSUNvY/dGEV9ERwyaB9Nj5qqp+64dP+hSIq+gdTGSuG1PVBoKufIsoEnwm9Vj9pvp8C20
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V+XVrDZ6RnQdCQMcAtbriMuRMb3t/I5u2T7RwthCf6BGAE62ulj6usCphX2G?=
 =?us-ascii?Q?C6lQLplujTFwQDAfq0sqWG3b7/oriY3zNtrkQiFrT10Np0iAHCxSSFx5HjVx?=
 =?us-ascii?Q?w52A3AGgOAea+JKrbuW4hAIZb25rsbxN9KilLRg92FwwrV5rydQuMbL/i4sJ?=
 =?us-ascii?Q?i+ycEqJ/iEc83yNI91ylDW7yJrWgFo2TnUvu0nsfeaTNQDfGc5VbIbUVxfSU?=
 =?us-ascii?Q?O3G84E+LbI0CbH1vDeJgYUvaK2soZUS4A1dekiwVAqzJgfUZ5Bz6E65Jk9hO?=
 =?us-ascii?Q?0LKMBkh9NavTIfd/mMk7NjCZazMuyfRf9AaE/GJOs/53INYDuXKZfE9QBw6V?=
 =?us-ascii?Q?Iem+OaxqfYPqsiD7Cga1/mDLy+GxWiuVGj0BYh80PxGambSTfI7r1wo1SNX2?=
 =?us-ascii?Q?6vNC0t/idGfyoVx3locg3xAIAUDTxTuK13+opK4cwrUCzEvnas8HRyVGklYq?=
 =?us-ascii?Q?DlhxppNMlZcwtk6BUfjKmxgvB1niSJRxkTQtJrerhEUzJ7WXp2qnT3BSTbG0?=
 =?us-ascii?Q?Dv7jln8w5fS6FHPULA7brJtaiofdQ9cEs4CF3dM9AuFP8ZT1addh91/yTyo3?=
 =?us-ascii?Q?ZtugzYMD6PUhkR88Il/pbpti5+ZnJJ6SzFxrsBg1htOoMUYU2+Ecv8l0dM5v?=
 =?us-ascii?Q?606oBbDF7m4x9kq1tCTGeNHvoxRc/xsxW7mgBxy1PHZaOux5bxbuoktbG558?=
 =?us-ascii?Q?EkmlGL7nm3rYqCXEJbkApPCjsfBmGWcbQjO2fq56Iyj5NNpAm0FW/C8KQ0Bn?=
 =?us-ascii?Q?3n5rd4lTYm3yVHVlmbr4zYqRZdSBdIcO870udmZn+oFcpR+jWzmh9mw3oT7k?=
 =?us-ascii?Q?BxVTccF4L2E71k4xcW5AMqRJ0WT+XqJs7ys36HtJa3uLxlmQ4+ZwaEybRWVE?=
 =?us-ascii?Q?QONt8ParoeE7T2unj5JurfumhSektO2qa8Xt7wfpnf/8zewbW2oyxaN3yJ0k?=
 =?us-ascii?Q?hcu9Qr1gPdR/bScvbujSOTBvydQOif0u7qhPBraeKp59FiIkzuIwsbmOHAw1?=
 =?us-ascii?Q?FrOxiw7tc2g5SDQZ5GRUO2CFNidJm5TzYx1Tb5MilDJdfWok9jE4jOIa7qkA?=
 =?us-ascii?Q?IFohF5IV1xZ5eYjLUcp5dYbTSx0e+1uEaUqySA1ddsTyedhvbrlQ0KoZQMgl?=
 =?us-ascii?Q?c5yEj5awwLPmon8OmAfGUzXRQX3Q/4bxgR4YWmQ+8tDN4mlDAHxfqc1ZXWwM?=
 =?us-ascii?Q?yxM4uH/DOKFZYCrrwJUGVfbSsATZybh6EWroOuXDsbUR3avAfi0FR9tynBVp?=
 =?us-ascii?Q?QoTvzq5+4qyd99jJ9cUIkoSu9M46JLwq8tMrJJYKtBdTb//7m5TVUd2iz7Km?=
 =?us-ascii?Q?ClXrm0hWM9LcUpi5IJKsfSLlXnC0ROyifqCymT6jWifQgk4McWR9N7tCwLLA?=
 =?us-ascii?Q?qxgnL2FFKKL9LMoJYpJCZJkT0TdcQZJ1VySzTbprp/GCOnTERfE4BysF57bL?=
 =?us-ascii?Q?lpgoKQobsdqDpetSNZ1Z/z2loMBNDAMB5sETGWlgdW8NYTcY8duWxfmbs2SB?=
 =?us-ascii?Q?/se0x18SLDk49YSeG7UbxvzEcSXBsqyNlb/tUfSzU63KJurvJXSAU+ZrHVnK?=
 =?us-ascii?Q?miCDlqyXgH5QIsRc8oqx+eOEg7UrlEiGWr0M3gHOZoSOy0/uEMmxkZIPXqSD?=
 =?us-ascii?Q?gKUrqac8LxBxaMDWHHzzl010LNDklsf+LPDjZkJB6TIwKrpEH7OhH0yyVeo+?=
 =?us-ascii?Q?5NcVFvWmSvKo6qkSU2kv6U38O2Ycr8Ml5X7vAb9c5t6eWxIvZFmEcm2KBgtk?=
 =?us-ascii?Q?qFY7a4uJUw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df14d9f9-fd56-4194-e596-08dec322195b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 16:47:15.6760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmJ50Sm4CG25AGuFKCyTm1oXQQSeqR3j0SU1QmiPit81ZujweedVw0T1atjfuzxSJ4oBJbvw0DuOgzy5oG0AYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7747
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33634-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexander.stein@ew.tq-group.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:shawnguo@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux@ew.tq-group.com,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,glider.be,vger.kernel.org,lists.linux.dev,lists.infradead.org,ew.tq-group.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:from_mime,nxp.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lizhi-Precision-Tower-5810:mid,tq-group.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B899E649F55

On Wed, Jun 03, 2026 at 11:36:09AM +0200, Alexander Stein wrote:
> This adds an overlay for the supported LVDS display AUO G133HAN01.
> Configure the video PLL frequency to exactly match typical pixel clock of
> 141.200 MHz.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Can you fix W=1 dtb build warnings?

Frank

> Changes in v4:
> * New to series v4
>
>  arch/arm64/boot/dts/freescale/Makefile        |  2 +
>  ...p-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso | 74 +++++++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index dee2bea156740..3f466f102dc1d 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -385,8 +385,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb
>
> +imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtbo
>  imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtbo
>  imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtb
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso
> new file mode 100644
> index 0000000000000..9595cf4d43cd0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Martin Schmiedel
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&backlight_lvds0 {
> +	status = "okay";
> +};
> +
> +&panel_lvds0 {
> +	compatible = "auo,g133han01";
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			dual-lvds-odd-pixels;
> +
> +			panel_in_lvds0: endpoint {
> +				remote-endpoint = <&ldb_lvds_ch0>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			dual-lvds-even-pixels;
> +
> +			panel_in_lvds1: endpoint {
> +				remote-endpoint = <&ldb_lvds_ch1>;
> +			};
> +		};
> +	};
> +};
> +
> +&lcdif2 {
> +	status = "okay";
> +};
> +
> +&lvds_bridge {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			ldb_lvds_ch0: endpoint {
> +				remote-endpoint = <&panel_in_lvds0>;
> +			};
> +		};
> +
> +		port@2 {
> +			ldb_lvds_ch1: endpoint {
> +				remote-endpoint = <&panel_in_lvds1>;
> +			};
> +		};
> +	};
> +};
> +
> +// Update VIDEO_PLL1 frequency
> +&media_blk_ctrl {
> +	assigned-clock-rates = <500000000>, <200000000>,
> +			       <0>, <0>, <500000000>,
> +			       <988400000>;
> +};
> +
> +&pwm3 {
> +	status = "okay";
> +};
> --
> 2.54.0
>

