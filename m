Return-Path: <linux-renesas-soc+bounces-27566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIKaM9Fbemm35QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 19:56:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBF1A7F43
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 19:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E55E3004D00
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 18:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46224372B3C;
	Wed, 28 Jan 2026 18:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="m9PP/qNU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013024.outbound.protection.outlook.com [40.93.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E08372B36;
	Wed, 28 Jan 2026 18:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626574; cv=fail; b=gFucC81QWAH+FtkasBuWw6+RKfM3dUwUQ+TNq8aqjS3ldlVVZbwqEq/SY8CpasCCxX9HXuFFoQtO/ai8CcCFaCQKHx1iHNzUWve18L+c4A4vMYRbUV4JrsII6gPAiznYxNTatWtWXsUmgtGESwzDG3AR/6M3k3AHAut2ZDkdyHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626574; c=relaxed/simple;
	bh=pqRrMMF40bpZZ/PV1153xkOXtlleK6/dwyT5n5KTuCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hKFZmgvs70ET8t8zxm1GvXppnBrJcOPWgJuH3m7Y9gPHPCBcvhRgAZCEseiZwPQqX03JFTC49Ou3ntjcTH2yhYpRaOr6tI7Yvw2Q0cnwrSKC7mm4dbAGhDFJIUxN0ub+sCp4rDSVFUTKpQX+H+3dQ8iLWgV03H/sHevXXc+XSLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=m9PP/qNU; arc=fail smtp.client-ip=40.93.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h64R+UirH6XrO2iKn19Mgo2zCwsI92oY/7PrpTdMkZSE5xTWQ8saIygJIsRc0IkfoLKGfSIb/E/u9po+su9z7pZ781fM+8anY3ilJj4Lf/SGrtYWcl33QTW8GmzqoC03LBkbXbEBa6omEcI+BPvMX5qXjdqXkOZR8adiuSc1jIKQNp/lXC2xHE4HtfxcRfL3MajAUXi6cAIKhIczoK4ZWksjMPynvuPE8+5pNvHq9Alxfwv6G168Av6/jcsBBBB2iHw6DqnJB1Zb/ZgiaQWXV3yNLAtZFDVJE1uuww5mT3BQo4gTFSyOsXkEq5H1XOUt+8crtyS2ygZArBIxjMH4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDTmRv3va/tNocUc0G9NALdnfFVeiPsb5/Zpl/prK6k=;
 b=K+19a+oopksX/sTy97ORfNiHmJAWQSOYDN998IeHl7mHde6e9q6s7qZ5KDc4B4RIjnComXmep5OSvU7tZQP5JQ91c3Lg1tzWlexXfHa9x8qfLd5ipqsFHmiC1lmmcoBaBsc8XVvv88KITS7S/YlZQsqhDyCt8TWi2pCvkEqFzwCYuvLzV9nEH2uuRpb6CzXXh7p+0pvu9aN5+6QsOp2qQfzCoL0GaPs6yqmROUeQ/Zu5OvHIQd5rz3y4pBotDHDjPiHYHKkAA2ddjmibOIlU+RltT+e2EjbS2RcZLRPx2IFub7JFDEB6a9KkmhpfvA7VV/4pm62gIlgrEVGWL21y0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDTmRv3va/tNocUc0G9NALdnfFVeiPsb5/Zpl/prK6k=;
 b=m9PP/qNUowSISCce0YQjpewarIBDOxbSMhk2tVeeIKy7eHLHIU2CHGrl4BnHzhqjRL933z/MPxsWAbZoYebGgdbhlLexRVkfrlXnNftQ+zHqwK0CHAsFTLW60eBE6cDsVW9XZ9JidHyuf2Qqy8kgpc7YjqMSeQy6mtIw5Rbyn0U=
