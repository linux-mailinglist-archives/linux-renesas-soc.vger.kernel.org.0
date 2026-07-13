Return-Path: <linux-renesas-soc+bounces-35151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ruyIHg4bVWoJkAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:06:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC85774DDBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:06:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Bxw2CvQp;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ACE430247D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 17:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE2433439A;
	Mon, 13 Jul 2026 17:03:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37FD335568;
	Mon, 13 Jul 2026 17:03:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783962185; cv=fail; b=jYbycFMfxwdClG92d1AqkrjFvetMPulFEhpF1QaEFLJSdR2rFU0p83cjyvhZvAm1Rn9jQXtOSgMvQJ3UbZrPlFJPA8laoh122Onhk2T08/58TxDbhmGUcThGGyGq+UtxSnuPRY0m3n2TfwYJu7gQABpJ7BdY+HFbAnpFDc+JkEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783962185; c=relaxed/simple;
	bh=VFA8Ozsrq0OuWrIpEj5U1JieWzkk2U+CqG4KO/q2Lu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HhPz0BqleScVsUJamikCw0K5hZURIN1h4wGLE+m8pkoji2gxt/ijQKArZYd8iTId673yjPx6PHf3OTKc8t2nmAh5K3iy5n6ueAj3fnHMmzhmMPhle++lPnwE0SAKxn4qqq9e6M1PCbKrOS985yj/1dJQl7FKc+Y2Q0egfp4nhvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Bxw2CvQp; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGHEccTSSugKZOtM4/gsJDycWdBfTULU7QRJ58NpaVAaHLxbf+IUMglo0/2hdOp/FyGVpVNEZ65l84cVtEZGsnKtT4ogN/JukyWvYdwVX1J/WcyY3udWzCJHzKa7lMu2nxDWF3puKvz4eIA0A66uWbEXJWAn3ZLjMRUWfvMxhoEh4bX2WYTdirLlqKTzHUYDZesE0T5CAL6B9UOwD8/dEG9IoB3bYD9T3ECZ2BgThOcRTtGCFvnZaWXVoZ6WFSCUh055cyYa5+AJJqL+KtJ1yO9mB9RIRKwJ5pE7LEgCGSTvXLjoSEkxxSIWzTTXpyBclsmORmDm2jbf1eDMbMPKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ip/zy5MHSmeZVQZ6566OnK+VJ3rKAXFNafKTgZeaa4=;
 b=OfQb8BrtvH5ZbViFs5ZmEWOeXkM+mhSaCHXfHprbwIhizYAMmEHwtvsPi1nG8P8RFGMt+4xoQLgZjzIjlVroeCg0LMwZVjgF6RwQDTImX6NXOX7IXfl16oj1Ifh0RfP7sRfHIGK6Mro3vEfJ95szwY+rPI1Ah0BFL3OHCxkgtCRYmfNpo0kVi/Nuq0MDN39uA4Nt9X3Fs1HhZij7J3/YmJJZtcZTUGW0W27Vu5RPr8BtpFA1dovMo8GieIPCarebiDyMtrg1u+zxcB2V+856TdCd/f+gG3QqfaL+CCedK/3d+HJCpHcZNPq7O9R8Mc0rDpAMp77x2KRtxUlT4qk9sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ip/zy5MHSmeZVQZ6566OnK+VJ3rKAXFNafKTgZeaa4=;
 b=Bxw2CvQpvYUhWRoeG6R5hW7B09XA5p68oH1H7wyvwRYE42pu1xh3k+CeOSe9EMlXJx2hLG73aH57aepNWXSrq2zhKdg/XXXVviT+UW56uMGlZnsJDGHqzG44wWxOECYQmdDrn0YErhQMr7iRfdLd51Tw6Lfl+mvwg12Wmdu6O1nsJ+oRWFwchoWqmj+I+xQOHSz8b6olSQspHIXr1ZLAVsvi/N5JYt27LZXKI7X2X6QqwAl3HJ7dKYzPvGXszIdn3DLCVwXrcgUYnIgZOyERGbN4ZLjHgZTipwULBRTNNvDnoNleuSb0zNzv5wF19jOr+pNLPhwShU2Daua3jwb45Q==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10228.eurprd04.prod.outlook.com (2603:10a6:102:454::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 17:02:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 17:02:59 +0000
Date: Mon, 13 Jul 2026 13:02:52 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	p.zabel@pengutronix.de, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 09/17] i3c: renesas: Use reset_control_bulk_{assert,
 deassert}()
