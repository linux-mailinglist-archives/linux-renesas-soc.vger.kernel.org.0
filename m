Return-Path: <linux-renesas-soc+bounces-31079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHuUE2mM12k3PggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 13:24:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ACA3C9A2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 13:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7003301919C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 11:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6253C063B;
	Thu,  9 Apr 2026 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="e2lAaN23"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19433BED64;
	Thu,  9 Apr 2026 11:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733310; cv=fail; b=Ho0b5wbROxAoieeQWYrFG5kaV5vbbCRhN8UPRS1qswJ10NuPco8woE/uZiz4/IS/sHtYqqBRY5wqsjsdvhzdBIuHvg1Xvk3+F7qUhtUenatmL5tt258k953GQxK/UqGKnvKmdViY06fAe/5xMX/lGGEY4G3svTbEDVx+tEKa3SU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733310; c=relaxed/simple;
	bh=Syrodc4dTHJE/M5PdAsv/IPe/c0T4XwGa4qFABnp200=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oK9V7Fpqd9aznlc67hy1Fyp83DPQGeYIo03MdPvZ4yavPqZDhoxoMKH9rKFOuzmrZ2O41IBn60WJBBHXywU/jfmNXX2pfGket7VaIdArsqrzZa72VcsuNgK7UViL0TkcJf1SFllu/KUXg9f3U3t1Ktej/J9RE7Xe6xo+ShJ78XY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=e2lAaN23; arc=fail smtp.client-ip=52.101.229.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQluAlpVAFNrJMEaafvBi+IWuDaCLBuEUm4NdDjGGWM7+lnPCyhBP57I5z0UxMdUSg7gU7GVxAY7llzSxZgmrRhFXpvt4h/30iP8FJ7kgZuc5FQBZpeNTbcwt2Aqz3jyUyVp1emUi/4hFqQQ1CVU/Kj7DQ4SnlGNxt9ovNwIS0wOuOz5hu6sutLcyClVb1TrImTcdeq44QxszjcbesqVwCgUTIaXdQUf3/FMFzHpfqDI2KQvMc9lOuuo6IY4N6d8WkQUBRiZ+IPFB30c79kztmRO/HR1uIUD1svNnMloXuKieKfo4lb9awI/MwEODeQkwZjH3pDXy+7zuIsq30sP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRZkUWRPsrZfOavtMXG/SiEGaD2OrNHsujR4i0+GF4A=;
 b=k+p5ytwiKjmDE1+Q44Py71l6CnsD0MKPbufGVbZuFbUYd9qfnC+FqUt9Vp1HN6+MwltSV2F5Tq1++LzvonCvXG+KCSmNL9pEROIp0AyQfN83t06OKvROPED4KjkXX35rIA0jdsvCUcsekGSaXVdqj9iQfPAzyTdKv/1sKftUiUlcXV1IuUxRddb90FCKld0rAVfEtvlKHOA29oVBgR8YoOjdW7D65eE/zByhpBg3BBIpGw6swAWBX+pjqs6JKnVS3GJS4HnUaC9dJlnio+g8tRwQLSzRBafwoMRXKblt+A163y1Ywy8Qkm4gSfb7yK5K3x0CSM7B2Hfl7yPWeCIvDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRZkUWRPsrZfOavtMXG/SiEGaD2OrNHsujR4i0+GF4A=;
 b=e2lAaN23o6j6TdAmuqdH+mIWOGn0d7t2PPVH6Xi7zi/JAoauRVHADlaZWfpMSVtDosvSWWVOrrVre8g2bC4Riri36xuFe8AA+qTgNC1hPkJSKlIT9MyhGzUPXRYNgsI0Ws4DV2QTJ5bg50aqLxf8p3qoTSac/xPfNa33A1yihis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15925.jpnprd01.prod.outlook.com (2603:1096:604:3ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 11:15:03 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 11:15:03 +0000
Message-ID: <81165cf9-b1cc-4e75-b586-0e1ef7675b9d@bp.renesas.com>
Date: Thu, 9 Apr 2026 13:14:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/21] drm: renesas: rz-du: mipi_dsi: Add
 RZ_MIPI_DSI_FEATURE_GPO0R feature
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <9e0f64dd5e1efb0d27219416121c91a19da96ebd.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <20260408123102.GA1960713@killaraus.ideasonboard.com>
 <b8ded729-5c22-4a47-bfb7-8bffeed76e98@bp.renesas.com>
 <20260408141719.GB1965119@killaraus.ideasonboard.com>
 <136a9922-48ae-48e2-8cb1-14559206e7af@bp.renesas.com>
 <20260408150807.GD1965119@killaraus.ideasonboard.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260408150807.GD1965119@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::16) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15925:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7f28e3-57b0-4573-bf68-08de96293ec8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 Zp5sq94gH/msHG85XtwOvM1nvxN3gKiYRpzQFlIFoR/74k0bIB2yaWbME2VhvESpbBYK1iJmrN+9goNoOwc8KublJRNhbgYieAg7otwnrZmSIlWzFX3/7CfuLyzsx59XpyCnBCfDSJ1oLwxUhGa80vuhFkpifhNIQft5UCaqcWm4b/g6E7nD6a3A8BvqZt4W0K3ZwNJUVP9Ee9yiiGd/ZgKnRwXhg604H/FWyZDbH+leqGIkUqZH2Uv7d5j9uc4UTxTpI+ZVfwU5EA6OufSWwoN+We/uiQM+AltGjoEI9B24QcN7PSuc1hj2DimQQkLsipllxwpe4eR9jwvsN3QawAHboubHOF5r727SH1xAly9JITgMfAPQ/DMgMVWUzVnO1eyFQaKy5B50hj/VQu+lgJ37p/8/ZSHK7IPYAfe4wM+7hMTOgKhHQoqM8VLETSrVFgoxc624K1JmcVOP0qCnLmhenTl0EH/my6VUfMlpS0V0RNgcSiCuQvQuDTAA55J/TnSdXYTRBbKNE3Ml9+KS02ShtlouGGMjm6OJNyEzmKxMcrfORiby2u3e2PtyQgEo8eqXjXq1vLaNI2L1tuYY4wVOwPwsiT5mKB/Hsp97i/7c2q+GgvsSvl7H7N8UoS2lQusn5E8OVsLpH3fhynX6ovkzMBlu4HNIeBH0grr/oLTB9uXTBOJoURKKX2/zMhvhPTDInqZaj3kVyimE4wVB+7g4QPpcu9LVwv9HE/hsz3Y=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UHREemJCMitWVGtiUzJKSmFtUTJBdFUwZlJ3N3ZUVU5QSlJBck93THEzWnJa?=
 =?utf-8?B?YXFXMC94bWdsZVJqdDRkeUsyNm5OMEtXb2czcytCSmFTbGFRdm9reXlRVi8v?=
 =?utf-8?B?Q3pYeE10V1dMR05ZbjN0ZGpYcjNybDg4L2liUUhYaXJZSHA2UWlVZVNIN1Fz?=
 =?utf-8?B?TEZyMWZCODFGRGJDN3NoYVBGQTEyaFJBYmVkRkhsNGpGLy90V20zUE1nOWxR?=
 =?utf-8?B?MUNLeVcxZjR1dzBSR1dWM2h0VklJOGdFNHVZRnovaXVrK1hIYSs1WnRZYlVv?=
 =?utf-8?B?THZ4ZkE1UDlKQVJGU1BmL1JGczlJNFRjUXc5NExJVVdXL0lRV3VPZUlXRTRz?=
 =?utf-8?B?QmVFNGZPMTdMc2hwV3lWankxUHRyWUVndDJrVTB4Rkp4Sno2UGViUWF0OGY3?=
 =?utf-8?B?RytFSlE4eGU0N25GZGpYaDlXL05laS9hblhDckRHN2tzY1hpSlMyMUlSd05K?=
 =?utf-8?B?K2VQa0o2eW1zOEd0YzJCRjkyRFZlR1NESCtZWS9EMjVHelVSNnlFVm1heldi?=
 =?utf-8?B?VFV6bkF1bXRFSGRBdWJMVVVlbWROa1hnc3VaejRMNVIwSlpPS3d0QnROL3pD?=
 =?utf-8?B?d3F5WE5XVWhFbDVIR2t6V05xckFickpTVkJmeldlMWhma1lNV1FnbTVXci9S?=
 =?utf-8?B?Q2pkOXEvY0VZdjg3MVNDSU5Sam1aTjV4b1lzaUtIQkpQc1Y5M0kzaHRWWEpk?=
 =?utf-8?B?UkhWTE9ncXVvSGNGUnY2Q1NNRGt1KzVPTnRKdTRZWndmTXhxcHFpTXYvVnRZ?=
 =?utf-8?B?N3VPZVdQdldIdHFTZ2F1enJZTkptcmRPR0VPelh1YURva2tZR0dVOGNDK0dZ?=
 =?utf-8?B?T2VhdWQ1c3VZUW9Xd1hteHhKTzRlT2xHRnFqdzRYZnpPaitVWTdvc0lKOUR6?=
 =?utf-8?B?Q1hOYWxLQW56NUZpc25qcGo1N0VYNGhzSk94T1ZNbWV2OU81clNCQnE0TjJv?=
 =?utf-8?B?VUZvb2MzNjlkNmJiblFYRlFER1FnUFRxb3dtdVMxYkdXQ0pST0d0L0JYREF0?=
 =?utf-8?B?bFRQTEgyaVliRkdUc09DYjhxemFrMW5wVkhydjkxVnc4OGtWOG1CWnk1MjlP?=
 =?utf-8?B?ZjBrMFZZVmNZclVwbGZnbmN1YkJNbUVDcFpjTVZheHUxTS8rK3BkRHp3aURW?=
 =?utf-8?B?RG1YQTRTMDlBWkFmREpJMU8xNWFFSlFKWWx0QlRESHZKTktiWnZIL0d1RGJy?=
 =?utf-8?B?bndJbHdKcUtWM09NaDFuVzltRXFnclV2UEtVQXVYYjhZdTI2RzBUSS9kSVp4?=
 =?utf-8?B?Q1haLzJHb1JGTmphRm1aVjJNNncyR2U1TXA3R0ErOG5oM2kvTmxyalViZ3kv?=
 =?utf-8?B?LzdpSmR4U1hCOFQrMUVCMHc2SDdvOHlrbjJlWDJ4T0Z0Slk2QXYvWjdGdU1i?=
 =?utf-8?B?UTNnTVk1dVMxc1YxZjFRbVNZNEJRNGxPQ0VvTW15YlVka0pCTGRlR1poVnRm?=
 =?utf-8?B?ZWpJMUJhdHFQUEJIbXNsZFMva3dVaUVGU3QwQzRvNlk3WnJGMzVuVHMrM1B2?=
 =?utf-8?B?MzZwdUMwdnZadU40bVowK1hGSnA2U1VaY0RUL2RhY0NLNDRMY296VUlOOVVv?=
 =?utf-8?B?VnY5alFiYnZXRHQ2RUM1RXdySEw0ZG5kbStLUUpISTNGK2VOVHdSUFpQNCtN?=
 =?utf-8?B?cTg5dXZFbytDTFpnNWczWUhPV1oxZllpcHZkNFJDL1lqNFdEU1BMY3hXc1U5?=
 =?utf-8?B?MklocnRpcDBsZ3ZGQVphM21MV012dlEzUlFiRy9jQlRPL0xPdHR1ZmNnVmRX?=
 =?utf-8?B?amE2cXlhTE9JQ2JreFhMYmhOelE4NGlrNTNzenNwSjQvMUJLY24rVlI3SHF1?=
 =?utf-8?B?alIvSEVDMmhBNHNrV0Z0VjMwWU5TKzU1eXJFTWFUN3ZzK0c3N2NUaWM4TG1Z?=
 =?utf-8?B?NjBqRkJsaStDTUl2ZU5SOUlITFQ2WWJnTkJPL2huTnB5RGtNakRXTWN0aWpG?=
 =?utf-8?B?UUM2QmV6a3hEdG5PZHZVSjBiQ1NUSEI3M29IR1pNVDFsRFZLNDdUVDYwVlBj?=
 =?utf-8?B?K0dJUUZaZ2RaRWpoUWFvZEVxd1A4azdMdE5WcmdGalQyeFdReVZiV28vRzMv?=
 =?utf-8?B?NmdEdmEwb2JjaU5CZ1Z3MFJqL0kxMEk1NXlNMlNXcUFvR0RtLzdya0xnMGha?=
 =?utf-8?B?YUNObWpQTTFLZmFpb0xGZ1RwcEhyajdYakltdnJDWXVEYnl5enNrZXo2eXdt?=
 =?utf-8?B?ZGpURGpBUWsyTERnbG43ZTF2b3hVa0lLZGNIWkZOQWQ3M2ZkVEM0UGhZc2NX?=
 =?utf-8?B?NGtzeG4xZGpaRWZOVjkvZ1VyV0tNSTRiSVhzSUZqYXJBenhHUmVlMXFDdFVJ?=
 =?utf-8?B?NGpueUozYWE2VzJvb0VvNFhOVU1jVkpBU3BXcVZ2TXpESFloY3liQU1SKzNY?=
 =?utf-8?Q?9XiVgc6DOKT91L1DILlOnbDPL7vLj4E2sDyTh?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7f28e3-57b0-4573-bf68-08de96293ec8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:15:02.7606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5pK2z8qa1/O3FSXBNz5yjBat6BpVHFkVRh9HbmBOdQkFYqHQJOvNZIoJslSHrcNYm70e4Quv2iEi2MuOlORD6MDZ7kI4DGTB2ReaiPs5ZgRKq1TcG2a8zQjP77qnHig
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15925
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31079-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[bp.renesas.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.997];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: C2ACA3C9A2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,
Thanks for your comments.

