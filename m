Return-Path: <linux-renesas-soc+bounces-30958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB5NKS/31Wn4/gcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 08:35:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D053B79BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 08:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31E01300639E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 06:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58328364EB6;
	Wed,  8 Apr 2026 06:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Z/93l7r2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C8F365A0B;
	Wed,  8 Apr 2026 06:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775630030; cv=fail; b=phU0J59dW+DVAfz7FJwx79QK4WpW6C7j5aLiJW9icYPUcJXljrjcu4QyM32Tp2FAN2HJVbxy/sYMxoSRutQ719ZWqDHBzmCW9Qq8Qv/LSF7iywIuugng7OaOeJuTdt6Y3cMah5zK2YJCXDB3KaMmWXqjrZpbVkIUNTvjshgR3QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775630030; c=relaxed/simple;
	bh=x+67nq72DqRIH8Wpw0kALS97raw5cvU8vppLWjQanlc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MQ4guaqAK3XCFjPTc3BYzfp9WyFBhmw043qWUeTOdhqcmylXRBJChFHEapOvOngmNCNkKsKntOdml+rzB3GRvN6+m30mTUP81vD1XiGT4fUfjEFUm4/ePqVL7adEB8NpXUB18opWRoEys/jAZbejfQ/QjZfnOg11vIQOlOxeYuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Z/93l7r2; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHFT1i3LZpx4MCKZChlPHaIqUtqmxnLodfO06NQ9yJoxQhaLhNupdEOp6gE5HxlWkRgi/EVibBIYUM28uz23bvgH7s1UvZ9TYbD3Y3CXJx+KUjRwVLKJHRGN+Idpr0Dz7iChBr1xq2f3yHzpghjlwrQ1SPuH0g8uqbb/GfgTYqFc7ktdmstwfO+bsnh9ud45iR7Em2ITtXUCStFAcq/IAmg6v19oe/NhVIfgaa5fbXzR3QYjFiTnpn5kBXWO8dqWzFxFlN04akldUvl1KT5KPXs+RBla9GyS/s5KF2TNnhv4w+8FMgk2guj73VEu/L8igcCf5TNxCs9uX0YN1zW7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+67nq72DqRIH8Wpw0kALS97raw5cvU8vppLWjQanlc=;
 b=NH+Ya00xbl1WcYJq+JbC/9G9uS9AKHEe5pGYofUzX4pyUtsSLyznQSbMSlnms/c7rCudh7B9f5lLsBoey6bhL5I5mx8rPOqG4/LVHkG/iGT5UUmOvHLKQ0XiVFpPYxN42WphaUKoYAk526nqbq8yglwVa/7hJIsOY25XhIaLEn8JNKMRSkT66RN/n6Q69hlfU1cpWrezYe1wro7hdbmt/MeLn6jO8EzPIDKkfCYvv6SvuJFyjPZ7zHMfnDLw32E7/qQ6d9K0RmRat+2slY5MDtbhdQ1ROA9DfBxQ1Rs5YGv0vzT5ljnsrF/eiLad8CtAMky59Ppmf4hBrEAVbtTPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+67nq72DqRIH8Wpw0kALS97raw5cvU8vppLWjQanlc=;
 b=Z/93l7r2OM85ZCu8guhtZHSEEMdFLyJE3dlnCaXJwPumVmPi6+p+4E6lidIu2vT2LjmhYKzwtdBQr4VJqUVZUEzJWxBCcjnkicGySVV9g6CsJ9Vuu4e7UZdL6Z49G3w1LXapFRd2V0xbsV9ucp8cjNuA/1gZs6gsTdoRtNj+qUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB10113.jpnprd01.prod.outlook.com (2603:1096:400:1e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 06:33:37 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 06:33:37 +0000
Message-ID: <87fr56vu4f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
In-Reply-To: <CAABR9nH-1eBPFxtzVR6QBE1=esDN8x=hZpAkRSCO-TLmn0tRKA@mail.gmail.com>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
	<20260403112655.167593-4-phucduc.bui@gmail.com>
	<87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
	<CAABR9nGUyTkDmB0SgKAuM1Pp75L=m1q4bLSfhobm98TswDnt8w@mail.gmail.com>
	<87a4vfu0mz.wl-kuninori.morimoto.gx@renesas.com>
	<CAABR9nH-1eBPFxtzVR6QBE1=esDN8x=hZpAkRSCO-TLmn0tRKA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: quoted-printable
Date: Wed, 8 Apr 2026 06:33:37 +0000
X-ClientProxiedBy: TYWP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB10113:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efa1542-7c10-4831-2a66-08de9538c401
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nRx8vQOXSrSvankNGafIfisGsmukSbafuL2H+C/2SnScJ08zF77sJm+gvWJTlFzUmfs91X8VZ8oQwsuItodybLvcOMeAIcNBVIoRYUXDHqHnxPzxODM2ZZqQ27BAtfFe9n01nGdyFSGD5Anc+F9Lntz38S9LJ859C/VhD4b/dEQz7Z08b0nojStRnavlAY0c6mqbnVAkGAL9xLNqx88Y6e/W6AVZsZYkKzneDD/BTwge5PaBfODPeBIKbQWTup4B6rUEKXljUimsfdDV51l/7q6gbH3O2vll37Grjb/RNdz2lMlZTuFo1shRnZV1BYSVr2lvHyvmvn3aBFPUPWS9ygr1NzBAHaYxvUJO2C+r9EbzM7NknuMcA48lmThP8Cd3VwoPapJik/mFP5SHBDYuuNFBhe+d/ODCxfHatQnyUXZxrItHcAgYiKvBKDFGlSmJ33LiI81JUQwp2d2NYLCOjk56JM9ftRZaf0O8s6ZR+FdcTgT7HpdtLyjldo46dIKtCJ8v1Sxw+oMrWumnDCDcICXYDa+XpC4LkY3bJar9/L6Q/+hLAmXwKX6Guknx0d5m5NEpQj29tfuQtOi4DvsvBbUYhBVYJtSIoXrbzw/6rWgQwEawCVyhTXIHimbuRakyYO4nPsrh2VoGn/jD7mEW9fOF+3W344Ka/azXQNEcmTip400yB+0rYPjR8g+ZauBUE0rOTVIIHK7QFYbOsCs9RkSjEoNNv2WcKiMMyjCgXSYG+C9Z+IbX18cJcV0n2LOk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-7?Q?A3epAOyvqpCMf77eOfu/COwPgdfxyi+qfkOXXk4fpzZIS2lFRntKBrbUQH?=
 =?iso-8859-7?Q?ZjipBXhnovdxXZevLPWkM9IPadBvHe2+7IBMjIqRv7+buv3tz49I2tEHKf?=
 =?iso-8859-7?Q?bWyIkPeRJYiF9CeB/tEa18Cb9Y73jTiV2VcoVsqw70/MtB5L1IPsf67yLq?=
 =?iso-8859-7?Q?y7U9/xCkNoBJsBWvP7H7IbXO9YAWN2Km9XN0GgN7t7Tk6LAnxxpEv6fz/2?=
 =?iso-8859-7?Q?3OmXKL44fdwAPD9QcpdSDKG6z2bmI3fqR+FKtQbMOeyLJqAG3HKi37i/Ui?=
 =?iso-8859-7?Q?6gFBPCa8t1oczKbj9MmFnAZXczqelR98+A+vfP2gwJod2IEkth50bhPWi+?=
 =?iso-8859-7?Q?dxFpzxXm3nZMqu3+iAsHWQjKNPjGM3IH0XnD9uPd0XreBz4yhI9qXXL/Lg?=
 =?iso-8859-7?Q?d88s+Oqso8nN/A4hiBiwlTVSqqwuCt/kRz50z0i5dZxcnQNnZawd8De/Cg?=
 =?iso-8859-7?Q?BX2w2W/oJRmaguuuJ96uqB7/E3l8JufmQpiOCq7m/5WTNyl98p3Vb0kkWM?=
 =?iso-8859-7?Q?NrS4AH8OdWmQRjihvZ3bvSs/2G52yySRMDvWfkK8fQiVhAVIhpYujuGRM9?=
 =?iso-8859-7?Q?0nI3MHsj/tlZQWgnuq9y6Zast2tCf+TLHBH7++LvZnyhZchy84V55eJfhu?=
 =?iso-8859-7?Q?0h7FiFbUEcI3iJCQ8gMAr2qDlfqwt4NBbFtlnyDgyaMpaehNRn8O+fUv6f?=
 =?iso-8859-7?Q?tg7XXeO0ajqvyOT9MVLv9i8WpscIwphj+OSib0hgZaVqgkqZNB134hIqnD?=
 =?iso-8859-7?Q?PcDRgtzWHym2KoLiuaON8dRrQ2KIrNDurZVO05miZz5LWtDFrYjdnUzcQg?=
 =?iso-8859-7?Q?PQU37cIbJevKPIEHr+ujKCqmU1gKH/VSMqEHTEoiT2rImaI0IVxglPVBQg?=
 =?iso-8859-7?Q?p40HP6qjmjQe+bYcG9WzXBFmuBF0uSROU7vH+f9GGJOFlMLUOfA6so057U?=
 =?iso-8859-7?Q?NiXZ07s/onU0zuA6gdwNfADwnVveb8Ud3oyIHKU/+wVlsPxxPgbWQrTsRP?=
 =?iso-8859-7?Q?bWzUr/ifhZ1wNbBMcRHgmYmrs9YCSGWdkYYcpwgq4MVvjR7iqRai+sm6Ou?=
 =?iso-8859-7?Q?vIaTp45LIGYlat+ZnN9XOIFI0aaxCWLwLcREPAMVe28gtdnMbWUC0E0jyp?=
 =?iso-8859-7?Q?a4Ic2QzIYmqojqlapHkQsdOS7yyUWVCdpxB/qS6GGa2PeJkLqy4Obwx59U?=
 =?iso-8859-7?Q?zhJ087+XcNgX0d8UmQGJd+2w5D+Eifw0TFe8xTNDtn9c3jYVvMoaqqbzSP?=
 =?iso-8859-7?Q?sW4wU+u7RBplFjWdyKyG9PcwiuskMAVtYEzf5gUtANQc6WjmVsDv+xmxWv?=
 =?iso-8859-7?Q?8/tT0YNM7IYLY4sDgNEOsicuM4jyeRE7ukqOYz2xmxdNeo4Zk/VcAvXj0N?=
 =?iso-8859-7?Q?+limS58rClhRj+G1RFxFh+kzbezXCERD32b28QIj3ITQ1MRPTBMbVSdghW?=
 =?iso-8859-7?Q?GXulg1W0+9Ixz7oiGNjldz3SHtrfuvL78EvGuUgj0dM6VqkXr5A31M+nn0?=
 =?iso-8859-7?Q?sWpxLUv57VZLe0G0+E2OyXkq4m62OIWzdw9x6i1opkm6hiF6fp+DCM6oKT?=
 =?iso-8859-7?Q?ULWva7q0PkNcNQi14kSvJXQ1T+wOep+mRIM5TsRY9jvs9zg/6xDn0aBVX4?=
 =?iso-8859-7?Q?290TeNbOy1OVN0fl6jBlcjlg05/UwyPcO2QwD+nG5amDA0f64nf1YDy22p?=
 =?iso-8859-7?Q?lRQZQvaqHo95nPVTp9ZgNoQ82cS7t1gMHtz6tA/ZGqJmxxH5Ynke2jrOPa?=
 =?iso-8859-7?Q?Cjzt34vorgPDP5zlfMpQTZDjh0Ip/GVL7mFIPRshsfaxgySsqb9j6Bup6u?=
 =?iso-8859-7?Q?iuw0KLYK3Fl44TN/R7o1OZ79nbPNlaZAnreU+vv6RnsRGMsh7/mT?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efa1542-7c10-4831-2a66-08de9538c401
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 06:33:37.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SvCdiLeskcHRQmfs4UrQFf9Bx+fFR5xHPqD1baaGkiSN4zQzw12Xs4vqmTL1xxK9xq9cbk7ITn6Te+lrI8vC3ajGTWbE5302TKu9lFOLyMbdk/5F8vpgILJtmbZrRfx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10113
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30958-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url,renesas.com:dkim,renesas.com:mid]
X-Rspamd-Queue-Id: 34D053B79BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi Bui, Geert

> > Hmm... fsi_dai_trigger() seems strange.
> > It seems (A) stops clock, and (B) sets register after that.
> > Is this the reason why you get error ? I think (A) and (B) should be
> > reversed. The balance between SNDRV_PCM_TRIGGER_START, and with
> > __fsi_suspend() are also not good.
> > If so, can you use hw_start/stop() ?
>=20
> Thank you for the guidance. After reordering the sequence and moving the
> SPU power control to fsi_hw_start/shutdown, the system hang is now resolv=
ed.

Nice !

> By the way, I=A2d like to discuss the fsidiv clock handling.
> In the legacy implementation, it was handled here:
> https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/sh/clk/cpg.c.
> Currently, this has not been ported to the Common Clock Framework (CCF) f=
or
> R8A7740, and it resides in a different register range from the core CPG.
> For v2, would you prefer that I implement a small clock provider for
> fsidiv within
> the FSI driver, or should it be added under drivers/clk/renesas/?

I think it should be under drivers/clk/renesas, but Geert ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

