Return-Path: <linux-renesas-soc+bounces-3881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C857C87FA45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 10:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33DF7B20DC2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 09:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269AB7C0BA;
	Tue, 19 Mar 2024 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vMvGOCml"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2105.outbound.protection.outlook.com [40.107.114.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD597C0A0;
	Tue, 19 Mar 2024 09:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710839070; cv=fail; b=gp1Dn4wzsQzxbvnfJxbHCptexmDiPc/IuJhgPDimKNrT9/0H01tLP/ffeJMmT+/lE0d+Zohl5UYhiglje8tUukVUqx7TyMBlp1mvJaIgMemburj18EvJFPUl4BrbVAF8A2aeb/TANSBzkAXRAgn3QAo7dmPujS3I7XJPrN4t2Vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710839070; c=relaxed/simple;
	bh=JR1/IHyGvgrD+/rgUIRMDYPj/lXxF5FB+3CAbQFZGwM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Sk8lsK+hXQLlxz7cRII5Hmw7O5yZlaaC9jJB0Vd1IP2G6UVUqvQmLaoF3EKzI9XWNDB9Sx/AH5HeQjV4GEM/0Zeo9+jeS5DVRrShUjF5Tm2fs1YZ2klpkbrt+HahVOG65cLEQ+MiczNFmZLxNET12sYUu7tfV5BQlNol2K8N5Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vMvGOCml; arc=fail smtp.client-ip=40.107.114.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAtuqG2HNwRampgWq8LDSN7qdc+P4/Cejyd3WKOAfFC9kDiw6uCVXhBk4tMUtZ3X1YOgdjS5i6cWzfTuSaJL0U16jaIn8RrvbKwY7K79Gcx9aRRBVitN7i3jFnBRBYtO8fnS7vlRKUZvgVuxk6Qt86FHDkJFvWZRP7nFZCrYsVHQnB1XXbh0nYgkNiMGcb3Q2e1Pw+cf6WPh7J+nszvY5Nr+jnyBo/YAfQIF7UeQjs8Xf2/+a/5dyyWFut4olA7yyfIn6XDNLGPTjoJ9yH1zH6LG1MPgqkmDVPwhgQNxbXlSZM4W6eNDFLkHGa8e9xNHA/WVKFSpWn/G+vCWo60AaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JR1/IHyGvgrD+/rgUIRMDYPj/lXxF5FB+3CAbQFZGwM=;
 b=EdcAOX+gtG+ZQpp73OfOV0jfucIaV7m5wqlgzWT6l8H+VedY7p1xTtDppFtl0SiYX1PORzeGSWbAxAcXJGuzdSES8nCZIBv4l/rpaZ48Ypa/AmmH10GLSHQ/4JIw/E/S00KzheXXcXsoHorU/Fl5wlZw22+nSByNiZgoEz5ecQU+YAbIqvV9QcurYbmiz8OVBKl2ldI7UypTv6VfXYQ72I9SM+bUCqeQXgmdinCxK10w/zrf/q/cioQWX+4bnvISRiJPiCbWCTNf5Hy/9pDmq6jFAlRMnGSQSrW3uSW4mX0k4fHL0SfwV0Me+iqb7bQmikjSM3MUz36gJOgNexOImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JR1/IHyGvgrD+/rgUIRMDYPj/lXxF5FB+3CAbQFZGwM=;
 b=vMvGOCmlCPZ8IvWwoMThxGNgH2qKxE/pbA9qD/mMtETs1gayfxO9Wc1Sdt6WLnJHoytOW7oZmjLPqwpWWVzOTuvpPIpp9TAnLky328qxuJlvkDVTXeAOEx7ZURsajmxS0+70oFPlBFPut8pgwb2ybG+FBSes9LVbRvcnc3iMS2Y=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by OS0PR01MB5715.jpnprd01.prod.outlook.com (2603:1096:604:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Tue, 19 Mar
 2024 09:04:22 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f%5]) with mapi id 15.20.7386.023; Tue, 19 Mar 2024
 09:04:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm
	<magnus.damm@gmail.com>, Huy Nguyen <huy.nguyen.wh@renesas.com>, Rob Herring
	<robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>
