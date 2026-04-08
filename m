Return-Path: <linux-renesas-soc+bounces-31037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Nq1Lvd71mk0FwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 18:01:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D89DF3BEA11
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 18:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3960F3002B3E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 16:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814CE3446CB;
	Wed,  8 Apr 2026 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hOnjh4ka"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470732E06E6;
	Wed,  8 Apr 2026 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775664111; cv=fail; b=M2Jh5zjNoCKYAPaz7aZ1eK4eXn9+H6citAqbxURccJg403CnXBJMT/za/UntkG8laY3wwFgZhBva/ULff/AV5iZ+iMXvmVqG8FBbtiZTrf9/XN6YUXyYXYKye/d9jK4M1Gsn3B4Tmy3obvmMSFHmGwfvoNOMpboNP9taawB4Twk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775664111; c=relaxed/simple;
	bh=rbmCdT+TOKFLF2PFc6C6YICMWaF+bcWisPaWXclZbFo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SFk1rcciM3hvILiLWTvz00l0uQKjRrXuJyNPj2aN3pEr4sOkfshjHJgTqPeDAOyNkgO9ktW65Fgqi+MqGEixFx7kQe90ed+wTlkWdknQx5ySiRRQ66FNQKeO5Um0kWrmiVUeh/G6FFtu04RJcm2DsD7t4s2ftB6cXWiYcAoRBkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hOnjh4ka; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGryGAbwV/qtaQXmKyOal2bON6h0kQP+NTdDboknXww8goUsbif/vS2Ht+Vs+rCK0atd04d6XoMlvopfr9wNW5UCFAQFn8DYQY7cbkcPM/b4gkADswBYzBubq6MBy27RnVTl4GVB2OOdMYltjL2lBA9Ll5VJVG+m8ocRDMxhF6stwZXhxxUqllAv5zlQDsDo9+hztd3+HOr0IYRis4I4GlzwE2RWSSWh9hq820ZV7lN5WjQbzCyFexO/VWqurD3H5yfuSt5CcLBgBBm+TUYvM0lNakMQbiKuZV5t6xG2WW2ze9ovuSvrHtZf3/AFZBktq0ntTeSPoGYFOIzIFprdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbmCdT+TOKFLF2PFc6C6YICMWaF+bcWisPaWXclZbFo=;
 b=Ymg1Ic0WyRUxNrevQ3t9LIBm28gg8a04wbwe7R9iiJAS9CCeNBeY7uFDmA8O07DuHueDpBIoIsuyKQQPun/qPxgDVi+OX2HuLifqp9Gkr+nsUCpYqtXzwt7ExSdYXzHr6TNLcmVZP65nMIwrSOKq5fErXj0/lMJdCoQL+YbrW58jMFx+sr9Sjs5yM40Lpj6oBpaY1MrAOk5XdOHVZNcLprl7uqTNCyPpXygBcmojeJwYtxj/kTseu+Ba3449w7hTZWRif3kjynnf4PmAmfBfnP9Y0JeCkN9nkzZfOxPzmgA5VoRV/abisPCG9+2pF87+ZGQaxmixvL5YW89HBHgSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbmCdT+TOKFLF2PFc6C6YICMWaF+bcWisPaWXclZbFo=;
 b=hOnjh4kaUa2YKxk1f4H416fJv5tglGULlTRk0il/9IEccvuPYjecf/NbqYDqvYLmuF+zVNy4cyVX013toEFlwfB0wMlLOn+5F04Kj9LS9nouHHEwKAEiablnFC3wVDx/ATVWQ4ZKATnyEUK91C5VBXiReBp9hdm38QwEMDltuAQ=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS3PR01MB9979.jpnprd01.prod.outlook.com (2603:1096:604:1e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 16:01:45 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 16:01:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Pavel Machek <pavel@nabladev.com>
Subject: RE: [PATCH v2 2/2] serial: rsci: Remove goto and refactor baud rate
 clock selection
Thread-Topic: [PATCH v2 2/2] serial: rsci: Remove goto and refactor baud rate
 clock selection
Thread-Index: AQHcx2L1fWdpwwcFskquR+9YhC+S/bXVTsEAgAACE4CAAAIVMA==
Date: Wed, 8 Apr 2026 16:01:45 +0000
Message-ID:
 <TYCPR01MB11332B1928935977E91FE04E8865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
 <20260408142105.310210-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXVbWg=nz-E0VTet2YgCP-GvmVY_3MJeZbE0Thp-mMpHQ@mail.gmail.com>
 <CAMuHMdVnD7XxQood1qy7_7gz5nzFz7QDiCXP_Fo5s12zZ_qSCg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVnD7XxQood1qy7_7gz5nzFz7QDiCXP_Fo5s12zZ_qSCg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS3PR01MB9979:EE_
x-ms-office365-filtering-correlation-id: a6de0f85-ad23-468b-e8d4-08de958821fe
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 rByWjn5J3PInYIk/dsDpKqxjgkirQWGgrx/dK7zPiq7wKe2qG0dTgrdCWHmvy5LwpWhNT+Mjxt32O7ZMs4YuW/gDb/dGjUNgiRTH6/o5Pg+PEcf2LdAUxKdefWwbEoNWPhwUpvFAKlLk/VDyRWnLnggUymOKvFMSgDgEqZUVRMRj/uSHHRWTiBBd9Y0Wg7AmyPAZq17CxpacCC2IR7/iq3xGNyFDBRWCxkA/RVg2it4WgS+bu9zeI6X5r3eLfEqrDy+JzfIWbWdQzJ6OEnfSLPWPKl3k+mSRhOu22H303h1MFTbp/9axHEHazH7qkVlW2g4EPV9Ll73x+aOBBGVa+hSl0vhy92mK/pq8NMSevkIfUx2SidxKO/1AP6QQmhP4wA+jkm6V6BF+EspTzgpFPPmpE+DUnXCU5dKRBAnuv10wR5FZqh4QsSxzK0A4ubkZpDRxuu01Ia8TdmPaV/UnztHfVeG1Rj709jrvXR3/3g7n8h3A/hM6NF+qmp5sX1FjYaDX9BM9VyhIM2Qh6/9d+U2qDw2WiwD0stjyn2cbIhzE/iMt9x22ikMnpAWHfoUTSQX6KGBGuRqFCDMgjk8QnIGK8w6J+cPxAhCHPJKRnv0yzaA8nT4JMvYFaM6kqpn7lusOoPIFX8NnNMjFApWXKWp0WyHkkpu7IrKB6xH5zSMUhdYD6MYJ1KA+ekWmIjTbiB4rKgrBwTnoDgHAU/BSMK6AeQRbTLI5dDztvBaL4z3DDNe0cvRvFByyE0gtW+j6VWbglsksfl3fZMEEuQf5ZOCY2BfbrK+HhUAE/DX24y4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YnBmZ0FPNGQ0eGtkRzhETUlmSnNYMTlRelFXUWsyYUVhTEVrYXRXSWdTWUZ3?=
 =?utf-8?B?VHlZclRXRkhqRmRtSnBKT2dKNUtldktRbXNmTHR0amlZd1lzZ2R5Qi9mdGdY?=
 =?utf-8?B?U3hMeTNWMzlBdFJxRU5sU25kcTRtb0pRSU5mWWhJMWVCMyt6YndxT1E3dWNw?=
 =?utf-8?B?VGRXWnNXNGxqSzduTjBBYlEyRVZSQmpYS0pSY2RGWlZ4cDRPUWJKQ2Fua2F4?=
 =?utf-8?B?YWhxRi81OWdXOXJmRCs1ekNKUjUra3FURzNzMGxrWGFXRzRNbXRseFI5Sm1G?=
 =?utf-8?B?VXhYZG9scnA5Znc3WmxCZWROeDdQUWJrNE5Kak9qWUFzZ1RPRGRHcTAvT2VC?=
 =?utf-8?B?Mm92K0wrRGVzSk5iZG43cWJHQVpnWDRSUzAvVWpIeUNuWFVEY2hIZUJJZFpq?=
 =?utf-8?B?SUs5VmxkbG5zR0dvZTdMdktVZFRuU2xwVmRJLzVyTCt3VTVGYUpkMDh2VDRT?=
 =?utf-8?B?Rnpyb25Rblc2TXZneFc0dGdSaXFLVDNRL0lhTHR0dE9iWnNlVStFbmt5TnFL?=
 =?utf-8?B?djBORm51NjhpdkpDSFNzYko5RHpLd1hwQ2twSFNzaWtYNUZqK2xPOEt2aTZl?=
 =?utf-8?B?QnE5dWNOVk1RY2F1MHUrZlg1a04zR0d0VEtFSnpBVWxrNEsxTWQ0R2NFWlVv?=
 =?utf-8?B?ZWZPaExCVnZJaWs4SjFjUzFXNmFOSGxZVFg2MjJ4NkFkM1FaNzRtNFhVN2xZ?=
 =?utf-8?B?a3dnTHMxRGdIKzVvb2xwQ2Z1djZ5OE5uZlIrOW5haW5NRjFBaW9jZUlxK1NZ?=
 =?utf-8?B?dEFlbzlYWHd3ZGJ0LzNSYWhLM0JTa2RUaktycXdUTHBxUWRnQlh5Q09IS3Mx?=
 =?utf-8?B?VUcxRnpmb054V1F6MVpVMUZScllhSEJlTjc0WDJsejFCT3NpZVNNMXRkYjJs?=
 =?utf-8?B?ZFJYWkE4dU1SU3lsbVpvTjMwRDdJYUg3UGlWc3JDc21meUhXdzVQRzhsTm5q?=
 =?utf-8?B?WTZMSmd4N0hRSXo3ZllIRnhBcWxrM01Ga2YzOUNnTnQ0aFh6NHVoRmMyWUR0?=
 =?utf-8?B?WXlnTU9Jc1NDeHRpMnZTSCsrMU1DalRyREJ3L1hiSXBXc08zc1FzU1VZeWVO?=
 =?utf-8?B?TFEwWE9uN0FRUTVnK1NhRE12WWFDS1YxWTgzM1h6UFFPcDZWV2FkUzFRQktW?=
 =?utf-8?B?cGJXZkl3MWZtRndRRlZlKzkvb0drdS8xclM1blFVTkJzeThkSlJnaTNlMlJU?=
 =?utf-8?B?Wm02OFViTWl5YU96eGJBQlh4R1B0YWp3eUE0ZkMxWnI1VGtBSFB3VXREeVhz?=
 =?utf-8?B?QURaaW44VXlRMHdQOUptRUhKM2JESXppVEtFWUNtVmkzaVlwdmFzWmh2cXlN?=
 =?utf-8?B?ZUhEbWp2QW9uU3Y1MTBvRjg5c1ZxKzE4ckNsVWNONU5FdGV6MXNGeVpvRHJs?=
 =?utf-8?B?aEQydnVMY0t0ZGl2S2ZZZ0FXOUdpMmFKekg3NDh4cXJNVWQ4dGphbFR4UWNG?=
 =?utf-8?B?Q3FHUUFmQVcxL2pWNHJQT1oyOTJabTloZUNFb2xJZWtKYTZRSjRUcTFZekN6?=
 =?utf-8?B?bWxQL2g4SUt5Y0dndk1pNG5RM08xN3ZPVVNIaHhuUFBDWGZ4NWUvaTljU3FN?=
 =?utf-8?B?KytrNzBIaW56Q3hTZko3c011MHJPY0wySXd5WEQrZlNDZmpYYmt1Mnk0c2I0?=
 =?utf-8?B?STlLMVRtOEpIc1ZSZ1RyeExVRUZqSmcxZTJzbktHVkxDbkVJa2MrbDQyTnVh?=
 =?utf-8?B?ejc4UkpqbTVYeVUyazZ0azErbUZkMzVud3hGeDJocCtyVHJnZUgrQUZKUTlR?=
 =?utf-8?B?RkduOHJmQTA4MU1SZXg5UDJrRXJjaWwzc0JTazk2cytuOTFaL3NwdDJwUGJG?=
 =?utf-8?B?YVBUN3hRb2NSeE5ndW9Ud3BiUXltMHFqTHZMV2QxVmdPcmNGRDc0ejVwSXRi?=
 =?utf-8?B?S3JmMnhDZ0lpbndHZzVHc292K3d5SXpEKzJQNjVWemR3NzVUMDF5REhHWnhR?=
 =?utf-8?B?K2NaN2xVZ0pjRE5CN0xwWE1qcUZYNXFmeXIrRXd2amtsRWRGRTNVNUx3dUE1?=
 =?utf-8?B?WU5nRVBYVzRZMCthT05LWHFaMDhoTE93WTh6YW1kOHRYMjAxdkw2WWdmU01a?=
 =?utf-8?B?d24xQTc3WG5SSDdzOGVlNkp1WVZMQ25FZ2lhZlh6dlFxTnhOQ2g5SmEvdVlt?=
 =?utf-8?B?OXF6TThxQTZLN290blpvd0hqY1dkbW0veWg2LzNSMlJsTUl0b3RUaE1QdXRJ?=
 =?utf-8?B?QmVZOEhGTUp0UEpybmxsZSszb25XSUxOOU03WDZXbTgxTVNSVzMvQWZHbHBB?=
 =?utf-8?B?SktEQXFwenk5TDJ5cUpDZEVEZ1ZIQlVFQXdCK0NpZTFqQUkrcytvanRpSyt6?=
 =?utf-8?B?S3Bkajd3MkxlVjZNSUN0RGZBZFNZN050S2M4M2dCeHBlU0paZ2I5dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a6de0f85-ad23-468b-e8d4-08de958821fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 16:01:45.1388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +3xACFUnjOm0Fwgaic7CnimPPFUoV3H0O8QCLQJNtMTCzikk9nONUkPh8Ody+RX/g2tnMrCFxrXm6Uy83aiQw9blqglJPMPjVOVYNEXsDtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9979
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31037-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,nabladev.com:email,linux-m68k.org:email,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D89DF3BEA11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDggQXByaWwgMjAy
NiAxNjo1Mw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gc2VyaWFsOiByc2NpOiBSZW1v
dmUgZ290byBhbmQgcmVmYWN0b3IgYmF1ZCByYXRlIGNsb2NrIHNlbGVjdGlvbg0KPiANCj4gSGkg
QmlqdSwNCj4gDQo+IE9uIFdlZCwgOCBBcHIgMjAyNiBhdCAxNzo0NSwgR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+ID4gT24gV2VkLCA4IEFwciAyMDI2
IGF0IDE2OjIxLCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gRnJv
bTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+IFJl
cGxhY2UgdGhlIGdvdG8gZG9uZSBwYXR0ZXJuIGluIHJzY2lfc2V0X3Rlcm1pb3MoKSB3aXRoIGEg
cG9zaXRpdmUNCj4gPiA+IGNvbmRpdGlvbmFsIGJsb2NrLiBXaGVuIGJhdWQgcmF0ZSBpcyB6ZXJv
LCB0aGUgY2xvY2sgc2VsZWN0aW9uIGxvZ2ljDQo+ID4gPiBpcyBub3cgc2ltcGx5IHNraXBwZWQg
cmF0aGVyIHRoYW4ganVtcGluZyB0byBhICdkb25lJyBsYWJlbCwNCj4gPiA+IGVsaW1pbmF0aW5n
IHRoZSBnb3RvIGVudGlyZWx5Lg0KPiA+ID4NCj4gPiA+IFNpbmNlIFJTQ0kgb25seSB1c2VzIGEg
c2luZ2xlIGNsb2NrIHNvdXJjZSAoU0NJX0ZDSyksIHRoZQ0KPiA+ID4gbXVsdGktY2xvY2sgdHJh
Y2tpbmcgdmFyaWFibGVzIChiZXN0X2NsaywgbWluX2VyciwgYnJyMSwgc3JyMSwgY2tzMSkNCj4g
PiA+IGFyZSByZWR1bmRhbnQgYW5kIHJlbW92ZWQuIGNjcjBfdmFsIGFuZCBjY3I0X3ZhbCBhcmUg
bGlrZXdpc2UNCj4gPiA+IGRyb3BwZWQsIHJlcGxhY2VkIHdpdGggaGFyZGNvZGVkIDAgYXQgdGhl
aXIgd3JpdGUgc2l0ZXMsIGFzIHRoZXkNCj4gPiA+IHdlcmUgbmV2ZXIgbW9kaWZpZWQgZnJvbSB0
aGVpciBpbml0aWFsIHplcm8gdmFsdWVzLg0KPiA+ID4NCj4gPiA+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlIGludGVuZGVkLg0KPiA+ID4NCj4gPiA+IFJlcG9ydGVkLWJ5OiBQYXZlbCBNYWNoZWsgPHBh
dmVsQG5hYmxhZGV2LmNvbT4NCj4gPiA+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsL2FiUHBaVUxzWGhSbVhUWDlAZHVvLnVjdy5jei8NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gdjEt
PnYyOg0KPiA+ID4gICogRHJvcHBlZCB0aGUgY2hlY2sgKGFicyhlcnIpIDwgYWJzKG1pbl9lcnIp
IGFzIGl0IGlzIGFsd2F5cyB0cnVlLg0KPiA+ID4gICogRHJvcHBlZCB0aGUgY2hlY2sgKGFicyhl
cnIpIDwgYWJzKG1pbl9lcnIpIGFzIGl0IGlzIGFsd2F5cyB0cnVlLg0KPiA+ID4gICogRHJvcHBl
ZCB2YXJpYWJsZXMgYmVzdF9jbGsgYW5kIG1pbl9lcnIgYXMgdGhleSBhcmUgbm8gbG9uZ2VyIG5l
ZWRlZC4NCj4gPiA+ICAqIERyb3BwZWQgaW50ZXJtZWRpYXRlIHZhcmlhYmxlcyBicnIxLCBja3Mx
IGFuZCBzcnIxOyByZXN1bHRzIGFyZSBub3cNCj4gPiA+ICAgIHdyaXR0ZW4gZGlyZWN0bHkgaW50
byBicnIsIGNrcyBhbmQgc3JyLg0KPiA+ID4gICogTW92ZWQgZGV2X2RiZygpIGluc2lkZSB0aGUg
aWYgKGJhdWQpIGJsb2NrLg0KPiA+ID4gICogRHJvcHBlZCBjY3IwX3ZhbCBhbmQgY2NyNF92YWws
IHJlcGxhY2VkIHdpdGggaGFyZGNvZGVkIDAgYXQgdGhlaXINCj4gPiA+ICAgIHdyaXRlIHNpdGVz
LCBhcyB0aGV5IHdlcmUgbmV2ZXIgbW9kaWZpZWQgZnJvbSB0aGVpciBpbml0aWFsIHZhbHVlcy4N
Cj4gPiA+ICAqIFNjb3BlZCB2YXJpYWJsZXMgZXJyIGFuZCBzcnIgbG9jYWxseSB3aXRoaW4gdGhl
IGlmIChiYXVkKSBibG9jay4NCj4gPiA+ICAqIFVwZGF0ZWQgY29tbWl0IGRlc2NyaXB0aW9uLg0K
PiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0Bn
bGlkZXIuYmU+DQo+IA0KPiBJIHNwb2tlIHRvbyBzb29uLCB5b3UgbmVlZCBvbmUgbW9yZSBjaGFu
Z2UgdG8gbWFrZSBpdCBidWlsZDoNCj4gDQo+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9yc2Np
LmMNCj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3JzY2kuYw0KPiBAQCAtMzA4LDggKzMwOCw3
IEBAIHN0YXRpYyB2b2lkIHJzY2lfc2V0X3Rlcm1pb3Moc3RydWN0IHVhcnRfcG9ydCAqcG9ydCwg
c3RydWN0IGt0ZXJtaW9zICp0ZXJtaW9zLA0KPiAgICAgICAgIHJzY2lfc2VyaWFsX291dChwb3J0
LCBDRkNMUiwgQ0ZDTFJfQ0xSRkxBRyk7DQo+ICAgICAgICAgcnNjaV9zZXJpYWxfb3V0KHBvcnQs
IEZGQ0xSLCBGRkNMUl9EUkMpOw0KPiANCj4gLSAgICAgICBjY3IwX3ZhbCB8PSBDQ1IwX1JFOw0K
PiAtICAgICAgIHJzY2lfc2VyaWFsX291dChwb3J0LCBDQ1IwLCBjY3IwX3ZhbCk7DQo+ICsgICAg
ICAgcnNjaV9zZXJpYWxfb3V0KHBvcnQsIENDUjAsIENDUjBfUkUpOw0KDQpPb3BzLCBJIG1pc3Nl
ZCB0aGlzLg0KDQpDaGVlcnMsDQpCaWp1DQo=

