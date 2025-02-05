Return-Path: <linux-renesas-soc+bounces-12849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C152A284E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 08:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54B351887BED
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 07:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAAC228387;
	Wed,  5 Feb 2025 07:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="l/XOhV8D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E121C16F;
	Wed,  5 Feb 2025 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738740102; cv=fail; b=essO9hSbvlfa9aUvISkyUqMbDp0wYv1taBv/io776Ae9v4JekhD9UDdM/YY8sAGtdTQfmsDxKtoHg0Czh/O27HIhhqfqTFJbT3+fR2gazcZACoWhaQiQnmcu7owJl991XlVul6iAWnjjo3WiJQhL9+6u3n7Ev9iCyfqqy/qpY8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738740102; c=relaxed/simple;
	bh=fQt3bXmsHKkq0vYcgFMLjI22rGZeQgEvDDZ7pNlsAKs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wl0grTLVEFpmpQdoVmPvOD5xk1OHC8CGN8E3lgFgnVxdW/yR7dBFHvy5lJk7JizDCCy3Tyza3XNnL/LJOdIZ3/qyWv7axC3QGQstbXA6Zp4n/f1SLBa9CUaiPZUmFnbt57k1DQTD6npxNN7Rhj94OvwRgAjnHioRoAGStSN2qk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=l/XOhV8D; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvxxDyV/67v/zsIbg2jng6P9HP7xEgKF7o+yEz6xPaDuCSebAUhdHrWiDgCw8lLDZ646qYBRwcSGCdDOWf71gSRUXFqSJxpWqoTgJkQPLJGVfkQaEeElEWmSbojwQLJTAu7QDd+Ab0Z8apzrv3R7n+Duh1Q8AthoWQSQq6hnHzJIuAYD7gFOcZLQGiG+UXJWT7P7zoKdSp2YClc1CLZJCgk9dt7j4iY79lHcUXXwy2jP69vCVtBFc1Icf0udhIFy6q7drJQTmAB5t06i3BLfg+aRdBbEykY6S511JHJFzy+TjNKp7wpyO5dCRKU3I3QhOf8kWAwGRhwXDPOXbJltKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQt3bXmsHKkq0vYcgFMLjI22rGZeQgEvDDZ7pNlsAKs=;
 b=YRuc1wiVOrXomRm8jpjM+B4Y6d+teVfu5fYNE5PZNJCtiNq3QYKYz59wI1mTb5eWHehDIHSC6okqlJN0cE1r6dxXkEAvx8KhCttS2yp36npJJ8nBIE5HS1EN56NOuu8wj6ncLKJSFqTtMS6FJd2POSvxIIt75eMN3gY5k4pu/TGNt6e8Ly1VNz2GpOqRqLyGbuJfF/EgDkDFVauIKOBtyOxO7JcKbQ+v5TdTu/+ipGcd1rj7A9JNJRCvNafsgzRdxMeSSxpVtNvmT+k2+YWjZlJsWUOJ82L6URF2xBlR5eoMsfSlSosP5bjYRCKSuZjOG/sRhBoTc4vyHBWw2TM5vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQt3bXmsHKkq0vYcgFMLjI22rGZeQgEvDDZ7pNlsAKs=;
 b=l/XOhV8DucMj7pm3AOYw2Y52ECDPzgHJra1Dd3eeADbMgf6QElFlGnS2te4/Ktf+6ij0itRSn/n0YcQo50V66f4q/J0JdZQPj/CzCcnKwtJ0mQ1wcfpn/ggAKN9nGmpqQoUNWP/Vnt4cJnOdN9et3xc5DaTJWf3vikYjbIXQhIo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10891.jpnprd01.prod.outlook.com (2603:1096:400:26f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 07:21:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 07:21:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 5/8] arm64: dts: renesas: r9a09g057: Add support for
 enabling SDHI internal regulator
Thread-Topic: [PATCH v2 5/8] arm64: dts: renesas: r9a09g057: Add support for
 enabling SDHI internal regulator
