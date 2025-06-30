Return-Path: <linux-renesas-soc+bounces-18928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1470CAEE479
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 18:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 113D33BF352
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 16:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A6E28C878;
	Mon, 30 Jun 2025 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="a2r1LtCE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BF621D3D2;
	Mon, 30 Jun 2025 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751300584; cv=fail; b=EH38M9gKy6VKoTiOHZ0+YdS4RgXEsvW/2QmpKxppMJKX+RHEBJQ9yytzFyeBLDZ5dtfsx+BimaaFOM1i3G0TRicdQnGeCYkXNCYkIa12CcjB1rAJP+dWf1zAzxALzKQmITR+HymAXC+xFm0/hmMtotCnIzF+/fv1fLjkipW1hMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751300584; c=relaxed/simple;
	bh=+FaMRSgsaETxuqb17afyOtf+IyYyyu040yTlTaG+Hxk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R5SggIs+6ktYYiUtvqQa3VBNbPu7Fm8nzsRCUWdJFw5W8s6r5gkVgEdF8plcAmCbTvhyKaRkshMlzOuiaaBueTMPsOPvVjaIfrWSAkxpXF5DzZZp+m589YVBBq4Nf7eo4x/gMU6dZ+9T8zHo+q0kTogj6lsxa4uH1ZFMHdPA5+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=a2r1LtCE; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rk6zxdwztxl2o2q2TPP98KU2jEBNOpt87thSW6/XhVZN+oIudFkFtZehj6gT2r0MTKi6/8oc2XoR86hznvcISgli8otRTx7ptg8ZW9Zm7VFg+Tk601J9YiE9IhVFKIm2ccXSq/fqaBc8tdarcVRvfI8dCoKNDnl/crUYYpql2HKCSrxNZPGUO968QnvKCuqJkLXNUcBOanaCOGGvqS2QTDCrUaXQf3F9dAoZLYOrqlxNDBrq0TYmETw1G4EEXQ0Z/fDxt3TFIKUq2eIx2sf7u1RWO01/4B7Cj88FG1tpIO3Tzcdv/9euJ/aA7nrFmur0cehwVhy2j62FMtQi8U9TJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FaMRSgsaETxuqb17afyOtf+IyYyyu040yTlTaG+Hxk=;
 b=t40RkuwJ9r4FFlZLsZ3KFxOZPmeyDHArODoggR7ecUwGc7MlFEJzmaeU+FFn5RXMPV0gq7AVbsZVU51VQIFnn5LUGjp7URoWSmH9r5DNly2equjjxDm0qx7Q7MqCBv1X7m+yCsz0edtAvofJoH2cpdJpngikOU2wc/qCgGvFJGDJPMqm296Gt9caw17P9r26ClcLkrMJvnronp1mkoz3SdB7OYXM2zwDR0m+JNORe/8T+eQdVYYpC3g1xluuoiE4Bb8w9zCUCTkGv/FaR239ue3MdOCfrKW08vIoS0Nzd1lG/i+gud/OTwZdVUtFuZndzDkccchOG7AOurSLFiznqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FaMRSgsaETxuqb17afyOtf+IyYyyu040yTlTaG+Hxk=;
 b=a2r1LtCEZnBRbcPCIC68Utv2ve08u6zRWnxPz4cqPeyjmC2DZSWCN+jzjLoPmnI/g42t+euX0EPNwSn1S3uhzDiA8AHlGZDrtvl3hOGS9kvi/00LCHliG3u7kzP5yoAZNdPBu47dm63QH5OqV5QQFKAxh/WXJFYlVtvLZvc+nqk=
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com (2603:1096:604:3a0::6)
 by TYRPR01MB13848.jpnprd01.prod.outlook.com (2603:1096:405:215::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 16:22:57 +0000
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82]) by OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82%3]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 16:22:56 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "robh@kernel.org"
	<robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
