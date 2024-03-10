Return-Path: <linux-renesas-soc+bounces-3657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B77E68775C8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 09:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29D0F1F21288
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 08:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F483111A1;
	Sun, 10 Mar 2024 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BjaLA7u4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC2B1B7FD;
	Sun, 10 Mar 2024 08:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710058603; cv=fail; b=HV6LFB1mFIOHT6cZr9OLYKpp8PlGHN5/9pPK6fHoz7Fj/6lfw+0luYFPiDVqky/xD5eJiM42YqJquK2/n/cjvZ69iogVHb45RQGZMuTa6ekISWrC+k1B6qtXqpcbl1U/l1W8pYlnzFl4LwIdu3YwWGn+jrl+1P27MtMLodYmqOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710058603; c=relaxed/simple;
	bh=+6yyRtf4UBIvxcBYQd5UuyBXZtiLLRLzPvx7AMbe9EE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YccWn6zi/hUsKYYiYh6jBhpsU5nmX5xp7Ko0M/oxkdvMOsk9/cK4P/iCt76Tf6KRJlhKu+yoiO8FVAsDCjm3eP4mlfcLp8cjOt2b4KgS5BEEQLg5hD3UACN4RfUVGv5zl/qw3Wz0o25R5WFtPwpfhPZ2/786q3Gqn0IV4cl8F1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BjaLA7u4; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lODorB+1o6kU4Op40xazbYrGeN4LomdhL36CEYbk3NW9E110VZ10I0RzcHqLRG/B+PyDYDbxIs3/JLTAxp3pa0SyF3dqrkQ6vVKJzbDWwSxkihfvimfMSz+79nTi+weneTqn/uThpF0r4XP1aYQtFqOoAaF5QoMiid7GeXgFzIGrsvVoPrRsRa35vXaIyLt+QgL9q0WSuo9qj2/pUVWXfFs+titGTCAWb0mK+HEi/bjXM7i6b402PWk4ej3zQveL+V1A5R9gv1ZmdliLHkO5JUtYMfwrdph0H39LJra/xrifif5yAUsPzjXKxVK9vzQKxGoaiZG+CJsXdOmo92ICBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6yyRtf4UBIvxcBYQd5UuyBXZtiLLRLzPvx7AMbe9EE=;
 b=BmK2dIuluGzGXAQFpchkkK4YOX9++lOn1ydkpQELwa3sxdHpml9qEvo/VizjOd8gUTcm6VbZjzDtSamPm1CAk/Kz2Wk1nC8n2EAT98ta4eQU+kganoCS88LxfXvXbD78MwlYZcuc3iX87gWpDrG8I8YV3ydzAy6w3c1uKjW6gwLsTT/wv4CX4GNVK4DVPIvYTzNHWERRhDHGPOQKpNhICpx1IF9PJKhWEzGKl6RyH6DAUfTp2Sdav6lHfHJEgfkcornKJrQsLO0ISBsmVfceFkr1vXDFdN07K8owDdtfs1xUkJoHW5E6F53l/pku7iWCAw96dDtHVKqd4+GdcV8R6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6yyRtf4UBIvxcBYQd5UuyBXZtiLLRLzPvx7AMbe9EE=;
 b=BjaLA7u4m/ENCsdgix/15E23vfW9l4+CJVQZSjcG9N8CEONC0szieLWbjQ9K7zDwYOTdNLXrQ6F9fH3ytZRb/VjRvsssGCTy6C3RBJECCbF+E6/+zjjdBHJ32RcXVf6ISOby4V8442detj5Bm1HlN4FMxHbls1Ag7oZfc1XkFOE=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by OS3PR01MB9332.jpnprd01.prod.outlook.com (2603:1096:604:1cc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sun, 10 Mar
 2024 08:16:34 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b%7]) with mapi id 15.20.7362.024; Sun, 10 Mar 2024
 08:16:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs
 family compatible
Thread-Topic: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs
 family compatible
Thread-Index:
 AQHacYPMGWKOfJ8WCEqHUSv4i74FdbEvUfMAgAABIyCAAAOtAIAAADSQgAAR4gCAACQ3AIAAATtQgAENy3CAAASEAIAAANOA
