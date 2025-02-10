Return-Path: <linux-renesas-soc+bounces-12998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D7FA2EF23
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D99AC3A1AAB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153F12744C;
	Mon, 10 Feb 2025 14:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lr4Y3vfk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C9D2C9A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 14:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196197; cv=fail; b=hOUqT2IUiI1faZuSkeUF2KZpDNZ8TO/32Y7EiyE6hQFBpnd+9BJWkfEh2HTJ0ky7w34q7PZKGz4ExYGFl6OwCTvzQidiqoSMa01+lWCn6HyRIl2TOwmaQniU9m09lfbEnXIPsFJeF6J+njjvL174BQyeKzFwEiLAtIQEZT9OPRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196197; c=relaxed/simple;
	bh=LenGDnCaXj/XB0mQ3aWWBDtO59wv5EhXVjlT5C0se88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WUAeu5xZDdHOnfq//vEyG7TIJ6UEzH2NT1Rlz5dAgPUQvmX/t5IuZg5glBY4O+Osv9Z35JABeCWhHXEzafbhN2C/M5SYidJSg1M7MJ6oEVBykWzT0noiWKLPfubdXEhhWzg0GtfOeeX2Qn55R3ZgSAD+tZ5Qrr5FojZOoaMPukw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lr4Y3vfk; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjqnpnQiNRLxN1gUtnbfGe+YMd/gbvk0ZUNdb2viPqU87EY3mlHPaQDlK1bcSNBDWC0r/gXxVFdAHWPceH6m4/KVoqbQBMBpMDumKdd2P6jSRsdMmTzusl0H5WPe7xuuN4HsrJRP/LHn8bVhaXNsILJsM+gkHXONb3YjBJTd8fHWubVk2F2kTONlwDCiJ9g5f0Y9HVcy1oIs1NNXfJalBfbJZDXspE8H1tbxdK3W2NeqYt4drToXoFP8icNXz85J+KjxZXE5ZD5iipApNeT5N9XOpB78Qy+tw1f5GMU2/3lNDqKQvKZViOKTe5jRY+sYxfs2mLSETbP9/Cjn+heL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2k2PtBPmcMNvWoQlwvexDwidomd2FsjeYn8njNgnBQs=;
 b=Dl197QDx4LdYsh7CyyeFsPuMQGqyNLDGwZIBts09ud5QqlunFdZdOlexgJyaCc7wc327ikHLehwQ+lx7RdeU4m9YzPoW06OY8glFCgd91PIVXfrwAkOLfWGbdnt9yTxLkDjcGbRYQTlOcQhzd9Xsin5d2dkoG5F3CLIznvYlyutxPgV1VmIajdLRsOL8HYmrFYFZEXp2bpN3QcYDwU68UHLwOMZVoFu4lwAyZyWIBOw0YHA5lweS6A4zO83WuyppRN6NyUbui3r9KUScYGY8R2hPPho34rd8tRLxvlGWK22mkv35jvgIaAQrI90Emq6nqdzWijMsvUiHxTtuPB9JKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2k2PtBPmcMNvWoQlwvexDwidomd2FsjeYn8njNgnBQs=;
 b=lr4Y3vfkax/tToLIYeDn2gnwgtaQsIx7cT79HeSv+BN7fI+gEjuEPp/1jMINLvZMzNLqKa+SYTdF7XsBwkIIEsAmz5HhwuURh7KDCrU7kws0mNr0z/yF14yHikbo3cgv55LeFfQOk8KGUgpxrcEp1Hnbd07EAMzIpon/sgy9hpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TYCPR01MB10292.jpnprd01.prod.outlook.com (2603:1096:400:1e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 14:03:10 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 14:03:10 +0000
Date: Mon, 10 Feb 2025 15:02:57 +0100
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/14] dt-bindings: soc: Document the Renesas RZ/T2H
 Evaluation board for the R9A09G077 SoC
