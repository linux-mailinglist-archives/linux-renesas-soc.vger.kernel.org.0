Return-Path: <linux-renesas-soc+bounces-1093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71780813E01
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 00:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 514E0B20BB4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 23:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E06E66AA2;
	Thu, 14 Dec 2023 23:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="m2d+qd37"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3C5224DF;
	Thu, 14 Dec 2023 23:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEdC9eEBRK+1FSOb8Sl6MJfpU4SUF/j81kTCwdhiJjMG7U5ybhPaLUN+GYIEx4Q5GqqwKoPG6iIkN3SXGxAAeMJEHy+9Npw5pPxNkcemF7T93ivHTOBU4VLcyDsjFzZWW/XPQgzVTAfENGjZ11UV6k8vhHo2wHugOzRsuTnQVfekDIUz12qhvwgueMa5Y2rCVX8VqxtypoloJREm4Jsn3Ok1dWlhJxQUdUkhMjTZRWddHWcoNPpbPn1i1wlaxOYgdoEfdbWDSMwtxUstT5tJWFf5/GbaUnNoUxS7r7EdvzHy8HWSJQbPqUDh0Oilyczt9BG3zJSEAzl4vy71AOGsNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP0T5GixPraMcgzK031XcBJ9qzFZ4O9KGF1Tlntxv2I=;
 b=QvW4Xo2JIUXHvJXdha2dxoiu1sQzlbyLD4mKBobJ9Yrheh1hchHkGgMkuiswq381GIZwX/7lRFjdyMVIxEDXMvWIsmPMfXtDMAVrjm8GS6Ykhd7twe9+h29+4eyJOO78f4eLOfqP3+PRg+2q5MiuJKwxTLkksYbyjaiZokqXHSYifWogLUZVhwQqJM6UGv+bjQfozaMh4y78qJsUsgp4BixGk5Tzio9J50qQ95cSNPYWKhhRUXQYqSom9wD2sPHEco7zBrn4BPQymVDw+DypJLECMaN6BY5vsXIONv6DqEuGvpQ8bEqesGxLFfwNINRt7yOrt2I1Que0gSFnSoh1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LP0T5GixPraMcgzK031XcBJ9qzFZ4O9KGF1Tlntxv2I=;
 b=m2d+qd37qNk+iyEYi6uvJJNbrjJHq4k9pCh9vtfqM2s9olDAo5QrAio4XKNUnS/cLs7+71JaNAv94brz/afQSmI6D3brBQ83DDBoW1DbDAeqr78da7CVIKew/7auCLfeAK4eXAX71wbOki/HPsj/mhD/9djTIRl7D/5NS2LF3Gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5660.jpnprd01.prod.outlook.com
 (2603:1096:404:8059::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.10; Thu, 14 Dec
 2023 23:07:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7113.010; Thu, 14 Dec 2023
 23:07:49 +0000
Message-ID: <878r5wpem3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Frank Rowand <frowand.list@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Aymeric Aillet <aymeric.aillet@iot.bzh>,
	Yusuke Goda <yusuke.goda.sx@renesas.com>
Subject: Re: [PATCH v4 4/4] drivers: clk: renesas: ignore all clocks which are assinged to non-Linux system
In-Reply-To: <CAMuHMdUx-nm6k9LXbUJAJ78ChFYHVcmGcoz0YhWyos7h99R4wg@mail.gmail.com>
References: <87wmtlo2zs.wl-kuninori.morimoto.gx@renesas.com>
	<87r0jto2yq.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdUx-nm6k9LXbUJAJ78ChFYHVcmGcoz0YhWyos7h99R4wg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 14 Dec 2023 23:07:48 +0000
X-ClientProxiedBy: TYCPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:405:1::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e917c6c-04ab-4105-2bd1-08dbfcf97dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	miD7tj/trni0V/ReaMQ+17cqHYV5seM3+wmtX/jwUAe8pMhgC4UeFtW6jy+IRWBqLI7tnAMoKvzPTXGL2SEQa9/0JKEa0Mu/1UcteZuJJQeH4J0TmCCQxbIbVvU0Gki7pKZZy18/tFrck0xHYstGG1d9f/xBEYsV1ET+UrbiFH/U1cZXqv3wK3vRSwkell7Sk1QZoh/VSB+D1Z2bRbVD3uF7PvdAUjN/fX9x09nFsUjaYs+a9zxjfmgSWrRSTPHkq0xV2sKM4/3uVCVLKtoWKresh7bcURXYTTmxhldcGIXkl/ib6MmVsb+RQ33fCXGHO/mF+MNsuptJFHnNUIwzjZgjXzWfV9AKw0ihAFPqPe4lM5Vhqx1tUTa4V77I6AWCCNkUP/MimwPWzqjvHQ6LuBtz36Si9FF9kJymJRvPwW+gpLLSakor3SedUFcoGhgYNcy8bHcRryfs8igldZjD264+pdRPvO/MeC+M+Lnmo7Ux3CzskHdIPCKDBhpHgAhU3svgAzuYClIUnMWIUiK2Wn4Np/RKnE1LJjnxi8Use1xmbCQcT5c1PV9wbo6luN0jTxU/z7nfyFvilkrgmMS7S9HLj5uR4sx6V3ZG5xvts5+VKzj8fOtCa7mdclDV5LLq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(2616005)(107886003)(6506007)(52116002)(6512007)(5660300002)(7416002)(4326008)(41300700001)(2906002)(4744005)(478600001)(6486002)(8676002)(8936002)(66946007)(316002)(6916009)(54906003)(66476007)(66556008)(36756003)(86362001)(38100700002)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/0RtO5jhlfjQJaCUO5M2pTtyrrNbOKjJL1kaVMFN7boN9iSMDztMgmwZfx/B?=
 =?us-ascii?Q?XgdMnQ21ni0jIN6oDAyfu9kVwJWWOjlcP+pzyTIsBvT1Z95DPmTfIduAHMrh?=
 =?us-ascii?Q?EzzefVOf6ozIwNyL3Jzp5bj0tNLlYMfte2U7N0/Ttzau7eCiigiBp8aq37zW?=
 =?us-ascii?Q?TCgCg1839t4cuYWi+N9z/JlvH+bGO9XLc6KkOPwRswbLQN+nnxg3q1caUbaC?=
 =?us-ascii?Q?/YZyqwQAfXAbS7BIQ3B53Hln/Bxuw1AEWcMh97snKrKe+OWxYXJJja1nZ7Ww?=
 =?us-ascii?Q?oc1qRtvhYSDFHTbeNyiuYhV/ZNADEQwH/ImJ2pmgwI9n4Kvf0Spe5lIhVly9?=
 =?us-ascii?Q?34uHynoXXeCFJYsOksXrdiO6heZYxm7qzTKwUlpFZYFqbCcalQMw5zRXweFx?=
 =?us-ascii?Q?KDVkIf0+TwFb5uJxsxQ2yWZseFvCzf9fBU+mFNyFpTY7hmhSj1HuRGC4YcVI?=
 =?us-ascii?Q?DSBlk5rKPXh/7PN0Wy99lkrbF1V46YHnP3sz4utXKlf3aKzJvxrI8eRofQa1?=
 =?us-ascii?Q?cxMvHlcA1A0/ASde5JWj7/2EN6C0Q+UkpfERksFHIRuJkGLgypi8Ly6c716d?=
 =?us-ascii?Q?EptxOgwigdIOoJS5o0fVc1Jqt87PziQmr26dT9wthHk4d19r4LKdnw2kThqj?=
 =?us-ascii?Q?4jaWM3F+kdS0RrfkYk0pRUN71PFHs+lRhm1zZfU1+BG/vbr/NI2TaoOgro+Q?=
 =?us-ascii?Q?UpBHoDbNiEYX6JRFp60tHAH4zdWTQJsMWXD825yEElcIejMkF8UqaQSBk49N?=
 =?us-ascii?Q?K3lYLw8sjIwRpoDspDi7fY2rg3h7hRQ665dtOUby/ARea4F4UBjmMYhkUpF6?=
 =?us-ascii?Q?MC8kPMhmMIt6WJKScIv5rmqsZcS5lM81ZrS4gZQZeji7CcccDmVuxzNYdsUj?=
 =?us-ascii?Q?kJbQOxqsy4KmG5Og9d64tvf/GShIWD144Ms/Uw/C9fT8eVgwOU9rgy6uyYoD?=
 =?us-ascii?Q?TfZbPJgVWLQxwlf2lFfLXYNLWx2b6p7t9urMoJ/kUbj9uSnSRk1WZgU0Ddc/?=
 =?us-ascii?Q?XbHI8uj7Pknr4cMARBRhj5diX/fHa/mx6Bx+4bOsREPpCTPJxquDQfujyn4s?=
 =?us-ascii?Q?oGnLiq8aecaD7y7pK/MnrNkKv0GCg7U7C4q8See/JcSjRxrF6rPXg1IHCWwf?=
 =?us-ascii?Q?h1ftqOC43GouoMZGSAI6aBishfZ1FiqBtpZ0XYvFKUJf7L0gxizv/FoHQxwL?=
 =?us-ascii?Q?vLGQMdnFDV/XicAAfMg8gpLBJlsjSkwGP5ad5AqOhelAD953upmPmG2H2OhR?=
 =?us-ascii?Q?gx2kVg1swSFSB98qZ87dUHYx3t1iqyZ8u1JEGJYskirJZEVzruNEiN3l+KfA?=
 =?us-ascii?Q?COTQivY1wgTpycC1ms2jpxZ+eLKSvbF/jAXaR/GxpZe8+leppkrsGe19v4Gz?=
 =?us-ascii?Q?ORCAoPTWrP6LfmR84ztQl2H3f+5lGf4QID3RDiKLBX8GubsmGVK4UjHuattP?=
 =?us-ascii?Q?UWn7ZcgWNNUvFC8iMOvYNnc1x8sm5h30vIbM1IubkQWP8GSmydXeXC5t+p40?=
 =?us-ascii?Q?KCbyTadovbb+vbwyQuNWIY0vBINmkeviH/VV73kLGWK2hq6JOtWjOzbUAMUH?=
 =?us-ascii?Q?AgwctVEzu+UHZm79Y17VuSOAROJkxYgfc4YHqOaJK2gNJvC9B1+RAgs99jlN?=
 =?us-ascii?Q?qPxWMJN3+0nUiTsjLDRfnT8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e917c6c-04ab-4105-2bd1-08dbfcf97dbf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 23:07:49.0668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAUuBMdr2SXop8zA+ud0mzqgg9LQrU1YGNvXXGOxRtkvf5rgJYvEy5APOFTobmek8SMGwttPrhhxZGogGDbrECZkDuKAOSSOVweMeA+iNMb9ZUg0FC1aEjHcwsOZEnOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660


Hi Geert

Thank you for your reveiw

> > +static void __init cpg_mssr_reserved_exit(struct cpg_mssr_priv *priv)
> > +{
> > +       kfree(priv->reserved_ids);
> > +}
> 
> This function is called only once, so you might want to inline it manually.

I want to keep init()/exit() pair because it is easy to understand.

I will consider other comment and post v5 patch next week


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

