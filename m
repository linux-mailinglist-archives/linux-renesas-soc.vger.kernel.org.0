Return-Path: <linux-renesas-soc+bounces-12454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7083AA1B3AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 11:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1E4F3A166D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 10:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685541CEE8E;
	Fri, 24 Jan 2025 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="MFCR4vG6";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="PLbvweNP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120D155759;
	Fri, 24 Jan 2025 10:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.141.245
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737715434; cv=fail; b=tJ7Zqqpea2uF+N0Ryg61+kdX3D12vexqfNjBDOa9jlVHmYsQRdptRZgqpkVyaVt4O7wFhAKknIp7hjdG8eTBblwAJ68AmecizXGrTzXiHfvBquBhAEv2JSkg4qUQFj7+y2+GTThQwOWEC0aGArjC12GJpA6LGzQ4XS94rC+naoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737715434; c=relaxed/simple;
	bh=D5jaobGnQqTzeqPdONlJZT4UTfXQoJquLZsWWZIo24Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sncYCIH1QwYV+ifaufez7Qj0p+QEfo55pm9duNmBZPxzLiGRtFh46sN+LRaDCnfWxWrCf3rp/JSciTY1d/Of7qMxu6ZkKjbEYkdMGVpz1jK875izDco2G1ZjmT73MMOz8VjpQWCrX7KlGySX9kwESPcK1V+DQhdZGgKviE1ARMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=MFCR4vG6; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=PLbvweNP; arc=fail smtp.client-ip=68.232.141.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1737715431; x=1769251431;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D5jaobGnQqTzeqPdONlJZT4UTfXQoJquLZsWWZIo24Y=;
  b=MFCR4vG6+Gnw9ifQZfIZCpgMAaZ9ayFJp0WZzPcqmv49Ny11IqM9JVfH
   3AIUk0i7m0E8lq+uYWcrhPmT6mchnfxkxXet/ttelUhM9MlFIVbya+Nhv
   8IMkcsPfAiy69fwp9SMXSTpLZVDD/K5dHAvr5ixuvPIRk+H6TLNDVXBen
   xWYi/YIhSHHLY+vbeOXfSWjoVoOIVst07IL5gNE9ygb+v9VMZ7KTLZ6ea
   o4/yONRmrqVnAoNd5auQvk9CGewIekLkthkz/XUEsdC+odz5oA2f/Tu2G
   0jT821pquPBet1iN+q3ihpkwq+gA2C41YS4RHsZakhBhkJ6+hqM5+Zw1n
   w==;
X-CSE-ConnectionGUID: xB+evDalS1WL8FgMYnz3dw==
X-CSE-MsgGUID: SflhgbmDTni4Mh5PtUIMiQ==
X-IronPort-AV: E=Sophos;i="6.13,230,1732550400"; 
   d="scan'208";a="37925623"
