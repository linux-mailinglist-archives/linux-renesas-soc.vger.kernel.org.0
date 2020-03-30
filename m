Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D23521975E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2020 09:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729473AbgC3HnU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Mar 2020 03:43:20 -0400
Received: from esa17.fujitsucc.c3s2.iphmx.com ([216.71.158.34]:37125 "EHLO
        esa17.fujitsucc.c3s2.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728766AbgC3HnU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Mar 2020 03:43:20 -0400
IronPort-SDR: E/iSmu90eO0+PHHu8NLnZ4nQL/lYOyqj5RSiQPeJK2/GAt+rLAZZ8MiNP1zVYQ+Cmo60RLkENa
 3gZOE7fH5tq+u3E8KmLN/IBuJDQ188jl5WiZzVSgiS6dUB1DiXQl8x6QaVbqSlXv4OAfeEpiQS
 x9qBadElYAE54lXIyZ1uqa6ggfs/DvMyIhQHHH54zVyyaKa5mxByvAW01pD/5pjjcL9tYfDuGZ
 1FXodWv6oopUq52sh95t50gO55zh5Lncvd1a61206hW51DNKgT61UJig0RPr+EdzTC6DseJYTR
 xxw=
X-IronPort-AV: E=McAfee;i="6000,8403,9575"; a="11744806"
X-IronPort-AV: E=Sophos;i="5.72,323,1580742000"; 
   d="scan'208";a="11744806"
Received: from mail-ty1jpn01lp2051.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.51])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 16:43:12 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0dUlyee6L2ZyImpZiKi5k8fjfGZB9EMbcL82+VhVfx2xfmPUoxdeouhbOXeeqtYRwssJophgyw4JAEAGQHVP98djKflALPwQDbEo+vS9jbLrv7y6Y75BjyytFom7PShrJ7rwQk2qdhYGJZlMG32DKkpM4vjbtZnnT+A6a//tSwcWbKqejke3PBuRtmyw1EQl12d6bYHdaPsKCuX+6MzB52U70kKHeKYhwpKkBP4WO5Mqv8thi8VekgPEgvDBsDF1UoFmuWCW1U9GPjNaak0Xvygat8fcE46amjLGQQX/eRTfeT5b3qvmkWp7I8rRoOcMfd3Zp1uyMG6GD0ddEefzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gt7pcXsz4Bt6pY/wGJ4A8ybxNd+7gCRPGq0uj8xAtBI=;
 b=cONpNWfT7ihoY2F9nRilKP4Kk73PSuXW/8ETNdUCiKhFajJTVxX+WfO6b2eR1koLmFygpUCRA+DseTGzRqvZIOHI4q0oj3NiT9KvmKnDMpryt0Tl7GSeDx09e6tk26wSh/IOYuUpm4obnw7t/WMH7pBfPyU37LObdeiz3xsdLHcLa4GjuzSABx1wZuHzb9mgwEUSHr4zlFhgQ/mCwbQqJd1Mrp2u8RtgZ6v94pxrA6vnO8nX4dUsZNPQlJ7PodUNqBpCqR3WCEO3uALwdCExu1ri8n40gncz7HXSaIOrGwbsfTZVemec46GWJfXEYT4KrV4/OhRGfDJp5MrzlrE08w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gt7pcXsz4Bt6pY/wGJ4A8ybxNd+7gCRPGq0uj8xAtBI=;
 b=fcjiSCrg8uXfa61YlvvYWfEOrh++ozN8sTL43HC2B7nEE/VWfr1Wk+MhzZpVzBWHF/WrumJ1XDJXG1KQYqKZuPpuKB1oBVPu0Y+jGTOjtkX6zV4qzQkW6efbqhWsX5K3GBiuS17pPH5oLGfiVFTzXpH7hfeVhyx5WoUyVNX5rS0=
