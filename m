Return-Path: <linux-renesas-soc+bounces-14553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E46A66CE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 08:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AE8819A54C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 07:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131281EF374;
	Tue, 18 Mar 2025 07:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YaoqpmNo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010059.outbound.protection.outlook.com [52.101.228.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C71581EE;
	Tue, 18 Mar 2025 07:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742284278; cv=fail; b=oifRye2gNoXVT3YR5pSqauAub8q4vfOozl0RVUS8Ib++Z3G+3MqkGYSfumhb6tbDNPrQA5iN3zTIVtanWt4KO2cB3WP/fcKhV+FDIp9wSen9595ge9jbDj3TDr5edsMgzXYIqAscCElFn2EmgQrq6hVh9EJkdTcwxXZMzhRQs2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742284278; c=relaxed/simple;
	bh=9CwVX0GbxPZ5AU58KD/9+TYgLXM3dyqFN1drnInzQBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CYyotBHYHkDqeaoPXzlEB9jAPgygVjT0l7W2zbDDnUICwAKW9eghW+ZDDABfKhsDbsy2Yk5t9aM1BscXPzfJUFY/SSu2uTiaLxKyxjMSQHJG/sRCulhE3WVyLCyXSsP+kvXV4mVwB+NR0/V5G65XJa3P6x8dE7NtRL0BJmLpKZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YaoqpmNo; arc=fail smtp.client-ip=52.101.228.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aa1RxzKFQHYR16KADvnbFwvxESMYDkUhWqoPJNeS4JlpMOJsKjxUAGBLZc8LGirhenqEJzARQJxRdWctI2S0nyturvcSfISXVdO9nTRBEutLMJL40WYqNgxkZ/SPQoqya00xeXyUg7PIza+gzkoxtF51hecWDACoSYydD6OSoPUHaKWmZwNKQitMw16L1yVgqlRy1pNvpILhAKnUJxhFOLQ/E7Txq/IAQUwQ7HnJq461pZtCc6Frxl0uLX2C7k21pm1Uz3kw4UZ3yH5vyMnXufUAV0wu623RV0mLPFSoNjJ3RwnSOE2XTiE9H7neYONaJ8hLF9uvaMzBGo0YpHMXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7S812xgMAJzBSMogJHcizOZbW9gOWp49ihFE9kxnnc=;
 b=km5GxogUxPFdK+O2x87E/7GO0exVEgtV7aFPRJEpZ49keM+AB5CaQH+loctlVOuElyAQJlk6t82Covgy+GWyWmBLehfJoL12CDG7Y78UlWQ+qk5G1R8Adp5aNrbrc5JGkfDeb9k2QszzdH0cNmSzgCSjJAglNdmpk8AArX92Kmji0MFiXQSEd/S/C4tChQqw6ntZOji81TB11bss/3LwF30rBL8IxwoDADkDfhK7ubKzFEzoBx/3kV12GbcLRHqF+rG0wDVKEbONMiRUDmCHGQNY85yR5zXhpJN3wSRu5rpvKXBwIvQOi31OwISut3WrWao9SkOF4P1IlSizS8QQiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7S812xgMAJzBSMogJHcizOZbW9gOWp49ihFE9kxnnc=;
 b=YaoqpmNoe7P1OAjIWKK7QBEH9M+FzEFZ4bR3kIyAdCAa8oxhsYxLuQYRaam3Tkr1pAXrjxoi+SzkH48vj337P2M4zE7XByx7CG1XeZDuEjtPvzDoY85xaqvTgjMgFv0JxJyEc0h7iHhUq43pxiiHh7vjVlaimv8K9V/uhP0DL7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB11559.jpnprd01.prod.outlook.com (2603:1096:400:37a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 07:51:08 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 07:51:08 +0000
Date: Tue, 18 Mar 2025 08:50:41 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Pavel Machek <pavel@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: renesas: Fix description section
Message-ID: <Z9kl0dnMuar-0cek@tom-desktop>
References: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com>
 <20250317083213.371614-2-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdV4SyviVU0+WhgFD_vCO43BQ31tx8az-JihWDAB9EJS+g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV4SyviVU0+WhgFD_vCO43BQ31tx8az-JihWDAB9EJS+g@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB11559:EE_
X-MS-Office365-Filtering-Correlation-Id: bb7d095c-42e6-490c-1ae4-08dd65f1a4bb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ztzy/oytFmOz7xQYbei9mJJPt6tWfBeGfyoW9n9onmK3wGoflJDdcla/dX5w?=
 =?us-ascii?Q?bKJXXCMWWbf1f8fzOapkdvVSfFCt9imjGUNWk+IAFZ+1OtGtoGPIPsgvQbR/?=
 =?us-ascii?Q?63dKrRUQobnTNr5I5DvR9T79gR3ev1bJOWzzfySzu5S2sGd6c/9boV/Ti61d?=
 =?us-ascii?Q?TsqkWIhG/qw2n9nPxZYNwdNujl4Ml6CL2ItOusEdgDA5JtbR4iNYm9lOKx2l?=
 =?us-ascii?Q?hLNDLMOX+jatB4CgroWNL703ylsymAkTFuqIrYrEeThgbTZFtC32LrcXV1z+?=
 =?us-ascii?Q?Z6phxDLo29PaUz4Pr03BJdQ/bHNgJq7LVt/zZihZt1dWy4nOtE+M8LHDhfkQ?=
 =?us-ascii?Q?395nlRBCDIcYD6JOiKUgyHp6NDubyE6sA7nKYduh50DxR6fRcEJuZeueDm8/?=
 =?us-ascii?Q?kl7kgA/awb0pAJRT+CKFVE/VcIfqTSqiblkHzY7kHkqZQZ3gOG28EIvafPJv?=
 =?us-ascii?Q?MUeUwIfyXTQQBBN8PVuFg+rqvxb/4H5UBtxLieFcfpOnxhnNnEhqcs3lYN3B?=
 =?us-ascii?Q?zWnxyou5G9BhlIttyPaWUoZvM1pRZGUJKEk6O/B9NFWljIZ0c7zM+9A2yhlq?=
 =?us-ascii?Q?TWuNmwIfYWghsp7q+DA+uTo0cBpEJfE/VXGw4qKJvIOJTT12QGf9ZyEcqANv?=
 =?us-ascii?Q?8N8rGUlXUmDoD/QUk8UPb0X32jhGIgdmDPGn4kvRI7H9KQIyChjMEnZ4vpET?=
 =?us-ascii?Q?mR/98U4eCDXNICiOSRfFSKnhaQpMO1tXjeuSk9oAkShPNJcvGG20GU4VShvR?=
 =?us-ascii?Q?odxjROGAq78vEmKNpsTsWj9/pLxsHMBxORRDV3oIozeWZmGU4lGwEw9QCDYm?=
 =?us-ascii?Q?PCbEAxDxh/rTYHSvn/dZsigyYNcHN3rprl5jcZ6bsT5ge+gLYMUfqvGrbn+A?=
 =?us-ascii?Q?jGMu8IfwwkSq2iWCQlEV3ZdS7jhuykHYqctx3HBj5+/jyfpICrFJsHWkpHVL?=
 =?us-ascii?Q?m1cTULbPcD7Cm4EStxCqpFSSZMJS7bWLba7ERWiXz7erKuARz06030+wSaur?=
 =?us-ascii?Q?JbmpXPj60SissoX97shAlETpYpqKUXLoPSrstFVQfwtOzWwIOlnxlMBJHxpM?=
 =?us-ascii?Q?bntiU8YVyzMWWInajUCTRlqLsaRqdy4GnobsJlMh4mvZvYwqbroHDsqhq3yv?=
 =?us-ascii?Q?9g58KYJvpPYjl5euUV9uGWmF6/lo+/BGRzwivdLcCT7pbrvmu1YC/ezSo/AP?=
 =?us-ascii?Q?1xHuz7Z+3sVYOR2zX2hVmL1iQs6LjVDJa2eKqCZfAykjIZZxFyKIyX5JhSJy?=
 =?us-ascii?Q?F65s1bowenBS9rL1RHL4o+hZfguGo8DC6pvZ3GX2siENsEe1S5fAEWtDphwm?=
 =?us-ascii?Q?4S+MjkQRIWqpT+9gITMFCkfJp/yb55AfpnizbVdtIVefO7enigIg+nImZ34h?=
 =?us-ascii?Q?E3Xhqj47wLPGtKHspfrv4ivetEAellxeGD9Bu72YFfJYnZ4HvuNtwjHpbgrp?=
 =?us-ascii?Q?etqPDDPTQ1Ysif5ppOR9IqaOkvA0SOIP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nQq0acufRvIzsFUoOweidH7K1/PW0qK1BIWi04J/WOlb0BA9smZDhj/CbJ/k?=
 =?us-ascii?Q?EUaJelWJmFUhbfUrtnZSWlF2+RwGMdp362gNxlZtWHM9AthiC6od6quN/h6D?=
 =?us-ascii?Q?1f7ttqvpZ/zvC8QQUwLdMAaMp3FxWnsaGU8R58fppRAIVxmvtwQUFBpdqQ5H?=
 =?us-ascii?Q?l2GiyBvDPoOB2PAyTyVJeWehmErsuL5z1QjX/gjpjTtmFaa63BX5M7Y/dAWq?=
 =?us-ascii?Q?FyJ7AGPnAxBkTzxaTRd5VNV2FUC7vKBXwH3WJxceR3HHCysr6W6JVEadyKlM?=
 =?us-ascii?Q?BePm4uZmjpoomgxAqcVZMSXrVH/zz3WZgh7p9/LmaeKE417L1oi2fmn10cpX?=
 =?us-ascii?Q?GBpKKc6RLat//7w7HJpJ4e9dl7tOMa7jdQEmuxWAsECTdFsO07uoehdK3hOv?=
 =?us-ascii?Q?mTUzmryfhKPv0ywmxbSooZddLPYMS/Bzd3bkcw6Mrvsn5washUuUikUFx5am?=
 =?us-ascii?Q?/y4b6HBbeUGHSP7xnYRM9GUh7xubUOlfmy9fHbPDsSalyQt0/3uFLXg4E0b5?=
 =?us-ascii?Q?nQ5tirLK2MheC1LiGNDsEFqN9B3cNT8ZxPxJKBGxC6dnuzD9It6PFkKwLaFy?=
 =?us-ascii?Q?6zwexWvymZs6/uCDTE3To6M5Y+lKlQZsEQVqBqUy87XHJj8gdAKtzbu0NG1c?=
 =?us-ascii?Q?8KfXFZHzHleYaZUJzf4ZYmW93s29zCa4m7fXjjS8pbtkdrZVgyT6l0ssqfVy?=
 =?us-ascii?Q?30v70y2Lr9DA1T3BM0rBlZFMicj6k9Fb55fY4LI/+0hmU7iTtRuCZAcJDzzg?=
 =?us-ascii?Q?598gez2vubElT6jbFIOlcLex3XCyVdZurn2sbITYN0TZvNJi5W3NW4Z95hey?=
 =?us-ascii?Q?//LYs539Ev9j29oS37jY+MgCrMURGk8gVsFH/ctjFTqq9L805bmYaGnFPYfE?=
 =?us-ascii?Q?rzSZQ4XONKiESh98V5fJWJoDqsB/iqmLb91lRqfZSvdMs7TmEeNVCnCMx7g7?=
 =?us-ascii?Q?XrqhEiRcfa5sZxu3o6Fs3Y8jT4oMK6ikf1kdl8WZLJNqy6jrXZe+RlefQWuE?=
 =?us-ascii?Q?eyTNlTkvJTRSy2QWaHp3DWgAL1P9hUEiEikafnXPAxj49zcBQwaDR7HM9aZd?=
 =?us-ascii?Q?dLBW97P36PB8+WQQXrhMgWSztVo+82V4AjORZAifnaXr0eMgoGqSEvO4yNIs?=
 =?us-ascii?Q?0zu9f3u+X0ehUV5mErSfmNaLALpTAPo0H1eezZahKhcNH9VdvbkRRY+16YU9?=
 =?us-ascii?Q?SJq5KlN/nFY0i90Jy8BBqa+1ERD116Lj5n7iAQ7iygqUk/Ol5g4kcPp1KGw8?=
 =?us-ascii?Q?Kh/jiCgtcoyNcf1nVwUP3QdKWuNqrFdMora76/0E2Cy1nOhnugkM7TZXAU9w?=
 =?us-ascii?Q?UAULpklfaBSKqcTAKgDQksZ7mWszWq7bZ/9DlTY7ZLDo6hokRKP27OHBp8jP?=
 =?us-ascii?Q?+f2mI9PMbOAFXY3f/sIAaEvuBX5GjzZKthZEELwaJ+W5A4dfoEskU1zfoEoN?=
 =?us-ascii?Q?hq8EgcbAKw1iRrN0b2SnYmypj7Hgz23qhkHjvX8BVTIOq1J+XcCqytsiyMwY?=
 =?us-ascii?Q?8fpr7GbLHnLAnwA6fl9J40vCXYUAuleRbPoHZ2jYyjVssrRZc59cZ7JPGrtq?=
 =?us-ascii?Q?V/8aH5P0sumDThZi1n8PGhEFxoQ0TcNNsyPd4sn/ATAZi/rPeEBMPzvR1Ycg?=
 =?us-ascii?Q?nd+74iHNZGOMSSHUyev4PfM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7d095c-42e6-490c-1ae4-08dd65f1a4bb
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 07:51:08.5863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGDxiGJtAk5s4oXEqm7JKYESpT0oaYicYNpDAQcJZO/ru0byaDI8TMwLfTPKHJt3lk9Ulv7Zo9i8wNBPJoAlBxPJ12WPrWTOS7NrSNk7uA7CE4C7KcRLHvPi0hTC9+TP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11559

Hi Geert,
Thanks for your review.

On Mon, Mar 17, 2025 at 11:08:19AM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Mon, 17 Mar 2025 at 09:32, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > Remove not needed "and" into description section.
> >
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Closes: https://lore.kernel.org/cip-dev/Z9P%2F51qOlq2B46FK@duo.ucw.cz/
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > @@ -12,7 +12,7 @@ maintainers:
> >  description:
> >    On Renesas RZ/{G3E,V2H(P)} SoCs, the CPG (Clock Pulse Generator) handles
> >    generation and control of clock signals for the IP modules, generation and
> > -  control of resets, and control over booting, low power consumption and power
> > +  control of resets, control over booting, low power consumption and power
> >    supply domains.
> >
> >  properties:
> 
> I think the original is fine.  When emphasizing the structure:
> 
>     The CPG handles:
>       A. generation and control of clock signals for the IP modules,
>       B. generation and control of resets, and
>       C. control over booting, low power consumption and power supply domains.
> 
> i.e. the "and" is part of the typical "A, B, and C" construct?

Fine to me and thanks for the explanation.
If you agree I will drop this in v2.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Thanks & Regards,
Tommaso

