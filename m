Return-Path: <linux-renesas-soc+bounces-29634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLxNOt2WuWkJKwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:01:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 989312B07F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 881E63022067
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 17:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B70379964;
	Tue, 17 Mar 2026 17:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UvglWKg5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AA33793D4;
	Tue, 17 Mar 2026 17:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768660; cv=fail; b=gCS4cUc3ONiJu+m1C28xxmX+YCoOuvUyf15jMP7BUwfL2kjKcLwxy9+DF15+JR9wEXSbuEjiT02rpCZM+CttV64aFTfwrdQj+twJpiIOKP0BNMdhnFGtaaxqyH/ouWXd9To+C+P5JXWeFwdv82fMJeWxVhL75Z9E6pkfdVVzPtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768660; c=relaxed/simple;
	bh=LcnhW2FfxD+T704kvMNMIfM+HF29H4FwJfGjiV1piTU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ri9dlBHQwoG2Z/Zgz06OopMm+ttW1Veug7gmvLfJZeM7S4pE8Y54C5DX72TvRbW66qEzAeVZRgI9u8JDhXcVciMJTkTFo8f+3FtutpULEn927rKaYMlOxydk/y/L/nBaRys2QU6Oh5BMvH98WUTc8xwyAs0EIBQsMNeVKhKET10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UvglWKg5; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kT3KVl6fHq4ituywX1eLi/dmJCnOOR7Y9kV2nPon7Xqbar1nlbaXJQdXLAoyFDH23tw1Fv0NJl+YO7i8mRPP0rLhCX557Kj6CP/ahBPa2dv3rclGp/QlD7YCKBiGOr+7ZJrnMyDfTrcKo5GTcxUbZRlFxqe2p8g8CD1n6otViqnEUmcfd9eOpBEsFXJNqAMux5npUfFEual50+8sUYxEGTXqkp6JUjdz/JxK73vgbBKNaBak9BebtxzMmMs4bcKsoUQnJ2bT+x8Yznzjpin70a6gsvxffLMv4G5K3dOb4zF24UqOzkPX8kphOLqKzW4JtVdSW6ciy6ktXHIigJW4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HP3i6a2nE9DBcSe8rBnvfsx3VDxyCjiYe8k2OO/Zrpo=;
 b=huY4lk4ecMqTUcG+eqP3GkojP76SMU4fzz6KVRGbmVUpseyhy3Mg3SfYQzPYFhW95wc9wA+w2njfIQj6PXXGE9Of7BG58AIxWw8kIFMo4wuEEvgaFtzfOJ8dYLBQxDdl6Y2qCqs3kt3EtFEYIqASGGxTa0gNWy5xkl7wFwZf7b4uixpsdhKdmd7arW870jhyvqHwUm//dZLqFItcFwMW7jaEOGJWKz6Q/JD2JQZNmkTb/hh6qicxoEuZNLfwPU1rcGszOmOMP9kj+B2gbAbmbwPZcZftjai6ukRWCi42LzdrXvWwApv3O5G6d/hbV/oiwJn2+fZAypT/ntK3SU/RxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HP3i6a2nE9DBcSe8rBnvfsx3VDxyCjiYe8k2OO/Zrpo=;
 b=UvglWKg5f2Fg+RpXX7YfzdixtCioQarqsSe9nP3lhA8H+lUj67cYLst3SLTfG4ZbefcABPqy+H9vPCucUjtXTk9JEZXW65NTvOGwgp1fu5HoQbR6raCp6GRD4YELr8LqJLsuFx6IdiLHp29wDVSyVqWJnZM5TtLFwSRgIn4e5Zo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by TYYPR01MB10608.jpnprd01.prod.outlook.com (2603:1096:400:30a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 17:30:54 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495%6]) with mapi id 15.20.9700.025; Tue, 17 Mar 2026
 17:30:54 +0000
