Return-Path: <linux-renesas-soc+bounces-3776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5062487BD4E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 14:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB4C21F21D7A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 13:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63235A4CB;
	Thu, 14 Mar 2024 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jzVlAlEo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2043.outbound.protection.outlook.com [40.107.113.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA74755C35;
	Thu, 14 Mar 2024 13:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710421757; cv=fail; b=U+nRG+1+Yfr5xSg3XQOHFzUJ66a53gQRLsUtH5TNX9QMBbmRPqWQtEGVwquATq4/uDa4sG8gDUY1t/NpowSMc0t9D4/lnAySdGEBqM2PbA5dOyIU+6pw1dxYvKqz1PDIx/ySb+HhdEKPqax/ItMcCgPNCYyxKzEl62OCFz/vwVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710421757; c=relaxed/simple;
	bh=igqYUsgdVbUu/0U1/ZQAXGOYczEekdjlRP+7cKIM+UM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WRl0jBWd6DEA54HpPerJlFUh0Npo+u+IyGr3c6UPikQPvRKRStbh4gupcFhdQilu0+rvd8dTVCz+DhIN8gKjkcplJg6LvTW+4dI6GwC4idUyA45X0ihUCmery2Gr/gxbHcxSJKvfIsTO09ALutGWnPHxZZazWSCi1KsxIndcqWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jzVlAlEo; arc=fail smtp.client-ip=40.107.113.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUmGc3d8V5uNkA16Lx997sOTR9rOrIg086ONYOrYggKrWfo9cGzOOkCbT32plawx3iiF8SMJex7wvt3kaIJ3ZwlicG4PFjJWWCZz4+n0tdbbYucLJEUQRjt1KMBD8G2AVwV27BMfmKWcl6KdT8F8Ri5l/Kb/HA+6rxtkTvTDOyaF8n6FfJDoKdemFgPjh0iXBHiCtq2dnyKKF7aGJDNegfaOCXROawCl1p06HyidF8avJ6Rod0myrjdPZn16mzsNYSbESjXDtjlmCn6OCaaNqmz/N7nCr6X8Z4YyjbzlOY6HTgCHDDyl7DddwpRXd94DIRtHoRNoxx/03+D0Mkdx2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igqYUsgdVbUu/0U1/ZQAXGOYczEekdjlRP+7cKIM+UM=;
 b=YMcdmlAIT+CNNkfRMS1TLfmB8P0BKKQyaw7D1ihAODQ6W11+QE92pp80CdXEHnH7C04d5qJaIOs/GyXMjTwu11Nn0L0QANtjBnoYCFuZCwL+OiOROE/PATJOePDM+nivrkWhDFDg7x/FvHGBZntnNevSK2f0UN9+sYa6xlaDx56VeJC52T3FNSUpqHSFIkHwxH8W0NpX7U3CXjXY5+cgEJehKUcR2YV7hKd/R5KZvTMRKREeu94rWWxnbhC/nd3l6s/67ZZ65Df1ExtO2aUzUYR5v5VWBqonu+xaZ5AUXzf5BgF97Eal2/IGWH6K8FUWIHQZ9AY/dFI1QNEKrxpncg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igqYUsgdVbUu/0U1/ZQAXGOYczEekdjlRP+7cKIM+UM=;
 b=jzVlAlEoqAX6ck0EfkWy87bGoQ2gU7xrXQv4ij7F3pfD7x0lv6wZr6yKyNzWhVIHcBw0h2NdQujE+0ZMiIJu9CS9+fjovhAEftdp1oExGOayTvg1cB1z5wA+sMw2g6kvI5hzF8DVFkI0CA4iRS64B3c1j2FMIpPnM1AnCsnlQws=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TYWPR01MB11862.jpnprd01.prod.outlook.com (2603:1096:400:3fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 13:09:10 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 13:09:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huy Nguyen
	<huy.nguyen.wh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>
Subject: RE: [PATCH v2 3/5] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
Thread-Topic: [PATCH v2 3/5] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
Thread-Index: AQHadXKOqNxFa59/ukau2Ie02qSE2LE29SUAgAACbyCAAD3RAIAAAN1g
Date: Thu, 14 Mar 2024 13:09:10 +0000
Message-ID:
 <OSAPR01MB1587F2782BAAC8E45C0E21BC86292@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240313181602.156840-1-biju.das.jz@bp.renesas.com>
 <20240313181602.156840-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUMEA2d9+H7GwDDLTfeXp2fAyBTt8jpihOzjCEMUuSK-A@mail.gmail.com>
 <OSAPR01MB15874373FDCB149EA67D4BD086292@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <CAMuHMdWOZdJujd7+Tycn144-fqM7a6bsnJ0+82Ndqk69jTTf+w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWOZdJujd7+Tycn144-fqM7a6bsnJ0+82Ndqk69jTTf+w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TYWPR01MB11862:EE_
x-ms-office365-filtering-correlation-id: 45a38519-be72-44f1-bb35-08dc4427f05d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 q1fjTxklR0aGNUFgznTLNvPODQQEra/TagShe46zN522L+hVTmGXxljgCvyzhiBnABEo2iC0GEiNLOG/hgJmjgiBawpEto7AAaKXQ/wgAlpM822JeLAx1ii4SiqaUDPE7t4RiTqIc2OxpizXEPiSS2qHcx4j4vr+VEtf24SSINFI3aPDrm7K45SGT0Z3FOi9IiH9tRFTBK6aDMacyDu59/JEHpefsfLyx+02hKdpTA/fLpfLxnxjl/m3sJQZw0pgCNpq1OJH0qhpeUjelyhxXE8EhKoSK321P+yEzIDqMyCicXepE4RYCVznNwvQ7saGzKlCyRBQJCjQwVEZg0dlhNm+MhIFhPVBGTuMj2U6IN0tEiiv9S+jefJGYdmSDGUxnJH0VE/UZcYim4Dtza+rbS6vcn6Rdo0iXvvHpPXltF9wDafoiXhzIL63hy5eyxQMTOVMIOT2k92uD/2K0FvgSSGhag+my5Xj8ZxXMiQJGnJZiC3XGots5o1lwd2CaJk00aptAF9mS4tA529lObaXd/ZYvqR4I5o88O75FtfJNyYBKhix409zArz5UxCKWrFUHqCBXL3oEZRVRPPQnTiROCpsd4zlesi5+VGOhA2E4dj5NUlM+bX7aMUYhDCpfzzHDK9NBaZO90t9+rDPBGNOAjisK6fwugM0bunUvXpgdslXsfNsFFKkXp8AJEJPEMzKtA1nd+Fy2WAZmimcvBXnAw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzhaSVdURnpuVmg2YWR3bVVsclFkelZJVGg2aUpxalhVNzNWb3Z2cncvendH?=
 =?utf-8?B?TTlqV2VXR3ZicndBRWlKODFWeFlsNTdXdnVMWkRpM3plbW0vZTA2aE1hN3Bn?=
 =?utf-8?B?dzFBSVFUdlVUUGpCSEtpaUZWWEl4VWFUYnJqMDUwYy82U1VIckhZcDVVdFVK?=
 =?utf-8?B?Tm5qS2VpbncybHhKaE03WTNKSUxycCtzaFdnd0tZTUpNaHpPL3l5MFY2T3dk?=
 =?utf-8?B?Y3Y1N3EvZW5DRXgzVXhzODcrbHpBMnAyaklEMEtGb3RvZEFaMjhKS3NuSzkz?=
 =?utf-8?B?NE4rL01WZkUzMHljNmRhZ2Nuc1VBODZONGRVQXpXWElHRENvRWFLRlJyaXY4?=
 =?utf-8?B?TEY0a1l6RWxUM0tYWFFCQlV6M2tCSHEyY2ZXZWdqL3ZPWUtMdlRjN0VYSUdJ?=
 =?utf-8?B?ZHV5T1JoMkIxcCtXWG1RRWdXM0Z3WWVvVHJIMCtYOFlBMnRCYnVOMjVvbDly?=
 =?utf-8?B?a0RXdDJ5U3N4eDNqVmFpcHRVN0lOOGtFWFh3Q0pkZGdOeHhISXZucFhzODhn?=
 =?utf-8?B?M3hKbEQzeHhQNCthNExySEJZWEEwdjV5ajZCcGFzRzhKY2t6TjMvMThNTEow?=
 =?utf-8?B?cklaaXZwekMwbEVDay9GVElOVmE4Zk1rMzdacHJqWC9ZY3FIcVlWSktuM1VL?=
 =?utf-8?B?UlVjb2ZyTXJZNmo0a1orUDRiMTAyWWVWQmFhdHl6NUEyVCtCN01CanJnUHlK?=
 =?utf-8?B?MGRQSnlVQ1R4VjNDeVBTUnpYd0tYNmUwWWtDbkN5ZXdINVFmeDJXbjhLOGJa?=
 =?utf-8?B?UGF4WHZlWFBWMkpvRUdVSWJIZk1MUktPbllQeWJiNkQrOGloTzU3dnpiaitO?=
 =?utf-8?B?M0FOZmMydm9paVhnVG5KYUtraXAxTEpycGJPNzc0alZaVGpJcWZ6azgxSTdH?=
 =?utf-8?B?akJFVlgxMDNnSVVZMmwwZGJTazlSbTEvN1BzMzczUGN0NEJ3dSs5anUwQTRX?=
 =?utf-8?B?VWtrT3JURTJsNUw0VDRiSjlqbHhzL2FVSmRqTi8rWTJYR3k2dDRoQXRsbDR1?=
 =?utf-8?B?Rmt2Z3ZyaUNyKzVHUzhiRUQ0ZDQ0UEt2ZGNuZmdSWFZkaVJHelFrWGFGZ3pr?=
 =?utf-8?B?aU9lc1ZhVmhpNnphZHRGY0VjZ3FDMklBdzltZXAvWlBFeTNCU0plN1N5cTdI?=
 =?utf-8?B?QW5lc1NyOXFRQldiR2lGdnJFWDlWZzRmcU9kZU9GUFh6bGo5ak5zS1hoK0NL?=
 =?utf-8?B?Ry9ZdVpHYm5sdkNmamJ5V204Nkd5b0xGTFdMU1FlUlVLYzV3dUFwckpXaGhW?=
 =?utf-8?B?Mm5pLzJLNDNZaDRYbUVqWW9rOEJZVmxwSUpva2tNajMzbzRRMElCcnVFM3Vl?=
 =?utf-8?B?bEdjY1hLR2x2dTl3WkZZV21paGh5MHV5Z1A4RjQ3YW44WkxkWUcrMG1sZkVV?=
 =?utf-8?B?dXNPc05yMmFDVlFjbjQrVTk4VlpKTVQvdDhqNHpEQkh4bUoybHZJbFVpWGJn?=
 =?utf-8?B?WGFiTlpGaGZ2enU3WXFqQXNCWDJHaS9TZCtjNGU2Qk8rTTczV0FJQmUvSlhP?=
 =?utf-8?B?UUZTZkF3SXdUbHVJZ2M1aFIrMmtVR0hGdVdaZXo0U3VEVUpMMFJGT3BST0NQ?=
 =?utf-8?B?d1N4SkhzUVpyTVVVRmNiR1BQajFQYW5KblJMZjFwTEtPK2tKU3JTTHZLdG13?=
 =?utf-8?B?b2FOWjFid3pZSjlTRU5HRnhoazk4WURZYTJsS3hSSU53amV2eWdMSG5ZTUxr?=
 =?utf-8?B?eXFKZGdoSlpNb1IyK2lDRkNFcm9rUVdINmUvZitDYXpEbGQyWkV5Sm13ZmV6?=
 =?utf-8?B?cGw0NytUNFlGSERFZmVDOWdQR29YeFFQMStUT1JHZmZ5QmRpbWFFekRtVzlZ?=
 =?utf-8?B?ay9Ub1k0MFVIT2lKbHBjcCtzclM2Q296bVZncTdzZXhlVzVYcHZ1ZWc2WlBB?=
 =?utf-8?B?cDVibmVJU2t0Q0c1d1lIZzYwL2V0WXA4WmVtMTU5RGpCYTlpcmdldXdVOTFi?=
 =?utf-8?B?T0laSjlxK1dpYjhyd1QwSk1oWXdlQUxhOHVZelJDNTZyUHgvdXpMcjJiUHlH?=
 =?utf-8?B?MzJjVXplV1VxSHljVmhkS1hYWERGSk1FVmdyRmJhRFdYTE1aRVMwMnpqZGYv?=
 =?utf-8?B?OEpFeWpJMEk4bVRhaGZ2QWVVZUg2emdaeENQaTZvMUliMGxPODNXM0lKU2hD?=
 =?utf-8?B?bytSTHhWbWE2YkJ5L3JobGc1NGw4QUthRlFYbnBNNkp5aHJjZnVBcnFXUXhS?=
 =?utf-8?B?Zmc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a38519-be72-44f1-bb35-08dc4427f05d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 13:09:10.6782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: La8pYpJJVBrPitU1NU28ZcFq7zm3saSobBgy/DVJbSjE9XMOu2n/qIkc9ltT37yzajQkt1qJ19AJ29UkAenMcB2qgr8ForXj1c8NIKReH+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11862

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAxNCwgMjAyNCAxOjA0IFBNDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMy81XSB1c2I6IHJlbmVzYXNfdXNiaHM6IFVwZGF0ZSB1c2JocyBw
aXBlIGNvbmZpZ3VyYXRpb24gZm9yIFJaL0cyTCBmYW1pbHkNCj4gDQo+IEhpIEJpanUsDQo+IA0K
PiBPbiBUaHUsIE1hciAxNCwgMjAyNCBhdCAxOjQ54oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+IE9uIFdlZCwgTWFyIDEzLCAyMDI0DQo+ID4gPiBhdCA3OjE2
4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+
ID4gRnJvbTogSHV5IE5ndXllbiA8aHV5Lm5ndXllbi53aEByZW5lc2FzLmNvbT4gVGhlIFJaL0cy
TCBmYW1pbHkNCj4gPiA+ID4gU29DcyBoYXMgMTAgUElQRSBidWZmZXJzIGNvbXBhcmVkIHRvIDE2
IHBpcGUgYnVmZmVycyBvbiBSWi9BMk0uDQo+ID4gPiA+IFVwZGF0ZSB0aGUgcGlwZSBjb25maWd1
cmF0aW9uIGZvciBSWi9HMkwgZmFtaWx5IFNvQ3MgYW5kIHVzZQ0KPiA+ID4gPiBmYW1pbHkgU29D
IHNwZWNpZmljIGNvbXBhdGlibGUgdG8gaGFuZGxlIHRoaXMgZGlmZmVyZW5jZS4NCj4gPiA+ID4N
Cj4gPiA+ID4gQWRkZWQgU29DIHNwZWNpZmljIGNvbXBhdGlibGUgdG8gT0YgdGFibGUgdG9hdm9p
ZCBBQkkgYnJlYWthZ2UNCj4gPiA+ID4gd2l0aCBvbGQgRFRCLiBUbyBvcHRpbWl6ZSBtZW1vcnkg
dXNhZ2UgdGhlIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlDQo+ID4gPiA+IHdpbGwgYmUgcmVtb3Zl
ZCBsYXRlci4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSHV5IE5ndXllbiA8aHV5
Lm5ndXllbi53aEByZW5lc2FzLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gPiA+ID4gLS0tIGEvZHJpdmVycy91
c2IvcmVuZXNhc191c2Jocy9jb21tb24uYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9yZW5l
c2FzX3VzYmhzL2NvbW1vbi5jDQo+ID4gPiA+IEBAIC02NDAsOCArNjU2LDEzIEBAIHN0YXRpYyBp
bnQgdXNiaHNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiA+ID4gPiAqcGRldikNCj4g
DQo+ID4gU2luY2UgWzFdIGlzIGJldHRlciBjb21wYXJlZCB0byBbMl0sIGlmIFNIIGNhbiB3b3Jr
IHdpdGggWzFdLCB3ZSBjYW4NCj4gPiByZXBsYWNlIFsyXSB3aXRoIFsxXSwgZG8gd2UgaGF2ZSBh
bnkgU0ggcGxhdGZvcm0gdG8gdGVzdCB0aGlzPw0KPiANCj4gSSBkb24ndCBoYXZlIGFuIHNoNzc1
N2xjciBvciBlY292ZWMyNCB0byB0ZXN0LiBCdXQgdGhlIHJpc2sgbG9va3MgbG93Lg0KPiANCj4g
U28gaXQgbG9va3MgbGlrZSBhIGdvb2QgaWRlYSB0byBoYXZlIHR3byBwYXRjaGVzOg0KPiAgIDEu
IEltcHJvdmUgdXNiaHNjX2RlZmF1bHRfcGlwZVtdIGZvciBpc29jaHJvbm91cyB0cmFuc2ZlcnMs
DQo+ICAgMi4gRml4IHN1cHBvcnQgZm9yIFJaL0cyTCB1c2luZyB0aGUgZGVmYXVsdCAxMC1lbnRy
eSBwaXBlLg0KPiANCg0KQWdyZWVkLiBXaWxsIHNlbmQgdjMgd2l0aCB0aGVzZSBjaGFuZ2VzLg0K
DQpDaGVlcnMsDQpCaWp1DQo=

