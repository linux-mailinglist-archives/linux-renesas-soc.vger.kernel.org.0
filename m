Return-Path: <linux-renesas-soc+bounces-13743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2BCA465B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 16:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41A874261C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 15:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063FD21D59C;
	Wed, 26 Feb 2025 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vUplyHDY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B113121D3FE;
	Wed, 26 Feb 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584683; cv=fail; b=WrUm9WpxPvrs3XA+3DZPRzVy2TXTDqpmBsFcqEQkNSbgVlCymHzd942db7hNQfIXnay21igJL1w8C0esl2xgKnG9Hy6b/fgy1EWpnbssrqPILEfw3dLlFwyoDMcnTgXyvroeEsi+KS16Kgi1DLVI43Gyeo9yDI+DD/8NRiY6PsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584683; c=relaxed/simple;
	bh=kUOaSDF4Av/wxeb+wPfXup3RRWrlBORxxobNb47eIqo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dh7sTxmGvU+5FxmMH/1t4gKf++SlW+kqIRyIgrT68vM48BV4+A/klljHu36VL9bVsrkUIbQ20V9aQ2ihjnSZos/1wJg3QZNzrup8QRIXy9cYG9CpZKYbJsPpfXqbzXTzs7AShwgvoZ/Wj0JyzcnOQXrf57UFZzao8MUNoDZBo34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vUplyHDY; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+XVRv2A1lMgzVgQWRqk0BhAYPQNoSFM1iMDbgRlGJhmCMP3SPig8y9L4rX8yCnQUvzQt0Hhey9RWDuAXKgtW7Fc6ffwXR4Bmmn7TnM75cYrEU5GwZHkyVBGmQoq8SCjQ9xOvN0vUrG31FPmHn38QY/9HQKuj9SNGQNZ4kG6ye0lnSVeDg0XVrf1AcawsWuUeBuju4r6wXltg8/aMHD56UcnI7lMoTziKsq9vGpBgmYVCppVfP1VYMxtQovMQFS6khdnSm9ogyjxBNC5AKSHMp6VDGcSDEKzTikFozpg9gZiw7dDnayXkQ23FAa0BEkLefUepcfllpGO2hzrkH9/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUOaSDF4Av/wxeb+wPfXup3RRWrlBORxxobNb47eIqo=;
 b=awb5WJ8WDqhid1+rf9752BajXogs4GwbjmwIzSkJNO0YGagMK6ljYGZNz470yQh+djixWCi+8DcIol5Kox9lg/q6CXcVqB8Z07YdNvy2BdYvDe2AtjKNzb/ZJF46V0ZZRMXYCwsEorQSNuSQpDQuI74ogUdXFKntSx9K+SwYUNpkEjP8BfDJCYG/k7eQVA96bnMDAphXEFbEcTJMSsx5QoN1KbaZGmeIenxLtGeBaKZskk98BmN88KxTZh6ULqWqkJR95w4bLKqlLgIEnX6Nb1Cq7/3c8HLxbKBJxvzaGVYgxVGKSYfARZc6L7rqNPejfza3bCn7CRJnom6CBYZcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUOaSDF4Av/wxeb+wPfXup3RRWrlBORxxobNb47eIqo=;
 b=vUplyHDYeL6Haiw20HUUQJ0SvDEa74WXguAiIoiam2xXbr4G25DOTMq//8aS2KoGL40YNj3/x2gy2AmLx2clDeg8N4CeHExafUhN13UoLW9AFMdYRv9dCKS3TL0lxxAwt9zSQStHihzYhInDnEofaB1/rGp8YVsYiAe+bHbRzXg=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TYVPR01MB10846.jpnprd01.prod.outlook.com (2603:1096:400:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 15:44:36 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%4]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 15:44:36 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "thierry.bultel@linatsea.fr"
	<thierry.bultel@linatsea.fr>, Geert Uytterhoeven <geert@linux-m68k.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC
 option
Thread-Topic: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC
 option
