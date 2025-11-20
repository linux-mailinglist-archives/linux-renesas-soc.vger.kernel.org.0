Return-Path: <linux-renesas-soc+bounces-24878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB30C73A35
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 12:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 25E2A4EAEA1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 11:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E902432E138;
	Thu, 20 Nov 2025 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FoC86UcV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422330504B;
	Thu, 20 Nov 2025 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763636865; cv=fail; b=jk04fAXqfOaJe7Xu0hqo1WPywqtfjf9QBXekdu4KpJKSysmzBugvPdYK3W6SxklFF+4yScMrwFpbDoy9xe1WdQ0LcT02FsYhy2nCkRvsVEsbbhdW28mZt2Rs+3dQuY/VqdxIxG53d4oj/J1JMZEbkac7UE2TIOrLJqCNKeKZe74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763636865; c=relaxed/simple;
	bh=eSd+21yzDdyZAO7zFb5o0JUCyliZKBXA9wrcgnwJhj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gn5qEai6swkbkPq08ljR+CwbQgihEI/VrmxWhJxx8pUKJzB2ArsDjGCVGbfqacDNfHEOYHChtaQ7a5E0SnmiS5rzRGfk+rbdNxibpz/otGUvn9NTA4Rm9Dbaw6SgcMkVgpiFOObW81AqBaKPABNlWjWIrA4Kd0eyzeZGLY4vr8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FoC86UcV; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2peELeWxAOYONyVZITtHs6Kjk+hlx0VSi47tKa4J4br8aYW8Y3rXxC69M/R9yaRvv4BlUseM6mgHLaQA+UopTiwLVGAquaoSQLMztTTdQ0hwOvLarWtY2+h9MDE9sokAHSsgc5hJDCGV6+KLD+Tqd8ZDZbNIBjtwyQxIx1g6t5hCC2o8zlpKQcqM6lqggUGCXHaeW2a6lJfUH0PfzuALWri1lXMMkc6LEM/8EtQEWTqSV48NvcNLUNaYiSav7JEWsXoXpFA9pbfaHhgYA6Z2lEIo4MdIWgnIbqmYAYVW0rwIJyHhJR+a06lVhMhEoj+w8LM4ei8VA+9jFcFM8WuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eq4osHYpQ2kVky7O66HMmELfiWs2EJ8fTegDFSE2pb4=;
 b=w1VhE/pRO58r51Iw3Q+28wTGZjUcO9g1grtSIYKpTANKVjTc7O2VXUliv71X1whKREmh2TlmAhNcn051hckwaiAzI+JB2FtmNJWRrlk0x62Nd8aDyfGPySushiKyiP0DFS/b9SXqwhjyuB+cQO2H3BpQWdK9OUxgvo59vbpQozZjjw5UofHK/eqhqlivfO4aNX09QPzltpW+wI2GNGFk/3r5ctLjGr5cwa8Ts/AUoEGfxsr/yAO6JhKh+l3agRiYoQvFBn8kismHuSUcO+CCE+N5G3Y4M4LdTwBQ0flhNFVQaGBiNYrjdziN3RUxsigu14vd1gjLdwZVBZYw+IBR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eq4osHYpQ2kVky7O66HMmELfiWs2EJ8fTegDFSE2pb4=;
 b=FoC86UcVOvNe2zzYEKYG7bNHwmtk8yJBPEGBbj0gvqD7f61ZrMSUvHmCL98mMfp3rUBVCodmkdO4/AHVyOggb64BxbEony+MKW09BlIH062YoNVEQPcyBBtlmctAXpAgdgtXvEwfZd+XR2GglHj8F2pHYUaKrRNUR8EWjE0BRNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB15838.jpnprd01.prod.outlook.com (2603:1096:405:2d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 11:07:38 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 11:07:37 +0000
Date: Thu, 20 Nov 2025 12:07:23 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Add overlay
 for P3T1085UK-ARD
Message-ID: <aR72ZPGIJD9JWOCr@tom-desktop>
References: <cover.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
 <0babc991d3b2163200bc083ef80563931d4b639a.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
 <aRyiQJsu6gob3Gf9@shikoro>
 <aRzzEgeetDFlE3YC@tom-desktop>
 <aR1f6PMbG0N_9oAo@shikoro>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR1f6PMbG0N_9oAo@shikoro>
X-ClientProxiedBy: FR2P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB15838:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be60b76-c5de-4bae-88f9-08de282503a3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jCuPEqrMkXnKfIzfZzTKrBUmxgzfXTlbpICI/yMGbyK31t9LJu4nUfiwSl05?=
 =?us-ascii?Q?+My+RE8761s76GkS4FQcvQWY9sdtMv3kSr+p0/6ojP9yHdwcolhcHv9OP47L?=
 =?us-ascii?Q?pwgcViy87HpmDe+wCLBguRSRac2RKZx2H6Qrp/HSSTt8wTbY/wBiCDaZgFyg?=
 =?us-ascii?Q?kIfdFd7LLBQGRSSDSLY0yV6lkXslzD9aoQi9Quucas20BOrKv0ji/OB8EzAM?=
 =?us-ascii?Q?L0nvkiYRLGdVqUMfbX+6twMRqbKYAAA8+ePbczlbDafoJpk++fCqxxefnSNV?=
 =?us-ascii?Q?+5pq8DmKwkxbm33V5mclqksKGv5c2IZjE3kNkZ40ZWXnSDvYgbcx5xSgJ6hj?=
 =?us-ascii?Q?IGUfLcYBTlwkvS106lcSZaly0Fe6QLeG4B0TT6bNSjuiQBB+RicdOD3OlwXa?=
 =?us-ascii?Q?1TtZwcASA+we//Fo5c0esqiACaz3paWqCM0Ltm0qQgVY6+bNSAcNwwFUxsZ1?=
 =?us-ascii?Q?iQYbyZgdFbeZiGA/d0xiXsiKr/rYHmG95hM7rx4RTYvVKw8E1byvn4n9GYS3?=
 =?us-ascii?Q?NeP7A0c1W/3BZOnAyj+DWiRZE4ll2N4rvv6etv/23qVWiyUgEpLmMMZ3Ow1B?=
 =?us-ascii?Q?Il9Wk0yQTLx97Y4S29oNpassChvLye5ccXggSRz/t6YChNDRpWrIHxOoNGHH?=
 =?us-ascii?Q?5h6Np6CxxjJ/kzLzy861OyqYfYQBBCDrGvipS9HgO7mOG9w11Q7fRTK1lOw5?=
 =?us-ascii?Q?ucTnJ5Y8jVB2UPjuHbcFt0XHurl2OCvLNTUu/T5VUeQyHYuTI7BbCzImI2Li?=
 =?us-ascii?Q?Z0UHi6pzJ5hKopsJrDjVXMVOBhoUUnuwqAInvKMZTyW3wJVY2aFI4w6iMSMA?=
 =?us-ascii?Q?gjffuE4KmWadHTLPGU31mC0A/eJBdDc+rFSDvFrL0/Rrq7/CSpHTaGX4DhHF?=
 =?us-ascii?Q?HvYn87/wHdNJKpYASoLl0J/iZ8HkDdcbl4ygVKV38umr3JGR11D6wpeQK2CS?=
 =?us-ascii?Q?0sDKdvswAY8odBVJQtH6qmEoQ4rbHoVwVEJ3X3Nzin2FG5iNJsrrsWLSKYOy?=
 =?us-ascii?Q?GOkUMPrH7oLIMqxsgD85AWRwcrRpuETn3A5uzxOS8ECHGzlK5mKWkPyKRE8M?=
 =?us-ascii?Q?eZTMfsTexRp0Myj/uM/bmwmLFEWPSch0iD06keLsu74/Bue/CzxEsceYpw1w?=
 =?us-ascii?Q?202aLaQ+YmGvqcBMFRHIalR0JhSqf0gldeFV3u3jFNumlIU9iW4f3uCzL5lY?=
 =?us-ascii?Q?y9imLbwzs0P9NF35HO4wcjlleH5vMKmWnBFlKVZtXtoKGBjLa6lsGTssCJ0u?=
 =?us-ascii?Q?eb3SAy5HOpCZIgWk5TN+in3TqVYMkbPtHMIXDKLoTon0KjtoXL1m/RbmmPHy?=
 =?us-ascii?Q?iJ2GWZ/aORPKnIhVAD/q/JKH29z7FNPbdoJDY829C/JEv8Jf7AnvzF2Po8JF?=
 =?us-ascii?Q?0zvckUOCm0v+zrYqu1HFKz4X2B7T6ns9EK0HEkfDRfFqaNSXAtnc26HAwRkd?=
 =?us-ascii?Q?q8qJmubJu/CMki3V1guCOgtw/ozgHFZ/OYSoBbJhj003hvJXAXma8D/ZbnIN?=
 =?us-ascii?Q?PYGJFkNui2yOoc7KViT7BFbHpijLEJ68iKSF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QE4Pj6ACNFxvo7EmmoX4yWWW6Knicf/X76rXtXbFZhKeMSC0YIK5D+7xVE/0?=
 =?us-ascii?Q?FeVGBVvvl+yv+nOlnaTiuvRwF2KL/aKMjmstbawSmwYaynJTUh5c+8N0RsYk?=
 =?us-ascii?Q?n52Cns+zDYkPcku2lCqFzxVX2XD0oFvnRFL8lguxznzuhCDZad4JKOFDjLFF?=
 =?us-ascii?Q?DkW4wIJUpDyt634ljiqh9XzfVkxL03KJG1aR3zGM75nGaEy1MOMcfDzn3FDq?=
 =?us-ascii?Q?M7HrljMTxVqASaNZUcXyGVd6DBn3zIJaUWG7SpmXusbJqPo1aaa6PBAhrKon?=
 =?us-ascii?Q?4a2h4QMARiY2+e3MVdOEQDB1TrnD7DkrTxPVDh/LdyM5Lhs7Qn4yXZ3a2znm?=
 =?us-ascii?Q?ZrhlLkcA2aRYTBAjeED7rmI/U/GZQ2lOESNQY+qBpXwFBzIShTjbEibcdUTc?=
 =?us-ascii?Q?Nw1pvPOFhS4UHo/BttL2pjLsSSrVjHboHOEa/G33aPYYsOufylEJKkQ+k5yC?=
 =?us-ascii?Q?kP3AFMP407FpNTYcLyBbBe0XcCzJX1ny4VzTItmqoyqTSdfp57bGiI224rGT?=
 =?us-ascii?Q?xLIy6y3QeTZs+BZmKVh/O7vUdzLUfvZpFrmXzZwvn+Ie83aktYsZwWPrWHpX?=
 =?us-ascii?Q?zGs37KKwSa0YW/B4mpGAks1kdse2n9rWOZQ69VtV6EbFdgx6NfAA+OXvoGGy?=
 =?us-ascii?Q?Xfy/RbYi5u9pr7BrUbcW5Wctkgdn8FXSSjuQLqAct1c4NTgR6bm2yc34J3kq?=
 =?us-ascii?Q?FmFjtzIwkvX+X9bMbnEXajXK3RKvOcbv7bYt4aMfOxqM9S4kX+4AJgzWIL63?=
 =?us-ascii?Q?xJXBsLtCvk4VPSrpRQDcnr4Vb0y/7YNlVNITKKfN62g7i/3Tvbz4jvcgJW6a?=
 =?us-ascii?Q?ohPYBm5OU6GNmLvzdJ3Au+aJndrOs424EuVezKryWOIlpyxHOkXqk+aP1jW9?=
 =?us-ascii?Q?aytQ5C7P1A8c+YxZjz0cVa8jVAxSclnny7umZiLC5Tg8rcB1MY5n0sFEGavJ?=
 =?us-ascii?Q?/kX706Hp2K919Kj5pgo/ohlmDUNcKH/cUJUVWKMhNrZWmOSno6i7fJQyOBbw?=
 =?us-ascii?Q?/Mkq0qtmCAS0Hqi/4Vb0vH4kiB5a43OOPOjD/3m1h5ykpr94foDwKtE3X7tr?=
 =?us-ascii?Q?5YbYJIj56ywsDsgSZOIq6m7f890svVSnLn0QL6avFjAo5Dv7k5WGbyXjpmf8?=
 =?us-ascii?Q?RvQI+kcAl/hMR8OhEUu54edF6heZElh0fcqruhlnRRG88ExwlEjA8Kf3EDe1?=
 =?us-ascii?Q?IqYD908sCU0pEMAz1iCzpdS/fbzssJixjEkOal2M/JM0A4YoyYixWf4hUWRV?=
 =?us-ascii?Q?tl2ytKPIJ89fh0fc2hPGKbhT2xK0jtZmuJQZD+dmt0eG7qMdAPeUKgdgKhVn?=
 =?us-ascii?Q?yHw6Mbm4rwW0Jvh2zeb9ceMiVGuR0Z1tCnfdetDmiGfmIH78MK7rud0S8dk6?=
 =?us-ascii?Q?+PQPIM3vqk24isjcFIMmdhPiCRII7UCX4gWtPjVmYK3RyHqpQdtuJ4sazTJP?=
 =?us-ascii?Q?RZsOo3HVKwQuSaNoZBcofM9DFAM5lfBAhbXBQ7ig70BklCoOJMpAn22k317J?=
 =?us-ascii?Q?6QdjNgfeU8Q41uIaocdLfhPtC3TgS6yCerdAt5/MPOyjNTbY6lBbVeEF9fPZ?=
 =?us-ascii?Q?w3StO9GcyIscdEx8W8lcotYyZNtZXjTl9KvmRpJ9O8AqT/+diD79g370ex8M?=
 =?us-ascii?Q?dOZkO+9Koq/AJmLDfF9+GFc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be60b76-c5de-4bae-88f9-08de282503a3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 11:07:37.7130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/PT8YFUx2pxWt6zPQH304dWJyaP4fRnLg61iJNSwzuCnjVW6r+2oNX8h0hDjIX5qKYazp3Gmbs9BwS+0P6wi+/clcdjOhbGqCEcJWNJVdmEevdAKY4ibtDFBaFCdu3L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15838

Hi Wolfram,
Thanks for your review!

On Wed, Nov 19, 2025 at 07:12:56AM +0100, Wolfram Sang wrote:
> 
> > Your suggestion is to keep only Patch 1/2 dropping alias line right?
> 
> Yes.
> 
> We could think about enabling I3C unconditionally by adding this to
> rzg3e-smarc-som.dtsi:

Fine to me. Thank you.

> 
> +       i2c-scl-hz = <400000>;
> +       i3c-scl-hz = <12500000>;
> +       status = "okay";
> 
> So, I3C will just work when you connect devices to it. The I3C frequency
> might be depending a bit on the I3C target board and how it is wired.
> Maybe use 10Mhz as a safe value and add a comment?
> 

Since our current testing setup works fine with 12.5 MHz, I would go with that.
If another target board is used, it can override this value in its board overlay.

I will send v2 addressing your comments.

Kind Regards,
Tommaso


