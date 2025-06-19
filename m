Return-Path: <linux-renesas-soc+bounces-18524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF76AE031A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 13:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 733E93AF8D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 11:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFBF22540A;
	Thu, 19 Jun 2025 11:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AP0uO2o3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B458E18EFD4;
	Thu, 19 Jun 2025 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331401; cv=fail; b=u03yrIiQNcGjhd9t/JCFfc/rn3UHUM3Vyx031SJHr3pEvau8qcSeq10FkyvoE0WHukh6oW0dAlXN0LaJ0G8ByBem7o+AFC9BEjaw6zLMf6FEwqwVZZsURehU+wCfbvOGLnr3WLLUdV5iTr4mwcXwQ2vYNu75pjeVNjvGeY/C1hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331401; c=relaxed/simple;
	bh=udd3dkhGkx9kRIyyz3Yc3J+WTesonD9RJN4A265kFj8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nJuiuG48Yrv6fWKqrmjWKMvyWx7X1HtL6Bkt36ZkH9YfLmLieQj35Tc68rUD6eFFw8k+R+8VXnZQMclQ8LtSzPGT1vhSl5s23b2QPFkt9C51nRj99S0kqNAQm3T8ZhF2dtvGG+tMxm8wLdd3f1TKiKHV8jnDRPePyDoAzvut+d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AP0uO2o3; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3TGqRaFkdh3JcDJJatL+eoYHlyUlQ1UNJW3ePz/oWXv/atxUkLkesHclFqdQd/kxHiMWz4JHJ8+ScZZSv0n7HQ71v2Gqr62gyOW+iR1I6qwFQTThIHEeG2Ik5Ngq8EukjXAnZIt/0eK8hrTJHtCK/9PXJ2IeMyziIHAcW7Ybhm1ghFxKDXbBiGAKFPyVsZIx8S81G6KHX2p0TfuxD8A8hP7/rRRwxuspHmnfUMeiYG2wkGzL8oyW1OpKsIyt/65MRUVkU/msQOgFAg/ij3sL1LbM/p8JAQx2OdIm36XvluaDc3ZZvRG+bnHtiKoJfZWOVu6iTZ+TBYeF1kuf60LdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udd3dkhGkx9kRIyyz3Yc3J+WTesonD9RJN4A265kFj8=;
 b=lhSaKR4+4tpDXBH2WB4k/t34AG+eVwBfW8iGY78X6oUYuQg+QZ6+sdCq4tigYZneAxvOX9G8635HjFBppI+CAx2iTLWCop4mUkdBPTio7Z/XQ0mclERLN61yQJd0anb5zjUjKiIrCfxMIuJbyz7rgB7YiG40QPOc+6XtoHqKfEMOonb09S2SOxhm51OslFuDy0at8uikISfrmenVWyYTPkkAqRe6mIt0W0vm5sCgIEyEF9vGm1HqHv78UCV2l1Kx/rW9Asmb0yWuGKI+7B0icHsQAVPheB/irQ9DD8m32X4E/XbAjGnjM8YQ+eQmldggxIYvzm6mJTloD24MRiNSdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udd3dkhGkx9kRIyyz3Yc3J+WTesonD9RJN4A265kFj8=;
 b=AP0uO2o30rcM4p9kb06CAbhZ0ZdO1akJ7C3Y8zkuxos3sDFSX2dih+cocSE9ABr4c/vKR+4uEeZ/xIoc9qfpzqEfDjKO0h6fpN0oPrZqzYMe34+SpI0VIPg2mBDGksuch+jgue8i1T4ZPzaEp8fKyKhp9mjjqamg5lxUzT7MPQY=
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com (2603:1096:604:3a0::6)
 by TYYPR01MB13164.jpnprd01.prod.outlook.com (2603:1096:405:161::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 11:09:53 +0000
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82]) by OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82%3]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 11:09:49 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"robh@kernel.org" <robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
Thread-Topic: [PATCH v2 3/3] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
Thread-Index: AQHb2phinMa6OlUdnEShl/Fkx/3oO7QKO8uAgAAj0oA=
Date: Thu, 19 Jun 2025 11:09:49 +0000
Message-ID:
 <OSCPR01MB146474526AD10BFCF587A8F85FF7DA@OSCPR01MB14647.jpnprd01.prod.outlook.com>
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
 <20250611061609.15527-4-john.madieu.xa@bp.renesas.com>
 <CA+V-a8uizu5MCur_=g5vJyWbWSTSP2J6FkQ89JB8ges7GWdsjg@mail.gmail.com>
