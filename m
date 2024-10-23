Return-Path: <linux-renesas-soc+bounces-9998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0E49ACAB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 15:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73B4D1F21206
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 13:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252F81ADFEB;
	Wed, 23 Oct 2024 13:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ElYQQDmx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB0E1ADFEA;
	Wed, 23 Oct 2024 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729688675; cv=fail; b=EUdWgsgpSwAJiljELa5RTDcc0Oj1HhwSUcLO5cqGDECHBW1b5njmPNSwGpwJnvbMp4LM3nfhj9HieBqd6JxskQFtqqbWki/J1aOom8fMSUvLjtxbwf5imD9/JCJsnOIGDQuwO4E3PghD7ZG4z8GsToH2cdYCeHPBgjsgawxdipo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729688675; c=relaxed/simple;
	bh=s4SsT348T6mDL8v36HQLUb2t6tyowGsXZrH+3jMYQ64=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gCeSHGDoJoKNen88QKXFdMR+WE8198rjLxMdOJw6r9xvIXcucWGWOFWyCsTqsRo+L4Xfy043Jl9R8bdyFU1MA9kVnS+N/2Q1Ibuttx/NPVW2G6p3e4daShZQoc14z4Tb12uvLy8fUKBuAZEUSZR/N3AsiMTzAzLkk3ERKrvXpS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ElYQQDmx; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAoK7ZUvbNtr4jpdZDdiDjdG4TAvMpsaIE4BvbpjKdJKISxd1ty4AE+OJvYFBElTntm4Io/iEdfJYAOPHcKPNeIsSx1twFLzS4qlarSjsEOR8GlKCi4df0EMNwerWB5EvsNb9Ulhc2NprO8UGVXUmAs28zsy8C7QoZgPE9Fp1Vp8xQj9qhNy00Bfzq9+XFFElNnwE3YLvL5Nie2q/PEJ2lhnF0x/4433FSBc/InRqWPIlHnbyOgGsiVaKongPa2ddsB2GTWCONQr1RN+NMmcaKTZdI4iMBSPVc2Bw8uIb+tnDeavFQ+P3kbmZXVa8l2F8X8hKAC+bLn/7LApRoe9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4SsT348T6mDL8v36HQLUb2t6tyowGsXZrH+3jMYQ64=;
 b=SjSK3yPLdmLslpIXX3uhkfpU85PXRRDOKxVRJicCoYBx/PxPEjBdpgbPsyYKVqUpJzMay2SRCtEFHXRUFymE3bED9W/5Rs21eR4ENqc5p3j75Z96tobc5NrGomhY5zn3fsyIgkHKVeg+gID0Lc/Rvlyp2pp3+mh4quIQxMpmchbtHat/MiYwGXVynNGmjd3V6ajBRP5QqQmjEMbB2dO0RCKUi2bnJVzdQlQQ8HYBsJN0Ov1uLNMCGQX+QxW0OCiZQD2URIfxngc3KvaHAhVwgh65GfsiJG06q+RXSCBjVzZRxHjA0DxC+QH/mmmUZtgBETHe6kaykGvJPNd0zLrWag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4SsT348T6mDL8v36HQLUb2t6tyowGsXZrH+3jMYQ64=;
 b=ElYQQDmxHCRNJiLSMG5DiTWrEDP6PxHQ2JT3X+RWV+ePjnWLV1NILopRMgAkCRu6MQ1nkCtauTtcQpxjSDUXYZS0Le8wV5nZQWdG+0dCyCK+9s6/OJg7y/i+qgG1BFWbQV4l8gz303s9w1rgncV+nBbOV5BYlQO9VM1/0EOgrTE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6503.jpnprd01.prod.outlook.com (2603:1096:604:100::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 13:04:27 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 13:04:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Thread-Topic: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Thread-Index:
 AQHbGaIZmx0KhA/2XUiyPZAzZz+L/7J9FRWwgAAGadCAAC1egIAA3vUAgAACHjCAAAk3AIAC+5uwgAAB5QCAAAGLMIATMLrg
Date: Wed, 23 Oct 2024 13:04:26 +0000
Message-ID:
 <TY3PR01MB11346FA2A49CEF90C98EF9335864D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241008164935.335043-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A1726BCE1687C6AFF519867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113469ABB6393E0A6451034A4867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vWpUmq9esgcnjWVcPb-jUaLuKvhJF2VwiWrCx5_nOtww@mail.gmail.com>
 <CAMuHMdULuCWd1V0Az=NWHhSb7voDKbTo9rp3Excntp7qvTbbuQ@mail.gmail.com>
 <TY3PR01MB113460ED98BB6EE2575D0CBC7867F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX8rCM+yG4cwtG9yogwz0xWqD3O0aiXNMwE9Vkcpyhrkw@mail.gmail.com>
 <TY3PR01MB1134648DE5396A9ED9227BEB186792@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWa0=pKfY=RL1NYXP+EBz6AK-6Br4wy4d_g4XwoCyW9og@mail.gmail.com>
 <TY3PR01MB1134642E82FBCF217DFD8A75386792@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134642E82FBCF217DFD8A75386792@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6503:EE_
x-ms-office365-filtering-correlation-id: 71fddf60-3866-4168-3e84-08dcf3633964
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ym81NGdkLzlrOTdTUHZSVHJxN2c2aTY2TFpla25Yd2hONTlhb1BQRFRvTTZ1?=
 =?utf-8?B?cG0yVXJCcDlXVmMzUERnc29QaVF1eXA2d0ttazErZVpBVUwxRlIwUW4xMWxo?=
 =?utf-8?B?OUkxZDl1WFZwUVBUZ0pDbll0RXVoc3d5YkE3T3E4SjdraEFKamhKdFBNVUN6?=
 =?utf-8?B?SmNyQUtmeFB3RDRNN0d1ZXh5NTVQM1VHYWZMbXREVHp0c1daM1FGb2NKRUda?=
 =?utf-8?B?b2w5elZmcEwwelhwdlEzUHFFSEZJYk45KytDNFhoR013TGE4MTEzSFhKWkRr?=
 =?utf-8?B?NE15bTBWWWxGL09PWnl5Q1ROVFNwdS9paWs2bEsxejFnMWF6RWlqUnpJSlY0?=
 =?utf-8?B?Z2hpVWFKU04wNjZWVFdEdFY3ZUJENmxLQzB5akhJYjgrN3l2OTA0NFJsSU5n?=
 =?utf-8?B?ZHZqZHJ3azMyKzJzZVV0SFFsMmp6Qjhrd0JRVWFLOGtYOXRudnA0Wk5GakJx?=
 =?utf-8?B?eitWaEp4ZmNTMVprSzhFTXNrVDl4aFA1M2lmTEEzNkxqV2pQcVNuRUhDRnpr?=
 =?utf-8?B?b2pLUnBGYVFlSkNUYzhWUTJ6VmJGZENzVHYyVkE0RlM1Q3NNR0NKYU9TaEF3?=
 =?utf-8?B?M2xqeEVFQ1gwaFlPMldZZUdVYnVHT2lpOVdwamdjcklUQUkzMHFLTE1JcGdi?=
 =?utf-8?B?bzdRbnZEV0tGckIxVmRBSUlDckVZOS9MK0FucmhRemE0Uy92ckhORFd0M2NJ?=
 =?utf-8?B?SzErVC9IUFhiUjhHR2ltVjYyL0xGamJCRFVlQURaZXU3ODlxTW91MndOMmJ3?=
 =?utf-8?B?Uk5SZ0NaTFlCRXRXVGN6RDVWNFE5N2ZGZHUxWW8yNHR3Y25TeVVzcHdROTQr?=
 =?utf-8?B?VHpkZGI3dmRsVDZtaGpnSFZnRjVGUzNnclFWbG1PSmxSK3k5MllxVk8wanZL?=
 =?utf-8?B?S1hPeTFJTndHUzFhV05HcVcwKzM4RVF5V2VlVnkrems2NGMyS2hJSmlkNlg4?=
 =?utf-8?B?aktlSzB1aWRndUxRNDNSQUFLb2pQVHZrNGptcEQvZDNBZDFVemw2bkZXbEd6?=
 =?utf-8?B?cWFLRUFkbUdMeWZYRDNuQ2tEWHRXN3hqL1dUblpUenRycVBEMUlVdGRsMEJO?=
 =?utf-8?B?NGF5WlRlQkZ3WVRsdlNEdGVMY3gxVEg5dUFDQ1pFZ0o4OEloQVpuMlZhaU01?=
 =?utf-8?B?RDJ1RFlOaUFuVGUwaWxRRTdOYmZ5emdHb3BzMVh3dmttKy9wcWhGT2hkMXl6?=
 =?utf-8?B?WEZINm5QaVpHRnpRNThUNGtkOFlNdXRJaUxzZWxpbGJMdGFlWUFqL1Z0K3M1?=
 =?utf-8?B?eE5ZR1hZQUYvMTh3YVdYb096d2hHZFpZZ053Y1l2WU15bHQ5MHI3dTRvSDNG?=
 =?utf-8?B?VGdQazl5akRkZ3VobmRXaFlQdXdqN3ltTTZaNUZyanZ6bk1pakVua01LM0xk?=
 =?utf-8?B?TzZxeGFyY0V0b3RxS2VsenFZdVZBVmxVUFI4MlFyNTYyZnJxWU9uaEIyUi9X?=
 =?utf-8?B?Y09QZlNRS0Z5L2ZEZjBrTHpXOUVGZzNQT1hPKzJBVEVBaDNUU1c5bGNRdml5?=
 =?utf-8?B?Ym9ZdlAyckd0WjgwdnBpekV2ellaeHk5R09EQUFhRUpJTVUxTzV0R2NWbTg3?=
 =?utf-8?B?RzgzN1gzK2xiYlFVRUNaWXpyNm9wRkY2cFRyNCtkZHgxcHR3bXZ0Z0RXVkts?=
 =?utf-8?B?dTQrZndkYWJ6TmdyQzJXTHVkWXZUMmhoaWZyM2VxN0dVQWFiTEhxdGRSOXdZ?=
 =?utf-8?B?bnAvNE1zY3AzN2ZDRkRMbCtMaDlIUGVyQUlnaGdudEZ5dm80U2pVYVhGL1VO?=
 =?utf-8?B?L3JzdS9yTTlZTGNuYW1SaUJYdzhhNnlyNUJxQ0xXQTRiVmhGZWMxVHZXa0Jv?=
 =?utf-8?Q?TEG8d7y2jHusinzmEp39YbucT8J9+DhxNEAvU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWhYbC9QbWYwdjVZQU9MeUM2WjNDOTh2SFpxRytscStaZC9idy85Sy9FaDBt?=
 =?utf-8?B?ZXJocGpZbUdLSndXQmV4NU9WUFRVY2xQTVhWcW9ka2EyUXhMQmkrWFRvRXpD?=
 =?utf-8?B?aUFmRllnUGI5T2pJZWFhYWo0eHY1MDNBTnorTHc0OGRQMGRDaWNSUXdFYjBT?=
 =?utf-8?B?TzNxdjQ0REJTQ0ZKRVp5N3R0c01NUDdZWkhJVEh1TDM3Q2VoRmxOcmVjMHVw?=
 =?utf-8?B?QkxDbytudDU4ajlYT3ozajNoOUR1b1lmdW91QnhjdmFadkthckVOOEhKWWpM?=
 =?utf-8?B?cHJpczdCdkQ5RmJ1Sy8yd0tvL3FDVGVnUEVNTGw0RUFzZG9WekxPcUtpclZI?=
 =?utf-8?B?eE12TlJpaXAweVFCWGNIZlZEdXAxRC83TjVQQ0tlZ2FEalBOcUdZR3RsSW04?=
 =?utf-8?B?TUpPOHcyaGc4SC8vaGdWVGdHUWc4OWFGd3QvUWZxTUt0OFZMR0RuODBqNW4r?=
 =?utf-8?B?UFRSUERhL2lrNTNWdnlNUEc3eGRHRjl6c3ZKNWRoL1l4TmR2NlpzeCtCRWdW?=
 =?utf-8?B?Zy8rS3VUeTVtTGhwN0lTbzl5OUNuVTh4WkN1WkNCSVZnclRmb1p0aUFaMm5W?=
 =?utf-8?B?RGRZY25OL0pvSmRoTmVpUS9nQ0wxa2F6MzBaUWtIOE1oYkQ0ZFh1K1FvZkha?=
 =?utf-8?B?enB0WEUzOVc3WTVWWGU5Vi9PbFcydWdUTG5iV0xVY1ZoMmFTdm5XZDhEQnZN?=
 =?utf-8?B?aDlJT2thcmcrZEhwaVBYamtyWW96a1JZQWRnVDVtMVNUTkErZ0YrakVQZDB1?=
 =?utf-8?B?UmkzV2lQek5GVjhPbVRraURlNkhra1dTa3NzbHVoZVFCWDJMUm9YMWtwQnZj?=
 =?utf-8?B?M0lPMlR5aXBOQzJPVGVMa1lNYjZKRW9WUFhqeTlCcFlXeTA1WHdJeVRCTWxv?=
 =?utf-8?B?NVowTWxtK3g2Z24wMWRJbklqU1ltVkpjVlNiNy9hQkQxRGZjWDZJZURLb0Rq?=
 =?utf-8?B?cXQ1OFVWWDVNOGZ1RHNuZWVQOCtuTXEvKzVSdVFzdkxydTBTN3Ryb3ZCQ3lH?=
 =?utf-8?B?YTZTSC92QUI0elBOejBXOHEvbU9PVi9qcGV6OWllTFBybFRtU24zZ2orWGcz?=
 =?utf-8?B?UUo0clRZem10ckl0RTJKMG1LWC8yV21aTXZITXhWWXdTSFZpc3kxNlNRMUFm?=
 =?utf-8?B?dzFOUXVnNXpJYXlkaCtibHdKMXdhZjdQTmE1c3V0akFUam1Yd3piTFREbk1a?=
 =?utf-8?B?N280aDhJZ3JZY3FkVExKN1AyUmtwemV0ZTlQRU0zeWFoQXFCTEdGekRkdU82?=
 =?utf-8?B?UmhwSUNDUUlQc1lrL2cyWGxYOUJCUkRud21Wa0t0MktMK2lXUkZPb2VXTnVF?=
 =?utf-8?B?cWZzVWRCc0VWQzdpT3V5WHRmai9vTG1jckxQMXNDMnVWeWZZQjFkNnpkTUJE?=
 =?utf-8?B?bGxyUnYvV0QxMEt2L0kxRUl3U1FycDdpbUpDdmVpeUFIMkVLS2xoZDBOT3M0?=
 =?utf-8?B?TDVaOVdTRU1IUm1oMERWZkUyZkRQdzN1clVuUm9wZjR2aGVLeWtLTS82OThz?=
 =?utf-8?B?bCtjQkxwUlRBSGx2SFV2ZXlYWHE5L1c2SERlTG9qL2REM2Vtd2pPdVVIVG1p?=
 =?utf-8?B?M0dEaG42dk9uTXVQQ0JTejRNUVFGaTZwTGk3bnBaNS9MZ1htOExrUitNdDh3?=
 =?utf-8?B?dU93Y29EWDdnOVo0bnNBZ3dJMVBmQmVPOXk4WUF5clBZK0t1Rzc2R1d2ZG1O?=
 =?utf-8?B?Rkpsdkh4WXJhNmxoOHhYeFRvYlNuK3hMSndzZ2ZMcDJLODF6UXRDdk5uN29y?=
 =?utf-8?B?RTlJVzY3RFF0NkFSYzBvRHBuRE9kUm1TSE4vUDcxTFBoZS9CQ2MxMHUrOVA4?=
 =?utf-8?B?NUVHamdXSlU4bkMrdXBkYmZJcytDMEhqTWZWRDByN0hZQkRzNnl6akFhTXpY?=
 =?utf-8?B?andmNXRBd212YkNYeW1LeGQ4aFVaekRMRnpHeWd3NEdodjVyb3NZK0svZkw5?=
 =?utf-8?B?SjBmbDFUNW5IeHM4cDZnYysrTWZrYTJPL1ErOUluSHQ1RXRoTG4rZElsdTY5?=
 =?utf-8?B?VU8yRWtxS2NES1A1eDE0ZG9jaW9KV2FuNUEzY0tPTXRXaW54OVNXRVZHSEp5?=
 =?utf-8?B?U2h6N0NObzk2aHg4QzV3K1lYOGZZWXpCOUJGYlFHNVpzMW95NGhIWklDTG1n?=
 =?utf-8?B?YlFodUdhbWxtR2dtZmllaFZBMzVucmhPQmhscWhTWW9Jdmh3MHlnODQ0MlVS?=
 =?utf-8?B?aWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fddf60-3866-4168-3e84-08dcf3633964
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 13:04:26.9750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9buFnZ4LIXMXtix8sX/ydTu/f6k8GFx3LsdrDTOch+OXzHwcj+qXLM4+1IkRPWCd8bdcSj8u+TNdxIYKU0fV3fvre1LhkWv5Ivn14S+oLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6503

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIg
MTEsIDIwMjQgOTowMCBBTQ0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHYyXSBhcm02NDogZHRzOiBy
ZW5lc2FzOiByOWEwOWcwNTc6IEFkZCBPUFAgdGFibGUNCj4gDQo+IEhpIEdlZXJ0LA0KPiANCj4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDExLCAy
MDI0IDg6NDggQU0NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBhcm02NDogZHRzOiByZW5l
c2FzOiByOWEwOWcwNTc6IEFkZCBPUFAgdGFibGUNCj4gPg0KPiA+IEhpIEJpanUsDQo+ID4NCj4g
PiBPbiBGcmksIE9jdCAxMSwgMjAyNCBhdCA5OjQz4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydEBsaW51eC1tNjhrLm9yZz4gT24gV2VkLCBPY3QgOSwNCj4gPiA+ID4gMjAyNCBhdCAx
MTo0MeKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+
ID4gPiA+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3Jn
PiBPbiBUdWUsIE9jdCA4LA0KPiA+ID4gPiA+ID4gMjAyNCBhdCAxMDoxMOKAr1BNIExhZCwgUHJh
Ymhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+
IE9uIFR1ZSwgT2N0IDgsIDIwMjQgYXQgNjozM+KAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBGcm9tOiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPiA+ID4gPiA+IEZyb206IFBy
YWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiA+ID4gPiA+ID4gPiA+
IEZyb206IExhZCBQcmFiaGFrYXINCj4gPiA+ID4gPiA+ID4gPiA+ID4gPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gPiA+ID4gQWRkIE9QUCB0YWJsZSBmb3IgUlovVjJIKFApIFNvQy4NCj4gPiA+ID4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWth
cg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVz
YXMuY29tPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4gPiA+ID4gdjEt
PnYyDQo+ID4gPiA+ID4gPiA+ID4gPiA+IC0gU2V0IG9wcC1taWNyb3ZvbHQgdG8gODAwMDAwIGZv
ciBmcmVxdWVuY2llcyBiZWxvdw0KPiA+ID4gPiA+ID4gPiA+ID4gPiAxLjFHSHoNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcjlhMDlnMDU3LmR0c2kgfCA0MQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiArKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDEg
aW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBk
aWZmIC0tZ2l0DQo+ID4gPiA+ID4gPiA+ID4gPiA+IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I5YTA5ZzA1Ny5kdHNpDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGIvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I5YTA5ZzA1Ny5kdHNpDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGluZGV4IDFh
ZDVhMWI2OTE3Zi4uNGJiZTc1YjgxZjU0IDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+ID4gPiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU3LmR0c2kNCj4gPiA+ID4gPiA+
ID4gPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1Ny5kdHNp
DQo+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC0yMCw2ICsyMCwzOSBAQCBhdWRpb19leHRhbF9jbGs6
IGF1ZGlvLWNsayB7DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgIGNsb2NrLWZyZXF1
ZW5jeSA9IDwwPjsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgIH07DQo+ID4gPiA+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAvKg0KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAg
ICogVGhlIGRlZmF1bHQgY2x1c3RlciB0YWJsZSBpcyBiYXNlZCBvbiB0aGUgYXNzdW1wdGlvbiB0
aGF0IHRoZSBQTExDQTU1IGNsb2NrDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgKiBmcmVxdWVu
Y3kgaXMgc2V0IHRvIDEuN0dIei4gVGhlIFBMTENBNTUgY2xvY2sgZnJlcXVlbmN5IGNhbiBiZSBz
ZXQgdG8NCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAqIDEuNy8xLjYvMS41LzEuMSBHSHogYmFz
ZWQgb24gdGhlIEJPT1RQTExDQV8wLzEgcGlucyAoYW5kIGFkZGl0aW9uYWxseSBjYW4gYmUNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgICAqIGNsb2NrZWQgdG8gMS44R0h6IGFzIHdlbGwpLiBUaGUg
dGFibGUgYmVsb3cgc2hvdWxkIGJlIG92ZXJyaWRkZW4gaW4gdGhlIGJvYXJkDQo+ID4gPiA+ID4g
PiA+ID4gPiA+ICsgICAgKiBEVFMgYmFzZWQgb24gdGhlIFBMTENBNTUgY2xvY2sgZnJlcXVlbmN5
Lg0KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICovDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICBj
bHVzdGVyMF9vcHA6IG9wcC10YWJsZS0wIHsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJvcGVyYXRpbmctcG9pbnRzLXYyIjsNCj4gPiA+ID4gPiA+ID4gPiA+
ID4gKw0KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICBvcHAtMTcwMDAwMDAwMCB7DQo+
ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgb3BwLWh6ID0gL2JpdHMvIDY0
IDwxNzAwMDAwMDAwPjsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICBv
cHAtbWljcm92b2x0ID0gPDkwMDAwMD47DQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiA+ID4gTm90IHN1cmUgQ0EtNTUgY2FuIGNoYW5nZSB2b2x0YWdlIGZyb20gODAwbVYgdG8gOTAw
bVY/Pw0KPiA+ID4gPiA+ID4gPiA+ID4gQmFzZWQgb24gUG93ZXIgRG9tYWluIENvbnRyb2wsIGl0
IG5lZWRzIHRvIGJlIGluIEFXTw0KPiA+ID4gPiA+ID4gPiA+ID4gbW9kZSBmb3IgY2hhbmdpbmcg
dGhlIFBEX0NBNTUNCj4gPiB2b2x0YWdlLg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
ID4gPiA+IFRoZSBtYW51YWwgc2F5cyBPRCB2b2x0YWdlIGlzIDAuOVYgYW5kIE5EIHZvbHRhZ2Ug
aXMgMC44Vi4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBJcyAxLjdHSFog
aXMgTkQgb3IgT0Q/DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiB7MS43LDEuNiwx
LjUgR0h6fSBpcyBlbmFibGVkIHdoZW4gVkREMDlfQ0E1NSBpcyBhdCAwLjkgVg0KPiA+ID4gPiA+
ID4gPiA+IGFuZCBmb3INCj4gPiA+ID4gPiA+ID4gPiAxLjEgR0h6IGl0IGlzIDAuOFYuDQo+ID4g
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBNYXliZSB3aGVuIHlvdSBkbyAvMiwgLzQsIC84
IHVzaW5nIGRpdmlkZXJzLCB0aGUgdm9sdGFnZQ0KPiA+ID4gPiA+ID4gPiA+IG1heSBiZSBzdGls
bCB0aGUgc2FtZT8/DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gSSB0aGluayB5b3Ug
YXJlIHJpZ2h0IHdoZW4gQk9PVFBMTENBWzE6MF0gcGlucyBhcmUgc2V0IHRvDQo+ID4gPiA+ID4g
PiA+IDEuN0dIeiB0aGUNCj4gPiA+ID4gPiA+ID4gVkREMDlfQ0E1NSBpcyBhdCAwLjkgViwgZnVy
dGhlciBkaXZpZGluZyB0aGUgY2xvY2sgc2hvdWxkbnQNCj4gPiA+ID4gPiA+ID4gYWZmZWN0IHRo
ZSB2b2x0YWdlIGxldmVscyBhdCB0aGUgUE1JQyBvdXRwdXQuDQo+ID4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiA+IEdlZXJ0LCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgbXkgdW5kZXJzdGFuZGluZyBp
cyBpbmNvcnJlY3QuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhlIGFjdHVhbCBWREQwOV9D
QTU1IHZvbHRhZ2UgaXMgY29udHJvbGxlZCBieSB0aGUgZXh0ZXJuYWwNCj4gPiA+ID4gPiA+IFBN
SUMgKFJBQTIxNTMwMCkuICBJdCBpcyB0aGUgcmVzcG9uc2liaWxpdHkgb2YgdGhlIHN5c3RlbQ0K
PiA+ID4gPiA+ID4gZGVzaWduZXIgdG8gbWFrZSBzdXJlIFZERDA5X0NBNTUgaXMgYXQgMC45ViB3
aGVuDQo+ID4gPiA+ID4gPiBCT09UUExMQ0FbMTowXSBpcyBzdHJhcHBlZCBmb3IgT0QsIGFzIENQ
VSBjb3JlIGNsb2NrIHJhdGVzDQo+ID4gPiA+IGhpZ2hlciB0aGFuIDEuMSBHSHogbmVlZCBhIGhp
Z2hlciBjb3JlIHZvbHRhZ2UuDQo+ID4gPiA+ID4gPiBJIGRvbid0IHRoaW5rIGl0IGh1cnRzIHRv
IHN1cHBseSB0aGUgaGlnaGVyIGNvcmUgdm9sdGFnZSB3aGlsZQ0KPiA+ID4gPiA+ID4gcnVubmlu
ZyB0aGUgQ1BVIGNvcmUgYXQgbG93IGNvcmUgZnJlcXVlbmNpZXMsIGV4Y2VwdCBmb3IgZXh0cmEg
cG93ZXIgY29uc3VtcHRpb24uDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVG8gY29udHJvbCBW
REQwOV9DQTU1IGR5bmFtaWNhbGx5LCB0aGUgQ1BVIGNvcmVzIHNob3VsZCBoYXZlDQo+ID4gPiA+
ID4gPiBjcHUtc3VwcGx5IHByb3BlcnRpZXMgcG9pbnRpbmcgdG8gdGhlIHJlZ3VsYXRvciBjb250
cm9sbGluZyBpdCAocmFhMjE1MzAwKS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgbmVlZHMg
YSBiaWcgd29yayhzZWU6IDQuNS4zLjEuMyBQRF9DQTU1IGFyZWEgdm9sdGFnZSBjaGFuZ2UpLg0K
PiA+ID4gPiA+IENBLTU1IG5lZWRzIHRvIHNpZ25hbCBDTS0zMyBzbyB0aGF0IGl0IHN3aXRjaGVz
IHRvIEFXTyBtb2RlKE9ubHkNCj4gPiA+ID4gPiBDTS0zMyBpcyBhY3RpdmUpIGFuZCBJbiBBV08g
bW9kZSwgQ00zMyBpcyBpbiBjaGFyZ2Ugb2YgY2hhbmdpbmcNCj4gPiA+ID4gPiBDQTU1IHZvbHRh
Z2UgYW5kIHRoZW4gc3dpdGNoZXMgdG8gQUxMLU9OIG1vZGUNCj4gPiA+ID4NCj4gPiA+ID4gVWdo
LCB0aGlzIGlzIGluZGVlZCBtdWNoIG1vcmUgY29tcGxpY2F0ZWQgdGhhbiBvbiBvdGhlciBTb0Nz
Lg0KPiA+ID4gPiBTbyBiYXNpY2FsbHkgeW91IGFyZSBzdHVjayB3aXRoIHRoZSBpbml0aWFsIHZv
bHRhZ2Ugc2V0dGluZ3MuDQo+ID4gPg0KPiA+ID4gRllJLCBJIGdvdCBjb25maXJtYXRpb24gdGhh
dCAxLjdHSHosMC45ViBpcyBOb3JtYWwgZHJpdmUgYW5kIEl0IGlzDQo+ID4gPiB0aGUgZGVmYXVs
dCBmb3IgUlovVjJIIGFuZCB1cGNvbWluZyBSWi9HM0UgU29Dcy4NCj4gPg0KPiA+IE9LLCBzbyBu
byAidHVyYm8tbW9kZSIgcHJvcGVydHkgaXMgbmVlZGVkLg0KPiANCj4gInR1cmJvLW1vZGUiIGlz
IDEuOEdIeg0KPiANCj4gIjEuOEdIeiBjYW5ub3QgYmUgc3VwcG9ydGVkIGJ5IENBNTUgb25seSAo
Q00zMyBpcyByZXF1aXJlZCkgc28gdXBzdHJlYW0gdGFyZ2V0IGlzIDEuN0dIei4iDQo+IA0KPiBT
bywgd2l0aG91dCBDTS0zMywgdHVyYm8tbW9kZSBpcyBub3QgcG9zc2libGU/PyBXZSBhcmUgcmVj
aGVja2luZyB0aGlzIGFuZCB3aWxsIHByb3ZpZGUgZmVlZGJhY2sgb25jZQ0KPiB3ZSBnZXQgaW5m
byBmcm9tIEhXIHBlb3BsZS4NCg0KDQpHb3QgdXBkYXRlIGZyb20gSFcgdGVhbS4NCg0KRnJvbSBI
VyBwb2ludCBvZiB2aWV3LCAxLjhHSHosIDAuOVYgaXMgb3ZlciBkcml2ZSBhbmQgMS4xR0h6LCAw
LjhWIGlzIG5vcm1hbCBkcml2ZS4NCmJ1dCBmb3IgYWNoaWV2aW5nIDEuOEdIeiwgQ00zMyBpcyBy
ZXF1aXJlZC4gU28gbm8gInR1cmJvLW1vZGUiIHByb3BlcnR5IGlzIG5lZWRlZC4NCg0KQnV0IHZp
ZXdwb2ludCBmcm9tIExpbnV4LCAxLjdHSHosIDAuOVYgaXMgb3ZlciBkcml2ZSBhbmQgMS4xR0h6
LCAwLjhWIGlzIG5vcm1hbCBkcml2ZQ0KYW5kIDEuN0dIeiBzaG91bGQgYmUgdGhlIHVwc3RyZWFt
IHRhcmdldC4NCg0KQXMgeW91IHNhaWQsIGxvb2tzIGxpa2UgdGhlIGN1cnJlbnQgcGF0Y2ggaXMg
Z29vZCBlbm91Z2guDQoNCkNoZWVycywNCkJpanUNCg==

