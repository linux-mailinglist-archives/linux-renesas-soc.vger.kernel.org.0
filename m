Return-Path: <linux-renesas-soc+bounces-27617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG1hCbGPe2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:49:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D07CFB26AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B163300DEE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 16:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C29342CB1;
	Thu, 29 Jan 2026 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FThdq5J6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5391133A9F2;
	Thu, 29 Jan 2026 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705379; cv=fail; b=Qykx/VHhULP6SIsjaVqzzPCJzclLUlV9/JZiAN8YdwxsoaXy+0bRDTwrUhqLl877sRKYaJYHprmuOfopA+Ejoiik5lskfdea0ExqkKgn8FwUH4PHDuN6BYg2Ea6fk8V39UKhw779JvUdr5UpQc5YQ6RLD/JKKckmpgA4OzJ4llg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705379; c=relaxed/simple;
	bh=UMvBnRvmxJUuxIFbWHTGC8x7hfSdrOV30dcSP8CuADM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b1MK5owlHQn4qekPWAtOP9+zvlWOVcuGJYsWgTj1O9oaxjpNpoe8v2WGMTuPoHqu6WVtxCQFeIiwVawhlABflrrUpdQ5OH0v/nnn8zqCKiDkVdvXg4YhtSEmMlztPBhK1MU9R9xu6yxpGpKTPc9YyL9lSWz2UBB7pSKBD7d3BZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FThdq5J6; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoJuOXkpRmh+72bZyNMnzYWGmwSLn5JIsC7/plftQ5sQDITuIC06lAXcSE8mVRI0pR5uKaVMfkqgD0JPl6tC6UZmV+uiXeYaJNUQUoPR3IxQ8nhf/aLEgnSRQ/s+Dr+0JbU2bhK/3R3ouyYfeCzuePpEM295s754GpJMYO6mkay+1+6cv2Ouc8UKUIAL4S+dR/IqVzrXak0l7qZ9LHFKRd0e669GZpQLGB00gKH24mFh7v8HPUv0FlORzO2U1e916trWpAnccid8GhVxJkv5IIWY0Zp/ROh9gFNK2AgSqXP2b9bpWUUQdTSsFWc1rPYwXu1DInxIey4jIWXNgfAc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETdOB6E4hPYl+8m37naCtTweSalYFUH39Ne4B4bEszw=;
 b=ePBByolboVRMMuKFJjRzotuN5FUztGUV4ofRn2GgXneimT0ki7YsJrWJFgv20SoAld9NR4tk9NN4kGbnHQI3YavdrtZEL/6vIztofsa/FuHZQM4wxUN6/Bq+JCDTWbS0twHPvVl6Bz6X631IKztjULE4bSATooTRtIwVjPwEmXyZpbPH8EDFlHiXYb9uUb+raGZN0spIJ1NxqwoWo3AL9XcT8KlyYAaBSQTiDpyw0y6e5RJmiqPfrIbbp884+T8eVmTd06cuPZVZEXCVyJk88CMR8us1QPu45OGDdqk6bQI+Myftv97uCDWp/x/u2AXAkt9uAahiq2P3ajrY68hRqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETdOB6E4hPYl+8m37naCtTweSalYFUH39Ne4B4bEszw=;
 b=FThdq5J65mQskY5agPOGeVJO9hoS3vnjLt3wZUa3Cm3VVlO+cf9s+7qXKJwUKTQUWt5uKcforN7/lgmNxdzYu4gMJywaXuYLwPMTnVlE5vUeEKmXq5zcd/BiolvFLE78lnY8dgFU629+mH3zzXSJhqL+wYK20wDb8dc0FcJr3j0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13517.jpnprd01.prod.outlook.com (2603:1096:604:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:49:34 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 16:49:34 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/2] mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