On 4/8/26 17:08, Laurent Pinchart wrote:
> On Wed, Apr 08, 2026 at 04:58:01PM +0200, Tommaso Merciai wrote:
>> On 4/8/26 16:17, Laurent Pinchart wrote:
>>> On Wed, Apr 08, 2026 at 04:12:22PM +0200, Tommaso Merciai wrote:
>>>> On 4/8/26 14:31, Laurent Pinchart wrote:
>>>>> On Wed, Apr 08, 2026 at 12:36:58PM +0200, Tommaso Merciai wrote:
>>>>>> The MIPI DSI ip found in the RZ/G3E SoC select the video input clock
>>>>>> based on the DU instance actually connected using the GPO0R register.
>>>>>>
>>>>>> Add this feature to the driver using `RZ_MIPI_DSI_FEATURE_GPO0R`, update
>>>>>> the code accordingly to manage the vclk selection with the introduction
>>>>>> of `rzg2l_mipi_dsi_get_input_port()`.
>>>>>>
>>>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>>>> ---
>>>>>> v5->v6:
>>>>>>     - Moved rzg2l_mipi_dsi_link_write() into rzv2h_mipi_dsi_dphy_init()
>>>>>>       + comments from HW Manual.
>>>>>>
>>>>>> v4->v5:
>>>>>>     - No changes.
>>>>>>
>>>>>> v3->v4:
>>>>>>     - No changes.
>>>>>>
>>>>>> v2->v3:
>>>>>>     - No changes.
>>>>>>
>>>>>> v1->v2:
>>>>>>     - No changes.
>>>>>>
>>>>>>     .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 71 +++++++++++++++++--
>>>>>>     .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  3 +
>>>>>>     2 files changed, 68 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>>>>> index be6dbf19a24e..947c8e15fc4b 100644
>>>>>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>>>>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>>>>> @@ -37,7 +37,9 @@ MODULE_IMPORT_NS("RZV2H_CPG");
>>>>>>     
>>>>>>     #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
>>>>>>     
>>>>>> +#define RZ_MIPI_DSI_MAX_INPUT	2
>>>>>>     #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
>>>>>> +#define RZ_MIPI_DSI_FEATURE_GPO0R	BIT(1)
>>>>>>     
>>>>>>     struct rzg2l_mipi_dsi;
>>>>>>     
>>>>>> @@ -81,13 +83,14 @@ struct rzg2l_mipi_dsi {
>>>>>>     	struct drm_bridge bridge;
>>>>>>     	struct drm_bridge *next_bridge;
>>>>>>     
>>>>>> -	struct clk *vclk;
>>>>>> +	struct clk *vclk[RZ_MIPI_DSI_MAX_INPUT];
>>>>>>     	struct clk *lpclk;
>>>>>>     
>>>>>>     	enum mipi_dsi_pixel_format format;
>>>>>>     	unsigned int num_data_lanes;
>>>>>>     	unsigned int lanes;
>>>>>>     	unsigned long mode_flags;
>>>>>> +	u8 vclk_idx;
>>>>>>     
>>>>>>     	struct rzv2h_dsi_mode_calc mode_calc;
>>>>>>     
>>>>>> @@ -543,8 +546,8 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
>>>>>>     	unsigned long vclk_rate;
>>>>>>     	unsigned int bpp;
>>>>>>     
>>>>>> -	clk_set_rate(dsi->vclk, mode_freq * KILO);
>>>>>> -	vclk_rate = clk_get_rate(dsi->vclk);
>>>>>> +	clk_set_rate(dsi->vclk[dsi->vclk_idx], mode_freq * KILO);
>>>>>> +	vclk_rate = clk_get_rate(dsi->vclk[dsi->vclk_idx]);
>>>>>>     	if (vclk_rate != mode_freq * KILO)
>>>>>>     		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
>>>>>>     			mode_freq * KILO, vclk_rate);
>>>>>> @@ -687,6 +690,19 @@ static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
>>>>>>     	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R,
>>>>>>     				 FIELD_PREP(PLLCLKSET1R_PLL_K, dsi_parameters->k));
>>>>>>     
>>>>>> +	/*
>>>>>> +	 * From RZ/G3E HW manual (Rev.1.15) section 9.5.3 Operation,
>>>>>> +	 * 9.5.3.1 Power on Reset and Initial Settings for All Operations.
>>>>>> +	 * Figure 9.5-4 Power On/Off Sequence show that after writing to
>>>>>> +	 * GPO0R.VICH register we need to wait for more than 1 x tp before
>>>>>> +	 * writing to PLLENR.PLLEN.
>>>>>> +	 *
>>>>>> +	 * Note: GPO0R is a link register, not a PHY register. This setting
>>>>>> +	 * is specific to RZ/G3E.
>>>>>> +	 */
>>>>>> +	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R)
>>>>>> +		rzg2l_mipi_dsi_link_write(dsi, GPO0R, dsi->vclk_idx);
>>>>>> +
>>>>>>     	/*
>>>>>>     	 * From RZ/V2H HW manual (Rev.1.20) section 9.5.3 Operation,
>>>>>>     	 * (C) After write to D-PHY registers we need to wait for more than 1 x tp
>>>>>> @@ -1005,6 +1021,37 @@ static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi)
>>>>>>     	return ret;
>>>>>>     }
>>>>>>     
>>>>>> +static int rzg2l_mipi_dsi_get_input_port(struct rzg2l_mipi_dsi *dsi)
>>>>>> +{
>>>>>> +	struct device_node *np = dsi->dev->of_node;
>>>>>> +	struct device_node *remote_ep, *ep_node;
>>>>>> +	struct of_endpoint ep;
>>>>>> +	bool ep_enabled;
>>>>>> +	int in_port;
>>>>>> +
>>>>>> +	/* DSI can have only one port enabled */
>>>>>
>>>>> Why is that ? The hardware supports dynamic input selection, why can't
>>>>> it be supported at runtime ?
>>>>
>>>> For runtime/dynamic you mean using DT overlay??
>>>> like, remove:
>>>>
>>>> Removing - DU0 --> DSI (input 0 | port@0 ) overlay and
>>>> install  - DU1 --> DSI (input 1 | port@1 ) overlay and
>>>> viceversa?
>>>
>>> No, I mean configurable by userspace, with two CRTCs sharing one DSI
>>> encoder.
>>
>> Sorry, question:
>>    - Is it possible to create CRTC from user space?
> 
> No, the CRTCs are created by the driver, but you can have one DRM device
> that covers two LCDCs, with one CRTC each, both connected to the same
> DSI encoder (and apparently this applies to the LVDS encoder too).
> Userspace then selects which CRTC drives which connector.

