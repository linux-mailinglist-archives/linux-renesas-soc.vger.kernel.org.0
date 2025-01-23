Return-Path: <linux-renesas-soc+bounces-12381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD114A1A1C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 11:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 084823A3A08
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7F920E313;
	Thu, 23 Jan 2025 10:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Q7MwJNvz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C72D20DD5A;
	Thu, 23 Jan 2025 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627826; cv=fail; b=m7eFEa8TpBfSDDaj66r5qYftVM/R6nvZjMeCjrfcoz0RgBzFouu6ui4iGsuuo06P0gZsfY4DPPpSqdu8ZiMbe6aa8IkEnZeoRGLSFvo7g7AIx//Gt7Nrw0Gud3nxHjyvPksiC4GH54FVsjK7eaNaFxhDkw+Q7GibvqwbhSWvfjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627826; c=relaxed/simple;
	bh=hAIAkobx5It5+INscx3ppMDTG4yKQhO0GpC2AazB0vk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PNqXSwBmZtaQTokGf2P65QO34ZJOM56ZKVECrlGSaY+OyCdB4Zi9nBFRGUOZQm+kWiIjEBHSN2/8u3c1SQkEhxqHhlWDUGZCckn/lGYlGi8OhmUGNHC5VRQ89m2wi82AlKlQPziSBnj3g/sw/Fa4ol15exDon7lyHhwpRC7/PNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Q7MwJNvz; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckhWiZDooZa3HeH+SXvFUE7Fn3J6hao9IwTabPCfyzme1ll8CfTZ1ANT4ZyFHbBQDwfekniJyKR/+Hv1DudWhOBTSkNzz7z63AvPFkLsnFahNaQKh+mVwfZnjf3Ekahfe885P7d1w1DlXGX2JbqpLnOldUQTOaxpL3KXtlC5ULcwJyDdpNd/lqXM3b0a5mDVmaYrXWo2/lMd0Y0sGwSw3oApha0Yfxx390lXN/8E3RDzRyJDPzj5OG2lchY6jVIevIsPUTYIiaPWtxYahdMLxwbavnsd7ntKzr5SRlncn5MYaNuMGfoX0rRgGjnHD77mTwQio8BsEDCk33PZ+EMHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAIAkobx5It5+INscx3ppMDTG4yKQhO0GpC2AazB0vk=;
 b=H0CLUj+g2qdhBaG5qzRT4+U51zm7R5js9f6yrF79Rf+5TaRw2vhUEdRsJy17L1VTmF+KVqqdvGHr21YqLcJxvWKyjeewZJMDJTjWKgVP/frMLJjiHtS/JVtj7+xfUudF57Ew1Hu3GXR3ho2fFuV5d3UgddFk+2VZ14TnVwgdvpW2fvcvjPopMH1yLs0A2R6zjQdmQy19LHrz38cdApdKfl4m241PkwPshyEnjkdBUf2FJEn+Q3b1UBV5KdHsz1oTt04h/0Y5CQrv7Pc/jn8QxbZp2WYhUc0L2xWKhkc1HHLnwM0h1tG3iL2lAfcL4EkycUaqFINzuBZasIGjE5m7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAIAkobx5It5+INscx3ppMDTG4yKQhO0GpC2AazB0vk=;
 b=Q7MwJNvzf1NAl0cAOKr4TRweULvWHn6JbZnKvYVwMFGELvJbOtVQ6mJsPYDc43+yGEw7uiHb5hOyPeCNoMHla604VhCC38wrCgRA3WtAoPiG1IB51P6KFj5qfC0fjMbIAkKrKQEsdD4n7SJ97uX7OQqV9UwYHeZD0aXZL3d7EEU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB6067.jpnprd01.prod.outlook.com (2603:1096:604:c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 10:23:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 10:23:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 5/5] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 watchdog
