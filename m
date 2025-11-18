Return-Path: <linux-renesas-soc+bounces-24752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 36812C6BD7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 23:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B6A75356216
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 22:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738B02FC890;
	Tue, 18 Nov 2025 22:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MpLiCr1P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162402EA743;
	Tue, 18 Nov 2025 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763504417; cv=fail; b=cAqCD3LDHLchsi3SP0oAzMamVaCasiIZVJtIsGnlmce1/21NlSdvh2FMmkeMqt089n5RxH+xFJMc/EfuWJQ0OL3hOUIJK32Cril217VCXTeyVLf4iVJaPiuCOuag6zk6LTYM0HTf8u0BIV4rN2t9SBgzYnGrGG5xhLKVYPlMwVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763504417; c=relaxed/simple;
	bh=1gnlPnoFc5UFb+b6dhVoymnItpdjxSw4QrUA0zHPWao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kcz96wWBexWrRWHdnz1Zlu3cgKS2puDrd+DPIoHA/qHodv0UnMLiOgGAdMBpNSs3Qb/aByu1XSjR9Or3OEZKkYFnGAw8fmlvyPxNbO6Ti1/kPRUCH1+2EsodyEFZODpyKzKseCPHJkNHkyu10WFsb0ObiD7bC+E6wrIKVFC5jRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MpLiCr1P; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYajprXoxCRHfu16LiKD+lPhHi5sxzvBRhaC4AByXVbS2mbeGrRB1uHeSQVPm5M7UmcIa6U1Oy6WVVM6pFKLGmuQL7astixuD7dgto8BWdZUdUBv3qRjntnLkqxMbU27BPi0wdv32dvv67fKcg5pJts3D/46ucdDnoq5QveTc2rc7lOmcL4gnGXWLF7qSD9zHaYXfknk5S8VzlVe7TD9uD8YrETA5VhYZdzFwFhEQRafGKdJ0Eqac7zD4F4Q2V2nSqYvy1yVHeBFMxW6Zxl+OD2AAXhcjyJzffYj2KvTgpdHf80JPYGbp8JwD/OXn4VUsUDWDKjEMpwHOe0Mj9d4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK8EbGayc9VD5bjvp8UT3aMbhqigQFSRTIZADn/E7B0=;
 b=YTTBMtRWQ9sMSks29G8h8wySWB1er4mznpSCRiUfijYYnPQ9QP5KowSR/19xUcMv3rTlvrtgAHCLbkqAfD4yfOGPdkYfE0iVTiaCXH6yFeGIQ/7PnwEMHDHFkqR8W8a3ASqvBnkKmmRT4gabRU98xtUt9pd3mV/PtsHvhA9GuEeJoE1+WnNAR5oqjelVOYw1mkf4FYO9Io9MB40luX0/f0lzrfppnbb7ggKxAu4Gdrlk/Nnm/xPOyZoii4z6bjk8ItxxMAP8nxePEqZkkm25aOxdlwvcnW9KUoJcYS9PHj3K8EwgUX5KZpbRi57uqdDJFDVujvuVjU+dvP/M7vYIxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iK8EbGayc9VD5bjvp8UT3aMbhqigQFSRTIZADn/E7B0=;
 b=MpLiCr1Pgh/tLWiE6hOpkUwo8Ggk0qv4uEDgM+hEeQJd2wxZp5JEpXhrOVfdtjSjK8gEK1Xm7d11gW6tcp0lFcAHTEBF2QDzIGPc4WOjZ8LzPtu6Litlfl1tJNCOZMRF+jSRPdBg2dsGNpNq7PNcfMwmbp83c5sx2XX1u7y4KRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB7132.jpnprd01.prod.outlook.com (2603:1096:604:11a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 22:20:09 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 22:20:09 +0000
Date: Tue, 18 Nov 2025 23:19:53 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: rzg3e-smarc-som: Add I3C support
Message-ID: <aRzxCY-Z59tMKro2@tom-desktop>
References: <cover.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
 <96c503737c4e913dd3a934fdbbb4545e44455a68.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
 <aRyf_4U9DGRmssWd@shikoro>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRyf_4U9DGRmssWd@shikoro>
X-ClientProxiedBy: FR0P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::16) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: ae09e9bc-8bf4-4404-962e-08de26f0a27a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0EvMru+5PRiHfKa4n+bjXrd3OrkS066DjBb2yaebW7iBNT/AZM+N22Z+fwXW?=
 =?us-ascii?Q?XuCe+uXPPSOy4QceLYv8oW3BdkROQZLSlknIrPYI9U7VpVadHtDubstDYINB?=
 =?us-ascii?Q?uz0TAL0ulf2BYvF6OKTfLZ4LFLga2/Z1/cOyEFPcafyz7q5cdmI0UyoVILRq?=
 =?us-ascii?Q?evAAEy4GJrqI6uVlaJb3ZXfml8zDgzfustHJYwx6uSHWG1+3CQQcPdUk/4YV?=
 =?us-ascii?Q?ygLbKQ4rPIv22uG1ydp0jXG8XC9K3x0HzxKvhvWEyi1OM1VI/j0CKnnGN9mL?=
 =?us-ascii?Q?sIzBLgIQWzFMzT1Do15fceUoe8qZaq6eSne5X9zauB4EAly0yD5Ci6U8SSll?=
 =?us-ascii?Q?4k4nodMFo+gmLGEeu04zlEnekiCRFDpf0R7yqSFuR/j65P0Ig3lH4nZ34KU/?=
 =?us-ascii?Q?m3wRA2UxiCBmw1RSk7P/koia7iK2w7g5U6KcCeFNKo7I9xTNFLbevvYupctv?=
 =?us-ascii?Q?IRUVRS9o3/rY5Ju+J6YtWLybcgh9l2f/y6wzC38USpfB1o7MS1955bx0a8wp?=
 =?us-ascii?Q?37Q8GnFsxN/nSZSD1Y64lQYlMxyK+8AL2Ja8SGYBZZb94w2M7Pqca1jSGIEI?=
 =?us-ascii?Q?ydvLpkJHoh94P+LkPXZPNZMlDUkExtesdcc82Hvmfk9jSxTovwprTQW/EDtB?=
 =?us-ascii?Q?pK/wstcK90zk6YQkuPZdtPXI2ng4W7g3GpMrIblo3faHLRnEgGAZYD2B4W2m?=
 =?us-ascii?Q?lJLM71T2CsUqzKbTqNMyO64iL7bL8K7S028u+jmOVFdsk//htcwDYhruip5S?=
 =?us-ascii?Q?O/jK3vfjo7ueOp4w+FeA5twGHIZU7xmAU9FdVhQCBV+MGXxO5uuYV1DQjcjF?=
 =?us-ascii?Q?6spL9NMEwr80fPX8THEVJGFvbl9MuSuhqaN/ZMpnMbnzkIr/gQbH3YmOPkNt?=
 =?us-ascii?Q?qTTRU6iW9PyN52jzSpl5Api0woFSEXm6t/cJiDwaedQ1sKg44rIA0e4DqJq2?=
 =?us-ascii?Q?8VNHQCcKYZQcWk7Y71kP+vnk8wiKHatOAne4F6oYhP6YgigASEhhgXsBS7YU?=
 =?us-ascii?Q?6Rb93Sg0+zlcT3Elu99puJNkXIkhZHQyxLAVOQQkx0d+NAbml2oXmcSjtAM0?=
 =?us-ascii?Q?jn3chG4m0XdgsiGiW0Xr677ezsm7ULJWkgOrUin7O6b8gFdER6aM00HkaeYj?=
 =?us-ascii?Q?IEGHMd5+t68UgQPD1WLOfUslqJf8mafHXbzAesM8cIatMnUF6HAQ+xPPaOh8?=
 =?us-ascii?Q?LjzSeDrBetT63vtyJYQc9pPP/Dzw4pYTka55oMP4+TRAZ6EXBD+NWKKg9lv1?=
 =?us-ascii?Q?H6YFHqIAjvbSZRxmoeHZQDAX1GXASPo7g7y0+yYpTv24GjJD6gIeQ/Q/ZsSA?=
 =?us-ascii?Q?99/NOS3V39GhSG13UGkZGAf1KrZjMBGWXuVzsJvqdjyOS/neY5u+auJCTBZh?=
 =?us-ascii?Q?1plqLOdndw4ZsWxVTPfVhSYSMo8E/MQ7VkJqfgrhMgE+i322JUbNRJBrsey4?=
 =?us-ascii?Q?TH1fOcIe/WdcJ9qXd3bbes2jIWbRvqyxHtTo3T2jyYDiEPUaXEJpQ7YtUtg3?=
 =?us-ascii?Q?BjT6xJKQulfK548uKHgGLd4+ZipUeaE9BVoq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?stFpBqNoosysW+x5RhAbceCtUF11mU8Lsqsd3f0Pjmc7ZAplWJe+4GuN5J1P?=
 =?us-ascii?Q?NPTbJ1zknqKM/zekmBmj0L4l+BHOpaOKG8JBNOdqWSrv4pqg9DvH02l6H22h?=
 =?us-ascii?Q?obK5yhneF1rISxmjNw4BSvR/7RO3vRzH6Z7edwz2gHAGtQYlKA0gin7Kguui?=
 =?us-ascii?Q?GGpjS1SS6XXEJ5FX6tuP3K26kdZ+mqdosnYXLDGkmpW2DueVnitlbtr4O8L+?=
 =?us-ascii?Q?BskCbOXhLhsikqEr0SBJBdvzwR3zNQkpxwSTkuA78poDcNwOCC7G9Sw/w0OA?=
 =?us-ascii?Q?R1yMtjbhmRtd6hOYYRffqDi8mZhWJDowgJDJw9ER90mjLYG7cNbaxmbI1N3/?=
 =?us-ascii?Q?5xTxPIoHJG38AZtpyPj/gtfSA4Zv+JjnWARY3JBl4c43N4yhpMqGpe/9cexj?=
 =?us-ascii?Q?EUk1jJCcFEbPNwZ2/LJ4U7bNdO87q8K6WQDnMFkTxHdE5FguqflZXvlOleK9?=
 =?us-ascii?Q?MC79gJ0PDppYRzk+YXAXZZ63WtqQSDjgoinUvmM7YtJQs7Ga48uTyx6R53Ar?=
 =?us-ascii?Q?V8FqF/PQXd8rjJ3k3qtqw8R4alnHaqMWSIYFgZMDbo3x/xA3Qeg4DabC/KRg?=
 =?us-ascii?Q?pInJxOXfFrU837l3vwxEycf1xb6JsOuadOPzrIc14rSb7nFYfa0iqTxXuSrw?=
 =?us-ascii?Q?+pOvDD5/eFibs4l9W7KZevOpixQqN3YqPN5EPrPZqTW4fB85KwMXAeVYLR9V?=
 =?us-ascii?Q?NCT8o7H1Bj8hYHxdcmH4RFGCDm523Pb/m6WWmYux24kLgd9onuf1JQoNhNbn?=
 =?us-ascii?Q?0ODY5ZfrIQnoBe7KBeoxedihNdfx60SrRiCWshFVj5AEvwDNMlhzVWTsimQ6?=
 =?us-ascii?Q?mqUvAR1XSB8+Mh2lbAikC0RcJ5EDRdPfH6VZ3TXVsxC+p9AgEe4P5YLUWudL?=
 =?us-ascii?Q?09mbef+7DO2uzqls49Gg8gnIP4HiNhyyvoMKnm/m1A+6XOzHr/icbZfQTc8B?=
 =?us-ascii?Q?TRs/SCaP0pPxtjcTLBgP1KEzPmzc56te+FTxVR9sHBWcBl7tB8SZsWkTk4w6?=
 =?us-ascii?Q?gA19nLEjB6s6xnZeqa+eWtSwfMOnA0UPdZUNa/+hm06h+hoY4Fvbd2UZPQjv?=
 =?us-ascii?Q?9Goj/ywHNBokiSydo50w/1B+XcIX7VgRvsbyvRBzXhm8Jc+A9CyjsiJo96AQ?=
 =?us-ascii?Q?GNhAyUbJ9G9jECgSGLX85GYeWXrtFH6BKDj1hjH4eGx4SoU0Wh4nhX8pmu+L?=
 =?us-ascii?Q?SV546tjlLdcmZj7V570rofDY4t3P32iQMT8sLjdsTvah3QeEInI9NlzhNaat?=
 =?us-ascii?Q?w2wGkvl+tZqaJLqZ3ccAiRhEf/ACZuu8Ev6J2Tr/ntooccCGQ2V/YLTC/efI?=
 =?us-ascii?Q?F/ZaBcmnCymX6WTBim8HR0aUrut0yBULBzbVpvb6aEDiqnpgijhKVAaHbBkk?=
 =?us-ascii?Q?3Sd0+Ibgmh/85iiEHg7yq512fCX2BjMyZnxKvpfRgkDte7OtK8h9GK1qFzre?=
 =?us-ascii?Q?JV1IFVzss57zmRd9bIDtM68Z522rdLtWaGtTXcjGBmfrGYttVEnnQL+/HTqI?=
 =?us-ascii?Q?ezEKFr8quA/NkSqUS0TU00vKh1/4pFrp+hM4fOz870pwP6zsy6VH/nIe8GVh?=
 =?us-ascii?Q?SG9MLi+EbIzPslkWS8xCmK9wb5Klo+2j3QYbmcdpXLFdwumvA4AB67eoMPN9?=
 =?us-ascii?Q?fXJ/YFFHktikCx/04qfpkrY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae09e9bc-8bf4-4404-962e-08de26f0a27a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 22:20:09.4432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abmijuCrtE81cjtMKS8MtatsbLN1TzW3CM+51U9clKTqiB7YLbC0NGrgXcGVJPL6BqSwxrhOVbM/KbeAoxi2N7eCsDJMk7I80clT8s421w5O7jt3GIY05EMnv6ARzOVW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7132

Hi Wolfram,
Thank you for your review!

On Tue, Nov 18, 2025 at 05:34:07PM +0100, Wolfram Sang wrote:
> Hi Tommaso,
> 
> > @@ -29,6 +29,7 @@ aliases {
> >  		ethernet0 = &eth0;
> >  		ethernet1 = &eth1;
> >  		i2c2 = &i2c2;
> > +		i2c9 = &i3c;
> 
> Hmmm, I am quite sure the i3c bus is not named i2c9 in the datasheets?
> I'd suggest to drop this line.
> 
> Rest LGTM.

Ack. Will drop this in v2.

> 
> Happy hacking,
> 
>    Wolfram
> 

Thanks & Regards,
Tommaso


