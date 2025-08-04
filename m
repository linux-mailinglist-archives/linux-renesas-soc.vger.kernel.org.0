Return-Path: <linux-renesas-soc+bounces-19955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33865B19E48
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 11:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1294C189AA8A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 09:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25A7253F00;
	Mon,  4 Aug 2025 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XgjlW2+7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13D5246BB0;
	Mon,  4 Aug 2025 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298305; cv=fail; b=SwZWbr8w1flKOlRF7USIfEpt0dIArRTSBd4QLdFRHZ8gbh1haap8yICmeuhDXiIrMn6h4/r5fMt21EEUhcM+FXfZDELvMlam1vWf0GCBApsRV5TyjnBzoYFY8f2Evz9VnPiQjQS4qUrMDGkf4WpbzOYdFQM39ZKtN4E89ZkQzG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298305; c=relaxed/simple;
	bh=W2H7yZg0oCR+QsQ96C5hXXD01KWvm3vhPbu6SAPV6mA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qhxuohMsdAsaTCyMPcsgdYmT02gDhNhE9BXHulwobKi9V/m3xhBHK+B/X/uIM1zxGqqlvAQrDmabAfSR9aT2xgFQ5sGhqMarKPix9mAFevODb+z73jY6WmKv6h2+2z9FVlJuJ8rsK7WdBZrPTxXaG6bq8Ls1w8JgmMYlGz/7pQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XgjlW2+7; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NoOQ7XodzfH5NEyDi9Tj41B/ie89MrP3c7Nlr08AXX4D7k6iOjj+CkXIO9/4RwnTwazLMzs4B5eCHUJiox4PIY33u/cS917tci4I8nPRYf+QrUr8+6J5ghd4yjCNINUr0LPMsWodfjfuV+V9atjXyVrVOs4OZqsVdeTncjjycpZi4P5VsjkslPj1M8tDps2AciD6Vg3qwqf4FzYIr/opN0v8s63OumGJjkDioURo/ujru1PbCd5CbYtuI++gi+W8AvYeknfz+2Fhn3PeI56mIkSL9h9E4V4Slpu+d1D2WUtXBdRx2pwr08pdlvT+X6uMz+cAE44pqfarFkRh80boVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2H7yZg0oCR+QsQ96C5hXXD01KWvm3vhPbu6SAPV6mA=;
 b=mkvQHxOE1ZaeeLTJDlMsG9CLs9+2MihYY8U6E/uJ2sMYnGWgPBznran3rqhwT7myKNuQHma2AhZVk37/zDeWAk913cBs4u2kWebuF1FAA2t27TyVnqyiO8i1yohz6OtmBLRLedZok/qwvHOelI54p5ya4CQZcS+UXY5jzBQZRJ+1VzkY7SPHS2fWkAdDCuapyVXt3dPu/T7s7dTMkf0DpGVfzlxO50rPJfTpaLeHGZZvybm8l69GfGFOTAcBdZ7dA+T/iWJCuFSz2CGjaM2YSfsqiz1thklQZ0dG2Tt1iw+vjwPp+rrVsrsTZYvIVXy7NAOzbxrJuojOWrPakYCdnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2H7yZg0oCR+QsQ96C5hXXD01KWvm3vhPbu6SAPV6mA=;
 b=XgjlW2+7IFKFY/j8b/HebzakK3jE+5Ls/miNI2CG3yiTQb6B45UNu9urXNxU6Mws+RhkLfv/gNk6PcxGXJJg78s3lWdOL9uzTqnVnfYXgxs73ybkQfp+wgpJfSznIYc+rmNma7xgRh8+0A+Rz/N6ttxdCYQ0RbDhlNjhbKnRMEg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9617.jpnprd01.prod.outlook.com (2603:1096:400:194::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 09:05:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 09:04:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] arm64: dts: renesas: rzg2lc-smarc: Disable CAN-FD
 channel0
Thread-Topic: [PATCH v2] arm64: dts: renesas: rzg2lc-smarc: Disable CAN-FD
 channel0
Thread-Index: AQHcAt6fW7HHbW7qC0e1XlB/hZi7HbRSJr+AgAAQ+dA=
Date: Mon, 4 Aug 2025 09:04:59 +0000
Message-ID:
 <TY3PR01MB11346EF73F28325EACCB9B4988623A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250801121959.267424-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUzKFEjtft1krg=275yTdzE1v+c1VrvN5BmsLtes6LKuw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUzKFEjtft1krg=275yTdzE1v+c1VrvN5BmsLtes6LKuw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9617:EE_
