Return-Path: <linux-renesas-soc+bounces-27942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCjBAc2RhGk43gMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 13:49:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7308F2CC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 13:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48DFA3008E28
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 12:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503403AE6E6;
	Thu,  5 Feb 2026 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iGlhUD9T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011061.outbound.protection.outlook.com [52.101.125.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C321F63CD;
	Thu,  5 Feb 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770295753; cv=fail; b=g8GBRpdNCRSKsaDwHeh5+/bzckyXE5qIqazoyEMWpV4f18JvTykcRCCR59bLdmioJoyl9xvkMBoRCWSuW97wVO9u0fegLenvAfGvqlZO5coJ0IVkVYTQiTZS0Tl7CwtlK5HVF+9nOCSSxMtaUpKj9BCpD/m0W+SGINJWUHZ7kmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770295753; c=relaxed/simple;
	bh=2/2XajVUXWGihAbyBR8R4SGP8kdlXoW2sLyVMBuz2Lc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Uk0wW3A5pVWrSVISrOGJKe43yVIUfqg5/VL+b9dU6ru+/Z5JyHqplXpSnzzBKOCRvK+UHGWOO9dVTlvgl5/63k2KsNZ70AZPUR9fxlZCL95eO8/yiSKs+RICddhqEiSdDL/v2Fv8oC1Pq6KDMdtHc71pa1yFqQ4RyOHiecF4TUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iGlhUD9T; arc=fail smtp.client-ip=52.101.125.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAURDGAuMpP6f6WE+WUkFn0pmMWmZzrSgD68dV+fXLlRfqDK25RXL9trjq7kBoJecP4r0XwefTETAmhvvkyss+Pp3UknsKDLTiLJ33BCI1mz4PsjqnMf0qV8exZFJockZjIq6yIu0Jm/8Qc7LaM6UNFU43JhTrIWZH2qyB3Mwj2S3D7JwsKwCfNk/T6RJp2Jp397hTSpj6f7T5hLb1Ima1s5j1heiwiK+t5IxXC6Sh3fA+9xiYTsbynm3AIoQal3nivMFvYVtMdAa/D+2NDc1wdFsK+9u7xnDOgXpgmEFr9qzWD2ZrhS7a+hpGpoFe0RfoeuhqLu97GjvolwwiLZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/2XajVUXWGihAbyBR8R4SGP8kdlXoW2sLyVMBuz2Lc=;
 b=kmzFDd5uYqbq2iTZsj87VxUR6XWFgYx6P3baWohJkXLJZOgGP+CdtcMgwbzsUirSNEMcJoSjqXjZJgxvNa72u3+k33IFYIBGtYNBtHa7a16rviRtXg6pfqhM1Vl3BIxXb95QoytTo/JZI8IWJPvfdQt0hX+SxvfxY9ETvpB9+VoN1TyS/4rHegaA1MB/O25U8T+iLOso2rl4ZY47lxenpkPDNogIuKsSuscKOGY3wB+9KUrt4aNFD8t5RZvBEjgBSr6sLp5EGKgAf4WhktSklaTCNVy7jxAzvrKAFmuaPNKLcRQ6VC1gGLUvFKXN18WZHEaRasrnHqcWgUod6wm/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/2XajVUXWGihAbyBR8R4SGP8kdlXoW2sLyVMBuz2Lc=;
 b=iGlhUD9TH1oU+/sK4aly7Z5WooHdvkvl3A0yxApcvQDndgFB8FEetA6IzFnsOPZATEhoZLcCY5xURGQj5VJEB+mz24tSfiC8QKYsDXhyiN3Vj6xl7hT4IgpcovSO4NX+zbAcx7jO3DxXd7P5xfoC4b8ttAMwda+73PjSeOUBNjM=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS7PR01MB16955.jpnprd01.prod.outlook.com (2603:1096:604:421::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 12:49:07 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 12:49:07 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Topic: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Index: AQHclm8qD3lunnbaf0uAuh27IRHtALVzunqAgAADMACAAE+JQA==
Date: Thu, 5 Feb 2026 12:49:07 +0000
Message-ID:
 <TY4PR01MB142829D9748A483ECAF19FD3D8299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References:
 <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
 <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
 <d6a9356d-6fd4-459b-9c5a-2f3e20368bbd@cogentembedded.com>
In-Reply-To: <d6a9356d-6fd4-459b-9c5a-2f3e20368bbd@cogentembedded.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS7PR01MB16955:EE_
x-ms-office365-filtering-correlation-id: 895a884b-eea9-441b-780f-08de64b4f37b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UlFHMVFtSkZwK1I5S1kxSUQydFJGRkhZenZxMHVXTHRnSTFqdXFwaDRSZ1dX?=
 =?utf-8?B?MkF6TFIxclJLeUw0Y1FCd2ZXYS9MRVFBSVJ2UWNOcU9QaVNWUFp2VzlKNVhU?=
 =?utf-8?B?RWRoMklZMFBCNFRYSUNVWWMxcFViWnVEWTB3U09UNjJqYjRvNmNNeFI1Wjhw?=
 =?utf-8?B?NWZFdlVUZ1BKOFA0WFBNLzI1ZjVndXlNK0R4cDRFS2NVS3EzcUpZRTBnK2pI?=
 =?utf-8?B?TUZaOXdrZ3VPTDNsb3A1NldBS1MrOWEydTJma0xmdUM4QXh1N3FySnFxU3dS?=
 =?utf-8?B?Qmp3Z0ZrUm9pYmNGemRvMklCbDB3MkFMYVJkRHIrazVaai81R0M3U1pKS3l5?=
 =?utf-8?B?d0poaWhnb3YzWWZjbHJzZmFocmpiQ3A1N0ppQ215UW1DTVRyQklpU2phb2I5?=
 =?utf-8?B?UHlrWWMyMDYyaWRPN3N0THV2QzhKL2Uxd2pxT2FuZVdyWHViSjkxWm5uV1Bo?=
 =?utf-8?B?YzFQQ091S1pxRzNWdmhSdzd2U251QzQrcXBydUNSamljRTZkZGR0aVhvRFBP?=
 =?utf-8?B?SGJZTkN4WTRXbDFCQnRzUm9qWlh4aGpVS3A0eFc1VkJRWFJUbUZ1SWdxK2J6?=
 =?utf-8?B?MU1KNkxlNkpuaXB6UGd5UVJ4S1lYTkpVRmFHQUVXWnMrRWdJdzhaTHBEaHox?=
 =?utf-8?B?b3FYMlh4ZDJYdE5lcEIxdXVodlF4aC9vdEZpdUtJQmsvR0kwM3hMSGt1b0Ur?=
 =?utf-8?B?dlpvSkEzQnN5UzBxekswdFpIa0QyY0hzY2tnVGJ4YksyTnFiR3RQd2w2TktL?=
 =?utf-8?B?TGZZN25yVnVlVXpRbndhdVpnV0NPSnNDdmkyVm9xMk45SXZrMHYwWFFZNEw0?=
 =?utf-8?B?M2wwampiUGV1RFM3VFYrZGx1Q0ZLeklaQ2lCbUhXbW82OUdtRlZBVk0vZXMw?=
 =?utf-8?B?WndXTS9Tb3JyeWNjak02V3hIODkvRjdjdFJreEVYdFU5bkpvLzZ0WGthR3BE?=
 =?utf-8?B?T3NPbUVxYUhNcXJEbDBNekQvR09PV1lyV3lYUWowei9Tc2VNVFBRelV4cmlo?=
 =?utf-8?B?YmhialBaTnBRS2xaS2VSOVdNRFVkbmlwK0V3ZmwwckR3bHU0TnlkN2tSQ1Rv?=
 =?utf-8?B?akpBV0U4NWhyMElCUjlqcGcyN24vVVRNZ2dtemxSb2NRMXJad0MrMUFOa3hw?=
 =?utf-8?B?dDYzamljQjdhRXhRVjZRRDVmaFZMbXM1Y1p2M29jb08wNmp0ZVMzeUlxYi9P?=
 =?utf-8?B?ak5tcUpDdERDcVlOenJkemxPV01TdllCa0JvdC9GdDl4SzhBMTl0UldtWU9G?=
 =?utf-8?B?SmFyL0h4TVdQMVIzeVREWU5HNHRoVGtsUW9VSXVkZVliMFJlbCtHcU5OdzVI?=
 =?utf-8?B?eWtpZzAvOGZDWkkwTnVJNUV1T0VJYm1hTmlvVGF1TWxmTFRXZ0IrUEdTVjJU?=
 =?utf-8?B?c3RIdVRFK3dpNy9IRG12M3Z2cEtYWEwzWG1YWElHeitXZlgwYkdYd1VOZWx2?=
 =?utf-8?B?WUNES1ViaElyekpTU1VsV045WEJIS1JzV2F5NVlXdU85dXR4dDAxOXYzUWpq?=
 =?utf-8?B?cHk5dmlMUkxQamlVa28wem5hWEdDTVJWalk2UFMvN2VldHp0ek8wQUZkUXZS?=
 =?utf-8?B?MS9KTWJhY1VHRExyUGN3RnI0UExTUVpsckFHcGJRdUpMdmFKaE0xZlMybit1?=
 =?utf-8?B?VE54NThiV2RRTlJyRUhuQ09PeS9YenUyU3R6cEgyeFNkYklzV3pJWmFOUkFr?=
 =?utf-8?B?M001dkdzWTNWK1FqTzRCWFFlaUYwQWxrRDJEcjA3TStJaVBSd01LeTB0OUdL?=
 =?utf-8?B?a2ZBc25KdFhJaVFIZyt3SkMwelUyb3JhSTFnSmxHcVFvUG1nbVRMQmhlWGhh?=
 =?utf-8?B?VHRXUVhxdUdwbXpOeGJUT2RiSno4ZlRsNGNpWGpqSkVrMkxxb1oydjhSbHNO?=
 =?utf-8?B?NHoxQlp2V1dVOTczODhFeTUvcVNjU3kvajR3QXNOcXVhRkRwNkl6SXdSaHBn?=
 =?utf-8?B?OUZTWkV2b1JTV0ZvRmlqWlIxRWU2TVhhYkU4aUx4enBaamoxZkdPR1QvY2wr?=
 =?utf-8?B?K2U3YTFZMzBwM1BIZW8wZEJZMHdwZUFacC9FMWJwbjRDNWJIam9PQ050U0ZT?=
 =?utf-8?B?b293TDB3WnQyNGpobGxaYXA2S2ZkeXZjUHFDQnB1NUJIOVhhSjdad05iUzFE?=
 =?utf-8?B?NEZ2c0JKRThFbnBoSkhXdmdJU1lJRExWNUJIcWRpTWFWcDkzem5KYnNpWmlT?=
 =?utf-8?Q?7bq8o+fHLq7DWJngywYeeQM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUFWMWxtUmxYdm52U3E1TnRWNHNZSVlNeG9vL21tUlc5VVZ5SmdlWWUxbnk4?=
 =?utf-8?B?MGlFTFU0VGtlQ3FGS3lHbDBiWTQyWEZxdVp2K0ZNcGNzaXdKUFFEK3VaTmUv?=
 =?utf-8?B?RG5IT1Y1YlVlOUxkQTJBZk9Kc25MUXNxcXV4ZUFCdUkrWWZIaHp6WHQ5OEdN?=
 =?utf-8?B?TzgyZ2VmVU5wemp5YXMwQStPa24rZlVzRi9jeHpwU3ZXRjJ1VlJsUDRaMHh5?=
 =?utf-8?B?THdtTS9ZSUJ6UVJMRWNjMld5cnoxeVFQMDB2MTNtQ0pBTUVybDZCVnFyOUoz?=
 =?utf-8?B?THdIdmRZRmV4a0NQQmJDbTVWeEdIOVJNRXBQR0lNZmZSZXpUOHJRZEVUcWlK?=
 =?utf-8?B?MlEvQXlrU1MvajVNSkxIM0wrdm9vL21malJzc1paUmNka0VseXZjNlc4Um5H?=
 =?utf-8?B?YUpPTmkrQVFSYlJrTGUvSWxjU0VHYlM1RmVTMUJWdVV5a1A1UVVTcmJQM3hB?=
 =?utf-8?B?eGk3VnVzeDJRRFFrVlVNa0NQSVRwTU1DQ3NTdlk5Sk1mZnh5QjROVXRqeTRy?=
 =?utf-8?B?Z2NOdTB1QnBpMVViL29uRUFCN2hkZ0NsQ3ZYR0FTbUpPWU16a1l6NVcybUlo?=
 =?utf-8?B?VVdpeVhRVU1PS1ZUT2krc3YwQlgzcTJyQ3BKdXlScjdQOWVKT3BQTkMzWG1T?=
 =?utf-8?B?T0VyQXl3WkJyalgwMGpnUzFKOER6RUVEZ0RUeWdnR0hvaFZyUmpaQUtxS0Zm?=
 =?utf-8?B?ZHBLTy91ejgwOUlWai8ydXR0Nk9tQ3JvcXcxdDFhT2lVOXl0NCsxZ2lTY1BQ?=
 =?utf-8?B?ZndicXJEOHpJcjc4cmxxSzRoQUM5ZjBsWW9wTCtDRTlKT21hV29OV1llZW1L?=
 =?utf-8?B?bnlXUkkwTnZ6eXJDVDhISnA0L2NoWk1Nb3pFSUxjZUgzNGZjQndxVnZPS0Jr?=
 =?utf-8?B?UVlCNG1IOEh0MkpuaW9zWmFWRHRjamN6blVOMUdmdFZTRGRPMFJlbGR3cU9X?=
 =?utf-8?B?TWNTQXRaWHM5S1lmWHU2b0loVmRPdTEzSDM4WXlTUTJ1V2JCVVUzODNQa05m?=
 =?utf-8?B?UERBZ0FERVhhQTh2MDQwd0ttSW84Y0RCSUl5YkVtUVU4T2pKRDFlTXJma2xI?=
 =?utf-8?B?NVFnYXpWeXYyZ2g1bU5wLzZDdWRrc2Q1WTJFei9xRmlQc0htR3lkbElTZzAr?=
 =?utf-8?B?bFk5RE1oS0t6QmtUeGU1alk3eWpGS1BjZTBGWlhJSGpDbGMyNGM1aUQvNlJP?=
 =?utf-8?B?YzF3U05iNGRSY0xsWTZuTGFOSEozcGFLeE5lTWxBdDRUSU05VVVIVXF1ZmdU?=
 =?utf-8?B?dG95OVRrNTE2dU1DUGFRZlJCTFdTd29LQ2xkU2VvYjE3Y1lRT0E4WTQ3bEFq?=
 =?utf-8?B?cDE4dU5NSUJScGRDLzJPbkY5OHYydlpIOSs0MFFubERXKzUrRnlDQVcxc3gw?=
 =?utf-8?B?aDZ2ejhmeGF4dDl5cnpOMkNSUUlqNlYvdW5Id0gyMktVNUdBVWtONEd3WlFP?=
 =?utf-8?B?Y0pTc3NPNGtmYWFSU3JtQVRqVUt4bXJnUkFEMmhFb016S2N1K2tOOTVjTmxh?=
 =?utf-8?B?cWpDVGN3cW4wc0MxZ3JTZFVISVcybXRpQS9sNDVmNlVOVmZhTlhXSjR0K0Qw?=
 =?utf-8?B?Y3VUZmU1V3U0by9ONHRjd1NBTlNLQ080WTNWMmZmL0Uvb3FtNFVyMFdUcDFM?=
 =?utf-8?B?NWo3dDNSNlIwT1Q3TjBxV0oybFNTem8ybnJYb3c4QVF1RHRvL0xueVkwS2Rs?=
 =?utf-8?B?MGJiZWtaS0VVSmhuOS9HZkRZNms0OXBEYXBTeExFSU5qTi9zc1Q3Rkh5a01k?=
 =?utf-8?B?czFjSjMrbmthbG5qVVUzd1k5VlorOTJwNTFjdzR4NWNCNW9hKzNWKzFub3BZ?=
 =?utf-8?B?NHl5eS9mWlY0WWlhTm11eEZadE5NSDYzZ0U3SE5ZUkswd1l4MGw0Tjl6emxm?=
 =?utf-8?B?bTZUdVJSWjUvdzhLZDdhYnliT1piWFUwQll1QlVGcEFURWtIcVJZVjAveTcr?=
 =?utf-8?B?NE5xY09LYXRvOERONVFoOWhnbmRLenlwWFZWUDJET09tUU85UTBsT2Z3ZXZh?=
 =?utf-8?B?N0VybmlRMXJiVXFuKzhGbFJVMHVJWUdldVhWY0xhQmhPY0RhRTRhRkJFNlZX?=
 =?utf-8?B?cjJ3VUJrQlVBNW1MSzBkdkwxdGZDOThURStSeHlxMnQ2SEYrUm8wQ0NsN0Nm?=
 =?utf-8?B?alBhSzg1TmQyV3pUMU9iRUljaVNhS2JPRmZoZ2lPU2N1VDI2dk91VlV5L2Zr?=
 =?utf-8?B?bzBRNHR0Y1dscTlHUk9jcnVYSUp0OFB6UU9wS1NkVjVDVjdNUG93anVpbFY3?=
 =?utf-8?B?dk9vd0NoK1pOT3RtTm5PTVFOb21YbGpsd3RDeXhIemVKcFVjcEhvbi91RDI2?=
 =?utf-8?B?R1oveEFicHV3aFpQbEJ5c0luOHVOZ2JUYzdMOVFjM29na2NDVFI5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895a884b-eea9-441b-780f-08de64b4f37b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 12:49:07.4847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 64He/iuW8/gWxGzPnzYDX2u+JBDq6EDvip62sWu/K/qKTcO22KKpP+PgagUgNrB+dkRUvMRAe3m7u/HXdPim9cHTw6Yg/Ofy1lMDYSDLE8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16955
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27942-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cogentembedded.com:email,renesas.com:email,renesas.com:dkim]
X-Rspamd-Queue-Id: A7308F2CC6
X-Rspamd-Action: no action

SGVsbG8gTmlraXRhLA0KDQpUaGFuayB5b3Ugb25jZSBtb3JlIGZvciB5b3VyIGNvbW1lbnRzLg0K
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pa2l0YSBZdXNoY2hlbmtv
IDxuaWtpdGEueW91c2hAY29nZW50ZW1iZWRkZWQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgRmVi
cnVhcnkgNSwgMjAyNiA4OjU5IEFNDQo+IFRvOiBNaWNoYWVsIERlZ2UgPG1pY2hhZWwuZGVnZUBy
ZW5lc2FzLmNvbT47IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5l
c2FzLmNvbT47DQo+IEFuZHJldyBMdW5uIDxhbmRyZXcrbmV0ZGV2QGx1bm4uY2g+OyBEYXZpZCBT
LiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+OyBFcmljIER1bWF6ZXQNCj4gPGVkdW1hemV0
QGdvb2dsZS5jb20+OyBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPjsgUGFvbG8gQWJl
bmkgPHBhYmVuaUByZWRoYXQuY29tPg0KPiBDYzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0XSBuZXQ6IHJlbmVzYXM6IHJzd2l0Y2g6IGZp
eCBmb3J3YXJkaW5nIG9mZmxvYWQgc3RhdGVtYWNoaW5lDQo+IA0KPiANCj4gDQo+IFdCUiwNCj4g
TmlraXRhIFl1c2hjaGVua28sDQo+IFN5c3RlbSBTb2Z0d2FyZSBFbmdpbmVlciBAIENvZ2VudCBF
bWJlZGRlZA0KPiANCj4gMDUuMDIuMjAyNiAwODo0NywgTmlraXRhIFl1c2hjaGVua28gd3JvdGU6
DQo+ID4gSGVsbG8gTWljaGFlbA0KPiA+DQo+ID4+IC3CoMKgwqDCoMKgwqDCoCB9IGVsc2UgaWYg
KHJkZXYtPmZvcndhcmRpbmdfb2ZmbG9hZGVkKSB7DQo+ID4+ICvCoMKgwqDCoMKgwqDCoCB9IGVs
c2UgaWYgKHJkZXYtPmZvcndhcmRpbmdfb2ZmbG9hZGVkICYmDQo+ID4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICFyZGV2LT5mb3J3YXJkaW5nX3JlcXVlc3RlZCkgew0KPiA+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByc3dpdGNoX2NoYW5nZV9sMl9od19vZmZsb2FkaW5nKHJk
ZXYsIGZhbHNlLCBmYWxzZSk7DQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+ID4NCj4gPiBB
bHRob3VnaCBpbmRlZWQgdGhlIGNvbmRpdGlvbiBpbiB0aGUgY3VycmVudCBjb2RlIGlzIG5vdCBj
b3JyZWN0LCBJJ20gbm90IHN1cmUgY29tZm9ydGFibGUgd2l0aCB0aGlzDQo+IGZpeC4NCj4gPg0K
PiA+IEZ1bGwgY29uZGl0aW9uIGZvciBhIHBvcnQgdG8gYmUgYSB2YWxpZCBjYW5kaWRhdGUgZm9y
IGhhcmR3YXJlDQo+ID4gZm9yd2FyZGluZyBpcw0KPiA+DQo+ID4gIMKgIHJkZXZfZm9yX2wyX29m
ZmxvYWQoKSAmJiByZGV2LT5mb3J3YXJkaW5nX3JlcXVlc3RlZA0KPiA+DQo+ID4gSXQgaXMgbm90
IG9idmlvdXMgaWYgYXQgdGhpcyBwb2ludCByZGV2X2Zvcl9sMl9vZmZsb2FkKCkgY291bGQgZ2V0
DQo+ID4gY2hhbmdlZCBmcm9tIHRoZSBsYXN0IGNhbGwgdG8gcnN3aXRjaF9jaGFuZ2VfbDJfaHdf
b2ZmbG9hZGluZygpLCBzbw0KPiA+IHVzaW5nIG9ubHkgdGhlIHBhcnRpYWwgY29uZGl0aW9uIGF0
IHRoaXMgcG9pbnQgZG9lcyBub3QgbG9vayBnb29kIGZvciBtZS4NCj4gPg0KPiA+IEknZCBzdWdn
ZXN0IHRvIGVpdGhlciBjaGFuZ2UgdG8gc29tZXRoaW5nIGxpa2UNCj4gPg0KPiA+IGlmIChyZGV2
X2Zvcl9sMl9vZmZsb2FkKCkgJiYgcmRldi0+Zm9yd2FyZGluZ19yZXF1ZXN0ZWQgJiYNCj4gPiAh
cmRldi0+Zm9yd2FyZGluZ19vZmZsb2FkZWQpDQo+ID4gIMKgwqDCoMKgcnN3aXRjaF9jaGFuZ2Vf
bDJfaHdfb2ZmbG9hZGluZyhyZGV2LCB0cnVlLCBmYWxzZSk7IGlmDQo+ID4gKCEocmRldl9mb3Jf
bDJfb2ZmbG9hZCgpICYmIHJkZXYtPmZvcndhcmRpbmdfcmVxdWVzdGVkKSAmJg0KPiA+IHJkZXYt
PmZvcndhcmRpbmdfb2ZmbG9hZGVkKQ0KPiA+ICDCoMKgwqDCoHJzd2l0Y2hfY2hhbmdlX2wyX2h3
X29mZmxvYWRpbmcocmRldiwgZmFsc2UsIGZhbHNlKTsNCg0KVGhpcyB3b3JrcyBhcyBleHBlY3Rl
ZC4NCg0KPiA+DQo+ID4gT3IgbWF5YmUganVzdA0KPiA+DQo+ID4gaWYgKHJkZXZfZm9yX2wyX29m
ZmxvYWQoKSAmJiByZGV2LT5mb3J3YXJkaW5nX3JlcXVlc3RlZCkNCj4gPiAgwqDCoMKgwqByc3dp
dGNoX2NoYW5nZV9sMl9od19vZmZsb2FkaW5nKHJkZXYsIHRydWUsIGZhbHNlKTsgZWxzZQ0KPiA+
ICDCoMKgwqDCoHJzd2l0Y2hfY2hhbmdlX2wyX2h3X29mZmxvYWRpbmcocmRldiwgZmFsc2UsIGZh
bHNlKTsNCj4gPg0KPiA+IHNpbmNlIHJzd2l0Y2hfY2hhbmdlX2wyX2h3X29mZmxvYWRpbmcoKSBo
YXMgaW50ZXJuYWwgY2hlY2sgZm9yIHRoZQ0KPiA+IGN1cnJlbnQgc3RhdGUgYW5kIHJldHVybnMg
ZWFybHkgaWYgdGhlIHJlcXVlc3RlZCBjaGFuZ2UgaXMgYWxyZWFkeSBhcHBsaWVkLg0KDQpVbmZv
cnR1bmF0ZWx5LCB0aGlzIGhhcyBhIHNpZGUgZWZmZWN0LCBlLmcuLCBpZiB5b3UgcHVsbCB0aGUg
Y2FibGUgb24gdHNuMCBhbmQgdGhlIGxpbmsgDQpnb2VzIGRvd24sIHlvdSB3aWxsIHNlZSB0aGF0
IHRoZSBvZmZsb2FkaW5nIGlzIGRpc2FibGVkIG9uIGFsbCBwb3J0cyBjb25uZWN0ZWQgdG8gdGhl
IA0KYnJpZGdlIGFuZCBub3QganVzdCBvbiB0c24wLg0KDQo+IA0KPiBNYXkgYmUgZXZlbiBiZXR0
ZXIgdG8gYWRkDQo+IA0KPiAgICBib29sIG5ld19mb3J3YXJkaW5nX29mZmxvYWRlZCA9IHJkZXZf
Zm9yX2wyX29mZmxvYWQocmRldikgJiYgcmRldi0+Zm9yd2FyZGluZ19yZXF1ZXN0ZWQ7DQo+IA0K
PiBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBsb29wIGJvZHksIGFuZCB1c2UgdGhpcyBmbGFnIG92
ZXIgdGhlIGxvb3AgLSBpdCB3aWxsIG1ha2UgdGhlIGNvZGUgc2hvcnRlciBhbmQNCj4gY2xlYW5l
ci4NCg0KWWVzLCB0aGlzIGRvZXMgbWFrZSB0aGUgY29kZSBjbGVhbmVyLiANCg0KSSB3aWxsIHNl
bmQgYXJvdW5kIHRoZSB1cGRhdGVkIHBhdGNoIHNob3J0bHkuDQoNCkJlc3QgcmVnYXJkcywNCg0K
TWljaGFlbA0K

