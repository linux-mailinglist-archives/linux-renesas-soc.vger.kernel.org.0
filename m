Return-Path: <linux-renesas-soc+bounces-34231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NWzXEVUBNWqplwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 10:44:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8F16A4AE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 10:44:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=aPhA16k8;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4090630027CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 08:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E53635DA55;
	Fri, 19 Jun 2026 08:40:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18A831E825;
	Fri, 19 Jun 2026 08:40:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858442; cv=fail; b=lZWFbGQEIwPSL4SQhOynO4n2ySw6Af0FZxWymTy4a9pT3yXs13Ve1DvcCP3tChQh25+0tb7G6O5aMSsauBFQZ9DepDgJ544inTAVJql91N9W7JxWWg0KBCYnkMWeBLtng0VakkRPkiF+oPtzMw1alQsyaegkOVF/9ZeByqw5xjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858442; c=relaxed/simple;
	bh=lXKN2Ed3ON4hcTg13BmGU4VzeyPn0Y3MgwGybIfeCIs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=j/wazFeULq39tKj+jJXMOGfKlRTapxJidDdwwiEGjTBgoX1gJ1mw8ooJNxXIFlmlCv/bX/Yi1Csnwc26hAoWJWeRRmrofV9Z5nIhY0yIfyKUK18D0bHt83qr0O9xIe2RCgiCFzQRonh3wz/BK6SWP2MiDqbDjvzkTLTnGUsmsSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aPhA16k8; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c17M+cySi24DTqXrr/AIIJRK6l7VP2hkzDFUquGW4jyIECAX5rUThNaAjjCpjnAKvDK5E3tv+4MweRn2JvtJq3m4YuPErE4MwYGB5iH8X66s1FWYvxHB9GOgomIFs0xDlP6WxA+IOoHMH+S8n8Gau8W/dwhP6arREqlgbpCy5MEu43Nx/sRw/Nx5BPRWHtNDeV88DlI8/DPsoXR+cTvn+OgjMKBXolnyDJl6sWX2X4CaiGs9lzegvKRMerPpWs7i7NLzhpXhc8i+1yK3B4Efwe5UB71qWSDPQFyaONKZMliJ+ogz9QfZGN5TDF616lyF6dvDAum19u5VW2zQhHH8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjzdTmLJhFRSnYSwxiBL+ygZNBBxe8YPPqKGiMWMrq0=;
 b=JV6h9XSzaO9BtXQoC0q82Ef0K4YFRqVtg2s0zYnoom7OcRbUcORUCpT6Ps4HNydK2zMRCvvnJZWLHk3MKLbbAejfPVgz56TAae/+qhyoumHAbGVDGkPTNdj86hnlVsdMeFQDawYwCLE5J+WZ2s8hShqQGyf8UwDDKZYj9zlTVXRH+tDCTYUJzNJPVGAN7I/HtjfmOKsfQS0o0ERE4MR6gnvYfBc0apCZOUMjk/qpwE1PPXWkbCOTBTGZnDIB6ThUihFNA+dEQD0faAJusdbe2MLylRLDSfmjha5BFRuXSWt5kKps9ToRY3fiwzDEEv9Y3956pV8b7bEHeO4WI7xGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjzdTmLJhFRSnYSwxiBL+ygZNBBxe8YPPqKGiMWMrq0=;
 b=aPhA16k8zZ3RWd+2l36vJmnObkxdYKwNbgtkckQZrmO/un9quHyhZQQ0jTXQyMnPw3LwA4/zQYSjVVUuTwl/ENdzAfG+n9yw5tRCMnBl+beqnTw3TFZ74U88KJ3iqfhzafGE1Z0awGNLzQN46+CbIwJfk4mgJufOhNHPpul9D0c=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB13920.jpnprd01.prod.outlook.com (2603:1096:405:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 08:40:37 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 08:40:37 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	john.madieu@gmail.com,
	biju.das.jz@bp.renesas.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 0/4] arm64: dts: renesas: Add RZ/G3E audio enablement
