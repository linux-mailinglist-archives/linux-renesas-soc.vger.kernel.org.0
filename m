Return-Path: <linux-renesas-soc+bounces-18782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E62DAAE9DE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 14:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B86684A4FD1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 12:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4B92E11D8;
	Thu, 26 Jun 2025 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JPxqkJS/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F4C1B4F0A;
	Thu, 26 Jun 2025 12:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750942602; cv=fail; b=iKdqYdrAgOMdpyxNitLUBe99e3RNCH02NBbVx27X3nC1Oy0sNxEypjdnJ/0g0biwwluSgATRW/Tmu2c1vaVvpT3n58hNe8Whm3AzivWLrQu8tSlmbmpqUP4jiUERaZbWNRP+Zg9uVPkQLasgdPlsKWV3E92J6rzQv5USJidyCDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750942602; c=relaxed/simple;
	bh=iy22LSjywAxrbVjcHkxg6W/6N84Iwu9K9lzdx4sUPmw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zl6juDQ3qsZ57D81fu5gqQ3C/5ij+BBxGeSLdVZTwj6VpxA3R+9TXODQoMzSd91iVSBfwjScdvQaWLUl1v+3Ho8LU9S8htaN/dH6juuSgnBKWftS5UgX/PZ4Ey25pqmb0rXFN9RM8g7x1j9HPZCnzr8YPL5FRO7NDDk613CWyGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JPxqkJS/; arc=fail smtp.client-ip=40.107.74.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeAWa+eTXr7wvChM+efMJypbXI+k+e0CIeAugD6xESjMDhF/+k6exzbtKonRt3QrqMJOLq901xV1PEZpvMbN1WnaJ6rucaJrOyDkjhxttVJBC2S8qd0snFSpVGQdvhr+oXVNMLchBr/BcYOYlFemcqzVVBKTh5b9Our7hvgTbF6BfRgcVAZdSH6GFuozgtVy4ERdoQqKsL7SOGwk6a+qDEr4i4GICxIGGWxDmjrMJJ2M1lx5jQ55TBv9VwHS5CJd/5ViBbBHgxWdkVp/w66hMkxg44zf8bMV/DrmAmiDgDUjDYyhU+ZTQVlHNMvGT7qK4UEHfWEwVfNofGmhbPx8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iy22LSjywAxrbVjcHkxg6W/6N84Iwu9K9lzdx4sUPmw=;
 b=j864pskZijQ4Vx07ZQIECqUTJBPbpcYRy5ESAhqLJCziJoM5LdiVq3hsYvQuG3I2aaiVHPBLrd2tL2gEf376W3Nmv4fv7JiMhEvXKXar+0efI8CA66MKAJ41U+pJWeKh7y8gfa7WYT2bCOCcN98wD3qAs8dd3LIxRl6TOTBb0ix36Um1jiZaHgUV65bSoR1bYlvY9h6LWpOHcZTaDKgPQnT4ZvldCrw+QFQKtzOYMvhivtxs++7mOIUOt6KKE608iOPO50Kz4VIEo/KJDeDyZu9cgN7Hc54p6fp4vWtBQodIh0mBzb5ZaF18Hz6iQsYwkTG3snDJ76p1Rw2xtGYm1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy22LSjywAxrbVjcHkxg6W/6N84Iwu9K9lzdx4sUPmw=;
 b=JPxqkJS/F8qNA4zE61oUrA3A51I4Q3Ds222477358bSj6H7l4Bv4oafW9TTrlnTv4F5ycnB9UhgGhOtuzq4yGYYQaZ7hsInD2nGNJ9HhSf+Gzx2Kbnz7AfrZAyOmhBGP84cNzOQ4GmHRZbrAw44jVQbgIUm8Puwq7656OC1ikAg=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TY1PR01MB10819.jpnprd01.prod.outlook.com (2603:1096:400:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 12:56:37 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 12:56:37 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: rzv2h: Add missing include file
Thread-Topic: [PATCH] clk: renesas: rzv2h: Add missing include file
Thread-Index: AQHb5T4WHO3/0+BFX0OFixVLnCicaLQVZbuAgAADHjA=
Date: Thu, 26 Jun 2025 12:56:36 +0000
Message-ID:
 <TYCPR01MB12093BA2405F1735806898F48C27AA@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250624192748.340196-1-fabrizio.castro.jz@renesas.com>
 <CAMuHMdWrkacai__CL3HL5PotqAFfMSZ5PdXDtukjtAsce1LS_Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWrkacai__CL3HL5PotqAFfMSZ5PdXDtukjtAsce1LS_Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TY1PR01MB10819:EE_
x-ms-office365-filtering-correlation-id: 2ac6108a-b76a-4afc-2a72-08ddb4b0e2e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?TGFKUktVb0NMWVZ5UFVMWlFIQ3JMYnEzQTB0LzZJb3oyejhmVjdaVStvdCto?=
 =?utf-8?B?R0lEZXVFK3h6WlJOTEcyOUkzR0NwcW1MZW5UWFg3VkRoaFBXMk1FR0dmLzAy?=
 =?utf-8?B?K2lVQmowV1V2TGFaL0pmVWsrNy9ybkw1S3d3YmY5TVhmMWJZNEJ6am5MK3h3?=
 =?utf-8?B?bnoxdHlKL0FoY0hpaGRiYlNOQ2UrU2Z6Vm1ZaTB2cm8xeFRBV0xUV010M1hz?=
 =?utf-8?B?WFBvRHlBdEhhYTUzRnlwS3ZwWnVkQzFMcWNwem5PeThTREpBb003cExGbTFu?=
 =?utf-8?B?THJPMnFXTjNsQ2xKNExUa3VxNGtNRlRUeWJMRzlGMmQyNitPZUlYaTZsNFhW?=
 =?utf-8?B?T1V2eFJGcEMyMXNINzJLcFVlTmxBQ3M3QldLOFdnZWE0T0ZHRS9wZzJEVE5o?=
 =?utf-8?B?N3RWeXhVb0RVYmlUSVRVeGJya1drZ1BCeUNEcHpBK056aGZBWmdnbkpkRTRL?=
 =?utf-8?B?TENHWjBUdmhyT1dIVGt6SDNFaU54aDk5WVViUHAvWk5GTFA5bUM5c0ZYSmJI?=
 =?utf-8?B?ZDVRMW5CaEJtb3F1Zmx2dXc4NmZQOGYzT3VsdDFjNFZteEdrSU5wc1ZHakxS?=
 =?utf-8?B?Wnh3bW9oSEtRRGJpNmVURmZzY1FPRlNGTEdWaDJ3czNHeGxGNk01U091Z3do?=
 =?utf-8?B?bEVzWit4TFBabTE5OTA0UXBYUHMrUk1PdU9XOGxsTitxbzBiQjNNVi9zVGtM?=
 =?utf-8?B?eFppclZnZ2pTak1WSUpTaW1UeUNjRXlZYUltYXFxVnU4Qk1pdmY5QU16M0xu?=
 =?utf-8?B?Y2xlRGprV0c5VWdkWktFL0EvbmtzdjNBbVdyU2VsYms0OGRUMjVWYW1nZFdZ?=
 =?utf-8?B?WW9QYjJlZUlsV21oVGJUeXNoWWF6UVI0WmZmZklrR1R0SHg2cDNBenM0bGtv?=
 =?utf-8?B?RlZ4LzU3MjV5bUtqR1QvWDk3L3dPbkdMalpIYXMrZllzc2plcjIvTkt4czFL?=
 =?utf-8?B?Z0VwaG5vMDBBL0xrTTI3QzByLzdEMWpFb3psN0xJeFVGakhFVHo5R1lIUmpQ?=
 =?utf-8?B?NzhTZExHYmhLbStHenpCNnRoZ1NMZjRkY1BBeEdnRkF0YjVjcDNta0t5cGVO?=
 =?utf-8?B?QjU0eHg0UG9YVnF2SU1jZ2dqOXFHbjZyK1FmK0twTGR0am9PZS9WQXN5bEsx?=
 =?utf-8?B?N1hnOUpmK2liQ0xjakhsQkdVMzZnL043ZEtPNVE1WVdDV0dWSWlJZlVTUG1F?=
 =?utf-8?B?aVVIeVJHUHZBTkpndm5taG9EUFhSU2hkWFQ3ZkVZSC93NGRPUWFUaE5zRGlp?=
 =?utf-8?B?amFweHd5Qm5uY3JUZ1NpYkhuNmQxdVp3enRyOFNlTlA1b3ZoWnZhMlJkZWVs?=
 =?utf-8?B?NEw1ZlMrQkcwd2pZUUFOMUsxbVNmUE5CSmQvSlRuQTF1S3NpK3dtODJmZDZz?=
 =?utf-8?B?QTE3UW02ZkhwMG5tKzNvTzE3VGtXTW1aYS9kUzlqMUhFT2cyamNTK1d2T1dM?=
 =?utf-8?B?b3d6M041WGxlaWoxL3pPUDNCcjlINFM1dHZNaldvS21yY1VIWk03aVVRZGNx?=
 =?utf-8?B?ZDhVZ0t1UUdTN1JVT3JieHFKeTM5Q1F4NWlEaWxwZytTbXVRYUZZUnEyT2hK?=
 =?utf-8?B?eTVsWENoc2ZCcFNUTGJmSnNtTUZoNzBGNmtiYzA0SlZ2YU9zZjJTeE9Xd1RG?=
 =?utf-8?B?OWpmSEROWitkM1FWMG02ZUtCci9yNEJ2YjM3dEI4dnc2c1kxKzJNRVJJb0Z6?=
 =?utf-8?B?cml0YXcyT0xWWFNRTkxVVmlxSDlRbDdqZVVrU3JJcDRZL25FNnhBbmcwaDBD?=
 =?utf-8?B?Z0VxTDd0WnBSd1Yvb2hqallpRDE0M09CMUh3ZzV4eGJMMnF5Mjd4SHJGUWFK?=
 =?utf-8?B?eGNadDlKa0tLcURsTFVMS0FEMmh6NUhNQnBiQVFmY1oxSVo3cHo2QlhHUFFi?=
 =?utf-8?B?MUJkWUFQRDk5NTVRWU1hZFlqUkw5SFBXRlY4TW9lczZNM1RLU0N3L3paa3Fs?=
 =?utf-8?B?NU9MaFdQWVEzUW5oRnlVSXBHcDB0Qm11dDBma1RuanFOQmVlajlTdzRCaTNW?=
 =?utf-8?Q?aC6NiWlhfXxuFDUpmZFgCejyMWBDfw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFE0NnlyL29YM3FDMFBtZnMxL0lLaGRyeDRLQit4ajM3QkNSQXYyVkNibmZh?=
 =?utf-8?B?OUpWbmZ1bkpFWmNhaW8wdm5rUWE2UEhhaWFEN2VtTXhRblJSV3JDMW9yREJ3?=
 =?utf-8?B?NEQ1R2dWY2MvbUFUTFdGRGFKYXl2NjRXNVQySkhIMTZyM3B6NThaREtUejg0?=
 =?utf-8?B?Z3VCa3hObDdvblRYN0xNcElLNEY0OEpibng1dHB1eS9RR2QreEpFamQ3dVJS?=
 =?utf-8?B?VFlxdzlvRTB1WVNGY1AxelFxLzZhZnpXSk9xSkVTMEpFRFVhR0RDa1dlK05p?=
 =?utf-8?B?MEdYUnlmOHp6RUh6T2lXaW1XTmxIQVhwbEtnd1VmbW1LSVR0ODJwVkFnMHJx?=
 =?utf-8?B?WjE1WWxSTVhKUmQ1aTEvTGtCR25mTDBJc2ZhN20wQjJjbkFCSURXM1JuMUpJ?=
 =?utf-8?B?UnAxeEgva2xrdEhGT2RlTFhvN1RwN2ZhaEU3MGM0Mng4UXhqeG5FMTg1bjho?=
 =?utf-8?B?L0wrVlg4ZGUvZEpxVFh3eWdsZjRiSUZybjdPMmtHdndyK1g3d0x6Zy85Zy80?=
 =?utf-8?B?QXBSNVJrY1BhdVFNeFJnVm5RaFhuOVQxcU5qVUNJZlNQYlRIcld3SXZOQXVM?=
 =?utf-8?B?QmFndUN2Zi85ZUhOd3BjbkczSm1CeDVCRWVid3J1N1Rpd1g2VUxFT1plQUlJ?=
 =?utf-8?B?SllmRVlFeXptSXhPczRZWDlRb0xXOUtnZnFtR3JReFV6K09RY3prTW4yYXc1?=
 =?utf-8?B?c0VUMUhYV0pPR0FoUjRJUnlXY1B5Ui9KRThPMnFsWldYTU52eUNCWUtuRDcw?=
 =?utf-8?B?R092UHpDd1Nydlp3Tk1WS3U5dUVNdkdpeUdjUXFDL3dzajhyWmRCWUZINHJk?=
 =?utf-8?B?YzJYa01GMXYxSXVhRzRHb1I2akc0UWYrY2xCS3YzT0tYZGVOa0JDNWdrQW9V?=
 =?utf-8?B?cVVzeEhVUjJ2Q3hCQ1R3NVUrRXlDRjFIM2JCcG1IRVdQb0FYejNtMHBvRkRo?=
 =?utf-8?B?TDlwZDlCQ2E5MWNTUkZBNmpTdkVHZkVsanZMbGVLUHlQNkVMT1dON0tYN0F0?=
 =?utf-8?B?Mm84U0F0NnBUSUxITVlJd2VQek04UjM3dnNZdG1aWEdrcTgzeGRJMHdNVXhF?=
 =?utf-8?B?b29JeENaSlJuOUQ4emVVeWRKa2dYSTc5SnBmWTluNythTDR2bmVNeTBwL3hK?=
 =?utf-8?B?SGJyWTVvTEFyMGQ5K2szK3I2dk15ZUVhOCtVN3FUT25xS1ZJaWV6MFhmNWdF?=
 =?utf-8?B?MVZrUCswbm52MEc3R0VTd1AxRWxnMkk0TFdxQllOZUwwSGpOTG5zSSs0UnlU?=
 =?utf-8?B?Rjd0cERISjVscFlZMVdqOXJkWGFJR2tPUnpWZWpDSXdBTms3eFZGQ2NZOU4x?=
 =?utf-8?B?aHlOeHR6bnBEQmZPSTBVQ2J1djRRNko0c090TU1OMVZkUFhKSDh4TllWOVZ1?=
 =?utf-8?B?Mis3SDBDRHhGSGFEK0JuUGJZNUZ5SXBJNTZpam1EN1NueXBMZUs4WEVsdnB6?=
 =?utf-8?B?Y1lxbkZFZHJQKzkzV2VrVFVGUHhZRjZRMGRUdTZNNHZSM2JMdWRkNFd1QnRi?=
 =?utf-8?B?dGI0MFk3aGdRMTZDSlowamJqdlArMkdobGRRNmoxZ0FBOEs5bzBEZkNtaUtn?=
 =?utf-8?B?K3dlYXFuQWZ4a3pieGRFMjU2NEEyN3p6NitXWWQxMVFVZjVteUhvTnhEVzdB?=
 =?utf-8?B?elpkcUpWVERTZ3JZb1lrMGJiTXBZaXNnbGsyeEtGR0lLOXE4WXRvc0NNbUZF?=
 =?utf-8?B?QzV3UTU1N1lielJ4OGNSSFovQnI0REJQa3VNczZScWRabEJlQlJiM3dmRlFD?=
 =?utf-8?B?Q2xYd3BYVU5DMGxyOTdjOFFTMHZlT04yNjhoSUk4dXpYK0x0QWkvUFZSZFVZ?=
 =?utf-8?B?RGNvUlJ0QU13TjdqL3J6ZGdTNHVPa0dVQ3R0aTQ4L2s4VFY3c2lXMFdicy9V?=
 =?utf-8?B?ak1qMkJ6YTRiZ1Y3MkpDMElYOTZod1dSOGIzc0xiYng0R1N3bXptWnQyOHRm?=
 =?utf-8?B?bE9JeElQMGNkdU9IanRzV0hHSVk4SnI4cVdGR0xqRG5YV2RSSlFjekhHKzNy?=
 =?utf-8?B?cmdHcGVKSDhzdCtkbXFwb29Menh4WW5ValNWaS95NE5rN1VxZ1FFQ3JnbUJ4?=
 =?utf-8?B?bmovZ0d2R0F3aWtEa0h2dnUrOUJVTUVoa25qR2VFNnJxSUxodUppV1VVOStK?=
 =?utf-8?B?ekR0SlhyQlRBUVhhaWVKZ0IzdVFLS0czVGl5b1ZQekdvdWMrNkMydXRNYURr?=
 =?utf-8?B?RVE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac6108a-b76a-4afc-2a72-08ddb4b0e2e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 12:56:37.0153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eLKrGZjo6BK7k/a1YoJWSnrcqJ9yAR1R/2kgnv0+xvjUcSHR93eMdl/Ky3/i4gD1Kf3dqtxXD642Ps7/PXvD9iUHQ36gnj8nM/2gGEMZ3sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10819

SGkgR2VlcnQsDQoNCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMjYgSnVuZSAyMDI1IDEzOjQ1DQo+IFRvOiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
Y2xrOiByZW5lc2FzOiByenYyaDogQWRkIG1pc3NpbmcgaW5jbHVkZSBmaWxlDQo+IA0KPiBIaSBG
YWJyaXppbywNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+IE9uIFR1ZSwgMjQg
SnVuIDIwMjUgYXQgMjE6MjgsIEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvLmp6
QHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBGaWxlIGByenYyaC1jcGcuaGAgbWFrZXMgdXNlIG9m
IGRhdGEgdHlwZXMgZGVmaW5lZCBpbiBgdHlwZXMuaGAsDQo+ID4gYnV0IGl0J3Mgbm90IGluY2x1
ZGluZyBpdCwgd2hpY2ggY291bGQgdHJhbnNsYXRlIHRvIGJ1aWxkIGVycm9ycy4NCj4gPg0KPiA+
IEluY2x1ZGUgYHR5cGVzLmhgIHRvIGZpeCB0aGlzIHByb2JsZW0uDQo+IA0KPiBsaW51eC90eXBl
cy5oLg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNh
c3Ryby5qekByZW5lc2FzLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiBpLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNh
cy1jbGsgZm9yIHY2LjE3LCB3aXRoIHRoZSBhYm92ZSBmaXhlZC4NCg0KVGhhbmtzIGZvciBmaXhp
bmcuDQoNCkNoZWVycywNCkZhYg0KDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

