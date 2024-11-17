Return-Path: <linux-renesas-soc+bounces-10553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A49D01DF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 03:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A0CD2850A8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 02:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38937B674;
	Sun, 17 Nov 2024 02:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJP9a1Kq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C042322E;
	Sun, 17 Nov 2024 02:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731809463; cv=fail; b=or3XLBcwOBkk/mzj/vvHS5dIUb/v/axkbs4h1G7EMM0buTAvN/MH1zcsYTRSDQP5Se5wTHhkIzDtWjp0x3dvr/qPGCVZfLoAEoYgF18D4fm7VeclbqDsoT0HJCQHnjwFFJWhH9NC3PO43ikYLyqq6d+NxmSEY4b0ZQDyneTV4+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731809463; c=relaxed/simple;
	bh=YOVqplRLCirHE9xfK38lBnhKsf7xbWXu+Eln4RGkkco=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oCs4FoayCLmy3ZXkR0W6W0Fz0eSiIDrzwQ5L/28cm/Aek8TpLLpJPjMR6umRRtrFjKv72dExAUmMv8Okmwz8+y2OvM1hfwmYZLdo9tEelRLZidAPWSrFWeSSeJ475cGK/DFsLgGDsovhQGRg3U2myiUWdmjb1sDJNBWcSEA1jUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJP9a1Kq; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731809461; x=1763345461;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YOVqplRLCirHE9xfK38lBnhKsf7xbWXu+Eln4RGkkco=;
  b=DJP9a1KqsoNhTYFUIKiF86r7S0YfiP+41KEE39GTt2QEFAzNR6Zs7lg7
   PUZDV1eMbD8Bk27B9pMfRUQY3DaFDobvOYxNZmfK74om2ULB7AB7sGYQT
   fGfv4DlIxemM/jQCJd9gQULuhtC9YP7NyIZbiZl0Mevn5LcmGOUPqDLD6
   OKFkezmnX2RMdYJQLg2TZKGdD62qiZLmMemzUswmLjhPtSzJQP3Rm5+2M
   iB2FACAm2wPqjRaxsPCJY7CF/XKAHw9/xSYJ6+CRlP+9Drhjd0kFTXvbP
   1Ey9FHgNB2brIPoqydIupT+9h2J17s9EWVZjKOeHsGk0g8HSjnds7iI1i
   w==;
