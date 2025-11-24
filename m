Return-Path: <linux-renesas-soc+bounces-25083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C21C815F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 16:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC37B4E593E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 15:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC1531355D;
	Mon, 24 Nov 2025 15:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tzyJ0ihS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD06629A322;
	Mon, 24 Nov 2025 15:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763998539; cv=fail; b=puDUqFT2jRTZRZhc3TRxuTTsUnySMUyFiszBIUmM+nEmq4IzRh0Ix7yVSF3GNqvo65vo2pC55SFhjgqibcvzyVmRgDb+At8q6VzrcMlfhNvjMuqnM3oaE8UrpqjPjtp6p0/M3qMqcPi/ms/3HZfUAu/cm3Xbjh1oG1tYc/PwPcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763998539; c=relaxed/simple;
	bh=mzzUU0cSE95R9F5/JvCA1/WQs8R4jU+ByQv4QPHxcdw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PBCv3GTO5XPRBEw2JLr6hVUEnfAHTDXOXn5oKNLKfOs5hkjlzGEPvE6T2n/nZ/Uk6gQf7yG7srxDXoCcB/TBjKMpb/EfQOtuK9HwRZsPPrajDm9CMHcqvu7Npz6S5NMpMDpDXbPlcoHBMMrebX2zNfH14sKDg9tiPq6EFAY+V6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tzyJ0ihS; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTwI3a8xSZ82otoEpg6s7gL79dhu+0eNGPdS2GW9N3gEGZZPyhp/zxJwlYjEtapshRZ77pceQ9+aaeuz6Mo4GelvIBaRRCR06qv/dcGz5BNKpSy4FXm34DFyJuSbpCV2FGpf5qXWO/IHoM8gRoyq23iaAB/RBhf0W5uI8BG+RnzmSa9iMmdk9to5FGYsbDekHLL1ZPigZGoCMwmsTcWBhGTWgDP6cKcOodMldkGgxNYAPJTInZnU8LO8SAzMLhFxlCMNP65m/Kh7McCeLLMu6oiXj/4pNr11+2uKpgwYbCX/bmP/4moAer/NaObEwHFe21OnQemWDBcCGpWgqFD3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzzUU0cSE95R9F5/JvCA1/WQs8R4jU+ByQv4QPHxcdw=;
 b=UKzxOeTKm0gUblExWdB+/ozamuwyfrll06Cd0gIR36V8emPbda31E+NjfwtUQ5pczmW40L7iZiAwovpYLjRTktL1MnVc9cfZwU99kOwJgafTdlrccPJighcJoz0m39YG5OHxX3aWxuS1E6o/lCSeukAcdXjDLJO/hPCK+xULhEkIg85PO+baUm/t1HZ1XNznmwlCVJIT4Q6+SkeeIEe7Nt4DpDX9OqLCm/yvt0Fq8k+9QkETmizp0DvRjCjN7VGOt92Y4B3DG1i7XnMPrbBc+diJsfipgBypq47H/BZjS/GSV2Ms3xcmcIqCEAUjzJ2p7qJNJpxCKeIU2fO522T/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzzUU0cSE95R9F5/JvCA1/WQs8R4jU+ByQv4QPHxcdw=;
 b=tzyJ0ihSyRy1TvapGBG3wOs/ipWbxScvl2sHn3n847CNSdfxFRPW0VFzbfetFnKDRnjEL96qx81cRLJRke/8xPnGCUZ+89sGMX9Fh0I4fWdvYPi/ESrRncofsqbxqIAYVAzon68QFdAa9hmkt16Zjo6XX1uGE7JrEU9sr4N/avw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10219.jpnprd01.prod.outlook.com (2603:1096:604:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.9; Mon, 24 Nov
 2025 15:35:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9366.009; Mon, 24 Nov 2025
 15:35:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: biju.das.au <biju.das.au@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v3 01/13] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Topic: [PATCH v3 01/13] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Index: AQHcVVS6OMCUOoA+JkaffOYYEa9gA7T9XSMAgAFhEuCAAAs2IIADD9oAgAApgdA=
