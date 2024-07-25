Return-Path: <linux-renesas-soc+bounces-7531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 850C493C64B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 17:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A8442811BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 15:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9126A19D062;
	Thu, 25 Jul 2024 15:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Y3CPriAf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F71993AE;
	Thu, 25 Jul 2024 15:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721920925; cv=fail; b=YkAZvJgIYYIJSQk7F7IQ3M2B2ZSo3B0s5i6RxJ2TcYNXe976dVUJ1c9w+YZ8gDdQEsJ8JTLF5REhBMJRWvj067WLA7UkivJI0LJN5wChnsuwNrOy1cSB85Lw3TeO/dkiMi7QId8uhD1YGNWcYzW+P5FalrpWYpRI88LOkCUYe1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721920925; c=relaxed/simple;
	bh=9PvNGiCiYNM3USsyUAQnmKkbWR1IHKnfsIzXy6gIiRQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FTkRZnRcuj+2I1AbPKwRmu23bXN9u3sM/lC69FXOyMGMY8eH8OFmx/+X6aKPkXyylbijYfv4BJMFIOvPu0K/h/KStv4nXr8l5HfgRdDu/Uj8LIT/1roH94yamtsO3sFru85JfN/55R2fiw/tvgRA5eVo8d9VL+pWv4cID+7ICxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Y3CPriAf; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZj3SObBoE8BZ2CiKhEYGdaY4/Q6WF+nKBEcWMsfRt+6eSRWnfinayD018QEDRXCE22Iw8LENATs44F1QEhBfQk6rwynPKJtwB4urIr3gypTGyse1IxaTIVURBfRk1lQ5lecDURyoUyUd2rmtACGynjylbJk/dcajfgyfnQNtw7vxixzXhc3J9xroNB4gfhjhKGiFMaZ5dvvv0QIi9/eAkHPzg4fsQa8qNxumCxyC6Xx3KaETXghvp11wumxv916cWa4YQfe9gd+ZE8I72dKZmce2ykEVtJPmcPrIr8DFGAw9qb0n7hXYhVtIICbSQ3KqeXE48BlpU87uoSY4e7Xdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PvNGiCiYNM3USsyUAQnmKkbWR1IHKnfsIzXy6gIiRQ=;
 b=L06IPL5/fCCxeTBofS36WIjGpj+P2b/9UAbHMLKYkq0g/zUn+AhLksE7pZ/Nogv+qX6nGRAMJPv71Dmb6eBLq35yZlTzPqHJq5j9AU/fnAydWmyQ3gTwFZgGUXRsJ8C4SPiMwwLmdplGb5OJMmWW16D9t4d2/qzNIVkIyuskgoSeV/0Ce8hJQzWTOThgCMQ8sy+P5tgNWWLlRTfmWMpgK0RUsBeurBgiAEj/8xu9Y9avw+a/ijlmUGGKs7aEjVSSGsqyurOJrCxuq0YzOwLvgLtCQnJBrZkguMDe/7qCdSnA6VjKlCo7zQeVwGCYjT8h5IIk1WKVlC9mCdQZXaJbPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PvNGiCiYNM3USsyUAQnmKkbWR1IHKnfsIzXy6gIiRQ=;
 b=Y3CPriAfKYcAFLNlv0Q43pvL+PyrKsi4pWM1PnDZwyaiKChByzjFumcGXyU4f3oILY6zQ0FqrAIN1qkodTkwoJGSHHgB1yCndEgKyihtMQHhr5CAF3p8WGZUFwUDVZkcAo3gF8rZW5FdSj6gNiCTWaJBK75rwkdWR5HBAlxye+Q=
