Return-Path: <linux-renesas-soc+bounces-15975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A59A89657
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 10:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59EC71896CA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 08:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A49241CA2;
	Tue, 15 Apr 2025 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BVHyeSwc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F18203706
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Apr 2025 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705128; cv=fail; b=E/qkURBBmUwIDeNNRDb4gl+RTdPrCz3jP+KK4uJF7DVYy6qlyOtVCvO17Rzn8H56E46SxABCzkQBJtt/KzHb6QI/xT/SDyrHEr0izaQ2mDDDg32PQeJ6Y8/pm5ISiMeS0G3gXg4HnZtbuygCvZYO05vAduOct7//DvSBd9JrT58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705128; c=relaxed/simple;
	bh=Xtq/DCiNHqR9tO6S9qt/K0TXhz5rU2TRE5tJsIVc8lI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SThTq+Y6F45wIpURIKEXmOBkKFgnUobNcARdyEUdluMcYa2bNbKJIeBm6m2pcst5hjaodUG5WHs7n4ZfWiPAFmSlLSLS0h2W9Ue8AeINKrpeuvOsw3ZENIVTcUdPQMb0NgUQcY1XpYoTwrTJKfV81l3h+t/tYi4Jy3mtvENQfI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BVHyeSwc; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZ9OuPEe+C5SruM6Bni09lcGvNYiKDbq5dLx3wcDLk3dfq5Gaa4jp6Wrp+mvPLTNCel0m32ZbAdwWDprXLtenPJndl/miOTP1r3w5Z5Udj+SHUsaeBPwYezTZdOQO2bpwFMpH1vzio5sR6Va9U3Lnn/zLcRsrrGspU/zu9obIenF/DvFb9nquyMn9n/VMZiedD91AI2JwhSvVRJvYZHerVZ2knT/E977tEKjy1ZPobJeARKMk4qVoY00b3YQf6ubzJT+KTNBlRBPH4XVL3TOUD9UP4WG/lIPlsfsoM6pCH3vwJSiGBy9xjScGkckI/x9oCYXpWiTPr59XtNR85OaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xtq/DCiNHqR9tO6S9qt/K0TXhz5rU2TRE5tJsIVc8lI=;
 b=v52l3cPWtvzNqXbrHwLIdcAX2o7HRfFyCMFHzZhnkWDviXbHu69dB8T0yEY+OtvpvDrizzDba1Pb6kUOXQitkW1zcYXauDzeXsrKJ+D/xA6FUxGA0UUKnUtRUW9wQb2tonk+kJAL4sLRNTsexdV8+TRacRs0mUHuLNcNQaO67y0FBelrTmdKnFYOEWG96JlSBfVSP8HIIPQZtV73BElayzjTNkFJmHqH/lHeX0KSfZk0Lm+NdvLm8cNHekF0OTaXMg0NljxFOx8o8K0zi2TL6lE5UiHNqnvGc0jjERBlizeC6BE6PmVFsHSNSpZfCbpeEu1SNr9PXa3UtRp+GiH5Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xtq/DCiNHqR9tO6S9qt/K0TXhz5rU2TRE5tJsIVc8lI=;
 b=BVHyeSwcDDiJr1ckBfLPK5bdjBUdzhYAaQXeQK0p7HOp1ok/fMhBHx2Zodml3sUrOUDakCOcyWSI5x4IChQtSeZHcUjFcQGzAVr2cmQtCArBF6Hp5U6KM5SXTZZtAOHPM43a4aa769oTwTzGnhQqBjq7rqVFtZ44eciokdLzfD8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11963.jpnprd01.prod.outlook.com (2603:1096:400:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Tue, 15 Apr
 2025 08:18:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 08:18:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Mark Brown
	<broonie@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 8/9] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Thread-Topic: [PATCH v4 8/9] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Thread-Index: AQHboxNq+vOBM26H0kW0upLY2qpCg7OkVcsAgAAhXEA=
Date: Tue, 15 Apr 2025 08:18:38 +0000
Message-ID:
 <TY3PR01MB11346B9A3EEDA10AC78E372FE86B22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250401143537.224047-1-biju.das.jz@bp.renesas.com>
 <20250401143537.224047-9-biju.das.jz@bp.renesas.com>
 <2e8723a1-ec3f-4a0e-9c9a-9657b025799e@kernel.org>
