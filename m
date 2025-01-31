Return-Path: <linux-renesas-soc+bounces-12781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F4066A23BEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 11:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D58873A99EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 10:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4B51A2550;
	Fri, 31 Jan 2025 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="krDhgf/B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F6E1AD3E1;
	Fri, 31 Jan 2025 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738318029; cv=fail; b=HITD8BoRR5kYZXGOGk4HfRi5y7mZLXK78IBdwEgEYArH8AUGtm3iUpJGXj4iZHvIqKnM/cs8Yxzl/H1EwUDOQ4dfcis+sEkUWwqooY3DYwaJe9PVLofHFpXk9mFUJWctFU6+f3urjboXRVHLYq0MGwzudzgM5Z3J6CvxGpvG4Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738318029; c=relaxed/simple;
	bh=ircp1suh4nsrAtv0hpVZC3+z5z9e1Lsz/Kdhcp/Dvlg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PH/knPogUyu2O06cwajCYqAOmWEHOwAbTH1Vx89GKY3rnm39WSYCjihZHwpTtyPAz+Tdxdy/q/srIVy6FUdqWDHpT7So9I49R1YvZfZmJwqQZqxw/EhpgwULMvxfSUv1A/UrO+zmeOsYHER3xgO0cCQob9Jf6yTL0foRyksMkFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=krDhgf/B; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fa4btIjCKSz0aAfOQmgR1TMPIWj2/g3DQEcs7vwS2t0Jwzx4WL0cC/TOjFmcGerMlMz3zNaxTQdxcP4YMvc2GSJZw2SOtyF95l3lV6+qEuUCB02SV/tEMUOV/tmhjOt/wC+tSzQI2a+CmTKwIA7CleunBpjwZpmnfvb62o0OdLgWAkc3dThpbez6k/9aRSVD/KxZFXgdN6zQNCNuIYrplZld1XOwMxxi3zZLNv9OFS0Mc9ubTvNRPsHE9mn2HB7Dl5AECRJqvDs/jKCerMUVk1OC21csJsI6DILuCEYbwvqzh9084U7xdtoeIs+2idAXe3M0suwzuApw0ZOz+u0uSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ircp1suh4nsrAtv0hpVZC3+z5z9e1Lsz/Kdhcp/Dvlg=;
 b=RckrPPr6kTKub9V3B/gjOaaSzU7FUhxJemzdOxwzejLLSDj21IueeiU/RmhNBg7mbZVimdizjrLCwAkJUDGYo2TASk542EUtUCAYPyEE3ykhG0OWoINsTbKjhtHcxCoutcz/XvXKYGrXqL2L68qAUOWsc0oCmdaGVpNuHeUzCytIj2qIRTro25qgjTZRslUxEqFa8cvMKtwzMelSMIostSna9J7eboEBkjIiFTyaXdEDlJxt1xaePQ1Icg92fJLPxAEEb72b/eOszD1FRa3vRDGk+LVmbqS7L8sA3ZQbOilGmIy5z5OGBWNYRxb6YjSjK8wBp2V5oGjBBh5GoMHEvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ircp1suh4nsrAtv0hpVZC3+z5z9e1Lsz/Kdhcp/Dvlg=;
 b=krDhgf/BJok5QHJU1iqJ4KXdLw6t4a0sQuDPyq5Hn0sjmVcKYL7bP+0GEXwoTqFRKbvtwc4+g8qsXXVyp53nywchrIBpOKuoXGjO4lj3Gw1s849jpt25iQUyfZgIk7RPqNmomhhRX9XcyzmOAyM9cgGChjuxIRi0z+AQCqRykLo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB6089.jpnprd01.prod.outlook.com (2603:1096:402:39::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 10:07:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.014; Fri, 31 Jan 2025
 10:07:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] of: base: Add of_get_available_child_by_name()
Thread-Topic: [PATCH] of: base: Add of_get_available_child_by_name()
Thread-Index: AQHbc8VDz9X9shYejEWWR+y0mURp17MwpFYAgAACkUA=
Date: Fri, 31 Jan 2025 10:07:02 +0000
Message-ID:
 <TY3PR01MB113461A22D3E82F6C987CAC1786E82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250131094812.118340-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWyEEPLTc7y+3PP2xWH8e0Ho-fxpO2=SgxW0O6+S0pAAQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWyEEPLTc7y+3PP2xWH8e0Ho-fxpO2=SgxW0O6+S0pAAQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB6089:EE_
