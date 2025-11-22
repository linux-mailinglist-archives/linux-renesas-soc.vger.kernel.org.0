Return-Path: <linux-renesas-soc+bounces-25031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE1C7D40F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 17:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3FBF24E1D0B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 16:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54211277CB0;
	Sat, 22 Nov 2025 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wrijjiAg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ABE1F5EA;
	Sat, 22 Nov 2025 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763830219; cv=fail; b=sCB+QPDgObSlEYi8Xjt/tDXJ1YBUYtT1l/jOyqv0l+4SFl84OXSgBeZiWRXJeMfx93gV1lHgGhszB0Z6PXoFH7VYOSLyWfBIUWMXwQ250fNDGFXK3hbyn0T3xySBYbguxEFsFepZW258ZB6ydCj0cKOysmO3tMAPaitZ0t2XcZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763830219; c=relaxed/simple;
	bh=Y94QZauY6My3N/hs4UatQfm0eUjsUzfl49scILbXplM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N3r5LX7BFpG4sLbVZcySztBffjk2mxHeOaTlroIUx+8XhYi+Jo54OpQ/HDpvrPWQ06cJ32/jD0xCKyDTIU6cj8DkQ2yYqhNOeZHjyR6ahY+GHegzPFpAIFcK3vgw/zKnmCBtGt5kNiXbed/SGHCqUvRSPsh08iiIeqPAjQFfSTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wrijjiAg; arc=fail smtp.client-ip=40.107.74.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaAuUUBYMR1pdt3sqBZCixfru3COZxcXjgcLsO7q4KomyOmSSEJf3eFxE1K9v4r4Y40Ov0jIVRfG6pNJZaC2KIoRpuufUBe+t8naZt9vITJzj7CgW7UyfmTa2Zod2caeMwvF2qZRdxphkhPzECl4xSN9LptfENnGeRumZkULTQqnS31s2G0018sMSbM9riJdqkUgxWNNq/d/IiUO0FNl6Ch6uIXJ1u6AUTuYFFhySjkVQc3ZrTD2IdORm/oWiVvbhdWWTyy4Ww5ruI6IdHU+YkWlPYeDtqiJZbTAuZOs+AEH8MPnAxGqhGSLdrhgvDZPjhhe9ndZdBowx/S14FG4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y94QZauY6My3N/hs4UatQfm0eUjsUzfl49scILbXplM=;
 b=DUU7m5RJIne/LuH0o6HuSzdvpVeH0e/dkmEYp179qwivhVMaxEbWtJtBCEf037OJqFcNFPb4aSyjC7z1qJS/pjfuz/ceoYfzNyd53DSY2Iz+RugTK3R4nkvT7sPwaTTmK1kPvPhtLONLA/BIFI+0O5daZMvXAxsPx6Ijj6qBW2rRuQnJhmSYh42pqxLgX3Klrh6UbcCfVk+Qa3a/2jE5ZyyKyAeU2A0+qS1AJ9JOxlsOUqNIdOAoxp4HcSU0aB3ebcjrCoWwUZdknqyMGVEQUkVtoJsaMrjXCBvY6sCsw9QAbLcYjsUtzuMw0WY5SJsN8+nDvw8e/F0J6Eft/A9OAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y94QZauY6My3N/hs4UatQfm0eUjsUzfl49scILbXplM=;
 b=wrijjiAgMtqVvPwbDv/Z9BbOPl76X+7KSewTDZ2cSaqsQC2ov416oESrnIyxsmzaCjZWpGQWaL3gbsSiDy7nsIB6nqsL0kIGkKCExTK41Ph5e4WXMOLnLDuf8odMAmvBc7kjfJfDaEhohYTsThl3JAlGwfXJDayXGj4lqiu5Hlo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12620.jpnprd01.prod.outlook.com (2603:1096:405:15d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.6; Sat, 22 Nov
 2025 16:50:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9366.005; Sat, 22 Nov 2025
 16:50:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 09/13] serial: sh-sci: Add support for RZ/G3E RSCI clks
Thread-Topic: [PATCH v3 09/13] serial: sh-sci: Add support for RZ/G3E RSCI
 clks
Thread-Index: AQHcVVS9I70+63ZV2U2o3kt4pbthWbT9YCAAgAGU99A=
Date: Sat, 22 Nov 2025 16:50:09 +0000
Message-ID:
 <TY3PR01MB11346B7E2793EE439BD5821C786D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-10-biju.das.jz@bp.renesas.com>
 <CAMuHMdU_fUhM2-gxhYN3jpzj8F5FOHFYjYT+ahrVs=bsLVBZGw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU_fUhM2-gxhYN3jpzj8F5FOHFYjYT+ahrVs=bsLVBZGw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12620:EE_
