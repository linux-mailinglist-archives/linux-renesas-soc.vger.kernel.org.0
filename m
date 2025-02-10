Return-Path: <linux-renesas-soc+bounces-12992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E20A2EE6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17D863AB37D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 13:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA45236A69;
	Mon, 10 Feb 2025 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TIalau4g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D1C2309A6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739194356; cv=fail; b=HJxLYihiwyI7eib6epHOdnRQ+AqBQduMET3nDUGHU0aIdF70ZENJ+DtdVLKxNMv57q3wMhY58PK70JqqW7RBhL39yoWy1OxMLolp0DNfh6uUrU3Ape/pVjkaprm1CkRlO+i8zhc2XcVw8/+e4HmQctwPr6/+dqlUYx63VMMeeq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739194356; c=relaxed/simple;
	bh=lxu7bm0ujrmaf4e0h+yE6BNcbkTwR2g6GbKMT6RolWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gN+Z7H/LVweFXtc1SfuvZEzjY1Pr5pCoGgtYWV3xpJ108+O/cUO/OuGj5f1bWPNdTNt44cFCB+5x35240lDqBc1XnAt+QXJpdhxZB9YMaRkQrF+CARmAub4T/OUg0Ag0nUtLJMNA0ccYYmomAxG3fSEO9gccSj4aC1fUyV+9UHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TIalau4g; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3LJ1Ofshw8Jdo/EfFC6TiZhHO7y6HHH/kWzntEqN0q1UJt0ZIK6JMOWBpGi5UzWpZKAZkyzRRE/jca8al7ldWvW3xKCgXUAoWE7ZbQpg6iVYgFpfAH93YlJJeZ9AXOyAsyW2W/wvqyQNVWYUzy3+c4yGwPZiCojsORRnk4N5vHd1xErLlcGmBdl1rc639bipPZP5nYcK+8mJWnr7HsyyKFGy/02tKR0PkuVfrV8v1502sradxqGOCSf2PSK2r36RMhfFFCdAPf8rVAzBBS39iT/B2Rnm9YkKAo6EZ+6f/nsEJ0PuzTIxl+M5MJ9F08vJ38tMkj2vJ7DJHtfNig8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYp0OD2WUrhpxgo8DgJOoz1I9ytc9sHawB08TzpoTkk=;
 b=AcHrqOZ/Jt7DbboMSgvnmOAbIz98Wy/LZ/BFnBCfyCI4WZ7qYP7ipOw3i+GqqyZYKqcRUdokhAmWF8tzJmxoR4ehqyIm1Wpf+kjePoV4gDOvQZVN/aY6ierCTucrpH1OgJ5SG2Y0VJHija0Y0PUcAC1E2/lVJkMzqs4+CWg7P0oofeSckbqtOXdVvMeKphhaTWequrW4x09efTmtuUXT3mgwKCzvI55VpaIvp2cLaez1asiU/Z0zsexGoBxqmncC7W1+f4qftfS66OgssKqTNwAZWHQ5ot1cLODjHgwD+9yJWznSpomyBIXXh6kJRk0mfpWQ2z73unc8B7QgR+XTFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYp0OD2WUrhpxgo8DgJOoz1I9ytc9sHawB08TzpoTkk=;
 b=TIalau4g/Ktz662o/nd22mPI9QA11HtQuH4kzjgbF4hkfvy1nZAXwdqQ/Np1lWbqF6oXeeffMy/dGAiMRvaTWSdEvXcC1Y4KCdSiEGcMiK/Niq/zIZC2wnQFf4PIdmIml9Szxrh61vZy7HAbPrps0MFsjIT8OT1woae54AIhj1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TYRPR01MB15633.jpnprd01.prod.outlook.com (2603:1096:405:288::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 13:32:31 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 13:32:31 +0000
Date: Mon, 10 Feb 2025 14:32:18 +0100
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/14] dt-bindings: soc: Document Renesas RZ/T2H
 (R9A09G077) SoC