X-CSE-ConnectionGUID: ow0W+Dp3T32XDaD8IQPUxg==
X-CSE-MsgGUID: 8LzJ4crESuyd5kjPsrTWNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31171307"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="31171307"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 18:11:00 -0800
X-CSE-ConnectionGUID: hkJl/Bk9T6G//HrQOT1u6A==
X-CSE-MsgGUID: Y+QwqCO2To2MSj10ylxlWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="93358508"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Nov 2024 18:11:00 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 16 Nov 2024 18:10:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 16 Nov 2024 18:10:59 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 16 Nov 2024 18:10:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZEUrCLqgnc9e1DYeT4endq9Xr8XjhZAEa/i/WV+Z6fC/DcFkpuSjcufEYv9Td4J+t7LD2scUDYIr/jviNY5X7lmazHWvdqmnyZ28ThWOPa+SMt9j6aEk/U6Gtb2w/me2nTyTPHoT3AyXCsEKDMJT0FygSuDQxgPG3wc5ODZfE/Z6JG91do2JN01xN9mH4y5e4wGd75AO29Jlg/ZOef84+Vj9u38yyw0/Qx49lOLdQCV33YqFfzZQdf+g6mR1roLbgHPjkEefi0OaikACHNAT+AbiJkG0O8/HcWAPTZZz/l0BxrQc3NTj/6sGHSiqWgjEyJm+d/j/PamG9X5mlkZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yj8xQyh0ULkwjWmVXvDi1iaIk7wllww3Y7faqqYVs8A=;
 b=ogjeA0Six0+4caPvBXXblk52hcp6OSSixNxWPJ6kH0nbLVYKgvnojeGljstONBeWSuBxGDLPvnsDRC1hXAv6Jcn6MdMvRYBg9XlTtoGNLNLdju7+qkt8ZC31NXha0Hkek2Dvj6KyG0ZrQPl4ATErJXUpsSV87fGPSxnBYIs+tYAt8BWcTJXx7SN9Z+8vmx2M9kENOaXxsAdXxprXxuh/6ci1ceG1Jkxd43g7BwTEGSZVWt1gFz6HEnpyVBqxSIqxdxQdWRTvSPPJkK7VALcLFObdANsGUVb5BGdqNKmOdSpsHRshW7hr+ZOFzuVthSAHhMD3f/LUN8X1CPlonRN5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DS0PR11MB6400.namprd11.prod.outlook.com (2603:10b6:8:c7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.19; Sun, 17 Nov 2024 02:10:51 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8137.027; Sun, 17 Nov 2024
 02:10:51 +0000
Date: Sun, 17 Nov 2024 10:10:43 +0800
From: Philip Li <philip.li@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: kernel test robot <lkp@intel.com>, <linux-renesas-soc@vger.kernel.org>,
	Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Helge Deller
	<deller@gmx.de>
Subject: Re: drivers/video/fbdev/sh7760fb.c:363:31: sparse: sparse: incorrect
 type in argument 3 (different address spaces)
Message-ID: <ZzlQo3KpJ9wYn6WX@rli9-mobl>
References: <202411082014.qSQ9A5ho-lkp@intel.com>
 <66ab2ee4-bef3-4969-a14e-7804b62dca78@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <66ab2ee4-bef3-4969-a14e-7804b62dca78@infradead.org>
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DS0PR11MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: 589a6c7a-6d1d-45ea-6736-08dd06ad0eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eSr2noNatwdbOl0tBJD0tA05PRSwfr7eHKwVZ8UNLStEZwLul00mdGwvL2eE?=
 =?us-ascii?Q?U2qLTee4olK01QC1DSaiu6BWRLhPzopCpXe8KlweWU7mfwhLlDo2yII+O7fw?=
 =?us-ascii?Q?s47Hgb/4HfFGNH+vanefNNHZWaGVlHLYC6q+3Dr8ajYqaxiZC+h2vksjcDiH?=
 =?us-ascii?Q?kyFRBfocuRsu2ufKcRI0gyOGzW/wmG/+M2yRgpf1sj68FRcJ4IbVCk8ksLxY?=
 =?us-ascii?Q?hKsZT5OijzBd/z5fdaIhneYEhCbmf/+daTbCiAEE2vUG/LC3gplJRDbU2NgF?=
 =?us-ascii?Q?fpsucKn/E79xUYtM88JlLag6vKHbQNhjAd3lxa3cBR3yJD6RBItYT7IBgtMl?=
 =?us-ascii?Q?i7stHeL+XV2/G8dg4A2qrM+y9fHYdA1CbSdqIDdDl7vRSetW0I7KjZR6XlcS?=
 =?us-ascii?Q?wkVXUrEdt3CaUe1JMwkmD6j5g96DpLQ1F7DmQ52YAsuBqALBukANnnSAoM9X?=
 =?us-ascii?Q?ksN0Glt213GwxMRiUU4vC2x7gBo/nF92IiTVNLgexyP/hMRCsI6n7iIy+Ng3?=
 =?us-ascii?Q?21LNCrO1YCMrdefSg53ANS4PgGPootHNLC/TaVm3bm8GbkTYcBOFlssVnxkV?=
 =?us-ascii?Q?djI1L0X/AygPIv+iLtIYhqGx3GGZGhK2zo+J3hbGKFZt8H1Br6buZ1V6e7MO?=
 =?us-ascii?Q?l0C9F/KuaPH4WrzNCcTijx072onxB7hkzVo9qpHK6DpHhI+hRoGn1ExUPVWD?=
 =?us-ascii?Q?oU+SQ9SykKoruUMnJ7m5w8w6HtVSqCrxWFtR9cquHa5czuRl9nhbR5WXfC56?=
 =?us-ascii?Q?aY2zdB4BjuMtWoChFrvSNeDjvg4vJdbXbIl+r/Ql5CWv6ePh6nG4VwGOWq7A?=
 =?us-ascii?Q?hWMKMw+L6IfRoKu723M8JkW8IGKQJyUA2gyiVuo5C0Lzl+htRWtidsrPkCii?=
 =?us-ascii?Q?e63VztlphNgWA1Z8qDLu9RR6I6eenO/zKLstKaWf40hD2yROROU8iPVdlJR5?=
 =?us-ascii?Q?HIr3UN1Pv1tvrMf3zqS/ZYFjeoLo5ji32Rf0nYHu2a8AKSWMQQ0X6IXiw8tE?=
 =?us-ascii?Q?W5DgfoZeZjBBVFG60pOWE28Ln8jBHgrmGi/u4ZrHDFbUMidUS8lsLetYNsPE?=
 =?us-ascii?Q?CTp1F1qSxsXIqJ6Cjp6ZngkCpHudloiZ7Z7arN/xTh3ocU8RIcbv+J5iMWRd?=
 =?us-ascii?Q?cNhvZD2MTMvp/3KHBsaGcJo8wgqqUT9rNkTALineG5ER52pQewp6oI0DceTQ?=
 =?us-ascii?Q?4emoBgWj1cjlXIE1Br/anam9ksWq7q7F1SXL3nfGz1s+I9q1JarZVhlh/E4c?=
 =?us-ascii?Q?ikzOgfrfnI/JLVB8qJrx+VB5LmX+pZAG4TYl2cbf7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pCSB4JMSZwc3nFxENeYnVH1d3IdYCFexoprlpYpO4/a/myeohn8jnFPPDJmU?=
 =?us-ascii?Q?QgFQe3LFCMNqNJgBVsP3O/5S/5gkF0AYR7dZBKQ8VyZDBlC9etA/Sx9MfXMq?=
 =?us-ascii?Q?od2YmV4P6/+s8jgV8ci4gakqFjfUguyXdjcVighftfbJr9rivVCILRrEQa9h?=
 =?us-ascii?Q?buLRUu8WI0Vfg8adBoo0kMbzTZ8ReePNbfOvYhi/bmeyt9TLHjFFIm0t6vTW?=
 =?us-ascii?Q?PbHgbe8DZsxzSshOldRHM23LTZ2BAhUu41FrWgipazOaQZLYq1nhvkOkqpvU?=
 =?us-ascii?Q?XC6GYXAUiR0w5Jt9C0JUO43/kXvIY7g2r4HeaSF4BcrgQDLydKpnkQIlcxY4?=
 =?us-ascii?Q?3zuDeoSQY5RTYzjHvOQtq4dF/31LcVhnNRqZ7s+EqIxOP3sdrgYlb7j25rBR?=
 =?us-ascii?Q?MdnIoyD8jXkl7uzZ+ObRN+Xl42LPzxyYOB6eYBGgCnkearLRU475cP5N4whE?=
 =?us-ascii?Q?76QF4gmBxJLvnPihyPX/j33MjydXLny+U15dzmCdKW6vIoX6XFjmqeK4yNmS?=
 =?us-ascii?Q?9/WWUCiql0m/laqQ0FPYZ7/uUrK1f1KUkTuax/h2GRtmrTDSYdrN4ntaWtYf?=
 =?us-ascii?Q?M27wmZQtmBR6AuVNenk0mbL+CgXFcXTUCwZRukhJlOQexQY62ZdHoMrC+o8Z?=
 =?us-ascii?Q?iMjSjoKt0nrjHLhjWcueterWYjH5A0B/vR2iLLQeJCSIrEEfgdlrGnqdccH0?=
 =?us-ascii?Q?N0IxCBfy81eK20Ps9J0vx9Cudc0y6PRE06jTU1E/3N8JP1gSD0NRY/9vwNSU?=
 =?us-ascii?Q?cJREpdC9Z9HEOQwrmD3EJM7ynSpxgt1HYQpvm3UaxQTavgKv3hKcYEBpQxwT?=
 =?us-ascii?Q?lCih5OKvhMUn5Y7lHrmP2N8BAq5Y73a1pjHKYfmDFWSDDaWrq8MAYgDNJA3Z?=
 =?us-ascii?Q?NHswXxMV131HDYqPsg41LYT+FK+KsJ9XUnqyN3dHJ75pf8lgqfRe2xd+Y4Ld?=
 =?us-ascii?Q?WxfqlpOzZ7W+LaeS1b+xGKYKeZaF+Bf/pbGyn8mgagDlJgr2QGgHHBK6qBTg?=
 =?us-ascii?Q?qEm1KIip7dRNOS1cIvUuBKVzp9tfIg7/h1F+uzvvw4b/UM6UtqRpIqwCU1DT?=
 =?us-ascii?Q?lvLAopJredDvwxrKFV23wCxKM2/gEYqjwmdugSYD3T3i8mPcgaujdwKnWW4e?=
 =?us-ascii?Q?Wr7U6I1X38+5VlVIXA5qqPN3ZLf9H5UUJSawoj4y73lwmFP7zUzj7f/Z67Ag?=
 =?us-ascii?Q?OGGYGEMbXL/FqZX8Ym543SrdB48AGeNEf/0cX+AgI/lGgVgioXWzh/CXgXJu?=
 =?us-ascii?Q?9EYWQ2ewHdfFVN6HdFGKCHaU/+V1vuF0J4s8y2d5yZJKj53JKg7hvSubNV8w?=
 =?us-ascii?Q?8qVzi1gcAoQrYatqS0L+rpBn2N1InXqPENSng7tqZCD0rqFFZEIUsvzvgo2F?=
 =?us-ascii?Q?7MlPzV1jPwNAZfSqVV4z84/ayfSgjW4qjhtdIUWByQrEB26iEK7h8OfIMGBP?=
 =?us-ascii?Q?LUmSEdkhhr++vjHuKKlIBg7qUCIIuTU7nFtXoiUbuWXB330ZP3SBfM9HznbQ?=
 =?us-ascii?Q?fuPnAYEAD6OzT8EH4juiJ9M6J44fMC3jlvyIW5ogoU4HqGNwIpILyqRjD9gx?=
 =?us-ascii?Q?hlIIOZs1mKKZkeHuDHsXy5jKfuvUXYiu/kTLzsrP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 589a6c7a-6d1d-45ea-6736-08dd06ad0eec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2024 02:10:51.4020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFTg2WRIB39vdEAxmVcvQq8IUqD2cHyCbyLYQwVdTbrmn9U5ktNz9oC79QnB/Y4Udi/ZXqDlnyn20m14mL9f6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6400
X-OriginatorOrg: intel.com

On Thu, Nov 14, 2024 at 08:04:40PM -0800, Randy Dunlap wrote:
> Hi robot,
> 
> On 11/8/24 4:27 AM, kernel test robot wrote:
> > Hi Randy,
> > 
> > First bad commit (maybe != root cause):
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   906bd684e4b1e517dd424a354744c5b0aebef8af
> > commit: 51084f89d687e14d96278241e5200cde4b0985c7 fbdev: sh7760fb: allow modular build
> 
> The same warnings happen without this patch applied, so I suggest that you
> backtrack to the commit that is listed near the end of your email. Thanks so much. :)

