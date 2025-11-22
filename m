Return-Path: <linux-renesas-soc+bounces-25024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DEBC7D0D5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 13:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A9FB3A6609
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 12:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31A42DBF5E;
	Sat, 22 Nov 2025 12:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="n82Qb/Re"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4BE35977;
	Sat, 22 Nov 2025 12:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763815948; cv=fail; b=d56zsV+xlY0zt4bmenK2/pvxmq7WyS9DXeCCm0vamNixZEBDyKZYowRM6h16kF9GLjEiMpuRJ2U9rGtIYQm3QzetWA+fjOILqB8npWpJk8e/RZMSu9pjGDKCoTB/RqeAVfC+31UeNm4Qm1ZLeQcY1QwsS1D1OS4KQ9aJHf7kb+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763815948; c=relaxed/simple;
	bh=BAOnWXWNrxaZKCOwiw360/82SCkpGQDIO/x/ZX8hk+0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aHeI+3PPdKSZFm+EVZNhrDyEq8Diw37IMljK9Js7r5Od+t/ktJgHQJ4EpbnoavvXtzvqoNHzy7zWf9npC7K7fYvQMlf+ZCyHLhzFqrhuFhM4VVIF/c0uwpIL1W5EhQLulq0kgERjKaxmOJDV1tQ3oXHHzgBvkawR7wSFxZ3lP/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=n82Qb/Re; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4L/7P5ynfCy2AV90ps/dae344wm/FTOL+P22uMZh5w9YW25P6N/KkG3l7xEGBSkaCZadfc6cP0YsSiVcpqFyTuw0X2nEwUm2rbHYMWngH78EOzmdhY8F2r0cynKda8VnbOtnovY1GAtjkY2Bc9HsLU2dMvbk/cNj/thourT1Z//Cst3TnFG19XXN4md7hmAhRbR4Nxo9TSqQLqKdDVdfDUKyy3sUY9BC9pPPvwPr+6fZl5Qn+VSgve4HO6IbLdBpU6DkE9eFGD36WaLhFVINqvpRSuFkMkZl3dI2RqKXQPoGcBGDVV3nhrAj83gNsScAm0qn0KWEC4qRLbxZNJgyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAOnWXWNrxaZKCOwiw360/82SCkpGQDIO/x/ZX8hk+0=;
 b=btrx5P1h7paCoJ9q1veNPlr8p3kd/NvKdyZ76Qo8aduiqDCbgl01Ef6eeFJn6q7xVX7KRkw9MMfcYBpf3tXDICZZ8GHjoD/56VxNjDQLKLamVFnz7hSCSAflHNS6zbk6O3802dsENsz88evkrMi+d7iq93X1a3l00xdAZiJ9UmJKe69xrCSxRrDharN7UZu34jX4PhHaua+8xQ8bbVmSLdBJ9oCcoM4Ft1Cnmr8rojwCH8OxEMiV1JJnKNZmaxCFYdO7t1+hsnaQM1Aqb+FcuerD+jHkYCwoi3FeBwlnH884NmWmLe+yXdtyzxlmD65G2YC3oSLBJrMfIPkaxXmCgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAOnWXWNrxaZKCOwiw360/82SCkpGQDIO/x/ZX8hk+0=;
 b=n82Qb/ReA2Ot0pnft57WvBM0Du31po2UrFUW3eZuyVa/mjnWBcVMvkrcpHT+9wVJ8FJSAnT3MwXIy4OX5RE3p4BfrKdKHQzdcMZwdSa7W1RR0zCMRmRUmcv1HyTNoqIE1bt57Ly9+tEaJVHXt57xBlK12nlyJ2mCgXujvo/ukmM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12494.jpnprd01.prod.outlook.com (2603:1096:405:195::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.6; Sat, 22 Nov
 2025 12:52:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9366.005; Sat, 22 Nov 2025
 12:52:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 05/13] serial: rsci: Drop unused TDR register
