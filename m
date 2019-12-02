Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F86B10E6B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 09:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfLBIJ4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 03:09:56 -0500
Received: from mail-eopbgr1410118.outbound.protection.outlook.com ([40.107.141.118]:10255
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726057AbfLBIJz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 03:09:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifKhcJ9V34iKYwIjN7OjrbMJ86CahHxElFHgQ5cQk+ya/J9HsmdOZrz3c+fgOe5YdGSMFsc10XHwqJlMd2yOkz8Ck39vnafvV6Jsxm+7+k9vJxiTbkBE5Y3o42ffyVHar4w1HH7sTR+jrtT+UyHwfBkUQRrgnlUL0uHsy95WfqfORet2YioH9lSHAM9XBjLBYQj5orQ6lm2EEyxfNgSI5fUbmGHkGWlH4mEGsysrWpjDDlvIFS5hR3w6xUMZyfrzhu1a6v4Wo7dac04Uv5Dl59ZqSkhQnC//JMog+8qF8SE9frybOa2vndg6PWcnd8WLBBd9xWWjRDIt0au9U2juwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUK+sp8YRYDiAp8B5VtQa7DI1G3Ivgfg8ZHbW8AV9Ak=;
 b=OTEqGGk4uewGR4bZZdDO1Kmj3vqkkJo+Wrjs7IZJfqrWLMFa5zTxJT6O7nkXk/M9WmahUjMuclldgeEPkmUR5lLgE22cxFv4vurG3cJJ1MPMuDGH/sAaDJgS4X01Q7SaC3UuKoTfXmbYRFSDLp3ans9bOD4vjyxDbUaF5oepKlpnVsW7zlE0BucoVW8qJ6cRofOEenKOCruWyri/FbjIgFFl12TexiXWVt1PepeC8zPnJbkdXJl/f3q4iy5ie7riiscP3f6+zlX2ut75jmXzKWu4quscTWNcJgz+z0zS/HrZfcuv3rn3Wi7lgJ1EW2GB5rSRK9/B6gKtOKi0k4LJng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUK+sp8YRYDiAp8B5VtQa7DI1G3Ivgfg8ZHbW8AV9Ak=;
 b=FkaU3iq1FY2xAvHAzP5b2eUs2Rf+OlHdzxFhe2GCyEEE1kSV99iGCCdhtW0zkj8mgLGIm4Hu5lNz45+n+MmnKfRS+39pP1Fl8uUfe5Qdv2CmxcfqJHa8mrgMr4FNPBeGZulWhDioWfRB/KoxiLIAGSuQMw7cghK1CeR9D1xa4DQ=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2143.jpnprd01.prod.outlook.com (52.133.177.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.21; Mon, 2 Dec 2019 08:09:52 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6998:f6cf:8cf1:2528]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6998:f6cf:8cf1:2528%5]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 08:09:52 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulrich Hecht <uli@fpond.eu>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 0/4] mmc: host: renesas_sdhi_sys_dmac: change
 dma_buswidth
Thread-Topic: [PATCH RFC 0/4] mmc: host: renesas_sdhi_sys_dmac: change
 dma_buswidth
