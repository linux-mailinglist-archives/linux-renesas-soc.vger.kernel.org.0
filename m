Return-Path: <linux-renesas-soc+bounces-24380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AA1C467AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 636223B5021
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B397430C616;
	Mon, 10 Nov 2025 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="d7c7bKj5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8B52EB875;
	Mon, 10 Nov 2025 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776546; cv=fail; b=RBd9MGxTX4x5jPV84R8YHErUgmuCC7M1B4iWDhiePIadKKv0jOautpoO/a3YT6viKKKBYUAz8x/YiYACmC0n13+TzSZnswyytO6jrgCUcTEKjhPaLGhotyFcqixVqeFCZigSBVy8eGP2+QNClliLkVdspBkfB2ftPOjy7iAiCtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776546; c=relaxed/simple;
	bh=dXpFWFjmQQyP1/sYMem/SBlgSlrNPca95OHPasARn0M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bm3HN9CdKJb91DT6ed7jtJlDeXgY3YwBV9pR0k5aGJI8sWzVrtSNF7vFaP1YHU/MOHNhgqgXhD3SAgGJXkYFM0S98yXBE51F/9Dc8d7rGZ047sBLo0iAtfBPbJA9Hk0A/xPxxWBGhZ8M4mUCgwjCwlHSGo60zaqe/JbiT5+QXjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=d7c7bKj5; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IroGD09Lfpcrh0RL+qkC/LOMHke5pwoQ3tUbjIQ0Dijw5O3sjmL9aWz9eE3Fv65363c7qxlF/tZkTUFVc/t5/CvAuO4ZyHef47ZjIAtxr4lOW5bphjSZeFEY0grmrT0zKoVc5Q4CYjmkqUwQ/GEQ42eCkn+Dmkms3g39KUnSvstUv/WRpb717UsR534830RKHVafDQOwmCE92jTmod3b8FtIEUERt4ihL7aDQSJU3EjlQJxCmnzrXtlDkj4dlv3n2TNIEzJWJGWyPyuBL7LQjf+BYavkbtP7mkKz82Yo61UVo6oBfV35eWz2zxurzlVoQLI17ycmVvSO2KU1fW2a0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IHfxsnOObUCibOq9zW1GZQSnGXdsvNhhFbwqjfcZQk=;
 b=gVL091LnQE9RsqHw+tr6f1GZXW2g31MzTBFOQC7oU+oLcCF/VAhZ5AKIJDSFpH9vzxx3fjtV7Fvwnnbtu2rW5TuVCUr0Nj+V434jQ433WCJfvlw2Vbx709IeN+jJ8YVet9nsHR00egSiN0huDqkn1KR4Benc0EBjwKY0wOHrHKnjRfnGXfmdB/9Wv9RCyYoD8qS/bbmvoAn6EYJZM+eauXZOWVNlQbnABaqybO8qx8Xrwq0+cEnr3KR/FXZogkFFGVrMUiTe4bQU2I3Q27D6lBlX8ZE/Qx6lkX/XmRznh1heS7EPxhvvtmMEOFsOPuklAs/BiGXyLR5EjlYTO8XJug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IHfxsnOObUCibOq9zW1GZQSnGXdsvNhhFbwqjfcZQk=;
 b=d7c7bKj5lcFvrHWecY/HkC/p0OdSCSt0MGIvBYtwcJvN5IkFy3ckzz8z0STNqD4xd+si1Exs8sT4vkP6igtzsU2NFu2rIT2nRUyPfe0xUgNFRxY0uDoG6qltCINOdg+MQcA4Ds4exxbXH/A4eayQmtIXFu2hIfL0FEgCE9v3vIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8436.jpnprd01.prod.outlook.com (2603:1096:604:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:08:58 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:08:58 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/21] Add USB2.0 support for RZ/G3E
