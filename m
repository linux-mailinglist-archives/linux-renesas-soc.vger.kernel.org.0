Return-Path: <linux-renesas-soc+bounces-31104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uxfYGBRb2GnJcQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 04:06:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AAD3D14FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 04:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 571C930143C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 02:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CBB32D45B;
	Fri, 10 Apr 2026 02:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jpe1/gd9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55DC18C332;
	Fri, 10 Apr 2026 02:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775786768; cv=fail; b=SPOqzNfHcpn4V5z4tuiFUwTp+Jep0B8VlhtIUclqloS6DjTCufJKYWopgL/tMOfu5fjCvinLFnNWuQk7ZOBsDpzoiU7tGgTKzbLk1m+OECLKG2WKR6deMgC3jRL7Kq0xtNeqCwQKiBUIe2v7FToTdkSrmLgAuoyNta31JofCipE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775786768; c=relaxed/simple;
	bh=Cz0HgH99Ci8TiGpy0o85M4a/wsgwkpFmbeTw9Kg7T5A=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=X7Mr/Qm5ZoLteUp07ZuFGwS58Vh5QCk8YjSoW1KslG3mapQ0bT7SHnNEWF2YdnNdKIfjzt4me8ugp1uNWh09Jm0L1qxhn0EVxpKY3HQwBToPPDaqzA/JDlppywnZlzyXDZJtW6hOYidIvA/owiaHA+Enl82RHhYIOcUOzZLtriE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jpe1/gd9; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDgw+5mVLFG8ZIYsTyPfXAYiiUkLCyC9S3VWy1u75rabjiFIZ0o7OrJv+1Xj3skadcuJNX9mvfwYVxeck/cxoIqc2z9KnDu4nbDppYLF6x09ZpPUXxjb8KscwEVAPJPVu8ccul/GaQPtlrQUvwNcvQfJLDqPIiMu5ACnUxPUvdSV2WS7vPRLmDAVhHSyGIrf/dKW8g1q2bT6XE8nXGAbXy7FnjmV5sc0C0d7/eDYQUoE+AtTAps8p4z5CfaYjAXQppFkppERc9icR9J3Bq6cuUN/j5IW+Lqaiwz/rTRVwmUV9IqQ6gnUCmaQIXlVoGy9dAa2c9JFRV2kHT4Zfwy2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHaVFnWVDyZdwBamE0IQkenSTcQeD6eWjG66p5/mgCg=;
 b=Gi/7vnUHko7V4MbGVxNEhODBpxKy6YXqDrYtRrpJ/oomrBxkLdVcLyk1Zbr601Nr8EsEeFaT19aHS+UYh5eKyDHTUDAcgZK0Ps7zo4Wap6bts8cnSM6+g+bwwFZPyf13J/PPptQM0ByWhhZsZ1qLo+Y/yPuMhTD9PHcAAXdLeVCnWvI/6HM7z17IS/FRco6wh30uXaxFlMY1D5N6s3JsPVS/WOE2MCkq1X+sok2HncgFpcvmBI3s2dHrwRCg4g6lxS+OZkvx2AS52bX/oNJvAX4sDOz1fdWah+XZK4asVzz8cDZMLzl+z3DFC8RYafv+wx1OJpj4L5tIO/opUcEC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHaVFnWVDyZdwBamE0IQkenSTcQeD6eWjG66p5/mgCg=;
 b=jpe1/gd9o/aNxomcfIVKPEut5jB/FMK5nCHoL4lieIYJUKY/HsIpoS6DHwXu4uKDmiszBnlYRuEqg6xzdOGQhA1OsJ3Nf5bnjTVXlFL76tJyputeKNOTNvABWoW3HcRgFOXpF1oekRNuXLk1R5AFhD6J5lph3ZpL8az0tsq91zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB8258.jpnprd01.prod.outlook.com (2603:1096:604:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.42; Fri, 10 Apr
 2026 02:06:04 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 02:06:04 +0000
Message-ID: <87pl47efhw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/12] ASoC: rsnd: Add RZ/G3E DMA address calculation support
In-Reply-To: <20260409090302.2243305-7-john.madieu.xa@bp.renesas.com>
References: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
	<20260409090302.2243305-7-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 10 Apr 2026 02:06:03 +0000
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b71839-48c3-4973-fba7-08de96a5b85c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Yu8xGhEdYGhYWNT/lt9ZSwmygpFSI/RWqEYXzEzoLb++TMkHFQeS22RWa1kxBLiJxvARL8/ajCEnhcjvucQzD0+/agTFeb6hBYt1YHoRcVr6B0ER32PRWiGXQdPQXCw5wx5sE68irG6UhYnKQiYjASqDFO8AmI/kozWP2PWniAX4xqgaMZUepAXr3zl8Pa9MqmH38pK/PcJEYhY87IIyXRiCPIjoFQHOC5hureINid12zIJIX7OzNRgb+k1blSUTjMFnyCnDgj8itbo5FoQ8OndfsS8MLTG+2iQzGM7L60jAIxPN4YLMM3ZGVz+JLAUpHU98kN8p9BWKprTcXErb5YFryG+yXW9tlVNyyw0OmxwBYA5Z+p/MQEEaAAfj/M616gfm5I2ovOLSuovqGtqqL8KpBfa8cfiK9n/QLHV9bNrcDLVEbtvamzXEP0zAEt34dAg8OvWEgRZMFXfqrmJlU4E6pmgWqFG19bxg5PaFk5lwZ9Zohh3w4Gj5NtyCohCaRo3WUMWQZfO5FXNYi+jE7uzOEJGdAB7jnbjwV3bK2vI+lESO/Ho3V96/jSjx0ZZCKrNQ1sFIp9XT10PcLjFOXyqKjzwgIkmZSL7uSpvnSlNc+MRn+ZHxku9Q6rrx2b3Kuo/4daJdoN9cF4UiEyV2jjc+ZqT4AEuGd1b+az+HG22sKuor7HU8gho7eSVKaPz70IwcwlxJDFLS8hX4tD9d4+1ZTdDLWTPVZj62X2Fu9dOLVs6TTQDqy3uSTRIhiav4eTbFruyg6JdCyppGZisuMHEcskXu7aQQjkMWh4s1Z+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jVGwLC6chHzhwT19mq2+7zySmMLt6nF6F3+CQyeMHs1US8QXAgko3+kBHDPJ?=
 =?us-ascii?Q?f746O3GLyB75ejQF+xj+rS9vx1baBx4nvEOj9LktyTBrZ+Nid5Uv2aPPbu17?=
 =?us-ascii?Q?GbTlusl1mjU1ioDg/vPhDp5ZKmoCaOy8fbjg3pGIfwUFdY8TrBI9ggOB8VvP?=
 =?us-ascii?Q?USMuj6RluhfllSUCz1MW2Jg3L/eItEjr21JgvZ7nwgwMHddCk4UuXsJgi/6U?=
 =?us-ascii?Q?qEq5UE5Qsfi3tJ0+LPWJ3m2ei+W0ElWnA/sXkBxOLpCR8kmo2QSr7E1u5/8G?=
 =?us-ascii?Q?rrVajUIkuon998Ky49c3qgwy/ofhd/2vAYu9ur8kArXgZUs2eAXPHktf2SsU?=
 =?us-ascii?Q?l8oT708cjr7/Nt57q5NKekQ1dRNBc/LOhlnxsby1Os6jqaLqexvIhM6EEgnp?=
 =?us-ascii?Q?viQ2uR+HWS+i8AEkWLQ/8XA/weDfM8JRdUPv1a/+JiYp40heL0phez5aMgCK?=
 =?us-ascii?Q?ECTLWtp0Q4u3/Vn3Y6/Xa9xk3WKlxW8wBUSIoDxfFM1aIWfFKFYLsfP3mTsN?=
 =?us-ascii?Q?yL4E629R3ZLyQqpIh4KTKxu2IHmBkE+imDQh7Ww6QcbVsbErKvw+N68Pu8q6?=
 =?us-ascii?Q?gK7ZLCzIXQWhv6Cuwln4PmMgAP/nfU3xI1oyTm5ZdQqQ8HsOss5ztYvrFcpN?=
 =?us-ascii?Q?4vphE6xboOadFae0FGkH2s5jlvSY1FoBLW1tql60/uPRD7VqYPzZS4q6Kf26?=
 =?us-ascii?Q?eFMa3YubdFkEWf3tFholDhUki57taWc0pgol400XFmPbi4kxd0/1tlI0Di/m?=
 =?us-ascii?Q?RuVfu+jFLKcgOA2ciDE3Zl255I5TTpVh5uzWuvAhsdCUmBqqKytKGCoMXY5F?=
 =?us-ascii?Q?XmFxPFljI8WDvT1a/kLixF+czIJm2SoUM87fP82OlqCCm1G5EBFe5vQobhTw?=
 =?us-ascii?Q?5wsNVMWvQdqar0Hv3/NzAM6TZcC1hUQezMHObDSVDJspZJUW12qa5FHfgdL4?=
 =?us-ascii?Q?aXdrlRd4JAB50Dy49QfFMA+eOB5Z62iI8PjlBAOm23GlkLf4HwwCt7HxFtqb?=
 =?us-ascii?Q?pdzAmYpqUVSmpFoPR2F6v0onUKkcjbNHkSkYYEsewMDzgNkRO2z5op55RQO0?=
 =?us-ascii?Q?G+gIxQhQwTGq7EA3AP4wuoy21Y7ZbnzxnT/AJ8GdImzSKkCMNzn4ZB7BEAYt?=
 =?us-ascii?Q?0kzDQbUegAJhaBwzcA+zDNVKlTnaAn5dAdqKCA1jv4ZPRdFkwk3tLtI8aOey?=
 =?us-ascii?Q?S4k4XLt5jzlh7Fe7e6/FlMQ7WXVJ76xqXvaBl7FLVi6r4EmuOFlzBFgNDB19?=
 =?us-ascii?Q?vR3JDqhTvhaLQpbhhdi0h1/DuZaCjibLQCE6B0ABmVOrI6HzGl0DUdCyKWl/?=
 =?us-ascii?Q?aEYxdFB8IObHPJU9E7+EPDdfrZOtl7i4EAXO9ap7KkpVVgujLBNppoZ3Ayfz?=
 =?us-ascii?Q?/oc/rRpJ5bnd3onN5nmzZUeb0PMek3wjqcoXl9DWLse7oT0vPpVp3qQLUTe7?=
 =?us-ascii?Q?57oGnVi3VLU3DwbUsDWlXa0uJV5OjrJGdj3PO6Gxuijx7XCOE93QZDHHSetL?=
 =?us-ascii?Q?R3sWffOy+7qe0KmQ2Q8jaHnDQS1Hzzg30+HISG61lJi0FeJ0QJfsBwnd8zWw?=
 =?us-ascii?Q?vykYPaqtxVGD2wIR84RCbUBoLfNDsSZRDF+zP0DR/qZdVCIDYnVVx5sFW4Hf?=
 =?us-ascii?Q?WbbAA7MCS0Opr39YLoDD9NkPspw38w+4Hk0m3uVJYLCi05mZpc9VJzesUCc7?=
 =?us-ascii?Q?hXqNQ4ygNBJD91s5kWjoMts3eR1/GvxtNBmKui8YtozR4GHOyeJ03LOn3buG?=
 =?us-ascii?Q?FvYvC/f9Jv9leP47TMQoL45u6n74vMuPFYnLyksUqrym/FRtvuBU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b71839-48c3-4973-fba7-08de96a5b85c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:06:04.2102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7x1gdbid2TY8/1lrwsOh0JMb4y8vUIdzkCwDVlDlH7MWiVdsb3UFp25ebcYSTWuYgW79uKS4g014WcX27Wic/52FDZNQg+23Qp9gzxdMvPaj3HZBDYrleVeNRLgAGb7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8258
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31104-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: C5AAD3D14FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

