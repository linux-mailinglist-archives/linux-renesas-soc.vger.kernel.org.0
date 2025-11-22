Return-Path: <linux-renesas-soc+bounces-25026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B1359C7D197
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 14:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 30BBA352A6A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 13:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE69156678;
	Sat, 22 Nov 2025 13:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HU7wOOMx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003FE35958;
	Sat, 22 Nov 2025 13:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763818334; cv=fail; b=c1OJdyUxQ99R4rQV96GvhcVL9Pe/Y7Briz4Ykay/oCaW/9moaxgLRrhY1sKvW9I57ZcjuatcNRo5sjIN6Mmcxf2wFMxIiYIaTQtR1Lt1g+NYanBlTWSoP8Rr1M9W2mgZqUIN7HKbF2SrpV/PqF6AlZCleWl5RV9NmNPZKAsA7tU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763818334; c=relaxed/simple;
	bh=P53Gbkw6fvy+ybRTVbHYEFqqcSOnSMus0QewD04ZYeQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jr9wdPHYSwV3Bsmv30VMaD2nuJDZxPwX7YK1AL04tXyVQ7YifF1/+OiYCDOeqZXOkR7fti/+ICZ1ezYvs9Ffp8l5GWHMYaEUwWPkM4bRFn/HlxigvncwHGK0YLbDqX4MreWgPtertnR24XWIBHBd/jAnbsOIGRceU5Uc9KJ2XI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HU7wOOMx; arc=fail smtp.client-ip=52.101.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSdfEyr+8AmNALZ2vUDkuJ9Nx27CgEThvkINCpgyAFMKxaWrajMXjXUwdQeQ65QdhwxbOJpLJp4K3wxvoWF+xsjL1KCSAQu4XNvQw7Jv0ym4kx4QFDLvEtUpk/V6SGmxc54+d61lY/73MoNZ8x1T4c9z80ec3i+YQoMu1IE0LBMgEOonPCAN7AES/+Z+NnSZHjaCN83e31H5gTlKLJUumoWc4cIspJ3WuuWL4q5KLBME3G2sYYnMf7o1FLy/esZFiiCXzrKhqGSTPajfpQprq5HrMbEq0fxI6Ufpsu6XBuvAD7p+IbzhYmZoJwDBwMkkp9XTqh4rFPcsMoMAv850ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P53Gbkw6fvy+ybRTVbHYEFqqcSOnSMus0QewD04ZYeQ=;
 b=EL2LF3P20Kz1/JyvINAXnjA6mPMkFM/3qhFRfIp0+Z7RGAfKUqcP+42dPUNTaeIH3pO7EO9MWBSu67dMZeD7zzp/fZyHtuyt3iScg6UYb7/AveL/YSurz+07XdWls8dIcaACj7YEX2oVUNhrjqgUrEkRIYn6fqH/KN0v7yoRPDMTBfyMEU4qNGUSwqq8fMuQGjFmc/lx9eYre6HkLOnknzRcHMCuA1JbISsPLC9Q3r/6EdkG5ks5hHNhZU4hBLCbRz60HLOc2V1QZB8UPPEZDTgVrl6MzNn7lyvAJHU1Q/Ks0Km0kGIp8IDdcn4GqzeD5LsdgBr9kPEuPfUzrWkj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P53Gbkw6fvy+ybRTVbHYEFqqcSOnSMus0QewD04ZYeQ=;
 b=HU7wOOMx6lbfp/7SkwstGv0URHUSzI8f9OyMQa/X+9zhBJJOhqZ41y2z7aCa4fkH4cPtVGkAb0VkQlVHlaoAqNAuD2STzOEsCA/0KL7mzH8fwLta82KFniEVod/xxaf+mLqyhTvaGH1OpAYFQw+xcpy/rP4eAV9p0cU+r8dPah4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11333.jpnprd01.prod.outlook.com (2603:1096:400:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.6; Sat, 22 Nov
 2025 13:32:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9366.005; Sat, 22 Nov 2025
 13:32:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 08/13] serial: sh-sci: Add sci_is_rsci_type()