Message-ID: <361e3831-d2aa-4471-8b19-34af661fa351@bp.renesas.com>
Date: Tue, 17 Mar 2026 18:30:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/20] drm: renesas: rz-du: mipi_dsi: Add out_port to
 OF data
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <54edf1fa30f571686b55a4d67a2b100089739d10.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB1134613D59A93FC741A3715678641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <TY3PR01MB1134613D59A93FC741A3715678641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|TYYPR01MB10608:EE_
X-MS-Office365-Filtering-Correlation-Id: d6cd4dc9-61a9-4570-d88f-08de844af0fb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 jn+BNwAu3pDazUu3PKLiFckFzJJshPs54XT96TzK+aiA2EfTbZABMAC9jATxtTyJvmPJBDAI4s0jUePu5iFJ7SKyHyaKq6HI6K7S9dHyzfbVpAdYI2/onOAMqBYJu1jYJ9pzloDwbFT4ABckdjpMn3bBJqCPLrQoySkGYY8ePDdqZ6/V6r7GYQL8ip/uKGCyXsuVe6MiAJtK3QeL6u5TXk4bFpaaeIP75A3mZqucw81bqp+Jv+l4XhkBaDkoLLDEqe96MfkRW31IISnPrknNa/CoYA/latRr9/ptmfT/QtqnCBOnjEqEvDqYNbclxrLfEMiRruGKOUBY1ML/8N6AgDwedMfZrnpdHllifa8wQbSbHCaLixXQ8i0ju/4qxO0SBjpurp57qPedvBO7LzXDQUUkNZeDCxuOzwLcfiIfFI5dqF3ITwqgNUbD/iARvPrzQQee1fnXY1U5txrHoBTlGBuT81fZUDxmNSenWsw8SUtqko/BV+vZYV/udw9/ew7G0F1mlbI1UEFhs7dA3F1n6qg/A8Y/3VA3wtRwc6LjNeDCPZqpywPi8vYgTkOSwe4LzLoRVxYw1WMX5uQGm6+1/7hRgNYj7r2n6KqzTiqQbdqF1gDtaO4yiSXvr7bIy0dp5hB6rvwf6Ys0kEAQHZPD8vaXmWwfjZ0tuuJgfXfYCpsyspYmDmJtHXkojMwMzLHKWj7lxwDfSqR9yEmSgHE+CG5KdqmsoNWypkfB/sTNCeg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y2V2azU4TGxjU3lQNEpOaTlMSDR6clJXOWg3Ujg2WFlOVTBaK0pqSjNNS1Yw?=
 =?utf-8?B?Rzg0MTVBVlVFVTZIQXkyeXVLcnJ3a2F2UFJTRGFOVFh0bjBJeXVoYldoQlpB?=
 =?utf-8?B?UEZTSkFaNUt1Q2pQZG1yaDdPMzNSNDBJSVRLbC9FOXFoRUFBR2JYb1V4NnI5?=
 =?utf-8?B?RHB2VE5JYUY3M2s2cWpCMnFlUzc5bVZVbzhoUlBKMkNBSDhETExDNU44M3Vp?=
 =?utf-8?B?M2pHNEVsUHhYN0pGR2dvRW43dGpUTGxEWUpjbVkrQzVBTnU4Z0RiOFNtbk1Y?=
 =?utf-8?B?Y25RMG4ySDdSWThMNSthVUxqSDV3cjhjOVpNMHR3bk9vWi9VbkVsTkx6Ly95?=
 =?utf-8?B?emxuZXBuWDRHdlNocnhkdUREUEJnK3BaZTU1Mmg0SzhUYzdSQW53L09OeTRm?=
 =?utf-8?B?aU5XQllaa0Z3Wk9ZTDJlbE5jYys4aXgvb0xNSnlHZE5ZU1I0YlA5NDJNb1Q5?=
 =?utf-8?B?SnRjUWhzcjFYRkpiQmt6aUpURFc5R2o5anlCeHA5MGgzQVhuYmhFbm5qWDBW?=
 =?utf-8?B?M3lQY3JIaWh4Rk5DckxxdkRnMkhiNHhtQVNhaklNMC9kQm83bGdKUGdFbnkr?=
 =?utf-8?B?ZkZ4eTZUbkN1Mlh2RXpoTGplQ0Y0a1NRbmhESEpWeXpFUmd3ek44R2JZd2Za?=
 =?utf-8?B?dWtVak1PNDdFaUV1aHdtaGxTcHVvTUlnVUVNYy85aktPdDJnblc2YUZEZjcy?=
 =?utf-8?B?QnBheHN3QnJMa240M040czUzSC9qWWlIRDZ2eEp4dWZFZm5HRGdGWi8zYVlF?=
 =?utf-8?B?V3JGY3pLTkIwcnhFK0ZuK042dTVHS25IUlZjSlBwMEovQ2pnbW5wNFFrUW1a?=
 =?utf-8?B?aDVDYmJOdFFvY2RWYUNVMWFVaW5MMzVmZ0NVdGdwbE9wbURUakYvQWJEMHk2?=
 =?utf-8?B?clh3TkJvdHFmUlpialE1UGRMSExkUk5PSnBpVy90K1VDZkZnYm5rcVhPd0dY?=
 =?utf-8?B?aEF1cUJLdmdHRFkxL2EyVkJwZ3pQNnZ6RjgxRE16N21CdzN6bEtUT2xmMGFO?=
 =?utf-8?B?czMrNS9qUVAyRlpzVXMwMnk3WGNTNldZOXpmMzQ0TjRMQWQvN0FWVnY3eC81?=
 =?utf-8?B?NU5WaVNyNW5MMURaRXdTKzB2VFJRNHVmM2I5bktoUVpUN2ExeGw5YktCNzFN?=
 =?utf-8?B?Q1VLTm9JK1JhajVGSmMrdUtlaFhLWWN6bUxCVi8xemFucUNwdzBmbEFyQllM?=
 =?utf-8?B?VXRoaGc5Zk1vSUFTZ3cyMWZvWWNWcTVHejZiWm9RUEViZFVZMU42U1cyUTlR?=
 =?utf-8?B?YnFYQzQyWmlqSU55S2NVakRlR3Zrbnc4NHRwWXhIYXpXTFNnNFVodnFhZkdK?=
 =?utf-8?B?eW9TM20xbzZLWjI0L1N6Z2xOR1U4ek9mVHN0R2cwbGdnWVBzUTdxVUFzUEVY?=
 =?utf-8?B?VFFldlpCQmsxekM4QzRyNDdTVnBDY1dPVzBQTmVQRzk2blp6S0hDWHZCWU1v?=
 =?utf-8?B?RWpncDFxR3RPeDFhY0JzWWVuUUtSNmF5bEpiMWRXaE9QdHExQXVsbVAvMjB3?=
 =?utf-8?B?NU5VWk0vNjROTllVQmszTGk2TDlSS3J6enliUUd0WEFTeUp6aFVBNGU1Unlk?=
 =?utf-8?B?VEwvV1kvTFRSZWZDWGZpQjU4Umk0N2lod21DTEljbVEzTGNBQk9DbDIxR3Ey?=
 =?utf-8?B?RTlCTHBTLzJraXhkalUvc1ByaFhncmVMRFVNY2MzRXFTTmw4bGtDd3JiYWhp?=
 =?utf-8?B?MXFLb3ZjUTB5NlU2YTg1clRjUVVNT1pMSEZ1MjkxU095UGgvZ3lPQWd0SGlP?=
 =?utf-8?B?UUZrd1hjK3hBMHFjcFFHWG5xNERzNlI0TnpyWStRNHFVM0VWUFp3dlVIRExw?=
 =?utf-8?B?M21KZkZGdksrQmxkVmQ1ZWFweGJhWkovbXpJb2toS1o2R0w1UTF6R3ROb0Vx?=
 =?utf-8?B?S1hIMlhreWkwSFBCUjF5aUJFMUQvcUxQcXBJZUJpR2RZUm45dzlOczVRUFJm?=
 =?utf-8?B?R2wrWU16ajVFaUxGRkFiVTJWUHp6QjA3MFNicU9yRzNTVzVicjdyWnB1N01v?=
 =?utf-8?B?QlRTYSsyMWFQdXlPaUplbDM5N09lM2dySExyMnVGWDBjUjhXam9IYzdNSUxJ?=
 =?utf-8?B?c3BqWTBJcm95a1ZUazFQTG96YVNlNTlFUmtXUnJ0R09ENURXMHpnNCtPRXpS?=
 =?utf-8?B?RnRjWmg0YW16S0w3NVpxTjBQYjFSUzFYQnJJQmFocklCa1dheWg1L1hrSUhK?=
 =?utf-8?B?M0J6c25vT3pnWFBUZkJ2S05DRllsWG8zRHJtNE5VZERmWDNlWTdyeTBwZ1FB?=
 =?utf-8?B?alcxQU5NV0lLdjIxUDJCaDF1Q1NIVXM2RDEvOVZOd3U5V2lLL2sxcnIzZjEz?=
 =?utf-8?B?aDBHWlJTbXgxZEMweHRaZHBqbEZ6aDE4cUh0b1VzUFUxWFVwd1c1dTlYaytI?=
 =?utf-8?Q?KDpP9awl8MsXdorRl8bpjCm+UBgOAQeRw010Y?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6cd4dc9-61a9-4570-d88f-08de844af0fb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 17:30:54.0052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QB04wIEOPSHX0liKSo1iP9QgyzXwYjxUt05Rz/6+egzN2LM0Et2r4QCBttd2K2hEWa+WkEpo8jJnZNxIneKvS/IrU6B+sF5fr/aoitLvZhMKoFhsnLwq7kIdLaEW/riI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10608
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29634-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 989312B07F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,
Thanks for your review.

