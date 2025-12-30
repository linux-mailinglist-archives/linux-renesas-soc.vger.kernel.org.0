Return-Path: <linux-renesas-soc+bounces-26186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D804CE9716
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC46D3053701
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 10:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F51E2E973A;
	Tue, 30 Dec 2025 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sygKQla3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36E92E0B71;
	Tue, 30 Dec 2025 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091240; cv=fail; b=elxXjYMqXHkq8SQj0Io5J3cz/KRPqgOZR61a195JoKnINOslUzdGV6s2bZWez5jSxpdinujlEhzNy24bK6kf7R/0I2Ny20c1vwgjXz9AiHONWLhm/6NVpZ2zezdhokAmUF7P8Sh+hueALRePYnbhdUy7wmVvxqL95Q21y01R9Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091240; c=relaxed/simple;
	bh=TYNF2ZkKj1EN04v1j5ZvXJbA2vneUZlbaC7qGgLqFUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=upLRLWZrupjRmQkaIcvHODMt7CzK95bFiLovTu/HZSNO5CLdMWQLCnYfJnOUPkX7ZPNoVF4qcrMxkDgzeY7LFh+DeYTG4+OjTez8jgOIA6fruPJJOdJjlxAj5cppSoeFfGgdUax+2pSNyy6uiOQsFJCoIVx+kZrHCkczAn34MBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sygKQla3; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHwXH2gvTTdnqqNBQ5EKdOmhxuKaU+FItWPan9AYBNVnj73Hw+tUA2eEzuLlQdvx4iTwQkRLwhb3J9PIhahv/tLK/PnwgMACYEbs8QygBinD9vrYf3KiYBwwXPPhqJKiXOk2tbfC9foo0eYb0VhVtgZufCuBcR6QJ0wEs2+lwN+Yx/KLA6J/A+FEoI60Yc/0vyEJJw7IIZdMmTftZPHPg6kyyLHRe8Aj3ya9qLJ6GP5zD+PowZ1M6VqTHwmHgjrXVj+KXl8h+hrBvrodLds9ypvWJX5rcJ8PjRgZCRY82qGq/w8xXqZWfoRPJKizXyz0CBHboe/qPGvzNspyHb2xiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpzxI7cdHTF5LAbjfEdG+qEnFHXHvMFvvcgPuJ5Zzz0=;
 b=tR+bMIpiNupZmYqnPTsjbWWKi0jWJ+Tzfaui1sA2uIuSP8jwH4kwfsIDETs8sfcKDgVKnZZ0BcfKfm1VfcQMNJTOZGneZtRRG4lo0WdztqncSp/qhIbiPZx5rGy0V8zQRN0W8oKDWIcaquQHb0tJ91PFhP+j5FTWaWbkxjKH/OcfS7XlTP9BRgvxow+RI8iLScG0vTC9u12kyC5teOSL6MoOykPo7gBdWgtEu9cPbg6ZWkymJ9N+nHLwIqI51uRvgKx0Q/BP6KlmsUX6kN3adEhiMsNL4dKwC4iuxzja/tbhx/Lp3vVzRzGKuhoulFsTa5SLd9uapjRM39IclcoEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpzxI7cdHTF5LAbjfEdG+qEnFHXHvMFvvcgPuJ5Zzz0=;
 b=sygKQla39D5N3uqMtDBYw8e3e+m/LsRNS+JNGXyfZf1f87fTeetMWcLvS7z+UHJNCntE/QKGOfDFIEf28xe1Fi/Mb1FN4CtpphXaoEc6sTpg7hU4oqhPnTEj2fY+mz9pWglpHGTCvGWeC3RuKkBr5kh2XGtIjohTBlh2txsh+VI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB16048.jpnprd01.prod.outlook.com (2603:1096:604:3db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 10:40:34 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 10:40:34 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] i3c: renesas: Add suspend/resume support
