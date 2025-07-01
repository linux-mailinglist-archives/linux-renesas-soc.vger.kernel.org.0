Return-Path: <linux-renesas-soc+bounces-18964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC33AAEF6C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55A9A3B3C6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 11:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EF8271476;
	Tue,  1 Jul 2025 11:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dupR4yBO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487F82737F7;
	Tue,  1 Jul 2025 11:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370011; cv=fail; b=YvjSPCZPfapjyJYqe/81LFInCIQKpmZFFKDMCihWLspTOyNxeE0HmUbW8+GDbpE88EiMjhAJB9oOHx1vmhdnLgye/72z+Hmf6gDfeR7Pb6D7rGOP1dyf/WxeL7aAzrf0V9clSIEhdNfqZLTJQEC23qO6uiJbg0kgK8ezyTGU/QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370011; c=relaxed/simple;
	bh=0SogXA/7G9ZMM2BZ5s9Ig/kskCrYcA4obDWvNTTup6U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iKQsOlMsn9nIKLig3Wy7XH0sYvwuMxS/aDC4PfgEvaJ+gEH32WgMnJL5oAJ9vMo+vkmrqysv2HOnFLUjNpfHKmXJthqfLK9C0rn2DrWeXFJcdr1E9Xuty3lznkJaMelKRfMslHPztiV1WHp6otDlmCjFkhzQ8zUIgwHo/0m3yiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dupR4yBO; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixNkH3AelG4iCCeTtCMLn6oo9jA9KhnAB1Id6r3AM+WdF/lOsA7Y6lKoK0N6N5hxVE6RPyRULKScF1npFFEsbKFQ7g/4aqkurOMjTAhkLnPDgkdFfhKv9VRbici804idZPZ+5krCRhAjCQ8uXW/ok0GoMTVZEqyEMQsMFBXUK2a8+q9biwBcgZheYWmXtmqTN/Ko9AZpDr27l/+SHzmCCyck3nx6HsnoA2+m2WKWWjai0166QVXo6yWNfokKsahiKCVXMPX2q3QPsO3qwY/MzM7BK2Aq3pTmrOZ0xrLKtflZMPO9Q/FW8OMXWVEQkyezcntHp2mzC8zBA6ru1cKjEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SogXA/7G9ZMM2BZ5s9Ig/kskCrYcA4obDWvNTTup6U=;
 b=WmhWpZBlRJkQffHnvnZ3/A2IhI+liWY22u3aj3yII/kF+hMEacSqpF+4kroTkXYWCYCxZvPOCVkXFDGc3mUd+S6axaulRA7+UTDpf4y82gIO+IQlQv8O2/Yxg7PEZ+G6o1GJ/eI1xmZL4PwJCI5YNRwSPT/op8adoxKeRKZJeE6JfkpXBW26lMQbxA34/0qCGBrUkox0Apf9vnQcm0r7T07tqFtJJfYH58E+a/6IHAW5I4RPH0erLlBdoCyjJAjsNKGF5Fzj5KdBagn3u2AkzMrZt/4sA7mRHpsEU/0mQokh8VDrPrZ3bptUy6FN7QV4rLuTGH7Avwx0Yslj6K1CkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SogXA/7G9ZMM2BZ5s9Ig/kskCrYcA4obDWvNTTup6U=;
 b=dupR4yBO3PgaJNUW/WAbHMTTLoctXTT5QGx0A7lg1hOA7bnulAy1CM6uJ3Vt5s5LMjIZfTbk1QZnWFbAAezZaw+U0vojl7/EOcpymi0QF6iRCM9KW26zVZPj8csRZM0633XeyA2pYHYBuzSSt65u5RuDZHysYxvyUVapgmhqeAo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYBPR01MB5357.jpnprd01.prod.outlook.com (2603:1096:404:801f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 1 Jul
 2025 11:40:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 11:40:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Thread-Topic: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Thread-Index: AQHbrVNDGj8C8kQeE0eZE1bPrrwQPbPEGWSAgFmCYRA=
Date: Tue, 1 Jul 2025 11:40:02 +0000
Message-ID:
 <TY3PR01MB11346205BCA481EA7B740A3028641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250414153818.214811-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUjtG-EcrpbDO2y8M=GQeV=5i4qODp=VZqymipeCneXhQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUjtG-EcrpbDO2y8M=GQeV=5i4qODp=VZqymipeCneXhQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYBPR01MB5357:EE_
x-ms-office365-filtering-correlation-id: 66a5922c-8ff6-4416-1b59-08ddb89404aa
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QVBFb0tHbDRVNVNmRnNlekViVFZoMzBkaXdza0xTdzhGOGRDTWIyQTg2NWZV?=
 =?utf-8?B?OXhGbVI3cDZyTmFRUDdZRXhnUEh6ZWVNWmpyYmhLekVYRkh5dXp0MmJ2TEtp?=
 =?utf-8?B?VSttR2tTcGlSdFQ1SEpEbUxUOUFPSmNId1h0T25VN0FLbmRzL2t4bm92ZUZG?=
 =?utf-8?B?bWp5ZnIwTGV1M01DTzlWaGVYN1pLeGl4dWdkMXVxVy80R3RTSmhFM2QrOE1r?=
 =?utf-8?B?MmdHM2dla21sLytyY0VtekxBT1VRM21BWTVkdkhLejVkQmRYVWdUUFVRVWpk?=
 =?utf-8?B?SXZHY1d5cGM0dlVUWm51QVZDSE12aXJ4bW53aEtzVWtpa0NwYkRKNHJ5b1F0?=
 =?utf-8?B?ME5DSEphN0hqcjBuRGVxMHc0eE9VMWdTdlRiUVI2aEVLOUlpaTRsRUQ4aDdj?=
 =?utf-8?B?czltRGRISXNqQm5kZE1sZVFsY2pyRHZFbzhvQVFsVWdkbzlmV0VWMFlRcmV3?=
 =?utf-8?B?WkwwTUVDVkN6cmx0bjVjTTIyLzNqYnVkUWM4WDMrQmNEb1Q3ekI4NUlkVFpy?=
 =?utf-8?B?U1lGM0NMTG9NNGIxV3RzMDE5ZENuRitqSjVrNlFxOFVWMm5rSjVSZ1hSNERa?=
 =?utf-8?B?MW1vS2grOENZZ1VQaCtPaXMrVHZRVGgwd1B4WnNnUDRPUnc1eUlxRTQ3Nzc1?=
 =?utf-8?B?dVR5Q3dpWVlxRERZZ1JSL1NNR1F5cE5SWFhuSnhRcHRhVzdSTUxyd2RLSlBK?=
 =?utf-8?B?Ykh3VlRELzNZZ0VRTG5qM3RvY1U4MHNPT2pOVjRIWXdVZFpVckNua3ArWEZ5?=
 =?utf-8?B?eE9pQlRlMUUrVUV2WlN6ZjB3czlicmVaTXdubzhXTVo4elhieHc2VnJCWmsy?=
 =?utf-8?B?U2tXMEtTRmpkMmZhblgwZVhoaWw5TjVDN2w2YXpJYkJCeElGaklyb29aME5m?=
 =?utf-8?B?UndrWWZsNWJselRyNkF1Yit0RVh2SjRacjhsMTU0ZmkyVEd6YlhyVHhVUVow?=
 =?utf-8?B?aTR1dFRmNlB3NG5xK0ozaEF3aWthVWtHaGNUR2hsTVlSTU9zWDBEOEQ1WDdq?=
 =?utf-8?B?MDlnTGgwKytjVWZVWm1rVndENU5FQkFkQ2p4RE5iekI0NlBMNDhOTG93UmNu?=
 =?utf-8?B?TlFlZU5rbmRHTVhYNUtTZm9wYzlZY2RWWXFjc0M4K0Qvdy9UT0dhZ1NnVy92?=
 =?utf-8?B?R21seEJWMEh3RmF2Ulp1VzNWVUJrazdWK2xkbUovRkx0ZFRIY1BraHdjeUF1?=
 =?utf-8?B?RlR3YWt5RzFtTFV1RE9Tb3lJOUpwYlBiclBCT1A2OXhCdjZUVk55YnJHbytH?=
 =?utf-8?B?RGF3WmdtRHpKTWR3N1l5dUw5dEJ0NExtQmhESFUwMXRSbkV0N0h1eENVVnRC?=
 =?utf-8?B?WjBRM1dDVDlBUGxwUGxxZFY0U1VLeEloSkQ1cloyblZkMjBZOTUzYVlaR2RN?=
 =?utf-8?B?cUtZRHNJTmlQSGxTUzN1UEQ5UlZ2SEcyUzlGb3lBczI5MmluVUpocUZ2cC8y?=
 =?utf-8?B?eU1mMjNjQlZJWGh6ME5tbGJjemwyNDg2eHYzaG03eXRIQVp1d1FpNlIxUzdO?=
 =?utf-8?B?ZEUwd3BaWXphcDNsR3o2TkFQZlhBTlcrSUtGajNMemZWell0Q0tXbGhsSWNl?=
 =?utf-8?B?a1lsMWFac1lnN3pxbjlOMm1YNVpnNUtONVBPQk9pZGwrREZUR04ySmFROUMw?=
 =?utf-8?B?Rk9oUGg1Y3NTZXByRmVRU09WeE1iTjVyaUtacVFpYXF2YndpNUZ1WGVuUU9O?=
 =?utf-8?B?TlNxaHdyaVhxak9QNXJXcVVRK1dHVFRCSVlnRVZJNWxkc2R1RGMwek5tK2Ir?=
 =?utf-8?B?cUJFN2lsZ2dXcWlsMTM3WmYxTXQ2YkNSRHlkSVYycHAxTnQwK2dTREhEaEFq?=
 =?utf-8?B?akhrSFRHeGtVN20wZUt0Y3hzZGdxazk3Qks2Qm5FSEs2WHlmSjEvS0tDanFI?=
 =?utf-8?B?eWx4QnBIUUZGdDBGdXQvMElobGRIMEw4dURHZGhGK0pjdjNSdVcwYmRvOXBU?=
 =?utf-8?B?VWFZUFNNZytVWmhHQ1NPdGlwcjQwREJtWDZZSUJ4NlBiNHF1YVV3NFoxQ3VH?=
 =?utf-8?B?WEt6VCt6MjJRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S2JzcjNaSHRlb2YxQ3lCVnc5eHpuc2RsM3ZxMnNzckxwakNIbVFGTFJjWXJG?=
 =?utf-8?B?VGZmcC9nb1JLMER6V3RxUEhLb2N1VXFzVXdxSUc1NGp5UWhQL04rbkZaRng0?=
 =?utf-8?B?NmY0L2UxbmU2NnRMakZSVVZTN0pPaFlnWk1NRi9SMHhDWmoreXk0R1RwMUpD?=
 =?utf-8?B?NGIyWHJpM2lkSTJYQ3ZSWnYzb2dQeW9kZ0ZvZzEzYmlnZ0dxQ053MHpXM1F1?=
 =?utf-8?B?ZGdkR1VUWWhsQVN6bWRaVURiSUVMMnlnQVdLOXpmSzViZWh2S0loY0tXK0Jk?=
 =?utf-8?B?Y3FvRWdqZWRXTGJUMVdmejNKRnlkKy8vdmZGaWZQdDBNazVGcEFrRjRJQVlS?=
 =?utf-8?B?L2wyTEFja3NiTmpsTk5jMExzOTVCakxleHlLMzhMQTVLVnJBWGVhVkV2QTQ4?=
 =?utf-8?B?cWM5QTlJVXFjM3lDcGc0eUNYOFNYWG8yOUZ5QTVnODNJdVY2Z1pNaUZ4bnVJ?=
 =?utf-8?B?SnA4cVc1QUNFNm5KdUp3Mm9qcWtwRThibVZPWmx4MnpZQ1FkTGRuNFFFR0hr?=
 =?utf-8?B?RUdJTWtmUXcwdU13eWxsUzlqREMwQm1mbTNUQzNkWVBBV29hV0M2c2h1dzZC?=
 =?utf-8?B?bms2bEVYWXlGTVdRQjh3dVJZQVJCTStIQ09EaW14cHlhUHJIZ2dKVzlDci9V?=
 =?utf-8?B?Y2hxQ3g3by9mNmlQeXFQRC9IY3dHS3VScFV3bGFPWkdaOFFmQXdxK256VUhX?=
 =?utf-8?B?WHRkWHVtc3A3bkdDamF3K3RCTy84VEtMNUZQQy9xUUJCY0xpbm9ZUlNkS2E3?=
 =?utf-8?B?dzczUFRMZnJGTURoUk43RnFYSk1TYmk4MDBtM3RXSjBGRXMzR1dadEZqRE52?=
 =?utf-8?B?UHYrZ0pkaFJwbHJRSituRWRYdkg3ak5jUjRrZ0dVRE9LbWtKMkxHWmp6L0dX?=
 =?utf-8?B?T3pKdUdFN3YzN3ZhMkM1N0NLRml2NTVVRFdPV2FzY2k4UVR2Z3NHaEZxOUEz?=
 =?utf-8?B?ZjgyQS82Ti9mdDE4VnRzRSthZFVuMHpVRFh1N0gvRFJYLzk3dnNRS295K0d3?=
 =?utf-8?B?ZFFDMnZ6Z3NGNjZlbllmbFIzekxla0dLeSthL3BrTHRmSE1tZ3ZYRWNBdzFk?=
 =?utf-8?B?K2t5WjBoQzRlWmpLNXhxYVVLdFJtek05QVgvQVlxZE5EclVQR2ZmOFc0cEJ0?=
 =?utf-8?B?TWVMaVRwdjdlQm0wOVVicmVubm9XZ012Z0NZdU9FVVhCV3pXbHBkQ1BrbTRD?=
 =?utf-8?B?ZXQzNTM1TUJZSWx1Q2VUc0g2YnRWZWlNYUFWcTZJRFdZMVJPcXlWTDBaeGVn?=
 =?utf-8?B?aGhuNEEwNnFOQ3lkRDE1MERHckxRbHpEakphQks5TEJ0d1dsWnlVNDlPdEFP?=
 =?utf-8?B?R1Ntbk10KzVsK3hQbEp6dm1FaGVDKzMrRHc4bXZtNmt4clI1bFlaaUtOR1VG?=
 =?utf-8?B?YnltT3hPU3ZpMVJlZ29PeXF4b3FBRnoweWxDT2c4WCtsMGFIaVNueGZxV29w?=
 =?utf-8?B?UG4rOTdpaEJXbDZqcXZqanc5TFp4MHFTS1V0RHdTckw4TldtdytMdEtzMEJj?=
 =?utf-8?B?NHQ3K3FaZFdpcVVKa1ZhUUh6THlnWldXKzNvSERUbFpabGFoV0RJQ3hZRnVx?=
 =?utf-8?B?T2lPdUhrM3JQRWJpY3pURm43OEw2M3YxUmhYNG1VWWV4TThCS05URjZMbDV6?=
 =?utf-8?B?T0Q3VU1BYWs0NExpbGlVc3JYMmpqYzZRYlY3T3pkZVl6U3ZNUndUMUtnUjha?=
 =?utf-8?B?TGR3dUcxalpNc1dFdzNrUWFncUw0TGpFL2c5RUFYMmRTVGgxYS9seGxQdXFR?=
 =?utf-8?B?Z1hTcW5ORnd2eURLRHVsWlk5aGp0U0JqR1NvNjdzTDY2Z2NOMnNGcVFJSU05?=
 =?utf-8?B?WndMN0VZSEdrdTMrNVI0VTlrR0xZWGVWR3ZXbXBzTGVXbFpOMWFBdEU0Syts?=
 =?utf-8?B?NmwrWDBXOUtETWQ0cjFndGFpM1RMT2w5ZXdRQTZpMkdhT1lRd1V0eVdzRmR6?=
 =?utf-8?B?NlBVTGJRUGVrVlYrYlhmY2VRQlZHQW4zLytJKzkzaWZvYVh0N0ZEbEV4ck83?=
 =?utf-8?B?ZEdEL2dhMmRDZHJvd2Rlb29VcU5MUnNrNjNVK1g3a3hNNGVXK1UvMzhOR29R?=
 =?utf-8?B?aUk4bDF3ejFHeHpPRmNseHVjelVUam1tY2lBUWZSMTVhS3ZicXJraWJMNXQv?=
 =?utf-8?B?MDRCS0RQUTNObkQ3L2d2OGthU0Fqb0hpVGE5S2JGamFGRExnUFNlNzJyMlE3?=
 =?utf-8?B?MVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a5922c-8ff6-4416-1b59-08ddb89404aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 11:40:02.8858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: miW4B8mAmgy9kHkTxhBpCDBqySdJxkKCc5E/P5pdirTqABjaDNvl3DZ3WW0W+kZyKbjFM2Ti6T/Ixq4SFDuysatlzmSqORJfU3ZQZwoftIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5357

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA1IE1heSAyMDI1IDEzOjM0DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzA0N2U1Ny1zbWFyYzogQWRkIGdwaW8ga2V5cw0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgMTQgQXByIDIwMjUgYXQgMTc6MzgsIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gUlovRzNFIFNNQVJD
IEVWSyAgaGFzIDMgdXNlciBidXR0b25zIGNhbGxlZCBVU0VSX1NXMSwgVVNFUl9TVzIgYW5kDQo+
ID4gVVNFUl9TVzMuIEFkZCBhIERUIG5vZGUgaW4gZGV2aWNlIHRyZWUgdG8gaW5zdGFudGlhdGUg
dGhlIGdwaW8ta2V5cw0KPiA+IGRyaXZlciBmb3IgdGhlc2UgYnV0dG9ucy4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+
IFRoYW5rcyBmb3IgeW91ciBwYXRjaCwgd2hpY2ggY29uZmxpY3RzIHdpdGggeW91ciBDQU5GRCBw
YXRjaCB0aGF0IEkgaGF2ZSBqdXN0IGFwcGxpZWQuDQoNCk9LLg0KDQo+IA0KPiA+IC0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNDdlNTctc21hcmMuZHRzDQo+ID4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA0N2U1Ny1zbWFyYy5kdHMNCj4g
PiBAQCAtOCw5ICs4LDE4IEBADQo+ID4gIC9kdHMtdjEvOw0KPiA+DQo+ID4gIC8qIFN3aXRjaCBz
ZWxlY3Rpb24gc2V0dGluZ3MgKi8NCj4gPiArI2RlZmluZSBTV19MQ0RfRU4gICAgICAgICAgICAg
IDANCj4gPiAgI2RlZmluZSBTV19TRDBfREVWX1NFTCAgICAgICAgIDANCj4gPiAgI2RlZmluZSBT
V19TRElPX00yRSAgICAgICAgICAgIDANCj4gPg0KPiA+ICsjZGVmaW5lIFBNT0RfR1BJTzQgICAg
ICAgICAgICAgMA0KPiA+ICsjZGVmaW5lIFBNT0RfR1BJTzYgICAgICAgICAgICAgMA0KPiA+ICsj
ZGVmaW5lIFBNT0RfR1BJTzcgICAgICAgICAgICAgMA0KPiA+ICsNCj4gPiArI2RlZmluZSAgS0VZ
XzFfR1BJTyAgICAgICAgICAgIFJaRzNFX0dQSU8oMywgMSkNCj4gPiArI2RlZmluZSAgS0VZXzJf
R1BJTyAgICAgICAgICAgIFJaRzNFX0dQSU8oOCwgNCkNCj4gPiArI2RlZmluZSAgS0VZXzNfR1BJ
TyAgICAgICAgICAgIFJaRzNFX0dQSU8oOCwgNSkNCj4gDQo+IFBsZWFzZSBkcm9wIHRoZSBleHRy
YSBzcGFjZXMgYWZ0ZXIgdGhlIGRlZmluZSBrZXl3b3Jkcy4NCg0KT0suDQoNCj4gDQo+ID4gKw0K
PiA+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+DQo+ID4gICNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9waW5jdHJsL3JlbmVzYXMscjlhMDlnMDQ3LXBpbmN0cmwuaD4NCj4gPiAgI2lu
Y2x1ZGUgInI5YTA5ZzA0N2U1Ny5kdHNpIg0KPiA+IEBAIC0zMyw2ICs0MiwyNCBAQCB2cW1tY19z
ZDFfcHZkZDogcmVndWxhdG9yLXZxbW1jLXNkMS1wdmRkIHsNCj4gPiAgICAgICAgIH07DQo+ID4g
IH07DQo+ID4NCj4gPiArJmtleXN7DQo+ID4gKyNpZiBQTU9EX0dQSU80DQo+ID4gKyAgICAgICAv
ZGVsZXRlLW5vZGUvIGtleS0xOw0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gKyNpZiBTV19MQ0Rf
RU4gfHwgUE1PRF9HUElPNg0KPiA+ICsgICAgICAgL2RlbGV0ZS1ub2RlLyBrZXktMjsNCj4gPiAr
I2VuZGlmDQo+ID4gKw0KPiA+ICsjaWYgU1dfTENEX0VOIHx8IFBNT0RfR1BJTzcNCj4gPiArICAg
ICAgIC9kZWxldGUtbm9kZS8ga2V5LTM7DQo+ID4gKyNlbmRpZg0KPiA+ICt9Ow0KPiA+ICsNCj4g
PiArI2lmIFNXX0xDRF9FTiAmJiBQTU9EX0dQSU80ICYmIFBNT0RfR1BJTzYgJiYgUE1PRF9HUElP
Nw0KPiANCj4gIlBNT0RfR1BJTzQgJiYgKFNXX0xDRF9FTiB8fCAoUE1PRF9HUElPNiAmJiBQTU9E
X0dQSU83KSkiPw0KT0suDQoNCj4gDQo+ID4gKyAgICAgICAvZGVsZXRlLW5vZGUvIGtleXM7DQo+
ID4gKyNlbmRpZg0KPiA+ICsNCj4gPiAgJnBpbmN0cmwgew0KPiA+ICAgICAgICAgc2NpZl9waW5z
OiBzY2lmIHsNCj4gPiAgICAgICAgICAgICAgICAgcGlucyA9ICJTQ0lGX1RYRCIsICJTQ0lGX1JY
RCI7IGRpZmYgLS1naXQNCj4gPiBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yZW5lc2Fz
LXNtYXJjMi5kdHNpDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcmVuZXNhcy1z
bWFyYzIuZHRzaQ0KPiA+IGluZGV4IGZkODJkZjhhZGMxZS4uODRmYjk1NWFkNzdiIDEwMDY0NA0K
PiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yZW5lc2FzLXNtYXJjMi5kdHNp
DQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3JlbmVzYXMtc21hcmMyLmR0
c2kNCj4gPiBAQCAtMTIsOCArMTIsMTMgQEANCj4gPiAgICogU1dfU0RJT19NMkU6DQo+ID4gICAq
ICAgICAwIC0gU01BUkMgU0RJTyBzaWduYWwgaXMgY29ubmVjdGVkIHRvIHVTRDENCj4gPiAgICog
ICAgIDEgLSBTTUFSQyBTRElPIHNpZ25hbCBpcyBjb25uZWN0ZWQgdG8gTS4yIEtleSBFIGNvbm5l
Y3Rvcg0KPiA+ICsgKg0KPiA+ICsgKiBHUElPIGtleXMgYXJlIGVuYWJsZWQgYnkgZGVmYXVsdC4g
VXNlIFBNT0RfR1BJTyBtYWNyb3MgdG8gZGlzYWJsZQ0KPiA+ICsgdGhlbQ0KPiA+ICsgKiBpZiBu
ZWVkZWQuDQo+ID4gICAqLw0KPiA+DQo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnB1dC9p
bnB1dC5oPg0KPiA+ICsNCj4gPiAgLyB7DQo+ID4gICAgICAgICBtb2RlbCA9ICJSZW5lc2FzIFJa
IFNNQVJDIENhcnJpZXItSUkgQm9hcmQiOw0KPiA+ICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5l
c2FzLHNtYXJjMi1ldmsiOyBAQCAtMjcsNiArMzIsMzEgQEAgYWxpYXNlcw0KPiA+IHsNCj4gPiAg
ICAgICAgICAgICAgICAgc2VyaWFsMyA9ICZzY2lmMDsNCj4gPiAgICAgICAgICAgICAgICAgbW1j
MSA9ICZzZGhpMTsNCj4gPiAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAga2V5czoga2V5
cyB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZ3Bpby1rZXlzIjsNCj4gPiAr
DQo+ID4gKyAgICAgICAgICAgICAgIGtleS0xIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZwaW5jdHJsIEtFWV8xX0dQSU8NCj4gPiArIElSUV9U
WVBFX0VER0VfRkFMTElORz47DQo+IA0KPiBTbyB5b3UgYXJlIHVzaW5nIHRoZW0gYXMgaW50ZXJy
dXB0cy4gRG9uJ3QgeW91IG5lZWQgdG8gY29uZmlndXJlIHBpbiBjb250cm9sIGZvciB0aGF0IChm
dW5jdGlvbiAxNSA9DQo+IElSUTE0KT8NCg0KVGhlIHNhbWUgcGluIGNhbiBiZSBjb25maWd1cmVk
IGFzIFRJTlQgb3IgSVJRMTUsIGN1cnJlbnRseSBpdCBpcyBjb25maWd1cmVkIGFzIFRJTlQgSVJR
Lg0KSXMgaXQgb2s/DQoNCj4gQWx0ZXJuYXRpdmVseSwgY2FuJ3QgeW91IHVzZSB0aGVtIGFzIGdw
aW9zIHdpdGggaW50ZXJydXB0IGZhY2lsaXRpZXM/DQoNCmludGVycnVwdHMtZXh0ZW5kZWQgPSA8
JnBpbmN0cmwgS0VZXzFfR1BJTyBJUlFfVFlQRV9FREdFX0ZBTExJTkc+Ow0KDQpUaGUgVElOVCBJ
UlEgd2lsbCBwcm92aWRlIHRoZSBzYW1lIHJpZ2h0PyBBbSBJIG1pc3NpbmcgYW55dGhpbmcgaGVy
ZT8NCg0KQ2hlZXJzLA0KQmlqdQ0K

