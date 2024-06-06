Return-Path: <linux-renesas-soc+bounces-5913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D578FE392
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 11:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A87781C20B44
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 09:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9EA17F36C;
	Thu,  6 Jun 2024 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fy4eas56"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9486917F364;
	Thu,  6 Jun 2024 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717667696; cv=fail; b=afHfHZI0eOXUC1V4KDHp8fxNM/neKrj3yy+B1+aaVeLvlzbJH5WRBLVujA7RvGqIYdT7Wxd9VZLyTRY5WiPOBeFg7ceIC6L/xP7MdZ8soXnpnlYIx8VpXCs8gt1ZwUJY4Wd5+G2uPcfnAa6KxUkrqOT4vpCqla5TF0i4YxgB8ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717667696; c=relaxed/simple;
	bh=CkE4ekxaUpzsOqFa/nrSEwTDbImI3VAT9YlUh2Sfazs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uS9Z0iq97f+GvdNoIDrBmsQruG5SvZLPf1YoHlx7XsHlLxyyNLkHj7m7PkME6AbhYHbSU35ssSesl0rRoQteUAMNFoFFfBpbgcNPgQIydp6rSqrD5LPA3NmpfiYChlDWKtCM4Lz2Y0JsILWRdykOFdV6/qh34BRHvVTypOvfvTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fy4eas56; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9ZVe1chvQK/IXsz53EElwefOOJZWLqqzQnxlv1j/32WhLlOQuOs9ChVaQ6N9KfIxuTOQM3Hjywv/8LbYhv9FFNSAbEgaRGRvAhHAZuP2Oa8zAxtZrTYZMz5rE4a/CxR/+i9OiyFpH1Z3gJJ6eP5DWv3yJ5x9VBueq5Dnn7A+W58oPgkhDF3lkRfno6Yd9fvZaSH1hqLJDSktM/DaZj6Nss9Hhkf7/t+Fgkz+p4ZoRZkcSF64z/NzsrcO8PcO3JjGdmDEixbusIizsgpQFlbxcMqYz9HOPyy//vaPDrJWuVE5QxSylYsHHaTXs0N1F+32v7YEqhSOnFGlUv5PrVTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkE4ekxaUpzsOqFa/nrSEwTDbImI3VAT9YlUh2Sfazs=;
 b=RScSN8CYLWz80aJoxk2gJUvYH2bEy5cSlAqbbShu7Jkbi/qdN5537Bmpll1lEtuVslnl3DX2KEoIi12onbkhQ5luejXOkNkfK1hKR11VnroZw+vP8WoxVOPtMPhJE33IqnBY8srFSiyTb5v8hPT+iSr4lq8/BvgoOp4ZxK3xclBb7Gmm5Y8ON9kBAhas7tAlv+RibBdSpn3T8AnElKjle8diGGUm0ZJma4Y4iROzAPHKjv9cCOMySyNfpx9bhwoMaWWFMsNm2WemVD0enSIkLQOgpJcMpi/Ni3bA+13dhh3Hv+RqN92n0Nu2Q2pGXOvzlILFRfqupbwWiOlkR7IoGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkE4ekxaUpzsOqFa/nrSEwTDbImI3VAT9YlUh2Sfazs=;
 b=fy4eas56EnoQkc+3VCugN0zipiFxWt8fdbL1v23LN/y8JA1vDkETvB4GK6fatxWU4PIi42wxX1T7U2KZn4kdDMK1xUGsNxntF3IoSKel/W6QUrWtasm3f490QiIHIn26NkQRt8xAoyNhn96wfO9bLdftud7K6TjVXXXdSTGMWm8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB9648.jpnprd01.prod.outlook.com (2603:1096:604:1d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 09:54:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 09:54:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Thread-Topic: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Thread-Index: AQHatxz0mhzMiwcEyEGyJWqnXXuc/7G6d+owgAAEWgCAAABWEIAAAtoAgAAAUMA=
Date: Thu, 6 Jun 2024 09:54:50 +0000
Message-ID:
 <TY3PR01MB113460FDBB675B96FD29D181586FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113464449FACE8364BF667CBB86FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tXLsfTvuCWDqiFkWbe=C2Coo8KF4GchbHPzOG+RTiChw@mail.gmail.com>
 <TY3PR01MB113468DD4C215E58B4499BAAA86FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tXp0sa_FiVzAkz2Uax1iv3XK90ug2KuKxuHRSP5Vfx1Q@mail.gmail.com>
In-Reply-To:
 <CA+V-a8tXp0sa_FiVzAkz2Uax1iv3XK90ug2KuKxuHRSP5Vfx1Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB9648:EE_
x-ms-office365-filtering-correlation-id: 11caa06a-a24a-4a51-518e-08dc860eb50a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|376005|7416005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?MmtrNFBua2tlYmc0Z0JsanNrRlMrVHJoa1BoTVgwcEN1aGc1UnpBbXFLQXVB?=
 =?utf-8?B?RzNLaUFQRTZ5ZTVvcWdDY2FKaEF0am9oYmx5R0toSDlVaXRnMWxLVmVwMkMr?=
 =?utf-8?B?emwrelFyL1NiMmRsMGpFK2VZQUhhbFR0T3did3dRZ1J1SFZWS2pxYmlnQ2gv?=
 =?utf-8?B?UkovMjIzYW1pT3FRYnN0NG1IaTRsL0xqUUlBUzRZeGRjNm5RMUk5NklBeW1H?=
 =?utf-8?B?NXVPS0g1OExTTHFPVklUdFVLT2NDTURtNjBIaUdtNytqTTRnOUJUWWM0NUZ1?=
 =?utf-8?B?TWpuSzMxb0ZSSG13bHFKWklaRWR2bmQ5dDNBUSt5WFJZY3RGUFVOeVBuTDlx?=
 =?utf-8?B?NGNUV3pvUlA0MFoxUk0vMExvR041bDA1dzFmRXhBYWlnYU9URE81TUlLZnRO?=
 =?utf-8?B?SXVHT1luWlQ2dlRzK2NpeXJYbW1RVzFJN050RVJxc0VPak1uNUJaU0VWUHpH?=
 =?utf-8?B?QmhTcE52VWtnNFBVQ1hMcnJGL3NxNXZxWkMrOHhKTWxwdUZGM05uV1NyTU5p?=
 =?utf-8?B?M1I2RW9ZazYyRzlSU3U1TVFFcGdpbW0vU2ZvajdjSU9zZnRpbFh2Sm14OHlG?=
 =?utf-8?B?Zzh1WC94MmRzQVhDUExQbm01TlBqVGdWWCtOL0FHQ1plaUJaWHJqRW5jNmhp?=
 =?utf-8?B?QjZEdlpPSkowdktkYjZpU1hHaVZsUFpUSTg2T2w3M2lLRXhpZ05kWUE5ZWRp?=
 =?utf-8?B?SHFZL2FnSUdjS3Bobm1RL05Cb0Z4ditFNGgxTVhBSElFYTdFWHIvdVBrQXJr?=
 =?utf-8?B?Tm9zTENvaVVSQkFaQ2U4dmxYQ1VLaTAyZWhPd1VMck5jS3g1QkdoV3J6MlNj?=
 =?utf-8?B?djJ2UWdkb2p4bkxPLzdkekdFN1ZOUEZnTUpDQkdnL0dGTW5XRzVhbUxKYmEy?=
 =?utf-8?B?eUZGZ291dnRORFhMMzVqL3FTTlNVK2ZQUmxXYlowNUNaZm9LTGltYUlDS3hm?=
 =?utf-8?B?cTVrdmRUMHNlNHNPRi9PQUVDYzFoRGtaN3JSZ3k0K3Mrb2tUT3hzdXFXRkow?=
 =?utf-8?B?Qkg4Q2xQZXRHZFc5S0ZibGd3d2MwQ20vUnF4QVowWS9pS2VIcHFJbk1MZUxi?=
 =?utf-8?B?YklPbjBDaFBOYnlkU2ZzQytwdnZOcGN0NXBucTlsUDM3OHREcUpGdlgrYm93?=
 =?utf-8?B?akpnUG1XSUlsNStkeUpSbHc2dSs0WTBmVC9ldUZPOW5sR1RTVTFXejVib0p3?=
 =?utf-8?B?dnlweENscW5UMktiU3A3cXpuQ3JSeEpXVXgrRUJhVnJHd1Y0Z085YXNWRS9p?=
 =?utf-8?B?ZFpGL3pSU2dDSjVjdlZ1QnBBcFRLWUwzd1FFdE13S2psU3hmV0ZtUVNuOGpB?=
 =?utf-8?B?c3hpS0U1a25SeEo2SEZReS9GTHMxc3o0R2d6S1QxUDVCRGZlVDRwTlpTK051?=
 =?utf-8?B?QzdXalUzS0JWMnZTY044MzdRQjgvOEVYM2JqS1dreUhZUXdFS2krenZWZXNx?=
 =?utf-8?B?dlhiMHJHbjZEQnBlN0xWd2RvdXJqOUQvdzBMTzlmaEo2RmtmMEtnR2FwUHRZ?=
 =?utf-8?B?Q3MzNjBrejJSNUZJWkpWTEIrQld3NDdnMlhjNWJWUlJtbElzdm5DeEhib003?=
 =?utf-8?B?ZnpkL3dsSmltMUowc3FvSmM5YjdsNlZ5S0ZMZnpxNFZjK1NaZjdJY1E5NEZ4?=
 =?utf-8?B?dnh2MWpiQXBvUlhnOHdzbUw4SXFMU3ZhWEVvSXA4cHgvcTVEV2l6b1YyNldW?=
 =?utf-8?B?YndlUlB2VDA4MTR2bEVIY1ZBT1ROL3JrdkdUdDhGWFFpREhQbU9xeVloWE5C?=
 =?utf-8?B?WFh4VUs4ZDBBTVEvdTJsQzQvbHJaZmF3dm1qbTVDWWt6ZFBuVGo1NGJBVVFJ?=
 =?utf-8?Q?Od69+Bv2TXriEuTET1wcXNRDPi9alB1uPTG0s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SE4yQy9UazFWWTQ0MkFMY1dCZmgxeHFvMTRRVDB6REhpTFJvTmhyT2FjZzNY?=
 =?utf-8?B?MTgxaHFaL2x5SjVIb1R2a09DS1VWbTFkTEREVGc1aDBBdlp6UDF4aE9RTGxW?=
 =?utf-8?B?ZVJxZGNqNFczc0M4ZVpFcUROelYrZHFpaGtIa1ZBeGhFdml3a3E5Wi81Vll2?=
 =?utf-8?B?ZDAza2E2TXpPVWpLZlpod285WmlDVzgrNmY3U3NPOXNzT2JBZ2xVQTBkVXQ0?=
 =?utf-8?B?Sk5ybHBpRk1YcVMrV2t3aWxlY3EzKzhmaHNLL1NXVDJzMEpuK0FKbTZKSVpn?=
 =?utf-8?B?Mm9kcTZyd0V1MGxnMlA1bkM2OHlKaGI4Rzl3VWNJZjVRTVoxRnJOQkFrREgv?=
 =?utf-8?B?cUNXRFRRNzBuUFNuZ0JGcUdRUnhFN2JSNEhQWmt6U2NoekF1NFdRdHVMdkNv?=
 =?utf-8?B?bW95Rlg5clpsZCtMaWg3MU5ianQ2dnZBZEFlNUsrZk5OcjIweXZCTGoyVFA1?=
 =?utf-8?B?VEdvRDVRV0d3MnhyZ2hqWFRMUzhzVVYyaUFUSk03SU83aUJPTUhURlZQNjBE?=
 =?utf-8?B?dkI3UVBrSDFsdWhxV3UrRFNIcTRucEN6MGFRS3hJOW5EcWpteDBUMUN0dmtT?=
 =?utf-8?B?SFl4dFJrZnRML2ROU0JWYWpGc2Fnem1aeHlMdFBzaUxuampKRmk0dWw1eHBo?=
 =?utf-8?B?bjZ2Z1VHNloyNUpqRUlFS0hPODI1MkF2OWpMakRHZ3VUdU5JS2JkZlh3aXdK?=
 =?utf-8?B?c0VCOFoxcEt5V2FSUmRZaEp4dWtGQ2VaZ24rYU1ITmIwVXBRQm04dDVzK2tB?=
 =?utf-8?B?MXNoTnc4c21XNnNGMTFOaEdyUk9GTUUzM3FTVXIra2hjUVpZUnQ2V294QXFZ?=
 =?utf-8?B?OW10amZJR29nY1VMSVF6VUU2MkhMZFRUWHRybm45dEdaemNzUlkxbFdxQWgr?=
 =?utf-8?B?b2VaOExpVmpJL0JrbzB5ZFZYMFFJcU5Fa1ZlZU5GUmFHTi9MNHlUV2hSQVkw?=
 =?utf-8?B?anN4ek41Ui9PSVdZWmRWTHhDQUFXV3IrVnMxT1Q0OU5xZ0pzK2JQZDVudndi?=
 =?utf-8?B?Ri9Gc2ZESDZXcE9Ia3l0VTU0VTBpNGlTbmUvbGZ6UVFuck5JN3hibkkwRHdK?=
 =?utf-8?B?VU5UL043S29EQlYwSzV3N1FCRXRRNUNkWnF1bDZtWFBNSjZCeG9Hd0xJUlZN?=
 =?utf-8?B?SkxvanpzWnJFZHlnWGNmUXBUb2t5ZFJhRnZmTUFPWUxJSGlGVnZ2cWQxeEE4?=
 =?utf-8?B?NjlXQ1lDZDhtdzJhd25RWTFPUU1HSlRhR3FkdnVnQ25wMTZBL3ZpN0pOYXlZ?=
 =?utf-8?B?OUE0a2dvemplVGdmck1ucnNLMnlaOTV3R2FUeTlyd0lvUm1CaFdCM2tWZVN6?=
 =?utf-8?B?VWdXTHFybVNiS2JKN2l4SXRSUWdlbGlnalNEU2lrRXVCOHVsOHN1M2tWTkF5?=
 =?utf-8?B?MitwWHJrOVg3cGlSZFFERjNlclhwNkl5bFhkUXBwOG5iSU9RaDlCQ25ZRWxK?=
 =?utf-8?B?L21rR2c5SzJWbUw3MCs0L0ZCVnB4bVFyb2RnYWdYM1Q3SllDeGZRbGFBYWx3?=
 =?utf-8?B?M3ltZU5lTHZqcWpFcmk3Mnl3ZW1ybVYrajdjR3hSbzFuYVIyOTlDZjRnVFFh?=
 =?utf-8?B?eVBCSTYwMFA5U0RlVWtEaUYxZ1pNL25aWkdtU1I5ZEI1RGRjL2xaSHgxVGlm?=
 =?utf-8?B?Nzl2ZzFKUTl4dkVyNHhBaisybVA0cVhad3pqRkNqcE9iZU84Mmx4NWh0dXdY?=
 =?utf-8?B?SGdUODBqY1gyYWtYSGRIazAzdnNzTnFtc1IxYk83ZTI2MFFtSHRwMElTeFh2?=
 =?utf-8?B?MVgyTHlNRmZiajJkL0Qydi9LOEJvbTZIRUQ3WEpUTGZIaDA2RW9pTW9Kby9j?=
 =?utf-8?B?dlU2OWhOV3dKakJHR3ZGbzcxbWt6WHR1L25EQmwyOU1iRjhPbHVJME00cEtZ?=
 =?utf-8?B?cFZCZmZ1OGQ5ZWtEU3pYd05DN1I3YXRsaTRCRFN0dUQrdTNhdERtOUNRcUgv?=
 =?utf-8?B?anBxRXczZDhKRXJvZ043S1EwRkVpRk04cmlyTzdjZGdNUFdMeVM3N3Zubk1K?=
 =?utf-8?B?UlFaQzFleWNaUG1WTTFyaGhuWUQ1UkhXY3psUFc3RTFuRWJOcFkxdUJDVGlk?=
 =?utf-8?B?c2dtVHk0eEN0dk13a1hvY2Qxb1J4dnlkTTJRd1JSV2NjUlRjMEowK25Hdlpr?=
 =?utf-8?B?eE1QRUxaUGRWVVY5OGZMNFpBSEJGdDkvSktBMkU5MStTK3l1OGE3eG51ZHRO?=
 =?utf-8?B?M0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 11caa06a-a24a-4a51-518e-08dc860eb50a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 09:54:50.4173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cQQIZWndcIuNkOHJAm1PJVkGHHb35X7ooMdqXxr5+4RTqbhFFDQDjlWucF8wW8QBh1firKypeMp3iD4NOFBGkehkbFgo89rY/XzYIn6iYtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9648

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSnVuZSA2LCAy
MDI0IDEwOjUwIEFNDQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+IENjOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgVWxm
IEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+OyBSb2IgSGVycmluZw0KPiA8cm9iaEBr
ZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29u
b3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsNCj4gV29sZnJhbSBTYW5nIDx3c2ErcmVu
ZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT47IExpYW0gR2lyZHdvb2QgPGxnaXJkd29vZEBnbWFp
bC5jb20+OyBNYXJrIEJyb3duDQo+IDxicm9vbmllQGtlcm5lbC5vcmc+OyBNYWdudXMgRGFtbSA8
bWFnbnVzLmRhbW1AZ21haWwuY29tPjsgbGludXgtbW1jQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsNCj4gRmFicml6aW8gQ2FzdHJvIDxmYWJy
aXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQgPHByYWJo
YWthci5tYWhhZGV2LQ0KPiBsYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UkZDIFBBVENIIDQvNF0gbW1jOiByZW5lc2FzX3NkaGk6IEFkZCBzdXBwb3J0IGZvciBSWi9WMkgo
UCkgU29DDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBKdW4gNiwgMjAyNCBhdCAxMDo0
M+KAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4N
Cj4gPiBIaSBQcmFiaGFrYXIsDQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+IEZyb206IExhZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWls
LmNvbT4NCj4gPiA+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDYsIDIwMjQgMTA6MzggQU0NCj4gPiA+
IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDQvNF0gbW1jOiByZW5lc2FzX3NkaGk6IEFkZCBzdXBw
b3J0IGZvcg0KPiA+ID4gUlovVjJIKFApIFNvQw0KPiA+ID4NCj4gPiA+IEhpIEJpanUsDQo+ID4g
Pg0KPiA+ID4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KPiA+ID4NCj4gPiA+IE9uIFRodSwg
SnVuIDYsIDIwMjQgYXQgMTA6MzLigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBIaSBQcmFiaGFrYXIsDQo+ID4gPiA+DQo+
IDxzbmlwPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gK3N0YXRpYyB2b2lkIHJlbmVzYXNfc2RoaV9z
ZF9zdGF0dXNfcHdlbihzdHJ1Y3QgdG1pb19tbWNfaG9zdA0KPiA+ID4gPiA+ICsqaG9zdCwgYm9v
bCBvbikgew0KPiA+ID4gPiA+ICsgICAgIHUzMiBzZF9zdGF0dXM7DQo+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ICsgICAgIHNkX2N0cmxfcmVhZDMyX3JlcChob3N0LCBDVExfU0RfU1RBVFVTLCAmc2Rf
c3RhdHVzLCAxKTsNCj4gPiA+ID4gPiArICAgICBpZiAob24pDQo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICBzZF9zdGF0dXMgfD0gIFNEX1NUQVRVU19QV0VOOw0KPiA+ID4gPiA+ICsgICAgIGVsc2UN
Cj4gPiA+ID4gPiArICAgICAgICAgICAgIHNkX3N0YXR1cyAmPSAgflNEX1NUQVRVU19QV0VOOw0K
PiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgICBzZF9jdHJsX3dyaXRlMzIoaG9zdCwgQ1RMX1NE
X1NUQVRVUywgc2Rfc3RhdHVzKTsgfQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4NCj4gPiA+ID4gTWF5
IGJlIHVzZSByZWd1bGF0b3Jfc2V0X3ZvbHRhZ2UoKSB0byBzZXQgdGhpcz8/DQo+ID4gPiA+DQo+
ID4gPiBUaGlzIGlzIHRoZSBQV0VOIGJpdCB3aGljaCBpcyBub3QgbW9kZWxsZWQgYXMgYSByZWd1
bGF0b3IsIHdlIGNhbm5vdA0KPiA+ID4gdXNlIHJlZ3VsYXRvcl9zZXRfdm9sdGFnZSgpIHRvIHNl
dCB0aGlzIGJpdC4NCj4gPg0KPiA+IFNvLCB0aGVyZSBtYXkgYmUgYSByYWNlIGJldHdlZW4gcmVn
dWxhdG9yIGRyaXZlciBhbmQgdGhpcyBiaXQ/Pw0KPiA+DQo+IE5vLCB0aGVyZSB3b24ndCBiZSBh
bnkgcmFjZSBiZXR3ZWVuIHRoZSByZWd1bGF0b3IgZHJpdmVyIGFuZCB0aGlzIGJpdCBhcyB0aGUg
cmVndWxhdG9yIGRyaXZlciBvbmx5DQo+IGNvbnRyb2xzIHRoZSBJT1ZTIGJpdCBhbmQgbm90IHRo
ZSBQV0VOIGJpdC4NCg0KSSBndWVzcywgc2luY2UgaXQgaXMgcm13IG9wZXJhdGlvbiwgdGhlcmUg
aXMgYSBjaGFuY2UgdGhhdCB0aGlzIHdpbGwgb3ZlcndyaXR0ZW4gaW4gYSByYWNlIGNvbmRpdGlv
bi4NCkJ1dCBtbWMgZHJpdmVyIGlzIG1hbmFnZXMgdGhlIGNhbGxzIGluIHNlcmlhbCBmYXNoaW9u
LCBzbyB0aGVyZSB3b24ndCBiZSBhbnkgcmFjZXMuDQoNCkNoZWVycywNCkJpanUNCg==

