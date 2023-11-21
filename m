Return-Path: <linux-renesas-soc+bounces-4-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0557F2388
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 03:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B25961C217DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 02:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150ED125C1;
	Tue, 21 Nov 2023 02:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K/8ebF+o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B104383;
	Mon, 20 Nov 2023 18:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtc3gtYI0i+7P4SVlJkFL+iLzDD8rpsxdMnK3o3NWx/xuUF1AVJ6Z31T390w1q+miW6eYfyb+MYL6Yb+C3QjS6ZJsby1rf2zO0eeLffwnXRhUYsyIklhWGT2CB/cYA5iE+EgmdLLmqD6+VUBjuHFtKIH4X3zgOSXwUqUPqguln1KTOiYMWLQj55WSThgarMgYnWWtXfQvMwxB1/VcQmCQIctdY8zro1w7lyWvm9AD3NOJAIpYBn1gfXxWBz3ZGnwvGAoj7IHEez8eq+2IxWeqTDPMn5QZCue+T11cHZkfKNyBNW1Un5HcetFHl6eUj9Y+jhHcwnkah6jqnG0tzwsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9cF5k+ezGCgOXvewInMKdzIE1SL2+jkFO2jtJ9iHrw=;
 b=aOHfu1TWRvJghBla5DsJv+UrDBNkWpfF8vTCMwhqYXRrc1bJwVC3x4Y2iwJ9dAKRwGTPnf+ui/cXLVRay7uQLmst8xuWP8jvBT00ZWQ+S7TjWpFYWMlVnqNksFxkrabL3Yy99Kiie4kEvkNxwqEeO5bPZICkEag7a1b9zz9TVOGOJRdl9g9KOtRfbueGR3xTOoxylMcxPw9mAfxCQlyAPz1RGnYFLbyr/K0VBqb3G4e2JtasKHeW90jHtFBVWPScMssFyAtWZ0juyT6LQIHi5IJHId/jvHravaZMAYpHOXYqT2SP8gkphlf9iAky0u995yHWNSC2g01vS7pHXX8JcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9cF5k+ezGCgOXvewInMKdzIE1SL2+jkFO2jtJ9iHrw=;
 b=K/8ebF+oeVnwXf6bvdgMsVMApLTWUR/FsrjAKov3KUEZB+u/bcOl8ObF94gYWpV7CGosONrvbHECUXm3jlDP2Z6ydccx5cOxvUOylWLexwvrSwhemMUueDHM9g1Etq2aNgu4ixq2l0AKDeFylWbkIkiQWrXTe1Ktanb4zRsxbC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8610.jpnprd01.prod.outlook.com
 (2603:1096:604:18d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 02:05:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 02:05:01 +0000
Message-ID: <87fs0zc14m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/4] drivers: clk: renesas: ignore all clocks which is assinged to non Linux system
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Nov 2023 02:05:00 +0000
X-ClientProxiedBy: TYCP286CA0286.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f41493b-847f-44d4-3a09-08dbea3644ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FfGW7v6j4hohHV5u+CY478PXKkmbFXsMRUNB1z6IijPRPkVTJpEbICL+1kqCEFiIvrYyVp/9PYmsxHa0JI5vOjP0bpkxNdO/by7TRbVezukFetlk+lgM0oDKpnDFJbenne8/tklyfWKVC9N66iBK1HZffLLTlP7Mi7dO3TjaaZz/TlTmoJwoDKBQ4JSqr8QPFCQdb++Y+WTOhAL1mxwQRFSvDEhK99NkDYylUN3RK3kgRCejNZmt+veSYGeCWWmL674Krycm4T5Xoxaqty5hipN9L0MkWqaAYW3thwcZv1QbrJKwqjI0kzF3MzJGy34LuoBeLy451QLctg07bRBxOQmx6DSoqG5kdpkXMwQy4ww7VMg5M5Pktc2TmAV16oblt7n4SMMUX5j3Shc6zer5iVFLloyPM8J2CSdq9SQIz5Np3MKLJR1EUw1j3XJvehNkysHk+p6ncuAzVfQqr7oGMKcD13LaTJLylVo44rhmK0pig5axR8H0Wo3JvNmua7XwbzljsfPdWLlXQzrNJYEt+HfWuxanVsGf8m1p1br0kC4LKe8vFgyGH1kwJoOZXtsHXKXflLt/4oKRZIxLkUuXTvpAo88hS6QY4BA6qGrTgt0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(4326008)(8676002)(8936002)(86362001)(7416002)(5660300002)(38350700005)(41300700001)(36756003)(26005)(83380400001)(52116002)(6512007)(6506007)(2616005)(107886003)(38100700002)(316002)(66476007)(54906003)(66556008)(66946007)(478600001)(110136005)(966005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WIZ1zz7ykBOyr2jaOhGhUCbxPiPjOE0MBtzn/Ur4C2Q3pwo4zabJ4TMF5B5f?=
 =?us-ascii?Q?2jhwfCDor9D5unK4cswViZefyn7l5zC0Ddgii4SkT/B5JFMdH8d4TQpwFkWj?=
 =?us-ascii?Q?jfbelrUbKqEPsOpjXzR8YzElvWv44gISOU+eIVhg+DRythg6dIuXSlcBkbdn?=
 =?us-ascii?Q?fTIz8pQpLYUo1R4nrbpURmjEmhQneqSSn0Xf99F4PmfSYGN9kaf+kcob8Loi?=
 =?us-ascii?Q?T8P54TPpqgm+wvHwogRSU+ujqIyIe1+sklhEZrUPa6FqscnuUzEdAAKDV3Eo?=
 =?us-ascii?Q?d2vGeHrMpaA6xvgi4tOumhvL2FJKRgiHkZUlodLTnC++BjoxiUy5lJh1g5RE?=
 =?us-ascii?Q?CC+iPkMLtcKrkBcO7PndIeRP1Wv6Q1WoB8Xm7itg6XN2R7GijG8hOld2TFaz?=
 =?us-ascii?Q?48MoBO+Ftz9ziI5P2/WH0BOF3MvexcDcg/07vru6km9WozvNhXVWPkQ3AkGg?=
 =?us-ascii?Q?+duSki3pv1S3WjIEnmHHUkXvS0UXHVouNzdyn0lLVQ7OitRSBniNMjDdTOEW?=
 =?us-ascii?Q?t38+SQOWf9ybLMA+rfM5889CagrJ2pKzAHNcQsaVbSi/w/lyu597ByyFk3d5?=
 =?us-ascii?Q?dphfgkfSjFqhHUevmkU2WoB40QgF2SfVApHetKs4G9IftfmGRVMDWlfTbABV?=
 =?us-ascii?Q?hoskOZng7nGOji5y6rF/1jy7hiyQUCqUe4bNGM+JwYKQDAM+VJn6+SjHerBQ?=
 =?us-ascii?Q?7zwbQ/IysWsKBzD8jGYyDzd1iPIPA+VD0xphNIDGxuCOopQYMb8gej+5lKBT?=
 =?us-ascii?Q?FAAbX8l7Ey3y3K4JhfQqQZTghZiKb1tfNuxkpdFvo19/hsi+5wXn2zu6fEX7?=
 =?us-ascii?Q?wkOVOdIddVkgslsVlIwEU6LVmfyLOFLvuR1XDwagXX0uzoIW4dsmdKbp6CRU?=
 =?us-ascii?Q?rDpiFJgBFPMoAQW9jGbdI1ZqBEX2bpVczeQ5rzsZ8b+HHCe4xGgxWVGWWtBo?=
 =?us-ascii?Q?fDWRC5Ogu7doEzlLsxWaAPLubhF00q6XyKM5ymNZmN1yqj60FlRVeQQt1SJr?=
 =?us-ascii?Q?DBTe9dLZaEojr7QQfJ+ehfYiy6uJMMo4h8HPFe6Zr55atCyc+8OynwE5jp4Z?=
 =?us-ascii?Q?PBFX10ftkWEowzj4ZVIz3gHTWFZMiiLmpBGr+cp+uXKs1x/EGaOuKksjTr4W?=
 =?us-ascii?Q?0Cc7leifpd+quuKi1sculAGipO8i9y8ydlqKLgV/DI58D8nZNiF8Y51aICwi?=
 =?us-ascii?Q?zOzT3hmN/g4VbSYjFQhsJs1od6xEOADvPoSf7o0siZLgE46vNslqssjrNsuy?=
 =?us-ascii?Q?pJV+gRtAg2NirtNxljiVBY/JtW/i53LUnX6sTGiYfqkhbsaZH5fZusHsTP00?=
 =?us-ascii?Q?xIy/64PczDUdcSGRdSbJ6H18fyMkJwoUgjgu+NbW4ltDfcKs2ekhkDt37axo?=
 =?us-ascii?Q?ZzxcOO5JEIlbGCTodbrDLiBPhnoWoaAR+XCR9b1Cc8XbC39eQUjReP6Pw8ug?=
 =?us-ascii?Q?wPVphj1LlYhGUhFNCOqsuHMGUGr8GiFRqFOEtcvWdGCq8uE+pZld3wnxptPE?=
 =?us-ascii?Q?KX0COnwjQTJ7g3TJ/W0Tw+NM9JbAQxxevcA0FeU3w22wYpwgMccwKk/DtHiY?=
 =?us-ascii?Q?ClLc2Lr/VKb1qyfSIHaaZD8cA7b0xdCvzxIgr00/ofqO+7RkIL55hYHmBLgT?=
 =?us-ascii?Q?bFD6YLsWUyCi1DIUnJFwX5Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f41493b-847f-44d4-3a09-08dbea3644ee
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 02:05:01.1074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZnBYays8+gdJE+rifDFTjtprGz6wX7myGHc4RKlqk7ByUUcolFKracBjsiGvFoxtS99uvuvNoQIdeSYeTftz+rfDmAx7iul99aJv+LFjQCfSLHIeKaHkmy8glUBwzuA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8610


Hi Rob, Geert
Cc Aymeric, Goda-san

This is v2 of ignoring non Linux system assinged device.

Some board might use Linux and another OS in the same time. In such
case, current Linux will stop necessary module clock when booting
which is not used on Linux side, but is used on another OS side.

To avoid such situation, this patch-set try to find status = "reserved"
devices, and add CLK_IGNORE_UNUSED flag to its clock.

Table 2.4: Values for status property
https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf

"reserved"
	Indicates that the device is operational, but should not be
	used. Typically this is used for devices that are controlled
	by another software component, such as platform firmware.

[1/4] - [3/4] : expand existing function for "reserved"
[4/4]         : adjust to "reserved" device on Renesas CPG

Kuninori Morimoto (4):
  of: add __of_device_is_status() and makes more generic status check
  of: add __of_get_next_status_child() and makes more generic of_get_next
  of: add for_each_reserved_child_of_node()
  drivers: clk: renesas: ignore all clocks which is assinged to non Linux system

v1 -> v2
	- remove "default_ret" from __of_device_is_status()
	- add new parameter explanation on cpg_mssr_priv

 drivers/clk/renesas/renesas-cpg-mssr.c | 118 +++++++++++++++++++++++--
 drivers/of/base.c                      | 111 ++++++++++++++++-------
 include/linux/of.h                     |  11 +++
 3 files changed, 201 insertions(+), 39 deletions(-)

-- 
2.25.1


