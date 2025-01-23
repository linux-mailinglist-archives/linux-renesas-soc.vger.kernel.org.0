Return-Path: <linux-renesas-soc+bounces-12444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C037A1ACE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 23:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D283916C165
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 22:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074B21D4612;
	Thu, 23 Jan 2025 22:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jeOrNTjI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6962C14A4E1;
	Thu, 23 Jan 2025 22:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737672858; cv=fail; b=JS9TKDmjKFfkvoYHjaTkUwKIr4zJk7tspFmTsdtK+LgtxWXBSmYUU7yKmtaXyFI3Cj1BEVR/VYcNZEoqNNywYPxF7fB4KgMOzCNYnfOxmhXC2Zubcm8E527CmNKhkPHoOy0di4kraf121dypXIvNKysFx+bjcZg8/YbvE8QEnk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737672858; c=relaxed/simple;
	bh=kD4tV5nIgoxdToNM2W6MoR3II9u3E+zW/5nC7wUnNWo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mfDA9E1NP6ldjtd+LXBDEFrQasLQUNFL5uqal7WKTETuSOo1/94ZnrFLfz5teXvGm8abaBgrVp3D9lK98PZ7PyDrwG3B+vzeSmEbcFk6PDry47cGxXavxUB7i0DCImMBd4byaTVAtN3GYLWUx8UEDLTPRtZ8XW1uNR7kQ3ngwy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jeOrNTjI; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZYof1THMqLdjmfzLMzLQzVAdLmNmMwt0nt+clUPvUcZjEKfSN2rIcNap0Xs4OENwhBxcFpvsjtpK2UIPzMlDvuXFFQ8hoUKVHMcvTbGALqHJ7DCNe+nZEkkt+LNJR7dQHa4qyubH28/aCZ6uM1W97GU0zXgFmCd5os9JRFVj7c0mwdJuCCQM6/o1oRuqXCmk3J1Lg7W3x0+EtUYlPB/qomixFX1LIj13TRqJqxcmdrjMbJaGRt01w8A48JEJT6MHUAywaPoHEbX3AzzKtnQSc4hbJ4Gv03ckl/f4fCaGymk+xsE5SB2jDWgiQnHwlIOHjW+ob10p8EpL9zFuHWpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/ovebvN/qArpYzKp0pxgY+ApQToFGM96kAoY13xaiY=;
 b=EkWxeSU5euXuH37vNPko/AHWm4TkazggkLGd/eTt27LaU7AFIb0R0hs9Jxn99i4HuXkv3/5Ck398YQ9a3XHyLacW5tUuTRo9Rs9bwccMcjoLRc4IghWbdiCV8hFNUYp34Cwalc/WdwNTK0K8qfBTbb+fdbj63k1xMrbkyZE2/tgz2buNQBZt5NZTolAIQSD/XAnqRvO19KbDXCdstu6d5SbBmct6gUzSmp/CEpEk5sZ+7JGTR7FtgZ0nlZk28D/Zn2Nx3oKz2skJvUVcykEH4jQKqgoVb4xQsip0Fl9txZrQEPUo5pb+sEiNNRokPcmcNywGOFUu8ZsYGCMxvZoWaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/ovebvN/qArpYzKp0pxgY+ApQToFGM96kAoY13xaiY=;
 b=jeOrNTjIsoa1eved4wOCRxfyY1HwwsvrXbhdCYKE2I01TF9r5cnMqX19BpY49ZBE3T9mkU5og2KcLlibqIlmzXLA3m6Dm6P6RLwcvoT8B8e7r3mKuK1iMl8Zubfse85TIP5G7lz5Qv5ILMaPV6+Rul1gGq3M3TOn1RMzWUe7WOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6728.jpnprd01.prod.outlook.com
 (2603:1096:604:fa::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Thu, 23 Jan
 2025 22:54:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 22:54:12 +0000
Message-ID: <87zfjhkupa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: Stop using of_property_read_bool() for non-boolean properties
In-Reply-To: <CAMuHMdWpxKgSGGJb9Oy4Bzy7y4zPxVve=0_mCWE0G1d4njCJ+A@mail.gmail.com>
References: <db10e96fbda121e7456d70e97a013cbfc9755f4d.1737533954.git.geert+renesas@glider.be>
	<87wmem76u4.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWpxKgSGGJb9Oy4Bzy7y4zPxVve=0_mCWE0G1d4njCJ+A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jan 2025 22:54:11 +0000
X-ClientProxiedBy: TY2PR06CA0040.apcprd06.prod.outlook.com
 (2603:1096:404:2e::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3829ab-52e0-45d5-cdf1-08dd3c00da6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7NZ30WVlNxnDXni0OYjMefhsJ8a7gSEH1Bc/axgbBDxtbjupfHhpLJl/h6Ye?=
 =?us-ascii?Q?8S8aQxCH6Wqr2XYS6sv+TxsvgYe3j1h6JYMAqjux+tI28C16VggeK40Ci1tJ?=
 =?us-ascii?Q?dIBOMibSXyJCDJXSxBbuc0gJhXTlMX/8qgHUmjZzNzk22KGWf2jkjFZD5zIA?=
 =?us-ascii?Q?EAqU1vuIUeTX/DnuSTUCMv/mvwXMFVM8tnXZEYlwGmZsrCHC3KSnm3XNIZRN?=
 =?us-ascii?Q?K9LYRsBtG6V7GMPKkK3vFVlX9iU7x4x3PTHZxRmKK2wyxybBI1IOwM+Q+CXw?=
 =?us-ascii?Q?KkMo3OlvJ3kmMPxRDkFb2g78BBbH5VSOEjw1G5QOieq0J8YcVnw8xirvxUtc?=
 =?us-ascii?Q?ccWnXWQJGN+sZWABZnxzjdCfMmE5nFxMMhNI3+eQptNvInvScRhBdJALn0QD?=
 =?us-ascii?Q?NtyhkdeSi7IVUEsvsKpIbYtzRv/DDoB6miI0HKnbuL6gNq/pfyummVlCDTLy?=
 =?us-ascii?Q?T82cwyBOF8QCc8EjckxJEU8e3nCFC+ELIbRPnrrVqeczN0GXDaWsOTgAOWLs?=
 =?us-ascii?Q?uBhjbsxVaLWdL9iQYS39rlDe38Lkqqq3RCkdl4nkSOnS9OVP1Y8eBCQjGEjW?=
 =?us-ascii?Q?Ri0uG9PKw7Pg8scT4J8uBkWZgnJU3YkLQFrmVX+7wE9QwuTXcUUuLwpZssIi?=
 =?us-ascii?Q?rYIsicpC8UuoxW26kjpy+XcU6XdfoHpqLxBbF9e8tuaPNlqA0FVwPLFRA+w1?=
 =?us-ascii?Q?tHKsLlCNyGjSI0EyMOtEkb11bkPovg6fjTPG99ZOipUN4YfCbLzD4AkOeIrz?=
 =?us-ascii?Q?8uDSMkV62zB9s5sYyjuM1lfRUGNHfQnb0drCW6H4f3PWXmtjgA0gxa3XpJEd?=
 =?us-ascii?Q?HfRxXGe1oPppcWMTtejlxVIYPHi+6Q7CzXWDyOMFKNzh99VYA8Cx9PgoLiJg?=
 =?us-ascii?Q?gOdBO6ILvdKZPWI9rUeQhbc5U8XVXjLIwx0zmhioJgHfrdAt55gBQUQ21kdZ?=
 =?us-ascii?Q?oSV45+N3Cz2uqKWj/8tTBzrlwq2gYSnVfj8TLFRWxcZ2vdjbnRZPS61r6Ddc?=
 =?us-ascii?Q?tMl0DdJMmzlCQCinYD1kuM0FGlYKFOnrj18v4N8eD7BhVthUmQRTY7NSZ1CZ?=
 =?us-ascii?Q?dVtnhZ0nvJWj28J+67vC1aytDkOlEobYnHPr9WRnLcApuG0a9yPnM3aP9rF6?=
 =?us-ascii?Q?a+d59wbVKiwRbujUJavZPymHs06NneeUqjbgjnZPl4Zgzhx3VPOb83pdfEbQ?=
 =?us-ascii?Q?YvXk6u2tioe8X5nfangOqkXULDvw3MNzZ7kCKFgZecz7Shby04r6L+71Bb9a?=
 =?us-ascii?Q?sS01+T09g+FOQp7W0+RJ0UHgKlPvcwTMIPE01ZuFp+d3i1NukTYrDq8RzjW3?=
 =?us-ascii?Q?Tf69fYWZ+LHbRKhnKBpQ85yagMxq8CTdV/b1Uxr+vsAyDq5wHa+nnTvq3XPI?=
 =?us-ascii?Q?ETYNbOURfTcGxoqv5nAXdGU38iAAuOJpKWhVikoA13Qfkg/tOG1DbVw4mO41?=
 =?us-ascii?Q?fpoLpJbLOxrnN5BgFy4sW5K/j+o36ySu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XEa1Opd5twdZXDLjBDZD3uiqVFTTzYGDhWrUvU8//qz8Zo2ci/RuiUTY2wSE?=
 =?us-ascii?Q?ny6tNON8l6MrIVkwFfdWwh/e8QI/apDh5Vf2O9vvIyNfTP2vfrt7YUigzsoY?=
 =?us-ascii?Q?nkNmkVQo57b2KnZZXdvTL3fP3wInuakeZGsonaHikNAQtoGyOedVi1EyMxbH?=
 =?us-ascii?Q?uSnL3aXQTI66flegmsGy75kMTH+MJP6IyGZCnGtq5WnjOVF7fOSC2WBW/uld?=
 =?us-ascii?Q?BWU6G4gfLhgmoN0oIvDKZN/Hva4ofbMY40qf1S9zagI9P4RqP4NFifkoo6+L?=
 =?us-ascii?Q?QE23veNYHzKvMk/CmzS/3lu81lPLkdSncBMxxWShzToSmfBdhef4MxDvZeOY?=
 =?us-ascii?Q?VD27IqrjAeEAjqJTE4O0u3XjQfcPzuClRM6nXn3qcp8/bZ0sePwfUax5C42I?=
 =?us-ascii?Q?vqJArX0r21bJ1DAsBD3LnYoZ9zTXY9zFWbg/fc2IMBQXjvkMYbvPWM8jxtJO?=
 =?us-ascii?Q?jdvUOhfWzxZ4IDpeiINFPEQ02+/v/6oYRbN4D4HUMY0WbXDiH2zJbZW+sa1M?=
 =?us-ascii?Q?daKRnz7lVqiauKPcDZ88tcQsNXafVYaW1fQNkY3Ai7vO99F40TAOg6K+HxmY?=
 =?us-ascii?Q?mAwXcUnU8GIBz40iyb/hXnp6YOd6DXRwPBRHPVDKgUm40JEMZMHT4pdUamNx?=
 =?us-ascii?Q?zxpoKSPxntY2lyYhS3ni47iprnD6nbhRKpTKGS16HKKtN3QjFJvTuuvDtnX/?=
 =?us-ascii?Q?bcWc9dqYu9NX44sdozlEIioaW55Rsaz9BO5UfvrbB/xXpXKJkZ9yiqcjrsgO?=
 =?us-ascii?Q?lcRbHwtvf5+ApBvjSuUeeUtz+xKb8VHa9QRK2+4LAg1+pH0UXT+ydImajUzs?=
 =?us-ascii?Q?CryEjkCYWkUe7JcbPscPpxGnyg2TfX2fUzYkhwNgMYl/sI+cabeWQgpjZitS?=
 =?us-ascii?Q?7XKfBiFyDM5u3S1Aen2ZoUvWXob9G3A61i8cf3uneGGMsUh+zZjBbk2WBGXa?=
 =?us-ascii?Q?+mbzCFrs1W74EM/po0zmjmsLq6PBaU/lra1ltxDAObw3YuF5giZ+H+LY2TNw?=
 =?us-ascii?Q?QtKov+ZRgRYO95brt8FTy4UNfslh7sSi8BllHqoQHMmpxJQosYfllrqiie0a?=
 =?us-ascii?Q?5V2MP9uCC7H3LDhWpIagZXIo4D4SrJwFrwLNwxmERxwQA0ca6r6oSigRq5lc?=
 =?us-ascii?Q?eI4lmzYVxeGNtci/zhHoN96E2u2VTbp0hu1bgG5cMwI8YwFWX4xoDJgEELVI?=
 =?us-ascii?Q?9ZKcDiImjOpmGp0/UZ0tdiP3u39I02n44tcQaPYNNqJLupWMcFNrEWRQWC7A?=
 =?us-ascii?Q?/f9Pc5JYld1gGmdAj0iMUkk+++RYJArSjocmWtLdK7cUh10ByO48n/PeLzKX?=
 =?us-ascii?Q?f58Xh1WEl6qLUEQzCFsQT7jGmkKr2agYR38RRkfuF/hClw4Wn5mKyg5JIsl8?=
 =?us-ascii?Q?ku7HRhpWjOY+tFTdtxJnBCQ2Krb/pqY4gFP4YGoaZFtxT1pZDil7SUws2htF?=
 =?us-ascii?Q?nskD4OyVfKc4VQdT52eOCRW5rJNCVDHS6kqPMIE523x84v0aV7DEFvNvon50?=
 =?us-ascii?Q?ICVwxbVKvcFI0d3m1B/cjTmufvZ3G76YProrqb6J6gZF70/4UkwDeR5CkJQF?=
 =?us-ascii?Q?tfwhMmuNsLGYZwEV0qHDmbW6WEY0i/6YI0dW+tN/1//KbkYhERT5/WBbwVum?=
 =?us-ascii?Q?8inWpH6qLXZVMEpicET1eP8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3829ab-52e0-45d5-cdf1-08dd3c00da6d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 22:54:11.9605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJhlj5AOOkawvlALNValq7be38EIDvtvMqQeFIuROGsqhy1KGL8Kgt4Ombm0kG9rTAAHe1dMZiqiQCsgSC2mDbm04k0Poj0veGMSDLH0kHnk9u8paLQDlbhNvYZcO7iQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6728


Hi Geert, Mark

> >         ret = of_property_read_u32(np, "dai-tdm-slot-num", &val);
> > -       if (ret && ret != -EINVAL)
> > -               return ret;
> >         if (!ret && slots)
> >                 *slots = val;
(snip)
> That would be a change in behavior. Probably it would be fine for
> existing users, though, as no existing DTS should cause these errors,
> else sound wouldn't work.  For a new DTS, it would silently ignore errors.
> You are in a better position to make that decision, though.

Thanks
I will post that patch if Gerrt's patch was applied.

> BTW, is there any specific reason the code always checks for the
> presence of "dai-tdm-slot-num", even if slots is NULL, and the result
> sn't used? I.e. would
> 
>     if (slots) {
>             ret = of_property_read_u32(np, "dai-tdm-slot-num", &val);
>             if (!ret)
>                     *slots = val;
>             else if (ret != -EINVAL)
>                     return ret;
>     }

I'm not 100% sure, but -num is used by the driver which can select the
number of TDM. Some driver uses default / fixed number. And -width too.
So I think these can be independent.


Thank you for your help !!

Best regards
---
Kuninori Morimoto

