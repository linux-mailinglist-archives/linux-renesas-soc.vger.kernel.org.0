Return-Path: <linux-renesas-soc+bounces-26207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D489CEA2DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 17:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82731300C35E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 16:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D820286D4B;
	Tue, 30 Dec 2025 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BgkHX6iV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDA91E572F;
	Tue, 30 Dec 2025 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767112284; cv=fail; b=KEezdv7OBC4P8vYvSisTcg1ZCSqGKNVmrNktk/Euy5Y+GPsd7M/Ypj1QFm2Lit4BLqMSa13v1t1UTTK6MEKZTedSF5X/NP6R5JfzjwRTmQQAOBB9tg9fULHYNCBFL0on2oUfVemHhmjnYyKPhYKq7+Wu8zvIUpJo+ND84hFVcyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767112284; c=relaxed/simple;
	bh=qwgBG9PteqbHNp6kMggwUAsBY1qT5Zhs+yArslgz+gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LmKaHMLSmrKF4MarruWsSwkk9u8ILop0VHGz/ESjpvh7zEcIypAcU3R9G97B1W1AfpuiCI+BChSQPIhe0oJVN5HVPWqMC2FmZOCkw3zm443zDa0qnVW3t0Gvo3leR+hFEzkAnU4MqeTwogLvg+59CwNIA+hPba6pvWgVQ7PsYn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BgkHX6iV; arc=fail smtp.client-ip=52.101.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeL4ZoguV0oLpODxF1yXslXroIMIEdFGoYICjuKONdVdeibxRpCt7ijFT0j6N3KTmW2PEnYrydTPCaU1HZyrvQL8ygm6abz6Uv1zD3HMDJEt4lJp4dNnc9Dc2ZWJtBfDPOXmQkVkIqEauVBP+ZUIyP2JmqENYwJ+PDyrb+QXV+slbHNe2204MkknNocCoIfWoOFcuvjQnYeSZLUFBf2bPQ5l00kFYH8qUaU4wjx6yVrwtrujQws88ISIXXzuSlsSPsm6UGaDV901Vr54L2/TP5rkQSYMGz41eFvPv9Zg4kjuWi0WiCLdyy8a2jrtgUSga5pNmSvD3XtlM7hVJfSR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sF3TRm4E463orLIgqEr5fijvvuc4Or1/YAAL3kjUtXg=;
 b=oeVA+BgMs8MdHaJUVlbZuMf64mnhrHl0jPhEbWUiBzNMrQQo8mIQ2Al+OqdKAK2Q6YCv3mzZeql+R5N0Kpkz5dRergx/qp/tLI7eALX/0xx7mViQrYleWtECbOJKQondIpCqscCuBKkAbCFOQP6Pk2SvdzfPH/5evtRQOzM1vIskG5dr+JzwoF/mNaGrECmuofc4gM/M4ONTze+98zzMdKObNz0VHbXYRKzB698AQUjxhMZ+0hEtBBOQACrdBnDoAtyFU3jYDhmymfjMH3F3/G+4hd4aVgzDSP7one3s1Y59KUN/j26CuDK+rynRXmxnGuuXWnflJVrE8X9YrdbRRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sF3TRm4E463orLIgqEr5fijvvuc4Or1/YAAL3kjUtXg=;
 b=BgkHX6iV1ZgF43CGZoS9TwIGrmKD8t14yV0nKPJEJS6ytrQ6ln0epXZrHozddqAUkF08iBtnYoKe+jla++/d2RWo97L+wn+xIi4AtX71HBcK5auIXTcKlRr9rpvDU8SXUcbCZ5FrhZsg7FnOTLHlwJfR6z6m350tlsRVsAL5OlQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15815.jpnprd01.prod.outlook.com (2603:1096:604:3f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 16:31:17 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 16:31:16 +0000
Date: Tue, 30 Dec 2025 17:31:06 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Frank Li <Frank.li@nxp.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] i3c: renesas: Add suspend/resume support
Message-ID: <aVP-Sn9ecWWI4rTq@tom-desktop>
References: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
 <8cba44d24d436bf11477c7f2b91de3c32dfe1809.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
 <aVP1IxpDNUvLzHHz@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVP1IxpDNUvLzHHz@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15815:EE_
