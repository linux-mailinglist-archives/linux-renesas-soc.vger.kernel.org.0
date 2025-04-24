Return-Path: <linux-renesas-soc+bounces-16297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ED2A9A4EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 09:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21B411B82797
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 07:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F321F1F3FD1;
	Thu, 24 Apr 2025 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IobWWsHn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D3D1F3B94;
	Thu, 24 Apr 2025 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481213; cv=fail; b=a9JfWL9UBuczzCF7RclhMRTCTQaw5HkAfswsju1T9lPalifTb2xlocPqYEbxMg1UlBX7awbMRbKVym8hs5/A7WIljmIfGyfyijbSHs9+LFIk06n5hklMAI+6VMEwkTo2CwlhvWJje6wiV3PE9nFMKq/Y3dXfKqlEfycUg4jGVoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481213; c=relaxed/simple;
	bh=SA8/7vtH4Pv+a9wTRn/8mThZCthab7L5FB2faWavbfk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cYZJwJRAIoOe76nwPfhzFWuJrRSl8VL+bNfiFmX6frvLacP2K0c9AA3mjNzzmqoeYZVKjTuIdpTVFedQxskPOZQ8Ocd6GRPOlfjN2lluLBnO87amYnaGHZu6pqFMhdKZ5/Tq2mXJ3jH+SbJyQT4g8aPHmWofHRppeepN0yCPWJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IobWWsHn; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOE4OQaSanv7lqsgrp3vkw0ZyhzSavjrMC8M9iDbmakbN0rz9V7ZvynZ79IyCCXY4hi4k35uKgvsBfHAspncNBL/kb7zm33SsXC8rDazp6L3XfSbkTQWTiEIszkiQ9UCvbuAxposFiiljposxjCp04ekniL0AxBVPUosSAXEbPQYbst9ccklC3HAydgYUr+8vePJVgrE1XVduPKq7HuQKt75aaTstvgYtbxm/DPvMbHMlbf3yD5XpD0obRhq+U8+O6zDpKU/ZfPcihGInJb7W68fYbL0NgMJdQmSKQNqdO/OL77GISRBPFouOgE10tKnL9osCM3sdjoQcZIPfecvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA8/7vtH4Pv+a9wTRn/8mThZCthab7L5FB2faWavbfk=;
 b=jdiYBQbgeZb7OZR4VmEbxSBe4Rbp1z9aND5M6YKFMMRRxiodrwU0WoD2YK6f5kPq30fe35MRkBoH2ZphI/PK1+B7eM5I8vHpYpcQQmlQytpBH9B6kvGwgrFOHoTgm03sGs5d/IozxGvJswzlNSp+WdCa4tWQVYnxDC9kXusQB+9PYE15Tj6Vc3y1Ga2Jm291ZiJEW6Os7BtZHt2uHUWPkyPgTY6ggYlJwD6JplpB9wrDtGvCygQtB9StFiuTGOwOvyafoLuV1QE6vHwn/LfSf2zwj3stXRKPy14MFC9OVcDyI0NdMPQRgIRqyJJ+q1TfX7BPRfqVDVdEG5AwvD1QVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA8/7vtH4Pv+a9wTRn/8mThZCthab7L5FB2faWavbfk=;
 b=IobWWsHnwhICx0bzoas18LPD9wrKtO9BCWDxsFVtmnQaMaZP+8cyyFUcaqr7G5i8422g9m79jATLUv9m1/V2qsvcL/Q7kQsCy9ZB1Z6O4Dr30P6pcPDOASIF9n9miSD4y0bpJ9p/1zGhD5QXEMaPiRm2UTxJZ8N2KWbd+aAJWo0=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TYBPR01MB5407.jpnprd01.prod.outlook.com (2603:1096:404:8023::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 07:53:22 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%6]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 07:53:22 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Paul
 Barker <paul.barker.ct@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH v7 06/13] clk: renesas: Add support for R9A09G077 SoC
Thread-Topic: [PATCH v7 06/13] clk: renesas: Add support for R9A09G077 SoC
Thread-Index:
 AQHbpN+aTkZ10KsUDUyuFRr6/dlYB7OoSA2AgAFUOGCAB1nygIAAAitggAAX2ICAAX9JUA==
