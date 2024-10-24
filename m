Return-Path: <linux-renesas-soc+bounces-10032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F039AE42F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 13:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA4051F21ED8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 11:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0BB1CFEA2;
	Thu, 24 Oct 2024 11:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fMzJrJr7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDBA170853;
	Thu, 24 Oct 2024 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729770708; cv=fail; b=ARpISEUnrR7n/c8KT70ihXD0tffNtNeIVBBHk9JQKJZwaWlY/lel/dwpvhXRf3Y5rpWqJwEjJ9660Xa1uXwAQsA9uor64g8TV7/ceVasNMfjHZJ5iBVF0C2P5WLzn7OuS0en80E0DBfVsmA1aWynmiCYIhUzwFklL9wf950yNC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729770708; c=relaxed/simple;
	bh=qKl6vblO60q1Wgb8dB/k5TQGrrbFkkYnmbct6eBDUks=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QMV09kHFNR2+6ltCfMweM0Wgmwj+ED0xTzvrfw51pBreiswfBwrmYJDdwIIfU+7iDb7hcSdUEWxTvPVWxOK/fZ5CyYZOfuK2w9xZP7DprlTiDL/C4U5gkLX22fQVfnCKnNrMxvIyS8vasgNPtvwR4FH/xSmGvECc1X9KhXGiXp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fMzJrJr7; arc=fail smtp.client-ip=52.101.229.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUx0v2dbLscBKbwLxRPtkoS4CxNmIRJhZ69+uB0bPU64pebCi1QQvlHfvsm0N2Ly32JX8OLwR63NtOJQ/HWgZv97Y78S2ypOMQ7WjsH6PSmFlTDvO75gmRGm9H/hNDCw3daclIsFVtsEwhn0Dx2/Nb+Fdo07+OpMsxlJjCzhztKa+dlnPslpjAJriMmgv1nK90/+DtMRHA8i08jLmzbdFGuwpVe47dbx1M790wixy84uV+g7WWbXKyXUuNIO8+L6V4FkCJY1o1OQ7H4dn9KYxh7dScAVg7U4cGSgl2ejWuArYU6yybzG8xY0s/8C+iSM5uBhtqjrYtZJoFZc38JAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKl6vblO60q1Wgb8dB/k5TQGrrbFkkYnmbct6eBDUks=;
 b=vQ/v1fb/mCuhsWd6W28ZFk3Y0ciPCF9iJ5VWfxRKdeV8DDkMcD8He5Fj3a95t5Y69G19MH6mNeoMFLBNHdPB4dGL87EzA1I0Gvi41Ch+348jPJKCPghpUztrvh7F6M+cPBw8DqXgmXyEHQUbWyueTHFVvANPrGrN4ULyN5+kKhDSF1xKfEL1TOVxgTGTXIWdRSEh15Bop32Fk9aukjlt5z8I5UxnmhiaG2R1y1H3/TJQOwo/F9XE64AjtBuABwMZ1fw5OI7xDbMPsVDppjlCcSiJVE1ToyTlkxEBmjifdlocCpT1pfpVvKRK3v79ccnIoQIeSqKoozw6f4I16UQUuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKl6vblO60q1Wgb8dB/k5TQGrrbFkkYnmbct6eBDUks=;
 b=fMzJrJr7jhXu4lm4mropnRKJFCxJd/S9YRhXPRKa+M3mncweaYYgcbrxICIDdt4aTg9nAAPWN8Uj095nkAKADBA5lDHq3szBdgf+XT9ZwgwL086d/79e2+bbTmTBO+V+FsH2jI/95TRx2ilAhcBWZdA9saHeD9aRlMUn3HFAcok=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB7308.jpnprd01.prod.outlook.com (2603:1096:400:eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 11:51:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 11:51:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Hien Huynh <hien.huynh.px@renesas.com>
Subject: RE: [PATCH v3] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Thread-Topic: [PATCH v3] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Thread-Index: AQHbH7RYS0zqd35wYU6+1BPfPhKcHrKVuwuAgAAac2A=
Date: Thu, 24 Oct 2024 11:51:31 +0000
Message-ID:
 <TY3PR01MB11346AD911CC2A33E02538EC1864E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241016101513.39984-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXwxWAm=XiGFw_j+L8ebmAvJx7r8oQ_Bhon6tsWX47yXA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXwxWAm=XiGFw_j+L8ebmAvJx7r8oQ_Bhon6tsWX47yXA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB7308:EE_
x-ms-office365-filtering-correlation-id: 92d9c9b3-6b0e-4e90-c688-08dcf422341f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y0VXaTByYUdCVWM4dFoyaTR1dkdNZmhqcWIzalFSdVBiOHpMVnVCUzdydS9y?=
 =?utf-8?B?NkJWT2hrWGI3THJWT0JCaXVJVGc0MEZsYTVRekJ4VGh5QzVyZms0MUIwWmRQ?=
 =?utf-8?B?MFFTUVErNlo0MTI1OGFXK094R2FleXhMWlMxa2EyaGVSamhScnExYUVwQXZa?=
 =?utf-8?B?VkV4ZW5jVVk2c3RvZUFxL252K3dablFCYnA0UGhOTTJ4V1d1U1E4Q0MybmV6?=
 =?utf-8?B?SWsvNU9YREcwSG5JRkEybFRNVDI0VlR1OVFvQnFsZ2pwV2ZHZDlmMUc5Vmtv?=
 =?utf-8?B?QndTRGN4RkU0ZzBMYzhBRVFrN3FGUUNmWnJXT3ZqdmRRWk1BOEpYMDJUbkVx?=
 =?utf-8?B?bDlHeXVERUNJMUlUUXErRzhyZmNBaHVPRHhycDQ5ckRjZEVxRkF6OEF6dlRS?=
 =?utf-8?B?N0N5aTlKbFA4SVRWL1g3dHpZemUwdDVPZk9hTWpuMFFwZVErbmRVMGxmTWZ0?=
 =?utf-8?B?SDBQcXVnMlJkTHZFWko4L0dDT1F4Nkp4dHVqdUFha1dkL2pkdWswYmd1NWlm?=
 =?utf-8?B?dG1VU3pVaDhtcWtXU3dPVEQ0UlRoUjgxRGtqaC9xeFZ1S1F4Q1cxbTRNYjVR?=
 =?utf-8?B?Q3VDTEw2WlRBbFJheTU4Z25MeUFHdUlveFhiRXltNnlQT1k1SFFCS1BicDRT?=
 =?utf-8?B?N2R4dFFyQnFUN2s3Z2x2dGs3OGFzNzhob3p3OUJsV09WSzJySTBFUzQybjFa?=
 =?utf-8?B?NlNWNVB2QVpqVU9CZCtYV0xsS3FySkI0ZHhzbUFpZWx5UE0rUlNJWVlCZElR?=
 =?utf-8?B?bEhvSjdUMFJ3YzdjVFpYUUxiaXJ2OStZcUxFSmZ1MGlpNHRoUVpFME5WNnpT?=
 =?utf-8?B?K0ZZMmhlUFhtZmJ3dHhzK1FaQko5NlVJMjVjZ0lyREJVRC9NWGpmNVlvV04x?=
 =?utf-8?B?UnNNcGJVaHlldncvTFViaS9FY056TVJoODVaUzJHK2lVM3UvWlJSSno3cFNY?=
 =?utf-8?B?eGc2cm1mTTgzc1E1UUpWNFk3b01pZ1JJVXJuSm1hR1pNcmVtSGZURHdxTjVs?=
 =?utf-8?B?bzBDK0xJMUJXRE9jcGtKRTFBZlR4T1FnZktDd1lXbzFBZXA2RDZVb1l4MGRD?=
 =?utf-8?B?VWptRWlna2c4eElCY0xJRzJMclNaUHZFYlJ0QjdOdThRYUlXMkF5RzBTaXNh?=
 =?utf-8?B?MWhwKzFXY2RrREJnRGZBeXNZaUdPOHRTcEdHbjZFRFVqeU1IdEhJcWgyVjFU?=
 =?utf-8?B?UVdzL2NMb1FrQnl6QU5NQ2hyNFM3Y21oN0llRHZ5SW41cVloTDhScDFYOUI4?=
 =?utf-8?B?bFJpNVpUYm5Ma0ZrdG1EZE83bW1YbDlIR1NMc0tUQUdTZk9kNmQ1d1pzalRo?=
 =?utf-8?B?OEp6TUVHOTFqQ05RY2RHZnRaWjdYa3FGOXdWN1ArTU92M2JoTnZMMjdDUmth?=
 =?utf-8?B?RWZocTdDQ1MzeUJMVHBHdHBud0huZURxQ0QxSmdacVpmYld0YzZQWFZNYVlY?=
 =?utf-8?B?b2lSL2ZnT3Q4M3NXcCt3WDBKbWRJOE9lVGhDOG9KUy9qYlNVK1NueDlOMUo4?=
 =?utf-8?B?akR1UUFrc1RiekFEWnBpbG41cys2MnRBOHdpSjdPS3VEeWR2cXdVL3RHVE5Y?=
 =?utf-8?B?UWt2RTBKaWxtbjIvL0NsOFJIYit6SjIraTloalEyNzNSZ0ovSjNTV0FEejZl?=
 =?utf-8?B?RDc5TDI3YkdROU0xcjE1dzBPemtjOFR2MXF6Y25kYnRaclBzMTBERHR0RFFi?=
 =?utf-8?B?LytmdGp0RnhadVBtVk1uRE14Nk5sOFEzakFKNDJLNVJDMkxQaGw2S1Npa0py?=
 =?utf-8?B?b0FUb2ZwMnFXYVNRZnFVajJWenB0aTVaWlJBZ3lqSUdrd210U0NiOUhUSTVU?=
 =?utf-8?Q?wAR/mQ6SxYMmWJwp0HXI+7+x8nDx2Tn/v39fM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?clNNRjZDMExVTHBQUUlYd3A5NlgrY0Q5YzVOMWJPSXZvMStRQjNjd2RPcGhJ?=
 =?utf-8?B?Qi8rQW5TeXlEc2Nob0dQM3kxcURFOFNvc3FoMVhaUkc3L1ZwOXRvL0d2dmpl?=
 =?utf-8?B?aFlIWVZSU2tYMlNpZjdpTjVrY0VXLzlaV0wzeEQxODdkc08wZjN2dzVCSFFZ?=
 =?utf-8?B?TjB0Z2dWdGpWNzYzUEdWbThqdkhweW45UE1oRTBDMmdUSk8weWZDMmxJVE5o?=
 =?utf-8?B?Z295OUZHbVpyVjBKM0s1Z1YvOWVCS3JPcFlqMkZjdzBTaUozOVJ1NjhvU3Na?=
 =?utf-8?B?ektsSEJtOXk4ZmtOcEU5K1VEM2FqT2JJWHlNenJTQmE4WTM3ZUxqajRTOTJv?=
 =?utf-8?B?dnpoWVpkbXpHSytPZWVDTzNtQ3E1QTV1NzNQMWJ5RzNjOU1iTFM2WU1PekRN?=
 =?utf-8?B?d09aTmFZWlNTUlhRek1JY3BWRThOTDh4enUxTHdSS0xqVi92SFJoN3hOKzcy?=
 =?utf-8?B?ZVk0NkJXUXlzZEZSVkxYL1dEdFN1SnRYL2NrL2dJUG02ZzFnc1lzTkN1V3I3?=
 =?utf-8?B?VGhXVXI0QjBZMEZPS3BTTzBhSVRxc2hNSkN6SVpYTVplai9TS0FyMUpSUnI2?=
 =?utf-8?B?WGV1VitOMVprUnNLQk9GWUNBVnQ0dEVVTGdkUWUvRDduYnhhQ21QZnptYmxo?=
 =?utf-8?B?ZENoMWJQZ1ZKOTdLekZRNEVwK0s4SWtMOFdxUkhVbkZscW5UTnRXT1IxWVZl?=
 =?utf-8?B?WjdQcFpTM1UvRS92MmxXTjliRnMzTk1yc3phaHVoWkJXVG5yZURGQ1dBV1F4?=
 =?utf-8?B?RFI3UXQxRmxNc0RwQ1FvR1BrSUFSOUtLS1NRRDBRdldxUDBpeUptWkVWNkRE?=
 =?utf-8?B?enNKV0R2ZWlETVk5RjQ5UXkzTzhGVGdWTUUzMmZXaklzSHdXY3hhRkY1VWlH?=
 =?utf-8?B?eUp3WXgweVZjc01MUXptSXZXbFRVYnZMMXUzM3BjSEdtaGlpWndSYy8wcXdt?=
 =?utf-8?B?MGc1cUY3a2hLeEVKZTQ1ejBDcUJqdkQ0K3BEVXNOaE1TeWh0ZWt4MVFLUjFK?=
 =?utf-8?B?eTU3b09raytyQ1ZQWUs5SnlyMnhQcUVBazVYWDUwTkRSKzFQUC9kL2tzOXd5?=
 =?utf-8?B?RVZOU3UydWhmS3hqZ0EvalNCRHlDemUrajB6MDhVc1RPbGJRK2doQmRQdllQ?=
 =?utf-8?B?NnNTMW90eDQ2ZVdlVUhidDV2RUpNMWo4MVdmNys1SVVQM3lGSFRhZXFaWG0y?=
 =?utf-8?B?VTE4a05sNkk1L1dSZ1JxeUx3NS9BU2hOUm1rUkhCREM4YUxuQlhPb1hWcDNi?=
 =?utf-8?B?UTJ3aG1sRDRnYUN3a09NUE5kbEJZMGY3VlZGMDBlQlNEbzJWdGRaOUEzY1RV?=
 =?utf-8?B?SGtTU1N1UFlUbW0rall4MHFWSHIxQnE2dGJNQXU2QXdsNEd2RHRiaFZGWWhr?=
 =?utf-8?B?Uk16c3BTcUw3V3FCeDJyczRsRzgvWUZaMTJ4QXpRek91RlczVk5NcjNITnVl?=
 =?utf-8?B?N3pGQXZIM0RQaXptU0lNVTlmVzJMYWtYYTR3a0NCaXk5S3ZiZXJCWDlwUUNF?=
 =?utf-8?B?Vk5FUFpMUjdPYTltSktVelQxY1RLREx0WC9iWU1FeThGaURMYnd1dVNRdStD?=
 =?utf-8?B?eHdLWHY0bjNOQWRWY1dtMmZXRnZMWkNrb1pjSEw4blhOT2NpZEQwZ01NaGoz?=
 =?utf-8?B?YWtGdXNPU2pQbWZjdG1LdXNqOFdtZDgya2dJSEViRlhDRGlZcHMvbDA1T3Bu?=
 =?utf-8?B?eDdvNWE5MTVncjFNa3hvY3NPaDdha0ppeG5tM2NzNWI2MGUveDZBV0dud0Na?=
 =?utf-8?B?OW9sL0UyVUxKU2NtRmpzcjc3dW02WU80c2g0WENjWklDU3c5eXdZSUlMeFJN?=
 =?utf-8?B?SWZ3Qlp1RkJDSzdkZDZudkxHZ095NkYzLzdWMFBkUEx4Z0RsQlNLZjVUSnRO?=
 =?utf-8?B?SWd3TkFXNjRjeVBJRXdSM3NSb0YwOFRnVmQ3TEo4TEs1OXpKbUpyYllvRzVI?=
 =?utf-8?B?enBUMEhEQ2RRU0hYdDVha2ZuYStBSUVwUDV1SVNkb3RzTkFjekNBNE4rcU42?=
 =?utf-8?B?cEdxRE1hS0ttMkI1RlgzdlJvSGl6M0IyYldNSTJjMS9XUlI0dVRkbll6MUJy?=
 =?utf-8?B?VkNpUkYrcGpweURuYXF0ZW1tbHpKZEM4OEFGVGZ1eVJtdSthbWI5bFFsWFoz?=
 =?utf-8?B?TE5USTZHVGtSNmIxbWFIbDRSejBqc0xpYzhZSVpxd3RrM1NqTFlSZTJ1aWNk?=
 =?utf-8?B?blE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d9c9b3-6b0e-4e90-c688-08dcf422341f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 11:51:32.0099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YW24bF73oz+7FaDsjkD9IjpSKot2dxYjlVxakwEw5ZFHJCf8J4DCibFH+YFkQx0wFkjYdsQt6QjvANbDMTSg/TPWcae8CqS8LWHD2avkcAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7308

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDI0LCAyMDI0IDExOjEyIEFNDQo+IFRv
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBNaWNoYWVsIFR1
cnF1ZXR0ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+OyBTdGVwaGVuIEJveWQgPHNib3lkQGtl
cm5lbC5vcmc+OyBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
PjsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1jbGtAdmdlci5rZXJu
ZWwub3JnOyBQcmFiaGFrYXINCj4gTWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT47IGJpanUuZGFzLmF1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+OyBI
aWVuIEh1eW5oDQo+IDxoaWVuLmh1eW5oLnB4QHJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYzXSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBGaXggRk9VVFBPU1RESVYgY2xrDQo+IA0K
PiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTI6MTXigK9QTSBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFdoaWxlIGNvbXB1
dGluZyBmb3V0cG9zdGRpdl9yYXRlLCB0aGUgdmFsdWUgb2YgcGFyYW1zLT5wbDVfZnJhY2luIGlz
DQo+ID4gZGlzY2FyZGVkLCB3aGljaCByZXN1bHRzIGluIHRoZSB3cm9uZyByZWZyZXNoIHJhdGUu
IEZpeCB0aGUgZm9ybXVsYQ0KPiA+IGZvciBjb21wdXRpbmcgZm91dHBvc3RkaXZfcmF0ZS4NCj4g
Pg0KPiA+IEZpeGVzOiAxNTYxMzgwZWU3MmYgKCJjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgRk9V
VFBPU1RESVYgY2xrDQo+ID4gc3VwcG9ydCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogSGllbiBIdXlu
aCA8aGllbi5odXluaC5weEByZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjItPnYzOg0KPiA+
ICAqIFVzZWQgbXVsX3UzMl91MzIoKSBmb3IgMzItYml0IG11bHRpcGxpY2F0aW9uLg0KPiANCj4g
VGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2Fz
L3J6ZzJsLWNwZy5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0K
PiA+IEBAIC01NTcsMTAgKzU1NywxMCBAQCByemcybF9jcGdfZ2V0X2ZvdXRwb3N0ZGl2X3JhdGUo
c3RydWN0IHJ6ZzJsX3BsbDVfcGFyYW0gKnBhcmFtcywNCj4gPiAgICAgICAgIHBhcmFtcy0+cGw1
X3Bvc3RkaXYyID0gMTsNCj4gPiAgICAgICAgIHBhcmFtcy0+cGw1X3NwcmVhZCA9IDB4MTY7DQo+
ID4NCj4gPiAtICAgICAgIGZvdXRwb3N0ZGl2X3JhdGUgPQ0KPiA+IC0gICAgICAgICAgICAgICBF
WFRBTF9GUkVRX0lOX01FR0FfSFogKiBNRUdBIC8gcGFyYW1zLT5wbDVfcmVmZGl2ICoNCj4gPiAt
ICAgICAgICAgICAgICAgKCgoKHBhcmFtcy0+cGw1X2ludGluIDw8IDI0KSArIHBhcmFtcy0+cGw1
X2ZyYWNpbikpID4+IDI0KSAvDQo+ID4gLSAgICAgICAgICAgICAgIChwYXJhbXMtPnBsNV9wb3N0
ZGl2MSAqIHBhcmFtcy0+cGw1X3Bvc3RkaXYyKTsNCj4gPiArICAgICAgIGZvdXR2Y29fcmF0ZSA9
IG11bF91MzJfdTMyKEVYVEFMX0ZSRVFfSU5fTUVHQV9IWiAqIE1FR0EsIChwYXJhbXMtPnBsNV9p
bnRpbiA8PCAyNCkgKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFy
YW1zLT5wbDVfZnJhY2luKSAvDQo+ID4gKyBwYXJhbXMtPnBsNV9yZWZkaXYgPj4gMjQ7DQoNCj4g
DQo+IFRoZSBkaXZpc2lvbiBpcyBhIDY0LWJ5LTMyIGRpdmlzaW9uLCBzbyBpdCBzaG91bGQgdXNl
IHRoZSBkaXZfdTY0KCkgaGVscGVyLg0KDQpZb3UgbWVhbiwNCg0KZm91dHZjb19yYXRlID0gZGl2
X3U2NChtdWxfdTMyX3UzMihFWFRBTF9GUkVRX0lOX01FR0FfSFogKiBNRUdBLCAocGFyYW1zLT5w
bDVfaW50aW4gPDwgMjQpICsNCgkJCQlwYXJhbXMtPnBsNV9mcmFjaW4pICwgcGFyYW1zLT5wbDVf
cmVmZGl2KSA+PiAyNDsgPz8NCg0KQ2hlZXJzLA0KQmlqdQ0K