Thread-Topic: [PATCH v3 08/13] serial: sh-sci: Add sci_is_rsci_type()
Thread-Index: AQHcVVS858XIEPdtWECURDujWjmNZbT9SS0AgAF0sQA=
Date: Sat, 22 Nov 2025 13:32:05 +0000
Message-ID:
 <TY3PR01MB11346A56EFFC3917372EB5E3C86D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-9-biju.das.jz@bp.renesas.com>
 <CAMuHMdU2bougdWmD1CpaKDKe0iVJD-H03qbNhhLgyfSpsxp15Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU2bougdWmD1CpaKDKe0iVJD-H03qbNhhLgyfSpsxp15Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11333:EE_
x-ms-office365-filtering-correlation-id: 13363082-a2fa-4f8e-f15d-08de29cb872f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NlJDWUNkeFo3K1hTYm9tc1kwYVh3V0t4WGVPQ2hnQ1hBV29ha0NKSjJCT2dZ?=
 =?utf-8?B?KzVjcWpndlRQcUcraks5N3lMbHFScWlBUEV3ck54Q29LQnV3VG1BR280OVM4?=
 =?utf-8?B?R1lOdGxteU9IZHV1WDZxWXhmMHRmZUF3S2JyQTlucWc2Z0MvVk0xRGVzTjNz?=
 =?utf-8?B?TDQ4d1ZmVFgvM1M0VlQyUHYrS3BrYzVzK0o2ZzBuSGFaSmthNFV1aHJ4WUZk?=
 =?utf-8?B?QTV2R3N3MGd6OVhEa3JIM1drcTh1cTUxYlhTbTZHWDczcm5hbWVEVFpURDVh?=
 =?utf-8?B?RklneC9iL0ZqeXkwRExqYjluZmFkb3JtdGdha0dsV0Q1MStuQzI5NzFxZ0Q0?=
 =?utf-8?B?dEdHWHR3cmpQZk5hOEJMaHlOTWNTU3plaTdtaXE3eUJvd3FLUEkzb2tGd1lq?=
 =?utf-8?B?VEk3UktCenBKY0ZVNXp3eW4wT0tpeUxycUJPK213YjlwWjhRSUEzazF0MzE1?=
 =?utf-8?B?b0h3WHBKcjM2OFdndmpWL0VENXVCSGo0Q0hucUpJMVBxUEtrbGg3Mmx6ZTZn?=
 =?utf-8?B?TmpGa0ZQSmN0cFR2Yk8xdmFYczFzVWh3YXBLWk1sMUN0b1MwQUhrZHRFTExk?=
 =?utf-8?B?NldmMWhmV2VVS245alFZWkcwYTFnbC9QaWF1QmJkWFZsdmFEZ3N0T0F0bWFL?=
 =?utf-8?B?ejl6N0NTTDRiR0habFR3bDZyeFR4S2U3YUJxSW92c3lzKzhkc0FUbDEweG9x?=
 =?utf-8?B?QktaTGkzUnFxdEo3RnhwM0VLU3lBSWpTZGlyRndYcUxRWHZlU1JZekhZbXpZ?=
 =?utf-8?B?ZzB1SUcwUjJ1U0lNbk1Dc1NieElGR0gvc2plOXkvRytLbllrZ1pNSFhVa2F4?=
 =?utf-8?B?SVdadUxnZGtORmxxeGxjOW55NUN0cCszc0RHajFKaFVvcnUwdTRCeDViNUJT?=
 =?utf-8?B?MkVpZDhsbW1ldDNwcTNWVEZJNmFucGQ4L2pzY1c1M1V6MUZuaG14eDRIUXpm?=
 =?utf-8?B?SHBIVWlub1RHYXh3ZHRlU0gzbmQ0WEdIOE44dWxZRGNQNU1DYXFHZHd4NjlV?=
 =?utf-8?B?RkUxaUFBTlhXT1lCcnB0Q3ZJYVVmcCtXdlZ4SEQvMmZaUzV5QzJkckVuTTcz?=
 =?utf-8?B?TU5yV3A4Ui9pMkViQi9DWGR6V1VaNDZ2cmpOZjZaV2kwRG1rSGZYb0g5MXdP?=
 =?utf-8?B?cnVqVVJEbmNNd0NBTno5R0YxV1RMeXZyU0pJMko5akV3c050MDY1ZkZBUGwr?=
 =?utf-8?B?bmpYdFBXeVNOUkRYNXVTNDVESC9wZEpXTWVKbUN0ckdnNG1hTndyd25ZV1Jj?=
 =?utf-8?B?aTlqQ2lLL240R2RjWk5tcTUyTkc0Q084TUlMZlhEbjVWNWZYSE5ZcVhaU3dF?=
 =?utf-8?B?RHpUT2c5YUZVTGtXTVRCYkhNaFRaNkl6TWthNDIrWVhjcmhhMVl5NEp2ZEpi?=
 =?utf-8?B?SU5DQXhzSCtCaGpOdTRRNlBYNHM5MVJzOWhDR1VzNEMvaHhjN09TTW56VURQ?=
 =?utf-8?B?YTU1aUxGM2JMbDZ3Zk5xS1BXbDVTd21ESDFvcjlvYmJLYStVcVBJQ2Rpa0R2?=
 =?utf-8?B?cE1PTHhnQzdHbytNdGxadG9sOWRzeG9NZlFRaWxvc2t5dW82RWZyOHFpanpP?=
 =?utf-8?B?UmtkeTBxRGd4Wjd0Rllqa2xaWk4rV3B4SldzWk5oK3Y3ZGlhRzRrOU5sY2Nh?=
 =?utf-8?B?R2cvV2Fvc084WHNXNXV2aUd1bUIrYzVWNmtwcjNhUGdUK2paaWp6Zm5ob2NI?=
 =?utf-8?B?WXRrSGNDc3FLc3dhOHZXL3Y2bkxmMTVIREQ2OGx4dDdWRkNSd1lSdGtBcUlS?=
 =?utf-8?B?UEtXRGV5SHdXbDdEZ2k4NDcxRWZCd0NDMzJVbis4a1dWU1VaRGN0RGV6bjVF?=
 =?utf-8?B?c3VjQld5bGJMWEE5VnpnZmxBME4wbkU4UFFaNTk2QVhXcWg2eDhBOG9zY0M4?=
 =?utf-8?B?UTdGMVljRTNlMk9qdWRhU3BuVGlWS1NqTUFQblkwTE9sYUg1R3RGOFNEOEJ6?=
 =?utf-8?B?dWVBK0dCbGxYa2hqeFZVTlVnQkJiNnJzYXhLVTNXY3MyVzRmNHJyTzAwWGgx?=
 =?utf-8?B?K25haDZVcXllNGZJanVnLytEeStQMXZzblpuWHgzbHA5ak9iWTk4eHBmMitE?=
 =?utf-8?Q?O4jGmi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFQwdWR5aktUb1orK0E5RTVMQXdKUjhVOXU2d0lrVmN2cmJRNlRvMkNvWEtB?=
 =?utf-8?B?VExMOGhBaGZpM0o0ZE5mYnUwVFJzSXluOEpkaFdwUVpqMkNGMU15NUE3bHFw?=
 =?utf-8?B?SG8zNUZLdFRNemt6SnBSWFQrV2JrWnFENW5yS3VjdXo3b3BhYTEvU1dCNWk4?=
 =?utf-8?B?eTR2ZytpRitHbXZMUkR0eG5LcnhOS0lsbXNQM0hKZllIdHhEY1lZTFJHa040?=
 =?utf-8?B?U1QvVk04U2p1SW1sakt4dXA1VUZEdWFybFREK0FIMHdwYTdzSmFTaitPL0Qz?=
 =?utf-8?B?TFJjSDROTTk0TWRtYUZrdUU1KzdITVJhN0lveFZQUmdjYk5FTjU5dnVpVnhw?=
 =?utf-8?B?NDNPbzJvVmZ2REhKWk5Jbm1xT3pLSk9uZDAvMnFWaEVGc2toWlAveHQ3cFdH?=
 =?utf-8?B?ckszbFdNR0k2ak1Sak1RaDBiWFFiaDk2cjI1Smp4WW4yMWR5RXptQkhzYnRt?=
 =?utf-8?B?blV2ejJSMFVIOE90Sk42cjZsdVNWeCtwNFNsR2VxbG1TcmNkaE4xY09EY3JL?=
 =?utf-8?B?NThWeXVUR05GMnBOc2hueE9zalVxMENaV0VBTmFNTm9wL1lOSjRNckxZVUlr?=
 =?utf-8?B?RVJldGdrMDVzK2V0Ty9kMUY1blR5R1AvRmxmM3VaRnNpWmdINXRCRURoR0pz?=
 =?utf-8?B?UXRodTcvWlRCTDZrNWV3VUNveWdBcDdTRXlIZnVSS3AxVU5sdXZZdkIxWHpP?=
 =?utf-8?B?bjlvUGQzL2FxOTZ4NDJRaEdmQkorOTIyU3l4cnlla29BRk9GWDM0K1Q3N1oy?=
 =?utf-8?B?NnFKMnh3bnJsRDdNNXE2dTNGT0FyUStrMzlZc2F2cXVHZzQvU1htaS9BRVBp?=
 =?utf-8?B?K2NlaXgzUGFOMVRXY2VvWm1oSjFwT0ZLTHQwTURYWHVPLzk0ekNaYjBkUWFr?=
 =?utf-8?B?UmpHL3htb0Y0NGg2RVgxTmVXWVN2MWZjOHlzMGNPSkhLMHlXdTBLTERhZXZS?=
 =?utf-8?B?TnZwK2ZNcU5mZ1BFQ3NISW9idzM1K1lsQW1WNUNCWFdETHZBMFpoWnpOTmNh?=
 =?utf-8?B?RDgyNmtuTExKRi95UFkyc2w2N0E3Q3NKekNOSmgrcDc2UERncUJ4YzFaTGZt?=
 =?utf-8?B?K2dDRFpDYUgxYzc5bWl1YjNRN1FMNHJDNjhWckRxa3R4bXJzaGlHdHRGaThL?=
 =?utf-8?B?cmJoeVp2Yk9MTy9XVHdKdjR6RGlrUC9qMTQ2N1MvNmFaanVKYXpoMjBvbjJj?=
 =?utf-8?B?amFZTGFqZEsrRUFCck5ON05uaHNMS29OczJ4d2NUMlFPYmlOU2RQOGh2ZGxI?=
 =?utf-8?B?VWdEMm5JWnRKbzBRanN6MDRDL1dyZHh1NkYvcXV6ZURka2Y1Sm9nZEtzSFVq?=
 =?utf-8?B?azdDNGRCUkRxUmVIYTVEZ2ltN0M3QUFXSVAvdFB5d0pRUGt2RE9aSmdlUVJZ?=
 =?utf-8?B?S054SGRHNisyOUJQa0JZYnR3dC9wTjhXait2UllzWU1NRG5jbjhNQ0x1VVE3?=
 =?utf-8?B?TFNxd3J5Q2ozWWFxUjl6M2dkQStrRExFQ1BqWVdJVFJRYjlMSWNVQTYrL0Jh?=
 =?utf-8?B?OE5HZFlHZnRMUnRabVZaamxITE1FVGxteGRzcjlTNWtIR0EzRmZnaXdYT2M1?=
 =?utf-8?B?am1MVCtqeEhFaGNtZjhIUzFnUVBPK0NqR3dNTjdXbU9UMWZURDRLKzkxVUxO?=
 =?utf-8?B?cjdPTkJTOENuRWVmOFNQL01kMFRNakVEWWY3QkF0V1F5aFNoaW16NHZ2VGpB?=
 =?utf-8?B?T1VNWTZtZXl0MkowZHZ5L0RkSXVrekZBc3pQcXUzRm1taGRMUi9wV2FxSWxL?=
 =?utf-8?B?S3FMejhGblV4Qm1pN05KM0pvNit2WXo3ZDdMTXpZYzhocnkxemk3UHBiY0w3?=
 =?utf-8?B?aURmaytNUm5zNkplZUJDMzk0VmFialNRS1g4NFY0c3RraUtWajdNeTc5MVd3?=
 =?utf-8?B?dElBb0JjSllkV1A5cnV6Q3hCcWFxZWJQYW54Z0pXdkxkU20wMU94Y2hFVEJy?=
 =?utf-8?B?eWdjc2lFM0J3V2UwcVh0Z0VxZFNIK0tOMUxaRkRqVGJDOUZnNnZEUVdWT3B2?=
 =?utf-8?B?VUkrNzFIMHo5Z3hIOUt1ZEFmRU9MRU43LzdXVUlENWUvOTJoUFNoVE9OaC85?=
 =?utf-8?B?Q1NicFpwMnZoTjlCNk5adkdPT2JZQXdVQkJUaStlSTlaQThrOTFFYjNjc3lK?=
 =?utf-8?B?UVRHMXZLak1qMHNLVHFsQVp2VnBjaDM2eGlKVm5ibUR3ZUxubUR5d1dPdTVN?=
 =?utf-8?B?N2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 13363082-a2fa-4f8e-f15d-08de29cb872f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 13:32:05.6138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3Sy/DQMnzP1TqqVDiTXFlrPFC4rRRnwD8z380QZwpgmEqXH62fC0UW5DmBvSNWxipBfXFUeBP1m/SCPJozO2fxZ8kB4F4I39fZrB43fOHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11333

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLA0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIxIE5vdmVtYmVyIDIwMjUgMTU6MTcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwOC8xM10gc2VyaWFsOiBzaC1zY2k6IEFkZCBzY2lfaXNfcnNjaV90eXBlKCkNCj4g
DQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIDE0IE5vdiAyMDI1IGF0IDExOjUyLCBCaWp1IDxi
aWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IEFkZCBzY2lfaXNfcnNjaV90eXBlKCkgZm9y
IFJTQ0kgcG9ydCB0eXBlLiBUaGlzIHdpbGwgc2ltcGxpZnkgdGhlIGNvZGUNCj4gPiB3aGVuIHRo
ZSBzdXBwb3J0IGFkZGVkIGZvciBSU0NJX1BPUlRfe1NDSSxTQ0lGfSBwcml2YXRlIFBPUlQgdHlw
ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2Np
LmMNCj4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMNCj4gPiBAQCAtMTE4Miw2
ICsxMTgyLDExIEBAIHN0YXRpYyBpbnQgc2NpX2hhbmRsZV9lcnJvcnMoc3RydWN0IHVhcnRfcG9y
dCAqcG9ydCkNCj4gPiAgICAgICAgIHJldHVybiBjb3BpZWQ7DQo+ID4gIH0NCj4gPg0KPiA+ICtz
dGF0aWMgYm9vbCBzY2lfaXNfcnNjaV90eXBlKHU4IHR5cGUpIHsNCj4gPiArICAgICAgIHJldHVy
biAodHlwZSA9PSBTQ0lfUE9SVF9SU0NJIHx8IHR5cGUgPT0gUlNDSV9QT1JUX1NDSSB8fCB0eXBl
DQo+ID4gKz09IFJTQ0lfUE9SVF9TQ0lGKTsNCj4gDQo+IFdvdWxkIGJlIG11Y2ggbW9yZSBjb25z
aXN0ZW50IGlmIGFsbCBwb3J0IHR5cGVzIHdvdWxkIHVzZSB0aGUNCj4gUlNDSV9QT1JUXyogcHJl
Zml4Li4uDQoNCkFncmVlZCwgV2lsbCB1cGRhdGUuDQoNCkNoZWVycywNCkJpanUNCg==