Received: from BN0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:408:ec::27)
 by BN0PR10MB5014.namprd10.prod.outlook.com (2603:10b6:408:115::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 18:56:10 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::d7) by BN0PR04CA0112.outlook.office365.com
 (2603:10b6:408:ec::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 18:56:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 18:56:08 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 12:56:08 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 12:56:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 28 Jan 2026 12:56:06 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60SIu1IW2854453;
	Wed, 28 Jan 2026 12:56:02 -0600
Message-ID: <1b9569c6-5073-439d-b0b3-99a5a40841f6@ti.com>
Date: Thu, 29 Jan 2026 00:26:00 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] spi: cadence-qspi: Add Renesas RZ/N1 support
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, "Mark
 Brown" <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Vaishnav Achath <vaishnav.a@ti.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>, Pascal Eberhard
	<pascal.eberhard@se.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <s-k6@ti.com>
References: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|BN0PR10MB5014:EE_
X-MS-Office365-Filtering-Correlation-Id: fd009a14-5136-46c0-4b9b-08de5e9ee608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnhuTENhUjJMNWVMVGVXUGRuRW5DNklpc0V1NmxySDRuV0JzQUF6WWhUVVZN?=
 =?utf-8?B?MTJCNW9FVjJNRk9aeWgyYnBWOTJRL01yZzFueTV2VXJ0VlN0a05sUXBOODNW?=
 =?utf-8?B?Z054cWlHR21YN3dTVlcyQTNRNEhxR1NSU2RYM1JtVVV5RkZnbXU3VUlhejNx?=
 =?utf-8?B?YlhHQncwOVpqbUJjNnYwZE1ET0ord0lDSjRnN1FiTFA2WnlKenZKQjlZMERr?=
 =?utf-8?B?Ykc1clZPemZ5QlljblVadlBUaHdKMHN5V2lqeXlwR3dZRGtLQit2L1N3REpV?=
 =?utf-8?B?ZGd5UWhPSUdybjlGbldzWmk1R0orYWQ0d1BtV3d4Y0hQQ2I0L3NtSGFPYTR2?=
 =?utf-8?B?OG9vZS9XenVydGVDc1FHNFpnOE9mUFdZbjJVRlVielcwL3V5Unc3VHpKK24w?=
 =?utf-8?B?aFN5ZExDcnFmY2FqajhYUEw2eGI5NVFmeXZpL3U0a05ySmQycUt0S25hQmEw?=
 =?utf-8?B?dXBWRHJ4WC8xeEdueFkzS0JHWjBSMzFWbGVUUVYyeGtON3FJdXlrQU9SOTdn?=
 =?utf-8?B?Rkh5QmtaRlpJMitTdmhBaUxicXV5LzBUVko4Uk5Qc0s2K3Jua25paHhqRUM1?=
 =?utf-8?B?c0xCWnNsQ3prRis4bWMxNHdUbEN3cm90NWZ4Y1R1djRlVWJvaFdhQnlPMi9z?=
 =?utf-8?B?WDBZVStaN0EwNWF5RkhsRU9vY3ZJUy83SEtLTTFRT2RJU3d5K2dreUx1RGdv?=
 =?utf-8?B?QzhqZ0Z6TlgxUmk3Ym9kRUdUTC9RT042REJaWkFsazUrdlBWRmdxNmtsWmhW?=
 =?utf-8?B?bWQvNzZxcStON3lJSzFCWERTdzFBanFndG5XUFRDTEVkeWdLS0pENzFJUGcz?=
 =?utf-8?B?N3JXZVcrdGRTeGxKa2pTV0ZaMjZKVmN3MEk0Q3JDZ3ZkbWRFenBVK2R1UWRP?=
 =?utf-8?B?VE9TT2dVY20vdDUxYmlzZEdmTnRLYXF1TWg2NkQ0amtaVzlMa0xiZ21oZTlh?=
 =?utf-8?B?K0VQUzN3S3AreXZuNHNOUS9JblgrV1JsVTZ1SE9tTFEzUEZiNzl3R1JKaUh3?=
 =?utf-8?B?djZEcDV2UkpWdDJrVndqY2I4WkZCODJvT1EvSjRocjZNRlpqVlY3RzViNkZh?=
 =?utf-8?B?cHRYNGVBZlhkeUN1VVdVbmQrdm1FdFdPaTFrdGtRWGVVY2kwVXBwUWJCMVZq?=
 =?utf-8?B?UG9nRHdhYmxUeHkwUzExTlUzU2YraG9YN3JabmgyUG5BSmlCN1JmbXpocmdQ?=
 =?utf-8?B?dC83Ri9QcTE5RGpLVDBCemloamhFNldQWEZVQjhqeVN3ekVrc09KUjB2ZTlE?=
 =?utf-8?B?U3pFVTI5cXlRK0FRNDd1ek4vZ0tPSDgwNnFyUldQdjdPZ3UvRWxDdmw4WVFX?=
 =?utf-8?B?VGY2SjhOT0pIYkhXYzJ0R0cwRjUzZ0JydDB5U1A3WEtNSm5GVUFrZCszS1o0?=
 =?utf-8?B?aUU0cnRKWVprS2dDdlMvNHV1SDFOc1graXJURENwMjhkc0pRUkNmTlhKci83?=
 =?utf-8?B?NnNITy9UMGZpY3NTa1NrUnJpK1VCOUE2anBCblhTcFZYTkh4bXhZb1hXU1V0?=
 =?utf-8?B?SjlaclczVVNoLzRGeGEvVFpPVHVuSUUvb3JiRjZNVGxGRmE1aXVxV2JxNk1p?=
 =?utf-8?B?RXRXZWh5cklvUkNGcEU1RnhTSDZiczY1bWNNMFh1SjhoRFIzT1I0VzhJbk5m?=
 =?utf-8?B?dy9odlByRHpmYXA5cmtDb2d6M0tiT1lEU3FEZDIzUFl6OHhTZHE2L0F2eEp1?=
 =?utf-8?B?c2k0RVVhUUkyMS84SUhTUm1RdXJaS1EyVGFJRStCamtGcS8rckVHQkJ1blJw?=
 =?utf-8?B?ZlJtOTQwbWtzMW1iRUhyb2R5UGNUMG94SWNLU2ZrU0Nya1VmSElLUkpkMVk1?=
 =?utf-8?B?QVcwZFhOMTJDMVV3Q2ZYVjEvMk5MQTYyUkgrTzBmTDJTNjNBeDRmdmpHcWsv?=
 =?utf-8?B?bHZaL0p4RVJIbkdCMTNuemtFcWFuclYrV0tqS2dVbjRrY2o4QkloU1YrUlZk?=
 =?utf-8?B?VENleERzTW1kQzhUdEtjdzc0amxQQ1BWQytVWm5LajN6U0lZUlRiTnZ0VTVj?=
 =?utf-8?B?NzI2RHltK2gyYnV3VHJnQXNlY1hDNXZpZi83UDNpUjlRSU5lVjZWL2lpODRP?=
 =?utf-8?B?V3I2TUFpUnU5aVp5WXJ5VzhZb3ZYRVhTeUJET1daN2ZUVlBUWnV4RzdKdkM3?=
 =?utf-8?B?U2lSVnp3Q0RRWEZUNHB3eENtaWdGbFhRdTNOYVY0bE1hWForK2xIRGNSZ1Zt?=
 =?utf-8?B?Ni9EcW9VVDNMQXc3dU1DQkJFb2lQNHdXY2MrMVhwRXZHdC83WXovS3lWUzFX?=
 =?utf-8?Q?7msYTlr6YK4gejNf5UQAw127QEk3EnYITDj1euQ+LY=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 18:56:08.9190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd009a14-5136-46c0-4b9b-08de5e9ee608
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-27566-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,ti.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s-k6@ti.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2BBF1A7F43
X-Rspamd-Action: no action