Subject: RE: [PATCH v4 4/6] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
Thread-Topic: [PATCH v4 4/6] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
Thread-Index: AQHaeVptgaT7fzuzYU+sZqhnfudP0rE+wGqAgAAFXUA=
Date: Tue, 19 Mar 2024 09:04:15 +0000
Message-ID:
 <OSAPR01MB1587FD385D58E06E3BB27AB4862C2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240318173319.201799-1-biju.das.jz@bp.renesas.com>
 <20240318173319.201799-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdUqgBWmb1ovwDn+Xx0RVLdBCAZnSj48Dse6YPNDx1A6Pg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUqgBWmb1ovwDn+Xx0RVLdBCAZnSj48Dse6YPNDx1A6Pg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|OS0PR01MB5715:EE_
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SJDvRBJHQXsZzVFn17XFenUN+DlXUMpjhV++xo6t5nuqqvP+xBZwgCeOXCTARRzrrL/ZUGGuJWWKFFsBgd5kY+gru0F9HWh4143xXYiTgbKbLRyM8UqL4GP3ImVi0ivocRmnD2XRNtiVGjzVZFhZmiCaUG5ZrYiMOky0K7WoEYJ7lCwXkR+bT+Vxhu65PbirbVWBbkt/IyEoznnxz/K2ccu8Cy6G8IWEWeO1V3N/9azU825mybrEZnaKqGQpo2d6uizYpVry4zWM0vk2hVFUthvxxy1d+S40JVqpK1ardRTbCGOzx7mRES9ECTNXR8utBA3KVV78kwMIQPvWfa6zJrYi8uDQa6FQxAs3kTMda601TpqHCzSFYE9B1VhZSBP6PjcgAT2vOwWPhTmMYnNh2LExh4ETlOFEAtS54KKD2tm51l5a/8ohAmF898a3nHunKIJVWIXqMOOJMHmwP0oSLLoGVDU+W8jhgWtH9rlwjuUCTa0I9eLsDaNVTaeX/+JTzygLvSUqhUv5ZjYCHnCsFpRscYHpvKtUzh4PRfvHR//Iryyl1nCHtS4L2V4AfP4jsizgk+okk4BKyJv/Nu9O2U/YYFjzMFjuttOmZhPfTGHqVEqu9Hw8YjKCjWT0rNtHGWghXyWC0ZKpmpTR69AIl1S3DoHzEyx/JU5dbxgDV1Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWdlcm9PdThpcTQ3MDJUSFJXeXNkOWdiMlFscXdMSmxKY3phbzgzTU5XTzlD?=
 =?utf-8?B?ODlkQ1p6RGdwMG8yWG1Pc3puQ09ldVVHT1R0cXhjeFZUMzRHTzRNazQxWm03?=
 =?utf-8?B?cm03dXY0RFZ5VUhWZG9Fd20vZjM1UmZUeElWQ1orR0FBck5PRnZwSkJaTWh4?=
 =?utf-8?B?aEQxRnpVYnl3NkRHeGxWVUhXdTJva3JtNGVSamEyMkF5YTFpb2lya2pXQVZF?=
 =?utf-8?B?ZndxdjVmMWNaSWNoWUgxZ2JtMFMzWDlTeTdQVXlSQlB6b1pUTk1zMnNEWTdw?=
 =?utf-8?B?RFozTDFyZm5NWkQxSHZzeVpuYml2YWJqRERSMnJrUkJLclZpdHF5S012ZExt?=
 =?utf-8?B?c1luY0ZHdkl2Tjh4M3FDR1QrNHVVMjNHZEQvZ3JkWW92SUszWklxSkZ1dmNk?=
 =?utf-8?B?SHhQRlAxVkpyaG1ndjF5QjFJcnhyaEV2dlh1QmlsY1F5b3YwQmFmQnRRYU9S?=
 =?utf-8?B?aUlRVjFCWmhVcFU0dWpCMmZiTHU5TmczM2FqSHBieko5a3I4YUxaS3p3WjY1?=
 =?utf-8?B?K0wzaUhTU3QzalZqUXBWSk1jNHJ3ZE95US9JUmkvZCtickxGNTFLUUc2a2I3?=
 =?utf-8?B?c1h3dThHSGxRd2dlVFk1Wi94WjIvaU9ZNVcxSW5YQXhnOHhsV0tWYlZGL25y?=
 =?utf-8?B?MW1URFN2dm9haElmS3k0NlI5QUp3U3NGejdyUHJTQ3EvdTVSVmc5cURTa1BK?=
 =?utf-8?B?aWNsZVVmNy9OeFZiM2k2cWdpSlBvZ1ZWVDM1SDBsUUYwSEIxcnRERU9jenZt?=
 =?utf-8?B?dU4xemI2eHVRZDM1L0R2eFZEV0llcU42U3RHbU5PUE02NnFKbTFScE9EN0Q3?=
 =?utf-8?B?Um1HcjBmTS9JYWdxaStnZDVIQVFTbWU4UTdHNWN1K1h1cE1aL3lJdUpvR2FG?=
 =?utf-8?B?cGFZR2hRS0Y0Nnl5Z0RwTTd4R0MrR0k5bi9FTVVJT25tMlg3MlpIck9UTmZO?=
 =?utf-8?B?cjkrZXpUZ3FUVEVsMUZXUThpVzlnK3FPTWJkUzdJUGFqV0dFQ1ZmNkZpYXEz?=
 =?utf-8?B?aVlHK1ljTFcxRmoreHMyVFc2MVBMK3NMN0JvUDkyeW1xQWVldS9nNFVBeDNq?=
 =?utf-8?B?L2lQUExqNnB5SE5qejYwcTVhVjJCQTI2Mnl4OTBVeEN5WHF4YjVvOStFb1c2?=
 =?utf-8?B?YWhvSjE4ZDk2MVluTTZkdGM5VVNLb3h5S1ZZR3RCWE9kd2dyZm9USDhoeE5y?=
 =?utf-8?B?blM2SmNXYjkxSWtsWENxMHhrU0NwVUlzdWtkWkd1SlFOdXo2Qm1rUzE2UkI2?=
 =?utf-8?B?ZzVTQ2hVUWhmd1JiZGlLelBrMllaQTNlazVYaEJMdHVhRzhyMGRnNEFhb081?=
 =?utf-8?B?VEloMGljWmtIZEt5RWJNbHhKZzhheVB2bHRTR1hpUE43QkZ4RGxJSGt6T05z?=
 =?utf-8?B?WCt0VnVFTkJqZG94ckxhU1BBUDFieTBXK3ZLU3dhWlFGVlVpNFJIMnEvZ3o4?=
 =?utf-8?B?NE1KdVNsUjdjc2pCU3Q2Wit1M05ZT2dmTFZad2l2M2VLRzJMYXVkYWtjMmNV?=
 =?utf-8?B?bVA1RVc4SzJyWFRBNzcreFZ3QkpOcHIva25LbE83NUw2eURKQ0htTERLUWMv?=
 =?utf-8?B?ajN4eHBRK21mUHFQQTMzUEdNYzNqWEZCblJsc2R6T3Avd2M2cTFmV2R5SWpp?=
 =?utf-8?B?dXpvK0NXZ3dZeUk4VjdHcDRBd0JIdGtKUlFpUUo1MUFlNFQ3SWlwOVZhRnZV?=
 =?utf-8?B?SjVLQVVVUGRwcVJrZDd2UjVUdzhMM0NhZm11UDR1SWxTQU92b1VoOGRUQjJO?=
 =?utf-8?B?N1VpMVNlcSszU0lmV1hnUk9hU1pYYUVHT3JUb2FueWNEYlBwL21yMEpHN1Fz?=
 =?utf-8?B?aGtiMXZwT2trZFp0TjRaeGNJZDYrajI1VGtIb2xBRnZEVkdsT3NML2EzVlVW?=
 =?utf-8?B?NGNGVGtJVFVlMEZPeFF0aDQvT21lTHByckI3NXlkU2E1UHF0clRqM0xaZnVS?=
 =?utf-8?B?RmF1YUxGaGY5a2JUK0xQSXE2Y2g2VWFLcUpaRWl5Rk03KzF1bDVRcnJldWZp?=
 =?utf-8?B?cGw4SEN4dEhOWkNRdHd4a2dXVSs1YVRsbzEwWUtFYmo0SzNCRzVEOHFJZ1Vl?=
 =?utf-8?B?aWtBS216L3k2elpzeERsQTJQRURxbU5zQjBFMTZicjk1dFRndVU0bjZRSlFy?=
 =?utf-8?B?dHRscWxleU10elRoME0rZWpLdFJIQmhJVytiOTBENXRBN2FxYnNKRm5rVDB1?=
 =?utf-8?B?eGc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff2448d-29d8-4107-51f8-08dc47f38d2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 09:04:15.0520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zyukxHbFSPcIK35tS14nONnxysUwBkFgqiX3I7F1BaC610jRTmJBCDzBPQ+V25OZL+t56jAyJFno/zt26rDT3orqsvC8b5lcrvwOyhlcp4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5715

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDE5LCAyMDI0IDg6NDQgQU0NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NCA0LzZdIHVzYjogcmVuZXNhc191c2JoczogVXBkYXRlIHVzYmhzIHBp
cGUgY29uZmlndXJhdGlvbiBmb3IgUlovRzJMIGZhbWlseQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+
IE9uIE1vbiwgTWFyIDE4LCAyMDI0IGF0IDY6MzPigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRoZSBSWi9HMkwgZmFtaWx5IFNvQ3MgaGFzIDEw
IHBpcGUgYnVmZmVycyBjb21wYXJlZCB0byAxNiBwaXBlIGJ1ZmZlcnMNCj4gPiBvbiBSWi9BMk0u
IFVwZGF0ZSB0aGUgcGlwZSBjb25maWd1cmF0aW9uIGZvciBSWi9HMkwgZmFtaWx5IFNvQ3MgYW5k
DQo+ID4gdXNlIGZhbWlseSBTb0Mgc3BlY2lmaWMgY29tcGF0aWJsZSB0byBoYW5kbGUgdGhpcyBk
aWZmZXJlbmNlLg0KPiA+DQo+ID4gVGhlIHBpcGUgY29uZmlndXJhdGlvbiBvZiBSWi9HMkwgaXMg
c2FtZSBhcw0KPiA+IHVzYmhzY19yemcybF9kZWZhdWx0X3BpcGVbXSwgc28gc2VsZWN0IHRoZSBk
ZWZhdWx0IHBpcGUgY29uZmlndXJhdGlvbg0KPiA+IGZvciBSWi9HMkwgU29DcyBieSBzZXR0aW5n
IC5oYXNfbmV3X3BpcGVfY29uZmlncyB0byB6ZXJvLg0KPiA+DQo+ID4gQWRkIFNvQyBzcGVjaWZp
YyBjb21wYXRpYmxlIHRvIE9GIHRhYmxlIHRvIGF2b2lkIEFCSSBicmVha2FnZSB3aXRoIG9sZA0K
PiA+IERUQi4gVG8gb3B0aW1pemUgbWVtb3J5IHVzYWdlIHRoZSBTb0Mgc3BlY2lmaWMgY29tcGF0
aWJsZSB3aWxsIGJlDQo+ID4gcmVtb3ZlZCBsYXRlci4NCj4gPg0KPiA+IEJhc2VkIG9uIHRoZSBw
YXRjaCBpbiBCU1AgYnkgSHV5IE5ndXllbiA8aHV5Lm5ndXllbi53aEByZW5lc2FzLmNvbT4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPiAtLS0NCj4gPiB2My0+djQ6DQo+ID4gICogQ3JlZGl0ICBIdXkgTmd1eWVuJ3Mgd29y
ayBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIGRyb3BwZWQgaGlzIG5hbWUNCj4gPiAgICBmcm9t
IFNpZ25lZC1vZmYtYnkgdGFnLg0KPiA+ICAqIFNlbGVjdGlvbiBvZiB1c2Joc2NfcnpnMmxfZGVm
YXVsdF9waXBlW10gYnkgc2V0dGluZyB0aGUgdmFyaWFibGUNCj4gPiAgICBoYXNfbmV3X3BpcGVf
Y29uZmlncyB0byB6ZXJvLg0KPiA+ICAqIFVwZGF0ZWQgY29tbWl0IGRlc2NyaXB0aW9uLg0KPiAN
Cj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAgKiBEcm9wcGVkIHRoZSBjaGVjayAn
cHJpdi0+ZHBhcmFtLnBpcGVfY29uZmlncycgYXMgaXQgaXMgc2FtZSBhcw0KPiA+ICAgIGNoZWNr
aW5nICFoYXNfbmV3X3BpcGVfY29uZmlncy4NCj4gDQo+IEkgZGlzYWdyZWU6IGl0IGlzIHVzZWQg
dG8gc3BlY2lmeSB0aGUgcGlwZSBjb25maWcgdGhyb3VnaCBwbGF0Zm9ybSBkYXRhIG9uIG5vbi1E
VCBwbGF0Zm9ybXMuICBUaGVyZQ0KPiBkb24ndCBzZWVtIHRvIGJlIGFueSB1cHN0cmVhbSBTSCBw
bGF0Zm9ybXMgZG9pbmcgdGhhdCwgdGhvdWdoLg0KDQpZb3UgYXJlIGNvcnJlY3QuDQoNCj4gDQo+
ID4gLS0tIGEvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmMNCj4gDQo+ID4gQEAgLTY0Miw3ICs2NTgs
NyBAQCBzdGF0aWMgaW50IHVzYmhzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ID4gICAgICAgICBpZiAodXNiaHNfZ2V0X2RwYXJhbShwcml2LCBoYXNfbmV3X3BpcGVfY29u
ZmlncykpIHsNCj4gPiAgICAgICAgICAgICAgICAgcHJpdi0+ZHBhcmFtLnBpcGVfY29uZmlncyA9
IHVzYmhzY19uZXdfcGlwZTsNCj4gPiAgICAgICAgICAgICAgICAgcHJpdi0+ZHBhcmFtLnBpcGVf
c2l6ZSA9IEFSUkFZX1NJWkUodXNiaHNjX25ld19waXBlKTsNCj4gPiAtICAgICAgIH0gZWxzZSBp
ZiAoIXByaXYtPmRwYXJhbS5waXBlX2NvbmZpZ3MpIHsNCj4gPiArICAgICAgIH0gZWxzZSB7DQo+
IA0KPiBIZW5jZSBJJ2QgcmF0aGVyIGRyb3AgdGhpcyBjaGVjay4NCg0KT2ssIHdpbGwgcmVzdG9y
ZSB0aGUgY2hlY2suDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiAgICAgICAgICAgICAgICAg
cHJpdi0+ZHBhcmFtLnBpcGVfY29uZmlncyA9IHVzYmhzY19kZWZhdWx0X3BpcGU7DQo+ID4gICAg
ICAgICAgICAgICAgIHByaXYtPmRwYXJhbS5waXBlX3NpemUgPSBBUlJBWV9TSVpFKHVzYmhzY19k
ZWZhdWx0X3BpcGUpOw0KPiA+ICAgICAgICAgfQ0K

