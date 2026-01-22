Return-Path: <linux-renesas-soc+bounces-27305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBJsOdhTcmnpfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 17:44:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4658E6A31D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 17:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84C9A305CB33
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4DE3F6FF0;
	Thu, 22 Jan 2026 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ALKRYiXP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCE43F7AFC;
	Thu, 22 Jan 2026 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098924; cv=fail; b=lM8dK6eDwTHifbN+yDM/lyO9hPKgmRpITSJQ6VN4f+/jIf8ohyeFIyhhptO3oSaA4SZbne+PR8+JywG3NTS/QiUSOk5YqMiFvntYuRPhHPZvaDCzA8QfNyJdr5mM1JsNW2lVjbcP3Y8NsWMV3mnnyuFuVORBnVhGBBScZs+ewhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098924; c=relaxed/simple;
	bh=QtKeNCzUQbKX5tDifuGLHZkHG7spP1diJJUmuLKTiBk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HJ+v7Kp6LyANFOxc8276HXiUkKXZ+iaOG5n2axPpWqHM/VUk0VLmwyKe4JsAHfVc63NhtHg1IJSrc+Cnp4GOVUqoxYrlneu5vy/j2qwaLrLvP/GF96vV7VP3DF6h8ZNl0M8lzKYyUhE4HURi0loBvegN06hvON1sai8pEBZTcrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ALKRYiXP; arc=fail smtp.client-ip=52.101.229.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhkoWmvFxh93ghnh04gSGNLuMaiDJoxZGTcmQK6Cmy/nFOpDR6CTmXpiN81x2pcmLs4R0FYUkOH6H/HIw1uRBqX8NZYFsm79e7wBcPEvZCTKZTQDiNs67OWkgJhpnaABRHOz4NXXHW6Szb1Kk68mPuc8FzhL6BnfOPp7vheeGDQPam9hvDxyQCcBgCqk/0AbQKdzA/HWuPxRfjDlTZfhA2yN/Nzliw2RoD3ANLTlpqSR+jlqurLeux0jlLwBezEO6knkFUmqDnc4lFXl39Vdk9clPhG+AogWRwqQKEbbmB+1MLVgzY+rANu9Av5EWI8catY0IkAdR48dZQtZih/SSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtKeNCzUQbKX5tDifuGLHZkHG7spP1diJJUmuLKTiBk=;
 b=hiZ7WWm2Ew1mvvP1DX9YHZN40N1jMcq9g9G/7IE9TUM/z81IqGN+1IqgqCIoCQt9w0xMSLIMqHL3+mxyCBoeipqUZQ9I4SEhU5FL/ONrsZk7MAMLLRX7Qx5CZXOQJi4hAzksnpAJ6OPXZZeH1FTou6zhncfnb8EXD642+OfFp+C2ck24+4YYZRHxu46vTUtvSxcKmZd+78Qhm1UOnRkQwEIoMUFN6k4dNMUO5MNRUwOKa2uwGgaPiZI/u8Cr3kpkfBHD2vOl+goXIvBo5s6k8mfIajVnft7pY18izzUuUbCvLpq3Vm3D5LdC8OE2Buyv5O1MdCVKHa1HdnL63wIaPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtKeNCzUQbKX5tDifuGLHZkHG7spP1diJJUmuLKTiBk=;
 b=ALKRYiXP/3j0K+1RZaL4wRLZOHF4WQ+gIa9UQgu9plXErQ6ttcP3iwCC0XSS29AjiUYlOmlrVNAurCQ+ebgtpZWjYwtxKi4Rrr0vTp/FN4gHR8Pm7KEXMk0zno56hozkbJMXKmWpvT5dlPgV1mBVHqPUqQ20oBtdfypoVD1HsuE=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS9PR01MB14090.jpnprd01.prod.outlook.com (2603:1096:604:366::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 16:21:37 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 16:21:33 +0000
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
Subject: RE: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for init_off
 clocks
Thread-Topic: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for init_off
 clocks
Thread-Index: AQHchWt8/8Xcc6HpdkiYg0CMgbNe6bVa6hMAgACLVYCAAvSbMA==
Date: Thu, 22 Jan 2026 16:21:33 +0000
Message-ID:
 <TY6PR01MB1737738E302D0BA716AAA2650FF97A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-4-john.madieu.xa@bp.renesas.com>
 <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
 <TY6PR01MB17377AE5807504FFB6594471AFF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY6PR01MB17377AE5807504FFB6594471AFF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS9PR01MB14090:EE_
x-ms-office365-filtering-correlation-id: 2fed43dd-1eab-4b9f-7b74-08de59d24ed9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V3E5SVVuSGxnMCszWlArU3V2R0RZbGplR0gvc1hURWNaRzBkSkJGa2dxVU4x?=
 =?utf-8?B?QW9Gc1dld3hOQVZkbmZhWDNWWGE3UlVkTmpKTHhNRHY1TU9MSWRnWVVHMUVW?=
 =?utf-8?B?anZqOTdiODBsUkNpQjZjcC9IaEF2Vmo3NnpoRU1WNStvc2c1SFdES0VPQmtS?=
 =?utf-8?B?MUI0eks1L25QSUgzS1pGa2szL2NwaFJkYkhQZW1ZUDBLV1JzcG5vTS9DQXhH?=
 =?utf-8?B?THo5MDdsU3A3clo5b05KL2NpR25KeTVxTXdqbGYzaTJoTnN6LytvQy84UDJS?=
 =?utf-8?B?amZMbldnK0E3Z0hLNHBZcUNHcGYvQmtnOW1Kcm04Ly9NMUl5Q3kzbVdIbjkx?=
 =?utf-8?B?V0dRTWNCaSt4MnBDZno5NmVwczBiVUhqMUdCTFRPUmQ4NVIwOGt5eXBpSVp5?=
 =?utf-8?B?MTd5YzVmSytyMnFXV1BnUTNuMWVxeXlWN3hhWUxabFlZVVdIdzMrWFVBZ05O?=
 =?utf-8?B?WTNYQ0VKcW5pTUcwQ0pzU2pESHJLVU5Sblp6dHQ0L2NTRVZzT1V4L0tKZ01w?=
 =?utf-8?B?WEhaMElRQlJ1dGVWUzkxZG1raDZuaCs4VzhPNlNiVE1YREVGek83K0ZCN0E0?=
 =?utf-8?B?d1NEZjdSbWhDMXUvb0I4NG93OGFtTXVtZ3h6a1AyanlEZHlaRU1JV3FpUWhU?=
 =?utf-8?B?TjJSU2ljU3IxMXcvTzVPVmVRU2x2b0ZDQ0tXUXUrd0Z6a3Jta3RLWHdJQzVU?=
 =?utf-8?B?dTJHaG1USUNickdjcGQ1SkVhczZiNHVOKzFlbHB4aWZYeS9lVFBrZDFFNkJy?=
 =?utf-8?B?SVVUb24rOUpTMTVJMnU0MXpQdUhmNEJwcTVhSXJDVnR3ek9wbFBGK3hXampV?=
 =?utf-8?B?eHc5TklPTmVQTUZYYlJ1b1pudTc1M2JaaTVBbzYzM0tOR1ZWL3ZzcGNVZEsy?=
 =?utf-8?B?WmNQQW56WndQbTF1WEUyY29jQ3cva1ZvbkhoSVRENFBTMFJxQnNYSzNpbHA3?=
 =?utf-8?B?NFVZZHlKTW1CWGI5bWNSQkpTa0drN21ZNkxaZUhoYk5sc21CcGhCU2gzZXNx?=
 =?utf-8?B?emZJWTlSVUM0YW0zZTNNNVRVZkNhMTRSb3NCQk1KWlJyVzE1dVVmSUdJQ3A2?=
 =?utf-8?B?SWpZclRIcXBDL1BQa0RKc0YrNVMxanh1RXFGVDlYYVN0RWtyaTdmS2ZZUE8y?=
 =?utf-8?B?N1MwSnFvWnRDdXdJS0RZaGxud3QyQnFpc1VxNEphRUl3eHp5ZFY1YjdVT0tx?=
 =?utf-8?B?ditIZFRsTndEenZoRnAvODlpZG9uWXAycWxUTWh0S1hleVJ2RVpLeVdEbmQz?=
 =?utf-8?B?R1pFVzRXeDI0cjBVcWhPVExVRUZ2MldhT09JN2UrZDBHYk1jSlh0YjFWRldr?=
 =?utf-8?B?KzF3TU44dTdDQUVhaUFpN3dvSitTbll6V0xCSzZFc1hwSVVIU3JTWVF4TUJ2?=
 =?utf-8?B?ak1KTCt1eWFFdUFuK0pELy9NeHFHN2Vqd3pQSE5KZ0xVNS9EdmNUZG12ejl6?=
 =?utf-8?B?SnRtU3ZtaVh1NXEyR2RhYmVXRlFTTk4wRDlRcXpnS0pqdEx3VWh3UWFPN2U0?=
 =?utf-8?B?MHg3Wk1pVWpNWUVUakYvUzdPWm9TYkVPT1lpcVdQZlhIOGlKV055VnFVRXo1?=
 =?utf-8?B?SXFKbW9DK1NYR1BHT3FsbHdzY1RoU2ZOTjZBaytjWEpRd3h1Wi9ScGFZekxk?=
 =?utf-8?B?bzd1SGNoM1ExSzdHbi9UNUxQdFMwUmFGTWZwQkVMeEg4M1JxaEZ3TjNGYTFO?=
 =?utf-8?B?N2pZa2tVSTVPbVdhMElJeFE4azRITk9FeU1EYW5wTmx5RnhwS0k4K3R5cC9y?=
 =?utf-8?B?dTBmQldKdkpTSnFlMUlIaTU4THBFYklZbnBpbnJzUGpmVUphcm5MbG4yWFlj?=
 =?utf-8?B?bkhxbHh5bm9zUkx3MXdFNHVncnpQM2JueXdvMXV3WFp3ZXBFVWZObFlrb2pH?=
 =?utf-8?B?YUltVVN2MDdKRWI2aEZjWDA3bHd3dXcvWXRjZzdRdDhsZEZHak1peWhFUVlz?=
 =?utf-8?B?RUNiSTZCMDVCMDU5OUVSNlhwS1YyRmJlcWxGVkdSNnlYSWFIWXlLUzB2NzFG?=
 =?utf-8?B?Y1VsZmowMVo5Ynl0anMwZitHOFQ1cFZsclNsN1E0NmxXa1lOR05sWGVpZno0?=
 =?utf-8?B?dkhnQW1wUGl2N0tDR0JFSjdlYnZhNngwWTZWeVNGTTJwU3BYaEI4SzFWeDZE?=
 =?utf-8?B?V3ZybU9veVFsemlTWG1DL2pvQ2w0SXRiUnRBcUZjNnJ3aDJaeDJVQ2E5b2Rq?=
 =?utf-8?Q?JUl/zcs1AG1cbOJPcCMKPVM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUFIcWF5bFBzRmdOakY1ZXdxZDZHcGIxZmpRTnNFNE80K3pWcHRpN3AvdXBX?=
 =?utf-8?B?QkhQN1RZbzR3MU9RaEg1TVVLM0tOQ0QxZFJFbFZvMnZkVi9LQjRuY1VWdyt1?=
 =?utf-8?B?c1B3WnlpZFJlT21xUDlUeFE0K1IraDZ4VkQxYnplV0ZEQkVxZzZGbHhldHlq?=
 =?utf-8?B?UWlFTStSRUoveWZ1dUoyNzR1VE9BY1RsVDhPSGViNjQzTkEyU21sQlNscVIr?=
 =?utf-8?B?QS9hYjV5ekJaYVJMY0VHb3hOZDIzTDZxQytaZ0dxMEJ6cGFxbXF3eE9waFJV?=
 =?utf-8?B?U0VYQTlMcHBRMEZQYmlEYjhuQllweHJGRTdPamhtYXdxbHFGYkNaRDY5VkMw?=
 =?utf-8?B?Ny83b2oySG1ybFh2cDhQNjUwV2hDWjZ3STNVUGFET0JzcFNFckorSUxDOUVZ?=
 =?utf-8?B?YWpYTmowM01lbVZRaGMzamZoWmJCQWl1OEtVRXZQOFF2QzhEZVNyTUVNaENC?=
 =?utf-8?B?bERkSWhPZEFEbW1VdWNQQmRKVEZmVUhLTlhZUEFnK1hKcDRrMnF5WHNIRWVP?=
 =?utf-8?B?UUg2RGordGljZ0tXeDVEVlFwaHFJOXpGTkRwZFVHWTQ5R09zOW1ldkVVS1M4?=
 =?utf-8?B?Z05acWFndWt2djVoOEtYbXBXYUJCelhEY0plbjAxVE9FdzlJalhXNThPeE5E?=
 =?utf-8?B?RDU5T0JCQkZ4UUtmcy9kdnYxV1FxTitRWnVIbVluQ1JYK1p4YXIwdmZMRU9L?=
 =?utf-8?B?VFFrWTlNZEJFRCttK3V6aGI3K2Y3OVZLU2xxQ2QzZjVTQUtLSTVvZnlRM2FO?=
 =?utf-8?B?WWYzS2RrZzRXL0dRMWxaNzQ5eUJRVmlvRVU2a2ZrTm1yL2tjU2VYSDZ1UE9Z?=
 =?utf-8?B?eWdCSmRzWVZ1Tk9tbmVDaXBXZFVLcGJwRGdweVRVaVdHWndFV1oybmVBbFZQ?=
 =?utf-8?B?Mmh0QlBzV0VRQjFEUTYwcTg4WUN2N3RqNmE1WEd6OGZQM3hMMzNkRXVSUkZI?=
 =?utf-8?B?WFZFckZxQUY2R2pNTzYzQlBjUUxhdTMvVkUvbEQwNEk0blFHYlhQdCtRdTUv?=
 =?utf-8?B?S0I4WmplM1dCV0FMTHh3MHhxb1NNUW1hbHV3WWg2aHk5RGVhZFFVZzVnN1pP?=
 =?utf-8?B?cUZVVzlQMDBzRzVHb0M5SlovSDFBU3R1QURjOWQ0TTVKUnc0WlhyWkh0cE9N?=
 =?utf-8?B?cWJuS0wzbzZPdkdzbGZnVDhnNTZTdWpqWVFhakZMMHBxZ0ZnV2RKRmI3K0NR?=
 =?utf-8?B?NTRRa1BGcG5aOHNNYXFWQjlzcVRpU1FITG9kbzEvQzJkYWpnK2U1ZWhLZHV3?=
 =?utf-8?B?Zm0wNmtSbmU0cW9VYWNGTmxRMlc4ejFMM3Y2Tnhsb3lyZ2pIeTFTUzEzMm9t?=
 =?utf-8?B?QldZM2hBSmhiWFJRbHZLT0VEZFAzTC9kL2ZtaHBYcm92ZDU3U2pZTW5qd0w0?=
 =?utf-8?B?YmFGbjVVUmUrS0VHdWhtOUFXSC9ZNzFycWdCT1hjQlhJaDd6YTdtZU13c3J3?=
 =?utf-8?B?STZJQmt1U040cUlEYWkxb0ExQU9PMVdQbXVudlRlSjB2L1JYMWltNWpxaVRG?=
 =?utf-8?B?KzErbEkyYjFBNmlrdlMvMEZ1dFNKVmJWMTNmV2pFOUphLzd4YW9IbndJMW1v?=
 =?utf-8?B?WlRzNWNpdnVKWmhDbk5ibjZKcnNwdUxHUEVmRUxEc1JpeG85bGROZ3QrNFRw?=
 =?utf-8?B?dVBIVUd5SkMzS04rcFNHNGoyM2ZLZThzVDczVElxTG81dFYwODFnVnVIVWFP?=
 =?utf-8?B?NjBGTE1jWEZDUDFHaC91bUpweXlLVUl6TURTbFdGNDFCckJlZ0FHaVp3clNt?=
 =?utf-8?B?VXo0dVFJTjZ5V2V2dW1UYmtKVFRGTTRvL1BwZzdxUDY3d1Izc0hEQVduODZ2?=
 =?utf-8?B?ZGQyYkZXc3pUU0tYMXR1L2xvUlRXTEJwSFVuTi9TYUtnakI0N3BiMGg5VGo3?=
 =?utf-8?B?RVljeVdCcnJnUFhmUm9NWExWazB5ZXlnV3hSMVlQd01IOWx5SGVLRFRxcDF5?=
 =?utf-8?B?VWhiQkw1V1BvYzBpa2xEbXFhYjlTeW56VWI1ZVl1R1VBWnFMVGxYbVA4a1lK?=
 =?utf-8?B?QjhvLzR0cmJEa1JIQWxaVGVvbm5zZXFBWUFlSmpOSkxITjduaVVIa1g2VXFX?=
 =?utf-8?B?YUN2WGovMDNOeHNjaTJpdW1QLzYyc0NKVlQ0OGNtNGlTbWpBNkpRY0wreU13?=
 =?utf-8?B?bmJBckNtNUVTSjR5R0d0Wit3N2dndy9Ya25jV0xJYjdhSS9kbmdlSmJ6UmRL?=
 =?utf-8?B?L3N5MlFFR0M5WnhML09HTEdjVVF2WlVsTzBOOFNYZjUyZU9jWXdHNXRVSDcz?=
 =?utf-8?B?R2daWGxMcnRUVEZRZGVZZzd4RTA4UnNLT3gvNFRYRmh4S3JVeXJSQUtjV0N2?=
 =?utf-8?B?MmJCTmxmOGM5ZkZQbkxFMlA4NTFsS2owZ0JnTkIxaEFxeGc3cUlWY3VEbm92?=
 =?utf-8?Q?q3uScQcaOYpuLvNs=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fed43dd-1eab-4b9f-7b74-08de59d24ed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 16:21:33.3523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BOVlJwa4YeIK5x6IoLfc7XHgR/7iX6UnMDWzw8+zGR65p42owxGIltyaWxTyFswwnj/PT4iiRDF/t9VakZgV0O4ZcIIu/bq20ob3dNz5RPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27305-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,m68k.org:url,linux-m68k.org:email,linux:email,bp.renesas.com:dkim,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 4658E6A31D
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9obiBN
YWRpZXUNCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAyMCwgMjAyNiA4OjA5IFBNDQo+IFRvOiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTdWJqZWN0OiBSRTog
W1BBVENIIDAzLzE2XSBjbGs6IHJlbmVzYXM6IHJ6djJoLWNwZzogQWRkIHN1cHBvcnQgZm9yDQo+
IGluaXRfb2ZmIGNsb2Nrcw0KPiANCj4gSGkgR2VlcnQsDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBy
ZXZpZXcuDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gPiBTZW50OiBUdWVzZGF5
LCBKYW51YXJ5IDIwLCAyMDI2IDExOjUwIEFNDQo+ID4gVG86IEpvaG4gTWFkaWV1IDxqb2huLm1h
ZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDAzLzE2XSBj
bGs6IHJlbmVzYXM6IHJ6djJoLWNwZzogQWRkIHN1cHBvcnQgZm9yDQo+ID4gaW5pdF9vZmYgY2xv
Y2tzDQo+ID4NCj4gPiBIaSBKb2huLA0KPiA+DQo+ID4gT24gV2VkLCAxNCBKYW4gMjAyNiBhdCAx
NjozNiwgSm9obiBNYWRpZXUNCj4gPiA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+
ID4gd3JvdGU6DQo+ID4gPiBTb21lIHBlcmlwaGVyYWxzIG1heSBiZSBsZWZ0IGVuYWJsZWQgYnkg
dGhlIGJvb3Rsb2FkZXIgYnV0IHNob3VsZCBiZQ0KPiA+ID4gZXhwbGljaXRseSBkaXNhYmxlZCBi
eSB0aGUga2VybmVsIHRvIGVuc3VyZSBhIGtub3duIGluaXRpYWwgc3RhdGUuDQo+ID4gPiBUaGlz
IGlzIHBhcnRpY3VsYXJseSBpbXBvcnRhbnQgZm9yIFBDSWUgd2hpY2ggcmVxdWlyZXMgcHJvcGVy
DQo+ID4gPiBpbml0aWFsaXphdGlvbiBzZXF1ZW5jaW5nLg0KPiA+ID4NCj4gPiA+IEFkZCBuZXcg
bWFjcm9zIERFRl9NT0RfSU5JVF9PRkYoKSB0byBkZWNsYXJlIG1vZHVsZSBjbG9ja3MgdGhhdA0K
PiA+ID4gc2hvdWxkIGJlIHR1cm5lZCBvZmYgZHVyaW5nIENQRyBwcm9iZSBpZiBmb3VuZCBpbiB0
aGUgb3Bwb3NpdGUgc3RhdGUuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9obiBNYWRp
ZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQ0KPiA+DQo+ID4gTEdUTSwgc28NCj4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPg0KPiA+IEhvd2V2ZXIsIEkg
YW0gc3RpbGwgd29uZGVyaW5nIGlmIHRoZXJlIGFyZSBhbnkgcG9zc2libGUgYmFkIHNpZGUNCj4g
PiBlZmZlY3RzIG9mIGRpc2FibGluZyB0aGUgUENJZSBjbG9ja3MsIGUuZy4gd2hlbiBQQ0llIGlz
IGluIHVzZQ0KPiA+IChuZXR3b3JrIGNhcmQsIFNBVEEgY2FyZCwgLi4uKT8NCj4gDQo+IEknbGwg
dGVzdCBhbmQgbGV0IHlvdSBrbm93Lg0KDQpJIGZpbmFsbHkgZGlkIHRoZSB0ZXN0LCBkaXNhYmxp
bmcgdGhlIFBDSWUgY2xvY2tzIHdoaWxlIGEgV2lGaSBtb2R1bGUNCmNvbm5lY3RlZCB3YXMgcGVy
Zm9ybWluZyBwaW5ncy4gU3lzdGVtIGdvdCBzdHVjaywgdW51c2FibGUgdW50aWwgbmV4dA0KcmVi
b290Lg0KDQpXYXMgdGhhdCB0aGUga2luZCBvZiB0ZXN0IHlvdSB3ZXJlIGV4cGVjdGluZyBvciBk
aWQgeW91IGhhdmUgYSBzcGVjaWZpYw0Kc2NlbmFyaW8geW91IGNhbiBzaGFyZS4NCg0KUmVnYXJk
cywNCkpvaG4NCg0KPiANCj4gUmVnYXJkcywNCj4gSm9obg0KPiANCj4gPg0KPiA+IEdye29ldGpl
LGVldGluZ31zLA0KPiA+DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gPg0K
PiA+IC0tDQo+ID4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLQ0KPiA+IGdlZXJ0QGxpbnV4LSBtNjhrLm9yZw0KPiA+DQo+ID4gSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuDQo+ID4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0
IHNheSAicHJvZ3JhbW1lciIgb3INCj4gPiBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==

