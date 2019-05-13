Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 362F51BF14
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 23:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfEMVZE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 17:25:04 -0400
Received: from mail-eopbgr1410138.outbound.protection.outlook.com ([40.107.141.138]:64881
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726174AbfEMVZE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 17:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=curbOe6y4+LRalu7SzRex+GBv4bNNTIJcfZT1JnrFZE=;
 b=pdDvf4zrGXZ6QNAG3X+qDyMSFmxCi86jRxU6iwSMuZQd9yN/knsHEKNVRu1NXFlrLXUh0RYlg4LJvwxJFe7iK3yXOf/iu1i5SMgdgG4ru11Rjh8rqfqPGk3WKz5mWCLiJOzRNApq0psMCe9AMAWhwAfF+1fQtCtcyON1Gc3FuXM=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1850.jpnprd01.prod.outlook.com (52.133.162.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.26; Mon, 13 May 2019 21:24:58 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 21:24:58 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of
 usb_x1
Thread-Topic: [PATCH v2 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use
 of usb_x1
Thread-Index: AQHVBqOYsuCwxtDR8keHVZxRUSw6I6ZjxxkAgAAmQYCABaN70IAAAvCAgAAC24A=
Date:   Mon, 13 May 2019 21:24:58 +0000
Message-ID: <TY1PR01MB1562A3374EEF161331BFD6C48A0F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-5-chris.brandt@renesas.com>
 <OSBPR01MB3174A8008FF1E216893398E8D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <CAMuHMdVVoYak4FGEOYK_dGLCLEQ7avVCv5AcY43BPkDnt7OZ4w@mail.gmail.com>
 <TY1PR01MB15620F606FDE4AF0C446213E8A0F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdU5UaOXXkVVr88fCG2xO702RuYbbGeyNOPLFb01G6RU-w@mail.gmail.com>
In-Reply-To: <CAMuHMdU5UaOXXkVVr88fCG2xO702RuYbbGeyNOPLFb01G6RU-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [24.206.39.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b65a26d1-8217-4668-4126-08d6d7e97398
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1850;
x-ms-traffictypediagnostic: TY1PR01MB1850:
x-microsoft-antispam-prvs: <TY1PR01MB1850C1DC42EDD60879E702658A0F0@TY1PR01MB1850.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(396003)(346002)(136003)(366004)(199004)(189003)(3846002)(6116002)(305945005)(4744005)(7736002)(11346002)(446003)(68736007)(81166006)(8676002)(229853002)(81156014)(72206003)(8936002)(186003)(102836004)(26005)(6916009)(14454004)(478600001)(6506007)(76176011)(99286004)(7696005)(52536014)(9686003)(6246003)(55016002)(53936002)(74316002)(256004)(4326008)(66066001)(54906003)(25786009)(6436002)(33656002)(71190400001)(66446008)(64756008)(71200400001)(66476007)(66946007)(76116006)(2906002)(73956011)(316002)(486006)(66556008)(5660300002)(86362001)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1850;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aL2z+BN9FQSdSnB8UwhkBZHmTqtKsn0c6gkrwQDNVhXcLQPpndspI2mAfjLY8QJlNXw6QEj0aN9AHvvyYuG0UApd4H4ODSBuW6Plvk6WNhX5njU8i9fmgRZlCoUCsu5Cu3ogEpiO/Kd9uKg0RzXoocERpRu9kKKhYdemPBoO8mvLkaqPNxM7LJ7RjwTyRUvlMDrJDl9HnY93UwM89gJoohDIBQBhMQRy9SNiGr7Xth1YW0ddMs0K3KtXDuAKsX2Gs1WD/z5xmaGHovvabLrwi8h6QBygjmof8UBoAyNhzrbxyCSzsdMcFMivNR+xfSyDNXDm2nyiXKI6l06SreBJdAZU1fT2Eq3C+K4fIabiV75HqMLJ1Lcr8hqE7g03A4+pOgjcLFfVx18xhfcgW6xaGkjz3D3MDGlzeETss4jUdY8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65a26d1-8217-4668-4126-08d6d7e97398
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 21:24:58.3882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1850
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHF1aWNrIHJlcGx5Lg0KDQoNCk9uIE1vbiwg
TWF5IDEzLCAyMDE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+ID4gW3BoeS1yY2FyLWdl
bjMtdXNiMi5jXQ0KPiA+ICAgICAgICAgdXNiX3gxX2NsayA9IGRldm1fY2xrX2dldChkZXYsICJ1
c2JfeDEiKTsNCj4gPiAgICAgICAgIGlmICghSVNfRVJSKHVzYl94MV9jbGspKSkNCj4gPiAgICAg
ICAgICAgICAgICAgaWYgKGNsa19nZXRfcmF0ZSh1c2JfeDFfY2xrKSkNCj4gDQo+IGlmICghSVNf
RVJSKHVzYl94MV9jbGspICYmIGNsa19nZXRfcmF0ZSh1c2JfeDFfY2xrKSkNCg0KOikNCg0KDQo+
ID4gSXMgdGhpcyBjb3JyZWN0Pw0KPiANCj4gRXhhY3RseSENCg0KVGhhbmsgeW91IQ0KDQojSSdt
IHRyeWluZyB0byBhdm9pZCBhIHY0DQoNCg0KQ2hyaXMNCg==
