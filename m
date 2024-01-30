Return-Path: <linux-renesas-soc+bounces-2060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BF8842A3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 18:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEE381F2614B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 17:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587E912837B;
	Tue, 30 Jan 2024 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PhHUJCEQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59387128379;
	Tue, 30 Jan 2024 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706634015; cv=fail; b=Re03IMHkrpgHMrRjdbulkQp9SyTCpEDooMBvABtl6D69ewkh5gGqya4JDK0rGbDEMY3dz7Shh6zAGC7XWwMHWVUkDcAy1JVsokH4AueJ/i3H0hfTCxiDQ+uBYZLy0eUJHONNqZLQgkYFXw+DaL/oawkkBDcV7Xlpm+/lGyYt4Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706634015; c=relaxed/simple;
	bh=410KZxUKhCkbZmoy3CG5x+ceIymOyjPEhktuz4ADNPA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OKMW3fznpSGOOU9yhSOjWHrJJuuvYx+yJHMzzOO+wNHqwRKCaUa5AVIXkuLV1Yh0XBQinNQY+4bnd04H7l0WMfbylKkut99oh6CMEMAksV5fIwc8/bolwWYJCv5pLz81HzV7asaVYu7xUfMU8hJ0QYDSdMPpwAqkbz1Ay0gQQSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PhHUJCEQ; arc=fail smtp.client-ip=40.107.114.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m137LVyIPC3tCNWuhhKINyGro4fkld2DzFL8vT9MITSMSwHGL0XyZoD6um+2k9xNN94+OXvDa6iRqI1b7lrb+ItSdw+CZdjgnCAu9Z32a5bjzU3cqqKpjFpSiVeT7uOmqJ96CMjlxuIDLb8ySmBnU4w7vccPksAw6Cl9tWi3WKMmiSgzyAJVNs6nX6gcpCug5rhvSULu5QuMqAUZA1hdd0g4a1hDXPYxoMzJZHqNALGdR5rnU8Mez1s70C5iYrV3+Eu5IM4H+cw83nzhwe0XFxfhlYNUuxAaa+MM8A0xNx0d5GS87AJfZQLPQ6EpDRlMbmhOzZz6jKmaNNQinQdTZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=410KZxUKhCkbZmoy3CG5x+ceIymOyjPEhktuz4ADNPA=;
 b=ebeyWTc71THyJQXkdmSX0p5xl304PiRx7l3XjtyjeMfAMp4sGjdXVwPluthX4nLfeYe9gdpXVt1eHoMWqmv4Wam0X6z5tEZ6HdBWbVtmeY6H0HBAscRWNexnnxRvAkf6ThSAxwIwv6dFxGgqiAoZTn4vV39/+tFFS0IXOiKjUTjlq+x2WCCKyYagjvbluVj47k6e6ObJvUyBb0TstBtgs9QWo2l4TrV9VDCdT+Ci7DWwuT4s7nlV9ZsBV/fqZickKY6lBedqBqCWFtTQsbyqo6+nU8mlXqx5/E1CNjp8urflg/41Vn0gVcnINM1p9f3A9wz75bFQL0br+ED/tpNiTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=410KZxUKhCkbZmoy3CG5x+ceIymOyjPEhktuz4ADNPA=;
 b=PhHUJCEQORF3a3U/srmdxrVsZqd/hbYeqHMXqUHPSZmrI/GjzfrOvk/tI3oFrTfK1OG4CURT2ArFYQQ1/Ij1meBmtHPSzh9dcHLQi2vGHAeUrvb0PqIXOoz0QQQPFwNxMCVmNPkKyb0ezOq7U3bkm2zZsX/0ADERywBFp+CvbP8=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB5894.jpnprd01.prod.outlook.com
 (2603:1096:604:c5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 17:00:09 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7249.023; Tue, 30 Jan 2024
 17:00:09 +0000
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
Thread-Index: AQHaTq8Z43IrcmV2f0OcLM7ZpnaZ7bDrAJeAgAAYJsCABjYagIABTAQQ
Date: Tue, 30 Jan 2024 17:00:09 +0000
Message-ID:
 <TYCPR01MB112695FD89B16249FD803D1E7867D2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240124102115.132154-1-biju.das.jz@bp.renesas.com>
 <20240124102115.132154-2-biju.das.jz@bp.renesas.com>
 <e27edbff-8fa9-339a-4e6d-d72776286aa6@omp.ru>
 <TYCPR01MB112690D34DFFCFA876203A539867A2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <05cbba41-2927-e4fd-cb00-d3f40d92830f@omp.ru>
In-Reply-To: <05cbba41-2927-e4fd-cb00-d3f40d92830f@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB5894:EE_
x-ms-office365-filtering-correlation-id: ad7e3a6d-a158-49c9-3d1b-08dc21b4ea94
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wtUKWzqFP8HWhVf0bbtuEzF0UF8+HJ2v6nJZpHKBDMVUJZLvW31IQGWEfGE8aefvBUH6xxHEwUlBAVbwBXIDJmGLzcSgbd5GeCPr0Z1VgqMG7Q5gl94KHh9P3lApsJe6ZqTsE6J1EKiM1PidNTvBWb8Dac6dxyL1pip1IYFgnifjMd0HPK8cSq4E4skTQ93bX6gXlIbWB86l7+wORUmEStgq4+mpKSgRl0Zdy3rUiZVuFws2BuxT2H+okS+DK1KVW03fGC4fUty+8T7fypbjcH2Jt2/iLuJfxiL1DrRwO7af9TSThATglT42m4SAn1GINrF+IzxJnj3SxVFbc6Z6bC+EvGjUOPVGcS7V2pjiU7GBZCEj8IX1UjVlyzj4+7SgSscJzgUV9iT2udD3SvnMtni5T0ayTx4/61DNtYtisITM+P9NajdSDbv74BQZflS5dAhGo+Zi2rd/I3IecfgFZshNkwwgODRGBf+OsrDZuYGBJFCsZ/iZeIuNo5wLv04tVygh7i35mXDP5YnoZyAzG17lkgE2RY7xNflC+v7t3UI5zy8luS9+2Q2v+i5g4BHwClsQq/1pvNkAfRgybuq9sJ7yRITLGaXR3XJ8X0WnvTo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(376002)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(54906003)(76116006)(122000001)(8936002)(83380400001)(33656002)(86362001)(38100700002)(41300700001)(478600001)(316002)(4326008)(66946007)(66476007)(110136005)(966005)(66446008)(2906002)(26005)(7416002)(71200400001)(7696005)(66556008)(5660300002)(6506007)(64756008)(52536014)(8676002)(9686003)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1JzaXdlUlBlRUdBZnJyU1VPZmdOOUJVemlXNW1KRkxFdzBPMFlCM1ZhNlEy?=
 =?utf-8?B?MitrR1c5Sm9VYjFSR2dCdTJsTzg0YXlwYnhVbmFwbFFNQXFjM1hEcjdrdHFB?=
 =?utf-8?B?eHY1WVpwZlNuU0RlNE5wTDU2R2lZYzVZY1JEc0VMdUFVNFpwdFJDeE03WWEx?=
 =?utf-8?B?cGJCRFhONUYxZWFXaVJhOFdGTno4ZHVWTGtpMjhaSjM0VjM5cy9TVHZOOVVL?=
 =?utf-8?B?dkE1SGwzVG0rMjBJZkhHT1hYUTdkbmRFeGM4V25ZRk9ySjVNSDErUVZ0Vzlo?=
 =?utf-8?B?V0JSbUFNZEVpQ0JqVjZ5NndxWFIxclZpUDZTcERCc2dsZTJuT0dWNU1zZ2p6?=
 =?utf-8?B?dlRCZ2ZMWHovWXlWSVJ4emFMK2crQmZvOGlmLzZ4Y29EdkJnbDVCaG1EOFM1?=
 =?utf-8?B?Rlp0cGtUbjBISlA5d1c3eVkxVUhGbTF2Skl0dldFVlVnZDBTQjVsU1lFMU9U?=
 =?utf-8?B?Mk0zMVdFUWJyV3pKRnMvN3NYSUFtZi9xa0grZ08yUHlIam1VTzlNcVBhZGVy?=
 =?utf-8?B?S3lLblNEMEVrZWMyLzZHdm1NRTdsd0FGUktWTUV6clN5Yy9yUnNWUTVCbWhN?=
 =?utf-8?B?NGg1RkVONjhSVExEVHpJTWRqNkMrU0NTV0tERGYzUFprTFlHZDhoSXlIcHlT?=
 =?utf-8?B?di9saUdJVzk4bjdmWm5BN0Q1cm9FRzl2RWJOemNlTllPakRObjVpY3IreHE1?=
 =?utf-8?B?VlBBVEVmUU9yajRaK2ZIdlphRm1yVU4vci9nR2FZTTVNQ2Q2QWJNUG9TdGNG?=
 =?utf-8?B?VldIa0lTbHFONGUzMTg0RHoybFFnNFN4VlpaZklQS081ZDUzK2NHMUVIdTky?=
 =?utf-8?B?ckM3U1BEdXhoRExRN2lzbzFoRG9vb0dwTHgxQUlTRW9Wc1YwdW1sdmF3a2Ux?=
 =?utf-8?B?TDMra3pUN2ZNdkZlSEcwUFVab3o1cEIvOEYvMmpPU2dhazF0VXFBaitYNStT?=
 =?utf-8?B?RlJpQ3BvODNUYTl6akFqcDlDaGJvYkZBZVA3QStyNUtMUzVwVngyOE1WUUZa?=
 =?utf-8?B?bE5IcllWT2N3OS9XVnZFWSt5TFpZZi9aUnF5OXFqWFVzekFIZ2lKWGpQeFdL?=
 =?utf-8?B?ZlpFTXJtbGsvOEQ2V3phejZuTGJ5SVM1K1gyemVMeEIvTmFxbERJdmNjc0dR?=
 =?utf-8?B?ck1MNVZIVU9ON1VxZGFTNlNScmNaVXJLM3dNUzYxZmVPUGRMQnFjdzFZUzY5?=
 =?utf-8?B?aXdPNGlBOXVMTkRDZWhFNUZHNkY5V2xpQnN6eS9lVnlaUTA0QnVqZUl6MDRx?=
 =?utf-8?B?SnIvWUdRZWMvNFNsSDBNdExsRUM5L0k0azh0bHNqWkxYMFpySVhTa1llZmFu?=
 =?utf-8?B?ZHlvZjZTV24rUjlzK1JPdjBXWnNBM1F6cEpnV0dKaVJQUHc2ZS9lU2ErSzJr?=
 =?utf-8?B?Z1E2SlgzdkZDV29UQ3FGNWZSUEZEOFRmc2NTNisrQWI2Q044ZUVQbXBGdUVT?=
 =?utf-8?B?ZWJKd3NsZnFJekNPNGtZcW5adFBxN3paRVRZUlFteU5sRkFLc1A5dTlraWJO?=
 =?utf-8?B?ZGpCZGJKVkppRkZmd0dON0NOWCs2TjBpMWs0bXVGb0hVb1E4bS9hRitvbnBM?=
 =?utf-8?B?WFBhRjFsZitBUnNPRXd0M0xZQktpYVA3TUFPSFZ2SDRCdFRML3cwaGRXUWdZ?=
 =?utf-8?B?dmJ1THg1ZW92TTRVWGE1V05lVDNtVXZ5djlVTzRoSVhBZkpWa3ZkdGJRN21W?=
 =?utf-8?B?R1VXdkN1a2hjbmZQbFFyaUpyTFBtRUZXQkIzeko0L3UxemVqMDd2Q2tVV2tV?=
 =?utf-8?B?ZHlkQWlpQmtqSWpOVWJGd1ZqcjNMbktIRmQ3bXRtQjl0UGEvN1FibFdHQ2RF?=
 =?utf-8?B?Y3N1YU9iTjZVR2ZpbUVyaUpwY3VXTEMwZ01uNzd1eFhCNzJqNTFTek9pT2g3?=
 =?utf-8?B?RFpwVlVGUzNpWWVQZFVFMG4wNTNzck1kcmlsWnVBQVdXaG5iOXNlSzBTYzA2?=
 =?utf-8?B?Z0pXcEdXaVZLWjlLdk9sYnpJa1dNMnh2T2kxN0NDb0QvNFZMWnpJS3RocHpo?=
 =?utf-8?B?VFVDK0VLcVZPalJKS3VuYTZhVTNzeFNWZitVNVZwUGVScU1mNkQycHFwMDZa?=
 =?utf-8?B?RWY3RGZpQ1NLeERqaXpvWUNWYko3ZEU1TGUyTTZQb2puMnVJZzlsVkNEZWNQ?=
 =?utf-8?B?L3doUkllSWMraFQvblQrV0lrM2o5V1NHVEtEeEExOFROSHorYkRDMWZZZW1N?=
 =?utf-8?B?eVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7e3a6d-a158-49c9-3d1b-08dc21b4ea94
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 17:00:09.2632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: niFlONFTIjtFIWAH1ppVglcO9i1wMYYmvuIutoNnN229N0blh+JsGr8wgXAAoRVSMzyfo0HqAenKW1KwKOTGfubnYxk4TtvH+V5Rm3Hm4do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5894

SGkgU2VyZ2V5IFNodHlseW92LA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiA+PiAg
ICBEb24ndCB3ZSBuZWVkIHRvIHNldCBza2ItPmNzdW1fbGV2ZWw/DQo+ID4NCj4gPiBBcyBwZXIg
bXkga25vd2xlZGdlLCBpdCBpcyBub3QgbmVlZGVkLiBJIG1heSBiZSB3cm9uZy4gV2h5IGRvIHlv
dQ0KPiA+IHRoaW5rIGl0IGlzIG5lZWRlZD8NCj4gDQo+ICAqICAgQ0hFQ0tTVU1fVU5ORUNFU1NB
UlkgaXMgYXBwbGljYWJsZSB0byBmb2xsb3dpbmcgcHJvdG9jb2xzOg0KPiAgKiAgICAgVENQOiBJ
UHY2IGFuZCBJUHY0Lg0KPiAgKiAgICAgVURQOiBJUHY0IGFuZCBJUHY2LiBBIGRldmljZSBtYXkg
YXBwbHkgQ0hFQ0tTVU1fVU5ORUNFU1NBUlkgdG8gYQ0KPiAgKiAgICAgICB6ZXJvIFVEUCBjaGVj
a3N1bSBmb3IgZWl0aGVyIElQdjQgb3IgSVB2NiwgdGhlIG5ldHdvcmtpbmcgc3RhY2sNCj4gICog
ICAgICAgbWF5IHBlcmZvcm0gZnVydGhlciB2YWxpZGF0aW9uIGluIHRoaXMgY2FzZS4NCj4gICog
ICAgIEdSRTogb25seSBpZiB0aGUgY2hlY2tzdW0gaXMgcHJlc2VudCBpbiB0aGUgaGVhZGVyLg0K
PiAgKiAgICAgU0NUUDogaW5kaWNhdGVzIHRoZSBDUkMgaW4gU0NUUCBoZWFkZXIgaGFzIGJlZW4g
dmFsaWRhdGVkLg0KPiAgKiAgICAgRkNPRTogaW5kaWNhdGVzIHRoZSBDUkMgaW4gRkMgZnJhbWUg
aGFzIGJlZW4gdmFsaWRhdGVkLg0KPiAgKg0KPiAgKiAgIHNrYi0+Y3N1bV9sZXZlbCBpbmRpY2F0
ZXMgdGhlIG51bWJlciBvZiBjb25zZWN1dGl2ZSBjaGVja3N1bXMgZm91bmQNCj4gaW4NCj4gICog
ICB0aGUgcGFja2V0IG1pbnVzIG9uZSB0aGF0IGhhdmUgYmVlbiB2ZXJpZmllZCBhcyBDSEVDS1NV
TV9VTk5FQ0VTU0FSWS4NCj4gICogICBGb3IgaW5zdGFuY2UgaWYgYSBkZXZpY2UgcmVjZWl2ZXMg
YW4gSVB2Ni0+VURQLT5HUkUtPklQdjQtPlRDUCBwYWNrZXQNCj4gICogICBhbmQgYSBkZXZpY2Ug
aXMgYWJsZSB0byB2ZXJpZnkgdGhlIGNoZWNrc3VtcyBmb3IgVURQIChwb3NzaWJseSB6ZXJvKSwN
Cj4gICogICBHUkUgKGNoZWNrc3VtIGZsYWcgaXMgc2V0KSBhbmQgVENQLCBza2ItPmNzdW1fbGV2
ZWwgd291bGQgYmUgc2V0IHRvDQo+ICAqICAgdHdvLiBJZiB0aGUgZGV2aWNlIHdlcmUgb25seSBh
YmxlIHRvIHZlcmlmeSB0aGUgVURQIGNoZWNrc3VtIGFuZCBub3QNCj4gICogICBHUkUsIGVpdGhl
ciBiZWNhdXNlIGl0IGRvZXNuJ3Qgc3VwcG9ydCBHUkUgY2hlY2tzdW0gb3IgYmVjYXVzZSBHUkUN
Cj4gICogICBjaGVja3N1bSBpcyBiYWQsIHNrYi0+Y3N1bV9sZXZlbCB3b3VsZCBiZSBzZXQgdG8g
emVybyAoVENQIGNoZWNrc3VtDQo+IGlzDQo+ICAqICAgbm90IGNvbnNpZGVyZWQgaW4gdGhpcyBj
YXNlKS4NCj4gDQo+ICAgIEl0IHdvdWxkIHNlZW0gd2Ugc2hvdWxkIHNldCB0aGlzIGZpZWxkIHRv
IDEgaWYgdGhlIFRDUC9VRFAgY2hlY2tzdW0gd2FzDQo+IHN1Y2Nlc3NmdWxseSB2ZXJpZmllZD8N
Cg0KSSBndWVzcyBpdCBpcyBmb3IgZW5jYXBzdWxhdGVkIHBhY2tldHMuIEZvciBqdXN0IElQIGFu
ZCBVRFAvVENQDQpDaGVja3N1bSBpdCBpcyBub3QgcmVxdWlyZWQuDQoNClNlZQ0KDQpodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbmV0L2V0aGVy
bmV0LzNjb20vM2M1OXguYyNMMjY2OQ0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
bGF0ZXN0L3NvdXJjZS9kcml2ZXJzL25ldC9ldGhlcm5ldC9hbWF6b24vZW5hL2VuYV9uZXRkZXYu
YyNMMTYyNg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9hdGhlcm9zL2FseC9tYWluLmMjTDI3Mg0KaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL25ldC9ldGhlcm5ldC90
aS9hbTY1LWNwc3ctbnVzcy5jI0w3MTENCg0KPiANCj4gPj4gWy4uLl0NCj4gPj4+IEBAIC0yNTE4
LDYgKzI1OTMsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJhdmJfaHdfaW5mbyBnYmV0aF9od19p
bmZvID0NCj4gew0KPiA+Pj4gIAkuZW1hY19pbml0ID0gcmF2Yl9lbWFjX2luaXRfZ2JldGgsDQo+
ID4+PiAgCS5nc3RyaW5nc19zdGF0cyA9IHJhdmJfZ3N0cmluZ3Nfc3RhdHNfZ2JldGgsDQo+ID4+
PiAgCS5nc3RyaW5nc19zaXplID0gc2l6ZW9mKHJhdmJfZ3N0cmluZ3Nfc3RhdHNfZ2JldGgpLA0K
PiA+Pj4gKwkubmV0X2h3X2ZlYXR1cmVzID0gTkVUSUZfRl9SWENTVU0sDQo+ID4+PiArCS5uZXRf
ZmVhdHVyZXMgPSBORVRJRl9GX1JYQ1NVTSwNCj4gPj4NCj4gPj4gICAgV2hhdCBhYm91dCBORVRJ
Rl9GX0lQX0NTVU0sIEJUVz8NCj4gPg0KPiA+IFdoeSBpcyBpdCBuZWVkZWQ/IENhbiB5b3UgcGxl
YXNlIGNsYXJpZnk/DQo+IA0KPiAgICBJZ25vcmUgbWUgLS0gdGhpcyBvbmUgc2VlbXMgdG8gYmUg
dXNlZCBmb3IgdGhlIFRYIHBhdGguDQo+ICAgIEkganVzdCBoYWQgdG8gbGVhcm4gaG93IHRoZSBj
aGVja3N1bSBvZmZsb2FkaW5nIHdvcmtzIHdoaWxlIHJldmlld2luZw0KPiB5b3VyIHBhdGNoZXMu
Li4gOi0pDQoNCk9LLg0KDQpGb3Igb3RoZXIgY29tbWVudHMuIEkgd2lsbCB0ZXN0IGFuZCByZXNw
b25kLg0KDQpDaGVlcnMsDQpCaWp1DQo=

