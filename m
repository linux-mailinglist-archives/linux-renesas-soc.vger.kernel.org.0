Return-Path: <linux-renesas-soc+bounces-25027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E81E9C7D1DF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 14:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C06F44E489C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 13:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D753F213E7A;
	Sat, 22 Nov 2025 13:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="otkz5R45"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357C5219E8;
	Sat, 22 Nov 2025 13:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763819346; cv=fail; b=EkkNf838s7nUfkgSWq4mNCPAVni2MGi/z4xCe0mzs22FFWIOuyKu5kIbTwJjK3yG1dU6KSrpJ0kgsfE8tZFHZk8hbt9At2RwXSZy3vg7MIjetH2QyEqW+ZO2QVipu1eZbBs4Q+wBl9g1f5fpihi8EYR9YCi4AUtakGHVcx0k2oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763819346; c=relaxed/simple;
	bh=mYy+Fx6TxHhdKhfcbhskHqH5DdvHW5nixIzg0PBf1oA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oefatPOLAS/HljElvK8eajlC+wsn1jo1/Lnkf72uELQ+KxaOXbloOgx9EYjJ8rcI/lsef6gHtd3xp+0ch9anumw0DRlBGa+a05WrfQQ/27gx/wDkUw0eRcvqoYr0mum1k9qkRBFLmtAnwg+CREJs06Xv8TNncSJH+sPXFWj1gnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=otkz5R45; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/4giXfAgP5MXeMzdy+W8uRz9P7lJQ0IHT/gntsIff2aaIrQ90WDrPjdrWw5t+y+fHi1l8PTv5/SUt/WyKUYJHqaSJ3an29KIPFjqUvO666HZfQpcEbDHHhurf1e1kIvs0zag1R6D4FNj5yxNFvZ52oJLDRsunHiZSEdBTJACPoppUpW7Ft3tgkuiRMp4S3UjX5X5Htni0WjLK+6BuszxUiN7iZRDEB4Pb38nTam4dA3Hr5tNicl9jL9VVHg8GNGt9NkL+xEBmHuzkBCqiMyq3TpyhnSsMAP/RIe1KmJPBw6iofuVIIYB8O3dbns5mKpnJpU9Z7mVcbO9z2X2RFV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYy+Fx6TxHhdKhfcbhskHqH5DdvHW5nixIzg0PBf1oA=;
 b=haJf3BX1J2aveRsGrQQhe6ruWFc4ss+QZTIaWiNLWBX0XXt26xpzj9LeLMe9r8O26cec8NeinG5LKrFM4HCPUWhz1XxHcHvcAbD9l9F5K308wx+qdUkBMnLcE04BTuycWVdD0hCuiRzARqIFbM4TLBkmghpvB7EDCO9N/YWoMX45/M/3OmWCoO+idAB7yLM+3lXVRHm///7oxi59mpYzEUgrqJRTNY37zvbggllWSwOU1S1XKeJPmb7A21VHj6QNhotvRrxnepUIYQ4b9d9w7a0TKVAy5dD4UX5TZWOUzBSWCxO8VQQa+LW5HadvS4K3R2T7pFwex6lqlS5Zs9Tgqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYy+Fx6TxHhdKhfcbhskHqH5DdvHW5nixIzg0PBf1oA=;
 b=otkz5R45smYIzNhtq/YJNpcy8DdNG+awlpcYsC4UI4iVYalIOt3tUeqr69GBHjBNko7HRpROSDCeSB8b66NRYaBVEgWwtxhli6tdNkRyNH8n5pO5ujTWdmtAFbRle6HX+2COHQgij//OjTWu2JpMDnoP8tZ90UJJ9ejHYkk7VLI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7073.jpnprd01.prod.outlook.com (2603:1096:400:c0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.7; Sat, 22 Nov
 2025 13:48:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9366.005; Sat, 22 Nov 2025
 13:48:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v3 01/13] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Topic: [PATCH v3 01/13] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Index: AQHcVVS6OMCUOoA+JkaffOYYEa9gA7T9XSMAgAFhEuA=
Date: Sat, 22 Nov 2025 13:48:59 +0000
Message-ID:
 <TY3PR01MB11346D401362BE3B37564C28586D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdX41rq-sd6_g1oCrQVPpgb-MXakpJ9mEbS0K+FY8Q7NDg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX41rq-sd6_g1oCrQVPpgb-MXakpJ9mEbS0K+FY8Q7NDg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7073:EE_
