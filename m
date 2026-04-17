Return-Path: <linux-renesas-soc+bounces-31344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHbfGLWs4Wl1wgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 05:44:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E932416AB8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 05:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDCFF3007A7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 03:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B116033F36B;
	Fri, 17 Apr 2026 03:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HrhVwP2e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F701FDE31;
	Fri, 17 Apr 2026 03:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776397486; cv=fail; b=aDHRf16avkDTvW1UTV9o/08JiW1+T3Uj/fhN/Al77D5kl/L10JO0eQGIGWtU9JI4Z8qHm+X0T2SwS8GveXXDeLzVEJA19SB9Y+K7WxO2RkRRyXvawtsV+IBd4fODcrZPP7GHS4Bdr8zi1AtKfGzUQtJXDaPZayRMNC6lb4IYzi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776397486; c=relaxed/simple;
	bh=AKMY9FFVHZMDCXAf8bLoLHr7wMRcJAngIk2Slg2uDCk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iOwPmTZVQjee1BAStbT74nDEtBI4DSctlWjbIHSCfSMgTG8CYJQpVeSGCBsYvNWof0aht+k8DMBtqz7qbBYUVzoTnTKTRealbVgAmsY5hsvtU6r5MBL3iAdjhkqQJCFXI2hOcrAkHi2PAkma2y+A4DpxNirsC4TPRcVz/uZDkyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HrhVwP2e; arc=fail smtp.client-ip=52.101.229.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igpDNgZ0/ts3hgj/TNWHaoBulEgdKtMluffXeMyHwLplH19uz/auaYd+7hxwfGf+zLaxR8j/WM1/nKjpJPq9FU+Uec1LWx1seesTZi9AfdqtRj+Y18U/t7r9uk7LxKR5cNS0vplnRJW4nEn591ktrZRdqch6jSGIiNUS+NpxR+MRfgSFOZLDD8MNqZoMiw3k8SrAMkmp7F03VZxdGpsBskvHnGO84TVF+XtaBqp33bBwP8y3/8BZXIjUOzG7LcHkbuiTNf9knmtOYsMBxNcvrbX7X7IYn2YmpxPnQOcF6EgxAIDQLQ5k4QQYDCZbz3CBgSSsb3KYgRtl/AW6kjy5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrL8e79IyVLnTk3qhCkDOGMcbcfxJOnNZ/huBYBf8PQ=;
 b=Cgmt2VwvhG3fIqQw5hjhEf+BOS/BOBsSK7fR+DRaBdfjBeJpc/jwNWxN2oGDrqet3PZfVQ+cIxi4TLhjsBBY3FwM+2oWQkmlSJ3DHbJ0qcCXPwkf7Du+zwkFwZpt8U+j7Zyk+vI0xuTLgYbgtzIGx2GJn/aO1v7Jzgw5Tzk9pR61o/YuFVn//BenkerTt2qX/tyigMj8MIxpcu75g2HKeQiFKoSWXGnmRrhGPN06QH6vCf4VzIWBzTRJfR4WX1/4XBtiGIdNRpPm3tcUzRMNASr0850DHzIrcYwpCN4Hw/H6iHW1aO1Dg1NkkGz0LrR66dfSjBt08K4B0I75GQ7w8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrL8e79IyVLnTk3qhCkDOGMcbcfxJOnNZ/huBYBf8PQ=;
 b=HrhVwP2eIrqMRGW5bdBG7OGnR7hr8xySkVOuxbrCHl0f3e9wkZuW2JVhsB0Ds17QaoCnq9rXHsEPWJc1ui8k1qk+0bU7T53iwfDi5bazaEK8sAJA6rRwG0qAd7YZlVmTEG3CD7Bmg8LYCBuuF9uazPzjAeNuqOrNt05fWnKdryM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB6829.jpnprd01.prod.outlook.com (2603:1096:604:137::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 03:44:42 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 03:44:42 +0000
Message-ID: <87h5paz1w6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH v5 13/14] ASoC: rsnd: Support unprefixed DT node names for RZ/G3E
In-Reply-To: <20260415124731.3684773-14-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
	<20260415124731.3684773-14-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 17 Apr 2026 03:44:41 +0000
