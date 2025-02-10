Return-Path: <linux-renesas-soc+bounces-12989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFCCA2ED55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FB9D1662D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 13:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10774223717;
	Mon, 10 Feb 2025 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="K9cox7Jm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDF22206BD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739193318; cv=fail; b=hH4ShAd29ez2NGHNwJsG7ZPdi+GgETrG/n7MvzdEI63fYXEh783jbSOGQmEi/WdZ17B27U8gi8n5EXn2FWpvobQ767AYIF4j56DA+pU2/y0Z/Nmme19rPjklcsyhfKGkuLY27fcqs3AQMXBS9xui9m9no5fIrU8npsibZZS4Ato=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739193318; c=relaxed/simple;
	bh=YHxbcU7i17WtWt8s5bC6hKqgz7mQeLoaNsJTBKwpwuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZMWC5i7zc8fSXuu4FTGdcADu1Rul1cxpZZGBwwkwNGy9lPSkkyGNx0/7QtMRjXwdl/zmuMp1Usz7SOz1jpyyDHc8RdZ2qzdnkPeao2rHiesXmIORIWE85wLz5RnGRhR7AqzPoOWaCymQwKCyN68r6CZs9ti7OSDaSJ++x0pk2to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=K9cox7Jm; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdKn1NijU4kBdLFrFzf74GX+kXoOnJMD9XuVGPzUT/pNinAxLkdHUTRFvsaYQXuRTNMkut8kH4gPWOOOYP4zDXxDw5tXVjxnubEo04zYTM02lchtGjCg7OI3QuVqPX11sL1OVKnwIwXcjYmvGAG3jIvdQcKSIvc9xJ+9x4/sRXrYAHeZLOFBczG89+9PIg1drKD1VaLO25oA+oMB5ukZGldCCrfdtXfQ0O86llwnUJAkc9VJZFJI852sgW694mXKfMbaCyfbzb/Obegq7NRvKcMmyldh5TOxXQSLvhE3En8ofL481JpILknSt879SOM2E2+8hF2pLO+uq34O2Wp7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0YXj5GfJaVKhzdDTCdQ3ikslm8E7bWtPsPaklzLFlk=;
 b=Pk7E+PjVr8KfrFua/8gtNqcTsomr4KdqPefNFHFlxKV+cKebS4pavStT4XE0zSiov1Cu//UGlX9DM44Np9EZW/8vO4FFTSpvyZ1JnrCsOlKyNiw0TzAL/nUkhwouNxDygo61MedeWOuWVTwKjFwzfFNzp1CCu3jDCmC/7vKNHeK0vXjwOijFLxtUUZC/42XCUXRCT9o22QqMS+p4Gm6QgMHD7phzytaie0lU5xBUUUGZsGgaVXk01rVmX5Kw0sYHkxjhvado0Ip5QTzttPSRpcyDbv7Uvr+nE2B5LgG29DhE/oolM0mEGQxxpP5yit+WSa7+cSvJKHTEmeUs4QI7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0YXj5GfJaVKhzdDTCdQ3ikslm8E7bWtPsPaklzLFlk=;
 b=K9cox7JmAB+0310M27QdzlBQO4JK5cssdSzRs3ez4uYFsarcliPMrFqRG5DVgcxWy7iMSJreMIhwVGxfw+zsoqPoYX1qZBIxRhNqxxKXlumRsX2UwIHtxtSHGNObj8W6C51jNfWDlTNeLAXA+bgI1smwTFU6LGCtVblSjhXS33A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TY3PR01MB11986.jpnprd01.prod.outlook.com (2603:1096:400:409::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 13:15:11 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 13:15:11 +0000
Date: Mon, 10 Feb 2025 14:14:49 +0100
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/14] dt-bindings: soc: Document Renesas RZ/T2H
 (R9A09G077) SoC
