Return-Path: <linux-renesas-soc+bounces-18494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6B4ADE818
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 12:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D0AF189C678
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 10:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF97292B2E;
	Wed, 18 Jun 2025 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tFARKYlk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C97727F4CA;
	Wed, 18 Jun 2025 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241070; cv=fail; b=usyBJDWW4Qo7D7OnajecyrJQ1s7qG1xnqmqKz7jGXd0Qo0pbSiEKufnfOw38DrWTXNJ+ZMFglFq6P5xFyut2Oe+S0/luFR/WtZQkA12WyzMUvq7LBKGea1mKMXYPf5QvGUR43AHZ1xRDUChmfAGD2vbYT+MdY/1BU6q7qFI6SVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241070; c=relaxed/simple;
	bh=j+83FHd1ItuEpgIbdo7Gd+lleRi616N3ka5HeBbnuh0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TAaTAEm1nsLzyV/QKW3E9/qn6kNzhlbOHotbjtOM8Inq6rXn2BamRSWoBdMTMlAFPZt2RzfHyW9lCUSPadX85yESsDGzu5aPB2YOUoPA0aLLIloFQGu1X8vXTqSrH2QR1UGfqUqa5ybbuucDqig5jzqLPN/q5PozSmcKDs/LFpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tFARKYlk; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOmYSCf34cu8hdxv08c06wcKvUmjd7eA3nhfKgoaqJSeoJKjm4/6z2V/fvOSV8IU9iSvefxJMWpZBLYDwjKNWKRhJhoRniXbEe7KbFtmjODSfU0eusPbaSLHxVyjtIPqG/fr2TxZwH3Dpm+fYIdDm2U1XpWF65OPt3RyeD5iXI07hXvAx+S+dtj2DtBf7qhp2VRIhzS0ynBMdci0MgfM3hZtpnH4Z3Bx5YpYPwO9MUp7RUGkAigcznQxVqv5ci/k5vXYIalmYz8FZcsKT2j+gnItY8AGidmLZW0JSuVVjrMiWEOydkjLJeG+9PYOD09pmJkfa/RfW+zEqvKAWEp5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+83FHd1ItuEpgIbdo7Gd+lleRi616N3ka5HeBbnuh0=;
 b=rG7j7BL0Hzu6tlpKphCVprs91ToMFv6l6YHwOlWw17qzAew80xXeHGU9fZ/RS0/3dSyqlrHooINZ8kQ5IxDOljlBd2lT1vBfKHbK8GUzmZv41mSkSuJOt8PCO5Xy1EewOWUXtIccgNnJkUwplZOo0p2lBDbgPTtoBVRsU9N+m1PjuqwB2zJFdRXZ+5h5iokM40UZBM1R+2bmy8xwFjjxzI2II6HPD2nKtnwZKzqV1dQMzS0BEhRMh5q+2VvU9TQrUux5Qw5Wu7TJDbnFEw+nTH7muNkTs+5lBFeoY/hPph+faOtCu7GM3d56zKncnStKb7bxQju1kg9JF9MFjBAxDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+83FHd1ItuEpgIbdo7Gd+lleRi616N3ka5HeBbnuh0=;
 b=tFARKYlkQIqhutE2iHlYyuv752GfIufIaL6q+qAPLdX5FfIHVqMxyuW7rcNJQAhZO2nMdqI7JM17zXbJsS3wWtQKb3hPoOaE99k0dnltOObj9ILvubPvnoU8akm7J8T+p2U6z+cePtx5Tzx0Vbcqr7398SKshAoW9+fPnGcONo4=
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com (2603:1096:604:3a0::6)
 by OS7PR01MB14333.jpnprd01.prod.outlook.com (2603:1096:604:389::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Wed, 18 Jun
 2025 10:04:23 +0000
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82]) by OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82%3]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 10:04:23 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "robh@kernel.org"
	<robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
