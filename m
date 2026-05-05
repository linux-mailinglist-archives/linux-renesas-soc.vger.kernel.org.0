Return-Path: <linux-renesas-soc+bounces-32019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMuCHSyl+WnR+QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 10:07:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC94C86F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 10:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C94EC300CE50
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 08:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454A33E3C60;
	Tue,  5 May 2026 08:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tR3472kg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD053B38A1;
	Tue,  5 May 2026 08:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777968419; cv=fail; b=LObOc0oRwwWimLzPnVgc+ZsW7MOHbkODPnZVpHbLI0ScDPnv0WXXHUznpWsd6i5y5GzBVz5hYwdFi8cAHedvMUujMOQKV0fwGQ5Qx+ARmMVKCTnrNFq7dj6ByKQ0mA7gWGbMZs2v8BYHDKKlbTm+XLmmPXoWZs4J+nuzODHxCUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777968419; c=relaxed/simple;
	bh=DZ/MS4OPugOGhwu+zMobpvHuiWK4yCKfUq0N+vuAqdo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z7lYlGUOfKfUc8O8p02+/MSibWyqhr6jgM9TEb+tY3XxUJ8BioObS2kJp8BgPWBglg9wi2QKvCILqggtYDQydKYW0CeFZjYitg+gQ+9JujQydEh1ydeSwOYYkA7uvJpZqPtfFQ2DR9jOrlZGZSwlUuc11gT3ZBu0MPHQMfabqGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tR3472kg; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fU7kVHEe0mM+Kg7WucChLiSeT078J+lchEccd9Yh5afVoDXDgnz9hHXx+6Mm4hwBFoJfjyadCHPqAgbevSwsZclWkqBpeQ81fyl28HkF/GqxS5g7uGCqG2f2bC+BsJYK2i80mR3sfnKP42s0ZKBjkq9yY1BR/JCd9UAQPcfwoIUBI12T+jBHTyY2VKnDiv2nEvA+/iD69Alqm39VtJivbTg/vDRk5dwiGJrVqkwtibUeGgDtmCrrsCyjFBT9Drxi6dZK4b2x4KOi+EaKHBoRWHclJlSAI1orKYOGIeMu0vKmF+kCyX9ThkJZUYwXukR6Kc5X1nKqGFtpZPFNlSYK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZ/MS4OPugOGhwu+zMobpvHuiWK4yCKfUq0N+vuAqdo=;
 b=BodIHj2DBG9mPSB8U5RbHVpQz65F7oHv1Ec32NsI9vtZmIyy5tzinO1z18rG0i9/CVgVqKhDpZmueQd8x+pwlzfqYyoXtKeAFfBOGmSk9q+KSdZtf9iOLFGHeqiXBCvz6VEewiMq3aZoGLDl6+s4nObGMCGrFygC1e8NyhG7Nq07440N5eZQNrlYoXN6MTbTTeXeFgIP25WZJjUAH1sQxfAASsfKTle334ZuRrVbCRYG4gnL959HiyfFUsEZcLf6/vig0kRB05kv3AjUPFbCl4pbg1p41hPJIGdqv0ageaLDXBmyg+OcmqprI8CDF8AOeQpNttk4d2l3QobjACtMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZ/MS4OPugOGhwu+zMobpvHuiWK4yCKfUq0N+vuAqdo=;
 b=tR3472kgy4HOsCXtvcBvz7P19x8Z5tSDBrI5RP6ol+i673Ix9aWjTPoZ7Zb/gK4gsXVnHRNWI0cZEusrG3gODrf5Ii8J3yAWizK0zAoxolNWkpicCWzc+UOlvz/fCnGQtijU+1viT244CPl//dbbeXeHTthcIeoyE094vMup544=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9418.jpnprd01.prod.outlook.com (2603:1096:400:197::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:06:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:06:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/G3L
 support
Thread-Topic: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/G3L
 support