Which user space tool would you suggest I use for testing this?

And also, which user space tool is the user supposed to use at
runtime on his final/production system to perform that selection?


Kind Regards,
Tommaso


> 
>>   From hardware point only one DSI input is selectable out of 2 LCDC's at
>> a time.
>>
>> References:
>>    - 9.5.2.2.3 9.5 MIPI DSI Interface (DSI)
>>      General Purpose Output 0 Register (DSI_LINK_GPO0R)
>>
>>    - 9.5 MIPI DSI Interface (DSI)
>>      9.5.1.2 Block Diagram
>>      Figure 9.5-1 Video Input Interface
>>
>>>>>> +	for_each_endpoint_of_node(np, ep_node) {
>>>>>> +		of_graph_parse_endpoint(ep_node, &ep);
>>>>>> +		if (ep.port >= RZ_MIPI_DSI_MAX_INPUT)
>>>>>> +			break;
>>>>>> +
>>>>>> +		remote_ep = of_graph_get_remote_endpoint(ep_node);
>>>>>> +		ep_enabled = of_device_is_available(remote_ep);
>>>>>> +		of_node_put(remote_ep);
>>>>>> +
>>>>>> +		if (ep_enabled) {
>>>>>> +			in_port = ep.port;
>>>>>> +			break;
>>>>>> +		}
>>>>>> +	}
>>>>>> +
>>>>>> +	if (!ep_enabled)
>>>>>> +		return -EINVAL;
>>>>>> +
>>>>>> +	dev_dbg(dsi->dev, "input port@%d\n", in_port);
>>>>>> +	return in_port;
>>>>>> +}
>>>>>> +
>>>>>>     /* -----------------------------------------------------------------------------
>>>>>>      * Bridge
>>>>>>      */
>>>>>> @@ -1425,9 +1472,21 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>>>>>>     	if (IS_ERR(dsi->mmio))
>>>>>>     		return PTR_ERR(dsi->mmio);
>>>>>>     
>>>>>> -	dsi->vclk = devm_clk_get(dsi->dev, "vclk");
>>>>>> -	if (IS_ERR(dsi->vclk))
>>>>>> -		return PTR_ERR(dsi->vclk);
>>>>>> +	dsi->vclk[0] = devm_clk_get(dsi->dev, "vclk");
>>>>>> +		if (IS_ERR(dsi->vclk[0]))
>>>>>> +			return PTR_ERR(dsi->vclk[0]);
>>>>>> +
>>>>>> +	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R) {
>>>>>> +		dsi->vclk[1] = devm_clk_get(dsi->dev, "vclk2");
>>>>>> +		if (IS_ERR(dsi->vclk[1]))
>>>>>> +			return PTR_ERR(dsi->vclk[1]);
>>>>>> +
>>>>>> +		ret = rzg2l_mipi_dsi_get_input_port(dsi);
>>>>>> +		if (ret < 0)
>>>>>> +			return dev_err_probe(dsi->dev, -EINVAL,
>>>>>> +					     "No available input port\n");
>>>>>> +		dsi->vclk_idx = ret;
>>>>>> +	}
>>>>>>     
>>>>>>     	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
>>>>>>     	if (IS_ERR(dsi->lpclk))
>>>>>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>>>>>> index 2bef20566648..cee2e0bc5dc5 100644
>>>>>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>>>>>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>>>>>> @@ -83,6 +83,9 @@
>>>>>>     #define LINKSR_SQCHRUN1			BIT(4)
>>>>>>     #define LINKSR_SQCHRUN0			BIT(0)
>>>>>>     
>>>>>> +/* RZ/G3E General Purpose Output 0 Register */
>>>>>> +#define GPO0R				0xc0
>>>>>> +
>>>>>>     /* Tx Set Register */
>>>>>>     #define TXSETR				0x100
>>>>>>     #define TXSETR_NUMLANECAP		(0x3 << 16)
> 