Thread-Topic: [PATCH 5/5] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 watchdog
Thread-Index: AQHbZznEg3Bhn8J+P02Vnz0tNQ9AzLMYFHIwgAwdJ4CAAAFEcA==
Date: Thu, 23 Jan 2025 10:23:38 +0000
Message-ID:
 <TY3PR01MB113462DD9964F98599D23D5B686E02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-6-biju.das.jz@bp.renesas.com>
 <TY3PR01MB1134612C1DF4639F12D829FF386192@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWFexFfaqjBUbuEpurnDA1LPywB2pJ9ZJQZ=_3mmfgxoQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWFexFfaqjBUbuEpurnDA1LPywB2pJ9ZJQZ=_3mmfgxoQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB6067:EE_
x-ms-office365-filtering-correlation-id: 215201c0-a61b-4d00-436a-08dd3b9800ad
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TDRyanNqYi9jL3lGSWMvY2xWSkFVRXkzbGp4T3JDMFNmYUdoREkzeXMrV1ow?=
 =?utf-8?B?ODVqenVrNzNLZjFReUJGb04wcW1JRjV4SmNuNHJlNmVLTnliRTh2RW9kUnEw?=
 =?utf-8?B?NXg4Wi9MRktJQkFkS2pDZVltSHpBSnlvRlRld0NwYklVMy93bGlPRXlmN1My?=
 =?utf-8?B?UlBSTURTUU9kWTZ6ZklsTnU5SGlUcDRKdysvM0hWVjBHenVsTmFkelhWSGNG?=
 =?utf-8?B?NXpZQ0thT2ZHUzdMMTNqa2EvcHNZdkhPMVdSVWdPakZXb29pV0RTT1NQdjIr?=
 =?utf-8?B?dEQ2UlZKMTg5NFRTOC8xVGFzaEVtYmFLT0tzU29NMExROWR5aVcwRGRVZ3Ju?=
 =?utf-8?B?ZmdyL1dmSUF3SnkrS0pNbGliMTRsQkZaeXRleWkxeGxEVDRLb2J5N0RkR3Fv?=
 =?utf-8?B?dXJ6RVd4YUtpOXJ4elQ4WE1LL3QyUm5sMmdLV0R6RGo5VEc4cStha1M4Nk12?=
 =?utf-8?B?ZlBScVYvai9BbXZkS1ZrdGVtNzJYUEJTVWtCRU42eEVzV3E5a3FIeHlLbmJD?=
 =?utf-8?B?SEtUVzRTMXBidDRTa3Qvc1AzMHQ2ZWR1V0ZHQXk3Y2hndXF0ZGYrQXljaWpI?=
 =?utf-8?B?RW1iZWsrcnVqZGIvcjJmck5xM2hOMUUxZzdvZC9tTzVRc0prcFZadkFqQnc0?=
 =?utf-8?B?aGJPUzR5L0NyUVREdm1aQkVrcFJBWXhZNThsRjBXZCtEL3dxbjlMN2k2cUxm?=
 =?utf-8?B?K0RVUERlS0ZsZ1NOR0N6QlVrZUFycEVqQXA3QktSbTVLTjJOSWNUTlhEbENI?=
 =?utf-8?B?SndDRjBvWk53OXFKMEtJaEU0b1RabWIxS3NKMmdJQkFycER1RHBGWVI5Q09F?=
 =?utf-8?B?MUwzQVJlY2U4bm0zQkY1UzIrcHJHb3BuWFd5T0dJL0kvb0l2eWVXaUtWSk93?=
 =?utf-8?B?ZUZacnFrV0h5VkRFZHlXeVRKTlVzVWVxb3ZzWXZKSnhzeVV2a3NVak5WUGRw?=
 =?utf-8?B?T0xtUVNmbndJeXhnOEY4L3VIRGMvTllXbkZjWWIySisyM2hQNVJ5Sk50dVNo?=
 =?utf-8?B?Ukd2b3FaODg4aVpKSlR1WlRzUnc3WnJraUFnUkhWRlBYa0hqT3hkSnk5bDY5?=
 =?utf-8?B?dHN6NDBBR0IzN0JJdG83bDljNVl3T3JrSFIvdjRLS0E1N0hnbThGNWZiRFBt?=
 =?utf-8?B?MDBTYUhZV00yM3Zzb1hQK0VhQ1VtbTllQk1YaStxMUZ5VGdGV0ljUGk2K285?=
 =?utf-8?B?RG8xaGM1eGpMUUp0STNCci9jT3gxeVQ0ZUw5Sy9tRmt0TkFvTEhhZ2RBd0tv?=
 =?utf-8?B?Z1RGMTkzU2d2UmNPeWdEVmhsN1JOTW9sMXRkTCthZFdIRXNRbGNCZ3FQR1lG?=
 =?utf-8?B?Z2lWc3k1eTZoYlZTTXQxdWdQc1J3ZTh6YlNLUzFRbXFRQUVIQlRKaGozQW1k?=
 =?utf-8?B?dm03KzQrN0tNL3lmdmFscEZIWGpKaW9pK2JnWUs2UEpLcUZBRkZ0WTFXcVd5?=
 =?utf-8?B?cHNIancyZ0VUU0xiV29ocTc3ZjBjZ3UrQmh0R3hSUzQrb2VUREtSTWxBWU43?=
 =?utf-8?B?VEpmZk5ZczJCSXdON1E4QTQ4RmFRRHBWak11T0hwakVta2U2eldLVWgzbFdy?=
 =?utf-8?B?MHZ5Q2RYY0NyRlZnU0NvOTVhTlB6ZzhFUkNNSURMKzdSNUdlTW8rd0pHNjUy?=
 =?utf-8?B?KzR1YXRHTFBjSk4veXRGWEN1Q0IyQmhpdHNrNWl1Y01EVlJmeW1NWHlNZytt?=
 =?utf-8?B?QVNjckRvbnhzbFFaUndqb2FNVHVlekJsUCtTUzN0RC9rUk9lbzBwQTRvWjEr?=
 =?utf-8?B?ajhnRGdFQm1aNDFCclFMdWpkVERQN1lyWWZtUloydnAzMDg3dTMwUkNwcWFs?=
 =?utf-8?B?bjdDRnFMaTQ4cFpqc1FZR1RCNTZPQVZzUXJtQ0kxNjhuT2l6cllBNExRbVRz?=
 =?utf-8?B?WDg0M1lPK0hKVSs5WjNCdkdnQWQ0eHFlWkhlanVOTkNGVmVXWkNwbDRPOUNq?=
 =?utf-8?Q?gGJhJwxo7LoY0DFpmFG8X0LdN1QIfhUh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGpEZU12c2dnMTRYT1U1OVMvOHh2bFh3WEg2aCtCbGVVcHhFYWxMRS9ISmxS?=
 =?utf-8?B?Q1NDWXZQcmpKbnc5YVFtbERaQjh1OGJpMjN2aGlPbWRKVzl2VGZoOGxIcU5S?=
 =?utf-8?B?dlRGQ3Exd29Qd3ovQlJNclVRMENVNElHNG5wNHRhT0ViYjJSRkJPQUNCSi8v?=
 =?utf-8?B?RmpzWnozR09VcFdOSHlPYlVtQzFJbCtUTzM0V2xEOE5leHRxNGZYV0RlQm9z?=
 =?utf-8?B?cUFSa012YTVkYXhmOGE5d1dIb0E1L3RGR05la3pLa01EdFZWbEs0Qm96NHFm?=
 =?utf-8?B?K2I2U25BZTNlNFVURHFTMTFhK0hxdmJ0OWd6eXV6djE4NW9tay9YNDhTakJB?=
 =?utf-8?B?empOenlxT1R3OGtCRGh6U3YrUytQVjdpVmYwLzBrZXdrUG1qTDFoOGNtTU1O?=
 =?utf-8?B?Y0NDWjl0MzNFWU01TENyMWpPc25BaE1POTgrcTF6ZUx0VGVhcFJaVmRDOXN3?=
 =?utf-8?B?VXFwWmxUOEVNTHpaanBaU0xTWGV4SU1ia2x0SytqZXRkaGlHS0xEZ1J1U2o0?=
 =?utf-8?B?NEVUUkVlSDNVWUtvWllURnZXVUw1clRnbnI4bkVpdGlKU1A2YlZzcElOY1JC?=
 =?utf-8?B?eDFtV3lTRU5nbkpPUm8xajQ2RjVlUDdNbXdkbkEwSGppNjJEcDVGWm5yc2Vn?=
 =?utf-8?B?cnRFYzAyOGNNYmZDWWJiRzdJak8yTUNMQy8yT0ZBVFEyQmNTd3VsQjE4Zmtz?=
 =?utf-8?B?NmdBYkkyN05uYmRaUU4wTy9xbjllMlpoclFNWjR2Z1Y0M0libHJIeVdnVnlz?=
 =?utf-8?B?NlQ3YUNNK0NxYU5DWStIRVpodUJTVXZCRGRBT3kzdnJUVTZ2M0FEbHlrQVJs?=
 =?utf-8?B?NTFja3ZheWFTaFNqak13SWhBVTlkRnFTd1I1dFBYUmVtczNiVWhMSXozTnhh?=
 =?utf-8?B?ejBoRjVlSVpPQ3NXTEFHZVV5ODE5TXo4Z1lCaXJvckUzd1ovOTBwRnRMend2?=
 =?utf-8?B?VjhXaFRKcFowOHZsQld3TE1OYUZGUEtMTDBtYlhrdFpLckFFTVlBYlM0cjFF?=
 =?utf-8?B?OVRjSzhMZGE4bmxpaUxMZXlpQy83bUZTb3RKLzh2eE4raHhTTVFzNllxNG5i?=
 =?utf-8?B?UkpSMlBGV3EzRkN4aEdWRjVwcXRTeHNQbFVndjVORUc3UEpoVWZZODZZM2Vv?=
 =?utf-8?B?eGpwdkhiSzF3VVZ0Wm1JTDRUVExsOXdHK0NOMUNtYlBaN1lVdXM3aTJKVFRV?=
 =?utf-8?B?ZE1ndnMrZHFYMmxZVldwdS9abDhBS20rTk9wakJIamVjMFhXWWhJNnhYNEVj?=
 =?utf-8?B?bkhCRjZOdWh4cDBqb1orYSszTG90MFU5TEIvdnh5UExVcEVCUEdQK0lTTXMw?=
 =?utf-8?B?K0lOSUhBdUpyay9MZlErcnhjNkllb2MrdzlDMzJKVUdVREtiVnYwSE9SeUZn?=
 =?utf-8?B?ZGtWL0xtMytCVmtLbWNNcVJJNFVFNktpOTNuc1ZiZVdFSlBERlN0REI1bmU3?=
 =?utf-8?B?ZDJFTG9OMGs4WEgyd1B0cEZVRE1KMmhOSmlvM1VBVnNqYWFOOHMyeTVqczdW?=
 =?utf-8?B?RGVTOHl6bThqZnFlS1RTSERtd1FmVlBTZ1l3MVZtbUc1d1VRQ2tRbVhiZ0dn?=
 =?utf-8?B?Ung2UFFBMWRQaC9VSEFlV2JtT212MjJTdzJ2OE42OXZyWCtyRGcwSnFtcVgx?=
 =?utf-8?B?OWlFYy9lQ1VvUTF0S1lTUGZFN3FIS2pkaVN3MkVOZEZ4SktJWWFXLzdEV1ZC?=
 =?utf-8?B?L3NqSGVBUURNb2VTWGRXaWRKVFYySnhHa0xoVXlrUkJ3bzZOYlBQdTVyUXp5?=
 =?utf-8?B?U0ozVHlyWTU5anBEc3pOQ2pDKzVGdy9LbGowdUNac1lXRnhrdXBIcm5uWmdW?=
 =?utf-8?B?UTQyZVBManBGcGZKL3R1ZStMc3A4bUZWNUxNdlVVTk50S29sWUc5bHp5Mjgv?=
 =?utf-8?B?UDV3Mlp2WkpVb0xFS1JIakhjQ0lESWhhNitEOTJNVFYvSVJCa3FNbHNxRTht?=
 =?utf-8?B?NTZCZFFNdkY1N0JLL1hKT2hxSElWT2k3MFZuV2dNeEg5eXBTclRBZXJ2RmYy?=
 =?utf-8?B?T2VQeGZVTWh0SWwwTkpaS3JTYlFPaENLZDl6UjIxMW9rbWpjVDhqaU02RitB?=
 =?utf-8?B?ZFJXZ0ZzdmtITWw0bU80Q3NOUTBsL2JoNkpMbHZyVURLMm53WlBnSEE2Njhz?=
 =?utf-8?B?L1cweXJMc3dRaERRMnBFcXFEK0dvUmxZT3VBM285SUJWdHZJdlJucGJKV1FX?=
 =?utf-8?B?UXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 215201c0-a61b-4d00-436a-08dd3b9800ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 10:23:38.8534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/9CJTy/pqrjPbWX7kHur5F6UNmMfJpZjBotP0FvpwOY4DY4TOs9PidxCvrLGp5HZF1DKS1oCZH/jWyXFPhMq8pvDpkPdkk5Yk2EWeqb7q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6067

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjMgSmFudWFyeSAy
MDI1IDEwOjE4DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS81XSBhcm02NDogZHRzOiByZW5lc2Fz
OiByOWEwOWcwNDdlNTctc21hcmM6IEVuYWJsZSB3YXRjaGRvZw0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IE9uIFdlZCwgSmFuIDE1LCAyMDI1IGF0IDY6MjDigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPiBFbmFibGUgV0RUMSB3YXRjaGRvZyBvbg0KPiA+ID4gUlovRzNF
IFNNQVJDIEVWSyBwbGF0Zm9ybS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghDQo+IA0KPiA+ID4gaW5kZXggYzA2M2Q0N2UyOTUyLi4zM2IwMzZiNmE5M2MgMTAwNjQ0DQo+
ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3ZTU3LXNtYXJj
LmR0cw0KPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA0N2U1
Ny1zbWFyYy5kdHMNCj4gPiA+IEBAIC0yOSwzICsyOSw3IEBAICZzY2lmMCB7DQo+ID4gPiAgICAg
ICBwaW5jdHJsLTAgPSA8JnNjaWZfcGlucz47DQo+ID4gPiAgICAgICBwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOw0KPiA+ID4gIH07DQo+ID4gPiArDQo+ID4gPiArJndkdDEgew0KPiA+ID4gKyAg
ICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ID4gK307DQo+ID4NCj4gPiBJIHdpbGwgbW92ZSB0aGlz
IG5vZGUgdG8gU29NIGR0c2kgb24gdGhlIG5leHQgdmVyc2lvbiwgdG8gaGF2ZQ0KPiA+IGNvbnNp
c3RlbmN5IHdpdGggb3RoZXIgUmVuZXNhcyBSWi9HMkwgU29NIG1vZHVsZXMuDQo+IA0KPiBJIGNh
biBtb3ZlIGl0IHRvIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemczZS1zbWFyYy1zb20u
ZHRzaQ0KPiB3aGlsZSBhcHBseWluZywgc28geW91IGRvbid0IGhhdmUgdG8gcmVzZW5kIGFueSBw
YXRjaGVzIHJlbGF0ZWQgdG8gb3RoZXIgc3Vic3lzdGVtcyB0aGFuIHRoZSB3YXRjaGRvZw0KPiBz
dWJzeXN0ZW0uDQoNClRoYW5rcyBmb3IgdGFraW5nIGNhcmUgaXQuDQoNCkNoZWVycywNCkJpanUN
Cg0K

