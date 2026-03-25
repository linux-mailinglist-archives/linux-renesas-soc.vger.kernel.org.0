Return-Path: <linux-renesas-soc+bounces-30257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGhEOwIMxGk+vgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:23:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE99328E91
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3A5E3190FBB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E83B3E9F76;
	Wed, 25 Mar 2026 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YPIIY631"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5C03E9F75;
	Wed, 25 Mar 2026 15:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453763; cv=fail; b=Af1/FuBP+nxpfKbSnnG+nuIqtDzYe2whgGehykULR8dMq0oLsEvclrK0T1Zx/psoBCKPnQ3teTvTophpFXGLtPtI5E31GNV12eaLx/6NZ0xK6RDejzd98SPBW1i79X18SL8P6iUMjKWEOZ6sXnDYCHjs5R8gki7DaIhK2c6nv2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453763; c=relaxed/simple;
	bh=MryMxMvLcAPZBOd/5Va6WF+Wcm8GNp/exVbhZ9BHsUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=k2d7x9o5QRsJGXDD+qdKo509H5U7Z4Gdo9rIU9SYxT5oJld8b4oxcpjrm7OVezhIz4N5HH/PoFH8Oj6H93EejEiH5pMAD34kOIeQnlr6TZ3eWIQukN2apd47+2gkAzvW+G9zTmODVjlIGLUIAeZczZ8Kld6zvVRI80zHPCmR7Vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YPIIY631; arc=fail smtp.client-ip=40.107.162.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRd+UDnt8injBjbugjhz5pcnHP7XPHZGUVrkdGFgvzDm6iVnqTkzeDhNVXWyuGhMRafri1ADdRWVyXtxdWS1WL5z3Wjce04fwz0BXuTW0P7OccYT/9n1gEyy2qcw+4ws5ylYJlitjR0kqy2KZpbD6fzkV/7+VztcbhpVPh4w3MwuwxMMcT+mg3dCmVufjTvxxvyMrpJdKEzqnwbB6nBuL2cwYBPQ79Fti3qR5UtzW8clq3WCbbPZpSXhs5vBmRHYQ1/eBqHNyLr7Z5bCsUvMpXiAI0bPQPmkd8xWRtNP5O1OHkHQS5lolWXeVDpSfp25ozLiwATa5PXKWAjEUO94tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obPOlFUS+WG+TkjWehugzeuz6F2Iw5caH+wNnJYakJM=;
 b=Cq8hiZVHsg0BTuAzT5j00zRykKW4e2yAr6r6dc8iKU6m7a5LCpMVOe9HsmRSyFDZaRMEuBvDor+rO3B14vQZUzNQLbJqDwmNRZjqd8h1fXESJCjuhI6Qwfu8AsH8PCyAxkAoMAQMXnew2ox3qz/5NP1Tdip/12QRjZsv8yppLIlUCuSpJAHfVnxTIv31g3Z894HyL7TzMEuAUX7WUUCzjQxM3rBoFnSP2N9ZCnRv6f6bdZSTQKRP3JT3DGamGtd/1nd+Kk4oPhZhgpXWeugG3HNqfhYJrGJ/w1haGs0U1U/Z+8XRzsY6ZdeN1WnwFgrSqWkH6VIW0O/mKUYzUN/qkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obPOlFUS+WG+TkjWehugzeuz6F2Iw5caH+wNnJYakJM=;
 b=YPIIY631VA/iyHfIqSz7aBh9zdk9oB4eFR/gnUzV1DxBEkvv6Otw88zCUBbntdpxt4ZHgb4AlH9kLvzPxl/7+Rs0sjIF3jwY3vu4ZEK3ZRc/HaTlNmCYOOi7yYY/nYBMvxXWuAy1RMjVFhAXexF1RY1UxVYAzsvgqeQzwT8WaRLT6+C/W/VVCAAPwbpVhiYUW3hP6DW88JYo1JYqHc7MHzWYHt8iJJFDZAwufBxqZBgCLBiUbmAgiv5E4LlNfZGV9NJtzLJjj/8vQnh9wpt8tVH+IztfsBf81iwH92S5osqs/mJqP6T/aAyjy/pp/7MJhCAishUNebcRLmtfBuixtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7851.eurprd04.prod.outlook.com (2603:10a6:10:1e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 15:49:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:49:18 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux@ew.tq-group.com, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260316150535.786122-1-alexander.stein@ew.tq-group.com>
References: <20260316150535.786122-1-alexander.stein@ew.tq-group.com>
Subject: Re: (subset) [PATCH 1/3] dt: bindings: arm: add bindings for
 TQMa95xxLA
Message-Id: <177445375561.3113942.8957070044601441757.b4-ty@nxp.com>
Date: Wed, 25 Mar 2026 11:49:15 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SN7P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f45b578-c430-42e7-9d28-08de8a861310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|921020|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uk9Z+NKYl3HNjRS9zkmZF5Q1H9rHANnEldU/w+gYtqN6S4YOJbWA1qy//kaof8F6kn+HYsfwfiybWngI1P1AVwOAbswwWkaY3aWcmdNPFKyBeo7z+MET2sQsN784ceZDTm6xA7qqZ8N1hjyxcvXDOj2xd+qXzdsEoE/vXZ0ydjLS73lCKvvjw/Y65rL1OjJz92mqooHwM1kU+eEbdMaCTvkZHHy533q5YBO2+03PYmocUumnKBiBgi6/IuIK7zDb2b7IkXtEvr8AjsTU5ATh9aUdFoPeg7cc798D+Ou9znW5DbnhIUrBe4qKdxu/eBdk3Hyuve1aAF3a3iLqFOhrFKZwD6ILT+9XgyWtyg7sHxmmO4iIuPAb2LVJm0gEBxppgbA6lObVbT4B8dMAliAKe0foI9Wjqy1ejqxVuh9LYZXways6ikfsf7aPsKfKrLiKh8FU9nUn+jv+3sLCzXfi83v4Wi/pNUqbgZ58nEEyt2mn+2GIiZlYj+d/6OII+c4fh3vhtDQ14r1KK9gT0AVzOAt57yxoI5dUDgDvqSskIrFRO7ZYUhEV9Nncsw0XyO/el3KD9WnBF1QcObzgygOFBlTg8iKKYkpdprLO1CHhVXYQprbM/e4ILA2abuQDI2NLRSnQc/bdMCyx4dMdboUwreAwMKtI9mcFIEiwNBCmoz5DUBgzv5uFQ/ZonJT5cL/CeIFPZXJ8hh2WEU66eckdIEB074MyMAxQGQ3FXLZvCK/3e1n+gczNxz/QBGzioj3UcwNbl4gZyBj87Wuk4rIXQg+01YOosVdaoqs1zQa6pp03aKZFigb7XPioNClXSC8S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0ZaaWhHMWdhbmVUeVRLSHc3N0d2alQrNXpTME80Sjg4czMxVStua1B1MGNu?=
 =?utf-8?B?dkhZTjdQMmkra2g4L1NSU1plOXB3bXEra29WYTZkZi93NSswWDNEU3FRZ3lT?=
 =?utf-8?B?WjdKQ2w1eFBKdEdmMzh3RGtEZzBRb1pqaUhGQzdEU2tMYlo5eVpmVDZOM0s4?=
 =?utf-8?B?SkpxbkRwNkhRUVZvWVQ2NXQwekNOOW9QTlhTWDJZNVJtOVN3YlQxOGZrVU14?=
 =?utf-8?B?R1ppdnZiVTRNSzNNUEVwaW5zWG9hVXdnMU56eHFLYzNZQ2NzNFRqbm9sa2ZO?=
 =?utf-8?B?a0VNT3NnNElpOWJzTDBZMHZlMktlNURJTXlCaUs4dWhMaG9iaWlOVW8zVmlZ?=
 =?utf-8?B?RUYrSUdwbjREa3o1TGMxNUpDbWhZS0UxdW5mdGZMbkI3U05rdkpHenVVVFgx?=
 =?utf-8?B?U2M5R1VUU2NPdmxRMndrT3pKWFlrbVhLcXJXMXhQMmhoejQwKzFBSU1tZFFK?=
 =?utf-8?B?M3NxTzdaWlpScFV0S1cxQmthRXJBYmhLQ2JGQjhtN2pzVlAzMnQ0Rzh4Mldy?=
 =?utf-8?B?emdYb29XUGJtN1NDcGo1L1hHL1JGTHFwOERhdWJNc2wzdFRNNkphdURjTUp4?=
 =?utf-8?B?QUtDazNpTnRDSjY3M1IrLzlGMk5hUjFkWk5vbUc4MnR1a0hqTDRwblFlTTZH?=
 =?utf-8?B?MWdBZW5ydUsvcUhWcEY1WWI4MkpYdVBzb0NMaUFDRHB4Q2piR3NZV1JoY2tK?=
 =?utf-8?B?eFFQMFJiMEswaFNtT2IxRDRGeWEwdFY4cUwyRzYxU24ydUErOWtBVUpJdEZz?=
 =?utf-8?B?YlZOZk1KRjlNbjBWdjgwZFFNdTBXcDZWN0F0YXIvcUlIT0piUURsdFd4NE9w?=
 =?utf-8?B?UENIZkpXTUQ1bm81Nmhac0JmdnRtdEhqWmtmcXlMS096WURaT0tQRlJUTk1J?=
 =?utf-8?B?bGpEL08vYkVDaXlXWldDRTRpeVpxeFo5NGQ0Si9qTkNuMmlvV1ZVZDErYVR1?=
 =?utf-8?B?ZTRmclFrSzF5MkNISDVsWDhFa1I1Z2ZQcDdINlNUeVo4c3lKSlhPT2s5bHdv?=
 =?utf-8?B?eFZMSk9RUGZrRCtlOUY0WUpMR2VORDlYRFordE04MTNzU2Y2ODRMSmNvdkg5?=
 =?utf-8?B?Q2pZdkNKdzk4QlRnd0xJem44SzBVN2JUVEhkbndDUGxGZ29aTXkvdzd6dFpl?=
 =?utf-8?B?cnFFbytPWENzZnFJQ21vaytFenAvL2lIVHl0UUxBdGdQaXg0TThNa082MVUy?=
 =?utf-8?B?TEhXeGFkR3FmNk1vM3phNXZycTU4TTdMQWhnMWZkVjBPc3hzSU1ZbHFveUZR?=
 =?utf-8?B?YUdoRS92NTNMNitCTm5JaVJiQk5HYVRnRHpxdWZ5WHh2Z0xjelBBcW96TlUx?=
 =?utf-8?B?bFZ4ME5KNkFGWlpacTk0djFtL01qN3NGaDBMME9La1diQUw3aTRxQzVyM0Iv?=
 =?utf-8?B?V2NzRjNEM1BoNnEwRE01N1dtWm84dW40WWcveHM4QVVGR01mWHpQRjU1R045?=
 =?utf-8?B?SmxNVlVBQkNqdzY3YjZudHhzeUhWbmJBQkxmNEpNdUZZUGRla3JGOGY3dWVx?=
 =?utf-8?B?bjltWUZhWmFxTys2bmVVRzVJaFdDcHEwTUNUQmtRMWNOSk9hK0p4dXBid1Rm?=
 =?utf-8?B?SWtBaWpFYWdvRWFEY2V6ZmZWQXRDTk1CM0hpZ2syd3lvcjhUSGI0RUFldGtV?=
 =?utf-8?B?eHN2U3V3Rk9veG53bTRFL1VuS1RmN0VPK2NqbnhKZG55ZVlqWnZwQTJxQld0?=
 =?utf-8?B?L2QyUHhtUWo0Y2FXS0YxOGFrRFZKOFJ6eGQ3UDdzTTI1MzFvaWVwSUhlV1pV?=
 =?utf-8?B?VEJBZ1U5V2ViTFdPeXZFTGo3NEdUV28vbVpVYnNVQWEzcGNqMll0UnB6NE9Q?=
 =?utf-8?B?WmRmSTZuNU1wa2F3MS9SVThUVFYwdWdtMHI1eGJTZGR6dG5WY0VyU1VmZm1B?=
 =?utf-8?B?WXhyZWhxZS80azNTUk5sZnhYSnNOU1BKYjhnbzh2UFI1NnBEcTFIeFd1N1l6?=
 =?utf-8?B?RExNcVdnZGZzdEhJWHIrMkJXVlEycXB6MTQ4NlV1UGFoaVg4R08vWXZaOVVi?=
 =?utf-8?B?d3U0OHIvREdFQ09NNmJpWjB2YjduU0pLVlJOUE9DTGVIMUhlbTh2NVFrYjJm?=
 =?utf-8?B?Y1BoZ3gray9yOW84QVIzV1c4QldPR082M3k2SGkzamFkR0NzVVhPOUhPVm9o?=
 =?utf-8?B?YXNDVGV0cTZUcjJPcHVUbFoxTklNVWVRMWlnb2pPK0dRMHVhc0pVazFyYjBX?=
 =?utf-8?B?VmpFei9Qa3d3U1RSdDdFaCtIZDBEZVVhZ3VoNG50YjU4dkRqVmgxVG5yRktR?=
 =?utf-8?B?dTgvWndIbHcybUhEYVZMaEI1TXNpY0VzdzBvZFVlSkFLTFllUnFLVzVRWUl5?=
 =?utf-8?B?YXhiTk42bVRneGQ5Sy9ZRWNTTHFzZWRLMkVzR3pwMmZGR2drLzcwdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f45b578-c430-42e7-9d28-08de8a861310
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:49:18.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bU8Vngs39oxPp4RO3GvQQC2OIs7EuSacBJdqnLV8YVA3KoOfyt6H5ezdRfsecP2JQXI/poHzUgYKMiwYgBpx4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7851
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30257-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,glider.be,ew.tq-group.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tq-group.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 7FE99328E91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 16 Mar 2026 16:04:51 +0100, Alexander Stein wrote:
> TQMa95xxLA is a SOM using NXP i.MX95 CPU. MBa95xxCA is a carrier
> reference design / starter kit board.
> 
> [1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxla/
> 
> 

Applied, thanks!

[1/3] dt: bindings: arm: add bindings for TQMa95xxLA
      commit: 98e6e022858ee5845ee00f44b4805ca6b36e0388

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


