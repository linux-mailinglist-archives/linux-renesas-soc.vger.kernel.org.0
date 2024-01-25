Return-Path: <linux-renesas-soc+bounces-1851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B55A783CF38
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 23:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E0981F216A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 22:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C337213AA3B;
	Thu, 25 Jan 2024 22:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AQgXz2Zc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2942A131E4F;
	Thu, 25 Jan 2024 22:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706220961; cv=fail; b=a6IPSZhF1PUKTwEjatl6a5h8lC6tJTcaDNKJTloRMAY7F7TY+6BtNrJjOdeA6BeWFWEzYTueI8Mhw6TdFNdsLTS6bGh8WHTyTMbR60FTPZvTLdu/DUaT4ctYTSzTtEAKHboqeo8VlZmWKIXThZFbJuUlMtbhl/VmRAISVpn22kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706220961; c=relaxed/simple;
	bh=ZatgoTjVVanltNgrTzX1NTaNilr9Zox9RJJ0E/UQP5E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dUuzy23OUZsNZr+dBgxCL3lbDZWMRB4aiyeensETf7g9nQ40bmIld4/3KtP/CuIcAlWdZwqLNgEznviz+TlcTqDrOlHSnTDri29pWBUE+NmNd3f1BUqIGJXQwRhhuoeb8D6271adioIKGhlWGTJtl0mki40EwwKzp/HRU4eASEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AQgXz2Zc; arc=fail smtp.client-ip=40.107.114.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpONrb7Pm2qupdGFBlN61GuapgxW+A3cxiUGMvDCarPdZiFW59gvX9BfMMtsAhq7zjnabhPg5p/t9SbSBoFHgln6XAo2HK71MHAmtQBplJAQ3sqZtxbbF6cq4rnAesbKgqqEPprFqRdpmT2kq8+bbm/Vlc7DsOyszFpoOxl7SD4xl4lsodvF5HmXgIWeZvXl+tBdeYgTHupoHxdLYN+o8B7AC/e3YtVXkKrDNPCrtB1J/nohiO5evJLkDAXj9zckEZT5F15W4g5n4g4WI6+oOXvwQTGuCHy45cGB2nswkr1MZWqQVzRqgZcGSCLR370VGhr7wTI2TXW8s6CG7G3/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZatgoTjVVanltNgrTzX1NTaNilr9Zox9RJJ0E/UQP5E=;
 b=LgeS4hZD9O5xoIETMuwaWDTLhbCj2CtWF47iXzL18vZyypUErox2P5NH7Z72IYju9mHFba3DZIYxYf+2vKbvwJDQLzNn9DvrDVdlSe2SuSrATOhLQ1jWRc3RhPy6Qgu3zuQFYQruwE16xYOAezbHsaLMbG9Gl28sZWrIru15vhs269QNrnwP82DldBszmkM/PVWn0QMVFyINjFUl7dKxvJJDMInmPBjDQo2TB3tWd4CdMK8cNXERz5spLKQnRye9j0SwtyW2SN0UihH5Tgraq4Pp7D+zYWx+XjqXOXgepLowc7cG4Aeu2/qHHl4M8ztpCEPZhEUuOh0mwb7WwKLAbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZatgoTjVVanltNgrTzX1NTaNilr9Zox9RJJ0E/UQP5E=;
 b=AQgXz2Zc7QBEClGb253L+LljjDPQFSov9BCOmD4kHH92qV9TdPa6IWBlkoyTQ4VioK9YdiO3XK1dC3BHM9qAgFpKYQT2JDDQD4zRfl67ACv437REVjHn8WQWEfawnofw9LPxxJsSS8GbRJrYeEsvGOu0qgIWBelFoZd4yP+p1xA=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB8351.jpnprd01.prod.outlook.com
 (2603:1096:604:192::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.12; Thu, 25 Jan
 2024 22:15:54 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7249.013; Thu, 25 Jan 2024
 22:15:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH net-next v2 1/2] ravb: Add Rx checksum offload support
Thread-Topic: [PATCH net-next v2 1/2] ravb: Add Rx checksum offload support
Thread-Index: AQHaTq8Z43IrcmV2f0OcLM7ZpnaZ7bDrAJeAgAAYJsA=
Date: Thu, 25 Jan 2024 22:15:54 +0000
Message-ID:
 <TYCPR01MB112690D34DFFCFA876203A539867A2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240124102115.132154-1-biju.das.jz@bp.renesas.com>
 <20240124102115.132154-2-biju.das.jz@bp.renesas.com>
 <e27edbff-8fa9-339a-4e6d-d72776286aa6@omp.ru>
