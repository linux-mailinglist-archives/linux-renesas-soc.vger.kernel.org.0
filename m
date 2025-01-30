Return-Path: <linux-renesas-soc+bounces-12749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06352A22D05
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 13:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05AB13A3333
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 12:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AEE1D5170;
	Thu, 30 Jan 2025 12:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uLn6zVwK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from outbound.mail.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5501BEF90
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 12:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738240870; cv=fail; b=tDEeIiBNF5wY+xIh6NzdxKL8MYkqLbzoFJDKmfpWPyLn0VSsO6O6VXViU18lYpJmS9Ow9v7dkniPQKseGKVuMsiMe7OnNjJp/urkUVn9YECXXSsPh3ouu+NbcmOCymeR08TzBzm6O9opt0iVf0Kz0g40xmHzKQsnl1ibVXnvmK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738240870; c=relaxed/simple;
	bh=pGEglIvCLc+2RIemH+MBhi6GO+/CnSykhxlXCtuexzg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gMXcvg5NY8/xvFqabizOq9+gBvHkQwJw1DxexoNmrdvrK0Csg8aMDoGIboDvxKlFju1Lu0UK47ZqNnQ4DQvyG9E1rQjwr2qaZIO+trsP/eFWrOcEu52eXAduUo8/FepNe0D5yzq+R21HNaBIUrN26HHIGarjCh4MMlJ2FcFXq3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uLn6zVwK; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwHePhfC2i1YA9aEL1b4LmvBGOIp7LPbG5BfOwvdFwUuldiy2Jgc/PRPnh9celZGbpYzAXxgq/9Iozfkrc7/BJVb187jZGRs2eaHKLl4g4J0J8RtZoVjpA/9RK5P0aTUhHu7VnAp9IzVRsRylVYUdknZNWcuLU/UZ0IEhTWgqT1VpiMWIGe510W+yA+xjgOjlqZuDYyrJSq8ik269EN5zO6CkpSIdbclDxuyX98Zb7nrjblUrrT4ldPxp9nU/IHH134o1Jqj4lLpT+6PpyFys/H5cIWzuBs0r0Ca3tS9mFcllpDuhj+i2s3URe2f6/D00gojbWEvftEUVKMvfCuqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGEglIvCLc+2RIemH+MBhi6GO+/CnSykhxlXCtuexzg=;
 b=ZoiztQ+wG2rVCI+bUFkPqEppzahO4qxUoPz6f4paUHrE6xJheO4BzKMb+m4wZX8Z4vZNShG1Iyh6fAdXrBWjvDX1IBI+wsoQ4BHS7l9IHdoOiipQYb+eMzgm+wJ/A0dfWE38VxS7qeCdCBkN+SCR9z4Uycn8z/kQYqNm6u6kTm2mJMSutqfyvpO5xs9fS9dJTwHltPOTaWMZSNSJzGeA+waIrSsR/Q9MT94/TVpKyo2ooh5moHITpWsCAVok4iSaLKKEpoQA9uVTYNsCZkSk1Omm7nQNZGG8PkTq9rfkETJVWCLLQMiXfNOVyE6y5EoUwd7c2cP5uy4PGH0CZES/XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGEglIvCLc+2RIemH+MBhi6GO+/CnSykhxlXCtuexzg=;
 b=uLn6zVwKGmdI8OaCDceYHq46r3CNmMdHyoUkVPKSuPz0OM+yhjubJYGZ4XzroF0mtOT1/yu3W/whben3DqJVhaF8jbNXPsK2zccYj1eZPuQjr6c8ymGYW/3xPAKAWHeIZrZjKN2HMHU5xfwBqxDVo0lm6Gwuf6KBUStyVlfVCSQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13112.jpnprd01.prod.outlook.com (2603:1096:405:1c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 12:40:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 12:40:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH v3 09/13] irqchip/renesas-rzv2h: Add tssr_k variable to
 struct rzv2h_hw_info
Thread-Topic: [PATCH v3 09/13] irqchip/renesas-rzv2h: Add tssr_k variable to
 struct rzv2h_hw_info
