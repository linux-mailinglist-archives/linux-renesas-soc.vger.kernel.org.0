Return-Path: <linux-renesas-soc+bounces-21703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D50B5142E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 12:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C810C1C217C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 10:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F84E2C0F8A;
	Wed, 10 Sep 2025 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EJxH83IS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2057.outbound.protection.outlook.com [40.107.114.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF118269CF1;
	Wed, 10 Sep 2025 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501041; cv=fail; b=nl0qaKu2+v0s4b2O9QJbRVlcFqnjuVBz/9ODvPDCeY1jbvU3KXqF7WbwCuxADgxVzY8MlYYjxOgKDxg2bcT1FzJrIDxvVxg8Lz8KK5Qy8aWqkD8FYFQMOHmGFUJANMRJsR+S140lRyUVAs0xgRq4VgAA6H7QNF5ci7bz/Xx9Qq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501041; c=relaxed/simple;
	bh=PVWHYwu7SOP426skdnWEGMHVFaz9NnvCUtVjxJp5fNc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ljumKzUrxiJgiBuC+3Vfv7Ldn1i39pLeh7i8Q+qRP/Jply7zojMBQWnelXndgBUuc2i1dQjEUtm7R9FEJSGHwhOdQR5Khxf/smPt/KpyiaQAlX8BqGNAyylcqnRNLATCLrviB/0fD/hT9BdzkuPgs+D5ooHhTKAGc6PEEhDC0Zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EJxH83IS; arc=fail smtp.client-ip=40.107.114.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcdQ3BnBzzcDHhIvtlGSbl+yXxl91lBGt9nzauVtx7FiOHUkyVkDsXVKx+v0K3OlembxR0ARmmiWtCDf+2qJgAVcOhDuuKymA8ZoWUMpL39U/O9Wqa/CduHaQJDFkmvDk3toGOEA8MNwg2PeOohi3jKUVa42ExO0JnUWL+o520YB8ZodKWd+xvAG5cgRPxwGVBmnjVVMo+jTghpW5JX9Icws4BaK+L8fOa1c26oKcY4i+i33zn/O9mgeCy70GCwDmh/LuTcv4mjRC7wq4U0sjL+qONWOoiyJakeBC8/ohrSL0svKdut3xhaqztkEjS8k+RNXWZFa9jWyhTv7OBpspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVWHYwu7SOP426skdnWEGMHVFaz9NnvCUtVjxJp5fNc=;
 b=MdBE7SdK3BE2yGrH+rXx5RIaqUstbWvzuharOGi1+HmEqkvuSWhO20BlbIb6Cxu4FDIOnqgK6RCFRfFoRBcFsBKHGpbCQsiYMdV541PtRnh6B4sEdqEF43/TdbSwAwt8MB0u8sDhOEzFD910wAiJSAuv2X2IJivtG9TkOzf0KEP2jRPVVFG3q6uEZJfI747VqCSwIszdc+Hrg6fkwwLeZplvWulVHNYK/HZX5UD5xXwT0sfvcX0CDqUTqsO50rVOyP8JlVJnjO/+2aDv4Gxdagr3E0lMIC3lOu+cGHIMQ7oRI0ivOP0vk0CQ2hBj4+eHRebVIs6ILjWA90IUqJvuJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVWHYwu7SOP426skdnWEGMHVFaz9NnvCUtVjxJp5fNc=;
 b=EJxH83IS6RhHeky2ivag/W6VOfyHhACrJ8X1ppbFGU7KW4xOT8arAkN+V5MIJJmGoFySKrVX7dzGXHujYzdgtSjIUKmvxhRswxHalHKXXwjUuUnX0+hR2JM1ZNtTinZ7lkf8XBVyVUuALdjF8cVX3eGvuT1axXr/HSoXIamxwnI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB16144.jpnprd01.prod.outlook.com (2603:1096:405:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 10:43:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 10:43:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, biju.das.au
	<biju.das.au@gmail.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham
 I <kishon@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 04/11] phy: renesas: Add Renesas RZ/G3E USB3.0 PHY
 driver
Thread-Topic: [PATCH v2 04/11] phy: renesas: Add Renesas RZ/G3E USB3.0 PHY
 driver
Thread-Index: AQHcIbS3LerZ2Tiq6kuhENfC1p0JD7SMJCaAgAAXtjA=
Date: Wed, 10 Sep 2025 10:43:54 +0000
Message-ID:
 <TY3PR01MB11346B0B825BC26B1AF690EF7860EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
	 <20250909180803.140939-5-biju.das.jz@bp.renesas.com>
 <94ce63da0edee178a49781b2c6ac9a863f13333f.camel@pengutronix.de>
In-Reply-To: <94ce63da0edee178a49781b2c6ac9a863f13333f.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB16144:EE_
x-ms-office365-filtering-correlation-id: 4d876657-7586-4f14-565a-08ddf056f039
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?S0IzbkpzVFZtdFlJVTM1ZnlJc3c0ckl0bVFRYzhhTlVyd3J6SlZNanptajM4?=
 =?utf-8?B?M1MwekJRZE5DbFM5cEovS0FRQm9udUJjRS9yZWIwVkZWeHR3VlFWSzNSbnpM?=
 =?utf-8?B?dGF2NjQ3VElpOFFRYTVwOUF1cWJOei9iVTlqUHAxYWRqUjh6cTZMcm1RUGgr?=
 =?utf-8?B?V3Ric2V0UTVlQys1bDZ5OCtvajFkOXBwYXdBNDJVRUNzYUdZTjN3Znd6c1Fs?=
 =?utf-8?B?d1hNQS9aNjZobHFJQ1NycVlqdUdzY08vTE5uT2VldDd1Ync2bG9WVHQ2YXp5?=
 =?utf-8?B?YmJyeGd1ZGtRR3VtSXd0d1djNlRiZUllWVR1U3Z4cnY2MnhCbDdKR3dDNm5J?=
 =?utf-8?B?WWlBZjQxazFmUnJpODVOZ2tmeEpNNENlSjlFR05IWmRmc2F4WG5vUEVQOEdI?=
 =?utf-8?B?RitqOUQwMWNnWjBzN1pxVnVsYzJLNHZKNmFQNTRmeTdCbmgwQkFybDUwR05n?=
 =?utf-8?B?TjRxSzdEejFpaStva2hZV3Bzcm40N29iR1Z0ZkFJMkhvemYwTEJGK3hkTWs5?=
 =?utf-8?B?U1R1TEVFeVozR3VNMmt1ejF3VWZWVGJpTFNPUTRWRFJ3VXkvNUlWWTF1YVRj?=
 =?utf-8?B?TFN4Zm5lb3pHTFAxd21WSmx2VTh4UU1RczVCR0lIZVpoWWpZazhpQ0ljdjRz?=
 =?utf-8?B?UmY3VWZSakZSdWdQRWhwdzhhSHh2U0ExQnhUWHlCMHBiYmVBYzF1M2NwRXEx?=
 =?utf-8?B?emZkejB1QlJRYi9YY0JRYnkvOUt5bEUwd2tDeXZFeTZZYUFNcGVXOVAyajUv?=
 =?utf-8?B?WXJYajlwMDhFdGp3ZUJrb1JBM3Nud1E5Y2RuYVBGQlJRTzg5MFFZN2NaQlpX?=
 =?utf-8?B?Z0ZQVXowdGdKNjVqNHVjV204N0dmOFcxbGxkRnlTMmZCWGdZK0g5UHRPdXM2?=
 =?utf-8?B?OU8rZ2l0MkplbHZtTmJFYkIzR1FWUnVzUDdsajQzVTdwTzBORmduQ1FpUldk?=
 =?utf-8?B?TUZYYzFUOXN0WnlWNTVLcGdScmxIUDBucXF5NENYRG9raHJjdWtRMUhrRXVX?=
 =?utf-8?B?azl0THlDTVUybkYxSlMxc0UxMEg2VDBLL1hxWXlKQ2tuMUo2enVDSWphZE1Q?=
 =?utf-8?B?MEJGNjJIQTEyM2ZLOU1SWjN4U2NsSXBsci9hMFdaWFA5M0JUMXp5UURCRUcx?=
 =?utf-8?B?Zitra0lSVE9sQ0UyRzVLQ3BObGR2ck03WUJKNmdWR3dUZE53TlVBWDlGYUVU?=
 =?utf-8?B?em9hSmhVTHZGZEhrY3MyTzJZN3IwYU9HakVkZWN3NXdzTTN5ZTZ4OUs2OHNa?=
 =?utf-8?B?bmMwTFUwY0p2Q250bkx4UUprMTdiVGozRkN4SkpnUWlLWm95YVVEd3NQV2Jq?=
 =?utf-8?B?ZWluOXhkN0ZCVTh2c253elFMTnpZZVdqYjJWZUVFR1lzRi9mb3ZvYUZkQVgw?=
 =?utf-8?B?ZHZFM2MxNEpObzFESWNZV2t2d3dMM2pnR0IralVQSmszNlZrSTUzVUtkWmUx?=
 =?utf-8?B?MVZvc2UrVk55VmpJQWhRYVR5eXVGZVB1R2VVU0xMMjh1Y3d3dXhIdG1rRmg5?=
 =?utf-8?B?YVZGWEVSVFk0QnZVa05UK2R4U1AwdzRnc3NsNFJFcVFvMDYwZUEyN0NmTTZq?=
 =?utf-8?B?UkZPbytudnRJU0ZhV05QY3FOY0l5TVVYK0d0VTlud213SFJpVFNSZ1gxUW1j?=
 =?utf-8?B?QUxQYXBTbkRXRTdYWE83QnphVUZYSDV1RUpGREFTaDBKVU5aVkRvK2YraEhZ?=
 =?utf-8?B?c0Y2aURoc1lXRzlXQllRNGtGRnpuYmxKaXhRNHltU2hER3VWTERLellrdWF1?=
 =?utf-8?B?aGJXSjdHNXJSeURRQjY0N0hVM3hDVDVWaERsTW5IVldNMURSUXJTc2JSMnJw?=
 =?utf-8?B?b0NsTmEyZkZmRmY4TjJyZFRsdW52Q0k1N3lhT25vVm1uUDZKZTArUjgvd0Rv?=
 =?utf-8?B?dzRZSXgyNFRhV0Y2NEZndEIzRFZMMHpPS0psaGd1c1g4aVJMY3drTmxHcDJv?=
 =?utf-8?B?QlJOUE1ad2RtcE1yWmNGdjZVRWlleDh6S25PR083S0hoaGhTbFFyeHhDa2Rr?=
 =?utf-8?B?K2pjZXV1Um9nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bFdKd3JudkNlTDR3ZytqaGV5d0kwaG1zNEx1TVBnSTJsWU5vNzJJQ0JEM2hH?=
 =?utf-8?B?a2prZE0xRkN4K1BYZUVmYStjYWxzUWtaRCtXRnFiaURucUttRlBibEc3QUtz?=
 =?utf-8?B?R1NkRnB3ckkvM21HWDREQy9aYTA3bVpTLzdmbXlIVDQwUC80d0ZMQXNzb3Y1?=
 =?utf-8?B?K0pwZDZVelh2SGIxeVRTMXh1RmNCUUptWm52Y3lkUzZab2V4dVN0OGhubGVL?=
 =?utf-8?B?bVE1NUJESmlZd1g1bTdoOVpCVk9QdmVrUlFvSUZaNTZYVXNMM20zTGN3Y29K?=
 =?utf-8?B?M1JoYXdsVWMzMGJmUFNmV2pGdE04WG5wZzJHWTVyd2RoaFF0V1dtYk51cTR1?=
 =?utf-8?B?UUg2dndtMmdmNjMwWGxPRm9NaW5vaWZnQU9qdGtpRWx2anpzS0tNWGtyYncx?=
 =?utf-8?B?WkdOZHdjU1JTRzNjbjNpelFkRVBLMWpXQjNTc3Z4ZzRscFBwcHBneXVOTU1C?=
 =?utf-8?B?dnlFQU03U01sU293RHpDRHFIZ0NlcUVKUnI3eUFkendZWXdHbGovQUV3ZzRj?=
 =?utf-8?B?MnVUZjh3YUhlZDlUR25QNmt0eEtpZHZQMEVUb3dRV2k0anMydE5yWFl0cWdF?=
 =?utf-8?B?bk5hYlVrZ0I4RkFxdXRkSkdVVW9MQThUYXBvN3ZDWnpWdXk3V1ZvczdzZjdD?=
 =?utf-8?B?Q2tCSEJmTDJaMlIvbXJlZm9UcDRYWjNDd3ZnMURHWVZtZWNMSytQT1d3WjBv?=
 =?utf-8?B?RklrVG4xdTA0VnlFNVY1aStiWXREQVlYQ0Z2SUJ0d3dESS8rREVPTWt1K05r?=
 =?utf-8?B?aFpGcmhIU1ptVGNISjBYOFl4UU9jeGY5dzN4SkpmQ25nYUVFQWxtY0FqQm5Z?=
 =?utf-8?B?NDlua25xSTcrU2lBSTlaaS9mVDFLcngyVnRwYTd5NVBWaUlza2ZyS3BQcnVT?=
 =?utf-8?B?aVMxdHUveXJsMnpZM0pwZGpkNDBuRFFBYStrTmtNQnEvdXBSN2JzdEZIL1hl?=
 =?utf-8?B?MlRPb1pTR0tWVmpYNVFuMnRaa3V3d0g0SmtsVjdjYVFwOTdDOW9zQkI3OUJm?=
 =?utf-8?B?YWl4aTlDRHFuc3RGUFp6TFJQRlhoeXdGOEhteHBCVmRWTzlvdVBneW5nVVhy?=
 =?utf-8?B?TnpnWURmWUtjVFEvczVHb0xvanRCNGxJTHlBUTFLalNaNG9OVzB2UHJaUEtl?=
 =?utf-8?B?WWtER25oMEUzUFhZSUZ2VEFxZ0dVc0tnYm9kRld5YXY3T1l1cU9xQkxLODg4?=
 =?utf-8?B?TVBqMEdLNmRnc1ZHUXRRT21Ib2xqcEtrckM0a3hEVzlxQlVWTGNSQXl0Nnht?=
 =?utf-8?B?bHphbmU4NGpreFYyd2tpWXFMU2xuTnROdWZzM0VEY3ZWL2R2R1E0R1hIMDdh?=
 =?utf-8?B?WVpJYXdta1lnZlNhTDhpL1hrTjNiVmZ6dzR5bUVHNUYrSUliZXc5TWRhZkdz?=
 =?utf-8?B?NkpzcXY3YnE5VFdIRkRyNmhZUVNtcGRPYW93ZjJVOEFoSWpudGR5aUZaYWY5?=
 =?utf-8?B?dk9pMytZRXpNNnM1dmhuUzVFaml1dlF0ZXRCR1RYMWQ5WUM1cStCMUdreXVU?=
 =?utf-8?B?YTdoRXVZdVVsalBVUkNBd1JqVmxJcmZtRW01Z1FDWGxaSm5pWWZlTUcyQ25n?=
 =?utf-8?B?dHNMdG8wZVp6WnJyUDFCaHlrOXZTKzRid08xUlNZbnFHUjJOTndJU25BNUVo?=
 =?utf-8?B?UUlVaDZNNDRHR1Rxa3RwY2puYmdyUWZJRmc3SDIyNVgrUkN6a1pMbHpkTEhN?=
 =?utf-8?B?TXkrMXVJbjlhTjFSTGgzUWNjbjVVcVFLSHpSMVVBNVRjcEJEZ0dTQmx1T3Fj?=
 =?utf-8?B?Zkt3QTQxd2l2Zmt0SU5wdFcvZ296NHpRS1E3TTE2ZUNkbXBQRzJ3T2FQRGZX?=
 =?utf-8?B?RFdJRmxSZ1hCUFJINXUzVjRJM21WaVVoK1I1bnBsODhHQUdMM1NENHQ5QW9z?=
 =?utf-8?B?Mzl6Q2dZOENLVnNrQ1VGL1F4ay9PSUFmelJXRm4yQVhrN3N1SHlaS2ZReVFt?=
 =?utf-8?B?M1dPVlJVeU9rU0hJQ2UzVlVCUFNSV1R0OC9aSVJOT1lFS25mMjEzc0k2SjF3?=
 =?utf-8?B?dUxIQ3lNSWhTcmEzSjFGTGdxTUJ5aGtPTWNOT0RBWWhDbmlhZ0dqSEl3Vkk3?=
 =?utf-8?B?RWJxZlFKRTVHYTVUQk9sNzZTZ1JEb3J5VjlVNWw5dGNhMGZ4Y2tvNVNNbnNr?=
 =?utf-8?B?cGI1empXcHNLOEtzZTJQeGI2UFFvcExjL3pQTDUxV25BUlhIL3ZyazE4bDlm?=
 =?utf-8?B?bkE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d876657-7586-4f14-565a-08ddf056f039
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 10:43:54.4525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W7OE9YogdJa3uHAZVTsgd3Jb0OM9Cc5/i2SQmVhoRiSFLcfKSOSrjhXjnubnfhHQ6iC3gLCVcWATk4+KEWJSl6rN7K4OZ1dknavFTxXgabk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16144

SGkgUGhpbGlwcCBaYWJlbCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4NCj4gU2VudDogMTAgU2VwdGVtYmVyIDIwMjUgMTA6MTgNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiAwNC8xMV0gcGh5OiByZW5lc2FzOiBBZGQgUmVuZXNhcyBSWi9HM0UgVVNC
My4wIFBIWSBkcml2ZXINCj4gDQo+IE9uIERpLCAyMDI1LTA5LTA5IGF0IDE5OjA3ICswMTAwLCBC
aWp1IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPg0KPiA+IEFkZCBSZW5lc2FzIFJaL0czRSBVU0IzLjAgUEhZIGRyaXZlci4gVGhpcyBt
b2R1bGUgaXMgY29ubmVjdGVkIGJldHdlZW4NCj4gPiBVU0IzIEhvc3QgYW5kIFBIWSBtb2R1bGUu
IFRoZSBtYWluIGZ1bmN0aW9ucyBvZiB0aGlzIG1vZHVsZSBhcmU6DQo+ID4gIDEpIFJlc2V0IGNv
bnRyb2wNCj4gPiAgMikgQ29udHJvbCBvZiBQSFkgaW5wdXQgcGlucw0KPiA+ICAzKSBNb25pdG9y
aW5nIG9mIFBIWSBvdXRwdXQgcGlucw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAg
KiBSZXBsYWNlZCBtYWdpYyBudW1iZXJzIHdpdGggbWFjcm9zLg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL3BoeS9yZW5lc2FzL0tjb25maWcgICAgICAgICAgfCAgIDcgKw0KPiA+ICBkcml2ZXJzL3Bo
eS9yZW5lc2FzL01ha2VmaWxlICAgICAgICAgfCAgIDEgKw0KPiA+ICBkcml2ZXJzL3BoeS9yZW5l
c2FzL3BoeS1yemczZS11c2IzLmMgfCAyNzENCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAyNzkgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9waHkvcmVuZXNhcy9waHktcnpnM2UtdXNiMy5jDQo+ID4NCj4g
Wy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvcmVuZXNhcy9waHktcnpnM2UtdXNi
My5jDQo+ID4gYi9kcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yemczZS11c2IzLmMNCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNjQ2MzUxOWIyYzIyDQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvcGh5L3JlbmVzYXMvcGh5LXJ6ZzNl
LXVzYjMuYw0KPiA+IEBAIC0wLDAgKzEsMjcxIEBADQo+IFsuLi5dDQo+ID4gK3N0YXRpYyBpbnQg
cnpnM2VfcGh5X3VzYjNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgew0KPiA+
ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPiArCXN0cnVjdCBwaHlfcHJv
dmlkZXIgKnByb3ZpZGVyOw0KPiA+ICsJc3RydWN0IHJ6X3VzYjMgKnI7DQo+ID4gKwlzdHJ1Y3Qg
cGh5ICpwaHk7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCXIgPSBkZXZtX2t6YWxsb2Mo
ZGV2LCBzaXplb2YoKnIpLCBHRlBfS0VSTkVMKTsNCj4gPiArCWlmICghcikNCj4gPiArCQlyZXR1
cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKwlyLT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFw
X3Jlc291cmNlKHBkZXYsIDApOw0KPiA+ICsJaWYgKElTX0VSUihyLT5iYXNlKSkNCj4gPiArCQly
ZXR1cm4gUFRSX0VSUihyLT5iYXNlKTsNCj4gPiArDQo+ID4gKwlyLT5yc3RjID0gZGV2bV9yZXNl
dF9jb250cm9sX2dldF9zaGFyZWQoZGV2LCBOVUxMKTsNCj4gPiArCWlmIChJU19FUlIoci0+cnN0
YykpDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHItPnJzdGMpLCAi
ZmFpbGVkIHRvIGdldA0KPiA+ICtyZXNldFxuIik7DQo+ID4gKw0KPiA+ICsJcmV0ID0gcmVzZXRf
Y29udHJvbF9kZWFzc2VydChyLT5yc3RjKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJu
IHJldDsNCj4gDQo+IEl0IGxvb2tzIGxpa2UgeW91IHNob3VsZCBiZSBhYmxlIHRvIHVzZQ0KPiBk
ZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X3NoYXJlZF9kZWFzc2VydGVkKCkgYW5kIGxldCBkZXZyZXMg
aGFuZGxlIHJlc2V0IGNvbnRyb2wgYXNzZXJ0aW9uIG9uIGVycm9yIGFuZA0KPiBkcml2ZXIgcmVt
b3ZhbC4NCj4gDQo+IEFzIGlzLCB0aGUgZHJpdmVyIGlzIG1pc3NpbmcgYSByZXNldF9jb250cm9s
X2Fzc2VydCgpIGluIHRoZSBwcm9iZSBlcnJvciBwYXRocy4NCg0KQWdyZWVkLiBXaWxsIGFkZHJl
c3MgdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNCkNoZWVycywNCkJpanUNCg==