Date: Thu, 24 Apr 2025 07:53:21 +0000
Message-ID:
 <TYCPR01MB114927B2ECBF040D48CB460CE8A852@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-7-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVpiZ+F0TMbLm000M_Scwozj2-SHPrUwTHqFKckVcmufQ@mail.gmail.com>
 <TYCPR01MB11492BCF416760E978541AFE18ABF2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <CAMuHMdVQPbP0Fi5SDN8uOJ23S=_8pqHRVR2QFS8vHNfohzae2g@mail.gmail.com>
 <TYCPR01MB11492F29C81C6A33A9ED90F888ABA2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <CAMuHMdUV-kHD7BZ7zU71f8GD4sKqSnSTfoDhTU+s8wyVfXgq=A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUV-kHD7BZ7zU71f8GD4sKqSnSTfoDhTU+s8wyVfXgq=A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|TYBPR01MB5407:EE_
x-ms-office365-filtering-correlation-id: 1440c494-a96c-4d84-2ab8-08dd830515bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a0hlQjFmZXhZeGdEMVpFMnpyM0pDSXp2YkYzclhCbEw4WlZCM0pVZGdIaFY3?=
 =?utf-8?B?cm5yY25UZHkvR1B3UGRNek9hN1BYaXljV0lHTS9leE04M0RpZlZ4czZzOURr?=
 =?utf-8?B?QVdieWkwdEQwOUZGaWtzLzJaYjVIWDhPMDJZQmRxbnFIZUlFWnBYZVo1ZTg4?=
 =?utf-8?B?enpUcVpFcXZ3SjRXakVoV2Nna2xvSDNpMFd4NFFUZ01ydWpmZ3hsdEJicWVH?=
 =?utf-8?B?ZkxyQlh4V2lRMmRKSnYrUi8rdTVmaDNOV0VuSUJCZ1V6VGk2a1pYRFNTTUw1?=
 =?utf-8?B?dGUzTWN0OFVpTzJ4d1dSSUlwbzBxRVdWdUFaQkUvMUEwYlBOTDBEYzZPVFg2?=
 =?utf-8?B?czRwZUVhUWtvSXc2MHVyK3lwNTJSZTVaajIrWFQ5NmNmNGhERUs0c0ZZRnNY?=
 =?utf-8?B?QkJoNXovSWFyWGMvSlpPNTM1R2d6c2ttTXB3VjkrRnQwd3gxbVdud3R1YlBz?=
 =?utf-8?B?UGQvb2l4ZmhOZDgwaDFIbjVYZWhlS2tudWxDMld0WkJVZEN5R1VKZ2ZUbHQr?=
 =?utf-8?B?d2N2UXdyMVovZnZFRXJiRElzRC9jbHJ5cUFyZldXT0RiUUNBOE9ZSEdYUjdK?=
 =?utf-8?B?ZEIrT3NTaEd0TzFGZnpxSXNkMjA3UndhNWpQNHdmdFRmS3JaU0dhb2R2eDdH?=
 =?utf-8?B?a3g0NXcwTVN6eVJSNkIwRFd6eXJCSGJZRCtadFlWYWRySXdmQTl6YU94L0hh?=
 =?utf-8?B?K1U1SVFUdVFmOGtQUjdwUkhRUHo0TmFvQnR2VzlpNkNKc01UTnhrVFhXVkZx?=
 =?utf-8?B?d25LWlQrUnNDMSs3ZXE0M09ZL08xeS9qY3AvR1J6elVTRjdyN3daalZKYnFC?=
 =?utf-8?B?L0gybkIxSk5jQjVHWXpVQUt2ZHdpT2NSbjd0dDh1eGdLWityOGdiMDFxOHY4?=
 =?utf-8?B?UUxwM3VuTXhiMFVmMTZVS21FZDJFSlgwUTlMNTQzb3UzV0g5d2M3SGxmM0wy?=
 =?utf-8?B?RUFhMCtVaGJZNEk0UVl0QWxkUEFRRnhRSzhtd1NUbWRqZU9ZNDV0UUxEcEJD?=
 =?utf-8?B?UnZqcGgxWVFoa25iNk04Y0w4Ymk0RGp1S0ZPekJSVlpzL29TUkdOTTFhV2xk?=
 =?utf-8?B?VFNVV3p4djBOSVlja3E2ZW5IRnhpRFh5UmVKSHhpMnY3b0pzNFI4VkZpaFhm?=
 =?utf-8?B?VFhVdjArc1FhbzlxcmpQODNBaUFGZk5BR1R5ajdvYXhVV1E1UkhJTlQ2aEpj?=
 =?utf-8?B?alJBTmdONTFBRjdxV3RlNlI3TldCWDdvOWVhTDFLOWxqMkRSQlY0d0todkht?=
 =?utf-8?B?akRtODk0bDV0Ym55UWYyOTljOWZnMHhManE0K3NyWWF6KzVVQWlPbThSeXVa?=
 =?utf-8?B?MjdFUmxJdHBRWXQvaU8wWm5yR0xjUGJTWUl2bXlYM1JMenFFUzhLR2hLTzJY?=
 =?utf-8?B?dTNVeUMyYU96UXVxN25sVlBwSnVRdFFtOUZVUmNtZjMxTnpFM25EdEpQcmEr?=
 =?utf-8?B?NDUzWlMzNEcvOEZQRmtmMDdlWmdRQVhJOVNLaE5UMFZ3RDFIYXVtSUtHdExJ?=
 =?utf-8?B?R1lCRVBBZHVkajJ2NUFTZzVxam8xaGU0SnE5Z2VaRTU3cnloMHBOQWhna3JH?=
 =?utf-8?B?MEdPbG5xR0E3VkR3TURPYXVxMEZibGxRWWY5UUJlQTB1SUF3VWE3N2dBUnd6?=
 =?utf-8?B?TXdzcmlMaGUvSm1IeENQay9UY2tYTnd3SjNxVzY0SDdsWXo1Qld6QU0wNk9P?=
 =?utf-8?B?RWdFRDJiYVNMT1pMU09jdjdTT2piQVFVZUpRR0NNVHJYdlFVWEI3TUxhczBE?=
 =?utf-8?B?Z2lhSk9nVm00Nys4a1QwcTlKbmRkQm8xcGVFd3lZSWxXNlpaa2pIWjRXV3Mz?=
 =?utf-8?B?b0VEaUgrSmJTSmVYcUZYODhRUkp3ZkdFaU9wKytmWXViVDlxdm84WmtJVk9u?=
 =?utf-8?B?blZmMXBkWENZeGZvZW1CeUZLS2ZxdEpoSWdJcUVMeVZWVVA4RVZHZVcvNUJV?=
 =?utf-8?B?RXQ4elVOSlVGOElEdGd5WHdsR3RGZm1OYkNUQlpwTzl2eHdMdlBhclE0OHhI?=
 =?utf-8?Q?lct/0pGKF5+iRHcdzx/pApoWyLApvo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjhiVWcySTQrdmxHTnJrVUo0ZEZ2RjN4MlVMS1l1SzFqZWROQ3RVUjZUdjBi?=
 =?utf-8?B?OXh4ZHo5UzFsRWcyMDNFZWszZVdoVCtSbVpVM2pWKzByZTVaaTdObXJWSm9M?=
 =?utf-8?B?bzVJNk1HbEEraGwwUXg3NnFBZndzSnAwcTc2ZmtuRjQvSXBLM1dZamdoVDlM?=
 =?utf-8?B?MS9Ta2Z2Z3BSNTlGKy9ieHdwa3J4SVRLZGY0dkRVWCtRSVlUY0lwL2Zpcmdr?=
 =?utf-8?B?T1pCTTdhRGw3VUpVUWxxMGZ2V2JOTlRmVmJRREJIaE9oeGQ4Q3ozNnV5dGt6?=
 =?utf-8?B?dngzblR4T3NacXVqMW1VSDVsMVpJM1lrQ0ZxblAvdGo0czBmK05WVkszMnhv?=
 =?utf-8?B?VzNIc2xKVEtwN3l2V21Ec0RYSDl6UCtMaTJCYnBkT3JVM3NsM1lScmUzZ25U?=
 =?utf-8?B?b0k3aFhVZXVSVlN5ZysrTEtkVUJwNURiMTJmaVFwTDlYaGdQYi9GNGJtMFox?=
 =?utf-8?B?TjRuNU9OSVA4ZGExNjduQkZQVWhkNmNPMkZjWi9RZTdGK0FVczJITFcvTG5F?=
 =?utf-8?B?MEY0dWl0bnBZVFMvZHNJWm1mRGlWSE93WnlDWGh4NmkxQmVOMDJWTXFPcnNP?=
 =?utf-8?B?YTJtdmtMa2thREJmMjRSd29teHJjTkthOWRaenlpaTVTYm5WelJwODJvS0JM?=
 =?utf-8?B?QXRoQkZOWmxzQzRQMzdxZWdNTmc0M1hOdFYyUU1CeDhheE1XTTh1aGcyYndI?=
 =?utf-8?B?NFFOMzduQVNjaFZ3VjdSVjh6bVFIVm1sRmtHUFk3R0tsdFFodlBCRFFkVmlQ?=
 =?utf-8?B?S3V3S01YQlFRa0l4OWpNSjBZM0FkWml3V1ZEWm9ZNnV1OEdJdFlBeHk1N1cw?=
 =?utf-8?B?Rjd2TGU5R2swUlN4RmdiK3N4RXdmR2pVMk9ZK0V2RExDbmZkc2JNMUk1VkF6?=
 =?utf-8?B?dVM3TlhyY29QOE00WlN4Sm1USmdPSkV1OGdUVjFXZ3JsRzBJb25ubWlGSjMx?=
 =?utf-8?B?dTBpRys1V3lINmZ4WjVDVWpjbkZXb0gvV1h0Y01PSjZDTkdiUzBYSzZnWFl1?=
 =?utf-8?B?dDk3TVFUVGV3Nk0rSmNLWnMvZkpNdml2djlBYkNtVExmbkZpZkl3MUVRT3A4?=
 =?utf-8?B?NlExUnBQcWFxckUrV1JJL2dvRGVia3lkL1lmZUcya1J1YTYrVndWK2p4WTFD?=
 =?utf-8?B?MHRtQ1ZwUXJtamVNUGRaWFFJcDdpRWxMczV3OHFiVVpyY1YxVGxuelE2bGhO?=
 =?utf-8?B?c2FCVnNGSys3cHhTRm14VC9vdkcrY2hYZXMvNmJWUGZacXMrOHpwdnVsQVdT?=
 =?utf-8?B?eGFwRVl2Q3AyZVBnbVVvNldPcTBsRm93blJKa043SmVpc2hiVmxCZ3IzNnR4?=
 =?utf-8?B?RnFQeTZ1MzhLNDI5bEhQam12dVhML1RLRnY5VHAyakEwcWExOVZJYVZwNkFz?=
 =?utf-8?B?Snp1eFFPRjAxdFJjUk1vMUVoajBpU2ZqWXR2NnBaV0NoYmVocDZHbDNFN3c5?=
 =?utf-8?B?Q2FTT1dxZXNMZ0cvTkc3YXBEalkxTk8vWlVGQ29YYm9Jb2p4czZFVGR6aC93?=
 =?utf-8?B?Q1ZnL0RLQkpvbVlWeW13c2FUeHhiVXhWVWttemZxSHVqUGpTdXdYdU11ZmdE?=
 =?utf-8?B?b0dxTHFnd244RnpzMTRBNTJYTkRjdmhzejMrbUZVVm5EQ3ZCbUx4OXNXcmVh?=
 =?utf-8?B?azRWL2JKbHN3c2UwVU11ZDEzWWs2RjhhMDhmNTVTNFV2THU3cU5oQTdLZThh?=
 =?utf-8?B?aTFneUNyNEt5VFpKa3FMWmlaQ3RJc3pMNmZ2TUFlZms0K3U2RHBwK1BRRXdR?=
 =?utf-8?B?U2p5SUFlUE1CNlg1dEhEQ2d1VHAyNC9tOUtCQzRlL3FmNnQ4ZXFLbk4vY1A1?=
 =?utf-8?B?Z0hLc1FRWjdFRE1FZkQ0UDJ6S1gxSUFiSG14ODloQ1hvNGthZVo3d1BQR0p4?=
 =?utf-8?B?OFZDWlhscGdqUU0rUEFFemFUbWRsZmlITVVyTjJubDc3dDc5R0JhSE13NFJp?=
 =?utf-8?B?cDM5RjM5Z0pKcEE0ejJ5RWs0OTR1MDBqVUFpbTU1MENNWFdCUTYxb3djc2w5?=
 =?utf-8?B?NlZJSjg5Z0NDSkZJQzlOS0ZnZDJkRGxpSHBORkRTWFBHRUJlRXA5WGpzeUdw?=
 =?utf-8?B?eXN5OTZpNHExWTVQUzNyODlrWFBIVW91SHcrK2JYYTcwSXpsQ2hreFdQZERS?=
 =?utf-8?B?UDFTSnQzc1lJUE5CQndsNDJhaVpzUGVFczBpOWJYSWlhWWtjcSt1bE1taTZu?=
 =?utf-8?B?Tnc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1440c494-a96c-4d84-2ab8-08dd830515bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 07:53:21.8797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p13KG2rXFCnsmFvDjWRDI3vGk+eLisElOusKKCBICGB5YU5cbxmMnY0Uc8VdHJvvQ7PamPeP2PXAqInbKTlah0pcQw9k5kh1HWE5ghPqH4u0rV6d+N7OFeaQTCs1vLvS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5407

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogbWVyY3JlZGkgMjMg
YXZyaWwgMjAyNSAxMDo1Mg0KPiBUbzogVGhpZXJyeSBCdWx0ZWwgPHRoaWVycnkuYnVsdGVsLnlo
QGJwLnJlbmVzYXMuY29tPg0KPiBDYzogdGhpZXJyeS5idWx0ZWxAbGluYXRzZWEuZnI7IGxpbnV4
LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgUGF1bA0KPiBCYXJrZXIgPHBhdWwuYmFya2Vy
LmN0QGJwLnJlbmVzYXMuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGlu
dXgtY2xrQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDA2LzEzXSBj
bGs6IHJlbmVzYXM6IEFkZCBzdXBwb3J0IGZvciBSOUEwOUcwNzcgU29DDQo+IA0KPiBIaSBUaGll
cnJ5LA0KPiANCj4gT24gV2VkLCAyMyBBcHIgMjAyNSBhdCAwOTozNiwgVGhpZXJyeSBCdWx0ZWwN
Cj4gPHRoaWVycnkuYnVsdGVsLnloQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IE9uIEZyaSwgMTggQXBy
IDIwMjUNCj4gPiA+IGF0IDIzOjIyLCBUaGllcnJ5IEJ1bHRlbCA8dGhpZXJyeS5idWx0ZWwueWhA
YnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gID4gK307DQo+ID4gPiA+ID4gPiArDQo+ID4g
PiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtc3NyX21vZF9jbGsgcjlhMDlnMDc3X21vZF9j
bGtzW10NCj4gPiA+ID4gPiA+ICtfX2luaXRjb25zdCA9DQo+ID4gPiB7DQo+ID4gPiA+ID4gPiAr
ICAgICAgIERFRl9NT0QoInNjaTAiLCAxMDgsIFI5QTA5RzA3N19QQ0xLTSksDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBTaG91bGRuJ3QgdGhhdCBiZSA4IGluc3RlYWQgb2YgMTA4Pw0KPiA+ID4gPiA+
IFVzaW5nIFI5QTA5RzA3N19QQ0xLTSBhcyB0aGUgcGFyZW50IGlzIGEgdGVtcG9yYXJ5DQo+ID4g
PiA+ID4gc2ltcGxpZmljYXRpb24sDQo+ID4gPiByaWdodD8NCj4gPiA+ID4NCj4gPiA+ID4gSSBh
bSBwcm9iYWJseSBtaXNzaW5nIHNvbWV0aGluZywgaXNu4oCZdCBQQ0tNTCBhY3R1YWxseSB0aGUg
cGFyZW50DQo+IGNsb2NrID8NCj4gPiA+DQo+ID4gPiBBY2NvcmRpbmcgdG8gRmlndXJlIDcuMSAo
IkJsb2NrIGRpYWdyYW0gb2YgY2xvY2sgZ2VuZXJhdGlvbg0KPiA+ID4gY2lyY3VpdCIpLCBpdCBp
cyBQQ0xLU0NJMCwgd2hpY2ggY2FuIGJlIHN3aXRjaGVkIHRvIFBDTEtNLiAgSSBndWVzcw0KPiA+
ID4gdGhhdCBpcyB0aGUgZGVmYXVsdCwgaGVuY2UgbXkgInRlbXBvcmFyeSBzaW1wbGlmaWNhdGlv
biIgcXVlc3Rpb24uDQo+ID4gPg0KPiA+ID4gQXMgdGhlIGFjdHVhbCBzd2l0Y2hpbmcgaXMgY29u
dHJvbGxlZCB0aHJvdWdoIHRoZSBTQ0kncyBDQ1IzDQo+ID4gPiByZWdpc3RlciwgdGhlIFNDSSBi
bG9jayBzaG91bGQgaGF2ZSB0d28gY2xvY2sgaW5wdXRzIGluIERUIChQQ0xLTQ0KPiA+ID4gYW5k
IFBDTEtTQ0luKSwgYW5kIHRodXMgdGhlIERUIGJpbmRpbmdzIHNob3VsZCBiZSBhbWVuZGVkLiAg
U2VlIGFsc28NCj4gPiA+IEZpZ3VyZSAzMy4xICgiU0NJIGJsb2NrIGRpYWdyYW0iKS4NCj4gPiA+
DQo+ID4NCj4gPiBUaGFua3MgZm9yIGNsYXJpZnlpbmcuDQo+ID4gSW5kZWVkLCB0aGlzIGlzIHRo
ZSBkZWZhdWx0IHNldHRpbmcgKGFuZCB0aGUgb25lIHdlIGhhdmUgYXQgdGhpcyBzdGFnZSkuDQo+
ID4gSSB0aGluayB0aGF0IHN1cHBvcnQgZm9yIFBDTEtTQ0luIGNhbiBiZSBhZGRlZCBhdCB0aGUg
dGltZSB3ZSBzdXBwb3J0DQo+ID4gYmF1ZHJhdGUgc2V0dGluZy4NCj4gDQo+IEkgYW0gbm90IHN1
cmUgd2UgY2FuIGRvIHRoYXQgaW4gYSBjbGVhbiBiYWNrd2FyZHMtY29tcGF0aWJsZSB3YXkuDQo+
IEN1cnJlbnRseSB0aGUgRFQgYmluZGluZ3MgZGVzY3JpYmUgYSBzaW5nbGUgY2xvY2s6DQo+IA0K
PiAgIGNsb2NrLW5hbWVzOg0KPiAgICAgY29uc3Q6IGZjayAjIFVBUlQgZnVuY3Rpb25hbCBjbG9j
aw0KPiANCj4gVGhlIGRvY3VtZW50YXRpb24gY2FsbHMgdGhlIHR3byBjbG9ja3M6DQo+ICAgLSBC
dXMgY2xvY2sgKFBDTEtNKSwNCj4gICAtIE9wZXJhdGlvbiBjbG9jayAoUENMS1NDSW4pLg0KPiAN
Cj4gV2hpY2ggb25lIGlzIHRoZSBmdW5jdGlvbmFsIGNsb2NrPyBJJ2Qgc2F5IHRoZSBsYXR0ZXIu
Li4NCj4gQ3VycmVudGx5LCBEVCBzYXlzOg0KPiANCj4gICAgICAgICBjbG9ja3MgPSA8JmNwZyBD
UEdfTU9EIDg+Ow0KPiAgICAgICAgIGNsb2NrLW5hbWVzID0gImZjayI7DQo+IA0KPiBhbmQgdGhl
IGNsb2NrIGRyaXZlciB1c2VzIFBDTEtNIGFzIHRoZSBtb2R1bGUncyBwYXJlbnQgY2xvY2ssIEkg
dGhpbmsgeW91DQo+IHdpbGwgaGF2ZSBhIHZlcnkgaGFyZCB0aW1lIHRvIHN5bmNocm9uaXplIGFs
bCBvZiB0aGUgY2xvY2sgZHJpdmVyLCBzY2kNCj4gZHJpdmVyLCBhbmQgRFRTIHdoZW4gdHJhbnNp
dGlvbmluZyB0byBzb21ldGhpbmcgbGlrZToNCj4gDQo+ICAgICAgICAgY2xvY2tzID0gPCZjcGcg
Q1BHX01PRCA4PiwgPCZjcGdSOUEwOUcwNzdfUENMS00+Ow0KPiAgICAgICAgIGNsb2NrLW5hbWVz
ID0gImZjayIsICJidXMiOw0KPiANCj4gd2hlcmUgdGhlIG1vZHVsbyBjbG9jayBoYXMgdG8gYmVj
b21lIFBDTEtTQ0luIChhY3R1YWxseSBTQ0luQVNZTkMsIGFzIHNlZW4NCj4gZnJvbSB0aGUgQ1BH
KS4NCj4gDQo+IERvZXMgdGhhdCBtYWtlIHNlbnNlLCBvciBhbSBJIG1pc3Npbmcgc29tZXRoaW5n
Pw0KDQpZb3UgYXJlIHJpZ2h0LCBJIGNvbXBsZXRlbHkgdW5kZXJzdGFuZCBob3cgaGFyZCBpdCB3
b3VsZCBiZSB0byBoYXZlIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuDQpIb3dldmVyLCBkb2luZyBz
bzoNCg0KCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIFI5QTA5RzA3N19QQ0xLX1NDSTA+LCA8JmNw
ZyBDUEdfQ09SRSBSOUEwOUcwNzdfQ0xLX1BDTEtNPjsNCgkJY2xvY2stbmFtZXMgPSAiZmNrIiwg
ImJ1cyI7DQoNCndpdGhvdXQgbW9kaWZ5aW5nIHRoZSBzaC1zY2kgZHJpdmVyICh5ZXQpIHdvdWxk
IGxlYWQgdG8gdGhpcyBib2d1cyBjbGtfc3VtbWFyeToNCg0KICBjbG9jayAgICAgICAgICAgICAg
ICAgICAgICAgICAgY291bnQgICAgY291bnQgICAgY291bnQgICAgICAgIHJhdGUgICBhY2N1cmFj
eSBwaGFzZSAgY3ljbGUgICAgZW5hYmxlICAgY29uc3VtZXIgICAgICAgICAgICAgICAgICAgICAg
ICAgaWQNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIGxvY28gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDAgICAgICAgMCAgICAgICAgMCAgICAgICAgMTAwMDAwMCAgICAgMCAg
ICAgICAgICAwICAgICA1MDAwMCAgICAgIFkgICBkZXZpY2VsZXNzICAgICAgICAgICAgICAgICAg
ICAgIG5vX2Nvbm5lY3Rpb25faWQgICAgICAgICANCiBleHRhbCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAxICAgICAgIDEgICAgICAgIDAgICAgICAgIDI1MDAwMDAwICAgIDAgICAgICAg
ICAgMCAgICAgNTAwMDAgICAgICBZICAgY2xvY2stY29udHJvbGxlckA4MDI4MDAwMCAgICAgICBl
eHRhbCAgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGRldmljZWxlc3MgICAgICAgICAgICAgICAgICAgICAgbm9fY29u
bmVjdGlvbl9pZCAgICAgICAgIA0KICAgIC5wbGw0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDEgICAgICAgMSAgICAgICAgMCAgICAgICAgMjQwMDAwMDAwMCAgMCAgICAgICAgICAwICAgICA1
MDAwMCAgICAgIFkgICAgICBkZXZpY2VsZXNzICAgICAgICAgICAgICAgICAgICAgIG5vX2Nvbm5l
Y3Rpb25faWQgICAgICAgICANCiAgICAgICAuc2VsX3BsbDQgICAgICAgICAgICAgICAgICAgICAx
ICAgICAgIDEgICAgICAgIDAgICAgICAgIDI0MDAwMDAwMDAgIDAgICAgICAgICAgMCAgICAgNTAw
MDAgICAgICBZICAgICAgICAgZGV2aWNlbGVzcyAgICAgICAgICAgICAgICAgICAgICBub19jb25u
ZWN0aW9uX2lkICAgICAgICAgDQogICAgICAgICAgLnNlbF9jbGtfcGxsNCAgICAgICAgICAgICAg
MSAgICAgICAxICAgICAgICAwICAgICAgICAyNDAwMDAwMDAwICAwICAgICAgICAgIDAgICAgIDUw
MDAwICAgICAgWSAgICAgICAgICAgIGRldmljZWxlc3MgICAgICAgICAgICAgICAgICAgICAgbm9f
Y29ubmVjdGlvbl9pZCAgICAgICAgIA0KICAgICAgICAgICAgIC5wbGw0ZDEgICAgICAgICAgICAg
ICAgIDEgICAgICAgMSAgICAgICAgMCAgICAgICAgMjQwMDAwMDAwMCAgMCAgICAgICAgICAwICAg
ICA1MDAwMCAgICAgIFkgICAgICAgICAgICAgICBkZXZpY2VsZXNzICAgICAgICAgICAgICAgICAg
ICAgIG5vX2Nvbm5lY3Rpb25faWQgICAgICAgICANCiAgICAgICAgICAgICAgICAuc2NpMGFzeW5j
ICAgICAgICAgICAxICAgICAgIDEgICAgICAgIDAgICAgICAgIDEwMDAwMDAwMCAgIDAgICAgICAg
ICAgMCAgICAgNTAwMDAgICAgICBZICAgICAgICAgICAgICAgICAgZGV2aWNlbGVzcyAgICAgICAg
ICAgICAgICAgICAgICBub19jb25uZWN0aW9uX2lkICAgICAgICAgDQogICAgICAgICAgICAgICAg
ICAgc2NpMCAgICAgICAgICAgICAgMiAgICAgICAyICAgICAgICAwICAgICAgICAxMDAwMDAwMDAg
ICAwICAgICAgICAgIDAgICAgIDUwMDAwICAgICAgWSAgICAgICAgICAgICAgICAgICAgIDgwMDA1
MDAwLnNlcmlhbCAgICAgICAgICAgICAgICAgZmNrICAgICAgICAgICAgICAgICAgICAgIA0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkZXZpY2VsZXNzICAgICAgICAgICAgICAgICAgICAgIG9mX2Nsa19nZXRfZnJvbV9w
cm92aWRlciANCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZGV2aWNlbGVzcyAgICAgICAgICAgICAgICAgICAgICBub19j
b25uZWN0aW9uX2lkICAgDQoNCml0IGlzIHdyb25nIGJlY2F1c2UgdGhlIGFjdHVhbCBkZWZhdWx0
IHN0YXRlIGlzIHRoYXQgUENLTE0gaXMgdXNlZCwgbm90IHNjaTBhc3luYy4gDQpIYXZpbmcgUENL
TUwgY29uc3VtZWQgYnkgc2NpMCBpcyBhbiBvYnZpb3VzIGZpeCBpbiBzY2lfaW5pdF9jbG9ja3Ms
IGJ1dCBpdCB3b24ndCBzaG93IHVwIHRoYXQgb25seSBvbmUgY2xvY2sgaXMgdXNlZCBhdCBhIHRp
bWUuDQoNCkNvdWxkbid0IGl0IGJlIGJldHRlciBiZSBzb2x2ZWQgYnkgaW50cm9kdWNpbmcgYW4g
ZXh0cmEgbXV4IGNsb2NrID8gKHRoZSBvbmUgY29udHJvbGxlZCBieSBCUEVOKSA/DQoNClRoYW5r
cyAhDQpUaGllcnJ5DQoNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsu
b3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhh
dC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

