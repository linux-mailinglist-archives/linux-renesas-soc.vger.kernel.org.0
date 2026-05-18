Return-Path: <linux-renesas-soc+bounces-32747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMD+B/K7CmrG6wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 09:12:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B017A5673D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 09:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F24B63001FC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 07:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E3C3DEAD0;
	Mon, 18 May 2026 07:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WhkzT/hM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BDD3DBD47;
	Mon, 18 May 2026 07:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088367; cv=fail; b=le3gtfYDnBtV3zKIDRx/bftTaGX6goebWk3AWwcK8bcyF/8+q2Wr+2ifdOfzZP8l0dwHsMvgXxKMk2vfsw1MtcR96P0Juv9nAkGPBpJixMBOi7zbT9OEW/QE6KfomMyJfMyacWVW+YL8LJPSzP2aMc+e1Hm4AvH7NYNcNOzieGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088367; c=relaxed/simple;
	bh=1nn0uwvpiszuvDjaBxSeyc92kjMjyYCw5dns5ZuxxP0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VMZ2dAES1n2MzUHkpISr7LG8LhxjAeRQXaPnGuDBUOLV/y0hFKKyvbZyl3dDNRC0n1Ua4eboe9wVqRYbP2ngRnyqG9TGRX3a7ZykiPKFg5WUG57BVo7aUMdrgCr9A5TgXgNMBHYfSag235I6XC9oiakV2800AHCoe8gUFAORYaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WhkzT/hM; arc=fail smtp.client-ip=52.101.125.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CC4nL/oDkbJ19mmzZ3rJ6/qS7jHzi34nL+mjKBGEmaTFte+HSWqOANoafbAYw+DLq56T1hi+oxKj7ouZUkdJhKg+UgDS2Wpg0MnmavVZz8yvXUZ0yWRt/9rsJaH12jpaWapghJACBN64pTkfS+86sV3fuaSU8a3onTaSIPXxu+2Ao/bYUoVJ1WufewdQiAtwFwJylmJYuVxLlMz3V4gpKU5nU+B5NZ+bmTAvxErpP5JwmDrLeYyBiGiPgeHFemqPCX57qmwuzcYpvqAK1deuGY6H3VLqmgjDxx1C3xVwb5YpUvvPia0NnSBohCLWN1V/lZ91wYnQoW0JloH/TEvZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nn0uwvpiszuvDjaBxSeyc92kjMjyYCw5dns5ZuxxP0=;
 b=U/8Scawm1e5WepgOMBlWLnvBOBOk3vZ1hdIZR1IGrwzvKlVm9lx83TtXQVreVOxY5eL8tss4aYJLkVTXiTxbvrtDxel7yKzA3RgdwGAC1KXrvh4JjUfUXbi5l+1irMloTLt8KernTZIwWkG276oIVI6oHxans3m2Ic0gBxhDYbxgoY7e5tyiKRRVo7n26oCaWWj0LEQwgvyi2EmxVIxpQE5LVNld6XkCnHuiTMzwr23Nn9D33muDBf+0BqdCLK6X+YYYOqzswisw1O+zj8hqcR9sh9mWnUKc1dHlcPfitq4QFnIYwToJhLLe3d3HFgtYHnoiaX+m/y0PP0SNos0ZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nn0uwvpiszuvDjaBxSeyc92kjMjyYCw5dns5ZuxxP0=;
 b=WhkzT/hMUOIcJMjGzWy3ZJyvgvHv+a4/OGFeH/YJog3D1o/PnfPZTEq3ukdDh9O4j6SVkseXCLE12eiqBwIWbvoOXwFrB+0S1UnEfycOGJhKS58G5L9OeZbynoiBXNGhX6B144F0s861ROritT9ZTfRElC03Boa3rplEU12ZXz0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11516.jpnprd01.prod.outlook.com (2603:1096:604:246::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 07:12:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 07:12:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-output clock limits
Thread-Topic: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-output clock limits
Thread-Index: AQHc4h12S/BvNeveSEeUROA0xwu+DrYShyGggAAsoACAALE5kA==
Date: Mon, 18 May 2026 07:12:35 +0000
Message-ID:
 <TY3PR01MB11346178F22560ED8A8A38DBD86032@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260512144104.761531-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346174DD5FFD70AB39F570086022@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v_gmPEcWgFsC3Kv4X_M_qzbVHeEY=EmzdYxzy+PkyB-Q@mail.gmail.com>
In-Reply-To:
 <CA+V-a8v_gmPEcWgFsC3Kv4X_M_qzbVHeEY=EmzdYxzy+PkyB-Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11516:EE_
x-ms-office365-filtering-correlation-id: 8b8fe104-9072-47ed-9bff-08deb4acd642
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|11063799003|18002099003|4143699003|56012099003|3023799003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 AffH8fe7ksqqYCEm8BHZOnvClyIIHw6HjHb8/ls8wgOPjQAc3VeK0ws01F7V/DfLTmql7luWQvi8fgRqpLrCUVuO7GGWzrpvzwOjDtofrUBL8gvyLDFWPXit4BakTKTPqiZ8cSj/IGRS0CjZ40cFB611e0UorVQRDU+mRrFr5yKWHaW0NrZaI2etjINvFBGzPRsrVlvx/dBdEIsa5AET8lWbJe2h4q1F/Y+jkygEVRwDSTazYp+cDO8wl3j28haAed3CWGghuvntak3hIGBbXK4nrh+h+5ZlscwZZxOoJhw3kAINxBssov9IF2/4lMfdXuiVZjw3WiD0xfzd5shxkiT9CdiVRWSK7EIrST3OQy18YwvN2OtYdaNaKdp8urbdXKXwZdX4MVz2IQNqkhWdxk03d7cUlvgG9VX36cuRkXD0ztnraIBml6213GfU/BkWDM2z8am+tt5fA29Zt+ls+TupbAync5tjmzh0plU6M3vXzFx1v7MdG4PvyXxTlM4KJc/d0lrk+KQO3p3swTv/Mg55zN5HvlsCl8u7yqgqpcuxD7ZJMewSodoA7tnC0Y2wKihO2NYJeFhiLXJcccVCoPjF8QOxsNVdlhRle94awQLv5ymcns7ArLm07eb3AVzjHraFxMLdZslbieUwUCOxNPkzhmrxaUpwif3D8fr3Tluk1qMJklnuxGKrQC3P66CPjWC254CGW0Se8/oPwgXgful4VWeWPSf7RYDSOye7RQoAs+GZeqyF2SoVwlPcwoMZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(11063799003)(18002099003)(4143699003)(56012099003)(3023799003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MjZ5K1ZpMitKSVEwUW05TE5ocFVQVHVjREZrcjc2Y2FXQmxUVXFmVk03STBn?=
 =?utf-8?B?NjJqSzR5bjYwVUNtTldJQnJsRjhHQm1WMktYa3l2cVBDNGh3UHd6bDhmc0dk?=
 =?utf-8?B?ZGNnTkZLQUxCcTNSUzJhQTFoOHg2WEdwcVBXdjRtLzB1YTA2SmpsanRLTUIv?=
 =?utf-8?B?ODM1YkdOTDAxMnBoZ0dSOUtKMjB5K3ljalNYQk5vSnBpVlFBSWJhTUNiZ1Ar?=
 =?utf-8?B?M0dIenhrcHorMmc2SFN3cWZVbXJuRFNma3Nac3BDMnN5b0xBOGUyTTQrZ2t5?=
 =?utf-8?B?Q3RMZytuWEdJdW81MHRjRUxyQU5qRnhzOHFLUkcrWFB6QTkxdGZXNVovSUVT?=
 =?utf-8?B?VkhZMGNZRFljVHF4WjA4Z0c3NmdpTVV0Tm5CeERmUitLdW94L2hlRGl3V3dH?=
 =?utf-8?B?NmpwcDcvNjdjRDhJNkhFckpubHN1My9scThNeFVEbzlQdUhZNUVFeW9YNUpr?=
 =?utf-8?B?b1dCRTk3Y2JkV3JWdHdwZkEwdUtrcWZWNjdFYytKeStzMEwvZm1Idmg1T0p4?=
 =?utf-8?B?bm9qZkZSTFlTTVpCdlZCT0dFd1l0d3ptWmdEenpYVmlEZlNTK0Q0aVUvMWhR?=
 =?utf-8?B?aEQwd2ErbnFDelM3Qi9BZnUzWUNqQlptUFhqSzgrL2V3V2xlSWVzU0sxeVhX?=
 =?utf-8?B?ZWEycTB5cHJ1ZU5QSXRZTG9JNUpsbHhTN3lrRlZkai9iRllGTGFEeXY0alFm?=
 =?utf-8?B?SzF4cU52Z2xhcnRYbStOTEpzQ1RGdis3L3RuR3cxUTY4REJBcGMxVFdKRTVJ?=
 =?utf-8?B?LzJ5WU5CK3c3TG1yKzZLWWtlbExDMituQ0FnVENRcjk3dFpLNHVxQThDdm1U?=
 =?utf-8?B?cGpqN25vdXBNZ0puemRXd2VSQUtJUlpJVWdRaXAwNDJncnZpVmZvcjlTbHRx?=
 =?utf-8?B?aTFIU3pvTXhOdGhLRytEVUx0KzlwdmFkbDZ4WGJuSUhaL1ErMHNGL3NZZWkr?=
 =?utf-8?B?SmNGSmxwRHJCZHZmd3ZjWDIyUnhyNUl6MTk5Y2h6TGp1YTRFSzdqaGVyUkJ5?=
 =?utf-8?B?RUx1RnU0SUg0SWhlaHNnV2JOUEVTRTZYQVo1Ynh0UjZTYWNnWVJJQ2laaUdT?=
 =?utf-8?B?d3ZJQ0dMWGJvMWJWeit6dFRtTlFwWGQ1WHBPVTFMTHNGcEMxdW9lR2lMd0F0?=
 =?utf-8?B?eEswa3ZiekV6UmhCR3JTMjVSa1Erall1ZGxVUk1HeGhEV09rZ3dYOUN2eWZQ?=
 =?utf-8?B?bTY1WVJVT0E1VXBOeWNBbmwxaXBqYmRQM0pOWTBPak9MeTBYeTFZclFZcWYr?=
 =?utf-8?B?emJvWUNIMXprZkVTaWEyNGlHNE1hdjZMNHZWSkhwUmJFamdoZEVmcUl2R0l1?=
 =?utf-8?B?MWVIMzVxNVFLejRoWUJVVkZtZjc2b1VKMkRpTlc5c1VUYTdHYk1xODJJZGVH?=
 =?utf-8?B?ZmFPQ3dDK01kRUtwY2p1VTFqU2QxSFZrRTVtYnpnRmtFbFIxSFBXU2RLb2xW?=
 =?utf-8?B?TC95NFJYVXNZWHQwVDVMOHhxczdmMXVHV081RDhWNlo3U3JkdExwUnkvRjRX?=
 =?utf-8?B?WExwQ3Era2NZMWkzY3I0L3JDSW0rZ2RPazZ6Vzh3OER6bmRFVWkzaUE5cVlr?=
 =?utf-8?B?M05GMXd5SEpaU1ZJUWVKbHpEZlpieDRJOERSTkZWSXhla2o4eDMrRHFrUDRm?=
 =?utf-8?B?TjhzQkZWSW1sUVlwcGhqRUFCdU1vbDVPZ0toWTFXVGtQaW54RWozK3dhWkpT?=
 =?utf-8?B?M1YvOXBOWXlhMTB1NVhaVHFoR2UvKzBFS215aFV2NlFZTWRRK3JpNXlYVEgv?=
 =?utf-8?B?SnBRd3VMTEx6NHd4QngvZjN0bVZCRmZMNUlBYjFXR3FNM0tYUm9mL2FaTFdC?=
 =?utf-8?B?SW1jcmh1Rit3dWd6V2x5OW9lTDA2bTgrc3A3c0RtOTN5RHMweWlRUDA4NVNt?=
 =?utf-8?B?WkZpYTV6TCtCVEtVbTluU2ZXd1J5bkl4VWdQNGd0OEc0ZkhWbW9wS2F4MXFO?=
 =?utf-8?B?YndSeVJnekxWYXV6QTYxREk1SXJRVVNNbm92Nkg3aE8wUlY4Zzh3WkdpdFpM?=
 =?utf-8?B?NEtCSnBxVnVXeitKWXBBcmpUazlFNmplRVRteGJlY1VWbkdOZy9BU0RqZHRL?=
 =?utf-8?B?WEt6aUVKV2s1c0lIUU80VzhJazM4R2tvWGx0aUdwbWRDbE1yd1FROE9PMW9J?=
 =?utf-8?B?TUttaU93NS9aeWtBaVlLZ3A4SUM4WEEyUVllL0FjeElkYVRjV3dJUmFuK2xW?=
 =?utf-8?B?UzI3Vkw0T0FONzF6Z1R4MlNxNEgrY3ZtdGhhKytpMS9mRGVCT0JMSFpkYS9G?=
 =?utf-8?B?d1FTRytCcHFKenpFTUovWmQ3TlVDcld0QnRzZzlhcWE2SDB4cm1jRDZCZThW?=
 =?utf-8?B?MUVMNFdqbVdqbitsclJrdVljbFJLcndyeWlNWVZXU0JaNFRFQVFxZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8fe104-9072-47ed-9bff-08deb4acd642
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 07:12:35.4978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x90y6JbViPFDEPJCr3FzgfRfeIqKnqWbX3DQrAhQmZ5zlDQhACIUzM8EFCJi6sE7t6tunyaMGM5LbLwkOFkmISFvlQHO9OvBsWvMHYD9+AQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11516
X-Rspamd-Queue-Id: B017A5673D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32747-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMTcgTWF5
IDIwMjYgMjE6MzANCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA0LzVdIGRybTogcmVuZXNhczog
cnotZHU6IE1vdmUgbW9kZV92YWxpZCBsb2dpYyB0byBwZXItb3V0cHV0IGNsb2NrIGxpbWl0cw0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCj4gDQo+IE9u
IFN1biwgTWF5IDE3LCAyMDI2IGF0IDY6NTnigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgUHJhYmhha2FyLA0KPiA+DQo+ID4gVGhh
bmtzIGZvciB0aGUgcGF0Y2guDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiBGcm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiA+
ID4gU2VudDogMTIgTWF5IDIwMjYgMTU6NDENCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2MyA0LzVd
IGRybTogcmVuZXNhczogcnotZHU6IE1vdmUgbW9kZV92YWxpZCBsb2dpYw0KPiA+ID4gdG8gcGVy
LW91dHB1dCBjbG9jayBsaW1pdHMNCj4gPiA+DQo+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxw
cmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gTW92
ZSBwaXhlbCBjbG9jayB2YWxpZGF0aW9uIGZyb20gYSBmaXhlZCBlbmNvZGVyIGNoZWNrIHRvIHBl
ci1vdXRwdXQNCj4gPiA+IGNvbnN0cmFpbnRzIHN0b3JlZCBpbiByemcybF9kdV9vdXRwdXRfcm91
dGluZy4NCj4gPiA+DQo+ID4gPiBQcmV2aW91c2x5LCByemcybF9kdV9lbmNvZGVyX21vZGVfdmFs
aWQoKSBhcHBsaWVkIGEgaGFyZC1jb2RlZCA4My41DQo+ID4gPiBNSHogdXBwZXIgbGltaXQgc3Bl
Y2lmaWNhbGx5IGZvciBEUEFEMC4gVGhpcyBhcHByb2FjaCBjYW5ub3Qgc2NhbGUNCj4gPiA+IGFj
cm9zcyB0aGUgUlogRFUgZmFtaWx5IGJlY2F1c2UgcGl4ZWwgY2xvY2sgbGltaXRzIHZhcnkgcGVy
IFNvQyBhbmQgcGVyIG91dHB1dCBpbnRlcmZhY2UuDQo+ID4gPg0KPiA+ID4gQWRkIG1vZGVfY2xv
Y2tfbWluIGFuZCBtb2RlX2Nsb2NrX21heCBmaWVsZHMgdG8NCj4gPiA+IHJ6ZzJsX2R1X291dHB1
dF9yb3V0aW5nIHNvIHRoYXQgY2xvY2sgY29uc3RyYWludHMgYXJlIGV4cHJlc3NlZCBhdA0KPiA+
ID4gdGhlIGdyYW51bGFyaXR5IG9mIGluZGl2aWR1YWwgb3V0cHV0IGludGVyZmFjZXMgcmF0aGVy
IHRoYW4gZ2xvYmFsbHkNCj4gPiA+IHBlciBTb0MuIFVwZGF0ZQ0KPiA+ID4gcnpnMmxfZHVfZW5j
b2Rlcl9tb2RlX3ZhbGlkKCkgdG8gbG9vayB1cCB0aGUgcm91dGluZyBlbnRyeSBmb3IgdGhlDQo+
ID4gPiBhY3RpdmUgb3V0cHV0IGFuZCByZXR1cm4gTU9ERV9DTE9DS19MT1cgb3IgTU9ERV9DTE9D
S19ISUdIIHdoZW4gdGhlDQo+ID4gPiBwaXhlbCBjbG9jayBmYWxscyBvdXRzaWRlIHRoZSBkZWNs
YXJlZCByYW5nZS4gQSB2YWx1ZSBvZiAwIGZvciBlaXRoZXIgZmllbGQgbWVhbnMgbm8gYm91bmQg
aXMNCj4gZW5mb3JjZWQgaW4gdGhhdCBkaXJlY3Rpb24uDQo+ID4gPg0KPiA+ID4gU2V0IHRoZSBE
UEFEMCBwaXhlbCBjbG9jayBsaW1pdHMgZm9yIFJaL0cyVUwgKFI5QTA3RzA0M1UpIHRvIDIwLjg3
NSBNSHogbWluaW11bSBhbmQgODMuNSBNSHoNCj4gbWF4aW11bS4NCj4gPiA+IFJaL0cyTCBhbmQg
UlovRzJMQyAoUjlBMDdHMDQ0KSBzaGFyZSB0aGUgc2FtZSBEUEFEMCBwaXhlbCBjbG9jayBsaW1p
dHMuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthcg0KPiA+ID4gPHBy
YWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4g
djItPnYzOg0KPiA+ID4gLSBNb3ZlZCBjbG9jayBsaW1pdHMgZnJvbSBkZXZpY2VfaW5mbyB0byBv
dXRwdXRfcm91dGluZyB0byBhbGxvdw0KPiA+ID4gICBwZXItb3V0cHV0IGNvbnN0cmFpbnRzLg0K
PiA+ID4gLSBVcGRhdGVkIGNvbW1pdCBtZXNzYWdlIHRvIHJlZmxlY3QgdGhlIGNoYW5nZSBpbiBh
cHByb2FjaC4NCj4gPiA+DQo+ID4gPiB2MS0+djI6DQo+ID4gPiAtIERyb3BwZWQgc3RvcmluZyBp
bmZvIHBvaW50ZXIgaW4gc3RydWN0IHJ6ZzJsX2R1X2VuY29kZXIgYXMgaXQncyBub3QgbmVlZGVk
Lg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxf
ZHVfZHJ2LmMgICAgIHwgNCArKysrDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnot
ZHUvcnpnMmxfZHVfZHJ2LmggICAgIHwgNCArKysrDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3Jl
bmVzYXMvcnotZHUvcnpnMmxfZHVfZW5jb2Rlci5jIHwgNiArKysrKy0NCj4gPiA+ICAzIGZpbGVz
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+DQo+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfZHJ2LmMN
Cj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotIGR1L3J6ZzJsX2R1X2Rydi5jIGlu
ZGV4DQo+ID4gPiAwZmVmMzNhNWEwODkuLmQxYmMyMDVlYjVmOCAxMDA2NDQNCj4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2Rydi5jDQo+ID4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9kcnYuYw0KPiA+ID4gQEAg
LTMzLDYgKzMzLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF9kdV9kZXZpY2VfaW5mbyBy
emcybF9kdV9yOWEwN2cwNDN1X2luZm8gPSB7DQo+ID4gPiAgICAgICAgICAgICAgIFtSWkcyTF9E
VV9PVVRQVVRfRFBBRDBdID0gew0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIC5wb3NzaWJs
ZV9vdXRwdXRzID0gQklUKDApLA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIC5wb3J0ID0g
MCwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAubW9kZV9jbG9ja19taW4gPSAyMDg3NSwN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAubW9kZV9jbG9ja19tYXggPSA4MzUwMCwNCj4g
PiA+ICAgICAgICAgICAgICAgfSwNCj4gPiA+ICAgICAgIH0sDQo+ID4gPiAgfTsNCj4gPiA+IEBA
IC00Nyw2ICs0OSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcnpnMmxfZHVfZGV2aWNlX2luZm8g
cnpnMmxfZHVfcjlhMDdnMDQ0X2luZm8gPSB7DQo+ID4gPiAgICAgICAgICAgICAgIFtSWkcyTF9E
VV9PVVRQVVRfRFBBRDBdID0gew0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIC5wb3NzaWJs
ZV9vdXRwdXRzID0gQklUKDApLA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIC5wb3J0ID0g
MSwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAubW9kZV9jbG9ja19taW4gPSAyMDg3NSwN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAubW9kZV9jbG9ja19tYXggPSA4MzUwMCwNCj4g
PiA+ICAgICAgICAgICAgICAgfQ0KPiA+ID4gICAgICAgfQ0KPiA+ID4gIH07DQo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfZHJ2LmgNCj4g
PiA+IGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotIGR1L3J6ZzJsX2R1X2Rydi5oIGluZGV4
DQo+ID4gPiA1ODgwNmMyYThmMmIuLjMwN2FlNzBkZDM4MiAxMDA2NDQNCj4gPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2Rydi5oDQo+ID4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9kcnYuaA0KPiA+ID4gQEAgLTMw
LDYgKzMwLDggQEAgZW51bSByemcybF9kdV9vdXRwdXQgew0KPiA+ID4gICAqIHN0cnVjdCByemcy
bF9kdV9vdXRwdXRfcm91dGluZyAtIE91dHB1dCByb3V0aW5nIHNwZWNpZmljYXRpb24NCj4gPiA+
ICAgKiBAcG9zc2libGVfb3V0cHV0czogYml0bWFzayBvZiBwb3NzaWJsZSBvdXRwdXRzDQo+ID4g
PiAgICogQHBvcnQ6IGRldmljZSB0cmVlIHBvcnQgbnVtYmVyIGNvcnJlc3BvbmRpbmcgdG8gdGhp
cyBvdXRwdXQNCj4gPiA+IHJvdXRlDQo+ID4gPiArICogQG1vZGVfY2xvY2tfbWluOiBtaW5pbXVt
IHBpeGVsIGNsb2NrIGluIGtIeg0KPiA+ID4gKyAqIEBtb2RlX2Nsb2NrX21heDogbWF4aW11bSBw
aXhlbCBjbG9jayBpbiBrSHoNCj4gPiA+ICAgKg0KPiA+ID4gICAqIFRoZSBEVSBoYXMgMiBwb3Nz
aWJsZSBvdXRwdXRzIChEUEFEMCwgRFNJMCkuIE91dHB1dCByb3V0aW5nIGRhdGENCj4gPiA+ICAg
KiBzcGVjaWZ5IHRoZSB2YWxpZCBTb0Mgb3V0cHV0cywgd2hpY2ggQ1JUQyBjYW4gZHJpdmUgdGhl
IG91dHB1dCwNCj4gPiA+IGFuZCB0aGUgdHlwZSBAQCAtMzgsNiArNDAsOCBAQCBlbnVtIHJ6ZzJs
X2R1X291dHB1dCB7ICBzdHJ1Y3QgcnpnMmxfZHVfb3V0cHV0X3JvdXRpbmcgew0KPiA+ID4gICAg
ICAgdW5zaWduZWQgaW50IHBvc3NpYmxlX291dHB1dHM7DQo+ID4gPiAgICAgICB1bnNpZ25lZCBp
bnQgcG9ydDsNCj4gPiA+ICsgICAgIGludCBtb2RlX2Nsb2NrX21pbjsNCj4gPiA+ICsgICAgIGlu
dCBtb2RlX2Nsb2NrX21heDsNCj4gPiA+ICB9Ow0KPiA+ID4NCj4gPiA+ICAvKg0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2VuY29kZXIu
Yw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei0gZHUvcnpnMmxfZHVfZW5jb2Rl
ci5jIGluZGV4DQo+ID4gPiAwZTU2N2I1N2E0MDguLjRhZjJhZTA5ZmYzOSAxMDA2NDQNCj4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2VuY29kZXIuYw0K
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfZW5jb2Rl
ci5jDQo+ID4gPiBAQCAtNTAsOCArNTAsMTIgQEAgcnpnMmxfZHVfZW5jb2Rlcl9tb2RlX3ZhbGlk
KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpICB7DQo+ID4gPiAgICAg
ICBzdHJ1Y3QgcnpnMmxfZHVfZW5jb2RlciAqcmVuYyA9IHRvX3J6ZzJsX2VuY29kZXIoZW5jb2Rl
cik7DQo+ID4gPiArICAgICBzdHJ1Y3QgcnpnMmxfZHVfZGV2aWNlICpyY2R1ID0gdG9fcnpnMmxf
ZHVfZGV2aWNlKHJlbmMtPmJhc2UuZGV2KTsNCj4gPiA+ICsgICAgIGNvbnN0IHN0cnVjdCByemcy
bF9kdV9vdXRwdXRfcm91dGluZyAqcm91dGUgPQ0KPiA+ID4gKyZyY2R1LT5pbmZvLT5yb3V0ZXNb
cmVuYy0+b3V0cHV0XTsNCj4gPiA+DQo+ID4gPiAtICAgICBpZiAocmVuYy0+b3V0cHV0ID09IFJa
RzJMX0RVX09VVFBVVF9EUEFEMCAmJiBtb2RlLT5jbG9jayA+IDgzNTAwKQ0KPiA+DQo+ID4gUGxl
YXNlIHJldGFpbiB0aGUgY2hlY2sgZm9yIERQQUQgb3V0cHV0LCB0byBhdm9pZCBjaGVja2luZyB0
aGUgc2FtZSBmb3IgRFNJIGFuZCBMVkRTLg0KPiA+DQo+IFRoaXMgcGF0Y2ggY2hlY2tzIG9ubHkg
Zm9yIHBhZHMgdGhhdCBoYXZlIGFkZGVkIGNvbnN0cmFpbnRzLg0KDQpJdCB3aWxsIGxlYWQgdG8g
dHdvIGNoZWNrcyByb3V0ZS0+bW9kZV9jbG9ja19taW4gYW5kIHJvdXRlLT5tb2RlX2Nsb2NrX21h
eC4NCg0KV2hlcmVhcyBieSBjaGVja2luZw0KDQppZiAocmVuYy0+b3V0cHV0ICE9IFJaRzJMX0RV
X09VVFBVVF9EUEFEMCkgaXMgYSBzaW5nbGUgY2hlY2sgYW5kIGl0IGlzIG1lYW50IA0KZm9yIHNr
aXBwaW5nIERTSSBhbmQgTFZEUyBhcyB0aGUgcmVzcGVjdGl2ZSBlbmNvZGVyIGRyaXZlcnMgZG8g
aGF2ZSBtb2RlX3ZhbGlkKCkuDQoNCkNoZWVycywNCkJpanUNCg==

