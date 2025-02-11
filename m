Return-Path: <linux-renesas-soc+bounces-13042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4126A30941
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 11:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 188941888400
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 10:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AD61F4604;
	Tue, 11 Feb 2025 10:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rskd3+eU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.125.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4844F1F4603
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271510; cv=fail; b=dgoH+kr3WRXqoLMd68SGKBfFPeb5bZecVjuxcmpCRQ03zSPQTfpgv7BPUJxaHBaJPp3IR4zJsyNohSOvnjNoEg6Ae9O72bmKzaw+n8y8uh8z9ey/1cZDC6TVMWRTC0Fn+Jqos26OdO0ejG/BvLRl0X1WrvoVAr5RBQ9cHyNGBnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271510; c=relaxed/simple;
	bh=gtEL1fxeocX78T3HX7fP4xZuAwaxFxhEmgK1UZG/co4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MdKvKdRPXRiXOkypj9/Sa2p+LfoNAx/rTLM/uk8cz/ezs8JU7/E2qDMU4pey+O8jqPiT5nV6FnuyuISER+jdrrhXvJFnANfgLK0B/espc/rByVur0SyC5kelURtQmcxOjkY003kdP11vhCiG8O6/b+uZiTr/JPZ6zvhc6wSZino=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rskd3+eU; arc=fail smtp.client-ip=52.101.125.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aqcazo/0o5mKqYHrgIxGZwE+6I40kuTlJeDj8hROqju0u6/Cs5sZK1oZLBLegMvGGMFklv/Zu6+WWfUHRNBwNb+3eiuQb/PXiZRHRMLlUPaaJpbCLKW6ek96k1/BSRd93983pj6zMGxIRSqSjw48BJcNSlbGnvAVk35Ze4VuetonaLmrTS+KqL7AlvgfX4BmOa1Q1qoVdBWoJXZL231vSRW3glBvIOL/DstKK1xxArc+krywhH8zvOWsNtp1cTSWRFgGG+Jhi0/vA967Sw0K3ZShxJEPKuh+o1Z/licPrpxVKH3fuyHIa1shcv0ur3Y1CwDVPbKnrq6mgVCTAWcVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svWfnbbVau0Dfu+jUjrfwAdY3OrxQE1PI2J+f0k5qAc=;
 b=TLYh3g7CQUDkvvtIBqXgI9wN65GwYQjsPyzkeZ5MHvc4mosiLr37+mXwO90gz3pULshNwTPUqVb2PLQap+EM46waUzIjrMNCToZC3uFkDwBdH1L7SEgP2GWVVDdgAzVNSze636EbBls8//IUDGMoVWKAxGzM4hFhyoIKoYPE/NXxxDQRZDOW3LEFWY9Mg2FaeaOwYVLSGLxHZHtuc6zdvoF3BccsWc87LyIxrxW10jxr50ZsYpGujY6QsCZKC/2ChyR5vAjFp5lp8SBAbHj3+BbqMz5S6mU5vL9Bud5amypAgUiK4G/7/QGc1Z3uJe1aPHezXCKLFPQncyjqKkDtwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svWfnbbVau0Dfu+jUjrfwAdY3OrxQE1PI2J+f0k5qAc=;
 b=rskd3+eU5g6SlOilO7iQQc12qhd2l3r07jlpls4PsYbe7wt/bRajkUMkwJM2q3JFjsoWs1xzRULealGgnYiCd7vkhQJD5a+MZAF9gxQ+7JshMWLNLRU2BcU1YfiD8KUdxgkP5uYUlaqNSIJkRj5Cq0ad25EDtRbkfGCgpKdglUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by OS0PR01MB5569.jpnprd01.prod.outlook.com (2603:1096:604:bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 10:58:23 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 10:58:23 +0000
Date: Tue, 11 Feb 2025 11:58:09 +0100
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/14] serial: sh-sci: Introduced function pointers
Message-ID: <Z6stNMTldzILRhBK@superbuilder>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-10-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVD1dLP53V_zOhxpqazDdPDVafJ6iohY8u6WPQrmYH5Sw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVD1dLP53V_zOhxpqazDdPDVafJ6iohY8u6WPQrmYH5Sw@mail.gmail.com>
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To TYCPR01MB11492.jpnprd01.prod.outlook.com
 (2603:1096:400:37e::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11492:EE_|OS0PR01MB5569:EE_
X-MS-Office365-Filtering-Correlation-Id: da486a8c-71a1-409d-9edb-08dd4a8b00ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UOsTU+A1mYdtgqKosM9xS/9CXcWqRmUMB/2HceIn8Do0qwGkkTGWFFEkBzrP?=
 =?us-ascii?Q?BkEXTa0Z2XTNiyqB+3VSPCREScHojwxqsTT1+qzv6wArEjGR7n6x7NfOI+WN?=
 =?us-ascii?Q?TsaugGDJYDhW3e57oS6w4sKcwGktArrOMmGTF4xyczjHJ+2xA7SDdMVgGXgZ?=
 =?us-ascii?Q?onzheIyZtcVM+2VKerOKELokcXJ0PGUpewTCzKhLMzT7QIuwR9rIYUOZnJ4r?=
 =?us-ascii?Q?K7ZB6crU+15r3Lhso1jvf8medvqJfwbvQ0Yz7S3m7nE4O0S1f8dFgxwFzPy9?=
 =?us-ascii?Q?I+eCmx/QM7TUSapGMA6c8CSg0DQxoencr8YbxfC1oJxIpDbCKWZ4IEYris4P?=
 =?us-ascii?Q?k4Baf4IPj+Ua0yzBZWYXK47iINuqfOue8CC0MjyS3OwSkYmokEuOGpyV74bC?=
 =?us-ascii?Q?dA3E1a0Q+NZTRqC/QMv8Ju0S68oObKTKP7Pgo0l+6ksI6EoiTRmE7sqdRmlp?=
 =?us-ascii?Q?vzsb8e2eqYjrtcJg9i6pDdgXQu0fome756tKhlyp9v/JNyI5oCUVXQW8IRol?=
 =?us-ascii?Q?SlLZisjuyDp1ZrmYXQ0p5mAcbjGhgdE32wp4AYYVpMbefZLwNvoZhzBV1JM+?=
 =?us-ascii?Q?98oFjo6RnaAzjmpaDODWwkmhRY8CqLJTj5iqVZkTxP+EUxqDgJdjnCGXs9mt?=
 =?us-ascii?Q?26z8+jQe+cf6nbpPsG7EpltsM4hgaBQAtQr6AYxQg2wzULWcchZtIHbcfvC1?=
 =?us-ascii?Q?GBPATP7N1O2uvT9wevJJRXha3qNrCj/6zrgHv+uKxhYX6CXI8SbYVXTSAqa0?=
 =?us-ascii?Q?Jw19mf4gQTmCChrDaI/iTQDCsMZbsIPtGlC6QiNBA8R18QkpwTiac9QI45+g?=
 =?us-ascii?Q?+CBxD/VByNicsGkzUpSrl0LPpIp3eLdcrwi58HUOiMt1JaLxlSCFq7JtveGs?=
 =?us-ascii?Q?Ffrur7O83n3VJN2Y5IiUvxbj8TTSCzZqVgsTs+9YJWEhUXkUmxiL9bt6yger?=
 =?us-ascii?Q?xjMiylq10q51iLouEdo21yZODO4/X8PmExeNJ/mRfvwVzHcvDNz/mfSSBarN?=
 =?us-ascii?Q?szx/tIRCKB9Di47Aqw4FtsXUOe7N3EOQuorIMOLnNX73aFk9zKOMqJb358oM?=
 =?us-ascii?Q?nD4f8CkCq0lQplgDFWO8DKj+6KvCRoYlciYkl8yHxqL/Sbrk4Vg3a8Tnha5l?=
 =?us-ascii?Q?ZBs+D9xBL3+IkOAzaNKA7UhOx8I4riRvZwCGM/2zpzRprPwQU4z1nt/oGyF2?=
 =?us-ascii?Q?kGIvAdfNuLslQoyqaoZDCCKjmzmS92zgXG8KoDtiPKh5Spfyy1taFQd0oAhD?=
 =?us-ascii?Q?jR3UOylgz+OivDcxR+CcvmVOV6l0a0aVWw31kYMrls7/rQk7rTmiHmPNYOy+?=
 =?us-ascii?Q?ZpZ1jIvx0zZNxaef6doI6ruAat22Sotg+zvZghn6kwtAxbMUruL4+9HjgjRJ?=
 =?us-ascii?Q?ecy2p2Xk75zRmwYAxygRoIBUQYkQ0IPtwWVspl+E4KexaA3Q87A2tiw+XpB2?=
 =?us-ascii?Q?W3n40M56hTl7PG5bBgls/zWWVPQlKCua?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rnueEWVrEk5HukwLr3scTgPhx7yLiMNSGuPonvja0Gp2qg4sFpSl1nnHpSjG?=
 =?us-ascii?Q?2P6bH1uMqsjWxuNaBJ2WeiHSdhn4BAkdcPrBF28E5D2trZDx8Q/ZLnmELUBT?=
 =?us-ascii?Q?eKRYjTC/WVc9UJoKYcE5SLahKXJq+VEI+2HqB3UyPZukNitjV2pgZYXyn+Fb?=
 =?us-ascii?Q?yO8I2MKAtMibtX4E3dexISFS7LHfOmI/RbdavpvmoiEi/1z+WFHo/JGj5rpN?=
 =?us-ascii?Q?8w76BAZFDWVIMv3LSSV+6VjWwfxI/kWd9+WMtqrLtSVemwEXNniVJESV98Ry?=
 =?us-ascii?Q?ta2UWoWDRzFiM8FXUIkJaMSPdEYPzClAr52rL9/f89DZFqsD40OXTsKBH3SR?=
 =?us-ascii?Q?KBtDDmw6xd5/kTfYaHYjbI9gAfRDez+tU6JOHjkIaYytFPnB0GyCUhg6hctY?=
 =?us-ascii?Q?QuMWqWam9Ks/qzorOzv191KrfzUnmXlQmX3TRf2GtYcPLNluhtr8wcitrxvk?=
 =?us-ascii?Q?0Ki0eIaXZSLXESMN6vC21776hhROZPt11j2sFWzEtAvW2Csakf/EPOIj4MDI?=
 =?us-ascii?Q?FflgymsZY6qCRXXsTimK8al+eg7U2Sks1vMZke/aJXFZlqvHh6OvxZXtnqD2?=
 =?us-ascii?Q?R9egbldGwUUNdO/bcFDTrUnah8GzSLtylpWmyQRrBvdGdUw/FIXpNscwj6xR?=
 =?us-ascii?Q?yVjAwwvPwb8j7IBfqSOTFxj2nA3IQOOMh78ZMPlIFoO7EQv4jNR4FbjwI81L?=
 =?us-ascii?Q?Zz9rxNfJfVMyLWmeW4+i7nQF/7hsvLqETfqmpTked0LiXF1OuXOKjAHP1gYE?=
 =?us-ascii?Q?y+3NPOxPKQSjoHWY8PDuW+HKVDXrccT4Mbdee+a4n1H1JwlhRRS0cnNOsCn2?=
 =?us-ascii?Q?0qYUJFgkQ9V64PJNh77129f1TQs9SU781xuu6cbuR/Y+rtw+Jewquqln3G44?=
 =?us-ascii?Q?3pef0XDMiOwrGWmpQE97NayW6L1m6fZRl86COokZ7M11/QiaQIpyz187h+fC?=
 =?us-ascii?Q?rZKCLPLDUufGmy1oIrRsRxSDEyX49edd2QJRHQlM8RzC/G57DJ3TOXT76wKu?=
 =?us-ascii?Q?zVXMs2E21IVI/oQYyJWGpMF8QlRhEcJDzbjM1BBrQP2eqlVr2PCI/JjncxbB?=
 =?us-ascii?Q?t3522ZcZkyjDeWIFwBdcHjRNvjmHqKv++mGwz40aqYAGNhz/gv6HRWnu2JV/?=
 =?us-ascii?Q?2ZNN9m8emPjhaBYxotEGspeAoWjlcqEfHEIGpTeWwbaVVr41IsLDd96DAQbt?=
 =?us-ascii?Q?9ZUR2CcsQcShq0EM+v5aCy6mzbI7NG4mU+NLdpJhAyV1FqDdznTVxyiFHjyD?=
 =?us-ascii?Q?ni4FRJawvXinnLMDiL5CPcgdQEnfHdQxCvC3BlEYxw/NIfouvzXUjlxR6j9e?=
 =?us-ascii?Q?VMuUaLsw22vukvzzn8+HFqtXbIKfpnSg449hdBGTsvUSGtgf7mMznpo+luyV?=
 =?us-ascii?Q?lRIwNxuDl3flzBk8ATJSziK9P1n0GtHj+ymsszW3+lieZU/z0xJt9M+UIgAB?=
 =?us-ascii?Q?+H8RxR9evCxZWlTrF3EE2qlp1UNIxhbjyko/mzH8LXyYs2JK8b6aBT1zx/DF?=
 =?us-ascii?Q?wvIbjihpdvvirlVS2OcCZ7NvASWfL+uISpButbHGQBfcT6L2Cmopaa2oV72t?=
 =?us-ascii?Q?Hk7n2jnobXIHOH8ZzxILjjmu1+GUI5AZd8+SpPqFnWhTNvaeVAoJdheM38YY?=
 =?us-ascii?Q?fjn/ZyNy/P6/ConX/ACbAVw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da486a8c-71a1-409d-9edb-08dd4a8b00ed
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 10:58:23.4205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4r71U/fMWNGi5yXnvjNLHTbkDqOBBliPkun17wpQWQ4cIWKD7ya/0fRYH14VjYdYndgYUC4jJ5wgFrP9AJj9HSGW1N7BuaxX2JauuSJJKacnNrBaDv4Esj+tESqEstPt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5569

On Mon, Feb 10, 2025 at 03:45:02PM +0100, Geert Uytterhoeven wrote:
> Hi Thierry,
> 

Hi Geert,

> On Wed, 29 Jan 2025 at 18:03, Thierry Bultel
> <thierry.bultel.yh@bp.renesas.com> wrote:
> > The aim here is to prepare support for new sci controllers like
> > the T2H/RSCI whose registers are too much different for being
> > handled in common code.
> >
> > This named serial controller also has 32 bits register,
> > so some return types had to be changed.
> >
> > The needed generic functions are no longer static, with prototypes
> > defined in sh-sci-common.h so that they can be used from specific
> > implementation in a separate file, to keep this driver as little
> > changed as possible.
> >
> > For doing so, a set of 'ops' is added to struct sci_port.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> 
> Thanks for your patch!
> 
> I can't say I am super-enthusiastic about this approach.
> The SCI variant in RZ/T2 seems to differ a lot from the already
> supported SCI, SCIF, SCIFA, SCIFB, and HSCIF variants. The latter
> are very similar, but usually have just more features/registers, and
> further differ in a few different register offsets and bit locations.
> If you compare the RZ/T2 SCI block diagram with the SH7751 SCI block
> diagram (or even the R-Car SCIF block diagram), the most striking
> similarity is that both have a baud rate generator that can divide
> Pclk by 1, 4, 16, or 64 ;-)
> So perhaps you're better off adding a completely new driver?
> 

The origin of this work is the non-mainline 'rz-sci.c' from renesas BSP,
which is a actually separate driver, but that we considered 'similar enough'
(a lot of duplicated lines) to be integrated in sh-sci with some work.

The number of places where to add specific code for the new port type 
were however a concern in terms of non-regression tests and future
evolutions.
So the idea was basically to change it once in the most possible modular
way, so that coming features and/or bug fixes keep specific to rzsci.

I am looking forward to getting more minds about that approach, which
seemed the less intrusive, keeping as much code in common as possible.

> What do other people think?
> Thanks!
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