Date: Sun, 10 Mar 2024 08:16:34 +0000
Message-ID:
 <OSAPR01MB158788EC4F6CFD47406AB9FA86252@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
 <20240308180919.6603-5-biju.das.jz@bp.renesas.com>
 <67819907-4366-483d-b71b-2646ffb076fd@linaro.org>
 <OSAPR01MB15874E48DD2269C2593DB55A86262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <ff569d52-f68f-410d-9897-9e1102171a1b@linaro.org>
 <OSAPR01MB15874A9DB0CE13AB0440242186262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <2821f23f-aac1-4b12-ba60-bc60da153d8a@linaro.org>
 <OSAPR01MB1587C505F324B11824AB6AB286262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <OSAPR01MB158700437A1D57805BAF349686262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <OSAPR01MB158719BA384CA9E730D051F786252@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <ed77f6a1-70a5-455f-a6d5-34ebfa931279@linaro.org>
In-Reply-To: <ed77f6a1-70a5-455f-a6d5-34ebfa931279@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|OS3PR01MB9332:EE_
x-ms-office365-filtering-correlation-id: f40d724a-82a8-4a62-18b5-08dc40da6660
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SzQ3u2UXxN6qc1QeolzdTUZ9Y74aVhxIgKqs/8BktJIGPLmPihppBoCAhwpu8fpFaIoaJLhbML8oWQgaFiP0ygtcoJzOlkXq6OEVOInsLljZ6c0JvOWmT3Ki8r6T6nrVhI/BaPDoQEpQIosoNLeWLrXYJZquEyk7VJ7IAZMw88KLJA+uvE4HsR0ANSt/1nHYBRFeG/uXvRrGeYELhwBFBT71Dh+KkGn7nHtdEnQ3TIOwo9UWb1S9nqYrpDwr5Pk58ilMRnBNmwcg+515R6tpmlmve5fMUxq7vRZQc5ypc8LT5lz+NDsekdLbaNhd1/YPX5eP1MTxxPn86JV96Bkgi3kV5m2oHsWDIIrWWzQyAiYc3PBvnjbx92sHuEw+9uKBSBDGJWdesV88hXmPS7BAb9cDWv6sPKN41LJamell6M1gIZ6m1N7RIWQbFWuKsQNDsmEN2cW2av5D0iMStDprmU28jyF8ctlCARKbXdTsdKucj5VY/B2nKEFQMOi0gWQx8rnRlBfryoXbsjkF1aPBPEToKzY402F3Sfb6OIBiMzvi0ZPJHDotI+VYIeYt1zDbpoetzt4yd21P94daqo4Ws9TRRGpY8VLjnxNR/xcEJEe4lEHyPU66/u2d9o1s6Lf3ff84bVS7C4jH3GzPSiSsNxryu+Skn9sp4d0WHE2lkhPCpcBM4VBTvIdnCnoVYMaazQnIyioJVv7i70MUDP6qloWG98EupetCMVuSN+GazRk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STBWVU1YRm8veEgvUG15WGdNRXBGT3Q0UUx1bEVvRTcwV3RZSlRYaFlGbGlQ?=
 =?utf-8?B?QkF0MDdMTlN3VzNvYWowSFJEZVEwWWNYZUJBNXJsTnhmSUNhR1A1SlpoL2Nu?=
 =?utf-8?B?UDJrcXBXM01NWUt4aUhSZnZ0WWVCMWRVdTdpWW01SlZ5WWZaUXMxd1gvQUZ2?=
 =?utf-8?B?SVErc21WYzZMaElva0h6cWtQZ24vQU4wZndmS1Ywa3hVMVZEbDRKcElUWDhX?=
 =?utf-8?B?S3ZQUWRkMDIwYmV1bkRMbTB2aDRDQXZoWTlQU3lURzR1bEVFb3g0bkcxWmlj?=
 =?utf-8?B?bU9tbnExT2N2SGJaOWhwUmFib3RvYjlXakg2Qk94aEdDVU5JWk4zMVByUk9t?=
 =?utf-8?B?QWl1aVBBNHpONHgyRXRVWmJVL3o5ek5MMnd6eFZ6NUdtRW9iZXV4NkFKbGtD?=
 =?utf-8?B?b1JiREs5MFV1MGNRdWVnUE4yc3p2bXNoVXo3SGFKOXBobWdjc1VLSjlUbTVK?=
 =?utf-8?B?cStzaUdvWW0yRjVIOVpnc1UxVnRFV0Y1NmpTY2VxWnhUcjNFMUU2K211aktO?=
 =?utf-8?B?cjhJQmZzbTVhRTBaNWZ6OUE1OTNoNTYxdGJQNTFRWnRoWFlNMk5henZ3SXRE?=
 =?utf-8?B?NFNnaXBTMnQyNVVoMVd4c2dwUzZVeDhjMVFBTXc0ajdEdGNmcjhqcGdMcXBR?=
 =?utf-8?B?YXJjeGJOLy9hTlhXL3A1RnNjYVZ4L3VBOHMvMWhhRXh1c0lhaEp6cVZZZGh2?=
 =?utf-8?B?bnBsdFhzSTFVUFJiNjNuaGExQXRKcHdDL1pjMmFpNW96ZzZLZEdCVnIvNlJi?=
 =?utf-8?B?bTZWUkxZQ2JJR29oZFpMMzdFb3l4OU9kVzVycDdiQ3hSUmRkc1pGaGFVcHJ1?=
 =?utf-8?B?bDlZbjQzbXBwemRYM0VCVUpsRlNKWVg3d3BXUUk1K01RL3NQUFM5REQ0QkpC?=
 =?utf-8?B?dVpORjJZbkhKN2l6Wm5JTldEWDVObm9uMDRqY1RNckkxRHI1anVSS3BuT1pj?=
 =?utf-8?B?TTdsRjEwRTUzRDJaYlFPenFEZFV4d0FSS0JjVnJBaWplTEhabUQ2QVU5TWRT?=
 =?utf-8?B?amJtd3lBamRqOE02RTZWakdyN2xQa3RhRVMrUFBZT0JOeklyZTVKenNzL2FF?=
 =?utf-8?B?UVVpVGI2OVlOMkcrNm5Fa1owaUpEWEFmeUp2QlliUytEUlpXR2dVUjlSR3Vs?=
 =?utf-8?B?dDM5ZFIzQmFtTlVsRDlGUEVRZFZFVlBPanBtaGRmR1ZkM3JzM1FucTY3NFpP?=
 =?utf-8?B?eXErMkNtczdLcDZTdm5TNlNtTllyYjZvdEFlVTkrdU9YVWpLTnZYOW5DTzZW?=
 =?utf-8?B?WnFVenI0Ykx4anRva1ZPd1RFaGltZmlXbDU3R3lxYzRzaW9Fdy83VkRxajhY?=
 =?utf-8?B?dDBMbzh4THp2elB6RlZrNnlHVDJlVjFDOTBHSTlBQjcxSTBGall5WUJqMmRx?=
 =?utf-8?B?MHJubGx1T0tuM0VuKzdxaHdTZ1BoQm1lcjAwTnY2SUVNK3pHM2cySGliZk5B?=
 =?utf-8?B?UVRuTXptRkZyUEJPSVEreHVnTTNCSHVlMFhIZTFpR3hWQ1VTQnNmOUdrNDcw?=
 =?utf-8?B?NnVjRVlXcko3VVRndU9VbnhEc3o4dWd0NnhYaDJjbkNBZGl6VFBIUm1UNjI3?=
 =?utf-8?B?Wi8rU1FFZ0EwRDVxbHoranEzSkpwWUxJVHM4aHFOUnVWa0kyNUI2MDhCSnM2?=
 =?utf-8?B?ZHNuWGV5dFVHd2FVYmFyL0dIOW4wRUd2OG9KZkFwaGtablNIUEFERG9BQ2xU?=
 =?utf-8?B?czRFdS9kUXdEQVJBK3RNVGZDZHIvSWVxNlFuMUZmdXFBL3BXeWl4dVdYcmlU?=
 =?utf-8?B?UHAyZWlOUXl0K2dmRjcxbzN3Z213ZzQzcTBaN0xpeWlJNDUzV2hwRmIzSkw2?=
 =?utf-8?B?cmhDQk8vOVAybElEcnpJVXlaRUswS0g2VDV0QWwra2QyTzVncEdnbW0xT3BO?=
 =?utf-8?B?UWtsSHZMY25xOVNuTEh1SHgrTE5hQm9YcGI3cUpEVVh3aUhOdWVwQ2Q0bFFr?=
 =?utf-8?B?S3U4WEZab3piMkpQdDJud2xPdlJyQ290VThMdFYyOHRjakczRHZoTFpJV0k1?=
 =?utf-8?B?VWRwemdSbzBYZHlIRFJjRzM2VVdxbTBMRTVvQ2pDcS9LZkZyL2Y3VExoREZP?=
 =?utf-8?B?eStHdmNMUzhDbTdCUEgwaGtwTUpidjZYZkxJaVI2UXJuanFFNjhVZXcwM01n?=
 =?utf-8?B?c2JPT25NZ1VuaVp4VjNXcHdrVzN3S1dHQ25WMDBjRmdOYWRvcFpCNFZoZFgw?=
 =?utf-8?B?VUE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f40d724a-82a8-4a62-18b5-08dc40da6660
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2024 08:16:34.4371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P3KCsuZi4vNo37uraajQy7k7eTA+yY0Zh9j2PTTT8ZK2c4tY0FUA5OmcTY+BIWTTMixuolMgLWJ27NXhg3x7tAjfNtlpAPlj92+vMSH1rfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9332

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IFN1bmRheSwgTWFyY2ggMTAsIDIwMjQgODowNiBBTQ0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDQvNF0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDdnMHs0Myw0NCw1NH06IFVw
ZGF0ZSB1c2JocyBmYW1pbHkgY29tcGF0aWJsZQ0KPiANCj4gT24gMTAvMDMvMjAyNCAwODo1Nywg
QmlqdSBEYXMgd3JvdGU6DQo+ID4+Pj4+IG9sZCBEVEIgKyBvbGQga2VybmVsIHdpbGwgaGF2ZSAx
NiBwaXBlIGJ1ZmZlcnMgb2xkIERUQiArIG5ld2VyDQo+ID4+Pj4+IGtlcm5lbCB3aWxsIGhhdmUg
OSBwaXBlIGJ1ZmZlcnMuDQo+ID4+Pj4+IE5ldyBEVEIgKyBuZXcga2VybmVsIHdpbGwgaGF2ZSA5
IHBpcGUgYnVmZmVyLg0KPiA+Pj4+DQo+ID4+Pj4gWW91IG1pc3NlZCBuZXcgRFRCIGFuZCBvbGQg
a2VybmVsLiBUaGlzIGJyZWFrcyBhbGwgdXNlcnMgb2YgRFRTLg0KPiA+Pj4+IFRoYXQncyB0aGUg
ZW50aXJlIHBvaW50IG9mIHlvdXIgYnJva2VuIGdlbmVyaWMgY29tcGF0aWJsZXMgd2hpY2ggeW91
IGRpZCBub3QgYWRkcmVzcy4NCj4gPj4+DQo+ID4+PiBBcyBwZXIgbXkga25vd2xlZGdlLCB0aGVy
ZSBpcyBubyB1c2VyIGluIFJaL0cyTCBpcyB1c2luZyBuZXcgRFRCIGFuZCBvbGQga2VybmVsLg0K
PiA+Pj4gU28sIGl0IGlzIHNhZmUuDQo+ID4+DQo+ID4+IElmIHRoZXJlIGlzIGEgdXNlciBmb3Ig
c3VjaCBjaGFuZ2UsIHdlIGNvdWxkIHVzZQ0KPiA+Pg0KPiA+PiAJY29tcGF0aWJsZSA9ICJyZW5l
c2FzLHVzYmhzLXI5YTA3ZzA0MyIsDQo+ID4+IAkgICAgICAgICAgICAgInJlbmVzYXMscnpnMmwt
dXNiaHMiLA0KPiA+PiAJCQkgInJlbmVzYXMscnphMi11c2JocyI7DQo+ID4+DQo+ID4+IE9yDQo+
ID4+DQo+ID4+IAljb21wYXRpYmxlID0gInJlbmVzYXMsdXNiaHMtcjlhMDdnMDQzIiwNCj4gPj4g
CQkJICJyZW5lc2FzLHJ6YTItdXNiaHMiOw0KPiA+Pg0KPiA+Pg0KPiA+PiBUaGUgZm9ybWVyIGNv
bnN1bWVzIGxlc3MgbWVtb3J5IGNvbXBhcmVkIHRvIHRoZSBsYXRlci4NCj4gPj4NCj4gPj4gQXMg
bGF0ZXIgcmVxdWlyZXMsIDMgcGxhdGZvcm0gc3RydWN0dXJlcyBmb3IgcnovZzJsLCByei92Mmwg
YW5kDQo+ID4+IHJ6L2d1bCB3aGVyZWFzIHRoZSBmb3JtZXIgcmVxdWlyZXMganVzdCAxLg0KPiA+
DQo+ID4gQW5vdGhlciB3YXkgaXMgdXNpbmcgUlovRzJMIFNvQyBmYWxsYmFjayBjb21wYXRpYmxl
IGZvciBib3RoIFJaL1YyTA0KPiA+IGFuZCBSWi9GaXZlIHZhcmllbnRzDQo+ID4NCj4gPiAJY29t
cGF0aWJsZSA9ICJyZW5lc2FzLHVzYmhzLXI5YTA3ZzA0MyIsDQo+ID4gCSAgICAgICAgICAgICAi
cmVuZXNhcywgdXNiaHMtcjlhMDdnMDQ0IiwNCj4gDQo+IEhvdyBkb2VzIGl0IHNvbHZlIGFueXRo
aW5nPyBOb3RoaW5nIGJpbmRzIHRvIHRoaXMuDQoNClRoaXMgd2lsbCBzb2x2ZSBhbGwgdGhlIGlz
c3Vlcy4NCg0KVGhlIHVzYmhzLXI5YTA3ZzA0MyBJUCBpcyBkZXJpdmVkIGZyb20gdXNiaHMtcjlh
MDdnMDQ0IHRoYXQgaXMgZGVyaXZlZCBmcm9tIHJ6YTItdXNiaHMuDQoNCj4gDQo+ID4gCQkJICJy
ZW5lc2FzLHJ6YTItdXNiaHMiOw0KPiA+DQo+ID4gVGhpcyB3aWxsIGZpdCBpbnRvIGFsbCBBQkkg
Y29tYmluYXRpb25zIHdpdGggb3B0aW1pemVkIG1lbW9yeSB1c2FnZSBpbiBkcml2ZXIgcmVsYXRl
ZCB0byBwbGF0Zm9ybQ0KPiBzdHJ1Y3R1cmUuDQo+ID4NCj4gPiBvbGQgRFRCICsgb2xkIGtlcm5l
bCB3aWxsIGhhdmUgMTYgcGlwZSBidWZmZXJzIG9sZCBEVEIgKyBuZXcga2VybmVsDQo+ID4gd2ls
bCBoYXZlIDkgcGlwZSBidWZmZXJzIE5ldyBEVEIgKyBvbGQga2VybmVsIHdpbGwgaGF2ZSAxNiBw
aXBlDQo+ID4gYnVmZmVycyBOZXcgRFRCICsgbmV3IGtlcm5lbCB3aWxsIGhhdmUgOSBwaXBlIGJ1
ZmZlcnMNCj4gDQo+IE1heWJlIGp1c3QgZHJvcCBpbmNvcnJlY3QgZ2VuZXJpYyBjb21wYXRpYmxl
cyBzaW5jZSB5b3UgYXJlIGJyZWFraW5nIHVzZXJzPyBZb3UgZGlkIG5vdCBwcm92aWRlIGFueQ0K
PiByYXRpb25hbGUgYWdhaW5zdCBteSBhcmd1bWVudHMuDQoNClRoZSBhYm92ZSBtb2RlbCBkb2Vz
IG5vdCBicmVhayBhbnkgdXNlcnMuIENhbiB5b3UgcGxlYXNlIGdpdmUgYW4gZXhhbXBsZSB3aGlj
aCBicmVha3MgdGhlIHVzZXJzPw0KDQoNCkNoZWVycywNCkJpanUNCg==

