Return-Path: <linux-renesas-soc+bounces-18489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE64ADE61F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 10:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31F90188C401
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 08:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC4927F160;
	Wed, 18 Jun 2025 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="veFcK6le"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CC41DF968;
	Wed, 18 Jun 2025 08:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236900; cv=fail; b=gsYTAhLH4uS33Sl3ISjIUarpexzS3bWoTGMZuk+q6g4xvsKBNdRnyo3rHHEo3l15O+knO6w91N7at11MjiIbuJIq8y07ueHcKznFJUr7tdcJEI2zNA7CGu86fPUW8eQUKQgf5oRF3twg186f+EaZyhQkBdMbX4GY/ogKpOyu/L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236900; c=relaxed/simple;
	bh=aKsYTrv9piq7TbC0eqxjbTawv9mQdOnnE5B1IX/ZwFg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BP7WT+Pb75sI/OKdujgBfVbiE6WFtDecQqst/Uo05moP4guePMMugZOrv16lehnENcMiMe9CW7PXcXSX9eV4l/TdmnchsmE+9QKNuK6hjP20FCmrtzdmKTn2hBEmWLsoNUfgqKddvtxv0GUpnVyhpktVk3USPM8aGcXPY1/D8vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=veFcK6le; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5kJOzLue7qSe76NG0vMwQMGzxfKhpyl/fA7NivBYI9DhFPwzp0o0QNf1IaaDU1EeE6Ek7wrIwelpmFs1kHvlW6qQ1S7OTgaYfx2fmmKYB3alqLljd2oHInBr3A0Za9dbyQYltseHqJnTo0eErouQ8ZcW7e4HQiiGAXvGirk7T8Z6l1iaVcmlGtnU/eK09OFx2Um+cPWV4zKCQTCharVXaeceud+ti2uNVwMxu3hAKJkRFFM1Me7WjIIxxOfDbWjs/85HBViQU+2XqwUn0B306lW+hDtD/4schkwpGTpTXaPKKT0w7lW3BBY/MybeX1dAz15akyZxjPU9aigQwSTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKsYTrv9piq7TbC0eqxjbTawv9mQdOnnE5B1IX/ZwFg=;
 b=AgLhFH4iudMX2BM2z1Cf1ful7FEKaw/LPp2hZ9gFU6LRWwrbk0GK+BQtW8nErH6RNTfmaPldGQZeZKNsciqYZJn9Z3P19RVOZPtp9gckrKa1kd4hc2gPHtL3RU8dZf2GP7ct+mWi+XXeIwkOsEqBbpZIiNJdn3W4iCM0Sw8y+Rs6Zu7+2yW700gxsdVyj9ILaruYVsxmFExw917MJRAFYOn9ynK06rUKChGleYlmIu8a7mF7tJC1Zc4669Cd15fD7JKm6e5Tb4Xc/kx1taOW2+mWP47olMbQbDLYp5Tcg3JADxyhurbnVa6N4s94m8VpTfCIIkdV1TcDUDprPZhWtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKsYTrv9piq7TbC0eqxjbTawv9mQdOnnE5B1IX/ZwFg=;
 b=veFcK6le5d+BCZo6NOJO3NzS0D5RvwrVtojF8CNFSFgtipRoaBDMFGO6JOY0Zr6SQgFZyh4GvmsUNLgpLZ2ERp4nzIzxsF94gdgIuR5Yp4hjQszqCIePqWdnhPrT8t77NPRh1zWLJvhdQnAtlrzXhtbI67Ea0dKcO2doOrM7p+0=
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com (2603:1096:604:3a0::6)
 by TYYPR01MB8136.jpnprd01.prod.outlook.com (2603:1096:400:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.33; Wed, 18 Jun
 2025 08:54:54 +0000
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82]) by OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82%3]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 08:54:54 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "robh@kernel.org"
	<robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] arm64: dts: renesas: r9a09g047: Add GBETH nodes
