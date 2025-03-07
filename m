Return-Path: <linux-renesas-soc+bounces-14134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A066A562D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 09:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 762CB16BBDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 08:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26881E1DE4;
	Fri,  7 Mar 2025 08:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="axMEokcZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010040.outbound.protection.outlook.com [52.101.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673DC42A9D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Mar 2025 08:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741336979; cv=fail; b=alF+LFH4T6O9OD+03g4Hi7X8TiOlsmXAN4QeYG/4ZSgukLvDo0QyuqFjJBtPr7rbZ6bCcuZqMUo18KJpU+rNq01OjYfUmCFD3ZI3P0tMZoAYgrJt8zrnz5gmx3yG2FW7jVQhHz+M1LfbGHIjTlSIoItYq+tvIpcBapPxxsHXikM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741336979; c=relaxed/simple;
	bh=zuO9IGiX/X3u9LdGjIHUyy6htPexxuoufUmlfikApNE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YQQaMljdtmsvLPSHhbkUfTwyV+AZ8VUdCfBzTaq3O5ilFxmlTSfGHZwZLzKHQWder81WFpDWN7qkKdtuJzh+QcJyd73NHeKza/+J0Dtyc13NbVQpr/hwDMQrcXjqALDYyBDHy8oqxVNy+nzWuakaOSiXXpxHjYnF7q/P/yJhSvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=axMEokcZ; arc=fail smtp.client-ip=52.101.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haBK7TX4YN7cOmURvWGJMkOqxn0kq7VBbjmSbv8pOn+HjvCskHaumgDKmTmrMV+mb4G7irbouw8AdUwROUGLpi49Zt+7kUUYn2bBfJ/2yo38K34WILF2X7qrNSpa+xLrPkZH0H01/ctRMYTXcVBJfun7fdn6+ZoBjFya2O8ec4uhszZ9qzJyur8rdtdMKaBZmO1tcnN9AVtKaWldQhVTORLk4IhSbRRoUpqHFVfDWf2BGe+xuPY2/ZkQcW8ZyLmZ84FgY0yItmNwJjktnid6gA8UC1o4qcCeZA/1yECIk9hOWP4mPN84DQQImHUMsJNGqn0eBz2vXDBBivCyw10v6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuO9IGiX/X3u9LdGjIHUyy6htPexxuoufUmlfikApNE=;
 b=EQ1OdfrwnNLgEKg3mdDCorhS145mIKi9ysBfNAV8tbL1TEwKzHVJ6vLM8JiU9tyjMELJXSgM8l2zetHCVPe1rneD5NI5Q2q17NWAz3vOIVwsqaanCs297Vcag2tDX9X10FIz3dM2y7IkPRWIcJU3wUWI7A64On5qSI7IXavf0qITHkTvArf/wiFi6lyshsAMi+LlLSSveD+2oMy8vWZ3vtU9MOk7IBWqm28jBjSBps6kQ+eKL0RDvUzRBLB6nvcX6dj2sZ43uHrsvF8AoZP/YS6QFbVfSW2e90wVy2aivz6bpGAMXAkR+ekYe2FxX033I7RCTz12oISHe6BhildcqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuO9IGiX/X3u9LdGjIHUyy6htPexxuoufUmlfikApNE=;
 b=axMEokcZXeGMphBIhK/1465SFUopymTGwEnTQRWezHqCwisaOIPTAwU6+UonyPdQE6ba0Tnbw1eHPHRqgVoT3/oIaxH5E/35d4bilreDt7aPQb8VZe2fYWLspJuxlGnlJifmA0GOiz6MaImgXSXoEut34ee+NuGU7raajTLWZP8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8278.jpnprd01.prod.outlook.com (2603:1096:400:15a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.21; Fri, 7 Mar
 2025 08:42:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 08:42:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/8] memory: renesas-rpc-if: Move rpc-if reg
 definitions
