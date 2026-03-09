Return-Path: <linux-renesas-soc+bounces-29065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKU8J3r+rmkxLQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 18:08:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDBC23D5D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 18:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AF0B30E6800
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 17:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D36D29B8D3;
	Mon,  9 Mar 2026 17:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h1jmq1G1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013022.outbound.protection.outlook.com [52.101.72.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08023291C33;
	Mon,  9 Mar 2026 17:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075739; cv=fail; b=swy2D4onjU5XYcM0qRhnvQoh3OzBORK7id5bWp80VLWdl3dU7+nQ/WPGVqVVmsHK4CVgM5rgbxJrrnCZND3Rue2NwTletL2rGFyf+s/fRDF+aUyTgKQt3UL9m+5M7LK+ICx6+b6DVcA/sK8dz4SbsgHQYuAuSEtlbXgDsnc7Qno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075739; c=relaxed/simple;
	bh=b3M+fKEJ4r5ngNznAm2LaIicdpbeGLpHPk+TyeSzdMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=bVOcpTR4NDEebK76Mf6kYrCNPF9Qp5wFDLMIKV58jfoq8RDaomCVZyi/DQP1bzfclhUFV7czSGJZZHMeHgeLIWloziUK1zhuMOmHt6ByNc8CvoEr1VyEYg1j4fIWv+YiBlophnoRPQIv19yhETUqmvy3EkGnVBnl9RTFIE0Urbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h1jmq1G1; arc=fail smtp.client-ip=52.101.72.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsSJ1XZu+2vTTuvTTD7N20OVROaZPwq6LDRZnFDpITDNg9Nr+vSY+vTOpRdnDAMRNiGTQrTNH0lQM7OQyCyJE3wZOCG80l4k290cAS/rw+4BoC+5aKZ317LCuFUPM/HXKzIHObjIbutLnpvbqCvqK9juegpTCXgTgc3Fum3hyf0+Kd52ERX5MbGLbsjmvinGgqgtOF9ormoRpOIDWL2hD4alNNG+S3TnLR25K9kmw7vGrajUDkcPfLUQ8mwfE+I/vNYMI0rwBFZfZ1Yud/yjZA6iE8goufQ73hhHvX+FKzQJa3X6WbHNBH46tA4gNbwf10wTStUbW2+0TRWy+QRXTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMcKaJMjkrwHjAfWfUK+mzgBMmOLu2X3b7oalWqVrzA=;
 b=MFKbmPfEQns4omC4007gRlOqyYn5BNqUT6Mo6DuJc28Fy9R5XWPVet9jPR9FVHu/pIN8eGfmDF4mfcwXf2fi7MTmkerUYpRh+iBLx0ByMm95dp6pV27ZMZm8i/r0AlG3hXTq5o4JSJQPmj3IZthebL8WgEeV0+Bd6tSXYebOJ2/Um3Nixg1Om3YBusHTsobP4TN80caW/TMIkq+kuLOz1UyszgH3gvgh7DVlyx6W0sx6INDXAXt4E/vhbOyvmQq1M1sSjAdi33vdzBHV2lZOoy59lVXQogsbIQnW1nRYTTWwfr8JddeYXqNMjOsxn9vJPLaOh27q3ZXAuogxKrxejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMcKaJMjkrwHjAfWfUK+mzgBMmOLu2X3b7oalWqVrzA=;
 b=h1jmq1G1aL1NKZqzYnyGFlj2qZDJxAWyZRJDeF40W3qEFH2hM6iUXbXAzQujbXxaFb5BvJL8zRLty+NE8Fn6ictKZJvcxe88dwFT4i1sPDB2XMW0+Z5/OEkoiH0HfdsdIjCRkh5vivl+dfKdoHdwsYDdMqXwbNn3BtfjK7vh73TNNyJVzbUv7aQk101JJM3pg1+dzN7+wTwrHlGcIJB90cpd/49rgdRHdLOjSNLTV7AOtzLm9DUDX93Les3426E2+Qd/zayuO8p/2dhlWp03/4fNW2+LjdwbTnlfWXvCljRCyfwDhL+oB2C+i0/IUdyOH4DL9O3EwX052cFoNG0YWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB12436.eurprd04.prod.outlook.com (2603:10a6:150:343::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 17:02:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 17:02:14 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
 Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marex@denx.de>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
In-Reply-To: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
Subject: Re: (subset) [PATCH v3 0/5] Support TQMa8QM
Message-Id: <177307572849.1725457.14336744713058252439.b4-ty@nxp.com>
Date: Mon, 09 Mar 2026 13:02:08 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH7PR17CA0058.namprd17.prod.outlook.com
 (2603:10b6:510:325::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB12436:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ee4612-6937-4c31-2d7e-08de7dfd9c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	+Y6DCsmDK6Mwe+swq7smm3ratciacXuvvpR02Y3HsDlqt6aJLuStBDMAqIZeVhfr1r0D8g6Oa1BozXIGB/mF3t9R7r/zK3BCDAnSYsYzlmr2yIRifqTHb4hb1vu15gIe4tE6LvVALAHWAmFtL+bbu8TQaDRU66q7mJvW8X096pCVDKDNBxgLMPuggm5TeQ/W6mtFGoKeCPh/uOxCK3U4Q1Z5PTr/Y6RA4iisso0uG1E4oMuZmk5Lq7XdRO/3yHXtCuURXm68RRFbMJl85pFt2nTbPW3+MSWQfB3OekYcMwDooSa9QBYGtelEQQypjr3SY2ptEl/gU6QtglhIK46XZ9vWJvzXVGVbRFPWaB2YCctcprML62UMCG6Yz643cB1R71/0LcIGXkCR6F6b3jH9MwweFfoNtljaJvEQ/yRCmZPwpOeKTuHAkxUqoSIHQn4ye8c3TvneaKojxuHc6L5vVUojGvxQ14WINbN9yYcfl0lLJU2GtKyFTjA5nkGokHFgEUuC2wqjF9Wh2KsqK7qKaAps3k0fuDKJFRSvchJtCcpRZmIVN8Ii5D0LEUdC3STx2Y/b2m5P/jhNxbsAsNJVxkf+sEjKA4HfWpXa/O/eknephTcfzcZ3kYVbu9CfCydFMDEup6wePrc7k0kN/QLbxQutIPAxtyyJfPIyiftayJc1T/M8s0YMh+xiuOcwhRknRROXI/Kf3fgeov9sVEQdS9lcYPRc19HTwDXT+KyMoQK73UWW+1LLikKiLwzOXsygJw2LF9aW1D/0BrAjgripwsiNc7NNelF0wJHizgvSk/++rsW++NWwO4AynBy3LXe1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFZMUGZPa2V4WnJSc2J3OGNuVW4zejlyR2VqMWQ4czBUL21rdjhjYlNvalVv?=
 =?utf-8?B?ejNaMXRuUTVoUWhvYVBGNmh3OXFJNG9laDdvbHhkOUx5SjVjTEFNdFZoNEN5?=
 =?utf-8?B?ZU5NVlp6enRmbnVUOVk4MytLVEZMUFBSWUozOTAxc1BZUDlyeCtaNk9MRnNj?=
 =?utf-8?B?VVJMeXJoUytGbS9VcEYycjNyWDltZDZDQk4xUjFGTEFybkNmelQrS1lkcjc1?=
 =?utf-8?B?c1ZhUjJHUTBza3NURmZWOU5GT1d1ZitrVW9jRU1KRGRIcW1JSGE2NHUzNWRP?=
 =?utf-8?B?NFJKVzNma1pxQW9QMFhiSkI1dC9tWTVFblhsQmJYOERPVTk2elUyQUhxR2E2?=
 =?utf-8?B?aVNnV0FKV09MTDBuWnovcVhWKzFjQVI1TGZZRmVyRGVhdHV5ZExWeEQ5V0xx?=
 =?utf-8?B?QzdBdlNqNzFMQkZrcnRjWFcvb2lSQnRCa3IvUGdBWmFGcGdUL09peHlVQ2Js?=
 =?utf-8?B?OUpHL1ZGeWdGQVNNdHVHdjJnUmxrRHVYWTVCSXZuakdQTlk4bUp2ajZSUkZm?=
 =?utf-8?B?VjFSRnUrVm5rVU5TZ29Vc0F2QTJtS0tZUUJHSjlwWFNSM3hvaHNMTFNEcytF?=
 =?utf-8?B?bWpWTU5oR3ZqZERYbkp0aUp2Q3h3Mk1tQS8wWGRnNWJUOHZ0YzYwZlhjZkR4?=
 =?utf-8?B?TWR4M3QzYUp3azFaTTBJb3ZoclVmNkpqZnZVZ3N2QWQzbGxWU3NJOXVta2FV?=
 =?utf-8?B?MFlkZk90aGxDYWR0Y0ptd3YxSWtxTVpZQWROc1NOWm1ZZXBJYVJ1SGV0K1Z2?=
 =?utf-8?B?aldBUzJleS8xcDdseXJpSGlFRmxGRGNNWjFzd1RTUDZiVWRDeldZdy83UW5I?=
 =?utf-8?B?TS9sbC9pZytKUWxpMGtXeEpTTnhlMm9FRnFuQm5xZ2hKZFBWa09SOCt6YlVu?=
 =?utf-8?B?c0tpVk8xS0JsZmxVZTErd3poOXdObGEvSmVjNWZjZmZUUFQxUzZ2a2FqMm1h?=
 =?utf-8?B?SGIrc2J4RVR3cVJSb1k2dktibXp6dFNzNXFmeHNDMy9ZVVdscE1QU2xEUS9Q?=
 =?utf-8?B?S0ltNWw1Tk9VZ0JtODVERGVkNlk5bityd1ZrNFhCUjAzbnViYTVaQVF1QzFj?=
 =?utf-8?B?YTYvMWhrVU44Z0hkSHhkTlNRMVpaUjIxZ2hvYWprQXJ4KzJ1ZFh0L1BKUnhB?=
 =?utf-8?B?c01QbHZ1aVQrWm9RcmlLWU5VR0hOY2ZTMlJkR2dFK3N4Mm1ERFpncEFUOWs1?=
 =?utf-8?B?S005TklTRjNTSzdTNmJrUmlwajBMNDhvUUZZRC9ib2JiTVg2UTUzSUFIV011?=
 =?utf-8?B?c29tTVlvVGxKRVE3YytIL3pjMUdyVUUyYWxqNS9NRy9UaW9mN040ajc2bS9m?=
 =?utf-8?B?aWF3SnRVT3lWWFRXbGgreXVsaTlhL1RDcFVxZjlVN095MFVaVEhFOTM5bnNV?=
 =?utf-8?B?WlR2YjF1dUpySkNuT1hYb0ZoQ2gyWEpaQ01ZT2c5VVdjQVZ5TzhyaFVqKzN2?=
 =?utf-8?B?Szl4c09TQXowbU1BOUd0TS9CZzdFZ052bGk3dmJXV21DQ0RRQllCMXJ1WlJY?=
 =?utf-8?B?djBBSkcrNWVvQURpSkI4NUs0WUloVjl3MnB6NU54Ump0NFNMa0dUNmt3QzRu?=
 =?utf-8?B?K2hDL3BqN0xHVVF1VDc5WGRDRVU2STVHOHdyb0lhdkE0bkFFSW03alRFTUw4?=
 =?utf-8?B?c3d1aHJleXRXSmNuRE1VSFdrOWVzdkk0bGxrMW82UFk3RGFoaDZJYXVNUjVU?=
 =?utf-8?B?eGFKbGVGcHFSZFBpN0VuMlFQdTlwSkNCaFZRenFpVGRCY0Y1RWdNaXh5eWUz?=
 =?utf-8?B?QVdtOWF4dDlCU2J1MXJEWmJMelJmWkF3dk1iN205TWF3K1ZWNmkrMFdmK0c1?=
 =?utf-8?B?RDhnSk5VT2xxQisvUVlsRW1ReTI4NGpHcWtQdGtBU2FCYXhDeThUU0twdWU4?=
 =?utf-8?B?b0doV2hEc2pOOS9kc2x0NW54RUZKNWZuUll4VS9mcTFualdTTHdrZGo1dnd1?=
 =?utf-8?B?eWNhSFViWW1NeCt0N1huZjNLTlJoaVVOZzBKcFJUN21YVzBub0dFMDd6dEZX?=
 =?utf-8?B?WFBuTW1sVGNHVW9BNVJNNFVUUU8weHF4N0piM2FPYk4xblJyMFdoVk1vYkth?=
 =?utf-8?B?MjBMaHNtazlVQmdxQVN1RHZ0UHg2VjBkdDRwbVRERkk4SjhDQlNnbUQzSUZi?=
 =?utf-8?B?RlZhdERjNUp3ZEk2SU9LYzBwd2V1blR0Z01mU1BTRXFpMnZrVGdabnNwWUk2?=
 =?utf-8?B?b2ZCVzZKSWcwY0t2QUFUTmpQSXVFWmtaUUp1MWgxQ0RyNHpZNmthRjUwQVdh?=
 =?utf-8?B?QWFGczUyekFzcFh1UC9rSmZlUk9TWUIvVm1FRUIvTlhoUEkyMFBpNGl5TUJo?=
 =?utf-8?Q?NbN1i4ajEdbd+8pwrc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ee4612-6937-4c31-2d7e-08de7dfd9c4f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:02:13.9615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJGnQVv/60nTxUWY7Dg54XzopuRX8Yd64ut73Hlojq5lHsvA2+azrjk5v/305vLd4Ad7yQdRhYKqFJzcFp9Z2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12436
X-Rspamd-Queue-Id: 1FDBC23D5D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29065-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de,ew.tq-group.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Thu, 26 Feb 2026 16:38:49 +0100, Alexander Stein wrote:
> this series adds support for TQ's TQMa8QM. The first 2 patches are prepatory:
> 1. Add support for USB devices in cdns USB3 host controller, namely
> onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.
> 
> 2. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
> ("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
> on imx8qxp which just has one PCIe controller.
> 
> [...]

Applied, thanks!

[3/5] dt-bindings: arm: fsl: add bindings for TQMa8x
      commit: 826f32e8ff437b4b88ba0b5c7978699710572ceb

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


