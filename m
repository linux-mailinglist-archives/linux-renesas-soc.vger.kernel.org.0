Return-Path: <linux-renesas-soc+bounces-27119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O/bJrLGcGkNZwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 13:29:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DDC56C63
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 13:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4186D743016
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 14:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385B643CEF5;
	Tue, 20 Jan 2026 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZDI1b8EC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011022.outbound.protection.outlook.com [40.107.74.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D323ECBC8;
	Tue, 20 Jan 2026 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917903; cv=fail; b=HSx6JwV+gf19j3xYJCvSPgyH/QcADcG1MqxqHqKEL3c78XxQJ23eBrWBPUaJTMppJ7KSVX974BjE478/U5f4WhwQiikmapFDcAI1ANhrKpIDaTy0IPtlndO9THpMscUTIywVorFQP7Mz8qMzCMsGYKWVQynLqNjDadMt7PfwGnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917903; c=relaxed/simple;
	bh=JtuiP3sY6Yx3WJx8Up0QFyWC8MD/2BDTA2AjCnPV0BE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jbYsf4/7CsS0x6DyK8k0p4ZcxgKrx3X1gNZlkkP9SClHyPmHJO1sl4rAxeeVeatflrA2Hn6GB53OgkaoBbSa5re1UuBw6PebSW61M0DV6BqwhnFu3G31D7WWwFvGIryEfYJ7DenijKjrbFEGPuySLwmI8FeXaQMUYgfDS5eYQJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZDI1b8EC; arc=fail smtp.client-ip=40.107.74.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTc4EIA1mtjM/2Myl8e1ZHfA/x0kXXNpu5CmCfq3mmR9jSRT6rLqJ9hPzCQX5oaeiAmfr7CpchFyFeQCTQpvs1O0AGkzezWHM3L8dsq5oNCgshFP71UHAJfgoHfKal5I6gpcIJHofMN8Psw/acaGL8TNYh8Qyd9xm0V49Czc21fX4zJ5PTncuZdZ/U6zAdwhN5FcdEUwU78JoBYwM6VfA/HU9WLZGcX5wrJYp/hn30F+3WXiJQnX+wyaA48CDKQ36uo3WWTpqxGzC2scUAC2lpJnsP3qD6X7WVwn8j6Fgkg2tGNlzOlQXh2AWrcjuioZ2EhwzdRj1QXf9Kj7xMwA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtuiP3sY6Yx3WJx8Up0QFyWC8MD/2BDTA2AjCnPV0BE=;
 b=QgQYKwVi0RQLmnEGnnOon0z6zPeOfO8RAR5ChF8lPWL9kEkZdYAneJpsdh6TlboOocDYhme8+bPP+la45/iLtEyIeVU+hWJ/UP4/9mJMDapzASaYtuqUKBi3G2MdsE9YWk6ckfee3THe+DoUb7DLgVr3/T+E9IZW1D6ODlrn6LTJE2OWOBiKcoU11uCSL7DP04kcs5I//gzV0/oZ+PfacpRpB1M5l4AsPzxzkE6YHblujM+yZ0GJgWe3S06jYI2KIZnQzJxV+FqgVibCF9SJBdkBb3OPEr+l+ZS3M8MBgY1YFhOHMzzjPiL/LVfvt1Y6Ho87HfXZHTG9uL+4uoGjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtuiP3sY6Yx3WJx8Up0QFyWC8MD/2BDTA2AjCnPV0BE=;
 b=ZDI1b8ECqFhjh/7H5y9zaDNFCOzVqtLOFGxvKRWw3foB7hR8p4jB3AhtXlWshAdD2m9t5pWisCYIAGz9TAH9aYdciAoSbIeyHM9M+VGYxjhUoJxPHYm0tzlXjD++RBSVOaC2xNJIKAVeZ82in/PKvp10gWPHUlHVwShnEgiNwJ0=
Received: from OS7PR01MB17371.jpnprd01.prod.outlook.com (2603:1096:604:43e::6)
 by OSAPR01MB7278.jpnprd01.prod.outlook.com (2603:1096:604:11d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 14:04:56 +0000
Received: from OS7PR01MB17371.jpnprd01.prod.outlook.com
 ([fe80::7c48:4e26:72a5:7960]) by OS7PR01MB17371.jpnprd01.prod.outlook.com
 ([fe80::7c48:4e26:72a5:7960%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 14:04:56 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH 04/16] clk: renesas: r9a09g047: Add PCIe clocks and reset
Thread-Topic: [PATCH 04/16] clk: renesas: r9a09g047: Add PCIe clocks and reset
Thread-Index: AQHchWt+zqpWdE/frUylSy2mj2bTkLVa7fCAgAAwYXA=
Date: Tue, 20 Jan 2026 14:04:56 +0000
Message-ID:
 <OS7PR01MB1737172E89816B371830614E4FF89A@OS7PR01MB17371.jpnprd01.prod.outlook.com>
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-5-john.madieu.xa@bp.renesas.com>
 <CAMuHMdXKvfRr2us9YhXh5a_qtZcv8wCvz_EnVa4PEANocg_0_Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXKvfRr2us9YhXh5a_qtZcv8wCvz_EnVa4PEANocg_0_Q@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB17371:EE_|OSAPR01MB7278:EE_
x-ms-office365-filtering-correlation-id: d34a26fc-ad09-42fb-f9ee-08de582ce437
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?amlQeDNWS2t6TElFWGR4Z0Y2YzhRKzJiazYvS2lNN2dacUFlRHNSdjc1QUcv?=
 =?utf-8?B?VGpVU3N6SFk4RGY5aEF4cmU2Rmk5bzI4bk90VnB6ZHliN2VzWmg5dlJLQ0t3?=
 =?utf-8?B?L2ljN1JSOVR6ZzFEQ0xhSHFuK1FPZzY4WGVhdlMvM2xjbGF6RzczUjBnRlNl?=
 =?utf-8?B?NVJkaHhOWDZhQkZPTG9wWkxYSFNadGFPSzRPQlByZzZJS3RsNm1NNWF3STRm?=
 =?utf-8?B?dUJUdjZCbUt3QmJPTW9TSzVtb08rSDV0R2w0Z2sySURadzliWG04RmRYVTMx?=
 =?utf-8?B?ZjNBYzFUR3ZEMXJPb3lhWnhORG8rUjNjZlVpWjJZU3p5WDE4R3NObGlreTFU?=
 =?utf-8?B?N2REUiswbkEzR3AvQ2xMdlVXZjQ0ZmhYRExTTkZyUzFFbjhyaWVmR3dsaWNo?=
 =?utf-8?B?dXNMckdrMTlOcGROMmtSbWxzcTZlNElYYVBXMUc4d2hDeVdNeExoUjBONDB1?=
 =?utf-8?B?QVdOUFJrY2h0SVFKRTdwaTRqYllHdnZaQzdzWHRXSm43bkEvbzJJWVJ0dThm?=
 =?utf-8?B?RTlSRVFHM2RNdExNUmVueUFnYnBTd3FETjRYZnhEN2tkdWFCb1hjY1N2YVEz?=
 =?utf-8?B?OTVBT1pTbzZ3N1U1aU1JZGhVU0RxbmptODBoUDI2VDJyT2kvVkF5cGNuZzc4?=
 =?utf-8?B?eEozeFlBMHdWcGJiMWxWdHJqcUZ1TjRnems5QmZIVnVIaUpvWG1UbjllWW02?=
 =?utf-8?B?MWJSR1ZuWHpUWHJldEg0ekI3bnNPbC9VZE05ZGVneW5QRkVGTjlLNGZRWTFU?=
 =?utf-8?B?Qm1KMUxGczhFcGlqUXpxbG1tWi9CdS94djludThhWFZaOWdMenZKdDhsVUg5?=
 =?utf-8?B?a2k4WUVsTFpEOHppaTJCanp5MlJzWE5ncm03T1BYK1c5ZkF2UE1mbzFoRjdh?=
 =?utf-8?B?VEI1aVFjbjJoeDJtOFBwdEU0UFNFSFBxVERIZGNFUDRCdEU5SEVRMmJrcUpJ?=
 =?utf-8?B?UFpBeGtQK3VZY3h3VUtTTXZIaXFWTjVUUUp0V1dBWFpGZ2tFODZNU3hlWWVy?=
 =?utf-8?B?ZVhoYUlTVFJISFhMN2d6RmJQZTV2bUJ4Y0lWR0lZY2dlb1hKNmpFYXZmZlhr?=
 =?utf-8?B?cnFVaEo0SWlCU2JOamtsLzA5ellobFdXSkxSZ2ptR2hrRDNaWGJEUUpCR1Iz?=
 =?utf-8?B?M0cvbXFNN2VWRVVGRU50bSsyRVJSY0tycm9WbE44M3Y3eDhhcXlFOC9OdFQ5?=
 =?utf-8?B?anNrWkNhTWhZYzlIWnlTNnQ3TWI1RGx1RHV5MVhvNytqVGJLMUpEaFg3K0hx?=
 =?utf-8?B?SVQzVjBMWm8vU1BuelIzTjNPc05pZ0RHRVZlN0VPamtEVlVLMVJ3VlkvSWRp?=
 =?utf-8?B?cEpJNGZEYmVtTjBLUUdLM0NKL1BBdGRweE1UQXVTWk56ZHR1bW1yOXNDeWhL?=
 =?utf-8?B?TVd0ZVRNdFQrMGpqdEVEMEY2bSszTW9uYjNRMytWbllSSkpTUFg4dVorT0Q5?=
 =?utf-8?B?bU5JVHJvYVAyd05STzF3N1Fud2F2M24zcGdFSG1LbXdVZ0NWQkgxekw1VHpH?=
 =?utf-8?B?V0ZUVUNwd29BVGxUbGticFNVOTM2L2dxbHVJMnEwYmlCZGtOM040aXI0eTRk?=
 =?utf-8?B?VnA1cGJKUmQxbFlRNHpkT2lRemZpS0JhbXRyVkgzTnJXVEYxSGVXNm04Wk11?=
 =?utf-8?B?MWtxUE1lcmM2UytQMVQ4NXY4L3RtWWYwbFZjNzR2TVZwbXFUM21lZmlZRGV1?=
 =?utf-8?B?NmNDbmNabnVubEFuZmRSWUdTaGRHRDZ6MDVsaUMyRkl1UmRHU2ZOYTVQSWw4?=
 =?utf-8?B?SkY2ZjB2WWhYTmlrWEJtTWRwSXBTREhtckF2blJMaWJRZWFBNjErNEsyQlVn?=
 =?utf-8?B?azUvR01yYlZBN3Y0WHRLYldzNnVhVWc4VUFiMWZ6bmR2Y3RYSjhybXFyWXVp?=
 =?utf-8?B?eXZYbWExOHpKeVYzV0prcUZtSUZxVXc5WjJ1emZzWTJLS0p2UkpzWUtTYmxq?=
 =?utf-8?B?akZOTWhIcHczdHFaTlVDOVFCa01lekZTSlJxUk1QYVFjMFBEMWVuTVNPeWlK?=
 =?utf-8?B?TmZYY1N5dzhtRkpLME1paTZLQmVhcmlRSkt4OGVpZmR0ZnZEUk5PMC9mNzhY?=
 =?utf-8?B?UHB3a1IwdjFiVXpCUHZxM0tEMlhidVdSQjNCZjlYMmdWalR1ZUR4a1I0V3Bl?=
 =?utf-8?B?bTNMNU1yZmEyWkJkZGVhL1EzQ3RVY0MwZGpZUVFFdmVEMmxIaXFrUWNNV1c0?=
 =?utf-8?Q?3qokgMLMr6gGLYJJYA6yb/8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB17371.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2x5dTA0L2ZwTnNEdndraWxlMEZqQ3JBYmlDbW5YeFR2cEl1bFNxcEZSYzla?=
 =?utf-8?B?eWdCMW1rOHQxN01EOEVwbDBLMHBGdk1NdjZtdFdrUGZWamdKamJmdzJNUUpw?=
 =?utf-8?B?LzUyRi9WQUliNC83ZUo4RWVIclFILzJTSXdTMFBmSmZIMnA0b3dBdmNJYThC?=
 =?utf-8?B?TVZqN0RiMXNrdDdEN3hsM1p0N3lGWGN5bW9VUjlTTGkzeUFGTE42RjVsSXc3?=
 =?utf-8?B?bllJNktUaW13VjN1SnY0UG95UnAwYXMyWmtocVR3Vjc3cFVvdDZCeWtSVWxG?=
 =?utf-8?B?OG84aTBVOElaSWo4a2VwS0I3bVhnbGhqR0VLeWlEYzRaVFN1K1JRd0JSNk5k?=
 =?utf-8?B?V1M0UW1OZ2U1dCtnK3VUeDNOZEZRSHBncmRQSjQxS25PUTNZTytNaFc2ZWR6?=
 =?utf-8?B?a3NzMXlFVEN0SktCRzZOS3Q0cWY2ZEx4bDlwbmF6WDVpaVlNbHpDOHRqQjhP?=
 =?utf-8?B?UnArczhBQURrcktJemNWbXk1VzdRTWxwVjhLUTY1WHpPMGVHWm4xMFdhS2xm?=
 =?utf-8?B?Zjh5U2FCcFNBSW1YSlJqZDFVSG9qc0FscFJCYnF3NzdxdHluWmJOOU5sWHRX?=
 =?utf-8?B?b3BtQzdwT3k5bXBBeUhoKzI1ZHFZRG9pdSthcDJpak5ZbjdaSStUTWNkUGEy?=
 =?utf-8?B?NzQzN0tSTTZmTXhtOHBWUjlpWXZ1dkxDd3g1dU9EWFQ3dEV3ejZKaDdCTStV?=
 =?utf-8?B?bjBidUp6RVFUNVliRlRkWkJvZ2hSZ0ZrWmFMRTcvYlY0bkdrMUh6UGMxOUlm?=
 =?utf-8?B?VEQxYVVPdjJUa0tYSyt0QWtvbjdCV01oMWMzMW4wbE9SMlNsT1gwdGhab3JX?=
 =?utf-8?B?STUzS3FXTDl4dFEvN3ZESHlIaFAxZUFkOW9UOE9RTysyek4wV2JJb2FOcGpa?=
 =?utf-8?B?eTlrbUhaWUFuOXVyVTRwSjJib01YTnEveThNd0ROWCtWY2I2dGhOOTd5dGN0?=
 =?utf-8?B?SDdHR1JDUFkvYmU2RWVzZUs5SGJXeU9IQXB5Ky9qNGdNQkphSGpQSDVtSmVs?=
 =?utf-8?B?aUJFUGdJQ29Ia1BuV2VhWC81Q1I5TWJWNmgxZEdoMHZzZ0JtUGVoVHE3ME5X?=
 =?utf-8?B?NmN2R2VlRVdRUlBCYkhrR0pkWHowSUxZRk53OHJkRFpjOEdic1MzdHdrSmFC?=
 =?utf-8?B?ZXhTZjZKaFNTR3hXeHAwRnJFNDhvYm1sMDIrcWt5LzJ5dlBYNmgyenpOUWNr?=
 =?utf-8?B?aVNTU1hKZGdhMHJHMU5rZ0Y4SVNoN1NwSWloMmJFQmhaMDZ3WGNqYTQwT2RS?=
 =?utf-8?B?MW9XY1NFejlZMTVnb29PVEhOdHdOejc4Z3c3ZTk4bzRDbC92aVVpRk41akFX?=
 =?utf-8?B?V3NhMHRscXBqbEhTcC9VNlVQMkc1VGxVSXlSNmMwbjU4NGNGVjJmcU44YjMr?=
 =?utf-8?B?b1VDSm5QaElKdld2ZVcza2drNWNZZUlZanJZRjJGZkQzSUxhWDhGTHBYMGYz?=
 =?utf-8?B?QlN0SEgzcVM4YTZzMFhMK0hrTGFKT3Z3V0UrU2svT0RLd1dEMGJmV0E5YVVY?=
 =?utf-8?B?NllqU3ptQTlNb2lDc2ZZbDJxZHgzQTdZVXBPWXlZMXNkaGN5dlFKa05ObkVO?=
 =?utf-8?B?cFc4aXBNRzJiUExsZzRmTStFUnlLcVAyQjR1M3ZBUHFPb1pRS1I0NTQ1WXYr?=
 =?utf-8?B?c252Qjc0bkh3dE51U3dUak9Xa0tUc252TVdrbExFWmE2Vi9pdndUSnhVRzQ4?=
 =?utf-8?B?OWlqVUYxTUpOd2tpSmxTYm9jLzBUc1FiajhWU3BFb0xNWHlQMFp4djdDaDN6?=
 =?utf-8?B?eGJWN3RvckdGM2N0MFBFSFVJWmRDN3NKRlZrT0JLOFFNaml4QnFWSGgxd01p?=
 =?utf-8?B?d2VYMTlBcWV3eEUrQkNSVEhmVjV0aFBUZkczSEwzU2RSaGhFeFR1SnFWWDRs?=
 =?utf-8?B?WUFDbXowdGI0T0ZwSkZIZjJ1d0h6MStMSkloMVdNQ3V1MElUSDFOWjk1VFUz?=
 =?utf-8?B?UWRoemw1enlDMUw0VXpydW0va1lIcmxCWGlsckNkZ2c2WnlpTEJLQVFNYUw3?=
 =?utf-8?B?RmNYSmlqMi9STFBTTjFpbnREV1FPNWdDTURHYzVjd25vTHNPckJMTmFXd1pU?=
 =?utf-8?B?dEdLTlBCM1lxZllHdEQvWVY2dUhRekRXMEdqMDMza0VkZ0YxSDFQSVl3bmFi?=
 =?utf-8?B?YzB4VEFTdE9Xdnp0Zk1qTzRDSzFpMW9QeFNPR2puTFZnTUtBSHJFQlY1UDFY?=
 =?utf-8?B?SXVOWXhFenBoenFTSkRtRjgrVklXSEF5bkhWVVUzeDBDL1F3cVhJSjg2U21t?=
 =?utf-8?B?RGJtSEQ3SVlUTUgweEFHWTRvNmdSdlYxbzR1U0NJVGZIRnZKNHlHdi9rQWt0?=
 =?utf-8?B?WVhXSTQrdTBGeGl1SXU5aWoyWENtM2xZenV4Q1ZiOGJEVXYxZkhnYXloTHh4?=
 =?utf-8?Q?PgbmlEtha0ncShzg=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB17371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34a26fc-ad09-42fb-f9ee-08de582ce437
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 14:04:56.3739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5DCe3cGkdosdVpjHJ/x7tULWtdIFSpTIhuwJ20Wcx1il2LuPc+c60XJKivOmb8VhNBnOZS4wYjNBujTCAYFfKvFATAcaDOWcZW9i3NGcnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7278
X-Spamd-Result: default: False [2.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27119-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,renesas.com:email,linux-m68k.org:email,bp.renesas.com:dkim,m68k.org:url]
X-Rspamd-Queue-Id: 40DDC56C63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAyMCwgMjAyNiAxMjowMyBQTQ0KPiBUbzog
Sm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDA0LzE2XSBjbGs6IHJlbmVzYXM6IHI5YTA5ZzA0NzogQWRkIFBDSWUgY2xvY2tz
IGFuZA0KPiByZXNldA0KPiANCj4gSGkgSm9obiwNCj4gDQo+IE9uIFdlZCwgMTQgSmFuIDIwMjYg
YXQgMTY6MzYsIEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4g
d3JvdGU6DQo+ID4gQWRkIG5lY2Vzc2FyeSBjbG9ja3MgYW5kIHJlc2V0IGVudHJpZXMgZm9yIHRo
ZSBQQ0llIGNvbnRyb2xsZXINCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gTWFkaWV1IDxq
b2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRj
aCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwOWcwNDctY3BnLmMNCj4g
PiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA5ZzA0Ny1jcGcuYw0KPiA+IEBAIC00Mzgs
NiArNDM4LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgcnp2MmhfbW9kX2Nsaw0KPiByOWEwOWcw
NDdfbW9kX2Nsa3NbXSBfX2luaXRjb25zdCA9IHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBCVVNfTVNUT1AoMywgQklUKDQpKSksDQo+ID4gICAg
ICAgICBERUZfTU9EKCJ0c3VfMV9wY2xrIiwgICAgICAgICAgICAgICAgICAgQ0xLX1FFWFRBTCwg
MTYsIDEwLCA4LA0KPiAxMCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBCVVNfTVNUT1AoMiwNCj4gPiBCSVQoMTUpKSksDQo+ID4gKyAgICAgICBE
RUZfTU9EX0lOSVRfT0ZGKCJwY2llX2FjbGsiLCAgICAgICAgICAgQ0xLX1BMTERUWV9BQ1BVX0RJ
VjIsDQo+IDEyLCA0LCA2LCA0LA0KPiANCj4gInBjaWVfMF9hY2xrIiwgdG8gbWF0Y2ggdGhlIGRv
Y3VtZW50YXRpb24uDQoNCk5vdGVkIGZvciB2Mi4NCg0KPiANCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCVVNfTVNUT1AoMSwgQklUKDE1KSkpLA0K
PiA+ICsgICAgICAgREVGX01PRF9JTklUX09GRigicGNpZV9jbGtfcG11IiwgICAgICAgIENMS19Q
TExEVFlfQUNQVV9ESVYyLA0KPiAxMiwgNSwgNiwgNSwNCj4gDQo+ICJwY2llXzBfY2xrX3BtdSIN
Cg0KTm90ZWQuDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQlVTX01TVE9QKDEsDQo+ID4gKyBCSVQoMTUpKSksDQo+IA0KPiBEbyB5b3Ug
bmVlZCBwY2llX3JlZmNsa19pbiBhbmQgcGNpZV9jb3JlY2xraW4/DQo+IEVzcGVjaWFsbHkgdGhl
IGxhdHRlciBzZWVtcyB0byBiZSBkb2N1bWVudCBzcGFyc2VseS4NCj4gDQoNClRoZXNlIGNsb2Nr
cyBhcmUgbm90IG5lZWRlZC4gVGhleSB3ZXJlIGRvY3VtZW50ZWQgYnkgbWlzdGFrZS4NCg0KPiA+
ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgcnp2MmhfcmVzZXQgcjlhMDlnMDQ3
X3Jlc2V0c1tdIF9faW5pdGNvbnN0ID0geyBAQA0KPiA+IC01MDMsNiArNTA3LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCByenYyaF9yZXNldCByOWEwOWcwNDdfcmVzZXRzW10NCj4gX19pbml0Y29u
c3QgPSB7DQo+ID4gICAgICAgICBERUZfUlNUKDEwLCAxNSwgNSwgMCksICAgICAgICAgIC8qIFVT
QjJfMF9QUkVTRVROICovDQo+ID4gICAgICAgICBERUZfUlNUKDExLCAwLCA1LCAxKSwgICAgICAg
ICAgIC8qIEdCRVRIXzBfQVJFU0VUTl9JICovDQo+ID4gICAgICAgICBERUZfUlNUKDExLCAxLCA1
LCAyKSwgICAgICAgICAgIC8qIEdCRVRIXzFfQVJFU0VUTl9JICovDQo+ID4gKyAgICAgICBERUZf
UlNUKDExLCAyLCA1LCAzKSwgICAgICAgICAgIC8qIFBDSUVfQVJFU0VUTiAqLw0KPiANCj4gUENJ
RV8wX0FSRVNFVE4NCg0KTm90ZWQuDQoNClJlZ2FyZHMsDQpKb2huDQoNCj4gDQo+ID4gICAgICAg
ICBERUZfUlNUKDEyLCA1LCA1LCAyMiksICAgICAgICAgIC8qIENSVV8wX1BSRVNFVE4gKi8NCj4g
PiAgICAgICAgIERFRl9SU1QoMTIsIDYsIDUsIDIzKSwgICAgICAgICAgLyogQ1JVXzBfQVJFU0VU
TiAqLw0KPiA+ICAgICAgICAgREVGX1JTVCgxMiwgNywgNSwgMjQpLCAgICAgICAgICAvKiBDUlVf
MF9TX1JFU0VUTiAqLw0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5v
cmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0
Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