Date: Fri, 19 Jun 2026 08:39:47 +0000
Message-Id: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::20) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TY4PR01MB13920:EE_
X-MS-Office365-Filtering-Correlation-Id: 254ecc8d-f462-468d-6ced-08decdde6f4d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|18002099003|3023799007|38350700014|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	6AEvAAy45k517aKnTcHbd2VMYsYZsmiWhAt55DQzVdlVTIPSIvqhnfwoWmqesF98nGOuKIGlsqFchexKMdV+/LA7LBbWxPpL0Y7urVuuXw/ftCY7MLo7Hbg1yitePaHjQi8eupFdVY+A2UmskU+v3mQFzKzFayqFcb3WRg1K3jG/HTMr6AgEfeWhwVWtQHaEw7UdOMnlXn7z7O5Ri70DhhBAFfAKB+XzsujmahAUh3mUxVDcVNab4FRLlHowaI4ykurqACQPTn3r/yPUQx/ePIaUL1lbcPmKgqbIfoT482mROkg3AepVZFYCMLsOkWPl67x70RHFmKdgkP1xMn0M27CDRiGG3yD1gZGgfc0Uou96Qmi4GyGEVNb07LLJWaYVqegUt9gSqdgiyCJ02Zai+p9pgU2YFcpVlJVOfnrpkRUiERBs7+JuJ1ozerRKE2QLttOAlRuLNpZEvCPF3FKXtP2AHDuevNML/BF1QGox1ESxoO87F5vBxJzHYnowe6H+HfojKNXgdAf+gG2cmv2Khk8NK3BKT2h0gNEaSk6gQfjqKz1cipmert/QfVdNmL1VPEjKjmirJpbf6XNvQb+1ZDMwx54mPQaYmtsIXbcUKIvG5BelLI+NJqraGOVg7dF2GdncfMsZ1AWGn0ukcJ2RZLnIjtjCvsfKZ+UvRwEvKe+Vk4BEi6aGzmBgxjT8HAF6HhNPhDtR1MeZJO71dWbX5NVdmidP6jrz4y9LFGOXBgU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(18002099003)(3023799007)(38350700014)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SF5ykJaEGrSPtqgeZpXqyzQAYSCcLHbAZQjWTRcLG+r9a/AS157mTh03FV6U?=
 =?us-ascii?Q?jWSa3YUZ35phdrNNeRdrFKDFs2j5EAjF8CnKy7sJjc9R+Dve47bQQgqMowV4?=
 =?us-ascii?Q?ZaBheJ5qXhbj9kd5mpvLlwJcTgrNvzHwexOBGboFCJcOQRrLJIYThWxe3EbF?=
 =?us-ascii?Q?DXkp7GHHQXhqSEeDoEGTXZziPr03j9Tv88DAiZ9Ptfx+9VJY/dyoitljuMmD?=
 =?us-ascii?Q?4rQxXm0cnGnnoCJNtWFlz4evhpaFdrZMrj5kHT3Z635Oxtd6H+2dihtCz30o?=
 =?us-ascii?Q?bSdnUeyp8q9/tIryT2XFFDcEYQJRoA9eYWYDa37bDi2rBRvS+0tqb12OIpLB?=
 =?us-ascii?Q?J4gX/k1r3xcgmiquwy172V29L0iXaXC31onNgpzKikm3ugJyFM+AXHK0p8oG?=
 =?us-ascii?Q?jjnqVldbOVsQJ9QUs7SqvsbTQZClyb9cLesTX7VsVvvRWzkNCSpcQBsNR9L+?=
 =?us-ascii?Q?N1BtwLt4QRSz9HD8erVX0tezbk/w/VIzKKP2NJYLNC2TbSltl/Sr1KG0MmAo?=
 =?us-ascii?Q?rT8vm8LPnY4P2u0ZcR4ov+IZCQVyabkyR0kDXmEAJsfk9WPR1P+xmYhU+/9o?=
 =?us-ascii?Q?jSfEY9iFyIeArFZ72HOF2BK056HcYL0wwXhR88l+KHR1AwAHJF1w+Sj0xcXq?=
 =?us-ascii?Q?TSHCKOBIwV9w6CHLT3Sgg5CT/Y6GT+1GshOnZX5gjikQ/09ChHbxYd6gQvNJ?=
 =?us-ascii?Q?/PVoYKP4qw2kntJyy9f0V4fla3ttOoQ5Op5A2EH8ZNYsFpDjlcqZOtkbHu+k?=
 =?us-ascii?Q?fK1P4Eeywl9barZEb7LBx/D8cHUwASJZ28H5UyzOyv6lJDh28L6scwEZYU/Z?=
 =?us-ascii?Q?4Tfl/qk2jqOBf3/tR9VQVOAi9XTqYNWAGfLqndJGA8GRZR6FjmYoeCuEjvMB?=
 =?us-ascii?Q?xd73tmYHI+AISKkDmZOGi10199kWwCI04U2xph3WAaT25mSa3DMWVSw3gYsh?=
 =?us-ascii?Q?aFjp4Wi6RvPqsRvuW53KQ35m7aiyQkjjF+ZngM1xzlHBhe+89C0K92enF7Ed?=
 =?us-ascii?Q?qBgWekuUpPCGFUT1yDON/SzZ3Fu8BzevapYkXncILv2zxkZRKNC2MlBYzS1b?=
 =?us-ascii?Q?Eh/x0C050nr4FP6JQFhkBcri2i1AwhQ7S3eTpHi5R4whRngFqnR6G9lw3eKd?=
 =?us-ascii?Q?3X3kcROiGwcm+QQIqw9PffTF3XbDB2jN7E1xA+jH2SafjGSuv2KjCLhAiOtd?=
 =?us-ascii?Q?LLyEYCWC1Tlf/0ti5SVMHDD/Ema0p/nfYj6jI+2sancZsht3jqQaVP2F50AV?=
 =?us-ascii?Q?kKYGO4JY/7qSyTlh9EgIZvKiEKGvz4HOsZ3JdtEIb3LPGuMcstPYroy/cjNn?=
 =?us-ascii?Q?0bcxL6PLQSWKT8rgo1GuV9U6pUnzIpwRA05shwD79D02fjiZ1M6mw18PA4ks?=
 =?us-ascii?Q?ftuq4rgkkxLB34kTfBuIcy6pKEoh1zvmEnucgvJ/EimzkAYHAkmrnf8eDBo9?=
 =?us-ascii?Q?Mx+mwjAT56T79tE17sIDWfX0Dc519s6YWwOVsXmmvMb7XsP03ayNL1SiPTjN?=
 =?us-ascii?Q?kKrEa1fp8nBkwYMU0XI7KZX1ATptECtrrXmSid9r8kAKi/8uE1dpbgQi1gJB?=
 =?us-ascii?Q?Q65RfmTBxPMjs+LLBUrgdufO9sF6k7q59nXsGQtEfofOXkt5kN8sDJqlgZY2?=
 =?us-ascii?Q?TvkZeWUQPcYuGOlhNzLbrx1XC3QivRHdEjxySkqgUBrk99Bmxi/IWN93jxpL?=
 =?us-ascii?Q?kbIBCbvMxAMpNOPWYRw5ZK3GwcGypgXlcV0uwW+palyakmd6eCHauIJTsAFt?=
 =?us-ascii?Q?6ZJdbZdznDAL94ZezFRHy2lhNzEu9/w=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 254ecc8d-f462-468d-6ced-08decdde6f4d
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 08:40:37.1029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9I38DFM+d7ChqBj4udCuZxZ+6uR6/y2Cpij89KcRiOhhrus+NoJo0hPeh6x9X31dQhmT00EaIPJicTen2LtqVR7Zss9MjGj47xRnPLdKDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13920
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-34231-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:john.madieu.xa@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA8F16A4AE0

