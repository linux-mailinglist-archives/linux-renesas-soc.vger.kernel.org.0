Return-Path: <linux-renesas-soc+bounces-26530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9480CD0AD76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 16:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45EB43000DF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 15:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFD035CB7A;
	Fri,  9 Jan 2026 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="H/QwfigQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010035.outbound.protection.outlook.com [52.101.228.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE569311C38;
	Fri,  9 Jan 2026 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767971888; cv=fail; b=b9GqHAWzm7y9ecxUL08XKrH4nMSjH0OA828XrZ+xG+ioZT9EdcF9lud1DEcU4Lo0X6f7yvujgUn6PZTWjVs1Vc577vXGI6oau/QrgGc9vuht6dV9HFZnSjjky1sG3Hja2tTsx5PjoGW0irAL0BlaKPpgS9Tzd/GYI3jgoYjGJbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767971888; c=relaxed/simple;
	bh=YZRgBHXPvxIRQU2KjCMqJsZGW+53Ll1dw6shAsgI9Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OVQ4/c5DVCTeeA7m3O19q2WecLmSN0rQzUSoMzrxisOU96xQByvftYuEYFkJHjFOIigLHQPbKoh/kYu1ngdE2SWJvOAw7cv3G1YV6Z//CcTxutvYXUCS6rsBunu7nG635f2MO685rbSaFRni1dp1ylpYrkDkYwIJs4Oyp2ii1OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=H/QwfigQ; arc=fail smtp.client-ip=52.101.228.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2NVNgmjanb7ogFPzFiOhOUIUWcnhfIxhv3gYburvhQyz77M8EUyNvzc/RGt6xVCdMBU2rW5cu5FtN3dM6AOGJTojDQ/EQvhiJLX23AOxD4niGCZpf/z0R3OKcSuC8fVKoR2XaVhpe/ejDgzOP/bIirNxp/oHfUvb8GpGFH3Z46PCZOdxl/SXZWPSNPbTl2N1VO2BpglZ1pvlkpCv9ew/ieGNvwCluuujo3gyCQr9tJaVAd7x/37Vc3Q+uui7Fntgizo5mPZKKvJGFYQCrlF+4iV4w08wgy+mkG8hSN1sM6+YZ/nyesafcn8+TYs5UruHC4DGDQSn1oOWxsnSSi6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qjmPLSbVBzigMfSI0998fLe7cwskgFRVViN4tcN/io=;
 b=HOIoLUmnZzLYQ2UX5T3B7KNjdaHzAcNzlISYBi3IRdRvZmiqoRn5hJ+V8EfGqH5d+WQQOsEaCX/sM+CkGau87A77W7nUJdsfvPeB946hktdSejxOAwkPv/EtbFtJmb7Jij6v4Pa1+pLtKJpYJHq02NX5ZXnTAkATgLOw5OC+PSL6epWTibcd0rzFo++O4W6W2EwoSEMTHJuv/mqZPyYyJnQRu425DBR8z5OswArc1RyQI60+yqnKdg8Dt2pTXja0jfB5V5o/jiC7qT5wtwBgASoccWHVok1sz2mume+ZLzYVFGd8vOFX62tDcgCftJals/oZeQ+87kB8aCMTiuUxAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qjmPLSbVBzigMfSI0998fLe7cwskgFRVViN4tcN/io=;
 b=H/QwfigQCftP2qvsheKauhXm3XwOlMw4eo/Tmg2SaQdJCBmkfJXG6yROv1lOReqVNNBe+Hjwu+bLnnOa7cZbfGKNxHKq/xdCjIATzYMGdjNisOsfITWh569LMyU/Vqpvwgw18E5iOtcPL6946Y/WIYDSqkbrwr7tSHQBkFwTZm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6914.jpnprd01.prod.outlook.com (2603:1096:400:b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.1; Fri, 9 Jan
 2026 15:18:02 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 15:18:02 +0000
Date: Fri, 9 Jan 2026 16:17:46 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	wsa+renesas@sang-engineering.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
 support
Message-ID: <aWEcGqXgQSZwn23S@tom-desktop>
References: <cover.1763638659.git.tommaso.merciai.xr@bp.renesas.com>
 <9d1cf2cdb1c11f24378404142e4c8aff680c6961.1763638659.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d1cf2cdb1c11f24378404142e4c8aff680c6961.1763638659.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: bb02cf59-93cb-4723-4b5e-08de4f9247c4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f7XLIUSCv7aNpJqA9igqJn02cT63/NpiWz3v9eYiFJXSJJoCRo1z6z2T0JTF?=
 =?us-ascii?Q?IL6A1jAXt/U4gLl9olYhEceH5mdG5pHPMYj5byUoUminqYTO0INvMkoKuxbZ?=
 =?us-ascii?Q?xT055BfEmEo1p/P72xM/GPiLXxse4g2cTnucPblSkiDTeqC2+V0Ga2YyCWpr?=
 =?us-ascii?Q?rWwIF65kWUG9SlwdPAT6HUfr3bXtTcCUzUALKkdJdlylylZAi7N+O7AqFlCW?=
 =?us-ascii?Q?6jhIrgUouphbCcSJsUDTuRg2eCZZfTKqG6ZQ34bcMgHT+VvWJZqRIcxg/S9h?=
 =?us-ascii?Q?axkJENof6Z1CXyPzot29RZq1cL7dJm5cy/uu+xPm0N742oUkPT/KXt9wI3Oi?=
 =?us-ascii?Q?yliJ38YYiP2151ycwPhLmeKddytYzxZ8kOYrLZgg30P6auSrAwCh0qTQRu/7?=
 =?us-ascii?Q?Cvb1Jm/qt3vMBWdQ1G7JtV3c/k1IhpdMgUR36U8AzfOk3R6NR+T6WIg4VMFb?=
 =?us-ascii?Q?P3K1njnMIwSrUxOXhgrt7wk/eL73qEDwtai1PT1x4bNqXx4scAWBmj1RObon?=
 =?us-ascii?Q?ZbyoQIPxu5ZKQDVUDnzPID4N2IQQkwtqfZ1t6xsmlKNGAfWA8DHtz1Kt0P0c?=
 =?us-ascii?Q?tgafBvCl97wAKLWl8W/k4Tns5kGNNyQ69+AY0uPD9ObERTODLRGTmn2G2rZs?=
 =?us-ascii?Q?sB0JQlbvTWgaRmscjbN7T4Pz/UQzGvWKl7eZva58ypXFYcGALSfp1PQLBOJw?=
 =?us-ascii?Q?G9FvEaqMoX7H6UqqlE36N5122qrXY2aIFaFJtxSEZOMeS+LRVF+jLGkM/J/x?=
 =?us-ascii?Q?bGDlEl3Ushp1tCSSE843e3X8ftGK08I+mO7mRZ6ij8fHd+O4CywVdV2l/GPE?=
 =?us-ascii?Q?GSOw/svx/Ba3Mu4YxDuAtSa3E+BestDyPLpQ7vnich7OfkrAtCP4ElWkIPak?=
 =?us-ascii?Q?jiPmK+r8CUhxMcN6iapITux6SaqzFb2Yk7EFZTV8YEvPEd8ESVR4QXmirQgW?=
 =?us-ascii?Q?PEY2F92Mrkdw2CE2pfDzLWS1p0JnZKI30Ffwq3zXTj3x7M+RuHsoOcl1Z9Cv?=
 =?us-ascii?Q?v3VY0t/9tQv4tCJoN5G8/Pu/06H7Jis6WHOuxUm5NtKheIGCBUmzXnKgXZ9l?=
 =?us-ascii?Q?Tr+y9RfgJOG5DdgvWTKETR2diGtxfNgL6u1KR528IAyfMrJ8PLTOQ6rh8I+n?=
 =?us-ascii?Q?+SteP8uaxXD/Q/r7TKoOI5aM5n2ho3BOdfM3CTUXBMSeVFjl8FZk4oJi8wAD?=
 =?us-ascii?Q?ImMHwWjqJBD14i2HlxZSAdkKbTzPUjs3rS10CQCc3X/rGRZJ518ItpJ7fMip?=
 =?us-ascii?Q?ivZ+YmtsvOSk7IqIYbur1FmqPqlTCWqGifM3IQDL0dPJi2C/tzzp4JccBuIw?=
 =?us-ascii?Q?rYWkIq5jkeGxUi9Ey5fAU8JoGj6kzWJFaSEQFSA2ve6M/c09FEsXiA7EAbQh?=
 =?us-ascii?Q?0qV8unHFpCwGOXwGZblI3rwmqW7yRRkrrYj2+3bnjoJANumedpYt2joXx0v8?=
 =?us-ascii?Q?Le+YPgCVYQsNXyG3NKH2guRKdND8+OAYm1//1gF3luFX22coiSqt1n60sBik?=
 =?us-ascii?Q?AYQFUNWHIoTZsIl8T33eIWSpMPXN4wvSUY0z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8EcqTp85zV743orKbN9/aqDkRnm6fpwNuM7jwWyc+xeabHi+OKDnUMLLakhb?=
 =?us-ascii?Q?aDBWi7hEnkRo0wk7Bs7+mpRDDk53Rau0H/vFjYdeuQv84CFtqhPex9+7KVQ4?=
 =?us-ascii?Q?DmJQzI2tVVxxkURg5BzLZRpu59OT8+BvdQPbnFWkAQBRl1aWkqad3ueqP/2W?=
 =?us-ascii?Q?a094iNJsSsVcs27/60DiwWgxf7S/kBm/aiR18PtHZKqpSQEhS75XiyCHsA1P?=
 =?us-ascii?Q?zCZWNUQF3yRovQG92KLX7y3wJXFtYuDg0Zt0vwCS0YeiKs+2anZedSRGhvIl?=
 =?us-ascii?Q?xgjschjBsyRD/Df7BlmSS+dzBTzFaUuMs5LpOmzrnJ3+ZR55rLXxXfo9D0+c?=
 =?us-ascii?Q?yBUUOaU9SnzI0XkAOrmOLqBbbqRntmrP3fASbwwJzJ1TNWwwV3iNJancfoKD?=
 =?us-ascii?Q?dJ/tSK+Q77PXv63BbEor9+hjJ701QepulAnzE3966TtCcpPZCSOdJiE667Wf?=
 =?us-ascii?Q?xDH8AIJtXd9F7BwxDzeJ0wqgbY2gdUISBSsLz9VffDpJNLcxu86kwu6bBPHR?=
 =?us-ascii?Q?VmlSeFqKJHDdc3CztBhR45YpwsN/s/Wn/tRwIGW/tKMBv4gk3WRfJUt/QPX3?=
 =?us-ascii?Q?+EB2IqcSENV/A8h1w4loM5CzpjlSo2U7Lm5f88kprgS3Ke+PMswPa2x9V8Op?=
 =?us-ascii?Q?TExouQFbMSqFdB7xKTzSMRtVYLe80kxFfY45Hbfo8LRnCL3Q4tIP0ML1CSfo?=
 =?us-ascii?Q?VUqyyV1Tji4g1ssDiHdgquZVMTuvxcK0ZVVMmJIxgnNIucNzNPz/4SozUQM5?=
 =?us-ascii?Q?tf63xqoOMySkX5Ly9TXnBDVRMogvycoP9UM4d8y33rs9aNKlhJEcCPmq86uU?=
 =?us-ascii?Q?D2/uYdbyz+cuDEZAlGXOJuFWOlFtW5DPIrxdlwxk/bxEm/MFbIJus2hm2fpV?=
 =?us-ascii?Q?bZkAGbnLQoTCaGrXktsZezE6HLHC6Rq5LdOnUPd1Lfp+U1YVZeMQc/ywXNeM?=
 =?us-ascii?Q?2LikS+vo5+rsXGTYMXDCMi8qb3DxE6f+yCs5J8SL9+PlL9amItfHPQ1XuFqT?=
 =?us-ascii?Q?AzMUG8UPBiMmZ9uq+cgl8uNna88pVKZdBGq9TwBlG4Hc/pM9vXPdsoIsWXTl?=
 =?us-ascii?Q?0+qlhTR69juMg5DmBmiL/xs8e0l39rhdjMtKP8eCKxy+2NvHLXrMkS8loIMf?=
 =?us-ascii?Q?TWAU3DnHHZRSVfjw57inSGHwUEsUTiJPnWW17BaMzTqxI/6HxfPEUd15ZZeD?=
 =?us-ascii?Q?aX3uUZhvTzva4CFjwCo8V5zcdf0djl3uZCXAHtwroLUuoV0VovCSlEIellxm?=
 =?us-ascii?Q?ArRzszWPIE7LYCjtwLe5RzOONIIt3jgSGCZJQjPpg75EcY0R0o+C+yWN/5A0?=
 =?us-ascii?Q?z6KGUG+uNZNqu0tjWmQIyqfhW5UXR67Eg1FpL5OcXQifzyk9OgMByFfTIq5d?=
 =?us-ascii?Q?8FxEJhrM5Ycmuki8ziClyPhk9OpQptZapiGNZxMt9zDh3vykGIcxHvpOddJI?=
 =?us-ascii?Q?O9YOpOMc1iGAk71OXw4F5HFXXybcbfGuTmJSWJpC0yc6jpDDxa+07aFLgi3/?=
 =?us-ascii?Q?uov/nEZLZLY2f5O01SF7oXOYagJOnO0Wn/UP4Vy3Ot+b50Aa8nvKDery6dVM?=
 =?us-ascii?Q?5qo519JFKFsv+pF/SZjjaftnpcQjKuqVKdjJhqt3vOs4xsxWVBVJ79QpUgJu?=
 =?us-ascii?Q?JCJlrqylC7Dt0HMqeEx0kYaIDAq5SVJVsxhFXnk5e8PB/+FiPOgCls3ndpY2?=
 =?us-ascii?Q?OFV9rsdIvjzBGV0QKcYKApUHLAC64VOfpoVrTAYNOz7UE4hTHDPK6H8tZdG8?=
 =?us-ascii?Q?mp04GcgSMs1dG05dnxV+yOut0ajLnUbQjojiels901YGZgbSP75u?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb02cf59-93cb-4723-4b5e-08de4f9247c4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 15:18:02.4573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48gaZB1u3NufZjjXh8s7Xl/DSWYviP5pE7e8ixfkfzKC3XprDdL3mhzOqeO41+c4eroqupTopZMCLcpWXOmFLK2w0taJR6M7SA0lYq6pU93uir1kxaE6TcUB5v6BhiJL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6914

Hi Geert,

Gentle ping on this patch.

Thanks,
Tommaso


On Thu, Nov 20, 2025 at 12:51:39PM +0100, Tommaso Merciai wrote:
> Enable I3C on RZ/G3E SMARC SoM.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - Dropped overlay and moved I3C support (pure bus mode) directly to the
>    rzg3e-smarc-som.dtsi as suggested by Wolfram Sang.
>  - Removed alias as suggested by Wolfram Sang.
> 
>  arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> index 7faa44510d98..f05b9fec05f0 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -122,6 +122,14 @@ raa215300: pmic@12 {
>  	};
>  };
>  
> +&i3c {
> +	pinctrl-0 = <&i3c_pins>;
> +	pinctrl-names = "default";
> +	i2c-scl-hz = <400000>;
> +	i3c-scl-hz = <12500000>;
> +	status = "okay";
> +};
> +
>  &mdio0 {
>  	phy0: ethernet-phy@7 {
>  		compatible = "ethernet-phy-id0022.1640",
> @@ -219,6 +227,12 @@ i2c2_pins: i2c {
>  			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
>  	};
>  
> +	i3c_pins: i3c {
> +		pinmux = <RZG3E_PORT_PINMUX(2, 0, 2)>, /* I3C0_SCL */
> +			 <RZG3E_PORT_PINMUX(2, 1, 2)>; /* I3C0_SDA */
> +		drive-push-pull;
> +	};
> +
>  	rtc_irq_pin: rtc-irq {
>  		pins = "PS1";
>  		bias-pull-up;
> -- 
> 2.43.0
>




