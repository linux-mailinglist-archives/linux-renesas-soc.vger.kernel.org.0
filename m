Return-Path: <linux-renesas-soc+bounces-31689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPdWIxJb8GlQSAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 09:00:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E9347E5FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 09:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08290300443B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 07:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A59372B48;
	Tue, 28 Apr 2026 07:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="RsuTtQNC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021098.outbound.protection.outlook.com [52.101.125.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF16F361DB1;
	Tue, 28 Apr 2026 07:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359627; cv=fail; b=fY2X1ogupuYH9hxdTpKMbwf+4ubO0CO3t4xCL5WW8Dy0XO+9FJihhfKAO22rOvwkO9BrYWhOWJ5H/pWAjNToSM8gNcZILHli4GRsT27MSAQNKNcIIrN4YYep/tAEtdC8p08r92M72LWkwyWIghb9TLRpEQdJ/X7NvT88aZW4TP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359627; c=relaxed/simple;
	bh=EcCJ6Huvei6uZkRqnvABVpCamsdiy4v//qC/5rO4PEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VLPlxvtGrailIaURWVH/ABVIzpB38Z9e8fwF8eN4Lzrs9mYbOe/4NRODeN8eXkt+c/+Kmk51pyhzllg57QrbBpCiNoywfOgzwlER9ABZ8b7SCC7KFW1FKttkiBtH/zuyx+0u9QE5NWsyPy0y/+Y2qPE9/N4XFIQldGBvJ7SU1wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=RsuTtQNC; arc=fail smtp.client-ip=52.101.125.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCCwU0XBrNRD3IRuGvpq1M06kVanKX+1SnQFQhrfVL1egTSF6U3VclUDmsUJu+kvMi0RjtoO/6+Lm4v+ZSOUzGDxv942zdqSclQ+V3ObktPRUGPv+zst6lM20GpuTMW6GlGFsBgIST4FcVXcfkb7YoQBjOLPCVFWbtPVNkZq2IAHP82MKqu5UjCxbDu07yeBfVKNnz9bYkQ/qrICd3XZH9v+eN4vrnQCnAmFuRSfj1FIHHFon3IZSETxD9odHqZBFhMyFAPMiI8PA/XnGHs1EMO4C/aTd5kNioY5LiFvw5WoyvLj7RZoim5hPOHttrP2YUnPmC4mCaiJgvk9CsFmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5tj+cUxqfRHhTIddTtw4FDu3EdDPXpJeuaHY9p59EY=;
 b=mjzeS6iu6JcRJTOYk0L0R8vRdf3+5gCsN+etPrlN4YHlksTzqNYXyXctERp1nwAHoRyriW6+6VCV/gi2pNoCRkfRjDWzHgVIWxzCjmZH5IBwYpdJPML7M/5z+QsQ38eE5OsP8C3DmKhVVlEPo+4vzg7tg5ehABJ/0RhpOK5FsVY9wWx7ik/rQHjMU7MZNuVNvX7t5W1cXiQQYbBQlKvsLpUT9ZaciS/4AtjdamiRCynvChvSVLAKuwmtL//lwO6nb1ki5Kyb8PgZSwO9kC/U/6NNlPoZGo1Zd1AZghKNowtnMqic7oafF3P4JEDxJo1oeiTAbK9VNE/VS09nalGrCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5tj+cUxqfRHhTIddTtw4FDu3EdDPXpJeuaHY9p59EY=;
 b=RsuTtQNCew3UU9oKcXy9HRnOXwg6Z2QL7W4UnqAg96KMFrhbcT4DggbiZXdKsa5vnnNAPonrwag5GgkMBVvAz3w7VtncDd2Dbnx3w+DOzqb//t6Eh+kEtMrebjDd2tSOAtEDjHGGBuS9iFuGsYmykmKohQ94wpUaZt9/Y7Szuow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB5403.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1f3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 07:00:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 07:00:21 +0000
Date: Tue, 28 Apr 2026 16:00:20 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, stable@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] PCI: rcar-gen4: Limit Max_Read_Request_Size and
 Max_Payload_Size to 256 Bytes
