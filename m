Return-Path: <linux-renesas-soc+bounces-15172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB67A7668A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B97C3A5756
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 13:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6C8211283;
	Mon, 31 Mar 2025 13:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Q7lR6G+u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8E91DF73C;
	Mon, 31 Mar 2025 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743426422; cv=fail; b=P02y7einBdzqyg8coZjqrqDbnJwNzZcB3VvayCe53/c4QhFxmM4ZBE6ZhOZEdG3fA5OuTapE3M4bkzRNDk2y19Nhi/SmtIvb5asBc4HUBck/mTGFM0LZxCJabS9teaHSWuMQhr2mmxMAmVX2GCO5t/wo+Wao+uPRtUjyKY4nr6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743426422; c=relaxed/simple;
	bh=ybO8lGwWA9pbYYVek9kSK6szsSiCS+4qCFNjiWr94Z8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cjchkz3KeX0PuERh59+NsCD4pyvcLbj21iGYoZfobSwpfDm+SpSXStFBokQDz2c3fVsO86cTsasDz7EYv9M37MehrOQ8DckNLiMfjOP3ZvlnPp8zTlBLPL0WmFM3BUZI8ceqCytmD7UrIiMDxkb9EPvhOroli2980e1Izpe1ynM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Q7lR6G+u; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyORb5Wk4Vt+PCFWpR2HF7M+iCCzSxVt7vriQCe6KE1iz6x73sbw3C3SZL9mn2qp1bUA8xGcjXhbi8sScCbO2PYk6M9sSfnpjDpQdUByUoXmhfpXWY90vFHvqxNbAi3eTmd8B1oJz4h4mBxQfJg0WeaKvK7XRU0cBGE+8SMirV4G2IW/MjVngoa/xCMq45V+h072PMFjmwv7IpzLWSPHDE4NIeRABBAGqFSkF1YI9aEHa6psrNY3Yt4wupTDCm1azDzwE1K2oi4thgl16oWyjEUP9LnP/grlCsTRu7qHST1ckyqAs5zfg8iZ04cdt2Z9vycvgWhZGYde5U+OSUrB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybO8lGwWA9pbYYVek9kSK6szsSiCS+4qCFNjiWr94Z8=;
 b=LAmS0m7bjb6FewYKqd0yWvgUPfBEWkzrEAvM88yEWpolz4sg7HmKxJ3yAQgk+rwRaHgXHU8ntW98FZfUDk14LV7/WIGRGJpwuietOTAlCG8PAlfc+TqI828eiiI2YHXWZS6xBwqiNSJrArittG3QJlcAlpzWpYz30uaoUzxBZ187wMh4K/5lmzeIzC7MqmwSa3jyvZMj9MA3u3WU0aePSzN9r7Eaa0H4PIsbpJu0lFLY0QPKQ9RT0NzBy16186ZodWymUi+UzGHiV7z/xrMbW4OkuO48WIlQBubUXWl9m6WgS/pXpPg2YFnPlaMpejPVVC8QwxANO74JTV5i0hscdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybO8lGwWA9pbYYVek9kSK6szsSiCS+4qCFNjiWr94Z8=;
 b=Q7lR6G+u/5oZS/DoRMn96b7hQj2WEfK5ozR+vU9Q2fJOwB5HE9ecsHvSPFGqhBsL20o5g39zh9RSitQ503CoXfc92bIa+YrzyZ/QFbbPDrcryZaTRBBtFONhF1xDvhnku2eIS9DByE2P3BIPjeJ7MqmSi6aBYXjBUng6j9sSgnM=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by OSCPR01MB14330.jpnprd01.prod.outlook.com (2603:1096:604:3a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.27; Mon, 31 Mar
 2025 13:06:56 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%3]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 13:06:55 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Paul
 Barker <paul.barker.ct@bp.renesas.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 12/13] arm64: dts: renesas: Add initial support for
 renesas RZ/T2H eval board
Thread-Topic: [PATCH v6 12/13] arm64: dts: renesas: Add initial support for
 renesas RZ/T2H eval board
