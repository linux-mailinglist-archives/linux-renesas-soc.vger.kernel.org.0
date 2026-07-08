Return-Path: <linux-renesas-soc+bounces-34842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 40mCGCgOTmpQCQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 10:45:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B897234BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 10:45:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=it6sIruR;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6579C303A737
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 08:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA13402BA0;
	Wed,  8 Jul 2026 08:38:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D82402443;
	Wed,  8 Jul 2026 08:38:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499904; cv=fail; b=nI7dGlQnFoXeiFQEWExEnrukRWqFaDemxd1Ev/Mj1erAGpwyEBqVNlDOpMW9HY9xlTajJqhLQZ4WuRiDwBvVxiobGMxr94Gx8MCLj8UAKbme0SjjLHj+e3s6VdMyRGUmBh9GhW3RCnRxgBnF+KqT35Mktere/XH7lA/f9RN3zxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499904; c=relaxed/simple;
	bh=uuoVErvj9NiAZ11reISP0O3zyTG/lgAYkXJSyFm1u2A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KxcUu794zNnjdGke6PHMcVoRSPXz3b1+XUaYXb4yDM6khZgWbL+08QHDzdqMwZcS5zbnV9uEyB/dh3IiosIqK1rh1LwNuFsDQYLgEDsgpavslst99PMX/VFeM8o5BpWlWsTv4j7z5bE/2YSLpnnr+3sY3X4Dt976v4OZouyyy/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=it6sIruR; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5wBf+EDH2VngzHuMOvAwjicXmgC+AyKXD3wuFbyhfg/cwwtZ8/tS99uMmn6uA3BLyG52zvsobTmEw4MN9tI//FgRJlyctrvL6jHR547SZ+D/wYxkamVYE3TYWe4+TmJOhf8l6r7tZvAAJ8198d521hJD+qljcwnf/CM+4u+N6Kbsb6T6ppKZq4eb/m2VOFarUANrGLQFaA3e0GjVU6aqFL0/VvIRPy+2CcffV5wpiXjoFeI5pg7QEQ9ctbu5LR8JzT5XsUFUAVHAkeRPukl9U+A66u06MxSUvF/Hao6ZWewBPLhKuNFQT2sijzbfHV5lAmANvbTW6Di9OB/9iWssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuoVErvj9NiAZ11reISP0O3zyTG/lgAYkXJSyFm1u2A=;
 b=Nvb7GsQYhv16WelavXYk4OtEL86QBSTZiFIaO0+FUF+Qui1lgM+ZCOUnNWsh5MRT7srEfGYDnwpVjEgEFlGcfy0FS3qouzfCTNWb8Ew3XdH+p6K4QuIPZZPP09WptLRvdERpMpSCUnFt0pkvPjYwsdnVOHgGJfcT2K7VsQTzdign/COCxWDmF2sCsPZ7nqianXw1zYPWc9keiNCqXRgrK/Ag+aibc9HvCDZ29I5ex0bNYBhrte+x76u+ieymvgKUBE/3+/PULIVevYL/rL+Mazr4+l5Jbukw6xaP/F0jFuyLI18P081fwm3QWuanduzOTgjyX4gOh0p/q36xOxvQrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuoVErvj9NiAZ11reISP0O3zyTG/lgAYkXJSyFm1u2A=;
 b=it6sIruRabs4SNyR2QqdViKrUiArus/yLaA5cn4CjkYtOnn40b/SxBeUDqgOeEKMcdUQxRUMvzsMVwVBPRKfaeiKm3N9/t8Tzhp5h0Os+W+qnbdWH+8dRlyvXBr3YxFp+dMos8WAxErP8wCkgAAIDa8dTTcNxoZGfO1b1yIaPCg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9829.jpnprd01.prod.outlook.com (2603:1096:400:20b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 08:38:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 08:38:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 07/16] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G3L SoC