Thread-Index: AQHcl1rksZlmKBi7w02Zq6hIncuAibX/k7+AgAAHOaA=
Date: Tue, 5 May 2026 08:06:53 +0000
Message-ID:
 <TY3PR01MB11346B5F06CA491FCC4330D99863E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260206112227.233229-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVfGA6yie7FJ1p5Vo8pzYfT7JaapVKKs89zDajyjoYdyw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVfGA6yie7FJ1p5Vo8pzYfT7JaapVKKs89zDajyjoYdyw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9418:EE_
x-ms-office365-filtering-correlation-id: bca9abd7-07a0-4bc6-bb92-08deaa7d4512
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 FzW+Ip8a7j/wOC9n/d11wr0fwgoeL/6s4EFtSnPcxuo80RwvrbTsEbYK567IYYuffRizA2BBMm5Z3iyC+u0n18/jZqtB5vu3Rg0h6vWelpWzTB4cfn6ePBxSsL2+FV7GdU8cvlnOop4U72+G1es8y/n95zkJN6CXQxfnNMU0Z5Y2glvJCyqAZJXvEzI4x7muHTbC1D6TNOnh554Vc2BZrfN33RvwBe5BBJXjxHh1zI9nrgXmQzVYVGNnYqcYHjJ8WG1WCa4R9Qg4YW7itc7Rp1fsnSULnNvPVTeL50tIS//1OAaUDyJLQC4rTnfGHaHyvOxGLIJmfFKD6p4SttexO9RrJgBR9YIZ7J97Gah8iE2Sh+d5wcs1j1SVXXMo5s3y0U/xIrFj6oGAG4lHt4r1BoGvNxBg2ObLnZnkqguwd99uZXJHzw+MNNB+s4nQRkZrTbpTh7QSXY6UEG2nc+q5l6iS96/N/BRiPn0pXqNRgYBffddJYWRkfVJrIjyiJWUj3N0v1IY08isa7b5MXePFiko49RN3H1UslcAMzJA466qsMEJeXclqtlXIAMKaF9XYALCE2duExx84eqmcBd8aem7GTK7BLG9PiPmskWIIozO+6byYV0hZ555b0QrnJejTwOBNR9leiXYM60l+Gn3EhyjP0D2dB1dTYxkYglhxnvqkikHni7aPmzgVlOgjzhb5CZ+qym/wNIvBIdiBtaBtkoACzVcnpuv1jxFtFmZu64jXsZO3ROtrxmGdV6Re6S4X
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUhvQ3VQblpQZHJwbjQ5MWxjTnk4Y3BtK3B2S3BRMkJCRXkrTFV3eE9hZzFa?=
 =?utf-8?B?Q3p0MWtMcVBOc1pjVHJjUUNSbXp5Q2IweFBKd3E1QVFTYVNoa3dLSXdPWlV2?=
 =?utf-8?B?THY5YUN0VUpRTjBsMm80eDFzN2tsbmRWdjdiT0d1RzBVdWJ0bGpBb1E1NWJn?=
 =?utf-8?B?MmpQYVBZS3lYYlRDS3dTY1E3MzhrMkl3TUl3SUpFVmJaN0Rla3ZXeHpqeTFN?=
 =?utf-8?B?NWMvcVREVDJ5Tzh0YTVSQkw4M0YvUmxKWi96Nm5XZEdwSlNCRUN1UThQUU84?=
 =?utf-8?B?am1wRkRnYm1lUVI5cEtqU2JieW5vc1FlM1JRTUx3dURYYWZJZVViREI2NThQ?=
 =?utf-8?B?VUNyN2VGc1U3djUxcXRSZ001SVRjUW96bHVLaTB2dVl3alAvdVRkUnJGRjA4?=
 =?utf-8?B?UmNReGYzWEMvTVczRWdGVTNjdVoxM1p6UlRMb2FYVkxaSE96S3Y0OU5kUS9J?=
 =?utf-8?B?ZWQyUTQxWnhnYXU1bXJFQXlMVWlkZGg4Wm5rZEJHS0hUNkFIOTcrMXd4eXFr?=
 =?utf-8?B?Z1BRaVJlZG0yQUpLdEVKWWJ1S21QZDhaSmRFaFV3SFVHUzVsZ2R1cnk1cElt?=
 =?utf-8?B?TWNVdWM0Q1A0Ykw4OG43UWVVUHliZG9VNlk0Yjh4MkNEZnVRVXZWRDJHcmVt?=
 =?utf-8?B?OVhYRXByOVoxQisxamRnNncvYTEyN1hDVGpOalBqc282VGRPenFIaEFjbjNT?=
 =?utf-8?B?RWpiZ1RmbWdmVVVGWUhTUnpHZ2U5WERqYXU0VFhJaDNKamhVc2dkbmluMmxW?=
 =?utf-8?B?aEQ3b3YyZGx3VFBWMXVZMXZuNWM2dS8yVHNNOXI4c3Bua3g3V1ZrTnRWWWJN?=
 =?utf-8?B?VlpPYzk0OTliYmF0VCtNQWVMcG1ndDZPWUJwY2tySlpybnNxUmlnVFFnNEJz?=
 =?utf-8?B?WG9aT29aTURkK0RyS0ovdVJTdGpBNk9wZ1J2OXlBcmM2YVpORk1LT01ObUUw?=
 =?utf-8?B?NW5DVTJGTlhVZDl1a0Jkd3RuWVQ1OGRZOXJYdzJidjlFOTZZYm9PdVdCRzNo?=
 =?utf-8?B?OFlvYnh6aGt0ZlltaVdrRHpsUUU3dUp4NisrNjRoUXdEOXdWeHVrdWl5bWtx?=
 =?utf-8?B?Zy8yQi9jdGNEbjN2dGlMdEw1VnVMWEZweGJmZTRmVzAxT01JSHRDMDUxVk1x?=
 =?utf-8?B?RWl0TTgvaFMyZEhxTW9UUG90OXphQVdSMXo3K2NBSUliL2xhMEh2RnlSUlpV?=
 =?utf-8?B?dklwSVEycVJqTHZPWHpjclV3bW1ydzFIQi9UMG9CN0NIdzVuZnkrL3NXajZj?=
 =?utf-8?B?SjV1eitZRTVtRktBZFM5NldpV0EveFlQWERXZENDNnowbU9CUFJKbkFWTGlK?=
 =?utf-8?B?YnpWZ29oQm9XZXRQZ29ta3dEcmlpenR2cFRTNHhIQ3NZT0VuWXZGVnA0Uks2?=
 =?utf-8?B?UWJydjZ2OU9aQm55TnI2Q3lXVW1uM1BJd1ZoOUtZcFpwbW5PaDk0TFpVRWZ6?=
 =?utf-8?B?Rm56ZFhieFJ1WEdna2RwK2V1TnNRVG4rSU1qeWs0ck9vNG5MeHpFS3VidWdp?=
 =?utf-8?B?eTN0RFZnUnlnN1pLZy9lL01EYm55dUFwSThlbDF4T2ZBTGovKzBId09vN2Yw?=
 =?utf-8?B?OENWSGxrUDJscG1FR3o4dytrY2Jlc1MzS3N4LzRNTEEzSkdkVzV2VC84TVFD?=
 =?utf-8?B?ZzZkYmFaQ0J2c2NpYnBiTFZ2S2hCRDdOKzd5cHhTNm1adG9hUGh4YU1VZ0V1?=
 =?utf-8?B?WVFPSGFBQmpyOFRVaUdTMW4wQ1R2RStkbVhVaFJtb3ZwTzQzOE50b0IwZEhY?=
 =?utf-8?B?SWNDblRqVkxjSmRLTjRKUzhWL1JPd0pna0NWL2dXZXNVS25nUHR4WEZvY3Zq?=
 =?utf-8?B?N0I5b2UzSWtNc1lsWmgxK0p0T215TlB5MkRqSW8vd09kRUFZUVUwS2NSaXVK?=
 =?utf-8?B?a0JGM0Z6Q2xqeis1YmprSmg0c3d1MjdyalhSYjA5QUhsczBLTURYRFZ1MWxK?=
 =?utf-8?B?SXpRL0xObnhMMlVLdFZGRVhUYldJem9HblNZYURidDVyT3FYUmxCa0NSUWNw?=
 =?utf-8?B?b2M5ZFRYaFhmN2paM3RKdGlmcFNJVU9acmxpem1iNXArMmtJVWFEU1RnaHhC?=
 =?utf-8?B?VDQ2bmthbXNKR0oxT3ZvVDRMZCsvWngzeXoxRlE5WUJEVVRkQU92dFlmRzN0?=
 =?utf-8?B?UC8xS2g3Z3dYZXA1RHoxVzhVRVVreTZETVZlMEZOdWgwamxWZ2RSVVMwMytM?=
 =?utf-8?B?QU5PQWw4ZmtTeHE1ekdnRGF0UUxTbXN5UFNOblJkbkRjNG1oL0pFT1JjQmto?=
 =?utf-8?B?ejJxQ2E5bHRRdTBUNHlBQlpQb3gvdEhGUEFPQW5hYlh6dCtiMTlhUWpBNW5T?=
 =?utf-8?B?V3lGTnBKTXJqTi8wUDZxODJOQzU2N3hpN1lBVjkrbG53d25YUmN1QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bca9abd7-07a0-4bc6-bb92-08deaa7d4512
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 08:06:53.9518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wxmuBpCvqznmzpw/tO93XG5eRxiSH2fsQd0YPWiizcRFNKrRutEB2v3e0BPv7SG9iYFJ3HttE09ps0bdbGBPngINE14NqgdwdK31PMMAkfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9418
X-Rspamd-Queue-Id: CBDC94C86F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32019-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA1IE1heSAyMDI2IDA4OjMyDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IGR0LWJpbmRpbmdzOiB3YXRjaGRvZzogcmVuZXNhcyx3ZHQ6IERvY3VtZW50IFJaL0czTCBzdXBw
b3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCA2IEZlYiAyMDI2IGF0IDEyOjIyLCBC
aWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IERvY3VtZW50IHRoZSBzdXBwb3J0
IGZvciB0aGUgd2F0Y2hkb2cgSVAgYXZhaWxhYmxlIG9uIFJaL0czTCBTb0MuIFRoZQ0KPiA+IHdh
dGNoZG9nIElQIGF2YWlsYWJsZSBvbiBSWi9HM0wgU29DIGlzIGlkZW50aWNhbCB0byB0aGUgb25l
IGZvdW5kIG9uDQo+ID4gUlovRzJMIFNvQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaCENCj4gDQo+ID4gLS0tDQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvd2F0Y2hkb2cvcmVuZXNhcyxyemcybC13ZHQueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9yZW5lc2FzLHJ6ZzJsLXdkdC55YW0NCj4g
PiArKysgbA0KPiA+IEBAIC0xOCw2ICsxOCw3IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAg
ICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0NC13ZHQgICAgIyBSWi9HMntMLExDfQ0KPiA+ICAgICAg
ICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNTQtd2R0ICAgICMgUlovVjJMDQo+ID4gICAgICAg
ICAgICAgICAgLSByZW5lc2FzLHI5YTA4ZzA0NS13ZHQgICAgIyBSWi9HM1MNCj4gPiArICAgICAg
ICAgICAgICAtIHJlbmVzYXMscjlhMDhnMDQ2LXdkdCAgICAjIFJaL0czTA0KPiA+ICAgICAgICAg
ICAgLSBjb25zdDogcmVuZXNhcyxyemcybC13ZHQNCj4gPg0KPiA+ICAgICAgICAtIGl0ZW1zOg0K
PiANCj4gSG93ZXZlciwgdGhlcmUgc2VlbXMgdG8gYmUgYSBzbWFsbCBkaWZmZXJlbmNlIGluIHRo
ZSBmb3JtdWxhcyBmb3IgdGhlIHRpbWVvdXQgcmVnaXN0ZXIgdmFsdWUgb24gdGhlDQo+IHZhcmlv
dXMgU29DczoNCj4gDQo+IFJaL0cyTCwgUlovRzJVTCwgYW5kIFJaL1YyTDoNCj4gDQo+ICAgICBX
RFRUSU1FIHNldHRpbmcgdmFsdWUgPSBcZnJhY3tXRFQgY3ljbGV9eyhXRFRuX0NMSyAobiA9IDAs
MSwyKSBjeWNsZSDDlyAxMDI0IMOXIDEwMjQpIOKIkiAxfQ0KPiANCj4gUlovRzNTIGFuZCBSWi9H
M0U6DQo+IA0KPiAgICAgV0RUVElNRSBzZXR0aW5nIHZhbHVlID0gXGZyYWN7V0RUIGN5Y2xlfXso
V0RUbl9DTEsgKG4gPSAwLDEsMikgY3ljbGUgw5cgMTAyNCDDlyAxMDI0fSDiiJIgMQ0KPiANCj4g
SS5lLiBvbiB0aGUgZm9ybWVyLCB0aGUgIi0gMSIgb2Zmc2V0IGlzIGluc2lkZSB0aGUgZGVub21p
bmF0b3IsIHdoaWxlIG9uIHRoZSBmb3JtZXIsIGl0IGlzIG91dHNpZGUgdGhlDQo+IGZyYWN0aW9u
LiAgSSBhc3N1bWUgdGhpcyBpcyBqdXN0IGEgdHlwbyBpbiB0aGUgZG9jdW1lbnRhdGlvbiwgYW5k
IGJvdGggZm9ybXVsYXMgYXJlIHN1cHBvc2VkIHRvIGJlDQo+IGlkZW50aWNhbCwgc28NCg0KSSBh
Z3JlZSBpdCBpcyBhIHR5cG8gb24gUlovRzJMLCBSWi9HMlVMLCBhbmQgUlovVjJMIGhhcmR3YXJl
IG1hbnVhbCwgSSB3aWxsIHJlcG9ydCB0aGlzIGlzc3VlIHRvDQpEb2N1bWVudGF0aW9uIHRlYW0u
DQoNCmFzDQoNCldhdGNoZG9nIHRpbWVyIGN5Y2xlID0gV0RUbl9DTEsgKG4gPSAwLCAxLCAyKSBj
eWNsZSDDlyAxMDI0IMOXIDEwMjQgw5cgKFdEVFRJTUUgc2V0dGluZyB2YWx1ZSArIDEpDQoNClRv
IGdldCBtaW4vbWF4IHZhbHVlIDQzLjY5LzE3ODk1Ni45NyBtc2VjIHdpdGggMjQgTUh6IG1lbnRp
b25lZCBvbiBhbGwgRG9DcywNCg0KV0RUIG1pbiBDeWNsZSA9IDEwMjQgKiAxMDI0ICogKDAgKyAx
KSAvICgyNCAqIDEwXjYpID0gMC4wNDM2OTAgPSA0My42OSBtc2VjDQpXRFQgbWF4IGN5Y2xlID0g
MTAyNCAqIDEwMjQgKiAoMHhmZmYgKyAxKSAvICgyNCAqIDEwXjYpID0gMTc4OTU2Ljk3IG1zZWMN
CgkNCkNoZWVycywNCkJpanUNCg0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhv
ZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgt
bTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0bw0K
PiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
DQo=

