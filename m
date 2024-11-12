Return-Path: <linux-renesas-soc+bounces-10460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE4F9C4C5A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 03:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D35111F20F6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 02:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8EE204950;
	Tue, 12 Nov 2024 02:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n5xMhPr7";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="YrrmS3VT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCFC19E96A;
	Tue, 12 Nov 2024 02:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731377719; cv=fail; b=kPes9LtOLNM/oF8xJ/F7SWCYajdR3wpqcP+sROyVYO4rhbIh9SrBbBrGa8YRNn1RWI+0+ffoJJQINutU2hS6kNzmGDMi2qh9Ng7BnbeJ48odQPXGEvFKjE4O9i5nBS55N/F+B16HNjyfjovmaAI/RBZeu7p2sxDthsk2DinRamY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731377719; c=relaxed/simple;
	bh=vbFKrDHuBO4s0p7qb8d94L4BfgUWpmrl11y98IGp5dM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hKEouU7y+WFJMS+UyfOAQfWEW4O3bSSmOeTVJq2WSUCw8feRNZDUIhegYviwB/AZg96AR+p88fWNns5PdHL+QiBHb4UKxFwZ6B1qQpVS99sy+UFnApGDxgOHzMaNjgwq2W4z7oPJ6r9+kYqLYeI9aSK3kbv5vboOF495hkeU+VI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=n5xMhPr7; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=YrrmS3VT; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: eecf6590a09b11efbd192953cf12861f-20241112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=vbFKrDHuBO4s0p7qb8d94L4BfgUWpmrl11y98IGp5dM=;
	b=n5xMhPr7Jy9KaCBF/33EjZHNatV+tevrBVfzDWSCPVps4U48ubm/J2cSsHbqnpFogx5a71SmnFAtGy1D9CEG/4I/rxX7KP3Ir5likQl+LPK0gViVZZYF25gGX/8VLM7QLUHnBicOobVA2cHRkILb3OLJy0leRFx+r9zlmHsV4dA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:2cfc0009-9bad-4c33-aac7-2efc4bcbfbda,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:d9eee3ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: eecf6590a09b11efbd192953cf12861f-20241112
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1646064396; Tue, 12 Nov 2024 10:15:05 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Nov 2024 18:15:04 -0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Nov 2024 10:15:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUwyZfZQZgkeOrUMLwKzWvzaxMJFmJ9RORF/CYgZqx+EiP3sm1pUtBrRcFvXYXr8pfGn1DNCvmmgywJB/HPASvdEutpgkskuDcC9Zm1w4AeuGaIBE53UhAj6gsTVmiJq2q5HFC23R/yOE1EihtLJ1M8uN6uYjV7jdBN0xi74qyfmpnpN5SiALtkL25EHJgzSek1Z4DMhgxjZCvV3bcWDATBjiBsI3OVEakxyPqhHrSWaZlq9a9yUoznADegMokIIk7SP2timAVXc43uS2J+YSoAHvOUIXp56LbjGTYURhHzJD0D6IT6Y5c7BxtKfkbMgI4jDv7OL5Z1M284E3qD9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbFKrDHuBO4s0p7qb8d94L4BfgUWpmrl11y98IGp5dM=;
 b=rUKdwcfQERHsZ+DJxg6unbp3oJ3e1A666e7RXofkD71RoEMu6qvGujh3XEzQv77bh4hxDy6u0hIsBwDXSkpoIojwKIww9q43HRfgWfACu5b+k1rSCnqE1n/lB50IV/dF7LKtD/MA0yfaWHQmGiI+AErPEvgRBW2rk30vHH7+S2HNDPmV9bKSeI+0uTzdnfIxu0QvTQZUrxlftJwTeiU7JINChhf7yrPkT/6HwE09fY0nI6QYMmcXSdqLGbriSG1yYlcJywQXpIp0tPlJvcKKTqyv2p6HXGm/5LrcU3anrg331SfR/nl5EgXB+j6KnlcRrsY7Kdvl1U9FShDPXN2juw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbFKrDHuBO4s0p7qb8d94L4BfgUWpmrl11y98IGp5dM=;
 b=YrrmS3VTKRoUm+oWi1B83yr1sZryWVO1CHCfTnkevqefe8uGpGndQL+nRUfTnNa5XLbrzAwUeRI85nS7Gt01NlPTDi5TfHYeNGGVjIHt+383uc3oYobl/xSIDXa7HAdaqagb1kQqDoojOWuRerLvPgog0HcqLfYg7B8rb/dqQy8=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SEYPR03MB6770.apcprd03.prod.outlook.com (2603:1096:101:8f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 02:15:01 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%3]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 02:15:01 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "linkinjeon@gmail.com" <linkinjeon@gmail.com>, "orsonzhai@gmail.com"
	<orsonzhai@gmail.com>, "baolin.wang@linux.alibaba.com"
	<baolin.wang@linux.alibaba.com>, "yoshihiro.shimoda.uh@renesas.com"
	<yoshihiro.shimoda.uh@renesas.com>, "mikebi@micron.com" <mikebi@micron.com>,
	"krzk@kernel.org" <krzk@kernel.org>, "lporzio@micron.com"
	<lporzio@micron.com>, "linux@weissschuh.net" <linux@weissschuh.net>,
	"beanhuo@micron.com" <beanhuo@micron.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "bvanassche@acm.org" <bvanassche@acm.org>,
	"zhang.lyra@gmail.com" <zhang.lyra@gmail.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "quic_asutoshd@quicinc.com"
	<quic_asutoshd@quicinc.com>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>, "chu.stanley@gmail.com"
	<chu.stanley@gmail.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "pedrom.sousa@synopsys.com"
	<pedrom.sousa@synopsys.com>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"santoshsy@gmail.com" <santoshsy@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/5] scsi: ufs: pltfrm: Disable runtime PM during removal
 of glue drivers