x-ms-office365-filtering-correlation-id: 8c021823-60f6-4c33-cc6f-08ddd335fd9c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dWYzMnNVaGlQcnZZcU1BaWxpSDdTdEFwWVVMdW5NRUtBeUd0alFoUkNEdVdv?=
 =?utf-8?B?M3JYeG1FSzZyUUUwMVZlZ25aVkVyMVh2dm0rT2lPbDlITlM2WENtWjZKL1Zn?=
 =?utf-8?B?Uk5rVlpOaEI3aklJOTV5Q2VybkNvdFp2d2FTRnNTaFZjUDZsMVFJOGxXZzNK?=
 =?utf-8?B?dTljR3IxNnlZd2sydlBJaVAxa1RuRm5DTng1Uy84eTR5Qng0ZGoxdjNUcnRs?=
 =?utf-8?B?UVhWVFpsQWwvdE1ERW1QUXNMR09zUGNYeWo5QjY0TEJqdTVOdThNR3ZhL2pP?=
 =?utf-8?B?N1A5a1p6SnNXUzNuS3Fud2NwNEZpbmtSMHhjZ3F4VVp3MDVwQ0hOMHd5NE0v?=
 =?utf-8?B?cWFYdFNoQlNoL2wvamxhMFRCZEl3Y2g4dC95aS8wdTlxV1cvZDAvRjFMTXN4?=
 =?utf-8?B?TzBDcHh0cDZjdGo0TGdTcFFTK0NZUVBXdjE1Zk52WEVvcVQ1YTlkYTkyNVEv?=
 =?utf-8?B?dHVvMTdOYVI4ekdWYjNRVmZheWliampsQyt2SWNQckVQZFlvZnptbkQxaGMz?=
 =?utf-8?B?WTVwZVdTWHdFWTNCMnB1SFlXVVlxOWhoUEJkenIrMTJLT3kwQWdQcElQakZP?=
 =?utf-8?B?aW05d1M3dFV4TFp5UXptK1RiSEphVTNmRzdrVi9UbXA1QVQycW5xenU2cElv?=
 =?utf-8?B?NXZiRzl5Rm9PMnJyRmV1N0tSSjdVMGQ3UlVSZlFqemNaUldXaDZiQWwzQy9O?=
 =?utf-8?B?VjhtUVpIK2JTU2JrYWwzOUJxTjYrUmNGTDFveDVoQnpyV2xma0lMM1hCOFc2?=
 =?utf-8?B?eU5FUmhBT1FlU3M4VlpSZUhDRENWZkhySWY0Y0V5aHRPRlpUTnJuYzlDUitY?=
 =?utf-8?B?OGFvRis5aDlUMnBlTmZTYlRUVVNKZVIzU25NRVg3QzlZUFpLc09sTkNWdWh1?=
 =?utf-8?B?aHFQeTRheExXNFpSRFkvNCtSREVuRURTMDBURDB0T2ROTWZqUG1td1RRSnRt?=
 =?utf-8?B?eTFPKzk5NWcwaTk1emVWemJjdC8vR3lpU2F2b0ZCbVo1bVJnQ2ZkeVl2UUI1?=
 =?utf-8?B?eEU4bXRLWEQ1VXBzMUFOdFd4RG5kRDIvZDN1NlhrN1VSczRKL2ZUTzB1TG1r?=
 =?utf-8?B?VGJxZFZnM2dUeks1RDgvZER4aHZXMlVIMDJpWHpBQnppL21Zcm0xTSs0N1pU?=
 =?utf-8?B?cjd1M1BQUzJLLzM5TVpoWW9yYTdZd0t4eFRhaENNMUxLZ2VTeGZjenRsT0sv?=
 =?utf-8?B?eWhvVXJyZ3FvMGNsZytJT0Q0S2hWU2RRWXByVXJFWHZsalVUZlM5YVhiMzl3?=
 =?utf-8?B?Tmh1ckZRb3BKd0EyT0R3ZzgxTm00VTgrQ0NNa0swS3NQWS9BbENoS3RMdE1n?=
 =?utf-8?B?UTJsWXJuVnJ3WXQwei9aeFFxbUFob0hrWEZCd2JNeUpZbFBMQzZ1SEhUd25U?=
 =?utf-8?B?YUtrTDhYME9zREVqOXU0R3JDdmJFbzk1TU9ITi9SQnhRZTU0N2I0REZ4cWlW?=
 =?utf-8?B?MTdPZi95dHNaeDlsTUFMVG5VcW1Za1Q2UUs3ci9ZbHBKSEpYaFoxTGFSUUVK?=
 =?utf-8?B?TUxsWlByOElwY093OFBkN0xTb0RoOWNCOGZLT2hnVTdkRTlHakNXa0p4cEM1?=
 =?utf-8?B?eVFzeHFpTVNhUFJOM0pUalpIaWpXdy8vZlE2TlNEdVRVZ1N1RmlCL1lqM1Fn?=
 =?utf-8?B?aFU4ZFlpblJVeC9DRHBsc3BLK21hNzY4TTI2bEJkM1pUOEF6bTMzTXY5WU82?=
 =?utf-8?B?QTFEc0dCMitUR3dTdEwzN1R0d0VyRFQwVEpRV2hJYWFPVy91ZkttWU9mZ001?=
 =?utf-8?B?R0QrakdSSE1uWUVLb2NyelluOCttUU5RWm1Ub1FRaERVZHdCWDRQMzdvQ3ht?=
 =?utf-8?B?MXE4K0QyYmdVR0ZlbFFkcTlYTzVEdTNzNDZjK05FNUZ5RFh4UjE2NG5tMURo?=
 =?utf-8?B?UGxDL2ZWOEY4VC83UU81c0g2NWtvQjRGcHNxL0FpRHUzNDJCdTloYnN4b0Rj?=
 =?utf-8?B?SU0wc1ZBeHBkaTQ4OGQrTkRFcm5MU3VXUEM2NXYyQWdpRGhacG9sVzRzSzRV?=
 =?utf-8?Q?XbupKTUslYs0ouXbO4U5vgEPAaE5w4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3k3YXl6RjYzNFlSR0J4RE5UNHJHNVBWcDJsbGhja1ZMWExYUUV3MVpPMzlD?=
 =?utf-8?B?VXh5d1NQaklnSDVBWWlnbFNxdElYN0xMbDZiOUhjU1BZdmhLcDhrV3Erc2U0?=
 =?utf-8?B?ZVdkNHl3cDhSY3VvTUo4UmRjUnNUT1NVRmdCS3gzOHVlQkkxWkdHSU5vUHNE?=
 =?utf-8?B?TFBsVkpyS2lnMXNUN0Exb05adm8rYXVIM3kxdFBpVHpYUlVTNXdNRU9JTDFD?=
 =?utf-8?B?WnVzdng0Wk96UXREUy8yelZZYmQrTFc3cnkySkF1THVWSHRHN3ZkcDFUSWxk?=
 =?utf-8?B?T0NuVGhxWTNIU3IzcGRYTUVLNHdPOFFxSHlIVVZEWWVlYjlrbnEyY2ZCVlcw?=
 =?utf-8?B?Q0swTmRmMmZTL3NFbjVyanlkZXJHU2tWdzBEVm9XSU1DeitQdnRIVElIUzBw?=
 =?utf-8?B?L1BtczRjUUQyMlJ3Ti9iYUZudXhqdUJzcmZ3OWplYWlmYzluUlNGRklVWk8y?=
 =?utf-8?B?eFozYjZzK2FmK0p4TDhDM1hzNk9TaDl1NEN6M3hxcGNVUFFoYzEyWWZOWFVO?=
 =?utf-8?B?dXEzMTdweTRoL2c0TWpSa1ltMWlkWFFTRDlrRlV6T1pSbVFwODZPODQvcHRO?=
 =?utf-8?B?SFgzakN0a2JBZDRWcG9rVlpCYmhScGxQNnZ0ZVVCbDZBYUFKTUpKSUplZ01a?=
 =?utf-8?B?ZXdyQkRqQW93Ykt3d1ZCL3hjRTExRk54dFk3aUE4SjQrTkhOZ2V1azNLMkdT?=
 =?utf-8?B?ajl4WUdCSEpKTnpHSWhTbXR6VE9tQ1ZwOURjZ2RVQUFlc1QveWFHMEtnbVdt?=
 =?utf-8?B?bmVmWXoxVGZxdW9US2FYN0JtU1Rob0xDQzZsRExBSEN5WVdwRm5mazRucXFz?=
 =?utf-8?B?YkZ0MUozUzdIeDBRVlZRMlB2Wk1qWW5lQmVlUEcwbFdyMEY2bGtEdkxDbFk1?=
 =?utf-8?B?T1VQeXdTTzVOT21VMWlRSFRsZTFvKytaWldFaVM1LzYyMTlaUEdBZjArbzhz?=
 =?utf-8?B?SWQ2ODA5cWxoQkxOUm11NmFsbVJrZjk5c0wrMmxrclY1dG5MekFmb1ExTVox?=
 =?utf-8?B?QU4vZ3hSV3B3TFJtdnRsa0ZPbmJGOVNIbGRQeFZlS1E0NVRnYWZNSWpEUVA1?=
 =?utf-8?B?blZIdEtzcUxob2oxZVJUR1ozR2ExTjBnMEtQS0k0ZER6T0JzMXl6YkpySDFs?=
 =?utf-8?B?SVFCb2VmU2g4eUVBT1VVNVV3WVFqZFhxQzNhZHZkb2hXNFg4UGhtakdVN3ZJ?=
 =?utf-8?B?NnZRbVVEVkdoV01uc1l6OHI5WWJ1bTEwaWNiTVFZZmFKTzVvSVhTdDFWRVpt?=
 =?utf-8?B?anhEcEU3aVNna1kwTXZ6Y2d2SFVQS05qdCtrYTZDRTNxSHpHd1luUXpuK2t6?=
 =?utf-8?B?REdwOHQ0YXhFbWl0TyszRlg2MGJVQ2pjdDE4S25ZdTVIZzVjL1g4L3laVkdH?=
 =?utf-8?B?Z0ZSNy94eFplemNCUkFPbWRYSnRHOXc5a3VVck5DdysrRlBJRkhPd0RXanAv?=
 =?utf-8?B?NHdzQ2Mwek0vbkd4cDREbWdINkNDSjZ0ZytJdC9Edm5oTTROOURGUm1GY2c3?=
 =?utf-8?B?cGM2cHR2dy9EdVBZYUlybUh4WC9mWFhXeFJPNXdDNXBrL1FBdFNuK2JFclNr?=
 =?utf-8?B?cC80ZEFoTWlPaDNLT01ZMXMvaGtjVUdncTdBT01VYndiL2xremZHMmNaVmpq?=
 =?utf-8?B?VmIzcWliczBVZmpiTlMzRkx4QW1rMmZXanJ2a1lZV3Jxc2xvNE1iMndzNXVV?=
 =?utf-8?B?ek1qYk5Jc08yV2NTUmF1SnRQOFhyUEl3WjFISmZ0cjFVSHhVZkNyR1k5OU5u?=
 =?utf-8?B?QlcyZFRML0N2dldPODVQVjRLS3pUYmdhNis2bG5YajcvVzZSQnEyVWlIZngv?=
 =?utf-8?B?N1hWZnJQeUIvMFpnMEk3dSsvRHJiZHBOWkZQZzV6eU9ZTlRkd3FpTVNFZUJn?=
 =?utf-8?B?NEFPRHhTM2I0Tkx2TFVPZWdoRCtzSlFISzZzN0J0bzVRWU5ESTQwT01Ndkpq?=
 =?utf-8?B?Y1J0aXBYQ2puM0p3UlFuNFM5Sm5mdjI3NU1pcEY2bmFKbGw5S3FLdGFhUm1M?=
 =?utf-8?B?WU5rY1dDOTMwMUlFWWtnazdEY2Q1RUVUZWVIcmsxcyt5M2tsUFNxWGxqd0R2?=
 =?utf-8?B?QTJHZms5RS9saFdoZkdDcDdycU9YbFJML2x3TDY2QW5xaXdVL04yTDdQYkZl?=
 =?utf-8?B?ZnRXYnlDVzZSdTg2Y25WSEtnUUMxRmxObHYweXBxTVkyRTd3ME94d2kzQ0dK?=
 =?utf-8?B?d0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c021823-60f6-4c33-cc6f-08ddd335fd9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 09:04:59.7773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hgoHXz+FmAaKlE054KQh2QfRu2fFQAOWmkukkanshHZrRpwJvyN0IgGmhjbLhJpNDxNDorV3UmumRqPa3/h37Xi+BTOjpSVzoHySDDBzVRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9617

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDQgQXVndXN0IDIw
MjUgMDk6MDMNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gYXJtNjQ6IGR0czogcmVuZXNhczog
cnpnMmxjLXNtYXJjOiBEaXNhYmxlIENBTi1GRCBjaGFubmVsMA0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+IE9uIEZyaSwgMSBBdWcgMjAyNSBhdCAx
NDoyMCwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBPbiBSWi9HMkxDIFNN
QVJDIEVWSywgQ0FOLUZEIGNoYW5uZWwwIGlzIG5vdCBwb3B1bGF0ZWQgYW5kIGNoYW5uZWwwIGlz
DQo+ID4gYSByZXF1aXJlZCBwcm9wZXJ0eS4gQ3VycmVudGx5IHdlIGFyZSBkZWxldGluZyBhIHdy
b25nIG5vZGUuIEZpeGluZw0KPiA+IHRoZQ0KPiANCj4gcy93cm9uZy9ub25leGlzdGVudC8NCg0K
QWdyZWVkLg0KDQo+IA0KPiA+IHdyb25nIG5vZGUgaW52b2tlZCBkdGIgd2FybmluZyBtZXNzYWdl
LiBEaXNhYmxlIENBTi1GRCBjaGFubmVsMA0KPiA+IGluc3RlYWQgb2YgZGVsZXRpbmcgdGhlIG5v
ZGUuDQo+ID4NCj4gPiBGaXhlczogNDZkYTYzMjczNGE1ICgiYXJtNjQ6IGR0czogcmVuZXNhczog
cnpnMmxjLXNtYXJjOiBFbmFibGUgQ0FORkQNCj4gPiBjaGFubmVsIDEiKQ0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4g
PiB2MS0+djI6DQo+ID4gICogVXBkYXRlZCB0aGUgY29tbWl0IGhlYWRlciBhbmQgZGVzY3JpcHRp
b24uDQo+ID4gICogRml4ZWQgdGhlIGJvdCB3YXJuaW5nIGJ5IGRpc2FibGluZyB0aGUgY2hhbm5l
bCBpbnN0ZWFkIG9mIGRlbGV0aW5nIGl0Lg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcnpnMmxjLXNtYXJjLmR0c2kgfCA0ICsrKy0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc21hcmMuZHRzaQ0KPiA+IGIvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsYy1zbWFyYy5kdHNpDQo+ID4gaW5kZXggMzQ1
Yjc3OWU0ZjYwLi4wZDM1NzUxNmUwYmUgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3J6ZzJsYy1zbWFyYy5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3J6ZzJsYy1zbWFyYy5kdHNpDQo+ID4gQEAgLTQ4LDcgKzQ4LDkgQEAgc291
bmRfY2FyZCB7DQo+ID4gICNpZiAoU1dfU0NJRl9DQU4gfHwgU1dfUlNQSV9DQU4pDQo+ID4gICZj
YW5mZCB7DQo+ID4gICAgICAgICBwaW5jdHJsLTAgPSA8JmNhbjFfcGlucz47DQo+ID4gLSAgICAg
ICAvZGVsZXRlLW5vZGUvIGNoYW5uZWxAMDsNCj4gDQo+IFBsZWFzZSBpbnNlcnQgYSBibGFuayBs
aW5lIGJldHdlZW4gcHJvcGVydGllcyBhbmQgbm9kZXMuDQoNCk9rLg0KDQo+IA0KPiA+ICsgICAg
ICAgY2hhbm5lbDAgew0KPiA+ICsgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0K
PiA+ICsgICAgICAgfTsNCj4gPiAgfTsNCj4gPiAgI2Vsc2UNCj4gPiAgJmNhbmZkIHsNCj4gDQo+
IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
PiBpLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1kZXZlbCBmb3IgdjYuMTgNCj4gd2l0aCB0aGUg
YWJvdmUgZml4ZWQuDQoNCg0KVGhhbmtzIGZvciB0YWtpbmcgY2FyZSB0aGlzLg0KDQpDaGVlcnMs
DQpCaWp1DQo=