X-ClientProxiedBy: TYCP286CA0317.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be45f5a-4d88-4c57-4ab2-08de9c33a8bd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	i5AxyPIeUM8VVO6Icp62ZLseEpq0uZN5a+VCL1/x8cZyULhfaJhOEBMWHVe8ABDJsH1UwX+PrXX/mJEyFK7Mz6XfPbcs85z0M3M5C0x9gkyCejEqquk1Meuj/OzQWdGCJXzl1trXQ1VL6t9xvauWeL7nbrM8gKtjcx8PFrjr+FX1Q19Mh3MM3PL4l+7cDxlmWzlGdjJi8rcwza4WIIBuTkepUjnzRggiP6GDGiP8Rgz+IqJhT4SIQY7cFn2rk7lgyZP+fi6HJijGfrD1s/NXrM1ZwaFyl5D8YztVOlNzNLtSCLQ8QK1xPvK/z7e/IoWtx0NHQSPAfzzQVn9nVLpiSOjudlLmKQDZU/rw0tSRbjYKQQ14947zmZziFOBxUJw8x99iCmZ7GlPXek/q4QYUI50TCxWA78W4COBLgRjPnS6gH7+sHqTqwHTBlhAkytqK/C/RXPv/ZzR4OzfH3Z5e3h15b36g5KLnaQDS0X8wLWB6twP1RhM46BcUacy1N8KT7AgO7G3ZkC5MpqeZ9QZUJIHlo8LQ0JykjkPIxhFCJWzNMf4WFJSzukh6LvQiiPQjw1cpkH4Pu8SWJJ44YYLMgEOc1AV6ak/8WNOKX5gbmtr2R6zyAhcaowkYkK1XDlujA6uUiaHU3OubacLXiDNeT2SfVC9rqY4rR5VFxUM1JmgtUb4oR96ZWSt9tp8l3LHASnNYzM3dar0zOkMwJWKkurgIVNsMuQdigqzmDQX+EopuhIDzrTKTNEdOWybf7VKGeq3lfs9ufZjYWIq1zJi7FLy9SJOpuOe6Go1Spjkl/E0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FoD++6mgjwcoyKIe4Q3tb/9EtHJLVoMS/YCLt7zqd56lDmKrcdZ6sL4be/Ee?=
 =?us-ascii?Q?CA9dvoZJxJREpD61n1TdT/QJIy/oRzBcvgLtX6o2GIjjJNzvg4KdZZfTinvk?=
 =?us-ascii?Q?NLrs4FQ4A0SPHBXl5G01861vgWtUKaxCAlC6quwJb5RjCrOe6aIWtXI6zZAC?=
 =?us-ascii?Q?aoOTOacsPgjP0gRkvesM4ttHPqM8gDXqCEIcOv7E//lSHSNMMWb0wWt74VF1?=
 =?us-ascii?Q?tbB3FOdk8sJUCfKmh595tdT5W2gqY1BXrYPrCdmwldbfsRSjY3pNyU42KrBb?=
 =?us-ascii?Q?vm6WnPQrYkmOYv4PQnnv3viHq1fPdHq2TA1PdKVqh80/nqtKnxBncgJfblJh?=
 =?us-ascii?Q?xbYhdKNrEDPkibSCs9luct7Cqul1/hQDKnfQukGyEfSJ4BP/7WS1vVueFW5J?=
 =?us-ascii?Q?HpZKn9VxXLamvo9Uzq4YbR+Nhy8QSIz1Sq29R0VXYYfSrjfV85pe25iXXJRs?=
 =?us-ascii?Q?II1l6m3XeXGqaxEAWY3/46keqIRUJ0y5fstF/h/5sI8RObngm4S1KZMfDHLJ?=
 =?us-ascii?Q?SAV7ht2clNsDeWZ6NGBMWE0tWjl4hsUgkVAFcd1NN/CbJzr/B++d4/6izbA8?=
 =?us-ascii?Q?dQ7riQ1+aDV5uBYWS1bIfAgnNMmNVvPkcCOLid/ECe+u375UF6s5bCXGmpVS?=
 =?us-ascii?Q?+LUFVku1sbvd8pOimumNr7fwxF6fuSeTQ1lzyUsdCrpdlaWyNViSn9zW6Ig3?=
 =?us-ascii?Q?MA6ALJ1VoUjDfApLjYyIXeFhN69eduRUAmdT+GSMGnp9shpQhAJx1ECnuaHp?=
 =?us-ascii?Q?sIr0fXxKZ7YYWTbiA/DcDk9LkEoPqJeqrzNZuPpLREa3KICV6Czvv1gAsc6N?=
 =?us-ascii?Q?rn2szipe4lQSay6Wm1eY92L0HsG6f5yVGt3wZR82vUN+naSnaSrBilrazBz1?=
 =?us-ascii?Q?4B3In7GOabX+XPPp7w7+7L/rZNvMCGTJrmbjA08BWIWs0KxRRg0Mm+M/aj1f?=
 =?us-ascii?Q?84mftkPXevl2+9JpX2HlREqGeA8IkZnIoj5gAnHMNfibLV7XWOOkMbBJSpmE?=
 =?us-ascii?Q?vc+o/b8fWBqT/HDJfGUYbnS8Lor+Y588fGDyYhz/jqL50QfUDzhAsveqMyN9?=
 =?us-ascii?Q?exVNH23jYjdsQoAsN/LY7k9jU27/DUEtHsWg18dBP0VEok+5gegWEwwGnrZs?=
 =?us-ascii?Q?oT9UabrLiuz8XM+RmsvZ7UypXx3g8YPuEcQW8WRSOuXMcUT2NydbB8EnpkQ3?=
 =?us-ascii?Q?7L9fPs+v+a1m9yzBMzhQz1LrGWgwTooVyMHy0IUo32OpUthmiPOdC2zPWAEK?=
 =?us-ascii?Q?5eS416sGY6OxJUAAX67IK49HFnDH4QqKJXYp4ZTZIqu05KwzQXjMiznN/3Y3?=
 =?us-ascii?Q?iWurIOcg8xhzwJBKVZ7I9euuAot/CEjHJ5vzsC1UYq6OflD2yxa1h/Nj6JWL?=
 =?us-ascii?Q?meVzZI+snnabNSIE02zWxg0W7dYf4irTAZGSZ3UdnzBe+V85QZkURBUL6Nh9?=
 =?us-ascii?Q?LFvsSsxjFsxb4Jd+SVAzUTtIBOuZiPRCbvC2ZyqDVPGn5DJavEopRzUPbUkh?=
 =?us-ascii?Q?QMBgzZDuVZ4Fl3iqSklqcc7MA7miMzQscTITrxbxHjHUNx7b2vsSF8BFk0Xx?=
 =?us-ascii?Q?Z5zZs8rIiZitBio+qPV9pTbmCR43Oqbc3TCexoAdn4JlPG/msLpIepIm1Jbc?=
 =?us-ascii?Q?Cy4ShLHGUH+8lcIa5JPaA9DWc9eZK2HPD1No9GYcQlba7HgtOyjWBuJG33OE?=
 =?us-ascii?Q?f8moQjIOwWH0TR8qQjx5eNE8++mOAozH906kSTrDzH0wA0gG21EvlZQz4Jdk?=
 =?us-ascii?Q?6yvgFUTrcbWwT99Um5pYHAGo9ozUN7PLoiZMdL0xrfASur1MVpyz?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be45f5a-4d88-4c57-4ab2-08de9c33a8bd
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 03:44:42.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4FylApwnXmey5aWSVbv1C0+BMcVauUL/+ylrMFeB0KZSrmNROko/P6Oju+5sTzDYa10NebQuBb+5PKXuJSkX3q7zg1otDKMpPUl5aB6/c8nQGC+9kFNkJt1RtJDM7EX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6829
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31344-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5E932416AB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