X-MS-Office365-Filtering-Correlation-Id: 20112c25-e374-48bd-2ff2-08de47c0db02
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EaGpWF2IemTsP7It2icG21pBZhxgIZa/TM+rS0ZzkpN9na+mYcDWDPDBThj4?=
 =?us-ascii?Q?Ath0/5k7aTW4aM4Wb1UTx2+qnrwNNBy0aIzPb30mPZlIl/pKFbllwhnNHvfk?=
 =?us-ascii?Q?i61SeO9JCachwsrWNikjKjWkYfPoU9NaP/mnHbhQ93+AsdsqCIJOc8bDmFPG?=
 =?us-ascii?Q?o446+7ShYNiBdGAim7v8nZw8kq0dH8EuFFbRJW5QEJ3uEOjoI/RNXkSVYyt/?=
 =?us-ascii?Q?P8J33L2gyArDBKBU9wP6bszM4teLdVA2NJG+IRolNR9Fb3i6zlluWgZfuapv?=
 =?us-ascii?Q?BIpTlZ9iDjr8X3qf6RCB4ChIHiV4IWczSSPOPaYwziUgs4RGaJTUaOY4omJk?=
 =?us-ascii?Q?aerxk4Ojv0JEARdwyU7XyBpCyH2gSufd26oGTDIUFERz1JJef+9Ve8itZ4/K?=
 =?us-ascii?Q?P3VPi2eUyHNU3LnHAh9t0Tm0KThIuIlbmfvrdFCCayKp5Z4AS1Ft3TfRvA+U?=
 =?us-ascii?Q?Lb/H3Dexqr53FJm8n79JB7dNYNRdW8mHo4AJtJIDsZsX+nW/l+kQgJrkZPrF?=
 =?us-ascii?Q?uWoc+Ho+Bw1+y5SJg/HiKv6mqHAN9fmmmstSa2gvAH2cXcfCVzegwW7h7FL9?=
 =?us-ascii?Q?cdadto+4eOdC6xTyrhtXz7YhzbDappwf0D3921EfvKH5plIeE0V8k5Pj5kyF?=
 =?us-ascii?Q?YViRe2OzAF5LM5AjLgv6UScI5gLNok09LgONCt0TaSAAYeBXoLX+QgONFLEC?=
 =?us-ascii?Q?J8p/OpsybRyKb9FRCQxYPp6NcTtT+4dSN0Yz3FOMPW1x0nbcYG92+A3QKcN4?=
 =?us-ascii?Q?EkzoaVwUrwRqbOuonlrDBmhyghDM63/3cxDLgknMqFPL0u93Ar7J6loSknpS?=
 =?us-ascii?Q?O9t2qtL1t3rYBmwQNoJpfQ7LxPr43OB80lFA4XzBNDNnXoCWw+sHhgjz2TL1?=
 =?us-ascii?Q?k8n6SyP2cwbtnfuAyPVb7OvyHcM6666/croxn8aaXHsnGwVtHqRcJAfSk/8B?=
 =?us-ascii?Q?kkXVEy3cdVTMRxbwf+ojKJJyMeHT9hNHBjQvN3DiKSepUuBpPv1DV2XUMa8Q?=
 =?us-ascii?Q?UQ9kCPXWHaK20hWLr9nX9M/HA61kyiy89KQWetWvl6VX9YZmWjhQaSfTJRUk?=
 =?us-ascii?Q?3mkperIlLciaMAKk+1FQP4G9L1YUEiS3YGF2uY755OtUvSBeNC28ePNKV2jk?=
 =?us-ascii?Q?Kq0WWd8PnIGSeWK3bkScyzh0o2JsJtWuObMMp19iTPF0opD5XSipmYTr2be7?=
 =?us-ascii?Q?mZKial8o2d2QJ3zdNnia0n1nC14G1DTyOMHwH/web+8wZIGoUeqLG+UY/2CU?=
 =?us-ascii?Q?HcDsyeIzQNNPsRmUv3W1XaOpLTUMOf3OpwjjP+j6ZC4MN5GywYTxUUFLI+yO?=
 =?us-ascii?Q?KrEbRY5lKaH27AncSoEF19PofpEC4mK/1HDSiLhll4kWQQQlrjAftK1dGF/g?=
 =?us-ascii?Q?iQf3Sb05xrcugJHILP0SjhMFVmY3SdvyxrQfhFiv4ODxy6JD+jMnWfKVbyvS?=
 =?us-ascii?Q?pvUbVJRVK2Ji8zlafmPc1WrHBRDw2mabNkJ/+HS0v4D0K4R/uujov5/NxDLA?=
 =?us-ascii?Q?LMse+0kXiaI2AiY+X7iPlQarAr+YK67Gb3dl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lem1Xdwvx0V8Pu9jQ6F0T8hbnbDvkHPO1Z9LZL6ndmyDtXlXZ47Ao2y59+eG?=
 =?us-ascii?Q?0CPpSH7BeFCwfQyyNKIddak5lhVKCHQv+VDIxG/dmtwOcEqVtg44sFUdvZ5s?=
 =?us-ascii?Q?70pwClsT1DxC79MbOPP2sHB+w92L2FTpVohKkDPFPgHaVtt1bNUQvyG/7tD8?=
 =?us-ascii?Q?bwg35xY4k+ATYWi79+pdYkhn0D+s68VjAv/CPCEoY0L/jkzk4EknqL+Z+rOj?=
 =?us-ascii?Q?RNnRnNjyHD5STAineclVGMTmReQsz95BX5m3t0/eGBgDN1ZEzIp5aD7YczdM?=
 =?us-ascii?Q?ckoV+z/miuDZvNtaRij5aV9J6vWqHWLTkbjsVaRuSHnrxOcZEw1Uh7RM8GOL?=
 =?us-ascii?Q?amSpPqAqM0JibnM8B/j3NbpyxZt4XvZf0bPKRaXkW66mFUGOjEwg5kimIAOd?=
 =?us-ascii?Q?an2XYwXt0TgiL5ljO6vcZEYxZGJkHMIxVSvETi4OPKOMg/05JCxjo8X12zBP?=
 =?us-ascii?Q?zu69xhbxasxl0ZyA0rVB11wUp2nZpb79FsMeuVzUfvG0qOTCDNKK3AhVnDYy?=
 =?us-ascii?Q?SHB8NiasvrtO2ZfyneZTxEJZK7FEZlCCvQAIYmA+qkXbmppHEMwlrl0nXVCN?=
 =?us-ascii?Q?jCYY1x+XZt9oLCWEC7JlAC+c4mHKQ4RMIugyHlvUYaHwlhhaKpPTvECw7ISl?=
 =?us-ascii?Q?28NhVsXkDEYDqZxbz6zubpfwwpOwHcrErp9YEjR6ETPEDwx3vwvPTRem9G7/?=
 =?us-ascii?Q?GCXeLRJvSy3HUwMXWWsOml3vqEeVYkFHxPIdzCc6dbB3CucZzM2J/sJf45a8?=
 =?us-ascii?Q?8YvGaW/cBmPLSmUJcCOXNIVCqZ81O1sge7fhKcXuB9yIWz9Ma5wYRpEdhKtb?=
 =?us-ascii?Q?s4GgjAMlH+cVFBXiTMbpC7O05Kw5BOrd8JAFg6oakMQc45liY9ISXiHCM7iu?=
 =?us-ascii?Q?NiaoLURruD7b0PlTGIzRAYk8PMNaKxNkJn2TEQMTCTXr6z0zn/8igs60FR2s?=
 =?us-ascii?Q?HMd+4mt39FQmqN1xPRe+WGf6Kjuuh9ddtizyqxVfgMV0/fl63bubJHkdwIhV?=
 =?us-ascii?Q?PdmwRiR41+fn3QogvIn8W+GA/+DbhIpsRr6emwD4YCdmSUtew+RyXmMNy6UX?=
 =?us-ascii?Q?VCWoGrIeaVpF1e8mvgK8i/qtgtNq+OWpyT7KzvxffxLF99+hlW1jOLbT18d9?=
 =?us-ascii?Q?XwkilpvTeZzi+bJqwP/ePAYIZzFlWFXFWXbbcCNTfWEyWeG3HRwPQ435QQzL?=
 =?us-ascii?Q?wFL0aE8baEX3WXl/ha1UAqY+D3ofNuKNBzugc5XuGEAt2Vb888lKG3Vjn4rJ?=
 =?us-ascii?Q?agyl9mrukybcr+yOvZ9SF/aEZ1SIsaxaNxXuYiLsCMz/9kw3tF23hwwzVljX?=
 =?us-ascii?Q?8hhmB2TA2l/HENymK4btfTFTQ9EdYjmx+YOPt7DSBfsKi2WKixnw7ughFyc3?=
 =?us-ascii?Q?zddpmQ3XCoYnd+eJ2lW8koZLyTKg8o+NoUk7xGQCiTKHth6pTNpvU5tR4nxo?=
 =?us-ascii?Q?GfLLsb07ObklNufpFYUGy7huwOUHLzQ3Li+dONIW/rFn5+vbqiATT+UxlxB0?=
 =?us-ascii?Q?FtFDylPEQPNTAkyuUuqzoqPuCqnk35gIxRJy0SFgJe6NiSc3Nco9KwRkE4rd?=
 =?us-ascii?Q?gyOWoxnAUu39yndb9/Jo+e+gsqq0fSjo7NyA9ECzn41HZVPezCPk7vMHb7IL?=
 =?us-ascii?Q?G5/5ulEzbrRU9ULB+KTgEedBye+VEsCNPTX5gcRmGkQUXlLwnai1x21OsnRf?=
 =?us-ascii?Q?FwF2WFud5aQdo6F8KoE92f5ldgMWyCtfC2KfEa/D+yUn7lJJlulSaogh20eo?=
 =?us-ascii?Q?Iqt5kMIXbMf98O96Zrd+VruDFYqe8/5kkZ3DmBCbWDzfVoixSGD0?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20112c25-e374-48bd-2ff2-08de47c0db02
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 16:31:16.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kROQGWAviKo7xWgNfVbJ0ajauaWkixDlBH3ul8BWWJvE8x/qgbsLKyySg4PmQIJX6k076r09zJzFaVD2sUlMlR6jeMp5QolXjHA4BLcozwSZLy0TnK7LDFfiZM4uPofH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15815

