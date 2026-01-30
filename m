Return-Path: <linux-renesas-soc+bounces-27716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NGnFgH5fGmGPgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 19:31:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FE3BDBB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 19:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 412BD3014772
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9999737F8D1;
	Fri, 30 Jan 2026 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AwTNUSZG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010035.outbound.protection.outlook.com [52.101.229.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E212E2DF4;
	Fri, 30 Jan 2026 18:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769797867; cv=fail; b=jB0SmBB+vEPren2QhhJxbBBGQTIUDt4PG95JZ2foZD0hJr0Gw3Azgfw9rZbqZDiSn5F7XgNX54hJc6A38abg3Df6SGDMzv54qMPk5wFFOtitF5chMCVC+SQj2wDwEprTjJPOz2qry/JaB60/jRTBVEo3hXEbzyi2G1KSd4c0x94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769797867; c=relaxed/simple;
	bh=x1y+g5IDxPss5RR2OhVTad/6Zs0uVGCrfVmuGJ1fl1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pWdU2hNMhld7u23HvE8kPLvi6GbHWj5xBV74C/XZ3AtgteuCscNtGjdqDJXWaS4KHZAm9l4Pae78JSj2EVQNwgEZafvSnrPP25lBgZYD67R6waIlun7jwhK0DTyPIFa6Hby00vDc5KBNEwBMCq8ILKYUVaDh8BBRNHLV+A3Ef+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AwTNUSZG; arc=fail smtp.client-ip=52.101.229.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7JjJG6kuRwtdS2+TZU1eMfFB4f7JhjOoj3nxFbxS2eV6yw3deQUpFf0W58LvP20s3/bY9I3vtxxhR2OdZ6g88nPGAexoNW2sfalIwm92+NUT9UcAI0Gg5uNZ9LHBW7/jw6wknVMO+S/Xu15taAt14xOKDMPPqdkGh1ldlfnaVoc7tRKHWYxFxYjUhcUyWZquSrqA2H25fgsTqLkWPDQSZAYY8o/I7D7JYQvp9Szo1g0KgtbdiIIUsrMqcJBJLS640pDpX2z4OvxIit7RpXmvxJRIHS77CXbiwHxbZB88P8/haGndUJehVyv3SK0PhZMyeNdjZMbSCA4Gx3+cUqvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1I2ZoCLfH+3nWmJ6hfBu2Bqk0ssGu6nXEwSVe7IZgY=;
 b=eLzBhM61rewJKobKBZd/E52UPzUjHx2YnpXmEFKELH972KDgBAmfDCUAhWJ0K03aIdluxH8NuatZo4LC4A1Ju7C+mwjcYh4E67lZ75NRkoUEPQ/ZzRNvXdaPhPhF/einhHnsaqY9YVxfFhOJBqtjK2PpRxJCVOfR9AO8G2T5Wvm6ZATWlKh01AU4xn0zqCLT8NqvqdJ7++XDiAQk22ucLSOALoC16RmDIJMWF6t57l+4UBJhkKuc7nxmkWSatj6WXSbcqPtjfEuuGXsCHrR3t6iWsf+HPIFlN5Q2gljIymuV8OEG1ibPcQIgAhNHQmwUxDKTM3YDia8HbeK7xEYANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1I2ZoCLfH+3nWmJ6hfBu2Bqk0ssGu6nXEwSVe7IZgY=;
 b=AwTNUSZGq19KwDUca78Q8fCEK9QstvCAIUg2L551vc1q9jaDLVSMo54zl0pWXL1RvqZAcW2h/38OoumCPYTepICs9MpWbePD3xSky4KX2J0M0fQhVc4MwpqfeQui9ZbxaFuV0eNSLdiuCCpmnVXZXp98mqMGMWG1aHIY0Vx6aIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:31:03 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:31:03 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v3 03/20] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
