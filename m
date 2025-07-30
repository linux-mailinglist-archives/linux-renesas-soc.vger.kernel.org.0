Return-Path: <linux-renesas-soc+bounces-19784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E8B16335
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 16:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C6DB18C79B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 14:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93922DBF4B;
	Wed, 30 Jul 2025 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ujTHFjBk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011014.outbound.protection.outlook.com [40.107.74.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EE7298CA6;
	Wed, 30 Jul 2025 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753887181; cv=fail; b=GcjBc2fl/tXIHaKpsTLxW+YNYyebNLPoOdYl06pQiN3dxNbpd8nH8D1zSbkXcYEcKwIOt+L99Be2v1nTb9d05mKC9/ZyuzVbqtRKJx7r92/nv0MiG0dhEi83Mp1m+OjW1wZ8bBXp2+gAYpPjvSB9N04xEwxpUnKtzGknikYlFbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753887181; c=relaxed/simple;
	bh=jLRPXFO20TBXB+oBWUf9wlagRLdbwxDSLZ1x5PViJsg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M1eGHohqTVV5aeEzuBd9v5DLEWCrMAZeEEyJnU45CDzCrTF71tMnnDkUHjpd0Pv7PzAmiKo/vauUTWCUu9r4wy+X8I8SFqc5Fy1v3IIFlI/is4LMqti9qsIFDARxtw0QHe904aqnedqm8ZxId5a7cjukkVxwTrwp702YA5nWk1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ujTHFjBk; arc=fail smtp.client-ip=40.107.74.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVapSetnDtoshsUv0RqQi5BOWZfnxKyfAQCIHxjQJmGHXRPe+FOgLkf3SAi4oIYapUG8/vlTL/dTCgsQmfuYIZrG22G4PrJstIgsDLlnmyz1x78zRrVu27I4qFu2PjflfFDLwHbcCMj/Xv/nPe16k51e9s1omh7Mpcu2Yzd8ndpRwPTMWdpSSGk1+TKTOcm2Nlp/OAwhhmJTAFjP/xk3pWXM98UjPeAwm8qoXYa9TQQTGTBX5r2U10pRtDDJTJQc3sX8oUcvtylsEDfveblC4BEZXbj5P6/Xaz3CZALC5WIuF+gtDUnj+iJBmEbOXZgCM71lgWxa3qi1HoLazN+ztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLRPXFO20TBXB+oBWUf9wlagRLdbwxDSLZ1x5PViJsg=;
 b=pK/63WpIcR6AdBCbf3pmZ8gRQ/QBWUsrYqEocVPKl9BMq+d3uxaMV96sBcDY3BZtjk0bYpK94VKb4WoHRzcIneMQiMhWjMGAaj+lYX3R09NjM7Dtg82TAUZsGnjrkuDMHFnPTd8SiBDtc9NpcVL1OSf2J9dfSESZhAeL7w21iZ/LM0Ah5FiJvThR7D6GqiY65wUj4wWDpKHBjTfokBdMsBDtw67vNOEWSuDYkga639Eh/H2l+Kdv+PVhKBN2k/d+y7RlsmalOQEUrQvYPr70Bz++7j4gnsLdrsPgqidm69XLkqNXB6ZbuabhYNpHixKH7U3TM9d4uLZOfLNCv2TC4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLRPXFO20TBXB+oBWUf9wlagRLdbwxDSLZ1x5PViJsg=;
 b=ujTHFjBkFZXmd2jnhqxigedVLJsvmPJ5qiqWb1N8C5DizK5YkqEBdljAycrVWN2GqMa3C4Jw5J6YgY6s3ITeGY6yrX0uYP1dZOGQaJTTn3uDNij8ajrQMGLl0ASsWxtlc9ZZp36IS5OpbHrtfNEb5Tw50YlzGGO0m1RVuDRv94w=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11639.jpnprd01.prod.outlook.com (2603:1096:400:37f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 14:52:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 14:52:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
CC: kernel test robot <lkp@intel.com>, biju.das.au <biju.das.au@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Thread-Topic: [PATCH v2 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Thread-Index: AQHb/xCTiDIH7i0tZU6d0LnXFP+CfbRKN9KAgAAvfYCAAE4sAIAAA/GwgAAK3jA=
Date: Wed, 30 Jul 2025 14:52:54 +0000
Message-ID:
 <TY3PR01MB11346BCAE63F4E78CD614E02F8624A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250727160731.106312-2-biju.das.jz@bp.renesas.com>
 <202507301421.AmWhOZBk-lkp@intel.com> <aInjE-sduVbBRmJx@shikoro>
 <CAMuHMdUHog6rehPFu9t99N0F-69sr1fQGWmX1sBR40=kDvD=Bg@mail.gmail.com>
 <TY3PR01MB11346C0622E61F19C38B2AB238624A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346C0622E61F19C38B2AB238624A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11639:EE_
x-ms-office365-filtering-correlation-id: 452dd4cb-2ff6-4e2c-2d78-08ddcf78c408
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Sng3THBNbUhtWTd5Z1hLV1Nvc2ZUUXhwOVFlNGUzVXFGaXA3WHpLdkVpLytS?=
 =?utf-8?B?Y1pnQ3h2R1FyVHNISjJReHZkdjZlWWtsaGY4ays1NmdLTUwxUlVqc0RFelZh?=
 =?utf-8?B?bzdlcDVuYm8zZVQ2c2FTc21wMFVvdnpHWGdlOE1YWmhtWmo2Z004Zzl3eEJG?=
 =?utf-8?B?Nm5ESlJycUloRUxLc1BBc3lTYlA2SVJ4M2ZLbndzQm1PV21ZeGVYZSsrbzdJ?=
 =?utf-8?B?WWc4b2orZ0RJdFRLaU5nblZtZnViTVJidmxhZmNEYTIyeFF3MUQ4MURpTXFk?=
 =?utf-8?B?T01maTBKRGVkT1ZPMGJ5UDFqZy9BMEdFWFlMYlhtbzlsR2krZVIyTVNEVXhi?=
 =?utf-8?B?OXprUjNPOEdaOWdXRmtwanVTUHZOYXc3TDhlckIwaHo5Rk5OS0NmRlRESUlZ?=
 =?utf-8?B?aXI0YVJXSmx4bElIcjk4NGt0RG5LT0JmVkhjYzVpNnZGeDVsTWoxR1V5UGtY?=
 =?utf-8?B?VlBvbnU4Ni9XcDQzbmdwSysyOWkyWGQrckJnNTRmcDk2NVZYd3E3RlpML3pF?=
 =?utf-8?B?UFdNYlhXWW9lNWpWOFdvWEFlZ1lWUTVVbWtSSUk3RjRNUXhYZVVsZnNuUnNu?=
 =?utf-8?B?RGd1aGFQa2tiZGlKOVZsYzRlbE8yUGRUNnZSenFyYXcyUHBVc0FZOU9teTFC?=
 =?utf-8?B?cG1NQm8rWTJJTTJwVFJUaHFzNXlZN0NPNUs0Q2VFWWJZVDkvbWNYOHdjODRj?=
 =?utf-8?B?Y09yRkZ3ZW9oak93bnhucEtRdXFGVWdzVDdYOGM0VThiRDVDeTJLMHBWajBE?=
 =?utf-8?B?N0JRMWxwWFRmZkJ5Um1PN2JUOXE5a2NrOE9GTGNmZXRYendkVWNQMU02RFE3?=
 =?utf-8?B?Z0g4R1J5aVpqZXFsUDBvVDdIaTdUMUtqVlI3VkdBcHZNa0NQWjk3K0FIZVlG?=
 =?utf-8?B?dE5mQW9YWm1TVHQvN0lGWm54T2ZKamVJbDNFaDhwcUZMVXlXVWtUKzFBQzUr?=
 =?utf-8?B?TjNoR3ZQa1IyaW10aDZXZER0NGRGbDNJNlBoY1dZREVMQkcwV3VEK0E4SXpB?=
 =?utf-8?B?UGtwVkc0SjdkRUJZZHRQcEtiZ0pGOW9CTnNwS29OOHlpZUh2RTZOSVZkMjFn?=
 =?utf-8?B?U1BFS3lMbno1cFRLM3B2aHZKNVZGOTNLa2piYlUwKzFhd3BEZXE5QVZ0bnF3?=
 =?utf-8?B?UkZyaHpTQWR4WWx4WjMrRnBJRDM5ZG9kNDUvN0x3Zm9PdVBJK05WWGhZendP?=
 =?utf-8?B?QkE3RStob05qSCt0M1kzSXNIR0Z3R2RlZUgzdDVFQnRvT0NHUmdxQXIxNDFx?=
 =?utf-8?B?MVRsbktQKyt2NjZVbDU1R2grZEhoMEdzY3c0SVJkQmVWdk5PalVuSWc4azFB?=
 =?utf-8?B?ZEtFV1BjMFZZYm1PZi9UMkx4WWpTaGE4REoxcDdMYm4vK0VHWGtUVjZVcjBu?=
 =?utf-8?B?VnRwdDFQRW96OUFoS3VMMEZNTUIwRFA5SEJhdXRWaFgvUmFiRGl6UFpidW43?=
 =?utf-8?B?SnpFNDFtTG5oWitrNi9HWWZwaitPNVhTR05McUMwRElhTHlLYTd2ZXJqTGdE?=
 =?utf-8?B?Sy9zSU5SQWx3M0lxYTNrcWVOSGtVZVhGVEpXTmhPWDJLSE5nWE5ld0FTQlND?=
 =?utf-8?B?R1JxZko0azRMajdvY0pRRU5SanYrUW1VUlZvRSthYkhsRTFXTDMvbjBLdS83?=
 =?utf-8?B?SndVTTRqOFBtYm52MmdSelpKd2V0a0d1emplUkZZbkRLQWxOYS9HWk94SFR4?=
 =?utf-8?B?QXY2QVVHM1l0cWhmOEhieDh4VStKRXN4WFNsNXd5NDZnUzBmMFVVdXA5bzVX?=
 =?utf-8?B?UkU4bjFyRVp3eHhKd2JIR3NWQVVPdjJLSU1aLytaR3MvSkp5Y1c5ZHVTaFM2?=
 =?utf-8?B?dHR6UnFwbGVqNUtYOSs0WnJ0aDNUajRGaDlQYS9HWjlkR283akRLRWhFTDE4?=
 =?utf-8?B?Z0doRTZvcGhvTC81OTNuNGh3VXlRRUtSQmNxN0d0MUhGRTFWL2hnQTNCRjVV?=
 =?utf-8?B?WWxWRkt6RThIenBRbXAvL2w0Q2ptaXIxNFN1L1c3SXhVbWZzcWNhSlNQdFBm?=
 =?utf-8?Q?0nGz/zkvV/s/jOkFp24IwRKLHX0vqg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEJyMTJGM2RFRFN2RjQweXlQNTIyZm1RZkF2S29JYUdIRzNYOUxOVS9mVjk3?=
 =?utf-8?B?d1hxZnhVNkJXWnZHdHRBL09pdC9wUEZYQUNZL1dTTTNxUkNCY2c5YTdiY1RC?=
 =?utf-8?B?djZYN24ydXp3VWdEVExwdFg1K0ZvdzBFZ01oRURKejc5b1l3YnZaTXl4b3BP?=
 =?utf-8?B?aUNVaU5wblN5bHJtL0d6RTg3UjZkRjVUMkZRQmZnWG41ZjhadEVmY2RqU2ph?=
 =?utf-8?B?T21GclE2L1pSa1Rrd1BJRFZzU2tFYW9HckZGUy83QWdSNFczbUo4QndXU3JQ?=
 =?utf-8?B?YkNyaHNSZDlOdXlZd21zbCswV2tYUEo1N2svU0tLTXNYaGlXR3lkVnV2K0NI?=
 =?utf-8?B?b01aL3AzdlkxZzF2bGh4UlBaNnpsQmxHeTBKM1RTL0c1RXNHWkI0T1luSVp1?=
 =?utf-8?B?MHlPS0UxYWF6L2g4UWRldTlOcGZJaVBjd2xpWHNVTlhUaDNDdmIwNEp5QzlN?=
 =?utf-8?B?cC9KUTRlalJpaWkzQVpQOVBWL3FGd0dSeHBoTTEyQ0xhSXA4YkNrNUVZMDRn?=
 =?utf-8?B?UlU3bjBOYlFqOUdOSmhENFdtaDIxRVgyVEx1NDQyTnNwTUFYTTI2YlNrTHBh?=
 =?utf-8?B?empHWEJMalRoTUtSQnlDNG1FeTYvSUlyWlRNWk1lQzNhZUR0ck5xTnk0QTlL?=
 =?utf-8?B?bzdvTEwxQ3hVSzc2VE4ydng4R2NxWld5b0dOSlNsbjlaMTVXVnRpd1pldU5q?=
 =?utf-8?B?NjZZQzVOdEc2WFNwZ3lDTDNncUZTR3lXcXp4UjFZeDhDMVk1U1lwZmFJbjgr?=
 =?utf-8?B?OC85am1xYUtaWXJwdkNvOWplS1AwbVlYOElKUEIxa1g3bjFMSk42SEFJNlBp?=
 =?utf-8?B?MTZMcXM4emxqQmZFSlhxTUZWTHN3RkdialkwdnBWWkxQWTBOTTlvWGtiMS9q?=
 =?utf-8?B?amYyQW00MFpZRHFiZ3VjbWJHMVBBMzBMOUlIWlhmZWlwRE9JekxBK1kveEpS?=
 =?utf-8?B?WUxmVkljc2I3QXpFVXNsZDV3UjZsVzlSL29oYTNnWUs3L3J6SEdHaGxRbWow?=
 =?utf-8?B?Wi9iOWlCUlBhaGRvcW9GZndmQjBOVElKVDhETENoY3hpREorZWxTOWJFZ3hI?=
 =?utf-8?B?eHlHNi9UMVh6NzlTMUZWL3B0enN2Z1lZUTBMck9YWTgxb3dBOTBma1pPbkRV?=
 =?utf-8?B?Z2I2L0pJRDMrdm9BOGhXWHo3a0V6OFp6a2NKMFZ1Vm9kYU1kNXV2a2hRSG9N?=
 =?utf-8?B?cHhGMHVraDljQTdRaEowaTB4ckNuUENDYmZzaWdNenhSQTJ6SGtYVWE1czVS?=
 =?utf-8?B?dC9JRVVTZzZNczJIWGVEQWRkRFJCc2NZcldhVlEydVhxVCtWb051V2gxQVd5?=
 =?utf-8?B?elc4d2tQNUpEVlJXS3dEeGNoRnoyWFBrejM4K2RwSXkxbFlFdkkyOE4yMUp3?=
 =?utf-8?B?Z3FMZ3lkRzJsNFN5QzUwOU0xOG1YdHZSS2hWcE1pYW1aaXRyWG9Ma1NzdCtW?=
 =?utf-8?B?ZEdHVHpXcXdENnBKbUlJVHIveWxmVktYVGhKYzFaSERyRDdDb3I4UDkvZWpr?=
 =?utf-8?B?RFV1dzFJUGxtaCt0L2ZWNkxsRkFQKzNiUTA0cWlIalRFU2RIc1ZhQ00xK2RJ?=
 =?utf-8?B?WEc3dU1IbXBtMXdiUzVpanRBMkEwbHhlUHNyeERiTXNtWnMzc0RkU3JpeU1l?=
 =?utf-8?B?dTlFRTY3cEdTRkJoYUNDUkF1c0ZpMFpCUkxFcjFzN2R4dEVDdEtpRm5jOW9N?=
 =?utf-8?B?ZnI1U3VOeU1sdklPU28yOG9BemxEQzJjbE0xZkk4WjdFSTVTSzJ4UXZ5bDZP?=
 =?utf-8?B?ditpY25rWk00OUJZdUVNOFI3dWdUaTBxaExreGxmUkhsVlp0OGpNNlNBTGFa?=
 =?utf-8?B?OGVaVitndTNZLzZqSmNCVlJJSUVlNUNQRFY2aVNQdnI3NG9BMHAvMXg1Z0wv?=
 =?utf-8?B?dnR2MGh6WmlLbHFKQkxSclNVMENPL0p1Q0VlTXNiVkU3R0FDR3lrZFFWTlFz?=
 =?utf-8?B?eUFEaVRxRTlScUwxREpHODFkMTdvTUhENnlQNFZTS2xqT3hmVkduQkxXNk1h?=
 =?utf-8?B?RHp0K0h5TFdRd28ySkZsdmNCZVNaajY0VFh1bkNRNVNkZXZPTlgzbW4wbHZt?=
 =?utf-8?B?OGJwQ2grQkhVSm9EK3E3UE9uSW9VQnpzZVY1UW1lcTNlZHdsRUxnM0FjYWVY?=
 =?utf-8?B?OGYwUW4yb2RDRVRiVERyOTdOMWRrZkljdGlaOGhESTZ3N21WbWkwVjZDK1V6?=
 =?utf-8?B?QXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 452dd4cb-2ff6-4e2c-2d78-08ddcf78c408
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 14:52:54.7743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UUWRe2rh0vI/PADbRi3qsIgo/UQuxVn9VGHRYeEyWZ1sp92+HZrQzVO6nDkKudHF/2up/1eXxkJpHW2Fz2JHxY9ZSpoUm32uVBi1kzG8yr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11639

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBE
YXMNCj4gU2VudDogMzAgSnVseSAyMDI1IDE1OjEyDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIg
MS8yXSBtbWM6IHRtaW86IEFkZCA2NC1iaXQgcmVhZC93cml0ZSBzdXBwb3J0IGZvciBTRF9CVUYw
IGluIHBvbGxpbmcgbW9kZQ0KPiANCj4gSGkgR2VlcnQvV29sZnJhbSwNCj4gDQo+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPg0KPiA+IFNlbnQ6IDMwIEp1bHkgMjAyNSAxNDo1Nw0KPiA+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMS8yXSBtbWM6IHRtaW86IEFkZCA2NC1iaXQgcmVhZC93cml0ZSBz
dXBwb3J0DQo+ID4gZm9yIFNEX0JVRjAgaW4gcG9sbGluZyBtb2RlDQo+ID4NCj4gPiBIaSBXb2xm
cmFtLA0KPiA+DQo+ID4gT24gV2VkLCAzMCBKdWwgMjAyNSBhdCAxMToxNywgV29sZnJhbSBTYW5n
IDx3c2EtZGV2QHNhbmctZW5naW5lZXJpbmcuY29tPiB3cm90ZToNCj4gPiA+ID4gICAgSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvbW1jL2hvc3QvdW5pcGhpZXItc2QuYzoyMToNCj4gPiA+
ID4gPj4gZHJpdmVycy9tbWMvaG9zdC90bWlvX21tYy5oOjI0OToyOiBlcnJvcjogY2FsbCB0byB1
bmRlY2xhcmVkDQo+ID4gPiA+ID4+IGZ1bmN0aW9uICdpb3JlYWQ2NF9yZXAnOyBJU08gQzk5IGFu
ZCBsYXRlciBkbyBub3Qgc3VwcG9ydA0KPiA+ID4gPiA+PiBpbXBsaWNpdCBmdW5jdGlvbiBkZWNs
YXJhdGlvbnMNCj4gPiA+ID4gPj4gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dDQo+
ID4gPiA+ICAgICAgMjQ5IHwgICAgICAgICBpb3JlYWQ2NF9yZXAoaG9zdC0+Y3RsICsgKGFkZHIg
PDwgaG9zdC0+YnVzX3NoaWZ0KSwgYnVmLCBjb3VudCk7DQo+ID4gPiA+ICAgICAgICAgIHwgICAg
ICAgICBeDQo+ID4gPiA+ID4+IGRyaXZlcnMvbW1jL2hvc3QvdG1pb19tbWMuaDoyNTU6MjogZXJy
b3I6IGNhbGwgdG8gdW5kZWNsYXJlZA0KPiA+ID4gPiA+PiBmdW5jdGlvbiAnaW93cml0ZTY0X3Jl
cCc7IElTTyBDOTkgYW5kIGxhdGVyIGRvIG5vdCBzdXBwb3J0DQo+ID4gPiA+ID4+IGltcGxpY2l0
IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucw0KPiA+ID4gPiA+PiBbLVdpbXBsaWNpdC1mdW5jdGlvbi1k
ZWNsYXJhdGlvbl0NCj4gPiA+ID4gICAgICAyNTUgfCAgICAgICAgIGlvd3JpdGU2NF9yZXAoaG9z
dC0+Y3RsICsgKGFkZHIgPDwgaG9zdC0+YnVzX3NoaWZ0KSwgYnVmLCBjb3VudCk7DQo+ID4gPiA+
ICAgICAgICAgIHwgICAgICAgICBeDQo+ID4gPg0KPiA+ID4gU2lnaCwgdGhlbiB0aGUgZ3VhcmQg
c2VlbXMgdG8gYmUgQVJNNjQgYWZ0ZXIgYWxsIDooDQo+ID4NCj4gPiBpb3JlYWQ2NF9yZXAoKSBp
cyBkZWZpbmVkIGluIGluY2x1ZGUvYXNtLWdlbmVyaWMvaW8uaCwgYW5kIHBvd2VycGMgZG9lcyBp
bmNsdWRlIHRoYXQuDQo+ID4NCj4gPiBQZXJoYXBzIGRyaXZlcnMvbW1jL2hvc3QvdG1pb19tbWMu
aCBzaG91bGQganVzdCBpbmNsdWRlIDxsaW51eC9pby5oPj8NCj4gDQo+IFRoaXMgZG9lcyBub3Qg
Zml4IHRoZSBpc3N1ZS4NCg0KUmVhc29uIGlzIENPTkZJR19HRU5FUklDX0lPTUFQPXkNCg0KU28s
IGlvcmVhZDY0X3JlcCgpIGlzIGV4Y2x1ZGVkLg0KDQpDaGVlcnMsDQpCaWp1DQo=