Hello Miquel,

On 22/01/26 20:43, Miquel Raynal (Schneider Electric) wrote:
> Hello,
> 
> This series adds support for the QSPI controller available on Renesas
> RZ/N1S and RZ/N1D SoC. It has been tested with a custom board (see last
> SPI patch for details), but has been tested by Wolfram (thank you!) on
> the DB board.
> Link: https://lore.kernel.org/linux-devicetree/20260116114852.52948-2-wsa+renesas@sang-engineering.com/
> 
> Adding support for this SoC required a few adaptations in the Cadence
> QSPI driver. The bulk of the work is in the few last patches. Everything
> else is just misc style fixes and improvements which bothered me while I
> was wandering.
> 
> In order to support all constraints, I sometimes used a new quirk (for
> the write protection feature and the "no indirect mode"), and sometimes
> used the compatible directly. The ones I thought might not be RZ/N1
> specific have been implemented under the form of a quirk, in order to
> ease their reuse. The other adaptations, which I believe are more
> Renesas specific, have been handled using the compatible. This is all
> very arbitrary, and can be discussed.
> 
> Thanks,
> Miquèl
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Thank you for the series!

Tested it on TI's AM62A SK (OSPI NAND flash) and
AM62P SK (OSPI NOR flash).

Tested-by: Santhosh Kumar K <s-k6@ti.com>