Hi Frank,
Thanks for your review!

On Tue, Dec 30, 2025 at 10:52:03AM -0500, Frank Li wrote:
> On Tue, Dec 30, 2025 at 11:39:39AM +0100, Tommaso Merciai wrote:
> > The Renesas I3C controller does not retain its register state across system
> > suspend, requiring the driver to explicitly save and restore hardware
> > configuration.
> >
> > Add suspend and resume NOIRQ callbacks to handle system sleep transitions.
> >
> > During suspend, save the Device Address Table (DAT) entries, assert reset
> > lines, and disable all related clocks to allow the controller to enter a
> > low-power state.
> >
> > On resume, re-enable clocks and reset lines in the proper order. Restore
> > the REFCKCTL register, master dynamic address, and all DAT entries, then
> > reinitialize the controller.
> >
> > Store the REFCLK divider value, and the master dynamic address to restore
> > timing and addressing configuration after resume.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v1->v2:
> >  - Updated commit as v1 has been split into smaller patches.
> >  - Use clock bulk API into renesas_i3c_suspend_noirq() and
> >    renesas_i3c_resume_noirq().
> >  - Updated commit body accordingly.
> >
> >  drivers/i3c/master/renesas-i3c.c | 85 ++++++++++++++++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> >
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > index 4f076c372b36..f089bbf19fa5 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -254,16 +254,19 @@ struct renesas_i3c {
> >  	enum i3c_internal_state internal_state;
> >  	u16 maxdevs;
> >  	u32 free_pos;
> > +	u32 dyn_addr;
> >  	u32 i2c_STDBR;
> >  	u32 i3c_STDBR;
> >  	unsigned long rate;
> >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> >  	struct renesas_i3c_xferqueue xferqueue;
> >  	void __iomem *regs;
> > +	u32 *DATBASn;
> >  	struct clk_bulk_data clks[3];
> >  	u8 num_clks;
> >  	struct reset_control *presetn;
> >  	struct reset_control *tresetn;
> > +	u8 refclk_div;
> >  };
> >
> >  struct renesas_i3c_i2c_dev_data {
> > @@ -615,6 +618,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  					   EXTBR_EBRHP(pp_high_ticks));
> >
> >  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> > +	i3c->refclk_div = cks;
> >
> >  	/* I3C hw init*/
> >  	renesas_i3c_hw_init(i3c);
> > @@ -623,6 +627,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  	if (ret < 0)
> >  		return ret;
> >
> > +	i3c->dyn_addr = ret;
> >  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
> >
> >  	memset(&info, 0, sizeof(info));
> > @@ -1390,6 +1395,13 @@ static int renesas_i3c_probe(struct platform_device *pdev)
> >  	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
> >  	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
> >
> > +	/* Allocate dynamic Device Address Table backup. */
> > +	i3c->DATBASn = devm_kzalloc(&pdev->dev,
> > +				    sizeof(u32) * i3c->maxdevs,
> > +				    GFP_KERNEL);
> 
> nit: can you move it to previous line to reduce line number

