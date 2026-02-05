Return-Path: <linux-renesas-soc+bounces-27949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFezEaGghGmI3wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 14:52:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8100F393C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 14:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A4DE30796FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 13:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488873D330A;
	Thu,  5 Feb 2026 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Z+Fl5dFI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011049.outbound.protection.outlook.com [52.101.125.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF51B3A9633;
	Thu,  5 Feb 2026 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299204; cv=fail; b=Hr0LfbLNs+XSKRnsMiJ6ciR00evlJCDMNgTwZ1gL1ukgIEzf3fGUxxE7aEI3elTuc0J0ECZUpijGdmyZ4/ZjwYQCyrFVeJ/XbJozUgUeExbTP73qop/nvtNck1Yf9qxiTocuPL6eXM3yf/ih4X60WptmWLz+d6EuaSNpIQPLUtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299204; c=relaxed/simple;
	bh=vPCRQkc5Ws1vBOXMxZL8ljC6QtLf20SYWR48m6Pm7nQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Xy3wdQN/erPM3GgBKH9L3AokJGnDra6UBiTBVKu7QAPBV66PaVNDEUB1pXM2ds1BRrQnofT0AltbbQVYEQ+o9Byovi31VzIdf+zF547pWV2QkH83Ttmx69L2JRvPSplPSmKl/QUWbCXeSX9Ef7ydsvuNu75wvfcM1yc7XLUj3F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Z+Fl5dFI; arc=fail smtp.client-ip=52.101.125.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcXexySa/NiKzO0yRR+ELWoAr37aFuCSMnGlhgKyILmaWsDFenJP3F2FukzDppfROEjFJeIyRLDlP+fKz58OgMlBr8IhD4Yf0RBIregw3rL4bFD/TUiOKFO0zslxyeEgoHlLvvmCi1G9WJ6i/CW38SlI8eLbUvx2JIpTmWDofJA6r08XWrYEcPLtmlmcjM92gGnIO1OpnNF4t82k3+q17I7UaZEqp+Te2Yd+mAvZjAaP1r+fnXorc8yfxVy5JgouoxIRu7nUXe5EsGeN/QhR5DwCUWHB4zwoX8zyf79BlY4jU/BKCP1kr2NQ8lh/ZSL6ttmea1RhOw9aCSRDC/diaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPCRQkc5Ws1vBOXMxZL8ljC6QtLf20SYWR48m6Pm7nQ=;
 b=ueAlaiJSTKR2mNjjM8nURIP2N/wtGYCPwZyvoBsr4ZzsSHepmFz1jI+5Tu81WQx1R75KVstwmEusICDX+qG6feRfbElNVBbeKNKIT8gWAWK9C5/VAVEaHj+waI3o50aOq7AqadP3H5VscJ/cwjhgJ30ac2aGBcIp9UVGihu77aaLl/elXjkS0nTsFfX5E8P4ndRsc4T08sxoYHynpnJzt0DNJMhYGJNxkPbzlevajtry6iaTYryNDjpBq71F+q9LBzXllS6HRqj5t+CZLAOj3joDkl1rcrkLx6oUGRzvMK0Mod5QZ/uFDv9Pc6v7Y4Olc6sWsDWMA1nCTm6B6QqJsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPCRQkc5Ws1vBOXMxZL8ljC6QtLf20SYWR48m6Pm7nQ=;
 b=Z+Fl5dFI+aZj2rF7nsEf0sxUTtN1uhgnZjMtFn0IhY9LXkM6CMFFp8ejitKwCaDpiIPizm+SNFlixYokdqD0IH7d6Ooel1xeRgZIVsV5++T8UQJcun7QYbWlFL7h6Imjvy2mez7c9Temxk0vq6CesQzgtD18BPUK8rhPBkuV0LI=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by TYWPR01MB11264.jpnprd01.prod.outlook.com (2603:1096:400:3f6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 13:46:40 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::4fad:2240:4042:6338]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::4fad:2240:4042:6338%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 13:46:40 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Topic: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Index: AQHclm8qD3lunnbaf0uAuh27IRHtALVzunqAgAADMACAAE+JQIAAD2EAgAAA0hA=
Date: Thu, 5 Feb 2026 13:46:39 +0000
Message-ID:
 <TYRPR01MB14284CB75C7DCD35381BD17EE8299A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
References:
 <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
 <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
 <d6a9356d-6fd4-459b-9c5a-2f3e20368bbd@cogentembedded.com>
 <TY4PR01MB142829D9748A483ECAF19FD3D8299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <25ff0841-545b-433a-8e88-6e463ea718e7@cogentembedded.com>
In-Reply-To: <25ff0841-545b-433a-8e88-6e463ea718e7@cogentembedded.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|TYWPR01MB11264:EE_
x-ms-office365-filtering-correlation-id: 84659581-2ed7-4639-699a-08de64bcfd49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NFN6WDJpTWlRYzVtSUp1SUpmM2d5eWZxbGZ6K0pNVWU5NVUwa1JxdEpFR1hE?=
 =?utf-8?B?L01PbzJFcG1pYlVNN3I4eXNQTEF6YzFIUVduOXVCM2RadkVmVmNKcm05TEVM?=
 =?utf-8?B?aWltL0RHcXkweWdtSHNQbE4xVHV2ZFEwcTI0d3RQazNMMmtqckZkQzVDblh4?=
 =?utf-8?B?WjFhWDhJN3g1Rk1sanlxWlVOaXRMWm5HdkV4eG1CUTlrUUlBTVp3dmZuWVlk?=
 =?utf-8?B?bFhTSGhlMUlNK3k5QzhUSnhlQ3k2am9ocmZ4ZlFMQXdtVHVEQktxby9CQlJj?=
 =?utf-8?B?R0xTRldCZk1nRzZjUG8zVG5zQ0h1V0lLODdvOFZESnEyb3dtcVEvK0JRaWEv?=
 =?utf-8?B?bkptQlg1bnlkc05RcjNQa25KRWQ0dm1PanRiUFN6OGZDK1hCS0FZb2hlaEs0?=
 =?utf-8?B?dVJwMG92YnJpbFIzNUtnbFJaWVJ4UUZ0THRxUm9ZdjFMa2Z3WUdrS0ZUaUZr?=
 =?utf-8?B?R2VYZXhpb0tibmpNS3dReDM3OFozOHk5TzQvTWtxeWtxckNQYWhEd3ZIZ2lL?=
 =?utf-8?B?SUJUK0VmM3Z3ZGIxUHNnZHBIWmtiRVBJYkkwcm5RTWtGL21VSnkrSE8rY0xp?=
 =?utf-8?B?V1oxRk5JcURBQWsxN1hzNHdsU1ZPWEkzME81SWpJWU1GQy83ZllGQVhjanFW?=
 =?utf-8?B?T2NadEEraGx6Y2RndjFoeXNZVGh4c2hDOUVvY24rOGxvM1p6a3FjNW84ZTF4?=
 =?utf-8?B?Q2tMRWJJWTZlRzhSZnllOVNkNkdoZm5MZlhsK2FsbGlZSUhnTkV5WVJyTnJn?=
 =?utf-8?B?b0lxWWhma21YNDN0N2xHU1NVWlRzWjVlQlhjbitRanM1Y2lVVXR0YUVwdFNM?=
 =?utf-8?B?Q1F6SlJYOHMzU1ZmNkNOSzhmY0lPcnd2OUVMVHR3UDlBYTlPYnZZTHI5Q29a?=
 =?utf-8?B?RHdVQjJaRzdhNFY4QXNyb1Urb05LaWV4M2hOWW5NUUZnN3E5NjNld0lYbHBh?=
 =?utf-8?B?VWRXdjFtd09ldTEwMXpnVk8vQ2E2Wjk5WWlzZy9zbnlTb3h0bHVENWF0RjFt?=
 =?utf-8?B?MVJJU1g1SFhhMzIzQVpUcHB4QldzWGpScDNDdHRGdUZnUnhwdXpta0tjaWJ3?=
 =?utf-8?B?ekVUMW9GeGNWYlY1K2R2dmsyaEQyN0hMeW80R2JBNlFYZE9lRmlFaXBIbzhv?=
 =?utf-8?B?aXNGT1lRSEJXdW9zZ29ublgwWHdtYXB0VmVialAwQ25DdGh6WHFidUxjeHVR?=
 =?utf-8?B?c2hvSGZGNjlKMkFJbUloai9mY1VCdlJKSG5BRE9YaDl0KzNqN1dSUEhrRUwv?=
 =?utf-8?B?Rkk0SmphdDdjVlR3bmFMR2xsaE8rUzFvblV4SURuTkNpVXM2S201NVJXelM1?=
 =?utf-8?B?UFhjMENuNDFScldDTEVycTFBMXowY25uTGhoMW5IcUxIWDlaQVBBYjcvSUk5?=
 =?utf-8?B?U1VVWTlmS2V2SFl0NHJ1SlREb3lhSWhBcWZoc3d4VjRCR00rMGFuQjAxdWlq?=
 =?utf-8?B?ankreGdJbzZyUjBBQzgxSzRUZEtpTW5idjcwZlBZWGVDME9mRFByTlhkTzI4?=
 =?utf-8?B?aGNZSGFOa2g0WGQ4bEF5QVJMUm5wdHJOaGNENlJGYmNCZzNsVEZFK0dsdlNy?=
 =?utf-8?B?cTNXd2hsa3l0SzlpcU1RVWh0Ti8xYkMvdGpzcVFMWkhQOTFLUzhYb0JPSWpl?=
 =?utf-8?B?c3ZsYXMrM3VBSldTUk45VzJnM3QwWmRjOUZkTERsZ2MwUXd0NXgra2U0R2cr?=
 =?utf-8?B?K3FrUGZGUXAwSENsY2FjWlAzQlhaTUZRUFlCV3BMUkZyd1M0R1JPNzk1QklT?=
 =?utf-8?B?bGJyMzJXNmF1ZkRYRVk2cWtRTWx6WUJNQXM5L05UTk5aK2h3R3A3TTNweWlI?=
 =?utf-8?B?UHJ6MlRyVFZpVWlZMlArdXZ0SG5HeDBPQTdGdk10NU1vNzlaNkhsak8vQ1FI?=
 =?utf-8?B?aGxyWkRCemNjcm5lcUhzZVNWWnAzdDNIU3dyb2pTcCtySXQwUXdneXl3UlNI?=
 =?utf-8?B?YmFkM2J4VHZTTk5GL0tiZkJXdENwU3dmUmI5QWxlSmdPRW90UXVOSDJIci9E?=
 =?utf-8?B?QkIxYllTUHdJZnZUUFhnZGxjblhKUEM1UkVMZ28zbFlxem04RXJnMHpsMS9k?=
 =?utf-8?B?a1FtRDg4dHRtSFYvRW9CTXRYSjdKRVVpTVJMV0doeFJOVXVpeU9ONkhjblUr?=
 =?utf-8?B?dmhmYjZxZnByeDNudVZqY0hMRk1wamE1ZDhrZS8yZWdodXFiUFVJTTltYmhZ?=
 =?utf-8?Q?8Bz7fIX8goX9ywM2lZqogCk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVFzS2FxSWdLUWt2REk4bWNqWDc1UzFqNjFaSWduSkhiM01WUjUwWjI5YXAx?=
 =?utf-8?B?R2p1N0F6SUVQUWFNZ29Pc3lWSkxoYlFqQjd3TnhkS0t5U2RFZHhHS2dHbE9r?=
 =?utf-8?B?Q2FvbWttKzlLMEt5VmtXbFdVZjdoYnMzK0JmdXptL2MvUVZJUjkrcWRQazNi?=
 =?utf-8?B?SWFrdVJPa3NzUXI2eVRiQ1VUUFBRQmh1Wmo5NCtqYmx3SGkvYzFIVXN0RWhF?=
 =?utf-8?B?ZlBwalJXZG9Fa3VodjQxMzFqOWRycmRWTkVxSFdMeklPb29oelpEUTZlMFlT?=
 =?utf-8?B?RUVMNytOMjllQjBUMTNDbWZyTHhQeFowZGZEU0d6V0NleWZaNncvNEVoSTdv?=
 =?utf-8?B?U2pVT3BLR1dNVEplRkVyYm5zK0lDc2xxaVZQNGtiL1k5YXR0Y3dmNTlxeHJE?=
 =?utf-8?B?ZkNmUlg4aFZIbkx1bUtiWFl3WVUwOXo4UEtDaSs5ejdBdm51ZmlkVDRFbk5v?=
 =?utf-8?B?bjdSbThrdVlyYVRYeUQySUJNUnRwOSsxRjlFTEJxQW81ZEZNQ2xMbFRaTHY0?=
 =?utf-8?B?VS8yMWlvTHRuVktGWDNYOWdNZ2IveUNKTHd2bE1MZERSejJuSGI1K2lpREdz?=
 =?utf-8?B?QTRvYnpiTHphdmZyaU92N2JhQmdXN1dEV3NMTGVGSm03ZXo3bjYyN1V0My9F?=
 =?utf-8?B?V3dkN08vckNTSHZ6T3FOcThuczRGUittRVlOME9XSUluay9MU242YnV2R1lV?=
 =?utf-8?B?MUJpRW0yZGg0Q3lSTFpNUjRvc01oUGxTTU1RTzh2NHBFSlBSaVBxaW5OR3Yx?=
 =?utf-8?B?WkIwanN1UC91eWFXM1lGZTZ6L1RBYVk3L2x3NkU0dW04MkYrbUpXWEIwZllJ?=
 =?utf-8?B?QzVoVnN5WTZUWWpObkw5VjltZXZieWNBVmVhTnRnTVBKb0R5RGgzTTFLMEN1?=
 =?utf-8?B?KzBlSGw1dTgzWmJKMHdzelpKbnpzQU1FeTNyRkc1ZkplcmkrSzhRWVN5bXpl?=
 =?utf-8?B?VHJuQlFFNUNGQmZ2OUsrckxuMVlkSnVIRWc1eEp0Z2ZmSGErV3hjaURNd0ZU?=
 =?utf-8?B?a01EdjhKL2ZWcFJuNDFHRDltUmtmZWQ4NU5VVzZicytCajFZcGd3dUsyVml1?=
 =?utf-8?B?elNSVDhHVHRJdGpUYWgvckM0NTV1b05Da1hNSFRUWnJzaVNBOEhuVGFOajR3?=
 =?utf-8?B?MFJlejVneW43UEVZTjZCbDBhcy91bVF6UUJ2R253ZGVweHNTMk5Cc28vTVU2?=
 =?utf-8?B?am5iZGxzci8rL3B2d1hWSk55V0pxZ256V2RHbXphT1ZneHlDbURxWTkwY2VM?=
 =?utf-8?B?aWRwL3grRzhweEc5Q3NDdmxwUy9iL0JpOU9kZDVqU3dlZDczVzVnQjNrVkhM?=
 =?utf-8?B?Ti9YK2hkR2duZ01BVFhwWVU5Q1lFdHliSkhzSWZ3NGxqUUhNS3djNlhJeTR5?=
 =?utf-8?B?MHgxREJKd1NIVExFT1BESTZmbW0wYURpSHdPTjlIN0VkZ3VBRjQwcVdVTDlh?=
 =?utf-8?B?eUhaQzIxTHRvOVFMTkcwRTNlb29vd21nZHVxUWhDUWxaWE1JQWZYcC96anNu?=
 =?utf-8?B?M0R4cDhCUjlwTkUxRm1FallFc2FNM1BPeDRuTzBVNjRWNS9McjhLL3Fwd1Vz?=
 =?utf-8?B?TEMxZXdZdDBOeGhFL1h1VHVhOE5MZkk0b1lWbzRLRHlIa3hiUkg2L0dTT3Ba?=
 =?utf-8?B?RXJlMlR4T29zd0d5MDF5dHBQODk5NVdZZjY4M0RJelBkQkVtNjR5VWtMVEVB?=
 =?utf-8?B?UGhvVFdFM2tPaVBXdkVDbm95RHk1QXpSQk5tRDlwWmlxZ2JqcjZsU1Z6UXhq?=
 =?utf-8?B?TUJvSzFxUHgyVExoNWZHLzlWVDBiWGtkWktMd0dBRWF5TWhQN3FoNE01eDBo?=
 =?utf-8?B?WnpBZnhPRGZoS0I2Wi9ub3JjYVMrL0RRTGYwOTZtRHBvZzR2ajJ5YW84SnRh?=
 =?utf-8?B?amFBWVBtQ1YxQnd3dklURkNjYkN2ZkNWRWY3MmZtWXNIWi9Ja2thTCtSU3hL?=
 =?utf-8?B?dzF0QlhLcS9oZU1YZ1BkNlpsNFJSNDVKRXVPalMxaFJWK0QxR1orK29vUFNJ?=
 =?utf-8?B?bWVmVzZnT01tZ1pBelZuOUVIQVEwNDFobWtIOWxXSmpScEh0T3BOemIwQmhu?=
 =?utf-8?B?d08zbTMra1hFWkVzMk5pdEMxL1R6MG5DVDJkU3BOck9WTnBkeWxsTXF2amdm?=
 =?utf-8?B?NGVWRXpQTUNaTVVEZUc2Yk84TFhnWTZFOHRXdmcrWXJzenVHVXVIc0FYK0w2?=
 =?utf-8?B?T3dacHJrQ244UGxNaHU4RHRVcWl5K1c3TWJlOE52alBvdVN6SXhwTGRBTXpa?=
 =?utf-8?B?SGhyMGNkTUZVTGk2cWIvR2dPdHNBRkJpVmlpU1o4YXEyYlN3K2tLaTFXeVlo?=
 =?utf-8?B?ZnVNaVVUaXJqWllPdXBCWkF3SjZpemVjR0FwaDVVWW5YZDI3OTdHZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB14284.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84659581-2ed7-4639-699a-08de64bcfd49
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 13:46:39.9184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JVHyXn0ZT3DFAd5U+IwjxAenvowPdwdjXl1cfXkK6S3sYp8fsCHzWueesOxIuWMASyj9EhYaCnfKmJpqLDZsxGRc/C4tlk+0E4s+BOXC2tE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11264
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27949-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TYRPR01MB14284.jpnprd01.prod.outlook.com:mid,davemloft.net:email,renesas.com:email,renesas.com:dkim,lunn.ch:email,cogentembedded.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8100F393C
X-Rspamd-Action: no action

SGVsbG8gTmlraXRhLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5p
a2l0YSBZdXNoY2hlbmtvIDxuaWtpdGEueW91c2hAY29nZW50ZW1iZWRkZWQuY29tPg0KPiBTZW50
OiBUaHVyc2RheSwgRmVicnVhcnkgNSwgMjAyNiAyOjM5IFBNDQo+IFRvOiBNaWNoYWVsIERlZ2Ug
PG1pY2hhZWwuZGVnZUByZW5lc2FzLmNvbT47IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8u
c2hpbW9kYS51aEByZW5lc2FzLmNvbT47DQo+IEFuZHJldyBMdW5uIDxhbmRyZXcrbmV0ZGV2QGx1
bm4uY2g+OyBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+OyBFcmljIER1bWF6
ZXQNCj4gPGVkdW1hemV0QGdvb2dsZS5jb20+OyBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwu
b3JnPjsgUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPg0KPiBDYzogbmV0ZGV2QHZnZXIu
a2VybmVsLm9yZzsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0XSBuZXQ6IHJlbmVz
YXM6IHJzd2l0Y2g6IGZpeCBmb3J3YXJkaW5nIG9mZmxvYWQgc3RhdGVtYWNoaW5lDQo+IA0KPiA+
Pj4gaWYgKHJkZXZfZm9yX2wyX29mZmxvYWQoKSAmJiByZGV2LT5mb3J3YXJkaW5nX3JlcXVlc3Rl
ZCkNCj4gPj4+ICAgwqDCoMKgwqByc3dpdGNoX2NoYW5nZV9sMl9od19vZmZsb2FkaW5nKHJkZXYs
IHRydWUsIGZhbHNlKTsgZWxzZQ0KPiA+Pj4gICDCoMKgwqDCoHJzd2l0Y2hfY2hhbmdlX2wyX2h3
X29mZmxvYWRpbmcocmRldiwgZmFsc2UsIGZhbHNlKTsNCj4gPj4+DQo+ID4+PiBzaW5jZSByc3dp
dGNoX2NoYW5nZV9sMl9od19vZmZsb2FkaW5nKCkgaGFzIGludGVybmFsIGNoZWNrIGZvciB0aGUN
Cj4gPj4+IGN1cnJlbnQgc3RhdGUgYW5kIHJldHVybnMgZWFybHkgaWYgdGhlIHJlcXVlc3RlZCBj
aGFuZ2UgaXMgYWxyZWFkeSBhcHBsaWVkLg0KPiA+DQo+ID4gVW5mb3J0dW5hdGVseSwgdGhpcyBo
YXMgYSBzaWRlIGVmZmVjdCwgZS5nLiwgaWYgeW91IHB1bGwgdGhlIGNhYmxlIG9uDQo+ID4gdHNu
MCBhbmQgdGhlIGxpbmsgZ29lcyBkb3duLCB5b3Ugd2lsbCBzZWUgdGhhdCB0aGUgb2ZmbG9hZGlu
ZyBpcw0KPiA+IGRpc2FibGVkIG9uIGFsbCBwb3J0cyBjb25uZWN0ZWQgdG8gdGhlIGJyaWRnZSBh
bmQgbm90IGp1c3Qgb24gdHNuMC4NCj4gDQo+IFF1aXRlIHN0cmFuZ2UsIGlzIGFueXRoaW5nIGVs
c2UgbG9nZ2VkPyAgRS5nLiBzb21lIG1lc3NhZ2VzIGZyb20gbGludXggYnJpZGdlIGxheWVyPw0K
PiANCj4gTmlraXRhDQoNCkhlcmUgaXMgdGhlIGxvZyBmcm9tIHRoZSB2ZXJzaW9uIHdpdGhvdXQg
ImlmIGVsc2UiDQoNClsgICA4My4xMDc3NTldIHJlbmVzYXNfZXRoX3N3IGU2ODgwMDAwLmV0aGVy
bmV0IHRzbjA6IExpbmsgaXMgRG93bg0KWyAgIDgzLjEwODczNF0gYnIwOiBwb3J0IDEodHNuMCkg
ZW50ZXJlZCBkaXNhYmxlZCBzdGF0ZQ0KWyAgIDgzLjEwOTY2OV0gcmVuZXNhc19ldGhfc3cgZTY4
ODAwMDAuZXRoZXJuZXQgdHNuMDogc3RvcHBpbmcgaHcgbGVhcm5pbmcNClsgICA4My4xMTA1MTld
IHJlbmVzYXNfZXRoX3N3IGU2ODgwMDAwLmV0aGVybmV0IHRzbjA6IHN0b3BwaW5nIGh3IGZvcndh
cmRpbmcNClsgICA4My4xMTE0MDVdIHJlbmVzYXNfZXRoX3N3IGU2ODgwMDAwLmV0aGVybmV0IHRz
bjE6IHN0b3BwaW5nIGh3IGZvcndhcmRpbmcNClsgICA5MS4yOTk5NzZdIHJlbmVzYXNfZXRoX3N3
IGU2ODgwMDAwLmV0aGVybmV0IHRzbjA6IExpbmsgaXMgVXAgLSAxR2Jwcy9GdWxsIC0gZmxvdyBj
b250cm9sIG9mZg0KWyAgIDkxLjM1NzYzNF0gYnIwOiBwb3J0IDEodHNuMCkgZW50ZXJlZCBibG9j
a2luZyBzdGF0ZQ0KWyAgIDkxLjM1ODMwOV0gYnIwOiBwb3J0IDEodHNuMCkgZW50ZXJlZCBmb3J3
YXJkaW5nIHN0YXRlDQpbICAgOTEuMzU5MTg1XSByZW5lc2FzX2V0aF9zdyBlNjg4MDAwMC5ldGhl
cm5ldCB0c24xOiBzdGFydGluZyBodyBmb3J3YXJkaW5nDQpbICAgOTEuMzYwMTA0XSByZW5lc2Fz
X2V0aF9zdyBlNjg4MDAwMC5ldGhlcm5ldCB0c24wOiBzdGFydGluZyBodyBsZWFybmluZw0KWyAg
IDkxLjM2MDk0M10gcmVuZXNhc19ldGhfc3cgZTY4ODAwMDAuZXRoZXJuZXQgdHNuMDogc3RhcnRp
bmcgaHcgZm9yd2FyZGluZw0KWyAgIDkxLjM2MTgwMl0gcmVuZXNhc19ldGhfc3cgZTY4ODAwMDAu
ZXRoZXJuZXQgdHNuMTogc3RvcHBpbmcgaHcgZm9yd2FyZGluZw0KDQpBbmQgdGhpcyBpcyB3aGF0
IGl0IHNob3VsZCBsb29rIGxpa2U6DQoNClsgICA4MS4wMjc2MzJdIHJlbmVzYXNfZXRoX3N3IGU2
ODgwMDAwLmV0aGVybmV0IHRzbjA6IExpbmsgaXMgRG93bg0KWyAgIDgxLjAyODY2Ml0gYnIwOiBw
b3J0IDEodHNuMCkgZW50ZXJlZCBkaXNhYmxlZCBzdGF0ZQ0KWyAgIDgxLjAyOTU4Ml0gcmVuZXNh
c19ldGhfc3cgZTY4ODAwMDAuZXRoZXJuZXQgdHNuMDogc3RvcHBpbmcgaHcgbGVhcm5pbmcNClsg
ICA4MS4wMzA0MzFdIHJlbmVzYXNfZXRoX3N3IGU2ODgwMDAwLmV0aGVybmV0IHRzbjA6IHN0b3Bw
aW5nIGh3IGZvcndhcmRpbmcNClsgICA5MC4yNDM4MzJdIHJlbmVzYXNfZXRoX3N3IGU2ODgwMDAw
LmV0aGVybmV0IHRzbjA6IExpbmsgaXMgVXAgLSAxR2Jwcy9GdWxsIC0gZmxvdyBjb250cm9sIG9m
Zg0KWyAgIDkwLjMwNTI5MV0gYnIwOiBwb3J0IDEodHNuMCkgZW50ZXJlZCBibG9ja2luZyBzdGF0
ZQ0KWyAgIDkwLjMwNTk1Nl0gYnIwOiBwb3J0IDEodHNuMCkgZW50ZXJlZCBmb3J3YXJkaW5nIHN0
YXRlDQpbICAgOTAuMzA2ODM4XSByZW5lc2FzX2V0aF9zdyBlNjg4MDAwMC5ldGhlcm5ldCB0c24w
OiBzdGFydGluZyBodyBsZWFybmluZw0KWyAgIDkwLjMwNzcyNV0gcmVuZXNhc19ldGhfc3cgZTY4
ODAwMDAuZXRoZXJuZXQgdHNuMDogc3RhcnRpbmcgaHcgZm9yd2FyZGluZw0KDQpCZXN0IHJlZ2Fy
ZHMNCg0KTWljaGFlbA0K

