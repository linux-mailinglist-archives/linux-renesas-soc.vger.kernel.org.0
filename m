Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D393B47EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 19:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhFYRDy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 13:03:54 -0400
Received: from mail-eopbgr1400131.outbound.protection.outlook.com ([40.107.140.131]:22304
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229697AbhFYRDv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 13:03:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLy/72IP2bPWHuzD0IZ6OV4wk5s3p59WfE9GhLydvycsSJSJy0NTWh2+srnychqtRGkkJHj+nTyfWTt6ljunAuvTHu70gjhOMB2M1pYwBNPiQp4XJNfffzWxT9/Z/mXyU5HgVt2jsXINhHQT7SqGn8YFsGh4fyITO4fNAfQpVdRY+t1aQAjdthr0sBZkcKgSzZF/pR4kDFg60o3dfps6o5npRk6R4oHl68KwmFYys/HNCh8GyUYVkX9NeMIMH4kn6876QgBSR5BvLhvbTeGai3zL4eGy+isTvrTrAD7vGo5kJkoYfWjoMa+y7bUlatYlYni0DFvM8eXNHNGBu7FVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YwT/KrP5JFBRDeNYN4fQI6Ms/A4hw9JXku5s4wPyv8=;
 b=HS92Hatf8z60HjEA8U/iLWFlbYRaDP6MFt7oDEMX52mgnvJwnPFl8LL1WPV7LfAExD8bd81Y+aIdWHlWAbEXIBmaJzEi4mGzHQt6nx/80bGuT1cjeYHEUJex0twF33qVCdXMvUGpkDWS3u1/O5N9eUwH2uVfYHUo5snrKtIYAZMNVyYW0/jPpchNq5ShkpKH/cl89YYZC3WbJ1gD3IJeipZiF402hONNbLaMxUchpxLsKCin8cClLXb4A/IQEqC5Qkd5hdKkoMpvWCX81GEZj9eQuf4KwQuZqxUhuiMuXKWUOXoOgmYovj1rNXbomV/ADZKO2sbqN6lUJ+kBcRIWVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YwT/KrP5JFBRDeNYN4fQI6Ms/A4hw9JXku5s4wPyv8=;
 b=humsRmdbtMntUBX7bvtQeKLG7lKDl0qufQs4gl6Ov67Y38H4NDaPvn6WxUezF3k/v/Wb1sskAdEuNQNVp4//AfeANLIp/Ysfus2j7L3PEBcMvrNDw67A5+XcirI/KubBzzGw0iLrJFrEWC2WnJeL+GN1c0qfonV1Sds3aWPyRJU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB1879.jpnprd01.prod.outlook.com (2603:1096:603:6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 17:01:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 17:01:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 11/11] arm64: dts: renesas: r9a07g044: Add I2C nodes
Thread-Topic: [PATCH v2 11/11] arm64: dts: renesas: r9a07g044: Add I2C nodes
Thread-Index: AQHXaPlKFHTXiffb+UOAONux8/1SP6sk2EyAgAAdBNA=
Date:   Fri, 25 Jun 2021 17:01:27 +0000
Message-ID: <OS0PR01MB5922D900BDFBC251C4F23F5186069@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com>
 <20210624130240.17468-12-biju.das.jz@bp.renesas.com>
 <CAMuHMdUy7_in8HPfwB5MyX4Uh2poUMf6oT7X6w0cOCujUD+a0A@mail.gmail.com>
In-Reply-To: <CAMuHMdUy7_in8HPfwB5MyX4Uh2poUMf6oT7X6w0cOCujUD+a0A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [86.139.26.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 277d3db1-9d0e-4a27-d8ad-08d937fadf29
x-ms-traffictypediagnostic: OSBPR01MB1879:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB1879AD32FE9F9A3F527A347D86069@OSBPR01MB1879.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KLb7GnvuBQUW1gmo1DfK/h10TkeElZ1Ey6/H69xgMoEHYGF/WNi5A232CWWCjya7lwBPRO3V+C9nqBoZVdIaYvFCZeBRFI+N1NzVUi9vGl1nICgYpA/944s70WDmyVOE7BEIqO1usO0+YdqnB5XQoH9uSpNsKHmbs3dOiacDDV2tr8pT59P/OhCrR9whT36rQVuXbFjSNyKAvcVIK76eH+E4v+AvQaOCfZNPWDlqRoXSOj0iDThQqe6/aLuSLt611acOAI4bHTA8PzuajqRNLSipW44u5CeWMnRm2DYNMLoX/oXyNOsKgX9ZNTm3pnooMBiElN3k1gOKkXp494oZ13vISLXBcFPzVsxD9mVY4i8e7ZlY0YhyySfUf52ny2Z8msXl2gO+GVxZm9yXCalaB6dbCeYRODN7ivtY7CrWAeHgIIcum2gFw5tZuf69BdHw3wEgOTkVkheJYPEpEvK+x2K1qYPfbZxsNRiz5LYR0jMIuKJ/yPAHh4vj1BGT2lph92yBeVmcuo8v2qg+aU6by2bHlNSz3vTBmEtCMgFHLB8GWF3IwJPab1yi6t4Nj8QDVhfI4yjKZLP6KKv0WENLV94AemJw+FjmlSPTT2x6JeX/qAKbhAkncDdMmRT0v2j91+vaFGHc8y6IVbvqeNVIiQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(136003)(366004)(346002)(8936002)(83380400001)(4326008)(2906002)(76116006)(122000001)(8676002)(66556008)(66946007)(71200400001)(66476007)(33656002)(64756008)(66446008)(5660300002)(52536014)(86362001)(6916009)(316002)(54906003)(478600001)(9686003)(53546011)(6506007)(26005)(55016002)(186003)(7696005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlVqajdpbWVrZUdESTJZSlV3ZjRkSDBCQnlBbWdxdEVUMFc1VmpOZUpKc01H?=
 =?utf-8?B?eng0V2NINzZhOVRmeWw3OFdYWVZNSXVydmZBbzVsb2FBTWU3ekx1anRUV0t1?=
 =?utf-8?B?MXlmZHVXTXFDUHlUVUZVRTBVUXJCREJ6ei9aeXcrN1Z1ZTJYdXNhV2huOHdz?=
 =?utf-8?B?b05QZkM0NU1zOU04TjJER1ZlbXNGMFFFbytseVorNHNZMmpVY0ErWTlnb2Qv?=
 =?utf-8?B?SGZTODg3SWtSRG04V3BJaitTSFc2enJRWWkvcTl6bkpDSTVySUE1RHA5ZTFm?=
 =?utf-8?B?cHljR2ZvYnVxb2ozTTRhUkZ1VXkrZlhzek1VMU9CaE9jaHI5MFlzVkM2N0FR?=
 =?utf-8?B?ak9yRURHOURuZmFwMnhObWl6VUhkb0RkVi9BemtYWit5VStUY2ZFWjgxYlox?=
 =?utf-8?B?UlJjUVhuMGFpU0dCTWxNaURPSUgwQk9YRFVuZmxNUWJaZ3JnaE02T3lkVVo4?=
 =?utf-8?B?NjdjV3JSaGNmYmxiM1l5THlDbFJ1TVZBK1pzcDArRjhDRmVqeWZJVkptTzdy?=
 =?utf-8?B?eWVBWld2cE9aRkxZczNHbXl2Y09xYmxVYlg1a3ZJV3Z5VDVRaXYyNngydE0z?=
 =?utf-8?B?M1VtSUdQWUpIN1VjczZ3NXZOM3hMMjBvMmhpWUhOS280N2ZrOEdnN2dSRXlB?=
 =?utf-8?B?Yk11VHRIaitCSnlUaGZyaEllZ2x2UmVhZThhc3hTYmFWMlJrdnBuRHlBbXJn?=
 =?utf-8?B?czRqdVNoQTB4V1ZaUTY3MlVKUk44YnpndG42QmRqV0drVjZKcVNRZ3ZKS1dH?=
 =?utf-8?B?eWhVWk9qNldlWTg2SDhOR2FTbjhUQWVweHNKSUZJSklRVTZNRDRLN3JXM2dr?=
 =?utf-8?B?aUxqTC9wVHhtT3dZZ0JNZitzZ01LQ1pXZ2hVTnFkWUpCUWZta0Y5THZxTGkr?=
 =?utf-8?B?T0ZSNG1vaEFZSTB3d0YvNm1GVkYvMmFFcmxmcHphVm5XUlhTcWhoRGZSRCtK?=
 =?utf-8?B?d1ZQTml3MzFSQlRIWUVibWdlM1Z0SDZWTXhiVzN6TkdwWkhmN0x4Z0tSYmZB?=
 =?utf-8?B?ZHNpbkhkdmhoZnBERGl0NFM2Mk9vaFJrTndIREhXc045Yi9tMEJRQ0xuNXk3?=
 =?utf-8?B?N2RoQUpERm1NNmlpNzNkV1BqSzQzaU9OTGkrclc5dUM4d3YwQTdvNCtsRFli?=
 =?utf-8?B?L2o5ZkxHZ3YvRWE3c0FDenVhK3pvVWx5WjZZUkxGRVAvSDNzZm5EcDhWeFVH?=
 =?utf-8?B?dUgzUjUyV0pwQUxyWHVxU25XWWtDUjI5NGJqYllhVDBweHpQWFpsUE5oUVhp?=
 =?utf-8?B?R2hnSFp1cnZxNHlBV3ZFbktmMGFZMGVtVVpUZjR6YzIzVkdUWDc2VzN5STBJ?=
 =?utf-8?B?d1pBK2ovUm5nVXBKQ1VmNGg3NVFDWUZSTTFpQzA3Z3V2RTFtcSt4YURKQXNU?=
 =?utf-8?B?KytuVG11QnArYzVhT2ZUNU1IeFcraEVuNXhvTnIxaWJsc1RlOVNiM0dSb2tU?=
 =?utf-8?B?NjF6OTA4ZHI0Uyt2d2lyNmE4N3RNRlZ0VUlRbDFscFZHQlRGb1RKNmNiYzBB?=
 =?utf-8?B?UUdlWnZ6T2NpbG80cVlCOVlzOFpaQ0E1VElNMDJkNkZUVXF5WkJvMUFMVFNX?=
 =?utf-8?B?b0srQXZFSytQSkpBdjJSNTN3dkVIUWVHMklDZUdWdzIxa0d1WUpnVlc1MUIz?=
 =?utf-8?B?YzRCR3BoZnROU3RCOGFOK0ZvanFOeEt0QmpFZEtDUHZrby9JUHZHSXhiSFZQ?=
 =?utf-8?B?STJQSDBtNHFrZlNuelVQMlBtT1FoTS9iVXErZjgwRXZiMk85WkpWWlFDcTM2?=
 =?utf-8?Q?Gr4ZoWfgdBwpUT38ibCK0t72XTTu6kq2IqCOX33?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277d3db1-9d0e-4a27-d8ad-08d937fadf29
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 17:01:27.3575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DJpN1uVPGfmkmZC3I6nSYvwv6z1yFrM4emIRXbiBif0SwPCJSOwYb14PNzgSfM/QlIxfav9ieYfBj+FEjX/5w92HDow//nbygYzEhKLkpqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1879
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMTEvMTFdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0NDogQWRkIEkyQw0K
PiBub2Rlcw0KPiANCj4gT24gVGh1LCBKdW4gMjQsIDIwMjEgYXQgMzowMyBQTSBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEFkZCBJMkN7MCwxLDIs
M30gbm9kZXMgdG8gUlovRzJMIChSOUEwN0cwNDQpIFNvQyBEVFNJLg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmll
d2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNh
cy5jb20+DQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cw
NDQuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDQu
ZHRzaQ0KPiA+IEBAIC04OSw2ICs4OSw4NiBAQA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiAr
ICAgICAgICAgICAgICAgaTJjMDogaTJjQDEwMDU4MDAwIHsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gInJlbmVzYXMscmlpYy1yOWEwN2cwNDQiLA0KPiAicmVuZXNhcyxyaWljLXJ6IjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDEwMDU4MDAwIDAgMHg0MDA+Ow0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzNTANCj4g
PiArIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiANCj4gVGhlcmUncyBhIGRvdWJsZSBzcGFjZSBh
ZnRlciB0aGUgZmlyc3QgaW50ZXJydXB0IG51bWJlciAoaW4gZWFjaCBpMmMNCj4gbm9kZSkuDQoN
Ck9LLiBXaWxsIGZpeCB0aGlzLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IFdpdGggdGhlIGFi
b3ZlIGZpeGVkOg0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsu
b3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhh
dC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
