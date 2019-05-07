Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE0615733
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 03:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfEGBRc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 21:17:32 -0400
Received: from mail-eopbgr1400110.outbound.protection.outlook.com ([40.107.140.110]:17376
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726403AbfEGBRb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 21:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzEemokgPuxFtO8aedAj6lfs5KusY32BPHjMLyqIXgA=;
 b=oU+vtY5y5vNqNVPjecoT4UtRDhUOJoF6DnHi+z7Q9C6gOw/FB9UQ54oqjIzJp8cXz3zaX8K3opvYtLYa1D+nUruFbTL5HlCBlrc4nZ73xM60CoporH6/LAJ9wVxEwwnUZJbLjlnCHU26YjDAXBd3JxIwhjPeszS2DLfiUY7VdyA=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1626.jpnprd01.prod.outlook.com (52.133.162.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 01:17:28 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 01:17:28 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 02/10] dt-bindings: rcar-gen3-phy-usb2: Document
 uses_usb_x1
Thread-Topic: [PATCH 02/10] dt-bindings: rcar-gen3-phy-usb2: Document
 uses_usb_x1
Thread-Index: AQHVBGYWK9KXsXZxSESXZWxCUu8ERaZe2UAAgAAC8EA=
Date:   Tue, 7 May 2019 01:17:27 +0000
Message-ID: <TY1PR01MB15624938ECBFD6607B8827198A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-3-chris.brandt@renesas.com>
 <CAL_Jsq+LkTXMv+YpHyLcGh4ztUMmz2dSfnzcHXymHi-_VMi_KA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+LkTXMv+YpHyLcGh4ztUMmz2dSfnzcHXymHi-_VMi_KA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99842f38-1b52-43b2-82be-08d6d289c560
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1626;
x-ms-traffictypediagnostic: TY1PR01MB1626:
x-microsoft-antispam-prvs: <TY1PR01MB162658BC4C064C2E505C0B138A310@TY1PR01MB1626.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(136003)(39860400002)(346002)(396003)(199004)(189003)(305945005)(74316002)(9686003)(3846002)(558084003)(66946007)(73956011)(66446008)(66476007)(64756008)(4326008)(8676002)(33656002)(26005)(229853002)(66556008)(76116006)(8936002)(6506007)(102836004)(2906002)(55016002)(446003)(11346002)(7736002)(52536014)(81156014)(486006)(186003)(6436002)(81166006)(476003)(25786009)(478600001)(14454004)(68736007)(54906003)(6116002)(72206003)(5660300002)(256004)(71200400001)(71190400001)(66066001)(316002)(76176011)(53936002)(99286004)(6246003)(86362001)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1626;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BkNzECtpGiqZ5X7Uz/SyhxEhZBhkS84tKBdmSvjiKfzYg60SvOcrQEujt3EmLm0dZADLZ8n4s1l1dQLNooZvVFjsIWVAxwSTADdihQVVXfyruXvegyTDm5W3Un4wmIJRMLdqJJkT8Z3C/SLt82EX2bzGkQUZlBnx8GrYNJqWQHMBoercgPdEIw0TGAohG8HAhom7J38QvPLyCyUBtL3egFLmqMSQalv0LWpU9jmHVpHo+dQukTLOUEct87AAGC8zX+Kcuh8qF3r4+bT9UXLe4sVEZFdVNdJ8qMHE9jYtHxkMrgfDRhpz1+GP5jKJGxr91T3EAz/KxbweN3P5HDDQm4HbvETRxL30lffYN8gdsm8r1+EskDUbEVYZ/zq9wHvnUUfDPa7zYaccGMCjcSlSiCapqrUnEZVTZ3dK/minjkQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99842f38-1b52-43b2-82be-08d6d289c560
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 01:17:27.9290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1626
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gTW9uLCBNYXkgMDYsIDIwMTksIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiA+ICstIHJlbmVzYXMs
dXNlX3VzYl94MTogYm9vbGVhbiwgdGhlIGRlZGljYXRlZCA0OE1IeiBjcnlzdGFsIGlucHV0cw0K
PiBVU0JfWDEgYXJlDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICB1c2VkIGZvciB0aGUgUExM
IHNvdXJjZQ0KPiANCj4gcy9fLy0vDQoNCkdvb2QgcG9pbnQuDQpUaGFua3MuDQoNCg0KQ2hyaXMN
Cg0K