Date: Tue, 30 Dec 2025 11:39:39 +0100
Message-ID: <8cba44d24d436bf11477c7f2b91de3c32dfe1809.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB16048:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ddc951b-4524-4922-5646-08de478fdcd6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ju7P3HTbvrgrsEqdglZ7f5v40K7+SH4dAfYr4t8VVfTJ0C1/rvUg5k60AOhi?=
 =?us-ascii?Q?Cl0XDX/bnZte/wzD2GQn5kHQIYoPfyv/XRQtizkR17gyWKcfT0+PU0ZvCrR0?=
 =?us-ascii?Q?M565JKLx8msc/ZArPy2KuaCfJoataXoo9vDv4sgKIlnNiWQWa92ktel61A3M?=
 =?us-ascii?Q?CiiDSRenpX6Q7pl6vHuNsuXe/gRg4L/wkZEM7Qk7/tDo0n73e/nvlbyFNasP?=
 =?us-ascii?Q?gTgW3k7dC2j8yuDppyoxjJRNJ+fo4MTak4/LqpnyZQHc7HpXbBSfB2PuLLDt?=
 =?us-ascii?Q?n1/VISMpqvUg0Lkpwca3FnqZJH0610xyNRKJVe4i5lmgi1vkeTHj8wSeQVNV?=
 =?us-ascii?Q?WwkXeoNKxSuhbvPpsjd0pVJGyhSr4wro+DGKZMTj7FoFZnYIAnrHN+2HNLNW?=
 =?us-ascii?Q?q3wtgO7/XPqoXPolbkvOGOqEf5V9yEIGifVwZxvxsgLgUVmvv/mRmmvCHFMH?=
 =?us-ascii?Q?rUJg6SxMzYtLUQRrX+/IlERpXzPvkMSSmW36JFCQ+zH9i/lELY3IlO4aCmpu?=
 =?us-ascii?Q?QmOK8lqjTfRUgtMvfIKKdisNQicaqd6Zk0vePAt/3N5W1AQ/5UfZP7z146we?=
 =?us-ascii?Q?GKA2zXXhsO7xa/Uk/CyxIIT2grRroFgSz5Ov+35z97Sg9be6z/dCusPSaTot?=
 =?us-ascii?Q?Uv+DMGNyCAmQtkNKt63wr6L5WtppKEEo8PI3AMFAXeXCTpQIL1NpNkk1Eyd2?=
 =?us-ascii?Q?GtBcUkaFa1vO3CEYjRwPyAAV8KUOfZpDri7rjscEjX4ltxkMX7RU9P5AaIrJ?=
 =?us-ascii?Q?UVmaruNqtb7ydZ+C0pvFOP+3CsEdWMBotMmScl2AkZpscRZHWZrvSoD7fn3k?=
 =?us-ascii?Q?uQsSiBpxrwi5HeESbmEgirvYmGblpjVwjq7Onzxw1KwIkJxB52q/VSKpYTjz?=
 =?us-ascii?Q?5C5exY9UPBlBF4q4q7Kmb0A8ZIjeT0P7h5dH2jIePLWaCXHmWCILwsI1uX/t?=
 =?us-ascii?Q?Vxr0gW4/kGnTVOoDucBaanc6UbVIx1FRWW9Ls7chCQjh31m/G0LLZi7alhoY?=
 =?us-ascii?Q?v9ud55Eq4eDf2Tj4RijW/6YkUtjpwvL9xmRLiJvTTxU2D98pi6xMGECamrAR?=
 =?us-ascii?Q?ybnpBoBuygrZof8F2CbYK7l1jEnvyNJjLY9KRX/i8mpzyKeHWVO02NXIOkuN?=
 =?us-ascii?Q?ZTMl1ce1xbLVfLXrP/CCVCHGuE+ya1G6EveVpAk+keaL+GN3HIs7Xmx2BDn3?=
 =?us-ascii?Q?i+YSkrDGhjdelPt1FPBDG60qRyZdOtOALAdk1Cu2wVS3dIHZoU6QhYGH4C0a?=
 =?us-ascii?Q?W3uz7CAfym+KzbzrekhhYL3ZhGhBQQCNkV6SKTEV42iL82VLC/74bJlK1ZHT?=
 =?us-ascii?Q?JTjT6lu+MPUHzHzuqlujzT6jJ4XLhRAMK1cw4DKIbt8Lj176gjGgTTmI9Rms?=
 =?us-ascii?Q?Gzf+fHSAJpmqa+Xo0RlbmBpMl7v3dDM8Kzz1YNwa7Gexd0fZ5JhCUe7RnSOe?=
 =?us-ascii?Q?5ZoKDmWyljc1rq3ch3Svi7SybJCTRitbV2nG4Sg7HBsPZc3NJjiLdbkPCkJP?=
 =?us-ascii?Q?y+m2GTyUUz0OfGeyENVLpK+aH6BYv35sZyM/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H6lTgOOn8PZjUjRk8Dq2AwUBK061yB5FUolUeIEs0sSdUTwmUVsE2BCpb7jz?=
 =?us-ascii?Q?QzntiILY3GRWY9MhwzpXT8f3KBLAHJaL5NeSG118ltkoOirq/wcZ89tR8GBU?=
 =?us-ascii?Q?n+lhaLm2Ll3i5o/FqmDKeGkcju8Hr86zTVx0N+mHWO8cKLfb/3yo1XeDkR6h?=
 =?us-ascii?Q?BjdOScsipg5Dh/MHDY+jn3XWAZ3NEqnqFT5+iMFB5kvhvOlgjhd2VIrmQegx?=
 =?us-ascii?Q?shIWB5IMq1K2rfRQksV86Xto/flaW5Kv4Ml7xjRwuq6YjVYLSpeY6Kp/z5cx?=
 =?us-ascii?Q?bHjcbZ3KokC4NnGhI2sAU9r1LMCThXGtcKORdvKggkfqNO+nD5fo/hBAZCtr?=
 =?us-ascii?Q?+auWJz4T8oTeMLD88m3pAv9v3rMhQIJPyDQ0RXozoNg+Mx0a2H142xpIwzp/?=
 =?us-ascii?Q?Cglo1HGeIrbgt3qtTB3TxNkUpwC+chbO6xOMvcvUz2B8D2q8sLVscQQDgBpW?=
 =?us-ascii?Q?rB8alVC6dluLfATdI2x4LPUtb8nnkWjSFZIiyzanr/BYIV8E3Kw8SxnQYjk2?=
 =?us-ascii?Q?f5QkKNql1goN0POIAXagEzBdkeQLZdZC/X3bTCu/Zg/NQPnoN1hFJVIRDkR9?=
 =?us-ascii?Q?uaRpJOixaFwEKMOhz2anNujGjAfskbStTpMPfRk3x90VNrmYRslXLvY31KRV?=
 =?us-ascii?Q?rSaZoTlo4dIJpXgWDjbxzz0B+Hh2/HD+ntqGWCsa/uVjgCZQWWSPOO6hnuys?=
 =?us-ascii?Q?gqSfsSClgtRt7GcCLoFLJzyvYWT42Fcj+qIrlHU+zlfZV4WPmIWtrbG1JZRn?=
 =?us-ascii?Q?BT5dfFglouqNYg2Iznhm6tvHsQTV/F8XKBaLtmH6zSXeoRESOPxjeW/TqFJ1?=
 =?us-ascii?Q?SNzaHOPSKy/Z5+ww/ZoJ57dJR5AuGzA/dl3DWABmyv3RqOCwvMg2I3Y04qp5?=
 =?us-ascii?Q?MPiBlwdBLoVGBXDlnGCtN53EWrSXWUWJOJOs4/y519MxdJkhFDtfD5ACmxeA?=
 =?us-ascii?Q?6Lx26hsomisC4SvViIGgbqiN3nnNi4Ft6rGW0X/BREL5x1Os0663sxa1elTb?=
 =?us-ascii?Q?I90X0Qk6tLhpxHkWEF0Ljb3gKsrn7Zj8lLuMPMwE0QR8H7V8QWLdjoIOt/4y?=
 =?us-ascii?Q?50l+Gu/Sl7kWrttOHZzPHHGqNRmq3jX8KPsX3gfx8fwixUdkw8F3nZksylYa?=
 =?us-ascii?Q?bV2Eni+irjTmW/21VZjYIqS/A6sNKIKn0WhQrOyrVodDPlk0GVYRz49WNzG/?=
 =?us-ascii?Q?MFMj+Wn95/jTb5q9aUsnqbE+D0bNhHcfGoo++iZCo/31kdRHQyn/IeTUTupn?=
 =?us-ascii?Q?ogRLPhiVLEczyo0pb91mTz41ut92bi0ZMc9NzQ89gvqxjjZwlKWTh6iB2T8d?=
 =?us-ascii?Q?lZ/I7vO85FrVh8i9bdxpVMK9JyQIJjySvAc0bdMIDhTTCjTbdabW6c5WjFiu?=
 =?us-ascii?Q?Z4K3ICsQbnXfZJUJkPE1sLYRFtXHYl+v59B+QUiCwaSHr7WjybfCAFPe4xNX?=
 =?us-ascii?Q?+hJAP+b1KuIPA38vAwb6mrLXzxT0JpkHWtZpiWc8ykRtnsbgTfYIIBXWyfrj?=
 =?us-ascii?Q?mMCzZqqLmSORLYoIAfxTrkLqbCXL1pBwR2ah0N5a4CwxUWL+KD/x9TVm0rqx?=
 =?us-ascii?Q?GWYXTVa83kktCYeROIbQkOXLNIDK035vjfMp+EAcis1rvdUKi/pHKU2gbkN6?=
 =?us-ascii?Q?HQyu2x5cO8HJserrh7b98bRRyUUax0YLs5uvI7gt1kC9rIJ3NPDt3SkQ+hMF?=
 =?us-ascii?Q?z+IXC3tl4OGCHQ3Obin/MrXbMf2k1piPgVLrOdZ+wB8EbVrJ+XAjAQXYGCEr?=
 =?us-ascii?Q?oQcIHmUZoXo99rSYt+k73b/FgLUsI2bK09wVE22Mz+Xxf02PT8QI?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ddc951b-4524-4922-5646-08de478fdcd6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 10:40:34.4993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8cDmPmmi0fow1jPJVaqGTBwZ7umpuWdZWWpqGN+fHbEgb3YrsYAmPu/AgO0hA+QGzCo8k/UFmG2vqJjeZboTJ2364MwXuOuC992fi+BsgLXDKg0hVyRw4Zclk8vmAzS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16048

