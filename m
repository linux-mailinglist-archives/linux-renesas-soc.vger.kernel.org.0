Return-Path: <linux-renesas-soc+bounces-31113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEVJJgK62GmmhQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:51:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C41A3D4516
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6098B3004041
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 08:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2003AB284;
	Fri, 10 Apr 2026 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TrvxJW5C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7283A1D14;
	Fri, 10 Apr 2026 08:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811069; cv=fail; b=KP2hAjf9o2LBxDSFCEpKzQU7E0s8ARiGaxJaEEnVPrYL4P0AkJwtqPeAgfODssyK/NvOHdCBfLcilzbM577FEpaHL/jopWPeR8G4cOMyLYOWj7AkPmtmrZrzkb0ileUieC95+uecqaCGbeaR7nr2yKs8qUUoGZqtUg4pF3R3cOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811069; c=relaxed/simple;
	bh=Q0oETuk/8VolNb890mqdrdfDFSqInm/w5loMUn+Ggxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cxUyutzUUSHfefGr/rK29fDGpcucV5qBJzp5cHKEV+LP6locAMzqeuw4Yph1g6iolYIKmX6F8hvDBVynjbSitB2j9CLZmcPsEurvyhIWJ4bx1SXmjVoAIno9qLYP217eM7PAOpUVAwkxeMb3HDbHiSM6z6cUees39MaSGoKZ1Nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TrvxJW5C; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWiZN0zYrS6EG2wDkLc3ny+wgZtgBXwsSLw/NBDEZPkb2Qhf0LVh5tzjN6SpNHGtKOW/aaDtu/PKaeI7o/XryjSOmIRlJ7AgJ1UkPPQKqMx1ZzhEuQcEsLwRd7H/6/R6e82kQS1nNsb3PoHuOQ4DSsroSW1EhxYPChyqyIOhSV9RYtoQ8fQ9cXtRtaqrDfnSl5D0E1/UPvIGAEE1JV1plkCpHbnOjk9s02RPdQ+okypTBIBlC6YNE90+ZqJbj9h5VYSQXdWxvzmahvsN+NcLtYvRG22DLWA7gUirJkNwmFtdR9YpSISvnHqv/DKv14vYciikMPdqbhLrdGz6MDesTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6oIoscg8S3SGiPbSEoNbYAhAILVZquikBO79AZxm3Q=;
 b=fWj+jm0jK+S6HPwVX/ivOPvyqLKTH0jVVX47l+TpupByGTnGLU21UI+Q+tGG27qg2PPdY7pLkUQEFWQ99m1VSlIMHjSgNDM/V8l+4dTPx7HWooj6dCtpD5ky7afLf9eEEMU0Ui4Ab0LXHVdhzkCMBKf1uBMA67MTB87X4TECwBYNR3HydxRIaN7A5JLfcbfKN3tu18PGTdpjRvvkr62M4TA/JFqoXyA9qnpYsUnZv4RWYvrMd9KjF39lKmD1BaH6C9f2zNEAjsUHMBDD5NwL8D18rNqAxYeDDdx/Ha13SfTihSNB+xRz5AYGJt7IGP9dppj3eUlpQttn6A9h72+O2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6oIoscg8S3SGiPbSEoNbYAhAILVZquikBO79AZxm3Q=;
 b=TrvxJW5CIpyb/p2E77STl1OblgSbEEtbhnZ58F5idjX5ZbGFzBSucOxkjxNrw9vCr8rPkkJlyiG149BxaT+XZXP0QQ80i1lKoFsP6m1yNArvzlcvpnwyos3h1bH7Vos9Xkq9l7j8AjYhMHhetBr8ckz3BAEIYbpxr+nh/dSGklo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15646.jpnprd01.prod.outlook.com (2603:1096:604:3b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 08:51:04 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 08:50:59 +0000
Date: Fri, 10 Apr 2026 10:50:42 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chris Brandt <chris.brandt@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] drm: renesas: rzg2l_mipi_dsi: Move
 rzg2l_mipi_dsi_set_display_timing()
Message-ID: <adi54kDkaDBIcHLr@tom-desktop>
References: <20260330104450.128512-1-biju.das.jz@bp.renesas.com>
 <20260330104450.128512-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330104450.128512-2-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0288.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15646:EE_
