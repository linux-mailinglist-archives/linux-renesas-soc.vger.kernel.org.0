Return-Path: <linux-renesas-soc+bounces-32229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BNRLEJz/GkEQQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 13:10:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 072BC4E7431
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 13:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F977300B446
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C1730B517;
	Thu,  7 May 2026 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DbLqfE2S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B533DA5A1;
	Thu,  7 May 2026 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151274; cv=fail; b=Z1u1fHmE4k13TfliFFP4vWln4Eu3Pyx3Mh+12oc+t/wGxsVSoFcJpM8uFod89yZoMnP1OQrwZQzxQVm7X4LrVNI8fmglwzY4RclPRnHIJVKJwsRXscViOnAd3Sv34epZDNUaZ25RQwGrqKKC6RyhrrSamV1YNcyVI1lDCgAFUqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151274; c=relaxed/simple;
	bh=yCn7II+DxmtYJcO9JPDxxgvj3paFzjP0IToyufaSyas=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fXh7jXsGkoqjEXEc/+M5eK8LhOYF39OpKTWjliDrEfaROu9zwHMN6ao1ZH0qvnXJNf1ChqDQIMHSaYIfBT9YYdhU8TykSJZGShuItYl8YCqROCY1bYDoHk2mf11sLvJFVVNiEI+/CnUSHiUHP1GbFo3xv9dm+M95rN2uC+GNDo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DbLqfE2S; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hC2K0ieivGtdHPPTd58+yzrKkR8TBLb6P6qTt93snRmwNFzDcxBMGb8Lq+5rbb6hqWrYrqXG5LgXlit+yxs6UckvLz/9OaUvhSkChNkQdHwmEsJPNQcRZE7jVj4GiuzUc+1ypyC39AVmRtXtmEVznvZFYX5aaahFpLQ3FLRtQyT71CvPSvDmFgNKmYN9xBi0itXVgjMLY5CYECeX87mTtJ1SaVAuV93z7FeN/5cBaB8TKOJ/jJC626HiySV1JV3Zu2xl34y0+dEue4tIlTZoP2ncPcdkF+c0xlO5zXBZDteg1dX5DC4kv4hFizmWRftDXXK7WVaQm2BPVK25ZYCWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCn7II+DxmtYJcO9JPDxxgvj3paFzjP0IToyufaSyas=;
 b=E1A0wJ+WyHwbm8WNhpLgN7tePLI2VkMrwv/Va+xWxBvWPeeVpMaDN1X4xYYVhU+AG5soRZIOWCAGFvuPwGp0lktN7I5GKMG4KpH9BkyGv4jVfwyiMumMsffGnQc0CSeLX4VGJM8Tw3dHolo+z30+FivJZOFQ/Ues+EYzZZyT8WIOyhcP3ERTXa0IfpETvAxS2lZ07G5qUu8p7WPI1pSGw3UFTGRZjPfcuG8d3FODwAGL/eqUl9hTfpss7CGQZpdpPOfeqjDEUJvUkcKmvQuMgwfwtvq3qvo0wwfTxqbLCwfpntMJL1Eyh5Aatw1k7m4AJvE8bn/dxDUVXYPeJ6lGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCn7II+DxmtYJcO9JPDxxgvj3paFzjP0IToyufaSyas=;
 b=DbLqfE2SK5JfkpUtOiIP/e34nfU+SrY8ArMduZOebyAM5J6vdMngn3xG+FsRyV5czig7z+y0iSK8Kdb9wPIkZ1BhIbDKuTQH2eFmdlJM9J+kpZPH5zuT8elXd039hZ/gSi3FB3O0RpoBNwkfE2O6M/VUX/oeS97exmGNNXFbvAg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB14124.jpnprd01.prod.outlook.com (2603:1096:405:21d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 10:54:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 10:54:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H
 and RZ/N2H support
Thread-Topic: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H
 and RZ/N2H support
Thread-Index: AQHc1/mtecx7Isor8EikWNsNrvFvcbYBcxoAgAACXYCAAOBrMIAAFXQAgAACQiA=
Date: Thu, 7 May 2026 10:54:18 +0000
Message-ID:
 <TY3PR01MB113460CD4F3609EEA898FE648863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260506195002.GA1778786@killaraus.ideasonboard.com>
 <CA+V-a8u8=mfR0zDJRNMEjnjrzFVAkOrqtro05Zgd1JFqGRByKw@mail.gmail.com>
 <TY3PR01MB1134676FA7479724BDCE40649863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260507103830.GM1778786@killaraus.ideasonboard.com>
In-Reply-To: <20260507103830.GM1778786@killaraus.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB14124:EE_
x-ms-office365-filtering-correlation-id: e0999bb7-70b8-4874-bd8c-08deac26fd23
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|3023799003|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info:
 5TA5XsufsEXuI4uoMiD6N0MqocK6QSTjL4hp8YrCc3CpJU6rufCtSlrzNdlgbJFhb418ocGKcWD8DVKHw30CrfJ2YH4YVn6i0ZI9dGs1UFQ3v5M7LrxdevF2p3f9/u2T48hllILN7OI9NIh2C4Qiuj/SwdeD+4IyV4QiOrQbw8s1iz04PxL6s953EwUCLIftl/4Ng0CjetwK4DQZKa89xXGejdrVZqONOTkX9A0UIOWCnmoVwr7fs5sybC6HsPlr6uIm6NYyI89edYIyXNZcuj8q8SoJF41XGNc6Z2yZKQ2YQdhaqmEsNSZO/TT7gzMTe/HAfShruSrGy3iFgpbf86M6UNWsel2J8PK68LMeEJaYlyanmTmjffX0qQtk3csnASsCZYsGEeAHhLXzUkdiezoGqRL1hmTZ5upgV8lsDt/+6Wjc7BKvPXOJAmc1YP87HIo1uGbha8CIuzQShcZF1gdgDCpN65gfIbwO7KFq7et/3hkDyEoX/9N5SFFxUqxYkQMBz3/nh/KbaQ+h3KXCmTjBczds+JJ3MztB62KoCTbmGGJK+1+q18I/ZYX97V9PAwzHBTUQ8zdlls/MjRl828k/EfTrT/Sb/0XxFSiJmbHSbdvf8Qqo4kyeFxtb/51nsFLvsuNtPqwts4JUUjvc+/CkH6skcKmo1XtQvNIGiYzbIxRlK8IV5C/OqdqFo5o3D+u4hFdJ1WAwg2NnHjWexGFrTn6vJL/Kx0tACSIrx0jSmWkSVSlB1HMPPMuBiuZ3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(3023799003)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MFVnU3Z0WktPOEtWNkNNMy9nN1EwUHlDUDVxQndxYS9XV1JTaEg1cWJ2aVE0?=
 =?utf-8?B?YU5jNytlRUVvYk1xeEYrSU5VeHpyS29Hb3BnVSs4OXhWWThkWXFlUUlkdGtu?=
 =?utf-8?B?SFBhWS9KOWhLcXMrUkwxSlJTUlFzMGhZckhyZk45SFByV25tMU1pbDVLSU1x?=
 =?utf-8?B?cjNIQkNzR002UGozc25oS001Tkd1L29BRkdGTExjcEUzdVA2dnArVFpPK2tE?=
 =?utf-8?B?Um5EWU1DNnlRUnNlVVVDUmZKSk5BRUR1MGRwYXA4TDBQdE43Y1V5b1hGRjU1?=
 =?utf-8?B?bjM1QmF3aXo1c2xUVEkvYW9ZbWs1eXpZWnVqOVBKTkd2c1pvaXMvZk5qVWhO?=
 =?utf-8?B?QnNDcHowZU9YYVZpbkVibEkrVzVaQkUrOWp3WWdlb1pmcXUrZ0lmVEJVOTIv?=
 =?utf-8?B?ZmJzek1KKzNPVkYzMGliTDUrSENMSXk1S0JUYWpsVlN4cW5CVHJJb0xweWRn?=
 =?utf-8?B?QnJQQzh3QkFQZ2lFSVg0RFMrMS9BTjBwU1VjYzJSWlhjN0kvazk1c1FzVGJF?=
 =?utf-8?B?cnR1dEVUU05aS0ljdjVDSzFzeTlrbzdLRVFBODUxWC9oT0J0WTZxT1M4Zk9n?=
 =?utf-8?B?ZEJxRFZmWEU0UFM1eFd6NWhQMGQwV3ArZ2xtcmdQU0ZIcDRZU1A0THU4dVFY?=
 =?utf-8?B?T1dmYlVNRWFPdlZqbytCTDh4d0FBM2kvTTFwRDQvbitjQmZJTTJYR2c2cUVm?=
 =?utf-8?B?QkRsV3JHdGJlcWNGandxZ2hJdmdTRnVhamVoVmsxVURGQ3gwN0hJNm90aFEy?=
 =?utf-8?B?V0hYd1JQaTZQSmJNSU5UNDZ1WWpRR25ONWtRWkw2WHVFYjhZU1R3VXFzcFI3?=
 =?utf-8?B?OTkveno2NWV5LzRZam13dENGTzZKRTdDM25tK0pIQS9SamEvUG1PUzV5YXhZ?=
 =?utf-8?B?UTg1WktnWTkyYVJINXArU2E3UlJvVUVia25nTk1PeVJxckZSU0RmVHMyZXpk?=
 =?utf-8?B?aVBlaUZ2UnlKUWRnaUpPb1ZjN0prY24vZjVGYzltZHgvYkloSE52bDNHMVFu?=
 =?utf-8?B?bElPQ0RuL2dOVkVMV0YvR3ErUEh1NStaRHN6Nzg2OUlmKzlCZG1WOVdaU2NR?=
 =?utf-8?B?TTUxRUcrTmJZNThzVzdIb1NTQjA3N2tkT0hldHl1SGNpR05mbGhRN3FiTjk0?=
 =?utf-8?B?WTRNUmx4RFlPQTlhODRmOG52VGRGcnZQaUt0L2ZOR2FSZjNHdFNOcFV4VmVL?=
 =?utf-8?B?Z3F6QlFKbXltTXZMZHFsY3B1N0ZtUVk5V0M4RU4rTW02VmdJUzVWK0FtWDM0?=
 =?utf-8?B?NnJiVnRaOVJwSms3QldzbVdtaXVobWYvUUNrZ3k2eWFuTVhnZURVWFZ1R1hN?=
 =?utf-8?B?WnpkOXdwYWZKYkY4aExWOEFUcHRWNlcrRUt5R3FoMVpRVjlNMks1Tm83anZH?=
 =?utf-8?B?djM3RHAyQTFnZENoQnZZajRyWHNJb1FiUVlCcmJpRDJZaWJzeU5lV1RqdVVZ?=
 =?utf-8?B?b0tINis4bGdIQ2M4RnZlYVZYeGkwNTZZMkxSdWFyQk56UjlEbGNYOU9LcGhK?=
 =?utf-8?B?cW5uUHNmRGZiR0FmQ1FPc05MSklYSGVuWExOQTN0MEpVTGFsRGdKdW9ZRk81?=
 =?utf-8?B?bjd5QmQ2NjdvMHRtK0NsMnBkcGp5aCtxcnBRQldMM2Q2ZEx4ZmlQaVBROC9z?=
 =?utf-8?B?dTZwTFBlNVFRbVlXWGw4eUl6dElKSDhWNVNZOTY5bnRHUHY4c0l4OG1LdStY?=
 =?utf-8?B?VTRHWEY2a1hrUE5DTHRXR2llWGlKa3NWMVROS0RRd1VvUzEwWHRrSnFMUjdJ?=
 =?utf-8?B?bDRac0xaam9GSUlCM1BRTFJ5RnVLVDFlb1lWNzFOc2xyclZMdldVd2ZhMlBT?=
 =?utf-8?B?OVB3V3UybWk5T1AwMU1rSmVRQzhRdWk1VU9RMGFWWDhMSnYzU2xqVnd1V2k2?=
 =?utf-8?B?ak5RTHZLWjZJQTQ0bm5GRWoyVUk5ZmhieFI3RU9sNDUxam5BSms0TmhMTkd4?=
 =?utf-8?B?SW1qMlYySmFES1NudGo1MkJoN0Q1TVZIRThTNHFmUFk4c25KclpBd0d1ckNR?=
 =?utf-8?B?ald6VnU0YjErekdEYUNSSmRWd2ZUQlJYMEpvWFJmZ2R6aU9zaXpMaG9LTGRm?=
 =?utf-8?B?Q2FNbytDUWxnY2tLWmdCamwvK1dGVmdLemhWSUVPNnJJaFd3VlgxTW9rUlBj?=
 =?utf-8?B?MUJNVWhJeEpKUEkwZ0VwUVFneVd0Vnowb3lkekhPR3kwUUhvQno3ZVZmNnRQ?=
 =?utf-8?B?aEI1bTYrNjI5L2I5UGdKU1VqNDZVNFVUcWFzdW5VTnFwcnNxZERkb0k2UHRQ?=
 =?utf-8?B?eW9wOWNhUTJTcytjcmtrMFlwcENON0loK0hwUithYXlLeWRwUm1VM2NNdEds?=
 =?utf-8?B?amFDenMzNm5wbjllNEpRNkdlK3FxbUlLOWp6TVdtZGE5V1VpM2lMUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e0999bb7-70b8-4874-bd8c-08deac26fd23
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 10:54:18.8807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fuesmz6aiSUCek5W7Pqzds8n0nmoaPGDcOt30GcDF1lMLXOybRAO4i3PmhhvXC8ENj/4cI+QHCI92EZNVNjNlZ8ZvXWTxACo3aRQ3J7ZTSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14124
X-Rspamd-Queue-Id: 072BC4E7431
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.94 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32229-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[20];
	R_DKIM_ALLOW(0.00)[bp.renesas.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	NEURAL_SPAM(0.00)[0.055];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Action: no action

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiAwNyBNYXkgMjAyNiAxMTozOQ0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDEvNF0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXMscnpnMmwtZHU6
IEFkZCBSWi9UMkggYW5kIFJaL04ySCBzdXBwb3J0DQo+IA0KPiBPbiBUaHUsIE1heSAwNywgMjAy
NiBhdCAwOToyNDo0OEFNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBPbiAwNiBNYXkgMjAy
NiAyMDo1OCwgTGFkLCBQcmFiaGFrYXIgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIE1heSA2LCAyMDI2
IGF0IDg6NTDigK9QTSBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+ID4gPiBPbiBXZWQsIEFw
ciAyOSwgMjAyNiBhdCAwNjowMDowOVBNICswMTAwLCBQcmFiaGFrYXIgd3JvdGU6DQo+ID4gPiA+
ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVz
YXMuY29tPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gRG9jdW1lbnQgdGhlIERpc3BsYXkgVW5pdCAo
RFUpIHN1cHBvcnQgZm9yIHRoZSBSWi9UMkggYW5kIFJaL04ySCBTb0NzLg0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gVGhlIERVIGJsb2NrIG9uIFJaL1QySCBpcyBmdW5jdGlvbmFsbHkgZXF1aXZhbGVu
dCB0byB0aGUgUlovRzJVTA0KPiA+ID4gPiA+IERVIGFuZCBzdXBwb3J0cyB0aGUgRFBJIGludGVy
ZmFjZSwgYnV0IGluY2x1ZGVzIFNvQy1zcGVjaWZpYyByZWdpc3RlciBkaWZmZXJlbmNlcy4NCj4g
PiA+ID4gPiBBZGQgYSBkZWRpY2F0ZWQgY29tcGF0aWJsZSBzdHJpbmcgdG8gcmVwcmVzZW50IHRo
aXMgdmFyaWFudC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFzIHRoZSBEVSBpbXBsZW1lbnRhdGlv
biBvbiBSWi9OMkggbWF0Y2hlcyBSWi9UMkgsIGRlc2NyaWJlIGl0DQo+ID4gPiA+ID4gdXNpbmcg
YW4gUlovTjJIIHNwZWNpZmljIGNvbXBhdGlibGUgc3RyaW5nIHdpdGggdGhlIFJaL1QySCBjb21w
YXRpYmxlIGFzIGZhbGxiYWNrLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVW5saWtlIG90aGVyIERV
IHZhcmlhbnRzIHdoaWNoIHVzZSBhIG11bHRpLXBvcnQgbW9kZWwsIHRoZQ0KPiA+ID4gPiA+IFJa
L1QySCBhbmQgUlovTjJIIERVIGhhcyBhIHNpbmdsZSBvdXRwdXQgYW5kIGlzIG1vZGVsbGVkIHVz
aW5nIGENCj4gPiA+ID4gPiBzaW5nbGUgcG9ydCBub2RlIHdpdGggb25lIGVuZHBvaW50LiBBZGQg
YSBwb3J0IHByb3BlcnR5IHRvDQo+ID4gPiA+ID4gc3VwcG9ydCB0aGlzIGFuZCB1cGRhdGUgdGhl
IGFsbE9mIGNvbnN0cmFpbnRzIGFjY29yZGluZ2x5Lg0KPiA+ID4gPg0KPiA+ID4gPiBXb3VsZG4n
dCBpdCBiZSBzaW1wbGVyIHRvIGFsd2F5cyBoYXZlIGEgInBvcnRzIiBub2RlLCBldmVuIGZvcg0K
PiA+ID4gPiB2YXJpYW50cyB3aXRoIGEgc2luZ2xlIHBvcnQgPw0KPiA+ID4gPg0KPiA+ID4gSSBh
Z3JlZSB0aGF0LCBmcm9tIGEgYmluZGluZyBwZXJzcGVjdGl2ZSwgYWx3YXlzIGhhdmluZyBhICJw
b3J0cyINCj4gPiA+IG5vZGUga2VlcHMgdGhpbmdzIHNpbXBsZXIgYW5kIGNvbnNpc3RlbnQuIEJp
anUgc3VnZ2VzdGVkIHRoaXMgY2hhbmdlIGJhc2VkIG9uIGVhcmxpZXIgZmVlZGJhY2sgZm9yDQo+
IHRoZSBSWi9HM0Ugc2VyaWVzLg0KPiA+DQo+ID4gRnJvbSBHM0UgZmVlZGJhY2ssIEkgZ290IHRo
ZSBpbXByZXNzaW9uIHRoYXQgZ29pbmcgZm9yd2FyZCBhbGwgZnV0dXJlDQo+ID4gU29DcyBuZWVk
cyB0byBoYXZlIHNpbmdsZSBwb3J0IGFuZCBtdWx0aXBsZSBlbmRwb2ludHMuIFRoYXQgaXMgdGhl
IHJlYXNvbiBmb3Igc3VnZ2VzdGluZyBwb3J0IGZvciBuZXcNCj4gU29Dcy4NCj4gDQo+IFJpZ2h0
LCBsZXQncyBjbGFyaWZ5IHRoYXQuDQo+IA0KPiBUTDtEUjogaXQgZGVwZW5kcyBvbiB0aGUgaGFy
ZHdhcmUgYXJjaGl0ZWN0dXJlICh3aGF0IGEgc3VycHJpc2UgOi0pKQ0KPiANCj4gV2hlbiByZXZp
ZXdpbmcgdGhlIEczRSwgSSBub3RpY2VkIHRoYXQgdGhlIExDREMgaGFzIGEgc2luZ2xlIG91dHB1
dCB0aGF0IGlzIGNvbm5lY3RlZCB0byBvbmUgb3INCj4gbXVsdGlwbGUgZW5jb2RlcnMsIGRlcGVu
ZGluZyBvbiB0aGUgU29DLiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIG1vZGVsZWQgaW4gRFQgd2l0
aCBhIHNpbmdsZSBwb3J0Lg0KDQpPSy4NCg0KPiANCj4gTm90ZSB0aGF0IHRoaXMgZG9lcyBub3Qg
cHJlY2x1ZGUgdXNpbmcgYSAicG9ydHMiIG5vZGUsIGNvbnRhaW5pbmcgYSBzaW5nbGUgInBvcnRA
MCIuIElmIHlvdSdyZQ0KPiBjb25maWRlbnQgZW5vdWdoIHRoYXQgbm8gZnV0dXJlIGdlbmVyYXRp
b24gd2lsbCByZXF1aXJlIG11bHRpcGxlIHBvcnRzLCB0aGVuIGl0IG1ha2VzIHNlbnNlIHRvDQo+
IHN0YW5kYXJkaXplIG9uIGEgc2luZ2xlICJwb3J0IiBub2RlIGFuZCBubyAicG9ydHMiLiBJZiwg
b24gdGhlIG90aGVyIGhhbmQsIHlvdSB0aGluayB0aGF0IHNvbWUgU29Dcw0KPiB3b3VsZCBoYXZl
IG11bHRpcGxlIHBvcnRzLCB0aGVuIHVzaW5nIGEgdG9wLWxldmVsICJwb3J0cyIgbm9kZSB1bmNv
bmRpdGlvbmFsbHkgd291bGQgbGVhZCB0byBzaW1wbGVyDQo+IGJpbmRpbmdzLg0KDQpPSy4NCg0K
PiANCj4gSSdsbCBsZXQgeW91IGFsbCBkZWNpZGUgd2hhdCB5b3UgdGhpbmsgaXMgdGhlIG1vc3Qg
c3VpdGFibGUgYXBwcm9hY2guDQoNClRoYW5rcyBmb3IgdGhlIGFkdmljZS4gV2Ugd2lsbCB1c2Ug
cG9ydHMgdGhhdCB3aWxsIG1ha2UgdGhlIGJpbmRpbmcgc2ltcGxlci4NCldlIHdpbGwgY29udGlu
dWUgdG8gdXNlIHBvcnRzIGZvciBTb0NzIHdoaWNoIGhhcyBzaW5nbGUgb3V0cHV0IGNvbm5lY3Rl
ZCB0bw0KU2luZ2xlIGVuY29kZXIoUlovVDJIKSBhcyB3ZWxsIGFzIG11bHRpcGxlIGVuY29kZXJz
KFJaL0cze0UsTH0pLg0KDQpDaGVlcnMsDQpCaWp1DQoNCg0K

