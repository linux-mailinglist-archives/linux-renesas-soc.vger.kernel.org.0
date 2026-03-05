Return-Path: <linux-renesas-soc+bounces-28889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC0/OiOQqWkSAAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 15:16:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D46F2131F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 15:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9D00307218E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 14:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B48B1D7995;
	Thu,  5 Mar 2026 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="NC16CnIg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020105.outbound.protection.outlook.com [52.101.229.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306DB4F881;
	Thu,  5 Mar 2026 14:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720148; cv=fail; b=mdqKKb836D+Puw5h744nv499gj4rPCANlNqJiI/DQTLzWl/BPc7fBmug3nWHeBs+AZTcsbLhVSSpMxyhZJCZylkONF6uxC5I/jcJ0YUArh+frnPTCxi5djZmgAUKzl1w1RTslyVXcuDO6XvSoOgpoQapi6WlFDYeA4jIO5/t5LA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720148; c=relaxed/simple;
	bh=BgOyGMYTII83d4Sr37HeiTz3JYuG8LgThXCRbGodd7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K/1I1cwjAfOYcE64swQrdreUzaeuNW71YRDsL5atQwyYMYCt6P3If2jWnvmgaSAl0QbcYo8Tjcmonek87ok1LxOiTKGJzo0azwHicgl7QX5ZtVoPOvcUvXI/mVoRMkVHyw3ZyUM2f7rKj2ux1mTfihRwsGwqXithSRyUjFZlfWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=NC16CnIg; arc=fail smtp.client-ip=52.101.229.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wv5iwNEbekQvPkH68Y9Y/Q/lMqlflcaUiVqABqwTVLPsbjVTPcbzbVx//mPaI4josgUA2C7lL1/vq8TWu785jcTg87eM3YHwulomePj7j63L1HMffhC4jKBe9ZKhodkBQ8K/SO5yp7grUsI3A6PJ+vOVD2fJlX7MG7p+zMh2hvdGFMj/kny3VKCokumfmeANIo0W4xxNMJEB0896ElLlXiaZQobDpKb4JIaN9B04SwVExkIig0/cbECLNBC7ifgo4FXedJARMXBJpjfoO+BAy1tdPpDAEoOZv8tnL/14yd0gxV3beSz0SH7AhAY1g/zdKvajBftTEqtWKggx+SG1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlKtKYG0bKxC5rq+1ePct8TL/JMO6xf+CpIeEdasZO4=;
 b=ULDwp6ESNlXJhVA17f3EQ6ydHWYuiuhs7sywHvvxPPcmXxo1YqRrjxiTK+HYScSwa2G0MJ/lioAvUL7acuZuYHlZtRrIHZVjmPZXtP1tBqxYuv4vF9ucbGcCorXnDUS02S5CgUA2EzGkPUEoVVUrFvZwBGXP95hHG5AiuYQxcJlVXsiWZxmRtKyXcr/y1DC0e4w2G5CbFXCiQtlDzFz9prKDgZjXZ86wpGBvh5J2dw3+pIG2m5EOBVJF0UWjqYDn3IS9x35QNaKcMpX9RRdwdGv7wKLR5rx3M+Iflywne4I1ej733ocXAN3Nv3q94v5v6WrhoH2pP0/vTeuQBEC4XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlKtKYG0bKxC5rq+1ePct8TL/JMO6xf+CpIeEdasZO4=;
 b=NC16CnIghGlykHmn6ITSrb+skEAV7mxK43EEvt97eLtz25s8TKk6feYriODofgHL9q9RWmWXy4fo/lPQ5CPfJmD6piGrdB6deYtEKUEmk/qUSpuEXHAl0HR/o5o+83adEzsTa0LG5NbEy4XLUxiwTTUhNApoUtsoht1ayoZhx2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYWP286MB2299.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:13c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 14:15:45 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 14:15:45 +0000
Date: Thu, 5 Mar 2026 23:15:44 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Niklas Cassel <cassel@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: dwc: rcar-gen4: Use 4K EPC BAR alignment
Message-ID: <hkswda2chkhfkuwqmqbka2n3f2ocml4e2wshmel3qpdblb2trl@tqoyqz6uexrr>
References: <20260305015439.1529006-1-den@valinux.co.jp>
 <4o42bskgjazgawswex7sfuvptmbho5gb7inmilntygpm7vdt7p@fcb6ttbbnb45>
 <pd56nggmapksuvbk662cwdqwott6lhc7zhlczmxf5jooe3l3od@ytkoxpi3cf7s>
 <wroiqhvgph4nrvpkunzpej3ruxv2hvo4itu5kw4xhlrlgpifo2@4hmnpth7eppw>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wroiqhvgph4nrvpkunzpej3ruxv2hvo4itu5kw4xhlrlgpifo2@4hmnpth7eppw>
