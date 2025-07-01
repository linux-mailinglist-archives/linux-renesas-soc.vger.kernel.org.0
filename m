Return-Path: <linux-renesas-soc+bounces-18947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BC5AEF2C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 11:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0811189F42C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 09:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F2F26C3A9;
	Tue,  1 Jul 2025 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fNd6cckl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3DC72602;
	Tue,  1 Jul 2025 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360993; cv=fail; b=lHbHcwFgETLSJVwntyVcLKkK8VJ4JSd51LTkw1aUmxluSEkqtij8WNwiR+fC/r3ZZXSKvwhWVL7Gn/Uqgk0i4teuzFlsz+PXjqn1ooU9+ZMeB2XnCvUrnFbSXHFHztdxdWWxdO+JSzvePqzAzka1uuesOidNN1LdackN/uBJgzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360993; c=relaxed/simple;
	bh=O2gqB9OV7znOaepBjVvEhnj+E0nV8gJ6sasAIcRd110=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ugZbMZ1da5Czz4NpyorORGBNt8FL39JGnLWAoIIUUsSB0qDC61mEiLQlcWNIWNey/myoDVJpDqFb1C+/uuI++gvpLbXmo0dQd+14k+2kzztcvezp06/vAXm9F3PWKGY2HPmzcBVVVSqpZLd6o3srXzYNVqc1A48HALhvZQ1/KjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fNd6cckl; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOD9eFUNpTets3aKJA4PHw0Ps/vWHWCQnu1+5EM/5unU4v1TtPzIzoRI4jP3Cakp8sg/haEBZzdmyT7a36oq+tGWhZ3U7TpzqIYausdKPC3OG0DQML5OvdYs81EE2VltC3wNDFuKexu6Y6UqRt7biY0/xFcMgcFIaG6mW6mmgS1qm6JbKhDdgl3oeo/60SV70W/UWzx8MBb1ueCxyq6mZ5aeIKVXMYBAPF/QkLO3yK1QnpBHF0gPURmG9R3bs7uedzxMQmH+I3W+k925Qm4jcJIK0NDTPzsy6ctyAF3ftXEOmGILNAP4+1Q61lYRbP3u8ea5A7R+FP2C1+fnepewCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TI1LG9W3F/ZulI5+1Lw0NTVPy3GuAHD0WFzrCPJbWtM=;
 b=TPQJfgoewPO4unf73pz5ibC8NO8CozQwOvQu+mBq0Badc31GeSHTtCLjhneSXJcm/H81bB61KFNJzYTpMV3Zl8O6PGq62v/JLGnKozWcPtANtAVcxzWV7ivu8UWkXAQXz0HKaY4xml/Or9pd3ai3ejiUx9//YOZMlsf9ywH3qw7aKjoMlh9kCcieWqZ1voSyuYw29zpYFIPlUwHvIyJyimuEyY2DaWVynb5VJn04g4HShbGSHiawmMAGBlGZg2a1jjFsAuIrgd/GvOpVrGf+KWyHnqIjERYglsuadPRecj8B3b2+rLCTSVptvWDeToYRXvRWt2PmJNbF9DOAYUj5Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TI1LG9W3F/ZulI5+1Lw0NTVPy3GuAHD0WFzrCPJbWtM=;
 b=fNd6ccklViRH09/cfARjKTOXrCZrITBE+UuFYlh3UT3esotibFoEEb8qbFrpQfCrpghNvl946fL8rV/ptm/4oloJgsdm1HJEfGmXryLmHT3eR0KJUSM66fYMwuU8oLY6q6j3jLXZ+BsWyw/zYGEotUFZwonHL8AH0oPg7dt/+JE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSCPR01MB12591.jpnprd01.prod.outlook.com (2603:1096:604:33b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 09:09:47 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%7]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 09:09:47 +0000
