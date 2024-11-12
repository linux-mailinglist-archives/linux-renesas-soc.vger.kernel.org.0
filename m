Return-Path: <linux-renesas-soc+bounces-10459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 162CD9C4C4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 03:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 905CD1F21FC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 02:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5624C205AD9;
	Tue, 12 Nov 2024 02:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ssojfFZL";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gmv3vuG/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A939E205123;
	Tue, 12 Nov 2024 02:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731377633; cv=fail; b=jaSDiq7li4/h4k9skAzdKw86bCx6DeRAWB/vcAucP2E/YE1zZPvejxF30Zg7W3Hjmal3vJ+v3UlJBKnr+swWBXgNNtynLXKd+HPdsqKdn/IMqC8XPTSiLr9+ltm4MNKw3o3Y+mBj8jgesVv51ytg80e62GzYJCGuw2nIQir3MlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731377633; c=relaxed/simple;
	bh=ieiSUFKR/0PhKh/d/y8647kEvwJGwC6mHLDpmYWR7f4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gI5ROMyWDTZQS9dD5cmuB8tRbvpvxDMKfyxwNa0Ghm94U8LwoxMC3VMRPcTNAnGYIzwYscU6MoFe9HhxgN+UaaoDOHZSm8xARV91K5G1SRwcITW+4PPjv03WmIIEt0VfCkUGMsLK6ZXVNnv6U5hmDxKuiNYxuKdbV2MJK8590Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ssojfFZL; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=gmv3vuG/; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: be08924ca09b11ef99858b75a2457dd9-20241112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ieiSUFKR/0PhKh/d/y8647kEvwJGwC6mHLDpmYWR7f4=;
	b=ssojfFZLPwprYHDURHIdFwy9DuX3vK+WQUYekwBQrOm5CJeqdbyJGGuci36SRA5xDlvzrugR9CwBXX3AY/mLwA+okoH/SNKjzsjcz80uZA8OWUaRQq5FOnSF9ZqECsvrS+SvfI6uCcBHhTRH7oZTPZlfBKorLmDoOkw4VIUOst0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:1ceddf5f-d155-4b95-9065-dee255becbc8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:a832ec06-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: be08924ca09b11ef99858b75a2457dd9-20241112
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1062808726; Tue, 12 Nov 2024 10:13:44 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Nov 2024 10:13:42 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Nov 2024 10:13:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7Y9dt2ohUnCF1a6PQkb9Uq8WfbomsoAE++HdclX2ORr6QyJcxf/kjOdNXuIrXiR2mpN4g+YyGGllFe5EqShNzEGbrPcDJRXIzCafA3ZPGc4FW3hBZOXq+LWokuR7iV8CJstdV9LwqwLNxQQLWaLxjoGQvirEF1VbNpOaxauU1M9vNn5fhYxzzOEWAMEy/LYRVmFU20AZQzgzLG6UEfVolxkklOiJc0Wpy5CS2g3cAsKW0UTHR9QP9RYWFmtCqEXGRRGID15TJOXC+ZF906jNSt5hj+kdhF2iR92BKzxruD9hy+xYfsAMoVJBgYMSMhR7KOn9DIu62rlGaMekuoaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieiSUFKR/0PhKh/d/y8647kEvwJGwC6mHLDpmYWR7f4=;
 b=zDwQs8pJxV3T/njV4PPiMEEY/Zkwu61EpPG0kSnxhCiWsutNBQ4E+yBtMDt1DO4hUcD3rZGvH+zl8F+sBIcxy++dLJBFQJ6GJNj5dGtzJtoN1r358CNYBPlnyjYnZYdQUu2BQCUGe6ZWSNQyd4ccGIQHgvpgloZICBbp9h6FLGEJ1KTtk+vhwJJwziNVKAn9Bg6llFh7y9HSz+3Kth95/55UcnXkUlkhJHCXHIxuUe74FfYQNfBf+BDpO0QC+6lUPACy0tQC2qNYGgQ4MF/QWGksp87F2m991H3gPuYi8vRuCWt+PqYggh+p3kQqjfaYVhYb6hpIUWUsr/mVSbGZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieiSUFKR/0PhKh/d/y8647kEvwJGwC6mHLDpmYWR7f4=;
 b=gmv3vuG/+GG6OopIKA0DrHy1JrcMP7Eq8R8tqf5Cx65S8d6UuhQT9Mlyq+OVGUkAcR1nFnJ4wY2x/E0K/qBZ5SN4cK8XCWjZ9WMlthK6KciL6KFQ/6ounzPkw+SC7pzLgX9kiOK1rvz7ZjhFrVDVJoS8LgUocya8U71RmBo/mWI=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by JH0PR03MB8076.apcprd03.prod.outlook.com (2603:1096:990:37::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Tue, 12 Nov
 2024 02:13:39 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%3]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 02:13:39 +0000
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
Subject: Re: [PATCH 1/5] scsi: ufs: core: Cancel RTC work during
 ufshcd_remove()