Message-ID: <oeb2uiudm7afzzzy3f5rykzctfnxlsydit6ww5raohcbxo3v34@hmnqr2ud42kq>
References: <20260425233845.459175-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260425233845.459175-1-marek.vasut+renesas@mailbox.org>
X-ClientProxiedBy: TY4PR01CA0081.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB5403:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6e95b0-3fe3-470d-cb61-08dea4f3d069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|10070799003|56012099003|18002099003|22082099003|11006099003;
X-Microsoft-Antispam-Message-Info:
	OveEztDybQdWDoMPrcTIIQnkKlb9v8HhgpDBp5Wp6QWwvWLeo+PLg2ARBZH09Q99Mik0/+rAly6vSG26x/Q1Wnwel44MzAQPB3hTlJwhNKEMTAboZMBdz/4xAgaHIpSGrCNw93iLOXUFtJkZTM1ZYSk3cVNXIauraypY4x97gP/uzuQb3c87oRLvdZ4y7bhhGKh4DLgj8trYc4CE1bVMAVkL4V9+ailH1S14wLPdlxFpHczu7M7eJKSwKOdTvxSFFS/FBvF6isGfj5KQKTFPovGEeIbFN0pgcHwcCpbB7BJLY1fmHT0jX1DCAFP+SCL/yctmA3OoyniqLdz2KN+I2cgCvmTrvz0IHapvT7aAwInUv8xuhfLDT11WTtGe+VX7KtSiMito4yxvMWMnqyjS2ZLAD4SArgNZ/3TLmtitPZfGrl6DUpzqnvudSrU8lt6ukn19eRQ2UpZwNRFA2tAmBODBS7FamkiyAtW5PX9eYf1cDY9FONRuJCbYgj/1cfObnI3s8Yp5a0P8F8NkbPEyql2HaPTG8sPHljGH0SKFgAZPJ1VqBpm5yOIVbDGpr+wuDBvmHqO0VHunZkgfzX9wFouNGhvHVra2X1PJjfaDAWRd1xUg3kft/u6dnjqjEswJ1A4mFpQLSFwzYpoEOg2yCxWmqEoR0epI5Nn/8/gbq7tlpTwj5kzf7c77JDu0Sv/yfPkpT7HLN9y+U6Pnpe0BcTDBYQx8wsOPdHVYU7327zE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(10070799003)(56012099003)(18002099003)(22082099003)(11006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGw2ZFJ3OFd6NXdLa1BQWG84L1FDNmZxWmRFUXlobE1mUW5EME1nQTVuZmVQ?=
 =?utf-8?B?ZzFNNjlqSTU2ZlhpRUIrdE5HZk44WUlIUUNEVmhZV2NqVFdPQ2dzL0ZGcDdS?=
 =?utf-8?B?cndXdXZVeWVib3gxbk5RMlJvOGNmcnpFK1BDTlU2VDJWTFpLMlJLQTVoSzFG?=
 =?utf-8?B?dVorbTVKQ3Y5ZVlSK1NBMThxUlpNWXJCRU5DeSsweGROYmxRWHZOblM2czhj?=
 =?utf-8?B?UDNZNWU3U3owVitLeUtJWTdTc2RNR1NOOTJHUDJGNU9ZMVhCVnlQZzBuOU53?=
 =?utf-8?B?bFp1K2FaUERYNVdqbS9WWSt2aHR2TnFhWjlVOGtjblFYSnlwazYyQmRMSDdP?=
 =?utf-8?B?RVpRbmIwWCtlTEphZk52NVE0cTgvUGMwR21rTngrVGpZYnZ2SVVJNlh4bmE4?=
 =?utf-8?B?NWI2TjJXYzJHQXVFdndPYXprMEErbXNSYXVLYXBPQTN5akJIaU0rL2F5SkZD?=
 =?utf-8?B?c05BdDdoMW5EcG9ZZkxaTDdCVC9NbDR5dmI4OWEzOXIrUTlRUXNYSFY1bnVT?=
 =?utf-8?B?cEJZZmlUVG16anQ1M2xPNVhoYTVTWS96TjV5eUttdFdLU0ZVMGlwZ2VDZVVB?=
 =?utf-8?B?SG85dDQ2UmVXN3poOVovNzBvcXZPODM2dEVVZ2QzbVpmL3VZNWZ1SWxZelo5?=
 =?utf-8?B?bWtxWU0wcDMvMzV3eHZ6SHRteFIxWkhaRlYrcHgxRWJRUTZHVHVsZjgvWGdL?=
 =?utf-8?B?dE9rMmtUMXVhU3dsTG1VT1JEc2M0a29xZUdzZlJ1K2RKOC9tM0x4VmgwYUxZ?=
 =?utf-8?B?OFNmQWV5V3hWbHlXQjhpV3I0OUxtRll0OW8zVGI0R1hycldzeTIyQ3duTXUy?=
 =?utf-8?B?d29RbEpTYmt0b21wUlRQb3NSNnFocjJXUFpvbnB6UGw3ajBHaWJDTDB0TG9n?=
 =?utf-8?B?SjJRdGtoaHBvQVJrWEQ0WFdtcGgxTFVhMVN4Y0RwcHpwUkhTaENFdWt4SlRM?=
 =?utf-8?B?OFd5NVZ2NFgyRlYwSjhIaDMwc1BNK0VNKzROT0I1QmgzNHo2TE8xUm9QUFls?=
 =?utf-8?B?cWRqWWJjK0hTTzhhN094VGUvVk4xaHY4dHBNemVOaTZUWEE4dmdPVW9zT1lk?=
 =?utf-8?B?NHNsaURzTis5NUYzNVRxSWIvMTM2L1l3RjRDdmo0QUpkaEx5aHdhbFo4bWNV?=
 =?utf-8?B?bkJtdEpCdTdvcFE0L2hPZUhDczIxajlLbmEwS1V5clp3Qy9lRTIxLy9Hcmor?=
 =?utf-8?B?YkRrcHRPNlFVZ1U5dmE2Mk1yaW9BRy83RS9TeE9uOXNTU0V5aThKYmhrYk04?=
 =?utf-8?B?b1hmZ2xpQlRqQ0hmZEVqMVNvMnoyRXcvVFdULzFUSm5CU2lwQjhLYisrNm1r?=
 =?utf-8?B?NnRjM2pxZXNtN3dKQWNyRGw0bVZNdStPSW56WW5wQlIzc3Z4R1NscmVEN0hz?=
 =?utf-8?B?OGR5QUUwRWxwRXVqSkVjVndoNDZmZWQvYVphZWR0dy9jbHE5a3R2SCtsSFlG?=
 =?utf-8?B?UFJtWjkyWGxDRFUySHkzaVRwT1ZJalp0MzhCNXJKUEJjeHZFakZITTZESHdn?=
 =?utf-8?B?a0t2Q3lwWXdiZi95STJBL2w4WkdBK2NoSFFyUWdINDY1dWpOeXQycWhIS0lC?=
 =?utf-8?B?SVA0c2NmbENQNlNNMXkzd05FRlEraU82T1N4bjd5SVJrRk5YbmJjOENCRDZ0?=
 =?utf-8?B?V2NRbVZvR0piTmJ4dVVyVWtrekJWZG1zUXRNKzRHUUg3cXE5QnhXNmZMNVdu?=
 =?utf-8?B?c0s4TzRGdmlkam02b2J0V2tXa2dmbkIvZ2s5dWJRL0tqTlZIV3FpcWpwZzh6?=
 =?utf-8?B?SGg3bGJOVm1aT3lLN3M1SmduWVRsTDltMDc0Um9LK2xjMy8rRE1raDFTQ0dG?=
 =?utf-8?B?ckRSVGwyeExRakg1cUhRaUdlbkFJQ2hGN2QvUEhOOStOTjlYMlM1cGZmelhN?=
 =?utf-8?B?T3lsaHU3N0RKa0FwaWZHdnk4WFd1emVUM3pkdEV0a1lqRnhHU1ZKVWtKQjI0?=
 =?utf-8?B?dFo5c2pudUpBN3FhTHhZYWRkKzFOQkt0aSt5b0RvN1lZQVpOazZzOGw5N2du?=
 =?utf-8?B?TER5MnlPaHNZWGZva2RPZWNUTGl2SEE1RTFJdW5hd0dvOGNuSXNlTEhjdEdx?=
 =?utf-8?B?ZVd1OXAwWHVjZEFpTnB6bldxQXJWN0ROcXFkSThyUWFVUXpJQTUzRTQyYXRj?=
 =?utf-8?B?WXU1a0t6ZUhMYzc4QmVoYjBXVHMwQXZyTDc2c2wxa3pQdVhaVXUvTjFvbCtR?=
 =?utf-8?B?a3p2UloyaVFQUDI1dkJwYlNsSytqbHNLek1qRnh4WjhFc0pRMHpFczMyQ0tu?=
 =?utf-8?B?anBWZU9mWUpkWGdGdDB0M1RNYUhnVEpDc2k5VXRmV3d1YStvdWNZZkxCQUUz?=
 =?utf-8?B?TnYzaEV1MVMzaHpvUEJuMkhkem8vQkZHSUxqdy9sVTdEcWtCTTV2cVlhMnN2?=
 =?utf-8?Q?LKSWWMQlB22OW2IclfxFMbj1auMtoY7VC038P?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6e95b0-3fe3-470d-cb61-08dea4f3d069
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 07:00:21.5201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPybDxYnQir36fMknjPM1jsvXrf5lZZPwRLdarLSbo+T2+173tOyX43ljZJhlQWszUEahyIEJrjJHOweTZl6OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB5403
X-Rspamd-Queue-Id: 03E9347E5FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31689-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,glider.be,gmail.com,renesas.com];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email,renesas.com:email,valinux.co.jp:dkim,valinux.co.jp:email]

