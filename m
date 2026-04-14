Return-Path: <linux-renesas-soc+bounces-31252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPcgFS6E3WmffAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 02:02:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4943F4567
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 02:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58EA7303CC0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 00:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9360D3C2E;
	Tue, 14 Apr 2026 00:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iSLScfiR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132A40DFAF;
	Tue, 14 Apr 2026 00:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776124971; cv=fail; b=dYxeyGn53fpEG2PUXb9uRw9QXKLjeAMiXeA9dyYjuSH9hVZdUbqyh0HBFMt23fPL+CqKnaZc1f6fCuR0m3tYMOlVzf502q6rbS3bhuIeUVQdg0WD9/N8uLg8Fk6zXgEPbJKR5Pk6McSyFj8/yo6bqe/SipjlRTR7TH2jihuXISs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776124971; c=relaxed/simple;
	bh=G+zEmypj0NHu5OvHnaeUsgsgTXFV4V3sKc3Yu836g3s=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MYOVrpi0sDNVKnMWvgXQrLX37EbwEQux0xRQA8YGX/5pYjtay4ZXopneGIhagY1AsrWKjI+RmCAjBYt1AxLQXkePUGFo7P69D65QM8fAX72DcCf9FcWsEIHfcjVHMa5oOKeARzo+cL8eqbX0hhO5WBuz7QeyHEto/4kGzvc2WuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iSLScfiR; arc=fail smtp.client-ip=52.101.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSQ/v1NLmrvEkMU1UkCDPxpsujSm+ILjIo8SznEYfUQFKPbTZpsZq9USM842RA8ZaM2cbdi82HWNhAD3Ky/yaUYH1nrPkupL4NY44e41mXrGP65kkHZ4U/ZLJy390/Lw5mPSwHbjTS9v1sJHUjQICnW+wCP1Ews09pqBQ1UrkUOt4W3eNxWbC6SYszLWDWIqrOcN7jWW8ORvheCHBYSwadJb2hMYejhv/gZA8o4nsNHG0pjCITQeOZ12q2N7A5PKEb7xrMxcqGX9kFfB+PnsDNS/H9YefUufOpvYy8zSK2Wy+0DmyI5q5+BMUT74u+iO2hi76AwGmFU7kf4bzGxDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stXeCLtkA9zlwkolwm0+MhTSrROhcTuJCP7buPUg9WQ=;
 b=K1xL9nrW33reRokHe04MfR64cYhS32/IGu96epdp54QCMgLfihqiIRTeWbYvk0KSXyjBMO3mjvFEM6zY0Yc69h5G/xgxl4NknrJiuVnM36xPpn10KkHhcmgGY20yHReA2XrGOdr+4jVC5grXsuOktiRJ6iCKBjlDtflw6lASkbmEhRPsGuyhtvje2SaEgc5hX5mwTUqOgMsfnfvo1C36yej+VQSAczWJkjawC2AA6kov9CSlG3OLLBtSi5C7x54v0RNupCR8/11vSw08nX+2Xm7TIpYmy8rIBOsVxClt23kZH1LufeVoP3KXUMW7gjI18ArkVKPI7PIsntNLUTGuyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stXeCLtkA9zlwkolwm0+MhTSrROhcTuJCP7buPUg9WQ=;
 b=iSLScfiRoUulRF7ZQUHq5mEpZlfwQuDL1pZd17IxcY+iYiZ2zvl2TRodEyA7WubN/DvNhaUR+4ozzFAdzeejIbF8sXXulrlw4kD23M7UR1+tnnnNKYtx7l3d6el7sfYcvrdD2jbIiTZOpnfiQRocOVepOTT0ppBAIN5RRc0mgGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB17555.jpnprd01.prod.outlook.com (2603:1096:405:34d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 00:02:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.044; Tue, 14 Apr 2026
 00:02:46 +0000
Message-ID: <87v7dupfx6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: phucduc.bui@gmail.com
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
Subject: Re: [PATCH v2 1/6] ASoC: renesas: fsi: Add shared SPU clock support
In-Reply-To: <20260413100700.30995-2-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
	<20260413100700.30995-2-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Apr 2026 00:02:46 +0000
X-ClientProxiedBy: OSTP286CA0035.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:224::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB17555:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ab2c76-6a06-4b2b-9c43-08de99b928ba
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Gb+YWDPreJdsbJ4RWBBqUjgtyG9AEd87BmDYsa1E4Z64WZPH/EqggSV4Y/Cm4dOUCCy1Be+DIxlnjO/7Pul30VCJyqTQN3beXpxzDY2dnNtDnjkHI16ojtwdtne7WpBYvLc5fKpEgxHT8OcbodYW8zm1+o1bXQ+5LCNuZcHo4J6Ql13TsrMq9cTDqiDzsZp3F4ib1ikXzMbB1tdZhpkULHt2R1ok/vOHpNWk7j7fwirKkRwkEedhNXdGhRBvdGXKG9SqgHaXW1y5PIVRYfVbc/qD2tk93/xCQ/+ZBP4hQPNK7aF7NXt8TSiGLyncOb68bgmtp+F0MNwXoq62R1VtmdOOQIbi2HDw+OqlgHKQQY2lBwUgzST0lkpgfnzxpwRXBxsJgcEphvJpNNYjgI4khKuLDeHDJceR27qb6Jo/p2z95Pdj6eLct41Lb6HXNWP9iLjdAk0brGYUqWqSvx6BRSjBoTArObyxLn7njSQVzDlEah5yfqMO4SEUDZMQLOrtjI1/qYJ0XA2Jd8+CdIgT0A5mQtWo4EsCsLsXxkDwU8XZDvc7j26rU1aBNpTLj+JXjuz7AJQwzMeAzm21+43mlJgwfv38B5gbRULurzLg2f5iBxib343mgeBETAwpf9VIsa1B1bWqVnFStN7xTVqx9RSVdZrBcv/snoqrGFPaccrFkaQ1i93H/xDGuATDfko1J1soH9BmdvTtSXk4zIA6nI1zJ07PcMqNxFzsmWc3JZFzG+jyDAA6mROXpm4dcWKqe4ZGNhUw25Tnv5fyczyGMI4shpkRQyhmNfb9P6jO/7k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XT6MnOtEkylTvn9LkeYJLScA+brnvkjxE3cOBC/w6H3RVNWz232qrH9gBvo+?=
 =?us-ascii?Q?aZUE9MCcHmFuniETusQ8zg3TtdOFODaLFSIuKHhprqpnsFF/q4cWj4nKw3j2?=
 =?us-ascii?Q?RedHqZDjOZdF3fPHDmEYvAKzeJJqWcTclt4hASpR0lWGKjUJGqcR2EXG/mIM?=
 =?us-ascii?Q?6eYinGCGIu6VsM/P3HNi2HdC+bbGp4m2+XfJ5BmPacsKPNy82c8FKpQnsVQ0?=
 =?us-ascii?Q?T0G3lfXpZN0y4hi7cG3lwVByBFWzzWusys4463+jeI5A4N7vd02X9zIrfTjW?=
 =?us-ascii?Q?T4PjQ8BbY2ntMa8uIcG5fCE9rA8+f/02+PdnyDbM3/8VWogszXY4mihWc2Yj?=
 =?us-ascii?Q?jay/o6THz04EhNNWOl7ZqQALh++UsYiqnjvkKH6DGHjlnm0PVmrcJ7uVLshB?=
 =?us-ascii?Q?3RHBlqkVkSyaSNe42gjsAn6Lm6M0LMcGRIGVy7i71QAqgaoderv6ZGPqsa7n?=
 =?us-ascii?Q?6nztgp7RFhQQFwRilzE4jgNd+ebZ+muA8Sja9zlqWNPSldOoVdOjAgKrDcJQ?=
 =?us-ascii?Q?6vISlhndoHRBVz8+HExs3K8SJi3BPBmvtkkb8ZXOoIsFakLANimYczjgHIuq?=
 =?us-ascii?Q?XyDkJwRaYm903nupfX5rv5rf+FtZD7nScO0Dg6QLVmSa9xandar5bwf3fbXK?=
 =?us-ascii?Q?lLDfuFeuZa+/t+8HD5w6hyyaDISds4xOq2M5OwDWv/xtkC3/oQalfML8jtVZ?=
 =?us-ascii?Q?MvwTAZqsQp17EW9kjYRfMUyptg9G/epaKUfEQakJMHw9ByNWGkgeCdkjmxhG?=
 =?us-ascii?Q?Vfpn9eUSsCV3OUBzMhILYAIjg2Zo3RR/S2q1kilRl6qs0tdXinx7/B3ybf1/?=
 =?us-ascii?Q?skrkyk2vBe/vr+le40eUxDdARYv9sqEQCxvjxlIHkK/76tdCj8dRcYZigFYe?=
 =?us-ascii?Q?+nytMTW+ApST5owdMIlBl13Xj3wsOCLZUgWG4VKY3Mxt4T9zaHHF2DlGqitW?=
 =?us-ascii?Q?1DfF56j49byUC0uKP+bf51n+k3X6mf0LwVmPBNTVRiAE7Xr+4tJhGaWqib+9?=
 =?us-ascii?Q?s48yQzml0k5bjkb+ExALRetvDrk7gG3G9qNjxK8Qy8qozdZGK+3mDke+Zl3J?=
 =?us-ascii?Q?JQ7LW64a4jxSHimBxeuBVuCV27o30PcPLXnakmmU442AuS9ok+TCw0BgPCj8?=
 =?us-ascii?Q?7pWky2xNZNz+UzFAo/a+Mq/vvVEsj6LZVskzrNX/ltCNXizBu5tS/wmT5JD0?=
 =?us-ascii?Q?NOac+25gLdNjFiiJgbkfcUJlQksft8bcKlf0e6o+PAkltIt7izcqyq+J86q8?=
 =?us-ascii?Q?h4L2Fq9DmpIvXmA4wY16douYnCrVUy80fJDA8P9BAU/bXX3CUHy8pc6tc7FC?=
 =?us-ascii?Q?s0Ysn96wbbdUOlZXzDNrjZCUQKfsj8yjBJKTAS0P8Fq3dkKYrPW2V3WIvu9A?=
 =?us-ascii?Q?gIY8ATGDcHFSzJBt5OmUPrRk3d8jBiQM5oMJAhG/DBPv5bJcySqCO4H58L67?=
 =?us-ascii?Q?FR5xleCMALK/lmuXaX7duXw+sbH3r2XcoEpWRlvdThqEtmOLtc/GHolI1X5U?=
 =?us-ascii?Q?gQHzBuMjKcmDLzsCjrWzjibCpjkUMypIqNh9Dm2M9skuCNbUyC7FuEmE5ZBN?=
 =?us-ascii?Q?G+p2hp4/DqhjNwQX249eKw+66J3qTA2jOKBa/BXPVIs0MUKvn8sirAcSDN6C?=
 =?us-ascii?Q?E4Fzwu7u5uGPNV1DpdHH0yu0wbkwhvIQzkfQET0GUH5yhxelGq2zR6HLT3mQ?=
 =?us-ascii?Q?UBOGsaG2MnPdR1Al/ClCX+ahmD5z1ZlBzMFcBLTx6PkMSK2idSpLHhw31hCX?=
 =?us-ascii?Q?yOGnx+1YRBulev6AaThUV5hbotvUT98P8u+wFfA12PzioaEniU44?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ab2c76-6a06-4b2b-9c43-08de99b928ba
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 00:02:46.6816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uml+tYO86y36RaULxsVbzeGXIXzE7PBAFqebgutFsimbZlX5mBjj6LPhLTq8SVB0SFxM33Zy/IwlfwfcXjdVDTCXnFHgN8xtAgcBIHPRN0ZbGahZrNQ9++WAcT34IBwQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17555
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
	TAGGED_FROM(0.00)[bounces-31252-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB4943F4567
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi

> Add SPU clock pointer, reference counter, and locking in fsi_master for
> shared FSIA/FSIB usage, and initialize them in fsi_probe().
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
(snip)
> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 1491c2f2cc96..196ec7bac33d 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -292,8 +292,11 @@ struct fsi_master {
>  	void __iomem *base;
>  	struct fsi_priv fsia;
>  	struct fsi_priv fsib;
> +	struct clk *clk_spu;
>  	const struct fsi_core *core;
> +	int spu_count;
>  	spinlock_t lock;
> +	struct mutex clk_lock;
>  };

You added clk_spu in this patch, but not touched.
When I checked whole patch-set, you initialize it at [4/6], but [2/6] is
using it. Maybe it works, but is strange.

The total patch orders are opposite, I think.
I think it can be...

As prepare

	- Fix trigger stop ordering
	- move fsi_clk_init()
	  - this just moves the function, no change

As adding new feature

	- remains

Thank you for your help !!

Best regards
---
Kuninori Morimoto