Received: from OS7PR01MB11537.jpnprd01.prod.outlook.com
 (2603:1096:604:245::11) by OSZPR01MB8305.jpnprd01.prod.outlook.com
 (2603:1096:604:187::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Thu, 25 Jul
 2024 15:21:58 +0000
Received: from OS7PR01MB11537.jpnprd01.prod.outlook.com
 ([fe80::b98b:2925:d3c7:b4ee]) by OS7PR01MB11537.jpnprd01.prod.outlook.com
 ([fe80::b98b:2925:d3c7:b4ee%4]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 15:21:58 +0000
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH V2 0/6] Document r8a774a3 SoC bindings
Thread-Topic: [PATCH V2 0/6] Document r8a774a3 SoC bindings
Thread-Index: AQHa3no4oKEhXpFrxUexw5+IOfkBb7IHifQAgAACrIA=
Date: Thu, 25 Jul 2024 15:21:58 +0000
Message-ID:
 <OS7PR01MB11537E8348F88FDCE4479B02CCFAB2@OS7PR01MB11537.jpnprd01.prod.outlook.com>
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
 <0e711bd9-8ff7-4346-ab18-a3b5e4d8d730@kernel.org>
In-Reply-To: <0e711bd9-8ff7-4346-ab18-a3b5e4d8d730@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB11537:EE_|OSZPR01MB8305:EE_
x-ms-office365-filtering-correlation-id: 08e39da4-feaf-4ff8-5ac4-08dcacbd8665
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGFhM1NIVWRwa2Q4aDdORVRPdjJXcTVGSmNKZlJ5SzdLK0FIekRjS2hJcTk3?=
 =?utf-8?B?VlgyV2lINURPNGhJcE8zSTk4WVZPZ01zS0NCUGR2d05nVVN5ZU1XTk8zZ21u?=
 =?utf-8?B?Q3lkWjdreXA1ZUdtRlNsT2RjaVVueDA0dWRBbWhCcnhWR3lac2VRSGp0d29H?=
 =?utf-8?B?OHBBL1JWaXBQeFFXT1pJZjA2emtNNWJNZDl0Tnh4bS9wTGV4WVVMODBwbTFZ?=
 =?utf-8?B?U2pxOFdZclBSUWovU2VtZ1ZnRVg2d3dySHM5YVo5d3FOdS9aeDBwWHZLY3dW?=
 =?utf-8?B?bXRXSElJQWEyM25ybjNEN3BJYnh6Zkp0cU9NaXJxVHpRZ25mOS8zdTJ6OU9u?=
 =?utf-8?B?LzdHaVorWWJpNyt3NjBIN1AzOWhKaWRsYjVZQ3I0eFNUaXVMZzVRVDRrQ1E3?=
 =?utf-8?B?NnAzZ3d4dXRldWJ1OFBQd2JEYWZQVDlHNXRoRkhmWGoyTGJSWlhVTVhtaGtC?=
 =?utf-8?B?Y0M0TUlwQng4aXAweklQSGg4VVl3KzZFZUtnaU5HVnJ6KzlqYzlrZDRmTS91?=
 =?utf-8?B?ZXVYWnJkUGJLajliWVo4RUJ1ZmFHQ1hHYVNtN3F6V1hoZ21La1R4WFFuaDRs?=
 =?utf-8?B?QlNDMTUvUEVHWUNITStGVlQ4b1FjSFJMQW1OWitKNGZ6TVJxSVh0U1VGbTB5?=
 =?utf-8?B?dnBPajBsejZzeXNkZnc1dXpBSFRTK213WmpnRnpMRDFTeWtvTktQb1crekdH?=
 =?utf-8?B?RFJsWU1rQ1NrZGxERExFY2JQeHR3VmphQ2xRU01ML0c3SnpEM0FRR3pvNFVv?=
 =?utf-8?B?NEhKaWh4K2x0NDdOZW1qYS9Qbk44T3ZXSGRaV280NDBxWlZUMlhwM2ZwTEwy?=
 =?utf-8?B?aS82amczSFlvTE81VFlXSk0yNllkdlRsNEJybi8vUXBxdE5OdDFPQmlBT3BP?=
 =?utf-8?B?UmZKT05pVUppRTI2aXVkUmhzYVJyVm9jWEhQNmM4UFM1VTMxMElGTVZGWFZn?=
 =?utf-8?B?NTFuczF0SlNuTnhmUTVxaFdYK1IrRHQveWZtUU1yU3FZTGxuY1ZyejdYbWFn?=
 =?utf-8?B?bTFjdXNYZzZ1QnJ5OUlFdHJaRHJGYXp6ZUxsZFVOeS92ZzJ4MElrMmx0Yjht?=
 =?utf-8?B?UnptSmJaMnRUZEY0K3Q4bmZVQmlVTDNleUZZNXJOMVJTcVBHZ0tYR0JWT0hP?=
 =?utf-8?B?UWd3L2liVFJJdlc0OFNUOHFiOS9XSWZ6S01zUEdaNFhBdzBuQUM1c09mQndm?=
 =?utf-8?B?TkxGaWpJZzFHV1lsdWs1WmVGeTRubjFHcEJNd0F4MWNxOUhzWE5mYXhVaWhw?=
 =?utf-8?B?M3NFTkZOR1UzNzBFcVlyMVRuV1crM25Qdk1QenI4UGNhUzhyWlkyWHVubVVl?=
 =?utf-8?B?RU11NkJqbmc2MTJ2RTJSak5TeDR3TDNuZVZOZ0xPUTQ1WDA0QXlWRGlDMlBG?=
 =?utf-8?B?aFplY0E4cVJacVJtUTFsSU4rbUZ3YmhFUXpvbU5TNmlxWTRWTDV2c2w3UVBX?=
 =?utf-8?B?M2M4eE1PMTNIVEpWUHc5cGhFZzN2OGs2TjduajNadzdsVjdab3FQeTFERjBI?=
 =?utf-8?B?bUUzYU5sTXVQSVJ0dElIYTBYWnR5K1UwYUZXbi9POEx6VEg0UFZadWlFZyt0?=
 =?utf-8?B?cWhNNHcwYkYxaTV0c3FIeGxuVnpycFh2TkIrM3d5Zmhqci9haDFGV2xKYmEx?=
 =?utf-8?B?b3ZtbHFFWTh4MUpxSzIxWTZ5Vm4vNHRFVythTy9DbVBnSTdJVThncUtBUm8x?=
 =?utf-8?B?M2paalFXMm0zSXZocGE1T3IzOUNEZkc1Mzl3VGJQVllqZ1N0cW9LTGdYMTUz?=
 =?utf-8?B?anZlRnpneS9LUFR5SlVpYTFIY0pab040WVpEWENTTkw3TGl0c29zWWtPVXV6?=
 =?utf-8?B?YWh4Zkp2K0xROENHbENCbFBJWmkyQVR4UFFSUlZMM1BDdDBlVklrSEgzYXR5?=
 =?utf-8?B?SFNFWmVKMG9mdEREVWVYcFBVNkRXeUF2SDJMZk8zODhkd0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB11537.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0ZRbWg2TlVnR2F0S0ZvRFRVdHdoYWpJVVVUS3FpMEsxWTRycERiRmVnczJi?=
 =?utf-8?B?cnpNaXk5ZUtzMS9uVzhIS0lmcG51ZkJodWQzLzBNRXRLb1lqRE1FSGt2WFBs?=
 =?utf-8?B?Nzc2QnR4ZG5WTnZLN2x2VURua3Fjd1hjdDRsaDZNRm5nVzlwQ0o0T2tma2dF?=
 =?utf-8?B?bEpmUFhQdWtRTkRpNlFoR2NuMDdlYSsxN0JOdmVYUXIvN016bElCNk40c1BL?=
 =?utf-8?B?U082QVZtU0IxNVltRzRLeFcyc1lPYjI1a1V0N2lVL0FiVkRkbWxNcEhoQ3hV?=
 =?utf-8?B?VWpQOWFHRGVPSHU1TEJGS3hIb0Uyb0dvUDhaTHJwazdqSDBMeGN3MWZWT2RY?=
 =?utf-8?B?eGVBUXgyVTlITWJwTkJRMHpvSjJmQ1ZGdHVkY3dRQ3pSTjgwRGxzcWNFcW1t?=
 =?utf-8?B?QUVEVENCbHdLTFkydThKNzhaM1krY05ubys5RWdOVjRwSEpYNXdTWTMrWGNt?=
 =?utf-8?B?VVJXSEorSURxWVRvc0dBR1NOL3JOWU1uYjNLUTFyVFp5c0ZEOWhqblBnTTZD?=
 =?utf-8?B?M0pMT2VzN3hCYnB2SGFma0ZSM1pPQ2thSU5xVFMrYzdtcEpMVUtjZlRoeFV0?=
 =?utf-8?B?dll0ZUhzaGxpL1BCTlp1RkVQN2Nzb2F1WGdWVlNDSXFhV0txZzA5S0RYbFh0?=
 =?utf-8?B?MUZXa3NGSDdsUlN3enVobW9Bc1BxSUFWSCtpSzRidWJGQ3I1cE5JczkyRHp5?=
 =?utf-8?B?dWdkbjFYZGxrMlc0Z3B4ZHlWSzVNamhyendCVm9zWjJiZVpHL1EyQ2cxWkdM?=
 =?utf-8?B?Z1lPMTBIM3BDckNqMURxYnN4R2JGcFV5ZW9Sd1VsMUJnSHlGUExSR25Pc1RO?=
 =?utf-8?B?T1A0SHFMQzNhLzB0Nk1pNE9qbU14OGlOeVdBeDFKMDN1VmRhUGRhTStINTE4?=
 =?utf-8?B?RllKWGhWblFaemNXdEVsemUwa3BIeFE2WC9EazM5b0duZmpyeDlTTHhzcEJx?=
 =?utf-8?B?Wko3QUp5YTJERXltQlJVaVcvSENnY0YxbHFTWkxsZmMxcGs1czRKd2Q3S2la?=
 =?utf-8?B?MDFTRkdKZHpLNXBzVFQ5Qm5ZOWY1QlFiU21KYWhtdHRnbStEWUR2WlR4UlVh?=
 =?utf-8?B?RS9qd1BvcXV1a2ZkQW5mNDZDalBtOTc5UTVnSE1OQmRsQ2FuNlpzZGlzSlJX?=
 =?utf-8?B?MXRzQzNxY1hNYktzTk4zVFZQZDF5U1h4QWhabUNmNXlCN29JS2lWZHFWOTBt?=
 =?utf-8?B?TU9kaXBGcmk5MTNEZUpPSFRmYUxjaXNRNDR2dEVYdms3eG15S1NLMjVyYXdC?=
 =?utf-8?B?RUVMUU9tQ1MxcHFyVGZxSDRLaFVpajIrVXk5bnFHTHJ3aWhXa2JjVlZPRzZo?=
 =?utf-8?B?dFNuNVpVYkVhd0x6bGJ6RWx5SzdkNzE1WmIxM0xVb2N3K3RDSGxUS2JEYno0?=
 =?utf-8?B?bHZUSzA4TXJQZGdFd3VibU9yYUx5UXRxcFVxQXAvcGw0SXVkMWdZcmJEaCtn?=
 =?utf-8?B?UExCUWdLangxRzhXTXVBak9oT1FLc1h3WHh3MWs4alhORStOTWZ1TDJ5U21Q?=
 =?utf-8?B?b0VWSTQ0cGRBNUJJMTR1OHlZSkdUS1RobHJxZGw1d3VSYTRsbnpQUit0M044?=
 =?utf-8?B?dTVaZllFRFVTZ3lvV3RrRlRBeHVlTmQ3dVo5V1hxZ25NQWxyVlY3Um1jdUkw?=
 =?utf-8?B?UmlFSDlkZm5SSE9CQVdoWFZmU1ltcUV0UEF2bW9tK3VRSmZLZHBGTzhGSnZr?=
 =?utf-8?B?ZjFTUGR4UU5IRDlLWVpKcjg1ekZpRXZVQXR6WFpzdm9PV2lhcmk0eHBrclpY?=
 =?utf-8?B?SXUyYWRCM2pBVThrcDE5eWJXd2d5K2VZMXJxaThma3l0bjRpNVIyR0ptdEli?=
 =?utf-8?B?UWwyNUJoOHd4MTJoNFJQSjlDMDgyN2h6QnB1MzBZTWQ5WUxhWmxPZ29xYmRB?=
 =?utf-8?B?REVBRDZjK0RYNXRDeVdpamtKc0xXRHRTdzBtdWFoNURWSS9xbnpNekdwTVdX?=
 =?utf-8?B?LzFmL21NOUc4eUp6TnJ4SnpLdXRISFVPaG9KQTFQSGNUNm04dnRwNXNKdGdr?=
 =?utf-8?B?K1BMUTVFV25kYlhpVFozOG1rR1c5cmRhOEZWaEk5LzJsMU1LSUtmSGZKd3pQ?=
 =?utf-8?B?a2Rpb2RIOEJxVzB1ZlkzRS91MURrSDMrbzkrYW8wZFFRRU5VMnFCMzFIcE8r?=
 =?utf-8?B?NGRCOVRjSCtGK1NNMmRYc0RBek1CU2tvVkNHdWlQbkpkNFpOaXFSZmZHMUZx?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11537.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e39da4-feaf-4ff8-5ac4-08dcacbd8665
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2024 15:21:58.3220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PlKc/WYClyi3DQ5ZDGHG6qFDYFzLEc7cZito0BtyacQ/cGMuvPX/Smi+U2rn6PxlkEiqtcpRuMd+wz8F7m2zvRi8cgWF2m0aGS9LNxBxbdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8305

SGkgS3J6eXN6dG9mLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudC4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtl
cm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDI1LCAyMDI0IDQ6MDEgUE0NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCBWMiAwLzZdIERvY3VtZW50IHI4YTc3NGEzIFNvQyBiaW5kaW5ncw0K
PiANCj4gT24gMjUvMDcvMjAyNCAxMjowNSwgT2xpdmVyIFJob2RlcyB3cm90ZToNCj4gPiBIaSBh
bGwsDQo+ID4NCj4gPiBUaGlzIHBhdGNoIHNlcmllcyB1cGRhdGVzIHRoZSByZW5lc2FzIERUIGJp
bmRpbmdzIGRvY3VtZW50YXRpb24gZm9yDQo+ID4gY29yZSBjb21wb25lbnRzIChTb0MsIFNZU0Ms
IHJlc2V0LCBjbGssIHBpbmN0cmwsIHNjaWYpIG9uIHRoZSBSWi9HMk0gdjMuMA0KPiAoUjhBNzc0
QTMpIFNvQy4NCj4gPiBUaGlzIFNvQyBpcyBzaW1pbGFyIHRvIFItQ0FSIE0zLVcrIChSOEE3Nzk2
MSkgU29DLg0KPiA+DQo+ID4gdjItPnYyIHJlc2VuZDoNCj4gPiAqIFVwZGF0ZWQgdGhlIHBhdGNo
IGRlc2NyaXB0aW9uIGZvciBwYXRjaCAjMw0KPiANCj4gU28gaXQgaXMgYSB2Mz8gT3RoZXJ3aXNl
IHdoaWNoIHYyIHRvb2xzIHdpbGwgcGljayB1cD8NClRoZSByZWFzb24gZm9yIHRoaXMgcGF0Y2gg
c2VyaWVzIGlzIHRoYXQgdGhlcmUgd2FzIGEgdHlwbyBpbiB0aGUNCmNoYW5nZSBoaXN0b3J5IGZv
ciBwYXRjaCAjMy4NClRoaXMgaXMgc3VwcG9zZWQgdG8gYmUgInYyIHJlc2VuZCIgYnV0IGJ5IG1p
c3Rha2UgSSBzZW50IHRoaXMgYXMgInYyIi4NClNoYWxsIEkgc2VuZCB0aGlzIHBhdGNoIHNlcmll
cyBhcyAidjMiPyANCg0KSSBhcG9sb2dpc2UgZm9yIHRoZSBub2lzZSBhbmQgdGhlIGluY29udmVu
aWVuY2UgSSBoYXZlIGNhdXNlZC4NCkkgd2lsbCB0YWtlIGdyZWF0ZXIgY2FyZSBuZXh0IHRpbWUu
DQoNClRoYW5rIHlvdSwNCk9saXZlcg0K