Thank you for your patch

> The RZ/G3E device tree binding uses standard unprefixed node names
> ('ssi', 'ssiu', 'src', 'dvc', 'mix', 'ctu', 'dai') instead of the
> legacy 'rcar_sound,' prefixed names used by R-Car bindings.
> 
> Convert rsnd_parse_of_node() from a macro into a function that tries
> the legacy prefixed name first, then falls back to the unprefixed
> name by stripping the "rcar_sound," prefix. This makes the driver
> work transparently with both old and new bindings.
> 
> While at it, update the of_node_name_eq() calls in core.c which compare
> against RSND_NODE_DAI directly (bypassing rsnd_parse_of_node()),
> and fix the related comments in ssiu.c, ssi.c, and dma.c that
> reference hardcoded "rcar_sound,ssiu" / "rcar_sound,ssi" names.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> +struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv, const char *name)
> +{
> +	struct device_node *np = rsnd_priv_to_dev(priv)->of_node;
> +	struct device_node *node;
> +	const char *unprefixed;
> +
> +	node = of_get_child_by_name(np, name);
> +	if (node)
> +		return node;
> +
> +	/*
> +	 * RZ/G3E binding uses unprefixed node names (e.g. "ssi" instead
> +	 * of "rcar_sound,ssi"). Try stripping the "rcar_sound," prefix.
> +	 */
> +	unprefixed = strchr(name, ',');
> +	if (unprefixed)
> +		node = of_get_child_by_name(np, unprefixed + 1);
> +
> +	return node;
> +}

I think it is better to have name get function, and use it on parse func ?

	char *rsnd_xx_name(node, name)
	{
		char *sub_name;

		/* name = "rcar_sound,ssi" */
		ret = of_node_name_eq(node, name);
		if (ret == 0)
			return name;

		/* sub_name = "ssi" */
		sub_name = strchr(name, ",");
		ret = of_node_name_eq(node, sub_name);
		if (ret == 0)
			return sub_name;

		return NULL;
	}


> @@ -1273,7 +1294,8 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
>  	of_node_put(node);
>  
>  	for_each_child_of_node_scoped(np, node) {
> -		if (!of_node_name_eq(node, RSND_NODE_DAI))
> +		if (!of_node_name_eq(node, RSND_NODE_DAI) &&
> +		    !of_node_name_eq(node, "dai"))
>  			continue;

If driver is handling almost same things individually and/or randomly in per
each places, it will eventually lose consistency.

rsnd_xx_name() can keep consistency ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