The Renesas I3C controller does not retain its register state across system
suspend, requiring the driver to explicitly save and restore hardware
configuration.

Add suspend and resume NOIRQ callbacks to handle system sleep transitions.

During suspend, save the Device Address Table (DAT) entries, assert reset
lines, and disable all related clocks to allow the controller to enter a
low-power state.

On resume, re-enable clocks and reset lines in the proper order. Restore
the REFCKCTL register, master dynamic address, and all DAT entries, then
reinitialize the controller.

Store the REFCLK divider value, and the master dynamic address to restore
timing and addressing configuration after resume.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Updated commit as v1 has been split into smaller patches.
 - Use clock bulk API into renesas_i3c_suspend_noirq() and
   renesas_i3c_resume_noirq().
 - Updated commit body accordingly.

 drivers/i3c/master/renesas-i3c.c | 85 ++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 4f076c372b36..f089bbf19fa5 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -254,16 +254,19 @@ struct renesas_i3c {
 	enum i3c_internal_state internal_state;
 	u16 maxdevs;
 	u32 free_pos;
+	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
 	unsigned long rate;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
+	u32 *DATBASn;
 	struct clk_bulk_data clks[3];
 	u8 num_clks;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
+	u8 refclk_div;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -615,6 +618,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 					   EXTBR_EBRHP(pp_high_ticks));
 
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
+	i3c->refclk_div = cks;
 
 	/* I3C hw init*/
 	renesas_i3c_hw_init(i3c);
