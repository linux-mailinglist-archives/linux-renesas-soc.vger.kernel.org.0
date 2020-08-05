Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F43B23CC17
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 18:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbgHEQXk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 12:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbgHEQXZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 12:23:25 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on0709.outbound.protection.outlook.com [IPv6:2a01:111:f400:febd::709])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E152C0086A1;
        Wed,  5 Aug 2020 07:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i62X++8Pfj7MgHIT7kQ27IX6Kg0vCIOQkgLLq0VjjvJZ7TThpYxgNg3XDeL6tnhq7s06SCRddLeM8hkSLksrvm0gvsTc99aUSZ0IO6z5hoW3DJY78roTXbp4GTHSGi+27hyvqf7qTIJBBgJ2iYqS+f/vGWcCarD5v0VG1WsErAjX3Fz07XIKYP0zRTRcLZifcFf3l+BPVUR6c0khNDXGHoEjHeMJfoozQZuffL+Hk4Wnm0pXRoU2vFW1iqo3x9kU71dnuqN2L4XpozSEZ40gwEkrskd98mWG9ondEGeDHggK3mBDueJuHN75R3iyG/4w1fH21j6o4EW+/3l2KPGYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNsbPo8dGrCNzfWKu/DiiJBbM8S1j8elJipJzWqaqhU=;
 b=PD05HuGPEIghgO2unYtct7Yp+c/Dc7OARTqPvzHs3rjJ2s/yHoPgxTHyrLfMPzszXbyRIrd9sh+pJt0xU9VVLXLORvaAtMFnDf2WmmmZGmtuFDBvRjUbhZh1V3lNwyGXlx/YQro8tC+reiI1V0QwATQBnvycn1e8xut2eBfnSb9fSYlB3KHVysHbYxgMROSdLIIL5tH6egPLHbUNaKUsUIM1BDWtFbo3fpsK8pLgX5EfnZB2d0Bp2bnoEwT4WoK5f9lZmTNP5l4s/MFNYkZYESjCnRR9TQfuDKq8hAp7hcAd0LAGZ435kdPVByEz7am/eQ1JVG/1tZAJZPXU6hV9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNsbPo8dGrCNzfWKu/DiiJBbM8S1j8elJipJzWqaqhU=;
 b=G5RIqLJF6tlWI3MYsjhq4YDCyjLEsXXcs+JIAAaqD5GaV7eGHGWujAsoGA2MMCGrKeyNATQZI7W14zHGypfW+uIpDZLD1UV8W5+Ue+FzCXv4sq6UKmWYU73IGjUWKnfwz63ECnShH8CyjDHyj/QOF+zUzcaEwV5jMmx0l5APFCU=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB4539.jpnprd01.prod.outlook.com
 (2603:1096:404:10f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Wed, 5 Aug
 2020 12:16:51 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee%7]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 12:16:51 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] ARM: dts: iwg22d-sodimm: Fix dt nodes sorting
