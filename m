Return-Path: <linux-renesas-soc+bounces-12480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3415AA1B953
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 16:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7348516EC7C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 15:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D03E21A95D;
	Fri, 24 Jan 2025 15:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dMgE7Kqf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641EC15250F;
	Fri, 24 Jan 2025 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737732282; cv=fail; b=RVRafeHJHkSSk6I9GY5txZH05cqiXzgzRqRwJtCAhpmwFPS4EVqsvhKA6nfrx4VhpWz/eiYYuFEiPWe6zuylMLgREEcbxpyoK9GK/VZX7eb4I3sOJ0qfGUKwsZ2+ScX+ePgZqUQmIVPMUwRukt+KHcuNTX0p4svMcXrJFCCjuq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737732282; c=relaxed/simple;
	bh=BJFJutB1A/55khOX5YI5xJOEegzO8No4mss7ar0reis=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YTxd6amhexrAdzIUR+6hWY6KsUvOTWOt0AYCPKHksXnGAMBAfw6IdDxn3KyIVf/6DV/812aWH9mFtOG6NR/ikmntlarSbcv+uxa/ko9zWRUcqR8GWlvKmxWtFUjyLL4I4/Jm6HD2oena3OfcOyqh4Id0yqS2d3L4WMKnojpVrVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dMgE7Kqf; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPFJCNy6lgMPNVIBkKWNBLqP17Kz3bueyqA/nrO9UQj0D8o9V2DgDlnJsU2aEOoO22AYvDxxyAtuw1dylRldva6mYVK18WA4INWaHBA9NLXhoAL3pVtmzoFMVmL74JAdQYljoTg3lB9ME+3vGzOIcT9Hp1GlRppAZPvs11xV0gEEyIHo6sa8vo8YpYTg0LF2A5X7vLk25f5PVUqaUKGew0rP4yPxRipMvdvIgBzVdBR4law2laRGTpGxERFBIon84NaqTzp1iHmz4SyzytjDC/ES1ccbwICRobzz9gQrI+6sJjYe9+kUtqdW+BlQaF7fYRNs2QPQ1ilY9wpZz6ursA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJFJutB1A/55khOX5YI5xJOEegzO8No4mss7ar0reis=;
 b=JwBNmb6EGbHG0WHC9pMe/8EUcSBgaZmSZIEPLRjbmaxR/UCDwSQz5vvdf+lNd8SEqWXhGKhByTMN2KBOo1YrRStjDSKm+EWWgCPeqT0EwP5CdJ3bW9kwrt+Cvvauu6ejnmYnFQNw+l634D5MqeK3oi4BhkKLCMEprJbOxIjzDW02Qt/hS/EPH+LoOXCY1REtGQIO337QQY7nT19V9TrXXfFZcMskOC92Q/LemhE8XIz54xnX4+1Q4rmJAfOnki8GN31996S2N1RVhMeYCr7oqQdvHn1yxBa+/ONcIWf2d2bwfRMT2pswXYY6tWswjYUl3WbsH1JmqoSU6pCXZM70UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJFJutB1A/55khOX5YI5xJOEegzO8No4mss7ar0reis=;
 b=dMgE7KqfjEuJ/FBZLwqtKPLmCJmC7jJ5HpOlxG1ygAWmy8SJOHqGEZogbcq7h9bY0/Zi0aIlswb/SZDa1az6f8SWZ/UhN8rwqNMyKgaHv/Ax4xW+RwSDnyfHK0OVDWy5E0GotOI1nO4q1P0D+oiHAmRVp+hiRgLRr6N3CYGe1+4=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by OS9PR01MB14257.jpnprd01.prod.outlook.com (2603:1096:604:365::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Fri, 24 Jan
 2025 15:24:35 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 15:24:30 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>
Subject: RE: [PATCH v4 1/9] soc: renesas: Add SYSC driver for Renesas RZ
 family
Thread-Topic: [PATCH v4 1/9] soc: renesas: Add SYSC driver for Renesas RZ
 family
Thread-Index: AQHbbbkE5yTVpQolRUmDpJuVfHP5ObMl+dsAgAAKNBA=
Date: Fri, 24 Jan 2025 15:24:30 +0000
Message-ID:
 <OSBPR01MB2775B7168E863DC594928F5BFFE32@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
 <20250123170508.13578-2-john.madieu.xa@bp.renesas.com>
 <CAMuHMdVwSw8Psuqw6enXHjNoeoTq=D0B9ZaKh_X9bHsiOA0z_Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVwSw8Psuqw6enXHjNoeoTq=D0B9ZaKh_X9bHsiOA0z_Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|OS9PR01MB14257:EE_
x-ms-office365-filtering-correlation-id: a7bda3a6-be1e-41db-2b52-08dd3c8b328a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RHg0RU9xRzN6WnZmRnROTFEwSWVrRTlZVklsNlhwMFV5MTNJYndyU1JCY3By?=
 =?utf-8?B?RzNyVHBOT2o2b1ZHQkJlWFJkVUxFaUNRbmhreGxhd290WW5KbWdiUGtaNWFE?=
 =?utf-8?B?eWl0WWhaNTVxUWxSWG9reTJ6UkNmNnhhYXVPTTQ0WnNUTDJkOU94Vk1vTlZT?=
 =?utf-8?B?eVI2S3Nla2diZjJnTVkvRDZPMEgwbzNVd0wzcVVXSXdqSnpxdlZscEJQdXJN?=
 =?utf-8?B?b0k5ZFl2Z0JxMkJUUEJnNFR5NHJaWTJqMUdabUVFSUpta3FmM3JaTUdMM2o2?=
 =?utf-8?B?ZGswQkorMzJsZFpjeFF1cU5iaUhpNGI2bnkzcUdiTDZvMlNURWx3eFdPV01n?=
 =?utf-8?B?MHlVM0ZJN2o5R1NIU1E4TWVKNUNKZlRpRWRSOEdhZ2I3RGtXaGdFRlN3d0Iw?=
 =?utf-8?B?TktpYUZaZDE0d2NscmNBSnpFdDRCL3BMa29LRHhTZG9SOWo1bndBSnlwamFW?=
 =?utf-8?B?dVk4TGVzbkhZSmE2RjZ1TEVVangyWENMT3RtOG5WNjF2ellhWGVnT2FxSTho?=
 =?utf-8?B?VzhxZzllUm9lQnhjbUZ5bkV1S0VHL2c3ZkZGZnhtcWM4OXNFbEhSMUMxQ3pH?=
 =?utf-8?B?cEJjVC9FUzNJR3BxWDRFWENaejFTS1RvdTZ0QlMwb1pFQkxuZmhCem9SY2ZX?=
 =?utf-8?B?Q1g2SVFGMDIwQzl4cTdJN0RWaVpwdk9EazdFVmRiU3hhOGdKclh2K0xBMjVO?=
 =?utf-8?B?TndUTjZ6TEc5WHgvT3N1ZlZGWWU1dUlxTngwSCt6cW1NWndVWFpJR3FyVkpI?=
 =?utf-8?B?cGg5ajNManNZRm5EZmY0cWo0NWliUDQzWnlMbFA5VEdFaXZqMXNvQXdsV3k2?=
 =?utf-8?B?Zmg5VExVUzFrRHJiS2tMQ1Q4Ym15cytDdXJqNktGRUhnR0RWcHJtbjdxbWl2?=
 =?utf-8?B?ZFpZTzNYcmlTYmg5bSt5SU81TEZrM2ZyUU5kL1IyRERDbUtlL2lBWW5xa0lt?=
 =?utf-8?B?ZDFIUEVQRjlZck9WU3hCVVVvQjZ2RkJWWkZWMWdlUHh4eHVvMDdtSlUxU0Zi?=
 =?utf-8?B?M3Q1SnpYUFlQZURwYXJKZm9ya09hV3lQaG43Qlc0cCszaW5mT1dqcFFJRzNR?=
 =?utf-8?B?TUlwMmduTFVrUVN3c2wwTG1XOVg1QjJTalB3cHpMTWNBR1QxVFZWekZueFNx?=
 =?utf-8?B?UjdXSUsvZS80SlR2QnZGN01jTE9qLzdoeTU1T2JyUVFwelhwMGlFY1FiaDJl?=
 =?utf-8?B?SEVCMXhWZ0NNd096QlRjN2lhYVJybDdPQkxVeU8vM1BNelpGZFpXR1BMdGJG?=
 =?utf-8?B?OG9aVnQ1VythWGlUbFBKRTQ0d3gwcFpLSDIybVN5MHNpOVNxRlJtZE1NVnRE?=
 =?utf-8?B?UmFqb0hzMVVlTTZ0eU9KeVNaVXRlazN3L25jSmlJZFpTUUs3S2NSWXh4K01z?=
 =?utf-8?B?T3BFRVlSd1lJTmNYaGxzQmZrRitwTG9KOTBteitibU02bXc1QUhsTlpZRy9R?=
 =?utf-8?B?eEROaVFPVW1GN2ZYWUpYMWhFcDRmY2RrdkxJdjc5R0NmakpmYVg2MEIvNVRP?=
 =?utf-8?B?NzZMVXVzU1dEQWhkVmZSVmlnODVmYWJ0L0NPTGJmTFhiOW9BT1Y3alpzMkJW?=
 =?utf-8?B?ZnFVV0tCbjB2L1RFUWhIUmFERjFwZE56NWUxNGpQTG9xYzJLRlI1bFpKbGJ3?=
 =?utf-8?B?R2RrcFVIYjdVN1BnOEtXbFMrMzgyLzlEMTZHUnRQOXorelAxMUFZNGxsRmVp?=
 =?utf-8?B?Y2t0a3MzTnVBVTFENVBZZjd2NFhHR2xldXUwL1hPSzJqM1lQdk5NbGU1Nk5Z?=
 =?utf-8?B?Uy94eE11NDE4WGhSMFQyMEYyVFowME8xS2FQS2JzL1VNdWlyQWZIZ0JNTTVG?=
 =?utf-8?B?Y05CemwyNzR4dWNZV1dnNHNxNTZZYzNnL3BVSDdvTzlwZlN2clRHWWdIN0I1?=
 =?utf-8?B?d21qRXpsemI3RkloY2dXdVphTXlwY1p2d0JqY0p4R2VkSUdPeDVUaS93cHNa?=
 =?utf-8?Q?VDW0bQrG22x3PaS8DKVpK9MiUFpwd4W2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWtnL2pSZkdDaUxNTEN0OUl3dnhTU3lORmFTTkJVUTdyT3RDaCs2ejJQbWE1?=
 =?utf-8?B?bkdhWWNZUHFvRHFRbnhzdjZFWXdXcmYyM0xIdHdxWlhBNnVRZ1VsWjVoY0V0?=
 =?utf-8?B?akxJZXltOTg3NFpwY29VK08wd2thYWNvOWd1ZG8vZTY1S0lvaDJOZC9PUjFm?=
 =?utf-8?B?NXhSRDRiSkYxVzNQTGNwdVl6OERFQXY5aldjRlFWYksxNmppUWJmV0NPYkM0?=
 =?utf-8?B?eW9IQWs5RjFvbGJhLzg0SVBzbWpJM0JtcGxIb3pVU1h6SHMyTWtxYWkzaFEw?=
 =?utf-8?B?VDV5OVJRT1VXQzR6YzJPcWdRRG5rTEErcHYxanQvY1YreXlJVGtCRlR6RDM3?=
 =?utf-8?B?WVo2NW5xTy8rNEI2NFYvd3lDKzZlaTdUSGlGR3llSVU1QnhCSGZTanA5Ri91?=
 =?utf-8?B?L3FIajJ4eTlsc3NURXJ1dkNSTnNpdExtaEx1OWNyV0NLYWFsaGl2UFJQdVBH?=
 =?utf-8?B?Zk8rckhXYmUwYWNnZXUvZEVKakNkSFJYNEhIeGFjN2lZQ0JzT3lkTlhLa3VK?=
 =?utf-8?B?REtNYXFEOWJMM2EvdURtWkIyTWxrNmt5dFhYbldxbFdrMGhmd3FIdkxLSXRu?=
 =?utf-8?B?MUVOTmVkbitnR1pJYXJWNitPUEgvcFYwRENHOXZCS21Zejk0RnFkRUZINjAx?=
 =?utf-8?B?WC95cnREUWU3RndjbjVJbnZpUUVhNlhsYXZWSjgrQ25RSlRFL1Vlc3prL3Rq?=
 =?utf-8?B?dnNNd0M0QU1acm1CeUgrNHBxcm1uZkdLeTRCeFRTeWprTkZpd2x3djNaVEYz?=
 =?utf-8?B?bnNmZkJpNlRlamphWUNXL2ZIbW8vaVZZd05icmZoak1FankrQnI5L2IxSGJw?=
 =?utf-8?B?cmFrTVNpNkNDM0xWZ044VlBUWTIzOEczZEhxZW4rTUxOUHlvdnhuUUo5SVdI?=
 =?utf-8?B?SUErVi9kODdCcGRLY3pNbWw4Nk1FUWpsOHRWTDRodmlSN0pyRTBWNnFTZ2FT?=
 =?utf-8?B?dTdxY1RSOFgyTi9RSzNZY0dqb2pRL3Ezbng5K2hRampuMU5MdGJyZUtlMnUr?=
 =?utf-8?B?N3RobFptOWRnbWZXQ3orYnM1WGowSzh1SVE1ekVxTlVlQkpjNjlmOHh5b2oy?=
 =?utf-8?B?Kys3Z2M0ckt6TkFiNTl3NTM0LzZkRUR2MWRBOUZIS2IwK2c3R1N1Ny9IK0tu?=
 =?utf-8?B?cG4xYTNhZVZJMnN2alJ5aEVwS1duVDIzNTdXTHFqcGpLb0daelpIc09TR1lB?=
 =?utf-8?B?c0hJcVFhZFRiN2hHZWp3YzB1dG9idUxOci9sYXpkMTBGNnlRMlRLNTUvRmh5?=
 =?utf-8?B?Yjk0c3BYRjI2bWxQOXZYS0ROVmlJSFlkZUtYdnZzSnlJTXpQbm5XbE13d3Ew?=
 =?utf-8?B?RGw5Wm03dDc5S3hkaUFQQWlLV1NBOXl5NkdXcXhpWW42dUlCZzE0dU0xektB?=
 =?utf-8?B?SkJ2SFdtZ3RnbTU5bWFRcDhwZWZDUWpMY2svQ3h2Qkt0dk5pS09tOGg5VGlz?=
 =?utf-8?B?c1JnOFJQSVMyeG4xMUtnRmY4QnZxTEU5SmNDTU1ldi9Db1RSY1ljdDlaSTY4?=
 =?utf-8?B?RTlHTkFBY3BOZndxaFBoVHpCem8vV0FoNjA1dEVlWGtTcGV4U2ZiUk5TOTV6?=
 =?utf-8?B?Tlk0dElISWVRQnB4WlRhL1ptYno4a09TMWRUQnFlV3FTOWZGYWtNcXoxaG96?=
 =?utf-8?B?cDVncU4yRk1FSHFtalhnbUlUOTl5QTdtY2pUSnYrQjlkUTJVbFFkTFBvUHAz?=
 =?utf-8?B?aGVidlVqOUdZWmczL3A5M2g0WU5VWTNoQmc0OG55Y3BnS3Roc3RwUXh1ZDhr?=
 =?utf-8?B?cE1GRlJ6bllzNGxyQ3paL3VtL0RCY3JjaGdkQlZMUkxpYzlLMnZ3UlFXNDRu?=
 =?utf-8?B?Y3pBZDh2Tml2QlY0V2E0OVpKYzl5ckc3U3Q4c3pQUldRb1c4M2hOVG9KYjFW?=
 =?utf-8?B?Z283dDlzR0xaaUlGSTFYRVlTb3UrZmkvVEMyNmNkL1c4Q0VNS2Y4c1M3ZVpi?=
 =?utf-8?B?aWRwQzJESmd5cWVrSzVVY3BRVkp1aHJBTVFvbXMvRUw4Qys0VjZ1Q29jcUhQ?=
 =?utf-8?B?aGpvUkIvQ1J5RVJTT25UOTZrUzBOU3pYMVhCUGlPUmhFb1Z3WWlheU1vZHdD?=
 =?utf-8?B?d2FrNkEvR1MrZFZycDNGenpUbDZnS2NlL1N0L0UvanpGWGpBajRCbU9QY2o5?=
 =?utf-8?B?VitVQVNnbEZUQTdWYkZkUmJJakJsUlp5RVRtY1JHZjFsZDR4d09uZUNmQktF?=
 =?utf-8?B?TVE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bda3a6-be1e-41db-2b52-08dd3c8b328a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 15:24:30.2053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8D8Wwn/hlJJmUzcpNPLvqS/pyhThDAJ1Mj9dQUxMS74+MmBOzjduMeUWrXwEH+6HX2ujflkFZZim7nrIif38wnE/xiZysYqyW1W6X0/JF/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14257

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDI0LCAy
MDI1IDM6MTcgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzldIHNvYzogcmVuZXNhczog
QWRkIFNZU0MgZHJpdmVyIGZvciBSZW5lc2FzIFJaDQo+IGZhbWlseQ0KDQpIaSBHZWVydCwNCg0K
VGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiANCj4gSGkgSm9obiwgQ2xhdWRpdSwNCj4gDQo+
IE9uIFRodSwgSmFuIDIzLCAyMDI1IGF0IDY6MDXigK9QTSBKb2huIE1hZGlldQ0KPiA8am9obi5t
YWRpZXUueGFAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEZyb206IENsYXVkaXUgQmV6bmVh
IDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFRoZSBSWi9HM1Mg
c3lzdGVtIGNvbnRyb2xsZXIgKFNZU0MpIGhhcyB2YXJpb3VzIHJlZ2lzdGVycyB0aGF0IGNvbnRy
b2wNCj4gPiBkaWZmZXJlbnQgZnVuY3Rpb25hbGl0aWVzLiBPbmUgb2YgdGhlIGV4cG9zZWQgcmVn
aXN0ZXIgb2Zmc2Vycw0KPiA+IGluZm9ybWF0aW9uIGFib3V0IHRoZSBTb0MgaWRlbnRpZmljYXRp
b24uDQo+ID4NCj4gPiBBZGQgYSBkcml2ZXIgdGhhdCBpZGVudGlmaWVzIHRoZSBTb0MuIExhdGVy
IHRoZSBkcml2ZXIgd2lsbCBiZQ0KPiA+IGV4dGVuZGVkIHdpdGggb3RoZXIgZnVuY3Rpb25hbGl0
aWVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6
bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gTWFkaWV1IDxq
b2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2NDogTm8gY2hhbmdl
cw0KPiA+IHYzOiBOZXcgcGF0Y2gNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL3JlbmVzYXMvcnotc3lzYy5j
DQo+IA0KPiA+ICtzdGF0aWMgaW50IHJ6X3N5c2Nfc29jX2luaXQoc3RydWN0IHJ6X3N5c2MgKnN5
c2MsIGNvbnN0IHN0cnVjdA0KPiA+ICtvZl9kZXZpY2VfaWQgKm1hdGNoKSB7DQo+ID4gKyAgICAg
ICBjb25zdCBzdHJ1Y3Qgcnpfc3lzY19pbml0X2RhdGEgKnN5c2NfZGF0YSA9IG1hdGNoLT5kYXRh
Ow0KPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IHJ6X3N5c2Nfc29jX2lkX2luaXRfZGF0YSAqc29j
X2RhdGEgPSBzeXNjX2RhdGEtDQo+ID5zb2NfaWRfaW5pdF9kYXRhOw0KPiA+ICsgICAgICAgc3Ry
dWN0IHNvY19kZXZpY2VfYXR0cmlidXRlICpzb2NfZGV2X2F0dHI7DQo+ID4gKyAgICAgICBjb25z
dCBjaGFyICpzb2NfaWRfc3RhcnQsICpzb2NfaWRfZW5kOw0KPiA+ICsgICAgICAgdTMyIHZhbCwg
cmV2aXNpb24sIHNwZWNpZmljX2lkOw0KPiA+ICsgICAgICAgc3RydWN0IHNvY19kZXZpY2UgKnNv
Y19kZXY7DQo+ID4gKyAgICAgICBjaGFyIHNvY19pZFszMl0gPSB7MH07DQo+ID4gKyAgICAgICBz
aXplX3Qgc2l6ZTsNCj4gPiArDQo+ID4gKyAgICAgICBzb2NfaWRfc3RhcnQgPSBzdHJjaHIobWF0
Y2gtPmNvbXBhdGlibGUsICcsJykgKyAxOw0KPiA+ICsgICAgICAgc29jX2lkX2VuZCA9IHN0cmNo
cihtYXRjaC0+Y29tcGF0aWJsZSwgJy0nKTsNCj4gPiArICAgICAgIHNpemUgPSBzb2NfaWRfZW5k
IC0gc29jX2lkX3N0YXJ0ICsgMTsNCj4gPiArICAgICAgIGlmIChzaXplID4gMzIpDQo+ID4gKyAg
ICAgICAgICAgICAgIHNpemUgPSBzaXplb2Yoc29jX2lkKTsNCj4gPiArICAgICAgIHN0cnNjcHko
c29jX2lkLCBzb2NfaWRfc3RhcnQsIHNpemUpOw0KPiA+ICsNCj4gPiArICAgICAgIHNvY19kZXZf
YXR0ciA9IGRldm1fa3phbGxvYyhzeXNjLT5kZXYsIHNpemVvZigqc29jX2Rldl9hdHRyKSwNCj4g
R0ZQX0tFUk5FTCk7DQo+ID4gKyAgICAgICBpZiAoIXNvY19kZXZfYXR0cikNCj4gPiArICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsgICAgICAgc29jX2Rldl9hdHRy
LT5mYW1pbHkgPSBkZXZtX2tzdHJkdXAoc3lzYy0+ZGV2LA0KPiA+ICsgc29jX2RhdGEtPmZhbWls
eSwgR0ZQX0tFUk5FTCk7DQo+IA0KPiBNaXNzaW5nIE5VTEwtY2hlY2sNCg0KTXkgYmFkLiBJIG1p
c3NlZCBpdC4gSSdsbCBhZGQgaXQgaW4gdjUuDQoNCj4gDQo+ID4gKyAgICAgICBzb2NfZGV2X2F0
dHItPnNvY19pZCA9IGRldm1fa3N0cmR1cChzeXNjLT5kZXYsIHNvY19pZCwNCj4gR0ZQX0tFUk5F
TCk7DQo+ID4gKyAgICAgICBpZiAoIXNvY19kZXZfYXR0ci0+c29jX2lkKQ0KPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKyAgICAgICB2YWwgPSByZWFkbChz
eXNjLT5iYXNlICsgc29jX2RhdGEtPm9mZnNldCk7DQo+ID4gKyAgICAgICByZXZpc2lvbiA9IGZp
ZWxkX2dldChzb2NfZGF0YS0+cmV2aXNpb25fbWFzaywgdmFsKTsNCj4gPiArICAgICAgIHNwZWNp
ZmljX2lkID0gZmllbGRfZ2V0KHNvY19kYXRhLT5zcGVjaWZpY19pZF9tYXNrLCB2YWwpOw0KPiA+
ICsgICAgICAgc29jX2Rldl9hdHRyLT5yZXZpc2lvbiA9IGRldm1fa2FzcHJpbnRmKHN5c2MtPmRl
diwgR0ZQX0tFUk5FTCwNCj4gIiV1IiwgcmV2aXNpb24pOw0KPiA+ICsgICAgICAgaWYgKCFzb2Nf
ZGV2X2F0dHItPnJldmlzaW9uKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsN
Cj4gPiArDQo+ID4gKyAgICAgICBpZiAoc29jX2RhdGEtPmlkICYmIHNwZWNpZmljX2lkICE9IHNv
Y19kYXRhLT5pZCkgew0KPiA+ICsgICAgICAgICAgICAgICBkZXZfd2FybihzeXNjLT5kZXYsICJT
b0MgbWlzbWF0Y2ggKHByb2R1Y3QgPSAweCV4KVxuIiwNCj4gc3BlY2lmaWNfaWQpOw0KPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4g
KyAgICAgICBkZXZfaW5mbyhzeXNjLT5kZXYsICJEZXRlY3RlZCBSZW5lc2FzICVzICVzIFJldiAl
c1xuIiwNCj4gc29jX2Rldl9hdHRyLT5mYW1pbHksDQo+ID4gKyAgICAgICAgICAgICAgICBzb2Nf
ZGV2X2F0dHItPnNvY19pZCwgc29jX2Rldl9hdHRyLT5yZXZpc2lvbik7DQo+ID4gKw0KPiA+ICsg
ICAgICAgc29jX2RldiA9IHNvY19kZXZpY2VfcmVnaXN0ZXIoc29jX2Rldl9hdHRyKTsNCj4gPiAr
ICAgICAgIGlmIChJU19FUlIoc29jX2RldikpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBQ
VFJfRVJSKHNvY19kZXYpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+
IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL3J6LXN5
c2MuaA0KPiA+IEBAIC0wLDAgKzEsMzcgQEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAgKi8NCj4gPiArLyoNCj4gPiArICogUmVuZXNhcyBSWiBTeXN0ZW0gQ29udHJv
bGxlcg0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgUmVuZXNhcyBFbGVjdHJv
bmljcyBDb3JwLg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpZm5kZWYgX19TT0NfUkVORVNBU19S
Wl9TWVNDX0hfXw0KPiA+ICsjZGVmaW5lIF9fU09DX1JFTkVTQVNfUlpfU1lTQ19IX18NCj4gPiAr
DQo+ID4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAq
IHN0cnVjdCByel9zeWNfc29jX2lkX2luaXRfZGF0YSAtIFJaIFNZU0MgU29DIGlkZW50aWZpY2F0
aW9uDQo+ID4gK2luaXRpYWxpemF0aW9uIGRhdGENCj4gPiArICogQGZhbWlseTogUlogU29DIGZh
bWlseQ0KPiA+ICsgKiBAaWQ6IFJaIFNvQyBleHBlY3RlZCBJRA0KPiA+ICsgKiBAb2Zmc2V0OiBT
WVNDIFNvQyBJRCByZWdpc3RlciBvZmZzZXQNCj4gPiArICogQHJldmlzaW9uX21hc2s6IFNZU0Mg
U29DIElEIHJldmlzaW9uIG1hc2sNCj4gPiArICogQHNwZWNpZmljX2lkX21hc2s6IFNZU0MgU29D
IElEIHNwZWNpZmljIElEIG1hc2sgICovIHN0cnVjdA0KPiA+ICtyel9zeXNjX3NvY19pZF9pbml0
X2RhdGEgew0KPiA+ICsgICAgICAgY29uc3QgY2hhciAqIGNvbnN0IGZhbWlseTsNCj4gPiArICAg
ICAgIHUzMiBpZDsNCj4gPiArICAgICAgIHUzMiBvZmZzZXQ7DQo+IA0KPiAuZGV2aWRfb2Zmc2V0
Pw0KDQpXaWxsIHJlbmFtZSBpdC4gVGhhbmtzLg0KDQo+IA0KPiA+ICsgICAgICAgdTMyIHJldmlz
aW9uX21hc2s7DQo+ID4gKyAgICAgICB1MzIgc3BlY2lmaWNfaWRfbWFzazsNCj4gPiArfTsNCj4g
DQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCkJlc3QgcmVnYXJkcywNCkpvaG4NCg==

