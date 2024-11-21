Return-Path: <linux-renesas-soc+bounces-10648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 301509D460D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2024 04:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5E6D1F21F5D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2024 03:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1591304BA;
	Thu, 21 Nov 2024 03:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OdXdjF/T";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A5+xiH/v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964FE55C29;
	Thu, 21 Nov 2024 03:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732158435; cv=fail; b=nO0tWKJ+RkcekWjcBzxO6B4tyQ+nJ7XA8/TzfX7RIen6BPU3cEYtlLwxUVpuGUAOVSdc7DQQoNQpQlEilrCDBHdgBQJMq08S0d1ZxyMnTVtSssSHsJG5b/tYEGIfIuaBZtuy5cn73JW6GnPrJ9Bc+hKmF6Et8h/jbPRi4dDLojc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732158435; c=relaxed/simple;
	bh=UajOXdyVGflaVmjcD3t5RYaYxS0mzbZIf91W8re6/fU=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=Gg10lLhpG6d38rwR8DkMEjW1891hMo6gVhyxcG1B/9tzFFwwkG3mImhyJCSIWbXCpxm0KHeeeWiMz0HKQd3QRUkH4OVo7GdpMUTazO1AFudRg4wpukVNvavVLnx3dfLUDdgQhQ3lFIKNC37IKR6AF2y/b2DdjePDLJ13OlQi5w4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OdXdjF/T; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A5+xiH/v; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL1fjYL009390;
	Thu, 21 Nov 2024 03:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=kEZtrT4LRQlb4x2Hx/
	A+JjBqzGwmMQYlWpR1GGC52OU=; b=OdXdjF/TG9UgifVL1XNCElH9urzKYPt6pF
	yZ9LtNnnhKAjJ/yydook0Dakp+Ch+IkC0qCzWq/T6N/i5L0XYDVqXoP3/MO8wcpe
	9MLIPmueN3mOYFht+7nS/HhsJiyxyFqtZw/eaAIN4/f4fDK/9PavIwi+b13hK3x6
	HdOrKQka8pynbIEQ/AYzf1D2mru+JHfaQF6VwV0v+9Yl74h3GmqKTD0hUVS8KOIk
	7raacLSUKI5cUhCTPRnSSHSnkStnBVXMgwzIz1sqz2LRnV9B4KddtTFMELrBgOrB
	KcysWd/eYiSCCgL0TRMReeN1c0ASqhK+ajOlza98AeJbdcqroQHg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xk0srs8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Nov 2024 03:06:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL0oJ8h023119;
	Thu, 21 Nov 2024 03:06:36 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42xhubgrhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Nov 2024 03:06:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQaj0r2VWypPAUQ7w5U5VXye7Uv/34+cDmM/RZgQ8xCqantqngl3mpygKy1DhJdZkxZlfBJ/hV4oDiDdRK6268Enf6XKvN1dxnMVU9CN4MSE2oeI6QPvs08Gy7cQQig7WRCLkPE+nuSMpZ3QXIw0WB3yEjaeu30hvuWPfx2Sr2lb/t00dB1ARjccWpP9C9dWT5u//g/gDuruvnys8rOJxjIWvIxvhz34cvw0wx7zxOD+VVG8ZDNnmyneHEzcZrVHuTi3YpIaQbFoD7XFoPGIFNMkeo+LtfjDgdf9TZ364o3NQpasC7zEmpT0+3BUxNLQOxwqv2fgC6Sh14hZ6BC29g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEZtrT4LRQlb4x2Hx/A+JjBqzGwmMQYlWpR1GGC52OU=;
 b=vSFIn4nQe27cMJ2a/C7c0UxddHdy1e513O0froeYIdx67rFBkBRDBPGvi59SNGyFIvkAhNMKxMbZFw+4PXQYA/CbBuAUS3uxqi69fAZw7yyAIgYV/s2xxlPpeHon5Y28tyS7u4KMgVa0UOh2Ms3IAyi294oVQur57mixHU2PG8E+v2ruIw2eh5U5YHDEl7pf8DwdAZEgsXq9jT6ByUibKMUmzyPS2ECAYdvRgJTlOIVDib34Zm0FUVfMRo04G3vLTQh3yFDpS1ebXBCdYvmKZaVZxpa/G4B8REjU/mO+eZWRuU0BQQVuQp650bP/2oIQPv0KViivm/1XqzJ0tS/jIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEZtrT4LRQlb4x2Hx/A+JjBqzGwmMQYlWpR1GGC52OU=;
 b=A5+xiH/v/+uuSV+3dGcuJCN5jMW3od7COD/JlT1fuqW058aUPEHyTIq5a2cRy8yGxuOs7I/W424Wsn3dg5rL36aSza87n75fnidiaw/nAqPfCACK2mOvwtqr9Lb9KOj3rNRmeSfygiM6t/Hn5uvLyXY2EjAlOp3AO9WaIzjGwvs=
