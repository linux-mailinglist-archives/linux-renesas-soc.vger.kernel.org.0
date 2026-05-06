Return-Path: <linux-renesas-soc+bounces-32109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rBJSMy3c+mk2TgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 08:14:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 252614D67A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 08:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE9273012EB5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 06:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DF33033FD;
	Wed,  6 May 2026 06:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SItHhhfP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6629AAFA;
	Wed,  6 May 2026 06:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048043; cv=fail; b=tQ4HbKDXSM2M/Nt6IFHtZty9AB33mU6oux/GjmVHJSSSgSeqEuGyRleNBeiO3Z9oCCgaTti2C/Yvm+iaOHHa7wMb4ibZASs7n+syd/EWHI4Qvdqxnja/FKQe4mYNtPyyUVVekcnDcEW83Lrq2OLiLISpNNhR4VHKCpPXo63Swho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048043; c=relaxed/simple;
	bh=EZ6w7Nt76RQAtfJ1I4DJtR5ctpWsPNc2hog7Rinmryc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=SJCk6p92TNUwnoet+hEn1G/s9vq+HRryD+kTfzSKmO3bFBH817IchJBAf37tAPuycexaLDyRcI0QP4ASy86JhAh8QDKZdHeM9TF+WTlF9vICrIYXduM3AjxT+KuzBLZDLZBgpxSV64pjNTz/FDxclkwasQ5Qw1m96fxoX1G99mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SItHhhfP; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/mGqUjX2TtZBdEw2l1ukkCQMGP9yN2VB1JDiwCCeLlbhLTutky9YiO4Fp+6xTF8kgqBJjAf2w6iUYBpSoNmOvPt/mbgSHo6rAa4QMA9uR0DhnwMHchjwnblCSJJfYfALmidbdaPdEDt2GouduuHzaRK9BZqI6WQW2Gh29QTl/Ih3GVzBEcV3Kg3Sr6eF8UmOF0P4RMX7nC6xWTXAgUkFTu9ALfy5Nh7cBkjXFH3RaGeQlHt6BaRTp/8y+pTOhiNuCw6Z/wGW66Ii1/NSo0+dok41dcgZXXBH8KjlJlZBAF2fPwPJbpbzSlZfwIl1JTqavBe6sdjsl8vC5C+L6/H/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nt6OTfagOl3ifjM2luhIXGYoqvaU0vtAF6FBDrN9mM4=;
 b=LPHHLoLZ+5xfHbIeh+zLIgWG2KqV3QmD1+uqR43qRDhMm2PKoky52qv2THBGZShN3oRyZ0vNyfxul4+M8dDTlptcpgCO2bxwS4pRVvaDDSw0pEq5sgTSVRSVBxjOsQynlmM3v01kBzkzo47G+vBfTTEAYjr4oZDkEkfo/E25Xcq+wz0AayE6riYi34b2XOxp8KtuxxMaWotl4rigqaee1LfhvxhIG37CD6C8fjn2MYmu8BZweZxHWqGaP8wo7QnxtcgZTONd189ilF73+MZkgrb/7ve6j4uGtgBztZrQ+BHPBvFEyRS3rQsp4VPgv71rK9sSeAYpid7Dk9veKWdRdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nt6OTfagOl3ifjM2luhIXGYoqvaU0vtAF6FBDrN9mM4=;
 b=SItHhhfPleWBwSqPXCtVgrHavwfzQr0sY7pwIJVuNBwmy4BcEu4R0O49gYFhNM1lE0TEz5sKG1uiQXYnNkGkfIKtAKAx1XAwxHRTHRcQjUftCSdUswXRDLyth5QqXe5pdXZmnmoXtnA8U08SOmu7xTkxPZkfb5U43owePu4CLmygBaB+knmbhY13AVZVm0DbhVgfAc7l9iyHgSXXDuAVoayXdPF3NI7XFYoB/Z6q0+E7QfHuwZGWIrlBsrZIgUVXHoannHq5F4ivEmIjwiCc1FJWpH/Ld4fgaQttOTYcSQ0opHsRcOk1abw80wEwT7dSKiIWoqdKognUByvOqaWaeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by DBBPR04MB7772.eurprd04.prod.outlook.com (2603:10a6:10:1e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 06:13:58 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 06:13:58 +0000
From: Liu Ying <victor.liu@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260504145906.155198-1-biju.das.jz@bp.renesas.com>
References: <20260504145906.155198-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] drm/bridge: ite-it6263: Drop unnecessary blank line
Message-Id: <177804812767.3597075.13492097385946673577.b4-ty@b4>
Date: Wed, 06 May 2026 14:15:27 +0800
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0189.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::11) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|DBBPR04MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3afcb6-6422-4142-9f5d-08deab36a8bb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 JBWBupRjR2+PWdFU1bxk733WsdrOlyeDzt3kj/o25y1PkMbeDrvnD/1W+UFV9TROJkJheJQUcPBNILHZcxte02Ze7nVVvsrUUmHg5U+iV5yrheDW+KQQVlhgjHn06SkALlG0ByPRcbe/BhNswfRMht8waE/hsQgganCnA9U6HgljkJi+iyy0IONPX81kHLE+xhzUaKR/PxE4rWPFUxha0mCnk4po75we0rZzfNVQNNT+f70GkW8TE3tJnDkTFECczU8sQDe66CuPeg9xxxdwVRbMvnUIpSW2YWwQyAg0X7pcekv+yrRAxiUemfregsc6Jo4Y9IrwXQr4tZdq6/w1yjyrGfrTcMHI0GwukGgA6xA3lo1U0MnlRG4CMGZkSny5GpkLVeS9PM+v/6l64cZZvegCYkbyjXtpx9yCbokaQWCdm8I11bjaRsdgjrEetokg1YHvWGbIzjvr8/Qi/wrRQkPMYvp6WkCHkM5Rl2OROPUaGMLvUAGqhp9Wzg7aXuRMXflYOToagOneOEjV1xuKf53EZupHIq1IHReVRmb+yZIKckVWUtU6CfRwvJYDse62NgnC5sE3Q2Lq4vho3EcRzGrLaV0gMB4uel/tSGukuCpOsRIwGQQ16WYfgPZewGAsnO/5AWluzBxRA2VvfHL31xKzM3UbTEesVUUr44J7Pna5Nl3NF5FN9JedcYwDH3BtnYwmUjNQXeXVn/NFvhWXSoWslJTcLDtJvrvQNJ10qjvtsQ0awM4ypycMkiZjnOEm
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cDV5WlMxMmdMZTZvMjJkNzBxODgwdUJsS2xyNGEvSW1scm8xdzErRFVOeFJI?=
 =?utf-8?B?QURYb29PRHJhS1dyZ2k2dG5lNVBUNlVFWTE4N0kzSWNXekJMczZVR0FWL3dH?=
 =?utf-8?B?SWRhTWtMODRBTmQzU2dCRVJBd1h4N0Y1OEcrRVYyWUNJZlpTeU9KcWFRNEFY?=
 =?utf-8?B?TlZUUWRYOEh5eUhoTjJtajZiVkNRakM3L2lZWkJqb0hPeEpwZjdoU1ZBdzNB?=
 =?utf-8?B?ZFk4L1dNZW02ZnA3OXZZU21DbDVNUnZMNUpxanMzbitmdGhWVHE4bWphRkZM?=
 =?utf-8?B?Q3pYRzNMUGFnN01NK3VNalh2b1IxQk9KaEZxY3ZFVHV6RGRmS0RlS3BuZXlv?=
 =?utf-8?B?TDBQamxrS21QTzVGUTNmaGZCWVJIL3Z5dlIxa1ZnTVlId2ZLYkhBdHlyVjR3?=
 =?utf-8?B?UjhybmE5aVgxN014RGtybFJRa2FFOWVwTTl6Q3NWbTRkblJ3U1lYeTFacElL?=
 =?utf-8?B?Q3V4NHJFRUJsUmdRVXlzbkcxdStEbFBudlVUd09TemRSTUdSU2hRZzZVSVhh?=
 =?utf-8?B?UnYwQi9Wa1gzbDJVTytacjRUWG52cm5FTnRZcWs1VWVLVUtuTjlxL0V3elVy?=
 =?utf-8?B?amI4aXdZMEdOMDVTUk5PT04wVWpKWDA2NDhMVEVXVXRJMGVQK3VYN0ZJU1Js?=
 =?utf-8?B?S2p5SGdUZWZwM0NkeFNySEJvS0dNSGZHMm5DNEpuUFpJYU5VV0dEcEp3bXZD?=
 =?utf-8?B?QzkzdGdIQW5qZjVFMFpkNUJ3enpuaFNpNGdaSExlWHNGcmQ3ZHpYL3Z4ckh6?=
 =?utf-8?B?VlRQMnBiYzJ1M2tBQ3BJS3NDTTJJT2RsK0xtV2ZMNzF6MTdoUWFWTERHOXMz?=
 =?utf-8?B?Q3JtS3FQU2xjbWFXL1p0RFI1blZrTnI0eVAwWXRkQmZiWnMwcDA3WEdQNlJx?=
 =?utf-8?B?K3M5dVpNU2tYUjREQk8wU21POEw2ZzJBbmZXeHFHUk1PZE1YTEdkeko2aTgy?=
 =?utf-8?B?Y2ZMZkoyV3NOVThrdGh5UGg3aXlFeGZTa0loZStNdEZDbTk3aXlGaC9LUk9q?=
 =?utf-8?B?bHlTRHozelNWb1EwSkJlUmZkbTNjRmZIeFBQY20vUUxsQi95eGVTbzFVdDl1?=
 =?utf-8?B?b1FXUG0xak9NUWp3Rm5UYVU0azhnRXFvNG5mWlovZE9WRzhnM0pSRmJlYkR2?=
 =?utf-8?B?UWVEcU1pWTAyWE9DaE01alB0SExvMHkyS1NBQStaRGYyQndkWXZ4V0p5KzB5?=
 =?utf-8?B?Wkxxd2krdVdwWWtDbnFIZ2ptLy9ZQkV3MVlmOFFYSFgreEROQTd4QlczRGpF?=
 =?utf-8?B?bnM1ckVhWG83TzBXcERGanB1Nm9hN0VnRjVxMlBteHBuZWhUdmY3TmRqWmsz?=
 =?utf-8?B?YU95MnEwQ1hiMzNOY2pKc2wrcXNndktTejc5YTErL0x4WHRZZGhDL0tPdklT?=
 =?utf-8?B?MVRoNGlONnprRTZnRGhTdnF2Q0g2UjJiZG1XSkNzU3hqOW5IWXcrZ2ZxWmtj?=
 =?utf-8?B?b1JiTVhvYzBzSCtpajl4N1YrSXRkUlIrRlFicTEwelc5Mjk2MTRTczZ5R0RT?=
 =?utf-8?B?NUNmWXg3U0hOSkNiVUFlKzhWU2hjK3pQaUF1YkwvYkRDdVlkVnZ1TFlzOUZC?=
 =?utf-8?B?QW1reGFoSjNvYXlPVTBWZDVtcWw1ZHMrVGdIZ1ErdXdmM05vd1dsNTBtaUM3?=
 =?utf-8?B?RkI2VldvUGc5aUZXRjR4MUZIdUFKM2RQNkFrR2w2TEt2ZXVZVHJndHBCak5W?=
 =?utf-8?B?QWxQWTFIL2hSbnlnV1ExeUpBT0lRMmlUOERIZ1hwcWNDRm1IRlhwVUkwdzAx?=
 =?utf-8?B?aTFMWTc4YVNvVkRsVFNEdnJaNjk2Z2ltM05NTE1FN2t6N2FLb3RVNW95RnUw?=
 =?utf-8?B?QnVjM3drdW9PRFhyVlBUSjFOVUthZ1Q2Z0pFTFpYSEJIdTRXbVpUcXRHTVhR?=
 =?utf-8?B?TGxCZjJxdzB0dEx1REV6RlUydjZRa1hoOEo1MWFEQ1draGhOdCtZOEQrRE5I?=
 =?utf-8?B?cmVlMVNIcStKNk05NVFPTi9XeDBNVW82a3FZWE1mRWhBMTlWSXBpT3N4alF4?=
 =?utf-8?B?Q2NyT0dETndsbkpQVG90ZUExNk1UTTl6R1JLUm5OU0hOTGJ5WHZhcHRRRkdK?=
 =?utf-8?B?cU1sSXAxRnVKcUd3eW00SkFmTUVNRHNiNkZNV2lpTFFyYlR4cjZPU1AyeW5p?=
 =?utf-8?B?Z1JNcFVsdFQ1QlhQWWtTbHM0QjJ3dk1wQ0ZZajZzRm1hTk9lSGxMcHVuNjF5?=
 =?utf-8?B?VC9zdi8vTDNpMHFDeXFTdFArUXJjOUdhMGFWaE5lM0xNUFcyaXl1TWNZVEVm?=
 =?utf-8?B?T2prUDcxQnBYbVdEUzNKV1dIaGRGUGxsMytTWWFidnFmeWpvYThEOTh1Sk5V?=
 =?utf-8?B?T1FueUtNeU5mejIzNHhmY1pJVExNdkV2MGNFOFpEeFRuY1pob3ZZQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3afcb6-6422-4142-9f5d-08deab36a8bb
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 06:13:58.2342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaGZNLZpyWaouaUGh7d0Eg8oR0eadgTRal/GWakFGBxkHxcq0quKcokjQAgv7hrOP6H14OZhSFG7NTxJTLPK9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7772
X-Rspamd-Queue-Id: 252614D67A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32109-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, 04 May 2026 15:59:04 +0100, Biju wrote:
> Drop unnecessary blank line in it6263_hdmi_write_hdmi_infoframe().

Applied to misc/kernel.git (drm-misc-next), thanks!

[1/1] drm/bridge: ite-it6263: Drop unnecessary blank line
      commit: eb1ecc3865e490a4b39c7895eecb88acaf17b4f0

-- 
Regards,
Liu Ying