> RZ/G3E has different DMA register base addresses and offset
> calculations compared to R-Car platforms.
> 
> Add dedicated rsnd_rzg3e_dma_addr() function with dispatch from
> rsnd_dma_addr(), following the existing per-generation pattern.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> +struct rsnd_dma_addr {
> +	dma_addr_t out_addr;
> +	dma_addr_t in_addr;
> +};
> +
> +struct rsnd_dma_addr_dir {
> +	struct rsnd_dma_addr capture[3];
> +	struct rsnd_dma_addr playback[3];
> +};
> +
> +struct rsnd_dma_addr_map {
> +	struct rsnd_dma_addr_dir src;
> +	struct rsnd_dma_addr_dir ssi;
> +	struct rsnd_dma_addr_dir ssiu;
> +};
> +
> +static dma_addr_t
> +rsnd_dma_addr_lookup(struct rsnd_dai_stream *io,
> +		     struct rsnd_mod *mod,
> +		     struct rsnd_priv *priv,
> +		     const struct rsnd_dma_addr_map *map,
> +		     int is_play, int is_from)
> +{
> +	struct device *dev = rsnd_priv_to_dev(priv);
> +	int is_ssi = !!(rsnd_io_to_mod_ssi(io) == mod) ||
> +		     !!(rsnd_io_to_mod_ssiu(io) == mod);
> +	int use_src = !!rsnd_io_to_mod_src(io);
> +	int use_cmd = !!rsnd_io_to_mod_dvc(io) ||
> +		      !!rsnd_io_to_mod_mix(io) ||
> +		      !!rsnd_io_to_mod_ctu(io);
> +	int id = rsnd_mod_id(mod);
> +	const struct rsnd_dma_addr_dir *dir;
> +	const struct rsnd_dma_addr *addr;
> +
> +	/* it shouldn't happen */
> +	if (use_cmd && !use_src)
> +		dev_err(dev, "DVC is selected without SRC\n");
> +
> +	/* use SSIU or SSI? */
> +	if (is_ssi && rsnd_ssi_use_busif(io))
> +		is_ssi++;
> +
> +	dev_dbg(dev, "dma%d addr : is_ssi=%d use_src=%d use_cmd=%d\n",
> +		id, is_ssi, use_src, use_cmd);
> +
> +	switch (is_ssi) {
> +	case 2:
> +		dir = &map->ssiu;
> +		break;
> +	case 1:
> +		dir = &map->ssi;
> +		break;
> +	default:
> +		dir = &map->src;
> +		break;
> +	}
> +
> +	addr = is_play ? &dir->playback[use_src + use_cmd]
> +		       : &dir->capture[use_src + use_cmd];
> +
> +	return is_from ? addr->out_addr : addr->in_addr;
> +}