Received: from mail-bl0pr05cu006.outbound1701.protection.outlook.com (HELO BL0PR05CU006.outbound.protection.outlook.com) ([40.93.2.9])
  by ob1.hgst.iphmx.com with ESMTP; 24 Jan 2025 18:43:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vb13nLiCqnSBL3G3A55thMrDSvVlM6KS9jRu26mXjZcKPS5pMK6HWSuIci4rvcOP6cywkvWds0iJaD0lQuKYD+3APlU6ZnjRkIrWnw/Izbr/u3hBHRPef7aHm8pxt2YtFckg6IGCawzo+/lD6Ncs8mWOduAgzjzdMpKRI+c7/qry7MfYDuw/GH8jdJZCHqkwNJTOWpNnIlInnYbnEd7/JkuQzwMfE7VkkJFoDgTxQRv57cCdL4B5LqTOq9c2TSmv2QN9kARAwqFYNTn4g2WWeDiXIKHLuq/9kUz5tDUgiqPu5ws+RcyDAiKlSPfU4Tqba/jgkgq9qC4tBKTPE9WlOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5jaobGnQqTzeqPdONlJZT4UTfXQoJquLZsWWZIo24Y=;
 b=Ei5bNYVPMFSMJ7p5FMH+bGPOms2ldwvkehbvlgYv9vC8bvqrVRZpSzz/X9KQ/P9UWACw1z5JQ8lH6nputvE9sbbA3KwLDAQ34cT/voRMimLRDg/8xAIianWkgMkhCqeRfJEmQY2hyzyUC1T6M6bsYBvzD5flICV7jVcEwIkP149GrUNIlmEq0lKzogt8C1rVlew6UZKgQ+tDPIrgJH0zMeXO/TjCmcDiPY8jGo0+Kx4L/G5D1zesKHi9n5zWRTUehqqZ0+bphkH9Q20/F12k6Z/XP+ZX2iPxdghxVsnrS8rBlCUSPKmhBfNQaEofzWBcNFtxLKjcFlO5eSQy+bN1FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5jaobGnQqTzeqPdONlJZT4UTfXQoJquLZsWWZIo24Y=;
 b=PLbvweNPnLtnXcXw0grDGVHNv8C+lnUvz9HglIJKoxsytZtkjcdCPkQBSEMYaO8CKXvXHncOeGzrskLcxWLd5SUHjPQmCEPG3LG82tETC/K+3RvUol3Ee15NUdZOZszOlygS36QvXu+BdAnaoKzNYbiBo6NPkOGcyd1rNCXbZuk=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM8PR04MB7894.namprd04.prod.outlook.com (2603:10b6:8:26::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.17; Fri, 24 Jan 2025 10:43:48 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::bf16:5bed:e63:588f]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::bf16:5bed:e63:588f%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 10:43:48 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "Martin K . Petersen" <martin.petersen@oracle.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Manivannan
 Sadhasivam <manisadhasivam.linux@gmail.com>, Bart Van Assche
	<bvanassche@acm.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] scsi: ufs: core: Ensure clk_gating.lock is used only
 after initialization
Thread-Topic: [PATCH v2] scsi: ufs: core: Ensure clk_gating.lock is used only
 after initialization
Thread-Index: AQHbbjK7MtFbQrGgbEacrXj0TabXHbMlsUWAgAALBEA=
Date: Fri, 24 Jan 2025 10:43:48 +0000
Message-ID:
 <DM6PR04MB6575751795F9E462C3A7F181FCE32@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20250124073354.3814674-1-avri.altman@wdc.com>
 <CAMuHMdUnjKJHtWoNfxTTtm2HD3h3wXbpYPbBsky-PcD+yQTqOw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUnjKJHtWoNfxTTtm2HD3h3wXbpYPbBsky-PcD+yQTqOw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR04MB6575:EE_|DM8PR04MB7894:EE_
