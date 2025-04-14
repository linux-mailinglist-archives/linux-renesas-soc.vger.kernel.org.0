Return-Path: <linux-renesas-soc+bounces-15937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07581A888FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 18:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1576618998EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 16:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAE42749F1;
	Mon, 14 Apr 2025 16:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AZplYRSF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AsUfu7Tl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586651922DC;
	Mon, 14 Apr 2025 16:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649517; cv=fail; b=G7+QUjYLCBkuUthOciF1xPP/c9PtUsH6NBpBwHSJ87eBULr3/w+YGuluTUizA8ELjQRdeaT2NVz2a14Eantzh31qxUE6J3bt6fe83qJvRCFFZc+8llnfm80cUJPkWachnQ99JCgPdC8tOrZZfYYs6jy5E7bTQMDr2XKtMUPu2gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649517; c=relaxed/simple;
	bh=OMeo185iPudkXKD1ENW1/+ggx9aQmKs3PDYaVqKPRNM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PT39Rdfe+Uq1kehxZRnA6AtazyoVWPi/ZQkK1P+LCThRqz5RtmPFS6wsj6pnpl5F88RWQghRzmoZXEwM9vtNt30D6yNf9pGN74pBfqomg8e5AXSqw7Ll5xUtbNqqL5cnrX0LtbuHSjFo/4Bim9wDxHZce/xEizu+hiZOdl2ywdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AZplYRSF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AsUfu7Tl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EEqGmH020809;
	Mon, 14 Apr 2025 16:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=kPMSL+skziHK5m125unipprlD+Ss7sdrEzdJql7ejF4=; b=
	AZplYRSFyiZR6wDihIe7JEpClr4nw31Ltc85ulymqXmGcPZiOue3z0J5qKaWQ8BD
	LjtlJbvWYO+aFv4vrT2iSY27pw+sjfvRaO7y6aG4jRdPF7XyLCeMCEZpOUtyoXvW
	GwOnCk401tCxGQOg6RlnJXQHPcPV2feo6GF52b+a6xIxIX22SWvvo56I2mBk6shi
	PdXr/M8oo6FxZ4HcHOqYbecQTRCPV19KZekbtr8bi28VnBPpp/vLFvXBjYpqIglS
	SBZX1qbqiIWfIf6s8xyWHb46y+dcdvnmLVpM07mz9rV/OclwVFh9l/p2UcSGh1Q6
	sCh61ZqjPSWBfrqI9oO90w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4614gf091d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 16:51:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53EFfMdW024645;
	Mon, 14 Apr 2025 16:51:38 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013058.outbound.protection.outlook.com [40.93.20.58])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d4y1126-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 16:51:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlxygqrJVCbg3tvfOEm6gWaNUrWkABWaI9FQ013NFtqtB6D/1QZigkwkLqV3wumjGuwp1ORiISz/5TthwydKZqIv6FnxnuG0kRpNjvwK35I64o15zndNg3BxCWbFioGEUDsKnBPlThp5wuMWCOxYyTDAngxb20eT01BSWwRDK/snMx2g7zBldioeXL/aiMm9ipP4fnE+125wund+6qq80QeeIkgrt8jI+ZO04IKHo1kMFgnUHrYKHOBqlIcLl4EjmRTQX1uyJwosKZ1wwhlKXKxooD7QvotJoKI0Ee7WObWeAKe9auxNzgUFlayElelBMMR/79mRm3Yb02HaQmMCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPMSL+skziHK5m125unipprlD+Ss7sdrEzdJql7ejF4=;
 b=W6hwq7CvKWWZyqgYyCppkRYVT5oHMCcrpaVKetK2cDhTUZRujGGu7OLH04Zy4Au+c+SgMxcOOxoPVaic5aU0gUrRQdakLPzNUd1+hUBeAzTdKNHNwRJoVzNwh5M0fbKr8C2pgJ4EESc5NYzWu8It6Y1D892VfzR3vfCdAv8SSktTBDSVpBWGf01B+iZeVxq+EBtfiUS0IZOJ33QbCIaaBbIZKQZ9b2utTA5pM3ts6rQ7oWwYWA7LWe0CqObG6Fk4I2sWEaw2K3p+RcE0BfIJBz/P0YvH8EkTTA+X3zGMJ/1uaAC+rl9jJs+3o5cnbawEhEONoAcrhvOvX5O2mlG04Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPMSL+skziHK5m125unipprlD+Ss7sdrEzdJql7ejF4=;
 b=AsUfu7Tl5aO3k2cBknbr/U51ju+Iz3Frxbn8wys6H7rSsALETFS7m91J749e/qZdWh+8Q4VH+Lm7NlirOimFahD67xTT/FYxFCXj6kRfcsXaV3++MaKtviDIXO/fzu+auuhkZTlLYOs3AsWLMEisQPnRSVAwiDCV7kaCFoA0Z1Y=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CH4PR10MB8050.namprd10.prod.outlook.com (2603:10b6:610:236::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 16:51:35 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.8632.035; Mon, 14 Apr 2025
 16:51:35 +0000
Message-ID: <d71cea86-034c-4448-92de-217ea9d1d018@oracle.com>
Date: Mon, 14 Apr 2025 22:21:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: RE: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for
 Renesas RZ/V2H(P)
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250414130020.248374-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <9c32c9aa-3895-4969-8a33-059c4ad93143@oracle.com>
 <TYCPR01MB1209398B324FDB1691D80545FC2B32@TYCPR01MB12093.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <TYCPR01MB1209398B324FDB1691D80545FC2B32@TYCPR01MB12093.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::9) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CH4PR10MB8050:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c317129-568f-43fa-6a1c-08dd7b749e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkNnUmZ1YzRSc2Z6YzdHZG1rMW1DODJhdEpoWUg3VHBvSytFMUhjOGRkQ2NB?=
 =?utf-8?B?VDZEWFJUOTdxK0tpSStDZE51dFZoaDRlcEROVlEvWmJKOVM3UlY0SzVrelg3?=
 =?utf-8?B?b0t5S3VBNDlTY1YwNDJQV0ZTcHBTT1o5eFh0eVNmL1RVbGNVQnp0VXRRUUFQ?=
 =?utf-8?B?TE1MbFdmL2JVVjd1Mk9wc1lSTnFuS0FRbS91TG84Mi9Dc3RkUFVLWWZDNmk1?=
 =?utf-8?B?SUExMkluUkNOK1ZoVFlzL2ZtSzh6M0RDdkNCenB6eThRUkpNZXZKUFMyT1N3?=
 =?utf-8?B?Y1hyN3FPTXRQTmVpL05pN3o5ODcrcjllaHRpTHdMUWEwOC9QRVVnTUhRVElZ?=
 =?utf-8?B?VnhiSXFTMVBUcGtOL0tabW83OGN2MlFaRHV4R2djWnlNcjIwTVovQ1BaZ2hY?=
 =?utf-8?B?WGRRZnBiUDMrdzE4K3JEem9TTFVRR0dRdUZNK2pPUGE4b3R0RTAxVitwLzFQ?=
 =?utf-8?B?YXlSQlRyVkN4bFhQSVhnSDhwbSsrblRJTFFTT2cxQmFBanI4bWVVQ2hOMS80?=
 =?utf-8?B?aG1YR1FFRWdCRlgyU2RXUjRzN0FnWm05L0pIYWtBMmxGZFJLOGhkM2xUTWNI?=
 =?utf-8?B?bnpWT3gvS2dwT3VCQnJXMWhCR1lSanBsR3djWWZQYjBsQVdmMU15WEpIZDhJ?=
 =?utf-8?B?UW9IRHNuNFEvTHJFaGhMUk8rTk9sTTQ5ZWhsNHhBVmw4V3NtZkhDdDJtc3BG?=
 =?utf-8?B?NHdmTmVUMHdGVkJHS0dRb2MxcFhtcWhNQWFuWFhiYVR3SkJSVG5SbExRUFBT?=
 =?utf-8?B?Z0ZaV2xaN1VJa0VSK0lpTHRPM0s0SUE2VjNGWXZiQmNzajhDdHBhSllqeWtT?=
 =?utf-8?B?QStqSVl1cGFQQVF6UTg4dnpETXMwdVB4SHBZM1U5R0hWaitrbW94K3JsbWNh?=
 =?utf-8?B?UkV2Ull3VWpVWDNJQ1Q3am1DUEhPNFU0enI1RGhGcTJLSEtBYW1oN0NrL1ZP?=
 =?utf-8?B?VnEwZ3ZBZ0RFMGQ4VEFZVGZWdjRMVmVySDREY0dERnBPL1A1TW9ZaGJtbm5v?=
 =?utf-8?B?V090bXYrbWt3SjVQR0xmcGNyYk50TlBjd3ZDRERMZmVQandxMHBaVDJPL3ZF?=
 =?utf-8?B?L0tyazBpcjdyYmJ1TlowYVhiK3RuQUN3L2VMT3pDaVkyaElBWTh5NStSRmhw?=
 =?utf-8?B?NnMyVkcrYXg1Z3V6b3dzbzV0RVpOdFBOMHYyNVg0T0kxT3BlRG5JMVZCUFZX?=
 =?utf-8?B?enNiNXc2QlpEZW1rQVZlNUF1elV5dnZ2MlZVM241ZjE0U1FUR1RkZmlIOFpk?=
 =?utf-8?B?UXhKTEtxenZWSkp1REYyb2w5YjBVY2xQZGl6bVcrL1BhZVhWN2JtUE9taVkw?=
 =?utf-8?B?eUFKUnkxT0p4TzRzY0hqNmVTY2YyRDNLSlo2STcrVFArUW8yci9Fa3VzZ21r?=
 =?utf-8?B?UjJMK0pQczVJV0Q5WXIvUmMzOFFQd3F0cnV2RHFLOVBQNTU2THh1UWprL1Z0?=
 =?utf-8?B?WlI3YUVpakh4ZWNmM1BydFVLYnVmWGc0SjRVMFQrNzBoc0NvTXVQbG1wUEZy?=
 =?utf-8?B?YWRDTGhiVFlsQlc5S0xTNnMvbUZZMUhuZEVqYU8zV2VlSjFBTWNKemNrOVR1?=
 =?utf-8?B?d1B1NFpSVzVuMVRvai9XTjlnaVhsY0c2QnJsOGRvbFdXMzhrUURNRkw5UFl1?=
 =?utf-8?B?UFVBZ2FsblJ6NVRwNTg0MEh2R3p5Tmx2OTE4ZU4vWXRIQytkVzA3RERpb1FM?=
 =?utf-8?B?eEwzUFBlcFFhaHpEZHBRemF3cENxbkFhODY4c3ExOVk5MmtUMnpHYUt5eTU5?=
 =?utf-8?B?US9qdElqcFJMY0liMUVjOWhMQTdVN0p0MFYzSGhQMit1L01wMUpxV2xOWkNh?=
 =?utf-8?B?ZzZLd3FwVWZTd2lEd0ZJcnNwQlBEL0ZMdTMvakNHZkFZZlp0cVVSQkVDT3V5?=
 =?utf-8?Q?eQIQYEveEmTA1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXhXNjdLZUs1aDBvcDNjN2ZIanVvYnFZV1RVNEdnZWhFeEhtR1BzSFF2ZWRv?=
 =?utf-8?B?UXd0Tk9uWVp0MndhTzJhZUdmVDRCcVVvQ3JSWndtQ0REU1VIczNnS2RQMUJE?=
 =?utf-8?B?YXF6MEIzNUtBek1TNHgwa0VlbjJqTEV3RVEwUjZvbjlKUnJ5Z3VsOGZMN2tG?=
 =?utf-8?B?VVp3K1g3R1dwTUg4VGtYc3IvaURhdmpscWwwUXZyTEx1RlFlNHNzZVZMQkd4?=
 =?utf-8?B?YzdKRDhudkZPdGcrMmxucG9QejdwdjRQTjRVWVJJYW05QjE3d1phdkV2dm9r?=
 =?utf-8?B?UVlzSVpkOWVDcmNmakkyRUllWXYzbjVFaWNCa2pKaC9YS1pRMnJGQU1YNU5v?=
 =?utf-8?B?ZUlLeUl5eUhOcEdBRit1ODc0RGcyd0k4Snp1Z1VqQ1VhenpwMG5WNzNDUXJ1?=
 =?utf-8?B?SU05ZmtDZFZpN1JoQWFMM3hRUzY0UFRXeTlTRk9kQUJieG1tcVpwVUgzelJp?=
 =?utf-8?B?ZEVLUjVJdGlsdW1TS2JQSm02VjdoNDZpclFqTWdjcHErSEpSc21TazZFUStj?=
 =?utf-8?B?SUJEbnYxTERpQ0l1SDFmZFEyNXEvTWxsUUlsNjFHS1ZWNlFVZkdXcGg4bnNk?=
 =?utf-8?B?OWI0MEtNOVF5TktabkpWYkJCb3VYTW90ODA4SFhNQ0RDZngvLytpMmRScURh?=
 =?utf-8?B?VC9ReWc0T0tLeHRzZk1MSm9oaVNqWXN2MlRWRWlyc011R2x4ZmQ0RExkalIx?=
 =?utf-8?B?bDQyK2NtVGhxMDZvbGNJRWFFL3ZSYnJmd0xQMHFpUUFaZUNyMTJjSEVjb0tK?=
 =?utf-8?B?cUR2Z29RTnB4dDFDUmtkRnZ3S2QxMHVOOHdTVkphanllb3VpRmUxdUdyMEh5?=
 =?utf-8?B?bHI5bUpLcnlGUVR4T05KV3RVSDQ5SlZxWEx0VXRoTnI4MDRMUmIxTDF5WTFk?=
 =?utf-8?B?MlBxelRQYnIyTVV1MnJNZk9NK0dDaWJtNU1yNTZjWjdDTnFOdWFIQzE2bnpl?=
 =?utf-8?B?RC9IUitmS0x0RGJMckZxdHVVK04wa1JIQmhEWHVESDBLb24xQXRYTER3MkZ4?=
 =?utf-8?B?Tzk0RE4zWmdVcmwrRGlZNzY5YVBjZGtlMUlkbkpUTmxwbnVMMFl1Q3N6ZHFn?=
 =?utf-8?B?MmZTeHg0Ymh2KzFHcWY0NHU2WTNCbTlrUjJFYU5ORUxaVUMvY3JGbUZPY2s5?=
 =?utf-8?B?YnhJUTFRbkZCajM5SHF3OGxpRW91SGdmWnhBbW9UNi83R2dZakJpU3J2WjVK?=
 =?utf-8?B?S0tUbzJOWENUM3RJZmc3cENYZk5OZ2ZlS2lPRUZ2bENmL3VPLzVheHJnVklr?=
 =?utf-8?B?bjhUN2kvSi84Wll2WmxQSXd5bFBUQU9JZVc3Q1pEZ3JkT0ZtMHdrS2J5L2Fy?=
 =?utf-8?B?dlNGN3dDT3JYY1RWWEYxSElWZVZRZnJtRnQxWCtSZ1lVclJqelVKeDNXSXVN?=
 =?utf-8?B?SEdRVnRDVVMrZXhmM0I2QWh4QlF2WVBqWjA5L0lCZnk3TXFQTDRudU5iNHVV?=
 =?utf-8?B?Zk9GVk5xdEl0UEZYODNkVlF5bjFtSnNZaVpZRmdzUW0ycnVEOXZSWmZoY3ZG?=
 =?utf-8?B?RGNjQVMvTUljT3RDenR3OUJTN3NzNTR5NklUelY2NjVGb0pEOXduU3hnc29B?=
 =?utf-8?B?WXhWVnQrMUI1bWtWUWpMN1FhQndkbGlVMTJmaGVEV0pJdGxBd2NONG9kWGhS?=
 =?utf-8?B?VmUrdXkvQkZTazMvdVFUdUJrLzNYMTZnNmNtTWVhbFg0dzlFRUVxb0xBTDFP?=
 =?utf-8?B?MkJIN1FObUREcHl6UUFtRWg5WnZMSytKdEpEWFRHM29zY21qYW1nSWtLWGFI?=
 =?utf-8?B?bDM5OG5xa3ZQWjVoMExDTTd0RXNRRkpmdkJhZWRTcm1jaFdjb0N1NHg3d1NN?=
 =?utf-8?B?aUpJYWlHWHdZMFNsQjBOMDRra05qdlNlMXhCVjBIRGdBTEpERVY0aXk3czkv?=
 =?utf-8?B?dWx6K09LK3RoTmpNNE1BdzJJZEdtcWZ0V2UvbHRveFRLOHhzRnRsQUE3SnZ6?=
 =?utf-8?B?UE8vcHpWaEhaeGRUY0lpMGZNRHZRSlZUZWpyTkswWVkweTBDRFd0Y3RMRkR3?=
 =?utf-8?B?eW1uREJ0bDRpbWMrLzh6YUlCQ0NHR2FNV2lqYWR4bmZQK0tRaDdaTzBhYUhD?=
 =?utf-8?B?QzZUdERuNWJxS1ZPL2k4b1pNNHUwY3M5N0ZadVRNdjhwR1RHUkxWTTRNRzBE?=
 =?utf-8?B?VnA1bG9aU0lNYjd2MXVRQlBHU0liZ3RBbmRPcXNQU1R5Mm45aWc4bFd4SjNZ?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u4kDIVZOxb92pnWQwkxObrEsWnW+nQkP4Idg9YEs08evHvxKCpBt4cnVNuGJvKYregf8y5CwDwtKjSYPYsw76Xa+w1H/NDgCWetESS/xuHJf5Wwuh6muJDnmkygvOex+zSuVEg0FCFAFSixdN2v1cFx4lIKSBHe0YITBJJYwf+J4lYFofDscnT6OwbV4Ep5l5hU+WlOkzoiu888pGOBhNQoNIFI88WEGvQBXIdXD7eO2BgpSQRyTc9o6pKV2zfRdwwzcOpD+yna/X6xg2bQeEWaKSmtCPf3wUcoe9IxBJPlsM2mp4nCTbKkj3IxAnA7frtRfXWl3G6L+OXYeGyH7wVW8gDuGh8X8utyyqDErRuWlyQr8VVYQvurFo0IsaDXAEPgly56VTGscW41CbbhaMVtZyTTgXTqzvqr8CvD1XaGdh8V5sszbx/+RJwebdsoC0uzswb54407ruduDR7uHLNM/kTAqVXnvF/Hd4kCf+J+KRt0xvGg6BZ+ZmsWnJW+yiH32GX33HgAk3eM7pTCJNuAM4G/Lb7bt7of2NVZ2UGSgXG+uBAEXYabbr2hK2Tow9yiMtuffMvOn4puXJQK51ZRnkPVRfmsIIyXc2i5ReVM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c317129-568f-43fa-6a1c-08dd7b749e09
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 16:51:35.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rTV8+QanZYGzH4rl3Jazv5NH7cV72nLNncKRczCdt3f8YpAomQGbrhzMLkBoWAVFjeMDeBa9GWdP0kXTIir8AwvWlcE1ZUirPkJ2qDAs9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8050
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504140122
X-Proofpoint-GUID: XV6uRjZQqA7AMJsjacgkLBfaLm6KhTck
X-Proofpoint-ORIG-GUID: XV6uRjZQqA7AMJsjacgkLBfaLm6KhTck