Message-ID: <Z6n7yfZXS13LZMWy@superbuilder>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-2-thierry.bultel.yh@bp.renesas.com>
 <a5a6196b-a6a8-402b-9073-ac01291f7e34@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5a6196b-a6a8-402b-9073-ac01291f7e34@kernel.org>
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To TYCPR01MB11492.jpnprd01.prod.outlook.com
 (2603:1096:400:37e::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11492:EE_|TY3PR01MB11986:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a1bde4-daec-4806-353e-08dd49d4f28d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yAlaqHXrd1po8UXIEr+/VGD98DOBFGZ33CRYlrP2ykQ2I6SBEgricmW01ZRS?=
 =?us-ascii?Q?THN+5O6vyVFb03KgT1bG5gVt7ZaJCLFbUoemurCf59Aqk7uviv8SSq5AV29Y?=
 =?us-ascii?Q?Z5PhcygCx5+AS3riefH0dBLLpFINsGJ+7RdbHNS6UzCVF0KWCIseSt1wB72U?=
 =?us-ascii?Q?1rTKoBN0a9P2fpnkz11NAuD+qRO4erCAe2fdEWGV3hkdlkk8sjWvoZ2WAE4n?=
 =?us-ascii?Q?0dVkMgketNc3caRSWvP81LQrrjSQ6YG8LV/+JHg4w04fioaaNnPsf5vz2x4j?=
 =?us-ascii?Q?oySwgkw36xGj8XQThco8RGouC5e0rKL3OFoDdGz60udpaZsbNX7cDzACGZgF?=
 =?us-ascii?Q?tfh844/Soig8rEBupXyLmP81zIT44yheqmPSnBWw0cFXj4N5TTZrJmJvgzG9?=
 =?us-ascii?Q?07ho0/T10CG2UhOOT0Mz3S8KVYz6QEjJInLv0fVRtZTOaxRC5a3n8+z8KVKw?=
 =?us-ascii?Q?jwjlT2/WPEEFBhq1OrqPP+hkQQt4bDGlJOYHoGKqUg8vDUBZCA6wQd1XpnGT?=
 =?us-ascii?Q?kQzfAVSkKV0WbV8O+3hRnZf42EpvGAeS3uqFulDMRbMbhRKbMe10t9/j+dED?=
 =?us-ascii?Q?yIpf4xSLqKn/oPEEo89JlIiBG7Lpv9Jh9yZ9hu8smVcjhZ7iyushdjMZMAR5?=
 =?us-ascii?Q?JgeaECA7QrRVPxDonWT96FH4gbc3CxiP0YjPpIAkiOnNUjku0qrheOaC7kRu?=
 =?us-ascii?Q?b5G68c9eqno08INDvPXrVw/6yG82AsCnL9ka1zOH/KmUJuVrItiuzO2RrVtu?=
 =?us-ascii?Q?Co+2OTjXH1fNaSrotXJwzkHX3JhvEMS9I/gxQpDUFDrM46cRHyi0xCFvyvMV?=
 =?us-ascii?Q?Xj6sPQSDyTLr5WB/RMtnPNW8Uuw0GeNgnhdwrLFUD3cvQQ28pFJq2S1qMtnY?=
 =?us-ascii?Q?1v0XQlDsXJ76N0vAYKRPiB7k+jowqZ41E1z8ZhPzZYfFu71DbLY03je0QKjC?=
 =?us-ascii?Q?UudCRYpo6IcQzsLMJjsE0f6jhB6O3eB+whjFL5RXpaBgRmMan19bzRztWuMC?=
 =?us-ascii?Q?SuyttBs2uzqpUk6HvhRQrloRtK5soU3pJfKjHLb9S7yAlf+0joNWduM5bEBa?=
 =?us-ascii?Q?vxq1M7iUqrQcej7BZ91XT8ypXuIsA+bGLEcEBr7wj81i/r5hmtXhe8IPH+82?=
 =?us-ascii?Q?+PWRLEg/wnfBiv35xU6MF0/JxiZNS0GSKDHTwPnD2W38tieABpZUAwaM5OZb?=
 =?us-ascii?Q?AHQz8xlHB2YQkvQqtTuC6k80TE16SeV8bMVk5pppEG7Zh4CLsrI7aJzZkpaa?=
 =?us-ascii?Q?ng91h8Mx4GOmKq9wfOEqusACten4MFmzlpMG5E7xVexGPKA1N+PX5l/cIk2a?=
 =?us-ascii?Q?jRwbVDMCVbJfeivDxGakthzPiZ49DvLGmc8iDStq/G9frjApcApm2f7u2sbP?=
 =?us-ascii?Q?S0S1tet9/Tuq6nJp9cdA05wMX8svV/JQ/1a6SVQN0KOpOgxHVZLWrgvO10ws?=
 =?us-ascii?Q?7FpX+0Ebz3sQaLSK09CBLORV9QCFONze?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WugMP3sMxziTG8cHkSEbHmTHiJQ+LTtTyViWLCdJIEh6nDcwAJaDyaUXCwek?=
 =?us-ascii?Q?Lj10E2AMp/+Lz90znkvbtsH1QRrK+b3FGbksF21IADS5X5FXz7jUQsTk9bx2?=
 =?us-ascii?Q?XNXswB0++iAG5ysIOs/y05ec3rETNe6AxhQ16TGiTZekXwLvbmj3n+5KJV4X?=
 =?us-ascii?Q?/JLQpYrvwQ4xXsFGtc5MgTVLE2q3oMAjoxZduVgtVT9X92HWdUA3MVbix78e?=
 =?us-ascii?Q?YTRLd1zFlyYtUkvKTV5brPRmyZbDl5bYElD0RYnvZbOL/QgYRrSiv+Vu/Skp?=
 =?us-ascii?Q?LGzpDKb9uZ7y459cuyCpBN65LNXVcclwIkA2XEaddiBk7dmie0rCbUIivI2Y?=
 =?us-ascii?Q?V50yFjL5U5mcmF8YKzG9wlfUgLdKnaZ6dE4TuyQVu09MD7doNbBYHs1m8fMn?=
 =?us-ascii?Q?y6wq1+IwnXbRUge25bOZn/s/DFxDiqvKdNtSttm3ZmFryEjSRyHnqzEWbHEU?=
 =?us-ascii?Q?5A7SA77ZLQqIlDpC8HXBB4Kq5hOfeW1kg/qELhQn9IUIZG4zGEdJhXAf7mBw?=
 =?us-ascii?Q?6E9drkPStvadZHXwjPVOD+KxdDH/l6kdlJ3zJ52yaxsid9uYAT8ccDeYJC4L?=
 =?us-ascii?Q?yo0HvOIVKdvJTUY+oTr2g0da0DtXkKU6nIZmT2BnW43kdNYNsM9KIYID2m1O?=
 =?us-ascii?Q?rAYX2v9JWC70SwxI1G4kUsd4iRUoPPr9e276V0EGQKVVngJ+DQPhmmj9W03D?=
 =?us-ascii?Q?mLIQmwf9Wy5y7OxeR4SqzdihVOzWg0kt93eAwAL6F9wM3bpMGPqeVkms1MO4?=
 =?us-ascii?Q?k9ZnAbvmwry/Mhg89MHhDnAvExeUjmrwoB8pLgM6lUOp0Rxuj3WUNTJp+J8I?=
 =?us-ascii?Q?vKaP6ycj0eDFl1PNdrBkOcKCyZQt0eR5m00a5gIv29BHuYuBMYaThW6jEyGY?=
 =?us-ascii?Q?NVVkFi5npRKOnqL1G7aUxUqcrN2GdAm7j0g+VfTOnik1aPfAGd4XuB3jVmAc?=
 =?us-ascii?Q?SW8cTl7Gb7ItQHuhaCBSVkLABfsTbL/5rN2YGr9xwyTGDw+eQlWtAdX+R5aK?=
 =?us-ascii?Q?Q6su4z2FHPePgq19hTWUoopNmUXINaXlGDKTGaRCSNhLOu0nGFmA+y0LeNxp?=
 =?us-ascii?Q?YBR4pU8uvZS4yuSZgcgVXlFlRupND3goRXM8PXHL7pbiK8mf4qFnDprHIgXZ?=
 =?us-ascii?Q?WIk61gjWu46vWG5egkCu32MoEzAszb578VVG8rOyzkxAejhqBtfzoPZQCPkS?=
 =?us-ascii?Q?R3R+iYSilqfaQ14DggjrluB0ZLLxuMuOgbbBSUB+6VMDbcsM5N3b89agEx1W?=
 =?us-ascii?Q?aXpgSw0t84TBOteRGELX/XjT/EgkvBJr/FOMJSAhiN01XNE36RwgIEXQyiFA?=
 =?us-ascii?Q?SnLg6b0WALj3nq90m4EQbiHvCRIRfyb9wkIYy4CFq88FndBOD+U+XQnp4xwt?=
 =?us-ascii?Q?nYjCrVFVtZhqpS6TAZSBbkO53wQaPiKlC725jeccSI5OIiAlrpmfkzEubOMw?=
 =?us-ascii?Q?ZgywN6CpcCn4ffbyn6/pQli5p5LvOQhT4K3XLh6ysh36C9QHtMhbAF+Vmbpd?=
 =?us-ascii?Q?Vs1Ath+p12Zzic3dT8mAjB7wDdHg5L8c29o4k81+nvNA8uyXsYIbFbfkvX8P?=
 =?us-ascii?Q?m+AJklAGa8snfWvhSQceZrwReqKJGUsid16CEtATu5NdBJNrgRM1SRujUP6I?=
 =?us-ascii?Q?v8KhTt9XDKxv0egB5yTzJXg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a1bde4-daec-4806-353e-08dd49d4f28d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 13:15:11.0906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOoBgLFK0kYadVhk83CHyMPwNhmPLPZePs7YK514XXWB2Smv3/+3hMMxidy2MLcIDgaV1ezlJt90TGnOUfVrys3/8MX5i6EBe5ZxT6PX2vJl7NaXJ/lRHfe5JK625Q5f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11986

On Wed, Jan 29, 2025 at 07:28:58PM +0100, Krzysztof Kozlowski wrote:
> On 29/01/2025 17:37, Thierry Bultel wrote:

Hi Krzyztof,

> > Add RZ/T2H (R9A09G077) and variants in documentation.
> > 
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/soc/renesas/renesas.yaml          | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > index b7acb65bdecd..33f9e37a3d3d 100644
> > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > @@ -535,6 +535,14 @@ properties:
> >                - renesas,r9a09g057h44 # RZ/V2HP with Mali-G31 + Mali-C55 support
> >            - const: renesas,r9a09g057
> >  
> > +      - description: RZ/T2H (R9A09G077)
> > +        items:
> > +          - enum:
> > +            - renesas,r9a09g077 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52
> > +            - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
> > +            - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dual Cortex-R52 - no security
> > +            - renesas,r9a09g077m44 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52 - no security
> 
> 1. Never tested (see writing schema).
> 2. I don't quite get what this is supposed to express. There is no board
> here.

I had split the commit this way intentionally, this one documenting jsut
the SoC, and a later one documenting its evaluation board.
So you would prefer to have as single commit for SoC (and all variants)
and the evaluation board ?

Best regards
Thierry

> 
> Best regards,
> Krzysztof

