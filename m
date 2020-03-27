Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4AC194F2B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2020 03:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgC0CmH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 22:42:07 -0400
Received: from mail-eopbgr1410105.outbound.protection.outlook.com ([40.107.141.105]:6209
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726496AbgC0CmH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 22:42:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLr2Tb4/udWXBAXQw3JYFL5l+oMCTKom5LIgHnRqCznBPQuPPF1UQEj/hB5qGTDoEFgylbWUVu0CW7zdZK3ynWaOTe6pfjL9U1NjJlbOTcmHbp+ahHDIDshonQMy6YzDr8itoCyZsfJEjiXvsMotczUt4xznrts+C2NhCRObBHfmO6Ni3jeL/fnVFU/AUy264szs8uVQTB+2A9bMoKQTeS9LFF3QbRMVrr4eDqGzIZqzmIse9qp2D582VXhE/h3zgTleP3cU9WT34n+QNOmCqCB7ralGnOV/ZkE4QYe71XNHNPLn1v4zgohOq0H3Dp0WmFkZnp6SGF3j7iiEmmMF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qngR+eHp383dc2gWSX0guNyR1Lll5ev4bvLQan94iko=;
 b=CBN42nLmaBCptTG1OW0RhzRz1DgH5nzXmGOq7f4zhdCBPtNsmItPhiXWuR1ygzcPuIsV+cvLZcz1FSbKrLUuEIYgykEmPqMNrHo402BFdUzNz1iX+AmZOdcXwVua/QT9SmihsnvDP8uHnMUheRzeXg2+QdoDFnrNMcoPXmED2XyW/2ImbWuQLYFYE0ASDtvKwg5xbuy6K53D3/USD3EoPOOV482XTf76MPw/5ce4TOBvdqjcmmLlreeo8jbMPPMCP/k/ocT4nHoxgR4bpKpXjnLZYUAaThA2MamLLqOs3k9BDFnBC+FLWKI284v14W+mRbzr6aBhEDnfn4nRuv0qwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qngR+eHp383dc2gWSX0guNyR1Lll5ev4bvLQan94iko=;
 b=dCMI9io6T680hnEVMhC8BVv9idSz2i7MdGCfVtgmi91JYV/06ydXmz1yiumnz8k3kqaWqCVuWcXwLZyBvkYus2n9Xz6gn+zgj0uGjRcv3WHdvUNou70AkQ/K7b8vAnH3i/a0QBRSiQv5cy8+qafWKA+sV4HVr0EbcCctrd/S46Y=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3501.jpnprd01.prod.outlook.com (20.178.137.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 02:42:03 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 02:42:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/4] dt-bindings: phy: renesas: usb2-phy: convert
 bindings to json-schema
Thread-Topic: [PATCH v2 1/4] dt-bindings: phy: renesas: usb2-phy: convert
 bindings to json-schema
Thread-Index: AQHWAy+F1mvYz+A33U2F91ptPg7QzKhak2+AgAEoRxA=
Date:   Fri, 27 Mar 2020 02:42:03 +0000
Message-ID: <TYAPR01MB454433CC3EEC24AF8619526FD8CC0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1585200559-30033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585200559-30033-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVuiAqqERf_ZEAqkhuTfOrn-VUj8rpuAHMwL=QdRNi3qg@mail.gmail.com>
In-Reply-To: <CAMuHMdVuiAqqERf_ZEAqkhuTfOrn-VUj8rpuAHMwL=QdRNi3qg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.148]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 11cb7050-c847-41c2-0ac9-08d7d1f86e90
x-ms-traffictypediagnostic: TYAPR01MB3501:
x-microsoft-antispam-prvs: <TYAPR01MB35016AA3339B26E7F4EA352BD8CC0@TYAPR01MB3501.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(71200400001)(81156014)(33656002)(86362001)(4326008)(478600001)(8676002)(6506007)(81166006)(8936002)(7696005)(316002)(5660300002)(186003)(2906002)(55016002)(66556008)(66476007)(76116006)(6916009)(66446008)(64756008)(66946007)(52536014)(54906003)(26005)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3501;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X7imYqSZUUQ68ZupRV3ca/mwhYkLG4LEVn7gbTSwNe0CezJAX6Ei0XtwTVsAWj8b/OVxXp/xmkEKA8Ufw0mC30t6Pwb3mvKrCc4XecVAOPV4usens6W2dDaJkuvIYP73qH8pt3uzUZyzpMpF8ynBviRzce/+z5g1QbxOz+JsohVCzQGu6hUrQIGAqa7m/TrQ1JnoidxdLJmRpDFpkNWebpyd5/N0CUtBOc7zMJLhHd1V5SzvJ8a11QSvRlyzC5aEb/xl7VC56Ylq02WweXO475GQRqY8FXF12iNYd9Dt1U+/lo7FKDmhtHITnwE1Rs9c5qeot6VH2mPIazMsdluio7Jpj+JhP6gpya6gp6qOKglWxfH7gL3usmdE0nEu33OzNc9+/W+QzWZwqxJckMC3xgVeGKCdiDY5AiNiHRz0jWVqIkvmY768vkUuJePj+60B
x-ms-exchange-antispam-messagedata: R9Q9Jsce/ztaUKUwg/UjRy5GzfF0B8ks5//oLGJ48DNl+RWu6Tmsu/vYVMjgSXEaghkKXhJ9eFjHmfbw7pb4YzkbFFxKLlNUSE5657biVeDUvYrKNxDanPRhX8/Xqj0ecxRrM8Uvo1EeGhvc/E9EuA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cb7050-c847-41c2-0ac9-08d7d1f86e90
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 02:42:03.2053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sgorXtZP1wcdKNp6bn33uAOjQp4F9tyk6IQ4ZwqM4fjvtU/A36gGnfe16/3dZyp57XNKGjxhoS3LhqImJHhzENL7uROPXrA3kNMeTPTk3TsuFDVFJL2XbVXSRSfuBpI9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3501
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNkYXksIE1hcmNoIDI2LCAyMDIwIDY6MDAgUE0N
CjxzbmlwPg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGh5L3JlbmVzYXMsdXNiMi1waHkueWFtbA0KPiA+IEBAIC0wLDAgKzEs
MTAzIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiAN
Cj4gSSB0aGluayBSb2Igd291bGQgcHJlZmVyIHRvIHNlZQ0KPiANCj4gICAgICMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KDQpJJ2xsIGZp
eCBpdC4NCg0KPiA+ICsgIHJlZzoNCj4gPiArICAgICMgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGgg
b2YgdGhlIHJlZ2lzdGVycyBibG9jayBmb3IgdGhlIFBIWS4NCj4gDQo+IFRoZSBjb21tZW50IGlz
IG5vdCBuZWVkZWQuDQoNCk9LLiBJJ2xsIHJlbW92ZSBpdC4NCg0KPiA+ICsgICAgbWF4SXRlbXM6
IDENCj4gPiArDQo+ID4gKyAgY2xvY2tzOg0KPiA+ICsgICAgIyBjbG9jayBwaGFuZGxlIGFuZCBz
cGVjaWZpZXIgcGFpcihzKS4NCj4gDQo+IExpa2V3aXNlLg0KDQpJIGdvdCBpdC4NCg0KPiA+ICsg
ICAgbWluSXRlbXM6IDENCj4gPiArICAgIG1heEl0ZW1zOiAyDQo+ID4gKw0KPiA+ICsgIGNsb2Nr
LW5hbWVzOg0KPiA+ICsgICAgIyBmb3IgUlovQTINCj4gDQo+IGlmOg0KPiAgIHByb3BlcnRpZXM6
DQo+ICAgICBjb21wYXRpYmxlOg0KPiAgICAgICBpdGVtczoNCj4gICAgICAgICBlbnVtOg0KPiAg
ICAgICAgICAgLSByZW5lc2FzLHVzYjItcGh5LXI3czkyMTANCg0KVGhhbmsgeW91IGZvciB0aGUg
cHJvcG9zYWwuIEknbGwgZml4IGl0Lg0KDQo+ID4gKyAgICBtaW5JdGVtczogMQ0KPiA+ICsgICAg
bWF4SXRlbXM6IDINCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBmY2sNCj4g
PiArICAgICAgLSBjb25zdDogdXNiX3gxDQo+IA0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwN
Cj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9yOGE3Nzk1LWNwZy1tc3NyLmg+
DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJt
LWdpYy5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL3I4YTc3OTUtc3lz
Yy5oPg0KPiA+ICsNCj4gPiArICAgIHVzYi1waHlAZWUwODAyMDAgew0KPiA+ICsgICAgICAgIGNv
bXBhdGlibGUgPSAicmVuZXNhcyx1c2IyLXBoeS1yOGE3Nzk1IiwgInJlbmVzYXMscmNhci1nZW4z
LXVzYjItcGh5IjsNCj4gPiArICAgICAgICByZWcgPSA8MCAweGVlMDgwMjAwIDAgMHg3MDA+Ow0K
PiANCj4gRXhhbXBsZXMgYXJlIGJ1aWx0IHdpdGggI3thZGRyZXNzLHNpemV9LWNlbGxzID0gPDE+
LCBzbw0KPiANCj4gICAgIHJlZyA9IDwweGVlMDgwMjAwIDB4NzAwPjsNCg0KSSBnb3QgaXQuIEkn
bGwgZml4IGl0Lg0KDQo+ID4gKyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDEwOCBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcw
Mz47DQo+ID4gKyAgICAgICAgI3BoeS1jZWxscyA9IDwxPjsNCj4gPiArICAgIH07DQo+ID4gKw0K
PiA+ICsgICAgdXNiLXBoeUBlZTBhMDIwMCB7DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJy
ZW5lc2FzLHVzYjItcGh5LXI4YTc3OTUiLCAicmVuZXNhcyxyY2FyLWdlbjMtdXNiMi1waHkiOw0K
PiA+ICsgICAgICAgIHJlZyA9IDwwIDB4ZWUwYTAyMDAgMCAweDcwMD47DQo+IA0KPiByZWcgPSA8
MHhlZTBhMDIwMCAweDcwMD47DQoNClllcywgSSdsbCBmaXggaXQuDQoNCkJlc3QgcmVnYXJkcywN
Cllvc2hpaGlybyBTaGltb2RhDQoNCg==