Thread-Index: AQHbc9NZt47Owzw5Y066V6psYn6TL7M26cNggAFmDYCAAAU9YA==
Date: Wed, 5 Feb 2025 07:21:30 +0000
Message-ID:
 <TY3PR01MB11346F7D36B7BF272D907894586F72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250131112849.120078-1-biju.das.jz@bp.renesas.com>
 <20250131112849.120078-2-biju.das.jz@bp.renesas.com>
 <TY3PR01MB113469AB8C9B228E73673F88786F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CABMQnVJ6OrtAcbCQG4d_gdEDZBJ9C_Ghh1Yrrs=n+HwA8pNGzw@mail.gmail.com>
In-Reply-To:
 <CABMQnVJ6OrtAcbCQG4d_gdEDZBJ9C_Ghh1Yrrs=n+HwA8pNGzw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10891:EE_
x-ms-office365-filtering-correlation-id: fd4e5874-c5d1-4c5f-e704-08dd45b5b656
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K1UrS3VIaFdkaENrSExhd1F0R1paUFpVMHpvZ1huOFQrc2lDN1Iyb1VzZjBS?=
 =?utf-8?B?cnBQZTdnYitVSkVZSmtyWXZmbWZhQjlIbkZmenNqcjU0Y0dmd1NTTGc4c09k?=
 =?utf-8?B?Tnk1TUx5YTZSUjlJdHlueEZYUFdSWnpGMHVjdVZQRTdNNGltYlR4aXgvY3dY?=
 =?utf-8?B?OXYvdldiRnFSdk11QWJBME5sd3VDVEVGMDZ6MjNOWmNjRndaQU90SEhJM1k1?=
 =?utf-8?B?aUlyUEZOWjBZZkl6b1FvdW1ab2JWejRDNUZ4WUZNWmFzblgvQWtBTkZkaHVR?=
 =?utf-8?B?K3dIeXdRTCtKa2dqMmxQYVRYaWh1Nk9PczVERVdZZ2JnNUxvVVByMUVyOHBy?=
 =?utf-8?B?aEV0UXl6ZDVVMGRTNGM4NklFYytiY1FQMGdReDlhM2xYSU5jTGFHMXVNRlEr?=
 =?utf-8?B?eGtySkFxTm9qY1U3cmQ0cjJwSHdibjU0VUVnUmIxQis0S1Bvb05TM1Y3NEdh?=
 =?utf-8?B?ZDhUUXN3YlI4SjludFZXUVN1a2ZPSXVHMTBGa0dYd0FEclJKblVNaWY2UU11?=
 =?utf-8?B?Q3B3OFpkNHlrY2VwNnIyakwxcVVqV3BGWjNUVkExdi9tUVVFQWF1cmFsOXJF?=
 =?utf-8?B?NjNTclVHazcxdGllekZhSGMySXdvWERoRkRPckZkb0hEaGJDWlpDcWk1MWJm?=
 =?utf-8?B?YTdlOXNFSGh3bzRJOVpKb3o1MWpXQUtFTmZkcldSZ1hVV3BrQ0RvN3NCV2kv?=
 =?utf-8?B?OTZ5c1d5d0FqVzhqejQrRHdxU3FGdFdpVXB1eFgrNmgwdmcxNnVYRjJlMGdY?=
 =?utf-8?B?aWt0THV6TnBFbzBuZmEzc3J1U0RWTkY1SnViL0k3cEo5ZkRhcTRIeG9jMnJK?=
 =?utf-8?B?U3cwa0ZMZlkxRDhFbEhmL29FcjY1WFRHcnh3dG5UM0syam9LSm5NSzJoL29n?=
 =?utf-8?B?ZTNGRFV2aGJKd25qMmRWNFlqMStUWTZqMEZPUm44eUQ3dWtaMjRoUjJ6ZDc4?=
 =?utf-8?B?OHM4WjJpUzNGUEszUFdWWnpkcGhUVGlaTzlBYUNjb1p3Kzkrb0hYSjZqQ3M3?=
 =?utf-8?B?RDdZRWx3SWo1L3I3YXlGUXRkSXk0bFdWSXdDQVhLaXJUdSt0cnFhUXFGTHNw?=
 =?utf-8?B?cDFQYm03a2tCMG5OU2xFa3FON3FNVjZ5YStuSWFqaCs5L25BR2VwQVZxUVVG?=
 =?utf-8?B?SWdLNUxLSEFUZXNJSnNSS1pxaE9ERnFPaEZEKy92dUI3N1YyYVZVM0QrMTNJ?=
 =?utf-8?B?a0Ewa0dvVjVTbTVtcHRLL1lUclF3ZkgxVEV2ZDgvR3ozL2p5RkQ5YWZHU0tR?=
 =?utf-8?B?UnFBelRsT25uTmhRR0xQUUc1alhkb3k1ZVIrd0ZZaytkTDlWc2xsQmdCMGJJ?=
 =?utf-8?B?VnhtVFM0NXFzWVFVVXBoWTZPbEpFclF1RStGSWIzMVkxQ2xZaTJ6RkRwR1Vn?=
 =?utf-8?B?c1FmelhxSW5mYk1Lb2ZSaVFMMG5HNUFJQjdMcHpOWUlQNDdxMXVBY3NTSHoz?=
 =?utf-8?B?OHhqb2VOd3o1SEdHMDRNYWl1b0tTaXJxYklhS3N3a1BKYVNwU0xpR051Wnow?=
 =?utf-8?B?L0VPdWhkc2w1M3BxNmtEaTQvVTV0V1pMaWxOejBXT3dQZFZxdXFYbUZONWhL?=
 =?utf-8?B?MG4zRDA5SWR3M21tZTlyeWRYdXhZZTFraTU1WVRuNkpoTncxZGpDTFdGcmRr?=
 =?utf-8?B?Y2crQTUwdWxjbXNkNC8zd3Z6a0ZPSzNCdXFqcUpnRWRpRDd1VmdoUmxBaVM0?=
 =?utf-8?B?VFUvWGdsSGp5ODk4TzNqODZqLzA4eEZJUDlaNFIwcFpodGk1T3N6STR4bVIz?=
 =?utf-8?B?aEZVaUw5Vldnc3hFK3hDSjFxb0tFbUhqY0pUMlhab3pDb0tQTFVROHphZXBp?=
 =?utf-8?B?NnU0KzNGeEhmOVE4WC9NR0NSYm1vZm9DdWVJTzJENDhQU0Fsb3hua2VEWW5C?=
 =?utf-8?B?MDVoUUNFRjBVWkFwY1liN3B4Q2xrcEVPQWNnQzliMy9sUG9URFJpeHFlSU8w?=
 =?utf-8?Q?Qht93T61aQCas/Cw1t2T6QXpIHm9z+ne?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RzlyejlDYnZnWWVEeStWUkhVL3A1bS9OWkxwdFJjWTU1RTNWbVN5cTNnL2tF?=
 =?utf-8?B?cGpJV0F4eE8wN29GejlIRFVlN2R2aE5kMFRGUzlFWWcxUW5pbVhYc3BITjFw?=
 =?utf-8?B?WXpoTU5VS2xFa05FSjJyMXZLUUdSR1l3ektmQ0xRQXhKN3hpdUpSMDJjOGhW?=
 =?utf-8?B?ZWdxOUJQNFFqZEhBbWtRSm1XV0hXMDZVM2VWSENGZmh2ck5pMU5iQ3hPbFdP?=
 =?utf-8?B?S25UTzA5ZGtFak1jRlRyaU1zRTNiSjhnaVhWUTNWSjdUdlZDVXF0YkpjUVk2?=
 =?utf-8?B?dWE0WkM3OTN0ekRsQmZieHJSRUQyMjlaeVd3aExZWWFhcFcrelhKdWR3OHJu?=
 =?utf-8?B?N3pOM0hrb3FFRmd4VmhtdnBXc1JwUkRoYTN4MDlBZCt4a3ROeVF1akNJM0cr?=
 =?utf-8?B?dmJUM2VCMm1zNFc3WkRNK1FFNVQ4SCt5S21GTnBEQWwwNDB2VE1kTjUwdjEw?=
 =?utf-8?B?VldWTkFqWW1vVTI0S3Z0VVZTd2xPampXbHp3RndBaHVjSm5FWkdSU1VKbmtI?=
 =?utf-8?B?VVJEQ3VSRzg5Nkxidk9MRjlZYnMwNndSVUp3MFpxNHVzNFZ5V1Jnd1puRFVn?=
 =?utf-8?B?MVhjMmlVUUtGZ0pabnJxdXlRWHhTWWVYNVB2b08wbllwNHc3Q0MrTzZNMkU4?=
 =?utf-8?B?RGdadjE2anJESnBoUGhGRVBMVzdYVDA2OUJBZHQyN09QTW5WR3A4Qi9TVFRm?=
 =?utf-8?B?emFGU0hjSFJXRTRXR1F1RFpCK1IxU2lpdzV6emw4WFJXNE5GSWxLb0hjWkpG?=
 =?utf-8?B?UDNQTHJ0T05xNzRXa1pUTlRCYnBHNVhsWUs1aUpIUHhRcmI1QVJhSnFnelN5?=
 =?utf-8?B?Rnp3YVJURXI2QTVsQTM4S3l1dFV4TUJUcUJmOVBCTmdGK01Yc1NocWU3QUht?=
 =?utf-8?B?dzNIRUNzM1l1aDVBSXhmK1VuSHFhaVVnVnpyNXh6dU1LTlU1SnppaUtDK01M?=
 =?utf-8?B?eXpGYXUvLzFMNVFReWxWR3FHbHR6aXBJK1l5UXJ6VXF6Qk5xWGJLdzBUOXJw?=
 =?utf-8?B?NDJpVlZTTllJTm9hYU5PY3g5eCtJVE1DVHlGcVBCdEZCbnIrT2YwRTBobGE0?=
 =?utf-8?B?cFl6Y0g2MGRoMHJyQTMydDRrZXdCSk5pb0lZOFpTOVcyVWtLd0JvRUJZZ3Rl?=
 =?utf-8?B?NHR6NmN4TkxDNEUwM20yRnV0MVcxV3BBeDBCN1djb2tPSDUxWWY4K0NrV1Q1?=
 =?utf-8?B?T2VhQmpldlFGRzBZRW9jandmallBS1RqWGF1R2FPUUpiQWJ3NVp3eXYyamdw?=
 =?utf-8?B?YlhNZDI1TlYxSWN4dlh3NWx6SSt0UkhWL1ZHci84NjBHcEF1dlZXVWZzbldM?=
 =?utf-8?B?dUpaeXQ5VHBEazdGMlFCa3VwZkFabkU4dFR5QXdJTm5lUENOdnhlckYwRndy?=
 =?utf-8?B?RnN2WVZ3bkhaeXlZN0toaU40eVoxbVNhSHZxeXJIVmtYS1RBUHVRTHRvRXl1?=
 =?utf-8?B?ZlE1UXMya1REOWQ1eDNLMDUyK0owRVRNYk9xM3ljSkhoOFdLVDVZSS9YVUdm?=
 =?utf-8?B?bG5TaGI0bUs1R2VENnZNNzNPTjN0YlZKZFladEdqOEJXWVNINUJlbXRXYlJT?=
 =?utf-8?B?b0hHSWZDY2FPSFVoa2dOVW1jOHl5YWl6UzFZYzZOMW8wTHJ1Y1ZFS3V5Mzgx?=
 =?utf-8?B?WkRjYmhZRmJUUDZCR2Y1NFJEZGVMRFFGMCtiYy82SXE1R0N1Z1doU2txSEcx?=
 =?utf-8?B?YWRaOEpUOFg1bERZbDNpLzFwMFpCRk0vcEMwRUJwQTNtRXBYcnY5ajcvOFJs?=
 =?utf-8?B?ZGlhQUJPa3dnOHlGZnBzR3lmSG8zRkQ3KzBEWnBTVStseDRUSHpRUHl6cUx1?=
 =?utf-8?B?WmhKU01JczkwN0FOSlJtakNVY2UyRUgxcGtpTzFpWjh2THk0LzV0Q3FIK0g0?=
 =?utf-8?B?dW5GMUpycmcwUUtucFI0NmZoK1NxblR6eU0zc1J4cmIzMVR1c0JUcWlPaCtv?=
 =?utf-8?B?M0YrTzd5ZU1LcEpaZmw5Q3FZSUdsYXFDcG1mb2NPdE9QN3ppa3gzU1ZxbUN6?=
 =?utf-8?B?ZVl6Rk1BWWFOdW5zdU5UYnVKUm42V2ovVENzVDNNNkZKejdxVzlESmc5aGxw?=
 =?utf-8?B?dWE0TWRKalB1b3ZlQ0xMTmk4NGpFSjFHUFBhSCtDZHd1THQ4MzR4emJ3Nll0?=
 =?utf-8?B?K3NCTTZQRmNzWXlPY3htYlZUeDFBQ0N3V3BCc0FBd2lZMElBa2V6SHlpbHYw?=
 =?utf-8?B?Mmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4e5874-c5d1-4c5f-e704-08dd45b5b656
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 07:21:30.6413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fUIvoPsLc7MhIln2wyF+oQwV5r0FmTuInB+MN1aRBvQ3bUhWuhaIH5MfFaFta0LChGNFDHXBEAdgSgokxAgzdKVNEevZ5oVXFngltgWOloI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10891

