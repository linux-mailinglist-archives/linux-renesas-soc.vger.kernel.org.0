Return-Path: <linux-renesas-soc+bounces-19324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B625AFB3BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 15:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9811E1AA424C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 13:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A4B29B23B;
	Mon,  7 Jul 2025 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BGMHA+M4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4052798E3;
	Mon,  7 Jul 2025 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751893195; cv=fail; b=JwG47WQ3KYcM8XgEL10yHzEMGqMPoc4DFkZz5Qc/IegsG5XaBZlz/VuPraGRe0mYC7T9udelfukwtVc054OHJog3aY6wspcE9XXpZHI8Yt1nxL3HakH+IYw60H5RmkKpqjb1+hdBQgCJfSVb0w0zA7tpDKzyyBsPcwBfqH69PE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751893195; c=relaxed/simple;
	bh=s/EACt9gP8V9oCICWh8fHokNEe9ZJgCN6VFXu+kkO6g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LE8JnXYKd3YNk8ffcqq0L4/1/vqiEVgaJEOWK0cUjeYRRElNvI7FbYfdkC7rHhPJMeZ2HsdhTLwCdyTvCwKCsZeM+0NmUWbAOoECWGbfdn6fZBEYexCL6V7VK/Ufgc/07HS2A2CnJ1A9YuBWbVnS7zHllJt1CtbYkhIWsKLySZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BGMHA+M4; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3yzxUdtoLC1YDMl3RXbveeADrIO+6CDXvUSAByRpf2NQErT3ETsLN7jZNxzWXlhJ3y2mM12wOLY4E/II/U4nSsPxeqI4vFKu7jwx7aodWxdSlVfX4/kJLX6fK1DDrBRMJ56HWbXCz2g4rBuwmZdjeS0Je9HEvrIFSDF5Dw4TXOcrXYjtrr+Mqr75GDqCgjY9qUGrUMdTChtUfsgfs7iLsOU5gnfVld57FJYV6UlLGfZNvegErIN+b7xXQhy84Yw22PQgFsBzcHTT3LbGpeIxIUnB4t3ajCqfl5pvLWm1+2sZGxRYOUfEH+syVTaqj0HOV+UDgWokiIDNAKkV7DeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/EACt9gP8V9oCICWh8fHokNEe9ZJgCN6VFXu+kkO6g=;
 b=QEycVIVDAOlJh5uXotTZArMLrGnI+PKm7IEbrsrMP0BC60k0c1api5WDdcgXZjHqMV047st1VQd3bkUa6DZ5kxYTacoAbLUlUrnuBNkfgAglZ5yE4J2oGPGVJAeAd7cy3HGKKS8OR04iPsetB77cTdISuTbdndYHFdZ3j8XwZAOhynwPXPWHrUL46DA2UDbvUhlEIDXyDhh4NYpRpazuMeMrTv3yj+K7/ulq6HEEgaTmQkD+tPpuSPYehcx/SUGGE+GdfZc7fT9FoHA6zPVB5gAkadiOy/5kbW/Xkthm3TEBC2oo6xexFtJIAccIhVsC1utpCFnR44GJ9aR0irJ15A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/EACt9gP8V9oCICWh8fHokNEe9ZJgCN6VFXu+kkO6g=;
 b=BGMHA+M4u8oBMpNfo3rXPf2fcKo0IMD27wGJz77S3MQ+wfC1IkdqzgzLO1dBDuMo4RJ64M/qJCzU3J62iBl3eRB2aiCbl2dUZ1OIhrbFUEOO9MWGIMQBNDTn4BOAdnR54o9ZNkeCrU/dCiJw3LrAo2FcTaj06KK/43sEgJk5gRA=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYYPR01MB12663.jpnprd01.prod.outlook.com (2603:1096:405:15d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 12:59:49 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:59:41 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund@ragnatech.se>, Paul
 Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH 3/3] net: renesas: rswitch: add modifiable ageing time
