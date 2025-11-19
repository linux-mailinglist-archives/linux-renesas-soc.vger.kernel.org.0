Return-Path: <linux-renesas-soc+bounces-24784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC93C6E55A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 12:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 90FDB4E068F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 11:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C353559EA;
	Wed, 19 Nov 2025 11:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UPqjht4G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148C434679C;
	Wed, 19 Nov 2025 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552970; cv=fail; b=G9HrTKoDM6dvto//T0kP0WVJMXnXjs0LTxOpUwXZLZvdjNsrM2TS9MxVlCVRFUasr5Jk3zImWQbnBT47fKYy0BztNx8YwpCkFFfQx9sl22qPWEXeooh75eX/eYqa1OHKkEeCgPn460dZv9RMNKUDbJOg0I9C74v9Lj3pu4Ufpx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552970; c=relaxed/simple;
	bh=CpElg5NK1fhTFZBSfwbdP9lQawJ27RfOcr01gsYzQso=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WoRsHyLO4tjeMVGO1A3YDVYy1TN+xwWDG7yvtV+TVjNzR7ITOU7MS0E3ogXQBVLfiJmY0JaRW0TM6Gl7zPlK5YcgElO4242w77yoKNEd+PDom653NLwBeVxd16zfQjez6tAp/iPixwigr9l/Lmo/EJRJs0JTZLNUUD3SDTe4pe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UPqjht4G; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atGcEHrZ4NFe5pmWKYs51bRdyRc7n8uCffiW3u2UFT58Gm4NCVXxcKAmDtDu1vaNaz2gri1IZQuYoLrsbTFobMFUbF3VkETFEO/GKyyu8jW8NZFVwPtVKlhTprpLfDpOo+6XKhiv9rHuo+v+vN24qomnnAliEFbTVy0LZvwBQ/p6CZzD+QfH0qJGKpmNY7WDP0ulq3Z8nplMKc+ro9AOSUfK5UVhYLUTqUAhgwJ6IJ5fxwe2ltbp4dcjNvhYK0/VKy59a3lbefp7IfGkogfOYjax7VLbFPfgnaplA0y82wTcGxgI5JCIWtmdJONgevoWR0QVAK9k/mhT0morTRhMMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpElg5NK1fhTFZBSfwbdP9lQawJ27RfOcr01gsYzQso=;
 b=R3rJhPj502I88C38PTyH1w5Z3T8YETMVv2faasjG3ZkBd8Lc2nK7BzeHjmr3GKsuBxqGldedhHPTiMHjihiFzH7EOgY/2fsaWOaCATHQvHhbbUSk3rNf36Jg+3xkyFNYOnxhWVPWCHcowJBwYvmEVCETACEzTNpIpuXQ0R486ei8S7ImJRn9H1wZ1HXkQDowchym3aymojuLRvIHUOjQnHxzH8HIUPbudtA/USr12Yn+eoLqX4lEUjwnZ+Oap5kDX+qHuTywzsKkQ0TbZL4Rf5X3DRTyPL/xqlxf7pUmJYt3Y2XlOQxmdeotQRpXYS9OcPbxvqfWMp+hkIls3NJG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpElg5NK1fhTFZBSfwbdP9lQawJ27RfOcr01gsYzQso=;
 b=UPqjht4Gout7UZDPg4/9iT4bfsYM6Vryk7G+8IkAS51HYdaM3TWC1OYRw35UUiWdc1RGorx5cGUdKCAPW+Kc2deKPJSBrrBlecpSDt6saobILI+etlRch6z2uYXwVSjOedbq9KP1T69x7BFTh25ycy/ZlRpGEE3VGbUBSWteJZ0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14739.jpnprd01.prod.outlook.com (2603:1096:405:259::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 11:49:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 11:49:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jiri Slaby <jirislaby@kernel.org>, biju.das.au <biju.das.au@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 13/13] serial: sh-sci: Add support for RZ/G3E RSCI SCI
Thread-Topic: [PATCH v3 13/13] serial: sh-sci: Add support for RZ/G3E RSCI SCI
Thread-Index: AQHcVVS/YUcLJ0QEf0e53F6zsZpPb7T4Ko+AgAG++fA=
Date: Wed, 19 Nov 2025 11:49:17 +0000
Message-ID:
 <TY3PR01MB11346FCA297B3FB1F2F5D19DC86D7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-14-biju.das.jz@bp.renesas.com>
 <e4bd468f-6d66-4658-b69f-0dacf006d1a8@kernel.org>