Received: from OSBPR01MB5061.jpnprd01.prod.outlook.com (20.179.181.80) by
 OSBPR01MB4566.jpnprd01.prod.outlook.com (20.179.180.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Mon, 30 Mar 2020 07:43:09 +0000
Received: from OSBPR01MB5061.jpnprd01.prod.outlook.com
 ([fe80::6915:f08:131c:c5bb]) by OSBPR01MB5061.jpnprd01.prod.outlook.com
 ([fe80::6915:f08:131c:c5bb%4]) with mapi id 15.20.2856.019; Mon, 30 Mar 2020
 07:43:09 +0000
From:   "ashiduka@fujitsu.com" <ashiduka@fujitsu.com>
To:     'Geert Uytterhoeven' <geert@linux-m68k.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "erosca@de.adit-jv.com" <erosca@de.adit-jv.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "uli+renesas@fpond.eu" <uli+renesas@fpond.eu>,
        "george_davis@mentor.com" <george_davis@mentor.com>,
        "andrew_gabbasov@mentor.com" <andrew_gabbasov@mentor.com>,
        "jiada_wang@mentor.com" <jiada_wang@mentor.com>,
        "yuichi.kusakabe@denso-ten.com" <yuichi.kusakabe@denso-ten.com>,
        "yasano@jp.adit-jv.com" <yasano@jp.adit-jv.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jslaby@suse.com" <jslaby@suse.com>,
        "yohhei.fukui@denso-ten.com" <yohhei.fukui@denso-ten.com>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "torii.ken1@fujitsu.com" <torii.ken1@fujitsu.com>
Subject: RE: [PATCH] serial: sh-sci: Support custom speed setting
Thread-Topic: [PATCH] serial: sh-sci: Support custom speed setting
Thread-Index: AQHV1sAgPlnOtMWuIkKRz6OcOs9dRKgDJUQAgBHWrICAL6+KAIAAQSSAgAAIqJCAHCaFkA==
Date:   Mon, 30 Mar 2020 07:43:09 +0000
Message-ID: <OSBPR01MB506141BA2FDD08FE11FC4DEBDFCB0@OSBPR01MB5061.jpnprd01.prod.outlook.com>
References: <20200129161955.30562-1-erosca@de.adit-jv.com>
 <CAMuHMdWV0kkKq6sKOHsdz+FFGNHphzq_q7rvmYAL=U4fH2H3wQ@mail.gmail.com>
 <20200210205735.GB1347752@kroah.com>
 <OSBPR01MB29496E76BE5FD0C5BC56D0F0C1FD0@OSBPR01MB2949.jpnprd01.prod.outlook.com>
 <CAMuHMdXYPG8t=vBn6c2B=8TwbWJfFCjW8peDLgHBwW_AxpH5Hw@mail.gmail.com>
 <OSBPR01MB50612C6EF774733B3496AECADFFD0@OSBPR01MB5061.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB50612C6EF774733B3496AECADFFD0@OSBPR01MB5061.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-securitypolicycheck: OK by SHieldMailChecker v2.6.2
x-shieldmailcheckerpolicyversion: FJ-ISEC-20181130-VDI-enc
x-shieldmailcheckermailid: 4d9b33f5b74b43d889ac15328c68536d
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ashiduka@fujitsu.com; 
x-originating-ip: [210.170.118.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e48b46c9-0912-4af4-b55f-08d7d47dfdf6
x-ms-traffictypediagnostic: OSBPR01MB4566:|OSBPR01MB4566:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB45663E0003889B5241FA05D7DFCB0@OSBPR01MB4566.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0358535363
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5061.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(64756008)(66446008)(66556008)(66476007)(54906003)(478600001)(8676002)(966005)(110136005)(81166006)(81156014)(4326008)(8936002)(71200400001)(26005)(33656002)(316002)(107886003)(7416002)(86362001)(53546011)(186003)(6506007)(9686003)(76116006)(52536014)(55016002)(7696005)(66946007)(2906002)(85182001)(5660300002)(777600001);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ahb31JxLc/6V0NsardHUe+RYwu6ejGlQgNlK/x5wBmMt9XG2OhpslCn24fCicCNp0naly+1FZjzDCgBYfUhgKmmUIawmCNzOzXtEdIx0d1jhPY+ay6daxSTT/lyQ6YO9N8T8s/yyOm4jJdqxJ6fOROUS+P/cOJ22fT132tEWPkxtdvTXct1gDY49H+MFHBqceEp2jxapCqXpaFJmOxOVCDYQaqWX786JjUzcVtYEVe3tJ92t6J74ZPOuQ8KmXc5prbMbVIQRVjM4pTkKkhq0W2GHrujOLxDLlPgc7NzQhwzuyaXJaEL6HONuy0yHmXEbQXNVpgMCMi4hklC0s/ocU4HZMabTmENlhJD2NFXDmGhRh3OqCwooouLAOV8kasGC49+QWjAjXZQg9AIIYydwhOSxyaPQrbY6uhi+UjBXBtOewLIIWPSce7aYlX4GC/UukoD7AeuQ/usIiPqZmoQ2PvlOiYLxv7YMwT1l7CaLciE99YufTcRnWjgbmTZqUxMoBD/5vjss238jQaoM32o5l4qT+tOnbTBclIdJi9dE9KLU3w4eWYn9Q+5WOkjdrqhd
x-ms-exchange-antispam-messagedata: WTQMY8c4Vks3O1Hsv5H0RxURH+oQouCfz8IMsiOonpxImNtaX4HniI7H9INh4YBTHwUmibN7AXuC1k4kx2r1twHNCkE8UI2rznmKLk2sHFWsNiP3aIBalyVCfnpXZ7vYrmmyjuTFlZifBaOvVtHm4g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48b46c9-0912-4af4-b55f-08d7d47dfdf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2020 07:43:09.1609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QYzHr3VGXOpm3YS9rWnJoFaCa/YdPWKWl6O50nhTj+/H1E6GQMc0CDBYi5I2LA9cQzbZKkeQW2yic9fTSvT6EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4566
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RGVhciBHcmVnLCBHZWVydCwNCg0KPiBSaWdodC4NCj4gQWRkaW5nICIjaW5jbHVkZSA8c3lzL2lv
Y3RsLmg+IiB0byBHcmVnJ3Mgc2FtcGxlIGNvZGUgY2F1c2VzIGENCj4gY29tcGlsYXRpb24gZXJy
b3IuDQo8c25pcD4NCj4gSXMgaXQgbm9ybWFsIHRvIGRlY2xhcmUgaW9jdGwoKSB3aXRob3V0ICIj
aW5jbHVkZSA8c3lzL2lvY3RsLmg+IiA/DQoNCkkgd291bGQgYmUgaGFwcHkgaWYgeW91IGNvdWxk
IGdpdmUgbWUgc29tZSBjb21tZW50cy4NCg0KPiBodHRwOi8vd3d3LnBhbml4LmNvbS9+Z3JhbnRl
L2FyYml0cmFyeS1iYXVkLmMNCg0KV2UgdGhpbmsgdGhpcyBzYW1wbGUgY29kZSBpcyBubyBnb29k
Lg0KU2hvdWxkIEkgd29yayBvbiBnbGliYyBjaGFuZ2VzIGluc3RlYWQgb2Yga2VybmVsIGZpeGVz
Pw0KDQpUaGFua3MgJiBCZXN0IFJlZ2FyZHMsDQpZdXVzdWtlIEFzaGlkdWthIDxhc2hpZHVrYUBm
dWppdHN1LmNvbT4NCkVtYmVkZGVkIFN5c3RlbSBEZXZlbG9wbWVudCBEZXB0LiBFbWJlZGRlZCBT
eXN0ZW0gRGV2ZWxvcG1lbnQgRGl2Lg0KRlVKSVRTVSBDT01QVVRFUiBURUNITk9MT0dJRVMgTHRk
Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFzaGl6dWthLCBZdXVz
dWtlL+iKpuWhmiDpm4Tku4sgPGFzaGlkdWthQGZ1aml0c3UuY29tPg0KPiBTZW50OiBUaHVyc2Rh
eSwgTWFyY2ggMTIsIDIwMjAgNjo0NCBQTQ0KPiBUbzogJ0dlZXJ0IFV5dHRlcmhvZXZlbicgPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPjsNCj4gZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gQ2M6
IGVyb3NjYUBkZS5hZGl0LWp2LmNvbTsgbGludXgtc2VyaWFsQHZnZXIua2VybmVsLm9yZzsNCj4g
bGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOw0KPiB3c2ErcmVuZXNhc0BzYW5nLWVu
Z2luZWVyaW5nLmNvbTsNCj4geW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb207IHVsaSty
ZW5lc2FzQGZwb25kLmV1Ow0KPiBnZW9yZ2VfZGF2aXNAbWVudG9yLmNvbTsgYW5kcmV3X2dhYmJh
c292QG1lbnRvci5jb207DQo+IGppYWRhX3dhbmdAbWVudG9yLmNvbTsgeXVpY2hpLmt1c2FrYWJl
QGRlbnNvLXRlbi5jb207DQo+IHlhc2Fub0BqcC5hZGl0LWp2LmNvbTsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsNCj4ganNsYWJ5QHN1c2UuY29tOyB5b2hoZWkuZnVrdWlAZGVuc28tdGVu
LmNvbTsNCj4gbWFnbnVzLmRhbW1AZ21haWwuY29tOyBUb3JpaSwgS2VuaWNoaS/ps6XlsYUg5YGl
5LiADQo+IDx0b3JpaS5rZW4xQGZ1aml0c3UuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIXSBz
ZXJpYWw6IHNoLXNjaTogU3VwcG9ydCBjdXN0b20gc3BlZWQgc2V0dGluZw0KPiANCj4gRGVhciBH
cmVnLCBHZWVydCwNCj4gDQo+ID4gSSBndWVzcyB5b3UgbWVhbiB0aGUgZm9yd2FyZCBkZWNsYXJh
dGlvbiBvZiBpb2N0cmwoKT8NCj4gPiBObywgdGhleSBzaG91bGQgaW5jbHVkZSA8c3lzL2lvY3Rs
Lmg+IGluc3RlYWQuDQo+IA0KPiBSaWdodC4NCj4gQWRkaW5nICIjaW5jbHVkZSA8c3lzL2lvY3Rs
Lmg+IiB0byBHcmVnJ3Mgc2FtcGxlIGNvZGUgY2F1c2VzIGENCj4gY29tcGlsYXRpb24gZXJyb3Iu
DQo+IA0KPiA+ID4gSSBzYXcgdGhlIGNvZGUgYWJvdmUsIEkgdGhvdWdodCBJIHdvdWxkbid0IHdy
aXRlIHN1Y2ggY29kZQ0KPiBub3JtYWxseS4NCj4gPiBXaHkgbm90Pw0KPiANCj4gSXMgaXQgbm9y
bWFsIHRvIGRlY2xhcmUgaW9jdGwoKSB3aXRob3V0ICIjaW5jbHVkZSA8c3lzL2lvY3RsLmg+IiA/
DQo+IA0KPiBUaGFua3MgJiBCZXN0IFJlZ2FyZHMsDQo+IFl1dXN1a2UgQXNoaWR1a2EgPGFzaGlk
dWthQGZ1aml0c3UuY29tPg0KPiBFbWJlZGRlZCBTeXN0ZW0gRGV2ZWxvcG1lbnQgRGVwdC4gRW1i
ZWRkZWQgU3lzdGVtIERldmVsb3BtZW50IERpdi4NCj4gRlVKSVRTVSBDT01QVVRFUiBURUNITk9M
T0dJRVMgTHRkLg0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4gU2VudDogVGh1
cnNkYXksIE1hcmNoIDEyLCAyMDIwIDY6MDMgUE0NCj4gPiBUbzogVG9yaWksIEtlbmljaGkv6bOl
5bGFIOWBpeS4gCA8dG9yaWkua2VuMUBmdWppdHN1LmNvbT4NCj4gPiBDYzogZ3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc7IGVyb3NjYUBkZS5hZGl0LWp2LmNvbTsNCj4gPiBsaW51eC1zZXJpYWxA
dmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+
ID4gd3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb207DQo+ID4geW9zaGloaXJvLnNoaW1v
ZGEudWhAcmVuZXNhcy5jb207IHVsaStyZW5lc2FzQGZwb25kLmV1Ow0KPiA+IGdlb3JnZV9kYXZp
c0BtZW50b3IuY29tOyBhbmRyZXdfZ2FiYmFzb3ZAbWVudG9yLmNvbTsNCj4gPiBqaWFkYV93YW5n
QG1lbnRvci5jb207IHl1aWNoaS5rdXNha2FiZUBkZW5zby10ZW4uY29tOw0KPiA+IHlhc2Fub0Bq
cC5hZGl0LWp2LmNvbTsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gPiBqc2xhYnlA
c3VzZS5jb207IHlvaGhlaS5mdWt1aUBkZW5zby10ZW4uY29tOyBBc2hpenVrYSwgWXV1c3VrZS8N
Cj4gPiDoiqbloZog6ZuE5LuLIDxhc2hpZHVrYUBmdWppdHN1LmNvbT47IG1hZ251cy5kYW1tQGdt
YWlsLmNvbQ0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHNlcmlhbDogc2gtc2NpOiBTdXBwb3J0
IGN1c3RvbSBzcGVlZCBzZXR0aW5nDQo+ID4NCj4gPiBIaSBUb3JpaS1zYW4sDQo+ID4NCj4gPiBP
biBUaHUsIE1hciAxMiwgMjAyMCBhdCA2OjEwIEFNIHRvcmlpLmtlbjFAZnVqaXRzdS5jb20NCj4g
PiA8dG9yaWkua2VuMUBmdWppdHN1LmNvbT4gd3JvdGU6DQo+ID4gPiBPbiBUdWUsIDExIEZlYiAy
MDIwIDA1OjU3OjM1ICswOTAwLA0KPiA+ID4gR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiA+
ID4gPiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAwMTozMjo1MFBNICswMTAwLCBHZWVydCBVeXR0
ZXJob2V2ZW4NCj4gPiB3cm90ZToNCj4gPiA+ID4gPiBPbiBXZWQsIEphbiAyOSwgMjAyMCBhdCA1
OjIwIFBNIEV1Z2VuaXUgUm9zY2ENCj4gPiA8ZXJvc2NhQGRlLmFkaXQtanYuY29tPiB3cm90ZToN
Cj4gPiA+ID4gPiA+IEZyb206IFRvcmlpIEtlbmljaGkgPHRvcmlpLmtlbjFAanAuZnVqaXRzdS5j
b20+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCBpcyBuZWNlc3NhcnkgdG8g
dXNlIEJUIG1vZHVsZSBhbmQgWE0gbW9kdWxlDQo+IHdpdGgNCj4gPiBERU5TTyBURU4NCj4gPiA+
ID4gPiA+IGRldmVsb3BtZW50IGJvYXJkLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFRoaXMg
cGF0Y2ggc3VwcG9ydHMgQVNZTkNfU1BEX0NVU1QgZmxhZyBieQ0KPiBpb2N0bChUSU9DU1NFUklB
TCksDQo+ID4gZW5hYmxlcw0KPiA+ID4gPiA+ID4gY3VzdG9tIHNwZWVkIHNldHRpbmcgd2l0aCBz
ZXRzZXJpYWwoMSkuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhlIGN1c3RvbSBzcGVlZCBp
cyBjYWxjdWxhdGVkIGZyb20gdWFydGNsayBhbmQNCj4gPiBjdXN0b21fZGl2aXNvci4NCj4gPiA+
ID4gPiA+IElmIGN1c3RvbV9kaXZpc29yIGlzIHplcm8sIGN1c3RvbSBzcGVlZCBzZXR0aW5nIGlz
IGludmFsaWQuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVG9yaWkg
S2VuaWNoaSA8dG9yaWkua2VuMUBqcC5mdWppdHN1LmNvbT4NCj4gPiA+ID4gPiA+IFtlcm9zY2E6
IHJlYmFzZSBhZ2FpbnN0IHY1LjVdDQo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFdWdlbml1
IFJvc2NhIDxlcm9zY2FAZGUuYWRpdC1qdi5jb20+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGFu
a3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBXaGlsZSB0aGlzIHNlZW1z
IHRvIHdvcmsgZmluZVsqXSwgSSBoYXZlIGEgZmV3DQo+ID4gY29tbWVudHMvcXVlc3Rpb25zOg0K
PiA+ID4gPiA+ICAgMS4gVGhpcyBmZWF0dXJlIHNlZW1zIHRvIGJlIGRlcHJlY2F0ZWQ6DQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiAgICAgICAgICBzaC1zY2kgZTZlNjgwMDAuc2VyaWFsOiBzZXRzZXJp
YWwgc2V0cyBjdXN0b20gc3BlZWQNCj4gPiBvbg0KPiA+ID4gPiA+IHR0eVNDMS4gVGhpcyBpcyBk
ZXByZWNhdGVkLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gICAyLiBBcyB0aGUgd2FudGVkIHNwZWVk
IGlzIHNwZWNpZmllZCBhcyBhIGRpdmlkZXIsIHRoZQ0KPiByZXN1bHRpbmcNCj4gPiBzcGVlZA0K
PiA+ID4gPiA+ICAgICAgbWF5IGJlIG9mZiwgY2ZyLiB0aGUgZXhhbXBsZSBmb3IgNTc2MDAgYmVs
b3cuDQo+ID4gPiA+ID4gICAgICBOb3RlIHRoYXQgdGhlIFNDSUYgZGV2aWNlIGhhcyBtdWx0aXBs
ZSBjbG9jayBpbnB1dHMsDQo+IGFuZA0KPiA+IGNhbiBkbw0KPiA+ID4gPiA+ICAgICAgNTc2MDAg
cGVyZmVjdGx5IGlmIHRoZSByaWdodCBjcnlzdGFsIGhhcyBiZWVuIGZpdHRlZC4NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+ICAzLiBXaGF0IHRvIGRvIHdpdGggIltQQVRDSC9SRkNdIHNlcmlhbDogc2gt
c2NpOiBVcGRhdGUNCj4gdWFydGNsaw0KPiA+IGJhc2VkDQo+ID4gPiA+ID4gICAgICBvbiBzZWxl
Y3RlZCBjbG9jayINCj4gPiAoaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTEw
MzcwMy8pPw0KPiA+ID4gPiA+ICAgICAgQ29tYmluZWQgd2l0aCB0aGlzLCB0aGluZ3MgYmVjb21l
IHByZXR0eSBjb21wbGljYXRlZA0KPiBhbmQNCj4gPiA+ID4gPiAgICAgIHVucHJlZGljdGFibGUs
IGFzIHVhcnRjbGsgbm93IGFsd2F5cyByZWZsZWN0IHRoZQ0KPiBmcmVxdWVuY3kNCj4gPiBvZiB0
aGUNCj4gPiA+ID4gPiAgICAgIGxhc3QgdXNlZCBiYXNlIGNsb2NrLCB3aGljaCB3YXMgdGhlIG9w
dGltYWwgb25lIGZvciB0aGUNCj4gPiBwcmV2aW91c2x5DQo+ID4gPiA+ID4gICAgICB1c2VkIHNw
ZWVkLi4uLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSB0aGluayBpdCB3b3VsZCBiZSBlYXNpZXIg
aWYgd2UganVzdCBoYWQgYW4gQVBJIHRvIHNwZWNpZnkNCj4gPiBhIHJhdyBzcGVlZC4NCj4gPiA+
ID4gPiBQZXJoYXBzIHRoYXQgYWxyZWFkeSBleGlzdHM/DQo+ID4gPiA+DQo+ID4gPiA+IFllcywg
c2VlOg0KPiA+ID4gPiAgICAgICBodHRwOi8vd3d3LnBhbml4LmNvbS9+Z3JhbnRlL2FyYml0cmFy
eS1iYXVkLmMNCj4gPiA+DQo+ID4gPiBJIHNhdyB0aGUgY29kZSBhYm92ZSwgSSB0aG91Z2h0IEkg
d291bGRuJ3Qgd3JpdGUgc3VjaCBjb2RlDQo+IG5vcm1hbGx5Lg0KPiA+ID4NCj4gPiA+ID4jaW5j
bHVkZSA8bGludXgvdGVybWlvcy5oPg0KPiA+ID4gPg0KPiA+ID4gPmludCBpb2N0bChpbnQgZCwg
aW50IHJlcXVlc3QsIC4uLik7DQo+ID4gPg0KPiA+ID4gRG8gYXBwbGljYXRpb24gcHJvZ3JhbW1l
cnMgaGF2ZSB0byBhY2NlcHQgdGhpcyBiYWQgY29kZT8NCj4gPg0KPiA+IEkgZ3Vlc3MgeW91IG1l
YW4gdGhlIGZvcndhcmQgZGVjbGFyYXRpb24gb2YgaW9jdHJsKCk/DQo+ID4gTm8sIHRoZXkgc2hv
dWxkIGluY2x1ZGUgPHN5cy9pb2N0bC5oPiBpbnN0ZWFkLg0KPiA+DQo+ID4gR3J7b2V0amUsZWV0
aW5nfXMsDQo+ID4NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiA+DQo+ID4g
LS0NCj4gPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tDQo+ID4gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gPg0KPiA+IEluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmDQo+IGEN
Cj4gPiBoYWNrZXIuIEJ1dA0KPiA+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3INCj4gc29tZXRoaW5nDQo+ID4gbGlrZSB0aGF0Lg0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
