Return-Path: <linux-renesas-soc+bounces-31345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IFYDAuv4WkdwwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 05:54:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 805C5416B9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 05:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C75B300DE0D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 03:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DCD344020;
	Fri, 17 Apr 2026 03:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Kn9d49Io"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD60126C02;
	Fri, 17 Apr 2026 03:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776398020; cv=fail; b=nU+gvkVNXEwW5v4+ei6E4qChH0jaIEfCVfK4YgHOvipT9FKlhRqgGb0YoS0f3Bim8veUg4EcwhlUlWnKPsV0nsNKRAjXE7w9yZc66YSVcsZym3dsvEcmPYdgAK5SRmHh3tZIGPJwPZR9y/9mcrfp2xAJf/VyBuOk1GcfblHPpUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776398020; c=relaxed/simple;
	bh=DW8Kexo1fug/5AF9P7N4iTCQfn91avfc0Cj2IWGbUKI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=h4FGIf0NNa5jXDJ7DX7cqfFLsDsZczUmZ7Is1MVW6NSRpmKjUabDX9eoUELzd2/vRd+WJ/q5wTCQLelKN/5qgXIV7HEPFIgGjnRcb6hvY8DDTMQ6moA7VHfX2oCuRaP73X1JWqT5bWwOpEDEJIC2lva+icHELB2IwKDRU2yjSXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Kn9d49Io; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSKq/yVJh+tvNJAjoChWkQzkssq8tqkoNExNiBoQ4MxZ7OKxWx4uy8AClNDGIf1N/WQsfF6EZw6OZrvMsOCr0j0jd5gWwGuot750yQimUlA8aDfLEBntkC7pVd110pC9OtQHeSfOFEZzLva0+rWOX/EVPivN/n6q7rknOXsxDIoE+qgH7zHea9V3aOVXR354jSnJoxUy4Ur+47JDS1mAwX61YLk3+eObBpstFN7uZWFV5SNwRXqq14MUfPakPhMDKUFEwSTnvV1kfb0mcbftx2DOwY1T1/olpS9/4qnQjo1f2tVT2yUQw0H559sCnmG0osuJkhNtlLEBFieh5jn9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIwSPzdH/8zkAuUdxQEHPnwgzglo/OpO2pIw6BdzyZQ=;
 b=p+KyusKJXr7cmSJbnYFpUd57L9A2nfRGTJsWeUmPq5jwOXvpHEI4Cly/MPZyWLxAGC/ViZvZjmlmhZRYCgcJjOgDfrWuEbsTXLI8PdCG26KV47UJFE/vLUZj2q6G/GvlQ/tn+F9DK6B4wCQz8NOAOaECW92+n3fx1fnxSlmk/XETisbo3ccN12o+KlNuUODrYVsZjJtuWXuErpWlW8YMvPx4pg/eniQu5+l/3BMffrX7x2DiJKS8XP0qiJWQzs6+0JXdsZY/TXSIzovrLtsL3exjqCqolTmITUqT5EUh0uUumK5l4cZf4HpY+A8lLTu9V9opWKKJDuqnrk4ZcUS2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIwSPzdH/8zkAuUdxQEHPnwgzglo/OpO2pIw6BdzyZQ=;
 b=Kn9d49Io6UPs/QxLQnPJMaJbsBE59AXsKKKxcfxyXxOVB6Gh8K8dp8lBi66Zg496O6hCK2V9WoBThwN8fvrEcZuORUON2IIHD5x5ikWwHJV/jV1nXL1s59nUT51BeobheymET/WSJ48LhTc4rfHQCy9OyilKS7ayh8Q2DmTgs1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB8749.jpnprd01.prod.outlook.com (2603:1096:604:157::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 03:53:35 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 03:53:35 +0000
Message-ID: <87fr4uz1hd.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v5 12/14] ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
In-Reply-To: <20260415124731.3684773-13-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
	<20260415124731.3684773-13-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 17 Apr 2026 03:53:35 +0000