X-MS-Office365-Filtering-Correlation-Id: 6efaaa07-0c91-407c-7ea3-08de96de4903
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	fNnQJuoEaBqXuispel16ag1JvrE3EVN4g7OmLc/S2nzvrWbcK/D6ZCv+ygTdlqmcxLy32wNBqS197dcN6HmFlwhvBfD5oezPYyWn0JKlmO6zIfN4SoHdXT36hkEsFOKUG1o/O4LbfLk2b44vth8L6nbZa7ej2LwZhrAB+KKCrT+plVWj9Iqc6OqenUkfd0yvf2B19Ra310PZ61k9EKM7JnXnnI8GXGQ14qaWi2JbXPSdv6wCoIsnZxu/vyb2AHg0/x2qRzzYy1A0t3vyLMr+MYWVtNqQIkVf/UMtv0BSQ5+qjhthOjvL8kShH0Izx17mplgUjtVVsXvHisd/ue3gU7SuFJHkPkZrRv4jq1HvhlwpYe9NFtv4fH3BNUgSp6FgClgP9yUkLX7sxSjv0rIKHO40jlm6bJUrpInhVHvbs87UnQ967MfDjoAq7MXRehnkERdqWNnUN6WPB+nK/2YNKkVrnKjRKbiTkhJaWluh+IkuPp5+v6In7zh9JQXBsOMpGuLAm2YMu33NWZq+yoANXam0R+I8yB0MRp9aY9q+nQVXAoqbPv+66/iR6++CoJt5BKdCUH6eXuZTDz7R+SAWOM+jm7HSEGoZP4skNNKUfF940LjpFGv409u4+KydGmDNJfLBC4JGKOEtfFFh0yGppggMbxAJQmv+X9Gqqh1bM657EC6JF00TbOQh980Yoaabv0XmGLul8M03IYuKGq3tnKUea18j5omTwbNdyL2GuQ85jv+ZuMKlmRZfYYDeo8m1pOI02fTKhrVEkPTGOSJ7+MY3iF+y3wX32NGfEJ2nuyQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jHCb1XNHdgZhmcLGMm5/bjXs0lZt/t9rryj6hivTG3JHyPW077/0OjjxHb6O?=
 =?us-ascii?Q?eze+o4ubj/zZq1u1dO8y5OcntQg+K+smug5/7XS14/smX4FEulw3ftPGV67q?=
 =?us-ascii?Q?H66vpUj3IsJipyXLRRsW64EAR/P46IxV31Uh+3WrWoCoV3ejV+bvbPEjv5rd?=
 =?us-ascii?Q?O8bEXCO7pZGaVsS/icpcVeVM2fA+ungqxqExRjKKCMrLuEl4Oo/cMhVyo+yp?=
 =?us-ascii?Q?OXz5YHkYjBPo14ANAzEv/SbutaT1K9tdtOID3+8D3IhnBVK44AA0oS7uaavQ?=
 =?us-ascii?Q?Bhn7DKPOW85HAaM6arlBJYqbPHMZCkVfJ23LaOjIep2NeB5B/ShhB3AqN+yz?=
 =?us-ascii?Q?tAxupBm95DO5rG7ZOU+LP5otPUlnSLhRwX0xlmc8Bultj9SczaxbHKySL8Oz?=
 =?us-ascii?Q?XhObWDWiHy2fDLZvTcvRiYmuzVJ6S6ttRjkg/H5Y7TaMMVSDc5X0Q90VbERg?=
 =?us-ascii?Q?slWRrZ6anoTOd4gHlJ+pxWCnrdr4rQOhV1260izWvrANrSX8GAs5WQsIWs4H?=
 =?us-ascii?Q?+1K8Ur/jOEkicY2TFI9vYN2tTno4bCwK/f5VjEN6fjRZN20800M7YDe15eJq?=
 =?us-ascii?Q?785SuIBs0m+c/xDRC2qp49Gd3FQA4JtrQ9pB6vr+pFbAY70yyxWNxJ2ERuGy?=
 =?us-ascii?Q?ZHhqABuVPeLUodjmVfd+xRt9CITl4/JkYhu8Dhpo2BWlTF4QlhQaF9Nvyl3D?=
 =?us-ascii?Q?E+ZnKrIJpZAHEYXkLKUYh3FtYlM2qob+7ZCu+bEBYpIEW4L8DsV7MwkntGWk?=
 =?us-ascii?Q?E2sX3ogOmhtabw7n/tOZPo2T78iWtSln6kAhIyrIzC6rizSfWD1lEPIq2PtR?=
 =?us-ascii?Q?sJCRrvHgTiGnTXZGsmXsYNPbm5tiDXS+08RgF8a8UYIchCkcLXcedZRDFzJe?=
 =?us-ascii?Q?2CT8k0p1nqkJ65ZTU93XTGTfk5IvYrSaMDyK+6Wz6apmybImbSwLYNDxm7au?=
 =?us-ascii?Q?EsNk8c6cRHQYip94GSqfCHBEEbYwo1954rw4xshovXmeACiaqXWiGscNQCEa?=
 =?us-ascii?Q?Y1PZJiNJJePRGZGzjBpNemWMbDSVYHqhK5rEGr99e8xkXzD4KUtgN0jqIyPF?=
 =?us-ascii?Q?QYSpa9lsLzw4vF3yD+GnSKKeH2QjQ8Houu+Q17FOvqrjWSv99WMGigGIOwge?=
 =?us-ascii?Q?L3UjZbnswh4PdGm+FeoCbTUF+ZrNbDmKJG5D7r7KatuEXQtubJ7A96ct8s5T?=
 =?us-ascii?Q?8jlovwLO60tSSNnTOjF+31OTjOhfjAYt96HnPKcZQy9PH8TBSBj2hgRAP5dJ?=
 =?us-ascii?Q?DveLhGJwBybVINFhLaeNAfe8dfelI78NHOLZ9Ir+nFegYmCKL9+nlNd1aQ1M?=
 =?us-ascii?Q?1+5mpfVwaHVQkpMQFGKi2UGI1zDQsRJs7YJHGtMj42FUOEuLw1Pr6AY7LGSX?=
 =?us-ascii?Q?BpmeJwwYDsJ2tEX5ZOh4b7cNUyNZ2T+q60CrLgiZxoBkc9hQdR1NZalOyIg4?=
 =?us-ascii?Q?rH4ymvKx+5rLfOmubQXkCZN3CS/qPzR0yrVp91vMt0y1/aMyBxL2CLMxyrFe?=
 =?us-ascii?Q?lWiHgZs65GTLFvMm7MDKTi3N2EibgzB5uC9+MO/TfoWrJKmt4JQcnqTIygW8?=
 =?us-ascii?Q?PS3LNgi3+L7P/VT34QWRUd4G+00ERk2ahweIREfNWVHDb7YGpNlHFCr+jzkA?=
 =?us-ascii?Q?TUlqFcEKFj0mPJY9NU6FzyhOgG34nKhLDnWe6L5SOYbakLhDmXL/CpKr2gzw?=
 =?us-ascii?Q?AM2Vc+4GOaDBnHMlrRsaNv0C/tQ/S+EQ5ECCZp+4vWkW2y5Wj2x9+m9AOuVE?=
 =?us-ascii?Q?ua9ez+U1gJ9w+TuaF7PTfj6iKaPgHwr/rPrN2pPo7cnkfBl71yoa?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efaaa07-0c91-407c-7ea3-08de96de4903
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:50:59.0399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sxwwx8th+sFlQG1AJjXSjBuZqPeO0ENXzoTlg9rdSGVMvCZpsGjJb526nmI0sRIaw5uxPPvC9ZS3XxDaxDslKy5fQScNTWOMuSCbc/txHSIRzEdq9iB57I1VlmRH9QWm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15646
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31113-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,renesas.com,ideasonboard.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,glider.be];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C41A3D4516
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,
Thanks for your patch.

