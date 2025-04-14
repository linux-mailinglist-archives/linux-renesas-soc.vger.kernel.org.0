Return-Path: <linux-renesas-soc+bounces-15919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 128C0A884B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 16:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23D113B94B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 14:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280AC28BA92;
	Mon, 14 Apr 2025 13:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d8bFB+MN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J0Pbp7HI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F50423D29D;
	Mon, 14 Apr 2025 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638407; cv=fail; b=oXydDgRd7QXNJjRGSlkpnGmO477WSlhkGq6TXJNvSgAg8y1s89TEjc/IjT1l7lHtgnUdwTxSgj2S/X3zPYPWa1apCHvUfLfxyD2xeNYVO0DIzyrq8f6ZfHwj7SKLIl3iRC1KR25WjtcxYkAFiKIE4IXblXqWehonoByOtGVtMyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638407; c=relaxed/simple;
	bh=UlOwe3JnUWBYH/JnIoJmn7LIXhdPPjUVce9EHDMr2wQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SkhazIb1y6EG5aQE4+ErMR93mwaP3MtcxjNTaRXa1MlKsEhqvJYkxxx1MbfspKduf17EZZXTY7vFQpGsXxTTmZVaJJpGspxg3R0qbny7dt+nRBDdhcak5DVw7w5ExAnVPTeDkxksJeSy0+W+rZE7dQB4js0dj/FcAmF7oR4w06o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d8bFB+MN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J0Pbp7HI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ED7ZFT003145;
	Mon, 14 Apr 2025 13:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=C9icYFq/8eIB9CpFsDT3D3cMyI+dAmu9GwHhBrsnAao=; b=
	d8bFB+MNBD0ZTCavf+EFxu2UFUSsTXHNGzus5reG+B+2QjwjOKniPFlvAo/yVMGL
	CGLVms7k4iEktlBGkBb+9vShYSE6uW01brkKbWW3W5oCbGtMU3kS7f3Hlu1bSVnb
	Ea6cZ881lElgzIAQbuD7x8crZTQLJ5kJU+svXDWnC26rtccGgLQWe1vCSclOIODo
	ncL3yku1whaBsUzmydnmRB3JtqfmoQi4dBj10CI2e2VG/up45pJmQPbs5aKisGaW
	8QM7sMRynZWF3v6pbluiXNEHXumHUhfuOIzVASNYdyhxQ/3e3dTXpEx6+xwZVhNs
	5+m8BT3eAqWrmnj5A7R6mw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4612y60355-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 13:46:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53EC35FC031030;
	Mon, 14 Apr 2025 13:46:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460db91qdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 13:46:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zvz49Sx/FPKwLhdtL7D6UFh9eJDr54pAYhlqZ/VZrg8wHNo58R6329jfqNRO7Nz0maBQFnD1On0jQP76k7KxfLr+2p04ECvO/w0hpP2xkiPe01JI7vC577FAqwZZ4gJaThpBgjX0UTSsVdxxr9t9Rk9iu8/0EoMzHGZPbAV6cMTRH1qRBJEmPF+OfFIXZn5E5eX89pvPCLWAlMY+oig4WWnArYgLlJUUcYMYG67YlM/HmIglys0TzQtla4mf8unWLAKmW4547GFh5lEIHBrEUdQN4kRaZ2eR+XSP1a7CFluSqvmfuM6dk0z/zO2zXTtBGGWPSFf4qQqm0sk2m9Tr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9icYFq/8eIB9CpFsDT3D3cMyI+dAmu9GwHhBrsnAao=;
 b=Sgja/UhOa0E5vyYHcMwablUy+LMXfx8dA7Ha/cJgKFD6h1t3y/dA4xP5kZsMUqr2eGW/wJWnmcCkfW+q8DALs4CYJVcZ+/bcE/25wZMsjCunA2l9ygBJ0t+n+whWpeUHTg7FqUcbUJ3VgWFNcIy+jbJQ059dTn0drAWhVGQ84+a54RicLbgh0Hsn1EBKZ73VmL7+hhrmvqiDEoJkEy8gXqlU6hh1lsxfMeCHLVZw3As5OMX02JVrIl+OZ7SBcgVoXI9uMITuXXOYBJ0cAEo/mBBwfF32prZZpOmaZ1I195T6dH53EWB20VskOvaFIDQkTSiKf6ObOuQnWCa2gB9O9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9icYFq/8eIB9CpFsDT3D3cMyI+dAmu9GwHhBrsnAao=;
 b=J0Pbp7HIMfL856GtAcqgRtLSKhXsQCitbHUlyTJfknvrmzm5/LYU7CWC9o26VnuplmVJJMf0n1wuMxjE9nlbYGvLnAxx4+yJLopoz2gz25xhKDR+h+MdS83+YwD4ZKiU5/N+gM+cx79i+1EqUGF1vu1WSNKdfHhqcQexx7sK1b4=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by BLAPR10MB5058.namprd10.prod.outlook.com (2603:10b6:208:320::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 13:46:23 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.8632.035; Mon, 14 Apr 2025
 13:46:23 +0000
Message-ID: <9c32c9aa-3895-4969-8a33-059c4ad93143@oracle.com>
Date: Mon, 14 Apr 2025 19:16:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Renesas
 RZ/V2H(P)
To: Prabhakar <prabhakar.csengg@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250414130020.248374-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250414130020.248374-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0198.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::7) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|BLAPR10MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: 835ccb31-64ba-4833-1d9d-08dd7b5abe83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWM3Z1gyRkFIM2FSbjg0d0JoTjVpUU8zalVEMnJiQ1RBQlZqMDZzZ2UxYkpU?=
 =?utf-8?B?WTJiRnJjMVRJaHdyWVZKK0xVZGNJZUR5dk53dVVONThKOXFkQit0SG1IcVRq?=
 =?utf-8?B?Sm9mdUx4NExmK09qSHYwS1dBV1p6RUJaQUNqWkhvejNFazNiYjlmYk55dFd5?=
 =?utf-8?B?UVVLNlpUNWRxSXFjQks5UkI4WFVCRTRLQlFlN3E4N1d4TldnRHJaZVdmNkZF?=
 =?utf-8?B?UFNiT0daUzBQTnVTMC9Ec2NtZ3hkeGFrMEVsVVlJcU9rbTlVR0w4ZmhNMEZk?=
 =?utf-8?B?WmlNZndPeVJ0aFN3Q2c3Um1aV2VVMktmYTlWRFcxNXVVeThKL1pBdEYwVkl5?=
 =?utf-8?B?OGl4N0RDMmZmNGhiVGRjZkR1RXZaTXl3cmRvRm9nQ0xlZEFZaldUeldxRUFK?=
 =?utf-8?B?U01neTJqVnE4eVNaVlF4L1hXRXg5S1BLWEhFd1FLRkx4bkI3MStnWTdDTjFN?=
 =?utf-8?B?U21taFRVYnAxVHN2OXc4S3ZrRGVQVzNkQlZEdHJWdnU5UEdQUCtsN1dET1N6?=
 =?utf-8?B?bUNGdnMwLysxRGt1QW5tbUp5YjNtRm5xWllvbERXek5CUVp0RDBIR0Q5UEli?=
 =?utf-8?B?QWRrT2doZUw5WnM3UWVpT2tPdUN2eHA3U1IzR2hhdWRLY0RSS1ZGVW9IQ1lS?=
 =?utf-8?B?ZGVMdVhtUlV6ZXFSd2JtUUIyUnpPQzJKR2xkU3F0ODg2bmxyc0tpd3ltbTF2?=
 =?utf-8?B?QVpydjcrSmRkekJsVXgvTWorSXNXb0hUeUY5YWU3dm1jeU9HYlAvLzBnclRW?=
 =?utf-8?B?WW1SWmhHUDhNMlF0dFhuQVFybzhVTFNheFhPcnAzSmVLbE9QUFBxcy9Nd0JV?=
 =?utf-8?B?V1NPNFNvbU9GNWFtZTBpd3JvK3VJRXRWaEpESmVsem9uT2k4QjFvUGpqam9D?=
 =?utf-8?B?VThHRWtHM3dFVlJJWk5DQUE4NzNnWGVUQlpnYUpSbTh6YTdMQTBoODFPVlZo?=
 =?utf-8?B?UlRuWU5BdnpsVVA1ek15UGhjM1JoeWxMcHlmN0JNUk5iTDhQYXNSYjhpTGdi?=
 =?utf-8?B?SHJTN2kzcWFEVHcwQTBjOGF1MlByd2YvdWs4cWdteDh4VVIwR2tkeVQrU2pK?=
 =?utf-8?B?UUFhSU0xNGxVTGJ0amJ0ek0zbU95UmVPOXdlbTBTZGhtUHQzV0w1TTcxeE1Y?=
 =?utf-8?B?RkFqRTkrWXJYYS9URHZzN0pzTU9VeWF2cndrM1c5QjFjZXBFVU5YYndESGsy?=
 =?utf-8?B?OGRpSXdYN24vV3ZqS2ZZeHJ5WFp3T1ZvRVVSTGpsRXZGOE1HUytmeTdodFpK?=
 =?utf-8?B?c0JUSkhpdXNwRks0SGdNbm1UVzdsTnc0Tnd2TzZUU2JqVG5WVGhmSTNhTldl?=
 =?utf-8?B?K2JYZE8xVFJNbWNRWk5OM2xXMnJ1QjMzNzBnQ28xR3ZCdzExaks3N3ZrK1NC?=
 =?utf-8?B?WjNBMjlWZFBvYXdzQ1dzTEdGOUhYYWw2YjE2MDNHRFM3UnhzN3NrUFFFdUM1?=
 =?utf-8?B?enlsMVJpY1h2Y2phRHhzWXQyLzVtVjYwU2ZlcU5rUlR5cjQ5Sk9tdHpKMkxp?=
 =?utf-8?B?T05uVUx4QXBsNGQ4Z0RLSjRBS05NUi9QY3pUb1lvK3ZTRUZzM0l1WHF3ZE02?=
 =?utf-8?B?YVVxREdtMSt0Wmp5K1RFM1RvTWc5VnJWWGJZb0pLS2I5S3Joakhwd0pLNmE0?=
 =?utf-8?B?T2pHTk1QcDNONFEvWVlNUitPVUpFWFQ1MEg3STd2Y3VHNWRWb2xqSUw2T051?=
 =?utf-8?B?Q2VLaHc3a1c0ZzgwK2dwNnQzYVNWRE5PYkZsbHNaU1lMQzAwZUZpczdDU0lP?=
 =?utf-8?B?Tzczem52MUVjSk03UUNRdWpLTGNPU1pHWldZUkF1MklQbzQyTlA1a3l0djZG?=
 =?utf-8?B?U2ZjenIxWE82OUZaZkNqamFDeDlITFV0OTNIUnZLZXhCa0o0aERmYkdZWGZC?=
 =?utf-8?B?NkZGQVBqYXM0SHcyd0JOWlRwREM3dmFIdTF4RmFsM0REZHlWRmhIM3liSTg0?=
 =?utf-8?Q?S98mCZqjPao=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXhDV2JlUTdDWDJTV2xvZHA4ZnRHRmNJaXYyaDZqRjczZUZ5L25uaHlJYVBG?=
 =?utf-8?B?OElER2ZDSGIrTTZZaWNoVHN5L3lacmJ5UlRlYWRTdldWV2I5cmVqbzM0c2dQ?=
 =?utf-8?B?eHV5Vi9ZT2EyVjlkaGtTTWlhWVd3TE02bEQ0cDhLUk9yVjZPYmJHLzRFeXBo?=
 =?utf-8?B?d1htamM0TmxQTWJ3TVFuekx4QVZDbE1NeExXNDJhQlpMS1FpQWhTS2U4WlBw?=
 =?utf-8?B?WjVLbUIzekorMlFFVkowZGNsZWlnMzBVbXMzZ1R0aThnSnFTb2pjakZocWtr?=
 =?utf-8?B?aExncjBpR1J3clVOZjhaNkJUYmNvbFdlcW4zdFBzeWxqQS83UVdvWTJ1MXJR?=
 =?utf-8?B?eFgzSFFacTZ4MXlwNlpaNFlYUWMwUVBBWDE3bTRwWUxaQ1orY1k1L2dTaXBI?=
 =?utf-8?B?Z0NISFpTYnViTHVNd2hJTXNOSXBSUDBUdzluR1hVS0VFckN4cWJwb0piMWp5?=
 =?utf-8?B?NW5nTEljSmR3Ty9BUFZhT0h3a2dCaGczQW1OT0x5TUVSd2U3bEpPR2xQQVUy?=
 =?utf-8?B?Nk9XeFNWTUt6ZUVmdTg0SCtHclBBYXlDam4xOXY3SDhVbEtvQTR3VEczcVFK?=
 =?utf-8?B?NHkxaW94LzhTMGkxM2tCY2RpaSt6aVlhWm5vb2I1UitBK242UVNJcHlQdXZP?=
 =?utf-8?B?TEZXWk8zaHFOZVlpbjBKek5MY3BOVzN2aFROZWtkZWpFY1RrRDJHbUNBQWZ2?=
 =?utf-8?B?Z0lYMTRGalRoY21HdGV1ZUxnbTJjbWJGNm50K1ZVYVBkM1o2SFdWVU5hY3Zh?=
 =?utf-8?B?WUNVcnVxa2JZV2ZpS2sycnd1bmNMeFpVZGEySHlxRE9FTDNIYXB1bmZTK2E2?=
 =?utf-8?B?ZlVUZ3NVZE9YaFhHVm1sYUNQTVM2Vk45eVdJWHlnTmczM3JHb25Qc3VIQk5D?=
 =?utf-8?B?bmZFcEFpU1JUWHlLN0taLzBQTDhGVnVIcjIvMXhtVEFOQnVjTlRsNDJmSXVP?=
 =?utf-8?B?R1lzY1lpdVd6RFpscjduc2VVbmpqbEs4ZHhTbXUxVExiVW52dFJkYnZidlZW?=
 =?utf-8?B?YUZQZ3oyc2RrbllhMGdpbDRaV2lWdXd2RDlUejQ3MjhyTXYzV29rQmo1Q3Vo?=
 =?utf-8?B?dkhYSXl5RDRhSUo2K0w3empjcFZreVpTZkN3QmxJYy9nZStYZERKMXZJa2p0?=
 =?utf-8?B?SFN3MjJwRStaZjlnOW9CelcxamZnL1hCekFZMm9adC9iQjlUblV3bFNhSERa?=
 =?utf-8?B?d3JNeGVPaXF3NkZZNU1IK3VkUVFFb2VhbjVBZytIV2FReFpXOFEzSjB1R2JV?=
 =?utf-8?B?ejJoSi9CQTF2WkJxWlY0MHg1QjFnaU45UWlmOUlOU3U3VitGdFVQMlBLbG1S?=
 =?utf-8?B?Vkx1ejM2L3dQUWVLTkI3ZnBGbUpYWVVDYXN3L2FWMEcxbVJ4blo1Mlg3bndt?=
 =?utf-8?B?UmwybmhOTndDdXcyNGdTMHhoYXZMYU1OYWV2TUxLWVlDMHJWbHRjalZ0TmRY?=
 =?utf-8?B?QkRWaWtLWWtpTDdoL25CZjdsMWZXQkl3ZlIxb0NENFJkdHB6TUlHWFVqUzVF?=
 =?utf-8?B?WDF0RklMUXRhUHM1NUtFUCtaNlJNMEtJWVRqeDFGU2ZJWjhsTWJMTnp3L2Vq?=
 =?utf-8?B?K3hvTHZKLzJVcDRibFRZMllveDhabFdlRjNnNjVpU0o2WHNHWXQyTGdRaUNG?=
 =?utf-8?B?cEpmZG5NZ1c1UWRwMTJlcGwrcVVhVm1OSDRBaW8yUnN4Rlo4MEgxcjBIeXhm?=
 =?utf-8?B?N0JqUE1WNzB1UG9XT1Rqak1RN1VwZUpDNldQcFBCeGY4T2dJV2d1V00wUHdE?=
 =?utf-8?B?bFYxaFM3NjhUYTJtQkcxeFlNVHRuaHprdzQrQWFjQnpoQ3p5L2xHN2dKSTY0?=
 =?utf-8?B?V3dJSVZsNHRGNDhXbGdSdFFpT3h1eGpXeFlUZHJVUVRSWkZyR1dlNUpweExL?=
 =?utf-8?B?N2FxamZFalBBNkhDVmhSMlZ6UzRKcVRCMXZmRkduc2Y0alZwSVRwbHVueVYw?=
 =?utf-8?B?WHlSMDRzSFhDMmoyeGlRTkdQMmMybTNjTmRjL3FaVFF3NXhZdFJHZ3NzNFVB?=
 =?utf-8?B?K0JtaFRleTdLdFFucFZON1g2eHFyMDRWMmI3T3NXd1NoVnR3N3ZxL1JjZk95?=
 =?utf-8?B?QnZRbEFWb20yT2xJOVdHNE40MTROTEErQklaZ0dib2dwVEJrVm5xV1FUR1Uv?=
 =?utf-8?B?S2lWQlBHbHJqSFhhZUc1L1RVK0hObGdtdktqU2NVUXJaNnUrZGplWUJKTDBS?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BgPo3I5LXIh4iQG04QI9ZoiTPG4HqhZngwZppfFsAaO8iLwypGWrjbfnzrCl+hQnYu3qNE24+9ueTKnHh1tVvjxmUnrkAYqP5A2hK6A3yX6vg50yIve3syQPTq1e6JkGzfn2K+moQAQoBHn8+r8zhdxAS7bF4UnzrjGJY29GvnIpBMQpRA9i6n5ny5YB6qGofqi9vVbUXY5mzjIJgHncVotznF3m7gBUpSgmtiaffEd8kdpxgXp2AeaYyCgKnvS8fJc0IojbYYfzDrnaAyuKi1ed2QcJG02G7GFcecfTIaOGgNi9y5rBMhIzyN+qxV8qn5RuzcVQUBFj/R43M+BBoWR0epxEWxotQRfWkKJFVJYvNaiGyw2KV4BTARYkORrE77xwLWR0f6VejEFL6nFVNr9/K+Nx4fBqEha/dmiH/Hp65GbhOJ65Gip4gJcFZ8i27GSvhI9mzsD/PCfS79B7aPdKzOBDzhUVMfPTgMvmZlfKtyBfmghd6wp4xIAmP9+xs43P9Txeuw/9xJImunbpZoJdhQq09921BMJzNDoeudu0XLEsFR94FsWaFKn6m03SWnGXnYe0oCrJ+anw2GjF8yOlXLUbuKjS4CP3vDvU3Xs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835ccb31-64ba-4833-1d9d-08dd7b5abe83
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 13:46:23.3209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akSHgqIsjnVJ6NIBsWs83yTvEDOY1mEHs/NCJd8aIV2qxAXwIE9N4NHUaHIz0WeMQ4jXCesaKGa9rt1tFZNeQ8Ap8FTSJzrobbGBmtxwwqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5058
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504140099
X-Proofpoint-GUID: thPGJVXptErMRs63yPIhjVR2TSca0sl_
X-Proofpoint-ORIG-GUID: thPGJVXptErMRs63yPIhjVR2TSca0sl_


