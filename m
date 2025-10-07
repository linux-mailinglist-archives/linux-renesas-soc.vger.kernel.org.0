Return-Path: <linux-renesas-soc+bounces-22759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C854BC1E45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 17:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E77219A49AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 15:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376B72E36FD;
	Tue,  7 Oct 2025 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TzxcCpCN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233FB19E7F7;
	Tue,  7 Oct 2025 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850427; cv=fail; b=GfKeySZIww4+24ZdqrFSdO2O3lBqKCVYXfIbkjuJSZS85iP/a+xP4VWfR9j0Ja1aG0LFw0CYOc15qcQjo8tkE2g9FwUXpy9WnRWx0VCDhG3X1aGBkpRkhB5k8SsbT9IJn1nSGW4tQnvasyFFZg1EevjuKwIQjdaezRveP+IsTtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850427; c=relaxed/simple;
	bh=GJzA26d3TB+fcmbC+HeyB6pP24b1pqbi8abMObcE/d4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mA7Zlgith9nfAdiZVvfeAPv22AH8PeqwLD/1ypOtMpe8v0mRA73ilqwSjJiFCajfzP93PcyvK9/uTN4Veun1HirZoPgrSViBdb4ZgHwb+CO9CGb4ENh9YF3Tsexlyz/3M55L/NCPVH67UGS5DXqrip3ZI33Dr2BR6SlSRiICIMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TzxcCpCN; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3IHsl8i24j1N1zsPP2T4u3AXBfGYY9YzNhxSs8fPqzc2QUeLoPywGeIZ8Xm6fs6BiUtbqs4VYCGhi3UqAmlk9nKrvXIp+CGZwrTixgeBjZBHEWuV2QfU0RQy2OiKKBvK0Vv/h9i+U5DAZCySfIpHKQq8Lw54qpfxQuTOTySaiB+K6rIotfpTLSz+pqGnpkJpOzz9pZ3ox7gx7aGBEx0FJWq8Pw+B30ZP3e+NZYYmTIv7BIXs8JwAdu9apTuDaIoQgigCZnQycVdoeXyfhDgGqS2RrhYyasyvQHFCkQAyCUUZXrRmG0g8Nk1eJEl01ADv1w15jF/wNmPIFnaOsnkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJzA26d3TB+fcmbC+HeyB6pP24b1pqbi8abMObcE/d4=;
 b=hPmtaxxgu8Jue6dY7pr2jm1dUJdA0CW4sdrULPw+yQTPLDdZkw5d6ioEBTRMQQX3LE0JVQBuE3zqzpqld80fuG2q6lhfk/C5WQbsUHKbRqodnBCGc3BLPK7BqCn47hkT3wP9GpsqA+zdX9biWJ1yMitk9f0iUc0wWQPl9P/AkGk9L/OkjD8fK5wTEXTCt40A+LTQZtc7gbHaxTeQchhNZirppszRj9KUjRr3dAIr/Bzdu12k/u7GPAji/GRMajCnPz5b84NEgOOzKkf8WpJF+pepr6kCea5n8Uccg9Py/4qip8Utw0sZL1AVhBaf5XJHC55+oZ9sYoxhUgYTFg10AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJzA26d3TB+fcmbC+HeyB6pP24b1pqbi8abMObcE/d4=;
 b=TzxcCpCN7tQz5/7n2zPl4MqCGDwFfGBhWktQOvTk8kg1Cl9wsIFHx3wqdVwXZpFutnl9gzRYzrK4Zpv48hMZsVvqs4JpxFrue2GRcQlIK4I+gOeSWx0QCANxI4QetKPmpyjZoXUY8lGUfF4h4LK/UWWj3skaDPuySgqqKZG3OZo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13952.jpnprd01.prod.outlook.com (2603:1096:405:210::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 15:20:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9203.007; Tue, 7 Oct 2025
 15:20:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai <tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul
	<vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 04/18] reset: rzv2h-usb2phy: Set VBENCTL register for OTG
 mode
Thread-Topic: [PATCH 04/18] reset: rzv2h-usb2phy: Set VBENCTL register for OTG
 mode
