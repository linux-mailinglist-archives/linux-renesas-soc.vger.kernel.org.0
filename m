Return-Path: <linux-renesas-soc+bounces-13803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F576A49C5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 15:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E144174C85
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 14:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B8926AAB8;
	Fri, 28 Feb 2025 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="paSAJ7hh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7638525A2C0;
	Fri, 28 Feb 2025 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740754027; cv=fail; b=Ynjr3Z/UjJUlenQf09IND9nGaKZU0kCIzRGdHkxv3uiP4BsHe7LbK0IdVRwGOueee+OBG9WAGem/3m9Rno0nxRB/voADwEFJyHmALEJRotbQ0SdGZEch+vKnUg1dijbtXK8F8XQmY3AhjCHASVXGo6DyyHcM95NyCqZI9kPJV9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740754027; c=relaxed/simple;
	bh=Lb+8yTZ5BC1F1CUwGRZGHm6CGvptqkCFVsvzT297EUE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EDkdxg2WzB7Q04XuPOmMYMyZ+NvUOyj0UI0oQ3+k+9AoM/kb++bTjmTgfyfNN1HLRzVDLIrj1WT+0mUv2jpObTk/E71WbrmfsTpNxjyIRIwWQNQCmT7V7+EGEQOrip7ZOTC/IvSDP4VilJzsr2od9tVlg1qcavh8sXpyJVEgeis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=paSAJ7hh; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0I0HaZQazHSgbT+3aVBDf6E4SvW7i2bBFZy5N5vMIpO7YWwlvUvssB7ofn+/JEovRqTzDpi9cxGIUg1hiFMQNsafTH82uNoPe1KkvsDtnQ9/sTVesyyrxGoITe9GYGyEnMg9YlJ0OFQY36zjdDqvRtK/fNIaFfLtI0I7kuX9K0GUHJLnwC5QaAG2oSlu9CMl4o22YWpQMkPzmFUtK/pZvVcVxPcn7F+D3HopYNa1H9ffu8L6KItNBihL/0AxiUeWwEtDTRYYaPJpfATx5q2HuOcXDyNMv17yfGPc/IjMEKzFTW4uvhH/3QwTRJ+dcoOt3uiRYgpJf90ep4BNsf+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb+8yTZ5BC1F1CUwGRZGHm6CGvptqkCFVsvzT297EUE=;
 b=mzDWzirL8ry0od/smXIu4TKl2f5ECkvhtEBlVBw6H5VOcGjHF4eNgr+8rGnN0t6xLaOWR+MEasdRkh31CtR07erTsLWDVsqvdP8Z9U2YLOjebSfbKeYGZjHk1jV30IJqMW/iylXse9dUP3963NN+vGszvwszMqyYDUmSCRbsGIyt+NADDcHMYVk8hQaIIzVQyBD3iwt1Vnq3CxwpfX58hL9VDtdIUFK4eIi8Xk3jh7Q4wBmCRZUJttDZa0Gza56B4Kfl1bRElPEsKyoGIoTvz6WrdkTYOJlt7IuzQDsb0r3kPJoHG+1OMfoN5xTGc2qiYnErQiXoUPVWOhgBRZ606g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb+8yTZ5BC1F1CUwGRZGHm6CGvptqkCFVsvzT297EUE=;
 b=paSAJ7hh+GhUHEcvk0M7XguJsaXS+zoIQrUFCZvFteiJ3nTotMiD8XpQM2U0BiPInHz9VARpOLbBA7A4sJLVqhLI6n4iY26Rby4ZQv9n4e5dwwXxCXo6nujY+GxyDzaQlwpOZ0UAYZocU3ZH648cY9dO4oUYldyatvslieUbGQQ=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OSZPR01MB7001.jpnprd01.prod.outlook.com (2603:1096:604:139::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Fri, 28 Feb
 2025 14:47:01 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%7]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 14:47:01 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 4/7] irqchip/renesas-rzv2h: Add
 rzv2h_icu_register_dma_req_ack()
Thread-Topic: [PATCH v4 4/7] irqchip/renesas-rzv2h: Add
 rzv2h_icu_register_dma_req_ack()
