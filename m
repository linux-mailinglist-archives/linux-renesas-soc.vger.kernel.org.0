Return-Path: <linux-renesas-soc+bounces-25240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63345C8E1A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A07F83ABC20
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A4532A3C5;
	Thu, 27 Nov 2025 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Za8jsCXY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0C5258EF3;
	Thu, 27 Nov 2025 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244176; cv=fail; b=uSVRWThMPa0m3Pomj/PmSlCSs1faKU5ux5SujJUKY3Lwlf8Ls7JPwSgTJIvgtbqnuaI65/N8gpoFIFvObXaog5sEN50f/KAm5f/AtNVu+XqgpfqAPFYlMoHnlIFWvojhJrdD3zcCOzrzA5S/DxYolZ6okS67IG0ttu0dixCnE68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244176; c=relaxed/simple;
	bh=LEGcPJzLsZijwlE5lYLN8V7oy95ofnYMM/xaUu+m9Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P7FCRk/GLz+XEiOvl+oFU6VP4yjaHeg7ozPbfDNtjv6QJYwnZqVzNtmHjCxT4OF5dnP2a4s0aTeydrQRHrdq79IE0QA8zp/rfnMXCZj7jggWTARkJ+v/jUb3jgdc79nI1HZQVs9Rwn22WLHSiEbLgIkHInmCY5FnsCJjXO3KJZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Za8jsCXY; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlmhY0JYR1FMtnOlL2IS+GNM4gOqzWVhvW9qsTRfQN/ooi27Joz8nCsixWgNcVIvWAPK/P1pkXWIHPoeZHUrLEjhsFWzfqAH5A6x3YUc6Hhd7Tf1bVNUSD0ifPovj16cD7X9hZ7ix9o0e2xTAbqq2Si7fV4zGTv7AWH1A06cgOGsTMdWtyGJJWJMXyH5PPgmdU1Ls4vnZzKsojfGiP/dyLAv2k39MUrLJI2HrsTzusHKYbEnD4c8kzCCmn4Nba34/ziAqcGgcXmgnTAltfQl5ALglTHqd5JemNBc3MnYy5sWgKwEx8FMKCYYvmXvAKQi2YkslWfZqth3yzCMP67zNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxTineTGqQl/2JzTlBXLAw5d0jAGhevvQjnQeqs5THU=;
 b=IqucHO0p410JGvuhMz4Gn8a5ExT/+5gdOR0IedRSk8TEe/FooO7jV9uCz+CydMwxS9QWhky7CxFM1MnjrWt4939J2RVkZYeN7Vb/cyHe86tN3K7n1SDvXXlnHYWizb4ZdlmzTWiBVuIbE8BywCXQwZM4fVjZ2DwA+ArGN5rUu/uFm/UZD7bklttOVp+bsYS9SUnA+iUtzQt/L2W8+oQmGNzAvg5kJj5fPq/j9pkRpZrMjRVRiE4lXVy4xCv5Zb+kjwV9UEvLmfWEfQzNHdSOv3DnHjjpST8Gydf+X0DTQ3xaeZfwcXfVaWHiJbJ8Mav2G8lZQMmWGsCpto23bWwvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxTineTGqQl/2JzTlBXLAw5d0jAGhevvQjnQeqs5THU=;
 b=Za8jsCXYE3kZW8F5YJpOR7D/PqAzQzxnsN47ZxPZ4o+aGnMtx4KOkWkkol6OEUN4oqM49aYdtlHmia35GGB5kXvIgvalm//8xJS897yYr5oGsSH2ZX3YInomiJeTIm1nRID/XYL2qZselLvskIYA1KflKgGP8ZBAqwub1dN5Mjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9632.jpnprd01.prod.outlook.com (2603:1096:604:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 11:49:28 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:49:28 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 00/22] Add USB2.0 support for RZ/G3E
