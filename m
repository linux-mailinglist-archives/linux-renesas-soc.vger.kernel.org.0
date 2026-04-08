Return-Path: <linux-renesas-soc+bounces-31017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFQgGF5i1mmDEwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:12:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 015D33BD77C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 420353004F09
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 14:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576F63A7F4C;
	Wed,  8 Apr 2026 14:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oW8oD+Pn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C62FFF81;
	Wed,  8 Apr 2026 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657564; cv=fail; b=SoWw5GLNCL9JyA55jmUDzK5cTjDs+hLVeNVbjDE0L5UI71q6LT1JyBVNwuNQ1cM5nD8pBalg/AscHuP8GLZqm+sZprc6XdZr7j0AMfMrD1usS4SbwwlvSnGbkY1otMO/d9SVdOopjCY/UxsMthRCOOGIADVmfb1adYClEw/cScs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657564; c=relaxed/simple;
	bh=nHWg0J5+RFo8RoqHJVxgU0pKdC24nmPt+vVe9Y+PAvc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fifinvq8HMz39tYzbMvlZQIE8T8rO+j+V90dWHAH04Av6CzfDtJCAzf5CaMpcr0af91uJpTR2U9BlWA89Kzzfb+nN57uw35bcWTQsRN2xONfNakB29B3ljxW671MPrSZIPdrBvowo6Z6/g0u0naW2nNDERkozvUpn4dzjfoK2yE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oW8oD+Pn; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rE04VZ4sKgI10KHYOvXch8ryP14wExaebBu24MU2aI2h6Ix+MGnvtL7OOapFFgA7AOA6D3RItj7ipXHwrgL54zMXBWKUHVLqhMNk2YZVRiyD8j5A9jz7UZyxNCVGy8YiPQjsHkVnOHRgz4fFje++2Lv3ynDpk95SPJSkNg1WCTdWwQXGLw5Sz+KaLfNbZFAJWDKcjnNRO6LNPcyci3PDdKCl7fYFzQ2A5oShlqsj82KUyk3s2A6pgj9TteR9l0T2PjXCvW5Su4+FZmLvM5PbLFCgEYEMLDsE/CvV/tsdWC52Mab+xY4FokgbLmIx90oDIaSnZLDe/+CKNfx1YdkCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikA6i7s8pGtRU87zfMCG0vbOj8ho4rKxsMHUg3W8Y4w=;
 b=uxGgA5FBp8yMCcyUWVioNSvjVqTBgjRIKq4PxPSZkh8kmXmkIgwjMxXXfqvkZTvrHnUbuDmFUKwi4gELZaTXToSTbi8ngg/8UnH733QUnWPUEt+afHm1A8fCE7Cz7Jf3GbiiYEMFgYmPFYuORU7d84kBG8KPbhnDzfQTTtMX+bkVuwmw0pdy6TTa5AiAhi0nt+hKe8jF0gi5BPfn4eFR2jBPLlUvXBEyPucukOtXSUYAG29lN3JrDXqcfiCdIATse6f/rP3s9lKleC180MpTMjJS3kwfxOWDOlrFvkESiFZ+zVf4++3AAgFj3p4WMPo+28Zapi4Vt4l1n2dBSL5PuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikA6i7s8pGtRU87zfMCG0vbOj8ho4rKxsMHUg3W8Y4w=;
 b=oW8oD+PnNMe28t1Y7bqNRDOTpk0LKg8HOYeeT3RaD6DE8ZAwMiVLTziOJBB+Oz8YStemtxNXY7Xi4exUuRlb4lOrdPr0Hp6WV5p6eskBEmueXL1H6cONhcSg2xjIzKW1gDtq4es0w+Nj4oPQ2Wk6/OlDZaiKt5yvEFDaHb0476I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB14292.jpnprd01.prod.outlook.com (2603:1096:405:212::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 14:12:38 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 14:12:38 +0000
Message-ID: <b8ded729-5c22-4a47-bfb7-8bffeed76e98@bp.renesas.com>
Date: Wed, 8 Apr 2026 16:12:22 +0200
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
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260408123102.GA1960713@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB14292:EE_
X-MS-Office365-Filtering-Correlation-Id: e41262ff-9c15-4e91-1b5b-08de9578e3b3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 ZrDuYIV3XUfO9kl03X9QqDrGZgx7LvJxa+RI57FiURl5sDgtDxGnNDFY+ITMRPqmNxFYIfuqClOCZBkf1LOiUdsI/j1Ya20xtWu1K0zL7nD3w74dklWGYZANP5YKEQ7rBsi85BpZjukuqL23w1ELOZgXGyYeVgmZk23/FurvbmNT/HM8vSTXLgMYrN0ZSq0rNg/G1Avup5F+Hu5joOdiW52IRQhgDhd2KE/zAz7L76z84yJWMYtyZGKGx9xk80V79wPAjUXM3sISJRP5ifd7CBhvhPDBYqWn1LUdkPCtGF/sTu+UynG6c+KIEbraJpujvRnIUZM4o/sALTnbfSI2k19SFnp9zIBOUxdvW/QwjdkXYeCKgEnnsVmsqqzkQ5gN4KchWtm9Z1AcRxRZGVEpDyHXeISuIhDMvnBmvQoDJwjPkbYUurYPolyxpiZoNJaVvjpnhOIu6IdohDSuEnp8MZ16VfmYg12cjcNxpOmbgw8ZszQeftwuFQnAoWTiS24GcscwMB2cm1ddb6AJh+cDqNlVid5fRJmmQ7zA5suEpHHtXrHRZUGIVe2UbYJRJ8WGh/NYeS/uZJNzdnptFBSrNTLUQY7zXHtgBS6DNTNASTs8QnZYvgy52Ll8Xw4M20enlxw8cPu3vNOLgjRoCpknLpTqLI3PKxSB6GZcLAmZ8LGdQLX+zjtjxAZ0Uyyf/ft517j5Lqwq4N/AZkXpzTAbI7eNHyc5gfnAp1sXBB/IVKY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WkFvYUpoOWk1RTdDdUVONWM0R0pPbFdmcHVUZkFZczd3bW52TGtmckJpZjg4?=
 =?utf-8?B?Wmx1a3JKUEtZMnJkOEU0cFM2UWV5bUxVL0FHR1JTdGFnSFlTYk9abUZub0Vr?=
 =?utf-8?B?WEJYVG1xak9VR3FhZ29wK2M2UzFlTDE1TDB6VlZNTFJtZ214Q1pma1Fla1ZP?=
 =?utf-8?B?WDc3QXBQZGg1U2FtSVAvdU0wUUt1WWZBK1hObStwSjFTS0VySEpIcVFTUXpN?=
 =?utf-8?B?eWo3Q0JPQVNOWk50bTRHN1dIMDdEeUFEaUxDT0xHdERKQ1AyOHp2anhrNGg3?=
 =?utf-8?B?elkzdm9PKytMSGtPWDdmTXVVOU85aHhhajBmNTBhT2xDVFlRWHRtREh4by8y?=
 =?utf-8?B?NldYK1pGTzJ0bmNlSXR4SnRRZ3R3WUYzMFZjZVBNMFZ3Zm5jaE1VaEtzbHdi?=
 =?utf-8?B?dVlsVnFqeFI5dGxKdHdYTGpiaVhVMGFkTXdxSzE3NmxrZVRzZm1lNHN0cVZm?=
 =?utf-8?B?cFh1eHZIejZnbXVGZlI2MHl1a1FGZTR3MnFlT21uaXphdGF1WDdBb3hsaWR5?=
 =?utf-8?B?dWhGa2xIaFV1VUV3YTBoTHl5UzJPalovOGEyVkd6L25NeWt2ajNYOVRScStr?=
 =?utf-8?B?MEpVMmxGc1lPSVViQ0krZnRqdmZLZXZRTDhNeTNYYmhnQVlodmZzUG5RQWND?=
 =?utf-8?B?WmM2Zzl3TGtKd2pUV2xGeUczYTBGV3VsbExJTlE2MzVIdm11RVBGejlBT2VP?=
 =?utf-8?B?RnhhdXhQN3RzMVo2eGZsK2EwaGJFd2ZWazhnVU9URFVsWjMvU013YTVkR2hP?=
 =?utf-8?B?cWxnUDAzNXFSTkxoZGxUeHVhT0dlbFZCeC9sUDVtUW9NWGRKMlA4VjZzazlj?=
 =?utf-8?B?WkhFTVlLeFVjdU5CNkRwNXRDZXlXR0tEblJlYmFhWmlmVTBSNnFMR1FrV3dk?=
 =?utf-8?B?VEdaNHhxb0JybUhIbEYxQWd0dlJGd2NTamJGNWVLUmJnOFpvUXgrL21OQm9j?=
 =?utf-8?B?Qmh5Y2VhNjYyL1ZIMHFIbjhlZjhTNTRoWXRWRmdSTVpWU2FtWjU0bDFwV0l2?=
 =?utf-8?B?Nnk3eUNSbnVXU0ZmODNHVmF4UmFpY1U2RmxDbk1vOTc5M3U0RW5TRStxYno2?=
 =?utf-8?B?ZzNOMER5ZXJ5SEVSWDFBeU83cmt2OFRxWGQ5WE1tblZNMk9YRG43M25EMlk4?=
 =?utf-8?B?N3h5SHZjZ0dmdDEyR1N4eFM3UXNlVkRrNDh6RXhXbDhyTWJzM0JiZVFuWjd1?=
 =?utf-8?B?Qm1pSGFwQkpZQVI3NktwUk5HMmhWcUwxVGFNa3RIemhDSVBkN2s2ZXZneDY0?=
 =?utf-8?B?N2Z5L01pRVdhU1JxZHNzWHJUYlV4bEJ3dXRGTEVpMFhmaEdsYjVkcUJBVHNy?=
 =?utf-8?B?Wnhub3dxUW5Pak5acm0ySTB4LzROZWMwVmxWVlBmdjkyampXZkZLMzBRN3Yv?=
 =?utf-8?B?dGdxRjFSUmRrNVczcUU5TGo4MkEvRForMEY1QU9iUVBnNmx5TGlGN1hiYkpt?=
 =?utf-8?B?ajFoaXJyaGtDd2hJSmtmUXBNclkvRVEzcGhQNFJWdTlSUnRTcG5VaUtCY2p6?=
 =?utf-8?B?aVpoVW1lQXBkdDhWL2p0eU9IOHZGMHk3MENwMUtQSWtaVkhHdHJSWlQ5Vzh2?=
 =?utf-8?B?ay9mR29hOStUNDdyeThGdnh0RVVBZzJuWHo2aDNKdWJUaXVMSmk5MSs2eWRu?=
 =?utf-8?B?SFo5cXUvcTNRS05LV0tUZ1Y5OXZ0Qi9hYkRhRjdOd2xMeVB4ZGV2OW0xdDkv?=
 =?utf-8?B?UDRwZzFNbEhiaHhmS1FZM0N6VGMwOGl4bjBlMWdQTyszMnM2b3V3dENTLzlZ?=
 =?utf-8?B?eC9NRG9nWmtnQU0xdkRBVFRiUnAvbTAxaklWcE8zTi9GbzFLRWxjdlJBRFZh?=
 =?utf-8?B?NWlBT1Y1V2p0OTdQMU9raERpNEZ2TDQxOVU3ZlF2U25YWVRtbzlBZ1VVL1Zo?=
 =?utf-8?B?aEhSY0JIOWRZUk5BRitOdDFQaXNkN3F3WHh2aWttOVVKVmx0VUpqUHYxWGpM?=
 =?utf-8?B?MGlvTkFieVF4SGJIdERob0ZtcGdUa2ZHa1BRZU9YUVErYjVqUlB6eEJtTGVF?=
 =?utf-8?B?VWhQZ1V0TkVTZ3BSVHZwMGN1QU8xVy9abkdqWmtvUzVCYW50bDE0V0xaa08x?=
 =?utf-8?B?U1pLMFovNlZWY2lHRjg1TlE1UXhjUEhkQ1FhM21TdFlWUW5GMU9sMGxqT0hB?=
 =?utf-8?B?eFlmM3NJSGMvTGJNbW1iVTdLTTk2TWNPY2k3VlRCSFh2cXZyVzRvYk1QMkJC?=
 =?utf-8?B?R3VJMWZ6cXhOU3FTbWlPZjZCWmxhQUllMGlWRDJieUQzcnpnTUVrRjEybWRv?=
 =?utf-8?B?V0JnNExSS3hLRllBV3p2ekZONzJVUFc5dG5XUVBZYjEvZHk4T0xpdnA4ZkY5?=
 =?utf-8?B?bXNFNEVDd2hudmlReG9EK1VSV1BIWGVKUGFpMWswZ01pUUtHNDJFdEgrcUR3?=
 =?utf-8?Q?LlY6WTfxZWFAvr4rdf4LDoeBWuwoOa2mLQzCk?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e41262ff-9c15-4e91-1b5b-08de9578e3b3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:12:38.3163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4PZTGdsGTrXtf9N6x/xcpLBi0J5VnxSNsaG9SOoaPI3jq4HQSeYoTDdSjupFHXqM9TZ8CCHA+g2Xpt9d5lRay3X5pXZ8oQj+eP2ZN7G4VJU1TjeVq3oCUhI/F9dR0tI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14292
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31017-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c09:e001:a7::12fc:5321:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2603:1096:400:3e1::6:received,100.90.174.1:received];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,bp.renesas.com:dkim,bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 015D33BD77C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,
Thanks for your review.

