Return-Path: <linux-renesas-soc+bounces-14433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B14A634F9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 11:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ADC23ADAB0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 10:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6CA18C01D;
	Sun, 16 Mar 2025 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="T4fN3ZIk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6602B188587;
	Sun, 16 Mar 2025 10:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742120171; cv=fail; b=s7425NxgLCuow2A8JQvqb6UTf7wLw6M69Q3t8bqLMMptiAZiFADoBIcwznvOzxG3m/9kmaM6z/lxFQ+WTX+PS/a5MsIHFLJ7FEFbzLfYKRUSGhp2laho18f2TPLgX5fgr56piimSWWRNTw0yauWsDTv6ZXyNz5S8U/Xo0GaDQzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742120171; c=relaxed/simple;
	bh=heeydgBgG184w3tOASk21Gtwm5dH+gyMasaMquY0GMw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b07AoL//eknRL7h811DZpxZBibrx0EHEH5pFpkp0j86h8yvKRi38hGHdiBMD9ZJIXtiaBKcohmQMBkTtMKfBrx4BdYvP8HwCAlI/T7N4KPTBiVMW4OJhjw9gi7qkto0o+i7x6gqTd7NWmQQ3BPGRcG6Zug6MR7tfJcElr/g0+HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=T4fN3ZIk; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LocdtesfwF4Z9qxCMoN596AVVex3rd9ivfTtAKDmtx3f+r8fVN6CW+DLoi3qDKjaCOl5w0G8qOclahWAxFogj0WdY49mz6yQwGIEmgensQWDEU4RYjExET3LrnN0mPFW0+Vv2CRLghLdAM0C6ZrI21KoRF6HZOyuE7AefBWJrrwmuVzJRgbgrystlyt6xBUE/qmT1AB/qvKzwfFmfInD5l0zkKiL66+/mmJT7dO69z+JzP3MnTVS9q+95n8lFS1r+NK0lQO46nRyWo96yK4EU8qM57eqVFqikTko5o2LjLEqRLmViXdZnmsKjKASaIfyGsWXD0DVOI92v3p7X80mKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heeydgBgG184w3tOASk21Gtwm5dH+gyMasaMquY0GMw=;
 b=DgyFJQtU77A2/PK10qBRsfbS5bIBg0UIdpsxBE2DVT0JSQVidW8pdLmiSr4yVxkeGvWEUG38iL0tesdgnREDaxx4Yh0COiPreveZQ9CzdhK5hc85fERSxJVeEPSm5XCpN6y4nCJzcHNzhmXNZi/Vo/6xxzlTWPn6/cz25C9vtsBoWRE2dIQRzO0l4gM9GoBTg7ir42/Mjj9GWWUZy5KlxiMrQ+WAAz3XF7XfTZk1CTSi84Jb2NBfyIOBKW9RoRV5Z9M9O5zuoC8vwZamyXvQ0uGx/LQ3kF0186O0MWv9U77FQagEHWSWDNVKX1VoNKxYkwJxukULG1Pm5dkmROZu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heeydgBgG184w3tOASk21Gtwm5dH+gyMasaMquY0GMw=;
 b=T4fN3ZIkz3l0VHlYkLsi6yJWg/Hp3iB2ryQa12Z7w9tbeec0mnCnJ8iTM2do8WxgIG+dsR3WvvnFjXQ4wK08rBp1mLcFc1uxpMkijhcycIHVXXGiFmbsB1R6/sHxwX4AzNshrw9+cmuegagUAp86+hN2omMqOCn6VVpket2JYgQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8626.jpnprd01.prod.outlook.com (2603:1096:400:15c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Sun, 16 Mar
 2025 10:16:02 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8511.026; Sun, 16 Mar 2025
 10:16:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 11/11] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 CANFD