Date: Thu, 27 Nov 2025 12:48:27 +0100
Message-ID: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b414ecc-3de6-4a64-7429-08de2dab0554
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+wDmauD/0dni5NxITHNXBo3OpLL0j+ftOdpUF1viZOKFBmEF0oX2uYSw0XPN?=
 =?us-ascii?Q?pf2EiNslNPygSvGwWrDOtx8in+slkXAUxl6qaGcn4d8Va+vY21+hJCe7Osvd?=
 =?us-ascii?Q?qlvJ0+rDLuTmWP3CveOuv124a26CNYi8Rc+suHRujIko+8QcqtHec8KK8HMU?=
 =?us-ascii?Q?mBGKxbP/73JQYHob6nMEphNWbl47dPXg7VojNSFcVPTGb2miIPCo8EGSP3gN?=
 =?us-ascii?Q?TaKVuANsFKpTjQuqQsPzj+4wc6G2+iqUZhI4xfeqYFJtXe4RDH35jM6H5YHO?=
 =?us-ascii?Q?p0/jNOPcH+xjZP/0BfhuLgRNqoE/EEkHOk4uFNPeJBU+nnEAaVKtI2UekEcj?=
 =?us-ascii?Q?9QyCEjcoUl0cI0lnqYAdEnsDGKDd6TED6vXIjdeiAMCPv8PpXYPnBtvoACrB?=
 =?us-ascii?Q?LLImEOxVzYMi95RttLdVj4ePYgWsFxI5sqQkUTkDZfo3QSOx+0ht9Fo+q9I0?=
 =?us-ascii?Q?l8vxG3NQDVmuYHmRpvCTux2cZeFhCFb/9jLNnbSGRxIYQslwNyQ0dWqy8jz0?=
 =?us-ascii?Q?Z/eQE8FA5/3OKoowCfrP+R8vgRKu7bxE6GohqQpKnAjeCW96qeBwW5rE8qT3?=
 =?us-ascii?Q?HOJfH0gcyyJWJyIqB9NXlsJnImmPljEPdNy3xRNABxEUBMFcgMkcBu/SsJua?=
 =?us-ascii?Q?yP6pJQgjMXSqcqQlxGdJBR18YCJmShbpMahLdj5u2qOjhtRXXZlNtpOVGTHt?=
 =?us-ascii?Q?9cLHh3Brq2orTuQASB9H7DRVenBpyRwFVDOkFtlf0uUJ+iEwJUNS1F43gHBz?=
 =?us-ascii?Q?683ynPPDfC/MTfIx5/ZTLwMNZFSjEtCOsiSITKqGjVzlzjr6Wv7oy/ZL01k9?=
 =?us-ascii?Q?8eBmICA485znuvQeAskmtx5zLYBEfSf2uVdbkMOsTDpiUD37BsjvZgg50rYh?=
 =?us-ascii?Q?lc0hTvP946ntHdb7Lgi4B1ndy/QLZEDYgyNvcNc26AelKdx/flv1AQA02lPn?=
 =?us-ascii?Q?LTEt87jXfun+jovTLfQzlrh09uJE2gs3ZTQ+Cb79xpcj30unmV5vK4kICJJa?=
 =?us-ascii?Q?i+v2m9BalkOTEjK91ez8hHNpOKcgvAt7JUOvpFFWEc8vWHtJcPQ+v2xYjT+Y?=
 =?us-ascii?Q?jCACirD7+2J3IP6uTL+qjZqwdUOCsicdwswE6VTti28d8RsCrTiRupfuUkw6?=
 =?us-ascii?Q?VXhD0Jx8amj9uuKDvSYzpTnmHHi0CZMq5PS3LX5T7/iTyv8UUh19kFhxLaOK?=
 =?us-ascii?Q?Au3QrCXNXTTGeAPw9TkMEkJtaSJ9TntrBMwXvephmTrIodMaKt0cHS0XZuMR?=
 =?us-ascii?Q?4zH055iOAK7Ng1LSvowFmera6GItEjkAI2UEUp4F27xgWapw1ZwAgZggWLAV?=
 =?us-ascii?Q?m+UtZ4qqe3FHMdLC0ypM4DW1mji88R+BwPEghaDmqwSr/zh5oYPmkASlTZnz?=
 =?us-ascii?Q?clTRLREOZGpkLnF7hvVsVwCoFiFflLi0DMgm4CkqV/sRcHO9EWSYQKGxvSwA?=
 =?us-ascii?Q?Kf+l2858Uqn8R4vcV59o3m8Zm3QMStDhl/lJo3K0eV3ALrCUQwAK4YSsVgTc?=
 =?us-ascii?Q?Xy/4ZHyl2GxMr4OAEpMcjZVKpupmAwu/WUXR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jBwJfdtyDJ3ZhdDOARr/xOqsBgB29IzfxlagSAZk4Qtul4gI+5vNXWrYSHYJ?=
 =?us-ascii?Q?Iy0RciycM8E6uIowtNRg0Bl8enTmrEeWx5BpLr/omGyRYN7J7K+60LLu3l7w?=
 =?us-ascii?Q?UOwBV8DdE+Ytv7/9h4ejBL98tvv4wDX5dQDpRDiKOLTSHtDO+PfNaW9eIc3/?=
 =?us-ascii?Q?hqR5ajkp80E0Zbb5UJ9SsyoVb5u3PCJuUlUOW7z3pmSbQ9Jn7KcFB8apqEFz?=
 =?us-ascii?Q?qr2ABvotZfV7mPgB8YT3rfh/vJac+wKW6yBadtxAuSpAN7yMRBmFdjlt4JtZ?=
 =?us-ascii?Q?lTx60sBASQSlKU48L/COeJkpgOvXOG8ph/6sP8e7qRaBJ65kVeP7FPz1Eprx?=
 =?us-ascii?Q?0gaHLmoCnDiixKjmMFAzR3PJ204n6H3oyiFpScWn6uc0b/SHK1YBuLje30xi?=
 =?us-ascii?Q?SBsb6a/aeD5H8O6KTczWMPugj4yFcLxs7F/MFawCIfJgnQWq52ksP/wBL97/?=
 =?us-ascii?Q?CJ7VUJt/0X6O7+i8NsvrWgUe1/0VOGuf+QU/q5iBabUUlo7WHKr8mvyjrtxw?=
 =?us-ascii?Q?pJk+BGLe97B/iMTaTg8jwwqv+a0LHPDJ7QCVdt16r3fNGY6d3XI0xIvlnewr?=
 =?us-ascii?Q?BLqXKEMoDQz2oxpqfy70XMiNGP+PS9CfnmZ2IrjYUjjja/AcL2itB5KOmkc3?=
 =?us-ascii?Q?o0mSo4dZqeJO12d7L1bmeoBclJMVpfX+RBwyyWa5RZTMYP/wYCsVzx1i29Cd?=
 =?us-ascii?Q?uqrgSnfNxbawCyDMInKzsqmD3RghypBainhqepgn2+X0mcHF6oqwJF8irICQ?=
 =?us-ascii?Q?vJC7T46j/EQ6iJurqy1CJJrq+a0PD+UrLSdIC8iJ8N2ETQAxrYIUnV/gvQNl?=
 =?us-ascii?Q?LYpwsCrnwAJs5xxyUdpS+7ZF1ykW8x2/7gytAGk+4uSlAEr6MkBGt+xliPPS?=
 =?us-ascii?Q?zHWRY6Txsuz8ukr+cyptd9k+fOvDvlQBy+nT77l5lWtbDXatZ1bzEGOrowYl?=
 =?us-ascii?Q?GIsVVMKnBXs4LiOcl6fySJtW1RQRrHFKZPPOPYuRbujY3oHicHPcvqYwJSxC?=
 =?us-ascii?Q?aAOyQGEOFZ3/wjysGN7vjZl5KvRUs0fo33iWIsd8IjoUn7Hgs6TMEk86CTMl?=
 =?us-ascii?Q?4T1i8591bSN2p43bPUtFO+AKk+QRWXzGUVAZP7LPxiylcp3emJQRCPupaIu+?=
 =?us-ascii?Q?2zfCkNR87spxjsJNfB2A4S1Q/nFUpa6sfMpJaaty3t9MMVvrNE3R25QfQ4Nv?=
 =?us-ascii?Q?S983cvlkbgl/56yWoCbOJ1Gr5RxHsQan+fcqLl8b3/TBuQEvQIEebHqEdhKu?=
 =?us-ascii?Q?xVj2RuzL78mNfHMcMRCbCJaCng3vo+imLNlVOqpjj9xmSCMjyMz6GJ/t5RbI?=
 =?us-ascii?Q?ghAJjzfDDlJhh9Aa31t801hB5D1yAjnFSOqq4N5w8onf09veRCkZtwf/Y1Bf?=
 =?us-ascii?Q?8G7+vfcXUXx1Hgj0qoqkKt0X9+bRA3OhxQcbX5pco/flAWJysX4g2xpk/7wz?=
 =?us-ascii?Q?XSVx+WrHMLNtDKgOJoA6FPUZKqt35CQpOAjLEGwS/PtYy0CrEx8orG5tAOi/?=
 =?us-ascii?Q?r4iavTWvtXgZOejjgjsUuk9JAYTNIaMhff3EOYfrNPZFcD9JfPhuAlChca+z?=
 =?us-ascii?Q?DJmz67CW90MS8IpuYa4ejvvlg6u15vFZUBD8uJ9D5lk80/KyZdx0Y7jRtu3t?=
 =?us-ascii?Q?NMdRlfCWy4aKM+SRP3kh3AI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b414ecc-3de6-4a64-7429-08de2dab0554
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:49:28.6611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIz1X5KTLoxXZbijtbBCeQUOup3EdckdQC7WAqEKoxyMsa6T1aDaO4bFfliaPSBr4gGuOU4KN/+HS1Utw4tckMGGKSeHKLtOSmgG/WzPPC+xQqPXNff1A5qS4RrG1zcl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632

