Return-Path: <linux-renesas-soc+bounces-32331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id s/HOIA05AWqxSAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 04:03:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47B507198
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 04:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D8593006513
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 02:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B281223EA97;
	Mon, 11 May 2026 02:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CgoEhAeK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3A61F78E6;
	Mon, 11 May 2026 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778465033; cv=fail; b=Pp2wNZpIufbTTeuVA3Dc/p/ByQ7bN2eu+EQtC7uQO7yZ5fh7DtEOzLd4qhCUTQlpDLZOHx2rboRhBO5OvMHmUbQo+gMAE3jPOJuVSbSCJpz8BdrkEIohsU6Zusc5bKQevgDP5GylOu59h83UKsqLQsJEX529EiGac9CTfe++n+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778465033; c=relaxed/simple;
	bh=HnhlOz78Qw4fkQfp8A4YpIvbE3BtVtgiGl7cgMGz3yg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AtDvm/dGuCw3xlEWID7ayoAatrDOs6eXHt9bwrlC/6JIoBlhH+stwAeZ8ArSM+XxCvizSyrt9si8BbTwfUlHLTTY6ioluQXlaceg4zZsSDoukgwREwi5fUhiyFoJuVW/bv4OMuJmyFjY+seUt4mZnMxEVULXIz/OHEzkJNNYwW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CgoEhAeK; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJoxCwmLXKs0W01SERqileLw3l6ptOl44mDGf/McRa9Euy3uq0CvrTNSxolhYdVRylcNogsR2N6QSgoo2+1DuWL8tSYe/eD7cN5KyS00mlkaLlEPSfo78k5N1y8vnrVb1oUxEtQ7BvXe4uGLW4gH+J3NTXRlcn+ZM/whYK4JZCVinyvW+8Q+s3r2vxBBghr0v8vUpui1P57E/oVeUQNWbAvvzAZyi6DWGOjcB+R1UVyjfTPvvZwWNmF9lC3ON7Lox4wE0k9iI/dwGGbembupFBZbkH4n5Z7bbTBBth+9LRkluRCy9fN/z/38mmgRQjHMaa1Ps7PndGzFkGnCX9YygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjwlq99GZjhVnjRl+/WxhLQFjDxMVjqtKUJx7E1Mm3o=;
 b=bu5xgYXPZu2DeiK9ItibC4FfKBcJjs75fI0wj7LI66GLxPJ5LRdjm5OawI4RMUMLN0cqdUSyRVjvFSrNgClkiBksWw9a4lPL/eolbmXESO7ok9+wXn8MW6Uvtp0LdEFGJTjrF2KsnPGB3cDVsdgExQGB2D3VcTJIotRsljR/glcBoNagdPus9z56fCB7echzJhno87OK2sNb4G3JRfXihhp6ANKlrNECxgN+rh5yFdnfbUa4O3+D8vLf210mvHPS+bwSymE9GpCc4PorWHw94ZsrhVQnq0U23E6a2cSbokMLxMielohxhuuHSAEptP5h5F7I/9Sskg++pGWhJJgOLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjwlq99GZjhVnjRl+/WxhLQFjDxMVjqtKUJx7E1Mm3o=;
 b=CgoEhAeK5yrKoWj4vg1NfRmOt+Kgs3clhY7zm35lh4cva+JOXOXJ1zqER7hv5kDJTU0KfvL6/C33G15AaanRFiSlErHmralX4EnfY/wbrPZZmEObUVHJCazApzF3bC/6fjJ5KADEtUWyEQYnADQb6FaRZ3maF+biV2Rzt35WsK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYCPR01MB12110.jpnprd01.prod.outlook.com (2603:1096:400:449::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 02:03:49 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 02:03:49 +0000
Message-ID: <878q9qn1mj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: phucduc.bui@gmail.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH v3 08/10] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
In-Reply-To: <20260510084303.122426-9-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
	<20260510084303.122426-9-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 May 2026 02:03:48 +0000
