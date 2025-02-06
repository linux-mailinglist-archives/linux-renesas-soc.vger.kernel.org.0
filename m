Return-Path: <linux-renesas-soc+bounces-12899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF0DA2A6A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 12:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D6887A3603
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 11:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE762288D0;
	Thu,  6 Feb 2025 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Gjt7cYL1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E1227572;
	Thu,  6 Feb 2025 10:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738839536; cv=fail; b=t8tGf/562mF5wkGqkKVtZfS3XTSQ2Moe+ZCuNTuj6ltqvb8zmlw1uAJfItJIU5SdHJSf7x+Ab7m8uMieFUsii3M6n4nJp6iGIZGOvVHtRWdT3VOGup6PSeYHT0k6qoAYajKZDLZbHLa/7SFibvoMb2XPSmslw+kOzqY9pHTbz8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738839536; c=relaxed/simple;
	bh=hO1rebpkYJfJVpv4spx8LIB8HyLU56GqXKCVc3rR5Qk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LixD71Ru/MmDFW9aiucbMPrDDIiqzO3QDRUi4KgvjLmF3TG0zbBprdmJTJyj0xgFckuIBbqMte+Yh7ckIhSC1u+52KB4U5o5uTvRRnbZ4G77+b2QCcvnnXaxcDCHqeCH3ISX6Jv02MwsiCJVkv+vVhRdb7CM1Qr2EEI2Z49EvXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Gjt7cYL1; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQFzuGf6Obs9QgPA7q9yHwC4JXaXucXRWCarcJrBcktbqHIhF6wXeLAtGIOn3FeVRjeJp+xriEzXr+QeHFCyoYP8I4e5ENfh3RrCKT9BEpacpRI6xG/cDGSbQEuJDfwqD39bl52oMkCSRaaZBIgviDvolkuq64gZ/ys6WuiuecwolFv1bHq3WmteAeR5eqBz7ivrViNqhsoBlk77lwddPtQIRUK7bKwzIKo6AAW0TsF6l/bXEL2ZJeSzGG1Cl+ihBBCSMIfbKey9EMfzF1vlmRR3HUUKNqpwerzIzlscqZhrhrms+7bmtQwzguNH9N6fJ+i013UkdoVEeEMou767EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hO1rebpkYJfJVpv4spx8LIB8HyLU56GqXKCVc3rR5Qk=;
 b=rN9wjhfTV0u9prCG1bZkTtjuoVxIHe7YKx3ycLkkd2VjiS5FBF+cbLreT4U3alm/HUU8+lQK+e3gqunW2HpE2zSb7Aoidd6LN2edZu/C2+ogt7OxAdNewyWWjfjVasIv6mce+zl1smOmSY2YbQyX4YGKiJ6GFfEIoE2Kj/DvvDy1rhyI3Ft/a30BW9w7s5UfPXhzO+W6/4WsQZb8FJtHMrsu11RN0yvK/70ZV+xiIHj+RcUNbDrV0e8t4KTNko8Mgud/MfPYCQRFcHbmyDeG+XBWV1KUib8quWIIGnXPrCXPmXeF+CJNq9xUSZkmqEMs7U6LpD7jwwXxUT9h+J7QRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO1rebpkYJfJVpv4spx8LIB8HyLU56GqXKCVc3rR5Qk=;
 b=Gjt7cYL1QnA8dMVqAo2x4+IAC8LM0MGYdxu75x6vCjb94gO2PsaIbymc2MbeOwK61Sri7EQ4AlgjaNEEstpDSACMp4qZ00cKr0TXtMc4U6WYOXK5g8udpHG2QTouiE9cYVbVRGgKTxOqCZBbskVa4LvkJ0xXCpTB5otyXm1Pp00=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13329.jpnprd01.prod.outlook.com (2603:1096:604:352::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 10:58:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 10:58:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 7/8] arm64: dts: renesas: rzg3e-smarc-som: Add support
 for enable SD on SDHI0
Thread-Topic: [PATCH v2 7/8] arm64: dts: renesas: rzg3e-smarc-som: Add support
 for enable SD on SDHI0