In-Reply-To:
 <CA+V-a8uizu5MCur_=g5vJyWbWSTSP2J6FkQ89JB8ges7GWdsjg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14647:EE_|TYYPR01MB13164:EE_
x-ms-office365-filtering-correlation-id: aa86a2e4-21d4-44a5-2a78-08ddaf21cef4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VitjWGFFTkNPMVk3a0liZUJndkwyYzdJK2ozU0orTGMzTUdOdFNwZ1RjcGY1?=
 =?utf-8?B?TTc1aWRRMERKY2xyOUZhR251OHk5cndJeWZINkdkbTh6UFZNcUNCK3BXbXBG?=
 =?utf-8?B?UnFza2dpM1VVL29ZbnRqL0FRQ2NMdG92YTNUWHUzejJDRCtPc25BU1FzVGhD?=
 =?utf-8?B?T2RCMmJSbFpSVmgzdlRKOXRrYzZDN3NYM1NUbmV6Y1BzMjhFandlZUl3VlFq?=
 =?utf-8?B?YnFBMkpOMUV1MkNCRkxRandoeEJYbmxlTnhPcGNXVjBMRlMyTmlEcXRjUEZI?=
 =?utf-8?B?L2JUbGVCR3FtMUVkaExRRXFlVS8yVkdnVlNEVTlhKzNoQmZRdXoxc2lYS0NP?=
 =?utf-8?B?Z2lRMUVrWHZHSUxMUGlCUXJQT1Zib3E0NEhtYk9qTWVaNVNIMUtjRmgxSkFB?=
 =?utf-8?B?STlxSlFYaFlzUW5FMmRXWUx2U0NMbTZLaFhEZ2xOWlZQTDg0RDNKWkorcXFS?=
 =?utf-8?B?V0oySkFXTDlJL1BzUkVheSthVXU4dU8ycHdlNWYrZ1gyaGNIRHZRaTFteHFa?=
 =?utf-8?B?a2gwdlpnbnN0Z3VmcE9hK2UvaCtycG9hYmIzMkJrTlFkRmt5d0F2TUJvQ1Iy?=
 =?utf-8?B?TitjYWs5bFA3b0Q4a0dEZ0IxdU5zaDkzdkpsaXYvdDdaT2FBUDNnSEhLWS85?=
 =?utf-8?B?QW9pYmJpVWs3SmFZdXBHQi80NTRNWC9LYmx3MUY0Rk0veHdxdk5aNDRyYkZ6?=
 =?utf-8?B?MnRtRmtFSEFYOFd0OWhtOHNJVHFnMW84VWJ5bnZNS1ZyNnpheHlSVFlkRUlD?=
 =?utf-8?B?T1l1bFQ0SW9iL3Zvdjh3aFR5MzZ6R25mNDlFbFlMUVlMSHlVZXVNaWJoUyti?=
 =?utf-8?B?T2p2ZWlnajg5TVBHdFJHbTNxRVZaMk10Y2wvaHFKMFczZ2pXZGc1RndISlFM?=
 =?utf-8?B?WXhHV2JaVzZZYldENUFWN3NPVmhPbkJIYVluaTdFQmhTamRHK2tHc2xQblhC?=
 =?utf-8?B?OGJFRzFLdnRSOFR0WTlsR2pRUDFjWWhXY3gzNFFOMFVpS29mb09IVXhVU0d3?=
 =?utf-8?B?RXBUN3FGNG5lWmxzWGpOa0Z4STdFckE5STRHMi91cDdpend3QjU1cDNTKzlq?=
 =?utf-8?B?TnF0ZmFaT2lpb1YrVlh2K2IxV3c1QW5sOHFuVjY5LzJ2cE90bG5uQ2F1QTFr?=
 =?utf-8?B?bFJYMmpoaEsyempWVDU5SUkxeUJWZEQ5K2x1Q1UzRzdJcTBIUklTTnNKTjEx?=
 =?utf-8?B?MVNEeHpTRzNMQmFkZVdHQ3ppMDl3YWJBUlpyaE9wdWViTzBjcGV5MWkxTUJX?=
 =?utf-8?B?MzdLbjh0RzFmS2orbTlxNm5qaGpXSDREeGdUazB6VHp1VHZGY0UyUU9heHZY?=
 =?utf-8?B?VHIxeXdYdFJCdUp6TVdyNllHanJheDdDZ3VmV3ZWNHFnWnhKNDFqWE1IOFV4?=
 =?utf-8?B?YlZNNmxRd0wrNGdiL1prRmswS1ZBdUliL09pR3hsRDA3TzEzUlR6eHlwcGdK?=
 =?utf-8?B?aG9YSFA3WGt4dDRxNkpDWHkzRmgraE5yRE5NcXB2TmFQY1lhZTF0S2xHZTQ3?=
 =?utf-8?B?OWdSY1FlUkpIclFPYlB5clZBcUY4Y1FSanB6cStIRTZqWkhnNVYwYWV6SGJG?=
 =?utf-8?B?MURBMHEyRkUzSHFhRm82VlpDUUw5RFRrMFM3ODJLMm9JTHI3WW5QSGgxQk1l?=
 =?utf-8?B?akMzZEtTR1NTWEhSTVFOQWpoM2lSTVoyOG5pTlVYRjBGbWkxQnF0OXhpdjFJ?=
 =?utf-8?B?b1lVeEtUcHFCRmlKUVBtTlZhVXRmV2pSRU5kZWVKdmMxM0p1c2RyS0JzZGlE?=
 =?utf-8?B?dTZ5ekNSY25rNTZMeFZYVE5Fd0N6clBhdm9SQVhzcEJsUnNRakR4WnZmb3pZ?=
 =?utf-8?B?QWlNZHNjcThmMmwxeDRNVE03c3BxalZxYUNrU0tXbHhMMWdUMkpselZvVVlS?=
 =?utf-8?B?N3YrWEI4U2pIS01ZMFpyWkZaWGRhU3RpYXZVOTNsWVFocnRCUXc5QTRYYmIz?=
 =?utf-8?B?UjZKeW95YWVlcG8yb3JQYWdKVEpSZjVPRE8vMFErWG1LUDd3dGFib3lKS2Vu?=
 =?utf-8?B?ZDlUb0Q4SDFBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14647.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3hRK0hqdUhiUUZZL1lMWjFoSmJDbS9pbzdzV3BRamNZbEhjZjZGQ0FtNTdK?=
 =?utf-8?B?RDdmb1BtcEYwTEZYTG9VMmpXVFUrTGtPdStkWTJhQkxqcmFyZkR0UGdBV2N2?=
 =?utf-8?B?QngwamVOUDRoWVE0MjRpREFMVE1wWnN0d0lFeWRwTUI4VWlhRy84WUJ5TFdy?=
 =?utf-8?B?WFl4V0tVeEpFK0tUcTVydVVTQi9QTXNMZkE3Ymp5a3RVdGtyTzRDWDRyU24x?=
 =?utf-8?B?WEhyMVlicEwrODdBMVZLaG9nMSt6b0VQeHQ2Z1VONGx2ZTVyTU5JUHJXbnI0?=
 =?utf-8?B?dUgyU0k1a3lPbXBsb0d2SXF4UEQzTGtlWnpIOVRiOFEyamZYdXBRMzVtMFc4?=
 =?utf-8?B?dG1nb2I2aU96ZVpnQ3M2dC9JcXRSb1hDc3pwTExRenc5MDdvMHVzMUZrMnFW?=
 =?utf-8?B?WXNPd3FXeW05bURkRzNZRW53OHYwNlAzTnVLSGdHbGxvaVhpeXp0dmkyZTZL?=
 =?utf-8?B?L0RHaHVHdzdOS09qZ2FuNEtVM0JnRFYzS2xVQ2llcVlFVUpJWElhd2paU1dF?=
 =?utf-8?B?cVI0cTVGTFBVOGVBYytqUjhsd0psdUtwSzRlZ2UvaGFCOWhsT1dQNFVwUkZ4?=
 =?utf-8?B?cDVGbW92eks3MTZrd3FZeWVkMkpQd1hWTjRNRWNIZVZIeWo3V3gzY2N3WG1h?=
 =?utf-8?B?ejlyUDV2MjJmbWdYbk9DL2xkYzFvUmhpTjZBbVNDeitaN0hjQzRiVm5HRXpl?=
 =?utf-8?B?djRvTFkwclNJL3R4YTdOc0wvR3AzK3plYmIwbkZBM1IyWlc2dHBwcFV3NDF2?=
 =?utf-8?B?TWF4UXd6eDI0MDM3dXdadFVObnovKy9qaGRoUmNQd1NSOXpnQkcxQXE2YWts?=
 =?utf-8?B?M01hbW84L1RyRHJFbWI1U0hxNDhSamRpTzJZWVdONitBdnpQdnhZL0Q3eUl3?=
 =?utf-8?B?MWhwdEZpN1NkRGhmYTFVc1NaK0dyRDltQ1BuSStHTFVFWnpnb3dUY2JCSlRK?=
 =?utf-8?B?bTdkT0dya1NrbVlYTCtlanBweUhRamxaUGtIUkJ6T2xkUlRxcGgrZ29ObWRa?=
 =?utf-8?B?aVZHVFRJYk1RNmxqdzQ1cTB6OTlCTysyTzBCYmhCTCthT1V2ZFV5QUJtdEhk?=
 =?utf-8?B?dzA0RGhkNTJYdTBGSVY0RkFoT3huMTVDQnpCUGgvZXk3UmkyWVNHbEs5aFdD?=
 =?utf-8?B?dHhqOFhUK0xLSkFFdEtKMEJBdWJPL2c1QVRBMlJKU2hSUlhMQUFka2kyeHRP?=
 =?utf-8?B?YXZWRDVENmd2cXhzLy9pT1IyRDdXWk5BWjJFaHlpaUxTSWVZdE1Gd1BKVExn?=
 =?utf-8?B?cjVXZllKSFVicjUwZEJMSXcvaFpHWVNLZHdRVVVUVUsyZ25kY09zcFdxR1Yw?=
 =?utf-8?B?dUY5aW16a0x2Z3Q2TzdYQldaUkdwUmNKRzBCeDg2cjFMczgxTGJJenFnbDVN?=
 =?utf-8?B?Z1l1d1QzaEx1WUpUODRqWEFFRkNDU2VJT0NlN1MwNS9ya3pXN3RvbXdHVHV5?=
 =?utf-8?B?S2lKNGNJWXcwVlpXbWZGNTdMSFgxQWRkemh5bERwdDM4a0ZCTXk4cFY3bXlL?=
 =?utf-8?B?bytLUUx6cmtmT2Y3elVMYmtKRE5CZWVnbjE3ckwvU1pXWUUvdGYyS1ZSZk05?=
 =?utf-8?B?cENTTmtlMUFad0tXVFNSUW00d2grQ0p0ZGdMcms5Rk5KcC90SU5SWmJKUmYz?=
 =?utf-8?B?eFJmNTRhRDROcENtWmVVTm95b1Zmd2RReGxZQ01hM0tCUnA4TXhSdUpuUkJp?=
 =?utf-8?B?MHhob0U1NElCdDVDcG9CSEp1eGNNMk1GSk9PcDcwYk1PdkF5TWFVY3NCZkJP?=
 =?utf-8?B?VVZpV25JY1B2QzVUREpBZ3NiaXNXN0hvWCs0d2FONTA2Y0RHUnIwYjFRSitI?=
 =?utf-8?B?RFVCcWFObVFSelhLSFZIWXNCbWhrMHAwSFJLM0dNVGZMQzJCV3J2Z0VSR2l4?=
 =?utf-8?B?V2pZZGRhMEdxY3E4UXh6Smo1ZDJIdnZjcld6Y3B2cFRGaGRoYTdWdzI0aG9s?=
 =?utf-8?B?OEx2b0ZBTHZBc2tjZnY0MmR0ZTEwTXkwTnQ2dVhZTmc3ZWFsOTRmNnViMXdG?=
 =?utf-8?B?SGt2ZHBhLytYN2dlYkQxL2daYkEzOEREVnJrWW5WMjVrYk80ajJrN0lYMnY3?=
 =?utf-8?B?SER0R0Ryd1B5cndJWWJKTkdJbTZPdk8vbDhtai9VT2l6MkhMZUFwa0FxK3h4?=
 =?utf-8?B?MlRJOUJBd0krTE9pUDd2SmNLWGZQbEFIWFl0MDA4b3J2blZBMFJHQ0U3UWxL?=
 =?utf-8?B?ZUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aa86a2e4-21d4-44a5-2a78-08ddaf21cef4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 11:09:49.6795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KyNzlwJ83hR6pDLVWOFbxhJ443ykOcr5bZj9G/H5ZuF90wmLJt+3KRb8xmgAKHzNc0tyyUbCJ2WOCZ5cMotV8NckfK6i521zSSS2HnFm4cI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13164

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNk
YXksIEp1bmUgMTksIDIwMjUgMTE6MDAgQU0NCj4gVG86IEpvaG4gTWFkaWV1IDxqb2huLm1hZGll
dS54YUBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAzLzNdIGFybTY0
OiBkdHM6IHJlbmVzYXM6IHJ6ZzNlLXNtYXJjLXNvbTogRW5hYmxlDQo+IGV0aHswLTF9IChHQkVU
SCkgaW50ZXJmYWNlcw0KPiANCj4gSGkgSm9obiwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBh
dGNoLg0KPiANCj4gT24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgNzoyMOKAr0FNIEpvaG4gTWFkaWV1
DQo+IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBFbmFi
bGUgdGhlIEdpZ2FiaXQgRXRoZXJuZXQgSW50ZXJmYWNlcyAoR0JFVEgpIHBvcHVsYXRlZCBvbiB0
aGUgUlovRzNFDQo+ID4gU01BUkMgRVZLDQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFRlc3RlZC1ieTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gTWFkaWV1
IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Jvb3Qv
ZHRzL3JlbmVzYXMvcnpnM2Utc21hcmMtc29tLmR0c2kgICAgIHwgMTA2ICsrKysrKysrKysrKysr
KysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTA2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM2Utc21hcmMtc29tLmR0
c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemczZS1zbWFyYy1zb20uZHRz
aQ0KPiA+IGluZGV4IGY5OWEwOWQwNGRkZC4uNGI0YzdmMzM4MWFkIDEwMDY0NA0KPiA+IC0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemczZS1zbWFyYy1zb20uZHRzaQ0KPiA+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemczZS1zbWFyYy1zb20uZHRzaQ0KPiA+
IEBAIC0yNiw2ICsyNiw4IEBAIC8gew0KPiA+ICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2Fz
LHJ6ZzNlLXNtYXJjbSIsICJyZW5lc2FzLHI5YTA5ZzA0N2U1NyIsDQo+ID4gInJlbmVzYXMscjlh
MDlnMDQ3IjsNCj4gPg0KPiA+ICAgICAgICAgYWxpYXNlcyB7DQo+ID4gKyAgICAgICAgICAgICAg
IGV0aGVybmV0MCA9ICZldGgwOw0KPiA+ICsgICAgICAgICAgICAgICBldGhlcm5ldDEgPSAmZXRo
MTsNCj4gPiAgICAgICAgICAgICAgICAgaTJjMiA9ICZpMmMyOw0KPiA+ICAgICAgICAgICAgICAg
ICBtbWMwID0gJnNkaGkwOw0KPiA+ICAgICAgICAgICAgICAgICBtbWMyID0gJnNkaGkyOw0KPiA+
IEBAIC03Nyw2ICs3OSw3NCBAQCAmYXVkaW9fZXh0YWxfY2xrIHsNCj4gPiAgICAgICAgIGNsb2Nr
LWZyZXF1ZW5jeSA9IDw0ODAwMDAwMD47DQo+ID4gIH07DQo+ID4NCj4gPiArJmV0aDAgew0KPiA+
ICsgICAgICAgcGh5LWhhbmRsZSA9IDwmcGh5MD47DQo+ID4gKyAgICAgICBwaHktbW9kZSA9ICJy
Z21paS1pZCI7DQo+ID4gKw0KPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZldGgwX3BpbnM+Ow0K
PiA+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArICAgICAgIHN0YXR1
cyA9ICJva2F5IjsNCj4gPiArDQo+ID4gKyAgICAgICBtZGlvIHsNCj4gPiArICAgICAgICAgICAg
ICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICAgICNzaXplLWNlbGxz
ID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNucHMsZHdtYWMtbWRp
byI7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBwaHkwOiBldGhlcm5ldC1waHlANyB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWQw
MDIyLjE2NDAiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZXRo
ZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDw3PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVk
ID0gPCZpY3UgMw0KPiBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJ4Yy1za2V3LXBzZWMgPSA8MTQwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgdHhjLXNrZXctcHNlYyA9IDwxNDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBy
eGR2LXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB0eGR2LXNr
ZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByeGQwLXNrZXctcHNl
YyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByeGQxLXNrZXctcHNlYyA9IDww
PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByeGQyLXNrZXctcHNlYyA9IDwwPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICByeGQzLXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICB0eGQwLXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICB0eGQxLXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICB0eGQyLXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICB0eGQzLXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArICAg
ICAgIH07DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmZXRoMSB7DQo+ID4gKyAgICAgICBwaHktaGFu
ZGxlID0gPCZwaHkxPjsNCj4gPiArICAgICAgIHBoeS1tb2RlID0gInJnbWlpLWlkIjsNCj4gPiAr
DQo+ID4gKyAgICAgICBwaW5jdHJsLTAgPSA8JmV0aDFfcGlucz47DQo+ID4gKyAgICAgICBwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+
ICsNCj4gPiArICAgICAgIG1kaW8gew0KPiA+ICsgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKyAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic25wcyxkd21hYy1tZGlvIjsNCj4gPiArDQo+ID4g
KyAgICAgICAgICAgICAgIHBoeTE6IGV0aGVybmV0LXBoeUA3IHsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZDAwMjIuMTY0MCIsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJldGhlcm5ldC1waHktaWVlZTgw
Mi4zLWMyMiI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDc+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmljdSAxNg0KPiBJ
UlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJ4Yy1za2V3
LXBzZWMgPSA8MTQwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdHhjLXNrZXctcHNl
YyA9IDwxNDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByeGR2LXNrZXctcHNlYyA9
IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB0eGR2LXNrZXctcHNlYyA9IDwwPjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICByeGQwLXNrZXctcHNlYyA9IDwwPjsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICByeGQxLXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICByeGQyLXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICByeGQzLXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICB0eGQwLXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB0
eGQxLXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB0eGQyLXNr
ZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB0eGQzLXNrZXctcHNl
YyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgIH07DQo+ID4gK307
DQo+ID4gKw0KPiA+ICAmZ3B1IHsNCj4gPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiAg
ICAgICAgIG1hbGktc3VwcGx5ID0gPCZyZWdfdmRkMHA4dl9vdGhlcnM+OyBAQCAtMTAzLDYgKzE3
Myw0MiBAQA0KPiA+IHJhYTIxNTMwMDogcG1pY0AxMiB7ICB9Ow0KPiA+DQo+ID4gICZwaW5jdHJs
IHsNCj4gPiArICAgICAgIGV0aDBfcGluczogZXRoMCB7DQo+ID4gKyAgICAgICAgICAgICAgIHBp
bm11eCA9IDxSWkczRV9QT1JUX1BJTk1VWChBLCAxLCAxKT4sIC8qIE1EQyAqLw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoQSwgMCwgMSk+LCAvKiBNRElP
ICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChDLCAy
LCAxNSk+LCAvKiBQSFlfSU5UUg0KPiAoSVJRMikgKi8NCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgPFJaRzNFX1BPUlRfUElOTVVYKEMsIDEsIDEpPiwgLyogUlhEMyAqLw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoQywgMCwgMSk+LCAvKiBSWEQy
ICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChCLCA3
LCAxKT4sIC8qIFJYRDEgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BP
UlRfUElOTVVYKEIsIDYsIDEpPiwgLyogUlhEMCAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoQiwgMCwgMSk+LCAvKiBSWEMgKi8NCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRfUElOTVVYKEEsIDIsIDEpPiwgLyogUlhfQ1RM
ICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChCLCA1
LCAxKT4sIC8qIFRYRDMgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BP
UlRfUElOTVVYKEIsIDQsIDEpPiwgLyogVFhEMiAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoQiwgMywgMSk+LCAvKiBUWEQxICovDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChCLCAyLCAxKT4sIC8qIFRYRDAg
Ki8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRfUElOTVVYKEIsIDEs
IDEpPiwgLyogVFhDICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JU
X1BJTk1VWChBLCAzLCAxKT47IC8qIFRYX0NUTCAqLw0KPiBsaWtlIFJaL1YySCBvbiBSWi9HM0Ug
UEZDX09FTiBCSVRTKDAsMSkgbmVlZCB0byBiZSBjb25maWd1cmVkIGJhc2VkIG9uDQo+IFJHTUlJ
L01JSSBtb2RlPw0KDQpZZXMsIGl0IGlzIHRoZSBjYXNlLiBPRU4xIGFuZCBPRU4wLg0KDQo+IA0K
PiBDaGVlcnMsDQo+IFByYWJoYWthcg0KDQpSZWdhcmRzLA0KSm9obg0KDQo+IA0KPiA+ICsgICAg
ICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICBldGgxX3BpbnM6IGV0aDEgew0KPiA+ICsgICAgICAg
ICAgICAgICBwaW5tdXggPSA8UlpHM0VfUE9SVF9QSU5NVVgoRCwgMSwgMSk+LCAvKiBNREMgKi8N
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRfUElOTVVYKEQsIDAsIDEp
PiwgLyogTURJTyAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9Q
SU5NVVgoRiwgMiwgMTUpPiwgLyogUEhZX0lOVFINCj4gKElSUTE1KSAqLw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoRiwgMSwgMSk+LCAvKiBSWEQzICov
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChGLCAwLCAx
KT4sIC8qIFJYRDIgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRf
UElOTVVYKEUsIDcsIDEpPiwgLyogUlhEMSAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICA8UlpHM0VfUE9SVF9QSU5NVVgoRSwgNiwgMSk+LCAvKiBSWEQwICovDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChFLCAwLCAxKT4sIC8qIFJYQyAqLw0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoRCwgMiwgMSk+
LCAvKiBSWF9DVEwgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRf
UElOTVVYKEUsIDUsIDEpPiwgLyogVFhEMyAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICA8UlpHM0VfUE9SVF9QSU5NVVgoRSwgNCwgMSk+LCAvKiBUWEQyICovDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChFLCAzLCAxKT4sIC8qIFRYRDEgKi8N
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRfUElOTVVYKEUsIDIsIDEp
PiwgLyogVFhEMCAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9Q
SU5NVVgoRSwgMSwgMSk+LCAvKiBUWEMgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
PFJaRzNFX1BPUlRfUElOTVVYKEQsIDMsIDEpPjsgLyogVFhfQ1RMICovDQo+ID4gKyAgICAgICB9
Ow0KPiA+ICsNCj4gPiAgICAgICAgIGkyYzJfcGluczogaTJjIHsNCj4gPiAgICAgICAgICAgICAg
ICAgcGlubXV4ID0gPFJaRzNFX1BPUlRfUElOTVVYKDMsIDQsIDEpPiwgLyogU0NMMiAqLw0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoMywgNSwgMSk+OyAv
KiBTREEyICovDQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0KPiA+DQo=