On Sun, Apr 26, 2026 at 01:38:28AM +0200, Marek Vasut wrote:
> R-Car Gen4 PCIe controller has a hardware limitation of 256 Bytes
> maximum payload size. The PCIe DMA generates requests of size up
> to minimum(Max_Read_Request_Size, Max_Payload_Size). Force limit
> both Max_Read_Request_Size and Max_Payload_Size to 256 Bytes and
> propagate this limit to all downstream devices.
> 
> This limitation can be triggered for example by using an NVMe SSD
> which does not use host memory buffer, Samsung 980 PRO is such an
> SSD. Affected SSD reports 'hmpre' field as 0:
> "
> $ nvme id-ctrl /dev/nvme0 | grep hmpre
> hmpre     : 0
> "
> 
> The symptom is a read from the SSD which wraps around at 256 Byte
> boundary. The test for this symptom can be implemented by writing
> 512 Byte of random data into the SSD and reading the data back. If
> the read back data repeat after 256 Bytes, the device is affected.
> "
> $ dd if=/dev/urandom of=/tmp/data.bin bs=256 count=2 \
>   dd if=/tmp/data.bin of=/dev/nvme0n1 bs=256 count=2 \
>   dd if=/dev/nvme0n1 bs=256 count=2 of=/tmp/readback.bin
> "
> 
> Expected data:
> "
> $ hexdump -vC /tmp/data.bin
> 00000000  97 81 b7 3b 0e 38 2b 4d  a7 d3 e0 47 ff c2 4b ca
> 00000010  c1 85 98 f0 4a ac 03 a0  3b ab f3 19 44 dd 06 8b
> ...
> 00000100  7a ce 3c b2 e1 d5 d9 11  88 63 10 59 76 3c dc 32 <-- random
> 00000110  72 32 2a 7d a3 e1 aa 13  7c da 58 a1 7b 21 11 50 <-- data
> "
> 
> Faulty readback, collected without this change in place:
> "
> $ hexdump -vC /tmp/readback.bin
> 00000000  97 81 b7 3b 0e 38 2b 4d  a7 d3 e0 47 ff c2 4b ca <---.
> 00000010  c1 85 98 f0 4a ac 03 a0  3b ab f3 19 44 dd 06 8b <-. |
> ...                                                          | |
> 00000100  97 81 b7 3b 0e 38 2b 4d  a7 d3 e0 47 ff c2 4b ca <-:-+- repeated
> 00000110  c1 85 98 f0 4a ac 03 a0  3b ab f3 19 44 dd 06 8b <-+--- data
>      ^^^
>       |
>       '--- Repeat starts at offset 0x100 = 256 Bytes
> "
> 
> Fixes: 0d0c551011df ("PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Koichiro Den <den@valinux.co.jp>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 56 +++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 8b03c42f8c84c..82f0a074a71da 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -576,6 +576,7 @@ static int r8a779f0_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable)
>  static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
>  {
>  	struct dw_pcie *dw = &rcar->dw;
> +	u16 offset = dw_pcie_find_capability(dw, PCI_CAP_ID_EXP);
>  	u32 val;
>  
>  	val = dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW);
> @@ -584,11 +585,66 @@ static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
>  		val |= BIT(6);
>  	dw_pcie_writel_dbi(dw, PCIE_PORT_LANE_SKEW, val);
>  
> +	val = dw_pcie_readl_dbi(dw, offset + PCI_EXP_DEVCTL);
> +	val &= ~(PCI_EXP_DEVCTL_PAYLOAD | PCI_EXP_DEVCTL_READRQ);
> +	val |= PCI_EXP_DEVCTL_PAYLOAD_256B | PCI_EXP_DEVCTL_READRQ_256B;
> +	dw_pcie_writel_dbi(dw, offset + PCI_EXP_DEVCTL, val);
> +
>  	val = readl(rcar->base + PCIEPWRMNGCTRL);
>  	val |= APP_CLK_REQ_N | APP_CLK_PM_EN;
>  	writel(val, rcar->base + PCIEPWRMNGCTRL);
>  }