Dear All,

This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
enables it on the RZ/G3E SMARK II board. RZ/G3E has USB2.0 IP that is
identical to the one's found into the RZ/V2H SoC (R9A09G057).

Thanks & Regards,
Tommaso

v4->v5:
 - Rebased on top of next-20251127
 - Patch 01/22: Added Reviewed-by tag from Conor Dooley.
 - Patch 06/22: Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
   Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
   Updated commit msg.
 - Patch 07/22: Update mux_name to "vbenctl" to match the driver name.
   Updated commit message.
 - Patch 11/22: Fixed if statement for mux_state error check.

v3->v4:
 - Rebased on top of next-20251121
 - Added patch 01/22 to remove nodename pattern from mux-controller schema.
 - Switch back to v2 implementation for mux controller in patches
   5/22, 15/22, 16/22, 21/22.
 - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
 - Removed mux_chip->dev.of_node not needed in patch 06/22.
 - Collected CDooley tag in patch 09/22.
 - Added missing select MULTIPLEXER into Kconfig in patch 11/22.

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

Tommaso Merciai (22):
  dt-bindings: mux: Remove nodename pattern constraints
  phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
  phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
  reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device
    lifetime
  dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells'
    property
  mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
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

 .../bindings/mux/mux-controller.yaml          |   6 -
 .../bindings/phy/renesas,usb2-phy.yaml        |  15 +-
 .../reset/renesas,rzv2h-usb2phy-reset.yaml    |   9 +-
 .../bindings/usb/renesas,usbhs.yaml           |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 125 +++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  49 ++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |   7 +
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   5 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   9 +
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   5 +
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  23 ++
 drivers/mux/Kconfig                           |  11 +
 drivers/mux/Makefile                          |   2 +
 drivers/mux/rzv2h-usb-vbenctl.c               |  97 +++++++
 drivers/phy/renesas/Kconfig                   |   1 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 261 ++++++++++++++----
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-rzv2h-usb2phy.c           | 108 +++++---
 include/linux/reset/reset_rzv2h_usb2phy.h     |  11 +
 19 files changed, 643 insertions(+), 103 deletions(-)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

-- 
2.43.0


