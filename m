Return-Path: <linux-renesas-soc+bounces-25235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87368C8D712
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 10:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FC583A9E10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 09:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D703324B0C;
	Thu, 27 Nov 2025 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qTw1v/MS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5212BDC3F;
	Thu, 27 Nov 2025 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234474; cv=fail; b=U3foFVRBogAEmPMd580Xl2OF0RxbgPgi++IJSmHyS8+tRoCfAGRvQekb9pt4OQNv7BXp1ZZnsSYlxs+wlaCc4gjaD9653xjLp6CTmgJ6i/WTVcywMNRK9MgqnypDkxhZVDaf83NA2hKBkI/qXeq8HzSahuf6pEsG22MeogYXm/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234474; c=relaxed/simple;
	bh=Sy7KbyUXnV+D93/qBih8CD+1wfwOT3bisz+lT/AoepQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lZaXvMVmQRcD4rZPFe8XeI78B8Tp+TsFEBgaxsybh32uoPLiGpEPbNzPTXAWUYaMZkj9w5toasKnOdWPXOePc8DgIoT42vrsltJNxpczila6JoeFTG1GUXdQCLheIBgwnYjQG+Egmz1z37d0i4J1WIwRF4V3HuDn7oshf8+88CI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qTw1v/MS; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2t2Y41Ssfskj8G3qr01InY5EVthXzams8vjqdzNoWPrhLXkDz9Tnm+TPCqwOsxiOXgPBg3o3PEmqEy62alJoG/D9/Oqgv5ebWonQ/O1Iyzxmvbz9GBCPzHivazHYFXCZp6LtZVBEMkmpZ9ZU/y1dmWUft6CDqyfZEvqHl3RiATBpjdht6INBgfmSj6ESczmzU6tGF4jx3K4TFNJg/N6aMxZEuoa5bfqRqA9q3Yj1WYmQyGvSkZsy2HgcMDqTndLZqtrg3DjxNmWUHsPznyBZUt+CkPB9SOpfXvelk5mqptaWgGs5MdLPgns/h3QQlYNie1uj428LO0M030+jVQ/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjBfWbrDmKmoEPdOnxY70COjaExVEpnrrlZb4lk1P98=;
 b=Cu9PtTsfwmPIXudEUZ/C/eDogDPmCr/GJf3auR9eer8FTst6K61vSihnHXCKo0rthZ9rICysJhAOvPg8DXdF4eG/K9vJNN7soplGerIxDF4xmRTDb81JonjpZ5ZuUTbp9K+qAH9ZNNzy/bbz2q1PpWo+rkQQXU7HAZr2xuudVJRrI9EGAUZ2mW6I1UQt+cI4dlzdEiGbjpgOldcH7LsWaEJ+a07024+AxOlmB060ZBeQYokffM7M6KxfBSJW0+qa/F7L24bgBn3RrRxqFtXEzlMOv8bDLk1CWvRjP4E1EPwfKuBmDph0vTBvw6S/xyl0dy5WqkXbusZiIxdFIy2jcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjBfWbrDmKmoEPdOnxY70COjaExVEpnrrlZb4lk1P98=;
 b=qTw1v/MSq+kkodx+w+6d6SZ4yV43T35UjRw6yDxbOXD/hDRlj/ptyVqNuJOgwK3yn6lP4PNylqwjpTmj2KxKsmaY8PJrQEgkHYVULQfOUtbph06Sn6/nSCTAPGPV24XozYMM7N2NaBypyHVF7/a3aY7mhHtvTIR7MIQRE3Fl/oY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB14980.jpnprd01.prod.outlook.com (2603:1096:604:3ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 09:07:44 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 09:07:44 +0000
Date: Thu, 27 Nov 2025 10:07:23 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jian Hui Lee <jianhui.lee@canonical.com>
Cc: andi.shyti@kernel.org, arnd@arndb.de, biju.das.jz@bp.renesas.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	fabrizio.castro.jz@renesas.com, geert+renesas@glider.be,
	gregkh@linuxfoundation.org, jonathan.cameron@huawei.com,
	kishon@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com, p.zabel@pengutronix.de, peda@axentia.se,
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
	sebastian.reichel@collabora.com, tomm.merciai@gmail.com,
	ukleinek@kernel.org, vkoul@kernel.org,
	yoshihiro.shimoda.uh@renesas.com
Subject: Re: [PATCH v4 06/22] mux: Add driver for Renesas RZ/V2H USB VBUS_SEL
 mux
Message-ID: <aSgUpIGfpYXgH1-X@tom-desktop>
References: <d4152c7008cadbb1fbfaab3d7946b036dcdbcca8.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
 <20251127022841.743277-1-jianhui.lee@canonical.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127022841.743277-1-jianhui.lee@canonical.com>
X-ClientProxiedBy: FR4P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB14980:EE_
X-MS-Office365-Filtering-Correlation-Id: 930e6f85-45c8-4dd6-3a85-08de2d946d04
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?53rawD4Zl4fOotsvgrMPGYPJ8Z2Mf8Ke9bSqkY+xCJzvG33i+VoiDR6TzvlD?=
 =?us-ascii?Q?BbqETYYuOQkX2QmvwZUbvAZncwrp6zev5Nr41+QaEUF1634F03vftzIZ3G9Z?=
 =?us-ascii?Q?MkN9LyyXG6ZLdG45vqvDVQFo5vs4Tj/foMTe45ohWWOPV0p0Ak51PCMKvX9i?=
 =?us-ascii?Q?lSs6cUjbK5xpTtV4VNqWjabHbXbVhcvouZKRgBFAlDocH6g4tYVJu+obgoII?=
 =?us-ascii?Q?S/V6rPLuRm/UiFGI7orHgEZZko9dhoS8BryzHGC4wsRFSqUmhluEyGQ+Te+k?=
 =?us-ascii?Q?sqKIjYUbD17x65u+CFhGIDbpYRvr6jfLoCPY6MxdkvcYyoLMKH9spwMgGca/?=
 =?us-ascii?Q?4+jALRGEXS0orCcMCI8Q5dppIVRtli+fTKJQ1Nb0Ys8JLUKYqVveyFGjtyz5?=
 =?us-ascii?Q?73170Hit5EsTGi7dHzqIdEWxN5KPLtF2DNFFc2xYShqdE/4Fblc0khZwVxJn?=
 =?us-ascii?Q?buALLpvqEEOI+vq3ZvoTe3ILBg5rmytnMa/Re4ozNBep8KvMgeODZqMr+p6a?=
 =?us-ascii?Q?423ASTqe5VI7AuuM40Kn65pl49qLCTZYzdOjnJVYRJObykaV1C+75RvQHU9v?=
 =?us-ascii?Q?3LnAHlz9UWwRlScOVeqtpYnoeYaSZPW0DXSSvWj6GRIj57NBw54S2HqgbyMD?=
 =?us-ascii?Q?MiCs34/f6E48z/2pVTLZPikmiy6n8QxPOW9L6AdTrmFKycF+lyL0pIlQTPA3?=
 =?us-ascii?Q?FIPfVNz939CWl5GNE6OV7cHHwsdya1RlaG3FLlhUnciA/NKZxXbGFu3xUvu3?=
 =?us-ascii?Q?EiiB7TMFiTD3RPoFm0J7eI1uCmt0suXKz6RWrzEft6v4egWfIVFipK7JPFaJ?=
 =?us-ascii?Q?+KfyuNiEcgHfSJvrdfpoMy5Eq/UHLOe1I8aH2e/VylcIqqtAu4kRYeUVBlRy?=
 =?us-ascii?Q?vIXpOOJAdKRQLJWV842RfkHOSVBcrrj7UkneyroeJ93Xp6WyToqD/MNV+sQW?=
 =?us-ascii?Q?VaYpye+0DVudTP3cweO2dcZhyGYFBNhfCDRfVCnGzWixabXfb02B9EQH6MH6?=
 =?us-ascii?Q?z4VQivEqFOYfOQwS3Gqj8VniYhYnn8NuQDRkrovUdjhXzX+WPBelw8rhnXpy?=
 =?us-ascii?Q?ju1vnmU+k0T8C0RqXVB00MtMFGruj+JRtf7CyGBC8eB1q+x1tGJZMHIbhVGo?=
 =?us-ascii?Q?X0baOFLTy3syQoEvSgrQpTfzpr0//Hub0YJEXlrCJ6MlkAsTMJqGIuYDPKGk?=
 =?us-ascii?Q?QeLPH4N/XjRTp70o89ubGAmjP4CTueEPMsJ4trfjuxil/mj4AxL8TxKyCZeJ?=
 =?us-ascii?Q?Ih/pGfdBzQLigE94YYRnfq1gyCn5tKXTHrzhpOLH+ldBYw0shVY+Pxib8znw?=
 =?us-ascii?Q?CVNK9y9XkdZZMzGu7iQlOPDAOxj2vBZQa20krgEMXUQG0K/VK08tEC76FLis?=
 =?us-ascii?Q?lPI3EQ8jC31y119e3nCTR4+09fZ0MM14KgvZmn9D2hAL70ZOntOXFTAuLnF/?=
 =?us-ascii?Q?108kMVmlHGdezBMgK2megGTQvZ/KRkF5yMSnnryQBB+X85yGIYq2UCduWioY?=
 =?us-ascii?Q?zfKQqQRDh/PGnC0gj9PUGcPeG0v654tsiOY+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e8N+yhsJrB92ERODx8gRwiG0Gj3xqouAWIJoUkEeiPYW/6ZHZvY2aeiEqHw8?=
 =?us-ascii?Q?egjw1AcaFok3jP54Zc2p4Uh545SBvgzzIqZCmKyrR6sM6WmWyywx0xC/dkuW?=
 =?us-ascii?Q?qXtnd47xABPkDnI6vWMyK7RNyGUPc02f4F1neki5TGp208uPhFYhF16ftpoQ?=
 =?us-ascii?Q?1LUoGVnvl3NsXWc+azAPhef9yn/vWKprcfBlEGSmQMwvNlfFHzpY2MNu/5Pp?=
 =?us-ascii?Q?niNxrDV8cKM17njo+YQ43eEu1rji1ZmT7Gw5HyctGKLXomSb37WMF3zhtBGq?=
 =?us-ascii?Q?9sAneOA08O0duJw2XD32zxxIe4MG8/u9YR/8Aj2e9hCAZk8CHP+vg/dapb9h?=
 =?us-ascii?Q?LV/SH3ygjG0v4gA1fnreeZ4kCxQwE55r/WDJHdHnh9lJhd7I9nPH/5ZUMPpJ?=
 =?us-ascii?Q?M11QZONZfWYWVYslMHDBk5nHUM0SJKmj5vXec2LrKQzjOr5NadTONdw/wyVU?=
 =?us-ascii?Q?PE/idGX6aYFIDUJOQskEWpzvlpDX1lQYXwfLF4CBSX8ggeAR65UDm+YKrQe0?=
 =?us-ascii?Q?zZghYFFH0kb1bEkqdfae8s9oX8H0U5V9IrWAAMOjvc9vuuveiTRoThJ6jv/m?=
 =?us-ascii?Q?6qEyhnrHeDlD2UOdrM16yrLXdz5L8VFYQa0ADP8gobaUkkTdU8m7lpjL2SRm?=
 =?us-ascii?Q?xcFpBhfZQYK+OOkVtAqWSQvVN9n9LKp5kJCf97JDpqsk8OkXYv9M8+TytqBA?=
 =?us-ascii?Q?bWYJdQRuUxsIz1PHzOs72SGQqnzo1qBJB48kgOeVXiYnlUyreHjm0Ln/2Lyf?=
 =?us-ascii?Q?XG/+0aGwPWxTWhAOD4ZY7bn2RdbBEdyCI/Q73VZuUcixRKo3M9t3un71+Qu8?=
 =?us-ascii?Q?6sF8SpJcsEhP/Q+mxXFYckyOnO3bBcdsoKv2UMXJxSd+GKaipeiPxvIy/IGE?=
 =?us-ascii?Q?6C08esx8U8kiHWc2GY/8A5DX4k2KaUEKGMsyzhnN3nmyKnZeuiXCuLyF729R?=
 =?us-ascii?Q?UZkgzUH3fd8z4COyxuesW9EjDO4ju4WsA5+x8bl/53QZlvwOuAVG1wMbH/oD?=
 =?us-ascii?Q?/ijldMpMQuuP1Nd0yzOmIGWJKCK9w4rouCfJ6zKmPP7kDHHPjKnTEaxC2EKg?=
 =?us-ascii?Q?ixze1IzPd7GU+bFUOCqgyk1L2GG4xY+JfMpuheYNK7rlBbQnCO8jjFKwjnJE?=
 =?us-ascii?Q?A6pbjv/8bTQcCOAnK+bmh1DWkwrGws6f6bbaRB8XWwebZyGUKVd/Fduxkm/i?=
 =?us-ascii?Q?viViR+ZENjP4GPIRYES0JUiARvl+E/mypdHb4CE3kG1QNCwBSCplNMR7Y2Tf?=
 =?us-ascii?Q?cmjzx11wg+Hkb1L1T0yH8iF3HK5aU5EdAaAIMXoDBs4BVmDp7KlLbGYF7OFg?=
 =?us-ascii?Q?0gKbkni/ttzojmnaAgVDK/wtFBV1ZwFd0P9D+Yf9n0k2iuc0zVP0TxKukXxT?=
 =?us-ascii?Q?A8qXe5gAa4ObfrW5n08sShEBV6RDeFWIiVZiXtJsO5kRHr0O+sHJQdA5+iB8?=
 =?us-ascii?Q?DE0LwlDFawhuTtiKEN0TTZwrAqaslou0VQZmDViCLNk17Vl240cDR7Tkag3X?=
 =?us-ascii?Q?9ZeFqFCcwWpZKsDufzjB7CTyvhGFpS2ZkwnAmJB/OTWK+l8E8zJ636QlT8e9?=
 =?us-ascii?Q?q3y0gPpb1jwfeIAPtM3Nf1F/tHQOrfDBVIKKwf3ZcFSbjgZSXE7gP1/BehJU?=
 =?us-ascii?Q?k6SC5KhM/qoeFUo0peKckcE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 930e6f85-45c8-4dd6-3a85-08de2d946d04
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:07:44.3346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZU+dXWcxfhYQSeu9l10e1hMceRJhcQMuF5YE0ZmrQJOpF6d4m2WLO2eJ7HkVHZdujFK3huZiHO+HJA7jKV48sJhrnfTBMfBJPnm4sDkDUuIjBr5CbrsEzmb2gu8+0g3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14980

Hi Jian,
Thanks for your comments!

On Thu, Nov 27, 2025 at 10:28:41AM +0800, Jian Hui Lee wrote:
> On Fri, Nov 21, 2025 at 04:11:55PM +0100, Tommaso Merciai wrote:
> > As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
> > bit of the VBENCTL Control Register. This register is mapped in the
> > reset framework. The reset driver expose this register as mux-controller
> > and instantiates this driver. The consumer will use the mux API to
> > control the VBUS_SEL bit.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v3->v4:
> >  - Removed mux_chip->dev.of_node not needed.
> > 
> > v2->v3:
> >  - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
> >    is an internal node.
> >  - Fixed auxiliary_device_id name.
> >  - Get rdev using from platform_data.
> >  - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
> >    as it is needed.
> >  - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.
> > 
> > v1->v2:
> >  - New patch
> > 
> >  drivers/mux/Kconfig                       | 10 +++
> >  drivers/mux/Makefile                      |  2 +
> >  drivers/mux/rzv2h-usb-vbus.c              | 97 +++++++++++++++++++++++
> >  include/linux/reset/reset_rzv2h_usb2phy.h | 11 +++
> >  4 files changed, 120 insertions(+)
> >  create mode 100644 drivers/mux/rzv2h-usb-vbus.c
> >  create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h
> > 
> > diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> > index c68132e38138..604f625544ed 100644
> > --- a/drivers/mux/Kconfig
> > +++ b/drivers/mux/Kconfig
> > @@ -59,4 +59,14 @@ config MUX_MMIO
> >  	  To compile the driver as a module, choose M here: the module will
> >  	  be called mux-mmio.
> >  
> > +config MUX_RZV2H_VBENCTL
> > +	tristate "Renesas RZ/V2H USB VBUS mux driver"
> > +	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
> > +	depends on OF
> > +	select REGMAP_MMIO
> > +	select AUXILIARY_BUS
> > +	default RESET_RZV2H_USB2PHY
> > +	help
> > +	  Support for VBUS mux implemented on Renesas RZ/V2H SoCs.
> > +
> >  endmenu
> > diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
> > index 6e9fa47daf56..9421660399af 100644
> > --- a/drivers/mux/Makefile
> > +++ b/drivers/mux/Makefile
> > @@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
> >  mux-adgs1408-objs		:= adgs1408.o
> >  mux-gpio-objs			:= gpio.o
> >  mux-mmio-objs			:= mmio.o
> > +mux-rzv2h-usb-vbus-objs		:= rzv2h-usb-vbus.o
> >  
> >  obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
> >  obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
> >  obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
> >  obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
> >  obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
> > +obj-$(CONFIG_MUX_RZV2H_VBENCTL)	+= mux-rzv2h-usb-vbus.o
> > diff --git a/drivers/mux/rzv2h-usb-vbus.c b/drivers/mux/rzv2h-usb-vbus.c
> > new file mode 100644
> > index 000000000000..9513bc8f35ff
> > --- /dev/null
> > +++ b/drivers/mux/rzv2h-usb-vbus.c
> > @@ -0,0 +1,97 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Renesas RZ/V2H(P) USB2 VBUS_SEL mux driver
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/bitops.h>
> > +#include <linux/err.h>
> > +#include <linux/module.h>
> > +#include <linux/mux/driver.h>
> > +#include <linux/of.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset/reset_rzv2h_usb2phy.h>
> > +
> > +#define RZV2H_VBENCTL		0xf0c
> > +
> > +struct mux_rzv2h_usb_vbus_priv {
> > +	struct regmap_field *field;
> > +};
> > +
> > +static int mux_rzv2h_usb_vbus_set(struct mux_control *mux, int state)
> > +{
> > +	struct mux_rzv2h_usb_vbus_priv *priv = mux_chip_priv(mux->chip);
> > +
> > +	return regmap_field_write(priv->field, state);
> > +}
> > +
> > +static const struct mux_control_ops mux_rzv2h_usb_vbus_ops = {
> > +	.set = mux_rzv2h_usb_vbus_set,
> > +};
> > +
> > +static const struct regmap_config rzv2h_usb_vbus_regconf = {
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = 4,
> > +	.max_register = RZV2H_VBENCTL,
> > +};
> > +
> > +static int mux_rzv2h_usb_vbus_probe(struct auxiliary_device *adev,
> > +				    const struct auxiliary_device_id *id)
> > +{
> > +	struct reset_rzv2h_usb2phy_adev *rdev = adev->dev.platform_data;
> > +	struct mux_rzv2h_usb_vbus_priv *priv;
> > +	struct device *dev = &adev->dev;
> > +	struct mux_chip *mux_chip;
> > +	struct regmap *regmap;
> > +	struct reg_field reg_field = {
> > +		.reg = RZV2H_VBENCTL,
> > +		.lsb = 0,
> > +		.msb = 0,
> > +	};
> > +	int ret;
> > +
> > +	regmap = devm_regmap_init_mmio(dev, rdev->base, &rzv2h_usb_vbus_regconf);
> > +	if (IS_ERR(regmap))
> > +		return PTR_ERR(regmap);
> > +
> > +	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
> > +	if (IS_ERR(mux_chip))
> > +		return PTR_ERR(mux_chip);
> > +
> > +	priv = mux_chip_priv(mux_chip);
> > +
> > +	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
> > +	if (IS_ERR(priv->field))
> > +		return PTR_ERR(priv->field);
> > +
> > +	mux_chip->ops = &mux_rzv2h_usb_vbus_ops;
> > +	mux_chip->mux[0].states = 2;
> > +	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
> > +
> > +	ret = devm_mux_chip_register(dev, mux_chip);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct auxiliary_device_id mux_rzv2h_usb_vbus_ids[] = {
> > +	{ .name = "rzv2h_usb2phy_reset.vbus-sel-mux" },
> 
> hi Tommaso,
> this string causes buffer overflow, could you help to check on it?

I'll send v5 with:

	{ .name = "rzv2h_usb2phy_reset.vbenctl" },

in v5.
Thank you!


Kind Regards,
Tommaso

> 
> [   15.349036] strlen: detected buffer overflow: 33 byte read of buffer size 32
> [   15.349083] WARNING: CPU: 0 PID: 518 at lib/string_helpers.c:1035 __fortify_report+0x64/0xc8
> [   15.349110] Modules linked in: mux_rzv2h_usb_vbus(+) rcar_canfd(+) mtd sm4_ce(-) can_dev rz_dmac(+) pwm_rzg2l_gpt binfmt_misc dm_multipath efi_pstore nfnetlink ip_tables x_tables autofs4 btrfs blake2b_generic raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor xor_neon raid6_pq raid1 raid0 linear rtc_isl1208 micrel phy_package mmc_block raa215300 rpmb_core dwmac_renesas_gbeth spi_rpc_if pcs_rzn1_miic stmmac_platform stmmac polyval_ce renesas_sdhi_internal_dmac renesas_usbhs ghash_ce panfrost udc_core pcs_xpcs renesas_sdhi_core reset_rzv2h_usb2phy gpu_sched tmio_mmc_core xhci_rcar_hcd ehci_platform sm4 phy_rzg3e_usb3 phy_rcar_gen3_usb2 rzv2m_usb3drd xhci_plat_hcd ohci_platform renesas_rpc_if i2c_riic gpio_regulator gpio_keys fixed aes_neon_bs aes_neon_blk aes_ce_blk aes_ce_cipher
> [   15.349359] CPU: 0 UID: 0 PID: 518 Comm: (udev-worker) Not tainted 6.18.0-5.5 #3 PREEMPT(voluntary)
> [   15.349371] Hardware name: Renesas SMARC EVK version 2 based on r9a09g047e57 (DT)
> [   15.349380] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   15.349390] pc : __fortify_report+0x64/0xc8
> [   15.349400] lr : __fortify_report+0x64/0xc8
> [   15.349408] sp : ffff8000854fb830
> [   15.349413] x29: ffff8000854fb830 x28: ffff80007c7a41d8 x27: ffff80007c7a4300
> [   15.349430] x26: ffff800083c4d780 x25: 0000000000000000 x24: ffff0000c5de9de8
> [   15.349446] x23: ffff800081d23b68 x22: ffff0000c004b200 x21: ffff0000ca6dd080
> [   15.349462] x20: 0000000000000020 x19: ffff80007c7a6140 x18: ffff800084b870a8
> [   15.349477] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [   15.349492] x14: 0000000000000000 x13: 323320657a697320 x12: 7265666675622066
> [   15.349507] x11: 0000000000000000 x10: 0000000000000000 x9 : ffff800080208f0c
> [   15.349522] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
> [   15.349536] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [   15.349550] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> [   15.349565] Call trace:
> [   15.349572]  __fortify_report+0x64/0xc8 (P)
> [   15.349583]  __fortify_panic+0x14/0x18
> [   15.349595]  auxiliary_match_id+0xf8/0x110
> [   15.349608]  auxiliary_match+0x28/0x60
> [   15.349617]  __driver_attach+0x34/0x2a8
> [   15.349629]  bus_for_each_dev+0x88/0x110
> [   15.349639]  driver_attach+0x30/0x60
> [   15.349649]  bus_add_driver+0x178/0x2d8
> [   15.349658]  driver_register+0x74/0x178
> [   15.349668]  __auxiliary_driver_register+0x7c/0x150
> [   15.349677]  mux_rzv2h_usb_vbus_driver_init+0x34/0xfd0 [mux_rzv2h_usb_vbus]
> 
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbus_ids);
> > +
> > +static struct auxiliary_driver mux_rzv2h_usb_vbus_driver = {
> > +	.name		= "vbus-sel-mux",
> > +	.probe		= mux_rzv2h_usb_vbus_probe,
> > +	.id_table	= mux_rzv2h_usb_vbus_ids,
> > +};
> > +module_auxiliary_driver(mux_rzv2h_usb_vbus_driver);
> > +
> > +MODULE_DESCRIPTION("RZ/V2H USB VBUS_SEL mux driver");
> > +MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/reset/reset_rzv2h_usb2phy.h b/include/linux/reset/reset_rzv2h_usb2phy.h
> > new file mode 100644
> > index 000000000000..06247080a66c
> > --- /dev/null
> > +++ b/include/linux/reset/reset_rzv2h_usb2phy.h
> > @@ -0,0 +1,11 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _RESET_RZV2H_USB2PHY_H
> > +#define _RESET_RZV2H_USB2PHY_H
> > +
> > +#include <linux/auxiliary_bus.h>
> > +
> > +struct reset_rzv2h_usb2phy_adev {
> > +	void __iomem *base;
> > +};
> > +
> > +#endif
> > -- 
> > 2.43.0
> > 
> > 
> > -- 
> > linux-phy mailing list
> > linux-phy@lists.infradead.org
> > https://lists.infradead.org/mailman/listinfo/linux-phy