Date: Mon, 10 Nov 2025 13:08:00 +0100
Message-ID: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 6268a1f7-281d-4d76-2682-08de2051ed11
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ovgFolTS0ARVB/6S6lVzUiIhVpMiFudyjShaxTz8D9w8a8uOFByPSZZQ3/aW?=
 =?us-ascii?Q?2nTsjshg8YXwSWsY5RngTq2AFsbEgXBdSIQzYXQccMEPN0gWlrvToW6lkZ0z?=
 =?us-ascii?Q?HB9JtX6tlRI2Iqwqw+2ydlnBFgwdgi8L1UuhX85YFCO5ql8hI/FXYS7xoCV7?=
 =?us-ascii?Q?Q2JcZwIlIdOQsrgvM9OEhVVZGpqEeFp0P7kKTBzjhElsvS5BMUqTasIxndo9?=
 =?us-ascii?Q?TERbpn7UlqjfC4BqpeC/coe8fyEsVQZyqGQi95JHVLMqp5Qn/CxgMGeHiwQi?=
 =?us-ascii?Q?S1A5zrHZLf2gfQK3JRtTRqwA7DBODlBj7LEQvj4IxjvvVEhfuxaT4nqBWFuU?=
 =?us-ascii?Q?94K8qjxe3sJfWB1nySrHDkxIx3KfQx2t3KlVnWfH6nx9EJ5NgzoD7fYZ3ZNv?=
 =?us-ascii?Q?Fh0yyfGFydYF4Vs23sSN/9aDmMA/asYzbavgYe375Bp7CThuFyEtxpslY+aq?=
 =?us-ascii?Q?NxRaNEMmwjIP+a1ua3zgrOLF8b4HaVVl9OdY9pXQIJU0WsPs9G2LNtPLX1di?=
 =?us-ascii?Q?TuHQ9O27DYrFmVwZikG46cGu2EhUJPLROVk0rrYQkSdnHo6CXOMPXZOyRB+0?=
 =?us-ascii?Q?jMxceQu49MFlUYv5QchkLlG+zhrNQGz41HMFliFcLjBafS98l+0+DvzilaHh?=
 =?us-ascii?Q?pvpi70stR6dXcsubpVq8vX/ldcP167tkNJ4dhlOYN1LJLr6tgN5FZYngXpax?=
 =?us-ascii?Q?guEXT4VISIwaaeT5fIXdBIn/S+jNL/9lEZF7AOhSDzLNnOhS1t5BFSKCu7CW?=
 =?us-ascii?Q?TDIh2CUSYvio+urbFkeUL6C1s2VK0O2UZatBktOj6sl6RrA+ZcF26DzdFUu3?=
 =?us-ascii?Q?VM3u6mauuwSRevI4jnunywtXnzhRg1WV5fUZWvmTC2d76pW1F5JZEugI/wdL?=
 =?us-ascii?Q?lqJrHyR+albrxirKgFsbLUwKU69BojBsYKNqepFi9Sa38G+xQ3x86pmf6HfP?=
 =?us-ascii?Q?OgiVz8218sTMLE1rlGBQc4CjDKdxbftkFwsUGg3pajJl+ROSnxXNH8qHMeJD?=
 =?us-ascii?Q?mVlojtESauyjjFuFyxnJsQJs59YlMyVNu5uKG9IS5J3Cs4QXv7GhHJtkTX6J?=
 =?us-ascii?Q?LvngF/HeLfZcUu82d1q1PC1Mk0F9cEKtQ48UJlWA79QTV02b8mMiwbvDSrmZ?=
 =?us-ascii?Q?btVkkpxzEAPcpURLErfNL+Hazqezbk7b3YkmG1n2kFlFhZKV9Enu3GkBFA6k?=
 =?us-ascii?Q?GbzkkkGobKtb/irvBBDwQxXEO91fUb97CqnjZUdCy9+XrtsGJdpM9JYlLBFM?=
 =?us-ascii?Q?lrxFgiNft3Bihm+WfNb6Sje1v/Gwyhc1uXYfMRc8IGd4MixnRbmeyvpWMAqr?=
 =?us-ascii?Q?7G405hSETqyrTA4pv4H3tL71r5u+lhJV8uafI9KLsvs2++IBM7c2+d93kJWg?=
 =?us-ascii?Q?BrwJmuraAfO0RmCL4EktgNmxIrlHWmfYc6PDVS6kT/VOy1lnVnzTi1kzzsrF?=
 =?us-ascii?Q?kM/ci3hiqMyXHumEdbLK8U7v5d5tAfSkSFzvKVklh8+IrTC4pn7C0+xMVB+g?=
 =?us-ascii?Q?0u+kz8GwHY7+ywLMhWJQ0E8m0kPF2ewvg+tx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1dvi+INerC6iYNVEmmY/jac8aPtMXfOoKYmc/pwMx8zPS8oROh9H0lBnIMMr?=
 =?us-ascii?Q?l5d/CEqVXjNfxSLJiJbTwG6+pcAVwb5JqCexVvvHejDwrszqMuXwUJgVh14u?=
 =?us-ascii?Q?fazEmGlcmattFfTiUL4GrGbZT71Yk3oTM4fh04T2xt+5I9XnKY8bC8qm1UH9?=
 =?us-ascii?Q?n8P5JY7Qx2xELpI+UOfjQ3wo9x13tKunk3prMXFY+8lxWKvI339PuIvCxI1L?=
 =?us-ascii?Q?HMG9h82Qqh/lwAbk8TucaXV1jUMODwV/WlLbDYiUzYQJ4sB0+y/efZ9U3RuQ?=
 =?us-ascii?Q?74irqrSKUkQbbCtUTol4BsWPObEvbcFODcOoXut3vuS+3/SBfoX0kIWnp9ef?=
 =?us-ascii?Q?T3tYHTqszyCbcg2i0VrRo5j0+AgZqwN7fGag7MeUd8F7nqGooxnPe16dI/xY?=
 =?us-ascii?Q?T/on6UwCQPPJXxzbkpDPrMZeht6FpAo54sOoNPDZxagOXnNl0kBBAZejfDM7?=
 =?us-ascii?Q?opYTtD9he6+bQtoGP8jKW/XUj3WTCJGhhUsNwNWL26r9gbRlzXpgd8JnpTCo?=
 =?us-ascii?Q?n8zx3BOgOCf4LfcacGiTyskmwCiQQXXb11dqsy3wClHiqlEilbFlCQyC4CuZ?=
 =?us-ascii?Q?h3OPMCANtxINe1aRywS6PKDtc5wuuySSMXTwhRQyqXs5Q6tjgwCpmf5kzHOk?=
 =?us-ascii?Q?R4jmMSE9+8eRXF3vYVn8p+Y+1vVQWN1OhARpqI5FigAmEHdygUVl++47PbdH?=
 =?us-ascii?Q?O0JludVlgVuWmkc8SQ2jARgSmSRcZ7f+FgRUBMcqXHItBBfaQzVK9GBxWML1?=
 =?us-ascii?Q?xkqEI2lPqbYb4eWydzgf6Cr+GiacjuBqZnJ9FvC4z71YhD0CypvOvdgz5cn0?=
 =?us-ascii?Q?vVGRRpkp+zIJZ1VG7zwapnaqlMoxeIGJgn9e7sY3psMbkP2FaUk8x40hAJcm?=
 =?us-ascii?Q?1Oc7fEXgB7G0Q3m6RwF7Ay2955cTiu82vINXb8oV9XBiN32v8belu5iJIBNR?=
 =?us-ascii?Q?B6udyuB923OlRgVPjdvLwTwG7NQoZGayx6kp+JyYshNiI3RCqAQHJXOjJnn/?=
 =?us-ascii?Q?zw61lvvNLOPlc1MgM6oZiJD9JN3Sa1S4CZalP5nwLTCLNhXRh+uBcgrfXqX4?=
 =?us-ascii?Q?CuGOYYs7E2SXP7f6i/EkCeh4wIplVkNvpjCFkGNMWDVFS1HmIlf/kW20CHLX?=
 =?us-ascii?Q?M5jIsrWnMQQjwaOBLiADrEqwba2BCUpU4MHhFbQBMGy9r6rMj7oHqWHKQ4or?=
 =?us-ascii?Q?vcE8A2zI7BQ5xCowG4X/ECF2FU+0+333GWbWXP1Ti5rFEZHanaECMQNsMMnz?=
 =?us-ascii?Q?pJ79EtYwZfKpqp3O76ZqxJc0ZScyoAyVNtsx4G71zMx3ALBAURQHV/KrdlOc?=
 =?us-ascii?Q?BJQxKfur/Tay2QjRyXbA1p4c6+BPUnjD/5iOu7InmzIGbUE1gv0EtnbY7pMH?=
 =?us-ascii?Q?0NtruhS/lqC9ASqo4D6L5XYosaa8tmrbvtFRkP0FgW5NaZLxzC5/1l5+lnZ+?=
 =?us-ascii?Q?mdKxv0ZmMui09dVMzi+enEKD1P+6N0AmnSmb5DI6U9BFLVO6kCllZVBnhDLm?=
 =?us-ascii?Q?ol3ziOXOfSTsf3Hhx+S6X7wDN/kOpir16y1lIb/YFmGIPXchFvz0UR9iGt1N?=
 =?us-ascii?Q?WysHZ1ZAmk2aVeBz71SWcwN+txuo+Se3D+Cvl3/iwqxnFniOZngFUPFqlv5l?=
 =?us-ascii?Q?KkjU1g1p6fjwZq6qRRMFBO0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6268a1f7-281d-4d76-2682-08de2051ed11
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:08:57.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryGMD5sKImzUbRNWV4PT55RH7vtEGAa3Z8xJDpGyqU/NwZEEXSXhAOmvZnSIXGHPi5F625Jn/1K9AkqNeKYuZZ+7aPC1DQt0DPob2++6Gqs1F9ZscWDXqE+3UyGHEdck
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8436

