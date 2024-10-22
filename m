Return-Path: <linux-renesas-soc+bounces-9975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 339899AB9FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 01:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA4A1284AE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 23:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46CA1CEABF;
	Tue, 22 Oct 2024 23:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gFLq7Nr2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476861CEAAC;
	Tue, 22 Oct 2024 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729639283; cv=fail; b=HO4zVOL6oNJ71INpCSxSJDBO063AWzRxQvsM1m8nM06LslNc8gPM4mFGTrTjFSer/f99U1Fm8WTMFHIvE8SyNIP9js+mFso0XnY4ocMG7j/OTmvvsRauj4P9BdJ5ZAOL5zzmEI9kxOu8tmf5i88kM6Tdz7UzzvuIXLxhG3tMM70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729639283; c=relaxed/simple;
	bh=fiMWM+WpPUVMrHHVqsAuDbuuWiM25BwQC2zSkCmy5aQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gaft6lO+l+dz2mRJjNkMLpZpByzo2Tfsin0lm9Nl7Ol4WkdVupmRJqigI5ueYVL+4x7411qKkv/WRFLdynq0iweiFO5MhrR0vcljVhatoPkTiNwZ05w7OYYAN1ygeBT/HU0jTffOoA2yyBiy9u9MtROCZwWUwsEvae9w4bANI3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gFLq7Nr2; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3uAbzjbSKmRqD0gzN7edFN+tR/UiQ95mW+tXgxU/aDfarObfGCj+Yo39ivBco3NL1EeK3p4nXNdVsLszEUcAYLWlGXG6dK907eNIYS3Dup8KMRdmo6ojUn7DvDcqhrvGpNDP2WCeEv9yxbWxte2n3C8KIDW8Lc42+2OoNZ8mCdFC3Kl2JEFVcQ15VQXCmwbBL6LfD8+DUqKN2nhqUZDe4EFHE8qDEjRDYi7XV3x3SX45iynLuS6HhFcL+StDy5kuXtMOBzO2+W9krMmoGv1Zw4FyRwdXpj9Ear7MJkV7iVBKvlaqPAY0NwJVlg9/aTWh6WYjkubi6vvFi62p70uaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lfv1NQKBU2Ah0oteYxOT/ia19Dn+WSnzzaGJr8ICZOs=;
 b=Tc+v/vRJRr6M6KyyGUF3Qg7dSB/B7a3+6PG9tRRcoC8YtNikXYISTgi37Kc+w0n7kWX8KlB9vvbFU9O8KsdEDwJxIGpi71vKeziut2PFLJZDqC+CCoGR8Rho++dr0VUnd9cXlnUIboqmgcOyVSzGpE0zMPuczewNh2gfrAXcNQaR2+OWXIJ6E0vkNIGGM7NNnqqopxZSyqLLPKCttmcYZ6s/8I9Q4/k0YntQGG3riLB6ZlRVltQmiQ1ia8/dEUCPk9k6Hq74RlP01XAfL/ekDO1vHLI932ACks1NGR9T2p3xax87WOWiH6wyrMiLN5MjY6wN920hf4GaKnQzDWyHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lfv1NQKBU2Ah0oteYxOT/ia19Dn+WSnzzaGJr8ICZOs=;
 b=gFLq7Nr2JVfH3ugFz+wiKv0n9kmeLgB+GVgUTYGNrr+bjyE44sn+XoyyXDfp6P5n8/R6Ji3f1zeZHAVfws1ZtdkOwRyyvlgSAfgv6SK2AYaTyXFwr+7clb/EVV+M6zzCJ75q0kgvddcZCY608i9gPaYOHSOnykwXLpyYafIKorw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9412.jpnprd01.prod.outlook.com
 (2603:1096:604:1cd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 23:21:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 23:21:18 +0000
Message-ID: <875xpjyb9t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Add entry for Renesas ASoC drivers
In-Reply-To: <95acabb5-38c4-4c4e-93de-36d5e51a43d4@sirena.org.uk>
References: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20241021201349.395022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<95acabb5-38c4-4c4e-93de-36d5e51a43d4@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 22 Oct 2024 23:21:18 +0000
X-ClientProxiedBy: TYCP286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: c5332ef2-72e1-49ce-b254-08dcf2f03b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dhbocQDYxW6w5ug66WMY++1YYw+n9NppmL8SWnxkFCMTsh/HXNC4th05YelW?=
 =?us-ascii?Q?i2+P08j73Cf2N6ntdsa4FW53TulEyoGHJt/Z/vByaFA4Q7nUxFySZE2MMKp5?=
 =?us-ascii?Q?541ATnmJSyADbfCsXjlsrZK4lUHTfA8Y9Xc0ouQr8WkdpSw5RhZjNFc4TYQs?=
 =?us-ascii?Q?cGImi3w5BhmAv3pet4YRUpH3JLh854rzMusjNGdg74G+yherRJh4B4gNKOYj?=
 =?us-ascii?Q?bw4Vw4OeyNONytYiewVckmisaKYY0UXAsHeQZeClmCtKMhZN3b6Ml7KFb/BU?=
 =?us-ascii?Q?i9SKKAPr6UX55oxSpyyiH9Ssqy1omH6w/fzkw4joY2PuBx5skgrEijeM2wx2?=
 =?us-ascii?Q?+NvJgmOFgh0maLHzWcNwiplnBB9x6VlV0/8RjnMJbpUytyAWyFW3t4a/GFTY?=
 =?us-ascii?Q?z49ulKyfPh0O/HBId519+jynZ70QVus0Fq5kgvY9S1ejMB6+2wHmZrnBbTkP?=
 =?us-ascii?Q?98lZaMWBM+p8m8aNJ27Z/lMPGjHsniwR5cbN7DxSuGh7LX5LsjenIuNPd28l?=
 =?us-ascii?Q?aV8f547moBSrs8mBmrD2oNZq7PM5IuB/J1iWY+Zm2fTvjohCQY/pwhIdG6z3?=
 =?us-ascii?Q?mwJcmNzulr4H45GedLLCI6rAJaqlc2U1y71wuJws02ZBmXaizTrnSFb5bjfJ?=
 =?us-ascii?Q?Y6V3WkK6VarrqXaGLjn0OLtai35VV/B5tbLTgqZT0bW0D3e4Ctl8VOfjWkHZ?=
 =?us-ascii?Q?FH2vICbYknJNoH+UIDPDZCcRy78F+ILgFN4A1tAzfpj4iZrwl+w3ct/6Ex0/?=
 =?us-ascii?Q?1luNBivJT7+Jrsvuxn9mZjBJCfMr1blcELmiI+/nIYSlfP19cPD1EPQin5HD?=
 =?us-ascii?Q?GuKXPLhf4sYZirDqKwt40CvxEKjvkTa4+dbckVGk1AOHqtXG0t9UnmP1wgff?=
 =?us-ascii?Q?I7yn4DnkNEO8WcLckxcc5Xdr9zuTyYv44sAzrPG2A84zu8Rg7nHqxtoboAlT?=
 =?us-ascii?Q?gQ6FrJEpuftZcdUR+CDUdI1fcWgp0QhGFWh+HMo97n2/v5V7kzBh2OFMyFZP?=
 =?us-ascii?Q?Ok0p3a6dOeLG3NLuUGo47KXp3oTtyc5XPasDFgxGxdd+3zAB/QKGPF7NDDRD?=
 =?us-ascii?Q?nXdjolWVPO479Als+K9ba37mAqm/2ntS/S78b9rRr+wURDvR47ig9kn0FD26?=
 =?us-ascii?Q?98xVrpjhXH7dj5muGhrmj3MGg9wXhZXEgjP9U/nbkckwVG33fqfu5+mAeWOU?=
 =?us-ascii?Q?Tn1Fqjo38Zkxc8DcsJQ1pz8IiXuKHE+ay/hzTN1k/d9LSZoH71wQCrGfrd8b?=
 =?us-ascii?Q?k2Ron4sRrP1C5wMnqH0YeBIyc06zB4+QeExxc4jgMW6F/RH6qcKWKQaw53Z+?=
 =?us-ascii?Q?Utu87PgLLamjyY0iBFBYPd8l4RhlwFKDXGW1UvVigfioQLdTlvxVmEUF6L5w?=
 =?us-ascii?Q?0lMVaPw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WN25ln6nweNihn2ZLrTh4doyp31Oh4eHQIDFlHYdONr2yjNh67wCUUexPZaF?=
 =?us-ascii?Q?sODe6OM5HzVKfhimd7nijvcM2bbEYTLbUYa7jBiay+oTRdeAkVTSHfXtaGUB?=
 =?us-ascii?Q?I6Ppj5YvUVW2fYpNPShEQr9ySBTGhA41UoygVMGpJEWz0/dHsIFYAJUrBUDD?=
 =?us-ascii?Q?5P0yLP56Gq+6y0vjHmy4uOI3bfhRzQ8iADTmgISjP4e1fKp1dAPO7qDoxHDo?=
 =?us-ascii?Q?5imxDxbV71hbHeHrmOkbPG5IZUVd7omhgYFLcPJfLRJrp7DyxofLG747xcYF?=
 =?us-ascii?Q?VqbUlBi5/GBv7S+GT5mpFiP9xdpMp5SuUrqc5CUloTRHaqGR4C5+3+4uVvsh?=
 =?us-ascii?Q?HFoc4DMAOiEoQwq7aHiyERklvM5WlNi+dwexbwYo6KuBtz9A1qPtEaPP7q8H?=
 =?us-ascii?Q?g36IXowxs1kzTl+54PTnx0INJYGwydznZOgHUL102agSYpCq5v9TLq9WjYpG?=
 =?us-ascii?Q?UM8syx9LuEPbGTrEnrRiBijGVLM3dTi7rDZmzcGZVD7OOrMbOgTE1ZDt3u6P?=
 =?us-ascii?Q?Wk/x7HxeyHuCCXBpJIpUcVCMBHf/Mv0VJW3FUMZbkClga4DzANv2jvDIlHCC?=
 =?us-ascii?Q?0Uh+LcuvPl0gfH3as8T80urQW9LgUUu+IQadqZ5NRih8Wgb8jh3M0C/fuXR4?=
 =?us-ascii?Q?mRbWBWDM8ikSYB0DgmxTCaHgIL2yoSHbj3Wp7QCciMTshYBDPlFCigjTO+ov?=
 =?us-ascii?Q?V7nYCfySofd3czNwjFOs8RjmI3Cg3rZCJirfp7KkpVk/bM7Fjm/oRKaI+d+W?=
 =?us-ascii?Q?PnHf9C5l1xJHr/IP3SYPubQFXZpEObrkdYGw10DNMWxFx+yu6igzf3XnjndK?=
 =?us-ascii?Q?QbsUUqU03JAAyvtEEBMW02ruRjeM0xLb/IeUEn8TUcaRTv7B7zEFsIbpEbPf?=
 =?us-ascii?Q?JCRGBYvE1U8DS5rwayEc8Z8xcREQTEqoLSHTVwVt5ThElQc43QF/yjmqb2xB?=
 =?us-ascii?Q?6MlFOnAG1MHsEUMyz0u/xJFkmUjO384n6IPuFxaiaWB52GNqwBhp1aSNsBPL?=
 =?us-ascii?Q?vy7/7UNTUY5D0GDr7E8iCDy6qCGnS5s0PDvxhkTqXMnFkimQdOaHymsNVRJu?=
 =?us-ascii?Q?xVOhm/uIiuiskaF44B8SZROxpj8cVnxvcLmWG0kQPEmecbGiKM/gwQ4UNHg3?=
 =?us-ascii?Q?OuxXUO5tPVCGy0dt1hg8ypJdM2TqvtUgIhGr2HcaNAy1MtyZR3+ptUN/wao/?=
 =?us-ascii?Q?OKastEs1HOGh6019aLwEYICmynRGu7iGjRzJ8AgvZnrdSxvrYCZ/+qbKZQUk?=
 =?us-ascii?Q?NZNE3bFfM3yYd/OvUI/5sW8//fL13PvVMmqPlKFMzIJIKFGkA14D06mSLqtz?=
 =?us-ascii?Q?h+n2kvMokk+/omYAUqtN019uy6Ii3ew5/QWL0ZJdrHoCzfbtnbviKhb+cB85?=
 =?us-ascii?Q?xTRd6YSpwQO1mmOauLcy2J39II5vhqqRYTOOJIl1LJkeI1H8+1qtE/xx0Dqk?=
 =?us-ascii?Q?DhDS3TEQpS5K7GTLSAp540tTpSGHj1WfvraPvzsKO0NgX2JbTOIn56PsfrTw?=
 =?us-ascii?Q?1K/jz1+kJLgD+1BJFi8A3q2Mfh9F2cfIFMLUUhs66GM9iLpT6xRpG429qqjy?=
 =?us-ascii?Q?9i96kiD+JI/61H2owjtg3+t/IPjCD6si+rEa/g8H4G3zCK1B1OR39Gn17HAc?=
 =?us-ascii?Q?2Cv6riYFpdOik8sg7AQ3eRg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5332ef2-72e1-49ce-b254-08dcf2f03b88
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 23:21:18.5467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mP2h65LdWp1zjq2SVJPULHZkbtSJwpE2WUEo9IDdmw+VOZHe+Zx3IdXYuvBAwWuVUbPeZ8lZTjx38ZtgzuLCrwnbjUsZyXzFDCa93+GoLcW9Ajk2MLdu72VNfakBx5Yn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9412


Hi Mark

> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > Add a new entry to the MAINTAINERS file for Renesas ASoC drivers. This
> > entry covers the Renesas R-Car, SH7760 and Migo-R audio drivers, including
> > the device tree bindings.
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  MAINTAINERS | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> 
> Morimoto-san, are you OK with this?  You acked the other changes in the
> series but not this one and since you're the one being volunteered as
> maintainer it seems best to confirm!

I'm sorry that I didn't noticed this patch.
I now replied the comment.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