Thank you for adding new struct and look function !!
It is easy to read !

But I think exising gen2 map and new lookup should be done by separated
as preparation-patch. And add new RZ/G3E feature as new-patch.

>  /*
>   *		Common DMAC Interface
>   */
> @@ -499,7 +562,16 @@ static struct rsnd_mod_ops rsnd_dmapp_ops = {
>   *	SSIU: 0xec541000 / 0xec100000 / 0xec100000 / 0xec400000 / 0xec400000
>   *	SCU : 0xec500000 / 0xec000000 / 0xec004000 / 0xec300000 / 0xec304000
>   *	CMD : 0xec500000 /            / 0xec008000                0xec308000
> + *
> + *	ex) G3E case
> + *	      mod        / DMAC in    / DMAC out   / DMAC PP in / DMAC pp out
> + *	SSI : 0x13C31000 / 0x13C40000 / 0x13C40000
> + *	SSIU: 0x13C31000 / 0x13C40000 / 0x13C40000 / 0xEC400000 / 0xEC400000
> + *	SCU : 0x13C00000 / 0x13C10000 / 0x13C14000 / 0xEC300000 / 0xEC304000
> + *	CMD : 0x13C00000 /            / 0x13C18000                0xEC308000

This G3E comment should go-to at rzg3e_dma_addr(), not here

>  	if ((id == 9) && (busif >= 4))
> -		dev_err(dev, "This driver doesn't support SSI%d-%d, so far",
> -			id, busif);
> +		dev_err(dev,
> +			"This driver doesn't support SSI%d-%d, so far", id, busif);

What was changed ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

