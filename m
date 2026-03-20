Return-Path: <linux-renesas-soc+bounces-30018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLjOAvE+vWmJ8AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 13:34:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B42DA559
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 13:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB34E3050236
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 12:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163493A7584;
	Fri, 20 Mar 2026 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Q4y/Th+f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011027.outbound.protection.outlook.com [40.107.74.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90DF3A7F4C;
	Fri, 20 Mar 2026 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009826; cv=fail; b=uMwpnWy9HCYj4ePCftvdLR2XIF6ssmWeKEPRAPJ9646uoFAfejhSujwz3Cd3DHg703XsPobpFOMlSMSwW+TJ/pNXpOLLL7megPt6JCfw4u30/4//9iKCXAITXnCaTMWkl50kA7i2O0suhVEZiInc1x5MNORqtaOgnqPXiEgbCmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009826; c=relaxed/simple;
	bh=Fcc2s14bHx3riMb1rHnhjdSCPD0hI7ThlsRpQsOf7J8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pm4turnCU9RguMbPZB1Iy5x+bwcy0C7qLZRLWBcuw2/Dn3WRBofORu7NVD9tmoES41r6n3xr84ugEmRX7cSPM+HV56806PQ7E2vDgQjTQapc7LNXt1TQYuPQD/F5REKkQT8yOj0dfsorrT1QZuONcoOPMAORqVB2YyNlSKnFpc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Q4y/Th+f; arc=fail smtp.client-ip=40.107.74.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Db62YhZRKylWag7qkC90Is9kVAb26Rwdxf5hobdMroJ8cQSRBnKKQ/ZjIy6oibzFMiyoHBJZHXmOWXXFi3UAQYoF+BGoFNwSnoF94rcKZnUpMYgwBWgA7+zBnj1vdNwlLImU2LxL06Toyyw8CJPihKGoh54qTbn6eFVI7XyovvhTPjJ5cRE58pxGV8URQLYr4MfVZ93ZY43Z+hyVKDdukFs8nsGRSy6zRPnbsz85MHGjtvGRQ/A92mozEU4zQi5Vw+it5jiXfsf7dz3ZBOyIfP7EM87Pvw3d/Igs7AAeTzMGMGaLUboMhmB40JWqiwx7fqh+wDJtFgSWg+6WOhC8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fcc2s14bHx3riMb1rHnhjdSCPD0hI7ThlsRpQsOf7J8=;
 b=jHkb3FHf52eh21Q/VyyXpgVo6d30AOnnLZ46guZqDhBE3yLvIFdAdLpzGUE7pC4s+DBEJCYGzXEq+/Qz09url9FhJkDGv+SRiS1Vwqyc0TBlfs64Yc0ctgS4fqpiVxH0gFjExAEdNJ+CqAg/5G3C0VpxDvZNywkg6qYGFaD742nnzX6UE/UicgkMouxQxvOnCNGRqPspVMFf5MDKaDkynNNnZHNolq7eHAbNm0hFiR+pWDg82Wz7tbP7hksthlGH26w46X1WJUTxGnm+ZeAfZ/Jmzx/xGWw99ScMBwP96UcyPtSLV1HjCmsjLjI5FzIc2KGgX8BOyMaezUKTIODgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fcc2s14bHx3riMb1rHnhjdSCPD0hI7ThlsRpQsOf7J8=;
 b=Q4y/Th+fdw9NPZWh1gyFTItQtpOQXyHP9Of8f6zdsdT28Fkjha02QzhPulvTT4FZo8G37drPHrbUTvwxAkwmyF1gnKtSR9+nVcQteZy0qJLpVGdXDJNBbcL4R6gJswrzHYt/i4kqCLi+GLkzNqFB5wyi0uD3gNdGx+7IdARjafc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14072.jpnprd01.prod.outlook.com (2603:1096:405:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.22; Fri, 20 Mar
 2026 12:30:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.019; Fri, 20 Mar 2026
 12:30:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Steven Price <steven.price@arm.com>, biju.das.au <biju.das.au@gmail.com>,
	Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
	<robh@kernel.org>, =?utf-8?B?QWRyacOhbiBMYXJ1bWJl?=
	<adrian.larumbe@collabora.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/4] drm/panfrost: Add bus_ace optional clock support for
 RZ/G2L
Thread-Topic: [PATCH 3/4] drm/panfrost: Add bus_ace optional clock support for
 RZ/G2L
Thread-Index: AQHcq92k/1VxcJ9aRUiG/uCa1TcGtLW3buOAgAACMaA=
Date: Fri, 20 Mar 2026 12:30:15 +0000
Message-ID:
 <TY3PR01MB113464CA1B37A735E020B7D82864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
 <20260304134845.267030-4-biju.das.jz@bp.renesas.com>
 <5bb58801-2851-4c7b-a8f0-d4b3cc2db474@arm.com>
In-Reply-To: <5bb58801-2851-4c7b-a8f0-d4b3cc2db474@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14072:EE_
x-ms-office365-filtering-correlation-id: 9b7efbb8-3ce9-4fef-03ae-08de867c70a4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 aVyFEUUue1kFMJi5AiUxHboDi0zopPJ2n9iW97On3mXz61Nhu/NC0whNY+BuyGOSSlpaOmN9GlItu5cPCRhJnaLT5anWgpf5hrhkHa5doAokZTOniHsRNg+DsV3QSgkdGcZEa6FWtiJ+nGOyNNSysACS0kQeJgIcBfTjDdIBgwVzQ9PkOIKyxIfi6EbCsgL725y+erYd9zoPHko5vgWXi4f21fznrHQosJZZiiMlxZvTOvuJdzPRTrYUXB451vAE7slsUaRSAAxf6w6quwuBWVw+S0MFUukkGgMzwIZ+NN+ZjiVhm447ilTxHHM20ro/UAJKWjaJMAuJEZ5X4pmMKhpfMV1wOfeYsu1DnciEGPawcoAjv/m5mFVR+PY4kF4Pdt/atRhi9MYWQ25Tgrge50JPEsRmzgNisvXF3IRSfUFvqyKrCESlJdgbAp6RQjBaQmPeQH9u/SuMumpBxdG60f3RPGEvHolso/z6FUyvKVDGLUJ7o2mLYu279W2SPstaAVSKJ9VrEA8Pd0tmw5CicnOW/W/lDVSaoqBgVcUYPHm6VWSAloMsp1ttseA7aknHAqh6HIuGw0sN+o03AYUm7DFiWq7VBB+GN35qO5zSxciByOK6xdrDzFIN9VeJJ02Ff/zMOXJjpMdpnANJLdz4z4L0ILEWjflt9H5qvVdAdCHlZ6ix7eEsFaPOMNxqat/8+C9317Aqxs76SJOYFWdf/jffmqHj8JgkBJ0AU4hEoV0+UTthcx0LTktUpd/KixWgv854p2rmBtxHQafbmq3Rx+FfJLd2cKn27hVyyRJLea3sKTECpcZOjiDn15T82eCl
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEFYSC9ZOFJLbktqaHhWRjFpMUhxUGEwaEtZQjVCZWZzbG94TmlqSmVkdXUr?=
 =?utf-8?B?MzMrQVlTenBZd0lTbm1MN0pVYld1TFdSVkZrck5Tb1k2OUNkTUJwNlJxbGgv?=
 =?utf-8?B?MWRVcHRmN2s3TmJhR01UZzliRmpGVjRsN3EyMUp6QzZZRXZSYzlHWEVZVmJx?=
 =?utf-8?B?SlRPemhVaUE5cGxBQWp4bi9ZQk5sNURhRjJBbDBOY3ZTenNKbWlJMFJPaTFT?=
 =?utf-8?B?amVaNVMwYm1ZK3FvQXRBQUJ1bjlmZU0rZjMxdEtNUWNJYlZiamgxcXl5dzJG?=
 =?utf-8?B?NHRJWWpSYk5PZjJzWXdrTkJHS0pXR3hnR1RmaVVzS0E1Q09NWnZUS25teURL?=
 =?utf-8?B?OTJmTFJGOGtLcjFrTVpLYkl0K0psam5yVlN3K1NoZWt5Y2tPYkp3cHZOb2do?=
 =?utf-8?B?ZVptOHhkb1JNbFZlWXVTWk5ZQUYwZE5iWU1HU1JhMGVmY1RZTXRjMWlDQkNL?=
 =?utf-8?B?OHVBSEs1OEJwUWdlVGpILzFvZlNxNTB0akhYY0xEMmUzWGJZTTJ4dithMGIv?=
 =?utf-8?B?VDlFU3FmdWZQWkNpVHExQlNxbDJ3NXFyUFBCVDRxb3Zud0dXMlRLVCsvWGF4?=
 =?utf-8?B?M1JxQVZNVk5ZRWYyeTdmRHNxMitsSnk2ZnN5V2RaVGxDRXFuNjUxc085NjBy?=
 =?utf-8?B?WjZzbDFPY1prYjhWNER5ZnBLNlduK2FIRVVpNkw4dGFLNDEvbHlHZDIvNUNW?=
 =?utf-8?B?d2twbFFIdUpubElxUkFUZXYwVGZtSm9QVzRRcm5IUHYvTDlheFBHRGdJQ0ln?=
 =?utf-8?B?VW1aejk2YnorMU5ZRCtVM2ZWRjhnNVRTUVkzL3JRQndRamdRbkdCNm1Da2FE?=
 =?utf-8?B?Mm1JT3FENGZmY1Q5QkZQYlE1cjZxMm9BQk40MTZ1Um43QVNkNkRxMU16M2tl?=
 =?utf-8?B?OGFMbkxqME1MeDBaSGdBSUdaZW1nS0szMDdPczFPcFdEa0EyU01GS1AyK3lT?=
 =?utf-8?B?Ky8yaXJVQ2luREN5QkF0TCtOWHFsOUVPMEtMQVFHWWZmck1rVTBraDIzV0dI?=
 =?utf-8?B?cWVhNDBoVGpwanVnTWVMYnVYWjRyM1JyckxBRmVxczhJVFVCaFV5RnRQNFFk?=
 =?utf-8?B?Z1VLK0Fic3ZMSlpkWVp3K0hVZDNybExDeVBBM1dxVlRwTmNNQ2lUcm9RcDNy?=
 =?utf-8?B?aU4yUlNVTzdtM0lKeDFBSUQyMlg3ZHhVVmxZcC9Id2dRSkM2QU5rdlFlRkRG?=
 =?utf-8?B?VHlCeGM1RklhYnZoRGpRaXQrbnhNbHpKaHliZm1kWWYwZEU3R1RwZDljRjlG?=
 =?utf-8?B?TkdXdGZPT3B2WlJOek5kakZDdTcwaFBCQThVUUxTUjZXT0FITTFuMS9nQ2pD?=
 =?utf-8?B?bGZ2c3hWQ1kycGxsVFFvTUNqMGdRdEw3NkxBak02ZHA1dXRHVVZoL2d2V1VB?=
 =?utf-8?B?a3p3MktWQmsvMGJLejhlM2VrLzNpL25oNXV5YWN4ZngyaXNUYkt1L2txN1dH?=
 =?utf-8?B?SU0yNGFNTVR4UlhhK21HN1U2Q0RpVUFSaU5KY0dnTHFneGJMczlrV1E0Ymox?=
 =?utf-8?B?UzVLVmxVNXpoRTFLSTFCcTRoQ1dOYVQvMlp0eG9BcGdSUWtwT2cvUk1raGhu?=
 =?utf-8?B?ak9KWURSTmI0YmQ5b1FicTAvZXpuVlVGNXRMT1ZYajVMRGxjV2RXTjQ2UWxI?=
 =?utf-8?B?c2pONk9DbFdCVEErOTZzMmFYUi84MytYM0gwaVV6S3FEVmtWdkVCMHA4b0ww?=
 =?utf-8?B?V3FXaE9EckxjN2dRRUlVOFEreWFOOEppSGp2bjl1YWxibHZjcjRmZXRzMFRu?=
 =?utf-8?B?cGRKUjNCVzJqeUQvdS9pS3VDTXhTMVhXU1lRUnlYYWdqenFJeFNVZytuT3RF?=
 =?utf-8?B?SjFKdHAwNXVQKzRsWEpTTiszNGxOdC9OT3d6ZGlIaWJwMXZXRzVtSUNZNElj?=
 =?utf-8?B?ZFVXL2NrNEM2SXJteXBYbVpoTm52czRBYnM2TkNHd0lEVVVLSkhaRGloekZZ?=
 =?utf-8?B?S2U1K1JEVThQOThpeXMraDMvNHFjTmZLS0VCeDczUUJVdXRZbGxjVWg4RlRh?=
 =?utf-8?B?N1QxdjJ2ZnFpMEhLMGljendJR1BtYUsrWm1CODJEc3dFeWU4byswOWQ4ZklR?=
 =?utf-8?B?VXdrYjl2b1pvU0dEd241TGYrZkorVUdiVm9uZjlCTEJMV0VKbjBoekU3amZa?=
 =?utf-8?B?Q0dyQVZ4K3k3blMxV0k5WjMrK0xFamJobzN1QUxKVWc3OHV0V2tyci9RZVUw?=
 =?utf-8?B?OWVScVFJZmNCTFh6dTZhMkZXOFV4Y2cxUlVTWDc3RGlvY2JQaTc0NVVTMWZm?=
 =?utf-8?B?SWozTjdNREFnK0d4aGdrYW5QQkVVdS9kTmRRSjZvWTNxcFRETjZhOXlBYzZE?=
 =?utf-8?B?ZnRBdmJvWm5IeGZKQ2xiYm5Ya1d5Slg3MTNRNVNYSFQ1dXhNOU5GUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7efbb8-3ce9-4fef-03ae-08de867c70a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 12:30:15.6863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xU+yx2RFgkPIQLsN9pZhttgmWN85CyPuxUdlBgeGLfC0MNQTxjT21xCtYpttpdHcEXRUr9nYP/ZFuhHSK7bkzwn3oGFw7kYFECDVaf7yUlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14072
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30018-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,gmail.com,collabora.com,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.918];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6C3B42DA559
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgU3RldmVuIFByaWNlLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBh
cm0uY29tPg0KPiBTZW50OiAyMCBNYXJjaCAyMDI2IDEyOjE2DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMy80XSBkcm0vcGFuZnJvc3Q6IEFkZCBidXNfYWNlIG9wdGlvbmFsIGNsb2NrIHN1cHBvcnQg
Zm9yIFJaL0cyTA0KPiANCj4gT24gMDQvMDMvMjAyNiAxMzo0OCwgQmlqdSB3cm90ZToNCj4gPiBG
cm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBPbiBS
Wi9HMkwgU29DcywgdGhlIEdQVSBNTVUgcmVxdWlyZXMgYSBidXNfYWNlIGNsb2NrIHRvIG9wZXJh
dGUgY29ycmVjdGx5Lg0KPiA+IFdpdGhvdXQgaXQsIHVuYmluZC9iaW5kIGN5Y2xlcyBsZWF2ZSB0
aGUgR1BVIG5vbi1vcGVyYXRpb25hbCwNCj4gPiBtYW5pZmVzdGluZyBhcyBhbiBBU19BQ1RJVkUg
Yml0IHN0dWNrIGFuZCBhIHNvZnQgcmVzZXQgdGltZW91dCBmYWxsaW5nDQo+ID4gYmFjayB0byBo
YXJkIHJlc2V0LiBBZGQgYnVzX2FjZV9jbG9jayBhcyBhbiBvcHRpb25hbCBjbG9jaywgd2lyaW5n
IGl0DQo+ID4gaW50byBpbml0L2ZpbmksIGFuZCB0aGUgcnVudGltZSBzdXNwZW5kL3Jlc3VtZSBw
YXRocyBhbG9uZ3NpZGUgdGhlDQo+ID4gZXhpc3Rpbmcgb3B0aW9uYWwgYnVzX2Nsb2NrLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNl
LmMgfCAyNA0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysgIGRyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZpY2UuaCB8DQo+ID4gMSArDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
MjUgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2RldmljZS5jDQo+ID4gaW5kZXggMDFlNzAyYTBiMmYwLi44N2RhZTBlZDc0OGEg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rldmlj
ZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5j
DQo+ID4gQEAgLTcwLDggKzcwLDIzIEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfY2xrX2luaXQoc3Ry
dWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpDQo+ID4gIAkJCWdvdG8gZGlzYWJsZV9jbG9jazsN
Cj4gPiAgCX0NCj4gPg0KPiA+ICsJcGZkZXYtPmJ1c19hY2VfY2xvY2sgPSBkZXZtX2Nsa19nZXRf
b3B0aW9uYWwocGZkZXYtPmJhc2UuZGV2LCAiYnVzX2FjZSIpOw0KPiA+ICsJaWYgKElTX0VSUihw
ZmRldi0+YnVzX2FjZV9jbG9jaykpIHsNCj4gPiArCQllcnIgPSBQVFJfRVJSKHBmZGV2LT5idXNf
YWNlX2Nsb2NrKTsNCj4gPiArCQlkZXZfZXJyKHBmZGV2LT5iYXNlLmRldiwgImdldCBidXNfYWNl
X2Nsb2NrIGZhaWxlZCAlbGRcbiIsDQo+ID4gKwkJCVBUUl9FUlIocGZkZXYtPmJ1c19hY2VfY2xv
Y2spKTsNCj4gPiArCQllcnIgPSBQVFJfRVJSKHBmZGV2LT5idXNfYWNlX2Nsb2NrKTsNCj4gDQo+
IFlvdSd2ZSBhc3NpZ25lZCBlcnIgdHdpY2UgKHdpdGggdGhlIHNhbWUgdmFsdWUpLCBhbmQgeW91
IGNhbiBzaW1wbGlmeSB0aGUgZGV2X2VycigpIGxpbmUgYnkgdXNpbmcgZXJyDQoNCk9vcHMsIGZv
cmdvdCB0byB0YWtlIG91dCB0aGUgYm90dG9tIGFzc2lnbm1lbnQuDQoNCj4gcmF0aGVyIHRoYW4g
dGhlIHNhbWUgUFRSX0VSUigpIGV4cHJlc3Npb24gYWdhaW4uDQoNCkkgZ2V0IGEgd2FybmluZywg
aWYgSSB1c2UgImVyciIgaW4gZGV2X2VycigpDQoNCnBhbmZyb3N0X2RldmljZS5jOjc2OjQyOiB3
YXJuaW5nOiBmb3JtYXQg4oCYJWxk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhsb25n
IGludOKAmSwgYnV0IGFyZ3VtZW50IDMgaGFzIHR5cGUg4oCYaW504oCZIFstV2Zvcm1hdD1dDQog
ICA3NiB8ICAgICAgICAgICAgICAgICBkZXZfZXJyKHBmZGV2LT5iYXNlLmRldiwgImdldCBidXNf
YWNlX2Nsb2NrIGZhaWxlZCAlbGRcbiIsDQoNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiBXaXRo
IHRoYXQgZml4ZWQ6DQo+IA0KPiBSZXZpZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJp
Y2VAYXJtLmNvbT4NCj4gDQo+IFRoYW5rcywNCj4gU3RldmUNCj4gDQo+ID4gKwkJZ290byBkaXNh
YmxlX2J1c19jbG9jazsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwllcnIgPSBjbGtfcHJlcGFyZV9l
bmFibGUocGZkZXYtPmJ1c19hY2VfY2xvY2spOw0KPiA+ICsJaWYgKGVycikNCj4gPiArCQlnb3Rv
IGRpc2FibGVfYnVzX2Nsb2NrOw0KPiA+ICsNCj4gPiAgCXJldHVybiAwOw0KPiA+DQo+ID4gK2Rp
c2FibGVfYnVzX2Nsb2NrOg0KPiA+ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBmZGV2LT5idXNf
Y2xvY2spOw0KPiA+ICBkaXNhYmxlX2Nsb2NrOg0KPiA+ICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJl
KHBmZGV2LT5jbG9jayk7DQo+ID4NCj4gPiBAQCAtODAsNiArOTUsNyBAQCBzdGF0aWMgaW50IHBh
bmZyb3N0X2Nsa19pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UNCj4gPiAqcGZkZXYpDQo+ID4N
Cj4gPiAgc3RhdGljIHZvaWQgcGFuZnJvc3RfY2xrX2Zpbmkoc3RydWN0IHBhbmZyb3N0X2Rldmlj
ZSAqcGZkZXYpICB7DQo+ID4gKwljbGtfZGlzYWJsZV91bnByZXBhcmUocGZkZXYtPmJ1c19hY2Vf
Y2xvY2spOw0KPiA+ICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBmZGV2LT5idXNfY2xvY2spOw0K
PiA+ICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBmZGV2LT5jbG9jayk7DQo+ID4gIH0NCj4gPiBA
QCAtNDMyLDYgKzQ0OCwxMCBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2RldmljZV9ydW50aW1lX3Jl
c3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gIAkJcmV0ID0gY2xrX2VuYWJsZShwZmRldi0+
YnVzX2Nsb2NrKTsNCj4gPiAgCQlpZiAocmV0KQ0KPiA+ICAJCQlnb3RvIGVycl9idXNfY2xrOw0K
PiA+ICsNCj4gPiArCQlyZXQgPSBjbGtfZW5hYmxlKHBmZGV2LT5idXNfYWNlX2Nsb2NrKTsNCj4g
PiArCQlpZiAocmV0KQ0KPiA+ICsJCQlnb3RvIGVycl9idXNfYWNlX2NsazsNCj4gPiAgCX0NCj4g
Pg0KPiA+ICAJcGFuZnJvc3RfZGV2aWNlX3Jlc2V0KHBmZGV2LCB0cnVlKTsNCj4gPiBAQCAtNDM5
LDYgKzQ1OSw5IEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfZGV2aWNlX3J1bnRpbWVfcmVzdW1lKHN0
cnVjdA0KPiA+IGRldmljZSAqZGV2KQ0KPiA+DQo+ID4gIAlyZXR1cm4gMDsNCj4gPg0KPiA+ICtl
cnJfYnVzX2FjZV9jbGs6DQo+ID4gKwlpZiAocGZkZXYtPmNvbXAtPnBtX2ZlYXR1cmVzICYgQklU
KEdQVV9QTV9SVCkpDQo+ID4gKwkJY2xrX2Rpc2FibGUocGZkZXYtPmJ1c19jbG9jayk7DQo+ID4g
IGVycl9idXNfY2xrOg0KPiA+ICAJaWYgKHBmZGV2LT5jb21wLT5wbV9mZWF0dXJlcyAmIEJJVChH
UFVfUE1fUlQpKQ0KPiA+ICAJCWNsa19kaXNhYmxlKHBmZGV2LT5jbG9jayk7DQo+ID4gQEAgLTQ2
Miw2ICs0ODUsNyBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2RldmljZV9ydW50aW1lX3N1c3BlbmQo
c3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICAJcGFuZnJvc3RfZ3B1X3Bvd2VyX29mZihwZmRldik7
DQo+ID4NCj4gPiAgCWlmIChwZmRldi0+Y29tcC0+cG1fZmVhdHVyZXMgJiBCSVQoR1BVX1BNX1JU
KSkgew0KPiA+ICsJCWNsa19kaXNhYmxlKHBmZGV2LT5idXNfYWNlX2Nsb2NrKTsNCj4gPiAgCQlj
bGtfZGlzYWJsZShwZmRldi0+YnVzX2Nsb2NrKTsNCj4gPiAgCQljbGtfZGlzYWJsZShwZmRldi0+
Y2xvY2spOw0KPiA+ICAJCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KHBmZGV2LT5yc3RjKTsNCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oDQo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmgNCj4gPiBpbmRl
eCAwZjM5OTI0MTIyMDUuLmVjNTVjMTM2YjFiNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmgNCj4gPiBAQCAtMTM2LDYgKzEzNiw3IEBAIHN0
cnVjdCBwYW5mcm9zdF9kZXZpY2Ugew0KPiA+ICAJdm9pZCBfX2lvbWVtICppb21lbTsNCj4gPiAg
CXN0cnVjdCBjbGsgKmNsb2NrOw0KPiA+ICAJc3RydWN0IGNsayAqYnVzX2Nsb2NrOw0KPiA+ICsJ
c3RydWN0IGNsayAqYnVzX2FjZV9jbG9jazsNCj4gPiAgCXN0cnVjdCByZWd1bGF0b3JfYnVsa19k
YXRhICpyZWd1bGF0b3JzOw0KPiA+ICAJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdGM7DQo+ID4g
IAkvKiBwbV9kb21haW5zIGZvciBkZXZpY2VzIHdpdGggbW9yZSB0aGFuIG9uZS4gKi8NCg0K

