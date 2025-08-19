Return-Path: <linux-renesas-soc+bounces-20676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 787ACB2B97C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 08:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDC007AE32C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 06:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3340D26CE29;
	Tue, 19 Aug 2025 06:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="L5VAa+iG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042A2269B1C;
	Tue, 19 Aug 2025 06:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755585261; cv=fail; b=SgkxCv6SKt77J9R5aDrdkNXPaCP19Bp2QDyU5n8J2+St3f09u48xb7kYfpSaJxU/l4bSszaQ6MMm8NmyC2h+BKjdAwtsxdmDv9oPU7Np4sj2H+mIF865ihyJDGQs1J9EeWcx4wDsGcFhDFtSLIxe1EVtq9ye8P5n8omOS2i2llI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755585261; c=relaxed/simple;
	bh=oELUR1AyKg9zdv/k0+HcFos1MAwrIAy5dSQAlAs+9Xw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DdEZrxiOWH6mMEmOYBa0VQHUu11PjGnW6nMA7LvB8bnqE52+SaRWC23nijtbR5eTufQuekf9KN8IpeYK9QLOnqbD9/QiwmSOSn71wx61Cdc1LT9v8WePecIL2R66tx2HobXojkdKkopz8mbjn2uTNF9KgCyKUqFU6evThX+k+Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=L5VAa+iG; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Swkn5WCZ6NQJD5suNXc8NTLFx/fdL+KVVpyaxHXPvGe+WT5uUzAwdEVdYaxqssWbbYvYw+MCMP/caMc0mC7enFkwFj25hoTwBo7KWqwUZwGMsDZUrk6jzPKj4XlA8ty4dIUPXAzQZJA1AshcfqFgIwibfpKc8YtdiWOPbaVf09Tm3N8hGaja1o+q8GFn2I8I8ll67s7uH43Ck6TMS3JW7Mg4V4TUvsiubBxqxPmel5bNSq4HBuf1Ou5aEmr/Dv8OKp5xJhgLxkEcVTG8clzR/+eM3x+WoxrpXqxbK9KYjVnDH4cNJT57CwboPxkmddWJUemqosmLjs5oyMRoDeMadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oELUR1AyKg9zdv/k0+HcFos1MAwrIAy5dSQAlAs+9Xw=;
 b=mNyOyjL6V1vGMDl/7GcWc4v94Owf53XV9FwO74PK1lOGUX5OMVQl+bfLYAM2IEsf+gN0VCodl9MMHH/dge4FKwq4ZWzjmpuiKaCzrPME/nVvUJT9PKlmgrr4zDNmBR/XzAwGlFX7cWLFiekSJOL7BfWlvRV4liVOEB+BcAmrc47zg3W4hdLKWv9H5bn9U3204hTNLdsbYWd4pvLR7jpmj58791njJj+oYvPg3OchiEoN3NLlRw7IJa1tCjl/uwLC+DcMbQguLSowQEt/oB2v6bR8DB7gD3hMCppRPLvSwPF4AXhP3CwfaAQfJymuTGsvlUcd4NXdmCBuQzJqqALSuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oELUR1AyKg9zdv/k0+HcFos1MAwrIAy5dSQAlAs+9Xw=;
 b=L5VAa+iGzyqc0SCM02pnDVmRiWecSV3C7Glkctum23rdMvs+rwdI9DhO74gGeAd0GWZC7A9E0t28ixh2hHTJGZsifnAgU/X+/NcY7if6mdWklxFYe9GqMbJg8jY/EJF7wHITcnnwHckhbUHtknasczwsH2MRfsr0QmJ7qSONYfk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB7973.jpnprd01.prod.outlook.com (2603:1096:400:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 06:34:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 06:34:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "kishon@kernel.org" <kishon@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 2/7] phy: renesas: rcar-gen3-usb2: Fix an error
 handling path in rcar_gen3_phy_usb2_probe()
Thread-Topic: [PATCH v5 2/7] phy: renesas: rcar-gen3-usb2: Fix an error
 handling path in rcar_gen3_phy_usb2_probe()
