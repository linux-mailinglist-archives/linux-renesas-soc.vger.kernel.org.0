Return-Path: <linux-renesas-soc+bounces-15218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6826A76D8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 21:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CED41188B51B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 19:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBE740BF5;
	Mon, 31 Mar 2025 19:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HKjh0Ftz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290BF214A90
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 19:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743450146; cv=fail; b=LcoPWOad8vjSELqF085GBMgG/xTwURon/CmoaokYqvVNJQcAZ63R6ppXmqD/BN2yJdV84F9bGZDMsyna+B56EeaOttpnzW+vKmeDpw/eDAboUA+LPfTbliu0KZ8F+7urbbJwinxQ1zuE0sFyu1owht3K/1xZgx/jJC/3hbmrJ7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743450146; c=relaxed/simple;
	bh=+KdSILGHI+RuHhJD25ZdpBcIbDt03tRZG4/DP0+YzOI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vr1OTede0j7DvjeE4HDUDSuxWtTzgR9wikndHykNpDIKS9pDA1X5fgVlnHI1OqRvKkPxOEl3mV5SbhoKIavTZlxuhi+o3x+NA+2dfEn+f6kYj6CkzKKoe3H7l0MCFxHCp6c5tWywkohJ5kkM1R7BGkWBui9Zr6TAuk7c8iGmhts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HKjh0Ftz; arc=fail smtp.client-ip=52.101.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mX2EeA2I4SZm1fztb/r+/tO+5fQrOn9DDtnB0NJxRupxNV+X7MZYKRx+EUOZiQzrKaFZJtTmdqBAQigDzhuxDPzOVwObzs3D2npX+xQojM1nYFst/4JU1qakLyj9q6jOzTi7u9VGNNH1CMeb50WPHbVtsCtEvEhukMWeT3FJSS/0FjXQbm1MSGJuzqAckLX2p2gkrwEgZ43Jf1lkPOUPozzvCOnRKFt6ZNCHt7tq3bR2HzIqq9D0+M+pSUF8pj5p+4pC44QDz0zjPrGPdJUWy6lXCWaBltLOSybHGeOFaNmOWmyt4DD0G3O63nanNDhF7Povlc6oZ/Lj/+BiW83hfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KdSILGHI+RuHhJD25ZdpBcIbDt03tRZG4/DP0+YzOI=;
 b=uxsd0jMZhsJ0wSvWG22Gio44Au0xo5Exnj9gG+AJ3eNCEDxtQgBW9tBNMJTbOaCfpMdi25dxCfE5M6qmhvX7W5xWn9QOxHqhdnE+ET6GM7OnpRz2Er5JbKXypRtXFoMf+LMLd/MZM+8UoEZZRyywOqWe3hZj0qbczk/QP5pz//nQ/KOR6pVCk+yhpC0boSK7L/txHp3bPraqzHNT1bzEqkMBcZw/kw8z9IjYAcvnULlu0WUyyntrPVbMqTo97DvBECm1HaeKde92P6tiejEUBjRz2e6f8zikot8MRYvMQWxpIcCgTZ3vtdcQIbx1sta5Wk2ej9gZp7pR349TLABT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KdSILGHI+RuHhJD25ZdpBcIbDt03tRZG4/DP0+YzOI=;
 b=HKjh0Ftz3+bRQ9RZsgfLTMwOL0vQrjtq2tJRbovgSewqegjTAwM2IjJ9pPB0snMQy3MhQW1oubWs0WQD1QRcZIibe/Ct7KQ2tOlolWxsaRs5jx2EDg5zSR9T66yBSVdWWqLWVP8n2Kq96MlqJ7qz4wai10x6ZqEubayvrO93IxU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB15939.jpnprd01.prod.outlook.com (2603:1096:405:2c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.26; Mon, 31 Mar
 2025 19:42:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 19:42:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 8/9] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Thread-Topic: [PATCH v3 8/9] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Thread-Index: AQHbknnjlk4CE0EA1Ee1CE6yOgx2drONUlkAgAByeNA=
