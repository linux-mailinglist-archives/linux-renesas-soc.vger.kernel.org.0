Return-Path: <linux-renesas-soc+bounces-23136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 31058BE2ABD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 12:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C0DEB4FF287
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 10:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114BD31A57B;
	Thu, 16 Oct 2025 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mp6tbknC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD53319871;
	Thu, 16 Oct 2025 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760608991; cv=fail; b=Mvr6gmX9FxZKmHxYiMtL+XifrMZ9Gawjlc+drRVk7WSMfMqqQ3q5jVvyTUbd+fwBzqyLTzqFMqsdp/Ey2pb3ioPqsd9LUbZxVaQV0jgHCNrXzhuxsQDoxud5SiD8t8deGYJv9KPlwXQi7aV9jOeMZVTwnmPExc34KFsBXdeRWOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760608991; c=relaxed/simple;
	bh=QBIIo7dqOLlus6l+Wn2PVbeWrNL/RRqddapgrTD4mQY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rg1FIrF+mNtIEgopYsHXZGl0Qw6BOfbk2WNXSzRb+BN6hlyJVZwpMpRcqUgdgcaWF4COvncSYuI4/pxFNc74hm7IVOPT7FHUSp2F9N+1DjihqJ4bxsh1Dd2gjIlY3fd/iAfX0otLn9mNQvYd8wHa3CHHZ2VrTGmDBL3jqxVBhe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mp6tbknC; arc=fail smtp.client-ip=40.107.209.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlVQZhy4GTaEIiFbKWkT9DDOQz1meM1GS+/9raru+jnyW09kLRHSfyoM91cQMN95WEN3hEqbn2UIkVuBf6fXZ81pHasrTCqbIw8O6cHtj0A9OOcgyMaw8SX/jv0NjZ1dqChB+YeHkeVFCHEf7eGnddcNBeZA2ubFIgrrBJDmi+gbvgteS2IyUkZHohPj1f0R8583EePAFbBQakvjOlEd4UUSOI9wCMwOe1oI7qrntrYzb+QZB8it1pIpeal+tUaF+wXrJmQp8scNRpJe3ffHXiR/+IDaZgq2cU/2n5vfOqIRr6qUfA059rnRBDoyOieDaN004Z8r0sLeU7VlLUi3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itZtNURDHK3/HVjRhtSh98sCBalsoPZBFVSIh+M+big=;
 b=ERnykeV1rwD4uD1aFZAW0WZFUaoJKA9G/FmiuHbyx2ju4Ulsoi8Gi/IXan+9Tnt/GKmSISywN17FUo8xg/MX1a+lQhE2T6VCcUHHfOR0hAxFlh6+JN6uTu2LxqxTmEsvXIY6GB7G8nGfA+Sr5tPyO/W0AWdsdg0fJ4oH6kOecGq0jHMraYKub+LPnHX5jYJ2i7SdLfP1k5d46Rg5z/xvWHheCizNT6u0sNB40cO1kb3nEMl5lfz/8SSVWek8pyILsIiLJItqXo9Tg6Oi89U01nAZSd1EecA2nP719Ia5vxO5/CUDZJFsg8fuGirmQWVwFYFo2/iQUdQmOA8AjEyndQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itZtNURDHK3/HVjRhtSh98sCBalsoPZBFVSIh+M+big=;
 b=Mp6tbknCNDL498Qssrd23NaVwt/0xFAYOj46ELQ7unOaEZLpxnmmaZwk1ZRZfMrC/g9pvG7iuqZ0naczz4RkKBg1s4iSY8zRTE1J+qILQ1AKcj2X1qtmQDsXDM6C81Ng6w0aUbI57dtNAGo2I3bnt6GTApUZDhmrIValVmSo1cI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by PH7PR12MB7258.namprd12.prod.outlook.com (2603:10b6:510:206::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 10:03:06 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 10:03:06 +0000
Message-ID: <b01bf4eb-d49f-4edb-bf0e-d97b000a6b3f@amd.com>
Date: Thu, 16 Oct 2025 12:03:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Drop duplicate CONFIG_OMAP_USB2
 entry
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Nishanth Menon <nm@ti.com>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015150728.118296-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVUos1===uyOVwVTsmqpf321sX-hYJ36L6LKdR62sC23w@mail.gmail.com>
 <65f59d84-c4fe-44af-bf8f-7c95b7e1fc80@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <65f59d84-c4fe-44af-bf8f-7c95b7e1fc80@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:a03:60::46) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|PH7PR12MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a2bf2a-edd8-4fec-4f43-08de0c9b33e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGRhL1JEc1VhanZON2hnYkI0L1Q1MUhpLytTMVEycENzQThFMFI2bm02RDdD?=
 =?utf-8?B?OVE0RCt0ZlZBaUIyaTE5T3E4MVFCQ3A0cWl5ZWR3UUxObmRQeHVrclkzM21D?=
 =?utf-8?B?VVpDQXowWk9qYWViQTE0M2FyNXJvek5rTjBmMWNqT3p5eVJtSHpnTVNDU2Fs?=
 =?utf-8?B?QXlHQ2tPNkVhOVVWVlhRdHBrTXJIRzdnLzVKazB6eTlpTGFwNnBZRjJ3UEdu?=
 =?utf-8?B?OWNrVXZocXB2WlZWaDB0N3NSMWlpbUdPZVYzR0lEZ3JrMWlmMWJSbU9zWWhB?=
 =?utf-8?B?NVpyb1NQRnRGWGhtbXB4T1JXaXpXcWFYVmdmYldiNGRRRzZuRmszTXJIVWlv?=
 =?utf-8?B?QldNQUw1dGI3TkhiVnA5eExBVm1KRFZ0VHREMEc4RFNESVEwNG1zRUYwU1Ft?=
 =?utf-8?B?Rk5ZbmJ1Wmw0WU4xZFdsbVFzTG4zUnVrdkdDcXcyTGJPcCtJLzA3SWFncm5j?=
 =?utf-8?B?QlhDbGF2a0pCZzNRYjM5RnZIZC85VThTU3g1c2tIbnpuajdiK3RUNnVWdU1r?=
 =?utf-8?B?VUlIYm5uWjNKM1loMUNQV2dIem1VU3FDY3hMVWp1U1pMc3RIdmxaTHo0N0ZR?=
 =?utf-8?B?WVdwWno1a0dQbnptd2xOMGsxVTFxUmt0c2R1bUp1MURRY0VvdmgvbnYrR3BH?=
 =?utf-8?B?SHJ6aURsME8vOWJYSU5OVEl0Q1B1bThMc0VBNkVFUkpGMHBXa0cvMGFpeGVK?=
 =?utf-8?B?RXE2eVN3MFU4YWcvci8xRzJoaUY5cDJPVHVTSlo5SUFtenpPTytYRGxGT3Vo?=
 =?utf-8?B?VHlENk1WczduamY1UXRjYmpJa0VNUldpYUNCVFdqWm9od0VUV3NrNmNyalhx?=
 =?utf-8?B?blRZZG1JSHR2MFovRk96eEZuMEM3RTlYRHlBOHlmQWEvdURiVUdRRFRPRHNO?=
 =?utf-8?B?U3hqZkRablpxVjc0SEEvT1QwajBIZkMwZEVxQ3V3bWVWWGhmWkROTjdmZ21T?=
 =?utf-8?B?SFNvaXFiVXZHT3dRdlRzcjdhUDVCU2x4RDNIWDJxVEpDYWxtWlJvdk02ZW5K?=
 =?utf-8?B?Y2twY2h4MGtBZ0Q3bUhheE9vNGdYL1g1QVh5U09rMWdFeDlQdGY0WmRHRUdD?=
 =?utf-8?B?T21EalVWYkVWNzdRcjRJcEordEs0ZElWeE9sS2NJV2Qya1hDazNZWjB4NU1E?=
 =?utf-8?B?eFRFVEpGSGlFVS9PSHk2aEpnVWZjd0ZkNWFoUzVNV0E3TjRubGI4VytLcmU4?=
 =?utf-8?B?ZHBZWkpGU1NqWEc1eVNzTGF5UFVlU0YzR1pGN3AxbzFlelBHTXdwVEdLMnB3?=
 =?utf-8?B?N09PYTV0SmkrZTRSbWlBeGVuamprQkh6T1ZZM1lRaTZOYm5QTGU1S1NCWnFy?=
 =?utf-8?B?WVRuVDVIMXJUWmJmQ1RsblAraHFCaXpSeC82LzBlZmJMTTNYTm9EMFdQaTZh?=
 =?utf-8?B?SjV5aitaOWo2SWhyeGxCUDBSSnFPVlBTWGR4Si9UMGtFTG8yWTBWcXRKdERt?=
 =?utf-8?B?cDRJUXk4VE52cUtuOWxxUWl5bE00aU1UNzBxQUtGQmRJa0JhTUJBR3RqNW92?=
 =?utf-8?B?SDFRenZLa2VUZTQxOTB5Z3lLa3Y3cU45bXdhVlZmQnQ0Vlc2dHNUN3AwK0V2?=
 =?utf-8?B?blhsM2tzTW9BUERJdG04NzJCeFdhNnZvUFBkUFgvMnhxWUtCNHpabFM2MWlK?=
 =?utf-8?B?ZGI3ZGZjVzhzeVlpTUZQaEhQcWFQek5zUXNpdWFDbzBJUGtGZFk4dkdUS1dl?=
 =?utf-8?B?NllzeWFSN08reXg2cVNNTUpNSU50TnB5ZVJzUGVDaHlnS1BFSlh3QTczMDZS?=
 =?utf-8?B?aG5VdXk1TDFtb1JpeFVyZzFheFdYSVBUcEdXVEY3S0FCdm1oQ1poYVl2Z1ha?=
 =?utf-8?B?ZjBKYkQ5S0ZsdmRsZFJQVDVvVVBsRFF6NlJBamN5djBIOUtjYUt6V0gxV1VH?=
 =?utf-8?B?N29Xbnd1bVBWSXk1ek5RbTY4b3QvU1M1b0l1MGdQZlF1Mm4zNUtZQzZXKzZv?=
 =?utf-8?Q?2i7qMZFxU+Uv79Qc5eLftqJtmTOUkdQw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1UxbStya2J5L3lEeEhxVk05RDdXc1pWTDFIWWlNeE9pUmhnVnVibFZaNFJG?=
 =?utf-8?B?WWVBTVo2aWNZRGVyTkE5V1h5NXBESlQ3dE1nMjZjaytmakhmN2RCMTBNLyt4?=
 =?utf-8?B?L2hyRzNmL3RqVDNTS1NQQTl4KzEyS1pHMmZsTWpBSy9tbldkdCtST212blA0?=
 =?utf-8?B?dUVBcS9wY2N5dEx6MUlzVVhETXRxRWc1SDRnTzBSV0dGWEd2K0E5RnZqSW9H?=
 =?utf-8?B?cjFmZ3lxYXVHVEN1cE9BeVBtZ2EwWHBOUXVwTVZXYmdxOG5tMWU5eUgraXRJ?=
 =?utf-8?B?Sm9HODdycFY5d2ZqMDZqeGErOUh2NG9GYmFETXE0dzdsenFuNk5xZkFWRG5D?=
 =?utf-8?B?WlE4NzJwVDVxYjN0dURWTzNDWkJRSDA3Mk8rcklWVTNUNzZQS0JqU1VKcGho?=
 =?utf-8?B?R3dDeWZNNzBsNUdXSHozMGxFK1d6aVlnODRsRmNsMVg4TVVHbHZobTg3TUps?=
 =?utf-8?B?OWNrTFZkNkVsZlVRS1A1Y2lsRS85ajkvTjNpai8zMXJHcVBLVTJBVUVHM2R1?=
 =?utf-8?B?SzdHMnBuVzJxVnVzZU5zdXBEdnd5bkV1d2VuanZVNXdsbXhPbUM1QWRVNGtj?=
 =?utf-8?B?cXZ1K1FwYnM4VHBOakVtN3Jnb3lXQ21aNy9yV2JvYVZyT1BYL0JqT3RYNmhM?=
 =?utf-8?B?cDhlMFg3bDhmcE5wS29GUXU1bHN3enNJbzdmVGo1Q3JpWW5oN2hvSlBhakpG?=
 =?utf-8?B?c0VyVUplZ0hDcXNwamYrc1YxMk95a1Vya1E1bk5HUjZocjVIOC96K3BUMEl3?=
 =?utf-8?B?eDBJN2tQMy9zR2tuK2k3dXBXWm13Y1R6RlY3bzRHMzIrbHpCZ05LaVQ3SFFl?=
 =?utf-8?B?dXVObC8rbU1ZdHJrNlg1djZnMXE4emVtc1dPK1VHd2NRcFo2di9RK0loKzhE?=
 =?utf-8?B?b3VMSEV3YndsMjQ4MTJHOTRWdlNKeEgzSTNOSGVwL1hQR0hManZKZXBUQkNz?=
 =?utf-8?B?NXg1SWlmV0tyYlRRdFBiZzhON05kb2hiNjIrbEt5MytmT1JsNTA3UCtvcEdQ?=
 =?utf-8?B?bkxDOGYzVzdnVmtTNEp1ZHN2NHNDNmtIcHVOOHBNeVNFL3cvMlJhVVpRSW14?=
 =?utf-8?B?NUpqNnZUQldIVnFiTU5sNnRwOVN1Q1pDMklNdjV3czZncGh4VVVOUnlYYmc0?=
 =?utf-8?B?a0tDZlZ6akN4Vi9LM3BwQ0FiS3RBMEFMMmZ3QndWVlVudTlacnZ1VUV1bWhK?=
 =?utf-8?B?T2g1Sk1BVWpzLzhZYUFuNFBCQWthU081NEJCbTFVT0NGbTl6M1pCdi9YQ3N3?=
 =?utf-8?B?Z0cxR1E1NDJ3c0VRVEFrdWdPQ3NXSEN4bVlwME00aVl3eG0yODBkaEh3NUdN?=
 =?utf-8?B?NlBiRjRqb3o0Wk95TzFhZ09sclhVZ01JRDJRdVA1MFNTT1V3R1Y3b251K1hC?=
 =?utf-8?B?bFNPNmhHaGFVZFF3SnNTUUI5U2VQb3RZSXU4c05qNkpjS2NWSy84VGFFbjFi?=
 =?utf-8?B?aUdDbHFiQXZvZjlFYTVvN285UVBXMmNWRjlaSTlxSVRzL3J1RVFFdUFmRDRM?=
 =?utf-8?B?VmUrSjBhTm5hYVdqZ3BxZUgyT09nSldUeTN6ZVdFUU9PVFRTL1BJQmlDRTZs?=
 =?utf-8?B?aGYvRDh0UXNXbkFrSGFrTG5Ta2t2U3lReFZSS1BXSkFiejJ3M2hsRzM1UWoy?=
 =?utf-8?B?cm1RWnB1cktCL2plTFBOYnRHMjBlU0l2ZllFMmExbFFUNnI1TjYwRDY2a2to?=
 =?utf-8?B?NVFhSGxPV3d1bE9LUko1cFlpcTk0VzRRUXZ3aEZnS3MvM1VINEEzb1BUcFZO?=
 =?utf-8?B?ZmRGRVl6RXZad05vZUFIUGNLWDZDTzExSzc4dG1aR3dxOUcxL0VDQkh6UEx3?=
 =?utf-8?B?UUVTNFRjZGZiTnE2QS9ML1BqcUYrZXFuWGUwRlJaYmIwYS9UZjVCTG5lY1hN?=
 =?utf-8?B?d1ViMFI0bS9LVUdZbWVpajhGREVjcGtXWm9xNEdic0Y1SnZwSkdUbzFTWm13?=
 =?utf-8?B?RjBCWDRaV1VoSEtmL3ZaMUprN0VmSlhzSEFvUy9uRmJxLy9OZUN6NStpeFU3?=
 =?utf-8?B?REEwR0U3TC9MaGZxVWdwKzVWSVFLWjZVU0hFY2FiR0R3R3VwM2pWUVJobzUw?=
 =?utf-8?B?K2JtT3hSNnVoeEhENXVYczk4UjRmcllQdkhkTjdFU0trU09JMUh5RmtMdW05?=
 =?utf-8?Q?Cyv/LrmOcdt8Ah/4saw5Z44rl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a2bf2a-edd8-4fec-4f43-08de0c9b33e5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:03:06.4574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /REhY1HRyuo5ER4InQnk51EGEN3Yt21iJFzGO85bXaBaCwulqqGW751pS2mYUMWo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7258



On 10/16/25 07:48, Krzysztof Kozlowski wrote:
> On 15/10/2025 17:16, Geert Uytterhoeven wrote:
>> On Wed, 15 Oct 2025 at 17:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> CONFIG_OMAP_USB2 is already enabled as a module in the default defconfig
>>> since commit 8a703a728a745 ("arm64: defconfig: Enable USB2 PHY Driver").
>>> Remove the duplicate entry to fix the following warning:
>>>
>>>      arch/arm64/configs/defconfig:1705:warning: override: reassigning to symbol OMAP_USB2
>>>
>>> Fixes: 91fe3315cdf9f ("arm64: defconfig: Enable missing AMD/Xilinx drivers")
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>> v1->v2:
>>> - Added "Fixes" tag.
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> As this is not yet part of the soc tree, I guess it can still be fixed
>> in the original commit?
> 
> Yes.
> 
> And this should be somehow clearly indicated WHICH maintainer - Michal -
> must do it. Or at least apply it.

I was out yesterday. I have fixed it. It should be in Linux next tmr.

Thanks,
Michal

