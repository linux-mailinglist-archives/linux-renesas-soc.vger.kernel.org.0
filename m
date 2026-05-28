Return-Path: <linux-renesas-soc+bounces-33310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHdGM7fBGGp4nAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 00:29:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B485FAF3B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 00:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA2EA302CDA6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 22:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B8A369D74;
	Thu, 28 May 2026 22:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NhyC8Hk7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410012253EB;
	Thu, 28 May 2026 22:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780007347; cv=fail; b=jdt8Sx0/FrhnkN3f5QfDHbYGvYpFEZNnF4RAaut2h3gRhAHplf3A+xVl2TNraEejIZ/wyi6ArbS/Sy7Pna9X0wBL9yxHJDvRLjHxFSVHRMpRs6lGGeq1iq33a/ewrttfBhpVuqxEqxzan443psM3ywwkmyaleZVjVCPJQZQ5eNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780007347; c=relaxed/simple;
	bh=Qb2+boT3BvwHUHh1nHv5C53+x5QKKOYp+qT6HjlhIOk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uAPQ2j4p5J5u3W8P+TYpCZC5LXrVIcvUMWUql6MfDDlTd0FWFV78EFYURzLkIj+n1z4txpKch8SYmv/UOqlPJ81p7T2UPi0UhSk6ukH0dBuqgwgPA8l1zMuFD0zbzbVcGsWZtVSMCDFuyKnTFtr9/ZHwPn9T34i5e8ah4kngnno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NhyC8Hk7; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryAelUtoA6jQ7t5VFS2I7qFUhljQgCOKCwF9Uik7jgQb0sw9BWk5nSNTgIlyusqIKMCflHxVGux451NO3TsK5KEyjYbBQWsfCmnPt0FtWMRdB3E3AhPzDM5D0XCTt4KGX7uFX/cfzP1TO0EIXd0yjqmM+9vyL61pII6HQldPVH/4Ok9IaWPId4DNG3k5Vk2DPbLGLvYhat3Oljwt7r1a99t58ACzwzpup21mIzeS3zPeYqlwUw1VAwjjM0exVtb0BFjmTqyThYX6GMEB/gMbxJzDGjp4b3v2f/EzlUY+CW52R2nZqC6IaHaT0hZnRignNeG8VxfldCcU1JtrMdubaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qb2+boT3BvwHUHh1nHv5C53+x5QKKOYp+qT6HjlhIOk=;
 b=DmyrwrQ2dvR9FU9DkIFAp30MYbEWo5o80nbsP+xusO8uhHsybg2u2VxXGe0s84kh1cQIZhCFT+r2Q1N0Z60e21eFyNWWWG7zYXT7ma1p/rstopJAimz1Wsfs/hC7cwdY/1kkVl1HHYbYqoF57dzIyZSG6eg1bE9B06Quq7lCZ5grOYt2/dB4FuxvD8E3tU1MkNLKKlldJwzFoEvuZaypUkkv4Q/iuCCzvsNQVAU5+WqSkLhOGInj4dGyvjeBKJWN0TO7aEAASQtM0mvZFh3kiRdEurrl1VMqTfXodhoswPDQtRrg2asSvd47OlbyGNbVpgauWa82EjQNgi0h+i8puw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qb2+boT3BvwHUHh1nHv5C53+x5QKKOYp+qT6HjlhIOk=;
 b=NhyC8Hk791JiMGYiabHPW9NZxmvYq+i7Fc0bFfn2uTIdPYHBDyXZpkOLr+pHMhtPQYV5+aCWs8EWQKbIeEn3X63WKZseyysE7ylb+Y/JD0zx8vCO3XMwl+MnbCQG6oIhob9oe7CKVoS0cp0DyHdhQQiLrS8bcMY7224lIt/fg0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB17343.jpnprd01.prod.outlook.com (2603:1096:405:352::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 22:29:02 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 22:29:01 +0000
Message-ID: <87ik87qic4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)
 <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] ASoC: renesas: fsi: Simplify driver_data handling
In-Reply-To: <308c08c0fb309c190412f5ceb21b0027842b6294.1779958164.git.u.kleine-koenig@baylibre.com>
References: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
	<308c08c0fb309c190412f5ceb21b0027842b6294.1779958164.git.u.kleine-koenig@baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 22:29:01 +0000
