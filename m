Return-Path: <linux-renesas-soc+bounces-34544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jt5KOcoAQ2q2MAoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 01:33:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9E96DF3E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 01:33:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=Eb0n96j1;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6913A3012BE5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 23:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B093CDBC3;
	Mon, 29 Jun 2026 23:33:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D0D3B6356;
	Mon, 29 Jun 2026 23:33:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782776008; cv=fail; b=aFjkPg27djRGzrWReKZfQVFHl8YkeNgRoVC1Z19t9INp9TdbP4VqqdR4d5QODh716gmG4SxDrBgMM6/oyBB4WCm6duBppX/5GfxFcmZs6agluaQ/D1b1rNg/8JpqZ2GtIe3S8H4iKBiipMfuNkNi0s8PX7t4cdCwE1S0VhWHU9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782776008; c=relaxed/simple;
	bh=w1CKPi41kOXvxF1mv5lnUxZXgjMyzux1/U8xhKx3If4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Y+e1gLJFbZjfXktvxrfu1L5HNNVMQFJfO9NLfY94itcm3ILhz85M84XXmaKF3sFgFLUVje1z3U6onbjY72T1wa9qI5kr9SC4zLlWZYA5JHXxCyA0NwD6ZFlbkTv4swSuZ43gA/No5Yvn8SJr3wWQLu/qFXB5Sc4FpJ6Sdw/FC6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Eb0n96j1; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfkhMmdXlLZ7N95Jxsj+fR0jgN+EVyv2P4NDSH0sBuIcblDDj8oEXgs3BjG7uH0Yqv90QNvoIoordtzTlhSHvPdHclabEEHExQfjjngRXmzgHylFcOqBxi3n5KWb2KbDdMfBiRXJEWgt4cggzu+hT5w7oVs/ah8dmBMJAmpKcucMTlsVZjgUio6hX43GiM56oGRY9xCYO4T93OE83GC/G8ZoDp3Qydk7zw6eGyEF6+fdO+l7lukFPlDluHbgPeOl6LHlrXP8sYdU4Nu1BKX5MiQmiiWTg6Qx7UEITRMawhMOxnkRXzlEFs7pyrjxYCaPT52X/BLh855oTV5teSiE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xqunn6QDBno5NLt7GfpuRu27TFjZBDyJ4Gyh2szXoVg=;
 b=GH4wMVUQ+gMB9g4hjRqrPlt1B9zYcvWWuaQ6fB+THwEOSPLI8JxnQ9j7ZJ7hVuHGd42GIAuKkbztj84k2ygwi26coDplB1xbScO9BqH4LODYiUlXpwSdGx1irfR5G+lPIEvtZ4pjcoQS2S2s4f4s0d0wjAvRV4tXYNkol7VV5K4jA2vwe41/o8HFTpvau/hNi00jx7g2gEsbkQo9y9hTHzTwSUA+LIcI1OF0KiYJF5SA7NDtxpxAEavwbXN7BDA+2tD6CNdqPDAXWiOE9wsGAC0FqiJEabWezFJp/fytHVOLY5SwU703IxNjXL/XjuWRPZg20QrtiF4cZqXCXjUREw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xqunn6QDBno5NLt7GfpuRu27TFjZBDyJ4Gyh2szXoVg=;
 b=Eb0n96j1Q7O42bh7E8F/ulJDSDdSa1pjpcyeYdACHKpZA5pd7e7ypRTbpIk8AlUEcaN+5VKeN4gPYmevbSh/PwKQrrRHzpCU+qeKhLqJd1448bhufDnxxLJP7yCPkTRFYtfMnlWkcpYQVmKAXtL4DfJ0HgD7QS2so8y6hIUs79s=
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB12976.jpnprd01.prod.outlook.com (2603:1096:405:1da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 23:33:22 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 23:33:22 +0000
Message-ID: <878q7wexc0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Cc: broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: renesas: fsi: Propagate platform_get_irq() errors
In-Reply-To: <20260629095326.37302-1-ahmisaranrao@gmail.com>
References: <20260629095326.37302-1-ahmisaranrao@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 Jun 2026 23:33:22 +0000
X-ClientProxiedBy: TYCPR01CA0144.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB12976:EE_
X-MS-Office365-Filtering-Correlation-Id: 4467184c-c9f4-4bea-afb3-08ded636cee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|11063799006|18002099003|22082099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	7lGasP3mWRudToJhTCnlGKFhEohCubfJ6ozupwga1gIUf3hTzoXy3xC9ieRZ8n5IDLa8O6BVp8Hjcs0TAkogveBWWvDoqdt588uYLDcru2tPBQxercnHwSiZMJs1HgVA8Sv8VQnYZOxkVUF0MvTFfxT9E7nRGG726v0tV3jnNZbHLLbz3Tq3qDioajjPMpEjUPqY5dKWDnbH4CxtV+zQgTsgxfSTngpugdVNQlvOqFJyM7aBj+OavWdrfFCgjTHE7knlTr/LL5N53aJRC4k1V3HfW1Cd+MGUG44t5WLo1MLbRtd609MlkVlZucAyj0KxEkujZ+Dmbmu1F01Bsc0aIDr+nOWu5QC9Tdr4DZGo8Ikh2YNE4NSwxaW6ejnj/R/A7syob1WghXYhmOFlzGuFL8w8OuD3HJLb4G4ca+Vjvs6tl62xDe1duXMyGK5P4b30GeZFseg4YpMmsrUbVVZ1R5Ne97rldTDjx4X1/Cz3FlHZTpkqBRzWgLXzBoukWqQepQz9pOCWgIH/+TG8l1cE8KpGGc4cLqPvFwe78jqjKFOKy0ipy1C0WMmep7WJSZ41U3EkEm2IsL835BerihSBBBijrxk6RolnE4md+dClfDTmGX6znqTaw8kp1KgFbQy6P6PmZmUNvkbch3z+ILiAfB4BZAL1asqXiuUqIG2sJ7tfoInHj9BisJE6BLmEFFl63k2Mb6NGaqbAug0mpl70Og==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(11063799006)(18002099003)(22082099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EXe5AgiW5s6xDBu2AI40zLHGozV56TUg5g5AL7xAuAWmFSdvMjxiBQNUl3OJ?=
 =?us-ascii?Q?72NwGfFnzUenoG4RKcbPbU8BoJIufllJ73wpJkyNA9DBCDts+WSM85E3aSBf?=
 =?us-ascii?Q?LykgwnJbwpRQQPHYlwh4W1JnCPT6CVqkERECPDFsKYtJ0quGqo+gYJ3CAly1?=
 =?us-ascii?Q?zYMD7A8X0/8dzG1YrephliBxArM0w76xgF8V/C5AIQS3d+TZbBRJfzZwMJMQ?=
 =?us-ascii?Q?Fa6P4FWmRR+E783cVrlP2SeyZ2c+R7oMYUzLHZVDs1N6sclgVzPYlyt8OjGK?=
 =?us-ascii?Q?trPZVeVA+ytRxEIGg/5otDULmW0zka8KijMydf1j+TjVyDnkbPDpGNO54lPQ?=
 =?us-ascii?Q?zKdaAfHskGokk0Dh56vgYDhGkDJt1/HUkP0yAtw5WDqXA7cGkWZoOepl4lcC?=
 =?us-ascii?Q?ARRNZkm3vXArKCoIzbMcltA5tW1RbzJwcj6mIkRplN3vds5Dk394nAGUWK7X?=
 =?us-ascii?Q?kwQhMsZ4lqZ2l93NGbCdlbXYkbxzd63EtpJ93ZcfuBhKi36OxeASTSCD17TU?=
 =?us-ascii?Q?UTjnyczpjB+aYsru5VFdyZWmwSFyZCrdNbInvtg6w7jCpdkjkbufls3dsLx3?=
 =?us-ascii?Q?wK+GYp0Fnq1MUme+OUX/iV90oAREmczyErGB4hvmFV6EpNiRSjUoOhrNLTkm?=
 =?us-ascii?Q?GOBdLW7aFMkILkqz4rhVEQFHHL8Xxp5qHZOAfMb+YLrrnr039JAbGpY80F05?=
 =?us-ascii?Q?/in7v6ai99Vl/ifJK2BxsGaWsl1Z4dz7M12kH5y4wu01nt9WUw2eDIUYYaOB?=
 =?us-ascii?Q?E4L9YIstSjkQjIxuUn3H3FvJVoJCCenDNWX/nW7+eihPqcfPyk8ydjmv538q?=
 =?us-ascii?Q?qEpzLsNhPJNUZCTrLjMdMI9BjT74bfDvK5exS3VR+AhAnRDPyeRb4YTjwzJ1?=
 =?us-ascii?Q?O8EqyRpw3gSXipcP9bkMJXkbnHGUH7OgA57hA3PgWvYzuO+IJutrbsHHcSIM?=
 =?us-ascii?Q?rQQqWpv7oB3aSUSo6JbZO82vq6WCA4O7hSwZqRFApn3JfpsOD0CTY18Jwx7i?=
 =?us-ascii?Q?4wjw7OrI55M923AZt5AIMh7umkdTuqMy6X4ENO/TEIjvZYDZr6iJA6Nzza0U?=
 =?us-ascii?Q?9ORovGffVfZI0MmXANs8gfgDLuLAH3eJjc7u0uy19s+CaMnhvepof10ao/GW?=
 =?us-ascii?Q?sRxl/z6Ho4PGT/IALRnQUhlQSVDsEwRG7oJN9U3TGk0BvHVhWWTsqMaW+d9R?=
 =?us-ascii?Q?q7Md5GICvsWXWKC/I62P/webhjANizt+xWGXXpqlqb2r/xIlb91FtCA0xxgE?=
 =?us-ascii?Q?0P/koRgrCLpXcazbUZOKrgzDPmK8lNLujs2r96GWx2AUElZuqHbTr8+dgF9r?=
 =?us-ascii?Q?27dZ/Bu6FfjVbzl03S2h7jLFrPyvuMobgUweq9S8KWFDgi1x8WaB8+JDY7CQ?=
 =?us-ascii?Q?j2lV1MwhJbwiVh6X+OYSCWbzNDbLdT7OcZ43Cauxyib1xThz6/fUIYOe0vSu?=
 =?us-ascii?Q?Ih1P6Wzog8i+HhnSqS7o4PPFGtXZ6J8sz3/O4gzFI4Vj4A6MOkQpNDP3ZlMW?=
 =?us-ascii?Q?fAsRxiaWkW/n0fz/pDRQ+Fmk7kVJgawcFCuvsMS1MN1CUmQCg8zXcNKQAGkA?=
 =?us-ascii?Q?Ejsyj4FhxVejNszjbLGTFp/eZYUyGa6Pv2PBaNrGvMBKHplk9Av8uZQM46R5?=
 =?us-ascii?Q?dhuFwgBjoC7BZew1YWllEDvfZJNYvBNzfCCBNyAo3QdmbQsf2sjoZaOmLNSR?=
 =?us-ascii?Q?sxqYN0ea6EBz9oZTvPLJgbaF/dGc5BAK5emVydulOTmT14dahXx7CR3WZOW7?=
 =?us-ascii?Q?tEG6YN6e7+fyEhViwlwYYjCDElq660e6vmR+vtJi5OgkzlWkJvza?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4467184c-c9f4-4bea-afb3-08ded636cee6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 23:33:22.2651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25DV3lal1wQxrfdhb/6n+pfNNh7M5y7ruLIy9xfi0Cn94uHq2xQItIHeb9K8aEWq2Qn5UIoYHcMr5DcBCFUudC7H/218NMe8ATsVBcCPRLJQ1pFHBu5J54o2qFPsZCDO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12976
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34544-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:ahmisaranrao@gmail.com,m:broonie@kernel.org,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D9E96DF3E2


Hi Narasimharao

> platform_get_irq() returns a negative error code on failure. The
> driver currently stores the return value in an unsigned int and returns
> -ENODEV for all failures, which loses useful errors such as
> -EPROBE_DEFER.
> 
> Store the IRQ in an int and return the error from platform_get_irq()
> directly.
> 
> Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto

