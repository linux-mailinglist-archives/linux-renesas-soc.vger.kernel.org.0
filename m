Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 066D7F70C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2019 10:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfKKJbg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Nov 2019 04:31:36 -0500
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:4244 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726770AbfKKJbf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Nov 2019 04:31:35 -0500
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAB9Rnkv015948;
        Mon, 11 Nov 2019 04:31:16 -0500
Received: from nam04-bn3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2055.outbound.protection.outlook.com [104.47.46.55])
        by mx0b-00128a01.pphosted.com with ESMTP id 2w6v7aa73x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Nov 2019 04:31:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQFiZSXNLpEgFdph2WD2H2yTWrsNGOCCtvCOecpt3ZBauK38ZmN6//jEd6exP8bDIjlcGTjgOKLWPkBCQCEgxrYNjntq+++0sWG72BUG5VXc1cwp+khBOHE4HAuPy9LTEFc3h4s2wUBHr9UQwlfTYvx4uh9bbO4ZjzwUrPIoWu5A9AeF+HkWUkIA1QyRAmtokTUDHRx268Jpu+QbHvUhGAISVE0MTbKQ1gFVet1hJPNfgLYU3RDy9HwjTOgWsXfUUebhRHs4LjMEEpGRbsFAX+ROggN93pTGMD7nJLueer/Vb1PROr0i1WQRi/bfSNMY5tuX41+Uq0H9+ekG9Eq17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/B2rZDkhne6UGl/pnWPBTWb/l0O96FjaR3scAu9+z4E=;
 b=Dte7q5Ui9AQpw4KXt3COqedLF63MEDX2eEJEnlpL/hkursloiTBEE6Z6s7zYIwt0Y7lNjVacTGc3UDgXdrJW4WX7VAoAZ7R7GkZ8bhO+ykXFQIsaMSFZLW+8zWTPjAaDeEuOk7YPklObPOjfvS4EVMCl7LA0X8jj3uxq385OcIT5w3DlRxagxIkoTj8n6ch6t/R8QVNoAQ6wbHFU8mpXiwhDosbPqibZGw8jee+iEonq2c6fGDCxjFSbZGWD0wAhHnk6BbJXyF5k61mfuvXgmM4rk7nWRkmozN7HLjsU1Mcqhrj535rbL5lrE9IHcJOpTSke7iXhBTpl+pg/Lzx7TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/B2rZDkhne6UGl/pnWPBTWb/l0O96FjaR3scAu9+z4E=;
 b=kXmJXhCCXxl69f0bQx+bvNWY6sHWLWvHLns1foN1IvlTdPInYmm0fWXoHG2kVoPQ7ejnY+esywD1Dov9QUrsDI3f8A2nSihMS5dNaL84d2r3jD2N46/u6qJq1NXNTuLUYr6wdHxZpWaEqNFlPcRZVKmr+GViaODw5KBaLU8CcMc=
Received: from CH2PR03MB5192.namprd03.prod.outlook.com (20.180.12.152) by
 CH2PR03MB5254.namprd03.prod.outlook.com (20.180.4.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Mon, 11 Nov 2019 09:31:15 +0000
Received: from CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::99:71f2:a588:977c]) by CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::99:71f2:a588:977c%3]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 09:31:15 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "jsarha@ti.com" <jsarha@ti.com>,
        "horms@verge.net.au" <horms@verge.net.au>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "ce3a@gmx.de" <ce3a@gmx.de>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>
Subject: Re: [PATCH v3] clk: clk-gpio: propagate rate change to parent
Thread-Topic: [PATCH v3] clk: clk-gpio: propagate rate change to parent
Thread-Index: AQHVlgR4WDw8avjBmkqVept8rTPe66eBxWqAgAP0TgA=
Date:   Mon, 11 Nov 2019 09:31:15 +0000
Message-ID: <f219739b465f32d0f1b8fe75c137581a44257744.camel@analog.com>
References: <20191106113551.5557-1-alexandru.ardelean@analog.com>
         <20191108071718.17985-1-alexandru.ardelean@analog.com>
         <20191108210854.95C8C20869@mail.kernel.org>