Thread-Topic: [PATCH v3 05/13] serial: rsci: Drop unused TDR register
Thread-Index: AQHcVVS7HP725815ok6aqf4iOquTOLT9RIMAgAFuI+A=
Date: Sat, 22 Nov 2025 12:52:24 +0000
Message-ID:
 <TY3PR01MB11346DF06C496B6CEA1ECB7DC86D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdVZUA5CAtAkcpcfwN+kM85kWPDD88+pNO8jfVoVxvuSyA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVZUA5CAtAkcpcfwN+kM85kWPDD88+pNO8jfVoVxvuSyA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12494:EE_
x-ms-office365-filtering-correlation-id: 7d056ee0-1ff6-4672-b02a-08de29c5fba9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MW9KOTdhL2dKWWMrdHBGb21lVFZIM3M5S250aUtjQ3RUQVM4ZWRYSUtBdnNU?=
 =?utf-8?B?aERhMnY5TjlBd01RNVZMdXFRSEcvQytLenBjQmZyZ0F1bVY5bFhLK0U0YnYz?=
 =?utf-8?B?bTdoK1VLTFAvcHFtRUhhVkk1ZXI1L0prOWhyVC80S0s4dFV5WG55aXVjZHJ5?=
 =?utf-8?B?dHpLSDIreGZMdndhN09mMERPMkNoR2JjLzBYckVNc2xCbitkekhGdTNoalNS?=
 =?utf-8?B?NjJSaWhTU1N6bjVlaGtaMGJ5eFVsTFZsMzJobWxrc2tnakZxc2lHR3RveHhk?=
 =?utf-8?B?cWl6R3VERGxYRk5pZnMyUWQyRWY2V21OWkZwWjB3RW1wTDM1MXBVdGUwMVJx?=
 =?utf-8?B?VC8xU0cwRnFwbXQ1VnJHT3N6a1VNeHdhR1BiczREdGVxWU9YZEZiMnN4OHVj?=
 =?utf-8?B?TThZbXd1OHZXaHB2UXJWK0RqUjFaYk1YVkNOSGtqWEdjK01MdDE0L1UwZEVv?=
 =?utf-8?B?a0RiWTRQLzZOVEVCbllUUENWc3hiVDdkZWlpSFZ2VWRzR0VuQ3FyR3gwUnJI?=
 =?utf-8?B?cWVRVnB2WldmUmRNUXl1a1pqVnVDUkdHZ2FZdVNiOG9Hb0ZlTGxjaFMwV2dp?=
 =?utf-8?B?aGd6cWFXVTl1elRkSW1LbXpiazE5eGwrSXVWYmdiTUtpa21wTjE5ZXVuNFRw?=
 =?utf-8?B?T0NUd2I5SUVoSEgwUFUweXlmMDhGamprczBPRy9zV1c4TVdBK3pUbFlWNEJI?=
 =?utf-8?B?aXRNOXRmcU45bEQvNmg4M0IzT2xQSjV6ZDVFYTV4MmlucGcxc3NhSkdXZUZV?=
 =?utf-8?B?c2hiSHRBTmZ5c1Z6cnNhVVdPQkhsTStoMG1TT1NKNGJlMitqbFpWRWRKUGpE?=
 =?utf-8?B?MWc2UEZ1ZVArRUhZdUtxS2pCRWpqdURKN0VHSnlaenJIdDkwbzh1cE8wY3U3?=
 =?utf-8?B?M1RISnNMV0pNbFJGdTVhMjJmeUdoRTFZMEp6dFNualJQcFA2bHMvOXJUeWVy?=
 =?utf-8?B?Y1JrTVZTd2YycXpHWXZkY1p0MjBHRWlzT0ExZHdkYklPSEkzTU9nQnhaZ0lG?=
 =?utf-8?B?Uk9aSU5SYW8xYTRhb2poTDFQZFlzRzBpdmhnek9ESGhwTU1aNG5KOU41a2Fy?=
 =?utf-8?B?bW5OZXp1YXZkZHB1V213VWJYWnFvVTdCa3JSeGRjODRLMk1Bc0NtQStiUEMz?=
 =?utf-8?B?ak4rNEtIME1wSlZwbmppL3BMOWp4QjFIeEtUd0NsMGxLRnZVTzBiSzJhRUlG?=
 =?utf-8?B?MUpRb01KdXZqeW5aY2djazVhejNITVFZa1FCNGZKNWF0NEZaY0N3TzRnWnNJ?=
 =?utf-8?B?TVZscG5qUWJsUS96ZlhOR0FXRXBwK1EwMGxNc1JHWldwWHBMRG9KQUJDNXlF?=
 =?utf-8?B?Qmxnd0NQTk5zZndxbm9YdDlJUS9SL2VvMElXclBWNFpUdmxIUGtqR3VZdWdn?=
 =?utf-8?B?c2ZnQlJrMkVvRlJHZm15cnlVdTFlaWJ0QWxHYUNlTitCK0tnZVB4TGIyTnhX?=
 =?utf-8?B?T28wejdFS0VDcC8xV2I1SFZJVk5FMnlNdWZKV0thZVJZNkQrV1FNUTZWeENr?=
 =?utf-8?B?dWZtKzY2a25NNFVvUVplM3dCRUlDSHpmVVZSWXBXZHFWTGt0cEo3UnpKL3Ax?=
 =?utf-8?B?SjBxWW1hZmhQcWZ1ZHBoTjd6bUhVcGYrTmpkOVFIZXpoamFua3QwM1RQeEFv?=
 =?utf-8?B?eWFiK3NSVjluY1VLVUZ3MkNTYVFXQkFvWFNGa3VDYW9RSElPZkJsUzBYNlU3?=
 =?utf-8?B?QnU5UUd0UjlIT2lQTG41YU00bUZES245OWVldm1pSWFGWS9ORkh5cHMyL0pB?=
 =?utf-8?B?dE5HRGppaGljdExtcGw3bFV0QkJkbU9vbXhOS0xrSnNSaUhhYllGUGpYbjVm?=
 =?utf-8?B?cDU0cHpJK2daSlZlQzQzVktyUi9kTjBpVG43RThqeHhJT1RuKzR6WHRZcWt6?=
 =?utf-8?B?cnJDRUFUN3ZRZklISkRoQVhYblBOKzBEeFpUTTR3bzVCMDZqSXF0bms4MWU3?=
 =?utf-8?B?WnVIWWlyeVBsMDM3ZWU0OGJLdHdMQzF6Yy9PcDdMb2lyelN3V1pMTUsraUxO?=
 =?utf-8?B?Z090SWFSRVpSUHhwUmtwMDVkVHJyK0NiOWpadGNwQTNOci9Kc1lzYXl4ZzJB?=
 =?utf-8?Q?t4pPLx?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c3NqZy9MSDYwVDRveElOWHMxY2tjL0hSVnhqb2dMOS94d1JjRTNRaDJJalkv?=
 =?utf-8?B?Zk5WWFRYT2E1aTE5eU9wb3JLblQ5OEszaGlNQkMxcGF0STZuZXl4M2RaWmpr?=
 =?utf-8?B?RE1wbnU1ZjIxSVNEREZ5c1ZuN0l6MktNdFBGZDRXcGNhLzJBSEhJOFdrR1VY?=
 =?utf-8?B?ZjRVUmRqdno3TFZWd1RyQ2lXSnB6R0tPeHFGZWkveThMblhIem1KVWEyK05q?=
 =?utf-8?B?aGFleXZaM0s2cnV5U3ljd0JIR1ZRVzA3blVVOGNNMnQwd1BzekhMTHpHMUg2?=
 =?utf-8?B?R2hFYWJ2UkYyZ2pLRWVEMnVxazJpYVAyV2FHSEVxelAvYjloRUErZlBSSWV1?=
 =?utf-8?B?MHpzOUlseDEzSVVQRnZaSTFSZ3RDSFo4b0JZS1psNGxMZXVHcTFCeVFpV0Na?=
 =?utf-8?B?V0FGaFlFeWJTWjEvNVNXMktEdVhVRy9OaDhmSjdYQ2U5N2dKNWg5bzFKVjBz?=
 =?utf-8?B?eU5ibWRIV3pmNm1TeEFGRnZIRzhwMzlRK3h4QytEUGNQNUJsbUJCVGhWbWll?=
 =?utf-8?B?dHBnNEtpUDRqemdLTEUzNmVHbm9IdDNNNm5qY2RWN1NIZUdzTFJnRHVkdERN?=
 =?utf-8?B?Q0pYRDB4RnVIbWlXR0FjTlJLblBFMStYVENiU3Y3SVcwNU5hYjJkT2NLbzJz?=
 =?utf-8?B?NTVqWEtDQXNFaE5udlhFT1FjWnNZNTZ5K2FMaFk4NXVlV21DWnJPamtqVXcr?=
 =?utf-8?B?bnkzblZMNGNOTTcrb1F2OTdBTDhWT3FuMXM4a0JONjMxWTdxV0pJMnRpVlFT?=
 =?utf-8?B?Y3NuY2ZwVER3UVgwY3FBeFYyc2g5bnljWVRLRGFKVVBuc2praURTVmU4dW54?=
 =?utf-8?B?NC9vQ0hVTHNZTzVwZGFSamJKOHBRL3lycDZxMHA4aWoybFhDNDMwV0tRNEMr?=
 =?utf-8?B?c0NuL1JhYXlwZVl1YUhJZzhmaEg1NUM2bHZuUkhxb1pBTGtyTmY4T0dlN205?=
 =?utf-8?B?MzVEdk1OVUkwV2UxbGFaM3FMem1GajhJYm80UUJGTXdoRGdzdEVlWUN6ZDlP?=
 =?utf-8?B?dWlsSlVaZGVNMlNHa3Q1WmliL0poU3NoSFlLbW9BQTU4SHBnaVU5ZW52c3Z3?=
 =?utf-8?B?WmhXZ0JmSVFoaDg1d0pPR3hnV0diN2RnOHNodWxLRUtBWnM2bHJtS2tJLy9q?=
 =?utf-8?B?Z2N6djlJL0FOOWplSndpTDZmVUhHK1gwaHY4LzlWU3N4MTg1aXpRUGxJOTNC?=
 =?utf-8?B?Y1ptVHJOU2EwVDFvbE5KditISDFsMTRVc0V0cnlySTIwRWVvQ0FrclR4bVA2?=
 =?utf-8?B?Zm1tYzdSMmFYRUJVYXkzd3BOZ1prbHp5K2xZVnVSd1lDYWRObW9QSTNKQTFS?=
 =?utf-8?B?bUIvckV0S0lYdnJrN05uSnhYNUpscEdZQ0lEUGUzWTRxMlEzV25BdjJkV1Q4?=
 =?utf-8?B?Ym1RWWRlY2sxWFRLRXR1MTl0emV0ZExZY1llcy9jZC9qVjRCNTFqNmx2NjB5?=
 =?utf-8?B?VmdxNEJySGtEZThLWjZNaVdYQzJDKzBrbHg3eTdjNXkrK1F3R3duMDliSXpB?=
 =?utf-8?B?OGIyOHJZdVU4UjJUbkdPTzlueDhmRXNFZm9vRmwwTkU0S2pCaXpZZG9uVnJT?=
 =?utf-8?B?L0FOM3RNZEZSUWovZ0lSZGlaNW9jTllEdGxSRWZLQVhjcVhhSDNMMzNQdVN5?=
 =?utf-8?B?UDJGYmZDQlN0VzZ1ekw3WlNLSU52MzM3WHo0eE1nQlBBbzh2YVVoZHMyVUJZ?=
 =?utf-8?B?bXdPbnpmL3ZHQ1VEN201OVhsMEo5UFBway9TcGNnWStnbGVlZEY3V3ViQlJv?=
 =?utf-8?B?aGV2dlZwOWdxUlE2dG0vTmdjdVJJSFc0QytIL0lzOTBBVzhCUllCM0MyUE8w?=
 =?utf-8?B?NEpNTGx4VXR1MENzNHExNU02UEhGZGM0M1Q5Qkp4THpRWlVabXJQbnk0UEdP?=
 =?utf-8?B?Tkd4cFJ0N1FZcVdad1RLZVFyVjY3Z3MvWXNUZEttZFRETTJOekg1a29abXhT?=
 =?utf-8?B?dG5OVkRhcGN6T0ZBNG43NGVsZ2NianpzTWlZRDdKMlY0MVRCdm9XOFRYbFVF?=
 =?utf-8?B?eFBiaTZLNEdnMUNaS3lZbmZtZ1l4RG80VldkME1wUDBSa3dTV1RHL3EzbjVS?=
 =?utf-8?B?d1hEalNkZ2Y1OXZWV2kxZFRqRVVvQjVQeFk2OElYQXVBMjVudWpHRXROd0do?=
 =?utf-8?B?dXl6K2tMeTZ4bXlrckxZK29QYStZdUdnNVJRYkEwamN4UThZU2I2QkFoZ2E3?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d056ee0-1ff6-4672-b02a-08de29c5fba9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 12:52:24.0173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HuvQvpabsI4bJgm9SR6HG565IM6M7y6ZPTksIf/W61uTGhiaFndiRzYI38j0la2oUlHUd7JTIqS2JnyC2b1Y/2bEZHmm6iucd8eDtX+utN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12494

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIxIE5vdmVtYmVyIDIwMjUgMTU6MDENCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwNS8xM10gc2VyaWFsOiByc2NpOiBEcm9wIHVudXNlZCBURFIgcmVnaXN0ZXINCj4g
DQo+IE9uIEZyaSwgMTQgTm92IDIwMjUgYXQgMTE6NTIsIEJpanUgPGJpanUuZGFzLmF1QGdtYWls
LmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiA+DQo+ID4gRHJvcCB0aGUgdW51c2VkIFREUiByZWdpc3Rlci1yZWxhdGVkIG1hY3Jv
cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvcnNjaS5j
DQo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3JzY2kuYw0KPiA+IEBAIC0zNSwxMiArMzUs
NiBAQCBNT0RVTEVfSU1QT1JUX05TKCJTSF9TQ0kiKTsNCj4gPiAgI2RlZmluZSBSRFJfRlBFUiAg
ICAgICAgICAgICAgIEJJVCgxMSkgLyogRklGTyBQYXJpdHkgRXJyb3IgKi8NCj4gPiAgI2RlZmlu
ZSBSRFJfUkRBVF9NU0sgICAgICAgICAgIEdFTk1BU0soOCwgMCkNCj4gPg0KPiA+IC0vKiBURFIg
KFRyYW5zbWl0IERhdGEgUmVnaXN0ZXIpICovDQo+ID4gLSNkZWZpbmUgVERSX01QQlQgICAgICAg
ICAgICAgICBCSVQoOSkgIC8qIE11bHRpcHJvY2Vzc29yIFRyYW5zZmVyICovDQo+IA0KPiBNaWdo
dCBiZSB1c2VmdWwsIG9uZSBkYXkuIEJ1dCBhbGwgb3RoZXIgYml0cyBkbyBub3QgaGF2ZSBkZWZp
bmVzIHlldCBhbnl3YXkuDQo+IA0KPiA+IC0jZGVmaW5lIFREUl9UREFUXzlCSVRfTFNISUZUICAg
MA0KPiA+IC0jZGVmaW5lIFREUl9UREFUXzlCSVRfVkFMICAgICAgMHgxRkYNCj4gPiAtI2RlZmlu
ZSBURFJfVERBVF85QklUX01TSyAgICAgIChURFJfVERBVF85QklUX1ZBTCA8PCBURFJfVERBVF85
QklUX0xTSElGVCkNCj4gDQo+IEkgYWdyZWUgdGhpcyBpcyByYXRoZXIgdXNlbGVzcy4NCg0KT0su
DQoNCkNoZWVycywNCkJpanUNCg==

