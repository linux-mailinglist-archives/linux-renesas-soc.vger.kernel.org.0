Return-Path: <linux-renesas-soc+bounces-15971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C1AA89558
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 09:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A33F16C27E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 07:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F13927A13B;
	Tue, 15 Apr 2025 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Om592Qqo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B952FA48;
	Tue, 15 Apr 2025 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702864; cv=fail; b=mkoPtbcCNWuzTokY/X4kNFh9K35Of1QbNe3qXlkAKq5oNVfj8pcrpWBBOfbkL4Kjk2G3IpRq0LEsG9ziBKvvMzJgnzR+D9LU09STsv6/owsP1UGcGXrR17pdnasIYkkzkkTmNu5lfJY27lAZTp2uSP6pOprlfG3z1ZM3uWGZ8BQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702864; c=relaxed/simple;
	bh=NLgLVVKKSIOL/yRYCITJTKY6x5oUZ6EHHvH4APd6das=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gbzGj9J60Q7cIXF/k331O7jrqMmLAFxi7CQYwnA8pqrqqXsQakeaOxVvxLy8XrzOmL5zEaf/VMJ8V6AgUW0Y/0zDfZgj5sCAt+nk9n2x87UFxsSySCvicvvdCqXfdcG/kt+zcthtvVSY5RUO0oYtd+YpY4Hj33BdoTzzpK9Bm1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Om592Qqo; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRW0OqiU3U0C5tn9YWwwJnzDadO2ex+5DP6/odFspjYbdhcig2bJwUL7GeI4dytzY0kqRHUFPSJGAMcp+cnVsYs2dtD0MzX95CHQZMr9/MBH+8ltN/j6nk/Xcgtrdtrjx6kHrJrDC8oJjASRIA2BwCTGLifsZLmamXku1QOK7zHhlyUZN9LlrthvPnjjnO4GfHWjDP+/MKTWU2L5yLHbNlVWT1loTuGpLNKla5+Oed9wBbLKadP+xkf+tEEBJrT3c0PjCs6FxGqXH9llbE8h8x5wykeLEjdFh82M0taCiZ70DPbDZtGFaXz0+lWoA0mUDjXdJNxXEz6G64E0PxAcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLgLVVKKSIOL/yRYCITJTKY6x5oUZ6EHHvH4APd6das=;
 b=iACwDlfK45GDmQ8SY1KAcV5EP7knsDyJ3LQi/ifs2VYlUs3VkcFj9+15HZ7Ri62Y2wG/Y/+ns/x0mEgCd4POh1NJrjx+kZOHdc/Tijo2CVN6R5yRsg68YGfQhK5Ks868+tZtg/fxjzE5xUjqfEZ9o2t6bR7kUXmKTxjWY6zRGW6ARLOUN4PEX9hIq0qqENRSPKDQHP5EyvZzcbPAaX0kkWvOgmw26tQtXxxSaWtLBbD5sRg5T+Xzh/6mzTTaH+Jk+cbeTeoU3KrboS1F8XN/03JYOORXQq7bFBbsYjZWx5xgRBz0HQUv/0psxX1/yjE66oT2xTx5s/RuveFqZRFJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLgLVVKKSIOL/yRYCITJTKY6x5oUZ6EHHvH4APd6das=;
 b=Om592QqoetnL4lxH/VeQ1KUhGyO+7AQu8T41zn85QXCqu0ZQ9NTkaaUFEFPxLx9mNkMBRDWna+GzEW0aJZ50fWDXnnux2mni4zWbkU8n4mbzc8DQMZ9bUeWYw3pn6oIVHyNKhmULVpR5TyB+tIU4rewSRE45PyK3p5XgMkFIIUw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB14027.jpnprd01.prod.outlook.com (2603:1096:604:360::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Tue, 15 Apr
 2025 07:40:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 07:40:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH v4 1/9] dt-bindings: memory: Document RZ/G3E support
