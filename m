Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453322482DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Aug 2020 12:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgHRKV4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Aug 2020 06:21:56 -0400
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:6429
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726145AbgHRKVz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Aug 2020 06:21:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewnvVjwAGRObeNLlMFDrHA3Ru1KqurPkSLgWnb1oQCi5V4pylhfjxMnVxt1zYSf25qu8YSI7pl53TV+wuTRmGy+F7lchpwywE5GHR90PQct0PKu01UCgd/rT0vS51FLOLm66DSuFNciPTBjNQzjdVxNwY5mUdGUwNlFzRvs6BqNEEt/PY6bocGqVttyvztCEHjW6LK5q7M/8Uz5UcMB+fdz2VZU/7aD1LT+HKzJ9hC39MAeJWKkOwA+2hxs+mA4U/C+LYTtI19TWbWR2PqOIelmtp/RXFY1LOb6/zLjZcGF0r1WvBv9qPBlgsP2C9hx5qYIE3YjHHJRJnrmJnznmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQmwwAv/T6i6pD27vfCL9/B/0+9vBi1YFe/HEespcUM=;
 b=njgwP8isyrwoShfb/6HDI2gvK9RLn2JZyZct4gMLvHw5NNgrsHGBt0U7OGGY90iB2oyyxW17GKWhrogLAqf3M+uqjbGGbLn7qQufXQSk1RJa3h/cFRKzeTFoH7hQvU2jJr17D9CbfkeVf4L0kGB+NuDCzsJ81twh3mL9bMtijXgQE7wvmSBOMPzNjDhi6CpQO6mU9+RyQ7q8Pzu8+MNpJzn/s02NRk+Qsz1a8iZeNMDDzJs3NWzAraF3odfv2RPtsrX9EYwp6jizaItArNq3mCMk+mBV980aMgiyt7NoFI8Xq9M7avkF0mw0c+q3RAEM3bFpqAdWgYaFu5z9gjyDFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQmwwAv/T6i6pD27vfCL9/B/0+9vBi1YFe/HEespcUM=;
 b=qbOFTbznSkvaJ/x7eE7Z1gIAzscJVHf28ubhm2xTiIcPAm3g0LqrbLklFYK+3PHKKluhkEanlNwsGmkA2D44aGkz8kyCWKuuwka15U08ijJtMyNhYYpQcONsXU6OloyMgfWMzz3m3uBguOucAv3ic09k8mTmOQFw87mlSmR1iuI=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSAPR01MB2098.jpnprd01.prod.outlook.com (2603:1096:603:15::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.23; Tue, 18 Aug
 2020 10:21:52 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::cdbe:6988:b51c:51a3]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::cdbe:6988:b51c:51a3%6]) with mapi id 15.20.3283.027; Tue, 18 Aug 2020
 10:21:51 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] arm64: defconfig: Enable R-Car PCIe endpoint driver