Thread-Topic: [PATCH] ARM: dts: iwg22d-sodimm: Fix dt nodes sorting
Thread-Index: AQHWZaNxlsyctXV4xUagfFl6g9QrN6kpb30AgAAJQtA=
Date:   Wed, 5 Aug 2020 12:16:50 +0000
Message-ID: <TYBPR01MB5309C718941AD10A432EE9DF864B0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200729122602.9561-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXPRsB3N=sfL0VgvAxxHLNCHhotsc501kG9-KMDoYXRJA@mail.gmail.com>
In-Reply-To: <CAMuHMdXPRsB3N=sfL0VgvAxxHLNCHhotsc501kG9-KMDoYXRJA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [31.49.74.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1fda6198-d494-4e99-7912-08d839396efb
x-ms-traffictypediagnostic: TY2PR01MB4539:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB4539D9708FA5ED79A457FB1A864B0@TY2PR01MB4539.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jrTqHrEwekAalUAIzaIWinyIKASiE0v2vqhdjqAkKl+joM3gVgU0BnZCYi5KfhVDmkmzR00vFLovOwIDUFSmGpPe9KOa1LK2qMHhllo3wtcFOz/nxrDXmrbNrWTVLnqg4eCyWzJNNgVOfkgAYOO+CSTzDjD9NwlbeOPa4MAl0MuDWUJv6cN94D1pElJSINprkpoRFu/YwSYqV/j6c8HiNdYSNAjMJdQlHJMv8qgBDkEa/cpEvt5n59bOIcx5Db3RSEn3EoKujsrrPPJ3F1LR7H4uypZhbM0A4Q/MrgYLl8pu/bTfsv8kM7ozHVXu1yTO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(52536014)(478600001)(71200400001)(6506007)(83380400001)(53546011)(186003)(5660300002)(9686003)(2906002)(76116006)(316002)(55016002)(86362001)(7696005)(54906003)(6916009)(26005)(4326008)(8676002)(66476007)(64756008)(66446008)(33656002)(66946007)(66556008)(107886003)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 1DSHAsxqr0ayNNR00fs1H1PfR98Wp9FDj/VwkKtEKJhSjMqmQfAk2cdwOw3Fkw4VIh4qIPfbLVLgyKe7myAvLn+h0qYn6tWbXMTfBxauOsGxdDljcO8F3iWDP1mx5tQKjPztboQ9n7Dvgfx9XWALlI1F9MovWfmf4vVMmB6hfnVKv+KPZwk1y3AZerqImsUk/FtPz8HoKICJrvsaLmV9pG9HaUX0igbGel0o5qR5CkDblFuE7ruSIb0bEiFpyuRlgaHNk9T+MLBJFiHbL3qW/5zw09wdS581Dx7ZujDtjMSLPIEfclfILdI1rA9aPAIgDL8lRYmxg+qnRIXPKpjkgxfEX4UyVXJyaE7Re5Nia6MLp5dXZU5YsxSTgAkusYeaCqBoAs1Jo7k4LEQra8xKeGujtZSE/paDs9neSpPpz2XPMzVlYyaOQCPd2AKAUNfdfHB/Ahp4qJRAXkem6wGSjv76TPaeHU+EgQkI36DKhWLkY8TCtkAYzQLUiINsu3w1Jg3Gl32pEEJ/bHmvIPd8kZbscMdpwasPUBZkt3oGrWAe09nKt4bEZGw+INMTYyC416MS8pP9xgWmgs4rNTSy46AjH5KBh1DTpJwR3VmFzKqeiZ0VFjQDfxDvuTKuetNfTXusQhzILBp+nGNliwvS7A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fda6198-d494-4e99-7912-08d839396efb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2020 12:16:50.7811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qxC1YLtJ292P2HatEc/3RcAaP/kmfcFRM/ws+6fydWUW4A1loFnrUk7Ee3qO93ADRtQrIDbVoUODLTybqrY3fFNVUNyACo78NDJgOkLquaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4539
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gQVJNOiBkdHM6IGl3ZzIyZC1zb2RpbW06IEZpeCBkdCBub2RlcyBzb3J0aW5nDQo+
DQo+IEhpIEJpanUsDQo+DQo+IE9uIFdlZCwgSnVsIDI5LCAyMDIwIGF0IDI6MjYgUE0gQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBTb21lIGRldmlj
ZSBub2RlcyBpbiB0aGUgcjhhNzc0NS1pd2cyMmQtc29kaW1tLmR0cyBhcmUgbm90IHNvcnRlZA0K
PiA+IGFscGhhYmV0aWNhbGx5LiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBzb3J0aW5nIG9mIG5vZGVz
IGFuZCBhbHNvIGZpeGVzIGENCj4gPiB0eXBvIGluIHRoZSBzdG1wZSBub2RlLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPg0K
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+DQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
cjhhNzc0NS1pd2cyMmQtc29kaW1tLmR0cw0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3I4
YTc3NDUtaXdnMjJkLXNvZGltbS5kdHMNCj4gPiBAQCAtNTMsNiArNTMsMjUgQEANCj4gPiAgICAg
ICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDI2MDAwMDAwPjsNCj4gPiAgICAgICAgIH07
DQo+ID4NCj4gPiArICAgICAgIGJhY2tsaWdodF9sY2Q6IGJhY2tsaWdodCB7DQo+ID4gKyAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7DQo+ID4gKyAgICAgICAgICAg
ICAgIHB3bXMgPSA8JnRwdSAzIDUwMDAwMDAgUFdNX1BPTEFSSVRZX0lOVkVSVEVEPjsNCj4gPiAr
ICAgICAgICAgICAgICAgYnJpZ2h0bmVzcy1sZXZlbHMgPSA8MCA0IDggMTYgMzIgNjQgMTI4IDI1
NT47DQo+ID4gKyAgICAgICAgICAgICAgIGRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCA9IDw3PjsN
Cj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgbGNkX3BhbmVsOiBsY2Qgew0KPiA+
ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImVkdCxldG0wNDMwODBkaDZncCI7DQo+ID4g
KyAgICAgICAgICAgICAgIHBvd2VyLXN1cHBseSA9IDwmdmNjcV9wYW5lbD47DQo+ID4gKyAgICAg
ICAgICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0X2xjZD47DQo+ID4gKw0KPiA+ICsgICAg
ICAgICAgICAgICBwb3J0IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBsY2RfaW46IGVu
ZHBvaW50IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRw
b2ludCA9IDwmZHVfb3V0X3JnYjA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07DQo+
ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICB9Ow0KPiA+ICsNCj4gPiAgICAgICAg
IHJzbmRfc2d0bDUwMDA6IHNvdW5kIHsNCj4NCj4gU2hvdWxkbid0IHRoZSBzb3VuZCBub2RlIGJl
IG1vdmVkIGJlbG93IHRoZSByZWd1bGF0b3Igbm9kZXM/DQoNClllcyBJIGFncmVlLiBzb3J0aW5n
IHNob3VsZCBiZSBhcyBwZXIgbm9kZSBuYW1lcywgbm90IGJhc2VkIG9uIHRoZSBsYWJlbHMuIEkg
d2lsbCBzZW5kIFYyLg0KDQpSZWdhcmRzLA0KQmlqdQ0KDQo+ID4gICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAic2ltcGxlLWF1ZGlvLWNhcmQiOw0KPiA+ICAgICAgICAgICAgICAgICBzaW1w
bGUtYXVkaW8tY2FyZCxmb3JtYXQgPSAiaTJzIjsgQEAgLTY4LDE4ICs4Nyw2IEBADQo+ID4gICAg
ICAgICAgICAgICAgIH07DQo+ID4gICAgICAgICB9Ow0KPiA+DQo+ID4gLSAgICAgICB2Y2NxX3Nk
aGkwOiByZWd1bGF0b3ItdmNjcS1zZGhpMCB7DQo+ID4gLSAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAicmVndWxhdG9yLWdwaW8iOw0KPiA+IC0NCj4gPiAtICAgICAgICAgICAgICAgcmVndWxh
dG9yLW5hbWUgPSAiU0RISTAgVmNjUSI7DQo+ID4gLSAgICAgICAgICAgICAgIHJlZ3VsYXRvci1t
aW4tbWljcm92b2x0ID0gPDE4MDAwMDA+Ow0KPiA+IC0gICAgICAgICAgICAgICByZWd1bGF0b3It
bWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsNCj4gPiAtDQo+ID4gLSAgICAgICAgICAgICAgIGdw
aW9zID0gPCZncGlvMCAyMCBHUElPX0FDVElWRV9MT1c+Ow0KPiA+IC0gICAgICAgICAgICAgICBn
cGlvcy1zdGF0ZXMgPSA8MT47DQo+ID4gLSAgICAgICAgICAgICAgIHN0YXRlcyA9IDwzMzAwMDAw
IDE+LCA8MTgwMDAwMCAwPjsNCj4gPiAtICAgICAgIH07DQo+ID4gLQ0KPiA+ICAgICAgICAgdmNj
cV9wYW5lbDogcmVndWxhdG9yLXZjY3EtcGFuZWwgew0KPiA+ICAgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7DQo+ID4gICAgICAgICAgICAgICAgIHJlZ3VsYXRv
ci1uYW1lID0gIlBhbmVsIFZjY1EiOw0KPg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4NCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4NCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4g
bTY4ay5vcmcNCj4NCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMN
Cg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBHbWJILCBHZXNjaGFlZnRzZnVlaHJlci9Q
cmVzaWRlbnQ6IENhcnN0ZW4gSmF1Y2gsIFNpdHogZGVyIEdlc2VsbHNjaGFmdC9SZWdpc3RlcmVk
IG9mZmljZTogRHVlc3NlbGRvcmYsIEFyY2FkaWFzdHJhc3NlIDEwLCA0MDQ3MiBEdWVzc2VsZG9y
ZiwgR2VybWFueSwgSGFuZGVsc3JlZ2lzdGVyL0NvbW1lcmNpYWwgUmVnaXN0ZXI6IER1ZXNzZWxk
b3JmLCBIUkIgMzcwOCBVU3QtSUROci4vVGF4IGlkZW50aWZpY2F0aW9uIG5vLjogREUgMTE5MzUz
NDA2IFdFRUUtUmVnLi1Oci4vV0VFRSByZWcuIG5vLjogREUgMTQ5Nzg2NDcNCg==
