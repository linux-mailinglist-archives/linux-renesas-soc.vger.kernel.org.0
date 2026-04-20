Return-Path: <linux-renesas-soc+bounces-31390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDD/BNHE5WkGoAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 08:16:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807642717C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 08:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9DE13000B2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 06:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6170B3783DB;
	Mon, 20 Apr 2026 06:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nA6kcoJZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011022.outbound.protection.outlook.com [40.107.74.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E212C158E;
	Mon, 20 Apr 2026 06:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665762; cv=fail; b=udy9XHLDd4OfenPBL09iTYWeHePq9D99uF0SZDZHhyVzymF6kN2/w3SA7TUjaDEs0fXHSt+1U5Tje2fVTugQY+ePAtQb2ddj4eVQogENVbzo0s8vySiBJ18EfGuXcnkG1IpNMRUF2YaR497yRnyllWDqS44TOsat/YVuiH9GhAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665762; c=relaxed/simple;
	bh=LdqY201zSyfavhIf6/NvRHJVbkem+/ARqF3sIJHvj5Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NuroznNTicExI7SFf8qznUlCz1YnQrk0d3/kU5jXj2Dvmg4Kns4m5pqpvxDQV/wFUB6/HSwbasitVq3xHJv4aU7TnZ7Z7kyK+t0rnnqJIwztccu+Zg/X/s04AcBOi0FlKH/+n83F9TlD+K5dRupA1mmud6GdIjM962pGL9xPWjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nA6kcoJZ; arc=fail smtp.client-ip=40.107.74.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECoz/1A+X2533XY47LpTsb/koXy3ANjuQ+vUk31jaTkZGI5zWxjk6pMMWaNPiGdlHmsTbKT8tPfexj38suP5yZo80ICVvbW0tl1ppeiE7pQC+jaUJBuoNMRu/UzpBYRy54b2ljpI12Kr57SulK49AU8hlh2XcSpuZa3wtCrxvip0qymNZs52ff2vQcbSqOtBUxvHBcGn5+/LsyZNH6yHw+YuRBSqxdk7Nyzhf9lzfL/XxcGCiPa1Wf1kArdQDZBdkvsYhNbnnsW11IzfY4/aBqhfITxQYKlVpDVH9IRhocabFCPjp2ANgORsll3zFVDNaAlRPUkUirGYbGCf67cLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdqY201zSyfavhIf6/NvRHJVbkem+/ARqF3sIJHvj5Y=;
 b=gTYRa1pd8dF39tKukZQvUMEtZ6jrgVp/zMsKBqSb2ZaautrNSbp1bmeypiPaxxdCcJ9Llgg1+aakHsjr1oIfea/TyVePikFotRelEkF7V/VxhDQOuyN8RNV70Lpy6RJ66vnwJRz71GaGFpi59/n3wiDpwT+v1XvNTLTdmxPFnnp+d4NxDaaqPJ+VsrrQPD8w7ufOJmOyZ1scIsePe6cFvbJlJbDCDfAknCDXo7S4CaQe2aClBYP2GQeNOnm71hbiTZ0JwW+MTd0+nGGu7jRFm+Mr0z4Dye1hnDTpt1RgrCoKO+Fmj6KxczYJKtsAV66s/0DXIvO+naiNh+hITC8jOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdqY201zSyfavhIf6/NvRHJVbkem+/ARqF3sIJHvj5Y=;
 b=nA6kcoJZb2HBMCMjNBYZ19YGjw23sZHmbiioC6fa/+QKFZ1ThN2tTyzkM1DmK4y9ocxfqOKoMwpqBJOVPQHWuZt4EOG5wPpTiudewmXj/AuR2oCW7duwydIsR3Sqvs3fFe+WnKmixeMnqGfFoN8W80dMaTO524mA3xaX+h9bFTA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10274.jpnprd01.prod.outlook.com (2603:1096:400:1e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 06:15:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 06:15:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, biju.das.au <biju.das.au@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume support
Thread-Topic: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume support
Thread-Index: AQHczXsqgxiifiqLaUe75nBbRjmUw7XixUyAgABLaICABC59AIAANRzw
Date: Mon, 20 Apr 2026 06:15:46 +0000
Message-ID:
 <TY3PR01MB11346D957ED7C6A2BFD1EF79B862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260416082928.169347-1-biju.das.jz@bp.renesas.com>
 <00e2f34a-c488-4a61-bb87-0f0431990c3f@nxp.com>
 <TY3PR01MB11346B5C92803F6A3D174ACCF86202@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <d6dcdce0-6ff9-433a-963c-5f0ea9f2a9fa@nxp.com>
In-Reply-To: <d6dcdce0-6ff9-433a-963c-5f0ea9f2a9fa@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10274:EE_
x-ms-office365-filtering-correlation-id: b70ea4b1-a33c-4658-de5d-08de9ea442b5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 YO5osLeusguCumI6RpSG1V61Zq4JF3pk4K5jOT9Qy53EyMD3j6F62ToCoEdnWKzbebp0JbzHqr+vVxZL9tw8zhQt08j3U2BhZ4Oi2s2S2Fy5/hz6jWTPw5pUrnLY05lpDT5HRlKf6jWYibAu4B2pWUzg/6IubucQRyClv9ORRt968uK22KALU0H6Jud1RnAvFprGcr3auikZ7Iz+SZHhPq/o3K4ttPjlYINtKB3x3jVDsvhUXKMHKCYIjv9fjQmQz1OGPFrWLmsVlVxjI3LbruYOMvyLpdn/+QMkPLNv6bjPk8B6Ei02seo+Px4E7tEq4EPftplvDYwmy9jXx6EBzPUKbuwMPjDKZV1ZeIkkzeKNTA1lFWHC7nwFxm6VkscUIF0LU0WGCa3M/DfrpB1l/JfJMeN6iMhtjSo67SmVjTZW1N8+wIm620DMQ8KjDKOT0AxhgoJ+KWRS1V0UWvPYEOd148tsZEUJNaKlFnPa2psRY6JXcZ1L0SE3tTLO4gPlD9a8NZbHS5pWIY0C6PZDV+o3ktI2EW69ct8fnR2+FnSz6gonnLTNSEA3upSN293D3L2VSOPdIQi91sfbi7UYOpon6B3VwCqPbspk0CG3lqcfuX/93CMdUB00r/Mi+HN6vRhuWb/aa+pfG9wxuRKuPK2sFxw5ZYSbWyTqho1okgDlHJvB5K0AcE2AgFgnBQ0YNcYQ5QmeWrlyftXVvSkM3oA0t+/SNQp42SMaQI3DYTJBAuR6Du8VCzpuGslRavhwwl+JiZF8nn82OIRsEUHCVhobbDxYLEVu2EtY7reSmJCQScTfeGbt9cX9G+cFlhT1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0NhUkhrTGhlVlluN3F5NUMyOVh1bWw2anRCQkttUnRPWFdlVUd5YlY4NlVX?=
 =?utf-8?B?OUFsV3pWQzhMZjFHZDMvMXdVNFRNOTVSa2lwaGZaZysrUDczS1gzS1pBYWhH?=
 =?utf-8?B?bW9nR1UvYldRcXdkcnFmOXBvVGFXSUtDQi9mckw2S1JPdXhEM2FaYVZ5cmlC?=
 =?utf-8?B?djVSR1kyMjNUTERWR1VCeDJITjFuTzJIYVYxYys5MHA2aGtsQ216TisxUklE?=
 =?utf-8?B?dU1aeEgvL1hkckoyVFoyTDl0WTNnY2lHOG9Ea3lvNGtrNDZNZ1pwQ1o1c1lw?=
 =?utf-8?B?TWpHdUl5RnVGSE9wMmxDRHpVVjRZOHE2bW4rdGtlWGN0ZjFlZ1BGaTBqUnRr?=
 =?utf-8?B?WnFaWk9KVnNuRHUyTDc5dkdsT0ErdGpSTVZpRVpKVTNDc2RKcWJWVmc4YWNS?=
 =?utf-8?B?M21Zd2dMSGR5dndHUWRoeVVwSXNxOGQraWlZSzVLUlpuTE5ockV0OG1PNEVl?=
 =?utf-8?B?Q1paMndObU9lcHVSZ1U0eUNJZjBIZDdQNDlWTWk5UGVOL0NXS1I2MEZHUE9I?=
 =?utf-8?B?UmhLMWRLeXA0RlBKYmRMRlF1THJzWW0xeC9aSk96MThSdHhHTTlOMjJud0s2?=
 =?utf-8?B?QnhyS1o5WGVPak45SnRYQWsxYlJtZVJjdUhXQis5Y2FNVytWbjE1NkU3eE9Q?=
 =?utf-8?B?QllRcXJpTkFCOVB6Z1c0czR0ZFRjdlZNMDJhbXBqVHJoVTJkZVVuMEw3dVJG?=
 =?utf-8?B?NzR0RnVkSU1oTkR1aEZsSDM0VzhEcWZvSHpELys5b2xXRThYTUpVRVVGQWE3?=
 =?utf-8?B?RnR5aDlWK21TMW1DVEg4OGdzNW00dXlaNERiNzlQWDU3SFFCNDIybXhWRWpK?=
 =?utf-8?B?V2FPbllTYVQvSnpwYWxDcUVZUUpwdFFMM2pFRkFyV3NwVnpVNjNKMDJ5RDBx?=
 =?utf-8?B?cDUzbTdpa01jN0ZPbGpTaEJ0UzV4OE9FTGVvZHY5SnFmMmFCbGJSNGw4ZUMy?=
 =?utf-8?B?N1hJemp3TEZUcWRHYVhpNVBkWkFxTzB1Y244cFpOQWMvazRjNFI5WXRYcEo4?=
 =?utf-8?B?bU1TM3JpNDlaTTZtNGs4eml1Rnd3Zm44RysxWlZKWFZkSExIa3FSUG5uTTFy?=
 =?utf-8?B?NFVsOEZUcTVkQzRDNm1meFZqdndTZHFlczJDQ0ltNThXeGE4QTkvaUNodkRv?=
 =?utf-8?B?WVpZcXhpV0JWWHl6RmQ5VERUYWF2Mkh5RS9yMzY0bmk3bmxZVnNOWG1jNkw2?=
 =?utf-8?B?NHJmR285OUwrMkZFNXpMVXJVM2xwaVVyZkFBUmF1NUdVdlVsNXZnSHRwTnIr?=
 =?utf-8?B?c0oyTERna3B5ay9XTjVkUjFITllrU3cwQnRodG5qTHZFQnl0Y2hGaEVaSXF1?=
 =?utf-8?B?TlVuNVJVbFNuTkFpcmtGODBYc0Nvc1BKSTA5aXlkdGRDNTZERnNRb2NVaHpM?=
 =?utf-8?B?ZnI4bU9zZ0MxSE5vL0hBZmNSMEVFSFhaMnlZemRGL1JRbUtUWjRJelRGT01Z?=
 =?utf-8?B?REpjYUlCRDVmVTllZ01mUDVyNGROQTB5T3k2NzJZRU9WY0ZNY1VvTEJPOFhm?=
 =?utf-8?B?dGVUdFZPUE16eXlTbkhiQm5OSFo0TjB2aFc2TWtaeFpteTlBQmtZV25LbEll?=
 =?utf-8?B?N1RZQmwyY0JkZVl0OUZreWdOc3JiT3c0NVFDNE1DaWJqeHN5RGlHazVFaDVF?=
 =?utf-8?B?TVh0LzZHMHRjN2RJcklnVnNtY2p6MXdaOHFpb3g0OVIvL1N5VGRIeEpWdEZ4?=
 =?utf-8?B?NUlHUnp4UGlrUkJnUU53V0VTQm5RZXdvRVBxUldZdG9ZbmttczhWbDF2SUVR?=
 =?utf-8?B?RHVWa3kzUCsyczBzMWdXRkNUVUFRQ2RhbW81Z3Z0MjdpMjROT2kzZDlFR21O?=
 =?utf-8?B?TkdjSmc4TVlpeHFFU0ROT3dxbkp5a1R4Mkk2NXh1UTdHbHkzcjFHTEVWOHBs?=
 =?utf-8?B?SUdKYk1VeHloZW5MODVoU1Q1STRtWVdMWjNscHRoOUZRSnRBamgzdjFzSDU1?=
 =?utf-8?B?VGFnRUIwWHpYUzRwRFVLSjBBUUZMK0pIRWgrOGlEN2VZZkF6T2RzODhnc1U2?=
 =?utf-8?B?MVROelo0c3NMMmxoY0lZU0Y1MXFFVzE1VWxQSkNRZjRMVHFYN25IS2tkaktl?=
 =?utf-8?B?NENRUEhQRzRSU0NyQk81b0d0U3NNNW1aSzIzR1ROOEE3UkJVUlJHWUhvajBh?=
 =?utf-8?B?TStIYm5lcHJCUnhSWUxqREp4dWFwc3hXai83UThrOVZoMUNTQTIyejh0aXRt?=
 =?utf-8?B?L2JTaGg1bTNjZzlJZDhxQlo4SHRsREY0N0kzYWpOQWo3UXVoU0NTVjZhZDVr?=
 =?utf-8?B?NXJlTnF4bG5QSlRKUEpkbE5jYUY4QnAwN0hVQUZiTElaL2NnTjhJUUluM2lX?=
 =?utf-8?B?eDk3MG1DYnFpUnBHY0ZGUTltakEweUtuSHBxM05TSitSOTdjVi96Zz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b70ea4b1-a33c-4658-de5d-08de9ea442b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 06:15:46.3646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RztpxhYXdXIv2/FP9Kvt6bOzZ/b9RC0BgmlY+xiL98UXfW4/STDQdyxWwKUggI5442tqyxhwWzpC4mtZ0LJnMtpdaHF5uaKJKX3aYFproI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10274
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-31390-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9807642717C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTGl1IFlpbmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGl1
IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4NCj4gU2VudDogMjAgQXByaWwgMjAyNiAwMzoyNg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBkcm0vYnJpZGdlOiBpdGUtaXQ2MjYzOiBBZGQgc3Vz
cGVuZC9yZXN1bWUgc3VwcG9ydA0KPiANCj4gT24gRnJpLCBBcHIgMTcsIDIwMjYgYXQgMTA6NDk6
MzVBTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgTGl1IFlpbmcsDQo+ID4NCj4gPiBU
aGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+IEZyb206IExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+ID4+
IFNlbnQ6IDE3IEFwcmlsIDIwMjYgMDc6MDUNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0g
ZHJtL2JyaWRnZTogaXRlLWl0NjI2MzogQWRkIHN1c3BlbmQvcmVzdW1lDQo+ID4+IHN1cHBvcnQN
Cj4gPj4NCj4gPj4gSGkgQmlqdSwNCj4gPj4NCj4gPj4gT24gVGh1LCBBcHIgMTYsIDIwMjYgYXQg
MDk6Mjk6MjVBTSArMDEwMCwgQmlqdSB3cm90ZToNCj4gPj4+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0
IGVtYWlsIGZyb20gYmlqdS5kYXMuYXVAZ21haWwuY29tLiBMZWFybiB3aHkNCj4gPj4+IHRoaXMg
aXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNh
dGlvbiBdDQo+ID4+Pg0KPiA+Pj4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+Pj4NCj4gPj4+IE9uIHRoZSBSWi9HM0wgU01BUkMgRVZLIHVzaW5nIFBTQ0ks
IHN1c3BlbmQgdG8gUkFNIHBvd2VycyBkb3duIHRoZQ0KPiA+Pj4gSVRFDQo+ID4+PiBJVDYyNjMg
Y2hpcC4gVGhlIGRpc3BsYXkgY29udHJvbGxlciBkcml2ZXIncyBzeXN0ZW0gUE0gY2FsbGJhY2tz
DQo+ID4+PiBpbnZva2UgZHJtX21vZGVfY29uZmlnX2hlbHBlcl97c3VzcGVuZCxyZXN1bWV9LCB3
aGljaCBpbiB0dXJuIGNhbGwNCj4gPj4+IHRoZSBicmlkZ2UncyBhdG9taWNfe2Rpc2FibGUsZW5h
YmxlfSBjYWxsYmFja3MgY2FuIGhhbmRsZQ0KPiA+Pj4gc3VzcGVuZC9yZXN1bWUgZm9yIHRoZSBi
cmlkZ2Ugd2l0aG91dCBkZWRpY2F0ZWQgUE0gb3BzLg0KPiA+Pj4NCj4gPj4+IEludHJvZHVjZSBp
dDYyNjNfYnJpZGdlX2luaXQoKSBhbmQgaXQ2MjYzX2JyaWRnZV91bmluaXQoKSBoZWxwZXJzIHRv
DQo+ID4+PiBjb25zb2xpZGF0ZSBwb3dlciBzZXF1ZW5jaW5nLCBoYXJkd2FyZSByZXNldCwgSTJD
IGFkZHJlc3Mgc2V0dXAsIGFuZA0KPiA+Pj4gTFZEUy9IRE1JIGNvbmZpZ3VyYXRpb24uIFRoZXNl
IHJlcGxhY2UgdGhlIG9wZW4tY29kZWQgaW5pdCBzZXF1ZW5jZQ0KPiA+Pj4gaW4NCj4gPj4+IHBy
b2JlKCkgYW5kIGFyZSBob29rZWQgaW50byBhdG9taWNfZW5hYmxlL2F0b21pY19kaXNhYmxlDQo+
ID4+PiByZXNwZWN0aXZlbHksIGd1YXJkZWQgYnkgYSBwb3dlcmVkIGZsYWcgdG8gYXZvaWQgcmVk
dW5kYW50IHJlLWluaXRpYWxpc2F0aW9uLg0KPiA+Pj4NCj4gPj4+IFN3aXRjaCBmcm9tIGRldm1f
cmVndWxhdG9yX2J1bGtfZ2V0X2VuYWJsZSgpIHRvDQo+ID4+PiBkZXZtX3JlZ3VsYXRvcl9idWxr
X2dldCgpIHNvIHRoYXQgcmVndWxhdG9ycyBjYW4gYmUgZXhwbGljaXRseQ0KPiA+Pj4gZW5hYmxl
ZCBhbmQgZGlzYWJsZWQgYWNyb3NzIHBvd2VyIGN5Y2xlcy4gTW92ZSByZXNldF9ncGlvIGFuZA0K
PiA+Pj4gcmVndWxhdG9yIHN0YXRlIGludG8gdGhlIGl0NjI2MyBzdHJ1Y3Qgc28gdGhleSBhcmUg
YWNjZXNzaWJsZSBiZXlvbmQgcHJvYmUgdGltZS4NCj4gPj4+DQo+ID4+PiBBZGQgYSByZW1vdmUo
KSBjYWxsYmFjayB0byBjbGVhbmx5IHBvd2VyIGRvd24gdGhlIGJyaWRnZSBvbiBkcml2ZXINCj4g
Pj4+IHVuYmluZCB2aWEgaXQ2MjYzX2JyaWRnZV91bmluaXQoKS4NCj4gPj4+DQo+ID4+PiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4+PiAt
LS0NCj4gPj4+IHYxLT52MjoNCj4gPj4+ICAqIERyb3BwZWQgc3lzdGVtIFBNIGNhbGxiYWNrcyBp
bnN0ZWFkIHVzaW5nIGJyaWRnZSdzDQo+ID4+PiAgICBhdG9taWNfe2Rpc2FibGUsZW5hYmxlfSBj
YWxsYmFja3MgdG8gaGFuZGxlIHN1c3BlbmQvcmVzdW1lLg0KPiA+Pj4gLS0tDQo+ID4+PiAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2MjYzLmMgfCA4OA0KPiA+Pj4gKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0NCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiBbLi4uXQ0KPiANCj4gPj4+ICtzdGF0aWMgaW50IGl0
NjI2M19icmlkZ2VfaW5pdChzdHJ1Y3QgaXQ2MjYzICppdCkgew0KPiA+Pj4gKyAgICAgICBpbnQg
cmV0Ow0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgICByZXQgPSByZWd1bGF0b3JfYnVsa19lbmFibGUo
aXQtPm51bV9zdXBwbGllcywgaXQtPnN1cHBsaWVzKTsNCj4gPj4+ICsgICAgICAgaWYgKHJldCkg
ew0KPiA+Pj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoaXQtPmRldiwgImZhaWxlZCB0byBlbmFi
bGUgcG93ZXIgc3VwcGxpZXNcbiIpOw0KPiA+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7
DQo+ID4+PiArICAgICAgIH0NCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgaXQ2MjYzX2h3X3Jlc2V0
KGl0LT5yZXNldF9ncGlvKTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgcmV0ID0gaXQ2MjYzX2x2
ZHNfc2V0X2kyY19hZGRyKGl0KTsNCj4gPj4+ICsgICAgICAgaWYgKHJldCkgew0KPiA+Pj4gKyAg
ICAgICAgICAgICAgIGRldl9lcnIoaXQtPmRldiwgImZhaWxlZCB0byBzZXQgSTJDIGFkZHJcbiIp
Ow0KPiA+Pj4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvcl9idWxrX2Rpc2FibGUoaXQtPm51bV9z
dXBwbGllcywNCj4gPj4+ICsgaXQtPnN1cHBsaWVzKTsNCj4gPj4NCj4gPj4gSSBrbm93IHRoYXQg
eW91IGNhbGwgaXQ2MjYzX2JyaWRnZV9pbml0KCkgaW4gcHJvYmUsIHByb2JhYmx5IGJlY2F1c2UN
Cj4gPj4geW91IHdhbnQgdG8gZW5hYmxlIHRoZSByZWd1bGF0b3JzIGZvciBob3RwbHVnIGRldGVj
dCBhZnRlciBwcm9iZShpdDYyNjNfZGV0ZWN0KCkgcmVhZHMgcmVnaXN0ZXINCj4gSERNSV9SRUdf
U1lTX1NUQVRVUyB0byBkbyB0aGUgZGV0ZWN0aW9uKS4NCj4gPj4gSG93ZXZlciwgYW4gaWRlYVsx
XSBpcyB0byB3cmFwIHRoZSByZWdpc3RlciByZWFkIG9wZXJhdGlvbiB3aXRoDQo+ID4+IHJlZ3Vs
YXRvcl9idWxrX2VuYWJsZSgpIGFuZA0KPiA+PiByZWd1bGF0b3JfYnVsa19kaXNhYmxlKCkgaW4g
aXQ2MjYzX2RldGVjdCgpIHNvIHRoYXQgeW91IG1heSBkcm9wDQo+ID4+IGl0NjI2M19icmlkZ2Vf
aW5pdCgpIGZyb20gcHJvYmUuICBXaXRoIHRoYXQsICBpdDYyNjNfYnJpZGdlX2luaXQoKSBpcw0K
PiA+PiBub3cgb25seSBjYWxsZWQgZnJvbSBhdG9taWNfZW5hYmxlLCB3aGljaCBtZWFucyB0aGF0
IHRoZQ0KPiA+PiBpbml0aWFsaXphdGlvbiBjb2RlIGNhbiBiZSBvcGVuLWNvZGVkIGFuZCB0aGUg
aW5pdGlhbGl6YXRpb24gaXMNCj4gPj4gc3VwcG9zZWQgdG8gYmUgc3VjY2Vzc2Z1bChkdWUgdG8g
dGhlICJhdG9taWMiIG5hdHVyZSkgaGVuY2Ugbm8gbmVlZCB0byBkbyB0aGUgcmVndWxhdG9yIGRp
c2FibGVtZW50DQo+IGJhaWxvdXQoZXJyb3IgbWVzc2FnZSBpbiBkbWVzZyBpcyBzdWZmaWNpZW50
KS4NCj4gPg0KPiA+IGl0NjI2M19kZXRlY3QoKSBzdGlsbCB3b3JrcyB3aXRoIHJlZ3VsYXRvcl9k
aXNhYmxlKCksIHNlZSB0aGUgbG9ncyBiZWxvdy4NCj4gDQo+IEkgZ3Vlc3MgdGhhdCBpdCB3b3Jr
cyBmb3IgeW91IG9uIFJaL0czTCBTTUFSQyBFVksgYmVjYXVzZSByZWd1bGF0b3JzIGFyZSBhbHJl
YWR5IGVuYWJsZWQgYnkgUFNDSSBiZWZvcmUNCj4gdGhpcyBkcml2ZXIncyBwcm9iZS4gDQoNClBT
Q0kgZG9lcyBub3QgZW5hYmxlIGl0LiBUaGUgc3VwcGx5IHRvIHRoZSByYWlscyBwcm92aWRlZCBi
eSBQTUlDIHJlZ3VsYXRvciBkdXJpbmcgc3lzdGVtIHJlc3VtZQ0KYW5kIGl0IGlzIGFsd2F5cyBv
bi4NCg0KPiBCdXQgdGhlcmUgY291bGQgYmUgcGxhdGZvcm1zIHdoaWNoIHVzZSBkZWRpY2F0ZWQg
cmVndWxhdG9ycyhsaWtlIGRpc2NyZXRlIFBNSUNzKQ0KPiBmb3IgSVQ2MjYzLCB3aGljaCBtZWFu
cyB0aGUgcmVndWxhdG9ycyBhcmUgbm90IHlldCBlbmFibGVkIGJlZm9yZSBwcm9iZS4NCg0KRG8g
eW91IGtub3cgYW55IHBsYXRmb3JtIHRoYXQgZG9lcyBub3Qgd29yayB0aGUgZGV0ZWN0aW9uIGFm
dGVyIHJlZ3VsYXRvciBkaXNhYmxlKCk/DQoNCkN1cnJlbnRseSB3ZSBkb24ndCBoYXZlIGFueSBw
bGF0Zm9ybXMgdG8gdGVzdCB0aGlzLiBJZiBhbnkgcGxhdGZvcm1zIHRoYXQgaGFzIGNvbnRyb2xs
ZWQNCnJlZ3VsYXRvciB3ZSBjYW4gdXBkYXRlIHRoZSBjb2RlIGJhc2VkIG9uIHRlc3RpbmcuDQoN
Cj4gDQo+ID4NCj4gPg0KPiA+Pg0KPiA+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+
ID4+PiArICAgICAgIH0NCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgaXQ2MjYzX2x2ZHNfY29uZmln
KGl0KTsNCj4gPj4+ICsgICAgICAgaXQ2MjYzX2hkbWlfY29uZmlnKGl0KTsNCj4gPj4+ICsNCj4g
Pj4+ICsgICAgICAgaXQtPnBvd2VyZWQgPSB0cnVlOw0KPiA+Pg0KPiA+PiBJZiB5b3UgZHJvcCBp
dDYyNjNfYnJpZGdlX2luaXQoKSBmcm9tIHByb2JlLCBJIHRoaW5rICdwb3dlcmVkJyBmbGFnIGNh
biBiZSBkcm9wcGVkIHRvby4NCj4gPj4NCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgcmV0dXJuIDA7
DQo+ID4+PiArfQ0KPiA+Pj4gKw0KPiA+Pj4gK3N0YXRpYyBpbnQgaXQ2MjYzX2JyaWRnZV91bmlu
aXQoc3RydWN0IGl0NjI2MyAqaXQpIHsNCj4gPj4+ICsgICAgICAgcmVndWxhdG9yX2J1bGtfZGlz
YWJsZShpdC0+bnVtX3N1cHBsaWVzLCBpdC0+c3VwcGxpZXMpOw0KPiA+Pj4gKyAgICAgICBpdC0+
cG93ZXJlZCA9IGZhbHNlOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgICByZXR1cm4gMDsNCj4gPj4+
ICt9DQo+ID4+PiArDQo+ID4+PiAgc3RhdGljIHZvaWQgaXQ2MjYzX2JyaWRnZV9hdG9taWNfZGlz
YWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiA+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZQ0KPiA+Pj4gKnN0
YXRlKSAgeyBAQCAtNTg3LDYgKzYyNiw4IEBAIHN0YXRpYyB2b2lkDQo+ID4+PiBpdDYyNjNfYnJp
ZGdlX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsDQo+ID4+PiAgICAg
ICAgIHJlZ21hcF93cml0ZShpdC0+aGRtaV9yZWdtYXAsIEhETUlfUkVHX1BLVF9HRU5FUkFMX0NU
UkwsIDApOw0KPiA+Pj4gICAgICAgICByZWdtYXBfd3JpdGUoaXQtPmhkbWlfcmVnbWFwLCBIRE1J
X1JFR19BRkVfRFJWX0NUUkwsDQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICBBRkVfRFJWX1JT
VCB8IEFGRV9EUlZfUFdEKTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgaXQ2MjYzX2JyaWRnZV91
bmluaXQoaXQpOw0KPiA+Pg0KPiA+PiBXZWxsLCB0aGlzIGNvdWxkIGVmZmVjdGl2ZWx5IGRpc2Fi
bGUgdGhlIHJlZ3VsYXRvcnMgYW5kIGhvdHBsdWcgZGV0ZWN0aW9uDQo+ID4+IHdvbid0IHdvcmsg
dGhlbi4gICBTbywgYWdhaW4sIHRoZSBhYm92ZSBpZGVhWzFdIGhlbHBzLg0KPiA+DQo+ID4gSXMg
aXQgbm90IHdvcmtpbmcgb24geW91ciBzZXR1cD8gSXQgd29ya3MgZm9yIG1lLg0KPiANCj4gTXkg
c2V0dXAgdXNlcyBhbHdheXMtb24gcmVndWxhdG9ycywgc28gZGV0ZWN0IHdvcmtzIGZvciBtZSBh
cyB3ZWxsIGV2ZW4gaWYgcmVndWxhdG9ycyBhcmUgbm90DQo+IGV4cGxpY2l0bHkgZW5hYmxlZC9k
aXNhYmxlZCBpbiBkZXRlY3QgY2FsbGJhY2suICBCdXQsIGFzIEkgbWVudGlvbmVkIGFib3ZlLCB3
ZSBuZWVkIHRvIGVuYWJsZS9kaXNhYmxlDQo+IHJlZ3VsYXRvcnMgaW4gZGV0ZWN0IGNhbGxiYWNr
IChhbHNvIGluIGVkaWRfcmVhZCBjYWxsYmFjaykgYWZ0ZXIgYXRvbWljX2Rpc2FibGUgaXMgZG9u
ZSBmb3IgdGhvc2UNCj4gcGxhdGZvcm1zIHdoaWNoIHVzZSBkZWRpY2F0ZWQgcmVndWxhdG9ycy4N
Cg0KT24gYXRvbWljX2Rpc2FibGUoKSwgd2UgYXJlIGRpc2FibGluZyB0aGUgcmVndWxhdG9yLiBT
byBvbiwgcmVndWxhdG9yLWdwaW8NCnBsYXRmb3JtcywgdGhlIGRldGVjdGlvbigpIHdvbid0IHdv
cmsgYWZ0ZXIgdGhhdC4gSW4gdGhhdCBjYXNlLCB3ZSBuZWVkIHRvIG1vdmUNCnN1c3BlbmQvcmVz
dW1lIGNhbGxzIGZyb20gYXRvbWljX3tlbmFibGUsZGlzYWJsZX0gdG8gUE0gY2FsbGJhY2tzLg0K
DQpEbyB5b3UgYWdyZWU/DQoNCkNoZWVycywNCkJpanUNCg0K