Thread-Topic: [PATCH v2 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
Thread-Index:
 AQHb2phboDZyiLKsokiwgzrZBKxi67QHfvSAgAEqcJCAACJOgIABJVeggABANACACeJzAIAH1rUw
Date: Mon, 30 Jun 2025 16:22:56 +0000
Message-ID:
 <OSCPR01MB14647AB8B2901DE1EBEB32145FF46A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
 <20250611061609.15527-2-john.madieu.xa@bp.renesas.com>
 <CAMuHMdXE-C4FAXOfzQv8xfgFytwpqkARDORGLkosZtCsjK8nmg@mail.gmail.com>
 <OSCPR01MB14647EFA0DA38119F00DF1D50FF72A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
 <CAMuHMdWnz3VUeFaJBEgLc0F_gGkdm679H4YqFFuRAEVFKZd8OA@mail.gmail.com>
 <OSCPR01MB1464715327B4DDE8622B9B510FF7DA@OSCPR01MB14647.jpnprd01.prod.outlook.com>
 <CA+V-a8sF2wmLEAp7uhxhKaNx_u9xTf9SR_y8rafyvYYaUgxYDw@mail.gmail.com>
 <CAMuHMdXdhYJ7ZKVa_f15PMBv7t1_xsDUuwR+uv+bOaHMxtr8Lg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXdhYJ7ZKVa_f15PMBv7t1_xsDUuwR+uv+bOaHMxtr8Lg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14647:EE_|TYRPR01MB13848:EE_
x-ms-office365-filtering-correlation-id: 53cad438-78ad-4b0e-c4f2-08ddb7f25f73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZDNGakJIMmJWaWJSS1k4NDlnTU5WM1g3a2ZJVTNidTJwenhFR1dkTEdKRVN6?=
 =?utf-8?B?ZDIxSWlrL1BJVlV1NndYNmRScExNL2phQ3dPcWprSUpJa2hlbkxWYWc0MEhD?=
 =?utf-8?B?RGkyYUlhbHZMRGNDR1JScHcyVzNOVWZUYVo1Z1lsQk92Y21mS3VZeThjSVdS?=
 =?utf-8?B?SnVpS3dvaC8xMlVRQ2xmaFhOQ0hIZWtUa1ozSFdLRUlDUVowVEVtQm5Yelh6?=
 =?utf-8?B?UXYzY0tJSEg2eEM3Sk5TeVI3b2ZHV2xpSjFndEI1Rit5VzlYUHIwNlV0OHEy?=
 =?utf-8?B?VkRWZjVKSitzOHNkZ2ppWFBWRjY4UHloZlZtblFzRzVjdjUwaDljRS9hVmNV?=
 =?utf-8?B?N2tOaVZ1NFlGT092SjZpZDVNVTZrQ3FFUXg5YzNwWWViQ1d2aFMvdzhoenN0?=
 =?utf-8?B?S2dwb016TEhwY0ZMa0RRTkVIVStjcXBVVGo2OHBRbFVaYVgrb2VUQWQwbVhL?=
 =?utf-8?B?aDFBY1dxMS9GU2htTHBIV3NteVRvMHBaZmtaaUNCVWRlVm5hVHE1Y3lNa3BB?=
 =?utf-8?B?UVFQWlBxTUdQblMwZWtaMWl5SWhkVzNpalpraGZLUklFcklvM0JReUh2cXBB?=
 =?utf-8?B?ZHBqSS9INDQ0TDUvR0MrbWkyNDduL2FnbW01SENOKy9BMThYcFhCcWFCY25W?=
 =?utf-8?B?eDVvcTRrYmY3UFpEMEdZRkxuV1RKTHhUKzNxODFvcjBRazEyUWRCZ2dOeE40?=
 =?utf-8?B?ZlM4cDVpUDloQzY5MnZreFVrbGxhRDltbFpTdjBVME45WHF6L0FZbDJZVCtB?=
 =?utf-8?B?MXpqVlJueW1teGg4bjR4ZzhzRlg1dzNDYmJPalZhY3BLUkNlRjNwbjhheWxW?=
 =?utf-8?B?NktxUUtzRGJHRkl1UitQLzJ5aXNHM0s2M05wblQ4M1F5WVpRYm1jNnZrZUJO?=
 =?utf-8?B?RW1Ya2hqSTh3OWFldndNdFducXF5V25RVnM5Z0RocW9Nb28yNXlmVDNaU3ZE?=
 =?utf-8?B?dzM0Mkdnd0g2cVBTQ1paN0RDck1wZ1BXNGRTeGZDUU5jNE5iTnU4S3h0TWN6?=
 =?utf-8?B?TmtoQnJhUEhjYUlod2hNdHA0endEckZsK1cwYWx4V0hBZ25uTVA2TFlUbThx?=
 =?utf-8?B?elZVQnFCSlJkN3QzQVF1enhaTXdiVS9wMkN3ZnVZS21HeFFHeUh1SGZpZ3Uv?=
 =?utf-8?B?Y3EzRE1kUVhuSjVCZ3hGV1JmOG5WOXE0RkJIbDhMMG52UHVYeS9hOEl1VWp3?=
 =?utf-8?B?d0tYR2J3OFVzRHI4T3huUnRGM3paSURaUWdwNUY0ZXJBejRzWEV0b2RKY1NM?=
 =?utf-8?B?cldWY1NmYmhNNUpHRFltWVRKbHFET1M3SXJvMVlFUHNwRDMwVnZLUWFqZlRr?=
 =?utf-8?B?b21OdXF5N0ZGamJDYUVkeXBjZnloY2w3YktqR3h0NTdYMW1LQS90ZXdYOU1H?=
 =?utf-8?B?OHNjcWFTSnFBeUsydHpkSVF6NDNVeWF0czlEOXR0RnRKV2ZERThEdjRsRGVt?=
 =?utf-8?B?UFc0Z0RGN2U1UURMd3g5OXNOUExIbFBWL2lGck9od1Vab2pQcFNYMk9aM1F3?=
 =?utf-8?B?VDlOalRwdFpKVk5HL3E3ekd1NEZIN0YzKzlWZkRxdk5YdTVvYXMzOVlmWUJl?=
 =?utf-8?B?K2NKVFpoaEpQYzVlVmNhOVJDUHdpTFF1cC9yL0lUQ0lUM0lHSkZlb1c0eDlV?=
 =?utf-8?B?SDJDTnp3MmQ3MnVXb0JCc09sdER5ZG1wU3h3WnRBUEtmd3FxdEduT0N3M0Jx?=
 =?utf-8?B?K2dpOGhNTkhkaVNMRkRRcDhVOHlCdFIrZmJERVVadGxYWjNGSlRtbWtVckZC?=
 =?utf-8?B?MU91TDZwUHlCSXZtZXNOdk8xZmRacE53bFVZSER1dkpMWEUrT3pYeDlHSjM1?=
 =?utf-8?B?OFVldlRreC83ZE5oMkQrWlhxWG80TXBpU2FqbXFVOUx5OHFicWQ0VWxieDJZ?=
 =?utf-8?B?MWFTSFZtYVdYSGVsY2xGNk1vZnY3L05BVzRYV3FRWGJ0a0p4emFBTHRZUXJK?=
 =?utf-8?B?TjBmVUYrVVo0KzFXTElZMGs1VnkrN3E4ZEVaaDd6UWFzSDk0VGh4N2IrUWNS?=
 =?utf-8?B?bmZZVjVyeDJBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14647.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3JMUzdaejJORXY2SU00M3ZOUWEwMW9HdE1EeFlISEVhd0ZGU3VtTE1ac1Nh?=
 =?utf-8?B?bzBEeXJjaU1HeDV3WjVrWUY1SmV3Y251MCs3REN5aEpiemNqWHI5eDFFMmVU?=
 =?utf-8?B?NU4vVTRlRXZhdlRsQ2ZGMDhJcFY2VEhvSUZQdk5JK0pkcmx2cEpsb0lqd0pI?=
 =?utf-8?B?VVpqZTZESzhsaHZGRVNYaDZUelFjSHpCbE1YUmdheUJncTU4c0g3WVlxMkNW?=
 =?utf-8?B?MHBvWEtLcmxvd3RERzlaRTdmSTQ0TGg5bnlMaVRnUGZ6V0pJcEVHZ2dnc1NS?=
 =?utf-8?B?elhUWGwwbjNhTDRWdnorNjFvZ2Y2VFYrMUluWEZrZGljVlVQcFFvK0VFMStE?=
 =?utf-8?B?SnNLOURzdm55cHVkTmsrTy9YZm14Wm43K3lxaXE5dmY2K3NxaXcwMzNqNHRx?=
 =?utf-8?B?aXNxa2JaTHUvNzllYS8wdUJRNVRuaEplcitOaEdvL2R3S215bzFScU4wMVUx?=
 =?utf-8?B?MVJZd2JhdWVIR0o4eFkrTVVZOEJkaGdDVFFHNzk1N0o1blJFcEdSa3NHTDRY?=
 =?utf-8?B?cEVBOTJWZ3VXL1VueXo4N0E2c0JlVUJaQTRpYTVDL1RtMlNza3ZtSE9hRHlV?=
 =?utf-8?B?QTkxa1VxL0VNeGhIczN0Yis1ZDZvTnUyRy9zOTJtMlB2VUFxSWcwN1docjZV?=
 =?utf-8?B?VmZ0MFM5RGJYTktlNFNYY2hSOXRKL3hYY0pZcDIxeWcxc0VZVk5pbVFQSEhn?=
 =?utf-8?B?ZkJxZzluVVZvZFBEdWowM0JpYnh2aEl5NnBIZzIyZEN2S1ByNXRPeDFxbmZi?=
 =?utf-8?B?bDE2Yzc4Q0wzNjFqZ2s2bjJKa0ptNzJYQVVWZkNWUGhyZ012cC9HV011WHpr?=
 =?utf-8?B?Q1hjNS9ZSUZnV0lVU2M5OGRoMTFpTmphMm5WNnpLdzVzdXEvaDlNTlJXTTlx?=
 =?utf-8?B?Ynp2TlpobTBUWVBCMmtCOGdERUZSM21IaW0wVUpDWFBzdmdSZjV1OVpIcmtt?=
 =?utf-8?B?dXVKMG5rakJzZHBNT0w2dVQ2K0h5Qlk2KzhTdGYxMm1YTXQvQzhUVmJzdSsy?=
 =?utf-8?B?aVpPZElsVTlWSFQzamxEZ2k0dFkzZ0RlK25YZDdGSXN3WGl6Y2dkREZJa0dL?=
 =?utf-8?B?NnhvR1J0Mi9lbloxdk1DSFJwQ3NtbVdyOXAvMXlLalFadjlKMTJTZkY0M1pO?=
 =?utf-8?B?OVRjWHFLNFlsdVAwcStMVXM2V2RnVURvTW1qUXJhQWhNTmZtTzhrUS9MZ05U?=
 =?utf-8?B?cCt5VVNxRERZUFJSaW5CaWcvemE2L2Y5UXhBTVNRRzIwYXdpNE1SUlQ3MVJr?=
 =?utf-8?B?S1hidmxYSGNhNEQrcVJjc3dCclBQSnVhR254blkrVmsrTnZhb00rTmFQTE1t?=
 =?utf-8?B?NFo2UEYwNUFkcW1GMDlCRTc0dXJUdVBNWnBNVmQ4K0FaZit6dXhPbDlORTgw?=
 =?utf-8?B?cWFYYnpZT1phS3dKNk9vNHE1c3hUQWRCMGR3RDBGNkF6WVVDMmZOb0ROMGFL?=
 =?utf-8?B?OWhVYVFpc3ZzNTZMU3phM0FubFNaN3o4YUF6N1MzTEhvM0xzOHU4c3NYU0I0?=
 =?utf-8?B?TW5QOS9tTWw3UHJkbnNhOENtVjZHeVNxTVBNWFFuUjEySUFJZnpwZjRmMHlt?=
 =?utf-8?B?R3cyQzk2SGNldng2Y1JTaTZ1NkY4bWJWa2hzOUZBSFNRN0tETG1tM3BjWjk0?=
 =?utf-8?B?ZjIxSnNlNFpRU0dhWHF0dXFGVFlCazFPZmxTb3dwYnJRcWI5RURaNldzcFJF?=
 =?utf-8?B?eVNrSGFFMWw2SXpsTURNTHk4REF1ZHY2TzNqS3pzdXcyQkhnYjI0Wk55VUtM?=
 =?utf-8?B?YkpMUEVTelNCTW9TQkpvVHg3TUtkUTMyZGNkd2xBeVJSNFlWVFFiUWpRd3lF?=
 =?utf-8?B?UTRoL1dsbVRvbjhXRkJqb0J6RkxYQVhUUUQ2NWYySnR3amtwUHA2STVkYksy?=
 =?utf-8?B?WEJBc3l1RkRBNGJ6RkJUYmRFR3FmZVdiYnBKS1pmZXptV2R3UUhDL0h5T1BJ?=
 =?utf-8?B?SmFkMU5saS85Y1d0OVJDVk9PUFp0REtHRXBzUXQ1ZW45UFVtdExqekFySHJO?=
 =?utf-8?B?RTJpOEY0NWR6U0prUC9aOTJTdnZabzN3bEVWMUhlM1VGVnhpWFFOSHEvR2M4?=
 =?utf-8?B?MCsrTjVBQkZTSFRzVTByUGYwZmRNM1FvdjJZcng3Q1RTN1J1aG9hTlNFQmg5?=
 =?utf-8?B?ZUdwdDEvUHNHbGxtY1hRYy9SUXZhSStOczg4ajYyM0lkUjVWWDB4Q2tZZ0ha?=
 =?utf-8?B?aUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cad438-78ad-4b0e-c4f2-08ddb7f25f73
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 16:22:56.7665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I28h95iJvOGf+hIspsz8s7dBSXCqlJ06Tqd3xhhyp8aBZ8pG5X8IxRyF7VJH0LZuFwmnbOURgBLFg71fVpmGqjJycGWmVpz9zi7h/tG/IqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13848

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBK
dW5lIDI1LCAyMDI1IDU6MTkgUE0NCj4gVG86IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBi
cC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzNdIGNsazogcmVuZXNh
czogcjlhMDlnMDQ3OiBBZGQgY2xvY2sgYW5kIHJlc2V0DQo+IHNpZ25hbHMgZm9yIHRoZSBHQkVU
SCBJUHMNCj4gDQo+IEhvIEpvaG4sDQo+IA0KPiBPbiBUaHUsIDE5IEp1biAyMDI1IGF0IDEwOjIy
LCBMYWQsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+IHdyb3RlOg0K
PiA+IE9uIFRodSwgSnVuIDE5LCAyMDI1IGF0IDU6MzTigK9BTSBKb2huIE1hZGlldQ0KPiA+IDxq
b2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+IEZyb206IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IE9uIFdlZCwgMTggSnVuDQo+ID4g
PiA+IDIwMjUgYXQgMTI6MDQsIEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2Fz
LmNvbT4NCj4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiBPbiBXZWQsIDExIEp1bg0KPiA+ID4gPiA+ID4gMjAy
NSBhdCAxMTowMiwgSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0K
PiA+ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+IEFkZCBjbG9jayBhbmQgcmVzZXQgZW50
cmllcyBmb3IgdGhlIEdpZ2FiaXQgRXRoZXJuZXQNCj4gPiA+ID4gPiA+ID4gSW50ZXJmYWNlcyAo
R0JFVEgNCj4gPiA+ID4gPiA+ID4gMC0xKSBJUHMgZm91bmQgb24gdGhlIFJaL0czRSBTb0MuIFRo
aXMgaW5jbHVkZXMgdmFyaW91cw0KPiA+ID4gPiA+ID4gPiBQTExzLCBkaXZpZGVycywgYW5kIG11
eCBjbG9ja3MgbmVlZGVkIGJ5IHRoZXNlIHR3byBHQkVUSCBJUHMuDQo+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gPiA+ID4gPiA+IFRlc3RlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIE1hZGlldSA8
am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gLS0tIGEv
ZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwOWcwNDctY3BnLmMNCj4gPiA+ID4gPiA+ID4gKysrIGIv
ZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwOWcwNDctY3BnLmMNCj4gPiA+ID4NCj4gPg0KPiA+ICJU
aGUgY2xvY2sgZ2F0aW5nIGNlbGxzIHJlcXVpcmUgc291cmNlIGNsb2NrcyB0byBvcGVyYXRlIGNv
cnJlY3RseS4gSWYNCj4gPiB0aGUgc291cmNlIGNsb2NrcyBhcmUgc3RvcHBlZCwgdGhlc2UgcmVn
aXN0ZXJzIGNhbm5vdCBiZSB1c2VkLiINCj4gDQo+IEhhcyB0aGlzIGJlZW4gc29ydGVkIG91dCB5
ZXQ/IEkgc2VlIG5vIGNoYW5nZSBvciBtZW50aW9uIG9mIGl0IGluIHYzLg0KPiANCg0KWWVzLCBp
dCBoYXMgYmVlbiBzb3J0ZWQgb3V0LiBJIG1lYW4gdGhleSBvcGVyYXRlZCBwcm9wZXJseSBhZnRl
cg0KYWxsIHRoZSB0ZXN0cywgZXZlbiBhZnRlciBTMlIvd2FrZXVwIHRlc3QuDQoNCldoaWxlIGF0
IGl0LCBldmVuIHdpdGggT0VOIHBhdGNoZXMgYXBwbGllZCwgSSBjb3VsZCBub3QgcmVwcm9kdWNl
DQp0aGUgaXNzdWUga25vd24gdG8gVjJILiBUaGF0J3Mgd2h5IEkndmUgYXNrZWQgaWYgeW91J2Qg
cHJlZmVyDQpERUZfTU9EX0VYVEVSTkFMIGluc3RlYWQgb2YgREVGX01PRCAod2hpY2ggZG9lcyBu
b3Qgd29yayBvbiBWMkgpDQpmb3IgY29uc2lzdGVuY3kgd2l0aCBSWi9WMkgsIEkgY2FuIGRvIHRo
YXQgYXMgd2VsbC4NCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydA0KPiANCg0KUmVnYXJkcywNCkpvaG4NCg0KPiAtLQ0KPiBHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlDQo+IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMNCg==

