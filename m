Return-Path: <linux-renesas-soc+bounces-23944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF58C233E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 05:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D51B81890B30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 04:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9882BE641;
	Fri, 31 Oct 2025 04:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YOIYWKWC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431F533D6;
	Fri, 31 Oct 2025 04:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761884546; cv=fail; b=sYBi323bgNd44XyG11PYeE7xQ+TDnkCN8dv81B+gTdvOWC4NyLnG2oIoj/uwJsA66ZTFpfkERVYhPnqXQ5fT+Qm+L+z9hKx2Xb0NlkPWUKAT90f/FbFk1iX8w7pU7tTy8kDXcw/HTwmleZ21cOfEqWcHRh4XHZcpfrt0KNkqEtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761884546; c=relaxed/simple;
	bh=JmgFEXF3qRmpSiJM5gZpfqZMrQQvKxNwumI2Qq1+S4s=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KM5yx/r+Pk2MRm/us0wNTutkoc1bXAdvZR4lYEo5DdGAYRuDFP+1G+jI+Na5A+jTJx1JA5Nv0yu0XVa/6FS9q8/wFKixwOzQ7tlPi47/jdggK/bKmsY51/F7ej8sL2kguuVHNJzhJqFdDwZKRu+hYM9lMCHEQSWz58ICdukZF2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YOIYWKWC; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sc3J7kqh+yzHrVLNy71zswJ5YpXvHS+5oFkIC1D1r1ZlV52bbKgSdLpn6Rs7ubOHHBvqR6tms3zFmYIeszn9WXHyzrWnMUcWvxtQ7XS6x/xGpFAPEU58Gza1Md/4VOZtEVYB4VpmVg4Qjkgd9HCZBjlCE4ffOH6158pCfBwEKE1yB5+MCDsKY5jOFDKRZOA10qslCaWU/C49KZL39CTMMyzT5WIccRXLXHle7QhfHW0JYjRbUMAR4aV8eEZF/hPowoUjs8hteJLx3+C0b/8fBv215QXN4VoxoJfkfzG5pwRbMrJIAgY2mgJHaOwoKgdG/x0w4012fhefX9y8PlEvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWKuFTaCOuLwyO8aLFjV4dLWif2iGxK/5PuLGj+eMKo=;
 b=nRcP0YFQQdzZn9S72f1txBU36AdEX7clKRNwAQGMRcmC9M13E/hQSabL2CBOhkMp6Z62Ph8O16mbmtHbjX5KhP5rT56/DICEITZHmi1Rs6KRCF8OBioFuBqbj/vKZjBCruhPggYae+A80PmJZqyPfLa0f4HxVRnnwEarbqQ+E/uGLc1yoi0U7u/WG4V0f8xCVxI7SA+PmFn5AoKAODI3sEcm1+ZgqsiyvyAieqhu1xR4mgXZn7vblYutX/qNf2cwXiNH3gZS9Xk7xlEgTSX6sSvqZ0qVSm2ncxQgQWgO8/wSvcTu5CpvmSaDVNXYXaaDnWqbVCz7JYss/ynhtZ6rwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWKuFTaCOuLwyO8aLFjV4dLWif2iGxK/5PuLGj+eMKo=;
 b=YOIYWKWC2oFHLp+lE/PFMf0j/muJBd6ELkaEA5hxIeFhMI3p9TkJg/j0Ug4HeexBhij/fYjaUgBFjW85Fx77zbgBoBOrPAUbH93VaS6WfFylHjZospKk7BxnPaR3iLXzu0GSCbTSorUObfnwnY3F0A7xOqncwFjTeOvDGjnMddA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB17536.jpnprd01.prod.outlook.com
 (2603:1096:604:43a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 04:22:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 04:22:19 +0000
Message-ID: <87o6pn3dl1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
In-Reply-To: <877bwd2ap8.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
	<87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>
	<20251028-pastoral-efficient-mandrill-c4e9ca@kuoka>
	<878qguv8fh.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdW9sEcKprPjiA50QOWm7b_fwoEkuJcLLKg-srQxwJX43A@mail.gmail.com>
	<87v7jx2t7s.wl-kuninori.morimoto.gx@renesas.com>
	<5dd02143-861e-4b2c-af1b-79e6c57de076@kernel.org>
	<87a5192bbm.wl-kuninori.morimoto.gx@renesas.com>
	<877bwd2ap8.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 31 Oct 2025 04:22:19 +0000
X-ClientProxiedBy: TY4P301CA0076.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB17536:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a0e3dc-7578-4005-a63c-08de183514e6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vf9EJribA7gTT1jAUAY8yccD10DMI3Bkz778ljfNJQJ4JE/oIAehu79I2X39?=
 =?us-ascii?Q?2k2TL3y4logVgDZKY3nWu/cJEKbX3KksredUAor+fTNBrsW3Tyaiby5CbzJW?=
 =?us-ascii?Q?MhWNXWz0IpHQfpflxeMUXpXRXtfBOEspv5UwsCrJNFNXV3Y2NN+7dGv7dV6V?=
 =?us-ascii?Q?ynT2EWOVcEgGlvY28OF/miTgR+VwEEdp0IQUuvnjjNDtfa4GYWEqesSjl+Ok?=
 =?us-ascii?Q?Ul6BIWrKWPAh7gG09gvERIXVtrRC2R1Qx6mELLGBMOp0J3WnWO7IMb7+yGz5?=
 =?us-ascii?Q?lOkzcBOf1UDfRJDZAIxf8ioBxI5bN2XnmHrp5Y750VA+X5m4kFcfo6ibJUkc?=
 =?us-ascii?Q?w1bBe648m61Sk49Znk7AFKlEsMncjLPfhOeo54OoddQgvADx0uV7aW3hjkYZ?=
 =?us-ascii?Q?c/806vNl/3SY87CMfJN7q/AtwUJMH+SWnnQaTWS7VegEAAXq+jkDYGbtylYa?=
 =?us-ascii?Q?t9q9O/u76Ev5+w+AkCPBZwN90Z1H6cRrP55Q/t6a8ztJwuf9YWWfEj4D4vxx?=
 =?us-ascii?Q?v2gs0qNG5YGgSQQ89cz4qHm7V5ZkSZT5WdPOIbMJqfibJj4w02OxuRe0vedQ?=
 =?us-ascii?Q?+EDMCXs8z4k9mfgqTdxJuBtyR5i3IOSThPvOl1ltS1+meeJNYSMN2rrRDb3o?=
 =?us-ascii?Q?ilfUCbFSvNPLVKh/hK/420Ho/q+zEp5UP6u/Uk6/YdQ+0aCR7QrI4MdxjIjo?=
 =?us-ascii?Q?NKHf9v2wpV5+6pkdzX5QmfRXG+FRKAYQoPvP0ORByjf9HdoJeleE0x1rd2QA?=
 =?us-ascii?Q?H0gLTdl4hSMPdwl6PqOEoiV2w4Y01JIKRoNXSazsr9ALO6pvu2PSqsTeHZH3?=
 =?us-ascii?Q?8U4bFAOvzC66fSGRx8m1/6xnux0Cn022cbxbEpaVxuE60OaGasMxKZO0Ra8Q?=
 =?us-ascii?Q?ESupWXUCMr12xAq8QF32ax6IZ5zwM2fcfmOLzI6tiL38l+Rx0Urrd0pA7T+p?=
 =?us-ascii?Q?h+1fJgWIDGcf83tgeVZga8UJ94xmbNAUiBdWMFck74xsQFaqQbVelD4LrKji?=
 =?us-ascii?Q?YqA779nGkf01F558vxoYlhMKLvHJrDZJqNwhJpfIodib2jrNp4SRnFPOlj+i?=
 =?us-ascii?Q?JUeytqSulYTcJy3V7gd8iEoPKzvRGhvMOxdtyBqaustSkWRqgPKcdiCimX+c?=
 =?us-ascii?Q?E3JZ9tJ96t9n/mhNLeXDwuEJdRM4CfiTnCSWD1xCdbNS299e2w5YIfAB4EuE?=
 =?us-ascii?Q?Nyy/XF0HN32SEqRReABp55X07xzG6ZgboVvhjmXvopJf74ODbg/XxDyzi2x5?=
 =?us-ascii?Q?GxfYQIIS1JfxI3KCKk9LZGAIJtan0BVbGyogocCnV/z8B/ZhkSSAtN+gJo2i?=
 =?us-ascii?Q?dNY5Sm9BVWf7tAb0U9uXNWkT3t3Zq45WlstPa1Ilny72MwIWv3hiUlaTxrtF?=
 =?us-ascii?Q?k/qtiGN1XO3+2S7hyaxewt6eXbirXN0FTLgpFXuz48gsjaOBkMkW0e/TnDOy?=
 =?us-ascii?Q?Oj2qY8BTQsYTKhKkFCsKlxp1FENAOaNlhXeUKK568h5j3CP7RMhuJ4McDb7A?=
 =?us-ascii?Q?S9EgkHjJcTNEzwcKtCRfvZq+Yw3c7XQqfy8W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B0etHbv0nDK0Ov/+7L73jEeMoStaeoJ9nk1asExVyuvVHCtWQAGo30Gj8htz?=
 =?us-ascii?Q?omJiy7x38cKeEU0mkCtfiZ69OhX+4nrCAiM+qjhZL4AaYU7kQ0NypNgi7F5Y?=
 =?us-ascii?Q?uZm/C1qyIH6MXaS3Hox9gIGCr5/hwvrzmjxsVKLE0IlAhML+wrNG/ENAapgq?=
 =?us-ascii?Q?HT0Nbqe4JXLlY0cFBBiEaAPGhkLk0vVRzKQWd/nB0Rg7k4wQSJZOJfZAntE9?=
 =?us-ascii?Q?+FGWpWj28NeLsX9rZ/DAiKF1QHLj0jGZVivrZeIg4WK4usCzQYlTfefx3wX+?=
 =?us-ascii?Q?15BX2zjj2wm71L+PAZ09R7D+QiMYmFmljlu/KNFxgRdAmQJQDfDS6/yaHzWv?=
 =?us-ascii?Q?8SKEFr2F9XzG0+xocjlROOD08vNELn0JeYjDXIcW5D8998mCdwgSYnyqJs2z?=
 =?us-ascii?Q?J9zeNFWR2vkuWAfnjc2zJDt6C5uFC/pXi3MK7JwBITzuZwI3+l+RZPxL0HDH?=
 =?us-ascii?Q?PNkUPvlk3mBFUN5YK8a39wqAXlgyUkAFsEndcSCWZXUuSpQwA67RM83/FOJ5?=
 =?us-ascii?Q?tAfp10IxrcS9uxrCWMqpJDKISLKq1upFfe+VLnMbVdkNL9pZcl6Xk/5oEs/L?=
 =?us-ascii?Q?FGNXXCWM9mmIs1GotMh9e3nSwRdvYIyc1Uhk9btwl5KyJ3YeYUBmPsLw4/Ih?=
 =?us-ascii?Q?acM/vMXrM4jkmXSxD//wzCgnnsl5LMugTjH2hnx2yYutKpAgJH9hgjft/k/E?=
 =?us-ascii?Q?M08nk+6M7jJSHrvxoKAdrw8sXpzZlGa8EV58CxV3tGF7YHD8j+HaDMT1K+hC?=
 =?us-ascii?Q?IheO/xhSIykXlir+Y/7gettJJhvA694AHcGHmam767TkdcCr+/4iWvlcnNUZ?=
 =?us-ascii?Q?h8M1YGHwRv7ExU+WUnm6N6ET5sJNTvzeiJxW/MfFzf9cDS0AKbXBCK2DyWo7?=
 =?us-ascii?Q?8AYZNRsU5bg70aGIpleYfkLi71I5Wrst4Gf7OLdXpaX+hoGaCtLn8xB8z8GN?=
 =?us-ascii?Q?XzNqIWWHywSQqi720Ie7OPiyUUxtEspxHpTq+QXQ2V8dO+hJS6yHOjv2zoFh?=
 =?us-ascii?Q?ErMxoxAIkOfu9e/mgfRcv5tyXl6i1MoO60mLNnkG3/7tWhIXbETW/hMwCSaU?=
 =?us-ascii?Q?1flUaA9sZmrBfcnGT5ORVJnMsJ0e6ihxIzk+NbmP2QcfbCB0oinuPYSWomwH?=
 =?us-ascii?Q?ikMb6M5IsYNHJGom7f7uUeJx+Yf9/pZS0F2Y0/fHHeRktJXGd52vOW1Ll29s?=
 =?us-ascii?Q?grhouaGk9Prf5hyiFVFJyILpvlONH0VZ4SjJCUD+qGwtReMKseXTOSdiQ3Zw?=
 =?us-ascii?Q?lK10SHT7Y3Pieo2B2bbwmPAGjF7i/LPkMakRW6lpYM/QOBhlX4uoIRvwnrzr?=
 =?us-ascii?Q?8abzpnvn7OvLMk+8JDQuf1Vwo3TN0cmvw0byU9oREkGqf3ECq8XvQjSgKGPz?=
 =?us-ascii?Q?mBmm7ZNAwkMHSSMYDbbvVMhxgm6vU51F7rAryTDs4sh8/9bW3Z0Upb2YuyHt?=
 =?us-ascii?Q?Wm1RnxPskTjZzm6TeRIVtsYrs7QuHRcOGuavLqhU4N/zlfpUu/RYzfFsjKll?=
 =?us-ascii?Q?R5qW4XLzS+oAcchoWxrcchc8xQLfkifKm9RbnrZ+eNAaojbWrVtHXRrfY83I?=
 =?us-ascii?Q?EHOYvwVsQv7RpIFvrxaVfdfEqCZqy1s2ndSV/lRq6yOPnb8sO/v/oBf4j7Lw?=
 =?us-ascii?Q?RRdRJnNgqUqZW19Kz4nrmGQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a0e3dc-7578-4005-a63c-08de183514e6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 04:22:19.8398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNdh6xBCmA5dLXZIa9NpVwNJsi0lXTN0Of+bi6Rn7THTXstSBvDROKntT8s1WJlNRONy4kxfgf63rGAGDb/Xjpte5cm2I2QGdahyKW0EFJ/n8ac4j+Pi2LEmcqCurN4S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17536


Hi Geert, Krzysztof

> 	compatible = "rcar,r8a78000-mfis-mailbox",
> 		     "rcar,gen5-mfis-mailbox",
> 		     "rcar,mfis-mailbox";

It is easy to confuse when contradictory comments are made

v3 will be

      compatible = "renesas,r8a78000-mfis-mailbox",
		   "renesas,rcar-gen5-mfis-mailbox";

The file name will be

	renesas,mfis-mailbox.yaml

Thank you for your help !!

Best regards
---
Kuninori Morimoto