@@ -623,6 +627,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	if (ret < 0)
 		return ret;
 
+	i3c->dyn_addr = ret;
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
 
 	memset(&info, 0, sizeof(info));
@@ -1390,6 +1395,13 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
 	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
 
+	/* Allocate dynamic Device Address Table backup. */
+	i3c->DATBASn = devm_kzalloc(&pdev->dev,
+				    sizeof(u32) * i3c->maxdevs,
+				    GFP_KERNEL);
+	if (!i3c->DATBASn)
+		return -ENOMEM;
+
 	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
 }
 
@@ -1400,6 +1412,78 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 	i3c_master_unregister(&i3c->base);
 }
 
+static int renesas_i3c_suspend_noirq(struct device *dev)
+{
+	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	int i, ret;
+
+	i2c_mark_adapter_suspended(&i3c->base.i2c);
+
+	/* Store Device Address Table values. */
+	for (i = 0; i < i3c->maxdevs; i++)
+		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
+
+	ret = reset_control_assert(i3c->presetn);
+	if (ret)
+		return ret;
+
+	ret = reset_control_assert(i3c->tresetn);
+	if (ret) {
+		reset_control_deassert(i3c->presetn);
+		return ret;
+	}
+
+	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
+
+	return 0;
+}
+
+static int renesas_i3c_resume_noirq(struct device *dev)
+{
+	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	int i, ret;
+
+	ret = reset_control_deassert(i3c->presetn);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(i3c->tresetn);
+	if (ret)
+		goto err_presetn;
+
+	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
+	if (ret)
+		goto err_tresetn;
+
+	/* Re-store I3C registers value. */
+	renesas_writel(i3c->regs, REFCKCTL,
+		       REFCKCTL_IREFCKS(i3c->refclk_div));
+	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
+		       MSDVAD_MDYAD(i3c->dyn_addr));
+
+	/* Restore Device Address Table values. */
+	for (i = 0; i < i3c->maxdevs; i++)
+		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
+
+	/* I3C hw init. */
+	renesas_i3c_hw_init(i3c);
+
+	i2c_mark_adapter_resumed(&i3c->base.i2c);
+
+	return 0;
+
+err_tresetn:
+	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
+err_presetn:
+	reset_control_assert(i3c->presetn);
+	return ret;
+}
+
+static const struct dev_pm_ops renesas_i3c_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
+				  renesas_i3c_resume_noirq)
+};
+
 static const struct renesas_i3c_config empty_i3c_config = {
 };
 
@@ -1420,6 +1504,7 @@ static struct platform_driver renesas_i3c = {
 	.driver = {
 		.name = "renesas-i3c",
 		.of_match_table = renesas_i3c_of_ids,
+		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
 	},
 };
 module_platform_driver(renesas_i3c);
-- 
2.43.0


