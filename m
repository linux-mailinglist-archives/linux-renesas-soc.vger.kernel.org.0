Return-Path: <linux-renesas-soc+bounces-27695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO2FBDfqfGmdPQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:28:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB8ABD1D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3666B3055E4F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDE735E53B;
	Fri, 30 Jan 2026 17:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Tfxou8Ui"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5135E35CBA5;
	Fri, 30 Jan 2026 17:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769793996; cv=fail; b=YVQzVAF8RxsZLGty46pP2LKLVtcQ4pdNbgyHnlUIqpHSHqjCc7LrusPhSRU0ej4aMzTOVh7OCwnN44m0l1QCzag3MAaWrIZvDBLQSyYSGwhU9j6gQA26MBaiS6LKm8di9AQjslvOoZH0IGDJip61f+2HJAg3zsrbVoxhG43DUOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769793996; c=relaxed/simple;
	bh=ASubBs9zFUUv6RA6inVIYUYuFoZArI2/3Q9DnSPhCW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ov3riIIWUgXEhH831dseSQdabbLEK+MgzRWMx67cYKDaFqiYYk0bdHjWi0fnAkMDHcKLxOhdu6+c2/FsZSKa17KTL1fcz0f38M4Pbsu66JmPD1BCO/xabGRQJ9mHDpZFlYoneKeRl0KzQharvz1yf4JdmMlNx9wiFEn9VYyJo1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Tfxou8Ui; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZApiI/mipxH3Vika0Q0VD7WVaQ0F7G8FlFD+gB7trxoBRrvBABxDcWuoGNl3rRkE+MHx21NE5sW3NpJQLnc8vKA41UEpLgD+YK8Ta1qmkV9fm9HRnm/egj3f8oL2fkcdt5zixfEvMWDbocpn46j2F6WkRMGhsvjffGq+HeJ5h4vV38L5Pf8pMMpJ4obbLzIRH1qFTxvshYJ8QrhQfHrtqAk/SEXu2DBVpVMyTZE+hzxyrchvlOs0bb8a1OZXjLBb25XnSgk8xhdwsM+JLDV4V7AnjriptTiAQTH0Tg/hFioDmax3MHoY1iHyXTAHRuPaRk8PJ0OzoL7rKetuxcbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nwi+3/OYQretniiTLdmfghvH678PsD7uNwWbxArurQM=;
 b=k4Ql7e2WYJCm3KCZfxGrxqWd0iD30FrG7jRGfuixT1OwMBIBKd1e5v8m9pxdvDb7ZReNa19Vy3Vp2fholKY7rZo9Wl/7ak89uawxnfP3e8Hi/beav0QBSe2cDeR07VBJvGCoUNEgPMUqBCTUfsHg3iZUDJ4zbkIMTQGhEBPunsFIuAU57p27HMOjd9I1zBHBKPJBGiGzfmxuUViWYmFnvRP0df3ocqL8sbY5ByRDnLXw1K1Ygi+w3FAXn3+KeIR/+ZheCU88sc2Pro3JZOeRmB20HCMSdBMg7MaFz6h12SYFTknMtgsWm1RK1HDRGlfzto5L4ADF9XHesd/IcdJqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nwi+3/OYQretniiTLdmfghvH678PsD7uNwWbxArurQM=;
 b=Tfxou8UiQ4ANdk3zoGlRzYHlBHPDhhA4VW7GiwIPHGV0bHaeRcdIjHKxjNewmX0qijomGZP7uxeV79VvirmgRsxmV1hwN7sf2I+gjLItfCB8ApdquSMc3oZw+qqenr0dDCGBBoAT+fZjOZmE23PrDjzGfJgAWJ8ojfS0RmPia/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:26:33 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:26:32 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 04/20] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
