Return-Path: <linux-renesas-soc+bounces-10462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 586309C4C7D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 03:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6E051F2782F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 02:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB935204927;
	Tue, 12 Nov 2024 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eAcPzMFx";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="VBtzpfTD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B3319E96A;
	Tue, 12 Nov 2024 02:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731378016; cv=fail; b=PwyA/mnpq51xjL6yIkjAW5ir+BlKhw9hwSYeADZrdc3XDb5c+tLNeOsaWIUSBX1DfTPGPJjMUibQax5qb5qoBjGHfZRRSxpukFkhEjd4JmHDpS+4Jc4U/UGIamhSwkE0o+JSKN9+SLx8ZVOunr2iGVKOt4OqX2JOTAV0Owq5Tl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731378016; c=relaxed/simple;
	bh=07PhfUMjhWi2kJeSe7TMczn7EOm/2ePrm9fMkbgjlOs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H39jLv6dvO6n6D1XD8876rl3pHPA9eRKlpF7vIZ59o1qxVSIYse5agWLnDOLqa0ip90NpOJ4+RHMIBF+iEl8bdFzg0zv3jMkLbZErDvwMxvGYkAcvHvAOx+mtjdV0X7nPU0VMOE6R3uO+Ui/tM5UfHjTRRYC3vT4IF5QpD5IM34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=eAcPzMFx; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=VBtzpfTD; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a2c58e44a09c11ef99858b75a2457dd9-20241112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=07PhfUMjhWi2kJeSe7TMczn7EOm/2ePrm9fMkbgjlOs=;
	b=eAcPzMFxiLv6IKSBoMYhILCiHlfEVyLS3MTdyV3k4E3X5LnGo+HHflrGjuMgGEIOvZnV/TT3Ty7P+5XeRC3g2UgIA8eC+hbpU7ePuVfl4MkLz4Vz3RxD60LGZ1lrjx90s5N9ojpW0NdO/pJ3BF4HV+2TxWBhEJdMroNvUwKxe5Y=;
X-CID-CACHE: Type:Local,Time:202411121020+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:e09a01cc-f2b3-4721-905a-02770747f1f1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:c405e4ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a2c58e44a09c11ef99858b75a2457dd9-20241112
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1820347076; Tue, 12 Nov 2024 10:20:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Nov 2024 10:20:06 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Nov 2024 10:20:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcD317tafcyrLltPDXQPSxuIAPvFMURKmYI4zLDQ6LwBQ3o+oTA/YCZJfx6MoXDvr2sAM1ZdxBrS2Ji8EGDKnNpJUqUx89G9D4TkBy78qDAwfi3+F5VgblUciQZH/fUQU3SZV5QLq6p1EY1Gwx2GjFCn9BtdPske1k+UBH7bXNON4Cvhq2pfPc2UFfqhkJxBJk/uaHVyQ8/SzXVHf5rwO+0Bij1OFb5/M/YhD6N9IdpQ9+qmRvki+Nx3ggmmQZZyq7EgE/kuOHui6T4gpMw/I8lMJYHmcacAgw2qKz8JkXl5t6Fj2xfETrzEshRFjkjhT7OqMCnsMJMKxBbst+5IsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07PhfUMjhWi2kJeSe7TMczn7EOm/2ePrm9fMkbgjlOs=;
 b=cmOrxH74HB66l4ZuTdwYk1xqVqT2oj6JEIoOb9Z2k1zwL24iEFGPNKTe3XRTUwwkkjMB1jWeAQixQhhPelgU2l7kBGoMlDe/JFKkkcRM866DHPRFbAks05WlSehHDYxoFof1xSonSEncltmh3ODfOcykglkiBE7Ui47b4ggPMja8Hb/kxTwgJbn4SKDjMUS10jKPiN3P2BwKmaGGrexDUJj1eKgz1el87S4U20CgDAeyqSPHV2ffplgGhdMhbZbFvWFGV09VwLFNztfWJPItRh+xGJyblXeUoSq60pTxXewgerCEz2YqXwNDMhQqktNJu1hqNJ4rSuwCkGmH+jcQhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07PhfUMjhWi2kJeSe7TMczn7EOm/2ePrm9fMkbgjlOs=;
 b=VBtzpfTDZfo7nuJ2SkK+f77xBqIufxjyUhi0c/1oXFzH54aPYXtdXUOIzDlSBsaIxPIGBysPaTWh3o5frQeWSBVoxgio0JRYkngli1MMmofRMUXX7LMoS6E/wPWiWqnr14aaALC1Gxb/XXgUp77MZz05UPh/OiKm+2hSHTF0KzU=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by JH0PR03MB7853.apcprd03.prod.outlook.com (2603:1096:990:33::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Tue, 12 Nov
 2024 02:20:04 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%3]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 02:20:03 +0000
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
Subject: Re: [PATCH 5/5] scsi: ufs: pltfrm: Dellocate HBA during
 ufshcd_pltfrm_remove()
