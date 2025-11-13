Return-Path: <linux-renesas-soc+bounces-24530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D0952C55D8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 06:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 549F834C50A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 05:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A3C2FF66A;
	Thu, 13 Nov 2025 05:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UzrKMfyd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B622512E6;
	Thu, 13 Nov 2025 05:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763013012; cv=fail; b=iJUHSlUqTjnzFwDsve09a9JVq7TaDQCDdy1UHMHj5wPYkXBhJWucRGqgIXhWTjmA3MzvWg+D79myGqlHHlOhBfYv5ndpdUGoaFtG6UwE06zjrOTdTcgA6P8m9UYceMfjNmHW70wmNhvwnzOpsa4zOvYnysGKYp9sSgISOjGbNxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763013012; c=relaxed/simple;
	bh=eEbnMxaXi8o7AS+J7tm+LNOyGYfunpNoFHySqA7a8Xo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hlJaItVlJQ8/Y6dBjuyRwK2bSovWJOmir6ky9LrjSCAg2F8hEBPgPlRA2UM5PBqeA5ClW59xML7Fsgw/Il6qJaqqBBYU1Dj1TQ1DYkzkTCWbvzfra5g9OTFRIVFSut5I29GKyjVAfOKc4AHAyyXWWqKH2iMq6vx1zczztAv7qsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UzrKMfyd; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXXbWbfbxi+uAR4nUs3/1aWP2vFiapHNbZk+79VGTg/Zahjtw6AdOfX4CQSVPwa1fkTOjk1l4CZ5L1aiGfn673HblDEZ0vVVlv7HT0ROcPF/NRjxIQTJcKYHY8W+xyhogr2Th3xLqdSsCHA0EaVICNYspLOuxuhj4YTF4gZ0RbuGX8y5onv1rvA6P+eBJYfxEGJ4HOZNwCFnGvcfhktvNarLXWvbzk6rQmoFuzwnlnngrIawxylNB62NoLNMVIeBJ8EJIueHurUJvSZQJXusD61B8GyVOX+FS31HZBJoRsv306nDsN1NWdDLJZajrO9VrbvaJuIT312K/FYabrSU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVQfT3xCr6Pu+4uoUyR3v1mGaWEYKvkrUzdsGRemF5o=;
 b=M0xc6o5ol1cb0Af+/MajVf0z9ZUAT5MjlfLCpYR/Y3aCTN5Nbhpp7GXrTREclJD+NpOb2N0zoWTPKKZzLqnUO5Z5aOtAnTytbZNUFqpOeZ/GKpsW6axzTTp5ns3smaRTZXMoQAd2R5tFHrkMlYufwGJU1BCeFw+fcMfF6E1INkQ/MtbdtWIRS1f24+i3XqTFrlDqxcRhr6M9S+kCA+y3oSxFUL9pJRyfWm9ECs0KtpYQUxwokzOenSN7C9fU1K95PddRc2kVDen+HsIthSlEvxhgiNFKW7bx3GHGJf1fuHs92GuAu3qkCjfMR7SU1oG7QViadqYmeZqPZIcRqBi4zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVQfT3xCr6Pu+4uoUyR3v1mGaWEYKvkrUzdsGRemF5o=;
 b=UzrKMfydUOvBblFJoTOVSafmGj7X26NZr/+xg3vtkUMFHaOoKz9celBa50Ia0LNJWMLeZwFO4TDLtmt7ObxnP81niVEQvMoW8R284rtFSFvkXlqujNVQi9omrLuEPErM/SsOeiVGnzmtds2tJg9SB+CX7cOr+o6BXJP+Us8b/Mg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11731.jpnprd01.prod.outlook.com
 (2603:1096:604:248::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 05:50:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:50:00 +0000
Message-ID: <87cy5mwkft.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	stable@kernel.org,
	Tony Tang <tony.tang.ks@renesas.com>
Subject: Re: [PATCH 1/7] ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
In-Reply-To: <20251112154115.1048298-2-biju.das.jz@bp.renesas.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
	<20251112154115.1048298-2-biju.das.jz@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 13 Nov 2025 05:50:00 +0000
X-ClientProxiedBy: TY4PR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11731:EE_
X-MS-Office365-Filtering-Correlation-Id: e4996451-08fc-4e30-abce-08de22787bd4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xgwKQrYl2AN+ik/LIOcCSMHx5NC9qGEV/g+ujChYueOEtLSTMd5aXhLWIjWB?=
 =?us-ascii?Q?fgRPKt4Och+AEDl/YTW4yXq5ZA7oMjtgRbDVaJ6SDYnLCEJ/qD/7Mt5NKW6j?=
 =?us-ascii?Q?kxIEG2Vcg3A3xGnpnWDLnvtD+ZEz2Lp2d29qxRZ8UIyI7jnRzC6z4uKmRIXs?=
 =?us-ascii?Q?IOOIuGOS1DxVBRNpaoTxVlicktG8WBj1ntU0g2oVFBl0E8eQ9UHVJCFnPj7V?=
 =?us-ascii?Q?iaya6ZbF7GVdaXx8t3Ww4qGwMkTEn18jUxOuUklv/JJE+4IV3t3Pnnc13uYH?=
 =?us-ascii?Q?vpBbqYXfN3GA1BRL+NdCqwU/817NFJVzMqWjK4Z8Qqb1qRYmilNblC36enVX?=
 =?us-ascii?Q?DK0kjEzI5trKlhK01nC0pYtJDiroFKiIMX8zdhrevjPlQrOky63I8aMLVCeO?=
 =?us-ascii?Q?OiDvBRP8aOCbrWK+em1wh8uBjMfKzLkmMHKTawsofMgQA3UIO9d8eIp1M0qM?=
 =?us-ascii?Q?JlqV1opbmhLHdFfEakviq1LPPP2C3/4BdLgQlGLgtgYOzxnjbp9xPvo1FuiN?=
 =?us-ascii?Q?pXXYou3x4wXV6lxYZyaCf/qyw7y5zMAjbQCiMCRH3yG1CoKn/uwsair2MRbm?=
 =?us-ascii?Q?8Fncv86VgFItwclSfah6puqLD2P76ZQ3QQDxorsKlzO43oswC8EtG/6sLNVg?=
 =?us-ascii?Q?/4JTdJJXq/cQmfwuO9xy7/bax6wt02Uh8XYZ4K653vOQ6XTx8RZ7Cj4Un4pf?=
 =?us-ascii?Q?cCYi8twAsmxs8l7ur78Mh79xc5kxpX5ccG0kwnm2qaiVJbti270qPZu/N0At?=
 =?us-ascii?Q?A066veR+XfT1h3xSlzKGUlwf/l5nhev0PWV1fYcVFxHgOWHUjF3Xznv+dPK9?=
 =?us-ascii?Q?96UI1AXNs82YuRyRj/WP6nmsAc/oPz713X1If5Tib/9K4gqyeAeNy0su7snb?=
 =?us-ascii?Q?pA+5j4eVHb8blxh2SX+cNwD2Q4cKmk3R/MoNQRW+P1/H3P3XyQLYis56LfIC?=
 =?us-ascii?Q?XUU1iwaF15bB9snAp66JpFeZ/jlyGE0sk6dKoPkRnFCaTcJHNUXW1UzHh1bQ?=
 =?us-ascii?Q?eXnrCQPP1IxV/r03o8GK5m++am+tFl1vwhmA8qcjaW0TZ4MtYDYk0Y4UfqZW?=
 =?us-ascii?Q?yiKOZWcp8R0z/LenrdWmc/fWokIGA14/sl4xfLCR+GCYYQsKSLByJssYdL7Y?=
 =?us-ascii?Q?FixQ1LZIMITK2sHDk6swiPjungG4ELYXzRabUAHxaS45Zf1nFec6/qKebgC8?=
 =?us-ascii?Q?TsRrRm4TfiMut4DbctIsuwHEanDLYWtARUaAXyYy3NBfgsQwju8rtESibIfN?=
 =?us-ascii?Q?wGwTLFDlvEY6IgHUCUDxuUWAbd9hL6cPEDfyj5gvZNMi4S2Vn1cBBoB24Z7R?=
 =?us-ascii?Q?SHsjj+iN77t7VuQRpj6NeMyeOH8ZL8//ODzAc3xKMGpJC37pgOcf7C+Er+mS?=
 =?us-ascii?Q?TJRtIyEAxszbroTu8UOYf4IPC2OqYw54Pt8Mrs1zdmdyYlov/j9Iwd2nRlBg?=
 =?us-ascii?Q?GuxdP1VmvoHuCfN/kqEKYKZDIyel5VY835nNndhypqi6Xsj6XcbxVuXH7lXW?=
 =?us-ascii?Q?xWagS0hrd0V4Ll9bcFeMLbP9jydpL+mz+OmC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JbLvaIIcNqiybJ3U15HT9FE5nstGuqogy8vU70tGKFyniQKEtuZEs0nr8zXC?=
 =?us-ascii?Q?4zjYnXYYxbnQNEv8l0ERl1NMyEj9o5OhhEyCOnYvjDzdKFMPIZ8t6lbrund9?=
 =?us-ascii?Q?G9MKvqRwrgLyfP1Mw502bgtv96toPb/zwWKFTH4umHC6ybBPhJW0l9Vu7Uoy?=
 =?us-ascii?Q?mYzEfRF+mTqHwbNBEmtFaJ0WOv1FItkppnW5GfcRKLZ20eeSrDnh2lRV6zWi?=
 =?us-ascii?Q?avz5x4PDdrcAFn2f5tYZM3G8cY4iyPhAji2LKxmpCljaxcG+h6tmIR27XmqL?=
 =?us-ascii?Q?qjaALbKdibMxsNRfT1Ozk+h3rCIG6FxAZx6ie0RNu0hNBqJy0S8T/8cLRc41?=
 =?us-ascii?Q?86SSk1bn1TYX6ptWWmI+LgJ4Oq+vxdda3iSpmqZTdWAbq/wiQTQeq8voXb5G?=
 =?us-ascii?Q?OZ4iAshenF3aNyAcX0ML+2kyB4WeVKjfCpijQVEqfnjQy0ogsR9KRea0CDSj?=
 =?us-ascii?Q?7w1Z/ACLXOidR5zyrhd179asjtoANRzfnuWyhuigkuqm1W42MRK9Dx0R3O5A?=
 =?us-ascii?Q?Jh1Redhj3gcI1opqfoV+rPNuSIzVhVBnLMLcmP2IT9qFkVP+rbGNxnQ7WVQx?=
 =?us-ascii?Q?Hrg87/SNQuUcEbzE89loZNesWOZty3EmYUq/BPmfMOAKq31rVUeojMVXfd/A?=
 =?us-ascii?Q?l2wygP6exZyVLPJYUSt+Pd5899OeHoJ13DSkVq65sgpWiB9Fm6itYexq6BJX?=
 =?us-ascii?Q?QPTZPf5SsMwmBEN1Fj1PBjaf6je/FBqdBtu7TnO9/5iJAawg8v2LtkjyTMaA?=
 =?us-ascii?Q?d5WDQGJptYtAD4Dpkxgp4GFz7yc1slq9SZECr1QniEcLLdWyhkOjS/eub3kp?=
 =?us-ascii?Q?MCpso1PTDmO9qJKxK2tlAlJo/st8FZW/iK3P981cL0n/tafeGAD4qiYgxDiM?=
 =?us-ascii?Q?aSwbUkiLv4WNRldNqLXmj3FRWMOGrnIhAwmUCLuhJoqGzceQhjth1KA994Qt?=
 =?us-ascii?Q?n4kRg90dyYSOs6iZ+0SYc6gV98bNu92nntY3QVeQCLnrJHMYoMJB75MjzOAh?=
 =?us-ascii?Q?Q1oSTK3EupbFIgNCIoR1OuVskSIXAn5izRzgcaiStmY9mZre+NH19aCywfkv?=
 =?us-ascii?Q?6hoUPhLUajfLSh/A08bynVNRgJZIaTzXPpJdLqxZ+SoDl3uHZwi7RusTKtHG?=
 =?us-ascii?Q?6Q15+0iRA8wIYoyur35isOkxzOx3gd+dhmNe0QgoO3z8vusNgycb8rCiEG+b?=
 =?us-ascii?Q?afEVrTtc0VRa2JshHu2D3ELS3BDZqdzfwkDFD9g/rvHJx3aQW5JYm9QuHEUX?=
 =?us-ascii?Q?TgJTb7cVyw2bjXLEPvJn+lHDcif9KNPaIWjRvEMXYcu9yJJWn2qm9hvjMN3p?=
 =?us-ascii?Q?WESrlPX4or0qbn8/Ne5xEAUA/NilHnjEfW9dQDBnYAHyObWW5gHi4VT3O/BK?=
 =?us-ascii?Q?AwlFp1UqqyrHl2bx4HAnhsSZMBVNLh0+bDaVRiaqUOsinxyAadKtlMK/0EM8?=
 =?us-ascii?Q?SaLXmcY+S4YtYqIcHtaR0GctZckwAaMQJhJW5U7Q54Sg22uC3qIg4l/4lJZQ?=
 =?us-ascii?Q?xU7Lo1WxW7Pg4GTnDGi9PJ12uwQoH2Rhi9ahAo9HFPs2zg4sLhxXh1pr5PHA?=
 =?us-ascii?Q?UnNEDrbYA4n4vma92WZte6UfGJ2nib+d63bkGmWpTeQO1ciSSvelw2Fy+EXZ?=
 =?us-ascii?Q?WKGxOZgtMLzejSCa4JDA5/0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4996451-08fc-4e30-abce-08de22787bd4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 05:50:00.4473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAq8WSmVzpZttCW1MLadzbQoPNBvN4LdByygQLB0Wrfh4IqOKd7mnJNWyp0WaD3f9iV1SHcEOLEfDRAiG2LLbXERbHMl3EyB6A3oEYYCnlyvoGhIxh+5KLi+r+cfTptp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11731


Hi Biju

Thank you for the patch

> The full duplex audio starts with half duplex mode and then switch to
> full duplex mode (another FIFO reset) when both playback/capture
> streams available leading to random audio left/right channel swap
> issue. Fix this channel swap issue by detecting the full duplex
> condition by populating struct dup variable in startup() callback
> and synchronize starting both the play and capture at the same time
> in rz_ssi_start().
> 
> Cc: stable@kernel.org
> Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
> Co-developed-by: Tony Tang <tony.tang.ks@renesas.com>
> Signed-off-by: Tony Tang <tony.tang.ks@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
(snip)
>  	if (!is_full_duplex) {
>  		ssifcr &= ~0xF;
>  	} else {
> -		rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
> -		rz_ssi_set_idle(ssi);
> -		ssifcr &= ~SSIFCR_FIFO_RST;
> +		if (ssi->dup.one_stream_triggered) {
> +			rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
> +			rz_ssi_set_idle(ssi);
> +			ssifcr &= ~SSIFCR_FIFO_RST;
> +		}
>  	}

nitpick

 } else if (...) { ?

for remains

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

