Return-Path: <linux-renesas-soc+bounces-31440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKpVLSuX5mmzygEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 23:14:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 306B5433E83
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 23:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FD153003432
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 21:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2885239F196;
	Mon, 20 Apr 2026 21:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ltir4qsg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39038836A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 21:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776719654; cv=fail; b=VSe8V+YYmF1l+tfRjECxkm3YSW1AnBLjSEpgtHbN/Fj/6647RXGQQ8Tj0kzdvUiKxBuBZfDo/Emn9OgJbGlcUu9z8INt48My87S+5CUQzNFl6mTb3T1OLiiwFWz3jLbINHoZhtgazjNJxMmp9Kf0vPjuIUVJYEREliqn+US2V+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776719654; c=relaxed/simple;
	bh=JOdeLmwD342cDeVNuc8v2ygUz/lXc4J9knB6PGfpegw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cj1iNcQ0PvsgBC2N1bxPWdsmHpocOh5mKuzPWJdBFWiF2oDdkLNUNPMFKLf6nyhl2z6NmvWq+8YopnFRL1r5ZVu8OsbU1ak99Md776ORFhKCu7o3k9kTBxcp54ZB363Ieyp4IkFGuFDNY9GQMd4ywa+dOv3sp6iNnI/wfDnR2Dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ltir4qsg; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIBkV9I1eAkcMaWMdwovX4PM9E+uOH9VQveGhc2FAmMHufeGh7sr8JTQZpNU8uS+o+43n1nqqynpUDd05BBVlMDtF4n6M+53EYE7p2ufysKPLcbifzofP+fWEkKhtkAzVD1Cn4OuBcrZEWE8+cWlgBb8YmgZmwUq3xEUgioL7WIPO/5WGZoVflO5G2pg5bkDvvtD99S5HK5DwVD9HogKNKOORD36NXqOFpN2uKlOmcbY8vUpwi7L/RM61U0dhqO4RNoH+cDFV9pbFe47U0ZKThCsjFuVmoqIm6g/mvQabWN98/FRmtvTWDYB42w5Lk0sODTYSzm+4/mGHPQFscuKjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOdeLmwD342cDeVNuc8v2ygUz/lXc4J9knB6PGfpegw=;
 b=c9HHl/TFrkUbLM3EJE47dzkZTEF4Ed4xzuwYDjMnMPIYS1tNWuWnU6ICMKJvszOTYDvqLju7IVw36QbRQjBTG4E9wWLyFMIo0NcPaUvIDz0Tp6lZGgWm0gZS9T7TShZpHMnvBoIUNi/rVi1EEP2+e+0Ir3GfoNHi4TRuEHbWb4NV+PbJ36ezfPqX+l2Y/As+ItoI1d0ZlwjB0vLwiQz08acJ3Rut+bYsab8JKpYQnHzxKRDQ9Fd/Clk4NnZuqMosOn9YRXTcsU+jlSd78kaj47JNSOMAS0hZ6uBpB8PJElXu+k2FslJZYsoAMAr6N2Kc0SXru8bzFdwW4kqUsyrOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOdeLmwD342cDeVNuc8v2ygUz/lXc4J9knB6PGfpegw=;
 b=Ltir4qsgAVx3TTpkD/sb1QtMdMLtGp0/AiAvibUnozfALu9GVersvYzEGZ/x10sxEsXTocDRcaBOMqsNa9ntveTa4klMQMPiI7OD4zLIOYgGOr6GQrtv2kQ+Q6/KoRpFveoZKhHUp9WSTX33gP1mZS0fP5WI1sc8/qLY720dadw=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TYYPR01MB10611.jpnprd01.prod.outlook.com (2603:1096:400:30b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:14:09 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%4]) with mapi id 15.20.9818.033; Mon, 20 Apr 2026
 21:14:09 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Pavel Machek <pavel@nabladev.com>, Hugo
 Villeneuve <hugo@hugovil.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm: renesas: rz-du: mipi_dsi: Fix return path on error