Date: Fri, 30 Jan 2026 19:29:55 +0100
Message-ID: <c4e993f0521b2f7ddaccf7008f6217ac5fc00c4f.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15715:EE_
X-MS-Office365-Filtering-Correlation-Id: cac2fdc9-5790-4d25-a8f2-08de602db916
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Ya2CHEsXUyw8BUQwLyWK6R6FBIYB589PKjKy+XcitQjOVFSuLzYe3tdRZDrc?=
 =?us-ascii?Q?iNGRyDqvaP24CopJHbP7y/nfvYfPBFQeC3evGPvm47BKmCLX5XlQHgL82HAm?=
 =?us-ascii?Q?nxoQPYILEfOsc5D0n65wONVYik2m7UFaLkip13QrwlFXMgFVc3Bhih6ZPLrC?=
 =?us-ascii?Q?4MOpLm3TlZux8R6KwCmmmxas09UTx5WG71jBMpdt4tYxW7/Qugk4vnJyuUr6?=
 =?us-ascii?Q?az9ZU4OmVOfrxZ6RUAWzIcqEw3BdUkEDtf6Dx6pfaQBfnkQD43UkFB6WXQ2j?=
 =?us-ascii?Q?nUD6fvH+GuyhNw34M5+H49USbEDsgJY5ubi4icSy/3PqIc+CkWAzplNy5Ogf?=
 =?us-ascii?Q?O7iqKZRE19LsK52GCa132V4CDPfyybUVfoK4CAwiYrctbwL6XafRXwQSV8fv?=
 =?us-ascii?Q?GgWI65yY+7C51XBD3nl6kIVu4P9mCuqlnKhCdSh2ytg7fe2bYMz5d6nl/d3k?=
 =?us-ascii?Q?uT/TLqjn3OjFNKLVqXeaKmiI08NmlWcj6D/eGdwUOvr/sLypXDyj2ANudrXQ?=
 =?us-ascii?Q?ji6ir9cTzmXHKbr4vLA2MQLEaATZ/+QHLMHIK0LYxMVk5CeBKdGw9FomU8Y/?=
 =?us-ascii?Q?QEgvWhOKxLo+nAYacKIK+syVQgzUUutmGC0Zf6+NMqIaXtPpkz3HSVVO0oDQ?=
 =?us-ascii?Q?VyJISPcKM0GRdmZWl167oBZ1tLb5wOiloUZNUHYuzK4rlOnWcwKXqLu61m/x?=
 =?us-ascii?Q?jRpweMs7S96KwuteH+hAqnWnhHbCHmZbSygwRZWMJkozzODQ+08VQAzLMl+Q?=
 =?us-ascii?Q?ZIbr4ov8xpTX+KjgVXMiBromARudUZTgIUPegwWVI1PAodjpQSmcwUpJCpIk?=
 =?us-ascii?Q?Ue5Ms191d/tmzT+tebS2Ua3biTaKjBZzJnZyGDOSpKUhGivmU56qcaVfpzq5?=
 =?us-ascii?Q?9ngnw4A6gRsgdEbB7qpiV8z4vwjY6Egsi6vOcWfnhjshrsnUVbSy7tSMzcoW?=
 =?us-ascii?Q?oASh87xKOt2OVeFeIIlwxQfLpvOtLC9JuxP/KO6kzhOMu5l35dI7L5t/tp63?=
 =?us-ascii?Q?jeOkS4c65Av9as1F9Ngxb0GSWF1BdLuSUge+juXsm155PIbDUJXjG21Yy9Z0?=
 =?us-ascii?Q?Y89GGYdIGAi3st/2Sb6ar+agheLCAc+ax2XgdNVRBHm5zfORetn7DMc/+y4W?=
 =?us-ascii?Q?qy3y6S5WeykDJh2aJjlION1kJ8cfC73ERS1/ZoNjVRUzyOAsKVZ+glHZlVyd?=
 =?us-ascii?Q?cw2T3nseW97jzjV6NuF4/e0ElyMldLRV0jJuIoCmG8w2zNm/fm2U+3PSgNa0?=
 =?us-ascii?Q?UBYj1Mptf5Yr8adLZdEKaczvPy8Fp1sbV9bwCjkdq00zCN8MEbAojdLwkWGs?=
 =?us-ascii?Q?05vTmL9CqXXUIzpyitboWFwunUoUzv/7a3gutkTrALOa+A6zNWsFA1xANIWI?=
 =?us-ascii?Q?xDGhUrqLvoOns2A5UXdFzFL2cd55F9SyBCH/vWO348tNjGF0z4sc7CYagtUr?=
 =?us-ascii?Q?0MbOul56DrBed9SMQXpV+Jysch5ZTuJmtYKOnORGMUAKE8BL15OBr8V/QrWW?=
 =?us-ascii?Q?IszCE89ZMQ1W1YlFzJ/V8nKw/4CeelfjYbYhDubdVwmjz6pXjfgjm5FzBWqv?=
 =?us-ascii?Q?e7wmp3n1w+cYGtfLwk6cw83Ak/CyJjcUZhjnREhTFRjLULMySH1f6jc7Ix8F?=
 =?us-ascii?Q?oPZHRJe6IPqohMvvPXB5nh4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5qfnagosFQs0/2lG/gOJHAWWDYSMS12rMu/8BLMUmj//J4QwcLG4v1SpXrk+?=
 =?us-ascii?Q?qn0tzoB2GdiVWF9FZeKCROxglwCMYrxmWW8GaElppoVL8A+ihiw6mH/rhRlf?=
 =?us-ascii?Q?OIT/NQEvSaVaYt6qZBUWjgSXz+hrfIXdkvsjtJtibBnxtdMWBDotWbk1QAn4?=
 =?us-ascii?Q?PM0Meg1CmF67G7Nj/rjpcpz/wtCwMX0ei0d6an4bL9i0ZzHrIJTeU+tXROBY?=
 =?us-ascii?Q?iFIPkp45iUEH+3TCZGZD07up245Urt473IFJ60eFfurMtyrB/A0LuIckYWnw?=
 =?us-ascii?Q?PT+4cINtUWvJWErnGJsLv0yL4bHWEDNiZ4kiugbNRXdlM/osiyxzFQH2Q1O7?=
 =?us-ascii?Q?mdoXSdfiayL9iWN3uMGElZ/XbeTgOjUeTyCIKg+afYRGf+MxwOL5laOVfomG?=
 =?us-ascii?Q?eh1vF64wWlyLxSKfYe166n2jPGsFFsgtQbUuxwC6nYnqc73Qkv5DRT/A4mYM?=
 =?us-ascii?Q?IB+jh/jUgtNHqv3rsbAq73bBo8DyrHhB1fbh2UK2UsD4iCU6rk9uBmNA1Vc4?=
 =?us-ascii?Q?sIj2BtIbdlOyVhHNyRnewLcob1tliAROQp72rBGnx+ucVlsBXtzCmgq4mCl4?=
 =?us-ascii?Q?r6BQ2Qd8G2DpM4VctXa/C4V3wVbCtAymlXSdEW4lYWXPNPG/QvZ7EOp7FwWL?=
 =?us-ascii?Q?XSlV1gcx44/HuqXCzrozNBJUq2WAAbgw3F58r1z2XLseICRRp3gm5Fm84/64?=
 =?us-ascii?Q?ouoa1qtXz+f9z/uvJ2mQOE3gX1HYwTeg+oKnA6ID6L/In+NzSbUVuy1b20+b?=
 =?us-ascii?Q?Edhq+BrrYpGmOjAVaEnZ/wHxmOiPW3wvqmldqdbpHZD06+TlHl6hKhVwHa7t?=
 =?us-ascii?Q?MmrWGOKE+sWeSNbW+YjrarbFF+YFKpJfX2v+4yeyXM5vk4rDRB9r5LVvjccU?=
 =?us-ascii?Q?QuHVpaG3boaLgRznqBU1+/9X9MvyMyHk2ouT+5VTS+eISPSzlwc0U6Hbln6I?=
 =?us-ascii?Q?aUsD3kcj2XmzSSPWcgks93/eK3zTw97qjIVZtud8vZdBDPkbXTtu9YdgqAmj?=
 =?us-ascii?Q?HLVuPqA3z2bdpa+z3CiiALcMFdQWI76UzNg0KtxoABx1ip+lvyWeEBsXVjGk?=
 =?us-ascii?Q?IMlYWaTKZ07HUZxMMZO+oKPxF9imYfaP3F1dxVJEcZ89nVklU9HqHMoK54Fh?=
 =?us-ascii?Q?rdrtoxAAjxDuef1vgIe/LFs+8Tk43sYuN8Yjvnkrz0jU8yn6bYHnMpAx7IIc?=
 =?us-ascii?Q?Bo8LgZBdPsIkgwxta7asd8Vp8vd6T+MQ2zzN+VE+PpcLxY507nElw44BHrbH?=
 =?us-ascii?Q?J4A1RKCkutRsrcAnEHm0uNdvjYw6GWfoFmHAU1Adw8vA2SYheFbAGDHswwyi?=
 =?us-ascii?Q?GCniZSMBLb8ty7TcegbbxorfHOYzeO5bH+RRFrrfdfPuFerqDHZ7uzvhZBRD?=
 =?us-ascii?Q?P6avmbbjVoMu7WOnwt0JBirx9EY/fOMk6alu4H2Uxt09ZyfN0MmJxduUN1WX?=
 =?us-ascii?Q?YPLcQ6VmSZvBnhaMRToemhsUTWXm25JOyJ1rfPV1tM6ZLeR/lNI9LnYZc+6z?=
 =?us-ascii?Q?XtYXYW3e9uqi6xnqtgVIorctxRFJgE/A3aTcIJng7gkfIOSPLyZC4R9MK28k?=
 =?us-ascii?Q?J4c+LIEro3Z+BnLdaMxoFMBH+mQlIGR55K4G/YVAlWrhoalJROAjpbUffnPs?=
 =?us-ascii?Q?H8EiDmeSByKgfvfamHig+lV+K6qJ/AsOCrAWA1BAhhOHmgu73snZavwKpd3i?=
 =?us-ascii?Q?mmRMSo4PSCdttGoYw2id3EkAi5VVHi/ds0sXRUSO+YpbvixAarcoIFl7Rchk?=
 =?us-ascii?Q?1t8uiPfuMLtyl+hnPkUUnJlUTvivq3IgFUe+4ZffSMnC7h0LtJN7?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac2fdc9-5790-4d25-a8f2-08de602db916
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:31:03.1034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcDGcspMO1ybF3nN47Lw4qRCciULxxHc79N7mAHm02Qx/EgXpLFLeS7SuUxgnps9mhDRCU7yWKfUis4vW2/y4yr0t7N+bS2JUEIyzED7iB+2peZnGoBBUC53TWfHwNpa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15715
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27716-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,glider.be:email,renesas.com:email]
X-Rspamd-Queue-Id: 90FE3BDBB0
X-Rspamd-Action: no action