Date: Mon, 24 Nov 2025 15:35:29 +0000
Message-ID:
 <TY3PR01MB113464B6C3187A09376CC576286D0A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdX41rq-sd6_g1oCrQVPpgb-MXakpJ9mEbS0K+FY8Q7NDg@mail.gmail.com>
 <TY3PR01MB11346D401362BE3B37564C28586D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346A0864AF1CC5A3807E40C86D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUwn8Ad3OYRX9jB-gFKskmwYwTna882d4J=28+zra=awQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUwn8Ad3OYRX9jB-gFKskmwYwTna882d4J=28+zra=awQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10219:EE_
x-ms-office365-filtering-correlation-id: 710871de-a51d-4b8f-4e29-08de2b6f193e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZVVlOExsRlY4d3JEbWFxOXY0MkZoMW91YjF3UUtJRHpIVkl3Z0lWbytQYUcr?=
 =?utf-8?B?VXdLcVFTK0s3WkIyZHNWdjhvQWpXK2lRRSs3QmNaUEZ3TTZOeGE1TzJpUnUv?=
 =?utf-8?B?VW10eDk5bm4xUWVzVGVmdWF6NEVub3cxbTUrU2M4RktIbjAyRm0ybFBlVXVZ?=
 =?utf-8?B?cFBzYkJRMXNYNDRteGgyVGdad3FPaHFsMTJ6NFczWDdZY1BBekx3S05EOWEx?=
 =?utf-8?B?blJ3Y2x1VUladDZXQVprdGlOMEZLWmd5Q0l3MWxudE04WE9GamxoeDRIMDRw?=
 =?utf-8?B?Ym1kQW5sYVptejJ1bVlxMVlVbVc2SGlPVk85Z29zSE5ONmFLdCtQcXhhMFpk?=
 =?utf-8?B?eFBsSFJnbG1oQm15ZWxEQWMySHJ0UXovaTRHTGUySndUcmVORzl5UTk4NWNo?=
 =?utf-8?B?VC9zZDJJdlAxRVloR0hiQjBEQVBidGVUTUdHVHlqUnNrdXpSNm1Mc1YycVdI?=
 =?utf-8?B?ZFlHVXh2MUt0M3Buc0xlR3FydUlSaFhmaXUvRHd6RkMvZHM3OXQ3KzhDb0VU?=
 =?utf-8?B?Q3VGSVljTFVDbW41SkxFRFlhaUp3citFKzNxZmdqQkdaNnhUSnliT0tDS0l2?=
 =?utf-8?B?TXkyYXBKcnB1R0NHMWhmMjVCbWZjV2JnZE5qalNIVTEwWGdOa2NJZGIrMmlh?=
 =?utf-8?B?VTFXMWtVVHlSZVJkS1dsT3hZZkFiV3VNemFoV3NPck1aaHZ5VG56TGhGN21D?=
 =?utf-8?B?eDk5dEFXc1BDVDVaenF0QmI4WERSSFZPN2ZPejlFc29uM2wwenI5VW85QjRj?=
 =?utf-8?B?c1RrL3JnTThBaVZuNFZMaFlMcCtlUkxUdW8zd25icXdZd1FoU0JGUWNNdm43?=
 =?utf-8?B?YUdhK2cyYVJDWjZ3RTB2YXBCVlorNzRRWFZlMm5pSW15TDBYeFJpQUdMV0Fi?=
 =?utf-8?B?N09sUVE4bHcvVmt4N2llT3NzN0dSMVlBMGJJN21BMjErdXRJOVlPQmNaelk3?=
 =?utf-8?B?Q3RNS1kxcXpnWDlzZnI1RWlLRDdTc05XeER5dFFUVGNuTS96c01HeFFQTGht?=
 =?utf-8?B?MEhSYmk3RGpkZXRlM0JRVHMwbE1NeGcvY1dEVWEwMmJMSVpYNlRaUEVyVHlD?=
 =?utf-8?B?SGFkdWhCbTAwYnhvS1FZblFpQU9sSjA0RVozL0ZCeFFKdVlocmpzQjJzZkFV?=
 =?utf-8?B?dzhQdHFna25rNitSa2Nhdm9aOUc2V2xzYy8zeXY4SGJNWlVENFRHanR1Tndn?=
 =?utf-8?B?K05qSUNTYXdPVEdOc0x6WDBNWDlRU3dZY1FTRVRDNC9mNC9paklKM3E0VTlq?=
 =?utf-8?B?VnBVMVVucUo5SzdhN1VGL2hBSHk5VnBsVVpEMmJqYzQxS0R5bVhmSU9ZMXhm?=
 =?utf-8?B?SmJCbFpGYXk5VmtlYTlWTGF3TWFSamR1eVhLOEFTai9OVHc4bHg3YmQvdUpZ?=
 =?utf-8?B?dU5IY080QnR6ZldCQkRSWVZPUlJwUUVLT0xUdjVjcHNKcHNzZ0JtK2s1WHVM?=
 =?utf-8?B?eW15bGp4ZXl5b2dLQ1BnbGNORnM4LzZObXVDRFptNHNhcEd3Yk83RCswWnBl?=
 =?utf-8?B?OC9yY01xSkoyWEM3ZW1QTmQ2VVJMQTM5SEMwRFQ2VjVadWZlYnZ6RGllMjlj?=
 =?utf-8?B?emR2RVExa3NaYmU3USt2MkI2TTVkYUd6MGNsY3prQWxtdVRrZjhzcnBRbFQw?=
 =?utf-8?B?aU5wanhZQWQzdUJ0dGh2SHFydW4yY2drVTNDMStoZFJpU1Q5WGJHQ2d6R3Y2?=
 =?utf-8?B?Z09pMGV3Si9pWFBYSmZBWmRrVzZ4T09GcWQxdG53ZEFPZTM4czJiUzhOWmps?=
 =?utf-8?B?U0FYdEhyaUpGcjlKNVdpVzFnbFlKeWhPNkJlWWRRN3lsTms5Z2xId0ZQdjBE?=
 =?utf-8?B?REZhSWlINHZlWS9wVHFRaDZyK3BHWTZFTlB6cTVNUzFHaXJRRE5ZUVF6VUpw?=
 =?utf-8?B?S0g3SWIvTVYxK1BqQURFbjkrSE44Y1dtNW5tZmV4K0tYcU94OWNIajFvLzVQ?=
 =?utf-8?B?RHl5L2N2TG9kb0tubzFlUnliYVByVFVybjA3aFRHUHhORStFNEhxd1NtS0xh?=
 =?utf-8?B?bG1aaGVWRnpZNk1MNlI4MDBYdEFrUWMzbXdOS2dTMG5tN2dFTlZ0L3FJbDhz?=
 =?utf-8?Q?Avcedr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N3JTaGhFK0RlYVV1OEFqQ2dTN241T1FRbzZSc0o3TUZBVGZRWWMzWkVTTmpj?=
 =?utf-8?B?TG8rYkcxTWJ1dnVZa1JRL2RGaWpnZzBGRUJWWkQ0OVJVektpV1JrZlEyUTNw?=
 =?utf-8?B?SGRmTTFMK1lHbWxoWkJ0YWtOWVR1cHpheUgrbzFlaHAzamMzbDRDaWVJbGZH?=
 =?utf-8?B?bHpreU1EdUdNUkM0ZTlueVpuOHZLanB0YmF1c01qNnRVQ1ZGcjFIY3JyUWlH?=
 =?utf-8?B?Z3JpdFJCdXVpQXB4K3dRZU5nMFM1Zm1NRWJkUUR5RldDL3JQbkFxem10TTJo?=
 =?utf-8?B?UUJodHU5RVhjbUdRTlNzMEFwa3EvajZSS0FIR1pacHBoaFB5UHhSaXIyczhp?=
 =?utf-8?B?RWtuSVRObERSZFFDTk53WWQ2dWdGY1M3NUN0WFdvY3dzMy9RQXhkYjB1bis4?=
 =?utf-8?B?LzNXREwzMGhLTXhuYitKdzJheTJGSUpBMXJxYjdFMjhjYXRhUjdoUlNBb0RB?=
 =?utf-8?B?SjFhZlViUVBoMnQ0UkJGZlUzdCtWTUFUTitGTCtCQkdBbkF6SVlPc3pkQWJ4?=
 =?utf-8?B?TmJrdy9YSFl2NnpRSzVTR3hRZlpTVGtRbHVWbytOUDluVHUvd1dFeU12bTd4?=
 =?utf-8?B?VkYzcmxxTlNieURSdGQ4cWw1OWgrMTVqL0Rmei8wY3k1bzI0dXg5N29IcE5G?=
 =?utf-8?B?M0pZcWVpbno5N0lBeU1lSWlET3RORis2YjVXcVNkZ25yaW5Mb29TNHlOb1BP?=
 =?utf-8?B?QUNHODZwTlBITFBBTTlBM0hlZUFBU3p6cENNZEN5MEd0NjhwelU1eVA0VzlQ?=
 =?utf-8?B?T21qcnJtNlkzVVMrM2wvbkNENHA2TUlsTmdqQ3o0Sk9RNXcvYVhxMlI0SHdR?=
 =?utf-8?B?TE5Ic2IzQXNEZ0pYcGg4eXh1eEVhZDFTaWE1WE1QcE1pKzVRL3VHMW1Tcy9D?=
 =?utf-8?B?YkRkY01CaGFZcEFuTmNrUG4xSG52eEZxbllaV1doMzIxNFlGYjJSZHpiRy9M?=
 =?utf-8?B?K2dvS1IxZDV1UEtxQWcrVmlQS2JUNTZZS2JQOHpsanRxY0RycEl3ZmdES09s?=
 =?utf-8?B?QmNWSWYvN3p6c3JwczJLRkVqQlB5eVdKUTRwUDBKbGQ0aFBRWnQ4M2UzR09X?=
 =?utf-8?B?b2YxaVVRUG4rTkZYNG1kRC9IS2FwbFVBOU1UN1RseDdpeE9qbWgrcnJlYU9F?=
 =?utf-8?B?SThEcXZnWlZ2SUJSYU5nVEFIS0p2d2R0ZjNneHN3US83OXJzSDJtMnZYcmlz?=
 =?utf-8?B?RXNlUlB5VmhHYUlGL21vQ0swcFZSM0tCd2g3NXdnMnpYWHB2U0l6WVhQM3M4?=
 =?utf-8?B?eVNZOURZeXhQL3dQd3cxb3hBM0J5M1ZvRjR5cEZFUzFyeW5LK0xzS21XbkQw?=
 =?utf-8?B?LzI2TC9veDBFRXN2VDA0MjNjMHh6VkpGdENwd0RmV09jMXN1VHd0TmREcnpL?=
 =?utf-8?B?Ti93UFlsWFJObTFyeDY3dm9rNFdhd2pON1ZLeVBxWXVySm83d3dSejRxcSt4?=
 =?utf-8?B?Q1l2UlhsOFdocjBxay9XQmNQeU5mc3pIQlpEa0JLdm95UmpSa0lBa29rdTF0?=
 =?utf-8?B?dmowOWhuQlBNQ2ViN081dlpaZ3RTOGJaQzBZMEwvaVBiTDVTR3pYTTRJazNh?=
 =?utf-8?B?L0pwcUtlV3Y4T1YvZDBkWk5BYTJqWG9xWnhXYlFtdzA1czVkWHlyTzlGK3Z4?=
 =?utf-8?B?MWtaaVcvM0lnNm56RFUvd3lPR2VNSW5vekJYQUhlSkdSMkpFNGlIUXRRTTdG?=
 =?utf-8?B?TXpXbUZFMkdEc01nOFA4aC9LWERjSnd6QSszN3lPM3ZwdkEzNXRtNysvNjYx?=
 =?utf-8?B?VytwUzJMTWxpMDlmaVBKTC9OWWdRazhYQ2R1bXhmV3RIcnVGUCthdG90bmJn?=
 =?utf-8?B?YmJEWnZmbXRpTUpESEFoWHlaeFJlMkU1TUNDZ1pnbndvcVFVRk1Qb3ltZVNR?=
 =?utf-8?B?YkN2anRQbEs0ZDhFMGlNblBFR0RmL3dHUlBtUnIrbCtiL25WeGY5Q0dSZUYr?=
 =?utf-8?B?dHRacXBsbTRTNmd6aXRUR3dncVk3YnA2Q2Y3cytCanVEZFhsT3FEUXlMcGZK?=
 =?utf-8?B?d3FwK2xudUk1RjVUVjRVSDJsMFMxTUdnUHBNQnBaSmd2SWFCcnpiSUZEc1du?=
 =?utf-8?B?RFIyMU9WZmtRYSs0US9iUm1aSXdBQ0hiS2g3U25SVklsQTU5dkIzTXhCbDgr?=
 =?utf-8?B?bE9SMTJnZzVNMFN5dXlpemxhTkkwWWFuUTJ4YXBCeWVKeHloaXIvNGdvU1pp?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 710871de-a51d-4b8f-4e29-08de2b6f193e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 15:35:29.7459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k72aMuHryFccU1lV+UH2/nlQVcDnNVGShDaABwhqi++paRhZC+WiUPX/KxysIs2s5hQOGvJPPPmDlYjsDcBiAE+bR7XpDSJkfcABPB7i3EQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10219

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI0IE5vdmVtYmVyIDIwMjUgMTI6NTgNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwMS8xM10gZHQtYmluZGluZ3M6IHNlcmlhbDogcmVuZXNhcyxyc2NpOiBEb2N1bWVu
dCBSWi9HM0Ugc3VwcG9ydA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFNhdCwgMjIgTm92IDIw
MjUgYXQgMTU6MTUsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6
DQo+ID4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4g
PiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IE9uIEZy
aSwgMTQgTm92DQo+ID4gPiA+IDIwMjUgYXQgMTE6NTIsIEJpanUgPGJpanUuZGFzLmF1QGdtYWls
LmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gQWRkIGRvY3VtZW50YXRpb24gZm9yIHRoZSBzZXJpYWwg
Y29tbXVuaWNhdGlvbiBpbnRlcmZhY2UgKFJTQ0kpDQo+ID4gPiA+ID4gZm91bmQgb24gdGhlIFJl
bmVzYXMgUlovRzNFIChSOUEwOUcwNDcpIFNvQy4gVGhlIFJTQ0kgSVAgb24gdGhpcw0KPiA+ID4g
PiA+IFNvQyBpcyBpZGVudGljYWwgdG8gdGhhdCBvbiB0aGUgUlovVDJIIChSOUEwOUcwNzcpIFNv
QywgYnV0IGl0DQo+ID4gPiA+ID4gaGFzIGEgMzItc3RhZ2UgRklGTyBjb21wYXJlZCB0byAxNiBv
biBSWi9UMkguIEl0IHN1cHBvcnRzIGJvdGgNCj4gPiA+ID4gPiBGSUZPIGFuZCBub24tRklGTyBt
b2RlIG9wZXJhdGlvbi4gUlovRzNFIGhhcyA2IGNsb2Nrcyg1IG1vZHVsZQ0KPiA+ID4gPiA+IGNs
b2NrcyArIDEgZXh0ZXJuYWwgY2xvY2spIGNvbXBhcmVkIHRvIDMgY2xvY2tzDQo+ID4gPiA+ID4g
KDIgbW9kdWxlIGNsb2NrcyArIDEgZXh0ZXJuYWwgY2xvY2spIG9uIFJaL1QySCwgYW5kIGl0IGhh
cyBtdWx0aXBsZSByZXNldHMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBBY2tlZC1ieTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+ID4gPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxy
c2NpLnlhbWwNCj4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc2VyaWFsL3JlbmVzYXMscnNjaS55YW1sDQo+ID4gPiA+ID4gQEAgLTEwLDE3ICsxMCwxNiBA
QCBtYWludGFpbmVyczoNCj4gPiA+ID4gPiAgICAtIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4gPiA+ID4gICAgLSBMYWQgUHJhYmhha2FyIDxwcmFiaGFr
YXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAt
YWxsT2Y6DQo+ID4gPiA+ID4gLSAgLSAkcmVmOiBzZXJpYWwueWFtbCMNCj4gPiA+ID4gPiAtDQo+
ID4gPiA+ID4gIHByb3BlcnRpZXM6DQo+ID4gPiA+ID4gICAgY29tcGF0aWJsZToNCj4gPiA+ID4g
PiAgICAgIG9uZU9mOg0KPiA+ID4gPiA+IC0gICAgICAtIGl0ZW1zOg0KPiA+ID4gPiA+IC0gICAg
ICAgICAgLSBjb25zdDogcmVuZXNhcyxyOWEwOWcwODctcnNjaSAjIFJaL04ySA0KPiA+ID4gPiA+
IC0gICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyOWEwOWcwNzctcnNjaSAjIFJaL1QySA0KPiA+
ID4gPiA+ICsgICAgICAtIGVudW06DQo+ID4gPiA+ID4gKyAgICAgICAgICAtIHJlbmVzYXMscjlh
MDlnMDQ3LXJzY2kgIyBSWi9HM0Ugbm9uIEZJRk8gbW9kZQ0KPiA+ID4gPiA+ICsgICAgICAgICAg
LSByZW5lc2FzLHI5YTA5ZzA0Ny1yc2NpZiAjIFJaL0czRSBGSUZPIG1vZGUNCj4gPiA+ID4NCj4g
PiA+ID4gSSBjYW4ndCBmaW5kIHRoZSBub24tRklGTyBwb3J0cyBpbiB0aGUgZG9jdW1lbnRhdGlv
bj8NCj4gPiA+ID4gRG8geW91IG1lYW4gIlNlbGVjdGFibGUgdG8gMS1zdGFnZSByZWdpc3RlciBv
ciAzMi1zdGFnZSBGSUZPIj8NCj4gPiA+ID4gSXNuJ3QgdGhhdCBzb2Z0d2FyZSBjb25maWd1cmF0
aW9uIGluc3RlYWQgb2YgaGFyZHdhcmUgZGVzY3JpcHRpb24/DQo+ID4gPg0KPiA+ID4gQmFzaWNh
bGx5LCBpdCBoYXMgMiBtb2Rlcy4gRklGTyBtb2RlKENDUjMuRk09MWIpIGFuZCBOb24tRklGTyBt
b2RlIChDQ1IzLkZNPTBiKS4NCj4gPiA+IERNQUMgY2FuIGJlIHVzZWQgb25seSBpbiBGSUZPIG1v
ZGUgYW5kIHRoZXJlIGFyZSBzb21lIGhhcmR3YXJlDQo+ID4gPiBkaWZmZXJlbmNlcyBiZXR3ZWVu
IHR3byBhcyBGSUZPIHJlZyBibG9jayBpcyBhcHBsaWNhYmxlIG9ubHkgZm9yIEZJRk8gbW9kZS4N
Cj4gDQo+IFN0aWxsLCBzb3VuZHMgbGlrZSBzb2Z0d2FyZSBwb2xpY3kgLyBjb25maWd1cmF0aW9u
IHRvIG1lLi4uDQoNCk9rLg0KDQo+IA0KPiA+ID4gSXQgaGFzIHRvIGJlIGVpdGhlciBhIGNvbXBh
dGlibGUgb3IgYSBib29sZWFuIHByb3BlcnR5ICJyZW5lc2FzLCByc2NpLW5vbi1maWZvIg0KPiA+
ID4gT3Igc29tZXRoaW5nIGVsc2UNCj4gPg0KPiA+IEkgYmVsaWV2ZSBpdCBtdXN0IGJlIGEgY29t
cGF0aWJsZSB0byBzdXBwb3J0IG5vbi1GSUZPIG1vZGUgZnJvbSBib290Lg0KPiA+DQo+ID4gSSBt
YXliZSB3cm9uZy4gUGxlYXNlIGNvcnJlY3QgbWUsIGlmIGl0IEkgYW0gd3JvbmcuDQo+IA0KPiBX
aHkgY2FuJ3QgaXQgYmUgY29uZmlndXJlZCB0aHJvdWdoIGUuZy4gdGhlIHJ4X2ZpZm9fdHJpZ2dl
ciBkZXZpY2UgYXR0cmlidXRlLCBvciBzb21lIHNldHNlcmlhbA0KPiBvcHRpb24/IEFueSBndWlk
YW5jZSBmcm9tIHRoZSBzZXJpYWwgZXhwZXJ0cz8NCg0KSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Np
b24gbGlrZSBlYXJseSBjb25zb2xlLCBzb21lb25lIG1heSB1c2Ugbm9uLUZJRk8gbW9kZSB2ZXJ5
IGVhcmx5IGR1cmluZyB0aGUNCmJvb3QuDQoNCk9LLCBXaWxsIGRyb3AgdGhlIGNvbXBhdGlibGUg
Zm9yIG5vbi1GSUZPIG1vZGUuDQoNCkNoZWVycywNCkJpanUNCg==

