Return-Path: <linux-renesas-soc+bounces-2056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E518429DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 17:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E91F1F26AA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 16:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E983D86AD3;
	Tue, 30 Jan 2024 16:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jvYicR+1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2100.outbound.protection.outlook.com [40.107.113.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492E636102;
	Tue, 30 Jan 2024 16:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706633251; cv=fail; b=D1COWfU0QKkUSQGBFCkJQFl2ehYpMb6XOF6xbxwGhpW9McQODOjqwzfNIw03HNWyPvEQj1vYc/qbvBSyMf9xN9Zu6iM2pc9/n5J3s3oR7ZiwXMTQImlvrKNZomZMHJNPFG9NYjzzgOWbNagfpgAqYooLEUEnOf0M+RaJ4xJFswg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706633251; c=relaxed/simple;
	bh=BdECZOkEkUB3FYgZRCH9XTZqO4AYLV1Z/srTCHESB4I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XIWk49pnHhlybmKjBF4AV75ajC9AEdRXsuHWOrQx5yiW3rJWRooNRAqbq9VUAdVFoaJx2yPPBtwRcfie+vS0/nq5kfdhtrleFgyDbaEhE3sfvqG9+WNVHaS0uQ6KKbUDbeY2VhGHG74k+Uny68h84zwOsvQ5vT6DxWaX86YPGtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jvYicR+1; arc=fail smtp.client-ip=40.107.113.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/roAcrR6KyPTsOqxxcuaa6PFaTCoGgfBCAxFbx/LNh7SnURjJxdnfzE16D9JpnEapgnAshHoxmJPtLuf4abyv2J7gSNUWUhkmsi48yhj6NtbZPOPxR/CFDAcGtuW8D/HaW5nol8inL8aCVTtndbHwlBv6lDxK7BMflaR2KdQ7cXTadhfSIDSLGPU+HQvDl4NYopIhy3aSzdJzi4zSR74lnnVqz3DFc1ilQ1E0mU22/DUnHPYnYqFlB8GWPUcwPMt73LCyAam61tY3ii/ppveb99YwaHB2aRzRv68ET0l39TGYjKcj95317pBKkUXsJyGU7qyMEMNXEPbX7cFxWzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdECZOkEkUB3FYgZRCH9XTZqO4AYLV1Z/srTCHESB4I=;
 b=Dcw+ppCEjDN4wiR9f7WH7+Kzl7re+PbC4o4C4VhNY/pQga+H3pgPRI1/iCFfOEsGxvrtMHebQMs/LODQKcYjtCZS9ONh0KWD2eOyEs3KFUnoA+mo7zIRrDFP+S0G1D9eNcFT45Z1aoRzYOruVr1ft7JBPI+eDJCeWzUoLelmkyIeHacbItLDN099GTSZ951p/sWIMIbwo/7gce60gC5vNMCLN+Yn95A1ccjpBnSzCpLMIxsLUsDilkVS98BO2t8QeiYjq8RaSvqL2EKmDCD8CXO7J89EfB/dPj1oIUiMiDqanyMPl0DkX585QHwpYSPchNx3AUYe9QwWlAsZeRPZdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdECZOkEkUB3FYgZRCH9XTZqO4AYLV1Z/srTCHESB4I=;
 b=jvYicR+1yp6OfPbytBS8oqzLGE9W/DZYk2b6i5DJTNouYPV3WH+6c8uTZPE4wykFV5e7w57UvKwzOVK2k6+UUzGisrzv4CbF4kpxaXzcplNk6eqpRHHLp7ffn+9BffKLzu+acqvs8+XOXDdOgRk75XPdzCdHT9gxnJqX6/kTo3Y=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB8590.jpnprd01.prod.outlook.com
 (2603:1096:400:13d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 16:47:26 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7249.023; Tue, 30 Jan 2024
 16:47:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 4/5] arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI
 support
Thread-Topic: [PATCH v2 4/5] arm64: dts: renesas: rzg2ul-smarc: Enable CRU,
 CSI support
Thread-Index: AQHaUFwAEOHof+dOcke3p7EaDpk3srDyjtGAgAAIPVA=
Date: Tue, 30 Jan 2024 16:47:26 +0000
Message-ID:
 <TYCPR01MB11269CCF27E2982AEE1A7C3A1867D2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
 <20240126133116.121981-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdWR8qO_eZ_nECewVWFCnFnGiuq_q4FzJV+d_-XWWpTcsQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWR8qO_eZ_nECewVWFCnFnGiuq_q4FzJV+d_-XWWpTcsQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB8590:EE_
x-ms-office365-filtering-correlation-id: b5fb30de-2327-4b24-8471-08dc21b323b0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2algAZzyqxc84YZB+YSxvvjEcUbjNkMDx5ELUD/sp8CYSQK+yUNrtUic4fYSpggKkRK3Kes+qToUCU/WXgkb9V6HzJJOBz/uaJgtNE2rYvxOGoY58OPQde0oCTw9dUQhXtQbTIjy5wdZU56jgRqW41/ZsCaLBD37FPJDVcWGX9dd80KnP8Khk7RS9dEEfAU6poAD1eLXF71ViQIxkoF55ltr84j12rCyKYlY2ETgAC9HvAUXzoMSLEz5zKvSMYqYIy1c9dmbmUuIa/q2uMhXdb9tvZL03Rt/tsQ8LvtQeAgG33eEDFJlOlQjW0lscJ5/Tq3NwqQyL7Cbkpkt8by8JTGsBZbq723W6Gfbg04dXkQdHr/Ud6LKxe/uI9xWaIvnd/S3Xa/q1UKtcug2wSM6bj2D416VdGHp6ZHRvJQPGGn4BF0SIPSMLTpw93uNqYaV0XEyL3ey4CyIUvg88LhoF5zD43ZCWwva74vtndBISegCjomVIOvqaEfnNWdTz20oJU04ho0J6OiezUUhRAlkx0v9L/C6MidndawvQ++zq5xxyQqRNmdkhRZ0SUopm9IScmFf8T0XTxWC1uAI3gtPBGzJtXYdwqx2Wl+qv4PKlXv7Kfe04UFILIdlpElX6sxb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(346002)(39860400002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(8676002)(122000001)(76116006)(316002)(64756008)(66446008)(66946007)(66556008)(66476007)(55016003)(6916009)(54906003)(4326008)(53546011)(7696005)(6506007)(86362001)(2906002)(8936002)(5660300002)(52536014)(38100700002)(33656002)(38070700009)(83380400001)(26005)(9686003)(41300700001)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3BqMnNJYU5JcjFSVVdoVHZXejM3ZHhiTUNZSDEwaE9tcThBOHhaZHJONytj?=
 =?utf-8?B?REVwVFZuVDJmaUFlajh4emhsV09oUEhiVEYva1FGNXVROUpqcEh2STQ0ZFNn?=
 =?utf-8?B?OUJwb0lwbnVMd2U0VEMrTWFiNjdVUEk3V2NTN0hPTktWY3YyZDZocllZTFhE?=
 =?utf-8?B?aTU4M3J1b0xaN3VGQS9ZTU16blFBdFh0ZmN1VUZ3dXVDM2NzcjNXZElGZ3Rn?=
 =?utf-8?B?TExpMUllR3hodGFTNmY1cngxckJ3c2FiNExxb01FRFd2QTNabTZhbnJpZWg4?=
 =?utf-8?B?M2hQbTE2eUppcktmUWRVQmtIY0J1T21CV0VvWjJvY1V1bXUxSjd3a25OYmEr?=
 =?utf-8?B?RzRlS1NSWnBpNzExSzRNVUVkWFREUFYzeVpaWkEwUE9CYW1DRk9Pb2NJSTJM?=
 =?utf-8?B?WWZnRW0rYldzK3RIN3R5dVYxQW1uK0NKNTFQZEI1bFN6bDNaMEp5SS9WMEVr?=
 =?utf-8?B?TUFINVRzUEliVlJnN1V6bkFsdmpEbmdyRDB4TFIzczRTd3hsV3Q2UXozdE41?=
 =?utf-8?B?U3hBMHY4MHE5NnlkSjd2bms2OElTYTJxWGRCNkRPWFMzUXVtdG1YUkY5MkE5?=
 =?utf-8?B?aFRaK2RHUVRYTDNVQmhBbmVlV25wcW84VVRoMTRUL0JUTkl1Y0oyaVFZOFI4?=
 =?utf-8?B?cUxnUUVxU05YV3h5ZUFTNkN1dUZaenl4ejB5QTJkSGxlaWQwTGNxZWNDajdw?=
 =?utf-8?B?emo3MjFCQzBVQ0JjeEMvb05XWHVqTGxpTnlWMnBnYXVkbUQyYXBSOUpYZE14?=
 =?utf-8?B?dk9EM2JmVTVQRDB5T3JPS09VcThac01qdFpucytBUElXUURRR0dGY0xBZkxK?=
 =?utf-8?B?bDA1MENORUNqUnB3N0RaTlhwNERmTEZHNURFajFuOWN5V25heVd1bzV1QmJR?=
 =?utf-8?B?bzFGNE1YUXg5NjZRVmw2Q0gzZm9xZEo5Ti9vYnFVT2tEdnZyU3RpT2k1Q3Rp?=
 =?utf-8?B?bzQ5cm5sdTU5R1c3K1pka0VWQWpESW1BcmNBR0t0SXJVY3FSeUFqR1B0elN3?=
 =?utf-8?B?S3ZRT3ZZbFlLbFdQYTNKSElLeTFMM2hpdjlhZnI3K2Y3a3JQTjZMUWxRUWdV?=
 =?utf-8?B?a1VtWVFIRDhhbWxDbndqNnNUa1JFeEZLVG1lVTBpRG9iMWwydndOTTYwNW1i?=
 =?utf-8?B?M2JzU1NYVlZPUUxJSDltdExLa1BGdFZnbEEvWlptdHVlL1BqQml6KytkeE14?=
 =?utf-8?B?bVg0S0pqcWpJcGMvSEN4OU9sRVpJNE1YVXR5c1o1SVlvaXY4cU9jNWVmQXVO?=
 =?utf-8?B?YVlvcGlmTGc2REJTd3NRYzRoK1JhTzhzTXg0L25YczJYM2xDNGVuRVNnNW9s?=
 =?utf-8?B?RzdHd1NaOWJZVHlVZjM4VWlqdlFneVEzVjVjdE9MNXNPZWkrV3BtT1ArdHdq?=
 =?utf-8?B?VVlxano0VlBMZkt0YklHNTF2ell4K1A5YytlSXYzZmxZWTZsMi9ObVJTdTAx?=
 =?utf-8?B?MHdnU0Z1eDJOVFg5OUhSTlF1RjNyYzk3RnlIQWpKV2loU2J2MURveHRjL0dh?=
 =?utf-8?B?bEp0cmtvSit4Vm8xanl4REpvZktFR1FhTlhpOGlOS0kvYVAzT2ErWnc0bzBW?=
 =?utf-8?B?UXNTdHlwZDMzWVZ5ZTUzbXlQdXVTckNaQjZic1J5YTlxbnVaTDk0cTBUZDcx?=
 =?utf-8?B?cmREd2VSbW9VQXpJaEE5bmZuS0VJQmZZTlA1ZFdKREhLdXdNZWthOGYwTDFt?=
 =?utf-8?B?UkxubU9lbkFzU3p2ZHQ1SDVYQ0V2VGlTSytINDlWaHJrUUZaWEpqUmxSUVRw?=
 =?utf-8?B?dGpOWEx5MUw5ZHIxMGNTWW1GTzBNZU1MaENUV0dXcXJBRGg5ZXRzMWk2bGlX?=
 =?utf-8?B?QWhCRGdrTjV3OVJ3cW1aWFdyNkNTbXQ4b2tRMzFnQmZTWUNQeDNJbVBEcngz?=
 =?utf-8?B?N2lhYkJjZEpCS0JLQVZNcUdxeElOYlB0UWpuUVB3NkRsRVE2Mk43OC9DMitG?=
 =?utf-8?B?ckxpeG9HSnJZV2I4Slp0NHd0aEtTV3cvRU9WVkRGRUk4NWlDaVRSM29iVGtB?=
 =?utf-8?B?eENSRnd4TmhXSVI3WE4zZmVnRXQ2dmFhN1ZCc1EzNzZpY0s2cjFsL3ZWa1RD?=
 =?utf-8?B?SENWQTRqUWdCR2Q0eXNRNTZ5YWFrekVQRmhRVWJ6a0lzWW92ZDZWWUgwTTFt?=
 =?utf-8?B?RDgzejB6RXF3TXdhbWFVdmRVVkhWYVJtR0owSUN1bXM3cW9mL05BbFNFdzIv?=
 =?utf-8?B?NHc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fb30de-2327-4b24-8471-08dc21b323b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 16:47:26.1136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vmqGSTMpulzN+SKNgCbAFcVpLLhfQmKqSu+x9nmMYtWieQ99o9G+Mp5GMlKWXq9A8SWrA+rWX9c7RmPht1PhnAsCGQvDD/wQ3Oom/IuuV2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8590

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMzAsIDIwMjQgNDoxNyBQTQ0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyIDQvNV0gYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMnVsLXNtYXJj
OiBFbmFibGUgQ1JVLA0KPiBDU0kgc3VwcG9ydA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZy
aSwgSmFuIDI2LCAyMDI0IGF0IDI6MzHigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEVuYWJsZSBDUlUsIENTSSBvbiBSWi9HMlVMIFNNQVJD
IEVWSyBhbmQgdGllIHRoZSBDU0kgdG8gdGhlIE9WNTY0NQ0KPiA+IHNlbnNvciB1c2luZyBEZXZp
Y2UgVHJlZSBvdmVybGF5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiAN
Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUNCj4gPiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUNCj4gPiBAQCAtMTA0LDYgKzEw
NCw4IEBAIGR0Yi0kKENPTkZJR19BUkNIX1I4QTc3OTY1KSArPQ0KPiA+IHI4YTc3OW01LXNhbHZh
dG9yLXhzLXBhbmVsLWFhMTA0eGQxMi5kdGINCj4gPg0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9S
OUEwN0cwNDMpICs9IHI5YTA3ZzA0M3UxMS1zbWFyYy5kdGINCj4gPiAgZHRiLSQoQ09ORklHX0FS
Q0hfUjlBMDdHMDQzKSArPSByOWEwN2cwNDMtc21hcmMtcG1vZC5kdGJvDQo+IA0KPiBNaXNzaW5n
DQo+IA0KPiAgICAgZHRiLSQoQ09ORklHX0FSQ0hfUjlBMDdHMDQzKSArPSByOWEwN2cwNDN1MTEt
c21hcmMtY3J1LWNzaS1vdjU2NDUuZHRibw0KDQpPSywgd2lsbCBhZGQgdGhpcyBpbiBuZXh0IHZl
cnNpb24uDQoNCkNoZWVycywNCkJpanUNCj4gDQo+IHNvIHI5YTA3ZzA0M3UxMS1zbWFyYy1jcnUt
Y3NpLW92NTY0NS5kdGJvIGlzIHJldGFpbmVkIGZvciBzZXBhcmF0ZSB1c2U/DQo+IA0KPiA+ICty
OWEwN2cwNDN1MTEtc21hcmMtY3J1LWNzaS1vdjU2NDUtZHRicyA6PSByOWEwN2cwNDN1MTEtc21h
cmMuZHRiDQo+ID4gK3I5YTA3ZzA0M3UxMS1zbWFyYy1jcnUtY3NpLW92NTY0NS5kdGJvDQo+ID4g
K2R0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0MykgKz0gcjlhMDdnMDQzdTExLXNtYXJjLWNydS1j
c2ktb3Y1NjQ1LmR0Yg0KPiA+ICByOWEwN2cwNDN1MTEtc21hcmMtcG1vZC1kdGJzIDo9IHI5YTA3
ZzA0M3UxMS1zbWFyYy5kdGINCj4gPiByOWEwN2cwNDMtc21hcmMtcG1vZC5kdGJvDQo+ID4gIGR0
Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0MykgKz0gcjlhMDdnMDQzdTExLXNtYXJjLXBtb2QuZHRi
DQo+IA0KPiBUaGUgcmVzdCBMR1RNLg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9l
dmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0N
Cj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4g
bGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzDQo=