Thread-Topic: [PATCH v2 2/8] memory: renesas-rpc-if: Move rpc-if reg
 definitions
Thread-Index: AQHbjrqLARyFG2OLuUyFd0aqtnBu3bNnWsCAgAAAYbA=
Date: Fri, 7 Mar 2025 08:42:51 +0000
Message-ID:
 <TY3PR01MB113464713642F8841D2FD875286D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250306170924.241257-1-biju.das.jz@bp.renesas.com>
 <20250306170924.241257-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVcGD2xnzHHV8w9UGm2BqqANLG8SBR=2QRfpwVeRDn=tw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVcGD2xnzHHV8w9UGm2BqqANLG8SBR=2QRfpwVeRDn=tw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8278:EE_
x-ms-office365-filtering-correlation-id: 68198e31-951e-4ef5-0d39-08dd5d540bf5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NXhlUk05cEt6Sk1sT2hnRVN4VUcwaE1laTdHUzExNzRYZzRaajNiY3VkdEt0?=
 =?utf-8?B?ZzNGcWY2RDdVdG83TVg3MGxFbGNSU0RyaHZQcCtEYVo3MTJ1OG1XN2JLN3g4?=
 =?utf-8?B?ZFErNUtYbFlRTy9KWi9JYXM1OWRROXdtRitPcnZ5MWo2eE51emNYZG83UXJU?=
 =?utf-8?B?MWIwNzZOMjZhRTdDV0RFZDMrOHBFTDN2UGhETysvbkJmS1doN1Rua2NKN01m?=
 =?utf-8?B?WStBNVlNVnFiQ2I5bWU3Uk4rbkRLV1dHb3VRZkFhMUJpUW5DQkFwellid0Jo?=
 =?utf-8?B?RmJML3k4Tk5pNW1OUWNRcnBOOFEwczNSc1ZWV015dEpOdnRTUHlObXQzV3hj?=
 =?utf-8?B?OEpXZnhhZy8wejZhN0twSFNuMG5VSVZJQWFTbUdWSjE0cEE3REMrcVFQakRn?=
 =?utf-8?B?ZGJsRVBTN3dNR3l3c3dEbWlVZXlUUU4wOUUrY1Y5NHBLMDNXTER2V3hWYlFh?=
 =?utf-8?B?MGN3YkU1Mk9zWEl6MGR4K1VkcHNkRVFmeG9ITXFqS1RVQ3ZaZUtnZjNRMVA4?=
 =?utf-8?B?TExzTDJTWWxneDNIa2UwZFJocW5jWmg0VzJNNVhqVnRNNVQ0MlgxK21nZ0x2?=
 =?utf-8?B?Zmt1S21OYWk4Y05KTDZQNnZMVy9zMStQWi8yR0k3Q1d4VXV2ZnRJSit5TjJE?=
 =?utf-8?B?bmx1Z3BvZW5uNk44Q08zZ1hxVHA1eWlwSHdJNGk2V3h2WWdIRkVqdncxWnI2?=
 =?utf-8?B?azVXZHFzalZjcFVzM2RheDNtcjBFa1lNbE02ZGg1QU95ZjR0M0FaaEdqWDd2?=
 =?utf-8?B?WkYwcmRDa1RRWnN1TDRWK0gzS0lkUnN2TFpGVy9lQnYyNG9pbE52L2tOM2dn?=
 =?utf-8?B?bksvc1NmOFZNanN0ZHJUWnVqYkZNTjVTQW5LRkorbDBRaVJ3OExRMjVlNXg0?=
 =?utf-8?B?bHNjR0ludmNrY3hzaWV0aEs4c3FuVjJKdzV2TGdDdTRGYk12Ym9LK2FLS2J3?=
 =?utf-8?B?ME9zVmZ4bHh0cjIwTSt5L3dPTEhnMndSMndJWmFOLytXMTk3d1VkSFpsYlBw?=
 =?utf-8?B?RnJFUEF0ZjBYUWZ2ZHArUmJZOWdjbmlCVjV4dFZQMDRSUFpxQnVRcmRKWUlV?=
 =?utf-8?B?VnFlcFo4RWRpT2wwR3Vqanl1SDZOQ1VIbU1QQlFlYkhSY2pWa3h0TDlpeVNw?=
 =?utf-8?B?TGtHeGJnMy9CcUdtUUZ2U2ZtMDhIL1BzNHY3WURvUWlhYSszSS93Um1DVFp3?=
 =?utf-8?B?aEprek8xQ2t6SFhGRTBtUE5YYlpzQk9GQlY1MnpxalU0MTU1SXI3T2hwMmhR?=
 =?utf-8?B?ajhLcUZITmRuQlcraXNPMkJHdUV2YVI1Mk9yRGtENmpJTlk1NmNyd3lqeGc1?=
 =?utf-8?B?K0ppNjV4cUtpZStVTlA0U3ZjNEN5NGFwdDYremdBdnBITFlmQ1hyWGxYdHNG?=
 =?utf-8?B?TFZPcENaTlJZZXNSV0svODA0eFdZK0luL21DRjNCMXdnZjNhS2NTZlFEcUti?=
 =?utf-8?B?bFladVg3dTVtbXVBQ2JpUkp0ek9QQlJIdEx6dis2dU9RaTFMSE1vVEJwbHZn?=
 =?utf-8?B?WWx0S1VwSjh2aFdGbks2MlpSMEdZcGRMemRtbkVjMGJ2cFVFM2F6TGg0aU5L?=
 =?utf-8?B?dDVUTE51RFp4Q1VIcllITVVsTnVyaVR4MDIySEFWOU1Qb2xGamEwaU1sV3ZU?=
 =?utf-8?B?bitsSnZtTE1YcHErVUhTaFRlQWhhV1BYVTk3Y05CYVJLc1VmMmxRWFR5Sktl?=
 =?utf-8?B?NGdUaEQ3TGV5MXZIS1JiNlZncUhXcCs3b2NxSER2NnNEeGE3OStkbis2ekNO?=
 =?utf-8?B?Mlc0dGpiWi8vRHUrTHdXdlNNN085dmRlLytDVVhHTDd6cFl1eUFXMWVBSERG?=
 =?utf-8?B?UUxyREN2TnFiYUNPU01oOEVHV01tcW9pdEdFZkl2Vlo5ZDFSc2R5Yk1yNFZJ?=
 =?utf-8?Q?BULaK6YFy9D4i?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Slk5YWJNTFZvNTMzV25BK2t1MEQzdHJFaVRFd3p6NFJDQ0lFUjE1c0RqTXlh?=
 =?utf-8?B?ZlgzdnduSDhJcFhaVld6LzFhK2xlOFl1V3RIWEQwbXBzeDdBSGtick8vT1VR?=
 =?utf-8?B?N0dSVlBKbG43OTNMMlhPSkVod243RzlzMVpKUnkzeGJsTFgxbUdTYWN3dHJy?=
 =?utf-8?B?WnowSEU5WVhOS2FVYjdGekt5U2N6TlRBNEM3RnRKeFQwZHFBTVJGa0hJcDl3?=
 =?utf-8?B?L09lUk0zYXBYMVJoOFhpcktkazA2YmxtNHJVRVBhakR1eWZaYnRPN0g4N3R6?=
 =?utf-8?B?QVB3bXVKVUsxN09yWXNoZG91Uk1HZXRiTDJ1VHNzclBtekl0NjEvTzlxS0p1?=
 =?utf-8?B?dnNueG53dVNjY1ZhYjJJQlNzUlNMRkRIZkl2ME0vbENNMkwyOVRlSmJma2F3?=
 =?utf-8?B?NkZ2UW45cEw0b2FGK093QlN1bkRadUloRDJwNkFERnkveEo3TS9GL0ZrUHRk?=
 =?utf-8?B?MG11MTVHSGx6aXc5WmJGRXJBNXMrbmZxQTdEKzZLbUpodldFbi9zYVVPSmlU?=
 =?utf-8?B?VS9pOXlENGFEVFBmYlpUMEsrUTdSNVV1R2pRYnhZTG0zV3lFR0ZNT2dldnlJ?=
 =?utf-8?B?ZWJCY2lGOVE2QVpMSEFFRGlFRUU4WDN0QWpiTzdZZjhUV2pzbS9jL3NvMXU0?=
 =?utf-8?B?M3d6ZXkxeFFKOEZaN05EZUhkN2QwRzhlNU04TTF0L3U3WlA4WEpGTHdDZkEx?=
 =?utf-8?B?R0orR3hyMFNQMVFKVWxlNHNNaEl0SVZBWUdVc0QzcG84RWJpd3JSQXgrSFE2?=
 =?utf-8?B?NndqSUVBYXBDS2FLSVFSWkpjQVJiWDBPL1dkV3NpRHlLR25IYUdqNFlMNDBH?=
 =?utf-8?B?QzIyQTJGY1BGeWZrQWJvVmptK1orS0Zod09FTG1wd1dSdmpWYXBXMjVRUG4z?=
 =?utf-8?B?ekZkMXVQbTdBVFlubDBQcVdzcTVMOHVJYUdjdHFEcEg5M0ZrZ0s2UW1FTmVK?=
 =?utf-8?B?azFtUlkyNHhIYW1mTGt2QkRQOStNTGw4YjdEOUJ6dDNVWEp4aUY4Z2lEelN3?=
 =?utf-8?B?aktSMUZEWnFuZ3FlT3NQTllFajRubU5JbzdGakFSRDZCT2NaWDJtcGR5S1ln?=
 =?utf-8?B?cDNZZldNaVJWRDh5RWR2TjJEeGltMjhiRW1BK2FsQmtlZkE1dStQNkFzU1Jz?=
 =?utf-8?B?QzhrUTlIeFZNUXpHM2l3ZWVsampmYy9WNGQ2d3dPUFB6dlpLN1hnczl2ZGdx?=
 =?utf-8?B?OW00ak1LRzE4eEFqbVZQOWxpdEdCaXZ0NWJUUTBQQWZmY2l3NVhWa2hhNkRv?=
 =?utf-8?B?STFUZTF1U05SeWt5WDc1MUFEL0kwV2Uzek8vdUljeEJjdTVFUURUM0h0dXhm?=
 =?utf-8?B?ZEFGSzBjU0VnTjFaK295emhjamdzd1k1cVo4NnVyZ2dZQkZnMmFzdG5oaFBI?=
 =?utf-8?B?ckxyOWdpRjhhdlY2dUpjWjdYcHZ6cm1qNDlNK29CS1BPVm1kTVlQVGJMbDVM?=
 =?utf-8?B?a2NkbnZvbGEwdFdnRmxpdVJMUWJjcXVKTE5ER2NvZFp4NHpWbjNrdDk4ZXla?=
 =?utf-8?B?OGhJaWxScmJra090QkJ2Q0JYYVVoalVESGx2b2xmK3kyc0lONno1VUpIZWV6?=
 =?utf-8?B?WVZkVWZReUNxTnR6R0RsVURvcndyR0lwb2hWL29vU3dPSHliK0hTL0tlTFFo?=
 =?utf-8?B?ejFkOUtZVDlqM0dNWW9hL3hmaG5EUjJzMGFqNFp1TXRvS2N5dUpSZitwbGJF?=
 =?utf-8?B?cjFJOFRseExGVWlRcU9DZlY2WGFJQTBUU2lWdVdNK0FzUTgrWG9YTktkY1M1?=
 =?utf-8?B?cnB0U090TVlhSlJLQkg3MWJVM0w5ZG85Z1lSajlic0swQmRya1RxYnRzdjhM?=
 =?utf-8?B?bFRjWXpHZlJqM0RTYlhuUG5NM0lJM2JSSmxVdmhzek1ZNlVhdDh2cWcvNmc0?=
 =?utf-8?B?M0ZHQmRmYkNDeFArL3o5OW16RkVQMzYrSzFkVHk3SUwyUkZ2dkNRT015dm91?=
 =?utf-8?B?NW1JdElUcmIwazJHdUZZK08zUmx2bDV5b3VDb3Z5TmhJa2hVdkhtTklLUDFM?=
 =?utf-8?B?blRkNXQ5SU5OOHNGZmpEZ1BGZ0c2QlhjVHI5UEVOMGhmZmtkOVowdVRXb0Nx?=
 =?utf-8?B?Q0tXTy9DaVRTK21qUUdYK1E5TTNBT0dmSm5kcVBIS1ZieFAxRmxWT3lSdE1h?=
 =?utf-8?B?ZzlqTGQxOWJrMG5aUmFWUFlPNUFXemNuRUp3ajVpc2l0SnZtVmUyVkJyaHFM?=
 =?utf-8?B?aHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 68198e31-951e-4ef5-0d39-08dd5d540bf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 08:42:51.5472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HNO6OKOi2pRcbkEuJiX1h8iaUX8VZrYIcbBvP6ZrGXv/uZkQuo0wmIBevnbjWK5JljrcERyAv7M6zcnXxA5aSYGNw3PWqenUzXaCE/4a0dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8278

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA3IE1hcmNoIDIwMjUgMDg6MzcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAyLzhdIG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IE1vdmUgcnBjLWlmIHJlZyBkZWZpbml0
aW9ucw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgNiBNYXIgMjAyNSBhdCAxODowOSwg
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBNb3ZlIHJw
Yy1pZiByZWcgZGVmaW5pdGlvbnMgdG8gYSBoZWFkZXIgZmlsZSBmb3IgdGhlIHByZXBhcmF0aW9u
IG9mDQo+ID4gYWRkaW5nIHN1cHBvcnQgZm9yIFJaL0czRSBYU1BJIHRoYXQgaGFzIGRpZmZlcmVu
dCByZWdpc3RlciBkZWZpbml0aW9ucy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRj
aCENCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvbWVtb3J5L3JlbmVz
YXMtcnBjLWlmLXJlZ3MuaA0KPiANCj4gPiArI2RlZmluZSBSUENJRl9EUkVOUl9DREIobykgICAg
ICh1MzIpKCgoKG8pICYgMHgzKSA8PCAzMCkpDQoNCg0KPiANCj4gc2NyaXB0cy9jaGVja3BhdGNo
LnBsIHNheXM6DQo+IEVSUk9SOiBNYWNyb3Mgd2l0aCBjb21wbGV4IHZhbHVlcyBzaG91bGQgYmUg
ZW5jbG9zZWQgaW4gcGFyZW50aGVzZXMNCj4gDQo+IEFuZCBpbmRlZWQsIHlvdSBtaXNwbGFjZWQg
dGhlIGNhc3QsIG91dHNpZGUgdGhlIChkb3VibGUpIHBhcmVudGhlc2VzLg0KDQpZb3UgbWVhbiwg
d2Ugc2hvdWxkIGZpeCB0aGUgb3JpZ2luYWwgd2FybmluZ3M/PyAgQXMgcGVyWzFdLCBpdCBpcyBz
YW1lIHJpZ2h0Pw0KDQojZGVmaW5lIFJQQ0lGX0RSRU5SX0NEQihvKQkodTMyKSgoKChvKSAmIDB4
MykgPDwgMzApKQ0KDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNC1yYzUv
c291cmNlL2RyaXZlcnMvbWVtb3J5L3JlbmVzYXMtcnBjLWlmLmMjTDU5DQoNCkNoZWVycywNCkJp
anUNCg0KDQo=