> +static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
> +				     unsigned long id)
> +{
> +	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret) {

nit: it will good if we check similar to reset-rzg2l-usbphy-ctrl.c
pm_runtime_resume_and_get -> 0 on success, or a negative error code 
otherwise.
1 → if the device was resumed and incremented usage count
0 → if the device was already active or successfully resumed
if (ret < 0)

> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	rzv2h_usbphy_assert_helper(priv);
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
> +				       unsigned long id)
> +{
> +	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
> +	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(dev);

pm_runtime_resume_and_get -> 0 on success, or a negative error code 
otherwise.
if (ret < 0)

> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	scoped_guard(spinlock, &priv->lock) {
> +		writel(data->reset_deassert_val, priv->base + data->reset_reg);
> +		writel(data->reset2_release_val, priv->base + data->reset2_reg);
> +		writel(data->reset_release_val, priv->base + data->reset_reg);
> +	}
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
> +				     unsigned long id)
> +{
> +	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
> +	struct device *dev = priv->dev;
> +	int ret;
> +	u32 reg;
> +
> +	ret = pm_runtime_resume_and_get(dev);

pm_runtime_resume_and_get -> 0 on success, or a negative error code 
otherwise.
if (ret < 0)

> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	reg = readl(priv->base + priv->data->reset_reg);
> +
> +	pm_runtime_put(dev);
> +
> +	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
> +}
> +
> +static const struct reset_control_ops rzv2h_usbphy_reset_ops = {
> +	.assert = rzv2h_usbphy_reset_assert,
> +	.deassert = rzv2h_usbphy_reset_deassert,
> +	.status = rzv2h_usbphy_reset_status,
> +};
> +
> +static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
> +					const struct of_phandle_args *reset_spec)
> +{
> +	/* No special handling needed, we have only one reset line per device */
> +	return 0;
> +}
> +
> +static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
> +{
> +	const struct rzv2h_usb2phy_reset_of_data *data;
> +	struct rzv2h_usb2phy_reset_priv *priv;
> +	struct device *dev = &pdev->dev;
> +	struct reset_control *rstc;
> +	int error;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "failed to match device\n");
> +
> +	priv->data = data;
> +	priv->dev = dev;
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	rstc = devm_reset_control_get_shared_deasserted(dev, NULL);
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc),
> +				     "failed to get deasserted reset\n");
> +
> +	spin_lock_init(&priv->lock);
> +	dev_set_drvdata(dev, priv);
> +
> +	error = devm_pm_runtime_enable(dev);
> +	if (error)
> +		return dev_err_probe(dev, error, "Failed to enable pm_runtime\n");
> +
> +	error = pm_runtime_resume_and_get(dev); 

nit: it will good if we check similar to reset-rzg2l-usbphy-ctrl.c
pm_runtime_resume_and_get -> 0 on success, or a negative error code 
otherwise.
if (error < 0)

> +	if (error)
> +		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n");
> +
> +	for (unsigned int i = 0; i < data->init_val_count; i++)
> +		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
> +
> +	/* keep usb2phy in asserted state */
> +	rzv2h_usbphy_assert_helper(priv);
> +
> +	pm_runtime_put(dev);
> +
> +	priv->rcdev.ops = &rzv2h_usbphy_reset_ops;
> +	priv->rcdev.of_reset_n_cells = 0;
> +	priv->rcdev.nr_resets = 1;
> +	priv->rcdev.of_xlate = rzv2h_usb2phy_reset_of_xlate;
> +	priv->rcdev.of_node = dev->of_node;
> +	priv->rcdev.dev = dev;
> +
> +	return devm_reset_controller_register(dev, &priv->rcdev);
> +}
> +


Thanks
Alok


