Return-Path: <linux-renesas-soc+bounces-10461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC60A9C4C6C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 03:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BC7528A7AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 02:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47ED4204F88;
	Tue, 12 Nov 2024 02:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TUUa7wqX";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="TGuKkEny"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E1204F84;
	Tue, 12 Nov 2024 02:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731377769; cv=fail; b=WP1OP91YoQCCLeVINf+r5Ca7HAXfseelFsSoaYsdfiVPglwyhSgMvJsVSt95Rdy+lRP8yXMuzv5NR+Xg35OnzB7fYnspDBF1BrZFcYJmPKg5f0ZJxgTtCdmNfMkmrVHdndqBrYcq3j7wnH3jCZVE9v5yd5JyUOiHtka1LsYg3Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731377769; c=relaxed/simple;
	bh=9MBwqufSVnL9MNYxgGeUbfkEU16MzeKdL5v2MzaVwHc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rasfWyFXqDXI+jqigmlEHKOzwvNrvh7pNhHidgACF4h12+fFdqPyiyGye0cq9pquET7LRgboli6QMLq2vDAYqk3ZizUd2HYZmPeDBcryoldRHdABAbOx2ZFkA+D6f143wuYyMPW+TzH5m4Xth1vezOJScrdad4dbM29b8NLV53I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=TUUa7wqX; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=TGuKkEny; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0e25b732a09c11ef99858b75a2457dd9-20241112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9MBwqufSVnL9MNYxgGeUbfkEU16MzeKdL5v2MzaVwHc=;
	b=TUUa7wqX2KHR/oK+IEv2BKdvVMpjW90Ao7hA21lKuarYdGBog+2kHAwWRR8CaahHXmfhphKqqBJYuoGbKhmKH2cTBUWretqwc8O1xnuiRf+bhmaatdH1XgnLdLb6gXgPKDsFIsVA5mwg3clMLZSNEIPkmwOX6mZGGeIUZZoFlMM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:91fe948b-5cd8-4d36-80f4-c17710f4d8dc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:7c3cec06-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0e25b732a09c11ef99858b75a2457dd9-20241112
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1451782195; Tue, 12 Nov 2024 10:15:58 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Nov 2024 10:15:57 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Nov 2024 10:15:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcHSSNxnQE6dwlQWbtJXhudu/UQ8Phlw5NvkQ2jWM3oui9rANWbEbYicIm/lbaP2j+jTDvmZbPW/IvxA3+O1kE484BurC3/lPipL2Oao6zEq6EZg+neVld/1dVE9S1+nj8oxIvf8oaSnmN956RcAKD08/CEJ0SPIsjWewk+jKQaQMdPdhIpaQWUzNSqp+Huwj4iwRWv4Ho5GAC1lCw6pv/gwJbJLCrrPSrZmdKOvEnB1/Fr/nzhBi5AAfKof8H2inWE6gbdVoAlcJveWUvGYQOhe6YaHJQxI+kPLCiMa/pO+Tkvrw1JfvlwwtgIv9sU6ylukD13/aoUA0WpmmsPffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MBwqufSVnL9MNYxgGeUbfkEU16MzeKdL5v2MzaVwHc=;
 b=fLE4wpOWKolPUkHdhMZ4tUCEAidvoG6ZCj2Nle+iO/fq0uml/wmHYNePLs9va7d6VUte5l+Ho2rWOWsL3E/Ctul7kpWrjPSqltJZ5BHKeK8ODQ9bvawvvT23bdMq4CAK9dDwRXVOTkK3mh27gYf2wrxFWedlLUFyFM5wG20PLh9zGvZR3oTX1NDDd0njAD50nh0FddCO+1xk99fADLw0Pdfzp/VjSIfp7cYA7k+3X8XZ2e3lFVaiVAJolGdqpHp/APU+X79T1/Lefm/DE09s3XiqxSnwByOVUDf8eXpTnLA7FrG1nNylH/wUk+GsO6NA0jnzEasbKEIxD8mlEVu0cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MBwqufSVnL9MNYxgGeUbfkEU16MzeKdL5v2MzaVwHc=;
 b=TGuKkEnyUl2Qkuzr1TAQ1TYxeEnQXb+0dLyW1olQuAmiW+H7TeGrHsaEf/8qqOzM5mLNXaMwnCOy078XNuNWH4C47553vA+lcQTQeEeSmDnjoqL7PHTPOXB45TdEQ8MsxaVafO6s4UuK93WMFbmd7mfUQFiLMwYeXHZGQE/PzAw=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by JH0PR03MB7853.apcprd03.prod.outlook.com (2603:1096:990:33::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Tue, 12 Nov
 2024 02:15:54 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%3]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 02:15:54 +0000
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
Subject: Re: [PATCH 4/5] scsi: ufs: pltfrm: Drop PM runtime reference count
 after ufshcd_remove()