Date: Mon, 31 Mar 2025 19:42:21 +0000
Message-ID:
 <TY3PR01MB11346385F5F9D3D471144DC2986AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-9-biju.das.jz@bp.renesas.com>
 <CAMuHMdUfB5ctpojfFF=vDWmCQRX8k+L0GEkQXP8osE=CEsdUYQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUfB5ctpojfFF=vDWmCQRX8k+L0GEkQXP8osE=CEsdUYQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB15939:EE_
x-ms-office365-filtering-correlation-id: 0e7fa161-8dd9-47f1-aea2-08dd708c2786
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cnlVLy9oMnpCYkVPUGlhYnJSc3dQaUZsWGI0dVRkTnN2b2tacTJVYVM1b2gz?=
 =?utf-8?B?TlAwS0xJVnc4QVN0TC9xOHVRc0hZelhlaXpxTGFtS0NtS05vOVVIUWtRK3p1?=
 =?utf-8?B?OEJPRFN0V2Z5VktCaE8wdDBJMDFXOXFkTUJhdjJzcFlIc0l3RXhoT0NUc2sv?=
 =?utf-8?B?V0JxRDB6T0xqMi9UWFRZOU50VjlIenJRemMyczJacjAyNkVqajljckVOcW1R?=
 =?utf-8?B?ZXVTL0szRVVoaVhZV05jclBEdkFuczRpd253RWNEenhiREpUaHlzZ0IrMWVu?=
 =?utf-8?B?YnE1MmR6ME9nRXVDajNQZzg4SS9HQ096TnNPZDQxeThsNVVJQ3FLMWxnU0VS?=
 =?utf-8?B?a2hPYWkyczhXNWdSbWRXdTY1cmpSS1Y2V3ZzU3g3eVc1cjZJVTh1SXVsMWtn?=
 =?utf-8?B?VTA2MGk2djJGcjRmakN0VHhnd05DRGVqdzMvWklwMzdaOUV1alhJOTdqNkpT?=
 =?utf-8?B?QWFWUHdKZmRlV2R2TnpzUXJjdWxTL25YdHU3T2JpYVNJNUNZTHFQd2U5Y1Zi?=
 =?utf-8?B?Q1FKQnJQeThxWk5TVkFIQzFUZnN5QkxEOXFLOUZMVXVmd0VMdXEzVlRQUHhh?=
 =?utf-8?B?WGMzVTdHcGFVTHhKTTRGL2RkcHFhcHJoTVI2RG1PYVpvalVBdzF2U3NWOGI0?=
 =?utf-8?B?bWlLY3E4eFZuTDIwTDFUMW9KTUJPUnRZRG9oYXd6SVo5ZndVb212amI1Yld4?=
 =?utf-8?B?dGt0eGl1VlJtQVM1NFpwTmJLNThRZTRXdUFHMStjYkJ2OUlaODNnbUppZ1lD?=
 =?utf-8?B?T1l1NmJOdzYwV1pseUIwUDd5SERxcVBnNllkMWtSM0U2NnFWNFZGVFR6QU4y?=
 =?utf-8?B?VTBRQWN6TUdLeHpzREQyVWcwR0lVTkRXblk2OXV1MVNtTjU2VEV3U1Z4M2Jo?=
 =?utf-8?B?eU9WR09vWVNIdjhscXhnS3VkZGx5ZmdrY28xSGVtZm84c0h3ZzZJVldYczJP?=
 =?utf-8?B?U1VsSUFkeFdyVDBjbng3elorVFU5UVB5UkpQcmFIaUh2QVhDdDloRitxTTVS?=
 =?utf-8?B?RS9ySkh2aWR4UVpicG9TSFBETlh1M3d2VVNEMzdjWHZFQmdQYUZZU3VvUXJW?=
 =?utf-8?B?bTVsUytpWHpTQTZib3N5aTlHYWI0d2t3anJzMWt5QXdHaFdGbHJNbXRnV0Uw?=
 =?utf-8?B?QldzUkZnSzhENU5Yc1pCdVZLVnRoZS96WE9KVVQ2V3c5aXJsL0FicFBKTmZK?=
 =?utf-8?B?WG9INU1iRjJXLzVXT0hXMGpJVVkra1llb3dLUndLOFNvU2MrQ2ZXc216Tnoy?=
 =?utf-8?B?dXFIOGFoU096ejVQZzBOTGtseWVvbDQrektwcWNlWjMxamFRRWtIOXNNdkx1?=
 =?utf-8?B?L2lNNEZUS0lqS2U2eEhBR1dIcWVuTlVxbUM3cEpCTklzOXdTQjRhZEloRHNK?=
 =?utf-8?B?a3pKeHpzNzJiRGFxU2Ftc3NYS2pwU2ExdmtOb1BjZG92NEUvSHhoRmFpYytL?=
 =?utf-8?B?N2FMdFJYVTVxZG9NS0puNC9oS1hjbHQ2dncreGIvejBhQkpWaFJoY0xrZFhP?=
 =?utf-8?B?TXJsZitTOE5kcmdydWN0TmV1RXgweTZ1QUZyYWdYRnhlZnFzcTBPaDNBT2Ez?=
 =?utf-8?B?anhCRFlsMTV6c0RiOXZhLzNOU09BRTNMQmFLd0VDMXEzMDBvbjNPbVBuVFgz?=
 =?utf-8?B?Q1BxcmJEZHluMzZ1bWRwK2lSbldaakRVVkkwZmJ2VlpSeWJ3SXplM2lQWUI1?=
 =?utf-8?B?S0JmMGsycUpTS1BYN2dveEwxcnl3elBTdEpwZVJ0R2YzWTRnRzYydnJaRUhk?=
 =?utf-8?B?ZnpHSUJZbzRTSnR3SzUvVUZvbEh3SlhvRDhaRlVKVnpOQ2NoR0JDSVhWek1q?=
 =?utf-8?B?WjczODB3TVFvN2hFUEJ2d2w2bS9iOGJ1cDhmRk5WS011SFI0RzRXK3JXUkky?=
 =?utf-8?B?a1k1dkpjL0Z0SnVJR0xkNEZ2TmFEZnZxc3FHazBJZm5kTkFDL1dwWlJFWDI0?=
 =?utf-8?Q?ahhRXoltliEFOBerEPEVHnqER36x5C4+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWhZUXFyRHJBR2Uxc3hpSkN5dG1IaGpRemlHckl5VGFoQTg3RFlIbE9CemF2?=
 =?utf-8?B?SXR5S0RQdlBxbGpZR2xUUDVzSGxSQ0RXVmJSY2c0b1dOMUxjRlNpNmNhcmdM?=
 =?utf-8?B?QjVVMS85SHlzMTFtZGhHbUJxanZuQlJVYVBKZnc4UVdNd0pNcXFLcHBBbVo5?=
 =?utf-8?B?UVNFNmtoeWZoZE5EUE1VbWtVYVdjV2V2R2Q1a2NFeXo1cmM3eFpyQmZ3dFZk?=
 =?utf-8?B?QWszM0hnM2kwQS9YMEtIZXFpSVBQMkUzbUJudm1iM3oweittQXFKYno4WVMr?=
 =?utf-8?B?TnZXQmlNME95bTA4ajZJVllaUSswZWNKS2Z2OXlFeEJQOU1id2o1emR2Qk1N?=
 =?utf-8?B?a21HQ2p4OGpjYTBsMlpZN01MYUNkNU56NHg4eml5OFBKZ05MdXZPbDczdDBO?=
 =?utf-8?B?bUw3dk1RbVIyTmlBWE9VN25JcVIxaWljVFpLN1JERW9leEFnZm5xMkNFd2N0?=
 =?utf-8?B?Z1pZaWVRMktEVWF2U200WHpTQUp1Nk5YaHV3M2VZTXJ6MHgxaFlaK0owT3NX?=
 =?utf-8?B?NVJ0QXFtcHduR01qRkFrUzZQaXN3YkR4djZFb012YmhRbDBham1XRUttUlpY?=
 =?utf-8?B?d21xVE5oZVZJRHlSRExJSUc3MGo0NlFudDdaOUVBUkJMTDdHWDJFSTQzYzdL?=
 =?utf-8?B?bTQra2NiZk5vdDFrR2MxYzFoWFgrUHBadkRtaUFJZm5LY0dWcUFHVlVpdkNX?=
 =?utf-8?B?RlJqQ2tRR0lxdm1UdFJ1VUlpZTRpMWdRYm9ROEJsRElrVmZBeVpLS3NiRXJY?=
 =?utf-8?B?QlBuVVk0UmRJQ203VCt3Vzl4RVNrV25uY2NrSzE0WUJFN3dzUEdldFNva1Nm?=
 =?utf-8?B?YlVUR0FDNUhMYTBMS25yaDVnYkhuRjQyMFlMcFVaQ0tocnFqTzk2NStVZndy?=
 =?utf-8?B?Nzl4bU9mbHBEYU5MeXNXT3BGUTlZTk9lUm44cXVMM01kZmNQb0RrVjRGWXp0?=
 =?utf-8?B?cFY3Q3BOQm9sS2tDaUJlTDhnS2NhK0pZcFh3SG5iMjJDbTdaa3VISy9KL05N?=
 =?utf-8?B?RDNENlE4dU5OZU55VkdaOXFmSEp6Y2lSSUY4SCtEUzJsKzdXRCtVb2xuVVJk?=
 =?utf-8?B?YWpLcjNXd2VsRFE0SWFiRXlKQ0YzZzgrS0RRQmUzTXhqSldpZnNYL2d5NXdC?=
 =?utf-8?B?WmlBa0NQdXlrVzdJaXArVGJmQVozU0xZL1J5VnlOVDVLQXZRL0Ezb3B1L0R1?=
 =?utf-8?B?TTNjUHl4STdTd1JDQXlXcng4dGdxUmV3QzJkN0FoUjBFb2FibVcwRzRyREx6?=
 =?utf-8?B?bW84aVV0QlpLOVMzU3BycGVZTXNFTjAzYWdUOTRVaUdGMTUwZ3V5cW80eVQz?=
 =?utf-8?B?OHJyQzBMVEFZc09Vcm50bm5BbmdldU9mUEdMa2pxaFpmaktRWFk1SldSNTMv?=
 =?utf-8?B?dVdadFhSRmNGR1lWcE01akJHenBDQlVJZHZSZWNaU1pMaVdoek4yWTFTR3My?=
 =?utf-8?B?VGVCbzBSZm1rQUd0Z3dWc0c4YkNOUk9OLzFxL1NkbDVMTmV4K0xwRGRKRUJo?=
 =?utf-8?B?S1Vwb09MNG1OdHlJcXFaSkhHb2JTTVd4cFFUM1EyU1NFenl1T2pYUkJESHVO?=
 =?utf-8?B?YUx4RUVKNFRQTGsvWHE3WmF4b1hVN2dBdU11ZkgvazlWL0ZWTUpWZDhFSlJP?=
 =?utf-8?B?SUNiZ2dJb21XSkdFVUU1UEhaVVorVzVuci92M05LWDhCU0trYmYxQSswM0or?=
 =?utf-8?B?cXJHSkdGNm9wRy9LdE5GbnFmbzFPNHFCMUIzMHdVQ2ZrSDU1RFdnVk1LaDhC?=
 =?utf-8?B?b1U3TFo2WnoyWkVYNFZudDJ3Ni91UFo4ekVWV1c4Z1pmeGhOd2dod3NjMWFS?=
 =?utf-8?B?SXlpcFgxdCs0ZzNCZndYSGlXQWNRbEI5cEg0MjRjeGxHMXlnTzBFU0NsME90?=
 =?utf-8?B?UmFqWTF4bXFORFVIVWYvVVBHVFJwcWNnd3dWU3BYemI1K011ZHJ6d3pzUE1z?=
 =?utf-8?B?ZDlQM3UwRVFVVmFiWC9DTkVUdTJJNXVRdWlVVmwvVENBSCswM0N1bU5zZStQ?=
 =?utf-8?B?b05rUHpueFVweXRKZnY2S0NGR1YrYVU5ZVFIQXZ1d3JYYVREK1lEeUlqRDhP?=
 =?utf-8?B?Tmw4ZE1SVmhCTTdvc01rUG1uVVFHVExjcUZzcnU4MUkyeTFQYzc5WFpqakc0?=
 =?utf-8?B?YWNmb1BtNEVRQTdwZ0tTR0JFaCtvMWR5ZkVmNFl3T1VOcFpkWXNMSWJBaWtJ?=
 =?utf-8?B?RFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7fa161-8dd9-47f1-aea2-08dd708c2786
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 19:42:21.7067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oki4x97gZgYg3wRWuUVenhouBjElGtTOo74DnI2jrWdKaaJ6xpS6ZbcA3vfELz4FujG1RgRZw32RMW+SM2llSTiyzMVqLkS+Kh9a/5cC4iQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15939

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDMxIE1hcmNoIDIwMjUgMTM6NTINCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyA4LzldIG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IEFkZCBSWi9HM0UgeFNQSSBzdXBwb3J0
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCAxMSBNYXIgMjAyNSBhdCAxMjozNiwgQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgc3VwcG9y
dCBmb3IgUlovRzNFIHhTUEkuIENvbXBhcmVkIHRvIFJQQy1JRiwgaXQgY2FuIHN1cHBvcnQgd3Jp
dGVzDQo+ID4gb24gbWVtb3J5LW1hcHBlZCBhcmVhLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL21lbW9yeS9yZW5lc2FzLXJwYy1pZi5j
DQo+ID4gKysrIGIvZHJpdmVycy9tZW1vcnkvcmVuZXNhcy1ycGMtaWYuYw0KPiA+IEBAIC00OSw2
ICs1OSw4IEBAIHN0cnVjdCBycGNpZl9wcml2IHsNCj4gPiAgICAgICAgIGVudW0gcnBjaWZfZGF0
YV9kaXIgZGlyOw0KPiA+ICAgICAgICAgdTggYnVzX3NpemU7DQo+ID4gICAgICAgICB1OCB4ZmVy
X3NpemU7DQo+ID4gKyAgICAgICB1OCBhZGRyX25ieXRlczsNCj4gDQo+IFBsZWFzZSBhZGQgYSBj
b21tZW50LCBhcyB0aGlzIGlzIHVzZWQgb25seSBvbiB4U1BJLCBqdXN0IGxpa2UgdGhlIG1lbWJl
ciBiZWxvdy4NCk9LLg0KPiANCj4gPiArICAgICAgIHUzMiBwcm90bzsgICAgICAgICAgICAgIC8q
IFNwZWNpZmllZCBmb3IgeFNQSSAqLw0KPiA+ICAgICAgICAgdm9pZCAqYnVmZmVyOw0KPiA+ICAg
ICAgICAgdTMyIHhmZXJsZW47DQo+ID4gICAgICAgICB1MzIgc21jcjsNCj4gDQo+ID4gQEAgLTI0
MCw3ICszMDcsMTAgQEAgaW50IHJwY2lmX2h3X2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBib29s
IGh5cGVyZmxhc2gpDQo+ID4gICAgICAgICBpZiAocmV0KQ0KPiA+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gcmV0Ow0KPiA+DQo+ID4gLSAgICAgICByZXQgPSBycGNpZl9od19pbml0X2hlbHBlcihy
cGMsIGh5cGVyZmxhc2gpOw0KPiA+ICsgICAgICAgaWYgKHJwYy0+aW5mby0+dHlwZSA9PSBYU1BJ
X1JaX0czRSkNCj4gPiArICAgICAgICAgICAgICAgcmV0ID0geHNwaV9od19pbml0KHJwYyk7DQo+
ID4gKyAgICAgICBlbHNlDQo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IHJwY2lmX2h3X2luaXRf
aGVscGVyKHJwYywgaHlwZXJmbGFzaCk7DQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGNsZWFu
ZXIgaWYgeW91IHdvdWxkIGNhbGwgYWxsIGFjdHVhbCBpbXBsZW1lbnRhdGlvbnMgdGhyb3VnaCBh
IGZ1bmN0aW9uIHBvaW50ZXINCj4gdGFibGUgaW4gcnBjaWZfaW5mby4NCg0KQWdyZWVkLCB3aWxs
IGZpeCB0aGlzIGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=

