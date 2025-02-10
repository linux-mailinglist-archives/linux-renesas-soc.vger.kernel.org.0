Return-Path: <linux-renesas-soc+bounces-13004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC043A2F00D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 996143A716D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC5125291E;
	Mon, 10 Feb 2025 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JnkdAnPr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8CF2528F6;
	Mon, 10 Feb 2025 14:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198531; cv=fail; b=Lng9F54PVRNu3Fz2FR1whqTu3hkl8rAflDUbYAoF562QlL+nrUIhL4P5XwuqSIYdPsFJx2cu+i+mouYRaa2zlBdRS99nwMgcHOrvNvsdNkKSmKQfbCs6h/XrcSZLOy73GVld0FhU1m/faAmbqxqmpzK2ryrgaHtesR8DCpJGFBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198531; c=relaxed/simple;
	bh=lDYxLroffYYC6NDRrlb6p2XpoejjO41aN0FN0UwsVu0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tkRafpAyOjmYhzgJ5AGjUSuoRQk8fr80mWWANrDcO3kL7Fo5bK1oXMQf1oAnk2tfAzk7flOmD3n4XZ4HJUZvFyUZH3P+vu67eHeDI7nkuP5X2vOCTLM0xc9gyV1aLNiB7fxxRl+Z9XvPxqY6pS3FHVAVjR1xPWVBtQvM4vgCYBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JnkdAnPr; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htm8UMzvTpIPWuK8AFUQMbym2nWkFjvT8BEduV1Ivv31gt9bgv3i1epoGbeFoOn6F5FOUBCYr0j3YutjKwnF2LyHTYsd01jphtXM+GiYhukX/6+nJJWjTIfYzmQK2Gq/KsoaqsCD7ChGVU7wveBQOvwkPD9mPNB6YyVmAVnkeJFc+i6Ejj4A491JjM0FG+fZ+Nb0M3mv4xGlTNzx3wJkKcj/RlEIiG6CZlEqgM1YonkUMs8ybrlVCdJ0xqVxIPrTMBKhqrvEf1R2pSig4Mlh/sL5/4O/P2weNCBgftRUvaCI7C9vwo8O7fDZ+S6escpyRrZUtZA9Id9ZjsIGhzfxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDYxLroffYYC6NDRrlb6p2XpoejjO41aN0FN0UwsVu0=;
 b=lz63jRs/0C3Ktklcfh6Itoh+te6Hr0jECf+kDqgcUrO2Mw+Tg36wuMvLCX0TahaHA7lbHkwvRKTVLEG25n6FUgxIC46s9mKcq7f5EiFMf64jJuctgRv1dO+HVw7UHsQWCad478Wq++LzbDseBzDve9OS7ebXStVZuBtsPu2MQAGxJVp51HfRUozQbENOsHS9E1Rcj60sr2ZXyz/iVy2UZ4UAjBXxIfPKaKI9fyMTdl9UHDKSlApjd4+1LTcuOu1U5a2azOvssvR08d4x4XzOP5OuwA8dCwWGNHj5M9lZ3XlcoU9oJ1Vrp2vFfkTcoEiLeBcjmkJ8r4/TLh/izd11rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDYxLroffYYC6NDRrlb6p2XpoejjO41aN0FN0UwsVu0=;
 b=JnkdAnPrqq4vCHaYwTRlvagWCKUY8EOtgygVk4i7UTJysC3PPsk48qDC/zQjZ6Pk5YcRvKkU1QX+t8zHjxx6LBhQGy0vdMkO0h3ZBhFYHh3rIDHTSvbfkmCh86TMd6MXTdvKtQNi9aXX7NOUtHq75uMjM31HkrxTZkOpwKyzEro=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10425.jpnprd01.prod.outlook.com (2603:1096:400:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 14:42:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 14:42:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
Thread-Topic: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
Thread-Index:
 AQHbcm43r4oLrSpVA0ON7evH4m8LNLNAlqCAgAAAnrCAABBIAIAAAZ4wgAAEBACAAAF94A==
Date: Mon, 10 Feb 2025 14:42:05 +0000
Message-ID:
 <TY3PR01MB113461CABD5E18F03B7BE9B8486F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVB2W6R+xYeTUKSv_dMGruECSft-P19m6nZD61=ROngXw@mail.gmail.com>
 <TY3PR01MB11346D5D895C190EBE8C8A84B86F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUpaV71Svyenq=hXMk3GfjgZvHn-0APkv_LKSzyytKzag@mail.gmail.com>
 <TY3PR01MB11346D0C3FA9E451ADD3F5BB386F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWDd4MawW_cybPTy+3Sc6-9t1-ZF9_V+mPQHTHNnmEg2A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWDd4MawW_cybPTy+3Sc6-9t1-ZF9_V+mPQHTHNnmEg2A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10425:EE_
x-ms-office365-filtering-correlation-id: c7a1f4fd-2fe4-4673-3bf5-08dd49e116b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NU40OEI1dllKcEcvN210Z2h6UFArdFdxSXQ2b3dMdS9zbldHR3RHbDlHdE83?=
 =?utf-8?B?UGJMY1A3emJQc1oyeENoT0hHVFpyVlRtZzJQRHZaQ3RUV1d5Q1RXNmhYaXJu?=
 =?utf-8?B?Si9Ob1RmNjByMzB6alRjMnFQajVFUEtpRzhDYVpPaDhuRGRxcmEzT3lzZDVo?=
 =?utf-8?B?SE1Zb3hsRGtpWkpzemN6MDBQUjZjbWpBTWZCNXpBZGVaZ1U3bE9vaEpOS0Fu?=
 =?utf-8?B?dXZCS3E4dmtyK1RLMDJQOXJSU1lKcHNwVEVqZ0NRMGtSczdMSkU1b25PMkx6?=
 =?utf-8?B?OGVSS0tzM0pDZVAxeWNUS2xzRDdBTnE3dk9GZHg4WUY5cHpzMlNFNzl6UUJm?=
 =?utf-8?B?d0dnTC9SeVFFRTZpK0FPTjh4TFVMU3A4NUVxWmljcWFneGV4ZVdUUkRNZWxJ?=
 =?utf-8?B?TExUTi83SUN3cGtiWkFSVktJcElseXg5bldSUVhxdTQ2andqOS8vajBzdXNh?=
 =?utf-8?B?NENvNS9Tb0dwVkxsVDhIbEt0UzA4T1NIQ1JGemJvaFBNNzJVTC9rRjk1VWFi?=
 =?utf-8?B?UTc4UEJqbjhlcm8vVFZ1SjI1ZjVpMk1TNGJhQ1RyNXFZelVrazNOM1M5YWhx?=
 =?utf-8?B?RGdZWk1xRlhRWHJiVzZaMlpLRlhFcXdEbXB2RTRHYVNHQm5FTnlza3VMamFp?=
 =?utf-8?B?c08xc1ZpVzNxVTJDUWgyV3hXTk8xZWhxeFYwb0ZVT1hqdmRyU3k1bndHdmNi?=
 =?utf-8?B?aTVVZ3N2NDNiajNIcStmTlpKYUNnR2tLRGF3SGVtY25WWmd2RFNnMldueHVI?=
 =?utf-8?B?Y3kxMWhVWC81dXloOE1pMHhYcFo0WlR3a2NiT3hxQ3hHa3RaLzdMaEJXK1ho?=
 =?utf-8?B?N2NQdS9LK0x2djJmc29JRTNVdGdHMkFGU2pIdkp1dzNwTjFUcmZFTENmZDlO?=
 =?utf-8?B?d2h2TE1kRTVGY0VBME1BNkM4QTZoZFVXTU1Nd2MvTTA2ZE9IOXkwakh1bVhT?=
 =?utf-8?B?bVFrajBxOTB1ZmxsclNqeEJDWkxJSUxrcVJlUzhSalROUWYvd3ZCdmdlQnVR?=
 =?utf-8?B?eXE2a0lWRm15ZDJRV1VscmxMMFd2Rk0zY09BS1JMY2J6L2ZiMVZvYjk3TTJ5?=
 =?utf-8?B?SnhQa2NneTUwUG5pcEk1enNONnYvRGtiR0ZJeERtRkZlUmcwV3hCaUM4Wkpv?=
 =?utf-8?B?VmRML0lWcXFLRnlON1pmWDhaMU9hY1d0V3RuV25RVnUzczZidnB4aWJmVEln?=
 =?utf-8?B?cHhES29aa3NrcGlnN3lMdksxZkVFWGorLzdkVFVtTlNuZTNrRW1iYVZydEl6?=
 =?utf-8?B?Nk56REt5VWdaeUlJRHZpU0E4YTg3MWcwS0FQWk01MWlqb2lReGxxKzNETklm?=
 =?utf-8?B?dEd3UmhVbTJ0bUlEb3VkUlJqc1Fwc1dEdVVWTDVRU3lXbHN1aHVBWmZCVkt2?=
 =?utf-8?B?dUp2ek9OTlZvcFQ1cDZKOFcyL3VWV3QwSlhoRFU4aGpuZ1o0VzljUXN0Rkc2?=
 =?utf-8?B?dDZ4N3ZFTlZmSjRNSE1lcnhOaWc3YTUwemFGWkJmZ21jM3MxNDFFV2hIVm5m?=
 =?utf-8?B?SHRBcHFUczRYdi85YVFFY1ZoUHVndUlHVUdHaVI3MU9hUVQvTnpPdEhweHE3?=
 =?utf-8?B?RG91VWN0a1NQeHozazFRN0NLVkFJOE5maW43RW9LUk9Ma3ZUWmxEWFVHQWpE?=
 =?utf-8?B?OEtzK1lFckdPTER2WmdLVEdRZHdUaEFqZmJkQTRXYi81ZUhJRlE5dlltQzRN?=
 =?utf-8?B?VVR3NWRoc1JFLzVsc0swVWlTZWpSQjRaS2tCampqbytRRklqNFZGT2hWbUpl?=
 =?utf-8?B?V0RSUER6Sk92MHRtekh2a1JKa003Y1RPNUtMWml3UmxjM0psNlo1bFJ4VUYv?=
 =?utf-8?B?aHZ3S01CU2o4WGlROFg5L1Z2dmU3WnZxNTMzakY2K2UzY04xY2ZWSStaMnF2?=
 =?utf-8?Q?cYj41rUd/oK+7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2MwZ1NmVU9sRW9DNUVJaWFVZ0NhUlYvODZOUFdHMnpaemdBL2tiUFlRcHc3?=
 =?utf-8?B?ajlBNEJyUDF0MlVMSk9pODlsbmdKZktETFR6cFdkQXpJVGtidG1YTDJHdTAy?=
 =?utf-8?B?T05icUcvTFNnQTZiVER1YVl6UWszRHdOb0dhODBVMXVPdThEeTBPRDJMSGNS?=
 =?utf-8?B?TzREeXI3dWY4V3B1OWcyZFQyMjNVOG5UWHBZbUhITlBMMFlmVlBmdEpRTXYr?=
 =?utf-8?B?aHo3NFUrb21uRnFETU95VElyejA4Z0ZIMGtaQkRKQmVOTWh4VnpNd2lmbHRT?=
 =?utf-8?B?Zk5pN3JGYUdqUlVpUWVBR1BnVVk0Q085OStXaENCazlJSmtZdVBwYVlybU1k?=
 =?utf-8?B?QWNIVTRYNGhmVnNpd0V1UytWL1NMNC9DWlRlcytMa0tpSUhZb0dsNDE4enBZ?=
 =?utf-8?B?ZTQrTUhoR2dBVlRndkdIcnk2WnRJRW5sSnBKU3pKeWtMeFNJc2NuNDhUb3Fh?=
 =?utf-8?B?VWVYcXdTSXdkOUtOcnk3d1pDZzlCS0Q4MURKVXZ3dlFjWVpYZmFjem14dEd4?=
 =?utf-8?B?Ti8vV0d1ZFVWdDF4TGF3VGRCdnU1SHpuNVFxRDFpU0pUMkx0L0JvT29HYTA1?=
 =?utf-8?B?d01xdG9LdWI2c3AvU1ByY1BsQ21DeWo2aGdHaGp1S2ZlVUVCemhPRzZVTElJ?=
 =?utf-8?B?aGZvbHpBNXF4aFNVNHVDb05MNFVNRjZyZWtZekQ2d3FBUk0yVmlwQjM3TVVu?=
 =?utf-8?B?cmpWSzNnTFhJTEk0WjZNcDNBRm5ZbWppY1d5WVFydEYzdWp0T3hDemdBZDZo?=
 =?utf-8?B?R1B2Z0c3NFNSaUEzYk5IbityMVllUjZKMy9FZ29PU2M5dzQ2ZFVuRmJXMGd6?=
 =?utf-8?B?U3Job2pacS81OXhuZTd3TGpIQjB5R0pMK0hiREI3NnNHWlBMUEJ4L0c1N0lp?=
 =?utf-8?B?YmdPZ014cUZCMnZJVzR4NXpQdldLNTE2aWVYTjFkQmZaTlRsTFJQTnJXSjly?=
 =?utf-8?B?UW9WSWdHSGp6ZC9EajBnRUlrRzhZdFFUa2xNSVNCWEJWaHhlcFNoOUtqb2Ft?=
 =?utf-8?B?aFFuVUpPcTRITUx5RWdRYkNKVzdlcHB4anFDTDRrdks0NUJ5aWh4dS9xWk1Q?=
 =?utf-8?B?VHdkRWhEUDR4a2RjZWNPdUxaMXo5U0hLTE1SOFZlRGR4N0g2SmVyNStIOVcv?=
 =?utf-8?B?aVpzZnNzMHZ3MURvRHVCSEZoeml0YUE1TWtvWG5sZEFaZ3NJeFRLQTJhb2lp?=
 =?utf-8?B?eEQ3NWoxd1VyZDFBK0o4clpSRll4UjQ0bVh0S09oYVNjV2Nva2hYYWoxbEFZ?=
 =?utf-8?B?dThXVVduTzc4QmlJU2kyVk5DL0dBZFJ3RFgrQVg1c0d5L3lkTXdzMEJzZFNX?=
 =?utf-8?B?SmlWK3loSGgxZFIzSzB1bUc0bDFXTVFqTElCVlV3aHpMdHpjbDBFenErSFEw?=
 =?utf-8?B?VndnWmZKcHJCSXdoYmMyMVA0SWl2aVRrQlAxVDc1RnNBa2dLc2ViYUI3Wi9m?=
 =?utf-8?B?NmxyY3ExbDNjQXZaWXFBVWtJdzlPYWJoNmoxOW5zRFZHc3BPdm1zblJTT29x?=
 =?utf-8?B?RGhtSmkyM1ZUc2FPTDZIWnI1T1czN2dJTDdLS3AxUXljZE5sb3hmZE5nMElO?=
 =?utf-8?B?Vmp4OUNLeG1RblpDbTdhL3cwZHdDRlNJc2Q1dC9Vc2VsbzJVRW0xNmhnekFM?=
 =?utf-8?B?WnREeittWmpPM3lvdnZ6R29JdDZpQm11TWRzU0NlaWZtZXlIS2R5L2oyS0tC?=
 =?utf-8?B?aGFNWWtwd1o0R2pUM1dvNmtuamF5Z1pZUDhQZjhXSVdNSmxDalVTdHBRM3Y5?=
 =?utf-8?B?VGFSTkRCY1UvZjZTd0FScUtoN0UrZjF1cUR4TG9UVm45S0cvYmpHK1FubVp5?=
 =?utf-8?B?SGFnRjFEaVArVk82aHFJV1ZMZTRDeU9RakZZcmQ4Z1RWZDQ2QXVJL3RYTzRV?=
 =?utf-8?B?ZWZ3a0RUTHE1VzBSNHJDek5aTnJSSmFFdDI3TXNZZXFVc2tTODlKampIZ2hq?=
 =?utf-8?B?Q1grSFI3YnRNT2tsSlFlMEgycitlY3JZbHU3c1FuWXE1d2FwdU5iTUo4aGF4?=
 =?utf-8?B?dXJZSmpFRmlRcEhLNGpYMGlkNE5TWGlubWVzSFo5MmZOdk5OdE9VaXdUNVpz?=
 =?utf-8?B?eExmb0h2RFFqV3UxQXpOcFcvQURQL1lndFk0a09jaFVOQTVIblNycVRpY2VW?=
 =?utf-8?B?VHc4eHNJQXZzcHhEcTJqME5vTkNlK0ZCODV2eUJmUnpKTjhGNGtOREhkRGVi?=
 =?utf-8?B?bEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a1f4fd-2fe4-4673-3bf5-08dd49e116b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 14:42:05.3169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +aauaqCSx7e2rz64VSa1mMDHLVvQmm3HOeeZdik/vhOPXWSiDGof3aN/kTs//84lhxEkCGbTwenrVsRQuU+vWv7xNfpbsh8HORPSiIOxbXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10425

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTAgRmVicnVhcnkg
MjAyNSAxNDozNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAyLzE0XSBkdC1iaW5kaW5nczogc2Vy
aWFsOiBEb2N1bWVudCBzY2kgYmluZGluZ3MgZm9yIHRoZSBSZW5lc2FzIFJaL1QySCAoYS5rLmEN
Cj4gcjlhMDlnMDc3KSBTb0MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIDEwIEZlYiAy
MDI1IGF0IDE1OjI2LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3Rl
Og0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4gPiBTZW50OiAxMCBGZWJydWFy
eSAyMDI1IDE0OjE1DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDAyLzE0XSBkdC1iaW5kaW5n
czogc2VyaWFsOiBEb2N1bWVudCBzY2kNCj4gPiA+IGJpbmRpbmdzIGZvciB0aGUgUmVuZXNhcyBS
Wi9UMkggKGEuay5hDQo+ID4gPiByOWEwOWcwNzcpIFNvQw0KPiA+ID4NCj4gPiA+IE9uIE1vbiwg
MTAgRmViIDIwMjUgYXQgMTQ6MTksIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4gd3JvdGU6DQo+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4g
PiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiA+ID4g
PiA+IFNlbnQ6IDEwIEZlYnJ1YXJ5IDIwMjUgMTM6MTUNCj4gPiA+ID4gPiBTdWJqZWN0OiBSZTog
W1BBVENIIDAyLzE0XSBkdC1iaW5kaW5nczogc2VyaWFsOiBEb2N1bWVudCBzY2kNCj4gPiA+ID4g
PiBiaW5kaW5ncyBmb3IgdGhlIFJlbmVzYXMgUlovVDJIIChhLmsuYQ0KPiA+ID4gPiA+IHI5YTA5
ZzA3NykgU29DDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBPbiBXZWQsIDI5IEphbiAyMDI1IGF0IDE3
OjUyLCBUaGllcnJ5IEJ1bHRlbCA8dGhpZXJyeS5idWx0ZWwueWhAYnAucmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA+ID4gPiA+ID4gRG9jdW1lbnQgUlovVDJIIChhLmsuYSByOWEwOWcwNzcpIGluIFND
SSBiaW5kaW5nLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFRoaWVy
cnkgQnVsdGVsDQo+ID4gPiA+ID4gPiA8dGhpZXJyeS5idWx0ZWwueWhAYnAucmVuZXNhcy5jb20+
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxyenNjaS55DQo+ID4gPiA+ID4g
PiArKysgYW1sDQo+ID4gPiA+ID4gPiBAQCAtMCwwICsxLDEwMCBAQA0KPiA+ID4gPiA+ID4gKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0K
PiA+ID4gPiA+ID4gKyVZQU1MDQo+ID4gPiA+ID4gPiArMS4yDQo+ID4gPiA+ID4gPiArLS0tDQo+
ID4gPiA+ID4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zZXJpYWwvcmVu
ZXNhcyxyenNjaS55YW1sIw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gInJ6c2NpIiBpcyBJTUhPIGEg
YmFkIG5hbWUsIGFzIFNDSSBvbiBSWi9UMiBkaWZmZXJzIGZyb20gdGhlDQo+ID4gPiA+ID4gc2lt
aWxhci1uYW1lZCAiU0NJIiAoc29tZXRpbWVzIGNhbGxlZCAiUlNDSSIgb3IgIlNDSWciKSBvbg0K
PiA+ID4gPiA+IFJaL0ExSCwgUlovQTJNLCBSWi9HMkwsIFJaL1YyTCwgYW5kDQo+ID4gPiBSWi9H
M1MgKGFuZCBtb3N0IG9sZCBTdXBlckggU29DcykuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBCVFcs
IEkgYmVsaWV2ZSB0aGUgdmFyaWFudCBvbiBSWi9UMiBpcyBhbHNvIHVzZWQgb24gUlovTjIsIFJa
L1YySCwgYW5kIFJaL0czRT8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEhvd2V2ZXIsIGJpbmRpbmct
d2lzZSwgdGhleSBhbGwgc2VlbSB0byBiZSB2ZXJ5IHNpbWlsYXIuDQo+ID4gPiA+ID4gU28gcGVy
aGFwcyB5b3UgY2FuIGp1c3QgYWRkIHRoaXMgdG8gdGhlIGV4aXN0aW5nDQo+ID4gPiA+ID4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9yZW5lc2FzLHNjaS55YW1sPw0K
PiA+ID4gPg0KPiA+ID4gPiBJdCBpcyBwcmVzZW50IGluIFJaL0czRSBhcyB3ZWxsLg0KPiA+ID4g
PiBSU0NJIHN1cHBvcnRzIHNjaSwgc2NpZiwgaTJjIGFuZCBzcGkgdGhhdCBpcyB0aGUgcmVhc29u
IHJlbmVzYXMscnpzY2kueWFtbCBpbnRyb2R1Y2VkLg0KPiA+ID4NCj4gPiA+IElmIHlvdSBwbGFu
IHRvIGFkZCBzdXBwb3J0IGZvciBJMkMgYW5kIFNQSSwgeW91IHdpbGwgbmVlZCBkaWZmZXJlbnQN
Cj4gPiA+IGJpbmRpbmdzIHVuZGVyIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy97
aTJjLHNwaX0vLg0KPiA+DQo+ID4gT0ssIEkgdGhvdWdodCBzaW5jZSBpdCBpcyBhIHNpbmdsZSBJ
UCwgd2UgbmVlZCB0byB1c2UgYSBzaW5nbGUNCj4gPiBjb21wYXRpYmxlIGFuZCBpbnN0YW50aWF0
ZSBhcHByb3ByaWF0ZSBkZXZpY2UgYmFzZWQgb24gdGhlIGRldmljZSBwcm9wZXJ0eSByYXRoZXIg
dGhhbiBzZXBhcmF0ZSBTQ0ksDQo+IGkyYyBhbmQgc3BpIGNvbXBhdGlibGUuDQo+ID4NCj4gPiBZ
ZXMsIEkgYWdyZWUgaGF2aW5nIGRpZmZlcmVudCBkZXZpY2UgY29tcGF0aWJsZSBmb3Igc2FtZSBJ
UCBtYWtlIGxpZmUNCj4gPiBlYXNpZXIsIG5vIG5lZWQgdG8gYWRkIHNwZWNpZmljIHZlbmRvciBw
cm9wZXJ0eS4NCj4gDQo+IEkgc2FpZCAiZGlmZmVyZW50IGJpbmRpbmdzIiwgbm90ICJkaWZmZXJl
bnQgY29tcGF0aWJsZSB2YWx1ZXMiIQ0KPiANCj4gQ2ZyLiAicmVuZXNhcyx0cHUiIGhhdmluZyBi
aW5kaW5ncyBpbiBib3RoIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9y
ZW5lc2FzLHRwdS55YW1sDQo+IGFuZCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cHdtL3JlbmVzYXMsdHB1LXB3bS55YW1sLg0KDQpUaGFua3MgZm9yIGNsYXJpZmljYXRpb24uIFRo
aXMgaXMgc2ltcGxlIHNvbHV0aW9uLg0KDQpDaGVlcnMsDQpCaWp1DQo=

