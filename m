Return-Path: <linux-renesas-soc+bounces-16852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0121FAB12FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 297C81BC5A45
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 12:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3FB27A925;
	Fri,  9 May 2025 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnB0scH0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BC3269AFB;
	Fri,  9 May 2025 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792459; cv=fail; b=IO2pRxZXRIVT7shBLnG5CSMxCEyXV9zLtfWvqUtKfXqu8RzJZlCDY26rKqAl7FO0E5tcd74EkXJbF+Pw0Uh3Y5PM1CeLDr5PoQ5X0OQocAzJF2HC24cXPjsa7EIBs1H9hnW5vO62hX5YHybF2m+U2FGoEWVfyyavpPt8zvWS/mY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792459; c=relaxed/simple;
	bh=cUyzXh2VxL/SjS9ZZDKjB1sck1sejjPguK9ynnlY65Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fqH2DLLv2d0ddNoescwZer9qthurSYXgwDFAsT2IPAltKPveXQFj/NT8om/xUJEarEht7BD5XB/Nh4/A+YYE98GT0gr3t4uy1FzL+4DpqefzuGruBuEifqbyPRTqQG2oGB0i2/7nINFRCsuj72b7zSXzyx8wPQbuIfkjEDbVxGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UnB0scH0; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746792458; x=1778328458;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cUyzXh2VxL/SjS9ZZDKjB1sck1sejjPguK9ynnlY65Q=;
  b=UnB0scH0VM2+fQ7FrpqEPwlbZZiHy5cgJCYKzPo9Fv5+7ZEe9QfRliEC
   uS1JbRJqU/tNASAIBh/LY8OpqjhbLiMrVyW4P833sv873ertKmw5WOfrg
   zzce3HYo3JibM0OeZqMZR0Q49ODqBp4YogE9u4HKAGLj+6j6yB4/Cr0A4
   gbv2JqeYMorC6voc/wHpamx2AbuoNPS/O00/HN+SwFkVmFrjxugTJX3xU
   hfnwgNtl+8Q+LGIwXO2i3YpXqwRmgxOkU0ILPUJyEUDyuwPTp6HUoCfcR
   v0cMX9Y0AeRzsab9OmV53lO4xzkeDpV3lfLGxIkXDy3/BWv7K8xsM16ui
   w==;
