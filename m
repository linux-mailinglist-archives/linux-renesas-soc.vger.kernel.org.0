Return-Path: <linux-renesas-soc+bounces-24456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0F0C4CD81
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 11:02:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A59E4E3BD6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559C83176E0;
	Tue, 11 Nov 2025 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="EzCefE+K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00662FF149;
	Tue, 11 Nov 2025 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854898; cv=fail; b=EAFpopIY+iMbv0ylKeYsgb1aMGUJhqo8KjO9hYXtxZJiyZvF94F/PJJs3hfaGiktIZW6KPQ4Q/H26nDNkXTylOT/FpPhMgm2EjTSa0ljjL3R9drJkb65Lv+VNzdrXfik57sotR7uSvo7hlAylbxDsNhHFnEkjd3UOodLIyZn+SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854898; c=relaxed/simple;
	bh=ZbQgu0NMI5V7A4aOhwg8z6+L38Lcv0begFUjaeH0AfM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fdLA+aqVvyaLLMzeY5MrPwQ5QORCkTzHX/V4bAXt/GDP1LLmvBvTXIbwF7R3YXOYWtexkeS8CFEVmpkCgcQ/RJPGDcDJ8elio0M5wKXM0tNeCXJku6lt9yCT2feUPeWPLXqIGZauuOSDA+cfc4JGWrzqgj5G8XImwuIydA35J6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=EzCefE+K; arc=fail smtp.client-ip=52.101.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5TpbF+gUWIuX356RxGQ682hH9VMUc6e3IVtN5Cq3NdsZ0hj3zEUwZhDNjzl4iqB5JDdLZ4NWoeKipoUNqC+V3tKkl2daU4yjNl8iBSQhJ9qEwuPWZOZw+pKZDbOBYBXVvazyt7uGn6dmv6DNvKmUNuJC9oiIv/O6qiIEgvBM9nH9v9bBRXitkO+lzKOgQtfJfg2z+qskQewm/v2vxg04L26HZP7jxV5PXlSzQ77TD3o/onmL4j4C0hYXoeQHlk8Vsc83fbXsIMeF8A6cQxu/4sjeZVHCYSln0mEQQbHkOiH/IgKj0T8lXuIwvj7xQCRnCg6JUZaWP7ZtrwVmk2oGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbQgu0NMI5V7A4aOhwg8z6+L38Lcv0begFUjaeH0AfM=;
 b=l5scv1NYzqe3Tb3i631VBLwWgJb4sUVMqIhqEFk2lGmgT+x3K2x24Mt+toxm/TIpC4V49sM2bL+lWKxZwGCRIdWzFtWrEt82A4uRMlgnmnT77qI12X2JHhlPP4McS3AJUeGr36aA+Jg8DcObYom8JeLomS3Hep4FLFUpUe5tFJwSlBF0SkXboYSohmEyDHdz0GJwzXjOM0HfdKoJ3/pfi99KNUJXOAasJupiScdSHmiVWLIUT5+oTppogRn2u6GGTC8z16qTRwG1ptm2p1h+ykjsd1dlP7Ksw5agqS4kYoPdnfCigjpoj9EvzKUDge/25SejSDw6Ymlf9QGc/SV2aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbQgu0NMI5V7A4aOhwg8z6+L38Lcv0begFUjaeH0AfM=;
 b=EzCefE+KZrZVKIPOKc2No/CEGB3q4VCY2y6IaWDk760D9C0dIxB4+aPDPrett1FzRpbr1B61TI6joDKFRDx9RUjUp1VoEWasuBxwKwb45GCe5Z/jgKd0OQxf47Cdp8kR4zFtx+6VILrd71he093kCWF64kxY3PCjItE8IrFhzOny9k8WSLK8SEZAidpvA4aCjqxLQcKllgs6uQJCzVU3ffOUe5RikL+yvYwwbudK3qHhTgQImNvz9rhtzeEu6qaM4sMOcKE02ViaohCt7Rnoyx7mGON1zzvUn7VYpa69aR5GLhDt8pp+3YhrgluemWs8/9o+SFVB2KAA9tsLRJ1sQQ==
