Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F73A3B195B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 13:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhFWLzR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 07:55:17 -0400
Received: from mail-eopbgr1410115.outbound.protection.outlook.com ([40.107.141.115]:56960
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230239AbhFWLzQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 07:55:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYimY8roOTG1kkw0/4QZl7lNCBxYUf6BgqExuO0F6pAm/lmCMcFxDo01FVH+RzOaKIFCOaej++fZU4gmxxvHnmJGs9QDvSetATsJdXfs/BAZyKS9qoVwPpf8/Hx50u1A4mO+WKcqjLPbsRC6dm/x3rQQifAMiTTS6Uy9sgEYVAUV8IltKQZaEI47RgP2zjX9cgo0TShZ4jTeU8u1GexonOUoitSuFadzU6sIJ99ZUvnnYOAdLfX0yGEBv+8biZ7UBfSQw1EYGGdrde6RlQ1ZeTfUl/lCU5Ai/YOoq67lhAZNFyMuLefco0cC+Wtr7liwnjoPdTqKNWEJ1Jj1BL03CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqzJOFvQvf2FmGYJWbtw2njsTL9lxSWkZ6OmPT0/iT4=;
 b=XAl6ue4txRP0/0FAiGJWtPqPuKiWE1kvVDqTM41tEedEkAcxGDrLFdE79WAFwcDP67wslaeRkEgxgSuGBbsSNAWvojmWiRYWdkdKVPwN6xRQXvZ6rrsibFFXIZkogLf2AdhPcL2pe18YarJGl3QounP351MG1oxfVZJG/7Efeq4RVggJIDklcEhYycYVNXxUcPmGVrpkzo/QxCoFIkiyRh3Ny7d8k0Fe+GvIzlm0LMmeGryVk9qE372Py+QKkoaP6+2A+8JZS+f7E0lwmKDnQLj5sM7LlGQ2J8bM84B3WiEbjZsifX4TV0pGCNU1qBxFBfvvx8X58nkZa/h/72OL0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqzJOFvQvf2FmGYJWbtw2njsTL9lxSWkZ6OmPT0/iT4=;
 b=YWtMYxjdiMlEIwKsgQDOHAhQ73yYcNTPp8BdVTcgIy63+Qi2bNBHgaSjpXeivx0VwrxHcNaVKJZmWLpfVH5vhVC+ukdu6DVOD5Jhtmf+q5xBbc66pU1TCCaJLqWRB14cttuTnKShnr0be/PntNK6m/P0ymPdSKuXVxHqOtWuKQ4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB5223.jpnprd01.prod.outlook.com (2603:1096:604:7f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 11:52:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 11:52:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 10/11] phy: renesas: phy-rcar-gen3-usb2: Add OTG
 support for RZ/G2L
Thread-Topic: [PATCH v2 10/11] phy: renesas: phy-rcar-gen3-usb2: Add OTG
 support for RZ/G2L
Thread-Index: AQHXZoFznG1LvyJquEaSi6z7En8La6sgKbSAgAFUhCA=
Date:   Wed, 23 Jun 2021 11:52:56 +0000
Message-ID: <OS0PR01MB5922D9DE382FCA4398C420E286089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdVHFaM+SAEBLyV0HOoFLpZgJ5PrJXx4vxQ8fsaopEAm9g@mail.gmail.com>
In-Reply-To: <CAMuHMdVHFaM+SAEBLyV0HOoFLpZgJ5PrJXx4vxQ8fsaopEAm9g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [86.139.26.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24d02c2e-6f73-4da2-11e7-08d9363d70ef
x-ms-traffictypediagnostic: OSBPR01MB5223:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB52238321DEF0E8B1C298C80686089@OSBPR01MB5223.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iOWYOFja5oj3/8MJhjMnudUQzV7aScvdYSvLAe8YIMQuPvyFkrU2Jx/SHEygCR8C9CUws3dbWtGv86BQWKBljOjLKPeL7y6/lU7zi3sY9ryPryRkfShyu6tkZg0gp4OPpiVNs62a5R22e7m74IHlK34o4AXYY4a7J2p7MExEx4Hkr+rKQRVnq+UQT0iE4nWIgN171XUQNYvwO8/Hm+v0tIBN/bfJxhX9l1H+PzyytQfMj0nBXzsAYZlEBDhgee2RLHzjwS8Jm3k+4GgVdMapUTyvC+VRuLTpuf1Ix2Rhx8g6YHN8ZdoPLyqA+iIOAz1UgrP5tefiaVERjYvC9bd3Y2lToj30yUcKiwFCaVUlx7oiW7iSEiQCTZSaI0qU2yfoZoDQamfF1AwMX5DbsJ61iK5OcWXM0z3FJ8r9qy48At/Ifdctc+wCGawbOoLkW7YRUDFN1Jdv69SntV1NFMkMgMjSIqfLSTIgKA9/5V+LfwiTR3KXyf1Tn0WURCRiPiMXx58SfLdZjmXd2uGu3u7IuWS1wkJXD41boj0nTJiAzp1nn6kR2F6F/3IWD8HhUxrZxWePsILqul6J5bCiEPWBun8DBqf7JijaPw4NCqmmlNduk/RDLQ1z1ERlVSaoO8Xu1mwWxBolWb+3ytck8YBlUg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(54906003)(66446008)(64756008)(478600001)(71200400001)(9686003)(83380400001)(7696005)(33656002)(5660300002)(55016002)(52536014)(66946007)(38100700002)(122000001)(186003)(107886003)(66556008)(26005)(53546011)(8936002)(316002)(2906002)(76116006)(6916009)(8676002)(6506007)(4326008)(66476007)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVZKSHc5dW1rbTQvRnJPb3dlMWREanNVcDJ0KzJpckhZYTFkelFVTUVydng3?=
 =?utf-8?B?ZXhmUHVqMVhOSko4VHoraHR2cWdsTS9YWUZ5U1dMZE5wa2FCWFFPelUyUVlp?=
 =?utf-8?B?L2FqVHZrRjMwd096KzNIRk9vWnlEeU1iNzdZNEg4bUJrYUIvdVRwZE1ZdGtP?=
 =?utf-8?B?WFJhUW5zUWsrKzIraXhwS3dBbENqdGJwYzR6NlNhakQ1dC81ZGNvS3o5SDhP?=
 =?utf-8?B?a2ZVLzdUQU9pQkpYRjVSb243S2ZpV2xUNjRRMjU2R3I3aGd3MmRnSFBXTS9W?=
 =?utf-8?B?U2FsY0dNOHdlMVA0dWJMSHd5akFLY0FHWnFPOXBxamlRRmE0WGNCVkY0YWVP?=
 =?utf-8?B?Q2FSYU5WdVo2cWlMc1lxem9ZU21Qd0hoV01HbUIzRXhUQ3dRZkR4aC9RZUFv?=
 =?utf-8?B?QzExUGlNc0tUclEvNFpqbWZETElzQUJ1L01rbEhlVEhQWHhvajB1TERCS3VF?=
 =?utf-8?B?NmNFdW1Ba3VmekRjbGtjc0I2Q09kT2o3VHV5N2xjM3B5VGl0TVNJVEF2cVpB?=
 =?utf-8?B?ZnIvcU85R2pUc1lCUi9VREgrbUxVMVBMcUJWbmM5Z05tNHJXZENJQTFWaStp?=
 =?utf-8?B?MG96Q1dhOTBpNkZMa3VYZlNCSlhLck02YUtUdE80MDlFMXA0ODZlaXhNOE9k?=
 =?utf-8?B?c214R0dNYWRYaHJEU2EwVnVidithS284WGRNUFhacXI0QkJWaG50N0dMTm5U?=
 =?utf-8?B?ODZJVXI1Ujg2TjZRUmFnUkFrMVFFNGhnVys4VjUzZExzMm1qN1hCQW81K21m?=
 =?utf-8?B?c3h3SUxkOXBBcmFXU0k2bUZrS0dzRG95OVlIOStzeEI4RFF0a3c0QkxpNjdn?=
 =?utf-8?B?R2NmQ0ZJbVgvOFV6LzU5bW4wTDdZS0lDeFlZOXhFSU5iejgyeitRQjBKK3ZW?=
 =?utf-8?B?SU56SGdOMmFJODA1NER5WVpGOUxqeDJlLzFPVm5qWHdUUkR5VTdHQ0lEMDN3?=
 =?utf-8?B?bk05TlNMa0hyQjBxdUsrM29HTFUzb2xaZ3BTTzdkc2ZtbDkxUXlvVUMxanJr?=
 =?utf-8?B?N25LN0RCdWpDdkg5UzU4YjFsWHZMZGNld0dDRmlseFl4VmdMUkkwTzVBem5Y?=
 =?utf-8?B?cTFuTFNIWTJoSTFyclN1U1MrY1NIQXhNTGtNeDFHTDZqOU5BRkNiL2gzdFBH?=
 =?utf-8?B?SEVBbXU4RmFCcEhsV0hEQVVKWW5lSjdtQTl3Um9qOXVVbDRESENEZ2JwVTRL?=
 =?utf-8?B?dXV4QkxnaERIQk51SE9VNTJYeXpWQ1VoMnpkZlNzdTFRZ0dlYVYxUlJGdldJ?=
 =?utf-8?B?dWlZbmN4eHhNdjJPbmFnS1pCclF1WTJwTzNXWkl3cGNRdVZONGk3VEp5Ulhy?=
 =?utf-8?B?NldPc2JKQUV4SjhKN0o0M0Rjc1ZSdTdsYVphVlI5V05mRk0zUC9SS3M1OGRx?=
 =?utf-8?B?Q0dEcVhTZmRCcytNZnFHczZvdlpDK3JBbjl6bldNZXB1Z3pjcjFrb1hRbVMz?=
 =?utf-8?B?ZlQxRTBxdFcvRVFMQ1owOEpGRDNEdVY2RlBWOWNFTWE2Z25ZS0grYmZLaXlz?=
 =?utf-8?B?dys4L1JVaW4zUjNzQ0E5L2NBcUhnMTlKS3NSSkdmcXdFcTlwejZ4bXZ1a0tm?=
 =?utf-8?B?VC8zVmFRY1RpenJQa2tZQWNORzNwTkY0Zi9yak9ja2xYeFE3MDczVzZkY2ZV?=
 =?utf-8?B?QWFPN2llM1NNZXRxQ0l4dnNKM2Zjb1ZyU2lUL1R3M3dEb0dNWlllWS80Qjhn?=
 =?utf-8?B?cElMWEhMM01paVFicTRMTjdSS09INGUybGlOU3ZSNDVtbWttYkVjVUdtUW9t?=
 =?utf-8?Q?j9Xfr2xgi0fKI+xHjQVUGGuQ+inoVA8VwgiEZBG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d02c2e-6f73-4da2-11e7-08d9363d70ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 11:52:56.3414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rhklQY8T/AyVNgUGYQbpKcGMdOUb4TZ7LO+YhSGYS3TjvwCJ4p0rUPo38vG9LteYYzlzVQP7nQRthsWduKFI9ZVADG8ZP8X/GBjOAl6C/sY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5223
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMTAvMTFdIHBoeTogcmVuZXNhczogcGh5LXJjYXItZ2VuMy11c2IyOiBBZGQgT1RH
DQo+IHN1cHBvcnQgZm9yIFJaL0cyTA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rcyBmb3Ig
eW91ciBwYXRjaCENCj4gDQo+IE9uIE1vbiwgSnVuIDIxLCAyMDIxIGF0IDExOjQwIEFNIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gVGhpcyBwYXRj
aCBhZGRzIE9URyBzdXBwb3J0IGZvciBSWi9HMkwgU29DLg0KPiA+DQo+ID4gUlovRzJMIFVTQjIu
MCBwaHkgaXMgY29tcGF0aWJsZSB3aXRoIHJjYXIgZ2VuMywgYnV0IGl0IHVzZXMgbGluZSBjdHJs
DQo+ID4gcmVnaXN0ZXIgZm9yIE9UR19JRCBwaW4gY2hhbmdlcy4gQXBhcnQgZnJvbSB0aGlzIGl0
IHVzZXMgYSBkaWZmZXJlbnQNCj4gPiBPVEctQkMgaW50ZXJydXB0IGJpdCBmb3IgZGV2aWNlIHJl
Y29nbml0aW9uLg0KPiANCj4gU28gaXQgaXMgbm90IGNvbXBhdGlibGU/IDstKQ0KDQpPSy4gQmFz
aWNhbGx5IEkgbWVhbnQgd2UgbmVlZCBzb21lIG1vZGlmaWNhdGlvbiBpbiBkcml2ZXIgdG8gc3Vw
cG9ydCB0aGlzIFNvQy4NCg0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1y
Y2FyLWdlbjMtdXNiMi5jDQo+ID4gKysrIGIvZHJpdmVycy9waHkvcmVuZXNhcy9waHktcmNhci1n
ZW4zLXVzYjIuYw0KPiA+IEBAIC01MzUsNiArNTU1LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cGh5X29wcyByel9nMWNfcGh5X3VzYjJfb3BzID0gew0KPiA+ICAgICAgICAgLm93bmVyICAgICAg
ICAgID0gVEhJU19NT0RVTEUsDQo+ID4gIH07DQo+ID4NCj4gPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBzb2NfZGV2aWNlX2F0dHJpYnV0ZSBzb2Nfbm9fYWRwX2N0cmxbXSA9IHsNCj4gPiArICAgICAg
IHsgLnNvY19pZCA9ICJyOWEwN2cwNDQiLCAuZGF0YSA9ICh2b2lkICopdHJ1ZSB9LA0KPiA+ICsg
ICAgICAgeyAvKiBTZW50aW5lbCAqLyB9DQo+ID4gK307DQo+ID4gKw0KPiA+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCByY2FyX2dlbjNfcGh5X3VzYjJfbWF0Y2hfdGFibGVbXSA9
IHsNCj4gPiAgICAgICAgIHsNCj4gPiAgICAgICAgICAgICAgICAgLmNvbXBhdGlibGUgPSAicmVu
ZXNhcyx1c2IyLXBoeS1yOGE3NzQ3MCIsIEBAIC02MTMsNg0KPiA+ICs2MzgsNyBAQCBzdGF0aWMg
aW50IHJjYXJfZ2VuM19waHlfdXNiMl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpw
ZGV2KQ0KPiA+ICAgICAgICAgc3RydWN0IHBoeV9wcm92aWRlciAqcHJvdmlkZXI7DQo+ID4gICAg
ICAgICBjb25zdCBzdHJ1Y3QgcGh5X29wcyAqcGh5X3VzYjJfb3BzOw0KPiA+ICAgICAgICAgaW50
IHJldCA9IDAsIGk7DQo+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3Qgc29jX2RldmljZV9hdHRyaWJ1
dGUgKmF0dHI7DQo+ID4NCj4gPiAgICAgICAgIGlmICghZGV2LT5vZl9ub2RlKSB7DQo+ID4gICAg
ICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiVGhpcyBkcml2ZXIgbmVlZHMgZGV2aWNlIHRyZWVc
biIpOyBAQA0KPiA+IC02MjcsNiArNjUzLDcgQEAgc3RhdGljIGludCByY2FyX2dlbjNfcGh5X3Vz
YjJfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICAgIGlm
IChJU19FUlIoY2hhbm5lbC0+YmFzZSkpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBQVFJf
RVJSKGNoYW5uZWwtPmJhc2UpOw0KPiA+DQo+ID4gKyAgICAgICBjaGFubmVsLT5vYmludF9lbmFi
bGVfYml0cyA9IFVTQjJfT0JJTlRfU0VTU1ZMRENIRyB8DQo+ID4gKyBVU0IyX09CSU5UX0lERElH
Q0hHOw0KPiA+ICAgICAgICAgLyogZ2V0IGlycSBudW1iZXIgaGVyZSBhbmQgcmVxdWVzdF9pcnEg
Zm9yIE9URyBpbiBwaHlfaW5pdCAqLw0KPiA+ICAgICAgICAgY2hhbm5lbC0+aXJxID0gcGxhdGZv
cm1fZ2V0X2lycV9vcHRpb25hbChwZGV2LCAwKTsNCj4gPiAgICAgICAgIGNoYW5uZWwtPmRyX21v
ZGUgPSByY2FyX2dlbjNfZ2V0X2RyX21vZGUoZGV2LT5vZl9ub2RlKTsNCj4gPiBAQCAtNjM0LDYg
KzY2MSwxMiBAQCBzdGF0aWMgaW50IHJjYXJfZ2VuM19waHlfdXNiMl9wcm9iZShzdHJ1Y3QNCj4g
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgICAgICAgICAgICBpbnQgcmV0Ow0KPiA+
DQo+ID4gICAgICAgICAgICAgICAgIGNoYW5uZWwtPmlzX290Z19jaGFubmVsID0gdHJ1ZTsNCj4g
PiArICAgICAgICAgICAgICAgYXR0ciA9IHNvY19kZXZpY2VfbWF0Y2goc29jX25vX2FkcF9jdHJs
KTsNCj4gPiArICAgICAgICAgICAgICAgaWYgKGF0dHIpIHsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBjaGFubmVsLT5zb2Nfbm9fYWRwX2N0cmwgPSBhdHRyLT5kYXRhOw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNoYW5uZWwtPm9iaW50X2VuYWJsZV9iaXRzID0NCj4gVVNCMl9P
QklOVF9JRENIR19FTjsNCj4gPiArICAgICAgICAgICAgICAgfQ0KPiANCj4gUGxlYXNlIGRvbid0
IGFidXNlIHNvY19kZXZpY2VfbWF0Y2goKSBmb3IgbWF0Y2hpbmcgd2l0aCBhIGRpZmZlcmVudA0K
PiB2YXJpYW50IHRoYXQgdXNlcyBhIGRpZmZlcmVudCBjb21wYXRpYmxlIHZhbHVlLiAgSnVzdCBh
ZGQgYW4gZW50cnkgdG8NCj4gcmNhcl9nZW4zX3BoeV91c2IyX21hdGNoX3RhYmxlW10gaW5zdGVh
ZC4NCg0KDQpPSy4NCj4gSSBkb24ndCBrbm93IGlmIHlvdSBjYW4gaGFuZGxlIFJaL0cyTCBqdXN0
IHVzaW5nIGEgZGlmZmVyZW50IHBoeV9vcHMsIG9yDQo+IG5lZWQgdG8gZXh0ZW5kIHJjYXJfZ2Vu
M19waHlfdXNiMl9tYXRjaF90YWJsZVtdLmRhdGEuDQoNCldpbGwgdHJ5IHRvIGV4dGVuZCByY2Fy
X2dlbjNfcGh5X3VzYjJfbWF0Y2hfdGFibGVbXS5kYXRhIGFzIFNoaW1vZGEtc2FuIHN1Z2dlc3Rl
ZC4NCg0KUmVnYXJkcywNCkJpanUNCg0KDQo+IA0KPiA+ICsNCj4gPiAgICAgICAgICAgICAgICAg
Y2hhbm5lbC0+dXNlc19vdGdfcGlucyA9ICFvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LQ0KPiA+
b2Zfbm9kZSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJyZW5lc2FzLG5vLW90Zy0NCj4gcGlucyIpOw0KPiA+ICAgICAgICAgICAg
ICAgICBjaGFubmVsLT5leHRjb24gPSBkZXZtX2V4dGNvbl9kZXZfYWxsb2NhdGUoZGV2LA0KPiAN
Cj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
