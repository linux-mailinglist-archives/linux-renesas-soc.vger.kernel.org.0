Return-Path: <linux-renesas-soc+bounces-15189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F66A76836
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 16:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D3B33AC752
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8BE21CA10;
	Mon, 31 Mar 2025 14:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TDcf/m3T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC4021B9CA;
	Mon, 31 Mar 2025 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743431676; cv=fail; b=NrEY+j0H95kZS++7wtroaMmSJF90lOJfaWOGRqc8bmgNyRR8zArDjT2Hlrgc/U20w+Nm6KFqdf33Pf2b61ToyeClqOWHqCcR8eiBNiTfogJHGnYDVnRPrO8JaaP1lU4d16CCan1LbVFRtpEoxtKv0ymKL8SC0kYBqCnu++7deOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743431676; c=relaxed/simple;
	bh=Dyz7k1+A8ZzIeLqRF1tIwSkB6u801YaOBPcXYYJT510=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dVqcInDl7bMR0ucoHJyVAjKNVbqfQ/i+IXM/0UF0mrjOjXxjuBpr+Uyw0Kav7zYlfZG14B5BL0gCv7Hh9Y1jobk8xoBwMdPTpYi6BF/U00Sf5of5aTIgwzzFKyEAsaQJx/PtKA/06w4vcd2kPRTm0xKBoFBt69vdQA5Ey4jpwqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TDcf/m3T; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsQQrEc4mqRfvXj7Q84kLdG5Ck+Ib3VpT7j/DPzvHi7tFoya7Y2mNbeYpe0IvKpLFJszFYNjU5vkBT7ukirOar67BnKxHk9fh6a1/LK8Y9FiQ3SZK8Hs1PzsQaC75O0zXV155D+sQ4j+oKSbd85JLUgJgilVE3mIBeFvHKkYCBOc289vSZvzZB6E+P4VCfNLlz0+z4+QFkd84V0xMEnz0HTHynHN/K9tvn/cV2BZhFi0qxD7ls4bkD4cQ2KkBVKfIcb5Oj2liAK6O5LsMyJmCwQzjZqoFp82bKv5nCs7Ll6eE+aNWoQz0n2hXzzJOfPExafvNUnYWubls70SBR+5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dyz7k1+A8ZzIeLqRF1tIwSkB6u801YaOBPcXYYJT510=;
 b=G6ultC3HKHVYDCMdZpXjSbKzhmd6kTYgBC64ZDONPb21KwDwHeEtbJpTOwvc0/sT+1onaQB+yIjUv6yO7b1WPCFVmwKRwslI5iOGzWtv3AmFDvwl4pjnexusV9O2qX9A1mlJwOimgFPGBqNcisaxhWCpsGVsp/4Su3f4550C4uvgGYn7Jx/S0chHXudYFqos6f6kxvixM/npi7EeSoBsBkvtQ3zU/d4ZeQWtp17/8hU8QTZUo7e1zhU2wzZYFHHIKFeYcAAtkNi6gh/Dn29aPBwSSN+CSEE+8N7ATUR/T+mcExVdr4A87fsCGISQ5mvtfto/95N0+P14JL/arJSvgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dyz7k1+A8ZzIeLqRF1tIwSkB6u801YaOBPcXYYJT510=;
 b=TDcf/m3TIaDewz/ZS8ou+1J80R5zvYwhfxLz8WpjENpUhZlVXzxbjm8KGjnAS0jJGtP8i5rh5GmXDuTH5AXmCMllMUDDoWBk/dil05ybgSxHDkY/3z63UIvfe8hafTh2aSkmIoAvMRd2V5aHy0mO19fsB112bmXw+lmr1BtAHnA=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYRPR01MB13159.jpnprd01.prod.outlook.com (2603:1096:405:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 14:34:28 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8583.028; Mon, 31 Mar 2025
 14:34:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
Thread-Topic: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
Thread-Index: AQHbknnX3xSm7+VbqUS1k2gBBCFIfLONYJ4wgAAIGYCAAAV54A==
Date: Mon, 31 Mar 2025 14:34:28 +0000
Message-ID:
 <TYCPR01MB1133206083EC0249A827261EB86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYRPR01MB13159:EE_
x-ms-office365-filtering-correlation-id: 576ed7e9-24a6-4ad0-57b8-08dd7061248b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VkdZajBrY2syZ1JCQlFyV2dudzdkaWpYSUsxOC9MSVRtNEJSdytwc1NaS0lt?=
 =?utf-8?B?Y2J5eFZJcm9Hbnhxd3hqbUU5dlcyWCtVTUJ4ZXRMY3R6Rjh1b0FOK0cxUUdC?=
 =?utf-8?B?dHluV2JEUkJaZWJqN0NGb2UrY2ZjMEZiMzF6ekFwMXkxQU53cGJkdG44dFV0?=
 =?utf-8?B?TTR6YWZKSHFIVEtMTTU1M1hVZTNoMUMyRlVPVVgvMG5jZjdJSXBKNll1REhl?=
 =?utf-8?B?eitFZkdXS2RhMUxRM21uQXFWcUU2L1NXLy9rVEtDWVhaa1kvVkZEa1dJeXJ4?=
 =?utf-8?B?MEtuN1VZZFBmQ0U1VFl0SHN6ZERWWmpUU3BkTjJOSUZ6WHhwSVdRWms3RUln?=
 =?utf-8?B?cU1DMWlBR2hIc2diVkQyY1REZ3JNL0V4QjR3MGRZZVErdGVKdjdlNVRxRHRE?=
 =?utf-8?B?Q1lTMGdsOHFwZ2dVekFjRCtHZit0Tk0vblRRN1RWVTAyM29VVmw1d0NQb0gw?=
 =?utf-8?B?QjhLQThLZUFLMGFMMHBIWlpKMThqVGtDTVViYXA1L1hMTFlLSllpRVgrb2My?=
 =?utf-8?B?SysxbU9rajRuTE5TeDB0eWU5ekxJRW1PT0NxRVAvczYvY1RLakpKYUN4Wi9L?=
 =?utf-8?B?Q3JnNXUyWEVNYytVVVNuczVkU1hDRnNENE5yN1hGbDBuM1dBS2wyR1BvelhX?=
 =?utf-8?B?VTJONDk3QkVzaGZHUElETlhOaU9ab2xENmRQbUM2WlBTOXUvNEpCdDdxUVFX?=
 =?utf-8?B?QmhVWU5lR3BFQ0NIblRpWjI5VWhnU1NDd3diQ3h4YW5YSXpKUjRlUXNuakYw?=
 =?utf-8?B?WHpOaWdnZlVNN29yZHFLSWZtY3EzdEFuYTdDUndPRG1VL3ZWb3E0K3Rpd3h5?=
 =?utf-8?B?c0RpRGQrcWcyaU1lM0dOdFBKbmNhbjFBdGQ5ejRBMHFjYllMdUlQaGJ2VURw?=
 =?utf-8?B?ODgrSUF3TVR6ai94N053UXZ3akNnVCtkcTc0RVdWVHRFQVAreHk2MGtZVGla?=
 =?utf-8?B?bGVzNkw0SjJyYlZxUFgxVG5DNE9GenNsYm43dkVjanl3UWU5T2gzbUZBa3pF?=
 =?utf-8?B?N05pTzBhL1JsWnVZZ2xWWVRiZnF3ODUzcHdSRTBuZ0NZcWg4U2NRSENJcGpy?=
 =?utf-8?B?ci9kakgrS0o5OGlxc09KU2FLa2RqRlNxSkdzSTJ2YjUvRERTclhpemg1Y2ZY?=
 =?utf-8?B?SGttS1hiL3dueUEzNVJMTjRQUnFDa25tT0dGTk9uQjR0S0s3ZzQ2cGZDZjhv?=
 =?utf-8?B?cUhjblN2NCszd0EwTHpxeUZUYWpDZk9nSFpCS3E4Y0dtdnZNdkgzVkJTWVFl?=
 =?utf-8?B?RFM1Tm9KaDdGbTlvdHZlK1dIRzUwd29RSjI2T1hsZWFJU21NKzlWZ0FTYzJC?=
 =?utf-8?B?MVhMcjZxK1prTFRKN1NoMzllYmxGTlZEbnpjOUlVNHh0b1ZEdEtsWks1d243?=
 =?utf-8?B?dTZ2bUVsZE0xRzNXcnZnV003SWZtN0h4bWFFK3Y0K3BxTE90V1h3VENvMEpi?=
 =?utf-8?B?dTYvTmRXVlBNNE9XVWVUcExncnByQm9CQWJ6T3B0am81bFhHMU03NllOU3pZ?=
 =?utf-8?B?a2sxbTROK1BUQUxOd013QWZMQ2ozMjE1RWxxcFJLdkhpZjAzdjB4NXpHNURG?=
 =?utf-8?B?dnUvK1JTZTFab2NyZm4xcC95bzYzUXcvby83cHp3cFRna0pTTldwaWRaNXdh?=
 =?utf-8?B?RU1WZkloYlpNL09lRTNzTjlOcEVsOGdENUpNT0hvUUNZQk5kcEFwaDhZeEdw?=
 =?utf-8?B?cVVXY1k5NS9QdWxEZ1F1TlRNYWZ4UW90bWUwaHVVQ2ZZUm9FeVFidk45d2Fo?=
 =?utf-8?B?WWU2UlM2RlhzSUZ2ejEyRjRDUHVQdVY3S2c4LzBKR3QvNDFwbk1ha1RpMThi?=
 =?utf-8?B?WXBjV3I1N3VUY0svb2RlaVZVK0Z2UVZBbFU1alcrdzUydEtCQVhCa25Ba2Ir?=
 =?utf-8?B?NUdBbnlzc2ZLZThnTnY2WWcybi9mMGFqaG1EWkRVWlpmbGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cHBtYXQwcnhDN0xlWjVZOVI5d3FJUkhEMUl4WFluM3l2b1grOEJOU1U5TWdk?=
 =?utf-8?B?eUxaOGpLNDJIT0RKQ0N6TGIyMFZBNGZJMldRZXlTZFZwU2tyTWFaMnVvdjNs?=
 =?utf-8?B?aVhWNmt4eWI5SkpmdGdZTnlra2JTczU4SDBrUXM0R0dUL00zTTMyTHo5N3RX?=
 =?utf-8?B?eGUxMU1oT0ZEV25lSlN5Ukg0VU1NUmlhNWJKbjliaHB0Wmx5bFVYcVJabFdt?=
 =?utf-8?B?ZmxCYlNkQ1k3MUNKNWFEME53WGJlV3gramh4alVKMnlFQ1NHVkRGWi9xQXIv?=
 =?utf-8?B?VjJZS2Z6TmxtWlZkN05sK3hXUEdVZitiTkpBNEtBZnJhR3BLVEx0MkdJM3Bl?=
 =?utf-8?B?WTBueXhhV1VsRVIvSjIzQXVVRjhmNG5JM2lWcnRPVDl1dUx6OVpyNXZzam5n?=
 =?utf-8?B?akdKeit2ampHd1h1WEtwdVBvaS9COFBwMU9BaTZ6Q0NQVFZJQTZIYllIbjJL?=
 =?utf-8?B?RzJkRGM5QmFhUTdUV3daNzJLVklNYnBWcjE5d3FRS21rSEtCbTFrV3FrNHRQ?=
 =?utf-8?B?QWkxbmNaRjlwTjdoNVBkN3puWDdlL0pJZWYzN1JDMDlxSG5WVTNTY3RhSnZx?=
 =?utf-8?B?MEdHeVQrS1NDYzFSbU8wZzFhd1JuN2RBeEVxQmpKQWM2YUd2aU9IeURWc09q?=
 =?utf-8?B?Uk1RSHVsWTVWUHhKd2JzbERRdXNwZTljMTluakUrRG41TkllVXM0SGpTeFZo?=
 =?utf-8?B?Y2dZekFmR3h2RjkzMk5TT0Jna1kwMFRZVGdSUWxHeGI3Y2w1TUxsRjZUcHdT?=
 =?utf-8?B?d3Bhb3BVMFN0NDd4cWJpYUtTeVBKdmt0N2ZWU3RBc1pLTks5UWU4M2l3VXJv?=
 =?utf-8?B?bFhDL0Z3dGFwZ3ltbEVjMjJNZEd0N2RoUW52ZmMrNzA5SUsrZTJTZHk1T0Rh?=
 =?utf-8?B?emxSbmRwNXVJLy9qQlR3OXppSkNsME9Lc1F0VWJZOEtNZThlSmozVVgvQXgx?=
 =?utf-8?B?c0dlRDBFOWc2WWpzeGdyTXZmendBOUlSV1pZcXVDcTFkRGY5S040VjBlVklV?=
 =?utf-8?B?Nm4yWVNGMi9oUXpuZzJYV0k5Mk1lYTlXSjhrNXorcUt1cWx5bW9KZE40M296?=
 =?utf-8?B?ZnNtMnVzZ24zU1RBT25VV0Z6Qzd3dUdaUVRndVR3Wi9xd1ZzMHZVNVRvVld4?=
 =?utf-8?B?dkxibVNRV1RpeU9PTXk3Qm9WdGhWdm4wTVYwT05obHhleTJ4dEZoUVRPMzdt?=
 =?utf-8?B?alZTUituSjRZeFQ3L2Fra3c5bDY2UjI3OEdKVTRxQVhUaWJnTXVqTTJMMWRN?=
 =?utf-8?B?LzJET0FCN0NQZ1ljYkZBbXFpS3dEU1ltQzFIckg3ZkwwZ2JJbDNsOXorRTQx?=
 =?utf-8?B?UlBwUm41TFlUNGQ2WGtKTTkrWmYrS1djOEV4Z3dsb3NSVVk1bFVFb0NaMndl?=
 =?utf-8?B?dGdCMGMvdC9pZC9vK2dtV2Y1OEhBOTViMDEyclpxSE9pQnV0eVNydThZRGZC?=
 =?utf-8?B?bXJBVFFybFZNU1kvMmJoUGMrY2xpRkhUUU9aUk1hVDFIQ3BtZEt2Tjh5clNq?=
 =?utf-8?B?NGhJaWxwUEZvMk45Yjl2MGJNdDBwQzg0MVQ5K0RkWWRTQU44U1dablZEbnJw?=
 =?utf-8?B?ZkJrdEJvOWI4bUJIM2Jsc2QySmdZcWVNQUNMemxvU3dkMkRTVFl1NlBkQzZn?=
 =?utf-8?B?ZDZCaVh5eVl2c3BNTWFvQ0oyVjA1dWpmc002UmlyUmdCVjNrWmIrVGJacElF?=
 =?utf-8?B?Tys5ckZWZTEwZU4reHEvMTJRNXBjSExCZzZwbURPM2NyMG4xWHp6R1NZQjl6?=
 =?utf-8?B?M0hRSk5NZHJyV2VjdGV1RmJQeWFjVmx3VmhucVYwM05ScWJqNXVmeTkrK2dL?=
 =?utf-8?B?TjZ2M1dBQzAyUmtRUW9haTg2TmdQNEo0UFF6V1JieEV0T2UwMzN5akRheWlK?=
 =?utf-8?B?NnZxMkFpekMyOEtDZTFQV0ExZzdWbWw2eUhZTGVzLzBHSG9QSWNFMFpSQVFO?=
 =?utf-8?B?UEsvN01tdzVoWlVlWkprblB1bWhsUEdDV2xVVG9nUXIrUDd6bUJoUmd5UENX?=
 =?utf-8?B?OEp0SjdkSlhhNWhFL2xGWDVxVzlVN0Q1eElKOUpMM1VldHNLNXVuK0lrdmU5?=
 =?utf-8?B?eXVoUjN6RUtFU1VKdnBxcWo1ZUdYVFpxcWtSZW43NHhlWTlkbUZ6R21wbFls?=
 =?utf-8?B?dTVlMVVxbC9WTE96bGNaU2EvM0lNY3huQW5idzAzWHh0MGpSaUdMQkFKUmIx?=
 =?utf-8?B?dlE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576ed7e9-24a6-4ad0-57b8-08dd7061248b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 14:34:28.3561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ygo27Aq5hsn0SPrMH4NaIXYq5FyS34estNUiz7RyTVc7FdjXJfiLt0j8ydOXjjhvIgISSVA6lilpiwPglt5reRReY6inRa+4Tc7dL+Z7Rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13159

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMzEgTWFyY2ggMjAy
NSAxNToxMg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvOV0gZHQtYmluZGluZ3M6IG1lbW9y
eTogRG9jdW1lbnQgUlovRzNFIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24s
IDMxIE1hciAyMDI1IGF0IDE1OjU0LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+IHdyb3RlOg0KPiA+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPiBEb2N1bWVudCBzdXBwb3J0IGZvciB0aGUNCj4gPiA+IEV4cGFuZGVkIFNlcmlhbCBQZXJp
cGhlcmFsIEludGVyZmFjZSAoeFNQSSkgQ29udHJvbGxlciBpbiB0aGUNCj4gPiA+IFJlbmVzYXMg
UlovRzNFDQo+ID4gPiAoUjlBMDlHMDQ3KSBTb0MuDQo+ID4gPg0KPiA+ID4gUmV2aWV3ZWQtYnk6
IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+ID4gLS0tIC9k
ZXYvbnVsbA0KPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
bW9yeS1jb250cm9sbGVycy9yZW5lc2FzLHINCj4gPiA+ICsrKyB6ZzNlDQo+ID4gPiArKysgLXhz
cGkueWFtbA0KPiANCj4gPiA+ICsgICAgc3BpQDExMDMwMDAwIHsNCj4gPiA+ICsgICAgICAgIGNv
bXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOWcwNDcteHNwaSI7DQo+ID4gPiArICAgICAgICByZWcg
PSA8MHgxMTAzMDAwMCAweDEwMDAwPiwgPDB4MjAwMDAwMDAgMHgxMDAwMDAwMD47DQo+ID4gPiAr
ICAgICAgICByZWctbmFtZXMgPSAicmVncyIsICJkaXJtYXAiOw0KPiA+ID4gKyAgICAgICAgaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDIyOCBJUlFfVFlQRV9FREdFX1JJU0lORz4sDQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMjI5IElSUV9UWVBFX0VER0VfUklTSU5HPjsNCj4g
PiA+ICsgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJwdWxzZSIsICJlcnJfcHVsc2UiOw0KPiA+
ID4gKyAgICAgICAgY2xvY2tzID0gPCZjcGcgQ1BHX01PRCAweDlmPiwgPCZjcGcgQ1BHX01PRCAw
eGEwPiwNCj4gPiA+ICsgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMHhhMT4sIDwmY3Bn
IENQR19NT0QgMHhhMT47DQo+ID4NCj4gPiBPbiB0aGUgbmV4dCB2ZXJzaW9uIEkgYW0gZ29pbmcg
dG8gdXBkYXRlIHNwaXgyIGNsayBhcyA8JmNwZyBDUEdfQ09SRQ0KPiA+IFI5QTA5RzA0N19TUElf
Q0xLX1NQSVgyPg0KPiANCj4gV2hhdCdzIHNwaXgyIGNsaz8gQWgsIHJlLWFkZGluZyBkcm9wcGVk
IGxpbmU6DQo+IA0KPiA+ID4gKyAgICAgICAgY2xvY2stbmFtZXMgPSAiYWhiIiwgImF4aSIsICJz
cGkiLCAic3BpeDIiOw0KPiANCj4gPiBCYXNlZCBvbiBbMV0sIHRoZSBjbGsgc3BlY2lmaWVyIGNh
bm5vdCBkaXN0aW5ndWlzaCBiZXR3ZWVuIHNwaSBhbmQNCj4gPiBzcGl4MiBjbGssIGFzIGVudHJp
ZXMgYXJlIHNhbWUoZ2F0aW5nIGJpdHMpLiBTbywgdHJlYXRpbmcNCj4gPiBzcGl4MiBhcyBjb3Jl
IGNsb2NrIHRvIGRpc3Rpbmd1aXNoIHRoZW0uDQo+ID4NCj4gPiBQbGVhc2UgbGV0IG1lIGtub3cg
aWYgdGhlcmUgYXJlIGFueSBpc3N1ZXMgaW4gdGhpcyBhcHByb2FjaD8NCj4gDQo+IEFzIHlvdSB3
cm90ZSBpbiBbMl0sIHlvdSBoYXZlIHRvIGNoZWNrIHRoZSB0d28gbW9uaXRvciByZWdpc3RlciBi
aXRzIHRvZ2V0aGVyLiBIb3cgZG8geW91IHBsYW4gdG8NCj4gaGFuZGxlIHRoYXQgcmVxdWlyZW1l
bnQ/DQoNCkFzIHBlciBoYXJkd2FyZSB0ZWFtLCBzcGl4MiBjbG9jayBpcyB0d2ljZSB0aGUgZnJl
cXVlbmN5IG9mIHRoZSBzcGkgY2xvY2ssIGFuZCB0aGUgY2xvY2sgT04vT0ZGIHBlcmlvZA0KZGlz
cGxheWVkIGZvciBlYWNoIGJpdCBpbiB0aGUgbW9uaXRvciByZWdpc3RlciB2YXJpZXMgc2xpZ2h0
bHkgZHVlIHRvIHRoZSBkaWZmZXJlbmNlIGluIGZyZXF1ZW5jeS4gDQoNClNvLCBpZiBJIG1vbml0
b3IgdGhlIGJpdCBvZiBzbG93ZXN0IGNsb2NrKHNwaSkgdGhhdCB3aWxsIGNvbmZpcm0gYm90aCBy
aWdodD8NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC9UWTNQUjAxTUIxMTM0NkIzQjZDRkYxMzU5NDExQjQ3NUEzODZBNjJAVFkN
Cj4gPiAzUFIwMU1CMTEzNDYuanBucHJkMDEucHJvZC5vdXRsb29rLmNvbS8NCj4gDQo+IFsyXQ0K
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvVFkzUFIwMU1CMTEzNDZEMjg4MUE4Q0M5QzMw
MTlDOTc4Mzg2RDIyQFRZM1BSMDFNQjExMzQ2LmpwbnByZDAxLnByb2Qub3V0bG8NCj4gb2suY29t
DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9m
IExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8NCj4gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