Received: from SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19)
 by DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 09:54:52 +0000
Received: from SA1PR11MB8278.namprd11.prod.outlook.com
 ([fe80::84fa:e267:e389:fa9]) by SA1PR11MB8278.namprd11.prod.outlook.com
 ([fe80::84fa:e267:e389:fa9%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 09:54:52 +0000
From: <Parthiban.Veerasooran@microchip.com>
To: <prabhakar.csengg@gmail.com>, <andrew@lunn.ch>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <Horatiu.Vultur@microchip.com>,
	<geert+renesas@glider.be>, <vladimir.oltean@nxp.com>,
	<vadim.fedorenko@linux.dev>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <biju.das.jz@bp.renesas.com>,
	<fabrizio.castro.jz@renesas.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v3 3/3] net: phy: mscc: Add support for PHY LED
 control
Thread-Topic: [PATCH net-next v3 3/3] net: phy: mscc: Add support for PHY LED
 control
Thread-Index: AQHcUuv6HPaTnXKeIEqo+AdYeA95FrTtPJsA
Date: Tue, 11 Nov 2025 09:54:52 +0000
Message-ID: <5be2d1a1-3eb5-44be-aa96-797be13ea7a2@microchip.com>
References: <20251111091047.831005-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251111091047.831005-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251111091047.831005-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8278:EE_|DS0PR11MB7880:EE_
x-ms-office365-filtering-correlation-id: 3301fdd8-9d52-41d4-430c-08de21085c6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bDB3NjV4cUJSODdxcHNMSzJSaGpmQnczUFhyR0JLQ0lnNjQyR2RMYUdRQS8y?=
 =?utf-8?B?Ulp6VENJK0JQb0dGK3hvbXB1dHBpNCttUjF0cGRmSGlsRkNlV2xRWE1qSFZw?=
 =?utf-8?B?djVhRnlvaG16QWU2WVNiWHI2MUtzM3EyTXdRV1FLa2NLRjB6VVg1dW52bGNx?=
 =?utf-8?B?ZzE3czFTYnFtek9OMzhqcHhGL0NuYjNESFV2OFl0ak5PV01nZEdsWDF5V1Bz?=
 =?utf-8?B?ejhZZjFoRnVZVnU2M084QmxYd1p6SlJIcVU4WlJidGZLbWpzakcyRGZjVzFh?=
 =?utf-8?B?VG94djNJVjB3Rm9zNXE5eEhpVnpJM3JRZktUYXNJWWpLb0VvLzZGL0tOYlJC?=
 =?utf-8?B?ZWhiNTNLbS9Pd3g0RzFpM0Erb3RVbmVKV1YwTURsUW9GRnVkaEsxS0VKdXhC?=
 =?utf-8?B?MFZvVnVDNWhsQWw3OEFKZ3lZWHVnSTAzOEYvMG5PZGttWDhqQlYzK01ZVmZz?=
 =?utf-8?B?UUFmNmV1aWlMNEZ2L0xhMzlEeTRLOEk0c0VXRUV3b3JuM3BiMlFhYklOcXFO?=
 =?utf-8?B?N09DcU9YQW5vRVVEbzFDYTJPWW91V1pjYTR5T1lKSTBEbGZFeHhscHVpS20z?=
 =?utf-8?B?dk82eUIvZ1A1UDk0WDdueVhqL2Z5MGY5TTNRUEYwY2NkUysyQ1RST281RWw4?=
 =?utf-8?B?OWQxYVlsaDR1NThRSks0S3FTME1lSHhLaE5Zd2JLL3FBemlzdEo5NG1DYS9U?=
 =?utf-8?B?cHN4TlFUL1FFdEY0RXZGTm9taCsvaEtUSWs2emV5S3RuT2pQMGRURHNrcnRJ?=
 =?utf-8?B?YVZUYzljZnZXbkx3NFFZbnpnR2NkdUUxUVVqQnliam1JUkVoaERoU3YwWnpG?=
 =?utf-8?B?eituRWZZS2JXd29PY1FXZllTcWoxSzZGSkIyckNLdmhTc0JtMDR2ZWg2V0pE?=
 =?utf-8?B?cmJFdVRhRXRLS2FzbWM1eUNSMEdaMnN6Y0orUmxENnUvMzBsbExvS3VVN2dq?=
 =?utf-8?B?Q0VaekVnU0pFQTJ3cXo5blBzd05zYkJOcnhUeUh3OWg5YkQzSmNYc0o5UzVO?=
 =?utf-8?B?QitkaHJPQ0NLQ1UwSkZlM0hyNys1TmJ3b1lrL2hDT21SYUJHL01weDUzM1h1?=
 =?utf-8?B?M1pQYUlBUHhteU9SaElMYjNNOEZRTlhBbG5uK3dPa1VYSWhHWGVHREQ1OHEv?=
 =?utf-8?B?YThUUWxGbGt5YkZVZEZFTjFLTVlybW44djdMRUZJVTJGdngrZnZZcDFNT1kx?=
 =?utf-8?B?d004Q1dYNERSa2FScDQ3eENKdHhlVHlUemxPZU9SdGtTM1hGZ2dtcTREdkhM?=
 =?utf-8?B?RFF5dEdnZHRJLzAzTWVncTk0dUUwWFNXN3MremlCTXRQVmsxaFJNRllNOFRZ?=
 =?utf-8?B?R1ViY2Q5ZjdiRVZZZkNjNEk3WkZwWENEL1k2aXM0NWRLMEtzeHlwMTM1Umwr?=
 =?utf-8?B?REkyYXl6ZFJYTkVPdE9EbkZYY1orbElYTlphRjc4RHV2ZUtwL0lBSmR5YTdF?=
 =?utf-8?B?SE9Fckh3U2k5N1ZZcUhQNG5kMUtaNWVyc29GZGlNbFU5ZGF2ZG52czZ1bGU0?=
 =?utf-8?B?Vnk0REhoL0tkalJTZnIxb2RSdW9MS3Z6amlzSXNuMnA1c3ZUSFNLR1psbUlH?=
 =?utf-8?B?anlSQWZkTjdmSnBpeS9uYjl6U2JoWEJIODFLVUExNHhUU0hLWEcya1ZvcCt1?=
 =?utf-8?B?NjRpWHU4OWZMdFdrOVRtYnk5eFNieW5XZnpKSkVPS2hKY25KRVY5Q05qUitn?=
 =?utf-8?B?eGE5QnlGUW9IQ0Rnc3U4NmFDcWZocm5JQUlZUnRwYWNlTUNSSjltN3JiaXFX?=
 =?utf-8?B?SVNqSWVHOWVtTGxpNUJoTTZZWVdUYkZnN1lZOG9ocGpDRjltcFJRejQwTjFP?=
 =?utf-8?B?dlhaWG1xU3dDL09ScUZJdkhrSEhnVGlVRWRBcWxNQkdWaUc2Nm1KVVFHdTV4?=
 =?utf-8?B?UUNRTXJxSjdkdmR5MjVwQTZ1aWJEWWxuVzNzSzNoN2t3MnFCck1qSWYwS1Ur?=
 =?utf-8?B?TFZsY1c5dy9YSVlOdmV0cHIxSW1MUFVGK2s1WWE2RktET1hicGRqK2w4R054?=
 =?utf-8?B?eFVrZURNQ2tvRmVmTCs4eFNrOFRIcFJSOURoNkFod0dVbUMwNTNsdjhkOXBn?=
 =?utf-8?B?aXNCL2daeERCV0RFWGljcjZXNzd3cTZBNkVCUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8278.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nk9LZWdjNExFRElWcWx6b3hyQVM1VFZzMmU2a1JGMEh1MkZ6N3IzRmc3S2lE?=
 =?utf-8?B?TDNscTFFZS9hMjJRRDJia2N1UUdpbmZlYUVJcjA0bWdoUUVtRDJhRHlQYjhy?=
 =?utf-8?B?Zm5GNWJHNXZuUFZYckw4MDBtOENrTTBYRWdoalV2ZHI4MzM4a2JKcHBORHJP?=
 =?utf-8?B?L0ZoNGh3WDZFMHA5YXpzQlNJMC9MditqTTYzZEIwa2pGam5kZlZ2N0c2T0gw?=
 =?utf-8?B?WEJGZUtucTZvSjg1Q1VrSjFoTDhNZUVSeC9RQlo2eWpZOGtYcVVDdHZXWUg4?=
 =?utf-8?B?djBwVCtjWG5RRkZjNTk4QUMyN3VsSFRyRzVORUY2UEhWR1JQcHM4YU54cFRv?=
 =?utf-8?B?bGE5R1dYNnJhc3BEU3J0ZUs5eHBDQkhHc3hic3FnWTRVRm1lTnRWR2N4R0Mz?=
 =?utf-8?B?cDE0bWZXM3Uzdnc4TnRub2xNR1NML0I5Und0ZVhvQjE2RGY2MmZMY0luRXNE?=
 =?utf-8?B?K0Qrd1VsenlFYTVhZTU1OVBhTDl2K3BIRlVUc2lDeHhRdTk5eFc3ZHVTUzJs?=
 =?utf-8?B?N09GVG9QTnk3a2NEL0p3ekwwUnphQUVLS2p0WWQ5Zmt1NjU1b0FXaXZMVXgv?=
 =?utf-8?B?QVhWdFNjZEpmUS9hYW4ybEJGV2liVExIV2JFQnIrbVY2NnhmSTVuQWpHcEtM?=
 =?utf-8?B?cWxpL002dEk4cjhTWFJPOG0ycHZMYTJDbWpWdzdwMk5Sc3NuemlXVSt1T0hq?=
 =?utf-8?B?eUkrcDl6WGNtWFYwM1BLOGhFcENnSE1XSk1vZm8zbXV6TTRrVG1ic1hzRW12?=
 =?utf-8?B?SGY4Q1NGMWlybm1Zc0YrYm1SYk9ERGlKZHpnWFVJNCtIelhNbGk1YWRXMjdh?=
 =?utf-8?B?aTFvMWVUaVNzNXVwTzBhMEZJYjV1YWIzQVo1c3hmdGxEVTI1cHFwdktZVWdx?=
 =?utf-8?B?R3Q3akNYdnFhMEN2a29aQXlFaVc2ampLL0Q2YnRuRUlFeGRlL3lNUFRaNUJN?=
 =?utf-8?B?TTlCUWR4aHV6ZkhicmF3L0tRU3FhdWlPM3Q4OUxDeXorK1U1RUp5a3oranZS?=
 =?utf-8?B?RDdYSVRQN2F2VVlYcy8xTkloRG1KWG9ja0hld3g0Ull5WE5RK20yUXhEM2lk?=
 =?utf-8?B?SFdmR284RXhLZkwxdFVtM0QzbFdDaFN1TnhzOHZBODdlQ25LdmEya1pYMEI0?=
 =?utf-8?B?U2Z5VkYyZDR6OUdoZmNxeWFTN1hFZmVxa0xaamFUS2QyNWJSTW5mdUVzK2FI?=
 =?utf-8?B?QjNGZHQ2bnpMZnBQc2JyNDJkVlpWT3RIQnQycE5FQjhsa0lFUVkrdXNmaGpG?=
 =?utf-8?B?RlNsbTNiUWVJUm9oOG5Jb0NJZ0dlRVR2WlRuWXBuQUl0VlBCVTVtOGhEcEk3?=
 =?utf-8?B?d0ZYR2lRSmdpTWJkWVd4MnEzWDE1MnRtWHVLL2diZEhEN1JITlI5WVB3eDJ3?=
 =?utf-8?B?am1QbU9kVnFYekpxK2x3VnZ3dS9MbzJrVHp4U1Npd1RTVmtVVmxTSmkwT2lr?=
 =?utf-8?B?QnBXWEY1VUlhT2k4U1krVklwYUVmUEpUZzhCa2hFYk95MzE3YzhPU0pqWDdj?=
 =?utf-8?B?VjRLZVpxRFVLQUF3cXhEYTNQZUJtMndibWs4UjY0dXkvMDMwWGJqSW84a1lV?=
 =?utf-8?B?Y0I3NG5zeGFNMTlZcytMMWtoTUpBUStrNy9LZ1B2Qllhc1pESi92NEFlY1NZ?=
 =?utf-8?B?aEJWVkQ4bUI2L0Q4QzdyWktqbDFHRHpoc0RwMWF0TkI1Q2I5bGt5QVY3ZEp5?=
 =?utf-8?B?cW1rSDJlVFdoVWV1elhCTG85Z3VVR2pFWXVUUmFhSlNNWDhDQkJ4SHJsYmQx?=
 =?utf-8?B?WFliS3ZFUVVROEJBMkpWaWZmS0JJaEovODlaYTVlaGJ6ZUpFd2lyMXBUL00v?=
 =?utf-8?B?RmE5Qzh4NVlHTzB0TCs3VS9yUGQ4Y2YxQnkrRkU3SnJtMnM2ZzVKRlg4YlRx?=
 =?utf-8?B?VElKbTUxbUZ4R0FpM0xGcGFsOHdnYjZOMVU3WlMzVHl1czBQSVlmdklyNWNs?=
 =?utf-8?B?Z1laYjBrTFFKQ1hteUxmM2UzQnMzZzZPUkNzQlNRUlAxSHdpRmU1RGNwSGFL?=
 =?utf-8?B?bCt3MnF1NzlyUUZ3TWtNbXFvWEpCWTIzdzg4RFFSOG9QN1Zjc09RM2pRVThs?=
 =?utf-8?B?eElyayt2TTJzU3RPMnVSaGlucG1KNm1uSjVVUEpSVFlxaGhkcC92TDZ3M0NV?=
 =?utf-8?B?MUdGOUR6UWd6S0oxZ1kwc0FPUUhqMlZZalVXSExpcDVqK040STErTzdyeW9T?=
 =?utf-8?B?WHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B62AE94090A3634B9DAA8742F7227A9A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3301fdd8-9d52-41d4-430c-08de21085c6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 09:54:52.7203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OHHb9NewSNEm8uTzpSBWkUjoxw7TPQSRMDFANw+wGOL79UdfDFRZXJ0PTh8UFBN3H4QFmNSfTynaWI+4y6ez7iRoiwkNPYXbgRqCUPg6rricaKX4hQEYYhfzLCq12bPm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7880

T24gMTEvMTEvMjUgMjo0MCBwbSwgUHJhYmhha2FyIHdyb3RlOg0KPiArc3RhdGljIGludCB2c2M4
NXh4X2xlZF9jb21iaW5lX2Rpc2FibGVfc2V0KHN0cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1OCBsZWRfbnVtLCBi
b29sIGNvbWJpbmVfZGlzYWJsZSkNCj4gK3sNCj4gKyAgICAgICB1MTYgbWFzayA9IExFRF9DT01C
SU5FX0RJU19NQVNLKGxlZF9udW0pOw0KPiArICAgICAgIHUxNiB2YWwgPSBMRURfQ09NQklORV9E
SVMobGVkX251bSwgY29tYmluZV9kaXNhYmxlKTsNCkZvbGxvdyByZXZlcnNlIHhtYXMgdHJlZSB2
YXJpYWJsZSBkZWNsYXJhdGlvbiBzdHlsZS4NCg0KQmVzdCByZWdhcmRzLA0KUGFydGhpYmFuIFYN
Cj4gKw0KPiArICAgICAgIHJldHVybiBwaHlfbW9kaWZ5KHBoeWRldiwgTVNDQ19QSFlfTEVEX0JF
SEFWSU9SLCBtYXNrLCB2YWwpOw0KPiArfQ0K

