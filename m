Return-Path: <linux-renesas-soc+bounces-30879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC46KnQV0GmV3AYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 21:31:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4486A397A6C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 21:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5648A3003D21
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 19:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7A43D5235;
	Fri,  3 Apr 2026 19:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WCnFMIho"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B336E498;
	Fri,  3 Apr 2026 19:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244657; cv=fail; b=IJwem2EnnUB6WlsFklOWJa1sTZaucy57+rNGjOgSis0is9ckKJIQpVdKgb01G2g8I5qwdU2xa8JqYSr3vvVQ6dKf/rzj+tTi5IBv/zdJnVYI6/guJRQwSxEzMXLkBuqbd/fmEgIbWaZVLkvmDrWYmFaSUCESbJqPhHfD5br7UH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244657; c=relaxed/simple;
	bh=oHy+Y26VjgXiWSlm/n7PEavwaFP+iKSyMmlqVjPkllY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ArxTieXtxSLf84qFr2r/Yuk1biZxHLKtq4TVnVp9pZhzzSIT+NX5/7IyAjuAtsR1ynsSQhQJmVx7cA1MFfzQUw+Dq3cAjxZ8cniaNTfbvSc4C++2/KODuxdazuafTPvEpAWvSmjWQZWxqWbNzgIB0xabqi5PuheLSNP0L/oDDzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WCnFMIho; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdBQJlepX7pAodl0hXbjz1pqtJPjQL/Z2u/d0Gg4fjuSqed1Z9ApIFw/3Qccpjl0JEd5F/AIBwM6pTCPGU3luhpKmbySC3pJc4nKIzuhesWkH8N95mAksHOuS3tccGQVF4rPEOfM1HDrAtRUmAXx4uyuFeJ8L5rlk6gnHwsvPjJ4zdn2iKTKB59GD0TWPa/gqX80MSFw6E+dITHAnRdPQ/qnwrV+wbTJafp4sJi+5BTp1p89prpRo5814ljrHCbaLgR+gFxMz3Af3eaWgCSoxEQENXsBT9FuHfE6bNDAhSLpgsbPDHwK712LyJ0U/1bsK9+LsmTxn3rdsromR4ihBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHy+Y26VjgXiWSlm/n7PEavwaFP+iKSyMmlqVjPkllY=;
 b=mZ6qOZIRaN4/xGXazNYzfSeJGX+kn7PxwKccy0YIs+a86vvkj8bmFsP0g3SJvAiM+OigeK23IIcSCvosoZ1BqI/W0g3eKNTy1jJC4N/fL4g+RV4Ea0C7BQWeVVYHhgMfhMGC+a2uFYBQqczwI1jabtyn3U4D9xc2bK6WL4HmNHuCuw5iXloNPM4OGOXjwB+9ogTBH9tYiM4DFYYgzViT8CzCFGk824i8tFCObKbF6hgcd5KtkNharK803wAhEElA0341Ev2esVrGi8IBfUth8caFrk3fFSVwV3TVtckHrtI+tDiDjwCRhxRXUnh3c0/jRSZa8fVp2yTrCAbKpYuc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHy+Y26VjgXiWSlm/n7PEavwaFP+iKSyMmlqVjPkllY=;
 b=WCnFMIhoWdrNyLeFx72hxYzfcz68FNdyM15cE9ZFFn+TQ44/SQRbjStlGW1yFslIQ+hPce6PCUGhzbiljcxq7MKP0uALkotOpIcTWD+9AzNIb7DsS5b1YJpAJG8aciI8dJD9YO7Q78m5EsyjkZm+mz838BE06E76LPRwLWgh0eE=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB7185.jpnprd01.prod.outlook.com (2603:1096:400:e8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 19:30:52 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 19:30:52 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, magnus.damm <magnus.damm@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCh v3 09/14] ASoC: rsnd: Add ADG reset support for RZ/G3E
Thread-Topic: [PATCh v3 09/14] ASoC: rsnd: Add ADG reset support for RZ/G3E
Thread-Index: AQHcwr1mZoltnzxKSUuFDEVr7asHXLXM88qAgADGwuA=
Date: Fri, 3 Apr 2026 19:30:52 +0000
Message-ID:
 <TY6PR01MB17377E0E7C64EDDA6F4E725B3FF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-10-john.madieu.xa@bp.renesas.com>
 <CAMuHMdUHzcq_f8t0hi-FjiG2FByNmx8k2sz9-QEqzroLSWqXNg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUHzcq_f8t0hi-FjiG2FByNmx8k2sz9-QEqzroLSWqXNg@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYWPR01MB7185:EE_
