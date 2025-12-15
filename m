Return-Path: <linux-renesas-soc+bounces-25754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 907DACBD29F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 10:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D30C300A2BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 09:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2102F32939C;
	Mon, 15 Dec 2025 09:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="S3IFVqJq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CEE3277AF;
	Mon, 15 Dec 2025 09:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765790839; cv=fail; b=SueOLWdD8AU9uEFksSNH46aPG3MWzW1oaSaISVb1avwpCW6S7EhUNm4KuhdWLt2HUc3tzejA+3MRE8t22mo4WFeJsLAGwIbzv0KkNIkSzHYuE99QCw4/PUZ+Pdd5tA21pHwiK+MXw6hmJYzV0NgBylyjwJYTf3sH5uSY0a8P46k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765790839; c=relaxed/simple;
	bh=w/l4QHYPYo4sjaua20EF6yucKCdzjCRtC2RIL2n2sDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M7xFdysACsyqt4uVi8DeWXgLqN/zBkLEHN5Mt3H/fzzNsTcDvbgcaIXuoGJXy7HN4eYiOYMlrj1/dYekOfwqCrLucXIgMbjt5W3k+x4lrZzi0poFp6FP6dLJVRnoYU8IGOQzMsqafPvM7LizD07RRw0hb21xBVOuPmueDq7bDZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=S3IFVqJq; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF9P1uY1698651;
	Mon, 15 Dec 2025 10:26:47 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012049.outbound.protection.outlook.com [52.101.66.49])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b1jk5bqgm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 10:26:47 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2RMOw9nL5soxHLOAShKUdmV6ysrhMJKoeUmXclJGS1koo3zKCmn99PyiBlJ8jJC1M8LOVw40JF38lwUJFXqaQXZ77n60KcbsyddnvQ36OLq1qNJVusMRxbMIZKHY8z/9ZJ0FSHFtueALpeVgnDBtRCAPSaYG5MbWd8AffOPuLGGC97/BuzIGV3n2h6HPEW2VTMYOj4R+EQbv2nPJIXIZnmYZTImfCqAiLFi/cRL6TgZ+bvtEyNgfAVfAK9EFaKQDo/0GcjyJ4DstqRwh8J9/ZAOtrXiTNeeEzWFESUzA+jv/z0+uqVB9/kj6AjQHvzISAT/tfvqiASdHVUj2w2DXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sONj9qJO3xW6NVxWrQ6cQBa+GRsI9FSdSQoWk/qPV40=;
 b=vi0D6XA5IG7+P1m3Dtv7Tlp8B9ZYsQQkKBkXgNzkz5VvJlp3DqA8q78Ux1Lq4NhuDZBV0Xwce8hey5tH5rokp3dINj7k0eSEo7IrG5qfsjNRgRWUKKMQxigO99n6ZK4yv6L7wrQ430YOwKgQksdTBv5EGdJRYvRaNN0vYZ6ZyT0YWHIkTZcGBt6rqpf4w2yF8DDcgi6ETmxqleuCHmxNsyS7LoaM0ozO6+kZnOYmd9+eE0VhuX0a/1c+kKZRYaXGM2qrC+81aVwZR6kGuvq+5DUi+wydsOlnOuHTnibZxicDuy/hZUGr40FsKwTdPagdoNoJlz+I23OQhkOc9In0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sONj9qJO3xW6NVxWrQ6cQBa+GRsI9FSdSQoWk/qPV40=;
 b=S3IFVqJqPe4V1Ehlns1RRSLx4YJDSoUjBEAOSLTBxdtFJJauj7l5wYYFIr8HlTov3/Qu5TnF/1J/ZhK1LLleQC4W/1eSdgP0rVuCp9CCbUJz40jXcbAMRtrgrZxcUkrvkLhUE8/5rBO/UyUJZvR59Dq7J7GMppDjh8Lm4kNEVK0t7938VsCBqNFn4iTxc6IJyEfd2DniJlPWagpvCzAiq+64Sy2+mETGyqzApaV1PQGfUn2ctJvgSziLHlAOUVm+WPrLcKclI8WOASwMlE/xrJQIsIYCger5h8yRo/28AVV1kqZC89C5PgS5+Bp6Ti0qG1NafxlZ9D5SGPyW6/No5A==