On 4/8/26 14:31, Laurent Pinchart wrote:
> On Wed, Apr 08, 2026 at 12:36:58PM +0200, Tommaso Merciai wrote:
>> The MIPI DSI ip found in the RZ/G3E SoC select the video input clock
>> based on the DU instance actually connected using the GPO0R register.
>>
>> Add this feature to the driver using `RZ_MIPI_DSI_FEATURE_GPO0R`, update
>> the code accordingly to manage the vclk selection with the introduction
>> of `rzg2l_mipi_dsi_get_input_port()`.
>>
>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>> ---
>> v5->v6:
>>   - Moved rzg2l_mipi_dsi_link_write() into rzv2h_mipi_dsi_dphy_init()
>>     + comments from HW Manual.
>>
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
>>   .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 71 +++++++++++++++++--
>>   .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  3 +
>>   2 files changed, 68 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>> index be6dbf19a24e..947c8e15fc4b 100644
>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>> @@ -37,7 +37,9 @@ MODULE_IMPORT_NS("RZV2H_CPG");
>>   
>>   #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
>>   
>> +#define RZ_MIPI_DSI_MAX_INPUT	2
>>   #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
>> +#define RZ_MIPI_DSI_FEATURE_GPO0R	BIT(1)
>>   
>>   struct rzg2l_mipi_dsi;
>>   
>> @@ -81,13 +83,14 @@ struct rzg2l_mipi_dsi {
>>   	struct drm_bridge bridge;
>>   	struct drm_bridge *next_bridge;
>>   
>> -	struct clk *vclk;
>> +	struct clk *vclk[RZ_MIPI_DSI_MAX_INPUT];
>>   	struct clk *lpclk;
>>   
>>   	enum mipi_dsi_pixel_format format;
>>   	unsigned int num_data_lanes;
>>   	unsigned int lanes;
>>   	unsigned long mode_flags;
>> +	u8 vclk_idx;
>>   
>>   	struct rzv2h_dsi_mode_calc mode_calc;
>>   
>> @@ -543,8 +546,8 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
>>   	unsigned long vclk_rate;
>>   	unsigned int bpp;
>>   
>> -	clk_set_rate(dsi->vclk, mode_freq * KILO);
>> -	vclk_rate = clk_get_rate(dsi->vclk);
>> +	clk_set_rate(dsi->vclk[dsi->vclk_idx], mode_freq * KILO);
>> +	vclk_rate = clk_get_rate(dsi->vclk[dsi->vclk_idx]);
>>   	if (vclk_rate != mode_freq * KILO)
>>   		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
>>   			mode_freq * KILO, vclk_rate);
>> @@ -687,6 +690,19 @@ static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
>>   	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R,
>>   				 FIELD_PREP(PLLCLKSET1R_PLL_K, dsi_parameters->k));
>>   
>> +	/*
>> +	 * From RZ/G3E HW manual (Rev.1.15) section 9.5.3 Operation,
>> +	 * 9.5.3.1 Power on Reset and Initial Settings for All Operations.
>> +	 * Figure 9.5-4 Power On/Off Sequence show that after writing to
>> +	 * GPO0R.VICH register we need to wait for more than 1 x tp before
>> +	 * writing to PLLENR.PLLEN.
>> +	 *
>> +	 * Note: GPO0R is a link register, not a PHY register. This setting
>> +	 * is specific to RZ/G3E.
>> +	 */
>> +	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R)
>> +		rzg2l_mipi_dsi_link_write(dsi, GPO0R, dsi->vclk_idx);
>> +
>>   	/*
>>   	 * From RZ/V2H HW manual (Rev.1.20) section 9.5.3 Operation,
>>   	 * (C) After write to D-PHY registers we need to wait for more than 1 x tp
>> @@ -1005,6 +1021,37 @@ static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi)
>>   	return ret;
>>   }
>>   
>> +static int rzg2l_mipi_dsi_get_input_port(struct rzg2l_mipi_dsi *dsi)
>> +{
>> +	struct device_node *np = dsi->dev->of_node;
>> +	struct device_node *remote_ep, *ep_node;
>> +	struct of_endpoint ep;
>> +	bool ep_enabled;
>> +	int in_port;
>> +
>> +	/* DSI can have only one port enabled */
> 
> Why is that ? The hardware supports dynamic input selection, why can't
> it be supported at runtime ?