Thread-Index: AQHbc9LHVRFzPfvNSU24xT+kmQMi9LM6EICAgAATp6A=
Date: Thu, 6 Feb 2025 10:58:47 +0000
Message-ID:
 <TY3PR01MB1134620335FA6D7590AD7C4F286F62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
 <20250131112429.119882-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdUTJ6KjhkASEGU=SxJHNShcRXr_X7DuRNvKG0dVn_gcLw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUTJ6KjhkASEGU=SxJHNShcRXr_X7DuRNvKG0dVn_gcLw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13329:EE_
x-ms-office365-filtering-correlation-id: df59551a-2310-4603-70ba-08dd469d3b0c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dFV5MUN0bFlaMjdBNzZVZlE2TzdqMTR3bG5ib2w1Q01UUzdsRFNuck9IaVpP?=
 =?utf-8?B?aWgzU3A2NFVFT1VQVURQQzNzTkJMZTg1MnN5YTlNVWI4ZHRIbDdRWWdWaEtt?=
 =?utf-8?B?TnFqMGRzNXZ3WnFwb0c3MXVZd2hwSjVjOURCTEdWRXREaXdYa3dBL3h3RGZ6?=
 =?utf-8?B?OWdKL0pDbkkrM1Q5RnFWV3I1c0Z6UXZhMUhTdGswbFNwUklvVmZ5ZG13VlNK?=
 =?utf-8?B?bG1MNDM0aGxLaUJ1eGMrWElOblZPT1A3K2pJRDVUMnNiTC9ZdllQcGhXR2F1?=
 =?utf-8?B?Z0VTYnVqSmpoZCtELzVRMkxLVFZISG5KT1BLTDhaa3F3Y2pURU5IR2JGSG1w?=
 =?utf-8?B?RHZwbXlqRGFUbFhpbitUNzZ3N0tDK1lWMVI5bTVhNTB0Kyt6aDEwUThWOHdU?=
 =?utf-8?B?eHFmUHh4d1NRWFZkdVBQV1RpR2pzeWIyZG00a0Y4amtpQjBSZUk4WVhIS29O?=
 =?utf-8?B?c2tsdDVFeStGbmpTQ05ZK3ZxRlRKSmMwcmRJSFpTckxyVlhIZTJXSGd4bWhx?=
 =?utf-8?B?UHI2UW5CMklOSE9jS2R6NEx1Rk5Jc3gvUWp1bEExR3NSdkk0c2JKZEttZStQ?=
 =?utf-8?B?YVBwSmw2T3hPcHFqK0lKT0o2VzNwTUZIT212RmFyZHBraHErWXpqZkJ3c21h?=
 =?utf-8?B?bUNrL2V3U21iMENTYTlYd0ZLY0pTRXJ0N2t3Z1lSbHJFR05wSUJVMHhrZnQ2?=
 =?utf-8?B?VzNUclNaRTdoeGtPQXJRT2MzRHpNRCt1RWZVcGxvcllPdWhJMHRLYTRTK0th?=
 =?utf-8?B?S1d0ekFxYnJVOCtQelN0cllHME9YQjYwdUR1ZWR5STYyYXdFM3pCNTZDNzQ3?=
 =?utf-8?B?WEl0U2NndlVpb1N0TW5ZVWUyaEoxcjFsbzROVjN4bTNYL2pxSW9rdTJuUE93?=
 =?utf-8?B?UWdFOFRBLzlHM3pyVkhIbUd0a3FoVWdqMFhHUkZMZmxNeHp0aFZERmh1K01s?=
 =?utf-8?B?MStmVUMrbUkwdldOa2N5aGVOeld2SkhtZndZSnhJM0ZtRm80L1IzRXZWdGRG?=
 =?utf-8?B?ellyVmREaktuOE42dkRVaXB1S0g2NzRvQkk0Mm81NjRtUEVybW5zWTlybU04?=
 =?utf-8?B?KzBvWm82YTNRbUNvd0k5WlEvTytQcExIRmNUdDlkWVFLb0FtNzZUSzZ6a3FV?=
 =?utf-8?B?RVlVTGdpR1VRVmNZSVNzVHNPV1hTWUJ3eUJGKy91WlFLODM4T2V4Q3FSdW1r?=
 =?utf-8?B?bmsrc0RscGtVVWRIQ0tUMzFvaG1mTU03dGpSU3BpeFB6S3o5ZSt4cVd2ZGc4?=
 =?utf-8?B?QUc2ZnRZb1VCbFU5aUthNzJKeCs2NFhYbzJSYlp1aDVaTEMvR3U0bGUxWjNS?=
 =?utf-8?B?YXBwWXBCTmVrVUo3Q0lYZTVNS05aQVVTMmhncTMva3dGWUNtSm8rSlo0QXEy?=
 =?utf-8?B?VmVYUThYd3dXU3ZCL2hBNWhFT3luaXV0a0FhNW5nbGdKdGE3UUFZZVdJNHIy?=
 =?utf-8?B?R1ZzTm5HQnl6UVFUSysxT1g5U2hIQTlTSUI0NXBWYTgrc0lWVTFtWVdYYzAr?=
 =?utf-8?B?T0JrZGsybTlMRW5GZ2hzY1Jkd0VnSzdOcGJkOGNMamVnMFd6WHVwN2JGK2I0?=
 =?utf-8?B?NkFrYVhQckhSaCtpRG85QVV1ci9mdlZrOGl4SThselRQYmZ2WjRJdHB5K2Fj?=
 =?utf-8?B?T3JDZUpYUHI1ekNRVGYvcDgxMC9GNndKRkYyR1FiOTRQVFczcFRBeTZKZFpY?=
 =?utf-8?B?dDJ2UGhZZkNmTjMzNmpCbXlEN2kyak4yM2lUZmxXak1GcDl3aC9Zbmo4L3FP?=
 =?utf-8?B?MFN4aUtIamU5dk9STjMzMVdudXYweTErT05lQ1lPdVpITkRBSUxqcklQb1VP?=
 =?utf-8?B?SEFVR20yejdybFZuU0M2U1k2TU50Sm9jQXk3TU5FN3MyOG90ZkVQRXExTmxh?=
 =?utf-8?B?KzI0d0tWNHo1b3F5UXV5M1BCVWYwU0xHWWJXeUZsWDdlMmRjTDJUOGkrVTlV?=
 =?utf-8?Q?ZOG2LbNAr37i3Nan6ZEqxcv5OEijaPou?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2xxUVpKNm9iTlBUaDZPQ1NybjVzaTJ1L1ZzQ2FzVHdTSXBVdVZIUzVLUmxM?=
 =?utf-8?B?a0d1Ni9rYXAzeS9kWW11K1ZFQ3B2RFo4WStIQjM2dytUOXpPQVE5RXA5a2xW?=
 =?utf-8?B?Y05pT2FFQXpmLytiUzUwWm1EUEQ5cUMzV3QxTmVrN3FuV3FjcWFGLy9Gb0Jh?=
 =?utf-8?B?MVhiVUwzeU1CNTk0L1BMNGFxQVMvVjJ5bjBYVVFhUkVkQ0hJOFdOVzdMTU9T?=
 =?utf-8?B?bXBlM0s5SEdEbWx6Z1VtUjlyWkJtMUdneEIzcDJhRGF2N1hvZEZSL0hqN2N5?=
 =?utf-8?B?Y3dQb3FNa1lPdjNpa3JIZXJjb1h3aFEycVhaL3JlUld5UTcxcFFncFI2WW9a?=
 =?utf-8?B?RlE5ZitYY2lib0VEaEI3cHdLZnRkYndvSzdOQk41dW43eVpOZVRWdmxkdjI4?=
 =?utf-8?B?U1pFc244Nzlpa2hia0xuMDkzbVJwS1hjd3RLRlVVWUxFU3ZaRzlGVmE3VFZH?=
 =?utf-8?B?bXBPdWNVZ054QjU3Z29CN2FKSjN3N2EybXZ5OTJuWnZMSHFML3k2a2NscytH?=
 =?utf-8?B?Zzh3Q3YxOWlUcGpvN0xxNlVORytSU0RsRUNLcHJnY09POTdGOFJ0bXlsMk9k?=
 =?utf-8?B?V1c2R1AwemJmK3pibS80dFFGa0pzWGFJYm1YbFdsQTUrOXVVTXJmSFJEYzI1?=
 =?utf-8?B?WWc5V0pjcm1xTXNuK01uWmJWeFlzNGJqU0tudHJLS0J5Y2JJK2hBU3BoSGti?=
 =?utf-8?B?dklsUzRRY3lEUElxTmRSR1Q1Y1RaR1BVVDRLck0wUXJaZU4rNmloY1hydjdr?=
 =?utf-8?B?d1d4TVoxNmFZTFN0ZExWWERBUWFaWWMrWWp0emYwTktrSlFtZC9xV2FOUFVq?=
 =?utf-8?B?cE1CQjE0VDdHZVhuMFowNHpoclJLVEZ3ZW5GV016bURnYmc1SnFweUkxN1Zl?=
 =?utf-8?B?Wml1K3NtSXBsMFFiVXk3dXZ4b1RPeURnMy9jeUp0b3N6WlcvbWxkemRPc05X?=
 =?utf-8?B?ZXJCcm5QVms5blkzWDBzVXNiTStxVEVUUnFRSHFKY2h6akNoT0gvMDhieTB1?=
 =?utf-8?B?UzFkaGs1UEpoeEdSc1Y3dURZSkV4N2RCK3VjdVV4TEZJb0swVTBkcHlqWk5H?=
 =?utf-8?B?aUdOZlY5Kzkvbk5tZUVNUmM2UndmaHU3VURlZDhEdk5id2h1VEN4c0JWOTRW?=
 =?utf-8?B?bkViOTRvN3B4ZW8zYkMwQWowV2xKVmdtWlI5OG5Fd3FqS0Q1TXU0S2VTaXli?=
 =?utf-8?B?MzMyUjlrY1hXV2tqMXB6bkVOWStMeUc1aU1lL0Iyek1yMkN3RjN3aXppakV3?=
 =?utf-8?B?d3E2ODN5M2FhUE00Wmg4czFtQmtudTJ3QU5UTHJIcGNqQzl6VHZFbkcwbjY2?=
 =?utf-8?B?dkVQQllOejVqelRVODNWa0s5OE11bzBLd3NCOEpZTnVNenBRbTI3dFBIK3F6?=
 =?utf-8?B?U05lOU1Id2VHV1BFMnBWeGV4b3VoQW9HNGZkdjFXa2ViNWVMbE5LWlNUVEpo?=
 =?utf-8?B?bHhwSXEvQmF0QWQzZ2syRUg1dXJFVllqbXpsa3FCanVxZzl2UWoyZmVTSko3?=
 =?utf-8?B?UFFzeWkycmVvNzNLeDVrb2hIbldsdWtjSU85cFJxc3BDaXRnSTltWFZMV0JP?=
 =?utf-8?B?anNuWnpEbVRBUndVT1NuZlpSWEUrenZpekZLcGJnYk4rUjFnRmtPK0NXeXJM?=
 =?utf-8?B?TFc0azF5bHVjd3NiS1pqY1YyZTV0TlhPeUlyMUVmbjUzNVQwZ0RmY2JxMmdG?=
 =?utf-8?B?ay9Sd3NqR3pxQ29mSzR5T0JCTjFoNmRab2RBRDk1SHd3T2duUUoyczlmWHZD?=
 =?utf-8?B?MlZmSnNQMHkzWU5LSTlNMFB3d3ZoVUhaU0ZITVFmVmJicUNTbDhPUlU3QnJH?=
 =?utf-8?B?VjhMS3NVcUZuMUJBbUdCbmFmYzdFQjI1ZTRjaXBaNy9lcXdyV1lsMXlidHAz?=
 =?utf-8?B?SFkzYVRGQ0VNaXZrUmFvZTg5NFhKS2p2UTZqVzlUL2YrTW8zL1pZSEQ5TS8z?=
 =?utf-8?B?c0ZYbnNwdUN1YkZ6ajV4SVhyRm9IOGdGejdxTCtwbk5KdmJmNmg3MHlXUURr?=
 =?utf-8?B?cy9iNkx1dmtjdmd6MGZjVGFROVVKQVhwN0hHQjl6NjhjUFlZWnd0bmtKSi9I?=
 =?utf-8?B?ajNVT0FKOG1uQThsNGtiK01qbCtrN3JUQVp2bzh2dEt0UnIyR1pqc1Ftcy94?=
 =?utf-8?B?VC9NT212RkFjWUdPY3IweGhWWFByRy9MTlZGVlhiL242d1ZSdFFTUGJTaDBk?=
 =?utf-8?B?U3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: df59551a-2310-4603-70ba-08dd469d3b0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 10:58:47.0513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Ag7BFR23FkxoNDVpbNYitN6uJCwXhQbzqCSBY+b25oOIsvRD0n0gtRpTmvCnczdG30r76BN7s8z4kO2qM5phWqAJLJPKxvZa7LtyYKcA/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13329

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA2IEZlYnJ1YXJ5IDIwMjUgMDk6NDcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiA3LzhdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzNlLXNtYXJjLXNvbTogQWRkIHN1
cHBvcnQgZm9yIGVuYWJsZSBTRCBvbiBTREhJMA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZy
aSwgMzEgSmFuIDIwMjUgYXQgMTI6MjUsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4gd3JvdGU6DQo+ID4gQWRkIHN1cHBvcnQgZm9yIGVuYWJsaW5nIFNEIG9uIFNESEkwIG9u
IFJaL0czRSBTTUFSQyBTb00uIEl0IGlzDQo+ID4gZW5hYmxlZCBieSBzZXR0aW5nIHRoZSBtYWNy
byBTV19TRDBfREVWX1NFTCB0byAxIGluIGJvYXJkIERUUyBhbmQNCj4gPiBzZXR0aW5nIHRoZSBz
d2l0Y2ggU1lTLjEgdG8gT04gcG9zaXRpb24gb24gdGhlIFNvTS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3J6ZzNlLXNtYXJjLXNvbS5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3J6ZzNlLXNtYXJjLXNvbS5kdHNpDQo+ID4gQEAgLTUsNiArNSwxNSBAQA0KPiA+ICAg
KiBDb3B5cmlnaHQgKEMpIDIwMjQgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ICAgKi8N
Cj4gPg0KPiA+ICsvKg0KPiA+ICsgKiBQbGVhc2Ugc2V0IHRoZSBzd2l0Y2ggcG9zaXRpb24gU1lT
LjEgb24gdGhlIFNvTSBhbmQgdGhlDQo+ID4gK2NvcnJlc3BvbmRpbmcgbWFjcm8NCj4gPiArICog
U1dfU0QwX0RFVl9TRUwgb24gdGhlIGJvYXJkIERUUzoNCj4gPiArICoNCj4gPiArICogU1dfU0Qw
X0RFVl9TRUw6DQo+ID4gKyAqICAgICAgMCAtIFNEMCBpcyBjb25uZWN0ZWQgdG8gZU1NQyAoZGVm
YXVsdCkNCj4gPiArICogICAgICAxIC0gU0QwIGlzIGNvbm5lY3RlZCB0byB1U0QwIGNhcmQNCj4g
PiArICovDQo+ID4gKw0KPiA+ICAvIHsNCj4gPiAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNh
cyxyemczZS1zbWFyY20iLCAicmVuZXNhcyxyOWEwOWcwNDdlNTciLA0KPiA+ICJyZW5lc2FzLHI5
YTA5ZzA0NyI7DQo+ID4NCj4gPiBAQCAtNDMsNiArNTIsMzQgQEAgJmF1ZGlvX2V4dGFsX2NsayB7
DQo+ID4gIH07DQo+ID4NCj4gPiAgJnBpbmN0cmwgew0KPiA+ICsjaWYgKFNXX1NEMF9ERVZfU0VM
KQ0KPiANCj4gTm8gbmVlZCB0byBtYWtlIHRoaXMgY29uZGl0aW9uYWwuDQoNCk9LLg0KDQo+IA0K
PiA+ICsgICAgICAgc2RoaTBfcGluczogc2QwIHsNCj4gDQo+IHNkaGkwX3VzZF9waW5zOiBzZDAt
dXNkIHsNCg0KT0suDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIHNkMC1jZCB7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0gPFJaRzNFX1BPUlRfUElOTVVYKDUsIDAsIDgp
PjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHNk
MC1jdHJsIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwaW5zID0gIlNEMENMSyIsICJT
RDBDTUQiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlbmVzYXMsb3V0cHV0LWltcGVk
YW5jZSA9IDwzPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAg
ICAgICAgIHNkMC1kYXRhIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwaW5zID0gIlNE
MERBVDAiLCAiU0QwREFUMSIsICJTRDBEQVQyIiwgIlNEMERBVDMiOw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJlbmVzYXMsb3V0cHV0LWltcGVkYW5jZSA9IDwzPjsNCj4gPiArICAgICAg
ICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHNkMC1pb3ZzIHsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBwaW5zID0gIlNEMElPVlMiOw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJlbmVzYXMsb3V0cHV0LWltcGVkYW5jZSA9IDwzPjsNCj4gPiArICAgICAg
ICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHNkMC1wd2VuIHsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBwaW5zID0gIlNEMFBXRU4iOw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJlbmVzYXMsb3V0cHV0LWltcGVkYW5jZSA9IDwzPjsNCj4gPiArICAgICAg
ICAgICAgICAgfTsNCj4gPiArICAgICAgIH07DQo+ID4gKyNlbmRpZg0KPiA+ICsNCj4gPiAgICAg
ICAgIHNkaGkwX2VtbWNfcGluczogc2QwZW1tYyB7DQo+ID4gICAgICAgICAgICAgICAgIHNkMC1l
bW1jLWN0cmwgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHBpbnMgPSAiU0QwQ0xLIiwg
IlNEMENNRCI7IEBAIC05Niw2ICsxMzMsMjUgQEANCj4gPiAmcnR4aW5fY2xrIHsNCj4gPiAgICAg
ICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwzMjc2OD47DQo+ID4gIH07DQo+ID4NCj4gPiArI2lmIChT
V19TRDBfREVWX1NFTCkNCj4gPiArJnNkaGkwIHsNCj4gPiArICAgICAgIHBpbmN0cmwtMCA9IDwm
c2RoaTBfcGlucz47DQo+ID4gKyAgICAgICBwaW5jdHJsLTEgPSA8JnNkaGkwX3BpbnM+Ow0KPiA+
ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInN0YXRlX3VocyI7DQo+ID4gKw0K
PiA+ICsgICAgICAgdm1tYy1zdXBwbHkgPSA8JnJlZ18zcDN2PjsNCj4gPiArICAgICAgIHZxbW1j
LXN1cHBseSA9IDwmdnFtbWNfc2RoaTA+Ow0KPiA+ICsgICAgICAgYnVzLXdpZHRoID0gPDQ+Ow0K
PiA+ICsgICAgICAgc2QtdWhzLXNkcjUwOw0KPiA+ICsgICAgICAgc2QtdWhzLXNkcjEwNDsNCj4g
PiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZ2cW1tY19z
ZGhpMCB7DQo+ID4gKyAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJTRDBfUFZERCI7DQo+IA0KPiBX
aHkgb3ZlcnJpZGUgdGhlIG5hbWU/DQoNCldpbGwgcmVtb3ZlIGFzIHlvdSBzdWdnZXN0ZWQuDQoN
CkNoZWVycywNCkJpanUNCg==