Received: from DUZPR01CA0203.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::16) by VI1PR10MB3342.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:132::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 09:26:45 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::69) by DUZPR01CA0203.outlook.office365.com
 (2603:10a6:10:4b6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 09:26:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 15 Dec 2025 09:26:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 10:27:28 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 10:26:43 +0100
Message-ID: <73678ca9-0943-4daa-a2f4-05219db2384e@foss.st.com>
Date: Mon, 15 Dec 2025 10:26:26 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/arm64: dts: st: Drop unused .dtsi
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Viresh
 Kumar" <vireshk@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <soc@lists.linux.dev>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20251212203226.458694-3-robh@kernel.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251212203226.458694-3-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|VI1PR10MB3342:EE_
X-MS-Office365-Filtering-Correlation-Id: 0751f43d-ebdc-4b4a-8b07-08de3bbc10b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHJFQXVZY1VzbWx1WmR4Mk9ZS01RVnhSdGFDZjIzVGMvN3RZTEpEcm9zMVBx?=
 =?utf-8?B?dFYwYVlKLy9MbkdhQjZFTWFOV2NHdUVDY1IxSnNmYzI1VjVhNVVOUzk5WE1r?=
 =?utf-8?B?bW1EQW5xYXUvT1ZlQ29Kd09IMXBHMy9xNU9ON1lBbVFuakpLRGp0UjhkNW9s?=
 =?utf-8?B?QVEwSGFud0lpLzRVMitnQWJoQ3MyRWNrRlBoa1l1c2wzOEsyLzRxZzVtYU9P?=
 =?utf-8?B?cnB0YSt4eEh1RHZONzFJTDRXTTNrY3ZyUmhJMVN5eXdjeXUvZWtCMC8zRUpa?=
 =?utf-8?B?MGJYS2VsVi9YOVd0eVladkxKTGthTFlaWHVGVWsrNjBEMWtXZ2JHVmJVSGcv?=
 =?utf-8?B?bGJIMm84dm1BZlY2ekpXZS93aGtCSDlYVjlnUXlhVEtlNWx4bzFHbVo1eHZZ?=
 =?utf-8?B?ZVFhT3VTUlNxQ24xRUV2UkxiREwxT0VIYzgvM242ZS9CeTFuS2M3MEkrZi8w?=
 =?utf-8?B?bjZPL1JoKytBcVNVQ0hCU1BVRytraC90VkwzVjVvRmRVTFVXWG9BTkNmcllS?=
 =?utf-8?B?dDMwNEdZczV1bG4yZG53SkZsUG5CQkdGN1hPbWZ5TEdIVGIzcE5IT293c1Jj?=
 =?utf-8?B?aEJDNTlVbzZOSXZkdkNMRmdxeTZhWlhqcjZxY09JNkV5WFllS1BLWVU0dkRr?=
 =?utf-8?B?aG9aQnEzYnVwYVYxczkxY0hmbVpndWd2SGw1RFpoK2IzL0RHSXRWU2hPalVt?=
 =?utf-8?B?azhhdzRBd1draWNZWWNuVlV3dEQ3Z0hwSGtDVUJCSHVYNEFSN1draUJlYmp5?=
 =?utf-8?B?SU03U01KS2NVL1JoYWVJb2wvU1BZK2xkemZIYWlaL3ZLWENvazlOdmM4M1Fp?=
 =?utf-8?B?bUJuSXoxNEZjMXBkSGR3MTN2UDV3U3JXYmZIVm5hMWZ4UEduYlNkZ3R3M1lG?=
 =?utf-8?B?NGRrTGxYajljRzE3cmo3NjE3WklKdzFTMjRnY2QvUnRKTVgyaFNRYmVMSlZJ?=
 =?utf-8?B?ck9ZOEN4bytQdHFGWDRlV284QVpvSkFJZ3F1RWQwM3AwRnFTRGlVRCtHbDFJ?=
 =?utf-8?B?OW5tN1NzeGpUQVpzWUZ6VzMxbEpYeFlxYXVnT3FPSGxoWStOd0xxQ01JVFU3?=
 =?utf-8?B?MzJhU3NnWSt2cnFQeWQ5bkFYM1VOb2xzZWdhZ00zMVNiU1RXZGdpZGIwZi93?=
 =?utf-8?B?QW1WQ0hvYUZSNURIdDNiT0RLd0J6Y1Brc3NLK1phbUFuT3JKYzIrcHh6WWtJ?=
 =?utf-8?B?bHVNU1lBUjA3L2tEOGVjdnJqSjd6ZmpaS1Qya21iYVVoQktVai95SWljSHRJ?=
 =?utf-8?B?RUtwRTk0blBCVElPd2x1YjZ2TEZDcmh4ay8wVHRyNnRpTDhlVnM1VW90RmI1?=
 =?utf-8?B?Q0Uxd1pGM2ovVXU2cWFyY2V6MDl5SHhrWnRVbU1Wb21jSEoyTUpOTWk5ZlQ5?=
 =?utf-8?B?Q0JrUnQzVkZEem9LVEZtdlJ5M0IwMndPMWkwRnhydEoxdlpuUXRYU3ArajNX?=
 =?utf-8?B?aUYybnhKb0Z6clFjZENyeWxtclhHa1orNDhxU3h4ZWtBNkhaNkpwTFNRNW1J?=
 =?utf-8?B?ZDdLVmhJRlpPUCtuTGlnU0MyU0NJeFJ1dEVGUUs5RFgzaUl2ekYwanFTRGJS?=
 =?utf-8?B?M2hXamRhUXJBOC8wNzlTSnVuMlV4YjRzU0lFbDVJRHhOZUhvUlVVL3lHVTQw?=
 =?utf-8?B?MGU3MmhNMjdDSTc5U1dLcHFIU09IeU5HWEFPSHFZZ3Nrdy9LNjI0ZlJJUmgx?=
 =?utf-8?B?NWlVTUFieVVpeXhWSWFVSGEzandXQkJNdkJQZkZOWDJYNnJYR2d2U29VcDBZ?=
 =?utf-8?B?Q0lOSmZVaUlNQjVTdXpwaUxWV2VibmVQaXFsRE44YmhEL25EcCtSeXpMNjY1?=
 =?utf-8?B?Tk12cW1TcjRBY29OZnBDYXNrQlN0emN4OHdvQ2txbUxUeXk3TzRrendkdnUy?=
 =?utf-8?B?ampFbFE5NVBkR1BFcjNWOGNRZXF0VXNhaDBxeEJYYTJiVWR2dUd5STFENVV2?=
 =?utf-8?B?Rk1KNCt1cXhwcmd5MHFBR3FOTnFOU2krMTkrQ3JOVXFmZ2VHZ3FMMGNOeTFu?=
 =?utf-8?B?R2packJtc0tDbW1FVHlhMVVqNlFjVENBNkt0L2RJWmVYa2RRNVpWTUJJY2or?=
 =?utf-8?B?RDBjVFdvUENLNmtHcVJDWldvQjlrRkdleElycVFWUXdKbWtFbzl3UlBqZ1ZW?=
 =?utf-8?Q?S1A8=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 09:26:45.2023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0751f43d-ebdc-4b4a-8b07-08de3bbc10b1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3342
X-Proofpoint-GUID: TP7hzq-2S5uSP2JkQ2QTwVE6vpRqkgq_
X-Authority-Analysis: v=2.4 cv=NKvYOk6g c=1 sm=1 tr=0 ts=693fd457 cx=c_pps
 a=LNCg/zpmBfqMMZfMBfYAWg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=HGlTMLAbYNIrajXc9F4A:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3OSBTYWx0ZWRfXxJwnqiOtmzA/
 REShqRh4PiLrlZDOakw+blTpyP3X2QqeqZWurRKLndPSlKGZRg0hOMKjB5I12KbHZcEpetwIQ3E
 RV3kHVZ7efNtgkIpQuPmAYbGVEkq008NLft69k+cra7bYZkMBvVKanxGtG8Bqsym9zlrRkbTUBB
 kH40yD9/6z24MUk/pSGWxBzIeuRG8NTLx3lokQ9+CfIh6ipO+RvYx31t8Mce74H7PsFPE1NFO6n
 mXb3AxlywWiT4WKCMx0MfDPtpeI6R7u9+dPyUUwbHtf4sW8UzVuCBmN4AcUaN0tiXOiXROkYKTg
 kMIJOu/Rw99gFgWkW6XBH285yoVpBnNyBF+1Vy3tAFsej/i+Ed1Y7wt/8LNhWAQ68kCxvYvEovn
 h/teSGiPxtKBJnBAPYkfW+on1va6lw==
X-Proofpoint-ORIG-GUID: TP7hzq-2S5uSP2JkQ2QTwVE6vpRqkgq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150079

Hi Rob

On 12/12/25 21:32, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   arch/arm/boot/dts/st/spear320s.dtsi           | 24 -------
>   .../boot/dts/st/stm32mp15xxab-pinctrl.dtsi    | 57 ---------------
>   arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi    | 63 ----------------
>   arch/arm64/boot/dts/st/stm32mp21xc.dtsi       |  8 ---
>   arch/arm64/boot/dts/st/stm32mp23xc.dtsi       |  8 ---
>   arch/arm64/boot/dts/st/stm32mp25xc.dtsi       |  8 ---
>   .../boot/dts/st/stm32mp25xxal-pinctrl.dtsi    | 71 -------------------
>   7 files changed, 239 deletions(-)
>   delete mode 100644 arch/arm/boot/dts/st/spear320s.dtsi
>   delete mode 100644 arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
>   delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
>   delete mode 100644 arch/arm64/boot/dts/st/stm32mp21xc.dtsi
>   delete mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
>   delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
>   delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
>

...

Ok with this patch. We'll re introduce files when we'll have really a 
usage of those files by a board.

Reviewed-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