On 3/17/26 13:50, Biju Das wrote:
> Hi Tommaso,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>> Sent: 13 February 2026 16:28
>> To: Tommaso Merciai <tomm.merciai@gmail.com>; geert <geert@linux-m68k.org>; laurent.pinchart
>> Subject: [PATCH v5 11/20] drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
>>
>> Add `out_port` field to the `rzg2l_mipi_dsi_hw_info` structure to store the DSI output port index.
>> RZ/G2L and RZ/V2H(P) use port 1 for DSI output, while RZ/G3E uses port 2.
> 
> Why RZ/G3E uses port 2 ?? why it cannot use port 1??

I think input ports should be numbered before output ports.
Also you [0] and Rob [1] agree on this on bindings patch.

[0] 
https://patchwork.kernel.org/project/linux-renesas-soc/patch/bcfe88f55ca42f45aaa3a364f293bd149b721701.1770996493.git.tommaso.merciai.xr@bp.renesas.com/

[1] 
https://patchwork.kernel.org/project/linux-renesas-soc/patch/9ae5c0d817ba697084be9022ad7fa20e9e167073.1770030493.git.tommaso.merciai.xr@bp.renesas.com/

Kind Regards,
Tommaso


> 
>>
>> Update `rzg2l_mipi_dsi_host_attach()` and `rzg2l_mipi_dsi_probe()` to use this `out_port` from the OF
>> data, facilitating future support for RZ/G3E SoC.
>>
>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>> ---
>> v4->v5:
>>   - No changes.
>>
>> v3->v4:
>>   - No changes.
>>
>> v2->v3:
>>   - No changes.
>>
>> v1->v2:
>>   - No changes.
>>
>>   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-
>> du/rzg2l_mipi_dsi.c
>> index f74a0aa85ba8..8ea8594afee8 100644
>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>> @@ -58,6 +58,7 @@ struct rzg2l_mipi_dsi_hw_info {
>>   	u32 link_reg_offset;
>>   	unsigned long min_dclk;
>>   	unsigned long max_dclk;
>> +	int out_port;
> 
> Can this value become negative? If not, use unsigned int or use u8.

Ack will fix that.

Thanks,
Tommaso

> 
> Cheers,
> Biju
> 
>>   	u8 features;
>>   };
>>
>> @@ -1153,7 +1154,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>>   	dsi->mode_flags = device->mode_flags;
>>
>>   	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
>> -						  1, 0);
>> +						  dsi->info->out_port, 0);
>>   	if (IS_ERR(dsi->next_bridge)) {
>>   		ret = PTR_ERR(dsi->next_bridge);
>>   		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret); @@ -1394,7 +1395,9 @@ static
>> int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>>
>>   	dsi->info = of_device_get_match_data(&pdev->dev);
>>
>> -	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
>> +	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node,
>> +					     dsi->info->out_port,
>> +					     0, 1, 4);
>>   	if (ret < 0)
>>   		return dev_err_probe(dsi->dev, ret,
>>   				     "missing or invalid data-lanes property\n"); @@ -1508,6 +1511,7 @@ static
>> const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
>>   	.link_reg_offset = 0,
>>   	.min_dclk = 5440,
>>   	.max_dclk = 187500,
>> +	.out_port = 1,
>>   	.features = RZ_MIPI_DSI_FEATURE_16BPP,  };
>>
>> @@ -1518,6 +1522,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
>>   	.link_reg_offset = 0x10000,
>>   	.min_dclk = 5803,
>>   	.max_dclk = 148500,
>> +	.out_port = 1,
>>   };
>>
>>   static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
>> --
>> 2.43.0
> 


