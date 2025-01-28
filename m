Return-Path: <linux-renesas-soc+bounces-12664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D89A20B77
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A8B9167731
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 13:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAE729CE7;
	Tue, 28 Jan 2025 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Eb2mZuEH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5FB1A9B3B;
	Tue, 28 Jan 2025 13:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738071788; cv=fail; b=r9BuAexlT9c9jj/DAN5kRHDDTUnU+EL530u576HnPf+KLLCE9qOw4xS/4fig7TZckKUqH/6IDhkaw0UXXECegyjVAAV18DvX42iyNpz+SGzIMgsRds7F82rT8xVShm+Ms1jz2sMmQXhLKZ30n/VgTu6OyX810u3/ZA/L8AWKhzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738071788; c=relaxed/simple;
	bh=ZOmy7g5hqu1Xy1IRObm1onLPolfpoIkuI/YeEpAkMYw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BMGmXCL7f22eQNppvaIsBs/gQUeiHg/AeSzOTeqYnYeAsSLboumnU9fHHeZsNQQJCIyYLRSvEmEpZyEedCXovLQ62kkDkkJ7Azivk5/kuAnrYl2z676LW5QjvmX089jphRSoHi88pGoDi7ZotQzhUjq32BI/FGtRyTJQuu13Tik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Eb2mZuEH; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybSIXXaeq0+XJ1rUQ07hPTw3Wt/H7QfaV0GGo6ptLDAT/BoiIQyyn8in4r0QgvinBF7behZfkn4MzSAuX6Xjmlc7fNtSdyBL9/F75GpG1v6soUAwOg6c/a8kAf01qKDNynqVdvR5CaR95w4JCL7xPq2YSMepSuA2eue8fOeATdc6KHj7WO0zt/SRMph2gL2BktRxf6H+T5xIZFeTEly6XFVHHvP1IbFJYm2GO2LGhOcUI4MShamzxNjM8LI4nvxAl1gIiGrwUgxzLwgel6s0hjDXAw3QLGT+iR8b8Whecqy1MhgNp7xqQLug8R4UUVHatDknl2NjRzaHlMcVDwhjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOmy7g5hqu1Xy1IRObm1onLPolfpoIkuI/YeEpAkMYw=;
 b=ZKXaGaPzHozp/nj9QsPbpIVPl0pcdo5VDAyFSIjDKu9/zBYZ8Mzm46uC5dNt8blRUBsb8yG51VcMyCQQ3ZpcYzgZ6WFTUO7kJ+/nQNnIlEkc8ah+49tD4CH3NqWnJx0KiMlTCiW8g/ZjuJ8owpG8lbSTzGP/Cvm1Fr8oF2kQarechpNXPUlW58f9j1eN8877lR9VMQsrWWHbc1adLUIAt8/8VFwuPIQ15gOYq0zibo+IJqMbWv42LPzJ0N1Dlp9q99N9HVXQBilt1utUeyQ9UFn3fAVPyJ8xADHSHegjaCPap8V1jIR7zWl9/tRIbvrcGWpURXPzPLw+Wz5d4WlrpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOmy7g5hqu1Xy1IRObm1onLPolfpoIkuI/YeEpAkMYw=;
 b=Eb2mZuEHIiUwr0T/OsfAj+ZwYEB5NfTZJhr227J74A3a/E7tk9iYQ1Oaoa0z+e3HPdvuQVl0TQwWy+bOrcSMe/e5HxW4gpoY/38HRPiQYcxwTcjWC53odjuYWWLbja02m9b13wD8CRHlNyZik4uAA+Vip2dVN8Op77dxxcHnTcc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9905.jpnprd01.prod.outlook.com (2603:1096:400:237::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Tue, 28 Jan
 2025 13:43:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 13:43:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 4/7] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Topic: [PATCH 4/7] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Index: AQHbb/jEZGuIIdhuZkOjIsue2ByHV7MsMhuAgAAAU6A=
Date: Tue, 28 Jan 2025 13:43:00 +0000
Message-ID:
 <TY3PR01MB11346ADB42D7CC3736A70BD4D86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdXfxSRsaBQ-wRq0C6j5znQUQPSzhPigLyvU+DTOHyckfA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXfxSRsaBQ-wRq0C6j5znQUQPSzhPigLyvU+DTOHyckfA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9905:EE_
