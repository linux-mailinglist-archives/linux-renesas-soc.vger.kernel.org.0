Return-Path: <linux-renesas-soc+bounces-11908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0066AA03F10
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 13:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F7521886F4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 12:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3771E633C;
	Tue,  7 Jan 2025 12:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iwNrhMA/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C29C1E008B;
	Tue,  7 Jan 2025 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252743; cv=fail; b=VUfGrrarUiF8sWKSwrbVEfNp9kRdxRTUtjyV+NOUP17tCVvM2YZiXIz/IolBvBpzk4pFNDNcZsDTuD3wiOdEcj9woV+Nm8jb2F26oJt6XNUnlE0WF5VGhIvwJYFylcjIMjfeI5tCLFI3rWlBQSaTi/d+pXP6oaZpjZmjhI669Qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252743; c=relaxed/simple;
	bh=j98MgFYA5Cm9BwnVfhPayueaZxIGzAOp0DE/l5an8iY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G6N8v0KimDeyM+Ip24TmLz1DlJMCHDrExJa5ZtyEzGm8kd1cvpy4Z84S2C/fLVHYGl7eq/sxsBNsONcfT5oI7d5uXLsdRkMeuCiU7Pmswa2MaV3LXwL6vv89nw4rLwnLNZUSS21x5jviYX8HIRjqbKg+C1HyVMYWthNPiWnrxG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=iwNrhMA/; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4S+LOTsuAkNGsRG67xDefmMkV56LCkfw9bcXpYBRbH/I76xcnx2zK2Mj/1Dfmw1CfzX0hZxDUQFxQxQrkVfy8SyTzK2+l9mF30Ulqlzh5dIks3YapNy8UG4ryyA0dHAx2hIIi06ACcwSVXV1lnDH6kLdRmSDqWi6BbVDvdIS7zCXRfNnJ8BWOp81V2yjO3KE4LxP1MpvYZKHRIm5APjYLBEGaWwOv1tRmzB8RacxGIG+MPhWeF/iCgcw7AkiLCb8fJARJ0C5XCNTdCRrjQBHTvdKSCj5VQ1tCcGwyK24Jeb0mbeZn0D3mhi2EPHci8VGahN96DVYmyooCz7FGTjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j98MgFYA5Cm9BwnVfhPayueaZxIGzAOp0DE/l5an8iY=;
 b=H5bpxFPetGw7njOnZ3uumzoroEHuQNGV+zFURDaFVucNuJx0bgA5F6V3iSmEZB3teJeFWhHncZoKbTdoKljmhrElRJJk4oZ8P7BWrG6x84BVrqRHwmaPcC099Jgx4Lgk+ZHW59swKBaeZ+ST/dYMkE3RvYftw9uyxte6FBo0sFsIoHyhPBmY9MjAuH9bkkgCJbdmCAsOXaivLXPeDNH+/N9IUx/VYBuJFRnALDwQjB7u0MD/DMU/aLGXqi5Gg3Et3RQVK3mhCHnm4Xgl8vjo4th51yNI6B3ZUDjyXBjrd0nI6+dvrzddp370IaR9wZA576aczgTjhJ0rB8N1ueqS8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j98MgFYA5Cm9BwnVfhPayueaZxIGzAOp0DE/l5an8iY=;
 b=iwNrhMA/RZFWJE2r11zcb4iuQrTSKblJRe61Tmzgbo5Q4MjdFyX2bUzTeN5z4SMTXbRt5OqMyWpTeoV4gWJpLA5/Gwxj16773RMTjczt28dKbU1ADtOVK8QJTZbTPSlzGV1pxVw84wx1tRgV2UeroPaJ416XirIP+9EMghQhZLA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8743.jpnprd01.prod.outlook.com (2603:1096:400:169::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.15; Tue, 7 Jan
 2025 12:25:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 12:25:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
Thread-Topic: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration
 to per-bit basis
Thread-Index: AQHbXULKeQyg6OXyX0+NSgiIE5q337MLMU7ggAAHlgCAAAnwoA==
Date: Tue, 7 Jan 2025 12:25:34 +0000
Message-ID:
 <TY3PR01MB11346C6E247A83F6835F0C7A686112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346C123E18F61A009F6F0F586112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tO-d35+aPLYoCmC4xKW4cMoNyzM_Vmyw6CzOJjyjj=_g@mail.gmail.com>
In-Reply-To:
 <CA+V-a8tO-d35+aPLYoCmC4xKW4cMoNyzM_Vmyw6CzOJjyjj=_g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8743:EE_
x-ms-office365-filtering-correlation-id: c0ae1ddf-a02f-4df2-2179-08dd2f166249
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OTA5N3J5ZG12bHpiczRSalg3VS9NbkdiUUQvaUViVXlyZGE3L1lVZzJxR0JJ?=
 =?utf-8?B?YUk3aHNkK3Z5a2lBY0c5TmgwY3pQSTZ2UVRLdmlZN0V0WVNYTXpDRGxycDVN?=
 =?utf-8?B?SjVhZGxlRjZLaXV3QW9ST1pHVzh0WVRPSU8ySVY1QUV2V1YrQWNMNWZDSnFh?=
 =?utf-8?B?NHZyamcwMWJtSkhqUnQ2M1dncUdiSXYxeVh0QnNnREV1NmJoN3pqVEF2dE9O?=
 =?utf-8?B?Ym9pcUFDdis3T0hrZ000YkFvQ1JQWkdRdUlvbzVxTzR5RjVwTmQvQ1NQUXpU?=
 =?utf-8?B?WTJOMnVIYmxSbHo1b0YyVWJncUNJMzBYUm5jazBjL1QzT0RmaGh0V1dlTG5N?=
 =?utf-8?B?VU9rcTVsQW9ieHp2ZGVBTG92aERISzUrMkh0Qk5lU1JpN3k3NTZJNU83emNo?=
 =?utf-8?B?OERNazE3L3NGUkhlZmhndkVsTGVhNjVIT0kxMGtPaWx3bCtaWWQvTGlOVElI?=
 =?utf-8?B?Tkp3UzRsMGNHWFBySURBK0M5bEN2RS9rY3JrbThOOGw2VFRMV2VXTGJDbWQ5?=
 =?utf-8?B?b3hkTk53OHA2amhMSDFuWmZXL1h0aEpxSE1jNFQ2cFhwTnh1WlY4SUsxd1ZG?=
 =?utf-8?B?bjdIYUgyUDRDdXdXNE02bEd0UDI5bTA2cUc1aW9pMG5INFhKdGR6QkY3RDRQ?=
 =?utf-8?B?WjZWZzkzZFdwRFNQS3JxelZJL2RsdHVIRVFTVmpSMG1GK3hnaFl4MGdGUkNE?=
 =?utf-8?B?NGFFQTFtYjNuZi9seGQ1ZnJkSHhmcVFoNVEzd1QvbVBQRjFCbzg5cEpreHZZ?=
 =?utf-8?B?Y1VXRDZWamFmVldmUEJXU0lKSmFRRUIwRm41ZlM0V283aGhPaDFjVWdIV1hL?=
 =?utf-8?B?Q1VhaTZiZUNrZlZIU2lxWDI0UEdpRXZWaVJwa3Ztc214RGtqbTlYUEN6U0tx?=
 =?utf-8?B?d3QrN2RyUzVtYlE2N0hRT2lhc2NYUU5zaWl5MmVUYjF0b0ZreFJ2VGxmZ29N?=
 =?utf-8?B?QWVOUVZxZnVTcEVKSGxvMWVkWk5xMy9NRnliTHRkR2ROT0EvUHJOeWVONlJV?=
 =?utf-8?B?MEtTOVlRWFkwQUE1TlgydXVxMkFmQmIzaXZOTEdLcjVSeGo4V0VuRSt6cmJB?=
 =?utf-8?B?dDdBZ3dpUFpyYm1yVTVDaG9wY2sreEdkcEo3MktEalc0b1JRQ3VOdm9OTk1O?=
 =?utf-8?B?V0libFhxS2tNNWswMyttN2xHNzQzb1RmZ09jVnI2emlVaW5xM3p1cHZFTW93?=
 =?utf-8?B?c2hEeGhVWkFCdkxkMHNIdGc5eXBpRU45MmF6UVcrK0xPeFB5S2xYSGRQeWs4?=
 =?utf-8?B?YytmZS9jZFR6RnRtc3NpemE1L3RXS3lxTWNnYUlFSmdMZ09QejBSRVZSbzJw?=
 =?utf-8?B?cVFJR3BXckpUbjlmMmpab1IwYzdmdWMveTFWMDJCUFlHendnWWgzc0dTRi9o?=
 =?utf-8?B?UXVkc01GZEtaenRnYjZjTC95K0xXQTNoNXdHVXpRNFJSdXBJQlNWQ3pBbTdk?=
 =?utf-8?B?OGtZY0M3dGN0NU1MQkliV25mS1p4YUpVRis5LzZJS2U5aUtNUnNJOFRaZzdx?=
 =?utf-8?B?T1UvN2w3NzhoWkMySklUQy8vcEEzYjBuTWZQb1Q5dWhENlZaMkNDRlpvWjlT?=
 =?utf-8?B?VVBWNEJwZWNaRG9mY0o3ZEY3TjVEUEVWNGRFdVRHTDltWC9MbGo2Z2srMWdp?=
 =?utf-8?B?VVB3NXQwZFFQT29ZRnVtaS8wOXVNWUNRQ3lHdnhhSWVYeTBDN0RWVTJFTHQw?=
 =?utf-8?B?dXRSQitWTGpaRjk4clBPWHMyTGo5VlhDU1QrYUFQeHd6YW85NndYWTA0QXB2?=
 =?utf-8?B?V0FJbnZvRTF5TFE0VlRrRDhOVm1mK1pxaU9Qalg3WGFxUGtwaWhOOVloRWhs?=
 =?utf-8?B?Qzlzc0pjOCt3aDBKUU9reXBiT3dwTW90eG1KNnplK3MyTW8rczdCc2tiTDE0?=
 =?utf-8?B?bGgxMmw2RVZ0SUozclFsS3ZQRFU0cFVSZTZTcURhZ1NFSGJhNktUaTh5RXp5?=
 =?utf-8?Q?oG1glaUVWrp4V/PL5VhREviAF81EtM+C?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2FYZ1Exdk9weStuemNhWkhzdStaWElhRTc2TXViTk55N0tGOVRwcDV4RVBw?=
 =?utf-8?B?NUphaUV0bWU3dDJKb1NhZVorek4wZHVXRjZYMk54c3JNUXgzTmptRFgvYjYr?=
 =?utf-8?B?RTlkc1RYeUxoUkxtakw2dEZTODUyZWJBQzFFTFlzMzZsQXRvcnNyMDJGcjhZ?=
 =?utf-8?B?alJUNlhXdnlDdFNBbkpWcmRrbEJSQjBqVUx4WkVDcTZWUWRmRk9IT2hVc05w?=
 =?utf-8?B?Z1JsajhueHNad2JRaWhHdlpjVkhpWXFYVlhJOVBBVSs1Y1Q2bDRjQmR3SHI2?=
 =?utf-8?B?RlA1bXBMN0xVVUdnSzg4TzNDSkVIV202TG14RlNxNGgvYkVYdnNUT2pJbzVJ?=
 =?utf-8?B?UVhiNmVHeHJMdXhXUng5a2VmeFVaSEtaSFhDMGYrME9pcVFMNW5hUURIYk1I?=
 =?utf-8?B?QzFVa291Zm4wcjFMVGcyOXlCUFcxcnVBS1FyQUVaVDZnT0FUbTdzNW9Eem9Y?=
 =?utf-8?B?RFRKRjlTMG5NVkJ1cmV5Y0U0dWkzK0N2NE5UNzJ0Y25uWVBTZlEycHN4elZE?=
 =?utf-8?B?K2ZyNm4wOXlQOE92QWpYS3BySVRsamxac3ZNeFU0TlBGYXV2ZFVBNjdGcFBV?=
 =?utf-8?B?SysyeVVWa0N1bFoxbTRab0JkSFU2dDBsbUpUc2xNS2llZWN4UXBRSWttT05K?=
 =?utf-8?B?dGlsNFJqOSt4TVh2RWtvRlF2cDJ4MFFBcWFrYy9ETGVGN1Y3Q3Q5R3dCMmZn?=
 =?utf-8?B?a1BudWRvYlVTbGF5cFNpeTFONENtQWQ4OUo2akR4MlVmaWhXWDROUlJIeDFh?=
 =?utf-8?B?N1NFNGQvaXNjZU91OWpzemVEUkVoQ0xqMFpRYlRjdDNOOWZlWG1COGVqVkMv?=
 =?utf-8?B?T0lJQ252dUYrRjNsbHA5ODNHdk9iQmRqcEFuN28vWW5OcnRKcTZJWHAzNHZw?=
 =?utf-8?B?M1JXdDhpaTB2SW9YT0RKWlhTdHY2Kzh6eHJpWUhwZ0l3Z2lBZ1pvTWx3TU1H?=
 =?utf-8?B?L0FqUDBSZS9wdjAvRElCN29wYlNuNnhCVjlQNFFuVE0zcEZEWXdHQ2lTdnlr?=
 =?utf-8?B?WENsYUR5ajFCbGRVc243MDFhWlZWaTNodEJqdXk1SXY5anJHMzAxNGhxam5W?=
 =?utf-8?B?bWNRTmpvaDNEbUIyNGpNUjJObEdTTmlUaWl1MXJzbFI0Wm9KWkkxL2RvcnJW?=
 =?utf-8?B?OElOanJONE5tM1VDK3dQSzl0SE1kTVo4Q1RtOXd2Vmg2TWVTcWxPaTYvU1My?=
 =?utf-8?B?b1BZdUV3NHNJSDVienNwNzJBOWJ2NHhFZkYvRXNWTGZFL3R3UFZpd0tnUTFt?=
 =?utf-8?B?NGxFYTFZZEh2QkViOUpHRWRkZGNaSDFhNVFkdWMza3FWVS9uQi9yNXM1TmJr?=
 =?utf-8?B?TVpHTVZQZUw1dzBHbytrTXUvK0FMTXpWZng4bTA5WU5TcXlOT3lmVkFiRDhW?=
 =?utf-8?B?M3FzSnpwY2QrTERiL29vMS9iQmY5NmViaURmbFpHbkZYclVEWFpGUGV2YTJR?=
 =?utf-8?B?QTVPazZaSzdBd0Q5ZldzNDlMU2lyc1A3RkZhd0VMbExXRTNzU29GdUc2VEJG?=
 =?utf-8?B?ZzFrY3FlYzFRT1JoZHM1TmJTVUR6WEJ1aGdxYTErWFZ5dTZveVJmWnpwd1Vn?=
 =?utf-8?B?Rnl3R3NFQWVPbExwb0RrbXkwQ0dpdlFTaTR4VjU3VStEYjZ1VFRyRWFQTVg0?=
 =?utf-8?B?WVZrUDQ3ZzRsTkRWZ3l5NUc0NDJlM3p2eFgrQWFFOXk2R3VQbmJPTTl5QWs1?=
 =?utf-8?B?Tm5sZm9tbzdqT1VGUEZvWHVld0lvckFyaGJqWFlxZlZJc0lZYTZJYjZBUHNH?=
 =?utf-8?B?RFVpZURFS2Z3VXQxbCtnNllVN0F3ZXdNbDhLcTdNOFloc0R4OWtvOXMyRWx3?=
 =?utf-8?B?SUI3VTI3ZlI0d0wvVTUweGlzdXFxNzFXMDRZdlZnSGpDdjYwdDdOdGFXdWk0?=
 =?utf-8?B?TEw0L1E5UVpJU2JFT2J2b1EvZ2VybXM0Q0tIaTVQSVNwU2lkdTBzOG9NZEZE?=
 =?utf-8?B?Qi9aVVF5UHBYWlJnUE9wWW5ZZTJwUkNQaGFkRWJIOFJjZXpVRzRGUWZCRkFG?=
 =?utf-8?B?Mk1IVDZyZHJPZHBKRjZKWllQOHZWakYxdDZNRlRlVTdLSUdEL0NBK01QbFdw?=
 =?utf-8?B?VmJCZ3JpSTgyQzZzb2FGbkRDOE5aYXlVaTVOaWs2Y2M3bXFvM0FNZDUxMFFl?=
 =?utf-8?B?MXozNldkaElUV05YOXJqZ0ZvaHFaY0V3VVRBcW1LREYrcGF1bzhPK09GdkUx?=
 =?utf-8?B?R1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ae1ddf-a02f-4df2-2179-08dd2f166249
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 12:25:34.1092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OAzUrDmbMrAYfxoUMT03QsBRGySGlwhW5MXukP2/uN5MbiZ7+c/vFgHCSZBJ1Q8bwJ5/FfgltT2QcF6T3x1/yvr12bQLbhAGQ3gYWQ3yk6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8743

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMDcgSmFu
dWFyeSAyMDI1IDExOjQ2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNC82XSBjbGs6IHJlbmVz
YXM6IHJ6djJoOiBTd2l0Y2ggTVNUT1AgY29uZmlndXJhdGlvbiB0byBwZXItYml0IGJhc2lzDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBKYW4gNywgMjAyNSBhdCAxMToyNOKAr0FNIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBQ
cmFiaGFrYXIsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4gPg0KPiA+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFByYWJoYWthciA8cHJhYmhha2Fy
LmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiBTZW50OiAwMiBKYW51YXJ5IDIwMjUgMTg6MTkNCj4g
PiA+IFN1YmplY3Q6IFtQQVRDSCB2MyA0LzZdIGNsazogcmVuZXNhczogcnp2Mmg6IFN3aXRjaCBN
U1RPUA0KPiA+ID4gY29uZmlndXJhdGlvbiB0byBwZXItYml0IGJhc2lzDQo+ID4gPg0KPiA+ID4g
RnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPg0KPiA+ID4NCj4gPiA+IFN3aXRjaCBNU1RPUCBoYW5kbGluZyBmcm9tIGdyb3VwLWJhc2Vk
IHRvIHBlci1iaXQgY29uZmlndXJhdGlvbiB0bw0KPiA+ID4gYWRkcmVzcyBpc3N1ZXMgd2l0aCBz
aGFyZWQgZGVwZW5kZW5jaWVzIGJldHdlZW4gbW9kdWxlIGNsb2Nrcy4gSW4NCj4gPiA+IHRoZSBj
dXJyZW50IGdyb3VwLWJhc2VkIGNvbmZpZ3VyYXRpb24sIG11bHRpcGxlIG1vZHVsZSBjbG9ja3Mg
bWF5DQo+ID4gPiByZWx5IG9uIGEgc2luZ2xlIE1TVE9QIGJpdC4gV2hlbiBib3RoIGNsb2NrcyBh
cmUgdHVybmVkIE9OIGFuZCBvbmUNCj4gPiA+IGlzIHN1YnNlcXVlbnRseSB0dXJuZWQgT0ZGLCB0
aGUgc2hhcmVkIE1TVE9QIGJpdCB3aWxsIHN0aWxsIGJlIHNldCwgd2hpY2ggaXMgaW5jb3JyZWN0
IHNpbmNlIHRoZQ0KPiBvdGhlciBkZXBlbmRlbnQgbW9kdWxlIGNsb2NrIHJlbWFpbnMgT04uDQo+
ID4NCj4gPiBJIGd1ZXNzIHRoaXMgc3RhdGVtZW50IGlzIGluY29ycmVjdC4gU3RpbGwgaW4gZ3Jv
dXAtYmFzZWQsIG1zdG9wIGJpdCBpcyBjb250cm9sbGVkIGJ5IHVzYWdlDQo+IGNvdW50KHJlZl9j
bnQpLg0KPiA+DQo+IEl0IGlzIHZhbGlkLCBjb25zaWRlciBhbiBleGFtcGxlIHNheSBJUC1BIHJl
dWlxcmVzIE1TVE9QIGJpdHMgOCB8IDkgfA0KPiAxMCBhbmQgY29uc2lkZXIgSVAtQiByZXF1aXJl
cyBNU1RPUCBiaXRzIDEwIHwgMTEgfCAxMiAob2YgdGhlIHNhbWUgTVNUT1AgcmVnaXN0ZXIgc2F5
IE1TVE9QMSkuIE5vdw0KPiB0aGlzIHdpbGwgYmUgc2VwZXJhdGUgZ3JvdXBzIGhhdmluZyBzZXBh
cmF0ZSBjb3VudChyZWZfY250KS4gU2F5IHlvdSB0dXJuIE9OIElQLUEgbW9kdWxlIGNsb2NrIGFu
ZA0KPiBjb3JyZXNwb25kaW5nbHkgY2xlYXIgdGhlIE1TVE9QIGJpdHMgYW5kIHNpbWlsYXJseSBu
b3cgbGV0cyB0dXJuIE9OIG1vZHVsZSBjbG9ja3MgZm9yIElQLUIgYW5kIGNsZWFyDQo+IHRoZSBN
U1RPUCBiaXRzLiBOb3cgbGV0J3Mgc2F5IHlvdSB3YW50IHRvIHR1cm4gT0ZGIElQLUEgc28geW91
IHR1cm4gT0ZGIG1vZHVsZSBjbG9jayBhbmQgc2V0IHRoZSBNU1RPUA0KPiBiaXRzIDggfCA5IHwg
MTAuIEluIHRoaXMgY2FzZSB5b3Ugd2lsbCBub3cgc2VlIGlzc3VlcyB3aXRoIElQLUIgYXMgTVNU
T1AgQklUKDEwKSBoYXMgYmVlbiBzZXQgd2hlbiB3ZQ0KPiB0dXJuZWQgT0ZGIElQLUEgYmxvY2su
ICBUaGlzIGNhc2UgaXMgaGFuZGxlZCBieSBzd2l0Y2hpbmcgcmVmY291bnQgb24gcGVyIG1zdG9w
IGJpdCBieSB0aGlzIHBhdGNoLg0KDQpJIGFncmVlLCBEbyB3ZSBoYXZlIHN1Y2ggdXNlIGNhc2U/
IA0KDQpDb25zaWRlciBhbm90aGVyIHVzZSBjYXNlLCBpbmRleCAwLCBiaXQgOHwgaW5kZXggMCwg
Yml0OXwgaW5kZXgwLCBiaXQxMCBhbmQgaW5kZXggMCwgYml0OCB8IGluZGV4MSwgYml0IDAgfCBp
bmRleDEgMTAgaXMgYWRkcmVzc2VkIGluIGN1cnJlbnQgcGF0Y2ggc2VyaWVzPw0KDQpDaGVlcnMs
DQpCaWp1DQo=

