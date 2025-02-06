Return-Path: <linux-renesas-soc+bounces-12901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A83C8A2A6F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 12:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AA1C188A888
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 11:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38182288EC;
	Thu,  6 Feb 2025 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NtPJAUnI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A53C226865;
	Thu,  6 Feb 2025 11:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840078; cv=fail; b=jEqx5IuHJivCVOupBkU380JlPT3kadqN4xuLM4MmDL7PDVAoE/9iS2HBzRffd2kqHDZmRYUQ6HJ6xddtz7QjzA9Z7vMFC54MuSZ0/fM+aCpyDWuTdN7ywpFGOtjpJHmemMGaOoQdzZNJx9RV/36CzGDTbTKjDQe3SBeIjnDx17k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840078; c=relaxed/simple;
	bh=Jym499uwFL9riJfBAth0KeAZx2K3Gc1XgLtKIwcvyLw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h/PWl3OO1jBRKfItrPJlnWvVUQVG1vdFEd79cCE2qxh7NUKebJkK2eVtPeD6BcnGJvL3CIgfSKe3EnxiBgPh7sLISO5H24Wo+UM+IaUTZHOiQG1J4UdKW+3TTgsx1QtvrPYPSnHMELQSbY6VeZ940e7tpkG23ICTIT5aHSJdkIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NtPJAUnI; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nH6UlhvE0MyU1dClUtGovLq9KLPrhLvOmFyyVMiBNm+GFQiMtw05NgwHjDwilktq54Jb08Qh2QBbjhpslH6wgu0d2LetDGZjPZvHdHUuXGz+wF+qp1N3EkjgQX1khbFwpTTg8Naqa+L9zuNRr2CWgeyqSsrJH+U4nIBSB54WoU96bLwEkAM6748kBEMYXjW1YVU7PkQQbxXJQxd84TJtXkTjRwufjYnBzTP71oPz48tiSM9VKWehnIyptc2oJFtKYihoNCpLnXYZntEvBCi+OMxREMyclKXdClla289xnMkTgHaZW/B80c9nrR94nsjGMBSdd/mSJFEo3MBePjhUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jym499uwFL9riJfBAth0KeAZx2K3Gc1XgLtKIwcvyLw=;
 b=IATmGUw+e5HNVIGx8CopXYS/+o+qq47Bol9pqms/z6cRhbxIL77GWtOxUKxU9zsNfdIapOniakyaGDloOTwevmINh10YUrWBwCkZi1C+198TgfL+aBshUkM1O2mRoX7D/kZQz/yRffNQyvXXVA7gBMbLDBlOq1TojAPjTCWD0QJuw9xABF3orqN79zI6CPHmVcbSexB7/kh1JzQTLOuSijYn1NDbeeS1BSquLDziL82LQCSZMitxqbXPVFLHnOliV9gaWeRc1TchAoQgHP32A72fG/GVWO81/rqV2zUFU01QgcqAJBWn4Pp1QSLlbXL0ttHyhEYu+5jFeLPflJBJ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jym499uwFL9riJfBAth0KeAZx2K3Gc1XgLtKIwcvyLw=;
 b=NtPJAUnIndbwl9YomSr7QCOLz6pO3aV/xKWAUoXFmMcgoxWvC88mbV8UPBdrXrNxTD4wn7U0KLpUWfJoFRTbHt8hSnvicJh6vtQ7McSciC1t8mTds/HqeEqqGQGo+dy3GhCmUciIBjkrQXZ38nY7XJyw0yJ4TfApBx7LH9f2zRA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12998.jpnprd01.prod.outlook.com (2603:1096:405:1c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 11:07:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 11:07:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable
 SDHI{0,2}
Thread-Topic: [PATCH v2 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable
 SDHI{0,2}
Thread-Index: AQHbc9LHJ1EZ6jvpdUu3wePcW5HPZrM6DUyAgAABgaCAAANLgIAAFNnw
Date: Thu, 6 Feb 2025 11:07:53 +0000
Message-ID:
 <TY3PR01MB113462514C084AF817F54107B86F62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
 <20250131112429.119882-7-biju.das.jz@bp.renesas.com>
 <CAMuHMdXSaewfeRkuOqmBYkWPzLr54QM1X7fw0ODOuj-ooucUkw@mail.gmail.com>
 <TY3PR01MB11346D27BC2EE65AD29789B0D86F62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdU-8vEWq2sVBtq2wZ-3msKpNWket88-DDGVNX53U2u4ww@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU-8vEWq2sVBtq2wZ-3msKpNWket88-DDGVNX53U2u4ww@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12998:EE_
x-ms-office365-filtering-correlation-id: f2f00195-4024-4295-6b3e-08dd469e80d8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N1BwZlEydlZuWHRvWStnemVYc0Fsa1F5MHJNWVY0enB2MXpidXZrSDUvOFZr?=
 =?utf-8?B?cXRVZXcraUhPM0lHTWpzRXh0WFdheUxSOG9xYU83T2VFWllFdWtrTEJMRDRw?=
 =?utf-8?B?dnd3OGpxaUtmNTNOR01hajhQUlRlL3FjcW12b211WS9GN3FsdUZZS0hTZGNz?=
 =?utf-8?B?dWJwTFB0RmFTNCsvcDA5LzA2ZmJaUUIwZVJ5UTBvV0FVZlNJeXZCSWlnbVcw?=
 =?utf-8?B?MTZqbzQwK1dvR09GR3V2VjA0dzVnUlpzdXlUWGZUTGpPYzNrejZZTDVIM01S?=
 =?utf-8?B?QW5vUkZ2S1BsWWZwSmZIRDVmWGpld2tmTzdnMFRmeWwvbVliZjd4VDFSSkxZ?=
 =?utf-8?B?azk4MEJzbkF3N0FPSWllWTZLRkJrVkJqd2JQZ0EwOThLTzdlRHR0RlBiVnhu?=
 =?utf-8?B?cnVJay96MWV1QTdMTmFCajhQc1k0R0VhZ1FvaUhIVzZQVHB1Q0tpU0FwNGJn?=
 =?utf-8?B?bFc2TkRwMWJCMzZ6eGM1bjFmZ09rMmtEdng2M2d0RithUHY0QllnWmxiZEZk?=
 =?utf-8?B?T2h2RHVLY09ZRXJod1c0ODBOSUlRNzRwSzM4VHptZUFuMHEyZVMzTHBQR0Zl?=
 =?utf-8?B?V1JUUmFXWnFtWWh2amE0ZURqTmRySU5JamtTeDR4S0xWbGx6ZVpVWklxbkMw?=
 =?utf-8?B?TWZSY0hkWTE3WE9ZaTJzbjh3Q0NML3ZuTzlpVDhtV2lXR2U0V2s0L3FPbndR?=
 =?utf-8?B?Z09Lc0M0ckF1RllpbVI1cXIxRnp4aTRpWVFvcHplMkVpNWZoTy9NL2Uxa0dz?=
 =?utf-8?B?RGQyV2ErWDJ4d0Fpc3dpUlBYYkFLRDBXQ042dk12enFoYmI2SnNrVDRpK2ZT?=
 =?utf-8?B?MlBPTTNDUHNkVThtMm40MDNCQ1NaWmJEUnR5WjZPWDUvQmQ5YnA4RkIyOVVt?=
 =?utf-8?B?cTVpclA2Y09nYjV6bzRqZVVjS3V5SGRnT1JFeUt4UHVhc21SbTc0TzduWElv?=
 =?utf-8?B?MFVvbThWRVkvMzJOV0VlSXVzU1Q2aGJOQ21leVJhVnZ6UUROdW0zUmwwdk5i?=
 =?utf-8?B?QTF4NFpUVE9IcDJKZWsxUjR0Z0RqcEtlUHhMaTYwcWQwRlpZb3pnZkdQVVVR?=
 =?utf-8?B?UENOV0RYcDdLdXhodTY0SkFSdTlCdk9TUUJvOE5rWkJYUmR6dDd4Z2VKWHNO?=
 =?utf-8?B?NXFwSEkvVU9tbjVnT0k2VXVCVnRXWFZoNXVONHExc21GQ2dVbEloTWNYQ0xG?=
 =?utf-8?B?MUxyZzlhVzZGWk80ZSt0YnJYc3Iwc1lWMGpqNkZxOUYzQUsrWHdYT1JGdm0w?=
 =?utf-8?B?VXI0dkZsOGhFc21jNmZJdi9jUkZHSG94dXNOMFloZnZaNHIyb1lMeEJ0OEdo?=
 =?utf-8?B?cUMxVk94THFZTnN0OFZUNGtuenczTzI0S0VDdmdJbUZXYmNRMFZhMndpK1cv?=
 =?utf-8?B?Tm16TzkyOTRIM2l2OXlhSDNIWVpDRFpPS3BIeHFXRnZUWUVKRzFiaWNtZUlm?=
 =?utf-8?B?ME4rSjNhdzdzU2E2RDF5d2dMdnpmWVV6TVArNkNzV1V5UjNNWUlLZEJUWGdY?=
 =?utf-8?B?aHFGUVpRM0FzZFpaR2wrNmZiVHNJRkFXSk1QY0FLNFVuRkdYaTg4ODFEK0t4?=
 =?utf-8?B?dnJ2YW9nMUtKbTRyaSs5TVNLY1QzNFNxbU9SK25TUDlRYXB2MGZmRXh6b1RK?=
 =?utf-8?B?RjVJV0RGbDNSQ1lUdHJZVnhVNTRGSGpvY3lzN1lwTXl0TGxxdi9hRjJuVEJL?=
 =?utf-8?B?U3pNbUVFajhDaUk4L3BnMEsxK3FLMms4WDR6TVRwdmpicXRoQ3cwWTBFZkZ2?=
 =?utf-8?B?ZXd0aE9pbm1QZ0ZBZEdyUWNQUzM3MXBBdVJ6UXJ0NGlzQmYvZVFqbjBCc1pZ?=
 =?utf-8?B?MEhiVmVOdk5xQUF1Z1QvU0o0c29PczJlNjRVNUxESW9ZR0RUUVZlcTBtTWl3?=
 =?utf-8?B?QzR6T2wxTTFEZTBZcFBiWWpSajk4TEJGQnJ0ZWpqcFU4d2U5ODVMRE1KZHY2?=
 =?utf-8?Q?/MaL23ijVHnIy/bvWe1FUAIGnacqrRzj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vml2L2pNQjlwTys1OExLQUNGWXllRHRsSUxkWU83QW0yT0pUN0dUZnlhYVhJ?=
 =?utf-8?B?ZzNPRUNyQWo1RGUxY0ZJUWRWQVoxSjBRWXBNQUIrdjFndnpaSHRTYngvYTZm?=
 =?utf-8?B?YzZ4VjlZMFlWNThoWlJJR1kvWGVqK0d2RWtJNGFRRUl3SW9UOFRwQ3JmMDhU?=
 =?utf-8?B?S3V0UUZPR011a2hxQ0Y4SEJQdENJN0lteDFXbysraGFUcWVvMGlZRTIzQXdx?=
 =?utf-8?B?ZzZERVhuV0dvN2k1eHFTK2w4OThOQVFaNUdoMktYZVo0a1dHOFhKVjJnbHJF?=
 =?utf-8?B?SG1neFZkMkVQYTUxZGlEVE9MYUM0NUJpaFJ6MkZCMmhuTXcyZkhCUWhpYVdW?=
 =?utf-8?B?UlBLNndIZWdnK2xpaVlZc0xlOEo3OFE4QjdjM1pyYitGR3ljS053NWU2dThz?=
 =?utf-8?B?a3RkQXErQjBZbUxrd0dhMUd5aE5tb2JsbG1OTUIySzR6UGh2Uis1Nlp3bFNH?=
 =?utf-8?B?RTBldVAwbWlhTStjdDVabmZyYnM0NUVNS3g4Vyt6b3VjbER5MXpoVHBmbm1L?=
 =?utf-8?B?ZWRQN2licmlXRWgzTDRLSnNzZjZQbnBBWVJ2Mm9UWE0xWjZXK3MwaGxQS1hX?=
 =?utf-8?B?R2liVVprUnBzSjFzOTVkcUd2V1NMdVBmV1pFOEM0ZXYya1VPcmY3Q3c1YXdI?=
 =?utf-8?B?REZ0dEM0dHNmOGFkQlk0LzMxSGZKWEQxRllXVWdONXhXZkROMVFjSkFndGxX?=
 =?utf-8?B?RGFTdlFTR3lBb0UxNHd0djY4VWlSeW43Ky81cmpGT0JRZ1BIb1ZvQlJTU3FV?=
 =?utf-8?B?cEZKMzQwZ3l1dFNVR2JXRkFpaEFSaC83UmpES0VpVGhkR2ZEMk5QTEpQaDB0?=
 =?utf-8?B?MVQvWFY5YloreEV1bkxmR2V4VXpDU0NlcWpMYkVEdzdieThCTEZIcUc5N2ta?=
 =?utf-8?B?Tm5jU0NQOCttcHVaVlc0UWlncDZuQXFSQmxpVXVRSit3K05Xa21VanQvZ0RO?=
 =?utf-8?B?Z1RNbVZDZWpqK0o5bDZJbnY1WEFoaG8rc2s1Mm11cEZqeWlOLzY4V1ltNEFk?=
 =?utf-8?B?cWRCeEttUDFhMm5kMGN3UU5xRWQ1TEVqUkFyYjhhdmIyVWZNU0o3VUNTb2ZG?=
 =?utf-8?B?aDVuVko3MUNkaDZzam1wa09ZMHo1aEZSRE5OSEpzOVFxRm9iSjRyaTA1N2xl?=
 =?utf-8?B?T0I0UkZxaW5ody9xRGlKZnRUYkV0R2k5dVA5U3JkRHRBSHlKK0JlQnJodEpR?=
 =?utf-8?B?QStzbXBzMzZCZ0pRMWdMUlRXVGtYWlFTQVJyNjRUbzZsR0RMSmV4ZGNSQ3NK?=
 =?utf-8?B?U2RFVFJ3ZnJrY3lvdkFPS0l5RVo4TnZoNlJSeVRQSkwrRGcyY0phUUM4eis4?=
 =?utf-8?B?dStzM2FQNHN5V3dWMEdQenFjZ0hzSHJSQjdiTEhGTEdKeVgvWmhEZ0drdFRR?=
 =?utf-8?B?RVlYbkxrd25nd3ZWT2hLVW95dnA2K1RPWDA3OURBTGpJS2l1OUY3VXZIeDUw?=
 =?utf-8?B?OVpnSXFobnJmOG5vcUxkZkFuYmxOWFh5RjRnR2RIcXZqUWdVYWNiSldGQ2hu?=
 =?utf-8?B?TXA5VUxMZzRWS210UURvTGdkakVNa2NXejlhZVhjWUtsRzkyRmp5M0VhNnZ6?=
 =?utf-8?B?T0hvNEd0NHBlOUNDY2w0ZEcydDRNaEtyM0pON1g0M1RvbWJhUFZyUHh2OCtK?=
 =?utf-8?B?RFZKSkVkK2JFSHNRUlI5L2tzMmNBbGMvZ0pES2dJMzhTOXNqY3hNOUI4aEo3?=
 =?utf-8?B?Ky8xdmxaYjdvQlZLSWVZYzZ0VjFZb25SaXRiN3BSRi82Y05meDZMOXdZN2Zq?=
 =?utf-8?B?TWgwenlQSWpJbEYxRW90MWdWeTlJQWJxWUZqRzY3K1QxcktXb2x0dGNBbUlE?=
 =?utf-8?B?RXZRSitocXdQWUpPN3RGdHZWK3REZmMxNkFFdGExc2Y4ZDNNblVKMDEvRm9h?=
 =?utf-8?B?OG02OHA5c2xPc3k5Mk0wdDNLd3lSMnNxVUI4N1doSE0zYzRaRDQzTEdhUVhM?=
 =?utf-8?B?SHp1eG1qYlpYZXFna0tId29qZVR1SjZGc2pOTG1zemszSTNpSkhBNHVrU0dK?=
 =?utf-8?B?cUZYMEpDSlVaaXZmUkFiMDh4NzdIa1BvbTlhbHRiazlzMGR4M3V0WU1kKzVI?=
 =?utf-8?B?eHVoV0Y0a1NTeXUxTkJPZC9Nc3dyOHo5Vlp3VXFDZE9ZeGRESG1GVGl2WXRz?=
 =?utf-8?B?YUw5THFmWTJ0Y1ZXZnoya2ExN3ZsQTZEN3F5SVpmb3RTaklBZEVKUFN0Y2Nu?=
 =?utf-8?B?eWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f00195-4024-4295-6b3e-08dd469e80d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 11:07:53.6402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gH1uVqXbl4ExBUAd5k2yPFX9JkIdt8hnVhDD3+LC0XeFkOeAO37aUX1VQ1TKucVURGKgMF07MU7RedHytf0nmH/gOy98DYKwmHwlYPrUb18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12998

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDYgRmVicnVhcnkg
MjAyNSAwOTo1Mw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDYvOF0gYXJtNjQ6IGR0czogcmVu
ZXNhczogcnpnM2Utc21hcmMtc29tOiBFbmFibGUgU0RISXswLDJ9DQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gT24gVGh1LCA2IEZlYiAyMDI1IGF0IDEwOjQ3LCBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+
ID4gPiBTZW50OiAwNiBGZWJydWFyeSAyMDI1IDA5OjM2DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDYvOF0gYXJtNjQ6IGR0czogcmVuZXNhczogcnpnM2Utc21hcmMtc29tOg0KPiA+ID4g
RW5hYmxlIFNESEl7MCwyfQ0KPiA+ID4NCj4gPiA+IE9uIEZyaSwgMzEgSmFuIDIwMjUgYXQgMTI6
MjUsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+
IEVuYWJsZSBlTU1DIG9uIFNESEkwIGFuZCBTRCBvbiBTREhJMiBvbiBSWi9HM0UgU01BUkMgU29N
Lg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+IA0KPiA+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcnpnM2Utc21hcmMtc29tLmR0c2kNCj4gPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3J6ZzNlLXNtYXJjLXNvbS5kdHNpDQo+ID4gPg0KPiA+ID4gPiArJnZxbW1j
X3NkaGkyIHsNCj4gPiA+ID4gKyAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJTRDJfUFZERCI7DQo+
ID4gPg0KPiA+ID4gV2h5IG92ZXJyaWRlIHRoZSBuYW1lPw0KPiA+DQo+ID4gSSBqdXN0IHVzZWQg
dGhlIGxhYmVsIHVzZWQgaW4gUlovRzNFIFNvTSBTY2hlbWF0aWNzLiBTbyB0aGF0IGl0DQo+ID4g
YXBwZWFycyBhcw0KPiA+DQo+ID4gY2F0IC9zeXMvY2xhc3MvcmVndWxhdG9yL3JlZ3VsYXRvci40
L25hbWUNCj4gPiBTRDJfUFZERA0KPiANCj4gSSB0aGluayB0aGlzIG1ha2VzIGl0IGhhcmRlciB0
byBub3RpY2UgdGhhdCBpdCB1c2VzIHRoZSBpbnRlcm5hbCByZWd1bGF0b3IuDQoNCkFncmVlZC4g
V29uJ3Qgb3ZlcnJpZGUuDQoNCkNoZWVycywNCkJpanUNCg==