Thread-Topic: [PATCH 5/5] scsi: ufs: pltfrm: Dellocate HBA during
 ufshcd_pltfrm_remove()
Thread-Index: AQHbNGH8+AF5kJXK5UG+YqRxDZKDBrKy6f4A
Date: Tue, 12 Nov 2024 02:20:03 +0000
Message-ID: <e8088a91a363a9256abdc36725782d577a6d6331.camel@mediatek.com>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-5-45ad8b62f02e@linaro.org>
In-Reply-To: <20241111-ufs_bug_fix-v1-5-45ad8b62f02e@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|JH0PR03MB7853:EE_
x-ms-office365-filtering-correlation-id: 624de631-cc17-48e0-3b02-08dd02c084ad
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cmFCT0pudmRGazlmUEFXTjh4a1hRWnhGdTc3UHlXdlVUcGs5QUhJb0VZOXJq?=
 =?utf-8?B?WTZFaC9VU0wwYmhScXZpaW5ZZkhZTTJjWTNqc29QVjgrVUxOUFdES2lheS9V?=
 =?utf-8?B?V0JVUDhzalZvUlBPekgxTmwrRFpZWXVPdW44K1BUak83MElSR1c3ZWhNSmdj?=
 =?utf-8?B?S0d6RWZqb0ZaZGpSMzJ2WDE4Z045WkhKZG9Kb3RXSFlsb09vbWhjSzE4dC9m?=
 =?utf-8?B?T293TTJMSjluR1VQK0VJUTYzOTI4MGg1dkplK1ZKUnVnNjdnb1MzajROSmov?=
 =?utf-8?B?L1Vyb2F1clNoZk5vR2NtOEZRb3FBd2lGMHBZRjltM3BKaUNmWXFxcHV6MUpV?=
 =?utf-8?B?eVRTeE5zaUhFb3QzQkQ2VEVxeVZLbDIzK2N6aUprMXRIU0xxSFpNSC9kalJi?=
 =?utf-8?B?UEZNU2toekJzTHZ3bDREQWhsT1RtbVNMMWtFV1QydFAwWVE3Q0g5QXoxajBp?=
 =?utf-8?B?aWllRnFCaXF6M3dKSVVENnZSdHE5YXhZM3VwbkZmdGJ0MnllUmJlY0JLYmI1?=
 =?utf-8?B?N2JoMkM2NmhGblJkMEYzYzEzYmQ5NkhBWFVjdFBHaU9pWUVCT1NVL3BCSjJZ?=
 =?utf-8?B?WkNnUDkra3JQOXUvMEdZbHBIM0VXaXFlWnJ5ZzNhUFd4WXhhcnpSbXppeEVt?=
 =?utf-8?B?Q1d3MTFSQThpUS9rUW5LSjlYdTFBQWxCNnBabGJ4R0pwNVZXQ1pYRmZDWVZF?=
 =?utf-8?B?OWJGWnJpUkgvcFY4ZVp1VHpXYVdoMFNsWVRTSjhuWElPV0V2SklGWi9WWDNH?=
 =?utf-8?B?bXBYaU95OEhRMzdYNUgyTEtjNDZOQXltd3FoeC9OM2Job0FndCtDbURCRG1x?=
 =?utf-8?B?OWdjNGt3RXduM0lDQnd3dnVhRTZpZURrZ2pTcTBwL2RrVUJCTVp6b3NWdndH?=
 =?utf-8?B?SnZKRmVYUGlrSVNJYmdHc2QwTkcxa1piRjREaEllMkFNV2MzQWJRbm56dXhl?=
 =?utf-8?B?OXBtekZVZXgxSFhvemhvTWRKcTNIaVVnbFBGc2RyTmJlZFZ6a3l5blRORGdM?=
 =?utf-8?B?bWRnU3YxNkp5N1RwaTBIYjd1YmF2ZS9vbFZ1eHVNR3NIMWJac0xRU3MwaVEz?=
 =?utf-8?B?ZVUyNTlUdGhMQnVQMFJtN1NKQUZiVWJMRUU1cDlaU1NDTXMzY2hMN0RaS1c4?=
 =?utf-8?B?aW1KSjhwSzFRL1F0SHc5Mnk1Y0VER29NcENjVHNDekZFVlpSK1BVcWMxaU5X?=
 =?utf-8?B?Mm9WV1R6ZXhLcjMwekpoSVlmNGNSZ0UrcnFqM1d6RmlvKzZDbDhvZEV3cmwr?=
 =?utf-8?B?aUxXTmZaUWNBTTIxWVUvOUN4VHMzWUhhWUI4cVhHODFFUE5JbmRXV0JYSi85?=
 =?utf-8?B?SHlOUmZEb0xRRzBTTm45b2JRVDJ2ZlA3a054ZGdHbmV5cldzQ2VOQ0g2ZDlY?=
 =?utf-8?B?RmRTNjRxSDZlQkhGS0FIYlNZaVExYnBJbTducFF1WTd0NUpQZzI2a1dSaDNs?=
 =?utf-8?B?VURaOUlLTUZPUGdmVnFORm9Gb2lqRVlUeVkrTk5XWVFxUnlnVUNKMllNelEz?=
 =?utf-8?B?YzUvaWlsT1AvUkJKVUlURG5CZ3MrejdKa3luTlpYb2pwcXN5M1UyRkZiZTJO?=
 =?utf-8?B?cE1XWmpSQmhPRlVnTUJZL2RrUUgreW5BYkRwb0FmV01IS2ZyMFRKY256a1VJ?=
 =?utf-8?B?S3JQdytFYjRVRmlncjN2bFc2bTIwUm15eFJVM2QyT3RDOW5FekxhVlY4OTNx?=
 =?utf-8?B?cldwb0JpVjU4cllWdFhwZTM0T1RQYy9UYlZNKzkvbStmUFdldkthQ2tzZG90?=
 =?utf-8?B?UWtaZ2xIRlptRldCd2wzRUthd0MvTmZhR2I1eEhKRG52ak03ZE5rK0o3blh5?=
 =?utf-8?B?b09wbFdJUC83ZVNxdVVldmFiSy90T0NUaU9vWlpEaW1kQVgyNjU2WDlkTzNx?=
 =?utf-8?Q?i51pW5rkXgtTz?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnVtSzEyUkpSbEJKWmkzRXZoRFUrTktaOWxwamg2ZktZbGN1WTVEZDRmY3Iz?=
 =?utf-8?B?VHNZYXJSVmlaa295cTRDWDBoeUQrenRvd3JHeUh4UTEwRjFYMFhDNDVnRDNi?=
 =?utf-8?B?b0ZFTTBTeWx5NTJFNWY5WnB6b0x6dEZqalU2YTBPNUlVK21md0lLWHFWKzAv?=
 =?utf-8?B?WHo4RWhyWUwrQkgvZmZsSnl6bDNhN0llVW9zWmZxSTRaTmF4TWhpUzAvVWNa?=
 =?utf-8?B?RW13UVduR3c5cDZmRFNBWWxLcnoxKzZSY2xTdjNKVDJRUk95NnFteCtiT1R1?=
 =?utf-8?B?dkMweFdaUkNWR0FSQk9sN001Zk5ZSXlHS201cWhma0tKR3NpTkJRUkEybWZx?=
 =?utf-8?B?TDFjV25MbzM5aVZsL3F1cGxEUjJFMlZ1ZXFoSkRYUXI0c2pWWFlwc3JMcU9l?=
 =?utf-8?B?cHQvZWpwTWpkb2VMU2c3V2sxNTFhZkpPWFpjSGxHdld3R0ovOVovS3AxWlhz?=
 =?utf-8?B?RGVIdzB5N0RmQXpHOEVleVlIb0haemdEc2I0YzV4RGQxZWFwTCtNSEZkQUox?=
 =?utf-8?B?Q3J4aFVBZ2JYOXdwdzEyMzNmT1J5ZllUWWJhcjFsR0NFM04wMTloWFFBRkpD?=
 =?utf-8?B?bWdZSkRWTk82ZSt1S3ZOUlFYc3ZHUjBqSTU0Q2drc0tXc2ZJU0dqdDFTNlpF?=
 =?utf-8?B?dkJFNlNhYVA3MktQZEhiOUV4MnR0R0ZLVWlML0tPLzVJYnZhanM1RE4wT0R3?=
 =?utf-8?B?SDFwM2lRakFnR0tnM2xLOVJTQkk0a25qQ3NGMStTSVdITXl0WUlveExUc2hZ?=
 =?utf-8?B?alRuT2xGazZlMjNVUjRYVmNTMWNvWDhWeWR5ZCtHMCt6aG9pVTZGZlkwRnBS?=
 =?utf-8?B?RWZrVWRMUGt3eENsKzlzZTVrRndSRmN4RC90L25VbzZsaTZJVDV3WGY4UTNS?=
 =?utf-8?B?NmVuQjNuRXVSclJIMTlXNTVUeW8yeFVxYy9QTFJPbjc5WFJadTBJOHZmM3d6?=
 =?utf-8?B?VXZHUXBZblJuN3o4M25Penh0dWhkL3N4TnBRVkVaNUJMVXZ2VVZFdldzU3RJ?=
 =?utf-8?B?dlcxWkE4Njg3aHQrWSsvNU9qUGN4eEJBdkl3OW9jK1hGaUdTRWpoNWZkdHZz?=
 =?utf-8?B?VEsrTHgzM2RoS3VvN1VseTBvUUk4UGlaaFhHWTd6aCtBMGdDVGx1NWZsQVA4?=
 =?utf-8?B?SEIzdzltZkRERktYaFhwa0NzcTZCK1dnTEdXNGVxMHQrVlEvaHlYU2w2TVlx?=
 =?utf-8?B?MFZQb3ZYU3NEOXRSL2c2VkFzTG50bUFPbThqdlFsWlBlcm80ZTgrVEM0cWkx?=
 =?utf-8?B?Mk1Hemt6Mm5rRGd1bHFTMnpTSDV6d1lIYWNxMzdrSjhDQWZsTVlmbDhVcVRB?=
 =?utf-8?B?a0xxc3djb2FLTy9KeEtZUzh3M3I0d1l1MWdKTUpWTmJLWlBMa3p0Q1ZiL05C?=
 =?utf-8?B?Unl6SkVaSnplb214cVVxUnEwdnlOcWZXOE1OanMvTGd5THZuS1RYOTViNWRq?=
 =?utf-8?B?VjZ6ZkRETVY2cFNrSHNYU0tuK0VQQi8wUGNTdU5Td1laR2IwZmVBZmpRajBk?=
 =?utf-8?B?SDY0OFRVeW5iazJubzBwR3VvMWFVcDFrMU43ZFE1bjVUeTcrWit6TkgvQVpD?=
 =?utf-8?B?YnRXbmJtV0tOZTE2ZUpDejl0NEc5WGJLTXlBVW5oRUR5WVVSelZSanRmdXp3?=
 =?utf-8?B?UDY1WXZZcHNTZmpKbTZNQmtUcVlraVF1NmpFVXZkbUwyNXhyaVNXM1Z0T0RL?=
 =?utf-8?B?MmM0aVp4LzVQaDMxeEwvZFRHV09jZWNtYitObXRUeXVnZ1BzUWk1TXF3MHdt?=
 =?utf-8?B?OThuSjArbDRwa0pydE1pUld6OTNMOGMxKzhYbWoyR2tyc0JBeEZ5ZmUvMDR1?=
 =?utf-8?B?TXhNeUd4ZHgyNVdISzVueXR6emVKM3pYa1Z2QTZ3YktFMmQrMVVDekwrMFNS?=
 =?utf-8?B?djdYRUR4VXNzUDZlWnl4N1U0T1BqVjZ4U1ZtcDZ6Y3N6aUtnQzdQVER3WVM1?=
 =?utf-8?B?QnZRc3J5MjVwK0o2RFFVRzZVNlRCc1RGbGc5NWNETTJGcFB5RTBIV09WcFBD?=
 =?utf-8?B?VU5uQU50aFV2eWVWNVdLeEtMOTFzYWNMVUg4cm9YNUR0MlJBVGVML2xGMGY1?=
 =?utf-8?B?QXBrM0RnMmE5MDlMdEx0TFZiQnhrVmkyb2o3ZUlYV0VQd1lrUDJURFQrUzdo?=
 =?utf-8?B?UTFOeU5yVThvUlR5UVlQY1A3c0pNVlU5TzdOWXRxY003ODMzbHlmRFNCUDBa?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17D25D09724CBE4C8CB34CB7B52B8A32@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 624de631-cc17-48e0-3b02-08dd02c084ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 02:20:03.8833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4aqMnmBcjSBYJQQhmJopL86UwuGLQXRN0xwuA8EBYC4IHdA6vP/yJmgtckhiv80zjNz4FTL2/drX6REonC7oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7853
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.200300-8.000000
X-TMASE-MatchedRID: qEAy/z09Hq3UL3YCMmnG4t7SWiiWSV/1jLOy13Cgb4/n0eNPmPPe5KWz
	WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2r51gSC67hpWcngj41L6zDmHZ+cd7VyKXT/d
	mRd5jU4CyB4IqjtpgyMbzWyPivbz4DEC13NjBkmyeAiCmPx4NwMFrpUbb72MUZYJ9vPJ1vSDefx
	4FmMaZTOTCMddcL/gjymsk/wUE4hphMKMWzRivCUULIfiWJMqhC1feM8zmW/yWQpWeoqUajhmyR
	YhK8GV6
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.200300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	4E78A246F206E24B6A597A3723BA0DF7172DE475A35E7960190D9FC7D76663552000:8
X-MTK: N

