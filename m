Return-Path: <linux-renesas-soc+bounces-9720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0233599C681
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 11:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AADDCB226C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 09:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E733D156678;
	Mon, 14 Oct 2024 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="q/SHHCsN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABDD146D55;
	Mon, 14 Oct 2024 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899702; cv=fail; b=Ok466pfegy5yM93252lNdpJkTQx1mOaCAL+Q5qV9v1GKvwhkw/UkHpNkd7lxyBzTksxRcCCs4UQKkNojFzNsOb8RLTrsCKLWFgD6VrtIGKs0x9tjmrAwyTDReujOgYbXEr1eon0YI4FqczX5ZQLs4b+n8dpTwhv2/3gQn0S6UJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899702; c=relaxed/simple;
	bh=Q3j6ilyLgGTpVJ+xsgKlaz0/2ZbuvOf0Y6WbmQdiaGk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=na4K2DnJvaBAAhePU+MjU2vT27v0ICAJ8e5DcKoh/ZDpqWCD3Q291lLqWg/kT25Oj+Z9STTVJezUrTFBUWYU1DywfZg+u2cU3rYvTixQPup9L0TXrmwvQR/7/Q+agx7SEmTQ50lzknIRfzyHbx0bsgvbzSzH6dlCYd89KHohfIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=q/SHHCsN; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiP6bWNVUTo749/RorqKD+JjjQxoiwRk7SI7/M5jtjSIlIFlmbhRmaSlwepz8uS5C5NMFbv5j127cj0VKWJf5UBLu791EBoPeqiwqG2OY1Hmajs7aoERZRsHfZSjU4aIu/Ri870FlEdqYQJdp4fQ9Daext/YkstTR7VMRGsEX/cjBMw4Jpwlx7yi5Uk4sjGDk2Oth1FAmoSbwKXHRhhilMlECP5iJWQDHmu28NOZESEtELY2txFT/7EN5fNXOodIafgeKRf3CIKMOYjwvb7nGGj53HznVat6c9gRhaxiU4JGIDtajtp+k0pPmS7toQNWYBLNrdklZ07Jia3YQfkL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3j6ilyLgGTpVJ+xsgKlaz0/2ZbuvOf0Y6WbmQdiaGk=;
 b=Rd7e6LqfEI5PaKbQjseGQkzX1/XCfXm/S6agB9nqhpYuDe+bBQk4lgOvLWHZdMfHuVTcGIuGVi4EHwiepSm2fVKXtIiOSfd5nUf78+EWijqT4B0cIWNbVIrUKIXWqBAp+e7xSPPjUhQuwPhpO1p8zlG0WThsVXafL4GaDPUaU3iRiOF5iuQngMKIGbXKepaiYhLkDCCzQXpXxDwqGYZ7SPd2nw7RHwolLS3lDnmOe54zk9n6HnWUA384fVHjhI8wMcUcJ0RH2BRDFno4JBdCGro8vOAgOzjZoUQUGKteIkdwZY6hUK65TK68hg1OnzOj3GXQ5KMX2BiCHcqSBqEBCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3j6ilyLgGTpVJ+xsgKlaz0/2ZbuvOf0Y6WbmQdiaGk=;
 b=q/SHHCsNuDGLxuKj2JuML7LGabh/+ZmBXEtxdaga1OB9vFVge5fHLWSbQfidV0B3IL8Tv/ZHx8Zg+xS6sy1aHe/+RErVfVplGfTrnMHTIPf5MNLtloqVk5MKKJRPcEztuI9QhYn8CY0dXEzYnii8qOlZewxZSx5h7tDgkYlAzvk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12920.jpnprd01.prod.outlook.com (2603:1096:405:15f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 09:54:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 09:54:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Hien Huynh <hien.huynh.px@renesas.com>
Subject: RE: [PATCH v2] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Thread-Topic: [PATCH v2] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Thread-Index: AQHbG/mHKVM27/WiLEqb195bZnu0obKF4ZgAgAAhcpA=
Date: Mon, 14 Oct 2024 09:54:56 +0000
Message-ID:
 <TY3PR01MB11346125FF19898F34BD7137F86442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241011162030.104489-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXM8KCd7Fi9dzQt=YUEu_bdwfZGEkaRS1_PaN7ECNFEGA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXM8KCd7Fi9dzQt=YUEu_bdwfZGEkaRS1_PaN7ECNFEGA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12920:EE_
x-ms-office365-filtering-correlation-id: f59851d0-1e69-4320-126a-08dcec364238
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?REwvUHNRekkyZC9pbWxic05YWDdVRlUvWUVGVkhhWlNOL090NGJBV2VsdW8z?=
 =?utf-8?B?T2piL1I4UjY0eDB0UnhUcXByOFMwamRGeGhIbm9hcXVDRHBBSG5Jb2ZTdjZG?=
 =?utf-8?B?NU9oSkxCNWJFN2JTVVRudEpmSEhuZ2EzSWZTVHlFb3VqMzhWYzgrYWt3MTE3?=
 =?utf-8?B?a0ZWQkUvZm1jU2N0ZWR5b0VOYlJScytZMHUzTUo1TWhDa2JFNWVFUi9FUytm?=
 =?utf-8?B?MVZ2clFVQ3ZoSXBSMGNjTk5kVjYwR1NjcDg2aDNReTVZUStBay9EUVVBdDUv?=
 =?utf-8?B?cW1YSmUvbmFpcmREWlBNdmpPSjgrSzVpNTF0eXREUFZadVJ0bVhBY0lySWF5?=
 =?utf-8?B?V2pER01WWkpyUkZGMEd4V1ZadHNZSjNBaG03YUg5dXN0eEtkc0x4eExkdzNC?=
 =?utf-8?B?NkRmUkZySUVYdnBJekJPdURxbEtYWGFnYXgvQzFxODR0TGUxWEc4UkVTa3dw?=
 =?utf-8?B?bXpSNEIzbW5wb1FES0RrUjZaTzNtU1ZqMUtzU2lsb2tRZXdQT29nKzhEazU4?=
 =?utf-8?B?aE9tUTNOQnl4VjROVVpTTHdpVTJFVTZwaVFEVkpjME1QcUJuWlF5VWZvc2I1?=
 =?utf-8?B?TC9sVDhPMEFaSGxkRDMwYUZuQUFaM0k0TmhUTGpiSWVTbE5JL1FoUnJ5UHBr?=
 =?utf-8?B?clBUQnZReXhoc1c0VzZqWHljajVHRmhUK0F5dHhzWlp6dnRDMGhreFZNZU14?=
 =?utf-8?B?NHJBZVg3eExqcCtOajBwWWZsVFJ0M3BGRUJNRGdzNSswOG9MN0c5KzJnWUpY?=
 =?utf-8?B?cktNaWpUWEx2VnZIcExjSGNJQXI0S0t3ckMrYVF5R29ZK1R5WjZ0UDYxZVFa?=
 =?utf-8?B?Ulc0K01aQmhsU1FKV2JWNXU0MFlJZW04c0ZnR21qYnhyUk15bGtnYUNJQ20w?=
 =?utf-8?B?MDlmU0FTdUJXWjNsZnFMTWVYZU0rMjFSTFptdU9mVHFZYTdMTFcrS2MvZGpR?=
 =?utf-8?B?WHVZSXFOdE1oTWpmbjBHOS9NSUhXclFoU0JXVDZNVHJRTFd1ZUcrdGJta2N3?=
 =?utf-8?B?ZlUrRWtkSXA0ckZHMHpCSStaR1dpelZpaEFJMFB6VDVBVzZaMG95VGdLa2Ey?=
 =?utf-8?B?MkhjRzBNbnJVaEx1Mk5WZkZYOGZMM0FiRlYyaWEvWWtoSXBTUE9hNUh5dWh1?=
 =?utf-8?B?S2tadHpXMWpMbXlaem4vWEFCTi9OV3UrYjlFYUgwSjVPSGx6b3kveGhvUDhl?=
 =?utf-8?B?MzB5ZUdWVll4eG8zaVNLTm80aVhOKzdLenNBL0gxR3h0dkcraHZpdTRxYWJK?=
 =?utf-8?B?a29CRnhaaGc3NUs2SW91L0dVK2lqV0VPYUlwbVNULzBCNVpkaXdPQTFCRmo2?=
 =?utf-8?B?K1dRdVozd0x5cHhDNlhwVFVHZjFpelpLMGl6NEJaUFBhV3pnRzdwQWMrVWRw?=
 =?utf-8?B?Y1NWRVFBWEc1RklHazkvQytZUjRja2pwZmxYRnBlVXVnRE1jb1dBU3c4dUh4?=
 =?utf-8?B?N2FwYzFOczJSM1BzUVN5L0U2bjEzN2tEb0ZKa2dqQm9sVWpxY0FsUTVZY09Y?=
 =?utf-8?B?OEFlR1dXVG9rT2dWajlJOTduMUQ5Z3c4SzR1aEp1MEdMTjZoQnVpR3RIeDMv?=
 =?utf-8?B?QkNqMk5ZdTVlN0V6TzJlSno5QThzV1BEcHlhbTBCcjFYRzYyTjJFQTQwSSs3?=
 =?utf-8?B?eVd4M1JvTGVERTVHbkxlMEZPUjUvS3VVQmxRRE80NWk2bFJYWGhGdU82Yng2?=
 =?utf-8?B?OHNRZ2ZNK25MNFZsZzVGVnVqSEU2b3BMTW9heEJLK2k0TVlHTVNHNTN5WnVF?=
 =?utf-8?Q?Nc4H/UraXSP1RJFx2o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0IwT2JyY1VHR3lJS0tSK3FDaUFoQ005QUIyckRNYXBhUUREZXpTd0lBWFk5?=
 =?utf-8?B?RDFHYzYxbGpYR2VyMGdwQmlIbVZRQ3NiOGFHVGcvakkzbnhlWXRKWFVtTzMy?=
 =?utf-8?B?VU1qMnFLTjNEc0JHb2tibjNGUXRrS25TVE1LNVk2REtsd1NlZTRoRmRVVmFp?=
 =?utf-8?B?SWFMMkVsVmV1elJxRjlpNGlucHlJZERKTTNtWTRERkRQdi9udXAzYWpXbmhK?=
 =?utf-8?B?UEw5UE9IV3pTRWxWVHVWUHUwb21nZC9hclpSQWx5OXN5dHpKMjY5R3V2T3Rv?=
 =?utf-8?B?b0NOWC93ZTVtWU8wSzA1UUU1STJIeE1NVFk0eTU4c3o1ZnlFaXdCU2xCVW1r?=
 =?utf-8?B?ZzNkVlFBZjRSZUlOeFZFOG1JZDhWbHlSRDNFVHU1YkhzaHJ4L21HR05OcEFq?=
 =?utf-8?B?N0NFV2dSbWpMRS9RUmY4LzMwL1UvT3JnZ00rNjdCdS80TEhqUzRuZnVjY0FF?=
 =?utf-8?B?bTJaUjZ6aTNib3JtWGIrR0NmL2VRRXhxY2VtTTlpbHluVGQ0eVp3WEM1cHlF?=
 =?utf-8?B?cytPa1lMVnJFTW16eEZBQzc0dVZyK1BDMzZNZUxBYndxZERsSHpDQzlNejNE?=
 =?utf-8?B?YW9yQzFScUljTnpNVnlHQTk0QzBpbVNvRERmVWdwWktKRTBSa0tiZWFQSUxV?=
 =?utf-8?B?b1ZPbFVOMDZOQzA2SDJBT1A0WmI0OUlPb2ZyaUdjKzFkTmN4dzZJc2tPU1pn?=
 =?utf-8?B?MEtGRG1EREZoend1MWE4dGlXT3dJc1czV0FCMWhQVHh2cE5CbkxsdTloSDBZ?=
 =?utf-8?B?WUl4VCtManAzOURJcjlJZTNJUFVFbXI0MGN6d0pmMmtwUU96VFhuczBUSmdY?=
 =?utf-8?B?NlV2SUZRVEt5S1BremJ2NnhYMjkwY1JXZG5WYmViUERoNWs2L2F0a3NBV3RD?=
 =?utf-8?B?ZmpydVJMNnhJVEs2RjZndHFIWDF3a1JFTlRUSnZWMndER3dTbUZEYmJscnUx?=
 =?utf-8?B?cUxiZ0hWcDBmUXkrUWRyNUhHbm1sN0RMbmF0b0hzSi8xTFBGRU1xOFhrS0dZ?=
 =?utf-8?B?MVVMaFQxMExVRS9UZm5SR3FOSEpUdDhGVTRnMmZGaTRiY05TdlYwTmlHRnVa?=
 =?utf-8?B?ZWwxNTRtOHhHdERyUjRPVG9uOFpyUTArUVpCeTdtTkpwazJSNi84bEI1cG1w?=
 =?utf-8?B?Uy9hbXNYZ1RwaXlMYXVDaG1wUGM1am8xTGNla1pPYVMyRGNsRklkMWVUUWVi?=
 =?utf-8?B?SC9TWjdyVTVYK1AxdEVYbDMxUGl6RWRldzFKSmpEOTN0UDRlWElPMUtNUWtp?=
 =?utf-8?B?NlNDNlE5MHhLMXNZZGVQQUhlU1NZbjJIUjk5NzdqVnMvVUY3UTdkTURDQjhE?=
 =?utf-8?B?dERGQnpHdm00RmcvZGk1OGc5MlV0Vkwxc2NDTm9aelRRUk44Q0JaZHkvSXZH?=
 =?utf-8?B?T3llT3plWkFsamlDbUdIYjdsbGdValhvcVAraE52dEhKRGpYcEpkVmVuMEph?=
 =?utf-8?B?aXhpN0J1dlFqRVJkaXlyUDJrS0h5SDlaZzhRMlF4cjZGcWJvVjNyUkpvclF0?=
 =?utf-8?B?MFJabWJmRlhRcFMwek1KV1VKcXozeFM3NmVxM2RJVC9lQkF0Tk5JQnZJODFq?=
 =?utf-8?B?ZzNoZEtxZGRDVHBENnh2b3dDTkc3cHpoZnhoZ1pCdHd1b0hKQkoxRmUvb1Bm?=
 =?utf-8?B?NzVZbXMwd2hNTS9yR1B0aEY5N29EN05TNlZLcEpPcDJrc3p0ZWN1REQrMmh5?=
 =?utf-8?B?MjNjdlhsSFJacnJnNXNFUUQ0SlRzM00yNDc1Z3JEYjl5SUIzalZrdk9oVS9Z?=
 =?utf-8?B?N0ZwRS9UUmNlUUF2TDNmQVZqa1hSa1grc2ZXN0ZPVTgwUGtNcXZRMmxDMGRm?=
 =?utf-8?B?VHlRMFNQVnFjVlhqeko5UHIrcUlqVVFMcDZIYVlSZkpRU3JhQVZoOWRLSXVF?=
 =?utf-8?B?R0U2M3dQSEZHekZaK2czb3FKN214L2prVzFOMFBNdkNtYkI5WnlhekZBY0lH?=
 =?utf-8?B?U25qa1oyK3l1RFB5Y1pQVURQYXhiY3JKd3R0Qmpjd0Q2aXhqQk5XT2szVnVD?=
 =?utf-8?B?MHVRM1pEZEJHdmVLa2Y2Q2E2QW82Z3pVbXJZQW0vTlJNbXJESXY4djAxWXdS?=
 =?utf-8?B?LzFTSE5pa3RYZExqOWVPSEVxQ3Mzc0k4bVNOb0c2REpTVGdUWFg1d1RIVWg2?=
 =?utf-8?B?aTVvY0RhWndZOFF0L285NEZvQXV0NHRFQXZhTTNDWHRjRGR1d0xyM09iMjZO?=
 =?utf-8?B?Q1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f59851d0-1e69-4320-126a-08dcec364238
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 09:54:56.3065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ncMj1fwOJScy3TfiPfh8BkNXwHGDVOEBmHyzawod7oZhVtGKSJBa6zVzVkwc4bBCD2ijRsKmclG+tdZoxLHdtqY72DXRAV09oZNq7qSFBAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12920

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxNCwgMjAyNCA4OjQ0IEFNDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjJdIGNsazogcmVuZXNhczogcnpnMmw6IEZpeCBGT1VUUE9TVERJViBj
bGsNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIE9jdCAxMSwgMjAyNCBhdCA2OjIw4oCv
UE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBXaGls
ZSBjb21wdXRpbmcgZm91dHBvc3RkaXZfcmF0ZSwgdGhlIHZhbHVlIG9mIHBhcmFtcy0+cGw1X2Zy
YWNpbiBpcw0KPiA+IGRpc2NhcmRlZCwgd2hpY2ggcmVzdWx0cyBpbiB0aGUgd3JvbmcgcmVmcmVz
aCByYXRlLiBGaXggdGhlIGZvcm11bGENCj4gPiBmb3IgY29tcHV0aW5nIGZvdXRwb3N0ZGl2X3Jh
dGUuDQo+ID4NCj4gPiBGaXhlczogMTU2MTM4MGVlNzJmICgiY2xrOiByZW5lc2FzOiByemcybDog
QWRkIEZPVVRQT1NURElWIGNsaw0KPiA+IHN1cHBvcnQiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEhp
ZW4gSHV5bmggPGhpZW4uaHV5bmgucHhAcmVuZXNhcy5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52
MjoNCj4gPiAgKiBJbXByb3ZlZCB0aGUgcHJlY2lzaW9uIGJ5IGRpdmlzaW9uIG9mIHBhcmFtcy0+
cGw1X3JlZmRpdg0KPiA+ICAgIGRvbmUgYWZ0ZXIgYWxsIG11bHRpcGxpY2F0aW9uLg0KPiA+IC0t
LQ0KPiA+ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jIHwgMTIgKysrKysrKy0tLS0t
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+
IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYyBpbmRleCA4OGJmMzllOGM3OWMuLmEx
ZTIyZDM1MzY4OQ0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpn
MmwtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+ID4g
QEAgLTU0OCw3ICs1NDgsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZw0KPiA+IHJ6ZzJsX2NwZ19n
ZXRfZm91dHBvc3RkaXZfcmF0ZShzdHJ1Y3QgcnpnMmxfcGxsNV9wYXJhbSAqcGFyYW1zLA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHJhdGUpICB7DQo+
ID4gLSAgICAgICB1bnNpZ25lZCBsb25nIGZvdXRwb3N0ZGl2X3JhdGU7DQo+ID4gKyAgICAgICB1
bnNpZ25lZCBsb25nIGZvdXRwb3N0ZGl2X3JhdGUsIGZvdXR2Y29fcmF0ZTsNCj4gDQo+IFdoaWxl
IHRoZSByZXN1bHRpbmcgNjQtYml0IHZhbHVlIGZpdHMgaW4gZm91dHZjb19yYXRlIGJlY2F1c2Ug
dW5zaWduZWQNCj4gbG9uZyBpcyA2NC1iaXQgb24gdGhlIHRhcmdldCBwbGF0Zm9ybSwgSSdkIHJh
dGhlciBwbGF5IGl0IHNhZmUNCj4gKHJldXNlISkgYW5kIHVzZSB1NjQgZXhwbGljaXRseS4NCg0K
T0sgd2lsbCB1c2UgdTY0Lg0KDQo+IA0KPiA+DQo+ID4gICAgICAgICBwYXJhbXMtPnBsNV9pbnRp
biA9IHJhdGUgLyBNRUdBOw0KPiA+ICAgICAgICAgcGFyYW1zLT5wbDVfZnJhY2luID0gZGl2X3U2
NCgoKHU2NClyYXRlICUgTUVHQSkgPDwgMjQsIE1FR0EpOw0KPiA+IEBAIC01NTcsMTAgKzU1Nywx
MiBAQCByemcybF9jcGdfZ2V0X2ZvdXRwb3N0ZGl2X3JhdGUoc3RydWN0IHJ6ZzJsX3BsbDVfcGFy
YW0gKnBhcmFtcywNCj4gPiAgICAgICAgIHBhcmFtcy0+cGw1X3Bvc3RkaXYyID0gMTsNCj4gPiAg
ICAgICAgIHBhcmFtcy0+cGw1X3NwcmVhZCA9IDB4MTY7DQo+ID4NCj4gPiAtICAgICAgIGZvdXRw
b3N0ZGl2X3JhdGUgPQ0KPiA+IC0gICAgICAgICAgICAgICBFWFRBTF9GUkVRX0lOX01FR0FfSFog
KiBNRUdBIC8gcGFyYW1zLT5wbDVfcmVmZGl2ICoNCj4gPiAtICAgICAgICAgICAgICAgKCgoKHBh
cmFtcy0+cGw1X2ludGluIDw8IDI0KSArIHBhcmFtcy0+cGw1X2ZyYWNpbikpID4+IDI0KSAvDQo+
ID4gLSAgICAgICAgICAgICAgIChwYXJhbXMtPnBsNV9wb3N0ZGl2MSAqIHBhcmFtcy0+cGw1X3Bv
c3RkaXYyKTsNCj4gPiArICAgICAgIGZvdXR2Y29fcmF0ZSA9DQo+ID4gKyAgICAgICAgICAgICAg
IChFWFRBTF9GUkVRX0lOX01FR0FfSFogKiBNRUdBICoNCj4gPiArICAgICAgICAgICAgICAgKChw
YXJhbXMtPnBsNV9pbnRpbiA8PCAyNCkgKyBwYXJhbXMtPnBsNV9mcmFjaW4pIC8NCj4gPiArICAg
ICAgICAgICAgICAgcGFyYW1zLT5wbDVfcmVmZGl2KSA+PiAyNDsNCj4gDQo+IFNob3VsZG4ndCB0
aGlzIHVzZSBtdWxfdTMyX3UzMihFWFRBTF9GUkVRX0lOX01FR0FfSFogKiBNRUdBLA0KPiAoKHBh
cmFtcy0+cGw1X2ludGluIDw8IDI0KSArIHBhcmFtcy0+cGw1X2ZyYWNpbikpIGluc3RlYWQgb2Yg
YSBwbGFpbg0KPiBtdWx0aXBsaWNhdGlvbj8NCj4gU2VlIGFsc28gdGhlIGNvbW1lbnQgZm9yIG11
bF91MzJfdTMyKCkgaW4gPGxpbnV4L21hdGg2NC5oPi4NCg0KT0suIFdpbGwgdXNlIG11bF91MzJf
dTMyKCkuDQoNCj4gDQo+ID4gKyAgICAgICBmb3V0cG9zdGRpdl9yYXRlID0gRElWX1JPVU5EX0NM
T1NFU1RfVUxMKGZvdXR2Y29fcmF0ZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFyYW1zLT5wbDVfcG9zdGRpdjEgKiBwYXJhbXMtPnBsNV9w
b3N0ZGl2Mik7DQo+IA0KPiBVbmZvcnR1bmF0ZWx5IHdlIGRvbid0IGhhdmUgYSBoZWxwZXIgbWFj
cm8geWV0IHRvIHJvdW5kIHRoZSByZXN1bHQgb2YNCj4gZGl2X3U2NCgpLCBzbyB5b3Ugd2lsbCBo
YXZlIHRvIG9wZW4tY29kZSB0aGF0IChmb3Igbm93KS4NCg0KQXMgcGVyIFsxXSwgcm91bmRfY2xv
c2VzdCh4LHkpIHdoZXJlIHggaXMgdTY0IGFuZCB5IGlzIHUzMg0KDQpJbiB0aGlzIGNhc2UgbWF4
IHZhbHVlIG9mIHggaXMgMzAwME1IeiA8IDJeMzINCg0KYW5kDQoNCnkgPCA1MA0KDQoNClNvLCBk
byB3ZSBuZWVkIG9wZW4tY29kZT8gQW0gSSBtaXNzaW5nIGFueXRoaW5nIGhlcmU/DQoNCg0KWzFd
IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjAtcmM0L3NvdXJjZS9pbmNsdWRl
L2xpbnV4L21hdGguaCNMMTAxDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPg0KPiA+ICAgICAg
ICAgcmV0dXJuIGZvdXRwb3N0ZGl2X3JhdGU7DQo+ID4gIH0NCj4gR3J7b2V0amUsZWV0aW5nfXMs
DQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMg
VG9ydmFsZHMNCg==

