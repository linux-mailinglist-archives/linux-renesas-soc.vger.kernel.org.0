Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900E91F16D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 12:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbgFHKjB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 06:39:01 -0400
Received: from mail-eopbgr1320099.outbound.protection.outlook.com ([40.107.132.99]:44992
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729300AbgFHKjB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 06:39:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LstNTTJ6rB4+RZC9bG9+veSMdP2em8WA2b37CIsIxVFcBf5XzUGDNKsF9VUVMUuWZyGN748I8GJYZqC9/LXyWXU7dUNGrEd5+eTMiJD8Gnkn1fh2XJAyZLmCmwifbo/JdL7iYzbN8UHrSPd/MJYhn6xxYTsnjmghkkBBf2HPZIa0hmvnLzAVaGHabCwcGsuB7XmJuJfQGIE0LvpvCrBT8GDfXvip4KXOVjdOwJGfHd8NNdyBv1qLdgfSxQe1V6Aj05EWhOjyyDn+Uq7qz1MgqkGF3eSByfQyFcSEYpw7mcdtEm5aFNxqVnYJiTY71czalVw4R/Tw9Glk63MBYE+1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faadxQyVMyGr8ulMZ8vX+n4CfsAkPPkwr/6xN6uWoZo=;
 b=kSV5CnzVrL1plkwTN7pEfJKgkFI1KI0dJuyiYCpnX71VD32coYoKV7KvDh9GMIIes8ff7S9di4Xeb9pyaPR1lesW0Iwgw6wpeYh9rqwgdxJkcqrwq9TXR9AR8kAKWSB2FedOJPItrdaZ9dmzlM51YH9/J2pS0f9Va5uNvKAUM/6M9wLP5EBZL9cKEv57gjrytRwwBItbuL4NGKkh4JDDy7dtuNH9JFaWT8cYbf2RhXIRMboVs3AUjodLHAJMvCpCAHxArXByVSG2d2SDVdeXAzgbf8rvZKCiDN21+WlQH5NiO8RHHL8+U38yqHncttxpVPV5SeksXfTRzAgCG8AbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faadxQyVMyGr8ulMZ8vX+n4CfsAkPPkwr/6xN6uWoZo=;
 b=R0Miexagv6XPrPaxlKwV9kpdkzQq9hzSSpTfzwPYx8qXRQdPYYO32dV+j4LuavvHBhDMEmqEhUtLAOwGkznvTcjQxR3vW/5iZKVFLwiYLBNLmzL4mtE1iOxJEaEo8JXYMiByMBNZHTlPtAQMYUk//OlB563hgLsM8c4zcYWHBIk=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3339.jpnprd01.prod.outlook.com (2603:1096:404:d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 10:38:57 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 10:38:57 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] mmc: core: Issue power_off_notify for eMMC
 Suspend-to-RAM
Thread-Topic: [PATCH/RFC] mmc: core: Issue power_off_notify for eMMC
 Suspend-to-RAM
Thread-Index: AQHWLdFW4LWb0SXvbUyfh/OMYFhgGajOeUEAgAATlzA=
Date:   Mon, 8 Jun 2020 10:38:56 +0000
Message-ID: <TY2PR01MB3692ECD6F9945379A91CB345D8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1589887988-7362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAPDyKFq5yueXp4NW2fj3tvPRv0S_VDM1khAw51VeEHxG79qp+Q@mail.gmail.com>
In-Reply-To: <CAPDyKFq5yueXp4NW2fj3tvPRv0S_VDM1khAw51VeEHxG79qp+Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 521236ba-a0cf-4668-3464-08d80b9825dd
x-ms-traffictypediagnostic: TY2PR01MB3339:
x-microsoft-antispam-prvs: <TY2PR01MB3339B4AC2334288919AD95E0D8850@TY2PR01MB3339.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 18dB8gLMOTLiQl7VCXwTjH04z8F72P69bWu1zKyGjlnk6gwsuMAoWqaMKDmBn3ykzxM4RPeUpI5uLzr75oJkS/5yUw1Cyr8CI/hRy0i5oOOXdtca7Qm7hCtaJGCfpVtgzr+A1FSjxmmDD+dinA9OhX0KusYjWPlskChtDupxNVR4SYBlDouYcKMReDbR2xZKbIkCVcLCHtAO1HmfciQH/dZQT9EQ4eOysFYmu2ZkwRHsqGPVoyQOU4Da8EumXr2UxHz+BqVguDVebDvbBkbbQxQAF5Q9yinJVhsmRnCtzwlzUhuAwAbNEjnxXXEjLSxNpLiHwnZ8Ss9/r1/BCmYKhA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(54906003)(316002)(4326008)(8936002)(6916009)(9686003)(8676002)(7696005)(186003)(86362001)(26005)(83380400001)(52536014)(33656002)(2906002)(5660300002)(15650500001)(64756008)(66446008)(478600001)(66556008)(66946007)(55236004)(71200400001)(76116006)(55016002)(66476007)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: OapNh4e/Pafh93UQ10ZNWzWB3Q3tJeaws7rKns1wXYyk39vGIwRk668W1XO5UuRE7BhOY+hB+bMHL9nRdv48GQwnHdiPJcumO1dN6s0pzDVX4DESNGLDae390hb6Xjs9p4S5KQSEZaopZYHX5gfRUKJai+V5UFTIzUXFm06xzSqF4Qji1jaiuz4SPYemgMmH0L7q3Eudh7QltvGpFtTVT24Y2wUhAX70Vxrzx14tq7x90c9fmHRskx2IkiU00ONUivY+ESXtrGLvwpyCyW8qA98eSthJYZagg630rLVGoVWo9NKSvmOgeeE7BFjoNqzX4jt77JXMnL7WGUM5m0TYIUEBprCXOPGWTadiUlh63dm0253DPrnW/z6bqWYR5PiD4otfdFIUzHqVSTk2Mrf5Njz+KQlF1PZikaYhoiH5ImhYgA9PILgOGl1dHKytm5cwB5gITkg3LVcIv92VuToH1TRiy8Sehbsl2hIrFWRF+CmejXEeuedAhPoLnCFIWgCA
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521236ba-a0cf-4668-3464-08d80b9825dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 10:38:56.9974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5hUAgsiLFxKeajWhLvHlKLh3Ut1JTM4x/QWIhFF70rECvrpv5U+GpPisYP34MTOEbOTf6jpuHoL0ly0sE9HfNVtfujgzU/3fQbChQrlHzb3vnLhGb6ffRHU4iGxStcML
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3339
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVWxmLA0KDQo+IEZyb206IFVsZiBIYW5zc29uLCBTZW50OiBNb25kYXksIEp1bmUgOCwgMjAy
MCA0OjU3IFBNDQo+IA0KPiBPbiBUdWUsIDE5IE1heSAyMDIwIGF0IDEzOjMzLCBZb3NoaWhpcm8g
U2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
DQo+ID4gVGhlIGNvbW1pdCA0MzIzNTY3OTM0MTUgKCJtbWM6IGNvcmU6IEVuYWJsZSBwb3dlcl9v
ZmZfbm90aWZ5IGZvcg0KPiA+IGVNTUMgc2h1dGRvd24gc2VxdWVuY2UiKSBlbmFibGVkIHRoZSBw
b3dlciBvZmYgbm90aWZpY2F0aW9uDQo+ID4gZXZlbiBpZiBNTUNfQ0FQMl9QT1dFUk9GRl9OT1RJ
RlkgKE1NQ19DQVAyX0ZVTExfUFdSX0NZQ0xFIG5vdykgaXMNCj4gPiBub3Qgc2V0LiBIb3dldmVy
LCB0aGUgbW1jIGNvcmUgbGFja3MgdG8gaXNzdWUgdGhlIHBvd2VyIG9mZg0KPiA+IG5vdGlmaWNh
aXRvbiB3aGVuIFN1c3BlbmQtdG8te1JBTSxEaXNrfSBoYXBwZW5zIG9uIHRoZSBzeXN0ZW0uDQo+
IA0KPiBUaGlzIGlzbid0IGFuIGVudGlyZWx5IGNvcnJlY3QgZGVzY3JpcHRpb24sIEkgdGhpbmsu
DQo+IA0KPiBJZiB0aGUgaG9zdCBzdXBwb3J0cyBNTUNfQ0FQMl9GVUxMX1BXUl9DWUNMRSAoYm90
aCB2bW1jIGFuZCB2cW1tYyBjYW4NCj4gYmUgcG93ZXJlZCBvbi9vZmYpLCB3ZSB1c2UgcG93ZXIt
b2ZmLW5vdGlmaWNhdGlvbiBkdXJpbmcgc3lzdGVtDQo+IHN1c3BlbmQsIGluIGNhc2UgdGhlIGVN
TUMgY2FyZCBhbHNvIHN1cHBvcnRzIGl0LiBPdGhlcndpc2Ugd2Ugc2VuZCB0aGUNCj4gc2xlZXAg
Y29tbWFuZC4NCg0KWWVzLg0KDQo+IFRoaXMgYmVoYXZpb3VyIHdhcyBkZWNpZGVkIG9uIHB1cnBv
c2UgYW5kIGl0J3MgbWFpbmx5IGJlY2F1c2Ugd2l0aG91dA0KPiBNTUNfQ0FQMl9GVUxMX1BXUl9D
WUNMRSwgd2UgYXNzdW1lIHRoYXQgdnFtbWMgcmVtYWlucyBhbHdheXMtb24uIEluDQo+IHRoaXMg
Y2FzZSwgaXQgc2ltcGx5IHNlZW1lZCBiZXR0ZXIgdG8gdXNlIHRoZSBzbGVlcCBjb21tYW5kLCBy
YXRoZXINCj4gdGhhbiB0aGUgcG93ZXItb2ZmLW5vdGlmaWNhdGlvbiwgYXMgd2UgYXJlbid0IHJl
YWxseSBnb2luZyB0byBkbyBhDQo+IGZ1bGwgcG93ZXIgb2ZmIGFueXdheS4NCg0KSSB1bmRlcnN0
b29kIGl0LiBIb3dldmVyLCBvbiBteSBlbnZpcm9ubWVudCAocjhhNzc5NTEtc2FsdmF0b3IteHMp
LA0Kd2hpbGUgdGhlIGJvYXJkIGlzIGVudGVyaW5nIFN1c3BlbmQtdG8tUkFNLCB0aGUgdnFtbWMg
YW5kIHZjYyBhcmUgdHVybmVkIG9mZi4NClNob3VsZCBJIGFkZCBhIG5ldyBmbGFnIGZvciBzdWNo
IGVudmlyb25tZW50Pw0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
