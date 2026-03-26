Return-Path: <linux-renesas-soc+bounces-30375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BDNJKBUxWmD9QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 16:45:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85698337D17
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 16:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5DA131F564E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8D63FE663;
	Thu, 26 Mar 2026 15:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QQ0OicMG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDC034252B;
	Thu, 26 Mar 2026 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539380; cv=fail; b=IzN5mm+zR4A0YKvnffaosFJ5mqxyWAP/HtSJLxfJw0itxcjI94BTOe0SintT/BuCbUmNMJjCDRp29qnMTphPkQwD5K4+P6DE+feHdwvMVUtP9Ja7/0ZZfG4IrfIWeB8f2Ace5j9K1NddefwQLTfyyCnOog8Z/XALPg9zsQDzJ3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539380; c=relaxed/simple;
	bh=+MMpdFs/w5ovIZ8pZT8kzadqTdGCly6rBjz2NjTt4f0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D4Yl9NImPwtVbSiqifPI1Ees8QcrwC3ESdzan6xlcq7zCv9Nhorq7oGPfNm1tuKtrCD+TfJNmGWd6vy+AjpEZEJ9l6dKiegRJFnO00wkXD0O31ZQ9t6wd3Zzlb4ToPM04+9TLjFsOnVnUwjwT/Su7o6QgnDGo6qL3qSWNKh0vA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QQ0OicMG; arc=fail smtp.client-ip=52.101.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HK+ZnXwfAd+yRXomL4rv6oj11Fr7J7HJz/uaFEkgZPP/61SsncpOUyRiWzsVgz3XEbzOExtzyP4Mv9VAXugK2cOiCDi/ETH6xQHuk2raUH9gSZYjxlAbjutZ3BkopjedoDJL/zMwfDELvo8nw2HhKM446Fd7EV0FOnI19vOQUybamJ7pL50FUlMgVysM49FIlgPv2FA/C9QncL8lROujhXaEVpdYdpRJ58OBAMlyYJe2w3VY4ekzh5eeweO5K9LNqtiYJEw1eC9kxnTAHyGe7HexFSFiLYTWxmbxkUUJBjaaDTYeKNPGhyXX9zXqdXksXSil+/AdrSEUOuHTN1cEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MMpdFs/w5ovIZ8pZT8kzadqTdGCly6rBjz2NjTt4f0=;
 b=TwGxHKMOAoKGCpFwd0JjrYOEyeXBrTEITMUk789e5CBWmC5069WXugQ90SCP1REMGO+E1Oza3pKGSp4jrfyX7pt3HmOcZxBs5cnSElZ2Iz9jk5VYHsARjWrj7NDfNK3TGCLgN+x6LGroQ+MAWc4ltjxK2NV7a5D+tYCZpXuFar0R9MQGtw3Y/U3cdZPXlIXnz0YX2bYccAk9mtkh5RAOaZm0PnBgCqgBMIDzULbN30U6/OJXyE1zR7nbII91dLX5AuovxzwbGMNp0XdeNeYNDYW/2TcLrn3KV4ClLXwQyml8PcdBeiiAt+4J1dzdPuwtK87JbAr2Q6JBeUfKugiX+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MMpdFs/w5ovIZ8pZT8kzadqTdGCly6rBjz2NjTt4f0=;
 b=QQ0OicMG4iOI6l88fTySxTZsXfUahXNkuG+uWbACBcT4nBEdkQu4wstiExZg+RcNeu8YrEgVVibtC8Vid6WyzFIzIdX3OtI0F50GUnAysqfQ9Y2110eDZhaIO6r6f99LIOe3o3S5O9dZso44s5E4qDBEMN6nThzslf7AKsj4qu0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14713.jpnprd01.prod.outlook.com (2603:1096:604:39b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 15:36:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9745.023; Thu, 26 Mar 2026
 15:36:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?utf-8?B?QWRyacOhbiBMYXJ1bWJl?= <adrian.larumbe@collabora.com>
CC: Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
	<robh@kernel.org>, Steven Price <steven.price@arm.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/4] drm/panfrost: Drop redundant optional clock checks
 in runtime PM
Thread-Topic: [PATCH v2 2/4] drm/panfrost: Drop redundant optional clock
 checks in runtime PM
