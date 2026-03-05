Return-Path: <linux-renesas-soc+bounces-28841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIlmNP4qqWkC2wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 08:04:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B7720C1D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 08:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DCD53034B06
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 07:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF11C1DDC35;
	Thu,  5 Mar 2026 07:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="k5vu3sKg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021072.outbound.protection.outlook.com [40.107.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036902E1EE5;
	Thu,  5 Mar 2026 07:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772694189; cv=fail; b=ix+34cVr5kmrnVUx4Mv012A0M07H2kmpFKTNqXgYXRkX8SNBsWIY9Uw0fNFr1nH5hZIYqCmKLBtnIfgSHjpDgxER66qkt15BszcgyC9Y3ovqN5KRowY/ZGq+VvpuMRfcjk5zr2faOgbA0LE+vLLaEBjZvCjt+QtbhxDzAaagJ5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772694189; c=relaxed/simple;
	bh=9ybqaBV7X1r9Xs6gsxBdGB/LzpAZo2RnoBz+iyjUlgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RVCMpKnuACJqFhxVV37rxyHeJICYvZH75xa1ejgF1Oot3PHbnA49xTgylgzw+KnVTmziGX9rcIAqL93t5sWjCA3hp/S4PaU3hX88bLAAM3BWMrtQ3gPpd8YIzs5jPi5rgMeBVmYKMmF0gTvUGAwv3XhLRI9QquFONjwlEj7paJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=k5vu3sKg; arc=fail smtp.client-ip=40.107.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Poo2CHsxBWhZg4WACJgREXB6BAzzTaLk4Xp07sg1AQXF1H5uizWwyT5+Wvx0K1ZsS0a7kUkaQjyc1sw4Q9WVDLxsSZe4UeASrL0OpBXLvDa3Vmbk47x475uQQgzMJJyi/p3ofZYXyrJ4v7Gz/YZJSrYjAxeNbEiTdMWkTj+E/A+rsyaz3zdqoVP1QedNkO32a66uqjxQdwVlIs+X+CTzXRnuvQYcwPfRNovE7KLaQsV70IrrLprFw5ZqJnnyIDyNAZj9ueXQ6DlNCPGZ0quH3QjfYhczzkasL/iKkjy0fGDZfkra51fEhysoahZ52K+21uFCD8hDJbANNa3NL1B25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uk90iHRSo+iVGZGWUQfuavWvgKbswIeORBKDhpGs5rM=;
 b=I2cUL2g9QGBrY9DMQe9pEGvsBfKleLLKGjDo8gtyhhOskJOI9wqCR5iBrFd0BJri8mCM7K9il8IbHYSS3Yb+a62tifAWSZ96aKy9yw4d0aGMTII+TlO0brg0q8ROiA9R6zcCeWhF3dLM9FKxMRigjrJ3YShD+pHPnhLkYIywEqWXHz3axV4482DEGdEnBHcD/j7hIvi4EyZCfcCwXjZ2rKa0fAyNOBI9xDuKQIbH1Q5YFfY8HSuz67v76rM4aoSNmHip09cV/A8f2y84VqzbNVzP4YcaqOa/XhbKPdqKHIbhC6Fgk2jWYl8l+Cr/AtAKluUdGYrLpe5d+y3UBnZtXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uk90iHRSo+iVGZGWUQfuavWvgKbswIeORBKDhpGs5rM=;
 b=k5vu3sKgcVIqV3Cp9m0aosf8Kp078UjMr4qMiyojvZ0UdIGzhmCaXPjZCKpgLTKEo3GxfuGqrhqyQ+1PgyPKovr5Wnon6x0zhWviGdUePhAgFlLCzJVEPxaTDQZFvWwdQMzpg7vukGZ047d+qAajMK8ptc9GU8BFVXoZAtCwu2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3888.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:14e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 07:03:05 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 07:03:05 +0000
Date: Thu, 5 Mar 2026 16:03:03 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Niklas Cassel <cassel@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: dwc: rcar-gen4: Use 4K EPC BAR alignment
Message-ID: <pd56nggmapksuvbk662cwdqwott6lhc7zhlczmxf5jooe3l3od@ytkoxpi3cf7s>
References: <20260305015439.1529006-1-den@valinux.co.jp>
 <4o42bskgjazgawswex7sfuvptmbho5gb7inmilntygpm7vdt7p@fcb6ttbbnb45>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4o42bskgjazgawswex7sfuvptmbho5gb7inmilntygpm7vdt7p@fcb6ttbbnb45>
