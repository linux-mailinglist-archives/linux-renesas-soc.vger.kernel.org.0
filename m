Return-Path: <linux-renesas-soc+bounces-5339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC8C8C3EC1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 12:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3B721F22BA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 10:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347B914A098;
	Mon, 13 May 2024 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="YGNFNn2j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7F5146D76;
	Mon, 13 May 2024 10:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715595659; cv=fail; b=rc53HG8EsO7H4LazkpJHfa6yl/P/ilULVZ2BRJH2xiu0m+7YsK8x4sJl9rUFYoxX3TI3qGdh9LSCrxG5JWN4vX9DQhisixX8mZRM3VKWNOe4cvev3TWT7YHChv/a/fMP5mhOyhsyvsIGW01fZfu2SvZ4JvzBsOeAJdoOjqwQbsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715595659; c=relaxed/simple;
	bh=AXJM4d/+KDmRIfmo4CpPcvvv3WD8E3qRoMo9w64XoX4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mp/HJDPfPa/wcxZSVuY8Wa659JIDPzrdHXNwa54CK6G2Qmsm2s/0BOFVT1zJLkVD7douND+hSuNfHVwYOz4TvZdO8/rgCgoVfNGsC9NZ6HgKkPzv47Z94z3hbm/mpHXrC+gmHjlUg9e0CXFCsLgJbE2kT1zusYnmKUa/aH/mU54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=YGNFNn2j; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D8X8Dx002142;
	Mon, 13 May 2024 03:20:22 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3y286jbw1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 03:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yhsh11Ci1qdIZ8/qh8mdBTDZMaLWRMFR62VTAujHlKWyNF+A4nZePOmBMgx7GQnC45U/rwcK/bhi26Frp9dKAWHJcMSiS+mpfy/PBMXWhwjjNce0YufB97o8EA0V/Rq7ddbWUhyeNUaWwwPHQrlNqjA+JJYTXUzoX4BhAa7e76+M1BI3nqUTRdfb55cACVVb2eMk8jqNGLlk3B7rHJ+9uJ2uSmeLyqjGXY+lz3KDbDACn/I7U3usHIG1/acbnMpsR6S2j71mxmq4FfUn8lXzWbwVV+zHP/it3O0U3RhI9sSFexfZ8LOYZJ2UBloqM/Y9MQPCuhnazR7Lz67P1tCybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXJM4d/+KDmRIfmo4CpPcvvv3WD8E3qRoMo9w64XoX4=;
 b=OsLEsXxnAkV0OFFKyZmvoqtAepzAkAHXD2ez4S9CBccOUo23YbbPG6NB6biF1KE93YzxERGp87zg1pktOTteSkKh60pQGJYmYdt10EdrJmAicI7H+gdkLlIRHT89qcNp/RHVerI7xaCfD+oICBIrzXDDWcgzbQrcaQWDrw1qvfIqK2vQpoDvvUFZAhZC8k6fP+MHiyByvwbGLHwUrKG8FVqVKaSSNOVBQ5Xt1tfmxOFaCuIQJ0obg8OSRYoNfFRuvwjgtCqkR2/We86g+1uhM7iXKzqZNXZnnDQOsDssBoS8owd9fHaQpD67smK/Vea9Zh9CU9ytRPrh4uPkVfuS9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXJM4d/+KDmRIfmo4CpPcvvv3WD8E3qRoMo9w64XoX4=;
 b=YGNFNn2jKwqyM/unObsshiU/q5AAehAidIvWKuGSaQslmFzKY7ANMBIuK6w2CmRfoAjjmJMEzcnEeTtVnXAF2EkTHmOMfbNQ9V3PQK0mzF675h4VmkwXkJoAWmpGLX8eMB1+TuxfPZFTEh72pB1oN80sgnz0ggc2HL4mgulNmoU=
Received: from PH0PR18MB4474.namprd18.prod.outlook.com (2603:10b6:510:ea::22)
 by MW5PR18MB5043.namprd18.prod.outlook.com (2603:10b6:303:1ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 10:20:18 +0000
Received: from PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916]) by PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916%5]) with mapi id 15.20.7452.049; Mon, 13 May 2024
 10:20:18 +0000