Thread-Topic: [PATCH 1/5] scsi: ufs: core: Cancel RTC work during
 ufshcd_remove()
Thread-Index: AQHbNGH+xA6RbuWzfkS74wfAtsV27rKy6DQA
Date: Tue, 12 Nov 2024 02:13:39 +0000
Message-ID: <183b7ba041d1b271bdf36ea969381be704633052.camel@mediatek.com>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-1-45ad8b62f02e@linaro.org>
In-Reply-To: <20241111-ufs_bug_fix-v1-1-45ad8b62f02e@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|JH0PR03MB8076:EE_
x-ms-office365-filtering-correlation-id: 74995da1-f133-462f-4ccc-08dd02bf9f95
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?NE9lblVtNXdhTTVhNXpQT1ptRFJGTExKMDdDaDg5MTNNcUJ3Yk5aSWJFWUFw?=
 =?utf-8?B?aGVIeXBuM1Y2Qy9CbnY5Z2piKzFwUDlNRDdxVXZ5TGVLMHd5eGVyTWo5ellw?=
 =?utf-8?B?blJ3dm43L3g5NXhXc3NsSTFWMXVZU25uVkRNQ0ZVNll6akMraXlkTDF1YjlP?=
 =?utf-8?B?ZWJwRVgyTSsxSGdPbi96ZXhoT21YbmM5NW13M21EMXJta0NpcXcybkI5TXlR?=
 =?utf-8?B?SXNEaVZ6TTN6U0lEWHZSbG9mSzZkbndGeEFQSW5RY1dnUjZZRVdtV2drQTBY?=
 =?utf-8?B?MjVOZ0RZTmIyTFBNSnlkUkxwKzQvS3Vxb3dsWDJhR3k2eStnQjBRNDZXdTEx?=
 =?utf-8?B?RCswYm1hWjNJV1BSZmhKVDRJUm9GNXQyamZONzdrMDIwMnpVUk5wZHdhZ01X?=
 =?utf-8?B?a0V5bDhzY2FzZWpjSkF6SytocHI2RFBoTCswV0JlTU45S0pyR3NyZHF4MGhw?=
 =?utf-8?B?aWVRM0hyaFQ5V3l6Ym1zUWlsZjZQdDJaYW02MWJ1RFlNQStNUmlnSEhFUU1x?=
 =?utf-8?B?K3pOaHBqdTkwNnpWejI1ZlB6SzF6cHRBRUFsOUNiWmxhUHp3Tk9JRW0zVUNR?=
 =?utf-8?B?ajQyWTR5TnZLQjJPNXhyM1BabU5jazk2SWQ1U1dlQ0h5RDBPTXpyTGhvRGx2?=
 =?utf-8?B?ZmlET0dhanQzak5OYldnamkwbVlET3dkd2JmeFU5VGdYaWtDVlNKLysvb1VU?=
 =?utf-8?B?SnFtcllGS3ZMV2RQcjV6TjlzMExKSk5XeDdNdlRhaWxCTEtlcnNEY0JoYStX?=
 =?utf-8?B?TmIzY2JTd09ZckpiTWw3Rk5wQ0QvZ0w1Z095RlhId21kcWVCU3dUYXBpOXhC?=
 =?utf-8?B?MWFWcSttM0ZPL3NaVGhTU0Eya3FxNE0vSk9kblNNNjAzNExxQy9VaGJtZW1z?=
 =?utf-8?B?RzZBbS94USsrZzRidWJBZHY3OFhrVGs3cDBLc001cUZ0UzgzUUR4ODBZeTV0?=
 =?utf-8?B?NnhZNWhYU2xqdmJnNXJVTEw5bmNjdDl5ZDROa2ZGYnRPRkpLbFJoVit3L3Jz?=
 =?utf-8?B?amI3QW03TlBIMGVQUitXOFBhcWdtRllzWFJ2N2daQ1FFUjV1YTR3TFJMTlBz?=
 =?utf-8?B?MmxJZzFFMWtYMFVkLzR0aitaTnVRUUtGdG00UjJ3Y1NxQlYyNWR1MXZhS2dw?=
 =?utf-8?B?OWw1dXUrUmlBdmNTSHZzSzVEdFJnS015dlVYd0psMWlvZDd0SnlqRzZObU5G?=
 =?utf-8?B?c21aa3pMVGNnQzU0MWJzNnM5bmlRRm5XaEp1N0xvWC8wQnEvYzNxNWN3bmhq?=
 =?utf-8?B?TWx0NzE3d0pVUWZLM0tDSy9LVENhNWI3NkNQK1FRVGZCbFFlR3YyR3M5akJm?=
 =?utf-8?B?L01JVVA4WXpkV1dEZUIvU3BaYVFwNklPUmlpeG1wUDhPNkhMUVhScG5LS2lR?=
 =?utf-8?B?ZGZBbmNRclFZMWF0YjMvVCtraGdRZ3p4U3czZjQxM0JHVmE0RmtUUHhOR2Zx?=
 =?utf-8?B?czBKSHdDY0RvSXdkVitYYlN5UzNRTy94VGlBRUlkZ3Nwa0lJdkxtcVREbFRR?=
 =?utf-8?B?S0lpeUxMUDdHL1YvekJIMklSTHNrWWh2NDhLWEExSzF5c2paMTZuNnBDNkkw?=
 =?utf-8?B?MjBlRDNqcEEzWmtHbDYyM0tpK3F6anpXM3lSZ2dRRmZHbmczQ2RNU0xLSFRW?=
 =?utf-8?B?aWdJNVFJL0d6RWZERHNHc3JWb0tSL0h4cGllT3pJZ25tMGFhS3FXc0pvL3Zw?=
 =?utf-8?B?MnEwdlBrdEFBYWhCbGFpOTYzMmExYVNVWlRoTk9JQ0hyNXZ3UlZnczI3R0FC?=
 =?utf-8?B?L0RMWnlwaTJnamJLblJ5V09iNU9kendYOHAxbEc5SzZmVDVOK0dpRlNVU0pX?=
 =?utf-8?B?WXZPTXV2bUVEa1Qva2RqNDZ6ZGV4Qnp2YTVvbTBZUEw1bFh4YUt0dHp5WWoz?=
 =?utf-8?Q?fHMchsq4PbzFK?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkZucmtZYmhXWmZjWnBqd1U4YUZYbmFqd2pmUUlrZzBIWEZuSjA5WmtEK0Zn?=
 =?utf-8?B?a3IwZWtTY0NhR09yNTRCZndJU2NESmlXSzFzNEhqTFoyN0xSTFhWWjVpaitl?=
 =?utf-8?B?Y25GSGhSK0o1VVNMTDhEYUlwNWZRdnUvMlY1SXRUMEVCN2NpMEN2MUZFU2dK?=
 =?utf-8?B?RGl0NW5NaG5MUkRxNGJLbFNOZmNVeTFmcWFjeEsyVlpEbVRSQ1FYUjVJMkhs?=
 =?utf-8?B?eUYwR3pvdCsxWTRKYU9wMS9HclZyamw1cENpK1doU2hNTERoNTQvM2hsRGdK?=
 =?utf-8?B?OFBZTG82Q2M2dTZ3RUdmQi9Ka2lVNzhybUozcExpVEhENUU2U3N6bW04UGl5?=
 =?utf-8?B?SzhxcUQ0QUUxMkJiYlJwSjczRlQzb01NR1JsSzkxTUxIT3FEVkkwOURKVXhN?=
 =?utf-8?B?NExqMldzanhnVWpwZWxLN2k1Ykc5Z3dwaE9zaWpJVWRwRWVBdUZDakI0RWhq?=
 =?utf-8?B?RUpaTmdLR3FZak1iaEtKZlk3aGJZN04wUXkxbGQvemFBOUNubWYwbWN1UHBO?=
 =?utf-8?B?Wk9jaWlBQmdZK0xSZ0RFY0FsT0p0U1hERW9NRkxtVEJneEZxcXZ1aGtiZ0xm?=
 =?utf-8?B?OXllQ2xjNisvRVA0cjF2SWdOMldnK29MWnB6c01sMDR4RFJ1NW5jdHNETTIr?=
 =?utf-8?B?ZUJBWVZ6aTY5RXk3SVZpTjd6OEtobU5sTjg4TkF3U0hUYlhhWG5ZYVFsalRS?=
 =?utf-8?B?UUFXUGpkZ3dSMDZLRndQNWtLRnJjRFZjZ1hsSE5uK1dWTXZjU25oUzBYb0Ry?=
 =?utf-8?B?amNjaytJTjJYR3pwWXRLTmlqN0cxWVBuTEVZUzJmRjd2YU9lSTRDRm9GVkFL?=
 =?utf-8?B?ODVIOXhRbFNIZE9DcVhFanZLV0RwbDV4V1lhZ3VHbkNzbS9Tc3FSOGtIVkJu?=
 =?utf-8?B?aVRxNFBLOEdTMmo0Q1kzSHFUVWM1R0xJelREclkvMzhnN080MkNOUjF1cXJk?=
 =?utf-8?B?VnYvVUZ3R1FUSEd4N2djY2kwdUxCb24zVklqNUZtcG1xb3dZdFFrcTN3akdB?=
 =?utf-8?B?OTVpSitsMDJhMW1FSUkwNnV5b0lzd05vcFBxVEwvbGhvd0JncEEvL3ZZYUFk?=
 =?utf-8?B?d0JQVElNTUtCRlBCbmJrZzlWRTE5ZmZIZjRXOTZnN2ZKVGRDTXlOTzlCY1Fs?=
 =?utf-8?B?aXRVWCtLMlZlVmF1d3R5MWJIZnJjK3h3ZklRSWd3YlhQK25Eak1ja1pVbXJC?=
 =?utf-8?B?NVp1Z2F6U2NzM0RZS1VvNlJ4NlFvWElKaE9sL080OVRvQWE4VkJVeUwxY2Ji?=
 =?utf-8?B?eGRjSkFXNU40WjQ3ZWZyNGwxZXJBQjNBYVVSeHBheStxVzF5elRhNW9hMUwx?=
 =?utf-8?B?blNseFhRQmY3U0Zia1o4QnpXZkh3dDFNTklwbkMxdmtTY2JCOGpZZFpmY0Vy?=
 =?utf-8?B?dlN4T3N5M045Z0EzMTRhRThtRUJWSVNMU2lZeU9jUjY3VDRtMG9WMzB5bXZx?=
 =?utf-8?B?ZndRcm1xaml6dkRZSEFseTZlQklEejZzdFpoOVZZbUJWQU80U3QxM2pZeFE3?=
 =?utf-8?B?VGM5MEtKeHJtK09aeEk3RGxMWXVEVnpUZjkwUk5UaXhhdjN0SENIZlMwcjJo?=
 =?utf-8?B?L01SU1F2WGlhWW83TEZ2U0k1VmxtT08zV1JTSlRBOEIvY0UyNzZWMmtNbFc4?=
 =?utf-8?B?ZnpZM1NaajBGNVFtTGNGam5KeTdtb00vUDQ3RFJqekQ2TGFjczlJWmZ1QTRE?=
 =?utf-8?B?NkxHeTF0anhIUXo4RmF6U3FoQSt4bGVtWTNtYlJ6R09ORDBvRFhjMHVKZzJ0?=
 =?utf-8?B?TVM5UHA5ZmJWclNEV2RhakR4T0xocDA5OURibm03UTlja2dodDBmZ3BrWkkz?=
 =?utf-8?B?SEgxeGg1eEtBVGREdk55dXJoUHl6VlcwVEJKTGNPNmFhbkMvNDNzZGJMRmhq?=
 =?utf-8?B?a0xkTDZZUlh0TFZkZzM5RUU4WllSRThYSXJOTnEvUVFRNmFHNWdyclZjVU4w?=
 =?utf-8?B?RThtbEpnRHFkVklib2pEQWg0N3F6ZCtwVU9iNDV6NkE1blc0bC9rMTVLQTU2?=
 =?utf-8?B?SHJrVlRvUkVxMHZNeUpFcGRwbUZQekR2YUlsRHV3dXkyOFRmR1VUU0dNMmti?=
 =?utf-8?B?MVg1SlBkb0twa1RFcDk1b0JMblhHMG50YWVaZUZEV3ROU0ZQdFBRT1ZjMnhO?=
 =?utf-8?B?ZUFEM3VGc0xVV0lyZ05jUndGa0FaSTFsT1UwTVpJUE9NeW8yS2g2cGhIbHNU?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9809E5D70B33C34FABAE4F448C850A68@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74995da1-f133-462f-4ccc-08dd02bf9f95
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 02:13:39.5486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P+0763AbQ6RkVbjdNfqSvJGqS/67rZbDLy8CzGQByRbc15+6hBTSA1sjVp8dua6FabvIsH1JsJ99UbyXdtoGFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8076
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.257100-8.000000
X-TMASE-MatchedRID: GBgFBUqwD4HUL3YCMmnG4t7SWiiWSV/1jLOy13Cgb4/n0eNPmPPe5KWz
	WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2W7gz/Gbgpl7g5IlbqEYTO5IuII6CcB9zMFd
	dv+pLbreyB5jPd5ly1xCyFrD/CmZGFy3ODkOxxFMZXJLztZviXOj86Ng8AayKJLfQYoCQHFYQr5
	8JtEoLH2DNz9L0bHNAxvNbI+K9vPgMQLXc2MGSbJ4CIKY/Hg3AwWulRtvvYxTUHQeTVDUrIuB8J
	9aWc1v/VymkLM+r7VTKayT/BQTiGhn9zEuaOMi3D8M1yGdYOjJFuzugts0jgUsdit1KDPp143iz
	O9ACM70=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.257100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	0A41C684A4CCDC09C01F94821DB6208E7EC0C8D29D8032091F71497AA178819B2000:8
