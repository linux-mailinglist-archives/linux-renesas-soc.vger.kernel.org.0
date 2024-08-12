Return-Path: <linux-renesas-soc+bounces-7813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 949BE94ED41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 14:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23EA21F23284
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 12:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5651017B4EF;
	Mon, 12 Aug 2024 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uZ/k9f9E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB7148837;
	Mon, 12 Aug 2024 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723466565; cv=fail; b=cpXHyAg1c+x8Jxv49U1iZi1qdlSet1ktyxVq71alVk9F4I96A+5zwlFSzmpWvuHIG68hwMhM6Pr/RJaoSA/M8mQCzz3mshBBmUIpZHTCxZhQvIB7VA7Xz3wynj2NFm0HPc3yv6NS7eCnIMCZCrLPu0ztNo7JtyuSb2agVMsESSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723466565; c=relaxed/simple;
	bh=UCaFlvz7ZSomBmNuTw35dKEQRFENegFhlEfZC9PPAzI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jDYun9egPSNTBm5kUV2GRzOzCnd+HWmvPNabySFEFLMb1glyHUwlwTUF0A1qrYtb1ehtls+kjHmCHTHxrLQHg36k9UawHOA3oeo8WlFDmXJT0w87/87/D8gdrszmsHyxevtGYVfVqutc1DXA0o++LqeB9/GOwoMfY2RJLUSSc/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uZ/k9f9E; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8Gbyw9MIMY21HehDAOHt+137T6uY6J9QZAjAQ/naCM73eqpr2dfve5W8cwQ/9w6p0mq0VZ4JbdjBN/kLzg/vPdC79h8M/cfgLCHcVwHsW5sWRN4cf4bRiHrJagpLkkymhz/qmf/7l14I1cwd2IkHt+BRa7MFeDDwLTKVjNHX1pZ3C3mXFPRvJxqSAd7cR3QvcGbujnn1rl2Alsa5938sIBPz6p1QMvSoVMgq1oEAUXh9zXPjH4sle/+wcMlsiBl7hOpePoj4+HjMW2b5ZXeOSXFT6FD7DYouUw4z88bNhrFhOJOwPKMqe5daEpMUuEpKLu68e79eFNv0S36Y8CCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCaFlvz7ZSomBmNuTw35dKEQRFENegFhlEfZC9PPAzI=;
 b=KhCY/vu0U2LoAnEcj/BxYw+4Ota2lCGt623mpAoqdLO8jtgMcH4ppDqyHEpGiel7JcDMlB+U7K8fIlnB0Xd4ceMSI81BUTYSbTkXqOzIKxGp5aXkJOtudzAz5vAlriBfrZjDZDlvN2VOHLRfnOKXNavbjGBmxbjGKAELEV8F0uMfq6zjn8xGJMYBwKbw4Z3gL5EFzmwvsLwCeeSVqGddO9qNOpgtnkboAM2YXbwwuIok/MnodpCWK6Tif9sJ+EumZmjH28PL+5qqEdOgQqplGbCgYdW5HZS4pVS/V/l5bLwKA+UahBRNEu3T4V1cp/ci2U5gwi2S7gD9BWw8ocEh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCaFlvz7ZSomBmNuTw35dKEQRFENegFhlEfZC9PPAzI=;
 b=uZ/k9f9EG19ANSA5o4/9Ii9KDMSheQYvr/GAW4BzwfgUXMEBLq8LdshwCvfbpx5HQZYpPQI1LI+uvfVEntfjCvzwDUL3uUk5g4PR2G+mFywhRh2RUSdNz8QhdR9QrzulIrM7vMfCMRpLFXHSd0IS+qNlB+LVZQ/83DQn0zMK/0c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11054.jpnprd01.prod.outlook.com (2603:1096:400:3ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Mon, 12 Aug
 2024 12:42:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 12:42:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3
 nodes
Thread-Topic: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3
 nodes
Thread-Index: AQHa7DAWZaR6TcoD6kuFkcWuXXMxB7IjjJ6ggAACQACAAAHTIIAAARKQ
Date: Mon, 12 Aug 2024 12:42:39 +0000
Message-ID:
 <TY3PR01MB11346B20A0C4249DC23F0587586852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240811204955.270231-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346E95ED1171818488EFEFA86852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sR1Lu1FYMQbDXzzi19ShF-RLkwirF-51aWp1bjwG8LXw@mail.gmail.com>
 <TY3PR01MB11346C6066762B81C1B19848A86852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346C6066762B81C1B19848A86852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11054:EE_
x-ms-office365-filtering-correlation-id: 7c971d8c-cdc5-48fb-43f1-08dcbacc4049
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YWlpVm1VMzRWWHBtM2VvK2pEUVh1T2FzSGRmU1gxaDFXRG1peEROL2MyRDZa?=
 =?utf-8?B?a1hLNVZtMDFvQUhicVBPMUZJWFZ4YXNkbnZpZVZCR1p2aWNqalBxcGNXS3lK?=
 =?utf-8?B?TFpyNWJtUkFaSWlKWEFzNGNJcDVlcWpNeHhtKy8wYTZPL3E3ejkzTmN4U1JT?=
 =?utf-8?B?Wkt3Y2FDcmk2d1pzNnowNnpIVkVnTU9aalpDaVhEb0VoUFJBakgxLy9PMUJY?=
 =?utf-8?B?alJNWjV2KzhRWlo2RlJ5QzZiem9DWTVlc0V0VVdGdURxbDZwZEZOOHR6d3lY?=
 =?utf-8?B?WkNMOXJSNzg0NzBQbWJteGxtZm45RDMzOU5MSitZNFRXRTRoR0lzVjF4ZTBw?=
 =?utf-8?B?TEFiUHkzcHhWckc2T0VZQzVDNTFBMTBjM1BpWWdEVjdaQ29xcVpLd3pFeFc4?=
 =?utf-8?B?Q21WT05DaEU1amJ5dTJxM3dZZUo4cUZyNE9iWVYwZGZpVkppeVgwUE5LKys3?=
 =?utf-8?B?SkFkN01HRU1kYTlFRTdBUDgvVDltbGxmWDhKdm81RndhbGoxQUFRQUhtanNp?=
 =?utf-8?B?dVBTRTBHQm5Td04yL2Y2TnUyTEhNM3Q2dVBkWXEyREtTTG00RW5udVY2VkhP?=
 =?utf-8?B?TndsTE9xNUozamFSZ0dLZTh3OGhmSTMwdC9BUjFnSjMweDZtc0Qrc2JhblVH?=
 =?utf-8?B?UnZMdElWZEgwQnJ0L1hlckg4cXJWZjZmY0NXRGFCQlQxWjVSODZDZWNVZWVK?=
 =?utf-8?B?blRlQW1NbENzMTNLTEw1S2FGOWdmNUI2TmFuai9JY0tRekZiS3NDTU5RUDNj?=
 =?utf-8?B?NE5iVTI5eWMwZWZWd0Z1S1UzN2VUZ3hPY21nalI0VlRVNG9QYkh2QzYxU212?=
 =?utf-8?B?dVpWMElzTHRXZ253U3ZZSytPWmpNNk5tMitJS0tvMmNjLzc5cGEzc1FYM3c5?=
 =?utf-8?B?SThQRHhMQXFmVU96ckREQVlXb1J0RXI3bG1ha1RBZzd0SmJzZzVGMW1hOWFG?=
 =?utf-8?B?azFodVlZM243R0Jqb0tWRUFXVlpTV2R3ZExrTHVuMmxQb0U2TzNCbU43cTNR?=
 =?utf-8?B?ODc5T1I5cktxaVZlaU9pa3BQN0p6VkdJWW0zOEN5TXBYZmY5Z1dIaFkzeFgr?=
 =?utf-8?B?Z1BBTkhCVGsrSGVNUHhUVGVpcFQ4TjNuamg4QTMxajdvNlhKbndBU01OSVEw?=
 =?utf-8?B?UzlUTlJuczVOMlIreHJUTjJTempsOXU5NzdWK2lBd0w4RWRzOW1YVi9EVVQz?=
 =?utf-8?B?dW5LRUsxbGNIQ1ZmZTZQN1RrdTY3eFRmSGhsb3ZpaUt2Rm9nZTBRdXdKR1l6?=
 =?utf-8?B?M0ZIeHBWQzdBUXVXSmhUMk0xcWIweHArNHhtUXV3WmY2NlZlZk1rTnplcHJ0?=
 =?utf-8?B?cFRHakhGWjRraXdiRWQvU1JYVmVCQkM3WnBMQ2g5N1o5N1VXZlhxTnZvU3Jt?=
 =?utf-8?B?L2dJZS9OOUxFcjByWTVON2pyT09NYWMrdXhwNHdSQlByUWdLaDRoVjZZemNY?=
 =?utf-8?B?VFZ0RVFrekllczNHdngva3hwd3BaTUE3OU5ZZ1pwV2Y2NFRSQURydkRKQ0RO?=
 =?utf-8?B?aEZoR083TjhsUHdxcUgzRjlzUEVMZ1JpeWgrT0RvbTRTVHBpeWxueURMVzZq?=
 =?utf-8?B?NEs0TEwwd3gwT3pPMmRHRTVNQnZoZ0ZtbWJFT21CZFpadUdOdkp0cC9WUk9C?=
 =?utf-8?B?YXgvMHR3UjNOckxkdVQwUmw4NWlWdmlaVGFGQ0N4b25KMENmakNQWmNtRUor?=
 =?utf-8?B?MStVclpCYmF2OHd4bHU1ZHpYajU1cDMvR2FDUkJBZTVqQnpFcm4ranY5a3lx?=
 =?utf-8?B?a0UxZlJBVFgwZ2FJTi9sZ25wejJjNUtaanNaS0xCaVlkRXVKZlAzTkdsRWJ5?=
 =?utf-8?Q?TQJtqiIofDTlTu4jvtejn0y7eeyPzzDDYA7m8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MDZHWjI2ME5ObkRHWlRvME1TYjRIdnZCN2pNcERZN3BhQmZZNlNwUENKc0h5?=
 =?utf-8?B?czRkZmtKNGhyaWRWeG5GNFlOQm5XUVBRelFuM3NuMSsrV3RwVlRBTW5uUlJJ?=
 =?utf-8?B?MWp3UEFiODREZWZJY3d5alpDQVQzMVRLTDJFSnMvWkVETU0wcVVZOW4vUGdn?=
 =?utf-8?B?MHg0T296YlBsTlBtOEs3dXhzd2hKMVZtVXNMY0RiSEtnTDdKWlgzZnIwOG91?=
 =?utf-8?B?WUdqNVVydDRlNnRGcW4zalg3SWJGdzJ1YmQ2TlgwNWdJd3M4bzU3MEpuektr?=
 =?utf-8?B?TUV6ejFBV1hkZW16TGhsWEdESUlKZGpYdnUxMGl0S3JMV2RoWXNaWnYzWWZj?=
 =?utf-8?B?UGF1Y2dkWHc0K1N3WlJ1azF5ZjNSNllsc1JpTzNFczlYY3hnQWhPcnlPaG9z?=
 =?utf-8?B?K082WnFVREhZV0cybDBJRmM3ekhFU2RFZVpDcEJYSGtFNXg4Mkp5dVFYNzhY?=
 =?utf-8?B?ejE5OGFVR2lKeDhjMXoyNnFPSXJhZ0Z0U3Zsa3FSSTg5NzF6UHhXMlN6LzBw?=
 =?utf-8?B?N3d2R1JJdWx3Y2FnMjBLQ3hhdEExQTd3YnR6WXB6SFlkVmt1MXMxNGZhWi94?=
 =?utf-8?B?OWxGOUdXOGk4VGJOUkxhcFFXSUl5MlJwWmE3UVR0SnNlMFFBR0wxTG5QelNW?=
 =?utf-8?B?aUZDK05aNnUrSnRWekFYSGhIZldEWktFQy82KzRubkM1NkpXTzd5MzI5OEds?=
 =?utf-8?B?VjRKK2NOQ0F5Q2lscjJXMUFmdFpZVDdxVHZ1c0ZDVjBweWhuNmlQNHRtTmQ4?=
 =?utf-8?B?SS9pc1VMeWJQZzBoZ2d4RXlUNEVLRS8xWFhVckZCR3lhRXNwYUY2TGQ4MmZm?=
 =?utf-8?B?elkwekJtUlQ4REdMWkx3b0ZLRWtKdFRLZkszTHNYNGZIbERBWHd5dzFKalVQ?=
 =?utf-8?B?Zmt4NEp2RkpsWk5VREFEMkwwTzhINFcrbktzY0E1aHBSWStIdEszN09JOUVO?=
 =?utf-8?B?ZDdvOUFJQzdxV3NJeURRb0hySU5EdnNIckU5Um1sWVh3WGlRNHZIZkNOemhK?=
 =?utf-8?B?WUY4dk9Cd2xJdTN3UThnYitvWkc2ZEJpckgzWjNtRGVxSlhhc240OVZzdUlw?=
 =?utf-8?B?MHM3cXJ3aFFxU2Mwc3JXbDBmbm9aUXNlblpiTmtiYk4zUmJ1dXRFcUtoZnQ2?=
 =?utf-8?B?SHRqclZSMTNKajVRUmJRZVlOdXY0dmxKK1FBUllNRzhpbkdnd1hZbERSUCtR?=
 =?utf-8?B?Nk14cFdBTzJ6ZHBibER6U0lqMU5JbldjNzI1c2phSFVweVBPaVZFS3VUNmNZ?=
 =?utf-8?B?bjBPOERid3EyL295RU82VHBSQTBUNkdLc3lwV0tYUzhtTnJFUzVvWERMRXor?=
 =?utf-8?B?QllEdlpSYmpwSXY2ZUluTTVNY1lnOWhpTWZuKzdIeUx6K1ZjM0svYmJBbUJq?=
 =?utf-8?B?SzZjKzlxT1FjR0JySDE5WVQ3dXdtNUZJSDZaUzR2aWRYQWsvc0ZGT2xwVHVI?=
 =?utf-8?B?M2tIdThpMjQyMklNTXFXaDlhY2pRV281QVEyLzh2NGxBSmNIZm9JeERJZTRW?=
 =?utf-8?B?emdzenJuZ1p5TUl4aldpWUxPZzMvSGJNcW1rTlRLYUxpWC9XYjVUWnVvUlRq?=
 =?utf-8?B?UGZDWk03TEdrRUNteFdNb3Q0ZDczSTB2ZmE0WDFBdW1kR0Z3UlVUWFRNR1Ju?=
 =?utf-8?B?djBkTHBFWUJ4Rk5ybTBsQnFkTjNJZm8rN3J0eHQvekV3b2V6eEo1ckpaTzdR?=
 =?utf-8?B?cGNJZXRlV1FIKzdZWXh6L24xd3UwUzQvRWFNck5qdmJZZ2VFcUlkUUx5RStL?=
 =?utf-8?B?czUvTzZSbkJOUERoV3VhdUdxS0VTeFNMc203dzMwZ1Q4U3dFQktSY1FLbzJY?=
 =?utf-8?B?b1U3cVRZVTI4U0s4YWRhcDF1ZXNNRG5UTkZVWDJSZ1JFMFVONm5sbzRucmh3?=
 =?utf-8?B?S3V1Q2JjYUc4U2tuYlptSXlwcmVHeTN1U2tUR25kZzB5cVMzZXo2Wi9qWmdF?=
 =?utf-8?B?cmtJdWExSGtZbFFLWjdQYURTMGxDdU1MTlpucEU5d1piNlZGcDdCeTE4eHVj?=
 =?utf-8?B?VW5VZTFNUmU3Mm55VXZzc0hPOGNZOFp0RXMvczVvYUpUODVvQytlK01rWHR1?=
 =?utf-8?B?ZXlSOGE3d1A4UStFb0JuTDlQZFVYM2VaaTZWbHFvT2c4UjVxdTdWWlFFYU56?=
 =?utf-8?B?RDRWOS91WmtaSFF1a0xGNVRZSndRQlp4N1hGS1VPQ09uRDEwSmVQaTRQUFZF?=
 =?utf-8?B?NGc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c971d8c-cdc5-48fb-43f1-08dcbacc4049
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 12:42:39.3162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cs95aVt3H7VrvT1uLt7jxctu1awXNqn+PsKtxpxmaSLRBm3ptA03y8AWLgBtPvMEYSgtG9UUaCKUXdvFO/nUDt+lwblsuoSarmY81Ziqjak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11054

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMNCj4gU2Vu
dDogTW9uZGF5LCBBdWd1c3QgMTIsIDIwMjQgMTo0MCBQTQ0KPiBUbzogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IE1hZ251cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5j
b20+OyBSb2IgSGVycmluZw0KPiA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3Jn
PjsNCj4gbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgRmFicml6aW8NCj4gQ2Fz
dHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBM
YWQgPHByYWJoYWthci5tYWhhZGV2LQ0KPiBsYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IFN1Ympl
Y3Q6IFJFOiBbUEFUQ0ggdjIgNi84XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOWcwNTc6IEFk
ZCBXRFQwLVdEVDMgbm9kZXMNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+IEZyb206IExhZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNv
bT4NCj4gPiBTZW50OiBNb25kYXksIEF1Z3VzdCAxMiwgMjAyNCAxOjMyIFBNDQo+ID4gVG86IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBDYzogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IE1hZ251cyBEYW1tDQo+ID4gPG1hZ251
cy5kYW1tQGdtYWlsLmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0
b2YNCj4gPiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29u
b3IrZHRAa2VybmVsLm9yZz47DQo+ID4gbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3Jn
OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gPiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBGYWJyaXppbyBDYXN0cm8NCj4gPiA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMu
Y29tPjsgUHJhYmhha2FyIE1haGFkZXYgTGFkDQo+ID4gPHByYWJoYWthci5tYWhhZGV2LSBsYWQu
cmpAYnAucmVuZXNhcy5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA2LzhdIGFybTY0
OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzA1NzogQWRkDQo+ID4gV0RUMC1XRFQzIG5vZGVzDQo+ID4N
Cj4gPiBIaSBCaWp1LA0KPiA+DQo+ID4gT24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMToyNeKAr1BN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+
ID4gSGkgUHJhYmhha2FyLA0KPiA+ID4NCj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPiA+ID4gRnJvbTogUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4N
Cj4gPiA+ID4gU2VudDogU3VuZGF5LCBBdWd1c3QgMTEsIDIwMjQgOTo1MCBQTQ0KPiA+ID4gPiBT
dWJqZWN0OiBbUEFUQ0ggdjIgNi84XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOWcwNTc6IEFk
ZA0KPiA+ID4gPiBXRFQwLVdEVDMgbm9kZXMNCj4gPiA+ID4NCj4gPiA+ID4gRnJvbTogTGFkIFBy
YWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4g
Pg0KPiA+ID4gPiBBZGQgV0RUMC1XRFQzIG5vZGVzIHRvIFJaL1YySChQKSAoIlI5QTA5RzA1NyIp
IFNvQyBEVFNJLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2Fy
DQo+ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4g
PiA+IC0tLQ0KPiA+ID4gPiB2MS0+djINCj4gPiA+ID4gLSBOZXcgcGF0Y2gNCj4gPiA+ID4gLS0t
DQo+ID4gPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU3LmR0c2kgfCA0
NA0KPiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNDQgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1Ny5kdHNpDQo+ID4gPiA+IGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1Ny5kdHNpDQo+ID4gPiA+IGluZGV4IDQzNWIxZjRl
N2QzOC4uN2Y0ZThhZDliMGE1IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjlhMDlnMDU3LmR0c2kNCj4gPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I5YTA5ZzA1Ny5kdHNpDQo+ID4gPiA+IEBAIC0xODQsNiArMTg0LDE3IEBA
IHNjaWY6IHNlcmlhbEAxMWMwMTQwMCB7DQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBz
dGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ID4gPiAgICAgICAgICAgICAgIH07DQo+ID4gPiA+DQo+
ID4gPiA+ICsgICAgICAgICAgICAgd2R0MDogd2F0Y2hkb2dAMTFjMDA0MDAgew0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA5ZzA1Ny13ZHQi
Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgxMWMwMDQwMCAwIDB4
NDAwPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19N
T0QgNzU+LA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BH
X01PRCA3Nj47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJw
Y2xrIiwgIm9zY2NsayI7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8
JmNwZyAxMTc+Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9
IDwmY3BnPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxl
ZCI7DQo+ID4gPiA+ICsgICAgICAgICAgICAgfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiAgICAgICAg
ICAgICAgIG9zdG00OiB0aW1lckAxMmMwMDAwMCB7DQo+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscjlhMDlnMDU3LW9zdG0iLCAicmVuZXNhcyxvc3Rt
IjsNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgxMmMwMDAwMCAw
eDAgMHgxMDAwPjsgQEAgLTIyNCw2DQo+ID4gPiA+ICsyMzUsMjggQEAgb3N0bTc6IHRpbWVyQDEy
YzAzMDAwIHsNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxl
ZCI7DQo+ID4gPiA+ICAgICAgICAgICAgICAgfTsNCj4gPiA+ID4NCj4gPiA+ID4gKyAgICAgICAg
ICAgICB3ZHQyOiB3YXRjaGRvZ0AxMzAwMDAwMCB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscjlhMDlnMDU3LXdkdCI7DQo+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDEzMDAwMDAwIDAgMHg0MDA+Ow0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3OT4sDQo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDgwPjsNCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gInBjbGsiLCAib3NjY2xrIjsN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlc2V0cyA9IDwmY3BnIDExOT47DQo+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZjcGc+Ow0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiA+ID4gKyAg
ICAgICAgICAgICB9Ow0KPiA+ID4NCj4gPiA+IEkgZ3Vlc3Mgc2FtZSBncm91cChhbGwgd2R0IHRv
Z2V0aGVyKSBhcnJhbmdlZCB0b2dldGhlcj8/IE5vdCBzdXJlLg0KPiA+ID4NCj4gPiBJIHRoaW5r
IEdlZXJ0IHByZWZlcnMgaXQgdG8gYmUgc29ydGVkIGJhc2VkIG9uIHVuaXQgYWRkcmVzcy4gU28g
SSdsbA0KPiA+IGxldCBHZWVydCBtYWtlIGEgZGVjaXNpb24gb24gdGhpcyAoYW5kIHRoZSByZXN0
IG9mIHRoZSBzaW1pbGFyIHBhdGNoZXMNCj4gPiB3aGVyZSBub2RlcyBhcmUgc29ydGVkIGJhc2Vk
IG9uIHVuaXQgYWRkcmVzcyBhbmQgbm90IGdyb3VwZWQgYmFzZWQgb24gSVApLg0KPiANCj4gSSBh
Z3JlZS4gSWYgdGhhdCBpcyB0aGUgY2FzZSB3ZSBuZWVkIHRvIGZpeCBbMV0gWzFdDQo+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtDQo+
IG5leHQuZ2l0L3RyZWUvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGExLmR0c2k/
aD1uZXh0LTIwMjQwODEyI241ODQNCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC0NCj4gbmV4dC5naXQvdHJlZS9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjhhNzc5NjAuZHRzaT9oPW5leHQtMjAyNDA4MTIjbjYzMw0KDQpTaW1p
bGFybHkgDQoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L25leHQvbGludXgtbmV4dC5naXQvdHJlZS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhh
Nzc5NjAuZHRzaT9oPW5leHQtMjAyNDA4MTIjbjc2Mg0KDQpDaGVlcnMsDQpCaWp1DQo=

