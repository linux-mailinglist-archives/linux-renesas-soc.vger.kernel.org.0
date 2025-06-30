Return-Path: <linux-renesas-soc+bounces-18929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D78F3AEE503
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 18:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCB3E3B8A60
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 16:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D9E28F514;
	Mon, 30 Jun 2025 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hSAMY9F1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6305328CF5C;
	Mon, 30 Jun 2025 16:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302437; cv=fail; b=DhYnIEYXCaJIRCovK1664YW/KLuLgCBLH8FMlWbDk8ix2udJ4EZSr3H2NC3pkkuWqzJkmmeMVFbTyoRVpUONeq4i9moJkOADctN4WEeugktZIG5kB67Z5/pTXVdzrfy6AVkhXQNEpXs0uVYVbPN1xacLHkvT5Y2b4zlNH/B/hFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302437; c=relaxed/simple;
	bh=eXZbNoVUm1M4QGvs5iN9FMlBRZW1QFEcngMzKg5UlDI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UJ+AeisfCx2iyzRuwNyJbmmxV/ZktGQvihHRHHDz2jWQpptMtyhJsOKu/BTiXT0vyC3n5jEBWXDWhS5LktT229sNMmkulSgNUcG3VcGBBzOSv5gzD0qWExLnu6cB8kbeFRKN+HSCLgBCqrXS93zfXAtuZDRQJ8M5q1hg2oBNIrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hSAMY9F1; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VN+qByEQtxcl2CfayTpBc6dOAnW264njc+wvp6PjBItODBF6gmqA6/chNWlvedA+keSbVwBI8j9lG61RCIHx7uKcy7IRgq+83OHX7/afnZmgavshP9Mu67uix5XiYxTJn4AZepqY+rT3gzyChx4vTzh+1PRZcCg8I9oIsskwZsfDwENblOhmGzfvOF4amszpKKn51d9wTqtUfzz3k2Sc7bJ1qemJh/7qG6Yilm5DNl9IHmAxfSN3g3Eqw2899yVcOHIXrgG6MpizFGnztluw9we5IRqa320TOfoXmmMrdUlaA00LO3Yn7r9bSLPRigYPhCWvky4K6Y/dclo3Vu4x5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXZbNoVUm1M4QGvs5iN9FMlBRZW1QFEcngMzKg5UlDI=;
 b=Cc6FQqPtxBiqLaaVOdLgSdOAxsaJImJLWRVtuvUIriiOBeM75txNDJkANm+ITFAD/fUdPUtrJzi84hKDFybI7At3bTpgAghqU5094hHUSBEWO6xTwiPax6Bo+uYRmMujrN9xOnMW5ldiX9GvWGlww87/FibXn7LJQ1R+xUNmz7Ky/vT3sWyHOzwmhnCIhDENGxi+tW3oT7BA8cV64A2DqzpW6sgofX/rZT7dpcEtpCp5BLCdfBr3FfdxMXV++ZbOoGD1t/1mtWfWVa+dT7Z6ZIPxxoaGHy76TBT0BCVKv3MP/0/R72v7wuaUqitofQE76lrCUsmTBVxahZTU03EnnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXZbNoVUm1M4QGvs5iN9FMlBRZW1QFEcngMzKg5UlDI=;
 b=hSAMY9F1R3/2DdUlWfmEqFZ6e2wBCrEIOAFYMlCmy42NUe2LnB5ETmEJg8RHRSxwp3dPJmzBT+3mpRZEhOrD6sMAD4sDFWANvo8TX7/BYX0NQBP1Qgf/lVugT8XpoYrZxxWDaAWRwHJ2ZF55BY8DBycrMVxgVgrUtUNdaf3ThNA=
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com (2603:1096:604:3a0::6)
 by OSCPR01MB14329.jpnprd01.prod.outlook.com (2603:1096:604:3a4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 16:53:50 +0000
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82]) by OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82%3]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 16:53:50 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
Thread-Topic: [PATCH v3 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
Thread-Index: AQHb5BV8M9FAEV3KpkiJgsZHjocfGbQT/wsAgAfmt7A=
Date: Mon, 30 Jun 2025 16:53:50 +0000
Message-ID:
 <OSCPR01MB14647BA02F34A7BA3C98D6CCFFF46A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
References: <20250623080405.355083-1-john.madieu.xa@bp.renesas.com>
 <20250623080405.355083-2-john.madieu.xa@bp.renesas.com>
 <CAMuHMdU1mEfiL3e=NwSjTchpDXt1YTM3AkS7K3aR5h4FK94WCg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU1mEfiL3e=NwSjTchpDXt1YTM3AkS7K3aR5h4FK94WCg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14647:EE_|OSCPR01MB14329:EE_
x-ms-office365-filtering-correlation-id: 8cc1c80f-d8d3-45f7-d983-08ddb7f6b076
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MlNkcFRyQ3Mrd0hjWTFWNDNLdnI5QitlMzFWcUlFMzM0NjF0RnI5VHV0WTEr?=
 =?utf-8?B?MWxnWkFCSE44dDVTU0VYYVhIb1hubDZuY2swRGl4MlhDQ1J6aFgweGxxZ2d6?=
 =?utf-8?B?akhaaDJpZFhvMG4vZVVleGNpdUVoWU4xbkc1YUVyaXB2cmtHanF2akgyMUwx?=
 =?utf-8?B?Q0Y1TEVoSmJCcnVyOTlQK1prMEM1UFpMMUlEaG84dVpCY1VPYkZsK1lGS3hU?=
 =?utf-8?B?dkVjb1kwMHNsL1dUSXFwSi9LZXJVa04xNFpGRmw3WmtEeW41bjFUeTN2bzBV?=
 =?utf-8?B?c01wYTh2bUJCYUpxWUtKQ1RqY2hWc0xrOXJ5eldzM2dGelQxbkdubmJSREFV?=
 =?utf-8?B?UlYrT1lmS3ZZelNvalZSQXVMQ25PaVpueEVTbElQZ0gwTkZFcFd4S1lJQnA2?=
 =?utf-8?B?VDJWUGdmYk8vYy9BazRqaXFjQnBERXJxMUxwZTlBblRjbG5nbmN2QUxDU2Fr?=
 =?utf-8?B?M1RqeE9OQXoyckVrWE9ONHFqdGl6Q2FnRzlVWUNiU2RMbmUyUEdjdE1Nem5T?=
 =?utf-8?B?OUFQeUpqM2JwWXNxRUhNY0NTRm8wS1dBN090YzV4WnFOdHpyd3RWanNBdkxD?=
 =?utf-8?B?ZE96UUlXY0pnSzZMTmd3MHFyd2M4L09ZYlIzMTkrQTg3UjM3eFFDbzlLdlRs?=
 =?utf-8?B?QjlobHFOSUhPNlVtT21zdDh0QVZ2V0lCbDRwSENBem0zV0ZWbVM1Um9HeDBQ?=
 =?utf-8?B?bEtuODF4b0dSWWVlbGRoUVB3dENMTzlQeWpQODBjcmR4NGxsd3pYdTJDT2lQ?=
 =?utf-8?B?MU5kVExXbmpoamhoekdWcnRObGFhazBHOGZIeEdwOVg1Mk5MbEh5UWdzanlj?=
 =?utf-8?B?TExLb1FtcXVUYjZVRkIxT1B0dmRHTXEyb21aSzZDS3lPMjFxOVhQOUk2dHVj?=
 =?utf-8?B?VWZZR3JEWVA4Qyt5Mm9mQWlDV0dRNVpUQUp4R3lMU0xZSFVPMWw1MytwbkRS?=
 =?utf-8?B?SXlvLy9oNU5tYVpZd0FaTzdPQkFyNnh6NVRuNnpybm1QVWhZRmpTRStENTdW?=
 =?utf-8?B?U3NlRyt3NHp5TFZjYlRjbzhQWVd3U3pDd1RqaThSOXR4b3QxNmhPbVRIaTBo?=
 =?utf-8?B?MWtmbjBuTWk5ZnkzbElpNUpaMkFGQ1pmVzZpQ3l6M0JvdlNkY295TUR5VUhr?=
 =?utf-8?B?OG1yN3VIMTM4NEFQUG9MalVsUU9tQXZMWGxkaTJDYStnMlFOKy8yTDlxOERQ?=
 =?utf-8?B?eGdEZXZKd0hoWXliRi93eTQ3cU9GMmdLOHB6dWlTS2VPbTFUOExRNWZ5Q0JE?=
 =?utf-8?B?aVE0dHRiYjA0ZFF1RUh0TTFzOFJNL25NRDd6UGNaamJQU0pOMCtXYVNLaEky?=
 =?utf-8?B?Z1VvNFJmY09VU2VtVzdhQWw3ckN1eVBpNnJJTlh2SUp2d3l6NjR1OUgxQkFi?=
 =?utf-8?B?YjlncWlrMDdlQ3ZwRlUzd0JDMVFlNUFqR080UlBpdTZQQWlIOWg1NVFtOVdU?=
 =?utf-8?B?THhGbEkrd2g4a3FwaWRLY0tpZUNpaS9jRHJpR0l5UkphWkZxMkxPWVlBMldP?=
 =?utf-8?B?RGZ5MHBIazNwQnN4RGdaMEd1V1piait4NkhBb1h2THJJWnBLMFdqTFhxS3JM?=
 =?utf-8?B?cUVhMEd6QWp2UWcva051azF1UWoveHI3MGMyQ0EreFV0SlFjVnptTi9KT3h0?=
 =?utf-8?B?dzZYd3lveXJReVpWMEJUZFMrNlN2enJ3djNBdGhyNEUrZmxPOGRZSG1ESytp?=
 =?utf-8?B?RkViYk9tbFRIWHZ2N0xSaCtJOUVCSkgvTFRLc1paTkpXbXdEbkEvcWJOV3hT?=
 =?utf-8?B?ek5GZlEvK2kycldzM0I5allHZGNYUVUrNFpWalYrLzdrZVNXMk9xTjI2YzNl?=
 =?utf-8?B?WXZZaS9xMGxhd1VuMlFoeTlSaDFTR1hPZVEwZk0rckhPUndYY3pRSGliZ1hv?=
 =?utf-8?B?OUVsamt0VmhmbG5HbVBHRzMrU3dFUUw0eEVxS3VvOW1Jd2RyOE5tYTBqbERm?=
 =?utf-8?B?ZEN2M25UY3VUWGJwejd2L093OUpiUVp6RWdESEdvbjA0UkFFcFdRN3JmZ0Iz?=
 =?utf-8?B?Zm1RdW1PMVl3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14647.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2dtaE9UdHZVMmJpR2ZVeDJSRW1WNGJpbG4wc0RxL0ZRc0dRTkQwV20vNVc1?=
 =?utf-8?B?UlYrUW1mRTlGTHB5OUxmVll6QnNYQlRhODRoSDRQQjNldjM2bEtmaHJXQUVl?=
 =?utf-8?B?NkdTMEJRVmlPTlh3ZldKTmlDOFV6YnlPNEwvb0Q1NU80THJqTzJGeUptQ2Nh?=
 =?utf-8?B?V2g3MnladnJqVDBVcWhad1pOTjBRRTZqbG5JOENBazE2aCtwcTRrR2szMldV?=
 =?utf-8?B?QmxTbzhpMndNdFBXSHh0aENCaDBXUTl3RWowcHBmN3Z1ai9kUHQ0dTJOV1Zt?=
 =?utf-8?B?VzVwSUhFM21nU1R1ZVIzN3Zwckh5TXRMVzhVNDFqc0ZCSHZJM1cydGVHbi9O?=
 =?utf-8?B?Q3pmWm5kSUQrVGxzTkNxTkdYaEQzc2xVaCt6ZTM0YWVHa3o4K1BaQ3k2L2RZ?=
 =?utf-8?B?Y1pTWU9SZjBOcXB4d1NTM0VnWWdldVN4MXBjNW1EYVhVVUY3RXJ0Y3c4N2U0?=
 =?utf-8?B?UGpicFdpSlc3WGR4YVoxM0duZE4yalRib2Y1ZW9KQmhkZGZMTzRoL3NjenpJ?=
 =?utf-8?B?MmR6R3hLSStKVzRLWDFURkROLzhSbk1zU0J1OGZYRmRiQlhtWit6dUxNNkNH?=
 =?utf-8?B?Rk1tWVNUUjNqb2VmSU5RMGd6VEVhU01NWHQrZHZydGNnb2pBSTZnM0hVek1h?=
 =?utf-8?B?UzNxaDA4SXNvTUJReFpyTE1wU1B3YXRWOEZ5SlNFMmsvaTMyWHJOR3I2Ukpj?=
 =?utf-8?B?MVFoMWtqMFJQSnh1SUlGOTZ6UTBtWEhSS2Vrbm0wZldCZkpSSkFkZkY0b3pw?=
 =?utf-8?B?UDZadGRtWGhvaG9RRFJKRUFQdUxjM25iZDkwYUJZNk9CQ0lHZmJuUlJabS90?=
 =?utf-8?B?ekU2bW0zV0YzZXZFSTdldytCWHhnRjRHelZadE1uZm1QckZ1bmZpWHp6Y3ht?=
 =?utf-8?B?RUc1SDhjS29EYnVidWl0M2RTUm5PMEJaYWttcEJtWkRwNjJDT0hwUFVlVlhJ?=
 =?utf-8?B?SjFrNVZlWEd3VG14VFExRG5RcEd1MjI2V3c2R3RWUnBmdEVLUlpZT0lNdW1G?=
 =?utf-8?B?UEJpcXhMcU1oS3M3WTZXT2FMSW43ZktHZVdETEE2MDNlUkU2UURXOEc3Y1JI?=
 =?utf-8?B?ZUpINFVBSm9mTFd2VFZtVC9QS1Ficm1JK0t5cmgyMGUyTmE2WnMrVzlnNmZm?=
 =?utf-8?B?VFBBQ3RNbFl4WXNLWXJNUlA3cHJjSmxmSkF3NXB4ZWFkVHd3YmR2SHJvREZT?=
 =?utf-8?B?SjA0Z1k2L0tJVWhZVm1kSjJPTjVaRVVKVWc4d3ZMVFl4b29qbUNPNjIrT1FF?=
 =?utf-8?B?RGJLWlJYUGl2YWNqS0J6bm9pUCtNeU0wbktMVmZ0ZkI1NG5QTmNQaHJ4bDFx?=
 =?utf-8?B?YjU0dmdsMkFZWm5ZUUh0WFBkSk5nRVB4cVZFYnNDMWVrOGlUcEg4OGQyWlRX?=
 =?utf-8?B?V1Zscm1zeWxWdlBIejJ2Q3I4b2pVTDJBTUUwYXpwdUh3SDJiQVg4eE4yUWg1?=
 =?utf-8?B?ZnBvSFlsYlZNdHhPRkFXTnJJeFlLTWlSZzE4V0RXS201eEN3OENtc1FkdkFU?=
 =?utf-8?B?Y2pBMGp1ai85UEozejNoSkhRYm8xOFhraEhKK0lZdllOYjBsRmNYdi9hNmh1?=
 =?utf-8?B?K0UrQ3B0VlRoUnhHVkhxQTc3a0Z5Q3BRTUFmZ2lBek5oaERaYnNkbGJVUk9G?=
 =?utf-8?B?L2NFOUJSZWJvYXJjZHZmL1FHUnJYM3g1TzBGTm52b0ZOQUVibm5Zc3JMYXhW?=
 =?utf-8?B?UVQ1Y3pCbWdlUExoaHlzeVl3UVQxRGtlS0tFS21ldU53TXdaLzFFeEl0TTZi?=
 =?utf-8?B?b1NCQWtIZ09tZW13bEdyOHBhWkp1ZytmQ3p2cndDWWZoei9MbllwVmxOdC9E?=
 =?utf-8?B?WmpJTnZpRkxxcXlsYmNkQ1Z6Y1FORG9aeVdUZnNGU09KMEUxc0tLS28vWmNp?=
 =?utf-8?B?YzNnY0hIa3dwUUpucXVUZGRoQy9Ca2t0S05sOWNyaG1IWGphcFJJWi9PZTdI?=
 =?utf-8?B?Y3hlYmhXaXBBems0VnI5ekY1S3RsSGNGK0RnYXNFczN0YVV4Z3F6WmpQNW0r?=
 =?utf-8?B?OHdjeW5IZ0lpRkYvaUlKc1hrV0FIeCsxTXovN1ZvYm9OMnpaZ0cvc2F6N0hD?=
 =?utf-8?B?Tldkc2xoeU5mMks2R3RySXorOEhDSlFCUE1QV0o4QUNkZUhYRXVpMzlTSS9p?=
 =?utf-8?B?eGJvRzQ5T2NUTmZ6eHF5aWtuYmVjd0dTRSs2M0o4TzZlZ1lHUHhIOXVKM05O?=
 =?utf-8?B?VVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc1c80f-d8d3-45f7-d983-08ddb7f6b076
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 16:53:50.6307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4+cPo5oEO5flDZvbezhabO2DgbAGgK2A3Z59IR0RII82Ls0+TclD7LpqeONSHvdAr9fPziCL+nS13p56gIszmcrK6aSGR98Dd75WrdJ+SEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14329

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBK
dW5lIDI1LCAyMDI1IDU6MTMgUE0NCj4gVG86IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBi
cC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzNdIGNsazogcmVuZXNh
czogcjlhMDlnMDQ3OiBBZGQgY2xvY2sgYW5kIHJlc2V0DQo+IHNpZ25hbHMgZm9yIHRoZSBHQkVU
SCBJUHMNCj4gDQo+IEhpIEpvaG4sDQo+IA0KPiBPbiBNb24sIDIzIEp1biAyMDI1IGF0IDEwOjA0
LCBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+IEFkZCBjbG9jayBhbmQgcmVzZXQgZW50cmllcyBmb3IgdGhlIEdpZ2FiaXQgRXRoZXJuZXQg
SW50ZXJmYWNlcyAoR0JFVEgNCj4gPiAwLTEpIElQcyBmb3VuZCBvbiB0aGUgUlovRzNFIFNvQy4g
VGhpcyBpbmNsdWRlcyB2YXJpb3VzIFBMTHMsDQo+ID4gZGl2aWRlcnMsIGFuZCBtdXggY2xvY2tz
IG5lZWRlZCBieSB0aGVzZSB0d28gR0JFVEggSVBzLg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBUZXN0ZWQtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4NCj4g
PiB2MjoNCj4gPiBObyBjaGFuZ2VzIGJ1dCByZXNlbmRpbmcgd2l0aG91dCBkdC1iaW5kaW5ncyBw
YXRjaA0KPiA+DQo+ID4gdjM6DQo+ID4gVXNlcyB1bmRlcnNjb3JlcyBpbnN0ZWFkIG9mIGRhc2hl
cyBpbiBjbG9jayBuYW1lcw0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAt
LS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA5ZzA0Ny1jcGcuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvY2xrL3JlbmVzYXMvcjlhMDlnMDQ3LWNwZy5jDQo+IA0KPiA+ICsNCj4gPiAgLyogTXV4IGNs
b2NrIHRhYmxlcyAqLw0KPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHNtdXgyX2diZTBf
cnhjbGtbXSA9IHsgIi5wbGxldGhfZ2JlMCIsDQo+ID4gKyJldDBfcnhjX3J4X2NsayIgfTsgc3Rh
dGljIGNvbnN0IGNoYXIgKiBjb25zdCBzbXV4Ml9nYmUwX3R4Y2xrW10gPSB7DQo+ID4gKyIucGxs
ZXRoX2diZTAiLCAiZXQwX3R4Y190eF9jbGsiIH07IHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QN
Cj4gPiArc211eDJfZ2JlMV9yeGNsa1tdID0geyAiLnBsbGV0aF9nYmUxIiwgImV0MV9yeGNfcnhf
Y2xrIiB9OyBzdGF0aWMNCj4gPiArY29uc3QgY2hhciAqIGNvbnN0IHNtdXgyX2diZTFfdHhjbGtb
XSA9IHsgIi5wbGxldGhfZ2JlMSIsDQo+ID4gKyJldDFfdHhjX3R4X2NsayIgfTsNCj4gDQo+IEkg
aGF2ZSB0byBhc2sgeW91IGFnYWluOiB0aGVzZSBzdGlsbCBkaWZmZXIgZnJvbSB0aGUgc2ltaWxh
ciBuYW1lcyB1c2VkIG9uDQo+IFJaL1YySC4gSXMgdGhlcmUgYSByZWFzb24gZm9yIHRoYXQ/IFdp
bGwgdGhhdCBjYXVzZSBpc3N1ZXMgbGF0ZXI/DQo+IE9yIGlzIHRoaXMgdG8gYmUgc29ydGVkIG91
dCBvbmx5IHdoZW4gdGhlIFBIWSBkcml2ZXIgd2lsbCBzdGFydCBzdXBwb3J0aW5nDQo+IHRoZXNl
IGNsb2Nrcz8NCj4gDQoNCkkndmUgZGlzY3Vzc2VkIGludGVybmFsbHksIGFuZCBuYW1lcyBtdXN0
IG1hdGNoLiBUaGUgbmV4dCB2ZXJzaW9uIHdpbGwNCnRoZW4gaGF2ZSBhcHByb3ByaWF0ZSBuYW1l
cy4gU29ycnkgZm9yIG5vdCBtZW50aW9uaW5nIGl0IGVhcmxpZXIuDQoNCj4gPiAgc3RhdGljIGNv
bnN0IGNoYXIgKiBjb25zdCBzbXV4Ml94c3BpX2NsazBbXSA9IHsgIi5wbGxjbTMzX2RpdjMiLA0K
PiA+ICIucGxsY20zM19kaXY0IiB9OyAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBzbXV4Ml94
c3BpX2NsazFbXSA9IHsNCj4gPiAiLnNtdXgyX3hzcGlfY2xrMCIsICIucGxsY20zM19kaXY1IiB9
Ow0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydA0KDQpSZWdhcmRzLA0KSm9obg0KDQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0K
PiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtl
DQo+IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg==