Thread-Index: AQHbiE/a4G/Z4/2QWkiecfuwWl+1JrNZow+AgAAA7rCAAAP8AIAAEZkg
Date: Wed, 26 Feb 2025 15:44:36 +0000
Message-ID:
 <TYCPR01MB114921CE8B9EC636015F2EB418AC22@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-14-thierry.bultel.yh@bp.renesas.com>
 <fe4ccf6d-bdf0-41eb-bffe-83d459319689@kernel.org>
 <TYCPR01MB1149252F0825C9BCF6A1B832F8AC22@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <f134c607-2a03-4ee2-9f7a-befa1e4feb74@kernel.org>
In-Reply-To: <f134c607-2a03-4ee2-9f7a-befa1e4feb74@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|TYVPR01MB10846:EE_
x-ms-office365-filtering-correlation-id: 24ad2ced-581f-4090-9e94-08dd567c78f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b0t0TzFxeDE5aVQ4WWhUQmlUU3QwaXBpM2h1RERPK1pUNndPUG1Ia05sWHZ0?=
 =?utf-8?B?ckthNEliMm5rWEg0T1krSTZUaHNDL2x3cjRYNWk0VjhnTUNDNmkzM081WXNo?=
 =?utf-8?B?Q29lV0pLYnBYWnE0Q2VvZmIvSUdPZTBDck9qWHdaanpSYysvMEpVQjlRdlp5?=
 =?utf-8?B?RHJzUFlkanlJdVRrTldJaWtoSEtkOW9tOW1ueTQxT2xCazVXMzQ4RzVPaWsw?=
 =?utf-8?B?dnFHMkNZY3E2YVM5azdSd3lLRkZIQ1diZmZJUnNNalk2ZkNSOEJEQlc4Q2U4?=
 =?utf-8?B?alQyUEY0N2FQU1hnVzB3SXBuaWFmMGhRQ042UnR3TDVGMFhhMDJvU0oxSlF0?=
 =?utf-8?B?MWpYY2tQalJKMW04cXgrZkNzN2J1TFpNZzhzYkZtWlQ1NjlLUDlOZFpBWHFI?=
 =?utf-8?B?T1dhZVJuUzhlS2hta1U5N2tTd0Rkd3BJVGs5YmlpNGJqVEp5UytUQVorRmJO?=
 =?utf-8?B?N2FkQnQwcUdhOTNXQ2MyUHpPYVI0VTMvUmFpc29iK1ZoZ01YVTd4Sk5HeXRB?=
 =?utf-8?B?NE1pR0RGeUZ2RENBTTFhbDV6bjBpTldUVkNFTzJENEEzc1Z3Vi81Qm8wYmRp?=
 =?utf-8?B?VXBtalNJNHRyNFZuL05TaWt5cTVOVlp0NHplNEhRczFoeENmVE16empZMWhS?=
 =?utf-8?B?WWl6dTk3S2I4V0pzd2VLSHpEelV0UW1wY1dxSlVtVWN1MjFHWnJva3dZbzE3?=
 =?utf-8?B?UEhaRStCd2JzeEsvUkxFU1JMS0RuQXBMN0J6aHZacUhOamxKOWZCSkRac1B0?=
 =?utf-8?B?T01xSnJEVVV5dW1FYXpNaW9icHh1MzFzWTJyUnBCTWIrVjlsSGhkTmFqRVBX?=
 =?utf-8?B?dzFaOEd5VWVaaFl4c01GRWVqVFJFZGh3NGJCUFpOdXpzMlRwZzdYTFFSTzBN?=
 =?utf-8?B?R2QxcXM4WDFYcU5JcE9zU01udFBqNnlNSVVjK044RDFZTStVOCtoSFA3M1g1?=
 =?utf-8?B?UDZ2T2dQYzNlbVRhY29ENkV5ajRWUjIxYnE0bENhQ0t5eWdzZE5xejN1cWRk?=
 =?utf-8?B?R3JWc2cveHFtcmRLUVBVQmxVcEd3eWUwVFU4VlMvUUU2WmZKUW9WWVFqUVg5?=
 =?utf-8?B?WG1TekZqUWtNSjFHNHVDeVBCOVlSUHVmbmJ0SVNGcE1DRXhrZHpKbnFzNFBl?=
 =?utf-8?B?QUpqTVpNQUlTQXdpakU5UWlzTzhqVmk1NCtMOVAvMUhDcHhrekIxU0RiRXJq?=
 =?utf-8?B?OGdOVWsvWkVSeCtYZVlBOEpSKzlpcnlxMzNhaGRxTzZjRXVYTS9SdFJ2S0k4?=
 =?utf-8?B?NHYvWUduYytUVlNOTENvdTZBWVd4TmFNQUxPN00vYXhrQTczbC9hbmU5ZTB0?=
 =?utf-8?B?ZUIyMnlNaVJodVRNUnE5N1lmNkJ5T0hCYXZXVG9yeXJXdE9oZ05qNGxqZWxP?=
 =?utf-8?B?WHBJZjJHempiVXpwL3N1UWJXR3ROdVErVE5PRDR6T2VDWTFGZE8zQ3B6ZjVp?=
 =?utf-8?B?cy8xUkFPK0RxNTBYQVZ1azlGRDlVdTBBUHd0dWdPL052Z1ZPZnE1ZFVFeGNU?=
 =?utf-8?B?RGsrOHpqYWozNkcvV1V4czh3VVFJMVNNUGpnWGEzdGExU01jS3VmL3VjanZI?=
 =?utf-8?B?UUlRNFJLL3dXMFRuS3FUaWUyOFpYd0hzOUtLaDlWUjRxR3hOWlJtd3lWeHor?=
 =?utf-8?B?QWY0aFcvMkVyeE1YRFFHcXoyUVk5dHEzWEY1WEhMWWhHQXBlOG9hL0FDdllB?=
 =?utf-8?B?b2YyL0VER1JnRE5lZkNDcWpXT0JvZjloN3ZiMFEwenRqaHRNY2pjaU9PUkxJ?=
 =?utf-8?B?SzlSRVFEOFg2MWxQZ3JPdHdnakhkdjVRME5DZHMrNGNkZVZKMFkyQXp1MUZ6?=
 =?utf-8?B?bkJVZTJaVHlGY08yQS9qNzZXbmViaWUxNzJOOWx5dEYxNkZaYmZKZDVDUjRW?=
 =?utf-8?B?aFh4UFpMaFFSMFY0UjdYVmRHaFB6dDZ3Vnl4SExETktvbzQwa2hRRzR0ODV1?=
 =?utf-8?Q?Xj5WRHwtnKcuBnBj9MeaZuFKchpyPawo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SW5vVHV5SlhKRmRtZElvR1JhdGRrMHU1UkNFZTlhK0xvczZOY3dDYUdvS2tr?=
 =?utf-8?B?RE1SOVdpdXNvYTAxdHF4OWNHL0tVcFd1TXU0WnlQN1F6eWkvTlVsS1hJeEw1?=
 =?utf-8?B?Skl0TkVoeTUzNDdsU2Z2TWtFWXJVTTRjc084cFU3RkVLb1dBY0xPckR6Z1dX?=
 =?utf-8?B?ckt1T0lyVDVtZmRudk1jZWs3RmF2RnNVcEtwVEVBM3Q0WVBOVVVscTRDSjJR?=
 =?utf-8?B?VVM0RmtzU2FHUCtERnlwanlZd2phT3I5MXphZFI4Nk1kbkJpRVV4M3VhVXlV?=
 =?utf-8?B?eDd2VlZTQnpBaXFsSitqRXNlTU05V0lLaTZVdncwMVJpaHIvU0x3Y2NIN1ho?=
 =?utf-8?B?dG1jc3ZlcENRUlVFN1lldThpdnAvSUFFQnVhZ2tHVVNuQmFYcmN4YVV6VXMr?=
 =?utf-8?B?T3lDdjByR0swVXc4amxRSEZPcnN5YUZIcXRuaVVPMUxEUlppYnZ5SXBZTUxC?=
 =?utf-8?B?QzI0UnhpR0FONjF4MXNsYmxtd3pQZlAwUzBSa3FOVlcwSXdlUTQ4VmJmNVE4?=
 =?utf-8?B?SkNJcUZQTmxPc3FxTExpMHlHUkdsYWtaZEx0ZENCVmFUMjF3ek5zSmVacjFl?=
 =?utf-8?B?aXVTL2Qwc0NtVE1lbXJYWGkzR21TaFVaeFNWdTlzZnF1bDNndjNadWNIS0VY?=
 =?utf-8?B?WGVPckZMTVBGbzdoTGV2RU14dy9nVHBITzgwU2p1bXEzZHlhRVZGek0zRXJB?=
 =?utf-8?B?QVFQSUlwYXMvRFoxaGMvRUNIR0p3NC9oQUI0NUg0Y2VhYXplK1NEWVZ4Y2Jz?=
 =?utf-8?B?S0tsb24rYWZVSTZERFVTd0tHY3YvSVZmYnlCbHJwVmhCTndMalZ2RmNLRERF?=
 =?utf-8?B?bmVSTUJka2VpNkU2a2w2ZERnWCtPZHFXSmdZZ2c5Yk9VRzBGOTBIV3diQllj?=
 =?utf-8?B?amd6V0t1UU5hOS9ZSkFLRlJETnR3MWIwZVJ1eEZpN2xKdE5qeXgxUGVsdDVB?=
 =?utf-8?B?OCtHOTVKUTg3MEJSY0d4TTBhMzJqY3B2cHJwcTV5aGtNeFFUcGRYL1M4dFEr?=
 =?utf-8?B?MEx2ZGpSWDBoZHBKajU5WjYrQ2laWGoxMWlCbWNScnB6dTVlbGlFcFVVUkdn?=
 =?utf-8?B?VzVZS3E5cnBzSW1ZY2FnOWh3akpEUmFhTkk0a1I0ei9vcHRmWHR0Nm5JZERZ?=
 =?utf-8?B?YkdTYXlFdTh2dENjb3lXNUlWeTZzV1ZuSjBHWlR4ZGg5alIzdW5lZTJwdEt3?=
 =?utf-8?B?RXZWT3BZV2R1T2pGakRmaGd1QXNxbEtidGx0Q01IM1Brajk4VE5GVGNmd0tW?=
 =?utf-8?B?UGpydFFhdjlqTjFyNHF4L1J1Y0JHMUFTQ3VjQytLYmk1WXlTWFpRdEtYZFZo?=
 =?utf-8?B?WmpIV294dDFWQlZqRGhaS253WXhVa09EbTJMZkllb3NLUEdnL1BtaUpURzNU?=
 =?utf-8?B?ZWlxbUFjaXhEVDZ1blIyTHE1NUdLL3FKWlhCYTJmNmJGUzFXWjBLUnNMbXFT?=
 =?utf-8?B?cUtXbHhRMHBQeDZxQjFJSE1aSkk5aTlTYXpVSGNTeUxKbWhkalF4OTAvcmNE?=
 =?utf-8?B?UU9mb0xBVEdmdEtIYm9ndkhUVDJFS0NqdGxSNlE5TlNXczllY2szclJRaVpJ?=
 =?utf-8?B?N1ZzL0txTHk1dllUVFVWWHZjUEd1aDNTQnF1NEcxamVLQ3pRV0s2SThOVzFp?=
 =?utf-8?B?VG00bmgrU3I3UmpXb1FBbzBWRWM4MUZvTlcvK3FsMlhoTFFvNDQzUmgvYlFi?=
 =?utf-8?B?R210YkJ4QkV3WklWMktqNjViWVlUY2RLbHlsVXZCcW5iVjVQRnJjUkM0UUMv?=
 =?utf-8?B?djl4QUx4dmFMTU5pMGRUejhYa29MQWJQTjdFTEJ4MDJaQVV3RW9oUzQxSCtC?=
 =?utf-8?B?cjQ4VmU3MjBGS2VRUUpZVTlsZHN3elE4bzg2L1FaZVJUTXdyNk8wK2xWbkpH?=
 =?utf-8?B?RDRocHFRSUphdnV5V0ZLUzUzcm5OeHYzVTU1ZEN6VUN1UmlNY2RxTTV4VzNE?=
 =?utf-8?B?R1lXZVNJWVVVd3lBajhOeVB3NGRxcTdrODZJa0F6dThyL29VTWR4RGJwZEU4?=
 =?utf-8?B?bzRTTDhJYXpESWwxYnBDbFZ1TkF6anRSb1BrdFdrYU5IaHVOaDFmeHZJMHcw?=
 =?utf-8?B?MjVueWRhcFZHUW9mQlpXUFZ2SElVejcvbXRRY0hoQUJKc29vU09DZUhvU2hM?=
 =?utf-8?B?K3ZQcVlSN2FaZ1RzakRQd29vemNvVTdtVnVrQnZ0YlNQK3c3RXJ3NVlocXhC?=
 =?utf-8?B?RFE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ad2ced-581f-4090-9e94-08dd567c78f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 15:44:36.1432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQ9PoXGWWz3ZjzcKQMS8D778XKChwROqNLIKGyRLYsUXI2/PkS+pcN/UdQCn1xIZjlYI9hykH6ROafApVFGcHBrIuO454AXRcr8x7varV6deVf3hR3iVKfBu3qpQSjaf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10846

