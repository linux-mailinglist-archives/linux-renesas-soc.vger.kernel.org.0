Return-Path: <linux-renesas-soc+bounces-13002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9615A2EFB2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A32D18874F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DEE2528EF;
	Mon, 10 Feb 2025 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="drEw28Vc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A06D2528E1;
	Mon, 10 Feb 2025 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197584; cv=fail; b=usqw+1elLLx3LP9/TFBwjbkjAVGHxsG7an03e8tuM6Csph1FsZjQxVGAVMvAsPB1hPRdxS/m0InL4x1mGxXBn7M1DdutQ2QQRl2PhIoW637SZKf0mHfcL8t0j3oDOo4Ypmb+D7Zg9FJV/YYEVeadL9uNH7yiLBcIxc0JZMieNDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197584; c=relaxed/simple;
	bh=rpZg89SmVNUXGuFL/WYxCaIutDWu0j+9COHQzDRoaMc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UPVKQSdL9qJrR5X2mgykUm5D8pIKn7jrRGBrYj956yeGphSLGIlFbe4qXC2ZEiDYU1nM+9u69Gk/0aX/vOANXMmshNX8G5XTkBPxQnthdoYn/e8W+IHckh5Iy04lHNcwKP/FU7mABv774GkFGHkveyuTumOrcrCSwez0OR/NGvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=drEw28Vc; arc=fail smtp.client-ip=52.101.125.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5T2MLI30BGkY6Z8UzAdcdOdA3SmmuLvLPADK2kl+mtQCF9OfXvJ+RI3Oie8/yw1xguVR6oHr6yBpKEF29HANU2Z+NWZmVyQE+hA56I7zv2sjJO+m5n9VWpKujDXAtK4/9K2Wf90Ho+dKgLUe9AOUHOzGcNYkWzC0jLTmZaVZlpOtdPFnNx3LQE09gIvmsxrtxHwEOdBm6OOBa3qxNwbNXF2PNHdkuF2tG7UXhnd8j5/E3hDLzLuypc2ENygourqxZJdxqlpNTAh549YeJJqPLYD2PWaDncJjpZzeLa55YLSI4UIHRtv98bHMOyico9Ay+fdr4RbeaOIe6hY1xOhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpZg89SmVNUXGuFL/WYxCaIutDWu0j+9COHQzDRoaMc=;
 b=sFMDFsGl7K2YkQwfPPmHoHBDw2U7nwnCF/dGuvLruhsXN5M0PYq7JBZ/rH1gfwWLJBhUEbYkjQkgK/5YXAhk3xAxGDzqHPH+LgNx8k4Y2h2B5SYIRvIsvmdTZ8IAyRvlvNZqrAIdUnKS9SiGo4JCBD0be1DSEdPyCrsZ3aYCLDx6y7jmS5hfQgDe+RwKtO7TBfWT8CbOIIoAWKzQS8xYxZpNSDStPUiAo1OsqmflZB/KzCnuSxSlTKJOvm/+8ibK9givxvxDOX9SI6MDd/XVSO6raHqasADG/DcDYpEVWBls5rDPEIgbPOwB7F6sKGs8HOKJE8HHxckqFgVxDbLlbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpZg89SmVNUXGuFL/WYxCaIutDWu0j+9COHQzDRoaMc=;
 b=drEw28VcYQlqWqPh4zVM45ckgDSzFvwEbXDahQQlVFQeukJWvdDDdTb/xnULgkPKjcqPkby83uFt3r0wmvgybMUKg6O9DfleLyEcjIllaK8mRaG+tcRRStUGkJ5JtIrDt6bMj627bmABn3+Q/NxQeDpV4ZoqVFu4IZgMtmJW6EA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8401.jpnprd01.prod.outlook.com (2603:1096:604:16f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 14:26:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 14:26:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
Thread-Topic: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
Thread-Index: AQHbcm43r4oLrSpVA0ON7evH4m8LNLNAlqCAgAAAnrCAABBIAIAAAZ4w
Date: Mon, 10 Feb 2025 14:26:17 +0000
Message-ID:
 <TY3PR01MB11346D0C3FA9E451ADD3F5BB386F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVB2W6R+xYeTUKSv_dMGruECSft-P19m6nZD61=ROngXw@mail.gmail.com>
 <TY3PR01MB11346D5D895C190EBE8C8A84B86F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUpaV71Svyenq=hXMk3GfjgZvHn-0APkv_LKSzyytKzag@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUpaV71Svyenq=hXMk3GfjgZvHn-0APkv_LKSzyytKzag@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8401:EE_
x-ms-office365-filtering-correlation-id: 85c37311-183a-4dc4-f650-08dd49dee17e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M3haTXQ3UndYWFRDMzFTWll5Y3ArWFBxSWNjaVZsS2JONjNyOGhOTDZHR3Vp?=
 =?utf-8?B?MDhpbHpBcDZzNWtaN0lXMUg4VnJCQzNNMnlLWGtsZW9sbFVCVmlYckNGT0Zl?=
 =?utf-8?B?dkF0VFZQOWFRTFN1T2pzakp3N2JtcEZZWkdDMUw3YWNTUmFNRUNWWkkvdEdN?=
 =?utf-8?B?TGsyUlJDTCtGOHN6SUNoeVRiNzNNS0RUYlAzVTBqTGJSdXZFVkdsSEJyVW9u?=
 =?utf-8?B?NWt5WkE1Ty9yQkVvUlJuZjY2WnhFMU5Oc0hRT0VBRGpsVFpNRkdTNjQ0SWJT?=
 =?utf-8?B?OFZxTUJ0a3lqOCtyVWlha2Y5NzFTWEFhTVJTa2VGTXFlM1UyRElVSGRDQzR0?=
 =?utf-8?B?VkQyYnRZaE1oQUVUZkhhWmJzamt4dVF1Wkw2enhnM3pEUGRFd2FlVEVJNTdj?=
 =?utf-8?B?cEprTmV5cy9LM0ViY2tERHFlcVNZTFZDVE02UEEwR0F6TFZYUkI5cXltL2Rp?=
 =?utf-8?B?alVzWUNiV0FrTWJyWndldjNCdmxneUVPcTl3bERzSWFENTNzemcva0xycENS?=
 =?utf-8?B?bFYwbU5IMk5Ydy9RRWduOFNqWjMwZ0h4NEo4OGp5M0ZIUWRtNVlNVXdyVURu?=
 =?utf-8?B?MFZZZTFkbENwRVM2Z3lUNHNDRFJjcUR6akx5ZFhRQWd5V09CS2FwODVlQlhZ?=
 =?utf-8?B?a3F5bkZCNTJLMVdrY081V3VpbVNudWZ6T1ZZV3pLNCthUzhWdU9IMlQ0cjg4?=
 =?utf-8?B?Qm5mbDFzMyt0dGJSSHV4NmVqaFRXdGpFcTBPemxwK3R6aTJ0T3RSZmZMYXNt?=
 =?utf-8?B?c0s4Y05kWTZlZWVSQkdkZVg1VEFUWU9sOU9uN1liSkR1YkRzckhrRjluclh5?=
 =?utf-8?B?WnFuV2lQTlBoQmZsM2N1NjhxcE1VejNUSHNsaFFOa0hTVUx0UmttV1A1VG1Q?=
 =?utf-8?B?c2Z3Z0xydlpGL1VsOVFaOGRhbzd1QmdvM1RIUXhrS2YrUkx2cVYxS25mVVJT?=
 =?utf-8?B?OEkzZXB6MVU3c2hUeGNLV1NDMVNQaUJxUHBYQVdka0p4ZHdHZmdNVTVLRVFI?=
 =?utf-8?B?cjBkSXVTN0oyNmpaaDlCaUFwUkxubndVSlNiV20ySVIvak9ENXVYV21kMkZx?=
 =?utf-8?B?bnNKelpFSHZRQjdjSmVOWTZ3blRlY2tMOU1uaGw2dFprVHVuUGdaRUFkdkdF?=
 =?utf-8?B?d2txdkd1YzRHREhYN3d4bUhuWVZXUEdkSEtiWEppQ1lPVmx5aUFac0ppUWE0?=
 =?utf-8?B?TzAybXpBeUNJMjd0ajcyWWJ5S2p4dS9xOXpoaVBnSllmTFQzRmNHRGR1UjFZ?=
 =?utf-8?B?SkRmS1NXb0lwRHVDTVNMeFBNbVR6V0x2OE9VNVBaenNja3k5aHlJdkxHekgy?=
 =?utf-8?B?Y0JqZTJ2eFhCZzFDL2VNbHVwMnBnbUZsSlhkNCtRZGdJdkN5aW1jNTJQeFBs?=
 =?utf-8?B?aittUUpGbHFWTG5yaFlCTnpESHhzaW5RblhyTGtORXNzMUN2cXJzclRsUmMz?=
 =?utf-8?B?NE4rWTE5TUpVdTA2YkJ1dUVqVXE1d0hvU3Rwd2dJd1ZUVDU4ZVJzbHJwN29I?=
 =?utf-8?B?N0FZbW5sY3p4YjZNZGtQNTRLNldZbGFJMmpDZkVJRVQrdWxwSGcrWWZxK3pT?=
 =?utf-8?B?RWhxclNVU3daLyt0RWZueExyMnNvbnlvelFLMjZMSzhJb1hiWkdZME9CajJl?=
 =?utf-8?B?WURYdTF1SGZUcDh1bWdGRTZtbFcyREhGWVlETldra0pYM3FlYldub1dJL1F2?=
 =?utf-8?B?SDdlOWxObEthTGcvYlFiZzAwQ25wRDAzMHdHUUs1UElIT2plSWRwOUlCclBQ?=
 =?utf-8?B?c2pzamhyOWpVcno0VGtwSUJ4U2pzTHdwd1MrL2ZkZU9ZamtGaWtrcW1sQzNM?=
 =?utf-8?B?c3pZMk0yamZ5RFdhbVJvNTVVTUwremRtZFBrTzl6M3RsRFRBdStZaU03c0Vq?=
 =?utf-8?Q?nypFPgwfuW+T4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTVZNTFyUkJpaFR5Z000aEl3Y3YyejUvYVhtN3U5bjhpSUNlK2Y5dnJDc2dm?=
 =?utf-8?B?OXMrYUd5M1hiRzZqbWNER3l1RG5YbitxazdCa1JhdUcyb0VoQkNqZE9mVW93?=
 =?utf-8?B?QmVuN2J5KzlEZ21hQWgyallQVkRtSnp3SVk1QlNzNDlvRmdTMXJ4ZWlYTnBN?=
 =?utf-8?B?ckF0RUcxM2gvRUczWTNWSkc5U2ZxaW5WMmdwbkwvUjVKMEtpUWZQNHpuTWZk?=
 =?utf-8?B?azRkVUZhMUpHbFFVMTdTcGlhQUlHOE4wcGp4emYxTWMxUVlOSHJtSWV0NFNC?=
 =?utf-8?B?a3ZEUHJRbzN0elRRb0tidWFMV3JlZDhacXRYZVp0cjkzcUJ3ditURUZxRml6?=
 =?utf-8?B?T2ZBaFJxeXVKWE5BYUgxNkRzVHI2emhLYWJlVkhualRoWWg1OXV2YVpDeFFN?=
 =?utf-8?B?aW9Rakt3azU4T2dHdWhmVGovL25RVXNVMUNpOXUyc0pBMFQzckZuZjIxclF4?=
 =?utf-8?B?RWdORkxvbTN1eWdQenQ1Q0dwUElCd1dsZ2JRS0JweUliZFU4Mk52SC84OFNM?=
 =?utf-8?B?R0JhWFg1M0RDNWJQUWZmVE5ocDUyZnk0OWF3TmdPOHVKWFUzeGR1Z3M4WVV2?=
 =?utf-8?B?NCtMRlhjV3Qxb1dMWFBkcFRTZmxqWWVvQmR2QlRrdG9sVkV5NXRkMWFLNHZa?=
 =?utf-8?B?L2s2M1JDejlwS0hKTTRkY0xzLy9OS0hWM0RieEFDOUdSd0V1c2QzVkg4V1hX?=
 =?utf-8?B?L0tzL3N4ZHI3anhRd3Awa1k5c3BlUUs4Vkwza0NnK1FoSFhTK0NUMERxdldi?=
 =?utf-8?B?YnIyK3k4Y3BGUDhhMHhGN3RIQ1luWjBVSWlHTVFVSlNhd1IwU0dDd3E1eThY?=
 =?utf-8?B?NXM3UlpVcXhyNkI0bitRamxCb3lmNE5pNS9IY2xHdWpaKzQ2Z0hjcWNKSldR?=
 =?utf-8?B?cW1zSXlXaWFvZHlUbXpzRmtKWWRkckNYKzdWcmw0cm5nVGFYL1U5OEtMdVlF?=
 =?utf-8?B?OWE1TEs2N2l4K0pveUtVdHZ3SUswakdMSkNqSU1WbFg5aHg0Nm9KMytxbzV5?=
 =?utf-8?B?UDFUc2tkUnkvWDg1Z1RzeExFTTA4cU9kS0FBS0pERWZtVXBkd1hDSW9UTVFF?=
 =?utf-8?B?U3FEd2dBYmcwMmRnSmZLOWVFVnllSWlhczJidDhIMENaUUVMa3dpcVZjUGc2?=
 =?utf-8?B?WFpBRUVGQ0VJcGdnZHhxYSsralhmTEp0UHBYMlhsTDgxRTN1RVlKM2lraGFV?=
 =?utf-8?B?M3pDWHNDWDVBcGZTUXo2WHQ0SVdyTFJoLy84TUFGU2UzOWFYemtjdEVCQlBC?=
 =?utf-8?B?bWJkL0hhS2E1U0lLd2VXbGhrWFhXSXdNVHA4S2Q0V0VNL2hpS3hGUkJzYmhP?=
 =?utf-8?B?WENEQjZiZ1JCK25wV2M4bnVYT0VPS0JyU0FYN0Y2b1ZaOG1sd3hkUUpjSFhj?=
 =?utf-8?B?ZTdSbStVbTlrSVJGd0tUSnhGWmQ4ZldkQnE0VWpyOVNjWTdMNnVuTGFSQVRX?=
 =?utf-8?B?Z2xUMjlLN1hQVXN0d2NOWG4wOEU0SnJBbTh2NThScUpJaGRIN3loaGdZMkIv?=
 =?utf-8?B?dzJKSlBZTTJ6b3FjY2N0V2Z1ckhlbE9BUmRWNHpjVUwxSTlvRXZ5K2I4cUpX?=
 =?utf-8?B?UjdhUmhzYVBnRktqM2lKbVorT05CYnJkTW1kbG1rZ3dmRkRmYXlTN3J5OTNU?=
 =?utf-8?B?VXVUcitncnAwMmh5S1A0ZGVUZFRoTlYreldXbVU4eURaaERudmYwaWpGN29U?=
 =?utf-8?B?eFNsUnQ4SlVTNmRXeTlSZ1kwY1l4Z0JQQnRlUlIreDYzODZaUTZZeVNwZVZG?=
 =?utf-8?B?VzlVVm02dkI1RjJzQ0ZhNk4xbHkzRlMvNUtBZkVSWE0xZEdkY3VuL3dyUERr?=
 =?utf-8?B?c20xMjlNcTJ4Z21IbnczRmVyc1lTdjh0eEhBeFJxQXUwTHA5SmZUdXJLdGJt?=
 =?utf-8?B?am11WUJMMndTcFFYZ0JoUFRldmE0WFBjVEFXT3IrcnNCUFpkNFFWeStvcjhQ?=
 =?utf-8?B?azZHd01kYm1DZnNmVjhhMDZqRUdGV0wvZ0Z4dFJhSW5NaGxsRlExQVNiemhh?=
 =?utf-8?B?azhTRkVseFJ3d1dWZHpYaFNMYXZXeFp2S2ZRQllORXNsL1QyeE9uK1NncENN?=
 =?utf-8?B?NERkQVJkZkNDVk5IY2ZncDlvbkxzbTdpSTlXOTRjT2FTbTZxejJlS3RGb3Mv?=
 =?utf-8?B?ditNNjRHU1ZFU2V5VE5HNWpidUFGTkV1by9ZYWtQQU1DS3F3ZHNJZ1BPZGhX?=
 =?utf-8?B?VlE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c37311-183a-4dc4-f650-08dd49dee17e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 14:26:17.1148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3t7FpOaHynZLClFRh2+pOB4k2BIedxtFncJVOAZTt2CwobpaEhUHArI/I08Qf6WMbDAnHz3unX7IVWt4jqoyBSgmxIJnr+YjVYIUZp+sKyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8401

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTAgRmVicnVhcnkg
MjAyNSAxNDoxNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAyLzE0XSBkdC1iaW5kaW5nczogc2Vy
aWFsOiBEb2N1bWVudCBzY2kgYmluZGluZ3MgZm9yIHRoZSBSZW5lc2FzIFJaL1QySCAoYS5rLmEN
Cj4gcjlhMDlnMDc3KSBTb0MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIDEwIEZlYiAy
MDI1IGF0IDE0OjE5LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3Rl
Og0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4gPiBTZW50OiAxMCBGZWJydWFy
eSAyMDI1IDEzOjE1DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDAyLzE0XSBkdC1iaW5kaW5n
czogc2VyaWFsOiBEb2N1bWVudCBzY2kNCj4gPiA+IGJpbmRpbmdzIGZvciB0aGUgUmVuZXNhcyBS
Wi9UMkggKGEuay5hDQo+ID4gPiByOWEwOWcwNzcpIFNvQw0KPiA+ID4NCj4gPiA+IE9uIFdlZCwg
MjkgSmFuIDIwMjUgYXQgMTc6NTIsIFRoaWVycnkgQnVsdGVsIDx0aGllcnJ5LmJ1bHRlbC55aEBi
cC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+IERvY3VtZW50IFJaL1QySCAoYS5rLmEgcjlh
MDlnMDc3KSBpbiBTQ0kgYmluZGluZy4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
VGhpZXJyeSBCdWx0ZWwgPHRoaWVycnkuYnVsdGVsLnloQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4N
Cj4gPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gPiA+DQo+ID4gPiA+IC0tLSAvZGV2L251
bGwNCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nlcmlh
bC9yZW5lc2FzLHJ6c2NpLnlhbWwNCj4gPiA+ID4gQEAgLTAsMCArMSwxMDAgQEANCj4gPiA+ID4g
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNl
KSAlWUFNTA0KPiA+ID4gPiArMS4yDQo+ID4gPiA+ICstLS0NCj4gPiA+ID4gKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvc2VyaWFsL3JlbmVzYXMscnpzY2kueWFtbCMNCj4gPiA+
DQo+ID4gPiAicnpzY2kiIGlzIElNSE8gYSBiYWQgbmFtZSwgYXMgU0NJIG9uIFJaL1QyIGRpZmZl
cnMgZnJvbSB0aGUNCj4gPiA+IHNpbWlsYXItbmFtZWQgIlNDSSIgKHNvbWV0aW1lcyBjYWxsZWQg
IlJTQ0kiIG9yICJTQ0lnIikgb24gUlovQTFILCBSWi9BMk0sIFJaL0cyTCwgUlovVjJMLCBhbmQN
Cj4gUlovRzNTIChhbmQgbW9zdCBvbGQgU3VwZXJIIFNvQ3MpLg0KPiA+ID4NCj4gPiA+IEJUVywg
SSBiZWxpZXZlIHRoZSB2YXJpYW50IG9uIFJaL1QyIGlzIGFsc28gdXNlZCBvbiBSWi9OMiwgUlov
VjJILCBhbmQgUlovRzNFPw0KPiA+ID4NCj4gPiA+IEhvd2V2ZXIsIGJpbmRpbmctd2lzZSwgdGhl
eSBhbGwgc2VlbSB0byBiZSB2ZXJ5IHNpbWlsYXIuDQo+ID4gPiBTbyBwZXJoYXBzIHlvdSBjYW4g
anVzdCBhZGQgdGhpcyB0byB0aGUgZXhpc3RpbmcNCj4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxzY2kueWFtbD8NCj4gPg0KPiA+IEl0IGlzIHBy
ZXNlbnQgaW4gUlovRzNFIGFzIHdlbGwuDQo+ID4gUlNDSSBzdXBwb3J0cyBzY2ksIHNjaWYsIGky
YyBhbmQgc3BpIHRoYXQgaXMgdGhlIHJlYXNvbiByZW5lc2FzLHJ6c2NpLnlhbWwgaW50cm9kdWNl
ZC4NCj4gDQo+IElmIHlvdSBwbGFuIHRvIGFkZCBzdXBwb3J0IGZvciBJMkMgYW5kIFNQSSwgeW91
IHdpbGwgbmVlZCBkaWZmZXJlbnQgYmluZGluZ3MgdW5kZXINCj4gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3tpMmMsc3BpfS8uDQoNCk9LLCBJIHRob3VnaHQgc2luY2UgaXQgaXMg
YSBzaW5nbGUgSVAsIHdlIG5lZWQgdG8gdXNlIGEgc2luZ2xlIGNvbXBhdGlibGUgYW5kIGluc3Rh
bnRpYXRlIGFwcHJvcHJpYXRlIGRldmljZSBiYXNlZCBvbg0KdGhlIGRldmljZSBwcm9wZXJ0eSBy
YXRoZXIgdGhhbiBzZXBhcmF0ZSBTQ0ksIGkyYyBhbmQgc3BpIGNvbXBhdGlibGUuDQogDQpZZXMs
IEkgYWdyZWUgaGF2aW5nIGRpZmZlcmVudCBkZXZpY2UgY29tcGF0aWJsZSBmb3Igc2FtZSBJUCBt
YWtlIGxpZmUgZWFzaWVyLCBubyBuZWVkIHRvIGFkZCBzcGVjaWZpYw0KdmVuZG9yIHByb3BlcnR5
LiANCg0KQ2hlZXJzLA0KQmlqdQ0K