x-ms-office365-filtering-correlation-id: 80101cfe-78b7-4fc7-a0f9-08dd3c63fc21
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGhoc2wvaVNPditzUmxEY2d5Y0hObVJEMnJhbWw4NTcvZWJiL2toQmFXVHdO?=
 =?utf-8?B?Z3pjOW5JZnMvZlM1S0hkOFlpMVRpcUt5WFJoVlJKMWpxT2RJNGVaQTZHNTdL?=
 =?utf-8?B?REl3ODRpN0l2dkJqM011WW9QZXI5RVNnWEh0VktzVEU1MjA3TnV5MlRWOHR2?=
 =?utf-8?B?Wm1mUGh3dC9MbVI5U1NUa0U4c2t0SThXZFp1bjFucmZDcTBhbUUxVUExd1pJ?=
 =?utf-8?B?MFk3cXBjdlhiQk1lOW5uZDBNL1ltS25BYkFHVDJ3cWRMdW0ySCtJalcyVFlz?=
 =?utf-8?B?Zkpla0oydDFBL3RUdUtUc0RuclVYZXYrL1d4ekdyZHhzTFVBZjhLWmp1U3F1?=
 =?utf-8?B?TlhLUFlmRjdvQVM5M09qWit5NkhwKytGazQ4OHEwM2lobFZXVWp3cmJqSDZp?=
 =?utf-8?B?eDNIbkV0eHp4VDFXZDhHQ2FZYUZZU0lwNWV6d2JPYmp6czNRNDVPNWc1SXRu?=
 =?utf-8?B?cWwwc1JtS0NpN0tOTlB4V25NK2Q4SytMdXNEejZhTjRyM1d4VUtvTnZyYWRH?=
 =?utf-8?B?WkxVY0xTSmFycFpqVEx1clBwaTFOa09STGE5czBGY0Nuc1dWK2haelpsT0Y1?=
 =?utf-8?B?MXV5MWtZQlZsK2YrUi90dmIvdDVkdGRjNy9BNUhTZUpJbHp6LzlyWk9yNUNn?=
 =?utf-8?B?dTdlVzNkcnNMVjhOZmIybTFpODdVc3lKam5DVjFEdlZ1djBEK3lzTk01YWJE?=
 =?utf-8?B?VmlDSFlCVXhxVCsvZmtTVHhSWXV3OWIzNlhabGhjajlaQVJ3L3BEMWFLL2h0?=
 =?utf-8?B?Qld1SGdOU1ZsTUJMNERsTWZLRWNQcUVxRjJGWXEzY2pFWkZXM3F1Rko5dTBn?=
 =?utf-8?B?Q09WNGZsRlU4cEFPTUhaM2F1KzNXdWY1OTM5ZktVbytwWmg4QXJhMUx0ZXFM?=
 =?utf-8?B?L2NZeWttZ0JYUVJlbXh6WnA2cU9kRVZpWVg1TXAwNzZTWlJPd0NkR2wxYzdF?=
 =?utf-8?B?RGx2RjhxWTV4ZjBsbDlLNU1jRXN5VXNsejFSVlhsVXJzSlUrTXJsV09nQmYx?=
 =?utf-8?B?WmNWUVpoZitMVUE1dkZnZzVUME5QVnR3aU1mWXJ5MktjU01OcnNvaW5NMDBN?=
 =?utf-8?B?emZ3RkxQOEx0N1ZDT2thYVNBNUdIWFlKZTdHTmhUMGQ0MVlLQlJmNDdlVWhl?=
 =?utf-8?B?Y1ZmWWoyd0lLMjU4eUR5am0wa1owQnI0UlpBRytiUzArcDI2Ym4wVVU2OXhm?=
 =?utf-8?B?ZTB1Sk9FZDNFakdqbXJVOVdIS2lLMVFQSkRxOVlTL1ZCMHVhT1lpT2pqU21M?=
 =?utf-8?B?REQxcEJDbFlmT2xTTDhEVmQ2M0I2ZGVGZGZDakowNzBibmd5WEk0K3R6MEdF?=
 =?utf-8?B?VVhaL3N3OHlTSWxBeE8xdS82VlZJWXVKUzArOEVJaWcxdFJ5NDdYRVR0b0Va?=
 =?utf-8?B?eUFsUHhBWW83RkdPUllBaVY3MU02REJNK28xTGp6c3NNV0JpOUN2L1pNVk9r?=
 =?utf-8?B?NTB3RTlTOG9GSHVKQnV6YWVBK1FXT2ZsQWNLRFJOWFFMUkxJN280ZWlpNW96?=
 =?utf-8?B?eXMwVytQYXZtOFJjeDcrbzBJa3BoZmM0dG92MWJrVnNwZ0l2eFhjcS94eDVw?=
 =?utf-8?B?WWlKbXAwQ3FkTk5ZeHF1NysvQ3JSTHlKeExrRWZhU044NGp3YnVPd3I0Rm82?=
 =?utf-8?B?OTNXV2Rxa1grMkxPR2phVlUyUUd2RHJxL05mS1ZWL0lFTjNNa1lXYlRzZHQx?=
 =?utf-8?B?YjFGZTB5QW9pTlQ2ZlVnekdmcnlic291cE5jcU1GRCtHNm1DcCtWUjI5MGNE?=
 =?utf-8?B?TE1PVjZGOE00TFBYS0xHUWxEMXg1MUdKemdCUnVIbVp3UmwzUnZZMjdHYnhG?=
 =?utf-8?B?blM1Z0RPR0ZpazFhY1hsOEtHTDY1Y1ZSdTYxK1YvdGdtMnJ6SXlCekVVNm85?=
 =?utf-8?B?anZlT1djMUJDR1RXeUlFVFVqSkNVWW01Q013K29FcCtrdnNiTlpncENZbzFp?=
 =?utf-8?Q?Aj5pXd310VZFBnl3Pi8CnHtgeP+SGT7V?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eHNZbjM3WU4wblZ5S3VVMXpiVTVYdkR4RW5QYlhUY24wM2Y1ZExqNEJkb2V4?=
 =?utf-8?B?cUV0dlIvTG04T1hBVDJ1Skg0cjlTaWZXY240TzltRXhQS0wvMWR0SmZ3SDhn?=
 =?utf-8?B?Q2NjWmN6enZ6UjJUcUFFbWs1ajhLYTh2TWhnOFFrTUZQSENPdG9UUXFqRUJV?=
 =?utf-8?B?cGkvc0NFdXA5UTdhcTd6RHBWNGh1VkVTdnBrUzBQeEM5ekdYcXZod3M5Y3dG?=
 =?utf-8?B?TGs2UExDa2NraDJnN0xqV1JsTTZpRnFjdlRGOUFFSkI3SFdGWUhIWlI3akNV?=
 =?utf-8?B?d0pqa3pUN0Z3Q25WUHM2WGhVZldDbWZ0Q0hKSndUVmJWd2pPczg5OWNLSEN5?=
 =?utf-8?B?dlJIN1dqVHgxTm11eGxQaTlFdlpwNVhmRjE3cVlnWC92dFlFL1AraHRVUlpi?=
 =?utf-8?B?QTVYRFB3Z1pXd0tiSk5HbTczVUhlNncvS3dMZXdGajJ1ZUVtUVBwKzlBbUVI?=
 =?utf-8?B?d3lFYytTTWNLNXE2VVhHbmRwSExtd3VSTDBPUTg2aEltMjRhS1ZTdHEzTUVv?=
 =?utf-8?B?bnFNUThKc1U2S01lVVFCUEFGUVpqRThrcUkrWHpzTWFraEtIL2pENWEyeUR3?=
 =?utf-8?B?Sy9MYlNqNk5sbi9XL3czR3BaVkdwY1Nnek9sSXRXWEFGK09JVm9ZVGJRYTUr?=
 =?utf-8?B?RUZRNEI2Q0VxU0RGNVBodS9uRUN1SHEyeGVSUWRSUnFxM1V5UTlIK2tURmJE?=
 =?utf-8?B?VnQ4OHFYclIyTmhwMlhWU0tQU0M4a2QzNTIydVJzOUx2UWlVS3JmOWZoc0sr?=
 =?utf-8?B?alFlMVNRdDFRV2I1YTRxenNJRmZWVkpBbllXRzIxeVhmclM1NlN0RDVYM054?=
 =?utf-8?B?bDg1T0tmb056N0EwNGdnUk1CQzl1UVZyWjArOGhEWm4rNm16UlVzNFkyUWpy?=
 =?utf-8?B?SnlhWk5OeGo5anFQVWl1d25wanMwQ09vSUlHWjRhZ1RMZzROd2hJZm1ZcGRY?=
 =?utf-8?B?VDUveGR4OHJmZHV0V3M1b2V0K2E5SjU0VzE4N2dxVkNpdkJ2QWFtaStzVUpy?=
 =?utf-8?B?Nm1DNkdTWExMdEZXQWQyY3pwUFFtMkpHWlBkbCtablZNa2NwbnFxRFVBR1FH?=
 =?utf-8?B?U2p3TUJDbHJ2LzhqRHhDZFZVQ0JsNGlaZVhRcmsrK1ZaL0xqN1FiTVdDeWVR?=
 =?utf-8?B?UEp6SllGVjFKMVFxR3VhZzZPZTFvYmVNV3RKcmwzd0QxNjNsMHBRT0c1UmY4?=
 =?utf-8?B?a1ZsSEVac2poVTFMcXB6SlJTd2ZuN0FvdDgweDRaV3l3SXBoc2xHblBUS2RN?=
 =?utf-8?B?SGNtNUtHLyszS3JGYkFpNGVtT0ErRG1XcWo5bHU3eUhteHZscTFKUHBjYzhR?=
 =?utf-8?B?RzQwSUl6dkNmdFZHT0o5blhFeDlraDhHa3VzS2xhZzBvV2FSd1J3Qnl4dFFh?=
 =?utf-8?B?czEyZ2YvemJKY1Y0SUNPR0NodU9Jdm1hdTB0NGRiV0hTcVRPbzBtZ3JoWFhl?=
 =?utf-8?B?cTRjMWF4bFVmSGNaUG0zK0lCb0o4NnFSbjNrTEJxMVM2dEZpQU93SkhlMTNL?=
 =?utf-8?B?UE9BcS93bXNYTDgxbHJwV2ZiSzRxdDhmdFQ0WllYWlMxUy9ENWh5amxyb2NX?=
 =?utf-8?B?dmtYQzB0cVpQYThENXNDM1krd1hpTVNpRUdTZHdDb0R0VGR0ZzY1SmM2MkdV?=
 =?utf-8?B?WTNjemJza0MvVjFSSGpWVzY2ZFdNaVdFNFpaVTJuUTFOUEtjT2VPQ2RVWlZr?=
 =?utf-8?B?cUxZS3hPd1pRcnd5R0NkYkhhcE54cjhBVWdWZDZkL2wwOHZqbzZyWnd0SU5R?=
 =?utf-8?B?SXJ5TGdmMFVOUFpBMmxXWG5WZGNZUmExLzIxLzZWbHNyWkxsL0EvdGRiWW05?=
 =?utf-8?B?bWc2YmhqR1dYZE9pNW0xWVF5NFVvZ2ZVeTdQOUpYbk1PaGpyM2xQRVg0QUEr?=
 =?utf-8?B?NlVWTncyZm0xdnFadjBCaFpOTmdGSzNFSDRZUWlEVzI5OGxSb3UrYnpJLzRx?=
 =?utf-8?B?RlpqUVlMQ1B6aGNuakFmczVUM3R1SWVZbmc4RUU2ekpWMjZmdW83cUM0NG5V?=
 =?utf-8?B?cUFVN0RKOGtPSFhTRjViaXpIVFZFb0I3akNnTjRiWnI1UDAweDl1dVJzQWVM?=
 =?utf-8?B?NHQyTEIreHp3cGFBYlZzUHJzNHBqT0Z2VXJoc2hjdHFRN3planBwVitUUWlJ?=
 =?utf-8?B?eXZqSmVubmR2TlFCQW5qWHpobmJRMS8xRExTVHpSOTdpUSttckRad3BNQnNV?=
 =?utf-8?Q?lmpP4eTIl+N3mLWuSRK0Rn7dXLVHPYoH6ibBhGmhPO97?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ChCEKm824/RXxQJnYG+ZUvAuWWDz0H9L/T/f4ZhsPvetYg1YfUZjLg9NfCAOFonChLHg980aC2oiErmD+P+Ky+jgmrtoBqbiAZN0Gqixah88CNkGWd+RP7dKJDF55eqfyG243V1Z3IXm9PbLONyiDl+5KttubpoUJEZhZKk5Nwa1bubrJq2j91yY+BnWtEcvcktaal9iSsGl2GSGBakqErC5ALKufQ63AnmPkxN8Dyyf3kz2jBViyQZLgzR1d5hb0K/eMpvKJ2a5fgHd9dvv6uHBn3ZuJER9H3RfgbgbJ1QDfALjIC/7HsRrtco6mU6zKOMLMz1kmNPJ3bzeN3f255B9ywjTwwffo1MvyXepxWb7cfWoQVtoItXck8lrX6dbSaZa92F5/v8r/FPCBBQnUkPYSZtIT0BMfeOEuCbVg31Otm+1KztHh81SYqm/x4YN2RpTv/wkAaLMicSIWaF5uzFuRzzh8HDvKqykJscEfBWBxmC/0hwPTf0DOcc2IokkMuAYKhNbQ5LX9tE10rc6WV9RJDK1hyScXmuC0/krANvAzFz+cmXuVdwayuFNC3SF/Q4ZgmTV930kkehajKlN8SB+eOUkiJgE/cvQptGex/uo0b2EFY2o5WgCEniVATiE
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80101cfe-78b7-4fc7-a0f9-08dd3c63fc21
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 10:43:48.5930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 44HDY4r4oPdgF2RW01lEvQffKoRO3PN3z5uK3qbhg++uN70tEyKQPNwF74H6nNh7G4GNBf8N7FZzzi4thT1eig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7894