Message-ID: <bedabd80-ba9e-4f70-9f75-655ce90d2b8b@bp.renesas.com>
Date: Tue, 1 Jul 2025 11:09:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
 <20250625200709.GA2125481-robh@kernel.org> <aGLo1mlrHT_IZHQv@shikoro>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <aGLo1mlrHT_IZHQv@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSCPR01MB12591:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ca60d0-d6ee-49e7-fe28-08ddb87f06b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlZuRmpsSk1lbDJWa0ZUTFhXM2xDY0w4ZHlOSStWS1o2VS9COGJYR0I0TVhh?=
 =?utf-8?B?U1p2aThYM1g3V1M2T2dWdW9GSERvZzJhMHVvTFlEelc0WFh5VEpJR2gzeUZE?=
 =?utf-8?B?YlhaeW84K2JpcTBTYlFVZ2dTbXh6UDVXVXZKTUZNWitoaUR2bWtJVDBsSGtW?=
 =?utf-8?B?MkJlWldRakZRN2k1TkIybDRYOWtNQ2piajdsK2tFeTRFZWRDU2ZRTE1jOUt2?=
 =?utf-8?B?N2VWYWw2SEJnNyswdm5SWFNiR3FqSllBWklqQlVSSW5lc0ZtU0RkZmdPWTBr?=
 =?utf-8?B?SVlUVWdsK0VUZFZuV2VrcFFrRU8yZDVFN2lUL2NNQk9sNmpJcitOQmhSc2tD?=
 =?utf-8?B?cGdEVkpMV0dZMElHRS9CMFdtM0xobDNSVkZJLzcrdnlnakdTZ1c4RzUvUldT?=
 =?utf-8?B?WExWejQzQXhVbUU4Q1JTWk5iVkwvc2ZTZXRYQThiTWhFamNlbTFQRTNvN0dV?=
 =?utf-8?B?czJzWHhGb2toMGhYTUVLR3Z4QUJ5ZngrMERYQ1RNNmQ1dW51RG0rYm5zdG9T?=
 =?utf-8?B?dzBmdldJZkRKbXpFNktGclJxZndjUHVtWFJodkdUTjVuL3dFWGRIZW5mYU9u?=
 =?utf-8?B?YWJkSklTU1hhWldlekhDeXVoMWYxUXpNWnNnUThWNjhVMWNuTWxxd2JYb1c3?=
 =?utf-8?B?NkRERmpmQVFoNkpVdHd0bmJsdlk5VUZGTWxZdmU4eTlpcmM5aC9nSElUSXBB?=
 =?utf-8?B?bWxRM3ZxZ0V6M0tsOGxYaEtFdmV6VXk2K0RrRndIYnRTTldmazVoRzJEbnFS?=
 =?utf-8?B?UHhweFpLdEZ5eEpoWlhINjA3YmxSNlhOUGJ6S3U1NmhDTE13eVFjdFNpd1ZL?=
 =?utf-8?B?bVgzTTFKTU55ZEdGdmNaa3g4UlpqSWE4em1GcS8zc3N3bGsyUXRCaVY1dnpo?=
 =?utf-8?B?b2FTS1ExUGhYMXR1REYxVVI4VVBvdC9ya2tHenRiN3dEMlJKL1lwU1RrWTJD?=
 =?utf-8?B?QXVaMG5IMkVZb0pUL0Rhc2lwWFpuZEJGYnN6NHo0RW90K3loYzBDek16TWpm?=
 =?utf-8?B?L2E4QTd5TG1aejI5L3dVREZHUitKaEtUaitKOE1RRzQvSHNPLzJQN2hnbFhu?=
 =?utf-8?B?QXE2Qkc2S0FlcEN4OTNSUG1YY1Y2cktGV3RXRkxjS0E0NitBeDIvdU9CNHJz?=
 =?utf-8?B?bXJVcERiaTVRb1VMb2xtVnkxZ2NKRmJVMnNYd21ybng4cXdxcXN0aTVOc1ZO?=
 =?utf-8?B?em1BSDdDRWQ4YlBLdFhLQkkvS0RCVUtYS2JwakFPZ0REV1F3Y2RMVEx2OGQx?=
 =?utf-8?B?TWpmYmlCaTU4VklVdzduZ25jNnR0YlBWVi9mWk1CUDBDRTlWdGxWN25oMkd1?=
 =?utf-8?B?SzlXYzBwUnF1eGNjaTBOM0d1R0tEd1Iwb21JRkk0M0RpNzhCc0dSMWd2NU0w?=
 =?utf-8?B?S0ZoL3dJNU5iRWtFMnhhang0QmxiU01iNi8zSllLdDdBellzRFJjRUNlSTVY?=
 =?utf-8?B?RzZSTzVSTzdldXg3d2JZa0F5eStvU0dVV0tiQjFMQWRBQTZ6K3JPaEZxSCtY?=
 =?utf-8?B?Uk8vNlZPcSt0eWxyV1QzRzl3a05wa1NqUVlkc0FUZnkvcjFYNFZES2M1Ump0?=
 =?utf-8?B?NDJpdG1ST2pSbmNVbHc2bFJQeFlvbm5uUUtXVUVUaGJZYnIreDlPK3dhV3VM?=
 =?utf-8?B?RnZiUlNkSW44clRuU01VSHZoMHc1NUpVQ1JRQzdvUkVSTDBKR0NoZ3VUQ2w1?=
 =?utf-8?B?SUQyTmdlZXllUE9tWDNDc21GSFZ1OUZ3Y2hrTCtUTTdwODBFU1FOMVBwUm05?=
 =?utf-8?B?ZVB3SGI4eERWaUlyS3ExWjdzd0E4TG1sVE10em0xS0FKMm00K2pUVWdHOHdh?=
 =?utf-8?B?OFVCcFU1REdjMERQUHp4dUI2dWhUUVQwQWJJUzJveEJVTWxKQTloeGQ2RHBL?=
 =?utf-8?B?dlhGN0Z1TWVXejgxSGcvMzlqUWlvaEhBeTVIVnJMaVE3WUxuMWcvL2lwQWdv?=
 =?utf-8?Q?d3fO/R2cnGM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTZKNmFQVDBsNHVRQzI4TitIMjZnVzhjZTJPNkhONTlWRkhyZTVlS24wR0Jh?=
 =?utf-8?B?eHdFTVMvcndaalZlTkpWdXRBbkNvWkpOS1BSUlhiY1V6dkZVYnFMNEsvQmdn?=
 =?utf-8?B?NDJzYTFuaE5FUEU3VGZULzhMVWhOQmU1QnB1QWkyOEdmRWkrSUlCR0tjOEk5?=
 =?utf-8?B?ZjFwR3oxTGxCRXRXdzlpUCtaWGMzSUI0Sjk0cDRkb3dydXovdC9FOEZCb1RJ?=
 =?utf-8?B?ZldpRjR5RlRQMVFEc0xuQjJORzFVRFYvRG1lc1orQkZ5NVQ5eS8wZGQ3NWY1?=
 =?utf-8?B?eVZhV3BKSzBMVlJwc1lnQy9aNlJNcURPV3ZQMXVmZHZRMk9pYVVsd3Vuak9J?=
 =?utf-8?B?UWl2ZWtuenF4UFZqWE5CZStMT0xPcnp4ZUdEYU5RQkFGYmFrYmNwU0pWdTJp?=
 =?utf-8?B?aDZMaDdQN2RJbHo4QmkxVVUzWWpGWGQ5bHRkSldRZHVOeWovQVZRY1hXM2x5?=
 =?utf-8?B?V1BFN0tWRjZON1d6SjNLNjlUNWVzYWN5RlpZN3ZiUkZRYXdNWVdPNzFCaXdw?=
 =?utf-8?B?T09xT0FTV2IvcEJkTnRDcUYxaitZdmlsaHZzWmJ3aEJWTnlsYUJjdGpHZUFy?=
 =?utf-8?B?U1pxTlRZRXpXTjdNekZ4d0dwTUhtM0VGa2w5TThSdlQzSmlDQmNlaU1IRnhm?=
 =?utf-8?B?NzlVY2tFYitYK3l1cWJhd1hyZWtRN0xHc2NvVnFJcmdMYTllaEV0NGpPNXFJ?=
 =?utf-8?B?cW9nMEM2aU1Cb0RaTU9DM0ducndYMENaT3pQVndKRXQzeTNkangzdUp3N0xy?=
 =?utf-8?B?QnN5d3dTeEhSOGNUaXJSa0p2SlNzYzVPdlJHaXpBbjBlQVRIaUtJOVNKeUpp?=
 =?utf-8?B?aXJvKzZ6WkxpdlBwclhtL2Jia0Nuanh0c2RYM3psVUMrb3RvWlJ3Z054c0Zv?=
 =?utf-8?B?YnE0ZGNiYSs1RnFBbkhjL2p4ODgxTnJKS244Z2VPSllSWUxLcjRNUDdER3pC?=
 =?utf-8?B?ajJ2cE1DVXdET1hZMkxKdjlVWmpYWEdqV2doM0xWeFo2c2hZMFBuSEJLZVhS?=
 =?utf-8?B?ck43MWhmU2hPNldRdEJEZE5NVkZ3OWVETUpad1dhbkdhMDV2d2U4Vm5yTVVS?=
 =?utf-8?B?RGdmQ2N2UjF5WHVLeVJJRFZQMzVMRTBSMkFKbnJuQlEzOU56REE2UnhGUlc1?=
 =?utf-8?B?U01YN0RvWXgvS1hwcGJNUkxRUUJ6VE5ZT1BaS0JLckg5MkNaaG5lTFRMUUxa?=
 =?utf-8?B?WXZmR0l5TWlzanFpSVhzd1lFVjd0MVlvMTJtSjNOWElzRmR4U2RCc2FxTWhj?=
 =?utf-8?B?UThrdDBreE9BUFFuaEMvN29QYnV0a0F1a1JUcWdGWjVScHdPUVBpS25jcDhP?=
 =?utf-8?B?VU52MHNSaUVkdjRqOS90bURZNUZQZ0RBNmdyRDRrOHVhZml2dlAweDY1OHJo?=
 =?utf-8?B?d2lYd2dRWGF0bm5rUFBUOFBHc2NKMzBpMXQxV2VOb3pEcTBpYjdUY3NmRjBN?=
 =?utf-8?B?UllqTzdPMGdVVlBkeVBKY0R6ci9zUGtUT1R2d25rUS9PQWhsMytXWFhpclhr?=
 =?utf-8?B?dVoyZlRpMTJ3UWJCOTFrSzhtc3JRVG01SGk1QlNaTVJoeS9qd3ZUcUYzTkhz?=
 =?utf-8?B?TUIyUDM1bVVSWTNZS2tXdnRuNmN4RW5NRjN1MkQwV1dhTHBtbzc4VkM3OTJz?=
 =?utf-8?B?NjF1YnRHS0RlUTBnby9OOTBPblFVb0phU0ZCQW53MC9oc2pXR2JvT2I3cmFs?=
 =?utf-8?B?OGpCZjNhK3NmSGtwNnBPRGVrUjJxTWtYaGEyNjFNRTZ3WDdmeXp6WGFSL2x6?=
 =?utf-8?B?dlU1STdMVldaMHFkUnBUUmczVjMzUGg2QmN5SW1qay82QWJvSm9UYUUrajV4?=
 =?utf-8?B?MTJWSVVuZG84T3ZDTGVTRDlDTlk3VE81NExuSXdVY3JlYUpuamRvdzVEVnQv?=
 =?utf-8?B?eDg1RGMyKzlGQU1nU3pQU0xDVDVrczJyQWpET1E4Y0hTYTlwZFpBMlRpdFdl?=
 =?utf-8?B?bUJJRHRHMlpqbGp6RS93a1VuYmlnN1kyWXZGYUpWbDFYbUVTaXBqUllrVjVm?=
 =?utf-8?B?MzRMdHI0R3RSV3JEUGFqR2VjSlpRUVY4UzBHY1Q0M3JOSzdjMlRCczE2OUFu?=
 =?utf-8?B?RnRKRUc2eG0wS01PV0hacnRYL0NXTHNIKzE2aENTYUFlMEYvQlFDSTNLNEpm?=
 =?utf-8?B?K2doRVVwV09jR2U1Z2JIUzNLVlFvT2VsWEFqa1lTVlVpREJsTDJqZ3lvTW5V?=
 =?utf-8?Q?/8deOm1UtenQ6+8UtaNGPcY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ca60d0-d6ee-49e7-fe28-08ddb87f06b3
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 09:09:47.3138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGbHQVuTDvHdctKQwIy1VamnIAeR8yZg46jSy11kPKbW3y09cc7pzGo9dzppa4Sgdk+RsGhEcJZj8LqlVIv0q3c8mu+wx8iWpvW+WfTg7LHTPKqWTI9I4hZH5WBRlwga
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12591