X-ClientProxiedBy: TY4PR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYWP286MB2299:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c35d563-a985-466b-ab96-08de7ac1b11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	oMNl5S7FZbfyozKV2JMH8EQqOY1Da75ZQgGdVo7uEyzgiH7/xO0F9UUDlSHqqRwvEZgiYngHi4cy+GJLi4kMkoy+oEoIkMmpgcfWIa2KrVMcHOXQodc0TK4UjZ1NnjHkjGbLywmUcPKNKEMCkMwTiG0Vspzf2HKHkt2F1fYRfkhqcM9OzqmYeBCERmkyZizAejtpMtn/HImeKUJRGV9utW0KqXzTwY8gHGnQ6lR2lA2sHZuC3Po7rbH3/52Fq/rM1x+qGo/7qi+AX2PIOr1afPymBPtiqDQXY0KdxjlbfnJ3I4TfgnbGF+aIyjkaHh/9Lk4mU56TxQw6COyHiBzNBI2ciqL7fquabiRCaZKlF9KFEEAZ0ThugdFTkeGKMBG1qAzvNIA/RjpFVMd8nwcSjI4XTnD5soQCxFQy/nhBV8m4LoyJ0kwEFcudbWYC1MHrAdGqnqUeHYahTPvi2Hb5ME74pImYDkHGC0kZSpZ6FKnkTgjH8/4AijsJCEzFVaDfjI47meSasc7eYMimDgguAf0RyZasuHrSAvIEYbhYJU7Os9R4qvpgM+rWiqsxH0k/sqPhiqA6SkM6f+2nGi6UixfcpKsCYCsf7D9UWeVm6NX+3WIZr+UfIR1M9YeJ/8b3pAzFi/Hp5fvi28AYjhglXWsPT1NvwEfHxAqqJbXPaaKQTXmbHOoW975nNZ5lYE1AXCeMMIwH531evYq9/5nqCVSm1IAtGw0oN9tLgfrHxyo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVE2dGZ0S0loZmYzdytkVmRsK21jTW5SRWp5VVM0bjczV2RKTVBmeTJqVWUz?=
 =?utf-8?B?TDNhaEttMHJLOFJ3UEJqUlNKbldBb0psM2lzcU5EN25ldGRrMGg4NlUyMjgy?=
 =?utf-8?B?bzlmZFpRK04yb1R4bzZXUnIySGUrbUtNMmFuKzhhOWF4ZDdncjViL2V3UzZs?=
 =?utf-8?B?QkVmNzlNOTlrdGRJZUtpM3RMbStuYTBBSFdTN1V6SnNMaE9MbVpJbkFkOXNy?=
 =?utf-8?B?eVNXZWgvMFhyWXUyTWxFYm4wQjdmd1BnakJVdW5rZnhCdzhYdDlDR1QvZ25a?=
 =?utf-8?B?TEpoRS9vdHI2OWk5ZEhnL0Z1TVN3SGI5cVd4Vml0RmN4S0ZncHhEZC9ObVBy?=
 =?utf-8?B?Zk10a2Nabm9OS2g3d0w5UHJVQy9VbG5FYVozTEM3ZGNXTkpEL2pMTUJvb0NV?=
 =?utf-8?B?WnpUYVpuQitmR0h3VitEbytJL1hDUGJIU1FGRGQwU283NXNzN0d1TndoVlh1?=
 =?utf-8?B?Y3VpT3dLcTFZWGEzczAzbytRSmxzMmxYSEZxak5PaWIxN0dBVXRUUnFYRTNI?=
 =?utf-8?B?alM5UCt5N2dyUnRROGV5cjNNeVBWMG9OMmxDUGc2QlZQczR4OXR2VUVKTFU5?=
 =?utf-8?B?V0Q3UHVHcDlha05EdE50aWtwSkJXa1dQb0xnbGl3Mmc4aGFIeGFLSHgzUXV2?=
 =?utf-8?B?WEZwNFByYjNNeElydERSZlcxOUJKTHFZQ01RVG84RHFOSkFyL2lqYjg0TEpu?=
 =?utf-8?B?bHlZYzNCTmoxVnlzM3YrMUN2SUxWSjRGYlM0WHBRM2lHNnM3V0ZXdzNXUndu?=
 =?utf-8?B?a0x4ZkdRM2piVC8zYk1Lem9BdmhaeFpaNXVhTnY2QTBsYXhaaitUMGF1dTBt?=
 =?utf-8?B?QXFrZ3JicHpVVm92U3VVaWc3QWVxSEJyWFhmS2xDV0o0WitmYVNldWlIQ2tQ?=
 =?utf-8?B?TmQrZHhQVkQxV3gxTnI3V25Idy8wa0RpamhMcE1OYUFOQUVTSFFsQXNGL21s?=
 =?utf-8?B?OW9nY0puK2NZdlBRKzMyMTY0VXVQMGRqQnJ5SzFGNmwyTGJGOHFwSk1PRG5t?=
 =?utf-8?B?K1h5N1doLy9IcFVmTFBvcGdxYUdJWTFsV2tDbW8rWkpkK0w3RnN2d0tDbVB6?=
 =?utf-8?B?ZUJjOERKSmxkR0J2TWUxbjBpeEcxYlljb1A5NEc2d2YxSWhOeDVvZVVaK0dJ?=
 =?utf-8?B?ZjV3T0lKN0REZ2NyY3RhNUpVS0p5RWRZZ3FESXhrNHFWR3lEZ04yT2hoMHhE?=
 =?utf-8?B?c2ZWcWFDaWt5dXBlU1dDNGRLV2lOZ1pNcTM2NDFIT3p1cDlPOWtLamNDVllp?=
 =?utf-8?B?aEFEY3YvMmYyb0YrcVlqZm84eDRIM2RYeXlZV0VjN2VmVUtIZ0ZMM0FJS25W?=
 =?utf-8?B?K0VqQXd6cGpHY2MrellKU1NtY2lWZWVPUDZlenRuMUhyMXhkK2xuMmJQeXUr?=
 =?utf-8?B?R3hrQXJ6Ny9hNi9IUlNkZG5wR3hOTFNNSHRKTDJSU3FMSlNDcndkU1YrQUpt?=
 =?utf-8?B?K2VLbGhiRFpQNm9kQmxGdlBBYjhKMFVFVTErUlp2eW5vS3dWbFk2Zkk5V1BH?=
 =?utf-8?B?Z3FrNUptRkxnWklXUTR3c2tPZmRjanduY3pzOURUODNSbU1GaTRCSHJUYSsz?=
 =?utf-8?B?aCtpRVJvcGs3cm1YOUlQRCt0ellpNEtzS3NRRFIwMUZiNU1uOEt6cHcyZ2JR?=
 =?utf-8?B?LzZuNjFXNmREYmp3cEtGYkFFSDlvM0M3eEc5RmlVOHhVUnZzZlpZY2N3c3VG?=
 =?utf-8?B?ZHRjcDBJalV0RWFMN3VEV0t4T1dpcUVlZDVCTnhXNlBKdkNKOW42K05hYzk0?=
 =?utf-8?B?ODJPNWVZTFVhVk8xbU1Xd0toY1p6aWdBeFhEN29VVk16YTM1R0V3NUlsQTBv?=
 =?utf-8?B?elZJZmFoZXdMd096Q0pZQnpLdFZJd3g3cjdhcHMxWiswWSs5UWRuNTBWSXY3?=
 =?utf-8?B?b3ZwNyttclBSUmZ0Wi9ESlFZRDI0c3BQQzhrc0FYNjcrTjZqME9HaFJUWGVO?=
 =?utf-8?B?SUQ5dzRhR05lQWtYdGs1L2FKNFdMRUg4b1A0YmlUcVVBM3hTY0lHRWxRU0tN?=
 =?utf-8?B?YmdwMkYveGdMVmRjZkRsYVNTSkp3Q2VMcnI2bGFPNjd6VG5SMkVhdUpXdUd0?=
 =?utf-8?B?VWM3SVdwMnBPdzlxeExXdTlWczA5TXBDVGMweTc0czRqR0VxajhZdWZqUUkv?=
 =?utf-8?B?ellkaHlpakpBL3dibk1KQmRGcWR3bHVxV0VJQWM2c3pydGR4NEJoRWpSR0tK?=
 =?utf-8?B?Q1hhZXdxQXZEalFrYkZ4WlIxWm0xcC90OGtodUloc0Z4aFVpaVovM0UrOW43?=
 =?utf-8?B?MnVSM1pzcXdzRFJ2ZjBnWkRvRkhZNGNhcGMzVS9XaXR3Sm5QRkVkd0IxK2Zk?=
 =?utf-8?B?SEpyUWdiNzdaQW1scERFcnVGbzhUSVJNM2V2aVhpYnlvVFNSL2xPa3RFNDV3?=
 =?utf-8?Q?SPCi40GJLyiGJ7WTxZr6cs7Unmf792bJMFfTL?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c35d563-a985-466b-ab96-08de7ac1b11d
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 14:15:45.2620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZ+oSpg/cFTVOct9YjQarSvPbBKkztnCqGoNz5u0GqXlBz4w74igFb6tIZcfnMzDqrGoIjITVKKM+K3LosVaeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2299
X-Rspamd-Queue-Id: 4D46F2131F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28889-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,kernel.org,google.com,glider.be,vger.kernel.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 01:44:17PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Mar 05, 2026 at 04:03:03PM +0900, Koichiro Den wrote:
> > On Thu, Mar 05, 2026 at 11:27:42AM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Mar 05, 2026 at 10:54:39AM +0900, Koichiro Den wrote:
> > > > R-Car S4 Series (R8A779F[4-7]*) uses a 4K minimum iATU region size
> > > > (CX_ATU_MIN_REGION_SIZE = 4K) as per R19UH0161EJ0130 Rev.1.30.
> > > > 
> > > > Update the advertised alignment to 4K, as described in
> > > > commit 2a9a801620ef ("PCI: endpoint: Add support to specify alignment
> > > > for buffers allocated to BARs").
> > > > 
> > > > With the previous 1MB alignment requirement, iATU programming for BAR4
> > > > on this platform often cannot be performed, since a 1MB-aligned target
> > > > address may fall outside the tiny 256B BAR4 window.
> > > > 
> > > 
> > > Can you clarify this part? What do you mean by 'falling outside of the 256B
> > > BAR4 window'? Where does the failure happen exactly?
> > 
> > My primary motivation is to use MSI doorbell [1] for epf-vntb.
> > 
> > epf_ntb_db_bar_init_msi_doorbell() passes message address 'low' to
> > pci_epf_assign_bar_space(). The message address is a fixed physical address,
> > or IOVA if EPC is attached to an IOMMU domain.
> > 
> > Even though the doorbell window size (the difference between the 'high' and
> > 'low' message addresses) is typically small, forcing the base address to be
> > aligned to a 1MB boundary may push the mapping base much lower than necessary.
> > 
> > For example:
> > 
> >   When the doorbell message address 'low' is 0xffdff0a0,
> > 
> >   - With the previous 1MB alignment, it is aligned down to 0xffd00000.
> >     The offset becomes: 0xffdff0a0 - 0xffd00000 = 0xff0a0, which is far larger
> >     than the 256B BAR4 window, so the mapping cannot be programmed.
> > 
> >   - With the correct 4K alignment, it is aligned down to 0xffdff000.
> >     The offset becomes: 0xffdff0a0 - 0xffdff000 = 0xa0, which fits within 256B
> >     BAR4 window.
> > 
> 
> Okay, thanks for clarifying. This information should've been present in the
> commit message. Though, the top motivation is to comply with the reference
> manual.

That makes sense.

> 
> >   Note: if the address were e.g. 0xffdff1a0 instead of 0xffdff0a0, the
> >   4K-aligned offset would become 0x1a0 (416 bytes), which still exceeds the 256B
> >   window. (For simplicity, the 32-bit write width is ignored here.) In such a
> >   case, programming the mapping would still not be possible.
> > 
> 
> Hmm, that's probably fine as we would be running into hardware limitation.

I have the same feeling.

> 
> >   Also note that I used the term 'aligned_mem_size' above, which is the local
> >   variable name in pci_epf_assign_bar_space(). The corresponding struct
> >   pci_epf_bar field was renamed from 'aligned_size' to 'mem_size' by commit
> >   483768846d66 ("PCI: endpoint: Rename 'epf_bar::aligned_size' to
> >   'epf_bar:mem_size'").
> > 
> > [1] Precisely speaking, the "embedded" doorbell fallback:
> >     https://lore.kernel.org/linux-pci/20260302071427.534158-1-den@valinux.co.jp/
> > 
> > > 
> > > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > 
> > > Fixes tag?
> > 
> > Commit e311b3834dfa ("PCI: rcar-gen4: Add endpoint mode support") is much later
> > than 2a9a801620ef ("PCI: endpoint: Add support to specify alignment for buffers
> > allocated to BARs"), so I believe it makes sense to add:
> > 
> >   Fixes: e311b3834dfa ("PCI: rcar-gen4: Add endpoint mode support")
> > 
> 
> Please add it in next version.

I'll add the Fixes tag and send v2 shortly.

Thanks for reviewing,
Koichiro

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