X-CSE-ConnectionGUID: WAg1PPWiRSGTUbqRr1Qh0A==
X-CSE-MsgGUID: Pj+XgofwQpqP2bSFe9h6/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48767855"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="48767855"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 05:07:37 -0700
X-CSE-ConnectionGUID: MadSq/VVROq0xIxoQgusZg==
X-CSE-MsgGUID: o48Lioy8TUmg4mhyQDJ2bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="141819947"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 05:07:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 05:07:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 05:07:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 05:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKq/m9PeBgJcU8VoNKQldIRoedipSc5yswAapGDjFXlc1eR/y2fzag746QxxVi8JaG0/hu0fNqnKZwjaMtiy/9r/5Xyo155ATSX80231dFsKK4ieslnVtgT0erK6ANpXSpxyOMHiuvEfAfwgyk9VhMVEXnnWBUBlJr6wUa4i2VBcES+O3LxLp+4aJn0aWWRWvdFWGWNdAGD5/2e+EABAPmYrVUeJBV3zpDressDyLb31HCQpxsKI9jNiVDMlXWkchpnc/SlJ/GXkmiZbY5Q2w122iCV5V51QEa07jD5dTjxtZx90GSGwM4quC14/O8sKEY4gbYrzqQqWOcqdRdN2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8aO9/xT7GRJ7gEDntAGA6brGePl0TMiU5W4g9JHh8Q=;
 b=JDIETHLIWTfzGHkf5jn4RVhvKatu848EmAF1eAGjeG6OajZCdOOMm1VyYcZ8kALeQHs89tlyDQBgirFH49DMBWfYNOm9Sceg/QBvCzZ5Qpp1s3O7AQXR0+9UsENaWgxDt/JS9gkLrB0lrkfs/47hXwBwMOZ3YZIB9U5gbbP6qzOeRjL52kOq/MnHQJ+B/b/bmrn7hLzqe6/C8M37pAKdACQtZI0j210rQPxrHCXyhVsE1Gwn8AHppzS/A6Nxg+4TYHF/pxe/J9feBNXs4aRDc6ITdeBv1/UShdgf0B4iEeHWAm4ewKv4NUQUU8PePPeQyu+Lv1VRO9HgkCsjCP6i8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by DS0PR11MB8720.namprd11.prod.outlook.com (2603:10b6:8:1aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 12:07:20 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Fri, 9 May 2025
 12:07:19 +0000
Date: Fri, 9 May 2025 20:07:09 +0800
From: Philip Li <philip.li@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
CC: kernel test robot <lkp@intel.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g047: Add XSPI node
Message-ID: <aB3v7bxTe2OOAR9l@rli9-mobl>
References: <20250508183109.137721-2-biju.das.jz@bp.renesas.com>
 <202505091649.PuAhqb0T-lkp@intel.com>
 <TYCPR01MB113323FCFB291EFA56EBA09E0868AA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB113323FCFB291EFA56EBA09E0868AA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|DS0PR11MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c31c4c8-4866-40a8-6955-08dd8ef20c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GnnBQfjS7AyoTJItopmAcowHTzXR4QvKbdRySLhWh5fTZ1KLC81BHoyxY4Vt?=
 =?us-ascii?Q?uaqW2oJctGIJAlIe9jbK6ctH0Os5FgAsGHcFrIZf091cr+5Yb52S9VIe3FrN?=
 =?us-ascii?Q?4dhq23GHjAy19T6ICA0S9YeKT+R3a0MNR9IyT67Us0azdvy4XNj4HX55igPD?=
 =?us-ascii?Q?Ts5QauugLdG93YjBZS0QXyitBkJGkzuIA9QpLYpPLnLBvP7x1QI3wZoI+EXL?=
 =?us-ascii?Q?QLvGO4ZBKpqB4Y98vsTVse6B0WzC/RlnZEEW1EunzpLyUGt4p3sJkG//f5bY?=
 =?us-ascii?Q?gRCFoKQHNZ9MuUydBIvrzhtkOP9zUUos26bx+Z2ijds5PlZWVCSF0e0ojDlt?=
 =?us-ascii?Q?lobU02g7Uiy3+5dkLEAg7Wi/v3UP6Q35wVC9YTr0zCB7ww1eHU7o6mb24emi?=
 =?us-ascii?Q?hXvF06BkoJETNP1gY+gQHtP2KYsjgbmfpMdY0mq3Ka1fDhv41v7Rv9HVjB6H?=
 =?us-ascii?Q?OiYqNZRePAv6PDILWmxaQDTi35a90doXK+D7FgetQ0STdL4/6GJwOHsTMNn7?=
 =?us-ascii?Q?Do1GSBLdXX6vxQFP0hjn9nYgzhX1KFyYzuTNc70GxroEIjrqDtN6Ta6cHYBm?=
 =?us-ascii?Q?1sQyYECwY/wFWF4AVLtXWMSherV9Vsi3Fy87fahp3A22as43a4Z4vuFxcHRW?=
 =?us-ascii?Q?odxnoG0BukEy3j9Rr2PAdsmXS/Q2QZnvqyK5Shx9ODe/K2nTGxWzSGLEIYtL?=
 =?us-ascii?Q?aOseDWUspMF2MkA9jCKn1WUDrIrbPYSbB+eLV3dgxF3yQEGwNXm/u6cDvkwo?=
 =?us-ascii?Q?o1MsjaRhhX2zkdPhHpfaSJn2AMRRTVIN628QImtP4dXNG9KSUC8bEYzy/jGm?=
 =?us-ascii?Q?2PiYMI/fpnzVUmnw7Ou7ACDLBYxgct/BAzzYJWK4iaMs60szacx/jfarkUEq?=
 =?us-ascii?Q?ELECstY3FJnm8Hirp5hhFr2T9yKrRN3wOIEdWxBw8FHPKou4jVlDj4N0bwYQ?=
 =?us-ascii?Q?8q5AhWgM7kZSmPUGhsC73oks59OeFoxYek/XoUc2VoOiN2wpzft1o8Fma/Ls?=
 =?us-ascii?Q?x5SLt24FClV9/Gt72VWQXCcs0wsDhJjN0EABkk7KqStfuf/ku2+Mb7qtESmc?=
 =?us-ascii?Q?6gGTMEXrTWJysTlF5xQJNnt0DSzKFQjLltdqWjThv1kjbCRi7Y0u2SI6eDmw?=
 =?us-ascii?Q?leoiVxXzgjkR7qlWq5AhL18vY6IHJwp4FXodRS+4Jm7ilATuW0M1IouuKbJl?=
 =?us-ascii?Q?hfX/t7qbW5mfk551HjYoosewXRtjPUbu6UtYpC12cR5GujBphtuVgzjBIgOT?=
 =?us-ascii?Q?ucCXO0qr2KngNHyITquwIjbH1DpzJkCZEbt287jLo7qrw8CkKBtLCY752Mz0?=
 =?us-ascii?Q?HrCGn+t55I70djXMHfI1nn7hMzbT6oAxvRH713Hpa1nWO28bEWDcck8E8Uxx?=
 =?us-ascii?Q?BPXldX6Zctnd9yRbTHQlCE+ZCRV2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JN4rFdM4bpFBHJkh2D60FiBsNTXXSaKmWCiNMiKE9vt6GgAcnLKJI1qImBQN?=
 =?us-ascii?Q?akPfUDSGtPQw3BOaFcgoTr+yEIp+GrCAaMSdb2cVzwmNpoYYWHRmi1NiaNGE?=
 =?us-ascii?Q?UWz6LhZI6M+V/7o2HwQV+75TdJgo6/SJyX07QMZVqUj/6aRNQVUlBQwVnGf3?=
 =?us-ascii?Q?D2eAIBlIhoZafO+pW9Fa47p2j4+Nl8f69F0iOD2DkxE4GvMDRRPYx7dH/UHc?=
 =?us-ascii?Q?I2O/Qve1AxVRBWiQsDgntkR5FXHxNPRxlAzojbOBdOgXGdoP45tBGnbruv27?=
 =?us-ascii?Q?7w4ye/rGxtIXaKcbKVu24yMP2XqNV4cDpZ9BAyVdD3cciAZZhU7eectBjxuY?=
 =?us-ascii?Q?IF/tWZo3b1D9Vc5EJGwarFzmH/vwKgh9zDpZFWYiDgBVLx2JbM29CNkB/Vek?=
 =?us-ascii?Q?mZyIrCmii41fzZMAEXN0byJ1nbX9AgiHtNEdhvYrZRu00Bff8Kgg8IvZUgUJ?=
 =?us-ascii?Q?mFuz0JF6edh1NXDodHbC2TW/1TcSygTAOYpXroHLWQbmjh5v2QQkCe5qFl8u?=
 =?us-ascii?Q?e16DmOMpyGMaYrQ/NfuiNX2pe1YalO+eL/ONXfl3GRFH0XR4P4Zk5h1u8Cb1?=
 =?us-ascii?Q?X0bAvY0MWMuULtFtG719ClEqt+uTqqV4Bc8mcvKk0elQwY+3UCLSbbIdv85T?=
 =?us-ascii?Q?phUc5mXkrxxl5ipe2HqprvYYu4a25nUqNqiulPBKIar+eU5MMfzr3vfasTfS?=
 =?us-ascii?Q?08csqF65cFHZ80pTF3IhBz1KjGqZX+07aUESvc0EW1nJi2ckBuKZcZ1C8s8a?=
 =?us-ascii?Q?GZl0LrVE/V9mBnVvvMVi/lO2n/qdCJiMSK/G1aMFDHmFi2g+nQaVzmx4dKKE?=
 =?us-ascii?Q?PsU75PL+mFDTT5yz/6wgAndjdnE1uGSvUcfT5s/2+7GyWS//nfG3egdBPGTR?=
 =?us-ascii?Q?mfBoNx/Lj7rhQed3sF2xUkTgnZKG7hvIbbl054fpAkyZs7loyicyNSZJc0Ga?=
 =?us-ascii?Q?6pI0fZB6OtPRDfztXdBvuJFBmLXYKWqLgKo20cFShqyvytVDJgRNYRbXItRK?=
 =?us-ascii?Q?Nau+bcaF0cUQUxy6aesJBEVBjRyAMxEw7f2V6VhG9QLfmMZiOGSt1wQJUYMY?=
 =?us-ascii?Q?pGlCX0d/m6yZujlywgtrKuRFO6qKIMNNg/bS+8jx1JNa6l16MsM324Sv6zQ0?=
 =?us-ascii?Q?4wjdOtk47iRIwsaswByq0mLWFtoYnCiFrNrbmhguJxrj0eV9hYmC34cYe9si?=
 =?us-ascii?Q?4MFfonzxCjHcF9QPl3mlz3Wo+4OOqZ/wT9gO07FLUmUrivdbda7kIZ+N5m2O?=
 =?us-ascii?Q?V+df5nNYWmFBNG+2JWLfUjFJyxXqFLUyVXQVOh/qiSfJ9QHvZ8Y4QwdvBunE?=
 =?us-ascii?Q?TyDu2yfH7Bfxm4D3c9GV3aOV450tZ/G2yFEmmkJ1mmSGvy6vc4dcGMe2KYDy?=
 =?us-ascii?Q?sV+Ca6g0PFXFBvu78FNpdYkBpmAy7W5Zuejomb3U+RxqvJwxZRrxMQBzqmxl?=
 =?us-ascii?Q?4xmkBcJJb4uwzahdq0LL7xXo/ktl5VEtFAKjc/6xIA0Hbnl1uqbGoizEbrNY?=
 =?us-ascii?Q?VUmOFt2p889i6e2FX4aR6h/NELmq0jq09//JfuxR+IztecBdn7OcHu1rc6si?=
 =?us-ascii?Q?ds7Uw2VBk+V03u4f4UBEaD2qjC6sI1fxhUhNsV/Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c31c4c8-4866-40a8-6955-08dd8ef20c07
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 12:07:19.5000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhuuP6dxsSY6Mf2ZSzE5twa6sOr9MNOqlGYIhhOkG0uOEKP8p0NLmuKz4sjI8xMIO8+EJnF2PTkb/HC5L5Khtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8720
X-OriginatorOrg: intel.com

On Fri, May 09, 2025 at 08:57:32AM +0000, Biju Das wrote:
> Hi kernel test robot,
> 
> > -----Original Message-----
> > From: kernel test robot <lkp@intel.com>
> > Sent: 09 May 2025 09:43
> > To: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven <geert+renesas@glider.be>; Magnus Damm
> > <magnus.damm@gmail.com>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk@kernel.org>; Conor
> > Dooley <conor+dt@kernel.org>
> > Cc: oe-kbuild-all@lists.linux.dev; Biju Das <biju.das.jz@bp.renesas.com>; linux-renesas-
> > soc@vger.kernel.org; devicetree@vger.kernel.org; Prabhakar Mahadev Lad <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g047: Add XSPI node
> > 
> > Hi Biju,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on geert-renesas-devel/next] [also build test ERROR on linus/master v6.15-rc5
> > next-20250508] [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in https://git-scm.com/docs/git-
> > format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/arm64-dts-renesas-r9a09g047-Add-XSPI-
> > node/20250509-023503
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
> > patch link:    https://lore.kernel.org/r/20250508183109.137721-2-biju.das.jz%40bp.renesas.com
> > patch subject: [PATCH 1/2] arm64: dts: renesas: r9a09g047: Add XSPI node
> > config: arm64-randconfig-001-20250509 (https://download.01.org/0day-
> > ci/archive/20250509/202505091649.PuAhqb0T-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 7.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-
> > ci/archive/20250509/202505091649.PuAhqb0T-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of the same
> > patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > | https://lore.kernel.org/oe-kbuild-all/202505091649.PuAhqb0T-lkp@intel.
> > | com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> Error: arch/arm64/boot/dts/renesas/r9a09g047.dtsi:293.14-15 syntax
> > >> error
> >    FATAL ERROR: Unable to parse input tree
> 
> This patch has dependency on [1]

Got it, thanks for info. Sorry for the false positive that the bot currently
can't handle the dependency nicely for such case. I will consider to not report
out this type of dtcheck issue directly if not on next or mainline (to align
with other dtcheck issue).

> 
> [1] https://lore.kernel.org/all/CAMuHMdWhTirA+WYxNxHwAgaH6RDfWbhKaji22T_hhiJYUkFjKw@mail.gmail.com/
> 
> Cheers,
> Biju
> 

