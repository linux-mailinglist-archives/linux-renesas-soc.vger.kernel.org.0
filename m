Return-Path: <linux-renesas-soc+bounces-31496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O6KN/Sq6GnEOQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 13:03:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0A244515E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 13:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 553253012E8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 11:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6DD2BEC23;
	Wed, 22 Apr 2026 11:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OCbrc9YP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECDC34DCEB;
	Wed, 22 Apr 2026 11:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855771; cv=fail; b=gB3JFBf4HEWnK5ZhAkPkmV3H2ZlFUBsZSZs7/1fpNOFwzP/Q7NIevW0KIW4NNtRwjSpcRjGxD4xSU3vpCOu1NnRoPUTSZGDBMZljf93qpkd3DovueT4NXoUMwRuk+IEwO3F5bZUlYExXlC8BY8xluyT5Z4sm99OB5Or/5kBbt64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855771; c=relaxed/simple;
	bh=SDIYMrgarLHOXqZ7V0JiJI6VLbXVhPLaXFemNllWZao=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tFmWBOiN+XwcYPeejji35TrgthvVr10vZBpTlDC0usyQoEfxvw4+CTMrbOLLaJiHBeGTgQfXCYbPwJ/IyS6kc6D7IvsZvVbX+54zsiZUEEIqIqWgt3fQoSKPnUeBJhb05cs6VXYRM08dtH5mJp6OtHq7OTQuY77/1W7J7Lstc/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OCbrc9YP; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hR6zLb3kNKO6SM5WcQAV5jbPx+a52EQOufXa3DpBeIoK+CTK/kN1Htc06HicAmODhfuVGVjw0MhZc+/OKgSRlr9HxvPwN4kEoHi4hqI8WpGdmqGjcJpO5+lDddVxnjd4W7uBmAFn046DX751qM1ChHBcpABZT1EBn2CrJUfTt7Prnfl/44d4jQyDAIf+dhtGVR3ksEniVC4WxkXwsiyOMzoW9W9WFfOlaNsvih9Jt8NbYsf942xSGblCff+8tLZT0Q4GRDjv1FZCoFYHXxo7nb58bDwst/WE+jk64iCMURTMuZ9TtmK5MOWto4AKrQgQEHJtf1HONjmCIzlOAIBerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDIYMrgarLHOXqZ7V0JiJI6VLbXVhPLaXFemNllWZao=;
 b=H8E/sFEE2CRdGB4Vq8afTR8x+ppvXe1amz94YCn05ZMkX6yDEO8NkLn98+qeh0u2AoZviJ4EdoTd4jjzym8DyUe4FbhckpHYTokRjg+7+a1/TdfX3IDttkpBH/bdQNFd5wqIHffRGvbFeM/z4T4NITHlC01+WWMlZaSntoDaQbq6AN+yYeOJOziby6X/r6iMtsddDyfBkRWYY58+0T5usIiLjDFNwiqdhgy0ema5bNeSJ3tZqgt9wOJEubFKRD3yimFDmeV+ImxJYCSRRmRug1WM0AlKVFDRjO7ku+m3Gy12MNpe5C8DyNeyPs9krTNHzm3KCnHO21uIo+/qSBW+tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDIYMrgarLHOXqZ7V0JiJI6VLbXVhPLaXFemNllWZao=;
 b=OCbrc9YPczjlJkewfr0EZ3qpe8vBKuj2GfF1OP3stecYTQfO5hcSI8SZ7+Gqhz87jKPvpOi1O6DDB+Z0QmKA3UBD0Tx4eUiPW6/1wXr7petyUZDA7V5CtsDX8qkm7BaNYs7CcpuPiPTgKIOdlZlZwPn8SDIvvRjBj4kHh1TV1D0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB16244.jpnprd01.prod.outlook.com (2603:1096:405:2da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 11:02:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 11:02:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: biju.das.au <biju.das.au@gmail.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Andy Yan <andy.yan@rock-chips.com>,
	Douglas Anderson <dianders@chromium.org>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Jesse Van Gavere <jesseevg@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on
 device during resume()
Thread-Topic: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on
 device during resume()
Thread-Index: AQHccNTTduZlWQWrnEiAvemqifSjf7WxuWcAgAA85YCAAfPyAIAAe5TAgDdGnOA=
Date: Wed, 22 Apr 2026 11:02:45 +0000
Message-ID:
 <TY3PR01MB113468A6C8FA8E547FCF21EF0862D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
 <20260316140232.GB31616@killaraus.ideasonboard.com>
 <TYCPR01MB113325ADBA0ACD1872BD4959B8640A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <20260317232952.GD408929@killaraus.ideasonboard.com>
 <TY3PR01MB11346985D2509C34639B4560B864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346985D2509C34639B4560B864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB16244:EE_
x-ms-office365-filtering-correlation-id: bba1fdc5-481b-42c2-2d28-08dea05eaee7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 bRIcsQl5wbPWFWd/+SRjl8AT/yvbzKsELTLPl9+jDFlpAayEC01rBO/lzeWFSph8NB0JQoZQ2bGVsAZDGjHq5uACJL77SEunqFkkTkkA2mMvezSfBA3qdeYKUXL+okSU4nqxFl4fmlzvq6+MRH+blZjJQ0XOBmWPVbfJLkQYnlCZTxXhczBxjYAxgMzmG/xEwEP3g5pKPsTXFYmkCUD7x4VuSVERWJN3zKIPYBn/TspU7PfWOopzwvKwarfUc+8TLrCxbFbCMfZHHzh1XOAGCQJ3SC9hwQ/uAGi9vkGnF03Bb8XB6VA8JZBYGZacK7/zdI/j7TAdUKRRvutKzcXnbGm9uQK2/3obdcbMrimkuh9x6wq8GCTYC/UZse5ZyHGqsZjVhFQqK+SnBvIj/SfHyHg7Ts4uov+PfXZQZHW2ho/Ro+33+hk+3uLKrJL4QvKDsmdOTAlmokszhQReXJhxb5oYeKCm7KGUy9nHt5gxmFsRCYtwnMMQl0UbVYu5xHPK87CiK+qkqzAVgn3j3LkwSOlHNMaAG6E+Supx2ARln3oebmJkdt4ic0BZHIuE9NwjKPCEPrRxI/0Hip69TS0BMiKhCJ5cQPecYbvXxiFC326JlfvqU/ujB1eK5ldQSq0sEssMiQAz3VeGJ3D/2uDVqQ83GP9IEI6matMlF+fLHMnrtnE79EieVTDMOWLzUS3oJX67Jx0991LrrHB/Xs7tSEaSS0BDDxQAcMPMzwavdSjZwrlvVHaIRc+JZ3HdPOy49a7ujlqWNoRMC7Ip7FjiDitAc6QvgUjt3G/hORKtTP4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WkU2TXFscVoxRk14a01wejBTRHp3MmRSZW56Y3JrSmV6NFBrZEhWdGZkZTM4?=
 =?utf-8?B?RmFVMFVvUkJoeExoUGhrWllUUjVpSjVRS2doQmdRbnMyYmpyU1pIamh0Ymwv?=
 =?utf-8?B?TnMxQWJ2S0VPcVJGTFd1MWViK1JXVDlNWHRlVlRMUU1LZEJvOTBaMGlKMm12?=
 =?utf-8?B?M3kxekZOckNTUVNIVG5DcEtHbDRpWHRPOFJzdzFVSWx4OGhIV3hrTElkL3VQ?=
 =?utf-8?B?TjB5bVhiamdqVDBaS0dKbVJzZmd4ZVlFUnF0UVV4S0dSWG1ORVh0bmhaVkY5?=
 =?utf-8?B?Nm0ycHNqbFBncEk4cER1bGE0M1k0RmpMNlpFL25tWU84bzZnZzcyT3JGYUVQ?=
 =?utf-8?B?eGg5c3RjWEdmb3JRMGwwdW44ZUdBWUg3dkszTC9jUGdUajFzS2lHKzhPUFJt?=
 =?utf-8?B?NUpqUkY2Zjd0U1VPMWNBNTUzY1RpTDNsK3Zod1FqNSt6azJBbWkzajRlYTVS?=
 =?utf-8?B?RWpwQ1BHcVFkNkdyN2xmWldTTTNnZTg5TFFGWGRaWUpOTjdVWDFOR0F0ejFU?=
 =?utf-8?B?R2pKaFZReUg0UkEyS2JPZDJsL3I0VnlHbTREcTd1NWlmNEthR01NOEZVZFlk?=
 =?utf-8?B?bndDcGh6akhIRG92RHFjWkZ2bEIyNk9JcS9CQlBmVlJFemlHTmpKWGwrTy9S?=
 =?utf-8?B?SElIQlJ6anpEeFRkQlZUN0tNdE5XVThYMXJhWE4yQkxIUDRIdVFWWUdSeEJu?=
 =?utf-8?B?cVNCaSs5SHZTNFFDZG12M1RXV3A3R0d3MSttS2trMHVJQXhTNkpOUmtyV25P?=
 =?utf-8?B?UWRXcVJlaTRTM3NDRjZhVWpNR243dEZYR0UwRm9ZTk5Fb0ZnRWdlWm9hUG4r?=
 =?utf-8?B?bDZaOXhqRkpnTnJqSkNTa09ORVVGTXZLVnpUOVE1aE9NTWxadm1mQUxja3Rn?=
 =?utf-8?B?MUdpVDFTVGYwWnFQOGt2RHlrT0QrU2tGNmJrZXphZDcrVTRwbVIwQ05DOCtU?=
 =?utf-8?B?SlA2bGVxV1B6RmowZ0lmL2FwUTloY0dDL3lUQjdiTkg3S0VlSXpRS3FvU2Q4?=
 =?utf-8?B?N0V3ZWwvTFRkakR0VTRraHlhU1FLNUVzYndwWmxOcVRQS1ZQTlp3bkNtSVlV?=
 =?utf-8?B?ZnBFd0ZJK0h4OURwOStRTlI3bTlNTzJkcHNWZWg0aFdUM2FuMXNXSlVrczFu?=
 =?utf-8?B?MUczWlU0WUdYWFVDZnB6cG44RW0rV2NEbmg2RFNuVnlyK0pzdUswS3JyUUV0?=
 =?utf-8?B?dnRWSmNralJPVHJoam1pcGZNVG1JRllBOVpQRzNjbHNRTHJxdFM2azR5Q3Ft?=
 =?utf-8?B?ajdNZ3N5T1d3bU5WU2NtOEQ4cVl3eHNQbmR4K25OeW1vbmFOeXBBWkxwMkZB?=
 =?utf-8?B?bFA0UFF0eUR5YkNhRE15aWxSSlhMQWFxUXY4V2U0YkIxKzg4TlR4OGdzR1ND?=
 =?utf-8?B?Nm80ZXhlRzFsakplMXFlWUpVemV2WjM3U0FueG1oaCt1MEVvMVlZTGlqTmVW?=
 =?utf-8?B?RlJFcEh2d2swdzdUT0dLTVdRZFk1Z3FPbXU1MkZMQUsvQTBoOWxlRmVXb3Iz?=
 =?utf-8?B?R2pVRGxXVm5TWmRqRlpmUmVqUll3aWhwRE1yYUk2b1lQVTRUNWFLbXpSZHRp?=
 =?utf-8?B?emY2QTlnckRxTk1qazhoQ3ZtMno0TzNMdTIyM2ZUZjc3eEJYelMyU2xZMklB?=
 =?utf-8?B?NEpxRUNkU3BPbzRGdW1QZWNVdnkwV3ZtZURxRWxyaVIzQkJEL3VwcXFobloz?=
 =?utf-8?B?ZXRmb1pxaEROSWpQZFl1UHExVUpBMHgxLzhsbjhMZzhHd0RuWTU5QjlFbDlP?=
 =?utf-8?B?dUcyQm9qc2JkSGpTU0NLYVljQzkrcWo5QktrM2EzVGhydWlKSDNQVzgrV1Yw?=
 =?utf-8?B?WkFPMXlGbG9SWWxzVFo1UENtNXV1Kzh6cStNc29HRzFSeEtWWEpwaXVZQkhs?=
 =?utf-8?B?bFBBM05UMFlYeWJEU3JaSjBhcWRlekZHOUlwMFZ3RnZlaEl2NlZXd0VxZWRr?=
 =?utf-8?B?U3JhSjE5UWJXWkdZNXVkekR0SzFOTmlpOTFDa0c1cnJyVExDM2p4MElGWlVa?=
 =?utf-8?B?ZWtNcWFlSi9DN1JtdG5Sa2pqU0hrM0xxWUdOSnRKSGRhV3E0OGI0WFVkRjVx?=
 =?utf-8?B?NERETWtCREprTitNdlZ5cVJwVTlPZkQzOVZKRnNEVyt5Z3E0V2RzdTNLQUdZ?=
 =?utf-8?B?USs1Mm0zdC9sZ0piV2hvejJ2OXBLS1VxdUVsUkZyOHVXTUpZRnNvYnRVMitj?=
 =?utf-8?B?cHhMa1BuUG16d044OXpkTU51NTZzOUhFU2wwdml6bUsrVjE2ODZ6WlFoTlFq?=
 =?utf-8?B?K1RBc3NLWXdCemkyLzlKV1JrNytRRG82Q0l1WmZZTEc3Qks1QjlTQjFuOG9U?=
 =?utf-8?B?OFpKWGd6UXlkSjJ1SUNoYlJyQXExaDVJNk4wby9Ja1YrR001bkNZQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bba1fdc5-481b-42c2-2d28-08dea05eaee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 11:02:45.4704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: URw7vcze5bfaeliSXW87z2p1OnmrbpzWHu8U72ZmnZ4om5YqslD1fQGBf8zv+fZLITmuWhTaViOctdcShwlp1w2EcbXsxsFWqkk1j+3jwfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16244
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31496-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch,kwiboo.se,oss.qualcomm.com,bp.renesas.com,rock-chips.com,chromium.org,bootlin.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.991];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,ideasonboard.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A0A244515E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IFNlbnQ6IDE4IE1hcmNoIDIwMjYg
MDY6NTgNCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2JyaWRnZTogYWR2NzUxMTogQ2xlYXIg
SFBEIElSUSBiZWZvcmUgcG93ZXJpbmcgb24gZGV2aWNlIGR1cmluZyByZXN1bWUoKQ0KPiANCj4g
SGkgTGF1cmVudCwNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9t
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+
ID4gU2VudDogMTcgTWFyY2ggMjAyNiAyMzozMA0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRy
bS9icmlkZ2U6IGFkdjc1MTE6IENsZWFyIEhQRCBJUlEgYmVmb3JlDQo+ID4gcG93ZXJpbmcgb24g
ZGV2aWNlIGR1cmluZyByZXN1bWUoKQ0KPiA+DQo+ID4gT24gTW9uLCBNYXIgMTYsIDIwMjYgYXQg
MDU6NTk6NTdQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiBPbiAxNiBNYXJjaCAyMDI2
IDE0OjAzLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+ID4gPiBPbiBGcmksIERlYyAxOSwg
MjAyNSBhdCAxMDo0Njo1M0FNICswMDAwLCBCaWp1IHdyb3RlOg0KPiA+ID4gPiA+IEZyb206IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IE9uIFJaL0czRSBTTUFSQyBFVksgdXNpbmcgUFNDSSwgczJyYW0gcG93ZXJzIGRvd24gdGhlIFNv
Qy4NCj4gPiA+ID4gPiBUZXN0aW5nDQo+ID4gPiA+ID4gQURWNzUzNSBJUlEgY29uZmlndXJlZCBh
cyBlZGdlLXRyaWdnZXJlZCBpbnRlcnJ1cHQgb24gUlovRzNFDQo+ID4gPiA+ID4gU01BUkMgRVZL
IHNob3dzIHRoYXQgaXQgaXMgbWlzc2luZyBIUEQgSVJRIGR1cmluZyBzeXN0ZW0gcmVzdW1lLA0K
PiA+ID4gPiA+IGFzIHRoZSBzdGF0dXMgY2hhbmdlIG9jY3VycyBiZWZvcmUgdGhlIElSUS9waW5j
b250cm9sIHJlc3VtZS4NCj4gPiA+ID4gPiBPbmNlIHRoZSBzdGF0dXMgYml0IGlzIHNldCwgdGhl
cmUgd29uJ3QgYmUgYW55IGZ1cnRoZXIgSVJRIHVubGVzcyB0aGUgc3RhdHVzIGJpdCBpcyBjbGVh
cmVkLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQ2xlYXIgYW55IHBlbmRpbmcgSFBEIElSUXMgYmVm
b3JlIHBvd2VyaW5nIG9uIHRoZSBBRFY3NTM1IGRldmljZQ0KPiA+ID4gPiA+IHRvIGRlbGl2ZXIg
SFBEIGludGVycnVwdHMgYWZ0ZXIgcmVzdW1lKCkuDQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgaXNz
dWUgZG9lc24ndCBzZWVtIHRvIGJlIHNwZWNpZmljIHRvIHRoZSBBRFY3NTExLiBBbnkgZGV2aWNl
DQo+ID4gPiA+IHRoYXQgdXNlcyBhbiBlZGdlLXRyaWdnZXJlZCBpbnRlcnJ1cHQgY291bGQgc3Vm
ZmVyIGZyb20gdGhlIHNhbWUgcHJvYmxlbS4NCj4gPiA+ID4gSW1wbGVtZW50aW5nIGEgd29yayBh
cm91bmQgaW4gdGhlIGRyaXZlciBkb2Vzbid0IHNlZW0gdG8gYmUgYSBzb2x1dGlvbiB0aGF0IHdv
dWxkIHNjYWxlLg0KPiA+ID4NCj4gPiA+IEkgZG9uJ3Qgc2VlIGFueSBicmlkZ2UgZGV2aWNlIGlz
IGNvbXBsYWluaW5nIGFib3V0IHNpbWlsYXIgaXNzdWVzIGluIExpbnV4IGtlcm5lbC4NCj4gPg0K
PiA+IFRoaXMgaXMgZXhhY3RseSB3aHkgdGhpcyBwYXRjaCBjb25jZXJucyBtZS4gVGhlIGlzc3Vl
IGRvZXNuJ3Qgc2VlbSB0bw0KPiA+IGJlIHNwZWNpZmljIHRvIHRoZSBBRFY3NTExLCB5ZXQgbm8g
b3RoZXIgYnJpZGdlIGRyaXZlciBpbXBsZW1lbnRzIGFueXRoaW5nIHNpbWlsYXIuIEl0IHNlZW1z
IHRvDQo+IGluZGljYXRlIHNvbWV0aGluZyBlbHNlIGlzIHdyb25nLg0KPiA+DQo+ID4gSSB1bmRl
cnN0YW5kIGFuZCBhZ3JlZSB3aXRoIHRoZSBhbmFseXNpcyBvZiB0aGUgaXNzdWUgKGFsdGhvdWdo
IEkgZmluZA0KPiA+IGl0IHdlaXJkIHRoYXQgdGhlIGludGVycnVwdCBjb250cm9sbGVyIG9yIHBp
biBjb250cm9sbGVyIHdvdWxkIGJlDQo+ID4gcmVzdW1lZCBhZnRlciB0aGUgQURWNzUxMSksIGJ1
dCBhbnkgZGV2aWNlIHdpdGggYW4gZWRnZS0gdHJpZ2dlcmVkDQo+ID4gaW50ZXJydXB0IHNob3Vs
ZCB0aGVuIHN1ZmZlciBmcm9tIHRoZSBzYW1lIHByb2JsZW0uIFRoaXMgbWVhbnMgaXQNCj4gPiBz
aG91bGRuJ3QgYmUgaGFuZGxlZCBhdCBpbmRpdmlkdWFsIGRyaXZlcnMgbGV2ZWwsIHVubGVzcyB0
aGVyZSdzIHNvbWV0aGluZyBJJ20gbWlzc2luZyB0aGF0IG1ha2VzIHRoZQ0KPiBwcm9ibGVtIHZl
cnkgc3BlY2lmaWMgdG8gdGhlIEFEVjc1MTEuIE90aGVyd2lzZSwgYSBtb3JlIGdlbmVyaWMgc29s
dXRpb24gaXMgbmVlZGVkLg0KPiANCj4gQURWNzUzNSBpcyBzcGVjaWFsIGRldmljZSwgaGFyZHdh
cmUgcmVzZXQgYXV0b21hdGljYWxseSBzZXQgdGhlIHN0YXR1cyBiaXQsIGlmIGEgY29ubmVjdG9y
IGlzIGNvbm5lY3RlZA0KPiB3aXRob3V0IHNvZnR3YXJlIGlzIHR1cm5pbmcgcG93ZXIgb24gdW5s
aWtlIG90aGVyIGRldmljZXMuDQo+IA0KPiBEbyB5b3Uga25vdyBhbnkgb3RoZXIgYnJpZGdlIGRl
dmljZSBzaG93cyB0aGlzIGlzc3VlPyBpLmUuLCB3aXRob3V0IHNvZnR3YXJlIHR1cm5pbmcgdGhl
IHBvd2VyIG9uLA0KPiBicmlkZ2UgZGV2aWNlIHNldHMgdGhlIHN0YXR1cyBiaXQgZHVyaW5nIHBv
d2VyIG9uIHJlc2V0Pz8NCg0KSSBjYW1lIHVwIHdpdGggYSBzaW1wbGUgcGF0Y2ggZHJvcHBpbmcg
UE0gc3VwcG9ydC4gSSB3aWxsIHNlbmQgdGhpcyBhcyB2Mi4NCg0KKwkvKg0KKwkgKiBDbGVhciB0
aGUgSFBEIHN0YXR1cyBiaXQgKEFEVjc1MTFfSU5UMF9IUEQpLCBzbyB0aGF0IGFueSBIUEQNCisJ
ICogaW50ZXJydXB0IGxhdGNoZWQgYmVmb3JlIG9yIGR1cmluZyBwb3dlciBsb3NzIGlzIGRpc21p
c3NlZCBiZWZvcmUNCisJICogbm9ybWFsIG9wZXJhdGlvbiByZXN1bWVzLg0KKyAJICovDQorCXJl
Z21hcF93cml0ZShhZHYtPnJlZ21hcCwgQURWNzUxMV9SRUdfSU5UKDApLCBBRFY3NTExX0lOVDBf
SFBEKTsNCisNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=

