Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88F13B145E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 09:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhFWHG4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 03:06:56 -0400
Received: from mail-eopbgr1410111.outbound.protection.outlook.com ([40.107.141.111]:6669
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229994AbhFWHGz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 03:06:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igtqMoKoelC25v4FGKklFAL0/IiE9TmROccAyvE4rPoKlHHE7JC2vU3eE+7K2SJBmN3ioOgnePB53AkepvLFGLGj8Z5z9pyAkApblI1CPf0rO79ZyLbKCtudpdbuToLin4TDYkDYQr5V8k1sFUo7alTbm5CdYYQonezoo+ju9ZgRHzk6Hdf1dRdztjsApY6TgBGslJH7LzHHgnt2+O0oBBF9W3ER52hG3pNU+KoJa6qCPbUZipH9J6+gS6f/mnFLacN6ESwKZfoB+sGeSG1F32+9YAlOGWQ1tMBacxE5teqo1k1Gm/bK2geWNpZfL3S0tHYx+5JdI9KdGRr7WCjNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7OEjGvvHbslFc7p/Z62UwOReGGjKh8bwBeTMc0+eTQ=;
 b=YbxaOuAe7YBnpT3SzZbsm8djMZoIfG6jcsrY6ZlfWkKS8uP+slz6scQfvYaHe4Qtwhbd9ccEUbmYIdbLhTPEplc320BhZ/oa96/YC6hji9OXo03rHDrxqrU6M7c8qZFSMvA9vVwbpSD7mKHd4kiHR4K2Fu1f0PAC9S/Ix4OBEyqV02Umm2P3Ni589gZyrL6xwcASjq+DJOVkR2NQzr/e8v1qTTRWcKqvMyZPFJ/7Dfbh62Zmxoi6QKnMz6dgo7dZKEd2yMw/YGY8ZWS2P06jenhJCGQMpfXQQ7AMDC4QELCI/5ztNZVI44D8npfnw/NB9CMYstHuc7FrLQ1MIKGgcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7OEjGvvHbslFc7p/Z62UwOReGGjKh8bwBeTMc0+eTQ=;
 b=m1P8aS1TNxaFt58DCfXvsWNS1Yc6F7zwBYp/zpt2q/UFqzeAjHWAnOUikD2EgtD7/tYiv+knkt2AxN3Kx6o3fNb739fNk1RQ4TirwwXAzcIUS0jhNyLwNWgiMDTLhbXrk5BEDiYz9SgH7d4JuFuvbmdmOpAPX3H/7zkG3oAJkT8=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6575.jpnprd01.prod.outlook.com (2603:1096:400:ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 07:04:36 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 07:04:36 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
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
Thread-Index: AQHXZoFzMLd0tBacEkKq+oksmDKkQqsgKbSAgAEDn2A=
Date:   Wed, 23 Jun 2021 07:04:36 +0000
Message-ID: <TY2PR01MB3692392A52EE1D2A7BC6120BD8089@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdVHFaM+SAEBLyV0HOoFLpZgJ5PrJXx4vxQ8fsaopEAm9g@mail.gmail.com>
In-Reply-To: <CAMuHMdVHFaM+SAEBLyV0HOoFLpZgJ5PrJXx4vxQ8fsaopEAm9g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7763b197-8015-4108-130f-08d936152975
x-ms-traffictypediagnostic: TYCPR01MB6575:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYCPR01MB6575DD02D48FC126436FAE54D8089@TYCPR01MB6575.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hP9f34rsO3AxVH2dL1zrdfwkSObRhHSekggmlR18w64osdhx0OzyVjWHf1KiyvHKSSkZeyAxYczjuFauO56XZlYZTyZj8Jk9HegPvzslR5CJ1f8EeFVs+9ay2yYOkdiakYCH3WhF3iRi3fRP2fxyJVO51TiFxU2imQWLNme/BgHkEiOFgCuCEUXKAtqf5Ets4GUHuIsuv8e/B4r6cR5NhUuDuvIF2cuElaVIHCN5RkjG/lWTR/PJpo8gR6TQbzjtN/iidvGOPOuEbY2ad1m4uoy+LsKP0subJ9iGAP9Z92saQ0KsWqkzSbyclklT5fhQB68ceG3paAAk7nOHJcHlDLoGkRRdYy9itDM3+/XIKL4XxV/bXrq8GL5z1Ls0+ppLWBeXS3i5S8cLliiItyevFT2L0TwHmCcaGJqtov0p5b6oXH2vnC9jC+qYhHhSlqgYKYskk99bIXFJnj5OwN0PmKVyXWfk/cku3I6kUW78l3HLfaFMSjI54/6bZqunkf/STMxCQSLOkA2SxWNQMK5vD08F0E9mLAWx194FnLWxhVBjZvZXsI2B7WD7Tbd7yIVASw+Gc3p6VrFQQoNBvItnnSEaP93/WbNRuRoF0eFvwZI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(8936002)(83380400001)(8676002)(478600001)(54906003)(2906002)(38100700002)(26005)(122000001)(86362001)(110136005)(316002)(53546011)(66556008)(6506007)(33656002)(186003)(5660300002)(55236004)(7696005)(66946007)(76116006)(52536014)(66446008)(4326008)(107886003)(71200400001)(9686003)(55016002)(66476007)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXAzdUU2eHYvbk1jQXRta1ZCWTMvcXJRRnFGY0locmFkcnVYS3NDcUlrVHVh?=
 =?utf-8?B?Y2w5ckhlR2NVSVRwQk43R3lYRWFjdW1pdlBWMHhJN05iZWRWOEdOWnVPM2lr?=
 =?utf-8?B?dmdHYTdJZHhYSFdyZ3NMTzYvYzFwR0pzaVZqUFdaa3ZlcFdvNUNTeUVjc2pq?=
 =?utf-8?B?eFhvSk8rWFlxRWQzT254R3ZNdERQQXJmL1ZXL2VTbTIzeDExdmt1cE1FMUtt?=
 =?utf-8?B?M0toMmRFdCtaZXdNODA2enZZYXBFeHJQQ3BTa0hNTng4a0lMTE9ueW1SVEdC?=
 =?utf-8?B?eVZxV2RHVERTYlVHZis1YWtzSlNscnlweEZOZHQ1OXpueFowd3BHNVQvaFJi?=
 =?utf-8?B?azluNXFvTG5xTEdZZGRjNmNYdGp3VjV0Y0xud0VwNFVGRHl0Zm1SS29jb3pD?=
 =?utf-8?B?YlBRbGJJeDJVSVdBRnp2OWZPdDllWFc2V3F2MmZBSS93d3lNcHNaNFF0Slkz?=
 =?utf-8?B?QUhWNzYrMkVsKzFzR2NQRnY2Zks2MjhwRnk5Tm9pS25SV1JtTjluRDY2b2Y5?=
 =?utf-8?B?Rk1PWEs5aENzSVBsbjZEc1lCVUx1SWs4d0JoNm1ITDErTC9CKzdQM3gyNit3?=
 =?utf-8?B?RjBLaU45bVVpUlp0bUxGMVd2dzM0bGRYYWJmSWNGTGRldzF6YlBnaTFiRGFC?=
 =?utf-8?B?WGh6ME9SSTZlTk9rNWw2YkZ4WUZUNFZseXdrbXRzaXEwUGNQc0NjNFBtTktS?=
 =?utf-8?B?K3lGWndlMGxFY1dMVjhHMXR2ZEZWdVdGVWxjN0UycUtRRHBOK1pORlVVTE5p?=
 =?utf-8?B?Tjc1elMxMFJKbS9MaVR4VEJpWG5KTFVSRHoxZnEzdGNoYmJGREVKTmNZdkhu?=
 =?utf-8?B?dkpKYnlkb054OXIrN3dMZFlheUh3NEk1MEtaM3MvRXlSVGFLSENxbm1MNkNT?=
 =?utf-8?B?UnR0SUE5Zk5hQTVEYnBRcEFnZzByS2djM1lJOXNZQnFHSkNtaEN0MHl1YUlr?=
 =?utf-8?B?NHcrUHdEVjhqTVh5OGZhR0IrUU50cllkNlhFMEMrdThuZE5kQ0YxZ29sdlJZ?=
 =?utf-8?B?MGJnMENMTno1a2Q5QmJnVWx1cDRKV21KTlArQ0lHMGlpTnprRUd1NGNTdFRJ?=
 =?utf-8?B?NXViMjBxVTc0UnBPZXIwRERmUjU0NEw2T1d5VGJsYXRRY3d4WFdLUFFYSnFN?=
 =?utf-8?B?bFB2TzRoTDdiNVg2bG1ZdjdJY1J5QVVZMHVjTjhXN3dMUE5PRUpDaSs4NWVI?=
 =?utf-8?B?ak83YkdkUHFqNlVnRU51MkFFQ3VPU0s0RmhFR1dKSmgxNFQwWmdaUktQZkZY?=
 =?utf-8?B?T3h2dU83aCtrRzU3OGZ0ZTVEM0ZNRWdKNjl1d0JSc2ZwUTY1YXVCTFh0L1Iv?=
 =?utf-8?B?OUNHQmthd2pMd0JOTysxanVhWWw2NjJXTnphS21CN3M0U01jVzdFQzJtYnRI?=
 =?utf-8?B?dGp0MGRxU05RMHZjZnZFb1NBR2JBbHdUTERwWHVod054d2YyelRMdjE4Zkhi?=
 =?utf-8?B?NitvSjRCbDRFQnRaTU5BRU5GNkFETDVDWlRKaFZKWEpSbnI2M1hKVS9lNmVq?=
 =?utf-8?B?ZFZ1a0FMMWRQblZEUm5OZlFxUmdxQWZ0RitBUStHdkxwQXQyVEVHSzBzandl?=
 =?utf-8?B?UGYrRGhVb3k4YUd0eDNXcXlTdVVQbEVmUU0zS1IvcW1RV3AzQVFQMHVJQURJ?=
 =?utf-8?B?VDFYS3BSKy9sazdEbHpMcXRmUXhxcmdWMTZyNldSRThUd2Y1dVhNN3Y3Z2tm?=
 =?utf-8?B?RjQyVlhHeXJPMEw1QmhhUmxaaGZFSjdMZWVEKzBJOEN0YitJV2tKUGFGeThH?=
 =?utf-8?Q?Wl5Bhc6QLEX0f1n/w6w4H9SEKDAoPRsjQyb3mPU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7763b197-8015-4108-130f-08d936152975
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 07:04:36.5448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UCXSdBMGdlmN9nvhWBLodvLMRUMKZvz4RYBHaTemU/8uiMiJs7TsLrH4tDXOVBmGWLyd9yg6bZyhZHNYHgl9uw4dD0tn6jNKjfjiWIt47WJ6Vu8B9VyQZb6I1vptDtd4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6575
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQmlqdS1zYW4sIEdlZXJ0LXNhbiwNCg0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4sIFNl
bnQ6IFdlZG5lc2RheSwgSnVuZSAyMywgMjAyMSAxMjoyOSBBTQ0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+IE9uIE1vbiwgSnVuIDIxLCAyMDIxIGF0
IDExOjQwIEFNIEJpanUgRGFzIHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBPVEcgc3VwcG9y
dCBmb3IgUlovRzJMIFNvQy4NCj4gPg0KPiA+IFJaL0cyTCBVU0IyLjAgcGh5IGlzIGNvbXBhdGli
bGUgd2l0aCByY2FyIGdlbjMsIGJ1dCBpdCB1c2VzDQo+ID4gbGluZSBjdHJsIHJlZ2lzdGVyIGZv
ciBPVEdfSUQgcGluIGNoYW5nZXMuIEFwYXJ0IGZyb20gdGhpcw0KPiA+IGl0IHVzZXMgYSBkaWZm
ZXJlbnQgT1RHLUJDIGludGVycnVwdCBiaXQgZm9yIGRldmljZSByZWNvZ25pdGlvbi4NCj4gDQo+
IFNvIGl0IGlzIG5vdCBjb21wYXRpYmxlPyA7LSkNCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9waHkv
cmVuZXNhcy9waHktcmNhci1nZW4zLXVzYjIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGh5L3JlbmVz
YXMvcGh5LXJjYXItZ2VuMy11c2IyLmMNCj4gPiBAQCAtNTM1LDYgKzU1NSwxMSBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHBoeV9vcHMgcnpfZzFjX3BoeV91c2IyX29wcyA9IHsNCj4gPiAgICAgICAg
IC5vd25lciAgICAgICAgICA9IFRISVNfTU9EVUxFLA0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qgc29jX2RldmljZV9hdHRyaWJ1dGUgc29jX25vX2FkcF9jdHJsW10gPSB7
DQo+ID4gKyAgICAgICB7IC5zb2NfaWQgPSAicjlhMDdnMDQ0IiwgLmRhdGEgPSAodm9pZCAqKXRy
dWUgfSwNCj4gPiArICAgICAgIHsgLyogU2VudGluZWwgKi8gfQ0KPiA+ICt9Ow0KPiA+ICsNCj4g
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcmNhcl9nZW4zX3BoeV91c2IyX21h
dGNoX3RhYmxlW10gPSB7DQo+ID4gICAgICAgICB7DQo+ID4gICAgICAgICAgICAgICAgIC5jb21w
YXRpYmxlID0gInJlbmVzYXMsdXNiMi1waHktcjhhNzc0NzAiLA0KPiA+IEBAIC02MTMsNiArNjM4
LDcgQEAgc3RhdGljIGludCByY2FyX2dlbjNfcGh5X3VzYjJfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gPiAgICAgICAgIHN0cnVjdCBwaHlfcHJvdmlkZXIgKnByb3ZpZGVy
Ow0KPiA+ICAgICAgICAgY29uc3Qgc3RydWN0IHBoeV9vcHMgKnBoeV91c2IyX29wczsNCj4gPiAg
ICAgICAgIGludCByZXQgPSAwLCBpOw0KPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IHNvY19kZXZp
Y2VfYXR0cmlidXRlICphdHRyOw0KPiA+DQo+ID4gICAgICAgICBpZiAoIWRldi0+b2Zfbm9kZSkg
ew0KPiA+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIlRoaXMgZHJpdmVyIG5lZWRzIGRl
dmljZSB0cmVlXG4iKTsNCj4gPiBAQCAtNjI3LDYgKzY1Myw3IEBAIHN0YXRpYyBpbnQgcmNhcl9n
ZW4zX3BoeV91c2IyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAg
ICAgICBpZiAoSVNfRVJSKGNoYW5uZWwtPmJhc2UpKQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1
cm4gUFRSX0VSUihjaGFubmVsLT5iYXNlKTsNCj4gPg0KPiA+ICsgICAgICAgY2hhbm5lbC0+b2Jp
bnRfZW5hYmxlX2JpdHMgPSBVU0IyX09CSU5UX1NFU1NWTERDSEcgfCBVU0IyX09CSU5UX0lERElH
Q0hHOw0KPiA+ICAgICAgICAgLyogZ2V0IGlycSBudW1iZXIgaGVyZSBhbmQgcmVxdWVzdF9pcnEg
Zm9yIE9URyBpbiBwaHlfaW5pdCAqLw0KPiA+ICAgICAgICAgY2hhbm5lbC0+aXJxID0gcGxhdGZv
cm1fZ2V0X2lycV9vcHRpb25hbChwZGV2LCAwKTsNCj4gPiAgICAgICAgIGNoYW5uZWwtPmRyX21v
ZGUgPSByY2FyX2dlbjNfZ2V0X2RyX21vZGUoZGV2LT5vZl9ub2RlKTsNCj4gPiBAQCAtNjM0LDYg
KzY2MSwxMiBAQCBzdGF0aWMgaW50IHJjYXJfZ2VuM19waHlfdXNiMl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgICAgICAgICAgICBpbnQgcmV0Ow0KPiA+DQo+
ID4gICAgICAgICAgICAgICAgIGNoYW5uZWwtPmlzX290Z19jaGFubmVsID0gdHJ1ZTsNCj4gPiAr
ICAgICAgICAgICAgICAgYXR0ciA9IHNvY19kZXZpY2VfbWF0Y2goc29jX25vX2FkcF9jdHJsKTsN
Cj4gPiArICAgICAgICAgICAgICAgaWYgKGF0dHIpIHsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBjaGFubmVsLT5zb2Nfbm9fYWRwX2N0cmwgPSBhdHRyLT5kYXRhOw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNoYW5uZWwtPm9iaW50X2VuYWJsZV9iaXRzID0gVVNCMl9PQklOVF9J
RENIR19FTjsNCj4gPiArICAgICAgICAgICAgICAgfQ0KPiANCj4gUGxlYXNlIGRvbid0IGFidXNl
IHNvY19kZXZpY2VfbWF0Y2goKSBmb3IgbWF0Y2hpbmcgd2l0aCBhIGRpZmZlcmVudA0KPiB2YXJp
YW50IHRoYXQgdXNlcyBhIGRpZmZlcmVudCBjb21wYXRpYmxlIHZhbHVlLiAgSnVzdCBhZGQgYW4g
ZW50cnkNCj4gdG8gcmNhcl9nZW4zX3BoeV91c2IyX21hdGNoX3RhYmxlW10gaW5zdGVhZC4NCj4g
SSBkb24ndCBrbm93IGlmIHlvdSBjYW4gaGFuZGxlIFJaL0cyTCBqdXN0IHVzaW5nIGEgZGlmZmVy
ZW50IHBoeV9vcHMsDQo+IG9yIG5lZWQgdG8gZXh0ZW5kIHJjYXJfZ2VuM19waHlfdXNiMl9tYXRj
aF90YWJsZVtdLmRhdGEuDQoNClRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50cy4gSSB0aGluayB3
ZSBuZWVkIHRvIGV4dGVuZA0KcmNhcl9nZW4zX3BoeV91c2IyX21hdGNoX3RhYmxlW10uZGF0YSBi
ZWNhdXNlIHdlIGNhbm5vdCBhZGQNCmFueSBwcml2YXRlIGRhdGEgaW50byBwaHlfb3BzLg0KDQpJ
J2xsIHNlbmQgZnVydGhlciBjb21tZW50cyBmb3IgdGhpcyBwYXRjaCBvbiBvdGhlciBlbWFpbCB0
aHJlYWQuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