In-Reply-To: <20191108210854.95C8C20869@mail.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4e72ce60-95cd-47de-8148-08d76689e649
x-ms-traffictypediagnostic: CH2PR03MB5254:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR03MB5254082E4DED19A942E78FB6F9740@CH2PR03MB5254.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(346002)(396003)(376002)(136003)(199004)(189003)(229853002)(186003)(8676002)(5660300002)(8936002)(11346002)(2616005)(99286004)(446003)(81156014)(81166006)(305945005)(7736002)(2906002)(6506007)(66066001)(102836004)(76176011)(26005)(71190400001)(71200400001)(2501003)(476003)(25786009)(36756003)(256004)(66476007)(4326008)(3846002)(6116002)(118296001)(6246003)(6512007)(66556008)(478600001)(6486002)(54906003)(486006)(66946007)(76116006)(66446008)(64756008)(6436002)(14454004)(86362001)(7416002)(316002)(2201001)(110136005);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR03MB5254;H:CH2PR03MB5192.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gKTmfvEu63ZeiRJFymRz03iVw+n0Vh/Sn4EQ0vTSgvAHvw62CpjTld2jV8mL3/OwCLaImweokK1loZhcmVDIW+h+paYmnJNwvJhh6h+UFoGeKknNj30AmND2811WDnDIhNFKY+8UhVMQJ+Uy58srhI2faeclnGa8rDGWqv9rqNdq9k5hU2SzSyjJkWoxSsm+Ma1YAtlqs0y3xYhV4fCuQksBhSCzPynKAkDSN0WlUUvzs2n0fC5IokkbsGXa/2ca+3HTh96hOOSkJ+jFd5DbFEVB/1zHT/pUmSD1SHSzOZ01MxDMxNZljqxr3bVzho3tVGSFwwd+U+HTsclaIVgNddmD+M/RuDgYU9/Kdl0VEr2V9T/vy6rSjGhRJxHY6uEsLVB1QRqnsfWsV2IOTifeJNEH2Dtis5FJhFz0jSYsqSy4n59x1gmb2QWDGQVeQ/+p
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C4D07FF9DA1804F84BE7DC3B13B638F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e72ce60-95cd-47de-8148-08d76689e649
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 09:31:15.4910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dqCWkNxTT9zAjMRIjIWBWleu/cqfrOcWGe8tIiPP37VaHHlmiKB+Mp43NkKa143cLYGAsk8IEzMJ4uPCoHpkiDhW/ZEPbqaOAis5errgpAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5254
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-11_02:2019-11-08,2019-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911110094
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gRnJpLCAyMDE5LTExLTA4IGF0IDEzOjA4IC0wODAwLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+
IFF1b3RpbmcgQWxleGFuZHJ1IEFyZGVsZWFuICgyMDE5LTExLTA3IDIzOjE3OjE4KQ0KPiA+IEZy
b206IE1pY2hhZWwgSGVubmVyaWNoIDxtaWNoYWVsLmhlbm5lcmljaEBhbmFsb2cuY29tPg0KPiA+
IA0KPiA+IEZvciBhbiBleHRlcm5hbCBjbG9jayBzb3VyY2UsIHdoaWNoIGlzIGdhdGVkIHZpYSBh
IEdQSU8sIHRoZQ0KPiA+IHJhdGUgY2hhbmdlIHNob3VsZCB0eXBpY2FsbHkgYmUgcHJvcGFnYXRl
ZCB0byB0aGUgcGFyZW50IGNsb2NrLg0KPiA+IA0KPiA+IFRoZSBzaXR1YXRpb24gd2hlcmUgd2Ug
YXJlIHJlcXVpcmluZyB0aGlzIHByb3BhZ2F0aW9uLCBpcyB3aGVuIGFuDQo+ID4gZXh0ZXJuYWwg
Y2xvY2sgaXMgY29ubmVjdGVkIHRvIG92ZXJyaWRlIGFuIGludGVybmFsIGNsb2NrICh3aGljaA0K
PiA+IHR5cGljYWxseQ0KPiA+IGhhcyBhIGZpeGVkIHJhdGUpLiBUaGUgZXh0ZXJuYWwgY2xvY2sg
Y2FuIGhhdmUgYSBkaWZmZXJlbnQgcmF0ZSB0aGFuDQo+ID4gdGhlDQo+ID4gaW50ZXJuYWwgb25l
LCBhbmQgbWF5IGFsc28gYmUgdmFyaWFibGUsIHRodXMgcmVxdWlyaW5nIHRoZSByYXRlDQo+ID4g
cHJvcGFnYXRpb24uDQo+ID4gDQo+ID4gVGhpcyByYXRlIGNoYW5nZSB3YXNuJ3QgcHJvcGFnYXRl
ZCB1bnRpbCBub3csIGFuZCBpdCdzIHVuY2xlYXIgYWJvdXQNCj4gPiBjYXNlcw0KPiA+IHdoZXJl
IHRoaXMgc2hvdWxkbid0IGJlIHByb3BhZ2F0ZWQuIFRodXMsIGl0J3MgdW5jbGVhciB3aGV0aGVy
IHRoaXMgaXMNCj4gPiBmaXhpbmcgYSBidWcsIG9yIGV4dGVuZGluZyB0aGUgY3VycmVudCBkcml2
ZXIgYmVoYXZpb3IuIEFsc28sIGl0J3MNCj4gPiB1bnN1cmUNCj4gPiBhYm91dCB3aGV0aGVyIHRo
aXMgbWF5IGJyZWFrIGFueSBleGlzdGluZyBzZXR1cHM7IGluIHRoZSBjYXNlIHRoYXQgaXQNCj4g
PiBkb2VzLA0KPiA+IGEgZGV2aWNlLXRyZWUgcHJvcGVydHkgbWF5IGJlIGFkZGVkIHRvIGRpc2Fi
bGUgdGhpcyBmbGFnLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgSGVubmVyaWNo
IDxtaWNoYWVsLmhlbm5lcmljaEBhbmFsb2cuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRydSBBcmRlbGVhbiA8YWxleGFuZHJ1LmFyZGVsZWFuQGFuYWxvZy5jb20+DQo+ID4gLS0tDQo+
IA0KPiBBcHBsaWVkIHRvIGNsay1uZXh0DQo+IA0KPiBOZXh0IHRpbWUgcGxlYXNlIHNlbmQgYXMg
YSBuZXcgdG9waWMgaW5zdGVhZCBvZiBhIHJlcGx5IHRvIHRoZSBvcmlnaW5hbA0KPiBwYXRjaC4g
TWFrZXMgaXQgZWFzaWVyIGZvciBtZSB0byBhcHBseSB0aGUgcGF0Y2guDQo+IA0KDQpBY2suDQpX
aWxsIGRvIHRoYXQuDQoNClRoYW5rcw0KQWxleA0K
