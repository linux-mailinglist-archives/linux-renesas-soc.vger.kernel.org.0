Return-Path: <linux-renesas-soc+bounces-12894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3590A2A508
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 10:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AB29168152
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 09:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5121226540;
	Thu,  6 Feb 2025 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UGVLLvVK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4649F17A586;
	Thu,  6 Feb 2025 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835256; cv=fail; b=gDQaoesPyC7HQSwkSdnNrC6tijhfRskhELeRUegGLkRjs6oRVKZq0jqikIsiF3xBu3gTJmkmr3YbjW4v3dE6Arx9o1SG1k2nS8RWMW07oyjn3CKL8kztbfF/Jm6/sPRPfYZYLC82K4vGSO4dAs20e0U9eqkpEUalIWPdPj5mIiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835256; c=relaxed/simple;
	bh=UWqMaBfDw8s6JqpY/qECe7iZfZ4QtRN6RpAN5TJtTEE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fis6tQ2RHjjk4dh9sBdJUmjDVWDY0Gd1JvjROBq1QXZOegdQ9dUYzDQNhchfW0na7rhmT3vQQvS0zs2OM6HEC7wv88tLUmW6flQtD4aOD3mrleO6uWayfd1VRVGCKwn397ysDZTBSAZpuQT/wIcTtP8Pr2U8Nxsqm2Orlcs8mo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UGVLLvVK; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMpYzWmbtfSj8qeA0m5hKMLRM6odH5kLyl3CBM6wNz+Jy8847gqlUuz8IDXs4WUhKDfrbWF9vc5qiIzrpVxj9HZWWwd634lGiD8ANtoYxlxhexOmaPM2PgjoUcNnSWiEW8yNv8AA2tGe3F545jGmr0o/KhaV5PeNzCdyRpywKFr35UELMxe6gsv0QHVcRkUrBpMlcJExrfTk2fxNHSB5HndEqxVh38huop6dPFgHCvpTs5oHWBCLaXst2bI7BpLBnKK+errDnpN6T/Ikb4Uos8f1TidrNkCLVDJi6DIW7yNIoJG+r/UheyHywkJmurhIMaVDY4yqa6DhGUtHIduF4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWqMaBfDw8s6JqpY/qECe7iZfZ4QtRN6RpAN5TJtTEE=;
 b=mdwwKysTrfDpC1RRM5fHlXxu86q38sTcFHkCHetsi/PwDe6BuY3Ev3EV9Xi4drymTdklSCMeB/s3ZdWTitJ1KEanBRe4yIJMCVny1qtXaSnq4uYGw9wIyc8/sw5v5rSCBi7ASJJ0u4SaGJ4njO9xAf2HeKVhoLkNKyAvkQZwJeF55mDM+8sNF4EzXY4nmVYiA+Ku2SpQAOB2KrE5oLC0wLfFbrgOtODsHCW8R1Tj8IjPqQNvYolvisJFkHsVtCmM06CXJMos20WThWLVnQNeTmSUrfRb+YcaK1fyvPO75cY+MJ3aPcmP1bZp1VkBNcyI+stw1LvQCN34xrfAdfq+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWqMaBfDw8s6JqpY/qECe7iZfZ4QtRN6RpAN5TJtTEE=;
 b=UGVLLvVKiXm/chvABfjPCYtIvn6H0dHQUVcUfIQQk+foFTeWCLNfwe8BhW5O0UadYrPwbVR0xCg+qMk1nw6TFpD3T6OXjeOvptrSLvuZr6heaoEF6I9VUHxmG0JWSU1qGf5Jw7UbwwzbiTGnuMopk+QdzqZac6HHmrYKzpiOB+M=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8221.jpnprd01.prod.outlook.com (2603:1096:400:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 09:47:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 09:47:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable
 SDHI{0,2}
Thread-Topic: [PATCH v2 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable
 SDHI{0,2}
Thread-Index: AQHbc9LHJ1EZ6jvpdUu3wePcW5HPZrM6DUyAgAABgaA=
Date: Thu, 6 Feb 2025 09:47:29 +0000
Message-ID:
 <TY3PR01MB11346D27BC2EE65AD29789B0D86F62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
 <20250131112429.119882-7-biju.das.jz@bp.renesas.com>
 <CAMuHMdXSaewfeRkuOqmBYkWPzLr54QM1X7fw0ODOuj-ooucUkw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXSaewfeRkuOqmBYkWPzLr54QM1X7fw0ODOuj-ooucUkw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8221:EE_
x-ms-office365-filtering-correlation-id: 8d255062-66a3-448a-cd0b-08dd46934561
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RlAwa3pWWE9rQzdlTDZxdSs1Y2swQzVjdkxmQlNPSWRtcUpvcDVOWTBncnd5?=
 =?utf-8?B?cENsbURPbEo3anROS2NVS0V3QkljYmh5dmpldDdiRHROcXpab3VTT0psVEps?=
 =?utf-8?B?KzZ1dGt4a0syUTFsS1dSR2RjVjdaTHBNOG5ydEdHMEVySnUzaUVrSG80N3Nz?=
 =?utf-8?B?YisxekhEb0NNSDlIS1pVbE5OVWk5UjJ1d3hic2treHJVcHlqdU1BcVZPZXdH?=
 =?utf-8?B?MUxrYk1PeHZ3V3ZzK0c5SDljSXl2SXVPc01YdmFFZjhYcmtrc0xCVTJVaWZ3?=
 =?utf-8?B?UEludGEvNG1mNlBsU2ErUEhibkh0TkM1aEZYUjZoZ3VMbm1XQW8xUE93bFdG?=
 =?utf-8?B?SGg0cVNWUThnYWJ3ZDJVM3hrdTFvbytGRkIvLzZYSUM3QXcyN29yNXQxd3Fr?=
 =?utf-8?B?QlNTM3h5K0pPdFFpaUZ3c1JzNC9yak5aeWdQRkkxSmVscWlPOElmUjZKNEhx?=
 =?utf-8?B?a2ZwRTRKVWtVWVZwVitSbzJQclJBcmpvUlpFZzFXQjJVdlZMcFFmR3k5TExs?=
 =?utf-8?B?YzFlWTF0M0pOM0ZWclpYNVNwOE0vcVdGL2F3OFZ2Z1ZHMlNzcHd2b2dLMVRT?=
 =?utf-8?B?dFJUeUZ6UktoOUlEM1VqMUU1dnhUTWRUcm1heFY2N0wyRDdKZGxJTW81NXNs?=
 =?utf-8?B?ZDdiNHYyd3c5bEh0TzZiSXFVc0UrbmVUN013YU5xVkhYOFVnK28xa1E2cHNF?=
 =?utf-8?B?eC9zZUZMdDI3WXlZRzFtYlM4N202c1FyNjIrOU5ab0QxZzdVVkRSMEdvZmJm?=
 =?utf-8?B?eTBKbklEM1JURmJrcHA5SlFpWVlYQVgvdytKeTBURnI2dXNDL1FVSVREYnE3?=
 =?utf-8?B?MXNlYWx4NDVKQVUxZE5VdXBvVm9VQk42YlZabGlRbHR0UTAyeHc4RGpWNE1P?=
 =?utf-8?B?Q3Jwem0zWmg0WTYrUHhubnlYQmZlaHdVbC9ZOWpxV2NwZzFZQy9tcUlUZ1c5?=
 =?utf-8?B?OG1kVjYwaHN5TVBLanRMRGZjMWZrRGs5RWpseXQ0VnRRbFAyekxkWnA2K2RL?=
 =?utf-8?B?U3RSRm0yZ09zZFVUUE5IcmcyQzhWcUFJcVpVSzJnejlXbVZ4YTdoYUxpeWFQ?=
 =?utf-8?B?RDJ1eUdOdldudDVQOFlQUCt5OFdsUEpGLzBWSkFOdXE0QktUQmpNTGpmNUNK?=
 =?utf-8?B?SkZWcGwwcUlTd1dKNjdnbVZQTUxWQnFhZytpV0JleTBKMXZMdWQ3N0hNMGtj?=
 =?utf-8?B?WDFuellsRHN5MXdiRjdaRGJ2MkxUY0pyUk9kb3N0SzVtR2VsZG1tbmlEWXc1?=
 =?utf-8?B?bHg4OENkSU83TjJHaGpuN21yQUJNNVZGaFdwRm4zVi9MNWs1THFkWVZ5ME5h?=
 =?utf-8?B?Zk1yanZnYVhRaUZqbWtPbWR5a3BLeXdqemw1Y3RJd2llT05OMS9CaFJvaGlT?=
 =?utf-8?B?WnIrMVVjMW5sR0pkVkx1K05DOUVqWDA1MXNiUVNBeCtlQXZCT1JmelN0bU1X?=
 =?utf-8?B?LzZmY21aeWFXVG43NnVjbG9CQUx2ckEyRTVHVkEybWQwL0hySW9IcEFpTnFW?=
 =?utf-8?B?blFhMjFIR3lQemxmWThENkdEdEIxUVNaZ0V6VUtNdDZYNU5aelYrODZyNHdW?=
 =?utf-8?B?d2x3OUhha1R2Z1BRNnVBL21pU3JIaEFMbnJZVkVTazlyNzZHU0I2eG5HVkps?=
 =?utf-8?B?SnRDSVoxaFpra3liOEdVZzZDU24vWXhkSVZESlRQS2E1dmQ5WFZlL2srNUNY?=
 =?utf-8?B?UVFlZGZMSGFnT2pxSkFHem1GMDY3SDFvamVWOGM3Z0M1R21teUhrOEt3ZGVs?=
 =?utf-8?B?bjk1eEI4VC8xdWJ2NDdocWQrYytMZEdMSmovbTNGNDlnVHVYZ2FIM01CeEM0?=
 =?utf-8?B?NnFoUExRKzcvZTc4UENXbDhsekxFc1pqYS82eWxKalRBUkZKVkJGMmpNVEZK?=
 =?utf-8?B?QXpkRStSTUljNjdJQ1ZBT3ZvaWZsQUJydGV2OEdqVG9SaVIwRnFER3dtTTBm?=
 =?utf-8?Q?JzPiajrRbre893fqfIvlwB4avwLq1B8n?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MW04U1k3b2lZSHdpaW1xajMzMVZmUWZHVjAvWE56UmgwV25zb2ttK0JiellS?=
 =?utf-8?B?OUJmdVRGTzZIdFB5T1JMYWdHQ24vVlZaekdBaW5LS0JEeXdpa3ZpNVNmSnNi?=
 =?utf-8?B?d1g5NkJ6SjZvR2dhUGZCTnNSRjdyZ0ZaOENDV2VnSnVtWTJaZkNESlFTSStn?=
 =?utf-8?B?SGdCbmNCRkxROXc2aW5Oam9xa3dPKzR6MkcyNEJoV0JxZmk5NWVkaUFqei9z?=
 =?utf-8?B?U1JyK2tzYnpjZS9zQ1hvb3NFb1AvNUp4TlhlcDRabzJJMCtHV1U4b2xTdW9R?=
 =?utf-8?B?Y1d1QWp5TGZMUGliOVkzWjFMSVhrVjNtSkJVaTdDS3RHbTh2eFZKZWdYU24y?=
 =?utf-8?B?UDZoalU0ZjZpcjV2elVyZFlDenVicUpLWHZheTRSQzR3N3ZOWmIzUS9tTUxT?=
 =?utf-8?B?SGNlcWJvM0cyVWNPek02eHl1STErQ0MvRVk4aFc1dktNaHpuWnhrREg4Qk9N?=
 =?utf-8?B?a1JkMGpVQ2lKaGJrMkk2ZzZDMnpOeHRRWXZCTlBJZUZOWXFlUUFsSzg3T0w2?=
 =?utf-8?B?S0hVUmRPdEJZNTNnRzAwOXpTOFJXaHd4SkZhTklFQ3kxTmFuR1p2SDI0dnhQ?=
 =?utf-8?B?NXZGcnZzb3RFdXJablpHM0FNTzM1YVVWQ3lWTEtPUUtvZ2xBUmdhWVNDdW9j?=
 =?utf-8?B?S3Azb3F0VGw5cFYrNnhUcTBEdmtCaGk3aC9oTFc2L3RuQnBTQnNIYTNxemZk?=
 =?utf-8?B?cERTNlplYUdyMzBhTXIrRmxpVWhsK05TU1J6SUhJTFFuVXVnZTYzaUtBaXAv?=
 =?utf-8?B?cVRuNDVGNEwyTzFvNGtFQ2pDY20wYmVDZHpkcWxCSmQzTXErbFFnVWJUaHE4?=
 =?utf-8?B?dUl2c2JzcUsxc2hURjh6d1FERmVSNCt0Zk8rMGl3TXJDK2RSN2lOMEFkNTI2?=
 =?utf-8?B?L2QrNFJwaXUyM0x1V1ZZUlc0ZHNLQVVJMnNWd0dTZklqSlBFZU0rd3cxM01t?=
 =?utf-8?B?YkZaUkdZajdYaDlCMVE4Y2NtMERWRWg0cWJ5endLTko2UVZIU21qN0hySUVC?=
 =?utf-8?B?dnEwQ1ZZRTlUY2FBNEVvNmkrNGhGajhxTWNISGd0eWJlRkRzeVB4cmFwb0x4?=
 =?utf-8?B?ZVFWVHVjcDJLVHg5aE92dGpveTNXK1MzK1J5RWZFb1hZelA1TCtOcWFDb2ti?=
 =?utf-8?B?aWJwdDBFTjFuS1E5NWd3SzBia3pWOW03aTNnVzFIY3BPU3VPZmdCZ1hNYXE1?=
 =?utf-8?B?WXdTN3lPT0FvVi90amhKVlN1Z2IwVFZSV0FibU1EeFp1QmpxZ0U2c2E5S0Y2?=
 =?utf-8?B?ekU0UGVVdXdkWk5OS1l0Z2d2MlNKTlBvcFVpakpsdTdpb21wMjUrQ3FtdHU4?=
 =?utf-8?B?T3JqTmZPYXdjK1pHT1lMS1ErU2UzMEZOVUJ2RCtpckJUcVV2aWc2czU2Rmk5?=
 =?utf-8?B?OUxxQmtIeDhDM2lVa25VdE1XSmtOeXhMTlNHbzRidW1QOHB2elUyYktRVjZ0?=
 =?utf-8?B?V0R5WVlhVTh5T1dDcHVxSkl3NDlsZ2llRks2djcwdUQvdFdYUElSTnMxOUNi?=
 =?utf-8?B?TkNYRWFRdVMySlRSeTJHSi9wVVhwak1VYjA5YVJNU0JqYmlMNWNBYWpodlov?=
 =?utf-8?B?dWQxQzJUT3ZOZmp6QzBlTTJVUnZHeG5oaDh6OUxwUGRmbzVQZ2poOE53YnY3?=
 =?utf-8?B?dkI5c3BWcU9NYzdjeVhxdzNDM2dIbXczV04zNDV4MGxrVW1zQzFxRzgrVXBF?=
 =?utf-8?B?TGtFVWlycE9XRW5EUlhPRVhWVGN3QWN6QXg3dkR1ZlZWaGs3TXpwZXJDUjJT?=
 =?utf-8?B?WVhjZ2oxUmkzZ0RNaDJtMEpOM1llN3JDM3hSN0VDNnBJL1hSaTNrcFlEZ1Mr?=
 =?utf-8?B?d2xIcjI4MC91U3o3enhPQjVVYjFSWGtBREl4YzJ1UzlSZ1NnZkYzc2dxalIw?=
 =?utf-8?B?aXIwTUJEZDhJaVhpL055NEI0a3NNOGR2Y1JpU0NTMS9ZT2IzR1hkbERDVm5l?=
 =?utf-8?B?Smxmc0dFLytjcHcwMW9ycER0ZXNUdjFxQjFSQ1RjWURFanJaTTQyK0htcysw?=
 =?utf-8?B?Y2Q1cmVVYkMzT3dxRXBIb0JvampZbWF0WUNCaTN4QkJ3L3ZaM2ladWdTRE9k?=
 =?utf-8?B?bnRzVXAyWTNoRzl2VW9PbG1mRzVHejNwazRpVStHTG8zYTEvbzFtUHhtazZ0?=
 =?utf-8?B?b2VPalFQcnd6YTI5aTkyVWMwZXFDTWh5Ni9Xa0xlaWZXV3BEdGpyc2NUendR?=
 =?utf-8?B?cUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d255062-66a3-448a-cd0b-08dd46934561
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 09:47:29.4475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pmW7vT8aPFTxjBoy+tfOe4XKwFtJW1T+9PXQT/Em/SOAD82wFafpQFAmFQKc2dcSdVFQ+rs+wp90lZh+pt7UX9PrLuYHLohB/9WbKMP6EUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8221

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDYgRmVicnVhcnkg
MjAyNSAwOTozNg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDYvOF0gYXJtNjQ6IGR0czogcmVu
ZXNhczogcnpnM2Utc21hcmMtc29tOiBFbmFibGUgU0RISXswLDJ9DQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gT24gRnJpLCAzMSBKYW4gMjAyNSBhdCAxMjoyNSwgQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBFbmFibGUgZU1NQyBvbiBTREhJMCBhbmQgU0Qg
b24gU0RISTIgb24gUlovRzNFIFNNQVJDIFNvTS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MS0+djI6
DQo+ID4gICogQWRkZWQgbWlzc2luZyBoZWFkZXIgZmlsZSBncGlvLmgNCj4gPiAgKiBVc2VkIGZp
eGVkIHJlZ3VsYXRvciBmb3IgZU1NQyBvbiBTRDAgYW5kIGRyb3BwZWQgc2QwLWlvdnMgcGlucyBm
b3INCj4gPiAgICBlTU1DLg0KPiA+ICAqIFNvcnRlZCBwaW5jdHJsIG5vZGVzIGZvciBzZDINCj4g
PiAgKiBFbmFibGVkIGludGVybmFsIHJlZ3VsYXRvciBmb3IgU0QyLg0KPiANCj4gVGhhbmtzIGZv
ciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cjlhMDlnMDQ3ZTU3LXNtYXJjLmR0cw0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOWEwOWcwNDdlNTctc21hcmMuZHRzDQo+ID4gQEAgLTcsNiArNyw3IEBADQo+ID4NCj4g
PiAgL2R0cy12MS87DQo+ID4NCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5o
Pg0KPiANCj4gTm90IG5lZWRlZCBpbiB0aGlzIHBhdGNoLg0KPiANCj4gPiAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxyOWEwOWcwNDctcGluY3RybC5oPg0KPiA+ICAjaW5j
bHVkZSAicjlhMDlnMDQ3ZTU3LmR0c2kiDQo+ID4gICNpbmNsdWRlICJyemczZS1zbWFyYy1zb20u
ZHRzaSINCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzNlLXNt
YXJjLXNvbS5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzNl
LXNtYXJjLXNvbS5kdHNpDQo+IA0KPiA+ICsmdnFtbWNfc2RoaTIgew0KPiA+ICsgICAgICAgcmVn
dWxhdG9yLW5hbWUgPSAiU0QyX1BWREQiOw0KPiANCj4gV2h5IG92ZXJyaWRlIHRoZSBuYW1lPw0K
DQpJIGp1c3QgdXNlZCB0aGUgbGFiZWwgdXNlZCBpbiBSWi9HM0UgU29NIFNjaGVtYXRpY3MuIFNv
IHRoYXQgaXQgYXBwZWFycyANCmFzIA0KDQpjYXQgL3N5cy9jbGFzcy9yZWd1bGF0b3IvcmVndWxh
dG9yLjQvbmFtZQ0KU0QyX1BWREQNCg0KSSBjYW4gcmV2ZXJ0IHRoaXMgY2hhbmdlLCBpZiBuZWVk
ZWQuIA0KDQpDaGVlcnMsDQpCaWp1DQoNCg==