For runtime/dynamic you mean using DT overlay??
like, remove:

Removing - DU0 --> DSI (input 0 | port@0 ) overlay and
install  - DU1 --> DSI (input 1 | port@1 ) overlay and
viceversa?

Kind Regards,
Tommaso

> 
>> +	for_each_endpoint_of_node(np, ep_node) {
>> +		of_graph_parse_endpoint(ep_node, &ep);
>> +		if (ep.port >= RZ_MIPI_DSI_MAX_INPUT)
>> +			break;
>> +
>> +		remote_ep = of_graph_get_remote_endpoint(ep_node);
>> +		ep_enabled = of_device_is_available(remote_ep);
>> +		of_node_put(remote_ep);
>> +
>> +		if (ep_enabled) {
>> +			in_port = ep.port;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!ep_enabled)
>> +		return -EINVAL;
>> +
>> +	dev_dbg(dsi->dev, "input port@%d\n", in_port);
>> +	return in_port;
>> +}
>> +
>>   /* -----------------------------------------------------------------------------
>>    * Bridge
>>    */
>> @@ -1425,9 +1472,21 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>>   	if (IS_ERR(dsi->mmio))
>>   		return PTR_ERR(dsi->mmio);
>>   
>> -	dsi->vclk = devm_clk_get(dsi->dev, "vclk");
>> -	if (IS_ERR(dsi->vclk))
>> -		return PTR_ERR(dsi->vclk);
>> +	dsi->vclk[0] = devm_clk_get(dsi->dev, "vclk");
>> +		if (IS_ERR(dsi->vclk[0]))
>> +			return PTR_ERR(dsi->vclk[0]);
>> +
>> +	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R) {
>> +		dsi->vclk[1] = devm_clk_get(dsi->dev, "vclk2");
>> +		if (IS_ERR(dsi->vclk[1]))
>> +			return PTR_ERR(dsi->vclk[1]);
>> +
>> +		ret = rzg2l_mipi_dsi_get_input_port(dsi);
>> +		if (ret < 0)
>> +			return dev_err_probe(dsi->dev, -EINVAL,
>> +					     "No available input port\n");
>> +		dsi->vclk_idx = ret;
>> +	}
>>   
>>   	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
>>   	if (IS_ERR(dsi->lpclk))
>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>> index 2bef20566648..cee2e0bc5dc5 100644
>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>> @@ -83,6 +83,9 @@
>>   #define LINKSR_SQCHRUN1			BIT(4)
>>   #define LINKSR_SQCHRUN0			BIT(0)
>>   
>> +/* RZ/G3E General Purpose Output 0 Register */
>> +#define GPO0R				0xc0
>> +
>>   /* Tx Set Register */
>>   #define TXSETR				0x100
>>   #define TXSETR_NUMLANECAP		(0x3 << 16)
> 