Received: from SN6PR10MB2957.namprd10.prod.outlook.com (2603:10b6:805:cb::19)
 by IA1PR10MB6268.namprd10.prod.outlook.com (2603:10b6:208:3a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 03:06:33 +0000
Received: from SN6PR10MB2957.namprd10.prod.outlook.com
 ([fe80::72ff:b8f4:e34b:18c]) by SN6PR10MB2957.namprd10.prod.outlook.com
 ([fe80::72ff:b8f4:e34b:18c%5]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 03:06:33 +0000
To: Manivannan Sadhasivam via B4 Relay
 <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Mike Bi <mikebi@micron.com>, Bean Huo
 <beanhuo@micron.com>,
        Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>,
        Luca
 Porzio <lporzio@micron.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Can Guo <quic_cang@quicinc.com>,
        Pedro Sousa
 <pedrom.sousa@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Stanley Jhu
 <chu.stanley@gmail.com>,
        Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang
 <zhang.lyra@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Santosh Y <santoshsy@gmail.com>, Namjae Jeon <linkinjeon@gmail.com>,
        manivannan.sadhasivam@linaro.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/5] scsi: ufs: Bug fixes for ufs core and platform drivers
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org> (Manivannan
	Sadhasivam via's message of "Mon, 11 Nov 2024 23:18:29 +0530")
Organization: Oracle Corporation
Message-ID: <yq1h681p9p5.fsf@ca-mkp.ca.oracle.com>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
Date: Wed, 20 Nov 2024 22:06:31 -0500
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0440.namprd03.prod.outlook.com
 (2603:10b6:408:113::25) To SN6PR10MB2957.namprd10.prod.outlook.com
 (2603:10b6:805:cb::19)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2957:EE_|IA1PR10MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: c758e781-87ad-4c89-870c-08dd09d980b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9QIBizc8AfIoUFue+0MKVHmWAw4VdMv6C3LP5jiMa04kr09J17zseJphDs9z?=
 =?us-ascii?Q?q6cMgAI4g2YR972tm5eMS36JvdW5OXVqRQgWH9DXdaO8BhxIQd/QhyJB+P0w?=
 =?us-ascii?Q?3Qczha0ejHmvELHiSWDLDK2wi80w3JfW1OyXxXaaDlgnpv43tZXyNy4Vb7lA?=
 =?us-ascii?Q?KcXj5HFzTBN+JAC6I+khR7jqj8QExj/8PhL6V7S930ez4qi8CQ2pbp1PqYpG?=
 =?us-ascii?Q?UPhUGf3Sf4NfEKd5zl6TXUjR6F/zVZc+WWmExVfmh84/g1bsYU1o8m1UZwHM?=
 =?us-ascii?Q?/qEImK/riYHiIkaGNQAYwli3ydEBT9vXGORpdj7blYDuMzqI4qllWFC/H891?=
 =?us-ascii?Q?8o9gDps8ZTzMEnSL1iYXNIWWNLvJvZsRe1aCvAQzxSTjsu6G6FS3pwJmHnLD?=
 =?us-ascii?Q?huarRQ8x8DtY3vFeCSefKEVh2Ee/N94vSrL4eIv3wnxZmt/+MT0QxMoVd6ZU?=
 =?us-ascii?Q?ovwthGghHn/Ux4jF3wOJ6m+jsMQkaJJeYJtP2HNz9eB2i0YOr6cc7GXJslP2?=
 =?us-ascii?Q?OStNoE7SdhmGxYmkzjlnF3gpQ/YwGj179UeqrK1+GjzqoF0AXzqya2V9qP4Q?=
 =?us-ascii?Q?jTjmKdPDQBw4OsMSg7ToFDbd96v5fVLIx12e8I3uZdBaxiHImPB3jshcmfog?=
 =?us-ascii?Q?ZjJQ0f+Fd9qd0hsTJd9+RkM5buNI+n4EFQiZVHh4EM+Q46JGrlZzZ8rvXcOM?=
 =?us-ascii?Q?s7DZba0WLE2w3Wvn4bmTmHriLtauipZGTJFGkqn/R05PptJInxkaA6i3JaIN?=
 =?us-ascii?Q?C36tpkoqya0M/g6csInMkdZkqmIFAYJQ0GkN3fxsxatXAUtvtqVydltGVKC5?=
 =?us-ascii?Q?pIDGKynnUBZAsCS66ya3H7M+3MUpCpUK/YLz1ntrBOMBI29qmrMgXJJqhsHZ?=
 =?us-ascii?Q?oYtzaPrde+6mQifiTCId2ThcxtG5fOeeOtS/VEwgh+4eMEa6prw/GPh8cdCd?=
 =?us-ascii?Q?ZlIKoIlGpwgsIXx+7IIL10C/Ml6sne0MhjEbenll029F9vSAV7egL7rpFO37?=
 =?us-ascii?Q?XhwI2UNiktAoeE0izZrW+qn8Aik8PNR6f3lKFGG3dVWg3XTk1dUYsDmcFRe8?=
 =?us-ascii?Q?t2NpIU8jh4+sd6kGAA4YTFWkRjVL7qDNtJEQ7RdoFtEh0fWKzkN14laM877U?=
 =?us-ascii?Q?pMsbjWTy62nF3Bcu+VIIiGXTNX1ATUKeYlhPzLJRZWfKV56dBwX5rSXnniS8?=
 =?us-ascii?Q?eGjp2qDoh+jtHBJ4P206g+BG3QDHDEVmeyfswPebJnmJxYkuMVQHgTviC3h6?=
 =?us-ascii?Q?skPUbePMYAx0Jv4aKFHqPzU/hI5gyT+iEvPHLzBygUALdHQUAdODqhOSyqBk?=
 =?us-ascii?Q?5A7WSvK9GdWom520MDowPJ5R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2957.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kDggRTfzFdAHGO7nMWeZvEVvZQbIohz5sU1WFqAQVR/+dZRh0+9gCC0k7sww?=
 =?us-ascii?Q?u7p8hC1m+tWRPnqc/+IFSopknncatKk1ZOyTT/VUS8ZmXD59q93hIhhRdBQ8?=
 =?us-ascii?Q?3AU4HPil2MbQhWwwRzLlLkaF0oxNdjQVSOh714u5QGNCT1/Mt0oFflrT3hqs?=
 =?us-ascii?Q?aV/RcsomeBCa86DC1yLqlAnQHrnIUXhTLmAL43SR+72gHkEJ2W1o74sdi/L1?=
 =?us-ascii?Q?t9VOINjs4SHkcUGZ47i3/S1JHJ/0PqbDwWyRNYRek+rcbCpk4SdlQurIjQ2+?=
 =?us-ascii?Q?vSg2v6axHbquUyskUDAv3NIbZ/w8aB4pT/O7UrPwt0NIoM4GjjWPD9N2vPVC?=
 =?us-ascii?Q?144ijJ00q3R75y95tsd+FFY9LmvZHTpO+v/d+VU2hfxEBg/QlpNGRpgXpTbq?=
 =?us-ascii?Q?43DYFLN5g2yldqOWJVVsw4GYS5YmikPITRXG4ySV6c4Xkaycu0TwZ3SeR7KG?=
 =?us-ascii?Q?w+qLB9Iml8Q9FyrpaNlpv1E1VqWrBdWmLBCUz8d3Ndd1uedCoQLWjjS7L6ME?=
 =?us-ascii?Q?N1IBa51+/IZNBpSlBHFno/yK2kmlzqLe4t6CFEFsiZnFtwDiHaO/LFhPlaEi?=
 =?us-ascii?Q?LuFR0xSVr5R9I1fqbaqGYq03c4Tg3bA4YgVHvwHo98wCV8ft30z5dKHvi1oF?=
 =?us-ascii?Q?KsaAnnQHRFnD2/JrYEfQgmsv7s4Nk07BgMEwmW/qoOLlzIEd/yW/g7OmpNW+?=
 =?us-ascii?Q?XnYwNivT+bVwWgfFqTyLplSw5TOQvme9UpqOn69b3gwNXCXilRaqXPNcz1aE?=
 =?us-ascii?Q?aYShGs4tn7J8I+a/94iDs6tuN1KCjmYz3PBwulYvJURnJxryPYQbGiuplSkE?=
 =?us-ascii?Q?bDm4caHr/xi+4/LYHzN66y/L+p5nRXuLRUy73VHL0AH1feZHnJB5DfRzMX10?=
 =?us-ascii?Q?ZnwkEOilwmccEdj2u80Xeh/ZO+FN+/7dO1GdKDYaCS4t443qzRZ3BQmekhqG?=
 =?us-ascii?Q?pzHgYmJIwhsDHR6kSICBqN3GkrUXBlnU0+ODqwSwwQ4uNmxEeswzqiEQwH16?=
 =?us-ascii?Q?Z7lhLA+2qt0stN9BatTLViJB8ub/KJJvnkoYgUGL/v4do5Elpub8en5rO9LJ?=
 =?us-ascii?Q?S9z8BD1cl6YaD05zBwqbMP5jZ+lb+wG2wYqtqZmyHDpGZl9d3X9HLQJ2rXVp?=
 =?us-ascii?Q?L8MfevB33k0Ijy6uL8oQkx3EbE9bxuUhAiNopHxKFhH5wEl6HibpHpY2M1ot?=
 =?us-ascii?Q?2SLj+32iYcq72o73hYMKAOjzEsfRtdTNZnUuw4Qn0/kpJGjArpuoIQJ6utez?=
 =?us-ascii?Q?Wp6XMRjm2Yjugf2KsA7efjrKvE4WRU1jzjuSE0ET0bqGPgo0kJx0MHa3tuE4?=
 =?us-ascii?Q?D3RaEpMYK12wR7ehAp4hlDeKkTfXk4fcuy0wsK/TxAXRyzNEaBF9Lrvb4pJV?=
 =?us-ascii?Q?7TB6Ozw4KCpiaJ4b0Wq7SUZrp199xDvqjVaZxWDpkylsiPnsjLtv3CiPfaui?=
 =?us-ascii?Q?ePu8GOjjXi7wAy25jlokzrQev3F6tEYkz/81+bIhMwowIwQ4g2PZkHhpRKjx?=
 =?us-ascii?Q?k5QvwN4ue6agGU11SsZHZ6RjVEhWld14duwydlHTal4CipOZXJJAF+6xUTOB?=
 =?us-ascii?Q?QorYva26yptxxqDqqX4dljZEFjSHkNCdjbIPmFlel1sVPnNmWsSPDwfpqi2z?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZmUFZ0yMrLOo4KPk+DXf9CJO93ogj6RvoK3Cn1p292n6/nZLLTV0sK+Z3tnC3YMjcCQVoerF0oSyV/GO7BPxG5rWLMg8YS/3IyWfufqxy1Bt+ZgRcdrLpzrpwjSgLsPku6+QiE6428MfrLH7SxR3B8dIsZT0lO98HSE5hK8JLGwN+ntH6fouyqIC1+v1w+G82FjG+exTaSB8BYLPoILy1PHY2KYoJScJ+vKalew3NUPosxTgsF3IsFX10PiBvP6YP1+mza5Op7Olp/xjW5RRdAIFIdBPsJDcjbZtNM5h5w1wTyWbh2C4SyI+Cz0R1wReJAhI499XV2zxOtrXPKZrQI2f6ZvaBgMhRm/dxpBDAr+iTsQhkf1GhwBqD1AI+youJyKKsFD7Vz13+ANLCK+G0JSAgFEJVcATRCuaA7WQgm8IVQXXBpHDuu5/sObQyZ5411rbJGPHu7uRbq3bt9DGrkUifgI8Mkd6Qsh58CivtpsS/w9/XxN0Mt/OYl9uHCcpjm65Je2BgX492QREqaiEP+oXbixhXmMH5I3eRAzI3lwOGvQtQwHJ2SlpspBCz1YWvXaKIsZM4adZwRh+634Gv7IEMUk8C8TGXwmZhMoBhzg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c758e781-87ad-4c89-870c-08dd09d980b8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2957.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 03:06:32.9717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqUIU81i4abamrylcWyePBEcjvvpdL+9vNEgdpSjcpgtzZt80Q5RVwc9iRmKKXhW8PkCB7NJ4TL9T96apnWzFkfh+fZqA5+ZfLpdnWXubWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6268
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_01,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=801
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411210024
X-Proofpoint-ORIG-GUID: qA5OKvEmw7LyEg_HoajS7rIZljArpiT0
X-Proofpoint-GUID: qA5OKvEmw7LyEg_HoajS7rIZljArpiT0


Manivannan,

> This series has several bug fixes that I encountered when the ufs-qcom
> driver was removed and inserted back. But the fixes are applicable to
> other platform glue drivers as well.
>
> This series is tested on Qcom RB5 development board based on SM8250
> SoC.

Applied to 6.13/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

