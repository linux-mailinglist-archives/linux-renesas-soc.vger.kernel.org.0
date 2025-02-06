Return-Path: <linux-renesas-soc+bounces-12891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54BA2A434
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 10:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B124A3A6B61
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 09:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0AA226167;
	Thu,  6 Feb 2025 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MqjSybjd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21CC215079;
	Thu,  6 Feb 2025 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834018; cv=fail; b=kHsACE/5ckqDXw351OakHTOJUkRufe+JVTKBIvavIcm/yvHjh5GJ8f8p7ZbIM+4s5e2ZtjvBN1FNZUfe4cyuy5+41Uy/YtquLLVv+xhCA0jFpD2ztrZ3R8FRLzIisyOr6l2m6N49JmOr14kBukuJxbwA1YlR63p6RCaQqonYRB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834018; c=relaxed/simple;
	bh=+ec3CR8fzdnvwlOcMZQu8dfoyWFDfxuoZ6xNmvf9zNg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RoNeKoEXzb8cniKOlfG6193t9f7IqEuXZ5m+JdRBsgxqEdWuiOeQdWK5VrqbOWx/mFniWbaAE2k+2Y8wihlLGIOEmtHv2dbX6NlfaVI1MpVfAVkcGbl3ApR27tBPXvG7rXrG4zRCO+sI5ZcAygFs/ID6nWXHH7DOz08O2j8NuQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MqjSybjd; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQUcYd9cXU7wqBkfSspcPwiP3aJSlexd+zXrOH6d3DVBolWjcc9LJnRnwVmJ8s71GM/HQV0Q5Vn9eAlXRBW4Wb/RHpXhOef/YLnfaLkvXIBzcbO5nqWJNOTtN7oIa67CUaSthOMay/V0e+hYnSffnBcYTe0QO8SY1U8t/kSTRGcYFYiazCxIpKod/oj0Dk5C14bdaGuG/sACmiFKg9fi7koC6+OE6tr8M4uqE7Ec+CgUeGtWYVJEvYaz/BOB3MIJklPgZ5ByAxcKnJyuUxMvgMZToZw1QvbxNUtup1UB++42GJquaycyeFMRgCG1v5iDqanTx6lBgCoZNO+OzkiV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ec3CR8fzdnvwlOcMZQu8dfoyWFDfxuoZ6xNmvf9zNg=;
 b=s/SXu5Jr2jkLqWd6KVRSmcchRq47H0yv5DH/I94GQW9JVUwrw5U0RiKLYs/7MXtiDOhM32aVHJP6g2DFcexA8SDn5QJtEBAzjcvwWeUmDsTQX1urLvo9JXb+/cSaLZ0J3ukhHoNkf60xqsWRYI5WGNfEhY/SRVldMlPmADQRuZZ1/eyanB620Qg4Cmsw0fcPyBgVuS9ihdrREjahuHaeqUFa5Br/FLXY0oJzmNQgm6VK5Vn60chNwDx4W+zawv4NM/IFqBPzPtsXsEQd/CYCula+NrgWp7mUSNHembPr/kXFZO/h3ciL9h1B7KEV3RLNJFe41JZJgJVSYy6Qyl+C8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ec3CR8fzdnvwlOcMZQu8dfoyWFDfxuoZ6xNmvf9zNg=;
 b=MqjSybjdhwg7TZlpjAjmKQhSTKad1cgYgeY7lp7vyFEgj/pK5c0p1DaYcLsD2XAkmMQUjueVUUXc4bXWFPgchCsRMMN+L1HtgDI27aXVV/AHL0eT+JV9qOv6bIH8hXE/iSwtIFZeQsPrfwLsC7oZDKx4RkSGcOCLk1qkBxSL0kU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8848.jpnprd01.prod.outlook.com (2603:1096:604:15d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 09:26:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 09:26:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 0/8] Add RZ/G3E SDHI support
Thread-Topic: [PATCH v2 0/8] Add RZ/G3E SDHI support
Thread-Index: AQHbc9K3KWwHs9xUlkapuAYU5eS+JLM6AKwAgAAJPpA=
Date: Thu, 6 Feb 2025 09:26:50 +0000
Message-ID:
 <TY3PR01MB11346116B89EBEC56F7626F5386F62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXsJVLYP2pchKoTkDH5+Sd5nsHUBOjbV8B7YM0b1y97jg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXsJVLYP2pchKoTkDH5+Sd5nsHUBOjbV8B7YM0b1y97jg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8848:EE_
