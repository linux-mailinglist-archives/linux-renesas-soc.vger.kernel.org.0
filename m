Return-Path: <linux-renesas-soc+bounces-8430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE773962457
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 676912828B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 10:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AF9167DB8;
	Wed, 28 Aug 2024 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hTN2iWee"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010035.outbound.protection.outlook.com [52.101.229.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D29716132A;
	Wed, 28 Aug 2024 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724839817; cv=fail; b=REVvAvXdgU7VjAEJFrACEPCJAZrIaAKfWtuzUnOBHkoLGEoLYX2x13RdgRjPJEEDTbXlB9YUs4iajZcT7HNeP9hnVXnB74EW0rd1LVx/AN/+zX6OALp/3hDnZOn/X8H+ldfM30hNSDkCPBR7Vau01BsIyHykQhjZ80+g8lTKxhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724839817; c=relaxed/simple;
	bh=kg5IAhWNgLHOZ/nc8rH4icsB30icEF4mDx07jh566Uo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nAGyTP46CBEUaZmkn0WjbnaVd8vK8gbmgJy8/6xzNVynEzZjISV1P1o1U7vXc0SGhvV07jBwZjtBOWJDZ3t0YOiCTzLEtIkKvAMPOQqsworIs+r1V2bCL5nCr+y5BsdjsstpiNEqmqt3p7r6dQdvd9TqI1wXpjLzljgs5lthj0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hTN2iWee; arc=fail smtp.client-ip=52.101.229.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8OIb4SeYoU1gMrxBF9KcM7ZKXYE+Der8ZFSyYlN1d+KG0zk3n13/HdFMqI+j+BldCi3ECvXCV7G0jSXzCmjo5JHLyzZzre6VrBGyGcdZMD2lGlPm+LgWX9jcw1+kxepp80R1HGP0TpIc0P30w2WC3dTq9QScl9KUDuQfoTyviq5VsnboZmY2zYKXrFZDOQX4rtFveqJbn1AenDP/+J8w7tyXgMIesc8K0HnSOIAdQVfBZ7jyE6OSHRLDjXcanYjdepZd+qT1ZdKPVPG01pQHUK2Bzlk8UCxaLTsIe1k0WKG9Z5u/4PypMIWduYUEscNzshLW14z3ywdPV0XFPjp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kg5IAhWNgLHOZ/nc8rH4icsB30icEF4mDx07jh566Uo=;
 b=sBWAFD06uZ/u9bssrcV4B/lHyqcm0YDqGFT0IFPm6IwDkR6eXIkN5kxiLCI5XVQC0KopJqn7CJFzvLw4qfNdSmHP64wLCNgZ1grB41HhDSvj7euyX5eIOq3ylvj/bThJIl+Ss0JSOYijFS9VIWv15xw6B/VZLuejfNKWbRMFQ6dxRbCMs29lR/BoFP07C8ehyfM4nwRWswyVNAgRNDU1EbZVGYpndGb+AjBIo1zdCnzFyiGphc+a1g6LzQUq+zlkJGrYa94ciQsJmJ5SiWefssI5Qthp7k5oX1OePt1Ww6CZ/TlwTaopo4j5lf6fsEeqBNkuTig1cjRwiXy9cS/aHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kg5IAhWNgLHOZ/nc8rH4icsB30icEF4mDx07jh566Uo=;
 b=hTN2iWee/yefK9wZ2OrDUv7J7IzQCBRMi0MQZtPaKp6zOcPgfSDV9EVeqEOJoK7wMGo2cCgTEfQwDDOQtllyxil1VnKUm5kYbMp01+Qkc9nClMbXISz+5wF5W11SoI0cv+ayW3VKrFUv2f19AbmnmAXmV6Ye02GySpmAovPvgFk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9455.jpnprd01.prod.outlook.com (2603:1096:400:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 10:10:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 10:10:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for GTM/RIIC/SDHI/WDT
Thread-Topic: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for GTM/RIIC/SDHI/WDT
Thread-Index: AQHa+S4N8exrBf+5L0Ks2gkmNjakEbI8bVcAgAAChoCAAACnAA==
Date: Wed, 28 Aug 2024 10:10:10 +0000
Message-ID:
 <TY3PR01MB113460F2ABA56C89E8E9CF09D86952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240828093822.162855-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346345B7FF1DBD4DA60273286952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vPisCVCX0jLYJGrozabRWpBV+xmU5ufu4Ke9Rziis1XQ@mail.gmail.com>
In-Reply-To:
 <CA+V-a8vPisCVCX0jLYJGrozabRWpBV+xmU5ufu4Ke9Rziis1XQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9455:EE_
x-ms-office365-filtering-correlation-id: 984b9e73-5804-419d-cf0b-08dcc7499989
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?enZIRVRrYU1zenBRckdKZzV5NlNYWEVMTDc0b2Q3bHdEWGM4VVgyZkpHS2hZ?=
 =?utf-8?B?NkNTYW5iekZhOStyeCtseFBEeFB4MFJKUmhVWWdIWVVMSGxGUGc0cEhCZi9Z?=
 =?utf-8?B?UmJlaTA0ZzJUMGNFMlpzNUlyd3dtSEZYMEhZMU5YanREd1ZmS1lIeGpTcUM5?=
 =?utf-8?B?OExZcTN5OHZCekhvN1lQdGU1L2dMZ1U4V05lakNVVUFCdlBNTHdxZDcrL0x6?=
 =?utf-8?B?aE51bU05VjRBUHhKQW5hUnVCZjgrQkVKOXhIeFhYYm8vajZQVkpRMnRLb0h4?=
 =?utf-8?B?ZEd2bTBrblU0T0lpdUpQcmc0NWpub0g5YXJzZHl4RHlQRVFUY1ZRdlUyVXZU?=
 =?utf-8?B?MVdRdnIwTnJYejczUHdzMFVjcUtPeWc4RU5qaFdLM0xXN294Y3M1aUZVMWo3?=
 =?utf-8?B?TEtQZTdGMWVRTjl6Y25KcHhOMWljRmFuQ0JQWFdZaFhhMTdqM2hBQk5CQnFT?=
 =?utf-8?B?bE5FRlIzR1psWGtTcmlWLzNCd0pNS0lWcEthaU5rU0o0Si94UWZWYnFweWxw?=
 =?utf-8?B?TEhidG1KbytZRFNyVS9nNHRRcGhzTmpqb0VDcFhOVzNWRnZJMzJiOGlrVXpO?=
 =?utf-8?B?Z0hPSHh2NG1wV21qNkU2Q2tNZmRjOHYwSmp2UU1MNnhNZmpuckVhSkhIYXQ3?=
 =?utf-8?B?aWRwK1JWeUZWOVRRM1gwaE5TVmlaeEVIMGlXL2JUd2xTMjA1ZEtESlJVdzNP?=
 =?utf-8?B?SWJoSGpHM3piRXRnaVNlVXU0RUlYbjA0WWxvb09CY01QUXNDN1dvbUFhRlh3?=
 =?utf-8?B?d1lSSHBiZWR5ZnZ0NzhYaFBSKyt0SVdnYkdQa3JpME8zcGxZdWxtTW1BWk1P?=
 =?utf-8?B?eFN1M3gxWDdQREdaeXhQU04zUjBpV01UR3NqSHNQNkwyb1hDREN4VnVDNzJk?=
 =?utf-8?B?Z25TdG5zQUliNXRkWXFZQ2dWajNuSmYweFpZbzIydHZ4a2hiU3F1OE4zQWNH?=
 =?utf-8?B?SDlOcnFjRWp0L0lOSTMvQVYxT3hGcnZ4QTRONk0zY0l5dngrMEFsSkt0emMr?=
 =?utf-8?B?VnNDUDV3cnNXMWltTyt6aDAyeDFrUWFwd2hyZGtBZFJNeUFtWk5vaHBWWE5l?=
 =?utf-8?B?QzY0R1NYc0NCeWgwT1A3TS8xcml0cXVVcG1NczVZbWdmamM1c2xzaGN6NGNK?=
 =?utf-8?B?b1MyZmJ6ZS9HSlN4ZFdUWU9OK3A2cmJTazRoOEphNTdPUVFxbzFyYkR0L2VI?=
 =?utf-8?B?K0FJK1lXYkYyaGxDUDg4d1dPazAwL1Ayc2NZOHhnUG9UdEpZOTZoMVVTbXhY?=
 =?utf-8?B?K0xmZXJ6WkRPNDg4NXZ2NDVwN1E3WFBFODFMalFHQWI0VGpia0xFM3lLUERC?=
 =?utf-8?B?OGc4QXRGV2dPUnBtZkVCelI2VytBakRvbFhzTXRldHlYOTNRdEJ5L3pWN3ho?=
 =?utf-8?B?QnBzeU50eTJ0cFREbnQ4djVVR0lFa2svQjIrVWF2OHE2UjhMbzBMc1NDVHVv?=
 =?utf-8?B?NHJJOTdtdWtHZWpLd2MzSFJEUFpNd1RxNEpmSFZHbllJTHZBOUZpd0ZPdStO?=
 =?utf-8?B?UTViY2N2Z2x4S1dyTzdmeU9CTjBvT2VOUDVSdmtJSjgyb3htRVBtWjhmZjkw?=
 =?utf-8?B?N0NqOHF6d0RqL21jS1lRNWUvQXRLdTRMQ0lwY3RyTTNteTlwMWpxd1Noby9m?=
 =?utf-8?B?OWRaUUlNS2VHc2VabTcvL3pWN25YclhkRzBQak01b2h3NGp6WmxwZW5pRzUx?=
 =?utf-8?B?NnVDUkNQVWZRS2MxWjdWYUx3b3RGOGg0Z1hwQmVxYjJlZWhkS3l3a3Z4aHBi?=
 =?utf-8?B?WDZub3k1ajlySGs4Z3dGdU0yamg0V3hBY1JEUkhOVTN4cDQ5aVRwSVNFQis2?=
 =?utf-8?B?dDRFekpGQy9idDZhcUpSWHExWk9NOXVuTzFvdFZPbGFQallXL2RSZUNTQ0VC?=
 =?utf-8?B?MWRLWjVyc2E4VFVNbDM5RTZUKzcrUnBacjVhOCswTXlCVmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SkZvUnJwYTE5VTdCd2VxSTlHTDE4RG91Ykc4OG56dnR2bFRWUHp2Wk8yUU9T?=
 =?utf-8?B?UEJncFRxN1NRcm1NdDRVU0YrTFlOSGpadXpTNGFLUncyeXNWei9iWFBLeVJx?=
 =?utf-8?B?MnFWbHA4R3YzZ0JvR1J3SlFkSDJjbDZSSUZnZXY1bVhpbWpQQ2N3UFR0bWkr?=
 =?utf-8?B?VkwvL2xZZzNyT013VzZlZ2Y3a2xJSlcxUGVXbXE2OWE3MDBwNG9WeU5rZDRT?=
 =?utf-8?B?NmlqakRnSFRLaE9EZmxWaEFiOXoyak8wTjkxQ1hUeWpFRmoyb0ZJMHpUaDhj?=
 =?utf-8?B?bStKclVlSzlRMEZxWlFlUmRJMXhxMVJIbUtFV2hONDdrcHBVYVNzNUJza00v?=
 =?utf-8?B?LzZSTnV4WVczRFFqN3c5SjZYMkFiVFdHb0NoMGlENnVrUGlITXY4d016Y0VM?=
 =?utf-8?B?eWlkN3R6WlZuWndaamVkMUNWTmYrb3ZMbWhpcGFmdzJTQXNQakNsTFRISW5s?=
 =?utf-8?B?NGdJQ1l6WmdGZXlLN09FV0V4UkU0RHhkUGMrVno0OStEckpsbGpnLzFhcEcy?=
 =?utf-8?B?bEUxa3pPUzVrancvZ3dMMUdJYVg1WkxNbGQzN0VZUWVFMk55ZXRudnVoTmgx?=
 =?utf-8?B?OXFScXJEaHdoMWJZVW5JMnFIZ1BZYXpCYWhoYzVyTjUvQmRqcHRzOEx1bkRC?=
 =?utf-8?B?KzlLOEY5bitoaHpsdkJoc0JRL0xSaE1JVnNoaGhCOHpEcFNnVjRZTG5mc21X?=
 =?utf-8?B?MlUzdldxeU9BTzhob2FzYmx2Q0JORDJ5SUQ0a01BVHdTNTBJUHF3SDUzYjBo?=
 =?utf-8?B?ZXZWNE1JOE9vaTdEWlpwcE5QcUYzeXlmMHU1WlBsTlRKRTBPdzNBQ3JtM0lu?=
 =?utf-8?B?NzFmK3hmL1dlcGZIQWdZSXUvckh6TzhvNmc0RDVhQnpvMjJqTVBiclpub00w?=
 =?utf-8?B?SjUyMERVN2RIOUdBYUJNSHFobGpmckxpSFN5dFBScFJwL3BuUTNJUG9jYXhH?=
 =?utf-8?B?UlZwMmVLbXB2WmFxczZvVmowTG0yU1Q4bWw0WS9wVEZmWlpNMTFmZ1BEV1dN?=
 =?utf-8?B?TmJuTmFQSlp2S3RSRHlJQTNyVzlVbEpTVGJVRTh0aEdocFZReVZFNHpwUEJ5?=
 =?utf-8?B?aGkwemlzeVBhTm16cE1KQmNVdkpwOFpJUGVOM2dDaVRzZXBUY2RLcVc4d3M4?=
 =?utf-8?B?YSthdDd2SktxQWJvM0wwZ2w3bWFTMGM5eGJ4NVpmd0poQnA3NmRBdDJvUXc3?=
 =?utf-8?B?UzNPcUVIOEEzcGpxVFNpWlFxVE9BaVpwWjg4d0lhR3RZcGo3TFZBa3VSSjVC?=
 =?utf-8?B?cGRpMUd6eVNTSWpLajI2MHlrZzcvS3BjMmQxUnVIQkZybWhyakZSL0pBVFd6?=
 =?utf-8?B?M1RaUEE1R3FFaDc3M1B5OWRLK045S3ZkdmZILzZzS2JCNWZCR0pBb2dYalVV?=
 =?utf-8?B?cVQ2M094Z1YwVzdva1Q4MmxzMHc3OW1UR0twdExWZU1lMG93ZXB4Rk00VWth?=
 =?utf-8?B?ZGdaVDlUQWRHT1V0aXI0dldoSW54NWJNUEZTV1NieFN5V2x4ZGRSY2RzM2pj?=
 =?utf-8?B?NU04MXh4MmZqZ09SSHlXb2x5RlZRQnMwVFBPTnJlSjNuVWpKOStXWGVUVHFF?=
 =?utf-8?B?OEtuZEZHcTBocldheHhkTVZRT1BubFAzL0c2OGh5cEVqUkQ3d2lRajNZUWdC?=
 =?utf-8?B?TlBUeXdrU21ZNVV6cGUxZkhIN0gyekQzYWtuOS95T0svK2p1ZkNSb2tOSTZX?=
 =?utf-8?B?aFU5WGNqZ3ZrQWNQWEN5ZHFwbWZQVWZkZWlNUy96S0EyQ2RNeHBzUW1SN3l0?=
 =?utf-8?B?SlZVT3owazBFSFFNMStwN0hOZ0QwRFU5WndoYlFkRHViWVlxRVBhVTRSQW5Z?=
 =?utf-8?B?T2IwRXh3V3ZheUpNbmZSL09zRU56cVM1K3RJdkJ0WWZvSmdKbVRiUzVRN25s?=
 =?utf-8?B?RjNkNG5FNWxEa3dUUm8vNUtmRm1lTXJKNThWclNzN2N3TUVzRGdqREVMSzAv?=
 =?utf-8?B?SzdpR3pYN1kwR0tTL01jb2t0Y2c0VWQyNzdqK1VDLzJROVQ5SzhjdmxaSFlw?=
 =?utf-8?B?bTZYOUtRR2lRdnR1YzBXU3NWZmpzenpPZkx4TCtYM1JYSVhRdit5TXFnS3Yy?=
 =?utf-8?B?ZVNRb05UY3V1aGhtSDRjcEJjUkdxTDdhNThjdFo0ZnNjMWFlcmJpNW1XUlVS?=
 =?utf-8?B?ZUFMT3llYjJlMzZ5NTNNS3M0cERUMXptanBDZkpKdC9MWkdHeWFoMlZMUmpI?=
 =?utf-8?B?ZFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 984b9e73-5804-419d-cf0b-08dcc7499989
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 10:10:10.1881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EpfPBu6uB4/noKqESD9NplbmPv3XC+Nm8cxNj4HQzvgKFo5RLNhz9htep6k+JHXTm43oOkFsZ7UuGa5LwNOQO3Mc9eRA+NjycXTU2wKZv9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9455

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAy
OCwgMjAyNCAxMTowMCBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvMl0gY2xrOiByZW5l
c2FzOiByOWEwOWcwNTctY3BnOiBBZGQgY2xvY2sgYW5kIHJlc2V0IGVudHJpZXMgZm9yDQo+IEdU
TS9SSUlDL1NESEkvV0RUDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBBdWcgMjgsIDIw
MjQgYXQgMTA6NTPigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA+DQo+ID4gSGkgUHJhYmhha2FyLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgcGF0
Y2guDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBQ
cmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiA+ID4gU2VudDogV2VkbmVz
ZGF5LCBBdWd1c3QgMjgsIDIwMjQgMTA6MzggQU0NCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2MyAy
LzJdIGNsazogcmVuZXNhczogcjlhMDlnMDU3LWNwZzogQWRkIGNsb2NrIGFuZCByZXNldCBlbnRy
aWVzIGZvcg0KPiBHVE0vUklJQy9TREhJL1dEVA0KPiA+ID4NCj4gPiA+IEZyb206IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+
ID4gPiBBZGQgY2xvY2sgYW5kIHJlc2V0IGVudHJpZXMgZm9yIEdUTSwgUklJQywgU0RISSBhbmQg
V0RUIElQIGJsb2Nrcy4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2Fy
IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiAtLS0NCj4g
PiA+IHYyLT52Mw0KPiA+ID4gLSBNb3ZlZCBERElWX1BBQ0soKSBtYWNybyB0byBwYXRjaCAjMQ0K
PiA+ID4NCj4gPiA+IHYxLT52Mg0KPiA+ID4gLSBVcGRhdGVkIERESVZfUEFDSyBtYWNybyB0byBh
Y2NvbW1vZGF0ZSB3aWR0aA0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9jbGsvcmVuZXNhcy9y
OWEwOWcwNTctY3BnLmMgfCA4NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4g
IGRyaXZlcnMvY2xrL3JlbmVzYXMvcnp2MmgtY3BnLmggICAgIHwgIDQgKysNCj4gPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKykNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwOWcwNTctY3BnLmMgYi9kcml2ZXJzL2Nsay9yZW5lc2Fz
L3I5YTA5ZzA1Ny1jcGcuYw0KPiA+ID4gaW5kZXggOTcyMmI4MTBlMDI3Li4zZWUzMmRiNWMwYWYg
MTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA5ZzA1Ny1jcGcuYw0K
PiA+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwOWcwNTctY3BnLmMNCj4gPiA+IEBA
IC0yNSwxNiArMjUsMzEgQEAgZW51bSBjbGtfaWRzIHsNCj4gPiA+DQo+ID4gPiAgICAgICAvKiBQ
TEwgQ2xvY2tzICovDQo+ID4gPiAgICAgICBDTEtfUExMQ00zMywNCj4gPiA+ICsgICAgIENMS19Q
TExDTE4sDQo+ID4gPiAgICAgICBDTEtfUExMRFRZLA0KPiA+ID4gICAgICAgQ0xLX1BMTENBNTUs
DQo+ID4gPg0KPiA+ID4gICAgICAgLyogSW50ZXJuYWwgQ29yZSBDbG9ja3MgKi8NCj4gPiA+ICAg
ICAgIENMS19QTExDTTMzX0RJVjE2LA0KPiA+ID4gKyAgICAgQ0xLX1BMTENMTl9ESVYyLA0KPiA+
ID4gKyAgICAgQ0xLX1BMTENMTl9ESVY4LA0KPiA+ID4gKyAgICAgQ0xLX1BMTENMTl9ESVYxNiwN
Cj4gPiA+ICsgICAgIENMS19QTExEVFlfQUNQVSwNCj4gPiA+ICsgICAgIENMS19QTExEVFlfQUNQ
VV9ESVY0LA0KPiA+ID4NCj4gPiA+ICAgICAgIC8qIE1vZHVsZSBDbG9ja3MgKi8NCj4gPiA+ICAg
ICAgIE1PRF9DTEtfQkFTRSwNCj4gPiA+ICB9Ow0KPiA+ID4NCj4gPiA+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IGNsa19kaXZfdGFibGUgZHRhYmxlXzJfNjRbXSA9IHsNCj4gPiA+ICsgICAgIHswLCAy
fSwNCj4gPiA+ICsgICAgIHsxLCA0fSwNCj4gPiA+ICsgICAgIHsyLCA4fSwNCj4gPiA+ICsgICAg
IHszLCAxNn0sDQo+ID4gPiArICAgICB7NCwgNjR9LA0KPiA+ID4gKyAgICAgezAsIDB9LA0KPiA+
DQo+ID4gSXMgaXQgb2sgdG8gaGF2ZSB7MCwgMn0gZmlyc3QgZW50cnkgYW5kIHswLCAwfSBsYXN0
IGVudHJ5IG9uIHRoZSBzYW1lIHRhYmxlPw0KPiA+DQo+IFlvdSBtZWFuIGlzIGl0IHByb2hpYml0
ZWQgdG8gYWRkIChJIGhhdmVuJ3Qgc2VlbiBpc3N1ZXMpPw0KDQoyIGRpZmZlcmVudCBkaXZpZGVy
IHZhbHVlc3syLCAwKSBmb3IgdGhlIHZhbHVlIDAgaW4gdGhlIHRhYmxlLiBZb3UgbWF5YmUgY29y
cmVjdC4NCg0KQ2hlZXJzLA0KQmlqdQ0K