From: Hariprasad Kelam <hkelam@marvell.com>
To: Romain Gantois <romain.gantois@bootlin.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
	<clement.leger@bootlin.com>,
        Serge Semin <fancer.lancer@gmail.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v7 3/7] net: stmmac: Make stmmac_xpcs_setup() generic
 to all PCS devices
Thread-Topic: [PATCH net-next v7 3/7] net: stmmac: Make stmmac_xpcs_setup()
 generic to all PCS devices
Thread-Index: AQHapR8nerFgDK3YUk2EeNwqJJ0oyg==
Date: Mon, 13 May 2024 10:20:17 +0000
Message-ID: 
 <PH0PR18MB4474E1287863A4E773861505DEE22@PH0PR18MB4474.namprd18.prod.outlook.com>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-3-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-3-6acf58b5440d@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR18MB4474:EE_|MW5PR18MB5043:EE_
x-ms-office365-filtering-correlation-id: 5b322dfd-cfd7-497e-3c5a-08dc7336499a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|1800799015|366007|376005|7416005|921011|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bHRPRi9XcHNMMkhQQXdiNTJrYzRrdXBRRXVHbEhtcFVwQnVJUG1XYzhRWDFN?=
 =?utf-8?B?NlNTS0swMEllWWt3S1VTRUhHSHJFUHM5dTczRVJyeFRGMUhaTjd4T3lhK0k0?=
 =?utf-8?B?bThoRHJNcU5pdDVqR1dSbUhaOGViVm5NM2J0NFA3ZVN1OXg1dHdWVmxXS1JG?=
 =?utf-8?B?WG9CbnhtZkxzd1R0bklMZTFqcEpYRldHb2JzZlpKRWRxaThSQmJ1Qi9rZzVO?=
 =?utf-8?B?SGhBMHUybEt5eHMxSFIvSU5XbjJETTdSTERIa25CVnhwOHNaeGdWTmlwNmlp?=
 =?utf-8?B?WGtFU1RBbzNSTWxsSFVWZnIyZUlrcm94MUNvS3o3MzlBeG0vR1l5SWl4Y1g0?=
 =?utf-8?B?OHowWHNvemNWWjlIWmkxVldyd1cyQ0hnU0ZmaEFrTkRBREhaK3JCYlBIR1RZ?=
 =?utf-8?B?UnNFOWgvM3lWdmxhUFYwbldFazVnb21jZk1ZUDcrbUhQNHFsWjloVmwrVUdx?=
 =?utf-8?B?L2JScVI0aGpEUGtPSW9HYUlaSkNPYXptL2dFWGdiV2xsN0gzWGtNZXJocjVL?=
 =?utf-8?B?NEFyeEVjZTJDY0N5YTM1ZVJTb216dVhpeWFVT09JSzluOTZsQTFreGRTRDB5?=
 =?utf-8?B?VDRxczY0T0hwSDdiYTdST3BZaXQ4OXJVcHpFV1RYTUhBMkdkTVY5cGp6OFRL?=
 =?utf-8?B?cTI4R0JFZEIrcUlYczRMQTZqYXNWLzAvMXpuM2xwb3JBUEJUaC9SSmVDQ0lV?=
 =?utf-8?B?Z0N0ZjhGWnFsdHhHcmhROGtob0dxR3pqRzgyWEVUM3Y4OUEycVJsQWFvellV?=
 =?utf-8?B?bUNVZ28wWkpiY1A1VjhGU0R0aVA4V3dvYjRYVzNnN0drSENNWWhFWmN4RktB?=
 =?utf-8?B?UFkvNHBiL0Q1R29JSEcwVWxXaVRLVVR4V2xGT29XSXhsV3dreWUxTXpCeEhh?=
 =?utf-8?B?OGRSRjVWS2FSM1BKN1RSanFLYlZoZGFMUmJhaGtsSGc0cXBkaTVJNjZ3WVhC?=
 =?utf-8?B?R1VFRTFCRjJBZzc4c0tHV2NVRG1MK0poMm1YOWRncDRGTDVOMFBIZWlXUXRi?=
 =?utf-8?B?azFZMHc2NUNFazFiZng5TU9hNnFEd0E2c05lSlBSWlg3SVBVdThZdXpvcng1?=
 =?utf-8?B?VFVGbVNKU0JmV0NmcUcvUmFIaVZUY1ZQOUlPc0lpdnlPY2k3bHhyQkNjK0pD?=
 =?utf-8?B?TGs4SFZiNFBqMDVVWHhtWXFJQ0FSWm5hSmlRMVorSklPd2ZPVEJ6UGJDa0M1?=
 =?utf-8?B?cXo3cnRBOFhzK2VUaHJIWFNMd2U4SU14d3RiaFUyNktiRCtRT3VWWFpidDJS?=
 =?utf-8?B?MCtwcmUzK1ZUcDZIT25LZlVPRHRWUzNGWS9RSFVEMVVqNGVhZ3lmM3l3VHNT?=
 =?utf-8?B?VVlFak9YdDlmeUFBVHB1NHJDL3gzZUt5RFNiVnV4Q0VZQkpCVXR5cG9lUGtz?=
 =?utf-8?B?ZmRpY0h5WDJTaXNjdHlkK2xpUld1bzJ5TnhGZFdTY3Yzc3FodC9VYlRweXhu?=
 =?utf-8?B?ajl0ejFZL1lJZktEc1hRWXhaa21sZ0tZMWsxVnc2TDBKZ0FuMVhhVm94Ynps?=
 =?utf-8?B?dVk5Vk5zVnViTDRUVVpDS25ac1J5RGRrVERtSVRJSkVJdmlZSzlrSjB6Z254?=
 =?utf-8?B?c3J2WkJ2SnQ0MWdTS3ovUUg4amQ0THFMczdGdGxuajRmSGR5YmZaUTFtM2Uv?=
 =?utf-8?B?cWpjdUU3eXpDZUZWR3RUYmRmWlVkRUt2WkhLWVF2eFJiRlJMYld0eXk2OUpE?=
 =?utf-8?B?YU0vSTd0amlIdHo3WFZETnd5K3Z4Y1JGaVlzV083ZWZUUWRkNXdGSFp3YXRJ?=
 =?utf-8?B?N05rOVBMaThpTTBhb291YmlEckJycTJjTUhjd2U3aFZkUkpUd3MzV3EzaUdZ?=
 =?utf-8?Q?8M+GAOYxn0pXBAvZvYz8l7uPKA1rM3K/mS1hg=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4474.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(7416005)(921011)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R1A0REp3REVIRzAxcHNyaUdUejY5aThiTEpGaTBJMCtOK3g3YkR4SWUxTCtF?=
 =?utf-8?B?WVhmT0J0ek9LTTVva3RXUm5od0tHaXFxU2dYMmQ0VndCR2JYeml4Z2ZCOGRl?=
 =?utf-8?B?R3BnbTNvWEJoY1Z6R1N3R2svR3daRy9kQXZCcEhiVC9XaXpGTm1NMnJGdkkw?=
 =?utf-8?B?eFUvdkRIbXM2ZThBZnIwMWtMYndvQ3RDdTNuWHVCcEY2WVRIbHQ5RlpjbEVQ?=
 =?utf-8?B?N0IvR2dxeDhlUC9vbWtZQUxYU1ZCZ2Foc1hueDhHR2h5ay95bHZoTkJJeUFs?=
 =?utf-8?B?UmYwcWZFcEo2U2ExSW5XaFhldmduU0JtcHcrKzhCVmdmbmNvQlVwd2kwN2VQ?=
 =?utf-8?B?QzFmRy9SbGlhODIyZU9BcEhaS1laTnRnakJHYkFOYjlxb1NCV2hkVExWK0lG?=
 =?utf-8?B?TVk4NUJOSzlMTDBYTmdKVzVTSDBJY2tWaXlOaXFtNVM2b0xaRXVzU0xMSWgy?=
 =?utf-8?B?QVpJb05rWkxKUnNSRW9CbTZMbzNjWS9UdUU2UDZwT0lDVnVyeDN2S2RKUldI?=
 =?utf-8?B?WXpJWm5JbUpqeHVock1wQWpxTlpxMjA4MXlYeTVJWHRuZjBITkp1VXFTaVFN?=
 =?utf-8?B?Y2d6a24raTA0ajZEcHpmTmF6UHpkbHFjekRSaDRpSW1SZFpJQ2JoQXBab3JU?=
 =?utf-8?B?UzhKSG41TTR6SjhDeXlmVHpINm94dndXNUg5QitEa0lwRjMzdGxCQWJvckQz?=
 =?utf-8?B?R3ptU3o4R3UwTmVGMkljM1h2Zzg1OWwvWEFEUnFwUER4WVZ4RkhyQlNkeUlO?=
 =?utf-8?B?Zzl4OVRablJML1lSL0FVV0l1NXFNc3p6QVk4ZEp0MWhjbnM1UG1UQk5nUEFN?=
 =?utf-8?B?YUpLR3I2WUd3ZzFwM1BHNUc1c2R0K3dBRFNERjNMN2NERGpkS1BVeFg1YWNG?=
 =?utf-8?B?aXVXQnI0cERBOXY3ajI0alh4NGdDVG81aERVS0VrODN2cW03amxMOEVoaDQy?=
 =?utf-8?B?bC9pREhDTjhwTDdIRUgyeGdyOVc2em5Odk5UTGt3SnhXZ3k2ZWpINzZHUkZw?=
 =?utf-8?B?dEpvVTV6c0xLQ09UeVp5d09kUkJnWWhyVk8xd1hPNXFnL3lrZktQU2dkZmNz?=
 =?utf-8?B?OHAyeGJ4L2syQ0ViR0F6aDBRRTUwTHgza29Kd0E4NGlBMnJYTytLZmdiazhG?=
 =?utf-8?B?SzdXVWloMC85U3ZFM1pUam9NcTBHanBwdnJqUG5XTG9Zamt6SENBVWF3T0pZ?=
 =?utf-8?B?UC9VcXlNajN3cSs5a2x5Qkh6SWdQS0UrSUo1MG9waWpTRzlyQjB3NGQzVW5j?=
 =?utf-8?B?VjVDT1hTclJzYk81My9OekRPK2RyRkp3aVluSHhEd0V1cjhQa3laM2M5WTdC?=
 =?utf-8?B?SURBL1BGNjc1cWp5Vzg4dGE5MmNWbkFuQWVWMTI5N21wZkxQc0JRbk45Ums4?=
 =?utf-8?B?Q1ZZWVFxMHRORzE1M0tZMngvRE44VjZNNWZmZVNNT0R3QXowRGoreXVYaVNE?=
 =?utf-8?B?OFpZTjRZZlAwMXVZZ2xuMk1iYWdNa0sxbm5HU0ZiZzJZS2t1THhKK09xeHZt?=
 =?utf-8?B?MG0zdUhxNmpBWUNjYXZUbjBvZEVKTXdKVmdQUW5UZlRIdTcvRlFLWUlMR2ww?=
 =?utf-8?B?SVJselBIVFR2U01IaHVQb201MTBENUxBVnc2K25QNjN6ZmlVMkNYMlE3MnVo?=
 =?utf-8?B?aDh2UnhNaGFmWHhSbGxsOWprSysvUjFpeGJ5WHlPSDQ1ejAyR0pua0dlVWx4?=
 =?utf-8?B?YzJnQnZybU1sQ25XOHkvRG9rWEoyZW5VQ0g3WFNzZU92TVZZTFdGdnFOQnBZ?=
 =?utf-8?B?dmp2bkcyd2M4QnFxZmNWbjhSMFhmMUgycnZTeG50NmUyUVR6bjBZb1VVUC9O?=
 =?utf-8?B?QlYvVjJWMnlGY1hRZnk0NXBVRFJ3ZGhxUUkyWWFibDJNekEvK2pvUnpvd2Jk?=
 =?utf-8?B?S3hqcEtYMUovZ2JQUkY3dUZxUlY4RENhMGZ6ZVYrWWg4dlJWS0ZCdWhoWlVR?=
 =?utf-8?B?dE5jVnhCOFJYQThOU0JMb3Y1WTdkT3lKUDNKOXZLSkYwdkduc2NCMnhXaTdD?=
 =?utf-8?B?SkRGNVFRTDh5MDlEeWswREoyYnBHK1VKMDAwbzNxNW5kSXdpbkQrYlYvbGdp?=
 =?utf-8?B?U1M1dkRtMW1jUWF2Y0FCNW45WU02KzV0em9EUDFYL2hWajhBQ2JpZTNuNHRW?=
 =?utf-8?Q?Jj/I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4474.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b322dfd-cfd7-497e-3c5a-08dc7336499a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 10:20:17.9748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CVykzIBP8KVA5Dq2I1OSKNKoIlvEUJ2rMSmA0kUuyYcE21D71C+fxzWyqGWUpvBkd/g352b/LrePd4h2kztCXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR18MB5043