Thread-Index: AQHbcXIUgkJTqI7uWEuFQPDdG2koq7MsUlYAgALyHTA=
Date: Thu, 30 Jan 2025 12:40:24 +0000
Message-ID:
 <TY3PR01MB113460DC8C1B2353FE1B7F5D286E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
 <20250128104714.80807-10-biju.das.jz@bp.renesas.com>
 <CAMuHMdUeSQPPVUFDD75vJywLQeEDJq8zSb9ZFHkKdmzB7=J3nA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUeSQPPVUFDD75vJywLQeEDJq8zSb9ZFHkKdmzB7=J3nA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13112:EE_
x-ms-office365-filtering-correlation-id: 291419a2-ced6-425e-2552-08dd412b4446
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SjJVc21BVWtRbFlzb3FscG9sZ1UycXJIeGFXV2c3RDlqdmRwdlJvamtDa05w?=
 =?utf-8?B?YjdhbnF3MWtCeWFlYVhTRXFLN2w2SVU0elF6ZnFJYjhJS3UyYWFMOFBMTDZz?=
 =?utf-8?B?eXl3SG5uQ0huOU05NG5NdlhNVG5GcWgwUkczVy81YTFTVG5RSDhxNlg1OC80?=
 =?utf-8?B?S3EwV0N0THAxaG1EMkhJVFJEZ2taQ1hoM1BrWWRpMkdNT0l0NU1tVDF1amhv?=
 =?utf-8?B?R2hEWGJuWitxMHFnWXB3S2RtNFlvNjZaZ0xVTVhrTGo1SkFOQ28xdldCdWxD?=
 =?utf-8?B?TnNYZ2ZtK0lVU2VXaVJCbVdOblBTcWJHOG9uTkVjSjRKOFlEV1dwWU1jQmVX?=
 =?utf-8?B?ekRyeFg3MFRXaVR3Q1dyNXRBakpSTmkvZGhHbngzSklZeVBSV0RKRHpUR2Vq?=
 =?utf-8?B?K0MyaS96cExWUG9idXJrNEwzWnNqZUNiaXV1UUlKNkRaNlBIazBGUGdhWjNQ?=
 =?utf-8?B?aUNIL283Z2FLT3hhVnFtajYvd3hYUFp4TkZRQWs3dXV5endXbUlmR1VhdlBz?=
 =?utf-8?B?ejhHMWtZcmwzdEpTc3Fub1haaHY2MHNxYk5Mb1BYemdCRGFuTnRkQ1BGM2RP?=
 =?utf-8?B?Y0hmSW5lZXlkWmhFbmVEaU9FdENjZmhlY29SWE84T2FhN3BXTVRyRzlaSU1W?=
 =?utf-8?B?M3poSHRQSk5RclVHTWgwK1lVMVhpYzRCMmg3SVFjbTJUOU82YXNNbTBVcndB?=
 =?utf-8?B?bWxvdk1qanI5b3hsWVlwWkJPaVVBMkhtZnd0VEdnV3pzc3FtUmVsSmRMZE1t?=
 =?utf-8?B?ZzgxVGxBU0RYV0J3RGZZd3RLdGhuZ2gzQjVPMUVXWnlmMm42emZDVVBSaEtV?=
 =?utf-8?B?ZUpHV1A5dnNxQWQzeHNERndWZEU3WldBR1NocXRNZkxlN0Zac0VMbVhxSmdR?=
 =?utf-8?B?L1FiMEJaUjZGNjlBdW02M2FrNk9Lc2huQVBhWlNKeXdWMXpLTkh6N3MwdnQ4?=
 =?utf-8?B?V0drcjNXckRKeFpjdTdhSWhyekZxOXFGc2JhTlhQSHF0QUtvTjV3NHorYWNB?=
 =?utf-8?B?M1kvUWNLUlN2UUU0OTVVUWRjZ2E1NVFza2pCU2YwOGJnM0k4R2VCRkNSZEJD?=
 =?utf-8?B?Sk8xVzNZZkh1NW1iZ09mbjJsdjE2b3ZqSEx5eU5ZNVlJazhvczhMUER5Qjc1?=
 =?utf-8?B?RmpERERYTzR0azR4ZHhWNDdZZ2tNYVZRZ2FVUFFIbkQwa2o2ZWtXQzVhWld5?=
 =?utf-8?B?NCtvaDIwWHFDNDhMcmU5L3k3VUI1WWU4ZWFxOHhkeUtkU29EVjRYRW5zTjJ5?=
 =?utf-8?B?cjVNYnFxTExoSnpHN2h4TmN6UkVldEJCU3F4MTBEZjJhRldSdTNHTFhTWitN?=
 =?utf-8?B?aDRPV0RRUWpOK0ZBQlQ1NlBTbENhc2ZlK0dWZ3psUitxSUlGVDRVcExBSCtO?=
 =?utf-8?B?TnE5T0pUSnVRamRBdkU1UXk5TmltcUdjOHpZQXhxQkVwU0pUODlIZjBWRXpR?=
 =?utf-8?B?eFo2bStLVEg2LzdRQjh4MmVxczB4R1ZkQ25saGREQ0xVTU4xb2p5NmQxRjVt?=
 =?utf-8?B?SlA5WnhGQWUwVHMvSGVSNExPZVFGK3FsRjA2aWZGaTZ6eW5ZL3BNN2plMTV2?=
 =?utf-8?B?dnFjSVo1STJvTlVMQWdIc2N5VExheEdQNVZpSjBSNjE4QXA4QzlpVTl1TFRv?=
 =?utf-8?B?ZFBkRFV0MURMSVpaM3doQmdKOVQ4Rlc3VmtFWjZ6NGZrVG9jcExjNUlrOVNF?=
 =?utf-8?B?Yi9kbWNKbjduSTNlSzJ4ZzV3cmZtWC92OExwVjBKdUpiVjgvelVlTjE4K2tY?=
 =?utf-8?B?NnFPYjZhS29scmRIMzkrakJUamlDYXgwdjJXTVIyejZFNUxYcjdWUldrWmIr?=
 =?utf-8?B?UGtPemc3SFZzMUpPa0w2TmROSlQxWk1pcXY0RHFrRk0wdEFsOWhuRWx4dVEx?=
 =?utf-8?B?Qmg3WEJ5NTVhVko2L2l0T0dyamdmbURFMDNYZXFiTlN2RlNYZWVXYy9nU29G?=
 =?utf-8?Q?d1d0EOYH7WxBDWIPpWRWZjLiMW3sBF6o?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHZsTTBDWW9aa3VtYjZQODVvSHpyU1JBMTBBUGlOelFxZWpseE1wR3oyVUor?=
 =?utf-8?B?SFI0VktpMWdZNHgwbWlIVlFiSkZWR2c0RGdWeklXd0dUcFNzQzc4bzBwaitW?=
 =?utf-8?B?STYrS0ZndVM0NGhFL3crMTFWZXd1TnZrWVRoY3pFL2w2Z3RNdFp6VE1QSGE3?=
 =?utf-8?B?ZlViYlE1QytSb3NQK2Q4OUpRSGszLzJITUhMNFoxZEFpWjRKVHp4ZTlLTi9y?=
 =?utf-8?B?Q0NGVFdacFgzZ2hzSDE1QUhwVVhQclZHVjhWVk41UmNqaEppSlkyUlJTc0dG?=
 =?utf-8?B?YjNpTlRMNXp3czV5ZmlmSTI4bDJBbThBd01jcGJhSVlkRTFCbXhOM0V6cU9m?=
 =?utf-8?B?Y2hKVzZUOVNhM29hWmJpVXBBRVJ3Y3BQSVZOQVJEenp1VnNZY2ZDMlFlRXV0?=
 =?utf-8?B?SEFFbmxlUnRVT3F1SDZPbmkzVlpjeHMzNkxIWWJvNDQySmtmbFhiZXNDenFD?=
 =?utf-8?B?dHVqajBuTklHVzhuNlhtQm5qanJJQ0hkL1RENmNHL2pqZXJGUGw3eEUxdnJV?=
 =?utf-8?B?cERqazNVQzR5SXBNNHJjendNUlo4NTl4TkNjYmhsdmhlWm8xajdHWFRSTUZZ?=
 =?utf-8?B?WkU2TW1Dc0tMd09ybjYxNDVWNTlBa3JkUGZ6NDFIdmd1RkFlUUk0QTRjM0JR?=
 =?utf-8?B?amhkclJ5MmpLU3UzNnJIQmxxSmppQnNZdU0vVHpCdnM3VzA5K2VBYzQ4ald6?=
 =?utf-8?B?NDNGL2ZoRUVtanlTVU9iTXBULzRIRUNyQ3QwZFo2bURWN3FVSWJNZkhrNDZC?=
 =?utf-8?B?NjFnc0RPV2thUzRqRTVaZmE1b1JDRjBITTM5WDNpbVg4T0Z4TWg0cStuMExQ?=
 =?utf-8?B?aVVKWjdndTBDNXJ5b1oyK0p6ZHQ0VVBDRjg0TUVHVDZzV3BtQTVwMzhvSzZ6?=
 =?utf-8?B?dDNBUTRwaFdrU01EbEJYNlYrajlBRXk4c3E2ZHFuL3MwUlRjcjZkN21SYUF4?=
 =?utf-8?B?aG1PSmZxY1FlcC9rUVBJUUgvTHptTWRDVFU1S2h4NkNyOEtzOEhkUjk3dnB1?=
 =?utf-8?B?VW5VKzdxeWR6bnRER1E4aWt4MUdwZXZNZ1ZrRm5UR2pZMnpkRjU1ZWRNeFUz?=
 =?utf-8?B?eWcrR2NyQW0yWVhoU0hOWThlZG42bytpOFdha0ZNZTdFN0Y2cWNNU3UycWM0?=
 =?utf-8?B?OVhnWUxBMlRreldZbTBiZ3QxZHBCNEZPZmRqTUxTRUNyYzY1b3ZmTnpMc3o5?=
 =?utf-8?B?TDJFNVArQXhkaFBXZ2hIS3N6WG9nKzdIWnZST1RlRFk4cGNDNGNhVFRmdGEx?=
 =?utf-8?B?aTRCRUxUb0JaWXpiSUZvVlYrTlFvQ0tVdnRQbTlkVTR0MFg0NHhrRmk5OTJq?=
 =?utf-8?B?cXQyM0dveDVaUlBTY084ZTZhUk1DVDl3SUVVWElsaGNnWVVvdlhkZmdnZkw5?=
 =?utf-8?B?UTJBS2VlVVQzNDEyT0g0M053allscFdDQWlMeXMxZDNhblMwcERLdFNzdnRB?=
 =?utf-8?B?ZGVUaXlBRm5aQW04WmNTWm5aMllsOUc3TFhYLzQrWDVRZWtJSHVjM3poWEo4?=
 =?utf-8?B?aS9Ucm5yMUJnOEY2c3hkWDhYVTdxTU4rcnE3SGZEaTFJb0NTM0FOVFJmWlZC?=
 =?utf-8?B?RHJHTmo0T25MRXNKalMzSlZ3RWk3QUU4Slg3SFplYldzUzhvY3p3cU1CajRy?=
 =?utf-8?B?NkFXWVV5anJOSVF4YjF1dG5aQ1F4N1hTeFMwam1FRXhVRTh2Y0xQRnhrTG04?=
 =?utf-8?B?UktyWFdSSG9zb24xMzNsU3oxdUpNMU82S09VMjFFcWhWQnozY2x0c0w1a3dE?=
 =?utf-8?B?cEhqQ3lnSkVUNG5aL0plUmsyMmRsa1pQYTBUbHB3SndWcmRLT1BpRCthcG1P?=
 =?utf-8?B?MjN6R3FKTHVhSFA4cEFaaHZuTHJ5QzZNMkswdTluTUtnYVBzazZFWGNyMkhz?=
 =?utf-8?B?VklwU0duVEVsRzRXS0hGSmZWRmVEaUZab2dueHlzTmUyM3VGVVMwRWFGQUNC?=
 =?utf-8?B?V1pNSGxFZzRnSFlFV0NINTJDVTZqS0VLWFhLMVMwZzIvdlhYRFUrT2E3OERk?=
 =?utf-8?B?WkY1S0VPd0lZRnYvQ0paV1J5K0RaeFJIN2FSU2Q2bUg1bHVabHlKZmNaa2VD?=
 =?utf-8?B?Ykh5TjdUWmNQemhYS0hWYm1pSEVUNHZOeFVTdnJjQ2ljYU5Wc0VkcW1OOFQ2?=
 =?utf-8?B?Zm1LTVVHNXhFODhWTGFtVC9HK2NSbTA4UDRkOU9QbFFxSDFHdXNrVHlTOXBz?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291419a2-ced6-425e-2552-08dd412b4446
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 12:40:24.1258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dP/DdIL4ZZBlIbfKGvDIzzjuC1QBMXd9bUPDYkBGTScKVUVvTJRCABNC+CxD7Q3MW6WCsXlzO4WwlT7K9+HCvYOlZS7VIkraIsZ+AoVLSp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13112

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxNTozOA0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYzIDA5LzEzXSBpcnFjaGlwL3JlbmVzYXMtcnp2Mmg6IEFkZCB0c3NyX2sgdmFyaWFibGUg
dG8gc3RydWN0IHJ6djJoX2h3X2luZm8NCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIDI4
IEphbiAyMDI1IGF0IDExOjQ3LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
IHdyb3RlOg0KPiA+IE9uIFJaL0czRSB0aGUgbnVtYmVyIG9mIFRTU1IgcmVnaXN0ZXJzIGlzIDE1
IGNvbXBhcmVkIHRvIDggb24gUlovVjJIDQo+ID4gYW5kDQo+IA0KPiBzLzE1LzE2Lw0KPiANCj4g
PiBlYWNoIFRTU1IgcmVnaXN0ZXIgY2FuIHByb2dyYW0gMiBUSU5UcyBjb21wYXJlZCB0byA0IG9u
IFJaL1YySC4NCj4gPg0KPiA+IEFkZCB0c3NyX2sgdmFyaWFibGUgdG8gc3RydWN0IHJ6djJoX2h3
X2luZm8gdG8gaGFuZGxlIHRoaXMgZGlmZmVyZW5jZQ0KPiA+IGFuZCBkcm9wIHRoZSBtYWNyb3Mg
SUNVX1RTU1JfSyBhbmQgSUNVX1RTU1JfVFNTRUxfTi4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBG
YWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4NCj4gPiBSZXZp
ZXdlZC1ieTogVG9tbWFzbyBNZXJjaWFpIDx0b21tYXNvLm1lcmNpYWkueHJAYnAucmVuZXNhcy5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnp2MmguYw0K
PiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yenYyaC5jDQo+ID4gQEAgLTY0
LDggKzY0LDYgQEANCj4gPiAgI2RlZmluZSBJQ1VfVElOVF9MRVZFTF9ISUdIICAgICAgICAgICAg
ICAgICAgICAyDQo+ID4gICNkZWZpbmUgSUNVX1RJTlRfTEVWRUxfTE9XICAgICAgICAgICAgICAg
ICAgICAgMw0KPiA+DQo+ID4gLSNkZWZpbmUgSUNVX1RTU1JfSyh0aW50X25yKSAgICAgICAgICAg
ICAgICAgICAgKCh0aW50X25yKSAvIDQpDQo+ID4gLSNkZWZpbmUgSUNVX1RTU1JfVFNTRUxfTih0
aW50X25yKSAgICAgICAgICAgICAgKCh0aW50X25yKSAlIDQpDQo+ID4gICNkZWZpbmUgSUNVX1RT
U1JfVFNTRUxfUFJFUCh0c3NlbCwgbikgICAgICAgICAgKCh0c3NlbCkgPDwgKChuKSAqIDgpKQ0K
PiA+ICAjZGVmaW5lIElDVV9UU1NSX1RTU0VMX01BU0sobikgICAgICAgICAgICAgICAgIElDVV9U
U1NSX1RTU0VMX1BSRVAoMHg3RiwgbikNCj4gPiAgI2RlZmluZSBJQ1VfVFNTUl9USUVOKG4pICAg
ICAgICAgICAgICAgICAgICAgICAoQklUKDcpIDw8ICgobikgKiA4KSkNCj4gPiBAQCAtODQsMTAg
KzgyLDEyIEBADQo+ID4gICAqIHN0cnVjdCByenYyaF9od19pbmZvIC0gSW50ZXJydXB0IENvbnRy
b2wgVW5pdCBjb250cm9sbGVyIGhhcmR3YXJlIGluZm8gc3RydWN0dXJlLg0KPiA+ICAgKiBAdF9v
ZmZzOiAgICAgICAgICAgIFRJTlQgb2Zmc2V0DQo+ID4gICAqIEBtYXhfdHNzZWw6ICAgICAgICAg
VFNTRUwgbWF4IHZhbHVlDQo+ID4gKyAqIEB0c3NyX2s6ICAgICAgICAgICAgVFNTUiBpbmRleCBr
DQo+ID4gICAqLw0KPiA+ICBzdHJ1Y3Qgcnp2MmhfaHdfaW5mbyB7DQo+ID4gICAgICAgICB1MTYg
ICAgICAgICAgICAgdF9vZmZzOw0KPiA+ICAgICAgICAgdTggICAgICAgICAgICAgIG1heF90c3Nl
bDsNCj4gPiArICAgICAgIHU4ICAgICAgICAgICAgICB0c3NyX2s7DQo+IA0KPiBTbyB0aGlzIGlz
IDQgb24gUlovVjJILCBhbmQgMiBvbiBSWi9HM0UuDQo+IEluIHRoZSBuZXh0IHR3byBwYXRjaGVz
IHlvdSBhcmUgYWRkaW5nOg0KPiANCj4gICAgIHUxNiB0c3NlbF9tYXNrOyAvKiBHRU5NQVNLKDYs
IDApIHJlc3AuIEdFTk1BU0soNywgMCkgKi8NCj4gICAgIHU4IHRzc2VsX3NoaWZ0OyAvKiA4IHJl
c3AuIDE2ICovDQo+ICAgICB1MTYgdGllbjsgICAgICAgLyogQklUKDcpIHJlc3AuIEJJVCgxNSkg
Ki8NCj4gDQo+IEkgdGhpbmsgeW91J3JlIGdvaW5nIGEgYml0IHRvbyBmYXIgaW4gdGhlIHBhcmFt
ZXRyaXphdGlvbi4NCj4gVGhlIGtleSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIHR3byB2YXJpYW50
cyBpcyB0aGF0IFJaL1YySCB1c2VzIGEgZmllbGQgd2lkdGggb2YgOCBiaXRzLCB3aGlsZSBSWi9H
M0UNCj4gdXNlcyAxNiBiaXRzLiAgRnJvbSB0aGlzIHNpbmdsZSBwYXJhbWV0ZXIsIHlvdSBjYW4g
ZWFzaWx5IGRlcml2ZSBhbGwgb3RoZXIgdmFsdWVzLCBzbyB0aGVyZSBpcyBubyBuZWVkDQo+IHRv
IHN0b3JlIHRoZW0gaW4gc3RydWN0IHJ6djJoX2h3X2luZm86DQo+IA0KPiAgICAgdHNzZWxfbWFz
ayA9IEdFTk1BU0soZmllbGRfd2lkdGggLSAyLCAwKTsNCg0KWWVzLCBhcyBmb3IgUlovRzNFLCBi
aXRzIDgtLT4xNCBhcmUgcmVzZXJ2ZWQgYW5kIHdyaXRlIGlzIGlnbm9yZWQuIFNvIGl0IGlzIHNh
ZmUNCnRvIHVzZSBHRU5NQVNLKDE0LCAwKSBmb3IgUlovRzNFLg0KDQo+ICAgICB0c3NlbF9zaGlm
dCA9IGZpZWxkX3dpZHRoOw0KPiAgICAgdGllbiA9IEJJVChmaWVsZF93aWR0aCAtIDEpOw0KPiAg
ICAgdGludF9uciAvIHRzc3JfayA9IHRpbnRfbnIgKiBmaWVsZF93aWR0aCAvIDMyOw0KDQpJIGFn
cmVlIHRoaXMgcmVkdWNlcyB0aGUgbnVtYmVyIG9mIHZhcmlhYmxlcyBpbiBzdHJ1Y3Qgcnp2Mmhf
aHdfaW5mby4NCg0KSSB3aWxsIHVzZSBmaWVsZF93aWR0aCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0K
DQpDaGVlcnMsDQpCaWp1DQo=