Thread-Topic: [PATCH v2 2/3] arm64: dts: renesas: r9a09g047: Add GBETH nodes
Thread-Index: AQHb2phembLNMWmxOU6Ev4btdVwaP7QHhMwAgAEifKA=
Date: Wed, 18 Jun 2025 08:54:54 +0000
Message-ID:
 <OSCPR01MB14647A762408F08501D4A20DDFF72A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
 <20250611061609.15527-3-john.madieu.xa@bp.renesas.com>
 <CAMuHMdXEL17KruAigL2Le+9ATLWo7hQqGZjaEsFKpDt7pQr_8g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXEL17KruAigL2Le+9ATLWo7hQqGZjaEsFKpDt7pQr_8g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14647:EE_|TYYPR01MB8136:EE_
x-ms-office365-filtering-correlation-id: 0051a07e-8ac9-481a-9f24-08ddae45cb73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dDdoVVJqUXRNMUMrUTZzZytSaEhraFcydXo4RDRpNmlVdStEdGR3MzM2S1Mw?=
 =?utf-8?B?cHNiVkkzNEd0bGd1ME5jTU9xWDdJb1ZYOUJiNENCZVVMcFBjbnU0MmtXSHR3?=
 =?utf-8?B?dVJVV0d0QzBVYi9ESTY5Z3NHSTBBZmlFZ05OUjRzandTVHhJTUFCREpmVlRQ?=
 =?utf-8?B?bnlwVXpZWmdKWmkwcDNZNys2ak5qa25wK3BIaGZCb3JGYisyNERIcTEweis0?=
 =?utf-8?B?VWVaNitMci94MEVDck1DUnBVbEhQR1JuelMzR0MxV1ozMkVSYTZFV1VBd0E2?=
 =?utf-8?B?UFNzRkhpMCtRVW1SaDhFdFN6ZWdPYTdpcDZrKzNLMkE3UXZJNjFxWjRyc3Z4?=
 =?utf-8?B?ZDQrOUh0TUpha2pRUVhLNDV0MWZpankxbzB2ZUlDNmJIRG1scUIybUt5UGQ3?=
 =?utf-8?B?SGFYTWQvb2dkMDJjaW1SNmliSFpZeExnY2s3Mmp6cVNiUE5JT1lmU2xrOHk1?=
 =?utf-8?B?VVJsYjhWcVMwKzNvd2Z4aEF5SFJPQlJIU2dWMm5Za2U2MWNWcGt2M3crRjRv?=
 =?utf-8?B?OG56cDV4dHNZSU1NQytMU1ljQ04zVTk2UVljOFNaenM5UjJFTDFwQVpsUG1E?=
 =?utf-8?B?MXNaam5rd05nU2F2eVdCUkptTkdtOFRENnRZbVNWaG9GNWRSMnNqQlNnaFh6?=
 =?utf-8?B?MldsVGNQd1FoelRVaG11a24vZFo5cFNxSzRESDNlbVF0ZzVuRzByYXB1OHZh?=
 =?utf-8?B?RG43dWpYY0JXd2N1ZVk3VUxlMHVTYnd2Qkhlekk2N1dXQUhJcVB1YXg3YmY1?=
 =?utf-8?B?ZXhIOGV6RDduR1h2OTcrdlVRY3BLRGJ1aHZDSXNMaTRDSWs5dGNLVS9kTWRz?=
 =?utf-8?B?c2JqYW9lN2lkamF2S2RVOERXeFFUVWMwQXJGclY2Z2ZFY0tWNlVySk1CSzRH?=
 =?utf-8?B?SWRhbW5xWi80UHlvYzVlZGlNdFVyVDFINHExRFpiYlFzUDI2RUlDd3paVGFs?=
 =?utf-8?B?WDgxYngvbCt0bGZrWVMvRmh1RmZxNlJTVW0zdEtJTngxVlFZd0ZmQSt2Smx4?=
 =?utf-8?B?VkROM3VzTHdYR21tODNXTXJsWGtTZmFKSGdFU0VxMWxERUp5MHFFRzBiVkRJ?=
 =?utf-8?B?R2NUakFwR1lEdVhETlhBcnpqdytaWFBsRDNMKzM2eDdzUE8xd0pWV1BjaGR3?=
 =?utf-8?B?cm5SMnVra0hJb2FPYVk1RTJpNjJxTXl2Q3NybnRPZTZxY3ZhNEpWN1MrT2pU?=
 =?utf-8?B?RVkrcmZDdks4OEsyWllOWkJrRlBIVUVtTkhReXhSZEMzWlF3YW1KZ3UxdVB6?=
 =?utf-8?B?cGY0TWNXQnloSXhiNERlSG9FWmoydjdXTytHWFp0eS84d3RsNXN1cE5yOXVy?=
 =?utf-8?B?NW5ockVodzh5SGYxMmNpZmNhZDlnRDNnN01GT3lVcWl1ekowbWc5NlM0RG1C?=
 =?utf-8?B?L0dWSDcveUdvbytkOHFjV1IvMnJSWEt2ZmFueDVuK1VIM3dYSTNuMjFjNllq?=
 =?utf-8?B?OHZvZVZYZEt4WFg3NkxnbVlxbHBSZ0hHR0ZlK0hjWXRGbUR3UmkvS1dJYmE5?=
 =?utf-8?B?elBFQ0tMWXgxS0NSNU40NzN5dVVSWVBadWtsVS82SjlFQkRzZ0o0Y1Jac0M4?=
 =?utf-8?B?clU1SUU5dXlOQzNNdi9JUUdOYlgyOEE2cXp3WjJnZy84VDBqdkR6NTBWZk1B?=
 =?utf-8?B?Z3hBN3dVMXZwZEhmcGxvRUh5dnI0cTJNQmhnN0daeGtaNm12VFFyNVhUWDdx?=
 =?utf-8?B?c050dGVmTFFxZ0cwMUQzSy9JaVhxUW8yemtKUWN2akdYUXNoRDlUcG5mVGMv?=
 =?utf-8?B?d2IrbHNLTG5ZeFdoU3dWNS90TzRDSkMzaUhkT1o3MG1qMzJkcllKYXNHUkp0?=
 =?utf-8?B?YUI3aFFvSkpnRWZhUEMxTUx6TVltTExRanNraDJIUk5lYVlCYnlDL0d1QWJI?=
 =?utf-8?B?czdhWmpsWVpWdmhSSFVBODV5S1ZZeWc5T3JyMUYwWVZ3bGtRbVl4ckVGd2dv?=
 =?utf-8?B?VFJZQzlCS2k3ZmV3VWcySHNHY3hiR2VTME15aDVhTURKV2FUeExjZVJvaTFm?=
 =?utf-8?B?djVnR1R0V293PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14647.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEJkNWhQVzlqTDczaDRtMkgraGl2N1JYUlNFcmRrTDNqWVFBV2dDWG5YS2t2?=
 =?utf-8?B?bVJqZ0ZqUkJlN0M5NlNvSWczWnRKZFJkaUthaG9ybysyRWdGVnhWQm5WMzUz?=
 =?utf-8?B?NXhENHphUmp6b0htYXEvZFNRVE5CdEc4OFI3TDhiS1hPM1ZDaDRhQ3cvVEVw?=
 =?utf-8?B?bXREdjA4SWtMend4OUd5bWk0cmtzTEdLUXNwNzRqeVg4RzhZK2s3bVRMWDQ1?=
 =?utf-8?B?eGxTRXFDUFAxNGVQMkJDbzJMdG05Ym55Q3NlNGhVSDZ1c2krVWh6SHdHNDVV?=
 =?utf-8?B?Ylk0VVoyK2ZtUUVtNXp1NHkrQ05iS3ZLbzZxb2p0allDbDdtNC9nUW5ZazZz?=
 =?utf-8?B?TFd3Y2tyTFlTTU96bFR4K2RZamVQWmErUm93OFlmcFBkZS9iOFIvQVFtbzlN?=
 =?utf-8?B?dHRsT1lTVjYvZnpLYVR4QnJVSU9XSG5mTythV0x4WjBHQzkzVEVSSnhpalZh?=
 =?utf-8?B?QWZnODB5am01OW1zd2N3Q25GODZqajFkVkZRa3dHeFpCY2lib3psbHkwNHVj?=
 =?utf-8?B?WTdWU3Q1VFpBZE1GVFN1WVp6VEhMVUF2R0s4b3d2OVpiR2VJQ2FGSkRmZU11?=
 =?utf-8?B?andGUDNtbVB1bklkWlZ0bVhhemJWemc4alpRYSs1YUxlS1R4TGZGQmZFSWJD?=
 =?utf-8?B?YUV4TXU3c200Rytwa2Z0L0hvMTJsTS9oQmNCQ0RkRGJqMzRMK0E3OEJMcUxN?=
 =?utf-8?B?cEpwdENsRGtBU0pXZzMxN1REdUgySHZNMmYyTzFJOWNZS1hGRENRZlhnY25a?=
 =?utf-8?B?Y0Vmek4yQ2J6b0s4QlRFQUhGVFpSY0J0V21ibUlFVEpUWHV2NlZGNkcxNG9F?=
 =?utf-8?B?STVwVDUxckxZU20raVF1RzlicFF3UlBjb2VQSFhMWDY3UkY5WUJDL1VacDk1?=
 =?utf-8?B?NVM2MlcwTDFTbkErTlhOMVhzZkhhalQzTUx0SHpMbC82Y3VDVnFpSmNyK0Q5?=
 =?utf-8?B?RG9pbDRIa0hVa29FNHRwNmdUUGhzZEg4REhtQTlmOXorVEE1OEl0S3pmOEpN?=
 =?utf-8?B?MXZwTXV3SDVIdXdJbWxJNFBXcTZHeWZGbFZzMVZ2VjhSY242K3FVVjZOR21n?=
 =?utf-8?B?bkJTUmhxOTQxTk5pRjJDSFZlaEZoMkxWZmpOVFJDMHRYbFBnZHhFYTU5TUNO?=
 =?utf-8?B?ZTB5cVlyNGVsV3I3SEpTeDJpdWxMYjlvTU4xQjN6TGlqbVZQZ3MzRFpPenZY?=
 =?utf-8?B?SXFMRWtWcFpkYmJnRUN5Q2RxTXJDeUp3YXZvcG1RUm1kOXI1VjlZNitJTTFo?=
 =?utf-8?B?L1FrTXBjYjJDRXVkSENtSGF2RTM2bGtnV2JXNjJpZ0N2V3VFeWwvenRjQ2tZ?=
 =?utf-8?B?eEh3MWF6WHU3UFNwWjcvbFZIOXRaZWxVdHFETm54RjI5Z2JqTFgrZnpOOXoz?=
 =?utf-8?B?RzZpdkR0ZkVZWitmQmU1d1FWVDh1Yi9LcTlpdk1lNGJVQWFPZ3lydy9DTENI?=
 =?utf-8?B?T1VnSUc2QUdEOXVIZ1FuNy9OR0ZVYTRXajNEVUR1U1VkVUJTallwZGhmZzZT?=
 =?utf-8?B?Sk5Zcm1aWWR1NFE4ZnNaUkpzNzJSTTJsSDROVVFncnAwNGp1b3hhYTQyeE1w?=
 =?utf-8?B?UXN2cmVYcnJWMjBRMUw4TkFFRFVvWHZCenV1ZEZTYXJsQW1FbThwbG42MlJv?=
 =?utf-8?B?dHZmcDMvUHVnbkVqMW5NRkxoeVNNZVQ3MmNhdCtmS2Zlc3RTWG5Bb1ZlbkF5?=
 =?utf-8?B?SUpaTFFvZmE3WkVEL2FQZGNOaDVyNUkweStCTzZmMFJKOVNCbnh6QlUydUVC?=
 =?utf-8?B?OGJJRWpIQ3pDN2FGaDZMeEJObkQ3akpzZndxTVFHSnJ0TnRBbVFVODlBdkti?=
 =?utf-8?B?NW82c2tYV2RCZjlQbWhpdFA2Kzk0Tjlka2Z1L0xXWnRxTWorTHR6ZHRzZUJZ?=
 =?utf-8?B?ZFc2THlJNFJsL0ZKTjlOSXJZS290dXdJR04raGdtRStiNlZma0RaQkJQSEZL?=
 =?utf-8?B?OEZpY0xYaHZvNWFXSXYxaVpKdVlxemFFQVJNSWZOUUpxRjVqRXNwcmhjTnR0?=
 =?utf-8?B?dndOTUZkK0JGV212UFJLeXViYW5SQmtkKzdoOGF2dm9RdEdLa3MzWWJmSGpW?=
 =?utf-8?B?T09IaWl6Y2tYdW5qOWk3NXR6L1dZYjNSR3RWKzJuNkgvc3l1MFlLK3FqSmpn?=
 =?utf-8?Q?zmcBSHdKe+4lfRcmlC7uOmCXP?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14647.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0051a07e-8ac9-481a-9f24-08ddae45cb73
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 08:54:54.5187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l0pMgqjW/pK10k1/K1+vI9aYd/96C3trYLwQE+kzcqto/qxPmQ6HOSfUeAh3hMnAQESeZr7sZdkkmvj6RI9aBpTtQ1KzUqB871e+m3yCz2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8136

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogVHVlc2RheSwgSnVuZSAxNywgMjAyNSA1OjMyIFBNDQo+IFRvOiBKb2hu
IE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMi8zXSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOWcwNDc6IEFkZCBHQkVUSA0K
PiBub2Rlcw0KPiANCj4gSGkgSm9obiwNCj4gDQo+IE9uIFdlZCwgMTEgSnVuIDIwMjUgYXQgMTE6
MDEsIEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6
DQo+ID4gQWRkIEdCRVRIIG5vZGVzIHRvIFJaL0czRSAoUjlBMDlHMDQ3KSBTb0MgRFRTSS4NCj4g
Pg0KPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gVGVzdGVkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMu
Y29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3LmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3LmR0c2kNCj4gPiBAQCAtNzU5LDYgKzc1OSwyMTMg
QEAgY3NpMmNydTogZW5kcG9pbnRAMCB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB9Ow0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gICAgICAgICAgICAg
ICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBldGgwOiBldGhlcm5ldEAxNWMzMDAw
MCB7DQo+IA0KPiBbLi4uXQ0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBtZGlvIHsN
Cj4gDQo+IFlvdSBwcm9iYWJseSB3YW50IHRvIGFkZCBhIGxhYmVsIChtZGlvMCkgaGVyZS4uLg0K
PiANCg0KTm90ZWQuDQoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAic25wcyxkd21hYy1tZGlvIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
fTsNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIGV0aDE6IGV0aGVybmV0QDE1YzQwMDAwIHsNCj4g
DQo+IFsuLi5dDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIG1kaW8gew0KPiANCj4g
Li4uIGFuZCBoZXJlIChtZGlvMSksIGZvciBlYXNpZXIgY29uZmlndXJhdGlvbiBvZiB0aGUgUEhZ
IGluIHRoZSBib2FyZC0NCj4gc3BlY2lmaWMgRFRTLg0KPiANCg0KTm90ZWQuDQoNCldpbGwgYWRk
cmVzcyB0aGF0IGluIHYzLg0KDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInNucHMsZHdtYWMtbWRpbyI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIH07DQo+IA0KPiBUaGUgcmVzdCBMR1RNLCBzbw0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IEdye29ldGplLGVldGlu
Z31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoNClJlZ2FyZHMs
DQpKb2huDQoNCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