In-Reply-To: <e27edbff-8fa9-339a-4e6d-d72776286aa6@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB8351:EE_
x-ms-office365-filtering-correlation-id: 44fb48b5-0047-48f6-57f6-08dc1df332dd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jpwalKq6u+Z6kSlqzICBTADPlD+T90g2yBAuJF02ihUE8psQll+6uKZayIxXk9Mvn5fXmPy13PKxRQ4I1nDMnXvEH5D6lcE6ijwsvJuIWJGLu/H42VwKD09wMzBckNroGvR1BeLpFg6qG655BMUkHNUx7gQw6pQQkhfxkPbgOnFjDqZBW1qogZnT7ev7erOXlm5mwltz60mVaUggEjgsKyH1uzeLv2haAsHH3JMar75VTyMX/AWXs6AycCBrpreT6SJqmSMH+G5mzlpVAs0tDJQGkkuris9Eo5yKbB//q0R9h1cZCU9oTlUBi1vbPFMAYKVm7VIgZNUk9Ohs/JNv2OasbCmgpCxv/7bi4xSacRlSX33uaU2b5Hlp6SRKgNaH3w0w9P6pMo6E/NN6/iytGx1LFx/2CSxFT16Qo5IkzXV7okHAV+KAXtUxxRvQ53xq/aS8RJ7wUEoxFGE3hLI2xTjZMyCqUFSxnfWo1FQqLiEAryBDsYXm2yX3BeDEmMkDzSUtoaV1219arvXv7BIUr8r35l0cXPPsOoZ9+YXnHZoeJbIpX6WbisCpkn3pa7mIE3y4wut2fyw2bVOEz/6Ywf3tHluRH6yHRyiiD/Pkp+0vMcZaldGiO5WLytrO4nf0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(9686003)(6506007)(26005)(53546011)(71200400001)(2906002)(122000001)(83380400001)(5660300002)(7416002)(4326008)(52536014)(8676002)(41300700001)(478600001)(64756008)(316002)(54906003)(66446008)(76116006)(66476007)(66946007)(110136005)(66556008)(8936002)(33656002)(86362001)(38100700002)(38070700009)(7696005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGk2NWZCcXhCR2xzSEhJM3IzSzZmUGRUTFZIOUx3WTdTOXdtSGZzNGVIZW1z?=
 =?utf-8?B?NkVrbmxHdG9MTFNPUjIzYkE3S1l6TzVLeTM0NXdhNkhXaXNxWjBadDVXSGZ1?=
 =?utf-8?B?SjdUdDlGditYOWFESzJXUk1iTUwrRkNoNXFzUTVoM0thM2xoYlhOeU1rWEM0?=
 =?utf-8?B?N3VSTkE1aE14cXNWeTZmSW5XT1E4djVMVHRWZWpZQXNCQ0U3WVNETEl6Wkdn?=
 =?utf-8?B?SzE2WXo1MngyYUdRaFczUjI1Z2FScVZyQlJRdGpDc3NEWklmZnQrOUZtYXVI?=
 =?utf-8?B?REhpNGRqTU1mQ21PSU80UDNLVlFKMnlHcWxMOXpVTDg4djQwWEZpNlE3WDRz?=
 =?utf-8?B?K1NLQ1UzMFJXbXJuUHJUTUVxZHRrV3p2LzV2SWpzTHc4akZmcGpZeURxUVdV?=
 =?utf-8?B?NmE5eEQvTHJNYXJCR0Z3ME5pZEVydklYdUJQeVlhU1BQa3piLy9DQnpvTW5L?=
 =?utf-8?B?UUN1Wk5TYlNUOGZJNGtkejFDY3lYakpwOFZhU3pqNjZkZEZ5M2hJN0s4ZXAw?=
 =?utf-8?B?SnRuRWJJZDhzZGlsV0UzbWVJTWYvQ3k0MFRVRWFWVW1GWE40ZnN3OCtjb3dW?=
 =?utf-8?B?TzR6RytLV0ZMT2V6RFZWVCtrVGxBYzRFQTFhVHdWQWZUOW1aM2pJN2NOM2JG?=
 =?utf-8?B?dTlyc2dvazBnOGM5T1prdGVMb2FWU0FiaE95RzVsOUFSN2tXZWpOOWh0WUZZ?=
 =?utf-8?B?bzJ5NzNKRGpKUzJKa1lvZkloQ3Z0ZURkSEZjaHh3VjEwZnRZc1RBTFVLQklx?=
 =?utf-8?B?aktKallJQTlrTWxXWU91WG5aN1J5aVBPM291eHd4V0ZlTk04WG1yOGNBYUhU?=
 =?utf-8?B?NVNZS1V4ZFFvSWZCZ05waDBESU1La3BnY3NGMFpzMldRNUhrOGtzdzNVYUp2?=
 =?utf-8?B?UUZyMUhHTCtXbTB0M2k1WFM3ZnVJTFJPcWZMQTZSSFJ6L2N5RFpaalRwNitr?=
 =?utf-8?B?ZlRaSFFkbzBiVlRXLzczLzE1WC9XelNjVC9QdklRSHdhYmpYcFZZeGJZdkN5?=
 =?utf-8?B?b09McGIwSHd2NWdxQmNENnVvenZDQTg2VGpGUU1JZXBnaVhnRGg3SXdZVHpJ?=
 =?utf-8?B?T0ZzSDFvR3YrTWNSeE5Jakx3USs3Zm5EQ1RNd1ZoWlB0azRyL3VSQk5uYUJE?=
 =?utf-8?B?OXcvSVdpNEtIeFJ2SGlyRmhnNTU4M240T0FQN0dEdk5tZGRsZWJCM0hXUU5R?=
 =?utf-8?B?anV0bWhacW1IMWptSTJLNVZVOU1MZW84R0t5WUdBTW9HODFuS1V2enlzcjYr?=
 =?utf-8?B?dHNRaXZscWRlZzlYY0lUTXJwU1dmOWJ5TVkzRDdra1ppT1FwbFlWUHd4d25q?=
 =?utf-8?B?anBVMUVaeXMvM3o4TE1JNkIxVnRBa0dRTC9zZFlIRC92ODdpVVorNE03YVkx?=
 =?utf-8?B?QUFjSHA0TDU1bHFwM2hNMVdpdTJOS0ZhdktwTmxMdGlscS9aWjVmU0hOWGls?=
 =?utf-8?B?WmdVbmppYnZUL25JT2F1Um5DUzFLU0NDTDJvYWlqMkRDc0ZCSDFNckxLSEVu?=
 =?utf-8?B?Q2ZITExtL1M0U3pZeHFhTnhyaEVwV0F0VkM5bElwaWRyd2g5ejBFYVlBWm1B?=
 =?utf-8?B?YmRwOXIvWW4raGFZR1RoYXpLL2lQa2VNL2NIM2NKWCtDZ2M3dVNKRVp2a2JD?=
 =?utf-8?B?MCswTmZNcXh6ZUtiSVdCL0tJbnE2U3pzelh3eWxBMjdNSFNTbVRxK0s3OTRz?=
 =?utf-8?B?ekI5TTJ2ZzY3R0FCZ3cvUVQ5RGtDMGhiSjdqZ0d3TU1PT25jak01aS9qSGlC?=
 =?utf-8?B?R0JOeHI0OVZJZ01jY0V3UHpTVlNPcWMyejRlR21PK0hISXNYbm1sblJsUFlD?=
 =?utf-8?B?dU9BL0w0dU9XTHlSUDVCQ2wyakhMOW9EK0ZSRHNZWUhiM0g1eXF0SjZGakJl?=
 =?utf-8?B?UW0yUVZtNmE3eFhrTzhnL1BidEY4TEpKdEZ4RFY4RHEyRWVHRUpTUkdDNzdn?=
 =?utf-8?B?ZGg5NDFjTXRKaEFjVGhXYnlkWXdObjF2ZDZ1MWM3UGVqcUZZMFNFQjR5bExP?=
 =?utf-8?B?WU5nSXJJKzlJSzZXRU5iaW4rSUhDRHVTVXQ2YkpzQTdjV3R1MlNySXdDY1ZT?=
 =?utf-8?B?Z3Q3MEljSGd1YVZMU2xUdlptc3A0UkdrZHZGNVhNSHZuZkEzWjIvNDVBK2dB?=
 =?utf-8?B?TDEzS2Jsemh6N2k4MVZiNDZtbjlzWWg2RllQdUdQQlJ1cUhhRURSVURBeDRK?=
 =?utf-8?B?c0E9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fb48b5-0047-48f6-57f6-08dc1df332dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 22:15:54.7079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xnIpdFabcU9wz8c+OxxJScBkI5T9JCjK2xDq5CMM/zVD1ycBxcoy9dhhtfjCqNp5SyXmoH6eBJDH+FBFtbFQNRN8gKmUp87y1Ytpu8O4xDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8351