Thread-Topic: [PATCH 4/5] scsi: ufs: pltfrm: Drop PM runtime reference count
 after ufshcd_remove()
Thread-Index: AQHbNGIw//l4jID1ok+3qbPQ45wcYLKy6NSA
Date: Tue, 12 Nov 2024 02:15:54 +0000
Message-ID: <bcd0182870d9e8056584b2aa99fb1c388885d5db.camel@mediatek.com>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-4-45ad8b62f02e@linaro.org>
In-Reply-To: <20241111-ufs_bug_fix-v1-4-45ad8b62f02e@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|JH0PR03MB7853:EE_
x-ms-office365-filtering-correlation-id: 524b33e3-7a4c-4261-fcd2-08dd02bfefff
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?akl0VGlsOU1wSDN2Mkt1YVk0czIyVHpBNHRZUVYwT3k5Rk04dnpMQlhaWXdn?=
 =?utf-8?B?OHdaOFhzUW1sRW9nbi9SbllFYzNXeDc0MXdoZXBuS2dJSGZBZ3VMbldzdEE5?=
 =?utf-8?B?bHUzV0VyM3UxYnlLZ3NicEtCY2xoVGwzRVJZRVI2aTVOYitlWnN0RG43RWQ0?=
 =?utf-8?B?VUE0WWl5SnhrU1o3UGhqbXQ5UjlmdHZYM3hSRWRoamF6Z3ZhalNkQVdqSEgz?=
 =?utf-8?B?WEUvWXFpU0ZJNTN1b1VRN1Z2TllpOTBYbW5rdktSeUFUbTN0eVJwWDhnWWVD?=
 =?utf-8?B?cWk3UWhoekxsOVJLb2QzYlNYOTBIQmVXWndJUGNkcUhDenlmaWF0cjB4Ykp1?=
 =?utf-8?B?YjNHemlQS1RHVGdJYzdlRXF5cjQyMkFWRzRWcGFBbFRBQURUbFZ3ZnczcDZS?=
 =?utf-8?B?RklFZ3JIZzVkb3FmTHNKeUJ4anlLOHBWTkdwN1ZlRXZ2OW1zaVl3RzhWQlFQ?=
 =?utf-8?B?M1QwVWlNaGxSMlNKZzZma05jQ0FIME10YldrMkFDRFgxZ2l2cmZMRXRKU1Bp?=
 =?utf-8?B?ZDJGdFFQcDlKclAzRWwzbUtuQTNaZ1NtaGJaV3JXVkNXbjhhQ0VnQkpPOUMy?=
 =?utf-8?B?ZFpYNGNYQ2ZVMkZxSFlPejN5UU04WThrZzRsWU5PSEEvdzhheEZHVzFYWW1C?=
 =?utf-8?B?Mkd4bGtWYktDNnoyZDhrb0llV3NMQmpKeEF0VmxJaXI4MVRwdWVoeDJVWURH?=
 =?utf-8?B?VXM5M0o2bkZWUGxRVHdDQjdWSFA4Y0daaTRrZGJFUTVwQzZ5TkwzUlkzZUNR?=
 =?utf-8?B?N0ZhaitSNHh5cWVzcXcyRTZTTUZPZGxzT1ZYT0dWVitZTGg5Q2JBL204ekpE?=
 =?utf-8?B?b2lUYjJvK1Jvc3ozRDFDMHV4MDVYK3ZpNGdGOUxOWGp3SFpDNzZuS2YyRUtE?=
 =?utf-8?B?MVo2a3RyL0xZUnpqbS9FNmxSUVQzaGZsTVlRV1duc1JsSUsyMEEyL0dWcEtv?=
 =?utf-8?B?aTNsQU4yS3RHdGJ0ekFwUmFHVUNUZTViN284MGdQWXRaaWxEZzdRMGIwZ0lP?=
 =?utf-8?B?am5FbERhNmVrdTNubDMrOU1wZWR5RlcrUFhwUnB0cWJCT2hXVVZ4b1FEeGho?=
 =?utf-8?B?L0NxZjhFaDBXT0R2ZDJzZzBhUldvejcySXhGRlc3QkxBNUpMdHM4V0xWV3Fm?=
 =?utf-8?B?SHI5ekRReHVxbGlGaFlOYTBIM0VVVEozelkwWEVCbWpoU0lJTHhDTXZZQ0Iv?=
 =?utf-8?B?TmJ3eVFMbTJZSGQ0SFVrMXNucE5sVTllK3JFbTBqNit3MUNtZEZid1hUczJ4?=
 =?utf-8?B?clBSa1VqK0FqU0VNTjRQMnEySFMzZEpYN3U3Y2RGUjRiclU5ejFiekNnRlJC?=
 =?utf-8?B?c2RFdEZGdXdJcmN6ZTY3dVFuUXI4RTl5VFIzT3Z1ZGpXZWhFckJjMThneTRD?=
 =?utf-8?B?T2FwbmNoeWZTdFl3cFlZQzFKVnF0dTFIUnREOW14TEFqRktKak5ZRDZlTTFi?=
 =?utf-8?B?TkhZZW9ycGkwd3FGUk45dXpIaE9McGJCM1BNSWtidURJWkJyYzI2L3dEdVdz?=
 =?utf-8?B?ZVN0ZG1RRGhROWJMRzlhMWw3RHFzdTR6YzN0dm9lcU5oTXdzb0VRZkJ6RVJm?=
 =?utf-8?B?Q3FiTURXbTBrWlVmM09sbHVCY2NRdkJ6Z2ZHQmpmRWJWaTNUUGNmRVlVckNL?=
 =?utf-8?B?aWN1a2NYMEp0bTZDS0l6L3dhRUJMbVZMbC9QTnpJNzdibnk3REVQcWtGSFpR?=
 =?utf-8?B?emxxRnZ3S2I0SEh6dkdSOVk5TXhFQkdvckt4N0hvZXlHb2Q0ekpEWWt3V2Zq?=
 =?utf-8?B?NkhZS25jTlZUNjNlU3NLMVl2VlRVUGt6NldNVGZWRHhkbkJJZDlsRWxDVHh0?=
 =?utf-8?B?RS9aNHl3VzFFZnBiUkFNZ3d6eUIwVFdBWGw3dkI3Wk1mOHhMcUtJLy9WTVJm?=
 =?utf-8?Q?wR21fEiBPDSmg?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ampCTnhWNHhJbGNicWhEbDBxd080QzVPV3NZaXB3aU12YWFIN1BkYmNhMEN4?=
 =?utf-8?B?Q2RheWRNRW9TeXBnNS9jSDhIOGJNSGFpcjVRcVIyZXM4VWhDbHNFekluaUxS?=
 =?utf-8?B?NVNBNUVtZTFwRkNrRWpoakRYU3BZcE9qaXIzTW9qTFZuZWF0K3VCWmFVMnln?=
 =?utf-8?B?d3lIcWVaZjUwbzhISElCak9RVGFkeHVuY3FnQkhGUW9Sc1Q3UUZOMDJHSSs3?=
 =?utf-8?B?Tk1hVnl4R2lVUWtXMmIzVVZpQXhyNWtJS05wbndxbEFGQzRvR0pUdXNCN0hi?=
 =?utf-8?B?U2NNcUpvZGh6WjlOQmswa1ozZTkzakNPa2pnQStLNzI0cTBMM2QyblJWaXlL?=
 =?utf-8?B?T1VkY2pTdWh0a2pVT2pGQ1hSRzRGZUJwKzZZeGtaRyt2dnBpZ2hDSjlsS2xQ?=
 =?utf-8?B?dmk4bDRtMEh6YWF4TEhkcnVXTnBQZTUyYXU2K3YrdklKMnc4aEp3YUFlL0wr?=
 =?utf-8?B?Nk1JMk9oSXdmTmVFUXJqaUI4bzhqS1dRK1FaUDZNTDJyM08xa3hvWkRIYXdG?=
 =?utf-8?B?UFp6NnoyZlc1VXNud3YybSs2SmNLNTZOdG5MaFV4VHpmaVJkSnp2SE90TUVG?=
 =?utf-8?B?NDNma1A5Y2VLK1l3RzFTWE5raW10YUM5dmY1Uk9Wa05LdnBDRXFDb1phVFFU?=
 =?utf-8?B?V24zSmZoM2t5Z2VxYWp5ZG1FdisyZm95TXNBaTExd3F1TVV2TWtJZ1JHNTEy?=
 =?utf-8?B?SVFCV0ZDTVYrRXQwb2piOEo4dWNpaURuWXA4M3M0NFFVR2VUSkhjUlNJYmNS?=
 =?utf-8?B?bzlxdG9LaW43emtQMS96Zy84enRrekdHR1hVT216KytTTUYzODNjVDNsSUtv?=
 =?utf-8?B?clk3TlU4SDBwVEIyNjJsTU9hNlpKdVVnSk5xOHJRMFBUS0wvRVgvN1haSlF6?=
 =?utf-8?B?Rm1XVVlSKzNrTnVjYzBLOGY5R2xIOTZXUXU5U0xSL3BZVHZVVzV5SmRPRVFZ?=
 =?utf-8?B?ZlBiZ3RIMUJpVWpuUFVIUDV0N09HaWl4U2RRR2hYRzVRVDQ4d2h4dlhzR0h6?=
 =?utf-8?B?Ty9hUHdQMmtMWFZMNzA3aXoyN3FLTUE1bVFpZW5kUWkwMmNoZFkrcW5TK3h3?=
 =?utf-8?B?VG5WM2daWFlqWmRpS1dQRFlsYnZsaUZxQk9GbWlKTXE0bSsxVklMWXAzblpr?=
 =?utf-8?B?d3Z2dDFocmhwbHJWSURjbmRxRVFjVFJrQmFJbWptTEUxTFptSThIYW1GVkxp?=
 =?utf-8?B?M3pVR1hWWS8va0o4OEE3R01wK3VQQUVkcEJxL3d0alZNdEFxZyt1empBSDJF?=
 =?utf-8?B?MW1Wa0hQYlRzV3NCZkRwVHNRMU90djZaa0IyZ2FUaGhyUU9wNGZ2Nld6Sm5O?=
 =?utf-8?B?SEwvVGxhZmkxVWpUY0JJOThrV2lYelk4Q2IxajlnMXQ5NldFbk9yWURkYVV0?=
 =?utf-8?B?ZTJJTW9zMndaVXZWNGhSZUZNVDVYcEJoZG9TYnQwblpUVk0zTlFsOFRLWElu?=
 =?utf-8?B?V3AraVZ5OGRzdzJxRHFnK3lFVDBiYXlnYnNuYjc0WFp3R2hMcCtlMW1tVTdq?=
 =?utf-8?B?cHYyZUlsYlllN2oySUR0a2UzMy9kOVYyTWEzWW5GT25zV3NTWnIvaHg5NnFS?=
 =?utf-8?B?eThMR0pQWCt2Q0NzWHlqeHJVakM4NVBTdE1HRkdHbHZ2RnRCS0JLRndLL0FB?=
 =?utf-8?B?Y1J1ekhTWFpnU2htR0VUb0NPanAvYzZ5LzhmbHlORHBDemlLR29xNlJnNGJI?=
 =?utf-8?B?YVpsclh5T0gvMEt6a1dNM0VYWnRUN1ZReS9Ga3RCYm14TVRQcHlIWEdCOFZX?=
 =?utf-8?B?MTJmZVpScHg1TzRvdExPb2YydHRxU3R1NFJNMXNhTWx1WDZzdFZUaHJFckxt?=
 =?utf-8?B?aUd1YWhybmFkNnhEVjRIeE96bkVmaWZhcnVPNkpZQURua1l3RzZMWklKdlR4?=
 =?utf-8?B?b09HRmlrTWk0Zy9PV09sNUtQVVhqdFU5K3dDTklxWS9kK1haZWgyY2J4UDZz?=
 =?utf-8?B?blZTS0I5Q2d4UjkzOGNtWWwxWEJWcWFMMTNhVXVxaVpqcDZkc2thUlBXb2RX?=
 =?utf-8?B?MFFlcEhqd2xiMUtvMllzMy9HdHRxeUNvUkdCbFNWY1hZZTdxanF4OFU4TGZV?=
 =?utf-8?B?NGN4VWdqK1NQZ2FycEJmenFlSkZyR3hWRmlaMVkwOE1iT2ZxcFpEcUpVbkJS?=
 =?utf-8?B?WU9nWlRSTU9xZG1obi93ZENabFlzNFRvdittRjg2ZW12aW5lMHdnVHF1SXov?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5EA400A9AD55443ADCE114976C4BD17@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524b33e3-7a4c-4261-fcd2-08dd02bfefff
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 02:15:54.4653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lNlzZroWNi2415GAOgbJstjUZGIJF7+3oR5o4EDL8CmXQCX51Y8yY1xnD8sNuWEBsIVh8PquJkZgfjKj/Vl0MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7853
X-MTK: N