Thread-Index: AQHcNt66G8TP9Ee94kC0LXwMMOw9YrS2DljwgABhwgCAAAaEkIAARKAAgAAQ5kA=
Date: Tue, 7 Oct 2025 15:20:19 +0000
Message-ID:
 <TY3PR01MB1134612B0952B267BE89E686F86E0A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
			 <20251001212709.579080-5-tommaso.merciai.xr@bp.renesas.com>
		 <593eb851ae6ce0ec03ddeacf436180b6538fdd1e.camel@pengutronix.de>
		 <TY3PR01MB1134635745721CC005B35702286E0A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
	 <01fc3101ab2e3898932afeaaaf060a6676cdf323.camel@pengutronix.de>
	 <TY3PR01MB1134623A14F4F313986F631ED86E0A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <988658d3485232a0bb6c433b6533ebf0ae41226a.camel@pengutronix.de>
In-Reply-To: <988658d3485232a0bb6c433b6533ebf0ae41226a.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13952:EE_
x-ms-office365-filtering-correlation-id: e411f5b1-6dfe-41d9-b913-08de05b506ed
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZmR5QVMySUdzQVpteXVZM1doY3NSd0E2MnhtY1djaFlhNm01bzZQQWVlbWNy?=
 =?utf-8?B?Y091cWdSSVRyN0VCbFlwZjVZeEFQYThPK3dGQzFnV2N2YWlSOEJmODhQWEc0?=
 =?utf-8?B?eEtsVzg2c3h0SGZBMkgyb2kwTFV1aVBpOFpHKzl1bHR3c0pXQ0Vta1VTdk9V?=
 =?utf-8?B?OUxtV2oyOTJhTkJrelQ2bHNLVkhuYTc5WnpDOWhhT2JRWDg0ckhWWkJ4ckUy?=
 =?utf-8?B?OUdHLzBxQ09TQy9pTmNSTllKTGM3VnFFY1dVaW5IaXpGcDl1dUxsMU5vdGtY?=
 =?utf-8?B?TmphMHlGYmdSei96OGd3SjBOeWtaZGRwSjE5c0NmS1JPc0h3TVoyNlhYbERD?=
 =?utf-8?B?ZFVieEl0N2l3SUpRd3ZDeDJSZC9FYklxWXlITElCVWczMWZTUDZ2Q1VuZ0tS?=
 =?utf-8?B?UHpKS1pwUGVQTmJCYlN3RThOUVhmbndLYXNXVVh6SUl5TDZFdHJZU3Nlam4x?=
 =?utf-8?B?a1lncDhvajcwVHJRMWVENVdSR3M1cHBBU2RBOUp4QUtCODRwZmVDMzVHQkUv?=
 =?utf-8?B?c0lEdVR5YStKT1ZQbXE3OEliRXFlN3pEUUtqYW1XUDNmempHRFd1SFpFR0pw?=
 =?utf-8?B?dXVxS05jbXRDQ250Yk5LaDluYmtxbTNpd1BrdDNiNTdma0s0Um4zOHRYL1Zh?=
 =?utf-8?B?c1B1S05EOHdsOHVQZEdqRktlWW5MMHlIa05wNDVYT3NjdC93VS9XRnQ2a1kr?=
 =?utf-8?B?TVFpajN5RVZTQ3NjdEhJK0xpYkpZaFFUNytrQVBmL3gyM0hUVWZ4Tjh2YTRI?=
 =?utf-8?B?QXhrZkRJK3B4aWdjTERKR25oeUo2MVRFYlNEUlNYUHNjMURxNjd3SHZFU3ZI?=
 =?utf-8?B?Nlh0RE9taEh0aVlyWDczL1lTQzRqZjFFcTVVanhJMC9hRGNHYUwveWVQNk5R?=
 =?utf-8?B?dVdVcnRuVkJ1eVd3Q1duajNNQ2x1Q1dUaXpvRXdxQ1A0YmdWM3d1S01Ob0sw?=
 =?utf-8?B?SkFLaUVtZytrT0I0RlkwRFVURHhVUjYrZEhBUmZ6M25EdC9EcmJmaWN1TzlI?=
 =?utf-8?B?M201MGhORzA4SnpNcHlMbjBrZC9UNDNkdEZSZGtNcEFIaXYzSWplNXNFbmJC?=
 =?utf-8?B?SDFPeXhEazE1TkVIRHdsbTdZb1FNUndTUUN1WXUrYXplZ1gvN1JQQWlDclM2?=
 =?utf-8?B?eDY4L0duaks0TnlVMmdmQjVOZ2dzUWwzWjYrSUxFblRqNGNCQUlNeldWREFi?=
 =?utf-8?B?Qm42d2N2aGtIVnQ0MUF5UWJ0dHlLRVpOcXhmREZhbFVXREI0em5Vc0NzK0tu?=
 =?utf-8?B?ZllmMFBxMDRsMjN0RC9FWWJQNnZnczFyUXE4SXBteTgvVllacU4wODZ3TjBy?=
 =?utf-8?B?RjRteEpVVTl3MUNIaDlyaEJyZFVTVTEweGppeVEvQ1dMRHJ6Y2grQXBRb1lM?=
 =?utf-8?B?cXlZMk45N2NVL1FDc0dzZC8rbzFEanNTM2RHaUxlRU5zTmRjMjJWaDVYODM2?=
 =?utf-8?B?dFg5dDg4VVBNeWxKTWs2NlNkcFRDRzZHTEVCbzFvZXRaVGRwTEtHREZFMWxP?=
 =?utf-8?B?YkR5WGpKUXpIRk9ISDNDcGZRV3ZiNjQwbnU1UE1WLzh6UHJ2ODkrTUQ1cVFt?=
 =?utf-8?B?dS9POWdnRGNkbWFxMDl6UmthcHY0cEE0SGFjYjVDMWE2VVhDWFc0SmE5N0lq?=
 =?utf-8?B?NWE0cGs4QTBkQ0M4UXpoVnZpakJkM1JGRVd0RVFjOFg5YWl2NEE3aGFCTWY4?=
 =?utf-8?B?cVJBd1YzTi9BVG9INTROSWY3WlkvaVlaTk1BenMyUyszYXhGMW51azBwNWps?=
 =?utf-8?B?U1FLckZodXRXeU9MdWNHb2lwdHFLY29GQ0thUTBaM0x6c3NLR2djOVh3TFRs?=
 =?utf-8?B?SkRoYmtER3Q5Q202OFF3VkNiYkNtVVBMS1ZuamlBY2ZsSDZ4Q1lMYkZCeWo3?=
 =?utf-8?B?dk5OV0pQSTdHaEdpSVdyZCtsK0ZaVWVLN0pGQ01WTmlZZ0MzVUpuaW1wdm1h?=
 =?utf-8?B?WFFmRENEdWxpOXZGOVR3cHFaRDJoSlBHQkZMYWI3NlVGY0F4T3NnTTBTN0tD?=
 =?utf-8?B?UVArQllrWVo2OFlvSE1KdFN0aE8vamY0SHFKK0JKK2I4WFNiYUFQYTdrUDE0?=
 =?utf-8?Q?+Hjrdw?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEoyU2ZBZEZuUWwzMlF2bWhMVHJ5aXEyeE5XTzZzd0NpN2E5ZnZFZWdsV1Nw?=
 =?utf-8?B?eFRwU3FnWFJLcFNqTzJOM25pcGk1cE5jc0VBS3RIbUZ0aDFpMlVPOWlRTS9a?=
 =?utf-8?B?d3RIWE52SEpVR0pISGI5SU5EMXVRelVtdWR0dHo0NHpNUTBsTldIMktYQ0Vi?=
 =?utf-8?B?NVBJZC9YSWMzeTdiSEFPcW5kb3BrREoyNGpLSm1GL1hyY3ljQ1IvRHd1T1Fs?=
 =?utf-8?B?NERSV1Y5R1NxdE0yWGJjN3JVekVhUG5oM2krZXJhVGZiTDhDTGRGdlBxUkNZ?=
 =?utf-8?B?emRPd1dOUWhhYk9BcTFvMDFUakZlcytDTTcrUTRUNGZRY3g4NFZnYVQxWFNr?=
 =?utf-8?B?K25mTWJqbUZBMkU3R3ZMM2JrYVRXTnpyZ2lZL1ZUNTlKWjc0dmxRUHYxNG83?=
 =?utf-8?B?bUphNGVIK0RacVZUQkV1NDdtVE9oUUcvWmt0d1RPSFFWWnBGakFwdy85Tjg5?=
 =?utf-8?B?MFp2NXprbFJSdlFtTDdtOHNIZ1lQYUo5QUZOWmlsZWJIZE1pZnB0RnNIQmJP?=
 =?utf-8?B?UHIwTzEyU1g5bUpneExHVXBaLzlTVW1OR2R2eW9ES0YrSjg5SkpNdkZpbmZK?=
 =?utf-8?B?U1hoTE54VjFkc0lpNTA1d1AwLzJxVnYzZUFaZ1N4RkpaZk1lRmM0WkJTc0FU?=
 =?utf-8?B?STVvN3RweWhEQUxWSDdDTkMxa2FreFRrRnVmT1V2aWs1MHBqcGZvUnltMTY4?=
 =?utf-8?B?Wkl2Q0JLa3k2VnpRTldhVyt3MDdiYU1nc0cvb1BFMUZyeXBmTURZdlljaWgr?=
 =?utf-8?B?UlY3V1hJTnF0S3ZHQ0VDRElxOWs3a2VKY0IxQkhSQTg5OVAvZkxFc0lLUEdY?=
 =?utf-8?B?RHNZZTVrL0xQUCtDVzRhTzgwaXVCTjdZcCt2VmxBN1pNL0ZNYkNCemdMeFB0?=
 =?utf-8?B?ZGNIb0FUeUwrNE9WUmJvdVpuRnoyNUkwMXNvNHJsaE5BVFdUL3kvOW9FYzYr?=
 =?utf-8?B?a2QwSitremtJWTJ0N1VZVEh4bDhhSmdTQkMxZ01rdE4vdlNOdWR0Mmt0WGxr?=
 =?utf-8?B?YmJEYzJMTkpxbjZqdHUvc0UzTUFSaUJPT3NWbW5wQzJWVnJEZldmdUJkbXRE?=
 =?utf-8?B?WTJGMFMzVmZZQm1zTFB0Mll4eTNOZkpPejIvS1A2VEtQZGowVTZGeXhNN0c5?=
 =?utf-8?B?OFUzeEZaNTJlRVZITk9SR3hXQXJtZUpuUWRXejJka3JGNCttS1hqSGN2aGdB?=
 =?utf-8?B?c0c0Slh5Uk9YQkt5aktCdVRwOFRaQThEdVMyb2RlbGZCQkNDblJDeEwvcHJi?=
 =?utf-8?B?RWZSQU1MaEV4MVNRVkhtZWQ5L2FDNmVQUVdrOEpRNVpwMGcySDgwWCsvQ2ha?=
 =?utf-8?B?Mnk2dVF6eDJ3YkY0aDgvOVR5S296dHpMMHVXa0V3WUNIUUZxN1VpeDVHM1dT?=
 =?utf-8?B?LzR4VksxbFZvbGk3OElqRmNtaWZ0SmZEbDAvL21ibG5Zd2xmMktkWEtOZ3Z2?=
 =?utf-8?B?UFNZZmVUOUJ6Sjg4TUhuY3hzN3ZvOWpHSi9yaG1zZURiekZlUHE4bUIwcGc4?=
 =?utf-8?B?YnJxMnRid25lYkZWeHZDMm5zeEg0NFowU25kN2tHZXhKNGJzUnZmaS9ML3Bk?=
 =?utf-8?B?aDNRR25Ua2g3YVdQdzREbER1bmNvMzRlamdSZmJPdWFuYjk5aHN6R3FVZ1VT?=
 =?utf-8?B?YXp1eUpiY1BkOG1TaEQ1bzlvMWp4Um5rYmdZTHZod3JOVWxVQUJOVFdaVVdB?=
 =?utf-8?B?WklYSnVPbkI5R2ZWQ1h2eWJlSmM3dGRaazBKRXRnQng1U3pjUGY3aEkvbXF3?=
 =?utf-8?B?TTFHU2xoYmZqN3kySEFJNWZGVm95OGFrTStoYzF5dnNlV0JwUERXV0o2NXRU?=
 =?utf-8?B?VTRZcVZMbE5NeEN1NWpZamVrdkwzci9VazdZMFpnNXpuRzB3RjFOMGhjTjNs?=
 =?utf-8?B?RWJxeUsrNGY3WVZrVXpVTmFqeVFMMzRKNVptREpxMTZsaTJEaUVlUEpFUnNL?=
 =?utf-8?B?Z0xsMEFoM0NDNlNROFNDd0VQS3NXdlJmaVlRV0dSQVN4QU5VVGw3V3hLMzIv?=
 =?utf-8?B?OUg5YTl0S2g0QXlLQjU3M3FldHgyS0FwSmlnY2w0QmQzMkZzWW11Y1Z2Y2tu?=
 =?utf-8?B?d0w3WTZ2NnF6VWcxRjcrUWxaNG1BTVRBZjVOMnhqcUpZRTMxVnBiVTVTQ0pz?=
 =?utf-8?Q?jqFaZTDAFANFVAU3bY2vFVesa?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e411f5b1-6dfe-41d9-b913-08de05b506ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 15:20:19.6230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JvQPB4gdT4MVsRg6kUyT3f8vLdGbEA3j65DaSIN9Y/3Zqf5GUSjvf0TD5lbQUBGizB9JDVofzwHILdS5ogvmQFU/yE75JCkUSTtnTf4tb24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13952

SGkgUGhpbGlwcCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiAwNyBPY3RvYmVyIDIw
MjUgMTU6MTMNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwNC8xOF0gcmVzZXQ6IHJ6djJoLXVzYjJw
aHk6IFNldCBWQkVOQ1RMIHJlZ2lzdGVyIGZvciBPVEcgbW9kZQ0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IE9uIERpLCAyMDI1LTEwLTA3IGF0IDExOjA0ICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4g
PiBIaSBQaGlsaXBwLA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
ID4gRnJvbTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4NCj4gPiA+IFNl
bnQ6IDA3IE9jdG9iZXIgMjAyNSAxMDo0NA0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwNC8x
OF0gcmVzZXQ6IHJ6djJoLXVzYjJwaHk6IFNldCBWQkVOQ1RMDQo+ID4gPiByZWdpc3RlciBmb3Ig
T1RHIG1vZGUNCj4gPiA+DQo+ID4gPiBIaSBCaWp1LA0KPiA+ID4NCj4gPiA+IE9uIERpLCAyMDI1
LTEwLTA3IGF0IDA0OjAyICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+ID4gSGkgUGhpbGlw
cCwNCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4gPiA+DQo+
ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gPiBGcm9tOiBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+ID4gPiA+IFNlbnQ6IDA2IE9j
dG9iZXIgMjAyNSAxNzozMg0KPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDQvMThdIHJl
c2V0OiByenYyaC11c2IycGh5OiBTZXQgVkJFTkNUTA0KPiA+ID4gPiA+IHJlZ2lzdGVyIGZvciBP
VEcgbW9kZQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gTWksIDIwMjUtMTAtMDEgYXQgMjM6MjYg
KzAyMDAsIFRvbW1hc28gTWVyY2lhaSB3cm90ZToNCj4gPiA+ID4gPiA+IEFkZCBsb2dpYyB0byBz
ZXQgdGhlIFZCRU5DVEwgcmVnaXN0ZXIgd2hlbiB0aGUgVVNCIGNvbnRyb2xsZXINCj4gPiA+ID4g
PiA+IG9wZXJhdGVzIGluIE9URyBtb2RlLiBUaGlzIGlzIHJlcXVpcmVkIHRvIGVuc3VyZSBwcm9w
ZXIgVVNCDQo+ID4gPiA+ID4gPiB0cmFuc2NlaXZlciBiZWhhdmlvciB3aGVuIHRoZSBkZXZpY2Ug
aXMgY29uZmlndXJlZCBhcyBPVEcuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogVG9tbWFzbyBNZXJjaWFpDQo+ID4gPiA+ID4gPiA8dG9tbWFzby5tZXJjaWFpLnhyQGJw
LnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSBoYWQgcmVzZXJ2YXRpb25zIGFi
b3V0IHRoaXMgZHJpdmVyIGJlZm9yZSwgYmVjYXVzZSBvZiB0aGUNCj4gPiA+ID4gPiBvcGFxdWUg
cmVnaXN0ZXIgaW5pdGlhbGl6YXRpb24gc2VxdWVuY2UsIGFuZCBJIHdhcyB0b2xkIHRoYXQgbm8s
IHRoaXMgaXMgYSByZXNldCBkcml2ZXINCj4gYWxyaWdodCBbMV0uDQo+ID4gPiA+DQo+ID4gPiA+
IFRoZSBsYXRlc3QgaGFyZHdhcmUgbWFudWFsIGRvY3VtZW50IGFib3V0IFZCRU5DVFJMIHJlZ2lz
dGVyIHdoaWNoIHNldHMgc291cmNlIGZvciBWQlVTDQo+IHNlbGVjdGlvbi4NCj4gPiA+ID4gcw0K
PiA+ID4NCj4gPiA+IEkgc3RpbGwgY2FuJ3QgbG9vayBhdCB0aGlzLCByaWdodD8gVGhlIFVTQjJQ
SFkgY29udHJvbCByZWdpc3RlciBzcGFjZSBhcHBlYXJzIHRvIGJlIGRvY3VtZW50ZWQgaW4NCj4g
PiA+IHRoZSAiUlovVjJIIEdyb3VwIFVzZXIncyBNYW51YWw6IEhhcmR3YXJlIChBZGRpdGlvbmFs
IGRvY3VtZW50KSIgKHVuZGVyIE5EQSkuDQo+ID4NCj4gPiBJdCBpcyBkb2N1bWVudGVkIGhlcmVb
MV0sIFBhZ2UgMjE3NywgVVNCMlBIWSBDb250cm9sIFJlZ2lzdGVyDQo+ID4gKFVTQjJtX1BIWV9W
QkVOQ1RMKQ0KPiA+DQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly93d3cucmVuZXNhcy5jb20vZW4vZG9j
dW1lbnQvbWFoL3J6ZzNlLWdyb3VwLXVzZXJzLW1hbnVhbC1oYXJkdw0KPiA+IGFyZT9yPTI1NTc0
NDkzDQo+IA0KPiBGb3IgbWUsIHRoYXQgbGluayBwb2ludHMgdG8gYSBkb2N1bWVudCB3aXRob3V0
IHRoZSBVU0IybV9QSFlfKiByZWdpc3RlciBkZWZpbml0aW9ucy4gUGFnZSAyMTc3IGlzDQo+IHVu
cmVsYXRlZCAoZG9jdW1lbnRpbmcgUENJX0VQX0hMT0cyX0ZuLCBzb21ld2hlcmUgaW4gdGhlIFBD
SWUgaW50ZXJmYWNlIGNoYXB0ZXIpLg0KDQpNeSBCYWQuIEkgcmVjaGVja2VkIHRoZSBsaW5rIGFu
ZCBjb25maXJtIHdoYXQgeW91IHNhaWQgaXMgY29ycmVjdC4NCkkgYW0gdXNpbmcgTkRBIGRvY3Vt
ZW50Lg0KDQo+IA0KPiA+ID4gPiA+IENhbiB5b3UgcGxlYXNlIHRyeSB0byBmaW5kIGEgcHJvcGVy
IGFic3RyYWN0aW9uIGZvciB0aGlzLA0KPiA+ID4gPiA+IGJlY2F1c2UgZHJpdmVycy9yZXNldCBp
cyBub3QgdGhlIGNvcnJlY3QgcGxhY2UgZm9yIFVTQiBPVEcgbW9kZSBoYW5kbGluZy4NCj4gPiA+
ID4NCj4gPiA+ID4gU29ycnkgZm9yIHRoZSBjb25mdXNpb24uIFRoaXMgZHJpdmVyIGlzIG5vdCBo
YW5kbGluZyBVU0IgT1RHIG1vZGUuDQo+ID4gPiA+IEl0IGp1c3QgY29uZmlndXJlcyBWQkVOQ1RS
TChvbmUgdGltZSBzZXR0aW5nKSB0aGF0IHNlbGVjdHMgdGhlDQo+ID4gPiA+IHNvdXJjZSBmb3Ig
VkJVU19TRUwuIEFjdHVhbCBVU0IgT1RHIG1vZGUgaGFuZGxpbmcgaXMgZG9uZSBVU0IgUEhZDQo+
ID4gPiA+IGRyaXZlciB3aGljaCBzZXRzIGhvc3QvZGV2aWNlIG1vZGUgYmFzZWQgb24NCj4gPiA+
IElEIGRldGVjdGlvbi4NCj4gPiA+DQo+ID4gPiBTbyB0aGlzIGlzIGEgbXV4IGZvciB0aGUgVkJV
U19TRUwgc2lnbmFsPw0KPiA+DQo+ID4gWWVzLCBQbGVhc2UgZmluZCB0aGUgYml0IGRlZmluaXRp
b24uDQo+ID4NCj4gPiAwIFZCVVNfU0VMIDBoIFJXIFNlbGVjdCBWQlVTRU4gY29udHJvbA0KPiA+
IDBiOiBPdXRwdXQgUFAgY29udHJvbGxlZCBieSBQT1JUU0MxIHJlZ2lzdGVyIG9mIHRoZSBIb3N0
IENvbnRyb2xsZXIgYXMgVkJVU0VOLg0KPiA+IDFiOiBPdXRwdXQgVkJPVVQgY29udHJvbGxlZCBi
eSBWQkNUUkwgcmVnaXN0ZXIgb2YgdGhlIEhvc3QgQ29udHJvbGxlciBhcyBWQlVTRU4uDQo+ID4N
Cj4gPiBXZSBoYXZlIFVTQiBQSFkgY29udHJvbCBkcml2ZXIoVGhpcyBkcml2ZXIpLT4gVVNCIFBI
WSBkcml2ZXItPnwgVVNCIEhPU1QoR2VuZXJpYyBlaGNpL29oY2kpDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAkgIHwgVVNCDQo+ID4g
ZnVuY3Rpb24gKHJlbmVzYXMgdXNiaHMpDQo+ID4NCj4gPiBXZSBwbGFuIHRvIHNldCAxYiBmb3Ig
dGhpcyBJUCBpbiB0aGlzIGRyaXZlciBmb3IgT1RHIGNoYW5uZWwgZHVyaW5nIHByb2JlLg0KPiA+
IEFmdGVyIHRoYXQgdXNpbmcgVkJPVVQgcmVnaXN0ZXIgdGhlIFBIWSBkcml2ZXIgY2FuIHN3aXRj
aCBiZXR3ZWVuIEhvc3QgYW5kIGRldmljZS4NCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIGV4cGxh
bmF0aW9uLg0KPiANCj4gPiA+IFdoeSBkb24ndCB0aGUgVVNCIGhvc3QgY29udHJvbGxlciBkcml2
ZXJzIHBhcnNlIHRoZWlyICJkcl9tb2RlIg0KPiA+ID4gcHJvcGVydHkgdGhlbXNlbHZlcyBhbmQg
Y29udHJvbCBVU0IyUEhZIFZCRU5DVFJMIHZpYSB0aGUgbXV4IEFQSSwgZm9yIGV4YW1wbGU/DQo+
ID4NCj4gPiBDdXJyZW50bHkgZm9yIE9URyBjaGFubmVsLCBiYXNlZCBJRCBkZXRlY3Rpb24gSVJR
LCB0aGUgVVNCIFBIWSBkcml2ZXINCj4gPiBzd2l0Y2hlcyBiZXR3ZWVuIGhvc3QgYW5kIGRldmlj
ZS4gV2UgdXNlIG1ldGhvZDIgYmVsb3cgZm9yIHRoZSBob3N0IG9wZXJhdGlvbi4NCj4gPg0KPiA+
IEZvciBIb3N0IG9wZXJhdGlvbjoNCj4gPiBNZXRob2QxOiBVU0IybV9QSFlfVkJFTkNUTC5WQlVT
X1NFTD0wDQo+ID4gb3INCj4gPiBtZXRob2QyOiBVU0IybV9QSFlfVkJFTkNUTC5WQlVTX1NFTD0x
IGFuZCBVU0JfSE9TVF9WQkNUUkwuVkJPVVQgPSAxDQo+ID4NCj4gPiBGb3IgZGV2aWNlIG9wZXJh
dGlvbjoNCj4gPiBVU0IybV9QSFlfVkJFTkNUTC5WQlVTX1NFTD0xIGFuZCBVU0JfSE9TVF9WQkNU
UkwuVkJPVVQgPSAwDQo+ID4NCj4gPiBBcmUgeW91IHN1Z2dlc3RpbmcgdG8gdXNlIG1ldGhvZDEo
bXV4KSBmb3IgaG9zdCBvcGVyYXRpb24/DQo+IA0KPiBObywgbm90IG5lY2Vzc2FyaWx5LiBJIHdh
cyB0aGlua2luZyBvZiBsZXR0aW5nIHRoZSBQSFkgZHJpdmVyLCBiZWZvcmUgcmVnaXN0ZXJpbmcg
dGhlIFZCT1VUDQo+IGNvbnRyb2xsZWQgVkJVUyByZWd1bGF0b3IgaW4gaXRzIHByb2JlIGZ1bmN0
aW9uLCBjYWxsIGludG8gdGhlIG11eCBBUEkgdG8gc2V0IFZCRU5DVEwuVkJVU19TRUw9MSBhbmQN
Cj4gdGh1cyBtYWtlIHRoZSBWQk9VVCBiaXQgZnVuY3Rpb25hbC4NCg0KT0suDQoNCj4gDQo+ID4g
Q3VycmVudGx5IHRoaXMgaXMgb25lIHRpbWUgY29uZmlndXJhdGlvbi4gSWYgd2UgcGxhbiB0byB1
c2UgbXV4LCB0aGVuDQo+ID4gaXQgYmVjb21lcyBkeW5hbWljLg0KPiA+DQo+ID4gSG93IHdlIGNh
biB3ZSBtYWtlIHVzZSBvZiBQSFkgZHJpdmVyIHVzaW5nIG11eCBBUEkgdG8gc2VsZWN0IHRoZSBt
dXgNCj4gPiByZWdpc3RlcihWQlVTX1NFTCkgaW4gVVNCIFBIWSBjb250cm9sIERyaXZlcj8NCj4g
DQo+IEZvciBleGFtcGxlLCB0aGlzIGRyaXZlciBjb3VsZCBzcGF3biBhbiBhdXhpbGlhcnkgbXV4
IGRldmljZSB3aXRoIGEgZHJpdmVyIGluIGRyaXZlcnMvbXV4IHRoYXQNCj4gcmVnaXN0ZXJzIGEg
bXV4IGZvciBWQkVOQ1RMLlZCVVNfU0VMIG9uIHRoZSAmdXNiMjBwaHlyc3Qgbm9kZS4NCj4gDQo+
IFRoZSBwaHkgY291bGQgdGhlbiBnZXQgYSAibXV4LXN0YXRlcyA9IDwmdXNiMjBwaHlyc3QgMT47
IiBwcm9wZXJ0eSBpbiBpdHMgZGV2aWNlIHRyZWUgbm9kZSBhbmQgY2FsbA0KPiB0aGUgZXF1aXZh
bGVudCBvZjoNCj4gDQo+ICAgbXV4X3N0YXRlID0gZGV2bV9tdXhfc3RhdGVfZ2V0X29wdGlvbmFs
KGRldiwgTlVMTCk7DQo+ICAgbXV4X3N0YXRlX3NlbGVjdChtdXhfc3RhdGUpOw0KPiANCj4gdG8g
c3dpdGNoIHRvIFZCT1VUIGNvbnRyb2xsZWQgVkJVU0VOLg0KDQpXaWxsIGNoZWNrIHRoaXMgYW5k
IHVwZGF0ZSB5b3UuDQoNCkNoZWVycywNCkJpanUNCg==

