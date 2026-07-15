Return-Path: <linux-renesas-soc+bounces-35233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vcbWG7LsVmoiDAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 04:13:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F070175A049
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 04:13:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b="c4a/+Cxf";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2647A300C0F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 02:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2C439CCEA;
	Wed, 15 Jul 2026 02:13:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5E932B13A;
	Wed, 15 Jul 2026 02:13:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784081582; cv=fail; b=ebSfJrpdkM7rCZxL8XNcF2kWReXTaKA1V5ScD2zf6DNpR2gz+UJfHcAH3V3BYZwj66+DRN0Tb54oCl6AS3TBvrePdbk4H5DMiSWFsgTds8b8NUdp60PXFK7x66cXezzwPxfZqnXxv3XAK9LAX03rgB5ZDaRU/l//p0+igAk+LDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784081582; c=relaxed/simple;
	bh=VQgGS0KakHKaVBrSfxegbjE6VTvAVfevndGMJg4jrRI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CnTzUuPJzP7ScRGSOvXDLKMNAm2+owoMF9j4nYWlpjFAZiIQHdUEUnRIfu1EmJcaCD+TetB72ndfU6mhXwyva701u0uqM5SNgqBX5wDISotePsOE/bWk2/40CAoTt+AbM6ZwD9OD1Raqyjb1r3k/3iqu9Y4jdW1EgJN9LhAtCSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=c4a/+Cxf; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtTrBL6MpU+wVYbE+Ou9xA+fUOPWeQtDIcYl8jf6bGJbu7NZlC8RBTFvgDptAOS5aT9iGAaayNajunSD31Sh8upaKC5RkbX4PrgsDdl3Yn7vivXf0zAOZerm/6Qum4EKDx91iMLVa0HNVq3j6QLznAbgP+xbNX44DTpy09S6x7ESQf2IYq3X7x3GlTdHAG4Myrctk3TtmPGdwpYSm86Jy/3ssaaLzuQorCFTWyDjw5M376MHMPZy0GZZK4i5kKnYHxDkTXD5GNSnwKBbk573z1wO7YnbcVd6jaWjsrNxbdHnjwmXgQxVHLoXp2RugcxUeUHyu4ykQrEa/BaFrV0Dsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slBEcapdktYEb6sGYj94lyX+1CDgqYzsjtGqO/v+qeE=;
 b=EWlkoiNwl3DVYIGalC1ZbgxyRQ2csbPnZxg9TbVjuJ3CKuoarC0MstPK1Fio5EItqbLgIasRemGbVRcr3rDBJqP7be6yBxMdSNvhUe/392Zg+uYMCl4URESDzhoEz3ipiC1MYJ3A7xqxiwV7186kcuYYL4I8uq/uVEIr75gMkT+ZeiIK9wUio9P0pHNa8GJOiU/KvSOyl4HJEvCo/+JqJCCt2gcWuxltk2QlVvecuvkYM1tOaf+HPWlBE1c0D9emtjmrmse6ksvo9OnYuaRGl/AGU+6BeLaS+ym0PxAPDJ1MJsyi/4VspwMSqZVy3uAa9IIi1psM59lXGZGmQhsj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slBEcapdktYEb6sGYj94lyX+1CDgqYzsjtGqO/v+qeE=;
 b=c4a/+Cxfj0N+zZBfNKiQpsqDikIRYMlCAyV9n6B2H5ZjTaSm1NBpLbTwYHvHUYSHGLAPF3erGJwQn2hZYzk2HbX4/VTnXJyFsZXvkj2qjME85ke1C3BulNIhCEL35WJV5W1Py6ONQqnvSZIYNVKw05G7kju70MSwvLvtE5t6RVA=
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB14253.jpnprd01.prod.outlook.com (2603:1096:405:21a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 02:12:57 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 02:12:57 +0000
Message-ID: <871pd52e6w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 08/12] ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()
In-Reply-To: <20260714103428.2318895-1-geert+renesas@glider.be>
References: <877bnexiyj.wl-kuninori.morimoto.gx@renesas.com>
	<20260714103428.2318895-1-geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Jul 2026 02:12:56 +0000
