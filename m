Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85CF26D62F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 10:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgIQIOV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 04:14:21 -0400
Received: from mail-eopbgr1400123.outbound.protection.outlook.com ([40.107.140.123]:52547
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726318AbgIQIOM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 04:14:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVUfIMMPSqRCh82gCJoRdg83vBQiQP/Ircjm4qCbMJv+soXPdonVePhn4CzCkdBHZznvurmToJRN8tE5bR33i0Nsof5qcYE81rPU8PR4kStm/MiVe5ZR+RLId/mCZpe95SE6tnowtZ7EBLF2HUcIMFZOjPEOiyItS6OB8ajPkcq1kO8THGfHRrc9TxUJrI7n7EwsFcsHvoLE/dixjzoolJhaZBCpuDkcKwyOT1/g+tQeQUEj0NqlJk0m7BISf0XjlBvAROcrypo1kmZTMFs3hzBC/N3MTn/CPVpEVKJsrETKXyLLlGjiMKpTcJA8zakdZiGiq/sk0Lm9CGVrVe6HIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4gg+/cDFuAH89QzM6weYAxew64unjF9t9qJWkmCFhw=;
 b=QPeabudSnIBRrYrbHcHgm9c4bAT3wvWQV5bIMKmYR2JM33PbgjVG7458HyZaW6A4rQNKoFRfbVFLY5Y/Nm+EXvZ2L3JqgP45Rdn0MdlUDavFTF8X1PFoEMDVWpZeJbffV10Uus2XHfHXzCBW8e2QFTur+kQZcpVkbrXOsMFMG75xd6K1h2lmuiOUFzFoLGhowDVEcQpFovWhAyCe4yaZsvv8Mb5xXDWelhwiw7thiJKl6kM7dCE2t96cL5zhxOO4mfhjvnXLl4ZdX+KRQLUNTgLFwi8r0xRkaTxyJ0Zh/e5z1d5RYzow5LM7bVvkoAN6RlcLflue/xmypbQtzEr0zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4gg+/cDFuAH89QzM6weYAxew64unjF9t9qJWkmCFhw=;
 b=DmKb0XAgFY+Qz2XL09hW+Hw5B9NsphLNs4nZQC8skEupCd8/9DZROu4DgX9lZD5zul8dEfgD/AeWBK7+Y0cm45MFCRyp1i8rhj2xjVE4IU+9GtSJAeZ3rVJd4b5w7Znd6BhAqvZpFs6d8OfwtGapRrX6ZvmDiQS4cW17tU2yTzk=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY1PR01MB1817.jpnprd01.prod.outlook.com (2603:1096:403:5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 17 Sep
 2020 08:14:08 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3391.013; Thu, 17 Sep 2020
 08:14:08 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Jens Axboe <axboe@kernel.dk>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC] ata: sata-rcar: Fix .dma_boundary for WRITE DMA EXT
 timeout issue
Thread-Topic: [PATCH RFC] ata: sata-rcar: Fix .dma_boundary for WRITE DMA EXT
 timeout issue
Thread-Index: AQHWjBsY8CmjBbqlJ0aD8ZySDbq7OKlrJhoAgAFSIVCAAAIbgIAAAWPw
Date:   Thu, 17 Sep 2020 08:14:08 +0000
Message-ID: <TY2PR01MB3692CEF31253D7998258ECD7D83E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1600255098-21411-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXo6nRhR0hUB0iNvdZSsg1BCb9gDH7u+Z5+SNvmEfdtJg@mail.gmail.com>
 <TY2PR01MB36924032D54CCB7718F950EFD83E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdVje8bjH0E4pVUMs7+Q0QhCRw86WAiKGwBBW3G-NxrEDg@mail.gmail.com>
In-Reply-To: <CAMuHMdVje8bjH0E4pVUMs7+Q0QhCRw86WAiKGwBBW3G-NxrEDg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:60c8:88aa:cbfc:e299]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 841870f4-e9e9-4aef-4b9e-08d85ae1a6f4
x-ms-traffictypediagnostic: TY1PR01MB1817:
x-microsoft-antispam-prvs: <TY1PR01MB18178DE90AB5777C13E6D088D83E0@TY1PR01MB1817.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NbGD6m3ll6PGmhGcTDZ5xoQmTa/cfV6UQgcOfhiFXqkH3Z8YzTtbNpoiGdZsqRWhyWhmNcX5qaJ7jEAMGATtNuNXwjBmETMnzwEDeTj2v8Rsz1eY4/pT/Zjxg8Fxv+j8GRxvtRJ7sAiAw0HXeVsx9GYMGuj+n8E7H73YDmJ3exrFo2Ix2NRDAOVz6cNhd0zgCcYJ+JIsAwDcnNQDDVkXGYRq+El6CingjKWARYqwDQya/t9W4uKtnPNLTpevqoms560c6n6pff49O9pKR+fK4f+MiDVBBXLBg77WJ4LcG37OKnW2YlGv5zRBOm/iqGDhDIXo7wOboiHjZQaAhf08nU1OwL71BJcigOCbRE363PFvJJnKUKqHg/LzgTmrr56XDD8/v2a234e3sr3xglhLEuPR092gORZisx+nEsyD5NERygyFWHiRQlMI83nHSV4uXaBbMojBusXRVX5pA/k8Vg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(2906002)(6916009)(4326008)(33656002)(83380400001)(8936002)(7696005)(66946007)(76116006)(64756008)(86362001)(8676002)(66556008)(66476007)(66446008)(53546011)(6506007)(478600001)(71200400001)(186003)(316002)(54906003)(55016002)(5660300002)(52536014)(9686003)(142923001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: nR/mvd2/nNxLouxs59uG4EVCCv1bbH+BOo+Dt+zi1HhK2YGcPfj17TdgQ3xJxRTa2BBx15ebA1xUPI+VkatKV2FApIXB8c7I4zVTUSwvTxJjnSVlgPzMNiuGkJ/yRJXDqBn2OnZHdhUGjh+O7Lads2wBsBYMM+cQjZKvheDyMQScQ+lsmeIn03k6PJHG9gsuRc/tVqjAWDi+R4npRbsPSYCpxyVcC/ejOyT5WWTSReR0PuZFvwWxLn+6z7v8Vses+Y01+L6cuYdZSej4Ld3Lb3yr+WQNai7YDHTWyGdEaHdBeX+tvkaKEH5AM6sT93+rH0iyhaxyGNh6PGw9g4H52rS6B0Lf5xBOEDKJ+cMCRvr/nFXWuO+hm5mBijUB3yAHpoLmfAUEFLXpLPCAFWVoEbYy+KFtjTYSxGjNHwGPAqcSNMtGmuAlTD11OULIK89KGaHJbNysPh06lHzKVZGR7RLqOREAO8pl/GeJSFbCdXKi8c5FG/LeiH4jFryERSIECr7InR/aZbIARgQS/Kw+rtpHpajSYTxUb8W+yf2MEWilArZHF4dkwkZ+RDMvgq5P+qN+iGFjH3qT8nQgpZX73Ipg+F5aDpxmYoUMtk75K9aXWj5le9PBKL4p0VI1IHJaEd+4qlbzVxdd7C11iMmhdPax+CJBsw5Nnq4uySgdzEreC8uciKSM+SfmA/R7J4+oJDDpLxBQ13qRhRhfLk5+Gw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841870f4-e9e9-4aef-4b9e-08d85ae1a6f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 08:14:08.6325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VJe9qLYXCrAy8Ot47NffP59lXyqP0lnnpZ6Uwk2/Opxf6H8T2OseBkcPrQgE5F6LewZC1HnFdBavUjSrXA+38MOfWgsTmM9oYIh6MvQCe4cTmebStVWjf1geCp3KiADw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1817
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIFNlcHRlbWJlciAxNywgMjAyMCA1OjA1IFBNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4g
DQo+IE9uIFRodSwgU2VwIDE3LCAyMDIwIGF0IDEwOjAwIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+
IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBH
ZWVydCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDE2LCAyMDIwIDg6
NDggUE0NCj4gPiA+IE9uIFdlZCwgU2VwIDE2LCAyMDIwIGF0IDE6MjcgUE0gWW9zaGloaXJvIFNo
aW1vZGENCj4gPiA+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+
ID4gPiA+IFdoZW4gd2Ugd3JvdGUgZGF0YSB0byBhbiBTQVRBIEhERCwgdGhlIGZvbGxvd2luZyB0
aW1lb3V0IGlzc3VlDQo+ID4gPiA+IGhhcHBlbmVkIGFmdGVyIHRoZSBjb21taXQgNDI5MTIwZjNk
ZjJkICgiYmxvY2s6IGZpeCBzcGxpdHRpbmcNCj4gPiA+ID4gc2VnbWVudHMgb24gYm91bmRhcnkg
bWFza3MiKSB3YXMgYXBwbGllZDoNCj4gPiA+ID4NCj4gPiA+ID4gICAgICMgZGQgaWY9L2Rldi91
cmFuZG9tIG9mPS9tbnQvZGUxL2ZpbGUxLTEwMjRNIGJzPTFNIGNvdW50PTEwMjQNCj4gPiA+ID4g
ICAgIGF0YTEuMDA6IGV4Y2VwdGlvbiBFbWFzayAweDAgU0FjdCAweDAgU0VyciAweDAgYWN0aW9u
IDB4NiBmcm96ZW4NCj4gPiA+ID4gICAgIGF0YTEuMDA6IGZhaWxlZCBjb21tYW5kOiBXUklURSBE
TUEgRVhUDQo+ID4gPiA+ICAgICBhdGExLjAwOiBjbWQgMzUvMDA6MDA6MDA6ZTY6MGMvMDA6MGE6
MDA6MDA6MDAvZTAgdGFnIDAgZG1hIDEzMTA3MjAgb3V0DQo+ID4gPiA+ICAgICByZXMgNDAvMDA6
MDE6MDA6MDA6MDAvMDA6MDA6MDA6MDA6MDAvMDAgRW1hc2sgMHg0ICh0aW1lb3V0KQ0KPiA+ID4g
PiAgICAgYXRhMS4wMDogc3RhdHVzOiB7IERSRFkgfQ0KPiA+ID4gPg0KPiA+ID4gPiBTaW5jZSB0
aGUgY29tbWl0IGNoYW5nZWQgZ2V0X21heF9zZWdtZW50X3NpemUoKSdzIGJlaGF2aW9yLA0KPiA+
ID4gPiB1bmV4cGVjdGVkIGJlaGF2aW9yIGhhcHBlbnMgaWYgLmRtYV9ib3VuZGFyeSBvZiB0aGlz
IHNhdGEtcmNhciBkcml2ZXINCj4gPiA+ID4gaXMgMHgxZmZmZmZmZSBpbiBzb21ld2hlcmUgKG15
IGd1ZXNzKS4NCj4gPiA+ID4NCj4gPiA+ID4gQnkgdGhlIHdheSwgdGhlIGNvbW1pdCA4YmZiZWVk
NTg2NjUgKCJzYXRhX3JjYXI6IGNvcnJlY3QNCj4gPiA+ID4gJ3NhdGFfcmNhcl9zaHQnIikgY2hh
bmdlZCB0aGUgLmRtYV9ib3VuZGFyeSBhcyAweDFmZmZmZmZlLCBidXQgdGhpcw0KPiA+ID4gPiBu
dW1iZXIgaXMgcmVsYXRlZCB0byBBVEFQSV9ETUFfVFJBTlNfQ05UIHJlZ2lzdGVyLiBTbywgd2Ug
c2hvdWxkIHNldA0KPiA+ID4gPiB0aGUgLmRtYV9ib3VuZGFyeSBhcyBBVEFfRE1BX0JPVU5EQVJZ
ICgweGZmZmYpLCBhbmQgc2V0DQo+ID4gPiA+IC5tYXhfc2VnbWVudF9zaXplIHRvIG1pbigweDFm
ZmZmZmZlLCBkbWFfbWF4X21hcHBpbmdfc2l6ZSgpKS4NCj4gPiA+ID4NCj4gPiA+ID4gQWZ0ZXIg
YXBwbGllZCB0aGlzLCB0aGUgdGltZW91dCBpc3N1ZSBkaXNhcHBlYXJlZC4NCj4gPiA+ID4NCj4g
PiA+ID4gRml4ZXM6IDhiZmJlZWQ1ODY2NSAoInNhdGFfcmNhcjogY29ycmVjdCAnc2F0YV9yY2Fy
X3NodCciKQ0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciB5b3Vy
IHBhdGNoIQ0KPiA+ID4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBBcyBJIHdyb3RlIHRoZSBjb21t
aXQgZGVzY3JpcHRpb24sIEkgY291bGRuJ3QgZmluZCB3aHkgdGhlIGlzc3VlDQo+ID4gPiA+IHdh
cyByZWxhdGVkIHRvIHRoZSAuZG1hX2JvdW5kYXJ5LiBTbywgSSBtYXJrZWQgUkZDIG9uIHRoaXMg
cGF0Y2guDQo+ID4gPiA+IEkgd291bGQgYXBwcmVjaWF0ZSBpdCBpZiB5b3Ugd291bGQgZ2l2ZSBt
ZSBzb21lIGFkdmljZS4NCj4gPiA+DQo+ID4gPiBUaGVyZSdzIGFsc28gIltQQVRDSCB2Ml0gYXRh
OiBzYXRhX3JjYXI6IEZpeCBETUEgYm91bmRhcnkgbWFzayINCj4gPiA+IChodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1pZGUvMjAyMDA4MTEwODE3MTIuNDk4MS0xLWdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlLykNCj4gPiA+DQo+ID4gPiBJcyB0aGlzIHJlbGF0ZWQ/DQo+ID4gPiBEb2VzIG15
IHBhdGNoIGZpeCB5b3VyIGlzc3VlLCB0b28/DQo+ID4NCj4gPiBUaGFuayB5b3UgZm9yIHRoZSBp
bmZvcm1hdGlvbiENCj4gPiBZb3VyIHBhdGNoIGZpeGVkIG15IGlzc3VlIHRvby4gU28sIEkgdGhp
bmsgbXkgcGF0Y2ggc2hvdWxkIGJlIGRyb3BwZWQuDQo+IA0KPiBUaGFua3MgZm9yIHRlc3Rpbmch
DQo+IA0KPiBDYW4gSSBhZGQgeW91ciBUZXN0ZWQtYnk/DQoNClllcy4gVGhhbmtzIQ0KDQpCZXN0
IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