Thread-Index:
 AQHcuIh8hfFALj8wyUqqAbYPOoEkkbW37WqAgAADFaCAAReyAIAE6PwAgAKaFbCAADOJgIAAPI2A
Date: Thu, 26 Mar 2026 15:36:14 +0000
Message-ID:
 <TY3PR01MB11346593E45A6647797EB4DEE8656A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
 <20260320164158.487406-3-biju.das.jz@bp.renesas.com>
 <ab25E0kTBA4EjZ3Y@sobremesa>
 <TY3PR01MB11346F3DF5ACB55B5FE8DC96F864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346DD20F7E2AB23A54A274B864DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <acLFYNHPODCYArCk@sobremesa>
 <TY3PR01MB11346F913241559462D109F2D8656A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <acUfZmYoDA_ZKVBk@sobremesa>
In-Reply-To: <acUfZmYoDA_ZKVBk@sobremesa>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14713:EE_
x-ms-office365-filtering-correlation-id: 42177107-5bee-43e4-bff3-08de8b4d6a02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 1LpyMWJitcKnf9lFuJ3vFMvQxtT+gehpGcA3lW2N6BgKzRIxSeyGPUXSwHJBxRs3sx6knLoU3GR4fYnO1sGKwag5Ib8awqTtKdzUDLTXU79x/KYBZGSSiXO5ZwZJENGnXg2oSG5+nRJ3XP2x6ggfYplwnk9VKgVpkR0khuVO+DUFUCi7v1ND8MsHQ9SiArceEBX0RbH/cfaCX8envIf+MEzpQ79u1nCsmlZfmTViU9CDCy9gq0QaLG620DNddo8j8aoeHg1JzgL2lG/JkTbE2QkfK36zQGD9TAhHBWcOh2Hm3tYTofFePdcBJPe7ruIpNFyA1JzYLVQW9szZOpwXFkWgW93JeB6FNH+Cdl2cqcOAssUSrfIwGs7CCzJl+06IpPi1lrMiHPf4Zm4ttUdGCHSeQpr5sZF1NCLwmbqyhRXTSsJOqqFp9VaV3mjpCW2Yk6Zhi8X/itYw4FK7RAna/P3Qd1Qfm1wcHjdMAWa6rFMwrZwqj8e0zsONA2rE1J0pV7DKAmG1YJBdSx2Sm9upf4eJpRj1I2IyZpbhMk/NvLfs24KHc/Fs89dgPH1GmRBTCUHBJc2VnaK0NLi8k9zeH3C+DuDFwUVqxVm5apClHNMc90YNXLZ4CQhSCdFXltoSU+OKr74FqbREvwclBMVVG4gvPs9YNNBcP/7BJjXXRKyaSKcwovKh3u3LrnxTm5Tk+VPoazEnHG0rh8YdrMEnr8k8o5VxgYSVdTT18kRQXtyiDvh3TrzXDReO57+MXrFS9tmBGei4/spT1C+lM9y6ymyPdqQlNeLTYW0/4U3XGH0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGJ2TnJnME42T2V3T0Y0VHVlMlFGL3g1VzZPME9KcFNxeUVJcWNCTlljSlBI?=
 =?utf-8?B?bldlelBRcHdJRFFzUjlqYUozL1QvbEpnWnR1a25RM2EvQUhNSmd4ZXA0Z0ZD?=
 =?utf-8?B?U20wc0Z2U2JYQlM4VWZJTzY3V3Z5WFlabGJ1eHJKUVpxS3RnZUFuVUpJTkRk?=
 =?utf-8?B?YytMUFY1cngrb25BbU9sNUszZ1FacTlqRXhicmJkQWk4NUNvWWs0cFo3T2Vm?=
 =?utf-8?B?YUtFZ2ZybFoweVd5S1JrWjZWcDBQQU84T2dHdCtMK0FONzNWQnNjME03Yk5U?=
 =?utf-8?B?Tjl4M293WTVzaVJxN3pyU2M4MzNGeGVZMjVjVjd6bXVpL1BiRmRkY1BCWlk5?=
 =?utf-8?B?bWlRbVJHQ0IwUW1jNUZjOXUrVm1BM3RxdlZlQ1FCcWRuSXJ1T0o0ZE5OcERz?=
 =?utf-8?B?QmFENDBMaE1yeFN4RzRBMkthRjNhbmMwUGM5RSt2VExyaGRhWHc2SHNDd2JB?=
 =?utf-8?B?QTZXODR4N3M4OFVPSCtYeTZyb085TTZSRkdxcUlBRUpTdjB4U1RsakI3Rndk?=
 =?utf-8?B?dTZWOTMyQTl2OXdrWVlJMFlCQmZsQkoyR3lyeUN6UzAwT2VndkxrUGpGaUlY?=
 =?utf-8?B?VlNFVW4xNU5HUms2TDk5bkdtZG1LQU9CUHB1di9FeXRwZmNlbXhkVzRtY0pE?=
 =?utf-8?B?SXJQT0VBTW9SaWhkYzl1K1hmeWZkNituSW5kdkM5U0NtSmJlb0RoSkt5Zml2?=
 =?utf-8?B?LzVpZ1JYeHI1OE94aitxR1llWjFEVVRKYUc0RGNRMGxFcTYyVG9UQWE2Yi8x?=
 =?utf-8?B?eExvNVpqazQrd2R4bVlQUnEyNDZ3VEdGNENDdzEyeFU3UytaUzVPamNXZ1hE?=
 =?utf-8?B?MHB6d1ZvNTc3NGZsMDBHb3dFKzdwNjNMR2xPbFJDOHZJMloycGFLY3FoZ01G?=
 =?utf-8?B?YW12dFFBOURHYWlsYlQ4RGpMSk9LQkZrK2IzTzF6NHpJZ1ZBVUlwelNha1VP?=
 =?utf-8?B?OXJaQkFvbTBjQlJoZUh3VlV0bzVpNyt2OTlxUnM5TzViVXN3KzJzU2J3RDRN?=
 =?utf-8?B?b3V2emZUTFpTaUYwY2hzczB5S0RtdXorWXZtR1M2ZkhsQnNHZUlscVhYMGtK?=
 =?utf-8?B?S2R5b2JmelozVDEyN3JydG5semE4dzUxenBsczU5N05PTlgrVXZiMDFydkQz?=
 =?utf-8?B?aGFmTGFtVTVyalBnd21lSGNVSEppbmw3NCswa1hhYlNZU1d4dmJaTUtjNjlB?=
 =?utf-8?B?elZoZmFMU2UvNVlNWTJpVkxtVnh3NUhIZldQY1oyQnRkeTI2Z053RGNnOW0z?=
 =?utf-8?B?QldxWmY0M0p3ZEpQNWFvVEI3M2hucDVKVXZXRnNWSXZRZEdlcnNiNk9VczFU?=
 =?utf-8?B?b2RuZGRTYXVCaWhSMnQrQlM0V0I2QStaam8vZDNxZkF2N0NXM3I4Q3RYRGo1?=
 =?utf-8?B?d1laVU8zTUh6b1dyS3hYNnZlWW8wcU1sSDhsVUlBd3NJS2pSeHRNYlo5TWkw?=
 =?utf-8?B?d2lhYXY4VXd1b2U1Tk1OSjI1YTc4L0ZQM2lGZTcyckJOeERCTk9DZWdoRC91?=
 =?utf-8?B?VE1Tc2NwczYwZjdQODZNdHZEcnlWSFhOaFdsVkgzNzlOZkw3YnZGSTVQL1RI?=
 =?utf-8?B?THcxTkhranREem1acWM2dE92RlhybVNaV04zWUhxay9qeFo0VzFYYVZOOTZV?=
 =?utf-8?B?Uy9jRDZ4R0JoV3JCM1Bqc0t0Z2VoZ2tHcWhOWFc3czM0WWZaWGFxTmJCWU5l?=
 =?utf-8?B?LzFnV1VkSjZZdXkyNEkxL1Z4WEJKWk04RXU0a3dQRk5XR3ZzZzE0bXlmQXN1?=
 =?utf-8?B?QUFudTBsUjZHRlNpUWlyTDNDL29WcEV2dmU0R2Izc3dlUVF6S2Q3dlR3eTgv?=
 =?utf-8?B?bmpCZkYrU1VOSFBkNU1ReWlrVTViTnpERGdOSTkvcXl0U1dFT25UL2tJSWM1?=
 =?utf-8?B?MWVIdk41UDdoY04wMVluUlJBdDFQWk1zbjhoQkFrUW0wZ21XMVg5WnN5SllN?=
 =?utf-8?B?UW9TbmUyeURLVUFCLy9GdUxKQnhKeUszamdwK3lEUnFZREN1Y1JtbzMzU1BJ?=
 =?utf-8?B?eFhKQTNac29pL0NjNERsS3hMYkNuWWMrWFhQbXJiRGNSL2VUcGRUVUVTbk0w?=
 =?utf-8?B?L1hUTE1tOGlQNW8rUXluSTdKQkoxd25nTFdabGRoZVlGT1V2ZHBZcWZQazFD?=
 =?utf-8?B?elowRjFCZlJ4aVNQcE1oSDJhQ0MwWXliWmFxbVJSTWlGUWx0ZzAzV1FtdGtQ?=
 =?utf-8?B?K0h4WkF0emhrYzFkWDV0Ti93NHRuWWd0bDM3ZFk4S1hmOFM1dWc1V1pqTjJS?=
 =?utf-8?B?T05qaElXNWhqRmUxR1hsQmpzUUowVEFTQWwrQXA4OG8zZmt0d2lYaU9HWllw?=
 =?utf-8?B?U2syVGp0emk4akRTeFF0OHdkVW1KL1F2UnhERnRocWpwZGVNdHdUUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 42177107-5bee-43e4-bff3-08de8b4d6a02
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 15:36:14.0253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23M2g8gcQW5d+cCKmmv67VrrzEG1txcqej5NGAvEjSo66iK/l6XnxrQwLFRoRjz6Hyl46OYjSjKkGn63w02VVUYZ9QpyZOD7/nm5hcg2cRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14713
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30375-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,arm.com:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 85698337D17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQWRyaWFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGRyaS1k
ZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYg
T2YgQWRyacOhbiBMYXJ1bWJlDQo+IFNlbnQ6IDI2IE1hcmNoIDIwMjYgMTE6NTkNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAyLzRdIGRybS9wYW5mcm9zdDogRHJvcCByZWR1bmRhbnQgb3B0aW9u
YWwgY2xvY2sgY2hlY2tzIGluIHJ1bnRpbWUgUE0NCj4gDQo+IE9uIDI2LjAzLjIwMjYgMDg6NTUs
IEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIEFkcmlhbiwNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEFkcmnDoW4gTGFydW1iZSA8YWRyaWFuLmxhcnVt
YmVAY29sbGFib3JhLmNvbT4NCj4gPiA+IFNlbnQ6IDI0IE1hcmNoIDIwMjYgMTc6MTENCj4gPiA+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi80XSBkcm0vcGFuZnJvc3Q6IERyb3AgcmVkdW5kYW50
IG9wdGlvbmFsDQo+ID4gPiBjbG9jayBjaGVja3MgaW4gcnVudGltZSBQTQ0KPiA+ID4NCj4gPiA+
IE9uIDIxLjAzLjIwMjYgMTQ6MTYsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gPiBIaSBBZHJpw6Fu
IExhcnVtYmUsDQo+ID4gPiA+DQo+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiA+
ID4gPg0KPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gRnJv
bTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9u
DQo+ID4gPiA+ID4gQmVoYWxmIE9mIEJpanUgRGFzDQo+ID4gPiA+ID4gU2VudDogMjAgTWFyY2gg
MjAyNiAyMTozMg0KPiA+ID4gPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIgMi80XSBkcm0vcGFu
ZnJvc3Q6IERyb3AgcmVkdW5kYW50DQo+ID4gPiA+ID4gb3B0aW9uYWwgY2xvY2sgY2hlY2tzIGlu
IHJ1bnRpbWUgUE0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gPiBGcm9tOiBkcmktZGV2ZWwg
PGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24NCj4gPiA+ID4gPiA+
IEJlaGFsZiBPZiBBZHJpw6FuIExhcnVtYmUNCj4gPiA+ID4gPiA+IFNlbnQ6IDIwIE1hcmNoIDIw
MjYgMjE6MjANCj4gPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi80XSBkcm0vcGFu
ZnJvc3Q6IERyb3AgcmVkdW5kYW50DQo+ID4gPiA+ID4gPiBvcHRpb25hbCBjbG9jayBjaGVja3Mg
aW4gcnVudGltZSBQTQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEhpIEJpanUsDQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gT24gMjAuMDMuMjAyNiAxNjo0MSwgQmlqdSB3cm90ZToNCj4gPiA+
ID4gPiA+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBUaGUgY2xrX2VuYWJsZSgpIGFuZCBjbGtfZGlzYWJs
ZSgpIEFQSXMgYWxyZWFkeSBoYW5kbGUgTlVMTA0KPiA+ID4gPiA+ID4gPiBjbG9jayBwb2ludGVy
cyBncmFjZWZ1bGx5IOKAlCBjbGtfZW5hYmxlKCkgcmV0dXJucyAwIGFuZA0KPiA+ID4gPiA+ID4g
PiBjbGtfZGlzYWJsZSgpIHJldHVybnMgaW1tZWRpYXRlbHkgd2hlbiBwYXNzZWQgYSBOVUxMIG9y
DQo+ID4gPiA+ID4gPiA+IG9wdGlvbmFsIGNsb2NrLiBUaGUgZXhwbGljaXQgaWYNCj4gPiA+ID4g
PiA+ID4gKHBmZGV2LT5idXNfY2xvY2spIGd1YXJkcyBhcm91bmQgdGhlc2UgY2FsbHMgaW4gdGhl
IHJ1bnRpbWUNCj4gPiA+ID4gPiA+ID4gc3VzcGVuZC9yZXN1bWUgcGF0aHMgYXJlIHRoZXJlZm9y
ZSB1bm5lY2Vzc2FyeS4gUmVtb3ZlIHRoZW0gdG8gc2ltcGxpZnkgdGhlIGNvZGUuDQo+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPg0KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4g
PiB2MS0+djI6DQo+ID4gPiA+ID4gPiA+ICAqIENvbGxlY3RlZCB0YWcNCj4gPiA+ID4gPiA+ID4g
LS0tDQo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
aWNlLmMgfCAxMg0KPiA+ID4gPiA+ID4gPiArKysrLS0tLS0tLS0NCj4gPiA+ID4gPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2aWNlLmMNCj4gPiA+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZGV2aWNlLmMNCj4gPiA+ID4gPiA+ID4gaW5kZXggZGVkYzEzZTU2NjMxLi4w
MWU3MDJhMGIyZjAgMTAwNjQ0DQo+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYw0KPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMNCj4gPiA+ID4gPiA+ID4gQEAgLTQyOSwx
MSArNDI5LDkgQEAgc3RhdGljIGludCBwYW5mcm9zdF9kZXZpY2VfcnVudGltZV9yZXN1bWUoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KPiA+ID4gPiA+ID4gPiAgCQlpZiAocmV0KQ0KPiA+ID4gPiA+ID4g
PiAgCQkJZ290byBlcnJfY2xrOw0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAtCQlpZiAo
cGZkZXYtPmJ1c19jbG9jaykgew0KPiA+ID4gPiA+ID4gPiAtCQkJcmV0ID0gY2xrX2VuYWJsZShw
ZmRldi0+YnVzX2Nsb2NrKTsNCj4gPiA+ID4gPiA+ID4gLQkJCWlmIChyZXQpDQo+ID4gPiA+ID4g
PiA+IC0JCQkJZ290byBlcnJfYnVzX2NsazsNCj4gPiA+ID4gPiA+ID4gLQkJfQ0KPiA+ID4gPiA+
ID4gPiArCQlyZXQgPSBjbGtfZW5hYmxlKHBmZGV2LT5idXNfY2xvY2spOw0KPiA+ID4gPiA+ID4g
PiArCQlpZiAocmV0KQ0KPiA+ID4gPiA+ID4gPiArCQkJZ290byBlcnJfYnVzX2NsazsNCj4gPiA+
ID4gPiA+ID4gIAl9DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSXQgc2VlbXMgY2xrX3ByZXBh
cmVfZW5hYmxlKCkgY2FuIGFsc28gZGVhbCB3aXRoIE5VTEwgY2xvY2sNCj4gPiA+ID4gPiA+IGRl
dmljZSBwb2ludGVycyBncmFjZWZ1bGx5LCBzbyBtYXliZSB5b3UgY291bGQgYWxzbyBkbyBhd2F5
IHdpdGggcG9pbnRlciBjaGVja3MgaW4NCj4gcGFuZnJvc3RfY2xrX2luaXQ/DQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBUaGlzIGlzIHRoZSBvbmx5IGNoZWNrIGFuZCBubyBuZWVkIHRvIHByaW50IHJh
dGUgZm9yIG9wdGlvbmFsIGNsay4NCj4gPiA+ID4gPiBUaGF0IGlzIHRoZSByZWFzb24gSSBoYXZl
IG5vdCB0b3VjaGVkIHRoaXMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAJaWYgKHBmZGV2LT5idXNf
Y2xvY2spIHsNCj4gPiA+ID4gPiAJCXJhdGUgPSBjbGtfZ2V0X3JhdGUocGZkZXYtPmJ1c19jbG9j
ayk7DQo+ID4gPiA+ID4gCQlkZXZfaW5mbyhwZmRldi0+YmFzZS5kZXYsICJidXNfY2xvY2sgcmF0
ZSA9ICVsdVxuIiwgcmF0ZSk7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAJCWVyciA9IGNsa19wcmVw
YXJlX2VuYWJsZShwZmRldi0+YnVzX2Nsb2NrKTsNCj4gPiA+ID4gPiAJCWlmIChlcnIpDQo+ID4g
PiA+ID4gCQkJZ290byBkaXNhYmxlX2Nsb2NrOw0KPiA+ID4gPiA+IAl9DQo+ID4gPiA+DQo+ID4g
PiA+IFRoZSBhYm92ZSBibG9jayBpcyBnb29kIGZvciBvcHRpb25hbCBjbG9jay4NCj4gPiA+ID4N
Cj4gPiA+ID4gT3RoZXJ3aXNlLCB0aGVyZSB3aWxsIGJlIDIgY2hlY2tzIGZvciBvcHRpb25hbCBj
bGsuDQo+ID4gPiA+DQo+ID4gPiA+IE9uZSBoZXJlOg0KPiA+ID4gPg0KPiA+ID4gPiBpZiAocGZk
ZXYtPmJ1c19jbG9jaykgew0KPiA+ID4gPiAJcmF0ZSA9IGNsa19nZXRfcmF0ZShwZmRldi0+YnVz
X2Nsb2NrKTsNCj4gPiA+ID4gCWRldl9pbmZvKHBmZGV2LT5iYXNlLmRldiwgImJ1c19jbG9jayBy
YXRlID0gJWx1XG4iLCByYXRlKTsgfQ0KPiA+ID4gPg0KPiA+ID4gPiBhbmQgb25lIGluc2lkZSB0
aGUgY2xrX3ByZXBhcmVfZW5hYmxlKCk6DQo+ID4gPiA+DQo+ID4gPiA+IGVyciA9IGNsa19wcmVw
YXJlX2VuYWJsZShwZmRldi0+YnVzX2Nsb2NrKTsNCj4gPiA+ID4NCj4gPiA+ID4gUGxlYXNlIGxl
dCBtZSBrbm93IHlvdXIgdGhvdWdodHMuDQo+ID4gPg0KPiA+ID4gWW91J3JlIHJpZ2h0LCBpdCdz
IHByb2JhYmx5IGJlc3QgdG8gbGVhdmUgaXQgdGhlIHdheSBpdCBpcy4NCj4gPg0KPiA+IElmIHlv
dSBhcmUgaGFwcHkgd2l0aCB0aGUgc2VyaWVzLCBjYW4geW91IHBsZWFzZSBtZXJnZSBpdD8NCj4g
DQo+IFdpbGwgZG8sIEknbGwgYWRkIG15IFJiJ3MgYW5kIGxldCB5b3Uga25vdyB3aGVuIGl0J3Mg
bWVyZ2VkLg0KDQpUaGFuayB5b3UsDQoNCkJpanUNCg==