x-ms-office365-filtering-correlation-id: 40f3c7fe-a00f-4d43-f6f6-08de29cde351
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1EvMmV1OHhRQTM2dDJyRnJPenlkUWxPenNoQnljQlhFamVuU0JXY241eVdH?=
 =?utf-8?B?elhmd2hodGczNWpuSHNvaURRN3d1Z0NiajRjSURXWG5OcVhFZEQ4Um5FYmQ2?=
 =?utf-8?B?SWM3TnVqSGFyVkhOeEpSeExKVGpFd0JtSnZiZ1p0azF5TFUvQkM0a0pTanRm?=
 =?utf-8?B?emtFUms2YmdRcUNpM3J1eWE1OThYVGEvUysxTDY5cmRoQi9KMlhBODl0N2Ux?=
 =?utf-8?B?cUtVR1hDZVJMTk1kL3RmUE4rOVlsT0RtbnVvei9Fc1JpdUU4MmR1WjhDUlR0?=
 =?utf-8?B?b2FDQnQ4K3lvMzNpazM0WWk1eWZiSGUyUTBJLy85Wm04WmRDVEUvbHhZSTU5?=
 =?utf-8?B?cFJSUmFNMTZ1TUFla29xR2p4eWxOaVE0cUdMLy9jK1BHeGF0OHFPVG93aVc4?=
 =?utf-8?B?NmdFUFlKZUFua2FFU1ZOc2p1TThwRktFbEs3cEdSbndWVFY5cmhMWFpPdjlS?=
 =?utf-8?B?UCtMcTM1REgzOXBXOXBncW96MlVKZ3V0K0NmWGQ3U2xUMlBWbVFNY0pianFs?=
 =?utf-8?B?eDBCLzdHZmUzWWh3UXNDQ2kvckpMYWNUUVRYQnNsYjZrdnl4cU1sOWRwUlpN?=
 =?utf-8?B?ejFRZlZZWHNvOGxMQXRiaWdHcHFRZ0FXR3NnSFVZQjRsNzAySGpweXhHV1dY?=
 =?utf-8?B?RldiK2QwbXhSZDRtZHRacUNTS0ljbVBQOVpvMmY5c2Jrb3VxVkdMQWFvRk1O?=
 =?utf-8?B?U3hXSGdJaUtSQklYTFREUWFyQ1kwMHE5QUxpTm4wU29rZ0xoNFNaemg3ZGx4?=
 =?utf-8?B?czQyeEV5Tk9vc1o2M0x5bG5MV1M5RnkxTlFzbmkyMmhxV2FsRG13ODJJMWs5?=
 =?utf-8?B?ZXFQWmVyYXhyeThGTUdKckFudXJoZ1VjeC9vVk5zMllpTFhyUGdqekVjeElW?=
 =?utf-8?B?NWxOa1hENjU1dXpqVkJTSHl2cWVSR2RoTEVHdytQZmdrUW9sdDNsV0EwWm1u?=
 =?utf-8?B?akYwUG9RZ1Zwa2hXa0UrOEl2TEZ6Mzg4S2tMaXF4U1RxVTh4RkRSZXN0enFv?=
 =?utf-8?B?bFh6ZnZhRmx0L2xyeVk4SFZzWVR5emVYYWVSYVJzaEl0SVR6WG16Vk4wdHRo?=
 =?utf-8?B?VStCclA4eS91bVJCSTNVcC92NUpZRWp2c3JlT2k3aXdTM3BWR1UwNjdhVmpy?=
 =?utf-8?B?REhORzl1Wmd2T2FCb0szVVorSllETXArY0FGa0d1SHZsaVg0YU9CNlEzbEpa?=
 =?utf-8?B?UzJvRncvMlZ1bzlvMHVheURXRFkreC9pdERMNWhPWis5WlNCbm8zbSt2ODRF?=
 =?utf-8?B?dmtWbVlJY1pFZ0pDbnVLZTRSYjNJTGJqMHdTWkhvc24rSnJCb0tNUkUxMDlm?=
 =?utf-8?B?K3NJNVNCcUoza053UDM5Vm1EY2JwaFZYaXgycXZGWGJjcm1qTzJqZ1h0YlhU?=
 =?utf-8?B?SENrRmpEdGtKNVNBc2FlRm42MnVDcU13NUI1bmxSQ1ZneWl1SFpjMHVLZG54?=
 =?utf-8?B?K08wVHlNTHhNNUNaSW1FR2lqT0twL01yaWU5alNJOUNoSUd3ckV5WGJtSExk?=
 =?utf-8?B?WHhmWjNaWFFteGxHK3pMNXBoWUh0TEZST3grQTVqR1Y5Yzdrc1B3UThkUkdH?=
 =?utf-8?B?U0RpeUp0ZVZ4bzNJMEdlQUdTZVJoYTZmY2Q2SlBvS0JXV3lzYXRtQWlYTDdq?=
 =?utf-8?B?SjlzRC9ZM1FtT1BDdHFsMFhHSU13YXNmcEtHRjFwY3FhUlpDWmF4OHNxVUFT?=
 =?utf-8?B?NEdGcEM5MERmN1R1a1kwR05wQWFhSlZLcWpNSTFuSC9WcDl1Z0QvZGpSdlFZ?=
 =?utf-8?B?KzJ5U0FRelFiUFdRUTZwRVBFa3h4WldTcS9UWGw1N1R2Smo3aW9UZUlWdHpW?=
 =?utf-8?B?Z3ZuVHdpa0w5RTRJOVdOOEFReG5PUGZmYjVtcU9INmdmMkRPdmN2dHZjekFh?=
 =?utf-8?B?blhUSDNNMXgvVlh3bERENFZUOTBrYkN2NEpTc1R1RjYwMktrVDhvWFhwUUtF?=
 =?utf-8?B?TFpxUElyeGNMcGV5clA5bFo2QkxRTVRhaVhnMGNzMGRQdFdCUDZqVUVQTitN?=
 =?utf-8?B?eHNUSy9WMElRVzJzY2pzK2hFTTFSZHNvNVAzSnF6dmFrcjVNTElkYXlXbXhV?=
 =?utf-8?Q?mAbTsS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkZSWkNFMG5PdWMvNndFNlAzSmNvN2l5SHVtWUMvdDRCbE9yaHdQVzRWL3dp?=
 =?utf-8?B?TDBDSEV6b25EQ25uWkNzd0NiVEpUZk5oNWIvRkJaTS9tV3EyL1l2bHRzU25V?=
 =?utf-8?B?cktJaWNuMnNGODU2UXluMmJCREpCQVB5UUEwalBqOE4wQldpbkZ5bXR3OFh3?=
 =?utf-8?B?c3FCb2tFWnNwWlJSQnJTQjRXZ2ZRZkJGc0ZmdmYyV1pSY3h2WkpYMGV4bDl4?=
 =?utf-8?B?UDlsV1puWUptM1pBUWhmMmoyZWV0Y0o1amZPR0g0NWdyZ2lMM3UyTThQRzc1?=
 =?utf-8?B?M00zNmtaamFtQjBSaDVzOVdhSXlMakxvK0VNZi9zOFJsTkxybDFaR1FIYytI?=
 =?utf-8?B?Qnd4L2pObFBWazZoRGIra2ljWW1YUS8vZitYTjl6Q0lpYU5kR2F5eVJlL3lr?=
 =?utf-8?B?N2N2NlVnRSs3TjJOcVFFME0reTBKR1lNd3JhcjhQMm01bVo2cmFxcEVWOEVu?=
 =?utf-8?B?bURYQUxYeWFJK2drVFp2ZStBNXlWd2dGTVdKQkhZZDNoZmgwZVc2K0lqR21V?=
 =?utf-8?B?WkFOc0IzR3ZQRHN3VWNFdFJxT2l2TU8zUXpLbGR2SXYwNHZQa2ZjTy9RUDMw?=
 =?utf-8?B?UTRnbGoyRkpaVFVVOHQ2YmdxWkVLdkFJS1BOOEJCOGhELzViaWtSOU5tV00z?=
 =?utf-8?B?UDFUcG9ab0d6QzB6ZkZvNFYvSTlyYXNRdkt0WWQvQmVITEhWQ1hjMzlhb3Zj?=
 =?utf-8?B?Sy9DS1hURzJ3dmtGYkJUS1JLb0NqeWJ5MmVjTHVoby82SlRHTEVWdW9UdjZJ?=
 =?utf-8?B?UTEwaWNGRkladGY0QVBWSkJGVU0rdkFER1NEbHh1MlJzejJTZC9NSEMxVjVi?=
 =?utf-8?B?eG5qbDViUExKcVVMMlJmcFlEVkVvZHdwMml6VnZqUEhsMEJmT3FUT3BENGox?=
 =?utf-8?B?NUk2enRvdEFsK1BpTmcxRy9FRVJicURiVG96TFlGVWNWMytUN1ZGSmNpY2Nw?=
 =?utf-8?B?UnY5YlNZT2U2MGdHdlZ6bHNiejdjdnhkZkVQT3lrS3hpeC9rVkxqcGpWWlhQ?=
 =?utf-8?B?cjE1TWZuVjlSSmtJUTZJQWkzd2g0cTI4L2FmVXFVYmV3cG4xSUJoQkpwMkRG?=
 =?utf-8?B?UmJiMWFEQ1p4L3dEQndrb2NscDZlcXNVbnpZZ0UzUFcwL0ZXMWNWWnhmWnpj?=
 =?utf-8?B?ejZrTE5FN0Z6T1NiK2JYUGFOYm0xNFRBOXpaQWFwWHVpZG10azV2SVhGVUNH?=
 =?utf-8?B?M3BEYVpMcE5IcVpZMFh4a3lndEFMS2FGQmx4OFoyRFRIU0ZkYmFxNzBmZFdy?=
 =?utf-8?B?OHg3V3JDUzNVSkhUOGZjZnRkOS9NWmpOSWE2R0x4c002VUxDSHRheUh4Skxi?=
 =?utf-8?B?ODhEMFJ3NG12emdGcnQ1N2RPWkVMSEYrSjVrQXRxOUZDNjRHT3Zod0M4ZTlZ?=
 =?utf-8?B?YzlVeWVtdUt5M1NCK1UrUkdXNThiOG1PYlRkUDMvM3NzbE40ZE16NmprU2Rk?=
 =?utf-8?B?SmtvS0FsMld6NEE2ZzRQTUJXTFNCOFU2U1JZRVVUZnVwdnlIUWpNRHExQStj?=
 =?utf-8?B?VU5nKzE4WXhHbjZpdmVPSGs3bEVKeTBhVkdhc05Qa1Znbk5rQXIxQXpHL0dz?=
 =?utf-8?B?ZEpIaWxKajZYTXBzQU1RTnI0c2cxMXZJV2hzWTRuZDhSdTEzTmo2QlFIbjJr?=
 =?utf-8?B?QXlNZzgwWTVpK3p1OVZYckxuQnB0aG1vTFowNFNIVDNqcmRIbkFyTGplVDBB?=
 =?utf-8?B?UVMxajc3SHBUSElkaWtQVG1uK2RMN2l2cHptRk53TWh0aWhadDhmOWN6UGg5?=
 =?utf-8?B?bExwOEJ0aTdIdVFiVFNLVUlacmtmNFpGZ2g4c0pRejhacEM2bVg2OEpMdHpu?=
 =?utf-8?B?emdJR3p2VzNkenNjRERBYm9hNHR3ajZRbzA5Y3RuZ1lzRS95M2hrTU9vSFAx?=
 =?utf-8?B?TDJISjAxNHgzMUlET2ZtYWRRSVVPQWxveWVqQXdDWnNHSGQ5VTVnbDZTT2Ft?=
 =?utf-8?B?QTdkajBndXJobE56SXNaY29PbjBnUmJkSloyK0c5RTVrdFNNK2d6UWwwRzli?=
 =?utf-8?B?WHNoNXBJRmxBT1VuaWdLVG83YTJDRm80Y1dXNUhsNFU2STR3MGJpdllEbnlr?=
 =?utf-8?B?MVkrVUcwZHF0WDlKRXVMdUlKZkFBMU54ZjNhcmlOa09tSVlBamhhcVN5ak8v?=
 =?utf-8?B?a0lVV0NaL1lMMlFMWWMzblhJbHBzRmQ4SmZ3MjZ5UkFCQmtxbFU5L0k5NzdM?=
 =?utf-8?B?c2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f3c7fe-a00f-4d43-f6f6-08de29cde351
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 13:48:59.1615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jFzlg8w7KhZ1tiqSs5BXmhuFqeef5OGwWVp9YktHXfFCIW1azvDjdz7mmdaPxs9uERkt+G5TLL8PYzn7X8tlfO+RQ7KAg85v0XORZ9N1h6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7073

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIxIE5vdmVtYmVyIDIwMjUgMTY6MjkNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwMS8xM10gZHQtYmluZGluZ3M6IHNlcmlhbDogcmVuZXNhcyxyc2NpOiBEb2N1bWVu
dCBSWi9HM0Ugc3VwcG9ydA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgMTQgTm92IDIw
MjUgYXQgMTE6NTIsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJv
bTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gQWRkIGRv
Y3VtZW50YXRpb24gZm9yIHRoZSBzZXJpYWwgY29tbXVuaWNhdGlvbiBpbnRlcmZhY2UgKFJTQ0kp
IGZvdW5kDQo+ID4gb24gdGhlIFJlbmVzYXMgUlovRzNFIChSOUEwOUcwNDcpIFNvQy4gVGhlIFJT
Q0kgSVAgb24gdGhpcyBTb0MgaXMNCj4gPiBpZGVudGljYWwgdG8gdGhhdCBvbiB0aGUgUlovVDJI
IChSOUEwOUcwNzcpIFNvQywgYnV0IGl0IGhhcyBhIDMyLXN0YWdlDQo+ID4gRklGTyBjb21wYXJl
ZCB0byAxNiBvbiBSWi9UMkguIEl0IHN1cHBvcnRzIGJvdGggRklGTyBhbmQgbm9uLUZJRk8gbW9k
ZQ0KPiA+IG9wZXJhdGlvbi4gUlovRzNFIGhhcyA2IGNsb2Nrcyg1IG1vZHVsZSBjbG9ja3MgKyAx
IGV4dGVybmFsIGNsb2NrKQ0KPiA+IGNvbXBhcmVkIHRvIDMgY2xvY2tzDQo+ID4gKDIgbW9kdWxl
IGNsb2NrcyArIDEgZXh0ZXJuYWwgY2xvY2spIG9uIFJaL1QySCwgYW5kIGl0IGhhcyBtdWx0aXBs
ZSByZXNldHMuDQo+ID4NCj4gPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxyc2Np
LnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFs
L3JlbmVzYXMscnNjaS55YW1sDQo+ID4gQEAgLTEwLDE3ICsxMCwxNiBAQCBtYWludGFpbmVyczoN
Cj4gPiAgICAtIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+
ID4gICAgLSBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNh
cy5jb20+DQo+ID4NCj4gPiAtYWxsT2Y6DQo+ID4gLSAgLSAkcmVmOiBzZXJpYWwueWFtbCMNCj4g
PiAtDQo+ID4gIHByb3BlcnRpZXM6DQo+ID4gICAgY29tcGF0aWJsZToNCj4gPiAgICAgIG9uZU9m
Og0KPiA+IC0gICAgICAtIGl0ZW1zOg0KPiA+IC0gICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxy
OWEwOWcwODctcnNjaSAjIFJaL04ySA0KPiA+IC0gICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxy
OWEwOWcwNzctcnNjaSAjIFJaL1QySA0KPiA+ICsgICAgICAtIGVudW06DQo+ID4gKyAgICAgICAg
ICAtIHJlbmVzYXMscjlhMDlnMDQ3LXJzY2kgIyBSWi9HM0Ugbm9uIEZJRk8gbW9kZQ0KPiA+ICsg
ICAgICAgICAgLSByZW5lc2FzLHI5YTA5ZzA0Ny1yc2NpZiAjIFJaL0czRSBGSUZPIG1vZGUNCj4g
DQo+IEkgY2FuJ3QgZmluZCB0aGUgbm9uLUZJRk8gcG9ydHMgaW4gdGhlIGRvY3VtZW50YXRpb24/
DQo+IERvIHlvdSBtZWFuICJTZWxlY3RhYmxlIHRvIDEtc3RhZ2UgcmVnaXN0ZXIgb3IgMzItc3Rh
Z2UgRklGTyI/DQo+IElzbid0IHRoYXQgc29mdHdhcmUgY29uZmlndXJhdGlvbiBpbnN0ZWFkIG9m
IGhhcmR3YXJlIGRlc2NyaXB0aW9uPw0KDQpCYXNpY2FsbHksIGl0IGhhcyAyIG1vZGVzLiBGSUZP
IG1vZGUoQ0NSMy5GTT0xYikgYW5kIE5vbi1GSUZPIG1vZGUgKENDUjMuRk09MGIpLg0KRE1BQyBj
YW4gYmUgdXNlZCBvbmx5IGluIEZJRk8gbW9kZSBhbmQgdGhlcmUgYXJlIHNvbWUgaGFyZHdhcmUg
ZGlmZmVyZW5jZXMNCmJldHdlZW4gdHdvIGFzIEZJRk8gcmVnIGJsb2NrIGlzIGFwcGxpY2FibGUg
b25seSBmb3IgRklGTyBtb2RlLg0KDQpJdCBoYXMgdG8gYmUgYSBkdCBwcm9wZXJ0eSBhcyBiYXNl
ZCBvbiB0aGUgZW5kIHVzZXIgdXNlIGNhc2UgdGhpcyBJUCBuZWVkcyANCnRvIGNvbmZpZ3VyZWQg
ZWl0aGVyIGluIEZJRk8gbW9kZSBvciBub24tRklGTyBtb2RlIGZyb20gdGhlIGJvb3QuDQoNCkl0
IGhhcyB0byBiZSBlaXRoZXIgYSBjb21wYXRpYmxlIG9yIGEgYm9vbGVhbiBwcm9wZXJ0eSAicmVu
ZXNhcywgcnNjaS1ub24tZmlmbyINCk9yIHNvbWV0aGluZyBlbHNlDQoNCldoYXQgZG8geW91IHRo
aW5rPyBQbGVhc2Ugc3VnZ2VzdC4NCg0KPiANCj4gPiArICAgICAgICAgIC0gcmVuZXNhcyxyOWEw
OWcwNzctcnNjaSAjIFJaL1QySA0KPiA+DQo+ID4gICAgICAgIC0gaXRlbXM6DQo+ID4gKyAgICAg
ICAgICAtIGNvbnN0OiByZW5lc2FzLHI5YTA5ZzA4Ny1yc2NpICMgUlovTjJIDQo+ID4gICAgICAg
ICAgICAtIGNvbnN0OiByZW5lc2FzLHI5YTA5ZzA3Ny1yc2NpICMgUlovVDJIDQo+ID4NCj4gPiAg
ICByZWc6DQo+ID4gQEAgLTQyLDE0ICs0MSwzNiBAQCBwcm9wZXJ0aWVzOg0KPiA+DQo+ID4gICAg
Y2xvY2tzOg0KPiA+ICAgICAgbWluSXRlbXM6IDINCj4gPiAtICAgIG1heEl0ZW1zOiAzDQo+ID4g
KyAgICBtYXhJdGVtczogNg0KPiA+DQo+ID4gICAgY2xvY2stbmFtZXM6DQo+ID4gLSAgICBtaW5J
dGVtczogMg0KPiA+ICsgICAgb25lT2Y6DQo+ID4gKyAgICAgIC0gaXRlbXM6DQo+ID4gKyAgICAg
ICAgICAtIGNvbnN0OiBvcGVyYXRpb24NCj4gPiArICAgICAgICAgIC0gY29uc3Q6IGJ1cw0KPiA+
ICsgICAgICAgICAgLSBjb25zdDogc2NrICMgb3B0aW9uYWwgZXh0ZXJuYWwgY2xvY2sgaW5wdXQN
Cj4gPiArDQo+ID4gKyAgICAgICAgbWluSXRlbXM6IDINCj4gPiArDQo+ID4gKyAgICAgIC0gaXRl
bXM6DQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBidXMNCj4gDQo+IEZpZ3VyZSA3LjMtMSAoIlJT
Q0kgQmxvY2sgRGlhZ3JhbSIpIGNhbGxzIHRoaXMgInBjbGsiLg0KDQpPSy4NCg0KPiANCj4gPiAr
ICAgICAgICAgIC0gY29uc3Q6IHRjbGsNCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHRjbGtfZGl2
NjQNCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHRjbGtfZGl2MTYNCj4gPiArICAgICAgICAgIC0g
Y29uc3Q6IHRjbGtfZGl2NA0KPiANCj4gUGVyaGFwcyByZXZlcnNlIHRoZSBvcmRlciBvZiB0aGUg
bGFzdCB0aHJlZSwgZm9yIHNpbXBsZXIgaGFuZGxpbmcgaW4gdGhlIGRyaXZlcjogZWFjaCBzdWNj
ZXNzaXZlIGNsb2NrDQo+IGRpdmlkZXMgYnkgZm91cj8gICh5ZXMsIEkga25vdyBTQ0lfRkNLIGlz
IG5vdCBpbW1lZGlhdGVseSBmb2xsb3dlZCBieSBTQ0lfRkNLX0RJViogaW4gdGhlIGRyaXZlcikN
Cg0KT0ssIHdpbGwgcmV2ZXJzZSB0aGUgb3JkZXIuDQoNCkNoZWVycywNCkJpanUNCg==

