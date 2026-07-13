Return-Path: <linux-renesas-soc+bounces-35149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1f+jMZMXVWp7jwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 18:51:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE2574DC2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 18:51:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=uLs4g4aF;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BBBC3006B71
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 16:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E369543802A;
	Mon, 13 Jul 2026 16:51:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A39385D8C;
	Mon, 13 Jul 2026 16:51:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783961478; cv=fail; b=DBX5cZxoO7jvhSH7AfvLHg0wPdqNz8Da2dT4ET1lRby+l0gPv8iYgI28IVDULw5T9Ys9XlescUOX6Xo9gU8R0MT0TKNHYYjs/7gwAX6it7oMU7Qnir6XhZntTXS7cMZyjj4axMJxJB+f3qhCjHFEgOF/LP/TDjFcbY7EFP+iZGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783961478; c=relaxed/simple;
	bh=e39JXxB2cEOrppcVtr6Gja+ZJ2LQUDjwe+/FI+NxGo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uoHS5GFiQVwFdM/j0+pbIotkLvfRHKvT/ofUPjPAeuT8xt6xHKtATYxvZ+nruH4RX1s3SqQ7sN5GMSWJPJxVSJIjWh37D0QqIREsBF60/8AXaQQBenH1OKtsVwEyj1tyTeg0KU25TzcuxTQrWqkXgTZwPOKSGqvfFW5mn0w64Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uLs4g4aF; arc=fail smtp.client-ip=52.101.66.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHLkmPIvPaBAPJN0qF/WTaDVjXTN1UbNS3xEEf9SYYjK+MHMQ7qcsqYZtyReCJQTDtpbKtDvcg0nGIybSiUJWE6wXQCg2HONnZgunAI36oMPm15vYnFzBXAOq/URD7l4Sf/pG7/hKWExZgqaFiKF9kF3YQt8+b0u8PGAQ673CulFd3BWONSIQx3qcLUrWvBQ74iC+rJHR7wGvRjrVawglJMmEPvu60R1rQ+wSS8Jfe647mKU173UARUGLRgRpCPMIrfn2JKVeDGhhKipSgjYdij399uiZGdMLd80h8V35VvjVsd7ffhdKQADTsHd92d1Fp1+3v26QHKdXkYeJ2aiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmTL0UiRYtofm+WkK1Jtf/z2z4eEGFhx9HTqBfop1AA=;
 b=qEFJjeBUkRXIXq6x9hW6Qg+atOrhVdofUAwLi6MhbMlvlsgBbFUCKmcrJmXBjIqH35k/RFcR6GiQ80dlyhtkvjzlcBPOM8+K2/H03P3+7yBQXWuvL5/5jNwM8ouVsGOqb93Sanuy8UdYjxc1PGDClciDcWyjOOXN7ib4JGcGPHqMe41n3b0EQLk6wnZYV5CW8apduxYv0CkAhocOmP2l2CeKdVYeRLFM9oCi3PbOMfWWiDAeeoZiL7yiiUjM960usheitaJQ/FO4OsjOgPNwz/45StydUsLeS9tmwqsZ7bjbKJH/mKKGci/xP3GEKLBrZqq/9b0a72cnivGuinAHgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmTL0UiRYtofm+WkK1Jtf/z2z4eEGFhx9HTqBfop1AA=;
 b=uLs4g4aFo3NyqSGTkVS0Zuqx6vGVl+feD08JKh4hGDtLY6EaToVoXz1twWtK7jKmbTGBf1zsd//wWeE1PKU4hVvAQUQyEUiG08vt4T4rB4NhBecK9AUHPtwFVAWalue0Qw4oB+rsVH3ho3bOzkx87aXt+YnvyRPVkLWWuVDlYaO6746doexMGmm7RdHRbf7NwazVdLqChVoEmYg8/zM2Hv5enHn+cQUh/g00d25r+o7m1GOeIe3PyllQEJ4fLPqtUIk/msqBcd33NFjOm8ttyq9e3fEweVm3XI/Q5r6S0j5XS36TF88j7YSFUr3UgsRUg5GQFBZ8TxgVhC9XTof+cA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10851.eurprd04.prod.outlook.com (2603:10a6:150:21e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 16:51:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 16:51:11 +0000