Message-ID: <Z6oG2vPy0miE2GZw@superbuilder>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-4-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdWLdLiyQUuO-Xox5zQ9waTqWYk474yYL4qqfyfkvxFs6Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWLdLiyQUuO-Xox5zQ9waTqWYk474yYL4qqfyfkvxFs6Q@mail.gmail.com>
X-ClientProxiedBy: PA7P264CA0472.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3dc::27) To TYCPR01MB11492.jpnprd01.prod.outlook.com
 (2603:1096:400:37e::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11492:EE_|TYCPR01MB10292:EE_
X-MS-Office365-Filtering-Correlation-Id: dd2d3069-912d-4cc7-6bd0-08dd49dba690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t4XGGZb4uXWoQ+kIpvB2m9rd05QuoVrEhoA53d0is6JMGZpVwtKzwriCT2RJ?=
 =?us-ascii?Q?UhizWK3tf4iPLWuzmjeUcz4P4yY5O1X6xRxogsClxXxnpuvS6k8+1kV9EMVG?=
 =?us-ascii?Q?0w9PkcKPRDEzl3qhcaMAmiYO489AKRieTbKN+xBc/rVQSPT3Ua80sOgFCG6g?=
 =?us-ascii?Q?LoD61EFAlSo335clvWcT18zn5d+HS9CdM0rPxFDyHDECu6MOzLT8Z/Gh2433?=
 =?us-ascii?Q?/jlGeAYA/f1KtWKgDBnCBeCXxnDWuvA9oe99Ouvs3zOUO81zcM/uFAYjPaTm?=
 =?us-ascii?Q?T4BnyDdYJkEZod5fVhv0ozJ2s+p7NNpS6SmKXaX1MqwmAmth88t3KfRniHI+?=
 =?us-ascii?Q?qZQrNMs+P+eFQFQ9PCXMus9rH+58iAB9YGWDBarLiQNYXteZVajysu4tL/nI?=
 =?us-ascii?Q?GGYGFlfMueOmacmx+r2++dxNynb5nGl5GVTDjRpjIbGGcWbUbQp93WGZNJ/g?=
 =?us-ascii?Q?ll5vvVJtSdLEAbvPQo8X1vU1BMmINrlYvGojVFGbBAGXSf4IEScjdLQgooI+?=
 =?us-ascii?Q?GT0i86MraO6OBR6GOSq8U936mOi4DUJa7B+S64lMcYZ717AE02XZJW/J0hsE?=
 =?us-ascii?Q?zbtRBQhmBbsMSUcyVApqCNkf+QEPotRuHhw33QS2J4tbZ9gZEqnAywCU2KBL?=
 =?us-ascii?Q?kg0jN7e/tKMLvYKbfAiRxeIWLBNUGE6eEY4hEqMVUZJdudsJgM5d3f3AnmjI?=
 =?us-ascii?Q?PQrzmBLdX/1X7G32XizVgtQ4S89R6biNbJdw219KxqbVGGqt/WSZq0TJHxsn?=
 =?us-ascii?Q?fW+NfWCyG3z/jS3GdHbjN678gRw0Us+xS1liGRzNhwxC/MY30R7z6Z6qAb8N?=
 =?us-ascii?Q?WBCkgyIE/wfunFDTB4Y74rVEi0T8ZrEFHFMYe36LBTRy6DK70j+nHpSG9V4p?=
 =?us-ascii?Q?tBt0GNNmvpv3ZgMO+VFjJpjbX1mYr8z4lTzw2d15MuBz6d3t17q+G4gl7aQK?=
 =?us-ascii?Q?wBR8xlnl7fLs/8NEGfTCRupWQilTCeKgUiRRz/IrNc7gEIb5XyCgi4PS+VkC?=
 =?us-ascii?Q?RgERXkZjrGoY8GZbiOKJptEMZ+AP6mjdB7N/E+2sqzjJoT4/jDD1HHx/Kpp5?=
 =?us-ascii?Q?4/LUue/S0d+GtfFNoQZ3wWtPKsKZmgCw1Ai/CqemIitzDadKZuwKNE/wHG2D?=
 =?us-ascii?Q?W80vN6zIJA6Sxe3v4HFqR8W4yTiiZgVoZDv4kUX5DY6z64UdC5e8smOVQ1ne?=
 =?us-ascii?Q?ioOMb0UWayvD2nM/9rXJ8Az4PbgU9TEv7rLxgFx56pxmPz+yhT/ookrc9Axo?=
 =?us-ascii?Q?rn9YLee01Eudz2B5s+xkNKQnKDNKBZ0g87M+9ERCOo/O2tM1DpYS4HLdlSpT?=
 =?us-ascii?Q?TFQuMOm7EKXchoraHtnhrdIhTHk/jQqaInpCV0+2rlb5MN5uDsa9BkoD4fS2?=
 =?us-ascii?Q?BBpCHRNIV67zmTbdaDTUb4rVemB2CmO8gvkn8eN6vfBulifzh7CVyfKZNdOS?=
 =?us-ascii?Q?5HXMwnktYO+laUcbvt8O+rtY1RqGIyEd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QyeATOZUI9gCpoczJLr5C73Ii76k63MwFvFidz/S5QgOa/Ux1xYv5ZFywY8C?=
 =?us-ascii?Q?S65s8tG8mc8GYg7LzEu1UWCvEis6Jt1j5cPQrwlFhaqOWkn6OW/q0t3QugsG?=
 =?us-ascii?Q?Q7wLz//yDp8B7OKOaS2q4mryh06S7L5sDldwaQpknHIYeqn7xFQajnr0WZ+x?=
 =?us-ascii?Q?dlJ4nYjRj9YllSolzSXv1+Keval0SdlG62532apC2/nJmYNFSuwS/tDx91Ct?=
 =?us-ascii?Q?4KfxarMlPhUX0QD273rlrr4rZvQhkCUKe7PHHDsUEk6C6PikboXHRDvT3gA4?=
 =?us-ascii?Q?mCc8RAAaJ4725sqk7qc7jud5aCyAN1MOK4J1kG5YnhT++20UKcqrNDW5HpwN?=
 =?us-ascii?Q?ZCVif2G7KOYEr+KtmGDujUoF+4CwTuFT3zfljb7UVFYvRmVbSHhPSo9PhCh8?=
 =?us-ascii?Q?hsq24dyLNaAu72KzPYR/1sAbe3PHuFMdJ+7GuQ8uM4Uzl3YZs6i5RYo+l1fd?=
 =?us-ascii?Q?z8WXeUOldfo0U0UzgRQMJkitG2R409m7vMfFIerSvnCmJDRm7db2wQR296NH?=
 =?us-ascii?Q?3Ew28utMBZ5sAGvzob42RDRhQA3WrI/TkL3g9UliNWNh+dUY+wjTZRq3AfkC?=
 =?us-ascii?Q?5WPuYq8Xu14CeGv/dZVBQsnwP6UxY3P3wg/LxFTxisJYrbdAHwBLy4m58hYa?=
 =?us-ascii?Q?DpJMkP685hT/LKM7Xh5yaoUFYeqpve9dFNCNHNNHYO5LM9GQjRNeLCcTCJio?=
 =?us-ascii?Q?jsJCr8lCKSgmOiOmj1SskX3TZVJY4Iymxo6zwCnLSlGZsDdSPTTK+zVS95q1?=
 =?us-ascii?Q?wXJs0hive+ENIBLZON0WODZLUhbm5zym/geC68LGAkpNvcQKFznqYk6NoGLe?=
 =?us-ascii?Q?vA5f0ZzTaEsl/49/J4cd+fKRq9lRJYopXd4IcNSyRnw8q8EtxKN62jn4aRQk?=
 =?us-ascii?Q?bFaLaWC2gVXMNAifahXw/1ZT+53P7kUXwsvfTEBs6D9KWrT7mvr+IPysP0Tf?=
 =?us-ascii?Q?MKxqjzpylgjY8MlAvpwaaGH1t9ANIhfACspYQxWhhFoC5QtqSv+/0ySM3cxn?=
 =?us-ascii?Q?Qv5CAu+Vq4tNuyn18EM87GONawygSVZJ+2I4PDz88hCSqcX6Coev9cRbmwLj?=
 =?us-ascii?Q?HJ7t6MRhC/3xWILhfmdFXH8xmoUNTJmhahh4i1+iUbvWM7nVf2/9EnlTBME0?=
 =?us-ascii?Q?KGhMDAq5B28Y6p1hgVyjJFb35x19dz13sCcHi2Z9e8T9T2fvLIwInYayZLgU?=
 =?us-ascii?Q?ivMCdKssFVg3Wm+I7Lpx5Oim7iqQIz24d8H9ZADs778n//oNBYwxfu56z9Wz?=
 =?us-ascii?Q?qKk9O9V6lXaHU7BdtOkd7ems2je9zuMboyUHPY7Dc7Zi98kk+FuqOzuH4/IG?=
 =?us-ascii?Q?GWeVteRZTNdOoWpxqZpd6Y/HkITQ95PquQhBJS0d7+fNvvPSIYOmtHhZNj6O?=
 =?us-ascii?Q?5dKHENLZeWiNSR8k6iBNppzjk8W5cEgS9i5qCtrILfhsjOkSxWWjx9/UY6ZI?=
 =?us-ascii?Q?4odjuCyfQESdOqDP3qL1YC+QfGMFnIx3pjHZHdUccyTV8idkgX/zUtnDuyHs?=
 =?us-ascii?Q?wlgf2h4SU51+ahCZLsu/iV7hiVAIf3CQOyadda2HyQzGyDmLyG4MvZHiVbnJ?=
 =?us-ascii?Q?sQUQndAiyPWOdNEUQAcLhp/2nfk7nGjSh/4sfEIKBnvkNBuMbtqQhDcT9qp1?=
 =?us-ascii?Q?p2YshAU0lcQjEYWBdR+s8NA=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2d3069-912d-4cc7-6bd0-08dd49dba690
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 14:03:10.3705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64Zw0yPhyDh7Gzl8M2zkJ/5vsPa+0fOh2TV+Era3l0bJjgIuOTrkFJk9wj2rKxShSug6Rktx0oP22UCCStsLi+3r8O4SacQhTqCmENrscCwtxRpfc2jW/Q1p0ELfe8zR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10292

On Mon, Feb 10, 2025 at 02:21:05PM +0100, Geert Uytterhoeven wrote:
> Hi Thierry,
> 
> Thanks for your patch!
> 
> On Wed, 29 Jan 2025 at 17:52, Thierry Bultel
> <thierry.bultel.yh@bp.renesas.com> wrote:
> > Add the RZ/T2H Evaluation board (r9a9g077m44-dev) in documentation.
> 
> This is the Evaluation Board Kit for RZ/T2H, "RZ/T2H-EVKIT" aka "rzt2hevb"?

Yes. AFAIK there is no other one as of today.

> 
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> 
> > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > @@ -537,6 +537,8 @@ properties:
> >
> >        - description: RZ/T2H (R9A09G077)
> >          items:
> > +          - enum:
> > +            - renesas,r9a9g077m44-dev # RZ/T2H Evaluation Board
> 
> Perhaps "renesas,rzt2hevb" or "renesas,rzt2h-evb"?

We would lose the 'm44' variant information by doing so,
is that acceptable ?
But anyway this should rather match the dts file name
that comes in a later patch (named: r9a09g077m44-rzt2h-evk.dts)

So what about 'r9a09g077m44-rzt2h-evk' here instead ?


> 
> >            - enum:
> >              - renesas,r9a09g077 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52
> >              - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
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

