Return-Path: <linux-renesas-soc+bounces-12263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8BFA16AA4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 11:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 731AC7A01F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C6D199E9A;
	Mon, 20 Jan 2025 10:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="O7I2PuGH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4846F19C540
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737368289; cv=fail; b=DwLAHNhRnQt0jNYaEuzHw6Y9qnJJCKsba1VCzwwPIXnIcZvCE0mr3Q7Qiqhss34vVP/rpD3/LM+ZOpYZFNGK+g5nP0JwvhCoqNdHzyT5l1B33YcPiHWQ7SfhP8CZGl0BurnCUSWdxndNKtdb2MVJfQeiE917CnkCHktXImoZLz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737368289; c=relaxed/simple;
	bh=QKir0PqWJqlNCjjkaEbsqtEnRIG2qH7ukpW9fM1Cqlk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GcTfVbwnT1Oa7/cdkjomkMSFUN4OKUwK6EgAD/a5WPXAOnc1iSfiEunALxzt5dNB6Si/KNFVYs/zRGLV8Y5q0gaaOtoefRKYy4x7vgzOgVVg9hkFwzbVatA9FMbDpi6DTzJEtVee3bOafdFhBdIjnX+b89UpSpxj7uYNBkL8mOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=O7I2PuGH; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7i6AzRsbXsrTh3f8OfP5tL91lVp5efe/4xQXHWZDBLUnxidv/7O4LRWeaEaSCMlgfZ7tjpeLdjTWUtUuXFwr0pROHXhCWgV1tGhemgzQyk6gqtwHf1u6Q/kNkdVYTW1IwzWQU8e26VlETUWvuaICnAp4Gc04jyjz56Jk6nNywg/Bt2qUavpCcA4Wn87aj4raubbWR/bH0+/E5ZC85naUWVydMjDqwoHlQJ82dAb8Vy8KvwhjTwoz4mmHRH4VmbB+Z0AqKvLJQZ6KQi723CfpiiIVY/CfguC6gKOyxkwCePWi7x+bvsBd/UM/9hnc7/MmlBlwOjqBQoVz7tWN3VN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKir0PqWJqlNCjjkaEbsqtEnRIG2qH7ukpW9fM1Cqlk=;
 b=K+/G3399zFLtNkRwZfG14jEJFPyaTMgdgMuIg45+S/T7EyL5a5KtNGf2KNxMwsTvUNSc+qiJhVnGKImq6QxSQ03qTIgKNiIlCpBa/JV5LTOLTU8LjAbIw2+xJs2T/iS4/T0cSdyIgLiDlDSCkrloTaGOerG0J1P0WaMld5KzjAvIrBrW2myWCmaH9yvzsm4ROUx1eSX0epK4DvtRHB6T9l/M7Kn+z5FpXOKc1MFTFq8ADtV9IQsG5oO6plG/LDOphvT7Mi+vL3S2+0BzGepBJdURWmo2Iw0FHxe2WU0aN8coGrImhq/iIKuNvTs7A/k05/y9uWr959vdkqUYGa7v+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKir0PqWJqlNCjjkaEbsqtEnRIG2qH7ukpW9fM1Cqlk=;
 b=O7I2PuGHcQ7xKzf3M13xYFQatJuirRW9fINGXff5b9CKzcCKbydjuPJlvO/shrOe5e78GoC6sTVPxYlASLaKKJg7uytlqNEYH0yu1/gZmusBmL2pFNn6uPJnyqZSPxWgWbqADpmqvpzRT3ilsNt15RLQ+83NI1jeDtWFdZw60Cw=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY4PR01MB14106.jpnprd01.prod.outlook.com (2603:1096:405:20b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:18:02 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 10:18:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 04/11] irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
Thread-Topic: [PATCH 04/11] irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
Thread-Index: AQHbayBdIBc/x+i3jk6Ll1RgdZK7cLMfbzOAgAAC1NA=
Date: Mon, 20 Jan 2025 10:18:02 +0000
Message-ID:
 <TYCPR01MB113320D8E8EA47783597C590886E72@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
	 <20250120094715.25802-5-biju.das.jz@bp.renesas.com>
 <6dd5b81eef1cf3b4a73e2d02f6b25747b496587a.camel@pengutronix.de>