Message-ID: <alUaPJMt_kCaMfWh@lizhi-Precision-Tower-5810>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-10-claudiu.beznea+renesas@tuxon.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713130545.568657-10-claudiu.beznea+renesas@tuxon.dev>
X-ClientProxiedBy: SA1P222CA0066.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10228:EE_
X-MS-Office365-Filtering-Correlation-Id: d24cdbc1-2bbc-4157-2ee1-08dee1009763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ef5KvzrlPYjeXdAPaNwGatcaw2ibyGOgNxUpI8zkkqJeDFI7AdrvqH71IPo7vlODTCvD/9VzLWK58WfuSabB9ZsHUNuBgIi6AorCKubxWoEGvRttGNLrO7xH/9yq5TfXATy7Db98VPNEnW5Lw7zf9pkE2EG5TXCXn0x3apLzUlvWnFBOm3bkuR2iV4OM6Toc2qnEcJa5EgCFTwkH5jX8uNHILK+gmAY80vVGJXaTGNomFhnSFlUPuUIzlpErdga2n5EwHdVyfbikZrhz7po7Pprc9ZawWGiOOlC+zqDNDuYsLS0bNoHerRDAqnvJeak2jYQ1xN+3hvdDHvjz/tn2ciJFU0kMpZhXlMk+tUQAI963ATR37DUyukVwa9mQ1e+NyhapbTSpkFowTgYng269yrapPggtVlp2p8zvS3HgeZrMUgUOVwp6nBoui5/ic4UmyT4v3rJmJYAn56NkmB/K8ur82+r5IxuCTz3HzHRX5bDr7ACUaMmmxxCaNGeUx5ETypPYtbtA6nRg5ub35598P8zeoH9CFx6/TKdhMkcPLrDo4l8KJRz+OmqYNrHH23KUtI+8hF5gq2y73H1g1hYjC7CSKnzOicySNalyDUvejHQWCeGScwWCM3rd3PCWYRbGIZsAZt6ssuXZIRr4gQNB5JV4Y88ZLNQY4MdIlsST/Q0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+GAziTNxMV3B/zq+geUmHQFJZkJ7+vMzgr/2HVfBJ4MNQcM/YbmTkm8t9QjW?=
 =?us-ascii?Q?aGcTMuKDAQPkAqrBN5cpQpWITsqsuLHOvrtfAkTyY1lzzyfHWfPFek6hcKLh?=
 =?us-ascii?Q?Tz8lkNH+nR9baaV9NwlWc4C1XdEGGtctbAzadiAdnlHkoDS/Jr14SSwVHGIG?=
 =?us-ascii?Q?dZA5ybOG4xAOnax8cuOAwznoJSQ8hgTDs8OPKpCJLozg0KtAvy5cCeiNeq3x?=
 =?us-ascii?Q?bDgQ4DgcX0w1xboZsfy7fn7kzq4GoJRXy5/pzOr2wQCmq4MfI8GjBiy/K9hG?=
 =?us-ascii?Q?OwhgY8I65zbuZVDva7tnKasY9QSOUh/QOZStxm+wAB75pkWdHC+YAhsXCR0D?=
 =?us-ascii?Q?PQYLHnqnS4MyAVDtDdKTFfUsqeuPA/iZy3Suas1Js1Zslsna15Z8R4wVdglm?=
 =?us-ascii?Q?Xheu/1mn/QNu7IHe+K813ejz2TxOJZClMpNzx3x57w4171/GdtuX8RS+oGrl?=
 =?us-ascii?Q?jnRjgGkJE2eN4CtlkAiQ8Vr9BF1n+Hz/Ae4kBxePW2CpEXO8LlkaAxTQVXrA?=
 =?us-ascii?Q?7FZ82AkJv3vkLxWW8QvX8GfXX3Maeqx6CZpUDheP/F0jI9qgI9tMMC+gD3eN?=
 =?us-ascii?Q?c83hzeB6NkiKw0OPzV8P1J5Jx/irlAQF1TPjxOxSQ+sWLxaOf9tEuvffrVqv?=
 =?us-ascii?Q?XODDxHOdcHk3UcEsLZGIZMAm01hj7pObu2uRYmlQfyOhs/jdMFIOMf0o9Nqi?=
 =?us-ascii?Q?zTsrFrMnoaLWLed2sy3jcGG4N1pfzdCUkbcs4AXPz+kXzSOJ3nPFT1siDnG3?=
 =?us-ascii?Q?2asC1FCz5ttBLkP+7D3JpvNtZ/yxBrCKJNAUkSFfHNBJGdEtXqiZsRo9XugE?=
 =?us-ascii?Q?7nuGLQUwMiDO6pSb5/USQTSTg7tGuAaJaCPVcCA8h0/3kIKJErAwxlhYaIJ5?=
 =?us-ascii?Q?9B4DL7AOg8Agurb5Q9ttEJntFakQ5rCYfh56gv2/kNICeVL5yZds2Uh6hxz8?=
 =?us-ascii?Q?ym59UuibfgFG/4o6B6sMnUA9eJWcrG8g4NDPTBsRCBOhlmtVuNdPUcxlPI9g?=
 =?us-ascii?Q?rNQNHmq4gjXXk3GQ8+UuCcZZGvgY/G4W6t24jsXsfch91Yc6/OaSG8VV3ZFn?=
 =?us-ascii?Q?dgC/Vo3LcXNZX/Q79XxN8qhI02nUNE/KVOYCzk6CL7/oWeQMYDPL9+e9clho?=
 =?us-ascii?Q?kr9zt4kR1EVpMAhDkpBk4lg+v9FZd0YM2I25twf4i8Ef79IESNscwm+ruqty?=
 =?us-ascii?Q?mweOlxL7h8ktP8c+1GX46E8+FMwhccb1vUtCgMkmKr5Sppc8THCXY3JIYnJD?=
 =?us-ascii?Q?OMwkou18FeEdeUSHvAzGQ4GdrV2ZI05a3wwkW96jgbc/soVYZQoW5U0Zog8M?=
 =?us-ascii?Q?d1a0knS54vhSP+1PRvGdLzch4c0BFbhFCSgmoYgXSteQ7IfyfEtq+qYjPRfj?=
 =?us-ascii?Q?jxZY9HuaqnlOFdtVMrjT1LllFjWf3s+3Okzr6kGCxCQFZrZZyRSNze+2tMyq?=
 =?us-ascii?Q?ScfhdKOS1LDfs+UUDxtooRtzu5HxWIEfLTyjP7rW88YNBJTWsSSOxgtlfZyc?=
 =?us-ascii?Q?ucv0LPz+I2M6chRuYYn9xwkcTXqALWqZ5oIijZZzGWblb8cogwAOBZjgCd6e?=
 =?us-ascii?Q?O9jnbJh8e+b9rQeZsoAcv55ab0K7/VeGXmaUhYOvolYZYP4lKapLXtuyfMOB?=
 =?us-ascii?Q?jk3nfj+8w34WjhIPhsbthiQeBRXt17ffQ46grgSNoNmSe2wNsDcxR3yVCu0T?=
 =?us-ascii?Q?e5c7++RBYDWRSTqVI3q3FAceLsGQqE8J5B57TtKVQyJAAZcxPV3nuxB+a3ru?=
 =?us-ascii?Q?z7hv+AzCzhu9jMjO4LnqgP3+KRN42jK33NpqIS2KRbJ3k8Txb2D6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24cdbc1-2bbc-4157-2ee1-08dee1009763
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 17:02:59.1353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G46fwO3O4DSkrctXBgPWsP5N8Gi5tWeGV1+5ygXC2sv+zD5q0mTmWdtVyj6qTswu7hFDZmB8euPocxHSAj9sIL2pwFp8S2fVvm2WC42jGXu5XYGx+loiX++rgBf1Y4bN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10228
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35151-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,nxp.com:email,vger.kernel.org:from_smtp,lizhi-Precision-Tower-5810:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC85774DDBC