SGkgTm9idWhpcm8gSXdhbWF0c3UsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogTm9idWhpcm8gSXdhbWF0c3UgPGl3YW1hdHN1QG5pZ2F1cmkub3JnPg0KPiBTZW50OiAw
NSBGZWJydWFyeSAyMDI1IDA3OjAxDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNS84XSBhcm02
NDogZHRzOiByZW5lc2FzOiByOWEwOWcwNTc6IEFkZCBzdXBwb3J0IGZvciBlbmFibGluZyBTREhJ
IGludGVybmFsDQo+IHJlZ3VsYXRvcg0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IA0KPiAyMDI15bm0
MuaciDTml6Uo54GrKSAxODo0OCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
Og0KPiA+DQo+ID4gSGkgYWxsLA0KPiA+DQo+ID4gSSBuZWVkIHRvIHNlbmQgYSBwYXRjaCBmb3Ig
Zml4aW5nIHRoZSBidWlsZCBpc3N1ZSBmb3INCj4gPiByOWEwOWcwNTdoNDgta2FraXAuZHRzIGFz
IHRoaXMgYm9hcmQgaXMgaW50cm9kdWNlZCBpbiBsYXRlc3QgcmVuZXNhcy1kZXZlbC9saW51eC1u
ZXh0WzFdLg0KPiA+DQo+ID4gSSB3aWxsIHNlbmQgbmV4dCB2ZXJzaW9uLCBhZnRlciBnZXR0aW5n
IHNvbWUgZmVlZGJhY2sgb24gdGhlIGN1cnJlbnQgc2VyaWVzLg0KPiA+DQo+ID4gYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1N2g0OC1rYWtpcC5kdHM6NDIuMzYtNTAuNDogRVJS
T1INCj4gPiAoZHVwbGljYXRlX2xhYmVsKTogL3JlZ3VsYXRvci12Y2NxLXNkaGkwOiBEdXBsaWNh
dGUgbGFiZWwNCj4gPiAndnFtbWNfc2RoaTAnIG9uIC9yZWd1bGF0b3ItdmNjcS1zZGhpMCBhbmQN
Cj4gPiAvc29jL21tY0AxNWMwMDAwMC92cW1tYy1yZWd1bGF0b3INCj4gPg0KPiANCj4gWW91IG1h
eSBoYXZlIGFscmVhZHkgbWFkZSBhIHBhdGNoLCBidXQgSSBhbHNvIGNyZWF0ZWQgYSBwYXRjaCBh
bmQgY29uZmlybWVkIHdvcmtpbmcuDQoNClllcywgSW4gdGhpcyBjYXNlIEkgd2lsbCBhZGQgeW91
ciBUZXN0ZWQgYnkgdGFnIHdoaWxlIHNlbmRpbmcgbmV3IHZlcnNpb24uDQoNCkNoZWVycywNCkJp
anUNCg==