Hi Wolfram, Rob,

On 30/06/25 21:43, Wolfram Sang wrote:
> 
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: ierr
>>> +      - const: terr
>>> +      - const: abort
>>> +      - const: resp
>>> +      - const: cmd
>>> +      - const: ibi
>>> +      - const: rx
>>> +      - const: tx
>>> +      - const: rcv
>>> +      - const: st
>>> +      - const: sp
>>> +      - const: tend
>>> +      - const: nack
>>> +      - const: al
>>> +      - const: tmo
>>> +      - const: wu
>>> +      - const: exit
>>> +    minItems: 16
>>> +
>>> +  clocks:
>>> +    oneOf:
>>> +      - items:
>>> +          - description: APB bus clock
>>> +          - description: transfer clock
>>> +      - items:
>>> +          - description: APB bus clock
>>> +          - description: SFRs clock
>>> +          - description: transfer clock
>>
>> It's a new binding, why don't you put SFRs clock last and simplify the
>> schema?
> 
> Similar how we handle interrupts? 16 for the one SoC, 17 for the other?
> Putting the optional entry to the end of the array? Tommaso, can you
> integrate this change, please?
> 

   clocks:
     items:
       - description: APB bus clock
       - description: transfer clock
       - description: SFRs clock
     minItems: 2

   clock-names:
     items:
       - const: pclk
       - const: tclk
       - const: pclkrw
     minItems: 2

...

allOf:
   - $ref: i3c.yaml#

   - if:
       properties:
         compatible:
           contains:
             const: renesas,r9a08g045-i3c
     then:
       properties:
         clocks:
           maxItems: 2
         clock-names:
           maxItems: 2
         interrupts:
           minItems: 17
         interrupt-names:
           minItems: 17

   - if:
       properties:
         compatible:
           contains:
             const: renesas,r9a09g047-i3c
     then:
       properties:
         clocks:
           minItems: 3
         clock-names:
           minItems: 3
         interrupts:
           maxItems: 16
         interrupt-names:
           maxItems: 16

Right?
Please correct me if I'm missing somenthing.
Thanks in advance.

Thanks & Regards,
Tommaso





