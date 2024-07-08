Return-Path: <linux-renesas-soc+bounces-7181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D00E492AC9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 01:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D7A91F216EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 23:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CDB74077;
	Mon,  8 Jul 2024 23:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oQftOY0N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1D46F305;
	Mon,  8 Jul 2024 23:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720482285; cv=fail; b=EBFEMHNn0gGL8fkW2/ShmTOdqKJaFYDZYCUJYrUldbhI8SQ/7kqWaIqqg+ihCWOxSXN2d8Q/gy7bn5XYSwGecIas5sUXUMFea1bjdJ4CmUseNOHio5DGNzSgl4xDAQ3sdeWu3h01Qi9MloFn45km3oA53fck1064tonwndMLyto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720482285; c=relaxed/simple;
	bh=BOeQYKYgboNdmJpNO/aZX+8xEaAOoHmMa4gYrv1MvBw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X97V+TE4NLXa06NhV1jKMoP18EhsEQEyzPdY2bj7wP3+0xVITYO3urHdK0jVL+gvQn9gGRGkVgjKLLzy9bw5k2vnvnf35HZHZJK4sLKItdID6h5KL4smu4C2aaYy9f4bKUzbHjEHxOTAg0uxXoKGfTlyJJU7zNoFQJTMyLjHqQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oQftOY0N; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEdq7enHAHybR7Ihtg5qwJ31HJ8yf2++fQwvDOQ89Usp5zuJPMr8/pI70r3zUUbW3lPHCmg0bHniimlJuSyZ+m2EU5KDQYVCMP+9jsGEaEncUpby2mIoesotK/Z330hrXiCILeX51XOU7cbTSxRqZKyNl3MOgslNhA7hmAw/QCyZ7Xom63DIZBRYNzneuwY0VSFawwL7ijMS6i49sj/FMJVlwnn4mkCv0fo2wMwB8jOpV0GyNdc/eWHZwYeFKgbUSrlBsVYKXoukiCPro46gTno5gKp0dslVwWqzPKFgnvvMb8CH/TYxheANLQxOAw1R7BxaRv2BMo0dGljmBXZcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOeQYKYgboNdmJpNO/aZX+8xEaAOoHmMa4gYrv1MvBw=;
 b=m3pvBf3JgxpdeB0bDr5pB3o28LbG+tqx0dgsOoo2FkMSASpgvLG7GKS0Rq0NBOv8ai0x+7H27TrX46eod8e22d6NM7EzxwVq0V+aGf19OSsrywG4Zr9BvG0yaTY4UxJDm96wQnlOIMbdoBLEk9E22jPtgncBHFMvauawe8LNI87xb3ASAFMNoqqm62KV4zVolmrLlUf4UXEkJE7tVKfxpLClaB2msrQiqEJ6S9fKHWfDvv9wbCi8mDoD1ITvifT2SvFRF8WidPqGspPRpQTrUPLH0gHIfMe0JhKljNE67GNvarf+5vCwEl1eu0fgFRqw8WIIhWRJO1zav8WH/jbwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOeQYKYgboNdmJpNO/aZX+8xEaAOoHmMa4gYrv1MvBw=;
 b=oQftOY0N44JyTjgogE8b7CEi0UZNzNnCNL5FCOyQUtiC1aUk10LOIVmAJeMUlvVLUYIDw914iZXBNJygLchPdkzbJiLmlODdZ+PJoI/QhwO4boEP6aZ0AVqcDItO7ET5l5Yx4cRx8dFeSd9XzO38kcrLqCjjF3rsQ+ulgPAvQ3o=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OS3PR01MB7357.jpnprd01.prod.outlook.com (2603:1096:604:11f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 23:44:39 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%7]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 23:44:38 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Bart Van Assche <bvanassche@acm.org>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/5] scsi: ufs: renesas: Refactor init code for other UFS
 controller
Thread-Topic: [PATCH 1/5] scsi: ufs: renesas: Refactor init code for other UFS
 controller
