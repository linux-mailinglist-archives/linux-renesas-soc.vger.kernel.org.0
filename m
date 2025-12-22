Return-Path: <linux-renesas-soc+bounces-26007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 751BACD6727
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 15:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8FDB306D666
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483DA32B9AC;
	Mon, 22 Dec 2025 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CaB7Of92"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D0732A3CF;
	Mon, 22 Dec 2025 14:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414811; cv=fail; b=cnIFz2hd70RqpxT9w34VWFregyC9SeY4gHblLnA8hJ5j8A5rTcSW6uCUsvHXgui8MgueU0hYO/txmEYaDP+/7Ws48AFy57szG+oxR8C5mtJx4gOgiLeMPJH3AG5L3ub4e8iZs5dtXeN5ayUcSti2JACyAlzrXT08lnsWC4oVkyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414811; c=relaxed/simple;
	bh=dg/1Mz82IeY0TXaT6hNTAi5Anfq4TIXlGpze9/yMqUo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DzJB3GPLTHGBilBmcl4WsYw7sIjQ9+RfWDgjMkxq75aMy5B1j0rOmGnhxwU7CwXmh1lf/8xFlAmB0Bvy6lZM7/lXzg+SpQQ5MS30aIWGSquxDfA5N/pUm+OcNvlspqw54gf3nHbz7sBwA5KHRKK1nEKr1Yk44GFUmqTAW1/K4fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CaB7Of92; arc=fail smtp.client-ip=40.107.74.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guhfSeSP23W2OTMCs6aLus0uaqZHYFYmeb1kdcWp7sYMesBdq8f6JUID6HOTU2NEm3SAFQkgcQN973Yx6LoMS0gerAXV1mPOVLoJystk2H/qNgfeTt0iC5hcz+GBhrziOBKFLd4rPH2v8hj7P7U4PbBMMqp8VTFdb9rooMlzF1PbJlPfneSEb7+Zu2K3myMPHeivzgQNQxM7Rzt1C6iPuaBVYSvuuoJd8bkKRA4JvEgNNuHCi2K5TF5EqoEv3dpheM7BghjJgV/4RJbxyb3NTKvBVnxyA21TKCMbPRXsyj+rM5pP4iM0XAWu9wEpC8upCqI+4URcpQbOki6c7L7AYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg/1Mz82IeY0TXaT6hNTAi5Anfq4TIXlGpze9/yMqUo=;
 b=hJgXr5HYivYIn1J5D8YUHtwjeNwEQ7XABbigpce9AmatgIzXR0t+mPl0UEbh5V7guBLjFjRAZ6ZVCjAyGcXC783ltQIwwgK8YRuJeLxJFvqODxfKq/9WJ5BoUZn4Eh13+5wVvYSp/hZK3ucTHTG8qvAEiIorkSs81g2knUoFDUS+p0qhIQuye93QmH5UiKKJ83qBh7B6n8PiMkijHjorFT/W7PuqxXrkgfDarxZ57PFTcM/iC9jhAWb4nInpz8Q7QxWA+rMaPukHn9asr2gQA2KA2bfkj6PQi1XPjNC0QJ6S/vK96Ty/VAxSkn6Lzarx6bExYKxXAIlVI1uP6vHYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dg/1Mz82IeY0TXaT6hNTAi5Anfq4TIXlGpze9/yMqUo=;
 b=CaB7Of9255KrEqjdNmoXM1HeEHY+yvmyeRQ5HzFMTSlglM9ub4npGF4wcv/otEtzehvUF2E05l1KJtiA/EWQ8bEW8etuSEyrikwYKLC/6umlB/t8TIJYvXvW88qpNRSqOgiDF+Y/06E+xp6zgZr6bMxW2DxBKPrIFslWCQ4CLbc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8804.jpnprd01.prod.outlook.com (2603:1096:400:18d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 14:46:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 14:46:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: biju.das.au <biju.das.au@gmail.com>, magnus.damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Add
 support for WIFI + BT test
Thread-Topic: [PATCH v2 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Add
 support for WIFI + BT test
Thread-Index: AQHcYWFGIkGa/4oRsEOyQV4avsZfZLUJ/+OwgCPdpQCAAALBQA==
Date: Mon, 22 Dec 2025 14:46:41 +0000
Message-ID:
 <TY3PR01MB11346CE98A529AB6BA806BF6E86B4A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251129185203.380002-1-biju.das.jz@bp.renesas.com>
 <20251129185203.380002-5-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346098C68AF3DC9147F0E5C86DDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdXkn=i9Vr0d94X6bnVQguNJC7FCD-NyVQ8erngY8mEaOA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXkn=i9Vr0d94X6bnVQguNJC7FCD-NyVQ8erngY8mEaOA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8804:EE_
x-ms-office365-filtering-correlation-id: 35b4aa65-cc9b-4184-7059-08de4168eb75
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VzFleG1Eb2hOdCtrNW5McEkvWnIyUFd5L3Y4czJIa01RWVNZM083VmFueXcy?=
 =?utf-8?B?RkpyVnF1LzJYcEk5TDVaOXZ1R0wxTFJxYk9aeUJzeFVCNkhOUmVHUXVYVFZ5?=
 =?utf-8?B?dlh2NlNmcWUrTFd1QXZHaTgxQ2NxM2hFQVJTWkp0NWhrVm56bHlZVzdpNitD?=
 =?utf-8?B?SGlxZllVMkc5d2JINjBVazJ3OXVkaUJWSGRYWFJmWjV5VGlCZDJ4VkFlZ2cw?=
 =?utf-8?B?UkVVOXVoMlBUK2VJb09RZXZoMXVRNUcwOXpGekw1dFdOVUFwUTYyaFN5OXZS?=
 =?utf-8?B?Y1NJdXV2dWRmdmFtMTBNbkRRcGp1MnpGb1RyNjRXWVZVS1laSmRweC9zTjRC?=
 =?utf-8?B?UGVnRHFPeXVtU1FBZHp1MW52SWxLQTgrc01tcC8vUWxFbjdnaEtZN2RyWFRv?=
 =?utf-8?B?eUZPS2xzaSswNTlmQlU3djRPV3lETlFob0xXK1N4UDFaNWFwSzB6elJNVFlp?=
 =?utf-8?B?K2FLNlRoS3NLWWNURnp2bXZkT2dxTkVEVk9Ib3VNQ3htWk1td3lCYnJoem1E?=
 =?utf-8?B?Qy9vVHFjM1czbENlZWJyM1MrblNtWlJsbHN2eCtVQnlkWVJJS2N5cTgybXFG?=
 =?utf-8?B?WkozTHJoS3VpdkhmaU9icFdlUHdsZG12eDQ4NlJXSStuNHkwQ0s4dmNHb1pX?=
 =?utf-8?B?MW5mRVl5K1RXaXF3cjk4bytGeWlqdFhrYllGTDF0aXFpVCttUS9PNHphSTRQ?=
 =?utf-8?B?eHJNWjJvWW9EazFNM2s0bDF1L0luZHluVDdZeTd2aDFZOW4rODZDeWl2Z3JZ?=
 =?utf-8?B?V2J2VWw1amdHV1NtZ3EzWmVJcUhjZERud21tZHFVSHU5VTBwVTd3KzBvcjlE?=
 =?utf-8?B?QSs3VVpraFVkaE1zYzdyTlZuNE1zd3FpN0FvWUwzYjQvUWJVY3QvQnU4eDRC?=
 =?utf-8?B?NVVYeGlLTXl3UUxtSTFkU1NoeHNJQklHdmlVeTZWSkZHMDJ2Smhtb1VkNk9R?=
 =?utf-8?B?TjZyejNtejBweCtaZVFkZ3dFWTNSUHdMNGtITnViemhBRktZNXIwWlI2NVNq?=
 =?utf-8?B?VzE3cHVTUXZDaVY5N1I3bHo2UmR0cGorKzdyTWZkeVB0eUV5QStlcDZxUnNJ?=
 =?utf-8?B?WGNIOWZrYzhtWHljR0V5VUt2eFpEM2pab0FoR0NEbDVqcDhrN2J0ampRSU1n?=
 =?utf-8?B?Q2dvN2lrNW81bFJRTWxzc3dOZVJITFk4YmZ5RXh5YXlzV0Z0bmRFQ1N3Z09L?=
 =?utf-8?B?TEVsMktVTXhNM2VBVHcxRXVoK2Z0NEFsR091ampaYmZEQ2dDRFErcTdJVzZ3?=
 =?utf-8?B?WjRUTThVMHVGL24rekNhZGNVd2t3bTlkSEVRdjhSOHhZWEt3VnMvUXNZa0lI?=
 =?utf-8?B?UVZ2M1owenVwUE1veFUyS2NnbGRkV2kzY1pHL2krRFJvR2VVWDJjQ2V1ZjVX?=
 =?utf-8?B?NzBJNEYwY3lRd1UwSi94enZ2VC9PbkVXOGJUTER1VURKSFZtU3JFSXorUm1y?=
 =?utf-8?B?R09tcTBPbGkydE5yWDkvb2kveVRZNW9qQWtUcG1vUG93ZE9NcnZpbDlVOWti?=
 =?utf-8?B?Nk5qejdHai9SV1VpMVAxSUNUU2p3Z2I0NERrTUh2dkVVNVUyMVlLdFRkTXZs?=
 =?utf-8?B?N3VHMTVYWDErSmJEbmt2WnRibVcvSXpMTkpBVFUyaDZLdmdvQUsxM2dNalV6?=
 =?utf-8?B?TVJ4RzY3WHdYLzRTTnJwdUNHeW1ObUxtQURPc2YyU3hHRXRyZWVoY1hMRXBB?=
 =?utf-8?B?bXkxZTRCSUt3cjRLRTFONnVYdjJTVHphMzd6VzZHU0gwdVFmcDMrYmxtdXlF?=
 =?utf-8?B?OHR2Q0RBQ01iZFVCemFTMmM0VFpEMnVpbVZoWnpLa3JjT1BOcWd3dGdielh6?=
 =?utf-8?B?TEFENlN4S2pINWxxbzNuOS9GNHhKU3pQTWcydkRWTFROeXFHWVFnUGZuLzN1?=
 =?utf-8?B?OU40Z1pMRWw3Zk9Uazg1RGhGazhBUUM2QVhONHRtOEJOU3dOb0N0MGdYRGxs?=
 =?utf-8?B?eE1Wc2NuYjk5VTUrTjI4WFE3MUxYdzJsTXdqbkFsM1FtNVdjZ1VUUVp0TXVS?=
 =?utf-8?B?amp5a25Obk1aanVzKzRuY2hWUWRjT0g2Zm9nck0yNzdZN1J2VENPeWNGKzI5?=
 =?utf-8?Q?q9B/7q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEdKNnFKWWthM25nWUlGb25lTU16VEJyOHRpNG1odzFBQ3FvK3FKU1BzQW5a?=
 =?utf-8?B?SlBNTDZXZzhMdG5td205QXlpQmFDUTJTSlJMdTZzY2RuZVY2NW1scVIyZjRC?=
 =?utf-8?B?TkpPRWtyQlB6Zy9ZNXN0MEM1cFBPK2pTbVdTVTlwRVZPZUUzeXN1enlWQ2g5?=
 =?utf-8?B?TWJ3Q203S1krRDFGb2RGbWVaVnVtYyszWi90MklqMFI2aXZLc1Y3RXd3cnNP?=
 =?utf-8?B?OVU4VkZiQVl4Q2kvd0hwM0pHVEJxNW9NMEJPaXU4RURIdERCYlhSWnBBdmFQ?=
 =?utf-8?B?QjBhNndQUWJuQkhGdkJaM3hzcktwbWt1Nm5Dc0hVOFFxdWdOVktHcjZKU2ZI?=
 =?utf-8?B?b2kzL3Y2ZUVYUlcreldoSHZrTHFRQVpkRzRNN0RJTjZ1ODBxSHpSbDRjbnFT?=
 =?utf-8?B?TUtFYVUydWdRU1JGeG1oZ1dZTEh0UWhoVDliUVJYMkNMWENHUlBZRE0wblRa?=
 =?utf-8?B?eFlIVENpUWREVlJhcVVBMUZSaGZVRktJQ0U4SjJENWVhTnJEWjlrcThrQWFU?=
 =?utf-8?B?eHRERmw0d3RUbCtIM3RmdDd2MUh1NFVXd3g4Q1NYOGVDcDZTYy9JVEI0Z2N5?=
 =?utf-8?B?ZFgyQVk3NDI0ZEFOOS9VRlBSK09vVUtxNzBBRXhCQ001RE5HOGhrdUd4YkZv?=
 =?utf-8?B?NGFhbmxtb05ZalFoNDlKejhSYzEyTXFYalZTMGxTVTZDaFN5K3p6Nmp4b3Iy?=
 =?utf-8?B?Lzc0MlF2d1FFRGlSSHljVlpTeGhnbkFtNnVBeTd2cTRRcW5qVVhTajk4SjM3?=
 =?utf-8?B?NWgydVdpd0NZZGRyMHRBUjI4ZUNLUkFBTXZraHllMTlBaFM3czY3MDdmM0s3?=
 =?utf-8?B?b3ZPQURIZWswdzB2Q0xjcnVjNkV4bGhGMkpIazRYWGsxYmJCZlJUR096Tmxm?=
 =?utf-8?B?L09ZOS9RYmdxU2lOaHdINldyTHBpZTBoZ1lyQm54aVBaRWtPWCt4Rk1YcjVo?=
 =?utf-8?B?clZOaW1vek80Z3EzbDhSZGhmWDlDb3NmeVhyYnBoNjR3SEEzZCtjKzFKK3U4?=
 =?utf-8?B?MU8xQSs4aWxwODNRTWxvVXFMRHU3Y3ltajBjbnh3anVMVEVkekI2S1dNeDJY?=
 =?utf-8?B?NUluOHluZFhlV0YvM3pXN2JJbXdlY2tNM0I3V1VTSWxwQUNpUWZhZUsrV2Ey?=
 =?utf-8?B?a1BWYmRnOVJLQS9CMjdGNG1SKzY1ank3Z0V2cndDOVdjQkMzV1lnM3ZNenBv?=
 =?utf-8?B?Njg3azN1VlNUY2ordyt6MU1uOUJIZ1FvWXVVWHhzWGk3Q09pbTN0cXNQMTNn?=
 =?utf-8?B?ZnJQY1JCemV6dUgxMG5lbktXdm5tclJ2RTJwb3pRVFB1THVZUkt2Y0ZaM0FP?=
 =?utf-8?B?MmtacmdoUC9idm4vei9wUUJhVjdxaU9aOTdiazZTNnJ3U2pXZkdWYVB3VEp2?=
 =?utf-8?B?OVJhV0pneUFnM0ZVcDJZMERjYmpmcWN3ZHJuMUYzckpXTStDUWpueUhhUlEy?=
 =?utf-8?B?aDNOSlBnRXZaU0daamMzblBzK2JKeFZTeU1yRTdBYzFXUS9xcHhFVlNCZU5m?=
 =?utf-8?B?R2Y3aFdvVHNQMU5UU2NYRFFLNVVFaGFtc0JDeHNKemRHbkxqSG9DdXNoUDNJ?=
 =?utf-8?B?RW94K2lFdGxreXp6ZWVidDhIOFY0eHYyaEtPcndPUVhoNGRZcnV3L2J1MWpy?=
 =?utf-8?B?T3FHQ0Ntd1VuZmZQZHNsNkJmM2FHTjZPb2JyeDdCR2k1cDk4YXlWblpBTzYz?=
 =?utf-8?B?cUxqY3JJeURtaDZlVEtCK1AvVXpwK05RT2tLNWF5d21qeFhPRm1LQjZiZFJw?=
 =?utf-8?B?d1JqNkhuTzVJRCtkWjlxZmRmT2orUjVSWmJscXByQXpFbXFhbEpNclY1UjRZ?=
 =?utf-8?B?REhkVG9iS2RrSHRFR3BPTUZUSnUydVh3Z0o3OHM5SWZYdkdJaXkzejAvL0JZ?=
 =?utf-8?B?THNhNk5BdHBSMjR6MGxSQldqMDdiNEdXVWtmS1JraEdRTlE3N3dKcWR1d3B1?=
 =?utf-8?B?TU0xUG51VDhyU0swWW9iM0wwK1huaTkrbHp2a3hiaEx3UThSZWFsakM1a3lL?=
 =?utf-8?B?RklkdS9PZEovcWNuVU9VWEVHc3BLanVXRjlsZStyZEhKUThsdnBTTFQrMWdp?=
 =?utf-8?B?dVpDVTUvSWZUNVc3OWxmTXV5b3Y0azNiQmFrbDZ0VGhNWkFCbEYrQ2NzUzBk?=
 =?utf-8?B?dGVoelNMa2srcG90NXNjckdXcUpDaldSaGluMWl1TjlXNG03SjhOQ2QrNnBn?=
 =?utf-8?B?aG8zem93ZW44TTdXbTQrak1ac2krRlBwblYvVEcxMVBlRTVsNEpiMStXQmdK?=
 =?utf-8?B?TlBjT05WbzMvOUVOTGdlQUl5TFVZWUhDMjNsZjBleE55OGIxWFM1dXpKb1Fk?=
 =?utf-8?B?R3crQWxuTnlIV1NZWG9neXFsdlV6cVc3YitzdXYzQ0JscHN3QXBPZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b4aa65-cc9b-4184-7059-08de4168eb75
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 14:46:41.5648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zA7BV/n9Vs4rENsUBSlALyEnkypxKLkUitSLvTsQLUBLAl8n5/ZnD7jimcKL2TbQG73vHQsyxi3q4sooaC6urBcMRE0eTuaCLh2ATiTIGAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8804

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjIgRGVjZW1iZXIg
MjAyNSAxNDozNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDQvNF0gYXJtNjQ6IGR0czogcmVu
ZXNhczogcjlhMDlnMDQ3ZTU3LXNtYXJjOiBBZGQgc3VwcG9ydCBmb3IgV0lGSSArIEJUIHRlc3QN
Cj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBTYXQsIDI5IE5vdiAyMDI1IGF0IDE5OjUzLCBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+IEFkZCBzdXBw
b3J0IGZvciBXSUZJICsgQlQgdGVzdCBNLjIgYm9hcmQgWzFdIFsxXQ0KPiA+ID4gaHR0cHM6Ly93
d3cuZW1iZWRkZWRhcnRpc3RzLmNvbS93cC0NCj4gPiA+IGNvbnRlbnQvdXBsb2Fkcy8yMDIxLzA1
LzJBRV8yQkNfTTJfRGF0YXNoZWV0LnBkZg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiAtLS0gYS9hcmNo
L2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnDQo+ID4gPiArKysgYi9hcmNoL2FybTY0L2NvbmZpZ3Mv
ZGVmY29uZmlnDQo+ID4gPiBAQCAtMTkxMCwzICsxOTEwLDI5IEBAIENPTkZJR19DT1JFU0lHSFRf
U1RNPW0NCj4gPiA+IENPTkZJR19DT1JFU0lHSFRfQ1BVX0RFQlVHPW0gIENPTkZJR19DT1JFU0lH
SFRfQ1RJPW0NCj4gPiA+IENPTkZJR19NRU1URVNUPXkNCj4gPiA+ICtDT05GSUdfQlJDTVVUSUw9
bQ0KPiA+ID4gK0NPTkZJR19CUkNNRk1BQ19QUk9UT19CQ0RDPXkNCj4gPiA+ICtDT05GSUdfQlJD
TUZNQUNfU0RJTz15DQo+ID4gPiArQ09ORklHX1NFUklBTF9ERVZfQ1RSTF9UVFlQT1JUPXkNCj4g
PiA+ICtDT05GSUdfQlRfQlJFRFI9eQ0KPiA+ID4gK0NPTkZJR19CVF9SRkNPTU09eQ0KPiA+ID4g
K0NPTkZJR19CVF9SRkNPTU1fVFRZPXkNCj4gPiA+ICtDT05GSUdfQlRfQk5FUD15DQo+ID4gPiAr
Q09ORklHX0JUX0JORVBfTUNfRklMVEVSPXkNCj4gPiA+ICtDT05GSUdfQlRfQk5FUF9QUk9UT19G
SUxURVI9eQ0KPiA+ID4gK0NPTkZJR19CVF9IUz15DQo+ID4gPiArQ09ORklHX0JUX0hDSVVBUlRf
Tk9LSUE9bQ0KPiA+ID4gK0NPTkZJR19CVF9IQ0lVQVJUX0JDU1A9eQ0KPiA+ID4gK0NPTkZJR19C
VF9IQ0lVQVJUX0FUSDNLPXkNCj4gPiA+ICtDT05GSUdfQlRfSENJVUFSVF8zV0lSRT15DQo+ID4g
PiArQ09ORklHX0JUX0hDSVVBUlRfSU5URUw9eQ0KPiA+ID4gK0NPTkZJR19TTkRfU09DX01US19C
VENWU0Q9eQ0KPiA+ID4gK0NPTkZJR19TTkRfU09DX0JUX1NDTz15DQo+ID4gPiArQ09ORklHX0NS
WVBUT19SU0E9eQ0KPiA+ID4gK0NPTkZJR19DUllQVE9fSEFTSF9JTkZPPXkNCj4gPiA+ICtDT05G
SUdfQVNZTU1FVFJJQ19LRVlfVFlQRT15DQo+ID4gPiArQ09ORklHX0FTWU1NRVRSSUNfUFVCTElD
X0tFWV9TVUJUWVBFPXkNCj4gPiA+ICtDT05GSUdfWDUwOV9DRVJUSUZJQ0FURV9QQVJTRVI9eQ0K
PiA+ID4gK0NPTkZJR19QS0NTN19NRVNTQUdFX1BBUlNFUj15DQo+ID4gPiArQ09ORklHX1NZU1RF
TV9UUlVTVEVEX0tFWVJJTkc9eQ0KPiA+ID4gK0NPTkZJR19TWVNURU1fVFJVU1RFRF9LRVlTPXkN
Cj4gPg0KPiA+IFBsZWFzZSBkb24ndCBhcHBseSB0aGlzIHBhdGNoLiBBZGRlZCBoZXJlIGZvciB0
ZXN0aW5nIHB1cnBvc2UuDQo+IA0KPiBEb2gsIEkgaGFkIGFscmVhZHkgc3RhcnRlZCByZXZpZXdp
bmcgaXQgOi0oDQo+IA0KPiBDT05GSUdfQlRfUkZDT01NLCBDT05GSUdfQlRfQk5FUCwgYW5kIENP
TkZJR19TTkRfU09DX01US19CVENWU0QgY2FuIGJlIG1vZHVsYXIuDQo+IENPTkZJR19CVF9IUyB3
YXMgcmVtb3ZlZCBpbiB2Ni45Pw0KPiBDT05GSUdfU1lTVEVNX1RSVVNURURfS0VZUyBpcyBzdXBw
b3NlZCB0byBiZSBhIGZpbGVuYW1lPw0KPiANCj4gQW5kIHBsZWFzZSB1c2UgIm1ha2Ugc2F2ZWRl
ZmNvbmZpZyIgOy0pDQoNCg0KT0ssIA0KDQpJIGp1c3QgY29waWVkIHRoZSBkdCBhbmQgY29uZmln
IGNoYW5nZXMgdGhhdCBJIHVzZWQgZm9yIEczRSBib2FyZCB0ZXN0aW5nDQpiYXNlZCBvbiA2LjEg
a2VybmVsLg0KDQpDaGVlcnMsDQpCaWp1DQo=