This is the remainder of the RZ/G3E audio enablement series. In v4, Geert
queued the clock and clock-input groundwork for v7.3, so it is not resent
here:

  - dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
    -> renesas-clk
  - clk: renesas: r9a09g047: Add audio clock and reset support
    -> renesas-clk
  - arm64: dts: renesas: rzv2h: Add audio clock inputs
    -> renesas-devel
  - arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
    -> renesas-devel

This series carries only the four patches that were reviewed but not
queued. The sound node in 1/4 references the audio module clocks and
resets added by the queued clk patches, so this series depends on the
renesas-clk queue and is based on renesas-devel for v7.3.

v6 is a single fix: the Versa3 patch (2/4) now actually drops the
unconnected DIFF2 output from assigned-clocks/assigned-clock-rates, which
in v5 was described in the commit message but left in the DTS. The other
three patches are unchanged from v5.

v5:
 - Resend only the four patches not queued for v7.3 (the four above are
   dropped from the series).
 - Sound node: hexadecimal module clock/reset numbers, lowercase 0x1f000
   SSI size, SCU reg extended to 0x20000 to cover the SCU DMAC, per-line
   clock/reset comments dropped.
 - Versa3: document DIFF1/Ethernet, intended to drop the unconnected
   DIFF2 output (the description was updated but the DTS still listed
   output 5; fixed in v6).
 - Pinmux: hyphenate node names, sort entries by GPIO number.
 - Codec: drop the unnecessary #address-cells/#size-cells on codec@1a
   (sashiko-bot); add Geert's Reviewed-by.

v4:
 - Link to v4 at [1]
 - Sound node: dotted clock/reset names moved to hyphenated form, legacy
   rcar_sound,* sub-nodes renamed to unprefixed ctu/dvc/mix/src/ssi/ssiu,
   clocks/resets reordered ascending, explanatory comment blocks dropped,
   dmas continuation lines aligned, commit message corrected (snd_rzg3e).
 - Versa3, pinmux, codec: no changes.

v3:
 - Sound node: commit description typo fix.
 - Versa3, pinmux, codec: no changes.

v2:
 - Sound node: drop the 2-cells specifier on the audio DMA assignment and
   stop updating DMAC #dma-cells.
 - Versa3, pinmux, codec: no changes.

[1] https://lore.kernel.org/r/20260525110603.4018170-1-john.madieu.xa@bp.renesas.com


John Madieu (4):
  arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
  arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
  arm64: dts: renesas: rzg3e-smarc-som: add audio pinmux definitions
  arm64: dts: renesas: r9a09g047e57-smarc: add DA7212 audio codec
    support

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 462 ++++++++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 112 +++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |  32 ++
 3 files changed, 606 insertions(+)

-- 
2.25.1