In-Reply-To: <e4bd468f-6d66-4658-b69f-0dacf006d1a8@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14739:EE_
x-ms-office365-filtering-correlation-id: 31ba4e9c-b78b-4691-7fef-08de2761ab9f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OHNiT2pFaUk0dStoOWx0eCtWa2Rzd3FOWUNNV2N4TnNDR3N2OGUzVHRDZzdh?=
 =?utf-8?B?R09XTUYyRUd1SHRSRXJZcDdEZEhxTDhaUXRrbmowUGx2dUMveENmdytGNUd3?=
 =?utf-8?B?VDJ0YktReFFVMXVjaVR1NERsYU5KWUR4SitDQnJGRnpoSzZHbVpDenIwM2lq?=
 =?utf-8?B?WUlacER1UmhDZnYzTEFvdzg5SmhXeWMxeTRYSzBIRExCM1BZWHlHVit2SktE?=
 =?utf-8?B?cEVQS3VNaGhaM0NpelRFU08xbG9uWGd2SEFhQUJaYTQxTFREME1GeXc3bUNm?=
 =?utf-8?B?R1lydDNoRFBLbGh5K3dHQkxoRGR1NFg2Y3R3WVdZaGxGWnlUVzdSaC94bDZX?=
 =?utf-8?B?THhOSDJjWVhKaVVhZFpIemQ0MEJyRDlaRy9QNEs2SDlqN05sclNaK0FFY3Iv?=
 =?utf-8?B?ckpTUjM2VVRPR3ZMRXA3UFRQamY3U2JONTN2b0VUZnNJR2xsRFJYVGxTVXA1?=
 =?utf-8?B?d0h5YW5RenFmcGNTbS96OGtCUVhMbEFyeVEyaU9QWlY2L2JWUU1Ec096ZGlX?=
 =?utf-8?B?TFd6K3FHaFNxNUtqeWhrRGI2Qks1dzgwS0xOMmlUUmpyOGVZVm5vZ1VyNFha?=
 =?utf-8?B?d05XdGp0WG8yMDE3bnVYTVdtQ3JUaGtnNmt3cjFvSjZPS3hDaU1aNklZdExT?=
 =?utf-8?B?V2RzRmpDaUtRYkl0bGhQcWlGOGhBaGcweGNiSWFvdVF5K2VEbXRmSzJLN1Zy?=
 =?utf-8?B?Q0ZLY214dXM5S0pwSEhOeGVqVkl1TitDeFRzVkpvenpua3UweGk1eGFKeFhS?=
 =?utf-8?B?NE9ZL2tuaWx3NU5qTklJcjFVL2UvNEhra1gydHRUbi81L3NZV29COXRpb2tR?=
 =?utf-8?B?ZWFqZEg4SjhRbnVpbXFBRi9NNWZwSEMzQjJkZGx4VXFBWnptblNuSzE4c0Nm?=
 =?utf-8?B?cjZUdjZoZ0tyVlpvQlhpNzJrd2s5cENCQ2lKOGV6MlNXMkZGa3RQeVUxV1Vn?=
 =?utf-8?B?cThuT1F6Z0hlQmpnbHQxVVBsRjZ6dEV1UzZYeVlhT0JldVJ4cm9KNDJsOGgv?=
 =?utf-8?B?Rk9aUDYxeWFaZ2JUaXlWcHRDdnpCZ1lpSkl3bzRSOTlMeWVZbUtsVS84aVBy?=
 =?utf-8?B?blk1V2k0UzU2bVlYbkJhK0Q0SFdjVVhBU214YUxPbExuZFc4b3ZuTU1RV1dV?=
 =?utf-8?B?OGFtRi9ja05JSDU5VUYyMWV6NU5IN3M4Q2dRZW1lbXVWTDkxNi9rSTZyaGRJ?=
 =?utf-8?B?SzhlVlptWllYbWlzTURMdmpmMXVjTEtMUGc3UmJxR0xoNzBFWEtRdGxrZElH?=
 =?utf-8?B?MEJXSUh4amtOVytCS0p5bzEwWnEvanA5L1pjREVGc0N1OXA3Z01kN0VSZEYv?=
 =?utf-8?B?UkphZExWZC8rV1RNWU8rRTNuOVhiUk5oK0s2bDdWYkRIdytuVFBKcVVuOFg4?=
 =?utf-8?B?WG5uUVBwcHdYWTdxR0VYd3hIVkM3T0NleHJRUFBsS29qWGJyZ050VitoQU9m?=
 =?utf-8?B?cHpWb2JmQ0VlTkR2K3RMMmxuUnZkSjFBZXd1ZW9lY1lYMC9xeGM2aUxvN0N5?=
 =?utf-8?B?Q3RIRzlVRkZyNHJaYUF3V0RTaytuYWl0REl6VjRwRUd5OGNHOHlYbWZoTER0?=
 =?utf-8?B?ZTBLYk54WnNFanhIU0ZQRFFWbXFGMTYvbkkvU09OUDNCU2Fya1o4OHBkZmZO?=
 =?utf-8?B?aHVxQ1ZZV0hWblJScVVHaFNRZmMzZnRzZStOOXVlQUhGRE56V3NnQU1qOVFs?=
 =?utf-8?B?Nmg5by9qclBTbVJrQ0czdkJ3amR5c0JKVnRseEFySWNBMTJxYnd1NG5FWEps?=
 =?utf-8?B?ZStlMkhWNGp3cGQ5RmhvOFBlcjJMcUZ5OVdPWjQ1Vmd3NTZvOWZOY3lVZFRQ?=
 =?utf-8?B?cTJpbFYzK0JOUHpxYXlrZHd4NnM3elJnUEdpUERtUzVXODJ0a0tMb09oL2R1?=
 =?utf-8?B?TTRzcGt0TDg4cWJmbm54bGZUQlpnRVlaL3RydUJOYkxyVmdiNjljbXNsdXVV?=
 =?utf-8?B?dWlmeGlXbWxCcXhrWTB2endFRzdDS0diWFMxU1ZSZDVtcFUzNG1qalAvN3lw?=
 =?utf-8?B?eFB3MjZOTzZmUVY4MEdDRmtNbUhUQ3RXZzdDdmhyS01CTm5maCtKQnpHNFFV?=
 =?utf-8?Q?BH5rXS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bklKbTZLVkZ3TVR1MTZpSnVIclhlZm16VnUwdzFJR1g1UmpUNUNLOXg5b1dk?=
 =?utf-8?B?WmVHQVpTV0RjZkJVdFlPbEQ0S3FDbUdyc1JGWTZEUFNyWVRldGpFUnpPYXJI?=
 =?utf-8?B?dTlQcHBkbHdHeUkrbVZpbjFLR1VGYUFtQnBUMDYxZXR2WlBXRTVOMGZqN2Fn?=
 =?utf-8?B?bGp0TWk5ZTdDTFgzZTdRMnA1Z0dlN3doalJWdWpQQmxnbWVQcXZLMTVyZ0Fp?=
 =?utf-8?B?L3owTWtMTGk2VmNvWERBRzVvd2N2KzZRQzFpd3NpMkJzc0s0WUNnWEVkSGJM?=
 =?utf-8?B?d0FmNEVSOFpWZ3Q4OVpTdTBud2VheC93d0V0T3JJOU8rYVlCZEozd0o3T3VB?=
 =?utf-8?B?S1VhT05laTRkNURSTk1hMXdPRTFjK0RNd1ZzUXIxMEFCeGR4MGRLOFIrUUZ3?=
 =?utf-8?B?TEZqVjZnc0NWdjFVdkQxWnpWNGZCQUVZVThJb2dpa0tHeUdUMnIrM0djOS9V?=
 =?utf-8?B?Z1AvbVBnRmlzdkJXZU5MSEFJTnlCL0pCRGtoell5YXNGOW52MFBkWml0aW5F?=
 =?utf-8?B?UG9iYk9pRkxTLzkzMkZVb1pudm5CQ3kzZEZhZHBEQ0NldUluVTlqOFRjUGQ0?=
 =?utf-8?B?Yms0eHFNMVkxVmZsQStZTG8xT1FtZTM0cVZLQVBFejJobjExSGJaY2M1SUxT?=
 =?utf-8?B?Q0d4RE1QdEFWNGJOT3YzbGUvWGhvdm0rSE1DUnc1V1JMSXVVcjFUSFVPNVRH?=
 =?utf-8?B?NC93ZnFDMXRMZ2swMzhNK052QjRIWGhaWVFlSXllR1g4bDkwdHYwc2Jkd2Rq?=
 =?utf-8?B?blRYQnltSThwOGtDRnVZUktGVVpCcjlnRlJsL0FWOEZDMjRnbzFTSlBlL1lO?=
 =?utf-8?B?Ukx0NnUzTTBIQWhpRlVwMUxlcmNidTEzTFV6ZjR6cENHSFJLZUJMS2ZUZVFE?=
 =?utf-8?B?YjhGVVFYdTIwTDFVTFZld3E3Y1hKUEtpTk9JTnNXT1dyNHFJTC9nbmtHYlVD?=
 =?utf-8?B?YWxzeHNiQzM1WGkxSjA3UUtvQmhFNFBXT3VFTVJEY1ZTYlFKeENZY2srakVn?=
 =?utf-8?B?MVhnMTVSN21OUXY4QlQzUVhmdDZZczBVS04vanBYNHFwRExnVzg2a0RDcDQ2?=
 =?utf-8?B?MTZhYUJXdUJoUXYwUW8vdlJwNGpqTDNIRUpqNGlMRy9vazVOL1F2dHlJT1No?=
 =?utf-8?B?K1ZCZS9UZW1CajhjM2Mya0hXTCtZNSs1Qk8ranVGK3RZTGc0QmRoWTFWaUw0?=
 =?utf-8?B?aFIyUTV0MmF3N20yZjJzbmd6dW81b1RHdTlqMzRTOUFlVC82eVd0L294QWFr?=
 =?utf-8?B?a2xYcGRGV2QrQXJtc0JYbFNHcDhzTEtCWGdFblVrM1MrNVR3eG1IN2lNUWRS?=
 =?utf-8?B?Qi9RbnBhOGNmaTY2bXQ5dk9BZUdjdVJ5bkZlSSs4dFlHeDN3ZmhWS203WlJj?=
 =?utf-8?B?REVWWWQ2ZEthUGdPQ0RKd0tZRHB5R1h0WEpQOHVRNjk5WWs5aERvMWF5dTky?=
 =?utf-8?B?d1BKTURZUUYzb0lWSG1WVlBoN3ZPKzNmWDZqdDFnM1h6OVVqUUlyWjZaeGFJ?=
 =?utf-8?B?Wm41bjU3VFIreFJrZmdIOXpoTmZwVDdiOFBFY0dmYVlsSXJDN0hMNEVzOHVU?=
 =?utf-8?B?YmtkSUE4ZXRsVURMeGFXT0REL0x4WXlVSUhKeFpZU05SdmpJNTNXYmtHL0Rz?=
 =?utf-8?B?dTBqc3pVSmdwbFNTQ1U2NFZWSVpqODF3bzBHbDJ4TFdRQkxWK0JXVkNwSmFv?=
 =?utf-8?B?TEpQZ1RicnlNMlc5Y3N2QWZxbnBGaTJlSWljdStxcW9vdE1Vd2crK3ZxbllN?=
 =?utf-8?B?WHUvUFFvSlZPbGJHalR1S1V1ZnhGbGMwcUxmZU9rTnliVGh6K2FWdVJmeDhL?=
 =?utf-8?B?RFdsYkUyOFlHaHNJaHVmTE9mUVRLWTBTTHlHVlhXMUxBSzYxR2g2UGJUSGVq?=
 =?utf-8?B?dlFDcFArb1JLMHp4T3pBRHA1R2UvcEFUaEd4Zm9pUHEyaE9KMkR0Y3J0aGg2?=
 =?utf-8?B?bG9USVJIOUZzMFFlb2FmN0Zvd0JSYWRHQkZvNkErWjJHRncramFCN3pkQlI1?=
 =?utf-8?B?UmgrQm82eTVyRGdCSGNkS2JyT2dxdnNwVDFHNzkzejFJanE2ZnBqeXNFZktv?=
 =?utf-8?B?dnZrWnRnZWczaGdoek5yeGgydEJwWkFkZk9pNFFqWXY5anJPbFhZVVN1VDlr?=
 =?utf-8?B?UlVOU1c2QTZOT3NJWkpTdUxsanFDR0ZXV2xvY3FNRTdRSHJTUkg3R0J1Q0RF?=
 =?utf-8?B?Nmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ba4e9c-b78b-4691-7fef-08de2761ab9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 11:49:17.7388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fZe4a0l62jDmWGzLUbjJyiFRD/diH62dwO/CPIZ7yAD0Awb6JYKdgwoZKRwzSdSFIJYYz7Md1vv96JUOij6UUJAWr3h5nok/bqGVEDvVjb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14739

SGkgSmlyaSBTbGFieSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmlyaSBTbGFieSA8amlyaXNsYWJ5QGtlcm5lbC5v
cmc+DQo+IFNlbnQ6IDE4IE5vdmVtYmVyIDIwMjUgMDk6MDYNCi0NCj4gc2VyaWFsQHZnZXIua2Vy
bmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJlbmVzYXMtc29jQHZn
ZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEzLzEzXSBzZXJpYWw6IHNo
LXNjaTogQWRkIHN1cHBvcnQgZm9yIFJaL0czRSBSU0NJIFNDSQ0KPiANCj4gSGksDQo+IA0KPiBP
biAxNC4gMTEuIDI1LCAxMTo1MSwgQmlqdSB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgc3VwcG9ydCBmb3IgUlovRzNF
IFJTQ0kgU0NJKGEuay5hIG5vbiBGSUZPIG1vZGUpLg0KPiANCj4gImEuay5hLiBub24tRklGTyIN
Cg0KT0suDQoNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiAuLi4NCj4gPiBAQCAtNDk2LDM0ICs1MjEsNDAgQEAgc3RhdGljIHZv
aWQgcnNjaV9yZWNlaXZlX2NoYXJzKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQpDQo+ID4gICAJCWlm
IChjb3VudCA9PSAwKQ0KPiA+ICAgCQkJYnJlYWs7DQo+ID4NCj4gPiAtCQlmb3IgKGkgPSAwOyBp
IDwgY291bnQ7IGkrKykgew0KPiA+IC0JCQljaGFyIGM7DQo+ID4gLQ0KPiA+IC0JCQlyZGF0ID0g
cnNjaV9zZXJpYWxfaW4ocG9ydCwgUkRSKTsNCj4gPiAtCQkJLyogOS1iaXRzIGRhdGEgaXMgbm90
IHN1cHBvcnRlZCB5ZXQgKi8NCj4gPiAtCQkJYyA9IHJkYXQgJiBSRFJfUkRBVF9NU0s7DQo+ID4g
LQ0KPiA+IC0JCQlpZiAodWFydF9oYW5kbGVfc3lzcnFfY2hhcihwb3J0LCBjKSkgew0KPiA+IC0J
CQkJY291bnQtLTsNCj4gPiAtCQkJCWktLTsNCj4gPiAtCQkJCWNvbnRpbnVlOw0KPiA+IC0JCQl9
DQo+ID4gLQ0KPiA+IC0JCQkvKg0KPiA+IC0JCQkgKiBTdG9yZSBkYXRhIGFuZCBzdGF0dXMuDQo+
ID4gLQkJCSAqIE5vbiBGSUZPIG1vZGUgaXMgbm90IHN1cHBvcnRlZA0KPiA+IC0JCQkgKi8NCj4g
PiAtCQkJaWYgKHJkYXQgJiBSRFJfRkZFUikgew0KPiA+IC0JCQkJZmxhZyA9IFRUWV9GUkFNRTsN
Cj4gPiAtCQkJCXBvcnQtPmljb3VudC5mcmFtZSsrOw0KPiA+IC0JCQl9IGVsc2UgaWYgKHJkYXQg
JiBSRFJfRlBFUikgew0KPiA+IC0JCQkJZmxhZyA9IFRUWV9QQVJJVFk7DQo+ID4gLQkJCQlwb3J0
LT5pY291bnQucGFyaXR5Kys7DQo+ID4gLQkJCX0gZWxzZSB7DQo+ID4gLQkJCQlmbGFnID0gVFRZ
X05PUk1BTDsNCj4gPiArCQlpZiAocy0+dHlwZSA9PSBSU0NJX1BPUlRfU0NJKSB7DQo+ID4gKwkJ
CWNoYXIgYyA9IHJzY2lfc2VyaWFsX2luKHBvcnQsIFJEUikgJiBSRFJfUkRBVF9NU0s7DQo+ID4g
Kw0KPiA+ICsJCQlpZiAodWFydF9oYW5kbGVfc3lzcnFfY2hhcihwb3J0LCBjKSkNCj4gPiArCQkJ
CWNvdW50ID0gMDsNCj4gPiArCQkJZWxzZQ0KPiA+ICsJCQkJdHR5X2luc2VydF9mbGlwX2NoYXIo
dHBvcnQsIGMsIFRUWV9OT1JNQUwpOw0KPiA+ICsJCX0gZWxzZSB7DQo+ID4gKwkJCWZvciAoaSA9
IDA7IGkgPCBjb3VudDsgaSsrKSB7DQo+ID4gKwkJCQljaGFyIGM7DQo+ID4gKw0KPiA+ICsJCQkJ
cmRhdCA9IHJzY2lfc2VyaWFsX2luKHBvcnQsIFJEUik7DQo+ID4gKwkJCQkvKiA5LWJpdHMgZGF0
YSBpcyBub3Qgc3VwcG9ydGVkIHlldCAqLw0KPiA+ICsJCQkJYyA9IHJkYXQgJiBSRFJfUkRBVF9N
U0s7DQo+ID4gKw0KPiA+ICsJCQkJaWYgKHVhcnRfaGFuZGxlX3N5c3JxX2NoYXIocG9ydCwgYykp
IHsNCj4gPiArCQkJCQljb3VudC0tOw0KPiA+ICsJCQkJCWktLTsNCj4gPiArCQkJCQljb250aW51
ZTsNCj4gPiArCQkJCX0NCj4gPiArDQo+ID4gKwkJCQkvKiBTdG9yZSBkYXRhIGFuZCBzdGF0dXMg
Ki8NCj4gPiArCQkJCWlmIChyZGF0ICYgUkRSX0ZGRVIpIHsNCj4gPiArCQkJCQlmbGFnID0gVFRZ
X0ZSQU1FOw0KPiA+ICsJCQkJCXBvcnQtPmljb3VudC5mcmFtZSsrOw0KPiA+ICsJCQkJfSBlbHNl
IGlmIChyZGF0ICYgUkRSX0ZQRVIpIHsNCj4gPiArCQkJCQlmbGFnID0gVFRZX1BBUklUWTsNCj4g
PiArCQkJCQlwb3J0LT5pY291bnQucGFyaXR5Kys7DQo+ID4gKwkJCQl9IGVsc2Ugew0KPiA+ICsJ
CQkJCWZsYWcgPSBUVFlfTk9STUFMOw0KPiA+ICsJCQkJfQ0KPiA+ICsNCj4gPiArCQkJCXR0eV9p
bnNlcnRfZmxpcF9jaGFyKHRwb3J0LCBjLCBmbGFnKTsNCj4gPiAgIAkJCX0NCj4gDQo+IEluc3Rl
YWQgb2YgdGhpcyBzaHVmZmxlIGFuZCBpbnRyb2R1Y2luZyB0aGUgJ2lmJywgY2FuJ3QgeW91IGp1
c3Qgc2V0IGNvdW50IHRvIDEgYW5kIGludHJvZHVjZSBhIG1hc2sNCj4gbGlrZToNCj4gDQo+IGlm
IChTQ0kpIHsNCj4gICAgY291bnQgPSAxOw0KPiAgICByZWFkX21hc2sgPSBSRFJfUkRBVF9NU0s7
DQo+IH0gZWxzZSAgew0KPiAgICByZWFkX21hc2sgPSB+MFU7DQo+IH0NCj4gDQo+IGZvciAoLi4u
KSB7DQo+ICAgIC4uLg0KPiAgICByZGF0ID0gcnNjaV9zZXJpYWxfaW4ocG9ydCwgUkRSKSAmIHJl
YWRfbWFzazsgfSBhbmQgdGhhdCdzIGl0Pw0KPiANCg0KWWVzLCB5b3UgYXJlIHJpZ2h0IHRoZSBi
ZWxvdyBjaGFuZ2UgaXMgc3VmZmljaWVudC4NCg0KaWYgKHMtPnR5cGUgPT0gUlNDSV9QT1JUX1ND
SSkNCgljb3VudCA9IDE7DQoNCkkgd2lsbCBzZW5kIG5leHQgdmVyc2lvbiBmaXhpbmcgdGhpcy4N
Cg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCg0K

