Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 372AAC4A76
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 11:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfJBJUs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 05:20:48 -0400
Received: from mail-eopbgr1410112.outbound.protection.outlook.com ([40.107.141.112]:38784
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725848AbfJBJUs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 05:20:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAQMhYqtDvnhvCkSrdBkrst//zWlKKScctseHtZbjG1cukLF6piz7/mEGj92+GK9yWGs7YDE3TTftwKk9Cg7NUOV3EfHGoPU+Hb43Ggrek9voKVqyk3ztF7qP5YAEHVZyx/TGP2+q0PzrV0P6awtJmTAjyCcwryBNw9GzFDtr7+XbXDE08Xq2si8mTv09qihBWVdn7WlbA/7HVdBZtQQd2db5JJjlbGU9KnO6qAfwSK1PIm0F8R/RsFDkmzMAKqwo/q4fN4Pt6+DBoz2nfEsqOFOQrv2R2Busy+K//n815yTGX4JysD9Zzq4z8HB52gqllkv4eWGQHULFpje9xndAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BY28p1uwQf2tAL3zVWJbMQCjVM9/hPKdQTVxVzwgE0=;
 b=oKyxlZv6RtRjlQMSPAMvXCm9rKBS1yuxlp1RrdNnDZfz4KbXAmjT1t08Rw6kmYTlOugWfXTXTasPbEEIy1/UCIAfDk6l6k3z6AoOTwzYQzyoeYctwX1LuqMSgkSZs7Fodb94EzX/XtZ0HV8vFiqi+fWAmu7+kDSjkxji+cUS10XDD8hRfNJp+87aldmAr+KxgRBkGQIqC51/Mov90L5OTBcUqT1cDaOAe/xNWcXI1USEkKMIEDnmqBatj1AhmRIyxYkrEqetH3ocvPIDrS+5iDh4hOGYVrRBzqckJv/EbrDhmv20VyntoLg96bkCpxFhfVeoGn/JQxccFCMK+4H/Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BY28p1uwQf2tAL3zVWJbMQCjVM9/hPKdQTVxVzwgE0=;
 b=LD6hylejTjCi2OPojS+ZPO3uvUlVnxWJiMU51/Pl7TO6NGjQOQiv2uszTcqSNdUT9oUBTOHq0SUarlmQFHIoaOzjqb0M+SL87gK9559KQZddz/TubpaAZNBoeb2xYn+wGVN2i7LFawRG3lELR1xEsZcet5Psn68CyYEnsT+gDFs=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2349.jpnprd01.prod.outlook.com (20.177.102.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 09:20:44 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 09:20:44 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jiri Slaby <jslaby@suse.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mmc: sh_mmcif: Use platform_get_irq_optional() for
 optional interrupt
Thread-Topic: [PATCH] mmc: sh_mmcif: Use platform_get_irq_optional() for
 optional interrupt
Thread-Index: AQHVeINBliwm7hLnmUKaPfQ88mi/3KdHAjCAgAABsOCAAALWAIAADVhA
Date:   Wed, 2 Oct 2019 09:20:44 +0000
Message-ID: <TYAPR01MB454448F002B0D9B82C732C44D89C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191001180834.1158-1-geert+renesas@glider.be>
 <20191002081553.GB1388@ninjato>
 <TYAPR01MB454472C76E03930717A2898BD89C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <CAMuHMdWBghL8Em0OoCKjJdU7OiY_pV3Lmc=SXhV2yY=sKJJ-aw@mail.gmail.com>
In-Reply-To: <CAMuHMdWBghL8Em0OoCKjJdU7OiY_pV3Lmc=SXhV2yY=sKJJ-aw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3552c84-2a64-403a-8775-08d74719cd83
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB2349:
x-microsoft-antispam-prvs: <TYAPR01MB2349015E8B087D6E3B966932D89C0@TYAPR01MB2349.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(136003)(396003)(39850400004)(366004)(189003)(199004)(9686003)(186003)(55016002)(66066001)(6116002)(14454004)(6246003)(102836004)(6436002)(26005)(86362001)(3846002)(71200400001)(486006)(53546011)(446003)(71190400001)(476003)(6506007)(2906002)(25786009)(316002)(81156014)(81166006)(8936002)(8676002)(76176011)(54906003)(7416002)(478600001)(74316002)(33656002)(99286004)(256004)(229853002)(7736002)(11346002)(110136005)(4326008)(64756008)(66446008)(5660300002)(7696005)(52536014)(66476007)(66556008)(66946007)(76116006)(305945005);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2349;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YnCcxaYF5GEAPf4OUCbCzufqOtCzC32FN93cR/v1qHt02jbvPSUBBPOjrsuGcorhcH0D69zjAYAncmCZeFKpUWNatBy4zDLhRCzgXG3tJafPHjrwaypR1NKUxXOLIpGsb6BMMXYHdU36HZQ7AaBFJrZ2surv2wscgOCSRi7iDYrydnU4Hb/2rD3lpe7Zyyf7qU+WJ7MTNK72MjACeYlkCHPiQeqBkQHXFbWOsm2YpOsPndhJdwfoMMCXLUxFcOXsBKX4TQavi7IfOL0jDdyUbt9oR1wfugcBkmWYTtxcPZlDCNQUOW1hr548HpTH9oIvChL1+l3uIg8OWfdV8GDvXyk+zekGizwQkEk0+fpSEqCJYRZMMZSQjeUVsl8dsuS0syMOFNgvgkkQ/W0+rqsyjfING63Ngu3DtAulCJEdNOw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3552c84-2a64-403a-8775-08d74719cd83
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 09:20:44.2489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: flC7xIAD1N64HYZVynLpfh5u8Rta2pDdyL4cNOdcT6eI2lXY4ETw7OqE20NMaVcjZCMbBCJbqxrMvMsTTFLyr96LWrcxHYIcudEH83f8yh19FFi80a3FknNQnTS5quou
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2349
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBPY3RvYmVyIDIsIDIwMTkgNTozMiBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sIFdvbGZy
YW0sDQo+IA0KPiBPbiBXZWQsIE9jdCAyLCAyMDE5IGF0IDEwOjI2IEFNIFlvc2hpaGlybyBTaGlt
b2RhDQo+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBG
cm9tOiBXb2xmcmFtIFNhbmcsIFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyLCAyMDE5IDU6MTYg
UE0NCj4gPiA8c25pcD4NCj4gPiA+IFRlc3RlZCBvbiBhIFItQ2FyIEgyOiBpdCBkb2VzIG1ha2Ug
dGhlIGVycm9yIG1lc3NhZ2UgZ28gYXdheSBhbmQgdGhlDQo+ID4gPiBNTUNJRiBkZXZpY2UgYWN0
cyBub3JtYWwgZHVyaW5nIGJvb3QuIENhbid0IGVudGVyIHVzZXJzcGFjZSBjdXJyZW50bHkNCj4g
PiA+IHdpdGggdjUuNC1yYzEgYnV0IHRoaXMgaXMgdW5yZWxhdGVkIHRvIHRoaXMgcGF0Y2ggYW5k
IE1NQ0lGLiBMb29rcyBsaWtlIGENCj4gPiA+IGNvbmZpZ3VyYXRpb24gdGhpbmcgb24gbXkgc2lk
ZSwgc28gSSB3aWxsIHN0aWxsIGdpdmU6DQo+ID4NCj4gPiBJIGFsc28gc2hvdWxkIGhhdmUgcmVw
b3J0ZWQgdGhpcyB0aG91Z2gsIG15IGVudmlyb25tZW50IChSLUNhciBIMiArIE5GUyArDQo+ID4g
YnVpbGRyb290IG9uIHY1LjQtcmMxIHdpdGggc2htb2JpbGVfZGVmY29uZmlnKSBhbHNvIGhhcyBh
IHNpbWlsYXIgaXNzdWUNCj4gPiBsaWtlIHRoZSBmb2xsb3dpbmc6DQo+ID4NCj4gPiBbICAgIDMu
NTczNDg4XSBWRlM6IE1vdW50ZWQgcm9vdCAobmZzIGZpbGVzeXN0ZW0pIG9uIGRldmljZSAwOjE2
Lg0KPiA+IFsgICAgMy41Nzk4NjldIGRldnRtcGZzOiBtb3VudGVkDQo+ID4gWyAgICAzLjU4ODAx
NF0gRnJlZWluZyB1bnVzZWQga2VybmVsIG1lbW9yeTogMTAyNEsNCj4gPiBbICAgIDMuNjUxNzcx
XSBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MNCj4gPiBTdGFydGluZyBzeXNsb2dkOiBP
Sw0KPiA+IFN0YXJ0aW5nIGtsb2dkOiBPSw0KPiA+IEluaXRpYWxpemluZyByYW5kb20gbnVtYmVy
IGdlbmVyYXRvci4uLiBbICAgIDQuMDczNjI5XSByYW5kb206IGRkOiB1bmluaXRpYWxpemVkIHVy
YW5kb20gcmVhZCAoNTEyIGJ5dGVzIHJlYWQpDQo+ID4gdXJhbmRvbSBzdGFydDogZmFpbGVkLg0K
PiA+IGRvbmUuDQo+ID4gU3RhcnRpbmcgbmV0d29yazogaXA6IE9WRVJSVU46IEJhZCBhZGRyZXNz
DQo+ID4gaXA6IE9WRVJSVU46IEJhZCBhZGRyZXNzDQo+ID4gaXA6IE9WRVJSVU46IEJhZCBhZGRy
ZXNzDQo+IA0KPiBQbGVhc2UgY2hlcnJ5LXBpY2sgdGhlIHRvcCBjb21taXQgZnJvbSByZW5lc2Fz
LWRldmVsOg0KPiA2ZTQ3Yzg0MTMyOWViOWIwICgiQVJNOiBmaXggX19nZXRfdXNlcl9jaGVjaygp
IGluIGNhc2UgdWFjY2Vzc18qIGNhbGxzDQo+IGFyZSBub3QgaW5saW5lZCIpDQoNClRoYW5rIHlv
dSBmb3IgdGhlIGluZm9ybWF0aW9uLiBUaGlzIGNvbW1pdCBjb3VsZCBmaXggdGhlIGlzc3VlIG9u
IG15IGVudmlyb25tZW50Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