Thread-Topic: [PATCH 11/11] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 CANFD
Thread-Index: AQHbgfL+eY4rbjrxUka+YWgvxJZr7bNy8nAAgALBUmA=
Date: Sun, 16 Mar 2025 10:16:02 +0000
Message-ID:
 <TY3PR01MB1134654DE8D904F8DE87D43B286DC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250218105007.66358-1-biju.das.jz@bp.renesas.com>
 <20250218105007.66358-12-biju.das.jz@bp.renesas.com>
 <CAMuHMdVL1nbyQj-WGKXgkV4jCb-d=EezpFV=uzc3KbbwuxbHPA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVL1nbyQj-WGKXgkV4jCb-d=EezpFV=uzc3KbbwuxbHPA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8626:EE_
x-ms-office365-filtering-correlation-id: 8c62c333-8d19-46b2-d9ac-08dd64738e31
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VGMwZVhHWlFiM1RQNkxOV1ZPQUI5WDMvMS80VCtjcnBydUtwYXk5QTJHa2Nk?=
 =?utf-8?B?N21YdjdVTEdZeEVJc3VlNjB2NTNnUmxjRHpEeGJ1ZHJnR3ZDaFlZb2VRTHl1?=
 =?utf-8?B?RlJGVnJRVTJObkMzM1BYY0xNMjZ3RWJTWlJtbU5jVGc5aUlia1hJRDdwZjl0?=
 =?utf-8?B?blhFcCtOczBoR3NRZmhhL3NUckFpN21sQlhRcCtzQWZCZVcwcTBlL0UyM3Vj?=
 =?utf-8?B?YmxhNEtOSDRlZFRWSHJNMGMxODBMVE5xMDRRcnpVWjdKNWZ6T2lyMVhtSEg5?=
 =?utf-8?B?ZUN1RFhWMzViMC9iaEtLQWVQN0c1ZVlSdklBR3NxTFRDYSswWWx5OWduNFpJ?=
 =?utf-8?B?ekRZLzh0MWtxd0R1WUFPTkRQbHphSEV6STVsTGlYRVV4cmxUYk1nRGpOQkZ5?=
 =?utf-8?B?dEJvQ3RRRjg4QVZSb1M5R0JhalVJQUxKbEVjRUllb3pMVlpsWnBuT0pXRUg2?=
 =?utf-8?B?VnNFV1lKb29aT3k3VGtoTU12bEY3VUtublNzam1sWlJvaDZlbS8xVDcrVUtO?=
 =?utf-8?B?M0kyM3ZjWWZnNFgwOUJoVTRUazJtNXo1SXk3Ymx6MzhqQjBmV3FMS0Z6SUov?=
 =?utf-8?B?MWdKSGRuR1B3RW9xL1hESW02OXJLM2pTNzNhY2RHR3JIdEw2MnZuR0NOYWxT?=
 =?utf-8?B?Z0xSbG5FZWFzVE1SUmVFajZSdzJ3SkV2TENYV29McXQxalpveXY1a3lHVEdH?=
 =?utf-8?B?OG1wSVRLV3pObi9weldCY2w4UEk0SG9RK1k4dGI5eUV3d0NoZEVNK3FKVkhs?=
 =?utf-8?B?L0V1K0dyZ3ZRQTYrQUU2WDdLVVZSamovaFBWWkpBelg5YksrZ3dSUitxT3pn?=
 =?utf-8?B?b2NxaGlyT3V3dlYzNjdpL1I2TjJMTGFIOWxCYVV1cG91NEorRWEwZ1kxeXp6?=
 =?utf-8?B?ZDVxSnpiR1hxOWJWVnE5RmFyWTlzNzY5cnQvVTZSVXR1VmxoZ2xXWVdPdFRs?=
 =?utf-8?B?QzFYWEs1cmVsRjdhVEd6SXhtYnB0alFWamhKYWxwcGNNaDVvaHBhY2pOMWhk?=
 =?utf-8?B?bjZFYVdqWk1MMFBPVUtrK3ZBbHBUWlV3VnVMNTBFUWlTTUg4RTBONUlwVkhp?=
 =?utf-8?B?TXF2VjdsZG14VVNPZ1BhWUhOV2ZBTFlianNydm40S29MRStyWUJJTmh6akJl?=
 =?utf-8?B?dXk1N1BZcDJIYTBvSE5KVm1wcUQrbWFtWE0zM05QN1k0YkxERlQ5OWRvMzdD?=
 =?utf-8?B?OW13Z3ZPcWNOc1l1emNha2JsZC9heUJ3ZHoyYVZBM2h6K3ZwMWtnOEJTVXdZ?=
 =?utf-8?B?b04xdmU1c0ZWSmVINFlwTmV1VHJGdlBjcG5zVU80clc3NmovYzZ1QVJ1RUpJ?=
 =?utf-8?B?MFBSM003UEl5Wk1lb2FPaGZyWG85VFdYTEVpYWlZUnhRMjBKYml3MXFlYm8r?=
 =?utf-8?B?ZnRnaXR5VS9lZm9QNmd0WmV6OVV0YWJkMnRxVStJZFVUcUtTNkNKMTZpRzVX?=
 =?utf-8?B?b3J2QTMzV1dMbk40ejBOeVVkU09aRmQ5RHRzOURCWFBFWW5obSt2dFFPT0w5?=
 =?utf-8?B?WHgraFRUQWgybWNRMmJGRWhVYTNnazBaUkdyd2Z3NTFBUExyWkxtT0o3cFBQ?=
 =?utf-8?B?MUhsWWhYdVJNS1h3cWhOb1ZJZ3dLS1N3L2lFMWpIbTlhVnpBMjVXTUVnR1lF?=
 =?utf-8?B?d1dEZWJaWlFoZUp5WWpJTE1iZk4xa2tpUE1KZWt2UUk5b3JoemF0aWthZkxR?=
 =?utf-8?B?cDVrVkhsV0YrOVhXaTRZbzB0dVppYzRYems1UmlwakVFcXdLa0M0ZU5yK1BI?=
 =?utf-8?B?RHlGbmNybGY5VDUrKzRCOHlvK3E5Zy9HaTB1S25hTE80UDdKY0VmRzRidzVW?=
 =?utf-8?B?cUR3VE8yVzNVNVY0cVFRSno3MEN0L0RUUHhXeDM2Rk5nSXpkUEoydDZFbGN0?=
 =?utf-8?B?OXY0WVNONVoyY2V4anhXU0Z3VzY1U3dHVEJ5SzJUK25ac3NwaFRVUVhwOWVF?=
 =?utf-8?Q?qBdVGvFtR8Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YjNIWkRZa3ZUZnRRLzRNeVNkNW5LQkxBS1FQaUNZcFViKzBSZU1ZY0cvS3dR?=
 =?utf-8?B?TVZsMDBCRXRoMWlSZnl3aUxXZ0pvTG9mUDRIeTNsRkdXc3ErNHNDVUZjM21X?=
 =?utf-8?B?dzk2ZmhpdEFSUTcvQUhDcmJ6VVltSGo0NjNyeXc1ZTkvVjRVWUZCcVdicGZh?=
 =?utf-8?B?OEhxSVBZVENZZGJiTVo1ZkhOMElHbFZCUjNzUUVGQW9xdnB1TWhqSlFLT0dT?=
 =?utf-8?B?TzNHYlBENjR1RitsaWVYb1plOFRpS3ViUVc0ajZmZENMcXhVekxFOVRaTlJQ?=
 =?utf-8?B?TjY2NFRPbE16anlzRkphQlc0dUNHdEdtTE5ZK2VUa1dYd3ZjbytZTm0xWTVS?=
 =?utf-8?B?ZndTRlR0ak8vNEtydi9rVVFja25Rd25GRU14eHJqN0czVytlTzhJcTM2YmpG?=
 =?utf-8?B?VFZhREo5UGFTbnZRbUhXRlc1T0RCQnZaQ3R1ZEFtZ0xQZzZvbFU0WWdhdkRJ?=
 =?utf-8?B?M3N3Vld1R1lPSFJaUkVIRmZNaUJDenp4ZDFlNG5wc1Z3aEozU3ByVXZ5aU0v?=
 =?utf-8?B?QjFFazN6TTFORUQ1WXRNdkJpN2Q5b2w1aDhUWGlkbmQwbDhvMHhKY1d6cTBQ?=
 =?utf-8?B?UHMvWXpSQU9xMlp5dWJzY2ZodEZRUDg4Y3VwU2RtcWd1bU1COWE1Y1AvckZO?=
 =?utf-8?B?TExNc2RhOE5UQ0orQWxxNXBaQ1llSXV6M0lmSzBtbXJvTUEzNzk4c2tVMWho?=
 =?utf-8?B?VlU0RTBFMDRMRXRmeU1UU3FiVXM3dmdWd1hXV1RWQlNGUkx5MFZCRExOQk9x?=
 =?utf-8?B?WUEyM2JydE80cDRMdTQ4KzlCZkJ6a2NGaWZtcm9CTUJHaS9zalFZeVNXNm1C?=
 =?utf-8?B?dzVreVRxTkljbG9RWEhZTG0wV0l6U28xRVI0L3kza1RiTk9GS2ZGL1hOZFdx?=
 =?utf-8?B?YUlFZ290ekdTMXlDUlROS3BzU1VrM2cvQ0dHV2RmRGdQQTQrZENhcStvY2NV?=
 =?utf-8?B?SmFQeXM2ak0rNDA2VmtoeFRyOWkvR3pta25zME9XcjdhK2QzcFVHRkRMRm1w?=
 =?utf-8?B?azZneVRRMVFRbnFtQkdDeXYxeld4WFdYSURJd1RqVytWVDE0WU9pb2pQNDU5?=
 =?utf-8?B?OVRSSFlSM0JYSVp5c1AyOERJUDFaL2VXbEVGUjgvMCt4M0h6VUJXTFhwR0pX?=
 =?utf-8?B?Y3pTd1dJTVM2K3ZqWkRqWU82Nzg5OUhSVjc0VlZNN21yTGgxTE81NnVpSGdx?=
 =?utf-8?B?NEtSQ0VlS2ptaG5OUGFjTkVIbk5HREJOUHQyMEhzdGRYR01uSHNWT3ZWSUQ3?=
 =?utf-8?B?WWdZc0lOVjBFWWM4Mng1ck85QzIydDJUcEVTcENUdzVwOVRONVBBQnJYVUV1?=
 =?utf-8?B?NDkzVjNMS2djczlYOUZNMlpkRzB6djhqTklTY3pTclRCOXl1aFU5azYwZ056?=
 =?utf-8?B?SUc4M2NTcTVaNUZoQ2JFbnB1M0NxRUorTWhrcFhGaGJVSXh2TGlpRU15eEVY?=
 =?utf-8?B?eDZzaHp2RUM3eUVHa2F4UDlkZXJoM3UyOVg4UUhkOWJPTGwzNEJMdWN5Uy94?=
 =?utf-8?B?Q3FDVnN0MU56Ry9jTHVUOWdySjB6bzI0b3EyYStGWHovSG1aSFMzY1ZiNGlG?=
 =?utf-8?B?UXRNY3lyL0xremU2OFdWU3NFTURlVEJtSWVuY3p5dVpvcWt1WThZZUNhbmJK?=
 =?utf-8?B?c2E4eERDTVZvemhGK1VEeVBndk5OR20yeXFsU1Z0T1NQWStzeTVTQ0NBYmtq?=
 =?utf-8?B?Um9WTGpUQUtpbzc3SFN3WUlkY0Q5eHJTZ3NsZ1UzeStBaktDZCtVc29tSStl?=
 =?utf-8?B?SHo3cDB5NytWdndiZUcycldlQTRpeVM1R3Z3eFUrVXFNNUdpd20xa0FYVXo5?=
 =?utf-8?B?TThiY0YwWk1GWkQ4OWFVWURaVkVxVkZPZ2VkekNYY1VRZU9NRVVocGxvNVF0?=
 =?utf-8?B?a2VMQUlmSUhIa1VGdFhTT0kzN2hnTHpod29oV01xWTBrWU01bGR1T1ZZVkw2?=
 =?utf-8?B?SGdCKzdPUStUYUxvcFdCcnlXS1dBQTdzUUEwdTJBVC9MK2pmSEU4R3pMLzVW?=
 =?utf-8?B?TWthME0zbEFxK2VjOVR2dHVpU3Z1WUNRNXo1UGdOUWZ6eWpkOVRXSzZTUlJL?=
 =?utf-8?B?UWZKa1pVZ1hQV1A1bHdiTTA1NHZZeldZclJVd2Urc1oxZm9pYTZOZldLTjJR?=
 =?utf-8?B?WkR3dmc1RFcvY0dWTThYVTlHNVhaOHBpanFCVkk0K0swaWR5TEpFcEtrb3ho?=
 =?utf-8?B?UEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c62c333-8d19-46b2-d9ac-08dd64738e31
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2025 10:16:02.5824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+H0poDNxAuyQiRLfgDP1YkwLTESQCIBgsZdcIkcpsxBE/qSLMX951gaX3FLbF/OmSO4xzSUnpy7fomtvvUd9jy3YYSwbQyw0F8q0RzAzqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8626

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE0IE1hcmNoIDIwMjUgMTY6MDcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCAxMS8xMV0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDlnMDQ3ZTU3LXNtYXJjOiBFbmFibGUg
Q0FORkQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIDE4IEZlYiAyMDI1IGF0IDExOjUw
LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEVuYWJs
ZSBDQU5GRCBvbiB0aGUgUlovRzNFIFNNQVJDIEVWSyBwbGF0Zm9ybS4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRo
YW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3I5YTA5ZzA0N2U1Ny1zbWFyYy5kdHMNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjlhMDlnMDQ3ZTU3LXNtYXJjLmR0cw0KPiA+IEBAIC0xMCw2ICsxMCw4IEBA
DQo+ID4gIC8qIFN3aXRjaCBzZWxlY3Rpb24gc2V0dGluZ3MgKi8NCj4gPiAgI2RlZmluZSBTV19T
RDBfREVWX1NFTCAgICAgICAgIDANCj4gPiAgI2RlZmluZSBTV19TRElPX00yRSAgICAgICAgICAg
IDANCj4gPiArI2RlZmluZSBTV19HUElPOF9DQU4wX1NUQiAgICAgIDANCj4gPiArI2RlZmluZSBT
V19HUElPOV9DQU4xX1NUQiAgICAgIDANCj4gPg0KPiA+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Z3Bpby9ncGlvLmg+DQo+ID4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3JlbmVzYXMs
cjlhMDlnMDQ3LXBpbmN0cmwuaD4NCj4gPiBAQCAtMzMsNyArMzUsNTAgQEAgdnFtbWNfc2QxX3B2
ZGQ6IHJlZ3VsYXRvci12cW1tYy1zZDEtcHZkZCB7DQo+ID4gICAgICAgICB9Ow0KPiA+ICB9Ow0K
PiA+DQo+ID4gKyZjYW5mZCB7DQo+ID4gKyAgICAgICBwaW5jdHJsLTAgPSA8JmNhbmZkX3BpbnM+
Ow0KPiA+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArDQo+ID4gKyAg
ICAgICBjaGFubmVsMSB7DQo+ID4gKyAgICAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4g
PiArICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgY2hhbm5lbDQgew0KPiA+ICsgICAgICAg
ICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gKyAgICAgICB9Ow0KPiA+ICt9Ow0KPiA+ICsN
Cj4gPiAgJnBpbmN0cmwgew0KPiA+ICsjaWYgU1dfR1BJTzhfQ0FOMF9TVEINCj4gPiArICAgICAg
IGNhbjAtc3RiLWhvZyB7DQo+ID4gKyAgICAgICAgICAgICAgIGdwaW8taG9nOw0KPiA+ICsgICAg
ICAgICAgICAgICBncGlvcyA9IDxSWkczRV9HUElPKDUsIDQpIEdQSU9fQUNUSVZFX0hJR0g+Ow0K
PiA+ICsgICAgICAgICAgICAgICBvdXRwdXQtbG93Ow0KPiA+ICsgICAgICAgICAgICAgICBsaW5l
LW5hbWUgPSAiY2FuMF9zdGIiOw0KPiA+ICsgICAgICAgfTsNCj4gPiArI2VuZGlmDQo+ID4gKw0K
PiA+ICsjaWYgU1dfR1BJTzlfQ0FOMV9TVEINCj4gPiArICAgICAgIGNhbjEtc3RiLWhvZyB7DQo+
ID4gKyAgICAgICAgICAgICAgIGdwaW8taG9nOw0KPiA+ICsgICAgICAgICAgICAgICBncGlvcyA9
IDxSWkczRV9HUElPKDUsIDUpIEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiA+ICsgICAgICAgICAgICAg
ICBvdXRwdXQtbG93Ow0KPiA+ICsgICAgICAgICAgICAgICBsaW5lLW5hbWUgPSAiY2FuMV9zdGIi
Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArI2VuZGlmDQo+IA0KPiBQbGVhc2UgbW9kZWwgdGhpcyBh
cyBwcm9wZXIgQ0FOIHRyYW5zY2VpdmVycyBpbnN0ZWFkIG9mIEdQSU8gaG9ncy4NCj4gVGhlIHR3
byBDQU5GRCBjaGFubmVscyBzaGFyZSBhIGR1YWwgVENBTjEwNDZWIHRyYW5zY2VpdmVyLCB3aGlj
aCBJIGJlbGlldmUgaXMganVzdCBhIHNpbmdsZSBjaGlwIHdpdGgNCj4gdHdvIFRDQU4xMDQyIGlu
c3RhbmNlcy4gIFRoZSBUSQ0KPiBBTTY4IFNLIERUU1sxXSBjYW4gc2VydmUgYXMgYW4gZXhhbXBs
ZSwgYXMgaXQgYWxzbyBtb2RlbHMgZWFjaCBUQ0FOMTA0NlYgYXMgdHdvIFRDQU4xMDQyIGluc3Rh
bmNlcywNCj4gYnV0IGxhY2tzIHN0YW5kYnktZ3Bpb3MuDQo+IFRoZSBXaGl0ZSBIYXdrIERUU1sy
XSBsYWNrcyBzdGFuZGJ5LWdwaW9zLCBidXQgZG9lcyBoYXZlIGVuYWJsZS1ncGlvcy4NCg0KSSBh
Z3JlZSwgdGhpcyB3aWxsIG1ha2UgaXQgbm9ybWFsIG1vZGUgZHVyaW5nIG9wZW4gYW5kIHN0YW5k
YnkgbW9kZSBkdXJpbmcgY2xvc2UuDQp3aGljaCBpcyBtb3JlIGVmZmljaWVudCB0aGFuIEdQSU8g
aG9ncy4NCg0KSSB3aWxsIG1vZGVsIHRoaXMgYXMgdHdvIFRDQU4xMDQyIGluc3RhbmNlcy4NCg0K
PiANCj4gWzFdIGFyY2gvYXJtNjQvYm9vdC9kdHMvdGkvazMtYW02OC1zay1iYXNlLWJvYXJkLmR0
cw0KPiBbMl0gYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3doaXRlLWhhd2stY29tbW9uLmR0
c2kNCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3JlbmVzYXMtc21h
cmMyLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcmVuZXNhcy1z
bWFyYzIuZHRzaQ0KPiA+IEBAIC0xMiw2ICsxMiwxNyBAQA0KPiA+ICAgKiBTV19TRElPX00yRToN
Cj4gPiAgICogICAgIDAgLSBTTUFSQyBTRElPIHNpZ25hbCBpcyBjb25uZWN0ZWQgdG8gdVNEMQ0K
PiA+ICAgKiAgICAgMSAtIFNNQVJDIFNESU8gc2lnbmFsIGlzIGNvbm5lY3RlZCB0byBNLjIgS2V5
IEUgY29ubmVjdG9yDQo+ID4gKyAqDQo+ID4gKyAqIFBsZWFzZSBzZXQgdGhlIHN3aXRjaCBwb3Np
dGlvbiBTV19HUElPX0NBTl9QTU9EIG9uIHRoZSBjYXJyaWVyDQo+ID4gKyBib2FyZCBhbmQgdGhl
DQo+ID4gKyAqIGNvcnJlc3BvbmRpbmcgbWFjcm8gU1dfR1BJTzhfQ0FOMF9TVEIvU1dfR1BJTzhf
Q0FOMF9TVEIgb24gdGhlIGJvYXJkIERUUzoNCj4gPiArICoNCj4gPiArICogU1dfR1BJTzhfQ0FO
MF9TVEI6DQo+ID4gKyAqICAgICAwIC0gQ29ubmVjdCB0byBHUElPOCBQTU9EIChkZWZhdWx0KQ0K
PiA+ICsgKiAgICAgMSAtIENvbm5lY3QgdG8gQ0FOMCB0cmFuc2NlaXZlciBTVEIgcGluDQo+IA0K
PiBEb2Vzbid0IHRoaXMgY2hhbm5lbCBhbHNvIG5lZWQgY29ycmVjdCBwb3NpdGlvbmluZyBvZiB0
aGUgU1dfTENEX0VOIyBzd2l0Y2ggb24gdGhlIFNNQVJDIG1vZHVsZT8NCj4gDQoNCllvdSBhcmUg
Y29ycmVjdCwgUGFyYWxsZWwgTENEIHRha2VzIGFsbCB0aGUgcGlucyBhbmQgbXV0dWFsbHkgZXhj
bHVzaXZlLg0KDQo+ID4gKyAqDQo+ID4gKyAqIFNXX0dQSU85X0NBTjFfU1RCOg0KPiA+ICsgKiAg
ICAgMCAtIENvbm5lY3QgdG8gR1BJTzkgUE1PRCAoZGVmYXVsdCkNCj4gPiArICogICAgIDEgLSBD
b25uZWN0IHRvIENBTjEgdHJhbnNjZWl2ZXIgU1RCIHBpbg0KPiA+ICAgKi8NCj4gDQo+IERvZXNu
J3QgdGhpcyBjaGFubmVsIGFsc28gbmVlZCBjb3JyZWN0IHBvc2l0aW9uaW5nIG9mIHRoZSBTV19Q
RE1fRU4jIGFuZCBTV19MQ0RfRU4jIChmb3IgR1BJTzkhKQ0KPiBzd2l0Y2hlcyBvbiB0aGUgU01B
UkMgbW9kdWxlPw0KDQpZb3UgYXJlIGNvcnJlY3QsIGl0IGlzIG11dHVhbGx5IGV4Y2x1c2l2ZSB3
aXRoIFNXX1BETV9FTiMgYW5kIFNXX0xDRF9FTiMuDQoNCkNoZWVycywNCkJpanUNCg0K