X-ClientProxiedBy: TY4P301CA0079.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB17343:EE_
X-MS-Office365-Filtering-Correlation-Id: acde836f-44f6-4753-cd4e-08debd088468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|18002099003|22082099003|38350700014|5023799004|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6s9iYtctsA87cmczGP+WawWcj1HEdoVNI9XxUApTHgLYJNdxyctrPZRx2fvkyAUTeIfrcxnLHBSBWvVKkzmzBxeSaQOHOA3Yx7evPKAwg+JwdmmH/Kj3HrONAC+eqJjaF+OFLBG6L7ILiMLLFZOMACod1D6ry9+kfptxuUoxgYU5L1buI+qyupFQjaqb7yZVDgom8u024qPxJigNmJk0Qe+czvKTdMwCXglX0hhH+tiIQOlWunloAozFCbSioHxaADI+K9TvyGlvbxMO5DcBGGaXKh/u8x8dv8/oZtwv+a/FD6g6cY8OyF0o8QYN3pNCWBomTJlod7zbsj9JOxydrVnhyoplk1JAf8KALGkTI82KlC6IiSXzhC/kHY8nCfUMfLH27miGlU8OcwOXFOtZwdCRU7nsh6qDw9EQQKOTEeLcNW8c84lSX4WhXYTfeYCMgxOH9SjTAYfiCys9dzopCLpraNrLqmKKCzxKYklLek5Uj5bSw5TMoWigg77leWZrY9hct2Owzg96/18qQbXxXQqDfYG0dedEZ8LsimF8aTPUlVHAvJrbFLKkU4nf0lYf4EuTXGxqQ08HAJXC3gdbkwjTvhUD7yJpJ3JbuwlLbsAF6ay0AA+2bmIRP1fbRgC5ZF4KHKmTgIqWhhtvOHohe2oORov3NzK23/8kRd00OYIgstkrgTxOdyNJJynp9M5zb/yx2XdMUv9VsrmBTjGVduorBvivV1zpotFcDCqAae3DFfml1nuBEfIvThnk6CJ0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(18002099003)(22082099003)(38350700014)(5023799004)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?xpcMpzdlpfvYhO4uMvatok7YRJi27p7lQw3A8xUBhLUukuCv791/ndrn72?=
 =?iso-8859-1?Q?XOurqLUSoPErti+7k2cJFMoAnv+MYR5b3B03BnpOybfivHVR4YQ943ticW?=
 =?iso-8859-1?Q?I+PlXa5Af8Us49anyxe9ZqMNChgh5MUgyOzvCWnHTxnxi89XiBMsemydIo?=
 =?iso-8859-1?Q?tFboQWEkLxbKBTsAeBKiugEQNkG3UW+2tdG2jLYHk/HbcA7ZwoF4MuVFcK?=
 =?iso-8859-1?Q?qOzmn4QOC6a/ixCF4MGlvm/rLNSjGhRb8MRqFXWbzA6XFXT4mS968I0vnM?=
 =?iso-8859-1?Q?uJm0N89y9zColzPvKyOdy1iT9hwmtAq0KzedlmkzSdggEXQ+d6sal0p1v8?=
 =?iso-8859-1?Q?2g6LmRVbl2t1YCUlWP1f6Fa5qI0/MYuPWV12wh00ENGJu6NVxIV5ZmCIPJ?=
 =?iso-8859-1?Q?3SEVV4PDuDjTYk//ZM8uNtUXbAV8VXfppk/7IVlRkGvSZfjtMbF0QJBJpX?=
 =?iso-8859-1?Q?2oovcVvE7x7Rw7CicWHR2BSw1rn4y/mRCk0+PQ53kEnAIxyZ2J8h+xhgD5?=
 =?iso-8859-1?Q?YoImONWOWX46Ym5DHtIY8F9bLhEVIfpnE5ySkoa4joraQblaqse/+HHz8U?=
 =?iso-8859-1?Q?4NokT1FEqNBsD66gkC9NkS/X3TEI3ie9qMoLNIeEAv1AsoLF2I3MdbD2zL?=
 =?iso-8859-1?Q?/VplWg5XmsFlcveJ+g6eXlMgiiIQyIQzjkR+9774yczfhMoz8jHTY/Fy0O?=
 =?iso-8859-1?Q?pysJ86bpUWZfFLcA5/TdMXsHa7Uc52/l7ZPk+gJWfAPBcPRvy9Bfe0Il4L?=
 =?iso-8859-1?Q?fMxR7yqv3oT+Nv8RKW8dlxvzrErCPOBRvndPNvbwgoaesxD09gHfTG9M1L?=
 =?iso-8859-1?Q?TQY9/mhnDX0uajcqmzN+Cqg6Yk4L4jPOfV5AMMcqSEpzE/PSn7vmVZqRrn?=
 =?iso-8859-1?Q?49O2C9umtAnlHnS1dNHPp61So0sMI3/2MQvNq32LdxAq8BBlK7RO7vK2B3?=
 =?iso-8859-1?Q?S646/VUKJ5rPIumiTznBB164bC4oyvem3vrTQStcCbBiJyC9kDyzXPrQYx?=
 =?iso-8859-1?Q?JTtRyxzfdRqFEb3ujMwgHisZ9QyGyW1hkr9uMwOYO66kal0arhu6ZoVZcj?=
 =?iso-8859-1?Q?A0RfRrZlq6Ffrkbyn6/07ZUS/rwDYq4fj6nxEJvAkfF9MYTDZeERge1XMR?=
 =?iso-8859-1?Q?uPCWEisqcXPu32Ewoy491TWwxDz7Puz6QDvcIT4CRC5MCk0Y/vdQclckk+?=
 =?iso-8859-1?Q?P2Se3busBSt4VyhqZUmlFqrj02SF4ay0bEVaz/Vogk9vJdP3P6TT2aEVlm?=
 =?iso-8859-1?Q?aB0joLYiCzkfMHaCynENL4ZnPFa1FX9aVI1hNPrwWnRMHnPb1MusAUEy/j?=
 =?iso-8859-1?Q?2IUf1GANFshrpNXm/KRaavbfkAkcirmV/J3YK46KkyStrVyL7uyC/NsLPG?=
 =?iso-8859-1?Q?LcbZ5YTXPyKE0Pyd+eWj6oLQdeCnr6WA6uZhCkmORI26su4gDO9322bF6U?=
 =?iso-8859-1?Q?Sd399FmsOqkHGp7gKHWQZ50meivLxmu4t9EeBk3UCycNzWfuJvjdlhCqyw?=
 =?iso-8859-1?Q?1hvyhdpgwLnxeqlQVbJJjm7KDxHurQVXXXvSgU3cZFoxT+48Pt42jEBliD?=
 =?iso-8859-1?Q?dr6JOb619ao5NgRl7BOhzq9xydA/efU6D3iMYk2O4zFK/WmbagQxis7iR9?=
 =?iso-8859-1?Q?LW9H9yk+rTWZVIxOJLLz6kA9LMa4h00SbSV8luUI9hj6KryGShExX6ti4P?=
 =?iso-8859-1?Q?Th+ta54NoG/j3nwCSpDCe0DPqOZ5gfeejQVrI8OLUOtWAMnptBrMjJp26y?=
 =?iso-8859-1?Q?J9Y+XaSNayyUM7yriy3cBhtKYJhjH7ON9l56aZIlDj5SsPyPxaoe/Depqy?=
 =?iso-8859-1?Q?MYWEBZiiNcJcIyN9RCwh8Vl4dnGP/vf24HfNF0cH4DxPUIlop/tY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acde836f-44f6-4753-cd4e-08debd088468
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 22:29:01.3524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6L4whdm1HRsjPwSPz17ov9OWA1EY45pj2G8jLdaAdv4ShNaJpTDc/gyqDPDSKHW3ynULDZ628SX7iNI+uUxZBDRXL8Vj0lYTWhtZiXt7G4TE3UGF+OGJBzX2S1nqp0D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17343
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33310-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,baylibre.com:email,renesas.com:email,renesas.com:mid,renesas.com:dkim]
X-Rspamd-Queue-Id: D2B485FAF3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi

> Instead of hiding the fsi_core struct for the only supported (non-of)
> device behind an abstraction for multi-device support, hardcode the used
> pointer which gets rid of (open-coded) platform_get_device_id() and two
> casts.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