Thread-Topic: [PATCH 3/3] net: renesas: rswitch: add modifiable ageing time
Thread-Index: AQHb7Ke70ge2dXPfuE+RGJq5QHlkarQmogWAgAABKFA=
Date: Mon, 7 Jul 2025 12:59:40 +0000
Message-ID:
 <TY4PR01MB142826099B116D675990A21F0824FA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <20250704-add_l2_switching-v1-3-ff882aacb258@renesas.com>
 <CAMuHMdUerQwRS7vX7UtaubgvEKjBzRXUR4PsJzxkeYaf9KaiaQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUerQwRS7vX7UtaubgvEKjBzRXUR4PsJzxkeYaf9KaiaQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYYPR01MB12663:EE_
x-ms-office365-filtering-correlation-id: e314d950-9daf-4b27-ed0e-08ddbd562304
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VGRBUWNQSWNsV2drYmZhRXZIYWdnRmJqOEcycW9ZbWVzcnBZdTlvODcxWW9Y?=
 =?utf-8?B?L0EvNDRlZ1h3WEk2Vytza2dCYXBIRlRyb2FnalNEMGd2ejdwSXJpS0NhQVI5?=
 =?utf-8?B?dyttcTIyQ3IvOG9wc1JtK3ZwaDU2QmMyMkZ4UyszRXN1OG1Oc1o2RnVUbC9C?=
 =?utf-8?B?am9aVVpRcWdzM2NQMkdqaCthNEkzT2FaZEQ0dHR6VTVzcmYra0lsSzZnUXA3?=
 =?utf-8?B?MXYwdFZ6RWVkMmtUZDJLMW5IQTUzaXhpNHJ2RlYwS1BVVXhDZ3dFemJFMFJZ?=
 =?utf-8?B?Q3ZxUW5JR0lUbkRUdGxwRmR3RmZEZWZPMUs4NitwWXdZdTMxbUhNUmNhczV6?=
 =?utf-8?B?TmgrR2g5R2ZoV1NJd3U2OGFYcUoxNmpTc0tlRTA5ZGVicEhGRERSeUVwV0xj?=
 =?utf-8?B?a0x1emZjZ21BSk52TmlJZ1V2ZUF6RVlYV2tnOTlXay9TTjdBK2hIU0lJYUxm?=
 =?utf-8?B?WjRpQkMzWVdpTlpDZWJ6MUNpSlNiWGVjTDd6QVp4MjN4ZG9seXZEMDE1a0o1?=
 =?utf-8?B?ME5lRGg4NkRva0JlaWQ2K0VHUFRFNkR2ZHhscFpBbmNPSDlqTmpoWHBIcG5E?=
 =?utf-8?B?VEhqQWlpTldOTnFCU0ZlZlo0UEFNZzBOcTB5UDltMzA0Tm1iNzZxd1hrZnha?=
 =?utf-8?B?ZDlVMWg0RU1RcmxsNWR5MGNFQTJRcmh5SnU2bWRlQXRzZTN5Z1VpUlA0cVBl?=
 =?utf-8?B?aVRqaVduUjhkZHFnQUNOTkYwck1Jdnd6M3pxbGJWcGRuelJQK0ZqSXZJSDdj?=
 =?utf-8?B?L3NQSTNvZWdKemZzOWZ0MS9KTTBTY0ZyRWlvSWZhK3I1QUxlbEJkcytHTEQx?=
 =?utf-8?B?UjVkUC93TXhlM2N6Y2xJK3dOeE1kN3QxclE3YTJaaUNLMXhBTCszV3ErclRz?=
 =?utf-8?B?dkNmMHdFZmNHcFJMZ0JsOGptWnB2bmFFQnVZU29oRXN0RWszYm1NY3pyQnVk?=
 =?utf-8?B?REJPWmlxYUZXc1pyWnNqeWQvM0hwbURva05QRWYrRnRHTjlSd200aUJkdXo0?=
 =?utf-8?B?aUdqTTFRWEI0bHR1Z2F1Zm1YZG0yUE1zRnlQTUpmMTAxTHVpYzZ2cHdMaW5G?=
 =?utf-8?B?TDNEem53OFJJbkVHYzRNeE14SHhLcFkrM1Z0dEQwWVdnRVVkZmhRQWk0L2Jj?=
 =?utf-8?B?NzhWeDRhak9rS0c0aUFKVEZwMXhaZTl2clg3bEtzb21WUk45QlY5Ykd0R28x?=
 =?utf-8?B?Y1lrNDNFdjNhY04xOWUvVEdzdXM2cVZObnRSNzU0eDZsQmdGd2hqNkxHMlF1?=
 =?utf-8?B?bFdGR2wveW1Uak9lazdVbWxEV1ltZ3VCTEQvNDJFMkVzNVNiUUo3UDE1REEx?=
 =?utf-8?B?aVcrV293UXorNjN0M0RIMzl1Tm04UjVsOWJXR0N4dGpndWlsMGQ3aDVNQ053?=
 =?utf-8?B?RmtienJ5NUd4VEl4eExMT3NBVmIrK2xKajJ4dktxTXUwQnArUkxZM3NMT00v?=
 =?utf-8?B?SVQxMzMxSFZJbnlObUFqUEVJRU5tOEY3bTFlbXRENlZUdFNxanQwSkUwRTJj?=
 =?utf-8?B?enJVY1dNaTQ2MGtxMUNvSlcvMW1ZRzF5RXpmUjhyN2lmd2FzV1laYU5PZVVY?=
 =?utf-8?B?REt4cjRxQXdZNUh2MEZKdXFrd1V3OS9hby9vVHBKTFhUcnVUanh3RkdyTXlK?=
 =?utf-8?B?MFlRMFhDVGxaYnNtVitjZTVscldleklBUHE4Tm9XVWNJMUFzMlV4NXFGcUhG?=
 =?utf-8?B?RDVYeHVhQVBCVGJBbWhOQUtpUUs3S2lkM3AxTFlJVTlZU0RFMXhCSy92d1RO?=
 =?utf-8?B?K1c4RU5QMmRmZjJwYjZwYjduMEdXbDBOdGpMRUtEV2k5b1FFSGtEZnNqdElp?=
 =?utf-8?B?QUo1dnc4T1RPaU95M2NCc3VPLytYVzdROHhpYXlGcmFWS0tYNUtIdlkwZ2Vz?=
 =?utf-8?B?SjZJSldySU94NzlDTmxVbFlNV2pySi9OUmtvbTZNemRQVGFRMk9Idklmd1Nn?=
 =?utf-8?B?MlhxeGFqN283dGNhaTdQUTN0dUJtbE5EaW1SMllOOEhhbVo4VW5CNEVUTzg3?=
 =?utf-8?B?OEZaUEVzVnh3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3V2N0F3eW41RzhrRFZ1ZDhyL1lLQUlsR05heEFvYXVaeVhiQWZuMGlXZ1Ri?=
 =?utf-8?B?WEVoVUt2ckNvWWxwRUdyYmduZlBLT2lJOExvN3dtZFA4TGZpUHhjQllRTmgr?=
 =?utf-8?B?aGVFZExZYVhnWngzQ3dKVmZOZWg0SnFoMkNiRlgyR2x5dWFyaGJoOHYxOXJP?=
 =?utf-8?B?SzdmdEFvdHhreEpIV2k0SkRhdVZTb3ZGQTRXU1lpY0ZnR09RUk1vUVhEeXk5?=
 =?utf-8?B?QVdrMFRPZGZhUmxxbjc2Zm5JRG1BL1AvMlpYVldFQUYxd2FqUGYwNXBXQW1q?=
 =?utf-8?B?U0NDQnZRWGs3NEJqa2cvK3QyVEUvOWVuaHdqNW5jZkQ5VHBBS3AwN2hISmxu?=
 =?utf-8?B?bXJHUGRwa2Q3REtTZDhma2dJWWl2d3M1dktqb082TFQ4dW5qamQwV0dlb3F0?=
 =?utf-8?B?NXpXSndhWDVsQitacHpFL1VnT3ZhNnFEaVpwRE03WURnekhjL0RoQ3JLWnRM?=
 =?utf-8?B?UkZ6Z1djamh1WlNmaXJ5WEt5OWRCOXE1a2REdkNkYkpwbCt6N1NIUHFPdVVa?=
 =?utf-8?B?aThBUGkrbnlacWVodmhNL3RqcXdLeUZNT2pHRG1xWDVGTURkem4vL3I5SHZv?=
 =?utf-8?B?ODhlTDF6bWdGRWgzNXI4Q2pFNDhjVEJvN2MvWlIvWjdTalp1V20rQUw3eWFt?=
 =?utf-8?B?STd0Umc1Z2ZKR3FXWUR1MncrTm1HYlFFUHExbkV2OFRVVDYzNU93ZzkzOTBx?=
 =?utf-8?B?ZEkyaDZEQ2VybCtndWZSQ1lZQkQxaUVLbUlFTHpqTDBiUi9aa2ZRWmV2eWcr?=
 =?utf-8?B?QkowdGVlU2tvSTFuQ0lxRlBad216cjRPeHNaQTM4K2RxdmV6eXZKNzdOQXdH?=
 =?utf-8?B?WVJJN1pFbzcwekpRUmpEc3dTYVJ1SEl1ak50ZEtUVDhOeHRSSGNxQXU5NmJi?=
 =?utf-8?B?RzJJTW4zaXloZHFzYmVEZ1d3cUsyelI2OHViTVJGdzNmbUNmOW4vdDczQVB3?=
 =?utf-8?B?bDF4a3dFcmtHb24raTBHdVpWNGhiaXB3VmlsWFRjZTZLQ3B2OFo4R1ExbkFN?=
 =?utf-8?B?WTdTZHExN2lxNjc1WWJzNGVlME1jQ3R4T1NnZ096aVNWdTJrVXRSeE92bFV2?=
 =?utf-8?B?emtNQm9xd1J2UmZ1VW1SMDFPSmNjRjlNUG45VjRIR3ZtY0N0c0NVT0pKa3I4?=
 =?utf-8?B?OWhjc3M0MHBCelNqTS9zODg0dnpmeHZPLzZ6S2dBK0pqV1lzcExVb1M2c2w4?=
 =?utf-8?B?dlZTZHZFSnQwbHRJd3lrUjNmbCs5YjU4d2E1ZjQyQkNUTCtCRTd0cEFPRVBu?=
 =?utf-8?B?czJXRDRPdm1FRENqT09EUkhxUDhPbnBVMGFPZ0x5b0ttcTcza0F4eTMyOEk5?=
 =?utf-8?B?Y2lOSko1UUZjTld0dDNtdVI2b1NWdCtWQTl0TnlKSEpEcmk4THd5QnNqVG14?=
 =?utf-8?B?MTVPRCtFY290cDNlVWZTVU5LV2JCYjlGOTFyQW94UUtsb2VUcWYyKzdjanVU?=
 =?utf-8?B?L0pzRmNwUTI2MEFNTEpwNzJDcUl4d3hDdnBWS1hRdWRSWWNmclRESUhORlpL?=
 =?utf-8?B?aWVRWlUxc3RBSEVyVTk4Mmk0b1VUS3NPTHhVbXJ3cW5qYldLNmFsOVJwUG8y?=
 =?utf-8?B?Q3VWN0lCcXJCeU5JNE9wR2RwaVMwYVJQSXAzK1Y1S2Vrd0ZRTkFzZzhqdVpF?=
 =?utf-8?B?ODRUQ3kvNi9iZThldlYxbXBUa0dySVJwekFKNVdGblNFbXFZYTZuZlVYL3Bt?=
 =?utf-8?B?WCsrNW1HU0lIdk92OXc0T2pVcWQwY3Fab0JQU3NaUndhQVRDMXN4QzMrdUMy?=
 =?utf-8?B?N1pYRURFY29ZWUpGTFZ2WWpWbHhHOGtmWmR5Nk81QVN1R0hYSUZNQWRiZXJ1?=
 =?utf-8?B?SmJURkpxRjM3L0trL210RUlybEg0UGFxWWFjVFlKTTZGcHlwUjFjZGo1VXhr?=
 =?utf-8?B?c1dmaUFrWURrbUNtMk9wY0gzNVV5ZTJvSGV3MzZJK2FBQWp6RDNCNktTK1Bx?=
 =?utf-8?B?VDJIcDdaOERaRDhJK1FhOGU1NnRLMXBob1ZUeFRqTGZJZ3Arc3FhdWIxS0k4?=
 =?utf-8?B?eUlCNWlaTU1jQUZ0ejR6K2pKNE83WWt4cVd4R0NXVGZIRFVEUkYyTW9jNUVV?=
 =?utf-8?B?ZW5MZkpRNVc4VGRXbHR4b3RqdlllOHJ0TXdIaVhVZWRNR1QwMkpJcjk4K2JK?=
 =?utf-8?Q?IM8nopDKNHe2ERfOCDiHdiT2u?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e314d950-9daf-4b27-ed0e-08ddbd562304
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 12:59:40.8429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qD3s7J9Cooh/2CXKMczQKVuCs5pxgkUIdVTHJRGtgtywSJEySMgc0s4JYopNgeN1Dz3mMOsVSR+dlltrUclTa1wb21Vc6NL5uB1wFMM+yWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12663

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgY29tbWVudHMuDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogTW9uZGF5LCBKdWx5IDcsIDIwMjUgMjo1
MCBQTQ0KPiBUbzogTWljaGFlbCBEZWdlIDxtaWNoYWVsLmRlZ2VAcmVuZXNhcy5jb20+DQo+IENj
OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+OyBO
aWtsYXMgU8O2ZGVybHVuZA0KPiA8bmlrbGFzLnNvZGVybHVuZEByYWduYXRlY2guc2U+OyBQYXVs
IEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj47IEFuZHJldyBMdW5uIDxhbmRyZXcrbmV0ZGV2QGx1
bm4uY2g+Ow0KPiBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+OyBFcmljIER1
bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+OyBKYWt1YiBLaWNpbnNraQ0KPiA8a3ViYUBrZXJu
ZWwub3JnPjsgUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPjsgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtcmVuZXNhcy0NCj4gc29jQHZnZXIua2VybmVsLm9yZzsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgTmlraXRhIFl1c2hjaGVua28gPG5pa2l0YS55b3VzaEBjb2dl
bnRlbWJlZGRlZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy8zXSBuZXQ6IHJlbmVzYXM6
IHJzd2l0Y2g6IGFkZCBtb2RpZmlhYmxlIGFnZWluZyB0aW1lDQo+DQo+IEhpIE1pY2hhZWwsDQo+
DQo+IE9uIEZyaSwgNCBKdWwgMjAyNSBhdCAwNzo1MiwgTWljaGFlbCBEZWdlIDxtaWNoYWVsLmRl
Z2VAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRoaXMgY29tbWl0IGFsbG93cyB0aGUgc2V0dGlu
ZyBvZiB0aGUgTUFDIHRhYmxlIGFnaW5nIGluIHRoZSBSLUNhciBTNA0KPiA+IFJzd2l0Y2ggdXNp
bmcgdGhlIFNXSVRDSERFVl9BVFRSX0lEX0JSSURHRV9BR0VJTkdfVElNRSBhdHRyaWJ1dGUuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIERlZ2UgPG1pY2hhZWwuZGVnZUByZW5lc2Fz
LmNvbT4NCj4NCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPg0KPiA+IC0tLSBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3JlbmVzYXMvcnN3aXRjaC5oDQo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvcmVuZXNhcy9yc3dpdGNoLmgNCj4gPiBAQCAtODQ5LDYgKzg0OSw3IEBAIGVudW0gcnN3
aXRjaF9nd2NhX21vZGUgew0KPiA+ICAjZGVmaW5lIEZXTUFDQUdDX01BQ0RFU09HICAgICAgQklU
KDI5KQ0KPiA+DQo+ID4gICNkZWZpbmUgUlNXX0FHRUlOR19USU1FICAgICAgICAgICAgICAgIDMw
MA0KPiA+ICsjZGVmaW5lIFJTV19NQVhfQUdFSU5HX1RJTUUgICAgNjU1MzUNCj4NCj4gVGhpcyBp
cyBub3QgbmVlZGVkIChzZWUgYmVsb3cpLg0KPg0KPiA+DQo+ID4gIC8qIFRPUCAqLw0KPiA+ICAj
ZGVmaW5lIFRQRU1JTUM3KHF1ZXVlKSAgICAgICAgICAgICAgICAoVFBFTUlNQzcwICsgKHF1ZXVl
KSAqIDQpDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcnN3
aXRjaF9sMi5jDQo+ID4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jzd2l0Y2hfbDIu
Yw0KPiA+IGluZGV4DQo+ID4gMjQyYmViMWYxNWMwODk1ODVmNWZlNTAxOWY2MjZkZjg4MjRiOTcx
YS4uYzhhOGE2MGEyMGU3MGY3Y2U0MjEyODBlZDM1Yw0KPiA+IDBjNGFmZTFlZDAzOSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jzd2l0Y2hfbDIuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcnN3aXRjaF9sMi5jDQo+ID4gQEAg
LTE5Niw2ICsxOTYsMzAgQEAgc3RhdGljIGludCByc3dpdGNoX25ldGRldmljZV9ldmVudChzdHJ1
Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLA0KPiA+ICAgICAgICAgcmV0dXJuIE5PVElGWV9PSzsNCj4g
PiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgcnN3aXRjaF91cGRhdGVfYWdlaW5nX3RpbWUoc3Ry
dWN0IG5ldF9kZXZpY2UgKm5kZXYsDQo+ID4gK2Nsb2NrX3QgdGltZSkgew0KPiA+ICsgICAgICAg
c3RydWN0IHJzd2l0Y2hfZGV2aWNlICpyZGV2ID0gbmV0ZGV2X3ByaXYobmRldik7DQo+ID4gKyAg
ICAgICB1MzIgcmVnX3ZhbCwgdGltZV92YWw7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKCFpc19y
ZGV2KG5kZXYpKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gPiArDQo+
ID4gKyAgICAgICAvKiBBbHRob3VnaCBicmN0bCBhY2NlcHRzIHRoZSBhZ2VpbmcgdGltZSBwYXJh
bWV0ZXIgaW4gc2Vjb25kcywgdGhlIHZhbHVlDQo+ID4gKyAgICAgICAgKiBwYXNzZWQgdG8gdGhl
IGRyaXZlciBpcyBtdWx0aXBsaWVkIGJ5IDEwMC4gV2UgbmVlZCBpdCBpbiBzZWNvbmRzLg0KPiA+
ICsgICAgICAgICovDQo+ID4gKyAgICAgICB0aW1lX3ZhbCA9ICh1MzIpdGltZSAvIDEwMDsNCj4N
Cj4gc3dpdGNoZGV2X2F0dHIudS5hZ2VpbmdfdGltZSBpcyBjbG9ja190LCB3aGljaCBpcyBsb25n
LCBzbyBubyBjYXN0IGlzIG5lZWRlZCBiZWZvcmUgZG9pbmcgdGhlDQo+IGRpdmlzaW9uLiAgQWN0
dWFsbHkgdGhlIGNhc3QgbWF5IHRydW5jYXRlIHZlcnkgbGFyZ2UgdmFsdWVzIG9uIDY0LWJpdC4N
Cj4gSG93ZXZlciwgZHJvcHBpbmcgdGhlIGNhc3QgbWVhbnMgdGltZV92YWwgc2hvdWxkIGJlIGNo
YW5nZWQgdG8gY2xvY2tfdC4NCg0KVGhpcyBkaXZpc2lvbiBoYXMgYmVlbiBkcm9wcGVkIGNvbXBs
ZXRlbHkuIEFzIGl0IGlzIG5vdCBuZWVkZWQuIEFuZHJldyBwb2ludGVkIG91dCwgdGhhdCBicmN0
bA0KSXMgZGVwcmVjYXRlZCBhbmQgSSBsZWFybmVkIHRoYXQgdGhlIGFnZWluZyB0aW1lIHBhcmFt
ZXRlciBpbiBpcHJvdXRlMiBpcyBhbHJlYWR5IGluIHNlY29uZHMuDQpJIG5lZWQgdGhlIHZhbHVl
IGluIHNlY29uZHMgZm9yIG91ciBoYXJkd2FyZSwgdGhlcmVmb3JlIG5vIGNvbnZlcnNpb24gbmVl
ZGVkLiBVcGRhdGUgd2lsbCBjb21lDQpXaXRoIFYyIG9mIHRoaXMgcGF0Y2ggc2V0Lg0KDQo+DQo+
ID4gKw0KPiA+ICsgICAgICAgaWYgKHRpbWVfdmFsID4gUlNXX01BWF9BR0VJTkdfVElNRSkNCj4N
Cj4gaWYgKCFGSUVMRF9GSVQoRldNQUNBR0NfTUFDQUdULCB0aW1lX3ZhbCkpDQo+DQpUaGFuayB5
b3UgdGhpcyBpcyBoZWxwZnVsLCBJIHdpbGwgY2hhbmdlIGl0IGluIHRoZSBjb2RlLg0KDQpCZXN0
IHJlZ2FyZHMsDQoNCk1pY2hhZWwNCg0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsNCj4gPiArDQo+ID4gKyAgICAgICByZGV2ID0gbmV0ZGV2X3ByaXYobmRldik7DQo+ID4gKyAg
ICAgICByZWdfdmFsID0gRklFTERfUFJFUChGV01BQ0FHQ19NQUNBR1QsIHRpbWVfdmFsKTsNCj4g
PiArICAgICAgIHJlZ192YWwgfD0gRldNQUNBR0NfTUFDQUdFIHwgRldNQUNBR0NfTUFDQUdTTDsN
Cj4gPiArICAgICAgIGlvd3JpdGUzMihyZWdfdmFsLCByZGV2LT5wcml2LT5hZGRyICsgRldNQUNB
R0MpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBz
dGF0aWMgaW50IHJzd2l0Y2hfcG9ydF9hdHRyX3NldChzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiwg
Y29uc3Qgdm9pZCAqY3R4LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBzd2l0Y2hkZXZfYXR0ciAqYXR0ciwNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgbmV0bGlua19leHRfYWNrICpleHRhY2spDQo+DQo+IEdye29l
dGplLGVldGluZ31zLA0KPg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPg0KPg0K
PiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQg
d2hlbiBJJ20gdGFsa2luZyB0bw0KPiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVy
IiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
DQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBHbWJIDQpSZWdpc3RlcmVkIE9mZmljZTogQXJj
YWRpYXN0cmFzc2UgMTANCkRFLTQwNDcyIER1ZXNzZWxkb3JmDQpDb21tZXJjaWFsIFJlZ2lzdHJ5
OiBEdWVzc2VsZG9yZiwgSFJCIDM3MDgNCk1hbmFnaW5nIERpcmVjdG9yOiBDYXJzdGVuIEphdWNo
DQpWQVQtTm8uOiBERSAxNDk3ODY0Nw0KVGF4LUlELU5vOiAxMDUvNTgzOS8xNzkzDQoNCkxlZ2Fs
IERpc2NsYWltZXI6IFRoaXMgZS1tYWlsIGNvbW11bmljYXRpb24gKGFuZCBhbnkgYXR0YWNobWVu
dC9zKSBpcyBjb25maWRlbnRpYWwgYW5kIGNvbnRhaW5zIHByb3ByaWV0YXJ5IGluZm9ybWF0aW9u
LCBzb21lIG9yIGFsbCBvZiB3aGljaCBtYXkgYmUgbGVnYWxseSBwcml2aWxlZ2VkLiBJdCBpcyBp
bnRlbmRlZCBzb2xlbHkgZm9yIHRoZSB1c2Ugb2YgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IHRv
IHdoaWNoIGl0IGlzIGFkZHJlc3NlZC4gQWNjZXNzIHRvIHRoaXMgZW1haWwgYnkgYW55b25lIGVs
c2UgaXMgdW5hdXRob3JpemVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
LCBhbnkgZGlzY2xvc3VyZSwgY29weWluZywgZGlzdHJpYnV0aW9uIG9yIGFueSBhY3Rpb24gdGFr
ZW4gb3Igb21pdHRlZCB0byBiZSB0YWtlbiBpbiByZWxpYW5jZSBvbiBpdCwgaXMgcHJvaGliaXRl
ZCBhbmQgbWF5IGJlIHVubGF3ZnVsLg0K

