Return-Path: <linux-renesas-soc+bounces-31024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKPoMhBt1mkQFQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:58:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 306083BDEA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DAC3300D14A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 14:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327C13D47A7;
	Wed,  8 Apr 2026 14:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YEbEZc36"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB9F3AF65D;
	Wed,  8 Apr 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775660298; cv=fail; b=HnHo+mxmEJLP1vqCaB3ibE2hnl47+F4xAVJIndh46AWmG6hkBvI9nbbulKyFbfTZsPP55jav7SXBPHMpBIby+XyGzwJzuOLjpGFWoRs9F5SDOr1Xz6cGn2YYm+MeqPABSSZqOPU3c4mbMLKud1AWm/Rv9n2bTGCdy/BKBuXuf/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775660298; c=relaxed/simple;
	bh=W5vfUFUHoGnPj+o5HMHjZYeDcBZHVO92ftn6Q1Cji1k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i4emFwrC71u5EPO+DV05PMx4sQ/3L95Z46ls9NV78sB7Di/qRDLg0EyI8dRUkHgKs9KnX2ZNjFJTAJMdJBsLytPlCUnyZqVfU5xe5bXffR184CnXQoJ4Lvl66O63syeAXVxh4FGNkgCttYtOORIROk12Yd3qft+1Rb09eDuxL+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YEbEZc36; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xvfd2Rp23QprApVvV7RC3G5fgVEUjjmA+UplqpwbN8PzhisIZJ96D+6SM6gYj/OiLpvjve+JGz7jA89PFWwBFM3xZVAOfj74UB+eknD0G3NlUN60bZLyIv0e23xLyRgaalELzizKC2Efj+xwbr1+WrhpYHeDKx2cAEwQFj/i6XmIzj/wKvZBiiFlTeigwpu/oh3Fhp5BpiUHxe0xEuFfb6HZpA35AfqWNQzDxc7sXJWKJpQfOArmV/G/SUv3MmvkOR9yiBAx14pAtBAzXpMUoVujuebu5j5QXOvszIIlEWwEWGercZTy8ebwXJPuRFCHxSX71+xN6i7+ukhZHKizXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TS+eS9wT+NLlBl1JHKa1RHAsBTQjUFmKO7BD7ACDBg=;
 b=ozpj4DGQx+dhHx7tXl2Obl1Imd0foTdR6pq1L4gfSR5O+RA/C4pe79NqMlNd0TNl0oj6BNxhNYxZ1paD2aC8Rx++Ins/b28APnEThhkayewI7Ayv5iuvXYB5JK0lAr/D7irUfHiya5LfyvOnkviEYdhGNvipWZ/L1enRPrcSCiuN/FN1GQKPByLZ9JEyGT8fLjCNdPWcAzo3L5WhyGCpbdDbdooEvG8EMsJrNa3MkVeZsxkIyoU31bkCckmuG0/YXlUCyNjixJiJ2z6/dGtzDf44QBfmbQeEWAFebNb+w+NINyhTJ9oTjC9TmzgKcOtLZttuPqonEDxDYgOKwEd+VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TS+eS9wT+NLlBl1JHKa1RHAsBTQjUFmKO7BD7ACDBg=;
 b=YEbEZc36v6VvJt30HN+gBqhiNnxJLkq6WLSyxCJJIzyZ3qWZKd5AMg8B6wM2OEEIXJ1bRO/zptLgtCWymSF76btECLxbU+Td+hedlffxDs5WrjCIb0WDkr9R6FYQTCxUf3f5GsssDsPuns093kizPyLOVQHuJ6o3TqKfU5CPbFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB12480.jpnprd01.prod.outlook.com (2603:1096:604:32b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 14:58:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 14:58:13 +0000
Message-ID: <136a9922-48ae-48e2-8cb1-14559206e7af@bp.renesas.com>
Date: Wed, 8 Apr 2026 16:58:01 +0200
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
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260408141719.GB1965119@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB12480:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d839b3-b420-4385-d7ad-08de957f4208
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 KrLXe6se0G4D1oJhzX29hxu9PKDP2eoCXVqeUCP6nULTCdq6i1G6nkhCK4pVo4eUHbIRo7kKJCUGnu1qZfsNIavioTytOgs/Y0tng3ms0lkqjX/0bdGACBRYkuzIlLQbJ6P9Ho8bZnlt6ycC2AjsP410v5WPWM4RujybH9Au9ITrR0Aey/9GgneIDY4b4qutdbGv1gUApRuUk4uxnU3Xs7G/jWo5C73Ch5TyjXYGG5seTtmsQrFVt2gqUNsL6fifyb4iV4n/popdZLNW5m+H82lNM8n29BjMCymWGy6Z6ACABWjf7l3dHXpanaT1C/0suPatJVADMNPIuMvAHPf1f2HeZILEk1rfsJV3v2AX2wKKrEhXdbKIGwEN9nrux1HpHMcEX3qNWgNITnOCPapX9tpHfpbouni9P7vxThQ5BURk42/AeCIy8rYMe2HiTlX1MCsdCZhrJWuHD81Vvfy427Y4YT/TByFfa+6NmQhvxpw9rhkQvLnZchwYh3nayHARI262zNLD3mIeMJlut5RmcHpDkhe1hhzXF/S9ULm7lAAIYAF3vb0nN+I9Iljc5qlDPLHZTLjWrjVBCWifb/IsMNUX0ewv1phkLjdpKBiKlUGaPBC0563tYWKocF9LuXT9Ohg1MrrISKW5k56KgUTiK9evgwyWhTB3spKgKRlFg8XnS5OIetQS+kSpPfR8K/VrAg5E6yLvtHsITz+T2DOFmJIHCmYutLQs8eFGv1XkywA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TEE1TXM4RVlMaU1wWC8xRUs1dWh6VkI1NEVGa2RKaWVqcllVOEUxMUNtSzM1?=
 =?utf-8?B?QlJWU21tVWxwM1JkRCtoaDJaL1lFWFpsNE15ZStXVTJSYmQvaHFHZnVKVjFs?=
 =?utf-8?B?ekZQK3REbjNzbkRwL1Y1NmlMRXZtNjNHcmw3T2JvNlBaVWt0V21XZzFpL0lT?=
 =?utf-8?B?WTB4YW9PRjBVU2Q1SHQxcHovbzk3TFdHa2dxdWhFYjlRQllheHUzV2Y5SkxK?=
 =?utf-8?B?aWZ4OHphby90Mm1lcWh5YTJwc0ltL3FDZ2pPMHczZVpPRitTd0NRV3BQNXJ4?=
 =?utf-8?B?OERwS3loSlVLeVNsckdTdHU1Z0FjZGd5YUNvcEloMFIvOW5lS2c0NGQ1VVBl?=
 =?utf-8?B?QjdQbzRKdGlzYW5FTzZsQnlFUjBtYTVQVDZFQkJzQjNrb2pTVFl4MUpZR215?=
 =?utf-8?B?bi9pNW9mV2Z4RkkwVng1L2tua0hwSlZjMXB4WU5SckFsMmNwcHhRc1ZjSCs2?=
 =?utf-8?B?TXlBQ3JMSWFiSGZvYk8xS090RVZQTTNHL1dwVHR4QnZkd0lqR09nRU8wUjhz?=
 =?utf-8?B?eGRpVFdMRXY2MUFVRTFIMFVtdW9leGhIRXJndlhwd2NhS1BWM0dWZU0wRXE4?=
 =?utf-8?B?WktOdUFlNE81algwTkxOZHhYUTh0dXhtWVhRcTFKSTBtUGpDTmRuSHNpdS9t?=
 =?utf-8?B?Y0FDU0ltR0ZIc2d2Z1dtbWdxcUxER1NNTlhHc2tkNE5XK2xENVkvQTMwN2xJ?=
 =?utf-8?B?aVlrMFRBZzdPNWFPUThPeE16UDVFWHVYWlgrSEtiZThMUE0vMExPckdEWTJw?=
 =?utf-8?B?QkVURmJpOWNWZ1hmWlpNdmtJSUZsT1EvcUFFR1F1SnVQRDg5dWxiVEhwazBi?=
 =?utf-8?B?YytzdkZOWHpqa3dvdGx6ajdvRVBMbFRaN0JLdEs2ZURiVHVBajRRU09LT05J?=
 =?utf-8?B?TWh6U0MvSkZzK0VuM0RsMUptWDZ0ZWpEeG16Umh3eVVFWm5TcUUxUi8vS2F2?=
 =?utf-8?B?MHdXZDJLU29ORFVLdk01S25oNWVRNWRhZi9nbU9Camo3Skg5YjJJTTNLMmVa?=
 =?utf-8?B?ZWxTSnN5SFFEOEVVblh3eldWTDdIeVV4ZEVRV0VBT2g5T20wTldzY0REbDNu?=
 =?utf-8?B?L1ZOak9GbkhLSWpsMDVjeUM2QzRwbTRmYWVGZGw1SzUyRnJta1FRM3hZTmZs?=
 =?utf-8?B?TUdWNmM4eUh6RzdCa2JUSlM2N3lUNTVjbmo4RDZ1eWxqdGtRdmJINkNWTFVU?=
 =?utf-8?B?VUhVaEl5aDFzMHkxMzJWY1RWR2huNS9iQzFaUG9YSjR3bkNQUldyQ1ZaTDFx?=
 =?utf-8?B?YjdEdDMyWGkyWnFvY25vbmpidVZEZmg4NDVyazFSWXZIVVpKL0xRalVjY2VK?=
 =?utf-8?B?N09oMjN0R1BrYnFwQTl5R1NmMHRjVGh2dGk1THluUGl5RDcwQnFoOTZVVWw2?=
 =?utf-8?B?OHo2UUs0WE8vRjJid0dJZHFtOERPVzBFWmw1OGhYQjdSbXpjNGZHTmNEMnhu?=
 =?utf-8?B?VHZYRUpGNnp4RUJHWEova1BsTHR4ZnZVQXh5TVNycEVyQkdQdC9mcjcxeDE0?=
 =?utf-8?B?cmxLT29Rbkp0U3haVXA5WUVmTDZrck5ZajNxN28zaUlHaURsVmh6V3dpTnlO?=
 =?utf-8?B?MW83cWJqVWNSRUQ2bEdQK212OGhhOWJnMHhwTFBqYjlSb3EwNExyQVdqbkd5?=
 =?utf-8?B?OXh4djVSU0J1NlRocllweXVOM2lQZjFHTjgrSGY3WlZzZWRvOW93VVE1aTRa?=
 =?utf-8?B?Y3g3SW9KYnc3cU5TSThkd0QxaGprT0FUTWhUNi9tL2tTakYvQzhsTEM0Rm5n?=
 =?utf-8?B?UFFFZ2Q0endYTXppWUNnejVxUElzVk4veHMvbUR0TjRqcnJwQ2VxbVZLTEpr?=
 =?utf-8?B?SDlaRHcvc09WQzlxcGpZWkppaUZrYTBBZUdCV2U2b25sM3d6MVBQSlJOK2FO?=
 =?utf-8?B?eG1BM3VRdnhHaVRONlNvcjBORjRVU05jSXBYUEhDbTBoT1plM3hHQnViRHNk?=
 =?utf-8?B?YVBqbmthVXhhY3ZOYzFHVlpieXpJRkJ1eW5XN1I3RTVvU0k5a3Eza0VlSElm?=
 =?utf-8?B?Mk5SMHdrYng0U2NtY2x4N3VKbTlyUVJTM2xwejlOT2lhbUQ1cmxsci8vaHJC?=
 =?utf-8?B?ckYxdTJiVHJwa1ZoSWc5dndXb2xNZ1d2UHFOdDd4MFQwRUY5eVZnOG5oSyta?=
 =?utf-8?B?Mlc5MFBFS2M4SVVKRDhYY1NqQ25qOHlsalFaYXFyUVd3c3FKdHJrQkFYRHpj?=
 =?utf-8?B?NUVHMDc3WWJVaWxDV09JMERtdC8wbDlNR3krMVk3emtJRDdnd1ZnMmYwZnkz?=
 =?utf-8?B?QzBWaVVWK0xLMzlqTFRIaklXN1pkUXVnViswSjlZTjJteFRRVlhNUWtsZ2JB?=
 =?utf-8?B?bytGMlZ0QmxBd28yaUlHWFdYUks4OEorNEoyYTNpNzBMN3BXNEpZakV2bHRD?=
 =?utf-8?Q?ezu2PTBtK5FBWdXila46frUejLbpbeCubVSB3?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d839b3-b420-4385-d7ad-08de957f4208
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:58:13.5801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXgUJQZsWMeBj0rZ1+4C0k1lFA5kgHAJpzF1LVRbXtbmECK+6eyttD120noOmKr474K6NOekP6HpE9smsulA7EtvHaEibWBOwiyF6HXjZx8BL6QuiMSHJB42qmjUicqh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12480
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31024-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,0.0.0.1:email,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 306083BDEA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,
Thanks for your comments.

On 4/8/26 16:17, Laurent Pinchart wrote:
> On Wed, Apr 08, 2026 at 04:12:22PM +0200, Tommaso Merciai wrote:
>> Hi Laurent,
>> Thanks for your review.
>>
>> On 4/8/26 14:31, Laurent Pinchart wrote:
>>> On Wed, Apr 08, 2026 at 12:36:58PM +0200, Tommaso Merciai wrote:
>>>> The MIPI DSI ip found in the RZ/G3E SoC select the video input clock
>>>> based on the DU instance actually connected using the GPO0R register.
>>>>
>>>> Add this feature to the driver using `RZ_MIPI_DSI_FEATURE_GPO0R`, update
>>>> the code accordingly to manage the vclk selection with the introduction
>>>> of `rzg2l_mipi_dsi_get_input_port()`.
>>>>
>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>> ---
>>>> v5->v6:
>>>>    - Moved rzg2l_mipi_dsi_link_write() into rzv2h_mipi_dsi_dphy_init()
>>>>      + comments from HW Manual.
>>>>
>>>> v4->v5:
>>>>    - No changes.
>>>>
>>>> v3->v4:
>>>>    - No changes.
>>>>
>>>> v2->v3:
>>>>    - No changes.
>>>>
>>>> v1->v2:
>>>>    - No changes.
>>>>
>>>>    .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 71 +++++++++++++++++--
>>>>    .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  3 +
>>>>    2 files changed, 68 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>>> index be6dbf19a24e..947c8e15fc4b 100644
>>>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>>> @@ -37,7 +37,9 @@ MODULE_IMPORT_NS("RZV2H_CPG");
>>>>    
>>>>    #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
>>>>    
>>>> +#define RZ_MIPI_DSI_MAX_INPUT	2
>>>>    #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
>>>> +#define RZ_MIPI_DSI_FEATURE_GPO0R	BIT(1)
>>>>    
>>>>    struct rzg2l_mipi_dsi;
>>>>    
>>>> @@ -81,13 +83,14 @@ struct rzg2l_mipi_dsi {
>>>>    	struct drm_bridge bridge;
>>>>    	struct drm_bridge *next_bridge;
>>>>    
>>>> -	struct clk *vclk;
>>>> +	struct clk *vclk[RZ_MIPI_DSI_MAX_INPUT];
>>>>    	struct clk *lpclk;
>>>>    
>>>>    	enum mipi_dsi_pixel_format format;
>>>>    	unsigned int num_data_lanes;
>>>>    	unsigned int lanes;
>>>>    	unsigned long mode_flags;
>>>> +	u8 vclk_idx;
>>>>    
>>>>    	struct rzv2h_dsi_mode_calc mode_calc;
>>>>    
>>>> @@ -543,8 +546,8 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
>>>>    	unsigned long vclk_rate;
>>>>    	unsigned int bpp;
>>>>    
>>>> -	clk_set_rate(dsi->vclk, mode_freq * KILO);
>>>> -	vclk_rate = clk_get_rate(dsi->vclk);
>>>> +	clk_set_rate(dsi->vclk[dsi->vclk_idx], mode_freq * KILO);
>>>> +	vclk_rate = clk_get_rate(dsi->vclk[dsi->vclk_idx]);
>>>>    	if (vclk_rate != mode_freq * KILO)
>>>>    		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
>>>>    			mode_freq * KILO, vclk_rate);
>>>> @@ -687,6 +690,19 @@ static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
>>>>    	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R,
>>>>    				 FIELD_PREP(PLLCLKSET1R_PLL_K, dsi_parameters->k));
>>>>    
>>>> +	/*
>>>> +	 * From RZ/G3E HW manual (Rev.1.15) section 9.5.3 Operation,
>>>> +	 * 9.5.3.1 Power on Reset and Initial Settings for All Operations.
>>>> +	 * Figure 9.5-4 Power On/Off Sequence show that after writing to
>>>> +	 * GPO0R.VICH register we need to wait for more than 1 x tp before
>>>> +	 * writing to PLLENR.PLLEN.
>>>> +	 *
>>>> +	 * Note: GPO0R is a link register, not a PHY register. This setting
>>>> +	 * is specific to RZ/G3E.
>>>> +	 */
>>>> +	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R)
>>>> +		rzg2l_mipi_dsi_link_write(dsi, GPO0R, dsi->vclk_idx);
>>>> +
>>>>    	/*
>>>>    	 * From RZ/V2H HW manual (Rev.1.20) section 9.5.3 Operation,
>>>>    	 * (C) After write to D-PHY registers we need to wait for more than 1 x tp
>>>> @@ -1005,6 +1021,37 @@ static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi)
>>>>    	return ret;
>>>>    }
>>>>    
>>>> +static int rzg2l_mipi_dsi_get_input_port(struct rzg2l_mipi_dsi *dsi)
>>>> +{
>>>> +	struct device_node *np = dsi->dev->of_node;
>>>> +	struct device_node *remote_ep, *ep_node;
>>>> +	struct of_endpoint ep;
>>>> +	bool ep_enabled;
>>>> +	int in_port;
>>>> +
>>>> +	/* DSI can have only one port enabled */
>>>
>>> Why is that ? The hardware supports dynamic input selection, why can't
>>> it be supported at runtime ?
>>
>> For runtime/dynamic you mean using DT overlay??
>> like, remove:
>>
>> Removing - DU0 --> DSI (input 0 | port@0 ) overlay and
>> install  - DU1 --> DSI (input 1 | port@1 ) overlay and
>> viceversa?
> 
> No, I mean configurable by userspace, with two CRTCs sharing one DSI
> encoder.