Thread-Topic: [PATCH] drm: renesas: rz-du: mipi_dsi: Fix return path on error
Thread-Index: AQHcznLuB+8+YFONMkeG/G/+SBPB87XnlqUAgADe/aA=
Date: Mon, 20 Apr 2026 21:14:09 +0000
Message-ID:
 <OS3PR01MB83197FBDFCDECBA1220BF52B8A2F2@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20260417140231.3972749-1-chris.brandt@renesas.com>
 <CAMuHMdUVCtzxumM6yniuGTKfqG_z6BuySHNcZYE9UHP5AuDoLw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUVCtzxumM6yniuGTKfqG_z6BuySHNcZYE9UHP5AuDoLw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TYYPR01MB10611:EE_
x-ms-office365-filtering-correlation-id: 8e238aeb-7b20-4d7c-162e-08de9f21c340
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 nhFXE4dEBIR3G4N0u2fns52eV60ayf7Ymix/xd6mL0PhLGctJ+KtzRD7Jy2ZOipSg4iPU1mZnkdCTKMuBgYu1lYy8hWi+D+CPAIo4eFBX9NbDZ4IDgdsdH2kQSdZjyGZi8l6+RwqU7WAV9E8E0ab3XRpjJkLa7bIm99w+7FLOoe7VG9NN33L1gOZHYHPlP+ICRuJb4AslNsYmNhQZeA4rTQBjwGkcpyJNEJaFeYvn1UVEpvHfqD5lSax8PvmB0AQ2Uc3yBcxSw5PTOJGgNA4kwggN000cz0TOSAa0IEv/WjUb9KRUEXE4tFxE601Ny5yNFGuKg3p9PWdMyAUhD46IwbHqO1kbph0Is7R92SHddDRV2v+Sc/U7N4vfYQqLWzXOVTBR0OzeC1W+bpQ4jSC8T1zAqB8JMw28dbZyncQKm1ZjyNFtcQGsx7EmojZILUVYGNdrDlFd1tfUqQnRdReDC4jRtumuzXW3VkW+msuLpstYhS6sOIbWOVOqsU+nXkSQi7HydXMd9814dfYCa6lNXDE733Am4VtRqoMxGIiDwgVFOfo57U1bPNpTxAnGXVi+83GuMvkUWTZIVNtKFEKn8Na0NZwlTEv71U4S3OyLhl03nOeBvGeGKEBHJdYSWgsu4h7OtomrbLGLSrjsDWhqAuYfB1j/r2DtJQdyxqsfp+cQRkBwlETvXJbmHKGZ0SikuV38jMDcNHeNKgvLtHkJPOSXc3y6uzZ2UDrnGpw+bJHDJll6YnbZvWfjXqqNJzLjsuWScDaUgBAYRQlWUVKdrJQPMraKSOKahKAkgf24ew=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8319.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UXpTaXcyUkFYMTJYazRoY091ankxTlR6MWNhdnMyWHpLcEpSVGcwMFh6N1l1?=
 =?utf-8?B?cmdxYzlMeDFoNlR5WndzMEk3Y2ZCblZrRXBoWXYzQ051YTBacjlJMGkwNnp0?=
 =?utf-8?B?ZFA1YkFvaytIWUNWVEg2MTl4RnVtMC9JU29YQ1dxZFEyYy91T05DMlE1U0ls?=
 =?utf-8?B?d2FJS0Y3aUlYK2hoczlLTTVHWUZZN0hsK3dVbGlpZ20zdCs0ODNIRXdERnd0?=
 =?utf-8?B?V2xQUmRHRS83THZiWFR5THdDb2FMSktUMnRsREJnbmUvZEhHZXJEbjBTSmFl?=
 =?utf-8?B?alJOWjFSSjRFZVN5TUdFUDMxTGVJa3BNVlFVa0R4WCszQ1NaaEV0ZnZGRnlM?=
 =?utf-8?B?N0xBVSs5Z056QTlTU3c4U2xqZFdvQjdkTlp3aVVPNkliVnFIRjNRclIwSUdI?=
 =?utf-8?B?azAxd3N1YUgvTnIxS0R0TjVZWjJ6d3p3Q2VVRUxaaVVGQWppcWZoMGZ2SG1T?=
 =?utf-8?B?RUdtMlN6TDh2ZHU2bW9kVTQvV3FES1R0Rk5zNmY2amZUMG9EbDNJa29JeTBj?=
 =?utf-8?B?NU50QWNmVG5XVzJvRnNtMnlXTU1LUXNRM2Y2Tzh0Q3NrME1aS3Bkd3NZenk3?=
 =?utf-8?B?RVhyMDQ0MWJsM3orbHdYNWhOLzdsK3hlazZibnhlcURWRWhXRmM2U0JyVllW?=
 =?utf-8?B?c0lMY2RBdWwvVENiY3BOL3lSWkVacmlxNjZKTTFTcThWM0FQN3pOZnpGT1pO?=
 =?utf-8?B?VEpqR3daZkU0b1dPdE9Ba2lNb3I5TnNOZVljTnFEQ2k3TjhPbzRWdmlPT3pu?=
 =?utf-8?B?Ulc3SVliWkp3cFA0RThIOEJ5cUJyZXp5QnBQamJCWUpPczV6M3VhTzZsVjJ5?=
 =?utf-8?B?S243VjRPL3J0Tnk4Y0pNTXI3aFo2amJpbU9HN3Qvc0VOT1ZFV0hUMDVhbmR2?=
 =?utf-8?B?azhBL3A1OExqVDNyUVN4SnpaeVg4OXBBSlp4YmZtMjNGSnpnZDhPc3VCb2hk?=
 =?utf-8?B?cU91bm0xN21nbkhGcjNuK1NkWlpwNGluWURnWkx3Tis4U1VUVVkvazRvam5Q?=
 =?utf-8?B?ZkNjOCtkU01hcG5zZjM3ajZod2J4ZXEwUlAvejhrK2hOYjl1b2lzc0pYRUVG?=
 =?utf-8?B?SCtmM0xPQmtGT3ZQYkJxVjh1SmZzU1pTaENmZmlXNnVIcjYySlgwbmhiL3dD?=
 =?utf-8?B?UXRrcG1uU0Z3V0Fham9qdXZackRoTlR1WGszVWtZS21jdEl6RUdONUd5cEJZ?=
 =?utf-8?B?dFZ2aHFPYWs0cFFSbXBFT3poMGNzV3hkYjliaUxjcmtEMXNZZ0I5c2szWkV6?=
 =?utf-8?B?MEJCOTk5Yk5aSEJqWHhIZGxxTCtLbFdXZlNzM20wVWdRcENVK2tPQVlwYXlD?=
 =?utf-8?B?QzA4Zm00RGI0N1B1S3VEaXAvazVSbFh2ZzdtcWJvVlpxUWxxKzZGQ1RURlNI?=
 =?utf-8?B?UFBIRVhZNVRVWGJVYTcvMGpDbTVHMDVzWDB6N1d3Z2VDUzQwVmlYd3h0ekx4?=
 =?utf-8?B?Y2Z0eXlIQ2JiejhoVEhXaFdZMi9WYXJrL3NET1JKSkt1Wm9TSDVkNVNtQ2JQ?=
 =?utf-8?B?Slk5dzVQNFdudkdHYjg3aC9Zdy91RzhzaHVBQyt5RUgvK0xoV1VBL0pzUWFi?=
 =?utf-8?B?eDNwN2o2WlZqTUE4SUVCZ2hJYTZNcmQra3k1TFkxMy9GUk4yTncycnNKYjVo?=
 =?utf-8?B?Umg5L3lhMzdHV0o0VkdIQTRiSHpUcW5KUW4yZ0JpNUxkazNuM012TkhJTEhV?=
 =?utf-8?B?ci9RTWliWHZ2WWtDeWFLNitrbG1hUWFkL2ZlcUFXMGZSa2w2Y3orb0Z5ZmNh?=
 =?utf-8?B?dXNLMDhMNWpaTW5mYnI0bCs0TDF4K0JkZE9HaUFKTzI5eGFBekMzN2NSVHln?=
 =?utf-8?B?aDJRMlVZN1d4TjV4OVQ0dGgxZTY4L2FyUFZ0Y25malBwYjBqQU5kQnhPYUhH?=
 =?utf-8?B?ZmZvakpEKzNOT0dkTCthdkpVQWwxTWsyUGVKR1NwK0JmZkdhblhHR25CdlEx?=
 =?utf-8?B?UHJ6ZWdFRnI2ZS9XY2JRNWdmZnNQaWxtRVluWS9PQ0syZFNQcGxmeTVTZnJn?=
 =?utf-8?B?MGF6R2VJQ24yU244dWFsc0RjK3Y2eVJYUXR1WlNlQkgweWZaM2lRbzRlTG42?=
 =?utf-8?B?NEJTVUpSU093ZFllUTFPNG5YaFIvc01yQTRkcURuYy85djFNSzUyYi8xeEhh?=
 =?utf-8?B?QjZjdzRzV3R0M2YwYTlVRzVCdysyOXVBLzl0b3JJUDFPQ2ZIQkkxa0gyVEtF?=
 =?utf-8?B?bTZNSFlnczluLzJFQ0t0T09iMHpVc3o1LzEweXhIc3F3czNnRU5LeVRlUTV3?=
 =?utf-8?B?cTBHVEpBWUpRU3VsK29VM3ZYZDVDTHdoWUV1dFJDZ0J1eHNDUGtVT3dpWGZY?=
 =?utf-8?B?SVpCeGZoOWdjUk5YYm96RndReVJWUzRYdGxsb2NNYmVRME5vdm1WQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e238aeb-7b20-4d7c-162e-08de9f21c340
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 21:14:09.1087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6oCWzc5KrWNbal8JKuqNAA6JlrrxsSihpJPVjdUpuG2iY4E/6O0CrArzkA4yKNtaGqBxETCQsxPkD8DgEx7KJjsJUrMYGtPsqqSPbCnKuyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10611
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31440-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,nabladev.com,hugovil.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Chris.Brandt@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:dkim,OS3PR01MB8319.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 306B5433E83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCk9uIE1vbiwgQXByIDIwLCAyMDI2IDM6NDYgQU0sIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToNCg0KPiA+IC0gICAgICAgaWYgKCFkc2ktPmRjc19idWZfdmlydCkNCj4gPiAt
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKyAgICAgICBpZiAoIWRzaS0+ZGNz
X2J1Zl92aXJ0KSB7DQo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07DQo+ID4gKyAg
ICAgICAgICAgICAgIGdvdG8gZXJyX3BtX2Rpc2FibGU7DQo+IA0KPiBTaG91bGRuJ3QgeW91IGNh
bGwgbWlwaV9kc2lfaG9zdF91bnJlZ2lzdGVyKCZkc2ktPmhvc3QpIGZpcnN0Pw0KDQpHb29kIHBv
aW50Lg0KDQpTaW5jZSBpdCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgLXdoZW4tIHRoYXQgbWVtb3J5
IGlzIGFsbG9jYXRlZCBpbiBwcm9iZSwgbWF5YmUgSSdsbCBqdXN0IGtlZXAgdGhlIG9yaWdpbmFs
IGxpbmVzLCBqdXN0IG1vdmUgdGhlbSBlYXJsaWVyIGluIHRoZSBmdW5jdGlvbiB3aGVuIGFsbCB0
aGUgb3RoZXIgcmVzb3VyY2VzIGFyZSBiZWluZyBhbGxvY2F0ZWQgdXNpbmcgZGV2bV94eHguDQoN
ClRoZW4gSSBkb24ndCBoYXZlIHRvIHdvcnJ5IGFib3V0IHRoZSBpdCBhbnltb3JlLg0KDQpUaGFu
a3MsDQpDaHJpcw0KDQo=