x-ms-office365-filtering-correlation-id: 08fe50ef-9500-4e23-0ad9-08dd3fa1ae3f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MHZIYXloeW5jMmVqd05iVHF1WE9mT0ZveXFKZ0RGaEl1aWVYU2ZPUXBmY2hN?=
 =?utf-8?B?K0wxUklScVRrb1pGWS9yZlNQdEl2cUFqRUMvMGp1MzRPZGJ2MXRlUWhiUXBJ?=
 =?utf-8?B?UzZhOU9kRWVNZHFLV3RJSUpUR3hZVnUyZkZ5L3dtVXVWK3I0djhaRGwrc05s?=
 =?utf-8?B?OHhLMTlSVUp4cVd0RllCRUh1Yk9KVk9YWmpFb2pCVkdIYUpCcEFpalg5aFE0?=
 =?utf-8?B?S3J3VHFTWEVTb1A1NlFib0lvV0N0YXdRTnpzT2pmY0txMDNYY2pmaEFGZ1Y1?=
 =?utf-8?B?QlRHVTRQbVpDZStzM0FrdWtveGtTQkpaalpMc3pTTURZZmRBRWUxcFpMMWNq?=
 =?utf-8?B?eXZmZGN4MmlJWlc3UEhsVDFXYnlyN0M3VjdLY0JYTjhEbi9wOHJiNlh4Y2Ns?=
 =?utf-8?B?TmhmdHk2NTBheE4zTm96TlJkRXZmN2hrbmh5QW9wc25oeWdGM2l2Z0svMHla?=
 =?utf-8?B?b1ora1RLeENnU3ZQSWRxYW55UDQ3d0dVZHRaSEtzaDV0ZDBQOVpMYWxxUGR6?=
 =?utf-8?B?SG9Qc3NtelQ1OXpiSy9XM3NjdmMyckQxL0V0TjZPL3Q5VngxWGx1Z05TZmFv?=
 =?utf-8?B?SVJZKytodWxhRjV4dnNLdXFTRTErdUxVTWdscGtOMk1HT2dWdU5BVG4rbm1Q?=
 =?utf-8?B?V1F4S2NOWmlvR0tFZ0wyYmpDVlZrUW80Mm4wbVFZZk5HWFMza2ltc0RnSXps?=
 =?utf-8?B?TGFnYW5senFUd3VON0hVaTlOSm81NVQ3dmRpOWhwOTFNRlFjRkJ5K0JRVkF3?=
 =?utf-8?B?eDMydG00cFh3QWlxTE9uQTIzY3lRZmw5WGhiQjJBbTVCTTgyVWYvK0RYNnpH?=
 =?utf-8?B?Tll3TmdlYXJKRUpDYlV5MUtDbEs5VERXQVJNRGorRU56WkxLaHBTRk5VVFcx?=
 =?utf-8?B?dXY1RkRmVEh2enltWUdQcmprSk4xdVZhejA2RmNvb1FrYVM0SSt2UlQvcC82?=
 =?utf-8?B?b0FqNUlkTlduSk5nd1c5bXp2ZU5LSnRkMGk4aVFDeWpwVTNLVG0rL1RzZE5y?=
 =?utf-8?B?K0E1NEVWM0h2OU51ejFLT2hQT1ppQkI5MDRVdUpBM2FEdWF4ZUJTS2JvdnU1?=
 =?utf-8?B?Z0lJV1YzcW1EbEY5cUxQenExSmk4eTcxSkkzcmJ4VG01QmtrdUZRTk1Uekcx?=
 =?utf-8?B?K2R2Z3BXN2hvelNUb2NqeVhERVlCdHVUdFB2M2hVOVo1N3AvUmYrQzMycWRz?=
 =?utf-8?B?L0pnWDB0cmhmMmllUGFtNlQvck5zYTdKY0ExUTRFclpMaE5ocTJYdmdRZGdl?=
 =?utf-8?B?QUp3TUJ6NWNQM3dKRGtwcCtHYkNEUis1cm1oME9uME5VOFBtUWZRVnp5MTFC?=
 =?utf-8?B?bGFvaFp4QWs5QVBrUmtMTUJsOGUwMStUQWZPRlNMdU9NVis2b0ZDVUhXOEp3?=
 =?utf-8?B?MFhLYlQ5dk5qNXNKd3NxT1laQWF6SWF6VzZzSmxZWGVDRlhrVTlCZFRFandu?=
 =?utf-8?B?NHlzb3c3MUxBbDZ2QVJJZVp3bjFwNlBSWVdyRFFZcUVGSTk0bWhGUnA3Ny80?=
 =?utf-8?B?c1hxbHErSWV2WVZyUVhnTGtyRHRpZ1l1T3RTN1BTelVPa3dJQ3AxUlhxRVlu?=
 =?utf-8?B?d21lSHhjYlBMb3NRNGcwZjJ1aHFXblR0N3VnQm40NXdnWmo1ZnhFNTVaOEF2?=
 =?utf-8?B?UWJLdVFUSlh1VHNSYmRaWDMvT2Qxdzdvc3NpbGREMjNVVG9MVlRndG1oaWUy?=
 =?utf-8?B?K0Q1WjdIak9iVWo0dXd2aTU0ckNtNGhDMnVFMGZsYVNaRStIUVFTWEd4SFVG?=
 =?utf-8?B?VXdCRlphOXVHbGVrVHFpQjFQc1IwZS9OLyttbis5MEVibUU3M1kwOHJCa0tS?=
 =?utf-8?B?Y05JY0xWT0J4NnRmbHM4dm5aZDJKYzF1a1h4VDA4V3QvUkpTNFpMN0pkMUQ5?=
 =?utf-8?B?TWJQanZvc29NbU1BYVdENTMyWnNrNFl4YnRnY244cURMT3JKQmdqUzkrZkFq?=
 =?utf-8?Q?Hx2JJo8pLUsbKGkrdwhKVaVjR1bU1Sjo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0kvMWhYZ0t2NWhQbkpXRjRLWmNxa1RyUzZIRUhSa0R2dUYzQjMrd2tXL0tT?=
 =?utf-8?B?ZmxlQ2NlTDRnNzNJd3NBQlhIamNINDBtcXc3Qzl5aWFIZzljNjRiZFV3L24r?=
 =?utf-8?B?NGtmT3JKdmhadEp3YmJJMWlURHRsbHdvbWVMQUdkTE9LaVJ6Rk1pT1Rid09V?=
 =?utf-8?B?b0pLNHhQelVjUnBUbFRMbE4zeDRJUmJTV01RSVROc01hUU9vWlRMUDBZZzVn?=
 =?utf-8?B?VFIvTGRhb1QzLzl4aUI5eTFreUdzNEVBTGtrSUE0bk5EcTU1THluM2duR0p4?=
 =?utf-8?B?R2k2ZHY4M011RlpEejFhM0VLc3dCY1NicWNya2l2VmhoaXI2dWExMktsMXpZ?=
 =?utf-8?B?dUc2TXM2M1RPS2VETWR6MWxjVUNHeTJJL09wUFJjeHF4TzlqREpYdXg5bWRs?=
 =?utf-8?B?aXVVOGhhRHNBcEtQRlNRUndjRitVZ3hLcmIrU0RkR3g5Vkc0QXc2N21sM2p2?=
 =?utf-8?B?cW5ObVVkblFEbXNYVXN4V2tUblVaNmRNYms4QVBrMkU1WXEzdjh2Z2JuOGF3?=
 =?utf-8?B?NUhKMEQvMVovcGtyaWl0ZkYxd25abTVtZEh4MWNsdWlIckpCdi9iTzRXS2Rz?=
 =?utf-8?B?Q09sZTNhVitTd29FRDhiekhBY0RqQkE2WVRzTzV0anJGU1hxQ0VmbFFKU2hJ?=
 =?utf-8?B?bm5mRVBrSEpLUkZrOGthdG1QcUhKS1FXNmlmMEMvR01wSGwzUTFaNHNXSU9p?=
 =?utf-8?B?SDZtNEVmY1YweXMvL2RSVHFJRGhiQnVhNXpXS3E0d2FIUHJoUzl5d1hDRjNI?=
 =?utf-8?B?eThaM0ZsNzNlR1V5L2FhNHNKb1ZCZ2VMVUtXRDJZOFQ4eHllOGlxc2RPQXk5?=
 =?utf-8?B?RFpwTTBWU2pKR0J4RnliNU1EaWU1U0lyNmtPd0w0T3luTzVvbngyVXB3amJJ?=
 =?utf-8?B?MG1VT2dqNUJTZHdpOEloMXFvaDZVQ2E4VkdnQ3pnakMwa3hicGx6Q3VGcGd3?=
 =?utf-8?B?YzBjc29MWEN2d0Qzb2xDYmRZYWlOM3N6Q2NTRFFtL0JmT1Z6b1o5L1o5Zmgy?=
 =?utf-8?B?TmNsSURMcXBPaEJwOTFSVStMMEY1cmVuWnhMcjd2NGZBVmU0T001cVBqVjVn?=
 =?utf-8?B?eWIyTDVEZWJFYzhUOURDTS9YNHVNWFZwOW1KU05nRUJDa3JRVllMMFlsam81?=
 =?utf-8?B?Mi9YM2JsYXYrc0V2WkdmZXVqSEdWcDVYYTV3dkVpaUNTaTExR2k0NGd1eHla?=
 =?utf-8?B?U1VRaWlmb1Z5MnVFUE9kRmsvTkZ6N0lpWCtlL2VWb3Y4OGNlTVlZaVBKRjZt?=
 =?utf-8?B?TWtJaUpTaVB3dFJaRkd1UjB4UktKUjlMaG5XcXp1YlQ3akxXeURORE1WSVR3?=
 =?utf-8?B?eGFGY0QwOTBmWHV4Smx6ZmhHRkdtcmtYY0xRRUxGTEJwc1MwV2VZTVcwQVRP?=
 =?utf-8?B?M21veU41b256WWNmVWUzUmFDN001cEFyQjlpQ3lhVVdMK2R5UnZ2UDQ0R0lH?=
 =?utf-8?B?MGYxcXNQLy9aeGZJV0Z3N085Z3VydEZLNmVOTzF1elpXUVZSWlBnNE04L3Qy?=
 =?utf-8?B?R09ZaU9DVXVXcTFPRWJXTU1xb0p6TXRGT0cvQlV4d0VSTGNVZU9DZ1VSV29m?=
 =?utf-8?B?Tis5Rmc4WlpnekdmZ1A0RWpmeVVyMW1pZjIyUUgxTlZDL2d6TElTVHpqdk5i?=
 =?utf-8?B?YWNkQ1R5TmgwQzZyYkx0UTZseWhBYzJIRFU3ejB6NTB2TjdUaTNWdkI0VHZl?=
 =?utf-8?B?dzdWamMvU2tXUFE1cmV6WGp5WDE3bE1ucDcvWHE2bWRUUUh3Rmp4R1ZvSFJj?=
 =?utf-8?B?blhMZEcvUlhvMEJpVWY3ZEpZejZPNkdkaFJ2S1h6UlBZcy9UWWEya25ic0J6?=
 =?utf-8?B?eEE5K2ZlKzd2Y2ZLQzNFek9mYXdvcVV2THd3d1Z0cEhFWjRyYXdmVDJWaDk5?=
 =?utf-8?B?TDM3THNIdG1lWFBScmFmNm9DTC92SC9oM29CTGgraE9vT2tqcWlVUDlMRWdi?=
 =?utf-8?B?MkRncGp6RnRqTlIxSnhkQzh5UXk4UHdiZmNrdjBHeEd5Z0dRdERQUTlQempU?=
 =?utf-8?B?S3VyMWtjN05IUUw5M0k3aS9Cck1ENTlERVF5UnVib1J5VFFMY3RxVk9YV2tW?=
 =?utf-8?B?YXhCU20yYXFsZ3pSNjEzdEVlcXlGc05rbVhBUFhBbk9PU212RWczNi9nTlNm?=
 =?utf-8?B?bXR4aDN5SzRwK1hPOE9PUytyNG4vL0I5TzhST2VPbEhhZVR2NkpkM2pzcC9H?=
 =?utf-8?B?RUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fe50ef-9500-4e23-0ad9-08dd3fa1ae3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 13:43:00.2001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qOf5k2dsDc2o3WHkdwAH9iLR5u2/N9sUf+c3wDyUATSDup7TR9NfBufFhgryB+8xAEWtEpcV+wRlzw1zYnw1tfDSdYLUfj/FdS4JHOHIydM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9905

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxMzozMg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDQvN10gbW1jOiByZW5lc2FzX3NkaGk6IEFkZCBzdXBwb3J0IGZvciBSWi9HM0UgU29DDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gU3VuLCAyNiBKYW4gMjAyNSBhdCAxNDo0NiwgQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBUaGUgU0RISS9lTU1D
IElQcyBpbiB0aGUgUlovRzNFIFNvQyBhcmUgc2ltaWxhciB0byB0aG9zZSBpbiBSLUNhciBHZW4z
Lg0KPiA+IEhvd2V2ZXIsIHRoZSBSWi9HM0UgU0QwIGNoYW5uZWwgaGFzIFZvbHRhZ2UgbGV2ZWwg
Y29udHJvbCBhbmQgUFdFTiBwaW4NCj4gPiBzdXBwb3J0IHZpYSBTRF9TVEFUVVMgcmVnaXN0ZXIu
DQo+ID4NCj4gPiBpbnRlcm5hbCByZWd1bGF0b3Igc3VwcG9ydCBpcyBhZGRlZCB0byBjb250cm9s
IHRoZSB2b2x0YWdlIGxldmVscyBvZg0KPiA+IHRoZSBTRCBwaW5zIHZpYSBzZF9pb3ZzL3NkX3B3
ZW4gYml0cyBpbiBTRF9TVEFUVVMgcmVnaXN0ZXIgYnkNCj4gPiBwb3B1bGF0aW5nIHZxbW1jLXJl
Z3VsYXRvciBjaGlsZCBub2RlLg0KPiA+DQo+ID4gU0QxIGFuZCBTRDIgY2hhbm5lbHMgaGF2ZSBn
cGlvIHJlZ3VsYXRvciBzdXBwb3J0IGFuZCBpbnRlcm5hbA0KPiA+IHJlZ3VsYXRvciBzdXBwb3J0
LiBTZWxlY3Rpb24gb2YgdGhlIHJlZ3VsYXRvciBpcyBiYXNlZCBvbiB0aGUgcmVndWxhdG9yIHBo
YW5kbGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBh
L2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
bW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPiANCj4gPiBAQCAtMTA1Myw2ICsxMTY1LDIz
IEBAIGludCByZW5lc2FzX3NkaGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwN
Cj4gPiAgICAgICAgIGlmIChyZXQpDQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gZWZyZWU7DQo+
ID4NCj4gPiArICAgICAgIHJjZmcub2Zfbm9kZSA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKGRldi0+
b2Zfbm9kZSwNCj4gPiArICJ2cW1tYy1yZWd1bGF0b3IiKTsNCj4gDQo+IElmIHRoaXMgbm9kZSBi
ZWNvbWVzIHJlcXVpcmVkIG9uIFJaL1YySCBhbmQgUlovRzNFLCBhbmQgY29udHJvbGxlZCB0aHJv
dWdoIHN0YXR1cywgeW91IGFsc28gbmVlZDoNCj4gDQo+ICAgICBpZiAoIW9mX2RldmljZV9pc19h
dmFpbGFibGUocmNmZy5vZl9ub2RlKSkgew0KPiAgICAgICAgICAgICBvZl9ub2RlX3B1dChyY2Zn
Lm9mX25vZGUpOw0KPiAgICAgICAgICAgICByY2ZnLm9mX25vZGUgPSBOVUxMOw0KPiAgICAgfQ0K
DQpPSy4NCg0KPiANCj4gT3IgaW50cm9kdWNlIG9mX2dldF9hdmFpbGFibGVfY2hpbGRfYnlfbmFt
ZSgpLi4uDQoNCk9LLCB3aWxsIHNlbmQgYSBzZXBhcmF0ZSBwYXRjaCBmb3Igb3B0aW1pemluZyB0
aGUgYWJvdmUgMiBjYWxscy4NCg0KPiANCj4gPiArICAgICAgIGlmIChyY2ZnLm9mX25vZGUpIHsN
Cj4gPiArICAgICAgICAgICAgICAgcmNmZy5kcml2ZXJfZGF0YSA9IHByaXYtPmhvc3Q7DQo+ID4g
Kw0KPiA+ICsgICAgICAgICAgICAgICByZW5lc2FzX3NkaGlfdnFtbWNfcmVndWxhdG9yLm5hbWUg
PQ0KPiA+ICsgInNkaGktdnFtbWMtcmVndWxhdG9yIjsNCj4gDQo+IE5hbWUgY29uZmxpY3QgaW4g
Y2FzZSBvZiBtdWx0aXBsZSBpbnN0YW5jZXM/DQoNClRoaXMgcmVndWxhdG9yIG5hbWUgaXMgT3Zl
cnJpZGVuIGJ5IG9mX3JlZ3VsYXRvcigpIGFuZCBpdCB3aWxsIHBpY2sgdGhlIG5hbWUgZnJvbSB0
aGVyZS4NClNlZSBiZWxvdy4gQW0gSSBtaXNzaW5nIGFueXRoaW5nPw0KDQpyb290QHNtYXJjLXJ6
ZzNlOi9jaXAtdGVzdC1zY3JpcHRzIyBjYXQgL3N5cy9jbGFzcy9yZWd1bGF0b3IvcmVndWxhdG9y
LiovbmFtZQ0KcmVndWxhdG9yLWR1bW15DQpmaXhlZC0zLjNWDQpmaXhlZC0zLjNWDQpTREhJMSBW
Y2NRDQpTREhJMC1WUU1NQw0KU0RISTItVlFNTUMNClNESEkxLVZRTU1DDQoNCkNoZWVycywNCkJp
anUNCg==

