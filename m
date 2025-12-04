Return-Path: <linux-renesas-soc+bounces-25544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7317DCA22D7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 03:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A306302559D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 02:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CBC2E1C7C;
	Thu,  4 Dec 2025 02:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X4KleOdv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7327A2BD59C;
	Thu,  4 Dec 2025 02:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764815612; cv=fail; b=EsbBvIyzfn3mdTkfextcr5QTvJwbehvax3OfAazC7a6P/b8LwqJBmUPLG/lFKGf1Jg2Yup0hF4LdeB+nY5TK2xvO+lK5ma/AFmsl+lpxr7DS4pgQJNAr4bf2m54E8CRwarTJewl4md5BGTYNtQcmsyHWCdw1OlKLftWgdYAtrSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764815612; c=relaxed/simple;
	bh=IXOd0S+IyzdHZY+c8SCoiaZS49AwfpAA/cEZblEPmmo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QDyvihdn9Wy5A5b1sFuHvV95cUvQbvLdxctiSR5DLyFtsMm7Lm8jqgAKL8abdENi5JNUtexyTYsrnmceHqfyS57s11YE9+BJb/FMrA5DELpVR0RK8gGYlrHUPV8b7a1ur3LYqvLHrcslhPeXMzTHrMIdJ3yStxkLogG4Hnsrr84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X4KleOdv; arc=fail smtp.client-ip=52.101.125.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfEmKZkJldiVJJvyJrClyDrSORcaRDGowvZiMbJbRPsIx6ALX7dd7wyaysEkaJcZUpsWccxVEnw3zSa7cNQTgrJxBVKDwecmBvnBF7MkFEBdMoot9QrtK9ykjOKpLTGGw7VhSvEzXS8h2dyaa5/WrCmVTOcDY06DiZkS6EMq1Ygh0JQ9cJso/8LZtoC5XIyVIJcC/qXwDXUEpUBeFPhci3xzA26A8y5BHpnw+mL6Gz61EPG6p6VHnmsJKGN0EQkSxD0lAwM0ER5rr3PUt9pIUFX7DHJdbGG+N9WlIzGcoaU0wMtQ6bdOIUDNDnHsoK89CmCe3GRngRQn9m8nntTJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LKr7FqzeMsnyu5vAucIet51087jXJH2XCMzsWmaw90=;
 b=iOuWUdkR50go6jeCrDpaXeRzG3QanHbpyqP/hlkFRNtxTKzBG0xMRcwJavE8IGMjfG7hH05+V/s+h20QaIHptU4Tk7Uo1ZzdF+TbJsX+bYfOsFj+dCcNzJwGBhICMEljua3eLe3i8Wi0dQOZsZAjFy3344TgSnvTmjZBVhtAlqZaPtlp+7lEUh4rw1dmDFH2RlK5ooetTFBiTGhlYenBF1L4miZe4IduzuXBxS1ITbbPRaeJAMIzILSaWYRD84/0jlUH3+7vkFyMhH91Xw2UmayboWNwJDTvFl6u4Ru2kKD15FyX/dxj3zVNnPLiMbzL8MGCdP1kF/X7uCZ+YfVHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LKr7FqzeMsnyu5vAucIet51087jXJH2XCMzsWmaw90=;
 b=X4KleOdv1hQL5zFjglWppTLNlW5vHuQGFWtTcuIqaYJCYEw3aIfAFqPAKoVQ7M6InyfqDR6Gf47aZi70/K8WgJ2HWAbLx1oDtq79/GJLQn98P8Y7uAKNqmrhWHRPdd/j3mKyrcDUZAsWvwHUp0bPcOjL/sVu5NocIXJbNwF0dA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8660.jpnprd01.prod.outlook.com
 (2603:1096:400:159::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 02:33:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 02:33:18 +0000
Message-ID: <87bjkfrn6a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mailbox: renesas: Support MFIS mailbox driver
In-Reply-To: <CABb+yY15RqOtCav_ug-7z8n59TPnm2axVCUeiw3RsAvgroLqbg@mail.gmail.com>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
	<87ldkvsl1k.wl-kuninori.morimoto.gx@renesas.com>
	<CABb+yY2C32cTwh=8pFGGZijwd1KbpAA5=FfFzp_u1OOo8XPn1w@mail.gmail.com>
	<87h5v0xdfr.wl-kuninori.morimoto.gx@renesas.com>
	<CABb+yY15RqOtCav_ug-7z8n59TPnm2axVCUeiw3RsAvgroLqbg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Dec 2025 02:33:17 +0000
X-ClientProxiedBy: TYWPR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: f03b1804-dd85-425c-98c2-08de32dd7bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DIVHA3Gth4co5Av7Fy/pasWpTHhg/uYcUu+mAADDLks2js9yIpFBQY2aU4aS?=
 =?us-ascii?Q?SMUhUOP1NZt8a/0dHL/AIIwyBGACQbYxeCAyDMNDEkMmQHl2ALO+tB8c0S3y?=
 =?us-ascii?Q?1dXzEzf0SJ2/nGE6cxgXOV/ByVAAJXf+U/ozxCo2YkTrisgYiP8wrZBYzhW4?=
 =?us-ascii?Q?s2SZ/LPEGzRkcKrwwKqILG+mPyUcB2S8TYcvnztNwKSDJOmzYATqOTbVX7Zk?=
 =?us-ascii?Q?oz1w2tnBm5T2+LzakGG+85sxKJU86N5jaUYoSi4w2CRZUb5BXdNC/X1d/wwL?=
 =?us-ascii?Q?4APAHG+NsKwHSHcKNv+ghQFUDe+EiPG3kTfPMYoLoGyT6cPpyC1zbHmsycnO?=
 =?us-ascii?Q?KmnQEVUEkceUdIAaWivhSey3hEDNimCP/6AR7FOViAFqq9vYfobbYdTjd1ST?=
 =?us-ascii?Q?w0pgiBuPth1Q1XSF8r9UmCRwzv+4AcJQvP0mIZRSM0UAwLFO3clvvVbjLnGY?=
 =?us-ascii?Q?Xq6gWUDJTBA4XWTTYIAdw3WbpannlghQnJIdexOcyZsoa84LP2CBk1tlTk7F?=
 =?us-ascii?Q?CkRYDawok4nYazH5lNCApQHmY/SyzjARxnjfYNM2FsuSU/Eftb8uvPZtVbvR?=
 =?us-ascii?Q?QWb5aEwSMMqW9lY0Vu1UN26rwDxadu/Hp0B2zXK35SioZl/WfuROpuTsY1AO?=
 =?us-ascii?Q?NafoihvbogHABmrDDxY1z++kIx9tw6ee+bZSOT4a8uoOrEJSXpphkkVrRC/G?=
 =?us-ascii?Q?1+CjItsL245MQeIzLON2Vrx4uZvN9GRB4a2LFG8nJ++m7oKgFQvNqdVkRtw5?=
 =?us-ascii?Q?CHgfbiRH6cyKCNYI9NkaX3bJw1+SGZ6Em4Vs9hCdctCeYK+v+OczG0/OznG5?=
 =?us-ascii?Q?Xg6LSH7i+LvhHcUKtLHHdPk101xXpLjMq3xhQqgR5vOzFreGZWPWT8tJg0Fg?=
 =?us-ascii?Q?jAsdzzErDYHZyMofK3ITC6yTJPeb6aRwT4tCJ3pjfa0lvng4ApyHi33odZlM?=
 =?us-ascii?Q?TyVF6W+JD5d5DfPJbtgI7XuuAEdfsxaMPcXuTTjU8MlfQEkFswxBFmUel/5E?=
 =?us-ascii?Q?sxwinYC530VpNWMTmScIhVpfvSRptF8VPnzWp7mWlHk/gIq8n3pYXoEwpdcu?=
 =?us-ascii?Q?GN4/gETQsqGg01R8lu/9BCEel5rY9FnZYw29mO4U4Cg3tTStmEfL+GiB63Rm?=
 =?us-ascii?Q?nHVeulJAObBw8TEplLJzkASW5nLcyiqyu0pjsaSYBRXQrUzBCKiYQimszlHP?=
 =?us-ascii?Q?jtLBIFPO56fiZkzNrhxWj1hXIjnvDG/c63IYY1+xKOaWyue75U0KfRmoRFM9?=
 =?us-ascii?Q?gw8WdDeabJhVGQ0vtAZIHUXoD2a2+l6XKJcj4lEKGQ4JTL1jP3nMb01sNnkK?=
 =?us-ascii?Q?5jSQb25BJkRhCM5XEHHHSZPEzwhfg3U7/k4UjiG0TyzI79m6YPLr1BMk0ijd?=
 =?us-ascii?Q?/I8C4/6NbNNVqlvHvbBsruFPzC5gXpCHOjxaL3Oj8BnKQsWILmrFarXWNRXg?=
 =?us-ascii?Q?vh3JdSj0A7NoVFGvpCqc5ZdhyCYD9AgSQ/TMjP9nA3a/Cou7Gl3gHw1WAC3H?=
 =?us-ascii?Q?hEy2oqti+YrA9iXZpcQ9Z5lXHCqPtMQkGj3n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fFAU1/uuvqNL/PZm3FxpXfVejf5HN7SkPWd8uV7eLGKFDOEMajacxdyWysnI?=
 =?us-ascii?Q?WZy0l2qNHjBqieDb0WcwqxXvZja9N9c61pMB2qp3cvHRZvlj949LhxOw8hxE?=
 =?us-ascii?Q?FeyDlBwifqMG2Qd32oNInemqYDyuxaNs19QzpzqOtU70G/CEs+42OzUVw6xS?=
 =?us-ascii?Q?tXipGv/JiDFLnPnpqW80rNGBJm4DKDLsIYSd+wR3mZceZ49xCVyUDVIwkjdu?=
 =?us-ascii?Q?tlL/zG6OOYGniqbrvZMnQpHxtwmPGX7bR4Yttap2VV5pyqiGvUZL/4fQV6Lp?=
 =?us-ascii?Q?+fajQkABZdHJpUWyji4uYE3Pk+x9AdmKYh112ODu0FfTX348v4bvh2+UwnlV?=
 =?us-ascii?Q?2GbMOt7s0jISWyvOMigG2ODL5vTSmiLYo88ZVbn5RlKOg16dnSi1GXHqg2/I?=
 =?us-ascii?Q?V24rkWjx1zbrnRjlLU/Blmvz2Z+PpZwBFmLM9uhw821aDU37LO8kAf4dYToB?=
 =?us-ascii?Q?gSedTaGq0dEppSZIDFwikGgNUsRVVrXXdz88IL4mUX0wv45tvAgRK1aEFzUx?=
 =?us-ascii?Q?9+A6dqJynexIByuXf65eGCXVEOgj4aBWBdWiqxb+HZWoE0xsGr27CNHVZp2/?=
 =?us-ascii?Q?zEyD7iRpmr3wuTxrcE8Xf+CjX6ii35t4tb2kVUZ3yHV9gbW9G0EGVs3h+1Lh?=
 =?us-ascii?Q?rDAtN+brJ13/6nb4Ic70OLPDVxleo2yQs3S3WQBl2VQLP+p0U2DVxNa14sRK?=
 =?us-ascii?Q?630NT6SPBezIM3OpEv/06HEFHWhZ6uzempvhxvl+bmf3vIburtEoGRmHDbpP?=
 =?us-ascii?Q?Mf+dcqJJjLujkX2nzH9JAeOjPIMTPYkIn2hBXscUU93jmi+OsDF3EZac2SkW?=
 =?us-ascii?Q?/QVaHE+J+3ih+Yfh6uOvWtkBp07Oez1WrsBIVIAQLDZN/955tJ0n2vt39rUj?=
 =?us-ascii?Q?aHS8noYKVnZZCyk1nm2J32Z1pk+PjY4HAHKxxwPw0PVHPnmwiu2gFXHAdn6A?=
 =?us-ascii?Q?bpa58bDQAUvIPqLoPoalXP/R0vgRRZYkHFClBElxXnEWKukcTx+ELbGlmeG4?=
 =?us-ascii?Q?pd1leJsUwEWEjUN3Jkqw58qUxQVHoc0TZDC/r0tz7GQ01vgDNqCwFkIOwZzp?=
 =?us-ascii?Q?9stQMoDEn3bkoH9sXeJztHv1OpyYoqjpNNrSMGGlI0pqx+a27GFtqXtvF2+K?=
 =?us-ascii?Q?dxDPZIKKzDTukMX7KAtOKJljgbRl8kmznjr0G3qAODiEKylyQrvVFIetf0LE?=
 =?us-ascii?Q?xoZ3p8ti8ldZhPfAVOrbhaqUx0aGzyXWYeg9GhRCU9duKmd3XC3AyvOl0hhP?=
 =?us-ascii?Q?2OgrjkKBoN8LA0NdreS7lYxLgcAmce1UVbVILsR2HyP+9pdA9m32UURkwBuC?=
 =?us-ascii?Q?/hPKAKYVJDjsyAKRw9WYW9Ckyo2zRCWPez+dFQMcaEVc7dbXrZ3Iv2DsCWwV?=
 =?us-ascii?Q?PKvO68kPYcjxRVm3AuP0+LaEUEbXZ4N6qEWOUOPoDJAijpSbBeBkvN1pwFfF?=
 =?us-ascii?Q?UUf3D0qXQQcl9+YHYAJFT0BoMyt65ALS2spQd3yZio56TKaTx2BYzDbKQkHJ?=
 =?us-ascii?Q?sJ7cB0XdXGZDAodf7mfMcfsyB2vWsK/1YRoXcXZBpYwUdtHhJFPOJzpvfoYY?=
 =?us-ascii?Q?jTtts+QZDDnVq37RuiEBkfprnNfxRdS+vBL6BWYNjisdU0t1kYuWBqjVWaWm?=
 =?us-ascii?Q?XL0/czYaYx0M7x5ycZ/y8VE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03b1804-dd85-425c-98c2-08de32dd7bc0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 02:33:17.9855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ts0V+weiGgqyu0ujTNmDFjEbGfzZawadUeiYYEwyHrGANSus5qUAiEDQasJydO6OSE8SqwbdeK3adlHl8S9TEiAg4er9GpDahxQ4CmnhWCDqwtaKKukGkgQFbfonFao2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8660


Hi Jassi

Thank you for your feedback

> > > > +       mbox->chans                     = priv->chan;
> > > > +       mbox->chans[TX].mbox            =
> > > > +       mbox->chans[RX].mbox            = mbox;
> > > > +       mbox->chans[TX].con_priv        =
> > > > +       mbox->chans[RX].con_priv        = priv;
> > > > +       mbox->txdone_poll               = true;
> > > > +       mbox->txdone_irq                = false;
> > > > +       mbox->txpoll_period             = 1;
> > > > +       mbox->num_chans                 = NUM_DIRECTION;
> > > > +       mbox->ops                       = &mfis_chan_ops;
> > > > +       mbox->dev                       = dev;
(snip)
> Cosmetics are usually for enhancing the beauty :)  If you want that
> please use spaces instead of tabs before '='

OK, Thanks

Thank you for your help !!

Best regards
---
Kuninori Morimoto