Hi Fabrizio,

On 14-04-2025 21:13, Fabrizio Castro wrote:
> Hi Alok,
> 
> Thanks for your email.
> 
>> From: ALOK TIWARI <alok.a.tiwari@oracle.com>
>> Sent: 14 April 2025 14:46
>> Subject: Re: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)
>>
>>
>>> +static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
>>> +				     unsigned long id)
>>> +{
>>> +	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
>>> +	struct device *dev = priv->dev;
>>> +	int ret;
>>> +
>>> +	ret = pm_runtime_resume_and_get(dev);
>>> +	if (ret) {
>>
>> nit: it will good if we check similar to reset-rzg2l-usbphy-ctrl.c
>> pm_runtime_resume_and_get -> 0 on success, or a negative error code
>> otherwise.
>> 1 → if the device was resumed and incremented usage count
>> 0 → if the device was already active or successfully resumed
>> if (ret < 0)
> 
> No.
> 
> As you can see from:
> https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/master/include/linux/pm_runtime.h*L444__;Iw!!ACWV5N9M2RV99hQ!Ly8gpEBQHhYXOeCcKQavVHfM1XUSy1IubKnHjuQAgvfkK0jrMXc0ebBcvFRvNDcpaJwoUOk1JLLuzih2fLd7JReyapWOouY$
> 
> pm_runtime_resume_and_get returns a negative error code or 0 (when
> successful).
> 
> The same explanation applies to your other comments.
> 

Thanks to you for the explanation.
I got you point.

so We are keeping different styles of error checks:
In reset-rzv2h-usb2phy.c, we check using if (error),
Whereas in reset-rzg2l-usbphy-ctrl.c, we use if (error < 0)."
https://github.com/torvalds/linux/blob/master/drivers/reset/reset-rzg2l-usbphy-ctrl.c#L148
That's what I conclude for now.

> 
> Kind regards,
> Fab
> 



Thanks,
Alok