Date: Thu, 29 Jan 2026 17:48:49 +0100
Message-ID: <a02624f3cbbd90bb2b66b15691486711b2b0bd55.1769703480.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769703480.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769703480.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13517:EE_
X-MS-Office365-Filtering-Correlation-Id: ae50042d-ab7c-43c5-2e5d-08de5f566181
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zv8LFP9tde+1bBQEUDiO/QXdQjaz7+cBF3aTyPO/qpIz+qexp3Kj+ZSUbJmy?=
 =?us-ascii?Q?3WF8OnzO6urQUIXmtDDC1iqUVM17P4vkB7ZVmXg8pgOjvxu787Y/6pMKdxlc?=
 =?us-ascii?Q?1PQso6en0WnFVK+Gu4jaEUjvgoznI00eaA18lsD3bCbrDmLtnRRJqoePI20K?=
 =?us-ascii?Q?gVcsQrQbyn2HSeDseUMGzByHW3X1Fl0IvK2xDBSExEojVVJImJS2fCaAk9h8?=
 =?us-ascii?Q?9KGuvLLlVtk5/l0jb2w5i4QKQl7evGYadBwG4XP6848oFzhTPJLqA1ypxRUh?=
 =?us-ascii?Q?llsHWP65VrgajG3/w9y5cpj+RsKbiIHLHnMLMj1Eu2GlETQWXH3qBiGCzsdc?=
 =?us-ascii?Q?rGkKi3UXEwWXsq1d/YObc+axuR+liBlpszdmJ0uXwnwPNM1J3Rjz4GYSRdLZ?=
 =?us-ascii?Q?J44WjIIOpI9qY9O2d02T1WAEkuz5H5f77AbmqvTWzzzAphZVxgys1sVNchI5?=
 =?us-ascii?Q?OQ55ZTez5kk/MCxbjclWfD/Ars2hwegKZanC8BzdnRHITWMSfbMibFA2dmox?=
 =?us-ascii?Q?hiJxyDG7rynjSz11Qvy8DGR2lDi0H6+TGw+8lBH3Tmk00ZgEPf9gXRa0k4B+?=
 =?us-ascii?Q?0iN443+sJ8RY5IXHGUkk0UcHnYHuZhBPbAIhzyCg3We8uNMeUfT9jxchzq4r?=
 =?us-ascii?Q?wm9OTvRvMq6WchVL1hBtL+kYkOb/9cZScwPvIADAluYftJePnXzexDhDhQRV?=
 =?us-ascii?Q?cl/s0lPam7WMr6FdtNMsiFuik+9Evjd0foAPOy34ty4clYHWIl/7OAeU8BTX?=
 =?us-ascii?Q?dKMw8b0KYuLSg2I6ugyJooKRYh2MUfzd0uSW99Hrk2RnmkSaNB3vJwSmRcqA?=
 =?us-ascii?Q?Wg6ECcru1RqMoywJ9eZk1rkYjkp4EDvoSucQJUnm3UqzCarl7XxlH+cdX1kV?=
 =?us-ascii?Q?XeskxY+vD6lOS9R0rOGuTLjI2xyzKWwZbmMWwl6gFZYqsSWllclYpA3HolnG?=
 =?us-ascii?Q?kGoe5n7z1X2uO6cRE8nJlGZ3sCI7XNq3J+I+ehJnLk7gi+IYOIzmJPnhZsui?=
 =?us-ascii?Q?kYSbPAKmBtQ69bnWBHNHzN3gVZ6eTUJu1HkdfZ9soGsIZ/NqX617Q1+GhHHv?=
 =?us-ascii?Q?kxtCoVC+Qg+MLOYz5TQSghyLTefnJLLGajPHAbQYHVF2tNEL0CQP7u4UfPAG?=
 =?us-ascii?Q?VZMFPE+wKo/uL+Am8isy0M3IUmpV7A3i6QphPRzKfFzExNi/VPwh2nXV81DT?=
 =?us-ascii?Q?j+7V+BZWUuifNRhPbA9Xz5SmZl9JeO8F+7LdiEir+3ZTFNFjGPwBBFmwixVF?=
 =?us-ascii?Q?jxvEX/E16TJVvwrQwg8JUZL089YmZMLSID62WJuqS14b7YwggB6mzt47fENC?=
 =?us-ascii?Q?VPjMqWcMQ0JfsYZ1+FI8KxSzj8niZu3IyJhZGiIDtUGm8f53wJThTX+WUclw?=
 =?us-ascii?Q?I7KBmWXwQ2R3J02Yna/lKj4o1Kz9RpV+UfMQPV6vRWSuFVdHysIqsMa69VdW?=
 =?us-ascii?Q?rdlfXejRmFQ2jrzANXkU4zM31eA+ir4pdt+jbXfYJi017gEy/cfEBU75WMDz?=
 =?us-ascii?Q?PjG19XgT19L/mynYOoGQ4kRm+JX+U5rlOOIimrCUPmfAc3AXcvsSbZuxtg8e?=
 =?us-ascii?Q?djI1Y/PuF/Im60LESJSX6nuEZaegFsjPwIqVDAtkdjpwpB0G26t/6vohNpu3?=
 =?us-ascii?Q?Gt9nJh8hkfh4lGYasJYBmII=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g4o7ptbIEmPW9svXE4L8iM2cP+OHJoRVzak6yIwogmCejPqbqDf+UdX0sqth?=
 =?us-ascii?Q?8CITUVbOw/fHyu2CQ3DrluXUWtahQ7+CTyUfarfrR/Y1qeJj9TyIX9SnuzII?=
 =?us-ascii?Q?lNhuT7UnrjhwBH5G2V/hkxHvqQ938AK1je2eZZ6RkSGAgFpJNcn20KjEWiKw?=
 =?us-ascii?Q?a9asQdksQ5ZJ9Z7zXDidSjm2DUipT55SlHWZ6b/vbGIhjoeWMCGPiJCXyre3?=
 =?us-ascii?Q?Wmvn1rUrNLeCaHvBpIavzhwX+HDCzyMH7jceu+0lQl+5CGwMZWVgsV+M4ETA?=
 =?us-ascii?Q?AeQrmE8cjlgoxzV6E5ft1YF0/BoJmxDSLnMCsnHzdimZH/2JesWegfxurv1d?=
 =?us-ascii?Q?YPun8Jq55cYx2DbNrHfYTUuMAHBV1Hc5iz2qh29GNkODBd6qXqjub03ldmBt?=
 =?us-ascii?Q?C5pCSLtXTXKWxiKRqRwYegm2KLJHZO+1xAiYUKPKHzbKRoVqLfByMHahFPn8?=
 =?us-ascii?Q?jksmhmTDgWcGooeWs4qjTKvJHrGjVge2R33xypG/N2bKhj4Bl7snOvSSuCs1?=
 =?us-ascii?Q?a32nnU95itQun+zt6ralwLsi25IMtFyr/qzzNxu8E7RFKTBTeYKgiDotk5sj?=
 =?us-ascii?Q?G9arFMbbxyaT4icYouFNAu2KdxQGpid+Sn0XPlW6hIOOtvQD4fpYTPgji71O?=
 =?us-ascii?Q?TR00C2VxUocHnUC5VJtsn2pYjMB4GFuaHvxEDQqC2LDDCbY03ko+sTiWuN21?=
 =?us-ascii?Q?jPKqiXSyON7AU4gC79uZasS06lviykbCjJ09NkPqBBPSX11WIKigV8bHAhlU?=
 =?us-ascii?Q?aW4vfQNh22mf918zHmG4kLVHLSS08WITOih2GeABRIaYiSFERzf1vjpyOfJU?=
 =?us-ascii?Q?UFba1peSWoo+aOCDMQebYKxwBV3dr1oRTUJnPdXT8bKMiN28I/nW6LliOmRI?=
 =?us-ascii?Q?CPI0QeLcPbxYSPojpW00SpRjEooSUPXDhwf/Pky5yfo/uk5XUS+zMLoCusDj?=
 =?us-ascii?Q?W9y5cpSE/kQO8XnkFVQZRfZ6O5ZVvzOP5Bn2zZ2y5LctCfAHdaMiUK6pQeRO?=
 =?us-ascii?Q?Y3QiS8XOfSuzCtO/70buOojGNQNxFcx3QF3vu0dWGsBu9+csHNVI14o5qgTi?=
 =?us-ascii?Q?3/wL3bwuZ5liO3YlVNmU4EjcLo+sK2+lya3+9D02gfG5p02u7TAH2d43UrW7?=
 =?us-ascii?Q?2GRAc7dfmWpFTymrnbSfbdmQ+3VSAti4mfWiNIMa9kRIcMpZBPqFFMiHKG/x?=
 =?us-ascii?Q?APm0mJcDWtPy8CRLyoY0i7RGISM92dtfxnT/3+EG8GCkMLcCZE88QffaUAoB?=
 =?us-ascii?Q?yOsEjSCJske/RMKxYfeMXg4P1rsmEBiAd9ZNE/ZWyHQLHAtacYtchYtKCmju?=
 =?us-ascii?Q?+N1vJU+46BiAn6g8b5faZ1YNJDiKCT+zK+B964y1womdIN/C3MucJq7RmerN?=
 =?us-ascii?Q?zpkPh6wdTgo5Rok9ZIVg016FAOaoGfF/uLZBXXasBPAbkIgPSq4nfz9jVsLU?=
 =?us-ascii?Q?qE7wofD10djPVV5M7EOMlJRD4Tj3NzH7XRwJJ5dkq2Gfbq4muRW1q8RVjbMx?=
 =?us-ascii?Q?YjtoXjJGFX5v26JuULlXs4jgxT7je3POLPstI7C22r7N8FsaanIyD7JUTIKY?=
 =?us-ascii?Q?TauHytnml5BJKfaKbXy0+mYVFrrhsEQkEXj+Wuo8vctbO73t36LzKPL8KftF?=
 =?us-ascii?Q?6CieHtxe0vXE9Mo/h1o2qwoh8j+QytShxlrrFexIHrjVkNTpnIMFiNorAzPF?=
 =?us-ascii?Q?MIfV3hdSiHu9SfKB18QO7aWTgxyqv/GG6zqQepxdXnT/2bR3fjvvdqeR3Wsa?=
 =?us-ascii?Q?3zbtRBTy/bn3sCT7mTIBWq5X/CgHdDXlTcagrMkOVClnOVq+S46r?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae50042d-ab7c-43c5-2e5d-08de5f566181
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:49:34.4216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agcByxtfCRfAYLk2Jhcj2BnB8Cfm5qkE/sw9vRW9cjDCiQfmTS/hcjq0yQGR0BqPvj1ifUwXvzqN2m+62u/NkiD5yQR8voLPJf2EK9a7IbcxKOrqVYRDC0QUJWmf8UEQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27617-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: D07CFB26AB
X-Rspamd-Action: no action

