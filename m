Return-Path: <linux-renesas-soc+bounces-25788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E796CCC1B6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 10:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE7553038171
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 09:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F54C324704;
	Tue, 16 Dec 2025 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ASROKAeK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011003.outbound.protection.outlook.com [52.101.125.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813BA30FF25;
	Tue, 16 Dec 2025 09:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876607; cv=fail; b=dvAzQLrx5vvTTXOYFSk5WPYHbBvsxeF1PK1WQmSO9zQ12JcRdPZ4ikHvXYTJ9BZrYTjhnnW1mvsNCT7tYKss1cmFe4HT4FbqCpfs7kVTZMUTl95KFVqhucSRJ3Egvyx9F/b21Wlya1USTVSAEbU48CQBTqX2fyWXbSOVfvvDDIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876607; c=relaxed/simple;
	bh=cMPoDRFPLkyKAotIIHQ4iE/+7DRJI37CZUZBmD/IuUw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mpxfq0hwL41C/FDokNZ7DeZZgBP8+p/xEcZsPYo97HiRZnNdJmj7y3idqLH1Ss+N6Q/di8Dtxe7jWsVYf5GW82kIOYXaSgKFNFjyP+HxV1zjne+WgTBxUSgpKIivejMbTJoYVpbrpekX+pYqaLcuAAveGcDSMSCsXE6eVW+xw3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ASROKAeK; arc=fail smtp.client-ip=52.101.125.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGV/Mw8Al7tVz0wDZCuRes3rIb1Nj3Dc+ccPA0jx8Ijlh2e3OG6XfYB/XQkLIYhV604GbP1ik2E0cT7nqkotqLDZD0ILeSiV4FKU6LDea4ZzWhM4qM6z63bJDHQ8jk4em36SzbUNLrPtswAcRI2VHfBMCWOG6hEKuz2lE2RD6s2liHKzhns/PaKIVghShaiSFaOBD6OpWZUltWM24GrVVCzHzL2WkWtB/MrsCP9Jhs+RCWKwYkwt/Y/WKE20pgZfYbX5okP5hEhkjOAG3AtdSJeDMBkyvMp5K7bvGZhrO9sLwwvl+TAb3ATssXsTT14pOynS/ZTrd6EpijHSnR3PCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMPoDRFPLkyKAotIIHQ4iE/+7DRJI37CZUZBmD/IuUw=;
 b=SK34v3JHWcDXvLj8loFOQpoN+GMjXQN7KGhUbnG33WAs3cC6pPM/5R5ddoBvXW8o42vCNXHfRefCpHg74+kB9ZpsceGk3wbIJB2XrUqH2hqYUfwohkClFdsnohAq9H0FrPdFjJ0h2MGg8Q2NyX11QvHmekl7Ca9dIGwwJiWCMmvuxP42QxMhjbhf+emYXWG2bbuvMOkgvVT71e4/KtdR57Zqa2cSHuVjE95k7jfdvV2Bfsfj7XoZ6Iq81uHj4pBlHIsOqqDq2P1m+M59ROVqnVgxFvt9gxgnXTc3AcDrSN7dwcQNVbOLan2O6FKjGjC4Z1TQzpRhHh86KtO85Bv5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMPoDRFPLkyKAotIIHQ4iE/+7DRJI37CZUZBmD/IuUw=;
 b=ASROKAeKMG/O0IHf/k8Jcl8xcR9nrxNImg3l/GcHKKiaY7+xhTClf7zkYSJ6XJ5jj4lCDiQ0TCsO76iqqkxNpobDMsXk2kqPTh6sNplp9jMpgTu48Py3lg78UKCn+TB6J8CZPGMfVFKJ9H4jCk6dcep2/x67fMRMzkCNh7wNpIM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11459.jpnprd01.prod.outlook.com (2603:1096:604:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 09:16:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 09:16:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Topic: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Index:
 AQHcUkXayA+E33hY1EmsX/GuWX+dybUR8j8AgADxDfCAABPzgIADNCBAgA4F4wCAAAJd0A==
Date: Tue, 16 Dec 2025 09:16:35 +0000
Message-ID:
 <TY3PR01MB113462F232165CDB2208E19F586AAA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
 <TY3PR01MB11346D053263D4E4C367F1EA186A5A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <3d8896c7-9ba8-43f2-8464-a94acdf82ba3@tuxon.dev>
In-Reply-To: <3d8896c7-9ba8-43f2-8464-a94acdf82ba3@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11459:EE_
x-ms-office365-filtering-correlation-id: 556673ce-0a36-4c55-91c9-08de3c83cf8d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?N1lYcy8vK0dmK3ZiOXdqMklUOGcyNm05U0Y1N3BBNjYwSlNpYVFvVFlZRUsw?=
 =?utf-8?B?K3lDNmdsTmhOTjRsVTcyR3p2N2dBNVgzTnc2UUptUFgweUhxZFN2RXlRYnhh?=
 =?utf-8?B?WGNPaTJKNE56anZLdU9PME8xUmt6b0RocEk5dHk3RlVoNXZKeXBJZFJJSW1S?=
 =?utf-8?B?U2FsMnBPNEIwWUxjS0RLeFBWN0tySDVXMUxxbVM4TU81T1R6b0VObjBDR2I5?=
 =?utf-8?B?K0loTUlYUGVUTzREaEttcWVZUm9JdkZJcVY4NVVlUWZmZCtreGxLVEord3Nn?=
 =?utf-8?B?YTBQQXJ6TXQ0cG5lcVhHaWFXd3dJczJiNHdaa2JTUEIxb3JLR1ZkcG1MUHhH?=
 =?utf-8?B?U1ZWREpYbVBiVWxYbmI3YVR0Q01jRzBIUGkyVTdwOWtCZG5lcU5yL0NJSWVQ?=
 =?utf-8?B?SU5uTlVNWUp1bmwyY05MZ2tQSGkzWmZ4LzBuVllnTTlMeDBEdHJTNWdXSmNC?=
 =?utf-8?B?bmp3eDcyUHFiQ2xIUW1hU1ZTVVhhbHZncnBSejlaMDFuaXNaNXhUKzlveU1V?=
 =?utf-8?B?Mmh2TjE5NjJWQ1RUSk1RNy9NYWFVaVNTRjlwNHRwTTNjajA0V2Y4d25JOVQ3?=
 =?utf-8?B?WjJocTNINTN0bmg5ZFVDdTlmNWNUV0RCSmV6Mzd4b2pWTlVqVzEzSkJpOUd2?=
 =?utf-8?B?YStMLy9ER0FVWVFtUDJrUkZkb1RYNkdnZE5kL1NRejdBM0QxS2J1akNReW4z?=
 =?utf-8?B?TXFSU20zTUhBLzIvVTAzMzh0TThFbkVkSkIxY1FMVy9UWU0zTTZVSnZXRGJu?=
 =?utf-8?B?eWFab2UwRkZkOFBKcStpYnlWWTVVQmVxZUwxNUhhTk8ra2wrTWpmbXhjeGtV?=
 =?utf-8?B?cWpWdVNQODNSMllpK1c5NUQxUUUzRWE4cEtiSlJpbHdyTWRBQ3dEZXFyalpP?=
 =?utf-8?B?VzBZY0FLS0p0bENLaGNlTzEvMHF5NHp2alE0SDMzQk5UNXZmR1BXWkp4aWVW?=
 =?utf-8?B?d29VSEYzOGx4Tk5GbkdmVUMxdGlJY3E4aWNaV29RK09hd1pSY1Q5VHFEOFkz?=
 =?utf-8?B?UXJnMzZta1hUWXN0ckNTaUkrTnVjMFQxSWlNTWNaMk1HV25ENVZoUWdPYXM3?=
 =?utf-8?B?VmRwSE5rT0NwVjd4TGNpUVpnOGtRUWRkd3IxZVZabVhlWGNVVlBOeWpEc1Ft?=
 =?utf-8?B?dVEwOVhYbCtxb2lZazQ4VFpINVA1Y0N6SzhUbXNxOVdCV3ducUNwYzA1NUcx?=
 =?utf-8?B?dU1mamp6K3E0NVFDNG5hMDNwQUZYUjlKMVhod3FQOVM0L0t3OTRKV0JrdDhw?=
 =?utf-8?B?dGF3cGx5YVpISkZlTGltLy9kdkdkNVNNaHpvNzVQeVRKSmlaNENsVk0rS0oz?=
 =?utf-8?B?YjlhOVNTb0F5QjFyQ2JpZmJqQ1lOTDE5QjF4RlQwakZPR1ZQL1h0OU92cy9Q?=
 =?utf-8?B?VXZqSWxWamhjd3J1emdEeXRFQXVKRnVRV1lmTGZPelpXMDBxd25hTGxiS1J3?=
 =?utf-8?B?bEs4eUZteEcvNklaQ082OExEUHNBSFcwWjRqa05mN25xais4QTFweW9tM1Zy?=
 =?utf-8?B?YW9aWDFhMjdoZ1czVmxkRXNYK2k1bVE3c3hSU0dtakYyVkFrbXdML2xMWWZU?=
 =?utf-8?B?bUxKYytaeEhwWTRWUW1LUDJ2YjFWaHU5U2c2eDRnOG5TOTJMalFrdW5TVmhz?=
 =?utf-8?B?QUtCWmtWazA0T2FDaFkyWWhDZ1VLUGRpelpMbHNqTWZDQTVuWFQ5L2FtNnJj?=
 =?utf-8?B?ZUJTMHNOemxBczFyczB6c3NoS0VNalIzS0YrYWR5MGNEbS9wTEQvM2QwNVFq?=
 =?utf-8?B?Q00rRXFwdVY3MUxKRkEyZUdQV3RlRW0zLzcwV3MvemVSZEFSTWIzMGVPQ2dC?=
 =?utf-8?B?VEV2K0pLV1c2NTI5ekNLMHg4T2hJWmRIT250c29ERElVKzE1UzM2dUhIVDRX?=
 =?utf-8?B?TVRlU2hLTTF2UGt6VzdqeC9MYUllQm52cERLUjQ1RVdENXBodUFRWmRVRXJO?=
 =?utf-8?B?NHBSa2xxODVSRFZpVUNoajIrSHJRakdLczg1K2M2Qko3ZytDZ2RlclVsTHV0?=
 =?utf-8?B?bmVHZUpocUZlWTIwRFE0dGduakJuTFdycUlhTGVuS2NERjRKMlAxWFZpeE5Y?=
 =?utf-8?Q?083hb5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajlSUGJUTFMrTkFacXZieEV6YmsrQi82WDlRemZLbzYyNEZqdzdtbTExN1No?=
 =?utf-8?B?TDBnLzRzS1B2VkJDQnlWQk0wR3EzWlQvaHAzQXVlbEpsbU83cSsvS0VGbmw0?=
 =?utf-8?B?UEQ2L1pNdTcveDgvVUlLMm1OTnVLYkJqaDZ5cVNwdG8rNnZnNDg2MzgzYkJv?=
 =?utf-8?B?b1lCdytvSFVFZE5nbTN1Sko0ME5BLzlIU0kyN2x1VWg4YlZrU1VPdnM0OFRp?=
 =?utf-8?B?cE1TVC9UaG55Rzl1eHlWRFU2b0UvejhhNnlrRXpPNXBkcDNiQWRnTnh5ZTdR?=
 =?utf-8?B?Z0RsaEJOVUpKc3FhdGlVaUJhcHljcFpmMVdNcFkweE82QWpGL3NEZTk0SXI0?=
 =?utf-8?B?UVNBSWxsMGFxT2tCbkVsOUpDTUJmellKSkdYNlVmc1pyTm54TDBYeXc2ZHpX?=
 =?utf-8?B?U3JzMXQ3TXduTFozVVo2cVEwS1hKK09IUXJNQm9nSTA4anQ5dkFwckZyWmVF?=
 =?utf-8?B?cFo3OGhMTWplbDR2THpPdHNlS1Z2RWdHTDJqYXFzYXBDT1JKYW9tbnh0dGNv?=
 =?utf-8?B?OS9IeCsvSGsyRGVkUXdLN21zbmxQaktTRWdxTy9WaTF1MkhxcU1QQnBlNVI2?=
 =?utf-8?B?UVM1ZkcvRVlRZnRJMGpOdzdVVnVtdC9MbnNZa21QY2dEejBnR0kySmovKzN0?=
 =?utf-8?B?bzg2Wkx2TXpMMEx0dFYzb0NSV0QvTWFjc08vR29USWxGYmhHU0Z1RGptSUww?=
 =?utf-8?B?ekRzZzFKMWZMaTdaYjluNjR4TnpadEFibkp3MGtLNjd0Y2l6dXY1TEtLWHFY?=
 =?utf-8?B?OWw5MW5lQ2crcVpHa25pbkNyQTV2aDE4eWRid2l2OFIrTTlUOWNORytHc0RF?=
 =?utf-8?B?MXBrcmZ1M0wvQmRrbUx1NUN4eDhRTS91S2YrSmN3bDljUnd5YW9tQzlZemNQ?=
 =?utf-8?B?ZlVxb3BxRStGSWpaYkM1SWRjN0J6QUcrNmNmV1NMRk1JVWxRbGRENWx0NkZQ?=
 =?utf-8?B?aWRGdkdNVzlGaGJBYkJJaTZOUld2VVI5YWVJT0dvZXJyOGI4UXI1MVZVMlNW?=
 =?utf-8?B?WDB5NCt1eFZwdjFQL1dQL0pLL3hqTkdpVnFoL2lNeDhCdDJLQWtmQURQdWND?=
 =?utf-8?B?d0ZwWWpJZWp1cXg2UERXSC81QkpNaFZlNllpc2V1Qlo0Q2gxcU1QSGxzclda?=
 =?utf-8?B?RnNINHQvMEhlL3lBSTdTSFIza2R2TTRBY0oxam8wK0tlYmtiQUkzMWw4Tldo?=
 =?utf-8?B?Q0RmZHg3YTJkSjB0d3FUSFZWSStnMWZlcFJMN1UzNXRpb0pzYnQ5YmJKZ016?=
 =?utf-8?B?YXpaZ2JzN1N1OFpCaUJZNXRuYVNFa2ZkK0RNeGJ6Vlk3eFZVdlZIYkFNV0g0?=
 =?utf-8?B?NXFzZ1pJSGxhS2t0cnhNUzNSV004Y2VVSEpOSUpHTUovc1VpZnVLTXpBQnJl?=
 =?utf-8?B?bnYzUUcwV0RZZnJ6blVvRk5UemZYSUpzZG8wMUhscmNkL3VINno1cnFlcUhJ?=
 =?utf-8?B?VDR1VVFia0FIeW5ndENUNEpZNzYyNFhZb2JTNlNtQXZ0OXVOaHM3eXAzdE16?=
 =?utf-8?B?MnJSRWZKTndiVTlubU41NDh3bHZOaldrd2hIMmx1RS96c05IZUZtNlFIMmVJ?=
 =?utf-8?B?S1Ria1AyaXI3c0tQV0RITHppZkd1azh0WXE0TmJ3Z3hCalQ3MkxtanArZWRR?=
 =?utf-8?B?c2xxQTRRWElYRkNvMHo3RmUrM1NEcXI4a2ZoT0wwS1J6UnhPbXlzRGtKRndE?=
 =?utf-8?B?VXFnK3puOEVURGh6cWJ1eXh1THBkelJLbGxJdkJGay9IQVRGMFJObEM4TlFT?=
 =?utf-8?B?bEtWSDJuYitlZHBYbFdVWmRaei80My8rRjJtR0FxeE5hb1lxTzh6d2ZmYUFy?=
 =?utf-8?B?K1dZOFNTU2xxenowZEp3a3dheW9WWEt6M3RJL0lZNGdsZFhsdzViQXE3eWJL?=
 =?utf-8?B?WmpGLzVOK0R2dHlRbXhUQXlMc00wUWxLVkI5dzNveGVjV1lnMkRDZTNRc2JD?=
 =?utf-8?B?RCtGcHR1WW1lQlVrNU5qS0pHdk43OS9yZkN1ZnRNcGtHWXlORkdkdXFKckN4?=
 =?utf-8?B?NDY1VElnV25mNXFaT094Mm9zWG9JKzlJTWZTd2JTUThaRW1FWXFrdStGWm5B?=
 =?utf-8?B?SmM1ZldUUXdxT2xTUUFXd256Mlcza1VZSTZqY3Flcy8yNFdTNjRKdlVLVjky?=
 =?utf-8?B?MTlNb290UUhuVy9VOWpmVTAxdVdZUEFFeXl3dVZsVGZGejJjYy9MWHVuRGJR?=
 =?utf-8?B?Qnc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 556673ce-0a36-4c55-91c9-08de3c83cf8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 09:16:35.3339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hy77PgJ9F6/wVIBqNwhG9Xu0JNho/u65HKFbfWmAW0oDhantyK8fqi1l9qhaiPbDA+usmqqPsa2V4x5cBsFARgvGmQXZe3jUHd1q9/0/JeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11459

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAxNiBEZWNlbWJl
ciAyMDI1IDA5OjA0DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC8yXSByZXNldDogcnpnMmwt
dXNicGh5LWN0cmw6IEFkZCBzdXNwZW5kIHRvIFJBTSBzdXBwb3J0DQo+IA0KPiBIaSwgQmlqdSwN
Cj4gDQo+IE9uIDEyLzcvMjUgMTM6MDIsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIENsYXVkaXUs
DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQ2xhdWRp
dSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4gU2VudDogMDUgRGVjZW1i
ZXIgMjAyNSAxMDowMA0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAvMl0gcmVzZXQ6IHJ6
ZzJsLXVzYnBoeS1jdHJsOiBBZGQgc3VzcGVuZCB0bw0KPiA+PiBSQU0gc3VwcG9ydA0KPiA+Pg0K
PiA+PiBIaSwgQmlqdSwNCj4gPj4NCj4gPj4gT24gMTIvNS8yNSAxMDo1MywgQmlqdSBEYXMgd3Jv
dGU6DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+IEhpIENsYXVkaXUsDQo+ID4+Pg0KPiA+Pj4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVk
aXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4+PiBTZW50OiAwNCBEZWNlbWJlciAyMDI1IDE4OjI2
DQo+ID4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzJdIHJlc2V0OiByemcybC11c2JwaHkt
Y3RybDogQWRkIHN1c3BlbmQNCj4gPj4+PiB0byBSQU0gc3VwcG9ydA0KPiA+Pj4+DQo+ID4+Pj4g
SGksIFBoaWxpcHAsDQo+ID4+Pj4NCj4gPj4+PiBDb3VsZCB5b3UgcGxlYXNlIGxldCBtZSBrbm93
IGlmIHRoZXJlJ3MgYW55dGhpbmcgSSBzaG91bGQgZG8gZm9yIHRoaXMgc2VyaWVzPw0KPiA+Pj4N
Cj4gPj4+IElmIHJ6ZzJsX3VzYnBoeV9jdHJsX3N1c3BlbmQoKSBmYWlscywgV2hhdCBpcyB0aGUg
cHJvYmFiaWxpdHkgdGhhdA0KPiA+Pj4gaXQgd2lsbCBzdXNwZW5kIGFnYWluIHdpdGhvdXQgYW55
IGlzc3VlDQo+ID4+DQo+ID4+IEhvdyBjYW4gSSBtZWFzdXJlIHRoaXM/DQo+ID4+DQo+ID4+IFRo
ZSBpZGVhIHdpdGggdGhpcyBjb2RlIHdhcyB0aGUgZm9sbG93aW5nOiBpZiBhbnkgaW5zdHJ1Y3Rp
b24gb2YNCj4gPj4gc3VzcGVuZCBmYWlscywgdGhlIHN1c3BlbmQgaXMgYWJvcnRlZCwgdGh1cyBj
b2RlIGluDQo+ID4+IHJ6ZzJsX3VzYnBoeV9jdHJsX3N1c3BlbmQoKSBpcyB0cnlpbmcgdG8gcmVz
dG9yZSB0aGUgcnVudGltZSBzdGF0ZSBvZiB0aGUgSFcgc28gdGhhdCBubyBydW50aW1lDQo+IHVz
ZXJzIG9mIGl0IHRvIGJlIGFmZmVjdGVkLiBUaGlzIGlzIGFsc28gaG93IGNvcmUgc3VzcGVuZCBj
b2RlIGlzIGRvaW5nLCBlLmcuDQo+ID4+IHN1c3BlbmRfZGV2aWNlc19hbmRfZW50ZXIoKS4NCj4g
Pg0KPiA+IEFmdGVyIHJlY2hlY2tpbmcsIHRoZSBjbGVhbnVwKCkgaW4gdGhlIHN1c3BlbmQgY29k
ZSBtYWtpbmcgdXNhZ2UgY291bnQgdW5iYWxhbmNlZC4NCj4gPg0KPiA+IEVnOg0KPiA+ICBTdXNw
ZW5kIHJldHVybnMgZXJyb3Igd2l0aCB0aGUgZm9sbG93aW5nIHVzYWdlIGNvdW50IGluY3JlbWVu
dGVkDQo+ID4NCj4gPiBzdGF0aWMgaW50IHJ6ZzJsX3VzYnBoeV9jdHJsX3N1c3BlbmQoc3RydWN0
IGRldmljZSAqZGV2KSB7DQo+ID4gcmVzZXRfZGVhc3NlcnQ6DQo+ID4gKwlyZXNldF9jb250cm9s
X2RlYXNzZXJ0KHByaXYtPnJzdGMpOw0KPiA+ICtycG1fcmVzdW1lOg0KPiA+ICsJcG1fcnVudGlt
ZV9yZXN1bWVfYW5kX2dldChkZXYpOw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiB9DQo+ID4NCj4g
Pg0KPiA+IFRoZSBzdXNwZW5kIGVycm9yIGNvZGUgaW52b2tlcyBkZXZpY2UgcmVzdW1lWzFdIGFu
ZCBpbiB0aGF0IHlvdSBhcmUNCj4gPiBhZ2FpbiBjYWxsaW5nDQo+ID4gcmVzZXRfY29udHJvbF9k
ZWFzc2VydCgpIGFuZCBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgd2hpY2ggbWFrZXMNCj4g
PiB0aGUgdXNhZ2UgY291bnQgdW5iYWxhbmNlZCBmb3JldmVyLg0KPiA+DQo+ID4gU28sIGxvb2tz
IGxpa2UgdGhlIGN1cnJlbnQgbG9naWMgaW4gdGhlIEFkZCBzdXNwZW5kIHRvIFJBTSBzdXBwb3J0
IHBhdGNoIGlzIHdyb25nLg0KPiANCj4gU2VlaW5nIFsxXSwgWzJdLCBbM10gYmVpbmcgcG9zdGVk
IGJ5IHlvdSwgYW5kIFsyXSBmb2xsb3dpbmcgdGhlIHNhbWUgcGF0dGVybiBhcyBwcm9wb3NlZCBp
biB0aGlzDQo+IHBhdGNoLCBhcmUgeW91IHN0aWxsIGNvbnNpZGVyaW5nIHRoZSBhcHByb2FjaCBp
biB0aGlzIHBhdGNoIGJlaW5nIHdyb25nID8NCg0KTEdUTS4gYXMgcmVzZXQgZmFpbHVyZXMgd2ls
bCBiZSBhdXRvbWF0aWNhbGx5IHRha2VuIGNhcmUgaW4gcGF0Y2hbM10uDQoNCkFzc2VydCBmYWls
dXJlIGluIHN1c3BlbmQoKTogc2V0IHRvIGRlYXNzZXJ0IHN0YXRlDQpEZWFzc2VydCBmYWlsdXJl
IGluIHJlc3VtZSgpOiBzZXQgdG8gYXNzZXJ0IHN0YWUuDQoNClJldmlld2VkLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4g
VGhhbmsgeW91LA0KPiBDbGF1ZGl1DQo+IA0KPiBbMV0NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjUxMjA3MTI0NzQyLjk2NTI2LTEtYmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20N
Cj4gWzJdDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTIwODE1MjEzMy4yNjkz
MTYtOC1iaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbQ0KPiBbM10NCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjUxMjA4MTAxMzU2LjEwMTM3OS0xLWJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tDQo=