SGkgR2VlcnQsDQoNCkNvdWxkIHlvdSBwcm92aWRlIHNvbWUgaW5wdXQgaGVyZSBvbiBob3cgeW91
J2QgbGlrZSB0aGVzZSBjb25maWcgb3B0aW9ucw0KdG8gYmUgaGFuZGxlZCBwbGVhc2UgPw0KDQpU
aGFua3MgIQ0KVGhpZXJyeQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogbWVyY3JlZGkg
MjYgZsOpdnJpZXIgMjAyNSAxNTo0MA0KPiBUbzogVGhpZXJyeSBCdWx0ZWwgPHRoaWVycnkuYnVs
dGVsLnloQGJwLnJlbmVzYXMuY29tPjsNCj4gdGhpZXJyeS5idWx0ZWxAbGluYXRzZWEuZnINCj4g
Q2M6IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgZ2VlcnRAbGludXgtbTY4ay5v
cmc7IFBhdWwgQmFya2VyDQo+IDxwYXVsLmJhcmtlci5jdEBicC5yZW5lc2FzLmNvbT47IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEzLzEzXSBhcm02NDogZGVmY29uZmln
OiBFbmFibGUgUmVuZXNhcyBSWi9UMkggU29DDQo+IG9wdGlvbg0KPiANCj4gT24gMjYvMDIvMjAy
NSAxNTozMiwgVGhpZXJyeSBCdWx0ZWwgd3JvdGU6DQo+ID4gSGkgS3J5c3p0b2YsDQo+ID4NCj4g
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiA+PiBTZW50OiBtZXJjcmVkaSAyNiBmw6l2cmllciAy
MDI1IDE1OjIyDQo+ID4+IFRvOiBUaGllcnJ5IEJ1bHRlbCA8dGhpZXJyeS5idWx0ZWwueWhAYnAu
cmVuZXNhcy5jb20+Ow0KPiA+PiB0aGllcnJ5LmJ1bHRlbEBsaW5hdHNlYS5mcg0KPiA+PiBDYzog
bGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBnZWVydEBsaW51eC1tNjhrLm9yZzsg
UGF1bA0KPiA+PiBCYXJrZXIgPHBhdWwuYmFya2VyLmN0QGJwLnJlbmVzYXMuY29tPjsNCj4gPj4g
bGludXgtYXJtLT5rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEzLzEzXSBhcm02NDogZGVm
Y29uZmlnOiBFbmFibGUgUmVuZXNhcyBSWi9UMkgNCj4gPj4gU29DIG9wdGlvbg0KPiA+Pg0KPiA+
PiBPbiAyNi8wMi8yMDI1IDE0OjA5LCBUaGllcnJ5IEJ1bHRlbCB3cm90ZToNCj4gPj4+IFNlbGVj
dHMgc3VwcG9ydCBmb3IgUlovVDJIIChha2EgcjlhMDlnMDc3KSwgYW5kIFNDSSAoc2VyaWFsKQ0K
PiA+Pj4gc3BlY2lmaWMgY29kZSBmb3IgaXQuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTog
VGhpZXJyeSBCdWx0ZWwgPHRoaWVycnkuYnVsdGVsLnloQGJwLnJlbmVzYXMuY29tPg0KPiA+Pj4g
UmV2aWV3ZWQtYnk6IFBhdWwgQmFya2VyIDxwYXVsLmJhcmtlci5jdEBicC5yZW5lc2FzLmNvbT4N
Cj4gPj4+IC0tLQ0KPiA+Pg0KPiA+PiBZb3UgbmV2ZXIgcmVzcG9uZGVkIHRvIG15IGNvbW1lbnRz
IGF0IHYxLiBTbyBJIGFza2VkIGF0IHYyLiBTdGlsbCBubw0KPiBhbnN3ZXIuDQo+ID4+DQo+ID4+
IFRoYXQncyB2MyBhbmQgc3RpbGwgc2lsZW5jZSBmcm9tIHlvdXIgc2lkZS4NCj4gPg0KPiA+IFll
cywgSSB1bmRlcnN0YW5kIHlvdXIgcG9zaXRpb24gYW5kIGhhdmUgYWRkZWQgYSBwYXJhZ3JhcGgg
YXQgdGhlIGVuZA0KPiA+IG9mIHRoZSBjb3ZlciBsZXR0ZXIgYWJvdXQgdGhpcyBwb2ludC4NCj4g
DQo+IFdlIGRvIG5vIHJlYWQgY292ZXIgbGV0dGVycywgdW5sZXNzIGxvb2sgZm9yIGRlcGVuZGVu
Y2llcywgc28gaWYgeW91DQo+IGRpc2FncmVlIHdpdGggc29tZW9uZSB5b3Ugb3VnaHQgdG8gcmVz
cG9uZCB0byB0aGUgZW1haWwgZGlyZWN0bHkuIE5vdA0KPiBzaWxlbnRseSBkaXNjYXJkLg0KPiAN
Cj4gWW91IGtlZXAgYWRkaW5nIG1vcmUgYW5kIG1vcmUgc3ltYm9scywgc28geW91ciAib3V0IG9m
IHNjb3BlIG9mIHRoaXMNCj4gcGF0Y2hzZXQiIGlzIG5vIHRydWUuIE90aGVyd2lzZSBldmVyeSBj
b250cmlidXRvciB3aWxsIHVzZSBleGFjdGx5IHRoZQ0KPiBzYW1lIGFyZ3VtZW50cyAtICJub3Qg
bXkgcHJvYmxlbSIuDQo+IA0KPiBTbyBhZ2FpbiBOQUsgYmVjYXVzZSBpdCBpcyBzb21ldGhpbmcg
b3VnaHQgdG8gYmUgZmluYWxseSBmaXhlZCAoYW5kIGlzIG5vdA0KPiBldmVuIHRyaWNreSB0bywg
c28gSSBkb24ndCBhc2sgZm9yIGltcG9zc2libGUpLg0KPiANCj4gDQo+IEJlc3QgcmVnYXJkcywN
Cj4gS3J6eXN6dG9mDQo=