Add support for the PLLDSI{0,1} clocks in the r9a09g047 CPG driver.

Introduce CLK_PLLDSI{0,1} also, introduce the
rzg3e_cpg_pll_dsi{0,1}_limits structures to describe the frequency
constraints specific to the RZ/G3E SoC.

On Renesas RZ/G3E:

 - PLLDSI0 maximum output frequency: 1218 MHz
 - PLLDSI1 maximum output frequency: 609 MHz

These limits are enforced through the newly added
RZG3E_CPG_PLL_DSI{0,1}_LIMITS().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

v2->v3:
 - No changes.

 drivers/clk/renesas/r9a09g047-cpg.c | 11 +++++++++++
 include/linux/clk/renesas.h         | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index a73d12d4964a..8d4c70533a79 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -30,6 +31,8 @@ enum clk_ids {
 	CLK_PLLCA55,
 	CLK_PLLVDO,
 	CLK_PLLETH,
+	CLK_PLLDSI0,
+	CLK_PLLDSI1,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV3,
@@ -117,6 +120,12 @@ static const struct clk_div_table dtable_16_128[] = {
 	{0, 0},
 };
 
+RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
+RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
+
+#define PLLDSI0		PLL_PACK_LIMITS(0xc0, 1, 0, &rzg3e_cpg_pll_dsi0_limits)
+#define PLLDSI1		PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -138,6 +147,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
+	DEF_PLLDSI(".plldsi0", CLK_PLLDSI0, CLK_QEXTAL, PLLDSI0),
+	DEF_PLLDSI(".plldsi1", CLK_PLLDSI1, CLK_QEXTAL, PLLDSI1),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index c360df9fa735..0949400f44de 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -164,6 +164,26 @@ struct rzv2h_pll_div_pars {
 		.k = { .min = -32768, .max = 32767 },			\
 	}								\
 
+#define RZG3E_CPG_PLL_DSI0_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 1218 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
+#define RZG3E_CPG_PLL_DSI1_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 609 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
 #ifdef CONFIG_CLK_RZV2H
 bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			struct rzv2h_pll_pars *pars, u64 freq_millihz);
-- 
2.43.0


