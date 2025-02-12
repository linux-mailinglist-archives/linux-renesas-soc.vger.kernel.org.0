Return-Path: <linux-renesas-soc+bounces-13059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5632A32206
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 10:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84F363A593C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 09:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3647205E0D;
	Wed, 12 Feb 2025 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="An07o7+r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF83C205E21
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Feb 2025 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739352224; cv=fail; b=J3OdUWoCjvVpP04aHKDVD3hk9a0DGAOyu4PFx4SsACb9tRY947aGZMgUi8VgKAXfkmYHSgFQq+KN3dEDSeeGdhuou4bq03ZM2IiDnXctm7r5ORqSJASfzcC3cjsbsmhIQPrO8AvtJBsmgGrnzQAiXmwukJQt/PCl+36V+ma3Cv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739352224; c=relaxed/simple;
	bh=+sIiFXmVLzz+Y+O4WBccFSV/oluv5L6XW4AUt3Efiys=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HrMe2wQj1hdrOPssukPTpu/TFdI1Hy0cL2s+V4F//RliLtOSHVjd7ReTNczwxUnXGH4+/zDIYTW1TzIdXwCI5Ttyl1WkHPyZVBOP+Z3/SULn27kxw7sJE0K+MZqCfmMZD3LMa9rU4E2uOrrMVKaYKT/akmxqOGY5ADojAGMuCEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=An07o7+r; arc=fail smtp.client-ip=52.101.229.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dz2c0x/XvUW56mMM136RtCkidixz4JxAYf3hKrcMNl1DI9gOyVa1QAXaqvxS0KL6PeCzHuXo5CA+ldQi/tNjT1ME/4lqM1iUfy6vUtfPL0FALcNEuBu6vYHzrZr/CDuGA9E3f8VYZCicn3ZpcfIn0zYwBw7P4a5eS7qrARwSdDFon0xE5mB9152BwcCn4uzbMXa+CpKPKzYP5IZG0KRwKrEstYYfGYQHDba/tFFDO99a8xfLLvxk4AiPggdv7UU9z5HxFUad8uDx8cV28aufVszQ0foejHZ1U5XXgj1PzkUlW8hqnnbFX9W84zi0D2hh2GbdWyppdrS/TKNd/WUEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sIiFXmVLzz+Y+O4WBccFSV/oluv5L6XW4AUt3Efiys=;
 b=TM3MHryaPJ3d9xHASEh8A4fSAijKIhibE7NOacw89x3ZeykHudHVtijAOEdHpoTLbpkNuLyDFjbsGT4ML0UqW9GOL3d7J4FiFbqErB1FEEMMAwMTtYnDK3xa6gNOor5siNYxaWh0GrwMLzL8uFP1xOPwlVkBKSOA+jWcdWhmhhMNPGZIMzgzeFdTfiyy9QTEt6u53Dw92Sfm3iGKN+wJ5z//Zu/igyBi+VNy8R0oRK5sZ54pr4vBL6wnG95KjqH1oB1dMxm2ei0Ffyi1SsGlknbQqAwUWHdWfK7vGU0NlLoYmgqOLqPnyTRVwzjsFbp+Ab/QxMUG7ysmaSokn34RXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sIiFXmVLzz+Y+O4WBccFSV/oluv5L6XW4AUt3Efiys=;
 b=An07o7+rQX+TeX31gPGJBtoZo249vMyMLSPo9GVp5YHQdoYOOyEVaHScIZxuKzz8fv2kVG1EQQ/tLIOKX6AW3mXmZ+v4yqS1EHcBI+Sj+KuPwzbCcmkTg0zEw5lSu+HciSuOXsJsQSDbJxwZAAAHgKuk67vaapBSBWT8xMcVaOA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14828.jpnprd01.prod.outlook.com (2603:1096:405:25a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 09:23:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 09:23:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 09/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
Thread-Topic: [PATCH v4 09/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
Thread-Index: AQHbeVSqw+mhQzys70y3wJ3G74B9uLNCHRQAgAFGoOA=
Date: Wed, 12 Feb 2025 09:23:37 +0000
Message-ID:
 <TY3PR01MB11346B96B7838E7F61F9433C986FC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com>
 <20250207113653.21641-10-biju.das.jz@bp.renesas.com>
 <CAMuHMdU3xJpz-jh=j7t4JreBat2of2ksP_OR3+nKAoZBr4pSxg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU3xJpz-jh=j7t4JreBat2of2ksP_OR3+nKAoZBr4pSxg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14828:EE_
x-ms-office365-filtering-correlation-id: 3715188d-a67e-45bc-b627-08dd4b46ee73
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eXRrZldWYzEzNi94aXVDRkY1VVdDZGh5MUpsRnRsWnJaY0dyQ2JqT0JVVkxY?=
 =?utf-8?B?TEFxQlN3a2JnMDBtQWU4RUVFOVR5b0tMeDQ3ZkdjUkt3S1kxakQ3TzFWajVW?=
 =?utf-8?B?Yld6czZpN1AxbzJ3eGdxTEsxMjZTa0lTUU44OWMwZTBJWmRlb1FBTXFheWMv?=
 =?utf-8?B?Mlo1Q3dCaTV6VWxIR0NJci9nR25wTkdVM2YraUpWWFExaVlJcFpaVjdrL3Bh?=
 =?utf-8?B?ZEhKeEpKeGNYVC8yNSt5V1lzNEE3ZWZmMDlRN0dZNHhNdGk3MGNSbWhrbXJ5?=
 =?utf-8?B?a1UxRVhDMERtWVpGbzlHMjdOL0Fsem1jOEY0VWxoeDVSOVRpZUtTenVVWEtR?=
 =?utf-8?B?VlJBSnhMa2lCV3ZJLzFJQ2xsRkVLS3h4NDZPVi9NOFQwOTVDU2hHWmd5ajVw?=
 =?utf-8?B?V1ROV2JSKzBtYUlKdUlFTXBDL3JBM0ErcVBvaHovRjQrd0tQb1EraE55T215?=
 =?utf-8?B?ZEZIbHE5d0QzMWhjQVhKclc4TUJTeG5ybXd4MmNWL0lvb0NJTG5ZL2MxSm8w?=
 =?utf-8?B?UzRId2hBSk1yQk9DMSs3LzVCL2lpR01OTi96eUtBdFE1VFQ0RWFvcDQ1RGc4?=
 =?utf-8?B?SEJQYlp2VmFpQXA3eG5lRm1WYlNiVUhRWGM5dlkzVDdHYk1jQ3Q3NWlzdHRD?=
 =?utf-8?B?NFVWRlpZWkZsUzNhMVhzRXNmeG1oKytkZjEvN2pqd3IvRTlKWU9QMnJsdGth?=
 =?utf-8?B?ZWc1Q3FESXkzaHZaUXN6bTBTTTZDTEFXSXNhaGw5c2dFOWtJQlFUdzNhaXFG?=
 =?utf-8?B?Q2dUYUtORjBYL1ZqOXpBanZsWmg3bzFCc1dKVXJuNGtXMCtKK2Z0Q291YkJt?=
 =?utf-8?B?UGxJclRUbmh3UlJrZkwyVDRtK2txS1RmK3I0WU9MY2hZaEtybnNZWG1uSHdi?=
 =?utf-8?B?S2d5ejRXdzZXWFJyOWVpQ1ZrTVg3eU03a3BURGNnMWcxV3hlNlFvVzVlYlFL?=
 =?utf-8?B?UWl2MllXZGpIRjhjWm4vUTF3K3RXVjJSS2svWWNuaVFaWTRNMmxNR3JtM210?=
 =?utf-8?B?ODBhZDlFMXNoQmIvVkFZQVZZQnZjWjJNVEVBUDZYT1JZTjNtOHdWSm1GYWJQ?=
 =?utf-8?B?dDI5Z2tCamhGSndIYTVpSnhqb1NBQVI5Q2VqVDRudXE5bVd4aGVLYWVpNVQx?=
 =?utf-8?B?S1lIeHEzb21oK1ZldlIrS3gwUENSb1h5cUtReElNVkJLOFRsalNLQ2FCRkdy?=
 =?utf-8?B?Qm9FSmw5aHRNdmloZFVlajc3L01Zd3RncTZUcDNQaDNJWnFUck0rODc1dWNE?=
 =?utf-8?B?bS9NMkhZWFdwVDNLdDZ2OC92UFF5R3d6QmJlYysxNHE2d3ZzUWVKY1Vwa2FQ?=
 =?utf-8?B?eDJuaUNQcUo0R2JJNGxpVVJreWxHcWhFSTg0aHRuQkFVQm0zMGt0SzFBTG94?=
 =?utf-8?B?RWFxSDVMNXUrRFVxOXVPazJrNEI5aXV5WFJ3eVhFL3lSNExqeGxFOE5ub0VH?=
 =?utf-8?B?ZHc4WjUwRmlTU1I4bXhyeDNLZUpITWhFYTEvUkRYOUxYMm1Kd1daV1RYdkhS?=
 =?utf-8?B?U2JEeURxOEk4YUF3OHJNdmxvZjN0WHdWZEVQOEJhOUxwUlJRdFBKK2hpZVZK?=
 =?utf-8?B?LzBtMUIyc1RFdWhvdEh5NndOZVg3Ym9yQnR4cU5vKzhmYXFnN2NvRUhVdklJ?=
 =?utf-8?B?LzgraHVmTVVobTE4djg5S1ZxbXVkNW9GSHI4bzVuSmR5enZ0OGM0R1dYZEw4?=
 =?utf-8?B?d2ZuMFVqK3BZZVB4Vk1sMnBVdDRUMEZ6cGFiL3ErZWFqYm1kSUlOaTExaEdD?=
 =?utf-8?B?MTVJUjNZaWIwUDluNThDdVlSMG9yTFkzWVZDV0RiMDRUbkRXb2VYb3JHMEFT?=
 =?utf-8?B?UVNCbE9welcxZ0diWXNkRSszaE0xeVA0Nit6SC84NU5pMTQ0YXV2SU5Ecit1?=
 =?utf-8?B?TWIvalBRUHZpdVlnMVJweTJxYWNSd2I2MGNvd2sxS3JsRzRld2JUZFR3cUl2?=
 =?utf-8?Q?sjZx9dvby/5re2j7WUloop03ypcjLDI6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUhXemMvZXFyMUdPaTRRR21WN3ZzcWRvSkZzS2VoTzJJZnVQZEhyUW5Vb2Z5?=
 =?utf-8?B?blVDODhmc041ZDg5a0JwanE1Y2VwRnozQzh2VXVVanl4aHBkRXlRR3ZBazlt?=
 =?utf-8?B?WkRJeHJ1Wk96QmdnTTVyWXlyQ0wwK0pPSk45Yml1TkZFd05MckMyRk84MUVk?=
 =?utf-8?B?a2VIaVRIYlpXMVJRSUpjbi9tSWtla2NQME9RV2g1V2F6cnh2UFFsL08xNzFS?=
 =?utf-8?B?M1J3S3dPTm1wSjRrQWVBa3U1elJ0cEhBVk5xYmNDMFJwNkpvYkxadFN1V2Rw?=
 =?utf-8?B?YjNKQUI3ZnJiUEViUFdUMVBxcXJMalBma1I0ckFWOGlVMEZVa0lOeHdvYW9a?=
 =?utf-8?B?NnVUS1l5QmJldmFCNm8wVzQ3Nm1HckJTNnB6QlUvb2NLM3dmQlZOZ0FDeVMz?=
 =?utf-8?B?MU1KSk1tSU8wYlU3QkFOSzdaTzNFMjYzakNDU3BaVnRUYUY0U3JXWkxxUGlz?=
 =?utf-8?B?ajhtSHB6T1NJdGhja3d4U3BTV2c3cXdWbm5zdDhOQzRJQkx5UW9QTEUrWVhq?=
 =?utf-8?B?TTN5dXkycjlLcnlHS2pyNHJtbGtVYkhmRzBnNkkyUlNoM01UOWt5K284MW5W?=
 =?utf-8?B?R1ZHQVNXTWRMZEJGSnBNNjNTTXpPSk5HVVJ2WXk5cHBocTZCN1FxWEF6dzB1?=
 =?utf-8?B?Vkt5em5mYjlmYUhEVXlCMUNRMWc0c0ZHRjVSd01aRUZnV1Y5OHIyZnNRZkxo?=
 =?utf-8?B?bjE3M3ExVHQxKytrVU0wc0llaFBxMWg0ZUVjZ2ozdTJMS1pHV3FTbnlsdFZk?=
 =?utf-8?B?dG9ldTgvU2tPQVROTzlxOXVoQmJPazJkMHVab3FSb3FIK2RvRzMzWklMdExU?=
 =?utf-8?B?cG5PMUlvd3N0RkJCTHNiaGQvQUNmbHpvbWNUNXdaeXVLcFoxUGcvZi9waUk0?=
 =?utf-8?B?SyttNUVCS2ZTOVNacndIMTdXL0IrRytXcGc1WVU0TnpZQVdpQXFESnBkSXJa?=
 =?utf-8?B?K1hNUlAveENPM2ZPQlRYYWFNNVliZTc5WTBwTjVibTV2VEdtd3lVUFJmZnE4?=
 =?utf-8?B?U2FFMVVmVXUrditnaU81aUZFeUViRkgvQmducWoveVpwTGl1V2ZCaS8zU2xX?=
 =?utf-8?B?K3hKazducmphKzIyRU5zM09WNElmMGVJVkdEdTRsMUdIbXdXM2loRTNrNXBC?=
 =?utf-8?B?d3JqeEljS2VIdkxUTmhIZ1JYS042Qm5lMzBQby9oUHQyQTNqWW42bTROZWE0?=
 =?utf-8?B?ck9XL0pxUTA2Y0JnaVVIQ29hclBoT3FhR0t1ZkpQbVJtTFpBUjBwVDYwbmI5?=
 =?utf-8?B?UWV3cVBvV0xVQnEzRmRTQi9EZ25zTU9QbTRadVN6WlJ6OXRRTUN5WW52d1Zj?=
 =?utf-8?B?U0JVa1JtNkQzSEdvMXVwVGtESy9nUk1wWmpJUzc5OU9Femd6bkVZV3VISEhS?=
 =?utf-8?B?MmlUVk14RVFFQWVDNFhpWXdkVjhpU1loSUk4K2g3K2RrWWlqTWxJVkZJWXJV?=
 =?utf-8?B?VGxIdXN6SGQvZ1JJTk9wN1JEVFVHaW1KM2FTbDl5cTlTVTFCaWdySWJsMEgr?=
 =?utf-8?B?VDgvekRtM3hIUnE0NkF3dlVvenZEVVFKTStiM3BqUlF1Q1p6dmgwT3kySVhx?=
 =?utf-8?B?L3d0NGswTEZudWpwRnJQSEc4TCszRVgyN1VOVXZkNkd1R2JHd1F0dWsxSGdI?=
 =?utf-8?B?N0M1UUpYc25oVnFmQXBNNTdzUk1nNjliV09yMFVBRWJIdUZVL2d0aGtweVB3?=
 =?utf-8?B?cnlRMk1HdWd1STZzME1MRVh3UXZHcFRtV0M1UFlsK1BwVHVUd1I1WDJta0FL?=
 =?utf-8?B?Ui96dWxvZ3M1SVBxYThiYlcrS3RrU0tJYWdaUFpkQ1lRTTB5OXdUeTF3blpI?=
 =?utf-8?B?c3drb2RkRFFEa0ZBN29ScnNXYzNLWHRDRUhNSUprMVk1aldnaUx1aUd1eEZ1?=
 =?utf-8?B?RlkwM0ZkeEZrSk5RbUFXV0pYd0pEZkh0OUZqV2ZHRmpGdUp5b3VMQldrS0ZL?=
 =?utf-8?B?SFJTRExaS01oeXNhUis5VnRxbC9EWXEraTJVR0xuT3NFUkpwdVVtcnFURENI?=
 =?utf-8?B?WTd6WW9RZzRlN1Y0eEZVQmdud2JWMlJhRytuc1pXMmFOQjJDSFJQZ29LNVQ0?=
 =?utf-8?B?aC9iSGswYUY4KzNERytEcnRnOTdWMHB4OU5WN3NUYjgyM3RxdW1QVGRDY2Fm?=
 =?utf-8?B?SUxVbkNBY3ZQK3o4ZUMxSlJ0L1BSQW5OWUF0YzVXcEJtOUIrWVE3MUJleFZW?=
 =?utf-8?B?akE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3715188d-a67e-45bc-b627-08dd4b46ee73
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 09:23:37.6816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uCti4YgVuA9Dc1qKtvUUR1WedUZjgcmy5auiz1YmGujiHK0qzbacZE42e6720JpeWYXVc6eprQH3Pjvu4zJ+tT4JS7wlx66gFKm7lfYQe0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14828

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMTEgRmVicnVhcnkgMjAyNSAxMzoyMg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY0IDA5LzEyXSBpcnFjaGlwL3JlbmVzYXMtcnp2Mmg6IERyb3AgVFNTUl9USUVOIG1hY3Jv
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCA3IEZlYiAyMDI1IGF0IDEyOjM3LCBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IE9uIFJaL0czRSwg
VElFTiBiaXQgcG9zaXRpb24gaXMgYXQgMTUgY29tcGFyZWQgdG8gNyBvbiBSWi9WMkguIFRoZQ0K
PiA+IG1hY3JvDQo+ID4gSUNVX1RTU1JfVElFTihuKSBjYW4gYmUgcmVwbGFjZWQgd2l0aCB0aGUg
aW5saW5lIGxvZ2ljIEJJVChmaWVsZF93aWR0aA0KPiA+IC0gMSkgPDwgKG4gKiBmaWVsZHdpZHRo
KSBmb3Igc3VwcG9ydGluZyBib3RoIFNvQ3MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yenYyaC5j
DQo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gPiBAQCAt
NjYsNyArNjYsNiBAQA0KPiA+DQo+ID4gICNkZWZpbmUgSUNVX1RTU1JfVFNTRUxfUFJFUCh0c3Nl
bCwgbikgICAgICAgICAgKCh0c3NlbCkgPDwgKChuKSAqIDgpKQ0KPiA+ICAjZGVmaW5lIElDVV9U
U1NSX1RTU0VMX01BU0sobikgICAgICAgICAgICAgICAgIElDVV9UU1NSX1RTU0VMX1BSRVAoMHg3
RiwgbikNCj4gPiAtI2RlZmluZSBJQ1VfVFNTUl9USUVOKG4pICAgICAgICAgICAgICAgICAgICAg
ICAoQklUKDcpIDw8ICgobikgKiA4KSkNCj4gPg0KPiA+ICAjZGVmaW5lIElDVV9USVRTUl9LKHRp
bnRfbnIpICAgICAgICAgICAgICAgICAgICgodGludF9ucikgLyAxNikNCj4gPiAgI2RlZmluZSBJ
Q1VfVElUU1JfVElUU0VMX04odGludF9ucikgICAgICAgICAgICAoKHRpbnRfbnIpICUgMTYpDQo+
ID4gQEAgLTE1Myw5ICsxNTIsOSBAQCBzdGF0aWMgdm9pZCByenYyaF90aW50X2lycV9lbmRpc2Fi
bGUoc3RydWN0IGlycV9kYXRhICpkLCBib29sIGVuYWJsZSkNCj4gPiAgICAgICAgIGd1YXJkKHJh
d19zcGlubG9jaykoJnByaXYtPmxvY2spOw0KPiA+ICAgICAgICAgdHNzciA9IHJlYWRsX3JlbGF4
ZWQocHJpdi0+YmFzZSArIHByaXYtPmluZm8tPnRfb2ZmcyArIElDVV9UU1NSKGspKTsNCj4gPiAg
ICAgICAgIGlmIChlbmFibGUpDQo+ID4gLSAgICAgICAgICAgICAgIHRzc3IgfD0gSUNVX1RTU1Jf
VElFTih0c3NlbF9uKTsNCj4gPiArICAgICAgICAgICAgICAgdHNzciB8PSBCSVQocHJpdi0+aW5m
by0+ZmllbGRfd2lkdGggLSAxKSA8PCAodHNzZWxfbiAqDQo+ID4gKyBwcml2LT5pbmZvLT5maWVs
ZF93aWR0aCk7DQo+IA0KPiB3aGljaCBjYW4gYmUgc2hvcnRlbmVkIHRvOg0KPiANCj4gICAgIHRz
c3IgfD0gQklUKCh0c3NlbF9uICsgMSkgKiBwcml2LT5pbmZvLT5maWVsZF93aWR0aCAtIDEpOw0K
DQoNCkkgYWdyZWUgYXMgDQoNCjIgXiAoZi0xKSA8PCAodCAqIGYpID0gMiBeKGYtMSkgKiAyIF4g
KHQgKiBmKQ0KICAgICAgICAgICAgICAgICAgICAgPSAyIF4gdGYgKiAyIF4gZiAqICAyIF4gLTEN
CiAgICAgICAgICAgICAgICAgICAgID0gMiBeICh0ZiArIGYgLSAxKQ0KICAgICAgICAgICAgICAg
ICAgICAgPSAyIF4gKCh0KyAxKSAqIGYgLSAxKQ0KDQoNCj4gDQo+ID4gICAgICAgICBlbHNlDQo+
ID4gLSAgICAgICAgICAgICAgIHRzc3IgJj0gfklDVV9UU1NSX1RJRU4odHNzZWxfbik7DQo+ID4g
KyAgICAgICAgICAgICAgIHRzc3IgJj0gfihCSVQocHJpdi0+aW5mby0+ZmllbGRfd2lkdGggLSAx
KSA8PCAodHNzZWxfbg0KPiA+ICsgKiBwcml2LT5pbmZvLT5maWVsZF93aWR0aCkpOw0KPiA+ICAg
ICAgICAgd3JpdGVsX3JlbGF4ZWQodHNzciwgcHJpdi0+YmFzZSArIHByaXYtPmluZm8tPnRfb2Zm
cyArDQo+ID4gSUNVX1RTU1IoaykpOyAgfQ0KPiA+DQo+ID4gQEAgLTMxNyw3ICszMTYsNyBAQCBz
dGF0aWMgaW50IHJ6djJoX3RpbnRfc2V0X3R5cGUoc3RydWN0IGlycV9kYXRhICpkLA0KPiA+IHVu
c2lnbmVkIGludCB0eXBlKQ0KPiA+DQo+ID4gICAgICAgICB0aXRzcl9rID0gSUNVX1RJVFNSX0so
dGludF9ucik7DQo+ID4gICAgICAgICB0aXRzZWxfbiA9IElDVV9USVRTUl9USVRTRUxfTih0aW50
X25yKTsNCj4gPiAtICAgICAgIHRpZW4gPSBJQ1VfVFNTUl9USUVOKHRpdHNlbF9uKTsNCj4gPiAr
ICAgICAgIHRpZW4gPSBCSVQocHJpdi0+aW5mby0+ZmllbGRfd2lkdGggLSAxKSA8PCAodGl0c2Vs
X24gKg0KPiA+ICsgcHJpdi0+aW5mby0+ZmllbGRfd2lkdGgpOw0KPiANCj4gVGhpcyBzaG91bGQg
dXNlICJ0c3NlbF9uIiBpbnN0ZWFkIG9mICJ0aXRzZWxfbiIgYXMgdGhlIGluZGV4Lg0KPiBOb3Rl
IHRoYXQgdGhpcyBpcyBhIHByZS1leGlzdGluZyBidWcsIHNvIHlvdSBwcm9iYWJseSB3YW50IHRv
IGZpeCB0aGF0IGluIGEgc2VwYXJhdGUgcGF0Y2ggKGFuZCBtb3ZlDQo+IHRoZSBsaW5lIHVwLCBu
ZXh0IHRvIHRoZSBvdGhlciB0c3NyIGNhbGN1bGF0aW9ucykuDQoNCk9LLg0KPiANCj4gR2l2ZW4g
eW91J2xsIGJlIGludHJvZHVjaW5nIG1vcmUgc2hpZnRpbmcgaW4gdGhlIG5leHQgcGF0Y2gsIGl0
IG1heSBiZSB3b3J0aHdoaWxlIHRvIHN0b3JlIHRoZSBzaGlmdA0KPiB2YWx1ZSBpbiBhIHZhcmlh
YmxlLg0KDQpPSy4NCg0KQ2hlZXJzLA0KQmlqdQ0K