Thread-Topic: [PATCH v2] arm64: defconfig: Enable R-Car PCIe endpoint driver
Thread-Index: AQHWb+hHNsYVRLD8/kuHHMJqgX8E8Kk9rdwAgAAE1gA=
Date:   Tue, 18 Aug 2020 10:21:51 +0000
Message-ID: <OSBPR01MB5048E39D74A80C4F25E92120AA5C0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20200811140357.564-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXqYH3WkXekUGFzYnLzFD2bSvA9p9M_dm6jH_mNuAAfJw@mail.gmail.com>
In-Reply-To: <CAMuHMdXqYH3WkXekUGFzYnLzFD2bSvA9p9M_dm6jH_mNuAAfJw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 768e5c92-c75c-4d3e-fcf7-08d843608622
x-ms-traffictypediagnostic: OSAPR01MB2098:
x-microsoft-antispam-prvs: <OSAPR01MB20980646F6F6C0671E77A9A1AA5C0@OSAPR01MB2098.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fg5zzc63l8CjWfqruIlvFnk/p1PSuegj9/WaYe/QlGPeL8hZphan22Blf6mrF3RajTqUogxT/6g6c4INnEQpQhmF86Q4/9Ht95gbqGq05ECtF8mo3+b9Hou+buOJUEOjvY6MHTaO6O50coQXJ/dRPEnMaUlekUcVu5ABGpqe+kqfvWgTD5h5FrO+riLiFHmvm86sQqKFdC2Wzdym1ELC4+/TLQaY2E+lLJnr/9ID/WQZDIfmDRH4EkM8XZKYeeOBn4ZEGpXHf/ybCGZhRY4SK0Omf8gEvnKmOO3Pvgm1dxSO6aVkDjYILQt+Mvvf+l5Me4TPBYP6sbLL8hyocLlVvw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(71200400001)(478600001)(9686003)(186003)(53546011)(6506007)(26005)(7696005)(316002)(2906002)(55016002)(6916009)(8676002)(76116006)(86362001)(8936002)(33656002)(83380400001)(66446008)(66476007)(66556008)(66946007)(4326008)(52536014)(64756008)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: qun1SytuDbbm7c5HcHK83n9bYQosQZSe21bYgWrVhBWz4MI0mbdR2HUJJjbWrzd4f8NNgegouivQ3hrbqn6l2l0gZA9XSD/JGOC5F8NbKpfR+SxB0MQPgYiXcnlektoQvOYMaO/RLxmS4DmNn7Ml6VTEJ7+W81cpyDMqRNSu6ehE2swat5JU9ckqxG9+as1Ra+GUc+WGpEacuav9v6b3DKsvEB7hsSn8IKu8vMkFcIX/A7omTltk/vXojS8b9MMiKFwdS1ego768bf44NDL+a4nReEEpFYqClpeLXoe13+mVNoudIncRIAOwSsbHNqeRDfzak6Sjubem0xbtd05rEB2+5LJTQAluidNq0nvNsquSBZd/6p0hZ5r29+iFU6q7ry7LJ4mGDSHAb1RShjmxiDIdzUO4VQ0T5fbDdGSqoWsvMaR/oRCwq0pSJQ28wv/UpG3B8PnpXqQjn/iDklICxoVtSm4zqaYvNy9nMO44JnRq4xbR8FPtKYRWuK7Unmmtu/21vdRRKiyaAqYN2DbsFnP593yn0HWnyDwhgPeZ7O/el6+Vn8ssVZuM4auigfrlZnSqGadtrtBK6veO4S0k1g5YbUFxFXWE4f8GHAardgz3gvRfDkKVqp0J6k+RTAeOM+4kcl8Pp+vXjLJ+GFGfTQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768e5c92-c75c-4d3e-fcf7-08d843608622
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 10:21:51.6198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LHyRo743xydLoGQUkyGKdNXBBDQY50Xud1duh/lItSFGXjqM5QTUbAqboeKlVwleARGNKFiRZBtRXGjz8BocwZwkXvHbf1Wiro+oIMpz6hHTv7g92vgzy3VsuEAysTbf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2098
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTggQXVndXN0IDIw
MjAgMTE6MDQNCj4gVG86IFByYWJoYWthciBNYWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYt
bGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiBDYzogTGludXgtUmVuZXNhcyA8bGludXgtcmVuZXNh
cy1zb2NAdmdlci5rZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBhcm02NDog
ZGVmY29uZmlnOiBFbmFibGUgUi1DYXIgUENJZSBlbmRwb2ludCBkcml2ZXINCj4NCj4gSGkgUHJh
Ymhha2FyLA0KPg0KPiBPbiBUdWUsIEF1ZyAxMSwgMjAyMCBhdCA0OjA0IFBNIExhZCBQcmFiaGFr
YXINCj4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+
ID4gRW5hYmxlIFItQ2FyIFBDSWUgZW5kcG9pbnQgZHJpdmVyIG9uIFJaL0cyRSBib2FyZCwgaW5j
bHVkaW5nIGVuYWJsaW5nDQo+ID4gZW5kcG9pbnQgY29uZmlndXJhdGlvbnMgQ09ORklHX1BDSV9F
TkRQT0lOVCwgQ09ORklHX1BDSV9FTkRQT0lOVF9DT05GSUdGUywNCj4gPiBDT05GSUdfUENJX0VQ
Rl9URVNUIGFuZCBDT05GSUdfUENJX0VORFBPSU5UX1RFU1QgcmVxdWlyZWQgdG8gdXNlIGFuZCB0
ZXN0DQo+ID4gdGhlIGRyaXZlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4NCj4gUHJvYmFi
bHkgeW91IHdhbnQgdGhpcyBpbiB0aGUgbG9jYWwgcmVuZXNhc19kZWZjb25maWcsIHRvbz8NCj4N
ClllcywgaXQgaXMgaW4gbXkgVE9ETyBsaXN0IPCfmIoNCg0KQ2hlZXJzLA0KUHJhYmhha2FyDQoN
Cj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
DQo+DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4NCj4gSW4gcGVyc29uYWwgY29u
dmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIu
IEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dy
YW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9w
ZSBHbWJILCBHZXNjaGFlZnRzZnVlaHJlci9QcmVzaWRlbnQ6IENhcnN0ZW4gSmF1Y2gsIFNpdHog
ZGVyIEdlc2VsbHNjaGFmdC9SZWdpc3RlcmVkIG9mZmljZTogRHVlc3NlbGRvcmYsIEFyY2FkaWFz
dHJhc3NlIDEwLCA0MDQ3MiBEdWVzc2VsZG9yZiwgR2VybWFueSwgSGFuZGVsc3JlZ2lzdGVyL0Nv
bW1lcmNpYWwgUmVnaXN0ZXI6IER1ZXNzZWxkb3JmLCBIUkIgMzcwOCBVU3QtSUROci4vVGF4IGlk
ZW50aWZpY2F0aW9uIG5vLjogREUgMTE5MzUzNDA2IFdFRUUtUmVnLi1Oci4vV0VFRSByZWcuIG5v
LjogREUgMTQ5Nzg2NDcNCg==