X-ClientProxiedBy: TY4P286CA0135.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB14253:EE_
X-MS-Office365-Filtering-Correlation-Id: df478005-294f-4877-fa9e-08dee216962b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|38350700014|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	fyDZwNd1TOeVOV3bM/LPuqE+kfW1iTUeAxhjWUAhsXXoWi2lR6rhkcOzUI3IPMNkodQ9ztVtDPzvsv+rOJI/+eMyM3mLFP1KcrlwzOdG7cBpJRRIAMwdcMvX0nTpgw0cJEO3ry3tLtM8pzf8XI18M0hpZycoyU2cPcpbHvv8uJZd1l2dAb5jcNP1voDGWJisqC8iyV4K5YKvfEPatdnrsgaHTKLsSgGLbZzyghrmWieI3zjx225DlBN7l15nTOAI8tvgS0WHc6iJbAUjOkmznGk6CHGX5hYUyA9GE9hfVtKDPytZxS/y6bgYZ26Zql3cvMVEfQnfBm/1EVqW/Rac1qHI63OZ/ChgqcYJCmS7g+S3yLSXAsj+GW8Q945BQF9mIDy7vpvFttSe4vE3317Zp3dK/GpkodOKkWPvJI+xDACQZ6EI3RtcVZ3ADD1Acetq0v0F7wcuqCRIx+4uShXfrMy+IzKw8s28Mrmz/qkM6dK0o1N3/SbKJKVVQ9s33wYWK6Dcs5kZd/y/dKOUiIJOcy7DQLikVayxovkNI5KzaiOh5rhm0hZw6VnxNhUwkirSyRxS5jk/UZwt2gkEsu1RTWyqKbjNovJmM05mvn5S2GZ3oV66R7MnQECohR3xLocGQP+PUad7/U01XMvNZPgDEvfvxYTgU7VGCWFd19pv4aRJEBUehUn88UBqydvXGoQvImS/SIygBhYfZwY5Yof5vQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(38350700014)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XfBo1fX3BJ5Cwh+pOPImkCbgMQWyyOMawFjnVtFCJ7R9ZLuggMb/MVdh30Oi?=
 =?us-ascii?Q?qFI2X/OOSmRWGa7GdsXC/uMy7fIqRFU1Z0OpdyNgNRIv/63zpmLxQ/gqDHVw?=
 =?us-ascii?Q?yCLLablKw2MrEYxhrkOCDqsSsmoLEF7sv/hy0DGPAjVfSdFkosr2G9fge3ez?=
 =?us-ascii?Q?fHEGKhryXuUvw07qoNF+FzIh8kyH4SqU6xqydUVIbTYQxZuA4/7yNTyAWKmL?=
 =?us-ascii?Q?9s0RXkpI6sZ4SXpgl0s/atx1fYl/r5JZnx6+p4O1BaBSKP6t+cqzYKO0F0rc?=
 =?us-ascii?Q?6sKBn05X2BKQwPtVcuov3vFgO8zsR7WHPjOyzLdyfyMB7ZHPOhfbTMZjcLN8?=
 =?us-ascii?Q?h0+Gp7oc2GSWKsH0xpvTU2e9F0TbK7YOjsJDWmFYgbfgRk64/R/VIfNdhjIr?=
 =?us-ascii?Q?oMkMhep048k7HBFbizKJur0kiDG+DhDNS8LsZkjmeZG0DtFHlATHEJMWjerV?=
 =?us-ascii?Q?P56xq7EMArUc8rNgkQ2OMPbfQVX/hgdIbvHn5jGUqoXYCaQscHzje72kavn4?=
 =?us-ascii?Q?4ywq9E4+jI3t2apdEPa5YMe4crIpYOYuWGE6KsGzTaFaCeymYQvFlCqHwogc?=
 =?us-ascii?Q?W5t5zUg8zP+gWC6zts51B2UywQNDZgxMB4ZL6pBdnIHwNjkN6A/Pk2uYSrRV?=
 =?us-ascii?Q?l+yO3zFoIcxiPJ3TZinBCOePO/Nft1XoNnmxC5lzEZH6HfOaclJt/03oCE3Y?=
 =?us-ascii?Q?BJJzJb/IoHw51XGEiz/h8yvSD2LcOzwZUEk22ApfBWTdaLx5F01mbH4Dg55g?=
 =?us-ascii?Q?TfplIqoEj4KsxDhjFaZyfyp5wx6Xl09FbwF9a37vKoqcBZZX1EuaZCdP+C8D?=
 =?us-ascii?Q?4w5QBs3iYJbxb6mFKhFmhQcJ+KV5ErEagNUyDkPQHeDy7rxKt2zadHTPGIOn?=
 =?us-ascii?Q?+axYIKwfb+CPZH8gyJQn5EcYqOMPnc/yXDtshAevP+YPgQ0oCJveHeNElxkw?=
 =?us-ascii?Q?AjIzLsudXV6tiNfgUizeprXWIOmIoWmbd3K1dVSyOttM5x9ZJtK2qFsIynSC?=
 =?us-ascii?Q?gz95DwUU33UM9aJYrqcxLQK7HNWbCfmU79M19bXgGwqNWyu1NZ9+iyoRUqJe?=
 =?us-ascii?Q?QupCwdnzUbeM52Cal3wqcnnCgLbzVpAEL0QNERs1utAL3FiyQXOJ6e1DzWbJ?=
 =?us-ascii?Q?MkDi/P7+/t2ncb6P/Dq2N++kYfHzb/ncY5fK1KQgWsDleoFySADklrgIC6y/?=
 =?us-ascii?Q?dITi/NIKxONLsxCygwYZ+RzZM5D9zUgRhX9AQDBbZQrEaIdvdJJLs/NB4dEj?=
 =?us-ascii?Q?p4q67krVe75xTkfF5j57Zaj+//VkshwFnhoivEeH8/xEZvGkxxljZ9I0N8Ia?=
 =?us-ascii?Q?kQld1GrKNjO0Qzg9f+BE4T1lS8YsIn/3gUivAZNDNyt3EsuPNMxz34eeVwbo?=
 =?us-ascii?Q?bYvfJ/u7CzRpbh2l+/EddCNQdBDF/HFffuF5lWqI7CRAO8+es2T+vTWAYKLE?=
 =?us-ascii?Q?xVZ9npwQjAGkm5rIc2g/UKfnM7c7G/yvQPMTKihu0Uai5nK38a3ifefhE/Tg?=
 =?us-ascii?Q?lTcqVUrEx1ziHmF3K8h9tl5mDP3qbvN9aYmsDZdVlK6B+v7bYJ0DMmQ2j+kV?=
 =?us-ascii?Q?x5O+5HItVIJENICLgkN6XzqgSvWljTokdxKuGU94T/5upWBxRulO3lD8dNID?=
 =?us-ascii?Q?QdLAO/iqCi+BHM8emNViqK7Hqhby/P5vpiIhzuedLN5GuGPPCPEDzFqaAwfb?=
 =?us-ascii?Q?sugTyQ4TiHYEJP8xJItbtnHU8G/yMcZ0aW88az7IvMiUrLNEIbWcOBvI8w/d?=
 =?us-ascii?Q?AX2/KM+NjjLzw+hzwvz+rfLZNFicPUU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df478005-294f-4877-fa9e-08dee216962b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 02:12:57.1324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKZwBoeOZWHMfYsOjjM04Omrh2mwlQT1+GpZHbtAxdrwMinchS7ZASpuYZc4GFLZNPCt3bcq5iOTEMITYUzJSC1+ZZtmu2na8TMl7YElGdTgh8PzPzFDrAw8jzWuCtKF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14253
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35233-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:broonie@kernel.org,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F070175A049


Hi Geert, Mark

Thank you for your report

> This breaks sound on Koelsch and RZ/Five:
> 
>     asoc-simple-card sound: error -EINVAL: parse error
>     asoc-simple-card sound: probe with driver asoc-simple-card failed with error -22
>     ...
>     ALSA device list:
>      No soundcards found.
(snip)
> All changed functions return zero, but the call to
> devm_snd_soc_register_card() below returns -EINVAL:

Grr, it was a pattern that fell outside my test cases.
... and Mark had pointed out it.

Please let me explain myself.

The reason was it didn't have card->name.
Card name setting function will try to set name by

	1. from "label" property
	2. from "name"  property
	3. from dai_link->name

My all test case have label (= 1), So my test didn't get damage :(
And, in case of Simple-Card, it call the function with PREFIX,
all 1/2/3 will fail.
In case of Audio-Graph-Card/Card2, it call the function without PREFIX,
it will get DT node name (= 2).

Anyway, I will send the fixup patch.


Thank you for your help !!

Best regards
---
Kuninori Morimoto