As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
bit of the VBENCTL Control Register. This register is mapped in the
reset framework. The reset driver expose this register as mux-controller
and instantiates this driver. The consumer will use the mux API to
control the VBUS_SEL bit.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - No changes.

v5->v6:
 - No changes.

v4->v5:
 - Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
 - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
 - Updated commit msg.

v3->v4:
 - Removed mux_chip->dev.of_node not needed.

v2->v3:
 - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
   is an internal node.
 - Fixed auxiliary_device_id name.
 - Get rdev using from platform_data.
 - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
   as it is needed.
 - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.

v1->v2:
 - New patch

 drivers/mux/Kconfig                       | 11 +++
 drivers/mux/Makefile                      |  2 +
 drivers/mux/rzv2h-usb-vbenctl.c           | 97 +++++++++++++++++++++++
 include/linux/reset/reset_rzv2h_usb2phy.h | 11 +++
 4 files changed, 121 insertions(+)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index c68132e38138..3692f3e466a9 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -59,4 +59,15 @@ config MUX_MMIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-mmio.
 
+config MUX_RZV2H_USB_VBENCTL
+	tristate "Renesas RZ/V2H USB VBENCTL VBUS_SEL mux driver"
+	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
+	depends on OF
+	select REGMAP_MMIO
+	select AUXILIARY_BUS
+	default RESET_RZV2H_USB2PHY
+	help
+	  Support for USB VBENCTL VBUS_SEL mux implemented on Renesas
+	  RZ/V2H SoCs.
+
 endmenu
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 6e9fa47daf56..3bd9b3846835 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
 mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