Thread-Topic: [PATCH v4 1/9] dt-bindings: memory: Document RZ/G3E support
Thread-Index: AQHboxNd8kzjfO8LYUKaJ0shTQtNvbOkUg6AgAAZVnA=
Date: Tue, 15 Apr 2025 07:40:53 +0000
Message-ID:
 <TY3PR01MB113462BD14576B932862FBD6286B22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250401143537.224047-1-biju.das.jz@bp.renesas.com>
 <20250401143537.224047-2-biju.das.jz@bp.renesas.com>
 <cc351443-f481-4fcd-ac85-1fc01d1d7097@kernel.org>
In-Reply-To: <cc351443-f481-4fcd-ac85-1fc01d1d7097@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB14027:EE_
x-ms-office365-filtering-correlation-id: c0b09cbe-0da7-46b5-095e-08dd7bf0d9eb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L0ZzMVlLVVk2NXZLdlB6ZlZGUE5henBkT3RjQkI4aHByeGUydFhVVTlhUUpy?=
 =?utf-8?B?NktPR21KemRXTTZOemxPV0NDeWZkSVhmWUxwdDRFalIxYnZ5VWtwTjYzQmxJ?=
 =?utf-8?B?blRHbmp3NlR0VjJoK1NDMFRCdThMUWttdzdzUG5TU3RUNHdTcTNNR2lYS2F3?=
 =?utf-8?B?UXZsbVpEcVlFV1hqdkxKVEpwMmZibkRQSCt3OXU2T1RLQ2IzdGJYR0JwTGJ3?=
 =?utf-8?B?RlR2aW5tMTRaZS9yaitRMjVud3I0MGFYcUlFUkI2cmZXN1c3QkN3OVNtSnNL?=
 =?utf-8?B?NmVRU0NpbHo5cWZBMnBpcHZsbnBILzl4QVVsa1B2bmJuMUZIUGFnNU1UaStV?=
 =?utf-8?B?M09rNjhpWUtrditmWFUzdDk5ckJQS3hnQ0lxbzBSNUJSM0ZkWXlpTWRVU1c2?=
 =?utf-8?B?QmowV2NZMkU5OWJ4dkJYQTNhL0FQblVlWXU0Wi9nc005U1JnWnQxdDljVTFv?=
 =?utf-8?B?NUd0cWowQTk5N2tKU2poZnNUMDJjMUE2aWZCNUdPd0x3dVlIL0RYa2VWUEQz?=
 =?utf-8?B?QlppdmQ5dWppaTk4Zlk0V2ZvNUFZUXI1dCtKRXc3SEpIMEt2VzhkRFdFN01P?=
 =?utf-8?B?VHVrWEtQU3Y2K1VVQlZJbmtSZk1IZ2FiaEZTeXNGNU9wbkdOMGhadWowZVY5?=
 =?utf-8?B?WWVzbTgzem44S2FlQVJPVVpnTDRHWmxiMVBvaGgybVN1LzFoVC8rRDg3Vmox?=
 =?utf-8?B?Zmd4T1hPZkFTYk9IY3pVa3JSenhKOVJldjdubDAwSGJtd3NWRFYwVkMvSjFl?=
 =?utf-8?B?SXhoWHdIK1pPU0pIYlpjL0grZHYrb2s4RWdHMi9sUUNORGwwb0owakQ4dHph?=
 =?utf-8?B?bGlKK0VJOFZoc3h2c2NjeEZ4VXp6Ulk0MWI2K3pCanpPaUd0aXh1USt5MnE0?=
 =?utf-8?B?RmV3bGJyYjhJNFp4ZEVaQUdacmd6ZXJnYTE5emZhZm4reURVcnc1TkpObURp?=
 =?utf-8?B?R3lWQjdPWUlRV2t2cVkvYVNvRWVMaDMyN3hXQ2dxUVQvSzYzS0tDRnRFam9m?=
 =?utf-8?B?Ymxva0I0L3RLalY0NVFJQ0F6cnlDS29pQkhSMkVnWXVkNE96NGdJQWlub25O?=
 =?utf-8?B?SkVURkErQWlVYXd3UUN1dFdleTdPbHZpTTBwMDQ4dktZRTVuRWdxZ2dad1JP?=
 =?utf-8?B?MldPVnRTNkE3ZTQydXFuN3JHa2x5L1hQUHNLNHZvNERRSm5OVTByVFo0T25V?=
 =?utf-8?B?eFI3QndaR0x2dFJWTytyc2w2dmFMUlYvVElHUjNZSUk2b2hHZ3M4ZndzWkJQ?=
 =?utf-8?B?NVQyZHI3eGJBc21FRDRIMno0ZHgvM2huYlZCck1aMGtjQUkzaHZnMjhKa01k?=
 =?utf-8?B?Z1QwcFI5MGVCekgrTjArdmZMY0NJWXJWT1lhVkJydHZsYUZGZTdSc2FUYkdj?=
 =?utf-8?B?bDVQbVkrUGY5MitnL2VtaUc4R1NoZDExUGgyWXBVelBrREUydnBXc0NqZTM0?=
 =?utf-8?B?TFlVMEpPZGoxWGpFMlFhSnFEdk03ZWhQL0ZxYTlUOVQ3T1BlNXB4eVNDL3Nt?=
 =?utf-8?B?bGVKdDNaZzBZeGJSYXlqTDlSMjhpcWJRRGM0UHdpUkNXckM4TXNzQ3cvTVp4?=
 =?utf-8?B?RmhON1lSZnNNcm01UFNNbC9MbXdKODFoNmlhV0VTTVhBTDd4azNMUUtlb3Bk?=
 =?utf-8?B?VFhXaXhudmplOGEzbHpjOTRNMlB6N1hLSG1SdSttNW1tMmhtZVQ5TWxTLzcx?=
 =?utf-8?B?QytwZzlZMXQ1Q1lvdTBYQ1lNangzK3BjNnhrREo0ZVlFQWNBS0xhb3R4blNL?=
 =?utf-8?B?R2czeE5nUGhTTXlWOXlPYWYrODlrTzhBMktkSWpjUTZ0cllDYnQ2amxIUEx6?=
 =?utf-8?B?bE5WZ1MrcFV5c3lPS0xocGNNTVYxT1BSNXFLcUlvaHNxMmNvbFRXdE1wNnhp?=
 =?utf-8?B?Z1hsOG43VnpnS2NHZUc2clVSWU1ZZXg2Mk43TXZ2VzJmeWRXWHp6NkRmZ25F?=
 =?utf-8?B?bkVsMHZSTm1iTEwvSlVhV0xzVkZDOW96WW5GZWM5M21UeXBPKzZGb2ZnbUhY?=
 =?utf-8?Q?5yzRw14D8QhY7cc1DOpRoYSoJbFmKo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RC8zSnRCeWNrRExRWVo0MVJRZXg0WWxhT1RBNDVpcmxqaE94R2pWWVF4MmhJ?=
 =?utf-8?B?RXdaMG1hU284U0w2dFV4NWRyT1Z0bkpBV1pxV25jZ0pzalo2WFg2djNwczBr?=
 =?utf-8?B?VExXa3hGeE1qb1F4ZlkzelVxckVST2VNZUlIYnREeW52UVRHM2gybkRpQmZX?=
 =?utf-8?B?UU9xS3VSVXpLZUtueEsrcTFOS1JMM2VQaEgrUHBXSWtQcWhwRWlZdXlSaXMx?=
 =?utf-8?B?Q2Q5WURjMlZRQXpPcjJyanBtcHZHdUZxZVVkWElERXNnVEFMTWdNbDZGZXZ6?=
 =?utf-8?B?d0dkeUtCSjUzK2NyMHB2N3FCbSs2c0pYUnBTZ0N1VGhzVzJXeGFYTU5jVHJj?=
 =?utf-8?B?MVlVazFZT0VMZW1NMzF4OWhmL3MvaDdaZEEzQ0NBK1VqQjE5eHROckQ1a3hR?=
 =?utf-8?B?VjNJQXZrSStoK1NZdkp4ZEE3WWdMMnJXcE5XVk9FQlhya21oS0NzWXZGV3Y2?=
 =?utf-8?B?RTVFbWJ4aHFoY0VlRGdIWFpCSm16QytHMkhLVHhuZVhBSWdJa2RDTDlNa0dj?=
 =?utf-8?B?bG44dmViTTMzUUJGSHJMdnZ1elY5YmRycVI5RW0zZEdjZzhGaUZuRXdjS3RT?=
 =?utf-8?B?UUpuamNuelFUL2NNclhKVDF4SDNHS3UvL2d4ODBsaFcyeXJzdlBUZTJpcUhw?=
 =?utf-8?B?NmFkeGF1bHRFcXNlcnVTVU5WK3JFZ3RjZUg4N004T0tHbmwrSlF6MmV1Vzd0?=
 =?utf-8?B?V1NCRzhjT3lab2RKU3BmaDFnUm95MDdOM0xtRS9EV3U4Q2p5bHI2MHhybjlU?=
 =?utf-8?B?TlE5dXJwM1FKRWhMTmtQK3IxVUZYcXpXRVd0aG04NDFrQXg0RnBPUDREME54?=
 =?utf-8?B?aTRLd2UwOWZ1c2FSQWQrZzBBVWpsUGFOMk85dVNWVyt4SVdFZXFRaUhvUURJ?=
 =?utf-8?B?cU1uOFFsbXVVZFRaVGlwbFNIandGV2FkRVlBVG5kSG9jdk85ak5wbERyRHZ6?=
 =?utf-8?B?OUQzQThVWHZ1bWZLQkIxL1gvUTVEbU91ZEkwVHpobmFSN3JzZm52b3VYL3hv?=
 =?utf-8?B?QVRERG5xeENUT1RUZ3VqcVNCY3R1Y3EyZXZCVC8ycmR3WUFmUjloZnpKK1Vn?=
 =?utf-8?B?ZUdjTVZKQ0dCSVExNTlTTnd3UGpFOGdCVHE0MGdFZWkrNDFRWWpnbElHZkdB?=
 =?utf-8?B?Y0lrTDJuL1MwRjlWemZLZjdyY2VhNVdacWlTTzBESUtydkVyVTBMSFIxV1Vp?=
 =?utf-8?B?MnBLeHRHa1M4bDM5SG8rYzNNMmV6b2RsN0lLdDdZWHpwMDJmNTd4ZWdaeXBj?=
 =?utf-8?B?a0lCNXc2bzllQnlRN3hQV0Y1eEVhL2pqSW1lSU1vNEhyOFdMb2ZkeEtJNXV5?=
 =?utf-8?B?U3J3UWo4dEV4WlljeWJ0cUxFNUFURGVEdnZyZVB4U253aFpnbzBPeUJ2czgv?=
 =?utf-8?B?R0hxcjRCNFhVanVxQm90dkQ3OHFsMTNzQlBVcXVTWXhiRi9LQzVoQnl2VldY?=
 =?utf-8?B?UkF6M0NRSCtqU1dNa05HZ0d6TXBaSTlEclZrMVg1Y2tzeHMzVk1OVjBzQS91?=
 =?utf-8?B?UitaSlNjaVhmNjE3ZW8vV2hXeFNlRXNaSFNHZ0FTRmQwUU5UZFREaE5xaFRz?=
 =?utf-8?B?LzZTTFRtRmowQkdxL3JlVEgzdmpLNU9RMGRqb3MyQjBVbE5hdTc3QlhJZXhL?=
 =?utf-8?B?MVpnWFBUa3Q2L28xNDU0U202WUh2TlJ3cnE1cFkvbmVNZkZkb3A0em1wclM2?=
 =?utf-8?B?b1pHekg5WUJMNE5lY3AwbFhGZlhBN2FKSlYzMnZjM1pYbGVabXdMZi8wTkxx?=
 =?utf-8?B?YnlQTlBTUXpUMVlhVkpxNFV3Wi9CbmhRS0V1TSt0SWFtK2RDWDdGRkJHZlBU?=
 =?utf-8?B?MjN0eDBZQnplMlRiUHlUV2hhWU1QYkU3SUQvOGtWNGp4S001WVJFT1Qxb082?=
 =?utf-8?B?amF5V2hRNjhqSWZsd2w0c2dmQjUwZ29KQ0JNSmdHOUR3RUFRemtUMXI5ZVcy?=
 =?utf-8?B?bXQ4NnZtNzhxZUVqalZxUXh4aUF0clBWNjRsSVhMd2RyczVPVm9BaWFxV0Vy?=
 =?utf-8?B?eksyZ2NtNkRIcHFnS0JyU29uUFBZR1dBTDl1bXlUUUx2eXNnT2ZwZ2p3UHhV?=
 =?utf-8?B?dU5uenh6RU5TWGlhNC96RnhjT05WQUF6R2R5UUx6dzlrd2xCWDg3QnY1d0wv?=
 =?utf-8?B?bFR1L0VST1hPVjk4VW5jZlQ4UjJOVXJ6ZDBQSlc0bGdQMDFQTGdISTcyaEUx?=
 =?utf-8?B?Unc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b09cbe-0da7-46b5-095e-08dd7bf0d9eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 07:40:53.4750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9OxiIPBZPjGC4f2tvLh8D8a/UrXtH/NJVRxMMzDUc933zPalroeWJi+yMOLFjutJsw1O+SprdUlWAGFxw6zkT/htpyj+/53mm0OiKVtA2nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14027

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCiAr
IGNsaw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBL
b3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogMTUgQXByaWwgMjAyNSAwNzowMw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEvOV0gZHQtYmluZGluZ3M6IG1lbW9yeTogRG9jdW1l
bnQgUlovRzNFIHN1cHBvcnQNCj4gDQo+IE9uIDAxLzA0LzIwMjUgMTY6MzUsIEJpanUgRGFzIHdy
b3RlOg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3JlbmVzYXMs
cjlhMDlnMDQ3LWNwZy5oDQo+ID4gYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3JlbmVzYXMs
cjlhMDlnMDQ3LWNwZy5oDQo+ID4gaW5kZXggMWQwMzFiZjZiZjAzLi45OGRmMTY1NTc5ZTEgMTAw
NjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9yZW5lc2FzLHI5YTA5ZzA0
Ny1jcGcuaA0KPiA+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svcmVuZXNhcyxyOWEw
OWcwNDctY3BnLmgNCj4gPiBAQCAtMTcsNSArMTcsNiBAQA0KPiA+ICAjZGVmaW5lIFI5QTA5RzA0
N19DTTMzX0NMSzAJCQk2DQo+ID4gICNkZWZpbmUgUjlBMDlHMDQ3X0NTVF8wX1NXQ0xLVENLCQk3
DQo+ID4gICNkZWZpbmUgUjlBMDlHMDQ3X0lPVE9QXzBfU0hDTEsJCQk4DQo+ID4gKyNkZWZpbmUg
UjlBMDlHMDQ3X1NQSV9DTEtfU1BJCQkJOQ0KPiANCj4gVGhhdCdzIG5vdCByZWFsbHkgYSByZWxh
dGVkIGNoYW5nZS4gQ2xvY2sgaXMgdGhlcmUgcmVnYXJkbGVzcyB3aGV0aGVyIHlvdSBpbXBsZW1l
bnQgb3Igbm90IGltcGxlbWVudA0KPiBTUEkuIFB1dHRpbmcgdGhpcyBoZXJlIG1ha2VzIGl0IGp1
c3QgY29uZmxpY3QtcHJvbmUgYW5kIGFkZHMgYSBuZWVkIGZvciBBY2suDQoNCk9LLCBJIHdpbGwg
bWFrZSB0aGlzIGFzIHNlcGFyYXRlIHBhdGNoLCBzbyB0aGF0IGl0IGdvZXMgdGhyb3VnaCBDbG9j
ayBzdWJzeXN0ZW0gbWVyZ2luZyB3aXRoIFsxXQ0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjUwNDA4MTEzODQ1LjEzMDk1MC0yLWJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Lw0KDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPg0KPiA+ICAjZW5kaWYgLyogX19EVF9CSU5E
SU5HU19DTE9DS19SRU5FU0FTX1I5QTA5RzA0N19DUEdfSF9fICovDQo+IA0KPiANCj4gQmVzdCBy
ZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K

