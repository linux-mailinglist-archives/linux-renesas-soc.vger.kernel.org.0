Return-Path: <linux-renesas-soc+bounces-16192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC536A951E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 15:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D1433B135E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 13:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377DB26560F;
	Mon, 21 Apr 2025 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kq7d8CHC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07E5261372;
	Mon, 21 Apr 2025 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243161; cv=fail; b=OgGhf5uyi6A21gqFHrXGZibv84+LxKV3kEBv4LwwMTeonbix5BIPw3VWRERFyRimdCou/A59sghvkTUuXZse7l7Wv07Rf9PI8lmUMQIZZYkRvHLKc2lk4oGFbZT6Tohl6A5yHjJPJHdFXaxkfVZC1AIcqRpNJHme/qS3zxpxCXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243161; c=relaxed/simple;
	bh=4qbvYPuPn7ZXM8AcEAA9JSht6tgX+9Vu9fvO20MYXJE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TF1t36cNY4BKPuk+sSINIudNiXHrqcsjV/ikPvw2c2c+VscfzScQHvuExOhJqAy7zmxKDW4CzAZjjE3aAgN/U2H7Ts6grFx1rgi+deNMzxh7gxZ9++pPBhwUfL+7l7ViI5P0kcAFyzFIU5C2N8lX31QvpqGV52Z+4rJfWm+vqyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kq7d8CHC; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQkCgEdPn+jYl/4/yYUEF4rFu2iz9VKokhP3tZeNUIMfOIt2q4Cthr2r3z1n9reN3UyTJ70Je6hmlsX32BW28WfujeOszmbpxz6qOrq+82RPNjq7vO/KwFDjG0gmeFQ1CwowHR/YvsV7Yzw7agch+F5w8Gv6YQm4VdspFyHPZBcE3qEklcjrqexk1i4Y3ncVFr/RzixPWKIPfNMdeuMvujq0vJ238yae5TlZoLKjLM+Iwk+jA9gqqbDaDh0ipgVVRrfrFW6ZlZaJ/qfpSjSfAhFkxR0drCvSsQsIF4YIEQtzzt/XmrEMSrzVwaZ6IwbSb3csz0oMFcm4HdmeuhbnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qbvYPuPn7ZXM8AcEAA9JSht6tgX+9Vu9fvO20MYXJE=;
 b=lSPJuwWD3eWePlg8Or5umCMy6//NXxTXkDpFrPvxsw8a8R7i/uEJCRB6oL115CVyaL/6Eik7D1D0UZNdRvLMx/iBmz22rQh7l5JzvwDxoTWRe9teCNW9A8yM29S2tZviLw4GMXpbPU2vF69CzCO+aZPEXEgj7Pm1ruqsRvR0nAysPq2AC2aPwZVVfaIbalpTrNyXaM/xYEJWxf9w8RG+cZIX+vTLo3OhzmVXGi/FUG+Wex7bIEXlLBA4WpLvamnR5/VV/DyP9eyu3E48va4SYL6S6Ywgy4oDfrMhyktubRX/7PCxh+QXbIQX5v/+2doAgOUfkTwDEkNWY6qsKln9UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qbvYPuPn7ZXM8AcEAA9JSht6tgX+9Vu9fvO20MYXJE=;
 b=kq7d8CHCX0kOqeFhRZa5XZ7MWD2DoHjrWGMaTxN0utNfVSLwvhFJz5tFK7qrk+6gKXeRy+RVQC1ua+dvH1gRy4TFE8nO/W0yLmfY+Yk5w4Ahh4Up3EFfIfhbOJY9btLfwgHTkzsCPcTb7uNfsEmi2W4HepAkhXmgAQNTTC9JSjk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB12170.jpnprd01.prod.outlook.com (2603:1096:604:2dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Mon, 21 Apr
 2025 13:45:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:45:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, "Russell King (Oracle)"
	<linux@armlinux.org.uk>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
	<richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu
	<joabreu@synopsys.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Topic: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Index: AQHbp7UXRdTsn2oCYUWD5qYhUQGHu7OjbUQAgAAVgQCAATLSgIAJgP8Q
Date: Mon, 21 Apr 2025 13:45:50 +0000
Message-ID:
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
In-Reply-To:
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB12170:EE_
x-ms-office365-filtering-correlation-id: 1a9bef2a-1385-43d6-5877-08dd80dad3d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SGpxMW9vVW5zWmJzU0xQSm1UTHhvSWNrVUpDd24zc2loTTV1bzBWcDZ3OE9j?=
 =?utf-8?B?cHFpWDVJOTV5d3BkcDdCU1JxSnlCc0dLSnhwYXBucHNzbHpaUjI3Zy82VVBC?=
 =?utf-8?B?VE1ZVm0ycnlCeU1ZV242Rm5ZWVpPbXluangzRUFNeEFpL2x6dzFWcUwwT25p?=
 =?utf-8?B?OUt6bzdua2g2R1RYZlA5c0hJaUMrSURTZlFTcHRlY0d0eFRVWGNENGlRVzhT?=
 =?utf-8?B?UWZnNUtWditUZ1BxOGVaT25zTVppR2kwWE45ZUppRUVzSlozVkIwZ2VOblRu?=
 =?utf-8?B?K1U0UEVST0cvYlE0elRMazZ6cjFPdEtiakpxLzEyNC82NmRJMkYzZlR3Y0Jk?=
 =?utf-8?B?ZFYzQ0x6ekRvMU1FclBJMUgvc0pFS0hJR1hsRitNeFV2TjNYYkowU3Jia0tS?=
 =?utf-8?B?b2VTUE9FcVRYU0E2M3dPZXBnY3AxanJaQWtncTJaUllQNmxLSkEwaUtaUkhQ?=
 =?utf-8?B?ZkhqWVRGSzkwM2FMMkxVTTdGaCtxRWRCVWJKNExWM05DSnhlVElnYk4yMkJ2?=
 =?utf-8?B?c3BodTBQeXV5Z0NDelNXeUlvWUN6d0RRZ1lCNkJ0ckkwYkJXdDg0MlZxZkcx?=
 =?utf-8?B?NXd1ZE5TTnVhZDF1V3FiMkhtMVM5MVlsVW5GRitEd3FFTW42WDZ3dWNzL1la?=
 =?utf-8?B?QThXQmdBMVBDNmYvL0d0MjZzY2NoeW9saUd4Uk1TQzh6YkJ1TlJBVXpTckNX?=
 =?utf-8?B?dWdZenZIRlBDSVN6dzRWNXprZVdCUkROQ0hRZWlNanc3ZGVUa1BVdWYyZ2JB?=
 =?utf-8?B?K1NCYlhnSXA0Nng1bFZ2NWhtdkJSNGF1YTZHK2t3OXZMKzVad25zQWp1RGF0?=
 =?utf-8?B?WEdobHV5NFRiSmk5Ni9MaVJoRC9SV3FVdnRwclcvWE42bmRzditEelB4ZmIx?=
 =?utf-8?B?MDk0WGxrcDZMT01TME0vUkRZbU9pUEZ2UG9qY2ZsOWkzMFJMdW10ZUQ0Y01z?=
 =?utf-8?B?MFZWQjAzdWVJVnpIbUtZdkdmeloyOERMYXZzT3Z2Vm5PVEpHdWFPd204WmdU?=
 =?utf-8?B?ZndQcFZnOHg0cWpSZmw4WkZmOUtnaENIR1hxRVA5TUJpREFPSHJBOFJFUGNo?=
 =?utf-8?B?L2wrRWluZklsMDcrV1RUM09pWHNpY2RhZ0l1M2R3SndxZkpaTUZHTVIzMUt2?=
 =?utf-8?B?MVVlQStEbCsvRStlby9yQ3RLZEh4OWk0cXFkS2REbDhWY3I2Z3dDV01CNWQw?=
 =?utf-8?B?dDZaV3pMQlhEVDUreUdhRXJPSFB2U2NnbzdoT09xd1RhL0w1S0xUMVhMRHk0?=
 =?utf-8?B?RFBCcUR6WVEzVTdoekpZNzFEV2JDaVNnZ0lmWWFMNXllWVg0ZitiMTJPVVF2?=
 =?utf-8?B?N2FKZytFOUVSS2pVZXVLVTV1ZjBqSzFaZ0t3ZFd3QXA5VWNTYmdGMlFrTm5w?=
 =?utf-8?B?QWV3NUhIQzh2bE5sUUw4cGg2K3ZrV1JCMHdaY3NEUEwvZU4zKzgyUEF4MnFP?=
 =?utf-8?B?RFJZNHczYjV4QkI3RHNCRlBwVERrRi94Yzg1RlJUbnFCVm1WZkJXTlRmVmtT?=
 =?utf-8?B?bGVxSm5HeXhXQlN3SDkwODg2S1JQZExXdTVCL21QVnRDMXFNT0VZWTRadHJB?=
 =?utf-8?B?TktkSU1DamdzWVN3VmNjcFBKbW1qRXV5KzZtRnV3UXVCS3JTL2VxQkhxOElV?=
 =?utf-8?B?Umo0SVdGeDZCUGFkdnNsdWFYR204d1ZtQlg4Y2Y2VldHUHdFcVp6S25xYTR2?=
 =?utf-8?B?WTdwOGtlUWFXT29IVjAxLzhVSE1NR3dQd2gyeHVXL0pycFVIU3k1cDRuTU5U?=
 =?utf-8?B?QlBWQ1VMaytPRUVJNTVQcEZ0a2l1VWlDaVpjOUl4RkZsWnVDcWVsVGJ5TnF0?=
 =?utf-8?B?dE9oYUE2cXEvbktTVGhXdEFHY0lwaUE0STJwV1NlK24rNm9wTjhoYk1rMzFW?=
 =?utf-8?B?MFJpTSs1UnhESm9CeHAxRFIrd0grY0VsRFQwc3dGOURiWG5kbFZiMlo5Q1Bl?=
 =?utf-8?B?dndTd2lBOW9LRFc1bmhhVlU4RjZhbnRpeDN3M3lOYlVXYzR5dG1zblZxcHB2?=
 =?utf-8?B?dEhKM0ZsR2R3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHlnZXpZTmZDbU5ZL2VwMmlJM1hrNnN1ZldBNmE1MXJnUFd2aUcwNTZMZVRC?=
 =?utf-8?B?WkpTd0UxVUdCRnVXMEV2TlBnRlVpa1Z6NGxkMkV4bm1MS2JrbWxIMlJicU9B?=
 =?utf-8?B?OUNUM0QvclFoUXRUYm5lVGNGTnJ6cG95aFRlbGdTcU4vSi9TN01NMndRaGty?=
 =?utf-8?B?dllYNlZ2QTJVTkozV0F2NG1KRWw0VlA4T0czeFNUdnZRbTQ4UFNyaDZ2RFd3?=
 =?utf-8?B?Z215RGpRanpEWlZ0eXhsaDJaMnhGZ1c1NVBqdDN6V3hRSTBBMEF3aU5ab2tC?=
 =?utf-8?B?c0JGa3cyd0llSHF0b1pyeUQzbmVTRm9icEQwalhEQjdiSEFaTDk3VFpFUnMr?=
 =?utf-8?B?U3RQem1uaFBiUWZoSm9rT2p0bFQ3eWN4alpob0ZwR2Y1S0RzQ1gxT3FrWDI1?=
 =?utf-8?B?NXhsKzhacGlQOUhhaVVMRlJET0JIRzhicWg2WTJrU0xvMTdlS0dUMndLWWhj?=
 =?utf-8?B?aENtZEh1N05YRnlBR1Z0dlJmZWUySS9rNHRmUUdHb3JFSHA5bG5Gd2d3WWc1?=
 =?utf-8?B?S0xnNEVUQmdVQnNOTm9VTUdUU01tWE8xVlJsMGtCL3hzVUZLY1VNMkJhSkM5?=
 =?utf-8?B?eE5NVVJlM296QWU2Rk5JQ08vWjNLMk1FQ0t2WVkwV00zcmwxU1lwNVh6ckR3?=
 =?utf-8?B?dHBKa0NqV0dGL0pHa3lidndzQlNRWVprUmxPbDZvY3c3QW5uT3R1dnBPY05j?=
 =?utf-8?B?bHN2Z29DOU81SkppcDlmYmE2YzRoV2pEMDYrd3VhaFlycDBUNU1aWHY4dmpr?=
 =?utf-8?B?QjZOY2xHeGVsWEkyYjBKYVNsRFRxT2ExdmhVM2srUnNzREF1UUxLNlYxNVdk?=
 =?utf-8?B?dkRkYlJHclZGUzR0cWovaVlEaFA0NkxVaFVxQmpKaHJIUFluclF2TXhHbmxF?=
 =?utf-8?B?SjI3KzQxRE9sQ1dCTkYxQ2t4ajFTQWYvUzhlNXRsdnVVL05GVDJmc2llN0c3?=
 =?utf-8?B?WUpkYU5ubnJhRU9Da1pKZCs4RGprdWIwMXMyWVZjMHFpdFhkUnBROStMK1pU?=
 =?utf-8?B?WWd3MXVoZjNSV0FLNE9Td3laZ0ZUTjNYRUVPblozTysxNkRrR1BhZWN2ZmtU?=
 =?utf-8?B?UmJyci9Ud1BKRjc3T0gvTFlkNXg0c2ZBeUtlYytXZ2JDWFdNSUU4VUxEYVZX?=
 =?utf-8?B?Q0Y1ek8zV3huOVhoZ2lONGczak5XdzkraWJhdENYczg3V2tZS3dNN2hPQmdY?=
 =?utf-8?B?WmR0cXZhUHhhKzNLbG1zd2VNdElMZlUvL2FHWVM0RjhUU3lWT0tKQmJuT1Ju?=
 =?utf-8?B?aFRRS2dPei95N256MVlzbW9xUVQ1dXBNNXRja0pKcXYyeGpLdVh1YXFHN3gr?=
 =?utf-8?B?NkFNWENVQm5tMHNUYS9JNytTWFlqQ0dIMGNra1drTjYrTWtDaWxmd1Y2V2xG?=
 =?utf-8?B?OFZyZTl2U0s1eGVWKzFMV29LZFNyTmk5UVJ5Z2s1bUxVakFMOFhIaDJXcFhw?=
 =?utf-8?B?YklsQ2Zpc2pLK1FaVUxVVUhDNFFFT2VZb3dWb0RSVjk3bTAvc3B1YnRsOHdH?=
 =?utf-8?B?VXVsNkhZTE5BYzk5aFVkaGdTUXBjZkhLK1JUVU0wK0hnY28wei9nd3NOeEQx?=
 =?utf-8?B?UmpPTjVHR2tRQksvMi9meEdmNVJGMmVOa0RrcTRKSElIN2lZQWxZT1hDVWFx?=
 =?utf-8?B?SDRIREE4UVFscGZtY0ptTENNdVVXOVM0SmlmbnJLaVRvN2tlYUlTTEtVUmFy?=
 =?utf-8?B?bXlaQytBbytxZkc1eWR1UlU2cVUxaUtybHA2cGs3ajVaVW9kVzJWU2lFVHFz?=
 =?utf-8?B?Z3Q4TmhXamVKaG5GRjc1RW1Qd25QRk5FRFZYRzRiMkFPYmRjQnl0VURpK0p4?=
 =?utf-8?B?aXYyR1NVUVZIUk5oWkpUdnFLR0F5dEMySjNjMEd3aGRzZTdaY0VlamZxdXg4?=
 =?utf-8?B?czFGcS9sZXB4TFlTSHlCMFpkUWppUHdxY0VTRTNJUjNoaTNSaThqK3lkam9S?=
 =?utf-8?B?WHdtNitMcG1XZzhORjk2K2ZWbXdOVjdzVXpSVjFMcjZYa2EwUmJvZlJ4ZHJV?=
 =?utf-8?B?R1l4TmJWMXBLYUQvZ0M4eUZnVjk0cndWUHlBbEFQbjNpcjdPOVA3Q1RkdmZM?=
 =?utf-8?B?VU11aGtqLzZGbHBsbTA2TFgyMmUxTnhPWllWcmJBWXFTR0doMG5yWVNvU2lp?=
 =?utf-8?B?NHBuSHVRYUxhSlA4LzA5N2UxQ1k5SmNjSmhwTEpudWlEVEpkZ3BJS2I2TUN5?=
 =?utf-8?B?R3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9bef2a-1385-43d6-5877-08dd80dad3d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 13:45:50.1092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E64KMfLtEGeXBTmVl1weYLBRNtadaEA4zB5zwjvXtQitsmyigTkq4fHIbZk84dUPSexUXl+/OQBUt5HfDQKwwE7HSF6ztICiraq0LFxEXhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12170

SGkgQWxsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhZCwgUHJh
Ymhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMTUgQXByaWwgMjAy
NSAxMzozMw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIG5ldC1uZXh0IHY1IDMvM10gbmV0OiBzdG1t
YWM6IEFkZCBEV01BQyBnbHVlIGxheWVyIGZvciBSZW5lc2FzIEdCRVRIDQo+IA0KPiBIaSBSdXNz
ZWxsLA0KPiANCj4gT24gTW9uLCBBcHIgMTQsIDIwMjUgYXQgNzoxNOKAr1BNIExhZCwgUHJhYmhh
a2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBSdXNz
ZWxsLA0KPiA+DQo+ID4gT24gTW9uLCBBcHIgMTQsIDIwMjUgYXQgNTo1N+KAr1BNIFJ1c3NlbGwg
S2luZyAoT3JhY2xlKQ0KPiA+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOg0KPiA+ID4N
Cj4gPiA+IE9uIE1vbiwgQXByIDA3LCAyMDI1IGF0IDAxOjAzOjE3UE0gKzAxMDAsIFByYWJoYWth
ciB3cm90ZToNCj4gPiA+ID4gKyAgICAgZ2JldGgtPnJzdGMgPSBkZXZtX3Jlc2V0X2NvbnRyb2xf
Z2V0X2V4Y2x1c2l2ZShkZXYsIE5VTEwpOw0KPiA+ID4gPiArICAgICBpZiAoSVNfRVJSKGdiZXRo
LT5yc3RjKSkNCj4gPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihnYmV0aC0+cnN0
Yyk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgZ2JldGgtPmRldiA9IGRldjsNCj4gPiA+ID4g
KyAgICAgZ2JldGgtPnJlZ3MgPSBzdG1tYWNfcmVzLmFkZHI7DQo+ID4gPiA+ICsgICAgIGdiZXRo
LT5wbGF0X2RhdCA9IHBsYXRfZGF0Ow0KPiA+ID4gPiArICAgICBwbGF0X2RhdC0+YnNwX3ByaXYg
PSBnYmV0aDsNCj4gPiA+ID4gKyAgICAgcGxhdF9kYXQtPnNldF9jbGtfdHhfcmF0ZSA9IHN0bW1h
Y19zZXRfY2xrX3R4X3JhdGU7DQo+ID4gPiA+ICsgICAgIHBsYXRfZGF0LT5jbGtzX2NvbmZpZyA9
IHJlbmVzYXNfZ2JldGhfY2xrc19jb25maWc7DQo+ID4gPiA+ICsgICAgIHBsYXRfZGF0LT5mbGFn
cyB8PSBTVE1NQUNfRkxBR19IV1RTVEFNUF9DT1JSRUNUX0xBVEVOQ1kgfA0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgU1RNTUFDX0ZMQUdfRU5fVFhfTFBJX0NMS19QSFlfQ0FQIHwN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIFNUTU1BQ19GTEFHX1NQSF9ESVNBQkxF
Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgIGVyciA9IHJlbmVzYXNfZ2JldGhfY2xrc19jb25m
aWcoZ2JldGgsIHRydWUpOw0KPiA+ID4gPiArICAgICBpZiAoZXJyKQ0KPiA+ID4gPiArICAgICAg
ICAgICAgIHJldHVybiBlcnI7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgZXJyID0gc3RtbWFj
X2R2cl9wcm9iZShkZXYsIHBsYXRfZGF0LCAmc3RtbWFjX3Jlcyk7DQo+ID4gPiA+ICsgICAgIGlm
IChlcnIpDQo+ID4gPiA+ICsgICAgICAgICAgICAgcmVuZXNhc19nYmV0aF9jbGtzX2NvbmZpZyhn
YmV0aCwgZmFsc2UpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgIHJldHVybiBlcnI7DQo+ID4g
PiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRpYyB2b2lkIHJlbmVzYXNfZ2JldGhfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHsNCj4gPiA+ID4gKyAgICAgc3RtbWFj
X2R2cl9yZW1vdmUoJnBkZXYtPmRldik7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgcmVuZXNh
c19nYmV0aF9jbGtzX2NvbmZpZyhnZXRfc3RtbWFjX2JzcF9wcml2KCZwZGV2LT5kZXYpLA0KPiA+
ID4gPiArZmFsc2UpOyB9DQo+ID4gPg0KPiA+ID4gV291bGQgY2FsbGluZyByZW5lc2FzX2diZXRo
X2Nsa3NfY29uZmlnKCkgaW4gdGhlIHN1c3BlbmQvcmVzdW1lDQo+ID4gPiBwYXRocyBjYXVzZSBw
cm9ibGVtcz8NCj4gPiA+DQo+ID4gPiBJZiBub3QsIHBsZWFzZSBjb25zaWRlciB1c2luZyBwbGF0
X2RhdC0+aW5pdCgpIGFuZCBwbGF0X2RhdC0+ZXhpdCgpDQo+ID4gPiB0byBjb250cm9sIHRoZXNl
IGNsb2NrcywgYW5kIHRoZW4gdXNlIGRldm1fc3RtbWFjX3BsdGZyX3Byb2JlKCkNCj4gPiA+IHdo
aWNoIHdpbGwgY2FsbCB0aGUgLT5pbml0IGFuZCAtPmV4aXQgZnVuY3Rpb25zIGFyb3VuZCB0aGUg
cHJvYmUgYXMNCj4gPiA+IG5lY2Vzc2FyeSBhbmQgYXQgcmVtb3ZhbCB0aW1lIChhbmQgeW91IHdv
bid0IG5lZWQgdGhlIHJlbW92ZQ0KPiA+ID4gbWV0aG9kLikNCj4gPiA+DQo+IE9uIHRoZSBSWi9H
M0UsIHRoZSB1cHN0cmVhbSBzdXBwb3J0IGZvciB0ZXN0aW5nIFMyUiBpcyBub3QgeWV0IGluIGEg
dXNhYmxlIHN0YXRlLiBTbyBmb3Igbm93LCBJJ2xsDQo+IHN3aXRjaCB0byB1c2luZyBpbml0L2V4
aXQgY2FsbGJhY2tzIGFuZCBkcm9wIHRoZSBQTSBjYWxsYmFjay4NCg0KRllJLCBPbiBSWi9HM0Us
IGZvciBTVFIgdG8gd29yayB3aXRoIG1haW5saW5lLCB3ZSBuZWVkIHRvIHJlaW5pdGlhbGl6ZSB0
aGUgUEhZLg0KSSBoYXZlIGRvbmUgYmVsb3cgY2hhbmdlcyBvbiB0b3Agb2YgWzFdIHRvIG1ha2Ug
U1RSIHdvcmtpbmcuDQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MTcw
ODQwMTUuNzQxNTQtNC1wcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20vDQoN
CnN0YXRpYyBpbnQgcmVuZXNhc19nYmV0aF9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYsIHZvaWQgKnByaXYpDQogew0KKyAgICAgICBzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiA9IHBs
YXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KICAgICAgICBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0
X2RhdGEgKnBsYXRfZGF0Ow0KICAgICAgICBzdHJ1Y3QgcmVuZXNhc19nYmV0aCAqZ2JldGggPSBw
cml2Ow0KICAgICAgICBpbnQgcmV0Ow0KQEAgLTUwLDYgKzUyLDExIEBAIHN0YXRpYyBpbnQgcmVu
ZXNhc19nYmV0aF9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsIHZvaWQgKnByaXYp
DQogICAgICAgIGlmIChyZXQpDQogICAgICAgICAgICAgICAgcmVzZXRfY29udHJvbF9hc3NlcnQo
Z2JldGgtPnJzdGMpOw0KIA0KKyAgICAgICBpZiAoZ2JldGgtPnN1c3BlbmQpIHsNCisgICAgICAg
ICAgICAgICBnYmV0aC0+c3VzcGVuZCA9IGZhbHNlOw0KKyAgICAgICAgICAgICAgIHBoeV9pbml0
X2h3KG5kZXYtPnBoeWRldik7DQorICAgICAgIH0NCisNCiAgICAgICAgcmV0dXJuIHJldDsNCiB9
DQogDQpAQCAtNjYsNiArNzMsOCBAQCBzdGF0aWMgdm9pZCByZW5lc2FzX2diZXRoX2V4aXQoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgdm9pZCAqcHJpdikNCiAgICAgICAgcmV0ID0gcmVz
ZXRfY29udHJvbF9hc3NlcnQoZ2JldGgtPnJzdGMpOw0KICAgICAgICBpZiAocmV0KQ0KICAgICAg
ICAgICAgICAgIGRldl9lcnIoZ2JldGgtPmRldiwgIlJlc2V0IGFzc2VydCBmYWlsZWRcbiIpOw0K
Kw0KKyAgICAgICBnYmV0aC0+c3VzcGVuZCA9IHRydWU7DQogfQ0KIA0KIHN0YXRpYyBpbnQgcmVu
ZXNhc19nYmV0aF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KQEAgLTEzNiw2
ICsxNDUsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciByZW5lc2FzX2diZXRoX2Ry
aXZlciA9IHsNCiAgICAgICAgLnByb2JlICA9IHJlbmVzYXNfZ2JldGhfcHJvYmUsDQogICAgICAg
IC5kcml2ZXIgPSB7DQogICAgICAgICAgICAgICAgLm5hbWUgICAgICAgICAgID0gInJlbmVzYXMt
Z2JldGgiLA0KKyAgICAgICAgICAgICAgIC5wbSAgICAgICAgICAgICA9ICZzdG1tYWNfcGx0ZnJf
cG1fb3BzLA0KICAgICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9IHJlbmVzYXNfZ2JldGhf
bWF0Y2gsDQogICAgICAgIH0sDQogfTsNCg0KQ2hlZXJzLA0KQmlqdQ0K