X-ClientProxiedBy: TY4P301CA0017.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3888:EE_
X-MS-Office365-Filtering-Correlation-Id: ecca7188-e36f-4295-69b8-08de7a853f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	O+Rxd1POnahfJp1/yLtscjqP8r0PcYwU1lHYSiYusVarJSVugMOhcJ1ucYiwSUg4Bt4bfaylBXHQn6tOkcZhBoN9Htr+QqzGlhcVqWYyJ6hNaZJTGGDetYsEWFUJTzLO9lCjaK6aY+qfXR1QUnYfGk8oUa8gMpd9hgvLfC0TRieyKQT6cKArr2o0d4w1LaYUAk2s2WlC2laXBzFU3XDTqELYE0xjhDjjuBosg6GEyQV9fYSJmUA4t8IrYHVW9AaNF01Qvs4veggF3/zAzhOSgs2unGxcMwGfeYMsPrwi7MwUXx1pAPSXgFGwcNTiZKcI23JEoz3geZ/WaNkjS/09W3tWEmHnovEfwxKze3QXYd3shBD3ePMO+oiIKKxsqQ8rl5ZJPA2IAS6xn8y0TxQc2m8GHvd1gHQw9dyoNa9OVRxtXXszUmKBBrIftZkQ1ZL88gH4e3HA/KZdd4moeaWAMlQTCOadYVYqvd7f+TGZ7KWxOSFCVO/QtOijYirQ5l7u139T3utmd5e7AHXukOgwhYjkz4AaEZMHKlx6R2SGfKsKpP37tEI/lV54rtma/p52bGyZhpKdltxUo/KTmUbR6WGDhsGp9JUojaFErT066+1yMmNXtCVUaQN+NkgyClp6oJgMnG/pNyuwYxom/D6dewZrYB4JYFn+y9EdgoGaX2fR4CtgX7hiJG22knNT4zf7bm6EKSNFbnPHop+aooAhTmSvlhnxpiLyhGstAvULc8E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0haWkZZVVBsWDdXOGllajM3QzhLRG04dU1wWkFySVRyeGR3UnhobjJ5d1BD?=
 =?utf-8?B?ekJKSFc3YThTYXVXTmFJcXg1Y2I0aG05UXJVb1BMUms0M2VjUVdTNE9Ga25J?=
 =?utf-8?B?ZitoeC8vMFpkZzlKb0cwbE92bkFmV0pJbzVUcWt1ZVVsTzJnSmVXUnIxckdS?=
 =?utf-8?B?V0duSUxrZmluRTJOSHBGaHozWGIzb1M4ZldGOTFCSWxEL2VrL3RSNm5EdHQ5?=
 =?utf-8?B?T0YraTJjOHRqL05sdjZDeThrL1RKOTIrNHJGQnErelhnZFhUVzJHYjQ5aEFX?=
 =?utf-8?B?SUNtQTFQSGdhSUZSLzRxdllkK3M3VjZPcTdTODcxTW01WHYyWlAyZmhWUmNs?=
 =?utf-8?B?aXg4MWxveWRwNVkyVUtmNE9ZVHhDRUFyT3kxejNSRTcyNlpZOStUK2hBNUxk?=
 =?utf-8?B?Mk5Zd0w4TThMa0NIaW9NMVkrNjVYZjBCSnhKUHBCckNTT09QbnNnZ0F3K0ti?=
 =?utf-8?B?RHo4N3d4bWpMVE9hM0ppQ1lIMGhpVlNBYnViWFdOVmRCNy9tTm1MRXg5ZjNt?=
 =?utf-8?B?SHR4cGZXUW4zK3psYUpvZmVpWTZsbC9sSFJUU2Vmd1pNblJ6YzVheWI3ZVhR?=
 =?utf-8?B?bko5UXR1QWZYa2NZNUhrcTlUT2Z0K2l5OE5rNEg2WGNOQmlCQkN1eEVOaUZI?=
 =?utf-8?B?VVhicHZyM3FkcDN0T1ppR0svLzcvdXBFV1pYTzNjaHVhaFFOaFBCa21xaXRV?=
 =?utf-8?B?dVUzL3ltMXZiVGNxbXdDQklCSWlRY25FcVp4SVZLemtucEJmWTE0dDhDVHJD?=
 =?utf-8?B?aHhDanZnMGRWVWlKK2t6S3dabUdUcmNvZkJOQkdRTHF0ek5UZ1puc0dlbmoz?=
 =?utf-8?B?NUxBbXVNSzNkU0J5NHdSbEJjR0ZscUZTSjE2NlJGeG5CK081REhQNDYybWN4?=
 =?utf-8?B?N0hZUWZyVDY1RWEzdGt2c0hoenB2aE4yWjRmV0lmdkFmR0p1aTRPYU45REdz?=
 =?utf-8?B?STdVYis5THZnRjMwUjJnSUN3YXpTN3Q0NnAwWDJhWUFMR3lKT0dPT3l1Ykkw?=
 =?utf-8?B?SkNkU2Q5UHNLZURBMmM1bHZ4dFh1N1JlUVpiRUpZT245ZDB1VHhyQXBULzAy?=
 =?utf-8?B?UHV5MXlnY1F0cFNENE55RVZTTWI1Y3lrY29EQy9QU2ZPaFBwOTkyTXJRMy9h?=
 =?utf-8?B?Q0V2eEhVYW9LODhzNmUxRVdlYkVUaVNCV3ZXYncwY2VFRDNGbFdvM2Q4K2pn?=
 =?utf-8?B?ZlBmM0FqUGE1MVhDNFhZbWcwdTZVbjIrdnpVdFJ4TE1XWmd6NS9kYjc4Zytm?=
 =?utf-8?B?TURvc1UzdXR6bllpMytNQlYvOTc0OUFnNlZpMTEyRHlzVmhYaFpsMXcyZ2RO?=
 =?utf-8?B?R1ZzdE43dER0UzR6WTlicnd6WlQyODZCTVRwVlFkNWJ6dHBZcm5zMTNoT3Q3?=
 =?utf-8?B?Z0hHRjIzSTNmQjJpTmxjZmFMdEVWcmRsT1MxK2xSUWZqNHp1RUtPWlhLVzd0?=
 =?utf-8?B?dUpVZ05IK045ZVVScThwNmJCZGhBbEROekR0OXdhRXhuWlhWdHU3TWhkTkh2?=
 =?utf-8?B?ek16ZTFMWStkQTY5L1V6UkV3K1c4RVlLOTMycWpKSVErZmpQU0ZRUjgyL1hL?=
 =?utf-8?B?cld0VEg0ekc5K1I0aGtvQ2l5MXgrSW1xNW04U1hDMGVhOCsvbzY0dmlQRHMy?=
 =?utf-8?B?dzQwRkZGVkZrQVkrb0dsUFc5aDhjd3owaXJXRFY5REFCc2loU0F0YXcrVTd1?=
 =?utf-8?B?WE1MWDlYVmV1Wm13MUtIMmdnblRSLytqUHdFa3JVVzNmUEhUR3ZodnZUOTJl?=
 =?utf-8?B?QWs0K0h1eENpSFFmOFFRZHljRHdFQjhPN3Y4M0s3UmRjcUEzVXBCRjdFQmxy?=
 =?utf-8?B?UmozVUhQNHM3ZE4rMXAwMmtRbWNTZnpJZjhuTUZtUGN1Tyt6emd6WVY2MVh2?=
 =?utf-8?B?UmNXTmk1OWxUTDBiYThYVW5FUmVmSkt5MjBhdFpZTHVYSXpYbHExWW5sZTUz?=
 =?utf-8?B?TFFWU1NTd1ViMmJWOGl4aUNVLzVmajFQdkt4ZHVOb3BCeURoV3h6ZVZJTWdK?=
 =?utf-8?B?aVJFTkFjb0Q2dEhKVFkzSkhhT01QQ2U4eUVhYXR1M2V0OVV2Q0ZRNVpGOWdN?=
 =?utf-8?B?aWV1NnVCM0RYcGt2d2d3eDkycHdxZmd1Vk95OTdsbXg1U1liME0rMzU1aC9R?=
 =?utf-8?B?b1dHckZsZWNwRk9tOUtCOFphVFk5ZlVOaUMxT1hGMTNwdTg0MjFIbXVtRHZi?=
 =?utf-8?B?dTltYmdOcVdRc2UxS1EzUHlmZVlsMEcrdUczYVRXQU53WXR2Z0tXWEV3SjY5?=
 =?utf-8?B?SkFJU1o2dittNHkremNEbFVocWJuMzFFTDdPMVEyWHFWMEp4aWYrelR2MG9F?=
 =?utf-8?B?bFhnb2oraUtVeXBuSDBPb0xtK1FFOGFicGQxVkJIK3VIazlWNTg5K3JPNFpU?=
 =?utf-8?Q?lwomKG7gCEvLAnuTVUa0Yc6YUM7Jw5DHXhcRK?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ecca7188-e36f-4295-69b8-08de7a853f95
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 07:03:05.1051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bUVXhUhh+B1Q6Gu+DcSpXKSaIDEndYde2VIFHqMVYtwts9QptBIv2+jfiERRbGzKvGrjenuvBkWgsiFdh+oAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3888
X-Rspamd-Queue-Id: 35B7720C1D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28841-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 11:27:42AM +0530, Manivannan Sadhasivam wrote:
> On Thu, Mar 05, 2026 at 10:54:39AM +0900, Koichiro Den wrote:
> > R-Car S4 Series (R8A779F[4-7]*) uses a 4K minimum iATU region size
> > (CX_ATU_MIN_REGION_SIZE = 4K) as per R19UH0161EJ0130 Rev.1.30.
> > 
> > Update the advertised alignment to 4K, as described in
> > commit 2a9a801620ef ("PCI: endpoint: Add support to specify alignment
> > for buffers allocated to BARs").
> > 
> > With the previous 1MB alignment requirement, iATU programming for BAR4
> > on this platform often cannot be performed, since a 1MB-aligned target
> > address may fall outside the tiny 256B BAR4 window.
> > 
> 
> Can you clarify this part? What do you mean by 'falling outside of the 256B
> BAR4 window'? Where does the failure happen exactly?

My primary motivation is to use MSI doorbell [1] for epf-vntb.

epf_ntb_db_bar_init_msi_doorbell() passes message address 'low' to
pci_epf_assign_bar_space(). The message address is a fixed physical address,
or IOVA if EPC is attached to an IOMMU domain.

Even though the doorbell window size (the difference between the 'high' and
'low' message addresses) is typically small, forcing the base address to be
aligned to a 1MB boundary may push the mapping base much lower than necessary.

For example:

  When the doorbell message address 'low' is 0xffdff0a0,

  - With the previous 1MB alignment, it is aligned down to 0xffd00000.
    The offset becomes: 0xffdff0a0 - 0xffd00000 = 0xff0a0, which is far larger
    than the 256B BAR4 window, so the mapping cannot be programmed.

  - With the correct 4K alignment, it is aligned down to 0xffdff000.
    The offset becomes: 0xffdff0a0 - 0xffdff000 = 0xa0, which fits within 256B
    BAR4 window.

  Note: if the address were e.g. 0xffdff1a0 instead of 0xffdff0a0, the
  4K-aligned offset would become 0x1a0 (416 bytes), which still exceeds the 256B
  window. (For simplicity, the 32-bit write width is ignored here.) In such a
  case, programming the mapping would still not be possible.

  Also note that I used the term 'aligned_mem_size' above, which is the local
  variable name in pci_epf_assign_bar_space(). The corresponding struct
  pci_epf_bar field was renamed from 'aligned_size' to 'mem_size' by commit
  483768846d66 ("PCI: endpoint: Rename 'epf_bar::aligned_size' to
  'epf_bar:mem_size'").

[1] Precisely speaking, the "embedded" doorbell fallback:
    https://lore.kernel.org/linux-pci/20260302071427.534158-1-den@valinux.co.jp/

> 
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> 
> Fixes tag?

Commit e311b3834dfa ("PCI: rcar-gen4: Add endpoint mode support") is much later
than 2a9a801620ef ("PCI: endpoint: Add support to specify alignment for buffers
allocated to BARs"), so I believe it makes sense to add:

  Fixes: e311b3834dfa ("PCI: rcar-gen4: Add endpoint mode support")

Best regards,
Koichiro

> 
> - Mani
> 
> > ---
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > index 3d4a889e38cc..396ef9432299 100644
> > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > @@ -428,7 +428,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> >  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
> >  	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > -	.align = SZ_1M,
> > +	.align = SZ_4K,
> >  };
> >  
> >  static const struct pci_epc_features*
> > -- 
> > 2.51.0
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

