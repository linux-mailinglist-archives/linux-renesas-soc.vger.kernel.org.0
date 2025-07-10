Return-Path: <linux-renesas-soc+bounces-19497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F11CB00A4E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 19:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29200648049
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 17:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8CD2F0C71;
	Thu, 10 Jul 2025 17:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="clh8Yfpc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF41F2F0C74;
	Thu, 10 Jul 2025 17:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169452; cv=fail; b=UduNwDf+idRlN0qvzHlu6g9QtorxKG/pzpkotFDkFJRuc4DeQiU1F8S6QN2FC+c9uFX2QBZHNcF1GTpIq9kw9wSHGK7SohdKy1AhgD5U1GuUKElZFnaXTWu06hg/wwm4JeRfEdxivhzTN62FWaP6oMWVnGyp0kyC03S+9s5TmvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169452; c=relaxed/simple;
	bh=c8rINJIXaUbhdySSBfAjOcUR/g2KyVpWnXxdO/wFelQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kuEIF9cv6aS8zQGAmTq2EUQXIoBFZK9jX6clQwJ2ySzMOtQfyfuuzrnhhCmMZSoTHWnBDPHe51LklJbGbPhhIhOWmE9IIWItMCByZi4S5XYo4npCwpQZ+uY4mRpKMtYAViXhnIGW7hpfsTE5PiVkwCao/pBEfz9TAltlKZhlSp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=clh8Yfpc; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTwaXt8DXcNChupcO0m5JzLLlbxKLfmjbIzm17tlgvVdLtkvr9oO8hqkkkMb2jW85ifnVizBrODJ3VAeyQL4eA/g5Ohpnc70x3Gh0m6m4v9pokW+W1Qeq4on8JMsz2RL7Bh5kFymZRqRP8/OYfFiKj4DyDU4pcoRFbEgQIjE9/O3VOgLBXzEye6oibo4IwaNqJRxjONSQiSuHpT39b5+m3Tru6iumj+f0HbQr0wlpUbmrqe706nL0kRbR8cEYRKkXjli8THmgrB/Xq0Fs+ACP/tZ42JAcEalZ/WWk+G9Q/5vqY2Xzy687HW9OSoVydv3kqOdIg+O/tQpu1cgraUC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8rINJIXaUbhdySSBfAjOcUR/g2KyVpWnXxdO/wFelQ=;
 b=I8M5Q4c3HWxY9cRG4/Na2yoLaAYZSXN7ESpb5K+zYhOdigfwlbMgH7SaD261BXJaL33r3h4512SzHocTHq6dEJukBHT878pgar4aUEHn8PVOi4OwmaGjPVwkEwQnXXjuIswSgCYYyk33xXX0Q+IleBKrGOsazT5+LDdG+WcsG+WqK6HQFMLkP7xhupyKleU/7AEJTXslJ40jPow6YNu65PQpiSAgUtcf3inKm908Jhkt/d0DzYwWN+zaWzJpG4ZbuXqcnxm6icvVqdCIWbwVL0EW2zy9brqEO4Qu3DzFsxK8FYhtQ5QTOvgDZLcU10Blx5qPRwLvAt891OcpcII53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8rINJIXaUbhdySSBfAjOcUR/g2KyVpWnXxdO/wFelQ=;
 b=clh8YfpcDqduT8iFRPjC5p1yig04hTF/zwBElly+ND9dc7ZoCML2JhkEHwCNykV+G7yFHGGsVYHYlc4ISvM5+MIbb3fHxnHN2p4nqHXfBVl1vPdHLSXvKMt+tVHl6/HLotaQF+m0CNaGge5qahNjl0S1McUaEW9z9Tyt6jvhVHY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7772.jpnprd01.prod.outlook.com (2603:1096:604:1b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Thu, 10 Jul
 2025 17:43:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 17:43:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
CC: Russell King <linux@armlinux.org.uk>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next] net: phy: micrel: Add callback for restoring
 context