T24gTW9uLCAyMDI0LTExLTExIGF0IDIzOjE4ICswNTMwLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0g
dmlhIEI0IFJlbGF5DQp3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQg
dGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBNYW5pdmFubmFuIFNh
ZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPg0KPiANCj4gVGhpcyB3
aWxsIGVuc3VyZSB0aGF0IHRoZSBzY3NpIGhvc3QgaXMgY2xlYW5lZCB1cCBwcm9wZXJseSB1c2lu
Zw0KPiBzY3NpX2hvc3RfZGV2X3JlbGVhc2UoKS4gT3RoZXJ3aXNlLCBpdCBtYXkgbGVhZCB0byBt
ZW1vcnkgbGVha3MuDQo+IA0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIDQuNA0KPiBG
aXhlczogMDNiMTc4MWFhOTc4ICgiW1NDU0ldIHVmczogQWRkIFBsYXRmb3JtIGdsdWUgZHJpdmVy
IGZvcg0KPiB1ZnNoY2QiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0g
PA0KPiBtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJz
L3Vmcy9ob3N0L3Vmc2hjZC1wbHRmcm0uYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQo+IA0KPiANCg0KUmV2aWV3ZWQtYnk6IFBldGVyIFdhbmcgPHBldGVyLndhbmdA
bWVkaWF0ZWsuY29tPg0KDQo=

