Return-Path: <linux-renesas-soc+bounces-29628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KxaLPN/uWmxHAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 17:23:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D2F2ADE13
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 17:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E35C5310F6F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60F22D541B;
	Tue, 17 Mar 2026 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fjFmJRpX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E8F246BCD;
	Tue, 17 Mar 2026 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764220; cv=fail; b=VYhrLFrq9wAOjohEv11tkE1cy8JFp67j52RuYavN6ttOTAgfcpDDAV7PxXu55/1Kp8039R7Qm5372BN8sNc5bylHMYGUsTeu5K6HIJqz+WvzzHr4WrJwk5FMSxxZxuXM0jUo2sq1GegXrrNzDsXxnf0Y4F0Ifb98tS88Iq21ML4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764220; c=relaxed/simple;
	bh=LF5zvAmA9no+VwqOgAUs4z5WVT2c09MRMfHB+VZ9668=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d8nRP8RAWqE8AzfOOsANyZqDeVYOLZIy/sbEfWiXcxUwJge/Sgu9cJdx5J+xLTlLZ8tF4UvRypYIm7EI1Na9NCfdcv0Om15xFqzpvAgIltEWEUOKutaRovO+L0xIEoHjwZmqPJothOQcLjAjk1jRKOb3kAnxIOYtD6OXLO9j8TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fjFmJRpX; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=av0auXOzYgedRxHbmSZQJUxqKIEz/t1/I53kG+SdgZNprcPu7TImKXBoMHaAOVuW/zxb7d0rLVO2xAdpBYz/7Nfb57bCHAWFqa66lM1CyrRqwBtsPui2fne8zXmAZkIesFaBIxLaSj6SyQWA8a8ikmH1CZcMTSsrhqpHAzGz/4itNAsVz85rjs8pxKg2XnzbubDfb1Feh4lpTfkfMWDX4z5oCKmaSoB1WyXQyYZfrBuRy+2ofMKll9W9W6xURT88eG/aWxKYQSBgvwGkDV5HrbNkQaRggI7Fy8ORX46+F7H6MV9p9JfSdSShbwcTwG37PyYI3mV3JHKLx21LvjIVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LF5zvAmA9no+VwqOgAUs4z5WVT2c09MRMfHB+VZ9668=;
 b=hm4bvAPkmjtlRiuswGiX6Bj7qVTjoaXTEd8bMdCSgGKs3cf7A224FNngO7DlZ1R7TQktZLmukLHSmSX53kGNqFmMGXUCLFvO5lupxBL+PZ6Fdf8TyabLW9BdHnFnXupM6O1CcC+rTWEzLMNlFGtRJ04E6SIH+rt3U1UuwYqZqPu+IqHpCqCwQh5FeZiqe2TJIRBkiBcfdMwkVYUg3MvqXcCr/WTAy5Qd0Zs1KKEXE5aad92AR9UINoKujhj5SSZJrdGAPswuzmyoAbd6ebykTfPDgh5Gs++2CxUeyqOV+jLts+Hn5Hekoy0foKbCVOPikmDFhOjd2RZRfnzhIyVPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LF5zvAmA9no+VwqOgAUs4z5WVT2c09MRMfHB+VZ9668=;
 b=fjFmJRpX6mrhfD0GyjzGa4rIgUbcHcU+X/9Emw0Q2AM3sgj9d1DvSHW+0fat2XtaTVM7F2QgoDN/A5VQN+164ipk0++ilvxiHBBLQO8crPs0BLovwi7upWL7Y47VyNTUgLM+66Txh3GeaB34RVq0BSs0T/jOyMdwraJyZW0KiTU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB13382.jpnprd01.prod.outlook.com (2603:1096:405:1d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 16:16:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 16:16:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
	<p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <Chris.Brandt@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Thread-Topic: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Thread-Index: AQHctgqqun0iZdWPQkGCYHsU3REA1bWy43sAgAAA/WA=
Date: Tue, 17 Mar 2026 16:16:53 +0000
Message-ID:
 <TY3PR01MB11346D6653F7D175B4625C0348641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
 <20260317123610.329630-3-biju.das.jz@bp.renesas.com>
 <abl7ovx8e7zToQfp@tom-desktop>
In-Reply-To: <abl7ovx8e7zToQfp@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB13382:EE_
x-ms-office365-filtering-correlation-id: 5dea1be4-9401-41c2-3cd7-08de84409a12
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 4DrdPofDCikCeGcmCGl1TFasmaJB7Ly7E6DNOi2m+W+MsJFD8cXipWxnEMuL/mTO8kXUOhG7zt4of+MBzkE7HKKreJhUuSByp63TdVDNduFa6qebiyuTuAp/O3Y/obvMkftl3EwbpoHKqLuCtykuMbrUEcnFHK7bWv8ePhrrFJJbp9xl1IP0XhTAU9W3Q3Q1PyO5PVeJSZmtlWb76PwhGiuAggZsTltFYKPsG+U4LWovVeanR6WZ/2QbQJnffGbEC5OYkar6jXQx6NNjbvPNQOAqow5nWNruDoqMsL45K19XUQJ+ZlLlCQpkx1RC/QEd5Rv4ZckOvwzodi/gxKOW3411d4bryE/AG4WFdQHnnIfsX9xlKwWK/JnN22009qc3kOIA8xtc5QjWbytSrVOj5DiMOielfRqogOnzEMJbPxqDLBss71V8wjsDCjpm4aC458WfB+hkHIm8qoeUQyIEbxk5SrzeSJ6RlutYfZCG9EX0I63Q/y/pMOJQnsB5+LYuHzL2J6dNLAEtj/X+dgpu6hAK0NwEmisIAN9scE6uby98bYq7wXPCTsm8B5uHJR9UncNy/DsB4Pd2gDvVUH34YM+eXpliKr/7Fs/W5ATf0g1up27yE2FJmoTNN2kUE7Mm2KMi3294Mo3eha0zaDjVO2u8FW3tHOAH+arNpFKyIWKa5YvVE3ahN6QSVkjiiGcya4avFxR4UvS2ocJL2cHukMeg+HAZv2G5jXYP6bKLvtuTyKPpZf/Z+OCfBysH8CXO1AIOLn+/cMbE4CAu6Td6EuMYO2VB9UdPFUzRzOdPHnk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aXJ6R1M5MGdHcENSRHVZYWZaT3l6eDVCcFFSZ25tSlRVSkFwbzIyWEtncm9m?=
 =?utf-8?B?c2FSQU9rQjZTQkI0bUJ4UUdzOG5nU0sxcllOU3dKNER1aitsN2l6NDh6Uzgy?=
 =?utf-8?B?L0JFblp5S1oraHNnWlRoL0RTNEFFMklReDhwTHh0MDl3SnNBV2dTSGY2RmE5?=
 =?utf-8?B?bkcyWXVzVUtVdlBHUXlwT003UXd3aC9hY3NtYjRBL2wvdExianJGcUFJUnBK?=
 =?utf-8?B?SXJIYyswRE9qVWdkMXJFRDd4QWZhZlBNYi9JSzhxYU9vbTdXbk93bnU0K1hZ?=
 =?utf-8?B?RkhMUlQvbzJtRnhJdmxIalRyVVpualVyU1QrUVJhRnorMVdhbGVhbmxEMzV3?=
 =?utf-8?B?MlEyODhGZ1dPUzE5RlBlbFdhaCtNb2FTZUxXbHFQM0lPWG1mS1l1RDdXcHVN?=
 =?utf-8?B?TjVXcW1hOWo4UmliMjQ3cXNtUDNiTFJXbEF2R3VOMXh6TGRNRmJxNDhWd1hy?=
 =?utf-8?B?bFR0by9pN0pQTHYzMkxrRDNkUnhLUWszN21FNE0rcFBYaWNjZVg2dnZDVFk4?=
 =?utf-8?B?WnRYVStseE9ickV0RytLV1loK1BJenFIN2cyRGhWTXhmSnppYVk1dk9HSmox?=
 =?utf-8?B?cW9JMkhPbjZLWnUwTWY2NUtySlZiZmM5MTh4T3JNTStXcjRyb0JtN0RVS2Fx?=
 =?utf-8?B?TVo2TmcvT21jQXpNTGdTSTg1TGMxek15ZHp4Wk5aOUpTSk55UkNpd2ZKVmxs?=
 =?utf-8?B?VjlXeGxXSy9ualE1cXFKaDY0WHNSMjdIMVdkZWxGeEkrRkFRc0l3T3RHUEVH?=
 =?utf-8?B?c0w5L1VKTUNJeGNtUjdYblg3K2gwVFVibVdSWUcxL1V0TXNITmMrelRUMGQx?=
 =?utf-8?B?RksyaVVYVXk3TkljSTk1SStUdFFud1hmeUE3bzJLTm9XeExuVXpCYjM3bGtW?=
 =?utf-8?B?N3VmcDhyMHBjc0JzMCtLK0dRWTJHTzI1UGRqMWY2bk5ja3d6V1ltT2pvMUxL?=
 =?utf-8?B?NHkyenlJWjRQZzI3SmhMZ2VxaFcxZWpnTHVvM0JXY3VQVUJJeWlJY0ZyZ0Ur?=
 =?utf-8?B?NGdaVktZRmNyNzBlMyt3WnNWeG9oVU5GTVQxVmJxOWhrbnNrd2V4akpFV1ZM?=
 =?utf-8?B?NmdaYzVXZjVsNUk0Y0RpTlE5cXMwS3Q2ZDU5MGVIS3JRVmF1eGp0Z3k4bngv?=
 =?utf-8?B?NTA5M0dmNHVNTm9oTlFtK1EweWFlSUZrYkxlcVBXd0JaQVpaa1FLWFFTNEZJ?=
 =?utf-8?B?b3krMmtXMUI0N2l1UklnaWE1aXhRMkJleDFYOHp2T0dvQjFIWUZJNUpTVVN4?=
 =?utf-8?B?S2N5QjdpZ1FKL2IxempKY0NlZ0dWd0o0WXFjNkhVWVZYU2xKWHVvRld6K0FG?=
 =?utf-8?B?cTFPWGdFelB3WisyNDhQK3FacDhOb05jT3BObW4wZ05xZFBaaWw4d2dJamsr?=
 =?utf-8?B?K3JUZ2VORmM5UksxNGdHeFpsVjQzWmFPc3poc2luVWhrUU9DZy9HM3o2REQw?=
 =?utf-8?B?emVjSUplbXE5amgxVkp0YzZzVDJ5SWF2d0o3eDY5SEpCSE02SmIrWWtRVmM3?=
 =?utf-8?B?Skx0dUlRd240UjNnbmNCVXMxblhyQkNzUnZrS2VMV2l2ZEc5SlBHZHFUa1p4?=
 =?utf-8?B?TCs2a2ZWVlhqcHRERnQwZFVkakh4NERQVE90VjZ0b1A3LzA1SmZpdUhMa0x4?=
 =?utf-8?B?bnZMd3NDTnhZTjBsb0dkcktuenlYZ0F5dkhScWxqOVI1YU94Vy9wZmk5dGxJ?=
 =?utf-8?B?VVlWTkpPdFVrZ2JyVUlNZUVQYWFmZmtUVlhLeG1YbXJmMTE2NTA0L2RhampH?=
 =?utf-8?B?M2JFakhsT3F5SFNZZFdBamFyQlVnRTEwUFU1Z1VoSTk5Qk95TTdkaVF3SXBR?=
 =?utf-8?B?NWN4M2hxQ05FZEhCamxiSElIZVpSRFhaK0xRU2RkQllOTTJRdnhVQ21DNllq?=
 =?utf-8?B?N0tuV0lGb3VGYVFLM2VVWVMzMHBZL0tzbUoyVEhDQzhVTTlpUlZZOTY3TldC?=
 =?utf-8?B?N1RhQ1JrOGtzR0hpY1FuL2N4M2w3Smp4dnBJMlQvT1AzWjJ5c1ZhMHJ0ZWtu?=
 =?utf-8?B?SXM2TEtFSUthUHFiazdESVhETE1xdjJEZHlxK0tvZWdkb2xsN2tzUUN4dktr?=
 =?utf-8?B?eURpb3JhSXVkVzR2bGtUbDlvNWlhc2o2Qjg5ckxaU2NCNlRwNFF6TUhqTm1E?=
 =?utf-8?B?Q1p3eHFBWkVOT3lzRThtTVhOQ3RjbXg0eVk3WFp4dVMxRWtxYWNIRDl1S1pj?=
 =?utf-8?B?VWcxcDg2RDlzWENyajdua0NIRHErVnlkU29TSm5uZjRZMGRWUjQyVzlaM0F1?=
 =?utf-8?B?NXp3VE50bGxWU0l5aXBuRFhhRnVxTjRhZVJlYnY1SmRCWjFQY3owZzMvaCto?=
 =?utf-8?B?YlJpQlExSWQ2V0xwR1BFaW8vWUNIZU9zWUd3Rkh1OUdKNVY0aGF2UT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dea1be4-9401-41c2-3cd7-08de84409a12
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 16:16:53.0628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGulTlyRTXt72p53wofuHtQeA0HyFpdQvG/Wi/tzQXBvWBNCv0mu4KFFFr0KNf143iWwoi/qD9av84jtycYPmk7QAKh8/P0zq0A+V82yLo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13382
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29628-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,lists.freedesktop.org,vger.kernel.org,glider.be,renesas.com,hugovil.com,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 16D2F2ADE13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgVG9tbWFzbyBNZXJjaWFpLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFRvbW1hc28gTWVyY2lhaSA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tPg0K
PiBTZW50OiAxNyBNYXJjaCAyMDI2IDE2OjA1DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBk
cm06IHJlbmVzYXM6IHJ6ZzJsX21pcGlfZHNpOiBGaXggdGhlIHBvd2VyLW9uIHNlcXVlbmNlDQo+
IA0KPiBIaSBCaWp1LA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guDQo+IA0KPiBPbiBUdWUsIE1h
ciAxNywgMjAyNiBhdCAxMjozNjowMVBNICswMDAwLCBCaWp1IHdyb3RlOg0KPiA+IEZyb206IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IE1vdmUgcmVzZXRf
Y29udHJvbF9kZWFzc2VydCgpIGFuZCByZXNldF9jb250cm9sX2Fzc2VydCgpIGZyb20NCj4gPiBy
emcybF9taXBpX2RzaV9kcGh5X2luaXQoKS9yemcybF9taXBpX2RzaV9kcGh5X2V4aXQoKSB0bw0K
PiA+IGF0b21pY19wcmVfZW5hYmxlKCkgYW5kIGF0b21pY19wb3N0X2Rpc2FibGUoKSByZXNwZWN0
aXZlbHksIGFuZCBtb3ZlDQo+ID4gcnpnMmxfbWlwaV9kc2lfc2V0X2Rpc3BsYXlfdGltaW5nKCkg
ZnJvbSBhdG9taWNfcHJlX2VuYWJsZSgpIHRvDQo+ID4gYXRvbWljX2VuYWJsZSgpLCB0byBhbGln
biB3aXRoIHRoZSBwb3dlci1vbiBzZXF1ZW5jZSBkZXNjcmliZWQgaW4NCj4gPiBGaWd1cmUgMzQu
NSBvZiBzZWN0aW9uICIzNC40LjIuMSBSZXNldCIgb2YgdGhlIFJaL0cyTCBoYXJkd2FyZSBtYW51
YWwNCj4gPiBSZXYuMS41MCBNYXkgMjAyNS4NCj4gPg0KPiA+IEFjY29yZGluZyB0byB0aGUgaGFy
ZHdhcmUgbWFudWFsLCBMSU5LIHJlZ2lzdGVycyBtdXN0IGJlIHdyaXR0ZW4NCj4gPiBiZWZvcmUg
ZGVhc3NlcnRpbmcgQ01OX1JTVEIsIGFuZCB0aGUgMW1zIGRlbGF5IGlzIHJldGFpbmVkIGluDQo+
ID4gYXRvbWljX3ByZV9lbmFibGUoKSBhZnRlciB0aGUgZGVhc3NlcnQuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0t
DQo+ID4gIC4uLi9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfbWlwaV9kc2kuYyAgICB8IDI3
ICsrKysrKysrKysrLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9y
ZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gPiBpbmRleCBlNTNiNDhlNGRlNTYuLjkw
NTNjZTAzN2I3NSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1k
dS9yemcybF9taXBpX2RzaS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnot
ZHUvcnpnMmxfbWlwaV9kc2kuYw0KPiA+IEBAIC00ODQsNyArNDg0LDYgQEAgc3RhdGljIGludCBy
emcybF9taXBpX2RzaV9kcGh5X2luaXQoc3RydWN0IHJ6ZzJsX21pcGlfZHNpICpkc2ksDQo+ID4g
IAl1MzIgZHBoeXRpbTE7DQo+ID4gIAl1MzIgZHBoeXRpbTI7DQo+ID4gIAl1MzIgZHBoeXRpbTM7
DQo+ID4gLQlpbnQgcmV0Ow0KPiA+DQo+ID4gIAkvKiBBbGwgRFNJIGdsb2JhbCBvcGVyYXRpb24g
dGltaW5ncyBhcmUgc2V0IHdpdGggcmVjb21tZW5kZWQgc2V0dGluZyAqLw0KPiA+ICAJZm9yIChp
ID0gMDsgaSA8IEFSUkFZX1NJWkUocnpnMmxfbWlwaV9kc2lfZ2xvYmFsX3RpbWluZ3MpOyArK2kp
IHsgQEANCj4gPiAtNTI0LDEyICs1MjMsNiBAQCBzdGF0aWMgaW50IHJ6ZzJsX21pcGlfZHNpX2Rw
aHlfaW5pdChzdHJ1Y3QgcnpnMmxfbWlwaV9kc2kgKmRzaSwNCj4gPiAgCXJ6ZzJsX21pcGlfZHNp
X3BoeV93cml0ZShkc2ksIERTSURQSFlUSU0yLCBkcGh5dGltMik7DQo+ID4gIAlyemcybF9taXBp
X2RzaV9waHlfd3JpdGUoZHNpLCBEU0lEUEhZVElNMywgZHBoeXRpbTMpOw0KPiA+DQo+ID4gLQly
ZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KGRzaS0+cnN0Yyk7DQo+ID4gLQlpZiAocmV0IDwg
MCkNCj4gPiAtCQlyZXR1cm4gcmV0Ow0KPiA+IC0NCj4gPiAtCWZzbGVlcCgxMDAwKTsNCj4gPiAt
DQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+ID4gQEAgLTU0MSw4ICs1MzQsNiBAQCBz
dGF0aWMgdm9pZCByemcybF9taXBpX2RzaV9kcGh5X2V4aXQoc3RydWN0DQo+ID4gcnpnMmxfbWlw
aV9kc2kgKmRzaSkNCj4gPg0KPiA+ICAJZHBoeWN0cmwwICY9IH4oRFNJRFBIWUNUUkwwX0VOX0xE
TzEyMDAgfCBEU0lEUEhZQ1RSTDBfRU5fQkdSKTsNCj4gPiAgCXJ6ZzJsX21pcGlfZHNpX3BoeV93
cml0ZShkc2ksIERTSURQSFlDVFJMMCwgZHBoeWN0cmwwKTsNCj4gPiAtDQo+ID4gLQlyZXNldF9j
b250cm9sX2Fzc2VydChkc2ktPnJzdGMpOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIGludCBy
emcybF9kcGh5X2NvbmZfY2xrcyhzdHJ1Y3QgcnpnMmxfbWlwaV9kc2kgKmRzaSwgdW5zaWduZWQN
Cj4gPiBsb25nIG1vZGVfZnJlcSwgQEAgLTEwMzAsMjQgKzEwMjEsMzcgQEAgc3RhdGljIHZvaWQg
cnpnMmxfbWlwaV9kc2lfYXRvbWljX3ByZV9lbmFibGUoc3RydWN0DQo+IGRybV9icmlkZ2UgKmJy
aWRnZSwNCj4gPiAgCWNvbm5lY3RvciA9IGRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3JfZm9y
X2VuY29kZXIoc3RhdGUsIGJyaWRnZS0+ZW5jb2Rlcik7DQo+ID4gIAljcnRjID0gZHJtX2F0b21p
Y19nZXRfbmV3X2Nvbm5lY3Rvcl9zdGF0ZShzdGF0ZSwgY29ubmVjdG9yKS0+Y3J0YzsNCj4gPiAg
CW1vZGUgPSAmZHJtX2F0b21pY19nZXRfbmV3X2NydGNfc3RhdGUoc3RhdGUsIGNydGMpLT5hZGp1
c3RlZF9tb2RlOw0KPiA+IC0NCj4gPiAgCXJldCA9IHJ6ZzJsX21pcGlfZHNpX3N0YXJ0dXAoZHNp
LCBtb2RlKTsNCj4gPiAgCWlmIChyZXQgPCAwKQ0KPiA+ICAJCXJldHVybjsNCj4gPg0KPiA+IC0J
cnpnMmxfbWlwaV9kc2lfc2V0X2Rpc3BsYXlfdGltaW5nKGRzaSwgbW9kZSk7DQo+ID4gKwlyZXQg
PSByZXNldF9jb250cm9sX2RlYXNzZXJ0KGRzaS0+cnN0Yyk7DQo+ID4gKwlpZiAocmV0IDwgMCkN
Cj4gPiArCQlyZXR1cm47DQo+ID4gKw0KPiA+ICsJaWYgKGRzaS0+cnN0YykNCj4gPiArCQlmc2xl
ZXAoMTAwMCk7DQo+IA0KPiBXaGF0IGFib3V0Pw0KPiANCj4gCWlmIChkc2ktPnJzdGMpIHsNCj4g
CSAgICByZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KGRzaS0+cnN0Yyk7DQo+IAkgICAgaWYg
KHJldCA8IDApDQo+IAkJcmV0dXJuOw0KPiANCj4gCSAgICBmc2xlZXAoMTAwMCk7DQo+IAl9DQoN
Ck9LLg0KDQo+IA0KPiANCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyB2b2lkIHJ6ZzJsX21pcGlf
ZHNpX2F0b21pY19lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gPiAgCQkJCQkg
c3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKSAgew0KPiA+ICAJc3RydWN0IHJ6ZzJsX21p
cGlfZHNpICpkc2kgPSBicmlkZ2VfdG9fcnpnMmxfbWlwaV9kc2koYnJpZGdlKTsNCj4gPiArCWNv
bnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOw0KPiA+ICsJc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvcjsNCj4gPiArCXN0cnVjdCBkcm1fY3J0YyAqY3J0YzsNCj4gPiAgCWlu
dCByZXQ7DQo+ID4NCj4gPiAgCXJldCA9IHJ6ZzJsX21pcGlfZHNpX3N0YXJ0X2hzX2Nsb2NrKGRz
aSk7DQo+ID4gIAlpZiAocmV0IDwgMCkNCj4gPiAgCQlnb3RvIGVycl9zdG9wOw0KPiA+DQo+ID4g
Kwljb25uZWN0b3IgPSBkcm1fYXRvbWljX2dldF9uZXdfY29ubmVjdG9yX2Zvcl9lbmNvZGVyKHN0
YXRlLCBicmlkZ2UtPmVuY29kZXIpOw0KPiA+ICsJY3J0YyA9IGRybV9hdG9taWNfZ2V0X25ld19j
b25uZWN0b3Jfc3RhdGUoc3RhdGUsIGNvbm5lY3RvciktPmNydGM7DQo+ID4gKwltb2RlID0gJmRy
bV9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKHN0YXRlLCBjcnRjKS0+YWRqdXN0ZWRfbW9kZTsN
Cj4gPiArDQo+ID4gKwlyemcybF9taXBpX2RzaV9zZXRfZGlzcGxheV90aW1pbmcoZHNpLCBtb2Rl
KTsNCj4gPiArDQo+IA0KPiBNYW51YWwvUGF0Y2ggc2F5cyB0aGF0IExJTksgcmVnaXN0ZXJzIG11
c3QgYmUgd3JpdHRlbiBiZWZvcmUgZGVhc3NlcnRpbmcgQ01OX1JTVEI6DQoNCk5PVCBBTEwuDQoN
Ck9ubHkgdGhlc2UgbGluayByZWdpc3RlcnMuDQoNCuKIkiBUWFNFVFINCuKIkiBVTFBTU0VUUg0K
4oiSIERTSVNFVFINCuKIkiBDTFNUUFRTRVRSDQriiJIgTFBUUk5TVFNFVFINCg0KPiANCj4gICBh
dG9taWNfcHJlX2VuYWJsZSgpOg0KPiAJICBzdGFydHVwKCkgICAgICAgICAgICAgICAgICAoRikg
UEhZIHRpbWluZyByZWdzICsgTElOSw0KPiAJICBzZXRfZGlzcGxheV90aW1pbmcoKSAgICAgICAo
Rikgd3JpdGluZyBWSUNIMSogKExJTksgcmVncykNCg0KVGhpcyBpcyBub3QgRi4gVGhpcyBpcyBh
ZnRlciBzdGFydGluZyBIUyBDTEsuDQoNCj4gCSAgcmVzZXRfY29udHJvbF9kZWFzc2VydCgpICAg
KEcpDQo+IAkgIGZzbGVlcCgxMDAwKSAgICAgICAgICAgICAgIChIKQ0KPiANCj4gQmVmb3JlIHRo
aXMgc2VyaWVzIHdlIGhhdmU6DQo+IA0KPiAgIGF0b21pY19wcmVfZW5hYmxlKCk6DQo+ICAgICBz
dGFydHVwKCkNCj4gICAgICAgZHBoeV9pbml0KCkNCj4gICAgICAgICB3cml0ZSBEU0lEUEhZVElN
eCAgICAgICAgIChGKSBQSFkgdGltaW5nIHJlZ3MNCj4gICAgICAgICByZXNldF9jb250cm9sX2Rl
YXNzZXJ0KCkgIChHKSBkZWFzc2VydCBDTU5fUlNUQg0KPiAgICAgICAgIHVkZWxheSgxKSAgICAg
ICAgICAgICAgICAgKEgpDQo+ICAgICBzZXRfZGlzcGxheV90aW1pbmcoKSAgICAgICAgICAoRikg
d3JpdGluZyBWSUNIMSogKExJTksgcmVncykNCg0KVGhpcyBpcyBub3QgRi4gVGhpcyBpcyBhZnRl
ciBzdGFydGluZyBIUyBDTEsuDQoNCj4gDQo+IA0KPiBNb3Zpbmcgc2V0X2Rpc3BsYXlfdGltaW5n
KCkgaGVyZSB5b3UgYXJlIHNldHRpbmcgTElOSyByZWdzIGFmdGVyDQo+IHJlc2V0X2NvbnRyb2xf
ZGVhc3NlcnQoKSBhbmQgdGhlIHNlcXVlbmNlIHdpbGwgYmU6DQo+IA0KPiAgYXRvbWljX3ByZV9l
bmFibGUoKToNCj4gCSBzdGFydHVwKCkJCSAgKEYpIFBIWSB0aW1pbmcgcmVncyArIExJTksNCj4g
CSByZXNldF9jb250cm9sX2RlYXNzZXJ0KCkgKEcpIENNTl9SU1RCIGRlYXNzZXJ0DQo+IAkgZnNs
ZWVwKDEwMDApICAgICAgICAgICAgIChIKSB3YWl0IDFtcw0KPiANCj4gIGF0b21pY19lbmFibGUo
KToNCj4gCSBzdGFydF9oc19jbG9jaygpDQo+IAkgc2V0X2Rpc3BsYXlfdGltaW5nKCkgICAgIChG
KSB3cml0aW5nIFZJQ0gxKiAoTElOSyByZWdzKQ0KDQpUaGlzIGlzIG5vdCBGLiBJdCBpcyBhZnRl
ciBzdGFydGluZyBIU0NMSyBhbmQgaXQgaXMgYXMgcGVyIGhhcmR3YXJlIG1hbnVhbC4NCg0KPiAJ
IHN0YXJ0X3ZpZGVvKCkNCj4gDQo+IEkgdGhpbmsgdG8gcHJvdmlkZSB0aGUgcmlnaHQgc2VxdWVu
Y2Ugd2UgbmVlZCB0byBqdXN0IG1vdmUNCj4gDQo+IAlyZXNldF9jb250cm9sX2RlYXNzZXJ0KGRz
aS0+cnN0Yyk7DQo+IA0KPiBGcm9tIHJ6ZzJsX21pcGlfZHNpX2RwaHlfaW5pdCgpIHRvIHJ6ZzJs
X21pcGlfZHNpX2F0b21pY19wcmVfZW5hYmxlKCkNCj4ganVzdCBhZnRlciByemcybF9taXBpX2Rz
aV9zZXRfZGlzcGxheV90aW1pbmcoKSBjYWxsLg0KPiANCj4gDQo+ID4gIAlyZXQgPSByemcybF9t
aXBpX2RzaV9zdGFydF92aWRlbyhkc2kpOw0KPiA+ICAJaWYgKHJldCA8IDApDQo+ID4gIAkJZ290
byBlcnJfc3RvcF9jbG9jazsNCj4gPiBAQCAtMTA3NCw2ICsxMDc4LDcgQEAgc3RhdGljIHZvaWQN
Cj4gPiByemcybF9taXBpX2RzaV9hdG9taWNfcG9zdF9kaXNhYmxlKHN0cnVjdCBkcm1fYnJpZGdl
ICpicmlkZ2UsICB7DQo+ID4gIAlzdHJ1Y3QgcnpnMmxfbWlwaV9kc2kgKmRzaSA9IGJyaWRnZV90
b19yemcybF9taXBpX2RzaShicmlkZ2UpOw0KPiA+DQo+ID4gKwlyZXNldF9jb250cm9sX2Fzc2Vy
dChkc2ktPnJzdGMpOw0KPiA+ICAJcnpnMmxfbWlwaV9kc2lpX3N0b3AoZHNpKTsNCj4gDQo+IHJ6
ZzJsX21pcGlfZHNpX3N0b3AoKSBpcyB3cml0aW5nIERTSURQSFlDVFJMMCByZWcgdmlhIGRwaHlf
ZXhpdCgpLg0KPiBJIHRoaW5rIHRoZSByaWdodCBvcmRlciBzaG91bGQgYmU6DQo+IA0KPiAJcnpn
MmxfbWlwaV9kc2lpX3N0b3AoZHNpKTsNCj4gCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KGRzaS0+cnN0
Yyk7DQoNCi5hdG9taWNfcHJlX2VuYWJsZSgpDQoNCmRzaV9zdGFydCgpDQpyZXNldF9kZWFzc2Vy
dCgpLS0+Rw0KDQouYXRvbWljX3Bvc3RfZGlzYmFsZSgpDQoNCkp1c3Qgb3Bwb3NpdGUgb2YgYXRv
bWljX3ByZV9lbmFibGUoKQ0KcmVzZXRfYXNzZXJ0KCktLT5HDQpkc2lfc3RvcCgpDQoNCg0KQ2hl
ZXJzLA0KQmlqdQ0K

