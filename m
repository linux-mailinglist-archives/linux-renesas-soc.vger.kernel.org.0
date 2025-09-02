Return-Path: <linux-renesas-soc+bounces-21198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F734B405A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1447B7AE37B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 13:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6232DF15B;
	Tue,  2 Sep 2025 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nmIXM+sp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF35299AB5;
	Tue,  2 Sep 2025 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821115; cv=fail; b=VtzpQGLyEO8V7sWjJnrQTzOur4b8XKhki/oxjUaqrzh1wRLrySGKbP311DWI0aRy0zBTJNx5MbBjiTcPUXiiYVvS0StY6KzmLmeUeKhojekwXjidUHeODBA+d/1+6G4OdR6WqlTT5vHIJMJmED/t2GsWm8bO8emys9EIVLpU5EI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821115; c=relaxed/simple;
	bh=QFiGp4Co+sKhx0vSb0XyMQt6uhDwCCybwvTC4thBCHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R1bZXH1gDfOpFXKrYlaAGq0F+Ouz7/RLGqKqYnai7JB18s2TzyxhMIpbl7y/AeaBCIBhhUWuyS7U4QWneMl2Wsh4HOCDqkOaccue56z+mSVQ/Rwqh26KhEb9ZIU2NtfQnZ+S/iSsG2C5CC0o4MQvftbPg9u0Xa75tpHgpFNQ8bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nmIXM+sp; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbvtt6wNZsZNsbj4cm4dP2QZd8AuQw5Py2cyxdGEyIhy2+Mjmo9TehEpg4d8g1nkpGT/j0NGzit9D2q6f8tatu1UKR4Yyt2u6E/s2Iib4Qur69G0XcpS2BHapU42H8oh5RTZFto1PQocjmrX1SninGtDCFGOSUp6TxYY4KP/WzbsDuDQIrVEx1w2WYrCzN+L8vUpH665bQg4xVvYw/rxRidiwqYTDhPYCJjNlErpcyd/FdxSkNwEaALY9sk1kqMCAm/QmnwZ447aeaynzrDXNu7NzDrzAYOYlyxNvrDkZ5OaVxnaiB3/HIYTjd5mAQh/kdQEliaZrRlXoVwbUHmDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5odN5Xl2OTcZL83JUpQH2Rcj5kBjgLjY8BYN1k+3d8U=;
 b=AM81xE0Z/dqGqPsKjrtzevYIjXPXDkEurXHcpa196FABujn6JcRpEX+HzOQhK5fCd305WmWEtDLL5agaPd3Py1H8RQ7dCKkLmpMa9biD7m1RT5yWd/xS+keqEHoqLVoHzrIwl/CGMtzBTb3thJXQ3PniKs1voIS/afOkHu0tRxnN8EHGtaC3mEia8F3FcAScjIZugKEdgXPi8lwh2741cgXXAj5IIywvLIL/NhJgP4guDNntZnCdcjdQ7csW/gbtLS67hWG36zqd4cWq+x+q6M9ClosFZd9UUiD0bUWD/S50MbKuecCdyGqEihMuh84v/NilMtdD3/DI9yFzK0zXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5odN5Xl2OTcZL83JUpQH2Rcj5kBjgLjY8BYN1k+3d8U=;
 b=nmIXM+sp14QkkiHI775iDMuDwRvk8k/S6+PNz8D6AonkwxPm9pV9eXv0PbCf8ngRJoN9t6ExTV0NX4A/sgE6TAyuqgpGpo4YbxQOD9zi7dsYL99Dh4zuhlDN+bOyXNbmaoDofnK1X+iIzGS0gH+sxgTq5VaLR/ZUq+uCq61Pd+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB10362.jpnprd01.prod.outlook.com (2603:1096:400:24a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 13:51:48 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 13:51:48 +0000
Date: Tue, 2 Sep 2025 15:51:34 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: renesas: rzg2l: Re-assert reset on deassert
 timeout
Message-ID: <aLb2Zh3ENS6B_ik4@tom-desktop>
References: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
 <20250820100428.233913-3-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdU_grYXJF_L77-6np9iiVGvo52Z7TXN=ft97BuPX2BGxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU_grYXJF_L77-6np9iiVGvo52Z7TXN=ft97BuPX2BGxQ@mail.gmail.com>
X-ClientProxiedBy: FR5P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::11) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB10362:EE_
X-MS-Office365-Filtering-Correlation-Id: c3dd4358-3754-4119-dc6e-08ddea27dc59
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0I3YVpVdUxLbWs5c2tiS0JwSnplSTdiQ01rckxVMTl3VUdWYkhHTmxPSDkz?=
 =?utf-8?B?MW1RSEY2MkpGSTJyZFlqKzB0R2ZuL0IyT1ZJT24vS3Zhc1o4ZTRscC9ZZDFH?=
 =?utf-8?B?dmhVL3Y4RU13cjZzWXAyODF0bDMvdzlkVEliSWp3Rm0vU2hyYnE0SVR2SE94?=
 =?utf-8?B?aFo3dEN0ZU1qRGszZThhSyt6cmlRaVpSejExMzVDRDgvT1AxNDdESG45NVBm?=
 =?utf-8?B?T0l1d2xFaStjdk14dzlSbHpMQlUvbWNUQ09wM1JIbU5qQWQyTXRmWlczcURC?=
 =?utf-8?B?NlpwZXE0NUdhNG53cnRiajFiMWllNHRYSTF4QUxyOHBYTkVOSTA1RG0yZUJN?=
 =?utf-8?B?R0hUMlVFS28rY3p6WUwyVFU4UEdhV1BQMExqbk54UEpzcy83bWRXL1FIbjhz?=
 =?utf-8?B?KzRkbUJSN0VOVTgrOWRXRHpIWDByUWFDUXh0eXUxODNjT2N4OTBLa0dwVEhR?=
 =?utf-8?B?c01qd1lpM1BVdUdzK1IzTnoxWTlUcEhnUHNEOGZFMUxyMFZxUkVFYzV2VWln?=
 =?utf-8?B?M1Y2TDFmdGoyV3c5OXFpMmlIUHFEQ1RFbi9UM1JtcVhSaHUzR2pIV3dCY1Y2?=
 =?utf-8?B?ZGs4cVdJUy9ySE45eHNqZTdERFd5a1ZYUENyd2ZKWG03MW0vSFluK3lOYnU5?=
 =?utf-8?B?YmVuQlBvZFc4SkdPUmFzYytiY0E3d0tKZVdLMnhDVm9kQk1XMWlzMk9UNm1R?=
 =?utf-8?B?YS9YbmxxTlVCYmJleUJxVWpNOTF5T0J5c0FIdFpuSmJndmR1cmlJQ1dRWHV5?=
 =?utf-8?B?N2N4VFU1Tit5endEa3EwYklhMXJadE5lRnFDM3NhMnZaZjUyaWF4eCtHRDlk?=
 =?utf-8?B?aDY0TTFtM1kwcjNxSFVrOS9SK2lsWmR3c2JqUVhFN2szK3BoWEM1SnFadERR?=
 =?utf-8?B?SjVYZWo4enFOUDdiei9NL0hSQTlQZHFlZjZqNXF1ZnEwa3pNdlY4OVNXd284?=
 =?utf-8?B?SGJsa3RHQytjbTN0T1VIWjlvWHAzZkZtaUd1TkZYOUNyT2wza25DN05NVlZI?=
 =?utf-8?B?WTZyTjRZeW9ZTnMrUlRLMEZjZVRHU0dwdzJ5VTB6YWRTWEtxZVY3K3NIaTZo?=
 =?utf-8?B?bjlpNVZCSjBtU2R6QUxXSE9odjdPT1V5MSt5TjZXRVQ4N2QyQzBQaGxsVUNJ?=
 =?utf-8?B?b1liNzJHSU83RkN2Y1JCdUt0N1QzVjB5azFKQ0tzaWY3cWFKOUJFNjJmcExt?=
 =?utf-8?B?WkVldWtqZDRyNFBDMzQ1S09FN0NHY0hUTW9NSHhFdzNjWmVEdGFnUittWFBa?=
 =?utf-8?B?MDVhL3ZDZGs5YkhXMkkwZzRjbC9xeEVGTG9xeXEvS0tDV3NzRlAyTStQQk43?=
 =?utf-8?B?NTZwUGNXaEJUaXZxMk1NclhpV1c1S1MydlJuaUxNYjZiMENOQUl4dU1BSEtv?=
 =?utf-8?B?R3JnUkRJUDY2TE5CczVXSER3ZlNZZ1orUzEzd3dKaExTVjN6S28wbk0xUDN6?=
 =?utf-8?B?STNiTUYyWUYvdExnZmdZR0Y0cFhQQkFzVTR3YTA0R3dydENxNVlLK28rb3Yw?=
 =?utf-8?B?L0E3eUlPUEdLK01GUGxxdEpUMFQ4L2J3SHU1ODhqQ3hlbHVyeXlnWDBuY01R?=
 =?utf-8?B?dkdhY3l0Q2VGbXREeHQvSTRhcVRKczZSQ3BmVFBkNFRNWThxQ3J3YVZYUUk1?=
 =?utf-8?B?N1JXbEVOV1E0blJ0SlJEdFVRQ0Z3V21samVrSnBCVUtocURaRm1lbTluaUxL?=
 =?utf-8?B?dCtJai91MVNCTjdDajRZTnBERnRyZFpHV00yWjF2NHd6SUNEc0lvb0Q0eCt4?=
 =?utf-8?B?aFVEUHRsdkdNeDdtcTVRcS9zVXlzR2J2b3hNZWZBWXIzWVRlUWhJK2FFbi9L?=
 =?utf-8?B?Vi9Wck54VHJPbUtGU2gzZkFPLzhSWGluRmYwOURCVmtReC9UUVU3UG9QMktl?=
 =?utf-8?B?L1Njd2tzRFpnZTJhenFLOFdIRXFsVGxmU1orNzFTOCtwRkNPTDNvWEtuWFIy?=
 =?utf-8?B?cmVEUGt1bi95REIvSXlkY3J3TjN4dWF0ZERQTkx1aVplYk50dkJVaVpTUDhE?=
 =?utf-8?B?eDVkUjhSWXpRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU5lUGxYVEpFbFlvbTQrSXVqMEU3eTNkbFNMNDdIOFNtZnV1OE8vNFl3Yzdo?=
 =?utf-8?B?U2toc1dEc200VGhnZEVvSjc4NmdVamdEVXpJSFo3S2FVLzAzR0huR2dQZ2lm?=
 =?utf-8?B?cHVSWkNIaFlscFJBM1ZtUEJJSkJlMkYwS2RqM3JUd2lmT3JUSXlrSi9xQ3FE?=
 =?utf-8?B?Z3VEbmVNZVE1NmdWOEVla2M0WFlHS0xNUlZjbHozL0RSZmxpdnVRbEtHMkYv?=
 =?utf-8?B?eWpldmhleEthYW5FS0h1L3dXSkF0VGg0VE54b0RIOFdHZHdTSFE4d2VqeDF6?=
 =?utf-8?B?OVVhdE1wWXcrcWs4Sm1lKzBxUWVJdmdYR2NmeXk1K052NzhhSjFYQXd5VXEw?=
 =?utf-8?B?eURoRXpKei9hM3laZ2k2UG53Z250NnJkeWdhZVQ1RXVTZVpFRDBiZkFyYzZ3?=
 =?utf-8?B?QTBNQmVlYjliQ2d4VTJJVFIrOEdyclRqeEVKWEEwZktlSXlwaWoyTko1ZmhF?=
 =?utf-8?B?OGx0QzE4QlFLSVpWNzRkL04xV0lZVEZpbm90cGtuTFk4VmN1c1RvUlRDbzhq?=
 =?utf-8?B?TGg2QlNGMTlybVJHN0RtdzFVTlhSOTU1OEtSWEFWMWpQSUFyQVhWNG13alZo?=
 =?utf-8?B?dFFDYVNGeDhraDcyYUxMQzAwcmZkcXVDMlNmbE55Wmp3K2hZWW9ia3U3ODlK?=
 =?utf-8?B?T0hRWDh3OXhlM3pjdmw5T05xdmRJMGo5OWQ0dnpMVWhJMUdFREdNUTN2N0Jo?=
 =?utf-8?B?ZGF4RTFLY1h3QnpES3ZiRVluZk1BcWc4amZkRVh2UkJxL0ZyUGJBNThEcFY1?=
 =?utf-8?B?R1l6aWtiZHlnM2p5WEtYVm5zbTFrUTNGOEFSWWpKUHplcThFamxhcUpMSEJ1?=
 =?utf-8?B?dnVUcGxrdU1tbEVvdVY2c3dncy9meHJzWnNFakxIQXR4QTB2SFZ4TEhka0l2?=
 =?utf-8?B?OEF3Q1kzc24weDZHYzlibzZoMnFINlErMG1FYVk0U2lLT0hkQndVNFNMOHhk?=
 =?utf-8?B?eW16Z3BjQTF5TDFXSnFPaWtBbVJ5V1k0eERWdi85ck9kdUdtRFd4M1dxRnFE?=
 =?utf-8?B?YzhrV2ljZ1JKbzlMMWJFaU1uK3RRVDF5UU9RY1l2Z0t1YU42Q3dTOEJUdmRp?=
 =?utf-8?B?QjNxc2tZTi80bEZINjAyaTljWDJvVTJwTGM1UjByL2NaNEZKRXF0c08rRTJO?=
 =?utf-8?B?QXlYNFo1RnF3RVpXZGw4NEZ4ZUIzQzVBWTBvTEZzSVRzQ3J3OURnamZqMDR6?=
 =?utf-8?B?dmo0MzByZ1hsb0tsNlFJdTcwTHJkQ1p5RDhWTjdxRnpJY21NWTVDOS9pdnZr?=
 =?utf-8?B?Z01CcTJkTnhrbEplM1lzVGsrcnFxQWxBYm9OaENzS2NWZjArckdncTF4SkRX?=
 =?utf-8?B?bFpWeWVRNDVjWHVzUGxia25GVGhpQ2tYSWRUTFkya2NJRGFncGd6Rm9YcGRi?=
 =?utf-8?B?M2VrVDVOWm53M08vd1BOZG82YXBXVC9VT0Voamo0MkpETTBMNDA3aFh6Sm83?=
 =?utf-8?B?QlUrVlhvWG9qaWs2bTZHUlFKTENLcjZ6d2pFek11a3Z5SUc0M3UzaWhOQjNs?=
 =?utf-8?B?ZEx0eEJ1Z1VrelpnUEtBeDRDTXNvZ2R4dzlaRE9DemNTdWpLc2YrbUhrby9R?=
 =?utf-8?B?N0dhRTdIT2tWbjE4RGc4QSttMG9GbkhoV2xVbnlQcWpqb0ZtQk5uVjVhd0VU?=
 =?utf-8?B?ZDJ2KzNFdGx4NnZBMHlDeTFzZXhUL3cyQlM0YlBPVnZqTGFrOCtMUFNsM2o5?=
 =?utf-8?B?UEZ6Q09iQkQ4VlhWRDJLYytBdDNvZWdwTXRtZElwVFVYMDhSaG9BR2ZOTUJY?=
 =?utf-8?B?dFUrM3BQUEN1YkxFeUoyelc1VDhEQVdPNklwd3BOcEhSM0tRSjVFckZwNEVo?=
 =?utf-8?B?a2xvVHk5OUNUalVvME8rUFlwNEgyQXRWaVpxb2hjRmlLZnJFVGlCcFVqaktk?=
 =?utf-8?B?aUtWdDZnVTRzdC96czRKQ0FUejNrVlZ2TCtFNllnRCt3bHRnd0dycEVrcmh6?=
 =?utf-8?B?OUFQZngvdDlmQmhKcHpkYm1HMEtYNHFxK1hHRC9ZNTFpdWFmVURHM3RWK2JE?=
 =?utf-8?B?MmF5RWlKOFMrcDFmYlRZU0o5Lzd5QWNybkgxZUtOU1dFUTdZUDk4Z0ZTSVJ0?=
 =?utf-8?B?NW1DUnFDNFlXVHJuc2E0c2NVTmxUVkNGYjdNN2tXeWVzVHpCOU5VL0lBOWx0?=
 =?utf-8?B?VWR3V2o0cXZERGVxNzNvQXJ0K3grMENlREw1ZzN4WXhKV1FXa012a09FNGU3?=
 =?utf-8?Q?LPRBR4wmK+TpH1PBpEiL/ic=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dd4358-3754-4119-dc6e-08ddea27dc59
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 13:51:48.2135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HHplxFFlgvDp70acf5oalqUXhYcOQ0Ga4UxT1sAi3KPG1zRnHf7ZNmR0MSl1gZ+TW2hI/gD/Sd1m70zwMCeEosoNlXYLM7t3SH8J7TIRO4hP3OiWjZPyRBk5Xe8G7Dh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10362