Hello Marek,

The patch makes sense to me. Let me ask two questions:

1. Could r8a779f0 (R-Car S4-8) be handled as well, perhaps by adding a separate
   .additional_common_init() implementation for it?

   As far as I can see, the r8a779f0 match data currently does not use
   rcar_gen4_pcie_additional_common_init().

2. Did you also happen to test V4H/V4M in endpoint (EP) mode, with the local
   eDMA engine issuing MRd requests toward host memory? Your commit message
   describes an NVMe device as the requester, but I'm wondering whether the same
   256B limit was also verified for the R-Car EP DMA requester path.



(*) The background for my question 2:

   I only have access to S4 Spider boards. In my RC <-> EP setup, where the EP
   side uses the local eDMA engine to issue MRd requests toward the RC, 256-byte
   MRd requests still appear to corrupt the transferred data. With the following
   change on top of your patch, my DMA-read tests become stable:

   ---8<-----8<---

   diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
   index 82f0a074a71d..6910b9cd9d7b 100644
   --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
   +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
   @@ -595,6 +595,18 @@ static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
           writel(val, rcar->base + PCIEPWRMNGCTRL);
    }
   
   +static void r8a779f0_additional_common_init(struct rcar_gen4_pcie *rcar)
   +{
   +       struct dw_pcie *dw = &rcar->dw;
   +       u16 offset = dw_pcie_find_capability(dw, PCI_CAP_ID_EXP);
   +       u32 val;
   +
   +       val = dw_pcie_readl_dbi(dw, offset + PCI_EXP_DEVCTL);
   +       val &= ~(PCI_EXP_DEVCTL_PAYLOAD | PCI_EXP_DEVCTL_READRQ);
   +       val |= PCI_EXP_DEVCTL_PAYLOAD_128B | PCI_EXP_DEVCTL_READRQ_128B;
   +       dw_pcie_writel_dbi(dw, offset + PCI_EXP_DEVCTL, val);
   +}
   +
    static void rcar_gen4_rc_pcie_quirk(struct pci_dev *dev)
    {
           static const struct pci_device_id rcar_gen4_pcie_rc_devid = {
   @@ -796,11 +808,13 @@ static int rcar_gen4_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable
    }
   
    static struct rcar_gen4_pcie_drvdata drvdata_r8a779f0_pcie = {
   +       .additional_common_init = r8a779f0_additional_common_init,
           .ltssm_control = r8a779f0_pcie_ltssm_control,
           .mode = DW_PCIE_RC_TYPE,
    };
   
    static struct rcar_gen4_pcie_drvdata drvdata_r8a779f0_pcie_ep = {
   +       .additional_common_init = r8a779f0_additional_common_init,
           .ltssm_control = r8a779f0_pcie_ltssm_control,
           .mode = DW_PCIE_EP_TYPE,
    };

   ---8<-----8<---

   One detail which might be important is that limiting only MPS does not appear
   to be sufficient in my setup. MPS=128B with MRRS=256B still seems broken,
   while MPS=128B with MRRS=128B works fine. I wonder whether this is because
   the "MPS" term in the min(MRRS, MPS) limit for DMA read transfers may
   effectively be tied to the DMA read buffer segment size / MPSS rather than
   only to DevCtl.MPS. I'm not sure about this yet though.

   One more thing I noticed in the manuals:

     R-Car S4 R19UH0161EJ0130 Rev.1.30 Jun. 16, 2025:
       Type00 MPSS initial = 256B, PCI R, Internal R/W
       Type01 MPSS initial = 128B, PCI R, Internal R

     R-Car V4H R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025
       Type00 MPSS initial = 256B, PCI R, Internal R
       Type01 MPSS initial = 128B, PCI R, Internal R/W

   I'm still unsure, but this difference might be relevant. In particular, in
   V4H/V4M RC mode your patch programs DevCtl.MPS to 256B, but does not change
   Type01 MPSS. I wonder if the Type01 MPSS should also be updated to 256B first
   on SoCs where the manual says it is writable from the internal bus, or if I'm
   missing something here.



Best regards,
Koichiro

>  
> +static void rcar_gen4_rc_pcie_quirk(struct pci_dev *dev)
> +{
> +	static const struct pci_device_id rcar_gen4_pcie_rc_devid = {
> +		PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0030),
> +		.class = PCI_CLASS_BRIDGE_PCI_NORMAL, .class_mask = ~0
> +	};
> +	struct pci_bus *bus = dev->bus;
> +	struct pci_dev *bridge;
> +
> +	if (pci_is_root_bus(bus))
> +		bridge = dev;
> +
> +	/* Look for the host bridge */
> +	while (!pci_is_root_bus(bus)) {
> +		bridge = bus->self;
> +		bus = bus->parent;
> +	}
> +
> +	if (!bridge)
> +		return;
> +
> +	if (!pci_match_one_device(&rcar_gen4_pcie_rc_devid, bridge))
> +		return;
> +
> +	/*
> +	 * R-Car Gen4 PCIe controller has a hardware limitation of 256 Bytes
> +	 * maximum payload size. The PCIe DMA generates requests of size up
> +	 * to minimum(Max_Read_Request_Size, Max_Payload_Size). Force limit
> +	 * both Max_Read_Request_Size and Max_Payload_Size to 256 Bytes and
> +	 * propagate this limit to all downstream devices.
> +	 *
> +	 * For details, refer to:
> +	 * R-Car S4 R19UH0161EJ0130 Rev.1.30 Jun. 16, 2025 or
> +	 * R-Car V4H R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 or
> +	 * R-Car V4M R19UH0217EJ0100 Rev.1.00 Dec. 12, 2025,
> +	 * chapters 104.1.1 Features and 104.3.9 DMA Transfer
> +	 * section DMA Read Transfer.
> +	 */
> +	if (pcie_get_readrq(dev) > 256) {
> +		dev_info(&dev->dev, "Limiting MRRS to 256 bytes\n");
> +		pcie_set_readrq(dev, 256);
> +	}
> +
> +	if (pcie_get_mps(dev) > 256) {
> +		dev_info(&dev->dev, "Limiting MPS to 256 bytes\n");
> +		pcie_set_mps(dev, 256);
> +	}
> +}
> +DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, rcar_gen4_rc_pcie_quirk);
> +
>  static void rcar_gen4_pcie_phy_reg_update_bits(struct rcar_gen4_pcie *rcar,
>  					       u32 offset, u32 mask, u32 val)
>  {
> -- 
> 2.53.0
> 

