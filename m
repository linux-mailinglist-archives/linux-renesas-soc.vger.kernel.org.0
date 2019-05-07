Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA2D16C32
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 22:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfEGU1Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 16:27:16 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:65342
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726295AbfEGU1Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 16:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEkMWcX6HsBOxYZkqcwobddpvndEpU5m9hFIBHHReHc=;
 b=ToUZDcuhyo3wJAu2LAzJv/dgaxKJkeZxApcspJ2gceHNLWxDq4e9PnYLYys2iHhBvfu6QlnehdJyRdSsdl4XxrLbEioBPWN4Nj2wKG6fVMQ75/AzhV82Pq9Ie3TjFMXW36xQzLnl3S4/WeaEwf+oTNUnVBhplXaIvRedNiAFnHo=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1788.jpnprd01.prod.outlook.com (52.133.160.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Tue, 7 May 2019 20:27:12 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 20:27:12 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1
 option
Thread-Topic: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1
 option
Thread-Index: AQHVBGYQ+cfCaNX+ik+H7Wxy1mef+qZfTXmAgAB2sVCAABgIAIAANL0g
Date:   Tue, 7 May 2019 20:27:11 +0000
Message-ID: <TY1PR01MB1562A5D204AD0104862D09FE8A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-2-chris.brandt@renesas.com>
 <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
 <TY1PR01MB15621F21D3A3F1F550D85CD68A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWBR-069LJZ12pe1azystGp7egzYjKYFVkuRwMoukvzrQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWBR-069LJZ12pe1azystGp7egzYjKYFVkuRwMoukvzrQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [24.206.39.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ba0c359-612e-43db-7b70-08d6d32a62ff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1788;
x-ms-traffictypediagnostic: TY1PR01MB1788:
x-microsoft-antispam-prvs: <TY1PR01MB178808FCD52A97D10AD133E48A310@TY1PR01MB1788.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(229853002)(6436002)(4744005)(25786009)(186003)(6116002)(6246003)(55016002)(7736002)(99286004)(5660300002)(11346002)(9686003)(76176011)(102836004)(68736007)(7696005)(6506007)(72206003)(54906003)(53936002)(8936002)(14454004)(446003)(316002)(486006)(478600001)(81156014)(8676002)(81166006)(476003)(33656002)(4326008)(71190400001)(71200400001)(6916009)(86362001)(256004)(26005)(66946007)(66446008)(64756008)(3846002)(73956011)(76116006)(66476007)(66556008)(66066001)(305945005)(74316002)(2906002)(52536014);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1788;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jRijiSlj7rsN6h/BkV/ObW10f9rnVCgs6c/9TFLSfakIwHDbiGn4Cs+VrzVkUD6OSWc9DSMgV5TBtMoBL8SO9pX7Z8NmyazDlzvFndQKhFh/dBAJDtL1IjvuVwsd6WcgMK0usHm/HAAjFk7UAFx/LSf819hAOMpM7YE3/FxkkuwztX6IR9+z5LnjLk+sp1rSNUYbpeEFP1wQVLX/hdqJXqjFGoEAikwx+VDlciDKXH7/yKJzp0k7RPbvqTpuyMQnYDJO7twJtYDLSSGprXj23etZs1REguID9GHjwD5lh0w1SNeXmumfOgN2n6Fw1q6DhqA2UwdoJO9mLYWSiq7iIqxaZvhds724onMZ2XLU9VXCv+tmG2sY9nBtBX/eeJfA6njyrX2aIwOJudIzcHWjf9cZIiOVyuAWQQhl6njUt9g=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba0c359-612e-43db-7b70-08d6d32a62ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 20:27:12.0039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1788
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFR1ZSwgTWF5IDA3LCAyMDE5IDEsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToNCj4gPiBTbyB3aXRoIHRoYXQgc2FpZCwgZG9lcyBhIHVzZXMtdXNiLXgxIHByb3BlcnR5
IG1ha2UgbW9yZSBzZW5zZT8NCj4gDQo+IE5vIDstKQ0KDQpTby4uLi4NCg0KSSBndWVzcyB0aGUg
Zmlyc3QgcGF0Y2ggaW4gdGhlIHNlcmllcyBuZWVkcyB0byBhZGQgdGhpcyB0byB0aGUgLmR0c2k6
DQoNCgl1c2JfeDFfY2xrOiB1c2JfeDEgew0KCQkjY2xvY2stY2VsbHMgPSA8MD47DQoJCWNvbXBh
dGlibGUgPSAiZml4ZWQtY2xvY2siOw0KCQkvKiBJZiBjbGsgcHJlc2VudCwgdmFsdWUgbXVzdCBi
ZSBzZXQgYnkgYm9hcmQgKi8NCgkJY2xvY2stZnJlcXVlbmN5ID0gPDA+Ow0KCX07DQoNClRoZW4g
SSBjYW4gcmVmZXJlbmNlICJ1c2JfeDEiIGluIHRoZSBkcml2ZXIgYW5kIHNlZSBpZiBpdCBpcyBz
ZXQgdG8gDQpub24temVyby4NCg0KV2hhdCBkbyB5b3UgdGhpbms/DQoNCg0KQ2hyaXMNCg0K