On Mon, Mar 30, 2026 at 11:44:44AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The RZ/G2L hardware manual (Rev. 1.50, May 2025), Section 34.4.2.1,
> requires display timings to be set after the HS clock is started. Move
> rzg2l_mipi_dsi_set_display_timing() from
> rzg2l_mipi_dsi_atomic_pre_enable() to rzg2l_mipi_dsi_atomic_enable(),
> placing it after rzg2l_mipi_dsi_start_hs_clock(). Drop the unused ret
> variable from rzg2l_mipi_dsi_atomic_pre_enable().
> 
> Fixes: 5ce16c169a4c ("drm: renesas: rz-du: Add atomic_pre_enable")
> Fixes: 7a043f978ed1 ("drm: rcar-du: Add RZ/G2L DSI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

LGTM, Thanks.
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> ---
> v2->v3:
>  * No change.
> v2:
>  * New patch
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index a87a301326c7..ff95cb9a7de5 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -1025,29 +1025,33 @@ static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
>  	const struct drm_display_mode *mode;
>  	struct drm_connector *connector;
>  	struct drm_crtc *crtc;
> -	int ret;
>  
>  	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>  	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
>  	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
>  
> -	ret = rzg2l_mipi_dsi_startup(dsi, mode);
> -	if (ret < 0)
> -		return;
> -
> -	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> +	rzg2l_mipi_dsi_startup(dsi, mode);
>  }
>  
>  static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  					 struct drm_atomic_state *state)
>  {
>  	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
> +	const struct drm_display_mode *mode;
> +	struct drm_connector *connector;
> +	struct drm_crtc *crtc;
>  	int ret;
>  
>  	ret = rzg2l_mipi_dsi_start_hs_clock(dsi);
>  	if (ret < 0)
>  		goto err_stop;
>  
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> +	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
> +
> +	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> +
>  	ret = rzg2l_mipi_dsi_start_video(dsi);
>  	if (ret < 0)
>  		goto err_stop_clock;
> -- 
> 2.43.0
> 