T24gTW9uLCAyMDI0LTExLTExIGF0IDIzOjE4ICswNTMwLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0g
dmlhIEI0IFJlbGF5DQp3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQg
dGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBNYW5pdmFubmFuIFNh
ZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPg0KPiANCj4gRHVyaW5n
IHRoZSByZW1vdmUgc3RhZ2Ugb2YgZ2x1ZSBkcml2ZXJzLCBzb21lIG9mIHRoZW0gYXJlDQo+IGlu
Y3JlbWVudGluZyB0aGUNCj4gcmVmZXJlbmNlIGNvdW50IHVzaW5nIHBtX3J1bnRpbWVfZ2V0X3N5
bmMoKSwgYmVmb3JlIHJlbW92aW5nIHRoZQ0KPiB1ZnNoY2QNCj4gdXNpbmcgdWZzaGNkX3JlbW92
ZSgpLiBCdXQgdGhleSBhcmUgbm90IGRyb3BwaW5nIHRoYXQgcmVmZXJlbmNlIGNvdW50DQo+IGFm
dGVyDQo+IHVmc2hjZF9yZW1vdmUoKSB0byBiYWxhbmNlIHRoZSByZWZjb3VudC4NCj4gDQo+IFNv
IGRyb3AgdGhlIHJlZmVyZW5jZSBjb3VudCBieSBjYWxsaW5nIHBtX3J1bnRpbWVfcHV0X25vaWRs
ZSgpIGFmdGVyDQo+IHVmc2hjZF9yZW1vdmUoKS4gU2luY2UgdGhlIGJlaGF2aW9yIGlzIGFwcGxp
Y2FibGUgdG8gYWxsIGdsdWUNCj4gZHJpdmVycywgbW92ZQ0KPiB0aGUgUE0gaGFuZGxpbmcgdG8g
dWZzaGNkX3BsdGZybV9yZW1vdmUoKS4NCj4gDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
ICMgMy4xMg0KPiBGaXhlczogNjI2OTQ3MzVjYTk1ICgiW1NDU0ldIHVmczogQWRkIHJ1bnRpbWUg
UE0gc3VwcG9ydCBmb3IgVUZTIGhvc3QNCj4gY29udHJvbGxlciBkcml2ZXIiKQ0KPiBTaWduZWQt
b2ZmLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPA0KPiBtYW5pdmFubmFuLnNhZGhhc2l2YW1A
bGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3Vmcy9ob3N0L3RjLWR3Yy1nMjEwLXBsdGZy
bS5jIHwgMSAtDQo+ICBkcml2ZXJzL3Vmcy9ob3N0L3Vmcy1leHlub3MuYyAgICAgICAgIHwgMSAt
DQo+ICBkcml2ZXJzL3Vmcy9ob3N0L3Vmcy1tZWRpYXRlay5jICAgICAgIHwgMSAtDQo+ICBkcml2
ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMgICAgICAgICAgIHwgMSAtDQo+ICBkcml2ZXJzL3Vmcy9o
b3N0L3Vmcy1zcHJkLmMgICAgICAgICAgIHwgMSAtDQo+ICBkcml2ZXJzL3Vmcy9ob3N0L3Vmc2hj
ZC1wbHRmcm0uYyAgICAgIHwgMiArKw0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiANCg0KUmV2aWV3ZWQtYnk6IFBldGVyIFdhbmcgPHBl
dGVyLndhbmdAbWVkaWF0ZWsuY29tPg0KDQo=