Thread-Topic: [PATCH v2 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
Thread-Index: AQHb2phboDZyiLKsokiwgzrZBKxi67QHfvSAgAEqcJA=
Date: Wed, 18 Jun 2025 10:04:23 +0000
Message-ID:
 <OSCPR01MB14647EFA0DA38119F00DF1D50FF72A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
 <20250611061609.15527-2-john.madieu.xa@bp.renesas.com>
 <CAMuHMdXE-C4FAXOfzQv8xfgFytwpqkARDORGLkosZtCsjK8nmg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXE-C4FAXOfzQv8xfgFytwpqkARDORGLkosZtCsjK8nmg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14647:EE_|OS7PR01MB14333:EE_
x-ms-office365-filtering-correlation-id: 9b89dd0a-f722-400b-9c58-08ddae4f8030
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TFh6alhYeHE0ZHg4cG9wZllQR3YzbHgwT083RFdMM1hLcFhUanRnL054U2RC?=
 =?utf-8?B?Z2hkQTJ5TE9hTHQveHV6SGszcmI4VG43OXBRMkVoZFM4d080VnFxSEZ1SWpF?=
 =?utf-8?B?SnVHNXlpSnkxemNJODZ1ZkkvUXE5eWdLNld1b09qTWJKYXd4Y1IyaGg4ZHpZ?=
 =?utf-8?B?S00vMjFPcTNXSWM3UHAxU3UzWUNlYWxnTW1Udkh2VmNJR0tURHRFM0pCYUgr?=
 =?utf-8?B?YVZwR1ArbXZGOWwyQUJjMkUxMk1weHFHVDMreHppTW9nODN2MzluT3Z6ekpX?=
 =?utf-8?B?MWpMNmR3UkRkelo3L3RVRFIwZEhISERWOWNyeDdvaE1ta3NYTTBjSENIUzJ0?=
 =?utf-8?B?RVBUNVBiOVZXL2pWdzFrL2F5VDEvYXZqN0RESXFrL1grVTRBTkZaaWNRTFBU?=
 =?utf-8?B?T3l0Q2sxWUZ1d3hvZ2t1VUkzT0pEQmVYc05kMFNtenlBNVo5SzJHMlBrdjdx?=
 =?utf-8?B?SkthajRzQWF5M0gyTHJnMjN6T3RqYnRVMmc2SG1lOFRBbEZvQjFzS2NOa3Jo?=
 =?utf-8?B?VCt2ZldKbVgwREt2VVRDVTYrWTE3VWlxS1RMUUJ5WGpoS0x2R0FhaHBGUWFj?=
 =?utf-8?B?YkpiMnNkY0RRanEySTVmWmRwTG4wdGszOVBlcURTWWpoODBlKzBiVUc1bHBZ?=
 =?utf-8?B?UGdTd3owdG1XQ1ZXaGpvYUtMUEo3OWtsYktheWFVb2FPZTVtcUw3V2pjL1Na?=
 =?utf-8?B?NEhQa29kWmFENll2UkFtZldLTWdBekRBZjBsb0JNMlJlMUhNS1ppb01SeG9n?=
 =?utf-8?B?OG5Mb29LZVV1MVhpYlJyK0J4R2tpUHJVbDg0bHYwSzR0eWFXQUVNSlBQUFNJ?=
 =?utf-8?B?Z1haVktoS1dFM1pISldmNFJNUnJ3cm9GREpOV1FyMzREc2EyV2g0bEhCNFpo?=
 =?utf-8?B?UjIrajVmdGUwc3RpZW1MYWh5NXpmRXVITnhkR3RFVUYyQnlyVmZXb1IvQVps?=
 =?utf-8?B?Ui9BTGJqRi9WbjFMZ0FTWXNwWVBGYnp4em1Fd0M3RWk4Q0VNZHkwSlAyWUl6?=
 =?utf-8?B?UHYwZTZEdDNpTVNyclREdUsrNmpndVJibHhkdGZFK2FCRVhReGZpRURjY2VT?=
 =?utf-8?B?OHh1OVgydDBMa3JtMkdTNG5jc1B5SWJoQmpMeHhabS9TNHBtTFVKVzZSNnA2?=
 =?utf-8?B?elN5UXhFSDR1UmJqWnViazVqeDQ5dWJvSkdYYTBxKzgyV05xQ2FxbUEvRXhR?=
 =?utf-8?B?OWIyaTJvS2V2cmpqZWtyc1dnb1NKMWNOT1MwcGxwOVpnV3VvK3pBZExTd3hM?=
 =?utf-8?B?NE1HY01YSjdMS2pvRWZmNU1haFNOWXV5YTJmVytVUkIxU2JmdFpINnNQRFFt?=
 =?utf-8?B?aEJNc2hnVTY2cTFpekdCNFR2bzRIZllpclBVaVAzdFh4ZnpQeVFQRi8xZnNo?=
 =?utf-8?B?dHNQekxiTFBwb1Z5MVpydXkyNDVia3VTTmRONEhaYTV4aHo2SWtZVUVrcmV4?=
 =?utf-8?B?bW50dnVrZnNmTXdtcW9Vd09udUl1M1VZOUVWRUlyM0RPdGRERzg2VXpUSkJj?=
 =?utf-8?B?VHdTMDhyc3hKMTkyRFYwTTlhSkwydkdIVFZuSnhYT2NHT2RnSUluOC9TZnZu?=
 =?utf-8?B?S25HVk9mTk0vK0dBdUJ0SjVVbWtabGFaa1l2SW5PQTFCSlUrLy9QR3I4ajFw?=
 =?utf-8?B?SG5KSVlXelJGS0EwV1NpRnJDOFhRVldCRjhOWjNqcjhKbkxJK2NIM3dnYXRB?=
 =?utf-8?B?MTRaUWRUaHRuYmdXelFWZm1rTjFtVVZYQm01ZHMvUmFjMTNNMjVKaHNReW9N?=
 =?utf-8?B?VEM0MGRIU0FPUXBYWVdiM1RqelE3RU9Wa3V5SE5pSVIrV2FIbmVFRis0K3Qz?=
 =?utf-8?B?WmJNVHppNjROaGczUEVsMmdNSkNtNmFaS21tZkgzUWtzR0p0V0xIeUVwR1Ro?=
 =?utf-8?B?SkRwbEJLQ0IrNkdlSXczTGFFcnQwUk05cWg4STFvVEFEK0JudzJTU3lGL2hw?=
 =?utf-8?B?SDBjdGNBWk5KVkxpUTBVNlR6YzQ3Wm8vWjJIOVBRYW5qbTI4SnlucVBpWmlR?=
 =?utf-8?Q?Ua/nMoXcSVuAKH7HsdgBFjWaAmR8BY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14647.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eGw3dHozWnNvMTZuckhDNG9iV1ZCRXF0ZjF1K2dEY09qanRYbHo0dENpMjVU?=
 =?utf-8?B?ZjdpRk5rVEFxdnpHRjcvSnYxVEVyMG1PNjJkcnlmUHI3aHpIYmpNbC9EV3RO?=
 =?utf-8?B?UGpBNHRXVGVwakt4Zkt3cFh0cmo4TDNOQWI2MlNlWTVSTVpXQ29DZGwvalFW?=
 =?utf-8?B?SWhQbHdGeXJTQU5kUHkrOGNtNlQreE5TbmtZUnZ1VG9JV1VYK084bXdPd1Mz?=
 =?utf-8?B?azhLZzdhZ0RlalUwS2UydXpnRkNkOXR1MFlNUW9NQkRHTHBBRlNZY2RpOVhq?=
 =?utf-8?B?MzZjanpWa1hoaDl0MUh3UWoxTC9ONDNEQm9nYU9LSkZtb3l3eTEwc3dLMVpE?=
 =?utf-8?B?akhSeThMdENSbmJpUWc5QnNodGtsUlp2RXVweXRHSEpwa2svYVFvRkhHd2gr?=
 =?utf-8?B?akR2LzBISXhZNlpJays4VVMxam5VZFZPN2RpdUxsYnhMekc4YlVtQ091SHdi?=
 =?utf-8?B?SXNzTVBaMUNBMG5qMFBZSEJVUE5XK1QwcjdlVTFVc1FpcVc0QlFrZEIzRTgy?=
 =?utf-8?B?b3RuK1BEZG1oSWFUWXFvQkx0em5YVENzNmtlNzRnQzVMUTFBcGRGc3NEZ2tK?=
 =?utf-8?B?SjVwazg2ZzI0dlpZMW1wYXZ2Unh5MFBDTmdvZnI4NkJhOVZTdTMrWjNKU252?=
 =?utf-8?B?dDdBUzB6Sm9xRVdJYTl5UmljS04yNGdmbFdKNWUwdStMcXo5aHJob3ZhSHVD?=
 =?utf-8?B?eXR2SkJ4RjlwWDdGVnBUdUlZOW5DdVRnTVgzMjFabGJJaUhZZ1Y2Rkt3Y0U3?=
 =?utf-8?B?RW1mUmEwcXhVQWl5aHloYThKSU02VVJEVjloNFVXa2ppOFhYK0ZrSE5MSmtt?=
 =?utf-8?B?R1VUQ3FzdzNyMHJNMU9rY3g1cGZjTHVqV1dYa0IxNmJhRC9rUTdySElFdWRw?=
 =?utf-8?B?MVI3MFZDcHZhUWJOZ0JHNytzcnVhMC83RmlreExnOXR3dVVJbnpQT3BnMEdB?=
 =?utf-8?B?N2pTT01PdEgvWGdYSXFtelUyVmJiMCtXbkVLdjU2aUdab0sxMmNwellhdURL?=
 =?utf-8?B?SlNKZnNPR2RRYk5ybkdmSWZ0b0tJZmU3dVFvMFJxRFp1VWdpRmp2NGRyZmZN?=
 =?utf-8?B?WWk2QWNCRnhhVVNXaHBWd05KeUl6Z0tNai9hQ1NKYlRJeXBNRlRQVjU4bHJh?=
 =?utf-8?B?RmwzQTAzQnR1VWZvdnR1TzdwTm10Vmc0UnpPYWJBNFJoNjgyaUZsSnFTL3M5?=
 =?utf-8?B?bnVrL0V4YnRIaGRtQ1MyeXBrWnZYK1NLWlArMFpEd3V5ODRBUzBRRCtnRFM4?=
 =?utf-8?B?Nm9BN0RyMnFhRlFJeUNRWnk4YklVT2ZCVTBMUndQcVY5ZVlPN2twVHFwZi9l?=
 =?utf-8?B?K1puTVdleU5LMVhESWREQXFMQ3VkYUJsOFJJUmkweXV2dW83Vmo5a2JVU1BC?=
 =?utf-8?B?RThSUDNtUzZGbTR5dWxONjU3SzhzMjdjckswUmhzVWRCSUo4NFVFTFU1LzRF?=
 =?utf-8?B?MnhxR01jbFNsRWNhQmNPOWUzTG8zYzJ6Qkw0NDBzOENYSVVDTVk2Mm5Yak54?=
 =?utf-8?B?bitDemJWTUwyTlVDa0haT3k5KzVHMWRRaDZIS2RyTGxtR3prbEwvSW5UUFpF?=
 =?utf-8?B?b3IzSlFsUWxNSmZHY29SaFZJc0IrWHowYU56M0V4eUNZTzBnMzc0QjdoeFlB?=
 =?utf-8?B?eHVNMWQwU0xZWXpJTEhJckJGMlppaFpnSHZFbXVtY1NWSFRYbkNiZFhRUmVC?=
 =?utf-8?B?K2E0ZzZYbzFnb3ZZK1NFRzlrYm13aExHdnVwV0c3LzQzdUdCL2ZqSkw0WTNI?=
 =?utf-8?B?R3V3NU8zb3dxdCs4bUZwazhMUFpraGdKR0JBbkl6amVRRmpkaUZxd1l2cHNs?=
 =?utf-8?B?MFFBSWlFUWk0bmNRbTdpNnRVRDd0Q2hTcm9xVll2TFQwYjhIYm5acmhsZTl5?=
 =?utf-8?B?TXoycVB3cXFQK1h5QmREQWdvV1ZYUlFodHEwWE42bWZtVDBpZnNTWEwwbW1x?=
 =?utf-8?B?ejQ3MjJ5VWFKdFBDWmhYbmVocEZGU0swdU9oU0ZxOEFOR0s3Q0FZWld6WDIy?=
 =?utf-8?B?M2ovcXJXOHZYMlltV0creDFmUm1yeUZSZ1BhNktDS2RLbDF1OTk1QmVpOHBE?=
 =?utf-8?B?T1BheVZrWlJITGdISG5NTTVEOGhNbitwcmp2dzVRb0JDRmdIbG1MdmlycVRq?=
 =?utf-8?B?ZGpaUGVIUDBwNnc3WTVHdm02d0xvbWlNemlBNEtuU05IbWdIcEVVTEhNdWhn?=
 =?utf-8?B?TVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b89dd0a-f722-400b-9c58-08ddae4f8030
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 10:04:23.2501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6lILdT9hc8EjK49qiajWel2UppvQ1b/lsD46j/y4ySJVz9CuHs6AEkDgGKAw6bSMnjDMQZzAhJH2u0arEyTJyQ7NFlr87+w2F15ogkhfw4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14333

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogVHVlc2RheSwgSnVuZSAxNywgMjAyNSA1OjExIFBNDQo+IFRvOiBKb2hu
IE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMS8zXSBjbGs6IHJlbmVzYXM6IHI5YTA5ZzA0NzogQWRkIGNsb2NrIGFuZCByZXNl
dA0KPiBzaWduYWxzIGZvciB0aGUgR0JFVEggSVBzDQo+IA0KPiBIaSBKb2huLA0KPiANCj4gT24g
V2VkLCAxMSBKdW4gMjAyNSBhdCAxMTowMiwgSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJw
LnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBBZGQgY2xvY2sgYW5kIHJlc2V0IGVudHJpZXMg
Zm9yIHRoZSBHaWdhYml0IEV0aGVybmV0IEludGVyZmFjZXMgKEdCRVRIDQo+ID4gMC0xKSBJUHMg
Zm91bmQgb24gdGhlIFJaL0czRSBTb0MuIFRoaXMgaW5jbHVkZXMgdmFyaW91cyBQTExzLA0KPiA+
IGRpdmlkZXJzLCBhbmQgbXV4IGNsb2NrcyBuZWVkZWQgYnkgdGhlc2UgdHdvIEdCRVRIIElQcy4N
Cj4gPg0KPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4gVGVzdGVkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVz
YXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2
ZXJzL2Nsay9yZW5lc2FzL3I5YTA5ZzA0Ny1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcjlhMDlnMDQ3LWNwZy5jDQo+ID4gQEAgLTg1LDcgKzk1LDE4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgY2xrX2Rpdl90YWJsZSBkdGFibGVfMl82NFtdID0gew0KPiA+ICAgICAgICAgezAs
IDB9LA0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX2Rpdl90YWJs
ZSBkdGFibGVfMl8xMDBbXSA9IHsNCj4gPiArICAgICAgIHswLCAyfSwNCj4gPiArICAgICAgIHsx
LCAxMH0sDQo+ID4gKyAgICAgICB7MiwgMTAwfSwNCj4gPiArICAgICAgIHswLCAwfSwNCj4gPiAr
fTsNCj4gPiArDQo+ID4gIC8qIE11eCBjbG9jayB0YWJsZXMgKi8NCj4gPiArc3RhdGljIGNvbnN0
IGNoYXIgKiBjb25zdCBzbXV4Ml9nYmUwX3J4Y2xrW10gPSB7ICIucGxsZXRoX2diZTAiLA0KPiA+
ICsiZXQwX3J4Y19yeF9jbGsiIH07IHN0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc211eDJfZ2Jl
MF90eGNsa1tdID0gew0KPiA+ICsiLnBsbGV0aF9nYmUwIiwgImV0MF90eGNfdHhfY2xrIiB9OyBz
dGF0aWMgY29uc3QgY2hhciAqIGNvbnN0DQo+ID4gK3NtdXgyX2diZTFfcnhjbGtbXSA9IHsgIi5w
bGxldGhfZ2JlMSIsICJldDEtcnhjLXJ4X2NsayIgfTsgc3RhdGljDQo+ID4gK2NvbnN0IGNoYXIg
KiBjb25zdCBzbXV4Ml9nYmUxX3R4Y2xrW10gPSB7ICIucGxsZXRoX2diZTEiLA0KPiA+ICsiZXQx
LXR4Yy10eF9jbGsiIH07DQo+IA0KPiBQbGVhc2UgdXNlIGNvbnNpc3RlbnQgbmFtaW5nIGZvciB0
aGUgZXh0ZXJuYWwgY2xvY2tzICh1bmRlcnNjb3JlcyB2cy4NCj4gZGFzaGVzKS4gIEhvd2V2ZXIs
IGJvdGggZGlmZmVyIGZyb20gdGhlIHNpbWlsYXIgbmFtZXMgdXNlZCBvbiBSWi9WMkggYW5kDQo+
IFJaL1YyTjsgcGVyaGFwcyB1c2UgdGhlIG5hbWluZyBmcm9tIHRoZSBsYXR0ZXIgaW5zdGVhZD8N
Cj4gDQoNCk5vdGVkLiANCg0KPiA+ICBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHNtdXgyX3hz
cGlfY2xrMFtdID0geyAiLnBsbGNtMzNfZGl2MyIsDQo+ID4gIi5wbGxjbTMzX2RpdjQiIH07ICBz
dGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHNtdXgyX3hzcGlfY2xrMVtdID0gew0KPiA+ICIuc211
eDJfeHNwaV9jbGswIiwgIi5wbGxjbTMzX2RpdjUiIH07DQo+ID4NCj4gDQo+ID4gQEAgLTIxNCw2
ICsyNTIsMzAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByenYyaF9tb2RfY2xrDQo+IHI5YTA5ZzA0
N19tb2RfY2xrc1tdIF9faW5pdGNvbnN0ID0gew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEJVU19NU1RPUCg4LCBCSVQoNCkpKSwNCj4gPiAgICAg
ICAgIERFRl9NT0QoInNkaGlfMl9hY2xrIiwgICAgICAgICAgICAgICAgICBDTEtfUExMRFRZX0FD
UFVfRElWNCwNCj4gMTAsIDE0LCA1LCAxNCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBCVVNfTVNUT1AoOCwgQklUKDQpKSksDQo+ID4gKyAgICAg
ICBERUZfTU9EKCJnYmV0aF8wX2Nsa190eF9pIiwgICAgICAgICAgICAgQ0xLX1NNVVgyX0dCRTBf
VFhDTEssDQo+IDExLCA4LCA1LCAyNCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBCVVNfTVNUT1AoOCwgQklUKDUpKSksDQo+ID4gKyAgICAgICBE
RUZfTU9EKCJnYmV0aF8wX2Nsa19yeF9pIiwgICAgICAgICAgICAgQ0xLX1NNVVgyX0dCRTBfUlhD
TEssDQo+IDExLCA5LCA1LCAyNSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBCVVNfTVNUT1AoOCwgQklUKDUpKSksDQo+ID4gKyAgICAgICBERUZf
TU9EKCJnYmV0aF8wX2Nsa190eF8xODBfaSIsICAgICAgICAgQ0xLX1NNVVgyX0dCRTBfVFhDTEss
DQo+IDExLCAxMCwgNSwgMjYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgQlVTX01TVE9QKDgsIEJJVCg1KSkpLA0KPiA+ICsgICAgICAgREVGX01P
RCgiZ2JldGhfMF9jbGtfcnhfMTgwX2kiLCAgICAgICAgIENMS19TTVVYMl9HQkUwX1JYQ0xLLA0K
PiAxMSwgMTEsIDUsIDI3LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEJVU19NU1RPUCg4LCBCSVQoNSkpKSwNCj4gPiArICAgICAgIERFRl9NT0Qo
ImdiZXRoXzBfYWNsa19jc3JfaSIsICAgICAgICAgICBDTEtfUExMRFRZX0RJVjgsIDExLCAxMiwN
Cj4gNSwgMjgsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQlVTX01TVE9QKDgsIEJJVCg1KSkpLA0KPiA+ICsgICAgICAgREVGX01PRCgiZ2JldGhf
MF9hY2xrX2kiLCAgICAgICAgICAgICAgIENMS19QTExEVFlfRElWOCwgMTEsIDEzLA0KPiA1LCAy
OSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBC
VVNfTVNUT1AoOCwgQklUKDUpKSksDQo+ID4gKyAgICAgICBERUZfTU9EKCJnYmV0aF8xX2Nsa190
eF9pIiwgICAgICAgICAgICAgQ0xLX1NNVVgyX0dCRTFfVFhDTEssDQo+IDExLCAxNCwgNSwgMzAs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQlVT
X01TVE9QKDgsIEJJVCg2KSkpLA0KPiA+ICsgICAgICAgREVGX01PRCgiZ2JldGhfMV9jbGtfcnhf
aSIsICAgICAgICAgICAgIENMS19TTVVYMl9HQkUxX1JYQ0xLLA0KPiAxMSwgMTUsIDUsIDMxLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJVU19N
U1RPUCg4LCBCSVQoNikpKSwNCj4gPiArICAgICAgIERFRl9NT0QoImdiZXRoXzFfY2xrX3R4XzE4
MF9pIiwgICAgICAgICBDTEtfU01VWDJfR0JFMV9UWENMSywNCj4gMTIsIDAsIDYsIDAsDQo+IA0K
PiBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgc2F5czoNCj4gDQo+ICAgICBXQVJOSU5HOiBwbGVhc2Us
IG5vIHNwYWNlIGJlZm9yZSB0YWJzDQo+IA0KDQpOb3RlZC4NCg0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJVU19NU1RPUCg4LCBCSVQoNikpKSwN
Cj4gPiArICAgICAgIERFRl9NT0QoImdiZXRoXzFfY2xrX3J4XzE4MF9pIiwgICAgICAgICBDTEtf
U01VWDJfR0JFMV9SWENMSywNCj4gMTIsIDEsIDYsIDEsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQlVTX01TVE9QKDgsIEJJVCg2KSkpLA0KPiA+
ICsgICAgICAgREVGX01PRCgiZ2JldGhfMV9hY2xrX2Nzcl9pIiwgICAgICAgICAgIENMS19QTExE
VFlfRElWOCwgMTIsIDIsDQo+IDYsIDIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQlVTX01TVE9QKDgsIEJJVCg2KSkpLA0KPiA+ICsgICAgICAg
REVGX01PRCgiZ2JldGhfMV9hY2xrX2kiLCAgICAgICAgICAgICAgIENMS19QTExEVFlfRElWOCwg
MTIsIDMsDQo+IDYsIDMsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQlVTX01TVE9QKDgsIEJJVCg2KSkpLA0KPiANCj4gU2hvdWxkbid0IGFsbCBv
ZiB0aGVzZSB1c2UgREVGX01PRF9NVVhfRVhURVJOQUwoKSBpbnN0ZWFkIG9mIERFRl9NT0QoKSwN
Cj4gbGlrZSBvbiBSWi9WMkggYW5kIFJaL1YyTj8NCj4gDQoNCkRvIHdlIHJlYWxseSBuZWVkIHRv
IHVzZSBERUZfTU9EX01VWF9FWFRFUk5BTD8gVW5saWtlIGZvciB0aGUgUlovVjJILA0KT24gRzNF
LCB1bmJpbmQvYmluZCB3b3JrcyB3aXRoIERFRl9NT0QuIEkgY2FuIGhvd2V2ZXIgc3dpdGNoIHRv
DQpERUZfTU9EX01VWF9FWFRFUk5BTCBmb3IgY29uc2lzdGVuY3kgaWYgcmVxdWlyZWQuIA0KDQpQ
bGVhc2UgbGV0IG1lIGtub3cuDQoNCj4gPiAgICAgICAgIERFRl9NT0QoImNydV8wX2FjbGsiLCAg
ICAgICAgICAgICAgICAgICBDTEtfUExMRFRZX0FDUFVfRElWMiwNCj4gMTMsIDIsIDYsIDE4LA0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJVU19N
U1RPUCg5LCBCSVQoNCkpKSwNCj4gPiAgICAgICAgIERFRl9NT0RfTk9fUE0oImNydV8wX3ZjbGsi
LCAgICAgICAgICAgICBDTEtfUExMVkRPX0NSVTAsIDEzLCAzLA0KPiA2LCAxOSwNCj4gDQo+IFRo
ZSByZXN0IExHVE0uIE5vdGUgdGhhdCBJIGRvbid0IGhhdmUgYWNjZXNzIHRvIHRoZSBBZGRpdGlv
bmFsIERvY3VtZW50LA0KPiBzbyBJIGNvdWxkbid0IHZlcmlmeSBhbGwgZGV0YWlscy4NCj4gDQo+
IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQN
Cj4gDQoNClJlZ2FyZHMsDQpKb2huDQoNCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5v
cmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0
Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