Thread-Index: AQHbg6hVAPTmEscVvkGE7ff5yxfBqrNWcISAgAZl9LA=
Date: Fri, 28 Feb 2025 14:47:01 +0000
Message-ID:
 <TYCPR01MB12093DCF1C68B2821A803DCF7C2CC2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250220150110.738619-1-fabrizio.castro.jz@renesas.com>
 <20250220150110.738619-5-fabrizio.castro.jz@renesas.com>
 <CAMuHMdUpNJiaGf3OTaSjjh4SA+nXODQj38P1-M0gG2mnxC_zLw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUpNJiaGf3OTaSjjh4SA+nXODQj38P1-M0gG2mnxC_zLw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OSZPR01MB7001:EE_
x-ms-office365-filtering-correlation-id: 0e53f586-ce7a-41e8-9010-08dd5806c2d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a0dYbmlvN2FsMTFvSUZ1bDFWb0ExS1ZCblVDMVdjRzUvRk1ld2FIYUZRV2xy?=
 =?utf-8?B?Wm9jdSt1N1Z1bFlsWlZlam9DSzlGQ2RXTE8rSnBmeHR6V05abmxFTlNZeDFD?=
 =?utf-8?B?MTVYMzA0QlUxajJRZFd4MlFkSlQrUzhiaW5nakVxbmNTRmtNNUtkMzRMbWFV?=
 =?utf-8?B?ZHo1R09LNVhqWCttKzRDSmhqTEY4WjhPa2Q2UVp4anBGbmRrYVVvNXY5S2hZ?=
 =?utf-8?B?UVlTaVhRb0RKaEE2ZDZqakprR3FWWjRkZEloYUtIZHovUWhsSkFJUVpyWGRP?=
 =?utf-8?B?M1VHdHRqTk1CZXRWaGxqKzRqZ2pxQndSc3BWOTJPWFlWcGNDVFJrb1M1My9Z?=
 =?utf-8?B?UmptZXZWN1Y0Y1N5QVJpL254dUhHeUJqa0lNblVVdFZFUDRWMmdBN2tRMXJi?=
 =?utf-8?B?dWRqVE1jWit3bFB5WkdrZ0VCYThzU3l0aVVZdmtKNTRlM3NpUHBBRTY3Y1hr?=
 =?utf-8?B?NnpIM0ZraVF6UzNCYnQ2NEJNaHhzNDl6UVYvOVVrRkZRTnNrWWFmd3I1UEZ3?=
 =?utf-8?B?Q2pvMUZFR0I5S3NFRW9RV1F1VWhxdTd6NEJYMUFSQWlHYUwzdmRsZTM1N2Zw?=
 =?utf-8?B?bzY5d0V1d3p4T2xmOE5rUVpGUEoybnFybFUrTG1nREowWVc5c29QOVQ1M1Qx?=
 =?utf-8?B?clV6QWl5Z2o3eG9vQUpPVEl4eVFVT0RyZmEzdzlqbjdqR0NrS1hPNU15Nmlk?=
 =?utf-8?B?VXNkN3ViZ0xvZEZyUEZ5b25KTzQvS0pjMHRlM2pyam1YUjZzSzZybFRVV2ky?=
 =?utf-8?B?eW9aUTBkQ1prU2dvMlprUmtvUjBLWU9zTnl2azFCdVZJbERYUmVaQUxDMzRy?=
 =?utf-8?B?TURPMjV6ZWI0QzIrNUpPMDRtNUNVejgxS1NmZkc0bHdkWXlPSkVhaUFhZ2FQ?=
 =?utf-8?B?cHRlVi93UU9zT1dpVlkrQlVrazNvelJHNGJPUjVqVU9yd1dOWlh4YXY3cDdN?=
 =?utf-8?B?YjdMcC9QVUdGc2ZsVHo0dHllSktSRnp2M2U3QVNLMmNGYWtRVXI2dnRHQ01k?=
 =?utf-8?B?aE4wOUk2anlzSjVmdW5ibEcreHNzSHNrTHhhbnh3U0tuQ2pPRUlpZ2FwZnVi?=
 =?utf-8?B?eElCV0l2bnVobjU1SU56emJmVUdDVUZTVThFZGtTRGh4UmxPYUVRVDVWa3ZR?=
 =?utf-8?B?UmkwRGFTSndFb2hrZHFSYmU4OTJyc0hhV2RyWUhTWlVBUWpqb0I3UzFxMkFI?=
 =?utf-8?B?MUQybnhmeDFkTnVyU3BZV0NEeFk3K2xRMFhoenRFU2wyeUxaT0NFb2ViTDJS?=
 =?utf-8?B?NkpCOWVhZnZSaWtMWkNaZmRkTjhMS2l5QllPWWZkdE03eDR5TmN3ekxFMzUy?=
 =?utf-8?B?bXUzUDlQT2RiczV5dnY3SGtNbGkxRW1Na1k2cjl6TFVuTlpLb0VjMm9Gdmtz?=
 =?utf-8?B?SGxQN1plWTF0VjJKS1RFZHYwQ1FoTGVpRTNQYUxSK3dCMHhWbVV5VUNmK1F5?=
 =?utf-8?B?VUEycnRCQUczUktWNG9ZZTNzb3VqaEQvdFZFWE02eENlY3RHY2lRdUxNcGkz?=
 =?utf-8?B?anNpUzFXUktTa3VDajFXWW1RMUVJbVpPeGZLT3lQRHhOejZnUTBUMThJNFJI?=
 =?utf-8?B?dVVNbFl6NVFJQzJnMnk3WFhWY0xieXdMY0FLa3hKYW9QM2JMQjFhay80elhC?=
 =?utf-8?B?MFVOellTaEJwL3V5dWRFM0NjQUFlRFJiVXRqS2FlS0J4V1NFYS8ranN3eE9p?=
 =?utf-8?B?UXdvY0NiTkdUZ0o3WTYwdUVVOVZBM2ZDNmN0ZDVXRnpTWlpyY2RVWHp0ZEs1?=
 =?utf-8?B?My85YUdzMkhyc1U5VjJHTG1GREg4S09YTnNuaVd5Rm1QME5Hd3Bja2d4SmNq?=
 =?utf-8?B?MDVsSnplYWxRNTJBSHhaRXVVYXAwMkJDM0VzTnJWT3RqbHFOaDB1SVJva2Rx?=
 =?utf-8?B?UzZ6SE5TVWF2Y09TYy9PRWtWN1FZMWVtdVlkVTg0ci9yaVlqY1lCRHJzWE91?=
 =?utf-8?Q?8/zBpqtnFteDYTXeWe0W3ut9MnNYhoKB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjZ2cDFhZnZoOTkra0diSmFKUGw4OWRtb3V2ZDBJbEt3RDRuTDZUSitlbnlu?=
 =?utf-8?B?V0JBU2FVK0dvYW50VngvR3MwbCtDSnVZN0JQbkpjWmNUZndZT1NZWlUycmEx?=
 =?utf-8?B?NnRCdy91RHBnNDNCMmZ1UWRkWDA4OVduRXRuSjdTYUhwVEVmc2lHMDlEcXJR?=
 =?utf-8?B?M1VtYmFEaDJDcUdZZTdMcThreFNxK0hDV1JwNEVPSTVISE55Z2xOT1hwak5s?=
 =?utf-8?B?Q1RqbEFFTUVySFkzMFkxc2dmeFBOUkhlM3JxT3FNems5VkVEODhnZk5yR29V?=
 =?utf-8?B?N3Y3bjFhV2xpYzVLZEJ2YTdKYkZscUR1VUNBYVY3NDR2RTluNkh6Qyt0aHpx?=
 =?utf-8?B?SW8wcFd4ZExCZk9GM2U2MjhxTVJ3OEFBc21hejh6aHNYRjBxTUc3dXpOR2hI?=
 =?utf-8?B?VTdmZXNkTTF1N2kzY1J6VTJ6WmszdGJGMmt1ZHptVU5tVVFLT05PbTRtYjNj?=
 =?utf-8?B?M0d2YjBicTdGL2k2a1pseGZDQ0JLS0x0ZFM5bTdMNGNOcnNXL1g0bDRvQkth?=
 =?utf-8?B?MzFxNU8vTStYWGU0RjNhZGxPN0orR2hMTU5xN2orbFp6QVhXNnAvMVhnbUh5?=
 =?utf-8?B?QjF1NUpGcmNuVmRxZklETVRGanJjdExWdmxKZ0pTVVNLNmdOcFAxNTZFV3N5?=
 =?utf-8?B?T2xjYzc3YWpBZDBwanlnamxla2J2b3NZNXU2YUNtUCtzWHRoTDFjT1M3Mm9s?=
 =?utf-8?B?enpJQkhjUUF0aW9DY0d1WUpwN0VaRmFsa0Qya1RQdW1HMEZBVlNBMFBNWFNF?=
 =?utf-8?B?Ry9LVVlSamNORFpKbWZRTTY1eVdGQVhKWU8yME4xWmdKTFpZWVhCQ0d2QWJG?=
 =?utf-8?B?NFdJNUYxZ0pPUWF2c3RIdWIrdW9XVVdSdURZZFZ1OEtYNVk4cDhoMEVwd3R3?=
 =?utf-8?B?SU5HamZIVmczRHFCZGc3bmNUYlFNcndRdFRYNUluR2xaa1ZIeVJra2F4YjBz?=
 =?utf-8?B?OENxMWJVMC9wTnRuNUo3RFN6MGNQQmJycktaamlITjBGV3hKU2QzTkN4RkR0?=
 =?utf-8?B?bzlna3MvQ1JocThoNjVVTFRsdTI2WCtQZE12dlpNVTA4Y0JwQ3o2VTdRTTBh?=
 =?utf-8?B?UENQcFZ5M3M1TWNrTnlpQ3NnelFFeHNlY2FGTHFwdGhORE9LQ09xMVYxM28y?=
 =?utf-8?B?TUQ3LzhHRHY4cWFkOWpoVjBkNVRDdVcxVmNudU9hZG9rVVNieEFiT29Td01x?=
 =?utf-8?B?bkx4Tkt0TGN2VldMRHEvYjhoaDFNTi81OExETzc5ZFVpYlErMkUvNHVyWkRJ?=
 =?utf-8?B?OEhQVjlpb1hoSWVhQmNVdlMvNWNZZ1J3Rm5qTW1YQ1c4V0VyL3FNOTlIWkpr?=
 =?utf-8?B?K3RMY0NSb29ibnhiR0EzQTFGbEtHNk40ZFhlVjJIM0xLRys0SVdscEhnVWFo?=
 =?utf-8?B?UENhRnpUekxIcWRjeE5OTlBiNzBCM3pEK0FMQmlVdmpOUi9aUnRoa2c1REta?=
 =?utf-8?B?djJZT0N1UjZsR2RZSGxia0dPTUxBc201M3NDdkxaaGxpNm02MEZUaDFobDgv?=
 =?utf-8?B?UHZHdkNXQnJ4VU43VkJZZlkrSURZSkpYaE91RXlLZFZ5QjZhTTFDVWVaSFUr?=
 =?utf-8?B?SEpuVytqSmZDV1c4ck5BaFRHaHBuT2ZpWGZlRjdOZGRxd0dNdkhWZk1RdFJG?=
 =?utf-8?B?eGFNTEJ2SDVPVGVTQnFiMTVRbGU1NGt3OXQrZHRuTXZ1Q3NYYmhTWk54U3A2?=
 =?utf-8?B?RlBLRzBZM1pSelhOdlB5Y0ZmUzhuRFdjMTAweXB4d3FCRzYzb2Y2VWZBcDc3?=
 =?utf-8?B?bE5kNnQyWUxmRktXRFNVa1RSMWgyTmw1TnZpdnZTY2k3cjI4Sld1WFkwTUhZ?=
 =?utf-8?B?WmljUWdlSHNwSDRkZCtTWHl3MjVYdjgrcm83YjYyVkF2cTVwaGJFNUZ2bW9u?=
 =?utf-8?B?R1Q4cmQweHhOTlkyZFYvR0ppZVdnRnR2eSswdEk4Tm1rdG9iWnRUMWRieVJO?=
 =?utf-8?B?T05NeEd1eld0SVprNXh0Nk5oMWlISXdxNVdjdm8zMHNtM2ZxcllDTk1lS0l4?=
 =?utf-8?B?cnVFNEIycEtabzdXV0RTS21XdlJMcDVyVlhnUlo4cVZTSmxsT2x3eU4rQkxH?=
 =?utf-8?B?K0dnNkJqeDdVd2hCQ1BOblJVcUpDUzBGSHBZY2xxQkhneWNZbnUrTlhxWnVD?=
 =?utf-8?B?dTB6M29JS1VXdlRHSXh0a3FmQnE3WE1waTc1UC9KalV0S2tOUHFaK0N1czBX?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e53f586-ce7a-41e8-9010-08dd5806c2d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 14:47:01.7835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZgqbcCWGJARJBeIZ/EKZ5QZIyw++GmdTbDPeK1cQpth55mGxIiNvJPd3g/M0lrrVRjfkzH9dhzl72ZI41J74vRKpiliwxJL3dXU9zgl9go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7001

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAyNCBGZWJydWFyeSAy
MDI1IDEyOjU5DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgNC83XSBpcnFjaGlwL3JlbmVzYXMt
cnp2Mmg6IEFkZCByenYyaF9pY3VfcmVnaXN0ZXJfZG1hX3JlcV9hY2soKQ0KPiANCj4gSGkgRmFi
cml6aW8sDQo+IA0KPiBPbiBUaHUsIDIwIEZlYiAyMDI1IGF0IDE2OjAxLCBGYWJyaXppbyBDYXN0
cm8NCj4gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gT24gdGhl
IFJlbmVzYXMgUlovVjJIKFApIGZhbWlseSBvZiBTb0NzLCBETUFDIElQcyBhcmUgY29ubmVjdGVk
DQo+ID4gdG8gdGhlIEludGVycnVwdCBDb250cm9sIFVuaXQgKElDVSkuDQo+ID4gRm9yIERNQSB0
cmFuc2ZlcnMsIGEgcmVxdWVzdCBudW1iZXIgYW5kIGFuIGFjayBudW1iZXIgbXVzdCBiZQ0KPiA+
IHJlZ2lzdGVyZWQgd2l0aCB0aGUgSUNVLCB3aGljaCBtZWFucyB0aGF0IHRoZSBETUFDIGRyaXZl
ciBoYXMNCj4gPiB0byBiZSBhYmxlIHRvIGluc3RydWN0IHRoZSBJQ1UgZHJpdmVyIHdpdGggdGhl
IHJlZ2lzdHJhdGlvbiBvZg0KPiA+IHN1Y2ggaWRzLg0KPiA+DQo+ID4gRXhwb3J0IHJ6djJoX2lj
dV9yZWdpc3Rlcl9kbWFfcmVxX2FjaygpIHNvIHRoYXQgdGhlIERNQSBkcml2ZXINCj4gPiBjYW4g
cmVnaXN0ZXIgYm90aCBpZHMgaW4gb25lIGdvLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFi
cml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3
ZWQtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPg0KPiA+IC0tLQ0KPiA+
IHYzLT52NDoNCj4gPiAqIE5vIGNoYW5nZS4NCj4gPiB2Mi0+djM6DQo+ID4gKiBSZXBsYWNlZCBy
enYyaF9pY3VfcmVnaXN0ZXJfZG1hX3JlcV9hY2sgd2l0aA0KPiA+ICAgcnp2MmhfaWN1X3JlZ2lz
dGVyX2RtYV9yZXFfYWNrKCkgaW4gY2hhbmdlbG9nLg0KPiA+ICogQWRkZWQgZHVtbXkgZm9yIHJ6
djJoX2ljdV9yZWdpc3Rlcl9kbWFfcmVxX2FjaygpLg0KPiA+ICogQWRkZWQgUmIgVGhvbWFzLg0K
PiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2lycWNo
aXAvaXJxLXJlbmVzYXMtcnp2MmguYw0KPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVu
ZXNhcy1yenYyaC5jDQo+IA0KPiA+IEBAIC05NCw2ICsxMTAsNDUgQEAgc3RydWN0IHJ6djJoX2lj
dV9wcml2IHsNCj4gPiAgICAgICAgIHJhd19zcGlubG9ja190ICAgICAgICAgICAgICAgICAgbG9j
azsNCj4gPiAgfTsNCj4gPg0KPiA+ICt2b2lkIHJ6djJoX2ljdV9yZWdpc3Rlcl9kbWFfcmVxX2Fj
ayhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICppY3VfZGV2LCB1OCBkbWFjX2luZGV4LCB1OA0KPiBk
bWFjX2NoYW5uZWwsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTE2
IHJlcV9ubywgdTggYWNrX25vKQ0KPiA+ICt7DQo+ID4gKyAgICAgICBzdHJ1Y3Qgcnp2MmhfaWN1
X3ByaXYgKnByaXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShpY3VfZGV2KTsNCj4gPiArICAgICAg
IHUzMiBpY3VfZG1hY2tzZWxrLCBkbWFhY2ssIGRtYWFja19tYXNrOw0KPiA+ICsgICAgICAgdTMy
IGljdV9kbWtzZWx5LCBkbWFyZXEsIGRtYXJlcV9tYXNrOw0KPiA+ICsgICAgICAgdTggaywgZmll
bGRfbm87DQo+ID4gKyAgICAgICB1OCB5LCB1cHBlcjsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAo
cmVxX25vID49IFJaVjJIX0lDVV9ETUFDX1JFUV9OT19NSU5fRklYX09VVFBVVCkNCj4gPiArICAg
ICAgICAgICAgICAgcmVxX25vID0gUlpWMkhfSUNVX0RNQUNfUkVRX05PX0RFRkFVTFQ7DQo+IA0K
PiBXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIHRoaXMgY2hlY2s/DQoNClRoaXMgaXMgbWFpbmx5IHRv
IHN0YW5kYXJkaXplIHRoZSB2YWx1ZXMgZm9yIGZpeGVkIG91dHB1dHMuDQoNCj4gVGhlIGhhcmR3
YXJlIHJlZ2lzdGVyIGZpZWxkIHNpemUgaXMgMTAgYml0cywgc28gSSB0aGluayBpdCBpcyBiZXR0
ZXINCj4gdG8ganVzdCBsaW1pdCBpdCB0byAweDNmZi4NCj4gQ2hlY2tpbmcgZm9yIFJaVjJIX0lD
VV9ETUFDX1JFUV9OT19NSU5fRklYX09VVFBVVCBtZWFucyB5b3Ugd2lsbCBoYXZlIHRvDQo+IHVw
ZGF0ZSB0aGlzIGNoZWNrIHdoZW4gYSBuZXcgU29DIHN1cHBvcnRzIGhpZ2hlciB2YWx1ZXMgdGhh
biAweDFiNS4NCg0KT3IgSSBjYW4gdGFrZSB0aGlzIGNoZWNrIG91dCwgdGhlIGNhbGxlciBkZWFs
cyB3aXRoIGl0IGFueXdheXMuDQoNCj4gDQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKGFja19ubyA+
PSBSWlYySF9JQ1VfRE1BQ19BQ0tfTk9fTUlOX0ZJWF9PVVRQVVQpDQo+ID4gKyAgICAgICAgICAg
ICAgIGFja19ubyA9IFJaVjJIX0lDVV9ETUFDX0FDS19OT19ERUZBVUxUOw0KPiANCj4gV2hhdCBp
cyB0aGUgcHVycG9zZSBvZiB0aGlzIGNoZWNrPw0KPiBUaGVyZSBhcmUgb25seSAyMyBETUFDS1NF
TGsgcmVnaXN0ZXJzLCBzbyB1c2luZw0KPiBSWlYySF9JQ1VfRE1BQ19BQ0tfTk9fREVGQVVMVCA9
IDB4N2Ygd2lsbCB3cml0ZSBiZXlvbmQgdGhlIGxhc3QNCj4gcmVnaXN0ZXIgYmVsb3cuIEFuZCBk
cml2ZXJzL2RtYS9zaC9yei1kbWFjLmMgZG9lcyBjYWxsIHRoaXMNCj4gZnVuY3Rpb24gd2l0aCBy
ZXFfbm8gPSBSWlYySF9JQ1VfRE1BQ19SRVFfTk9fREVGQVVMVCBhbmQgYWNrX25vID0NCj4gUlpW
MkhfSUNVX0RNQUNfQUNLX05PX0RFRkFVTFQuLi4NCg0KV2UgZG9u4oCZdCBoYXZlIGV2ZXJ5dGhp
bmcgd2UgbmVlZCB0byB0ZXN0IGFja19ubyBwcm9wZXJseSBpbiB1cHN0cmVhbSwNCnlldCwgdGhh
dCdzIHByb2JhYmx5IHdoeSB0aGlzIHdhc24ndCBzcG90dGVkLiBJIGFtIGdvaW5nIHRvIGRyb3Ag
dGhlDQphY2tfbm8gYml0cyBmb3Igbm93LCBhbmQgYWRkIHRoZW0gbGF0ZXIgb24gb25jZSBJIGNh
biB0ZXN0IGl0IHByb3Blcmx5Lg0KDQpJJ2xsIHJld29yayB0aGlzIHBhdGNoIHRvIGRlYWwgb25s
eSB3aXRoIHJlcV9ubyBvbmx5LCBhbmQgSSdsbCB1cGRhdGUNCnRoZSBkcml2ZXIgcGF0Y2ggYWNj
b3JkaW5nbHkuDQoNClRoYW5rcyENCg0KRmFiDQoNCj4gDQo+ID4gKw0KPiA+ICsgICAgICAgeSA9
IGRtYWNfY2hhbm5lbCAvIDI7DQo+ID4gKyAgICAgICB1cHBlciA9IGRtYWNfY2hhbm5lbCAlIDI7
DQo+ID4gKw0KPiA+ICsgICAgICAgZG1hcmVxID0gSUNVX0RNQUNfUFJFUF9ETUFSRVEocmVxX25v
LCB1cHBlcik7DQo+ID4gKyAgICAgICBkbWFyZXFfbWFzayA9IElDVV9ETUFDX0RNQVJFUV9NQVNL
KHVwcGVyKTsNCj4gPiArDQo+ID4gKyAgICAgICBrICA9IGFja19ubyAvIDQ7DQo+ID4gKyAgICAg
ICBmaWVsZF9ubyA9IGFja19ubyAlIDQ7DQo+ID4gKw0KPiA+ICsgICAgICAgZG1hYWNrX21hc2sg
PSBJQ1VfRE1BQ19EQUNLX1NFTF9NQVNLKGZpZWxkX25vKTsNCj4gPiArICAgICAgIGRtYWFjayA9
IElDVV9ETUFDX1BSRVBfREFDS19TRUwoYWNrX25vLCBmaWVsZF9ubyk7DQo+ID4gKw0KPiA+ICsg
ICAgICAgZ3VhcmQocmF3X3NwaW5sb2NrX2lycXNhdmUpKCZwcml2LT5sb2NrKTsNCj4gPiArDQo+
ID4gKyAgICAgICBpY3VfZG1rc2VseSA9IHJlYWRsKHByaXYtPmJhc2UgKyBJQ1VfRE1rU0VMeShk
bWFjX2luZGV4LCB5KSk7DQo+ID4gKyAgICAgICBpY3VfZG1rc2VseSA9IChpY3VfZG1rc2VseSAm
IH5kbWFyZXFfbWFzaykgfCBkbWFyZXE7DQo+ID4gKyAgICAgICB3cml0ZWwoaWN1X2Rta3NlbHks
IHByaXYtPmJhc2UgKyBJQ1VfRE1rU0VMeShkbWFjX2luZGV4LCB5KSk7DQo+ID4gKw0KPiA+ICsg
ICAgICAgaWN1X2RtYWNrc2VsayA9IHJlYWRsKHByaXYtPmJhc2UgKyBJQ1VfRE1BQ0tTRUxrKGsp
KTsNCj4gPiArICAgICAgIGljdV9kbWFja3NlbGsgPSAoaWN1X2RtYWNrc2VsayAmIH5kbWFhY2tf
bWFzaykgfCBkbWFhY2s7DQo+ID4gKyAgICAgICB3cml0ZWwoaWN1X2RtYWNrc2VsaywgcHJpdi0+
YmFzZSArIElDVV9ETUFDS1NFTGsoaykpOw0KPiA+ICt9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BM
KHJ6djJoX2ljdV9yZWdpc3Rlcl9kbWFfcmVxX2Fjayk7DQo+ID4gKw0KPiA+ICBzdGF0aWMgaW5s
aW5lIHN0cnVjdCByenYyaF9pY3VfcHJpdiAqaXJxX2RhdGFfdG9fcHJpdihzdHJ1Y3QgaXJxX2Rh
dGEgKmRhdGEpDQo+ID4gIHsNCj4gPiAgICAgICAgIHJldHVybiBkYXRhLT5kb21haW4tPmhvc3Rf
ZGF0YTsNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxv
dHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IElu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