X-ClientProxiedBy: TY4PR01CA0112.jpnprd01.prod.outlook.com
 (2603:1096:405:378::14) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYCPR01MB12110:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c1604a-62c9-4c2f-8f54-08deaf018a8a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KsmqGd1tjVY1kNKeXvFS8DRgNCvekutuFnhy9u6IppuM4rmq2DpftA+I03qsZ60dT/DCoEWkpUzUG/IxYLbbw7xEk2r/QtXyh4J5EZ3K9bBfdhRxNepojbgYqmaqAtqVNIC3Bsv8P/UGApKhOlMUEm1CHpwpBny5om+qo8VvCFoAAlSpcb3lVwJWNmSzcBcxgaDRRrooLug56c1nGQNafVp1/Jp09SOitgByBldsUcb72spFz1QI39iQaH+f0jWZ5kxF0KgXqt3GuB5Zzsx1lAQNOuVczCF4ihDYcqEqmV8yvDLxHSbkShGAP64lCx9VsoOTAWXGrJfl5YXTI8tJHqGD0JMSbAq5xo+9fHSymxoq8Woz93+7tn0yKmorgmZUh0ECFFbM2WicnUJu3lmFeAHQ2Tntj6lY4fxnczO4SL6O/kyntSRLUN6Ki0BZBA7fiLNOLpFHsBir/3rukmyVeKGRSfrElOt4P1NG267w9EtSUinosnLQ1s0qIjAkccZtjYzD3fyK0OQBg3PDjzhMzmMlZnprS3CNg7cywwsBQ9IxpNjfEoaDd/LWJypPgK1CW5OtWBeTwy6dz6PAyDsbtKdSdW8voZ5SUHMgv+nis7wDPUiZuPGnx2hcU+1WyeWu+Ae1+vYOvQk0WHGCNSyo0wLo5YNIQ7h3qxl+CKb1miJ3+s5tYU0wG/YKLJKVViFgKC2qf69rCxCWaOS9UuqIUf8/0YzRbIXdCMWvU8P9HbDPMrTAXJuk7nDEy17kfWYw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?atHNCBBXDOROXWPS5zcgc3f0R3HY3bEt+CTR1nqsy9z8Jho2/4jzkULmG1Co?=
 =?us-ascii?Q?Z32Mbx1wTy+78qtPXsQ+vBdRCKZbiKXz34WX78zAZ+RQ2BPaU/BBcRsvPOmI?=
 =?us-ascii?Q?Zg3MruZwpyxYfdA4Jt1ShkeRwia9nr1hC75bOgkHB468o3oLIe12Jac4sh6I?=
 =?us-ascii?Q?mIkm9Y7sjlhTBn6cyxwQBvmNiPJ3e9wi+p0e3O/YQ7p1GGdUTkb6AJjRglrT?=
 =?us-ascii?Q?X2WuAMcD0WneFUpbQnJaJKpiT+K14HGgmP9LuvofdrPEB8BDNbCqx+VF7WAr?=
 =?us-ascii?Q?9ohWCUAZuoPq3XpwikH/8as9uaaWzrlaV8sACPD5hF6f8+Bul5yElAKZPZ2M?=
 =?us-ascii?Q?VRW/5026GC2GQSjbuRsbobAdyBdJ8leAGEs/xhqHvOueSnzkKJpyoUie4mY8?=
 =?us-ascii?Q?Di28pPIJxNvbhEOm1yU4YtnFEY8RswZyeNiD4m+N+F0MykDQDsGOIq3KcacP?=
 =?us-ascii?Q?7Zjn2s8KOYsW7iSD21FeN+MK0vo88af0IpXugEiCM0Hj/UmgbNBPKGgvQDAE?=
 =?us-ascii?Q?5qUHAqWYW1eQxvWYMNGTXwLfm5oTd5KhsttlrWWk6gsNYOkpJXbzOFLHR1qk?=
 =?us-ascii?Q?5zk7h5bNuCd6sGyzjeC5f8l391FAjo9OWhc1XNz7YhtZTGbn95O0KPkQKu16?=
 =?us-ascii?Q?zvAvWSMdnPX4W8iiFDaltTYkBcED59QKGsOLGV55lohZ0eA2fmbcAGOjkkFQ?=
 =?us-ascii?Q?+HILNfpIOfq9I87ieUSCSM8wv5WC0EX5yp82e0tryqIL3feoYJiFkYfkamdI?=
 =?us-ascii?Q?pSdKIWhrxeWoEO0oXg5ysPYvzMMIBRGo74plD6ikxb6Ocmfz/mgJpADQTGb/?=
 =?us-ascii?Q?pT3ZWXZxnvr3LW7j5QTJ9Gs3iFcJtmUjrno3uh53d4eQqPGRvVfVsTwX+i0h?=
 =?us-ascii?Q?b3q3ZlpLRl64obhzlET93L7/C+M85nZHpC7/qE/8V2HQO/pjSc+qAqJ1e1Y7?=
 =?us-ascii?Q?Meo9+yJ9/abahI1tCBbqUM1IF512R/pvJfTv9P78S0+IXmc4pa3f3ktl80MT?=
 =?us-ascii?Q?D8oebk+HeU4WBpDhOKe77YROcxsAg88MGguR9OO6dwVv3B0q4F/xOIwTpE/I?=
 =?us-ascii?Q?2pNH+OirtrFJvRmWjhgLZQD2EfE+fC1CqbHtLnHIrAJwQq/SZ3/men+L0uXf?=
 =?us-ascii?Q?1Cc3+onR+RviZSCIbIBqPTdwe13rO2xEcsQ8j9mpw2qFcExdZ7sEoIu+UW3q?=
 =?us-ascii?Q?rq3zsqhXzLgsoBoxGIf4gNJ8G9SEBu62emq2UkcjxXSnK0m6/a/lRug+t9jG?=
 =?us-ascii?Q?ZzY6A5WoovxJIs8az2dwHNAwhKula5sfBBbB1tIVOKtYLhLHfbl8NJS4COCY?=
 =?us-ascii?Q?Ay5USX4+HUG+up0/4VEfzVM/378ADcS8IQ0yZ5l6QO68kCGy/0mduGzvmEx4?=
 =?us-ascii?Q?zs6/9Gou9PZSDqHV4ByAbHF5w3Rob59QhaqiVdZEOZNQ0XTT8aIY6h7P/Vc3?=
 =?us-ascii?Q?YO6AI8NBKWSGgpW08RmeKpNQATpRa+zAcMCsNrJWkcIuFZDmhpf1EWFW4e7P?=
 =?us-ascii?Q?09OzjTZ5B8ukg1Z6bQLPQQIe5KpetaeK02Kh0VDsnPNuotRazXeGI8LoNsj/?=
 =?us-ascii?Q?EqgGebuDoat5WJAHf/KBtAlAC5mYULeldsjxqjCBJO2uupTNV/rZEkCWhsHr?=
 =?us-ascii?Q?VQzeIPJBYBYbTsduk9aC7WxFlnqcbJf2D+Pcyc41h7NBBRaxu17kp44ruDMf?=
 =?us-ascii?Q?43dWQpyMNtf66SINtB9e6hwwv4P1qih/QCjj1YWFynEky7VXbOP7tghqkHNe?=
 =?us-ascii?Q?Q+wjhMBlByaUHfzi9M4pB2lGrpwbsszXV/URTcBz2/dsOxJs7pTu?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c1604a-62c9-4c2f-8f54-08deaf018a8a
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 02:03:48.9053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8ssbxiam4OgEmjmWhwfdHNkbJ8315sK4ZkHousshaLrvlEHixV6v7LGatgxK2LgRg6kzN+Oh1A12sH7T76DUnfMg/OdkEoS8/Y9x8NNG2j7wE/1GjczQSTLGi8lvGNL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12110
X-Rspamd-Queue-Id: EB47B507198
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32331-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


Hi

> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Add helper functions for preparing and unpreparing FSI clocks.
> 
> These helpers centralize clock prepare/unprepare handling and
> will be used by subsequent patches to move clock management
> into sleepable contexts.
> 
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

[08/10] and [09/10] should be merged.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

