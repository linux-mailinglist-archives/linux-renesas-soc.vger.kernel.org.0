Return-Path: <linux-renesas-soc+bounces-30896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAHzEM/10mmLcgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 01:52:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DE63A04AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 01:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 416DA3001CC6
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Apr 2026 23:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42351342538;
	Sun,  5 Apr 2026 23:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HwSEBUbW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754EB17A30A;
	Sun,  5 Apr 2026 23:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433161; cv=fail; b=NQ3MN+O+PiaRsv3hUZEQ/pTviOMECXq6LMp/tRcbplOzm1p8txEzQbvQjM1QXNe5wJMKhMYjSwQH36QCnLiVcEvmmFOYhYtDulo8flL5Oy8P6FyRf/6Hl3NWRwPaJIwtd7eK6mQjp1hUD16CUqLtoQIJveJflA0h/uFGnOBWX/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433161; c=relaxed/simple;
	bh=FcCTHBSpoFAoLWpOn96CACkBQ2PnSRr3jg68s217WZk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ph87lmhIqBmLsqPjxvUFTZ5TY3nGn84O+A9AZuOQESMJdgZ96u4naESPJgHXu7NWXQaIm1OzkzoTDO6JKI/z7ztxsdS9sb78iX1e/rnPoK/kHRrbetA/GJ1xBqVJ4RYoyojemZMmh5yNMbTPBzy+J+eu14Vp62GbK2T9QRAL8j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HwSEBUbW; arc=fail smtp.client-ip=40.107.74.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNUbU5a/eoYTs0O3U9Up6bdljDNbPuAePTVcWWNaNZ2/fa8w5Rlw+2pxs7R/9WfEESIGRt318yP6FODbiSzTgdrALABuU2mIRskhIhGE4BWvAR3uY6z55Kp2WVP2OyMTcNDLfxHBSMcF+G6kcVPAZ1AR5RooGtTcGMs6q1VCD5e2UYPVmcT6i6aUK9tD5w5FzTH293HS2JajHREFhd2Vn0zOJm3SLtQk6TvwWUghTtt9silB2jhkw2/j2jz3bepS3vNtMAQPj6E9sRbWiA9uMmmMPe4Qey7yeXgAmCLhfQKVd43PYwmgQxvDXQlRZU6/BhnacGn0A+b620INCGJHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7IZ5xxsWiPrebQNJUKl3ZCOFP583mapGUNFeRhFdX4=;
 b=iA5AbdWIb3vdS0DtA4vDjn+LlZv8cQdaZyAwUZGLEvm0FTVCY2ZrdzmZLBAbfYyZM46S6mkx3aypyOEW161ladOTpOomGRrOmEwoOw/bXEoZRMys9jH3mVL4sJ2k+iQ4ODHJnX4gucTjxW5aMPSSrRcikDUECHXfYEJS7EC8MW0yaCP+J2HdkH5SLNRF88pgWuZNFqY46Bcg+Xrkt37k0fVQBuGZesg9a6M/IgHoI7Q3YPHvy7rFmvXPQ7+M7xo64S55ki0LZQY0f6PB75Cwl/k9n/DFpBEUgC+PjwJdOZXXrH5GA0GnoXqHKb4cX809e3gjtVWvBIp0ecHXYmn18Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7IZ5xxsWiPrebQNJUKl3ZCOFP583mapGUNFeRhFdX4=;
 b=HwSEBUbWCbExBz8J7D5XnlAkvriQDQ1iAYMWSBOzYGBYH1XEBMxGRWhjZ9ceYVpydO5VRTWQyhom0pTQl6wiY5CpZvqXYnLYUUuLdaoA2GYv3NNNJpe1lEXWNsMQ9q6yNrkdruz/IfuVoj+hIAdKL7eskTJ+Q6M2DKMBOgGWn7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB11197.jpnprd01.prod.outlook.com (2603:1096:400:3bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Sun, 5 Apr
 2026 23:52:35 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Sun, 5 Apr 2026
 23:52:35 +0000
Message-ID: <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: phucduc.bui@gmail.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
In-Reply-To: <20260403112655.167593-4-phucduc.bui@gmail.com>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
	<20260403112655.167593-4-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 5 Apr 2026 23:52:35 +0000
X-ClientProxiedBy: TYCP286CA0195.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB11197:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cbb35f5-022e-4ae7-990e-08de936e6915
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VpftYjEruI3UdDEsvbkeuel+0k3fPm8hQmS5a8caQm7NyIWEyC3f/wlGKfet/QJzvhqVhSAjeOaLyCubBa1fgWDq1odiOhu7gZqAFxpHVhJ0XPk9o0/tVHu+CeDqplMQyPhD5SmfCsmeF739qBF4J2OJVOsqggtxetC/qdn/XYUWc47e0/9nmeKjz/NQq9S9XS8jyMA6OykMa6VwygOkgqHFXiHuPvYJ2QVegxsXPfkRuDX09U3z7HpyHvpevbM+wPmGrv0BP4Afo0QQZEXhWd4K8V40Uuwt7irfsfFTBoQanKfJYcLPoC468WTD14EgiYERQPNNUIGuiKa/TqNgZkAG+echolSSl6azDa+UFYNCn+w3OqaGRss7Pmaj8qTE8OE48Uin7dLkpyUW2o23JaAUAly026JpQdKRjdTqMdXb8GzfDOmhPOdG+9bK3l+6XzfxqRNKKxX0UletbNTe2Qy3GFbc2+nDXDu5/K87dYDt7xPJjG+0hsSs8lu6AIvyf7OZCo3UZD5C0EYEca3jLrz8rKuHcDWlZbF6ZAx4ndP3dHLtLY3z3Dh9/wP2Jzo9B9O18XU1qLCYs+9BZeVifesJoLN/Wd408EiPURqAKXNgqyT9TGYYhbWaKwzrzCxzWcCSDUr19EAuUFSjSlbi65PmNV2Di2hgrqjtsuevm2J8dQVtTr2PC12ffkqtaL58K7Jb1DqqBkH3UW6HIP6ZxJaK0XLlVAawMJRTZOPg2l+TR3vZjkGHqr/oehcEMZ96ABArGbodNqo8Tp9o7qFSdbXrND91HyR6ApXIo0Nlly8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kKHP9TrWXkdyw7VXWI96x9OlmZgd3QfgqqS5+giuX/Spa4llqJ8fzO3Cho/I?=
 =?us-ascii?Q?r5KXoBI2Dif4NfpH64qmyE4ZwhCrkvglzDrQbcUuI+viI7/nMN0uUI2V3kTs?=
 =?us-ascii?Q?l0xIMdSgoy+3l6RVrS+OxvnrgrfVZO1ArMGYPzguv7xPIBRW4auc7dSiryK/?=
 =?us-ascii?Q?EvkuULIopdOjMfNDj2gpjHl7ASEuGG074sYa9Oh9qt0qEfwui92Av+89IZcC?=
 =?us-ascii?Q?tmucvVr4G1X64JWQIJvdcBH8gI+4u7wnQMAmOt3k+1sHc51GzF0BSjnl/f3j?=
 =?us-ascii?Q?RnrQcn6L6WMaL8fajpFH/QAKHFsM2yCnrHpb25873KamXEz5Q5tFAdFPlOOW?=
 =?us-ascii?Q?idC6E+1z2Nii37opxmvkXbTrjeMiG8lmFKdtLJQpAN9/1qwYbCz0ESHIj8UL?=
 =?us-ascii?Q?ejoV4kRwUczGEIbyiGadEIorpw5KLZP2bPv7/7DD5F7+PNhRv9SvuO+BuWuW?=
 =?us-ascii?Q?E31vQ8JmX/pAvW6MFJWYaS2yzrlPzKgDr3B4AFlfk8Zxkh4UDMx+Nwh3pKgx?=
 =?us-ascii?Q?8Mtx2uehn2tVpO0J+u4/CCp9PXV0m77prxPFAcoSe1p2DwrO+KkXlDzj1RWC?=
 =?us-ascii?Q?l4J0RkVYmQiImf7UzNyuzeZxOkZ9ZDyiPVV5aMxOh4iFf5WL7eMowFTe2eQS?=
 =?us-ascii?Q?HQtjo0yNINtUHE8LuGWIbyyAARqd4IIQhLYP341IQWSM6cFglSGPr2YGhYeK?=
 =?us-ascii?Q?EWRJO4uXu/JuKLu3bztGGW9yS+eQuKlUSJOgM1MBhxCeQ2P2ryv450x9z/w7?=
 =?us-ascii?Q?PInnKxaOLnCXNJxDWoKPBaBMxREWEPk8MPYcfbRPMNyOlDRWYJm4+r4baErJ?=
 =?us-ascii?Q?IHKYtQiQvySc3ttGFbZXwrlb9lArOtMBRuk1DBweK8sfR3KMufv6wmWRY6LT?=
 =?us-ascii?Q?msoZSYAi4f+qASiyGsYdr8VJjnDdT3ss21MLxt65Vyi21YFa35AlX0N5WH7P?=
 =?us-ascii?Q?HZ965//mzh8ftUmV077eqri5s7Xs1dX5hmxf63+IWmZBAta9v5cigQty27wU?=
 =?us-ascii?Q?w6YH+wICpEWPjMGhqSfjSvU7pHDNrl01CRK8U/yuEcl00AeLFhdejbLZvHcp?=
 =?us-ascii?Q?JKRI8VNDEqp4rH+RcwNfavs+hpF3Ln6hULBx3HJeI/IcM+95PkZoEMxIl6P+?=
 =?us-ascii?Q?bp+EP5CQQp4PeyRcChF+gXL4JKe8T1IIdjqZwi7uk34yeduawlQkGAA50YNI?=
 =?us-ascii?Q?S7hc/J9nsrl/bWoalZcHw7L5u/0okAOlJchJH7CLBnAOSPpUe7w3uHOFgowS?=
 =?us-ascii?Q?FMBcNpXvArV4PLgIE/cGxmTKbaaOM6BQ0727pfPnWeR0P0OkRJlfndeWCCpO?=
 =?us-ascii?Q?NvGfhYswZZgXCBTmRn9Nz2IAAWKD1nvcvLlnkKKEhydQM+ayNVYu0ejcho3g?=
 =?us-ascii?Q?54ON7DACtR2zJ/f5xRhrMf22Q7xzUhAbfFQ2YKS8Eb68n+FRhO95Dmp162Mp?=
 =?us-ascii?Q?CgvvBamzr/gwJ2Nh85k1JQI2N1S660BRZAxO4dgIAvddX3IMitVK8M9uiFIw?=
 =?us-ascii?Q?cSJJ3wufBQsxDfspjS7uVNPI7+VU7uwYUwZlVtpWgVj8whImAXLMGcoWZnRA?=
 =?us-ascii?Q?cAjxyxvRg0hrc2q4M96BD4p23mo5W5JXSzaJJGiM3eQ+Lsl8Q2n+PvQT8tn9?=
 =?us-ascii?Q?JER29SiMooLWt9Wm0xDgtSoJPQHp5mwn59gAHco//OQ6Vtd42V+lJMxm0OeW?=
 =?us-ascii?Q?XfPxIp3rntuJjg+tdzGgMTOIADF+dwIClgGodilY6Sx+aYUwZ9aUQeSx0KTD?=
 =?us-ascii?Q?aPuO4vmV5dN4QSv9+PJq5aKDb/li+q6cSI48MQQcOeMBOsfhlul4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbb35f5-022e-4ae7-990e-08de936e6915
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2026 23:52:35.3262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y809n+IYYzrDqmZAx+t2KL+64KDsrdgNI8kjqClRCATYXHe4UC0M39tELKPq3n7xOrnUMFbvnISnUfHbTDalHW+5C4EzR7Y3ahsbwWDtLa6div9x6sJ9C3u58OGai0h/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11197
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30896-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 42DE63A04AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi

Thank you for the patch

> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The FSI on r8a7740 requires the SPU clock to be enabled
> before accessing its registers.
> Without this clock, register access may lead to a system
> hang.
> Retrieve the "spu" clock in probe and enable it during
> DAI startup. Disable the clock on shutdown to match the
> audio stream lifecycle.
> This ensures safe register access and prevents system
> hangs during audio playback.
> This is required even if the FSI functional clock is
> enabled, as internal units depend on the SPU clock.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
(snip)
> @@ -1554,6 +1555,11 @@ static int fsi_dai_startup(struct snd_pcm_substream *substream,
>                            struct snd_soc_dai *dai)
>  {
>         struct fsi_priv *fsi = fsi_get_priv(substream);
> +       int ret;
> +
> +       ret = clk_prepare_enable(fsi->master->clk_spu);
> +       if (ret)
> +               return ret;
> 
>         fsi_clk_invalid(fsi);

If it is needed for register access, you need to call it on
fsi_hw_startup/shutdown() which cares suspend/resume too.

And I guess it need to count user, because we have FSI-A / FSI-B ?

> @@ -1963,6 +1970,13 @@ static int fsi_probe(struct platform_device *pdev)
>         master->core            = core;
>         spin_lock_init(&master->lock);
> 
> +       /* SPU clock is required for FSI register access */
> +       master->clk_spu = devm_clk_get(&pdev->dev, "spu");
> +       if (IS_ERR(master->clk_spu)) {
> +               dev_err(&pdev->dev, "Failed to get spu clock\n");
> +               return PTR_ERR(master->clk_spu);
> +       }

As Mark mentioned, it should be optional. Otherwise it breaks compatibility.
And we already have fsi_clk_init() for clock initialize.
spu should be handled in it.

Now, it is called if clock master (A.

(A)	if (fsi_is_clk_master(fsi)) {
		if (fsi->clk_cpg)
			fsi_clk_init(dev, fsi, 0, 1, 1,
				     fsi_clk_set_rate_cpg);
		else
			fsi_clk_init(dev, fsi, 1, 1, 0,
				     fsi_clk_set_rate_external);
	}

I think it (A) can be checked inside fsi_clk_init().
fsi_clk_init() is now called when .set_fmt, but it can be called
at _probe() timing ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