Thread-Topic: [PATCH 3/5] scsi: ufs: pltfrm: Disable runtime PM during removal
 of glue drivers
Thread-Index: AQHbNGIbstRiH3GENEq6yh+I2SaDTLKy6JUA
Date: Tue, 12 Nov 2024 02:15:01 +0000
Message-ID: <7c8a5b9fe2baa1e716754e7a577be2c7bf12c539.camel@mediatek.com>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-3-45ad8b62f02e@linaro.org>
In-Reply-To: <20241111-ufs_bug_fix-v1-3-45ad8b62f02e@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SEYPR03MB6770:EE_
x-ms-office365-filtering-correlation-id: 91571518-37f1-4882-816f-08dd02bfd06f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NWZoSFBOZ3MzZHY1V0tCMjRBbU0vZlN1NjBPYWpGVWFUZlZ6WVhmLzAzODZq?=
 =?utf-8?B?R2gxdGgxL1JxcDh4alMxbm9wTVZGOXVoaUR0TmV3THdVOVZnUm03a1BGUUJ5?=
 =?utf-8?B?MGc4RzFLZW1TWlNIMCtrRUVIaGFUdUtsL2IwdmFZR1Y3QnR2cDZzY29JUE9B?=
 =?utf-8?B?MlJVbHF1bHNmMVJTRWNqVDcvSnVqNCtPcG0zbWdWc0k2aXpxUnRuUGl4VmE5?=
 =?utf-8?B?QmJNTlBrWjN3NitMcStvMkVnYVE2ZU0yazZMdjkxa0JHMEJZc2tpTVMvQjJY?=
 =?utf-8?B?TC9qN3JTZ3JsRG9IS0FhTWNxbW1peHZWZEZrWEZaMklSMC9idEpkRzdIdWNZ?=
 =?utf-8?B?MmI0S2liRWdvWUI5dTlRSDk4MlRwanNjM0FWTFJLenBwMVBoNzhHQ1NDdVc5?=
 =?utf-8?B?WE1IckMzd1A0NEZqM2xzRG1qOUpLWUE2YjhETjg2TXhHOWt1ZERNNjJoNlBO?=
 =?utf-8?B?M05iTlNTQURzQ2hyU1BVUUZOZjk1czRiL3F2M0tJZVF0Y001Y0l3SUNST2cx?=
 =?utf-8?B?YnVxSDliL3RnR084elo4RTQyQUV1bENtYXRUb1hjaUhFMGRCYjkwZmphZHg3?=
 =?utf-8?B?bXBRNldLV3dHcXhQU2IxNm0zWDhja1RMdlNSWTVvTzFWZzgwSndyN2FoQ3dp?=
 =?utf-8?B?aTA0WDdSWUUrYXgwY1FHR0EyNVNubExoZThqbkJEYWwwamJINkdRbjVaWWpr?=
 =?utf-8?B?R2R2R3JERzFTTG5xMmxVWWN4bkdRWFJ1K2xLRW1jdERCWXV6eStHRVY3WjJ1?=
 =?utf-8?B?N1FZd1RCNnZXdVE4anJsOFJTZUUwa3RwWEFwaGtNVy95OUQ3TG9IVXJ0UHUw?=
 =?utf-8?B?cnF0WnBnWkhqNFZwZnZaYXVxQm1hVDh6RGQyNkFHQXovb0l5NUhEbFhDN3Q1?=
 =?utf-8?B?UU9FeTUxMnhraXF1V2JiMWJ0ak8ycVV6Y3p3OTRod3Y0QWFyUHZ3ZmhHL3Vy?=
 =?utf-8?B?VUhIVFpVRWJxQnJWZUtVNm9yNUZlVFNnakNpNkh5S0xxdExzaXJwdXM0QVE3?=
 =?utf-8?B?QUlONE5QczQ1VzZaOC9BR2VveXBoYXFKeVdqRHc1UVV2RHpQOUQ4MlordXhZ?=
 =?utf-8?B?MTVNTVNwVVZtNXZ0Qmo1QzFML21OT3l1OWZ4Q2ZmZzYzVU4wQ2JpQndieXpx?=
 =?utf-8?B?QUl2UFdLQkdDUnRtZllOUlJTUjIweWF4VUt1Zi9PQ0JCUWR1ZEtaS0lMZStC?=
 =?utf-8?B?aVNXQzEvLzhMdmhLakl1aHYwcmJ1TjZJcXJpZ3EzSWdmbkhaUGlXcTI2TUFp?=
 =?utf-8?B?SzlEUGVqdUtzY2xBOGZTV3k3cjJuNUJrYlIrYndRbHZoYzdqSHZmcWdCdVdP?=
 =?utf-8?B?Ymt4d1c0b1orTjdXakl3Mlg0dnlxRmlWZ1M0N3IwUlZjc1kvWm1PRHkrdVBr?=
 =?utf-8?B?Q2FiamwxR3BkcDVPZXNJZjdDNHA0cTNvNmFKeGhNaUEvOVdZeCt2ZW8yemor?=
 =?utf-8?B?b2lwSHlUbk9ZcE1lWGZveFlOeHNoZGdwUmNncU4wenJpVUVsTDRxTEE5bVV3?=
 =?utf-8?B?ZDE1STVEWkRMWjNvT0RXdW43SVdINTZ1TFIwNEpvK3F2Q2JuSlh0SVBVZkxq?=
 =?utf-8?B?MDVrVzhLY3EyL3FRZ0JXTVdXWEt5a2FFU3NDdlA1ejRhL2VVNE8rNGZqVG9y?=
 =?utf-8?B?OUVIQStsa1huZHZIc2ZyZHVwN2NHNDdmeEs0Wjl6TVlIY0RDN0xjUlNtdGR1?=
 =?utf-8?B?dDRLd2JpRGxzUWVhajJWWWhFYjNBUDRGa0x4dzNXNGhtL2lhWEw1RjlYNkFQ?=
 =?utf-8?B?UUt3QklkWndQMkhUS05UeDEwQTF3VUQveGo3NDQvbzYxcHJFY2RER2NOOGNz?=
 =?utf-8?B?cW5ENEpxMXRyY0hJMHZPUytxNnRreHBtc0IzQkJkUEZVcEVUSXVFb2NZVWFM?=
 =?utf-8?Q?3PF/59O+IazH/?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWRNWmVYWkJ2K1dVNUFCQTQ4Sm4rUEJ3U0NiWTNyUFR5RTRHYVF3S1ZwQVNK?=
 =?utf-8?B?UHo2eU1tdUNvUklIbG9lMFFtRmpzVDhQc1Jvem0xMnhXaTM0YndNNnR0anJC?=
 =?utf-8?B?bEwvblZ5OURxTjljSlpoN1I2aHhHWEZjek5iNmF4dGFZZXcxTUxoVWQxUlFR?=
 =?utf-8?B?NFhvMy9pcUpIT01HY0hGTVIzNUJEd3pwdWp1cWRWMDlSQlpsQzFDS2p5UHVj?=
 =?utf-8?B?NUU5Y0FRM0U2UFpHamdRS1BHTUJIQ25wSnpGM1B3ZHBacDFjNnJyOG5qZnhF?=
 =?utf-8?B?M0VBUStnVUJsWnB1QVQzbHZ2OWRyZ3UvdGpUdFVWK09tRU1YWGdldGRyc24x?=
 =?utf-8?B?YlI0UU5KQXppa0FGM3htUmxjd2lHd2V4ZDBwc0o2eVhMZmhOb0F0ZmMrQ25C?=
 =?utf-8?B?dWJkTWFHR0V2bkM5N3NQdDJ5cVl6UzJhRXBlNkJ5SGU1SVlIQ01CbDZzTnd5?=
 =?utf-8?B?aEtKVUxPcktMR21iTnRGb2ViRDlXK0tSenZqc1A3SXU2aEVSSUtUU1dxMnNM?=
 =?utf-8?B?b2N3bVRETzBHeXR4VzNmYmxjMmlPdmZjOHorcG5ScCttbGhQNlZ5R3ZmK2Vk?=
 =?utf-8?B?WGwzK0VyK0tra2FYSzg3ODFBb0JSYlRjaG42TGJFSkZLZnRsSDBja2lEZ0tx?=
 =?utf-8?B?dmtZRUhRR2hEd2YwNDQ4bXF3UW9XNjR5Z05BY2g2bDVRRzhxNWNDYjU2aEtl?=
 =?utf-8?B?dnFrUnZma0ZQU3hwd2wrWUxscDBGejU3TFhaRkI1SHB6VHdkZVIyMUg3MzAx?=
 =?utf-8?B?RDBjUkZMaUN3OGd3aVNOM2xVbEcyQTF4L2dGR2ZFWHJmU0x6OFUwR09zM1k1?=
 =?utf-8?B?R3A2Yks0TER6Zmo4RW9wYVp1bUlQZU8wUjNpL2IyblBoSktFUkd5NVVDWmtJ?=
 =?utf-8?B?UTFTczhDTjBha3NSNGpGRDN4bTkvNTVuczBEQm4vcHlCeEM4SGkxa0tKUHk0?=
 =?utf-8?B?RDh1WTRNbjdMYkVlK3JOSzVOMXpUUFg4ZEZPeVFvaXVJSmxEZERobTFSdUZh?=
 =?utf-8?B?KzJkcGRWcHBhcVRsSmlPWkNSbjV1YUszL05MRStFbUVWNnNocCtCa25hVUdF?=
 =?utf-8?B?ajBHL1MrSUtZREZLWW8xTmIyeWtXbCt0YzFHZWY5Y29xMkxSRGRmNDFMYlNw?=
 =?utf-8?B?dmpOZDd6cHE4QmFmSmMzenFqWVBLbnJWaE9yc01XcS9KTllMc0dFM3k2T2VG?=
 =?utf-8?B?TE1Za3VrWXNKMFRRRG5aemJ6ZDN5cU16VDRuUi9MbmkvWEVXYkRtc2FCaDZO?=
 =?utf-8?B?MTNQcEgrcGdtMmdzZDh5eFpHTlZqeVAzZFRaVWp6S0tGOS9oc3N1c1ZJYUU0?=
 =?utf-8?B?QkxOSnd1K2dxRVNtRGdMVHVyTjJWOFpiWnFySG9mZFFLbmJGMXFVL01QYXc2?=
 =?utf-8?B?NFI2YjVCWUtlMUttNkhURG1uMkhVWVIrYkt6c1dpWXNYUVhhMFhQTEZoQ0xq?=
 =?utf-8?B?eGYvQXZVZnpDYVVDb3J1QVk1Wkx4ZUlaTWV4WlMySG1nZUVjQVFscDQvTERs?=
 =?utf-8?B?KytKWGxHVFQrZDkvczJ3T25tcEFsSklTUzZnOUpoU1dFS2R2QUdMdy84di9R?=
 =?utf-8?B?WTlsWWNDMjNNV2NKSm1WdExVbE9sdU9VRlRoVThoa3MzeVpJWjJ3RFJrbVli?=
 =?utf-8?B?NnlpNDhjeWFZWWRJcDRyK3diaHgrUDFDbWRCTWpzMFQwZFNFRkFrbWtRNUwv?=
 =?utf-8?B?WHVDdjhyNnFSOTZ5MWRmd0h3QXdyT056U29tVG1JWDMvcmxIRFdNcmxKajdY?=
 =?utf-8?B?OWNBRGsrOFdOQVpYd0YvYktlRUMxQnB5WEhsUGkrTDhET0lxeVhlUzg2OE1E?=
 =?utf-8?B?OTJnZzVhRmtLWEhUUmFOTGlWY1JmZ0FDck92MCs1cUZKazdSWEYydEZrUEYv?=
 =?utf-8?B?MjdZRkRpSmhEREpFUTYzWVBNaGdKcm9YM2kzOVU1UUNITWs4MUM1ZmIxalYv?=
 =?utf-8?B?c2JTVlRsaWhMbDZaSnRZdVEwQ0s5SWJnMWx5R0JrK1Y3dW1zYTNwMi81cERz?=
 =?utf-8?B?VGRhdElXc2VkUDhhNnBvbGVJVHlJVFVIK216aS9yVWl5UFNNY1g5Tm5uOXZx?=
 =?utf-8?B?ZEFDS1VuSHRSaTlvYmZ5aDB5R2QxMGFGQzVSc2gzSW1sTTdNMGR1eVFzNUVw?=
 =?utf-8?B?ZjgybGNwSFFHbFdlMU9uUmtGd25BeFRpMTFNSms5SnFVczlGMW5oRVZXUVpP?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <262231A86BA9A04FA64280DC55821D41@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91571518-37f1-4882-816f-08dd02bfd06f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 02:15:01.4831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xoU3JMnsvn7keNK676whKeSkLMjxRwItMm+lN6zd75pCRjmljIdhbAo9QVj0+mJ8y2lqPth2p3Bk6hz0M6vcNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6770