x-ms-office365-filtering-correlation-id: f007565b-2894-4272-b2f1-08dd41df025c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y1BWTjFJMFhlOU9pRVN6UUVpYUdNdWF6L2xwZjd3eTFlN3Z5aU51Z0phbjVN?=
 =?utf-8?B?UGROQkRGREUzVmhvTzlWeGdwRml5V0RoZ09TSzJnajQvdlBNWi9RcXJMM0ph?=
 =?utf-8?B?WnJRdnBXY2ZwcFROYisyUDRHR3cyZmtFMEpLMmNmRWdSUzlpSzRFTWhuNUpW?=
 =?utf-8?B?RThZdm9MVFVaWTdiZWIvRkFIbUxGV0lLOFF5ZlVuZ0R3NWVaQWxVRThrTTAv?=
 =?utf-8?B?dGV3K3B4VlBuNDA1bkxNTHVvRFlqemRUWTNRTGNockh4ZURrR1hZYUFlbXhn?=
 =?utf-8?B?MWdrcUI5TGNqR2VuRFFCZi9zSWtMWVNXN2VjdFptV1hUcDZ1TkRRVnVocEJX?=
 =?utf-8?B?MHhRMlFNZEsvVjhqeHNRNWswZGRYd3oxNTExYW94TU5hdDZGS2YrSzYrTnlW?=
 =?utf-8?B?VHJTWnVHMFFpOVFCdVZuNXpERUVqRlpEL0YzaHZDZDI3SUJ0UUUrSmt1M3Rx?=
 =?utf-8?B?L0pWMmhERURLemt1RzlROFV1c3ErMVRFazh2cnplR0NnOUxKSmhwcmlRWTdv?=
 =?utf-8?B?SVdjR3I1NkliblV6Uk5GVUZBVWRNZUphd2VOM1p5RTQxN2tnS3RpVUQvRmov?=
 =?utf-8?B?aUsyNEc5MkRJLzcwaTlUbGxudDJCZWpBOXV0OVVBV1ZNVGk0QUdVSVB0UUho?=
 =?utf-8?B?NU1hKzVkNVc2MiticHhjQ2ZtblRiOG9HVVErTlU5N0Z4QVZQWStSd2dHK1BZ?=
 =?utf-8?B?VHNPR251MUY0UzVCb2ZrbndjbldaVnRBMUxHaFdHRHUxQ2FHV2NVSld6NWtl?=
 =?utf-8?B?clZqQ1dMM2VuMlRLR3NpNTNZKzNXeGl2cGd1UHhGNWI1ajhmRjNEL3JHUWg5?=
 =?utf-8?B?QjI0QWV2VksreTRNc0lTT1d4RngxSkpnSWRFMTFjcXpiQWRPVG5EeU1EL3hS?=
 =?utf-8?B?UHZOM0VhK3hDMGFzRlB3bkh0NnAzUEpQck1OdHZvelR3b0dGVTJMaG9nSmtp?=
 =?utf-8?B?cmNFTUhjbDRDMFYzN2IyVTlMcmo2Z0FQMFpPNlp3aFFqa2lkbkV1L3YyTFB6?=
 =?utf-8?B?RVV5dlJuaU44RC9ZblFta0hwNExYNTJYcDY2TEI5ZnpkUi9JT0FRbStWa3lo?=
 =?utf-8?B?eE5QSnppRlFBdzVUaFpMbDFuN2owRVJHVUdaSDhxSkU2OEdPS3Y4UjNOYnlm?=
 =?utf-8?B?MWhaRkhtTWJFRk1yUS9waFRqRGJvdjBGclBGcUNaeGtHekVxanIyWXJIT09s?=
 =?utf-8?B?SFpBZGxCQXl3cDluRVp2Q0FIY0ZwVVpOTXFkYVp6VHo4TUVsVWU3ak80MUJB?=
 =?utf-8?B?QkN3Nmk4ZEpYTEVvRHJVeFZYbUlDSzFPMFZyQXd0bkExOTF2bTlpWStWd2ZJ?=
 =?utf-8?B?T3pudEJWVEk1eWt3cXNVSFphbU5qdGc0Z1lSU3pRMUM3OGdTZDZDT0x3dDhh?=
 =?utf-8?B?Mll6b3RmQUxDRUQyaDlvSnRnNkRDRHh6bUs1YWR1ZjdSV2k3ZENHc1F4d1lL?=
 =?utf-8?B?UDRhb1lOdW9xKzM0WHFJcmtwMklzOGc0YXJ4cVptbDBYR0h0Skx3VDllamZm?=
 =?utf-8?B?TVArTW9COW16TTZUWG9kbnBRSkVWTkFLbjVTOEZWbm1hK2pxTFhoL1FRVFB3?=
 =?utf-8?B?c21vaktvaXpWbTl5QnVLMHVHS0c1VlYyV1pFalU0OHk2R0w3QkxBaCsreWdy?=
 =?utf-8?B?NkVoOFAza1pQRUh5cTNkQXRzN2wwUkdQUE1YZEpVZDNZcFpZM25jRldabE9D?=
 =?utf-8?B?eFY3VjFGdGZuaVE2L2k5b2lINWhFSWdoaG5Hd3NCRGFFNWlUNWEwL0ZUSkFI?=
 =?utf-8?B?bVZ5N3FYK09xY2JURlVsVktUbERySmRPZDVZYkM0Q3JUOWx4YWlrOTVoMGlt?=
 =?utf-8?B?dmlxcnhYakN6Nk9rS1pYWFp2cHRnT3o3NEVPN0kycXRoLzJ6c2V4amRtMEtP?=
 =?utf-8?B?alJjajNwZlY1NFhrOEdHL0graDVqc3NicmxnYjQ3dzJ4OTJUR3YyK28yWm9l?=
 =?utf-8?Q?3aUIEpfgcJFCihsrHkFxXQRuA+iKmw5M?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NnRLSHpOamJjTE5keTRFZ0dWVEpWZ0Q4MGYrUTZMY0puL0Uwdnp1akVsUk1R?=
 =?utf-8?B?VFRSdTltK0RTV0s5Qk1ydDVrZUVpQ0xmYmcxNzhic2ZUMGJ4VHU1Yyt6TW5v?=
 =?utf-8?B?enRVZjFoR2pmdTdqM2N3VDhWNmFLa05QdmI2ekVFanhpc3hJcTlPajBKeWxB?=
 =?utf-8?B?UHBtSXJYR1lHeGgwa2ZyQWlpREFXYkxlMmMwakFDTDZmNWRWSzJ2ZlRJSEtr?=
 =?utf-8?B?aWNUYjh5NUw0eWRwbGRFaHZTemh1cHlBMVVHZFYvM2xFcnFRSVpBdWdLQW9M?=
 =?utf-8?B?OGh1LzNBMXVwalJzZlUwb21IaFEvSGFqUkhsaFk0MnpEYU5DRldLUldlWTIy?=
 =?utf-8?B?KzF1cUQ5Ky96R1RvQ2QxOGZkZDhaZXRmZW8wSTFkaEpZSnNldWdlU0ZWYTVv?=
 =?utf-8?B?a0xZVWFEalBHdmhBYTArR3d5MWV1b2l5TmFaSHdKYWh4aTVCeHZmd1g0aXZN?=
 =?utf-8?B?YjBhUlFUVWh5UG4xMmllMW5ZbHFaN08wa0RVVVJQcCtEWmRoY0RMU0ErWE5a?=
 =?utf-8?B?N2kwUVFxd1ZWT2c0UlBDV0M5bmZveHRLTnFmelMwRDRIQWhYN0ZrTUxlMzM1?=
 =?utf-8?B?Y1hiSDI0S3Z2QzVWSkFFSjZ3ZkF1Mnl4U3NZNzVpRUxpTzZGeWFidnVrTXp2?=
 =?utf-8?B?SVQrdm9rQW9tMEMzczdoSkVwcEVpeFJtYkVTUXZlZEtpYUwvUTlNNlp0MlJG?=
 =?utf-8?B?Y1R2T29JY3UyQUVTSmQ5SDFUcENzclpVZTVFLzdNT2swTWhSanBJUVowYmVZ?=
 =?utf-8?B?Wkk2SUlyeG9BWEN6VEJjbU5Ub3krQlFGZlhtNzdGNTV1am9BRmtOMDVWcmJn?=
 =?utf-8?B?dFR0QXl3RlE4L1owNXJMZXh6aWsyeGd2UmRTeDE2OXZMSWViSmNmOFdGY1lX?=
 =?utf-8?B?S3M0TGc5OXhEdFhFUjhZVnBUYWVuWXVGUlp0NXl3d1BSeU8wZFlic0NOZUcz?=
 =?utf-8?B?YU5rYXpieVFsV0VOcjRQNGRaenUwWDF1S3ZIemJFRm11bnZSQ0lxMlVUOEtr?=
 =?utf-8?B?Z0d0Wk0rLzVlM24rZlYrbEk0L3BPM1lPTzlEYk9leXVuZFRCS2gwVklWL0tu?=
 =?utf-8?B?dXlTSWVaeTBNSkNjdlV6MHVYQjVGdTYvTG5BVG9XSWdmTE42Q0RGQ21wSi9v?=
 =?utf-8?B?Y0wvald0dExYcW1BODhZWld0K0lYK254SWUxNmdZRlJsaW9zTXppVUMxd1VY?=
 =?utf-8?B?NmFaUHBiT1JDM3lPTGlYK1JSWFI0TWRud3VRc1NyTHRXcW5VMm11N2I0Rm9I?=
 =?utf-8?B?M0M0M2pCVHo1VWRWUGEzUEZTb3VJQTdhZXZlTlhzNXRJckMxS1o0RFJZeGw1?=
 =?utf-8?B?QUR4bGVESlV5Q0F4UFB0cC9PeHlpd0tTWmVXandJSFFnZ3ladjVjZWt2MVBx?=
 =?utf-8?B?Zkk2TDhxbjd5aHhoL2lyNlZIV2ZGdTJyWWEyZXh1UktkbFpnVkpreG1FemFK?=
 =?utf-8?B?R2wybHhtWEk3a0k3bUJLeThLNDhnbERSUzdUeHpoVk40dlBvMXVCYmRVbEQw?=
 =?utf-8?B?b0xlT3FwNGF5eW9sRjk3dXdtWkZsSDRKOUkxTk5UZUMydXh4UFRSKyt3eFBs?=
 =?utf-8?B?Vk5scGViaU9oQVNLaDB2VFBhK2xoYXR0VGQ1cnovR2hGNk9VQ2NQSkJwMmFK?=
 =?utf-8?B?WVJHd0ZWUjNqeDU3L1dHeTE2NkhOMzJJZmFwTEpCOFhFYy91WUIxd3hqcHJE?=
 =?utf-8?B?cEJROUVzeit1QWpieXRscllTNTVEclBmMFBCYTJ6b25QSjIzQUluOWlPeFJj?=
 =?utf-8?B?WVJCczVHajlLckFpQkN3STRqMmM5SXQ3WlRrSzRXV3RveWxVUDNNQW9ZSXcz?=
 =?utf-8?B?T3A2WnNrS0VjM20zK1U0UGo3Rk9pZmRla0hhN3BtQUlpclduYlFXTjAvZFd3?=
 =?utf-8?B?Z2xzNmVNNjdVMXErb2hPVVZwOWdyU3FFUmp2bDJySmlhM1pyR1JzZG1qSHpQ?=
 =?utf-8?B?cUpZY3B3LzFTU1NKY3lMK3BuWEp0N1NTZ2RpTExEQlZVWitYL0g2RVhRbXJ4?=
 =?utf-8?B?N1pMdEp1TFIwai8xM2JFa0lRaFl4WDZzalEzVFRpWS9GdGRJdTNJaFg4a2Jl?=
 =?utf-8?B?Y2FhYy9jcFExRUJBU0g5NUd2ZGhtbzRBVFdaQ1ZzSVBVd2p2L3laYUJxUnNR?=
 =?utf-8?B?eWE2aEdka1NoV214SHdKOG4yVy9Gd2xSK3VLRHBuVVRWWTU3c2VkbHJvTC9S?=
 =?utf-8?B?Z1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f007565b-2894-4272-b2f1-08dd41df025c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 10:07:02.9255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4JRBvNv7dIw9jUW5oPj2sh0blYPsXeKCfmUgF7ZDDvaaKS3hiEOLQKkztS/xrPKEZttIgMdNQLLtkIsvh6lXjMEzet8wszgeBWrkDfe00h4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6089

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDMxIEphbnVhcnkgMjAyNSAwOTo1Mw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIXSBvZjogYmFzZTogQWRkIG9mX2dldF9hdmFpbGFibGVfY2hpbGRfYnlfbmFtZSgpDQo+IA0K
PiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCAzMSBKYW4gMjAyNSBhdCAxMDo0OCwgQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBUaGVyZSBhcmUgbG90IG9m
IGRyaXZlcnMgdXNpbmcgb2ZfZ2V0X2NoaWxkX2J5X25hbWUoKSBmb2xsb3dlZCBieQ0KPiA+IG9m
X2RldmljZV9pc19hdmFpbGFibGUoKSB0byBjaGVjayB0aGUgY2hpbGQgbm9kZSBhdmFpbGFiaWx0
eSBieSBuYW1lDQo+ID4gZm9yIGEgZ2l2ZW4gcGFyZW50LiBQcm92aWRlIGEgaGVscGVyIGZvciB0
aGVzZSB1c2VycyB0byBzaW1wbGlmeSB0aGUNCj4gPiBjb2RlLg0KPiA+DQo+ID4gU3VnZ2VzdGVk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+
IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9vZi9iYXNlLmMN
Cj4gPiArKysgYi9kcml2ZXJzL29mL2Jhc2UuYw0KPiA+IEBAIC04MjQsNiArODI0LDM0IEBAIHN0
cnVjdCBkZXZpY2Vfbm9kZSAqb2ZfZ2V0X2NoaWxkX2J5X25hbWUoY29uc3QNCj4gPiBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5vZGUsICB9ICBFWFBPUlRfU1lNQk9MKG9mX2dldF9jaGlsZF9ieV9uYW1l
KTsNCj4gPg0KPiA+ICsvKioNCj4gPiArICogb2ZfZ2V0X2F2YWlsYWJsZV9jaGlsZF9ieV9uYW1l
IC0gRmluZCB0aGUgY2hpbGQgbm9kZSBhdmFpbGFiaWx0eQ0KPiA+ICtieSBuYW1lIGZvciBhIGdp
dmVuIHBhcmVudA0KPiANCj4gYXZhaWxhYmxlIGNoaWxkIG5vZGU/DQoNCk9LLCBGaW5kIHRoZSBh
dmFpbGFibGUgY2hpbGQgbm9kZSBieSBuYW1lIGZvciBhIGdpdmVuIHBhcmVudC4NCg0KPiANCj4g
PiArICogQG5vZGU6ICAgICAgcGFyZW50IG5vZGUNCj4gPiArICogQG5hbWU6ICAgICAgY2hpbGQg
bmFtZSB0byBsb29rIGZvci4NCj4gPiArICoNCj4gPiArICogVGhpcyBmdW5jdGlvbiBsb29rcyBm
b3IgY2hpbGQgbm9kZSBmb3IgZ2l2ZW4gbWF0Y2hpbmcgbmFtZSBhbmQNCj4gPiArIGNoZWNrIHRo
ZQ0KPiANCj4gY2hlY2tzDQoNCk9LDQoNCj4gDQo+ID4gKyAqIGRldmljZSBhdmFpbGFiaWxpdHkg
Zm9yIHVzZS4NCj4gDQo+IGRldmljZSdzDQoNCk9LLg0KDQo+IA0KPiA+ICsgKg0KPiA+ICsgKiBS
ZXR1cm46IEEgbm9kZSBwb2ludGVyIGlmIGZvdW5kLCB3aXRoIHJlZmNvdW50IGluY3JlbWVudGVk
LCB1c2UNCj4gPiArICogb2Zfbm9kZV9wdXQoKSBvbiBpdCB3aGVuIGRvbmUuDQo+ID4gKyAqIFJl
dHVybnMgTlVMTCBpZiBub2RlIGlzIG5vdCBmb3VuZC4NCj4gPiArICovDQo+ID4gK3N0cnVjdCBk
ZXZpY2Vfbm9kZSAqb2ZfZ2V0X2F2YWlsYWJsZV9jaGlsZF9ieV9uYW1lKGNvbnN0IHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpuYW1lKSB7DQo+ID4gKyAgICAgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKmNoaWxkOw0KPiA+ICsNCj4gPiArICAgICAgIGZvcl9lYWNoX2NoaWxkX29m
X25vZGUobm9kZSwgY2hpbGQpDQo+ID4gKyAgICAgICAgICAgICAgIGlmIChvZl9ub2RlX25hbWVf
ZXEoY2hpbGQsIG5hbWUpKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAN
Cg0KPiBjaGlsZCA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKG5vZGUsIG5hbWUpOw0KDQpPSywgV2ls
bCB1c2UgdGhlIGFib3ZlIEFQSSB0byBhdm9pZCBkdXBsaWNhdGlvbi4NCg0KPiANCj4gPiArDQo+
ID4gKyAgICAgICBpZiAoY2hpbGQgJiYgIW9mX2RldmljZV9pc19hdmFpbGFibGUoY2hpbGQpKQ0K
PiA+ICsgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChjaGlsZCk7DQo+IA0KPiBNaXNzaW5nIHJl
dHVybiBOVUxMLg0KDQpPSy4gV2lsbCBmaXggdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNCkNoZWVy
cywNCkJpanUNCg==

