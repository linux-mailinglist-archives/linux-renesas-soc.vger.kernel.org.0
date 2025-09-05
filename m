Return-Path: <linux-renesas-soc+bounces-21465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F26B45547
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 12:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 153F75C27BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 10:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4AE31771B;
	Fri,  5 Sep 2025 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="N4xly6j6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D01E3164B6;
	Fri,  5 Sep 2025 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069240; cv=fail; b=BWIo2ill4bZ5Wh6ssSHTqZ0KQo7CCX70v0g3SaErypDUU6DeSKxKL05kbPiNQ51GOSrT5pqSos4pdioq9XNbjI4AMmqs+fos9pA96FZ6J6Mzut2/jjFyxcyBAIje1beZR2jpufj3+xt0AxhM2XONLyVSGkfAA78B/sOsFxfDKcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069240; c=relaxed/simple;
	bh=vFdev62pwnd2j5Dkc74xV2XIuTGXbp2x1l46WNhLFMI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aAXklnP2yI7jk/6apS3CAZuveYt66VRK6yyCvE0KZv8ZCtxtI3ouvZP2RhdfmtNqE9qfnWEoUMZU/6y2Q/0BSBfDIHeWZ7J1j9VTGp0n9oG+bt+X9MxQ74eOVV+tjck7z8MWVpsTD9kJhcU3K5e6mTqC9dfd0geeNWCT5iMkw1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=N4xly6j6; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krhGh7hMCsjdbr0vawYXoSMa1My4HzQTy6LmeKL51N4XpmBAVyFbaDpeO7mvtff/Epl7+rAdjdj5iayuelHmmZPMMPb1CrYq/0SKcHZ0igSNRgZLcK+8LBSJEK8fxP2rZtBL5RQMZH24gVwHIrvBvkU4x9AxNjjp4fT4P6gMlzcGs5ZYYDRdDnN7eIvogi6LR+fbPXfvTL5fR13UrEVhgBSNXzsA6vYivtUQQJZC7g63roXTIyGq9qRfFYR7ga2b6YwQHjkkoQrnUtuktRNYLrlc3UIwPWDzGGFB9JywZ/bwl6SFkpvXddUhCyJK40navFrhjX0cX8DXmcmNYrHWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFdev62pwnd2j5Dkc74xV2XIuTGXbp2x1l46WNhLFMI=;
 b=VVL0VfJqSyxoQ55lYbvDohf8T8cowZUFuxRFR+zzT2H/zsOpcca1hirLSZ7d3G1NjL2TWDUyp5QVDs6I3UCxGFGYsD95NYrKhab96bs6p4JNZztoS4chLKndKfX/JK+ELzp1LhhXz9zXgqEtxGp2IWndf5bpY0FzBGznmzoM6D3jQnrhZv9Z0hYxIgs3xyS5W1xfipCYSPtbxsN6EU06NMGnBeivKnCXEdnKliIgwv2YpaNSBq9hPTWnsY/4rdELGtduc9QoyYnXZfpvoKU36sBtTSFHPT9EyjTg0dFwcH08zE3qqNNwuVTk/O4VJXQ8wsEsGdI2K/SybsBmjc23/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFdev62pwnd2j5Dkc74xV2XIuTGXbp2x1l46WNhLFMI=;
 b=N4xly6j62wwyPVSwLWotPgtlTtMDp+kI5HvWFDRSVe14SaraJLbWU81KoMvwrp4pp4GCotkpLmc9iiC80Qx6MBnyOjXekgY4+xjjgGcqwyPhwGJRE57Lgw9/8b3ru1Duyiit7zejK3gSGTkMFMP8RCDPCzo+BTbqTIf/MW1xud0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB13825.jpnprd01.prod.outlook.com (2603:1096:405:201::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 10:47:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 10:47:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Brian Masney <bmasney@redhat.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: RE: Bouncing email for Renesas Versaclock 7 Clock Driver maintainer
Thread-Topic: Bouncing email for Renesas Versaclock 7 Clock Driver maintainer
Thread-Index: AQHcGNeXzc7dwtSsbUW4pbtbuZkmALSEcfjQ
Date: Fri, 5 Sep 2025 10:47:13 +0000
Message-ID:
 <TY3PR01MB11346087E08ABF1CEC9691D348603A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <CABx5tqJ0+1bjoMM4qPS94coa0wyQaae1gJP14pUKk+xVgD5kaQ@mail.gmail.com>
In-Reply-To:
 <CABx5tqJ0+1bjoMM4qPS94coa0wyQaae1gJP14pUKk+xVgD5kaQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB13825:EE_
x-ms-office365-filtering-correlation-id: 4cabedf4-91e4-45e8-36e6-08ddec6992d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OEliaGxYUnMrN3kwbUdqLzVLVDFWWlVWYlc0UkxwRkdia1A5bzhZTFIxc29H?=
 =?utf-8?B?ZW5jRnhjTWNkQzd3RjNLNkdYaXdTNkMwTVJRMEdvdzFRazIzaktmNHgrVjJP?=
 =?utf-8?B?aVpXRW1HZTdxL1VUYVN0a0VJSko3NEwzeXNEN3ZEd1Y0WTlzK1ZLYUJoN01T?=
 =?utf-8?B?TDRlV3NvY25XQU8rNWZFRTFqbFp0Q0xsQURMdndISjY2bzR3TDlzUUJjbSs0?=
 =?utf-8?B?SnlEOXViR2p5VDRadEIybENWYW10VFE3TnlJMVQyZkllcDF6TEVSLzAxL2FR?=
 =?utf-8?B?WG9pc1E0NTBJdTlCUHRWYWZUdnhDZ094VUlPQm4xOXkxejhMTzQ2clBQV1Nj?=
 =?utf-8?B?N1YzVVVUUHVOSUNYcFkxU04rejk2Z05jRm54dXI0L3Rtc2JlSE4wZjNyY3c0?=
 =?utf-8?B?aCt2Q0pRMldVajRpZXVLSWtDekJ3WkY4VTFNeDVTVzFKeXUwVk5WcXNNWFVV?=
 =?utf-8?B?K25rOGhMWDYxR1E0TFVSOEExQ2dmRG56TGUveklCTFJFVkE0Q2RRNVpvNGp4?=
 =?utf-8?B?ZDZ3MnBPaGlUZVJEOERGQ3JZc3JRS2RaK3diSWJ2M2xTVHkzbjJmcDlSV0Zp?=
 =?utf-8?B?VFhvZ0VVRWRUczZQTWxzMVNJK3RaVWV6ak5ielNxNzY3QU82MjRlK3E5dlZS?=
 =?utf-8?B?dGl2MXlmcWlwdFJ1eFdNajVhcDV4T3BIYjRMRnVPc0s1cEkzaHpnTmhQdERs?=
 =?utf-8?B?eEx6akZOSGZFT25DSGx4TWlWd2F5RlFtVjI2Tm9lNGlrMk5pVkQvVWhRcHBn?=
 =?utf-8?B?S1c4VnVjQ29rZ3RtN1VNSUVJUWFCQWd3TEt1dnRLRVM1akpYZm1ZT0l2Sklv?=
 =?utf-8?B?VHAvRkdwNHVvUC9vYzhzZUkyQ3N6RDhLMXZEdWN1ZFQrSFVSc1VERW9BM0xz?=
 =?utf-8?B?Y0VpTTBhV2UzYlhJTUNDNENQUm9XZmdjMHg4WUdtaG1pdnNQemp0NUJwUGVv?=
 =?utf-8?B?czQwODdWQ3BsRGpyeWZ6SXBEME96b2JsYUVBenVBcFYybE0zMHdsYThoWjFO?=
 =?utf-8?B?TGFZQ3dqY2F3dDlJbDU5N1dlbUFYKzZud0tqWW81QWdFNDd2cmpQNytFY1Fw?=
 =?utf-8?B?S1d3a2ZSL3hQQitpaDhVUmVUc2lEZzcwbXlBdlFoYXBaTit3Y3ZUK2NZdThV?=
 =?utf-8?B?U1M2YXFsbjJaRUw5NmkrMk5BeW50OGVsWmxjUENjUzU0cjFkQ3FDamxTRjR3?=
 =?utf-8?B?eE9SNHNnSERNcTJjS0laN1NCeTVWbVlBc1FKY1d5SlVWQjU2NW9xeHV0Qks5?=
 =?utf-8?B?enU3akN4UnQ5a2owUFJLalNsZ2g1bXRqUnc1Wk9FRENoSEs1dHZ6ZFR0T3h3?=
 =?utf-8?B?Mnl1cGVaSkdiUWQ4TXcwUUs5RVduaDhNNTMvUTJIZ20xVEpBMWpjRE1rWHRm?=
 =?utf-8?B?QlZpaytHak4yQ2t3OUtmUzRMeUxkQTNUVDlVelhEMCtHUEZXUTlJS0J2Y2J6?=
 =?utf-8?B?Q2FzeGRZYUJpbklMUnRhVDBZTjRRcGZZajgxekd5ZnAzMXRweHNvbUlmN2hh?=
 =?utf-8?B?dkRCT2F2RlVJKzR6cHYvRjZDdG96dStaWkQzcTlRRCtJZkY2NGhaSmRSRW9v?=
 =?utf-8?B?d3BTTVRiUGJYdXA5bE9yOE9vOHV3aW1mMGNqcFhkTUI4WFJtdWdHOUk3S3FG?=
 =?utf-8?B?WWlqWmcybEl1Nit0Y2dwdVZ4K3hOd1J4Z3d1MkdoWGltZWVLcWhkdDVDSzBT?=
 =?utf-8?B?RDYzQnNXak8xa3pLQzJiTnkydlFRQmx0L3pTaXJoNjgxdGtBOCtLWkVDaFBx?=
 =?utf-8?B?V1Z1SDZGVW42WnMxUEFxb2xiSFUyU3pZcy9qMmNqZ0c4Y0s0TGtUbjB1RmQ1?=
 =?utf-8?B?SjdOcnd2TUVWZWs0RU5NTHQySlFuZzR2MThFT1dhd0dHTkI5TXloby9UWm5H?=
 =?utf-8?B?TlJFb0k1VUNvNTVrVlVQdE9OOC9LSnF3NU1oZHczUUxVQWh1OFppQUtoeWhX?=
 =?utf-8?B?aTNRY0MxSVlzWnZYakFlbHgxenJwOUhDK055NUVqNndyY0dFU2RmS0NWU1l0?=
 =?utf-8?B?akN3K0RheExnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjdXa3AzdnAxbHExMzFzU0xIZDAvWkRkM043aXVCbitkb2czYmNYd2NZaURS?=
 =?utf-8?B?TjhLN2lEWVBIMUlPdEw1SzVTS0tJck1RZ3BSY3pCbDhEYTAxWUdQU3BNRkcv?=
 =?utf-8?B?cDdFOFM2cnlKZVUzVjVpUS95K0FkWkNVWkM1RFdjTUtVNmRwTmptaVRxUnEx?=
 =?utf-8?B?QTU1TmZqOGFrZFZXM3g1aEV0QzNyQzlvOFA0RUcvc096blJyWXZpeDVVMUh1?=
 =?utf-8?B?SFhlbGxNMEpSamlhTDVmNUxxL0t4ZUFNekhTRlRpQkcxeHhoMWhuTzNzeDI0?=
 =?utf-8?B?K3lpM2NpdmVJRkxSeENGSmptVzJpOXlVSk4xUGZYNUFQNGZzZkt6SUpoVnhS?=
 =?utf-8?B?am9OL1RPZzlaOXVxbEQySjUwd3hMMEQzYUdyb2x2M3lZTkh3R0htRWVKVWtj?=
 =?utf-8?B?WlNVeEY4ODVSeWhQcG1WdE15c2xWYXdiZmhNOUluU0o2WEJEN2ZlRklBYVFB?=
 =?utf-8?B?LzJkNnVadExILy94N3piMjA1ZEYycXd1cW5yaDdyVFFHOGx0WmgrU0FrZXJ1?=
 =?utf-8?B?VjJwNHR2NGIvclh5RjZtUkZIWTdzeTBiTndkYjZsUFVUZ0pNdDYrYTg0ZWhB?=
 =?utf-8?B?c0JkR3k0Q3RPckR2cnlXTmlEL2lkRUpuOUNUNHR2VGhqV2tYMFBIUnl4STlN?=
 =?utf-8?B?dVZsUEdFV1VQQkpnK1BoaktUSVRSSGoydnl0V0Y2dDJNckdjenpYUXc2RTZM?=
 =?utf-8?B?d24xWldydlVFbVN3b25JakhLWlVjVnpCY2xoRUlkSjBZcmJRd0NtMFJudUs2?=
 =?utf-8?B?Y2x1amRzcmpBN2lQZzhtWjQvbmlkVDM4NXdRc0lLVHVvTm85aCtodWtDSW1p?=
 =?utf-8?B?b29vM1IyV3d3NjNTcDZLMjhPak0wbVh2cDZINS9qSzJOZnBFYTFxVEJRaFJY?=
 =?utf-8?B?L1hyZmFoT0tRalFob1dKSFV0Y2VleVY0ZGNGQUlmbml3RVc3SzZSRjltUC81?=
 =?utf-8?B?dW4xMVdHMU9SNHFxVXp1TVdLSmZPekFWaEQvMHpQL1dKdVVTMHpMU0hQeUNp?=
 =?utf-8?B?NXkvc1VNWE5yWFdNUFNKTFV1MXNhaFU0Z3d2bGJaV2FMT1Y2cXIwZCtRZzNz?=
 =?utf-8?B?S0FCWWpRSGs1c0s4MmZ0QzZBaFppOVc3RTk1UXBXbmJHdE5SVGY3cmtoN3Fl?=
 =?utf-8?B?NnpUc2xwc0NwdUZHSlhseGRNV25aNUQ1VkJSZ1loWDlicmtObDNjSnlTQ2xD?=
 =?utf-8?B?VGxCYUxhWHVQRTdFK1Rab0NHV0dBU3NZVU9TMmk1KytpdU0yZEZvV28yL0ZH?=
 =?utf-8?B?Wkg3OG9QVTZ3UmZ2VkhSNjV2c1hDUElsbVVTRHlnLzF1dVk5RlY2T1dhaHUy?=
 =?utf-8?B?ODdNWmhha3pKa1NEdHB0TWxSVExqbGZHVE56RE1xQXpTODlsL08yZ2NPWU9m?=
 =?utf-8?B?QnRGOGdGU1hKOXRRNGUvTzJXOWFFdHdHdk1RVjlrZUNNR1NlbHNTZWFEODRv?=
 =?utf-8?B?QThGMDVZRW4rcGRVUU9oa1YwZ0RsRExCdTZRN3JteFJaRVhyajRqVTg4c3pz?=
 =?utf-8?B?cnpJUnpnSXlGZUxYNitHNkRpcEZzV2M3b242d05adkxrSjJTRjRUMEtWSHNj?=
 =?utf-8?B?d3lYUERLVHM1VGI0N0kybHRjUW15NFJVV014VXdKbjVhYmZOaEwxbVIrVGNV?=
 =?utf-8?B?UmVSWWxNVFZNTFYyYUg3ZjJDa0VXWDVJU1huT0ZhL1FTY0pXQkJidW1MN2t1?=
 =?utf-8?B?RnVna0hITkpwU0N3a2xua1lXVmZRQ2N4OUdDeHMwTUpSckhaYSttSVFYZ1cw?=
 =?utf-8?B?TTlHQ0lMUHFVZXg4SzVESVh6dFZTQytnZFZQWnl2a3k3WkVuY2lmNGF0UnhR?=
 =?utf-8?B?UzhzZ2NqSHEvU2lBbDVIeUVSaHBHd0hyMlk1ellobWp2cDhON1p0ak1zc0dl?=
 =?utf-8?B?VzZOSUJwL0w2aWY2UGlMZDBNZ1d0YXJkV0phUHV4R0doa3NFYkNzMGVLbDE0?=
 =?utf-8?B?SG1DVU5YMUg2S1E1TVFUbHQyUk5semI0aHlYc1AreU1Kc2hIOFdUN1RmczZW?=
 =?utf-8?B?Uy9hbURzb0tDZnFMSzBOd0lESXBqSzVCc0Z2QlhHZWRlMjg4cW5OQ0ordi9B?=
 =?utf-8?B?dTVnRHVPLytSZFY4aUNxT25iRkJ2VFNtaEhGV3ZJcXhnSUFEdVRJLzJCK2Rz?=
 =?utf-8?B?UEhQSVdxem1sa3FxdFVuODQwclA1bDdWZ0EyUzdPK0liQ1pyN2VlTmxHNHVn?=
 =?utf-8?B?OGc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cabedf4-91e4-45e8-36e6-08ddec6992d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 10:47:13.5169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3RlZVCKFVFt8BHgV52LO/+qJ4FB11GfrkKxVwLVLDT1tH7NVA/oEaDASuHzy1pZgOIqznHthQBZyAS/RVXPek0ZlDy2mwuT+9BrF8sBn/DE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13825

SGkgQnJpYW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJpYW4g
TWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+DQo+IFNlbnQ6IDI5IEF1Z3VzdCAyMDI1IDEyOjI1
DQo+IFN1YmplY3Q6IEJvdW5jaW5nIGVtYWlsIGZvciBSZW5lc2FzIFZlcnNhY2xvY2sgNyBDbG9j
ayBEcml2ZXIgbWFpbnRhaW5lcg0KPiANCj4gSGkgR2VlcnQsDQo+IA0KPiBUaGUgTUFJTlRBSU5F
UlMgZmlsZSBoYXMgdGhlIGZvbGxvd2luZyBlbnRyeSBhbmQgQWxleCdzIGVtYWlsIGFkZHJlc3Mg
Ym91bmNlcy4NCj4gDQo+IFJFTkVTQVMgVkVSU0FDTE9DSyA3IENMT0NLIERSSVZFUg0KPiBNOiAg
ICAgQWxleCBIZWxtcyA8YWxleGFuZGVyLmhlbG1zLmp5QHJlbmVzYXMuY29tPg0KPiBTOiAgICAg
TWFpbnRhaW5lZA0KPiBGOiAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Ns
b2NrL3JlbmVzYXMsdmVyc2FjbG9jazcueWFtbA0KPiBGOiAgICAgZHJpdmVycy9jbGsvY2xrLXZl
cnNhY2xvY2s3LmMNCj4gDQo+IFNob3VsZCB0aGlzIGRyaXZlciwgYWxvbmcgd2l0aCBjbGstdmVy
c2FjbG9jazMuYyBhbmQgY2xrLXZlcnNhY2xvY2s1LmMgYmUgbW92ZWQgdW5kZXIgdGhlDQo+IGRy
aXZlcnMvY2xrL3JlbmVzYXMvIGRpcmVjdG9yeT8NCj4gDQo+IElmIG5vdCwgaXMgdGhlcmUgYW55
b25lIGVsc2UgZnJvbSBSZW5lc2FzIHRoYXQgc2hvdWxkIGJlIGxpc3RlZCBhcyBhIG1haW50YWlu
ZXIgaW5zdGVhZD8NCg0KU2luY2UgSSBhbSBmYW1pbGlhciB3aXRoIFZlcnNhIGNsayBkZXZpY2Vz
IGFuZCBhdXRob3Igb2YgY2xrLXZlcnNhY2xvY2szLmMuDQpJIGFtIGhhcHB5IHRvIGJlIG1haW50
YWluZXIgZm9yIHRoZSB2ZXJzYSBjbG9jayBkcml2ZXJzLg0KDQpJIHdpbGwgc2VuZCBhIHBhdGNo
IHRvIHVwZGF0ZSB0aGUgTUFJTlRBSU5FUlMgZW50cnkuDQoNCkNoZWVycywNCkJpanUNCg==

