Return-Path: <linux-renesas-soc+bounces-15212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA832A76CEA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 20:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E84A3AA9EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 18:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31AA2165E2;
	Mon, 31 Mar 2025 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ReaVGrI8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5DE214A96;
	Mon, 31 Mar 2025 18:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743445767; cv=fail; b=CPB2NAV82Lp0tg5OCCTXy+7ocd22IBpY5aQpaqp63cb7UKjGfpNk1GjkRnqN0AY12DyML/LZkwm8bjVWvAY5xXD31GUTjDheJDGiivCqJOJBYX7Em9zs3lmj//DfvQF+M3gTR06IkRncRaxZF05nOwj99c5MJqoOpD5p1nIYgCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743445767; c=relaxed/simple;
	bh=pPCd4FO2QSSdQBkpmHfAo1kiZg7yM+HEicgwvovwu1g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VGUsooIX7kz183M9oR3wENZWuV912NDFJMTKcwNjDi28/m7ADlvSNPXk9akM4v1tzfwgkIyPZ4QBTzF1kXb5TOTs8YuPiLjRumSnbGxp0ZCT5Gq4GkgS36jjfjzVBvB3dxQQVgA2YXDYOJ2vIaU8FZxdN2YRiMzu8MUYu1jwnto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ReaVGrI8; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eX99HZ4LZZCQWhqfeQaz+/noRVMLliOnidYawYdRbwKvkzn2iwjA5RnPD5Un/Co/bGMh2AhfWV5gNGnZFq+9FvaxkhpsmjgelI4FVnopzU9zDIRi1YyAQtAhBz7Vm0e+QtHgd8wGUI9dotpUlWr7i2+faMXSIZwj+4LObs3Mb5sXijE3bQBN7KRFv23vdc2WVjneSZp0zVIkL2KI5dQIDRzmM0jsTTbIuG0KgF5ssGzv6xxS6iO0dKSuKW6DmRrxWCn3hOltVqPKrBBlPOKkom4vEUE80iJCgmOEJ9auPTnOD/hUtQUGSKQow+/5SuKQL3IicusiLCkZpd7UguId5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPCd4FO2QSSdQBkpmHfAo1kiZg7yM+HEicgwvovwu1g=;
 b=gUcTG9zNAFI/kopf5Eb04opHEtF5EPX1drjsfHW+1eptmi/ANUZsZLgT/QCuU4bXB7BPmCPgAM+mqprMFNHnkGoszqDv0nWqDOp7xledrYrhE17zKnoOf5HxX9++SKwPXVvzKYA2c6k35o9eROUcbMe+lgAZ2+bifrLcLhCmFJcedC6CNn0vGvlquNQoHIsxT8PEpb3P1Y3i8Zf8Uq78BBNr0858ix+u/wB4D6fIhx/2qyAPbaFZlW8xe1iE85hFRNJSaGAnbA6D1uC+x1b2Iw+30lGQCtiTLFDLzvsxR1rjHDKUtj0+o6VyY6ta0enfqX9mJhjOaDSLO7mE1lPvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPCd4FO2QSSdQBkpmHfAo1kiZg7yM+HEicgwvovwu1g=;
 b=ReaVGrI8yCVAmEhyrCgGhHNThwn1rg5LzN0M5i4aZ5lDtdOrTay2FsIpzFSHdVpMbzgIWNZTqiORuqijrCnvhAc9uBbaYwyjyfjjGRx+mDWUEpyoeYAC8KQDM0wawfjDRvBdh9Afjhcq7s3G3BKvNGXV3rd4Q40HOQDyi3czUDU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13739.jpnprd01.prod.outlook.com (2603:1096:604:35b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Mon, 31 Mar
 2025 18:29:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 18:29:21 +0000
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
Thread-Index:
 AQHbknnX3xSm7+VbqUS1k2gBBCFIfLONYJ4wgAAIGYCAAAV54IAAD5qAgAAAPbCAADFHAIAAAGvA
Date: Mon, 31 Mar 2025 18:29:21 +0000
Message-ID:
 <TY3PR01MB11346E47B6455546AD1E6062886AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
 <TYCPR01MB1133206083EC0249A827261EB86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdUyY8SsUQEZwxdCK-ggPuYy8L_WwnUgq3Cj7oYiTcyNTQ@mail.gmail.com>
 <TY3PR01MB11346123B74D86590C0F8B9CD86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWevyJ8Z4YWYx0rr=_TD0OTywbkPfNwRcw5k=yDV-i2Ow@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWevyJ8Z4YWYx0rr=_TD0OTywbkPfNwRcw5k=yDV-i2Ow@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB13739:EE_
x-ms-office365-filtering-correlation-id: c61d8443-b126-4f75-3db3-08dd7081f4ad
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WUJxdG9HKzdSOWdLWEpzMitQaE5KV2RWRzFOcHhtUDNSWFFQSGF0RnVFQzRO?=
 =?utf-8?B?M1FZTWpoSEpvaE5VejVCMkZ3em1XOWkvY1JzMnBtbitkYXJ2Nmxxc25OZzQ3?=
 =?utf-8?B?ek9GWEF2YzNWR3pLNGdyT2RreUo2NkZ2MDFQd1lkRDBVYWhuZ0lQNEwydm1w?=
 =?utf-8?B?UEZHZjNzU2sxblNJZWR4UE40VEVIek5jczZuMjR2cTJJZEs3V3JYY3BPejZ3?=
 =?utf-8?B?WFd2cmorb2xyTndHdTFicVhYUVVvbVdiOUdpSGlOUnlEbTJ2eXhwMUR4dm14?=
 =?utf-8?B?YUkxOE9YQWo0SlBxTkhpeUMvLzBUTGFzb2VBRGxkWjBWaCsyRzd1eUV4ODhs?=
 =?utf-8?B?amVCUjBUdnJpeGFiVko1K1ZDU0tTdDR4M1VaTEVaZktSa0lyb3UwUWZtK2lZ?=
 =?utf-8?B?N1EyOFlwcHI2NUloZi9LdVFIYnJEWVdJS0MwYmRVc0lYamNhbHY1M2hQcTQv?=
 =?utf-8?B?TEZsaEtzWUNOUUQ0YlpUQlBKS2d3aUZDYkJnU0JsL2VDNXRPUExPZWUyR3Q4?=
 =?utf-8?B?VVhDVlQ5bHI5SVYxcFFOWll3elRreTRMS0cvQlNWWS9vUXBlWGZzTWgwdGJp?=
 =?utf-8?B?V0V1a3JVRVR4UzQrWi95bDZySTV0T1lLZjJpVStBL3BFYVNEcDY5eUN1MzF2?=
 =?utf-8?B?YnUzb1UzZHRaY3U3TGoxajZUNy9ON3dlK2Z4UUIxbVdwWjcyZjV0MHduQXZW?=
 =?utf-8?B?blZuNldoTmJjN0VZZnM5RnNhcTdvYytYc21HNm9UWHg1ZzI5RFRoTllENk50?=
 =?utf-8?B?M1B4ZXU1cE1FTk9Kc3JxN2N2YklmTEpBSWFFRS80QXJWSXA1WjRQd0R6SXRK?=
 =?utf-8?B?T0lGZ0ZoeDJBQ096dnNnV0RsUTJTM1VnWnZqRHRrSzd0QnNsaUJ1UGNtRHlS?=
 =?utf-8?B?MFNkSlNJVC9kK1hyZFUyUlRDMWJIN0VLZ2ZINVhWR1ZSL09VTjV3TzhzVlFq?=
 =?utf-8?B?enJZWFY0NlFLZHRBS3dsZzVRSmxnVkJNdk02NlUyd05XbzZNOWdmNmpFTCs1?=
 =?utf-8?B?aTY3OWtTa0Z5SFdZZTNxUXJNaUhrcW9JMzVsSDBXRkFrT0ZqZHRLb0VtQjdO?=
 =?utf-8?B?b0FwOWp5QkZyR3NWMVpxTFNjUXNkTDNQUXdqL3p1eGhDMkFCaHlGclV1OEtT?=
 =?utf-8?B?cFBZSnRYY1RPanAwOTJFRDRHaXNYakZNeElRRGJ5V2c1RVNkT0tkYURqTGpP?=
 =?utf-8?B?OVB4R2dTc1YrTjhYeWZwT1FENnRvNklSTHVWN0V3UHVkdnJPcGlERWlqb3c3?=
 =?utf-8?B?ZGZkMXNscG14OGNaWkw5NkNaSTZtMU12eXFLMWpxNTZVNXIwYlkzZm8rWTFQ?=
 =?utf-8?B?aER0dXRMSXd5Zmtjcm4xLzMvam9TU2RSZW9mUkVkRkdaK3pxdk1abTVnWHJQ?=
 =?utf-8?B?V2JjblJPU2g0Rldad1haczdRRUlyNGFGdzhJVWpxVWVyMGtLZDNsdlVnb3BF?=
 =?utf-8?B?K2p3aXJqYzlMWGlyMkZUMmRmNEs5UjJoOEsvZ1JYWHZlbmpvV0FiVEdHK0JB?=
 =?utf-8?B?L2FoQk81TVJnQ2ltQVE1MjlkZE53eFNUOGtwSmdweDNzdE9qWVhxV0lsYmVE?=
 =?utf-8?B?YTh5MW1MYzBJNlRsdGFCMm4vZHJ6dGp6VjFiWFQ1czVFR2tsTXg4b3Fia2Zz?=
 =?utf-8?B?b3YvdHAwa25TOTZVQzkzM0VvekgxNEp4c0w5MXo0dStESDAzUUdKek1Ldkdh?=
 =?utf-8?B?a1FuMkNrR2RQK1QrZklKN2NOcnpENk4vaDAzZDFtZ3J1RVFETjVmRGFRL21H?=
 =?utf-8?B?cFFLUXE1djZWVmFrS2hURmFGOHhwQ2hwZWI0Vm5jQkcwOG5RNDlCSFgwSTBF?=
 =?utf-8?B?MGlBMzNnVXEzODFlZHE2S2hYeWxGZnFlSWxFb2lYbUJhY0ZTak45eDA1dlhn?=
 =?utf-8?B?NU9GS3c2OGZGRmx2TXZwMngxL1NNSXQyemYvUkZVY0lNRWhxRXY0b1NHTG5s?=
 =?utf-8?Q?TC2wHt6+D3Hz1dndIsF6AVR5IhUa2W5t?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UkVzTE5YRDgrdjV5Z3AvYncrbnNoNDhQSEVJWjhFSlQ5bGNPRzlWZW9jeDc2?=
 =?utf-8?B?VGJWU05jSjVDTzUyc2dtR3I3bXh0WGJISDdxczFsazZJT0JxNDZlKzhQK2R3?=
 =?utf-8?B?Tkh2a1BhbFFNWS8rU2M3czFvVGJBRWs0cnRlV0pBOWlsbFYxRzlrRENNaVVl?=
 =?utf-8?B?djRjZzN1dE93TzVqNHNGbVJMbXV3Tm1MalNQSStYMmZMeTNNLzV5M1BlbFIv?=
 =?utf-8?B?YWVNazZMOE1JSWhPWUpZa1pGeE5aVWFibFFNb3RXVWZpZXR2YjRNUjUvaW44?=
 =?utf-8?B?V1kyR0VLeDI3WklnZjU3ckg1WkZPdVhaU3FSdnBNSkQxbEdDVmYxdXlhY3kr?=
 =?utf-8?B?T3Yzc2o3bGl1enNQZUZSOFd2NzhWRTBRUGZsUHpWL0tkMXZkSWNOZU5Db0tS?=
 =?utf-8?B?ZGdMdDFZeFpnbjFvTHV2RFFHVVM2OUFMNTA0cUtKZllwZWlybVE1N3FEMDdS?=
 =?utf-8?B?VjZOT2tYSVV1OVFuNVJxSExvUEt4emM1VlIySGxLWTRnYlNLdHZrcEYzaG44?=
 =?utf-8?B?Y0RjaE4zU1NDWGxzZGFaVS9lUzh2djJDMkJNRkZZeTVUSVV6SWhld2xoa0pz?=
 =?utf-8?B?SnZwUzI0ZERkR0lYcUZDdTJHd1VNbGJKSytlVFFYUExVY2FxYm5sK3F4TjFB?=
 =?utf-8?B?Y1ptckJMNTBDRUluSytsOHo1Si9xR0ViMmNKc3JHcCthMW5wRHFDN2RoM3lM?=
 =?utf-8?B?a0MydnhhdW5xQ3FxUEhZeGRDRHZON0ZBS2dXbm4zZ3cwaDVxZ1dkR3oxcTJM?=
 =?utf-8?B?cGRzdTBVQTBDNEE2QTE0SXN1MlN1OG10RDVyTXhUd1hsZHlxSStDYWlZQmxi?=
 =?utf-8?B?akdmZ21zb05HVWhMYmx2bjUwY2RaejBtYWZMdGtobDZWcDFnOTI1RVdjZlJ4?=
 =?utf-8?B?QU04RmN1Q3NZYnRmS1BPTHZvNXFzVExNbGZqYkFOSlFqWFBySW1LbWxBWFJR?=
 =?utf-8?B?RDNXVjJVeUh0Wm5XVzkzaXVpSFhGck1qZUtmUE9ybFVoQXNpa2RkV2NwbDBK?=
 =?utf-8?B?TXVjeWprWXJtOHJtMmFEb3ZHeDVCb0VDdkliNmtLaGw5eE52Q2ZmVWVJd0pG?=
 =?utf-8?B?MGhzUFA2TEhBc1Y0VzRydjFKVHR1dlZySnZFY1VFZlJXRSthVnlDc2haWVRu?=
 =?utf-8?B?Wk84VDhnUGZDRzY5Umlld3Q3MDJDUWZEdXFlNzBMRGgrTmpmcHBsTWdNZkl1?=
 =?utf-8?B?cm82c29ZU1paZ2N1My8xUkM5elZmMk4xVG9PQmdrUXVnclljcUdwMHJ6RVZn?=
 =?utf-8?B?MEVjWlpWUEgxVW5YeTFidmE1VHNqekpDOThIVFRVY0ZsdHVjRjg4YW95a2hW?=
 =?utf-8?B?Z280T3lUTUtJUkd0TDlETXZLbTdoRThuUWxuUFBudXpORHF6ZWpMTFFyTlpj?=
 =?utf-8?B?RXpJR252ajdTcjhPTGlFRGpIWVEwYXBlWU1KeVpLUlllVlJRQm9WaFdXMkNl?=
 =?utf-8?B?NnZBbG1FNUdKYk1Xck56b042Q3lVaWpVc2M2WGNLSHRkaEVLKzNIMmdYb3I3?=
 =?utf-8?B?VFVIT2pUdlFCa1ljTVUwbE5HNW5Ib25VRERiSUg3UllObkRrOU5oblNqdEFx?=
 =?utf-8?B?TGpFbGRqdW85RWZyK20ra3d1UllPRlV3dUdLaENhU0Q1SzdMajNLUTdRRlJx?=
 =?utf-8?B?aloxMEhXNTVTNEJ2bkl6T2ZVMVdveXpUSDZibjIwTWIwa0daUGZLNVdBMk9J?=
 =?utf-8?B?ZGFrVm85R3RUa2hkTXZnTk40c3ZreEwwdWJld3lYN0pVTUpFempOZGhNck5R?=
 =?utf-8?B?YjBVQm1yMkdJMWhLdjJhbzJPSy9KQmg3cmIzYmovdzdGYTQvYzk0N0gzc2hT?=
 =?utf-8?B?MlU3NjJLVEhVbDZ5cHgwd2s0bGQza05nV2RyeVU2NU96M2s0cE5Va3VUaVR2?=
 =?utf-8?B?R1BvbFZHRUY1NGZKdGZJSWtlb3Z2YWNmTjVzSGl2QnRaUWdZSXVOYmQwSlpT?=
 =?utf-8?B?cFZZS2NBRzk2Wm95b2VmZDg5VnYyTkhZVEtLQmRhNVlnTzJHZjVhcmVhMXJq?=
 =?utf-8?B?eDRSSW41ODAwdllaZjYwRXY1N3VndjliengvUVFmaEpVSHg5aHRCTmIycVZU?=
 =?utf-8?B?eXg4UU9IaHhlTmp4THFSd3JBeUxlY1VEZUJ4MnBtaWc0S0duaHZqTVpMTFZ2?=
 =?utf-8?B?VWxMMU5jMlVwV1I1NHBET2JnRG1lMzVNYytBaUV4czkvMHlqaWdQWkJDVWV1?=
 =?utf-8?B?c2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c61d8443-b126-4f75-3db3-08dd7081f4ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 18:29:21.4316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fOPO5+obcZv+P5zrKiU8aA1PCdXNiAwthwEXjXnHqvg0IqUEaTpMkgF7NmopbDKd6pB8PexGXlCdW7/l2SD0N7CIlLbl+v7Fdy7V09swxjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13739

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMzEgTWFyY2ggMjAy
NSAxOToyNA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvOV0gZHQtYmluZGluZ3M6IG1lbW9y
eTogRG9jdW1lbnQgUlovRzNFIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24s
IDMxIE1hciAyMDI1IGF0IDE3OjMzLCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4gT24gTW9uLCAzMSBNYXIgMjAyNQ0KPiA+ID4gYXQgMTY6MzQsIEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gT24gTW9uLCAzMSBNYXINCj4gPiA+
ID4gPiAyMDI1IGF0IDE1OjU0LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+IERvY3VtZW50IHN1cHBvcnQNCj4gPiA+ID4gPiA+ID4gZm9yIHRoZSBFeHBhbmRl
ZCBTZXJpYWwgUGVyaXBoZXJhbCBJbnRlcmZhY2UgKHhTUEkpDQo+ID4gPiA+ID4gPiA+IENvbnRy
b2xsZXIgaW4gdGhlIFJlbmVzYXMgUlovRzNFDQo+ID4gPiA+ID4gPiA+IChSOUEwOUcwNDcpIFNv
Qy4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+DQo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvcg0KPiA+ID4gPiA+ID4gPiArKysg
ZW5lcw0KPiA+ID4gPiA+ID4gPiArKysgYXMscg0KPiA+ID4gPiA+ID4gPiArKysgemczZQ0KPiA+
ID4gPiA+ID4gPiArKysgLXhzcGkueWFtbA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ICsgICAg
c3BpQDExMDMwMDAwIHsNCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5l
c2FzLHI5YTA5ZzA0Ny14c3BpIjsNCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgcmVnID0gPDB4MTEw
MzAwMDAgMHgxMDAwMD4sIDwweDIwMDAwMDAwIDB4MTAwMDAwMDA+Ow0KPiA+ID4gPiA+ID4gPiAr
ICAgICAgICByZWctbmFtZXMgPSAicmVncyIsICJkaXJtYXAiOw0KPiA+ID4gPiA+ID4gPiArICAg
ICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjI4IElSUV9UWVBFX0VER0VfUklTSU5HPiwNCj4g
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDIyOSBJUlFfVFlQRV9F
REdFX1JJU0lORz47DQo+ID4gPiA+ID4gPiA+ICsgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJw
dWxzZSIsICJlcnJfcHVsc2UiOw0KPiA+ID4gPiA+ID4gPiArICAgICAgICBjbG9ja3MgPSA8JmNw
ZyBDUEdfTU9EIDB4OWY+LCA8JmNwZyBDUEdfTU9EIDB4YTA+LA0KPiA+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDB4YTE+LCA8JmNwZyBDUEdfTU9EIDB4YTE+Ow0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IE9uIHRoZSBuZXh0IHZlcnNpb24gSSBhbSBnb2luZyB0
byB1cGRhdGUgc3BpeDIgY2xrIGFzIDwmY3BnDQo+ID4gPiA+ID4gPiBDUEdfQ09SRSBSOUEwOUcw
NDdfU1BJX0NMS19TUElYMj4NCj4gDQo+IEFjY29yZGluZyB0byB0aGUgUlovRzNFIGNsb2NrIHN5
c3RlbSBkaWFncmFtLCAodGhlIHBhcmVudCBvZikgY2xrX3NwaSBpcyBkZXJpdmVkIGZyb20gKHRo
ZSBwYXJlbnQgb2YpDQo+IGNsa19zcGl4Miwgbm90IHRoZSBvdGhlciB3YXkgYXJvdW5kPw0KPiBT
byB5b3UgY2FuIG1vZGVsIGNsa19zcGkgYXMgYSBmaXhlZCBkaXZpZGVyIGNsb2NrIHdpdGggcGFy
ZW50IGNsa19zcGl4MiBhbmQgZmFjdG9yIHR3by4gIEkuZS4gcHJvdmlkZQ0KPiBhIG5ldyBjb3Jl
IGNsb2NrIFI5QTA5RzA0N19TUElfQ0xLX1NQSSBpbnN0ZWFkIG9mIHlvdXIgcHJvcG9zZWQgUjlB
MDlHMDQ3X1NQSV9DTEtfU1BJWDI/DQo+IA0KPiA+ID4gPiA+IFdoYXQncyBzcGl4MiBjbGs/IEFo
LCByZS1hZGRpbmcgZHJvcHBlZCBsaW5lOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ICsgICAg
ICAgIGNsb2NrLW5hbWVzID0gImFoYiIsICJheGkiLCAic3BpIiwgInNwaXgyIjsNCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gQmFzZWQgb24gWzFdLCB0aGUgY2xrIHNwZWNpZmllciBjYW5ub3QgZGlz
dGluZ3Vpc2ggYmV0d2VlbiBzcGkNCj4gPiA+ID4gPiA+IGFuZA0KPiA+ID4gPiA+ID4gc3BpeDIg
Y2xrLCBhcyBlbnRyaWVzIGFyZSBzYW1lKGdhdGluZyBiaXRzKS4gU28sIHRyZWF0aW5nDQo+ID4g
PiA+ID4gPiBzcGl4MiBhcyBjb3JlIGNsb2NrIHRvIGRpc3Rpbmd1aXNoIHRoZW0uDQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlIGFyZSBhbnkgaXNz
dWVzIGluIHRoaXMgYXBwcm9hY2g/DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBBcyB5b3Ugd3JvdGUg
aW4gWzJdLCB5b3UgaGF2ZSB0byBjaGVjayB0aGUgdHdvIG1vbml0b3IgcmVnaXN0ZXINCj4gPiA+
ID4gPiBiaXRzIHRvZ2V0aGVyLiBIb3cgZG8geW91IHBsYW4gdG8gaGFuZGxlIHRoYXQgcmVxdWly
ZW1lbnQ/DQo+ID4gPiA+DQo+ID4gPiA+IEFzIHBlciBoYXJkd2FyZSB0ZWFtLCBzcGl4MiBjbG9j
ayBpcyB0d2ljZSB0aGUgZnJlcXVlbmN5IG9mIHRoZQ0KPiA+ID4gPiBzcGkgY2xvY2ssIGFuZCB0
aGUgY2xvY2sgT04vT0ZGIHBlcmlvZCBkaXNwbGF5ZWQgZm9yIGVhY2ggYml0IGluDQo+ID4gPiA+
IHRoZSBtb25pdG9yIHJlZ2lzdGVyIHZhcmllcyBzbGlnaHRseQ0KPiA+ID4gZHVlIHRvIHRoZSBk
aWZmZXJlbmNlIGluIGZyZXF1ZW5jeS4NCj4gPiA+ID4NCj4gPiA+ID4gU28sIGlmIEkgbW9uaXRv
ciB0aGUgYml0IG9mIHNsb3dlc3QgY2xvY2soc3BpKSB0aGF0IHdpbGwgY29uZmlybSBib3RoIHJp
Z2h0Pw0KPiA+ID4NCj4gPiA+IChwZXJoYXBzIG5haXZlbHkpIEkgd291bGQgYXNzdW1lIHNvLCB0
b28uDQo+ID4gPg0KPiA+ID4gQnV0ZSB0aGVuIHdoeSBkaWQgeW91IChvciB0aGUgaGFyZHdhcmUg
dGVhbSkgd3JpdGU6DQo+ID4gPg0KPiA+ID4gICAgIlNvIHRvIGNoZWNrIHRoZSBzdGF0dXMgYWZ0
ZXIgY2hhbmdpbmcgdGhlIGNsb2NrIE9OL09GRiByZWdpc3RlciBzZXR0aW5nLA0KPiA+ID4gICAg
IHBsZWFzZSBjaGVjayB0aGUgdHdvIG1vbml0b3IgcmVnaXN0ZXIgYml0cyB0b2dldGhlciIuDQo+
ID4NCj4gPiBCYXNpY2FsbHksIEl0IGlzIGZlZWRiYWNrIGZyb20gaGFyZHdhcmUgdGVhbS4NCj4g
Pg0KPiA+IDxzbmlwcGV0Pg0KPiA+IFRoZXJlIGlzIG5vIHVzZSBjYXNlIGluIHdoaWNoIGVhY2gg
Yml0IGluIHRoZSBtb25pdG9yIHJlZ2lzdGVyIGlzIHVzZWQNCj4gPiBpbmRlcGVuZGVudGx5LCBz
byBhcyB5b3UgcG9pbnRlZCBvdXQsIEkgdGhpbmsgaXQgd291bGQgaGF2ZSBiZWVuDQo+ID4gYmV0
dGVyIHRvIGJ1bmRsZSB0aGVtIGludG8gb25lIGJpdCwgbGlrZSB0aGUgY2xvY2sgT04vT0ZGIHJl
Z2lzdGVyLg0KPiA+IE5vdGUgdGhhdCB0aGUgc3BpeDIgY2xvY2sgaXMgdHdpY2UgdGhlIGZyZXF1
ZW5jeSBvZiB0aGUgc3BpIGNsb2NrLA0KPiANCj4gT0ssIHNvIG9uZSBiaXQgd291bGQgaGF2ZSBi
ZWVuIGZpbmUuLi4NCj4gDQo+ID4gYW5kIHRoZSBjbG9jayBPTi9PRkYgcGVyaW9kIGRpc3BsYXll
ZCBmb3IgZWFjaCBiaXQgaW4gdGhlIG1vbml0b3IgcmVnaXN0ZXIgdmFyaWVzIHNsaWdodGx5IGR1
ZSB0bw0KPiB0aGUgZGlmZmVyZW5jZSBpbiBmcmVxdWVuY3kuDQo+ID4gVG8gY2hlY2sgdGhlIHN0
YXR1cyBhZnRlciBjaGFuZ2luZyB0aGUgY2xvY2sgT04vT0ZGIHJlZ2lzdGVyIHNldHRpbmcsIHBs
ZWFzZSBjaGVjayB0aGUgdHdvIG1vbml0b3INCj4gcmVnaXN0ZXIgYml0cyB0b2dldGhlci4NCj4g
DQo+IC4uLiBleGNlcHQgdGhhdCB0aGlzIHBhcnQgc2F5cyB0byBjaGVjayBib3RoLg0KDQpDYW4g
eW91IHBsZWFzZSBzaGFyZSB5b3VyIHRob3VnaHRzIHRvIGhhbmRsZSB0aGlzPw0KDQoxKSBHYXRl
IG9ubHkgc3BpIGNsaw0KMikgRm9yIG1vbml0b3JpbmcgdXNlIGJvdGggY2xvY2sNCjMpIENsb2Nr
IHNwZWNpZmllciBuZWVkcyB0d28gZGlzdGluY3QgZW50cmllcy4gU28gdGhhdCBjb25zdW1lciB3
aWxsIGdldA0KICAgcHJvcGVyIHJhdGVzIGZvciBib3RoIGNsb2Nrcy4NCg0KQ2hlZXJzLA0KQmlq
dQ0K