Thread-Index: AQHbojhpqbVS6WAur0i0dLCBClHXnbONNV0AgAABIAA=
Date: Mon, 31 Mar 2025 13:06:55 +0000
Message-ID:
 <TYCPR01MB11492D79B80341F9E5E4A65098AAD2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
 <20250331122657.3390355-13-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVXw0GMJu2kY=9cri2+EdyAcNP8Qta1tOvCew-wC9W9VA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVXw0GMJu2kY=9cri2+EdyAcNP8Qta1tOvCew-wC9W9VA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|OSCPR01MB14330:EE_
x-ms-office365-filtering-correlation-id: db54ee8f-78d6-4798-7326-08dd7054e9c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dkZ3ckV0ZHgxR2dhWHJiQytnblN0QkJ2RzRYb0ZsTWV2d2h1V2xEMzhLV1NH?=
 =?utf-8?B?OXRMcVZmU2FJSFNvU2dEcEVKN0xSUzV2bUNPaUhjTXB6U3A1WDlQLzlpQi81?=
 =?utf-8?B?TkllVEUvMThTN2MySFFnMVZrTGdsbVpLdDV5NXBiVlRZSDhFcFU0TXJySFdP?=
 =?utf-8?B?My9MUExIY0lpMWdSaWZESk0wazc3Uk5tVXdRMndaWCtRMElMR1ludFU1ZDA2?=
 =?utf-8?B?aUhzc2NwaU5RWUh2SUs4b1VGRTB6K1FBLzVZUkE3TFNlSklEa2w0YUt6TXhD?=
 =?utf-8?B?YlpmUHVGVVBuVTUzSDhTYWlZamF4VzNEeEVUeFVUQ3ZtMkl0QlZFMG1HVkhy?=
 =?utf-8?B?cndTcjhoa3lGZzM5TlRKenhPMnZQOHNSOG1sSHhEMTEvWWpLeS9rNCtmT3l1?=
 =?utf-8?B?ZVRUYTJXeEFTYlc0Q0VWTVRCWHdqS0xwOWVqQTM1bWtVNHhaZ21kRFNoQ21k?=
 =?utf-8?B?TXFGWHZHSTVqNHBtVmZ2RVNjMksrR09Ubmg3R3EzT2N6WUhnRGY4OFVMREM0?=
 =?utf-8?B?ZXJWNzlVanRWSTFPSmtZaFhicnB5WTAyYnZDZ25pY0JRejBVSEticElRTGoz?=
 =?utf-8?B?cEtiSVN4REZyOWV3VzdtclkzSlV4Y2lwREl2NXQ4WTh5Um1KYUl4cm5MQ1d4?=
 =?utf-8?B?b09FbE9yVVF1TmFrelFsckkvNHZjSVBoQmtUamduQjRpdEcwQVhYUWVHT1Vl?=
 =?utf-8?B?cEVxd2J5dk9yb0hWcjY4NmZVOVRlRzFPQjRyVXpLZkc0b1F2dmxQYlZrb01E?=
 =?utf-8?B?cVBsWERaZi81YkZZV204aXpZSjRXZlMxL3Jnd1VPdW5TQXpqYmtybklwWTh2?=
 =?utf-8?B?bHVvSDdXNnNyMkVUbllPVzlVSDhwdXJoc1lCMzdsS0RKZkhKUGtRNUswbkNE?=
 =?utf-8?B?NjhjK0tVYXdpd3hlODVSVEw5WHFJK1h1ZjI1U1BDSEUrUEZEbzE5YUU1ZmNr?=
 =?utf-8?B?NkJCbWpMVUs5dnZHcDJIQlNZcXpLeGJob2xpMXdlYUZTSHl0RjZEOS82YmZr?=
 =?utf-8?B?VGMvYWs5dUVTUHpTUFl6cWxKOE05WkVDNTdGbDY4ZklMaG01Nzl5dEZudkFW?=
 =?utf-8?B?eDljOUNzd3RydWZDaVErZVdJZXhJdzk4SHZpaGJTdWNPT20zYjhEWENHZXJC?=
 =?utf-8?B?S2VoV3J2TUpXZmcydkt2TFFIN25uZm1RWHBKRGhIb3NndmVkVTFsVXQrYWha?=
 =?utf-8?B?VVFHMWkrM3JMR1NsejVvTmFlSFhnY3hDQThBZW9nWU5xU1NEMzhCQndLTHV2?=
 =?utf-8?B?WHd3VGZOUlVWWXdHVjNjQ200S2l2RTd2MzZQSG1haklxUHhJZjZub25tc2M3?=
 =?utf-8?B?NncvREJ0NUh3SmIxaEJEcnZSRGhkNDB0SGg0Vk82SmdUNUpQeDZXMUxoS2kr?=
 =?utf-8?B?WWdaRFZVZDBvL0hvczVQaWRmcGtUdUJLYW5vYU5WZHIwaEJjQVpBcEIrL3pz?=
 =?utf-8?B?NVFSR0I0V2I3Vmppaks2ZGdDcHJKdmduUkxNdjdiaWJ1RjUxU2U3TUt4SnZP?=
 =?utf-8?B?MGlWVXAvZStVcWtFdEZ4b1ZLK25tOFZ4aWZUSE1oQVhBZmU5K3dyNWR0dWNG?=
 =?utf-8?B?M0V5VHRuUXRHWm9FVGFMTXJTVlNPOXBjTWgxVE9wUGFlTktZSHkyVFhPUC9i?=
 =?utf-8?B?aDZCR2l0MnY3ZDZEZDhHZnF3VWU1akhnQ0ljSXJTN2FVQzBFVyt2eWZ5MER4?=
 =?utf-8?B?NEw4Q2lIUWhBTGpTMXJrUysrdXZmcDdaeWJwSXQvcVdTcTd6NmVBQjFadnRa?=
 =?utf-8?B?TkFoN0VIK3A0QkpBR3Q2b0NlZ1dsVjJ4ZVpGUTYrTDFEYk9rb3VaZ1dzdEsr?=
 =?utf-8?B?MDRrTEpQYXJkeHk5YmhYbFgyU2E4UVByRDJhbnZoeHJSK3NVMllnYm1HMStZ?=
 =?utf-8?B?aVlsdEQ4aXBwd29LaEY3UVdRZXc1UDhnZ0dHRGtDbSt3UUwwVEdUdGxsOG15?=
 =?utf-8?Q?dnnMkG5lGQCqxi5Xp1M/64JS45tg5iQi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Skl2QVNIODdVMW01OWVoUkgrU1VqNWhna1hGNy9NZ1FaWUIxSzhoK1JaODd4?=
 =?utf-8?B?Vy9wMkpXRUlpbndaYTFFMkhZbjFKcklUQjNuZlE2QncwTlIxeGprcUZTU3lw?=
 =?utf-8?B?SndxMjhHRzROUlRYVVJ0VjF0UFZaYkVKZ3pEclE4TTN1dlVaZ3F5czhnQ3Aw?=
 =?utf-8?B?cVp4SVo2cGc1STNRYkE0T3VmUTU5cDZUSS9ESWV0SjFXaFczNDcyY0gzR0d0?=
 =?utf-8?B?MzI0K2hOVlF4UXhvR0xjVFZEN2wzNU9mdHlCb1JvZWIyaklGclViTFZwY3hR?=
 =?utf-8?B?cER2ZG9PbTdlNG5CNC8wZ2gwWUdHNjVORGozYnZFdEVyQXlpQkVyUjV3SWI5?=
 =?utf-8?B?UWVFeExRdTk0aEl4MzZvcmFoeHVwYWxFa1psVG1YaktMTlY2cGlKSDZXUGF1?=
 =?utf-8?B?a3ZqVVpvLzdMdmw1OWpvdW9BbVA3RSs1N21sdEFIOVk3UWJUZEtHNjhGdlJ5?=
 =?utf-8?B?aThpWHZMSmRqN3J4a2lDam1iTnozeENkblV4N1BKTEVCOGd3bmtkdVo1bjUw?=
 =?utf-8?B?NE5lcTUzU1pHUUVOMlNydks0dndySllNbG1BMUlFU0JrSXJyeG5PV2F5eTdQ?=
 =?utf-8?B?aEJUU2xNT0MrbklHTTlmZ2dzZVQwYkVDZnNoWHF1aUd6dkdIQXh1STE0eUtJ?=
 =?utf-8?B?SjFFTDVQZk81VzY1ZjdOcGxUell2MjlHMTRHWnJab0lOUW42aktRUlR1Y01j?=
 =?utf-8?B?b1ljbVU2S3hoVll5Ym15aHgwb3U3UUJDZFlQRnZva3U3dFBkSDJnQit4d1o0?=
 =?utf-8?B?bTJTUTZ4cU1vTkFUdXhXQVhIbFZNZWJBcWFwb1FDSjNjTTE0OWJXTG9NVUtl?=
 =?utf-8?B?a1FOVHZRNlZBSyt6a0RsZklMQlFHTFNhVWhFWVBKdlJWZUZJdDhVblAvRWRl?=
 =?utf-8?B?akR6bzl2Y0I0OUpGVVpwbFVwQ0dURngxTVVkbGVoOS9ZSTZKMXNvcEZmTU02?=
 =?utf-8?B?MTNzbTdDSm5sUk1hZzliRis2WE93cm9EMlpHeWQ2NGdXekFITUhuWk5kTzds?=
 =?utf-8?B?TXVsTVN5bng2d0JFU0dqQ2Vad2tXWGFaSG9PMHBmNzFaYVpXZzVuMm5MeG9n?=
 =?utf-8?B?eS9JR1B1K2x3SDNOWmsrSGh5SHdNTUpqdXltL1lNcTExY0VLTzNDU01OanJl?=
 =?utf-8?B?aVVYRlZSbVZJREJ6c0NlOCs4MU43VUZkNXZUaEcyWEowbHk3VlRoWmwzRkp2?=
 =?utf-8?B?ODRqdDF5NnN4dERhem1SRjdTeGVOV0ZpVWI1RU5WYXRCL0paUjl6UGE3eXNl?=
 =?utf-8?B?TG0zcHFMLzIwcXh4WkphTmFBNTFKSWlPb3FQeXc2OHo0Uk83a3Bhb251UXVR?=
 =?utf-8?B?Z2VrTnJBME45L3BYMS95OXFRcTc3ZkhJRlRhYmtHRmNTSEFqYWw1bXMrNU4z?=
 =?utf-8?B?akxvQVdZQ3lHNjZTV1R4SE5QSzlacWg4SURyNFRqdjBRLzAyUEdVRGNtN2di?=
 =?utf-8?B?aUpSTTlXd092TzMrRGNaTkVDdlBVSmZDVEo4TUZSZnpEam16dmF1cVFvM0ww?=
 =?utf-8?B?alJGMnU5KzRMdXR5RHhjVUJaYm9TcjFXMGJxRm9QNFJBZVNENzdINE1rRkZU?=
 =?utf-8?B?K0tLcThXOTVFUVFDSVdTQ1hZREZ5amMrQk1JZFlZUjdHVExuckhMeTU0TXFx?=
 =?utf-8?B?MkgxMXBsR2MzUjVxck5xeExWdWpIOUlOUGphZzBtK2RrNVkvMno4N1NDY3VY?=
 =?utf-8?B?MHhQNE02Ull4MFV3NTc4VmpZY3F4VUJ6bVBzWncrR0NlRFh1Yzhldk9mWjFy?=
 =?utf-8?B?TlNENjMzSWx5b0VMenprN2Zsa2Evd2gxM2I4cjdjK25jREsrT1F0dFFVZVdl?=
 =?utf-8?B?RGowSVk3NnhkTkZjb2JYS2ZkK0hMYTBGSnYwY2FsZC80cnBnUzBtcW43R09V?=
 =?utf-8?B?WVNaSVRKbE4zVklneEE1YWUrZ3prRWdXRU5JWjlDSElXRWl0MGNmdGtZU2cz?=
 =?utf-8?B?ZUE1MXdoYyt5Y2cxUXA1RUZYME0yek1HbEFRMy9IVGpxci80UisxaDVXUW5m?=
 =?utf-8?B?aGNIRDFicDEzWUtYbzhJSjJ2aDk3YWx6WFh0eGFjdG4vZWZlNVhxYVV4NGhJ?=
 =?utf-8?B?UnFiZjBXWnErZDhGMEV6VW1uSTMxOFJJRXJ5N0IvbDhyMGt3eTFEN3pJNnpS?=
 =?utf-8?B?OWd5YWZoa2FZaXlUemlnS3BEbWtzNHNjVHRuMEZuNUphbHNacGJPNjdNVWlj?=
 =?utf-8?B?aWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: db54ee8f-78d6-4798-7326-08dd7054e9c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 13:06:55.7650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0quXiCNTfIGc1Gy/99WPsejxpF1xYroS91TrC0lLITyUB15u3+K6Q3GrNpCKbRNPcmogKHL4bLgWAzZ/jEG2Hp40CzNQuyOp6tbrmBi4ITRwEaVs6Tv2XErViBFvGYrs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14330

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogbHVuZGkgMzEgbWFycyAyMDI1IDE1
OjAxDQo+IFRvOiBUaGllcnJ5IEJ1bHRlbCA8dGhpZXJyeS5idWx0ZWwueWhAYnAucmVuZXNhcy5j
b20+DQo+IENjOiB0aGllcnJ5LmJ1bHRlbEBsaW5hdHNlYS5mcjsgbGludXgtcmVuZXNhcy1zb2NA
dmdlci5rZXJuZWwub3JnOyBQYXVsDQo+IEJhcmtlciA8cGF1bC5iYXJrZXIuY3RAYnAucmVuZXNh
cy5jb20+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAxMi8xM10gYXJtNjQ6IGR0czog
cmVuZXNhczogQWRkIGluaXRpYWwgc3VwcG9ydCBmb3INCj4gcmVuZXNhcyBSWi9UMkggZXZhbCBi
b2FyZA0KPiANCj4gSGkgVGhpZXJyeSwNCj4gDQpIaSBHZWVydCwNCg0KPiBPbiBNb24sIDMxIE1h
ciAyMDI1IGF0IDE0OjI4LCBUaGllcnJ5IEJ1bHRlbA0KPiA8dGhpZXJyeS5idWx0ZWwueWhAYnAu
cmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCB0aGUgaW5pdGlhbCBkZXZpY2UgdHJlZSBmb3Ig
dGhlIFJaL1QySCBldmFsdWF0aW9uIGJvYXJkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGhp
ZXJyeSBCdWx0ZWwgPHRoaWVycnkuYnVsdGVsLnloQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0K
PiA+IENoYW5nZXMgdjUtPnY2OiByZWJhc2VkIG9uIG5leHQtMjAyNTAzMzEgQ2hhbmdlcyB2NC0+
djU6IG5vbmUgQ2hhbmdlcw0KPiA+IHYzLT52NDogbm9uZQ0KPiANCj4gVGhhbmtzIGZvciB0aGUg
dXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9yZW5lc2FzL01ha2VmaWxl
DQo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmVuZXNhcy9NYWtlZmlsZQ0KPiA+IEBAIC0z
MCw0ICszMCw1IEBAIGR0Yi0kKENPTkZJR19BUkNIX1JFTkVTQVMpICs9IFwNCj4gPiAgICAgICAg
IHI4YTc3OTQtYWx0LmR0YiBcDQo+ID4gICAgICAgICByOGE3Nzk0LXNpbGsuZHRiIFwNCj4gPiAg
ICAgICAgIHI5YTA2ZzAzMi1yem4xZDQwMC1kYi5kdGIgXA0KPiA+ICsgICAgICAgcjlhMDlnMDc3
bTQ0LXJ6dDJoLWV2ay5kdGIgXA0KPiANCj4gV2hhdCBoYXBwZW5lZD8gV2h5IGhhcyB0aGlzIHN1
ZGRlbmx5IG1vdmVkIHRvIHRoZSAzMi1iaXQgQVJNIE1ha2VmaWxlPw0KDQpXZWxsIHByb2JhYmx5
IGJlY2F1c2UgSSBoYXZlbid0IHBheWVkIGVub3VnaCBhdHRlbnRpb24gd2hlbiByZWJhc2luZywN
CnNvcnJ5Lg0KDQo+IA0KPiA+ICAgICAgICAgc2g3M2EwLWt6bTlnLmR0Yg0KPiANCj4gR3J7b2V0
amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4g
LS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0K
PiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