X-MTK: N

T24gTW9uLCAyMDI0LTExLTExIGF0IDIzOjE4ICswNTMwLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0g
dmlhIEI0IFJlbGF5DQp3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQg
dGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBNYW5pdmFubmFuIFNh
ZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPg0KPiANCj4gQ3VycmVu
dGx5LCBSVEMgd29yayBpcyBvbmx5IGNhbmNlbGxlZCBkdXJpbmcgX191ZnNoY2Rfd2xfc3VzcGVu
ZCgpLg0KPiBXaGVuDQo+IHVmc2hjZCBpcyByZW1vdmVkIGluIHVmc2hjZF9yZW1vdmUoKSwgUlRD
IHdvcmsgaXMgbm90IGNhbmNlbGxlZC4gRHVlDQo+IHRvDQo+IHRoaXMsIGFueSBmdXJ0aGVyIHRy
aWdnZXIgb2YgdGhlIFJUQyB3b3JrIGFmdGVyIHVmc2hjZF9yZW1vdmUoKSB3b3VsZA0KPiByZXN1
bHQgaW4gYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXMgYmVsb3c6DQo+IA0KPiBVbmFibGUg
dG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRy
ZXNzDQo+IDAwMDAwMDAwMDAwMDAyYTQNCj4gV29ya3F1ZXVlOiBldmVudHMgdWZzaGNkX3J0Y193
b3JrDQo+IENhbGwgdHJhY2U6DQo+ICBfcmF3X3NwaW5fbG9ja19pcnFzYXZlKzB4MzQvMHg4Yw0K
PiAgcG1fcnVudGltZV9nZXRfaWZfYWN0aXZlKzB4MjQvMHhiNA0KPiAgdWZzaGNkX3J0Y193b3Jr
KzB4MTI0LzB4MTljDQo+ICBwcm9jZXNzX3NjaGVkdWxlZF93b3JrcysweDE4Yy8weDJkOA0KPiAg
d29ya2VyX3RocmVhZCsweDE0NC8weDI4MA0KPiAga3RocmVhZCsweDExYy8weDEyOA0KPiAgcmV0
X2Zyb21fZm9yaysweDEwLzB4MjANCj4gDQo+IFNpbmNlIFJUQyB3b3JrIGFjY2Vzc2VzIHRoZSB1
ZnNoY2QgaW50ZXJuYWwgc3RydWN0dXJlcywgaXQgc2hvdWxkIGJlDQo+IGNhbmNlbGxlZA0KPiB3
aGVuIHVmc2hjZCBpcyByZW1vdmVkLiBTbyBkbyB0aGF0IGluIHVmc2hjZF9yZW1vdmUoKSwgYXMg
cGVyIHRoZQ0KPiBvcmRlciBpbg0KPiB1ZnNoY2RfaW5pdCgpLg0KPiANCj4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcgIyA2LjgNCj4gRml4ZXM6IDZiZjk5OWUwZWI0MSAoInNjc2k6IHVmczog
Y29yZTogQWRkIFVGUyBSVEMgc3VwcG9ydCIpDQo+IFNpZ25lZC1vZmYtYnk6IE1hbml2YW5uYW4g
U2FkaGFzaXZhbSA8DQo+IG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvdWZzL2NvcmUvdWZzaGNkLmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KPiANCj4gDQoNClJldmlld2VkLWJ5OiBQZXRlciBXYW5nIDxwZXRlci53
YW5nQG1lZGlhdGVrLmNvbT4NCg0K