Dear All,

This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
enables it on the RZ/G3E SMARK II board. RZ/G3E has USB2.0 IP that is
identical to the one's found into the RZ/V2H SoC (R9A09G057).

This series apply on top of [1] + [2].

Thanks & Regards,
Tommaso

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1015037
[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20250912130911.185674-1-tommaso.merciai.xr@bp.renesas.com/

v2->v3:
 - Rebased on top of next-20251110 + [1] + [2]
 - Add missing Cc: stable@vger.kernel.org in patch 03/21
 - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
   Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().
 - Patch 04/21: Manipulate mux-controller as an internal node.
   Improved commit body.
 - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
   then update the aux driver accordingly.
 - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
 - Patch 08/21: Improved commit body and mux-states description.
 - Patch 14/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 15/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 20/21: Manipulate the mux controller as an internal node.

v1->v2:
 - Rebased on top of next-20251103 + [1] + [2]
 - Reworked series to use mux-state for controlling VBUS_SEL
   as suggested by PZabel added also mux bindings documentation
   on phy and rst side.
 - Collected Conor Dooley tags
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
   rzv2h_usb2phy_reset_probe()

Tommaso Merciai (21):
  phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
  phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
  reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device
    lifetime
  dt-bindings: reset: renesas,rzv2h-usb2phy: Document VBUS_SEL mux
  mux: Add driver for Renesas RZ/V2H USB VBUS_SEL mux
  reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
  dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
  dt-bindings: phy: renesas,usb2-phy: Document mux-states property
  phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
  phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management
  dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
  dt-bindings: reset: Document RZ/G3E USB2PHY reset
  arm64: dts: renesas: r9a09g057: Add USB2.0 VBUS_SEL mux-controller
    support
  arm64: dts: renesas: r9a09g056: Add USB2.0 VBUS_SEL mux-controller
    support
  arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal regulator
    node
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2 PHY0 VBUS
    support
  arm64: dts: renesas: r9a09g057: Add USB2.0 PHY VBUS internal regulator
    node
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2 PHY0 VBUS
    support
  arm64: dts: renesas: r9a09g047: Add USB2.0 support
  arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support

 .../bindings/phy/renesas,usb2-phy.yaml        |  15 +-
 .../reset/renesas,rzv2h-usb2phy-reset.yaml    |  15 +-
 .../bindings/usb/renesas,usbhs.yaml           |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 131 +++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  49 ++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |  10 +
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   5 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  15 +
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   5 +
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  23 ++
 drivers/mux/Kconfig                           |  10 +
 drivers/mux/Makefile                          |   2 +
 drivers/mux/rzv2h-usb-vbus.c                  |  98 +++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 263 ++++++++++++++----
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-rzv2h-usb2phy.c           | 108 ++++---
 include/linux/reset/reset_rzv2h_usb2phy.h     |  11 +
 17 files changed, 665 insertions(+), 97 deletions(-)
 create mode 100644 drivers/mux/rzv2h-usb-vbus.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

-- 
2.43.0