Thread-Index: AQHVoPwEOlCLcLTQAk2sBgtH9T8iNaedS0CAgAlAo4A=
Date:   Mon, 2 Dec 2019 08:09:52 +0000
Message-ID: <TYAPR01MB45446A5988FFD329A45C9A22D8430@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1619526348.1354132.1574765125512@webmail.strato.com>
In-Reply-To: <1619526348.1354132.1574765125512@webmail.strato.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a283ce8d-1eaf-41a4-f200-08d776ff0240
x-ms-traffictypediagnostic: TYAPR01MB2143:
x-microsoft-antispam-prvs: <TYAPR01MB21438FA707163F9970CBB5ACD8430@TYAPR01MB2143.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(189003)(199004)(66066001)(6246003)(6916009)(86362001)(4326008)(3846002)(305945005)(74316002)(6116002)(102836004)(6506007)(7696005)(8676002)(81166006)(8936002)(7736002)(52536014)(256004)(81156014)(76116006)(316002)(66946007)(966005)(66556008)(66476007)(33656002)(14454004)(76176011)(64756008)(66446008)(186003)(26005)(99286004)(6306002)(5660300002)(71200400001)(25786009)(2906002)(71190400001)(55016002)(229853002)(6436002)(478600001)(9686003)(446003)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2143;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kSul94He3dRGTe1Bolq3UQPThgojWXdDpkNCBCoD0BCSlx8+VNHyrUwIRz+/rknds90EJcG9ZkhPP5CmbBteSbz3PoMeGukS0H78bM3CUEQwhqIiE7ZCU28dRN50tjoaGDdmqsY2oZQbqqPP6WlQ2FXmTJgXqtKjijklz5Hg991yG6Db2BvZPAgLA2zn7yztQ4cDk2QTdDYfjWwZ/4unVCJb/hK+jKOdBOGur9wpiomigLbWiQfjtbVltRvUURKpIDLfkaUcY2zGNUuRaCG2yZ63by363X23jgR4kM7ZHJOpjPMSxgx3sYB8SDJc4bS2CVE5zXgM5+cW+gMIPeqET4XkPtdOBVv9QPuXsE3oINyrvBGHIbdCoci3R8cL93Su8UzEa3MMB6vSwlnHvJIvCIjC+XTPIvJXVHnzgZcrhqwLZai//f7QjnZp+11lrlgt2EIyiqrNwnhgdgtABK0RsKcXORuyWZZoNADoe81r8GM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a283ce8d-1eaf-41a4-f200-08d776ff0240
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 08:09:52.1693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6CpHVTa4qcbUGKzbqM/rVI3FKHDJHePb3Gs3DrHBXXiA5hB1cbdnSeNBpiCAnnRzbkEGjn+/ZO38nKcZqB0QvMW0jahgLwz2/Sfi2HEzm4LYtMxRDF1rg7Csbrgiv5Lc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2143
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVWxyaWNoLXNhbiwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnQhDQoNCj4gRnJvbTog
VWxyaWNoIEhlY2h0LCBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAyNiwgMjAxOSA3OjQ1IFBNDQo+
IA0KPiA+IE9uIE5vdmVtYmVyIDIyLCAyMDE5IGF0IDc6MTMgQU0gWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+DQo+ID4g
VGhpcyBwYXRjaCBjYW4gaW1wcm92ZSBwZXJmb3JtYW5jZSB3aGVuIGEgc2QgY2FyZCB0cmFuc2Zl
ciBzaXplDQo+ID4gaXMgbXVsdGlwbGVzIG9mIDMyIGxpa2UgYSBzZCBtZW1vcnkgY2FyZC4gSG93
ZXZlciwgdGhpcyBtYXkNCj4gPiBkaXNpbXByb3ZlIHBlcmZvcm1hbmNlIHdoZW4gYSBzZCBjYXJk
IHRyYW5zZmVyIHNpemUgaXMgbm90DQo+ID4gbXVsdGlwbGVzIG9mIDMyIGJlY2F1c2UgdGhpcyBw
YXRjaCB1c2VzIFBJTyBpbnN0ZWFkIG9mIFNZUy1ETUFDLg0KPiANCj4gSSBoYXZlIGxvZ2dlZCB0
aGUgRE1BIHRyYW5zZmVyIHNpemVzIG9mIGEgTWFydmVsbCBTRDg4OTcgV2lGaS9CVCBjaGlwLCBh
bmQgdGhlcmUgdHJhbnNmZXJzIHRoYXQgYXJlIG5vdCBtdWx0aXBsZXMgb2YgMzINCj4gYXJlIGlu
ZnJlcXVlbnQgKGV2ZXJ5IHNlY29uZCBvciBzbykgYW5kIHNtYWxsICgxODQgYnl0ZXMpOyBhbGwg
bGFyZ2UgdHJhbnNmZXJzIGFyZSBtdWx0aXBsZXMgb2YgMzIuDQo+IA0KPiBXb3VsZCBpdCBiZSBw
cmFjdGljYWwgdG8gc3dpdGNoIHRoZSBETUEgYnVzIHdpZHRoIGRvd24gaWYgb2RkIHNpemVzIGFy
ZSBlbmNvdW50ZXJlZCwgYW5kIGJhY2sgdXAgYWdhaW4gb3RoZXJ3aXNlPw0KDQpJIGRvbid0IGtu
b3cgd2h5LCBidXQgYWNjb3JkaW5nIHRvIGRyaXZlcnMvZG1hL3NoL3JjYXItZG1hYy5jLCB3ZSBz
aG91bGQgbm90IGNvbmZpZ3VyZSB0aGUgY2hhbm5lbCB3aGlsZSB1c2luZyBpdC4NCmh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dC90cmVlL2RyaXZlcnMvZG1hL3NoL3JjYXItZG1hYy5jP2g9djUuNCNuMTI0NQ0KDQpUaGUgY29t
bWVudCBoYXMgYmVlbiBkZXNjcmliZWQgb24gdGhlIGZpcnN0IGNvbW1pdC4gQnV0LCBzaW5jZSBv
dGhlciBkcml2ZXJzIGRvbid0IG1lbnRpb24gc3VjaCBhIGxpbWl0YXRpb24sDQpJIHRoaW5rIHdl
IGNhbiByZW1vdmUgdGhlIGNvbW1lbnRzIHNvbWVob3cuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hp
aGlybyBTaGltb2RhDQoNCj4gQ1UNCj4gVWxpDQo=