Thread-Topic: [PATCH net-next] net: phy: micrel: Add callback for restoring
 context
Thread-Index: AQHb70ui7CjvRuvAOEON23gu7MpaGrQrYSqAgABB49A=
Date: Thu, 10 Jul 2025 17:43:50 +0000
Message-ID:
 <TY3PR01MB11346D7C845C06A40407A83528648A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250707142957.118966-1-biju.das.jz@bp.renesas.com>
 <60e77fb5-ef9f-4c89-899d-398cd9eb8f85@redhat.com>
In-Reply-To: <60e77fb5-ef9f-4c89-899d-398cd9eb8f85@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7772:EE_
x-ms-office365-filtering-correlation-id: e94064be-eaa7-49f2-2bd4-08ddbfd954d4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y3p4RCs3Ynh3cjdRNGdMZGN5Z0NUS1o4aHEvbEVTMk90cXNxVzg2ZjdqbTRz?=
 =?utf-8?B?SHBKZHRjTTh1dTl4UTNsMUtCTGQxRGtaNjUrZjdQRXU3enFxNURuaExlWDJj?=
 =?utf-8?B?dFQ0TjR3dHJOdEJaWm1lVDJqaDVjcXk0TXlPNlhPcDUvbCsra2xNbEJqUFUw?=
 =?utf-8?B?U0VLemdyWmpUaGJnbjZNWXdhMHBHRHBKVE5YMk1LbGFETGhaWWtRZkpLYkp2?=
 =?utf-8?B?V0dHMUhFZXZnMWpjM3R4MnljZ2N1cWtucXpSUmRtOXdOZGJPZ3hELzVMSENr?=
 =?utf-8?B?STVMZGZJNGtuYXA4d25wRnAwRmFUT1pzMnRwRm5DY3BrMW5Od1ZYaEtFNHl0?=
 =?utf-8?B?bHdEWnVOMWFvYkE2SnpRL0FDZHoxdE9pUzJPWTd0b0cvYzVZcVJVL0IwalZt?=
 =?utf-8?B?K0dPT2hDQ09hdm1OeVlxRCttd255Z3ZuRldiMllFWllySkVHdWxFQ0pwT3Js?=
 =?utf-8?B?WGsrRkxrajA3bWwyUXNIRUVkYURQRm0rdGJEZ2JocTdPa0dQeEE1Q01tNTdo?=
 =?utf-8?B?V3FHR0NGcDVsVDNBc0t4UW9JRWk1U3V5TFdPbTNnNVd2WHQyMHhLSFhMT3Jt?=
 =?utf-8?B?K05tSUVodEFUZHVQMTUxTWlKTi9waGtIUkRXcU1la2VGRFRDeklEWlNXWTZw?=
 =?utf-8?B?aWpkL0F4TXhlbjZwNFd0ZXFZZ2V1SVl1cFlvZXIzdHhIUUV4M1BCYzBLQjg1?=
 =?utf-8?B?QWx4V2E0c3JBdExHeS96c3NLQ0ZJZmhuemh6dGpWWks1eDh1NmhVbmRmNWN2?=
 =?utf-8?B?aXAyZExzMjJ6UzFYZEtoM1lpeGs0RHBEMFRaZ3hCOUxaa2lUbmpaM1lQcWtu?=
 =?utf-8?B?REsxMmsvOTV1bTI2TTNsdXFXUlVsU2Z1eXBpOC9FTmlwVUg5RURQOGVoTnNV?=
 =?utf-8?B?VEsvT1JCYmZiSUtpSk1GbFBndUVZdEEvd1lSN0VFVmNoVDdXQUNEK1JoNmpl?=
 =?utf-8?B?MzVvZTZBUjJoaEM4WlF1RXBRajVVbjQyN2paN3JvODNmNC9XOXFOM3loaFJo?=
 =?utf-8?B?dDJFT3BUM0IzZE9zZGVISkRlOXVJOEJUV0tsbjYwcDc1RzNNQ0p0alJmM1dR?=
 =?utf-8?B?OFdzY2hMZXR5aWFJYVJXcEcrOXFQRmxPV0RtR3Z5Z25vWmoxeWdoT1BKLzlJ?=
 =?utf-8?B?MDN3djR4MC94QTM4M0NQTFJ2YUdLRG83d2lrdnJsTG5FQVlkZG9lemRTQ3gy?=
 =?utf-8?B?dVNIMDJJVGk1cTA1Nzdrc2dYckRjK25ZUWQ1TUlCeFBVZU9lUzY3RjBjam93?=
 =?utf-8?B?ZnN4TS93Y3pyajRlRHFZdC9hc3p5cEJ2STNLWm1XdENtZkRnd0tudW5aMTNO?=
 =?utf-8?B?MWhzWmpNaEY1VE9LU2o2SHM1ZTcxZHlHYzJyaUd0VjhDRGl6MDRVQXYzUDZ2?=
 =?utf-8?B?NWlTbC9HYlBBaXc1RHJXREpmMFdMcFRhODE5RldXWjFuWHlaOStrZkVPMW1R?=
 =?utf-8?B?ZTVyV2tRWmZ4QXptaHdFMUx5azVOanNUaExYa20yaXdFVnlJTkVsMHY0UVRl?=
 =?utf-8?B?UEEvYTBPT1ZqZjBXV2V2eGJBM0tkR2U1TXIzUFdxU2hTaE1ST25VRzVGcnZs?=
 =?utf-8?B?RlZtTGNNVDc0ZmM2TWw4akFHYVZKOTBjUTBVTlZDdDg1U1JVU1crYzdxSVlx?=
 =?utf-8?B?RlBTNzIzYnlVT081c1U4d3A5T2FwelIvYlVqd0hQM0ZHeDFENTdEYmpkUk9s?=
 =?utf-8?B?c2FmZzQyUDVLYk1xRnVrRS9lc3FOMXV2QzVqb2EyL2NyVVpHYkJyVEJUTUN6?=
 =?utf-8?B?a2RsWTZGZm1qTVZHT21GZVhSRlIyZ0hOV3gvdWVDQWFiVVVaajI0RU9xS1h2?=
 =?utf-8?B?Sml3d0FaY2w5UW4yOCtUWG9aTFlGdEZwcHRGbUNJQXJYQi9PTkpLRGZhcWdN?=
 =?utf-8?B?d2ErcjVoRjhYaVpBTmJ4cTlKUE5Lb3cxWjhIZm5zd3ZnZTRvWWtnYVMwUitD?=
 =?utf-8?B?QlVraDVDcXlEUU95dE55KzZVSWxTL3Q0YVNUSmJpLy9JRzBRSDFwYVlBd1Fa?=
 =?utf-8?B?M0EwcU1DM0dnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFJKbWZvZjUrV3RtVDd5R0YwQTNZV2xSRGRvRER4QzFNOHJtRmtYeFNFeWs4?=
 =?utf-8?B?ZUdIVk5Kb0JLQ0NmN1I2U1NDdStUb0pSSU5OcWFtY283anlPaVhtV0pweDdr?=
 =?utf-8?B?Y3M0QXJYWTZiMDZjYncwT28rVFdVWnJXdlYvSmthd2hoM1l4YWx0N1JKRjdq?=
 =?utf-8?B?WDdzN1lRVm5aQ2FWdkluZkN0RFZSV2krZ08vVWhCL0FTVWpIQ250Z3F4NHFn?=
 =?utf-8?B?b2NqRTRDMnB1UVNNby9oTnBzMXJnQiszWDFaRWs2MDMyR3NqTEVBMU9scnhE?=
 =?utf-8?B?RjZOLzFPVWtFaWc5Y1VZcG10dU0wWTNlajZpVzVRMmsrQWRJbkZaRUtRQm5n?=
 =?utf-8?B?V2JNRVlFSUtBMGtaSkIwaGZTU1hld0Y1Y0NlNWJQcklqekhwTHpaOTJIdEtR?=
 =?utf-8?B?TEswSEdSTHFKd0M5OU9OWUM1Q29xTWY1R1lGR0lzdFZVNDE0UGlIR2UvdnJi?=
 =?utf-8?B?M043bEgzZHN3Y3N0ZlZsaTBtd2daV3pwdXBscXRBVk9COHo4YTZWOWdTMDdr?=
 =?utf-8?B?QnNydEFnQ3dOV2pqR09weDgyeHVqajUrWnJNa09iSFdRRXFEZmVWNzA4NzNj?=
 =?utf-8?B?d3ViZjlDNi9kZWhkbDhmK2dPdUFDdTN2THFMeU0yZWRQQTQwd2xrQXNya3A3?=
 =?utf-8?B?T2l3bGVWSndKM2tKOTllSWFmNUhmaTlpOTljYW8rTXFKTDZESFE1NEIvMzhJ?=
 =?utf-8?B?aEFIVm92ck9lbno1RVFDNEtqblltMnZhVXVyanVHTzRZRFI3RS91WmROZGd0?=
 =?utf-8?B?ZHZ1WmNFaGZSU210SmduaVRJemFFSjRvNEE0enB4SkxDcFl5Tk40bE5wWElp?=
 =?utf-8?B?d2IxaDRycHc1cUlCVTNCVFEvV2lqV2pmVFZjNGJnajA5RVRQc0Jhd2hNTlc4?=
 =?utf-8?B?R3VmQmhoSGozbG01RHFvUjFjb2pRWnNTT2xrdzc1VEU1SlQ2Y3JIQlhUVGha?=
 =?utf-8?B?Q0lEVmF2ellLSDA1MU10UTRZREFwajZnQUVBV2FJNHU5WHBrRXMyblcwODhU?=
 =?utf-8?B?QWpPRGpiY0RSdTZrdW5hS2tkMVMrRC94ajA4N1ZPeFl5a2ZWeis3d3F1cWI0?=
 =?utf-8?B?SlYyWFdXU2s0RVkwa1Y3ck9RMWkyUDJzdlpmSlQ5Vng0Qjc3RmVQeEtqK0w2?=
 =?utf-8?B?T215V2xJeWF1djdlUE5tdU1DeitoSTlNYkVtS0k4V0VJUjBXNUZuU2hGMU5S?=
 =?utf-8?B?TnYvcytTcytaY1NjaGlnVmhnVXdOVnQzS2lsYUxXaUdJNGdjTzFqTjFxSEJB?=
 =?utf-8?B?ZDNZUEFkVFhiMHg3bGtLdjhCb1hGOGNsZkJSSzd2dExIVWtxdjlMT01WM0wx?=
 =?utf-8?B?WUlwMTdoZHdPVUl1YzlPd0V2bkFnYkxFOXVwNE5lQ09UMndmNnhRZG9UNitr?=
 =?utf-8?B?d0p1VGdtd2FTWkYyS0FHTzBRMnhtaUF6Z2xEUG5YblpGSFpOYW9rL0NtTHlu?=
 =?utf-8?B?ajdVL3NEemdGNnJrK2dKblMrb00wSW1BZFY5TXZTcmRZKytnb0wzU1pPZ3RQ?=
 =?utf-8?B?bFhrU04wb2pmNkpuaEtqeDdBc0VyTWFNemh1L2MzYnhQNitNYUNkVmsxa1dt?=
 =?utf-8?B?WXVIZWI3aFBNT0lSMVVUOWluTmlSWThkYVY2NFFlcWhrQ2c0RzlTc3JMMFZa?=
 =?utf-8?B?dkNzcDB4N091K1k3SFlGVVlaS2Zwdi9tY1RSb3phRm92ZUlwbVZHMmQwdk1p?=
 =?utf-8?B?UWJsZTNBMTFmVEc2dG1YYlE3em4vK2pRVzZsc28vZlBFRGE1R2Z6dE5DR2dV?=
 =?utf-8?B?NS9YM1ZjTXZkZURZczVWb2d4anFWaWVIZ3pJa0t4RmR4cnBZNVlsQlZqUkxQ?=
 =?utf-8?B?MVg4eWlQWGRPSTkwVVpYQkhXOHFaOEkrUjBlOTQ2M25GNnYvUCtJVllad21p?=
 =?utf-8?B?RTFUcXpBU2FxMWpBeEpNaitpWWJ0KzJpMlFOUVdJclY2NGVuV1djdzcrcE1T?=
 =?utf-8?B?amJLS0pGUEdMaU1ZY2xtWGNPa2tOL244d2xJN1o0WHdUcXcvcVhQclFpQWZY?=
 =?utf-8?B?OEgxT2dIblpPWGJnb3lwVUw0RXRBU1l5b013QXdFbmNYS29TV2EzZlp1b29q?=
 =?utf-8?B?SlUyMnF2V2VLaWJvTFRHcHBDU2UvOXVYNkNBUTZBY0ZqOGRZTHBCR0psS0tu?=
 =?utf-8?B?aEZoY1RKSC8xZGhnczFyVW1nZEp0cWJMWXhQZWJPMCtsSmw0U3c4S1MyMDlu?=
 =?utf-8?B?K2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e94064be-eaa7-49f2-2bd4-08ddbfd954d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 17:43:50.8219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQmllycBbh21c3+tL0N7MCI6F8+S7wJKS22ziq+hz1Uhv6PzbGBQr1rv0N3muf86pgm8RMQSHPB2k9Txu8Y8iB6HVf48fHH7Kdf7AnIC+jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7772