Sorry, question:
  - Is it possible to create CRTC from user space?

 From hardware point only one DSI input is selectable out of 2 LCDC's at 
a time.

References:
  - 9.5.2.2.3 9.5 MIPI DSI Interface (DSI)
    General Purpose Output 0 Register (DSI_LINK_GPO0R)

  - 9.5 MIPI DSI Interface (DSI)
    9.5.1.2 Block Diagram
    Figure 9.5-1 Video Input Interface

Kind Regards,
Tommaso

> 
>>>> +	for_each_endpoint_of_node(np, ep_node) {
>>>> +		of_graph_parse_endpoint(ep_node, &ep);
>>>> +		if (ep.port >= RZ_MIPI_DSI_MAX_INPUT)
>>>> +			break;
>>>> +
>>>> +		remote_ep = of_graph_get_remote_endpoint(ep_node);
>>>> +		ep_enabled = of_device_is_available(remote_ep);
>>>> +		of_node_put(remote_ep);
>>>> +
>>>> +		if (ep_enabled) {
>>>> +			in_port = ep.port;
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	if (!ep_enabled)
>>>> +		return -EINVAL;
>>>> +
>>>> +	dev_dbg(dsi->dev, "input port@%d\n", in_port);
>>>> +	return in_port;
>>>> +}
>>>> +
>>>>    /* -----------------------------------------------------------------------------
>>>>     * Bridge
>>>>     */
>>>> @@ -1425,9 +1472,21 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>>>>    	if (IS_ERR(dsi->mmio))
>>>>    		return PTR_ERR(dsi->mmio);
>>>>    
>>>> -	dsi->vclk = devm_clk_get(dsi->dev, "vclk");
>>>> -	if (IS_ERR(dsi->vclk))
>>>> -		return PTR_ERR(dsi->vclk);
>>>> +	dsi->vclk[0] = devm_clk_get(dsi->dev, "vclk");
>>>> +		if (IS_ERR(dsi->vclk[0]))
>>>> +			return PTR_ERR(dsi->vclk[0]);
>>>> +
>>>> +	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R) {
>>>> +		dsi->vclk[1] = devm_clk_get(dsi->dev, "vclk2");
>>>> +		if (IS_ERR(dsi->vclk[1]))
>>>> +			return PTR_ERR(dsi->vclk[1]);
>>>> +
>>>> +		ret = rzg2l_mipi_dsi_get_input_port(dsi);
>>>> +		if (ret < 0)
>>>> +			return dev_err_probe(dsi->dev, -EINVAL,
>>>> +					     "No available input port\n");
>>>> +		dsi->vclk_idx = ret;
>>>> +	}
>>>>    
>>>>    	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
>>>>    	if (IS_ERR(dsi->lpclk))
>>>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>>>> index 2bef20566648..cee2e0bc5dc5 100644
>>>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>>>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>>>> @@ -83,6 +83,9 @@
>>>>    #define LINKSR_SQCHRUN1			BIT(4)
>>>>    #define LINKSR_SQCHRUN0			BIT(0)
>>>>    
>>>> +/* RZ/G3E General Purpose Output 0 Register */
>>>> +#define GPO0R				0xc0
>>>> +
>>>>    /* Tx Set Register */
>>>>    #define TXSETR				0x100
>>>>    #define TXSETR_NUMLANECAP		(0x3 << 16)
> 