Date: Fri, 30 Jan 2026 18:25:01 +0100
Message-ID: <ff4f1a5bae390087077897df54d827197fa68df1.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB10351:EE_
X-MS-Office365-Filtering-Correlation-Id: 50cf1602-8a95-49f8-2b0a-08de6024b63a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?tI7a7J4vQqjvusKEStoLM2x8jQHgAcm0jO+FcQ5EX0CN99c9Kje8guZJ16C3?=
 =?us-ascii?Q?o9OazKMi0Ys1mGpHAh8IK5u+M1lVur323qKBjVtotlekH+Rt0sjs87U89oPO?=
 =?us-ascii?Q?ycvbjDld03WOfhKiXPrRwPnJSOyZn8576vy0FV5e2BCRIqqFMNRfECXDYEA3?=
 =?us-ascii?Q?Y9zc0n/AfIb9osuDSt+zCNiUeHMu5OD566l+rkSctA5R4fv4Cvsu2isNzkOG?=
 =?us-ascii?Q?LZoPhEuT76G0M0XNZPxlPyUNRUHCv2MMpzJGANPi3/aptMWcxOiSSnXMugly?=
 =?us-ascii?Q?8ArOaNoxaY8xMv8iRupHloiucHM5rQcRuyd/63PXm0Wa9I4NeAT2IGBSbIv7?=
 =?us-ascii?Q?FH28uVpV5bd+ySgz6FY71TBecySIM2bE3WtYsyfL+7ZiD+9dO/BEdwu+KRIP?=
 =?us-ascii?Q?K0qLlth7DfqVa1n4HWmNW/qei3x0S6l/sNIFkzfqsGNWRjq+iw7fsrts30+0?=
 =?us-ascii?Q?CKiv69rWFmAXGvR6QuSztotWSkoZlZ1DNMFwm0CC59OZP+E45jmsoaQkbEQW?=
 =?us-ascii?Q?/6fM5Ns3KN6ETWcO5VCK2zsP480jPs6b5vsd6oZ1de92Q2hvzxbXjl4TfOgr?=
 =?us-ascii?Q?FobVPnpDfh8RNYEQRFh9rdmSJ/oh4spIZsf1UmPe+xq8ms5lUuqVB5y3rx9l?=
 =?us-ascii?Q?3sTm8GNl8gN0vWn2n3G/HtOVE0/lB4MMpN7mj3DFaVz87bUQnwfAQOecbnpQ?=
 =?us-ascii?Q?KL2nvMc5KM5kkRFAfHSON/eBpoFIVfs3o2TVv6cRckGmObBA7gTwNcbjxuHG?=
 =?us-ascii?Q?rjPIUmkWVcdWcE1sT71GmTRrJFuY65nimk5gujotmxoezUWnYOFG/fb0XoRO?=
 =?us-ascii?Q?gYr5iJpWhHMNRFxrbf4K/bRUi06xsUV+apuRVRsSa9j4WDFqN7ldWD4z368i?=
 =?us-ascii?Q?t/e2CHU+cZwSACczlACN9htk3hhHddC22DEVFTm7Lpr09ZOj+HAd87a+fXna?=
 =?us-ascii?Q?RPKTN1OouC7ssdyt2nexcavfUUy8e7J5boop//lc6EO5bkAmyUiI9vIvNe/n?=
 =?us-ascii?Q?13NJtWtKlZvl7Wm1lnIINm2pkjPsmNaZp3sWuiVkwbHnazGNd1OcUmV5ealA?=
 =?us-ascii?Q?VswpLBjzpyI/UW+p7NMsXbzfjaCe/q/OxP5GHwN0FISfgb4tdOL+m73llJ/Z?=
 =?us-ascii?Q?PssBVQOY5ns8xqednCgJuUO7g16Wg8kJommegwVCIrMSF/Rcg5v/+NZRj1Eb?=
 =?us-ascii?Q?Pt5d+5C9d6eVI5f5AAUf/KSZrdQTdADhfD95i3qs8uZhxCHZ3Y/XMlSDce0L?=
 =?us-ascii?Q?J8NSCyjeRg6UPH5aOOPZr8p/mLq7AHN2kxklhcHv6N4hU4oh2pNxAXGfo+R8?=
 =?us-ascii?Q?CyFwcUfFZzVByvWdCBqDQpTuXQC3g1DZkT4ELSerBKId52jeflfQXVrf3Osr?=
 =?us-ascii?Q?dhb8qOfR8HW1H8ABnOuBAS4ZceYTmxGiggLaa/AN0n6VdcU+iqL5uEa8/j23?=
 =?us-ascii?Q?2AbR4JamLI/Tu2VNfagaCvmr6SivKCCVMXM8Uf0wxkD1GKyDK3BNn4RlNPbC?=
 =?us-ascii?Q?73YMiVWpVmZBg9eT/G0a4VmPwRd1we+f8VWBModcE10IeHItzJf4tw6luujR?=
 =?us-ascii?Q?CwM3/mUHqE+pTYszLJUh9WyMmSkdrYfiAWEVT7parIHYyqoQpyQOtHiMii5a?=
 =?us-ascii?Q?RbXBkudvrO9ZIfYSiUrvB9Y=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?r3SOVsmfgtgBC50l+OiJFchU2VtpQenNqRzNIxvz4t05dpTi4YjBLQN8FYGe?=
 =?us-ascii?Q?uy8R2P8J+c0AKlrNi7MXmaoTJYsEi6iSxYdzN4iAoVptzVXPcZYpYJfcoskC?=
 =?us-ascii?Q?auvEElZPY9CFDZVMlkN67g/FNppC4W80YxaS2+YXn7XEKmUl3QiKLMssRjB8?=
 =?us-ascii?Q?Cgkt6sAZMzTuoC5cxW5yLrUCHUSf1gn74x3uZPABdVXz1+oiOz2bI2f68ETu?=
 =?us-ascii?Q?nb1VNqzRYb4Be8AK0LZeckQnILKlVp/K4xDOHcy/G3UIo4GeHUqE1+RJWt5j?=
 =?us-ascii?Q?Oghg1z39xgXZVrEQePCm4N3cEFFopqu/3Lszg45nhd1lEyKP/7QGy9TQ8tOp?=
 =?us-ascii?Q?eDcRoEXQPaiDB5vzbM/++MnUkALAqbLwUEOx4vRnZEZDzUkj0708LW1q85Ch?=
 =?us-ascii?Q?0v//AiW9yV3YXQhi+1Ijh5El7tEQQ0TaZiYBl6fko1jHamTduIRdiFeO7YEV?=
 =?us-ascii?Q?prapK2iHU1hepd4mvt5aTTzo5yZzdBwU70jGbL8S6QsJb8/BbgsudP1NkOpE?=
 =?us-ascii?Q?6HhBRLtVhmxYuE4jNlwg8s+jhYvX8AWn6C31IQcDAnpa1HSlpK/Ex+qJKjf8?=
 =?us-ascii?Q?x56aPNxDTn7JbgBEvPV2Lp/hB9pIf5UCfSb3KSrSg+aH/KH6F1ljammAyxOt?=
 =?us-ascii?Q?ILrafTf72n1Chpio1772u628SInb7sPjiJHoWs+urpfC2K9Uy+fVKulw0NzC?=
 =?us-ascii?Q?+ZnhdqYGBQlz9Bp29qJBfgrNxAhQFmQXEE3YiYmmqVvw8KrXhEDhf/N4BCCO?=
 =?us-ascii?Q?l/GYGgl5cfhjBoNzpEQdaQkLb0FD00/p3Wa4TC/FJlwjvoA9cPofyHWMlZHX?=
 =?us-ascii?Q?33bizyg4sJPNlARj4r5LZ0EmIEql8/MPAQbiJYoP3swD+WrXvmlRZxWIuu+e?=
 =?us-ascii?Q?4sSAvapuFPL8kwPweDXJqpxvpvR/t877zVBsXbBiIv2qAujsGx7uaNWgeTxa?=
 =?us-ascii?Q?ijQtU48zlI92r4MgKtLVIH+/C6Z+L39Eq7mY2f+eq22MKGSEWheHx3+bPlfL?=
 =?us-ascii?Q?r0znn+SvbkS4XmLnstNBm15uDariEKIPZ0V7IVdPLBvcvvkPK3bz3icC3HzI?=
 =?us-ascii?Q?wyrNAnnkcmeOjY7gi293zAMWiZRGUtC60GOB9h3vxfi2p4OSHNcwSl4f9kNN?=
 =?us-ascii?Q?NTlF+Zf+lmhOjarGWoM5e5jN1M6l3uD/jnP5oSoop7MI08AxVHvwHYvHRVka?=
 =?us-ascii?Q?iCAjJMG5sFR4mmuCbRy9Be92q2wxD2IG7Kylk70C1Zl7p6ZEfSGAyHaCHbhL?=
 =?us-ascii?Q?1kmOGmYPkIPlTIhNf9TDwiSS/5eou30poSNwgMKJqh5mp0tdeP18/D3eK0ek?=
 =?us-ascii?Q?vxjN8B518j4q/FC5i5rNrwrU7OKF6nYt2eT/dxzmdpOUxobwWCrVb4p3MqCI?=
 =?us-ascii?Q?boQJdjmaITqIUDmfh1Um/YxKZfpCYp2ktftUgiwcOd7Uw5At35GwXTUEhjZQ?=
 =?us-ascii?Q?n+fr3o9dFb1VdLYEg51INXue7kQ1r6kBS6kHZL4AzyXAhqAIeosEJsJfTnHe?=
 =?us-ascii?Q?qy25o01hhMD0m2t8oJV04aDD1xSSLge7a1AESfNHI3OklrrIf0T1AXRBKlGh?=
 =?us-ascii?Q?Vzx+yhsj73cEh+UZ6lGko4BlTMCno+4xGWOn07k6ap3XfUvE1+0a0c6iT1m0?=
 =?us-ascii?Q?uCg0rHY7qSb5KrYHcQcXaCF9gwg3Bwgd7G7uN2lzTKjNjMISiH1kLutOBYBP?=
 =?us-ascii?Q?73Y5i+MX22YO0kBxczybWIoN6bDJGjK4yNLyLfCR+F7QFjLTaK4jYWTaMKZq?=
 =?us-ascii?Q?xeJKMxPYK0zWiBYaaHFk73VLcU9/FHS8GqucTi9wQwQcKXf/n+d6?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50cf1602-8a95-49f8-2b0a-08de6024b63a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:26:32.9155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slKiVrd1pM7FKH3U/wI7Fh0auXR70u8dIHxDfuh+TwRxJMFAv+pOEI8KW7PHSn8T5vuvM6Umuzst7YOnIWMyNq9oFO30pbyckzgs1M8v11HA5aalix+hB0mTbJDs0HPX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10351
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27695-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 7CB8ABD1D1
X-Rspamd-Action: no action

Add the CLK_PLLDSI0_DIV7 and CLK_PLLDSI1_DIV7 fixed-factor clocks to
the r9a09g047 SoC clock driver.

These clocks are required to enable LVDS0 and LVDS1 output support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

 drivers/clk/renesas/r9a09g047-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 8d4c70533a79..0e707391283f 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -69,6 +69,8 @@ enum clk_ids {
 	CLK_PLLVDO_GPU,
 	CLK_PLLETH_DIV4_LPCLK,
 	CLK_PLLETH_LPCLK,
+	CLK_PLLDSI0_DIV7,
+	CLK_PLLDSI1_DIV7,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -196,6 +198,9 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
 		  CSDIV0_DIVCTL2, dtable_16_128),
 
+	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
+	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G047_CA55_0_CORECLK0, CLK_PLLCA55,
-- 
2.43.0