X-MTK: N

T24gTW9uLCAyMDI0LTExLTExIGF0IDIzOjE4ICswNTMwLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0g
dmlhIEI0IFJlbGF5DQp3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQg
dGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBNYW5pdmFubmFuIFNh
ZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPg0KPiANCj4gV2hlbiB0
aGUgVUZTSENEIHBsYXRmb3JtIGdsdWUgZHJpdmVycyBhcmUgcmVtb3ZlZCwgcnVudGltZSBQTSBz
aG91bGQNCj4gYmUNCj4gZGlzYWJsZWQgdXNpbmcgcG1fcnVudGltZV9kaXNhYmxlKCkgdG8gYmFs
YW5jZSB0aGUgZW5hYmxlbWVudCBkb25lIGluDQo+IHVmc2hjZF9wbHRmcm1faW5pdCgpLiBUaGlz
IGlzIGFsc28gcmVwb3J0ZWQgYnkgUE0gY29yZSB3aGVuIHRoZSBnbHVlDQo+IGRyaXZlcg0KPiBp
cyByZW1vdmVkIGFuZCBpbnNlcnRlZCBhZ2FpbjoNCj4gDQo+IHVmc2hjZC1xY29tIDFkODQwMDAu
dWZzaGM6IFVuYmFsYW5jZWQgcG1fcnVudGltZV9lbmFibGUhDQo+IA0KPiBTbyBkaXNhYmxlIHJ1
bnRpbWUgUE0gdXNpbmcgYSBuZXcgaGVscGVyIEFQSSB1ZnNoY2RfcGx0ZnJtX3JlbW92ZSgpLA0K
PiB0aGF0DQo+IGFsc28gdGFrZXMgY2FyZSBvZiByZW1vdmluZyB1ZnNoY2QuIFRoaXMgaGVscGVy
IHNob3VsZCBiZSBjYWxsZWQNCj4gZHVyaW5nIHRoZQ0KPiByZW1vdmUoKSBzdGFnZSBvZiBnbHVl
IGRyaXZlcnMuDQo+IA0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIDMuMTINCj4gRml4
ZXM6IDYyNjk0NzM1Y2E5NSAoIltTQ1NJXSB1ZnM6IEFkZCBydW50aW1lIFBNIHN1cHBvcnQgZm9y
IFVGUyBob3N0DQo+IGNvbnRyb2xsZXIgZHJpdmVyIikNCj4gU2lnbmVkLW9mZi1ieTogTWFuaXZh
bm5hbiBTYWRoYXNpdmFtIDwNCj4gbWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+DQo+
IC0tLQ0KPiAgZHJpdmVycy91ZnMvaG9zdC9jZG5zLXBsdGZybS5jICAgICAgICB8ICA0ICstLS0N
Cj4gIGRyaXZlcnMvdWZzL2hvc3QvdGMtZHdjLWcyMTAtcGx0ZnJtLmMgfCAgNCArLS0tDQo+ICBk
cml2ZXJzL3Vmcy9ob3N0L3Vmcy1leHlub3MuYyAgICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMv
dWZzL2hvc3QvdWZzLWhpc2kuYyAgICAgICAgICAgfCAgNCArLS0tDQo+ICBkcml2ZXJzL3Vmcy9o
b3N0L3Vmcy1tZWRpYXRlay5jICAgICAgIHwgIDQgKy0tLQ0KPiAgZHJpdmVycy91ZnMvaG9zdC91
ZnMtcWNvbS5jICAgICAgICAgICB8ICAyICstDQo+ICBkcml2ZXJzL3Vmcy9ob3N0L3Vmcy1yZW5l
c2FzLmMgICAgICAgIHwgIDQgKy0tLQ0KPiAgZHJpdmVycy91ZnMvaG9zdC91ZnMtc3ByZC5jICAg
ICAgICAgICB8ICA0ICstLS0NCj4gIGRyaXZlcnMvdWZzL2hvc3QvdWZzaGNkLXBsdGZybS5jICAg
ICAgfCAxMyArKysrKysrKysrKysrDQo+ICBkcml2ZXJzL3Vmcy9ob3N0L3Vmc2hjZC1wbHRmcm0u
aCAgICAgIHwgIDEgKw0KPiAgMTAgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMjAg
ZGVsZXRpb25zKC0pDQo+IA0KPiANCg0KUmV2aWV3ZWQtYnk6IFBldGVyIFdhbmcgPHBldGVyLndh
bmdAbWVkaWF0ZWsuY29tPg0KDQo=