Hi Geert,
Thank you for your review!

On Tue, Sep 02, 2025 at 02:18:17PM +0200, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Wed, 20 Aug 2025 at 12:05, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > Prevent issues during reset deassertion by re-asserting the reset if a
> > timeout occurs when trying to deassert. This ensures the reset line is in a
> > known state and improves reliability for hardware that may not immediately
> > clear the reset monitor bit.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > @@ -1667,9 +1667,16 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
> >                 return 0;
> >         }
> >
> > -       return readl_poll_timeout_atomic(priv->base + reg, value,
> > -                                        assert ? (value & mask) : !(value & mask),
> > -                                        10, 200);
> > +       ret = readl_poll_timeout_atomic(priv->base + reg, value,
> > +                                       assert ? (value & mask) : !(value & mask),
> > +                                       10, 200);
> > +       if (ret && !assert) {
> > +               dev_warn(rcdev->dev, "deassert timeout, re-asserting reset id %ld\n", id);
> > +               value = mask << 16;
> > +               writel(value, priv->base + CLK_RST_R(info->resets[id].off));
> > +       }
> 
> Is this an issue you've seen during actual use?
> Would it make sense to print warnings on assertion timeouts, too?

I haven’t observed any assertion timeout issues during actual use,
so maybe printing warnings on assertion may not be necessary.
What do you think?

Thanks & Regards,
Tommaso

> 
> > +
> > +       return ret;
> >  }
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