Thread-Index: AQHcEMwKkF0KDbGXOUaBwniJyvjIFbRpd2yAgAAEWQCAAAhKQA==
Date: Tue, 19 Aug 2025 06:34:12 +0000
Message-ID:
 <TY3PR01MB11346CA32F5E4B4329C46112D8630A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
 <20250819054212.486426-3-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB1134647BC6436CA61E0A200F98630A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <bc053bca-8dd9-4a50-a352-290b38a329b0@tuxon.dev>
In-Reply-To: <bc053bca-8dd9-4a50-a352-290b38a329b0@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB7973:EE_
x-ms-office365-filtering-correlation-id: 1e5943b5-4c21-4bb5-15ba-08dddeea6930
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?bTZwMWkyTU9oOUJmL3N4cHdhQmN2a3NYTHU1dXplT2QxbmdpVnlLMHRYcmh5?=
 =?utf-8?B?NmZwYjRFM1JRcjNYbnkzbExIb0s4ZWtSd2RWQjNVV25lRXFXZzI4NVpVbURo?=
 =?utf-8?B?empUZVYyTklYOFQ1MGVBZjMySmJHdGFwZEZsVW1VcnpCbW8rWkpSaE9sbHJP?=
 =?utf-8?B?OUVoRXdNczByY2RPRDNyRVNlaWhpS1E0cGdWZ1pQbHZTRE5jMzVacHVEdy9J?=
 =?utf-8?B?MDY0blJwS2dnaW1rM0tQTHAyYXVUNE1oSnBuVW5acXRNQjVTbFJDa1QwVHVv?=
 =?utf-8?B?OWJKVVVsSnRZSnYyME5rblVQTitLVUhmWDJRV3YyZldWbEErSnBEOWRHQ2E3?=
 =?utf-8?B?K3JxZnJtOHIyMjNaV3pSeDQvd2Z0RzhIdmJPTkVoUGF0MlNjaG5Ya0JkcTl1?=
 =?utf-8?B?dzIxVXBuZ1ovOUZJWTN5UUVSQm5vUmQ0MDFvekZkMTRZZmlqVkFmTExydnda?=
 =?utf-8?B?WVFLN3gwNklleW04Q0lDZWhnTzFlbFgvZ2MyYUVzSDJCMUVwSkg1S2ZmUCtQ?=
 =?utf-8?B?U00yemJCaEhKZk4yOXBCWDB1TkpzeXlSNzdPb1pvYUZOeHBqVUVBV2R3NXBl?=
 =?utf-8?B?TzVWRFZhelYxQ2xrM1IzdktuTHhuQ0IxT0FCaU5ZSFJNa2ZBKzl5TTVYRXNz?=
 =?utf-8?B?Y3RvY2V6L2VGY2dMTFoxbXJzY1dvT1F4UkFTdjJhbityK09JR0VESnUvVUUx?=
 =?utf-8?B?M2xha0h4eG5uSXlqczlCd00yRENmZFR4KzB5RVE5RGg5eDhiMHBBRHZxeWdy?=
 =?utf-8?B?UFNMTTlWTHlWcmlKS1AwMUwwM0RJTEhvRFRzd1N1d3J2L2VCUWNFWHR6ZEZG?=
 =?utf-8?B?U0oyODRKMUtRWHQ1RWFrNmNtUUNNVUtrdXZpUW5vZFVpSDNFTmNXTmtPOGNJ?=
 =?utf-8?B?S2w4cUJxWVZvUkhIMjhOMzhnbzNpV0tIbUxPY1hRSEY3YjhPdVZ5c1hZY3dY?=
 =?utf-8?B?d1l3QVQwZW9QdnZWcjN1UWt0SzB3TzIxd2dycGNzSTZIVkNFNGFlMXhBWUx5?=
 =?utf-8?B?ZVA4MThmZG91V1NqWDMzM3U2NnRwdGlqSytnejB4STM1bFZLQWUxandEb0s4?=
 =?utf-8?B?WVJRRjB4aUNUN2hxK3MrbDg4Z3o1dCtWN0E1RTJUOEllbXdNY2FnSm9mZkFZ?=
 =?utf-8?B?M0JLaitCeHRiRDNlRnNQVGtVQUFrbnV5N1I4MDF1NE1nWU02L3g3MHVyaFFJ?=
 =?utf-8?B?aG5mbjlPSEJZV3Q0c2w2eVQvK1hMVlN2eG16YXoxTGFqRGloSlpWVVN4WVM3?=
 =?utf-8?B?eFFTdkgyblg3RDgwRkd2Zjdkb2NpeStMMUtydDdYalBRRVlKWFBtbWxRMXpE?=
 =?utf-8?B?dDhVN21QeGdLcllNazZlQmR4UktjTGhPWG9yVG5nWEtoN3dSaXJUOGVpK2kz?=
 =?utf-8?B?LzlWaFJLVEVBZmdrY0VUYXd2TDhuUVhLaXhuV2tJcHBiV0x2NmRFUGo4N0gy?=
 =?utf-8?B?N1Q4blMwTlc3QkNEKy96QlBYdmYwMHo1dkJ0eEdYbmhlMGMzZ2VydjFOZnNh?=
 =?utf-8?B?OXVSdDl3ditabCtnYjFyeU1MbU94Z2N1SUVwUE1nVVYreEs3dkpKcGZLVGRX?=
 =?utf-8?B?ajBvMUNoMWhvN01TbmRHWGtKTkxCZmRGSTFFZ3JsajJMYnF6Q0sxSlNOdEp1?=
 =?utf-8?B?VVdnQjY2bFBDZEEzTHIwSCsrS0JmYmZYWFhibW13TWNleXR6ZVBBeGh0WTJK?=
 =?utf-8?B?cFlvYjVZemVwSHpza2ZLUFFqZjd2RVdnaG8yeVZXYVYwWUpEcFdQREVlS2po?=
 =?utf-8?B?TDBFL2Y5OHJjY05nTitRTVVwSXhjL24zeVJXdnhsQll5NnNranNPc1NqZ2E5?=
 =?utf-8?B?RkxSZUgvUDBHYUdZeWFtMlhqV1lzNkd4d2VHWk9aTHlDWCthNjAvcWRYUUJy?=
 =?utf-8?B?eVdaUXY3VForTk9NQzRwNzg1T21abG5JSmxKVVJ3cjdGU0RtY0lQSzlaODRP?=
 =?utf-8?Q?esQea4BJxoU3G/ljjKTOGDjF/pezTdHc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUJQOEpSNW5BNkxMUWpCTUVvRzR6Y3FyZUhHYlM4MmhDQkxZRXhYbE9VTXZJ?=
 =?utf-8?B?T2tkZm1PZnpKVGExbE0xZ1ZsNFpYMGVsNU1TUFI2VlAwK0ZTZ2gxb0RLRDk2?=
 =?utf-8?B?SEp3anJxSzd1TG1sR2ZKVzhTRnZjRlNqbWorUGpGdXYvZkdsaENUdit4bFJr?=
 =?utf-8?B?S2UrWjFuMTM0ZEc5VFoyWDU4S291S3pKdzVHMTdMQTNSWld3QVlyTndvSlpI?=
 =?utf-8?B?VEEySmRpZGpoSmZ1NlArUzk1ZUZCVWp5QU5uV25lMzMxdkJhRDNLczNoUGFl?=
 =?utf-8?B?dmpjTDhxVkFOblZhdkVFWHpuRmw0aDZaMjZBTmoxWlFSYzZxQy9YMnZNSXY5?=
 =?utf-8?B?eXZ5QXFxZTMxb2pka1N0YVZXcC9OZjdQUmxEOFdjVjlnOWlsTE56SUVEeTlS?=
 =?utf-8?B?azFWTW5QUmJDNytHYTU3a2xxMlhLZjJTUWJJbzlNU01GbzdIMGRnZW5pZG8z?=
 =?utf-8?B?OEZEeCtLY2lRa3dZN2pLOVZWaGdubVpSbnY2T2UvU2d5OE9uWmVWMXFJV0Vv?=
 =?utf-8?B?K1RnMEh4RzAyMFRaaG83K092QXgxNERiZmgxM2RZQWVSNWFRSFBBeW5SMGdy?=
 =?utf-8?B?VzdudlpJbzI1bFFldnV6Wmk3K3Vpd29PWWp3Z0FnREVyYlZYREdwMDZRVnZS?=
 =?utf-8?B?Z0VHdnl3ekY1ZnEvQm1weHlNcVZZTWM4YlpUMzZFbWRmYXFxUXgyYWFqTzNo?=
 =?utf-8?B?NXZUdjgweHQ3WU5nd3BmWFlBZWZ3cHpnQnRLdXVqc2JvS0FhQ2lsTi9VMStp?=
 =?utf-8?B?SVdxTlNXT1YzNTlkTUNmQ0duZjhqejN5ZFdoMk51elpVTDROa1dFQkRNVjVs?=
 =?utf-8?B?UmpaYnIvZmVkUGU3NTRhdnJkeUNlS3FLUEFlcEJJMnNKQ2lUc3VCL0JvWGxE?=
 =?utf-8?B?VFBPeldTQjZQYWIyTFdvR1JZb1ZnZFZDZ2YvdXF3N1N6aXR5NTdHQ2lSUDRT?=
 =?utf-8?B?cFJtcFlGRVcxS0lHUXFPWUFBQTdreGJ6UTYrdThlT0l6UnpkZVczcyswS2J5?=
 =?utf-8?B?OUtMaTU0ZlJwOGJ3emFYNDF2bGxyRDkyM3hONzhSZVo3a0RyODdXUjg5NWJJ?=
 =?utf-8?B?NWxzamdYZlljbWJCeUV3aW5FMWRpQlo1ckJ1MTk0c2lCalVmdENpQ0dwUnhk?=
 =?utf-8?B?L1N0NHltbU53aW9PUUJGbTUvNDQzRU1oWDNaV2QyamVHSGFpNFE3NkoxZmR4?=
 =?utf-8?B?WHBSRkVaQkIxamFHWXIxVWdOSEtuY0NKeGNaWVFnRGYvZzdUbkJBbndiSm1V?=
 =?utf-8?B?Nm5IZm4vYmRHaDhUUTBuM3RXQkFHc0txdFpiNmNoRWZEbDlYcHA4eG53K0tz?=
 =?utf-8?B?M2svTEsxSG9JMkcxSFhqbU1SSllwVzQzaFZCRncrNlVPb295KzV6OS9aQS9J?=
 =?utf-8?B?aTF4ZEFsMjEzR3N5dm9EQjdZVnRPZGFKdm9LQUNWSlFkKzBEZVl5Wm0xbU5Y?=
 =?utf-8?B?QXpqa3UrVGNPRzFZVXBlcE53RW9acTFvN0VSR2ZlU1J3ZEpVdkZYeXZ4L0Yr?=
 =?utf-8?B?aDIyRy96NW1lYmdjd0pWeGJkTkQxRmhVaWlVTXhNY3FBZnNDSk9qOXlST25D?=
 =?utf-8?B?ZSswTVZHVE85b3VZZVhmbldyOTZTSGRDZlJmb3VJTFJsdThJRi9sVTI3dUoy?=
 =?utf-8?B?WkhValBiVk5Vc2RVeThTOUdaUFZXS1NIRzJZRXlHMlNoMXByTG9qRHJWay9m?=
 =?utf-8?B?Q3dZTWliN29RamZtZzQ1WGdpOVA3WDlkMFc1YXFraWR4VS9vYW9LL0xiWUw5?=
 =?utf-8?B?MmYrWlJzWFE2OFF4RVVOa294L3FBVWNCNkNZclRkbXdHRVBsZkR4aWduUHNm?=
 =?utf-8?B?RmJxME43Z1E4cENZUTFrK01rVmxYQlRINTNxZzlNaFN2dDdEOFV5Y2VLeVhD?=
 =?utf-8?B?Y2VyblBYSmRBTUc0TVViNm9RelpiSG1QOHBrMlc4cEZRcHhaa1RsSzU2Wjkw?=
 =?utf-8?B?eGtJL25qbXREaTgrY29nVkhqMnpxTFVxbHhCYjV1eUNLY3FkQ3dSTDJEZ1Bp?=
 =?utf-8?B?aUU1bm0yTTNWYTBtMWRBa1RuS2RBRUZqTjRzMTNIQ0RLbXRpZnlmcndhWVlM?=
 =?utf-8?B?YnQ4M1VkTndGb2pLam5ySlVTdGVTSlJsS0lEbW5rMTVsNU9rb0lWWUZiaitS?=
 =?utf-8?B?ZmJoZmlhT256eldSWjNjNDVscUdESUpNT2xYK01xMjRKSnovTGhDSlNGRG9p?=
 =?utf-8?B?amc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5943b5-4c21-4bb5-15ba-08dddeea6930
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 06:34:12.4853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qgm8xh5T43/PG3plnRx6Ygoj2MtBP7mi/qxaB1FlgXAhKDAO7W7aOpaSqw75/NZ3bvukvxOXXjQLLfX844F5/UhFEMKDePfOGVYZPi9cGnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7973

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAxOSBBdWd1c3Qg
MjAyNSAwNzowMQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDIvN10gcGh5OiByZW5lc2FzOiBy
Y2FyLWdlbjMtdXNiMjogRml4IGFuIGVycm9yIGhhbmRsaW5nIHBhdGggaW4NCj4gcmNhcl9nZW4z
X3BoeV91c2IyX3Byb2JlKCkNCj4gDQo+IEhpLCBCaWp1LA0KPiANCj4gT24gOC8xOS8yNSAwODo0
OSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgQ2xhdWRpdSwgQ2hyaXN0b3BoZSwNCj4gPg0KPiA+
IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4+IEZyb206IENsYXVkaXUgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4g
U2VudDogMTkgQXVndXN0IDIwMjUgMDY6NDINCj4gPj4gU3ViamVjdDogW1BBVENIIHY1IDIvN10g
cGh5OiByZW5lc2FzOiByY2FyLWdlbjMtdXNiMjogRml4IGFuIGVycm9yDQo+ID4+IGhhbmRsaW5n
IHBhdGggaW4NCj4gPj4gcmNhcl9nZW4zX3BoeV91c2IyX3Byb2JlKCkNCj4gPj4NCj4gPj4gRnJv
bTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4NCj4g
Pj4NCj4gPj4gSWYgYW4gZXJyb3Igb2NjdXJzIGFmdGVyIHRoZSByZXNldF9jb250cm9sX2RlYXNz
ZXJ0KCksDQo+ID4+IHJlc2V0X2NvbnRyb2xfYXNzZXJ0KCkgbXVzdCBiZSBjYWxsZWQsIGFzIGFs
cmVhZHkgZG9uZSBpbiB0aGUgcmVtb3ZlIGZ1bmN0aW9uLg0KPiA+Pg0KPiA+PiBVc2UgZGV2bV9h
ZGRfYWN0aW9uX29yX3Jlc2V0KCkgdG8gYWRkIHRoZSBtaXNzaW5nIGNhbGwgYW5kIHNpbXBsaWZ5
DQo+ID4+IHRoZQ0KPiA+PiAucmVtb3ZlKCkgZnVuY3Rpb24gYWNjb3JkaW5nbHkuDQo+ID4+DQo+
ID4+IEZpeGVzOiA0ZWFlMTYzNzUzNTcgKCJwaHk6IHJlbmVzYXM6IHJjYXItZ2VuMy11c2IyOiBB
ZGQgc3VwcG9ydCB0bw0KPiA+PiBpbml0aWFsaXplIHRoZSBidXMiKQ0KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPg0K
PiA+PiBSZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+PiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4NCj4gPj4gW2NsYXVkaXUuYmV6bmVhOiByZW1vdmVkICJzdHJ1Y3QgcmVzZXRfY29udHJv
bCAqcnN0YyA9IGRhdGE7IiBmcm9tDQo+ID4+IHJjYXJfZ2VuM19yZXNldF9hc3NlcnQoKV0NCj4g
Pj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJl
bmVzYXMuY29tPg0KPiA+PiAtLS0NCj4gPj4NCj4gPj4gQ2hhbmdlcyBpbiB2NToNCj4gPj4gLSBu
b25lDQo+ID4+DQo+ID4+IENoYW5nZXMgaW4gdjQ6DQo+ID4+IC0gbm9uZQ0KPiA+Pg0KPiA+PiBD
aGFuZ2VzIGluIHYzOg0KPiA+PiAtIGNvbGxlY3RlZCB0YWdzDQo+ID4+DQo+ID4+IENoYW5nZXMg
aW4gdjI6DQo+ID4+IC0gbm9uZTsgdGhpcyBwYXRjaCBpcyBuZXc7IHJlLXNwaW5uZWQgdGhlIENo
cmlzdG9waGUncyB3b3JrIGF0DQo+ID4+DQo+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC9UWUNQUjAxTUIxMTMzMjk5MzBCQTVFMjE0OUM5QkUyQTE5ODY2NzJAVA0KPiA+PiBZQ1BSMDFN
QjExMzMyLmpwbnByZDAxLnByb2Qub3V0bG9vDQo+ID4+IGsuY29tLw0KPiA+Pg0KPiA+Pg0KPiA+
PiAgIGRyaXZlcnMvcGh5L3JlbmVzYXMvcGh5LXJjYXItZ2VuMy11c2IyLmMgfCAxMSArKysrKysr
KysrLQ0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2Fy
LWdlbjMtdXNiMi5jDQo+ID4+IGIvZHJpdmVycy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVz
YjIuYw0KPiA+PiBpbmRleCA0N2JlYjk0Y2Q0MjQuLmQ2MWMxNzFkNDU0ZiAxMDA2NDQNCj4gPj4g
LS0tIGEvZHJpdmVycy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVzYjIuYw0KPiA+PiArKysg
Yi9kcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2FyLWdlbjMtdXNiMi5jDQo+ID4+IEBAIC02OTks
NiArNjk5LDExIEBAIHN0YXRpYyBlbnVtIHVzYl9kcl9tb2RlIHJjYXJfZ2VuM19nZXRfZHJfbW9k
ZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQ0KPiA+PiAgIAlyZXR1cm4gY2FuZGlkYXRlOw0KPiA+
PiAgIH0NCj4gPj4NCj4gPj4gK3N0YXRpYyB2b2lkIHJjYXJfZ2VuM19yZXNldF9hc3NlcnQodm9p
ZCAqZGF0YSkgew0KPiA+PiArCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KGRhdGEpOw0KPiA+PiArfQ0K
PiA+PiArDQo+ID4+ICAgc3RhdGljIGludCByY2FyX2dlbjNfcGh5X3VzYjJfaW5pdF9idXMoc3Ry
dWN0IHJjYXJfZ2VuM19jaGFuICpjaGFubmVsKSAgew0KPiA+PiAgIAlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSBjaGFubmVsLT5kZXY7IEBAIC03MTcsNiArNzIyLDExIEBAIHN0YXRpYyBpbnQNCj4gPj4g
cmNhcl9nZW4zX3BoeV91c2IyX2luaXRfYnVzKHN0cnVjdCByY2FyX2dlbjNfY2hhbiAqY2hhbm5l
bCkNCj4gPj4gICAJaWYgKHJldCkNCj4gPj4gICAJCWdvdG8gcnBtX3B1dDsNCj4gPj4NCj4gPj4g
KwlyZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCByY2FyX2dlbjNfcmVzZXRfYXNz
ZXJ0LA0KPiA+PiArCQkJCSAgICAgICBjaGFubmVsLT5yc3RjKTsNCj4gPg0KPiA+IE5vdyAncnN0
YycgY2FuIGJlIHJlbW92ZWQgZnJvbSBzdHJ1Y3QgcmNhcl9nZW4zX2NoYW4gYW5kIHVzZSB0aGUg
bG9jYWwNCj4gPiByc3RjIHBvaW50ZXIgYXMgY29udGV4dCB2YXJpYWJsZSBoZXJlLg0KPiANCj4g
SSBjYW4gZHJvcCBpdCBub3cgYnV0IGl0IHdpbGwgYmUgYWRkZWQgbGF0ZXIgKGFmdGVyIHRoaXMg
c2VyaWVzKSBhbG9uZyB3aXRoIHN1c3BlbmQgdG8gUkFNIHN1cHBvcnQuDQo+IFRoYXQgaXMgdGhl
IHJlYXNvbiBJIHByZWZlcnJlZCB0byBzdGlsbCBrZWVwIGl0Lg0KDQpUaGVyZSBpcyBhIGZpeGVz
IHRhZyB3aGljaCB3aWxsIGJlIHByb3BhZ2F0ZWQgdG8gc3RhYmxlIGtlcm5lbC4gDQpJZiB5b3Ug
ZG9uJ3QgaGF2ZSBhbnkgcGxhbiB0byBzZW5kIG5ldyBzZXJpZXMsIHRoZW4gaXQgaXMgT0sgSSBn
dWVzcz8/DQoNCkNoZWVycywNCkJpanUNCg==