X-ClientProxiedBy: TYCP286CA0152.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB8749:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b3881d2-b5f2-4dde-8c26-08de9c34e678
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	uvyfKKVmlp8P8wb08Xqm2ZI7FFHIBHX61icFaNu0MO1AMOcA2Y7CwKPWDyv6UN5+2l335II2xQv/cTK3m8Av5XY6DKI2PTZmF8yuc+N3a1UGBD7in9uloZTQKAdPxdUN9Ga9rY7Sze+fQAsbCHmiQrAZMMt/ySKjoZkcn+SReqgpLaujmSq39tM6akpTAxwmsShDDnvHJbccrA+ummZ4vI/kPC81jH5wZo6PPyOY8/YJ3FpZAW/WavMzKagYUhcqF0iY+HtCZxAP2wjZvSRmi0uHMLhPt9qp9GQP2kNFFFJB4Yos3BM5TWoQujBPu1BZ38jY5D9t6Titp5ZajWznWmYhL1c6C9iTdNOm5iMEzlJ7Z9Fw2Ou6wZjMdGpi2oRAcl9S/r4pc9I2iXSDqx5Xnvbk68dvdWobGb4CzKRv2b8t2rvqnoDHPaUAl9TXvfHKsSMX7aphTz5PsKqu+bEXoW7phRGcy+KKn0Nrv5f6BXU7Wus831s3GKaQ4/gCgdD4NnAZNzt0pSmR6brSoYQ78uWoGLTSlCuJOh+LzkHPTMEFF2SvZHrr1ecxUCdcYtU9sXmBuCaGZbjSFeq3Xz5p0POUwRuprWqfAg3HWr4s6RDJ0Ob5ysUkHVdZPTkRbXg/9ixnZrwShCy1x6XoUFu7zBZC9J2Kk4BEHHb4z0DNEwgv0JOqiQB3NAAb07uSNfwvO3GlWYiw8AWaxMJcXG1jbC2k2hshldi2JhFlD66e58JMrT6XFKhDSM99C/Sf0Drl5WswACQnlFslPyUx2qUQLhE84a9q9Y+hegA/Y1bPGOk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JD5BI1cT3dJshkYIITNCvXPDqzLSY5pIVEWDYOof5EFO8QhiBTvt3sLJWPGt?=
 =?us-ascii?Q?kj4OH1+nc9yBvrNW/a5j/5slUmUtIPFc9OQ11CcRDKW7E8/HRODt9rICi++s?=
 =?us-ascii?Q?rAhLjNEBzy76WnDVcsuYuVEe3w1XTUDNxtFu52cmx9vE3FAWJ44SRf0zv/VL?=
 =?us-ascii?Q?t6biv8HuzPqXQNneb1T1f4F8WGQyeXVY5HzHr6v9MqUG7LDQKpZ70LjWxIhk?=
 =?us-ascii?Q?qDM7XGWbXZ7dBJ5uYYZJ5KP1aBaRT0cPXf4JFL9ahYO0HuxvPu+z5Za4JNQt?=
 =?us-ascii?Q?zwm06YClsui7USGt4xOKXrSQ17WJnmYZR6/QJKDxau5OKd526e7n5eivgIom?=
 =?us-ascii?Q?bN+fZgaeZyyDWR8NAoyjZXc9EOVbA3udLiP0uBNgTIF2pkSxwK+Lrewgxdzb?=
 =?us-ascii?Q?SkvKPznWBtZSHLOK6lwopeqcnXn1+LfiyH1Jd+ED2nlXvVdFEY3Bv4CC9DdQ?=
 =?us-ascii?Q?0U3rPI9vgSLAVLRiZKQ/I33XeNCYALuev7cHFlenV2/Oupieh9G9KRj4vFQ0?=
 =?us-ascii?Q?skbexIgRoBcMySnaVOW/1sr5Gqqq1yG1faWzoI5wCURZOeHNkS1HdxQYqWQX?=
 =?us-ascii?Q?kJPqsuJBzjb1irPzr9ROvgMrK5C9Zk3K8PQRML97ZHbyvxKqgE8J8EK4oQa0?=
 =?us-ascii?Q?j7aKt3WAGlJ9Ell2dNWLvz8wr7JnC1Ek6pLLIftcpVnw1UCyja736KN3n9U2?=
 =?us-ascii?Q?rKiigF9o0ZA79PtHXt1NeewL7Z+kH+/mP8b7+bl/+7QKR9Gj+ouS7AmgoY2n?=
 =?us-ascii?Q?vY4IhgIDorz93GK3jTQcS8rPPC5qfZ80Ovxu4gr9Q59HQcoyqK3+iLUvl51d?=
 =?us-ascii?Q?J9KUzAXrYWWyakEZWL5xj9TBsK1Gljcpk9gdMDkhn2uMsMg2yc5+AeGTfgw7?=
 =?us-ascii?Q?6ONIiCalE5+D6QYJ3kIj4xVzuE7K894i1x3jdeCeXItvnw5rc50+E5P4df6n?=
 =?us-ascii?Q?fTA4O4B9bNRvoeBOgJtDeZnXV/HtVSn4m0fAogbxsjpEkseELoI3YmcC+WbB?=
 =?us-ascii?Q?c1ONLKm+xZUQgWFaVcLdDjubY3ywb1v5wFaGiEUZEF4Z3+INtfJwlnLmjbAO?=
 =?us-ascii?Q?plcfWYBG2kI5RopuAOfE+wpSVJOdSeITjyP02vcOePemq6a7TvVCTOj7dYfv?=
 =?us-ascii?Q?1DdAymZhhAh1UCvbz4CGQJo+pDsWy5gl4OlUidvfujJQdLr8faZeqJDWkN1L?=
 =?us-ascii?Q?JPhepwGvSzjAtJ2IjpF5Shx90Ck78/G20oJlns5ZQPzSAklAk0QPl8vKvCS2?=
 =?us-ascii?Q?Xxuc4FfyC0GBqQfzzoqi+RZjkfq/s2RGZM9ZYZ9gkviU+zo52VyHBntY9gK5?=
 =?us-ascii?Q?OrgvaCjKK/mFnuqBWvnINumqr69x8yLpii5IuQ1ofB+k0ge7P7YzGfTtfrjZ?=
 =?us-ascii?Q?wADdVtQl5ovEeP98c00tYbqHtyY3imn8yq3ZggVakubcPMlyAt/Y6v1jJ5ji?=
 =?us-ascii?Q?dcZgXoJRq4hXJ5Q8QSY4EexYJAukU8qDGz8ZeCqWMKRwwh3zQI1Mo3K08f6r?=
 =?us-ascii?Q?XhLLCETCKOmJJNl8EhZGRRbfLEBlK2r6OWjEgCThO2BiCdg6uMq8esbVQqOD?=
 =?us-ascii?Q?AJIx3+zzrZBamPHw3/3ft+UZI6L89hZgghjr1hwNOPKDQ0rh+9HaTKK+F4mv?=
 =?us-ascii?Q?pBRLB7y/w/hGNvzP8f2k4/GhjbBHa+tuWFZlLiOiL6pn5/3y+BQp8+BFXrcf?=
 =?us-ascii?Q?HWdysqfeOiURFbGtqPAIuBahiT3U3D6YQRgmSKscbNs+dZj4bmwqhNSZnKki?=
 =?us-ascii?Q?Fv6j9XnDsogf4QTDpqDXnPx+uRUCjtgTS44ADHrbK0j4ZpUyq1nT?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3881d2-b5f2-4dde-8c26-08de9c34e678
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 03:53:35.3365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +et61FOuurxOvjH/BAscUsOnhe1Pov9/UNOueX6pfpckUkggX7hWiyQ8S1b4janQuLFTXWMZ2NYLVOpROQGazQz91zk1QEkrJzdGotyqtT8AtNa9V5e9nRaYDa+9Bovn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8749
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31345-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:dkim,renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 805C5416B9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

> The RZ/G3E SoC requires explicit SCU (Sampling Rate Converter Unit)
> reset and clock management unlike previous R-Car generations:
> 
> - scu_clk: SCU module clock
> - scu_clkx2: SCU double-rate clock
> - scu_supply_clk: SCU supply clock
> 
> Without these clocks enabled, the SRC module cannot operate on RZ/G3E.
> Add support for the shared SCU reset controller used by the SRC modules
> on the Renesas RZ/G3E SoC. All SRC instances are gated by the same "scu"
> reset line.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> +struct rsnd_src_ctrl {
> +	struct clk *scu;
> +	struct clk *scu_x2;
> +	struct clk *scu_supply;
> +};

I noticed that "scu_supply" is used in init/quit, but scu/scu_x2 are
enabled when probe time only ?
I guess this is because it is needed for whole SRC ?

If so, it need to count whole SRC user and enable/disable it when
1st/last user.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