In-Reply-To: <6dd5b81eef1cf3b4a73e2d02f6b25747b496587a.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY4PR01MB14106:EE_
x-ms-office365-filtering-correlation-id: 9dc15a78-1c69-416d-7a76-08dd393bb908
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dmdGQURBeUl6U2dqQyt1a3dzV3lYYUtLU1BBV0JHcm85SzQrVUM1R1BqS2pu?=
 =?utf-8?B?aVA3UzFlUFlHU1QxdGtSREZPcDM5M1RzZTdaSXM2VXU4R1V0S0g4eDk5MDY4?=
 =?utf-8?B?MVV2KzlDRzZOT01jRkpKdkZjZERKalhmcGtGS2xKV25qeDRjOWRnU1VqN0FE?=
 =?utf-8?B?Q2lWMWlFWGV2L0dzbSt6bTg2Y1d2Z2ljdGx6SzhqZ1BKTHIvZ0hKMm5DMGo4?=
 =?utf-8?B?ZElNalF6eVpraTdsVnREYWRydlhNWWZNWnJOQzZpOE5ZM1lTRU53bFREK3JE?=
 =?utf-8?B?c1o5UnI3MmNXUHN4NlRRMTFHMnBBYTdpUzlHUjhhYmxLS2NpMFNtV0lKVmFY?=
 =?utf-8?B?QmFWbm1DQklFUXJsS1loVDFYZ3RVT1NSTGVHUjJsOVZ0SXN5aVdPYXh3c0R3?=
 =?utf-8?B?VEQ5NU9teldzelVKRnQycWVwc3hmS1c3enFwRWJlREtSTU5KVmpGRTB2a2h3?=
 =?utf-8?B?ZVpTdWxiRDJqWjREbzVTaG45QlN0WExKYklOOE5DK2NGR0FaOEgwaDl1TDlX?=
 =?utf-8?B?OTRjKytnL2U1d2Z1cVhWQVBMVGtnVzFIZ2k4WFQ4UzdYWjlST0h3bjJDWFNm?=
 =?utf-8?B?NDdPY3d1cEwyMHh6SVdPVU9SSVg2a2tRbmd2SGVBNjZoS1A2WlpNOGNEZ0hp?=
 =?utf-8?B?blFuVkRBS3BGM0taMk1FdlhqaHhrSWhQMGRwQjJITDFocHh3M0hZZVNNcHF1?=
 =?utf-8?B?aGRZc1MvTUtWb3BkVk5kWGF2L0JmZncwemVtTWNSWnhaYWZ1UlE2cmtzZUdB?=
 =?utf-8?B?M2NTL3BDd09ZWDdVbkgyMG5ibWVVaEEvRytKYWhzK0lJbjFIaGxQL3NrRXdk?=
 =?utf-8?B?WDZnLzF3WWJlUnM4U1Y2djFpZXcrOWZsWTM5WmtPZU1xOWd3U3pYV0U3WUF6?=
 =?utf-8?B?K25oMmRVeHV4V29Fd29pQU1jWmJhaTFPOG5LdGtrR0RvbEsyV1ZLdU51TmV4?=
 =?utf-8?B?bm9ueWgrQytpR1cwU2RScFA3eW52TmNRZlNTZmFjalN0RUQ2MzVKa2pVSGRn?=
 =?utf-8?B?dGNqa3FQN1phSzROTGxHQzNZcDUxQzBjNWxERUdvb0dNSDExUWJldVFUQ1cr?=
 =?utf-8?B?SEFWK3Q0eVBXcUJZYlRyT2xwMmpkYjNjOGFQU2tmZitjdXlxSFlSR01IUzBX?=
 =?utf-8?B?UGR1cWxxcUhyeFQzMUgwb3FuQlBxVlNSTksvVTJCaktnTWE3Wk8yT1RwQXVW?=
 =?utf-8?B?TEljVEJXQnBjMWorMVFuRDRPRCtjcTFFMTd3Vm1UZFo0d1hSN3BudWZrZEg3?=
 =?utf-8?B?VENyWkNsbDRKckcxTHUxdzZteGU3VHJjN0dnWmw2RXZTRzcwLy8xLzV3bjRo?=
 =?utf-8?B?Wm5EeU8vVUw5YjhFZmk0dnl2QWZmQUl2SWc4QmlvTnBkTCtrWXRya20rbmN6?=
 =?utf-8?B?UlpIeFdjRmxMQy9xOFp5YkxnT1VjWVQ5SmVRQnpoamlmZDMybFcrdzFpcTFM?=
 =?utf-8?B?UDBOSnRUeUlVR3o1bi8wTW1qeTZhRGdMUUxaNzV6QUlRRGZKUzIzQ3ByTjBM?=
 =?utf-8?B?YkpaMkFlVmFoKzkvclpKcks5YnJMQWVoL2dETEJBNEpYN3FGYVJxVTdXK0hs?=
 =?utf-8?B?Z1REL1lwNDJXMkVSb2RwOFRFdmJVS0YyWmhucUNUd1EzdFhqaE95aCtObjIz?=
 =?utf-8?B?VFRtbzdqRkE2MnVBZFJrZVFRYmJNVUZWWjFnUXd1STdTbHJMZlpUYmhBZ3FM?=
 =?utf-8?B?bldCRzJPQktxQVVxOXV6aFlaMGw1WjVZYzgwWngxSlpIZ0xvVGRVemNYVk83?=
 =?utf-8?B?L3JndXptVk1BNGRBb0FBYnlFUmM1QkwvUlMxR294QWloYkJvaUozVXFJVjV4?=
 =?utf-8?B?cklRVHVXemtocncrb09mb0FJN3VxWGVZcDlLT09ZcGFldmhwR0pxVENHajg2?=
 =?utf-8?B?UTd3RkZvSmllMlg4ZzlLRVpJcHdnNEZZajA1ckdEelpnYXh6VGVrMTJUTTNJ?=
 =?utf-8?Q?iCKJy4bcdAzD14wq7JoI5B21H01wW5Pv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UnNtQ1NVRVJkSHJBdVpjZTA2bzdqRzFnMVNPWFBPSTNKQURXZFo4S3ZLbEVB?=
 =?utf-8?B?MlhBTVR6QUY4S3hiVU8rV0o0WkJZaGVmQktldVN2K3BVZkE5NXdKTXc5eThZ?=
 =?utf-8?B?K1BXOGhLbTRQYTZQQnVMT0JNQjZLN1FLYmovQVl6akovT08vUi80RS8vRE80?=
 =?utf-8?B?UUowbnRJSEJtTFdnRTlJaExOSExjRmRReDduL1JDMThrSWFpSWV2ZDlBd29W?=
 =?utf-8?B?UDk5UnNYSWg1N3VmTnVKbEFQUWRXQTlzZjZyeGVtWEovZytjMjlRQWc5VnZC?=
 =?utf-8?B?aEtqeVZkNXUvYkVRWjJTV3BGc1VWSkRzLzNtQmNzbWp6bVZGQTdMWmpiNFdQ?=
 =?utf-8?B?M2lXSm11RkZhdGNtZWliSVZqNXczSnFrVXA5TWNWRWw4M0svWmpvMHdTK0Fv?=
 =?utf-8?B?TzBxRVdVYm5zVjhEWUFCZGJBL3RwRWQycTFsOEM4cGtWQVJkamdycUtLanRU?=
 =?utf-8?B?b2k1ZUsyNUgvKzRpM2hyWS80b3ZMTGMrd0ZFTTNlRzVQSmQxUUpwWis1aWQz?=
 =?utf-8?B?aDV1bFZvYnZmckdSeS9VejAwampEMWQ2Q2N3SzBxM2Q4dElzT045TUtNUWdY?=
 =?utf-8?B?SmNhb3JYL2RsUUc5enJuTU4wRGsyeDZ1aitocVZpWWxwNUxNV0ZmS2FLMXRM?=
 =?utf-8?B?S1ZTVnk0d2xveWw1cVRyU2ZkbEFybnZRYS9ZK1diMkIxM1RSd3U3MmhHN0ht?=
 =?utf-8?B?LzJxQ3IzajFuVm4xd3VpRE5Wd3B6eUNhN2pJbzdGNEh6T242Z0FkV2h1ZDFn?=
 =?utf-8?B?S0xZQW4rejEwdmYvOGh1YUZJdHcyM1VmNkVPMk1Xakp5WE1aYndIaHpnRFV6?=
 =?utf-8?B?S1B0SkpTZXJaQXdEM1Z1WTBYSTdpWkgyRTQ0R20yY0tMSGQ1NjNubTFmSitv?=
 =?utf-8?B?YVV4d2JqVWsyZUlTYjlBNlpxamUrU3pvdm1LUnBWQURiSWRGd0dHUHM2U2pL?=
 =?utf-8?B?ZHVtQ3dUekp2UGpzTEtLZ0VnOTNxdW91L1hZZUhSb0hCbXhBTnlkYWdJK1Nn?=
 =?utf-8?B?dGREbldJLzZydDhoRjFkZTdrU0xBVEZvQVByemZNQjZjOTE1ZTBJUFZEWG4z?=
 =?utf-8?B?L0RWeVB4M01mOXhHTTR5bldMVjdBYU9PRWM2WldQN1VQTUdkUjdWTktYNWxG?=
 =?utf-8?B?bEQvajB5QUdyU1NxRXhReitTa2NnWXBuM3dTMk5veWswc0dCSHdYU2NzcDBY?=
 =?utf-8?B?YmpCM3JEc2NudnNUbFVjWklmZHBWN2l4K2V5ZnVsOHJhSUpWTmNGKzluTDJq?=
 =?utf-8?B?alc2ZUV2eHQwNnh0L0hNK0dVdW1nbEYrUDZHUlFmWExLbU1mQ01IY2k3Uy93?=
 =?utf-8?B?R1NFTWN1aEtaWUFGOW9zWFQrQnJkMlRPVW1PemNjWGs5Y01vSTV3VURPL1RW?=
 =?utf-8?B?USthYjRDVExLSjZPM2ZGSXJmamY2dFIzNEZQK0Z5L2Vxcjd0K3lyb1A5UjRo?=
 =?utf-8?B?VnVTQUV0cW5hV0xDSjduQlFzbUFQR1JmWnNsekNaY3Q5dHNHOFpNdFZDVi9T?=
 =?utf-8?B?bHIvZERBdlJBcFowNFpRRWMvTUJtWE5kaUtIc0syNGxpSm1SQ1orYVU1S013?=
 =?utf-8?B?ZCtlMEZXNC9iSzlsejB5VVVTSlpjZjU1RUlEL2ZkbGl6bEhha1RtQ0FLQ0dm?=
 =?utf-8?B?UXVYQkpGWVFSLzBRU1RLaU4vRm1VZkl6cGhzOWltVTVYa01kY3crdlZmd2hH?=
 =?utf-8?B?T0taSzRXeWlyTktTNTRCR2xUWDhYbmlUaEk2dTQrQ1NlaG9FVHJnQmE1R2kz?=
 =?utf-8?B?Mlp2eFZTOE5tVTRaOEdEL1FtaVlpSTdBdE1aNWd3amZvYXdnT1hrNk1oRWVt?=
 =?utf-8?B?TTRTYjZpNGdwTmJuQzlLS1NBOHNUS1VvRXdrWXhNV09QTHgrVTFVUHZaQnp6?=
 =?utf-8?B?U1lHL0hNcU1ROHpaTW9Qd2ZpMTB2Z2JFM25kV2U3SVNXaGJVWGtIalM0aXNn?=
 =?utf-8?B?enpLU29Tanp0eis0UHNoR3NVTWJtSTJzcnJQVzB3WEF2TGpiK0JmNUQwbXVy?=
 =?utf-8?B?UnhjL1Bxa0FpU1lVaEc0enQwblBlOUdmdCtOUWRhMG5GNUlrdG1uT3Jjamd6?=
 =?utf-8?B?S01PekU2dHlTM2xsVzV3Yk1YODlyc3JrZlRPMVFvVVQ3U3BCa2JaaWx1V2o4?=
 =?utf-8?B?RWp6T3E2b0xDZEEwMVlzV2Z1d1I3YlYrRm5jbG5iV0YwSzd6bTVrS2MvTW1Z?=
 =?utf-8?B?YkE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc15a78-1c69-416d-7a76-08dd393bb908
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 10:18:02.6406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vfXqidIcRCTTDr53zTHl+KPsXJcjsKwRQM9KMUcF2C4h67YqqmLSqK2dOvZDyb8HCDjLaWrWcbHL8g8SSdjXD7V+/M/G/QOjEnb4sovNUBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14106

SGkgUGhpbGlwcCwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXgu
ZGU+DQo+IFNlbnQ6IDIwIEphbnVhcnkgMjAyNSAxMDowNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDA0LzExXSBpcnFjaGlwL3JlbmVzYXMtcnp2Mmg6IFNpbXBsaWZ5IHJ6djJoX2ljdV9pbml0KCkN
Cj4gDQo+IE9uIE1vLCAyMDI1LTAxLTIwIGF0IDA5OjQ3ICswMDAwLCBCaWp1IERhcyB3cm90ZToN
Cj4gPiBTaW1wbGlmeSByenYyaF9pY3VfaW5pdCgpIGJ5IHVzaW5nIG5ld2x5IGFkZGVkIGRldm1f
KiBoZWxwZXJzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVz
YXMtcnp2MmguYyB8IDE1ICsrKysrKy0tLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yenYyaC5jDQo+ID4gYi9kcml2ZXJzL2lycWNoaXAvaXJx
LXJlbmVzYXMtcnp2MmguYw0KPiA+IGluZGV4IGZkNDMyYjQzNTA2Yi4uYTAyZDQ3NTI5NTY0IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yenYyaC5jDQo+ID4g
KysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gPiBAQCAtNDU2LDIz
ICs0NTYsMjMgQEAgc3RhdGljIGludCByenYyaF9pY3VfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5vZGUsIHN0cnVjdCBkZXZpY2Vfbm9kZQ0KPiAqcGFyZW50KQ0KPiA+ICAJCWdvdG8gcHV0X2Rl
djsNCj4gPiAgCX0NCj4gPg0KPiA+IC0JcmVzZXRuID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9l
eGNsdXNpdmUoJnBkZXYtPmRldiwgTlVMTCk7DQo+ID4gKwlyZXNldG4gPQ0KPiA+ICtkZXZtX3Jl
c2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1c2l2ZV9kZWFzc2VydGVkKCZwZGV2LT5kZXYs
DQo+ID4gK05VTEwpOw0KPiANCj4gVGhpcyBjaGFuZ2VzIHRoZSByZXNldCBjb250cm9sIHRvIGJl
IG9wdGlvbmFsIHdpdGhvdXQgbWVudGlvbmluZyBpdCBpbiB0aGUgY29tbWl0IGRlc2NyaXB0aW9u
LiBTaG91bGQNCj4gdGhpcyBjaGFuZ2UgYmUgcGFydCBvZiBhbm90aGVyIHBhdGNoPw0KDQpUaGFu
a3MsIEl0IGlzIGEgdHlwby4gSXQgc2hvdWxkIGJlIGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhj
bHVzaXZlX2RlYXNzZXJ0ZWQuDQoNCkkgd2lsbCBzcGxpdCBzaW1wbGlmaWNhdGlvbiBwYXRjaGVz
IGludG8gdHdvIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCjEpIEFkZGluZyBkZXZtX3Jlc2V0X2Nv
bnRyb2xfZ2V0X2V4Y2x1c2l2ZV9kZWFzc2VydGVkKCkNCjIpIEFkZGluZyBkZXZtX3BtX3J1bnRp
bWVfZW5hYmxlKCkNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=