PiA+DQo+ID4gVG8gZml4IHRoaXMgaXNzdWUsIGVuc3VyZSB0aGF0IHRoZSBzcGlubG9jayBpcyBv
bmx5IHVzZWQgYWZ0ZXIgaXQgaGFzDQo+ID4gYmVlbiBwcm9wZXJseSBpbml0aWFsaXplZCBiZWZv
cmUgdXNpbmcgaXQgaW4gYHVmc2hjZF9zZXR1cF9jbG9ja3NgLg0KPiA+DQo+ID4gRml4ZXM6IDIw
OWY0ZTQzYjgwNiAoInNjc2k6IHVmczogY29yZTogSW50cm9kdWNlIGEgbmV3IGNsb2NrX2dhdGlu
Zw0KPiA+IGxvY2siKQ0KPiA+IFJlcG9ydGVkLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnku
YmFyeXNoa292QGxpbmFyby5vcmc+DQo+ID4gU2lnbmVkLW9mZi1ieTogQXZyaSBBbHRtYW4gPGF2
cmkuYWx0bWFuQHdkYy5jb20+DQo+ID4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIHNpbmNlIHYxOg0K
PiA+ICAtIG1vdmUgdGhlIHNwaW5fbG9ja19pbml0KCZoYmEtPmNsa19nYXRpbmcubG9jaykgY2Fs
bCBmcm9tDQo+ID4gICAgdWZzaGNkX2luaXRfY2xrX2dhdGluZygpIGp1c3QgYmVmb3JlIHRoZSB1
ZnNoY2RfaGJhX2luaXQoKSBjYWxsIGluDQo+ID4gICAgdWZzaGNkX2luaXQoKSAoQmFydCkNCj4g
DQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+IE9uIFJlbmVzYXMgUi1DYXIgUzQgU3Rh
cnRlciBLaXQ6DQpUaGFua3MuICBUaGlzIGlzIG5vdCBoYXBwZW5pbmcgb24gbXkgUkI1Lg0KSSBu
ZWVkIHNvbWUgdGltZSB0byBnZXQgYSBSZW5lc2FzIFItQ2FyIHBsYXRmb3JtLg0KTWVhbndoaWxl
LCBsZXQgbWUgcmV2ZXJ0IHRoZSBvZmZlbmRpbmcgcGF0Y2guDQpXaWxsIGRvIHRoYXQgb24gU3Vu
ZGF5IGFmdGVyIHNvbWUgbW9yZSB0ZXN0aW5nLg0KDQpUaGFua3MsDQpBdnJpDQoNCj4gDQo+ICAg
ICBCVUc6IHNwaW5sb2NrIGJhZCBtYWdpYyBvbiBDUFUjNiwgc3dhcHBlci8wLzENCj4gICAgICBs
b2NrOiAweGZmZmZmZjg0NDQzMDE0ZTgsIC5tYWdpYzogMDAwMDAwMDAsIC5vd25lcjogPG5vbmU+
Ly0xLA0KPiAub3duZXJfY3B1OiAwDQo+ICAgICBDUFU6IDYgVUlEOiAwIFBJRDogMSBDb21tOiBz
d2FwcGVyLzAgTm90IHRhaW50ZWQNCj4gNi4xMy4wLXJjYXIzLWluaXRyZC0wODMxOC1nNzVhYmJl
ZjMyYTk0ICM4OTYNCj4gICAgIEhhcmR3YXJlIG5hbWU6IFItQ2FyIFM0IFN0YXJ0ZXIgS2l0IGJv
YXJkIChEVCkNCj4gICAgIENhbGwgdHJhY2U6DQo+ICAgICAgc2hvd19zdGFjaysweDE4LzB4MjQg
KEMpDQo+ICAgICAgZHVtcF9zdGFja19sdmwrMHg2MC8weDgwDQo+ICAgICAgZHVtcF9zdGFjaysw
eDE4LzB4MjQNCj4gICAgICBzcGluX2J1ZysweDdjLzB4YTANCj4gICAgICBkb19yYXdfc3Bpbl9s
b2NrKzB4MzQvMHhiNA0KPiAgICAgIF9yYXdfc3Bpbl9sb2NrX2lycXNhdmUrMHgxYy8weDMwDQo+
ICAgICAgY2xhc3Nfc3BpbmxvY2tfaXJxc2F2ZV9jb25zdHJ1Y3RvcisweDE4LzB4MzANCj4gICAg
ICB1ZnNoY2Rfc2V0dXBfY2xvY2tzKzB4OTgvMHgyM2MNCj4gICAgICB1ZnNoY2RfaW5pdCsweDI4
OC8weGQzOA0KPiAgICAgIHVmc2hjZF9wbHRmcm1faW5pdCsweDYxOC8weDczOA0KPiAgICAgIHVm
c19yZW5lc2FzX3Byb2JlKzB4MTgvMHgyNA0KPiAgICAgIHBsYXRmb3JtX3Byb2JlKzB4NjgvMHhi
OA0KPiAgICAgIHJlYWxseV9wcm9iZSsweDEzOC8weDI2OA0KPiAgICAgIF9fZHJpdmVyX3Byb2Jl
X2RldmljZSsweGY0LzB4MTBjDQo+ICAgICAgZHJpdmVyX3Byb2JlX2RldmljZSsweDNjLzB4ZjgN
Cj4gICAgICBfX2RyaXZlcl9hdHRhY2grMHhmMC8weDEwMA0KPiAgICAgIGJ1c19mb3JfZWFjaF9k
ZXYrMHg4NC8weGRjDQo+ICAgICAgZHJpdmVyX2F0dGFjaCsweDI0LzB4MzANCj4gICAgICBidXNf
YWRkX2RyaXZlcisweGU4LzB4MWRjDQo+ICAgICAgZHJpdmVyX3JlZ2lzdGVyKzB4YmMvMHhmOA0K
PiAgICAgIF9fcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKzB4MjQvMHgzMA0KPiAgICAgIHVmc19y
ZW5lc2FzX3BsYXRmb3JtX2luaXQrMHgxYy8weDI4DQo+ICAgICAgZG9fb25lX2luaXRjYWxsKzB4
ODQvMHgxZjQNCj4gICAgICBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDIzOC8weDIzYw0KPiAgICAg
IGtlcm5lbF9pbml0KzB4MjAvMHgxMjANCj4gICAgICByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMA0K
PiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQgd2hlbg0KPiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