x-ms-office365-filtering-correlation-id: 40eefc98-800c-453f-9b21-08de29e73271
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UXVCYXliZGVnQ3ZsSlRFeDYwRUFvRTZFdDZpM294bUp1SElrWmo1MlhNVHdC?=
 =?utf-8?B?MXVmb3FXZjYwV1pIajg0dndRYytNaEt5TndhYXlPR0dSai9yb0tvS2xmb3ND?=
 =?utf-8?B?NEtrRGF5eGl6T1ZTM2JJT1FQQTEyUUg4SXJuZmpHVVo0UlZ2RDl1SDdhSkND?=
 =?utf-8?B?Vk9ZN1pUakhDY0NwbzBSbElrQ3ZpYS8yTUhFbjZTWGRXTW9DMWtlVjhVVTR5?=
 =?utf-8?B?ZUFkMUx4M0lINzVHd1MxWlIvQnBBaHFmTVVxaHMyM3d4QVlHNjdaM1hYaDBZ?=
 =?utf-8?B?ZGx1TFo5aVBmTkFhUmp3eGwvOVIyc2NnQjF6SUF1MzZOK2tlSEtqV0grdlNL?=
 =?utf-8?B?ZENBM2s1VWxnbnhWczBVaFNPcmEyMlkxQjg2ajVGbTFBaXBuTkdtM0ZGZGFj?=
 =?utf-8?B?bGp4RmJkNlZZN01qSWh6Nm9ZcHlkTVlMVkkyTlcvVUtWYjVMZlVLMDdjSCt1?=
 =?utf-8?B?TmpnK2FVOVFYRXhGMUVkd3FZWE9PQVdCNjdxaHp1dTR4MnFiOFIrVXh6ZFpn?=
 =?utf-8?B?ZFRFL0ZaOUhwaWVoeitEKzhYWHFuSCs1ZERYRUpDU3Rqc3dkdGt3VFNXTDVB?=
 =?utf-8?B?RXprZFdXZzFTaS9VL0VVVXBPWEJmSzJEeUpJN2o1cXNpdnE3bkVFT2s5cW96?=
 =?utf-8?B?UFA2c0l1b29IWSt0RktndjFEK1pPVFpFOXlocUF3UmpoemVIdjhlR00yMEt5?=
 =?utf-8?B?cE9GcDdIcDhhOXJ2c1NOc0JvSWFPd0pjaDUzcCtMNGR0aTdlUnpodFF4QTVC?=
 =?utf-8?B?TTE2TjU2M2lFWTVqWXl5OEp3TEcweGRqWFlqcGZPeWVsRHlKZkgyVi8yb3ZD?=
 =?utf-8?B?RXRFaW8rb09wcTlkK3VzYlZUMTlrZEJ1RmRuaGNPbWR0QVgxdnJ4eEdoTzZz?=
 =?utf-8?B?ZXlIbUt3VDhzRUhORWlyVll4K09oWTBHZTF1Vy9HdXZQM3YzVWxVNXFtZ09O?=
 =?utf-8?B?dFZodHdabTUwR05Ra0FpcTV4WHRCblhQWXYxZTk5c041TjRORElrcGE2UzNu?=
 =?utf-8?B?VUU4ZmxMaVZhZnVIQy9rbVR1YWdjMVYyTlF4K2JiQlZsaFVxblNXYUJ3QUh2?=
 =?utf-8?B?eUZBc1ZjeDFDUDlOSkk1L2t4T3VXT2FCT2pFbXIrV211bUJEK1FzdmZzV1JO?=
 =?utf-8?B?alRpcTlWWGRSZjlSeUl1cnlwYlhNcDFtaUdLMmpZeXQ0MmxzWTRqb0ZQZnBO?=
 =?utf-8?B?Q2VlUjhNWS9GejBETGszU0RPQld0YmcycFZxd1g2a3o0dEZoTDhrVTN5cVU3?=
 =?utf-8?B?NXFCU1Fza1FPeTVCelMvOGcvcDdkMS84UTNSSEU2TWlnTmlnV0p3Wmo4c05m?=
 =?utf-8?B?cmp5cmw2Qm5xb1NrdnNSaWliaG1KS082WnA2c3N0bVU5QjBMUHlOaXpoVkY2?=
 =?utf-8?B?WjJEOTVUK1J0MDZwN3pBRUdlSW5GM2FRUWxUTm42OWFsOHJQZ3NyZ1hPeXdN?=
 =?utf-8?B?YjA1RHBhOWIvNXVNdUNYYkJqZnFMWWt6ZmxEV213dEhRV241cGlZSHZaRnov?=
 =?utf-8?B?K09jbW96cG5JdG4vREd1QnVGMVJJdU1mb2prYTBzRy96TU5sbE5GUkhJazBy?=
 =?utf-8?B?Q0k5QVFEMGh5TmpzVHIrdGlHU3RaQ2pqdFF4TURLZHZkT2Y0MC9PTzQ1V0RT?=
 =?utf-8?B?RmN1TFBQUEFRdHA3Y3J0S0FGRWN5NmNEWkRIN1k5RkZmeDBpMnFYY2ZoSThp?=
 =?utf-8?B?TmJaT2J0SFNOSkhFaFJtM0RISFVtaVpvUWRnNHdFZEJvZ0hmTVpyUmNsZFIr?=
 =?utf-8?B?MzNFdnJMS0ovYWE5TVZJa1d6U3FEaDVVbnZDdk5HdFQxOENKMjFQMyswbUFx?=
 =?utf-8?B?eWFLYlBTVzl1ZEpudTNxcjhHK2pVYnF3R2NwRDlFOTV2R2tpa2IrRXdvOHZP?=
 =?utf-8?B?cnpzSUdJMFhKZjMwMW9ETUNoVkdDUkloUTY3ZHkwbUFBckdlT01sREdnK0p3?=
 =?utf-8?B?QVJ4bWk2bDlMb0lPTzY0em9JTkZRWGZHU0JYUEFVUHZ4eXFJRlhBdWwvdTVw?=
 =?utf-8?B?UDNwcDhMQ2dwS0lBRXBPUmVKYzJQMjgzYmhadzAzRmFNeU5IQkRleDcyeEFi?=
 =?utf-8?Q?28qWlH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eHNUbkxFb3B1dy8vZ2tMbDNqOWlvZnp0dVZOR08yelExTXQyUk0xYXVSbTVT?=
 =?utf-8?B?R1hkM1lsUGJOcmNMTVFaYXM2REVDaXA2Q1h3TjcvU21PMXV4c2ZjWWlwaEtl?=
 =?utf-8?B?Yk5PVmJnNlN6YU9RME1iN1pWSVNvVGtnckY4bkhPalZyZmgxeHRBL3FkV29k?=
 =?utf-8?B?RjZQY3VLZ1paZDhON1ZjSjhRSWlMVENmVFFlVXQxWGVtUkI1MmFJVlBQdG0z?=
 =?utf-8?B?QzVacXo4eVdoeG9wUW9tREdBdFZUVXBaNmVZMTZvdHNVQ3NFQUtZNUY4NlNz?=
 =?utf-8?B?VkRkMlY0RHR1N3FOS0dxUWdzdWw5eGdmVm5HN0VCMEdDU0VpNEdSMFRWbUlk?=
 =?utf-8?B?aE1GT3NyNUFxZFRjZFZ1TEltTFNRT3l0OERiTlhWRGg1QnpLSkVOUU1GUGd6?=
 =?utf-8?B?SnVsbXl4aWRXQW5mTmxvVTVBc0pHMTk0T1VOYjRMYzVlcG1mdnQ1YXJzclow?=
 =?utf-8?B?M0RIOUhwRWh2N0Fla3JnVWRQdXR2N29LYkpNWkk5L2pvZzZ5NklxV1hWMEpZ?=
 =?utf-8?B?QmE4SnFrcU1mQStLMjRBd0N1UkRIZG1INlQvRG5UTVFwRW5iWm40T2FQaCs5?=
 =?utf-8?B?clZBR2x1NFlPRmErdGozejUrdUFRaTdzN1h0akdwbEFGMS9KVlNCU1o5OTBN?=
 =?utf-8?B?R0x1Nzh6MitBQTVMaDN1VldkU2J1aEdNNW1PY2NhMExmQnNIdVg4Z3ZtMkw1?=
 =?utf-8?B?cHBkTkNVYXBBU21lVG4rSGhJVHdqQTQvT2xFYzZnNzIyR3hMcitkM2N1RlJH?=
 =?utf-8?B?VjVkbFNOZTdkblBUUVlWVUJ2dU1kc2RPV2s2MCtibmgzOW14NjBYUHJObm1m?=
 =?utf-8?B?RndqUEMxOUdVL3dLNDhwcktPMDd0a1Axd0RQSU11VWlpSHNqdTl1dXN4cVNv?=
 =?utf-8?B?K2tFSUNTRDVKZkNRNnpVc3dTbC9MaUpvQWZma1dKeUduR21VWGxnMHFTNnYz?=
 =?utf-8?B?OWhXdmRFakNqb0Y4bXR0Njh5Umppc1R5eitkLzRCbnNnWCtaN1ZnSDBXZnVi?=
 =?utf-8?B?RG04K094RmxFNUVyQndQbDNZZkMwOFYzbUJKUzJPUSt6MHBRS2prV2pYOTFm?=
 =?utf-8?B?NzYybEZqQzdwVllBMWlUbFZpanJBOGxlMkpybjNWRUV2algzMzRvWVVGV2JE?=
 =?utf-8?B?U29lZ0ZrS2kzM0hzcExQakRyUEhic2NrcnlCV0RLdll5U3h6TmV3R04rekZh?=
 =?utf-8?B?T1loRXVIK3lLMGVoZzdPNDEvRVgrdHc1TFVQVmR0c2VwdVFkbi9CSDlacmZ1?=
 =?utf-8?B?R3BEWkhzS1hqdTFCL1JDNW9Ycjk4SWlPUnUyL1FFRDg0N0NkZG9iM1hvelJU?=
 =?utf-8?B?RVllOGQ4dkIvcjVEYjl3a0k5Wk5DeDBZbjIzZ1FPbEJiTWt0RjVGelY3dnVB?=
 =?utf-8?B?TTEzRUJqL1lmTFdJcVBuNkZVTEJvWlIyemhsNFkwc1VqZXF3bVRlUHpISjZh?=
 =?utf-8?B?LzJIYzZ5Smc2b3g5RU1rUnlQeUZpVXhGaUR6ZkVPMGdBUE43enBBcnB2UnlQ?=
 =?utf-8?B?bUpBNnlMRGpSbmZCeVhCbTlIb0poVU5HY1A1cU1Wb25KUVY1dzNjd1UwWTVy?=
 =?utf-8?B?eGVVNHYrS1hsWHR2a050U1VibHlQZ3ZKL3llVUVlUnlSL01VdnlicVpLcUgx?=
 =?utf-8?B?WDBZSGl2TjFkSllQQUtnRXByc0VCTmpNeE1FMEFiWXBRWWZyZE9GRm1rOXFx?=
 =?utf-8?B?b0lnejJwTEFkSHBsbTBiZ3lvRlkxRHdNVXZYT0svaVUvK0dIdm0zdUlBUUpx?=
 =?utf-8?B?K0ttaXluU1U1bGRzY284ZFRDN2ZvRkpmcW4vV2N1VzUwb21EdEFPZmJjY0ov?=
 =?utf-8?B?YTJNbGhyUTRGMjlOK3RGR0tWY1Rncm96cXpwTXcyeE1XaS9XOSt3Ky91RFY4?=
 =?utf-8?B?MUNlRW9uL0xGTW9YNHZCUkl5NWMvN1ZOUDRSWHBGZk1ibEVzVDloMlZRZSt0?=
 =?utf-8?B?MHJzWERKaHd6Vk4yUHRYcy9FWlVLeityb0NLZjd2OTFKaEdMQmpKWlpNSGlS?=
 =?utf-8?B?NzMzRnAvakJNTGN0ejFtSDAzbGNIem43dFFldnlpNVZ3N2MrQS9vOG1hTTZ5?=
 =?utf-8?B?blJxeTRWbFJhenE2SFJaU283UDY2ZUJiZXFxSDZPUlR2cFRJUW91NVBQcnJU?=
 =?utf-8?B?YlMwRUJVeWxlNXBjSzZoYTdEc1NjKzFZb3BJa25iS2p1L2NpMjdjUjJLZHNy?=
 =?utf-8?B?K0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 40eefc98-800c-453f-9b21-08de29e73271
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 16:50:09.3349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kSQm2ppZt/xZE8IKq2jydBdvW232SQjVM7UbEC8EunbGKGThd18+5a9qGEP1U3rHY3ZSUA0J2yKOVOg/nuUQKEjmOv12aWcULL3CgNeTaAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12620

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIxIE5vdmVtYmVyIDIwMjUgMTY6MzkNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwOS8xM10gc2VyaWFsOiBzaC1zY2k6IEFkZCBzdXBwb3J0IGZvciBSWi9HM0UgUlND
SSBjbGtzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCAxNCBOb3YgMjAyNSBhdCAxMTo1
MiwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBSWi9HM0UgUlNDSSBoYXMg
NiBjbG9ja3MgKDUgbW9kdWxlIGNsb2NrcyArIDEgZXh0ZXJuYWwgY2xvY2spLiBBZGQNCj4gPiBz
dXBwb3J0IGZvciB0aGUgbW9kdWxlIGNsb2Nrcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91
ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS1jb21tb24u
aA0KPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2ktY29tbW9uLmgNCj4gPiBAQCAt
MTcsNiArMTcsOSBAQCBlbnVtIFNDSV9DTEtTIHsNCj4gPiAgICAgICAgIFNDSV9TQ0ssICAgICAg
ICAgICAgICAgIC8qIE9wdGlvbmFsIEV4dGVybmFsIENsb2NrICovDQo+ID4gICAgICAgICBTQ0lf
QlJHX0lOVCwgICAgICAgICAgICAvKiBPcHRpb25hbCBCUkcgSW50ZXJuYWwgQ2xvY2sgU291cmNl
ICovDQo+ID4gICAgICAgICBTQ0lfU0NJRl9DTEssICAgICAgICAgICAvKiBPcHRpb25hbCBCUkcg
RXh0ZXJuYWwgQ2xvY2sgU291cmNlICovDQo+ID4gKyAgICAgICBTQ0lfRkNLX0RJVjY0LCAgICAg
ICAgICAvKiBPcHRpb25hbCBGdW5jdGlvbmFsIENsb2NrIGZyZXF1ZW5jeS1kaXZpZGVkIGJ5IDY0
ICovDQo+ID4gKyAgICAgICBTQ0lfRkNLX0RJVjE2LCAgICAgICAgICAvKiBPcHRpb25hbCBGdW5j
dGlvbmFsIENsb2NrIGZyZXF1ZW5jeS1kaXZpZGVkIGJ5IDE2ICovDQo+ID4gKyAgICAgICBTQ0lf
RkNLX0RJVjQsICAgICAgICAgICAvKiBPcHRpb25hbCBGdW5jdGlvbmFsIENsb2NrIGZyZXF1ZW5j
eS1kaXZpZGVkIGJ5IDQgKi8NCj4gDQo+IFBlcmhhcHMgcmV2ZXJzZSB0aGUgb3JkZXI/DQoNCk9L
Lg0KDQo+IA0KPiA+ICAgICAgICAgU0NJX05VTV9DTEtTDQo+ID4gIH07DQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jIGIvZHJpdmVycy90dHkvc2VyaWFs
L3NoLXNjaS5jDQo+ID4gaW5kZXggMmRhMzZlOGNlNTU1Li4zYjAzZDNkM2YyYzcgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jDQo+ID4gKysrIGIvZHJpdmVycy90
dHkvc2VyaWFsL3NoLXNjaS5jDQo+ID4gQEAgLTMxNzIsNiArMzE3Miw5IEBAIHN0YXRpYyBpbnQg
c2NpX2luaXRfY2xvY2tzKHN0cnVjdCBzY2lfcG9ydCAqc2NpX3BvcnQsIHN0cnVjdCBkZXZpY2Ug
KmRldikNCj4gPiAgICAgICAgICAgICAgICAgW1NDSV9TQ0tdID0gInNjayIsDQo+ID4gICAgICAg
ICAgICAgICAgIFtTQ0lfQlJHX0lOVF0gPSAiYnJnX2ludCIsDQo+ID4gICAgICAgICAgICAgICAg
IFtTQ0lfU0NJRl9DTEtdID0gInNjaWZfY2xrIiwNCj4gPiArICAgICAgICAgICAgICAgW1NDSV9G
Q0tfRElWNjRdID0gInRjbGtfZGl2NjQiLA0KPiA+ICsgICAgICAgICAgICAgICBbU0NJX0ZDS19E
SVYxNl0gPSAidGNsa19kaXYxNiIsDQo+ID4gKyAgICAgICAgICAgICAgIFtTQ0lfRkNLX0RJVjRd
ID0gInRjbGtfZGl2NCIsDQo+IA0KPiBMaWtld2lzZQ0KT0suDQo+IA0KPiA+ICAgICAgICAgfTsN
Cj4gPiAgICAgICAgIHN0cnVjdCBjbGsgKmNsazsNCj4gPiAgICAgICAgIHVuc2lnbmVkIGludCBp
Ow0KPiA+IEBAIC0zMTgxLDYgKzMxODQsOSBAQCBzdGF0aWMgaW50IHNjaV9pbml0X2Nsb2Nrcyhz
dHJ1Y3Qgc2NpX3BvcnQgKnNjaV9wb3J0LCBzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gICAgICAg
ICB9IGVsc2UgaWYgKHNjaV9wb3J0LT50eXBlID09IFNDSV9QT1JUX1JTQ0kpIHsNCj4gPiAgICAg
ICAgICAgICAgICAgY2xrX25hbWVzW1NDSV9GQ0tdID0gIm9wZXJhdGlvbiI7DQo+ID4gICAgICAg
ICAgICAgICAgIGNsa19uYW1lc1tTQ0lfQlJHX0lOVF0gPSAiYnVzIjsNCj4gPiArICAgICAgIH0g
ZWxzZSBpZiAoc2NpX3BvcnQtPnR5cGUgPT0gUlNDSV9QT1JUX1NDSSB8fCBzY2lfcG9ydC0+dHlw
ZSA9PSBSU0NJX1BPUlRfU0NJRikgew0KPiA+ICsgICAgICAgICAgICAgICBjbGtfbmFtZXNbU0NJ
X0ZDS10gPSAidGNsayI7DQo+ID4gKyAgICAgICAgICAgICAgIGNsa19uYW1lc1tTQ0lfQlJHX0lO
VF0gPSAiYnVzIjsNCj4gDQo+IHBjbGs/DQpPSy4NCg0KPiANCj4gPiAgICAgICAgIH0NCj4gPg0K
PiA+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IFNDSV9OVU1fQ0xLUzsgaSsrKSB7IEBAIC0zMTk0
LDYgKzMyMDAsMTIgQEANCj4gPiBzdGF0aWMgaW50IHNjaV9pbml0X2Nsb2NrcyhzdHJ1Y3Qgc2Np
X3BvcnQgKnNjaV9wb3J0LCBzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gICAgICAgICAgICAgICAg
ICAgICAoaSA9PSBTQ0lfRkNLIHx8IGkgPT0gU0NJX0JSR19JTlQpKQ0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVOT0RFViwgImZhaWxlZCB0
bw0KPiA+IGdldCAlc1xuIiwgbmFtZSk7DQo+ID4NCj4gPiArICAgICAgICAgICAgICAgaWYgKCFj
bGsgJiYgKHNjaV9wb3J0LT50eXBlID09IFJTQ0lfUE9SVF9TQ0kgfHwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNjaV9wb3J0LT50eXBlID09IFJTQ0lfUE9SVF9TQ0lGKSAmJg0K
PiA+ICsgICAgICAgICAgICAgICAgICAgKGkgPT0gU0NJX0ZDSyB8fCBpID09IFNDSV9CUkdfSU5U
IHx8IGkgPT0gU0NJX0ZDS19ESVY2NCB8fA0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGkgPT0g
U0NJX0ZDS19ESVYxNiB8fCBpID09IFNDSV9GQ0tfRElWNCkpDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRU5PREVWLCAiZmFpbGVkIHRvDQo+
ID4gKyBnZXQgJXNcbiIsIG5hbWUpOw0KPiA+ICsNCj4gPiAgICAgICAgICAgICAgICAgaWYgKCFj
bGsgJiYgaSA9PSBTQ0lfRkNLKSB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgLyoNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgKiBOb3QgYWxsIFNIIHBsYXRmb3JtcyBkZWNsYXJl
IGEgY2xvY2sgbG9va3VwDQo+ID4gZW50cnkNCj4gDQo+IFRoaXMgZnVuY3Rpb24gaXMgYmVjb21p
bmcgYSBiaXQgY3VtYmVyc29tZS4NCj4gQ2FuIGl0IGJlIHNpbXBsaWZpZWQ/DQo+IENhbiB3ZSBh
dm9pZCBsb29raW5nIHVwIGNsb2NrcyB0aGF0IGFyZSBub3QgcmVsZXZhbnQgZm9yIHRoZSBwb3J0
Pw0KDQpPSyB3aWxsIGZpeCB0aGlzIGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0K