Thread-Index: AQHa0S+/duDDkq1DA02B0a4Krv9VxrHtD4UAgABvaSA=
Date: Mon, 8 Jul 2024 23:44:38 +0000
Message-ID:
 <TYCPR01MB11040DE4D5F6908F5FF9AF3CED8DA2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20240708120931.1703956-1-yoshihiro.shimoda.uh@renesas.com>
 <20240708120931.1703956-2-yoshihiro.shimoda.uh@renesas.com>
 <434cb981-b0fe-4dd2-bac1-e80de2e68099@acm.org>
In-Reply-To: <434cb981-b0fe-4dd2-bac1-e80de2e68099@acm.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OS3PR01MB7357:EE_
x-ms-office365-filtering-correlation-id: a57ed289-1c44-4bb7-99ba-08dc9fa7ee09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dC9BdWdvU0tsNmZTYUFmRVpDVzJMdVNTcDVQZ1V3OVVUd3loSCtqTmxNc2dJ?=
 =?utf-8?B?SGVqZHBYRFJubVh6L3Zla29pcnYzeXNzNXhBVStpdXRHeUFVbkk4ZkF0RHdL?=
 =?utf-8?B?Y3FZL3JadCtBNXNFdjh0RlBnYlFMMkxVZDZROXVqT0g5RmRBdEswVGJBcVNC?=
 =?utf-8?B?NWlGWS9lZzczWlRwOFVrbjcxUDJzT2NtWk44NDZTRGk0dmhvRGwzTXN0ellu?=
 =?utf-8?B?NkZEL1d1VUNOQUh3QUhKSll5cTlZNVRWS1c2T0g1Y2JieVczcE11RU5zTktw?=
 =?utf-8?B?RlNLRUFpUHVJMDV0cGs3RDNMMEpScFI4SWtqK0V4NG5ORDBNQjdEQXBWS0pq?=
 =?utf-8?B?N3ZVVXpSUWpsbU1vY25xb2ZVVUpOLzJuMFpqV09VZC91b1NpRWFaVXZVVlpY?=
 =?utf-8?B?RHJkVVVtUElrZ0FySGxXV1V3dkcxY2dWdFY3RzJPc3RjeVZCOWZZTjhVYk94?=
 =?utf-8?B?TmV5RVMwZFU3eWFTQWZSazc2VDlSOTZianh4WVpYVmp5bkNHWFFRRVdyVzJZ?=
 =?utf-8?B?alVXNHNJNm96aHc5ZmJUb0xuc0RiZ3dTVDdlTW9RSTNZdzRsQVhCczIvVSs4?=
 =?utf-8?B?VGJ5QUUwaThURFZiRkY3ZmlTRGNmY3NyOGZwYmh3WmlQLzVMM0RTSzROQUhk?=
 =?utf-8?B?SmkvN2syb1JyU0J1a05nR2RkMTlJblNTWWFZTmdibGlmNmlYbHZDY2hwdVdU?=
 =?utf-8?B?YlB4SHJoQmM2czRWeHhZMjk3QkNEVzdIajk1ZDJYLzY4UFdJekNVRFdnZ002?=
 =?utf-8?B?ajYvR09aU2VLWGYwMjFYREROc0FRaDkxeFh2M2tZcTd0ZEM2Rk5qZXJZbHJM?=
 =?utf-8?B?elk4UjMrWmM4aXR5Y3NRYnBaeDRpSGoyV0Y2d3pHT0FnNDFoNkpYVUFZU2s4?=
 =?utf-8?B?RUl2eWQxVGVQZ2xUUGZFYzZFR1F6VThsOUJhTGhoZVRWS1cxTzlWS1FFSG82?=
 =?utf-8?B?c3J4RDdkcDVKanBNVTFudXFabEhFNlFGSVlaSlhQdlZQZjgwekFRNjRQVzdl?=
 =?utf-8?B?eWc3b0dlaGxnbmY5U29takFjdzc2R3VsQWRRTEV0NjV2TU1WaDZIK3B5NExy?=
 =?utf-8?B?YUtrcG81YlQwL0Y3VWI4ZWtpUkEvQmlFZ2hOTXp2QWJOYnFWS0RaOVRDZytm?=
 =?utf-8?B?cVhxZExUcUVxeHVoL1Q5a05vcnJGMWk2VjRITWRaVVg1S28vZXBRVWp0N1li?=
 =?utf-8?B?NEZ0RlJYNFE2RFIwN1NJdXMrYkxyeUE5Zk1OMGtaWkVDMHM3RnlaVklCK3FX?=
 =?utf-8?B?d055czBuVklWSVFWS0s2c1ZaaFBXdGdsZVRrakNoYmNlRHcxb3d0YlhzQ1hV?=
 =?utf-8?B?RGZyMU9UT1pFZDBsdUxIM2FwSjhMMWUwaGpOeTZwYk1DbGVZZitBZHUxRytN?=
 =?utf-8?B?bzBpTVZ2MlE5L1RqUnpONGFDaW53RWwyWlc4dkErdTd5bkk2bXNUZ2xyeXdi?=
 =?utf-8?B?b2JaVnFlL0grc1YwUVRZRzU2SmcrbjU1R0t5VWFJc29WWkk2Q3A5Zzl1ZHdm?=
 =?utf-8?B?TGpuVFl3Z25vUzFhQ0Jpakp4TUpDZkxISkp4RThwRWFZaFRMMjM4S3pVTU9j?=
 =?utf-8?B?NkFXOGtrakhMcGxNUjdhSnVBRGdGc2MyTUJob2IyTHdlb2pYK2paMlBwOGlG?=
 =?utf-8?B?RkQrNmI0bE5MZTBwRDRPZm9vQ3d5WWJBUUxwMVVLb082S2JONUIxbkdvS2VH?=
 =?utf-8?B?c0kyRnZCbkJJZG04NkVBK1NyWGs1aThTak9UUkR1bVROMzNiY3NrQnVaakhr?=
 =?utf-8?B?VXNrc011c2w3VTY4WVdMUmFJVlMyTlAzalZTb0g2MHZ5RlpHL3RWeC91QmQ0?=
 =?utf-8?B?Y1JsMVNRdzF0V3BPQjFjQnMrSm1YNS8yK2lBTHVyS0VmbHpjVHZzY25SbnNQ?=
 =?utf-8?B?YmFqMGtNcHpCVUh3c1NBNFU1Rm5QV0V1Y2M0YklxWGdSaVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXFhKzV2MjNhMlhNdGc5LzRYUnYyMmxmWi9VZkNQcHZPK3NLUWJnRnRJVk4y?=
 =?utf-8?B?TE82MGVhdUl1ajJ2TzZ3eDdjcjRFam4yMGJpSi83Y3ExUVBFcnZWVGxpMHI2?=
 =?utf-8?B?Y1h6OEErdE9LTENlUkdFN1dtTE44bE1YSytKMnlJS1ZSaDF4cDNocU01MkJO?=
 =?utf-8?B?aEVyc05OOVVmdklzbTlXNTd2U1REbzVvV2pvdGt4WUdPSlhjUkJuWXFHak9H?=
 =?utf-8?B?VjBIMFV0RXhvMXM3L0l6Rkp5K3MvV3R6RzlVK08zTHZTSTBxeFU3WHpvSHBo?=
 =?utf-8?B?dS92WnQwaGtEc2V0MVFLbm5HeFdTS0tkdERZeW82WTRRM21wQS9tQ0RzeURZ?=
 =?utf-8?B?QnFha1ptYVFCRXlQSkNmQlhYT0VqZ2tiaHBCbFdzRW9wK1hENGc2VGs3OHVy?=
 =?utf-8?B?TEhQQy9WY1Z0TTk3akZuWHNTd2NCeDdnU3BJaTlvUFoxOVVyNklCbkhnbHp1?=
 =?utf-8?B?VkEweVBMVXFXVFJhNDJGUkcrekljRlZVQXBYeWFQblpMVThlV3JyMFBteG1Z?=
 =?utf-8?B?Zm80eWMzQUdHNXJFQ3Y1dmlvT1c5SVpuVjlJVEVIOE4zc0FUSVRnQWdFR003?=
 =?utf-8?B?K3VRM25zNVE0Z1ZiRk04QXdoYTN4OHVaT2s0OTk0akhLVW5MSm1Obk9QWFJW?=
 =?utf-8?B?aWtETnV4ejFsejAzZWFjRVl6TVNhWXV2TmRsMGc5ZDZuYkwyTFNUdENUemV6?=
 =?utf-8?B?WFU0akVvNzlWOTRObGVLbDY3dk9UQkxqbWNjSVFlcmZPVHNpNmIzUjRDWHd2?=
 =?utf-8?B?b3h2VUt5Ui9XQTBoU3VmU2QydXY0L01rU3pMaW0rTFVIa1R2UUFHcDBDOEdC?=
 =?utf-8?B?VTV1RVdybXNGNDN3Qk95dG9yZDFEL2FiZzVFL09HOU5JdmNOZGZtMUQ4bnFz?=
 =?utf-8?B?U2Z0Q0FNWFdOWE9DQTcvT1c0b0ZYY1BCZUE3V2lXeG9NVjRmS3hBYzJRTGlY?=
 =?utf-8?B?b1NaRkFmdjJZa0UrWEJIMDluN050K1pISXRScjdpRmRKR0lmaTkwVG1MVDB5?=
 =?utf-8?B?eUhEbmI1citJRi82QVBRMjBuUnIyUi8wb2ErN3B2TjJVTUl0S1NkR1BsSzdk?=
 =?utf-8?B?RmtaTVhIajljWFVEeUxWdmtiMERtaGQ2QXFzbHlwbWVuTFZaTVp6UzE2M2VS?=
 =?utf-8?B?dURUMCtqV3J0blJ1SUd2Nlh3UHFmNHRleXZQTTBwaFMxaW9rcGVnV3htdzZB?=
 =?utf-8?B?Nmc4MzdPYXZBYjVNMksvY3NpNVpZTlQxWjFLdHFDNC9DNlh0N3Z0Tk9UM3VM?=
 =?utf-8?B?WG1pTnVWdFVuVkE4U0NpN1VLSGozUU81Z3hJOUFuaHVvUFE0em9WL3l6bm13?=
 =?utf-8?B?Kzg5eE4vMjY2d2JBU2hNTmVSQ1Q3dTZqUEk3eXYvRkhQUVFwYmlkakxTM3Q1?=
 =?utf-8?B?K3dYQi9Nb0Z0WHozMjdXU095YzVQR3NvcnNKL3FsQnlMQXcvZ3dkYVZOT3Z3?=
 =?utf-8?B?NHVLMjdHRCtOVlp0alNNTTlQSXJxWnB3cFRSL1JReFliNjVkZkRZNXhBSE8r?=
 =?utf-8?B?cFhrcDh3My9yUVBDZHI4NnpucEw1Z0dlZDBWcVltMkRhcnNoRlU2UTE4ZlFJ?=
 =?utf-8?B?TFVCK0x0RGpGZFgvTm83Q3F0N0gxTUJCOEhhYnFCelJrN1pUUWVMcG1wa3Fs?=
 =?utf-8?B?Y1I1UDJpNk9UQlMrSzllT3VVSVpIcmZmMmJEdTVXNE5iTGdoclNHSnh0bXlt?=
 =?utf-8?B?WkIrajhuZWVZN1ZQRy9nWWZYUWxGZnp3Rm1FTWFoZ1hLQW5uNFdpbFhER3Jo?=
 =?utf-8?B?QTZwREwyeGgwZk1GalZzb2RCMUFnVE95RnB3UUJvbXVzamkxTUdnWEJDWDd5?=
 =?utf-8?B?M3dRU1dlcW05d2ZpK3ZJNncwWUZlcjdoNUI2OWlZeDdacktxSlRaMlNnQW5K?=
 =?utf-8?B?cTJ1d2NQcFRjNFQ1VWI1ekxneS9PZ3MydTE3TE8wQWxyZ01iU1MxelBtcVZP?=
 =?utf-8?B?VFhSem9TMXFqT3pybllUWXJUd2d6N283WlY0M25XZHE0Zjd4RERTZUJoeVBJ?=
 =?utf-8?B?UlpSMng3Njl2MDQzYWNndW9qcXd3M3JFOUdYYWNZcjhzY2dqOFh1bHo3VVdp?=
 =?utf-8?B?NkpMTTkxNjRNYUd3dXhJM2ZXMHRUVm5xTXFkRXBCQ2IrQ09EVXRLeE94VUN2?=
 =?utf-8?B?ODFtRjkwbFRRSi9HZFpaQkhzUTNERVNTbTZuRmx1NTcwQVB0a2ZybmhUNndB?=
 =?utf-8?B?a3ErU2Urd0txK3BOVWNUMVRVbFd6THE0OVdCTjVKWEYrdHlERWVTbEpaUGRM?=
 =?utf-8?B?MUdjVGhHcElQbVJEaXIrelhHc2NnPT0=?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57ed289-1c44-4bb7-99ba-08dc9fa7ee09
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 23:44:38.1597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y01aC9AYQYwV5e4KCGc8Gj1ePx+OtxljfVeu7foXuQclZo9RL6AdMxzAIQRzXUQY0btPnZbQLBuavbH8yFfLrWwjdlzaLNfjtEmcPUnlt5K3VBjKNnxnbZFivjgHltUN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7357