SGkgU2VyZ2V5IFNodHlseW92LA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5
b3ZAb21wLnJ1Pg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSAyNSwgMjAyNCA4OjQyIFBNDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0LW5leHQgdjIgMS8yXSByYXZiOiBBZGQgUnggY2hlY2tz
dW0gb2ZmbG9hZCBzdXBwb3J0DQo+IA0KPiBPbiAxLzI0LzI0IDE6MjEgUE0sIEJpanUgRGFzIHdy
b3RlOg0KPiANCj4gPiBUT0UgaGFzIGh3IHN1cHBvcnQgZm9yIGNhbGN1bGF0aW5nIElQIGhlYWRl
ciBhbmQgVENQL1VEUC9JQ01QIGNoZWNrc3VtDQo+IA0KPiAgICBzL2h3L2hhcmR3YXJlLy4NCg0K
T2suDQoNCj4gDQo+ID4gZm9yIGJvdGggSVBWNCBhbmQgSVBWNi4NCj4gDQo+ICAgIFRob3NlIGFy
ZSB1c3VhbGx5IGNhbGxlZCBJUHY0IGFuZCBJUHY2LCBubz8NCkFncmVlZC4NCj4gDQo+ID4gQWRk
IFJ4IGNoZWNrc3VtIG9mZmxvYWQgc3VwcG9ydGVkIGJ5IFRPRSBmb3IgSVBWNCBhbmQgVENQL1VE
UCBwcm90b2NvbHMuDQo+ID4NCj4gPiBGb3IgUngsIHRoZSByZXN1bHQgb2YgY2hlY2tzdW0gY2Fs
Y3VsYXRpb24gaXMgYXR0YWNoZWQgdG8gbGFzdCA0Ynl0ZQ0KPiA+IG9mIGV0aGVybmV0IGZyYW1l
cy4NCj4gDQo+ICAgICJGb3IgUngsIHRoZSA0LWJ5dGUgcmVzdWx0IG9mIGNoZWNrc3VtIGNhbGN1
bGF0aW9uIGlzIGF0dGFjaGVkIHRvIHRoZQ0KPiBFdGhlcm5ldCBmcmFtZXMiLCB5b3Ugd2FudGVk
IHRvIHNheT8NCg0KWWVzLg0KDQo+IA0KPiA+IEZpcnN0IDJieXRlcyBpcyByZXN1bHQgb2YgSVBW
NCBoZWFkZXIgY2hlY2tzdW0gYW5kIG5leHQgMiBieXRlcyBpcw0KPiA+IFRDUC9VRFAvSUNNUC4N
Cj4gDQo+ICAgIFRDUC9VRFAvSUNNUCBjaGVja3N1bSwgeW91IG1lYW4/IEFsc28sIHlvdSBhbHRl
cm5hdGl2ZWx5IHNheQ0KPiBUQ1AvVURQL0lDTVAgYW5kIGp1c3QgVENQL1VEUCAtLSB3aGljaCBv
bmUgaXMgY29ycmVjdD8NCg0KDQpBcyBwZXIgdGhlIGhhcmR3YXJlIG1hbnVhbCwgaXQgc3VwcG9y
dHMgVENQL1VEUC9JQ01QIGNoZWNrc3VtLg0KU28geW91IGFyZSBjb3JyZWN0LCBpdCBpcyBUQ1Av
VURQL0lDTVAgY2hlY2tzdW0uDQoNCj4gDQo+ID4gSWYgZnJhbWUgZG9lcyBub3QgaGF2ZSBlcnJv
ciAiMDAwMCIgYXR0YWNoZWQgdG8gY2hlY2tzdW0gY2FsY3VsYXRpb24NCj4gDQo+ICAgICJJZiBh
IGZyYW1lIGRvZXMgbm90IGhhdmUgY2hlY2tzdW0gZXJyb3IsIDB4MDAwMCBpcyBhdHRhY2hlZCBh
cyBhDQo+IGNoZWNrc3VtIGNhbGN1bGF0aW9uIHJlc3VsdCIsIHlvdSB3YW50ZWQgdG8gc2F5Pw0K
DQpPay4NCg0KPiANCj4gPiByZXN1bHQuIEZvciB1bnN1cHBvcnRlZCBmcmFtZXMgImZmZmYiIGlz
IGF0dGFjaGVkIHRvIGNoZWNrc3VtDQo+ID4gY2FsY3VsYXRpb24NCj4gDQo+ICAgIHMvdG8vYXMv
Pw0KDQpDb3JyZWN0Lg0KDQo+IA0KPiA+IHJlc3VsdC4gQ2FzZXMgbGlrZSBJUFY2LCBJUFY0IGhl
YWRlciBpcyBhbHdheXMgc2V0IHRvICJGRkZGIi4NCj4gDQo+ICAgICJJbiBjYXNlIG9mIGFuIElQ
djYgcGFja2V0LCBJUHY0IGNoZWNrc3VtIGlzIGFsd2F5cyBzZXQgdG8gMHhGRkZGIiwgeW91DQo+
IHdhbnRlZCB0byBzYXk/DQoNCkNvcnJlY3QuDQoNCj4gDQo+ID4gV2UgY2FuIHRlc3QgdGhpcyBm
dW5jdGlvbmFsaXR5IGJ5IHRoZSBiZWxvdyBjb21tYW5kcw0KPiA+DQo+ID4gZXRodG9vbCAtSyBl
dGgwIHJ4IG9uIC0tPiB0byB0dXJuIG9uIFJ4IGNoZWNrc3VtIG9mZmxvYWQgZXRodG9vbCAtSw0K
PiA+IGV0aDAgcnggb2ZmIC0tPiB0byB0dXJuIG9mZiBSeCBjaGVja3N1bSBvZmZsb2FkDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+IFsuLi5dDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5l
c2FzL3JhdmIuaA0KPiA+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiLmgNCj4g
PiBpbmRleCBlMGY4Mjc2Y2ZmZWQuLmEyYzQ5NGE4NWQxMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmIuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3JlbmVzYXMvcmF2Yi5oDQo+ID4gQEAgLTQ0LDYgKzQ0LDkgQEANCj4gPiAgI2RlZmlu
ZSBSQVZCX1JYVFNUQU1QX1RZUEVfQUxMCTB4MDAwMDAwMDYNCj4gPiAgI2RlZmluZSBSQVZCX1JY
VFNUQU1QX0VOQUJMRUQJMHgwMDAwMDAxMAkvKiBFbmFibGUgUlggdGltZXN0YW1waW5nDQo+ICov
DQo+ID4NCj4gPiArLyogR2JFdGhlcm5ldCBUT0UgaGFyZHdhcmUgY2hlY2tzdW0gdmFsdWVzICov
DQo+ID4gKyNkZWZpbmUgVE9FX1JYX0NTVU1fT0sJMHgwMDAwDQo+IA0KPiAgICBBcyBJIHNhaWQg
YmVmb3JlLCB0aGlzIGlzIGhhcmRseSBuZWVkZWQuLi4NCg0KSXQgaXMgbmVlZGVkIHRvIG1hdGNo
IHdpdGggdGhlIENoZWNrc3VtIHN0YXR1cyBhcyBtZW50aW9uZWQgaW4gdGhlIGhhcmR3YXJlIG1h
bnVhbC4NCg0KPiANCj4gWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvcmVuZXNhcy9yYXZiX21haW4uYw0KPiA+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNh
cy9yYXZiX21haW4uYw0KPiA+IGluZGV4IDBlMzczMWY1MGZjMi4uNTljN2JlZGFjZWY2IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMNCj4g
PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jDQo+ID4gQEAg
LTUyMiw2ICs1MjIsMjYgQEAgc3RhdGljIGludCByYXZiX3JpbmdfaW5pdChzdHJ1Y3QgbmV0X2Rl
dmljZSAqbmRldiwNCj4gaW50IHEpDQo+ID4gIAlyZXR1cm4gLUVOT01FTTsNCj4gPiAgfQ0KPiA+
DQo+ID4gK3N0YXRpYyB2b2lkIHJhdmJfY3N1bV9vZmZsb2FkX2luaXRfZ2JldGgoc3RydWN0IG5l
dF9kZXZpY2UgKm5kZXYpDQo+IA0KPiAgICBJJ2QgbGVhdmUgb3V0IF9vZmZsb2FkLi4uDQoNCk9r
Lg0KDQo+IA0KPiA+ICt7DQo+ID4gKwlib29sIHJ4X2VuYWJsZSA9IG5kZXYtPmZlYXR1cmVzICYg
TkVUSUZfRl9SWENTVU07DQo+ID4gKwl1MzIgY3NyMDsNCj4gPiArDQo+ID4gKwlpZiAoIXJ4X2Vu
YWJsZSkNCj4gPiArCQlyZXR1cm47DQo+ID4gKw0KPiA+ICsJY3NyMCA9IHJhdmJfcmVhZChuZGV2
LCBDU1IwKTsNCj4gDQo+ICAgIFdoeSByZWFkIGl0IGhlcmUsIGlmIHdlJ2xsIHdyaXRlIGEgY29u
c3RhbnQgdG8gdGhpcyByZWcgYXQgdGhlIGVuZCBvZg0KPiByYXZiX2VtYWNfaW5pdF9nYmV0aCgp
Pw0KDQpUaGUgY29ycmVjdCBmbG93IGlzDQoNCkRpc2FibGUgdHgvcngNCkVuYWJsZSBDaGVja3N1
bQ0KUmVlbmFibGUgVHgvcnggaWYgaXQgaXMgYWxyZWFkeSBlbmFibGVkLg0KDQo+IA0KPiA+ICsJ
cmF2Yl93cml0ZShuZGV2LCBjc3IwICYgfihDU1IwX1JQRSB8IENTUjBfVFBFKSwgQ1NSMCk7DQo+
IA0KPiAgICBXZSBjYW4ganVzdCB3cml0ZSAwIGhlcmUsIG5vPw0KDQpTZWUgYWJvdmUuDQoNCj4g
DQo+ID4gKwlpZiAocmF2Yl93YWl0KG5kZXYsIENTUjAsIENTUjBfUlBFIHwgQ1NSMF9UUEUsIDAp
KSB7DQo+ID4gKwkJbmV0ZGV2X2VycihuZGV2LCAiVGltZW91dCBFbmFibGluZyBIVyBDU1VNIGZh
aWxlZFxuIik7DQo+IA0KPiAgICAiVGltZW91dCBlbmFibGluZyBoYXJkd2FyZSBjaGVja3N1bVxu
IiwgcGVyaGFwcz8NCg0KT0suDQoNCj4gDQo+IFsuLi5dDQo+ID4gKw0KPiA+ICsJcmF2Yl93cml0
ZShuZGV2LCBjc3IwLCBDU1IwKTsNCj4gDQo+ICAgICBJIHRoaW5rIHdlIHNob3VsZCBtb3ZlOg0K
PiANCj4gCXJhdmJfd3JpdGUobmRldiwgQ1NSMF9UUEUgfCBDU1IwX1JQRSwgQ1NSMCk7DQo+IA0K
PiBmcm9tIHJhdmJfZW1hY19pbml0X2diZXRoKCkgaGVyZS4uLg0KDQpJIGFtIHByb3ZpZGluZyBm
bGV4aWJsZSBvcHRpb25zIGhlcmUuDQoNCj4gDQo+ID4gK30NCj4gPiArDQo+IFsuLi5dDQo+ID4g
QEAgLTczNCw2ICs3NTUsMzIgQEAgc3RhdGljIHZvaWQgcmF2Yl9nZXRfdHhfdHN0YW1wKHN0cnVj
dCBuZXRfZGV2aWNlDQo+ICpuZGV2KQ0KPiA+ICAJfQ0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGlj
IHZvaWQgcmF2Yl9yeF9jc3VtX2diZXRoKHN0cnVjdCBza19idWZmICpza2IpIHsNCj4gPiArCV9f
d3N1bSBjc3VtX2lwX2hkciwgY3N1bV9wcm90bzsNCj4gPiArCXU4ICpod19jc3VtOw0KPiA+ICsN
Cj4gPiArCS8qIFRoZSBoYXJkd2FyZSBjaGVja3N1bSBzdGF0dXMgaXMgY29udGFpbmVkIGluIHNp
emVvZihfX3N1bTE2KSAqIDINCj4gPSA0DQo+ID4gKwkgKiBieXRlcyBhcHBlbmRlZCB0byBwYWNr
ZXQgZGF0YS4gRmlyc3QgMiBieXRlcyBpcyBpcCBoZWFkZXIgY3N1bQ0KPiBhbmQNCj4gPiArCSAq
IGxhc3QgMiBieXRlcyBpcyBwcm90b2NvbCBjc3VtLg0KPiA+ICsJICovDQo+ID4gKwlpZiAodW5s
aWtlbHkoc2tiLT5sZW4gPCBzaXplb2YoX19zdW0xNikgKiAyKSkNCj4gPiArCQlyZXR1cm47DQo+
ID4gKw0KPiA+ICsJaHdfY3N1bSA9IHNrYl90YWlsX3BvaW50ZXIoc2tiKSAtIHNpemVvZihfX3N1
bTE2KTsNCj4gPiArCWNzdW1fcHJvdG8gPSBjc3VtX3VuZm9sZCgoX19mb3JjZQ0KPiA+ICtfX3N1
bTE2KWdldF91bmFsaWduZWRfbGUxNihod19jc3VtKSk7DQo+ID4gKw0KPiA+ICsJaHdfY3N1bSAt
PSBzaXplb2YoX19zdW0xNik7DQo+ID4gKwljc3VtX2lwX2hkciA9IGNzdW1fdW5mb2xkKChfX2Zv
cmNlDQo+IF9fc3VtMTYpZ2V0X3VuYWxpZ25lZF9sZTE2KGh3X2NzdW0pKTsNCj4gPiArCXNrYl90
cmltKHNrYiwgc2tiLT5sZW4gLSAyICogc2l6ZW9mKF9fc3VtMTYpKTsNCj4gPiArDQo+ID4gKwkv
KiBUT0RPOiBJUFY2IFJ4IGNzdW0gKi8NCj4gPiArCWlmIChza2ItPnByb3RvY29sID09IGh0b25z
KEVUSF9QX0lQKSAmJiBjc3VtX2lwX2hkciA9PQ0KPiBUT0VfUlhfQ1NVTV9PSyAmJg0KPiA+ICsJ
ICAgIGNzdW1fcHJvdG8gPT0gVE9FX1JYX0NTVU1fT0spDQo+ID4gKwkJLyogSGFyZHdhcmUgdmFs
aWRhdGVkIG91ciBjaGVja3N1bSAqLw0KPiA+ICsJCXNrYi0+aXBfc3VtbWVkID0gQ0hFQ0tTVU1f
VU5ORUNFU1NBUlk7DQo+IA0KPiAgICBEb24ndCB3ZSBuZWVkIHRvIHNldCBza2ItPmNzdW1fbGV2
ZWw/DQoNCkFzIHBlciBteSBrbm93bGVkZ2UsIGl0IGlzIG5vdCBuZWVkZWQuIEkgbWF5IGJlIHdy
b25nLiBXaHkgZG8geW91DQp0aGluayBpdCBpcyBuZWVkZWQ/DQoNCj4gDQo+IFsuLi5dDQo+ID4g
QEAgLTIzMzcsOCArMjM4OCwzMiBAQCBzdGF0aWMgdm9pZCByYXZiX3NldF9yeF9jc3VtKHN0cnVj
dCBuZXRfZGV2aWNlDQo+ID4gKm5kZXYsIGJvb2wgZW5hYmxlKSAgc3RhdGljIGludCByYXZiX3Nl
dF9mZWF0dXJlc19nYmV0aChzdHJ1Y3QNCj4gbmV0X2RldmljZSAqbmRldiwNCj4gPiAgCQkJCSAg
IG5ldGRldl9mZWF0dXJlc190IGZlYXR1cmVzKQ0KPiA+ICB7DQo+ID4gLQkvKiBQbGFjZSBob2xk
ZXIgKi8NCj4gPiAtCXJldHVybiAwOw0KPiA+ICsJbmV0ZGV2X2ZlYXR1cmVzX3QgY2hhbmdlZCA9
IG5kZXYtPmZlYXR1cmVzIF4gZmVhdHVyZXM7DQo+ID4gKwlzdHJ1Y3QgcmF2Yl9wcml2YXRlICpw
cml2ID0gbmV0ZGV2X3ByaXYobmRldik7DQo+ID4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+
ICsJdTMyIGNzcjA7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCXNwaW5fbG9ja19pcnFz
YXZlKCZwcml2LT5sb2NrLCBmbGFncyk7DQo+ID4gKwljc3IwID0gcmF2Yl9yZWFkKG5kZXYsIENT
UjApOw0KPiA+ICsJcmF2Yl93cml0ZShuZGV2LCBjc3IwICYgfihDU1IwX1JQRSB8IENTUjBfVFBF
KSwgQ1NSMCk7DQo+ID4gKwlyZXQgPSByYXZiX3dhaXQobmRldiwgQ1NSMCwgQ1NSMF9SUEUgfCBD
U1IwX1RQRSwgMCk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWdvdG8gZXJyX3dhaXQ7DQo+IA0K
PiAgICBJIGRvbid0IHVuZGVyc3RhbmQ6IHdoeSBkbyB5b3UgY2xlYXIgdGhlIENTUjAgYml0cyBl
dmVuIGlmIChjaGFuZ2VkICYNCj4gTkVUSUZfRl9SWENTVU0pIGlzIDA/IFRoaXMgbG9va3MgdmVy
eSB3cm9uZy4uLg0KDQpJIG1hZGUgdGhlIGNvZGUgc2ltcGxlLiBDYW4geW91IHBsZWFzZSBzdWdn
ZXN0IGEgbXVjaCBzaW1wbGVyIHdheSB0aGFuIHRoaXM/DQoNCj4gDQo+ID4gKw0KPiA+ICsJaWYg
KGNoYW5nZWQgJiBORVRJRl9GX1JYQ1NVTSkgew0KPiA+ICsJCWlmIChmZWF0dXJlcyAmIE5FVElG
X0ZfUlhDU1VNKQ0KPiA+ICsJCQlyYXZiX3dyaXRlKG5kZXYsIENTUjJfQUxMLCBDU1IyKTsNCj4g
PiArCQllbHNlDQo+ID4gKwkJCXJhdmJfd3JpdGUobmRldiwgMCwgQ1NSMik7DQo+ID4gKwl9DQo+
IA0KPiAgICBJIHRoaW5rIHlvdSBzaG91bGQgcHV0IHRoYXQgaW50byBhIHNlcGFyYXRlIGZ1bmN0
aW9uLCBsaWtlIGlzIGRvbmUgZm9yDQo+IHRoZSBFaHRlckFWQi4uLg0KDQp5b3UgbWVhbiBhZGQg
dGhpcyBpZiBlbHNlIGJsb2NrIHRvIHNlcGFyYXRlIGZ1bmN0aW9uPz8gQ2FuIHlvdSBwbGVhc2Ug
ZWxhYm9yYXRlPz8NCg0KDQo+IA0KPiBbLi4uXQ0KPiA+IEBAIC0yNTE4LDYgKzI1OTMsOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHJhdmJfaHdfaW5mbyBnYmV0aF9od19pbmZvID0gew0KPiA+ICAJ
LmVtYWNfaW5pdCA9IHJhdmJfZW1hY19pbml0X2diZXRoLA0KPiA+ICAJLmdzdHJpbmdzX3N0YXRz
ID0gcmF2Yl9nc3RyaW5nc19zdGF0c19nYmV0aCwNCj4gPiAgCS5nc3RyaW5nc19zaXplID0gc2l6
ZW9mKHJhdmJfZ3N0cmluZ3Nfc3RhdHNfZ2JldGgpLA0KPiA+ICsJLm5ldF9od19mZWF0dXJlcyA9
IE5FVElGX0ZfUlhDU1VNLA0KPiA+ICsJLm5ldF9mZWF0dXJlcyA9IE5FVElGX0ZfUlhDU1VNLA0K
PiANCj4gICAgV2hhdCBhYm91dCBORVRJRl9GX0lQX0NTVU0sIEJUVz8NCg0KDQpXaHkgaXMgaXQg
bmVlZGVkPyBDYW4geW91IHBsZWFzZSBjbGFyaWZ5Pw0KDQpDaGVlcnMsDQpCaWp1DQo=