On Mon, Jul 13, 2026 at 04:05:37PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use reset_control_bulk_assert() and reset_control_bulk_deassert() in the
> suspend and resume paths to simplify the code.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Changes in v5:
> - none
>
> Changes in v4:
> - none
>
> Changes in v3:
> - none
>
> Changes in v2:
> - none
>
>  drivers/i3c/master/renesas-i3c.c | 30 +++++++++++++-----------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index c459e40fd5ff..915090d0ad37 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1437,24 +1437,22 @@ static void renesas_i3c_remove(struct platform_device *pdev)
>  static int renesas_i3c_suspend(struct device *dev)
>  {
>  	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> +	struct reset_control_bulk_data resets[] = {
> +		{ .rstc = i3c->presetn },
> +		{ .rstc = i3c->tresetn },
> +	};
>  	int ret;
>
>  	i2c_mark_adapter_suspended(&i3c->base.i2c);
>
> -	ret = reset_control_assert(i3c->presetn);
> +	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
>  	if (ret)
>  		goto err_mark_resumed;
>
> -	ret = reset_control_assert(i3c->tresetn);
> -	if (ret)
> -		goto err_presetn;
> -
>  	clk_bulk_disable(i3c->num_clks, i3c->clks);
>
>  	return 0;
>
> -err_presetn:
> -	reset_control_deassert(i3c->presetn);
>  err_mark_resumed:
>  	i2c_mark_adapter_resumed(&i3c->base.i2c);
>
> @@ -1464,19 +1462,19 @@ static int renesas_i3c_suspend(struct device *dev)
>  static int renesas_i3c_resume(struct device *dev)
>  {
>  	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> +	struct reset_control_bulk_data resets[] = {
> +		{ .rstc = i3c->presetn },
> +		{ .rstc = i3c->tresetn },
> +	};
>  	int ret;
>
> -	ret = reset_control_deassert(i3c->tresetn);
> +	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
>  	if (ret)
>  		return ret;
>
> -	ret = reset_control_deassert(i3c->presetn);
> -	if (ret)
> -		goto err_tresetn;
> -
>  	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
>  	if (ret)
> -		goto err_presetn;
> +		goto err_resets_asserted;
>
>  	ret = renesas_i3c_reset(i3c);
>  	if (ret)
> @@ -1507,10 +1505,8 @@ static int renesas_i3c_resume(struct device *dev)
>
>  err_clks_disable:
>  	clk_bulk_disable(i3c->num_clks, i3c->clks);
> -err_presetn:
> -	reset_control_assert(i3c->presetn);
> -err_tresetn:
> -	reset_control_assert(i3c->tresetn);
> +err_resets_asserted:
> +	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
>  	return ret;
>  }
>
> --
> 2.43.0
>