x-ms-office365-filtering-correlation-id: add86514-d966-4ca8-fb71-08de91b784aa
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 cTUhW30kFkpm71OynDNT5A7+OvBOzHqFBDsX/pDfBqAESWQMgCRfv5eCUnfjt7+jz3Lnm7Igkqvr36mnxLirD8DkCOVqFtxvqy3zB2aUh3AwSOBm1/Sw03sCZbFtxlrXdZeWE4o3sz1xBl/vjFd+6fyDOCPwZ0F0OL/w0ufWUuevENTJpeHHmKqZj/tpN4Fb0gTA8sun5SP9eLmyn7IEo5WzJyQHdb0OrLP91+ykjMcUNPYqUzVNeuyJSLitOoDWeIzmhzJJMzRen+58HUEp6OB+YzSmceF8/wsl6nqESb6InOCkDbM0ioDPi9Lv2QEvnbL1upOzJxyWIvD45Rjq6jWTNMBhDMARy/eF7KkY+BuixWvR7bQJ0xZogy7Hw6/zMUyBMk5pxut70M/BlRvg+IKFwoWy3tUNAMVr+S6QdhVJWwxHfKJz1fPlK7UoykvbQHlj4LWC3WoJsHb9ecD5e7Yp5t5RunOlRjavAoIB9dN3QUi2L6/MoQh52S/ApJP3/ZAuybgYDsunCRm3iDEXQIf3dEIrej6NUq/4hZQhmbgfn6+QtAaulpPKsHcAzgPtS4YwzlF5nqGFewfn8PF9yRJFXHzpnW6YnA5LJXzhDJZbyblhG5Xm82hw2WSKADuk8/mzipxRZhwTYFtjPrOpQWVCD/auVh2olMBLios0QPHryaaXH5Wss0iBZcX2mZ2d3j1JWDVPglzsVGPiFfOXv6tAEJFjQJ/L1dchg8+91GT7J+SDXVW+8HeLEnfkfr6FO75RC/hBQkdzlFPVAZx8z9XAY8OKgSB+DaRW3C6ymTM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cVZMTnBHZzBIbElDeVRZTUlSc0dXUlYyeDhMUXptRHN0UE0xNHRmTmxaVG5M?=
 =?utf-8?B?emFDY1E5VG5xZE9jdFBMTUpZdHdTK01wQ0R3Y2VqVzBoa1Vsdzd2OUc2QkJy?=
 =?utf-8?B?cHF4R2tiVEM3L2RvS1EzZEdpazBTb3VIL1lBaXZQSUMwOFlIUzlNUlI5N1Q1?=
 =?utf-8?B?L3JHSUFLQWxoYWNaT1lEbUZHRFhCc1c1YjY5V2wyRjFraWI1TlNUVzE0MGw1?=
 =?utf-8?B?dDVwcGhOOGxoVGhqUzRkeWxyNEZEaUJsbE56Z3Q0N095cUorTVh5eEZMclVF?=
 =?utf-8?B?Z0QwUWw5clU5cG40WDBSaWpzaStKSDVQSTF3WmpnaVpmMnhCU0lQaElTQ005?=
 =?utf-8?B?N1NPZGJSL21aazk4M3d4enc0WHU0ejBHNWp2M2tMM3VzVTMvUlE3VUp6bkMv?=
 =?utf-8?B?dW1FanY5anRZaThkQkRSaTlLYjJhYlFPT3VocEwwaG9pVldHTGpDeU1jRXI3?=
 =?utf-8?B?NEdFbVRwVXhKcjltd3dRSlhwK2ZoWjd1a1YxVUEyb05RT3Z2eHhuSUZDTEc3?=
 =?utf-8?B?V2JUYms1OG5kODRyRkRnY25kUXdNK0dPbXBHUzlYNi9GWmsydFNxMlg5b2RU?=
 =?utf-8?B?MEllc2RjRFZodVp5S0ZCVWwxMEIwcVZLWUM2WVRVOW54NHoyWTdEQ1QwQ3VX?=
 =?utf-8?B?RW1SUS9NRU1qTmQ3clMvcXZpTUJLamJIOGY1RUdubGNyZnV4OS80cEhaN1FM?=
 =?utf-8?B?ODF0SVR6MkY5Nm80WWMxTjliVTNTU0dZTlRxL05POHBNV3lpdHZzWlhrVWdp?=
 =?utf-8?B?UGF3amFNSjRXbEhtS3RSY0ZhaHM5SVcvTjNQUVNPcEE2UlNWTDFENFgxZnl1?=
 =?utf-8?B?MWlzOTVHWlVYOUQrNVcyQmlyQk9qUDQzaTE3QVhuejFyeVZvRkI1Z0JQQkpT?=
 =?utf-8?B?clowOWVFZENIdkRjejJuWG9SeGJINnFGNWR2K3dFSkcyZ3pWQkN2czlWRVZB?=
 =?utf-8?B?MVBZOHBaQ2E0SUtEaUc1RFprTS9QM0xsOFZyQWJ4alVJcVY1bjZaNzhpMFFC?=
 =?utf-8?B?dWN1ZzFqUmIyaXozUHZZN1FTSzVvaG1yRnA5V3RNWjVPcndhdzFxWUttVnlY?=
 =?utf-8?B?citqOWNrNzVMVGVIU2p5N0VYUDE4dklKQWM5dkt5S1RBYi92RXF3MnNIeWxG?=
 =?utf-8?B?S0NYWjV2cmRxYlE3YzYxdFk4aVlHcElxYkt0dlJhYnFwYnNjZmxNT3Fsd1R3?=
 =?utf-8?B?RkZlK3lKRjVPRjVOK0ZwYXpycW1uTVJGUFNZVVgxZnNNRUpGckJKdXpBNDdm?=
 =?utf-8?B?WFBWaFVVSXNyUmt0b2QvN1RZMFU2Q0lmSG9QU2lLc3RtWE5IME1TUkRrRmZD?=
 =?utf-8?B?T3ZCNDBrMU9SVElXRGJYZzN0QzBFY3VyMWtSRlRlNTlmc3VpcUpmVllwNTEx?=
 =?utf-8?B?ZEkvYzM5RmNiYTRCZzFjakZOVXM0K0JCWE1aMG1wUUtDTHJKM0kzSzJWd0Vx?=
 =?utf-8?B?NHhuYkdhQnFIb3RoUjZMY0RSUSt0M211ZlZxOU9UcjhBL2Z3WVJpZ0l4a3ZV?=
 =?utf-8?B?OUxCdE9IcnFxL1J2eWpsK1h5VlBBTXhyQXplb1NVNzBsNDFyNUhuM0FrcGts?=
 =?utf-8?B?MkhoUzIxUWRNUk0yNHZ5RGhkcWp4MVBaTXBuWXNLNys5UGthSzlYR0hUTy91?=
 =?utf-8?B?d254emdJdFd3ZUVmc0xURWhNV3NrSTZDYTJEYVdhTmEvNXNNb1llbU5sLzBO?=
 =?utf-8?B?U1RmNStyU05ITFlRaGU4ZGxvZEJxdkhnNmpoSUZCNjdJMzgxalNYQm5vQmgx?=
 =?utf-8?B?NmxjaU4rUHRFS3A5bm1rb1RGcEpvRW53c2ZoYlpJOUNRTVZoZ29NZzdidVhq?=
 =?utf-8?B?NjRiSENvQWRsQVd5Sld4dUdYSitwd0ZlVmpldGpEeFVRZU5iN0JlNWJyRk9H?=
 =?utf-8?B?TGVib3dYdk5qRk1HaEo2SjQxRXZocExXRThIZjUrKzhHTUUwQ29pclp3NVht?=
 =?utf-8?B?MXJEdEo2THQzdzREV1NJeHpZY1JOSVgvRkczelBqa1R0M0tZOEJmRVc1VXdO?=
 =?utf-8?B?VnJrZU42M3NyWnVLcjJOQlpGMU1SN25Tb2ltbkhEU3pIRVNacTJsaGthY01s?=
 =?utf-8?B?c1NtWkpwUnZ0N1JZL0xkczJ5cUI5b0ErZWd6TEhCeXZRYnlsMXlyRHI2M3V3?=
 =?utf-8?B?YUkvZ2ptQ1pvVVlrdzRVMjVVM25NcGdVaC9jbkZmeFRoMDZBdDVIYTNWQTJ4?=
 =?utf-8?B?MUZ4cXlWK25DSlppVHFPMnd6TE9VbFVYSmhNTEU1bndJSDBEdVk3OGNPSkpO?=
 =?utf-8?B?eWN4R3k5RVlpNWxic2lWYXpiTThscmZ5U21scVBRWlBaZVNOS20wNEtzU0dU?=
 =?utf-8?B?OTZaTzNtWUlsOW1rcXQ2dVBNbDBsYnliZWlwdTgyZmk3Q0ZRcnpSeGJoUDRX?=
 =?utf-8?Q?olliW/480gpPJSUw=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add86514-d966-4ca8-fb71-08de91b784aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 19:30:52.3932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 80Sf1Zy668XSGgwie7HRcU1zKSUKxd0vbza74RC2ZHMSw8tGxW0pRiY8a3PiT+hxIhF/qq4FPJK5sl2hChdfj1CBU+ARN6SORNzjQLIVCfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7185
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30879-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-0.905];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,linux:email]
X-Rspamd-Queue-Id: 4486A397A6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsu
b3JnPg0KPiBTZW50OiBGcmlkYXksIEFwcmlsIDMsIDIwMjYgOTozNyBBTQ0KPiBUbzogSm9obiBN
YWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENoIHYzIDA5LzE0XSBBU29DOiByc25kOiBBZGQgQURHIHJlc2V0IHN1cHBvcnQgZm9yIFJaL0cz
RQ0KPiANCj4gSGkgSm9obiwNCj4gDQo+IE9uIFRodSwgMiBBcHIgMjAyNiBhdCAxODo1MywgSm9o
biBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBS
Wi9HM0UgcmVxdWlyZXMgdGhlIEFERyByZXNldCBsaW5lIHRvIGJlIGRlYXNzZXJ0ZWQgZm9yIHRo
ZSBhdWRpbw0KPiA+IHN1YnN5c3RlbSB0byBvcGVyYXRlLiBUaGUgQURHIG1vZHVsZSBjbG9jayBp
cyBhbHJlYWR5IG1hbmFnZWQgdmlhDQo+ID4gcnNuZF9hZGdfY2xrX2VuYWJsZS9kaXNhYmxlKCkg
dGhyb3VnaCBhZGctPmFkZywgc28gbm8gYWRkaXRpb25hbCBjbG9jaw0KPiA+IGhhbmRsaW5nIGlz
IG5lZWRlZC4NCj4gPg0KPiA+IEFkZCBzdXBwb3J0IGZvciB0aGUgb3B0aW9uYWwgImFkZyIgcmVz
ZXQgY29udHJvbCBvbiBSZW5lc2FzIFJaL0czRSBTb0MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFu
a3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL3NvdW5kL3NvYy9yZW5lc2FzL3JjYXIv
YWRnLmMNCj4gPiArKysgYi9zb3VuZC9zb2MvcmVuZXNhcy9yY2FyL2FkZy5jDQo+ID4gQEAgLTc3
MSw2ICs3NzEsNyBAQCB2b2lkIHJzbmRfYWRnX2Nsa19kYmdfaW5mbyhzdHJ1Y3QgcnNuZF9wcml2
ICpwcml2LA0KPiA+IHN0cnVjdCBzZXFfZmlsZSAqbSkNCj4gPg0KPiA+ICBpbnQgcnNuZF9hZGdf
cHJvYmUoc3RydWN0IHJzbmRfcHJpdiAqcHJpdikgIHsNCj4gPiArICAgICAgIHN0cnVjdCByZXNl
dF9jb250cm9sICpyc3RjOw0KPiA+ICAgICAgICAgc3RydWN0IHJzbmRfYWRnICphZGc7DQo+ID4g
ICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSByc25kX3ByaXZfdG9fZGV2KHByaXYpOw0KPiA+
ICAgICAgICAgaW50IHJldDsNCj4gPiBAQCAtNzc5LDggKzc4MCwxMyBAQCBpbnQgcnNuZF9hZGdf
cHJvYmUoc3RydWN0IHJzbmRfcHJpdiAqcHJpdikNCj4gPiAgICAgICAgIGlmICghYWRnKQ0KPiA+
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPg0KPiA+ICsgICAgICAgcnN0YyA9
IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlKGRldiwgImFkZyIpOw0K
PiA+ICsgICAgICAgaWYgKElTX0VSUihyc3RjKSkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJu
IGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHJzdGMpLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIGdldCBhZGcgcmVzZXRcbiIpOw0KPiANCj4g
R2l2ZW4gdGhpcyBmaWxlIGFscmVhZHkgdXNlcyBsaW5lcyBsb25nZXIgdGhhbiA4MCBjaGFyYWN0
ZXJzLCB0aGUgYWJvdmUNCj4gc3RhdGVtZW50IHdvdWxkIGZpdCBvbiBhIHNpbmdsZSBsaW5lLg0K
DQpBZ3JlZWQuIEknbGwgY29sbGFwc2UgYm90aCB0aGUgZGV2X2Vycl9wcm9iZSgpIGFuZCByc25k
X21vZF9pbml0KCkNCmNhbGxzIHRvIHNpbmdsZSBsaW5lcy4NCg0KUmVnYXJkcywNCkpvaG4uDQoN
Cj4gDQo+ID4gKw0KPiA+ICAgICAgICAgcmV0ID0gcnNuZF9tb2RfaW5pdChwcml2LCAmYWRnLT5t
b2QsICZhZGdfb3BzLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICBOVUxMLCBOVUxMLCAwLCAw
KTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgTlVMTCwgcnN0YywgMCwgMCk7DQo+IA0KPiBU
aGlzIG9uZSBmaXRzIGZvciBzdXJlLg0KPiANCj4gPiAgICAgICAgIGlmIChyZXQpDQo+ID4gICAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0K