In-Reply-To: <2e8723a1-ec3f-4a0e-9c9a-9657b025799e@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11963:EE_
x-ms-office365-filtering-correlation-id: da37004b-2ee7-4981-de65-08dd7bf61ffc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YUo5cjBWWEl3eFhNNnh2NDMrZ0p0dkUrdThlWVliUnYxaUt6MGNaeVZrLzZP?=
 =?utf-8?B?ZEJNSk9nN0hrLzJ1ZHRkYlpKOUx1SkR2cFZUVmYwNzY1bS9DN3kyQVpPeThP?=
 =?utf-8?B?Umc1c1VOSExzQnd0TmJZV1lvK0lwelhJRVpYUUluTk15OXF4VFA1RUN3N3ZQ?=
 =?utf-8?B?MU5ZUklkN1ZkMHJ6a3YxTXNKeit3N2o0K2NVTzZJam56US9zbkdJOVlTb0hG?=
 =?utf-8?B?UUdLR3VLSHFTS1BqODE4Nnc1MVFxOHlDUVZSeXNGcVBRNnJmVk40TExHZEYr?=
 =?utf-8?B?SHc5NkVsZ2JsSmNnK2ltVzZzZS9iWi9WTmtqcEFSeERMZjArT1FCeWlZTm1I?=
 =?utf-8?B?cjdLTk1OQ0JCOExMY3Y1ZWhNM0VoSlZLcnJUNUl1MjlBUzkwSGRKek8rVTgv?=
 =?utf-8?B?Q1JSSVRyNkp4djl1aUNQWnRRRWVjNXF5T3BEQ21ScVlaalFVUWlsQ2t4Rlk3?=
 =?utf-8?B?R2tpTlI5QjZsSC9ZekVRanViNG9jMTJwbzhwUURDUFVTZ2NqZjIrTTZXbkpS?=
 =?utf-8?B?ZXE3dWpLeGxsTHhoUWZrcDJ6WElSalFSTUtlelNQRkdJUThkbHQ4YzdnWDM0?=
 =?utf-8?B?aGdidkFwOFNNbHp3SXJUNDd1R2FuZlYrZ1FOeXI3ZkRNRHloREw4VS8vNVFY?=
 =?utf-8?B?WERjNVhXZFlMSWdvYTJ4c09rTm9HcnR5dHI0SS9TRW94NkhYMGw3RWJ0aFBj?=
 =?utf-8?B?L0NxVituZTQ4emdjQ012OHFvTjBzM05rZXlTWDdnSFUva3pzalk1Zlh4Tyto?=
 =?utf-8?B?RldwUFR6TTUxdDV1eVg1c0lXbFVMWlVyRDJ1NG1admx5d1dKSGk2ZDJpQVNT?=
 =?utf-8?B?YXptOW1NWnlpSjFaSHlRdWZQMkhtaFRnWHRSSmUwQmpkbVBJYkU0SlR4YSsr?=
 =?utf-8?B?bENVUGozS3drV3Z5QnBGT2s4WFdjL3poRWUzNmFHNUMzRnp0cXM2RCs5T0Ra?=
 =?utf-8?B?M0RjVzM0NWxVM1ZmWmRTTXBpVlFwUjg2NE1iRXlxWWhWaHlVYjlyaUxLd3RE?=
 =?utf-8?B?YkRuNS9GWm1qT2x1eHNnbk5VVWlLeUdKbzJjMk1Gbmh4RnNwVkUwYVNEZ3Zj?=
 =?utf-8?B?eUJ4YmhkelBRWjVDcHFURDh1Rjc1RTgxTkprSDgxZUtXWlhZYmNnTEoxNUl2?=
 =?utf-8?B?dEw0VmN1VkM0MmRNbkdsQ0xtSjhGTVVYYldzeDlvQ29BUTF4U1pBVlJkcTZl?=
 =?utf-8?B?UU9iV1RPWTQzTzBoQ056WjNTUVBxSWV4NXY0eHpMQ2w2VXBOQnJ3bm93eWdX?=
 =?utf-8?B?cVhOTk1BaFJJVCtTN0FLUElWclY1TytLTVRUZzFZb3UwVi81Y1pEK2RRN0lO?=
 =?utf-8?B?V1ZHUldMYWxZMmZJNS9jbDZBQUFOemRjUEJaMUs5Mzk5YURCY0d5ektwcUZC?=
 =?utf-8?B?VjBpTTNhdU53R1ppT2VPUm1iQUZxWnJta3ZKZHFHQ0ZFbHRnWlp3cm9JY0tt?=
 =?utf-8?B?TmpFNXAzQUhVMEpvLzZwRU5uSlFaeCtwaGFnSHF0clVzdVdXWGdXSWZGdUxT?=
 =?utf-8?B?UzRvTGplTnNJMktxMFpZK1V1YjQyaEsvY0dCcUV5ZVZnL3E4ejhBRU5IWHdx?=
 =?utf-8?B?SWFOZG1Zd1YzaHFTOUJRSXZQNXYxRGhvTG80ZCtmSWJDcWJJN1JMTUQrT012?=
 =?utf-8?B?UGo3VHpuUCtLV0tWc3RjRjFHei9EWWlFcUZOc05saWdDeUVpRjB5UGFrc2di?=
 =?utf-8?B?SUMzRnZRaXRjblFEcmljYXMwTWtvSkpNd0RmaFdXTFhtLzF1YUg4cXFYOTRN?=
 =?utf-8?B?UmMvZE1nRDlGZXRHVDhRMmpZeWQya29RZjRHS3BHTi9LejRLaHVwRG0wTG5u?=
 =?utf-8?B?Umxhc21KWXZnL2xQZnRtb090Y2UyM2JTaXNJM1o1M3o4akxldEI5QVBoNlpJ?=
 =?utf-8?B?d0lyMFNFRVhESWxIOSs1UjA4TXpCcWhuMkR2SGZNUUkvdmpnMFp4eXRtNnpD?=
 =?utf-8?B?OVVleDJRbTB0eksvSjQ0TndGclN5cjNqZEY4TlVma1hWbUhTWEFtWGRXMGs5?=
 =?utf-8?B?OGp2L0JOZm5nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEZyakZueHA4NTJVTjVQSDhaYjZESnFQUUlxVWRmRG05OENkMlJhblZRZ3Rw?=
 =?utf-8?B?aisvNGRSc25SY1F1Vmt1U1h0eVE4bnFzc3l6VnlwbS9ZOHdNTE9BR21mYjIy?=
 =?utf-8?B?SDFmTHJBcHZBOGhoYzFEamkwcWdNM2liSW9LL2xrQkZ4TGJSSEticzl2ZC9U?=
 =?utf-8?B?aWRnSFFmbU96MHhzZGhtbitaREdLZUx4ZzVrdWs4RkdUZDkrcVdJUndrSlVp?=
 =?utf-8?B?OWhOOXdlQmh1SHBYU0RoUFh2Zm9ZSnk0YlE4SzVXeUpvQUpuMENaSEF0UXhn?=
 =?utf-8?B?aTBVb3pQSkh6YVN3N2dJQWhmZXFRVC9Pb0tTZThablphVlBrY0VsWjhQU1d5?=
 =?utf-8?B?TlhTelByV0FWME5GVDRsQXFQeWxFREkvZWVHR1RJUmdiUW83d0JuUE5wMDNK?=
 =?utf-8?B?N2tHVXN1VzdWWk04UVQ2RnZ3aE83R1RiUHFPN1NGell0ZGJ3TFZxOG8xWDFG?=
 =?utf-8?B?Tzk0U2tUOFVZdFVwNVpPTzIyVUE0MFFmd3gwdncxSGRYUS9OMWpnWkpicmli?=
 =?utf-8?B?YUp1SDY0bEUwUlRxME90Z2YxMjY0ZCsyZFdpQTJFRUViUUVuY0dBN2doMVdH?=
 =?utf-8?B?ZURVUHl6RytrRXFuWUxXUHMxZjRnZEJKcFVvM3EzYk8vaVhBT1pFQzRBTDFC?=
 =?utf-8?B?MmFzL0JJanBuaE1MOHcvWGJFbnN0Z2hZTjZyTnF6dkdaMkVNa2xkSmNZeHRt?=
 =?utf-8?B?MDliTGxJZUk4ZHQrU1prcVZwcS9mTnI4Uk5maHIwOVVIdDU5d01PMWFiQWxq?=
 =?utf-8?B?Y2NlUzU2dnN4UUMveitqYmlhUzYyTWtucVFxVkJPQmRFK2xpZERxQlgrTXJy?=
 =?utf-8?B?LzBrZEtSazJ5SG1ZOGI1V3BLSFdQaXVsRTVVcm5vUVVEaHVWbDQ4RE5OS2xy?=
 =?utf-8?B?YTUrMmQzb3BZajB5R3lFZnA3cmJaK3U1UWNRZGhaZlFtS2NSa1RHTXJ1MWFH?=
 =?utf-8?B?RElNYmNSdzdQWjl4emZDelNSWURnd2tyQTlxbGNseEd4ZFBpYW9KZStmLzJ5?=
 =?utf-8?B?VlZZY1BVbHVsV3lVa2sxNkNQdzVyQXp2NXJzcEcrMlRqTVlzN1pERzRnc21p?=
 =?utf-8?B?SGhOKysxU2JVeThoVGFRVnpGVHI1VDlqVE56Q01sQjVhdVBLbnQxanEraTFJ?=
 =?utf-8?B?eDdtS0NsRlBQMm8zZFF2T0ZIclppZjJwS3ptTHRieEdqZGIrMTJDd2FXWGR0?=
 =?utf-8?B?NkNvWWZpWmZOZ2ZtbXFJLytsVFNPeVdidnRQcm9uNTk4ai9rYUNXY0RCTmll?=
 =?utf-8?B?ckZyb051WTM1RGxUTUI2Q0JXejJuUWxmTDRlUlJZdTVwZlJpQ0JaamYvVGJT?=
 =?utf-8?B?YzRYWitaVDhrc2lFbHNsZzh5UmgxRUw5dEx1ZjhOMUxua1Q3ZGk0NlVTNHBS?=
 =?utf-8?B?emNaNVUxTGlWaHdESUpRQzIrb3NCcWJTZHNHTTVSWlc2djZvMi9BVmVscHBS?=
 =?utf-8?B?SHlvaEZBSzBGeUczc1JsZEorT2dRL0hkUVlHRnpmR1VkdWtMTGpPRHU0S05a?=
 =?utf-8?B?NWJlNitzd2VMRkx6MWVzTldNMm9oUnIyL09OY0p5VHFnbFZ6RVNWZGl1M0JI?=
 =?utf-8?B?WDJ5bFJ2elNCR0M4UUp4c0tjZHVVc0pYaFU3bHUvRW42RnpMcXRNRDFjUFlY?=
 =?utf-8?B?anZoaXk0SHp6RWZOOWE3cDhEa21CUXNrM2lnNkZ4WkN1UnR3bHc4c0RGSTJs?=
 =?utf-8?B?S29rN3UzbThtZVVnM2VtSWUxZTUxd2FzU01rT2s5aS9Wb1BVVUQ3THNvZVlo?=
 =?utf-8?B?SmVHTHE3WnVsTWxoVEFQMHNmZHBFT3lBNDgwZ0orZjZiUVM1elVUUnpIMXlW?=
 =?utf-8?B?K0R3VjR4S3BVVVEyYVkzQmJidjROTm9CeG5vaVlLeXR1ODhrcU9DZGN6d0Ji?=
 =?utf-8?B?WlRGYnVvaEFhYUlnaitpRHhLZWhxZWxLVlJZREkwTGMxVHVoenBzL21kS0pw?=
 =?utf-8?B?NGNHSXdLUlR2ZDhhamJtcENwNjJGTVMvbUcxYVNyTFhoN3RyYkx0TVU0cjlE?=
 =?utf-8?B?Yk00NW8rR0tCdEplbGtzT3d0V0RnTTZnY3RSVGxUa2k3NjRRSm9wYmRSbDJt?=
 =?utf-8?B?eDJ0SW9TYjNpd0VJeGJ3MHZuMmNxSnI4cnpDYTBSSGpiSTVwYjhHNDlZMnRa?=
 =?utf-8?B?azE3ZDY5VVNKMmViRnMySnBmSkdZcm5RUmtJM0ZHemt6ZmNmeFRIVkRYTkZ5?=
 =?utf-8?B?bUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: da37004b-2ee7-4981-de65-08dd7bf61ffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 08:18:38.4977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P3Dv9gsoqUImSUKFBI2vOM0MXmp3pbP+tr5MDSYcCCRbGru1nwWQyh6ronxiKyhqliebsmz17b2oEM+l5UvKqe9ll8QrqTD3pjWOijP5IEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11963

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAxNSBBcHJpbCAyMDI1IDA3OjE3DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjQgOC85XSBtZW1vcnk6IHJlbmVzYXMtcnBjLWlmOiBBZGQgUlovRzNFIHhT
UEkgc3VwcG9ydA0KPiANCj4gT24gMDEvMDQvMjAyNSAxNjozNSwgQmlqdSBEYXMgd3JvdGU6DQo+
ID4gIGludCBycGNpZl9tYW51YWxfeGZlcihzdHJ1Y3QgZGV2aWNlICpkZXYpICB7DQo+ID4gIAlz
dHJ1Y3QgcnBjaWZfcHJpdiAqcnBjID0gZGV2X2dldF9kcnZkYXRhKGRldik7IEBAIC00OTMsNyAr
NzY5LDcgQEANCj4gPiBpbnQgcnBjaWZfbWFudWFsX3hmZXIoc3RydWN0IGRldmljZSAqZGV2KQ0K
PiA+ICAJaWYgKHJldCkNCj4gPiAgCQlyZXR1cm4gcmV0Ow0KPiA+DQo+ID4gLQlyZXQgPSBycGNp
Zl9tYW51YWxfeGZlcl9pbXBsKHJwYyk7DQo+ID4gKwlyZXQgPSBycGMtPmluZm8tPmltcGwtPm1h
bnVhbF94ZmVyKHJwYyk7DQo+ID4NCj4gPiAgCXBtX3J1bnRpbWVfcHV0KGRldik7DQo+ID4NCj4g
PiBAQCAtNTQzLDYgKzgxOSw2MSBAQCBzdGF0aWMgdm9pZCBtZW1jcHlfZnJvbWlvX3JlYWR3KHZv
aWQgKnRvLA0KPiA+ICAJfQ0KPiA+ICB9DQo+ID4NCj4gDQo+IE1pc3Npbmcga2VybmVsZG9jLiBF
eHBvcnRlZCBmdW5jdGlvbnMgc2hvdWQgaGF2ZSBrZXJuZWxkb2MuDQoNCkN1cnJlbnRseSB0aGVy
ZSBpcyBubyBleHBvcnRlZCBmdW5jdGlvbiBpbiB0aGlzIGRyaXZlciBoYXZlIGtlcm5lbCBkb2Mu
DQpJIHdpbGwgYWRkIGEgc2VwYXJhdGUgcGF0Y2ggZm9yIGZpeGluZyB0aGF0IGFzIHdlbGwuDQoN
Cj4gDQo+ID4gK3NzaXplX3QgeHNwaV9kaXJtYXBfd3JpdGUoc3RydWN0IGRldmljZSAqZGV2LCB1
NjQgb2Zmcywgc2l6ZV90IGxlbiwNCj4gPiArY29uc3Qgdm9pZCAqYnVmKSB7DQo+ID4gKwlzdHJ1
Y3QgcnBjaWZfcHJpdiAqeHNwaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ICsJbG9mZl90
IGZyb20gPSBvZmZzICYgKHhzcGktPnNpemUgLSAxKTsNCj4gPiArCXU4IGFkZHNpemUgPSB4c3Bp
LT5hZGRyX25ieXRlcyAtIDE7DQo+ID4gKwlzaXplX3Qgc2l6ZSA9IHhzcGktPnNpemUgLSBmcm9t
Ow0KPiA+ICsJc3NpemVfdCB3cml0ZWJ5dGVzOw0KPiA+ICsJaW50IHJldDsNCj4gPiArPiArCXJl
dCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoZGV2KTsNCj4gPiArCWlmIChyZXQpDQo+ID4g
KwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwlpZiAobGVuID4gc2l6ZSkNCj4gPiArCQlsZW4g
PSBzaXplOw0KPiA+ICsNCj4gPiArCWlmIChsZW4gPiBNV1JTSVpFX01BWCkNCj4gPiArCQl3cml0
ZWJ5dGVzID0gTVdSU0laRV9NQVg7DQo+ID4gKwllbHNlDQo+ID4gKwkJd3JpdGVieXRlcyA9IGxl
bjsNCj4gPiArDQo+ID4gKwlyZWdtYXBfdXBkYXRlX2JpdHMoeHNwaS0+cmVnbWFwLCBYU1BJX0NN
Q0ZHMENTMCwNCj4gPiArCQkJICAgWFNQSV9DTUNGRzBfRkZNVCgweDMpIHwgWFNQSV9DTUNGRzBf
QUREU0laRSgweDMpLA0KPiA+ICsJCQkgICBYU1BJX0NNQ0ZHMF9GRk1UKDApIHwgWFNQSV9DTUNG
RzBfQUREU0laRShhZGRzaXplKSk7DQo+ID4gKw0KPiA+ICsJcmVnbWFwX3VwZGF0ZV9iaXRzKHhz
cGktPnJlZ21hcCwgWFNQSV9DTUNGRzJDUzAsDQo+ID4gKwkJCSAgIFhTUElfQ01DRkcyX1dSQ01E
X1VQUEVSKDB4ZmYpIHwgWFNQSV9DTUNGRzJfV1JMQVRFKDB4MWYpLA0KPiA+ICsJCQkgICBYU1BJ
X0NNQ0ZHMl9XUkNNRF9VUFBFUih4c3BpLT5jb21tYW5kKSB8DQo+ID4gKwkJCSAgIFhTUElfQ01D
RkcyX1dSTEFURSh4c3BpLT5kdW1teSkpOw0KPiA+ICsNCj4gPiArCXJlZ21hcF91cGRhdGVfYml0
cyh4c3BpLT5yZWdtYXAsIFhTUElfQk1DVEwwLA0KPiA+ICsJCQkgICBYU1BJX0JNQ1RMMF9DUzBB
Q0MoMHhmZiksIFhTUElfQk1DVEwwX0NTMEFDQygweDAzKSk7DQo+ID4gKw0KPiA+ICsJcmVnbWFw
X3VwZGF0ZV9iaXRzKHhzcGktPnJlZ21hcCwgWFNQSV9CTUNGRywNCj4gPiArCQkJICAgWFNQSV9C
TUNGR19XUk1EIHwgWFNQSV9CTUNGR19NV1JDT01CIHwNCj4gPiArCQkJICAgWFNQSV9CTUNGR19N
V1JTSVpFKDB4ZmYpIHwgWFNQSV9CTUNGR19QUkVFTiwNCj4gPiArCQkJICAgMCB8IFhTUElfQk1D
RkdfTVdSQ09NQiB8IFhTUElfQk1DRkdfTVdSU0laRSgweDBmKSB8DQo+ID4gKwkJCSAgIFhTUElf
Qk1DRkdfUFJFRU4pOw0KPiA+ICsNCj4gPiArCXJlZ21hcF91cGRhdGVfYml0cyh4c3BpLT5yZWdt
YXAsIFhTUElfTElPQ0ZHQ1MwLCBYU1BJX0xJT0NGR19QUlRNRCgweDNmZiksDQo+ID4gKwkJCSAg
IFhTUElfTElPQ0ZHX1BSVE1EKHhzcGktPnByb3RvKSk7DQo+ID4gKw0KPiA+ICsJbWVtY3B5X3Rv
aW8oeHNwaS0+ZGlybWFwICsgZnJvbSwgYnVmLCB3cml0ZWJ5dGVzKTsNCj4gPiArDQo+ID4gKwkv
KiBSZXF1ZXN0IHRvIHB1c2ggdGhlIHBlbmRpbmcgZGF0YSAqLw0KPiA+ICsJaWYgKHdyaXRlYnl0
ZXMgPCBNV1JTSVpFX01BWCkNCj4gPiArCQlyZWdtYXBfdXBkYXRlX2JpdHMoeHNwaS0+cmVnbWFw
LCBYU1BJX0JNQ1RMMSwNCj4gPiArCQkJCSAgIFhTUElfQk1DVEwxX01XUlBVU0gsIFhTUElfQk1D
VEwxX01XUlBVU0gpOw0KPiA+ICsNCj4gPiArCXBtX3J1bnRpbWVfcHV0KGRldik7DQo+ID4gKw0K
PiA+ICsJcmV0dXJuIHdyaXRlYnl0ZXM7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTCh4c3Bp
X2Rpcm1hcF93cml0ZSk7DQo+IA0KPiBHUEwNCg0KU2FtZSBhcyBhYm92ZS4NCg0KQ2hlZXJzLA0K
QmlqdQ0KDQo+IA0KPiA+ICsNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

