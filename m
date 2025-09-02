Return-Path: <linux-renesas-soc+bounces-21227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0672FB4104F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 00:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0713541FCB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 22:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A79F2773FD;
	Tue,  2 Sep 2025 22:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="DbdHFduB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432261EE02F;
	Tue,  2 Sep 2025 22:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756853346; cv=fail; b=qUtxc2Xan+SmUdjRHEyCVDZJQNGOf56TAxKI1WboLOxasc2iHBxNDSiqlWwMqOGiqk6OLn4JvmYrwpIzv73nl2EnYNpT6w/MxbKk2xzTDU86eI+roRwL0E0AbUTHFSKFBeL8ia2sEilW//a9t4+n7Lde/J7wH89ziPdk9+4xNdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756853346; c=relaxed/simple;
	bh=Xl0fSyUlYPAe3E/5YsjoXbo1F7uCpZkoVwlmgVjAQPE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PqRM+gOTbCqFOnF2cecBBsioGNv+y9pZiSpO5tONiicQC3GzkeurU0iIWib+EprQI/op86JrqrKBsJWhWoACHRss+UQq4JvWlobe5woZMt2Y4ZIVqRr8o4kaGIQk+ltTeoIFThCeoL8wFeoNI/etFEREizLui7oh76aztDezVuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=DbdHFduB; arc=fail smtp.client-ip=40.107.93.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKS8L4xNXmQo8e28oWAxQZbI2XQOwA/RaAPYd+16M5LbZN2R4sqpmFbsdJHOmrpWKE5znIPnz2KCR90taTKnnchLqJFaC92KkQT2gSE7vPmCbatBzy22Y+rhJ4GcOi002LXnDLTrt9RTQ5L8GJvYLVK69S4g7onBGKHE7XyvLuW3Y+Hq8D84UGHOnqaJOvcks7rWVWw4xc4eVZsOyW9QS8lrGzjVukPn2fdUEWBLAq3nQEGNUMbp+72VX83LHYWawW7vXpYGeInkKLXOVlSk3QLl/wbxvlsETSofbzLnDCxvmz4hwTfgrSPH+zg5mKhIaznzCxIUZx8OyjLJJaEZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4H7h9XyIexEM4HCFv2Tpii9/LhO+WZLCaaFVC6ls8LE=;
 b=UgZJZbrrLDloeTVg1cIs2Qv/c8P4I1sz8Hd1Y+M38/qBYuWkj4kEUfYGYUIGEaWfH995EmELeT7NMt0eIwWA3fx+2NMjdfWKIudoGgFzwCB3lgjGgYPCUQL2QpgvLHmIALTxxeDTSTSQHAAq+kQkRC9l097AHp/EoxbI9TgemxZbBtNueHuZU0fAtm82r6AevY8ICMW/2sUHsezz0g6RJc16JdzvvN1mRpRI+jficW2nlndsftR2kKePpaPH3PvOGODHC3G0ElFaZsOfpRMx6wupUb8ASEOKZTr3cJCNpRCNhp8xHFrQ4V0KreUPwx59p1w7s8GDqqBD8yOfvxADaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H7h9XyIexEM4HCFv2Tpii9/LhO+WZLCaaFVC6ls8LE=;
 b=DbdHFduB7ibRbegi2GiX77WfU/Ha6UkDY0/cBqUARIOD1WLKtwxovzSu7bhCBtvoN6+bClClry9dS2sBxgTEM9f73bbP0zmOkhDIaVGFrMsG4P4NgGsKoWIyYpYW/j+6acSB6L4Tc7H2x+cpG8Y5voQ/fcgGWqnX10qqwSMKfHrfMQ2i7MLDx9h/ModeIJzyaFTQXhWnV+U0ddo2H40JGmp/2g4+QnLCVaMmEVgbYIXkZEYDfk7S/yeMmDZebp8ky3I1gbW421lf+S+J/KQq3Xe/9EgUQCUhvfgE+4b7WjAtTKMcAzhG0vSME1ogoGWzZzfN1SOCeCqSkPSsvMpUAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB3465.namprd03.prod.outlook.com (2603:10b6:5:ae::19) by
 SJ2PR03MB7139.namprd03.prod.outlook.com (2603:10b6:a03:4f4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 22:49:01 +0000
Received: from DM6PR03MB3465.namprd03.prod.outlook.com
 ([fe80::1ddf:36b:d443:f30]) by DM6PR03MB3465.namprd03.prod.outlook.com
 ([fe80::1ddf:36b:d443:f30%4]) with mapi id 15.20.9094.016; Tue, 2 Sep 2025
 22:49:01 +0000
Message-ID: <7520ee2b-fe36-4f41-b0ad-f0a62007b2b8@altera.com>
Date: Tue, 2 Sep 2025 15:48:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain
 interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Matthew Gerlach <matthew.gerlach@altera.com>
In-Reply-To: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To DM6PR03MB3465.namprd03.prod.outlook.com
 (2603:10b6:5:ae::19)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB3465:EE_|SJ2PR03MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 05023f5a-2766-48ec-22ae-08ddea72e8cb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFY1UWpDUDJxR0kwZ05pRC9jdldYa0EzbzN3bDV6VVBCS0hESUx1eVd6Z2I4?=
 =?utf-8?B?Z3dhRThkVlQvblNKR3c1YTE5anp5akRacVBWdEs4T3M3UjFQM0dQL0dTa0FR?=
 =?utf-8?B?Z3hSUS9VZUVrL01QcWtxUzVKOStyM0FNdXBkeVlTS21Semplbis5VVozcUxD?=
 =?utf-8?B?NUxuYlpIZDlYOG9BYitMZTluYzFYd0tqLzVnSWtibVlIMWpTVkl3amh6Yk5R?=
 =?utf-8?B?bVFNbDBWUUgxd1V2YktKN3Bkakg1UExOakZjeE5iNDgxY3lTVlJyYXQ0QTl0?=
 =?utf-8?B?a2FrN1VHa29JUzJqQ2FKYTZrcm1qMjBVSGlnS1hzNmV5TWFjV25JZXk1WTZQ?=
 =?utf-8?B?MnBwejM0Y3BYYW1uNTVibnFWdHByNS9TSUM2SXhXUGhPMlJXK0RCYkdqRUZi?=
 =?utf-8?B?UDVSbU1HTDhXazZNVGZHZUxIZFpDbkRUVmhyWHl3NVNjUWExZExmMmtlSXZX?=
 =?utf-8?B?cFhPT2NjOEdFaWtYN1ZqcGYxejBFMTNxL3U2OEdIUUhXUklBVjllbjZRTlMy?=
 =?utf-8?B?WC9mTys2TjVEbVVKL3VnV2JXWGZsSHhRT1VaYklJekxQUjR3bGNMQ25rUmpF?=
 =?utf-8?B?V1lTakp5cUt6SjkyTXBnOU81NCtkNjFFdmZGN1M3djRnWndhNzE1QnozSnp4?=
 =?utf-8?B?b0ptZDJRVG9lckswRDNMVjBQWm5aZVpUcHVtL1dVNjFiWFQ5WXpXbzd0ODVK?=
 =?utf-8?B?aCtvREEwcytRVGlYcWRDbUgrYzRGb0NVTUhyNC9XRy9jS1UyUzVaUDk1ZmxK?=
 =?utf-8?B?STNLQnd2bmxYWmp0Q2w0VUk0eGxUTVJKS2JQQTcrUkluUmNENDFaNStZQ1I0?=
 =?utf-8?B?bzN6RG9MTjY2NlVFWkNmSnd6MXFKakNacGVjRjVFdWdwWkZJYkpEemswcUlE?=
 =?utf-8?B?ZFJkRHRGWGlWYVpONVFGMTA1K0dZcFlZMHNscitYeUhEenNWWE9XMDBaaXhl?=
 =?utf-8?B?MU9LN0Fxa1NhbEVJS1R5SDNueHhMai9PclNWd1V0ZkJVU1N0VU8wTjRlR3dN?=
 =?utf-8?B?V2dTMFNzWHNnakFra3pGUnVCa2k1SWFWMU9kcG43SzNrOVB0VGpDelFJN3Bj?=
 =?utf-8?B?SGdkdG9QdFQvK0pncEdtMXpKMmNHcWlDNGxaNHcxMU0vdjAzOTlwaUlHbGVi?=
 =?utf-8?B?S25rbnEvTjdpYlptS0g2RWNlcWFVOGkvdzlmRTVUdXNjZjVoblo1ckQyTzNK?=
 =?utf-8?B?YWhrRHQ4N2lVazhJdFNyTXJwdUI1K3hGTHdsaHVRVXB4Vm5uc28xc1FCdERD?=
 =?utf-8?B?UWRTd0h2TzhPWXVBL0ozL3FuTmJyNlJkTHBNRWU3SWlReU5iN2hvNDV5UEpZ?=
 =?utf-8?B?aEVpUlZFdHFHOUEzQVVZNUtuOWFFUmxQTzE1dHY2R0E0Z1FVM3JLekRRUVRq?=
 =?utf-8?B?R2piNUVJZEpvcWQ4M0pFRm1pbVBJWjZ4TWkzcnVXMEV6MnAraUh1U3FoWFZV?=
 =?utf-8?B?OU1ua3dZS0JxanFrVmZoRGRUTGVtU0o0OUhydW9YMXdEakZMSFhNVjM2V25R?=
 =?utf-8?B?dEUraW15SkpYdm5MQ1pOcDJwdFBsZzJXK1V4WkFvd1ZIYXowSTVMSEYwVnQ4?=
 =?utf-8?B?amdxbUlWK2RWaW9KYy9QZlU4OUhyL3Z0L3NKMktiZ1BSMnpVb1djODVHOHNV?=
 =?utf-8?B?c3Z2c3ZITDBReS9tUkYzK3pka0RiVG5IQ002YWp5aUZYSWsrSlJBWkNKaUxw?=
 =?utf-8?B?ZVIrbW1TenAwV0ZiOUVRNEFUam1IYmc1M28vZm1HOXRSblNveFVFdDkwNUJX?=
 =?utf-8?B?Z1FBQ1dXK005cDhGK2Zxam1LeXFMTmZnWWszUlJONzlLc2duL0ZRVFRnRk90?=
 =?utf-8?B?Y1E5QmdVL05ncUtPWW5FV3UrT0Y4aU0wbkZYa09VWS9HRW1NZDB6Ty9OeEZa?=
 =?utf-8?B?MVQ5N1M1YlJ2UGJBWk5WT3FlSlZBcURIVFZaU3VIY0hTMDBRSFVyWWJvRkxZ?=
 =?utf-8?B?eHdyV252UjNDdmtTUG5hZ1djWDJjYkNQOTBLKzhQNkZsT2pVWlRSdkJOK0Fr?=
 =?utf-8?B?SWJhOW05c0pnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB3465.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0ZsT05tR0Q2VTZ5UUE3OVppTUZCaUd1dEVORUU0VTlZdHdxWjk4azNpWUVK?=
 =?utf-8?B?RTVWUm1mM2daZlUrVzdELzlmdXdVcERTNUg5ZzI2aTdPcTAxWXUxTmZZZG1L?=
 =?utf-8?B?WW5Wc05CSlE5RUhyYjhmME9BVXVqT2s2ZzdRK1FNclB0U1VONnJISGFUdksz?=
 =?utf-8?B?a1dBVGpNODZ1NVNhS3hJM3BHcHNSOC8vTHFmN1JuTm9kS0xSSlo4T24yMUp3?=
 =?utf-8?B?N3dmUGE5WEFVeUxMMEh3Y01ic1hoWXVxbWRQL01mUDRhUTZGVkdOUE92Q1ov?=
 =?utf-8?B?RzBIU2Rhdm1BdkgvWWFheHVEbW9RYWR4Vnk1b3JacGcvSE14d0tSRlRXTHdF?=
 =?utf-8?B?dVpLaER2NFJidHhaQ3hVZUNLcHp1V1ZRYVJOZFlUcWZOb2dQYVNOVnMwblNG?=
 =?utf-8?B?VUlWNlBZV0FtQkZmZkxJUGl5QkNvQmRKWVhQTnhwVU9Xa3o1b0pvYWhVajNC?=
 =?utf-8?B?MVl5K0UvODdPN1ZYd2pyR0RkbkoyNFdXWU84c29ISkVFcnNtU0pmSEh1RUJv?=
 =?utf-8?B?Q0s3ZUdUK0hpeEJJRkFoNTJlY0M2dGF0Y1dpRU5xR0ZZNThueko5WW5oSThr?=
 =?utf-8?B?d1dsUStOSXllTzlyOFlKUjV1OVpJK3lMdml5eUxYRmlZRk9mZFdweDhjVWhn?=
 =?utf-8?B?UUJHNWs2OG5SSFZzVEs5ZDF0WmMwMWdFeHppVnRvNURFWkhYTEM4SlNOVERs?=
 =?utf-8?B?Z0R5KzVBSkwycGFBY3I5R2pUNThMOGl3TkppVUN0U2JCTS94aUFPUllkdFJM?=
 =?utf-8?B?UmRlZHV2d2VsNmVmdTB4OEJEYkJFYXRPYlZnVHNlU0hvRVZ2R1JhU2EwblNM?=
 =?utf-8?B?Z1FKdDBlNUhCdVJ3aG5FWjV1Vys3b3BMM3F4Z1FSaCtaZ0lKMnMwckQ5Qmgz?=
 =?utf-8?B?RVp3bjdVTHBOdDVQZWM4eWIxZG5qWnVJRDZhSFN5NXpVK2U1TVZKdzg4Zm5M?=
 =?utf-8?B?QUcvZm1vVmM0MTgrV1V1Q29ON0dhRVZ4SUJKVHdOakdwQXVRSmNEL2I5K2sr?=
 =?utf-8?B?RnB2b1VJVWFPSHhLQVJKZWdnTkNDZ3I3OWwvV1lnQkUvR08vQi9La0I1cmN2?=
 =?utf-8?B?UkJyRWs5MlhUbWwxdXJBVW4vaUcxZWhCbFVhRDlXWUxhOXB1SDVnbE1vL3Zu?=
 =?utf-8?B?NjI2cFV3VGMweUsrRytEckRnWCtoWjBsVFFMVUFLWi83TXBEcUhTYVg0VGRH?=
 =?utf-8?B?Zzg2NU1JK0hLa0lycEVQWEZIZHovYVBDRzJwRnFhVkxXMjhHTG84VGJGUzhh?=
 =?utf-8?B?cjRrcUJxU0k4TnRQYm56QldoVTd5aHJyRXM2MkpPSzBiRDdpOW84ZW5sQ2hK?=
 =?utf-8?B?eUlRMC9yRXFFMWZ4cUYrZ3VZNnhpNFRNamVNTkNNcDRGNk13Q3RTbmRvVCtj?=
 =?utf-8?B?Ykh0SmF1TlFUT21CZVFubDNqN3dEYnJ6a0FDZTVieXJiczJjMFJJeTZuOE8x?=
 =?utf-8?B?Mml5UE00bThmbkV3V1ZvMnhSLzN2VXQyNytHbnNIdFJDM0h3MnZiRXpwZ0tW?=
 =?utf-8?B?WTNneUlSZGFQc2F4L01nSDVFbW9MV1UyZEZIcmlRRmxNbUpXdkZHSW5lbnow?=
 =?utf-8?B?RDRTWENrS0hOZjVWa25RRXh2SnBwNlp4Sk9Ybms3MnY0bk5xOXdEL0JnNHZk?=
 =?utf-8?B?VGVic0Q0a3hOdmNMaWRaOW44SXhEcnc3VTB5NzJXTHorL1lFUk5rNjlKbTVx?=
 =?utf-8?B?YnZ2elBXaU1ka3pDTG1BeGhoT1dRN2laNlR5LzhUWUZJaVU5bVBuY1Z2NTJK?=
 =?utf-8?B?L0dKLzA5NXRNd1BhZ1VCeXpkMElJVjU5OVNER2dmaDF6Wis3dmNsemd1eTQy?=
 =?utf-8?B?azFycnQvdWo4eHhQOW1Ncy9MeWp6TEQ1RGNydlkydlJjWklKTUlWUWd0R1J1?=
 =?utf-8?B?NncwSTY2ZWZzUWpDL3ZGOFFDbG54UjFNVDRrV2VZZzdOQUhyaTFrMW5vcjEw?=
 =?utf-8?B?b1RjR1RObjhjcmJOb3cvZzRuODZvY2UzZ0xaeS9FOUh2WWlWc3ZSZWNNaDJD?=
 =?utf-8?B?UHIzL2MxK2JIK2tvZ1l6eGN4VXEvZTFqbW85ZFFSZ1JNeVVpU0k4eGhDWjhB?=
 =?utf-8?B?dnpHTHozTVJTS1VHby92SzZzRjlGdWlxSnB4MWdpaW9DVXY2UmpzRjlObk1q?=
 =?utf-8?B?Z21FK1o0RUd4cmttTSsyZ0hNZXYySjlRWmo2VjY4aW5LYzlUSitXQ2lPTDlB?=
 =?utf-8?B?dFE9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05023f5a-2766-48ec-22ae-08ddea72e8cb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB3465.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 22:49:01.5570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nj0SFt9UAWMeL1tPvjDlc/ZNschjZdCkpqmXGwfWI9xSGokvAzxfQXAAXRSnQ2mxOSZZuCwcUz61lvfo5wwdR4oy7ZLRybOUjgxxtit0jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7139



On 9/2/25 8:40 AM, Krzysztof Kozlowski wrote:
> STMMAC on SoCFPGA uses exactly one interrupt in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Matthew Gerlach <matthew.gerlach@altera.com>

>
> ---
>
> Changes in v2:
> 1. Minor typo in commit msg.
> ---
>   .../devicetree/bindings/net/altr,socfpga-stmmac.yaml       | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index 3a22d35db778..fc445ad5a1f1 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> @@ -62,6 +62,13 @@ properties:
>         - const: stmmaceth
>         - const: ptp_ref
>   
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +
>     iommus:
>       minItems: 1
>       maxItems: 2