X-Proofpoint-GUID: GNfRBGAAMHltgBYHFpPAXCzM364-C8ba
X-Proofpoint-ORIG-GUID: GNfRBGAAMHltgBYHFpPAXCzM364-C8ba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_06,2024-05-10_02,2023-05-22_02

DQoNCj4gRnJvbTogU2VyZ2UgU2VtaW4gPGZhbmNlci5sYW5jZXJAZ21haWwuY29tPg0KPiANCj4g
QSBwY3NfaW5pdCgpIGNhbGxiYWNrIHdpbGwgYmUgaW50cm9kdWNlZCB0byBzdG1tYWMgaW4gYSBm
dXR1cmUgcGF0Y2guIFRoaXMgbmV3DQo+IGZ1bmN0aW9uIHdpbGwgYmUgY2FsbGVkIGR1cmluZyB0
aGUgaGFyZHdhcmUgaW5pdGlhbGl6YXRpb24gcGhhc2UuDQo+IEluc3RlYWQgb2Ygc2VwYXJhdGVs
eSBpbml0aWFsaXppbmcgWFBDUyBhbmQgUENTIGNvbXBvbmVudHMsIGxldCdzIGdyb3VwIGFsbA0K
PiBQQ1MtcmVsYXRlZCBoYXJkd2FyZSBpbml0aWFsaXphdGlvbiBsb2dpYyBpbiB0aGUgY3VycmVu
dA0KPiBzdG1tYWNfeHBjc19zZXR1cCgpIGZ1bmN0aW9uLg0KPiANCj4gUmVuYW1lIHN0bW1hY194
cGNzX3NldHVwKCkgdG8gc3RtbWFjX3Bjc19zZXR1cCgpIGFuZCBtb3ZlIHRoZQ0KPiBjb25kaXRp
b25hbCBjYWxsIHRvIHN0bW1hY194cGNzX3NldHVwKCkgaW5zaWRlIHRoZSBmdW5jdGlvbiBpdHNl
bGYuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFp
bC5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogUm9tYWluIEdhbnRvaXMgPHJvbWFpbi5nYW50b2lz
QGJvb3RsaW4uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gR2FudG9pcyA8cm9tYWluLmdh
bnRvaXNAYm9vdGxpbi5jb20+DQo+IFJldmlld2VkLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkg
PHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPg0KPiAtLS0NCj4gIGRyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hYy5oICAgICAgfCAgMiArLQ0KPiAgZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDEwICsrKy0tLS0tDQo+IGRy
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tZGlvLmMgfCAzMCArKysr
KysrKysrKysrKy0NCj4gLS0tLS0tLS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKSwgMTkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmgNCj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWMuaA0KPiBpbmRleCBiYWRmZTY4NmE1NzAyLi5lZDM4MDk5Y2E3
NDA2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9z
dG1tYWMuaA0KPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1t
YWMuaA0KPiBAQCAtMzYwLDcgKzM2MCw3IEBAIGVudW0gc3RtbWFjX3N0YXRlIHsNCj4gIGludCBz
dG1tYWNfbWRpb191bnJlZ2lzdGVyKHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2KTsgIGludA0KPiBz
dG1tYWNfbWRpb19yZWdpc3RlcihzdHJ1Y3QgbmV0X2RldmljZSAqbmRldik7ICBpbnQNCj4gc3Rt
bWFjX21kaW9fcmVzZXQoc3RydWN0IG1paV9idXMgKm1paSk7IC1pbnQgc3RtbWFjX3hwY3Nfc2V0
dXAoc3RydWN0DQo+IG1paV9idXMgKm1paSk7DQo+ICtpbnQgc3RtbWFjX3Bjc19zZXR1cChzdHJ1
Y3QgbmV0X2RldmljZSAqbmRldik7DQo+ICB2b2lkIHN0bW1hY19wY3NfY2xlYW4oc3RydWN0IG5l
dF9kZXZpY2UgKm5kZXYpOyAgdm9pZA0KPiBzdG1tYWNfc2V0X2V0aHRvb2xfb3BzKHN0cnVjdCBu
ZXRfZGV2aWNlICpuZXRkZXYpOw0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMNCj4gYi9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jDQo+IGluZGV4IDBhYzk5YzEzMjczM2QuLmVm
Mjg1YjNjNTZhYjkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL3N0bW1hY19tYWluLmMNCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX21haW4uYw0KPiBAQCAtNzc1NCwxMSArNzc1NCw5IEBAIGludCBzdG1t
YWNfZHZyX3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldmljZSwNCj4gIAlpZiAocHJpdi0+cGxhdC0+
c3BlZWRfbW9kZV8yNTAwKQ0KPiAgCQlwcml2LT5wbGF0LT5zcGVlZF9tb2RlXzI1MDAobmRldiwg
cHJpdi0+cGxhdC0+YnNwX3ByaXYpOw0KPiANCj4gLQlpZiAocHJpdi0+cGxhdC0+bWRpb19idXNf
ZGF0YSAmJiBwcml2LT5wbGF0LT5tZGlvX2J1c19kYXRhLQ0KPiA+aGFzX3hwY3MpIHsNCj4gLQkJ
cmV0ID0gc3RtbWFjX3hwY3Nfc2V0dXAocHJpdi0+bWlpKTsNCj4gLQkJaWYgKHJldCkNCj4gLQkJ
CWdvdG8gZXJyb3JfeHBjc19zZXR1cDsNCj4gLQl9DQo+ICsJcmV0ID0gc3RtbWFjX3Bjc19zZXR1
cChuZGV2KTsNCj4gKwlpZiAocmV0KQ0KPiArCQlnb3RvIGVycm9yX3Bjc19zZXR1cDsNCj4gDQo+
ICAJcmV0ID0gc3RtbWFjX3BoeV9zZXR1cChwcml2KTsNCj4gIAlpZiAocmV0KSB7DQo+IEBAIC03
NzkxLDcgKzc3ODksNyBAQCBpbnQgc3RtbWFjX2R2cl9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXZp
Y2UsDQo+ICAJcGh5bGlua19kZXN0cm95KHByaXYtPnBoeWxpbmspOw0KPiAgZXJyb3JfcGh5X3Nl
dHVwOg0KPiAgCXN0bW1hY19wY3NfY2xlYW4obmRldik7DQo+IC1lcnJvcl94cGNzX3NldHVwOg0K
PiArZXJyb3JfcGNzX3NldHVwOg0KPiAgCWlmIChwcml2LT5ody0+cGNzICE9IFNUTU1BQ19QQ1Nf
VEJJICYmDQo+ICAJICAgIHByaXYtPmh3LT5wY3MgIT0gU1RNTUFDX1BDU19SVEJJKQ0KPiAgCQlz
dG1tYWNfbWRpb191bnJlZ2lzdGVyKG5kZXYpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21kaW8uYw0KPiBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tZGlvLmMNCj4gaW5kZXggNzNiYTk5MDFhNDQz
OS4uNTQ3MDg0NDBlMjdiOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvc3RtbWFjX21kaW8uYw0KPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfbWRpby5jDQo+IEBAIC00OTUsMzEgKzQ5NSwzNyBAQCBpbnQg
c3RtbWFjX21kaW9fcmVzZXQoc3RydWN0IG1paV9idXMgKmJ1cykNCj4gIAlyZXR1cm4gMDsNCj4g
IH0NCj4gDQo+IC1pbnQgc3RtbWFjX3hwY3Nfc2V0dXAoc3RydWN0IG1paV9idXMgKmJ1cykNCj4g
K2ludCBzdG1tYWNfcGNzX3NldHVwKHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2KQ0KPiAgew0KPiAt
CXN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0gYnVzLT5wcml2Ow0KPiArCXN0cnVjdCBkd194cGNz
ICp4cGNzID0gTlVMTDsNCj4gIAlzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXY7DQo+IC0Jc3RydWN0
IGR3X3hwY3MgKnhwY3M7DQo+ICsJaW50IHJldCA9IC1FTk9ERVY7DQo+ICAJaW50IG1vZGUsIGFk
ZHI7DQo+IA0KPiAgCXByaXYgPSBuZXRkZXZfcHJpdihuZGV2KTsNCj4gIAltb2RlID0gcHJpdi0+
cGxhdC0+cGh5X2ludGVyZmFjZTsNCj4gDQo+IC0JLyogVHJ5IHRvIHByb2JlIHRoZSBYUENTIGJ5
IHNjYW5uaW5nIGFsbCBhZGRyZXNzZXMuICovDQo+IC0JZm9yIChhZGRyID0gMDsgYWRkciA8IFBI
WV9NQVhfQUREUjsgYWRkcisrKSB7DQo+IC0JCXhwY3MgPSB4cGNzX2NyZWF0ZV9tZGlvZGV2KGJ1
cywgYWRkciwgbW9kZSk7DQo+IC0JCWlmIChJU19FUlIoeHBjcykpDQo+IC0JCQljb250aW51ZTsN
Cj4gKwlpZiAocHJpdi0+cGxhdC0+bWRpb19idXNfZGF0YSAmJiBwcml2LT5wbGF0LT5tZGlvX2J1
c19kYXRhLQ0KPiA+aGFzX3hwY3MpIHsNCj4gKwkJLyogVHJ5IHRvIHByb2JlIHRoZSBYUENTIGJ5
IHNjYW5uaW5nIGFsbCBhZGRyZXNzZXMgKi8NCj4gKwkJZm9yIChhZGRyID0gMDsgYWRkciA8IFBI
WV9NQVhfQUREUjsgYWRkcisrKSB7DQo+ICsJCQl4cGNzID0geHBjc19jcmVhdGVfbWRpb2Rldihw
cml2LT5taWksIGFkZHIsIG1vZGUpOw0KPiArCQkJaWYgKElTX0VSUih4cGNzKSkNCj4gKwkJCQlj
b250aW51ZTsNCj4gDQo+IC0JCXByaXYtPmh3LT54cGNzID0geHBjczsNCj4gLQkJYnJlYWs7DQo+
ICsJCQlyZXQgPSAwOw0KPiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KPiArCQly
ZXR1cm4gMDsNCj4gIAl9DQo+IA0KPiAtCWlmICghcHJpdi0+aHctPnhwY3MpIHsNCj4gKwlpZiAo
cmV0KSB7DQo+ICAJCWRldl93YXJuKHByaXYtPmRldmljZSwgIk5vIHhQQ1MgZm91bmRcbiIpOw0K
PiAtCQlyZXR1cm4gLUVOT0RFVjsNCj4gKwkJcmV0dXJuIHJldDsNCj4gIAl9DQo+IA0KPiArCXBy
aXYtPmh3LT54cGNzID0geHBjczsNCj4gKw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiANCj4gDQo+
IC0tDQo+IDIuNDQuMA0KPiANClJldmlld2VkLWJ5OiBIYXJpcHJhc2FkIEtlbGFtIDxoa2VsYW1A
bWFydmVsbC5jb20+DQo=