Ack.

> 
> > +	if (!i3c->DATBASn)
> > +		return -ENOMEM;
> > +
> >  	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
> >  }
> >
> > @@ -1400,6 +1412,78 @@ static void renesas_i3c_remove(struct platform_device *pdev)
> >  	i3c_master_unregister(&i3c->base);
> >  }
> >
> > +static int renesas_i3c_suspend_noirq(struct device *dev)
> > +{
> > +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> > +	int i, ret;
> > +
> > +	i2c_mark_adapter_suspended(&i3c->base.i2c);
> > +
> > +	/* Store Device Address Table values. */
> > +	for (i = 0; i < i3c->maxdevs; i++)
> > +		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
> > +
> > +	ret = reset_control_assert(i3c->presetn);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = reset_control_assert(i3c->tresetn);
> > +	if (ret) {
> > +		reset_control_deassert(i3c->presetn);
> > +		return ret;
> > +	}
> > +
> > +	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static int renesas_i3c_resume_noirq(struct device *dev)
> > +{
> > +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> > +	int i, ret;
> > +
> > +	ret = reset_control_deassert(i3c->presetn);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = reset_control_deassert(i3c->tresetn);
> > +	if (ret)
> > +		goto err_presetn;
> > +
> > +	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
> > +	if (ret)
> > +		goto err_tresetn;
> > +
> > +	/* Re-store I3C registers value. */
> > +	renesas_writel(i3c->regs, REFCKCTL,
> > +		       REFCKCTL_IREFCKS(i3c->refclk_div));
> > +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> > +		       MSDVAD_MDYAD(i3c->dyn_addr));
> > +
> > +	/* Restore Device Address Table values. */
> > +	for (i = 0; i < i3c->maxdevs; i++)
> > +		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> > +
> > +	/* I3C hw init. */
> > +	renesas_i3c_hw_init(i3c);
> > +
> > +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> > +
> > +	return 0;
> > +
> > +err_tresetn:
> > +	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks)
> 
> look like it should be
> 	reset_control_assert(i3c->tresetn);

You are completely right.
Will fix this in v3.

Kind Regards,
Tommaso

> 
> Frank
> 
> > +err_presetn:
> > +	reset_control_assert(i3c->presetn);
> > +	return ret;
> > +}
> > +
> > +static const struct dev_pm_ops renesas_i3c_pm_ops = {
> > +	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
> > +				  renesas_i3c_resume_noirq)
> > +};
> > +
> >  static const struct renesas_i3c_config empty_i3c_config = {
> >  };
> >
> > @@ -1420,6 +1504,7 @@ static struct platform_driver renesas_i3c = {
> >  	.driver = {
> >  		.name = "renesas-i3c",
> >  		.of_match_table = renesas_i3c_of_ids,
> > +		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
> >  	},
> >  };
> >  module_platform_driver(renesas_i3c);
> > --
> > 2.43.0
> >