SGkgUGFvbG8gQWJlbmksDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBhb2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0LmNv
bT4NCj4gU2VudDogMTAgSnVseSAyMDI1IDE0OjM4DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0
LW5leHRdIG5ldDogcGh5OiBtaWNyZWw6IEFkZCBjYWxsYmFjayBmb3IgcmVzdG9yaW5nIGNvbnRl
eHQNCj4gDQo+IE9uIDcvNy8yNSA0OjI5IFBNLCBCaWp1IERhcyB3cm90ZToNCj4gPiBAQCAtMzc0
LDYgKzM3Niw3IEBAIHN0YXRpYyBzdHJ1Y3Qga3N6cGh5X2h3X3N0YXQga3N6cGh5X2h3X3N0YXRz
W10gPSB7DQo+ID4gfTsNCj4gPg0KPiA+ICBzdHJ1Y3Qga3N6cGh5X3R5cGUgew0KPiA+ICsJdm9p
ZCAoKnJlc3VtZSkoc3RydWN0IHBoeV9kZXZpY2UgKnBoeWRldik7DQo+ID4gIAl1MzIgbGVkX21v
ZGVfcmVnOw0KPiA+ICAJdTE2IGludGVycnVwdF9sZXZlbF9tYXNrOw0KPiA+ICAJdTE2IGNhYmxl
X2RpYWdfcmVnOw0KPiANCj4gV2h5IGFkZGluZyBhbm90aGVyIGNhbGxiYWNrPyBJIHRoaW5rIHlv
dSBjb3VsZCBhdm9pZCBpdCB1c2luZyBhIGtzejkxMzEtc3BlY2lmaWMgcGh5X2RyaXZlci0+cmVz
dW1lLg0KDQpJdCBpcyBiZWluZyBjYWxsZWQgZnJvbSBvcGVuKCkgYXMgd2VsbCBzZWUgWzFdDQoN
ClsxXQ0KWyAgICAxLjkzNDE3N10gIGtzenBoeV9yZXN1bWUrMHgxOC8weGM0DQpbICAgIDEuOTM0
MTkzXSAgcGh5X3Jlc3VtZSsweDNjLzB4NzQNClsgICAgMS45MzQyMDddICBwaHlfYXR0YWNoX2Rp
cmVjdCsweDFiYy8weDM5OA0KWyAgICAxLjkzNDIyMF0gIHBoeWxpbmtfZndub2RlX3BoeV9jb25u
ZWN0KzB4YjAvMHgxMzANClsgICAgMS45MzQyMzddICBfX3N0bW1hY19vcGVuKzB4ZTQvMHg1MGMN
ClsgICAgMS45MzQyNTFdICBzdG1tYWNfb3BlbisweDQ0LzB4ZDQNCg0KPiANCj4gPiBAQCAtNDQ0
LDYgKzQ0Nyw3IEBAIHN0cnVjdCBrc3pwaHlfcHJpdiB7DQo+ID4gIAlib29sIHJtaWlfcmVmX2Ns
a19zZWw7DQo+ID4gIAlib29sIHJtaWlfcmVmX2Nsa19zZWxfdmFsOw0KPiA+ICAJYm9vbCBjbGtf
ZW5hYmxlOw0KPiA+ICsJYm9vbCBpc19zdXNwZW5kZWQ7DQo+ID4gIAl1NjQgc3RhdHNbQVJSQVlf
U0laRShrc3pwaHlfaHdfc3RhdHMpXTsNCj4gPiAgCXN0cnVjdCBrc3pwaHlfcGh5X3N0YXRzIHBo
eV9zdGF0czsNCj4gPiAgfTsNCj4gPiBAQCAtNDkxLDYgKzQ5NSw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qga3N6cGh5X3R5cGUga3N6OTAyMV90eXBlID0gew0KPiA+IH07DQo+ID4NCj4gPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBrc3pwaHlfdHlwZSBrc3o5MTMxX3R5cGUgPSB7DQo+ID4gKwkucmVz
dW1lID0ga3N6OTEzMV9yZXN0b3JlX3JnbWlpX2RlbGF5LA0KPiA+ICAJLmludGVycnVwdF9sZXZl
bF9tYXNrCT0gQklUKDE0KSwNCj4gPiAgCS5kaXNhYmxlX2RsbF90eF9iaXQJPSBCSVQoMTIpLA0K
PiA+ICAJLmRpc2FibGVfZGxsX3J4X2JpdAk9IEJJVCgxMiksDQo+ID4gQEAgLTEzODcsNiArMTM5
MiwxMiBAQCBzdGF0aWMgaW50IGtzejkxMzFfY29uZmlnX3JnbWlpX2RlbGF5KHN0cnVjdCBwaHlf
ZGV2aWNlICpwaHlkZXYpDQo+ID4gIAkJCSAgICAgIHR4Y2RsbF92YWwpOw0KPiA+ICB9DQo+ID4N
Cj4gPiArc3RhdGljIHZvaWQga3N6OTEzMV9yZXN0b3JlX3JnbWlpX2RlbGF5KHN0cnVjdCBwaHlf
ZGV2aWNlICpwaHlkZXYpIHsNCj4gPiArCWlmIChwaHlfaW50ZXJmYWNlX2lzX3JnbWlpKHBoeWRl
dikpDQo+ID4gKwkJa3N6OTEzMV9jb25maWdfcmdtaWlfZGVsYXkocGh5ZGV2KTsNCj4gPiArfQ0K
PiA+ICsNCj4gPiAgLyogU2lsaWNvbiBFcnJhdGEgRFM4MDAwMDY5M0INCj4gPiAgICoNCj4gPiAg
ICogV2hlbiBMRURzIGFyZSBjb25maWd1cmVkIGluIEluZGl2aWR1YWwgTW9kZSwgTEVEMSBpcyBP
TiBpbiBhDQo+ID4gbm8tbGluayBAQCAtMjM0NSw2ICsyMzU2LDExIEBAIHN0YXRpYyBpbnQNCj4g
PiBrc3pwaHlfZ2VuZXJpY19zdXNwZW5kKHN0cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYpDQo+ID4N
Cj4gPiAgc3RhdGljIGludCBrc3pwaHlfc3VzcGVuZChzdHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2
KSAgew0KPiA+ICsJc3RydWN0IGtzenBoeV9wcml2ICpwcml2ID0gcGh5ZGV2LT5wcml2Ow0KPiA+
ICsNCj4gPiArCWlmIChwcml2KQ0KPiA+ICsJCXByaXYtPmlzX3N1c3BlbmRlZCA9IHRydWU7DQo+
IA0KPiBVbmRlciB3aGljaCBjaXJjdW1zdGFuY2VzIGBwcml2YCBjb3VsZCBiZSBOVUxMPyBBRkFJ
Q1MgaXQgc2hvdWxkIGFsd2F5cyBub3QgTlVMTCBhZnRlciBwcm9iZS4NCg0KT24gdGhlIGtzenBo
eV9jb25maWdfaW5pdCgpLCB0aGVyZSBpcyBhIGNoZWNrIGZvciBOVUxMLiBUaGF0IGlzIHRoZSBy
ZWFzb24gZm9yIGFkZGluZyBpdCBoZXJlLg0KDQpZb3IgcmlnaHQsIHByaXYgY2Fubm90IGJlIE5V
TEwgYWZ0ZXIgcHJvYmUuDQoNCg0KPiANCj4gPiArDQo+ID4gIAkvKiBEaXNhYmxlIFBIWSBJbnRl
cnJ1cHRzICovDQo+ID4gIAlpZiAocGh5X2ludGVycnVwdF9pc192YWxpZChwaHlkZXYpKSB7DQo+
ID4gIAkJcGh5ZGV2LT5pbnRlcnJ1cHRzID0gUEhZX0lOVEVSUlVQVF9ESVNBQkxFRDsgQEAgLTIz
ODEsOCArMjM5NywxNyBAQA0KPiA+IHN0YXRpYyB2b2lkIGtzenBoeV9wYXJzZV9sZWRfbW9kZShz
dHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2KQ0KPiA+DQo+ID4gIHN0YXRpYyBpbnQga3N6cGh5X3Jl
c3VtZShzdHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2KSAgew0KPiA+ICsJc3RydWN0IGtzenBoeV9w
cml2ICpwcml2ID0gcGh5ZGV2LT5wcml2Ow0KPiA+ICAJaW50IHJldDsNCj4gPg0KPiA+ICsJaWYg
KHByaXYgJiYgcHJpdi0+aXNfc3VzcGVuZGVkKSB7DQo+IA0KPiBJIHRoaW5rIHlvdSBjYW4gdXNl
IHBoeWRldi0+c3VzcGVuZGVkIGluc3RlYWQgb2YgYWRkaW5nIGFub3RoZXIgZmxhZy4NCg0KWWVz
LCBJIGNhbiB1c2UgcGh5ZGV2LT5zdXNwZW5kZWQgYXMgcGh5bGlua19wcmVwYXJlX3Jlc3VtZSgp
IGNhbGxzIHBoeV9yZXN1bWUoKQ0Kd2l0aCBwaHlkZXYtPnN1c3BlbmRlZCBzZXQuDQo+IA0KPiBB
bHNvLCBjYW4gcmVzdW1lIGJlIGludm9rZWQgd2l0aG91dCB0aGUgcGh5ZGV2IGJlaW5nIHN1c3Bl
bmRlZD8NCg0KWWVzLCBwaHlfYXR0YWNoX2RpcmVjdCgpIGR1cmluZyBvcGVuKCkgaW52b2tlcyBy
ZXN1bWUuDQoNCkNoZWVycywNCkJpanUNCg==