SGVsbG8gQmFydCwNCg0KPiBGcm9tOiBCYXJ0IFZhbiBBc3NjaGUsIFNlbnQ6IFR1ZXNkYXksIEp1
bHkgOSwgMjAyNCAyOjA1IEFNDQo+IA0KPiBPbiA3LzgvMjQgNTowOSBBTSwgWW9zaGloaXJvIFNo
aW1vZGEgd3JvdGU6DQo+ID4gK3N0YXRpYyB2b2lkIHVmc19yZW5lc2FzX3BhcmFtX3BvbGwoc3Ry
dWN0IHVmc19oYmEgKmhiYSwgdTMyIHJlZywgdTMyIGV4cGVjdGVkLA0KPiA+ICsJCQkJICAgdTMy
IG1hc2spDQo+ID4gK3sNCj4gPiArCXN0cnVjdCB1ZnNfcmVuZXNhc19pbml0X3BhcmFtIHBhcmFt
ID0geyAwIH07DQo+ID4gKw0KPiA+ICsJcGFyYW0ubW9kZSA9IE1PREVfUE9MTDsNCj4gPiArCXBh
cmFtLnJlZyA9IHJlZzsNCj4gPiArCXBhcmFtLnUuZXhwZWN0ZWQgPSBleHBlY3RlZDsNCj4gPiAr
CXBhcmFtLm1hc2sgPSBtYXNrOw0KPiANCj4gUGxlYXNlIGNvbWJpbmUgdGhlIGFib3ZlIGRlY2xh
cmF0aW9uIGFuZCBhc3NpZ25tZW50cyBpbnRvIGEgc2luZ2xlDQo+IHN0YXRlbWVudDoNCj4gDQo+
IHN0cnVjdCB1ZnNfcmVuZXNhc19pbml0X3BhcmFtIHBhcmFtID0gew0KPiAgICAgICAgICAubW9k
ZSA9IE1PREVfUE9MTCwNCj4gICAgICAgICAgLnJlZyA9IHJlZywNCj4gICAgICAgICAgLnUuZXhw
ZWN0ZWQgPSBleHBlY3RlZCwNCj4gICAgICAgICAgLm1hc2sgPSBtYXNrLA0KPiB9Ow0KPiANCj4g
U2FtZSBjb21tZW50IGZvciB0aGUgb3RoZXIgZnVuY3Rpb25zIGJlbG93IHRoaXMgZnVuY3Rpb24u
DQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchIEkgZ290IGl0LiBJJ2xsIGZpeCB0aGVtLg0K
DQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IFRoYW5rcywNCj4gDQo+IEJh
cnQuDQo=