x-ms-office365-filtering-correlation-id: bfeeb9fc-a438-4795-2ae7-08dd469062d5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NDhJVytFVXArK2Y5emJsNFduMWpUalVqUytQbW9WUlZaakNQWmpYcTdlVHlt?=
 =?utf-8?B?RzQwb0ZCWTBDcnNob1paeWN6RkpqUWF1c0pCM2IzQjZIbWNaK2tvZk5iR21S?=
 =?utf-8?B?YWlnT3RaUDRYZGhWUVYyQnhNTDZreXl0dmRqd0FkeU9jMkphNUYvb3JwR1hy?=
 =?utf-8?B?bDFMOFBzWFRFNkE2dXhFTTF6WTVTWUdmSG1IM043RzRSR09kMEtxR3kwQmE2?=
 =?utf-8?B?VzN4S202WWpCaHdqMWM0dTIycTVBTUFQYVYvOFF3UVlSSW5lWGVwR1BUTktH?=
 =?utf-8?B?V1c3aHFjbEZJTXVNbUR6UG1lM1pGbnZ4OUJlOHZCMjIzNU9OMEtHd1NnbXFZ?=
 =?utf-8?B?VFF1R0JQcGo3QlBUNG9NMGduUWFkMGwvTlhFdjRQM3FKQ3R1TDBRazhtbCs0?=
 =?utf-8?B?SGZSL254NzhXMDNiS2pnNHJzeE0yV241OTkvWWlmalZQRUpmbXRLdklocDBo?=
 =?utf-8?B?bzQ3K085V3FmckZLUEh2UGFEL0pLMEpGSzdJZmZHYzFndElWVlVYMmZNeC8r?=
 =?utf-8?B?WjBUU1owWGFaYm5WdHhoZVNhbTFZZWxIVkswSThNOEttUjlWNWhTMkpQWnVt?=
 =?utf-8?B?UXduL2tQYld0VUI4bFdYRjRhTzVUc0VteGxPRkRRc05KdjBjNUJtcGdWMWF3?=
 =?utf-8?B?emYvT2hoRklLaEkzRXViblRnaVQ0eVEvNjFJbW5ybWpKR1V0REdaTUNWV1JS?=
 =?utf-8?B?TFJEWVZZMzRWbmhlbmFvTXdtcFZDQTU4T3BpVG5KUlRpMXhpcmJKTHZtQ1Zw?=
 =?utf-8?B?RTFlbWpwOVNDVnFXalRNTnQ1R0xQUy9lK0Q4dzA4WURFNm0rNWFTQXgvNkR4?=
 =?utf-8?B?bDdadDdJQVBOSVhybGllVmVDR1Z6bGhIck15SVJWajhueWw5elVpSkNXcVRK?=
 =?utf-8?B?aklXR1hucnhNZThYM3lRNkQzYkpXSStDUENIaHRRM2ZhS0Nod3NpcEJYQk5Z?=
 =?utf-8?B?aERpYWwrQmtQNEdnVW16c2VFOGhMK1JOT0hlSUxHNE9LQnRJTzFYbk1hS2lB?=
 =?utf-8?B?NVI0L2w5ekdHaGorMEtYOFhKdU0xWWcwUGJtaVJaWkthWk40ZmFtODdLN2px?=
 =?utf-8?B?MTljL00zMnZOMHlWQldUaHJjVU1UOWlZSndjRG10R1RvditHbk5JMnROcXlR?=
 =?utf-8?B?S3pQenJ0NnN0M1pYZnpHdWxkcDY3OVd4K2dZdHlxREF4MFRFN29LQmZKR2g3?=
 =?utf-8?B?YVpCdS9tcHVjbkRGcmxPLzU0SHlWdGo4eG9obkg4RzNVWDRQclljVXYvQ1Jy?=
 =?utf-8?B?NDMzeXhEUFNtMlBVeE15aWgySVR2RUVmQngwbml4bGFKVEJtRUQyY25aSDRz?=
 =?utf-8?B?V3ZtRng0eGh5YWdGZzk4aXZpekdKWm9udENlc2YzNHdOSVJ4czBoVEJUYmpu?=
 =?utf-8?B?d3dKTUQvQmN2d1VkQml5d2llU2lHY2NRdDJpTEk3dVdLS1pZaEp0MHljdUNy?=
 =?utf-8?B?YllVUmN6RGN0VkdNdGNjVjhnRDFBem5hUWxEWkR2dSs3aTRNVk44QWtsWUlE?=
 =?utf-8?B?SVdTVlh2NFdhR2VIS0dpbmpaZHB6WVQwd3NtdDRtSEN2a2ZHRzZrS251RHZp?=
 =?utf-8?B?Z0pjVWF6bkpFemJlZldPNDFaWVNuMTdaTkVpQmQ5UkIwYkE2cXUrZ2FCc2g3?=
 =?utf-8?B?TnVta2pwMlg5MlBUUS9NSm91WU9ZNDVxUWhaMDJKdnk3SytTNFhCK2ttdTdP?=
 =?utf-8?B?cExoVUZFb0NHbUtNeGdWMTlCOTZYUmgxcjY3bzRKOVNUcjRDTUFVaExlM1Ey?=
 =?utf-8?B?bitocTBjTWtyT3cxc0xkWDNKcDVRRnJELzE3dEFyYkdaNU52a3pMQk81Qkxx?=
 =?utf-8?B?ZExraGp5RVgzVjRFT0FvVkhwQ2I0blVGVE1GSTNRbEVHbnpRditLZ2ZscVIz?=
 =?utf-8?B?emg3NjF3c3Y3UTVjbmRBVXl2b0FndjJhL1ZNVy9CT0c0WVBYRjY3dmNxdDk0?=
 =?utf-8?Q?/KMm2kRjJ9xLEdNc18EM/2vYb1Wpo7JA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWpvZmtnVGk2WjE0cHRHVVhtYjVaR3V3cEJodDVYT0VKbVU0SHdYTUdndFhq?=
 =?utf-8?B?bndvdVV6WUtoUFYvQStCY3NXWEhMeTVnY25meGxRcU9tRzNadjUycEIxa3ZO?=
 =?utf-8?B?UzNMakdESXN3ZnZadi9jSzNVZGNPZ1FWY3JkWTNlWFZQLzREa0dUQ3pleTcr?=
 =?utf-8?B?QnRlcHQ5QjBKSlIzK01UR1gwaUNOZWVvbFJaSVFnbndrSG9wUGVsQ1pRQkNs?=
 =?utf-8?B?eGhJSllRU0cycHZUZGY2VUZPMnRiUmpZR0hBb1dtMTZPMy9uL25ST1BINjg4?=
 =?utf-8?B?NnRaSDBkbkFTU2dEblorQlpEOWs2SFFHOTRUSktEaWViQVZaemdyOWJJQkxt?=
 =?utf-8?B?TTFlM1R2djdnR1Z3TTdjVDVJa0JlVHRVR0JpUmFmSW5VY3JoWHBZUkJVSmhK?=
 =?utf-8?B?UTJJVDRtTzN2UkxRMVhpS0hnZHZYMHltQmRKWGlUNHdIR2puQnFXbUxSYkYv?=
 =?utf-8?B?VWFIa1p0bzJQVDIraUd5ZnRyMU5kQlVDU0picTcvNlRkaTJLRktqQnZOQXdk?=
 =?utf-8?B?U2tHNWZ5ckJBbTRwMGdJd004SXNVek5WVFBnckZnSG1LOEJhby90SnVPUEhl?=
 =?utf-8?B?WnNrbHE0Y2Y0N3drWDR5R3FkZjdwN0tNYS9HUCs5cjVoMUswT21obzhZenc2?=
 =?utf-8?B?KzBSOVdVMkwxdE8zVFJ2bU55THV6TE9tcHJ0UURBVWZ0bDVSdjJTWlpTTkxL?=
 =?utf-8?B?Z0diVmdacEJXdFIvN2tmZitDV2ZTdVZrNTVWblF6UWFCd3ZLTlhjWU4vZjJ3?=
 =?utf-8?B?RHpDN3ZUY2c3NHcyZVBmejNsem9TNWJ4UkZRMTZCTlB6emprL3RzUWtqakNz?=
 =?utf-8?B?aUdMcStkRkk3bFlvbmZTQkR6WktlWFdmK0pGeDZaUllPNDhLbDNTbW91Nllk?=
 =?utf-8?B?bTZqZTBCRmQzdDhOVzQvQk5WeldwM1hyN0ZKck14WldjVm1tbjZRSWptS3NB?=
 =?utf-8?B?VUhVR2NCVkdmclZDRCtTSG5nVzZzbEZnWXlZS05UVDF0OXRqeGhRZEZWbWlE?=
 =?utf-8?B?OGt0SEFWYmdHcTZDTUlkQkRGMUwwZWxFbGdaSEc1OEJWeW1xL1lldGZPUmdF?=
 =?utf-8?B?aHowSUlVbEFFd1lEZ3E4ZmllU1lzWWZOaUgycGkzV3N1czN6eU9VNEQ2WGZD?=
 =?utf-8?B?YjFrOEdZUUdkSUorWnNVc0RCQk1BYnhHd0l5MTQ3UlA2NVkzMEJyaGNIMDA4?=
 =?utf-8?B?LzM3bWdVemRBRUJjVkVsUTR2RmdFei9iSmtZVTM3Z1RVNnJ3ckNGQTZ1a2l6?=
 =?utf-8?B?ZERMbnFWWVhXY1gvdmpuS1dYWElwZGhBanhrK0ZVbUJDSkdudkRmS0Z1N3pD?=
 =?utf-8?B?Z3IzQUgzNitLRVRya1VKZkVPVUhzTkRCMTNkdk80dkltREdnMS9zL3JmM2lO?=
 =?utf-8?B?MllNWVF0TWtIdkNMZ3UwcUlpcDFFQVovY2Y1VXFFZDA2WUlQNDVTK0ZPMzQ1?=
 =?utf-8?B?NU1IOU4rMVNzc3Y4ZktzNlZKb2pRVXoyZnNTWCtiQXhoVjlMN0dLdlhCOVBw?=
 =?utf-8?B?b3g4VUx1UU9jb0E4RUppb09wbG8rajY0dUJJVGtmQkllQ1c0aFZxNTd3NWIx?=
 =?utf-8?B?azVXUllPcXgxK04ycy9Cb0wyN2M5YnlPNWNxQ2IrMHhWU1NRV044OVZ4YVA0?=
 =?utf-8?B?blhtczMrMkVjMXpjeGVmV0tRS3ZGd2d4STlIajJGeWJDdXh1N09rYjk5cjVh?=
 =?utf-8?B?MlpXSFgyMXMrZnNlU2Exck9ETlpyWnFkSWtJb2FGVXZXb2dvNXR6NXJmdjNj?=
 =?utf-8?B?UE84L2FEVmV1d3JwNVd2MDV2azRVdEhPdFNIc01ieE4vZHFWazZVZUV6YVJR?=
 =?utf-8?B?dUJTanY5TFEvSTVnMy9lR2JLRmsySVQ5SHk3N3MyOEdSNGNhZzRmeW1GS1B6?=
 =?utf-8?B?c1N5Ukt6UWFOMk8zR004WWhzMm1IT0ZUTDBKZzk5MjBvRFVkYjIveS82MmRC?=
 =?utf-8?B?MDhMVU9teUIrcjQyeVVWK1dldjFyeVNXZ3BrdzNYNThncXhnT2RLQWR4Nkhl?=
 =?utf-8?B?WU9PdDlXSU4xUUE1cE8rVWo2TkhYeEJXTnNGQmhuTy91aDlHUTVWcTczaU42?=
 =?utf-8?B?bC9vUXQ2dlNDeFRSOGRZakd6eXB4dWEvTVBqclhMeFlmUXIxY1JsNXpJS0Yv?=
 =?utf-8?B?VzFPNlovdVNVYTFZcFpSVERtTm1jVDFKZ0dlalo1SHlYVFU5L3YyMXVCbXQr?=
 =?utf-8?B?UFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bfeeb9fc-a438-4795-2ae7-08dd469062d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 09:26:50.3656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FQQg+0INJnp4NCbPRvcoCFKV1oc27mAJDD08rz6gSd4XEyIvAaEM0h7Qg+AMIneEbQMhhre0sxgU/f4vOp100hDSxRonRbmb5wM8yNjqU4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8848

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDYgRmVicnVhcnkg
MjAyNSAwODo1MA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAvOF0gQWRkIFJaL0czRSBTREhJ
IHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIDMxIEphbiAyMDI1IGF0IDEy
OjI0LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRo
ZSBTRC9NTUMgYmxvY2sgb24gdGhlIFJaL0czRSAoIlI5QTA5RzA0NyIpIFNvQyBpcyBzaW1pbGFy
IHRvIHRoYXQgb2YNCj4gPiB0aGUgUlovVjJILCBidXQgdGhlIFNEMCBjaGFubmVsIGhhcyBvbmx5
IGRlZGljYXRlZCBwaW5zLCBzbyB3ZSBtdXN0DQo+ID4gdXNlIFNEX1NUQVRVUyByZWdpc3RlciB0
byBjb250cm9sIHZvbHRhZ2UgYW5kIHBvd2VyIGVuYWJsZSAoaW50ZXJuYWwNCj4gPiByZWd1bGF0
b3IpLg0KPiA+DQo+ID4gRm9yIFNEMSBhbmQgU0QyIGNoYW5uZWwgd2UgY2FuIGVpdGhlciB1c2Ug
Z3BpbyByZWd1bGF0b3Igb3IgaW50ZXJuYWwNCj4gPiByZWd1bGF0b3IgKHVzaW5nIFNEX1NUQVRV
UyByZWdpc3RlcikgZm9yIHZvbHRhZ2Ugc3dpdGNoaW5nLg0KPiA+DQo+ID4gRm9yIFNEMCwgZml4
ZWQgdm9sdGFnZShlTU1DKSB1c2VzIGZpeGVkIHJlZ3VsYXRvciBhbmQgbm9uLWZpeGVkDQo+ID4g
dm9sdGFnZQ0KPiA+IChTRCkgdXNlcyBpbnRlcm5hbCByZWd1bGF0b3IuDQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgc2VyaWVzIQ0KPiANCj4gPiBCaWp1IERhcyAoOCk6DQo+ID4gICBkdC1iaW5kaW5n
czogbW1jOiByZW5lc2FzLHNkaGk6IERvY3VtZW50IFJaL0czRSBzdXBwb3J0DQo+ID4gICBtbWM6
IHJlbmVzYXNfc2RoaTogQXJyYW5nZSBsb2NhbCB2YXJpYWJsZXMgaW4gcmV2ZXJzZSB4bWFzIHRy
ZWUgb3JkZXINCj4gPiAgIG1tYzogcmVuZXNhc19zZGhpOiBBZGQgc3VwcG9ydCBmb3IgUlovRzNF
IFNvQw0KPiA+ICAgYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDlnMDQ3OiBBZGQgU0RISTAtU0RI
STIgbm9kZXMNCj4gPiAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzA1NzogQWRkIHN1cHBv
cnQgZm9yIGVuYWJsaW5nIFNESEkgaW50ZXJuYWwNCj4gPiAgICAgcmVndWxhdG9yDQo+ID4gICBh
cm02NDogZHRzOiByZW5lc2FzOiByemczZS1zbWFyYy1zb206IEVuYWJsZSBTREhJezAsMn0NCj4g
PiAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzNlLXNtYXJjLXNvbTogQWRkIHN1cHBvcnQgZm9y
IGVuYWJsZSBTRCBvbg0KPiA+ICAgICBTREhJMA0KPiA+ICAgYXJtNjQ6IGR0czogcmVuZXNhczog
cjlhMDlnMDQ3ZTU3LXNtYXJjOiBFbmFibGUgU0RISTENCj4gDQo+IE5vdGUgdGhhdCB0aGlzIHdh
cyBub3Qgc2VudCBhcyBhIHNpbmdsZSBzZXJpZXM6IHBhdGNoZXMgMiBhbmQgNSB3ZXJlIHNlbnQg
YXMgYSBzZXBhcmF0ZSBzZXJpZXMuDQoNClRoZXJlIHdhcyBzb21lIGlzc3VlIGhhcHBlbmVkIHdo
aWxlIHNlbmRpbmcgdjIuIEkgZm9yZ290IHRvIGFkZCBlbWFpbCBhZGRyZXNzZXMgZm9yIDIgYW5k
IDUuIEkgbmVlZCB0byByZXNlbmQNCnRoYXQgcGF0Y2hlcyB3aXRoIFRvIGFuZCBDQyBmaXhlZC4g
T24gcGF0Y2h3b3JrWzFdIEkgc2VlIGl0IGFzIGEgc2luZ2xlIHNlcmllcy4NCg0KSSB3aWxsIGZp
eCB0aGlzIGlzc3VlIHdoaWxlIHNlbmRpbmcgVjMgd2l0aCB2MiByZXZpZXcgY29tbWVudHMgYWRk
cmVzc2VkLg0KDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmVu
ZXNhcy1zb2MvbGlzdC8/c2VyaWVzPTkyOTQ3NQ0KDQpDaGVlcnMsDQpCaWp1DQoNCg0K

