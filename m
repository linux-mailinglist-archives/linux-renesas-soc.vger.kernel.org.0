Return-Path: <linux-renesas-soc+bounces-21999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E3AB82F6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 07:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FBE4620515
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 05:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A63327380C;
	Thu, 18 Sep 2025 05:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="etXhRA8x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC74521D3C0;
	Thu, 18 Sep 2025 05:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758172402; cv=fail; b=D4kNHt+9m97DnB9Suu2JWdl9jhEypYVcVU3mN/U56MXh4MlvMsJLyY2PXs3VGR2i8NTl/FrzcOejGqll2raTWfeN8e7e/Ab/3v8meKzS6JAu0kw94n5GLk7OBKpJYaSG2lbeFNHzXcncfxXbpHAW0ti8/0lJJ0C+SNJJ+TFmoFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758172402; c=relaxed/simple;
	bh=5NiQ/alDZy9224cc1+H0K80kwW9WHhmZvRLlb5i2JEo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Dafa3ZK/mQDRIfabgpnVTptu4PCdFfq3t8f+xcwWhc7ODJAUbMlmE+AIo7v3NrHgc29Sf2z3MIc8cXdsoL+1gWE+zHLxhH5G21UU5Bsrqgd92qAPdsfy0vfyAiEPJSsS0ePJWpREDP5hR9cgCtqmwLl/EVciHF1jm2fxCER+ymw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=etXhRA8x; arc=fail smtp.client-ip=52.101.229.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLwmIa+5ouaj3+c6t598q4bYNu8jzdQVp3RZ/aLSp4bYMLIfmn3eslcJ0WRuYsn1bVZn9pDDmC9V9awjpUrPhD4lZsS9NYKuXlLA4AuJmgMZO1ADZllmblaKpAHPUENkn2VPlquvQINlb+aMfg2bSO4Prlxao0C0Vciyzf/05nakUulYsvMKDEbpm/roVoDheemT2wuq55BAF4EM8CTl/ocmIxgEaTHVr1O8+Q8o6VH/1aq8zgV5LDX/Q9qQYcQlHTQM1isn/aSYYrnn+3h82o63cp8SGbE7ckr6nAtROLAathtDaKcaKx1YyJ8gSuWSKGsFbIVxvieYUXrlBI7FLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tiqm1p9hiIgdfaPPvjkeWDDsrHrxg5CIZGNGRWkCgnI=;
 b=AmeLRoW/1C6ORV2XwCk6Mgvr8FcVZaW3mSbScZLwRoN/HeC1kVgWocn4ZfHEN8qWIvbEtFXu3CM2SheBfZBec5qYSZWkgkwKT6PhViZjfFZrz9T8/PKpolozDhALrhZ/tZ4tDCUTsZIfLF2YPRJRQ4Iw6Uj9Ofln7LqZhZU6IcdIFSQGCPn9LgtnmO1ruXabVYNwEkMPFPVapgePvCZyk0NtcdIwClpVSdRct9gY+oW+iaRk0fI7+uYsHhwPUw4fF0jHh07cqTzqqgJnX5ivZGXrM3K8DYTJ5s7i6uzPmjD57TUI+Yhep7ixkXE/PUDakxnpVm8lwEk+wi3nX9uTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tiqm1p9hiIgdfaPPvjkeWDDsrHrxg5CIZGNGRWkCgnI=;
 b=etXhRA8xc0hu5hTwAvH99LMp3stUJe77QPSZ8R2oqQCjBxc+XrDvwcDo7utoMx6xNwdkY4TbfSEZ+WxUmTzZh4CoAxy5XbdbWWPn/oqBYjrElRO/oAnTkrWf1vDJSNyP6GXg0/LFfSFPMGxv8190GB7TR0pf7TBYXDFkd7d0lgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7105.jpnprd01.prod.outlook.com
 (2603:1096:400:c0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 05:13:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 05:13:15 +0000
Message-ID: <87qzw4ny1g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: Add R8A78000 X5H DTs
In-Reply-To: <CAMuHMdWsKj0s2LjGCOf8_Nm7AE3n4X30bxR6iUp8iCOofDUTww@mail.gmail.com>
References: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com>
	<87jz27vzec.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdVVV5tY_iwb=Xn6XVY-Ai6spBY70yXhc5VRxwDva8BGng@mail.gmail.com>
	<87jz24fqrg.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdX3cviP6xHnGP01kRDwuHRrHg0ZpNLV8Mf29MFS1B7S8g@mail.gmail.com>
	<87wm5zi5h0.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWsKj0s2LjGCOf8_Nm7AE3n4X30bxR6iUp8iCOofDUTww@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Sep 2025 05:13:15 +0000
X-ClientProxiedBy: TY4P286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 6213af8e-6671-44f7-33c9-08ddf67212c1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ql2bKWitt+1+AQVoxbm3OmeWOyFhW8M+5wQ2g+dZtyLzgJutbyA7ydfEX5np?=
 =?us-ascii?Q?wdRIgRnZfCPec+rcSXmFqoXcEawq+OsAGlPZRFAwr6D2gL3ZX1AyEfdKo6et?=
 =?us-ascii?Q?hS0U/JfLaYpd+N0M10mghHH/sheaBG+YPArPLh+YSBXL0Aj1pYBgzvYz9lBi?=
 =?us-ascii?Q?it8Ewbq2bGnzMAFelSnQ5Ejs3GXcyJZg8RJZ9zc6mbd95+fV7+poY++C/tOq?=
 =?us-ascii?Q?cy76vYgqBu8tOZrYanzplZ19J6e/jcXFnM3xCyDm/mBcPliZhXd7SJ1P7qcL?=
 =?us-ascii?Q?EJmdJnBeoeImAbZ3qgRVIraBdk6u4rdkVMbOOYBN3lOdpmHdczwhdywzFM3D?=
 =?us-ascii?Q?68J/TOEMRbyZB6EE3Mf458vSDOFCNz9N8D5ONolUKummF48z+pKEBPqvHn4o?=
 =?us-ascii?Q?AR0Y5dVhtRCZWhw6TbzSMpZaPr7a7lCWxlubWJc12RW6dmq1C9V9OXRlxYF/?=
 =?us-ascii?Q?kSQM3xR44TeWBoDVU37xWOIie83WCpZ23XFRw2dltz4Own7ydSW7RrERQHAw?=
 =?us-ascii?Q?6FWn/ELOAhW7Ezje7g3a9/mdLTWlHD/IZPL7BmSly06tvtU3EyfcQAZXtTA9?=
 =?us-ascii?Q?O0m+ZNVuX9EZ+wYua3XAeSavvLAufIWpAYfyQV04fB5vV/+V/8ycZHOB8dux?=
 =?us-ascii?Q?1YunjSxfM2bXMpDzl7a4omsON9cSx6nn3tbc5XvcQReABBco6bz8WzrkYm7H?=
 =?us-ascii?Q?Pvi5p10b0GYq58tKMY3aTmVsPqD8FGkmw6+mSbTgESqnUskQYIM8psG2SJiI?=
 =?us-ascii?Q?s9aGCkhcyS0uWYesRr7i/6tA1GU9TqB8x15xflGz4SYsaGaX5t1BrN7urZnA?=
 =?us-ascii?Q?G893rYnDNn9DmsigREETHQVlLVaQD73mvHjeEZ7WWpFC9nLzhZ6rur1Tu+o4?=
 =?us-ascii?Q?VvY5e5Ua++bTSLyKu/DsRD0AWyOVrC880AF3X7dU4FMkKpir9t+rlSD6+BEU?=
 =?us-ascii?Q?CVdZ/u8smu9xRqZeoaSWRuxFnpzInAr6uOAk0WK1EpdLLBt0qNmkMn7Z6827?=
 =?us-ascii?Q?goingLo5El6Et1N/5XU4mwvqPkUB6LLj/DZ62MR9raHMat/ikn7/Cwv95xvf?=
 =?us-ascii?Q?w+foaqj/h0ANmH8fT9vMcS2tFSEXBGTFDwuFWlhMoNB70T58JFmkr6jTXR5p?=
 =?us-ascii?Q?i26z3D1ZGvS8a+H2zAf+oeexosfybuTNMPMNlBQXxzSJpmd963LqtmSfUK7g?=
 =?us-ascii?Q?wVc8kpo7riYxfgZ9zrgogMBzoHu9M1wRYKRRO7yfqvk4cnVFCNsKkfu5r/9m?=
 =?us-ascii?Q?ZV9uwBvnlc9mhcBFkB2jKEf9lZ/uOPAaOmKV13TCsQA055joIlA8nsr77wOB?=
 =?us-ascii?Q?/DcvrfMDeWWAiSktuBbO2mcmyc3hoIBqKyZhVxM8y3S2X3fp6IULQv1+V2v1?=
 =?us-ascii?Q?P3w1WA47wUMUPYCdsKrJ3r0ACTlRHJy9pGfLCH5ra7dS9ImAPIwRx+vS9m4G?=
 =?us-ascii?Q?d56xgJDfe9XomppCww4hRHIB2b2pS5uUksvbYhA63vCHCtzkhaYtJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5GMKHzEDN7ZbHt0m0AuTBmpSmVt4GVYO8CMjA1Dvav+7N4b478q34HQGsqLx?=
 =?us-ascii?Q?kp183OTluxY2G0n0C+CNfZg1W9YiMOczq7wXAsfJTM45Y1iwPYuGH5iuAhmV?=
 =?us-ascii?Q?QldmN0ZUsqvXWL3BIlym9xB13pvYiapn5v0+z6g0e+SBQnQrBIddRC+xCjDZ?=
 =?us-ascii?Q?d8Lm0X4qkK+EyIHosdYFW1H6O2C94lthcjvjznpGv76XnMLKDPOr4OQ9ya+J?=
 =?us-ascii?Q?LkrFufUGduNABrcelIqbAOxNQEa7gMPbyHag1GcVkc1J0bv7kLxrY6eijY10?=
 =?us-ascii?Q?PxpPdITO9lcCLUgH2omqYgqdfJJ8vxC3KKL4ieJn41gPFRmQFuPsQTTzKZUJ?=
 =?us-ascii?Q?hqzDR2u2PIjIbbalw7aXJlPKl9gyGMKah3rk3Ls7rm+lkwQMTpJQAv54/JnD?=
 =?us-ascii?Q?th8+hWRy9ZiCHXkH/YEnGoWb3gV0JomwIA+JEjYL/mBM4FYjVgLg85FEd4iX?=
 =?us-ascii?Q?FLT1SK0aRUEuQupK7r6e0UJ2DEFkVPiYraPjFZnaXLsDeVXI9lpPkitX6w6d?=
 =?us-ascii?Q?sKtnyyL8LNCXyqCc4Y5AA/EdS2w5dlv78DhMouDmWL5a5r45DzKUV9V8D9sV?=
 =?us-ascii?Q?hsJWeGRieq389a5bu+lfCbquWwHRpgVQJTxaqXlRSFu/aP7HJMvq3fACvnsI?=
 =?us-ascii?Q?3JPSvowBB9mq7vzaw6U6XEEiQnNtnvGPwNALy+OW+OWbe9eXbZS6faPrx86B?=
 =?us-ascii?Q?C1k2la+hkn70Xk+SqZDdkmXu9b54YCXgXUWHZqjEEYl2LXHlhID++rtIhM2y?=
 =?us-ascii?Q?qRXYMNAxza/kg9HFPwzzWBNGnuRaw/3Ew1B1I8xq/uf0CZfJXTtwORfq/xqg?=
 =?us-ascii?Q?tsPXAF22fiWINNP4QAjGKHdbbVOgisWp48ULp6Et3O4RT1MA8GOwicHx3ENe?=
 =?us-ascii?Q?/dAkjSkXJbGtyrbdsEzztICOUgELTQyjSk0W+3YmHgC/1wq92J9dPdu7sXZr?=
 =?us-ascii?Q?nuJEU1hpRny9lU+OmwKCw/Ygl2JhhEbon7t0CK3ROzWwsVL/eZL3l6v6mG2h?=
 =?us-ascii?Q?6965f4r7ME6N5Z03J87zrjeapARkKHIqoPeMM4dXrWBcwExwiLXWh2enuYGj?=
 =?us-ascii?Q?iT3Btky+A5osEZ6prmgo65MecOjkvkawxYl6AYCSJsCr8OXy2a5V+vrJNN2l?=
 =?us-ascii?Q?y74r4o7CCP5ehyRYRxyykGL4KaXbfyR/LdopxyRqNswxWsnEfXNbsU18giTm?=
 =?us-ascii?Q?DwYE5MtQWCC/WNpAExA4i3zrrIbLV7VijJaFbtm2f2FH582C1yIXbFEu0POk?=
 =?us-ascii?Q?7LiM1hzEKa0PW0IGi8GXidLfsen6uGN3h0mUq84irOHyVtJid9y1yw3ACmhy?=
 =?us-ascii?Q?ywkAjF7pCIm9BI52Po2XqOD1CJFE97yObrtdLKPoP+v2O+Yy5CkOVS0Yod2O?=
 =?us-ascii?Q?cA4SO0badPWkHLvWmKJ/c5R7aPJMKzjebP2Q+LQD1mCiAieQ/d2/yxxcJA7S?=
 =?us-ascii?Q?wPWs1Pt+/GYOvYbXL6SjXwPEFGuFO0xMghbJcQrta5O2Z/AX8g8q8yqKFFGa?=
 =?us-ascii?Q?xcry5AhN3mrr7mmzA30cGXcvVIAddO3v+UjDRzIRGHdcAUsGSGtyWBDFUrw4?=
 =?us-ascii?Q?OnCDRDJPJz7y0ko+/CCJpMOw+zFj+b8ctCWLTyPNkuCUA9+Y+GYsmbEG+p4l?=
 =?us-ascii?Q?NYt/qM2z3ocTZV6kpnCZAuU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6213af8e-6671-44f7-33c9-08ddf67212c1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 05:13:15.9376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOiwX5sTfujanoRoJzw07Cy6XEABTD4u76YUO7eD3exzpjO1+VpCvR/rI90Ws5dGFXtk0K7bHXCoR1zbXLXaui2oqvmPVZe0gPmXsWZEOg2454rJQC0pGuQKPqbZLd52
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7105


Hi Geert

> Sure it works: SCIF is in the always-on power area, all clocks are
> dummies (the real ones are enabled by the boot loader), and the Linux
> driver doesn't use resets...

SCIF DT is converted from txt to json by this commit

	384d00fae8e51f8ff812937b2e654ba3da858227
	("dt-bindings: serial: sh-sci: Convert to json-schema")

It seems original txt didn't indicate about "resets", but new json set it
as "required". I guess it is too much ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