Date: Mon, 13 Jul 2026 12:51:03 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	p.zabel@pengutronix.de, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 01/17] i3c: renesas: Check that the transfer is valid
 before accessing it
Message-ID: <alUXd8KfIZnLKPR5@lizhi-Precision-Tower-5810>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-2-claudiu.beznea+renesas@tuxon.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713130545.568657-2-claudiu.beznea+renesas@tuxon.dev>
X-ClientProxiedBy: PH7P220CA0127.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10851:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2744c0-8687-4dd0-106a-08dee0fef150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|19092799006|366016|1800799024|18002099003|22082099003|3023799007|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	dnvnIspCYnG3rw7aax+2BEclKCtogvpE68JOATh+1vdx/jPBjjXZNTVghrG9uhYu51aqVVBZnGlOXO1bjqG5OS477O1UOr3ztqfQNkLC7a2OcM3Zm7upqGL3n8aknA1LfEq1ARkkXwoqNelyYuNfP2V1wFf5uB5PfORid4l2ayXoPlMgXAQLlfyZF6sKh7lISpC+A+uV5gmTaW5P8k1hycMaKA5hEQqwHdgsJ7UOTgv8lf2VQCp4mkAjidZ/J+ppao/fyRFmIdDQrQO4N5O7zQwqrHcS7XJ7C+whAodFiEEJ7YQwdMWspKc0dO0idSFmRMwaFi0AtvshuDKz6imGDdf7zV/c60gLCx0+6+V7HTFHup+fsnz4MiCpe9/+5QauhN+n4/cv7GQdnqY0j+U26ZWv7dGuNQ91oWr/HRWNw2jk+QiSIrKbQS0Spd4S1oD9Geu47qwg3poLPblyK4MhNhg/+povxlxwNFywY5BYXs+WXqTBx2pihOS87Lxc4Q6/Xw5oLsYy7SyJJKdCYrdZjzrUNkVgk2lWlo/5WfpsvDPeD2aDuBpdaD/5G/nSunBzt152xmu2EqAcMOV/Gb5BGOIK5TYHY0M6inGQe4vxKHkX7h8GTUecsJ1YuhPGDFzJr6cE6FgNYAgO2EXBQmjAbmN/Q/KydxaCzS8rGcNViWc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(19092799006)(366016)(1800799024)(18002099003)(22082099003)(3023799007)(6133799003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0wyNdEGKY5okIluYrAds2+92B6lq1rU1CknKGFw4i+oVKB73uLKRardI1Psp?=
 =?us-ascii?Q?wqzCYNxBzk0sxDzzs5xrlLc915eBpkSJ0i6IxVkt1b/1204a/gXWU/HEh4cq?=
 =?us-ascii?Q?W0B2KSVWIxxK3ChyemIU7y3nNxhki5gDLGHno11LlHQLTdtvXc4rVozqPK5K?=
 =?us-ascii?Q?g+rUk+8vOAD1LY0cNt4sqR7ckeA2weL4bTtEpNv/PPj8CGwz8BTc4e6wog8S?=
 =?us-ascii?Q?3PpT146i6Dg0Qk3IZU4eFzl0yJPuOBB1rHVvU2sNMJwGedgcwL5/4xa7Um4t?=
 =?us-ascii?Q?mFGaWKXEXHtNZ91CkOUPcamwmQHl7WbVT50HSk+UVCznFFmiSh0Epsp/7VPi?=
 =?us-ascii?Q?yo44msD5WOBpxu12Aw+TB09XZT9lssbUwGAMZR9humoOmnVS/H0OUb+7T+TH?=
 =?us-ascii?Q?M/vMLKdd/MTKSCasejYUbhKIypN6BbmR+pXVrld1JUeK8iCoh8szTWudABE3?=
 =?us-ascii?Q?iRC4l4om1R7tguTi3zDm/Y8X6s6057kHwSIAJ/udoeP8zmr/oL7zvwYyoVFc?=
 =?us-ascii?Q?M1qg3WhJ2heozo39/c0aov/R+iKXCvfx4rMdRMXLxNR/iA9ajticehx4lZvY?=
 =?us-ascii?Q?M5uV4ya4Bo45A3JWzIda0kW2a1to3HKi3XMWMwfuMCPwsQJqQC0SfPBfeut/?=
 =?us-ascii?Q?3OW7h5V2r757+jO5eUyfRD8nkknuyRBqOri+RFA9gVSG+8kEBzhpTMVPnag5?=
 =?us-ascii?Q?xCDJVrwQGT9oem8rhW5b86c1xTL+IGyyzNNsNRkqF8HgzFFcuOnInRmqXI/O?=
 =?us-ascii?Q?/s+KuIZ+CtJeKReP0O5sb2O88aEaqNhtYS5SAMhxQnS3VRZvYQA3a4dOVRNT?=
 =?us-ascii?Q?ULAy3RyWE0tz+d71rY6RmC2VYT8GvL3g783lHLQqDg8EHR2nyTYfmMbRRTxZ?=
 =?us-ascii?Q?/mbcvnY2MPIWxlMhecKJ9kJXp0uYtNvHoAqxWjK+1hegjtardM4GTVydmy47?=
 =?us-ascii?Q?I5Z3FhY3HMuT2EeZrhlt50oHQRjrxsCu3J576xo+EMGhy4uYHFnuZlF3rqCV?=
 =?us-ascii?Q?P6L1EVzGcd9WCIJxDt9Iz1NKwM8r1C3LqpzR5VzthqVHy0mN0MAfAoC7BGii?=
 =?us-ascii?Q?HWf3Cq1XmFEgqj42YLEpf826v5RpMoYDCnuJrjtgWUB4zY+3CNYblmozgloA?=
 =?us-ascii?Q?Mng52mZH+4QV7mjVGc+HrVhE85WsfDsu6TsxLUydb0UmOuaUYw+U3NuQNi0c?=
 =?us-ascii?Q?Po/31ejYF8+BrUxk/xiaaeMIdItBMjFgvpfWjczF4Nm8ppPLsiOkwRdS4npY?=
 =?us-ascii?Q?XHmfN4cOEpKjUB0HZ6b6Lh89a6kEiFuuZ9QjRG9t7O+vnxy2AXAJZDdiiXBb?=
 =?us-ascii?Q?JDRcnX5m+UdUVfAq+Unxa+QAmJBDqQcHxlRDvlGjdm0pUaIqO9Z9HbjFmQla?=
 =?us-ascii?Q?39n+QF4rkQYoQEvPXiLbQ0mF7SKpqBs2tShtGVxOJ/5RUz3oEBVaBXu2eYsg?=
 =?us-ascii?Q?7sW55e1MWr4g9Qw/reLmy/ZpOgIaYyYucwdz8iuJDwmoq0KuHzhNiOpacgtk?=
 =?us-ascii?Q?IBgdhHr+gvyNB01oY/pllx+KIeUt1NzmKGhUABU7oyhM7lVugWgrHSHc9/BJ?=
 =?us-ascii?Q?Xj08TP4s20gC5cZQdTxsJSsUVGeAN/GDsenWF870tNKZWJbRnef12r9W9h+n?=
 =?us-ascii?Q?pFMZMfkHt4IG2pexnuZqmKGP9MgB1wx7RxPvAS7z8ihyrLdUUlG6RjpehfCJ?=
 =?us-ascii?Q?xNsjj7JdCvTLr+ouEiEKLlqHqR1fa48dp1yGtC+PTvEVV4NQsH7wwZwIt95g?=
 =?us-ascii?Q?HrjuVfqIdCC8964gHbkIvhaOJvb6uVWpNjw/ATLdU0JHrye1Fgs7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2744c0-8687-4dd0-106a-08dee0fef150
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:51:11.1339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlNBCyQy4McUgayYaDwewLxXngRVuaUxOk+ticVRCZpF7WxbKkO2g2xB3EarFND5rEe/kA055Y2rnrrBQZgFoz2tqsF+hUJkgmRN8/NgIHspGvofVJ+FmP4n+MXJ96av
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10851
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35149-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,renesas.com:email,oss.nxp.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AE2574DC2A

On Mon, Jul 13, 2026 at 04:05:29PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas I3C driver uses an asynchronous model to transfer data. It
> prepares a struct renesas_i3c_xfer, enqueues it, and waits for completion.
> The interrupt handler dequeues the transfer, updates/uses it, and signals
> the waiting thread.
>
> If the completion times out, the waiting thread dequeues the transfer and
> free it. If an interrupt fires after that, the handler may access freed
> memory, leading to crashes.
>
> Check that the transfer is still valid before accessing it in the
> interrupt handler. With it clear any status flags and disable all
> the interrupts to avoid triggering the same interrupts again.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Changes in v5:
> - introduced renesas_i3c_irqs_mask_and_clear_locked() that keeps
>   unified the IRQ mask and clean path
> - updated the patch description
>
> Changes in v4:
> - disable also the interrupts
> - dropped the Rb tag
>
> Changes in v3:
> - none
>
> Changes in v2:
> - clean the IRQ status bits before returning IRQ_HANDLED and adjusted the
>   patch description to reflect this change
> - collected Frank's tag. Frank, please let me know if you consider
>   I should drop your tag. Thanks!
>
>  drivers/i3c/master/renesas-i3c.c | 52 +++++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index f39c449922ca..38b8428f464c 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -433,6 +433,21 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
>  	}
>  }
>
> +static void renesas_i3c_irqs_mask_and_clear_locked(struct renesas_i3c *i3c)
> +{
> +	/* Disable all the interrupts. */
> +	renesas_writel(i3c->regs, BIE, 0);
> +	renesas_writel(i3c->regs, NTIE, 0);
> +
> +	/* Clear normal transfer status flags. */
> +	renesas_writel(i3c->regs, NTST, 0);
> +
> +	/* Clear bus status flags. */
> +	renesas_writel(i3c->regs, BST, 0);
> +	/* Read back registers to confirm writes have fully propagated. */
> +	renesas_readl(i3c->regs, BST);
> +}
> +
>  static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
>  {
>  	unsigned long time_left;
> @@ -1014,6 +1029,11 @@ static irqreturn_t renesas_i3c_tx_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer) {
> +			renesas_i3c_irqs_mask_and_clear_locked(i3c);
> +			return IRQ_HANDLED;
> +		}
> +
>  		cmd = xfer->cmds;
>
>  		if (xfer->is_i2c_xfer) {
> @@ -1054,6 +1074,11 @@ static irqreturn_t renesas_i3c_resp_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer) {
> +			renesas_i3c_irqs_mask_and_clear_locked(i3c);
> +			return IRQ_HANDLED;
> +		}
> +
>  		cmd = xfer->cmds;
>
>  		/* Clear the Respone Queue Full status flag*/
> @@ -1138,6 +1163,11 @@ static irqreturn_t renesas_i3c_tend_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer) {
> +			renesas_i3c_irqs_mask_and_clear_locked(i3c);
> +			return IRQ_HANDLED;
> +		}
> +
>  		cmd = xfer->cmds;
>
>  		if (xfer->is_i2c_xfer) {
> @@ -1184,6 +1214,11 @@ static irqreturn_t renesas_i3c_rx_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer) {
> +			renesas_i3c_irqs_mask_and_clear_locked(i3c);
> +			return IRQ_HANDLED;
> +		}
> +
>  		cmd = xfer->cmds;
>
>  		if (xfer->is_i2c_xfer) {
> @@ -1234,15 +1269,13 @@ static irqreturn_t renesas_i3c_stop_isr(int irq, void *data)
>  	struct renesas_i3c_xfer *xfer;
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
> -		xfer = i3c->xferqueue.cur;
> -
> -		/* read back registers to confirm writes have fully propagated */
> -		renesas_writel(i3c->regs, BST, 0);
> -		renesas_readl(i3c->regs, BST);
> -		renesas_writel(i3c->regs, BIE, 0);
> -		renesas_clear_bit(i3c->regs, NTST, NTST_TDBEF0 | NTST_RDBFF0);
> +		renesas_i3c_irqs_mask_and_clear_locked(i3c);
>  		renesas_clear_bit(i3c->regs, SCSTRCTL, SCSTRCTL_RWE);
>
> +		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
> +
>  		xfer->ret = 0;
>  		complete(&xfer->comp);
>  	}
> @@ -1259,6 +1292,11 @@ static irqreturn_t renesas_i3c_start_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer) {
> +			renesas_i3c_irqs_mask_and_clear_locked(i3c);
> +			return IRQ_HANDLED;
> +		}
> +
>  		cmd = xfer->cmds;
>
>  		if (xfer->is_i2c_xfer) {
> --
> 2.43.0
>