Thread-Topic: [PATCH 07/16] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G3L SoC
Thread-Index: AQHdC5hYbvmOFVdH5ke7RqO86JVq3rZjUOKAgAABHdA=
Date: Wed, 8 Jul 2026 08:38:16 +0000
Message-ID:
 <TY3PR01MB1134681BAD94A9134B613F87686FF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
 <20260704093433.273672-8-biju.das.jz@bp.renesas.com>
 <20260708-satisfied-mammoth-from-betelgeuse-d4fe94@quoll>
In-Reply-To: <20260708-satisfied-mammoth-from-betelgeuse-d4fe94@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9829:EE_
x-ms-office365-filtering-correlation-id: 14844e1e-9043-45a7-6b22-08dedccc41a7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|22082099003|18002099003|38070700021|6133799003|11063799006|3023799007|4143699003|56012099006;
x-microsoft-antispam-message-info:
 3d1tPwYAP2RT1V5O1ku0EHpArmRvRqcID4RVaLUTSc3SNcvGn/5QQ0E6cWOQYCr8lHSrQhEvn6WP10FilFbQskwBUKjQWgZub/bWfTLJhUrSXPgbqz5TA3g4coAzX7gb1c9FmzoLLdOUVvqkmJVxaXgOAJN/5O2AxgM1CNkfGFwBOAPRDlXyMcAEet2GcMmOBS405sNMu1IdtqrX6mDd4EFy9xqHws7L/Ha7KNq4GMUo1qsqgmcHGo4oVWNG3OfLtBaWcpc+j+i9fedtoOrh3p26Jx08gT24uhK388xHOwLdsBdVQTREOKg/Dr8vCv8OmseVfx2oy1XSwn0ipZDz+H3LqTD9FKWdArUlwb/VMc6uzyO2u9GT8+Jxp/aXp2Ong2iO0ZWE8rOWdjuKv6jyUXI0Ixf8G0PjHSmpuiWJSjizVxWSbptqGM4gLKZRN6peYVl4G84lh/QuvRltVaP2soOF9DJwdWOn6EjDreyj7sEZungEFCGFz6MQxR5EJP0JXZPvlsrruHsszFt3BhNPdVJYb0UPpVW9WlP5TPIllCQlma6a8jyCYfNAGZc9U+IZtM+CF9O9ZUYZUuUJqPXE35Zgo4HlnVfoTZs9WhUdtKxXV/6vCZNc35OgZBjEohwLscNfIPIABUnuZigXIwUFdqHvpNJc6+Va37KWEe0JT+er//sDEAR94DdFVBei0Ltpjl/P+BqVCFpzaoytVcCCClKthUtkJ0l/5V3Q015kDXM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(38070700021)(6133799003)(11063799006)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RFRYWTlQZUpscS9TRWJNWVhWdEtZbGpMcHJEc2lFZ3FPOXluT2pXc1JXUkFq?=
 =?utf-8?B?UmhFWW50QjFYWHN2RjBFZkJZS0RiV0Q4TGZZNVBzcmhCV3VVZFBKTVhDcEVE?=
 =?utf-8?B?Z1NndHpJVGN3WHJzTEtNYkY4UnUxTFBINXdpUGVOV0JwalJsRnpDa3ZvUzhN?=
 =?utf-8?B?THJBVFdvTldCUkdtV3hHRkR6eml4bzlraXU3N0xEbml6ODkva1d6K3ZscDht?=
 =?utf-8?B?OWxUYS9KWDlBcmFDenYxSEE2YUdPeUV2dVpBSGc2My83cXk5UllxeVJlTXU5?=
 =?utf-8?B?b0lOMGxIVmRaT1ZZK3VkZklZVitkaWMwdi9QTGE4Nnk3MktYTUoyOFR3MmlO?=
 =?utf-8?B?OEQyTEJySnhmZmRyWlFJYmJuOEYrTUgyamM2bjEzei9yczd5VlFlamk2V1dn?=
 =?utf-8?B?bFhHL0M3S1U0UjJlUUk2RDJBMlpDSXdGZGdMRU9GSkUxZnFzL0hEOXZkZUIz?=
 =?utf-8?B?M25jbDBhdjRXR2h6ZzZqZ255ZnVzMFdlUVRZNmVKT0hUdFVHc3RlYnNNZ1ZQ?=
 =?utf-8?B?SGUvSVNhOFZGVGcwMVpCeXZmdndOMllmaVdMcFRGZkhxcHhFWDgrU0lZZFI4?=
 =?utf-8?B?SWJhbU4zczJLaEI1VmtSTmZlbUdlWWtrNUhwZmkySUw2cFBrQnMrSXVTMCtE?=
 =?utf-8?B?YjlLdnpFZk1Oa1dJekVnMlkvUks5SU5FWDFIb0U0bmpIMWRFcTZCRFZFaVBG?=
 =?utf-8?B?YVBVZ3c3TEp0T1VZeDhWckkwM2c0NXE4VlhzTVFnalAvTmR6YnpFRmdTYjF6?=
 =?utf-8?B?UDdsTE5NYmJOaDN6Z2pEUE5hZHlhZHZWQzlCZnNkMm42MVVaalduTCtFRS9v?=
 =?utf-8?B?eTFBY2hPT09lRHVMa1g1S0p3d2FxYXJBOEV5QXJzam01T0srM2FmTFZaRThL?=
 =?utf-8?B?Mk0wREFxeWNEVmppdVk2dG9IektyZDJpOERlS2tsUzU2aWZNS0MwenZyUUY3?=
 =?utf-8?B?ZFVRa3MxWnhtdndsTnpnU3ZlTFlpczMrbmN3QUZkUWE2TGc0Wnc1aWpZb3d2?=
 =?utf-8?B?T0tLUngrK1EzVHpjZ3FuenZOdHdZMUkxbDQ3ZmdVeHNJQitnZFUvb21WbHRz?=
 =?utf-8?B?aFpQOVFqQWI2SDNGbG9mTGJmZDFqTWVaVVVtb0tCK0JIRUNIQ0JlRWVIS2xz?=
 =?utf-8?B?cmxsdE11MXc2QWdaeGsyUEo1WVN1RWUrbUdGd0JZdFNBK0tZZ05RS1RHZ0lD?=
 =?utf-8?B?NWtBWmZVTk9GMHEwMFl6QTByTUU3VXlBOWJzcjRwN2pmVWl2eDdzWkRkQUdq?=
 =?utf-8?B?RGJyU0ZPYnF0RXJiWUZhTzBlbGNmV29GTFVMUWU2eUFiYjcxSDJQcVNIRnZ0?=
 =?utf-8?B?VzBTZ00vZnZWTDQyYXpCYTZzclQ4bTEwOUJqSEgrUWprWjZJVjdOZWxpK0lN?=
 =?utf-8?B?bVlUMnZETi9HQkhVeE5rZllPSGFSN3pCeGZ3bE93UGdySi9ZYnZKV0VKT2Fq?=
 =?utf-8?B?OVVvQ1Q1TTd5Qk5BdEZYdzIzT2VRMVRZS1BGYXRsNy96cFJFb0ZYbFZCaW5V?=
 =?utf-8?B?UkVMb2djMDIxeWJlVmh4NDhXR2ptcjc4YzdYMG5FclhNTXQvdzdta3MvMDFZ?=
 =?utf-8?B?cjNZREZETzA2em9GSjZLdlRtV3hsa2g3MkZTZjZDNFNrNDFXSnBLNVJDcFJh?=
 =?utf-8?B?UjhCQkRGWmJPZ2Q4RGg2OEh6Sko1ckp3UmFxUmwveG8xdmlEVVBnRm05R0dF?=
 =?utf-8?B?aGd1b0dqUm5kWE8xYXdQZmhTbnZYeXlxNXpWU3R3TzV0SzFOcDRWM3RXY2dT?=
 =?utf-8?B?RVp6MFZCaStLekFVM2Rld1NHVWJkT0llYld2V0granV1dGFwb2tVcDlSNEIv?=
 =?utf-8?B?U1E5Z0hoK0RhbmV5aW5Scyt1aXdjNTkvcFpWUENXUGJ4U0pGWkk0SEdTUS8x?=
 =?utf-8?B?MGVXTHRFcFcwOE95NDQrN0xyalpzbnd2K0szamw0citGZ25GZGowYk51VkE0?=
 =?utf-8?B?MWd4d0dkN1lnUXJWMStRNHNZWEV1MzBQNzkzQ1hzVktvY1pvQnovblhmTEVp?=
 =?utf-8?B?RlpsNVM0bXBDL2hBNjFJZGJ5TmoxOXVFWGxPYWRhNHNSNEQzc1d3T3hManNE?=
 =?utf-8?B?Yk1uNVkvZ1FGbTJoT0VNQmtvV2JPbzhxdEs1SmQwZlVpd0ZnZGRLTVhtRkdH?=
 =?utf-8?B?czlMTFRadFo0bnBKOTBDd1A4SXBzUTJ4R0xqZGloeFR0UHRTYXJlaXdPMGNO?=
 =?utf-8?B?ZGRsNUlzL092QTZ6emhQVVpvTVJPcVZQZTNlLysxZ1FpL0pYQ2RNR0FhcTRn?=
 =?utf-8?B?VGl1Sm9qMHNPNERYUTlUcXlHMlN4eHM5aTJuaUhxU21MNTlMNUxvOEFudUtx?=
 =?utf-8?B?UENmbWJOY1RSTW8zNEFRZm9wa09qOFhNQTFyN2czUEpBRjFQeTBydz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14844e1e-9043-45a7-6b22-08dedccc41a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 08:38:16.6089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rS+cY6SD3XQMYAA/hDfRzzcfP+2jTVsF0b/+QDP4aaqSW03cHWHS7ijPa7PNhdF83XBRvMWelm0Tj2exHMLS3SwQOeMPQvXAXtv6fgO1D64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9829
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34842-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:biju.das.au@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,ideasonboard.com,lists.freedesktop.org,vger.kernel.org,bp.renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0B897234BA

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAwOCBKdWx5IDIwMjYgMDk6MzENCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAwNy8xNl0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXMscnpnMmwtZHU6
IERvY3VtZW50IFJaL0czTCBTb0MNCj4gDQo+IE9uIFNhdCwgSnVsIDA0LCAyMDI2IGF0IDEwOjM0
OjE3QU0gKzAxMDAsIEJpanUgd3JvdGU6DQo+ID4gICAgICAgIG1vZGVsLWRlcGVuZGVudC4gRWFj
aCBwb3J0IHNoYWxsIGhhdmUgYSBzaW5nbGUgZW5kcG9pbnQuDQo+ID4NCj4gPiAgICAgIHBhdHRl
cm5Qcm9wZXJ0aWVzOg0KPiA+IC0gICAgICAiXnBvcnRAWzAtMV0kIjoNCj4gPiArICAgICAgIl5w
b3J0QFswLTJdJCI6DQo+ID4gICAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJv
cGVydGllcy9wb3J0DQo+ID4gICAgICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0K
PiA+DQo+ID4gQEAgLTg4LDcgKzg5LDYgQEAgcmVxdWlyZWQ6DQo+ID4gICAgLSBjbG9ja3MNCj4g
PiAgICAtIGNsb2NrLW5hbWVzDQo+ID4gICAgLSBwb3dlci1kb21haW5zDQo+ID4gLSAgLSBwb3J0
cw0KPiANCj4gV2h5IGRvaW5nIHRoaXMgY2hhbmdlPw0KDQpPb3BzLCBJIGZvcmdvdCB0byB1bmRv
IHRoaXMgY2hhbmdlLiBQcmV2aW91c2x5LCBJIGhhZCBhIHZlcnNpb24gDQpub3QgeWV0IHBvc3Rl
ZCB0aGF0IHJlbW92ZWQgInBvcnRzIiBhbmQgdXNlZCAicG9ydCIgYW5kICJlbmRwb2ludHMiIA0K
aW5zdGVhZC4NCg0KSSB3aWxsIHJlc3RvcmUgdGhpcyBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpD
aGVlcnMsDQpCaWp1DQo=