Got it, thanks for the info. We will ignore this commit to avoid false report
and adjust bisect process to capture the actual one.

Thanks

> 
> > date:   7 months ago
> > config: sh-randconfig-r132-20241108 (https://download.01.org/0day-ci/archive/20241108/202411082014.qSQ9A5ho-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 14.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20241108/202411082014.qSQ9A5ho-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202411082014.qSQ9A5ho-lkp@intel.com/
> > 
> > sparse warnings: (new ones prefixed by >>)
> >>> drivers/video/fbdev/sh7760fb.c:363:31: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got char [noderef] __iomem *screen_base @@
> >    drivers/video/fbdev/sh7760fb.c:363:31: sparse:     expected void *cpu_addr
> >    drivers/video/fbdev/sh7760fb.c:363:31: sparse:     got char [noderef] __iomem *screen_base
> >>> drivers/video/fbdev/sh7760fb.c:423:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got void *[assigned] fbmem @@
> >    drivers/video/fbdev/sh7760fb.c:423:27: sparse:     expected char [noderef] __iomem *screen_base
> >    drivers/video/fbdev/sh7760fb.c:423:27: sparse:     got void *[assigned] fbmem
> >    drivers/video/fbdev/sh7760fb.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
> >    include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
> >    include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
> > 
> > vim +363 drivers/video/fbdev/sh7760fb.c
> > 
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  354  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  355  static void sh7760fb_free_mem(struct fb_info *info)
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  356  {
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  357  	struct sh7760fb_par *par = info->par;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  358  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  359  	if (!info->screen_base)
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  360  		return;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  361  
> > 8404e56f4bc1d1 drivers/video/fbdev/sh7760fb.c Thomas Zimmermann 2023-06-13  362  	dma_free_coherent(info->device, info->screen_size,
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23 @363  			  info->screen_base, par->fbdma);
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  364  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  365  	par->fbdma = 0;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  366  	info->screen_base = NULL;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  367  	info->screen_size = 0;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  368  }
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  369  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  370  /* allocate the framebuffer memory. This memory must be in Area3,
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  371   * (dictated by the DMA engine) and contiguous, at a 512 byte boundary.
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  372   */
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  373  static int sh7760fb_alloc_mem(struct fb_info *info)
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  374  {
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  375  	struct sh7760fb_par *par = info->par;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  376  	void *fbmem;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  377  	unsigned long vram;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  378  	int ret, bpp;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  379  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  380  	if (info->screen_base)
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  381  		return 0;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  382  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  383  	/* get color info from register value */
> > f08c6c53b8e157 drivers/video/fbdev/sh7760fb.c Thomas Zimmermann 2023-06-13  384  	ret = sh7760fb_get_color_info(info, par->pd->lddfr, &bpp, NULL);
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  385  	if (ret) {
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  386  		printk(KERN_ERR "colinfo\n");
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  387  		return ret;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  388  	}
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  389  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  390  	/* min VRAM: xres_min = 16, yres_min = 1, bpp = 1: 2byte -> 1 page
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  391  	   max VRAM: xres_max = 1024, yres_max = 1024, bpp = 16: 2MB */
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  392  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  393  	vram = info->var.xres * info->var.yres;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  394  	if (info->var.grayscale) {
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  395  		if (bpp == 1)
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  396  			vram >>= 3;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  397  		else if (bpp == 2)
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  398  			vram >>= 2;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  399  		else if (bpp == 4)
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  400  			vram >>= 1;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  401  	} else if (bpp > 8)
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  402  		vram *= 2;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  403  	if ((vram < 1) || (vram > 1024 * 2048)) {
> > 46d86f3b3b1d22 drivers/video/fbdev/sh7760fb.c Thomas Zimmermann 2023-06-13  404  		fb_dbg(info, "too much VRAM required. Check settings\n");
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  405  		return -ENODEV;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  406  	}
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  407  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  408  	if (vram < PAGE_SIZE)
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  409  		vram = PAGE_SIZE;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  410  
> > 8404e56f4bc1d1 drivers/video/fbdev/sh7760fb.c Thomas Zimmermann 2023-06-13  411  	fbmem = dma_alloc_coherent(info->device, vram, &par->fbdma, GFP_KERNEL);
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  412  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  413  	if (!fbmem)
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  414  		return -ENOMEM;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  415  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  416  	if ((par->fbdma & SH7760FB_DMA_MASK) != SH7760FB_DMA_MASK) {
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  417  		sh7760fb_free_mem(info);
> > 8404e56f4bc1d1 drivers/video/fbdev/sh7760fb.c Thomas Zimmermann 2023-06-13  418  		dev_err(info->device, "kernel gave me memory at 0x%08lx, which is"
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  419  			"unusable for the LCDC\n", (unsigned long)par->fbdma);
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  420  		return -ENOMEM;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  421  	}
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  422  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23 @423  	info->screen_base = fbmem;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  424  	info->screen_size = vram;
> > 537a1bf059fa31 drivers/video/sh7760fb.c       Krzysztof Helt    2009-06-30  425  	info->fix.smem_start = (unsigned long)info->screen_base;
> > 537a1bf059fa31 drivers/video/sh7760fb.c       Krzysztof Helt    2009-06-30  426  	info->fix.smem_len = info->screen_size;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  427  
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  428  	return 0;
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  429  }
> > 4a25e41831ee85 drivers/video/sh7760fb.c       Nobuhiro Iwamatsu 2008-07-23  430  
> > 
> > :::::: The code at line 363 was first introduced by commit
> > :::::: 4a25e41831ee851c1365d8b41decc22493b18e6d video: sh7760fb: SH7760/SH7763 LCDC framebuffer driver
> 
> This one ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > :::::: TO: Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>
> > :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
> > 
> 
> -- 
> ~Randy
> 
> 