+mux-rzv2h-usb-vbenctl-objs	:= rzv2h-usb-vbenctl.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
+obj-$(CONFIG_MUX_RZV2H_USB_VBENCTL)	+= mux-rzv2h-usb-vbenctl.o
diff --git a/drivers/mux/rzv2h-usb-vbenctl.c b/drivers/mux/rzv2h-usb-vbenctl.c
new file mode 100644
index 000000000000..f15d648bd4d6
--- /dev/null
+++ b/drivers/mux/rzv2h-usb-vbenctl.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) USB VBENCTL VBUS_SEL mux driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+#define RZV2H_VBENCTL		0xf0c
+
+struct mux_rzv2h_usb_vbenctl_priv {
+	struct regmap_field *field;
+};
+
+static int mux_rzv2h_usb_vbenctl_set(struct mux_control *mux, int state)
+{
+	struct mux_rzv2h_usb_vbenctl_priv *priv = mux_chip_priv(mux->chip);
+
+	return regmap_field_write(priv->field, state);
+}
+
+static const struct mux_control_ops mux_rzv2h_usb_vbenctl_ops = {
+	.set = mux_rzv2h_usb_vbenctl_set,
+};
+
+static const struct regmap_config rzv2h_usb_vbenctl_regconf = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = RZV2H_VBENCTL,
+};
+
+static int mux_rzv2h_usb_vbenctl_probe(struct auxiliary_device *adev,
+				       const struct auxiliary_device_id *id)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev = adev->dev.platform_data;
+	struct mux_rzv2h_usb_vbenctl_priv *priv;
+	struct device *dev = &adev->dev;
+	struct mux_chip *mux_chip;
+	struct regmap *regmap;
+	struct reg_field reg_field = {
+		.reg = RZV2H_VBENCTL,
+		.lsb = 0,
+		.msb = 0,
+	};
+	int ret;
+
+	regmap = devm_regmap_init_mmio(dev, rdev->base, &rzv2h_usb_vbenctl_regconf);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	priv = mux_chip_priv(mux_chip);
+
+	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
+	if (IS_ERR(priv->field))
+		return PTR_ERR(priv->field);
+
+	mux_chip->ops = &mux_rzv2h_usb_vbenctl_ops;
+	mux_chip->mux[0].states = 2;
+	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id mux_rzv2h_usb_vbenctl_ids[] = {
+	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbenctl_ids);
+
+static struct auxiliary_driver mux_rzv2h_usb_vbenctl_driver = {
+	.name		= "vbenctl",
+	.probe		= mux_rzv2h_usb_vbenctl_probe,
+	.id_table	= mux_rzv2h_usb_vbenctl_ids,
+};
+module_auxiliary_driver(mux_rzv2h_usb_vbenctl_driver);
+
+MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/reset/reset_rzv2h_usb2phy.h b/include/linux/reset/reset_rzv2h_usb2phy.h
new file mode 100644
index 000000000000..06247080a66c
--- /dev/null
+++ b/include/linux/reset/reset_rzv2h_usb2phy.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _RESET_RZV2H_USB2PHY_H
+#define _RESET_RZV2H_USB2PHY_H
+
+#include <linux/auxiliary_bus.h>
+
+struct reset_rzv2h_usb2phy_adev {
+	void __iomem *base;
+};
+
+#endif
-- 
2.43.0