Message-ID: <Z6n_4g1EtMAm0jaS@superbuilder>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-2-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdU2jbSmLGORg_j8TK8Q0s3O=2fFR0KhUhucNcrw9z7U-g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU2jbSmLGORg_j8TK8Q0s3O=2fFR0KhUhucNcrw9z7U-g@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::11) To TYCPR01MB11492.jpnprd01.prod.outlook.com
 (2603:1096:400:37e::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11492:EE_|TYRPR01MB15633:EE_
X-MS-Office365-Filtering-Correlation-Id: 96aeec0e-50f2-4845-6310-08dd49d75e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BA854QB7taRgUxeMUS/ETaBv0YNHBN+2Hv4GVOe9xPjma+m/pLH4QIM7QHYX?=
 =?us-ascii?Q?egCFxumiyksywXCGCJGcxu5vAq1cUUk3jpB7NNytBteYPMna9F9Hr8wBWw7D?=
 =?us-ascii?Q?XFWZnGEcvsZYMRcqTLQ3aSLYjoaL4rSJJy0ouuYo9f7h/VWALMnl1ELGMQmI?=
 =?us-ascii?Q?2zeXEBkxaKFkTFY5SSlJSs1avcwX7zPyCd03I6KCXv0/ccBe6ncHbxCKkdkd?=
 =?us-ascii?Q?sWk2vzEeQ7K/06SAJWN+tdwsLcv/vLkC7KpNEPOJakzgVgswE+UXc6jorm65?=
 =?us-ascii?Q?wYN4K6QZsBUwppizNvKazQkC9JPbb91a9PFRlL+mUKnELLVUknRvHoL/GtiP?=
 =?us-ascii?Q?l7D9QA3zlKshswLWq/JwAJvsdlwRqXVchRk79g/0s3oJzYjw2QHyceiut7Jz?=
 =?us-ascii?Q?RA2DX3UJy+AiMSmqUujLic2Ye89HwEMqIzyvdQ5QHbrerevNhGlKf/1Isk3A?=
 =?us-ascii?Q?rbI81s+CYMNOD6PNBFcF1Mm58t/nGGpJZn38snuYDqqWzedN4OCeacDaazBx?=
 =?us-ascii?Q?fdAeQnx9+yj3lLNvQZNVJ1O1tFkSmlXx7inHeRwqznX2hSOs2eyndvNfVW19?=
 =?us-ascii?Q?scTPv/mcmtLI3ML50kE6qgLr2UmaMfG4ZynNBrjXA8hdX0ss+pUpd7RDF5s0?=
 =?us-ascii?Q?PQFb4Y9UEpRVW0ptnFvIesSQy79eIyGUPKQmlQpj58wPbq2ppoeEdo2HVRN7?=
 =?us-ascii?Q?D3dOamOrorJz5vRPDKWCzmZc6Fmp3mrpGwjpOt2drRQbzDFZOTj1yhKe1ZYS?=
 =?us-ascii?Q?Dc8xenAE6D2wKYbunsyHf7aO31oAZJtxJeuljcg3BiI3MeVcaOwDnh1j+bgU?=
 =?us-ascii?Q?QZssDDHWyZP63H5Oh+2qRK7OQ9ThHVjpjkBg4Wtcn7uax63FzdcqNgv1R84Z?=
 =?us-ascii?Q?OIjek/hHYXVc2hjruMbj7SrlElArkm1PYg0P8E3ndpBmvjcsQnNoBHwJgJvz?=
 =?us-ascii?Q?nBmm36Eg8LkEKBP42Yo3Jp4NlqnYyBrR44QJLO+0h486sLxmsBCci1QoGMJe?=
 =?us-ascii?Q?3a8Hu/3kjo/GZkKAW6r6RiMzOkZTJxwtF6Ikx/rChHq9D2KhVmOJ1C542E/c?=
 =?us-ascii?Q?mg3W4pjiUj2ih9md8w9pMFH+DSBzSc4QjlRut116icMwZuUHtFN6TDIeTgvb?=
 =?us-ascii?Q?yzP2O5kPxSQkcSgjmLuSXoKO8H9VLi/nfdXN45DEcnernCX6twWdFHIiBJml?=
 =?us-ascii?Q?uWqffkUTxFMeepBXZtz7tHsK03IreNLyhiJRv1yg5gMUcxf+AkM//TXV8V95?=
 =?us-ascii?Q?OE8C93IUiLt5p6QqK5Hu4BJyVrxyM/EL10ptlvdNHNWnziBD1Geh4NApERit?=
 =?us-ascii?Q?xtTsMJCc5l5UoWibXdeEDB941ZEkf1i0h7BgjRVvlvDQwBXxOXdPJWbFK2c3?=
 =?us-ascii?Q?aSlnrrruGgvmngdhu3RPaVOGnP6Qj9FQmDVsOwMuLBxwnQm0bw8Kl8sDXvht?=
 =?us-ascii?Q?mcWfYrqvdwdxuy9XfafKOiuz5NwRTUyU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m+6Lh4+xTOlBZhpVf6bD8j+/SkpmOyEA4nVz32syxmHGm7c9GowiA+iKHyqC?=
 =?us-ascii?Q?2jmg9mNgdkKoozzjpZsVDSfhJC7APNbA9McDe1Z9ggNPJHfsnkvqfRDx4B1K?=
 =?us-ascii?Q?KKMMpf8qmoTPlv9sXphGllBzDpShdJgOT/C66TRPdJiHGE/Fe6J8RZxt1CDt?=
 =?us-ascii?Q?XsgN+PIn+9Sfnhw/I6Wh2PBy3WsXNwyYUUs3Pjh/YDpmfymJgcNu35v46MQB?=
 =?us-ascii?Q?54bwOa1fvsKEdDV2jV4/TPw/9A8R4d2TCKps8Dxme6z+nLtaaVV6xIcXxop+?=
 =?us-ascii?Q?OW95V0LBknoIRoQM2bZGCOV+lBy37Ss6YAGQApi5QFc2az2dy4MnVV9MMuqo?=
 =?us-ascii?Q?ovFk5cy1Ci//GpOjeXAn/hMgzXJqFXvdnDCopc7iSIImq3pxxSdZxDWxafHh?=
 =?us-ascii?Q?e1xYSjfLlPWX0Dq4O6yeSgywpA2mu0A5B7moVXEiKqwvwsGN5MYmuQugRmFk?=
 =?us-ascii?Q?zgeVhxd75MR8MFzn6AJxBCbQYXi39vqC5WH1fm48GXUEY3Lc/BLzHUUiOcJq?=
 =?us-ascii?Q?ZF2AAIXZg4bpcOV4le3mhn0BHZruDDqxNKyUt2O6rp1BQlPZTtHVkiAPeC5M?=
 =?us-ascii?Q?RAAGQUjLyZ9rK88109X+50DDqX9YMujm36I+L0r9Rk4LFx6Ii/lYl25JKYgI?=
 =?us-ascii?Q?Da+kOlydW6rplkbRg2T/GYDMBhOd4uatnVkjQwWhJYscsKtvPvu9ezYdg8iE?=
 =?us-ascii?Q?aEVMPKl0d7RHVClMr+Rh06igwKbafzQL3l+T5gGWze2XEu+m7u9ehrGnLtRF?=
 =?us-ascii?Q?/IAdQxdYJ+vrQPtN7/Lj3MDppOh8fV523PdZxJaAMm24sKzXez4jRl6fUPSS?=
 =?us-ascii?Q?146Mq8fpEXMSCQBKjle+8JICw5hWVqj6+L9sn489SGaK/Da05BSaTJM9yMwy?=
 =?us-ascii?Q?VU3RxZZMcuvOn5fdw9gvNhULGGeRBASyPHkCkFqXlTMhk0UpQ6HUqqeDzz0D?=
 =?us-ascii?Q?qY4i5zENqemKx07Z6xRo6cQApbJ9Ey3WYTyfYI2Du2w9BOC4P0jNaez272fi?=
 =?us-ascii?Q?h3kD0OwhlIDsEBxY6jP/wl2MZ+49sSNXAN7XKqpPOjV7niXhdjKsosPDZMFw?=
 =?us-ascii?Q?kmXasfV8UsyDGQwoSxsMA1lP337cSpdCn87kmTI6QdXUl48IFxc3v0fmYeHm?=
 =?us-ascii?Q?/Ti1WTpPNeos5DmymFq8XhqDOBw1E8TjdX1i+lrBLXDQdzXy6oWqAqbg3GgP?=
 =?us-ascii?Q?uzTZr2Q/Iyfx+txK9XSBQSFu8qU3E5lHDIBAc3bM4K4++JPJBVFbxO1ide7M?=
 =?us-ascii?Q?YKjdRsaIWLJU1zSnKrhw0nsClpmO4na4siq+uZsfB4SOu51EDH+3i/0AYU73?=
 =?us-ascii?Q?hCJcqJP2vxgLDDspVdEZ4Xx6RMbfNdIhBacJw0wwUy8ydJw3ZS+ldf2Ouh17?=
 =?us-ascii?Q?yW5/9/YqujuTIOBF0etzbVt0lqmG+AYAjnrCnLmWbIu61RHE1HWkKQY9If9V?=
 =?us-ascii?Q?qWYKPtCRsBNyr4xcFK5usr0eOEkpzo06TKBXC554DV4FM8fx7Yhv3IsXRGG0?=
 =?us-ascii?Q?X2/E0hoIRNwWbQdwhLwweyZlG9N4vLP4bvtUeVC+aaG1Jx6NvSvNErCAiEks?=
 =?us-ascii?Q?PMdsNUtHF/wF4RslqqJW5KMbC1WrVwWEtVXMmBGeTVZexXo0+HH7CEWSlrmw?=
 =?us-ascii?Q?XCq08Ohrp6RbhMJso4pjz2E=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96aeec0e-50f2-4845-6310-08dd49d75e8e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 13:32:31.0613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOdM+aR5QeG9xTC63NKv702nzoCYEifuYzf2Aet+4JvOi5JmxMPmox5BrHPmXLjda0J+lXw90DRoeYUY7sxvO4Zz0+R2Ab+J0p4p140Mpg2wiRz7oElN6hmCzO/coAv6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15633

On Mon, Feb 10, 2025 at 01:52:44PM +0100, Geert Uytterhoeven wrote:
> Hi Thierry,
> 

Hi Geert,

> On Wed, 29 Jan 2025 at 17:51, Thierry Bultel
> <thierry.bultel.yh@bp.renesas.com> wrote:
> > Add RZ/T2H (R9A09G077) and variants in documentation.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> 
> Thanks for your patch!
> 
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
> While the part numbers match, the grouping (variant-specific + fallback).
> do not.
> 

Do you mean that this would be better ?

          - enum:
              - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
              - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dual Cortex-R52 - no security
              - renesas,r9a09g077m44 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52 - no security
          - const: renesas,r9a09g077


> > +
> >  additionalProperties: true
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