> ---
> Changes in v4:
> - Drop two binding patches judged useless.
> - Collected Rob's acks.
> - Fixed the RZ/N1D400 DTSI (removed the properties no longer relevant
>    after my binding changes).
> - Link to v3: https://lore.kernel.org/r/20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com
> 
> Changes in v3:
> - Collected tags from Wolfram and Geert.
> - Dropped the Cadence compatible as this fallback would simply not work
>    alone.
> - Fixed the clock issue reported by Santhosh.
> - Fixed the DT snippet following the discussion with Geert.
> - Modified more deeply the binding, to no longer expect a fifo
>    size/depth nor any trigger address, as these values have no meaning in
>    the score of the Renesas implementation.
> - Link to v2: https://lore.kernel.org/r/20260115-schneider-6-19-rc1-qspi-v2-0-7e6a06e1e17b@bootlin.com
> 
> Changes in v2:
> - Fix commit log of DT binding patch, following Krzysztof's comment.
> - Fix properties order in DTSI.
> - Rebase on top of spi/for-next and fix all conflicts.
> - Simplify even further the code in the cleanup patches following
>    Pratyush's advices.
> - Link to v1: https://lore.kernel.org/r/20251219-schneider-6-19-rc1-qspi-v1-0-8ad505173e44@bootlin.com
> 
> ---
> Miquel Raynal (Schneider Electric) (15):
>        spi: dt-bindings: cdns,qspi-nor: Drop label in example
>        spi: dt-bindings: cdns,qspi-nor: Add Renesas RZ/N1D400 to the list
>        spi: cadence-qspi: Align definitions
>        spi: cadence-qspi: Fix style and improve readability
>        spi: cadence-qspi: Fix ORing style and alignments
>        spi: cadence-qspi: Remove an useless operation
>        spi: cadence-qspi: Make sure we filter out unsupported ops
>        spi: cadence-qspi: Fix probe error path and remove
>        spi: cadence-qspi: Try hard to disable the clocks
>        spi: cadence-qspi: Kill cqspi_jh7110_clk_init
>        spi: cadence-qspi: Add a flag for controllers without indirect access support
>        spi: cadence-qspi: Make sure write protection is disabled
>        spi: cadence-qspi: Use a default value for cdns,fifo-width
>        spi: cadence-qspi: Add support for the Renesas RZ/N1 controller
>        ARM: dts: r9a06g032: Describe the QSPI controller
> 
>   .../devicetree/bindings/spi/cdns,qspi-nor.yaml     |  35 ++-
>   arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  12 +
>   drivers/spi/spi-cadence-quadspi.c                  | 279 ++++++++++-----------
>   3 files changed, 177 insertions(+), 149 deletions(-)
> ---
> base-commit: 7a3f3fdb79a26125b38fb91b68dab298ca7b44e0
> change-id: 20251219-schneider-6-19-rc1-qspi-7c3e1547af6d
> 
> Best regards,


